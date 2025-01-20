@interface VCAudioClient
- (AVAudioDevice)inputDevice;
- (AVAudioDevice)outputDevice;
- (BOOL)isFollowSystemInputEnabled;
- (BOOL)isFollowSystemOutputEnabled;
- (BOOL)isMixingVoiceWithMediaEnabled;
- (BOOL)isMuted;
- (BOOL)isMutedStateChangeHandlerRegistered;
- (BOOL)isMutedTalkerNotificationRegistered;
- (BOOL)resetAudioSessionOutputPortOverride:(id *)a3;
- (BOOL)setCurrentAudioDevice:(id)a3 type:(BOOL)a4;
- (BOOL)setupAudioIO;
- (BOOL)startAudioSessionWithError:(id *)a3;
- (BOOL)startWithError:(id *)a3;
- (BOOL)stopAudioSessionWithError:(id *)a3;
- (BOOL)stopWithError:(id *)a3;
- (VCAudioClient)initWithProcessId:(int)a3;
- (VCAudioIO)audioIO;
- (id)getCurrentAudioDeviceWithType:(BOOL)a3;
- (int)processId;
- (void)cleanupAudioIO;
- (void)cleanupSpatialAudio;
- (void)dealloc;
- (void)lock;
- (void)serverDidDie;
- (void)setAudioIO:(id)a3;
- (void)setAudioSessionProperties:(id)a3;
- (void)setFollowSystemInput:(BOOL)a3;
- (void)setFollowSystemOutput:(BOOL)a3;
- (void)setIsMuted:(BOOL)a3;
- (void)setIsMutedStateChangeHandlerRegistered:(BOOL)a3;
- (void)setIsMutedTalkerNotificationRegistered:(BOOL)a3;
- (void)setMixingVoiceWithMediaEnabled:(BOOL)a3;
- (void)setupAudioIO;
- (void)setupSpatialAudio;
- (void)startAudioIOWithCompletionHandler:(id)a3;
- (void)stopAudioIOWithCompletionHandler:(id)a3;
- (void)unlock;
@end

@implementation VCAudioClient

