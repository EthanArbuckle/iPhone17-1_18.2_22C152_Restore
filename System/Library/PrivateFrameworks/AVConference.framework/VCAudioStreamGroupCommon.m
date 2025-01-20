@interface VCAudioStreamGroupCommon
+ (BOOL)isSupportedDirection:(unsigned __int8)a3;
- (BOOL)addSyncDestination:(id)a3 shouldSchedule:(BOOL)a4;
- (BOOL)configureAudioIOWithDeviceRole:(int)a3 operatingMode:(int)a4;
- (BOOL)configurePowerSpectrumSource;
- (BOOL)configureStreams:(id)a3 withRateControlConfig:(id)a4;
- (BOOL)enqueueSyncDestinationChangeEvent:(id)a3 eventType:(int)a4;
- (BOOL)isMuted;
- (BOOL)isPowerSpectrumEnabled;
- (BOOL)reconfigureAudioIOIfNeededWithDeviceRole:(int)a3 operatingMode:(int)a4;
- (BOOL)removeSyncDestination:(id)a3 shouldSchedule:(BOOL)a4;
- (BOOL)setDeviceRole:(int)a3 operatingMode:(int)a4;
- (NSString)description;
- (VCAudioIO)audioIO;
- (VCAudioStreamGroupCommon)initWithConfig:(id)a3 audioCallback:(void *)a4 context:(void *)a5 audioDirection:(unsigned __int8)a6 stateQueue:(id)a7;
- (id)getAudioDumpName;
- (id)startCapture;
- (id)stopCapture;
- (int)deviceRole;
- (tagVCAudioStreamGroupStream)audioStreams;
- (unsigned)audioChannelIndex;
- (unsigned)audioTypeForCaptureSource:(int)a3;
- (void)audioPowerSpectrumSinkDidRegister;
- (void)audioPowerSpectrumSinkDidUnregister;
- (void)callback;
- (void)cleanupPowerSpectrumSource;
- (void)cleanupStreams;
- (void)cleanupSyncDestinations;
- (void)collectAndLogChannelMetrics:(id *)a3 averagePower:(float)a4;
- (void)configurePowerSpectrumSource;
- (void)context;
- (void)dealloc;
- (void)didResumeAudioIO:(id)a3;
- (void)didSuspendAudioIO:(id)a3;
- (void)didUpdateBasebandCodec:(const _VCRemoteCodecInfo *)a3;
- (void)flushSyncDestinationUpdatesEventQueue;
- (void)initCodecConfigurationsForStream:(tagVCAudioStreamGroupStream *)a3 withDefaultAudioConfig:(id)a4;
- (void)sendAudioPowerSpectrumSourceRegistration:(BOOL)a3;
- (void)setAudioChannelIndex:(unsigned int)a3;
- (void)setCallback:(void *)a3;
- (void)setContext:(void *)a3;
- (void)setMuted:(BOOL)a3;
- (void)setPowerSpectrumEnabled:(BOOL)a3;
- (void)setupStreamsWithStreamInfos:(id)a3;
- (void)updateVoiceActivityEnabled:(BOOL)a3 isMediaPriorityEnabled:(BOOL)a4;
@end

@implementation VCAudioStreamGroupCommon

- (VCAudioStreamGroupCommon)initWithConfig:(id)a3 audioCallback:(void *)a4 context:(void *)a5 audioDirection:(unsigned __int8)a6 stateQueue:(id)a7
{
  uint64_t v8 = a6;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)VCAudioStreamGroupCommon;
  v12 = [(VCObject *)&v19 init];
  if (!v12) {
    return v12;
  }
  if (!+[VCAudioStreamGroupCommon isSupportedDirection:v8])
  {

    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioStreamGroupCommon initWithConfig:audioCallback:context:audioDirection:stateQueue:].cold.6(v17, v8, v18);
      }
    }
    return 0;
  }
  v13 = (void *)[a3 audioStreamGroupConfig];
  v12->_isMuted = [v13 isMuted];
  v12->_processID = [v13 processID];
  v12->_isGKVoiceChat = [v13 isGKVoiceChat];
  v12->_preferredIOSampleRate = [v13 preferredIOSampleRate];
  v12->_preferredIOSamplesPerFrame = [v13 preferredIOSamplesPerFrame];
  v12->_audioSessionID = [v13 audioSessionID];
  v12->_powerSpectrumStreamToken = [v13 powerSpectrumStreamToken];
  v12->_captionsToken = [a3 streamToken];
  v12->_captionsCoordinator = (VCAudioCaptionsCoordinator *)(id)[v13 captionsCoordinator];
  v12->_spatialAudioSourceID = [v13 spatialAudioSourceID];
  v12->_deviceRole = 0;
  v12->_participantUUID = (NSString *)(id)[a3 participantUUID];
  v12->_streamGroupID = [a3 streamGroupID];
  v12->_audioType = -[VCAudioStreamGroupCommon audioTypeForCaptureSource:](v12, "audioTypeForCaptureSource:", [a3 captureSource]);
  v12->_direction = v8;
  v12->_callback = a4;
  v12->_context = a5;
  v12->_maxChannelCount = 1;
  v12->_audioChannelIndex = [v13 audioChannelIndex];
  v12->_operatingMode = 6;
  -[VCObject setLogPrefix:](v12, "setLogPrefix:", [NSString stringWithFormat:@"streamGroupID=%s participantUUID=%@ ", FourccToCStr(v12->_streamGroupID), v12->_participantUUID]);
  if (!a7)
  {
    v12->_stateQueue = 0;
LABEL_11:

    if (objc_opt_class())
    {
      if (objc_opt_respondsToSelector()) {
        [0 performSelector:sel_logPrefix];
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioStreamGroupCommon initWithConfig:audioCallback:context:audioDirection:stateQueue:]();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioStreamGroupCommon initWithConfig:audioCallback:context:audioDirection:stateQueue:]();
      }
    }
    return 0;
  }
  v14 = (OS_dispatch_queue *)CFRetain(a7);
  v12->_stateQueue = v14;
  if (!v14) {
    goto LABEL_11;
  }
  v12->_syncDestinationList.slh_first = 0;
  CMSimpleQueueCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 10, &v12->_syncDestinationChangeEventQueue);
  if (!v12->_syncDestinationChangeEventQueue)
  {

    if (objc_opt_class())
    {
      if (objc_opt_respondsToSelector()) {
        [0 performSelector:sel_logPrefix];
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioStreamGroupCommon initWithConfig:audioCallback:context:audioDirection:stateQueue:].cold.4();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioStreamGroupCommon initWithConfig:audioCallback:context:audioDirection:stateQueue:]();
      }
    }
    return 0;
  }
  v15 = (tagVCMemoryPool *)VCMemoryPool_Create(0x10uLL);
  v12->_syncDestinationChangeEventPool = v15;
  if (!v15)
  {

    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioStreamGroupCommon initWithConfig:audioCallback:context:audioDirection:stateQueue:].cold.5();
      }
    }
    return 0;
  }
  return v12;
}

- (NSString)description
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCAudioStreamGroupCommon;
  v4 = [(VCAudioStreamGroupCommon *)&v8 description];
  v5 = FourccToCStr(self->_streamGroupID);
  if (self->_direction == 2) {
    v6 = "Send";
  }
  else {
    v6 = "Receive";
  }
  return (NSString *)[v3 stringWithFormat:@"{ %@ streamGroupID=%s %s Group }", v4, v5, v6];
}

- (unsigned)audioTypeForCaptureSource:(int)a3
{
  if (a3 > 0xA) {
    return 1;
  }
  else {
    return dword_1E259C10C[a3];
  }
}

