@interface ExternalStreamManager
- (BOOL)_setPauseExternalInputStreamGroupID:(id)a3 streamID:(id)a4 isPaused:(BOOL)a5 fromPlatformCallback:(BOOL)a6 error:(id *)a7;
- (BOOL)_setPauseExternalInputStreamWithoutNotifyingClient:(id)a3 isPaused:(BOOL)a4 fromPlatformCallback:(BOOL)a5 error:(id *)a6;
- (BOOL)addExternalInputStreamGroupID:(id)a3 streamID:(id)a4 attributedTo:(id)a5 definition:(id)a6 isPaused:(BOOL)a7 canRecord:(BOOL)a8 fader:(shared_ptr<caulk:(id)a10 :(id *)a11 synchronized<Phase::Controller::ExternalStreamFader>>)a9 pauseStateDidUpdateCallback:error:;
- (BOOL)setPauseExternalInputStreamGroupID:(id)a3 streamID:(id)a4 isPaused:(BOOL)a5 error:(id *)a6;
- (BOOL)setPauseExternalOutputStreamGroupID:(id)a3 streamID:(id)a4 isPaused:(BOOL)a5 error:(id *)a6;
- (BOOL)streamIsPaused:(id)a3 error:(id *)a4;
- (ExternalStreamManager)initWithTaskManager:(void *)a3 engineMode:(int64_t)a4 engineFormat:(id)a5 maximumFramesToRender:(unsigned int)a6 enableAudioIssueDetector:(BOOL)a7;
- (id).cxx_construct;
- (id)formatForStream:(id)a3 error:(id *)a4;
- (id)updateExternalInputStreamRecordingAbility:(id *)a1 streamID:canRecord:;
- (int64_t)typeForStream:(id)a3 error:(id *)a4;
- (uint64_t)setExternalInputStreamSessionMute:(uint64_t)a1 isMuted:fadeTimeInSeconds:;
- (uint64_t)setExternalInputStreamSessionMute:isMuted:fadeTimeInSeconds:;
- (unint64_t)_fadeInputStreamsInSessionToken:(unsigned int)a3 isMuted:(BOOL)a4 fadeTimeInSeconds:(float)a5 synchronous:(BOOL)a6;
- (unint64_t)addControllerPauseStateDidUpdateCallback:(id)a3;
- (unint64_t)setExternalInputStreamSessionMute:(unsigned int)a3 isMuted:(BOOL)a4 fadeTimeInSeconds:(float)a5;
- (unique_ptr<Phase::Controller::StreamRenderer,)createRendererForStream:(id)a3 outputChannelLayout:(unsigned int)a4 normalize:(BOOL)a5 targetLKFS:(double)a6 error:(id *)a7;
- (unsigned)sessionIdForStream:(id)a3 error:(id *)a4;
- (void)_setSessionInputStreamState:(id)a3 muted:(BOOL)a4 fromPlatformCallback:(BOOL)a5;
- (void)_updateRecordingAbility:(id)a3 streamID:(id)a4 canRecord:(BOOL)a5;
- (void)abandonControlOfExternalStreamGroupID:(id)a3 withCallback:(id)a4;
- (void)addExternalOutputStreamGroupID:(id)a3 streamID:(id)a4 attributedTo:(id)a5 definition:(id)a6 startsPaused:(BOOL)a7 renderBlock:(id)a8 withCallback:(id)a9;
- (void)claimControlOfExternalStreamGroupID:(id)a3 attributedTo:(id)a4 stateChangeBlock:(id)a5 withCallback:(id)a6;
- (void)gatherDebugInformation:(id)a3;
- (void)removeAllResourcesAttributedToClientID:(id)a3;
- (void)removeControllerPauseStateDidUpdateCallback:(unint64_t)a3;
- (void)removeExternalInputStreamGroupID:(id)a3 streamID:(id)a4;
- (void)removeExternalOutputStreamGroupID:(id)a3 streamID:(id)a4 withCallback:(id)a5;
- (void)setExternalInputStreamSession:(unsigned int)a3 isActive:(BOOL)a4;
- (void)setExternalInputStreamSessionMute:(uint64_t)a1 isMuted:fadeTimeInSeconds:;
- (void)setMuteExternalInputStreamGroupID:(id)a3 streamID:(id)a4 isMuted:(BOOL)a5;
- (void)update;
- (void)updateController:(id)a3 pauseState:(BOOL)a4;
- (void)updateExternalInputStreamRecordingAbility:(id *)a1 streamID:canRecord:;
- (void)updateExternalInputStreamRecordingAbility:(id)a3 streamID:(id)a4 canRecord:(BOOL)a5;
- (void)updateExternalInputStreamRecordingAbility:streamID:canRecord:;
@end

@implementation ExternalStreamManager

- (ExternalStreamManager)initWithTaskManager:(void *)a3 engineMode:(int64_t)a4 engineFormat:(id)a5 maximumFramesToRender:(unsigned int)a6 enableAudioIssueDetector:(BOOL)a7
{
  id v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ExternalStreamManager;
  id v13 = [(ExternalStreamManager *)&v17 init];
  if (v13)
  {
    id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v15 = (void *)*((void *)v13 + 1);
    *((void *)v13 + 1) = v14;

    *((void *)v13 + 2) = Phase::Controller::TaskManager::GetService<Phase::Controller::VoiceManager>((Phase::Logger *)a3, 8);
    *((void *)v13 + 3) = Phase::Controller::TaskManager::GetService<Phase::Controller::SessionManager>((Phase::Logger *)a3, 20);
    objc_storeStrong((id *)v13 + 4, a5);
    *((_DWORD *)v13 + 10) = a6;
    *((unsigned char *)v13 + 44) = a7;
  }

  return (ExternalStreamManager *)v13;
}

- (void)removeAllResourcesAttributedToClientID:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v35 = a3;
  v33 = self;
  v4 = (void *)[*((id *)self + 1) copy];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v29 = v4;
  obuint64_t j = [v4 allKeys];
  uint64_t v30 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v30)
  {
    uint64_t v28 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v45 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v44 + 1) + 8 * i);
        v32 = [v29 objectForKey:v5];
        v6 = [v32 controllingClientID];
        int v7 = [v6 isEqual:v35];

        if (v7) {
          [(ExternalStreamManager *)v33 abandonControlOfExternalStreamGroupID:v5 withCallback:&__block_literal_global_1];
        }
        v8 = [v32 outputStreams];
        v34 = (void *)[v8 copy];

        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        v9 = [v34 allKeys];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v40 objects:v49 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v41;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v41 != v11) {
                objc_enumerationMutation(v9);
              }
              uint64_t v13 = *(void *)(*((void *)&v40 + 1) + 8 * j);
              id v14 = [v34 objectForKey:v13];
              v15 = [v14 attributedClientID];
              int v16 = [v15 isEqual:v35];

              if (v16) {
                [(ExternalStreamManager *)v33 removeExternalOutputStreamGroupID:v5 streamID:v13 withCallback:&__block_literal_global_120];
              }
            }
            uint64_t v10 = [v9 countByEnumeratingWithState:&v40 objects:v49 count:16];
          }
          while (v10);
        }

        objc_super v17 = [v32 inputStreams];
        v18 = (void *)[v17 copy];

        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        v19 = [v18 allKeys];
        uint64_t v20 = [v19 countByEnumeratingWithState:&v36 objects:v48 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v37;
          do
          {
            for (uint64_t k = 0; k != v20; ++k)
            {
              if (*(void *)v37 != v21) {
                objc_enumerationMutation(v19);
              }
              uint64_t v23 = *(void *)(*((void *)&v36 + 1) + 8 * k);
              v24 = [v18 objectForKey:v23];
              v25 = [v24 attributedClientID];
              int v26 = [v25 isEqual:v35];

              if (v26) {
                [(ExternalStreamManager *)v33 removeExternalInputStreamGroupID:v5 streamID:v23];
              }
            }
            uint64_t v20 = [v19 countByEnumeratingWithState:&v36 objects:v48 count:16];
          }
          while (v20);
        }
      }
      uint64_t v30 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v30);
  }
}

- (void)addExternalOutputStreamGroupID:(id)a3 streamID:(id)a4 attributedTo:(id)a5 definition:(id)a6 startsPaused:(BOOL)a7 renderBlock:(id)a8 withCallback:(id)a9
{
  BOOL v10 = a7;
  v48[1] = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v37 = a5;
  id v38 = a6;
  id v17 = a8;
  v18 = (Phase *)a9;
  BOOL IsFeatureEnabled_SessionBasedMuting = Phase::IsFeatureEnabled_SessionBasedMuting(v18);
  if (IsFeatureEnabled_SessionBasedMuting) {
    os_unfair_recursive_lock_lock_with_options();
  }
  uint64_t v20 = [*((id *)self + 1) objectForKey:v15];
  if (!v20)
  {
    uint64_t v20 = objc_alloc_init(ManagedStreamGroup);
    [*((id *)self + 1) setObject:v20 forKey:v15];
  }
  uint64_t v21 = [(ManagedStreamGroup *)v20 outputStreams];
  v22 = [v21 objectForKey:v16];

  if (v22)
  {
    uint64_t v23 = *MEMORY[0x263F08320];
    uint64_t v47 = *MEMORY[0x263F08320];
    v24 = [NSString stringWithFormat:@"stream group %@ already has output stream %@", v15, v16];
    v48[0] = v24;
    v25 = [NSDictionary dictionaryWithObjects:v48 forKeys:&v47 count:1];

    v27 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v26)
                                                                                        + 432)));
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = [v25 objectForKeyedSubscript:v23];
      *(_DWORD *)buf = 136315650;
      long long v40 = "ExternalStreamManager.mm";
      __int16 v41 = 1024;
      int v42 = 342;
      __int16 v43 = 2112;
      id v44 = v28;
      _os_log_impl(&dword_221E5E000, v27, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);
    }
    v29 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346925413 userInfo:v25];
  }
  else
  {
    uint64_t v30 = [(ManagedStreamGroup *)v20 outputStreams];
    v31 = [[ManagedOutputStream alloc] initWithPaused:v10 attributedTo:v37 definition:v38 renderBlock:v17];
    [v30 setObject:v31 forKey:v16];

    v33 = **(id **)(Phase::Logger::GetInstance(v32) + 912);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      long long v40 = "ExternalStreamManager.mm";
      __int16 v41 = 1024;
      int v42 = 353;
      __int16 v43 = 2112;
      id v44 = v16;
      __int16 v45 = 2112;
      id v46 = v15;
      _os_log_impl(&dword_221E5E000, v33, OS_LOG_TYPE_DEFAULT, "%25s:%-5d added external output stream %@ to group %@", buf, 0x26u);
    }
    v29 = 0;
  }
  (*((void (**)(Phase *, void *))v18 + 2))(v18, v29);
  if (!v29)
  {
    v34 = [(ManagedStreamGroup *)v20 stateChangeBlock];
    BOOL v35 = v34 == 0;

    if (!v35)
    {
      long long v36 = [(ManagedStreamGroup *)v20 stateChangeBlock];
      ((void (**)(void, id, id, void))v36)[2](v36, v15, v16, 0);
    }
  }

  if (IsFeatureEnabled_SessionBasedMuting) {
    os_unfair_recursive_lock_unlock();
  }
}

- (BOOL)addExternalInputStreamGroupID:(id)a3 streamID:(id)a4 attributedTo:(id)a5 definition:(id)a6 isPaused:(BOOL)a7 canRecord:(BOOL)a8 fader:(shared_ptr<caulk:(id)a10 :(id *)a11 synchronized<Phase::Controller::ExternalStreamFader>>)a9 pauseStateDidUpdateCallback:error:
{
  BOOL v11 = a8;
  BOOL v12 = a7;
  v61[1] = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v18 = a4;
  id v43 = a5;
  id v45 = a6;
  id v44 = a9.__cntrl_;
  BOOL IsFeatureEnabled_SessionBasedMuting = Phase::IsFeatureEnabled_SessionBasedMuting((Phase *)v44);
  if (IsFeatureEnabled_SessionBasedMuting) {
    os_unfair_recursive_lock_lock_with_options();
  }
  BOOL v42 = IsFeatureEnabled_SessionBasedMuting;
  uint64_t v20 = [*((id *)self + 1) objectForKey:v17];
  if (!v20)
  {
    uint64_t v20 = objc_alloc_init(ManagedStreamGroup);
    objc_msgSend(*((id *)self + 1), "setObject:forKey:");
  }
  uint64_t v21 = [(ManagedStreamGroup *)v20 inputStreams];
  v22 = [v21 objectForKey:v18];
  BOOL v23 = v22 == 0;

  if (v22)
  {
    uint64_t v24 = *MEMORY[0x263F08320];
    uint64_t v60 = *MEMORY[0x263F08320];
    v25 = [NSString stringWithFormat:@"stream group %@ already has input stream %@", v17, v18];
    v61[0] = v25;
    int v26 = [NSDictionary dictionaryWithObjects:v61 forKeys:&v60 count:1];

    uint64_t v28 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v27)
                                                                                        + 432)));
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = [(ManagedInputStream *)v26 objectForKeyedSubscript:v24];
      *(_DWORD *)buf = 136315650;
      v49 = "ExternalStreamManager.mm";
      __int16 v50 = 1024;
      int v51 = 390;
      __int16 v52 = 2112;
      id v53 = v29;
      _os_log_impl(&dword_221E5E000, v28, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);
    }
    if (a10)
    {
      id v30 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346925413 userInfo:v26];