- (VCAudioClient)initWithProcessId:(int)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)VCAudioClient;
  v4 = [(VCAudioClient *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_processId = a3;
    v4->_state = 0;
    v4->_audioSession = (VCAudioSession *)+[VCAudioSession sharedVoiceChatInstance];
    v5->_audioManager = (VCAudioManager *)+[VCAudioManager sharedVoiceChatInstance];
    pthread_mutex_init(&v5->_stateMutex, 0);
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  pthread_mutex_destroy(&self->_stateMutex);
  v3.receiver = self;
  v3.super_class = (Class)VCAudioClient;
  [(VCAudioClient *)&v3 dealloc];
}

- (void)lock
{
}

- (void)unlock
{
}

- (BOOL)isMuted
{
  if (!VCFeatureFlagManager_SessionBasedMutingEnabled()) {
    return self->_muted;
  }
  audioSession = self->_audioSession;

  return [(VCAudioSession *)audioSession microphoneMuted];
}

- (void)setIsMuted:(BOOL)a3
{
  self->_BOOL muted = a3;
  if (VCFeatureFlagManager_SessionBasedMutingEnabled()) {
    [(VCAudioSession *)self->_audioSession setMicrophoneMuted:self->_muted];
  }
  audioManager = self->_audioManager;
  BOOL muted = self->_muted;

  [(VCAudioManager *)audioManager setMicrophoneMuted:muted];
}

- (void)setMixingVoiceWithMediaEnabled:(BOOL)a3
{
  self->_mixingVoiceWithMediaEnabled = a3;
  -[VCAudioManager setMixingVoiceWithMediaEnabled:](self->_audioManager, "setMixingVoiceWithMediaEnabled:");
}

- (void)setFollowSystemInput:(BOOL)a3
{
  self->_followSystemInput = a3;
}

- (void)setFollowSystemOutput:(BOOL)a3
{
  self->_followSystemOutput = a3;
}

- (BOOL)resetAudioSessionOutputPortOverride:(id *)a3
{
  return 1;
}

- (void)setAudioSessionProperties:(id)a3
{
  self->_requestedSettings.isValid = +[VCAudioSession convertAudioSessionProperties:a3 operatingMode:&self->_requestedSettings.operatingMode deviceRole:&self->_requestedSettings.deviceRole enableAudioPreWarming:&self->_requestedSettings.enableAudioPreWarming audioClockDeviceEnabled:&self->_requestedSettings.audioClockDeviceEnabled networkUplinkClockUsesBaseband:&self->_requestedSettings.networkUplinkClockUsesBaseband];
  [(VCAudioSession *)self->_audioSession setAudioSessionProperties:a3];
  uint64_t v5 = [a3 objectForKeyedSubscript:@"kAUVoiceIOProperty_MediaPlaybackOnExternalDevice"];
  if (v5)
  {
    v6 = (void *)v5;
    id v7 = +[VCAudioManager sharedVoiceChatInstance];
    uint64_t v8 = [v6 BOOLValue];
    [v7 setMediaPlaybackOnExternalDevice:v8];
  }
}

- (BOOL)startWithError:(id *)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3052000000;
  v19 = __Block_byref_object_copy__14;
  v20 = __Block_byref_object_dispose__14;
  uint64_t v21 = 0;
  float v5 = micro();
  self->_lastAudioSessionStart = v5;
  if (self->_requestedSettings.isValid)
  {
    if (self->_requestedSettings.enableAudioPreWarming)
    {
      v6 = dispatch_semaphore_create(0);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __32__VCAudioClient_startWithError___block_invoke;
      v15[3] = &unk_1E6DB6FB8;
      v15[6] = &v16;
      v15[4] = v6;
      v15[5] = &v22;
      [(VCAudioClient *)self startAudioIOWithCompletionHandler:v15];
      dispatch_time_t v7 = dispatch_time(0, 5000000000);
      if (dispatch_semaphore_wait(v6, v7))
      {
        if ((VCAudioClient *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCAudioClient startWithError:]();
            }
          }
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            uint64_t v8 = (__CFString *)[(VCAudioClient *)self performSelector:sel_logPrefix];
          }
          else {
            uint64_t v8 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v11 = VRTraceErrorLogLevelToCSTR();
            v12 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              uint64_t v27 = v11;
              __int16 v28 = 2080;
              v29 = "-[VCAudioClient startWithError:]";
              __int16 v30 = 1024;
              int v31 = 177;
              __int16 v32 = 2112;
              v33 = v8;
              __int16 v34 = 2048;
              v35 = self;
              _os_log_error_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Timeout occured while waiting for audio IO start!", buf, 0x30u);
              if (!a3) {
                goto LABEL_28;
              }
              goto LABEL_26;
            }
          }
        }
        if (a3)
        {
LABEL_26:
          v10 = (void *)[MEMORY[0x1E4F28C58] AVConferenceServiceError:32005 detailCode:0 description:@"Timeout while starting the client"];
          goto LABEL_27;
        }
      }
      else if (a3)
      {
        v10 = (void *)v17[5];
LABEL_27:
        *a3 = v10;
      }
LABEL_28:
      id v13 = (id)v17[5];
      dispatch_release(v6);
      BOOL v9 = *((unsigned char *)v23 + 24) != 0;
      goto LABEL_29;
    }
    BOOL v9 = [(VCAudioClient *)self startAudioSessionWithError:a3];
    *((unsigned char *)v23 + 24) = v9;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if (VRTraceIsOSFaultDisabled())
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioClient startWithError:]();
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        -[VCAudioClient startWithError:]();
      }
    }
    BOOL v9 = 0;
    if (a3) {
      *a3 = (id)[MEMORY[0x1E4F28C58] AVConferenceServiceError:32006 detailCode:0 description:@"Session parameters have not been set"];
    }
  }
LABEL_29:
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
  return v9;
}

intptr_t __32__VCAudioClient_startWithError___block_invoke(void *a1, char a2, void *a3)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a2;
  *(void *)(*(void *)(a1[6] + 8) + 40) = a3;
  uint64_t v4 = a1[4];

  return dispatch_semaphore_signal(v4);
}