- (void)flushSyncDestinationUpdatesEventQueue
{
  v3 = (void *)CMSimpleQueueDequeue(self->_syncDestinationChangeEventQueue);
  if (v3)
  {
    v4 = v3;
    do
    {
      VCMemoryPool_Free((OSQueueHead *)self->_syncDestinationChangeEventPool, v4);
      v4 = (void *)CMSimpleQueueDequeue(self->_syncDestinationChangeEventQueue);
    }
    while (v4);
  }
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  VCAudioBufferList_Destroy((uint64_t *)&self->_sampleBuffer);

  self->_audioIO = 0;
  stateQueue = self->_stateQueue;
  if (stateQueue) {
    CFRelease(stateQueue);
  }
  [(VCAudioStreamGroupCommon *)self cleanupStreams];
  [(VCAudioStreamGroupCommon *)self cleanupSyncDestinations];
  [(VCAudioStreamGroupCommon *)self cleanupPowerSpectrumSource];
  [(VCAudioStreamGroupCommon *)self flushSyncDestinationUpdatesEventQueue];
  VCMemoryPool_Destroy((OSQueueHead *)self->_syncDestinationChangeEventPool);
  syncDestinationChangeEventQueue = self->_syncDestinationChangeEventQueue;
  if (syncDestinationChangeEventQueue)
  {
    CFRelease(syncDestinationChangeEventQueue);
    self->_syncDestinationChangeEventQueue = 0;
  }

  v5.receiver = self;
  v5.super_class = (Class)VCAudioStreamGroupCommon;
  [(VCObject *)&v5 dealloc];
}

- (BOOL)setDeviceRole:(int)a3 operatingMode:(int)a4
{
  if (self->_deviceRole == a3 && self->_operatingMode == a4) {
    goto LABEL_5;
  }
  BOOL v7 = [(VCAudioStreamGroupCommon *)self reconfigureAudioIOIfNeededWithDeviceRole:*(void *)&a3 operatingMode:*(void *)&a4];
  if (v7)
  {
    self->_deviceRole = a3;
    self->_operatingMode = a4;
LABEL_5:
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (tagVCAudioStreamGroupStream)audioStreams
{
  return self->_audioStreams;
}

- (void)setPowerSpectrumEnabled:(BOOL)a3
{
  self->_isPowerSpectrumEnabled = a3;
}

- (BOOL)isPowerSpectrumEnabled
{
  return self->_isPowerSpectrumEnabled;
}

- (BOOL)configurePowerSpectrumSource
{
  if (self->_audioPowerSpectrumSource) {
    goto LABEL_4;
  }
  v3 = [[VCAudioPowerSpectrumSource alloc] initWithStreamToken:self->_powerSpectrumStreamToken delegate:self];
  self->_audioPowerSpectrumSource = v3;
  if (v3)
  {
    [+[VCAudioPowerSpectrumManager sharedInstance] registerAudioPowerMeterSource:self->_audioPowerSpectrumSource];
LABEL_4:
    LOBYTE(v4) = 1;
    return v4;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    BOOL v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v4) {
      return v4;
    }
    -[VCAudioStreamGroupCommon configurePowerSpectrumSource]();
  }
  LOBYTE(v4) = 0;
  return v4;
}

- (void)cleanupPowerSpectrumSource
{
  if (self->_audioPowerSpectrumSource)
  {
    v3 = +[VCAudioPowerSpectrumManager sharedInstance];
    -[VCAudioPowerSpectrumManager unregisterAudioPowerSpectrumSourceForStreamToken:](v3, "unregisterAudioPowerSpectrumSourceForStreamToken:", objc_msgSend(NSNumber, "numberWithInteger:", -[VCAudioPowerSpectrumSource streamToken](self->_audioPowerSpectrumSource, "streamToken")));
    [(VCAudioPowerSpectrumSource *)self->_audioPowerSpectrumSource invalidate];

    self->_audioPowerSpectrumSource = 0;
  }
}

- (void)initCodecConfigurationsForStream:(tagVCAudioStreamGroupStream *)a3 withDefaultAudioConfig:(id)a4
{
  a3->var10 = CFDictionaryCreateCopy(0, (CFDictionaryRef)[a4 codecConfigurations]);
  uint64_t v6 = (void *)[a4 multiwayConfig];
  if (v6)
  {
    BOOL v7 = v6;
    if (objc_msgSend((id)objc_msgSend(v6, "v2CodecConfigurations"), "count"))
    {
      [v7 v2CodecConfigurations];
      a3->var12 = 1;
    }
    FigCFCreateCombinedDictionary();
  }
}

- (void)setupStreamsWithStreamInfos:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  p_audioStreams = &self->_audioStreams;
  if (self->_audioStreams)
  {
    if ((VCAudioStreamGroupCommon *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v31 = 136315650;
          uint64_t v32 = v17;
          __int16 v33 = 2080;
          v34 = "-[VCAudioStreamGroupCommon setupStreamsWithStreamInfos:]";
          __int16 v35 = 1024;
          int v36 = 252;
          objc_super v19 = " [%s] %s:%d Streams are already setup";
          uint64_t v20 = v18;
          uint32_t v21 = 28;
LABEL_35:
          _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v31, v21);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        objc_super v5 = (__CFString *)[(VCAudioStreamGroupCommon *)self performSelector:sel_logPrefix];
      }
      else {
        objc_super v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v22 = VRTraceErrorLogLevelToCSTR();
        v23 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v31 = 136316162;
          uint64_t v32 = v22;
          __int16 v33 = 2080;
          v34 = "-[VCAudioStreamGroupCommon setupStreamsWithStreamInfos:]";
          __int16 v35 = 1024;
          int v36 = 252;
          __int16 v37 = 2112;
          v38 = v5;
          __int16 v39 = 2048;
          v40 = self;
          objc_super v19 = " [%s] %s:%d %@(%p) Streams are already setup";
          uint64_t v20 = v23;
          uint32_t v21 = 48;
          goto LABEL_35;
        }
      }
    }
  }
  else
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    uint64_t v7 = [a3 countByEnumeratingWithState:&v44 objects:v43 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v45;
      unsigned int v10 = 1;
      do
      {
        uint64_t v11 = 0;
        v12 = p_audioStreams;
        do
        {
          if (*(void *)v45 != v9) {
            objc_enumerationMutation(a3);
          }
          v13 = *(void **)(*((void *)&v44 + 1) + 8 * v11);
          p_audioStreams = malloc_type_malloc(0x50uLL, 0x10E00400BEC5DB2uLL);
          v14 = (void *)[v13 stream];
          *((void *)p_audioStreams + 5) = v14;
          *((void *)p_audioStreams + 2) = [v14 realtimeSourceContext];
          if (self->_direction == 1) {
            *((void *)p_audioStreams + 3) = [*((id *)p_audioStreams + 5) pullSamplesCallback];
          }
          v15 = objc_msgSend((id)objc_msgSend(v13, "streamConfigs"), "firstObject");
          v16 = (void *)[v15 multiwayConfig];
          *((_WORD *)p_audioStreams + 16) = [v16 idsStreamID];
          *((_WORD *)p_audioStreams + 17) = [v16 v2StreamID];
          *((unsigned char *)p_audioStreams + 8) = 0;
          *((_DWORD *)p_audioStreams + 12) = [v16 maxNetworkBitrate];
          *((_DWORD *)p_audioStreams + 13) = [v16 repairedMaxNetworkBitrate];
          *((unsigned char *)p_audioStreams + 9) = [v15 isRTCPEnabled];
          *(void *)p_audioStreams = 0;
          void *v12 = p_audioStreams;
          [(VCAudioStreamGroupCommon *)self initCodecConfigurationsForStream:p_audioStreams withDefaultAudioConfig:v15];
          if (v10 < [v15 channelCount]) {
            unsigned int v10 = [v15 channelCount];
          }
          ++v11;
          v12 = p_audioStreams;
        }
        while (v8 != v11);
        uint64_t v8 = [a3 countByEnumeratingWithState:&v44 objects:v43 count:16];
      }
      while (v8);
    }
    else
    {
      unsigned int v10 = 1;
    }
    self->_unsigned int maxChannelCount = v10;
    _VCAudioStreamGroup_ApplyAudioPlayoutDelay((uint64_t)self);
    if ((VCAudioStreamGroupCommon *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v25 = VRTraceErrorLogLevelToCSTR();
        v26 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          unsigned int maxChannelCount = self->_maxChannelCount;
          int v31 = 136315906;
          uint64_t v32 = v25;
          __int16 v33 = 2080;
          v34 = "-[VCAudioStreamGroupCommon setupStreamsWithStreamInfos:]";
          __int16 v35 = 1024;
          int v36 = 282;
          __int16 v37 = 1024;
          LODWORD(v38) = maxChannelCount;
          objc_super v19 = " [%s] %s:%d updated _maxChannelCount to channel count: %d";
          uint64_t v20 = v26;
          uint32_t v21 = 34;
          goto LABEL_35;
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v24 = (__CFString *)[(VCAudioStreamGroupCommon *)self performSelector:sel_logPrefix];
      }
      else {
        v24 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v28 = VRTraceErrorLogLevelToCSTR();
        v29 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v30 = self->_maxChannelCount;
          int v31 = 136316418;
          uint64_t v32 = v28;
          __int16 v33 = 2080;
          v34 = "-[VCAudioStreamGroupCommon setupStreamsWithStreamInfos:]";
          __int16 v35 = 1024;
          int v36 = 282;
          __int16 v37 = 2112;
          v38 = v24;
          __int16 v39 = 2048;
          v40 = self;
          __int16 v41 = 1024;
          unsigned int v42 = v30;
          objc_super v19 = " [%s] %s:%d %@(%p) updated _maxChannelCount to channel count: %d";
          uint64_t v20 = v29;
          uint32_t v21 = 54;
          goto LABEL_35;
        }
      }
    }
  }
}

