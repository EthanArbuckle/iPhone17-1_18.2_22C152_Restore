@interface AVBorealisServer
- (AVBorealisServer)init;
- (BOOL)hardwareSupportsVoiceTrigger;
- (BOOL)heySiriEnabled;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (Class)clsVTStateManager;
- (NSMutableArray)clientConnections;
- (NSXPCListener)serverListener;
- (OS_dispatch_queue)notificationQueue;
- (VTStateManager)vtStateManager;
- (void)activateSecureSession:(BOOL)a3 reply:(id)a4;
- (void)afSiriActivationBuiltInMicVoiceFuncPtr;
- (void)dealloc;
- (void)enableBargeInMode:(BOOL)a3 reply:(id)a4;
- (void)enableListeningOnPorts:(id)a3 reply:(id)a4;
- (void)enableSpeakerStateListening:(BOOL)a3 reply:(id)a4;
- (void)enableVoiceTriggerListening:(BOOL)a3 reply:(id)a4;
- (void)getInputChannelInfoCompletion:(id)a3;
- (void)initializeWithReply:(id)a3;
- (void)listeningEnabledReply:(id)a3;
- (void)mobileAssistantDylib;
- (void)portsActiveReply:(id)a3;
- (void)sendActiveStateChangedNotificationForPort:(unint64_t)a3 isActive:(BOOL)a4;
- (void)sendSpeakerMuteStateChangedNotification:(BOOL)a3;
- (void)sendVoiceTriggerOccuredNotification:(id)a3 triggerTime:(unint64_t)a4;
- (void)setAfSiriActivationBuiltInMicVoiceFuncPtr:(void *)a3;
- (void)setAggressiveECMode:(BOOL)a3 reply:(id)a4;
- (void)setClientConnections:(id)a3;
- (void)setClsVTStateManager:(Class)a3;
- (void)setListeningProperty:(BOOL)a3 reply:(id)a4;
- (void)setMobileAssistantDylib:(void *)a3;
- (void)setNotificationQueue:(id)a3;
- (void)setServerListener:(id)a3;
- (void)setVoiceTriggerDylib:(void *)a3;
- (void)setVtStateManager:(id)a3;
- (void)siriClientRecordStateChanged:(BOOL)a3;
- (void)siriClientsRecordingReply:(id)a3;
- (void)speakerStateActiveReply:(id)a3;
- (void)speakerStateMutedReply:(id)a3;
- (void)speechDetectionVADCreated;
- (void)updateVoiceTriggerConfiguration:(id)a3 reply:(id)a4;
- (void)voiceTriggerDylib;
- (void)voiceTriggerPastDataFramesAvailable:(id)a3;
@end

@implementation AVBorealisServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vtStateManager, 0);
  objc_storeStrong((id *)&self->_clsVTStateManager, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_clientConnections, 0);

  objc_storeStrong((id *)&self->_serverListener, 0);
}

- (void)setVtStateManager:(id)a3
{
}

- (VTStateManager)vtStateManager
{
  return self->_vtStateManager;
}

- (void)setClsVTStateManager:(Class)a3
{
}

- (Class)clsVTStateManager
{
  return self->_clsVTStateManager;
}

- (void)setVoiceTriggerDylib:(void *)a3
{
  self->_voiceTriggerDylib = a3;
}

- (void)voiceTriggerDylib
{
  return self->_voiceTriggerDylib;
}

- (void)setAfSiriActivationBuiltInMicVoiceFuncPtr:(void *)a3
{
  self->_afSiriActivationBuiltInMicVoiceFuncPtr = a3;
}

- (void)afSiriActivationBuiltInMicVoiceFuncPtr
{
  return self->_afSiriActivationBuiltInMicVoiceFuncPtr;
}

- (void)setMobileAssistantDylib:(void *)a3
{
  self->_mobileAssistantDylib = a3;
}

- (void)mobileAssistantDylib
{
  return self->_mobileAssistantDylib;
}

- (void)setNotificationQueue:(id)a3
{
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setClientConnections:(id)a3
{
}

- (NSMutableArray)clientConnections
{
  return self->_clientConnections;
}

- (void)setServerListener:(id)a3
{
}

- (NSXPCListener)serverListener
{
  return self->_serverListener;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v28 = "AVBorealisServer.mm";
    __int16 v29 = 1024;
    int v30 = 2251;
    __int16 v31 = 2112;
    id v32 = v7;
    __int16 v33 = 1024;
    int v34 = [v7 processIdentifier];
    _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%25s:%-5d newConnection: %@ from PID: %d", buf, 0x22u);
  }
  v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF7423E8];
  [v7 setExportedInterface:v8];

  [v7 setExportedObject:self];
  v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF7479D0];
  [v7 setRemoteObjectInterface:v9];

  objc_initWeak(&location, self);
  objc_initWeak(&from, v7);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __55__AVBorealisServer_listener_shouldAcceptNewConnection___block_invoke;
  v22[3] = &unk_1E5B13CE8;
  objc_copyWeak(&v23, &from);
  objc_copyWeak(&v24, &location);
  [v7 setInterruptionHandler:v22];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __55__AVBorealisServer_listener_shouldAcceptNewConnection___block_invoke_2;
  v19[3] = &unk_1E5B13CE8;
  objc_copyWeak(&v20, &from);
  objc_copyWeak(&v21, &location);
  [v7 setInvalidationHandler:v19];
  notificationQueue = self->_notificationQueue;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __55__AVBorealisServer_listener_shouldAcceptNewConnection___block_invoke_2_171;
  v16 = &unk_1E5B13CC0;
  id v11 = v7;
  id v17 = v11;
  v18 = self;
  dispatch_async(notificationQueue, &v13);
  objc_msgSend(v11, "resume", v13, v14, v15, v16);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "AVBorealisServer.mm";
    __int16 v29 = 1024;
    int v30 = 2304;
    _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%25s:%-5d Done", buf, 0x12u);
  }

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return 1;
}

void __55__AVBorealisServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v2 = objc_loadWeakRetained((id *)(a1 + 32));
    *(_DWORD *)buf = 136315906;
    id v11 = "AVBorealisServer.mm";
    __int16 v12 = 1024;
    int v13 = 2263;
    __int16 v14 = 2112;
    id v15 = v2;
    __int16 v16 = 1024;
    int v17 = [v2 processIdentifier];
    _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%25s:%-5d Interruption Handler: %@, client PID: %d)", buf, 0x22u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = v4;
  if (WeakRetained && v4)
  {
    id v6 = [WeakRetained notificationQueue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55__AVBorealisServer_listener_shouldAcceptNewConnection___block_invoke_169;
    v7[3] = &unk_1E5B13CC0;
    id v8 = v5;
    id v9 = WeakRetained;
    dispatch_async(v6, v7);
  }
}

