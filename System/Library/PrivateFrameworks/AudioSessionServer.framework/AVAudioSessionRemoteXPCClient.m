@interface AVAudioSessionRemoteXPCClient
- (AVAudioSessionRemoteXPCClient)initWithServer:(id)a3 process:(ProcessInfo *)a4 delegate:;
- (id).cxx_construct;
- (id)clientRelay;
- (id)initWithServer:process:delegate:;
- (uint64_t)initWithServer:process:delegate:;
- (void)activateSession:(unsigned int)a3 options:(unint64_t)a4 deviceInfo:(id)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)addMXNotificationListener:(unsigned int)a3 notificationName:(id)a4 reply:(id)a5;
- (void)allowAppToInitiatePlaybackTemporarilyFromBackground:(id)a3 reply:(id)a4;
- (void)createAudioApplicationForSpecification:(id)a3 reply:(id)a4;
- (void)createProxySession:(unsigned int)a3 reply:(id)a4;
- (void)createSession:(unint64_t)a3 sourceAuditToken:(id *)a4 sourceSessionID:(unsigned int)a5 nameOrDeviceUID:(id)a6 clientProcessName:(id)a7 useCaseIdentifier:(unsigned int)a8 reply:(id)a9;
- (void)deactivateSession:(unsigned int)a3 options:(unint64_t)a4 priority:(id)a5 requestID:(unint64_t)a6 reply:(id)a7;
- (void)dealloc;
- (void)destroySession:(unsigned int)a3 reply:(id)a4;
- (void)getApplicationMessages:(id *)a3 clientID:(unsigned int)a4 reply:(id)a5;
- (void)getApplicationProperty:(id *)a3 clientID:(unsigned int)a4 propertyID:(id)a5 isMXProperty:(BOOL)a6 reply:(id)a7;
- (void)getDeferredMessages:(unsigned int)a3 reply:(id)a4;
- (void)getEnhanceDialogueLevelWithReply:(id)a3;
- (void)getIOControllerPeriod:(unsigned int)a3 decoupledInput:(BOOL)a4 reply:(id)a5;
- (void)getMXPropertyGenericPipe:(unsigned int)a3 propertyName:(id)a4 reply:(id)a5;
- (void)getProperties:(unsigned int)a3 properties:(id)a4 reply:(id)a5;
- (void)getProperty:(unsigned int)a3 propertyName:(id)a4 MXProperty:(BOOL)a5 reply:(id)a6;
- (void)getSpatialPreferencesForSession:(unsigned int)a3 contentType:(int64_t)a4 reply:(id)a5;
- (void)getSpatialPreferencesForSession:(unsigned int)a3 reply:(id)a4;
- (void)handleRemoteInterruption:(unsigned int)a3 interruptionStatus:(id)a4 postInterruptionNotification:(BOOL)a5 reply:(id)a6;
- (void)initWithServer:process:delegate:;
- (void)invalidate;
- (void)muteInputForRecordingProcesses:(id)a3;
- (void)pingWithReply:(id)a3;
- (void)removeMXNotificationListener:(unsigned int)a3 notificationName:(id)a4 reply:(id)a5;
- (void)sessionIDs:(id *)a3 clientID:(unsigned int)a4 reply:(id)a5;
- (void)setApplicationProperty:(id *)a3 clientID:(unsigned int)a4 propertyID:(id)a5 propertyValue:(id)a6 reply:(id)a7;
- (void)setEnhanceDialogueLevel:(id)a3 reply:(id)a4;
- (void)setEnhanceDialoguePreference:(id)a3 reply:(id)a4;
- (void)setMXPropertyOnAllSessions:(id *)a3 clientID:(unsigned int)a4 MXProperty:(id)a5 values:(id)a6 reply:(id)a7;
- (void)setProperties:(unsigned int)a3 values:(id)a4 MXProperties:(BOOL)a5 batchStrategy:(int)a6 genericMXPipe:(BOOL)a7 reply:(id)a8;
- (void)setSession:(unsigned int)a3 decoupledInput:(BOOL)a4 hasIOEventListeners:(BOOL)a5 reply:(id)a6;
- (void)setSessionPlayState:(unsigned int)a3 playState:(unsigned int)a4 playerType:(unsigned int)a5 playerRef:(id)a6 modes:(unsigned int)a7 reply:(id)a8;
- (void)silenceOutput:(unsigned int)a3 options:(unint64_t)a4 reply:(id)a5;
- (void)simulatePrimarySessionCreationInsideServerWithReply:(id)a3;
- (void)sleepWithReply:(unsigned int)a3 reply:(id)a4;
- (void)toggleInputMuteForRecordingProcess:(id)a3;
- (void)updateApplicationProperty:(id *)a3 clientID:(unsigned int)a4 propertyID:(id)a5 propertyValue:(id)a6 context:(id)a7 reply:(id)a8;
- (void)updateMicrophonePermission:(int64_t)a3 reply:(id)a4;
- (void)verifySessionExists:(unsigned int)a3 reply:(id)a4;
@end

@implementation AVAudioSessionRemoteXPCClient

- (void)initWithServer:process:delegate:
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = (caulk *)getpid();
  if ((caulk::is_debugger_attached(v2) & 1) == 0)
  {
    WeakRetained = (char **)objc_loadWeakRetained((id *)(a1 + 8));
    v4 = WeakRetained;
    if (WeakRetained && !*((unsigned char *)WeakRetained + 80))
    {
      v5.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
      if (v5.__d_.__rep_ >= (uint64_t)v4[12])
      {
        AudioSessionServerXPCTimeout(v4[11]);
      }
      else
      {
        v6 = *(id *)as::server::gSessionServerLog((as::server *)v5.__d_.__rep_);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          int v7 = 136315394;
          v8 = "AVAudioSessionXPCServer.mm";
          __int16 v9 = 1024;
          int v10 = 719;
          _os_log_impl(&dword_1CFE2A000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d XPC watchdog timer fired too soon, skipping timeout handling", (uint8_t *)&v7, 0x12u);
        }
      }
    }
  }
}

- (void)getSpatialPreferencesForSession:(unsigned int)a3 contentType:(int64_t)a4 reply:(id)a5
{
  v6 = *(as::server::LegacySessionManager **)&a3;
  id v8 = a5;
  v13[0] = 1;
  int v14 = 3857;
  uint64_t v15 = v6;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  kdebug_trace();
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient getSpatialPreferencesForSessio"
                                                          "n:contentType:reply:]";
  *(void *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},AVAudioSessionSpatialPreferences * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v8);
  __int16 v9 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();

  memset(&v12, 0, sizeof(v12));
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection) {
    [(NSXPCConnection *)xpcConnection auditToken];
  }
  if (VerifySessionOwnership(v6, &v12, 1))
  {
    uint64_t v11 = [self->_clientProcess.mProcessName.var0 spatialPreferencesForSession:v6 contentType:a4];
    ((void (**)(void, void, void *))v9)[2](v9, 0, v11);
  }
  else
  {
    uint64_t v11 = BuildInvalidSessionError((as::server *)"-[AVAudioSessionRemoteXPCClient getSpatialPreferencesForSession:contentType:reply:]", (int)v6);
    ((void (**)(void, void *, void))v9)[2](v9, v11, 0);
  }

  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
}

- (void)setProperties:(unsigned int)a3 values:(id)a4 MXProperties:(BOOL)a5 batchStrategy:(int)a6 genericMXPipe:(BOOL)a7 reply:(id)a8
{
  id v14 = a4;
  id v15 = a8;
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient setProperties:values:MXPropert"
                                                          "ies:batchStrategy:genericMXPipe:reply:]";
  *(void *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  uint64_t v16 = caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},NSArray * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v15);

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __101__AVAudioSessionRemoteXPCClient_setProperties_values_MXProperties_batchStrategy_genericMXPipe_reply___block_invoke;
  v21[3] = &unk_1E68758D0;
  unsigned int v24 = a3;
  v21[4] = self;
  id v17 = v16;
  id v23 = v17;
  BOOL v26 = a7;
  id v18 = v14;
  id v22 = v18;
  BOOL v27 = a5;
  int v25 = a6;
  v19 = (void *)MEMORY[0x1D25E1DE0](v21);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  as::WorkloopPool::dispatchAsync();
}

- (AVAudioSessionRemoteXPCClient)initWithServer:(id)a3 process:(ProcessInfo *)a4 delegate:
{
  std::chrono::system_clock::time_point v5 = v4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = v5;
  v24.receiver = self;
  v24.super_class = (Class)AVAudioSessionRemoteXPCClient;
  int v10 = [(AVAudioSessionRemoteXPCClient *)&v24 init];
  uint64_t v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_server, v8);
    audit_token_t v12 = [[AVAudioSessionXPCClientRelay alloc] initWithConnection:a4->xpcConnection token:a4->token.mValue];
    v13 = *(void **)&v11->_clientProcess.mProcessName.__r_.var0;
    *(void *)&v11->_clientProcess.mProcessName.__r_.var0 = v12;

    v11->_clientProcess.token.mValue = a4->token.mValue;
    objc_storeStrong((id *)&v11->_clientProcess.xpcConnection, a4->xpcConnection);
    id WeakRetained = objc_loadWeakRetained((id *)&a4->mClientRelay);
    objc_storeWeak((id *)&v11->_clientProcess.mClientRelay, WeakRetained);

    std::string::operator=((std::string *)&v11->_clientProcess.mProcessName, (const std::string *)&a4->mProcessName);
    objc_storeWeak((id *)&v11->_clientProcess.mClientRelay, *(id *)&v11->_clientProcess.mProcessName.__r_.var0);
    if (!v11->_clientProcess.xpcConnection)
    {
      uint64_t v19 = _os_crash();
      as::server::require_acq::AudioSessionServerSetClientPlayState(v19);
    }
    objc_storeStrong((id *)&v11->_clientProcess.mProcessName.var0, v5);
    objc_initWeak(&location, v11);
    objc_copyWeak(&to, &location);
    LOBYTE(v11->_clientRelay) = 0;
    v11->_serverDelegate = (AVAudioSessionServerDelegate *)"unknown";
    *(std::chrono::system_clock::time_point *)&v11->_invalidated = std::chrono::system_clock::now();
    objc_copyWeak(&from, &to);
    v38 = 0;
    v36 = &unk_1F2687F30;
    objc_moveWeak(&v37, &from);
    v38 = &v36;
    objc_destroyWeak(&from);
    caulk::xpc::reply_watchdog_factory::init2();
    std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](&v36);
    objc_copyWeak(&v20, &to);
    v35 = 0;
    v33 = &unk_1F2687F30;
    objc_moveWeak(&v34, &v20);
    v35 = &v33;
    objc_destroyWeak(&v20);
    caulk::xpc::reply_watchdog_factory::init2();
    id v15 = (as::server *)std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](&v33);
    uint64_t v16 = *(id *)as::server::gSessionServerLog(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      xpcConnection = v11->_clientProcess.xpcConnection;
      *(_DWORD *)buf = 136315906;
      BOOL v26 = "AVAudioSessionXPCServer.mm";
      __int16 v27 = 1024;
      int v28 = 732;
      __int16 v29 = 2112;
      v30 = xpcConnection;
      __int16 v31 = 2048;
      v32 = v11;
      _os_log_impl(&dword_1CFE2A000, v16, OS_LOG_TYPE_DEFAULT, "%25s:%-5d New connection: %@ (%p)", buf, 0x26u);
    }
    objc_destroyWeak(&to);
    objc_destroyWeak(&location);
  }

  return v11;
}

void __64__AVAudioSessionRemoteXPCClient_getProperties_properties_reply___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 56);
  v13[0] = 1;
  int v14 = 3979;
  uint64_t v15 = v2;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  kdebug_trace();
  memset(&v12, 0, sizeof(v12));
  v3 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v3) {
    [v3 auditToken];
  }
  if (VerifySessionOwnership((as::server::LegacySessionManager *)*(unsigned int *)(a1 + 56), &v12, 1))
  {
    unsigned int v4 = *(_DWORD *)(a1 + 56);
    std::chrono::system_clock::time_point v5 = *(void **)(a1 + 40);
    id v9 = 0;
    as::server::forbid_acq::GetPropertiesFromMXSession(v4, &v12, v5, &v9, (uint64_t)&v10);
    id v6 = v9;
    if (v10)
    {
      int v7 = NSErrorWithString(&cfstr_ErrorInGetting.isa);
    }
    else
    {
      int v7 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 48);
    BuildInvalidSessionError((as::server *)"-[AVAudioSessionRemoteXPCClient getProperties:properties:reply:]_block_invoke", *(_DWORD *)(a1 + 56));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void, void))(v8 + 16))(v8, v6, 0, 0);
  }

  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
}

void __77__AVAudioSessionRemoteXPCClient_getMXPropertyGenericPipe_propertyName_reply___block_invoke(uint64_t a1)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(unsigned int *)(a1 + 56);
  v13[0] = 1;
  int v14 = 3850;
  uint64_t v15 = v2;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  kdebug_trace();
  memset(&v12, 0, sizeof(v12));
  v3 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v3) {
    [v3 auditToken];
  }
  if (VerifySessionOwnership((as::server::LegacySessionManager *)*(unsigned int *)(a1 + 56), &v12, 1))
  {
    as::server::forbid_acq::GetPropertyMX((as::server::forbid_acq *)*(unsigned int *)(a1 + 56), *(audit_token_t **)(a1 + 40), (NSString *)1, &v12, (uint64_t)&v10);
    uint64_t v4 = v10;
    if (v10)
    {
      std::chrono::system_clock::time_point v5 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v19 = *MEMORY[0x1E4F28568];
      v20[0] = @"MXSessionGetProperty error";
      id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
      int v7 = [v5 errorWithDomain:*MEMORY[0x1E4F28760] code:v4 userInfo:v6];

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 48);
    id v9 = BuildInvalidSessionError((as::server *)"-[AVAudioSessionRemoteXPCClient getMXPropertyGenericPipe:propertyName:reply:]_block_invoke", *(_DWORD *)(a1 + 56));
    (*(void (**)(uint64_t, void *, void, void))(v8 + 16))(v8, v9, 0, 0);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v13);
}