- (void)cleanupStreams
{
  for (i = self->_audioStreams; i; i = self->_audioStreams)
  {
    var10 = i->var10;
    if (var10) {
      CFRelease(var10);
    }
    var11 = i->var11;
    if (var11) {
      CFRelease(var11);
    }
    self->_audioStreams = i->var0;
    free(i);
  }
  self->_audioStreams = 0;
}

- (BOOL)configureAudioIOWithDeviceRole:(int)a3 operatingMode:(int)a4
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  p_sampleBuffer = &self->_sampleBuffer;
  VCAudioBufferList_Destroy((uint64_t *)&self->_sampleBuffer);
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v87 = v8;
  long long v88 = v8;
  long long v85 = v8;
  long long v86 = v8;
  long long v83 = v8;
  long long v84 = v8;
  long long v81 = v8;
  long long v82 = v8;
  long long v79 = v8;
  long long v80 = v8;
  unsigned int audioSessionID = self->_audioSessionID;
  long long v77 = v8;
  long long v78 = v8;
  unsigned int audioChannelIndex = self->_audioChannelIndex;
  long long v76 = v8;
  v75[0] = audioSessionID;
  v75[1] = audioChannelIndex;
  v75[2] = a4;
  v75[3] = a3;
  LODWORD(v76) = self->_audioType;
  WORD2(v76) = self->_direction;
  int processID = self->_processID;
  unsigned int preferredIOSampleRate = self->_preferredIOSampleRate;
  *((void *)&v76 + 1) = self;
  unsigned int preferredIOSamplesPerFrame = self->_preferredIOSamplesPerFrame;
  *(void *)&long long v77 = __PAIR64__(preferredIOSampleRate, processID);
  DWORD2(v77) = preferredIOSamplesPerFrame;
  unint64_t spatialAudioSourceID = self->_spatialAudioSourceID;
  BYTE12(v77) = 0;
  *(void *)&long long v78 = spatialAudioSourceID;
  DWORD2(v78) = self->_maxChannelCount;
  *(void *)&long long v80 = 0;
  long long v79 = 0uLL;
  LOBYTE(preferredIOSampleRate) = self->_isVoiceActivityEnabled;
  BYTE8(v80) = self->_isMediaPriorityEnabled;
  BYTE9(v80) = preferredIOSampleRate;
  if (BYTE4(v76) == 1) {
    v15 = VCAudioStreamGroup_ProcessAudioSamples;
  }
  else {
    v15 = 0;
  }
  if (BYTE4(v76) == 1) {
    v16 = self;
  }
  else {
    v16 = 0;
  }
  *(void *)&long long v81 = 0;
  *((void *)&v81 + 1) = v15;
  *(void *)&long long v82 = v16;
  if (BYTE4(v76) == 1)
  {
    int64_t captionsToken = self->_captionsToken;
    captionsCoordinator = self->_captionsCoordinator;
  }
  else
  {
    int64_t captionsToken = 0;
    captionsCoordinator = 0;
  }
  *((void *)&v82 + 1) = captionsToken;
  *(void *)&long long v83 = captionsCoordinator;
  BYTE8(v83) = 0;
  long long v84 = 0uLL;
  if (BYTE4(v76) == 2) {
    objc_super v19 = VCAudioStreamGroup_ProcessAudioSamples;
  }
  else {
    objc_super v19 = 0;
  }
  if (BYTE4(v76) == 2) {
    uint64_t v20 = self;
  }
  else {
    uint64_t v20 = 0;
  }
  *(void *)&long long v85 = v19;
  *((void *)&v85 + 1) = v20;
  if (BYTE4(v76) == 2)
  {
    int64_t v21 = self->_captionsToken;
    uint64_t v22 = self->_captionsCoordinator;
  }
  else
  {
    int64_t v21 = 0;
    uint64_t v22 = 0;
  }
  *(void *)&long long v86 = v21;
  *((void *)&v86 + 1) = v22;
  LOBYTE(v87) = 1;
  *((void *)&v87 + 1) = 0;
  *(void *)&long long v88 = 0;
  WORD4(v88) = 0;
  audioIO = self->_audioIO;
  if (audioIO)
  {
    if (![(VCAudioIO *)audioIO reconfigureWithConfig:v75])
    {
      if ((VCAudioStreamGroupCommon *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_68;
        }
        uint64_t v54 = VRTraceErrorLogLevelToCSTR();
        v55 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_68;
        }
        v56 = self->_audioIO;
        int direction = self->_direction;
        unsigned int v58 = self->_audioChannelIndex;
        *(_DWORD *)buf = 136316930;
        *(void *)&buf[4] = v54;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCAudioStreamGroupCommon configureAudioIOWithDeviceRole:operatingMode:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 342;
        *(_WORD *)&buf[28] = 2048;
        *(void *)&buf[30] = v56;
        *(_WORD *)&buf[38] = 1024;
        *(_DWORD *)&buf[40] = a4;
        *(_WORD *)&buf[44] = 1024;
        *(_DWORD *)&buf[46] = a3;
        *(_WORD *)&buf[50] = 1024;
        *(_DWORD *)&buf[52] = direction;
        *(_WORD *)&buf[56] = 1024;
        *(_DWORD *)&buf[58] = v58;
        v49 = " [%s] %s:%d Failed to reconfigure: audioIO=%p operatingMode=%d deviceRole=%d direction=%d audioChannelIndex=%u";
        v50 = v55;
        uint32_t v51 = 62;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          v24 = (__CFString *)[(VCAudioStreamGroupCommon *)self performSelector:sel_logPrefix];
        }
        else {
          v24 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_68;
        }
        uint64_t v59 = VRTraceErrorLogLevelToCSTR();
        v60 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_68;
        }
        v61 = self->_audioIO;
        int v62 = self->_direction;
        unsigned int v63 = self->_audioChannelIndex;
        *(_DWORD *)buf = 136317442;
        *(void *)&buf[4] = v59;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCAudioStreamGroupCommon configureAudioIOWithDeviceRole:operatingMode:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 342;
        *(_WORD *)&buf[28] = 2112;
        *(void *)&buf[30] = v24;
        *(_WORD *)&buf[38] = 2048;
        *(void *)&buf[40] = self;
        *(_WORD *)&buf[48] = 2048;
        *(void *)&buf[50] = v61;
        *(_WORD *)&buf[58] = 1024;
        *(_DWORD *)&buf[60] = a4;
        *(_WORD *)&buf[64] = 1024;
        *(_DWORD *)&buf[66] = a3;
        *(_WORD *)&buf[70] = 1024;
        *(_DWORD *)&buf[72] = v62;
        *(_WORD *)&buf[76] = 1024;
        *(_DWORD *)&buf[78] = v63;
        v49 = " [%s] %s:%d %@(%p) Failed to reconfigure: audioIO=%p operatingMode=%d deviceRole=%d direction=%d audioChannelIndex=%u";
        v50 = v60;
        uint32_t v51 = 82;
      }