void __55__AVBorealisServer_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v2 = objc_loadWeakRetained((id *)(a1 + 32));
    *(_DWORD *)buf = 136315906;
    uint64_t v18 = "AVBorealisServer.mm";
    __int16 v19 = 1024;
    int v20 = 2274;
    __int16 v21 = 2112;
    id v22 = v2;
    __int16 v23 = 1024;
    int v24 = [v2 processIdentifier];
    _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%25s:%-5d Invalidation Handler: %@, client PID: %d exited", buf, 0x22u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = (id *)(a1 + 32);
  id v5 = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained[1];
  id v7 = *(id *)(v6 + 72);
  id v8 = v7;
  if (v7)
  {
    int v9 = [v7 processIdentifier];
    id v10 = objc_loadWeakRetained(v4);
    BOOL v11 = v9 == [v10 processIdentifier];

    if (v11)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        id v12 = objc_loadWeakRetained(v4);
        int v13 = [v12 processIdentifier];
        *(_DWORD *)buf = 136315650;
        uint64_t v18 = "AVBorealisServer.mm";
        __int16 v19 = 1024;
        int v20 = 2280;
        __int16 v21 = 1024;
        LODWORD(v22) = v13;
        _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%25s:%-5d Disabling Barge-In since PID: %d exited.", buf, 0x18u);
      }
      BorealisServerImpl::enableBargeInMode(v6, 0, 0);
    }
  }
  if (v5)
  {
    __int16 v14 = [WeakRetained notificationQueue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __55__AVBorealisServer_listener_shouldAcceptNewConnection___block_invoke_170;
    v15[3] = &unk_1E5B13CC0;
    v15[4] = WeakRetained;
    id v16 = v5;
    dispatch_async(v14, v15);
  }
}

void __55__AVBorealisServer_listener_shouldAcceptNewConnection___block_invoke_2_171(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v2 = [*(id *)(a1 + 32) processIdentifier];
    *(_DWORD *)buf = 136315650;
    id v16 = "AVBorealisServer.mm";
    __int16 v17 = 1024;
    int v18 = 2293;
    __int16 v19 = 1024;
    int v20 = v2;
    _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%25s:%-5d Adding connection for client PID (%d)", buf, 0x18u);
  }
  v3 = [*(id *)(a1 + 40) clientConnections];
  [v3 addObject:*(void *)(a1 + 32)];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v16 = "AVBorealisServer.mm";
    __int16 v17 = 1024;
    int v18 = 2296;
    _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%25s:%-5d Client connections dump:", buf, 0x12u);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [*(id *)(a1 + 40) clientConnections];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    id v7 = MEMORY[0x1E4F14500];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          int v10 = [v9 processIdentifier];
          *(_DWORD *)buf = 136315906;
          id v16 = "AVBorealisServer.mm";
          __int16 v17 = 1024;
          int v18 = 2298;
          __int16 v19 = 1024;
          int v20 = v10;
          __int16 v21 = 2112;
          id v22 = v9;
          _os_log_impl(&dword_1A3931000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d \tFor client PID (%d): %@", buf, 0x22u);
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v23 count:16];
    }
    while (v5);
  }
}

void __55__AVBorealisServer_listener_shouldAcceptNewConnection___block_invoke_170(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) clientConnections];
  [v2 removeObject:*(void *)(a1 + 40)];
}

void __55__AVBorealisServer_listener_shouldAcceptNewConnection___block_invoke_169(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  id v2 = [*(id *)(a1 + 40) clientConnections];
  [v2 removeObject:*(void *)(a1 + 32)];
}

- (BOOL)hardwareSupportsVoiceTrigger
{
  return self->serverImpl->var10;
}

- (void)siriClientRecordStateChanged:(BOOL)a3
{
  uint64_t v5 = [(AVBorealisServer *)self notificationQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__AVBorealisServer_siriClientRecordStateChanged___block_invoke;
  v6[3] = &unk_1E5B13C98;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

void __49__AVBorealisServer_siriClientRecordStateChanged___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  int v3 = *(_DWORD *)(v2 + 116);
  if (*(unsigned char *)(a1 + 40))
  {
    unsigned int v4 = v3 + 1;
LABEL_5:
    *(_DWORD *)(v2 + 116) = v4;
    goto LABEL_6;
  }
  if (v3)
  {
    unsigned int v4 = v3 - 1;
    goto LABEL_5;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "AVBorealisServer.mm";
    __int16 v28 = 1024;
    int v29 = 1585;
    _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d mNumRecordingSiriClients trying to go negative", buf, 0x12u);
    unsigned int v4 = *(_DWORD *)(v2 + 116);
  }
  else
  {
    unsigned int v4 = 0;
  }
LABEL_6:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v27 = "AVBorealisServer.mm";
    __int16 v28 = 1024;
    int v29 = 1588;
    __int16 v30 = 1024;
    BOOL v31 = v4;
    _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%25s:%-5d recording siri clients %d", buf, 0x18u);
    unsigned int v4 = *(_DWORD *)(v2 + 116);
  }
  unsigned int v5 = v4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v27 = "AVBorealisServer.mm";
    __int16 v28 = 1024;
    int v29 = 1566;
    __int16 v30 = 1024;
    BOOL v31 = v4 != 0;
    _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%25s:%-5d %d", buf, 0x18u);
    unsigned int v5 = *(_DWORD *)(v2 + 116);
  }
  *(unsigned char *)(v2 + 64) = v4 != 0;
  uint64_t v6 = [*(id *)(a1 + 32) clientConnections];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v8 = [*(id *)(a1 + 32) clientConnections];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      uint64_t v11 = v5;
      uint64_t v12 = *(void *)v22;
      long long v13 = MEMORY[0x1E4F14500];
      *(void *)&long long v10 = 136315650;
      long long v20 = v10;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v8);
          }
          id v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          id v16 = objc_msgSend(v15, "remoteObjectProxy", v20);
          BOOL v17 = v16 == 0;

          if (v17)
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              int v19 = [v15 processIdentifier];
              *(_DWORD *)buf = v20;
              v27 = "AVBorealisServer.mm";
              __int16 v28 = 1024;
              int v29 = 2232;
              __int16 v30 = 1024;
              BOOL v31 = v19;
              _os_log_impl(&dword_1A3931000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d remoteObjectProxy is nil for client PID (%d)", buf, 0x18u);
            }
          }
          else
          {
            int v18 = [v15 remoteObjectProxy];
            [v18 siriClientRecordStateChangedNotification:*(unsigned __int8 *)(a1 + 40) recordingCount:v11];
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "AVBorealisServer.mm";
    __int16 v28 = 1024;
    int v29 = 2236;
    _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d No clients connected", buf, 0x12u);
  }
}

- (void)speechDetectionVADCreated
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  serverImpl = self->serverImpl;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315394;
    unsigned int v4 = "AVBorealisServer.mm";
    __int16 v5 = 1024;
    int v6 = 1550;
    _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%25s:%-5d speechDetectionVADCreated()", (uint8_t *)&v3, 0x12u);
  }
  os_unfair_recursive_lock_lock_with_options();
  if (serverImpl->var10 && serverImpl->var12 && serverImpl->var11)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 136315394;
      unsigned int v4 = "AVBorealisServer.mm";
      __int16 v5 = 1024;
      int v6 = 1557;
      _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%25s:%-5d attempt to force enable AOP voice trigger", (uint8_t *)&v3, 0x12u);
    }
    BorealisServerImpl::enableVoiceTriggerListening((uint64_t)serverImpl, 1, 1, &__block_literal_global_359);
    notify_post("com.apple.coreaudio.speechDetectionVAD.created");
  }
  os_unfair_recursive_lock_unlock();
}