- (BOOL)stopWithError:(id *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3052000000;
  uint64_t v18 = __Block_byref_object_copy__14;
  v19 = __Block_byref_object_dispose__14;
  uint64_t v20 = 0;
  if (self->_selectedSettings.enableAudioPreWarming)
  {
    float v5 = dispatch_semaphore_create(0);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __31__VCAudioClient_stopWithError___block_invoke;
    v14[3] = &unk_1E6DB6FE0;
    v14[7] = &v15;
    v14[8] = a3;
    v14[5] = v5;
    v14[6] = &v21;
    v14[4] = self;
    [(VCAudioClient *)self stopAudioIOWithCompletionHandler:v14];
    dispatch_time_t v6 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v5, v6))
    {
      if ((VCAudioClient *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCAudioClient stopWithError:]();
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          dispatch_time_t v7 = (__CFString *)[(VCAudioClient *)self performSelector:sel_logPrefix];
        }
        else {
          dispatch_time_t v7 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v10 = VRTraceErrorLogLevelToCSTR();
          uint64_t v11 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v26 = v10;
            __int16 v27 = 2080;
            __int16 v28 = "-[VCAudioClient stopWithError:]";
            __int16 v29 = 1024;
            int v30 = 213;
            __int16 v31 = 2112;
            __int16 v32 = v7;
            __int16 v33 = 2048;
            __int16 v34 = self;
            _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Timeout occured while waiting for audio IO stop!", buf, 0x30u);
            if (!a3) {
              goto LABEL_18;
            }
            goto LABEL_16;
          }
        }
      }
      if (a3)
      {
LABEL_16:
        BOOL v9 = (void *)[MEMORY[0x1E4F28C58] AVConferenceServiceError:32005 detailCode:0 description:@"Timeout while stopping the client"];
        goto LABEL_17;
      }
    }
    else if (a3)
    {
      BOOL v9 = (void *)v16[5];
LABEL_17:
      *a3 = v9;
    }
LABEL_18:
    id v12 = (id)v16[5];
    dispatch_release(v5);
    BOOL v8 = *((unsigned char *)v22 + 24) != 0;
    goto LABEL_19;
  }
  BOOL v8 = [(VCAudioClient *)self stopAudioSessionWithError:a3];
  *((unsigned char *)v22 + 24) = v8;
LABEL_19:
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  return v8;
}