LABEL_67:
      _os_log_impl(&dword_1E1EA4000, v50, OS_LOG_TYPE_DEFAULT, v49, buf, v51);
LABEL_68:

      BOOL result = 0;
      self->_audioIO = 0;
      return result;
    }
  }
  else
  {
    uint64_t v25 = [[VCAudioIO alloc] initWithConfiguration:v75];
    self->_audioIO = v25;
    if (!v25)
    {
      if ((VCAudioStreamGroupCommon *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_68;
        }
        uint64_t v64 = VRTraceErrorLogLevelToCSTR();
        v65 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_68;
        }
        int v66 = self->_direction;
        *(_DWORD *)buf = 136316418;
        *(void *)&buf[4] = v64;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCAudioStreamGroupCommon configureAudioIOWithDeviceRole:operatingMode:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 334;
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = a4;
        *(_WORD *)&buf[34] = 1024;
        *(_DWORD *)&buf[36] = a3;
        *(_WORD *)&buf[40] = 1024;
        *(_DWORD *)&buf[42] = v66;
        v49 = " [%s] %s:%d Failed to create audioIO. operatingMode=%d deviceRole=%d direction=%d";
        v50 = v65;
        uint32_t v51 = 46;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          long long v46 = (__CFString *)[(VCAudioStreamGroupCommon *)self performSelector:sel_logPrefix];
        }
        else {
          long long v46 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_68;
        }
        int v67 = a4;
        uint64_t v68 = VRTraceErrorLogLevelToCSTR();
        v69 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_68;
        }
        int v70 = self->_direction;
        *(_DWORD *)buf = 136316930;
        *(void *)&buf[4] = v68;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCAudioStreamGroupCommon configureAudioIOWithDeviceRole:operatingMode:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 334;
        *(_WORD *)&buf[28] = 2112;
        *(void *)&buf[30] = v46;
        *(_WORD *)&buf[38] = 2048;
        *(void *)&buf[40] = self;
        *(_WORD *)&buf[48] = 1024;
        *(_DWORD *)&buf[50] = v67;
        *(_WORD *)&buf[54] = 1024;
        *(_DWORD *)&buf[56] = a3;
        *(_WORD *)&buf[60] = 1024;
        *(_DWORD *)&buf[62] = v70;
        v49 = " [%s] %s:%d %@(%p) Failed to create audioIO. operatingMode=%d deviceRole=%d direction=%d";
        v50 = v69;
        uint32_t v51 = 66;
      }
      goto LABEL_67;
    }
    [(VCAudioIO *)v25 setIsGKVoiceChat:self->_isGKVoiceChat];
    [(VCAudioStreamGroupCommon *)self setMuted:self->_isMuted];
    UInt32 v92 = 0;
    long long v90 = 0u;
    long long v91 = 0u;
    memset(buf, 0, sizeof(buf));
    AUIOGetAUNumber(&v92);
    [(VCAudioIO *)self->_audioIO setFarEndVersionInfo:buf];
  }
  v74 = p_sampleBuffer;
  if ((VCAudioStreamGroupCommon *)objc_opt_class() == self)
  {
    int v27 = a3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v28 = VRTraceErrorLogLevelToCSTR();
      v29 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        loga = self->_audioIO;
        int v30 = self->_direction;
        BOOL v31 = [(VCAudioStreamGroupCommon *)self isMuted];
        unsigned int audioType = self->_audioType;
        unsigned int maxChannelCount = self->_maxChannelCount;
        unsigned int v34 = self->_audioChannelIndex;
        *(_DWORD *)buf = 136317698;
        *(void *)&buf[4] = v28;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCAudioStreamGroupCommon configureAudioIOWithDeviceRole:operatingMode:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 344;
        *(_WORD *)&buf[28] = 2048;
        *(void *)&buf[30] = loga;
        *(_WORD *)&buf[38] = 1024;
        *(_DWORD *)&buf[40] = a4;
        *(_WORD *)&buf[44] = 1024;
        *(_DWORD *)&buf[46] = v27;
        *(_WORD *)&buf[50] = 1024;
        *(_DWORD *)&buf[52] = v30;
        *(_WORD *)&buf[56] = 1024;
        *(_DWORD *)&buf[58] = v31;
        *(_WORD *)&buf[62] = 1024;
        *(_DWORD *)&buf[64] = audioType;
        *(_WORD *)&buf[68] = 1024;
        *(_DWORD *)&buf[70] = maxChannelCount;
        *(_WORD *)&buf[74] = 1024;
        *(_DWORD *)&buf[76] = v34;
        __int16 v35 = " [%s] %s:%d configured audioIO=%p operatingMode=%d deviceRole=%d direction=%d isMuted=%d audioType=%d maxC"
              "hannelCount=%d audioChannelIndex=%u";
        int v36 = v29;
        uint32_t v37 = 80;
LABEL_36:
        _os_log_impl(&dword_1E1EA4000, v36, OS_LOG_TYPE_DEFAULT, v35, buf, v37);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v26 = (__CFString *)[(VCAudioStreamGroupCommon *)self performSelector:sel_logPrefix];
    }
    else {
      v26 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v38 = VRTraceErrorLogLevelToCSTR();
      os_log_t log = (os_log_t)*MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        v71 = self->_audioIO;
        int v39 = self->_direction;
        BOOL v40 = [(VCAudioStreamGroupCommon *)self isMuted];
        unsigned int v41 = self->_audioType;
        unsigned int v42 = self->_maxChannelCount;
        unsigned int v43 = self->_audioChannelIndex;
        *(_DWORD *)buf = 136318210;
        *(void *)&buf[4] = v38;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCAudioStreamGroupCommon configureAudioIOWithDeviceRole:operatingMode:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 344;
        *(_WORD *)&buf[28] = 2112;
        *(void *)&buf[30] = v26;
        *(_WORD *)&buf[38] = 2048;
        *(void *)&buf[40] = self;
        *(_WORD *)&buf[48] = 2048;
        *(void *)&buf[50] = v71;
        *(_WORD *)&buf[58] = 1024;
        *(_DWORD *)&buf[60] = a4;
        *(_WORD *)&buf[64] = 1024;
        *(_DWORD *)&buf[66] = a3;
        *(_WORD *)&buf[70] = 1024;
        *(_DWORD *)&buf[72] = v39;
        *(_WORD *)&buf[76] = 1024;
        *(_DWORD *)&buf[78] = v40;
        *(_WORD *)&buf[82] = 1024;
        *(_DWORD *)&buf[84] = v41;
        *(_WORD *)&buf[88] = 1024;
        *(_DWORD *)&buf[90] = v42;
        *(_WORD *)&buf[94] = 1024;
        LODWORD(v90) = v43;
        __int16 v35 = " [%s] %s:%d %@(%p) configured audioIO=%p operatingMode=%d deviceRole=%d direction=%d isMuted=%d audioType="
              "%d maxChannelCount=%d audioChannelIndex=%u";
        int v36 = log;
        uint32_t v37 = 100;
        goto LABEL_36;
      }
    }
  }
  VCAudioBufferList_AllocateFrame((uint64_t)[(VCAudioIO *)self->_audioIO clientFormat], v74);
  if (!*v74)
  {
    if ((VCAudioStreamGroupCommon *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_68;
      }
      uint64_t v47 = VRTraceErrorLogLevelToCSTR();
      uint64_t v48 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_68;
      }
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = v47;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[VCAudioStreamGroupCommon configureAudioIOWithDeviceRole:operatingMode:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 347;
      v49 = " [%s] %s:%d Failed to create sample buffer";
      v50 = v48;
      uint32_t v51 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        long long v45 = (__CFString *)[(VCAudioStreamGroupCommon *)self performSelector:sel_logPrefix];
      }
      else {
        long long v45 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_68;
      }
      uint64_t v52 = VRTraceErrorLogLevelToCSTR();
      v53 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_68;
      }
      *(_DWORD *)buf = 136316162;
      *(void *)&buf[4] = v52;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[VCAudioStreamGroupCommon configureAudioIOWithDeviceRole:operatingMode:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 347;
      *(_WORD *)&buf[28] = 2112;
      *(void *)&buf[30] = v45;
      *(_WORD *)&buf[38] = 2048;
      *(void *)&buf[40] = self;
      v49 = " [%s] %s:%d %@(%p) Failed to create sample buffer";
      v50 = v53;
      uint32_t v51 = 48;
    }
    goto LABEL_67;
  }
  return 1;
}