- (BOOL)heySiriEnabled
{
  serverImpl = self->serverImpl;
  os_unfair_recursive_lock_lock_with_options();
  BOOL v3 = serverImpl->var12 && serverImpl->var11;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)sendSpeakerMuteStateChangedNotification:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v25 = "AVBorealisServer.mm";
    __int16 v26 = 1024;
    int v27 = 2195;
    __int16 v28 = 1024;
    BOOL v29 = v3;
    _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%25s:%-5d sending speaker mute state changed notification. isMuted: %d", buf, 0x18u);
  }
  __int16 v5 = [(AVBorealisServer *)self clientConnections];
  BOOL v6 = [v5 count] == 0;

  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v25 = "AVBorealisServer.mm";
      __int16 v26 = 1024;
      int v27 = 2207;
      _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d No clients connected", buf, 0x12u);
    }
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v7 = [(AVBorealisServer *)self clientConnections];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v10 = *(void *)v20;
      uint64_t v11 = MEMORY[0x1E4F14500];
      *(void *)&long long v9 = 136315650;
      long long v18 = v9;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          long long v14 = objc_msgSend(v13, "remoteObjectProxy", v18);
          BOOL v15 = v14 == 0;

          if (v15)
          {
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              int v17 = [v13 processIdentifier];
              *(_DWORD *)buf = v18;
              uint64_t v25 = "AVBorealisServer.mm";
              __int16 v26 = 1024;
              int v27 = 2203;
              __int16 v28 = 1024;
              BOOL v29 = v17;
              _os_log_impl(&dword_1A3931000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d remoteObjectProxy is nil for client PID (%d)", buf, 0x18u);
            }
          }
          else
          {
            id v16 = [v13 remoteObjectProxy];
            [v16 speakerMuteStateChangedNotification:v3];
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v8);
    }
  }
}

- (void)sendActiveStateChangedNotificationForPort:(unint64_t)a3 isActive:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = BorealisServerImpl::getCachedPortStateInfo(self->serverImpl);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316162;
    BOOL v31 = "AVBorealisServer.mm";
    __int16 v32 = 1024;
    int v33 = 2169;
    __int16 v34 = 2048;
    uint64_t v35 = v7;
    __int16 v36 = 2048;
    uint64_t v37 = 8;
    __int16 v38 = 2112;
    v39 = v7;
    _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%25s:%-5d cached port info %p count: %lu %@", buf, 0x30u);
  }
  uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
  long long v9 = [NSNumber numberWithBool:v4];
  uint64_t v10 = [NSNumber numberWithUnsignedInteger:a3];
  long long v24 = objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", v9, @"active", v10, @"currentPort", 0);

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    BOOL v31 = "AVBorealisServer.mm";
    __int16 v32 = 1024;
    int v33 = 2172;
    __int16 v34 = 2048;
    uint64_t v35 = v24;
    __int16 v36 = 2112;
    uint64_t v37 = (uint64_t)v24;
    _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%25s:%-5d sending speaker state changed notification with dictionary (%p) %@", buf, 0x26u);
  }
  uint64_t v11 = [(AVBorealisServer *)self clientConnections];
  BOOL v12 = [v11 count] == 0;

  if (v12)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      BOOL v31 = "AVBorealisServer.mm";
      __int16 v32 = 1024;
      int v33 = 2189;
      _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d No clients connected", buf, 0x12u);
    }
  }
  else
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v13 = [(AVBorealisServer *)self clientConnections];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v26;
      id v16 = MEMORY[0x1E4F14500];
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v13);
          }
          long long v18 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          long long v19 = [v18 remoteObjectProxy];
          BOOL v20 = v19 == 0;

          if (v20)
          {
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              int v23 = [v18 processIdentifier];
              *(_DWORD *)buf = 136315650;
              BOOL v31 = "AVBorealisServer.mm";
              __int16 v32 = 1024;
              int v33 = 2185;
              __int16 v34 = 1024;
              LODWORD(v35) = v23;
              _os_log_impl(&dword_1A3931000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d remoteObjectProxy is nil for client PID (%d)", buf, 0x18u);
            }
          }
          else
          {
            if (a3 == 1)
            {
              long long v21 = [v18 remoteObjectProxy];
              [v21 speakerStateChangedNotification:v24];
            }
            long long v22 = [v18 remoteObjectProxy];
            [v22 portStateChangedNotification:v7];
          }
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v14);
    }
  }
}

- (void)sendVoiceTriggerOccuredNotification:(id)a3 triggerTime:(unint64_t)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v32 = "AVBorealisServer.mm";
    __int16 v33 = 1024;
    int v34 = 2132;
    __int16 v35 = 2112;
    id v36 = v6;
    _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%25s:%-5d sending voice trigger notification with trigger dictionary %@", buf, 0x1Cu);
  }
  afSiriActivationBuiltInMicVoiceFuncPtr = (void (*)(unint64_t, id, void *))self->_afSiriActivationBuiltInMicVoiceFuncPtr;
  if (afSiriActivationBuiltInMicVoiceFuncPtr)
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __68__AVBorealisServer_sendVoiceTriggerOccuredNotification_triggerTime___block_invoke;
    v27[3] = &unk_1E5B13C70;
    id v28 = v6;
    unint64_t v29 = a4;
    afSiriActivationBuiltInMicVoiceFuncPtr(a4, v28, v27);
  }
  uint64_t v8 = [(AVBorealisServer *)self clientConnections];
  BOOL v9 = [v8 count] == 0;

  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v32 = "AVBorealisServer.mm";
      __int16 v33 = 1024;
      int v34 = 2162;
      _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d No clients connected", buf, 0x12u);
    }
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v10 = [(AVBorealisServer *)self clientConnections];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v30 count:16];
    if (v11)
    {
      uint64_t v13 = *(void *)v24;
      uint64_t v14 = MEMORY[0x1E4F14500];
      *(void *)&long long v12 = 136315650;
      long long v22 = v12;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          id v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          int v17 = objc_msgSend(v16, "remoteObjectProxy", v22);
          BOOL v18 = v17 == 0;

          if (v18)
          {
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              int v21 = [v16 processIdentifier];
              *(_DWORD *)buf = v22;
              __int16 v32 = "AVBorealisServer.mm";
              __int16 v33 = 1024;
              int v34 = 2157;
              __int16 v35 = 1024;
              LODWORD(v36) = v21;
              _os_log_impl(&dword_1A3931000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d remoteObjectProxy is nil for client PID (%d)", buf, 0x18u);
            }
          }
          else
          {
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              int v19 = [v16 processIdentifier];
              *(_DWORD *)buf = v22;
              __int16 v32 = "AVBorealisServer.mm";
              __int16 v33 = 1024;
              int v34 = 2153;
              __int16 v35 = 1024;
              LODWORD(v36) = v19;
              _os_log_impl(&dword_1A3931000, v14, OS_LOG_TYPE_DEFAULT, "%25s:%-5d sendVoiceTriggerOccuredNotification for client PID (%d)", buf, 0x18u);
            }
            BOOL v20 = [v16 remoteObjectProxy];
            [v20 voiceTriggerNotification:v6];
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v30 count:16];
      }
      while (v11);
    }
  }
}