void __75__AVAudioSessionRemoteXPCClient_getProperty_propertyName_MXProperty_reply___block_invoke(uint64_t a1)
{
  v26[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(unsigned int *)(a1 + 56);
  v17[0] = 1;
  int v18 = 3848;
  uint64_t v19 = v2;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  kdebug_trace();
  memset(&v16, 0, sizeof(v16));
  v3 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v3) {
    [v3 auditToken];
  }
  if (VerifySessionOwnership((as::server::LegacySessionManager *)*(unsigned int *)(a1 + 56), &v16, 1))
  {
    if (*(unsigned char *)(a1 + 60))
    {
      as::server::forbid_acq::GetPropertyMX((as::server::forbid_acq *)*(unsigned int *)(a1 + 56), *(audit_token_t **)(a1 + 40), 0, &v16, (uint64_t)v15);
      uint64_t v5 = SLODWORD(v15[0]);
      if (LODWORD(v15[0]))
      {
        id v6 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v25 = *MEMORY[0x1E4F28568];
        v26[0] = @"MXSessionGetProperty error";
        int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
        uint64_t v8 = [v6 errorWithDomain:*MEMORY[0x1E4F28760] code:v5 userInfo:v7];

        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      as::server::forbid_acq::GetPropertyLocal(v15, (as::server::forbid_acq *)*(unsigned int *)(a1 + 56), &v16, *(const audit_token_t **)(a1 + 40), v4);
      uint64_t v11 = SLODWORD(v15[0]);
      if (LODWORD(v15[0]))
      {
        audit_token_t v12 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v23 = *MEMORY[0x1E4F28568];
        objc_super v24 = @"GetPropertyLocal error";
        v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
        int v14 = [v12 errorWithDomain:*MEMORY[0x1E4F28760] code:v11 userInfo:v13];

        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        goto LABEL_11;
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_11;
  }
  uint64_t v9 = *(void *)(a1 + 48);
  int v10 = BuildInvalidSessionError((as::server *)"-[AVAudioSessionRemoteXPCClient getProperty:propertyName:MXProperty:reply:]_block_invoke", *(_DWORD *)(a1 + 56));
  (*(void (**)(uint64_t, void *, void, void))(v9 + 16))(v9, v10, 0, 0);

LABEL_12:
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v17);
}

void __101__AVAudioSessionRemoteXPCClient_setProperties_values_MXProperties_batchStrategy_genericMXPipe_reply___block_invoke(uint64_t a1)
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(unsigned int *)(a1 + 56);
  v69[0] = 1;
  int v70 = 3849;
  uint64_t v71 = v2;
  uint64_t v72 = 0;
  uint64_t v73 = 0;
  uint64_t v74 = 0;
  kdebug_trace();
  memset(&v68, 0, sizeof(v68));
  v3 = *(void **)(*(void *)(a1 + 32) + 24);
  if (v3) {
    [v3 auditToken];
  }
  as::server::ConstAudioSessionInfoAccessor::ConstAudioSessionInfoAccessor((as::server::ConstAudioSessionInfoAccessor *)&v66, *(_DWORD *)(a1 + 56), &v68, 1);
  uint64_t v4 = v66;
  if (v66)
  {
    if (*(unsigned char *)(a1 + 64))
    {
      uint64_t v5 = v67;
      if (v67) {
        atomic_fetch_add_explicit(&v67->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      HasMXPropertyPipeEntitlement = (as::server *)as::server::ConstAudioSessionInfo::HasMXPropertyPipeEntitlement(v4, &v68);
      int v7 = (int)HasMXPropertyPipeEntitlement;
      if (v5) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v5);
      }
      if (!v7)
      {
        v36 = *(id *)as::server::gSessionServerLog(HasMXPropertyPipeEntitlement);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          uint64_t v37 = *(void *)(a1 + 40);
          int v38 = *(_DWORD *)(a1 + 56);
          *(_DWORD *)buf = 136315906;
          v93 = "AVAudioSessionXPCServer.mm";
          __int16 v94 = 1024;
          int v95 = 1224;
          __int16 v96 = 2112;
          uint64_t v97 = v37;
          __int16 v98 = 1024;
          int v99 = v38;
          _os_log_impl(&dword_1CFE2A000, v36, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to set MXProperty: %@ on generic pipe for session: 0x%x due to missing entitlement.", buf, 0x22u);
        }
        uint64_t v39 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v84 = *MEMORY[0x1E4F28568];
        v85 = @"Entitlement required to use generic property setter SPI";
        v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v85 forKeys:&v84 count:1];
        audit_token_t v16 = [v39 errorWithDomain:*MEMORY[0x1E4F28760] code:1701737535 userInfo:v40];

        id v32 = (id)objc_opt_new();
        long long v64 = 0u;
        long long v65 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        id v41 = *(id *)(a1 + 40);
        uint64_t v42 = [v41 countByEnumeratingWithState:&v62 objects:v83 count:16];
        if (v42)
        {
          uint64_t v43 = *(void *)v63;
          do
          {
            for (uint64_t i = 0; i != v42; ++i)
            {
              if (*(void *)v63 != v43) {
                objc_enumerationMutation(v41);
              }
              v45 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", &unk_1F268A770, *(void *)(*((void *)&v62 + 1) + 8 * i), 0);
              [v32 addObject:v45];
            }
            uint64_t v42 = [v41 countByEnumeratingWithState:&v62 objects:v83 count:16];
          }
          while (v42);
        }

        v35 = (void *)[v32 copy];
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        goto LABEL_45;
      }
    }
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v75 objects:buf count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v76;
      while (2)
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v76 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void *)(*((void *)&v75 + 1) + 8 * j);
          objc_opt_class();
          uint64_t isKindOfClass = objc_opt_isKindOfClass();
          if ((isKindOfClass & 1) == 0)
          {
            uint64_t v20 = *(id *)as::server::gSessionServerLog((as::server *)isKindOfClass);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v87 = 136315650;
              *(void *)&v87[4] = "AVAudioSessionXPCServer.mm";
              __int16 v88 = 1024;
              int v89 = 407;
              __int16 v90 = 2112;
              uint64_t v91 = v14;
              _os_log_impl(&dword_1CFE2A000, v20, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Unexpected dictionary key %@. All keys must be NSStrings", v87, 0x1Cu);
            }
            uint64_t v21 = [*(id *)(v8 + 24) processIdentifier];
            uint64_t v22 = NSString;
            as::server::ProcessInfo::processName((as::server::ProcessInfo *)(v8 + 16), (std::string *)v87);
            if ((v91 & 0x80000000) == 0) {
              uint64_t v23 = v87;
            }
            else {
              uint64_t v23 = *(unsigned char **)v87;
            }
            objc_super v24 = [v22 stringWithUTF8String:v23];
            if (SBYTE3(v91) < 0) {
              operator delete(*(void **)v87);
            }
            uint64_t v25 = [NSString stringWithFormat:@"SetProperties failed for client %@(%d). Invalid dictionary key=%@", v24, v21, v14];
            BOOL v26 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v86 = *MEMORY[0x1E4F28568];
            *(void *)v87 = v25;
            __int16 v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v87 forKeys:&v86 count:1];
            audit_token_t v16 = [v26 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v27];

            goto LABEL_30;
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v75 objects:buf count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    audit_token_t v16 = 0;
LABEL_30:

    if (v16)
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      goto LABEL_47;
    }
    if (*(unsigned char *)(a1 + 65))
    {
      int v28 = *(void **)(a1 + 40);
      unsigned int v29 = *(_DWORD *)(a1 + 56);
      int v30 = *(_DWORD *)(a1 + 60);
      id v61 = 0;
      int v31 = as::server::forbid_acq::SetPropertiesOnMXSession(v29, &v68, v28, v30, &v61);
      id v32 = v61;
      if (!v31)
      {
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        goto LABEL_46;
      }
      v33 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v81 = *MEMORY[0x1E4F28568];
      v82 = @"Failed to set properties";
      id v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
      v35 = [v33 errorWithDomain:*MEMORY[0x1E4F28760] code:v31 userInfo:v34];

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_45:

LABEL_46:
      goto LABEL_47;
    }
    id v32 = (id)[*(id *)(a1 + 40) mutableCopy];
    if ((atomic_load_explicit((atomic_uchar *volatile)&_ZGVZZ101__AVAudioSessionRemoteXPCClient_setProperties_values_MXProperties_batchStrategy_genericMXPipe_reply__EUb_E16allowSessionMute, memory_order_acquire) & 1) == 0)
    {
      v55 = (as *)__cxa_guard_acquire(&_ZGVZZ101__AVAudioSessionRemoteXPCClient_setProperties_values_MXProperties_batchStrategy_genericMXPipe_reply__EUb_E16allowSessionMute);
      if (v55)
      {
        _ZZZ101__AVAudioSessionRemoteXPCClient_setProperties_values_MXProperties_batchStrategy_genericMXPipe_reply__EUb_E16allowSessionMute = as::AudioSessionMuteEnabled(v55);
        __cxa_guard_release(&_ZGVZZ101__AVAudioSessionRemoteXPCClient_setProperties_values_MXProperties_batchStrategy_genericMXPipe_reply__EUb_E16allowSessionMute);
      }
    }
    uint64_t v46 = [v32 objectForKey:@"MuteSessionInputs"];
    v35 = (void *)v46;
    if (!_ZZZ101__AVAudioSessionRemoteXPCClient_setProperties_values_MXProperties_batchStrategy_genericMXPipe_reply__EUb_E16allowSessionMute
      && v46)
    {
      [v32 removeObjectForKey:@"MuteSessionInputs"];
      int v48 = as::server::forbid_acq::MuteSessionInputsForAudioApp((as::server::forbid_acq *)*(unsigned int *)(a1 + 56), v35, v47);
      if (v48)
      {
        v49 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v79 = *MEMORY[0x1E4F28568];
        v80 = @"MuteSessionInput error";
        v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v80 forKeys:&v79 count:1];
        v51 = [v49 errorWithDomain:*MEMORY[0x1E4F28760] code:v48 userInfo:v50];

        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        goto LABEL_45;
      }
      if (![v32 count])
      {
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        goto LABEL_45;
      }
    }

    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __101__AVAudioSessionRemoteXPCClient_setProperties_values_MXProperties_batchStrategy_genericMXPipe_reply___block_invoke_191;
    v56[3] = &unk_1E68758A8;
    id v52 = v32;
    id v57 = v52;
    int v59 = *(_DWORD *)(a1 + 56);
    audit_token_t v60 = v68;
    id v58 = *(id *)(a1 + 48);
    v53 = (as::server *)MEMORY[0x1D25E1DE0](v56);
    v54 = as::server::GetAudioControlQueue(v53);
    as::server::DispatchBlock(v54, v53, 1, (uint64_t)"-[AVAudioSessionRemoteXPCClient setProperties:values:MXProperties:batchStrategy:genericMXPipe:reply:]_block_invoke_2", (uint64_t)"AVAudioSessionXPCServer.mm", 1314, 0, 0);

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v17 = *(id *)as::server::gSessionServerLog(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = *(_DWORD *)(a1 + 56);
      *(_DWORD *)buf = 136315650;
      v93 = "AVAudioSessionXPCServer.mm";
      __int16 v94 = 1024;
      int v95 = 1216;
      __int16 v96 = 1024;
      LODWORD(v97) = v18;
      _os_log_impl(&dword_1CFE2A000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Cannot get session info for session ID: 0x%x", buf, 0x18u);
    }
    uint64_t v19 = *(void *)(a1 + 48);
    audit_token_t v16 = BuildInvalidSessionError((as::server *)"-[AVAudioSessionRemoteXPCClient setProperties:values:MXProperties:batchStrategy:genericMXPipe:reply:]_block_invoke", *(_DWORD *)(a1 + 56));
    (*(void (**)(uint64_t, void *, void))(v19 + 16))(v19, v16, 0);
  }
LABEL_47:

  if (v67) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v67);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v69);
}

- (void)getDeferredMessages:(unsigned int)a3 reply:(id)a4
{
  id v6 = a4;
  v19[0] = 1;
  int v20 = 3843;
  uint64_t v21 = a3;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  kdebug_trace();
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient getDeferredMessages:reply:]";
  *(void *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},NSArray * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v6);
  int v7 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();

  id v9 = (os_unfair_lock_s *)as::server::LegacySessionManager::Instance(v8);
  memset(&v18, 0, sizeof(v18));
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection) {
    [(NSXPCConnection *)xpcConnection auditToken];
  }
  as::server::LegacySessionManager::FindSessionAndVerifyOwnership(v9, &v18, a3, 0, &v16);
  if (v16)
  {
    as::server::AudioSessionInfo::GetDeferredMessages(v16, v15);
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    for (uint64_t i = v15[1]; (uint64_t *)i != v15; uint64_t i = *(void *)(i + 8))
    {
      id v13 = *(id *)(i + 16);
      [v11 addObject:v13];
    }
    ((void (**)(void, void, id))v7)[2](v7, 0, v11);

    std::__list_imp<NSDictionary * {__strong}>::clear(v15);
  }
  else
  {
    uint64_t v14 = BuildInvalidSessionError((as::server *)"-[AVAudioSessionRemoteXPCClient getDeferredMessages:reply:]", a3);
    ((void (**)(void, void *, void))v7)[2](v7, v14, 0);
  }
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v19);
}

- (void)getMXPropertyGenericPipe:(unsigned int)a3 propertyName:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient getMXPropertyGenericPipe:propertyName:reply:]";
  *(void *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  id v10 = caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},objc_object  {objcproto14NSSecureCoding}* {__strong},unsigned int>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v9);

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  uint64_t v15[2] = __77__AVAudioSessionRemoteXPCClient_getMXPropertyGenericPipe_propertyName_reply___block_invoke;
  uint64_t v15[3] = &unk_1E68759C0;
  unsigned int v18 = a3;
  v15[4] = self;
  id v11 = v10;
  id v17 = v11;
  id v12 = v8;
  id v16 = v12;
  id v13 = (void *)MEMORY[0x1D25E1DE0](v15);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  as::WorkloopPool::dispatchAsync();
}