LABEL_28:
      *(void *)a10 = v30;
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  v31 = [ManagedInputStream alloc];
  v32 = (std::__shared_weak_count *)*((void *)a9.__ptr_ + 1);
  uint64_t v46 = *(void *)a9.__ptr_;
  uint64_t v47 = v32;
  if (v32) {
    atomic_fetch_add_explicit(&v32->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  int v26 = [(ManagedInputStream *)v31 initWithPaused:v12 attributedTo:v43 definition:v45 canRecord:v11 fader:&v46 pauseStateDidUpdateCallback:v44];
  v33 = (Phase *)v47;
  if (v47) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v47);
  }
  if (Phase::IsFeatureEnabled_SessionBasedMuting(v33))
  {
    unsigned __int16 SessionInputMuteState = Phase::Controller::SessionManager::GetSessionInputMuteState(*((id **)self + 3), [v45 audioSessionToken], 0);
    int v35 = SessionInputMuteState;
    if (SessionInputMuteState >= 0x100u)
    {
      [(ManagedInputStream *)v26 setIsMuted:SessionInputMuteState != 0];
      int v41 = 0;
      goto LABEL_19;
    }
  }
  else
  {
    int v35 = 0;
  }
  int v41 = 1;
LABEL_19:
  long long v36 = [(ManagedStreamGroup *)v20 inputStreams];
  [v36 setObject:v26 forKey:v18];

  id v37 = (Phase::Logger *)[(ExternalStreamManager *)self _setPauseExternalInputStreamWithoutNotifyingClient:v26 isPaused:v12 fromPlatformCallback:0 error:a10];
  if ((v37 & 1) == 0)
  {
    [(ExternalStreamManager *)self removeExternalInputStreamGroupID:v17 streamID:v18];
LABEL_30:
    BOOL v23 = 0;
    goto LABEL_31;
  }
  id v38 = **(id **)(Phase::Logger::GetInstance(v37) + 912);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    long long v39 = "MUTED";
    *(_DWORD *)buf = 136316418;
    v49 = "ExternalStreamManager.mm";
    __int16 v50 = 1024;
    int v51 = 431;
    if (!v35) {
      long long v39 = "UNMUTED";
    }
    __int16 v52 = 2112;
    id v53 = v18;
    __int16 v54 = 2112;
    if (v41) {
      long long v39 = "UNKNOWN";
    }
    id v55 = v17;
    __int16 v56 = 1024;
    BOOL v57 = v12;
    __int16 v58 = 2080;
    v59 = v39;
    _os_log_impl(&dword_221E5E000, v38, OS_LOG_TYPE_DEFAULT, "%25s:%-5d added external input stream %@ to group %@ with initial pause state %d initial input mute state %s", buf, 0x36u);
  }
  if (a10)
  {
    id v30 = 0;
    goto LABEL_28;
  }
  BOOL v23 = 1;
LABEL_31:

  if (v42) {
    os_unfair_recursive_lock_unlock();
  }

  return v23;
}

- (void)removeExternalInputStreamGroupID:(id)a3 streamID:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = (Phase *)a4;
  BOOL IsFeatureEnabled_SessionBasedMuting = Phase::IsFeatureEnabled_SessionBasedMuting(v7);
  if (IsFeatureEnabled_SessionBasedMuting) {
    os_unfair_recursive_lock_lock_with_options();
  }
  v9 = [*((id *)self + 1) objectForKey:v6];
  BOOL v10 = v9;
  if (v9)
  {
    BOOL v11 = [v9 inputStreams];
    BOOL v12 = [v11 objectForKey:v7];

    if (v12)
    {
      id v14 = [v10 inputStreams];
      [v14 removeObjectForKey:v7];

      id v16 = **(id **)(Phase::Logger::GetInstance(v15) + 912);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v34 = 136315906;
        int v35 = "ExternalStreamManager.mm";
        __int16 v36 = 1024;
        int v37 = 460;
        __int16 v38 = 2112;
        long long v39 = v7;
        __int16 v40 = 2112;
        id v41 = v6;
        _os_log_impl(&dword_221E5E000, v16, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Removed external input stream %@ from group %@.", (uint8_t *)&v34, 0x26u);
      }
      id v17 = (void **)*((void *)self + 3);
      id v18 = [v12 definition];
      LOBYTE(v17) = Phase::Controller::SessionManager::SetSessionPlayState(v17, [v18 audioSessionToken], (uint64_t)v12, 1u, 0, 0, 0);

      if ((v17 & 1) == 0)
      {
        uint64_t v20 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v19)
                                                                                            + 912)));
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v21 = [v12 definition];
          int v22 = [v21 audioSessionToken];
          int v34 = 136315650;
          int v35 = "ExternalStreamManager.mm";
          __int16 v36 = 1024;
          int v37 = 471;
          __int16 v38 = 1024;
          LODWORD(v39) = v22;
          _os_log_impl(&dword_221E5E000, v20, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Failed to stop audio session 0x%x while removing input stream (potentially invalid)", (uint8_t *)&v34, 0x18u);
        }
      }
      BOOL v23 = [v10 outputStreams];
      if ([v23 count])
      {

LABEL_23:
        goto LABEL_24;
      }
      id v30 = [v10 inputStreams];
      if ([v30 count])
      {

        goto LABEL_23;
      }
      v31 = [v10 controllingClientID];
      BOOL v32 = v31 == 0;

      if (!v32) {
        goto LABEL_23;
      }
      v33 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance((Phase::Logger *)[*((id *)self + 1) removeObjectForKey:v6])
                                                       + 912));
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      int v34 = 136315650;
      int v35 = "ExternalStreamManager.mm";
      __int16 v36 = 1024;
      int v37 = 478;
      __int16 v38 = 2112;
      long long v39 = (Phase *)v6;
      int v26 = "%25s:%-5d Removed external stream group %@";
      v27 = v33;
      os_log_type_t v28 = OS_LOG_TYPE_DEFAULT;
      uint32_t v29 = 28;
    }
    else
    {
      v25 = **(id **)(Phase::Logger::GetInstance(v13) + 912);
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        goto LABEL_23;
      }
      int v34 = 136315906;
      int v35 = "ExternalStreamManager.mm";
      __int16 v36 = 1024;
      int v37 = 455;
      __int16 v38 = 2112;
      long long v39 = v7;
      __int16 v40 = 2112;
      id v41 = v6;
      int v26 = "%25s:%-5d Could not find stream %@ to remove in group %@.";
      v27 = v25;
      os_log_type_t v28 = OS_LOG_TYPE_ERROR;
      uint32_t v29 = 38;
    }
    _os_log_impl(&dword_221E5E000, v27, v28, v26, (uint8_t *)&v34, v29);
    goto LABEL_23;
  }
  uint64_t v24 = **(id **)(Phase::Logger::GetInstance(0) + 912);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    int v34 = 136315650;
    int v35 = "ExternalStreamManager.mm";
    __int16 v36 = 1024;
    int v37 = 448;
    __int16 v38 = 2112;
    long long v39 = (Phase *)v6;
    _os_log_impl(&dword_221E5E000, v24, OS_LOG_TYPE_ERROR, "%25s:%-5d Could not find stream group %@ to remove.", (uint8_t *)&v34, 0x1Cu);
  }
LABEL_24:

  if (IsFeatureEnabled_SessionBasedMuting) {
    os_unfair_recursive_lock_unlock();
  }
}

- (void)setMuteExternalInputStreamGroupID:(id)a3 streamID:(id)a4 isMuted:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = (Phase *)a4;
  BOOL IsFeatureEnabled_SessionBasedMuting = Phase::IsFeatureEnabled_SessionBasedMuting(v9);
  if (IsFeatureEnabled_SessionBasedMuting) {
    os_unfair_recursive_lock_lock_with_options();
  }
  BOOL v11 = [*((id *)self + 1) objectForKey:v8];
  BOOL v12 = v11;
  if (v11)
  {
    uint64_t v13 = [v11 inputStreams];
    id v14 = [v13 objectForKey:v9];

    if (v14)
    {
      id v16 = **(id **)(Phase::Logger::GetInstance(v15) + 912);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = "False";
        uint64_t v24 = "ExternalStreamManager.mm";
        __int16 v25 = 1024;
        int v26 = 513;
        *(_DWORD *)buf = 136315906;
        if (v5) {
          id v17 = "True";
        }
        __int16 v27 = 2080;
        id v28 = (id)v17;
        __int16 v29 = 2112;
        id v30 = v9;
        _os_log_impl(&dword_221E5E000, v16, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Setting Mute %s state on external input stream %@", buf, 0x26u);
      }
      id v18 = [v14 definition];
      uint64_t v19 = [v18 audioSessionToken];

      [v14 setIsMuted:v5];
      int v20 = 0;
    }
    else
    {
      int v22 = **(id **)(Phase::Logger::GetInstance(v15) + 912);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v24 = "ExternalStreamManager.mm";
        __int16 v25 = 1024;
        int v26 = 508;
        __int16 v27 = 2112;
        id v28 = v9;
        _os_log_impl(&dword_221E5E000, v22, OS_LOG_TYPE_ERROR, "%25s:%-5d Could not find stream %@ to mute.", buf, 0x1Cu);
      }
      uint64_t v19 = 0;
      int v20 = 1;
    }
  }
  else
  {
    uint64_t v21 = **(id **)(Phase::Logger::GetInstance(0) + 912);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v24 = "ExternalStreamManager.mm";
      __int16 v25 = 1024;
      int v26 = 501;
      __int16 v27 = 2112;
      id v28 = v8;
      _os_log_impl(&dword_221E5E000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d Could not find stream group %@ to mute.", buf, 0x1Cu);
    }
    id v14 = 0;
    uint64_t v19 = 0;
    int v20 = 1;
  }

  if (IsFeatureEnabled_SessionBasedMuting) {
    os_unfair_recursive_lock_unlock();
  }
  if (!v20) {
    Phase::Controller::SessionManager::SetSessionInputMuteState(*((void ***)self + 3), v19, v14, v5, 0);
  }
}

- (void)_setSessionInputStreamState:(id)a3 muted:(BOOL)a4 fromPlatformCallback:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v13 = a3;
  if ([v13 isStreamPaused]) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 1;
  }
  if ([v13 canRecord]) {
    int v9 = 1;
  }
  else {
    int v9 = 9;
  }
  if (v6) {
    int v10 = 4;
  }
  else {
    int v10 = 0;
  }
  BOOL v11 = (void **)*((void *)self + 3);
  BOOL v12 = [v13 definition];
  Phase::Controller::SessionManager::SetSessionPlayState(v11, [v12 audioSessionToken], (uint64_t)v13, v9 | v10, v8, v5, 0);
}

