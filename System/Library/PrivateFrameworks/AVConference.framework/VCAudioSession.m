@interface VCAudioSession
+ (BOOL)convertAudioSessionProperties:(id)a3 operatingMode:(int *)a4 deviceRole:(int *)a5 enableAudioPreWarming:(BOOL *)a6 audioClockDeviceEnabled:(BOOL *)a7 networkUplinkClockUsesBaseband:(BOOL *)a8;
+ (BOOL)shouldUseHomeKitConfigurationForAudioMode:(id)a3;
+ (id)sharedSystemAudioInputInstance;
+ (id)sharedSystemAudioOutputInstance;
+ (id)sharedVoiceChatInstance;
+ (id)stringFromFormat:(const AudioStreamBasicDescription *)a3;
+ (void)terminateProcess:(id)a3 terminateSource:(id)a4 agent:(opaqueRTCReporting *)a5;
- (BOOL)applyAudioSessionMediaProperties:(id)a3;
- (BOOL)applyRequestedProperties:(id)a3 propertyOrder:(id)a4;
- (BOOL)applyRequestedProperty:(id)a3 defaultValue:(void *)a4;
- (BOOL)didRequestArrayPropertyChange:(id)a3;
- (BOOL)didRequestBoolPropertyChange:(id)a3;
- (BOOL)didRequestDataPropertyChange:(id)a3;
- (BOOL)didRequestDictionaryPropertyChange:(id)a3;
- (BOOL)didRequestStringPropertyChange:(id)a3;
- (BOOL)didRequestedPropertyChange:(id)a3 propertyClass:(Class)a4 compareSelector:(SEL)a5;
- (BOOL)forceBufferFrames:(int *)a3;
- (BOOL)hasStarted;
- (BOOL)internalSelectMicrophoneWithType:(unsigned int)a3;
- (BOOL)isAnswerOnHoldUpdateParameters:(id)a3;
- (BOOL)isInputSupported;
- (BOOL)microphoneMuted;
- (BOOL)resetClient:(id)a3 mediaSetting:(id)a4 interruptSuccessful:(BOOL *)a5;
- (BOOL)setSampleRate:(double)a3;
- (BOOL)setVPBlockConfigurationProperties:(id)a3;
- (BOOL)shouldResetAudioSession;
- (BOOL)shouldSetupSharePlayWithOperatingMode:(unsigned int)a3 isSharePlayCapable:(BOOL *)a4;
- (BOOL)startClient:(id)a3 clientType:(unsigned __int8)a4 mediaProperties:(id)a5 sessionRef:(unsigned int *)a6;
- (BOOL)startInternal;
- (BOOL)startSessionWithMediaProperties:(id)a3 sessionRef:(unsigned int *)a4;
- (BOOL)stopClient:(id)a3;
- (BOOL)stopSession;
- (BOOL)validNewStartingClient:(id)a3;
- (NSDictionary)audioSessionProperties;
- (VCAudioSession)initWithMode:(int)a3;
- (double)externalInputAudioLatency;
- (double)externalOutputAudioLatency;
- (int)clientPid;
- (unsigned)audioSessionId;
- (void)addPropertyToBatchedDictionary:(id)a3 property:(id)a4 defaultValue:(id)a5 propertyOrderArray:(id)a6;
- (void)applyAudioModeWithDefaultValue:(void *)a3 shouldApplyRequestedProperty:(BOOL)a4;
- (void)applyAudioSessionPropertiesWithVPOperatingMode:(unsigned int)a3;
- (void)applyDynamicSessionProperties;
- (void)cleanupMicSources;
- (void)dealloc;
- (void)didAvailableSampleRateChange;
- (void)didInterruptionEnded;
- (void)didPause;
- (void)didResume;
- (void)didStop;
- (void)dispatchedRefreshAudioSessionProperties;
- (void)dispatchedSetAudioSessionProperties:(id)a3;
- (void)handleAudioSessionInterruption:(id)a3;
- (void)invalidateCache;
- (void)refreshAudioSessionProperties;
- (void)resetOverrideRoute;
- (void)resumeActiveClient;
- (void)selectMicrophoneWithType:(unsigned int)a3;
- (void)selectNewActiveClient;
- (void)serverDidDie;
- (void)setAudioSessionMode:(id)a3;
- (void)setAudioSessionProperties:(id)a3;
- (void)setBlockSize:(double)a3 sampleRate:(double)a4 force:(BOOL)a5;
- (void)setBlockSizeOnSampleRateChange;
- (void)setClientPid:(int)a3;
- (void)setMicrophoneMuted:(BOOL)a3;
- (void)setMuteStateChangedHandler:(id)a3 delegateQueue:(id)a4;
- (void)setOptimizedTelephonyHandoverSettings:(BOOL)a3 networkUplinkClockUsesBaseband:(BOOL)a4;
- (void)setSpeakerProperty:(id)a3;
- (void)setUpVPBlockFormatWithProperties:(id)a3;
- (void)setupInputBeamforming;
- (void)updateAudioSessionPropertiesWithProperties:(id)a3;
- (void)upgradeAudioSessionProperties;
@end

@implementation VCAudioSession

+ (id)sharedVoiceChatInstance
{
  if (sharedVoiceChatInstance_onceToken_0 != -1) {
    dispatch_once(&sharedVoiceChatInstance_onceToken_0, &__block_literal_global_37);
  }
  return (id)sharedVoiceChatInstance__VCAudioSessionVoiceChat;
}

uint64_t __41__VCAudioSession_sharedVoiceChatInstance__block_invoke(uint64_t result)
{
  if (!sharedVoiceChatInstance__VCAudioSessionVoiceChat)
  {
    int v1 = VCFeatureFlagManager_UseAvconferencedOniOSSpecficFeatures(result);
    v2 = off_1E6DB2FD8;
    if (!v1) {
      v2 = off_1E6DB2FE0;
    }
    result = [objc_alloc(*v2) initWithMode:0];
    sharedVoiceChatInstance__VCAudioSessionVoiceChat = result;
  }
  return result;
}

+ (id)sharedSystemAudioOutputInstance
{
  if (sharedSystemAudioOutputInstance_onceToken_0 != -1) {
    dispatch_once(&sharedSystemAudioOutputInstance_onceToken_0, &__block_literal_global_28);
  }
  return (id)sharedSystemAudioOutputInstance__VCAudioSessionSystemAudioOutput;
}

uint64_t __49__VCAudioSession_sharedSystemAudioOutputInstance__block_invoke(uint64_t a1)
{
  int v1 = VCFeatureFlagManager_UseAvconferencedOniOSSpecficFeatures(a1);
  v2 = off_1E6DB2FD8;
  if (!v1) {
    v2 = off_1E6DB2FE0;
  }
  uint64_t result = [objc_alloc(*v2) initWithMode:1];
  sharedSystemAudioOutputInstance__VCAudioSessionSystemAudioOutput = result;
  return result;
}

+ (id)sharedSystemAudioInputInstance
{
  if (sharedSystemAudioInputInstance_onceToken_0 != -1) {
    dispatch_once(&sharedSystemAudioInputInstance_onceToken_0, &__block_literal_global_30);
  }
  return (id)sharedSystemAudioInputInstance__VCAudioSessionSystemAudioInput;
}

uint64_t __48__VCAudioSession_sharedSystemAudioInputInstance__block_invoke(uint64_t a1)
{
  int v1 = VCFeatureFlagManager_UseAvconferencedOniOSSpecficFeatures(a1);
  v2 = off_1E6DB2FD8;
  if (!v1) {
    v2 = off_1E6DB2FE0;
  }
  uint64_t result = [objc_alloc(*v2) initWithMode:2];
  sharedSystemAudioInputInstance__VCAudioSessionSystemAudioInput = result;
  return result;
}

+ (void)terminateProcess:(id)a3 terminateSource:(id)a4 agent:(opaqueRTCReporting *)a5
{
}

- (VCAudioSession)initWithMode:(int)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)VCAudioSession;
  v4 = [(VCObject *)&v17 init];
  v5 = v4;
  if (v4)
  {
    v4->_playbackMode = a3;
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(62);
    v5->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.cmSessionQueue", 0, CustomRootQueue);
    v5->_clients = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v5->_BOOL isTetheredDisplayMode = CFPreferencesGetAppBooleanValue(@"EnableTetheredDisplayPortMode", (CFStringRef)*MEMORY[0x1E4F1D3B8], 0) != 0;
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    v8 = (os_log_t *)MEMORY[0x1E4F47A50];
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        BOOL isTetheredDisplayMode = v5->_isTetheredDisplayMode;
        *(_DWORD *)buf = 136315906;
        uint64_t v19 = v9;
        __int16 v20 = 2080;
        v21 = "-[VCAudioSession initWithMode:]";
        __int16 v22 = 1024;
        int v23 = 134;
        __int16 v24 = 1024;
        BOOL v25 = isTetheredDisplayMode;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d isTetheredDisplayMode[%d]", buf, 0x22u);
      }
    }
    v5->_currentClientPid = 0x7FFFFFFF;
    v5->_currentAudioSessionProperties = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v5->_BOOL useOptimizedHandoversForTelephony = +[VCHardwareSettings supportsOptimizedHandoversForTelephony];
    v5->_BOOL deferredNetworkUplinkClockEnabled = +[VCDefaults BOOLeanValueForKey:@"enableDeferredNetworkUplinkClockUpdate" defaultValue:1];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        BOOL useOptimizedHandoversForTelephony = v5->_useOptimizedHandoversForTelephony;
        BOOL deferredNetworkUplinkClockEnabled = v5->_deferredNetworkUplinkClockEnabled;
        *(_DWORD *)buf = 136316162;
        uint64_t v19 = v12;
        __int16 v20 = 2080;
        v21 = "-[VCAudioSession initWithMode:]";
        __int16 v22 = 1024;
        int v23 = 139;
        __int16 v24 = 1024;
        BOOL v25 = useOptimizedHandoversForTelephony;
        __int16 v26 = 1024;
        BOOL v27 = deferredNetworkUplinkClockEnabled;
        _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d useOptimizedHandoversForTelephony=%d deferredNetworkUplinkClockEnabled=%d", buf, 0x28u);
      }
    }
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  dispatch_release((dispatch_object_t)self->_dispatchQueue);
  v3.receiver = self;
  v3.super_class = (Class)VCAudioSession;
  [(VCObject *)&v3 dealloc];
}