- (void)getProperty:(unsigned int)a3 propertyName:(id)a4 MXProperty:(BOOL)a5 reply:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient getProperty:propertyName:MXProperty:reply:]";
  *(void *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  id v12 = caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},objc_object  {objcproto14NSSecureCoding}* {__strong},unsigned int>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v11);

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __75__AVAudioSessionRemoteXPCClient_getProperty_propertyName_MXProperty_reply___block_invoke;
  v17[3] = &unk_1E6875998;
  unsigned int v20 = a3;
  char v17[4] = self;
  id v13 = v12;
  id v19 = v13;
  BOOL v21 = a5;
  id v14 = v10;
  id v18 = v14;
  uint64_t v15 = (void *)MEMORY[0x1D25E1DE0](v17);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  as::WorkloopPool::dispatchAsync();
}

- (id).cxx_construct
{
  self->_clientProcess.token.mValue = 0;
  self->_clientProcess.xpcConnection = 0;
  self->_clientProcess.mClientRelay = 0;
  *(_OWORD *)&self->_clientProcess.mProcessName.__r_.__value_.var0.var1.__size_ = 0uLL;
  self->_clientProcess.mProcessName.__r_.__value_.var0.var1.__data_ = 0;
  *(void *)&self->_invalidated = 0;
  caulk::xpc::reply_watchdog_factory::reply_watchdog_factory((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName);
  caulk::xpc::reply_watchdog_factory::reply_watchdog_factory((caulk::xpc::reply_watchdog_factory *)&self->_defaultReplyWatchdogFactory.mTimeoutHandler.__f_.__buf_.__lx[16]);
  return self;
}

- (void)getProperties:(unsigned int)a3 properties:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient getProperties:properties:reply:]";
  *(void *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  id v10 = caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},NSDictionary * {__strong},NSDictionary * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v9);

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  uint64_t v15[2] = __64__AVAudioSessionRemoteXPCClient_getProperties_properties_reply___block_invoke;
  uint64_t v15[3] = &unk_1E68759C0;
  unsigned int v18 = a3;
  v15[4] = self;
  id v11 = v10;
  id v17 = v11;
  id v12 = v8;
  id v16 = v12;
  id v13 = (void *)MEMORY[0x1D25E1DE0](v15);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  as::WorkloopPool::dispatchAsync();
}

- (void)activateSession:(unsigned int)a3 options:(unint64_t)a4 deviceInfo:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v9 = *(as::server::LegacySessionManager **)&a3;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a7;
  v50[0] = 1;
  int v51 = 3840;
  uint64_t v52 = v9;
  uint64_t v53 = 0;
  uint64_t v54 = 0;
  uint64_t v55 = 0;
  kdebug_trace();
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient activateSession:options:device"
                                                          "Info:requestID:reply:]";
  *(void *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v12);
  id v13 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();

  memset(&v49, 0, sizeof(v49));
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection) {
    [(NSXPCConnection *)xpcConnection auditToken];
  }
  if (!VerifySessionOwnership(v9, &v49, 1))
  {
    id v19 = BuildInvalidSessionError((as::server *)"-[AVAudioSessionRemoteXPCClient activateSession:options:deviceInfo:requestID:reply:]", (int)v9);
    ((void (**)(void, void *))v13)[2](v13, v19);

    goto LABEL_57;
  }
  as::server::AudioSessionInfoAccessor::AudioSessionInfoAccessor((as::server::AudioSessionInfoAccessor *)buf, v9);
  uint64_t v15 = *(void *)buf;
  if (!*(void *)buf)
  {
    uint64_t v41 = _os_crash();
    as::server::require_acq::AudioSessionServerSetClientPlayState(v41);
  }
  id v16 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8])
  {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf[8] + 8), 1uLL, memory_order_relaxed);
    int v17 = *(_DWORD *)(v15 + 92);
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
    if (v17 != 1935830119)
    {
      uint64_t v15 = *(void *)buf;
      if (!*(void *)buf)
      {
        uint64_t v18 = _os_crash();
        as::server::require_acq::AudioSessionServerSetClientPlayState(v18);
      }
      goto LABEL_15;
    }
  }
  else if (*(_DWORD *)(*(void *)buf + 92) != 1935830119)
  {
LABEL_15:
    uint64_t v23 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8])
    {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf[8] + 8), 1uLL, memory_order_relaxed);
      atomic_store((a4 & 0x4000000) != 0, (unsigned __int8 *)(v15 + 540));
      std::__shared_weak_count::__release_shared[abi:ne180100](v23);
    }
    else
    {
      atomic_store((a4 & 0x4000000) != 0, (unsigned __int8 *)(v15 + 540));
    }
    unint64_t v21 = a4;
    goto LABEL_19;
  }
  unsigned int v20 = (os_unfair_lock_s *)as::server::LegacySessionManager::Instance((as::server::LegacySessionManager *)v16);
  as::server::LegacySessionManager::FindSourceSessionForSibling(v20, (uint64_t)&v49, (int)v9, (void *)self->_clientProcess.mProcessName.var0, &cf);
  unint64_t v21 = a4;
  if (cf)
  {
    unsigned __int8 v22 = atomic_load((unsigned __int8 *)cf + 540);
    unint64_t v21 = v22 & 1 | a4;
  }
  if (v48) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v48);
  }
LABEL_19:
  as::server::AudioSessionInfoAccessor::~AudioSessionInfoAccessor((os_unfair_lock_s **)buf);
  if ((a4 & 0x20008000) != 0) {
    goto LABEL_63;
  }
  as::server::ConstAudioSessionInfoAccessor::ConstAudioSessionInfoAccessor(v24, v9);
  int v30 = *(const void **)buf;
  if (*(void *)buf)
  {
    int v31 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8])
    {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf[8] + 8), 1uLL, memory_order_relaxed);
      as::server::ConstAudioSessionInfo::GetDefaultSubsessionRef(v30, &cf);
      std::__shared_weak_count::__release_shared[abi:ne180100](v31);
    }
    else
    {
      as::server::ConstAudioSessionInfo::GetDefaultSubsessionRef(*(CFTypeRef *)buf, &cf);
    }
    if (as::server::IsSessionActive((as::server *)cf, 0))
    {
      v13[2](v13, 0);
      int v35 = 1;
    }
    else
    {
      int v35 = 0;
    }
    if (cf) {
      CFRelease(cf);
    }
  }
  else
  {
    id v34 = BuildInvalidSessionError((as::server *)"-[AVAudioSessionRemoteXPCClient activateSession:options:deviceInfo:requestID:reply:]", (int)v9);
    ((void (**)(void, void *))v13)[2](v13, v34);

    int v35 = 1;
  }
  uint64_t v24 = *(as::server::ConstAudioSessionInfoAccessor **)&buf[8];
  if (*(void *)&buf[8]) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
  }
  if (!v35)
  {
LABEL_63:
    if (HIDWORD(v21))
    {
      uint64_t v25 = *(id *)as::server::gSessionServerLog(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "AVAudioSessionXPCServer.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 1633;
        __int16 v57 = 2048;
        unint64_t v58 = v21;
        __int16 v59 = 1024;
        int v60 = (int)v9;
        _os_log_impl(&dword_1CFE2A000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid AVAudioSessionSetActiveOptions value: %lu in activation for sessionID 0x%x", buf, 0x22u);
      }
    }
    as::server::ConstAudioSessionInfoAccessor::ConstAudioSessionInfoAccessor((as::server::ConstAudioSessionInfoAccessor *)&cf, v9);
    CFTypeRef v26 = cf;
    if (!cf) {
      goto LABEL_41;
    }
    __int16 v27 = v48;
    if (v48)
    {
      atomic_fetch_add_explicit(&v48->__shared_owners_, 1uLL, memory_order_relaxed);
      int v28 = *((_DWORD *)v26 + 23);
      std::__shared_weak_count::__release_shared[abi:ne180100](v27);
      if (v28 == 1935897189)
      {
        CFTypeRef v26 = cf;
        if (!cf)
        {
          uint64_t v29 = _os_crash();
          as::server::require_acq::AudioSessionServerSetClientPlayState(v29);
        }
        goto LABEL_32;
      }
    }
    else if (*((_DWORD *)cf + 23) == 1935897189)
    {
LABEL_32:
      id v32 = v48;
      if (v48)
      {
        atomic_fetch_add_explicit(&v48->__shared_owners_, 1uLL, memory_order_relaxed);
        id v33 = *((id *)v26 + 12);
        std::__shared_weak_count::__release_shared[abi:ne180100](v32);
      }
      else
      {
        id v33 = *((id *)v26 + 12);
      }
      if (objc_opt_respondsToSelector())
      {
        v36 = (as::server *)[v33 waitForConclaveLaunch];
        if ((v36 & 1) == 0)
        {
          uint64_t v37 = *(id *)as::server::gSessionServerLog(v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            *(void *)&uint8_t buf[4] = "AVAudioSessionXPCServer.mm";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 1647;
            __int16 v57 = 1024;
            LODWORD(v58) = v9;
            _os_log_impl(&dword_1CFE2A000, v37, OS_LOG_TYPE_ERROR, "%25s:%-5d Waiting for conclave launch timed out, sessionID 0x%x", buf, 0x18u);
          }
        }
      }
    }
LABEL_41:
    if (v48) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v48);
    }
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    audit_token_t v46 = v49;
    v42[2] = __84__AVAudioSessionRemoteXPCClient_activateSession_options_deviceInfo_requestID_reply___block_invoke;
    v42[3] = &unk_1E6875948;
    int v45 = (int)v9;
    v42[4] = self;
    unint64_t v44 = v21;
    uint64_t v43 = v13;
    uint64_t v38 = MEMORY[0x1D25E1DE0](v42);
    uint64_t v39 = (void *)v38;
    {
      if (v38)
      {
        as::OffloadActivationOffACQ(void)::enabled = _os_feature_enabled_impl();
      }
    }
    if (as::OffloadActivationOffACQ(void)::enabled)
    {
      v40 = as::server::GetActivationQueue((as::server *)v38);
      dispatch_async_and_wait(v40, v39);
    }
    else
    {
      v40 = as::server::GetAudioControlQueue((as::server *)v38);
      as::server::DispatchBlock(v40, v39, 1, (uint64_t)"-[AVAudioSessionRemoteXPCClient activateSession:options:deviceInfo:requestID:reply:]", (uint64_t)"AVAudioSessionXPCServer.mm", 1757, 0, 0);
    }
  }
LABEL_57:
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v50);
}

void __84__AVAudioSessionRemoteXPCClient_activateSession_options_deviceInfo_requestID_reply___block_invoke(uint64_t a1)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(unsigned int *)(a1 + 56);
  v10[0] = 1;
  int v11 = 3968;
  uint64_t v12 = v2;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  v3 = (gsl::details *)kdebug_trace();
  unint64_t v4 = *(void *)(a1 + 48);
  if (HIDWORD(v4))
  {
    id v16 = &unk_1F2687EB0;
    gsl::details::terminate(v3);
  }
  int v5 = as::server::ff_acq::AudioSessionServerActivateWithFlags(*(void **)(*(void *)(a1 + 32) + 72), (AudioSession *)*(unsigned int *)(a1 + 56), a1 + 60, v4);
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    v18[0] = @"Session activation failed";
    int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    if (v5 == 1768386162) {
      int v8 = 0;
    }
    else {
      int v8 = v5;
    }
    id v9 = [v6 errorWithDomain:*MEMORY[0x1E4F28760] code:v8 userInfo:v7];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v10);
}

- (void)addMXNotificationListener:(unsigned int)a3 notificationName:(id)a4 reply:(id)a5
{
  id v6 = *(as::server::LegacySessionManager **)&a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  int v8 = (as *)a4;
  id v9 = a5;
  v21[0] = 1;
  int v22 = 3852;
  uint64_t v23 = v6;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  kdebug_trace();
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient addMXNotificationListener:noti"
                                                          "ficationName:reply:]";
  *(void *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v9);
  id v10 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();

  memset(&v20, 0, sizeof(v20));
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection) {
    [(NSXPCConnection *)xpcConnection auditToken];
  }
  if (!VerifySessionOwnership(v6, &v20, 0))
  {
    id v16 = BuildInvalidSessionError((as::server *)"-[AVAudioSessionRemoteXPCClient addMXNotificationListener:notificationName:reply:]", (int)v6);
    ((void (**)(void, void *))v10)[2](v10, v16);
LABEL_11:

    goto LABEL_12;
  }
  IsStandardMXNotificationName = (as::server *)as::IsStandardMXNotificationName(v8, v12);
  if (IsStandardMXNotificationName)
  {
    uint64_t v15 = *(id *)as::server::gSessionServerLog(IsStandardMXNotificationName);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      int v30 = "AVAudioSessionXPCServer.mm";
      __int16 v31 = 1024;
      int v32 = 2068;
      __int16 v33 = 2112;
      id v34 = v8;
      _os_log_impl(&dword_1CFE2A000, v15, OS_LOG_TYPE_INFO, "%25s:%-5d Skipping registration of standard MXSession notification, %@", buf, 0x1Cu);
    }
    goto LABEL_7;
  }
  int v17 = as::server::AddMXNotificationListener(v6, &v20, (audit_token_t *)v8, v14);
  if (v17)
  {
    uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F28568];
    int v28 = @"Add MX notification listener failed";
    id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    id v16 = [v18 errorWithDomain:*MEMORY[0x1E4F28760] code:v17 userInfo:v19];

    ((void (**)(void, void *))v10)[2](v10, v16);
    goto LABEL_11;
  }
LABEL_7:
  v10[2](v10, 0);
LABEL_12:
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v21);
}