- (unint64_t)_fadeInputStreamsInSessionToken:(unsigned int)a3 isMuted:(BOOL)a4 fadeTimeInSeconds:(float)a5 synchronous:(BOOL)a6
{
  BOOL v41 = a6;
  BOOL v7 = a4;
  v68[4] = *MEMORY[0x263EF8340];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  obuint64_t j = [*((id *)self + 1) allKeys];
  unint64_t v8 = 0;
  uint64_t v9 = [obj countByEnumeratingWithState:&v49 objects:v67 count:16];
  if (v9)
  {
    uint64_t v36 = *(void *)v50;
    int v10 = "Unmuting";
    if (v7) {
      int v10 = "Muting";
    }
    long long v39 = v10;
    double v11 = a5;
    if (v7) {
      float v12 = 0.0;
    }
    else {
      float v12 = 1.0;
    }
    if (a5 < 0.0) {
      a5 = 0.0;
    }
    id v13 = &lock[8];
    do
    {
      uint64_t v14 = 0;
      uint64_t v37 = v9;
      do
      {
        if (*(void *)v50 != v36) {
          objc_enumerationMutation(obj);
        }
        id v15 = [*((id *)self + 1) objectForKey:*(void *)(*((void *)&v49 + 1) + 8 * v14)];
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v16 = [v15 inputStreams];
        uint64_t v38 = v14;
        id v42 = [v16 allKeys];

        uint64_t v17 = [v42 countByEnumeratingWithState:&v45 objects:v66 count:16];
        if (v17)
        {
          uint64_t v44 = *(void *)v46;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v46 != v44) {
                objc_enumerationMutation(v42);
              }
              uint64_t v19 = *(void *)(*((void *)&v45 + 1) + 8 * i);
              int v20 = [v15 inputStreams];
              uint64_t v21 = [v20 objectForKey:v19];

              if (v21)
              {
                int v22 = [v21 definition];
                BOOL v23 = [v22 audioSessionToken] == a3;

                if (v23)
                {
                  unsigned int v24 = [v21 isMuted];
                  [v21 fader];
                  uint64_t v25 = *(void *)lock;
                  os_unfair_lock_lock(*(os_unfair_lock_t *)lock);
                  int v26 = *(Phase::Logger **)&lock[8];
                  if (*(void *)&lock[8]) {
                    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&lock[8]);
                  }
                  __int16 v27 = v13;
                  unint64_t v28 = v8;
                  __int16 v29 = **(id **)(Phase::Logger::GetInstance(v26) + 912);
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)locuint64_t k = 136316418;
                    *(void *)&lock[4] = "ExternalStreamManager.mm";
                    *(_WORD *)&lock[12] = 1024;
                    *(_DWORD *)&lock[14] = 573;
                    __int16 v58 = 2080;
                    v59 = v39;
                    __int16 v60 = 2112;
                    uint64_t v61 = v19;
                    __int16 v62 = 1024;
                    unsigned int v63 = a3;
                    __int16 v64 = 2048;
                    double v65 = v11;
                    _os_log_impl(&dword_221E5E000, v29, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s input %@ for session 0x%x over %f seconds.", lock, 0x36u);
                  }
                  *(float *)(v25 + 52) = v12;
                  v68[0] = &unk_26D473990;
                  v68[1] = Phase::CurveFunction::Linear<float>;
                  v68[3] = v68;
                  if (a5 == 0.0)
                  {
                    *(float *)(v25 + 40) = v12;
                    float v30 = v12;
                  }
                  else
                  {
                    float v30 = *(float *)(v25 + 40);
                  }
                  unint64_t v31 = v28;
                  v53[0] = 0.0;
                  v53[1] = v30;
                  *(float *)locuint64_t k = a5;
                  *(float *)&lock[4] = v12;
                  id v13 = v27;
                  std::__function::__value_func<float ()(float)>::__value_func[abi:ne180100]((uint64_t)v27, (uint64_t)v68);
                  Phase::Envelope<float>::Envelope((Phase::Logger *)&v54, v53, (float *)lock);
                  std::vector<Phase::Envelope<float>::SegmentInternal,std::allocator<Phase::Envelope<float>::SegmentInternal>>::__vdeallocate((void **)(v25 + 8));
                  *(_OWORD *)(v25 + 8) = v54;
                  *(void *)(v25 + 24) = v55;
                  long long v54 = 0uLL;
                  uint64_t v55 = 0;
                  __int16 v56 = (void **)&v54;
                  std::vector<Phase::Envelope<float>::SegmentInternal,std::allocator<Phase::Envelope<float>::SegmentInternal>>::__destroy_vector::operator()[abi:ne180100](&v56);
                  std::__function::__value_func<float ()(float)>::~__value_func[abi:ne180100](v27);
                  *(_DWORD *)(v25 + 32) = 0;
                  std::__function::__value_func<float ()(float)>::~__value_func[abi:ne180100](v68);
                  [v21 setIsFading:1];
                  float v32 = *(float *)(v25 + 52);
                  os_unfair_lock_unlock((os_unfair_lock_t)v25);
                  if (v41)
                  {
                    if (v32 == 0.0) {
                      uint64_t v33 = 1;
                    }
                    else {
                      uint64_t v33 = v24;
                    }
                    [(ExternalStreamManager *)self _setSessionInputStreamState:v21 muted:v33 fromPlatformCallback:1];
                  }
                  unint64_t v8 = v31 + 1;
                }
              }
            }
            uint64_t v17 = [v42 countByEnumeratingWithState:&v45 objects:v66 count:16];
          }
          while (v17);
        }

        uint64_t v14 = v38 + 1;
      }
      while (v38 + 1 != v37);
      uint64_t v9 = [obj countByEnumeratingWithState:&v49 objects:v67 count:16];
    }
    while (v9);
  }

  return v8;
}

- (unint64_t)setExternalInputStreamSessionMute:(unsigned int)a3 isMuted:(BOOL)a4 fadeTimeInSeconds:(float)a5
{
  BOOL v6 = a4;
  uint64_t v7 = *(void *)&a3;
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t IsFeatureEnabled_SessionBasedMuting = Phase::IsFeatureEnabled_SessionBasedMuting((Phase *)self);
  int v10 = IsFeatureEnabled_SessionBasedMuting;
  if (IsFeatureEnabled_SessionBasedMuting) {
    uint64_t IsFeatureEnabled_SessionBasedMuting = os_unfair_recursive_lock_lock_with_options();
  }
  if (Phase::IsFeatureEnabled_SessionBasedMuting((Phase *)IsFeatureEnabled_SessionBasedMuting))
  {
    *(float *)&double v11 = a5;
    unint64_t v12 = [(ExternalStreamManager *)self _fadeInputStreamsInSessionToken:v7 isMuted:v6 fadeTimeInSeconds:1 synchronous:v11];
    if (v10) {
LABEL_5:
    }
      os_unfair_recursive_lock_unlock();
  }
  else
  {
    uint64_t v14 = self;
    uint64_t v15 = **((void **)v14 + 7);
    unint64_t v22 = 0;
    BOOL v21 = 1;
    uint64_t v16 = Phase::LockFreeQueueMPSC::GetWriteBuffer((atomic_uchar *)v15, 32, &v22, &v21);
    if (!v16)
    {
      Instance = (Phase::Logger *)Phase::Logger::GetInstance(0);
      Phase::Logger::DumpTailspinWithThrottleAsync(Instance, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
      uint64_t v19 = **(id **)(v15 + 48);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        unsigned int v24 = "CommandQueue.hpp";
        __int16 v25 = 1024;
        int v26 = 100;
        _os_log_impl(&dword_221E5E000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buffe"
          "r is full, unable to grow.\"",
          buf,
          0x12u);
      }
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
    }
    if (v21)
    {
      uint64_t v17 = **(id **)(v15 + 48);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315906;
        unsigned int v24 = "CommandQueue.hpp";
        __int16 v25 = 1024;
        int v26 = 89;
        __int16 v27 = 2048;
        unint64_t v28 = v22;
        __int16 v29 = 2048;
        uint64_t v30 = 32;
        _os_log_impl(&dword_221E5E000, v17, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
      }
    }
    *(void *)uint64_t v16 = &unk_26D476798;
    *(void *)(v16 + 8) = v14;
    *(_DWORD *)(v16 + 16) = v7;
    *(unsigned char *)(v16 + 20) = v6;
    *(float *)(v16 + 24) = a5;
    Phase::LockFreeQueueSPSC::CommitBytes((atomic_uchar *)v15, 32);
    atomic_store(0, (unsigned __int8 *)(v15 + 40));

    unint64_t v12 = 0;
    if (v10) {
      goto LABEL_5;
    }
  }
  return v12;
}

- (void)setExternalInputStreamSession:(unsigned int)a3 isActive:(BOOL)a4
{
  BOOL v37 = a4;
  BOOL v5 = self;
  uint64_t v59 = *MEMORY[0x263EF8340];
  BOOL IsFeatureEnabled_SessionBasedMuting = Phase::IsFeatureEnabled_SessionBasedMuting((Phase *)self);
  if (IsFeatureEnabled_SessionBasedMuting)
  {
    __int16 v29 = (char *)v5 + 88;
    os_unfair_recursive_lock_lock_with_options();
  }
  else
  {
    __int16 v29 = 0;
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  BOOL v30 = IsFeatureEnabled_SessionBasedMuting;
  uint64_t v7 = objc_msgSend(*((id *)v5 + 1), "allKeys", v29);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v45 objects:v58 count:16];
  if (!v8) {
    goto LABEL_33;
  }
  uint64_t v32 = *(void *)v46;
  uint64_t v31 = v7;
  uint64_t v36 = v5;
  do
  {
    uint64_t v9 = 0;
    uint64_t v33 = v8;
    do
    {
      if (*(void *)v46 != v32) {
        objc_enumerationMutation(v7);
      }
      uint64_t v35 = *(void *)(*((void *)&v45 + 1) + 8 * v9);
      int v10 = objc_msgSend(*((id *)v5 + 1), "objectForKey:");
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      double v11 = [v10 inputStreams];
      uint64_t v34 = v9;
      obuint64_t j = [v11 allKeys];

      uint64_t v12 = [obj countByEnumeratingWithState:&v41 objects:v57 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v42 != v13) {
              objc_enumerationMutation(obj);
            }
            uint64_t v15 = *(void *)(*((void *)&v41 + 1) + 8 * i);
            uint64_t v16 = [v10 inputStreams];
            uint64_t v17 = [v16 objectForKey:v15];

            if (v17)
            {
              id v18 = [v17 definition];
              BOOL v19 = [v18 audioSessionToken] == a3;

              if (v19)
              {
                if (v37)
                {
                  if (([v17 shouldResumeWithSession] & 1) == 0) {
                    goto LABEL_29;
                  }
                  id v40 = 0;
                  BOOL v20 = [(ExternalStreamManager *)v36 _setPauseExternalInputStreamGroupID:v35 streamID:v15 isPaused:0 fromPlatformCallback:1 error:&v40];
                  BOOL v21 = (Phase::Logger *)v40;
                  unint64_t v22 = v21;
                  if (!v20)
                  {
                    BOOL v23 = **(id **)(Phase::Logger::GetInstance(v21) + 912);
                    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136315906;
                      long long v50 = "ExternalStreamManager.mm";
                      __int16 v51 = 1024;
                      int v52 = 652;
                      __int16 v53 = 2112;
                      uint64_t v54 = v15;
                      __int16 v55 = 2112;
                      __int16 v56 = v22;
                      _os_log_impl(&dword_221E5E000, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d failed to resume input stream %@ after session interruption: %@", buf, 0x26u);
                    }
                  }
                  [v17 setShouldResumeWithSession:0];
                }
                else
                {
                  int v24 = [v17 isStreamPaused];
                  id v39 = 0;
                  BOOL v25 = [(ExternalStreamManager *)v36 _setPauseExternalInputStreamGroupID:v35 streamID:v15 isPaused:1 fromPlatformCallback:1 error:&v39];
                  int v26 = (Phase::Logger *)v39;
                  unint64_t v22 = v26;
                  if (v25)
                  {
                    uint64_t v27 = v24 ^ 1u;
                  }
                  else
                  {
                    unint64_t v28 = **(id **)(Phase::Logger::GetInstance(v26) + 912);
                    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136315906;
                      long long v50 = "ExternalStreamManager.mm";
                      __int16 v51 = 1024;
                      int v52 = 673;
                      __int16 v53 = 2112;
                      uint64_t v54 = v15;
                      __int16 v55 = 2112;
                      __int16 v56 = v22;
                      _os_log_impl(&dword_221E5E000, v28, OS_LOG_TYPE_ERROR, "%25s:%-5d failed to pause input stream %@ for session interruption: %@", buf, 0x26u);
                    }
                    uint64_t v27 = 0;
                  }
                  [v17 setShouldResumeWithSession:v27];
                }
              }
            }
LABEL_29:
          }
          uint64_t v12 = [obj countByEnumeratingWithState:&v41 objects:v57 count:16];
        }
        while (v12);
      }

      uint64_t v9 = v34 + 1;
      uint64_t v7 = v31;
      BOOL v5 = v36;
    }
    while (v34 + 1 != v33);
    uint64_t v8 = [v31 countByEnumeratingWithState:&v45 objects:v58 count:16];
  }
  while (v8);