void __68__AVBorealisServer_sendVoiceTriggerOccuredNotification_triggerTime___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v12 = 136316162;
      uint64_t v13 = "AVBorealisServer.mm";
      __int16 v14 = 1024;
      int v15 = 2140;
      __int16 v16 = 1024;
      *(_DWORD *)int v17 = a2;
      *(_WORD *)&v17[4] = 2112;
      *(void *)&v17[6] = v5;
      __int16 v18 = 2112;
      uint64_t v19 = v11;
      uint64_t v7 = MEMORY[0x1E4F14500];
      uint64_t v8 = "%25s:%-5d failed to send voicetrigger MAF. success(%d), err(%@). %@";
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
      uint32_t v10 = 44;
      goto LABEL_7;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    int v12 = 136315650;
    uint64_t v13 = "AVBorealisServer.mm";
    __int16 v14 = 1024;
    int v15 = 2143;
    __int16 v16 = 2048;
    *(void *)int v17 = v6;
    uint64_t v7 = MEMORY[0x1E4F14500];
    uint64_t v8 = "%25s:%-5d voicetrigger sent to MAF. triggerTime(%lld)";
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    uint32_t v10 = 28;
LABEL_7:
    _os_log_impl(&dword_1A3931000, v7, v9, v8, (uint8_t *)&v12, v10);
  }
}

- (void)activateSecureSession:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v11 = 136315650;
    *(void *)&v11[4] = "AVBorealisServer.mm";
    *(_WORD *)&v11[12] = 1024;
    *(_DWORD *)&v11[14] = 2126;
    *(_WORD *)&v11[18] = 1024;
    *(_DWORD *)&v11[20] = v4;
    _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%25s:%-5d activateSecureSession: %d", v11, 0x18u);
  }
  serverImpl = self->serverImpl;
  id v8 = v6;
  if (isHACProduct(0))
  {
    os_log_type_t v9 = [serverImpl->var14 notificationQueue];
    *(void *)uint64_t v11 = MEMORY[0x1E4F143A8];
    *(void *)&v11[8] = 3221225472;
    *(void *)&v11[16] = ___ZN18BorealisServerImpl21activateSecureSessionEbU13block_pointerFvP7NSErrorE_block_invoke;
    int v12 = &unk_1E5B13DF0;
    __int16 v14 = serverImpl;
    BOOL v15 = v4;
    id v13 = v8;
    dispatch_async(v9, v11);

    uint32_t v10 = v13;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v11 = 136315394;
      *(void *)&v11[4] = "AVBorealisServer.mm";
      *(_WORD *)&v11[12] = 1024;
      *(_DWORD *)&v11[14] = 1672;
      _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d Session activation/deactivation unsupported", v11, 0x12u);
    }
    uint32_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:1852797029 userInfo:0];
    (*((void (**)(id, void *))v8 + 2))(v8, v10);
  }
}

- (void)setAggressiveECMode:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void *))a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v32 = "AVBorealisServer.mm";
    __int16 v33 = 1024;
    int v34 = 2115;
    __int16 v35 = 1024;
    LODWORD(p_inAddress) = v4;
    _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%25s:%-5d setAggressiveECMode: %d", buf, 0x18u);
  }
  if (isHACProduct(0))
  {
    int outData = 0;
    __int32 inQualifierData = 1936290409;
    UInt32 ioDataSize = 4;
    p_AudioObjectID inObjectID = *(AudioObjectID **)"diuibolg";
    LODWORD(v22) = 0;
    OSStatus PropertyData = AudioObjectGetPropertyData(1u, (const AudioObjectPropertyAddress *)&p_inObjectID, 4u, &inQualifierData, &ioDataSize, &outData);
    v8.i32[0] = inQualifierData;
    int16x8_t v9 = (int16x8_t)vmovl_u8(v8);
    *(int16x4_t *)v9.i8 = vrev64_s16(*(int16x4_t *)v9.i8);
    inAddress.mSelector = vmovn_s16(v9).u32[0];
    LOBYTE(inAddress.mScope) = 0;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      __int16 v32 = "AVBorealisServer.mm";
      __int16 v33 = 1024;
      int v34 = 1809;
      __int16 v35 = 2080;
      p_AudioObjectPropertyAddress inAddress = &inAddress;
      __int16 v37 = 1024;
      AudioObjectID v38 = outData;
      _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%25s:%-5d useCaseID: %s, deviceID: %d", buf, 0x22u);
    }
    if (PropertyData)
    {
      LOBYTE(v25.mSelector) = HIBYTE(PropertyData);
      BYTE1(v25.mSelector) = BYTE2(PropertyData);
      BYTE2(v25.mSelector) = BYTE1(PropertyData);
      HIBYTE(v25.mSelector) = PropertyData;
      LOBYTE(v25.mScope) = 0;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v32 = "AVBorealisServer.mm";
        __int16 v33 = 1024;
        int v34 = 1813;
        __int16 v35 = 2080;
        p_AudioObjectPropertyAddress inAddress = &v25;
        _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d Could not get deviceID error: %s ", buf, 0x1Cu);
      }
    }
    AudioObjectID SpeechDetectionDeviceID = outData;
  }
  else
  {
    AudioObjectID SpeechDetectionDeviceID = BorealisServerImpl::GetSpeechDetectionDeviceID(0, 0, v6);
  }
  AudioObjectID inObjectID = SpeechDetectionDeviceID;
  if (SpeechDetectionDeviceID)
  {
    os_unfair_recursive_lock_lock_with_options();
    *(void *)&inAddress.mSelector = 0x696E70746467706DLL;
    inAddress.mElement = 0;
    *(void *)&v25.mSelector = 0x696E70746467686DLL;
    v25.mElement = 0;
    int outData = 1987339878;
    p_AudioObjectID inObjectID = &inObjectID;
    long long v22 = &inAddress;
    long long v23 = &v25;
    int v24 = 1987339878;
    if (AudioObjectHasProperty(SpeechDetectionDeviceID, &inAddress)
      && AudioObjectHasProperty(inObjectID, &v25)
      && (__int32 inQualifierData = 0,
          *(_DWORD *)buf = 4,
          !AudioObjectGetPropertyData(inObjectID, &v25, 4u, &v24, (UInt32 *)buf, &inQualifierData))
      && inQualifierData)
    {
      float v11 = 0.0;
      if (v4) {
        float v11 = 1.0;
      }
      __int32 inQualifierData = LODWORD(v11);
      OSStatus v12 = AudioObjectSetPropertyData(inObjectID, &inAddress, 4u, &outData, 4u, &inQualifierData);
      if (!v12)
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_26;
        }
        uint64_t v20 = "Disable";
        __int16 v32 = "AVBorealisServer.mm";
        *(_DWORD *)buf = 136315906;
        __int16 v33 = 1024;
        if (v4) {
          uint64_t v20 = "Enable";
        }
        int v34 = 1632;
        __int16 v35 = 2080;
        p_AudioObjectPropertyAddress inAddress = (AudioObjectPropertyAddress *)v20;
        __int16 v37 = 1024;
        AudioObjectID v38 = inObjectID;
        __int16 v14 = MEMORY[0x1E4F14500];
        BOOL v15 = "%25s:%-5d setAggressiveECMode (%s) on device %d";
        os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
        uint32_t v17 = 34;
        goto LABEL_25;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v13 = "Disable";
        __int16 v32 = "AVBorealisServer.mm";
        *(_DWORD *)buf = 136316162;
        __int16 v33 = 1024;
        if (v4) {
          id v13 = "Enable";
        }
        int v34 = 1635;
        __int16 v35 = 2080;
        p_AudioObjectPropertyAddress inAddress = (AudioObjectPropertyAddress *)v13;
        __int16 v37 = 1024;
        AudioObjectID v38 = inObjectID;
        __int16 v39 = 1024;
        OSStatus v40 = v12;
        __int16 v14 = MEMORY[0x1E4F14500];
        BOOL v15 = "%25s:%-5d setAggressiveECMode failure to %s listening property on device %d [err2 (%d)]";
        os_log_type_t v16 = OS_LOG_TYPE_ERROR;
        uint32_t v17 = 40;
        goto LABEL_25;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v32 = "AVBorealisServer.mm";
      __int16 v33 = 1024;
      int v34 = 1639;
      __int16 v35 = 1024;
      LODWORD(p_inAddress) = inObjectID;
      __int16 v14 = MEMORY[0x1E4F14500];
      BOOL v15 = "%25s:%-5d setAggressiveECMode device(%d) doesn't have property.";
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      uint32_t v17 = 24;
LABEL_25:
      _os_log_impl(&dword_1A3931000, v14, v16, v15, buf, v17);
    }