- (void)resetOverrideRoute
{
}

- (BOOL)isAnswerOnHoldUpdateParameters:(id)a3
{
  uint64_t v4 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F76008]];
  if (v4)
  {
    LODWORD(v4) = [v4 BOOLValue];
    if (v4)
    {
      if ([a3 objectForKeyedSubscript:*MEMORY[0x1E4F75EC8]]) {
        LOBYTE(v4) = 0;
      }
      else {
        LOBYTE(v4) = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F75F00]] == 0;
      }
    }
  }
  return (char)v4;
}

- (NSDictionary)audioSessionProperties
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  requestedAudioSessionProperties = self->_requestedAudioSessionProperties;
  BOOL BoolValueForKey = VCDefaults_GetBoolValueForKey(@"simulateAppleCalling", 0);
  uint64_t v4 = (void *)MEMORY[0x1E4F75FC8];
  v5 = (uint64_t *)MEMORY[0x1E4F75EC8];
  v6 = (uint64_t *)MEMORY[0x1E4F75928];
  v7 = (void *)MEMORY[0x1E4F75F00];
  if (BoolValueForKey)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v22 = v8;
        __int16 v23 = 2080;
        __int16 v24 = "-[VCAudioSession audioSessionProperties]";
        __int16 v25 = 1024;
        int v26 = 182;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Forcing apple calling", buf, 0x1Cu);
      }
    }
    uint64_t v10 = *v5;
    v19[0] = *v4;
    v19[1] = v10;
    uint64_t v11 = *v6;
    v20[0] = &unk_1F3DC43F8;
    v20[1] = v11;
    v19[2] = *v7;
    v20[2] = *MEMORY[0x1E4F75BC0];
    requestedAudioSessionProperties = (NSMutableDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
  }
  if (VCDefaults_GetBoolValueForKey(@"forceIbisMode", 0))
  {
    uint64_t v12 = *v5;
    v17[0] = *v4;
    v17[1] = v12;
    uint64_t v13 = *v6;
    v18[0] = &unk_1F3DC43F8;
    v18[1] = v13;
    v17[2] = *v7;
    v18[2] = *MEMORY[0x1E4F75AA0];
    requestedAudioSessionProperties = (NSMutableDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v22 = v14;
        __int16 v23 = 2080;
        __int16 v24 = "-[VCAudioSession audioSessionProperties]";
        __int16 v25 = 1024;
        int v26 = 193;
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Forcing Ibis mode", buf, 0x1Cu);
      }
    }
  }
  return &requestedAudioSessionProperties->super;
}

- (void)setAudioSessionProperties:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__VCAudioSession_setAudioSessionProperties___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  block[5] = a3;
  dispatch_async(dispatchQueue, block);
}

uint64_t __44__VCAudioSession_setAudioSessionProperties___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedSetAudioSessionProperties:*(void *)(a1 + 40)];
}

- (BOOL)hasStarted
{
}

- (BOOL)isInputSupported
{
}

- (void)dispatchedSetAudioSessionProperties:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v23 = v5;
      __int16 v24 = 2080;
      __int16 v25 = "-[VCAudioSession dispatchedSetAudioSessionProperties:]";
      __int16 v26 = 1024;
      int v27 = 215;
      __int16 v28 = 2112;
      uint64_t v29 = [a3 description];
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d : %@", buf, 0x26u);
    }
  }
  if ([(VCAudioSession *)self isAnswerOnHoldUpdateParameters:a3])
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_requestedAudioSessionProperties, "setObject:forKeyedSubscript:", [a3 objectForKeyedSubscript:*MEMORY[0x1E4F76008]], *MEMORY[0x1E4F76008]);
    if ([(VCAudioSession *)self hasStarted]) {
      [(VCAudioSession *)self setSpeakerProperty:a3];
    }
  }
  else
  {
    v7 = (NSMutableDictionary *)[a3 objectForKeyedSubscript:@"AVAudioClientBatchMXPropertiesKey"];
    uint64_t v8 = *MEMORY[0x1E4F75EC8];
    if (([a3 objectForKeyedSubscript:*MEMORY[0x1E4F75EC8]]
       || [(NSMutableDictionary *)v7 objectForKeyedSubscript:v8])
      && ((uint64_t v9 = *MEMORY[0x1E4F75F00], [a3 objectForKeyedSubscript:*MEMORY[0x1E4F75F00]])
       || [(NSMutableDictionary *)v7 objectForKeyedSubscript:v9]))
    {

      self->_requestedAudioSessionProperties = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:a3];
      if (v7)
      {
        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        uint64_t v10 = (void *)[(NSMutableDictionary *)v7 allKeys];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v17 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v19;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v19 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
              if ([(NSMutableDictionary *)self->_requestedAudioSessionProperties objectForKeyedSubscript:v15])
              {
                requestedAudioSessionProperties = self->_requestedAudioSessionProperties;
              }
              else
              {
                requestedAudioSessionProperties = v7;
              }
              [(NSMutableDictionary *)self->_requestedAudioSessionProperties setObject:[(NSMutableDictionary *)requestedAudioSessionProperties objectForKeyedSubscript:v15] forKeyedSubscript:v15];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v17 count:16];
          }
          while (v12);
        }
      }
      if ([(VCAudioSession *)self hasStarted]) {
        [(VCAudioSession *)self applyDynamicSessionProperties];
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioSession dispatchedSetAudioSessionProperties:]();
      }
    }
  }
}

- (void)setSpeakerProperty:(id)a3
{
}

- (void)applyDynamicSessionProperties
{
  uint64_t v3 = *MEMORY[0x1E4F761F8];
  if ([(VCAudioSession *)self didRequestDictionaryPropertyChange:*MEMORY[0x1E4F761F8]])
  {
    [(VCAudioSession *)self applyRequestedProperty:v3 defaultValue:0];
  }
  uint64_t v4 = *MEMORY[0x1E4F76290];
  if ([(VCAudioSession *)self didRequestBoolPropertyChange:*MEMORY[0x1E4F76290]]) {
    [(VCAudioSession *)self applyRequestedProperty:v4 defaultValue:MEMORY[0x1E4F1CC28]];
  }
  uint64_t v5 = *MEMORY[0x1E4F75E90];
  if ([(VCAudioSession *)self didRequestArrayPropertyChange:*MEMORY[0x1E4F75E90]]) {
    [(VCAudioSession *)self applyRequestedProperty:v5 defaultValue:MEMORY[0x1E4F1CBF0]];
  }
  if (self->_useOptimizedHandoversForTelephony
    && [(VCAudioSession *)self didRequestBoolPropertyChange:@"kVirtualAudioPluginVPBlockConfigurationNetworkUplinkClockUsesBaseband"])
  {
    [(VCAudioSession *)self applyRequestedProperty:@"kVirtualAudioPluginVPBlockConfigurationNetworkUplinkClockUsesBaseband" defaultValue:MEMORY[0x1E4F1CC28]];
  }
  uint64_t v6 = *MEMORY[0x1E4F76550];
  if ([(VCAudioSession *)self didRequestBoolPropertyChange:*MEMORY[0x1E4F76550]])
  {
    uint64_t v7 = MEMORY[0x1E4F1CC28];
    [(VCAudioSession *)self applyRequestedProperty:v6 defaultValue:v7];
  }
}

- (void)dispatchedRefreshAudioSessionProperties
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v3 = *MEMORY[0x1E4F75EC8];
  if ([(VCAudioSession *)self didRequestStringPropertyChange:*MEMORY[0x1E4F75EC8]]) {
    [(VCAudioSession *)self applyRequestedProperty:v3 defaultValue:*MEMORY[0x1E4F75928]];
  }
  if ([(VCAudioSession *)self didRequestStringPropertyChange:*MEMORY[0x1E4F75F00]]) {
    [(VCAudioSession *)self applyAudioModeWithDefaultValue:*MEMORY[0x1E4F75B08] shouldApplyRequestedProperty:1];
  }
  uint64_t v4 = *MEMORY[0x1E4F761B0];
  if ([(VCAudioSession *)self didRequestArrayPropertyChange:*MEMORY[0x1E4F761B0]]) {
    [(VCAudioSession *)self applyRequestedProperty:v4 defaultValue:0];
  }
  if (self->_useOptimizedHandoversForTelephony
    && [(VCAudioSession *)self didRequestBoolPropertyChange:@"kVirtualAudioPluginVPBlockConfigurationNetworkUplinkClockUsesBaseband"])
  {
    uint64_t v5 = MEMORY[0x1E4F1CC28];
    [(VCAudioSession *)self applyRequestedProperty:@"kVirtualAudioPluginVPBlockConfigurationNetworkUplinkClockUsesBaseband" defaultValue:v5];
  }
}