LABEL_33:

  if (v30) {
    os_unfair_recursive_lock_unlock();
  }
}

- (void)_updateRecordingAbility:(id)a3 streamID:(id)a4 canRecord:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v8 = (char *)a3;
  uint64_t v9 = (Phase::Logger *)a4;
  int v10 = [*((id *)self + 1) objectForKey:v8];
  double v11 = v10;
  if (v10)
  {
    uint64_t v12 = [v10 inputStreams];
    uint64_t v13 = [v12 objectForKey:v9];

    if (v13)
    {
      uint64_t v15 = **(id **)(Phase::Logger::GetInstance(v14) + 912);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = "Cannot Record";
        BOOL v25 = "ExternalStreamManager.mm";
        __int16 v26 = 1024;
        int v27 = 703;
        *(_DWORD *)buf = 136315906;
        if (v5) {
          uint64_t v16 = "Can Record";
        }
        __int16 v28 = 2080;
        __int16 v29 = v16;
        __int16 v30 = 2112;
        uint64_t v31 = v9;
        _os_log_impl(&dword_221E5E000, v15, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Setting %s state on external input stream %@", buf, 0x26u);
      }
      [v13 setCanRecord:v5];
      id v23 = 0;
      BOOL v17 = -[ExternalStreamManager _setPauseExternalInputStreamWithoutNotifyingClient:isPaused:fromPlatformCallback:error:](self, "_setPauseExternalInputStreamWithoutNotifyingClient:isPaused:fromPlatformCallback:error:", v13, [v13 isStreamPaused], 0, &v23);
      id v18 = (Phase::Logger *)v23;
      BOOL v19 = v18;
      if (!v17)
      {
        BOOL v20 = **(id **)(Phase::Logger::GetInstance(v18) + 912);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          BOOL v25 = "ExternalStreamManager.mm";
          __int16 v26 = 1024;
          int v27 = 726;
          __int16 v28 = 2112;
          __int16 v29 = (const char *)v9;
          __int16 v30 = 2112;
          uint64_t v31 = v19;
          _os_log_impl(&dword_221E5E000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to update record state on input stream %@: %@", buf, 0x26u);
        }
      }
    }
    else
    {
      unint64_t v22 = **(id **)(Phase::Logger::GetInstance(v14) + 912);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        BOOL v25 = "ExternalStreamManager.mm";
        __int16 v26 = 1024;
        int v27 = 698;
        __int16 v28 = 2112;
        __int16 v29 = (const char *)v9;
        _os_log_impl(&dword_221E5E000, v22, OS_LOG_TYPE_ERROR, "%25s:%-5d Could not find stream %@ to pause.", buf, 0x1Cu);
      }
    }
  }
  else
  {
    BOOL v21 = **(id **)(Phase::Logger::GetInstance(0) + 912);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      BOOL v25 = "ExternalStreamManager.mm";
      __int16 v26 = 1024;
      int v27 = 691;
      __int16 v28 = 2112;
      __int16 v29 = v8;
      _os_log_impl(&dword_221E5E000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d Could not find stream group %@ to pause.", buf, 0x1Cu);
    }
  }
}

- (void)updateExternalInputStreamRecordingAbility:(id)a3 streamID:(id)a4 canRecord:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = (Phase *)a4;
  uint64_t IsFeatureEnabled_SessionBasedMuting = Phase::IsFeatureEnabled_SessionBasedMuting(v9);
  int v11 = IsFeatureEnabled_SessionBasedMuting;
  if (IsFeatureEnabled_SessionBasedMuting) {
    uint64_t IsFeatureEnabled_SessionBasedMuting = os_unfair_recursive_lock_lock_with_options();
  }
  if (Phase::IsFeatureEnabled_SessionBasedMuting((Phase *)IsFeatureEnabled_SessionBasedMuting))
  {
    [(ExternalStreamManager *)self _updateRecordingAbility:v8 streamID:v9 canRecord:v5];
  }
  else
  {
    id v12 = objc_initWeak(&location, self);
    id v13 = v8;
    uint64_t v14 = v9;
    uint64_t v15 = **((void **)self + 7);
    unint64_t v23 = 0;
    BOOL v22 = 1;
    uint64_t v16 = Phase::LockFreeQueueMPSC::GetWriteBuffer((atomic_uchar *)v15, 40, &v23, &v22);
    if (!v16)
    {
      Instance = (Phase::Logger *)Phase::Logger::GetInstance(0);
      Phase::Logger::DumpTailspinWithThrottleAsync(Instance, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
      BOOL v19 = **(id **)(v15 + 48);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        BOOL v25 = "CommandQueue.hpp";
        __int16 v26 = 1024;
        int v27 = 100;
        _os_log_impl(&dword_221E5E000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buffe"
          "r is full, unable to grow.\"",
          buf,
          0x12u);
      }
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
    }
    if (v22)
    {
      BOOL v17 = **(id **)(v15 + 48);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315906;
        BOOL v25 = "CommandQueue.hpp";
        __int16 v26 = 1024;
        int v27 = 89;
        __int16 v28 = 2048;
        unint64_t v29 = v23;
        __int16 v30 = 2048;
        uint64_t v31 = 40;
        _os_log_impl(&dword_221E5E000, v17, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
      }
    }
    *(void *)uint64_t v16 = &unk_26D4767C0;
    *(void *)(v16 + 8) = self;
    *(void *)(v16 + 16) = v13;
    *(void *)(v16 + 24) = v14;
    *(unsigned char *)(v16 + 32) = v5;
    Phase::LockFreeQueueSPSC::CommitBytes((atomic_uchar *)v15, 40);
    atomic_store(0, (unsigned __int8 *)(v15 + 40));

    objc_destroyWeak(&location);
  }
  if (v11) {
    os_unfair_recursive_lock_unlock();
  }
}

- (void)update
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  BOOL IsFeatureEnabled_SessionBasedMuting = Phase::IsFeatureEnabled_SessionBasedMuting((Phase *)self);
  if (IsFeatureEnabled_SessionBasedMuting)
  {
    uint64_t v16 = (char *)self + 88;
    os_unfair_recursive_lock_lock_with_options();
  }
  else
  {
    uint64_t v16 = 0;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  BOOL v21 = self;
  v3 = objc_msgSend(*((id *)self + 1), "allKeys", v16);
  uint64_t v19 = [v3 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v19)
  {
    uint64_t v18 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v29 != v18) {
          objc_enumerationMutation(v3);
        }
        v4 = [*((id *)v21 + 1) objectForKey:*(void *)(*((void *)&v28 + 1) + 8 * i)];
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        BOOL v5 = [v4 inputStreams];
        BOOL v6 = [v5 allKeys];

        uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v7)
        {
          uint64_t v8 = *(void *)v25;
          do
          {
            for (uint64_t j = 0; j != v7; ++j)
            {
              if (*(void *)v25 != v8) {
                objc_enumerationMutation(v6);
              }
              uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8 * j);
              int v11 = [v4 inputStreams];
              id v12 = [v11 objectForKey:v10];

              if (v12 && [v12 isFading])
              {
                LODWORD(v13) = [v12 isMuted];
                [v12 fader];
                os_unfair_lock_lock(lock);
                if (v23) {
                  std::__shared_weak_count::__release_shared[abi:ne180100](v23);
                }
                int os_unfair_lock_opaque_low = LOBYTE(lock[14]._os_unfair_lock_opaque);
                if (*(float *)&lock[13]._os_unfair_lock_opaque == 0.0) {
                  uint64_t v13 = 1;
                }
                else {
                  uint64_t v13 = v13;
                }
                os_unfair_lock_unlock(lock);
                if (os_unfair_lock_opaque_low)
                {
                  if (!Phase::IsFeatureEnabled_SessionBasedMuting(v15)) {
                    [(ExternalStreamManager *)v21 _setSessionInputStreamState:v12 muted:v13 fromPlatformCallback:0];
                  }
                  [v12 setIsFading:0];
                }
              }
            }
            uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v7);
        }
      }
      uint64_t v19 = [v3 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v19);
  }

  Phase::Commandable<128,Phase::LockFreeQueueMPSC>::ExecuteCommands((uint64_t)v21 + 48);
  if (IsFeatureEnabled_SessionBasedMuting) {
    os_unfair_recursive_lock_unlock();
  }
}

- (BOOL)_setPauseExternalInputStreamWithoutNotifyingClient:(id)a3 isPaused:(BOOL)a4 fromPlatformCallback:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  v36[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  int v11 = v10;
  if (v8) {
    uint64_t v12 = 2;
  }
  else {
    uint64_t v12 = 1;
  }
  int v13 = [v10 canRecord];
  int v14 = [v11 isMuted];
  if (v13) {
    int v15 = 1;
  }
  else {
    int v15 = 9;
  }
  if (v14) {
    int v16 = 4;
  }
  else {
    int v16 = 0;
  }
  BOOL v17 = (void **)*((void *)self + 3);
  uint64_t v18 = [v11 definition];
  BOOL v19 = Phase::Controller::SessionManager::SetSessionPlayState(v17, [v18 audioSessionToken], (uint64_t)v11, v16 | v15, v12, v7, 0);

  if (v19)
  {
    if (a6) {
      *a6 = 0;
    }
    [v11 setStreamPaused:v8];
    [v11 setShouldResumeWithSession:0];
  }
  else
  {
    uint64_t v20 = *MEMORY[0x263F08320];
    uint64_t v35 = *MEMORY[0x263F08320];
    BOOL v21 = NSString;
    BOOL v22 = [v11 definition];
    unint64_t v23 = objc_msgSend(v21, "stringWithFormat:", @"failed to set session 0x%x state", objc_msgSend(v22, "audioSessionToken"));
    v36[0] = v23;
    long long v24 = [NSDictionary dictionaryWithObjects:v36 forKeys:&v35 count:1];

    long long v26 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v25)
                                                                                        + 912)));
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      long long v27 = [v24 objectForKeyedSubscript:v20];
      *(_DWORD *)buf = 136315650;
      long long v30 = "ExternalStreamManager.mm";
      __int16 v31 = 1024;
      int v32 = 824;
      __int16 v33 = 2112;
      uint64_t v34 = v27;
      _os_log_impl(&dword_221E5E000, v26, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);
    }
    if (a6)
    {
      *a6 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346924646 userInfo:v24];
    }
    [v11 setStreamPaused:1];
    [v11 setShouldResumeWithSession:0];
  }
  return v19;
}

- (BOOL)setPauseExternalInputStreamGroupID:(id)a3 streamID:(id)a4 isPaused:(BOOL)a5 error:(id *)a6
{
  return [(ExternalStreamManager *)self _setPauseExternalInputStreamGroupID:a3 streamID:a4 isPaused:a5 fromPlatformCallback:0 error:a6];
}

- (BOOL)_setPauseExternalInputStreamGroupID:(id)a3 streamID:(id)a4 isPaused:(BOOL)a5 fromPlatformCallback:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  v53[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  int v13 = (Phase *)a4;
  BOOL IsFeatureEnabled_SessionBasedMuting = Phase::IsFeatureEnabled_SessionBasedMuting(v13);
  if (IsFeatureEnabled_SessionBasedMuting) {
    os_unfair_recursive_lock_lock_with_options();
  }
  int v14 = [*((id *)self + 1) objectForKey:v12];
  int v15 = v14;
  if (!v14)
  {
    uint64_t v24 = *MEMORY[0x263F08320];
    uint64_t v52 = *MEMORY[0x263F08320];
    long long v25 = "resume";
    if (v9) {
      long long v25 = "pause";
    }
    long long v26 = [NSString stringWithFormat:@"Could not find stream group %@ to %s", v12, v25];
    v53[0] = v26;
    BOOL v17 = [NSDictionary dictionaryWithObjects:v53 forKeys:&v52 count:1];

    long long v28 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v27)
                                                                                        + 912)));
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      long long v29 = [v17 objectForKeyedSubscript:v24];
      *(_DWORD *)buf = 136315650;
      long long v41 = "ExternalStreamManager.mm";
      __int16 v42 = 1024;
      int v43 = 876;
      __int16 v44 = 2112;
      long long v45 = v29;
      _os_log_impl(&dword_221E5E000, v28, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);
    }
    if (a7)
    {
      [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346924147 userInfo:v17];
      BOOL v22 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  int v16 = [v14 inputStreams];
  BOOL v17 = [v16 objectForKey:v13];

  if (!v17)
  {
    uint64_t v30 = *MEMORY[0x263F08320];
    uint64_t v50 = *MEMORY[0x263F08320];
    __int16 v31 = "resume";
    if (v9) {
      __int16 v31 = "pause";
    }
    int v32 = [NSString stringWithFormat:@"Could not find stream %@ to %s", v13, v31];
    __int16 v51 = v32;
    __int16 v33 = [NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];

    uint64_t v35 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v34)
                                                                                        + 912)));
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      uint64_t v36 = [v33 objectForKeyedSubscript:v30];
      *(_DWORD *)buf = 136315650;
      long long v41 = "ExternalStreamManager.mm";
      __int16 v42 = 1024;
      int v43 = 891;
      __int16 v44 = 2112;
      long long v45 = v36;
      _os_log_impl(&dword_221E5E000, v35, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);
    }
    if (a7)
    {
      *a7 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346924147 userInfo:v33];
    }

    BOOL v17 = 0;