- (void)createSession:(unint64_t)a3 sourceAuditToken:(id *)a4 sourceSessionID:(unsigned int)a5 nameOrDeviceUID:(id)a6 clientProcessName:(id)a7 useCaseIdentifier:(unsigned int)a8 reply:(id)a9
{
  v71[1] = *MEMORY[0x1E4F143B8];
  id v49 = a6;
  id v50 = a7;
  id v15 = a9;
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient createSession:sourceAuditToken"
                                                          ":sourceSessionID:nameOrDeviceUID:clientProcessName:useCaseIdentifier:reply:]";
  *(void *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 30000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},unsigned int,NSObject  {objcproto13OS_xpc_object}* {__strong},unsigned int,unsigned int>((caulk::xpc::reply_watchdog_factory *)&self->_defaultReplyWatchdogFactory.mTimeoutHandler.__f_.__buf_.__lx[16], v15);
  int v51 = (void (**)(void, void, void, void, void, void))objc_claimAutoreleasedReturnValue();

  memset(&v63, 0, sizeof(v63));
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection) {
    [(NSXPCConnection *)xpcConnection auditToken];
  }
  audit_token_t atoken = v63;
  int v17 = (as::server *)audit_token_to_pid(&atoken);
  v56[0] = 1;
  int v57 = 3846;
  uint64_t v58 = (int)v17;
  uint64_t v59 = 0;
  uint64_t v60 = 0;
  uint64_t v61 = 0;
  uint64_t v18 = (as::server::LegacySessionManager *)kdebug_trace();
  if ((uint64_t)a3 <= 1886546284)
  {
    if ((uint64_t)a3 > 1668314225)
    {
      if (a3 == 1668314226)
      {
        int v19 = 1668314112;
        int v20 = 114;
      }
      else
      {
        if (a3 != 1718183795) {
          goto LABEL_50;
        }
        int v19 = 1718183680;
        int v20 = 115;
      }
    }
    else if (a3 == 1635088489)
    {
      int v19 = 1635088384;
      int v20 = 105;
    }
    else
    {
      if (a3 != 1635148646) {
        goto LABEL_50;
      }
      int v19 = 1635148544;
      int v20 = 102;
    }
  }
  else if ((uint64_t)a3 <= 1935897188)
  {
    if (a3 == 1886546285)
    {
      int v19 = 1886546176;
      int v20 = 109;
    }
    else
    {
      if (a3 != 1935830119) {
        goto LABEL_50;
      }
      int v20 = 103;
      int v19 = 1935830016;
    }
  }
  else
  {
    switch(a3)
    {
      case 0x73637265uLL:
        int v19 = 1935897088;
        int v20 = 101;
        break;
      case 0x7369646BuLL:
        int v19 = 1936286720;
        int v20 = 107;
        break;
      case 0x77686F3FuLL:
        int v19 = 2003332864;
        int v20 = 63;
        break;
      default:
LABEL_50:
        uint64_t v42 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v70 = *MEMORY[0x1E4F28568];
        v71[0] = @"Invalid session type";
        uint64_t v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:&v70 count:1];
        unint64_t v44 = [v42 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v43];

        ((void (**)(void, void *, void, void, void, void))v51)[2](v51, v44, 0, 0, 0, 0);
        goto LABEL_49;
    }
  }
  unint64_t v21 = as::server::LegacySessionManager::Instance(v18);
  int v22 = v19 | v20;
  if ((v19 | v20) != 0x73626C67)
  {
    uint64_t v26 = 0;
    uint64_t v27 = 0;
LABEL_29:
    int v28 = as::server::BundleIdentifierForPID(v17);
    uint64_t v53 = v26;
    uint64_t v54 = v27;
    if (v27) {
      atomic_fetch_add_explicit(&v27->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    as::server::LegacySessionManager::BuildCreationDescription((long long *)&v63, v22, v50, v28, &v53, v49, a8, (uint64_t)buf);
    if (v54) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v54);
    }
    if (v67)
    {
      uint64_t v29 = self->_clientProcess.xpcConnection;
      id WeakRetained = (void **)objc_loadWeakRetained((id *)&self->_server);
      as::server::LegacySessionManager::CreateSession((os_unfair_lock_s *)v21, (uint64_t)buf, v29, WeakRetained[8], &v52);
      int v32 = (std::__shared_weak_count *)*((void *)&v52 + 1);
      uint64_t v31 = v52;
      long long v52 = 0uLL;

      __int16 v33 = (as::server *)std::__optional_destruct_base<as::server::SessionCreationDescription,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)buf);
      if (v31)
      {
        uint64_t v34 = *(unsigned int *)(v31 + 8);
        if (v26) {
          uint64_t v35 = *(unsigned int *)(v26 + 8);
        }
        else {
          uint64_t v35 = 0;
        }
        v40 = (os_unfair_lock_s *)*((void *)v21 + 31);
        if (v40)
        {
          os_unfair_lock_lock(*((os_unfair_lock_t *)v21 + 31));
          uint64_t v41 = as::server::DeviceTimeObserver::xpcSharedMemoryObject((as::server::DeviceTimeObserver *)&v40[2]);
          ((void (**)(void, void, uint64_t, void *, void, uint64_t))v51)[2](v51, 0, v34, v41, *(unsigned int *)(v31 + 536), v35);

          os_unfair_lock_unlock(v40);
        }
        else
        {
          v51[2](v51, 0, *(unsigned int *)(v31 + 8), 0, 0, v35);
        }
LABEL_45:

        if (v27) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v27);
        }
        if (v32) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v32);
        }
        goto LABEL_49;
      }
    }
    else
    {
      __int16 v33 = (as::server *)std::__optional_destruct_base<as::server::SessionCreationDescription,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)buf);
      int v32 = 0;
    }
    v36 = *(id *)as::server::gSessionServerLog(v33);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "AVAudioSessionXPCServer.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1144;
      _os_log_impl(&dword_1CFE2A000, v36, OS_LOG_TYPE_ERROR, "%25s:%-5d Session creation failed", buf, 0x12u);
    }
    uint64_t v37 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v64 = *MEMORY[0x1E4F28568];
    long long v65 = @"Session creation failed in server";
    uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
    uint64_t v39 = [v37 errorWithDomain:*MEMORY[0x1E4F28760] code:2003329396 userInfo:v38];

    ((void (**)(void, void *, void, void, void, void))v51)[2](v51, v39, 0, 0, 0, 0);
    goto LABEL_45;
  }
  if (a5 != -1
    || (long long v23 = *(_OWORD *)&a4->var0[4],
        *(_OWORD *)v55.val = *(_OWORD *)a4->var0,
        *(_OWORD *)&v55.val[4] = v23,
        uint64_t v24 = (as::server *)audit_token_to_pid(&v55),
        v24 != -1))
  {
    uint64_t v25 = (void **)objc_loadWeakRetained((id *)&self->_server);
    as::server::LegacySessionManager::FindSourceSessionForSibling((os_unfair_lock_s *)v21, (uint64_t)a4, a5, v25[8], buf);
    uint64_t v26 = *(void *)buf;
    uint64_t v27 = *(std::__shared_weak_count **)&buf[8];
    *(void *)buf = 0;
    *(void *)&buf[8] = 0;

    goto LABEL_29;
  }
  int v45 = *(id *)as::server::gSessionServerLog(v24);
  if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "AVAudioSessionXPCServer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1089;
    _os_log_impl(&dword_1CFE2A000, v45, OS_LOG_TYPE_ERROR, "%25s:%-5d Session creation failed due to AVAudioSessionTokenNoAudioSessionForServer and invalid audit token", buf, 0x12u);
  }
  audit_token_t v46 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v68 = *MEMORY[0x1E4F28568];
  v69 = @"Session creation failed in server";
  v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v69 forKeys:&v68 count:1];
  int v48 = [v46 errorWithDomain:*MEMORY[0x1E4F28760] code:2003329396 userInfo:v47];

  ((void (**)(void, void *, void, void, void, void))v51)[2](v51, v48, 0, 0, 0, 0);
LABEL_49:
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v56);
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = *(id *)as::server::gSessionServerLog((as::server *)self);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v6 = "AVAudioSessionXPCServer.mm";
    __int16 v7 = 1024;
    int v8 = 739;
    __int16 v9 = 2048;
    id v10 = self;
    _os_log_impl(&dword_1CFE2A000, v3, OS_LOG_TYPE_INFO, "%25s:%-5d Deallocated connection %p", buf, 0x1Cu);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVAudioSessionRemoteXPCClient;
  [(AVAudioSessionRemoteXPCClient *)&v4 dealloc];
}

- (void)pingWithReply:(id)a3
{
}

- (void)sleepWithReply:(unsigned int)a3 reply:(id)a4
{
  id v6 = a4;
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient sleepWithReply:reply:]";
  *(void *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},NSString * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v6);
  __int16 v7 = (void (**)(id, void, __CFString *))objc_claimAutoreleasedReturnValue();

  sleep(a3);
  v7[2](v7, 0, &stru_1F2688808);
}

- (void)invalidate
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = self->_clientProcess.xpcConnection;
  id WeakRetained = (as::server *)objc_loadWeakRetained((id *)&self->_server);
  int v5 = WeakRetained;
  if (!v3)
  {
    uint64_t v9 = _os_crash();
    as::server::require_acq::AudioSessionServerSetClientPlayState(v9);
  }
  id v6 = *(id *)as::server::gSessionServerLog(WeakRetained);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    int v10 = 136315906;
    uint64_t v11 = "AVAudioSessionXPCServer.mm";
    __int16 v12 = 1024;
    int v13 = 760;
    __int16 v14 = 2112;
    id v15 = v3;
    __int16 v16 = 2048;
    int v17 = self;
    _os_log_impl(&dword_1CFE2A000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Invalidated connection: %@ (%p)", (uint8_t *)&v10, 0x26u);
  }
  LOBYTE(self->_clientRelay) = 1;
  if (v5)
  {
    int v8 = (os_unfair_lock_s *)as::server::LegacySessionManager::Instance((as::server::LegacySessionManager *)v7);
    as::server::LegacySessionManager::RemoveSessionsForInvalidatedXPCConnection(v8, v3);
    as::server::LegacySessionManager::RemoveApplicationForInvalidatedXPCConnection((as::server::LegacySessionManager *)v8, v3);
    [(as::server *)v5 removeConnection:v3];
  }
}

- (id)clientRelay
{
  return *(id *)&self->_clientProcess.mProcessName.__r_.var0;
}

- (void)createProxySession:(unsigned int)a3 reply:(id)a4
{
  id v6 = a4;
  v15[0] = 1;
  int v16 = 3842;
  uint64_t v17 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  kdebug_trace();
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient createProxySession:reply:]";
  *(void *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v6);
  BOOL v7 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();

  uint64_t v9 = (os_unfair_lock_s *)as::server::LegacySessionManager::Instance(v8);
  memset(&v14, 0, sizeof(v14));
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection) {
    [(NSXPCConnection *)xpcConnection auditToken];
  }
  as::server::LegacySessionManager::FindSessionAndVerifyOwnership(v9, &v14, a3, 1, &v12);
  if (v12)
  {
    v7[2](v7, 0);
  }
  else
  {
    uint64_t v11 = BuildInvalidSessionError((as::server *)"-[AVAudioSessionRemoteXPCClient createProxySession:reply:]", a3);
    ((void (**)(void, void *))v7)[2](v7, v11);
  }
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v15);
}

- (void)verifySessionExists:(unsigned int)a3 reply:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v18[0] = 1;
  int v19 = 3844;
  uint64_t v20 = a3;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  kdebug_trace();
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient verifySessionExists:reply:]";
  *(void *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},BOOL>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v6);
  BOOL v7 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();

  uint64_t v9 = (os_unfair_lock_s *)as::server::LegacySessionManager::Instance(v8);
  memset(&v17, 0, sizeof(v17));
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection) {
    [(NSXPCConnection *)xpcConnection auditToken];
  }
  as::server::LegacySessionManager::FindSessionAndVerifyOwnership(v9, &v17, a3, 1, &v15);
  uint64_t v11 = v15;
  int v13 = *(id *)as::server::gSessionServerLog(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    audit_token_t v14 = "failed";
    *(_DWORD *)buf = 136315906;
    uint64_t v25 = "AVAudioSessionXPCServer.mm";
    int v27 = 1014;
    __int16 v26 = 1024;
    if (v11) {
      audit_token_t v14 = "succeeded";
    }
    __int16 v28 = 1024;
    unsigned int v29 = a3;
    __int16 v30 = 2080;
    uint64_t v31 = v14;
    _os_log_impl(&dword_1CFE2A000, v13, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Look up of session ID 0x%x %s", buf, 0x22u);
  }
  ((void (**)(void, void, BOOL))v7)[2](v7, 0, v11 != 0);
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v18);
}

- (void)simulatePrimarySessionCreationInsideServerWithReply:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  objc_super v4 = (as::server::LegacySessionManager *)a3;
  int v5 = as::server::LegacySessionManager::Instance(v4);
  memset(&v14, 0, sizeof(v14));
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection) {
    [(NSXPCConnection *)xpcConnection auditToken];
  }
  audit_token_t buf = v14;
  char v19 = 1;
  audit_token_t atoken = v14;
  pid_t v20 = audit_token_to_pid(&atoken);
  as::server::LegacySessionManager::FindOrCreatePrimarySession((uint64_t)v5, (uint64_t)&buf, 0, (void *)self->_clientProcess.mProcessName.var0, 1, (uint64_t)&v12);
  if (v12)
  {
    (*((void (**)(as::server::LegacySessionManager *, void, void))v4 + 2))(v4, 0, *(unsigned int *)(v12 + 8));
  }
  else
  {
    int v8 = *(id *)as::server::gSessionServerLog(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      buf.val[0] = 136315394;
      *(void *)&buf.val[1] = "AVAudioSessionXPCServer.mm";
      LOWORD(buf.val[3]) = 1024;
      *(unsigned int *)((char *)&buf.val[3] + 2) = 1034;
      _os_log_impl(&dword_1CFE2A000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d Session creation failed", (uint8_t *)&buf, 0x12u);
    }
    uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F28568];
    audit_token_t v17 = @"Session creation failed in server";
    int v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    uint64_t v11 = [v9 errorWithDomain:*MEMORY[0x1E4F28760] code:2003329396 userInfo:v10];

    (*((void (**)(as::server::LegacySessionManager *, void *, void))v4 + 2))(v4, v11, 0);
  }
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
}

- (void)destroySession:(unsigned int)a3 reply:(id)a4
{
  id v5 = a4;
  kdebug_trace();
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient destroySession:reply:]";
  *(void *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v5);
  objc_claimAutoreleasedReturnValue();

  as::server::LegacySessionManager::Instance(v6);
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection) {
    [(NSXPCConnection *)xpcConnection auditToken];
  }
  operator new();
}