- (BOOL)reconfigureAudioIOIfNeededWithDeviceRole:(int)a3 operatingMode:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = dispatch_semaphore_create(0);
  if ([(VCAudioIO *)self->_audioIO state] == 2)
  {
    if ([(VCAudioIO *)self->_audioIO stop])
    {
      if ((VCAudioStreamGroupCommon *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCAudioStreamGroupCommon reconfigureAudioIOIfNeededWithDeviceRole:operatingMode:]();
          }
        }
        goto LABEL_9;
      }
      if (objc_opt_respondsToSelector()) {
        v12 = (__CFString *)[(VCAudioStreamGroupCommon *)self performSelector:sel_logPrefix];
      }
      else {
        v12 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v19 = 136316162;
          uint64_t v20 = v15;
          __int16 v21 = 2080;
          uint64_t v22 = "-[VCAudioStreamGroupCommon reconfigureAudioIOIfNeededWithDeviceRole:operatingMode:]";
          __int16 v23 = 1024;
          int v24 = 365;
          __int16 v25 = 2112;
          v26 = v12;
          __int16 v27 = 2048;
          uint64_t v28 = self;
          uint64_t v17 = " [%s] %s:%d %@(%p) stop audio IO failed";
LABEL_39:
          _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v19, 0x30u);
        }
      }
LABEL_9:
      BOOL v9 = 1;
      goto LABEL_10;
    }
    if ([(VCAudioStreamGroupCommon *)self configureAudioIOWithDeviceRole:v5 operatingMode:v4])
    {
      if ([(VCAudioIO *)self->_audioIO start])
      {
        if ((VCAudioStreamGroupCommon *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCAudioStreamGroupCommon reconfigureAudioIOIfNeededWithDeviceRole:operatingMode:]();
            }
          }
          goto LABEL_9;
        }
        long long v8 = (objc_opt_respondsToSelector() & 1) != 0
           ? (__CFString *)[(VCAudioStreamGroupCommon *)self performSelector:sel_logPrefix]
           : &stru_1F3D3E450;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v18 = VRTraceErrorLogLevelToCSTR();
          v16 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            int v19 = 136316162;
            uint64_t v20 = v18;
            __int16 v21 = 2080;
            uint64_t v22 = "-[VCAudioStreamGroupCommon reconfigureAudioIOIfNeededWithDeviceRole:operatingMode:]";
            __int16 v23 = 1024;
            int v24 = 372;
            __int16 v25 = 2112;
            v26 = v8;
            __int16 v27 = 2048;
            uint64_t v28 = self;
            uint64_t v17 = " [%s] %s:%d %@(%p) start audio IO failed";
            goto LABEL_39;
          }
        }
      }
      goto LABEL_9;
    }
  }
  else if ([(VCAudioStreamGroupCommon *)self configureAudioIOWithDeviceRole:v5 operatingMode:v4])
  {
    goto LABEL_9;
  }
  if ((VCAudioStreamGroupCommon *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioStreamGroupCommon reconfigureAudioIOIfNeededWithDeviceRole:operatingMode:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v11 = (__CFString *)[(VCAudioStreamGroupCommon *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v11 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v19 = 136316162;
        uint64_t v20 = v13;
        __int16 v21 = 2080;
        uint64_t v22 = "-[VCAudioStreamGroupCommon reconfigureAudioIOIfNeededWithDeviceRole:operatingMode:]";
        __int16 v23 = 1024;
        int v24 = 368;
        __int16 v25 = 2112;
        v26 = v11;
        __int16 v27 = 2048;
        uint64_t v28 = self;
        _os_log_error_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) configure audio IO failed", (uint8_t *)&v19, 0x30u);
      }
    }
  }
  BOOL v9 = 0;
LABEL_10:
  dispatch_release(v7);
  return v9;
}

- (BOOL)addSyncDestination:(id)a3 shouldSchedule:(BOOL)a4
{
  if (a4) {
    return [(VCAudioStreamGroupCommon *)self enqueueSyncDestinationChangeEvent:a3 eventType:1];
  }
  else {
    return _VCAudioStreamGroup_AddSyncDestination((uint64_t)self, a3);
  }
}

- (BOOL)removeSyncDestination:(id)a3 shouldSchedule:(BOOL)a4
{
  if (a4) {
    return [(VCAudioStreamGroupCommon *)self enqueueSyncDestinationChangeEvent:a3 eventType:2];
  }
  else {
    return _VCAudioStreamGroup_RemoveSyncDestination((uint64_t)self, (uint64_t)a3);
  }
}

- (void)updateVoiceActivityEnabled:(BOOL)a3 isMediaPriorityEnabled:(BOOL)a4
{
  if (self->_isVoiceActivityEnabled != a3 || self->_isMediaPriorityEnabled != a4)
  {
    self->_isVoiceActivityEnabled = a3;
    self->_isMediaPriorityEnabled = a4;
    -[VCAudioIO updateVoiceActivityEnabled:isMediaPriorityEnabled:](self->_audioIO, "updateVoiceActivityEnabled:isMediaPriorityEnabled:", self->_isVoiceActivityEnabled);
  }
}