LABEL_24:
    BOOL v22 = 0;
    goto LABEL_25;
  }
  BOOL v19 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v18)
                                                                                      + 912)));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v38 = v13;
    if (v9) {
      uint64_t v20 = "Pausing";
    }
    else {
      uint64_t v20 = "Resuming";
    }
    BOOL v21 = [v17 definition];
    *(_DWORD *)buf = 136316162;
    long long v41 = "ExternalStreamManager.mm";
    __int16 v42 = 1024;
    int v43 = 900;
    __int16 v44 = 2080;
    long long v45 = v20;
    __int16 v46 = 2112;
    int v13 = v38;
    long long v47 = v38;
    __int16 v48 = 1024;
    int v49 = [v21 audioSessionToken];
    _os_log_impl(&dword_221E5E000, v19, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s external input stream %@ in session 0x%x", buf, 0x2Cu);
  }
  BOOL v22 = [(ExternalStreamManager *)self _setPauseExternalInputStreamWithoutNotifyingClient:v17 isPaused:v9 fromPlatformCallback:v8 error:a7];
  unint64_t v23 = [v17 pauseStateDidUpdateCallback];
  v23[2](v23, [v17 isStreamPaused]);

LABEL_25:
  if (IsFeatureEnabled_SessionBasedMuting) {
    os_unfair_recursive_lock_unlock();
  }

  return v22;
}

- (void)claimControlOfExternalStreamGroupID:(id)a3 attributedTo:(id)a4 stateChangeBlock:(id)a5 withCallback:(id)a6
{
  v42[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v29 = a4;
  id v11 = a5;
  id v12 = (Phase *)a6;
  BOOL IsFeatureEnabled_SessionBasedMuting = Phase::IsFeatureEnabled_SessionBasedMuting(v12);
  if (IsFeatureEnabled_SessionBasedMuting) {
    os_unfair_recursive_lock_lock_with_options();
  }
  int v13 = [*((id *)self + 1) objectForKey:v10];
  if (!v13)
  {
    int v13 = objc_alloc_init(ManagedStreamGroup);
    objc_msgSend(*((id *)self + 1), "setObject:forKey:");
  }
  int v14 = [(ManagedStreamGroup *)v13 controllingClientID];

  if (v14)
  {
    uint64_t v15 = *MEMORY[0x263F08320];
    uint64_t v41 = *MEMORY[0x263F08320];
    int v16 = [NSString stringWithFormat:@"stream group %@ is already controlled", v10];
    v42[0] = v16;
    BOOL v17 = [NSDictionary dictionaryWithObjects:v42 forKeys:&v41 count:1];

    BOOL v19 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v18)
                                                                                        + 912)));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = [v17 objectForKeyedSubscript:v15];
      *(_DWORD *)buf = 136315650;
      uint64_t v36 = "ExternalStreamManager.mm";
      __int16 v37 = 1024;
      int v38 = 932;
      __int16 v39 = 2112;
      id v40 = v20;
      _os_log_impl(&dword_221E5E000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);
    }
    BOOL v21 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346921331 userInfo:v17];
  }
  else
  {
    [(ManagedStreamGroup *)v13 setStateChangeBlock:v11];
    BOOL v22 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)[(ManagedStreamGroup *)v13 setControllingClientID:v29])+ 912);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v36 = "ExternalStreamManager.mm";
      __int16 v37 = 1024;
      int v38 = 939;
      __int16 v39 = 2112;
      id v40 = v10;
      _os_log_impl(&dword_221E5E000, v22, OS_LOG_TYPE_DEFAULT, "%25s:%-5d claimed control of external stream group %@", buf, 0x1Cu);
    }
    BOOL v21 = 0;
  }
  (*((void (**)(Phase *, void *))v12 + 2))(v12, v21);
  if (!v21)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    unint64_t v23 = [(ManagedStreamGroup *)v13 outputStreams];
    uint64_t v24 = [v23 allKeys];

    uint64_t v25 = [v24 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v31 != v26) {
            objc_enumerationMutation(v24);
          }
          (*((void (**)(id, id, void, void))v11 + 2))(v11, v10, *(void *)(*((void *)&v30 + 1) + 8 * i), 0);
        }
        uint64_t v25 = [v24 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v25);
    }
  }
  if (IsFeatureEnabled_SessionBasedMuting) {
    os_unfair_recursive_lock_unlock();
  }
}

- (void)abandonControlOfExternalStreamGroupID:(id)a3 withCallback:(id)a4
{
  v39[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = (Phase *)a4;
  BOOL IsFeatureEnabled_SessionBasedMuting = Phase::IsFeatureEnabled_SessionBasedMuting(v7);
  if (IsFeatureEnabled_SessionBasedMuting) {
    os_unfair_recursive_lock_lock_with_options();
  }
  BOOL v9 = [*((id *)self + 1) objectForKey:v6];
  id v10 = v9;
  if (v9)
  {
    id v11 = [v9 controllingClientID];

    if (v11)
    {
      [v10 setControllingClientID:0];
      id v12 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance((Phase::Logger *)[v10 setStateChangeBlock:0])
                                                       + 912));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        long long v33 = "ExternalStreamManager.mm";
        __int16 v34 = 1024;
        int v35 = 979;
        __int16 v36 = 2112;
        id v37 = v6;
        _os_log_impl(&dword_221E5E000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Abandoned control of external stream group %@", buf, 0x1Cu);
      }
      int v13 = [v10 outputStreams];
      if ([v13 count])
      {
      }
      else
      {
        long long v27 = [v10 inputStreams];
        BOOL v28 = [v27 count] == 0;

        if (v28)
        {
          id v29 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance((Phase::Logger *)[*((id *)self + 1) removeObjectForKey:v6])
                                                           + 912));
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            long long v33 = "ExternalStreamManager.mm";
            __int16 v34 = 1024;
            int v35 = 985;
            __int16 v36 = 2112;
            id v37 = v6;
            _os_log_impl(&dword_221E5E000, v29, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Removed external stream group %@", buf, 0x1Cu);
          }
        }
      }
      uint64_t v20 = 0;
    }
    else
    {
      uint64_t v21 = *MEMORY[0x263F08320];
      uint64_t v30 = *MEMORY[0x263F08320];
      BOOL v22 = [NSString stringWithFormat:@"stream %@ is not currently under control", v6];
      long long v31 = v22;
      unint64_t v23 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];

      uint64_t v25 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v24)
                                                                                          + 912)));
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = [v23 objectForKeyedSubscript:v21];
        *(_DWORD *)buf = 136315650;
        long long v33 = "ExternalStreamManager.mm";
        __int16 v34 = 1024;
        int v35 = 972;
        __int16 v36 = 2112;
        id v37 = v26;
        _os_log_impl(&dword_221E5E000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);
      }
      uint64_t v20 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346925939 userInfo:v23];
    }
  }
  else
  {
    uint64_t v14 = *MEMORY[0x263F08320];
    uint64_t v38 = *MEMORY[0x263F08320];
    uint64_t v15 = [NSString stringWithFormat:@"stream group not found for UUID %@", v6];
    v39[0] = v15;
    int v16 = [NSDictionary dictionaryWithObjects:v39 forKeys:&v38 count:1];

    uint64_t v18 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v17)
                                                                                        + 912)));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      BOOL v19 = [v16 objectForKeyedSubscript:v14];
      *(_DWORD *)buf = 136315650;
      long long v33 = "ExternalStreamManager.mm";
      __int16 v34 = 1024;
      int v35 = 965;
      __int16 v36 = 2112;
      id v37 = v19;
      _os_log_impl(&dword_221E5E000, v18, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);
    }
    uint64_t v20 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346924147 userInfo:v16];
  }
  (*((void (**)(Phase *, void *))v7 + 2))(v7, v20);

  if (IsFeatureEnabled_SessionBasedMuting) {
    os_unfair_recursive_lock_unlock();
  }
}

- (void)removeExternalOutputStreamGroupID:(id)a3 streamID:(id)a4 withCallback:(id)a5
{
  v49[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (Phase *)a5;
  BOOL IsFeatureEnabled_SessionBasedMuting = Phase::IsFeatureEnabled_SessionBasedMuting(v10);
  if (IsFeatureEnabled_SessionBasedMuting) {
    os_unfair_recursive_lock_lock_with_options();
  }
  id v12 = [*((id *)self + 1) objectForKey:v8];
  int v13 = v12;
  if (!v12)
  {
    uint64_t v20 = *MEMORY[0x263F08320];
    uint64_t v48 = *MEMORY[0x263F08320];
    uint64_t v21 = [NSString stringWithFormat:@"can't remove stream %@ for unknown group %@", v9, v8];
    v49[0] = v21;
    BOOL v22 = [NSDictionary dictionaryWithObjects:v49 forKeys:&v48 count:1];

    uint64_t v24 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v23)
                                                                                        + 912)));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = [v22 objectForKeyedSubscript:v20];
      *(_DWORD *)buf = 136315650;
      __int16 v39 = "ExternalStreamManager.mm";
      __int16 v40 = 1024;
      int v41 = 1005;
      __int16 v42 = 2112;
      id v43 = v25;
      _os_log_impl(&dword_221E5E000, v24, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);
    }
    goto LABEL_11;
  }
  uint64_t v14 = [v12 outputStreams];
  uint64_t v15 = [v14 objectForKey:v9];

  if (!v15)
  {
    uint64_t v27 = *MEMORY[0x263F08320];
    uint64_t v46 = *MEMORY[0x263F08320];
    BOOL v28 = [NSString stringWithFormat:@"can't remove unknown stream %@ in group %@", v9, v8];
    long long v47 = v28;
    BOOL v22 = [NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];

    uint64_t v24 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v29)
                                                                                        + 912)));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v30 = [v22 objectForKeyedSubscript:v27];
      *(_DWORD *)buf = 136315650;
      __int16 v39 = "ExternalStreamManager.mm";
      __int16 v40 = 1024;
      int v41 = 1012;
      __int16 v42 = 2112;
      id v43 = v30;
      _os_log_impl(&dword_221E5E000, v24, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);
    }
LABEL_11:

    uint64_t v26 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346924147 userInfo:v22];

    goto LABEL_21;
  }
  int v16 = [v13 outputStreams];
  [v16 removeObjectForKey:v9];

  uint64_t v18 = **(id **)(Phase::Logger::GetInstance(v17) + 912);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    __int16 v39 = "ExternalStreamManager.mm";
    __int16 v40 = 1024;
    int v41 = 1018;
    __int16 v42 = 2112;
    id v43 = v9;
    __int16 v44 = 2112;
    id v45 = v8;
    _os_log_impl(&dword_221E5E000, v18, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Removed external output stream %@ from group %@", buf, 0x26u);
  }
  BOOL v19 = [v13 outputStreams];
  if ([v19 count])
  {
  }
  else
  {
    long long v31 = [v13 inputStreams];
    if ([v31 count])
    {
    }
    else
    {
      long long v32 = [v13 controllingClientID];
      BOOL v33 = v32 == 0;

      if (v33)
      {
        __int16 v34 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance((Phase::Logger *)[*((id *)self + 1) removeObjectForKey:v8])
                                                         + 912));
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          __int16 v39 = "ExternalStreamManager.mm";
          __int16 v40 = 1024;
          int v41 = 1024;
          __int16 v42 = 2112;
          id v43 = v8;
          _os_log_impl(&dword_221E5E000, v34, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Removed external stream group %@", buf, 0x1Cu);
        }
      }
    }
  }
  uint64_t v26 = 0;