void __54__AVAudioSessionRemoteXPCClient_destroySession_reply___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 40);
  v5[0] = 1;
  int v6 = 3972;
  uint64_t v7 = v2;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  kdebug_trace();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    objc_super v4 = *(std::__shared_weak_count **)(v3 + 8);
    if (v4) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
    MEMORY[0x1D25E1860](v3, 0x20C40A4A59CD2);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v5);
}

void __101__AVAudioSessionRemoteXPCClient_setProperties_values_MXProperties_batchStrategy_genericMXPipe_reply___block_invoke_191(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v14 != v4) {
          objc_enumerationMutation(v2);
        }
        int v6 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v7 = (AudioSession *)*(unsigned int *)(a1 + 48);
        uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v6, (void)v13);
        int v9 = as::server::require_acq::SetPropertyLocal(v7, a1 + 52, v6, v8);

        if (v9)
        {
          uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v17 = *MEMORY[0x1E4F28568];
          uint64_t v18 = @"AudioSessionSetPropertyLocal error";
          uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
          uint64_t v12 = [v10 errorWithDomain:*MEMORY[0x1E4F28760] code:v9 userInfo:v11];

          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v19 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)silenceOutput:(unsigned int)a3 options:(unint64_t)a4 reply:(id)a5
{
  id v8 = a5;
  v17[0] = 1;
  int v18 = 3854;
  uint64_t v19 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  kdebug_trace();
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient silenceOutput:options:reply:]";
  *(void *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  int v9 = caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v8);

  uint64_t v11 = as::server::GetAudioControlQueue(v10);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__AVAudioSessionRemoteXPCClient_silenceOutput_options_reply___block_invoke;
  v13[3] = &unk_1E68758F8;
  unsigned int v16 = a3;
  unint64_t v15 = a4;
  id v12 = v9;
  id v14 = v12;
  as::server::DispatchBlock(v11, v13, 1, (uint64_t)"-[AVAudioSessionRemoteXPCClient silenceOutput:options:reply:]", (uint64_t)"AVAudioSessionXPCServer.mm", 1341, 0, 0);

  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v17);
}

void __61__AVAudioSessionRemoteXPCClient_silenceOutput_options_reply___block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(unsigned int *)(a1 + 48);
  LOBYTE(v7) = 1;
  HIDWORD(v7) = 3973;
  uint64_t v8 = v2;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  kdebug_trace();
  int v3 = as::server::require_acq::AudioSessionSilenceOutput((as::server::require_acq *)*(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 40));
  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28568];
    v13[0] = @"AudioSessionSilenceOutput error";
    id v5 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1, v7, v8, v9, v10, v11);
    int v6 = [v4 errorWithDomain:*MEMORY[0x1E4F28760] code:v3 userInfo:v5];
  }
  else
  {
    int v6 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)&v7);
}

- (void)getIOControllerPeriod:(unsigned int)a3 decoupledInput:(BOOL)a4 reply:(id)a5
{
  BOOL v5 = a4;
  v26[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  v19[0] = 1;
  int v20 = 3855;
  uint64_t v21 = a3;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  kdebug_trace();
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient getIOControllerPeriod:decoupledInput:reply:]";
  *(void *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},double,unsigned long>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v8);
  uint64_t v9 = (void (**)(void, void, void, double))objc_claimAutoreleasedReturnValue();

  uint64_t v11 = as::server::LegacySessionManager::Instance(v10);
  uint64_t v12 = (os_unfair_lock_s *)*((void *)v11 + 31);
  if (!v12)
  {
    uint64_t v13 = -1;
LABEL_6:
    id v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F28568];
    v26[0] = @"sessionDeviceIOPeriod error";
    unint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    unsigned int v16 = [v14 errorWithDomain:*MEMORY[0x1E4F28760] code:v13 userInfo:v15];

    ((void (**)(void, void *, void, double))v9)[2](v9, v16, 0, 0.0);
    goto LABEL_7;
  }
  os_unfair_lock_lock(*((os_unfair_lock_t *)v11 + 31));
  as::server::DeviceTimeObserver::sessionDeviceIOPeriod((as::server::DeviceTimeObserver *)&v12[2], a3, v5, (uint64_t)v17);
  os_unfair_lock_unlock(v12);
  if (!v18)
  {
    uint64_t v13 = SLODWORD(v17[0]);
    goto LABEL_6;
  }
  v9[2](v9, 0, *(void *)&v17[2], v17[0]);
LABEL_7:
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v19);
}

- (void)setSession:(unsigned int)a3 decoupledInput:(BOOL)a4 hasIOEventListeners:(BOOL)a5 reply:(id)a6
{
  BOOL v7 = a4;
  id v8 = *(as::server::LegacySessionManager **)&a3;
  id v10 = a6;
  v18[0] = 1;
  int v19 = 3856;
  uint64_t v20 = v8;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  kdebug_trace();
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient setSession:decoupledInput:hasI"
                                                          "OEventListeners:reply:]";
  *(void *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v10);
  uint64_t v11 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();

  memset(&v17, 0, sizeof(v17));
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection) {
    [(NSXPCConnection *)xpcConnection auditToken];
  }
  BOOL v13 = VerifySessionOwnership(v8, &v17, 0);
  if (v13)
  {
    id v14 = as::server::LegacySessionManager::Instance((as::server::LegacySessionManager *)v13);
    unint64_t v15 = (os_unfair_lock_s *)*((void *)v14 + 31);
    if (v15)
    {
      os_unfair_lock_lock(*((os_unfair_lock_t *)v14 + 31));
      as::server::DeviceTimeObserver::sessionHasIOEventListeners((as::server::DeviceTimeObserver *)&v15[2], v8, v7, a5);
      os_unfair_lock_unlock(v15);
    }
    v11[2](v11, 0);
  }
  else
  {
    unsigned int v16 = BuildInvalidSessionError((as::server *)"-[AVAudioSessionRemoteXPCClient setSession:decoupledInput:hasIOEventListeners:reply:]", (int)v8);
    ((void (**)(void, void *))v11)[2](v11, v16);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v18);
}

- (void)getSpatialPreferencesForSession:(unsigned int)a3 reply:(id)a4
{
  uint64_t v4 = *(as::server::LegacySessionManager **)&a3;
  id v6 = a4;
  v11[0] = 1;
  int v12 = 3857;
  uint64_t v13 = v4;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  kdebug_trace();
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient getSpatialPreferencesForSession:reply:]";
  *(void *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},AVAudioSessionSpatialPreferences * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v6);
  BOOL v7 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();

  memset(&v10, 0, sizeof(v10));
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection) {
    [(NSXPCConnection *)xpcConnection auditToken];
  }
  if (VerifySessionOwnership(v4, &v10, 1))
  {
    uint64_t v9 = as::server::forbid_acq::SpatialPreferences((void *)self->_clientProcess.mProcessName.var0, (uint64_t)v4, &v10);
    ((void (**)(void, void, void *))v7)[2](v7, 0, v9);
  }
  else
  {
    uint64_t v9 = BuildInvalidSessionError((as::server *)"-[AVAudioSessionRemoteXPCClient getSpatialPreferencesForSession:reply:]", (int)v4);
    ((void (**)(void, void *, void))v7)[2](v7, v9, 0);
  }

  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v11);
}

- (void)handleRemoteInterruption:(unsigned int)a3 interruptionStatus:(id)a4 postInterruptionNotification:(BOOL)a5 reply:(id)a6
{
  BOOL v7 = *(as::server::LegacySessionManager **)&a3;
  v37[1] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a6;
  v30[0] = 1;
  int v31 = 3858;
  uint64_t v32 = v7;
  uint64_t v33 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  kdebug_trace();
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient handleRemoteInterruption:inter"
                                                          "ruptionStatus:postInterruptionNotification:reply:]";
  *(void *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v10);
  uint64_t v11 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();

  memset(&v29, 0, sizeof(v29));
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection) {
    [(NSXPCConnection *)xpcConnection auditToken];
  }
  if (VerifySessionOwnership(v7, &v29, 1))
  {
    as::server::ConstAudioSessionInfoAccessor::ConstAudioSessionInfoAccessor((as::server::ConstAudioSessionInfoAccessor *)&v27, v7);
    uint64_t v13 = v27;
    if (v27)
    {
      uint64_t v14 = v28;
      if (v28)
      {
        atomic_fetch_add_explicit(&v28->__shared_owners_, 1uLL, memory_order_relaxed);
        as::server::ConstAudioSessionInfo::GetDefaultSubsessionRef(v13, &cf);
        std::__shared_weak_count::__release_shared[abi:ne180100](v14);
      }
      else
      {
        as::server::ConstAudioSessionInfo::GetDefaultSubsessionRef(v27, &cf);
      }
      uint64_t v17 = MXSessionEndInterruption_WithInterruptionNotification();
      if (v17)
      {
        char v18 = v27;
        if (!v27)
        {
          uint64_t v24 = _os_crash();
          as::server::require_acq::AudioSessionServerSetClientPlayState(v24);
        }
        int v19 = v28;
        if (v28) {
          atomic_fetch_add_explicit(&v28->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        if (*((char *)v18 + 223) < 0) {
          std::string::__init_copy_ctor_external(&v25, *((const std::string::value_type **)v18 + 25), *((void *)v18 + 26));
        }
        else {
          std::string v25 = *(std::string *)((char *)v18 + 200);
        }
        if (v19) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v19);
        }
        int v20 = as::server::TranslateCMSessionErrorCode((uint64_t)"MXSessionEndInterruption_WithInterruptionNotification", (uint64_t *)&v25, 1456, v17);
        uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v36 = *MEMORY[0x1E4F28568];
        v37[0] = @"handling remote interruption failed";
        uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
        uint64_t v23 = [v21 errorWithDomain:*MEMORY[0x1E4F28760] code:v20 userInfo:v22];

        ((void (**)(void, void *))v11)[2](v11, v23);
        if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v25.__r_.__value_.__l.__data_);
        }
      }
      else
      {
        v11[2](v11, 0);
      }
      if (cf) {
        CFRelease(cf);
      }
    }
    else
    {
      uint64_t v16 = BuildInvalidSessionError((as::server *)"-[AVAudioSessionRemoteXPCClient handleRemoteInterruption:interruptionStatus:postInterruptionNotification:reply:]", (int)v7);
      ((void (**)(void, void *))v11)[2](v11, v16);
    }
    if (v28) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v28);
    }
  }
  else
  {
    uint64_t v15 = BuildInvalidSessionError((as::server *)"-[AVAudioSessionRemoteXPCClient handleRemoteInterruption:interruptionStatus:postInterruptionNotification:reply:]", (int)v7);
    ((void (**)(void, void *))v11)[2](v11, v15);
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v30);
}

- (void)setSessionPlayState:(unsigned int)a3 playState:(unsigned int)a4 playerType:(unsigned int)a5 playerRef:(id)a6 modes:(unsigned int)a7 reply:(id)a8
{
  id v13 = a6;
  id v14 = a8;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __96__AVAudioSessionRemoteXPCClient_setSessionPlayState_playState_playerType_playerRef_modes_reply___block_invoke;
  v19[3] = &unk_1E6875920;
  id v15 = v13;
  id v20 = v15;
  unsigned int v22 = a3;
  unsigned int v23 = a5;
  unsigned int v24 = a7;
  unsigned int v25 = a4;
  id v16 = v14;
  id v21 = v16;
  uint64_t v17 = (as::server *)MEMORY[0x1D25E1DE0](v19);
  char v18 = as::server::GetAudioControlQueue(v17);
  as::server::DispatchBlock(v18, v17, 1, (uint64_t)"-[AVAudioSessionRemoteXPCClient setSessionPlayState:playState:playerType:playerRef:modes:reply:]", (uint64_t)"AVAudioSessionXPCServer.mm", 1490, 0, 0);
}

void __96__AVAudioSessionRemoteXPCClient_setSessionPlayState_playState_playerType_playerRef_modes_reply___block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  int v7 = 0;
  uint64_t v6 = 0;
  int v2 = as::server::require_acq::AudioSessionServerSetClientPlayState((AudioSession *)*(unsigned int *)(a1 + 48), *(_DWORD *)(a1 + 52), (AudioSession *)[*(id *)(a1 + 32) UTF8String], *(_DWORD *)(a1 + 56), *(_DWORD *)(a1 + 60), (char *)&v6, 0);
  if (v2)
  {
    int v3 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F28568];
    v9[0] = @"Setting Play State Failed";
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    BOOL v5 = [v3 errorWithDomain:*MEMORY[0x1E4F28760] code:v2 userInfo:v4];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)deactivateSession:(unsigned int)a3 options:(unint64_t)a4 priority:(id)a5 requestID:(unint64_t)a6 reply:(id)a7
{
  id v9 = *(as::server::LegacySessionManager **)&a3;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a7;
  v34[0] = 1;
  int v35 = 3841;
  uint64_t v36 = v9;
  uint64_t v37 = 0;
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  kdebug_trace();
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient deactivateSession:options:prio"
                                                          "rity:requestID:reply:]";
  *(void *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v12);
  id v13 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();

  memset(&v33, 0, sizeof(v33));
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection) {
    [(NSXPCConnection *)xpcConnection auditToken];
  }
  BOOL v15 = VerifySessionOwnership(v9, &v33, 1);
  if (!v15)
  {
    char v18 = BuildInvalidSessionError((as::server *)"-[AVAudioSessionRemoteXPCClient deactivateSession:options:priority:requestID:reply:]", (int)v9);
    ((void (**)(void, void *))v13)[2](v13, v18);
LABEL_29:

    goto LABEL_30;
  }
  if (a4 || v11)
  {
    if (!HIDWORD(a4)) {
      goto LABEL_24;
    }
    int v19 = *(id *)as::server::gSessionServerLog((as::server *)v15);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)audit_token_t buf = 136315906;
      *(void *)&uint8_t buf[4] = "AVAudioSessionXPCServer.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1835;
      __int16 v41 = 2048;
      unint64_t v42 = a4;
      __int16 v43 = 1024;
      int v44 = (int)v9;
      _os_log_impl(&dword_1CFE2A000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid AVAudioSessionSetActiveOptions value: %lu in deactivation for sessionID: 0x%x. Clearing options to 0.", buf, 0x22u);
    }