- (void)refreshAudioSessionProperties
{
  v3[5] = *MEMORY[0x1E4F143B8];
  dispatchQueue = self->_dispatchQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__VCAudioSession_refreshAudioSessionProperties__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_sync(dispatchQueue, v3);
}

uint64_t __47__VCAudioSession_refreshAudioSessionProperties__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedRefreshAudioSessionProperties];
}

- (void)updateAudioSessionPropertiesWithProperties:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__VCAudioSession_updateAudioSessionPropertiesWithProperties___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  block[5] = a3;
  dispatch_async(dispatchQueue, block);
}

void __61__VCAudioSession_updateAudioSessionPropertiesWithProperties___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 184);
  if (v2) {
    id v3 = (id)[v2 mutableCopy];
  }
  else {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v4 = v3;
  [v3 addEntriesFromDictionary:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) dispatchedSetAudioSessionProperties:v4];
}

- (void)invalidateCache
{
}

- (BOOL)didRequestBoolPropertyChange:(id)a3
{
  id v5 = [(NSDictionary *)[(VCAudioSession *)self audioSessionProperties] objectForKeyedSubscript:a3];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = (void *)[(NSMutableDictionary *)self->_currentAudioSessionProperties objectForKeyedSubscript:a3];
    if (v7)
    {
      char v8 = [v7 BOOLValue];
      LOBYTE(v5) = v8 ^ [v6 BOOLValue];
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return (char)v5;
}

- (BOOL)didRequestedPropertyChange:(id)a3 propertyClass:(Class)a4 compareSelector:(SEL)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_currentAudioSessionProperties, "objectForKeyedSubscript:");
  id v10 = [(NSDictionary *)[(VCAudioSession *)self audioSessionProperties] objectForKeyedSubscript:a3];
  if (v10)
  {
    id v11 = v10;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        uint64_t v14 = *MEMORY[0x1E4F47A50];
        BOOL v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v12) {
          return v12;
        }
        uint64_t v15 = NSStringFromClass(a4);
        v16 = (objc_class *)objc_opt_class();
        int v18 = 136316418;
        uint64_t v19 = v13;
        __int16 v20 = 2080;
        long long v21 = "-[VCAudioSession didRequestedPropertyChange:propertyClass:compareSelector:]";
        __int16 v22 = 1024;
        int v23 = 343;
        __int16 v24 = 2112;
        __int16 v25 = v15;
        __int16 v26 = 2112;
        id v27 = a3;
        __int16 v28 = 2112;
        uint64_t v29 = NSStringFromClass(v16);
        _os_log_error_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_ERROR, " [%s] %s:%d Unexpected class=%@ for property=%@. Expected class=%@", (uint8_t *)&v18, 0x3Au);
      }
      LOBYTE(v12) = 0;
      return v12;
    }
    if (v9) {
      LOBYTE(v12) = [v9 performSelector:a5 withObject:v11] == 0;
    }
    else {
      LOBYTE(v12) = 1;
    }
  }
  else
  {
    LOBYTE(v12) = v9 != 0;
  }
  return v12;
}

- (BOOL)didRequestStringPropertyChange:(id)a3
{
  uint64_t v5 = objc_opt_class();

  return [(VCAudioSession *)self didRequestedPropertyChange:a3 propertyClass:v5 compareSelector:sel_isEqualToString_];
}

- (BOOL)didRequestArrayPropertyChange:(id)a3
{
  uint64_t v5 = objc_opt_class();

  return [(VCAudioSession *)self didRequestedPropertyChange:a3 propertyClass:v5 compareSelector:sel_isEqualToArray_];
}

- (BOOL)didRequestDataPropertyChange:(id)a3
{
  uint64_t v5 = objc_opt_class();

  return [(VCAudioSession *)self didRequestedPropertyChange:a3 propertyClass:v5 compareSelector:sel_isEqualToData_];
}

- (BOOL)didRequestDictionaryPropertyChange:(id)a3
{
  uint64_t v5 = objc_opt_class();

  return [(VCAudioSession *)self didRequestedPropertyChange:a3 propertyClass:v5 compareSelector:sel_isEqualToDictionary_];
}

- (BOOL)applyRequestedProperty:(id)a3 defaultValue:(void *)a4
{
}

- (BOOL)applyRequestedProperties:(id)a3 propertyOrder:(id)a4
{
}

- (void)applyAudioSessionPropertiesWithVPOperatingMode:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (self->_playbackMode == 1 && a3 == 0 || a3 == 7) {
    uint64_t v7 = &unk_1F3DC4410;
  }
  else {
    uint64_t v7 = &unk_1F3DC43F8;
  }
  self->_unsigned int vpOperatingMode = a3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int vpOperatingMode = self->_vpOperatingMode;
      *(_DWORD *)buf = 136316162;
      uint64_t v28 = v8;
      __int16 v29 = 2080;
      uint64_t v30 = "-[VCAudioSession applyAudioSessionPropertiesWithVPOperatingMode:]";
      __int16 v31 = 1024;
      int v32 = 383;
      __int16 v33 = 1024;
      unsigned int v34 = vpOperatingMode;
      __int16 v35 = 1024;
      int v36 = [v7 intValue];
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _vpOperatingMode=%d, priority=%d", buf, 0x28u);
    }
  }
  id v11 = (id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[VCAudioSession audioSessionProperties](self, "audioSessionProperties"), "objectForKeyedSubscript:", @"AVAudioClientBatchMXPropertiesKey"), "mutableCopy");
  if (!v11) {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(VCAudioSession *)self addPropertyToBatchedDictionary:v11 property:*MEMORY[0x1E4F75FC8] defaultValue:v7 propertyOrderArray:v12];
  [(VCAudioSession *)self addPropertyToBatchedDictionary:v11 property:*MEMORY[0x1E4F75EC8] defaultValue:*MEMORY[0x1E4F75928] propertyOrderArray:v12];
  uint64_t v13 = *MEMORY[0x1E4F75B08];
  [(VCAudioSession *)self addPropertyToBatchedDictionary:v11 property:*MEMORY[0x1E4F75F00] defaultValue:*MEMORY[0x1E4F75B08] propertyOrderArray:v12];
  [(VCAudioSession *)self addPropertyToBatchedDictionary:v11 property:*MEMORY[0x1E4F76008] defaultValue:MEMORY[0x1E4F1CC28] propertyOrderArray:v12];
  [(VCAudioSession *)self addPropertyToBatchedDictionary:v11 property:*MEMORY[0x1E4F761F8] defaultValue:0 propertyOrderArray:v12];
  [(VCAudioSession *)self addPropertyToBatchedDictionary:v11 property:*MEMORY[0x1E4F761B0] defaultValue:0 propertyOrderArray:v12];
  buf[0] = 0;
  if ([(VCAudioSession *)self shouldSetupSharePlayWithOperatingMode:v3 isSharePlayCapable:buf])
  {
    uint64_t v14 = [NSNumber numberWithBool:buf[0]];
    uint64_t v15 = *MEMORY[0x1E4F76308];
    [v11 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F76308]];
    [v12 addObject:v15];
  }
  if (v3 != 6) {
    [(VCAudioSession *)self addPropertyToBatchedDictionary:v11 property:*MEMORY[0x1E4F76290] defaultValue:MEMORY[0x1E4F1CC28] propertyOrderArray:v12];
  }
  [(VCAudioSession *)self addPropertyToBatchedDictionary:v11 property:*MEMORY[0x1E4F76550] defaultValue:MEMORY[0x1E4F1CC28] propertyOrderArray:v12];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v16 = (void *)[v11 allKeys];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v22 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        if (([v12 containsObject:v21] & 1) == 0) {
          [v12 addObject:v21];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v22 count:16];
    }
    while (v18);
  }
  [(VCAudioSession *)self applyRequestedProperties:v11 propertyOrder:v12];

  [(VCAudioSession *)self applyAudioModeWithDefaultValue:v13 shouldApplyRequestedProperty:0];
}

- (void)addPropertyToBatchedDictionary:(id)a3 property:(id)a4 defaultValue:(id)a5 propertyOrderArray:(id)a6
{
  if ([(NSDictionary *)[(VCAudioSession *)self audioSessionProperties] objectForKeyedSubscript:a4])
  {
    id v11 = [(VCAudioSession *)self audioSessionProperties];
  }
  else
  {
    uint64_t v12 = [a3 objectForKeyedSubscript:a4];
    id v11 = (NSDictionary *)a3;
    if (!v12) {
      goto LABEL_5;
    }
  }
  a5 = [(NSDictionary *)v11 objectForKeyedSubscript:a4];
LABEL_5:
  if (a5)
  {
    [a3 setObject:a5 forKeyedSubscript:a4];
    [a6 addObject:a4];
  }
}

- (void)upgradeAudioSessionProperties
{
}