LABEL_26:
    os_unfair_recursive_lock_unlock();
    __int16 v18 = 0;
    goto LABEL_32;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v19 = "Disabling";
    __int16 v32 = "AVBorealisServer.mm";
    *(_DWORD *)buf = 136315650;
    if (v4) {
      uint64_t v19 = "Enabling";
    }
    __int16 v33 = 1024;
    int v34 = 1643;
    __int16 v35 = 2080;
    p_AudioObjectPropertyAddress inAddress = (AudioObjectPropertyAddress *)v19;
    _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d %s setAggressiveECMode - No valid audio device found", buf, 0x1Cu);
  }
  __int16 v18 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:560227702 userInfo:0];
LABEL_32:
  v5[2](v5, v18);
}

- (void)siriClientsRecordingReply:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)int16x8_t v9 = 136315394;
    *(void *)&v9[4] = "AVBorealisServer.mm";
    *(_WORD *)&v9[12] = 1024;
    *(_DWORD *)&v9[14] = 2109;
    _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%25s:%-5d siriClientsRecording", v9, 0x12u);
  }
  serverImpl = self->serverImpl;
  id v6 = v4;
  uint64_t v7 = [serverImpl->var14 notificationQueue];
  *(void *)int16x8_t v9 = MEMORY[0x1E4F143A8];
  *(void *)&v9[8] = 3221225472;
  *(void *)&v9[16] = ___ZN18BorealisServerImpl25siriClientsRecordingReplyEU13block_pointerFvmP7NSErrorE_block_invoke;
  uint32_t v10 = &unk_1E5B146E8;
  id v11 = v6;
  OSStatus v12 = serverImpl;
  id v8 = v6;
  dispatch_async(v7, v9);
}

- (void)listeningEnabledReply:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "AVBorealisServer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2103;
    _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%25s:%-5d listeningEnabled", buf, 0x12u);
  }
  serverImpl = self->serverImpl;
  id v6 = v4;
  int outData = 0;
  AudioObjectID SpeechDetectionDeviceID = BorealisServerImpl::GetSpeechDetectionDeviceID(1, 0, v7);
  if (SpeechDetectionDeviceID)
  {
    os_unfair_recursive_lock_lock_with_options();
    strcpy(buf, "lepdbolg");
    buf[9] = 0;
    *(_WORD *)&buf[10] = 0;
    if (AudioObjectHasProperty(SpeechDetectionDeviceID, (const AudioObjectPropertyAddress *)buf))
    {
      strcpy(buf, "lepdbolg");
      buf[9] = 0;
      *(_WORD *)&buf[10] = 0;
      ioDataSize[0] = 4;
      OSStatus PropertyData = AudioObjectGetPropertyData(SpeechDetectionDeviceID, (const AudioObjectPropertyAddress *)buf, 0, 0, ioDataSize, &outData);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "AVBorealisServer.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 1224;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = outData;
        _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%25s:%-5d listeningEnabled : %u", buf, 0x18u);
      }
      if (!PropertyData || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        goto LABEL_15;
      }
      CAX4CCString::CAX4CCString((CAX4CCString *)ioDataSize, PropertyData);
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "AVBorealisServer.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1226;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = ioDataSize;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = SpeechDetectionDeviceID;
      uint32_t v10 = MEMORY[0x1E4F14500];
      id v11 = "%25s:%-5d Error %s querying listeningEnabled on device 0x%x";
      uint32_t v12 = 34;
    }
    else
    {
      OSStatus PropertyData = 2003332927;
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
LABEL_15:
        os_unfair_recursive_lock_unlock();
        goto LABEL_16;
      }
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "AVBorealisServer.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1230;
      uint32_t v10 = MEMORY[0x1E4F14500];
      id v11 = "%25s:%-5d Property not supported";
      uint32_t v12 = 18;
    }
    _os_log_impl(&dword_1A3931000, v10, OS_LOG_TYPE_ERROR, v11, buf, v12);
    goto LABEL_15;
  }
  OSStatus PropertyData = 560227702;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "AVBorealisServer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1235;
    _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d speech detection device not found!", buf, 0x12u);
  }
LABEL_16:
  uint64_t v13 = [serverImpl->var14 notificationQueue];
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = ___ZN18BorealisServerImpl21listeningEnabledReplyEU13block_pointerFvbP7NSErrorE_block_invoke;
  *(void *)&buf[24] = &unk_1E5B146E8;
  *(void *)&buf[32] = v6;
  int v17 = outData;
  OSStatus v18 = PropertyData;
  id v14 = v6;
  dispatch_async(v13, buf);
}