LABEL_21:
  (*((void (**)(Phase *, void *))v10 + 2))(v10, v26);
  if (!v26)
  {
    int v35 = [v13 stateChangeBlock];
    BOOL v36 = v35 == 0;

    if (!v36)
    {
      id v37 = [v13 stateChangeBlock];
      ((void (**)(void, id, id, uint64_t))v37)[2](v37, v8, v9, 1);
    }
  }

  if (IsFeatureEnabled_SessionBasedMuting) {
    os_unfair_recursive_lock_unlock();
  }
}

- (BOOL)setPauseExternalOutputStreamGroupID:(id)a3 streamID:(id)a4 isPaused:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  v42[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = (Phase *)a4;
  BOOL IsFeatureEnabled_SessionBasedMuting = Phase::IsFeatureEnabled_SessionBasedMuting(v11);
  if (IsFeatureEnabled_SessionBasedMuting) {
    os_unfair_recursive_lock_lock_with_options();
  }
  int v13 = [*((id *)self + 1) objectForKey:v10];
  uint64_t v14 = v13;
  if (!v13)
  {
    uint64_t v21 = *MEMORY[0x263F08320];
    uint64_t v41 = *MEMORY[0x263F08320];
    BOOL v22 = "resume";
    if (v7) {
      BOOL v22 = "pause";
    }
    unint64_t v23 = [NSString stringWithFormat:@"Could not find stream group %@ to %s", v10, v22];
    v42[0] = v23;
    int v16 = [NSDictionary dictionaryWithObjects:v42 forKeys:&v41 count:1];

    uint64_t v25 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v24)
                                                                                        + 912)));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = [v16 objectForKeyedSubscript:v21];
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "ExternalStreamManager.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1052;
      __int16 v39 = 2112;
      __int16 v40 = v26;
      _os_log_impl(&dword_221E5E000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);
    }
    if (a6)
    {
      [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346924147 userInfo:v16];
      BOOL v27 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
    goto LABEL_22;
  }
  uint64_t v15 = [v13 outputStreams];
  int v16 = [v15 objectForKey:v11];

  if (!v16)
  {
    uint64_t v28 = *MEMORY[0x263F08320];
    uint64_t v36 = *MEMORY[0x263F08320];
    id v29 = "resume";
    if (v7) {
      id v29 = "pause";
    }
    uint64_t v30 = [NSString stringWithFormat:@"Could not find output stream %@ to %s", v11, v29];
    id v37 = v30;
    long long v31 = [NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];

    BOOL v33 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v32)
                                                                                        + 912)));
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      __int16 v34 = [v31 objectForKeyedSubscript:v28];
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "ExternalStreamManager.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1067;
      __int16 v39 = 2112;
      __int16 v40 = v34;
      _os_log_impl(&dword_221E5E000, v33, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);
    }
    if (a6)
    {
      *a6 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346924147 userInfo:v31];
    }

    int v16 = 0;
LABEL_22:
    BOOL v27 = 0;
    goto LABEL_27;
  }
  [v16 setStreamPaused:v7];
  *(void *)buf = 0;
  *(void *)&buf[8] = 0;
  [(Phase *)v11 getUUIDBytes:buf];
  uint64_t v17 = *(void *)buf;
  uint64_t v18 = *(void *)&buf[8];
  unint64_t HasExternalStream = Phase::Controller::VoiceManager::HasExternalStream(*((Phase::Controller::VoiceManager **)self + 2), *(UniqueObjectId *)buf);
  if (HIDWORD(HasExternalStream) || !(_BYTE)HasExternalStream)
  {
    uint64_t v20 = **((void **)self + 2);
    if (v7) {
      Phase::Controller::VoiceManager::Implementation::PauseExternalStream(v20, v17, v18);
    }
    else {
      Phase::Controller::VoiceManager::Implementation::ResumeExternalStream(v20, v17, v18);
    }
  }
  if (a6) {
    *a6 = 0;
  }
  BOOL v27 = 1;
LABEL_27:

  if (IsFeatureEnabled_SessionBasedMuting) {
    os_unfair_recursive_lock_unlock();
  }

  return v27;
}

- (BOOL)streamIsPaused:(id)a3 error:(id *)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = (Phase *)a3;
  BOOL IsFeatureEnabled_SessionBasedMuting = Phase::IsFeatureEnabled_SessionBasedMuting(v6);
  if (!IsFeatureEnabled_SessionBasedMuting)
  {
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  os_unfair_recursive_lock_lock_with_options();
  if (a4) {
LABEL_5:
  }
    *a4 = 0;
LABEL_6:
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  BOOL v7 = [*((id *)self + 1) allKeys];
  unint64_t v23 = a4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v26;
LABEL_8:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v26 != v9) {
        objc_enumerationMutation(v7);
      }
      id v11 = [*((id *)self + 1) objectForKey:*(void *)(*((void *)&v25 + 1) + 8 * v10)];
      id v12 = [v11 outputStreams];
      int v13 = [v12 objectForKey:v6];

      if (v13) {
        break;
      }
      uint64_t v14 = [v11 inputStreams];
      uint64_t v15 = [v14 objectForKey:v6];

      if (v15)
      {
        char v21 = [v15 isStreamPaused];
        int v13 = v15;
        goto LABEL_21;
      }

      if (v8 == ++v10)
      {
        uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v37 count:16];
        if (v8) {
          goto LABEL_8;
        }
        goto LABEL_15;
      }
    }
    char v21 = [v13 isStreamPaused];
LABEL_21:

    goto LABEL_22;
  }
LABEL_15:

  uint64_t v16 = *MEMORY[0x263F08320];
  uint64_t v35 = *MEMORY[0x263F08320];
  uint64_t v17 = [NSString stringWithFormat:@"stream not found for UUID %@", v6];
  uint64_t v36 = v17;
  BOOL v7 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];

  BOOL v19 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v18)
                                                                                      + 912)));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    uint64_t v20 = [v7 objectForKeyedSubscript:v16];
    *(_DWORD *)buf = 136315650;
    uint64_t v30 = "ExternalStreamManager.mm";
    __int16 v31 = 1024;
    int v32 = 1129;
    __int16 v33 = 2112;
    __int16 v34 = v20;
    _os_log_impl(&dword_221E5E000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);
  }
  if (v23)
  {
    [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346924147 userInfo:v7];
    char v21 = 0;
    *unint64_t v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v21 = 0;
  }
LABEL_22:

  if (IsFeatureEnabled_SessionBasedMuting) {
    os_unfair_recursive_lock_unlock();
  }

  return v21;
}

- (id)formatForStream:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = (Phase *)a3;
  BOOL IsFeatureEnabled_SessionBasedMuting = Phase::IsFeatureEnabled_SessionBasedMuting(v6);
  if (!IsFeatureEnabled_SessionBasedMuting)
  {
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  os_unfair_recursive_lock_lock_with_options();
  if (a4) {
LABEL_5:
  }
    *a4 = 0;
LABEL_6:
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  BOOL v7 = [*((id *)self + 1) allKeys];
  uint64_t v24 = a4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v27;
LABEL_8:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v27 != v9) {
        objc_enumerationMutation(v7);
      }
      id v11 = [*((id *)self + 1) objectForKey:*(void *)(*((void *)&v26 + 1) + 8 * v10)];
      id v12 = [v11 outputStreams];
      int v13 = [v12 objectForKey:v6];

      if (v13) {
        break;
      }
      uint64_t v14 = [v11 inputStreams];
      uint64_t v15 = [v14 objectForKey:v6];

      if (v15)
      {
        BOOL v22 = [v15 definition];
        char v21 = [v22 format];
        int v13 = v15;
        goto LABEL_21;
      }

      if (v8 == ++v10)
      {
        uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v38 count:16];
        if (v8) {
          goto LABEL_8;
        }
        goto LABEL_15;
      }
    }
    BOOL v22 = [v13 definition];
    char v21 = [v22 format];
LABEL_21:

    goto LABEL_22;
  }
LABEL_15:

  uint64_t v16 = *MEMORY[0x263F08320];
  uint64_t v36 = *MEMORY[0x263F08320];
  uint64_t v17 = [NSString stringWithFormat:@"stream not found for UUID %@", v6];
  id v37 = v17;
  BOOL v7 = [NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];

  BOOL v19 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v18)
                                                                                      + 912)));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    uint64_t v20 = [v7 objectForKeyedSubscript:v16];
    *(_DWORD *)buf = 136315650;
    __int16 v31 = "ExternalStreamManager.mm";
    __int16 v32 = 1024;
    int v33 = 1164;
    __int16 v34 = 2112;
    uint64_t v35 = v20;
    _os_log_impl(&dword_221E5E000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);
  }
  if (v24)
  {
    [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346924147 userInfo:v7];
    char v21 = 0;
    id *v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v21 = 0;
  }
LABEL_22:

  if (IsFeatureEnabled_SessionBasedMuting) {
    os_unfair_recursive_lock_unlock();
  }

  return v21;
}

- (int64_t)typeForStream:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = (Phase *)a3;
  BOOL IsFeatureEnabled_SessionBasedMuting = Phase::IsFeatureEnabled_SessionBasedMuting(v6);
  if (!IsFeatureEnabled_SessionBasedMuting)
  {
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  os_unfair_recursive_lock_lock_with_options();
  if (a4) {
LABEL_5:
  }
    *a4 = 0;
LABEL_6:
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  BOOL v7 = [*((id *)self + 1) allKeys];
  uint64_t v24 = a4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v27;
LABEL_8:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v27 != v9) {
        objc_enumerationMutation(v7);
      }
      id v11 = [*((id *)self + 1) objectForKey:*(void *)(*((void *)&v26 + 1) + 8 * v10)];
      id v12 = [v11 outputStreams];
      int v13 = [v12 objectForKey:v6];

      if (v13) {
        break;
      }
      uint64_t v14 = [v11 inputStreams];
      uint64_t v15 = [v14 objectForKey:v6];

      if (v15)
      {
        BOOL v22 = [v15 definition];
        int64_t v21 = [v22 streamType];
        int v13 = v15;
        goto LABEL_21;
      }

      if (v8 == ++v10)
      {
        uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v38 count:16];
        if (v8) {
          goto LABEL_8;
        }
        goto LABEL_15;
      }
    }
    BOOL v22 = [v13 definition];
    int64_t v21 = [v22 streamType];
LABEL_21:

    goto LABEL_22;
  }
LABEL_15:

  uint64_t v16 = *MEMORY[0x263F08320];
  uint64_t v36 = *MEMORY[0x263F08320];
  uint64_t v17 = [NSString stringWithFormat:@"stream not found for UUID %@", v6];
  id v37 = v17;
  BOOL v7 = [NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];

  BOOL v19 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v18)
                                                                                      + 912)));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    uint64_t v20 = [v7 objectForKeyedSubscript:v16];
    *(_DWORD *)buf = 136315650;
    __int16 v31 = "ExternalStreamManager.mm";
    __int16 v32 = 1024;
    int v33 = 1199;
    __int16 v34 = 2112;
    uint64_t v35 = v20;
    _os_log_impl(&dword_221E5E000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);
  }
  if (v24)
  {
    [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346924147 userInfo:v7];
    int64_t v21 = 0;
    id *v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int64_t v21 = 0;
  }
LABEL_22:

  if (IsFeatureEnabled_SessionBasedMuting) {
    os_unfair_recursive_lock_unlock();
  }

  return v21;
}

- (unsigned)sessionIdForStream:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = (Phase *)a3;
  BOOL IsFeatureEnabled_SessionBasedMuting = Phase::IsFeatureEnabled_SessionBasedMuting(v6);
  if (!IsFeatureEnabled_SessionBasedMuting)
  {
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  os_unfair_recursive_lock_lock_with_options();
  if (a4) {
LABEL_5:
  }
    *a4 = 0;
LABEL_6:
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  BOOL v7 = [*((id *)self + 1) allKeys];
  uint64_t v24 = a4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v27;
LABEL_8:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v27 != v9) {
        objc_enumerationMutation(v7);
      }
      id v11 = [*((id *)self + 1) objectForKey:*(void *)(*((void *)&v26 + 1) + 8 * v10)];
      id v12 = [v11 outputStreams];
      int v13 = [v12 objectForKey:v6];

      if (v13) {
        break;
      }
      uint64_t v14 = [v11 inputStreams];
      uint64_t v15 = [v14 objectForKey:v6];

      if (v15)
      {
        BOOL v22 = [v15 definition];
        unsigned int v21 = [v22 audioSessionToken];
        int v13 = v15;
        goto LABEL_21;
      }

      if (v8 == ++v10)
      {
        uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v38 count:16];
        if (v8) {
          goto LABEL_8;
        }
        goto LABEL_15;
      }
    }
    BOOL v22 = [v13 definition];
    unsigned int v21 = [v22 audioSessionToken];