- (BOOL)shouldSetupSharePlayWithOperatingMode:(unsigned int)a3 isSharePlayCapable:(BOOL *)a4
{
}

- (BOOL)setSampleRate:(double)a3
{
}

- (BOOL)forceBufferFrames:(int *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a3 && !self->_isTetheredDisplayMode)
  {
    CFNumberRef v3 = (const __CFNumber *)CFPreferencesCopyAppValue(@"forceAudioBufferFrames", @"com.apple.VideoConference");
    if (v3)
    {
      CFNumberRef v5 = v3;
      int Value = CFNumberGetValue(v3, kCFNumberSInt32Type, a3);
      CFRelease(v5);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        uint64_t v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v9 = *a3;
          id v10 = " ";
          int v12 = 136316162;
          if (!Value) {
            id v10 = "failed";
          }
          uint64_t v13 = v7;
          __int16 v14 = 2080;
          uint64_t v15 = "-[VCAudioSession forceBufferFrames:]";
          __int16 v16 = 1024;
          int v17 = 470;
          __int16 v18 = 1024;
          int v19 = v9;
          __int16 v20 = 2080;
          uint64_t v21 = v10;
          _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d forceAudioBufferFrames to %d %s", (uint8_t *)&v12, 0x2Cu);
        }
      }
      LOBYTE(v3) = Value != 0;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return (char)v3;
}

- (void)setBlockSizeOnSampleRateChange
{
  v3[5] = *MEMORY[0x1E4F143B8];
  dispatchQueue = self->_dispatchQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48__VCAudioSession_setBlockSizeOnSampleRateChange__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(dispatchQueue, v3);
}

uint64_t __48__VCAudioSession_setBlockSizeOnSampleRateChange__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    CFNumberRef v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315650;
      uint64_t v10 = v2;
      __int16 v11 = 2080;
      int v12 = "-[VCAudioSession setBlockSizeOnSampleRateChange]_block_invoke";
      __int16 v13 = 1024;
      int v14 = 478;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", (uint8_t *)&v9, 0x1Cu);
    }
  }
  id v4 = *(id **)(a1 + 32);
  objc_msgSend((id)objc_msgSend(v4[25], "mediaProperties"), "preferredBlockSize");
  double v6 = v5;
  objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 200), "mediaProperties"), "preferredSampleRate");
  return [v4 setBlockSize:0 sampleRate:v6 force:v7];
}

- (void)setBlockSize:(double)a3 sampleRate:(double)a4 force:(BOOL)a5
{
}

+ (id)stringFromFormat:(const AudioStreamBasicDescription *)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v7 = v3;
  long long v8 = v3;
  *(_OWORD *)__str = v3;
  long long v6 = v3;
  return (id)objc_msgSend(NSString, "stringWithFormat:", @" audioStreamBasicDescription=%s", FormatToCStr((uint64_t)a3, __str, 0x40uLL));
}

- (void)setUpVPBlockFormatWithProperties:(id)a3
{
  v53[5] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    [a3 inputFormat];
    if (HIDWORD(v40) >= 2)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v5 = VRTraceErrorLogLevelToCSTR();
        long long v6 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          [a3 inputFormat];
          *(_DWORD *)buf = 136315906;
          uint64_t v43 = v5;
          __int16 v44 = 2080;
          v45 = "-[VCAudioSession setUpVPBlockFormatWithProperties:]";
          __int16 v46 = 1024;
          int v47 = 495;
          __int16 v48 = 1024;
          LODWORD(v49) = v38;
          _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d skipping setting kCMSessionProperty_VPBlockConfiguration channelCount=%d", buf, 0x22u);
        }
      }
      return;
    }
  }
  else
  {
    uint64_t v41 = 0;
    long long v39 = 0u;
    long long v40 = 0u;
  }
  *(void *)uint64_t v37 = -1;
  *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v37[8] = v7;
  *(_OWORD *)&v37[24] = v7;
  if (a3) {
    [a3 inputFormat];
  }
  else {
    memset(v37, 0, sizeof(v37));
  }
  uint64_t v8 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v37 length:40];
  *(void *)&v36[0] = -1;
  *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)((char *)v36 + 8) = v9;
  *(_OWORD *)((char *)&v36[1] + 8) = v9;
  if (a3) {
    [a3 outputFormat];
  }
  else {
    memset(v36, 0, 40);
  }
  uint64_t v10 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v36 length:40];
  int v32 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a3, "vpOperatingMode"));
  uint64_t v11 = [NSNumber numberWithBool:1];
  uint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a3, "networkUplinkClockUsesBaseband"));
  __int16 v13 = NSNumber;
  if (a3)
  {
    [a3 outputFormat];
    BOOL v14 = v35 > 1;
  }
  else
  {
    BOOL v14 = 0;
  }
  uint64_t v15 = [v13 numberWithBool:v14];
  __int16 v16 = (void *)MEMORY[0x1E4F1CA60];
  v52[0] = [NSString stringWithUTF8String:"vp client input format"];
  v53[0] = v8;
  v52[1] = [NSString stringWithUTF8String:"vp client output format"];
  v53[1] = v10;
  v52[2] = [NSString stringWithUTF8String:"vp client operation mode"];
  v53[2] = v32;
  v52[3] = [NSString stringWithUTF8String:"vp_muteControlledByAVSC"];
  v53[3] = v11;
  v52[4] = [NSString stringWithUTF8String:"vp client stereo chat enabled"];
  v53[4] = v15;
  int v17 = objc_msgSend(v16, "dictionaryWithDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v53, v52, 5));
  __int16 v18 = v17;
  if (self->_useOptimizedHandoversForTelephony && self->_audioClockDeviceEnabled) {
    [v17 setValue:v12 forKey:@"network uplink clock uses baseband"];
  }
  [(VCAudioSession *)self setVPBlockConfigurationProperties:v18];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    __int16 v20 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = [(id)objc_opt_class() stringFromFormat:v37];
      *(_DWORD *)buf = 136315906;
      uint64_t v43 = v19;
      __int16 v44 = 2080;
      v45 = "-[VCAudioSession setUpVPBlockFormatWithProperties:]";
      __int16 v46 = 1024;
      int v47 = 516;
      __int16 v48 = 2112;
      uint64_t v49 = v21;
      _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ('vp client input format' inFormat=%@)", buf, 0x26u);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v22 = VRTraceErrorLogLevelToCSTR();
    long long v23 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = [(id)objc_opt_class() stringFromFormat:v36];
      *(_DWORD *)buf = 136315906;
      uint64_t v43 = v22;
      __int16 v44 = 2080;
      v45 = "-[VCAudioSession setUpVPBlockFormatWithProperties:]";
      __int16 v46 = 1024;
      int v47 = 517;
      __int16 v48 = 2112;
      uint64_t v49 = v24;
      _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ('vp client output format' outFormat=%@)", buf, 0x26u);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v25 = VRTraceErrorLogLevelToCSTR();
    long long v26 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v27 = [v32 unsignedIntValue];
      *(_DWORD *)buf = 136315906;
      uint64_t v43 = v25;
      __int16 v44 = 2080;
      v45 = "-[VCAudioSession setUpVPBlockFormatWithProperties:]";
      __int16 v46 = 1024;
      int v47 = 518;
      __int16 v48 = 1024;
      LODWORD(v49) = v27;
      _os_log_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ('vp client operation mode' opModeNumber=%u)", buf, 0x22u);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v28 = VRTraceErrorLogLevelToCSTR();
    __int16 v29 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (a3)
      {
        [a3 inputFormat];
        uint64_t v30 = v34;
        [a3 outputFormat];
        uint64_t v31 = v33;
      }
      else
      {
        uint64_t v31 = 0;
        uint64_t v30 = 0;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v43 = v28;
      __int16 v44 = 2080;
      v45 = "-[VCAudioSession setUpVPBlockFormatWithProperties:]";
      __int16 v46 = 1024;
      int v47 = 519;
      __int16 v48 = 2048;
      uint64_t v49 = v30;
      __int16 v50 = 2048;
      uint64_t v51 = v31;
      _os_log_impl(&dword_1E1EA4000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d kCMSessionProperty_VPBlockConfiguration sampleRateIn=%f, sampleRateOut=%f", buf, 0x30u);
    }
  }

  self->_vpBlock = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v18];
}

- (BOOL)setVPBlockConfigurationProperties:(id)a3
{
}