- (void)getInputChannelInfoCompletion:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void (**)(id, void *, void *))a3;
  unsigned int v22 = 0;
  if ((MGGetBoolAnswer() & 1) == 0)
  {
    uint64_t v6 = 0;
    uint64_t v10 = 0;
    int v17 = 0;
    uint64_t v8 = 1;
    goto LABEL_19;
  }
  AudioObjectID SpeechDetectionDeviceID = BorealisServerImpl::GetSpeechDetectionDeviceID(0, &v22, v4);
  uint64_t v6 = 0;
  signed int v7 = v22;
  uint64_t v8 = 1;
  if (v22)
  {
    uint64_t v10 = 0;
  }
  else
  {
    AudioObjectID v9 = SpeechDetectionDeviceID;
    uint64_t v10 = 0;
    if (SpeechDetectionDeviceID)
    {
      os_unfair_recursive_lock_lock_with_options();
      *(void *)&inAddress.mSelector = 0x676C6F6273647370;
      inAddress.mElement = 0;
      if (AudioObjectHasProperty(v9, &inAddress))
      {
        id v11 = BorealisServerImpl::getDictionaryForPropertySelector(0x73647370u, 0, &v22);
        uint32_t v12 = v11;
        unsigned int v13 = v22;
        if (v22 || !v11)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            CAX4CCString::CAX4CCString((CAX4CCString *)v25, v13);
            inAddress.mSelector = 136316162;
            *(void *)&inAddress.mScope = "AVBorealisServer.mm";
            __int16 v27 = 1024;
            int v28 = 1519;
            __int16 v29 = 2080;
            uint64_t v30 = v25;
            __int16 v31 = 1024;
            AudioObjectID v32 = v9;
            __int16 v33 = 2112;
            int v34 = v12;
            _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d Error %s fetching barge-in param dict on device 0x%x. Dict(%@)", (uint8_t *)&inAddress, 0x2Cu);
            uint64_t v6 = 0;
            uint64_t v10 = 0;
            uint64_t v8 = 1;
          }
          else
          {
            uint64_t v6 = 0;
            uint64_t v10 = 0;
          }
        }
        else
        {
          id v14 = [v11 objectForKeyedSubscript:@"DSP channels"];
          uint64_t v6 = [v14 unsignedIntValue];

          BOOL v15 = [v12 objectForKeyedSubscript:@"mics"];
          uint64_t v8 = [v15 unsignedIntValue];

          os_log_type_t v16 = [v12 objectForKeyedSubscript:@"refs"];
          uint64_t v10 = [v16 unsignedIntValue];
        }
      }
      else
      {
        uint64_t v6 = 0;
        uint64_t v10 = 0;
      }
      os_unfair_recursive_lock_unlock();
      signed int v7 = v22;
      if (!v22) {
        goto LABEL_18;
      }
LABEL_11:
      int v17 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v7 userInfo:0];
      goto LABEL_19;
    }
  }
  if (v22) {
    goto LABEL_11;
  }
LABEL_18:
  int v17 = 0;
LABEL_19:
  v23[0] = @"dsp-count";
  OSStatus v18 = [NSNumber numberWithUnsignedInt:v6];
  v24[0] = v18;
  v23[1] = @"mic-count";
  uint64_t v19 = [NSNumber numberWithUnsignedInt:v8];
  v24[1] = v19;
  v23[2] = @"speaker-ref-count";
  uint64_t v20 = [NSNumber numberWithUnsignedInt:v10];
  v24[2] = v20;
  int v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    inAddress.mSelector = 136315650;
    *(void *)&inAddress.mScope = "AVBorealisServer.mm";
    __int16 v27 = 1024;
    int v28 = 2097;
    __int16 v29 = 2112;
    uint64_t v30 = v21;
    _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%25s:%-5d getInputChannelInfoCompletion: %@", (uint8_t *)&inAddress, 0x1Cu);
  }
  v3[2](v3, v21, v17);
}

- (void)voiceTriggerPastDataFramesAvailable:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void, void *))a3;
  unsigned int outData = 0;
  serverImpl = self->serverImpl;
  AudioObjectID SpeechDetectionDeviceID = BorealisServerImpl::GetSpeechDetectionDeviceID(1, 0, v6);
  if (!SpeechDetectionDeviceID) {
    goto LABEL_13;
  }
  os_unfair_recursive_lock_lock_with_options();
  if (!serverImpl->var10
    || (*(void *)&inAddress.mSelector = 0x676C6F6264617064,
        inAddress.mElement = 0,
        !AudioObjectHasProperty(SpeechDetectionDeviceID, &inAddress)))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      inAddress.mSelector = 136315394;
      *(void *)&inAddress.mScope = "AVBorealisServer.mm";
      __int16 v15 = 1024;
      int v16 = 1495;
      _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%25s:%-5d Property not supported or hardware doesn't support voice trigger", (uint8_t *)&inAddress, 0x12u);
    }
    goto LABEL_12;
  }
  *(void *)&inAddress.mSelector = 0x676C6F6264617064;
  inAddress.mElement = 0;
  ioDataSize[0] = 4;
  OSStatus PropertyData = AudioObjectGetPropertyData(SpeechDetectionDeviceID, &inAddress, 0, 0, ioDataSize, &outData);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    inAddress.mSelector = 136315650;
    *(void *)&inAddress.mScope = "AVBorealisServer.mm";
    __int16 v15 = 1024;
    int v16 = 1489;
    __int16 v17 = 1024;
    LODWORD(v18) = outData;
    _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%25s:%-5d PastData available : %u", (uint8_t *)&inAddress, 0x18u);
  }
  if (!PropertyData)
  {
LABEL_12:
    os_unfair_recursive_lock_unlock();
LABEL_13:
    AudioObjectID v9 = 0;
    goto LABEL_14;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    CAX4CCString::CAX4CCString((CAX4CCString *)ioDataSize, PropertyData);
    inAddress.mSelector = 136315906;
    *(void *)&inAddress.mScope = "AVBorealisServer.mm";
    __int16 v15 = 1024;
    int v16 = 1491;
    __int16 v17 = 2080;
    OSStatus v18 = ioDataSize;
    __int16 v19 = 1024;
    AudioObjectID v20 = SpeechDetectionDeviceID;
    _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%25s:%-5d Error %s fetching past data available frames on device 0x%x", (uint8_t *)&inAddress, 0x22u);
  }
  os_unfair_recursive_lock_unlock();
  AudioObjectID v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:PropertyData userInfo:0];
LABEL_14:
  BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
  uint64_t v11 = outData;
  if (v10)
  {
    inAddress.mSelector = 136315650;
    *(void *)&inAddress.mScope = "AVBorealisServer.mm";
    __int16 v15 = 1024;
    int v16 = 2080;
    __int16 v17 = 1024;
    LODWORD(v18) = outData;
    _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%25s:%-5d past frames %u", (uint8_t *)&inAddress, 0x18u);
    uint64_t v11 = outData;
  }
  v4[2](v4, v11, v9);
}

- (void)enableBargeInMode:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315394;
    uint64_t v8 = "AVBorealisServer.mm";
    __int16 v9 = 1024;
    int v10 = 2066;
    _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%25s:%-5d enableBargeInMode", (uint8_t *)&v7, 0x12u);
  }
  BorealisServerImpl::enableBargeInMode((uint64_t)self->serverImpl, v4, v6);
}

