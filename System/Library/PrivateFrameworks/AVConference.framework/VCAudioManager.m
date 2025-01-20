@interface VCAudioManager
+ (AudioStreamBasicDescription)sessionFormatForSampleRate:(SEL)a3;
+ (id)audioSessionForMode:(int)a3;
+ (id)sharedSystemAudioInputInstance;
+ (id)sharedSystemAudioOutputInstance;
+ (id)sharedVoiceChatInstance;
+ (unsigned)audioIOTypeWithAudioUnitProperties:(id)a3 shouldEnableAudioInput:(BOOL)a4;
+ (void)terminateProcess:(id)a3 terminateSource:(id)a4 agent:(opaqueRTCReporting *)a5;
- (AVAudioDevice)currentInputDevice;
- (AVAudioDevice)currentOutputDevice;
- (BOOL)addClient:(id)a3;
- (BOOL)audioCallbacksRunning;
- (BOOL)computeAllowAudioRecordingWithPreferredClient:(id)a3;
- (BOOL)getAudioSessionMediaProperties:(id)a3 forVPOperatingMode:(unsigned int)a4;
- (BOOL)isGKVoiceChat;
- (BOOL)isInDaemon;
- (BOOL)isMicrophoneMuted;
- (BOOL)isMixingVoiceWithMediaEnabled;
- (BOOL)isSpeakerPhoneEnabled;
- (BOOL)removeClient:(id)a3;
- (BOOL)resetAUIOWithProperties:(id)a3;
- (BOOL)resetAudioLimiterWithProperties:(id)a3;
- (BOOL)resetAudioSessionWithProperties:(id)a3 interruptSuccessful:(BOOL *)a4;
- (BOOL)setupInterruptThread;
- (BOOL)setupVAD;
- (BOOL)shouldResetAudioSessionWithProperties:(id)a3;
- (BOOL)shouldResetAudioUnitWithProperties:(id)a3;
- (BOOL)startAUIOWithProperties:(id)a3;
- (BOOL)startAudioSessionWithProperties:(id)a3;
- (BOOL)stateIdleWithAudioUnitProperties:(id)a3 sessionProperties:(id)a4 client:(id)a5 newState:(unsigned int *)a6;
- (BOOL)stateInterruptedShouldGoToRunning:(id)a3;
- (BOOL)stateInterruptedShouldGoToStarted:(id)a3;
- (BOOL)stateInterruptedWithAudioUnitProperties:(id)a3 sessionProperties:(id)a4 client:(id)a5 newState:(unsigned int *)a6;
- (BOOL)stateRunningShouldTransitionToInterrupted:(id)a3;
- (BOOL)stateRunningShouldTransitionToStarted:(id)a3;
- (BOOL)stateRunningWithAudioUnitProperties:(id)a3 sessionProperties:(id)a4 client:(id)a5 newState:(unsigned int *)a6;
- (BOOL)stateSessionStartedWithAudioUnitProperties:(id)a3 sessionProperties:(id)a4 client:(id)a5 newState:(unsigned int *)a6;
- (BOOL)supportsVoiceActivityDetection;
- (BOOL)updateStateWithAudioIOClient:(id)a3;
- (NSDictionary)vpOperatingModeToAudioSessionMediaFormatMapping;
- (NSString)description;
- (VCAudioManager)initWithAudioSessionMode:(int)a3;
- (VCAudioSessionMediaProperties)currentAudioSessionMediaProperties;
- (VCAudioUnitProperties)currentAudioUnitProperties;
- (_VCAudioIOControllerIOState)sinkIO;
- (_VCAudioIOControllerIOState)sourceIO;
- (id)newAudioSessionMediaPropertiesForSystemAudioWithPreferredClient:(id)a3 audioUnitProperties:(id)a4 isInput:(BOOL)a5;
- (id)newAudioSessionMediaPropertiesWithPreferredClient:(id)a3 audioUnitProperties:(id)a4;
- (id)newAudioUnitPropertiesForSystemAudioWithPreferredClient:(id)a3 isInput:(BOOL)a4;
- (id)newAudioUnitPropertiesWithPreferredClient:(id)a3;
- (id)preferredClientWithNewClient:(id)a3;
- (int)prewarmingClientOperatingMode;
- (int)registerAudioSessionId:(unsigned int)a3 maxChannelCountMic:(unsigned int)a4 maxChannelCountSpeaker:(unsigned int)a5 spatialMetadata:(OpaqueCMBlockBuffer *)a6;
- (int)registerForMutedTalkerNotification:(id)a3;
- (int)registerForMutedTalkerNotificationWithAUIO:(tagHANDLE *)a3;
- (int)setVolume:(float)a3 withRampTime:(float)a4;
- (int)unregisterForMutedTalkerNotificationWithAUIO:(tagHANDLE *)a3;
- (int)unregisterFromMutedTalkerNotification;
- (unint64_t)retainCount;
- (unsigned)computeSamplePerFrameWithPreferredClient:(id)a3 sampleRate:(unsigned int)a4;
- (unsigned)vpOperationModeForConferenceOperatingMode:(int)a3 deviceRole:(int)a4;
- (void)_cleanupDeadClients;
- (void)activateStartingClient:(id)a3 applyControllerFormat:(BOOL)a4;
- (void)applyAudioSessionMute;
- (void)applyControllerFormatToClients:(id)a3;
- (void)applySessionContextToAudioUnitProperties:(id)a3 preferredClient:(id)a4;
- (void)applySpatialMetadata:(OpaqueCMBlockBuffer *)a3;
- (void)cleanupInterruptThread;
- (void)completeStartForAllStartingClients;
- (void)computeFormatDescription:(AudioStreamBasicDescription *)a3 withPreferredClient:(id)a4;
- (void)computeHardwarePreferences;
- (void)dealloc;
- (void)didSessionEnd;
- (void)didSessionStop;
- (void)didUpdateBasebandCodec:(const _VCRemoteCodecInfo *)a3;
- (void)enterStateStarted;
- (void)flushEventQueue:(opaqueCMSimpleQueue *)a3;
- (void)getPreferredFormat:(AudioStreamBasicDescription *)a3 blockSize:(double *)a4 vpOperatingMode:(unsigned int *)a5 forOperatingMode:(int)a6 deviceRole:(int)a7 suggestedFormat:(AudioStreamBasicDescription *)a8;
- (void)refreshInputMetering;
- (void)refreshOutputMetering;
- (void)refreshRemoteCodecType:(unsigned int)a3 sampleRate:(double)a4;
- (void)registerClientIO:(_VCAudioIOControllerClientIO *)a3 controllerIO:(_VCAudioIOControllerIOState *)a4;
- (void)removeAllClientsForIO:(_VCAudioIOControllerIOState *)a3;
- (void)resetAudioTimestamps;
- (void)resetChannelMask;
- (void)serverDidDie;
- (void)setCurrentAudioSessionMediaProperties:(id)a3;
- (void)setCurrentAudioUnitProperties:(id)a3;
- (void)setCurrentInputDevice:(id)a3;
- (void)setCurrentInputDeviceInternal:(id)a3;
- (void)setCurrentOutputDevice:(id)a3;
- (void)setCurrentOutputDeviceInternal:(id)a3;
- (void)setInputMetering;
- (void)setIsGKVoiceChat:(BOOL)a3;
- (void)setIsInDaemon:(BOOL)a3;
- (void)setMediaPlaybackOnExternalDevice:(BOOL)a3;
- (void)setMicrophoneMuted:(BOOL)a3;
- (void)setMixingVoiceWithMediaEnabled:(BOOL)a3;
- (void)setMute:(BOOL)a3 forClient:(id)a4;
- (void)setOutputMetering;
- (void)setSpatialMetadata:(OpaqueCMBlockBuffer *)a3 audioSessionId:(unsigned int)a4 completionHandler:(id)a5;
- (void)setSpeakerPhoneEnabled:(BOOL)a3;
- (void)setVpOperatingModeToAudioSessionMediaFormatMapping:(id)a3;
- (void)setupInterruptThread;
- (void)setupSpatialContextWithAudioUnitProperties:(id)a3 forceUpdate:(BOOL)a4;
- (void)setupVAD;
- (void)startClient:(id)a3;
- (void)startInterruptThread;
- (void)startVADWithAudioUnitProperties:(id)a3;
- (void)stateRunningToSessionStarted;
- (void)stateTransitionInterruptedToRunning;
- (void)stateTransitionInterruptedToStarted;
- (void)stateTransitionRunningToInterrupted;
- (void)stopAUIO;
- (void)stopAudioSession;
- (void)stopClient:(id)a3;
- (void)stopInterruptThread;
- (void)unregisterAudioSessionId:(unsigned int)a3;
- (void)unregisterClientIO:(_VCAudioIOControllerClientIO *)a3 controllerIO:(_VCAudioIOControllerIOState *)a4;
- (void)updateClient:(id)a3 settings:(const tagVCAudioIOControllerClientSettings *)a4;
- (void)updateCurrentInputDevice:(id)a3;
- (void)updateCurrentOutputDevice:(id)a3;
- (void)updateDirectionWithClient:(id)a3 settings:(const tagVCAudioIOControllerClientSettings *)a4 isClientRegistered:(BOOL)a5;
- (void)updateSpatialAudioWithClient:(id)a3 settings:(const tagVCAudioIOControllerClientSettings *)a4 isClientRegistered:(BOOL)a5;
- (void)updateVoiceProcessingWithClient:(id)a3 settings:(const tagVCAudioIOControllerClientSettings *)a4 isClientRegistered:(BOOL)a5;
- (void)waitIdleForClient:(id)a3;
@end

@implementation VCAudioManager

+ (id)sharedVoiceChatInstance
{
  if (sharedVoiceChatInstance_onceToken != -1) {
    dispatch_once(&sharedVoiceChatInstance_onceToken, &__block_literal_global_0);
  }
  return (id)sharedVoiceChatInstance__VCAudioManagerVoiceChat;
}

VCAudioManager *__41__VCAudioManager_sharedVoiceChatInstance__block_invoke()
{
  result = [[VCAudioManager alloc] initWithAudioSessionMode:0];
  sharedVoiceChatInstance__VCAudioManagerVoiceChat = (uint64_t)result;
  return result;
}

+ (id)sharedSystemAudioOutputInstance
{
  if (sharedSystemAudioOutputInstance_onceToken != -1) {
    dispatch_once(&sharedSystemAudioOutputInstance_onceToken, &__block_literal_global_16);
  }
  return (id)sharedSystemAudioOutputInstance__VCAudioManagerSystemAudio;
}

VCAudioManager *__49__VCAudioManager_sharedSystemAudioOutputInstance__block_invoke()
{
  result = [[VCAudioManager alloc] initWithAudioSessionMode:1];
  sharedSystemAudioOutputInstance__VCAudioManagerSystemAudio = (uint64_t)result;
  return result;
}

+ (id)sharedSystemAudioInputInstance
{
  if (sharedSystemAudioInputInstance_onceToken != -1) {
    dispatch_once(&sharedSystemAudioInputInstance_onceToken, &__block_literal_global_18);
  }
  return (id)sharedSystemAudioInputInstance__VCAudioManagerSystemAudioInput;
}

VCAudioManager *__48__VCAudioManager_sharedSystemAudioInputInstance__block_invoke()
{
  result = [[VCAudioManager alloc] initWithAudioSessionMode:2];
  sharedSystemAudioInputInstance__VCAudioManagerSystemAudioInput = (uint64_t)result;
  return result;
}

+ (void)terminateProcess:(id)a3 terminateSource:(id)a4 agent:(opaqueRTCReporting *)a5
{
}

- (unint64_t)retainCount
{
  return -1;
}

- (_VCAudioIOControllerIOState)sinkIO
{
  return &self->_sinkData;
}

- (_VCAudioIOControllerIOState)sourceIO
{
  return &self->_sourceData;
}

- (void)getPreferredFormat:(AudioStreamBasicDescription *)a3 blockSize:(double *)a4 vpOperatingMode:(unsigned int *)a5 forOperatingMode:(int)a6 deviceRole:(int)a7 suggestedFormat:(AudioStreamBasicDescription *)a8
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (a8) {
    double mSampleRate = a8->mSampleRate;
  }
  else {
    double mSampleRate = 24000.0;
  }
  uint64_t v14 = [(VCAudioManager *)self vpOperationModeForConferenceOperatingMode:*(void *)&a6 deviceRole:*(void *)&a7];
  if ([+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance") deviceClass] == 6&& [+[VCHardwareSettingsEmbedded sharedInstance] chipId] < 0x8000)
  {
    double mSampleRate = 16000.0;
  }
  id v15 = -[NSDictionary objectForKeyedSubscript:](self->_vpOperatingModeToAudioSessionMediaFormatMapping, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v14]);
  if (v15)
  {
    v16 = v15;
    [v15 preferredBlockSize];
    uint64_t v18 = v17;
    [v16 preferredSampleRate];
    double mSampleRate = v19;
  }
  else
  {
    uint64_t v18 = 0x3F947AE147AE147BLL;
  }
  unsigned int v20 = [+[VCDefaults sharedInstance] forceAudioChannelCount];
  if (v20 <= 1) {
    int v21 = 1;
  }
  else {
    int v21 = v20;
  }
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v32 = 136315906;
        uint64_t v33 = v23;
        __int16 v34 = 2080;
        v35 = "-[VCAudioManager getPreferredFormat:blockSize:vpOperatingMode:forOperatingMode:deviceRole:suggestedFormat:]";
        __int16 v36 = 1024;
        int v37 = 395;
        __int16 v38 = 1024;
        LODWORD(v39) = v21;
        v25 = " [%s] %s:%d using audio channelCount[%d]";
        v26 = v24;
        uint32_t v27 = 34;
LABEL_23:
        _os_log_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_DEFAULT, v25, (uint8_t *)&v32, v27);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v22 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
    }
    else {
      v22 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v28 = VRTraceErrorLogLevelToCSTR();
      v29 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v32 = 136316418;
        uint64_t v33 = v28;
        __int16 v34 = 2080;
        v35 = "-[VCAudioManager getPreferredFormat:blockSize:vpOperatingMode:forOperatingMode:deviceRole:suggestedFormat:]";
        __int16 v36 = 1024;
        int v37 = 395;
        __int16 v38 = 2112;
        v39 = v22;
        __int16 v40 = 2048;
        v41 = self;
        __int16 v42 = 1024;
        int v43 = v21;
        v25 = " [%s] %s:%d %@(%p) using audio channelCount[%d]";
        v26 = v29;
        uint32_t v27 = 54;
        goto LABEL_23;
      }
    }
  }
  if (!a3) {
    goto LABEL_27;
  }
  if (a8)
  {
    long long v31 = *(_OWORD *)&a8->mSampleRate;
    long long v30 = *(_OWORD *)&a8->mBytesPerPacket;
    *(void *)&a3->mBitsPerChannel = *(void *)&a8->mBitsPerChannel;
    *(_OWORD *)&a3->double mSampleRate = v31;
    *(_OWORD *)&a3->mBytesPerPacket = v30;
    a3->double mSampleRate = mSampleRate;
LABEL_27:
    if (!a4) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  Format_Float((uint64_t)a3, v21, (int)mSampleRate);
  if (a4) {
LABEL_28:
  }
    *(void *)a4 = v18;
LABEL_29:
  if (a5) {
    *a5 = v14;
  }
}

+ (id)audioSessionForMode:(int)a3
{
  switch(a3)
  {
    case 2:
      return +[VCAudioSession sharedSystemAudioInputInstance];
    case 1:
      return +[VCAudioSession sharedSystemAudioOutputInstance];
    case 0:
      return +[VCAudioSession sharedVoiceChatInstance];
  }
  return result;
}

- (VCAudioManager)initWithAudioSessionMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v43.receiver = self;
  v43.super_class = (Class)VCAudioManager;
  v4 = [(VCObject *)&v43 init];
  if (!v4) {
    return v4;
  }
  v5 = "SystemAudioOutput";
  if (v3 == 2) {
    v5 = "SystemAudioInput";
  }
  if (!v3) {
    v5 = "VoiceChat";
  }
  -[VCObject setLogPrefix:](v4, "setLogPrefix:", objc_msgSend(NSString, "stringWithFormat:", @"controllerType=%s ", v5));
  snprintf(v4->_sourceData.logPrefix, 0x28uLL, "%s (speaker)", [(NSString *)[(VCObject *)v4 logPrefix] UTF8String]);
  snprintf(v4->_sinkData.logPrefix, 0x28uLL, "%s (mic)", [(NSString *)[(VCObject *)v4 logPrefix] UTF8String]);
  v4->_playbackMode = v3;
  id v6 = objc_alloc(MEMORY[0x1E4F1C978]);
  uint64_t v7 = objc_msgSend(v6, "initWithObjects:", _stateNotSet, _stateIdle, _stateSessionStarted, _stateRunning, _stateInterrupted, 0);
  v4->_stateStrings = (NSArray *)v7;
  if (!v7)
  {
    if ((VCAudioManager *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioManager initWithAudioSessionMode:]();
        }
      }
      goto LABEL_137;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v18 = (__CFString *)[(VCAudioManager *)v4 performSelector:sel_logPrefix];
    }
    else {
      uint64_t v18 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_137;
    }
    uint64_t v29 = VRTraceErrorLogLevelToCSTR();
    long long v30 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_137;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v45 = v29;
    __int16 v46 = 2080;
    v47 = "-[VCAudioManager initWithAudioSessionMode:]";
    __int16 v48 = 1024;
    int v49 = 436;
    __int16 v50 = 2112;
    v51 = v18;
    __int16 v52 = 2048;
    v53 = v4;
    long long v31 = " [%s] %s:%d %@(%p) Failed to allocate stateStrings array";
    goto LABEL_136;
  }
  v4->_useOptimizedHandoversForTelephony = 0;
  v4->_useOptimizedHandoversForTelephony = +[VCHardwareSettings supportsOptimizedHandoversForTelephony];
  v8 = +[VCAudioManager audioSessionForMode:v3];
  v4->_audioSession = v8;
  if (!v8)
  {
    if ((VCAudioManager *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioManager initWithAudioSessionMode:]();
        }
      }
      goto LABEL_137;
    }
    if (objc_opt_respondsToSelector()) {
      double v19 = (__CFString *)[(VCAudioManager *)v4 performSelector:sel_logPrefix];
    }
    else {
      double v19 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_137;
    }
    uint64_t v32 = VRTraceErrorLogLevelToCSTR();
    long long v30 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_137;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v45 = v32;
    __int16 v46 = 2080;
    v47 = "-[VCAudioManager initWithAudioSessionMode:]";
    __int16 v48 = 1024;
    int v49 = 441;
    __int16 v50 = 2112;
    v51 = v19;
    __int16 v52 = 2048;
    v53 = v4;
    long long v31 = " [%s] %s:%d %@(%p) Failed to pass a valid audio session";
    goto LABEL_136;
  }
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(62);
  dispatch_queue_t v10 = dispatch_queue_create_with_target_V2("com.apple.AVConference.audiomanagerqueue", 0, CustomRootQueue);
  v4->_dispatchQueue = (OS_dispatch_queue *)v10;
  if (!v10)
  {
    if ((VCAudioManager *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioManager initWithAudioSessionMode:]();
        }
      }
      goto LABEL_137;
    }
    if (objc_opt_respondsToSelector()) {
      unsigned int v20 = (__CFString *)[(VCAudioManager *)v4 performSelector:sel_logPrefix];
    }
    else {
      unsigned int v20 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_137;
    }
    uint64_t v33 = VRTraceErrorLogLevelToCSTR();
    long long v30 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_137;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v45 = v33;
    __int16 v46 = 2080;
    v47 = "-[VCAudioManager initWithAudioSessionMode:]";
    __int16 v48 = 1024;
    int v49 = 444;
    __int16 v50 = 2112;
    v51 = v20;
    __int16 v52 = 2048;
    v53 = v4;
    long long v31 = " [%s] %s:%d %@(%p) Failed to allocate the dispatch queue";
    goto LABEL_136;
  }
  v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4->_allClients = v11;
  if (!v11)
  {
    if ((VCAudioManager *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioManager initWithAudioSessionMode:].cold.4();
        }
      }
      goto LABEL_137;
    }
    if (objc_opt_respondsToSelector()) {
      int v21 = (__CFString *)[(VCAudioManager *)v4 performSelector:sel_logPrefix];
    }
    else {
      int v21 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_137;
    }
    uint64_t v34 = VRTraceErrorLogLevelToCSTR();
    long long v30 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_137;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v45 = v34;
    __int16 v46 = 2080;
    v47 = "-[VCAudioManager initWithAudioSessionMode:]";
    __int16 v48 = 1024;
    int v49 = 446;
    __int16 v50 = 2112;
    v51 = v21;
    __int16 v52 = 2048;
    v53 = v4;
    long long v31 = " [%s] %s:%d %@(%p) Failed to allocate client array";
    goto LABEL_136;
  }
  v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4->_startingIOClients = v12;
  if (!v12)
  {
    if ((VCAudioManager *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioManager initWithAudioSessionMode:].cold.5();
        }
      }
      goto LABEL_137;
    }
    if (objc_opt_respondsToSelector()) {
      v22 = (__CFString *)[(VCAudioManager *)v4 performSelector:sel_logPrefix];
    }
    else {
      v22 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_137;
    }
    uint64_t v35 = VRTraceErrorLogLevelToCSTR();
    long long v30 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_137;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v45 = v35;
    __int16 v46 = 2080;
    v47 = "-[VCAudioManager initWithAudioSessionMode:]";
    __int16 v48 = 1024;
    int v49 = 448;
    __int16 v50 = 2112;
    v51 = v22;
    __int16 v52 = 2048;
    v53 = v4;
    long long v31 = " [%s] %s:%d %@(%p) Failed to allocate starting IO client array";
    goto LABEL_136;
  }
  CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (CMSimpleQueueCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 100, &v4->_sourceData.eventQueue) < 0)
  {
    if ((VCAudioManager *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioManager initWithAudioSessionMode:].cold.6();
        }
      }
      goto LABEL_137;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v23 = (__CFString *)[(VCAudioManager *)v4 performSelector:sel_logPrefix];
    }
    else {
      uint64_t v23 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_137;
    }
    uint64_t v36 = VRTraceErrorLogLevelToCSTR();
    long long v30 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_137;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v45 = v36;
    __int16 v46 = 2080;
    v47 = "-[VCAudioManager initWithAudioSessionMode:]";
    __int16 v48 = 1024;
    int v49 = 450;
    __int16 v50 = 2112;
    v51 = v23;
    __int16 v52 = 2048;
    v53 = v4;
    long long v31 = " [%s] %s:%d %@(%p) Failed to allocate source event queue";
    goto LABEL_136;
  }
  if (CMSimpleQueueCreate(v13, 100, &v4->_sinkData.eventQueue) < 0)
  {
    if ((VCAudioManager *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioManager initWithAudioSessionMode:].cold.7();
        }
      }
      goto LABEL_137;
    }
    if (objc_opt_respondsToSelector()) {
      v24 = (__CFString *)[(VCAudioManager *)v4 performSelector:sel_logPrefix];
    }
    else {
      v24 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_137;
    }
    uint64_t v37 = VRTraceErrorLogLevelToCSTR();
    long long v30 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_137;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v45 = v37;
    __int16 v46 = 2080;
    v47 = "-[VCAudioManager initWithAudioSessionMode:]";
    __int16 v48 = 1024;
    int v49 = 452;
    __int16 v50 = 2112;
    v51 = v24;
    __int16 v52 = 2048;
    v53 = v4;
    long long v31 = " [%s] %s:%d %@(%p) Failed to allocate sink event queue";
    goto LABEL_136;
  }
  if ((VCSingleLinkedListInitialize((uint64_t)&v4->_sourceData.clientIOList, (uint64_t)_VCAudioManger_CompareControllerEntries) & 1) == 0)
  {
    if ((VCAudioManager *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioManager initWithAudioSessionMode:]2();
        }
      }
      goto LABEL_137;
    }
    if (objc_opt_respondsToSelector()) {
      v25 = (__CFString *)[(VCAudioManager *)v4 performSelector:sel_logPrefix];
    }
    else {
      v25 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_137;
    }
    uint64_t v38 = VRTraceErrorLogLevelToCSTR();
    long long v30 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_137;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v45 = v38;
    __int16 v46 = 2080;
    v47 = "-[VCAudioManager initWithAudioSessionMode:]";
    __int16 v48 = 1024;
    int v49 = 454;
    __int16 v50 = 2112;
    v51 = v25;
    __int16 v52 = 2048;
    v53 = v4;
    long long v31 = " [%s] %s:%d %@(%p) Failed to initialize source data link list";
    goto LABEL_136;
  }
  if ((VCSingleLinkedListInitialize((uint64_t)&v4->_sinkData.clientIOList, (uint64_t)_VCAudioManger_CompareControllerEntries) & 1) == 0)
  {
    if ((VCAudioManager *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioManager initWithAudioSessionMode:]1();
        }
      }
      goto LABEL_137;
    }
    if (objc_opt_respondsToSelector()) {
      v26 = (__CFString *)[(VCAudioManager *)v4 performSelector:sel_logPrefix];
    }
    else {
      v26 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_137;
    }
    uint64_t v39 = VRTraceErrorLogLevelToCSTR();
    long long v30 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_137;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v45 = v39;
    __int16 v46 = 2080;
    v47 = "-[VCAudioManager initWithAudioSessionMode:]";
    __int16 v48 = 1024;
    int v49 = 456;
    __int16 v50 = 2112;
    v51 = v26;
    __int16 v52 = 2048;
    v53 = v4;
    long long v31 = " [%s] %s:%d %@(%p) Failed to initialize sink data link list";
    goto LABEL_136;
  }
  uint64_t v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4->_spatialContexts = v14;
  if (!v14)
  {
    if ((VCAudioManager *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioManager initWithAudioSessionMode:].cold.8();
        }
      }
      goto LABEL_137;
    }
    if (objc_opt_respondsToSelector()) {
      uint32_t v27 = (__CFString *)[(VCAudioManager *)v4 performSelector:sel_logPrefix];
    }
    else {
      uint32_t v27 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_137;
    }
    uint64_t v40 = VRTraceErrorLogLevelToCSTR();
    long long v30 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_137;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v45 = v40;
    __int16 v46 = 2080;
    v47 = "-[VCAudioManager initWithAudioSessionMode:]";
    __int16 v48 = 1024;
    int v49 = 458;
    __int16 v50 = 2112;
    v51 = v27;
    __int16 v52 = 2048;
    v53 = v4;
    long long v31 = " [%s] %s:%d %@(%p) Failed to create allocate the spatial context dictionary";
LABEL_136:
    _os_log_error_impl(&dword_1E1EA4000, v30, OS_LOG_TYPE_ERROR, v31, buf, 0x30u);
    goto LABEL_137;
  }
  id v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4->_audioSessionSinkMuted = v15;
  if (!v15)
  {
    if ((VCAudioManager *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioManager initWithAudioSessionMode:].cold.9();
        }
      }
      goto LABEL_137;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v28 = (__CFString *)[(VCAudioManager *)v4 performSelector:sel_logPrefix];
    }
    else {
      uint64_t v28 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v41 = VRTraceErrorLogLevelToCSTR();
      long long v30 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v45 = v41;
        __int16 v46 = 2080;
        v47 = "-[VCAudioManager initWithAudioSessionMode:]";
        __int16 v48 = 1024;
        int v49 = 460;
        __int16 v50 = 2112;
        v51 = v28;
        __int16 v52 = 2048;
        v53 = v4;
        long long v31 = " [%s] %s:%d %@(%p) Failed to create allocate the audio session muted dictionary";
        goto LABEL_136;
      }
    }
LABEL_137:

    return 0;
  }
  if (v4->_playbackMode) {
    goto LABEL_20;
  }
  if (![(VCAudioManager *)v4 setupVAD]) {
    goto LABEL_137;
  }
  if (![(VCAudioManager *)v4 setupInterruptThread])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioManager initWithAudioSessionMode:]0();
      }
    }
    goto LABEL_137;
  }
LABEL_20:
  v4->_state = 1;
  v4->_interruptThreadState = 1;
  v4->_hAUIO = (tagHANDLE *)0xFFFFFFFFLL;
  pthread_mutex_init(&v4->_interruptingMutex, 0);
  pthread_mutex_init(&v4->_inputDeviceMutex, 0);
  pthread_mutex_init(&v4->_outputDeviceMutex, 0);
  v4->_isInterrupting = 0;
  if (!v4->_playbackMode)
  {
    global_queue = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__VCAudioManager_initWithAudioSessionMode___block_invoke;
    block[3] = &unk_1E6DB3DC8;
    block[4] = v4;
    dispatch_async(global_queue, block);
  }
  return v4;
}

uint64_t __43__VCAudioManager_initWithAudioSessionMode___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) computeHardwarePreferences];
}

- (NSString)description
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)VCAudioManager;
  v4 = [(VCAudioManager *)&v7 description];
  if (self->_playbackMode) {
    v5 = "System";
  }
  else {
    v5 = "VoiceChat";
  }
  return (NSString *)[v3 stringWithFormat:@"{ %@ controllerType=%s }", v4, v5];
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];

  [(VCAudioManager *)self cleanupInterruptThread];
  VCVoiceDetector_Destroy((void **)&self->_sinkData.voiceDetector);
  VCAudioBufferList_Destroy((uint64_t *)&self->_sourceData.secondarySampleBuffer);
  VCAudioBufferList_Destroy((uint64_t *)&self->_sourceData.interruptMixDownSampleBuffer);
  eventQueue = self->_sourceData.eventQueue;
  if (eventQueue) {
    CFRelease(eventQueue);
  }
  v4 = self->_sinkData.eventQueue;
  if (v4) {
    CFRelease(v4);
  }

  dispatch_release((dispatch_object_t)self->_dispatchQueue);
  pthread_mutex_destroy(&self->_outputDeviceMutex);
  pthread_mutex_destroy(&self->_inputDeviceMutex);
  pthread_mutex_destroy(&self->_interruptingMutex);
  v5.receiver = self;
  v5.super_class = (Class)VCAudioManager;
  [(VCObject *)&v5 dealloc];
}

- (void)setMicrophoneMuted:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__VCAudioManager_setMicrophoneMuted___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, block);
}

void __37__VCAudioManager_setMicrophoneMuted___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(_DWORD *)(v2 + 904))
  {
    *(unsigned char *)(v2 + 249) = *(unsigned char *)(a1 + 40);
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        uint64_t v14 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v15 = *(unsigned __int8 *)(a1 + 40);
          int v24 = 136315906;
          uint64_t v25 = v13;
          __int16 v26 = 2080;
          uint32_t v27 = "-[VCAudioManager setMicrophoneMuted:]_block_invoke";
          __int16 v28 = 1024;
          int v29 = 557;
          __int16 v30 = 1024;
          LODWORD(v31) = v15;
          v16 = " [%s] %s:%d setMicrophoneMuted:%d";
          uint64_t v17 = v14;
          uint32_t v18 = 34;
LABEL_23:
          _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v24, v18);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v4 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        v4 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v19 = VRTraceErrorLogLevelToCSTR();
        unsigned int v20 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v21 = *(void *)(a1 + 32);
          int v22 = *(unsigned __int8 *)(a1 + 40);
          int v24 = 136316418;
          uint64_t v25 = v19;
          __int16 v26 = 2080;
          uint32_t v27 = "-[VCAudioManager setMicrophoneMuted:]_block_invoke";
          __int16 v28 = 1024;
          int v29 = 557;
          __int16 v30 = 2112;
          long long v31 = v4;
          __int16 v32 = 2048;
          uint64_t v33 = v21;
          __int16 v34 = 1024;
          int v35 = v22;
          v16 = " [%s] %s:%d %@(%p) setMicrophoneMuted:%d";
          uint64_t v17 = v20;
          uint32_t v18 = 54;
          goto LABEL_23;
        }
      }
    }
    uint64_t v23 = *(void *)(a1 + 32);
    if (*(void *)(v23 + 168) != 0xFFFFFFFFLL)
    {
      *(unsigned char *)(v23 + 432) = *(unsigned char *)(a1 + 40);
      AUIOSetMute(*(void *)(*(void *)(a1 + 32) + 168), *(unsigned __int8 *)(a1 + 40));
    }
    return;
  }
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 136315650;
        uint64_t v25 = v5;
        __int16 v26 = 2080;
        uint32_t v27 = "-[VCAudioManager setMicrophoneMuted:]_block_invoke";
        __int16 v28 = 1024;
        int v29 = 553;
        objc_super v7 = " [%s] %s:%d Not applying mute to the AUIO because this manager does not support it.";
        uint64_t v8 = v6;
        uint32_t v9 = 28;
LABEL_15:
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v24, v9);
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
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        int v24 = 136316162;
        uint64_t v25 = v10;
        __int16 v26 = 2080;
        uint32_t v27 = "-[VCAudioManager setMicrophoneMuted:]_block_invoke";
        __int16 v28 = 1024;
        int v29 = 553;
        __int16 v30 = 2112;
        long long v31 = v3;
        __int16 v32 = 2048;
        uint64_t v33 = v12;
        objc_super v7 = " [%s] %s:%d %@(%p) Not applying mute to the AUIO because this manager does not support it.";
        uint64_t v8 = v11;
        uint32_t v9 = 48;
        goto LABEL_15;
      }
    }
  }
}

- (void)setMixingVoiceWithMediaEnabled:(BOOL)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!self->_playbackMode)
  {
    BOOL v5 = a3;
    id v6 = +[VCAudioSession sharedVoiceChatInstance];
    uint64_t v17 = *MEMORY[0x1E4F76290];
    uint64_t v18 = [NSNumber numberWithBool:v5];
    objc_msgSend(v6, "updateAudioSessionPropertiesWithProperties:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
    dispatchQueue = self->_dispatchQueue;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __49__VCAudioManager_setMixingVoiceWithMediaEnabled___block_invoke;
    v15[3] = &unk_1E6DB3DF0;
    v15[4] = self;
    BOOL v16 = v5;
    dispatch_async(dispatchQueue, v15);
    return;
  }
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint32_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v20 = v8;
        __int16 v21 = 2080;
        int v22 = "-[VCAudioManager setMixingVoiceWithMediaEnabled:]";
        __int16 v23 = 1024;
        int v24 = 567;
        uint64_t v10 = " [%s] %s:%d ignore";
        v11 = v9;
        uint32_t v12 = 28;
LABEL_13:
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v4 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
    }
    else {
      v4 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      uint64_t v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v20 = v13;
        __int16 v21 = 2080;
        int v22 = "-[VCAudioManager setMixingVoiceWithMediaEnabled:]";
        __int16 v23 = 1024;
        int v24 = 567;
        __int16 v25 = 2112;
        __int16 v26 = v4;
        __int16 v27 = 2048;
        __int16 v28 = self;
        uint64_t v10 = " [%s] %s:%d %@(%p) ignore";
        v11 = v14;
        uint32_t v12 = 48;
        goto LABEL_13;
      }
    }
  }
}

uint64_t __49__VCAudioManager_setMixingVoiceWithMediaEnabled___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 250) = *(unsigned char *)(a1 + 40);
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_12;
    }
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    int v5 = *(unsigned __int8 *)(a1 + 40);
    int v14 = 136315906;
    uint64_t v15 = v3;
    __int16 v16 = 2080;
    uint64_t v17 = "-[VCAudioManager setMixingVoiceWithMediaEnabled:]_block_invoke";
    __int16 v18 = 1024;
    int v19 = 579;
    __int16 v20 = 1024;
    LODWORD(v21) = v5;
    id v6 = " [%s] %s:%d setMixingVoiceWithMediaEnabled:%d";
    objc_super v7 = v4;
    uint32_t v8 = 34;
    goto LABEL_11;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v2 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
  }
  else {
    uint64_t v2 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v12 = *(unsigned __int8 *)(a1 + 40);
      int v14 = 136316418;
      uint64_t v15 = v9;
      __int16 v16 = 2080;
      uint64_t v17 = "-[VCAudioManager setMixingVoiceWithMediaEnabled:]_block_invoke";
      __int16 v18 = 1024;
      int v19 = 579;
      __int16 v20 = 2112;
      __int16 v21 = v2;
      __int16 v22 = 2048;
      uint64_t v23 = v11;
      __int16 v24 = 1024;
      int v25 = v12;
      id v6 = " [%s] %s:%d %@(%p) setMixingVoiceWithMediaEnabled:%d";
      objc_super v7 = v10;
      uint32_t v8 = 54;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v14, v8);
    }
  }
LABEL_12:
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 168);
  if (result != 0xFFFFFFFFLL) {
    return AUIOSetVoiceMixingMedia(result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

- (void)setMute:(BOOL)a3 forClient:(id)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__VCAudioManager_setMute_forClient___block_invoke;
  v5[3] = &unk_1E6DB3E18;
  v5[4] = self;
  v5[5] = a4;
  BOOL v6 = a3;
  dispatch_async(dispatchQueue, v5);
}

uint64_t __36__VCAudioManager_setMute_forClient___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class() != *(void *)(a1 + 32))
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v2 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      uint64_t v2 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_12;
    }
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint64_t v11 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    int v14 = *(unsigned __int8 *)(a1 + 48);
    *(_DWORD *)int v19 = 136316674;
    *(void *)&v19[4] = v10;
    *(_WORD *)&v19[12] = 2080;
    *(void *)&v19[14] = "-[VCAudioManager setMute:forClient:]_block_invoke";
    *(_WORD *)&v19[22] = 1024;
    LODWORD(v20) = 588;
    WORD2(v20) = 2112;
    *(void *)((char *)&v20 + 6) = v2;
    HIWORD(v20) = 2048;
    uint64_t v21 = v12;
    LOWORD(v22) = 2048;
    *(void *)((char *)&v22 + 2) = v13;
    WORD5(v22) = 1024;
    HIDWORD(v22) = v14;
    uint64_t v7 = " [%s] %s:%d %@(%p) client=%p mute=%d";
    uint32_t v8 = v11;
    uint32_t v9 = 64;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = *(unsigned __int8 *)(a1 + 48);
      *(_DWORD *)int v19 = 136316162;
      *(void *)&v19[4] = v3;
      *(_WORD *)&v19[12] = 2080;
      *(void *)&v19[14] = "-[VCAudioManager setMute:forClient:]_block_invoke";
      *(_WORD *)&v19[22] = 1024;
      LODWORD(v20) = 588;
      WORD2(v20) = 2048;
      *(void *)((char *)&v20 + 6) = v5;
      HIWORD(v20) = 1024;
      LODWORD(v21) = v6;
      uint64_t v7 = " [%s] %s:%d client=%p mute=%d";
      uint32_t v8 = v4;
      uint32_t v9 = 44;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, v19, v9);
    }
  }
LABEL_12:
  uint64_t v15 = objc_msgSend(NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 48), *(_OWORD *)v19, *(void *)&v19[16], v20, v21, v22);
  uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 920), "setObject:forKeyedSubscript:", v15, objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 40), "audioSessionId")));
  uint64_t v17 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v17 + 184) >= 3u)
  {
    int v18 = [*(id *)(v17 + 200) audioSessionId];
    uint64_t result = [*(id *)(a1 + 40) audioSessionId];
    if (v18 == result) {
      return [*(id *)(a1 + 32) applyAudioSessionMute];
    }
  }
  return result;
}

- (void)applyAudioSessionMute
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (!self->_playbackMode)
  {
    v4 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_audioSessionSinkMuted, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[VCAudioUnitProperties audioSessionId](self->_currentAudioUnitProperties, "audioSessionId")));
    if (v4) {
      int isMicrophoneMuted = [v4 BOOLValue];
    }
    else {
      int isMicrophoneMuted = self->_isMicrophoneMuted;
    }
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_27;
      }
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      uint64_t v15 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_27;
      }
      unsigned int v16 = [(VCAudioUnitProperties *)self->_currentAudioUnitProperties audioSessionId];
      int v23 = 136316162;
      uint64_t v24 = v14;
      __int16 v25 = 2080;
      uint64_t v26 = "-[VCAudioManager applyAudioSessionMute]";
      __int16 v27 = 1024;
      int v28 = 603;
      __int16 v29 = 1024;
      *(_DWORD *)__int16 v30 = v16;
      *(_WORD *)&v30[4] = 1024;
      *(_DWORD *)&v30[6] = isMicrophoneMuted;
      uint64_t v17 = " [%s] %s:%d Applying mute property for audioSessionId=%d, isMuted=%d";
      int v18 = v15;
      uint32_t v19 = 40;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v13 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v13 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_27;
      }
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      uint64_t v21 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_27;
      }
      unsigned int v22 = [(VCAudioUnitProperties *)self->_currentAudioUnitProperties audioSessionId];
      int v23 = 136316674;
      uint64_t v24 = v20;
      __int16 v25 = 2080;
      uint64_t v26 = "-[VCAudioManager applyAudioSessionMute]";
      __int16 v27 = 1024;
      int v28 = 603;
      __int16 v29 = 2112;
      *(void *)__int16 v30 = v13;
      *(_WORD *)&v30[8] = 2048;
      long long v31 = self;
      __int16 v32 = 1024;
      unsigned int v33 = v22;
      __int16 v34 = 1024;
      int v35 = isMicrophoneMuted;
      uint64_t v17 = " [%s] %s:%d %@(%p) Applying mute property for audioSessionId=%d, isMuted=%d";
      int v18 = v21;
      uint32_t v19 = 60;
    }
    _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v23, v19);
LABEL_27:
    self->_sinkData.isMuted = isMicrophoneMuted;
    AUIOSetMute((uint64_t)self->_hAUIO, isMicrophoneMuted);
    return;
  }
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 136315650;
        uint64_t v24 = v6;
        __int16 v25 = 2080;
        uint64_t v26 = "-[VCAudioManager applyAudioSessionMute]";
        __int16 v27 = 1024;
        int v28 = 598;
        uint32_t v8 = " [%s] %s:%d Not applying mute to the AUIO because this manager does not support it.";
        uint32_t v9 = v7;
        uint32_t v10 = 28;
LABEL_14:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v23, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v3 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 136316162;
        uint64_t v24 = v11;
        __int16 v25 = 2080;
        uint64_t v26 = "-[VCAudioManager applyAudioSessionMute]";
        __int16 v27 = 1024;
        int v28 = 598;
        __int16 v29 = 2112;
        *(void *)__int16 v30 = v3;
        *(_WORD *)&v30[8] = 2048;
        long long v31 = self;
        uint32_t v8 = " [%s] %s:%d %@(%p) Not applying mute to the AUIO because this manager does not support it.";
        uint32_t v9 = v12;
        uint32_t v10 = 48;
        goto LABEL_14;
      }
    }
  }
}

- (void)setInputMetering
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_hAUIO != (tagHANDLE *)0xFFFFFFFFLL)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    allClients = self->_allClients;
    uint64_t v4 = [(NSMutableArray *)allClients countByEnumeratingWithState:&v10 objects:v9 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(allClients);
          }
          if ([*(id *)(*((void *)&v10 + 1) + 8 * i) isInputMeteringEnabled])
          {
            int v8 = 1;
            goto LABEL_12;
          }
        }
        uint64_t v5 = [(NSMutableArray *)allClients countByEnumeratingWithState:&v10 objects:v9 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
    int v8 = 0;
LABEL_12:
    self->_isInputMeteringEnabled = v8;
    AUIOSetInputMeterEnabled((uint64_t)self->_hAUIO, v8);
  }
}

- (void)setOutputMetering
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_hAUIO != (tagHANDLE *)0xFFFFFFFFLL)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    allClients = self->_allClients;
    uint64_t v4 = [(NSMutableArray *)allClients countByEnumeratingWithState:&v10 objects:v9 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(allClients);
          }
          if ([*(id *)(*((void *)&v10 + 1) + 8 * i) isOuputMeteringEnabled])
          {
            int v8 = 1;
            goto LABEL_12;
          }
        }
        uint64_t v5 = [(NSMutableArray *)allClients countByEnumeratingWithState:&v10 objects:v9 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
    int v8 = 0;
LABEL_12:
    self->_isOutputMeteringEnabled = v8;
    AUIOSetOutputMeterEnabled((uint64_t)self->_hAUIO, v8);
  }
}

- (BOOL)getAudioSessionMediaProperties:(id)a3 forVPOperatingMode:(unsigned int)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  unsigned int inData = a4;
  if (!a3) {
    return 0;
  }
  AudioComponentInstance outInstance = 0;
  BYTE1(inDesc.componentFlags) = 0;
  HIWORD(inDesc.componentFlags) = 0;
  inDesc.componentFlagsMask = 0;
  strcpy((char *)&inDesc, "uouaoipvlppa");
  Next = AudioComponentFindNext(0, &inDesc);
  if (!Next)
  {
    int v19 = -2145714154;
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioManager getAudioSessionMediaProperties:forVPOperatingMode:]();
        }
      }
      goto LABEL_39;
    }
    if (objc_opt_respondsToSelector()) {
      long long v31 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
    }
    else {
      long long v31 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_39;
    }
    uint64_t v40 = VRTraceErrorLogLevelToCSTR();
    uint64_t v41 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v55 = v40;
    __int16 v56 = 2080;
    v57 = "-[VCAudioManager getAudioSessionMediaProperties:forVPOperatingMode:]";
    __int16 v58 = 1024;
    int v59 = 663;
    __int16 v60 = 2112;
    *(void *)v61 = v31;
    *(_WORD *)&v61[8] = 2048;
    *(void *)&long long v62 = self;
    uint64_t v37 = " [%s] %s:%d %@(%p) AudioComponentFindNext failed";
LABEL_74:
    uint64_t v38 = v41;
    uint32_t v39 = 48;
    goto LABEL_83;
  }
  OSStatus v7 = AudioComponentInstanceNew(Next, &outInstance);
  OSStatus v50 = v7;
  if (v7)
  {
    int v19 = v7 | 0xA01B0000;
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioManager getAudioSessionMediaProperties:forVPOperatingMode:]();
        }
      }
      goto LABEL_39;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v32 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v32 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_39;
    }
    uint64_t v42 = VRTraceErrorLogLevelToCSTR();
    uint64_t v41 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v55 = v42;
    __int16 v56 = 2080;
    v57 = "-[VCAudioManager getAudioSessionMediaProperties:forVPOperatingMode:]";
    __int16 v58 = 1024;
    int v59 = 666;
    __int16 v60 = 2112;
    *(void *)v61 = v32;
    *(_WORD *)&v61[8] = 2048;
    *(void *)&long long v62 = self;
    uint64_t v37 = " [%s] %s:%d %@(%p) AudioComponentInstanceNew failed";
    goto LABEL_74;
  }
  OSStatus v8 = AudioUnitSetProperty(outInstance, 0x846u, 0, 0, &inData, 4u);
  OSStatus v50 = v8;
  if (v8)
  {
    int v19 = v8 | 0xA01B0000;
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_39;
      }
      uint64_t v35 = VRTraceErrorLogLevelToCSTR();
      uint64_t v36 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_39;
      }
      *(_DWORD *)buf = 136316674;
      uint64_t v55 = v35;
      __int16 v56 = 2080;
      v57 = "-[VCAudioManager getAudioSessionMediaProperties:forVPOperatingMode:]";
      __int16 v58 = 1024;
      int v59 = 670;
      __int16 v60 = 1024;
      *(_DWORD *)v61 = inData;
      *(_WORD *)&v61[4] = 1024;
      *(_DWORD *)&v61[6] = v50;
      LOWORD(v62) = 1040;
      *(_DWORD *)((char *)&v62 + 2) = 4;
      WORD3(v62) = 2080;
      *((void *)&v62 + 1) = &v50;
      uint64_t v37 = " [%s] %s:%d AudioUnitSetProperty failed to set property kAUVoiceIOProperty_OperationMode %d %d %.4s";
      uint64_t v38 = v36;
      uint32_t v39 = 56;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        unsigned int v33 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
      }
      else {
        unsigned int v33 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_39;
      }
      uint64_t v43 = VRTraceErrorLogLevelToCSTR();
      uint64_t v44 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_39;
      }
      *(_DWORD *)buf = 136317186;
      uint64_t v55 = v43;
      __int16 v56 = 2080;
      v57 = "-[VCAudioManager getAudioSessionMediaProperties:forVPOperatingMode:]";
      __int16 v58 = 1024;
      int v59 = 670;
      __int16 v60 = 2112;
      *(void *)v61 = v33;
      *(_WORD *)&v61[8] = 2048;
      *(void *)&long long v62 = self;
      WORD4(v62) = 1024;
      *(_DWORD *)((char *)&v62 + 10) = inData;
      HIWORD(v62) = 1024;
      int v63 = v50;
      __int16 v64 = 1040;
      *(_DWORD *)v65 = 4;
      *(_WORD *)&v65[4] = 2080;
      *(void *)&v65[6] = &v50;
      uint64_t v37 = " [%s] %s:%d %@(%p) AudioUnitSetProperty failed to set property kAUVoiceIOProperty_OperationMode %d %d %.4s";
      uint64_t v38 = v44;
      uint32_t v39 = 76;
    }
    goto LABEL_83;
  }
  double outData = 0.0;
  UInt32 ioDataSize = 8;
  OSStatus Property = AudioUnitGetProperty(outInstance, 0x84Du, 0, 0, &outData, &ioDataSize);
  if (Property < 0 || outData == 0.0)
  {
    double outData = dbl_1E259BB00[inData == 6];
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        long long v13 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          uint64_t v55 = v12;
          __int16 v56 = 2080;
          v57 = "-[VCAudioManager getAudioSessionMediaProperties:forVPOperatingMode:]";
          __int16 v58 = 1024;
          int v59 = 677;
          __int16 v60 = 1024;
          *(_DWORD *)v61 = inData;
          *(_WORD *)&v61[4] = 1024;
          *(_DWORD *)&v61[6] = Property;
          LOWORD(v62) = 2048;
          *(double *)((char *)&v62 + 2) = outData;
          uint64_t v14 = " [%s] %s:%d Failed to get retrieve preferred sample rate for VP operating mode:%d err=0x%x. Defaulting to: %f";
          uint64_t v15 = v13;
          uint32_t v16 = 50;
LABEL_18:
          _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        long long v10 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
      }
      else {
        long long v10 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v17 = VRTraceErrorLogLevelToCSTR();
        int v18 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316930;
          uint64_t v55 = v17;
          __int16 v56 = 2080;
          v57 = "-[VCAudioManager getAudioSessionMediaProperties:forVPOperatingMode:]";
          __int16 v58 = 1024;
          int v59 = 677;
          __int16 v60 = 2112;
          *(void *)v61 = v10;
          *(_WORD *)&v61[8] = 2048;
          *(void *)&long long v62 = self;
          WORD4(v62) = 1024;
          *(_DWORD *)((char *)&v62 + 10) = inData;
          HIWORD(v62) = 1024;
          int v63 = Property;
          __int16 v64 = 2048;
          *(double *)v65 = outData;
          uint64_t v14 = " [%s] %s:%d %@(%p) Failed to get retrieve preferred sample rate for VP operating mode:%d err=0x%x. Defaulting to: %f";
          uint64_t v15 = v18;
          uint32_t v16 = 70;
          goto LABEL_18;
        }
      }
    }
  }
  double v47 = NAN;
  UInt32 ioDataSize = 8;
  int v19 = AudioUnitGetProperty(outInstance, 0x84Eu, 0, 0, &v47, &ioDataSize);
  if (v19 < 0)
  {
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioManager getAudioSessionMediaProperties:forVPOperatingMode:]();
        }
      }
      goto LABEL_39;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v34 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v34 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_39;
    }
    uint64_t v45 = VRTraceErrorLogLevelToCSTR();
    __int16 v46 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    *(_DWORD *)buf = 136316418;
    uint64_t v55 = v45;
    __int16 v56 = 2080;
    v57 = "-[VCAudioManager getAudioSessionMediaProperties:forVPOperatingMode:]";
    __int16 v58 = 1024;
    int v59 = 683;
    __int16 v60 = 2112;
    *(void *)v61 = v34;
    *(_WORD *)&v61[8] = 2048;
    *(void *)&long long v62 = self;
    WORD4(v62) = 1024;
    *(_DWORD *)((char *)&v62 + 10) = v19;
    uint64_t v37 = " [%s] %s:%d %@(%p) Get property failed (block size): %x";
    uint64_t v38 = v46;
    uint32_t v39 = 54;
LABEL_83:
    _os_log_error_impl(&dword_1E1EA4000, v38, OS_LOG_TYPE_ERROR, v37, buf, v39);
    goto LABEL_39;
  }
  int v20 = [+[VCDefaults sharedInstance] forceAudioHardwareSampleRate];
  if (v20) {
    double outData = (double)v20;
  }
  objc_msgSend(a3, "setPreferredSampleRate:");
  [a3 setPreferredBlockSize:v47];
  [a3 setOperatingMode:0];
  BOOL v22 = self->_useOptimizedHandoversForTelephony && inData == 6;
  [a3 setAudioClockDeviceEnabled:v22];
  [a3 setNetworkUplinkClockUsesBaseband:0];
  if ((VCAudioManager *)objc_opt_class() != self)
  {
    if (objc_opt_respondsToSelector()) {
      int v23 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
    }
    else {
      int v23 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_39;
    }
    uint64_t v29 = VRTraceErrorLogLevelToCSTR();
    __int16 v30 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_39;
    }
    *(_DWORD *)buf = 136316930;
    uint64_t v55 = v29;
    __int16 v56 = 2080;
    v57 = "-[VCAudioManager getAudioSessionMediaProperties:forVPOperatingMode:]";
    __int16 v58 = 1024;
    int v59 = 695;
    __int16 v60 = 2112;
    *(void *)v61 = v23;
    *(_WORD *)&v61[8] = 2048;
    *(void *)&long long v62 = self;
    WORD4(v62) = 1024;
    *(_DWORD *)((char *)&v62 + 10) = inData;
    HIWORD(v62) = 1024;
    int v63 = (int)outData;
    __int16 v64 = 2048;
    *(double *)v65 = v47;
    uint64_t v26 = " [%s] %s:%d %@(%p) Hardware preference for VP operating mode: %d -> sampleRate=%d blockSize=%f";
    __int16 v27 = v30;
    uint32_t v28 = 70;
    goto LABEL_38;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v24 = VRTraceErrorLogLevelToCSTR();
    __int16 v25 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v55 = v24;
      __int16 v56 = 2080;
      v57 = "-[VCAudioManager getAudioSessionMediaProperties:forVPOperatingMode:]";
      __int16 v58 = 1024;
      int v59 = 695;
      __int16 v60 = 1024;
      *(_DWORD *)v61 = inData;
      *(_WORD *)&v61[4] = 1024;
      *(_DWORD *)&v61[6] = (int)outData;
      LOWORD(v62) = 2048;
      *(double *)((char *)&v62 + 2) = v47;
      uint64_t v26 = " [%s] %s:%d Hardware preference for VP operating mode: %d -> sampleRate=%d blockSize=%f";
      __int16 v27 = v25;
      uint32_t v28 = 50;
LABEL_38:
      _os_log_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
    }
  }
LABEL_39:
  if (outInstance) {
    AudioComponentInstanceDispose(outInstance);
  }
  return v19 >= 0;
}

- (void)computeHardwarePreferences
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v3 = [&unk_1F3DC7068 countByEnumeratingWithState:&v36 objects:v35 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v37;
    *(void *)&long long v4 = 136315906;
    long long v21 = v4;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v37 != v6) {
          objc_enumerationMutation(&unk_1F3DC7068);
        }
        OSStatus v8 = *(void **)(*((void *)&v36 + 1) + 8 * v7);
        uint32_t v9 = objc_alloc_init(VCAudioSessionMediaProperties);
        if (-[VCAudioManager getAudioSessionMediaProperties:forVPOperatingMode:](self, "getAudioSessionMediaProperties:forVPOperatingMode:", v9, [v8 unsignedIntValue]))
        {
          [v22 setObject:v9 forKeyedSubscript:v8];
          goto LABEL_16;
        }
        if ((VCAudioManager *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v17 = VRTraceErrorLogLevelToCSTR();
            int v18 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
            {
              int v19 = [v8 unsignedIntValue];
              *(_DWORD *)buf = v21;
              uint64_t v24 = v17;
              __int16 v25 = 2080;
              uint64_t v26 = "-[VCAudioManager computeHardwarePreferences]";
              __int16 v27 = 1024;
              int v28 = 722;
              __int16 v29 = 1024;
              LODWORD(v30) = v19;
              uint64_t v14 = v18;
              uint64_t v15 = " [%s] %s:%d Failed to get media properties for VP operatingMode:%u";
              uint32_t v16 = 34;
              goto LABEL_19;
            }
          }
        }
        else
        {
          long long v10 = &stru_1F3D3E450;
          if (objc_opt_respondsToSelector()) {
            long long v10 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v11 = VRTraceErrorLogLevelToCSTR();
            uint64_t v12 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
            {
              int v13 = [v8 unsignedIntValue];
              *(_DWORD *)buf = 136316418;
              uint64_t v24 = v11;
              __int16 v25 = 2080;
              uint64_t v26 = "-[VCAudioManager computeHardwarePreferences]";
              __int16 v27 = 1024;
              int v28 = 722;
              __int16 v29 = 2112;
              __int16 v30 = v10;
              __int16 v31 = 2048;
              __int16 v32 = self;
              __int16 v33 = 1024;
              int v34 = v13;
              uint64_t v14 = v12;
              uint64_t v15 = " [%s] %s:%d %@(%p) Failed to get media properties for VP operatingMode:%u";
              uint32_t v16 = 54;
LABEL_19:
              _os_log_error_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_ERROR, v15, buf, v16);
            }
          }
        }
LABEL_16:

        ++v7;
      }
      while (v5 != v7);
      uint64_t v20 = [&unk_1F3DC7068 countByEnumeratingWithState:&v36 objects:v35 count:16];
      uint64_t v5 = v20;
    }
    while (v20);
  }
  -[VCAudioManager setVpOperatingModeToAudioSessionMediaFormatMapping:](self, "setVpOperatingModeToAudioSessionMediaFormatMapping:", v22, v21);
}

- (void)resetAudioTimestamps
{
  VCAudioIOControllerIOState_ResetControllerTime(&self->_sinkData.timestampInitialized);

  VCAudioIOControllerIOState_ResetControllerTime(&self->_sourceData.timestampInitialized);
}

- (int)prewarmingClientOperatingMode
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  allClients = self->_allClients;
  uint64_t v3 = [(NSMutableArray *)allClients countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(allClients);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * v6);
        if ([v7 isPrewarmingClient])
        {
          LODWORD(v3) = [v7 operatingMode];
          return v3;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v3 = [(NSMutableArray *)allClients countByEnumeratingWithState:&v10 objects:v9 count:16];
      uint64_t v4 = v3;
      if (v3) {
        continue;
      }
      break;
    }
  }
  return v3;
}

- (void)flushEventQueue:(opaqueCMSimpleQueue *)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  double v4 = 0.0;
  if (VRTraceIsInternalOSInstalled()) {
    double v4 = micro();
  }
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = CMSimpleQueueDequeue(a3);
  v18[0] = (uint64_t)v6;
  for (int i = 0; v6; v18[0] = (uint64_t)v6)
  {
    uint64_t v8 = [MEMORY[0x1E4F29238] valueWithPointer:v6[1]];
    int v9 = [v5 containsObject:v8];
    if ((v9 & 1) == 0) {
      [v5 addObject:v8];
    }
    VCAudioManager_ReleaseAudioEvent(v18, v9 ^ 1);
    ++i;
    uint64_t v6 = CMSimpleQueueDequeue(a3);
  }
  [v5 removeAllObjects];

  LogProfileTimeOverLimit(v4, v10, v11, v12, v13, v14, v15, v16, v17, (char)"-[VCAudioManager flushEventQueue:]");
}

- (void)removeAllClientsForIO:(_VCAudioIOControllerIOState *)a3
{
  v4[1] = *MEMORY[0x1E4F143B8];
  p_clientIOList = (uint64_t *)&a3->clientIOList;
  while (1)
  {
    v4[0] = (uint64_t)VCSingleLinkedListPop(p_clientIOList);
    if (!v4[0]) {
      break;
    }
    VCAudioManager_ReleaseAudioEvent(v4, 1);
  }
}

- (BOOL)addClient:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  char v5 = -[NSMutableArray containsObject:](self->_allClients, "containsObject:");
  if ((v5 & 1) == 0)
  {
    [(VCAudioManager *)self enableSpatialStreamParametersForClient:a3];
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_13;
      }
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      uint64_t v9 = [a3 sinkIO];
      uint64_t v10 = [a3 sourceIO];
      unsigned int state = self->_state;
      int v12 = [(NSMutableArray *)self->_allClients count];
      *(_DWORD *)int v23 = 136316930;
      *(void *)&v23[4] = v7;
      *(_WORD *)&v23[12] = 2080;
      *(void *)&v23[14] = "-[VCAudioManager addClient:]";
      *(_WORD *)&v23[22] = 1024;
      LODWORD(v24) = 810;
      WORD2(v24) = 2048;
      *(void *)((char *)&v24 + 6) = a3;
      HIWORD(v24) = 2048;
      __int16 v25 = (VCAudioManager *)v9;
      *(_WORD *)uint64_t v26 = 2048;
      *(void *)&v26[2] = v10;
      *(_WORD *)&v26[10] = 1024;
      *(_DWORD *)&v26[12] = state;
      *(_WORD *)&v26[16] = 1024;
      *(_DWORD *)&v26[18] = v12;
      uint64_t v13 = " [%s] %s:%d Adding client[%p] with sinkIO[%p], sourceIO[%p] in current manager state=%d clientCount (before add)=%d";
      uint64_t v14 = v8;
      uint32_t v15 = 70;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v6 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_13;
      }
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      uint64_t v17 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      uint64_t v18 = [a3 sinkIO];
      uint64_t v19 = [a3 sourceIO];
      unsigned int v20 = self->_state;
      int v21 = [(NSMutableArray *)self->_allClients count];
      *(_DWORD *)int v23 = 136317442;
      *(void *)&v23[4] = v16;
      *(_WORD *)&v23[12] = 2080;
      *(void *)&v23[14] = "-[VCAudioManager addClient:]";
      *(_WORD *)&v23[22] = 1024;
      LODWORD(v24) = 810;
      WORD2(v24) = 2112;
      *(void *)((char *)&v24 + 6) = v6;
      HIWORD(v24) = 2048;
      __int16 v25 = self;
      *(_WORD *)uint64_t v26 = 2048;
      *(void *)&v26[2] = a3;
      *(_WORD *)&v26[10] = 2048;
      *(void *)&v26[12] = v18;
      *(_WORD *)&v26[20] = 2048;
      *(void *)&v26[22] = v19;
      *(_WORD *)&v26[30] = 1024;
      LODWORD(v27) = v20;
      WORD2(v27) = 1024;
      *(_DWORD *)((char *)&v27 + 6) = v21;
      uint64_t v13 = " [%s] %s:%d %@(%p) Adding client[%p] with sinkIO[%p], sourceIO[%p] in current manager state=%d clientCount (before add)=%d";
      uint64_t v14 = v17;
      uint32_t v15 = 90;
    }
    _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, v13, v23, v15);
LABEL_13:
    -[NSMutableArray addObject:](self->_allClients, "addObject:", a3, *(_OWORD *)v23, *(void *)&v23[16], v24, v25, *(_OWORD *)v26, *(_OWORD *)&v26[16], v27);
    +[VCAudioSmartRoutingManager addClient:a3];
  }
  return v5 ^ 1;
}

- (void)waitIdleForClient:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (!+[VCDefaults BOOLeanValueForKey:@"skipAudioManagerIdleWait" defaultValue:0])
  {
    if (([a3 direction] & 2) == 0) {
      goto LABEL_29;
    }
    dispatch_time_t v6 = dispatch_time(0, 1000000000);
    if (!dispatch_semaphore_wait(*(dispatch_semaphore_t *)([a3 sinkIO] + 16), v6))
    {
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)([a3 sinkIO] + 16));
      goto LABEL_29;
    }
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_28;
      }
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      uint64_t v17 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_28;
      }
      *(_DWORD *)int v34 = 136316162;
      *(void *)&v34[4] = v16;
      *(_WORD *)&v34[12] = 2080;
      *(void *)&v34[14] = "-[VCAudioManager waitIdleForClient:]";
      *(_WORD *)&v34[22] = 1024;
      LODWORD(v35) = 829;
      WORD2(v35) = 2048;
      *(void *)((char *)&v35 + 6) = a3;
      HIWORD(v35) = 2048;
      long long v36 = (VCAudioManager *)[a3 sinkIO];
      uint64_t v18 = " [%s] %s:%d Sink run lock semaphore was not signaled! client=%p sinkIO=%p";
      uint64_t v19 = v17;
      uint32_t v20 = 48;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v7 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_28;
      }
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      id v22 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_28;
      }
      *(_DWORD *)int v34 = 136316674;
      *(void *)&v34[4] = v21;
      *(_WORD *)&v34[12] = 2080;
      *(void *)&v34[14] = "-[VCAudioManager waitIdleForClient:]";
      *(_WORD *)&v34[22] = 1024;
      LODWORD(v35) = 829;
      WORD2(v35) = 2112;
      *(void *)((char *)&v35 + 6) = v7;
      HIWORD(v35) = 2048;
      long long v36 = self;
      *(_WORD *)long long v37 = 2048;
      *(void *)&v37[2] = a3;
      *(_WORD *)&v37[10] = 2048;
      *(void *)&v37[12] = [a3 sinkIO];
      uint64_t v18 = " [%s] %s:%d %@(%p) Sink run lock semaphore was not signaled! client=%p sinkIO=%p";
      uint64_t v19 = v22;
      uint32_t v20 = 68;
    }
    _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, v18, v34, v20);
LABEL_28:
    _VCAudioManager_ProcessEventQueue((uint64_t)&self->_sinkData);
LABEL_29:
    if ((objc_msgSend(a3, "direction", *(void *)v34, *(_OWORD *)&v34[8], v35, v36, *(void *)v37, *(_OWORD *)&v37[8]) & 1) == 0)return; {
    dispatch_time_t v23 = dispatch_time(0, 1000000000);
    }
    if (!dispatch_semaphore_wait(*(dispatch_semaphore_t *)([a3 sourceIO] + 16), v23))
    {
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)([a3 sourceIO] + 16));
      return;
    }
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_43;
      }
      uint64_t v25 = VRTraceErrorLogLevelToCSTR();
      uint64_t v26 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_43;
      }
      uint64_t v27 = [a3 sourceIO];
      *(_DWORD *)int v34 = 136316162;
      *(void *)&v34[4] = v25;
      *(_WORD *)&v34[12] = 2080;
      *(void *)&v34[14] = "-[VCAudioManager waitIdleForClient:]";
      *(_WORD *)&v34[22] = 1024;
      LODWORD(v35) = 839;
      WORD2(v35) = 2048;
      *(void *)((char *)&v35 + 6) = a3;
      HIWORD(v35) = 2048;
      long long v36 = (VCAudioManager *)v27;
      uint64_t v28 = " [%s] %s:%d Source run lock semaphore was not signaled! client=%p sourceIO=%p";
      __int16 v29 = v26;
      uint32_t v30 = 48;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        long long v24 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
      }
      else {
        long long v24 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_43;
      }
      uint64_t v31 = VRTraceErrorLogLevelToCSTR();
      __int16 v32 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_43;
      }
      uint64_t v33 = [a3 sourceIO];
      *(_DWORD *)int v34 = 136316674;
      *(void *)&v34[4] = v31;
      *(_WORD *)&v34[12] = 2080;
      *(void *)&v34[14] = "-[VCAudioManager waitIdleForClient:]";
      *(_WORD *)&v34[22] = 1024;
      LODWORD(v35) = 839;
      WORD2(v35) = 2112;
      *(void *)((char *)&v35 + 6) = v24;
      HIWORD(v35) = 2048;
      long long v36 = self;
      *(_WORD *)long long v37 = 2048;
      *(void *)&v37[2] = a3;
      *(_WORD *)&v37[10] = 2048;
      *(void *)&v37[12] = v33;
      uint64_t v28 = " [%s] %s:%d %@(%p) Source run lock semaphore was not signaled! client=%p sourceIO=%p";
      __int16 v29 = v32;
      uint32_t v30 = 68;
    }
    _os_log_impl(&dword_1E1EA4000, v29, OS_LOG_TYPE_DEFAULT, v28, v34, v30);
LABEL_43:
    p_sourceData = &self->_sourceData;
    goto LABEL_44;
  }
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      goto LABEL_18;
    }
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    *(_DWORD *)int v34 = 136315906;
    *(void *)&v34[4] = v8;
    *(_WORD *)&v34[12] = 2080;
    *(void *)&v34[14] = "-[VCAudioManager waitIdleForClient:]";
    *(_WORD *)&v34[22] = 1024;
    LODWORD(v35) = 820;
    WORD2(v35) = 2112;
    *(void *)((char *)&v35 + 6) = @"skipAudioManagerIdleWait";
    uint64_t v10 = " [%s] %s:%d %@ set. Skipping idle wait";
    uint64_t v11 = v9;
    uint32_t v12 = 38;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      char v5 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
    }
    else {
      char v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      goto LABEL_18;
    }
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    uint64_t v14 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    *(_DWORD *)int v34 = 136316418;
    *(void *)&v34[4] = v13;
    *(_WORD *)&v34[12] = 2080;
    *(void *)&v34[14] = "-[VCAudioManager waitIdleForClient:]";
    *(_WORD *)&v34[22] = 1024;
    LODWORD(v35) = 820;
    WORD2(v35) = 2112;
    *(void *)((char *)&v35 + 6) = v5;
    HIWORD(v35) = 2048;
    long long v36 = self;
    *(_WORD *)long long v37 = 2112;
    *(void *)&v37[2] = @"skipAudioManagerIdleWait";
    uint64_t v10 = " [%s] %s:%d %@(%p) %@ set. Skipping idle wait";
    uint64_t v11 = v14;
    uint32_t v12 = 58;
  }
  _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, v34, v12);
LABEL_18:
  _VCAudioManager_ProcessEventQueue((uint64_t)[(VCAudioManager *)self sinkIO]);
  p_sourceData = [(VCAudioManager *)self sourceIO];
LABEL_44:
  _VCAudioManager_ProcessEventQueue((uint64_t)p_sourceData);
}

- (BOOL)removeClient:(id)a3
{
  int v5 = -[NSMutableArray containsObject:](self->_allClients, "containsObject:");
  if (v5)
  {
    if (([a3 direction] & 2) != 0) {
      -[VCAudioManager unregisterClientIO:controllerIO:](self, "unregisterClientIO:controllerIO:", [a3 sinkIO], &self->_sinkData);
    }
    if ([a3 direction]) {
      -[VCAudioManager unregisterClientIO:controllerIO:](self, "unregisterClientIO:controllerIO:", [a3 sourceIO], &self->_sourceData);
    }
    [(VCAudioManager *)self waitIdleForClient:a3];
    +[VCAudioSmartRoutingManager removeClient:a3];
    [(NSMutableArray *)self->_allClients removeObject:a3];
    [(NSMutableArray *)self->_startingIOClients removeObject:a3];
    [(VCAudioManager *)self disableSpatialStreamParametersForClient:a3];
  }
  return v5;
}

- (void)_cleanupDeadClients
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  allClients = self->_allClients;
  uint64_t v5 = [(NSMutableArray *)allClients countByEnumeratingWithState:&v32 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v33;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(allClients);
        }
        uint64_t v9 = *(__CFString **)(*((void *)&v32 + 1) + 8 * v8);
        if (![(__CFString *)v9 delegate])
        {
          if ((VCAudioManager *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              uint64_t v16 = VRTraceErrorLogLevelToCSTR();
              uint64_t v17 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315906;
                uint64_t v20 = v16;
                __int16 v21 = 2080;
                id v22 = "-[VCAudioManager _cleanupDeadClients]";
                __int16 v23 = 1024;
                int v24 = 874;
                __int16 v25 = 2048;
                uint64_t v26 = v9;
                uint64_t v13 = v17;
                uint64_t v14 = " [%s] %s:%d Removing dead client (%p)!";
                uint32_t v15 = 38;
LABEL_19:
                _os_log_error_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_ERROR, v14, buf, v15);
              }
            }
          }
          else
          {
            uint64_t v10 = &stru_1F3D3E450;
            if (objc_opt_respondsToSelector()) {
              uint64_t v10 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              uint64_t v11 = VRTraceErrorLogLevelToCSTR();
              uint32_t v12 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316418;
                uint64_t v20 = v11;
                __int16 v21 = 2080;
                id v22 = "-[VCAudioManager _cleanupDeadClients]";
                __int16 v23 = 1024;
                int v24 = 874;
                __int16 v25 = 2112;
                uint64_t v26 = v10;
                __int16 v27 = 2048;
                uint64_t v28 = self;
                __int16 v29 = 2048;
                uint32_t v30 = v9;
                uint64_t v13 = v12;
                uint64_t v14 = " [%s] %s:%d %@(%p) Removing dead client (%p)!";
                uint32_t v15 = 58;
                goto LABEL_19;
              }
            }
          }
          objc_msgSend(v3, "setObject:atIndexedSubscript:", v9, objc_msgSend(v3, "count"));
          +[VCAudioSmartRoutingManager removeClient:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v18 = [(NSMutableArray *)allClients countByEnumeratingWithState:&v32 objects:v31 count:16];
      uint64_t v6 = v18;
    }
    while (v18);
  }
  [(NSMutableArray *)self->_allClients removeObjectsInArray:v3];
}

- (unsigned)vpOperationModeForConferenceOperatingMode:(int)a3 deviceRole:(int)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (self->_isGKVoiceChat)
  {
    unsigned int v6 = 3;
  }
  else
  {
    unsigned int v6 = 0;
    switch(a3)
    {
      case 1:
      case 4:
      case 6:
        unsigned int v6 = 2;
        break;
      case 2:
        if (a4 == 1) {
          unsigned int v6 = 5;
        }
        else {
          unsigned int v6 = 4;
        }
        break;
      case 3:
        unsigned int v6 = 6;
        break;
      case 5:
      case 11:
        unsigned int v6 = 7;
        break;
      case 7:
        unsigned int v6 = 8;
        break;
      default:
        break;
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136316418;
      uint64_t v11 = v7;
      __int16 v12 = 2080;
      uint64_t v13 = "-[VCAudioManager vpOperationModeForConferenceOperatingMode:deviceRole:]";
      __int16 v14 = 1024;
      int v15 = 910;
      __int16 v16 = 1024;
      int v17 = a3;
      __int16 v18 = 1024;
      int v19 = a4;
      __int16 v20 = 1024;
      unsigned int v21 = v6;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d conferenceMode=%d, deviceRole=%d, vpOperatingMode=%d", (uint8_t *)&v10, 0x2Eu);
    }
  }
  return v6;
}

- (void)computeFormatDescription:(AudioStreamBasicDescription *)a3 withPreferredClient:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [a4 clientFormat];
  uint64_t v8 = *(void *)(v7 + 32);
  long long v9 = *(_OWORD *)(v7 + 16);
  *(_OWORD *)&a3->double mSampleRate = *(_OWORD *)v7;
  *(_OWORD *)&a3->mBytesPerPacket = v9;
  *(void *)&a3->mBitsPerChannel = v8;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  allClients = self->_allClients;
  uint64_t v11 = [(NSMutableArray *)allClients countByEnumeratingWithState:&v19 objects:v18 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    UInt32 v13 = 0;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(allClients);
        }
        __int16 v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (([a4 deviceRole] != 2 || objc_msgSend(v16, "deviceRole") == 2)
          && ([a4 deviceRole] == 2 || objc_msgSend(v16, "deviceRole") != 2))
        {
          UInt32 v17 = *(_DWORD *)([v16 clientFormat] + 28);
          if (v17 > v13) {
            UInt32 v13 = v17;
          }
        }
      }
      uint64_t v12 = [(NSMutableArray *)allClients countByEnumeratingWithState:&v19 objects:v18 count:16];
    }
    while (v12);
  }
  else
  {
    UInt32 v13 = 0;
  }
  a3->mChannelsPerFrame = v13;
}

- (unsigned)computeSamplePerFrameWithPreferredClient:(id)a3 sampleRate:(unsigned int)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  allClients = self->_allClients;
  uint64_t v7 = [(NSMutableArray *)allClients countByEnumeratingWithState:&v19 objects:v18 count:16];
  if (!v7) {
    return -1;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v20;
  double v10 = (double)a4;
  unsigned int v11 = -1;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v20 != v9) {
        objc_enumerationMutation(allClients);
      }
      UInt32 v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      if (([a3 deviceRole] != 2 || objc_msgSend(v13, "deviceRole") == 2)
        && ([a3 deviceRole] == 2 || objc_msgSend(v13, "deviceRole") != 2))
      {
        uint64_t v14 = [v13 clientFormat];
        LODWORD(v15) = *(_DWORD *)(v14 + 40);
        unsigned int v16 = vcvtad_u64_f64(v10 * (double)v15 / *(double *)v14);
        if (v11 >= v16) {
          unsigned int v11 = v16;
        }
      }
    }
    uint64_t v8 = [(NSMutableArray *)allClients countByEnumeratingWithState:&v19 objects:v18 count:16];
  }
  while (v8);
  return v11;
}

- (BOOL)computeAllowAudioRecordingWithPreferredClient:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  allClients = self->_allClients;
  uint64_t v5 = [(NSMutableArray *)allClients countByEnumeratingWithState:&v16 objects:v15 count:16];
  if (!v5)
  {
    char v8 = 1;
    return v8 & 1;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v17;
  char v8 = 1;
  do
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v17 != v7) {
        objc_enumerationMutation(allClients);
      }
      double v10 = *(void **)(*((void *)&v16 + 1) + 8 * v9);
      if ([a3 deviceRole] != 2 || objc_msgSend(v10, "deviceRole") == 2)
      {
        if ([a3 deviceRole] == 2)
        {
          if ((v8 & 1) == 0)
          {
            char v8 = 0;
            goto LABEL_14;
          }
LABEL_13:
          char v8 = [v10 allowAudioRecording];
          goto LABEL_14;
        }
        int v11 = [v10 deviceRole];
        if (v11 != 2)
        {
          char v12 = v8 ^ 1;
          v8 &= v11 == 2;
          if (v12) {
            goto LABEL_14;
          }
          goto LABEL_13;
        }
        v8 &= 1u;
      }
LABEL_14:
      ++v9;
    }
    while (v6 != v9);
    uint64_t v13 = [(NSMutableArray *)allClients countByEnumeratingWithState:&v16 objects:v15 count:16];
    uint64_t v6 = v13;
  }
  while (v13);
  return v8 & 1;
}

- (id)newAudioUnitPropertiesWithPreferredClient:(id)a3
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  if ([a3 isPrewarmingClient] && self->_state >= 2)
  {
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return self->_currentAudioUnitProperties;
      }
      uint64_t v40 = VRTraceErrorLogLevelToCSTR();
      uint64_t v41 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return self->_currentAudioUnitProperties;
      }
      currentAudioUnitProperties = self->_currentAudioUnitProperties;
      *(_DWORD *)buf = 136315906;
      uint64_t v52 = v40;
      __int16 v53 = 2080;
      uint64_t v54 = "-[VCAudioManager newAudioUnitPropertiesWithPreferredClient:]";
      __int16 v55 = 1024;
      int v56 = 969;
      __int16 v57 = 2112;
      *(void *)__int16 v58 = currentAudioUnitProperties;
      uint64_t v43 = " [%s] %s:%d Last client is prewarming, ignore its settings. _currentAudioUnitProperties=%@";
      uint64_t v44 = v41;
      uint32_t v45 = 38;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v5 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return self->_currentAudioUnitProperties;
      }
      uint64_t v46 = VRTraceErrorLogLevelToCSTR();
      double v47 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return self->_currentAudioUnitProperties;
      }
      __int16 v48 = self->_currentAudioUnitProperties;
      *(_DWORD *)buf = 136316418;
      uint64_t v52 = v46;
      __int16 v53 = 2080;
      uint64_t v54 = "-[VCAudioManager newAudioUnitPropertiesWithPreferredClient:]";
      __int16 v55 = 1024;
      int v56 = 969;
      __int16 v57 = 2112;
      *(void *)__int16 v58 = v5;
      *(_WORD *)&v58[8] = 2048;
      *(void *)&v58[10] = self;
      *(_WORD *)&v58[18] = 2112;
      *(void *)&v58[20] = v48;
      uint64_t v43 = " [%s] %s:%d %@(%p) Last client is prewarming, ignore its settings. _currentAudioUnitProperties=%@";
      uint64_t v44 = v47;
      uint32_t v45 = 58;
    }
    _os_log_impl(&dword_1E1EA4000, v44, OS_LOG_TYPE_DEFAULT, v43, buf, v45);
    return self->_currentAudioUnitProperties;
  }
  uint64_t v6 = objc_alloc_init(VCAudioUnitProperties);
  uint64_t v7 = -[VCAudioManager vpOperationModeForConferenceOperatingMode:deviceRole:](self, "vpOperationModeForConferenceOperatingMode:deviceRole:", [a3 operatingMode], objc_msgSend(a3, "deviceRole"));
  *(void *)OSStatus v50 = -1;
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v50[8] = v8;
  *(_OWORD *)&v50[24] = v8;
  [(VCAudioManager *)self computeFormatDescription:v50 withPreferredClient:a3];
  if ([a3 deviceRole] == 2) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 1;
  }
  [(VCAudioUnitProperties *)v6 setAudioUnitType:v9];
  uint64_t v10 = [(VCAudioUnitProperties *)v6 frameFormatMic];
  long long v11 = *(_OWORD *)&v50[16];
  long long v12 = *(_OWORD *)v50;
  *(void *)(v10 + 32) = *(void *)&v50[32];
  *(_OWORD *)uint64_t v10 = v12;
  *(_OWORD *)(v10 + 16) = v11;
  unsigned int v13 = [(VCAudioManager *)self computeSamplePerFrameWithPreferredClient:a3 sampleRate:*(double *)v50];
  *(_DWORD *)([(VCAudioUnitProperties *)v6 frameFormatMic] + 40) = v13;
  [(VCAudioUnitProperties *)v6 setAllowAudioRecording:[(VCAudioManager *)self computeAllowAudioRecordingWithPreferredClient:a3]];
  -[VCAudioUnitProperties setDeviceRole:](v6, "setDeviceRole:", [a3 deviceRole]);
  -[VCAudioUnitProperties setOperatingMode:](v6, "setOperatingMode:", [a3 operatingMode]);
  [(VCAudioUnitProperties *)v6 setVpOperatingMode:v7];
  -[VCAudioUnitProperties setAudioSessionId:](v6, "setAudioSessionId:", [a3 audioSessionId]);
  if ([a3 isRemoteCodecInfoValid])
  {
    [a3 remoteCodecSampleRate];
    -[VCAudioUnitProperties setRemoteCodecSampleRate:](v6, "setRemoteCodecSampleRate:");
    uint64_t v14 = [a3 remoteCodecType];
  }
  else
  {
    [(VCAudioUnitProperties *)v6 setRemoteCodecSampleRate:24000.0];
    uint64_t v14 = 0;
  }
  [(VCAudioUnitProperties *)v6 setRemoteCodecType:v14];
  if ([a3 isRemoteVersionInfoValid])
  {
    [a3 farEndVersionInfo];
    v68[6] = v76;
    v68[7] = v77;
    int v69 = v78;
    v68[2] = v72;
    v68[3] = v73;
    v68[4] = v74;
    v68[5] = v75;
    v68[0] = v70;
    v68[1] = v71;
    [(VCAudioUnitProperties *)v6 setFarEndVersionInfo:v68];
  }
  unint64_t v15 = [(VCAudioUnitProperties *)v6 frameFormatSpeaker];
  long long v16 = [(VCAudioUnitProperties *)v6 frameFormatMic];
  long long v18 = *(_OWORD *)&v16->format.mBytesPerPacket;
  long long v17 = *(_OWORD *)&v16->format.mBitsPerChannel;
  *(_OWORD *)&v15->format.double mSampleRate = *(_OWORD *)&v16->format.mSampleRate;
  *(_OWORD *)&v15->format.mBytesPerPacket = v18;
  *(_OWORD *)&v15->format.mBitsPerChannel = v17;
  if ([(VCAudioUnitProperties *)v6 operatingMode] != 3 && !self->_isGKVoiceChat) {
    [(VCAudioManager *)self applySessionContextToAudioUnitProperties:v6 preferredClient:a3];
  }
  *(void *)&long long v19 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __str[2] = v19;
  __str[3] = v19;
  __str[0] = v19;
  __str[1] = v19;
  v66[2] = v19;
  v66[3] = v19;
  v66[0] = v19;
  v66[1] = v19;
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      long long v22 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v23 = [(VCAudioUnitProperties *)v6 audioUnitType];
        int v24 = FormatToCStr((uint64_t)[(VCAudioUnitProperties *)v6 frameFormatMic], (char *)__str, 0x40uLL);
        __int16 v25 = FormatToCStr((uint64_t)[(VCAudioUnitProperties *)v6 frameFormatSpeaker], (char *)v66, 0x40uLL);
        unsigned int v26 = [(VCAudioUnitProperties *)v6 audioSessionId];
        int v27 = (int)[(VCAudioUnitProperties *)v6 frameFormatMic][40];
        unsigned int v28 = [(VCAudioUnitProperties *)v6 vpOperatingMode];
        *(_DWORD *)buf = 136317186;
        uint64_t v52 = v21;
        __int16 v53 = 2080;
        uint64_t v54 = "-[VCAudioManager newAudioUnitPropertiesWithPreferredClient:]";
        __int16 v55 = 1024;
        int v56 = 1005;
        __int16 v57 = 1024;
        *(_DWORD *)__int16 v58 = v23;
        *(_WORD *)&v58[4] = 2080;
        *(void *)&v58[6] = v24;
        *(_WORD *)&v58[14] = 2080;
        *(void *)&v58[16] = v25;
        *(_WORD *)&v58[24] = 1024;
        *(_DWORD *)&v58[26] = v26;
        *(_WORD *)&v58[30] = 1024;
        *(_DWORD *)&v58[32] = v27;
        LOWORD(v59) = 1024;
        *(_DWORD *)((char *)&v59 + 2) = v28;
        __int16 v29 = " [%s] %s:%d Selected audio unit properties: UnitType=%d, micFormat=%s speakerFormat=%s audioSessionId=%u s"
              "amplesPerFrame=%d VPOperatingMode=%d";
        uint32_t v30 = v22;
        uint32_t v31 = 72;
LABEL_29:
        _os_log_impl(&dword_1E1EA4000, v30, OS_LOG_TYPE_DEFAULT, v29, buf, v31);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v20 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v20 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v32 = VRTraceErrorLogLevelToCSTR();
      long long v33 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v34 = [(VCAudioUnitProperties *)v6 audioUnitType];
        long long v35 = FormatToCStr((uint64_t)[(VCAudioUnitProperties *)v6 frameFormatMic], (char *)__str, 0x40uLL);
        uint64_t v36 = FormatToCStr((uint64_t)[(VCAudioUnitProperties *)v6 frameFormatSpeaker], (char *)v66, 0x40uLL);
        unsigned int v37 = [(VCAudioUnitProperties *)v6 audioSessionId];
        int v38 = (int)[(VCAudioUnitProperties *)v6 frameFormatMic][40];
        unsigned int v39 = [(VCAudioUnitProperties *)v6 vpOperatingMode];
        *(_DWORD *)buf = 136317698;
        uint64_t v52 = v32;
        __int16 v53 = 2080;
        uint64_t v54 = "-[VCAudioManager newAudioUnitPropertiesWithPreferredClient:]";
        __int16 v55 = 1024;
        int v56 = 1005;
        __int16 v57 = 2112;
        *(void *)__int16 v58 = v20;
        *(_WORD *)&v58[8] = 2048;
        *(void *)&v58[10] = self;
        *(_WORD *)&v58[18] = 1024;
        *(_DWORD *)&v58[20] = v34;
        *(_WORD *)&v58[24] = 2080;
        *(void *)&v58[26] = v35;
        *(_WORD *)&v58[34] = 2080;
        int v59 = v36;
        __int16 v60 = 1024;
        unsigned int v61 = v37;
        __int16 v62 = 1024;
        int v63 = v38;
        __int16 v64 = 1024;
        unsigned int v65 = v39;
        __int16 v29 = " [%s] %s:%d %@(%p) Selected audio unit properties: UnitType=%d, micFormat=%s speakerFormat=%s audioSession"
              "Id=%u samplesPerFrame=%d VPOperatingMode=%d";
        uint32_t v30 = v33;
        uint32_t v31 = 92;
        goto LABEL_29;
      }
    }
  }
  return v6;
}

- (id)newAudioUnitPropertiesForSystemAudioWithPreferredClient:(id)a3 isInput:(BOOL)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  BOOL v4 = a4;
  uint64_t v7 = objc_alloc_init(VCAudioUnitProperties);
  *(void *)uint64_t v43 = -1;
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v43[8] = v8;
  *(_OWORD *)&v43[24] = v8;
  [(VCAudioManager *)self computeFormatDescription:v43 withPreferredClient:a3];
  [(VCAudioUnitProperties *)v7 setAudioUnitType:1];
  -[VCAudioUnitProperties setDeviceRole:](v7, "setDeviceRole:", [a3 deviceRole]);
  -[VCAudioUnitProperties setOperatingMode:](v7, "setOperatingMode:", [a3 operatingMode]);
  -[VCAudioUnitProperties setAudioSessionId:](v7, "setAudioSessionId:", [a3 audioSessionId]);
  if (v4)
  {
    uint64_t v9 = [(VCAudioUnitProperties *)v7 frameFormatMic];
    long long v10 = *(_OWORD *)&v43[16];
    long long v11 = *(_OWORD *)v43;
    *(void *)(v9 + 32) = *(void *)&v43[32];
    *(_OWORD *)uint64_t v9 = v11;
    *(_OWORD *)(v9 + 16) = v10;
    unsigned int v12 = [(VCAudioManager *)self computeSamplePerFrameWithPreferredClient:a3 sampleRate:*(double *)v43];
    *(_DWORD *)([(VCAudioUnitProperties *)v7 frameFormatMic] + 40) = v12;
    *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v59 = v13;
    long long v60 = v13;
    long long v58 = v13;
    *(_OWORD *)__str = v13;
    if ((VCAudioManager *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v14 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v14 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v33 = VRTraceErrorLogLevelToCSTR();
        unsigned int v34 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v35 = [(VCAudioUnitProperties *)v7 audioUnitType];
          uint64_t v36 = FormatToCStr((uint64_t)[(VCAudioUnitProperties *)v7 frameFormatMic], __str, 0x40uLL);
          int v37 = (int)[(VCAudioUnitProperties *)v7 frameFormatMic][40];
          *(_DWORD *)buf = 136316930;
          uint64_t v45 = v33;
          __int16 v46 = 2080;
          double v47 = "-[VCAudioManager newAudioUnitPropertiesForSystemAudioWithPreferredClient:isInput:]";
          __int16 v48 = 1024;
          int v49 = 1027;
          __int16 v50 = 2112;
          *(void *)v51 = v14;
          *(_WORD *)&v51[8] = 2048;
          *(void *)&v51[10] = self;
          *(_WORD *)&v51[18] = 1024;
          unsigned int v52 = v35;
          __int16 v53 = 2080;
          uint64_t v54 = v36;
          __int16 v55 = 1024;
          int v56 = v37;
          unsigned int v26 = " [%s] %s:%d %@(%p) System audio unit properties: UnitType=%d, micFormat=%s samplesPerFrame=%d";
LABEL_25:
          uint32_t v31 = v34;
          uint32_t v32 = 70;
          goto LABEL_26;
        }
      }
      return v7;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return v7;
    }
    uint64_t v21 = VRTraceErrorLogLevelToCSTR();
    long long v22 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return v7;
    }
    unsigned int v23 = [(VCAudioUnitProperties *)v7 audioUnitType];
    int v24 = FormatToCStr((uint64_t)[(VCAudioUnitProperties *)v7 frameFormatMic], __str, 0x40uLL);
    int v25 = (int)[(VCAudioUnitProperties *)v7 frameFormatMic][40];
    *(_DWORD *)buf = 136316418;
    uint64_t v45 = v21;
    __int16 v46 = 2080;
    double v47 = "-[VCAudioManager newAudioUnitPropertiesForSystemAudioWithPreferredClient:isInput:]";
    __int16 v48 = 1024;
    int v49 = 1027;
    __int16 v50 = 1024;
    *(_DWORD *)v51 = v23;
    *(_WORD *)&v51[4] = 2080;
    *(void *)&v51[6] = v24;
    *(_WORD *)&v51[14] = 1024;
    *(_DWORD *)&v51[16] = v25;
    unsigned int v26 = " [%s] %s:%d System audio unit properties: UnitType=%d, micFormat=%s samplesPerFrame=%d";
LABEL_16:
    uint32_t v31 = v22;
    uint32_t v32 = 50;
LABEL_26:
    _os_log_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_DEFAULT, v26, buf, v32);
    return v7;
  }
  uint64_t v15 = [(VCAudioUnitProperties *)v7 frameFormatSpeaker];
  long long v16 = *(_OWORD *)&v43[16];
  long long v17 = *(_OWORD *)v43;
  *(void *)(v15 + 32) = *(void *)&v43[32];
  *(_OWORD *)uint64_t v15 = v17;
  *(_OWORD *)(v15 + 16) = v16;
  unsigned int v18 = [(VCAudioManager *)self computeSamplePerFrameWithPreferredClient:a3 sampleRate:*(double *)v43];
  *(_DWORD *)([(VCAudioUnitProperties *)v7 frameFormatSpeaker] + 40) = v18;
  *(void *)&long long v19 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v59 = v19;
  long long v60 = v19;
  long long v58 = v19;
  *(_OWORD *)__str = v19;
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return v7;
    }
    uint64_t v27 = VRTraceErrorLogLevelToCSTR();
    long long v22 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return v7;
    }
    unsigned int v28 = [(VCAudioUnitProperties *)v7 audioUnitType];
    __int16 v29 = FormatToCStr((uint64_t)[(VCAudioUnitProperties *)v7 frameFormatSpeaker], __str, 0x40uLL);
    int v30 = (int)[(VCAudioUnitProperties *)v7 frameFormatSpeaker][40];
    *(_DWORD *)buf = 136316418;
    uint64_t v45 = v27;
    __int16 v46 = 2080;
    double v47 = "-[VCAudioManager newAudioUnitPropertiesForSystemAudioWithPreferredClient:isInput:]";
    __int16 v48 = 1024;
    int v49 = 1032;
    __int16 v50 = 1024;
    *(_DWORD *)v51 = v28;
    *(_WORD *)&v51[4] = 2080;
    *(void *)&v51[6] = v29;
    *(_WORD *)&v51[14] = 1024;
    *(_DWORD *)&v51[16] = v30;
    unsigned int v26 = " [%s] %s:%d System audio unit properties: UnitType=%d, speakerFormat=%s samplesPerFrame=%d";
    goto LABEL_16;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v20 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
  }
  else {
    uint64_t v20 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v38 = VRTraceErrorLogLevelToCSTR();
    unsigned int v34 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v39 = [(VCAudioUnitProperties *)v7 audioUnitType];
      uint64_t v40 = FormatToCStr((uint64_t)[(VCAudioUnitProperties *)v7 frameFormatSpeaker], __str, 0x40uLL);
      int v41 = (int)[(VCAudioUnitProperties *)v7 frameFormatSpeaker][40];
      *(_DWORD *)buf = 136316930;
      uint64_t v45 = v38;
      __int16 v46 = 2080;
      double v47 = "-[VCAudioManager newAudioUnitPropertiesForSystemAudioWithPreferredClient:isInput:]";
      __int16 v48 = 1024;
      int v49 = 1032;
      __int16 v50 = 2112;
      *(void *)v51 = v20;
      *(_WORD *)&v51[8] = 2048;
      *(void *)&v51[10] = self;
      *(_WORD *)&v51[18] = 1024;
      unsigned int v52 = v39;
      __int16 v53 = 2080;
      uint64_t v54 = v40;
      __int16 v55 = 1024;
      int v56 = v41;
      unsigned int v26 = " [%s] %s:%d %@(%p) System audio unit properties: UnitType=%d, speakerFormat=%s samplesPerFrame=%d";
      goto LABEL_25;
    }
  }
  return v7;
}

- (id)newAudioSessionMediaPropertiesForSystemAudioWithPreferredClient:(id)a3 audioUnitProperties:(id)a4 isInput:(BOOL)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (!a4) {
    return 0;
  }
  BOOL v5 = a5;
  uint64_t v9 = objc_alloc_init(VCAudioSessionMediaProperties);
  int v10 = *(_DWORD *)([a4 frameFormatSpeaker] + 28);
  if (v5) {
    long long v11 = (double *)[a4 frameFormatMic];
  }
  else {
    long long v11 = (double *)[a4 frameFormatSpeaker];
  }
  if (*v11 == 48000) {
    uint64_t v12 = 48000;
  }
  else {
    uint64_t v12 = 24000;
  }
  double IntValueForKey = (double)(int)VCDefaults_GetIntValueForKey(@"forceAudioSampleRate", v12);
  if (v5)
  {
    unsigned int v14 = *(_DWORD *)([a4 frameFormatMic] + 40);
    uint64_t v15 = (double *)[a4 frameFormatMic];
  }
  else
  {
    unsigned int v14 = *(_DWORD *)([a4 frameFormatSpeaker] + 40);
    uint64_t v15 = (double *)[a4 frameFormatSpeaker];
  }
  double v16 = (double)v14 / *v15;
  [(VCAudioSessionMediaProperties *)v9 setPreferredSampleRate:IntValueForKey];
  [(VCAudioSessionMediaProperties *)v9 setPreferredBlockSize:v16];
  -[VCAudioSessionMediaProperties setOperatingMode:](v9, "setOperatingMode:", [a3 operatingMode]);
  *(double *)unsigned int v34 = IntValueForKey;
  v34[1] = 0x296C70636DLL;
  int v35 = 4 * (v10 & 0x7FFFFFF);
  int v36 = 1;
  int v37 = v35;
  int v38 = v10;
  uint64_t v39 = 32;
  [(VCAudioSessionMediaProperties *)v9 setInputFormat:v34];
  *(double *)unsigned int v28 = IntValueForKey;
  v28[1] = 0x296C70636DLL;
  int v29 = 4 * (v10 & 0x7FFFFFF);
  int v30 = 1;
  int v31 = v29;
  int v32 = v10;
  uint64_t v33 = 32;
  [(VCAudioSessionMediaProperties *)v9 setOutputFormat:v28];
  -[VCAudioSessionMediaProperties setProcessId:](v9, "setProcessId:", [a3 clientPid]);
  [(VCAudioSessionMediaProperties *)v9 setSessionActive:1];
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      long long v19 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = [(VCAudioSessionMediaProperties *)v9 description];
        *(_DWORD *)buf = 136315906;
        uint64_t v41 = v18;
        __int16 v42 = 2080;
        uint64_t v43 = "-[VCAudioManager newAudioSessionMediaPropertiesForSystemAudioWithPreferredClient:audioUnitProperties:isInput:]";
        __int16 v44 = 1024;
        int v45 = 1074;
        __int16 v46 = 2112;
        uint64_t v47 = v20;
        uint64_t v21 = " [%s] %s:%d System audio session media properties: %@";
        long long v22 = v19;
        uint32_t v23 = 38;
LABEL_22:
        _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      long long v17 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
    }
    else {
      long long v17 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v24 = VRTraceErrorLogLevelToCSTR();
      int v25 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = [(VCAudioSessionMediaProperties *)v9 description];
        *(_DWORD *)buf = 136316418;
        uint64_t v41 = v24;
        __int16 v42 = 2080;
        uint64_t v43 = "-[VCAudioManager newAudioSessionMediaPropertiesForSystemAudioWithPreferredClient:audioUnitProperties:isInput:]";
        __int16 v44 = 1024;
        int v45 = 1074;
        __int16 v46 = 2112;
        uint64_t v47 = (uint64_t)v17;
        __int16 v48 = 2048;
        int v49 = self;
        __int16 v50 = 2112;
        uint64_t v51 = v26;
        uint64_t v21 = " [%s] %s:%d %@(%p) System audio session media properties: %@";
        long long v22 = v25;
        uint32_t v23 = 58;
        goto LABEL_22;
      }
    }
  }
  return v9;
}

+ (AudioStreamBasicDescription)sessionFormatForSampleRate:(SEL)a3
{
  retstr->double mSampleRate = a4;
  *(_OWORD *)&retstr->mFormatID = xmmword_1E259BB10;
  *(_OWORD *)&retstr->mBytesPerFrame = xmmword_1E259BB20;
  return result;
}

- (id)newAudioSessionMediaPropertiesWithPreferredClient:(id)a3 audioUnitProperties:(id)a4
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_alloc_init(VCAudioSessionMediaProperties);
  if ([a3 isPrewarmingClient] && self->_state >= 2)
  {

    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return self->_currentAudioSessionMediaProperties;
      }
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      uint64_t v15 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return self->_currentAudioSessionMediaProperties;
      }
      currentAudioSessionMediaProperties = self->_currentAudioSessionMediaProperties;
      *(_DWORD *)buf = 136315906;
      uint64_t v61 = v14;
      __int16 v62 = 2080;
      int v63 = "-[VCAudioManager newAudioSessionMediaPropertiesWithPreferredClient:audioUnitProperties:]";
      __int16 v64 = 1024;
      int v65 = 1111;
      __int16 v66 = 2112;
      uint64_t v67 = (uint64_t)currentAudioSessionMediaProperties;
      long long v17 = " [%s] %s:%d Last client is prewarming, ignore its settings. Use _currentAudioSessionMediaProperties=%@";
      uint64_t v18 = v15;
      uint32_t v19 = 38;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        long long v8 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
      }
      else {
        long long v8 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return self->_currentAudioSessionMediaProperties;
      }
      uint64_t v26 = VRTraceErrorLogLevelToCSTR();
      uint64_t v27 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return self->_currentAudioSessionMediaProperties;
      }
      unsigned int v28 = self->_currentAudioSessionMediaProperties;
      *(_DWORD *)buf = 136316418;
      uint64_t v61 = v26;
      __int16 v62 = 2080;
      int v63 = "-[VCAudioManager newAudioSessionMediaPropertiesWithPreferredClient:audioUnitProperties:]";
      __int16 v64 = 1024;
      int v65 = 1111;
      __int16 v66 = 2112;
      uint64_t v67 = (uint64_t)v8;
      __int16 v68 = 2048;
      int v69 = self;
      __int16 v70 = 2112;
      uint64_t v71 = (uint64_t)v28;
      long long v17 = " [%s] %s:%d %@(%p) Last client is prewarming, ignore its settings. Use _currentAudioSessionMediaProperties=%@";
      uint64_t v18 = v27;
      uint32_t v19 = 58;
    }
    _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
    return self->_currentAudioSessionMediaProperties;
  }
  uint64_t v9 = -[VCAudioManager vpOperationModeForConferenceOperatingMode:deviceRole:](self, "vpOperationModeForConferenceOperatingMode:deviceRole:", [a3 operatingMode], objc_msgSend(a3, "deviceRole"));
  id v10 = -[NSDictionary objectForKeyedSubscript:](self->_vpOperatingModeToAudioSessionMediaFormatMapping, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v9]);
  objc_msgSend(v10, "setOperatingMode:", objc_msgSend(a3, "operatingMode"));
  [v10 preferredSampleRate];
  double v12 = v11;
  if (a4 && v11 == 0.0)
  {
    if (*(double *)[a4 frameFormatSpeaker] == 0.0) {
      goto LABEL_32;
    }
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_31;
      }
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      uint64_t v21 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_31;
      }
      uint64_t v22 = *(void *)[a4 frameFormatSpeaker];
      *(_DWORD *)buf = 136315906;
      uint64_t v61 = v20;
      __int16 v62 = 2080;
      int v63 = "-[VCAudioManager newAudioSessionMediaPropertiesWithPreferredClient:audioUnitProperties:]";
      __int16 v64 = 1024;
      int v65 = 1122;
      __int16 v66 = 2048;
      uint64_t v67 = v22;
      uint32_t v23 = " [%s] %s:%d Override sampleRate=%f from audioUnitProperties, due to vpOperatingModeToAudioSessionMediaFormat"
            "Mapping unavailability";
      uint64_t v24 = v21;
      uint32_t v25 = 38;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        long long v13 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
      }
      else {
        long long v13 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_31;
      }
      uint64_t v29 = VRTraceErrorLogLevelToCSTR();
      int v30 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_31;
      }
      uint64_t v31 = *(void *)[a4 frameFormatSpeaker];
      *(_DWORD *)buf = 136316418;
      uint64_t v61 = v29;
      __int16 v62 = 2080;
      int v63 = "-[VCAudioManager newAudioSessionMediaPropertiesWithPreferredClient:audioUnitProperties:]";
      __int16 v64 = 1024;
      int v65 = 1122;
      __int16 v66 = 2112;
      uint64_t v67 = (uint64_t)v13;
      __int16 v68 = 2048;
      int v69 = self;
      __int16 v70 = 2048;
      uint64_t v71 = v31;
      uint32_t v23 = " [%s] %s:%d %@(%p) Override sampleRate=%f from audioUnitProperties, due to vpOperatingModeToAudioSessionMedi"
            "aFormatMapping unavailability";
      uint64_t v24 = v30;
      uint32_t v25 = 58;
    }
    _os_log_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);
LABEL_31:
    double v12 = *(double *)[a4 frameFormatSpeaker];
LABEL_32:
    int v32 = (double *)[a4 frameFormatSpeaker];
    double v33 = 48000.0;
    if (*v32 == 48000.0) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  if (a4) {
    goto LABEL_32;
  }
LABEL_33:
  double v33 = v12;
LABEL_34:
  *(void *)long long v59 = -1;
  *(void *)&long long v34 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v34 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v59[8] = v34;
  *(_OWORD *)&v59[24] = v34;
  +[VCAudioManager sessionFormatForSampleRate:v33];
  [v10 preferredBlockSize];
  float DoubleValueForKey = VCDefaults_GetDoubleValueForKey(@"forceAudioBlockSize", v35);
  if (a4)
  {
    LODWORD(v37) = *(_DWORD *)([a4 frameFormatSpeaker] + 40);
    float v38 = (double)v37 / *(double *)[a4 frameFormatSpeaker];
    if (DoubleValueForKey >= v38 || DoubleValueForKey == 0.0) {
      float DoubleValueForKey = v38;
    }
    [(VCAudioSessionMediaProperties *)v7 setPreferredSampleRate:*(double *)v59];
    [(VCAudioSessionMediaProperties *)v7 setPreferredBlockSize:DoubleValueForKey];
    -[VCAudioSessionMediaProperties setOperatingMode:](v7, "setOperatingMode:", [v10 operatingMode]);
    [(VCAudioSessionMediaProperties *)v7 setVpOperatingMode:v9];
    long long v56 = *(_OWORD *)v59;
    long long v57 = *(_OWORD *)&v59[16];
    uint64_t v58 = *(void *)&v59[32];
    [(VCAudioSessionMediaProperties *)v7 setInputFormat:&v56];
    int v40 = *(_DWORD *)([a4 frameFormatSpeaker] + 28);
  }
  else
  {
    [(VCAudioSessionMediaProperties *)v7 setPreferredSampleRate:*(double *)v59];
    [(VCAudioSessionMediaProperties *)v7 setPreferredBlockSize:DoubleValueForKey];
    -[VCAudioSessionMediaProperties setOperatingMode:](v7, "setOperatingMode:", [v10 operatingMode]);
    [(VCAudioSessionMediaProperties *)v7 setVpOperatingMode:v9];
    long long v56 = *(_OWORD *)v59;
    long long v57 = *(_OWORD *)&v59[16];
    uint64_t v58 = *(void *)&v59[32];
    [(VCAudioSessionMediaProperties *)v7 setInputFormat:&v56];
    int v40 = 1;
  }
  *(_DWORD *)&v59[28] = v40;
  uint64_t v55 = *(void *)&v59[32];
  v54[0] = *(_OWORD *)v59;
  v54[1] = *(_OWORD *)&v59[16];
  [(VCAudioSessionMediaProperties *)v7 setOutputFormat:v54];
  -[VCAudioSessionMediaProperties setProcessId:](v7, "setProcessId:", [a3 clientPid]);
  if (self->_isGKVoiceChat) {
    BOOL v41 = 0;
  }
  else {
    BOOL v41 = !self->_isInDaemon || [a3 deviceRole] != 2;
  }
  [(VCAudioSessionMediaProperties *)v7 setSessionActive:v41];
  BOOL v42 = self->_useOptimizedHandoversForTelephony && [v10 operatingMode] == 3;
  [(VCAudioSessionMediaProperties *)v7 setAudioClockDeviceEnabled:v42];
  -[VCAudioSessionMediaProperties setNetworkUplinkClockUsesBaseband:](v7, "setNetworkUplinkClockUsesBaseband:", [a3 networkUplinkClockUsesBaseband]);
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v44 = VRTraceErrorLogLevelToCSTR();
      int v45 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v46 = [(VCAudioSessionMediaProperties *)v7 description];
        *(_DWORD *)buf = 136315906;
        uint64_t v61 = v44;
        __int16 v62 = 2080;
        int v63 = "-[VCAudioManager newAudioSessionMediaPropertiesWithPreferredClient:audioUnitProperties:]";
        __int16 v64 = 1024;
        int v65 = 1149;
        __int16 v66 = 2112;
        uint64_t v67 = v46;
        uint64_t v47 = " [%s] %s:%d Selected audio session media properties: %@";
        __int16 v48 = v45;
        uint32_t v49 = 38;
LABEL_61:
        _os_log_impl(&dword_1E1EA4000, v48, OS_LOG_TYPE_DEFAULT, v47, buf, v49);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v43 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v43 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v50 = VRTraceErrorLogLevelToCSTR();
      uint64_t v51 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v52 = [(VCAudioSessionMediaProperties *)v7 description];
        *(_DWORD *)buf = 136316418;
        uint64_t v61 = v50;
        __int16 v62 = 2080;
        int v63 = "-[VCAudioManager newAudioSessionMediaPropertiesWithPreferredClient:audioUnitProperties:]";
        __int16 v64 = 1024;
        int v65 = 1149;
        __int16 v66 = 2112;
        uint64_t v67 = (uint64_t)v43;
        __int16 v68 = 2048;
        int v69 = self;
        __int16 v70 = 2112;
        uint64_t v71 = v52;
        uint64_t v47 = " [%s] %s:%d %@(%p) Selected audio session media properties: %@";
        __int16 v48 = v51;
        uint32_t v49 = 58;
        goto LABEL_61;
      }
    }
  }
  return v7;
}

- (AVAudioDevice)currentInputDevice
{
  p_inputDeviceMutex = &self->_inputDeviceMutex;
  pthread_mutex_lock(&self->_inputDeviceMutex);
  BOOL v4 = self->_inputDevice;
  pthread_mutex_unlock(p_inputDeviceMutex);
  return v4;
}

- (void)setCurrentInputDeviceInternal:(id)a3
{
  p_inputDeviceMutex = &self->_inputDeviceMutex;
  pthread_mutex_lock(&self->_inputDeviceMutex);

  self->_inputDevice = (AVAudioDevice *)a3;

  pthread_mutex_unlock(p_inputDeviceMutex);
}

- (void)updateCurrentInputDevice:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__VCAudioManager_updateCurrentInputDevice___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = a3;
  void block[5] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __43__VCAudioManager_updateCurrentInputDevice___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "deviceID"), "unsignedIntValue");
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 40) + 232), "deviceID"), "unsignedIntValue");
  if (v2 != result)
  {
    if (objc_opt_class() == *(void *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return objc_msgSend(*(id *)(a1 + 40), "setCurrentInputDeviceInternal:", *(void *)(a1 + 32), *(_OWORD *)v21, *(void *)&v21[16], v22, *(void *)v23, *(void *)&v23[8], *(void *)&v23[16], v24);
      }
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return objc_msgSend(*(id *)(a1 + 40), "setCurrentInputDeviceInternal:", *(void *)(a1 + 32), *(_OWORD *)v21, *(void *)&v21[16], v22, *(void *)v23, *(void *)&v23[8], *(void *)&v23[16], v24);
      }
      uint64_t v7 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 40) + 232), "deviceName"), "UTF8String");
      int v8 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 40) + 232), "deviceID"), "unsignedIntValue");
      uint64_t v9 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "deviceName"), "UTF8String");
      int v10 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "deviceID"), "unsignedIntValue");
      *(_DWORD *)uint64_t v21 = 136316674;
      *(void *)&v21[4] = v5;
      *(_WORD *)&v21[12] = 2080;
      *(void *)&v21[14] = "-[VCAudioManager updateCurrentInputDevice:]_block_invoke";
      *(_WORD *)&v21[22] = 1024;
      LODWORD(v22) = 1194;
      WORD2(v22) = 2080;
      *(void *)((char *)&v22 + 6) = v7;
      HIWORD(v22) = 1024;
      *(_DWORD *)uint32_t v23 = v8;
      *(_WORD *)&v23[4] = 2080;
      *(void *)&v23[6] = v9;
      *(_WORD *)&v23[14] = 1024;
      *(_DWORD *)&v23[16] = v10;
      double v11 = " [%s] %s:%d Input device changed via default change listener. current input device=%s deviceID=%u new input "
            "device=%s deviceID=%u";
      double v12 = v6;
      uint32_t v13 = 60;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        BOOL v4 = (__CFString *)[*(id *)(a1 + 40) performSelector:sel_logPrefix];
      }
      else {
        BOOL v4 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return objc_msgSend(*(id *)(a1 + 40), "setCurrentInputDeviceInternal:", *(void *)(a1 + 32), *(_OWORD *)v21, *(void *)&v21[16], v22, *(void *)v23, *(void *)&v23[8], *(void *)&v23[16], v24);
      }
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      uint64_t v15 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return objc_msgSend(*(id *)(a1 + 40), "setCurrentInputDeviceInternal:", *(void *)(a1 + 32), *(_OWORD *)v21, *(void *)&v21[16], v22, *(void *)v23, *(void *)&v23[8], *(void *)&v23[16], v24);
      }
      uint64_t v16 = *(void *)(a1 + 40);
      uint64_t v17 = objc_msgSend((id)objc_msgSend(*(id *)(v16 + 232), "deviceName"), "UTF8String");
      int v18 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 40) + 232), "deviceID"), "unsignedIntValue");
      uint64_t v19 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "deviceName"), "UTF8String");
      int v20 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "deviceID"), "unsignedIntValue");
      *(_DWORD *)uint64_t v21 = 136317186;
      *(void *)&v21[4] = v14;
      *(_WORD *)&v21[12] = 2080;
      *(void *)&v21[14] = "-[VCAudioManager updateCurrentInputDevice:]_block_invoke";
      *(_WORD *)&v21[22] = 1024;
      LODWORD(v22) = 1194;
      WORD2(v22) = 2112;
      *(void *)((char *)&v22 + 6) = v4;
      HIWORD(v22) = 2048;
      *(void *)uint32_t v23 = v16;
      *(_WORD *)&v23[8] = 2080;
      *(void *)&v23[10] = v17;
      *(_WORD *)&v23[18] = 1024;
      *(_DWORD *)&v23[20] = v18;
      LOWORD(v24) = 2080;
      *(void *)((char *)&v24 + 2) = v19;
      WORD5(v24) = 1024;
      HIDWORD(v24) = v20;
      double v11 = " [%s] %s:%d %@(%p) Input device changed via default change listener. current input device=%s deviceID=%u new"
            " input device=%s deviceID=%u";
      double v12 = v15;
      uint32_t v13 = 80;
    }
    _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, v21, v13);
    return objc_msgSend(*(id *)(a1 + 40), "setCurrentInputDeviceInternal:", *(void *)(a1 + 32), *(_OWORD *)v21, *(void *)&v21[16], v22, *(void *)v23, *(void *)&v23[8], *(void *)&v23[16], v24);
  }
  return result;
}

- (void)setCurrentInputDevice:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__VCAudioManager_setCurrentInputDevice___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a3;
  dispatch_async(dispatchQueue, block);
}

void __40__VCAudioManager_setCurrentInputDevice___block_invoke(uint64_t a1)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 256))
  {
    int v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "deviceID"), "unsignedIntValue");
    if (v3 == objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 232), "deviceID"), "unsignedIntValue"))return; {
    if (objc_opt_class() == *(void *)(a1 + 32))
    }
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v23 = VRTraceErrorLogLevelToCSTR();
        long long v24 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v25 = [*(id *)(a1 + 40) description];
          uint64_t v26 = [*(id *)(*(void *)(a1 + 32) + 232) description];
          *(_DWORD *)long long v56 = 136316162;
          *(void *)&v56[4] = v23;
          *(_WORD *)&v56[12] = 2080;
          *(void *)&v56[14] = "-[VCAudioManager setCurrentInputDevice:]_block_invoke";
          *(_WORD *)&v56[22] = 1024;
          LODWORD(v57) = 1207;
          WORD2(v57) = 2112;
          *(void *)((char *)&v57 + 6) = v25;
          HIWORD(v57) = 2112;
          *(void *)uint64_t v58 = v26;
          uint64_t v27 = " [%s] %s:%d Setting input device=%@, previous input device=%@";
          unsigned int v28 = v24;
          uint32_t v29 = 48;
LABEL_24:
          _os_log_impl(&dword_1E1EA4000, v28, OS_LOG_TYPE_DEFAULT, v27, v56, v29);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        BOOL v4 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        BOOL v4 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v30 = VRTraceErrorLogLevelToCSTR();
        uint64_t v31 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v32 = *(void *)(a1 + 32);
          uint64_t v33 = [*(id *)(a1 + 40) description];
          uint64_t v34 = [*(id *)(*(void *)(a1 + 32) + 232) description];
          *(_DWORD *)long long v56 = 136316674;
          *(void *)&v56[4] = v30;
          *(_WORD *)&v56[12] = 2080;
          *(void *)&v56[14] = "-[VCAudioManager setCurrentInputDevice:]_block_invoke";
          *(_WORD *)&v56[22] = 1024;
          LODWORD(v57) = 1207;
          WORD2(v57) = 2112;
          *(void *)((char *)&v57 + 6) = v4;
          HIWORD(v57) = 2048;
          *(void *)uint64_t v58 = v32;
          *(_WORD *)&v58[8] = 2112;
          *(void *)&v58[10] = v33;
          *(_WORD *)&v58[18] = 2112;
          *(void *)&v58[20] = v34;
          uint64_t v27 = " [%s] %s:%d %@(%p) Setting input device=%@, previous input device=%@";
          unsigned int v28 = v31;
          uint32_t v29 = 68;
          goto LABEL_24;
        }
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "setCurrentInputDeviceInternal:", *(void *)(a1 + 40), *(_OWORD *)v56, *(void *)&v56[16], v57, *(void *)v58, *(_OWORD *)&v58[8], *(void *)&v58[24]);
    uint64_t v35 = *(void *)(a1 + 32);
    if (*(_DWORD *)(v35 + 184) != 3) {
      return;
    }
    [(id)v35 setupIODevicesForAUIO:*(void *)(v35 + 168)];
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
        return;
      }
      uint64_t v37 = VRTraceErrorLogLevelToCSTR();
      float v38 = *MEMORY[0x1E4F47A50];
      uint64_t v39 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v40 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 232), "deviceName"), "UTF8String");
          int v41 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 232), "deviceID"), "unsignedIntegerValue");
          *(_DWORD *)long long v56 = 136316162;
          *(void *)&v56[4] = v37;
          *(_WORD *)&v56[12] = 2080;
          *(void *)&v56[14] = "-[VCAudioManager setCurrentInputDevice:]_block_invoke";
          *(_WORD *)&v56[22] = 1024;
          LODWORD(v57) = 1211;
          WORD2(v57) = 2080;
          *(void *)((char *)&v57 + 6) = v40;
          HIWORD(v57) = 1024;
          *(_DWORD *)uint64_t v58 = v41;
          double v12 = " [%s] %s:%d Input device change completed. New device=%s deviceID=%u";
          uint32_t v13 = v38;
          uint32_t v14 = 44;
          goto LABEL_16;
        }
        return;
      }
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
        return;
      }
      uint64_t v54 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 232), "deviceName"), "UTF8String");
      int v55 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 232), "deviceID"), "unsignedIntegerValue");
      *(_DWORD *)long long v56 = 136316162;
      *(void *)&v56[4] = v37;
      *(_WORD *)&v56[12] = 2080;
      *(void *)&v56[14] = "-[VCAudioManager setCurrentInputDevice:]_block_invoke";
      *(_WORD *)&v56[22] = 1024;
      LODWORD(v57) = 1211;
      WORD2(v57) = 2080;
      *(void *)((char *)&v57 + 6) = v54;
      HIWORD(v57) = 1024;
      *(_DWORD *)uint64_t v58 = v55;
      uint64_t v51 = " [%s] %s:%d Input device change completed. New device=%s deviceID=%u";
      uint64_t v52 = v38;
      uint32_t v53 = 44;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v36 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        int v36 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
        return;
      }
      uint64_t v42 = VRTraceErrorLogLevelToCSTR();
      uint64_t v43 = *MEMORY[0x1E4F47A50];
      uint64_t v44 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v45 = *(void *)(a1 + 32);
          uint64_t v46 = objc_msgSend((id)objc_msgSend(*(id *)(v45 + 232), "deviceName"), "UTF8String");
          int v47 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 232), "deviceID"), "unsignedIntegerValue");
          *(_DWORD *)long long v56 = 136316674;
          *(void *)&v56[4] = v42;
          *(_WORD *)&v56[12] = 2080;
          *(void *)&v56[14] = "-[VCAudioManager setCurrentInputDevice:]_block_invoke";
          *(_WORD *)&v56[22] = 1024;
          LODWORD(v57) = 1211;
          WORD2(v57) = 2112;
          *(void *)((char *)&v57 + 6) = v36;
          HIWORD(v57) = 2048;
          *(void *)uint64_t v58 = v45;
          *(_WORD *)&v58[8] = 2080;
          *(void *)&v58[10] = v46;
          *(_WORD *)&v58[18] = 1024;
          *(_DWORD *)&v58[20] = v47;
          double v12 = " [%s] %s:%d %@(%p) Input device change completed. New device=%s deviceID=%u";
          uint32_t v13 = v43;
          uint32_t v14 = 64;
          goto LABEL_16;
        }
        return;
      }
      if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
        return;
      }
      uint64_t v48 = *(void *)(a1 + 32);
      uint64_t v49 = objc_msgSend((id)objc_msgSend(*(id *)(v48 + 232), "deviceName"), "UTF8String");
      int v50 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 232), "deviceID"), "unsignedIntegerValue");
      *(_DWORD *)long long v56 = 136316674;
      *(void *)&v56[4] = v42;
      *(_WORD *)&v56[12] = 2080;
      *(void *)&v56[14] = "-[VCAudioManager setCurrentInputDevice:]_block_invoke";
      *(_WORD *)&v56[22] = 1024;
      LODWORD(v57) = 1211;
      WORD2(v57) = 2112;
      *(void *)((char *)&v57 + 6) = v36;
      HIWORD(v57) = 2048;
      *(void *)uint64_t v58 = v48;
      *(_WORD *)&v58[8] = 2080;
      *(void *)&v58[10] = v49;
      *(_WORD *)&v58[18] = 1024;
      *(_DWORD *)&v58[20] = v50;
      uint64_t v51 = " [%s] %s:%d %@(%p) Input device change completed. New device=%s deviceID=%u";
      uint64_t v52 = v43;
      uint32_t v53 = 64;
    }
    _os_log_debug_impl(&dword_1E1EA4000, v52, OS_LOG_TYPE_DEBUG, v51, v56, v53);
    return;
  }
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v7 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "deviceID"), "unsignedIntValue");
        uint64_t v8 = *(void *)(a1 + 32);
        int v9 = *(unsigned __int8 *)(v8 + 256);
        uint64_t v10 = objc_msgSend((id)objc_msgSend(*(id *)(v8 + 232), "deviceName"), "UTF8String");
        int v11 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 232), "deviceID"), "unsignedIntegerValue");
        *(_DWORD *)long long v56 = 136316674;
        *(void *)&v56[4] = v5;
        *(_WORD *)&v56[12] = 2080;
        *(void *)&v56[14] = "-[VCAudioManager setCurrentInputDevice:]_block_invoke";
        *(_WORD *)&v56[22] = 1024;
        LODWORD(v57) = 1203;
        WORD2(v57) = 1024;
        *(_DWORD *)((char *)&v57 + 6) = v7;
        WORD5(v57) = 1024;
        HIDWORD(v57) = v9;
        *(_WORD *)uint64_t v58 = 2080;
        *(void *)&v58[2] = v10;
        *(_WORD *)&v58[10] = 1024;
        *(_DWORD *)&v58[12] = v11;
        double v12 = " [%s] %s:%d Ignoring attempt to set newInputDevice=%u since _followSystemInput=%d. Current inputDevice=%s deviceID=%u";
        uint32_t v13 = v6;
        uint32_t v14 = 56;
LABEL_16:
        _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, v56, v14);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      int v2 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      int v2 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      uint64_t v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = *(void *)(a1 + 32);
        int v18 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "deviceID"), "unsignedIntValue");
        uint64_t v19 = *(void *)(a1 + 32);
        int v20 = *(unsigned __int8 *)(v19 + 256);
        uint64_t v21 = objc_msgSend((id)objc_msgSend(*(id *)(v19 + 232), "deviceName"), "UTF8String");
        int v22 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 232), "deviceID"), "unsignedIntegerValue");
        *(_DWORD *)long long v56 = 136317186;
        *(void *)&v56[4] = v15;
        *(_WORD *)&v56[12] = 2080;
        *(void *)&v56[14] = "-[VCAudioManager setCurrentInputDevice:]_block_invoke";
        *(_WORD *)&v56[22] = 1024;
        LODWORD(v57) = 1203;
        WORD2(v57) = 2112;
        *(void *)((char *)&v57 + 6) = v2;
        HIWORD(v57) = 2048;
        *(void *)uint64_t v58 = v17;
        *(_WORD *)&v58[8] = 1024;
        *(_DWORD *)&v58[10] = v18;
        *(_WORD *)&v58[14] = 1024;
        *(_DWORD *)&v58[16] = v20;
        *(_WORD *)&v58[20] = 2080;
        *(void *)&v58[22] = v21;
        *(_WORD *)&v58[30] = 1024;
        int v59 = v22;
        double v12 = " [%s] %s:%d %@(%p) Ignoring attempt to set newInputDevice=%u since _followSystemInput=%d. Current inputDev"
              "ice=%s deviceID=%u";
        uint32_t v13 = v16;
        uint32_t v14 = 76;
        goto LABEL_16;
      }
    }
  }
}

- (AVAudioDevice)currentOutputDevice
{
  p_outputDeviceMutex = &self->_outputDeviceMutex;
  pthread_mutex_lock(&self->_outputDeviceMutex);
  BOOL v4 = self->_outputDevice;
  pthread_mutex_unlock(p_outputDeviceMutex);
  return v4;
}

- (void)setCurrentOutputDeviceInternal:(id)a3
{
  p_outputDeviceMutex = &self->_outputDeviceMutex;
  pthread_mutex_lock(&self->_outputDeviceMutex);

  self->_outputDevice = (AVAudioDevice *)a3;

  pthread_mutex_unlock(p_outputDeviceMutex);
}

- (void)setCurrentOutputDevice:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__VCAudioManager_setCurrentOutputDevice___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a3;
  dispatch_async(dispatchQueue, block);
}

void __41__VCAudioManager_setCurrentOutputDevice___block_invoke(uint64_t a1)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 257))
  {
    int v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "deviceID"), "unsignedIntValue");
    if (v3 == objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 240), "deviceID"), "unsignedIntValue"))return; {
    if (objc_opt_class() == *(void *)(a1 + 32))
    }
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v23 = VRTraceErrorLogLevelToCSTR();
        long long v24 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v25 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "deviceID"), "unsignedIntValue");
          int v26 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 240), "deviceID"), "unsignedIntValue");
          *(_DWORD *)long long v56 = 136316162;
          *(void *)&v56[4] = v23;
          *(_WORD *)&v56[12] = 2080;
          *(void *)&v56[14] = "-[VCAudioManager setCurrentOutputDevice:]_block_invoke";
          *(_WORD *)&v56[22] = 1024;
          LODWORD(v57) = 1240;
          WORD2(v57) = 1024;
          *(_DWORD *)((char *)&v57 + 6) = v25;
          WORD5(v57) = 1024;
          HIDWORD(v57) = v26;
          uint64_t v27 = " [%s] %s:%d Setting output deviceID=%u, previous output deviceID=%u";
          unsigned int v28 = v24;
          uint32_t v29 = 40;
LABEL_24:
          _os_log_impl(&dword_1E1EA4000, v28, OS_LOG_TYPE_DEFAULT, v27, v56, v29);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        BOOL v4 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        BOOL v4 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v30 = VRTraceErrorLogLevelToCSTR();
        uint64_t v31 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v32 = *(void *)(a1 + 32);
          int v33 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "deviceID"), "unsignedIntValue");
          int v34 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 240), "deviceID"), "unsignedIntValue");
          *(_DWORD *)long long v56 = 136316674;
          *(void *)&v56[4] = v30;
          *(_WORD *)&v56[12] = 2080;
          *(void *)&v56[14] = "-[VCAudioManager setCurrentOutputDevice:]_block_invoke";
          *(_WORD *)&v56[22] = 1024;
          LODWORD(v57) = 1240;
          WORD2(v57) = 2112;
          *(void *)((char *)&v57 + 6) = v4;
          HIWORD(v57) = 2048;
          *(void *)uint64_t v58 = v32;
          *(_WORD *)&v58[8] = 1024;
          *(_DWORD *)&v58[10] = v33;
          *(_WORD *)&v58[14] = 1024;
          *(_DWORD *)&v58[16] = v34;
          uint64_t v27 = " [%s] %s:%d %@(%p) Setting output deviceID=%u, previous output deviceID=%u";
          unsigned int v28 = v31;
          uint32_t v29 = 60;
          goto LABEL_24;
        }
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "setCurrentOutputDeviceInternal:", *(void *)(a1 + 40), *(_OWORD *)v56, *(void *)&v56[16], v57, *(void *)v58, *(_OWORD *)&v58[8]);
    uint64_t v35 = *(void *)(a1 + 32);
    if (*(_DWORD *)(v35 + 184) != 3) {
      return;
    }
    [(id)v35 setupIODevicesForAUIO:*(void *)(v35 + 168)];
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
        return;
      }
      uint64_t v37 = VRTraceErrorLogLevelToCSTR();
      float v38 = *MEMORY[0x1E4F47A50];
      uint64_t v39 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v40 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 240), "deviceName"), "UTF8String");
          int v41 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 240), "deviceID"), "unsignedIntegerValue");
          *(_DWORD *)long long v56 = 136316162;
          *(void *)&v56[4] = v37;
          *(_WORD *)&v56[12] = 2080;
          *(void *)&v56[14] = "-[VCAudioManager setCurrentOutputDevice:]_block_invoke";
          *(_WORD *)&v56[22] = 1024;
          LODWORD(v57) = 1244;
          WORD2(v57) = 2080;
          *(void *)((char *)&v57 + 6) = v40;
          HIWORD(v57) = 1024;
          *(_DWORD *)uint64_t v58 = v41;
          double v12 = " [%s] %s:%d Output device change completed. New device=%s deviceID=%u";
          uint32_t v13 = v38;
          uint32_t v14 = 44;
          goto LABEL_16;
        }
        return;
      }
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
        return;
      }
      uint64_t v54 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 240), "deviceName"), "UTF8String");
      int v55 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 240), "deviceID"), "unsignedIntegerValue");
      *(_DWORD *)long long v56 = 136316162;
      *(void *)&v56[4] = v37;
      *(_WORD *)&v56[12] = 2080;
      *(void *)&v56[14] = "-[VCAudioManager setCurrentOutputDevice:]_block_invoke";
      *(_WORD *)&v56[22] = 1024;
      LODWORD(v57) = 1244;
      WORD2(v57) = 2080;
      *(void *)((char *)&v57 + 6) = v54;
      HIWORD(v57) = 1024;
      *(_DWORD *)uint64_t v58 = v55;
      uint64_t v51 = " [%s] %s:%d Output device change completed. New device=%s deviceID=%u";
      uint64_t v52 = v38;
      uint32_t v53 = 44;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v36 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        int v36 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
        return;
      }
      uint64_t v42 = VRTraceErrorLogLevelToCSTR();
      uint64_t v43 = *MEMORY[0x1E4F47A50];
      uint64_t v44 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v45 = *(void *)(a1 + 32);
          uint64_t v46 = objc_msgSend((id)objc_msgSend(*(id *)(v45 + 240), "deviceName"), "UTF8String");
          int v47 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 240), "deviceID"), "unsignedIntegerValue");
          *(_DWORD *)long long v56 = 136316674;
          *(void *)&v56[4] = v42;
          *(_WORD *)&v56[12] = 2080;
          *(void *)&v56[14] = "-[VCAudioManager setCurrentOutputDevice:]_block_invoke";
          *(_WORD *)&v56[22] = 1024;
          LODWORD(v57) = 1244;
          WORD2(v57) = 2112;
          *(void *)((char *)&v57 + 6) = v36;
          HIWORD(v57) = 2048;
          *(void *)uint64_t v58 = v45;
          *(_WORD *)&v58[8] = 2080;
          *(void *)&v58[10] = v46;
          *(_WORD *)&v58[18] = 1024;
          *(_DWORD *)&v58[20] = v47;
          double v12 = " [%s] %s:%d %@(%p) Output device change completed. New device=%s deviceID=%u";
          uint32_t v13 = v43;
          uint32_t v14 = 64;
          goto LABEL_16;
        }
        return;
      }
      if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
        return;
      }
      uint64_t v48 = *(void *)(a1 + 32);
      uint64_t v49 = objc_msgSend((id)objc_msgSend(*(id *)(v48 + 240), "deviceName"), "UTF8String");
      int v50 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 240), "deviceID"), "unsignedIntegerValue");
      *(_DWORD *)long long v56 = 136316674;
      *(void *)&v56[4] = v42;
      *(_WORD *)&v56[12] = 2080;
      *(void *)&v56[14] = "-[VCAudioManager setCurrentOutputDevice:]_block_invoke";
      *(_WORD *)&v56[22] = 1024;
      LODWORD(v57) = 1244;
      WORD2(v57) = 2112;
      *(void *)((char *)&v57 + 6) = v36;
      HIWORD(v57) = 2048;
      *(void *)uint64_t v58 = v48;
      *(_WORD *)&v58[8] = 2080;
      *(void *)&v58[10] = v49;
      *(_WORD *)&v58[18] = 1024;
      *(_DWORD *)&v58[20] = v50;
      uint64_t v51 = " [%s] %s:%d %@(%p) Output device change completed. New device=%s deviceID=%u";
      uint64_t v52 = v43;
      uint32_t v53 = 64;
    }
    _os_log_debug_impl(&dword_1E1EA4000, v52, OS_LOG_TYPE_DEBUG, v51, v56, v53);
    return;
  }
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v7 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "deviceID"), "unsignedIntValue");
        uint64_t v8 = *(void *)(a1 + 32);
        int v9 = *(unsigned __int8 *)(v8 + 257);
        uint64_t v10 = objc_msgSend((id)objc_msgSend(*(id *)(v8 + 240), "deviceName"), "UTF8String");
        int v11 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 240), "deviceID"), "unsignedIntegerValue");
        *(_DWORD *)long long v56 = 136316674;
        *(void *)&v56[4] = v5;
        *(_WORD *)&v56[12] = 2080;
        *(void *)&v56[14] = "-[VCAudioManager setCurrentOutputDevice:]_block_invoke";
        *(_WORD *)&v56[22] = 1024;
        LODWORD(v57) = 1236;
        WORD2(v57) = 1024;
        *(_DWORD *)((char *)&v57 + 6) = v7;
        WORD5(v57) = 1024;
        HIDWORD(v57) = v9;
        *(_WORD *)uint64_t v58 = 2080;
        *(void *)&v58[2] = v10;
        *(_WORD *)&v58[10] = 1024;
        *(_DWORD *)&v58[12] = v11;
        double v12 = " [%s] %s:%d Ignoring attempt to set newOutputDevice=%u since _followSystemOutput=%d. Current outputDevice=%s deviceID=%u";
        uint32_t v13 = v6;
        uint32_t v14 = 56;
LABEL_16:
        _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, v56, v14);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      int v2 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      int v2 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      uint64_t v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = *(void *)(a1 + 32);
        int v18 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "deviceID"), "unsignedIntValue");
        uint64_t v19 = *(void *)(a1 + 32);
        int v20 = *(unsigned __int8 *)(v19 + 257);
        uint64_t v21 = objc_msgSend((id)objc_msgSend(*(id *)(v19 + 240), "deviceName"), "UTF8String");
        int v22 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 240), "deviceID"), "unsignedIntegerValue");
        *(_DWORD *)long long v56 = 136317186;
        *(void *)&v56[4] = v15;
        *(_WORD *)&v56[12] = 2080;
        *(void *)&v56[14] = "-[VCAudioManager setCurrentOutputDevice:]_block_invoke";
        *(_WORD *)&v56[22] = 1024;
        LODWORD(v57) = 1236;
        WORD2(v57) = 2112;
        *(void *)((char *)&v57 + 6) = v2;
        HIWORD(v57) = 2048;
        *(void *)uint64_t v58 = v17;
        *(_WORD *)&v58[8] = 1024;
        *(_DWORD *)&v58[10] = v18;
        *(_WORD *)&v58[14] = 1024;
        *(_DWORD *)&v58[16] = v20;
        *(_WORD *)&v58[20] = 2080;
        *(void *)&v58[22] = v21;
        __int16 v59 = 1024;
        int v60 = v22;
        double v12 = " [%s] %s:%d %@(%p) Ignoring attempt to set newOutputDevice=%u since _followSystemOutput=%d. Current output"
              "Device=%s deviceID=%u";
        uint32_t v13 = v16;
        uint32_t v14 = 76;
        goto LABEL_16;
      }
    }
  }
}

- (void)updateCurrentOutputDevice:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__VCAudioManager_updateCurrentOutputDevice___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = a3;
  void block[5] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __44__VCAudioManager_updateCurrentOutputDevice___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "deviceID"), "unsignedIntValue");
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 40) + 240), "deviceID"), "unsignedIntValue");
  if (v2 != result)
  {
    if (objc_opt_class() == *(void *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return objc_msgSend(*(id *)(a1 + 40), "setCurrentOutputDeviceInternal:", *(void *)(a1 + 32), *(_OWORD *)v21, *(void *)&v21[16], v22, *(void *)v23, *(void *)&v23[8], *(void *)&v23[16], v24);
      }
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return objc_msgSend(*(id *)(a1 + 40), "setCurrentOutputDeviceInternal:", *(void *)(a1 + 32), *(_OWORD *)v21, *(void *)&v21[16], v22, *(void *)v23, *(void *)&v23[8], *(void *)&v23[16], v24);
      }
      uint64_t v7 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 40) + 240), "deviceName"), "UTF8String");
      int v8 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 40) + 240), "deviceID"), "unsignedIntValue");
      uint64_t v9 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "deviceName"), "UTF8String");
      int v10 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "deviceID"), "unsignedIntValue");
      *(_DWORD *)uint64_t v21 = 136316674;
      *(void *)&v21[4] = v5;
      *(_WORD *)&v21[12] = 2080;
      *(void *)&v21[14] = "-[VCAudioManager updateCurrentOutputDevice:]_block_invoke";
      *(_WORD *)&v21[22] = 1024;
      LODWORD(v22) = 1253;
      WORD2(v22) = 2080;
      *(void *)((char *)&v22 + 6) = v7;
      HIWORD(v22) = 1024;
      *(_DWORD *)uint64_t v23 = v8;
      *(_WORD *)&v23[4] = 2080;
      *(void *)&v23[6] = v9;
      *(_WORD *)&v23[14] = 1024;
      *(_DWORD *)&v23[16] = v10;
      int v11 = " [%s] %s:%d Output device changed via default change listener. current output device=%s deviceID=%u new outp"
            "ut device=%s deviceID=%u";
      double v12 = v6;
      uint32_t v13 = 60;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        BOOL v4 = (__CFString *)[*(id *)(a1 + 40) performSelector:sel_logPrefix];
      }
      else {
        BOOL v4 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return objc_msgSend(*(id *)(a1 + 40), "setCurrentOutputDeviceInternal:", *(void *)(a1 + 32), *(_OWORD *)v21, *(void *)&v21[16], v22, *(void *)v23, *(void *)&v23[8], *(void *)&v23[16], v24);
      }
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      uint64_t v15 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return objc_msgSend(*(id *)(a1 + 40), "setCurrentOutputDeviceInternal:", *(void *)(a1 + 32), *(_OWORD *)v21, *(void *)&v21[16], v22, *(void *)v23, *(void *)&v23[8], *(void *)&v23[16], v24);
      }
      uint64_t v16 = *(void *)(a1 + 40);
      uint64_t v17 = objc_msgSend((id)objc_msgSend(*(id *)(v16 + 240), "deviceName"), "UTF8String");
      int v18 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 40) + 240), "deviceID"), "unsignedIntValue");
      uint64_t v19 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "deviceName"), "UTF8String");
      int v20 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "deviceID"), "unsignedIntValue");
      *(_DWORD *)uint64_t v21 = 136317186;
      *(void *)&v21[4] = v14;
      *(_WORD *)&v21[12] = 2080;
      *(void *)&v21[14] = "-[VCAudioManager updateCurrentOutputDevice:]_block_invoke";
      *(_WORD *)&v21[22] = 1024;
      LODWORD(v22) = 1253;
      WORD2(v22) = 2112;
      *(void *)((char *)&v22 + 6) = v4;
      HIWORD(v22) = 2048;
      *(void *)uint64_t v23 = v16;
      *(_WORD *)&v23[8] = 2080;
      *(void *)&v23[10] = v17;
      *(_WORD *)&v23[18] = 1024;
      *(_DWORD *)&v23[20] = v18;
      LOWORD(v24) = 2080;
      *(void *)((char *)&v24 + 2) = v19;
      WORD5(v24) = 1024;
      HIDWORD(v24) = v20;
      int v11 = " [%s] %s:%d %@(%p) Output device changed via default change listener. current output device=%s deviceID=%u n"
            "ew output device=%s deviceID=%u";
      double v12 = v15;
      uint32_t v13 = 80;
    }
    _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, v21, v13);
    return objc_msgSend(*(id *)(a1 + 40), "setCurrentOutputDeviceInternal:", *(void *)(a1 + 32), *(_OWORD *)v21, *(void *)&v21[16], v22, *(void *)v23, *(void *)&v23[8], *(void *)&v23[16], v24);
  }
  return result;
}

- (void)setMediaPlaybackOnExternalDevice:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__VCAudioManager_setMediaPlaybackOnExternalDevice___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, block);
}

uint64_t __51__VCAudioManager_setMediaPlaybackOnExternalDevice___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 960) = *(unsigned char *)(a1 + 40);
  return AUIOSetMediaPlaybackOnExternalDevice(*(void *)(*(void *)(a1 + 32) + 168), *(unsigned __int8 *)(*(void *)(a1 + 32) + 960));
}

- (BOOL)startAUIOWithProperties:(id)a3
{
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  if (self->_hAUIO == (tagHANDLE *)0xFFFFFFFFLL)
  {
    uint64_t v6 = objc_alloc_init(SnapshotTimer);
    [(SnapshotTimer *)v6 checkinWithTimeout:@"startAudioIO" forTask:5.0];
    v97 = v6;
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        double v12 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v13 = [a3 audioSessionId];
          int v14 = [a3 operatingMode];
          int v15 = [a3 deviceRole];
          uint64_t v16 = FourccToCStr([a3 remoteCodecType]);
          [a3 remoteCodecSampleRate];
          BOOL isMicrophoneMuted = self->_isMicrophoneMuted;
          *(_DWORD *)buf = 136317186;
          uint64_t v112 = v11;
          __int16 v113 = 2080;
          v114 = "-[VCAudioManager startAUIOWithProperties:]";
          __int16 v115 = 1024;
          int v116 = 1315;
          __int16 v117 = 1024;
          *(_DWORD *)v118 = v13;
          *(_WORD *)&v118[4] = 1024;
          *(_DWORD *)&v118[6] = v14;
          LOWORD(v119) = 1024;
          *(_DWORD *)((char *)&v119 + 2) = v15;
          WORD3(v119) = 2080;
          *((void *)&v119 + 1) = v16;
          *(_WORD *)v120 = 2048;
          *(void *)&v120[2] = v18;
          __int16 v121 = 1024;
          LODWORD(v122) = isMicrophoneMuted;
          uint64_t v19 = " [%s] %s:%d CMSession:[%u] Starting AUIO operatingMode[%d] deviceRole[%d] remoteCodecType[%s] remoteCode"
                "cRate[%f] isMicrophoneMuted[%d]";
          int v20 = v12;
          uint32_t v21 = 72;
LABEL_23:
          _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v7 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v22 = VRTraceErrorLogLevelToCSTR();
        uint64_t v23 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v24 = [a3 audioSessionId];
          int v25 = [a3 operatingMode];
          int v26 = [a3 deviceRole];
          uint64_t v27 = FourccToCStr([a3 remoteCodecType]);
          [a3 remoteCodecSampleRate];
          BOOL v28 = self->_isMicrophoneMuted;
          *(_DWORD *)buf = 136317698;
          uint64_t v112 = v22;
          __int16 v113 = 2080;
          v114 = "-[VCAudioManager startAUIOWithProperties:]";
          __int16 v115 = 1024;
          int v116 = 1315;
          __int16 v117 = 2112;
          *(void *)v118 = v7;
          *(_WORD *)&v118[8] = 2048;
          *(void *)&long long v119 = self;
          WORD4(v119) = 1024;
          *(_DWORD *)((char *)&v119 + 10) = v24;
          HIWORD(v119) = 1024;
          *(_DWORD *)v120 = v25;
          *(_WORD *)&v120[4] = 1024;
          *(_DWORD *)&v120[6] = v26;
          __int16 v121 = 2080;
          v122 = v27;
          __int16 v123 = 2048;
          uint64_t v124 = v29;
          __int16 v125 = 1024;
          BOOL v126 = v28;
          uint64_t v19 = " [%s] %s:%d %@(%p) CMSession:[%u] Starting AUIO operatingMode[%d] deviceRole[%d] remoteCodecType[%s] rem"
                "oteCodecRate[%f] isMicrophoneMuted[%d]";
          int v20 = v23;
          uint32_t v21 = 92;
          goto LABEL_23;
        }
      }
    }
    [(VCAudioManager *)self startVADWithAudioUnitProperties:a3];
    uint64_t v101 = 0xFFFFFFFFLL;
    if (self->_isGKVoiceChat)
    {
      int v96 = 0;
      self->_sourceData.audioLimiter = 0;
      goto LABEL_28;
    }
    if (self->_playbackMode)
    {
      int v96 = 0;
      goto LABEL_28;
    }
    v80 = (opaqueVCAudioLimiter *)VCAudioLimiter_Allocate((long long *)[a3 frameFormatMic]);
    self->_sourceData.audioLimiter = v80;
    if (v80)
    {
      if (VCAudioLimiter_Start((uint64_t)v80))
      {
        int v96 = 1;
LABEL_28:
        unsigned int audioSessionId = self->_sourceData.audioSessionId;
        if (audioSessionId == [a3 audioSessionId]) {
          goto LABEL_40;
        }
        if ((VCAudioManager *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v32 = VRTraceErrorLogLevelToCSTR();
            int v33 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              int v34 = [a3 audioSessionId];
              unsigned int v35 = self->_sourceData.audioSessionId;
              *(_DWORD *)buf = 136316162;
              uint64_t v112 = v32;
              __int16 v113 = 2080;
              v114 = "-[VCAudioManager startAUIOWithProperties:]";
              __int16 v115 = 1024;
              int v116 = 1331;
              __int16 v117 = 1024;
              *(_DWORD *)v118 = v34;
              *(_WORD *)&v118[4] = 1024;
              *(_DWORD *)&v118[6] = v35;
              int v36 = " [%s] %s:%d New active audioSessionId=%u previousAudioSessionID=%u";
              uint64_t v37 = v33;
              uint32_t v38 = 40;
LABEL_39:
              _os_log_impl(&dword_1E1EA4000, v37, OS_LOG_TYPE_DEFAULT, v36, buf, v38);
            }
          }
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            uint64_t v31 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
          }
          else {
            uint64_t v31 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v39 = VRTraceErrorLogLevelToCSTR();
            uint64_t v40 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              int v41 = [a3 audioSessionId];
              unsigned int v42 = self->_sourceData.audioSessionId;
              *(_DWORD *)buf = 136316674;
              uint64_t v112 = v39;
              __int16 v113 = 2080;
              v114 = "-[VCAudioManager startAUIOWithProperties:]";
              __int16 v115 = 1024;
              int v116 = 1331;
              __int16 v117 = 2112;
              *(void *)v118 = v31;
              *(_WORD *)&v118[8] = 2048;
              *(void *)&long long v119 = self;
              WORD4(v119) = 1024;
              *(_DWORD *)((char *)&v119 + 10) = v41;
              HIWORD(v119) = 1024;
              *(_DWORD *)v120 = v42;
              int v36 = " [%s] %s:%d %@(%p) New active audioSessionId=%u previousAudioSessionID=%u";
              uint64_t v37 = v40;
              uint32_t v38 = 60;
              goto LABEL_39;
            }
          }
        }
LABEL_40:
        unsigned int v43 = [a3 audioSessionId];
        self->_sourceData.unsigned int audioSessionId = v43;
        self->_sinkData.unsigned int audioSessionId = v43;
        memset(&v100[3], 170, 48);
        long long v99 = xmmword_1E259BB70;
        memset(v100, 170, 48);
        v98[0] = xmmword_1E259BB30;
        memset(&v98[1], 170, 48);
        uint64_t v44 = (_OWORD *)[a3 frameFormatSpeaker];
        long long v46 = v44[1];
        long long v45 = v44[2];
        v98[0] = *v44;
        v98[1] = v46;
        v98[2] = v45;
        *(void *)&v98[3] = &self->_sourceData;
        *((void *)&v98[3] + 1) = VCAudioManager_PullAudioSamples;
        int v47 = (long long *)[a3 frameFormatMic];
        long long v49 = v47[1];
        long long v48 = v47[2];
        long long v99 = *v47;
        v100[0] = v49;
        v100[1] = v48;
        *(void *)&v100[2] = &self->_sinkData;
        *((void *)&v100[2] + 1) = VCAudioManager_PushAudioSamples;
        *(void *)&v100[3] = VCAudioManager_ErrorProc;
        BYTE8(v100[3]) = !self->_isGKVoiceChat;
        BYTE9(v100[3]) = [a3 audioUnitType] == 2;
        unsigned __int8 v50 = +[VCAudioManager audioIOTypeWithAudioUnitProperties:a3 shouldEnableAudioInput:self->_playbackMode != 1];
        audioSession = self->_audioSession;
        BYTE10(v100[3]) = v50;
        *(void *)&v100[4] = audioSession;
        *((void *)&v100[4] + 1) = self;
        *(void *)&v100[5] = VCAudioManager_InputDeviceSelectionCallback;
        *((void *)&v100[5] + 1) = VCAudioManager_OutputDeviceSelectionCallback;
        int playbackMode = self->_playbackMode;
        if (playbackMode == 1)
        {
          uint32_t v53 = &v100[2];
        }
        else
        {
          if (playbackMode != 2) {
            goto LABEL_45;
          }
          uint32_t v53 = &v98[3];
        }
        BYTE8(v100[3]) = 0;
        *(void *)uint32_t v53 = 0;
        *((void *)v53 + 1) = 0;
LABEL_45:
        int v54 = AUIOCreateHandle(&v101, (uint64_t)v98);
        if (v54 < 0)
        {
          int v83 = v54;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v84 = VRTraceErrorLogLevelToCSTR();
            v85 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
            {
              int v94 = [a3 audioSessionId];
              *(_DWORD *)buf = 136316418;
              uint64_t v112 = v84;
              __int16 v113 = 2080;
              v114 = "-[VCAudioManager startAUIOWithProperties:]";
              __int16 v115 = 1024;
              int v116 = 1363;
              __int16 v117 = 1024;
              *(_DWORD *)v118 = 1363;
              *(_WORD *)&v118[4] = 1024;
              *(_DWORD *)&v118[6] = v94;
              LOWORD(v119) = 1024;
              *(_DWORD *)((char *)&v119 + 2) = v83;
              _os_log_error_impl(&dword_1E1EA4000, v85, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCAudioManager.m:%d: CMSession:[%u] AUIOCreateHandle failed(%X)", buf, 0x2Eu);
            }
          }
          __int16 v68 = v6;
        }
        else
        {
          if (!self->_playbackMode) {
            [(VCAudioManager *)self setupIODevicesForAUIO:v101];
          }
          if (self->_isMediaPlaybackOnExternalDevice) {
            AUIOSetMediaPlaybackOnExternalDevice(v101, 1);
          }
          if (!self->_playbackMode) {
            [(VCAudioManager *)self setupDynamicDuckingVolumeHandlerForAUIO:v101];
          }
          int v110 = -1431655766;
          *(void *)&long long v55 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v55 + 1) = 0xAAAAAAAAAAAAAAAALL;
          long long v108 = v55;
          long long v109 = v55;
          long long v106 = v55;
          long long v107 = v55;
          long long v104 = v55;
          long long v105 = v55;
          long long v102 = v55;
          long long v103 = v55;
          if (a3)
          {
            [a3 farEndVersionInfo];
          }
          else
          {
            int v110 = 0;
            long long v108 = 0u;
            long long v109 = 0u;
            long long v106 = 0u;
            long long v107 = 0u;
            long long v104 = 0u;
            long long v105 = 0u;
            long long v102 = 0u;
            long long v103 = 0u;
          }
          uint64_t v56 = v101;
          uint64_t v57 = [a3 frameFormatMic];
          uint64_t v58 = (long long *)[a3 frameFormatSpeaker];
          if ([a3 isFarEndVersionInfoValid]) {
            __int16 v59 = &v102;
          }
          else {
            __int16 v59 = 0;
          }
          int v60 = [a3 allowAudioRecording];
          int v61 = [a3 vpOperatingMode];
          int v62 = [a3 vpEnableSpatialChat];
          unsigned int v63 = [a3 remoteCodecType];
          [a3 remoteCodecSampleRate];
          spatialStreamDescriptions = self->_spatialStreamDescriptions;
          int v65 = AUIOSetupFormats(v64, v56, v57, v58, (uint64_t)v59, v60, v61, v62, v63);
          if (v65 < 0)
          {
            int v86 = v65;
            if ((VCAudioManager *)objc_opt_class() == self)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                VRTraceErrorLogLevelToCSTR();
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                  -[VCAudioManager startAUIOWithProperties:]();
                }
              }
            }
            else
            {
              if (objc_opt_respondsToSelector()) {
                v87 = (__CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix, spatialStreamDescriptions);
              }
              else {
                v87 = &stru_1F3D3E450;
              }
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                uint64_t v92 = VRTraceErrorLogLevelToCSTR();
                v93 = *MEMORY[0x1E4F47A50];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136316418;
                  uint64_t v112 = v92;
                  __int16 v113 = 2080;
                  v114 = "-[VCAudioManager startAUIOWithProperties:]";
                  __int16 v115 = 1024;
                  int v116 = 1377;
                  __int16 v117 = 2112;
                  *(void *)v118 = v87;
                  *(_WORD *)&v118[8] = 2048;
                  *(void *)&long long v119 = self;
                  WORD4(v119) = 1024;
                  *(_DWORD *)((char *)&v119 + 10) = v86;
                  _os_log_error_impl(&dword_1E1EA4000, v93, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) AUIOSetupFormats() failed. hResult=0x%08X", buf, 0x36u);
                }
              }
            }
            __int16 v68 = v97;
          }
          else
          {
            int v66 = -[VCAudioManager registerForMutedTalkerNotificationWithAUIO:](self, "registerForMutedTalkerNotificationWithAUIO:", v101, spatialStreamDescriptions);
            if (v66 < 0)
            {
              int v75 = v66;
              if ((VCAudioManager *)objc_opt_class() == self)
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  VRTraceErrorLogLevelToCSTR();
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                    -[VCAudioManager startAUIOWithProperties:]();
                  }
                }
              }
              else
              {
                if (objc_opt_respondsToSelector()) {
                  long long v76 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
                }
                else {
                  long long v76 = &stru_1F3D3E450;
                }
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  uint64_t v81 = VRTraceErrorLogLevelToCSTR();
                  v82 = *MEMORY[0x1E4F47A50];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136316418;
                    uint64_t v112 = v81;
                    __int16 v113 = 2080;
                    v114 = "-[VCAudioManager startAUIOWithProperties:]";
                    __int16 v115 = 1024;
                    int v116 = 1381;
                    __int16 v117 = 2112;
                    *(void *)v118 = v76;
                    *(_WORD *)&v118[8] = 2048;
                    *(void *)&long long v119 = self;
                    WORD4(v119) = 1024;
                    *(_DWORD *)((char *)&v119 + 10) = v75;
                    _os_log_error_impl(&dword_1E1EA4000, v82, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to register muted talker notification callback hResult=0x%08X", buf, 0x36u);
                  }
                }
              }
            }
            self->_hAUIO = (tagHANDLE *)v101;
            [(VCAudioManager *)self setupSpatialContextWithAudioUnitProperties:a3 forceUpdate:1];
            [(VCAudioManager *)self applyAudioSessionMute];
            int v67 = AUIOStart(v101);
            if ((v67 & 0x80000000) == 0)
            {
              [(VCAudioManager *)self setInputMetering];
              [(VCAudioManager *)self setOutputMetering];
              uint64_t v101 = 0xFFFFFFFFLL;
              BOOL v10 = 1;
              __int16 v68 = v97;
              goto LABEL_62;
            }
            int v88 = v67;
            __int16 v68 = v97;
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              uint64_t v89 = VRTraceErrorLogLevelToCSTR();
              v90 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
              {
                int v91 = [a3 audioSessionId];
                *(_DWORD *)buf = 136316418;
                uint64_t v112 = v89;
                __int16 v113 = 2080;
                v114 = "-[VCAudioManager startAUIOWithProperties:]";
                __int16 v115 = 1024;
                int v116 = 1395;
                __int16 v117 = 1024;
                *(_DWORD *)v118 = 1395;
                *(_WORD *)&v118[4] = 1024;
                *(_DWORD *)&v118[6] = v91;
                LOWORD(v119) = 2048;
                *(void *)((char *)&v119 + 2) = v88;
                _os_log_error_impl(&dword_1E1EA4000, v90, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCAudioManager.m:%d: [CMSession]:%u AUIOStart failed(%08lX)", buf, 0x32u);
              }
            }
          }
        }
LABEL_106:
        if (v101 != 0xFFFFFFFFLL)
        {
          self->_hAUIO = (tagHANDLE *)0xFFFFFFFFLL;
          AUIOCloseHandle();
          if (v96) {
            VCAudioLimiter_Stop((uint64_t)self->_sourceData.audioLimiter);
          }
          VCAudioDucker_Destroy((void **)&self->_sourceData.audioLimiter);
          VCVoiceDetector_Stop(self->_sinkData.voiceDetector);
          BOOL v10 = 0;
          goto LABEL_76;
        }
        BOOL v10 = 0;
LABEL_62:
        if ((VCAudioManager *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
            goto LABEL_76;
          }
          uint64_t v70 = VRTraceErrorLogLevelToCSTR();
          uint64_t v71 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_76;
          }
          *(_DWORD *)buf = 136315650;
          uint64_t v112 = v70;
          __int16 v113 = 2080;
          v114 = "-[VCAudioManager startAUIOWithProperties:]";
          __int16 v115 = 1024;
          int v116 = 1413;
          uint64_t v72 = " [%s] %s:%d startAudioIO is completed";
          long long v73 = v71;
          uint32_t v74 = 28;
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            int v69 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
          }
          else {
            int v69 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
            goto LABEL_76;
          }
          uint64_t v77 = VRTraceErrorLogLevelToCSTR();
          int v78 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_76;
          }
          *(_DWORD *)buf = 136316162;
          uint64_t v112 = v77;
          __int16 v113 = 2080;
          v114 = "-[VCAudioManager startAUIOWithProperties:]";
          __int16 v115 = 1024;
          int v116 = 1413;
          __int16 v117 = 2112;
          *(void *)v118 = v69;
          *(_WORD *)&v118[8] = 2048;
          *(void *)&long long v119 = self;
          uint64_t v72 = " [%s] %s:%d %@(%p) startAudioIO is completed";
          long long v73 = v78;
          uint32_t v74 = 48;
        }
        _os_log_impl(&dword_1E1EA4000, v73, OS_LOG_TYPE_DEFAULT, v72, buf, v74);
LABEL_76:
        [(SnapshotTimer *)v68 checkout];

        return v10;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioManager startAUIOWithProperties:].cold.4();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioManager startAUIOWithProperties:]();
      }
    }
    int v96 = 0;
    __int16 v68 = v6;
    goto LABEL_106;
  }
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioManager startAUIOWithProperties:].cold.5();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      BOOL v4 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
    }
    else {
      BOOL v4 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v112 = v8;
        __int16 v113 = 2080;
        v114 = "-[VCAudioManager startAUIOWithProperties:]";
        __int16 v115 = 1024;
        int v116 = 1306;
        __int16 v117 = 2112;
        *(void *)v118 = v4;
        *(_WORD *)&v118[8] = 2048;
        *(void *)&long long v119 = self;
        _os_log_error_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) AUIO already exists", buf, 0x30u);
      }
    }
  }
  return 0;
}

+ (unsigned)audioIOTypeWithAudioUnitProperties:(id)a3 shouldEnableAudioInput:(BOOL)a4
{
  BOOL v4 = a4;
  if (+[VCHardwareSettings deviceClass] == 8)
  {
    if ([a3 operatingMode] == 12) {
      return 2;
    }
    else {
      return 4;
    }
  }
  else if (v4)
  {
    if ([a3 operatingMode] == 12)
    {
      return 1;
    }
    else if ([a3 audioUnitType] == 2)
    {
      return 3;
    }
    else
    {
      return 4;
    }
  }
  else
  {
    return 2;
  }
}

- (BOOL)shouldResetAudioUnitWithProperties:(id)a3
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  int v5 = [(VCAudioUnitProperties *)self->_currentAudioUnitProperties allowAudioRecording];
  if (v5 == [a3 allowAudioRecording])
  {
    double v7 = *(double *)[(VCAudioUnitProperties *)self->_currentAudioUnitProperties frameFormatMic];
    if (v7 == *(double *)[a3 frameFormatMic])
    {
      int v13 = (int)[(VCAudioUnitProperties *)self->_currentAudioUnitProperties frameFormatMic][40];
      if (v13 == *(_DWORD *)([a3 frameFormatMic] + 40))
      {
        int v14 = (int)[(VCAudioUnitProperties *)self->_currentAudioUnitProperties frameFormatMic][28];
        if (v14 == *(_DWORD *)([a3 frameFormatMic] + 28))
        {
          double v15 = *(double *)[(VCAudioUnitProperties *)self->_currentAudioUnitProperties frameFormatSpeaker];
          if (v15 == *(double *)[a3 frameFormatSpeaker])
          {
            int v34 = (int)[(VCAudioUnitProperties *)self->_currentAudioUnitProperties frameFormatSpeaker][40];
            if (v34 == *(_DWORD *)([a3 frameFormatSpeaker] + 40))
            {
              int v35 = (int)[(VCAudioUnitProperties *)self->_currentAudioUnitProperties frameFormatSpeaker][28];
              if (v35 == *(_DWORD *)([a3 frameFormatSpeaker] + 28))
              {
                unsigned int v36 = [(VCAudioUnitProperties *)self->_currentAudioUnitProperties vpOperatingMode];
                if (v36 == [a3 vpOperatingMode])
                {
                  int v37 = [(VCAudioUnitProperties *)self->_currentAudioUnitProperties vpEnableSpatialChat];
                  if (v37 == [a3 vpEnableSpatialChat]) {
                    return 0;
                  }
                  if ((VCAudioManager *)objc_opt_class() == self)
                  {
                    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
                      return 1;
                    }
                    uint64_t v71 = VRTraceErrorLogLevelToCSTR();
                    BOOL v10 = *MEMORY[0x1E4F47A50];
                    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
                      return 1;
                    }
                    BOOL v72 = [(VCAudioUnitProperties *)self->_currentAudioUnitProperties vpEnableSpatialChat];
                    int v77 = 136316162;
                    uint64_t v78 = v71;
                    __int16 v79 = 2080;
                    v80 = "-[VCAudioManager shouldResetAudioUnitWithProperties:]";
                    __int16 v81 = 1024;
                    int v82 = 1486;
                    __int16 v83 = 1024;
                    *(_DWORD *)uint64_t v84 = v72;
                    *(_WORD *)&v84[4] = 1024;
                    *(_DWORD *)&v84[6] = [a3 vpEnableSpatialChat];
                    double v12 = " [%s] %s:%d VP spatial chat flag changed: %d->%d";
                    goto LABEL_97;
                  }
                  if (objc_opt_respondsToSelector()) {
                    uint32_t v38 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
                  }
                  else {
                    uint32_t v38 = &stru_1F3D3E450;
                  }
                  if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
                    return 1;
                  }
                  uint64_t v75 = VRTraceErrorLogLevelToCSTR();
                  uint64_t v18 = *MEMORY[0x1E4F47A50];
                  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
                    return 1;
                  }
                  BOOL v76 = [(VCAudioUnitProperties *)self->_currentAudioUnitProperties vpEnableSpatialChat];
                  int v77 = 136316674;
                  uint64_t v78 = v75;
                  __int16 v79 = 2080;
                  v80 = "-[VCAudioManager shouldResetAudioUnitWithProperties:]";
                  __int16 v81 = 1024;
                  int v82 = 1486;
                  __int16 v83 = 2112;
                  *(void *)uint64_t v84 = v38;
                  *(_WORD *)&v84[8] = 2048;
                  v85 = self;
                  __int16 v86 = 1024;
                  unsigned int v87 = v76;
                  __int16 v88 = 1024;
                  int v89 = [a3 vpEnableSpatialChat];
                  double v12 = " [%s] %s:%d %@(%p) VP spatial chat flag changed: %d->%d";
                }
                else
                {
                  if ((VCAudioManager *)objc_opt_class() == self)
                  {
                    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
                      return 1;
                    }
                    uint64_t v67 = VRTraceErrorLogLevelToCSTR();
                    BOOL v10 = *MEMORY[0x1E4F47A50];
                    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
                      return 1;
                    }
                    unsigned int v68 = [(VCAudioUnitProperties *)self->_currentAudioUnitProperties vpOperatingMode];
                    int v77 = 136316162;
                    uint64_t v78 = v67;
                    __int16 v79 = 2080;
                    v80 = "-[VCAudioManager shouldResetAudioUnitWithProperties:]";
                    __int16 v81 = 1024;
                    int v82 = 1482;
                    __int16 v83 = 1024;
                    *(_DWORD *)uint64_t v84 = v68;
                    *(_WORD *)&v84[4] = 1024;
                    *(_DWORD *)&v84[6] = [a3 vpOperatingMode];
                    double v12 = " [%s] %s:%d VP operating mode changed: %d->%d";
                    goto LABEL_97;
                  }
                  if (objc_opt_respondsToSelector()) {
                    __int16 v59 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
                  }
                  else {
                    __int16 v59 = &stru_1F3D3E450;
                  }
                  if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
                    return 1;
                  }
                  uint64_t v69 = VRTraceErrorLogLevelToCSTR();
                  uint64_t v18 = *MEMORY[0x1E4F47A50];
                  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
                    return 1;
                  }
                  unsigned int v70 = [(VCAudioUnitProperties *)self->_currentAudioUnitProperties vpOperatingMode];
                  int v77 = 136316674;
                  uint64_t v78 = v69;
                  __int16 v79 = 2080;
                  v80 = "-[VCAudioManager shouldResetAudioUnitWithProperties:]";
                  __int16 v81 = 1024;
                  int v82 = 1482;
                  __int16 v83 = 2112;
                  *(void *)uint64_t v84 = v59;
                  *(_WORD *)&v84[8] = 2048;
                  v85 = self;
                  __int16 v86 = 1024;
                  unsigned int v87 = v70;
                  __int16 v88 = 1024;
                  int v89 = [a3 vpOperatingMode];
                  double v12 = " [%s] %s:%d %@(%p) VP operating mode changed: %d->%d";
                }
              }
              else
              {
                if ((VCAudioManager *)objc_opt_class() == self)
                {
                  if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
                    return 1;
                  }
                  uint64_t v60 = VRTraceErrorLogLevelToCSTR();
                  BOOL v10 = *MEMORY[0x1E4F47A50];
                  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
                    return 1;
                  }
                  int v61 = (int)[(VCAudioUnitProperties *)self->_currentAudioUnitProperties frameFormatSpeaker][28];
                  int v62 = *(_DWORD *)([a3 frameFormatSpeaker] + 28);
                  int v77 = 136316162;
                  uint64_t v78 = v60;
                  __int16 v79 = 2080;
                  v80 = "-[VCAudioManager shouldResetAudioUnitWithProperties:]";
                  __int16 v81 = 1024;
                  int v82 = 1478;
                  __int16 v83 = 1024;
                  *(_DWORD *)uint64_t v84 = v61;
                  *(_WORD *)&v84[4] = 1024;
                  *(_DWORD *)&v84[6] = v62;
                  double v12 = " [%s] %s:%d Speaker channels per frame changed: %d->%d";
                  goto LABEL_97;
                }
                if (objc_opt_respondsToSelector()) {
                  uint64_t v52 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
                }
                else {
                  uint64_t v52 = &stru_1F3D3E450;
                }
                if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
                  return 1;
                }
                uint64_t v63 = VRTraceErrorLogLevelToCSTR();
                uint64_t v18 = *MEMORY[0x1E4F47A50];
                if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
                  return 1;
                }
                unsigned int v64 = [(VCAudioUnitProperties *)self->_currentAudioUnitProperties frameFormatSpeaker][28];
                int v65 = *(_DWORD *)([a3 frameFormatSpeaker] + 28);
                int v77 = 136316674;
                uint64_t v78 = v63;
                __int16 v79 = 2080;
                v80 = "-[VCAudioManager shouldResetAudioUnitWithProperties:]";
                __int16 v81 = 1024;
                int v82 = 1478;
                __int16 v83 = 2112;
                *(void *)uint64_t v84 = v52;
                *(_WORD *)&v84[8] = 2048;
                v85 = self;
                __int16 v86 = 1024;
                unsigned int v87 = v64;
                __int16 v88 = 1024;
                int v89 = v65;
                double v12 = " [%s] %s:%d %@(%p) Speaker channels per frame changed: %d->%d";
              }
            }
            else
            {
              if ((VCAudioManager *)objc_opt_class() == self)
              {
                if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
                  return 1;
                }
                uint64_t v53 = VRTraceErrorLogLevelToCSTR();
                BOOL v10 = *MEMORY[0x1E4F47A50];
                if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
                  return 1;
                }
                int v54 = (int)[(VCAudioUnitProperties *)self->_currentAudioUnitProperties frameFormatSpeaker][40];
                int v55 = *(_DWORD *)([a3 frameFormatSpeaker] + 40);
                int v77 = 136316162;
                uint64_t v78 = v53;
                __int16 v79 = 2080;
                v80 = "-[VCAudioManager shouldResetAudioUnitWithProperties:]";
                __int16 v81 = 1024;
                int v82 = 1474;
                __int16 v83 = 1024;
                *(_DWORD *)uint64_t v84 = v54;
                *(_WORD *)&v84[4] = 1024;
                *(_DWORD *)&v84[6] = v55;
                double v12 = " [%s] %s:%d Speaker samples per frame changed: %d->%d";
                goto LABEL_97;
              }
              if (objc_opt_respondsToSelector()) {
                uint64_t v51 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
              }
              else {
                uint64_t v51 = &stru_1F3D3E450;
              }
              if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
                return 1;
              }
              uint64_t v56 = VRTraceErrorLogLevelToCSTR();
              uint64_t v18 = *MEMORY[0x1E4F47A50];
              if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
                return 1;
              }
              unsigned int v57 = [(VCAudioUnitProperties *)self->_currentAudioUnitProperties frameFormatSpeaker][40];
              int v58 = *(_DWORD *)([a3 frameFormatSpeaker] + 40);
              int v77 = 136316674;
              uint64_t v78 = v56;
              __int16 v79 = 2080;
              v80 = "-[VCAudioManager shouldResetAudioUnitWithProperties:]";
              __int16 v81 = 1024;
              int v82 = 1474;
              __int16 v83 = 2112;
              *(void *)uint64_t v84 = v51;
              *(_WORD *)&v84[8] = 2048;
              v85 = self;
              __int16 v86 = 1024;
              unsigned int v87 = v57;
              __int16 v88 = 1024;
              int v89 = v58;
              double v12 = " [%s] %s:%d %@(%p) Speaker samples per frame changed: %d->%d";
            }
          }
          else
          {
            if ((VCAudioManager *)objc_opt_class() == self)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
                return 1;
              }
              uint64_t v45 = VRTraceErrorLogLevelToCSTR();
              BOOL v10 = *MEMORY[0x1E4F47A50];
              if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
                return 1;
              }
              int v46 = (int)*(double *)[(VCAudioUnitProperties *)self->_currentAudioUnitProperties frameFormatSpeaker];
              int v47 = (int)*(double *)[a3 frameFormatSpeaker];
              int v77 = 136316162;
              uint64_t v78 = v45;
              __int16 v79 = 2080;
              v80 = "-[VCAudioManager shouldResetAudioUnitWithProperties:]";
              __int16 v81 = 1024;
              int v82 = 1470;
              __int16 v83 = 1024;
              *(_DWORD *)uint64_t v84 = v46;
              *(_WORD *)&v84[4] = 1024;
              *(_DWORD *)&v84[6] = v47;
              double v12 = " [%s] %s:%d Speaker sample rate changed: %d->%d";
              goto LABEL_97;
            }
            if (objc_opt_respondsToSelector()) {
              uint64_t v16 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
            }
            else {
              uint64_t v16 = &stru_1F3D3E450;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
              return 1;
            }
            uint64_t v48 = VRTraceErrorLogLevelToCSTR();
            uint64_t v18 = *MEMORY[0x1E4F47A50];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
              return 1;
            }
            int v49 = (int)*(double *)[(VCAudioUnitProperties *)self->_currentAudioUnitProperties frameFormatSpeaker];
            int v50 = (int)*(double *)[a3 frameFormatSpeaker];
            int v77 = 136316674;
            uint64_t v78 = v48;
            __int16 v79 = 2080;
            v80 = "-[VCAudioManager shouldResetAudioUnitWithProperties:]";
            __int16 v81 = 1024;
            int v82 = 1470;
            __int16 v83 = 2112;
            *(void *)uint64_t v84 = v16;
            *(_WORD *)&v84[8] = 2048;
            v85 = self;
            __int16 v86 = 1024;
            unsigned int v87 = v49;
            __int16 v88 = 1024;
            int v89 = v50;
            double v12 = " [%s] %s:%d %@(%p) Speaker sample rate changed: %d->%d";
          }
        }
        else
        {
          if ((VCAudioManager *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
              return 1;
            }
            uint64_t v39 = VRTraceErrorLogLevelToCSTR();
            BOOL v10 = *MEMORY[0x1E4F47A50];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
              return 1;
            }
            int v40 = (int)[(VCAudioUnitProperties *)self->_currentAudioUnitProperties frameFormatMic][28];
            int v41 = *(_DWORD *)([a3 frameFormatMic] + 28);
            int v77 = 136316162;
            uint64_t v78 = v39;
            __int16 v79 = 2080;
            v80 = "-[VCAudioManager shouldResetAudioUnitWithProperties:]";
            __int16 v81 = 1024;
            int v82 = 1466;
            __int16 v83 = 1024;
            *(_DWORD *)uint64_t v84 = v40;
            *(_WORD *)&v84[4] = 1024;
            *(_DWORD *)&v84[6] = v41;
            double v12 = " [%s] %s:%d Mic channels per frame changed: %d->%d";
            goto LABEL_97;
          }
          if (objc_opt_respondsToSelector()) {
            uint64_t v27 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
          }
          else {
            uint64_t v27 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
            return 1;
          }
          uint64_t v42 = VRTraceErrorLogLevelToCSTR();
          uint64_t v18 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
            return 1;
          }
          unsigned int v43 = [(VCAudioUnitProperties *)self->_currentAudioUnitProperties frameFormatMic][28];
          int v44 = *(_DWORD *)([a3 frameFormatMic] + 28);
          int v77 = 136316674;
          uint64_t v78 = v42;
          __int16 v79 = 2080;
          v80 = "-[VCAudioManager shouldResetAudioUnitWithProperties:]";
          __int16 v81 = 1024;
          int v82 = 1466;
          __int16 v83 = 2112;
          *(void *)uint64_t v84 = v27;
          *(_WORD *)&v84[8] = 2048;
          v85 = self;
          __int16 v86 = 1024;
          unsigned int v87 = v43;
          __int16 v88 = 1024;
          int v89 = v44;
          double v12 = " [%s] %s:%d %@(%p) Mic channels per frame changed: %d->%d";
        }
      }
      else
      {
        if ((VCAudioManager *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
            return 1;
          }
          uint64_t v28 = VRTraceErrorLogLevelToCSTR();
          BOOL v10 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
            return 1;
          }
          int v29 = (int)[(VCAudioUnitProperties *)self->_currentAudioUnitProperties frameFormatMic][40];
          int v30 = *(_DWORD *)([a3 frameFormatMic] + 40);
          int v77 = 136316162;
          uint64_t v78 = v28;
          __int16 v79 = 2080;
          v80 = "-[VCAudioManager shouldResetAudioUnitWithProperties:]";
          __int16 v81 = 1024;
          int v82 = 1462;
          __int16 v83 = 1024;
          *(_DWORD *)uint64_t v84 = v29;
          *(_WORD *)&v84[4] = 1024;
          *(_DWORD *)&v84[6] = v30;
          double v12 = " [%s] %s:%d Mic samples per frame changed: %d->%d";
          goto LABEL_97;
        }
        if (objc_opt_respondsToSelector()) {
          int v26 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
        }
        else {
          int v26 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          return 1;
        }
        uint64_t v31 = VRTraceErrorLogLevelToCSTR();
        uint64_t v18 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          return 1;
        }
        unsigned int v32 = [(VCAudioUnitProperties *)self->_currentAudioUnitProperties frameFormatMic][40];
        int v33 = *(_DWORD *)([a3 frameFormatMic] + 40);
        int v77 = 136316674;
        uint64_t v78 = v31;
        __int16 v79 = 2080;
        v80 = "-[VCAudioManager shouldResetAudioUnitWithProperties:]";
        __int16 v81 = 1024;
        int v82 = 1462;
        __int16 v83 = 2112;
        *(void *)uint64_t v84 = v26;
        *(_WORD *)&v84[8] = 2048;
        v85 = self;
        __int16 v86 = 1024;
        unsigned int v87 = v32;
        __int16 v88 = 1024;
        int v89 = v33;
        double v12 = " [%s] %s:%d %@(%p) Mic samples per frame changed: %d->%d";
      }
    }
    else
    {
      if ((VCAudioManager *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          return 1;
        }
        uint64_t v20 = VRTraceErrorLogLevelToCSTR();
        BOOL v10 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          return 1;
        }
        int v21 = (int)*(double *)[(VCAudioUnitProperties *)self->_currentAudioUnitProperties frameFormatMic];
        int v22 = (int)*(double *)[a3 frameFormatMic];
        int v77 = 136316162;
        uint64_t v78 = v20;
        __int16 v79 = 2080;
        v80 = "-[VCAudioManager shouldResetAudioUnitWithProperties:]";
        __int16 v81 = 1024;
        int v82 = 1458;
        __int16 v83 = 1024;
        *(_DWORD *)uint64_t v84 = v21;
        *(_WORD *)&v84[4] = 1024;
        *(_DWORD *)&v84[6] = v22;
        double v12 = " [%s] %s:%d Mic sample rate changed: %d->%d";
        goto LABEL_97;
      }
      if (objc_opt_respondsToSelector()) {
        uint64_t v8 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v8 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return 1;
      }
      uint64_t v23 = VRTraceErrorLogLevelToCSTR();
      uint64_t v18 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return 1;
      }
      int v24 = (int)*(double *)[(VCAudioUnitProperties *)self->_currentAudioUnitProperties frameFormatMic];
      int v25 = (int)*(double *)[a3 frameFormatMic];
      int v77 = 136316674;
      uint64_t v78 = v23;
      __int16 v79 = 2080;
      v80 = "-[VCAudioManager shouldResetAudioUnitWithProperties:]";
      __int16 v81 = 1024;
      int v82 = 1458;
      __int16 v83 = 2112;
      *(void *)uint64_t v84 = v8;
      *(_WORD *)&v84[8] = 2048;
      v85 = self;
      __int16 v86 = 1024;
      unsigned int v87 = v24;
      __int16 v88 = 1024;
      int v89 = v25;
      double v12 = " [%s] %s:%d %@(%p) Mic sample rate changed: %d->%d";
    }
LABEL_102:
    long long v73 = v18;
    uint32_t v74 = 60;
    goto LABEL_103;
  }
  if ((VCAudioManager *)objc_opt_class() != self)
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v6 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 1;
    }
    uint64_t v17 = VRTraceErrorLogLevelToCSTR();
    uint64_t v18 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return 1;
    }
    BOOL v19 = [(VCAudioUnitProperties *)self->_currentAudioUnitProperties allowAudioRecording];
    int v77 = 136316674;
    uint64_t v78 = v17;
    __int16 v79 = 2080;
    v80 = "-[VCAudioManager shouldResetAudioUnitWithProperties:]";
    __int16 v81 = 1024;
    int v82 = 1454;
    __int16 v83 = 2112;
    *(void *)uint64_t v84 = v6;
    *(_WORD *)&v84[8] = 2048;
    v85 = self;
    __int16 v86 = 1024;
    unsigned int v87 = v19;
    __int16 v88 = 1024;
    int v89 = [a3 allowAudioRecording];
    double v12 = " [%s] %s:%d %@(%p) Recording changed: %d->%d";
    goto LABEL_102;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
    return 1;
  }
  uint64_t v9 = VRTraceErrorLogLevelToCSTR();
  BOOL v10 = *MEMORY[0x1E4F47A50];
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
    return 1;
  }
  BOOL v11 = [(VCAudioUnitProperties *)self->_currentAudioUnitProperties allowAudioRecording];
  int v77 = 136316162;
  uint64_t v78 = v9;
  __int16 v79 = 2080;
  v80 = "-[VCAudioManager shouldResetAudioUnitWithProperties:]";
  __int16 v81 = 1024;
  int v82 = 1454;
  __int16 v83 = 1024;
  *(_DWORD *)uint64_t v84 = v11;
  *(_WORD *)&v84[4] = 1024;
  *(_DWORD *)&v84[6] = [a3 allowAudioRecording];
  double v12 = " [%s] %s:%d Recording changed: %d->%d";
LABEL_97:
  long long v73 = v10;
  uint32_t v74 = 40;
LABEL_103:
  _os_log_impl(&dword_1E1EA4000, v73, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v77, v74);
  return 1;
}

- (BOOL)shouldResetAudioSessionWithProperties:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      double v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        id v8 = [(VCAudioSessionMediaProperties *)self->_currentAudioSessionMediaProperties description];
        *(_DWORD *)int v37 = 136315906;
        *(void *)&v37[4] = v6;
        *(_WORD *)&v37[12] = 2080;
        *(void *)&v37[14] = "-[VCAudioManager shouldResetAudioSessionWithProperties:]";
        *(_WORD *)&v37[22] = 1024;
        LODWORD(v38) = 1494;
        WORD2(v38) = 2112;
        *(void *)((char *)&v38 + 6) = v8;
        uint64_t v9 = " [%s] %s:%d Current settings: %@";
        BOOL v10 = v7;
        uint32_t v11 = 38;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, v37, v11);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      int v5 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
    }
    else {
      int v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      int v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [(VCAudioSessionMediaProperties *)self->_currentAudioSessionMediaProperties description];
        *(_DWORD *)int v37 = 136316418;
        *(void *)&v37[4] = v12;
        *(_WORD *)&v37[12] = 2080;
        *(void *)&v37[14] = "-[VCAudioManager shouldResetAudioSessionWithProperties:]";
        *(_WORD *)&v37[22] = 1024;
        LODWORD(v38) = 1494;
        WORD2(v38) = 2112;
        *(void *)((char *)&v38 + 6) = v5;
        HIWORD(v38) = 2048;
        uint64_t v39 = self;
        LOWORD(v40) = 2112;
        *(void *)((char *)&v40 + 2) = v14;
        uint64_t v9 = " [%s] %s:%d %@(%p) Current settings: %@";
        BOOL v10 = v13;
        uint32_t v11 = 58;
        goto LABEL_11;
      }
    }
  }
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      uint64_t v17 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = [a3 description];
        *(_DWORD *)int v37 = 136315906;
        *(void *)&v37[4] = v16;
        *(_WORD *)&v37[12] = 2080;
        *(void *)&v37[14] = "-[VCAudioManager shouldResetAudioSessionWithProperties:]";
        *(_WORD *)&v37[22] = 1024;
        LODWORD(v38) = 1495;
        WORD2(v38) = 2112;
        *(void *)((char *)&v38 + 6) = v18;
        BOOL v19 = " [%s] %s:%d New settings: %@";
        uint64_t v20 = v17;
        uint32_t v21 = 38;
LABEL_22:
        _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, v19, v37, v21);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      double v15 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
    }
    else {
      double v15 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      uint64_t v23 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = [a3 description];
        *(_DWORD *)int v37 = 136316418;
        *(void *)&v37[4] = v22;
        *(_WORD *)&v37[12] = 2080;
        *(void *)&v37[14] = "-[VCAudioManager shouldResetAudioSessionWithProperties:]";
        *(_WORD *)&v37[22] = 1024;
        LODWORD(v38) = 1495;
        WORD2(v38) = 2112;
        *(void *)((char *)&v38 + 6) = v15;
        HIWORD(v38) = 2048;
        uint64_t v39 = self;
        LOWORD(v40) = 2112;
        *(void *)((char *)&v40 + 2) = v24;
        BOOL v19 = " [%s] %s:%d %@(%p) New settings: %@";
        uint64_t v20 = v23;
        uint32_t v21 = 58;
        goto LABEL_22;
      }
    }
  }
  BOOL v25 = [(VCAudioSessionMediaProperties *)self->_currentAudioSessionMediaProperties isSessionActive];
  if (v25)
  {
    if ([(VCAudioSessionMediaProperties *)self->_currentAudioSessionMediaProperties isEqual:a3])
    {
      LOBYTE(v25) = [(VCAudioSession *)self->_audioSession shouldResetAudioSession];
      return v25;
    }
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_37;
      }
      uint64_t v27 = VRTraceErrorLogLevelToCSTR();
      uint64_t v28 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_37;
      }
      unsigned int v29 = [(VCAudioUnitProperties *)self->_currentAudioUnitProperties audioSessionId];
      *(_DWORD *)int v37 = 136315906;
      *(void *)&v37[4] = v27;
      *(_WORD *)&v37[12] = 2080;
      *(void *)&v37[14] = "-[VCAudioManager shouldResetAudioSessionWithProperties:]";
      *(_WORD *)&v37[22] = 1024;
      LODWORD(v38) = 1501;
      WORD2(v38) = 1024;
      *(_DWORD *)((char *)&v38 + 6) = v29;
      int v30 = " [%s] %s:%d [CMSession]:%u Session properties changed!";
      uint64_t v31 = v28;
      uint32_t v32 = 34;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v26 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
      }
      else {
        int v26 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_37;
      }
      uint64_t v33 = VRTraceErrorLogLevelToCSTR();
      int v34 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_37;
      }
      unsigned int v35 = [(VCAudioUnitProperties *)self->_currentAudioUnitProperties audioSessionId];
      *(_DWORD *)int v37 = 136316418;
      *(void *)&v37[4] = v33;
      *(_WORD *)&v37[12] = 2080;
      *(void *)&v37[14] = "-[VCAudioManager shouldResetAudioSessionWithProperties:]";
      *(_WORD *)&v37[22] = 1024;
      LODWORD(v38) = 1501;
      WORD2(v38) = 2112;
      *(void *)((char *)&v38 + 6) = v26;
      HIWORD(v38) = 2048;
      uint64_t v39 = self;
      LOWORD(v40) = 1024;
      *(_DWORD *)((char *)&v40 + 2) = v35;
      int v30 = " [%s] %s:%d %@(%p) [CMSession]:%u Session properties changed!";
      uint64_t v31 = v34;
      uint32_t v32 = 54;
    }
    _os_log_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_DEFAULT, v30, v37, v32);
LABEL_37:
    LOBYTE(v25) = 1;
  }
  return v25;
}

- (BOOL)resetAUIOWithProperties:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  int v27 = -1431655766;
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v25 = v5;
  long long v26 = v5;
  long long v23 = v5;
  long long v24 = v5;
  long long v21 = v5;
  long long v22 = v5;
  long long v19 = v5;
  long long v20 = v5;
  if (a3)
  {
    [a3 farEndVersionInfo];
  }
  else
  {
    int v27 = 0;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
  }
  hAUIO = self->_hAUIO;
  uint64_t v7 = [a3 frameFormatMic];
  id v8 = (long long *)[a3 frameFormatSpeaker];
  int v9 = [a3 allowAudioRecording];
  int v10 = [a3 vpOperatingMode];
  int v11 = [a3 vpEnableSpatialChat];
  unsigned int v12 = [a3 remoteCodecType];
  [a3 remoteCodecSampleRate];
  int v14 = AUIOSetupFormats(v13, (uint64_t)hAUIO, v7, v8, (uint64_t)&v19, v9, v10, v11, v12);
  if (v14 < 0 && (int v15 = v14, v14 != -2145714174))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioManager resetAUIOWithProperties:]();
      }
    }
  }
  else
  {
    int IsReady = AUIOReceiverIsReady();
    int v15 = IsReady;
    if (IsReady < 0 && IsReady != -2145714174 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioManager resetAUIOWithProperties:]();
      }
    }
  }
  return v15 >= 0 || v15 == -2145714174;
}

- (BOOL)resetAudioLimiterWithProperties:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v5 = (int)[(VCAudioUnitProperties *)self->_currentAudioUnitProperties frameFormatSpeaker][40];
  if (v5 != *(_DWORD *)([a3 frameFormatSpeaker] + 40))
  {
    p_audioLimiter = &self->_sourceData.audioLimiter;
    audioLimiter = self->_sourceData.audioLimiter;
    if (audioLimiter)
    {
      VCAudioLimiter_Stop((uint64_t)audioLimiter);
      VCAudioDucker_Destroy((void **)&self->_sourceData.audioLimiter);
    }
    if (!self->_isGKVoiceChat && !self->_playbackMode)
    {
      if ((VCAudioManager *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_19;
        }
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        int v11 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_19;
        }
        int v12 = *(_DWORD *)([a3 frameFormatSpeaker] + 40);
        *(_DWORD *)long long v20 = 136315906;
        *(void *)&v20[4] = v10;
        *(_WORD *)&v20[12] = 2080;
        *(void *)&v20[14] = "-[VCAudioManager resetAudioLimiterWithProperties:]";
        *(_WORD *)&v20[22] = 1024;
        LODWORD(v21) = 1533;
        WORD2(v21) = 1024;
        *(_DWORD *)((char *)&v21 + 6) = v12;
        double v13 = " [%s] %s:%d reset audio limiter: %d";
        int v14 = v11;
        uint32_t v15 = 34;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          int v9 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
        }
        else {
          int v9 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_19;
        }
        uint64_t v16 = VRTraceErrorLogLevelToCSTR();
        uint64_t v17 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_19;
        }
        int v18 = *(_DWORD *)([a3 frameFormatSpeaker] + 40);
        *(_DWORD *)long long v20 = 136316418;
        *(void *)&v20[4] = v16;
        *(_WORD *)&v20[12] = 2080;
        *(void *)&v20[14] = "-[VCAudioManager resetAudioLimiterWithProperties:]";
        *(_WORD *)&v20[22] = 1024;
        LODWORD(v21) = 1533;
        WORD2(v21) = 2112;
        *(void *)((char *)&v21 + 6) = v9;
        HIWORD(v21) = 2048;
        long long v22 = self;
        LOWORD(v23) = 1024;
        *(_DWORD *)((char *)&v23 + 2) = v18;
        double v13 = " [%s] %s:%d %@(%p) reset audio limiter: %d";
        int v14 = v17;
        uint32_t v15 = 54;
      }
      _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, v13, v20, v15);
LABEL_19:
      long long v19 = (opaqueVCAudioLimiter *)VCAudioLimiter_Allocate((long long *)objc_msgSend(a3, "frameFormatMic", *(_OWORD *)v20, *(void *)&v20[16], v21, v22, v23));
      *p_audioLimiter = v19;
      return VCAudioLimiter_Start((uint64_t)v19);
    }
  }
  return 1;
}

- (void)stopAUIO
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AUIO doesn't exists", v2, v3, v4, v5, v6);
}

- (BOOL)audioCallbacksRunning
{
  unsigned int state = self->_state;
  return state == 3 && !self->_isInterrupting || state == 4;
}

- (void)registerClientIO:(_VCAudioIOControllerClientIO *)a3 controllerIO:(_VCAudioIOControllerIOState *)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      int v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int state = self->_state;
        *(_DWORD *)buf = 136316418;
        uint64_t v32 = v8;
        __int16 v33 = 2080;
        int v34 = "-[VCAudioManager registerClientIO:controllerIO:]";
        __int16 v35 = 1024;
        int v36 = 1564;
        __int16 v37 = 2048;
        long long v38 = a3;
        __int16 v39 = 2048;
        long long v40 = a4;
        __int16 v41 = 1024;
        LODWORD(v42) = state;
        int v11 = " [%s] %s:%d Registering clientIO[%p] controllerIO[%p] in current manager state=%d";
        int v12 = v9;
        uint32_t v13 = 54;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v7 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      uint32_t v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v16 = self->_state;
        *(_DWORD *)buf = 136316930;
        uint64_t v32 = v14;
        __int16 v33 = 2080;
        int v34 = "-[VCAudioManager registerClientIO:controllerIO:]";
        __int16 v35 = 1024;
        int v36 = 1564;
        __int16 v37 = 2112;
        long long v38 = (_VCAudioIOControllerClientIO *)v7;
        __int16 v39 = 2048;
        long long v40 = self;
        __int16 v41 = 2048;
        uint64_t v42 = a3;
        __int16 v43 = 2048;
        int v44 = a4;
        __int16 v45 = 1024;
        unsigned int v46 = v16;
        int v11 = " [%s] %s:%d %@(%p) Registering clientIO[%p] controllerIO[%p] in current manager state=%d";
        int v12 = v15;
        uint32_t v13 = 74;
        goto LABEL_11;
      }
    }
  }
  uint64_t v17 = VCAudioManager_NewAudioEvent(0, (uint64_t)a3);
  int v30 = v17;
  dispatch_time_t v18 = dispatch_time(0, 1000000000);
  if (!dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v17[1] + 16), v18)) {
    goto LABEL_24;
  }
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      long long v21 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v32 = v20;
        __int16 v33 = 2080;
        int v34 = "-[VCAudioManager registerClientIO:controllerIO:]";
        __int16 v35 = 1024;
        int v36 = 1571;
        __int16 v37 = 2048;
        long long v38 = a3;
        long long v22 = " [%s] %s:%d Wait on run lock semaphore timed out! clientIO=%p";
        uint64_t v23 = v21;
        uint32_t v24 = 38;
LABEL_23:
        _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      long long v19 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
    }
    else {
      long long v19 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v25 = VRTraceErrorLogLevelToCSTR();
      long long v26 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v32 = v25;
        __int16 v33 = 2080;
        int v34 = "-[VCAudioManager registerClientIO:controllerIO:]";
        __int16 v35 = 1024;
        int v36 = 1571;
        __int16 v37 = 2112;
        long long v38 = (_VCAudioIOControllerClientIO *)v19;
        __int16 v39 = 2048;
        long long v40 = self;
        __int16 v41 = 2048;
        uint64_t v42 = a3;
        long long v22 = " [%s] %s:%d %@(%p) Wait on run lock semaphore timed out! clientIO=%p";
        uint64_t v23 = v26;
        uint32_t v24 = 58;
        goto LABEL_23;
      }
    }
  }
LABEL_24:
  pthread_mutex_lock(&self->_interruptingMutex);
  if ([(VCAudioManager *)self audioCallbacksRunning])
  {
    if (CMSimpleQueueEnqueue(a4->eventQueue, v17))
    {
      if ((VCAudioManager *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCAudioManager registerClientIO:controllerIO:]();
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          int v27 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
        }
        else {
          int v27 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v28 = VRTraceErrorLogLevelToCSTR();
          unsigned int v29 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v32 = v28;
            __int16 v33 = 2080;
            int v34 = "-[VCAudioManager registerClientIO:controllerIO:]";
            __int16 v35 = 1024;
            int v36 = 1577;
            __int16 v37 = 2112;
            long long v38 = (_VCAudioIOControllerClientIO *)v27;
            __int16 v39 = 2048;
            long long v40 = self;
            _os_log_error_impl(&dword_1E1EA4000, v29, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) CMSimpleQueueEnqueue Full", buf, 0x30u);
          }
        }
      }
      VCAudioManager_ReleaseAudioEvent((uint64_t *)&v30, 1);
    }
  }
  else
  {
    _VCAudioManager_RegisterClientIO((uint64_t)a4, v17);
  }
  pthread_mutex_unlock(&self->_interruptingMutex);
}

- (void)unregisterClientIO:(_VCAudioIOControllerClientIO *)a3 controllerIO:(_VCAudioIOControllerIOState *)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      int v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int state = self->_state;
        *(_DWORD *)buf = 136316418;
        uint64_t v23 = v8;
        __int16 v24 = 2080;
        uint64_t v25 = "-[VCAudioManager unregisterClientIO:controllerIO:]";
        __int16 v26 = 1024;
        int v27 = 1588;
        __int16 v28 = 2048;
        unsigned int v29 = a3;
        __int16 v30 = 2048;
        uint64_t v31 = a4;
        __int16 v32 = 1024;
        LODWORD(v33) = state;
        int v11 = " [%s] %s:%d Unregistering clientIO[%p] controllerIO[%p] in current manager state=%d";
        int v12 = v9;
        uint32_t v13 = 54;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v7 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      uint32_t v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v16 = self->_state;
        *(_DWORD *)buf = 136316930;
        uint64_t v23 = v14;
        __int16 v24 = 2080;
        uint64_t v25 = "-[VCAudioManager unregisterClientIO:controllerIO:]";
        __int16 v26 = 1024;
        int v27 = 1588;
        __int16 v28 = 2112;
        unsigned int v29 = (_VCAudioIOControllerClientIO *)v7;
        __int16 v30 = 2048;
        uint64_t v31 = self;
        __int16 v32 = 2048;
        __int16 v33 = a3;
        __int16 v34 = 2048;
        __int16 v35 = a4;
        __int16 v36 = 1024;
        unsigned int v37 = v16;
        int v11 = " [%s] %s:%d %@(%p) Unregistering clientIO[%p] controllerIO[%p] in current manager state=%d";
        int v12 = v15;
        uint32_t v13 = 74;
        goto LABEL_11;
      }
    }
  }
  uint64_t v17 = VCAudioManager_NewAudioEvent(1, (uint64_t)a3);
  long long v21 = v17;
  pthread_mutex_lock(&self->_interruptingMutex);
  if ([(VCAudioManager *)self audioCallbacksRunning])
  {
    if (CMSimpleQueueEnqueue(a4->eventQueue, v17))
    {
      if ((VCAudioManager *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCAudioManager unregisterClientIO:controllerIO:]();
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          dispatch_time_t v18 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
        }
        else {
          dispatch_time_t v18 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v19 = VRTraceErrorLogLevelToCSTR();
          uint64_t v20 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v23 = v19;
            __int16 v24 = 2080;
            uint64_t v25 = "-[VCAudioManager unregisterClientIO:controllerIO:]";
            __int16 v26 = 1024;
            int v27 = 1595;
            __int16 v28 = 2112;
            unsigned int v29 = (_VCAudioIOControllerClientIO *)v18;
            __int16 v30 = 2048;
            uint64_t v31 = self;
            _os_log_error_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) CMSimpleQueueEnqueue Full", buf, 0x30u);
          }
        }
      }
      VCAudioManager_ReleaseAudioEvent((uint64_t *)&v21, 0);
    }
  }
  else
  {
    _VCAudioManager_UnregisterClientIO((uint64_t)a4, (uint64_t)v17);
  }
  pthread_mutex_unlock(&self->_interruptingMutex);
}

- (void)completeStartForAllStartingClients
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  startingIOClients = self->_startingIOClients;
  uint64_t v4 = [(NSMutableArray *)startingIOClients countByEnumeratingWithState:&v30 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v31 != v6) {
          objc_enumerationMutation(startingIOClients);
        }
        uint64_t v8 = *(__CFString **)(*((void *)&v30 + 1) + 8 * i);
        if ((VCAudioManager *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            uint64_t v15 = VRTraceErrorLogLevelToCSTR();
            unsigned int v16 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              uint64_t v18 = v15;
              __int16 v19 = 2080;
              uint64_t v20 = "-[VCAudioManager completeStartForAllStartingClients]";
              __int16 v21 = 1024;
              int v22 = 1607;
              __int16 v23 = 2048;
              __int16 v24 = v8;
              int v12 = v16;
              uint32_t v13 = " [%s] %s:%d controller did start client (audioIO=%p)";
              uint32_t v14 = 38;
              goto LABEL_15;
            }
          }
        }
        else
        {
          int v9 = &stru_1F3D3E450;
          if (objc_opt_respondsToSelector()) {
            int v9 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            uint64_t v10 = VRTraceErrorLogLevelToCSTR();
            int v11 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316418;
              uint64_t v18 = v10;
              __int16 v19 = 2080;
              uint64_t v20 = "-[VCAudioManager completeStartForAllStartingClients]";
              __int16 v21 = 1024;
              int v22 = 1607;
              __int16 v23 = 2112;
              __int16 v24 = v9;
              __int16 v25 = 2048;
              __int16 v26 = self;
              __int16 v27 = 2048;
              __int16 v28 = v8;
              int v12 = v11;
              uint32_t v13 = " [%s] %s:%d %@(%p) controller did start client (audioIO=%p)";
              uint32_t v14 = 58;
LABEL_15:
              _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, v14);
            }
          }
        }
        objc_msgSend((id)-[__CFString delegate](v8, "delegate"), "didStart:error:", 1, 0);
      }
      uint64_t v5 = [(NSMutableArray *)startingIOClients countByEnumeratingWithState:&v30 objects:v29 count:16];
    }
    while (v5);
  }
  [(NSMutableArray *)self->_startingIOClients removeAllObjects];
}

- (void)activateStartingClient:(id)a3 applyControllerFormat:(BOOL)a4
{
  if (a3)
  {
    BOOL v4 = a4;
    if ((-[NSMutableArray containsObject:](self->_startingIOClients, "containsObject:") & 1) == 0)
    {
      if (v4)
      {
        int playbackMode = self->_playbackMode;
        uint64_t v8 = (void *)[a3 delegate];
        currentAudioUnitProperties = self->_currentAudioUnitProperties;
        if (playbackMode == 1) {
          uint64_t v10 = [(VCAudioUnitProperties *)currentAudioUnitProperties frameFormatSpeaker];
        }
        else {
          uint64_t v10 = [(VCAudioUnitProperties *)currentAudioUnitProperties frameFormatMic];
        }
        [v8 controllerFormatChanged:v10];
      }
      if ([a3 direction]) {
        -[VCAudioManager registerClientIO:controllerIO:](self, "registerClientIO:controllerIO:", [a3 sourceIO], &self->_sourceData);
      }
      if (([a3 direction] & 2) != 0) {
        -[VCAudioManager registerClientIO:controllerIO:](self, "registerClientIO:controllerIO:", [a3 sinkIO], &self->_sinkData);
      }
      startingIOClients = self->_startingIOClients;
      [(NSMutableArray *)startingIOClients addObject:a3];
    }
  }
}

- (void)applyControllerFormatToClients:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  allClients = self->_allClients;
  uint64_t v6 = [(NSMutableArray *)allClients countByEnumeratingWithState:&v16 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(allClients);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (([(VCAudioUnitProperties *)self->_currentAudioUnitProperties audioUnitType] != 2
           || [v10 deviceRole] == 2)
          && ([(VCAudioUnitProperties *)self->_currentAudioUnitProperties audioUnitType] != 1
           || [v10 deviceRole] != 2))
        {
          v14[0] = xmmword_1E259BBE0;
          memset(&v14[1], 170, 32);
          if (self->_playbackMode == 1) {
            int v11 = (long long *)objc_msgSend(a3, "frameFormatSpeaker", v14[0], v14[1], v14[2]);
          }
          else {
            int v11 = (long long *)objc_msgSend(a3, "frameFormatMic", v14[0], v14[1], v14[2]);
          }
          long long v12 = *v11;
          long long v13 = v11[2];
          v14[1] = v11[1];
          HIDWORD(v14[1]) = *(_DWORD *)(objc_msgSend(v10, "clientFormat", v12, v14[1], v13) + 28);
          objc_msgSend((id)objc_msgSend(v10, "delegate"), "controllerFormatChanged:", v14);
        }
      }
      uint64_t v7 = [(NSMutableArray *)allClients countByEnumeratingWithState:&v16 objects:v15 count:16];
    }
    while (v7);
  }
}

- (int)registerForMutedTalkerNotificationWithAUIO:(tagHANDLE *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a3 == (tagHANDLE *)0xFFFFFFFFLL
    || [(VCAudioUnitProperties *)self->_currentAudioUnitProperties audioUnitType] != 1
    || !self->_mutedTalkerNotificationHandler)
  {
    return 0;
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__VCAudioManager_registerForMutedTalkerNotificationWithAUIO___block_invoke;
  v15[3] = &unk_1E6DB3E68;
  v15[4] = self;
  int v5 = AUIORegisterMutedTalkerNotificationEventListener((uint64_t)a3, (uint64_t)v15);
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      int v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v17 = v8;
        __int16 v18 = 2080;
        long long v19 = "-[VCAudioManager registerForMutedTalkerNotificationWithAUIO:]";
        __int16 v20 = 1024;
        int v21 = 1675;
        __int16 v22 = 1024;
        LODWORD(v23) = v5;
        uint64_t v10 = " [%s] %s:%d Registered for mutedTalker notification. result=0x%08x";
        int v11 = v9;
        uint32_t v12 = 34;
LABEL_16:
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v6 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      uint32_t v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v17 = v13;
        __int16 v18 = 2080;
        long long v19 = "-[VCAudioManager registerForMutedTalkerNotificationWithAUIO:]";
        __int16 v20 = 1024;
        int v21 = 1675;
        __int16 v22 = 2112;
        __int16 v23 = v6;
        __int16 v24 = 2048;
        __int16 v25 = self;
        __int16 v26 = 1024;
        int v27 = v5;
        uint64_t v10 = " [%s] %s:%d %@(%p) Registered for mutedTalker notification. result=0x%08x";
        int v11 = v14;
        uint32_t v12 = 54;
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t __61__VCAudioManager_registerForMutedTalkerNotificationWithAUIO___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a2 <= 1)
  {
    uint64_t v3 = result;
    if (objc_opt_class() == *(void *)(result + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)(v3 + 32) + 936) + 16))(*(void *)(*(void *)(v3 + 32) + 936), a2, v5, v6, v7, v8, v9, v10);
      }
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint32_t v12 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)(v3 + 32) + 936) + 16))(*(void *)(*(void *)(v3 + 32) + 936), a2, v5, v6, v7, v8, v9, v10);
      }
      int v19 = 136315906;
      uint64_t v20 = v11;
      __int16 v21 = 2080;
      __int16 v22 = "-[VCAudioManager registerForMutedTalkerNotificationWithAUIO:]_block_invoke";
      __int16 v23 = 1024;
      int v24 = 1672;
      __int16 v25 = 1024;
      LODWORD(v26) = a2;
      uint64_t v13 = " [%s] %s:%d Handle mutedTalkerNotification type=%d";
      uint32_t v14 = v12;
      uint32_t v15 = 34;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        BOOL v4 = (__CFString *)[*(id *)(v3 + 32) performSelector:sel_logPrefix];
      }
      else {
        BOOL v4 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)(v3 + 32) + 936) + 16))(*(void *)(*(void *)(v3 + 32) + 936), a2, v5, v6, v7, v8, v9, v10);
      }
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      uint64_t v17 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)(v3 + 32) + 936) + 16))(*(void *)(*(void *)(v3 + 32) + 936), a2, v5, v6, v7, v8, v9, v10);
      }
      uint64_t v18 = *(void *)(v3 + 32);
      int v19 = 136316418;
      uint64_t v20 = v16;
      __int16 v21 = 2080;
      __int16 v22 = "-[VCAudioManager registerForMutedTalkerNotificationWithAUIO:]_block_invoke";
      __int16 v23 = 1024;
      int v24 = 1672;
      __int16 v25 = 2112;
      __int16 v26 = v4;
      __int16 v27 = 2048;
      uint64_t v28 = v18;
      __int16 v29 = 1024;
      int v30 = a2;
      uint64_t v13 = " [%s] %s:%d %@(%p) Handle mutedTalkerNotification type=%d";
      uint32_t v14 = v17;
      uint32_t v15 = 54;
    }
    _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v19, v15);
    return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)(v3 + 32) + 936) + 16))(*(void *)(*(void *)(v3 + 32) + 936), a2, v5, v6, v7, v8, v9, v10);
  }
  return result;
}

- (int)unregisterForMutedTalkerNotificationWithAUIO:(tagHANDLE *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a3 == (tagHANDLE *)0xFFFFFFFFLL
    || [(VCAudioUnitProperties *)self->_currentAudioUnitProperties audioUnitType] != 1
    || !self->_mutedTalkerNotificationHandler)
  {
    return 0;
  }
  int v5 = AUIORegisterMutedTalkerNotificationEventListener((uint64_t)a3, 0);
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136315906;
        uint64_t v16 = v8;
        __int16 v17 = 2080;
        uint64_t v18 = "-[VCAudioManager unregisterForMutedTalkerNotificationWithAUIO:]";
        __int16 v19 = 1024;
        int v20 = 1687;
        __int16 v21 = 1024;
        LODWORD(v22) = v5;
        uint64_t v10 = " [%s] %s:%d Unregistered from muted talker notification. result=0x%08x";
        uint64_t v11 = v9;
        uint32_t v12 = 34;
LABEL_16:
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v15, v12);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v6 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      uint32_t v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136316418;
        uint64_t v16 = v13;
        __int16 v17 = 2080;
        uint64_t v18 = "-[VCAudioManager unregisterForMutedTalkerNotificationWithAUIO:]";
        __int16 v19 = 1024;
        int v20 = 1687;
        __int16 v21 = 2112;
        __int16 v22 = v6;
        __int16 v23 = 2048;
        int v24 = self;
        __int16 v25 = 1024;
        int v26 = v5;
        uint64_t v10 = " [%s] %s:%d %@(%p) Unregistered from muted talker notification. result=0x%08x";
        uint64_t v11 = v14;
        uint32_t v12 = 54;
        goto LABEL_16;
      }
    }
  }
  return v5;
}

- (int)registerForMutedTalkerNotification:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    dispatchQueue = self->_dispatchQueue;
    int v12 = 0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__VCAudioManager_registerForMutedTalkerNotification___block_invoke;
    block[3] = &unk_1E6DB3E90;
    void block[5] = a3;
    block[6] = buf;
    block[4] = self;
    dispatch_sync(dispatchQueue, block);
    int v5 = *(_DWORD *)(*(void *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    int v5 = -2144534527;
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioManager registerForMutedTalkerNotification:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v7 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        uint64_t v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)&uint8_t buf[4] = v8;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "-[VCAudioManager registerForMutedTalkerNotification:]";
          *(_WORD *)&buf[22] = 1024;
          int v12 = 1694;
          __int16 v13 = 2112;
          uint32_t v14 = v7;
          __int16 v15 = 2048;
          uint64_t v16 = self;
          _os_log_error_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Muted talker notification handler is nil", buf, 0x30u);
        }
      }
    }
  }
  return v5;
}

void __53__VCAudioManager_registerForMutedTalkerNotification___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 936))
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = -2144534487;
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __53__VCAudioManager_registerForMutedTalkerNotification___block_invoke_cold_1();
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
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v5 = VRTraceErrorLogLevelToCSTR();
        uint64_t v6 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v7 = *(void *)(a1 + 32);
          int v8 = 136316162;
          uint64_t v9 = v5;
          __int16 v10 = 2080;
          uint64_t v11 = "-[VCAudioManager registerForMutedTalkerNotification:]_block_invoke";
          __int16 v12 = 1024;
          int v13 = 1701;
          __int16 v14 = 2112;
          __int16 v15 = v2;
          __int16 v16 = 2048;
          uint64_t v17 = v7;
          _os_log_error_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Muted talker notification handler already registered", (uint8_t *)&v8, 0x30u);
        }
      }
    }
  }
  else
  {
    *(void *)(*(void *)(a1 + 32) + 936) = _Block_copy(*(const void **)(a1 + 40));
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = v3[21];
    [v3 registerForMutedTalkerNotificationWithAUIO:v4];
  }
}

- (int)unregisterFromMutedTalkerNotification
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__VCAudioManager_unregisterFromMutedTalkerNotification__block_invoke;
  block[3] = &unk_1E6DB3EB8;
  block[4] = self;
  void block[5] = &v6;
  dispatch_sync(dispatchQueue, block);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __55__VCAudioManager_unregisterFromMutedTalkerNotification__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[117])
  {
    [v2 unregisterForMutedTalkerNotificationWithAUIO:v2[21]];
    _Block_release(*(const void **)(*(void *)(a1 + 32) + 936));
    *(void *)(*(void *)(a1 + 32) + 936) = 0;
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -2144534507;
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __55__VCAudioManager_unregisterFromMutedTalkerNotification__block_invoke_cold_1();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v3 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        int v3 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v4 = VRTraceErrorLogLevelToCSTR();
        uint64_t v5 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v6 = *(void *)(a1 + 32);
          int v7 = 136316162;
          uint64_t v8 = v4;
          __int16 v9 = 2080;
          uint64_t v10 = "-[VCAudioManager unregisterFromMutedTalkerNotification]_block_invoke";
          __int16 v11 = 1024;
          int v12 = 1715;
          __int16 v13 = 2112;
          __int16 v14 = v3;
          __int16 v15 = 2048;
          uint64_t v16 = v6;
          _os_log_error_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Muted talker notification handler not registered", (uint8_t *)&v7, 0x30u);
        }
      }
    }
  }
}

- (int)registerAudioSessionId:(unsigned int)a3 maxChannelCountMic:(unsigned int)a4 maxChannelCountSpeaker:(unsigned int)a5 spatialMetadata:(OpaqueCMBlockBuffer *)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  uint64_t v9 = *(void *)&a3;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      __int16 v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v29 = v12;
        __int16 v30 = 2080;
        uint64_t v31 = "-[VCAudioManager registerAudioSessionId:maxChannelCountMic:maxChannelCountSpeaker:spatialMetadata:]";
        __int16 v32 = 1024;
        int v33 = 1734;
        __int16 v34 = 1024;
        LODWORD(v35) = v9;
        __int16 v14 = " [%s] %s:%d Register session context for audioSessionId=%u";
        __int16 v15 = v13;
        uint32_t v16 = 34;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      __int16 v11 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v11 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      uint64_t v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v29 = v17;
        __int16 v30 = 2080;
        uint64_t v31 = "-[VCAudioManager registerAudioSessionId:maxChannelCountMic:maxChannelCountSpeaker:spatialMetadata:]";
        __int16 v32 = 1024;
        int v33 = 1734;
        __int16 v34 = 2112;
        __int16 v35 = v11;
        __int16 v36 = 2048;
        unsigned int v37 = self;
        __int16 v38 = 1024;
        int v39 = v9;
        __int16 v14 = " [%s] %s:%d %@(%p) Register session context for audioSessionId=%u";
        __int16 v15 = v18;
        uint32_t v16 = 54;
        goto LABEL_11;
      }
    }
  }
  __int16 v19 = [[VCAudioUnitSpatialContext alloc] initWithAudioSessionId:v9 maxChannelCountMic:v8 maxChannelCountSpeaker:v7 spatialMetadata:a6];
  if (v19)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __99__VCAudioManager_registerAudioSessionId_maxChannelCountMic_maxChannelCountSpeaker_spatialMetadata___block_invoke;
    block[3] = &unk_1E6DB3EE0;
    int v27 = v9;
    block[4] = self;
    void block[5] = v19;
    dispatch_async(dispatchQueue, block);
    int v21 = 0;
  }
  else
  {
    int v21 = -2144534525;
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioManager registerAudioSessionId:maxChannelCountMic:maxChannelCountSpeaker:spatialMetadata:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v23 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v23 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v24 = VRTraceErrorLogLevelToCSTR();
        __int16 v25 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          uint64_t v29 = v24;
          __int16 v30 = 2080;
          uint64_t v31 = "-[VCAudioManager registerAudioSessionId:maxChannelCountMic:maxChannelCountSpeaker:spatialMetadata:]";
          __int16 v32 = 1024;
          int v33 = 1740;
          __int16 v34 = 2112;
          __int16 v35 = v23;
          __int16 v36 = 2048;
          unsigned int v37 = self;
          __int16 v38 = 1024;
          int v39 = v9;
          _os_log_error_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate audio session context for audioSessionId=%u", buf, 0x36u);
        }
      }
    }
  }

  return v21;
}

void __99__VCAudioManager_registerAudioSessionId_maxChannelCountMic_maxChannelCountSpeaker_spatialMetadata___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(*(id *)(*(void *)(a1 + 32) + 912), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48))))
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __99__VCAudioManager_registerAudioSessionId_maxChannelCountMic_maxChannelCountSpeaker_spatialMetadata___block_invoke_cold_1();
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
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        uint64_t v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v8 = *(void *)(a1 + 32);
          int v9 = *(_DWORD *)(a1 + 48);
          int v10 = 136316418;
          uint64_t v11 = v6;
          __int16 v12 = 2080;
          __int16 v13 = "-[VCAudioManager registerAudioSessionId:maxChannelCountMic:maxChannelCountSpeaker:spatialMetadata:]_block_invoke";
          __int16 v14 = 1024;
          int v15 = 1746;
          __int16 v16 = 2112;
          uint64_t v17 = v2;
          __int16 v18 = 2048;
          uint64_t v19 = v8;
          __int16 v20 = 1024;
          int v21 = v9;
          _os_log_error_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Session context for audioSessionId=%u is already registered", (uint8_t *)&v10, 0x36u);
        }
      }
    }
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 912);
    uint64_t v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
    [v4 setObject:v3 forKeyedSubscript:v5];
  }
}

- (void)unregisterAudioSessionId:(unsigned int)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v17 = v6;
        __int16 v18 = 2080;
        uint64_t v19 = "-[VCAudioManager unregisterAudioSessionId:]";
        __int16 v20 = 1024;
        int v21 = 1755;
        __int16 v22 = 1024;
        LODWORD(v23) = a3;
        uint64_t v8 = " [%s] %s:%d Unregister session context for audioSessionId=%u";
        int v9 = v7;
        uint32_t v10 = 34;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      __int16 v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v17 = v11;
        __int16 v18 = 2080;
        uint64_t v19 = "-[VCAudioManager unregisterAudioSessionId:]";
        __int16 v20 = 1024;
        int v21 = 1755;
        __int16 v22 = 2112;
        __int16 v23 = v5;
        __int16 v24 = 2048;
        __int16 v25 = self;
        __int16 v26 = 1024;
        unsigned int v27 = a3;
        uint64_t v8 = " [%s] %s:%d %@(%p) Unregister session context for audioSessionId=%u";
        int v9 = v12;
        uint32_t v10 = 54;
        goto LABEL_11;
      }
    }
  }
  dispatchQueue = self->_dispatchQueue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __43__VCAudioManager_unregisterAudioSessionId___block_invoke;
  _OWORD v14[3] = &unk_1E6DB3F08;
  v14[4] = self;
  unsigned int v15 = a3;
  dispatch_async(dispatchQueue, v14);
}

void __43__VCAudioManager_unregisterAudioSessionId___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (unsigned int *)(a1 + 40);
  if (objc_msgSend(*(id *)(*(void *)(a1 + 32) + 912), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40))))
  {
    uint64_t v3 = *(void **)(*((void *)v2 - 1) + 912);
    uint64_t v4 = [NSNumber numberWithUnsignedInt:*v2];
    [v3 setObject:0 forKeyedSubscript:v4];
  }
  else if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __43__VCAudioManager_unregisterAudioSessionId___block_invoke_cold_1();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        int v9 = *(_DWORD *)(a1 + 40);
        int v10 = 136316418;
        uint64_t v11 = v6;
        __int16 v12 = 2080;
        __int16 v13 = "-[VCAudioManager unregisterAudioSessionId:]_block_invoke";
        __int16 v14 = 1024;
        int v15 = 1761;
        __int16 v16 = 2112;
        uint64_t v17 = v5;
        __int16 v18 = 2048;
        uint64_t v19 = v8;
        __int16 v20 = 1024;
        int v21 = v9;
        _os_log_error_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Session context for audioSessionId=%u is not registered", (uint8_t *)&v10, 0x36u);
      }
    }
  }
}

- (void)setSpatialMetadata:(OpaqueCMBlockBuffer *)a3 audioSessionId:(unsigned int)a4 completionHandler:(id)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3) {
    CFRetain(a3);
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__VCAudioManager_setSpatialMetadata_audioSessionId_completionHandler___block_invoke;
  block[3] = &unk_1E6DB3F30;
  unsigned int v11 = a4;
  void block[5] = a5;
  void block[6] = a3;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __70__VCAudioManager_setSpatialMetadata_audioSessionId_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 912), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 56)));
  if (v2)
  {
    uint64_t v3 = v2;
    [v2 setSpatialMetadata:*(void *)(a1 + 48)];
    uint64_t v4 = *(void **)(a1 + 32);
    if ((void *)v4[116] == v3) {
      [v4 applySpatialMetadata:*(void *)(a1 + 48)];
    }
  }
  else if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __70__VCAudioManager_setSpatialMetadata_audioSessionId_completionHandler___block_invoke_cold_1();
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
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        int v10 = *(_DWORD *)(a1 + 56);
        int v11 = 136316418;
        uint64_t v12 = v7;
        __int16 v13 = 2080;
        __int16 v14 = "-[VCAudioManager setSpatialMetadata:audioSessionId:completionHandler:]_block_invoke";
        __int16 v15 = 1024;
        int v16 = 1771;
        __int16 v17 = 2112;
        __int16 v18 = v6;
        __int16 v19 = 2048;
        uint64_t v20 = v9;
        __int16 v21 = 1024;
        int v22 = v10;
        _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Spatial context for audioSessionId=%u is not registered", (uint8_t *)&v11, 0x36u);
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v5 = *(const void **)(a1 + 48);
  if (v5) {
    CFRelease(v5);
  }
}

- (void)applySessionContextToAudioUnitProperties:(id)a3 preferredClient:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (self->_spatialAudioDisabled)
  {
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        __int16 v13 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          BOOL spatialAudioDisabled = self->_spatialAudioDisabled;
          int v21 = 136315906;
          uint64_t v22 = v12;
          __int16 v23 = 2080;
          __int16 v24 = "-[VCAudioManager applySessionContextToAudioUnitProperties:preferredClient:]";
          __int16 v25 = 1024;
          int v26 = 1785;
          __int16 v27 = 1024;
          LODWORD(v28) = spatialAudioDisabled;
          __int16 v15 = " [%s] %s:%d skip spatial context _spatialAudioDisabled=%d";
          int v16 = v13;
          uint32_t v17 = 34;
LABEL_16:
          _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v21, v17);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v5 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
        __int16 v19 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          BOOL v20 = self->_spatialAudioDisabled;
          int v21 = 136316418;
          uint64_t v22 = v18;
          __int16 v23 = 2080;
          __int16 v24 = "-[VCAudioManager applySessionContextToAudioUnitProperties:preferredClient:]";
          __int16 v25 = 1024;
          int v26 = 1785;
          __int16 v27 = 2112;
          uint64_t v28 = v5;
          __int16 v29 = 2048;
          __int16 v30 = self;
          __int16 v31 = 1024;
          BOOL v32 = v20;
          __int16 v15 = " [%s] %s:%d %@(%p) skip spatial context _spatialAudioDisabled=%d";
          int v16 = v19;
          uint32_t v17 = 54;
          goto LABEL_16;
        }
      }
    }
  }
  else
  {
    uint64_t v7 = [a4 audioSessionId];
    uint64_t v8 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_spatialContexts, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v7]);
    if (v8)
    {
      uint64_t v9 = v8;
      int v10 = [v8 maxChannelCountMic];
      *(_DWORD *)([a3 frameFormatMic] + 28) = v10;
      int v11 = [v9 maxChannelCountSpeaker];
      *(_DWORD *)([a3 frameFormatSpeaker] + 28) = v11;
      [a3 setSpatialContext:v9];
      [a3 setVpEnableSpatialChat:1];
    }
  }
}

- (void)applySpatialMetadata:(OpaqueCMBlockBuffer *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v22 = 0;
  size_t totalLengthOut = 0;
  if (!a3) {
    return;
  }
  OSStatus DataPointer = CMBlockBufferGetDataPointer(a3, 0, 0, &totalLengthOut, &v22);
  if (DataPointer)
  {
    OSStatus v7 = DataPointer;
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        return;
      }
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      *(_DWORD *)buf = 136315906;
      uint64_t v25 = v11;
      __int16 v26 = 2080;
      __int16 v27 = "-[VCAudioManager applySpatialMetadata:]";
      __int16 v28 = 1024;
      int v29 = 1806;
      __int16 v30 = 1024;
      LODWORD(v31) = v7;
      __int16 v13 = " [%s] %s:%d Failed to retrieve the metadata buffer. osStatus=%d";
      __int16 v14 = v12;
      uint32_t v15 = 34;
LABEL_26:
      _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
      return;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v8 = (__CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix, v22);
    }
    else {
      uint64_t v8 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      return;
    }
    uint64_t v18 = VRTraceErrorLogLevelToCSTR();
    __int16 v19 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 136316418;
    uint64_t v25 = v18;
    __int16 v26 = 2080;
    __int16 v27 = "-[VCAudioManager applySpatialMetadata:]";
    __int16 v28 = 1024;
    int v29 = 1806;
    __int16 v30 = 2112;
    __int16 v31 = (OpaqueCMBlockBuffer *)v8;
    __int16 v32 = 2048;
    size_t v33 = (size_t)self;
    __int16 v34 = 1024;
    LODWORD(v35) = v7;
    __int16 v13 = " [%s] %s:%d %@(%p) Failed to retrieve the metadata buffer. osStatus=%d";
    __int16 v14 = v19;
LABEL_21:
    uint32_t v15 = 54;
    goto LABEL_26;
  }
  int v6 = AUIOSetSpatialMetadata();
  if ((v6 & 0x80000000) == 0) {
    return;
  }
  int v9 = v6;
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      return;
    }
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    uint32_t v17 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 136316418;
    uint64_t v25 = v16;
    __int16 v26 = 2080;
    __int16 v27 = "-[VCAudioManager applySpatialMetadata:]";
    __int16 v28 = 1024;
    int v29 = 1808;
    __int16 v30 = 2048;
    __int16 v31 = a3;
    __int16 v32 = 2048;
    size_t v33 = totalLengthOut;
    __int16 v34 = 1024;
    LODWORD(v35) = v9;
    __int16 v13 = " [%s] %s:%d Failed to apply the metadata buffer. spatialMetadata=%p, dataBufferLength=%zu, status=%08x";
    __int16 v14 = v17;
    goto LABEL_21;
  }
  if (objc_opt_respondsToSelector()) {
    int v10 = (__CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix, v22);
  }
  else {
    int v10 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v20 = VRTraceErrorLogLevelToCSTR();
    int v21 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316930;
      uint64_t v25 = v20;
      __int16 v26 = 2080;
      __int16 v27 = "-[VCAudioManager applySpatialMetadata:]";
      __int16 v28 = 1024;
      int v29 = 1808;
      __int16 v30 = 2112;
      __int16 v31 = (OpaqueCMBlockBuffer *)v10;
      __int16 v32 = 2048;
      size_t v33 = (size_t)self;
      __int16 v34 = 2048;
      __int16 v35 = a3;
      __int16 v36 = 2048;
      size_t v37 = totalLengthOut;
      __int16 v38 = 1024;
      int v39 = v9;
      __int16 v13 = " [%s] %s:%d %@(%p) Failed to apply the metadata buffer. spatialMetadata=%p, dataBufferLength=%zu, status=%08x";
      __int16 v14 = v21;
      uint32_t v15 = 74;
      goto LABEL_26;
    }
  }
}

- (void)setupSpatialContextWithAudioUnitProperties:(id)a3 forceUpdate:(BOOL)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v7 = [a3 spatialContext];
  uint64_t v8 = (void *)v7;
  currentSpatialContext = self->_currentSpatialContext;
  if (a4 || (VCAudioUnitSpatialContext *)v7 != currentSpatialContext)
  {

    int v10 = v8;
    self->_currentSpatialContext = v10;
    uint64_t v11 = [(VCAudioUnitSpatialContext *)v10 spatialMetadata];
    [(VCAudioManager *)self applySpatialMetadata:v11];
  }
}

- (BOOL)setupVAD
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (self->_playbackMode)
  {
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        BOOL v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v4) {
          return v4;
        }
        -[VCAudioManager setupVAD]();
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v5 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        __int16 v14 = *MEMORY[0x1E4F47A50];
        BOOL v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v4) {
          return v4;
        }
        int v19 = 136316162;
        uint64_t v20 = v13;
        __int16 v21 = 2080;
        uint64_t v22 = "-[VCAudioManager setupVAD]";
        __int16 v23 = 1024;
        int v24 = 1855;
        __int16 v25 = 2112;
        __int16 v26 = v5;
        __int16 v27 = 2048;
        __int16 v28 = self;
        _os_log_error_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Incorrect playback mode", (uint8_t *)&v19, 0x30u);
      }
    }
    goto LABEL_26;
  }
  uint64_t v3 = (opaqueVCVoiceDetector *)VCVoiceDetector_Create(0);
  self->_sinkData.voiceDetector = v3;
  if (v3)
  {
    LOBYTE(v4) = 1;
    return v4;
  }
  if ((VCAudioManager *)objc_opt_class() != self)
  {
    if (objc_opt_respondsToSelector()) {
      int v6 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
    }
    else {
      int v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      goto LABEL_26;
    }
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    uint64_t v16 = *MEMORY[0x1E4F47A50];
    BOOL v17 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
    LOBYTE(v4) = 0;
    if (!v17) {
      return v4;
    }
    int v19 = 136316162;
    uint64_t v20 = v15;
    __int16 v21 = 2080;
    uint64_t v22 = "-[VCAudioManager setupVAD]";
    __int16 v23 = 1024;
    int v24 = 1861;
    __int16 v25 = 2112;
    __int16 v26 = v6;
    __int16 v27 = 2048;
    __int16 v28 = self;
    int v10 = " [%s] %s:%d %@(%p) Failed to create the VAD";
    uint64_t v11 = v16;
    uint32_t v12 = 48;
    goto LABEL_25;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
    LOBYTE(v4) = 0;
    if (!v9) {
      return v4;
    }
    int v19 = 136315650;
    uint64_t v20 = v7;
    __int16 v21 = 2080;
    uint64_t v22 = "-[VCAudioManager setupVAD]";
    __int16 v23 = 1024;
    int v24 = 1861;
    int v10 = " [%s] %s:%d Failed to create the VAD";
    uint64_t v11 = v8;
    uint32_t v12 = 28;
LABEL_25:
    _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v19, v12);
  }
LABEL_26:
  LOBYTE(v4) = 0;
  return v4;
}

- (void)startVADWithAudioUnitProperties:(id)a3
{
  if (!self->_playbackMode)
  {
    self->_sinkData.isForcedMediaPriorityEnabled = [+[VCDefaults sharedInstance] forceAudioPriorityEnabled];
    self->_sinkData.forcedMediaPriorityLastUpdateTime = -1.79769313e308;
    voiceDetector = self->_sinkData.voiceDetector;
    uint64_t v6 = [a3 frameFormatMic];
    VCVoiceDetector_Start(voiceDetector, v6);
  }
}

- (void)resetChannelMask
{
  *(_OWORD *)&self->_sourceData.channelStateBitmap = 0u;
  *(_OWORD *)&self->_sinkData.channelStateBitmap = 0u;
}

- (BOOL)stateIdleWithAudioUnitProperties:(id)a3 sessionProperties:(id)a4 client:(id)a5 newState:(unsigned int *)a6
{
  *a6 = 1;
  if (![(NSMutableArray *)self->_allClients count])
  {
    [(VCAudioManager *)self resetAudioTimestamps];
    [(NSMutableDictionary *)self->_audioSessionSinkMuted removeAllObjects];
    goto LABEL_5;
  }
  BOOL v9 = [(VCAudioManager *)self startAudioSessionWithProperties:a4];
  if (v9)
  {
    self->_isSuspended = 0;
    *a6 = 2;
LABEL_5:
    LOBYTE(v9) = 1;
  }
  return v9;
}

- (void)enterStateStarted
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (self->_state - 3 <= 1)
  {
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v4 = VRTraceErrorLogLevelToCSTR();
        uint64_t v5 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          unsigned int state = self->_state;
          *(_DWORD *)__int16 v23 = 136316418;
          *(void *)&v23[4] = v4;
          *(_WORD *)&v23[12] = 2080;
          *(void *)&v23[14] = "-[VCAudioManager enterStateStarted]";
          *(_WORD *)&v23[22] = 1024;
          LODWORD(v24) = 1965;
          WORD2(v24) = 2048;
          *(void *)((char *)&v24 + 6) = self;
          HIWORD(v24) = 2048;
          p_sourceData = &self->_sourceData;
          *(_WORD *)__int16 v26 = 1024;
          *(_DWORD *)&v26[2] = state;
          uint64_t v7 = " [%s] %s:%d [%p] Flushing eventQueue of source controllerIO[%p] in current manager state=%d";
          uint64_t v8 = v5;
          uint32_t v9 = 54;
LABEL_12:
          _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, v23, v9);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v3 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v3 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        uint64_t v11 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v12 = self->_state;
          *(_DWORD *)__int16 v23 = 136316930;
          *(void *)&v23[4] = v10;
          *(_WORD *)&v23[12] = 2080;
          *(void *)&v23[14] = "-[VCAudioManager enterStateStarted]";
          *(_WORD *)&v23[22] = 1024;
          LODWORD(v24) = 1965;
          WORD2(v24) = 2112;
          *(void *)((char *)&v24 + 6) = v3;
          HIWORD(v24) = 2048;
          p_sourceData = self;
          *(_WORD *)__int16 v26 = 2048;
          *(void *)&v26[2] = self;
          *(_WORD *)&v26[10] = 2048;
          *(void *)&v26[12] = &self->_sourceData;
          *(_WORD *)&v26[20] = 1024;
          *(_DWORD *)&v26[22] = v12;
          uint64_t v7 = " [%s] %s:%d %@(%p) [%p] Flushing eventQueue of source controllerIO[%p] in current manager state=%d";
          uint64_t v8 = v11;
          uint32_t v9 = 74;
          goto LABEL_12;
        }
      }
    }
    -[VCAudioManager flushEventQueue:](self, "flushEventQueue:", self->_sourceData.eventQueue, *(_OWORD *)v23, *(void *)&v23[16], v24, p_sourceData, *(_OWORD *)v26, *(_OWORD *)&v26[16]);
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_24;
      }
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      uint64_t v15 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      unsigned int v16 = self->_state;
      *(_DWORD *)__int16 v23 = 136316418;
      *(void *)&v23[4] = v14;
      *(_WORD *)&v23[12] = 2080;
      *(void *)&v23[14] = "-[VCAudioManager enterStateStarted]";
      *(_WORD *)&v23[22] = 1024;
      LODWORD(v24) = 1967;
      WORD2(v24) = 2048;
      *(void *)((char *)&v24 + 6) = self;
      HIWORD(v24) = 2048;
      p_sourceData = &self->_sinkData;
      *(_WORD *)__int16 v26 = 1024;
      *(_DWORD *)&v26[2] = v16;
      BOOL v17 = " [%s] %s:%d [%p] Flushing eventQueue of sink controllerIO[%p] in current manager state=%d";
      uint64_t v18 = v15;
      uint32_t v19 = 54;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v13 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v13 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_24;
      }
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      __int16 v21 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      unsigned int v22 = self->_state;
      *(_DWORD *)__int16 v23 = 136316930;
      *(void *)&v23[4] = v20;
      *(_WORD *)&v23[12] = 2080;
      *(void *)&v23[14] = "-[VCAudioManager enterStateStarted]";
      *(_WORD *)&v23[22] = 1024;
      LODWORD(v24) = 1967;
      WORD2(v24) = 2112;
      *(void *)((char *)&v24 + 6) = v13;
      HIWORD(v24) = 2048;
      p_sourceData = self;
      *(_WORD *)__int16 v26 = 2048;
      *(void *)&v26[2] = self;
      *(_WORD *)&v26[10] = 2048;
      *(void *)&v26[12] = &self->_sinkData;
      *(_WORD *)&v26[20] = 1024;
      *(_DWORD *)&v26[22] = v22;
      BOOL v17 = " [%s] %s:%d %@(%p) [%p] Flushing eventQueue of sink controllerIO[%p] in current manager state=%d";
      uint64_t v18 = v21;
      uint32_t v19 = 74;
    }
    _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, v17, v23, v19);
LABEL_24:
    -[VCAudioManager flushEventQueue:](self, "flushEventQueue:", self->_sinkData.eventQueue, *(void *)v23, *(_OWORD *)&v23[8], v24, p_sourceData, *(void *)v26, *(void *)&v26[8], *(void *)&v26[16], *(void *)&v26[24]);
    [(VCAudioManager *)self removeAllClientsForIO:&self->_sinkData];
    [(VCAudioManager *)self removeAllClientsForIO:&self->_sourceData];
    VCAudioBufferList_Destroy((uint64_t *)&self->_sourceData.secondarySampleBuffer);
    VCAudioBufferList_Destroy((uint64_t *)&self->_sourceData.interruptMixDownSampleBuffer);
    [(VCAudioManager *)self setCurrentAudioUnitProperties:0];
  }
}

- (BOOL)stateSessionStartedWithAudioUnitProperties:(id)a3 sessionProperties:(id)a4 client:(id)a5 newState:(unsigned int *)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  *a6 = 2;
  if ([(NSMutableArray *)self->_allClients count]
    && (int v11 = -[VCAudioSessionMediaProperties isSessionActive](self->_currentAudioSessionMediaProperties, "isSessionActive"), v11 == [a4 isSessionActive]))
  {
    uint64_t v27 = a6;
    if (a5 && ([(NSMutableArray *)self->_startingIOClients containsObject:a5] & 1) == 0)
    {
      [(NSMutableArray *)self->_startingIOClients addObject:a5];
      int v26 = 1;
    }
    else
    {
      int v26 = 0;
    }
    if (-[VCAudioManager shouldResetAudioSessionWithProperties:](self, "shouldResetAudioSessionWithProperties:", a4, a5))
    {
      [(VCAudioManager *)self resetAudioSessionWithProperties:a4 interruptSuccessful:0];
    }
    [(VCAudioManager *)self setCurrentAudioUnitProperties:a3];
    VCAudioBufferList_AllocateFrame((uint64_t)[(VCAudioUnitProperties *)self->_currentAudioUnitProperties frameFormatSpeaker], &self->_sourceData.secondarySampleBuffer);
    p_sourceData = &self->_sourceData;
    VCAudioBufferList_AllocateFrame((uint64_t)[(VCAudioUnitProperties *)self->_currentAudioUnitProperties frameFormatMic], &self->_sourceData.interruptMixDownSampleBuffer);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    allClients = self->_allClients;
    uint64_t v15 = [(NSMutableArray *)allClients countByEnumeratingWithState:&v38 objects:v37 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v39 != v17) {
            objc_enumerationMutation(allClients);
          }
          uint32_t v19 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          if (([(VCAudioUnitProperties *)self->_currentAudioUnitProperties audioUnitType] != 2
             || [v19 deviceRole] == 2)
            && ([(VCAudioUnitProperties *)self->_currentAudioUnitProperties audioUnitType] != 1
             || [v19 deviceRole] != 2))
          {
            int playbackMode = self->_playbackMode;
            __int16 v21 = (void *)[v19 delegate];
            if (playbackMode == 1) {
              uint64_t v22 = [a3 frameFormatSpeaker];
            }
            else {
              uint64_t v22 = [a3 frameFormatMic];
            }
            [v21 controllerFormatChanged:v22];
            if (([v19 direction] & 2) != 0) {
              -[VCAudioManager registerClientIO:controllerIO:](self, "registerClientIO:controllerIO:", [v19 sinkIO], &self->_sinkData);
            }
            if ([v19 direction]) {
              -[VCAudioManager registerClientIO:controllerIO:](self, "registerClientIO:controllerIO:", [v19 sourceIO], p_sourceData);
            }
          }
        }
        uint64_t v16 = [(NSMutableArray *)allClients countByEnumeratingWithState:&v38 objects:v37 count:16];
      }
      while (v16);
    }
    [(VCAudioManager *)self resetChannelMask];
    if ([(VCAudioManager *)self startAUIOWithProperties:a3])
    {
      *uint64_t v27 = 3;
      if (VCDefaults_GetBoolValueForKey(@"forceMixingVoiceWithMediaEnabled", self->_isMixingVoiceWithMediaEnabled))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v23 = VRTraceErrorLogLevelToCSTR();
          long long v24 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            uint64_t v30 = v23;
            __int16 v31 = 2080;
            __int16 v32 = "-[VCAudioManager stateSessionStartedWithAudioUnitProperties:sessionProperties:client:newState:]";
            __int16 v33 = 1024;
            int v34 = 2024;
            __int16 v35 = 1024;
            int v36 = 1;
            _os_log_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting Voice Mixing Enabled=%d", buf, 0x22u);
          }
        }
        BOOL v12 = 1;
        [(VCAudioManager *)self setMixingVoiceWithMediaEnabled:1];
      }
      else
      {
        return 1;
      }
    }
    else
    {
      VCAudioBufferList_Destroy((uint64_t *)&self->_sourceData.secondarySampleBuffer);
      VCAudioBufferList_Destroy((uint64_t *)&self->_sourceData.interruptMixDownSampleBuffer);
      [(VCAudioManager *)self removeAllClientsForIO:&self->_sinkData];
      [(VCAudioManager *)self removeAllClientsForIO:p_sourceData];
      if (v26) {
        -[NSMutableArray removeObject:](self->_startingIOClients, "removeObject:", [v25 delegate]);
      }
      return 0;
    }
  }
  else
  {
    self->_isSuspended = 0;
    [(VCAudioManager *)self stopAudioSession];
    BOOL v12 = 1;
    *a6 = 1;
  }
  return v12;
}

- (BOOL)stateRunningShouldTransitionToStarted:(id)a3
{
  if (![(NSMutableArray *)self->_allClients count]) {
    return 1;
  }
  unsigned int v5 = [(VCAudioUnitProperties *)self->_currentAudioUnitProperties audioUnitType];
  return v5 != [a3 audioUnitType];
}

- (BOOL)stateRunningShouldTransitionToInterrupted:(id)a3
{
  return ![(VCAudioManager *)self stateRunningShouldTransitionToStarted:a3]
      && self->_isSuspended;
}

- (void)stateRunningToSessionStarted
{
  [(VCAudioManager *)self stopAUIO];

  [(VCAudioManager *)self enterStateStarted];
}

- (void)stateTransitionRunningToInterrupted
{
  [(VCAudioManager *)self stopAUIO];

  [(VCAudioManager *)self startInterruptThread];
}

- (BOOL)stateRunningWithAudioUnitProperties:(id)a3 sessionProperties:(id)a4 client:(id)a5 newState:(unsigned int *)a6
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  *a6 = 3;
  if (-[VCAudioManager stateRunningShouldTransitionToStarted:](self, "stateRunningShouldTransitionToStarted:"))
  {
    [(VCAudioManager *)self stateRunningToSessionStarted];
    unsigned int v11 = 2;
LABEL_5:
    *a6 = v11;
LABEL_50:
    LOBYTE(v40) = 1;
    return v40;
  }
  if ([(VCAudioManager *)self stateRunningShouldTransitionToInterrupted:a3])
  {
    [(VCAudioManager *)self stateTransitionRunningToInterrupted];
    unsigned int v11 = 4;
    goto LABEL_5;
  }
  BOOL v12 = [(VCAudioManager *)self shouldResetAudioSessionWithProperties:a4];
  int v13 = [(VCAudioManager *)self shouldResetAudioUnitWithProperties:a3];
  int v14 = v13 | v12;
  if ((v13 | v12) != 1) {
    goto LABEL_21;
  }
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_18;
    }
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    uint64_t v17 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    int v44 = [a3 audioSessionId];
    int v18 = *(_DWORD *)([a3 frameFormatMic] + 40);
    *(_DWORD *)buf = 136316162;
    uint64_t v47 = v16;
    __int16 v48 = 2080;
    int v49 = "-[VCAudioManager stateRunningWithAudioUnitProperties:sessionProperties:client:newState:]";
    __int16 v50 = 1024;
    int v51 = 2078;
    __int16 v52 = 1024;
    *(_DWORD *)uint64_t v53 = v44;
    *(_WORD *)&v53[4] = 1024;
    *(_DWORD *)&v53[6] = v18;
    uint32_t v19 = " [%s] %s:%d [CMSession]:%u reset audio unit: %d";
    uint64_t v20 = v17;
    uint32_t v21 = 40;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v15 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v15 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_18;
    }
    uint64_t v45 = VRTraceErrorLogLevelToCSTR();
    uint64_t v22 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    int v43 = [a3 audioSessionId];
    unsigned int v23 = *(_DWORD *)([a3 frameFormatMic] + 40);
    *(_DWORD *)buf = 136316674;
    uint64_t v47 = v45;
    __int16 v48 = 2080;
    int v49 = "-[VCAudioManager stateRunningWithAudioUnitProperties:sessionProperties:client:newState:]";
    __int16 v50 = 1024;
    int v51 = 2078;
    __int16 v52 = 2112;
    *(void *)uint64_t v53 = v15;
    *(_WORD *)&v53[8] = 2048;
    int v54 = self;
    __int16 v55 = 1024;
    int v56 = v43;
    __int16 v57 = 1024;
    unsigned int v58 = v23;
    uint32_t v19 = " [%s] %s:%d %@(%p) [CMSession]:%u reset audio unit: %d";
    uint64_t v20 = v22;
    uint32_t v21 = 60;
  }
  _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
LABEL_18:
  int v24 = AUIOSuspend((uint64_t)self->_hAUIO, v13);
  if (v24 < 0 && v24 != -2145714174)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v40 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v40) {
        return v40;
      }
      -[VCAudioManager stateRunningWithAudioUnitProperties:sessionProperties:client:newState:]();
    }
    goto LABEL_67;
  }
  VCAudioBufferList_Destroy((uint64_t *)&self->_sourceData.secondarySampleBuffer);
  VCAudioBufferList_Destroy((uint64_t *)&self->_sourceData.interruptMixDownSampleBuffer);
  [(VCAudioManager *)self applyControllerFormatToClients:a3];
LABEL_21:
  if (v12
    && ![(VCAudioManager *)self resetAudioSessionWithProperties:a4 interruptSuccessful:0])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v40 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v40) {
        return v40;
      }
      -[VCAudioManager stateRunningWithAudioUnitProperties:sessionProperties:client:newState:].cold.6();
    }
    goto LABEL_67;
  }
  if (v13) {
    VCVoiceDetector_Stop(self->_sinkData.voiceDetector);
  }
  unsigned int audioSessionId = self->_sourceData.audioSessionId;
  if (audioSessionId == [a3 audioSessionId]) {
    goto LABEL_37;
  }
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_37;
    }
    uint64_t v27 = VRTraceErrorLogLevelToCSTR();
    __int16 v28 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_37;
    }
    int v29 = [a3 audioSessionId];
    unsigned int v30 = self->_sourceData.audioSessionId;
    *(_DWORD *)buf = 136316162;
    uint64_t v47 = v27;
    __int16 v48 = 2080;
    int v49 = "-[VCAudioManager stateRunningWithAudioUnitProperties:sessionProperties:client:newState:]";
    __int16 v50 = 1024;
    int v51 = 2097;
    __int16 v52 = 1024;
    *(_DWORD *)uint64_t v53 = v29;
    *(_WORD *)&v53[4] = 1024;
    *(_DWORD *)&v53[6] = v30;
    __int16 v31 = " [%s] %s:%d New active audioSessionId=%u previousAudioSessionID=%u";
    __int16 v32 = v28;
    uint32_t v33 = 40;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      int v26 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
    }
    else {
      int v26 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_37;
    }
    uint64_t v34 = VRTraceErrorLogLevelToCSTR();
    __int16 v35 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_37;
    }
    int v36 = [a3 audioSessionId];
    unsigned int v37 = self->_sourceData.audioSessionId;
    *(_DWORD *)buf = 136316674;
    uint64_t v47 = v34;
    __int16 v48 = 2080;
    int v49 = "-[VCAudioManager stateRunningWithAudioUnitProperties:sessionProperties:client:newState:]";
    __int16 v50 = 1024;
    int v51 = 2097;
    __int16 v52 = 2112;
    *(void *)uint64_t v53 = v26;
    *(_WORD *)&v53[8] = 2048;
    int v54 = self;
    __int16 v55 = 1024;
    int v56 = v36;
    __int16 v57 = 1024;
    unsigned int v58 = v37;
    __int16 v31 = " [%s] %s:%d %@(%p) New active audioSessionId=%u previousAudioSessionID=%u";
    __int16 v32 = v35;
    uint32_t v33 = 60;
  }
  _os_log_impl(&dword_1E1EA4000, v32, OS_LOG_TYPE_DEFAULT, v31, buf, v33);
LABEL_37:
  -[VCAudioUnitProperties setOperatingMode:](self->_currentAudioUnitProperties, "setOperatingMode:", [a3 operatingMode]);
  [(VCAudioManager *)self setupSpatialContextWithAudioUnitProperties:a3 forceUpdate:0];
  uint64_t v38 = [a3 audioSessionId];
  self->_sourceData.unsigned int audioSessionId = v38;
  self->_sinkData.unsigned int audioSessionId = v38;
  [(VCAudioUnitProperties *)self->_currentAudioUnitProperties setAudioSessionId:v38];
  [(VCAudioManager *)self applyAudioSessionMute];
  [(VCAudioManager *)self activateStartingClient:a5 applyControllerFormat:v14 ^ 1u];
  if ((v14 & 1) == 0) {
    goto LABEL_47;
  }
  _VCAudioManager_ProcessEventQueue((uint64_t)&self->_sinkData);
  _VCAudioManager_ProcessEventQueue((uint64_t)&self->_sourceData);
  VCAudioBufferList_AllocateFrame([a3 frameFormatSpeaker], &self->_sourceData.secondarySampleBuffer);
  VCAudioBufferList_AllocateFrame([a3 frameFormatMic], &self->_sourceData.interruptMixDownSampleBuffer);
  if (v13)
  {
    if (![(VCAudioManager *)self resetAUIOWithProperties:a3])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        BOOL v40 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v40) {
          return v40;
        }
        -[VCAudioManager stateRunningWithAudioUnitProperties:sessionProperties:client:newState:].cold.5();
      }
      goto LABEL_67;
    }
    [(VCAudioManager *)self startVADWithAudioUnitProperties:a3];
  }
  if (![(VCAudioManager *)self resetAudioLimiterWithProperties:a3])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v40 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v40) {
        return v40;
      }
      -[VCAudioManager stateRunningWithAudioUnitProperties:sessionProperties:client:newState:].cold.4();
    }
    goto LABEL_67;
  }
  [(VCAudioManager *)self setCurrentAudioUnitProperties:a3];
  int v39 = AUIOResume();
  if ((v39 & 0x80000000) == 0 || v39 == -2145714174)
  {
LABEL_47:
    int IsReady = AUIOReceiverIsReady();
    if ((IsReady & 0x80000000) == 0 || IsReady == -2145714174)
    {
      [(VCAudioManager *)self completeStartForAllStartingClients];
      goto LABEL_50;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v40 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v40) {
        return v40;
      }
      -[VCAudioManager stateRunningWithAudioUnitProperties:sessionProperties:client:newState:]();
    }
    goto LABEL_67;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    BOOL v40 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v40) {
      return v40;
    }
    -[VCAudioManager stateRunningWithAudioUnitProperties:sessionProperties:client:newState:]();
  }
LABEL_67:
  LOBYTE(v40) = 0;
  return v40;
}

- (BOOL)stateInterruptedShouldGoToStarted:(id)a3
{
  if (![(NSMutableArray *)self->_allClients count]) {
    return 1;
  }
  unsigned int v5 = [(VCAudioUnitProperties *)self->_currentAudioUnitProperties audioUnitType];
  return v5 != [a3 audioUnitType];
}

- (BOOL)stateInterruptedShouldGoToRunning:(id)a3
{
  return ![(VCAudioManager *)self stateInterruptedShouldGoToStarted:a3]
      && !self->_isSuspended;
}

- (void)stateTransitionInterruptedToRunning
{
  [(VCAudioManager *)self stopInterruptThread];
  [(VCAudioManager *)self resetChannelMask];
  currentAudioUnitProperties = self->_currentAudioUnitProperties;

  [(VCAudioManager *)self startAUIOWithProperties:currentAudioUnitProperties];
}

- (void)stateTransitionInterruptedToStarted
{
  [(VCAudioManager *)self stopInterruptThread];

  [(VCAudioManager *)self enterStateStarted];
}

- (BOOL)stateInterruptedWithAudioUnitProperties:(id)a3 sessionProperties:(id)a4 client:(id)a5 newState:(unsigned int *)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  *a6 = 4;
  if (-[VCAudioManager stateInterruptedShouldGoToStarted:](self, "stateInterruptedShouldGoToStarted:"))
  {
    [(VCAudioManager *)self stateTransitionInterruptedToStarted];
    unsigned int v11 = 2;
LABEL_7:
    *a6 = v11;
    return 1;
  }
  if (a5)
  {
    v39[0] = 0;
    [(VCAudioManager *)self resetAudioSessionWithProperties:a4 interruptSuccessful:v39];
    self->_isSuspended = v39[0] ^ 1;
  }
  if ([(VCAudioManager *)self stateInterruptedShouldGoToRunning:a3])
  {
    [(VCAudioManager *)self stateTransitionInterruptedToRunning];
    unsigned int v11 = 3;
    goto LABEL_7;
  }
  BOOL v12 = [(VCAudioManager *)self shouldResetAudioSessionWithProperties:a4];
  int v13 = [(VCAudioManager *)self shouldResetAudioUnitWithProperties:a3] || v12;
  if (v13 == 1)
  {
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_20;
      }
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      uint64_t v16 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_20;
      }
      int v17 = *(_DWORD *)([a3 frameFormatMic] + 40);
      *(_DWORD *)int v39 = 136315906;
      *(void *)&v39[4] = v15;
      *(_WORD *)&v39[12] = 2080;
      *(void *)&v39[14] = "-[VCAudioManager stateInterruptedWithAudioUnitProperties:sessionProperties:client:newState:]";
      *(_WORD *)&v39[22] = 1024;
      LODWORD(v40) = 2184;
      WORD2(v40) = 1024;
      *(_DWORD *)((char *)&v40 + 6) = v17;
      int v18 = " [%s] %s:%d reset audio unit: %d";
      uint32_t v19 = v16;
      uint32_t v20 = 34;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v14 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
      }
      else {
        int v14 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_20;
      }
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      uint64_t v22 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_20;
      }
      int v23 = *(_DWORD *)([a3 frameFormatMic] + 40);
      *(_DWORD *)int v39 = 136316418;
      *(void *)&v39[4] = v21;
      *(_WORD *)&v39[12] = 2080;
      *(void *)&v39[14] = "-[VCAudioManager stateInterruptedWithAudioUnitProperties:sessionProperties:client:newState:]";
      *(_WORD *)&v39[22] = 1024;
      LODWORD(v40) = 2184;
      WORD2(v40) = 2112;
      *(void *)((char *)&v40 + 6) = v14;
      HIWORD(v40) = 2048;
      long long v41 = self;
      LOWORD(v42) = 1024;
      *(_DWORD *)((char *)&v42 + 2) = v23;
      int v18 = " [%s] %s:%d %@(%p) reset audio unit: %d";
      uint32_t v19 = v22;
      uint32_t v20 = 54;
    }
    _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, v18, v39, v20);
LABEL_20:
    [(VCAudioManager *)self stopInterruptThread];
    VCAudioBufferList_Destroy((uint64_t *)&self->_sourceData.secondarySampleBuffer);
    VCAudioBufferList_Destroy((uint64_t *)&self->_sourceData.interruptMixDownSampleBuffer);
    [(VCAudioManager *)self applyControllerFormatToClients:a3];
  }
  if (v12) {
    [(VCAudioManager *)self resetAudioSessionWithProperties:a4 interruptSuccessful:0];
  }
  -[VCAudioUnitProperties setOperatingMode:](self->_currentAudioUnitProperties, "setOperatingMode:", [a3 operatingMode]);
  unsigned int audioSessionId = self->_sourceData.audioSessionId;
  if (audioSessionId == [a3 audioSessionId]) {
    goto LABEL_35;
  }
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_35;
    }
    uint64_t v26 = VRTraceErrorLogLevelToCSTR();
    uint64_t v27 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_35;
    }
    int v28 = [a3 audioSessionId];
    unsigned int v29 = self->_sourceData.audioSessionId;
    *(_DWORD *)int v39 = 136316162;
    *(void *)&v39[4] = v26;
    *(_WORD *)&v39[12] = 2080;
    *(void *)&v39[14] = "-[VCAudioManager stateInterruptedWithAudioUnitProperties:sessionProperties:client:newState:]";
    *(_WORD *)&v39[22] = 1024;
    LODWORD(v40) = 2198;
    WORD2(v40) = 1024;
    *(_DWORD *)((char *)&v40 + 6) = v28;
    WORD5(v40) = 1024;
    HIDWORD(v40) = v29;
    unsigned int v30 = " [%s] %s:%d New active audioSessionId=%u previousAudioSessionID=%u";
    __int16 v31 = v27;
    uint32_t v32 = 40;
    goto LABEL_34;
  }
  if (objc_opt_respondsToSelector()) {
    __int16 v25 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
  }
  else {
    __int16 v25 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v33 = VRTraceErrorLogLevelToCSTR();
    uint64_t v34 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v35 = [a3 audioSessionId];
      unsigned int v36 = self->_sourceData.audioSessionId;
      *(_DWORD *)int v39 = 136316674;
      *(void *)&v39[4] = v33;
      *(_WORD *)&v39[12] = 2080;
      *(void *)&v39[14] = "-[VCAudioManager stateInterruptedWithAudioUnitProperties:sessionProperties:client:newState:]";
      *(_WORD *)&v39[22] = 1024;
      LODWORD(v40) = 2198;
      WORD2(v40) = 2112;
      *(void *)((char *)&v40 + 6) = v25;
      HIWORD(v40) = 2048;
      long long v41 = self;
      LOWORD(v42) = 1024;
      *(_DWORD *)((char *)&v42 + 2) = v35;
      HIWORD(v42) = 1024;
      LODWORD(v43) = v36;
      unsigned int v30 = " [%s] %s:%d %@(%p) New active audioSessionId=%u previousAudioSessionID=%u";
      __int16 v31 = v34;
      uint32_t v32 = 60;
LABEL_34:
      _os_log_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_DEFAULT, v30, v39, v32);
    }
  }
LABEL_35:
  uint64_t v37 = objc_msgSend(a3, "audioSessionId", *(void *)v39, *(_OWORD *)&v39[8], v40, v41, v42, v43);
  self->_sourceData.unsigned int audioSessionId = v37;
  self->_sinkData.unsigned int audioSessionId = v37;
  [(VCAudioUnitProperties *)self->_currentAudioUnitProperties setAudioSessionId:v37];
  [(VCAudioManager *)self applyAudioSessionMute];
  [(VCAudioManager *)self activateStartingClient:a5 applyControllerFormat:v13 ^ 1u];
  if (((v13 ^ 1) & 1) == 0)
  {
    VCAudioBufferList_AllocateFrame([a3 frameFormatSpeaker], &self->_sourceData.secondarySampleBuffer);
    VCAudioBufferList_AllocateFrame([a3 frameFormatMic], &self->_sourceData.interruptMixDownSampleBuffer);
    [(VCAudioManager *)self setCurrentAudioUnitProperties:a3];
    [(VCAudioManager *)self startInterruptThread];
  }
  [(VCAudioManager *)self completeStartForAllStartingClients];
  return 1;
}

- (id)preferredClientWithNewClient:(id)a3
{
  id v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a3 || [a3 isPrewarmingClient])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    unsigned int v5 = (void *)[(NSMutableArray *)self->_allClients reverseObjectEnumerator];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v12 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (![v10 isPrewarmingClient])
          {
            id v3 = v10;
            goto LABEL_13;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v12 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_13:
    if (!v3) {
      return (id)[(NSMutableArray *)self->_allClients lastObject];
    }
  }
  return v3;
}

- (BOOL)updateStateWithAudioIOClient:(id)a3
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  unsigned int v82 = 0;
  id v5 = -[VCAudioManager preferredClientWithNewClient:](self, "preferredClientWithNewClient:");
  [(VCAudioManager *)self _cleanupDeadClients];
  int v77 = (VCAudioManager *)a3;
  if (a3)
  {
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        uint64_t v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v84 = v7;
          __int16 v85 = 2080;
          __int16 v86 = "-[VCAudioManager updateStateWithAudioIOClient:]";
          __int16 v87 = 1024;
          int v88 = 2245;
          __int16 v89 = 2112;
          uint64_t v90 = v77;
          uint32_t v9 = " [%s] %s:%d new client: %@";
          uint64_t v10 = v8;
          uint32_t v11 = 38;
LABEL_12:
          _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v6 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        long long v13 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          uint64_t v84 = v12;
          __int16 v85 = 2080;
          __int16 v86 = "-[VCAudioManager updateStateWithAudioIOClient:]";
          __int16 v87 = 1024;
          int v88 = 2245;
          __int16 v89 = 2112;
          uint64_t v90 = (VCAudioManager *)v6;
          __int16 v91 = 2048;
          *(void *)uint64_t v92 = self;
          *(_WORD *)&v92[8] = 2112;
          *(void *)&v92[10] = v77;
          uint32_t v9 = " [%s] %s:%d %@(%p) new client: %@";
          uint64_t v10 = v13;
          uint32_t v11 = 58;
          goto LABEL_12;
        }
      }
    }
  }
  int playbackMode = self->_playbackMode;
  if (playbackMode)
  {
    id v78 = [(VCAudioManager *)self newAudioUnitPropertiesForSystemAudioWithPreferredClient:v5 isInput:playbackMode == 2];
    id v79 = [(VCAudioManager *)self newAudioSessionMediaPropertiesForSystemAudioWithPreferredClient:v5 audioUnitProperties:v78 isInput:self->_playbackMode == 2];
    long long v15 = v78;
    if (self->_playbackMode != 2)
    {
      uint64_t v16 = [v78 frameFormatSpeaker];
      goto LABEL_18;
    }
  }
  else
  {
    id v78 = [(VCAudioManager *)self newAudioUnitPropertiesWithPreferredClient:v5];
    id v79 = [(VCAudioManager *)self newAudioSessionMediaPropertiesWithPreferredClient:v5 audioUnitProperties:v78];
    long long v15 = v78;
  }
  uint64_t v16 = [v15 frameFormatMic];
LABEL_18:
  uint64_t v17 = v16;
  uint64_t v18 = [(NSMutableArray *)self->_allClients count];
  uint32_t v19 = (VCAudioManager *)objc_opt_class();
  if (v18)
  {
    if (v19 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_46;
      }
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      int v23 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_46;
      }
      int v24 = [(NSMutableArray *)self->_allClients count];
      int v25 = (int)*(double *)v17;
      int v26 = *(_DWORD *)(v17 + 40);
      if (v79)
      {
        [v79 outputFormat];
        int v27 = (int)v81;
      }
      else
      {
        int v27 = 0;
      }
      *(_DWORD *)buf = 136317186;
      uint64_t v84 = v22;
      __int16 v85 = 2080;
      __int16 v86 = "-[VCAudioManager updateStateWithAudioIOClient:]";
      __int16 v87 = 1024;
      int v88 = 2262;
      __int16 v89 = 2048;
      uint64_t v90 = self;
      __int16 v91 = 2048;
      *(void *)uint64_t v92 = v77;
      *(_WORD *)&v92[8] = 1024;
      *(_DWORD *)&v92[10] = v24;
      *(_WORD *)&v92[14] = 1024;
      *(_DWORD *)&v92[16] = v25;
      *(_WORD *)v93 = 1024;
      *(_DWORD *)&v93[2] = v26;
      *(_WORD *)&v93[6] = 1024;
      *(_DWORD *)&v93[8] = v27;
      uint64_t v37 = " [%s] %s:%d (%p) audioIO=%p clientCount:%d AUIO=%d/%d AudioSession=%d";
      uint64_t v38 = v23;
      uint32_t v39 = 72;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint32_t v20 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
      }
      else {
        uint32_t v20 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_46;
      }
      uint64_t v28 = VRTraceErrorLogLevelToCSTR();
      unsigned int v29 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_46;
      }
      int v30 = [(NSMutableArray *)self->_allClients count];
      int v31 = (int)*(double *)v17;
      int v32 = *(_DWORD *)(v17 + 40);
      if (v79)
      {
        [v79 outputFormat];
        int v33 = (int)v80;
      }
      else
      {
        int v33 = 0;
      }
      *(_DWORD *)buf = 136317698;
      uint64_t v84 = v28;
      __int16 v85 = 2080;
      __int16 v86 = "-[VCAudioManager updateStateWithAudioIOClient:]";
      __int16 v87 = 1024;
      int v88 = 2262;
      __int16 v89 = 2112;
      uint64_t v90 = (VCAudioManager *)v20;
      __int16 v91 = 2048;
      *(void *)uint64_t v92 = self;
      *(_WORD *)&v92[8] = 2048;
      *(void *)&v92[10] = self;
      *(_WORD *)&v92[18] = 2048;
      *(void *)v93 = v77;
      *(_WORD *)&v93[8] = 1024;
      *(_DWORD *)&v93[10] = v30;
      __int16 v94 = 1024;
      int v95 = v31;
      __int16 v96 = 1024;
      int v97 = v32;
      __int16 v98 = 1024;
      int v99 = v33;
      uint64_t v37 = " [%s] %s:%d %@(%p) (%p) audioIO=%p clientCount:%d AUIO=%d/%d AudioSession=%d";
      uint64_t v38 = v29;
      uint32_t v39 = 92;
    }
  }
  else if (v19 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_46;
    }
    uint64_t v34 = VRTraceErrorLogLevelToCSTR();
    int v35 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_46;
    }
    int v36 = [(NSMutableArray *)self->_allClients count];
    *(_DWORD *)buf = 136316418;
    uint64_t v84 = v34;
    __int16 v85 = 2080;
    __int16 v86 = "-[VCAudioManager updateStateWithAudioIOClient:]";
    __int16 v87 = 1024;
    int v88 = 2264;
    __int16 v89 = 2048;
    uint64_t v90 = self;
    __int16 v91 = 2048;
    *(void *)uint64_t v92 = v77;
    *(_WORD *)&v92[8] = 1024;
    *(_DWORD *)&v92[10] = v36;
    uint64_t v37 = " [%s] %s:%d (%p) audioIO=%p clientCount:%d AUIO=-/- AudioSession=-";
    uint64_t v38 = v35;
    uint32_t v39 = 54;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v21 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v21 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_46;
    }
    uint64_t v40 = VRTraceErrorLogLevelToCSTR();
    long long v41 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_46;
    }
    int v42 = [(NSMutableArray *)self->_allClients count];
    *(_DWORD *)buf = 136316930;
    uint64_t v84 = v40;
    __int16 v85 = 2080;
    __int16 v86 = "-[VCAudioManager updateStateWithAudioIOClient:]";
    __int16 v87 = 1024;
    int v88 = 2264;
    __int16 v89 = 2112;
    uint64_t v90 = (VCAudioManager *)v21;
    __int16 v91 = 2048;
    *(void *)uint64_t v92 = self;
    *(_WORD *)&v92[8] = 2048;
    *(void *)&v92[10] = self;
    *(_WORD *)&v92[18] = 2048;
    *(void *)v93 = v77;
    *(_WORD *)&v93[8] = 1024;
    *(_DWORD *)&v93[10] = v42;
    uint64_t v37 = " [%s] %s:%d %@(%p) (%p) audioIO=%p clientCount:%d AUIO=-/- AudioSession=-";
    uint64_t v38 = v41;
    uint32_t v39 = 74;
  }
  _os_log_impl(&dword_1E1EA4000, v38, OS_LOG_TYPE_DEFAULT, v37, buf, v39);
LABEL_46:
  unint64_t v43 = 0x1EADBA000;
  uint64_t v44 = v77;
  uint64_t v45 = (os_log_t *)MEMORY[0x1E4F47A50];
  while (1)
  {
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v54 = VRTraceErrorLogLevelToCSTR();
        os_log_t v55 = *v45;
        if (os_log_type_enabled(*v45, OS_LOG_TYPE_DEFAULT))
        {
          int v56 = [(NSArray *)self->_stateStrings objectAtIndexedSubscript:self->_state];
          unsigned int state = self->_state;
          unint64_t v43 = 0x1EADBA000uLL;
          *(_DWORD *)buf = 136316162;
          uint64_t v84 = v54;
          __int16 v85 = 2080;
          __int16 v86 = "-[VCAudioManager updateStateWithAudioIOClient:]";
          __int16 v87 = 1024;
          int v88 = 2268;
          __int16 v89 = 2112;
          uint64_t v90 = v56;
          __int16 v91 = 1024;
          *(_DWORD *)uint64_t v92 = state;
          int v51 = v55;
          __int16 v52 = " [%s] %s:%d Process state: %@ (%d)";
          uint32_t v53 = 44;
          goto LABEL_56;
        }
      }
    }
    else
    {
      unsigned int v46 = &stru_1F3D3E450;
      if (objc_opt_respondsToSelector()) {
        unsigned int v46 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v47 = VRTraceErrorLogLevelToCSTR();
        os_log_t v48 = *v45;
        if (os_log_type_enabled(*v45, OS_LOG_TYPE_DEFAULT))
        {
          id v49 = [(NSArray *)self->_stateStrings objectAtIndexedSubscript:self->_state];
          unsigned int v50 = self->_state;
          unint64_t v43 = 0x1EADBA000;
          *(_DWORD *)buf = 136316674;
          uint64_t v84 = v47;
          __int16 v85 = 2080;
          __int16 v86 = "-[VCAudioManager updateStateWithAudioIOClient:]";
          __int16 v87 = 1024;
          int v88 = 2268;
          __int16 v89 = 2112;
          uint64_t v90 = (VCAudioManager *)v46;
          __int16 v91 = 2048;
          *(void *)uint64_t v92 = self;
          *(_WORD *)&v92[8] = 2112;
          *(void *)&v92[10] = v49;
          *(_WORD *)&v92[18] = 1024;
          *(_DWORD *)v93 = v50;
          int v51 = v48;
          __int16 v52 = " [%s] %s:%d %@(%p) Process state: %@ (%d)";
          uint32_t v53 = 64;
LABEL_56:
          _os_log_impl(&dword_1E1EA4000, v51, OS_LOG_TYPE_DEFAULT, v52, buf, v53);
        }
      }
    }
    uint64_t v58 = *(int *)(v43 + 2312);
    switch(*(_DWORD *)((char *)&self->super.super.isa + v58))
    {
      case 1:
        BOOL v59 = [(VCAudioManager *)self stateIdleWithAudioUnitProperties:v78 sessionProperties:v79 client:v44 newState:&v82];
        goto LABEL_63;
      case 2:
        BOOL v59 = [(VCAudioManager *)self stateSessionStartedWithAudioUnitProperties:v78 sessionProperties:v79 client:v44 newState:&v82];
        goto LABEL_63;
      case 3:
        BOOL v59 = [(VCAudioManager *)self stateRunningWithAudioUnitProperties:v78 sessionProperties:v79 client:v44 newState:&v82];
        goto LABEL_63;
      case 4:
        BOOL v59 = [(VCAudioManager *)self stateInterruptedWithAudioUnitProperties:v78 sessionProperties:v79 client:v44 newState:&v82];
LABEL_63:
        BOOL v60 = v59;
        break;
      default:
        BOOL v60 = 1;
        break;
    }
    unsigned int v61 = v82;
    if (v82 == *(_DWORD *)((char *)&self->super.super.isa + v58)) {
      break;
    }
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_75;
      }
      uint64_t v71 = VRTraceErrorLogLevelToCSTR();
      os_log_t v72 = *v45;
      if (!os_log_type_enabled(*v45, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_75;
      }
      long long v73 = [(NSArray *)self->_stateStrings objectAtIndexedSubscript:*(unsigned int *)((char *)&self->super.super.isa + v58)];
      int v74 = *(_DWORD *)((char *)&self->super.super.isa + v58);
      unint64_t v43 = 0x1EADBA000;
      id v75 = [(NSArray *)self->_stateStrings objectAtIndexedSubscript:v82];
      *(_DWORD *)buf = 136316674;
      uint64_t v84 = v71;
      __int16 v85 = 2080;
      __int16 v86 = "-[VCAudioManager updateStateWithAudioIOClient:]";
      __int16 v87 = 1024;
      int v88 = 2287;
      __int16 v89 = 2112;
      uint64_t v90 = v73;
      __int16 v91 = 1024;
      *(_DWORD *)uint64_t v92 = v74;
      uint64_t v45 = (os_log_t *)MEMORY[0x1E4F47A50];
      *(_WORD *)&v92[4] = 2112;
      *(void *)&v92[6] = v75;
      *(_WORD *)&v92[14] = 1024;
      *(_DWORD *)&v92[16] = v82;
      unsigned int v68 = v72;
      uint64_t v69 = " [%s] %s:%d State change: %@ (%d) -> %@ (%d)";
      uint32_t v70 = 60;
    }
    else
    {
      int v62 = &stru_1F3D3E450;
      if (objc_opt_respondsToSelector()) {
        int v62 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_75;
      }
      uint64_t v63 = VRTraceErrorLogLevelToCSTR();
      os_log_t v64 = *v45;
      if (!os_log_type_enabled(*v45, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_75;
      }
      id v65 = [(NSArray *)self->_stateStrings objectAtIndexedSubscript:*(unsigned int *)((char *)&self->super.super.isa + v58)];
      int v66 = *(_DWORD *)((char *)&self->super.super.isa + v58);
      uint64_t v45 = (os_log_t *)MEMORY[0x1E4F47A50];
      id v67 = [(NSArray *)self->_stateStrings objectAtIndexedSubscript:v82];
      *(_DWORD *)buf = 136317186;
      uint64_t v84 = v63;
      __int16 v85 = 2080;
      __int16 v86 = "-[VCAudioManager updateStateWithAudioIOClient:]";
      __int16 v87 = 1024;
      int v88 = 2287;
      __int16 v89 = 2112;
      uint64_t v90 = (VCAudioManager *)v62;
      __int16 v91 = 2048;
      *(void *)uint64_t v92 = self;
      *(_WORD *)&v92[8] = 2112;
      *(void *)&v92[10] = v65;
      unint64_t v43 = 0x1EADBA000;
      *(_WORD *)&v92[18] = 1024;
      *(_DWORD *)v93 = v66;
      uint64_t v44 = v77;
      *(_WORD *)&v93[4] = 2112;
      *(void *)&v93[6] = v67;
      __int16 v94 = 1024;
      int v95 = v82;
      unsigned int v68 = v64;
      uint64_t v69 = " [%s] %s:%d %@(%p) State change: %@ (%d) -> %@ (%d)";
      uint32_t v70 = 80;
    }
    _os_log_impl(&dword_1E1EA4000, v68, OS_LOG_TYPE_DEFAULT, v69, buf, v70);
LABEL_75:
    unsigned int v61 = v82;
    *(_DWORD *)((char *)&self->super.super.isa + v58) = v82;
    if (!v60) {
      goto LABEL_78;
    }
  }
  *(_DWORD *)((char *)&self->super.super.isa + v58) = v82;
LABEL_78:
  if (v61 != 3)
  {
    pthread_mutex_lock(&self->_interruptingMutex);
    self->_isInterrupting = 0;
    pthread_mutex_unlock(&self->_interruptingMutex);
  }

  return v60;
}

- (void)startClient:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    dispatchQueue = self->_dispatchQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __30__VCAudioManager_startClient___block_invoke;
    v8[3] = &unk_1E6DB3E40;
    v8[4] = a3;
    v8[5] = self;
    dispatch_async(dispatchQueue, v8);
  }
  else if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioManager startClient:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      id v5 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
    }
    else {
      id v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v10 = v6;
        __int16 v11 = 2080;
        uint64_t v12 = "-[VCAudioManager startClient:]";
        __int16 v13 = 1024;
        int v14 = 2306;
        __int16 v15 = 2112;
        uint64_t v16 = v5;
        __int16 v17 = 2048;
        uint64_t v18 = self;
        _os_log_error_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Client is nil!", buf, 0x30u);
      }
    }
  }
}

void __30__VCAudioManager_startClient___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 32);
  if ([*(id *)(a1 + 32) deviceRole] == 3
    || [*v2 deviceRole] == 4)
  {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "didStart:error:", 0, objc_msgSend(MEMORY[0x1E4F28C58], "AVConferenceServiceError:detailCode:description:", 32016, 0, objc_msgSend(NSString, "stringWithFormat:", @"Controller doesn't support client role: %d", objc_msgSend(*(id *)(a1 + 32), "deviceRole"))));
    if (objc_opt_class() == *(void *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v4 = VRTraceErrorLogLevelToCSTR();
        id v5 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __30__VCAudioManager_startClient___block_invoke_cold_1(v4, v2, v5);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        id v3 = (__CFString *)[*(id *)(a1 + 40) performSelector:sel_logPrefix];
      }
      else {
        id v3 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        uint64_t v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v9 = *(void *)(a1 + 40);
          int v10 = [*(id *)(a1 + 32) deviceRole];
          *(_DWORD *)buf = 136316418;
          uint64_t v34 = v7;
          __int16 v35 = 2080;
          int v36 = "-[VCAudioManager startClient:]_block_invoke";
          __int16 v37 = 1024;
          int v38 = 2315;
          __int16 v39 = 2112;
          uint64_t v40 = v3;
          __int16 v41 = 2048;
          uint64_t v42 = v9;
          __int16 v43 = 1024;
          LODWORD(v44) = v10;
          __int16 v11 = " [%s] %s:%d %@(%p) Invalid device role: %d!";
          uint64_t v12 = v8;
          uint32_t v13 = 54;
LABEL_17:
          _os_log_error_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
          return;
        }
      }
    }
    return;
  }
  if ([*(id *)(a1 + 40) addClient:*(void *)(a1 + 32)])
  {
    if (objc_opt_class() == *(void *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        uint64_t v16 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          __int16 v17 = (__CFString *)*v2;
          *(_DWORD *)buf = 136315906;
          uint64_t v34 = v15;
          __int16 v35 = 2080;
          int v36 = "-[VCAudioManager startClient:]_block_invoke";
          __int16 v37 = 1024;
          int v38 = 2324;
          __int16 v39 = 2048;
          uint64_t v40 = v17;
          uint64_t v18 = " [%s] %s:%d controller start client (audioIO=%p)";
          uint64_t v19 = v16;
          uint32_t v20 = 38;
LABEL_31:
          _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v6 = (__CFString *)[*(id *)(a1 + 40) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v21 = VRTraceErrorLogLevelToCSTR();
        uint64_t v22 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v24 = *(void *)(a1 + 32);
          uint64_t v23 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 136316418;
          uint64_t v34 = v21;
          __int16 v35 = 2080;
          int v36 = "-[VCAudioManager startClient:]_block_invoke";
          __int16 v37 = 1024;
          int v38 = 2324;
          __int16 v39 = 2112;
          uint64_t v40 = v6;
          __int16 v41 = 2048;
          uint64_t v42 = v23;
          __int16 v43 = 2048;
          uint64_t v44 = v24;
          uint64_t v18 = " [%s] %s:%d %@(%p) controller start client (audioIO=%p)";
          uint64_t v19 = v22;
          uint32_t v20 = 58;
          goto LABEL_31;
        }
      }
    }
    if (([*(id *)(a1 + 40) updateStateWithAudioIOClient:*(void *)(a1 + 32)] & 1) == 0)
    {
      if (objc_opt_class() == *(void *)(a1 + 40))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            __30__VCAudioManager_startClient___block_invoke_cold_2();
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          int v25 = (__CFString *)[*(id *)(a1 + 40) performSelector:sel_logPrefix];
        }
        else {
          int v25 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v29 = VRTraceErrorLogLevelToCSTR();
          int v30 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            uint64_t v32 = *(void *)(a1 + 32);
            uint64_t v31 = *(void *)(a1 + 40);
            *(_DWORD *)buf = 136316418;
            uint64_t v34 = v29;
            __int16 v35 = 2080;
            int v36 = "-[VCAudioManager startClient:]_block_invoke";
            __int16 v37 = 1024;
            int v38 = 2326;
            __int16 v39 = 2112;
            uint64_t v40 = v25;
            __int16 v41 = 2048;
            uint64_t v42 = v31;
            __int16 v43 = 2048;
            uint64_t v44 = v32;
            _os_log_error_impl(&dword_1E1EA4000, v30, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) controller start client FAILED (audioIO=%p)", buf, 0x3Au);
          }
        }
      }
      [*(id *)(a1 + 40) removeClient:*(void *)(a1 + 32)];
      if (([*(id *)(a1 + 40) updateStateWithAudioIOClient:0] & 1) == 0) {
        +[VCAudioManager terminateProcess:@"Failed to recover AUIO state on client start failure" terminateSource:@"VCAudioManager" agent:*(void *)(*(void *)(a1 + 40) + 8)];
      }
      objc_msgSend((id)objc_msgSend(*v2, "delegate"), "didStart:error:", 0, objc_msgSend(MEMORY[0x1E4F28C58], "AVConferenceServiceError:detailCode:description:", 32000, 0, objc_msgSend(NSString, "stringWithFormat:", @"Client (%p) failed to start", *v2)));
    }
    return;
  }
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "didStart:error:", 0, objc_msgSend(MEMORY[0x1E4F28C58], "AVConferenceServiceError:detailCode:description:", 32016, 0, objc_msgSend(NSString, "stringWithFormat:", @"Controller request denied: client (%p) is alread started", *(void *)(a1 + 32))));
  if (objc_opt_class() == *(void *)(a1 + 40))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __30__VCAudioManager_startClient___block_invoke_cold_3();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      int v14 = (__CFString *)[*(id *)(a1 + 40) performSelector:sel_logPrefix];
    }
    else {
      int v14 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v26 = VRTraceErrorLogLevelToCSTR();
      int v27 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 136316162;
        uint64_t v34 = v26;
        __int16 v35 = 2080;
        int v36 = "-[VCAudioManager startClient:]_block_invoke";
        __int16 v37 = 1024;
        int v38 = 2321;
        __int16 v39 = 2112;
        uint64_t v40 = v14;
        __int16 v41 = 2048;
        uint64_t v42 = v28;
        __int16 v11 = " [%s] %s:%d %@(%p) Client already registered!";
        uint64_t v12 = v27;
        uint32_t v13 = 48;
        goto LABEL_17;
      }
    }
  }
}

- (void)stopClient:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    dispatchQueue = self->_dispatchQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __29__VCAudioManager_stopClient___block_invoke;
    v8[3] = &unk_1E6DB3E40;
    v8[4] = self;
    v8[5] = a3;
    dispatch_async(dispatchQueue, v8);
  }
  else if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioManager stopClient:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      id v5 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
    }
    else {
      id v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v10 = v6;
        __int16 v11 = 2080;
        uint64_t v12 = "-[VCAudioManager stopClient:]";
        __int16 v13 = 1024;
        int v14 = 2340;
        __int16 v15 = 2112;
        uint64_t v16 = v5;
        __int16 v17 = 2048;
        uint64_t v18 = self;
        _os_log_error_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Client is nil!", buf, 0x30u);
      }
    }
  }
}

uint64_t __29__VCAudioManager_stopClient___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 40);
  if (([*(id *)(a1 + 32) removeClient:*(void *)(a1 + 40)] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(*v2, "delegate"), "didStop:error:", 0, objc_msgSend(MEMORY[0x1E4F28C58], "AVConferenceServiceError:detailCode:description:", 32016, 0, objc_msgSend(NSString, "stringWithFormat:", @"Controller request denied: client (%p) is not running", *v2)));
  }
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      id v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = (__CFString *)*v2;
        *(_DWORD *)buf = 136315906;
        uint64_t v39 = v4;
        __int16 v40 = 2080;
        __int16 v41 = "-[VCAudioManager stopClient:]_block_invoke";
        __int16 v42 = 1024;
        int v43 = 2348;
        __int16 v44 = 2048;
        uint64_t v45 = v6;
        uint64_t v7 = " [%s] %s:%d controller stop client (audioIO=%p)";
        uint64_t v8 = v5;
        uint32_t v9 = 38;
LABEL_13:
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      id v3 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      id v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      __int16 v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        uint64_t v13 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 136316418;
        uint64_t v39 = v10;
        __int16 v40 = 2080;
        __int16 v41 = "-[VCAudioManager stopClient:]_block_invoke";
        __int16 v42 = 1024;
        int v43 = 2348;
        __int16 v44 = 2112;
        uint64_t v45 = v3;
        __int16 v46 = 2048;
        uint64_t v47 = v12;
        __int16 v48 = 2048;
        uint64_t v49 = v13;
        uint64_t v7 = " [%s] %s:%d %@(%p) controller stop client (audioIO=%p)";
        uint64_t v8 = v11;
        uint32_t v9 = 58;
        goto LABEL_13;
      }
    }
  }
  if ([*(id *)(a1 + 32) updateStateWithAudioIOClient:0])
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_33;
      }
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      uint64_t v18 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_33;
      }
      uint64_t v19 = (__CFString *)*v2;
      *(_DWORD *)buf = 136315906;
      uint64_t v39 = v17;
      __int16 v40 = 2080;
      __int16 v41 = "-[VCAudioManager stopClient:]_block_invoke";
      __int16 v42 = 1024;
      int v43 = 2350;
      __int16 v44 = 2048;
      uint64_t v45 = v19;
      uint32_t v20 = " [%s] %s:%d controller did stop client (audioIO=%p)";
      uint64_t v21 = v18;
      uint32_t v22 = 38;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v14 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        int v14 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_33;
      }
      uint64_t v23 = VRTraceErrorLogLevelToCSTR();
      uint64_t v24 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_33;
      }
      uint64_t v25 = *(void *)(a1 + 32);
      uint64_t v26 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136316418;
      uint64_t v39 = v23;
      __int16 v40 = 2080;
      __int16 v41 = "-[VCAudioManager stopClient:]_block_invoke";
      __int16 v42 = 1024;
      int v43 = 2350;
      __int16 v44 = 2112;
      uint64_t v45 = v14;
      __int16 v46 = 2048;
      uint64_t v47 = v25;
      __int16 v48 = 2048;
      uint64_t v49 = v26;
      uint32_t v20 = " [%s] %s:%d %@(%p) controller did stop client (audioIO=%p)";
      uint64_t v21 = v24;
      uint32_t v22 = 58;
    }
    _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
LABEL_33:
    int v27 = (void *)[*v2 delegate];
    uint64_t v28 = 1;
    uint64_t v29 = 0;
    return [v27 didStop:v28 error:v29];
  }
  uint64_t v15 = [MEMORY[0x1E4F28C58] AVConferenceServiceError:32000, 0, objc_msgSend(NSString, "stringWithFormat:", @"Client (%p) failed to stop", *(void *)(a1 + 40)) detailCode description];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if (VRTraceIsOSFaultDisabled())
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __29__VCAudioManager_stopClient___block_invoke_cold_1();
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        __29__VCAudioManager_stopClient___block_invoke_cold_2();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v16 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      uint64_t v16 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      uint64_t v30 = VRTraceErrorLogLevelToCSTR();
      char IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
      uint64_t v32 = *MEMORY[0x1E4F47A50];
      if (IsOSFaultDisabled)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v33 = *(void *)(a1 + 32);
          uint64_t v34 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 136316418;
          uint64_t v39 = v30;
          __int16 v40 = 2080;
          __int16 v41 = "-[VCAudioManager stopClient:]_block_invoke";
          __int16 v42 = 1024;
          int v43 = 2354;
          __int16 v44 = 2112;
          uint64_t v45 = v16;
          __int16 v46 = 2048;
          uint64_t v47 = v33;
          __int16 v48 = 2048;
          uint64_t v49 = v34;
          _os_log_error_impl(&dword_1E1EA4000, v32, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) controller stop client FAILED (audioIO=%p)", buf, 0x3Au);
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        uint64_t v35 = *(void *)(a1 + 32);
        uint64_t v36 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 136316418;
        uint64_t v39 = v30;
        __int16 v40 = 2080;
        __int16 v41 = "-[VCAudioManager stopClient:]_block_invoke";
        __int16 v42 = 1024;
        int v43 = 2354;
        __int16 v44 = 2112;
        uint64_t v45 = v16;
        __int16 v46 = 2048;
        uint64_t v47 = v35;
        __int16 v48 = 2048;
        uint64_t v49 = v36;
        _os_log_fault_impl(&dword_1E1EA4000, v32, OS_LOG_TYPE_FAULT, " [%s] %s:%d %@(%p) controller stop client FAILED (audioIO=%p)", buf, 0x3Au);
      }
    }
  }
  int v27 = (void *)[*v2 delegate];
  uint64_t v28 = 0;
  uint64_t v29 = v15;
  return [v27 didStop:v28 error:v29];
}

- (void)updateDirectionWithClient:(id)a3 settings:(const tagVCAudioIOControllerClientSettings *)a4 isClientRegistered:(BOOL)a5
{
  BOOL v5 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int v9 = [a3 direction];
  uint64_t var0 = a4->var0;
  char v11 = var0 ^ v9;
  if (var0 == v9) {
    return;
  }
  [a3 setDirection:var0];
  if (!v5 || self->_state == 1) {
    return;
  }
  if (v11)
  {
    uint64_t v12 = [a3 sourceIO];
    p_sourceData = &self->_sourceData;
    if (var0)
    {
      [(VCAudioManager *)self registerClientIO:v12 controllerIO:p_sourceData];
      if ((v11 & 2) == 0) {
        return;
      }
      goto LABEL_10;
    }
    [(VCAudioManager *)self unregisterClientIO:v12 controllerIO:p_sourceData];
  }
  if ((v11 & 2) == 0) {
    return;
  }
LABEL_10:
  uint64_t v14 = [a3 sinkIO];
  p_sinkData = &self->_sinkData;
  if ((var0 & 2) != 0)
  {
    [(VCAudioManager *)self registerClientIO:v14 controllerIO:p_sinkData];
  }
  else
  {
    [(VCAudioManager *)self unregisterClientIO:v14 controllerIO:p_sinkData];
  }
}

- (BOOL)supportsVoiceActivityDetection
{
  return 1;
}

- (void)updateSpatialAudioWithClient:(id)a3 settings:(const tagVCAudioIOControllerClientSettings *)a4 isClientRegistered:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  [a3 setSpatialAudioDisabled:a4->var1];
  if (v5 && self->_spatialAudioDisabled != [a3 spatialAudioDisabled])
  {
    self->_BOOL spatialAudioDisabled = [a3 spatialAudioDisabled];
    BOOL v9 = [(VCAudioManager *)self updateStateWithAudioIOClient:a3];
    uint64_t v10 = (VCAudioManager *)objc_opt_class();
    if (v9)
    {
      if (v10 == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v13 = VRTraceErrorLogLevelToCSTR();
          uint64_t v14 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            BOOL spatialAudioDisabled = self->_spatialAudioDisabled;
            int v24 = 136315906;
            uint64_t v25 = v13;
            __int16 v26 = 2080;
            int v27 = "-[VCAudioManager updateSpatialAudioWithClient:settings:isClientRegistered:]";
            __int16 v28 = 1024;
            int v29 = 2406;
            __int16 v30 = 1024;
            LODWORD(v31) = spatialAudioDisabled;
            uint64_t v16 = " [%s] %s:%d controller updated _spatialAudioDisabled=%d";
            uint64_t v17 = v14;
            uint32_t v18 = 34;
LABEL_20:
            _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v24, v18);
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          char v11 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
        }
        else {
          char v11 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v19 = VRTraceErrorLogLevelToCSTR();
          uint32_t v20 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            BOOL v21 = self->_spatialAudioDisabled;
            int v24 = 136316418;
            uint64_t v25 = v19;
            __int16 v26 = 2080;
            int v27 = "-[VCAudioManager updateSpatialAudioWithClient:settings:isClientRegistered:]";
            __int16 v28 = 1024;
            int v29 = 2406;
            __int16 v30 = 2112;
            uint64_t v31 = v11;
            __int16 v32 = 2048;
            uint64_t v33 = self;
            __int16 v34 = 1024;
            LODWORD(v35) = v21;
            uint64_t v16 = " [%s] %s:%d %@(%p) controller updated _spatialAudioDisabled=%d";
            uint64_t v17 = v20;
            uint32_t v18 = 54;
            goto LABEL_20;
          }
        }
      }
    }
    else if (v10 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioManager updateSpatialAudioWithClient:settings:isClientRegistered:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v12 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v12 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v22 = VRTraceErrorLogLevelToCSTR();
        uint64_t v23 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v24 = 136316418;
          uint64_t v25 = v22;
          __int16 v26 = 2080;
          int v27 = "-[VCAudioManager updateSpatialAudioWithClient:settings:isClientRegistered:]";
          __int16 v28 = 1024;
          int v29 = 2404;
          __int16 v30 = 2112;
          uint64_t v31 = v12;
          __int16 v32 = 2048;
          uint64_t v33 = self;
          __int16 v34 = 2048;
          id v35 = a3;
          _os_log_error_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) controller update FAILED (audioIO=%p)", (uint8_t *)&v24, 0x3Au);
        }
      }
    }
  }
}

- (void)updateVoiceProcessingWithClient:(id)a3 settings:(const tagVCAudioIOControllerClientSettings *)a4 isClientRegistered:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int var2 = a4->var2;
  int v10 = [a3 isVoiceActivityEnabled];
  int var3 = a4->var3;
  int v12 = [a3 isMediaPriorityEnabled];
  if (var2 != v10 || var3 != v12)
  {
    [a3 setIsVoiceActivityEnabled:a4->var2];
    [a3 setIsMediaPriorityEnabled:a4->var3];
    if (v5)
    {
      pthread_mutex_lock(&self->_interruptingMutex);
      if ([(VCAudioManager *)self audioCallbacksRunning])
      {
        uint64_t v14 = malloc_type_calloc(1uLL, 0x20uLL, 0x10A00405C5CD52DuLL);
        v14[4] = 2;
        uint32_t v18 = v14;
        if (CMSimpleQueueEnqueue(self->_sinkData.eventQueue, v14))
        {
          if ((VCAudioManager *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                -[VCAudioManager updateVoiceProcessingWithClient:settings:isClientRegistered:]();
              }
            }
          }
          else
          {
            if (objc_opt_respondsToSelector()) {
              uint64_t v15 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
            }
            else {
              uint64_t v15 = &stru_1F3D3E450;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              uint64_t v16 = VRTraceErrorLogLevelToCSTR();
              uint64_t v17 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316162;
                uint64_t v20 = v16;
                __int16 v21 = 2080;
                uint64_t v22 = "-[VCAudioManager updateVoiceProcessingWithClient:settings:isClientRegistered:]";
                __int16 v23 = 1024;
                int v24 = 2426;
                __int16 v25 = 2112;
                __int16 v26 = v15;
                __int16 v27 = 2048;
                __int16 v28 = self;
                _os_log_error_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) CMSimpleQueueEnqueue Full", buf, 0x30u);
              }
            }
          }
          VCAudioManager_ReleaseAudioEvent((uint64_t *)&v18, 1);
        }
      }
      pthread_mutex_unlock(&self->_interruptingMutex);
    }
  }
}

- (void)updateClient:(id)a3 settings:(const tagVCAudioIOControllerClientSettings *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (a4)
    {
      dispatchQueue = self->_dispatchQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __40__VCAudioManager_updateClient_settings___block_invoke;
      block[3] = &unk_1E6DB3EE0;
      block[4] = self;
      void block[5] = a3;
      tagVCAudioIOControllerClientSettings v13 = *a4;
      dispatch_async(dispatchQueue, block);
      return;
    }
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioManager updateClient:settings:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v7 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        BOOL v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v15 = v11;
          __int16 v16 = 2080;
          uint64_t v17 = "-[VCAudioManager updateClient:settings:]";
          __int16 v18 = 1024;
          int v19 = 2438;
          __int16 v20 = 2112;
          __int16 v21 = v7;
          __int16 v22 = 2048;
          __int16 v23 = self;
          int v10 = " [%s] %s:%d %@(%p) Invalid parameter: settings is NULL";
          goto LABEL_25;
        }
      }
    }
  }
  else if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioManager updateClient:settings:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v6 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      BOOL v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v15 = v8;
        __int16 v16 = 2080;
        uint64_t v17 = "-[VCAudioManager updateClient:settings:]";
        __int16 v18 = 1024;
        int v19 = 2437;
        __int16 v20 = 2112;
        __int16 v21 = v6;
        __int16 v22 = 2048;
        __int16 v23 = self;
        int v10 = " [%s] %s:%d %@(%p) Invalid parameter: client is nil";
LABEL_25:
        _os_log_error_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_ERROR, v10, buf, 0x30u);
      }
    }
  }
}

uint64_t __40__VCAudioManager_updateClient_settings___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 40);
        int v6 = *(_DWORD *)(*(void *)(a1 + 32) + 184);
        *(_DWORD *)uint64_t v17 = 136316162;
        *(void *)&v17[4] = v3;
        *(_WORD *)&v17[12] = 2080;
        *(void *)&v17[14] = "-[VCAudioManager updateClient:settings:]_block_invoke";
        *(_WORD *)&v17[22] = 1024;
        LODWORD(v18) = 2442;
        WORD2(v18) = 2048;
        *(void *)((char *)&v18 + 6) = v5;
        HIWORD(v18) = 1024;
        LODWORD(v19) = v6;
        uint64_t v7 = " [%s] %s:%d Update client[%p]. Current manager state=%d";
        uint64_t v8 = v4;
        uint32_t v9 = 44;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, v17, v9);
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
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        uint64_t v13 = *(void *)(a1 + 40);
        int v14 = *(_DWORD *)(v12 + 184);
        *(_DWORD *)uint64_t v17 = 136316674;
        *(void *)&v17[4] = v10;
        *(_WORD *)&v17[12] = 2080;
        *(void *)&v17[14] = "-[VCAudioManager updateClient:settings:]_block_invoke";
        *(_WORD *)&v17[22] = 1024;
        LODWORD(v18) = 2442;
        WORD2(v18) = 2112;
        *(void *)((char *)&v18 + 6) = v2;
        HIWORD(v18) = 2048;
        uint64_t v19 = v12;
        LOWORD(v20) = 2048;
        *(void *)((char *)&v20 + 2) = v13;
        WORD5(v20) = 1024;
        HIDWORD(v20) = v14;
        uint64_t v7 = " [%s] %s:%d %@(%p) Update client[%p]. Current manager state=%d";
        uint64_t v8 = v11;
        uint32_t v9 = 64;
        goto LABEL_11;
      }
    }
  }
  uint64_t v15 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 216), "containsObject:", *(void *)(a1 + 40), *(_OWORD *)v17, *(void *)&v17[16], v18, v19, v20);
  [*(id *)(a1 + 32) updateDirectionWithClient:*(void *)(a1 + 40) settings:a1 + 48 isClientRegistered:v15];
  [*(id *)(a1 + 32) updateSpatialAudioWithClient:*(void *)(a1 + 40) settings:a1 + 48 isClientRegistered:v15];
  return [*(id *)(a1 + 32) updateVoiceProcessingWithClient:*(void *)(a1 + 40) settings:a1 + 48 isClientRegistered:v15];
}

- (void)refreshInputMetering
{
  v3[5] = *MEMORY[0x1E4F143B8];
  dispatchQueue = self->_dispatchQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__VCAudioManager_refreshInputMetering__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(dispatchQueue, v3);
}

uint64_t __38__VCAudioManager_refreshInputMetering__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setInputMetering];
}

- (void)refreshOutputMetering
{
  v3[5] = *MEMORY[0x1E4F143B8];
  dispatchQueue = self->_dispatchQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__VCAudioManager_refreshOutputMetering__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(dispatchQueue, v3);
}

uint64_t __39__VCAudioManager_refreshOutputMetering__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setOutputMetering];
}

- (void)refreshRemoteCodecType:(unsigned int)a3 sampleRate:(double)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__VCAudioManager_refreshRemoteCodecType_sampleRate___block_invoke;
  v5[3] = &unk_1E6DB3F58;
  v5[4] = self;
  *(double *)&v5[5] = a4;
  unsigned int v6 = a3;
  dispatch_async(dispatchQueue, v5);
}

uint64_t __52__VCAudioManager_refreshRemoteCodecType_sampleRate___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 200) audioUnitType];
  if (result == 1)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(_DWORD *)(v3 + 184);
    if (v4 == 3 || v4 == 2 && *(unsigned char *)(v3 + 255))
    {
      [*(id *)(v3 + 200) setRemoteCodecSampleRate:*(double *)(a1 + 40)];
      [*(id *)(*(void *)(a1 + 32) + 200) setRemoteCodecType:*(unsigned int *)(a1 + 48)];
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 168);
      unsigned int v6 = *(_DWORD *)(a1 + 48);
      double v7 = *(double *)(a1 + 40);
      return AUIOSetRemoteCodecInfo(v7, v5, v6);
    }
  }
  return result;
}

- (BOOL)startAudioSessionWithProperties:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  -[VCAudioManager setCurrentAudioSessionMediaProperties:](self, "setCurrentAudioSessionMediaProperties:");
  if (![(VCAudioSessionMediaProperties *)self->_currentAudioSessionMediaProperties isSessionActive]) {
    return 1;
  }
  int v15 = 0;
  if (self->_playbackMode == 1)
  {
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_15;
      }
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v19 = v7;
      __int16 v20 = 2080;
      uint64_t v21 = "-[VCAudioManager startAudioSessionWithProperties:]";
      __int16 v22 = 1024;
      int v23 = 2487;
      uint32_t v9 = " [%s] %s:%d Setting kCMSessionProperty_IsExpanseCallSession";
      uint64_t v10 = v8;
      uint32_t v11 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v5 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_15;
      }
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint64_t v13 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v19 = v12;
      __int16 v20 = 2080;
      uint64_t v21 = "-[VCAudioManager startAudioSessionWithProperties:]";
      __int16 v22 = 1024;
      int v23 = 2487;
      __int16 v24 = 2112;
      __int16 v25 = v5;
      __int16 v26 = 2048;
      __int16 v27 = self;
      uint32_t v9 = " [%s] %s:%d %@(%p) Setting kCMSessionProperty_IsExpanseCallSession";
      uint64_t v10 = v13;
      uint32_t v11 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
LABEL_15:
    id v14 = +[VCAudioSession sharedVoiceChatInstance];
    uint64_t v16 = *MEMORY[0x1E4F76290];
    uint64_t v17 = MEMORY[0x1E4F1CC38];
    objc_msgSend(v14, "updateAudioSessionPropertiesWithProperties:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
  }
  return [(VCAudioSession *)self->_audioSession startClient:self clientType:1 mediaProperties:a3 sessionRef:&v15];
}

- (BOOL)resetAudioSessionWithProperties:(id)a3 interruptSuccessful:(BOOL *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint32_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (a3)
        {
          [a3 outputFormat];
          int v10 = (int)v22;
        }
        else
        {
          int v10 = 0;
        }
        *(_DWORD *)buf = 136315906;
        uint64_t v24 = v8;
        __int16 v25 = 2080;
        __int16 v26 = "-[VCAudioManager resetAudioSessionWithProperties:interruptSuccessful:]";
        __int16 v27 = 1024;
        int v28 = 2500;
        __int16 v29 = 1024;
        LODWORD(v30) = v10;
        id v14 = " [%s] %s:%d sampleRate=%d";
        int v15 = v9;
        uint32_t v16 = 34;
        goto LABEL_17;
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v7 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (a3)
        {
          [a3 outputFormat];
          int v13 = (int)*(double *)&v19;
        }
        else
        {
          int v13 = 0;
          uint64_t v21 = 0;
          long long v19 = 0u;
          long long v20 = 0u;
        }
        *(_DWORD *)buf = 136316418;
        uint64_t v24 = v11;
        __int16 v25 = 2080;
        __int16 v26 = "-[VCAudioManager resetAudioSessionWithProperties:interruptSuccessful:]";
        __int16 v27 = 1024;
        int v28 = 2500;
        __int16 v29 = 2112;
        __int16 v30 = v7;
        __int16 v31 = 2048;
        __int16 v32 = self;
        __int16 v33 = 1024;
        int v34 = v13;
        id v14 = " [%s] %s:%d %@(%p) sampleRate=%d";
        int v15 = v12;
        uint32_t v16 = 54;
LABEL_17:
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }
  }
  if (objc_msgSend(a3, "isSessionActive", v19, v20, v21)
    && ![(VCAudioSession *)self->_audioSession resetClient:self mediaSetting:a3 interruptSuccessful:a4])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v17 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v17) {
        return v17;
      }
      -[VCAudioManager resetAudioSessionWithProperties:interruptSuccessful:]();
    }
    LOBYTE(v17) = 0;
  }
  else
  {
    [(VCAudioManager *)self setCurrentAudioSessionMediaProperties:a3];
    LOBYTE(v17) = 1;
  }
  return v17;
}

- (void)stopAudioSession
{
  if ([(VCAudioSessionMediaProperties *)self->_currentAudioSessionMediaProperties isSessionActive]) {
    [(VCAudioSession *)self->_audioSession stopClient:self];
  }

  [(VCAudioManager *)self setCurrentAudioSessionMediaProperties:0];
}

- (BOOL)setupInterruptThread
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_alloc_init(VCAudioRelay);
  self->_interruptThread = v3;
  if (!v3)
  {
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioManager setupInterruptThread]();
        }
      }
      goto LABEL_24;
    }
    if (objc_opt_respondsToSelector()) {
      unsigned int v6 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
    }
    else {
      unsigned int v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_24;
    }
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint32_t v9 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    *(_DWORD *)uint64_t v12 = 136316162;
    *(void *)&v12[4] = v8;
    *(_WORD *)&v12[12] = 2080;
    *(void *)&v12[14] = "-[VCAudioManager setupInterruptThread]";
    *(_WORD *)&v12[22] = 1024;
    LODWORD(v13) = 2529;
    WORD2(v13) = 2112;
    *(void *)((char *)&v13 + 6) = v6;
    HIWORD(v13) = 2048;
    id v14 = self;
    int v10 = " [%s] %s:%d %@(%p) Failed to allocate interrupt thread";
LABEL_27:
    _os_log_error_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_ERROR, v10, v12, 0x30u);
    goto LABEL_24;
  }
  int v4 = objc_alloc_init(VCAudioRelayIO);
  self->_interruptThreadClient = v4;
  if (self->_interruptThread)
  {
    [(VCAudioRelayIO *)v4 setMicCallback:VCAudioManager_PushAudioSamples];
    [(VCAudioRelayIO *)self->_interruptThreadClient setMicCallbackContext:&self->_sinkData];
    [(VCAudioRelayIO *)self->_interruptThreadClient setSpeakerCallback:VCAudioManager_PullAudioSamples];
    [(VCAudioRelayIO *)self->_interruptThreadClient setSpeakerCallbackContext:&self->_sourceData];
    if ([(VCAudioRelay *)self->_interruptThread setClientIO:self->_interruptThreadClient withError:0])
    {
      return 1;
    }
    goto LABEL_24;
  }
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioManager setupInterruptThread]();
      }
    }
    goto LABEL_24;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v7 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
  }
  else {
    uint64_t v7 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    uint32_t v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v12 = 136316162;
      *(void *)&v12[4] = v11;
      *(_WORD *)&v12[12] = 2080;
      *(void *)&v12[14] = "-[VCAudioManager setupInterruptThread]";
      *(_WORD *)&v12[22] = 1024;
      LODWORD(v13) = 2532;
      WORD2(v13) = 2112;
      *(void *)((char *)&v13 + 6) = v7;
      HIWORD(v13) = 2048;
      id v14 = self;
      int v10 = " [%s] %s:%d %@(%p) Failed to allocate interrupt thread client";
      goto LABEL_27;
    }
  }
LABEL_24:
  [(VCAudioManager *)self cleanupInterruptThread];
  return 0;
}

- (void)cleanupInterruptThread
{
  self->_interruptThreadClient = 0;
  self->_interruptThread = 0;
}

- (void)startInterruptThread
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to set the client IO", v2, v3, v4, v5, v6);
}

- (void)stopInterruptThread
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_interruptThreadState != 1)
  {
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_13;
      }
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_DWORD *)uint64_t v11 = 136315650;
      *(void *)&v11[4] = v4;
      *(_WORD *)&v11[12] = 2080;
      *(void *)&v11[14] = "-[VCAudioManager stopInterruptThread]";
      *(_WORD *)&v11[22] = 1024;
      LODWORD(v12) = 2585;
      uint8_t v6 = " [%s] %s:%d Stop the interrupt thread";
      uint64_t v7 = v5;
      uint32_t v8 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v3 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v3 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_13;
      }
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      int v10 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_DWORD *)uint64_t v11 = 136316162;
      *(void *)&v11[4] = v9;
      *(_WORD *)&v11[12] = 2080;
      *(void *)&v11[14] = "-[VCAudioManager stopInterruptThread]";
      *(_WORD *)&v11[22] = 1024;
      LODWORD(v12) = 2585;
      WORD2(v12) = 2112;
      *(void *)((char *)&v12 + 6) = v3;
      HIWORD(v12) = 2048;
      long long v13 = self;
      uint8_t v6 = " [%s] %s:%d %@(%p) Stop the interrupt thread";
      uint64_t v7 = v10;
      uint32_t v8 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, v11, v8);
LABEL_13:
    [(VCAudioRelay *)self->_interruptThread stopClientIO];
    self->_interruptThreadState = 1;
  }
}

- (void)didSessionStop
{
  v5[5] = *MEMORY[0x1E4F143B8];
  p_interruptingMutex = &self->_interruptingMutex;
  pthread_mutex_lock(&self->_interruptingMutex);
  self->_isInterrupting = 1;
  _VCAudioManager_ProcessEventQueue((uint64_t)&self->_sinkData);
  _VCAudioManager_ProcessEventQueue((uint64_t)&self->_sourceData);
  pthread_mutex_unlock(p_interruptingMutex);
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__VCAudioManager_didSessionStop__block_invoke;
  v5[3] = &unk_1E6DB3DC8;
  v5[4] = self;
  dispatch_async(dispatchQueue, v5);
}

void __32__VCAudioManager_didSessionStop__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long v20 = 136315650;
        *(void *)&v20[4] = v3;
        *(_WORD *)&v20[12] = 2080;
        *(void *)&v20[14] = "-[VCAudioManager didSessionStop]_block_invoke";
        *(_WORD *)&v20[22] = 1024;
        LODWORD(v21) = 2602;
        uint64_t v5 = " [%s] %s:%d CMSession interrupt begin";
        uint8_t v6 = v4;
        uint32_t v7 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, v5, v20, v7);
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
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        *(_DWORD *)long long v20 = 136316162;
        *(void *)&v20[4] = v8;
        *(_WORD *)&v20[12] = 2080;
        *(void *)&v20[14] = "-[VCAudioManager didSessionStop]_block_invoke";
        *(_WORD *)&v20[22] = 1024;
        LODWORD(v21) = 2602;
        WORD2(v21) = 2112;
        *(void *)((char *)&v21 + 6) = v2;
        HIWORD(v21) = 2048;
        uint64_t v22 = v10;
        uint64_t v5 = " [%s] %s:%d %@(%p) CMSession interrupt begin";
        uint8_t v6 = v9;
        uint32_t v7 = 48;
        goto LABEL_11;
      }
    }
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 255) = 1;
  objc_msgSend(*(id *)(a1 + 32), "updateStateWithAudioIOClient:", 0, *(_OWORD *)v20, *(void *)&v20[16], v21, v22);
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      long long v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long v20 = 136315650;
        *(void *)&v20[4] = v12;
        *(_WORD *)&v20[12] = 2080;
        *(void *)&v20[14] = "-[VCAudioManager didSessionStop]_block_invoke";
        *(_WORD *)&v20[22] = 1024;
        LODWORD(v21) = 2606;
        uint64_t v14 = " [%s] %s:%d CMSession interrupt begin, audio manager is now paused";
        uint64_t v15 = v13;
        uint32_t v16 = 28;
LABEL_22:
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, v20, v16);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v11 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      uint64_t v11 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      long long v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = *(void *)(a1 + 32);
        *(_DWORD *)long long v20 = 136316162;
        *(void *)&v20[4] = v17;
        *(_WORD *)&v20[12] = 2080;
        *(void *)&v20[14] = "-[VCAudioManager didSessionStop]_block_invoke";
        *(_WORD *)&v20[22] = 1024;
        LODWORD(v21) = 2606;
        WORD2(v21) = 2112;
        *(void *)((char *)&v21 + 6) = v11;
        HIWORD(v21) = 2048;
        uint64_t v22 = v19;
        uint64_t v14 = " [%s] %s:%d %@(%p) CMSession interrupt begin, audio manager is now paused";
        uint64_t v15 = v18;
        uint32_t v16 = 48;
        goto LABEL_22;
      }
    }
  }
}

- (void)didSessionEnd
{
  v3[5] = *MEMORY[0x1E4F143B8];
  dispatchQueue = self->_dispatchQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __31__VCAudioManager_didSessionEnd__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(dispatchQueue, v3);
}

void __31__VCAudioManager_didSessionEnd__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long v20 = 136315650;
        *(void *)&v20[4] = v3;
        *(_WORD *)&v20[12] = 2080;
        *(void *)&v20[14] = "-[VCAudioManager didSessionEnd]_block_invoke";
        *(_WORD *)&v20[22] = 1024;
        LODWORD(v21) = 2612;
        uint64_t v5 = " [%s] %s:%d CMSession interrupt end";
        uint8_t v6 = v4;
        uint32_t v7 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, v5, v20, v7);
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
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        *(_DWORD *)long long v20 = 136316162;
        *(void *)&v20[4] = v8;
        *(_WORD *)&v20[12] = 2080;
        *(void *)&v20[14] = "-[VCAudioManager didSessionEnd]_block_invoke";
        *(_WORD *)&v20[22] = 1024;
        LODWORD(v21) = 2612;
        WORD2(v21) = 2112;
        *(void *)((char *)&v21 + 6) = v2;
        HIWORD(v21) = 2048;
        uint64_t v22 = v10;
        uint64_t v5 = " [%s] %s:%d %@(%p) CMSession interrupt end";
        uint8_t v6 = v9;
        uint32_t v7 = 48;
        goto LABEL_11;
      }
    }
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 255) = 0;
  objc_msgSend(*(id *)(a1 + 32), "resetAudioSessionWithProperties:interruptSuccessful:", objc_msgSend(*(id *)(a1 + 32), "currentAudioSessionMediaProperties", *(_OWORD *)v20, *(void *)&v20[16], v21, v22), 0);
  [*(id *)(a1 + 32) updateStateWithAudioIOClient:0];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      long long v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long v20 = 136315650;
        *(void *)&v20[4] = v12;
        *(_WORD *)&v20[12] = 2080;
        *(void *)&v20[14] = "-[VCAudioManager didSessionEnd]_block_invoke";
        *(_WORD *)&v20[22] = 1024;
        LODWORD(v21) = 2616;
        uint64_t v14 = " [%s] %s:%d CMSession interrupt end, audio manager resume completed";
        uint64_t v15 = v13;
        uint32_t v16 = 28;
LABEL_22:
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, v20, v16);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v11 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      uint64_t v11 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      long long v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = *(void *)(a1 + 32);
        *(_DWORD *)long long v20 = 136316162;
        *(void *)&v20[4] = v17;
        *(_WORD *)&v20[12] = 2080;
        *(void *)&v20[14] = "-[VCAudioManager didSessionEnd]_block_invoke";
        *(_WORD *)&v20[22] = 1024;
        LODWORD(v21) = 2616;
        WORD2(v21) = 2112;
        *(void *)((char *)&v21 + 6) = v11;
        HIWORD(v21) = 2048;
        uint64_t v22 = v19;
        uint64_t v14 = " [%s] %s:%d %@(%p) CMSession interrupt end, audio manager resume completed";
        uint64_t v15 = v18;
        uint32_t v16 = 48;
        goto LABEL_22;
      }
    }
  }
}

- (void)serverDidDie
{
  v3[5] = *MEMORY[0x1E4F143B8];
  dispatchQueue = self->_dispatchQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __30__VCAudioManager_serverDidDie__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(dispatchQueue, v3);
}

uint64_t __30__VCAudioManager_serverDidDie__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 216);
  uint64_t result = [v1 countByEnumeratingWithState:&v7 objects:v6 count:16];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v5++), "delegate"), "serverDidDie");
      }
      while (v3 != v5);
      uint64_t result = [v1 countByEnumeratingWithState:&v7 objects:v6 count:16];
      uint64_t v3 = result;
    }
    while (result);
  }
  return result;
}

- (void)didUpdateBasebandCodec:(const _VCRemoteCodecInfo *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioManager didUpdateBasebandCodec:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v4 = (__CFString *)[(VCAudioManager *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v4 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint8_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v7 = 136316162;
        uint64_t v8 = v5;
        __int16 v9 = 2080;
        long long v10 = "-[VCAudioManager didUpdateBasebandCodec:]";
        __int16 v11 = 1024;
        int v12 = 2644;
        __int16 v13 = 2112;
        uint64_t v14 = v4;
        __int16 v15 = 2048;
        uint32_t v16 = self;
        _os_log_error_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unexpected SPI call", (uint8_t *)&v7, 0x30u);
      }
    }
  }
}

- (int)setVolume:(float)a3 withRampTime:(float)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  __int16 v11 = &v10;
  uint64_t v12 = 0x2020000000;
  int v13 = 0;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__VCAudioManager_setVolume_withRampTime___block_invoke;
  v7[3] = &unk_1E6DB3F80;
  v7[4] = self;
  v7[5] = &v10;
  float v8 = a3;
  float v9 = a4;
  dispatch_sync(dispatchQueue, v7);
  int v5 = *((_DWORD *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return v5;
}

uint64_t __41__VCAudioManager_setVolume_withRampTime___block_invoke(uint64_t a1)
{
  uint64_t result = AUIOSetDynamicDuckerVolume();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isGKVoiceChat
{
  return self->_isGKVoiceChat;
}

- (void)setIsGKVoiceChat:(BOOL)a3
{
  self->_isGKVoiceChat = a3;
}

- (BOOL)isMicrophoneMuted
{
  return self->_isMicrophoneMuted;
}

- (BOOL)isMixingVoiceWithMediaEnabled
{
  return self->_isMixingVoiceWithMediaEnabled;
}

- (BOOL)isSpeakerPhoneEnabled
{
  return self->_isSpeakerPhoneEnabled;
}

- (void)setSpeakerPhoneEnabled:(BOOL)a3
{
  self->_isSpeakerPhoneEnabled = a3;
}

- (VCAudioSessionMediaProperties)currentAudioSessionMediaProperties
{
  return self->_currentAudioSessionMediaProperties;
}

- (void)setCurrentAudioSessionMediaProperties:(id)a3
{
}

- (VCAudioUnitProperties)currentAudioUnitProperties
{
  return self->_currentAudioUnitProperties;
}

- (void)setCurrentAudioUnitProperties:(id)a3
{
}

- (BOOL)isInDaemon
{
  return self->_isInDaemon;
}

- (void)setIsInDaemon:(BOOL)a3
{
  self->_isInDaemon = a3;
}

- (NSDictionary)vpOperatingModeToAudioSessionMediaFormatMapping
{
  return self->_vpOperatingModeToAudioSessionMediaFormatMapping;
}

- (void)setVpOperatingModeToAudioSessionMediaFormatMapping:(id)a3
{
}

- (void)initWithAudioSessionMode:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate stateStrings array", v2, v3, v4, v5, v6);
}

- (void)initWithAudioSessionMode:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to pass a valid audio session", v2, v3, v4, v5, v6);
}

- (void)initWithAudioSessionMode:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the dispatch queue", v2, v3, v4, v5, v6);
}

- (void)initWithAudioSessionMode:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate client array", v2, v3, v4, v5, v6);
}

- (void)initWithAudioSessionMode:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate starting IO client array", v2, v3, v4, v5, v6);
}

- (void)initWithAudioSessionMode:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate source event queue", v2, v3, v4, v5, v6);
}

- (void)initWithAudioSessionMode:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate sink event queue", v2, v3, v4, v5, v6);
}

- (void)initWithAudioSessionMode:.cold.8()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create allocate the spatial context dictionary", v2, v3, v4, v5, v6);
}

- (void)initWithAudioSessionMode:.cold.9()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create allocate the audio session muted dictionary", v2, v3, v4, v5, v6);
}

- (void)initWithAudioSessionMode:.cold.10()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create the interrupt thread", v2, v3, v4, v5, v6);
}

- (void)initWithAudioSessionMode:.cold.11()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to initialize sink data link list", v2, v3, v4, v5, v6);
}

- (void)initWithAudioSessionMode:.cold.12()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to initialize source data link list", v2, v3, v4, v5, v6);
}

- (void)getAudioSessionMediaProperties:forVPOperatingMode:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AudioComponentFindNext failed", v2, v3, v4, v5, v6);
}

- (void)getAudioSessionMediaProperties:forVPOperatingMode:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCAudioManager getAudioSessionMediaProperties:forVPOperatingMode:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Get property failed (block size): %x", v2, *(const char **)v3, (unint64_t)"-[VCAudioManager getAudioSessionMediaProperties:forVPOperatingMode:]" >> 16, v4);
}

- (void)getAudioSessionMediaProperties:forVPOperatingMode:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AudioComponentInstanceNew failed", v2, v3, v4, v5, v6);
}

- (void)startAUIOWithProperties:.cold.1()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v3 = "-[VCAudioManager startAUIOWithProperties:]";
  OUTLINED_FUNCTION_3();
  int v4 = 1325;
  __int16 v5 = v0;
  int v6 = 1325;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCAudioManager.m:%d: Failed to create the audio limiter", v2, 0x22u);
}

- (void)startAUIOWithProperties:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCAudioManager startAUIOWithProperties:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AUIOSetupFormats() failed. hResult=0x%08X", v2, *(const char **)v3, (unint64_t)"-[VCAudioManager startAUIOWithProperties:]" >> 16, v4);
}

- (void)startAUIOWithProperties:.cold.3()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCAudioManager startAUIOWithProperties:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to register muted talker notification callback hResult=0x%08X", v2, *(const char **)v3, (unint64_t)"-[VCAudioManager startAUIOWithProperties:]" >> 16, v4);
}

- (void)startAUIOWithProperties:.cold.4()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v3 = "-[VCAudioManager startAUIOWithProperties:]";
  OUTLINED_FUNCTION_3();
  int v4 = 1327;
  __int16 v5 = v0;
  int v6 = 1327;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCAudioManager.m:%d: Failed to start the audio limiter", v2, 0x22u);
}

- (void)startAUIOWithProperties:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AUIO already exists", v2, v3, v4, v5, v6);
}

- (void)resetAUIOWithProperties:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCAudioManager resetAUIOWithProperties:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AUIOSetupFormat failed. result=%d", v2, *(const char **)v3, (unint64_t)"-[VCAudioManager resetAUIOWithProperties:]" >> 16, v4);
}

- (void)resetAUIOWithProperties:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCAudioManager resetAUIOWithProperties:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Receiver ready AUIO notification failed. result=%d", v2, *(const char **)v3, (unint64_t)"-[VCAudioManager resetAUIOWithProperties:]" >> 16, v4);
}

- (void)registerClientIO:controllerIO:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d CMSimpleQueueEnqueue Full", v2, v3, v4, v5, v6);
}

- (void)unregisterClientIO:controllerIO:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d CMSimpleQueueEnqueue Full", v2, v3, v4, v5, v6);
}

- (void)registerForMutedTalkerNotification:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Muted talker notification handler is nil", v2, v3, v4, v5, v6);
}

void __53__VCAudioManager_registerForMutedTalkerNotification___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Muted talker notification handler already registered", v2, v3, v4, v5, v6);
}

void __55__VCAudioManager_unregisterFromMutedTalkerNotification__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Muted talker notification handler not registered", v2, v3, v4, v5, v6);
}

- (void)registerAudioSessionId:maxChannelCountMic:maxChannelCountSpeaker:spatialMetadata:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCAudioManager registerAudioSessionId:maxChannelCountMic:maxChannelCountSpeaker:spatialMetadata:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate audio session context for audioSessionId=%u", v2, *(const char **)v3, (unint64_t)"-[VCAudioManager registerAudioSessionId:maxChannelCountMic:maxChannelCountSpeaker:spatialMetadata:]" >> 16, v4);
}

void __99__VCAudioManager_registerAudioSessionId_maxChannelCountMic_maxChannelCountSpeaker_spatialMetadata___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Session context for audioSessionId=%u is already registered", v2, v3, v4, v5);
}

void __43__VCAudioManager_unregisterAudioSessionId___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Session context for audioSessionId=%u is not registered", v2, v3, v4, v5);
}

void __70__VCAudioManager_setSpatialMetadata_audioSessionId_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Spatial context for audioSessionId=%u is not registered", v2, v3, v4, v5);
}

- (void)setupVAD
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Incorrect playback mode", v2, v3, v4, v5, v6);
}

- (void)stateRunningWithAudioUnitProperties:sessionProperties:client:newState:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AUIO receiver ready notification failed. result=%d", v3, v4, v5, v2);
}

- (void)stateRunningWithAudioUnitProperties:sessionProperties:client:newState:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCAudioManager stateRunningWithAudioUnitProperties:sessionProperties:client:newState:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to resume AUIO. result=%d", v2, *(const char **)v3, (unint64_t)"-[VCAudioManager stateRunningWithAudioUnitProperties:sessionProperties:client:newState:]" >> 16, v4);
}

- (void)stateRunningWithAudioUnitProperties:sessionProperties:client:newState:.cold.3()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCAudioManager stateRunningWithAudioUnitProperties:sessionProperties:client:newState:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AUIO receiver ready notification failed. result=%d", v2, *(const char **)v3, (unint64_t)"-[VCAudioManager stateRunningWithAudioUnitProperties:sessionProperties:client:newState:]" >> 16, v4);
}

- (void)stateRunningWithAudioUnitProperties:sessionProperties:client:newState:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to reset audio limiter", v2, v3, v4, v5, v6);
}

- (void)stateRunningWithAudioUnitProperties:sessionProperties:client:newState:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to reset AUIO", v2, v3, v4, v5, v6);
}

- (void)stateRunningWithAudioUnitProperties:sessionProperties:client:newState:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to reset audio session", v2, v3, v4, v5, v6);
}

- (void)startClient:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Client is nil!", v2, v3, v4, v5, v6);
}

void __30__VCAudioManager_startClient___block_invoke_cold_1(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [*a2 deviceRole];
  int v7 = 136315906;
  uint64_t v8 = a1;
  __int16 v9 = 2080;
  uint64_t v10 = "-[VCAudioManager startClient:]_block_invoke";
  OUTLINED_FUNCTION_3();
  int v11 = 2315;
  __int16 v12 = v5;
  int v13 = v6;
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Invalid device role: %d!", (uint8_t *)&v7, 0x22u);
}

void __30__VCAudioManager_startClient___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  LODWORD(v6) = 2326;
  WORD2(v6) = 2048;
  HIWORD(v6) = v0;
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v1, v2, " [%s] %s:%d controller start client FAILED (audioIO=%p)", v3, v4, v5, v6);
}

void __30__VCAudioManager_startClient___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Client already registered!", v2, v3, v4, v5, v6);
}

- (void)stopClient:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Client is nil!", v2, v3, v4, v5, v6);
}

void __29__VCAudioManager_stopClient___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d controller stop client FAILED (audioIO=%p)", v2, v3, v4, v5);
}

void __29__VCAudioManager_stopClient___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_9_0();
  _os_log_fault_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_FAULT, " [%s] %s:%d controller stop client FAILED (audioIO=%p)", v1, 0x26u);
}

- (void)updateSpatialAudioWithClient:settings:isClientRegistered:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCAudioManager updateSpatialAudioWithClient:settings:isClientRegistered:]";
  OUTLINED_FUNCTION_3();
  LODWORD(v4) = 2404;
  WORD2(v4) = 2048;
  HIWORD(v4) = v0;
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d controller update FAILED (audioIO=%p)", v2, *(const char **)v3, (unint64_t)"-[VCAudioManager updateSpatialAudioWithClient:settings:isClientRegistered:]" >> 16, v4);
}

- (void)updateVoiceProcessingWithClient:settings:isClientRegistered:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d CMSimpleQueueEnqueue Full", v2, v3, v4, v5, v6);
}

- (void)updateClient:settings:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid parameter: client is nil", v2, v3, v4, v5, v6);
}

- (void)updateClient:settings:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid parameter: settings is NULL", v2, v3, v4, v5, v6);
}

- (void)resetAudioSessionWithProperties:interruptSuccessful:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to reset audio client", v2, v3, v4, v5, v6);
}

- (void)setupInterruptThread
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate interrupt thread client", v2, v3, v4, v5, v6);
}

- (void)didUpdateBasebandCodec:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unexpected SPI call", v2, v3, v4, v5, v6);
}

@end