LABEL_23:
    a4 = 0;
LABEL_24:
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __84__AVAudioSessionRemoteXPCClient_deactivateSession_options_priority_requestID_reply___block_invoke;
    v25[3] = &unk_1E6875970;
    int v30 = (int)v9;
    id v26 = v11;
    int v27 = self;
    audit_token_t v31 = v33;
    unint64_t v29 = a4;
    __int16 v28 = v13;
    uint64_t v22 = MEMORY[0x1D25E1DE0](v25);
    unsigned int v23 = (void *)v22;
    {
      if (v22)
      {
        as::OffloadActivationOffACQ(void)::enabled = _os_feature_enabled_impl();
      }
    }
    if (as::OffloadActivationOffACQ(void)::enabled)
    {
      unsigned int v24 = as::server::GetActivationQueue((as::server *)v22);
      dispatch_async_and_wait(v24, v23);
    }
    else
    {
      unsigned int v24 = as::server::GetAudioControlQueue((as::server *)v22);
      as::server::DispatchBlock(v24, v23, 1, (uint64_t)"-[AVAudioSessionRemoteXPCClient deactivateSession:options:priority:requestID:reply:]", (uint64_t)"AVAudioSessionXPCServer.mm", 1863, 0, 0);
    }

    char v18 = v26;
    goto LABEL_29;
  }
  as::server::ConstAudioSessionInfoAccessor::ConstAudioSessionInfoAccessor((as::server::ConstAudioSessionInfoAccessor *)buf, v9);
  id v16 = *(const void **)buf;
  if (*(void *)buf)
  {
    uint64_t v17 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8])
    {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf[8] + 8), 1uLL, memory_order_relaxed);
      as::server::ConstAudioSessionInfo::GetDefaultSubsessionRef(v16, &cf);
      std::__shared_weak_count::__release_shared[abi:ne180100](v17);
    }
    else
    {
      as::server::ConstAudioSessionInfo::GetDefaultSubsessionRef(*(CFTypeRef *)buf, &cf);
    }
    if (as::server::IsSessionActive((as::server *)cf, (const void *)1))
    {
      int v21 = 0;
    }
    else
    {
      v13[2](v13, 0);
      int v21 = 1;
    }
    if (cf) {
      CFRelease(cf);
    }
  }
  else
  {
    id v20 = BuildInvalidSessionError((as::server *)"-[AVAudioSessionRemoteXPCClient deactivateSession:options:priority:requestID:reply:]", (int)v9);
    ((void (**)(void, void *))v13)[2](v13, v20);

    int v21 = 1;
  }
  if (*(void *)&buf[8]) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
  }
  if (!v21) {
    goto LABEL_23;
  }
LABEL_30:
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v34);
}

void __84__AVAudioSessionRemoteXPCClient_deactivateSession_options_priority_requestID_reply___block_invoke(uint64_t a1)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(unsigned int *)(a1 + 64);
  v10[0] = 1;
  int v11 = 3969;
  uint64_t v12 = v2;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  kdebug_trace();
  int v3 = *(void **)(a1 + 32);
  if (v3)
  {
    int v4 = as::server::ff_acq::AudioSessionServerDeactivateAndSetPriority(*(void **)(*(void *)(a1 + 40) + 72), *(unsigned int *)(a1 + 64), (as::server::AudioSessionInfoAccessor *)(a1 + 68), [v3 unsignedIntValue]);
  }
  else
  {
    unint64_t v5 = *(void *)(a1 + 56);
    if (HIDWORD(v5))
    {
      id v16 = &unk_1F2687EB0;
      gsl::details::terminate(0);
    }
    int v4 = as::server::ff_acq::AudioSessionServerDeactivateWithFlags(*(void **)(*(void *)(a1 + 40) + 72), *(unsigned int *)(a1 + 64), (as::server::AudioSessionInfoAccessor *)(a1 + 68), v5);
  }
  int v6 = v4;
  if (v4)
  {
    int v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    v18[0] = @"Session deactivation failed";
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    id v9 = [v7 errorWithDomain:*MEMORY[0x1E4F28760] code:v6 userInfo:v8];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v10);
}

- (void)updateMicrophonePermission:(int64_t)a3 reply:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  memset(&v23, 0, sizeof(v23));
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection) {
    [(NSXPCConnection *)xpcConnection auditToken];
  }
  audit_token_t atoken = v23;
  pid_t v8 = audit_token_to_pid(&atoken);
  v16[0] = 1;
  int v17 = 3844;
  uint64_t v18 = v8;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  kdebug_trace();
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient updateMicrophonePermission:reply:]";
  *(void *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v6);
  id v9 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();

  if (!self->_clientProcess.mProcessName.var0)
  {
    uint64_t v15 = _os_crash();
    as::server::require_acq::AudioSessionServerSetClientPlayState(v15);
  }
  int v11 = *(id *)as::server::gSessionServerLog(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)audit_token_t buf = 136315650;
    int v27 = "AVAudioSessionXPCServer.mm";
    __int16 v28 = 1024;
    int v29 = 2028;
    __int16 v30 = 1024;
    pid_t v31 = v8;
    _os_log_impl(&dword_1CFE2A000, v11, OS_LOG_TYPE_INFO, "%25s:%-5d Calling out to AudioToolbox to update microphone permission for client process %d", buf, 0x18u);
  }
  if (a3 == 1768843892)
  {
    uint64_t v12 = 0;
    [self->_clientProcess.mProcessName.var0 refreshMicrophoneInjectionPermissions:&v23];
  }
  else if (a3 == 1919119972)
  {
    uint64_t v12 = 0;
    [self->_clientProcess.mProcessName.var0 refreshRecordPermissions:&v23];
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    unsigned int v25 = @"Invalid permission type";
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    uint64_t v12 = [v13 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v14];
  }
  ((void (**)(void, void *))v9)[2](v9, v12);

  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v16);
}

- (void)removeMXNotificationListener:(unsigned int)a3 notificationName:(id)a4 reply:(id)a5
{
  id v6 = *(as::server::LegacySessionManager **)&a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  pid_t v8 = (as *)a4;
  id v9 = a5;
  v21[0] = 1;
  int v22 = 3853;
  uint64_t v23 = v6;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  kdebug_trace();
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient removeMXNotificationListener:n"
                                                          "otificationName:reply:]";
  *(void *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v9);
  id v10 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();

  memset(&v20, 0, sizeof(v20));
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection) {
    [(NSXPCConnection *)xpcConnection auditToken];
  }
  if (!VerifySessionOwnership(v6, &v20, 0))
  {
    id v16 = BuildInvalidSessionError((as::server *)"-[AVAudioSessionRemoteXPCClient removeMXNotificationListener:notificationName:reply:]", (int)v6);
    ((void (**)(void, void *))v10)[2](v10, v16);
LABEL_11:

    goto LABEL_12;
  }
  IsStandardMXNotificationName = (as::server *)as::IsStandardMXNotificationName(v8, v12);
  if (IsStandardMXNotificationName)
  {
    uint64_t v15 = *(id *)as::server::gSessionServerLog(IsStandardMXNotificationName);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)audit_token_t buf = 136315650;
      __int16 v30 = "AVAudioSessionXPCServer.mm";
      __int16 v31 = 1024;
      int v32 = 2115;
      __int16 v33 = 2112;
      uint64_t v34 = v8;
      _os_log_impl(&dword_1CFE2A000, v15, OS_LOG_TYPE_INFO, "%25s:%-5d Skipping deregistration of standard MXSession notification, %@", buf, 0x1Cu);
    }
    goto LABEL_7;
  }
  int v17 = as::server::RemoveMXNotificationListener(v6, &v20, (audit_token_t *)v8, v14);
  if (v17)
  {
    uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F28568];
    __int16 v28 = @"Remove MX notification listener failed";
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    id v16 = [v18 errorWithDomain:*MEMORY[0x1E4F28760] code:v17 userInfo:v19];

    ((void (**)(void, void *))v10)[2](v10, v16);
    goto LABEL_11;
  }
LABEL_7:
  v10[2](v10, 0);
LABEL_12:
  as::ScopedTrace::~ScopedTrace((as::ScopedTrace *)v21);
}

- (void)createAudioApplicationForSpecification:(id)a3 reply:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient createAudioApplicationForSpeci"
                                                          "fication:reply:]";
  *(void *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},unsigned int>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v7);
  pid_t v8 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();

  memset(&v25[1], 0, sizeof(audit_token_t));
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection) {
    xpcConnection = (NSXPCConnection *)[(NSXPCConnection *)xpcConnection auditToken];
  }
  id v10 = (os_unfair_lock_s *)as::server::LegacySessionManager::Instance((as::server::LegacySessionManager *)xpcConnection);
  if (v6) {
    [v6 appAuditToken];
  }
  else {
    memset(v25, 0, 32);
  }
  *(audit_token_t *)__int16 v28 = v25[0];
  v28[32] = 1;
  audit_token_t v22 = v25[0];
  *(_DWORD *)&v28[36] = audit_token_to_pid(&v22);
  audit_token_t v22 = v25[1];
  char v23 = 1;
  audit_token_t atoken = v25[1];
  pid_t v24 = audit_token_to_pid(&atoken);
  if (as::server::LegacySessionManager::VerifyAudioAppPermission((as::server::LegacySessionManager *)v10, (const as::server::ProcessIdentity *)v28, (const as::server::ProcessIdentity *)&v22, 1))
  {
    *(void *)__int16 v28 = [v6 attributionBundleID];
    int v11 = [v6 processName];
    if (v11)
    {
      uint64_t v12 = [v6 processName];
    }
    else
    {
      uint64_t v12 = @"?";
    }
    *(void *)&v28[8] = v12;
    *(audit_token_t *)&v28[16] = v25[1];
    char v29 = 1;
    audit_token_t v22 = v25[1];
    pid_t v30 = audit_token_to_pid(&v22);
    if (v6) {
      [v6 appAuditToken];
    }
    else {
      memset(&atoken, 0, sizeof(atoken));
    }
    audit_token_t v31 = atoken;
    char v32 = 1;
    audit_token_t v22 = atoken;
    pid_t v33 = audit_token_to_pid(&v22);
    uint64_t v34 = [v6 audioAppType];
    if (v11) {

    }
    as::server::LegacySessionManager::CreateAudioApplication(v10, (uint64_t)v28, self->_clientProcess.xpcConnection, (uint64_t)&v22);
    if (*(void *)v22.val && *(void *)&v22.val[4])
    {
      v8[2](v8, 0, *(unsigned int *)(*(void *)&v22.val[4] + 8));
    }
    else
    {
      uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v26 = *MEMORY[0x1E4F28568];
      uint64_t v27 = @"AudioApp creation failed";
      audit_token_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      uint64_t v21 = [v19 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v20];

      ((void (**)(void, void *, void))v8)[2](v8, v21, 0);
    }
    if (*(void *)&v22.val[6]) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&v22.val[6]);
    }
    if (*(void *)&v22.val[2]) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&v22.val[2]);
    }
  }
  else
  {
    if (v6) {
      [v6 appAuditToken];
    }
    else {
      memset(&v22, 0, sizeof(v22));
    }
    *(audit_token_t *)__int16 v28 = v22;
    uint64_t v13 = (as::server *)audit_token_to_pid((audit_token_t *)v28);
    int v14 = (int)v13;
    uint64_t v15 = *(id *)as::server::gSessionServerLog(v13);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int16 v28 = 136315906;
      *(void *)&v28[4] = "AVAudioSessionXPCServer.mm";
      *(_WORD *)&v28[12] = 1024;
      *(_DWORD *)&v28[14] = 1514;
      *(_WORD *)&v28[18] = 2080;
      *(void *)&v28[20] = "-[AVAudioSessionRemoteXPCClient createAudioApplicationForSpecification:reply:]";
      *(_WORD *)&v28[28] = 1024;
      *(_DWORD *)&v28[30] = v14;
      _os_log_impl(&dword_1CFE2A000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d %s failed due to audio application (pid: %d) entitlement check failure", v28, 0x22u);
    }
    id v16 = (void *)MEMORY[0x1E4F28C58];
    *(void *)atoken.val = *MEMORY[0x1E4F28568];
    *(void *)__int16 v28 = @"AVAudioApplication error - missing entitlement";
    int v17 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v28, &atoken, 1, *(void *)v22.val);
    uint64_t v18 = [v16 errorWithDomain:*MEMORY[0x1E4F28760] code:1701737535 userInfo:v17];

    ((void (**)(void, void *, void))v8)[2](v8, v18, 0);
  }
}

- (void)sessionIDs:(id *)a3 clientID:(unsigned int)a4 reply:(id)a5
{
  id v8 = a5;
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient sessionIDs:clientID:reply:]";
  *(void *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},NSArray * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v8);
  id v9 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();

  int v11 = (os_unfair_lock_s *)as::server::LegacySessionManager::Instance(v10);
  memset(&v35, 0, sizeof(v35));
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection) {
    [(NSXPCConnection *)xpcConnection auditToken];
  }
  long long v13 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v28.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&v28.val[4] = v13;
  char v29 = 1;
  *(_OWORD *)atoken.val = *(_OWORD *)v28.val;
  *(_OWORD *)&atoken.val[4] = v13;
  pid_t v30 = audit_token_to_pid(&atoken);
  audit_token_t atoken = v35;
  char v26 = 1;
  audit_token_t v36 = v35;
  pid_t v27 = audit_token_to_pid(&v36);
  as::server::LegacySessionManager::FindAudioApplicationAndVerifyOwnership(v11, (const as::server::ProcessIdentity *)&v28, (const as::server::ProcessIdentity *)&atoken, a4, 1, (uint64_t)&v31);
  if (v31 && v33)
  {
    as::server::AudioApplicationInfo::GetSessions((os_unfair_lock_s *)v31, (uint64_t *)&v28);
    int v14 = objc_opt_new();
    uint64_t v15 = *(uint64_t **)v28.val;
    for (uint64_t i = *(uint64_t **)&v28.val[2]; v15 != i; v15 += 2)
    {
      uint64_t v17 = *v15;
      uint64_t v18 = (std::__shared_weak_count *)v15[1];
      if (v18) {
        atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t v19 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v17 + 8)];
      [v14 addObject:v19];

      if (v18) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v18);
      }
    }
    ((void (**)(void, void, void *))v9)[2](v9, 0, v14);

    *(void *)atoken.val = &v28;
    std::vector<std::shared_ptr<as::server::AudioSessionInfo>>::__destroy_vector::operator()[abi:ne180100]((void ***)&atoken);
  }
  else
  {
    long long v20 = *(_OWORD *)&a3->var0[4];
    v22[0] = *(_OWORD *)a3->var0;
    v22[1] = v20;
    char v23 = 1;
    *(_OWORD *)v28.val = v22[0];
    *(_OWORD *)&v28.val[4] = v20;
    pid_t v24 = audit_token_to_pid(&v28);
    uint64_t v21 = BuildInvalidAudioAppError((as::server *)"-[AVAudioSessionRemoteXPCClient sessionIDs:clientID:reply:]", (uint64_t)v22);
    ((void (**)(void, void *, void))v9)[2](v9, v21, 0);
  }
  if (v34) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v34);
  }
  if (v32) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v32);
  }
}