- (void)updateVoiceTriggerConfiguration:(id)a3 reply:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(id, id))a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v11 = "AVBorealisServer.mm";
    __int16 v12 = 1024;
    int v13 = 2041;
    _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%25s:%-5d updateVoiceTriggerConfiguration", buf, 0x12u);
  }
  if (isHACProduct(0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v11 = "AVBorealisServer.mm";
      __int16 v12 = 1024;
      int v13 = 2045;
      _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d Configuration of AOP via AVVTC unsupported on this product", buf, 0x12u);
    }
    int v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:1852797029 userInfo:0];
    v6[2](v6, v7);
  }
  else if (v5)
  {
    int v7 = v6;
    if (BorealisServerImpl::GetSpeechDetectionDeviceID(1, 0, v8))
    {
      os_unfair_recursive_lock_lock_with_options();
      [v7 copy];
      operator new();
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v11 = "AVBorealisServer.mm";
      __int16 v12 = 1024;
      int v13 = 1198;
      _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d Updating voice trigger configuration - No valid audio device found", buf, 0x12u);
    }
    if (v7)
    {
      __int16 v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:560227702 userInfo:0];
      v7[2](v7, v9);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v11 = "AVBorealisServer.mm";
      __int16 v12 = 1024;
      int v13 = 2054;
      _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d First pass configuration data is nil", buf, 0x12u);
    }
    int v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:0];
    v6[2](v6, v7);
  }
}

- (void)speakerStateMutedReply:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)__int16 v9 = 136315394;
    *(void *)&v9[4] = "AVBorealisServer.mm";
    *(_WORD *)&v9[12] = 1024;
    *(_DWORD *)&v9[14] = 2035;
    _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%25s:%-5d speakerMuted", v9, 0x12u);
  }
  serverImpl = self->serverImpl;
  id v6 = v4;
  int v7 = [serverImpl->var14 notificationQueue];
  *(void *)__int16 v9 = MEMORY[0x1E4F143A8];
  *(void *)&v9[8] = 3221225472;
  *(void *)&v9[16] = ___ZN18BorealisServerImpl12speakerMutedEU13block_pointerFvbP7NSErrorE_block_invoke;
  int v10 = &unk_1E5B146E8;
  id v11 = v6;
  __int16 v12 = serverImpl;
  id v8 = v6;
  dispatch_async(v7, v9);
}

- (void)speakerStateActiveReply:(id)a3
{
  id v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__AVBorealisServer_speakerStateActiveReply___block_invoke;
  v7[3] = &unk_1E5B13DC8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(notificationQueue, v7);
}

void __44__AVBorealisServer_speakerStateActiveReply___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id v6 = 136315394;
    *(void *)&v6[4] = "AVBorealisServer.mm";
    *(_WORD *)&v6[12] = 1024;
    *(_DWORD *)&v6[14] = 2028;
    _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%25s:%-5d speakerStateActive", v6, 0x12u);
  }
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  id v3 = *(id *)(a1 + 40);
  id v4 = [*(id *)(v2 + 80) notificationQueue];
  *(void *)id v6 = MEMORY[0x1E4F143A8];
  *(void *)&v6[8] = 3221225472;
  *(void *)&v6[16] = ___ZN18BorealisServerImpl12isPortActiveEmU13block_pointerFvbP7NSErrorE_block_invoke;
  int v7 = &unk_1E5B13DA0;
  uint64_t v9 = v2;
  uint64_t v10 = 1;
  id v8 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

- (void)enableSpeakerStateListening:(BOOL)a3 reply:(id)a4
{
  id v6 = a4;
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__AVBorealisServer_enableSpeakerStateListening_reply___block_invoke;
  block[3] = &unk_1E5B13C48;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(notificationQueue, block);
}

uint64_t __54__AVBorealisServer_enableSpeakerStateListening_reply___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v2 = *(unsigned __int8 *)(a1 + 48);
    int v4 = 136315650;
    id v5 = "AVBorealisServer.mm";
    __int16 v6 = 1024;
    int v7 = 2015;
    __int16 v8 = 1024;
    int v9 = v2;
    _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%25s:%-5d enableSpeakerStateListening %d", (uint8_t *)&v4, 0x18u);
  }
  BorealisServerImpl::enableListeningOnPort(*(BorealisServerImpl **)(*(void *)(a1 + 32) + 8), 1, *(unsigned __int8 *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)portsActiveReply:(id)a3
{
  id v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__AVBorealisServer_portsActiveReply___block_invoke;
  v7[3] = &unk_1E5B13DC8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(notificationQueue, v7);
}

void __37__AVBorealisServer_portsActiveReply___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v2 = BorealisServerImpl::getCachedPortStateInfo(*(BorealisServerImpl **)(*(void *)(a1 + 32) + 8));
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315906;
    id v5 = "AVBorealisServer.mm";
    __int16 v6 = 1024;
    int v7 = 2000;
    __int16 v8 = 2048;
    int v9 = v2;
    __int16 v10 = 2112;
    BOOL v11 = v2;
    _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%25s:%-5d portsActiveReply: (%p) (%@)", (uint8_t *)&v4, 0x26u);
  }
  if (v2)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)enableListeningOnPorts:(id)a3 reply:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    int v16 = "AVBorealisServer.mm";
    __int16 v17 = 1024;
    int v18 = 1972;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%25s:%-5d enableListeningOnPorts: (%@)", buf, 0x1Cu);
  }
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__AVBorealisServer_enableListeningOnPorts_reply___block_invoke;
  block[3] = &unk_1E5B13C20;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(notificationQueue, block);
}