- (id)startCapture
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((VCAudioStreamGroupCommon *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        audioIO = self->_audioIO;
        *(_DWORD *)v14 = 136316162;
        *(void *)&v14[4] = v4;
        *(_WORD *)&v14[12] = 2080;
        *(void *)&v14[14] = "-[VCAudioStreamGroupCommon startCapture]";
        *(_WORD *)&v14[22] = 1024;
        LODWORD(v15) = 478;
        WORD2(v15) = 2048;
        *(void *)((char *)&v15 + 6) = self;
        HIWORD(v15) = 2048;
        v16 = (VCAudioStreamGroupCommon *)audioIO;
        uint64_t v7 = " [%s] %s:%d (%p) starting audioIO=%p";
        long long v8 = v5;
        uint32_t v9 = 48;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, v14, v9);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v3 = (__CFString *)[(VCAudioStreamGroupCommon *)self performSelector:sel_logPrefix];
    }
    else {
      v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        v12 = self->_audioIO;
        *(_DWORD *)v14 = 136316674;
        *(void *)&v14[4] = v10;
        *(_WORD *)&v14[12] = 2080;
        *(void *)&v14[14] = "-[VCAudioStreamGroupCommon startCapture]";
        *(_WORD *)&v14[22] = 1024;
        LODWORD(v15) = 478;
        WORD2(v15) = 2112;
        *(void *)((char *)&v15 + 6) = v3;
        HIWORD(v15) = 2048;
        v16 = self;
        *(_WORD *)uint64_t v17 = 2048;
        *(void *)&v17[2] = self;
        *(_WORD *)&v17[10] = 2048;
        *(void *)&v17[12] = v12;
        uint64_t v7 = " [%s] %s:%d %@(%p) (%p) starting audioIO=%p";
        long long v8 = v11;
        uint32_t v9 = 68;
        goto LABEL_11;
      }
    }
  }
  return [(VCAudioIO *)self->_audioIO start];
}

- (id)stopCapture
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ((VCAudioStreamGroupCommon *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        audioIO = self->_audioIO;
        *(_DWORD *)uint64_t v22 = 136315906;
        *(void *)&v22[4] = v4;
        *(_WORD *)&v22[12] = 2080;
        *(void *)&v22[14] = "-[VCAudioStreamGroupCommon stopCapture]";
        *(_WORD *)&v22[22] = 1024;
        LODWORD(v23) = 489;
        WORD2(v23) = 2048;
        *(void *)((char *)&v23 + 6) = audioIO;
        uint64_t v7 = " [%s] %s:%d Stopping audioIO=%p";
        long long v8 = v5;
        uint32_t v9 = 38;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, v22, v9);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v3 = (__CFString *)[(VCAudioStreamGroupCommon *)self performSelector:sel_logPrefix];
    }
    else {
      v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        v12 = self->_audioIO;
        *(_DWORD *)uint64_t v22 = 136316418;
        *(void *)&v22[4] = v10;
        *(_WORD *)&v22[12] = 2080;
        *(void *)&v22[14] = "-[VCAudioStreamGroupCommon stopCapture]";
        *(_WORD *)&v22[22] = 1024;
        LODWORD(v23) = 489;
        WORD2(v23) = 2112;
        *(void *)((char *)&v23 + 6) = v3;
        HIWORD(v23) = 2048;
        int v24 = self;
        LOWORD(v25) = 2048;
        *(void *)((char *)&v25 + 2) = v12;
        uint64_t v7 = " [%s] %s:%d %@(%p) Stopping audioIO=%p";
        long long v8 = v11;
        uint32_t v9 = 58;
        goto LABEL_11;
      }
    }
  }
  if ([(VCAudioIO *)self->_audioIO state] == 2) {
    return [(VCAudioIO *)self->_audioIO stop];
  }
  if ((VCAudioStreamGroupCommon *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 0;
    }
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
    *(_DWORD *)uint64_t v22 = 136315650;
    *(void *)&v22[4] = v15;
    *(_WORD *)&v22[12] = 2080;
    *(void *)&v22[14] = "-[VCAudioStreamGroupCommon stopCapture]";
    *(_WORD *)&v22[22] = 1024;
    LODWORD(v23) = 497;
    uint64_t v17 = " [%s] %s:%d audioIO already stopped";
    uint64_t v18 = v16;
    uint32_t v19 = 28;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v14 = (__CFString *)[(VCAudioStreamGroupCommon *)self performSelector:sel_logPrefix];
    }
    else {
      v14 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 0;
    }
    uint64_t v20 = VRTraceErrorLogLevelToCSTR();
    __int16 v21 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
    *(_DWORD *)uint64_t v22 = 136316162;
    *(void *)&v22[4] = v20;
    *(_WORD *)&v22[12] = 2080;
    *(void *)&v22[14] = "-[VCAudioStreamGroupCommon stopCapture]";
    *(_WORD *)&v22[22] = 1024;
    LODWORD(v23) = 497;
    WORD2(v23) = 2112;
    *(void *)((char *)&v23 + 6) = v14;
    HIWORD(v23) = 2048;
    int v24 = self;
    uint64_t v17 = " [%s] %s:%d %@(%p) audioIO already stopped";
    uint64_t v18 = v21;
    uint32_t v19 = 48;
  }
  _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, v17, v22, v19);
  return 0;
}

- (id)getAudioDumpName
{
  return 0;
}

- (void)setMuted:(BOOL)a3
{
  self->_isMuted = a3;
  audioIO = self->_audioIO;
  if (audioIO)
  {
    if (self->_direction == 2) {
      -[VCAudioIO setMuted:](audioIO, "setMuted:");
    }
  }
}

- (BOOL)configureStreams:(id)a3 withRateControlConfig:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (![(VCAudioStreamGroupCommon *)self configurePowerSpectrumSource])
  {
    if ((VCAudioStreamGroupCommon *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioStreamGroupCommon configureStreams:withRateControlConfig:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint32_t v19 = (__CFString *)[(VCAudioStreamGroupCommon *)self performSelector:sel_logPrefix];
      }
      else {
        uint32_t v19 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v20 = VRTraceErrorLogLevelToCSTR();
        __int16 v21 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v35 = v20;
          __int16 v36 = 2080;
          uint32_t v37 = "-[VCAudioStreamGroupCommon configureStreams:withRateControlConfig:]";
          __int16 v38 = 1024;
          int v39 = 550;
          __int16 v40 = 2112;
          unsigned int v41 = v19;
          __int16 v42 = 2048;
          unsigned int v43 = self;
          _os_log_error_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to configure the power spectrum source", buf, 0x30u);
        }
      }
    }
    goto LABEL_30;
  }
  [(VCAudioStreamGroupCommon *)self setupStreamsWithStreamInfos:a3];
  if (![(VCAudioStreamGroupCommon *)self configureAudioIOWithDeviceRole:self->_deviceRole operatingMode:self->_operatingMode])
  {
LABEL_30:
    [(VCAudioStreamGroupCommon *)self cleanupStreams];
    [(VCAudioStreamGroupCommon *)self cleanupPowerSpectrumSource];
    return 0;
  }
  int deviceRole = self->_deviceRole;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v30 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    obuint64_t j = a3;
    uint64_t v23 = *(void *)v31;
    if (deviceRole == 3) {
      uint64_t v9 = 6;
    }
    else {
      uint64_t v9 = 5;
    }
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        v12 = objc_msgSend(v11, "streamConfigs", obj);
        uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v24 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v26;
          do
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v26 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void **)(*((void *)&v25 + 1) + 8 * j);
              [v17 setAudioStreamMode:v9];
              [v17 setShouldApplyRedAsBoolean:1];
              objc_msgSend(v17, "setExternalIOFormat:", -[VCAudioIO clientFormat](self->_audioIO, "clientFormat"));
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v24 count:16];
          }
          while (v14);
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v29 count:16];
    }
    while (v8);
  }
  return 1;
}