- (void)getApplicationProperty:(id *)a3 clientID:(unsigned int)a4 propertyID:(id)a5 isMXProperty:(BOOL)a6 reply:(id)a7
{
  BOOL v8 = a6;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = a7;
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient getApplicationProperty:clientI"
                                                          "D:propertyID:isMXProperty:reply:]";
  *(void *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},objc_object  {objcproto14NSSecureCoding}* {__strong},unsigned int>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v13);
  int v14 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();

  id v16 = (os_unfair_lock_s *)as::server::LegacySessionManager::Instance(v15);
  memset(&v38, 0, sizeof(v38));
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection) {
    [(NSXPCConnection *)xpcConnection auditToken];
  }
  long long v18 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)audit_token_t buf = *(_OWORD *)a3->var0;
  *(_OWORD *)&buf[16] = v18;
  buf[32] = 1;
  *(_OWORD *)atoken.val = *(_OWORD *)buf;
  *(_OWORD *)&atoken.val[4] = v18;
  pid_t v43 = audit_token_to_pid(&atoken);
  audit_token_t atoken = v38;
  char v32 = 1;
  audit_token_t v39 = v38;
  pid_t v33 = audit_token_to_pid(&v39);
  as::server::LegacySessionManager::FindAudioApplicationAndVerifyOwnership(v16, (const as::server::ProcessIdentity *)buf, (const as::server::ProcessIdentity *)&atoken, a4, 1, (uint64_t)&v34);
  if (v34 && v36)
  {
    if (v8) {
      int v19 = 1836595770;
    }
    else {
      int v19 = 1634744890;
    }
    as::server::AudioApplicationInfo::GetProperty(v34, v12, v19, (uint64_t)&atoken);
    uint64_t v20 = (int)atoken.val[0];
    if (atoken.val[0])
    {
      uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v40 = *MEMORY[0x1E4F28568];
      __int16 v41 = @"Failed to get property";
      audit_token_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      char v23 = [v21 errorWithDomain:*MEMORY[0x1E4F28760] code:v20 userInfo:v22];

      uint64_t v25 = *(id *)as::server::gSessionServerLog(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)audit_token_t buf = 136315906;
        *(void *)&uint8_t buf[4] = "AVAudioSessionXPCServer.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 2222;
        *(_WORD *)&unsigned char buf[18] = 2112;
        *(void *)&buf[20] = v12;
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = atoken.val[0];
        _os_log_impl(&dword_1CFE2A000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to get property: %@, err: %d", buf, 0x22u);
      }
      ((void (**)(void, void *, void, void))v14)[2](v14, v23, 0, 0);
    }
    else
    {
      v14[2](v14, 0, *(void *)&atoken.val[2], 0);
    }
  }
  else
  {
    long long v26 = *(_OWORD *)&a3->var0[4];
    v28[0] = *(_OWORD *)a3->var0;
    v28[1] = v26;
    char v29 = 1;
    *(_OWORD *)audit_token_t buf = v28[0];
    *(_OWORD *)&buf[16] = v26;
    pid_t v30 = audit_token_to_pid((audit_token_t *)buf);
    pid_t v27 = BuildInvalidAudioAppError((as::server *)"-[AVAudioSessionRemoteXPCClient getApplicationProperty:clientID:propertyID:isMXProperty:reply:]", (uint64_t)v28);
    ((void (**)(void, void *, void, void))v14)[2](v14, v27, 0, 0);
  }
  if (v37) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v37);
  }
  if (v35) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v35);
  }
}

- (void)setApplicationProperty:(id *)a3 clientID:(unsigned int)a4 propertyID:(id)a5 propertyValue:(id)a6 reply:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  v50[2] = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient setApplicationProperty:clientI"
                                                          "D:propertyID:propertyValue:reply:]";
  *(void *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v14);
  uint64_t v15 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();

  uint64_t v17 = (os_unfair_lock_s *)as::server::LegacySessionManager::Instance(v16);
  memset(&v43, 0, sizeof(v43));
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection) {
    [(NSXPCConnection *)xpcConnection auditToken];
  }
  long long v19 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)audit_token_t buf = *(_OWORD *)a3->var0;
  *(_OWORD *)&buf[16] = v19;
  buf[32] = 1;
  *(_OWORD *)atoken.val = *(_OWORD *)buf;
  *(_OWORD *)&atoken.val[4] = v19;
  *(_DWORD *)&buf[36] = audit_token_to_pid(&atoken);
  audit_token_t atoken = v43;
  char v37 = 1;
  audit_token_t v44 = v43;
  pid_t v38 = audit_token_to_pid(&v44);
  as::server::LegacySessionManager::FindAudioApplicationAndVerifyOwnership(v17, (const as::server::ProcessIdentity *)buf, (const as::server::ProcessIdentity *)&atoken, v9, 1, (uint64_t)&v39);
  if (v39 && v41)
  {
    v49[0] = @"ClientID";
    uint64_t v20 = [NSNumber numberWithUnsignedInt:v9];
    v49[1] = @"ClientType";
    v50[0] = v20;
    uint64_t v21 = [NSNumber numberWithInteger:*(void *)(v41 + 80)];
    v50[1] = v21;
    audit_token_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:2];

    pid_t v24 = *(id *)as::server::gSessionServerLog(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = (void *)(v41 + 176);
      if (*(char *)(v41 + 199) < 0) {
        uint64_t v25 = (void *)*v25;
      }
      *(_DWORD *)audit_token_t buf = 136316162;
      *(void *)&uint8_t buf[4] = "AVAudioSessionXPCServer.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2252;
      *(_WORD *)&unsigned char buf[18] = 2112;
      *(void *)&buf[20] = v12;
      *(_WORD *)&buf[28] = 2112;
      *(void *)&buf[30] = v13;
      *(_WORD *)&buf[38] = 2080;
      int v48 = v25;
      _os_log_impl(&dword_1CFE2A000, v24, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Set audio app property: %@, value: %@ (client: %s)", buf, 0x30u);
    }
    int v26 = as::server::AudioApplicationInfo::SetProperty(v39, v12, v13, v22);
    if (v26)
    {
      pid_t v27 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v45 = *MEMORY[0x1E4F28568];
      audit_token_t v46 = @"Failed to set property";
      audit_token_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
      char v29 = [v27 errorWithDomain:*MEMORY[0x1E4F28760] code:v26 userInfo:v28];

      audit_token_t v31 = *(id *)as::server::gSessionServerLog(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)audit_token_t buf = 136315906;
        *(void *)&uint8_t buf[4] = "AVAudioSessionXPCServer.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 2259;
        *(_WORD *)&unsigned char buf[18] = 2112;
        *(void *)&buf[20] = v12;
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = v26;
        _os_log_impl(&dword_1CFE2A000, v31, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to set property: %@, err: %d", buf, 0x22u);
      }
      ((void (**)(void, void *))v15)[2](v15, v29);
    }
    else
    {
      v15[2](v15, 0);
    }
  }
  else
  {
    long long v32 = *(_OWORD *)&a3->var0[4];
    v33[0] = *(_OWORD *)a3->var0;
    v33[1] = v32;
    char v34 = 1;
    *(_OWORD *)audit_token_t buf = v33[0];
    *(_OWORD *)&buf[16] = v32;
    pid_t v35 = audit_token_to_pid((audit_token_t *)buf);
    audit_token_t v22 = BuildInvalidAudioAppError((as::server *)"-[AVAudioSessionRemoteXPCClient setApplicationProperty:clientID:propertyID:propertyValue:reply:]", (uint64_t)v33);
    ((void (**)(void, void *))v15)[2](v15, v22);
  }

  if (v42) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v42);
  }
  if (v40) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v40);
  }
}

- (void)updateApplicationProperty:(id *)a3 clientID:(unsigned int)a4 propertyID:(id)a5 propertyValue:(id)a6 context:(id)a7 reply:(id)a8
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient updateApplicationProperty:clie"
                                                          "ntID:propertyID:propertyValue:context:reply:]";
  *(void *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v17);
  long long v18 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();

  uint64_t v20 = (os_unfair_lock_s *)as::server::LegacySessionManager::Instance(v19);
  memset(&v41, 0, sizeof(v41));
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection) {
    [(NSXPCConnection *)xpcConnection auditToken];
  }
  long long v22 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)audit_token_t buf = *(_OWORD *)a3->var0;
  *(_OWORD *)&buf[16] = v22;
  buf[32] = 1;
  *(_OWORD *)atoken.val = *(_OWORD *)buf;
  *(_OWORD *)&atoken.val[4] = v22;
  *(_DWORD *)&buf[36] = audit_token_to_pid(&atoken);
  audit_token_t atoken = v41;
  char v35 = 1;
  audit_token_t v42 = v41;
  pid_t v36 = audit_token_to_pid(&v42);
  as::server::LegacySessionManager::FindAudioApplicationAndVerifyOwnership(v20, (const as::server::ProcessIdentity *)buf, (const as::server::ProcessIdentity *)&atoken, a4, 1, (uint64_t)&v37);
  if (!v37 || !v39)
  {
    long long v30 = *(_OWORD *)&a3->var0[4];
    v31[0] = *(_OWORD *)a3->var0;
    v31[1] = v30;
    char v32 = 1;
    *(_OWORD *)audit_token_t buf = v31[0];
    *(_OWORD *)&buf[16] = v30;
    pid_t v33 = audit_token_to_pid((audit_token_t *)buf);
    char v29 = BuildInvalidAudioAppError((as::server *)"-[AVAudioSessionRemoteXPCClient updateApplicationProperty:clientID:propertyID:propertyValue:context:reply:]", (uint64_t)v31);
    ((void (**)(void, void *))v18)[2](v18, v29);
LABEL_14:

    goto LABEL_15;
  }
  pid_t v24 = *(id *)as::server::gSessionServerLog(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v25 = (void *)(v39 + 176);
    if (*(char *)(v39 + 199) < 0) {
      uint64_t v25 = (void *)*v25;
    }
    *(_DWORD *)audit_token_t buf = 136316162;
    *(void *)&uint8_t buf[4] = "AVAudioSessionXPCServer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2285;
    *(_WORD *)&unsigned char buf[18] = 2112;
    *(void *)&buf[20] = v14;
    *(_WORD *)&buf[28] = 2112;
    *(void *)&buf[30] = v15;
    *(_WORD *)&buf[38] = 2080;
    audit_token_t v44 = v25;
    _os_log_impl(&dword_1CFE2A000, v24, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Update audio app property: %@, value: %@ (client: %s)", buf, 0x30u);
  }
  updated = (as::server *)as::server::AudioApplicationInfo::UpdateProperty(v37, v14, v15, 1634744890, 0, v16);
  int v27 = (int)updated;
  if (updated)
  {
    audit_token_t v28 = *(id *)as::server::gSessionServerLog(updated);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)audit_token_t buf = 136315906;
      *(void *)&uint8_t buf[4] = "AVAudioSessionXPCServer.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 2289;
      *(_WORD *)&unsigned char buf[18] = 2112;
      *(void *)&buf[20] = v14;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v27;
      _os_log_impl(&dword_1CFE2A000, v28, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to update property: %@, err: %d", buf, 0x22u);
    }
    char v29 = NSErrorWithString(&cfstr_FailedToUpdate.isa);
    ((void (**)(void, void *))v18)[2](v18, v29);
    goto LABEL_14;
  }
  v18[2](v18, 0);
LABEL_15:
  if (v40) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v40);
  }
  if (v38) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v38);
  }
}

- (void)getApplicationMessages:(id *)a3 clientID:(unsigned int)a4 reply:(id)a5
{
  id v8 = a5;
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient getApplicationMessages:clientID:reply:]";
  *(void *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong},NSArray * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v8);
  uint64_t v9 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();

  memset(&v28, 0, sizeof(v28));
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection) {
    xpcConnection = (NSXPCConnection *)[(NSXPCConnection *)xpcConnection auditToken];
  }
  int v11 = (os_unfair_lock_s *)as::server::LegacySessionManager::Instance((as::server::LegacySessionManager *)xpcConnection);
  long long v12 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v21.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&v21.val[4] = v12;
  char v22 = 1;
  *(_OWORD *)atoken.val = *(_OWORD *)v21.val;
  *(_OWORD *)&atoken.val[4] = v12;
  pid_t v23 = audit_token_to_pid(&atoken);
  audit_token_t atoken = v28;
  char v19 = 1;
  audit_token_t v29 = v28;
  pid_t v20 = audit_token_to_pid(&v29);
  as::server::LegacySessionManager::FindAudioApplicationAndVerifyOwnership(v11, (const as::server::ProcessIdentity *)&v21, (const as::server::ProcessIdentity *)&atoken, a4, 1, (uint64_t)&v24);
  if (v24 && v26)
  {
    id v13 = as::server::AudioAppRemoteClient::GetDeferredMessages(v26);
    ((void (**)(void, void, void *))v9)[2](v9, 0, v13);
  }
  else
  {
    long long v14 = *(_OWORD *)&a3->var0[4];
    v15[0] = *(_OWORD *)a3->var0;
    v15[1] = v14;
    char v16 = 1;
    *(_OWORD *)v21.val = v15[0];
    *(_OWORD *)&v21.val[4] = v14;
    pid_t v17 = audit_token_to_pid(&v21);
    id v13 = BuildInvalidAudioAppError((as::server *)"-[AVAudioSessionRemoteXPCClient getApplicationMessages:clientID:reply:]", (uint64_t)v15);
    ((void (**)(void, void *, void))v9)[2](v9, v13, 0);
  }

  if (v27) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v27);
  }
  if (v25) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v25);
  }
}