- (BOOL)applyAudioSessionMediaProperties:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  long long v6 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315650;
      uint64_t v18 = v7;
      __int16 v19 = 2080;
      __int16 v20 = "-[VCAudioSession applyAudioSessionMediaProperties:]";
      __int16 v21 = 1024;
      int v22 = 531;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", (uint8_t *)&v17, 0x1Cu);
    }
  }
  self->_unsigned int vpOperatingMode = [a3 vpOperatingMode];
  self->_int operatingMode = [a3 operatingMode];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      int operatingMode = self->_operatingMode;
      unsigned int vpOperatingMode = self->_vpOperatingMode;
      int v17 = 136316162;
      uint64_t v18 = v9;
      __int16 v19 = 2080;
      __int16 v20 = "-[VCAudioSession applyAudioSessionMediaProperties:]";
      __int16 v21 = 1024;
      int v22 = 535;
      __int16 v23 = 1024;
      int v24 = operatingMode;
      __int16 v25 = 1024;
      unsigned int v26 = vpOperatingMode;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _operatingMode=%d, _vpOperatingMode=%d", (uint8_t *)&v17, 0x28u);
    }
  }
  [a3 preferredSampleRate];
  -[VCAudioSession setSampleRate:](self, "setSampleRate:");
  [a3 preferredBlockSize];
  double v14 = v13;
  [a3 preferredSampleRate];
  [(VCAudioSession *)self setBlockSize:1 sampleRate:v14 force:v15];
  -[VCAudioSession setOptimizedTelephonyHandoverSettings:networkUplinkClockUsesBaseband:](self, "setOptimizedTelephonyHandoverSettings:networkUplinkClockUsesBaseband:", [a3 audioClockDeviceEnabled], objc_msgSend(a3, "networkUplinkClockUsesBaseband"));
  if (!self->_playbackMode)
  {
    [(VCAudioSession *)self internalSelectMicrophoneWithType:self->_selectedMicrophone];
    if (!VCDefaults_GetBoolValueForKey(@"skipSettingVPBlockConfiguration", 0)) {
      [(VCAudioSession *)self setUpVPBlockFormatWithProperties:a3];
    }
  }
  return 1;
}

- (BOOL)startInternal
{
}

- (BOOL)startSessionWithMediaProperties:(id)a3 sessionRef:(unsigned int *)a4
{
}

- (BOOL)validNewStartingClient:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  clients = self->_clients;
  uint64_t v6 = [(NSMutableArray *)clients countByEnumeratingWithState:&v31 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v32;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v32 != v8) {
        objc_enumerationMutation(clients);
      }
      uint64_t v10 = *(void **)(*((void *)&v31 + 1) + 8 * v9);
      if ((id)[v10 notificationClient] == a3) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)clients countByEnumeratingWithState:&v31 objects:v30 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    int v12 = [v10 clientType];
    if (v12 == 1) {
      int v13 = 2;
    }
    else {
      int v13 = 3;
    }
    if ((VCAudioSession *)objc_opt_class() == self)
    {
      if (v13 > (int)VRTraceGetErrorLogLevelForModule()) {
        goto LABEL_23;
      }
      VRTraceErrorLogLevelToCSTR();
      if (v12 != 1)
      {
        BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v11) {
          return v11;
        }
        -[VCAudioSession validNewStartingClient:]();
        goto LABEL_38;
      }
      if (VRTraceIsOSFaultDisabled())
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioSession validNewStartingClient:]();
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        -[VCAudioSession validNewStartingClient:]();
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        double v14 = (__CFString *)[(VCAudioSession *)self performSelector:sel_logPrefix];
      }
      else {
        double v14 = &stru_1F3D3E450;
      }
      if (v13 > (int)VRTraceGetErrorLogLevelForModule())
      {
LABEL_23:
        if (v12 != 1) {
          goto LABEL_38;
        }
        goto LABEL_37;
      }
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      if (v12 != 1)
      {
        uint64_t v18 = *MEMORY[0x1E4F47A50];
        BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v11) {
          return v11;
        }
        int v20 = 136316162;
        uint64_t v21 = v15;
        __int16 v22 = 2080;
        __int16 v23 = "-[VCAudioSession validNewStartingClient:]";
        __int16 v24 = 1024;
        int v25 = 578;
        __int16 v26 = 2112;
        uint64_t v27 = v14;
        __int16 v28 = 2048;
        __int16 v29 = self;
        _os_log_error_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Client has already been started", (uint8_t *)&v20, 0x30u);
        goto LABEL_38;
      }
      char IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
      int v17 = *MEMORY[0x1E4F47A50];
      if (IsOSFaultDisabled)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v20 = 136316162;
          uint64_t v21 = v15;
          __int16 v22 = 2080;
          __int16 v23 = "-[VCAudioSession validNewStartingClient:]";
          __int16 v24 = 1024;
          int v25 = 578;
          __int16 v26 = 2112;
          uint64_t v27 = v14;
          __int16 v28 = 2048;
          __int16 v29 = self;
          _os_log_error_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Client has already been started", (uint8_t *)&v20, 0x30u);
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        int v20 = 136316162;
        uint64_t v21 = v15;
        __int16 v22 = 2080;
        __int16 v23 = "-[VCAudioSession validNewStartingClient:]";
        __int16 v24 = 1024;
        int v25 = 578;
        __int16 v26 = 2112;
        uint64_t v27 = v14;
        __int16 v28 = 2048;
        __int16 v29 = self;
        _os_log_fault_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_FAULT, " [%s] %s:%d %@(%p) Client has already been started", (uint8_t *)&v20, 0x30u);
      }
    }
LABEL_37:
    +[VCAudioSession terminateProcess:@"Unexpected already started state when default client requested start" terminateSource:@"VCAudioSession" agent:0];
LABEL_38:
    LOBYTE(v11) = 0;
    return v11;
  }
LABEL_9:
  LOBYTE(v11) = 1;
  return v11;
}

- (BOOL)startClient:(id)a3 clientType:(unsigned __int8)a4 mediaProperties:(id)a5 sessionRef:(unsigned int *)a6
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__VCAudioSession_startClient_clientType_mediaProperties_sessionRef___block_invoke;
  block[3] = &unk_1E6DB68D8;
  block[4] = a3;
  block[5] = self;
  block[6] = a5;
  void block[7] = &v11;
  block[8] = a6;
  unsigned __int8 v10 = a4;
  dispatch_sync(dispatchQueue, block);
  char v7 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v7;
}

void __68__VCAudioSession_startClient_clientType_mediaProperties_sessionRef___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  long long v3 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule >= 6)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(VCAudioSessionClient **)(a1 + 32);
      int v25 = 136315906;
      uint64_t v26 = v4;
      __int16 v27 = 2080;
      __int16 v28 = "-[VCAudioSession startClient:clientType:mediaProperties:sessionRef:]_block_invoke";
      __int16 v29 = 1024;
      int v30 = 591;
      __int16 v31 = 2048;
      long long v32 = v6;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Client:%p", (uint8_t *)&v25, 0x26u);
    }
  }
  if ([*(id *)(a1 + 40) validNewStartingClient:*(void *)(a1 + 32)])
  {
    uint64_t v7 = [*(id *)(*(void *)(a1 + 40) + 208) count];
    uint64_t v8 = *(void **)(a1 + 40);
    if (v7)
    {
      [v8 dispatchedRefreshAudioSessionProperties];
LABEL_8:
      uint64_t v9 = objc_alloc_init(VCAudioSessionClient);
      [(VCAudioSessionClient *)v9 setNotificationClient:*(void *)(a1 + 32)];
      [(VCAudioSessionClient *)v9 setMediaProperties:*(void *)(a1 + 48)];
      [(VCAudioSessionClient *)v9 setClientType:*(unsigned __int8 *)(a1 + 72)];
      [*(id *)(*(void *)(a1 + 40) + 208) addObject:v9];
      if ([*(id *)(*(void *)(a1 + 40) + 200) clientType] != 1)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v10 = VRTraceErrorLogLevelToCSTR();
          uint64_t v11 = *v3;
          if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
          {
            int v25 = 136315906;
            uint64_t v26 = v10;
            __int16 v27 = 2080;
            __int16 v28 = "-[VCAudioSession startClient:clientType:mediaProperties:sessionRef:]_block_invoke";
            __int16 v29 = 1024;
            int v30 = 609;
            __int16 v31 = 2048;
            long long v32 = v9;
            _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Select new active client:%p", (uint8_t *)&v25, 0x26u);
          }
        }

        *(void *)(*(void *)(a1 + 40) + 200) = v9;
      }

      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        uint64_t v13 = *v3;
        if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
        {
          int v25 = 136315650;
          uint64_t v26 = v12;
          __int16 v27 = 2080;
          __int16 v28 = "-[VCAudioSession startClient:clientType:mediaProperties:sessionRef:]_block_invoke";
          __int16 v29 = 1024;
          int v30 = 615;
          _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Applying the activeClients media properties", (uint8_t *)&v25, 0x1Cu);
        }
      }
      objc_msgSend(*(id *)(a1 + 40), "applyAudioSessionMediaProperties:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 200), "mediaProperties"));
      [*(id *)(a1 + 40) startInternal];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        uint64_t v15 = *v3;
        if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
        {
          int v25 = 136315650;
          uint64_t v26 = v14;
          __int16 v27 = 2080;
          __int16 v28 = "-[VCAudioSession startClient:clientType:mediaProperties:sessionRef:]_block_invoke";
          __int16 v29 = 1024;
          int v30 = 621;
          _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Updating block size to reflect the hardware sampleRate", (uint8_t *)&v25, 0x1Cu);
        }
      }
      __int16 v16 = *(id **)(a1 + 40);
      objc_msgSend((id)objc_msgSend(v16[25], "mediaProperties"), "preferredBlockSize");
      double v18 = v17;
      objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 40) + 200), "mediaProperties"), "preferredSampleRate");
      [v16 setBlockSize:0 sampleRate:v18 force:v19];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      goto LABEL_20;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v8 startSessionWithMediaProperties:*(void *)(a1 + 48) sessionRef:*(void *)(a1 + 64)];
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
      goto LABEL_8;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v23 = VRTraceErrorLogLevelToCSTR();
      __int16 v24 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = 136315650;
        uint64_t v26 = v23;
        __int16 v27 = 2080;
        __int16 v28 = "-[VCAudioSession startClient:clientType:mediaProperties:sessionRef:]_block_invoke";
        __int16 v29 = 1024;
        int v30 = 596;
        _os_log_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d startSession failed", (uint8_t *)&v25, 0x1Cu);
      }
    }
  }