uint64_t __49__AVBorealisServer_enableListeningOnPorts_reply___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v7 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6, (void)v12);
        uint64_t v8 = [v7 BOOLValue];
        id v9 = v6;
        if (v9)
        {
          if ([@"AVVoiceTriggerPort_BuiltinSpeaker" isEqualToString:v9])
          {
            uint64_t v10 = 1;
          }
          else if ([@"AVVoiceTriggerPort_BluetoothSpeaker" isEqualToString:v9])
          {
            uint64_t v10 = 2;
          }
          else
          {
            uint64_t v10 = 0;
          }
        }
        else
        {
          uint64_t v10 = 0;
        }

        BorealisServerImpl::enableListeningOnPort(*(BorealisServerImpl **)(*(void *)(a1 + 40) + 8), v10, v8);
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v3);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)setListeningProperty:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void *))a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v20 = "AVBorealisServer.mm";
    __int16 v21 = 1024;
    int v22 = 1961;
    __int16 v23 = 1024;
    LODWORD(v24) = v4;
    _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%25s:%-5d setListeningProperty: %d", buf, 0x18u);
  }
  AudioObjectID SpeechDetectionDeviceID = BorealisServerImpl::GetSpeechDetectionDeviceID(1, 0, v6);
  if (SpeechDetectionDeviceID)
  {
    os_unfair_recursive_lock_lock_with_options();
    v17.mElement = 0;
    BOOL inData = v4;
    *(void *)&v17.mSelector = 0x676C6F626470656CLL;
    if (AudioObjectHasProperty(SpeechDetectionDeviceID, &v17))
    {
      OSStatus v8 = AudioObjectSetPropertyData(SpeechDetectionDeviceID, &v17, 0, 0, 4u, &inData);
      if (v8)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          id v20 = "AVBorealisServer.mm";
          int v22 = 1032;
          id v9 = "Disable";
          __int16 v23 = 2080;
          *(_DWORD *)buf = 136316162;
          __int16 v21 = 1024;
          if (v4) {
            id v9 = "Enable";
          }
          int v24 = v9;
          __int16 v25 = 1024;
          AudioObjectID v26 = SpeechDetectionDeviceID;
          __int16 v27 = 1024;
          OSStatus v28 = v8;
          uint64_t v10 = MEMORY[0x1E4F14500];
          BOOL v11 = "%25s:%-5d setListeningProperty failure to %s listening property on device %d [err2 (%d)]";
          os_log_type_t v12 = OS_LOG_TYPE_ERROR;
          uint32_t v13 = 40;
          goto LABEL_21;
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        int v16 = "Disable";
        id v20 = "AVBorealisServer.mm";
        int v22 = 1029;
        __int16 v23 = 2080;
        *(_DWORD *)buf = 136315906;
        __int16 v21 = 1024;
        if (v4) {
          int v16 = "Enable";
        }
        int v24 = v16;
        __int16 v25 = 1024;
        AudioObjectID v26 = SpeechDetectionDeviceID;
        uint64_t v10 = MEMORY[0x1E4F14500];
        BOOL v11 = "%25s:%-5d setListeningProperty (%s) on device %d";
        os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
        uint32_t v13 = 34;
        goto LABEL_21;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      id v20 = "AVBorealisServer.mm";
      __int16 v21 = 1024;
      int v22 = 1036;
      __int16 v23 = 1024;
      LODWORD(v24) = SpeechDetectionDeviceID;
      uint64_t v10 = MEMORY[0x1E4F14500];
      BOOL v11 = "%25s:%-5d setListeningProperty device(%d) doesn't have property.";
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 24;
LABEL_21:
      _os_log_impl(&dword_1A3931000, v10, v12, v11, buf, v13);
    }
    os_unfair_recursive_lock_unlock();
    long long v15 = 0;
    goto LABEL_23;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    long long v14 = "Disabling";
    id v20 = "AVBorealisServer.mm";
    *(_DWORD *)buf = 136315650;
    if (v4) {
      long long v14 = "Enabling";
    }
    __int16 v21 = 1024;
    int v22 = 1040;
    __int16 v23 = 2080;
    int v24 = v14;
    _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%25s:%-5d %s setListeningProperty - No valid audio device found", buf, 0x1Cu);
  }
  long long v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:560227702 userInfo:0];
LABEL_23:
  v5[2](v5, v15);
}

- (void)enableVoiceTriggerListening:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315650;
    OSStatus v8 = "AVBorealisServer.mm";
    __int16 v9 = 1024;
    int v10 = 1955;
    __int16 v11 = 1024;
    BOOL v12 = v4;
    _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%25s:%-5d enableVoiceTriggerListening: %d", (uint8_t *)&v7, 0x18u);
  }
  BorealisServerImpl::enableVoiceTriggerListening((uint64_t)self->serverImpl, v4, 0, v6);
}

- (void)initializeWithReply:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void (**)(id, void))a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315394;
    id v5 = "AVBorealisServer.mm";
    __int16 v6 = 1024;
    int v7 = 1948;
    _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%25s:%-5d Initialize Voice Trigger", (uint8_t *)&v4, 0x12u);
  }
  v3[2](v3, 0);
}

- (void)dealloc
{
  notificationQueue = self->_notificationQueue;
  self->_notificationQueue = 0;

  serverImpl = self->serverImpl;
  if (serverImpl)
  {
    (*((void (**)(BorealisServerImpl *))serverImpl->var0 + 1))(serverImpl);
    self->serverImpl = 0;
  }
  clientConnections = self->_clientConnections;
  self->_clientConnections = 0;

  v6.receiver = self;
  v6.super_class = (Class)AVBorealisServer;
  [(AVBorealisServer *)&v6 dealloc];
}

- (AVBorealisServer)init
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)AVBorealisServer;
  id v2 = [(AVBorealisServer *)&v19 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("BorealisManager.notification", v3);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v4;

    objc_super v6 = v2->_notificationQueue;
    if (GetAudioWorkQueuePriority(void)::once[0] != -1) {
      dispatch_once(GetAudioWorkQueuePriority(void)::once, &__block_literal_global_8117);
    }
    int v7 = GetCustomRootQueue(GetAudioWorkQueuePriority(void)::gAudioWorkQueuePriority);
    dispatch_set_target_queue(v6, v7);

    uint64_t v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    clientConnections = v2->_clientConnections;
    v2->_clientConnections = v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.audio.voicetrigger.xpc"];
    serverListener = v2->_serverListener;
    v2->_serverListener = (NSXPCListener *)v10;

    [(NSXPCListener *)v2->_serverListener setDelegate:v2];
    strcpy(__path, "/System/Library/PrivateFrameworks/AssistantServices.framework/AssistantServices");
    BOOL v12 = dlopen(__path, 1);
    v2->_mobileAssistantDylib = v12;
    if (v12)
    {
      uint64_t v13 = dlsym(v12, "AFSiriActivationBuiltInMicVoice");
      v2->_afSiriActivationBuiltInMicVoiceFuncPtr = v13;
      if (!v13)
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_14;
        }
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "AVBorealisServer.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 1891;
        long long v14 = MEMORY[0x1E4F14500];
        long long v15 = "%25s:%-5d Unable to find AFSiriActivationBuiltInMicVoice in MAF";
        os_log_type_t v16 = OS_LOG_TYPE_ERROR;
        uint32_t v17 = 18;
LABEL_13:
        _os_log_impl(&dword_1A3931000, v14, v16, v15, buf, v17);
LABEL_14:
        operator new();
      }
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "AVBorealisServer.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1894;
      __int16 v21 = 2048;
      int v22 = (char *)v13;
      long long v14 = MEMORY[0x1E4F14500];
      long long v15 = "%25s:%-5d Successfully found address of AFSiriActivationBuiltInMicVoice in MAF: 0x%p";
      os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "AVBorealisServer.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1898;
      __int16 v21 = 2080;
      int v22 = __path;
      long long v14 = MEMORY[0x1E4F14500];
      long long v15 = "%25s:%-5d Unable to open %s";
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
    }
    uint32_t v17 = 28;
    goto LABEL_13;
  }
  return 0;
}

void __24__AVBorealisServer_init__block_invoke(uint64_t a1, int a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v3 = 136315650;
    dispatch_queue_t v4 = "AVBorealisServer.mm";
    __int16 v5 = 1024;
    int v6 = 1917;
    __int16 v7 = 1024;
    int v8 = a2;
    _os_log_impl(&dword_1A3931000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%25s:%-5d VTStateManager callback message: %d (0-start,1-stop,2-modelupdate)", (uint8_t *)&v3, 0x18u);
  }
}

@end