- (void)setMXPropertyOnAllSessions:(id *)a3 clientID:(unsigned int)a4 MXProperty:(id)a5 values:(id)a6 reply:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  self->_serverDelegate = (AVAudioSessionServerDelegate *)"-[AVAudioSessionRemoteXPCClient setMXPropertyOnAllSessions:cli"
                                                          "entID:MXProperty:values:reply:]";
  *(void *)&self->_invalidated = std::chrono::system_clock::now().__d_.__rep_ + 9000000;
  caulk::xpc::reply_watchdog_factory::reply_with_timeout<NSError * {__strong}>((caulk::xpc::reply_watchdog_factory *)&self->_replyWatchdogFunctionName, v14);
  id v15 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();

  long long v18 = 0u;
  long long v19 = 0u;
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection) {
    [(NSXPCConnection *)xpcConnection auditToken];
  }
  pid_t v17 = as::server::forbid_acq::SetPropertyMXOnAppSessions((long long *)a3, &v18, a4, v12, v13);
  ((void (**)(void, void *))v15)[2](v15, v17);
}

- (void)toggleInputMuteForRecordingProcess:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v4 = (void (**)(id, void *))a3;
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection) {
    [(NSXPCConnection *)xpcConnection auditToken];
  }
  else {
    memset(&v17, 0, sizeof(v17));
  }
  audit_token_t buf = v17;
  char v19 = 1;
  audit_token_t atoken = v17;
  HasEntitlement = (as::server::forbid_acq::SystemController *)audit_token_to_pid(&atoken);
  unsigned int v20 = HasEntitlement;
  {
    if (HasEntitlement)
    {
      as::AudioSessionMuteEnabled(void)::enabled = _os_feature_enabled_impl();
    }
  }
  if (as::AudioSessionMuteEnabled(void)::enabled
    || (HasEntitlement = (as::server::forbid_acq::SystemController *)as::server::ProcessIdentity::ProcessHasEntitlement((as::server::ProcessIdentity *)&buf, "com.apple.private.coreaudio.borrowaudioapplication.allow"), (HasEntitlement & 1) != 0))
  {
    {
      if (HasEntitlement)
      {
        as::AudioSessionMuteEnabled(void)::enabled = _os_feature_enabled_impl();
      }
    }
    if (!as::AudioSessionMuteEnabled(void)::enabled)
    {
      id v9 = *(id *)as::server::forbid_acq::SystemController::Instance(HasEntitlement);
      id v10 = v9;
      if (!v9)
      {
        id v15 = *(id *)as::server::gSessionServerLog(0);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          buf.val[0] = 136315394;
          *(void *)&buf.val[1] = "AVAudioSessionXPCServer.mm";
          LOWORD(buf.val[3]) = 1024;
          *(unsigned int *)((char *)&buf.val[3] + 2) = 2354;
          _os_log_impl(&dword_1CFE2A000, v15, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Error - invalid MXSystemController", (uint8_t *)&buf, 0x12u);
        }
        char v16 = NSErrorWithString(&cfstr_ErrorInvalidMx.isa);
        v4[2](v4, v16);

        goto LABEL_25;
      }
      if (![v9 toggleInputMute])
      {
        v4[2](v4, 0);
LABEL_25:

        goto LABEL_26;
      }
      int v11 = NSErrorWithString(&cfstr_Mxsystemcontro.isa);
      v4[2](v4, v11);
    }
    id v7 = (as::server::LegacySessionManager *)as::server::LegacySessionManager::Instance(HasEntitlement);
    id v8 = self->_clientProcess.xpcConnection;
    if (v8) {
      [(NSXPCConnection *)v8 auditToken];
    }
    else {
      memset(&buf, 0, sizeof(buf));
    }
    id v10 = as::server::LegacySessionManager::ToggleInputMuteForRecordingApplication(v7, &buf);
    id v12 = v4[2];
    if (v10) {
      v12(v4, v10);
    }
    else {
      v12(v4, 0);
    }
    goto LABEL_25;
  }
  id v13 = *(id *)as::server::gSessionServerLog(HasEntitlement);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    atoken.val[0] = 136315650;
    *(void *)&atoken.val[1] = "AVAudioSessionXPCServer.mm";
    LOWORD(atoken.val[3]) = 1024;
    *(unsigned int *)((char *)&atoken.val[3] + 2) = 2344;
    HIWORD(atoken.val[4]) = 1024;
    atoken.val[5] = v20;
    _os_log_impl(&dword_1CFE2A000, v13, OS_LOG_TYPE_INFO, "%25s:%-5d Error - toggleInputMute attempted but caller (pid: %d) doesn't have entitlement", (uint8_t *)&atoken, 0x18u);
  }
  id v14 = NSErrorWithString(&cfstr_NotAllowed.isa);
  v4[2](v4, v14);

LABEL_26:
}

- (void)muteInputForRecordingProcesses:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v4 = (void (**)(id, void *, void))a3;
  xpcConnection = self->_clientProcess.xpcConnection;
  if (xpcConnection) {
    [(NSXPCConnection *)xpcConnection auditToken];
  }
  else {
    memset(&v11, 0, sizeof(v11));
  }
  audit_token_t v12 = v11;
  char v13 = 1;
  audit_token_t atoken = v11;
  HasEntitlement = (as::server *)audit_token_to_pid(&atoken);
  unsigned int v14 = HasEntitlement;
  {
    if (HasEntitlement)
    {
      as::SmartRoutingPrioritizesCall(void)::enabled = _os_feature_enabled_impl();
    }
  }
  if (as::SmartRoutingPrioritizesCall(void)::enabled
    && (HasEntitlement = (as::server *)as::server::ProcessIdentity::ProcessHasEntitlement((as::server::ProcessIdentity *)&v12, "com.apple.private.coreaudio.borrowaudioapplication.allow"), (HasEntitlement & 1) == 0))
  {
    id v9 = *(id *)as::server::gSessionServerLog(HasEntitlement);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      atoken.val[0] = 136315650;
      *(void *)&atoken.val[1] = "AVAudioSessionXPCServer.mm";
      LOWORD(atoken.val[3]) = 1024;
      *(unsigned int *)((char *)&atoken.val[3] + 2) = 2386;
      HIWORD(atoken.val[4]) = 1024;
      atoken.val[5] = v14;
      _os_log_impl(&dword_1CFE2A000, v9, OS_LOG_TYPE_INFO, "%25s:%-5d Error - muteInputForRecordingProcesses attempted but caller (pid: %d) doesn't have entitlement", (uint8_t *)&atoken, 0x18u);
    }
    id v10 = NSErrorWithString(&cfstr_NotAllowed.isa);
    v4[2](v4, v10, 0);
  }
  else
  {
    {
      if (HasEntitlement)
      {
        as::SmartRoutingPrioritizesCall(void)::enabled = _os_feature_enabled_impl();
      }
    }
    if (as::SmartRoutingPrioritizesCall(void)::enabled)
    {
      as::server::LegacySessionManager::Instance(HasEntitlement);
      as::server::LegacySessionManager::MuteInputsForRecordingApplications((uint64_t)&v12);
      if (!LOBYTE(v12.val[2]))
      {
        v4[2](v4, *(void **)v12.val, 0);

        goto LABEL_16;
      }
      id v7 = (void *)caulk::expected<NSDictionary * {__strong},NSError * {__strong}>::value((uint64_t)&v12);
      v4[2](v4, 0, *v7);
    }
    id v8 = NSErrorWithString(&cfstr_Unsupported.isa);
    v4[2](v4, v8, 0);
  }
LABEL_16:
}

- (void)setEnhanceDialoguePreference:(id)a3 reply:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (as::server *)a4;
  id v7 = *(id *)as::server::gSessionServerLog(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    id v10 = "AVAudioSessionXPCServer.mm";
    __int16 v11 = 1024;
    int v12 = 2406;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_1CFE2A000, v7, OS_LOG_TYPE_INFO, "%25s:%-5d set enhance dialogue preference to %@", (uint8_t *)&v9, 0x1Cu);
  }
  if (v5 && ([v5 integerValue] & 0x8000000000000000) == 0 && objc_msgSend(v5, "integerValue") < 3)
  {
    CFPreferencesSetAppValue(@"enhancedialogueoptin", v5, @"com.apple.preferences-sounds");
    id v8 = 0;
    notify_post("com.apple.preferences-sounds.enhancedialogueoptin");
  }
  else
  {
    id v8 = NSErrorWithString(&cfstr_InvalidValue.isa);
  }
  (*((void (**)(as::server *, void *))v6 + 2))(v6, v8);
}

- (void)setEnhanceDialogueLevel:(id)a3 reply:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (as::server *)a4;
  id v7 = *(id *)as::server::gSessionServerLog(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315650;
    __int16 v11 = "AVAudioSessionXPCServer.mm";
    __int16 v12 = 1024;
    int v13 = 2423;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_1CFE2A000, v7, OS_LOG_TYPE_INFO, "%25s:%-5d set enhance dialogue level to %@", (uint8_t *)&v10, 0x1Cu);
  }
  if (v5 && ([v5 integerValue] & 0x8000000000000000) == 0 && objc_msgSend(v5, "integerValue") < 4)
  {
    CFPreferencesSetAppValue(@"enhancedialoguelevel", v5, @"com.apple.preferences-sounds");
    if ([v5 integerValue]) {
      int v9 = &unk_1F268A7A0;
    }
    else {
      int v9 = &unk_1F268A788;
    }
    CFPreferencesSetAppValue(@"enhancedialog", v9, @"com.apple.preferences-sounds");
    notify_post("com.apple.preferences-sounds.enhancedialog");
    notify_post("com.apple.preferences-sounds.enhancedialoguelevel");
    id v8 = 0;
  }
  else
  {
    id v8 = NSErrorWithString(&cfstr_InvalidLevelVa.isa);
  }
  (*((void (**)(as::server *, void *))v6 + 2))(v6, v8);
}

- (void)getEnhanceDialogueLevelWithReply:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v3 = (void (**)(id, void *, void *, void))a3;
  *(_WORD *)keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"enhancedialog", @"com.apple.preferences-sounds", &keyExistsAndHasValidFormat[1]);
  id v5 = (as::server *)CFPreferencesGetAppIntegerValue(@"enhancedialoguelevel", @"com.apple.preferences-sounds", keyExistsAndHasValidFormat);
  id v6 = v5;
  if ((unint64_t)v5 < 4)
  {
    id v8 = *(id *)as::server::gSessionServerLog(v5);
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if (v9)
    {
      audit_token_t v17 = "AVAudioSessionXPCServer.mm";
      *(_DWORD *)audit_token_t buf = 136315906;
      __int16 v18 = 1024;
      if (keyExistsAndHasValidFormat[1]) {
        int v10 = "";
      }
      else {
        int v10 = "(no value)";
      }
      int v19 = 2459;
      __int16 v20 = 2048;
      CFIndex v21 = AppIntegerValue;
      __int16 v22 = 2080;
      pid_t v23 = v10;
      _os_log_impl(&dword_1CFE2A000, v8, OS_LOG_TYPE_INFO, "%25s:%-5d got enhance dialogue mode: %ld %s", buf, 0x26u);
    }
    __int16 v11 = *(id *)as::server::gSessionServerLog((as::server *)v9);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      audit_token_t v17 = "AVAudioSessionXPCServer.mm";
      *(_DWORD *)audit_token_t buf = 136315906;
      __int16 v18 = 1024;
      if (keyExistsAndHasValidFormat[0]) {
        __int16 v12 = "";
      }
      else {
        __int16 v12 = "(no value)";
      }
      int v19 = 2461;
      __int16 v20 = 2048;
      CFIndex v21 = (CFIndex)v6;
      __int16 v22 = 2080;
      pid_t v23 = v12;
      _os_log_impl(&dword_1CFE2A000, v11, OS_LOG_TYPE_INFO, "%25s:%-5d got enhance dialogue level: %ld %s", buf, 0x26u);
    }
    id v7 = 0;
  }
  else
  {
    id v7 = NSErrorWithString(&cfstr_InvalidValue.isa);
  }
  if (AppIntegerValue) {
    int v13 = v6;
  }
  else {
    int v13 = 0;
  }
  __int16 v14 = [NSNumber numberWithInteger:v13];
  v3[2](v3, v7, v14, 0);
}

- (void)allowAppToInitiatePlaybackTemporarilyFromBackground:(id)a3 reply:(id)a4
{
  id v5 = (void (**)(id, void *))a4;
  int v4 = NSErrorWithString(&cfstr_NotSupportedOn.isa);
  v5[2](v5, v4);
}

- (void).cxx_destruct
{
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](&self->_defaultReplyWatchdogFactory.mTimeoutHandler.__f_.__f_);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](&self->_replyWatchdogMinTimestamp.__d_.__rep_);
  objc_storeStrong((id *)&self->_clientProcess.mProcessName.var0, 0);
  objc_storeStrong((id *)&self->_clientProcess.mProcessName.__r_.var0, 0);
  if (*((char *)&self->_clientProcess.mProcessName.__r_.__value_.var0.var1 + 23) < 0) {
    operator delete(self->_clientProcess.mProcessName.__r_.__value_.var0.var1.__data_);
  }
  objc_destroyWeak((id *)&self->_clientProcess.mClientRelay);

  objc_destroyWeak((id *)&self->_server);
}

- (uint64_t)initWithServer:process:delegate:
{
  return a1;
}

- (id)initWithServer:process:delegate:
{
  v1 = (id *)(a1 + 8);
  uint64_t v2 = (id *)operator new(0x10uLL);
  id *v2 = &unk_1F2687F30;
  objc_copyWeak(v2 + 1, v1);
  return v2;
}

@end