LABEL_20:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v20 = VRTraceErrorLogLevelToCSTR();
    uint64_t v21 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      int v25 = 136315906;
      uint64_t v26 = v20;
      __int16 v27 = 2080;
      __int16 v28 = "-[VCAudioSession startClient:clientType:mediaProperties:sessionRef:]_block_invoke";
      __int16 v29 = 1024;
      int v30 = 625;
      __int16 v31 = 1024;
      LODWORD(v32) = v22;
      _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d success=%d", (uint8_t *)&v25, 0x22u);
    }
  }
}

- (BOOL)shouldResetAudioSession
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__VCAudioSession_shouldResetAudioSession__block_invoke;
  block[3] = &unk_1E6DB3EB8;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(dispatchQueue, block);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __41__VCAudioSession_shouldResetAudioSession__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    char v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 184);
      int v15 = 136315906;
      uint64_t v16 = v2;
      __int16 v17 = 2080;
      double v18 = "-[VCAudioSession shouldResetAudioSession]_block_invoke";
      __int16 v19 = 1024;
      int v20 = 634;
      __int16 v21 = 2112;
      uint64_t v22 = v4;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Requested settings: %@", (uint8_t *)&v15, 0x26u);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 192);
      int v15 = 136315906;
      uint64_t v16 = v5;
      __int16 v17 = 2080;
      double v18 = "-[VCAudioSession shouldResetAudioSession]_block_invoke";
      __int16 v19 = 1024;
      int v20 = 635;
      __int16 v21 = 2112;
      uint64_t v22 = v7;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Existing settings: %@", (uint8_t *)&v15, 0x26u);
    }
  }
  uint64_t v8 = *MEMORY[0x1E4F75F00];
  uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 184) objectForKeyedSubscript:*MEMORY[0x1E4F75F00]];
  uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 192) objectForKeyedSubscript:v8];
  if (v9 | v10)
  {
    if (([(id)v9 isEqualToString:v10] & 1) == 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        uint64_t v12 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = [*(id *)(*(void *)(a1 + 32) + 192) objectForKeyedSubscript:v8];
          uint64_t v14 = [*(id *)(*(void *)(a1 + 32) + 184) objectForKeyedSubscript:v8];
          int v15 = 136316162;
          uint64_t v16 = v11;
          __int16 v17 = 2080;
          double v18 = "-[VCAudioSession shouldResetAudioSession]_block_invoke";
          __int16 v19 = 1024;
          int v20 = 641;
          __int16 v21 = 2112;
          uint64_t v22 = v13;
          __int16 v23 = 2112;
          uint64_t v24 = v14;
          _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Reset needed, audio mode:%@ -> %@", (uint8_t *)&v15, 0x30u);
        }
      }
    }
  }
}

- (BOOL)resetClient:(id)a3 mediaSetting:(id)a4 interruptSuccessful:(BOOL *)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__VCAudioSession_resetClient_mediaSetting_interruptSuccessful___block_invoke;
  v8[3] = &unk_1E6DB6900;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  v8[7] = &v9;
  v8[8] = a5;
  dispatch_sync(dispatchQueue, v8);
  char v6 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __63__VCAudioSession_resetClient_mediaSetting_interruptSuccessful___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    char v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v23 = v2;
      __int16 v24 = 2080;
      uint64_t v25 = "-[VCAudioSession resetClient:mediaSetting:interruptSuccessful:]_block_invoke";
      __int16 v26 = 1024;
      int v27 = 651;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", buf, 0x1Cu);
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 208);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v9 notificationClient] == *(void *)(a1 + 40))
        {
          [v9 setMediaProperties:*(void *)(a1 + 48)];
          goto LABEL_14;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_14:
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 200) notificationClient];
  if (result == *(void *)(a1 + 40))
  {
    if ([*(id *)(a1 + 32) didRequestStringPropertyChange:*MEMORY[0x1E4F75EC8]])
    {
      objc_msgSend(*(id *)(a1 + 32), "applyAudioSessionPropertiesWithVPOperatingMode:", objc_msgSend(*(id *)(a1 + 48), "vpOperatingMode"));
    }
    else if ([*(id *)(a1 + 32) didRequestStringPropertyChange:*MEMORY[0x1E4F75F00]])
    {
      [*(id *)(a1 + 32) upgradeAudioSessionProperties];
      uint64_t result = objc_msgSend(*(id *)(a1 + 32), "applyAudioSessionMediaProperties:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 200), "mediaProperties"));
      goto LABEL_22;
    }
    [*(id *)(a1 + 32) applyAudioSessionMediaProperties:*(void *)(a1 + 48)];
    char v11 = [*(id *)(a1 + 32) startInternal];
    char v12 = *(unsigned char **)(a1 + 64);
    if (v12) {
      *char v12 = v11;
    }
    uint64_t v13 = *(void **)(a1 + 32);
    [*(id *)(a1 + 48) preferredBlockSize];
    double v15 = v14;
    [*(id *)(a1 + 48) preferredSampleRate];
    uint64_t result = [v13 setBlockSize:0 sampleRate:v15 force:v16];
  }
LABEL_22:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  return result;
}

- (void)resumeActiveClient
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315650;
      uint64_t v9 = v3;
      __int16 v10 = 2080;
      char v11 = "-[VCAudioSession resumeActiveClient]";
      __int16 v12 = 1024;
      int v13 = 693;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", (uint8_t *)&v8, 0x1Cu);
    }
  }
  [(VCAudioSession *)self applyAudioSessionMediaProperties:[(VCAudioSessionClient *)self->_activeClient mediaProperties]];
  [(VCAudioSession *)self startInternal];
  [(VCAudioSessionMediaProperties *)[(VCAudioSessionClient *)self->_activeClient mediaProperties] preferredBlockSize];
  double v6 = v5;
  [(VCAudioSessionMediaProperties *)[(VCAudioSessionClient *)self->_activeClient mediaProperties] preferredSampleRate];
  [(VCAudioSession *)self setBlockSize:1 sampleRate:v6 force:v7];
}

- (void)selectNewActiveClient
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!self->_activeClient)
  {
    self->_activeClient = (VCAudioSessionClient *)(id)[(NSMutableArray *)self->_clients lastObject];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        activeClient = self->_activeClient;
        int v7 = 136315906;
        uint64_t v8 = v3;
        __int16 v9 = 2080;
        __int16 v10 = "-[VCAudioSession selectNewActiveClient]";
        __int16 v11 = 1024;
        int v12 = 704;
        __int16 v13 = 2048;
        uint64_t v14 = activeClient;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d New active client:%p", (uint8_t *)&v7, 0x26u);
      }
    }
    double v6 = self->_activeClient;
    if (v6)
    {
      if (!self->_isInterrupted) {
        [(VCAudioSession *)self applyAudioSessionMediaProperties:[(VCAudioSessionClient *)v6 mediaProperties]];
      }
    }
  }
}

- (BOOL)stopSession
{
}

- (BOOL)stopClient:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  dispatchQueue = self->_dispatchQueue;
  char v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__VCAudioSession_stopClient___block_invoke;
  v6[3] = &unk_1E6DB6928;
  v6[4] = a3;
  v6[5] = self;
  v6[6] = &v7;
  dispatch_sync(dispatchQueue, v6);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __29__VCAudioSession_stopClient___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315906;
      uint64_t v20 = v2;
      __int16 v21 = 2080;
      uint64_t v22 = "-[VCAudioSession stopClient:]_block_invoke";
      __int16 v23 = 1024;
      int v24 = 718;
      __int16 v25 = 2048;
      uint64_t v26 = v4;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Client:%p", buf, 0x26u);
    }
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v5 = *(void **)(*(void *)(a1 + 40) + 208);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
LABEL_6:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v16 != v8) {
        objc_enumerationMutation(v5);
      }
      char v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
      if ([v10 notificationClient] == *(void *)(a1 + 32)) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v14 count:16];
        if (v7) {
          goto LABEL_6;
        }
        goto LABEL_18;
      }
    }
    if (!v10) {
      goto LABEL_18;
    }
    [*(id *)(*(void *)(a1 + 40) + 208) removeObject:v10];
    uint64_t v11 = *(void *)(a1 + 40);
    if (*(void **)(v11 + 200) == v10)
    {

      *(void *)(*(void *)(a1 + 40) + 200) = 0;
      uint64_t v11 = *(void *)(a1 + 40);
    }
    uint64_t v12 = [*(id *)(v11 + 208) count];
    __int16 v13 = *(void **)(a1 + 40);
    if (v12)
    {
      [v13 selectNewActiveClient];
    }
    else
    {
      [v13 stopSession];
      [*(id *)(a1 + 40) invalidateCache];
      [*(id *)(a1 + 40) cleanupMicSources];
      *(unsigned char *)(*(void *)(a1 + 40) + 248) = 0;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
LABEL_18:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __29__VCAudioSession_stopClient___block_invoke_cold_1();
      }
    }
  }
}

- (void)didAvailableSampleRateChange
{
  v3[5] = *MEMORY[0x1E4F143B8];
  dispatchQueue = self->_dispatchQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__VCAudioSession_didAvailableSampleRateChange__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(dispatchQueue, v3);
}