intptr_t __31__VCAudioClient_stopWithError___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    dispatch_time_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v10 = 136315906;
      uint64_t v11 = v6;
      __int16 v12 = 2080;
      id v13 = "-[VCAudioClient stopWithError:]_block_invoke";
      __int16 v14 = 1024;
      int v15 = 202;
      __int16 v16 = 2048;
      uint64_t v17 = v8;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCAudioClient=%p", (uint8_t *)&v10, 0x26u);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  if ((a2 & 1) == 0 && *(void *)(a1 + 64)) {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = a3;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)startAudioSessionWithError:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  unsigned int v19 = -1431655766;
  double v17 = NAN;
  *(void *)uint64_t v18 = -1;
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v18[8] = v5;
  *(_OWORD *)&v18[24] = v5;
  [(VCAudioClient *)self lock];
  if (self->_state)
  {
    [(VCAudioSession *)self->_audioSession refreshAudioSessionProperties];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      dispatch_time_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int processId = self->_processId;
        unsigned int state = self->_state;
        *(_DWORD *)buf = 136316162;
        uint64_t v21 = v6;
        __int16 v22 = 2080;
        uint64_t v23 = "-[VCAudioClient startAudioSessionWithError:]";
        __int16 v24 = 1024;
        int v25 = 265;
        __int16 v26 = 1024;
        int v27 = processId;
        __int16 v28 = 1024;
        unsigned int v29 = state;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d client is already running! (client PID=%d) state=%d", buf, 0x28u);
      }
    }
    LOBYTE(v10) = 0;
    if (a3) {
      *a3 = (id)[MEMORY[0x1E4F28C58] AVConferenceServiceError:32025 detailCode:0 description:@"Audio client was already started"];
    }
  }
  else
  {
    [(VCAudioManager *)self->_audioManager getPreferredFormat:v18 blockSize:&v17 vpOperatingMode:&v19 forOperatingMode:self->_requestedSettings.operatingMode deviceRole:self->_requestedSettings.deviceRole suggestedFormat:0];
    uint64_t v11 = objc_alloc_init(VCAudioSessionMediaProperties);
    [(VCAudioSessionMediaProperties *)v11 setPreferredSampleRate:*(double *)v18];
    [(VCAudioSessionMediaProperties *)v11 setPreferredBlockSize:v17];
    [(VCAudioSessionMediaProperties *)v11 setOperatingMode:self->_requestedSettings.operatingMode];
    [(VCAudioSessionMediaProperties *)v11 setVpOperatingMode:v19];
    v15[0] = *(_OWORD *)v18;
    v15[1] = *(_OWORD *)&v18[16];
    uint64_t v16 = *(void *)&v18[32];
    [(VCAudioSessionMediaProperties *)v11 setInputFormat:v15];
    v13[0] = *(_OWORD *)v18;
    v13[1] = *(_OWORD *)&v18[16];
    uint64_t v14 = *(void *)&v18[32];
    [(VCAudioSessionMediaProperties *)v11 setOutputFormat:v13];
    [(VCAudioSessionMediaProperties *)v11 setProcessId:self->_processId];
    [(VCAudioSessionMediaProperties *)v11 setNetworkUplinkClockUsesBaseband:self->_requestedSettings.networkUplinkClockUsesBaseband];
    [(VCAudioSessionMediaProperties *)v11 setAudioClockDeviceEnabled:self->_requestedSettings.audioClockDeviceEnabled];
    BOOL v10 = [(VCAudioSession *)self->_audioSession startClient:self clientType:2 mediaProperties:v11 sessionRef:0];
    if (v10)
    {
      self->_unsigned int state = 5;
      self->_selectedSettings = self->_requestedSettings;
    }
  }
  [(VCAudioClient *)self unlock];
  return v10;
}

- (BOOL)stopAudioSessionWithError:(id *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(VCAudioClient *)self lock];
  unsigned int state = self->_state;
  if (state == 5)
  {
    [(VCAudioSession *)self->_audioSession stopClient:self];
    self->_unsigned int state = 0;
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int processId = self->_processId;
      int v9 = 136315906;
      uint64_t v10 = v5;
      __int16 v11 = 2080;
      __int16 v12 = "-[VCAudioClient stopAudioSessionWithError:]";
      __int16 v13 = 1024;
      int v14 = 290;
      __int16 v15 = 1024;
      int v16 = processId;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Stop requested but the client is not started! (client PID=%d)", (uint8_t *)&v9, 0x22u);
    }
  }
  [(VCAudioClient *)self unlock];
  return state == 5;
}

- (void)setupSpatialAudio
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (+[VCHardwareSettings isSpatialAudioSupported])
  {
    int v3 = [(VCAudioManager *)self->_audioManager registerAudioSessionId:self->_audioSessionId maxChannelCountMic:1 maxChannelCountSpeaker:32 spatialMetadata:0];
    if (v3 < 0)
    {
      int v4 = v3;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v5 = VRTraceErrorLogLevelToCSTR();
        uint64_t v6 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v7 = 136315906;
          uint64_t v8 = v5;
          __int16 v9 = 2080;
          uint64_t v10 = "-[VCAudioClient setupSpatialAudio]";
          __int16 v11 = 1024;
          int v12 = 313;
          __int16 v13 = 1024;
          int v14 = v4;
          _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to register for spatial audio. status=%08x", (uint8_t *)&v7, 0x22u);
        }
      }
    }
  }
}

- (void)cleanupSpatialAudio
{
  if (+[VCHardwareSettings isSpatialAudioSupported])
  {
    audioManager = self->_audioManager;
    uint64_t audioSessionId = self->_audioSessionId;
    [(VCAudioManager *)audioManager unregisterAudioSessionId:audioSessionId];
  }
}