LABEL_21:

    goto LABEL_22;
  }
LABEL_15:

  uint64_t v16 = *MEMORY[0x263F08320];
  uint64_t v36 = *MEMORY[0x263F08320];
  uint64_t v17 = [NSString stringWithFormat:@"stream not found for UUID %@", v6];
  id v37 = v17;
  BOOL v7 = [NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];

  BOOL v19 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v18)
                                                                                      + 912)));
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    uint64_t v20 = [v7 objectForKeyedSubscript:v16];
    *(_DWORD *)buf = 136315650;
    __int16 v31 = "ExternalStreamManager.mm";
    __int16 v32 = 1024;
    int v33 = 1235;
    __int16 v34 = 2112;
    uint64_t v35 = v20;
    _os_log_impl(&dword_221E5E000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);
  }
  if (v24)
  {
    [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346924147 userInfo:v7];
    unsigned int v21 = 0;
    id *v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unsigned int v21 = 0;
  }
LABEL_22:

  if (IsFeatureEnabled_SessionBasedMuting) {
    os_unfair_recursive_lock_unlock();
  }

  return v21;
}

- (unique_ptr<Phase::Controller::StreamRenderer,)createRendererForStream:(id)a3 outputChannelLayout:(unsigned int)a4 normalize:(BOOL)a5 targetLKFS:(double)a6 error:(id *)a7
{
  uint64_t v10 = v7;
  uint64_t v63 = *MEMORY[0x263EF8340];
  __int16 v51 = (Phase *)a3;
  BOOL IsFeatureEnabled_SessionBasedMuting = Phase::IsFeatureEnabled_SessionBasedMuting(v51);
  if (IsFeatureEnabled_SessionBasedMuting)
  {
    os_unfair_recursive_lock_lock_with_options();
    if (!a7) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (a7) {
LABEL_5:
  }
    *a7 = 0;
LABEL_6:
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v11 = [*((id *)self + 1) allKeys];
  uint64_t v48 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v52 objects:v62 count:16];
  if (!v12) {
    goto LABEL_14;
  }
  uint64_t v13 = *(void *)v53;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v53 != v13) {
        objc_enumerationMutation(v11);
      }
      uint64_t v15 = *(void **)(*((void *)&v52 + 1) + 8 * i);
      uint64_t v16 = [*((id *)self + 1) objectForKey:v15];
      uint64_t v17 = [v16 outputStreams];
      uint64_t v18 = [v17 objectForKey:v51];

      if (v18)
      {
        v15;

        uint64_t v47 = [objc_alloc(MEMORY[0x263EF9328]) initWithLayoutTag:a4];
        id v25 = objc_alloc(MEMORY[0x263EF9388]);
        [*((id *)self + 4) sampleRate];
        Phase::Logger::GetInstance((Phase::Logger *)objc_msgSend(v25, "initStandardFormatWithSampleRate:channelLayout:", v47));
        long long v26 = [v18 definition];
        BOOL v27 = [v26 streamType] == 1;

        if (!v27) {
          goto LABEL_43;
        }
        if (Phase::gPreferredTuningDirectory)
        {
          (id)Phase::gPreferredTuningDirectory;
          goto LABEL_43;
        }
        long long v28 = (Phase::Controller::DeviceInfo *)objc_alloc_init(MEMORY[0x263F08850]);
        uint64_t AcousticID = Phase::Controller::DeviceInfo::GetAcousticID(v28);
        if ((AcousticID & 0xFF00000000) != 0)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"/Library/Audio/Tunings/%d/PHASE/Voice", AcousticID);
          uint64_t v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v59[0] = 0;
          int v31 = [(Phase::Controller::DeviceInfo *)v28 fileExistsAtPath:v30 isDirectory:v59];
          if (v59[0]) {
            int v32 = v31;
          }
          else {
            int v32 = 0;
          }
          if (v32 == 1)
          {
            objc_storeStrong((id *)&Phase::gPreferredTuningDirectory, v30);
            __int16 v34 = **(id **)(Phase::Logger::GetInstance(v33) + 912);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              *(void *)&uint8_t buf[4] = "ExternalStreamManager.mm";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 47;
              __int16 v57 = 2112;
              __int16 v58 = v30;
              _os_log_impl(&dword_221E5E000, v34, OS_LOG_TYPE_DEFAULT, "%25s:%-5d using AID-specific tuning directory %@", buf, 0x1Cu);
            }
          }
        }
        if (!Phase::gPreferredTuningDirectory)
        {
          v59[0] = 0;
          uint64_t v35 = (Phase::Logger *)[(Phase::Controller::DeviceInfo *)v28 fileExistsAtPath:@"/Library/Audio/Tunings/Generic/PHASE/Voice" isDirectory:v59];
          if (v59[0]) {
            int v36 = (int)v35;
          }
          else {
            int v36 = 0;
          }
          if (v36 == 1)
          {
            id v37 = (void *)Phase::gPreferredTuningDirectory;
            Phase::gPreferredTuningDirectory = @"/Library/Audio/Tunings/Generic/PHASE/Voice";

            uint64_t v39 = **(id **)(Phase::Logger::GetInstance(v38) + 912);
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              *(void *)&uint8_t buf[4] = "ExternalStreamManager.mm";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 59;
              __int16 v57 = 2112;
              __int16 v58 = @"/Library/Audio/Tunings/Generic/PHASE/Voice";
              __int16 v40 = "%25s:%-5d using generic tuning directory %@";
              uint64_t v41 = v39;
              os_log_type_t v42 = OS_LOG_TYPE_DEFAULT;
              uint32_t v43 = 28;
              goto LABEL_39;
            }
          }
          else
          {
            __int16 v44 = **(id **)(Phase::Logger::GetInstance(v35) + 912);
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              *(void *)&uint8_t buf[4] = "ExternalStreamManager.mm";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 63;
              __int16 v40 = "%25s:%-5d cannot find tuning directory";
              uint64_t v41 = v44;
              os_log_type_t v42 = OS_LOG_TYPE_ERROR;
              uint32_t v43 = 18;
LABEL_39:
              _os_log_impl(&dword_221E5E000, v41, v42, v40, buf, v43);
            }
          }
        }

        if (!(id)Phase::gPreferredTuningDirectory)
        {
          id v45 = **(id **)(Phase::Logger::GetInstance(0) + 912);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = "ExternalStreamManager.mm";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 1317;
            _os_log_impl(&dword_221E5E000, v45, OS_LOG_TYPE_ERROR, "%25s:%-5d cannot find directory for voice tunings", buf, 0x12u);
          }
        }
LABEL_43:
        [v18 definition];
        [(id)objc_claimAutoreleasedReturnValue() format];
        objc_claimAutoreleasedReturnValue();
        [v18 definition];
        [(id)objc_claimAutoreleasedReturnValue() maximumFramesToRender];
        [v18 renderBlock];
        objc_claimAutoreleasedReturnValue();
        operator new();
      }
    }
    uint64_t v12 = [v11 countByEnumeratingWithState:&v52 objects:v62 count:16];
  }
  while (v12);
LABEL_14:

  uint64_t v19 = *MEMORY[0x263F08320];
  uint64_t v60 = *MEMORY[0x263F08320];
  uint64_t v20 = [NSString stringWithFormat:@"stream not found for UUID %@", v51];
  uint64_t v61 = v20;
  unsigned int v21 = [NSDictionary dictionaryWithObjects:&v61 forKeys:&v60 count:1];

  unint64_t v23 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v22)
                                                                                      + 912)));
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    uint64_t v24 = [v21 objectForKeyedSubscript:v19];
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "ExternalStreamManager.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1275;
    __int16 v57 = 2112;
    __int16 v58 = v24;
    _os_log_impl(&dword_221E5E000, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);
  }
  if (a7)
  {
    *a7 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346924147 userInfo:v21];
  }
  *uint64_t v48 = 0;

  if (IsFeatureEnabled_SessionBasedMuting) {
    os_unfair_recursive_lock_unlock();
  }

  return v46;
}

- (unint64_t)addControllerPauseStateDidUpdateCallback:(id)a3
{
  id v5 = a3;
  unint64_t v6 = *((void *)self + 17) + 1;
  *((void *)self + 17) = v6;
  BOOL v7 = _Block_copy(v5);
  unint64_t v8 = *((void *)self + 13);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v3 = v6;
      if (v8 <= v6) {
        unint64_t v3 = v6 % v8;
      }
    }
    else
    {
      unint64_t v3 = (v8 - 1) & v6;
    }
    uint64_t v10 = *(void ***)(*((void *)self + 12) + 8 * v3);
    if (v10)
    {
      for (uint64_t i = *v10; i; uint64_t i = (void *)*i)
      {
        unint64_t v12 = i[1];
        if (v12 == v6)
        {
          if (i[2] == v6) {
            goto LABEL_74;
          }
        }
        else
        {
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= v8) {
              v12 %= v8;
            }
          }
          else
          {
            v12 &= v8 - 1;
          }
          if (v12 != v3) {
            break;
          }
        }
      }
    }
  }
  uint64_t i = operator new(0x20uLL);
  uint64_t v13 = (void *)((char *)self + 112);
  *uint64_t i = 0;
  i[1] = v6;
  i[2] = v6;
  i[3] = 0;
  float v14 = (float)(unint64_t)(*((void *)self + 15) + 1);
  float v15 = *((float *)self + 32);
  if (!v8 || (float)(v15 * (float)v8) < v14)
  {
    BOOL v16 = 1;
    if (v8 >= 3) {
      BOOL v16 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v17 = v16 | (2 * v8);
    unint64_t v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18) {
      int8x8_t prime = (int8x8_t)v18;
    }
    else {
      int8x8_t prime = (int8x8_t)v17;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v8 = *((void *)self + 13);
    }
    if (*(void *)&prime > v8) {
      goto LABEL_30;
    }
    if (*(void *)&prime < v8)
    {
      unint64_t v26 = vcvtps_u32_f32((float)*((unint64_t *)self + 15) / *((float *)self + 32));
      if (v8 < 3 || (uint8x8_t v27 = (uint8x8_t)vcnt_s8((int8x8_t)v8), v27.i16[0] = vaddlv_u8(v27), v27.u32[0] > 1uLL))
      {
        unint64_t v26 = std::__next_prime(v26);
      }
      else
      {
        uint64_t v28 = 1 << -(char)__clz(v26 - 1);
        if (v26 >= 2) {
          unint64_t v26 = v28;
        }
      }
      if (*(void *)&prime <= v26) {
        int8x8_t prime = (int8x8_t)v26;
      }
      if (*(void *)&prime >= v8)
      {
        unint64_t v8 = *((void *)self + 13);
      }
      else
      {
        if (prime)
        {
LABEL_30:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          uint64_t v20 = operator new(8 * *(void *)&prime);
          unsigned int v21 = (void *)*((void *)self + 12);
          *((void *)self + 12) = v20;
          if (v21) {
            operator delete(v21);
          }
          uint64_t v22 = 0;
          *((int8x8_t *)self + 13) = prime;
          do
            *(void *)(*((void *)self + 12) + 8 * v22++) = 0;
          while (*(void *)&prime != v22);
          unint64_t v23 = (void *)*v13;
          if (*v13)
          {
            unint64_t v24 = v23[1];
            uint8x8_t v25 = (uint8x8_t)vcnt_s8(prime);
            v25.i16[0] = vaddlv_u8(v25);
            if (v25.u32[0] > 1uLL)
            {
              if (v24 >= *(void *)&prime) {
                v24 %= *(void *)&prime;
              }
            }
            else
            {
              v24 &= *(void *)&prime - 1;
            }
            *(void *)(*((void *)self + 12) + 8 * v24) = v13;
            long long v29 = (void *)*v23;
            if (*v23)
            {
              do
              {
                unint64_t v30 = v29[1];
                if (v25.u32[0] > 1uLL)
                {
                  if (v30 >= *(void *)&prime) {
                    v30 %= *(void *)&prime;
                  }
                }
                else
                {
                  v30 &= *(void *)&prime - 1;
                }
                if (v30 != v24)
                {
                  uint64_t v31 = *((void *)self + 12);
                  if (!*(void *)(v31 + 8 * v30))
                  {
                    *(void *)(v31 + 8 * v30) = v23;
                    goto LABEL_55;
                  }
                  *unint64_t v23 = *v29;
                  void *v29 = **(void **)(*((void *)self + 12) + 8 * v30);
                  **(void **)(*((void *)self + 12) + 8 * v30) = v29;
                  long long v29 = v23;
                }
                unint64_t v30 = v24;
LABEL_55:
                unint64_t v23 = v29;
                long long v29 = (void *)*v29;
                unint64_t v24 = v30;
              }
              while (v29);
            }
          }
          unint64_t v8 = (unint64_t)prime;
          goto LABEL_59;
        }
        id v37 = (void *)*((void *)self + 12);
        *((void *)self + 12) = 0;
        if (v37) {
          operator delete(v37);
        }
        unint64_t v8 = 0;
        *((void *)self + 13) = 0;
      }
    }
LABEL_59:
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v6) {
        unint64_t v3 = v6 % v8;
      }
      else {
        unint64_t v3 = v6;
      }
    }
    else
    {
      unint64_t v3 = (v8 - 1) & v6;
    }
  }
  uint64_t v32 = *((void *)self + 12);
  int v33 = *(void **)(v32 + 8 * v3);
  if (v33)
  {
    *uint64_t i = *v33;
LABEL_72:
    void *v33 = i;
    goto LABEL_73;
  }
  *uint64_t i = *v13;
  *uint64_t v13 = i;
  *(void *)(v32 + 8 * v3) = v13;
  if (*i)
  {
    unint64_t v34 = *(void *)(*i + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v34 >= v8) {
        v34 %= v8;
      }
    }
    else
    {
      v34 &= v8 - 1;
    }
    int v33 = (void *)(*((void *)self + 12) + 8 * v34);
    goto LABEL_72;
  }