uint64_t __46__VCAudioSession_didAvailableSampleRateChange__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  int v1 = *(void **)(*(void *)(a1 + 32) + 208);
  uint64_t result = [v1 countByEnumeratingWithState:&v8 objects:v7 count:16];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)v9;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = (void *)[*(id *)(*((void *)&v8 + 1) + 8 * v5) notificationClient];
        if (objc_opt_respondsToSelector()) {
          [v6 didSessionSampleRateChange];
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t result = [v1 countByEnumeratingWithState:&v8 objects:v7 count:16];
      uint64_t v3 = result;
    }
    while (result);
  }
  return result;
}

- (void)setMicrophoneMuted:(BOOL)a3
{
}

- (BOOL)microphoneMuted
{
}

- (void)setMuteStateChangedHandler:(id)a3 delegateQueue:(id)a4
{
}

- (void)serverDidDie
{
  v3[5] = *MEMORY[0x1E4F143B8];
  dispatchQueue = self->_dispatchQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __30__VCAudioSession_serverDidDie__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(dispatchQueue, v3);
}

uint64_t __30__VCAudioSession_serverDidDie__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  int v1 = *(void **)(*(void *)(a1 + 32) + 208);
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
        objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v5++), "notificationClient"), "serverDidDie");
      }
      while (v3 != v5);
      uint64_t result = [v1 countByEnumeratingWithState:&v7 objects:v6 count:16];
      uint64_t v3 = result;
    }
    while (result);
  }
  return result;
}

- (void)didPause
{
  v3[5] = *MEMORY[0x1E4F143B8];
  dispatchQueue = self->_dispatchQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __26__VCAudioSession_didPause__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(dispatchQueue, v3);
}

uint64_t __26__VCAudioSession_didPause__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 200) clientType];
  if (result == 1) {
    uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 200), "notificationClient"), "didSessionPause");
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 248) = 1;
  return result;
}

- (void)didResume
{
  v3[5] = *MEMORY[0x1E4F143B8];
  dispatchQueue = self->_dispatchQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __27__VCAudioSession_didResume__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(dispatchQueue, v3);
}

uint64_t __27__VCAudioSession_didResume__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 248) = 0;
  int v2 = [*(id *)(*(void *)(a1 + 32) + 200) clientType];
  uint64_t v3 = *(id **)(a1 + 32);
  if (v2 == 1)
  {
    uint64_t v4 = (void *)[v3[25] notificationClient];
    return [v4 didSessionResume];
  }
  else
  {
    return [v3 resumeActiveClient];
  }
}

- (void)didStop
{
  v3[5] = *MEMORY[0x1E4F143B8];
  dispatchQueue = self->_dispatchQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __25__VCAudioSession_didStop__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(dispatchQueue, v3);
}

uint64_t __25__VCAudioSession_didStop__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 200) clientType];
  if (result == 1) {
    uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 200), "notificationClient"), "didSessionStop");
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 248) = 1;
  return result;
}

- (void)didInterruptionEnded
{
  v3[5] = *MEMORY[0x1E4F143B8];
  dispatchQueue = self->_dispatchQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__VCAudioSession_didInterruptionEnded__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(dispatchQueue, v3);
}

uint64_t __38__VCAudioSession_didInterruptionEnded__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 248) = 0;
  int v2 = [*(id *)(*(void *)(a1 + 32) + 200) clientType];
  uint64_t v3 = *(id **)(a1 + 32);
  if (v2 == 1)
  {
    uint64_t v4 = (void *)[v3[25] notificationClient];
    return [v4 didSessionEnd];
  }
  else
  {
    return [v3 resumeActiveClient];
  }
}

- (void)applyAudioModeWithDefaultValue:(void *)a3 shouldApplyRequestedProperty:(BOOL)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4F75F00];
  if (a4) {
    [(VCAudioSession *)self applyRequestedProperty:*MEMORY[0x1E4F75F00] defaultValue:a3];
  }
  uint64_t v6 = (void *)[(NSMutableDictionary *)self->_currentAudioSessionProperties objectForKeyedSubscript:v5];
  if (![v6 isEqualToString:*MEMORY[0x1E4F75B90]])
  {
    if ((VCAudioSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_24;
      }
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      *(_DWORD *)int v24 = 136315650;
      *(void *)&v24[4] = v10;
      *(_WORD *)&v24[12] = 2080;
      *(void *)&v24[14] = "-[VCAudioSession applyAudioModeWithDefaultValue:shouldApplyRequestedProperty:]";
      *(_WORD *)&v24[22] = 1024;
      LODWORD(v25) = 854;
      uint64_t v12 = " [%s] %s:%d Tearing down beamforming";
      __int16 v13 = v11;
      uint32_t v14 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        long long v8 = (__CFString *)[(VCAudioSession *)self performSelector:sel_logPrefix];
      }
      else {
        long long v8 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_24;
      }
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      __int16 v21 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      *(_DWORD *)int v24 = 136316162;
      *(void *)&v24[4] = v20;
      *(_WORD *)&v24[12] = 2080;
      *(void *)&v24[14] = "-[VCAudioSession applyAudioModeWithDefaultValue:shouldApplyRequestedProperty:]";
      *(_WORD *)&v24[22] = 1024;
      LODWORD(v25) = 854;
      WORD2(v25) = 2112;
      *(void *)((char *)&v25 + 6) = v8;
      HIWORD(v25) = 2048;
      uint64_t v26 = self;
      uint64_t v12 = " [%s] %s:%d %@(%p) Tearing down beamforming";
      __int16 v13 = v21;
      uint32_t v14 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, v24, v14);
LABEL_24:
    [(VCAudioSession *)self cleanupMicSources];
    return;
  }
  if (self->_micSourceFront) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = self->_micSourceBack == 0;
  }
  if ((VCAudioSession *)objc_opt_class() != self)
  {
    if (objc_opt_respondsToSelector()) {
      long long v9 = (__CFString *)[(VCAudioSession *)self performSelector:sel_logPrefix];
    }
    else {
      long long v9 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_30;
    }
    uint64_t v22 = VRTraceErrorLogLevelToCSTR();
    __int16 v23 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_30;
    }
    *(_DWORD *)int v24 = 136316418;
    *(void *)&v24[4] = v22;
    *(_WORD *)&v24[12] = 2080;
    *(void *)&v24[14] = "-[VCAudioSession applyAudioModeWithDefaultValue:shouldApplyRequestedProperty:]";
    *(_WORD *)&v24[22] = 1024;
    LODWORD(v25) = 848;
    WORD2(v25) = 2112;
    *(void *)((char *)&v25 + 6) = v9;
    HIWORD(v25) = 2048;
    uint64_t v26 = self;
    LOWORD(v27) = 1024;
    *(_DWORD *)((char *)&v27 + 2) = v7;
    long long v17 = " [%s] %s:%d %@(%p) shouldSetUpInputBeamforming=%{BOOL}d";
    long long v18 = v23;
    uint32_t v19 = 54;
    goto LABEL_29;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    long long v16 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int v24 = 136315906;
      *(void *)&v24[4] = v15;
      *(_WORD *)&v24[12] = 2080;
      *(void *)&v24[14] = "-[VCAudioSession applyAudioModeWithDefaultValue:shouldApplyRequestedProperty:]";
      *(_WORD *)&v24[22] = 1024;
      LODWORD(v25) = 848;
      WORD2(v25) = 1024;
      *(_DWORD *)((char *)&v25 + 6) = v7;
      long long v17 = " [%s] %s:%d shouldSetUpInputBeamforming=%{BOOL}d";
      long long v18 = v16;
      uint32_t v19 = 34;
LABEL_29:
      _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, v17, v24, v19);
    }
  }
LABEL_30:
  if (v7) {
    [(VCAudioSession *)self setupInputBeamforming];
  }
  -[VCAudioSession internalSelectMicrophoneWithType:](self, "internalSelectMicrophoneWithType:", self->_selectedMicrophone, *(void *)v24, *(_OWORD *)&v24[8], v25, v26, v27, v28);
}

- (void)handleAudioSessionInterruption:(id)a3
{
}

- (void)setAudioSessionMode:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__VCAudioSession_setAudioSessionMode___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  block[5] = a3;
  dispatch_async(dispatchQueue, block);
}

uint64_t __38__VCAudioSession_setAudioSessionMode___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 184) setObject:*(void *)(a1 + 40) forKeyedSubscript:*MEMORY[0x1E4F75F00]];
  [*(id *)(a1 + 32) applyAudioModeWithDefaultValue:0 shouldApplyRequestedProperty:1];
  uint64_t result = VCDefaults_GetBoolValueForKey(@"skipSettingVPBlockConfiguration", 0);
  if ((result & 1) == 0)
  {
    uint64_t v3 = *(id **)(a1 + 32);
    uint64_t v4 = [v3[25] mediaProperties];
    return [v3 setUpVPBlockFormatWithProperties:v4];
  }
  return result;
}

- (void)setupInputBeamforming
{
}

- (void)cleanupMicSources
{
  self->_micSourceFront = 0;
  self->_micSourceBack = 0;
}

- (BOOL)internalSelectMicrophoneWithType:(unsigned int)a3
{
}