- (void)collectAndLogChannelMetrics:(id *)a3 averagePower:(float)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  audioStreams = self->_audioStreams;
  if (audioStreams)
  {
    double v7 = a4;
    *(void *)&long long v8 = 136317698;
    long long v33 = v8;
    do
    {
      id var7 = audioStreams->var7;
      uint64_t v57 = 0;
      memset(v56, 0, sizeof(v56));
      if (self->_direction == 2) {
        [var7 collectTxChannelMetrics:v56];
      }
      else {
        [var7 collectRxChannelMetrics:v56];
      }
      VCMediaChannelMetrics_Sum((uint64_t)a3, (uint64_t)v56);
      int v10 = HIDWORD(v57);
      int v11 = v10 - [var7 lastNoVoiceActivityPacketCount];
      [var7 setLastNoVoiceActivityPacketCount:HIDWORD(v57)];
      if ((VCAudioStreamGroupCommon *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
          goto LABEL_20;
        }
        uint64_t v25 = VRTraceErrorLogLevelToCSTR();
        long long v26 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_20;
        }
        long long v27 = "Receive";
        if (self->_direction == 2) {
          long long v27 = "Send";
        }
        __int16 v36 = v27;
        int v28 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(var7, "defaultStreamConfig", v33), "multiwayConfig"), "idsStreamID");
        int v29 = v56[0];
        audioIO = self->_audioIO;
        unsigned int processedFramesCount = self->_processedFramesCount;
        unsigned int v32 = [(VCAudioIO *)audioIO state];
        *(_DWORD *)buf = v33;
        uint64_t v38 = v25;
        __int16 v39 = 2080;
        __int16 v40 = "-[VCAudioStreamGroupCommon collectAndLogChannelMetrics:averagePower:]";
        __int16 v41 = 1024;
        int v42 = 586;
        __int16 v43 = 2080;
        uint64_t v44 = (__CFString *)v36;
        __int16 v45 = 1024;
        *(_DWORD *)long long v46 = v28;
        *(_WORD *)&v46[4] = 1024;
        *(_DWORD *)&v46[6] = v29;
        *(_WORD *)uint64_t v47 = 2048;
        *(void *)&v47[2] = audioIO;
        *(_WORD *)uint64_t v48 = 1024;
        *(_DWORD *)&v48[2] = processedFramesCount;
        LOWORD(v49) = 2048;
        *(double *)((char *)&v49 + 2) = v7;
        WORD5(v49) = 1024;
        HIDWORD(v49) = v32;
        *(_WORD *)v50 = 1024;
        *(_DWORD *)&v50[2] = v11;
        uint64_t v22 = v26;
        uint64_t v23 = " [%s] %s:%d Health Monitor for Audio Stream %s Group streamID=%u audio=%ukbps VCAudioIO=%p procsCount=%u a"
              "veragePower=%f state=%d noVoiceActivityPacketCount=%u";
        uint32_t v24 = 88;
      }
      else
      {
        v12 = &stru_1F3D3E450;
        if (objc_opt_respondsToSelector()) {
          v12 = (__CFString *)[(VCAudioStreamGroupCommon *)self performSelector:sel_logPrefix];
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
          goto LABEL_20;
        }
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        uint64_t v14 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_20;
        }
        uint64_t v15 = "Receive";
        if (self->_direction == 2) {
          uint64_t v15 = "Send";
        }
        uint64_t v35 = v15;
        int v16 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(var7, "defaultStreamConfig", v33), "multiwayConfig"), "idsStreamID");
        int v34 = v11;
        uint64_t v17 = a3;
        int v18 = v56[0];
        uint32_t v19 = self->_audioIO;
        unsigned int v20 = self->_processedFramesCount;
        unsigned int v21 = [(VCAudioIO *)v19 state];
        *(_DWORD *)buf = 136318210;
        uint64_t v38 = v13;
        __int16 v39 = 2080;
        __int16 v40 = "-[VCAudioStreamGroupCommon collectAndLogChannelMetrics:averagePower:]";
        __int16 v41 = 1024;
        int v42 = 586;
        __int16 v43 = 2112;
        uint64_t v44 = v12;
        __int16 v45 = 2048;
        *(void *)long long v46 = self;
        *(_WORD *)&v46[8] = 2080;
        *(void *)uint64_t v47 = v35;
        *(_WORD *)&v47[8] = 1024;
        *(_DWORD *)uint64_t v48 = v16;
        *(_WORD *)&v48[4] = 1024;
        LODWORD(v49) = v18;
        a3 = v17;
        WORD2(v49) = 2048;
        *(void *)((char *)&v49 + 6) = v19;
        HIWORD(v49) = 1024;
        *(_DWORD *)v50 = v20;
        *(_WORD *)&v50[4] = 2048;
        double v51 = v7;
        __int16 v52 = 1024;
        unsigned int v53 = v21;
        __int16 v54 = 1024;
        int v55 = v34;
        uint64_t v22 = v14;
        uint64_t v23 = " [%s] %s:%d %@(%p) Health Monitor for Audio Stream %s Group streamID=%u audio=%ukbps VCAudioIO=%p procsCou"
              "nt=%u averagePower=%f state=%d noVoiceActivityPacketCount=%u";
        uint32_t v24 = 108;
      }
      _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, v23, buf, v24);
LABEL_20:
      audioStreams = audioStreams->var0;
    }
    while (audioStreams);
  }
}

- (BOOL)enqueueSyncDestinationChangeEvent:(id)a3 eventType:(int)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioStreamGroupCommon enqueueSyncDestinationChangeEvent:eventType:]();
      }
    }
    return 1;
  }
  double v7 = VCMemoryPool_Alloc((OSQueueHead *)self->_syncDestinationChangeEventPool);
  v7[1] = a3;
  *(_DWORD *)double v7 = a4;
  OSStatus v8 = CMSimpleQueueEnqueue(self->_syncDestinationChangeEventQueue, v7);
  if (!v8) {
    return 1;
  }
  OSStatus v9 = v8;
  if ((VCAudioStreamGroupCommon *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioStreamGroupCommon enqueueSyncDestinationChangeEvent:eventType:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      int v10 = (__CFString *)[(VCAudioStreamGroupCommon *)self performSelector:sel_logPrefix];
    }
    else {
      int v10 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v14 = 136316418;
        uint64_t v15 = v11;
        __int16 v16 = 2080;
        uint64_t v17 = "-[VCAudioStreamGroupCommon enqueueSyncDestinationChangeEvent:eventType:]";
        __int16 v18 = 1024;
        int v19 = 600;
        __int16 v20 = 2112;
        unsigned int v21 = v10;
        __int16 v22 = 2048;
        uint64_t v23 = self;
        __int16 v24 = 1024;
        OSStatus v25 = v9;
        _os_log_error_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Error adding sync destination change event to the queue. error=%d", (uint8_t *)&v14, 0x36u);
      }
    }
  }
  VCMemoryPool_Free((OSQueueHead *)self->_syncDestinationChangeEventPool, v7);
  return 0;
}