LABEL_73:
  ++*((void *)self + 15);
LABEL_74:
  uint64_t v35 = (void *)i[3];
  i[3] = v7;

  return v6;
}

- (void)removeControllerPauseStateDidUpdateCallback:(unint64_t)a3
{
  unint64_t v3 = *((void *)self + 13);
  if (!v3) {
    return;
  }
  uint8x8_t v4 = (uint8x8_t)vcnt_s8((int8x8_t)v3);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = a3;
    if (v3 <= a3) {
      unint64_t v5 = a3 % v3;
    }
  }
  else
  {
    unint64_t v5 = (v3 - 1) & a3;
  }
  uint64_t v6 = *((void *)self + 12);
  BOOL v7 = *(void ***)(v6 + 8 * v5);
  if (!v7) {
    return;
  }
  unint64_t v8 = *v7;
  if (!*v7) {
    return;
  }
  unint64_t v9 = v3 - 1;
  while (1)
  {
    unint64_t v10 = v8[1];
    if (v10 == a3) {
      break;
    }
    if (v4.u32[0] > 1uLL)
    {
      if (v10 >= v3) {
        v10 %= v3;
      }
    }
    else
    {
      v10 &= v9;
    }
    if (v10 != v5) {
      return;
    }
LABEL_17:
    unint64_t v8 = (void *)*v8;
    if (!v8) {
      return;
    }
  }
  if (v8[2] != a3) {
    goto LABEL_17;
  }
  id v11 = (void *)*v8;
  if (v4.u32[0] > 1uLL)
  {
    if (v3 <= a3) {
      a3 %= v3;
    }
  }
  else
  {
    a3 &= v9;
  }
  unint64_t v12 = *(void **)(v6 + 8 * a3);
  do
  {
    uint64_t v13 = v12;
    unint64_t v12 = (void *)*v12;
  }
  while (v12 != v8);
  if (v13 == (void *)((char *)self + 112)) {
    goto LABEL_36;
  }
  unint64_t v14 = v13[1];
  if (v4.u32[0] > 1uLL)
  {
    if (v14 >= v3) {
      v14 %= v3;
    }
  }
  else
  {
    v14 &= v9;
  }
  if (v14 == a3)
  {
LABEL_38:
    if (v11)
    {
      unint64_t v15 = v11[1];
      goto LABEL_40;
    }
  }
  else
  {
LABEL_36:
    if (!v11) {
      goto LABEL_37;
    }
    unint64_t v15 = v11[1];
    if (v4.u32[0] > 1uLL)
    {
      unint64_t v16 = v11[1];
      if (v15 >= v3) {
        unint64_t v16 = v15 % v3;
      }
    }
    else
    {
      unint64_t v16 = v15 & v9;
    }
    if (v16 != a3)
    {
LABEL_37:
      *(void *)(v6 + 8 * a3) = 0;
      id v11 = (void *)*v8;
      goto LABEL_38;
    }
LABEL_40:
    if (v4.u32[0] > 1uLL)
    {
      if (v15 >= v3) {
        v15 %= v3;
      }
    }
    else
    {
      v15 &= v9;
    }
    if (v15 != a3)
    {
      *(void *)(*((void *)self + 12) + 8 * v15) = v13;
      id v11 = (void *)*v8;
    }
  }
  *uint64_t v13 = v11;
  void *v8 = 0;
  --*((void *)self + 15);

  operator delete(v8);
}

- (void)updateController:(id)a3 pauseState:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v6 = (Phase *)a3;
  BOOL IsFeatureEnabled_SessionBasedMuting = Phase::IsFeatureEnabled_SessionBasedMuting(v6);
  if (IsFeatureEnabled_SessionBasedMuting)
  {
    unint64_t v15 = (char *)self + 88;
    os_unfair_recursive_lock_lock_with_options();
  }
  else
  {
    unint64_t v15 = 0;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  objc_msgSend(*((id *)self + 1), "allKeys", v15);
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v18 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        unint64_t v10 = [*((id *)self + 1) objectForKey:v9];
        id v11 = [v10 outputStreams];
        unint64_t v12 = [v11 objectForKey:v6];

        if (v12)
        {
          [v12 setControllerPaused:v4];
          for (uint64_t j = (uint64_t **)*((void *)self + 14); j; uint64_t j = (uint64_t **)*j)
          {
            unint64_t v14 = (void (**)(void *, void, Phase *, BOOL))_Block_copy(j[3]);
            v14[2](v14, v9, v6, v4);
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  if (IsFeatureEnabled_SessionBasedMuting) {
    os_unfair_recursive_lock_unlock();
  }
}

- (void)gatherDebugInformation:(id)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  long long v29 = (Phase *)a3;
  BOOL IsFeatureEnabled_SessionBasedMuting = Phase::IsFeatureEnabled_SessionBasedMuting(v29);
  if (IsFeatureEnabled_SessionBasedMuting) {
    os_unfair_recursive_lock_lock_with_options();
  }
  uint64_t v32 = objc_opt_new();
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obuint64_t j = *((id *)self + 1);
  uint64_t v33 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v33)
  {
    uint64_t v31 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v49 != v31) {
          objc_enumerationMutation(obj);
        }
        unint64_t v3 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        uint64_t v39 = objc_alloc_init(PHASEExternalStreamGroupDebugInfo);
        uint64_t v35 = v3;
        BOOL v4 = [*((id *)self + 1) objectForKey:v3];
        unint64_t v5 = [v4 controllingClientID];
        [(PHASEExternalStreamGroupDebugInfo *)v39 setControlled:v5 != 0];

        uint64_t v6 = objc_opt_new();
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v37 = [v4 outputStreams];
        uint64_t v7 = [v37 countByEnumeratingWithState:&v44 objects:v53 count:16];
        if (v7)
        {
          uint64_t v8 = *(void *)v45;
          do
          {
            for (uint64_t j = 0; j != v7; ++j)
            {
              if (*(void *)v45 != v8) {
                objc_enumerationMutation(v37);
              }
              unint64_t v10 = *(void **)(*((void *)&v44 + 1) + 8 * j);
              id v11 = objc_alloc_init(PHASEExternalStreamDebugInfo);
              unint64_t v12 = [v4 outputStreams];
              uint64_t v13 = [v12 objectForKey:v10];

              -[PHASEExternalStreamDebugInfo setStreamPaused:](v11, "setStreamPaused:", [v13 isStreamPaused]);
              [(PHASEExternalStreamDebugInfo *)v11 setInput:0];
              unint64_t v14 = [v13 definition];
              unint64_t v15 = [v14 format];
              [(PHASEExternalStreamDebugInfo *)v11 setClientFormat:v15];

              -[PHASEExternalStreamGroupDebugInfo setControllerPaused:](v39, "setControllerPaused:", [v13 isControllerPaused]);
              unint64_t v16 = [v10 UUIDString];
              [v6 setObject:v11 forKey:v16];
            }
            uint64_t v7 = [v37 countByEnumeratingWithState:&v44 objects:v53 count:16];
          }
          while (v7);
        }

        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v38 = [v4 inputStreams];
        uint64_t v17 = [v38 countByEnumeratingWithState:&v40 objects:v52 count:16];
        if (v17)
        {
          uint64_t v18 = *(void *)v41;
          do
          {
            for (uint64_t k = 0; k != v17; ++k)
            {
              if (*(void *)v41 != v18) {
                objc_enumerationMutation(v38);
              }
              long long v20 = *(void **)(*((void *)&v40 + 1) + 8 * k);
              long long v21 = objc_alloc_init(PHASEExternalStreamDebugInfo);
              long long v22 = [v4 inputStreams];
              unint64_t v23 = [v22 objectForKey:v20];

              -[PHASEExternalStreamDebugInfo setStreamPaused:](v21, "setStreamPaused:", [v23 isStreamPaused]);
              [(PHASEExternalStreamDebugInfo *)v21 setInput:1];
              uint64_t v24 = [v23 definition];
              uint8x8_t v25 = [v24 format];
              [(PHASEExternalStreamDebugInfo *)v21 setClientFormat:v25];

              unint64_t v26 = [v20 UUIDString];
              [v6 setObject:v21 forKey:v26];
            }
            uint64_t v17 = [v38 countByEnumeratingWithState:&v40 objects:v52 count:16];
          }
          while (v17);
        }

        [(PHASEExternalStreamGroupDebugInfo *)v39 setStreams:v6];
        uint8x8_t v27 = [v35 UUIDString];
        [v32 setObject:v39 forKey:v27];
      }
      uint64_t v33 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
    }
    while (v33);
  }

  (*((void (**)(Phase *, void *, void))v29 + 2))(v29, v32, 0);
  if (IsFeatureEnabled_SessionBasedMuting) {
    os_unfair_recursive_lock_unlock();
  }
}

- (void).cxx_destruct
{
  unint64_t v3 = (id *)*((void *)self + 14);
  if (v3)
  {
    do
    {
      BOOL v4 = (id *)*v3;

      operator delete(v3);
      unint64_t v3 = v4;
    }
    while (v4);
  }
  unint64_t v5 = (void *)*((void *)self + 12);
  *((void *)self + 12) = 0;
  if (v5) {
    operator delete(v5);
  }
  Phase::Commandable<128,Phase::LockFreeQueueMPSC>::~Commandable((void *)self + 6);
  objc_storeStrong((id *)self + 4, 0);

  objc_storeStrong((id *)self + 1, 0);
}

- (id).cxx_construct
{
  v2 = (void *)((char *)self + 48);
  Phase::Logger::GetInstance((Phase::Logger *)self);
  Phase::Commandable<128,Phase::LockFreeQueueMPSC>::Commandable(v2);
}

- (uint64_t)setExternalInputStreamSessionMute:(uint64_t)a1 isMuted:fadeTimeInSeconds:
{
  return a1;
}

- (void)setExternalInputStreamSessionMute:(uint64_t)a1 isMuted:fadeTimeInSeconds:
{
  JUMPOUT(0x223C938A0);
}

- (uint64_t)setExternalInputStreamSessionMute:isMuted:fadeTimeInSeconds:
{
  LODWORD(a2) = *(_DWORD *)(a1 + 24);
  return [*(id *)(a1 + 8) _fadeInputStreamsInSessionToken:*(unsigned int *)(a1 + 16) isMuted:*(unsigned __int8 *)(a1 + 20) fadeTimeInSeconds:0 synchronous:a2];
}

- (id)updateExternalInputStreamRecordingAbility:(id *)a1 streamID:canRecord:
{
  return a1;
}

- (void)updateExternalInputStreamRecordingAbility:(id *)a1 streamID:canRecord:
{
  JUMPOUT(0x223C938A0);
}

- (void)updateExternalInputStreamRecordingAbility:streamID:canRecord:
{
  id v2 = *(id *)(a1 + 8);
  if (v2) {
    [v2 _updateRecordingAbility:*(void *)(a1 + 16) streamID:*(void *)(a1 + 24) canRecord:*(unsigned __int8 *)(a1 + 32)];
  }
}

@end