- (BOOL)setupAudioIO
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v23[0] = xmmword_1E259FAE0;
  v23[1] = unk_1E259FAF0;
  long long v24 = xmmword_1E259FB00;
  int64_t v3 = +[VCHardwareSettings deviceClass];
  double v4 = dbl_1E259FAD0[+[VCHardwareSettings deviceClass] == 8];
  if (v3 == 8) {
    uint64_t v5 = 48000;
  }
  else {
    uint64_t v5 = 24000;
  }
  *(double *)uint64_t v23 = (double)(int)VCDefaults_GetIntValueForKey(@"forceAudioSampleRate", v5);
  DWORD2(v24) = (VCDefaults_GetDoubleValueForKey(@"forceAudioBlockSize", v4) * *(double *)v23);
  self->_uint64_t audioSessionId = VCUniqueIDGenerator_GenerateID();
  self->_selectedSettings = self->_requestedSettings;
  [(VCAudioClient *)self setupSpatialAudio];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  LODWORD(v9) = self->_audioSessionId;
  *((void *)&v9 + 1) = *(void *)&self->_selectedSettings.operatingMode;
  BYTE4(v10) = 3;
  LODWORD(v11) = self->_processId;
  BYTE12(v11) = 1;
  DWORD2(v12) = 1;
  long long v13 = 0uLL;
  BYTE8(v22) = self->_selectedSettings.networkUplinkClockUsesBaseband;
  uint64_t v6 = [[VCAudioIO alloc] initWithConfiguration:&v9];
  int v7 = v6;
  self->_audioIO = v6;
  if (v6)
  {
    -[VCAudioIO setClientFormat:](v6, "setClientFormat:", v23, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22);
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioClient setupAudioIO]();
      }
    }
    [(VCAudioClient *)self cleanupAudioIO];
  }
  return v7 != 0;
}

- (void)cleanupAudioIO
{
  self->_uint64_t audioSessionId = 0;
}

- (void)startAudioIOWithCompletionHandler:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  [(VCAudioClient *)self lock];
  unsigned int state = self->_state;
  if (state == 5 || state == 0) {
    [(VCAudioClient *)self setupAudioIO];
  }
  if (self->_audioIO)
  {
    unsigned int v7 = self->_state;
    if (v7)
    {
      if (v7 != 5)
      {
        if (v7 == 3)
        {
          [(VCAudioClient *)self unlock];
          if (!a3) {
            return;
          }
          uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
          long long v9 = @"Audio IO is busy";
          uint64_t v10 = 32026;
          goto LABEL_32;
        }
        [(VCAudioSession *)self->_audioSession refreshAudioSessionProperties];
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          uint64_t v20 = VRTraceErrorLogLevelToCSTR();
          long long v21 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int processId = self->_processId;
            unsigned int v23 = self->_state;
            *(_DWORD *)buf = 136316162;
            uint64_t v28 = v20;
            __int16 v29 = 2080;
            uint64_t v30 = "-[VCAudioClient startAudioIOWithCompletionHandler:]";
            __int16 v31 = 1024;
            int v32 = 452;
            __int16 v33 = 1024;
            unsigned int v34 = processId;
            __int16 v35 = 1024;
            unsigned int v36 = v23;
            _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d client is already running! (client PID=%d) state=%d", buf, 0x28u);
          }
        }
        [(VCAudioClient *)self unlock];
        if (a3)
        {
          uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
          long long v9 = @"Audio client was already started";
          uint64_t v10 = 32025;
LABEL_32:
          (*((void (**)(id, void, uint64_t))a3 + 2))(a3, 0, [v8 AVConferenceServiceError:v10 detailCode:0 description:v9]);
          return;
        }
        return;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v17 = VRTraceErrorLogLevelToCSTR();
        long long v18 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v19 = self->_state;
          *(_DWORD *)buf = 136315906;
          uint64_t v28 = v17;
          __int16 v29 = 2080;
          uint64_t v30 = "-[VCAudioClient startAudioIOWithCompletionHandler:]";
          __int16 v31 = 1024;
          int v32 = 442;
          __int16 v33 = 1024;
          unsigned int v34 = v19;
          _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Upgrade detected. Need to start audioIO, unsigned int state = %d", buf, 0x22u);
        }
      }
      [(VCAudioSession *)self->_audioSession refreshAudioSessionProperties];
      unsigned int v16 = 4;
    }
    else
    {
      unsigned int v16 = 1;
    }
    self->_unsigned int state = v16;
    [(VCAudioClient *)self unlock];
    [(VCAudioIO *)self->_audioIO startWithCompletionHandler:&v26];
    return;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    char IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
    long long v13 = *MEMORY[0x1E4F47A50];
    if (IsOSFaultDisabled)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v14 = self->_processId;
        unsigned int v15 = self->_state;
        *(_DWORD *)buf = 136316162;
        uint64_t v28 = v11;
        __int16 v29 = 2080;
        uint64_t v30 = "-[VCAudioClient startAudioIOWithCompletionHandler:]";
        __int16 v31 = 1024;
        int v32 = 421;
        __int16 v33 = 1024;
        unsigned int v34 = v14;
        __int16 v35 = 1024;
        unsigned int v36 = v15;
        _os_log_error_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_ERROR, " [%s] %s:%d AudioIO is nil! (client PID=%d), state:%d", buf, 0x28u);
      }
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
    {
      int v24 = self->_processId;
      unsigned int v25 = self->_state;
      *(_DWORD *)buf = 136316162;
      uint64_t v28 = v11;
      __int16 v29 = 2080;
      uint64_t v30 = "-[VCAudioClient startAudioIOWithCompletionHandler:]";
      __int16 v31 = 1024;
      int v32 = 421;
      __int16 v33 = 1024;
      unsigned int v34 = v24;
      __int16 v35 = 1024;
      unsigned int v36 = v25;
      _os_log_fault_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_FAULT, " [%s] %s:%d AudioIO is nil! (client PID=%d), state:%d", buf, 0x28u);
    }
  }
  [(VCAudioClient *)self unlock];
  if (a3)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
    long long v9 = @"Audio IO is nil";
    uint64_t v10 = 32015;
    goto LABEL_32;
  }
}