- (void)didSuspendAudioIO:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ((VCAudioStreamGroupCommon *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      double v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315906;
        uint64_t v14 = v6;
        __int16 v15 = 2080;
        __int16 v16 = "-[VCAudioStreamGroupCommon didSuspendAudioIO:]";
        __int16 v17 = 1024;
        int v18 = 611;
        __int16 v19 = 2048;
        id v20 = a3;
        OSStatus v8 = " [%s] %s:%d audioIO=%p";
        OSStatus v9 = v7;
        uint32_t v10 = 38;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCAudioStreamGroupCommon *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136316418;
        uint64_t v14 = v11;
        __int16 v15 = 2080;
        __int16 v16 = "-[VCAudioStreamGroupCommon didSuspendAudioIO:]";
        __int16 v17 = 1024;
        int v18 = 611;
        __int16 v19 = 2112;
        id v20 = v5;
        __int16 v21 = 2048;
        __int16 v22 = self;
        __int16 v23 = 2048;
        id v24 = a3;
        OSStatus v8 = " [%s] %s:%d %@(%p) audioIO=%p";
        OSStatus v9 = v12;
        uint32_t v10 = 58;
        goto LABEL_11;
      }
    }
  }
}

- (void)didResumeAudioIO:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ((VCAudioStreamGroupCommon *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      double v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315906;
        uint64_t v14 = v6;
        __int16 v15 = 2080;
        __int16 v16 = "-[VCAudioStreamGroupCommon didResumeAudioIO:]";
        __int16 v17 = 1024;
        int v18 = 615;
        __int16 v19 = 2048;
        id v20 = a3;
        OSStatus v8 = " [%s] %s:%d audioIO=%p";
        OSStatus v9 = v7;
        uint32_t v10 = 38;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCAudioStreamGroupCommon *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136316418;
        uint64_t v14 = v11;
        __int16 v15 = 2080;
        __int16 v16 = "-[VCAudioStreamGroupCommon didResumeAudioIO:]";
        __int16 v17 = 1024;
        int v18 = 615;
        __int16 v19 = 2112;
        id v20 = v5;
        __int16 v21 = 2048;
        __int16 v22 = self;
        __int16 v23 = 2048;
        id v24 = a3;
        OSStatus v8 = " [%s] %s:%d %@(%p) audioIO=%p";
        OSStatus v9 = v12;
        uint32_t v10 = 58;
        goto LABEL_11;
      }
    }
  }
}

- (void)audioPowerSpectrumSinkDidRegister
{
}

- (void)audioPowerSpectrumSinkDidUnregister
{
}

- (void)sendAudioPowerSpectrumSourceRegistration:(BOOL)a3
{
  BOOL v3 = a3;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionaryAddValue(Mutable, @"VCSPUUID", self->_participantUUID);
  CFDictionaryAddValue(Mutable, @"VCSPAPSReg", (const void *)[NSNumber numberWithBool:v3]);
  [(VCObject *)self reportingAgent];
  reportingGenericEvent();
  if (Mutable)
  {
    CFRelease(Mutable);
  }
}

- (void)didUpdateBasebandCodec:(const _VCRemoteCodecInfo *)a3
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCAudioStreamGroupCommon didUpdateBasebandCodec:]();
    }
  }
}

+ (BOOL)isSupportedDirection:(unsigned __int8)a3
{
  return (a3 - 1) < 2;
}

- (void)cleanupSyncDestinations
{
  p_syncDestinationList = &self->_syncDestinationList;
  slh_first = self->_syncDestinationList.slh_first;
  if (slh_first)
  {
    do
    {
      uint64_t v4 = p_syncDestinationList->slh_first;
      uint64_t v5 = p_syncDestinationList;
      if (p_syncDestinationList->slh_first != slh_first)
      {
        do
        {
          uint64_t v6 = v4;
          uint64_t v4 = (tagVCAudioStreamGroupSyncDestination *)*((void *)v4 + 2);
        }
        while (v4 != slh_first);
        uint64_t v5 = (VCAudioStreamGroupSyncDestinationList *)((char *)v6 + 16);
      }
      double v7 = (tagVCAudioStreamGroupSyncDestination *)*((void *)slh_first + 2);
      v5->slh_first = v7;

      free(slh_first);
      slh_first = v7;
    }
    while (v7);
  }
}

- (BOOL)isMuted
{
  return self->_isMuted;
}

- (int)deviceRole
{
  return self->_deviceRole;
}

- (VCAudioIO)audioIO
{
  return self->_audioIO;
}

- (unsigned)audioChannelIndex
{
  return self->_audioChannelIndex;
}

- (void)setAudioChannelIndex:(unsigned int)a3
{
  self->_unsigned int audioChannelIndex = a3;
}

- (void)callback
{
  return self->_callback;
}

- (void)setCallback:(void *)a3
{
  self->_callback = a3;
}

- (void)context
{
  return self->_context;
}

- (void)setContext:(void *)a3
{
  self->_context = a3;
}

- (void)initWithConfig:audioCallback:context:audioDirection:stateQueue:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d State queue cannot be nil", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:audioCallback:context:audioDirection:stateQueue:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4_3(&dword_1E1EA4000, v0, v1, " [%s] %s:%d %@(%p) State queue cannot be nil");
}

- (void)initWithConfig:audioCallback:context:audioDirection:stateQueue:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create sync destination change event queue", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:audioCallback:context:audioDirection:stateQueue:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4_3(&dword_1E1EA4000, v0, v1, " [%s] %s:%d %@(%p) Failed to create sync destination change event queue");
}

- (void)initWithConfig:audioCallback:context:audioDirection:stateQueue:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create sync destination change event pool", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:(NSObject *)a3 audioCallback:context:audioDirection:stateQueue:.cold.6(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 136315906;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2080;
  *(void *)&v3[14] = "-[VCAudioStreamGroupCommon initWithConfig:audioCallback:context:audioDirection:stateQueue:]";
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, a2, a3, " [%s] %s:%d Invalid direction %d", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[VCAudioStreamGroupCommon initWithConfig:audioCallback:context:audioDirection:stateQueue:]" >> 16, 100);
}

- (void)configurePowerSpectrumSource
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create audio power spectrum", v2, v3, v4, v5, v6);
}

- (void)reconfigureAudioIOIfNeededWithDeviceRole:operatingMode:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d start audio IO failed", v2, v3, v4, v5, v6);
}

- (void)reconfigureAudioIOIfNeededWithDeviceRole:operatingMode:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d configure audio IO failed", v2, v3, v4, v5, v6);
}

- (void)reconfigureAudioIOIfNeededWithDeviceRole:operatingMode:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d stop audio IO failed", v2, v3, v4, v5, v6);
}

- (void)configureStreams:withRateControlConfig:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to configure the power spectrum source", v2, v3, v4, v5, v6);
}

- (void)enqueueSyncDestinationChangeEvent:eventType:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unexpected event type", v2, v3, v4, v5, v6);
}

- (void)enqueueSyncDestinationChangeEvent:eventType:.cold.2()
{
  OUTLINED_FUNCTION_2();
  *(_WORD *)&v4[4] = v0;
  *(void *)&v4[6] = "-[VCAudioStreamGroupCommon enqueueSyncDestinationChangeEvent:eventType:]";
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Error adding sync destination change event to the queue. error=%d", v3, *(const char **)v4, (unint64_t)"-[VCAudioStreamGroupCommon enqueueSyncDestinationChangeEvent:eventType:]" >> 16, 600);
}

- (void)didUpdateBasebandCodec:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unexpected SPI call", v2, v3, v4, v5, v6);
}

@end