- (void)selectMicrophoneWithType:(unsigned int)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__VCAudioSession_selectMicrophoneWithType___block_invoke;
  block[3] = &unk_1E6DB3F08;
  block[4] = self;
  unsigned int v5 = a3;
  dispatch_async(dispatchQueue, block);
}

uint64_t __43__VCAudioSession_selectMicrophoneWithType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) internalSelectMicrophoneWithType:*(unsigned int *)(a1 + 40)];
}

+ (BOOL)shouldUseHomeKitConfigurationForAudioMode:(id)a3
{
  if (+[VCHardwareSettings deviceClass] == 4
    && ([a3 isEqualToString:*MEMORY[0x1E4F75A58]] & 1) != 0)
  {
    return 1;
  }
  uint64_t v5 = *MEMORY[0x1E4F75BA0];

  return [a3 isEqualToString:v5];
}

+ (BOOL)convertAudioSessionProperties:(id)a3 operatingMode:(int *)a4 deviceRole:(int *)a5 enableAudioPreWarming:(BOOL *)a6 audioClockDeviceEnabled:(BOOL *)a7 networkUplinkClockUsesBaseband:(BOOL *)a8
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  if (!a3 || !a4 || !a5 || !a6 || !a7 || !a8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v25 = VRTraceErrorLogLevelToCSTR();
      uint64_t v26 = *MEMORY[0x1E4F47A50];
      BOOL v21 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v21) {
        return v21;
      }
      int v40 = 136317186;
      uint64_t v41 = v25;
      __int16 v42 = 2080;
      uint64_t v43 = "+[VCAudioSession convertAudioSessionProperties:operatingMode:deviceRole:enableAudioPreWarming:audioClockDevi"
            "ceEnabled:networkUplinkClockUsesBaseband:]";
      __int16 v44 = 1024;
      int v45 = 927;
      __int16 v46 = 2048;
      *(void *)int v47 = a3;
      *(_WORD *)&v47[8] = 2048;
      __int16 v48 = a5;
      __int16 v49 = 2048;
      __int16 v50 = a4;
      __int16 v51 = 2048;
      v52 = a6;
      __int16 v53 = 2048;
      v54 = a7;
      __int16 v55 = 2048;
      v56 = a8;
      uint64_t v22 = " [%s] %s:%d Invalid parameters: sessionProperties=%p deviceRole=%p operationMode=%p prewarming=%p audioClock"
            "DeviceEnabled=%p networkUplinkClockUsesBaseband=%p";
      __int16 v23 = v26;
      uint32_t v24 = 88;
LABEL_20:
      _os_log_error_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_ERROR, v22, (uint8_t *)&v40, v24);
    }
LABEL_21:
    LOBYTE(v21) = 0;
    return v21;
  }
  uint64_t v14 = *MEMORY[0x1E4F75F00];
  uint64_t v15 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F75F00]];
  if (!v15) {
    uint64_t v15 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"AVAudioClientBatchMXPropertiesKey"), "objectForKeyedSubscript:", v14);
  }
  uint64_t v16 = [a3 objectForKeyedSubscript:@"kAUVoiceIOProperty_OperationMode"];
  long long v17 = (int *)v16;
  if (v15) {
    BOOL v18 = v16 == 0;
  }
  else {
    BOOL v18 = 1;
  }
  if (v18)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      uint64_t v20 = *MEMORY[0x1E4F47A50];
      BOOL v21 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v21) {
        return v21;
      }
      int v40 = 136316162;
      uint64_t v41 = v19;
      __int16 v42 = 2080;
      uint64_t v43 = "+[VCAudioSession convertAudioSessionProperties:operatingMode:deviceRole:enableAudioPreWarming:audioClockDevi"
            "ceEnabled:networkUplinkClockUsesBaseband:]";
      __int16 v44 = 1024;
      int v45 = 936;
      __int16 v46 = 2048;
      *(void *)int v47 = v15;
      *(_WORD *)&v47[8] = 2048;
      __int16 v48 = v17;
      uint64_t v22 = " [%s] %s:%d Audio parameters missing audioMode=%p operationMode=%p";
      __int16 v23 = v20;
      uint32_t v24 = 48;
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  uint64_t v27 = (void *)[a3 objectForKeyedSubscript:@"kVirtualAudioPluginVPBlockConfigurationNetworkUplinkClockUsesBaseband"];
  *a4 = 0;
  *a5 = 0;
  *a6 = 1;
  if ([v15 isEqualToString:*MEMORY[0x1E4F75B90]])
  {
    *a4 = 1;
LABEL_29:
    *a5 = 0;
    goto LABEL_30;
  }
  if ([v15 isEqualToString:*MEMORY[0x1E4F75BC0]])
  {
    if ([v17 integerValue] == 8) {
      int v29 = 7;
    }
    else {
      int v29 = 2;
    }
    goto LABEL_28;
  }
  if (![v15 isEqualToString:*MEMORY[0x1E4F75B08]])
  {
    if ([v15 isEqualToString:*MEMORY[0x1E4F75AA0]])
    {
      int v29 = 3;
LABEL_28:
      *a4 = v29;
      goto LABEL_29;
    }
    if (!+[VCAudioSession shouldUseHomeKitConfigurationForAudioMode:v15])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v37 = VRTraceErrorLogLevelToCSTR();
        int v38 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          +[VCAudioSession convertAudioSessionProperties:operatingMode:deviceRole:enableAudioPreWarming:audioClockDeviceEnabled:networkUplinkClockUsesBaseband:](v37, v15, v38);
        }
      }
      goto LABEL_30;
    }
LABEL_45:
    int v29 = 5;
    goto LABEL_28;
  }
  if ([v17 integerValue] == 6)
  {
    BOOL v35 = +[VCHardwareSettings supportsOptimizedHandoversForTelephony];
    char v36 = 0;
    *a4 = 3;
    *a5 = 0;
    *a7 = v35;
    if (v35) {
      char v36 = [v27 BOOLValue];
    }
    *a8 = v36;
    *a6 = v36;
    goto LABEL_30;
  }
  if ([v17 integerValue] == 7) {
    goto LABEL_45;
  }
  *a4 = 2;
  *a5 = 1;
  *a6 = 0;
LABEL_30:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v30 = VRTraceErrorLogLevelToCSTR();
    __int16 v31 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v32 = *a4;
      int v33 = *a5;
      BOOL v34 = *a6;
      int v40 = 136316418;
      uint64_t v41 = v30;
      __int16 v42 = 2080;
      uint64_t v43 = "+[VCAudioSession convertAudioSessionProperties:operatingMode:deviceRole:enableAudioPreWarming:audioClockDevi"
            "ceEnabled:networkUplinkClockUsesBaseband:]";
      __int16 v44 = 1024;
      int v45 = 980;
      __int16 v46 = 1024;
      *(_DWORD *)int v47 = v32;
      *(_WORD *)&v47[4] = 1024;
      *(_DWORD *)&v47[6] = v33;
      LOWORD(v48) = 1024;
      *(_DWORD *)((char *)&v48 + 2) = v34;
      _os_log_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d converting Properties to operating mode:%d deviceRole:%d enableAudioPreWarming:%d", (uint8_t *)&v40, 0x2Eu);
    }
  }
  LOBYTE(v21) = *a4 != 0;
  return v21;
}

- (void)setOptimizedTelephonyHandoverSettings:(BOOL)a3 networkUplinkClockUsesBaseband:(BOOL)a4
{
}

- (int)clientPid
{
  return self->_currentClientPid;
}

- (void)setClientPid:(int)a3
{
  self->_currentClientPid = a3;
}

- (unsigned)audioSessionId
{
  return self->_audioSessionId;
}

- (double)externalInputAudioLatency
{
  return self->_externalInputAudioLatency;
}

- (double)externalOutputAudioLatency
{
  return self->_externalOutputAudioLatency;
}

- (void)dispatchedSetAudioSessionProperties:.cold.1()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v3 = v0;
  uint64_t v4 = "-[VCAudioSession dispatchedSetAudioSessionProperties:]";
  __int16 v5 = 1024;
  int v6 = 231;
  __int16 v7 = v0;
  long long v8 = "-[VCAudioSession dispatchedSetAudioSessionProperties:]";
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d :%s:audioParams does not include audio category or audio mode, Not setting requestedSessionParams", v2, 0x26u);
}

- (void)validNewStartingClient:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Client has already been started", v2, v3, v4, v5, v6);
}

- (void)validNewStartingClient:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2();
  _os_log_fault_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_FAULT, " [%s] %s:%d Client has already been started", v1, 0x1Cu);
}

void __29__VCAudioSession_stopClient___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Client was not found", v2, v3, v4, v5, v6);
}

+ (void)convertAudioSessionProperties:(NSObject *)a3 operatingMode:deviceRole:enableAudioPreWarming:audioClockDeviceEnabled:networkUplinkClockUsesBaseband:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v4 = 136315906;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  __int16 v7 = "+[VCAudioSession convertAudioSessionProperties:operatingMode:deviceRole:enableAudioPreWarming:audioClockDeviceEna"
       "bled:networkUplinkClockUsesBaseband:]";
  __int16 v8 = 1024;
  int v9 = 978;
  __int16 v10 = 2080;
  uint64_t v11 = objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Could not infer operating mode from audioMode = %s", (uint8_t *)&v4, 0x26u);
}

@end