uint64_t __51__VCAudioClient_startAudioIOWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) lock];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    unsigned int v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = *(_DWORD *)(*(void *)(a1 + 32) + 28);
      int v13 = 136316162;
      uint64_t v14 = v6;
      __int16 v15 = 2080;
      unsigned int v16 = "-[VCAudioClient startAudioIOWithCompletionHandler:]_block_invoke";
      __int16 v17 = 1024;
      int v18 = 392;
      __int16 v19 = 1024;
      int v20 = v8;
      __int16 v21 = 1024;
      int v22 = a2;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Completion handler. State=%d, success=%d", (uint8_t *)&v13, 0x28u);
    }
  }
  uint64_t v9 = *(void *)(a1 + 32);
  int v10 = *(_DWORD *)(v9 + 28);
  if (v10 == 4)
  {
    objc_msgSend(*(id *)(v9 + 152), "stopClient:");
    if (a2) {
      int v11 = 2;
    }
    else {
      int v11 = 0;
    }
    *(_DWORD *)(*(void *)(a1 + 32) + 28) = v11;
  }
  else if (v10 == 1)
  {
    if (a2)
    {
      *(_DWORD *)(v9 + 28) = 2;
    }
    else
    {
      *(_DWORD *)(v9 + 28) = 0;
      [*(id *)(a1 + 32) cleanupAudioIO];
    }
  }
  [*(id *)(a1 + 32) unlock];
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3);
  }
  return result;
}

- (void)stopAudioIOWithCompletionHandler:(id)a3
{
  v5[6] = *MEMORY[0x1E4F143B8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__VCAudioClient_stopAudioIOWithCompletionHandler___block_invoke;
  v5[3] = &unk_1E6DB5860;
  v5[4] = self;
  v5[5] = a3;
  [(VCAudioClient *)self lock];
  if (self->_state - 1 <= 1)
  {
    self->_unsigned int state = 3;
    [(VCAudioClient *)self unlock];
    [(VCAudioIO *)self->_audioIO stopWithCompletionHandler:v5];
    return;
  }
  [(VCAudioClient *)self unlock];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3
    && (VRTraceErrorLogLevelToCSTR(), os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
  {
    -[VCAudioClient stopAudioIOWithCompletionHandler:]();
    if (!a3) {
      return;
    }
  }
  else if (!a3)
  {
    return;
  }
  (*((void (**)(id, void, uint64_t))a3 + 2))(a3, 0, [MEMORY[0x1E4F28C58] AVConferenceServiceError:32012 detailCode:0 description:@"Audio client is not running"]);
}

uint64_t __50__VCAudioClient_stopAudioIOWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    unsigned int v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v11 = 136315906;
      uint64_t v12 = v6;
      __int16 v13 = 2080;
      uint64_t v14 = "-[VCAudioClient stopAudioIOWithCompletionHandler:]_block_invoke";
      __int16 v15 = 1024;
      int v16 = 466;
      __int16 v17 = 2048;
      uint64_t v18 = v8;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCAudioClient=%p", (uint8_t *)&v11, 0x26u);
    }
  }
  [*(id *)(a1 + 32) lock];
  uint64_t v9 = *(void *)(a1 + 32);
  if (a2)
  {
    *(_DWORD *)(v9 + 28) = 0;
    [*(id *)(a1 + 32) cleanupAudioIO];
  }
  else
  {
    *(_DWORD *)(v9 + 28) = 2;
  }
  [*(id *)(a1 + 32) unlock];
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3);
  }
  return result;
}

- (id)getCurrentAudioDeviceWithType:(BOOL)a3
{
  return 0;
}

- (BOOL)setCurrentAudioDevice:(id)a3 type:(BOOL)a4
{
  return 1;
}

- (AVAudioDevice)inputDevice
{
  return 0;
}

- (AVAudioDevice)outputDevice
{
  return 0;
}

- (void)serverDidDie
{
  v4[5] = *MEMORY[0x1E4F143B8];
  global_queue = dispatch_get_global_queue(2, 0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__VCAudioClient_serverDidDie__block_invoke;
  v4[3] = &unk_1E6DB3DC8;
  v4[4] = self;
  dispatch_async(global_queue, v4);
}

uint64_t __29__VCAudioClient_serverDidDie__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopWithError:0];
}

- (int)processId
{
  return self->_processId;
}

- (VCAudioIO)audioIO
{
  return self->_audioIO;
}

- (void)setAudioIO:(id)a3
{
}

- (BOOL)isMutedTalkerNotificationRegistered
{
  return self->_isMutedTalkerNotificationRegistered;
}

- (void)setIsMutedTalkerNotificationRegistered:(BOOL)a3
{
  self->_isMutedTalkerNotificationRegistered = a3;
}

- (BOOL)isMixingVoiceWithMediaEnabled
{
  return self->_mixingVoiceWithMediaEnabled;
}

- (BOOL)isFollowSystemInputEnabled
{
  return self->_followSystemInput;
}

- (BOOL)isFollowSystemOutputEnabled
{
  return self->_followSystemOutput;
}

- (BOOL)isMutedStateChangeHandlerRegistered
{
  return self->_isMutedStateChangeHandlerRegistered;
}

- (void)setIsMutedStateChangeHandlerRegistered:(BOOL)a3
{
  self->_isMutedStateChangeHandlerRegistered = a3;
}

- (void)startWithError:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Audio client is trying to start but session parameters have not been set! (client PID=%d)", v2, v3, v4, v5);
}

- (void)startWithError:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_0();
  _os_log_fault_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_FAULT, " [%s] %s:%d Audio client is trying to start but session parameters have not been set! (client PID=%d)", v1, 0x22u);
}

- (void)startWithError:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Timeout occured while waiting for audio IO start!", v2, v3, v4, v5, v6);
}

- (void)stopWithError:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Timeout occured while waiting for audio IO stop!", v2, v3, v4, v5, v6);
}

- (void)setupAudioIO
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the audio IO", v2, v3, v4, v5, v6);
}

- (void)stopAudioIOWithCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  *(void *)&v3[6] = "-[VCAudioClient stopAudioIOWithCompletionHandler:]";
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d client is not running! (client PID=%d)", v2, *(const char **)v3, (unint64_t)"-[VCAudioClient stopAudioIOWithCompletionHandler:]" >> 16, 492);
}

@end