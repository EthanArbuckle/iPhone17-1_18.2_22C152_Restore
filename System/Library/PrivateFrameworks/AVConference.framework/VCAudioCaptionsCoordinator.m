@interface VCAudioCaptionsCoordinator
- (BOOL)captionsEnabled;
- (BOOL)captionsSupported;
- (BOOL)lockedCaptionsEnabled;
- (BOOL)registerStreamWithConfig:(const tagVCAudioCaptionsStreamConfig *)a3;
- (BOOL)setUpSecondaryBufferQueue;
- (VCAudioCaptionsCoordinator)initWithOneToOneEnabled:(BOOL)a3 isLocal:(BOOL)a4 taskIdentifier:(id)a5 reportingAgent:(opaqueRTCReporting *)a6;
- (id)captionsDelegate;
- (int64_t)currentlyCaptionedStreamToken;
- (int64_t)state;
- (os_unfair_lock_s)stateLock;
- (void)cleanUpSecondaryBufferQueue;
- (void)dealloc;
- (void)didDisableCaptions:(BOOL)a3 error:(id)a4;
- (void)didEnableCaptions:(BOOL)a3 error:(id)a4;
- (void)didStartCaptioningWithReason:(int)a3 streamToken:(int64_t)a4;
- (void)didStopCaptioningWithReason:(int)a3 streamToken:(int64_t)a4;
- (void)didUpdateCaptions:(id)a3;
- (void)enableCaptions:(BOOL)a3;
- (void)invalidate;
- (void)lockedEnableCaptions:(BOOL)a3;
- (void)prewarmCaptions;
- (void)registerCaptionsEventDelegate:(id)a3;
- (void)setCaptionsLocale:(id)a3;
- (void)setCaptionsUsage:(id)a3;
- (void)setCurrentlyCaptionedStreamToken:(int64_t)a3;
- (void)setOneToOneModeEnabled:(BOOL)a3;
- (void)setState:(int64_t)a3;
- (void)setStateLock:(os_unfair_lock_s)a3;
- (void)setUpSecondaryBufferQueue;
@end

@implementation VCAudioCaptionsCoordinator

- (VCAudioCaptionsCoordinator)initWithOneToOneEnabled:(BOOL)a3 isLocal:(BOOL)a4 taskIdentifier:(id)a5 reportingAgent:(opaqueRTCReporting *)a6
{
  BOOL v8 = a4;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  v40.receiver = self;
  v40.super_class = (Class)VCAudioCaptionsCoordinator;
  v10 = [(VCObject *)&v40 init];
  if (!v10) {
    return v10;
  }
  if (!a5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioCaptionsCoordinator initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:]();
      }
    }
    goto LABEL_93;
  }
  v11 = [[VCAudioCaptions alloc] initWithDelegate:v10 isLocal:v8 taskIdentifier:a5 reportingAgent:a6];
  v10->_audioCaptions = v11;
  if (!v11)
  {
    if ((VCAudioCaptionsCoordinator *)objc_opt_class() == v10)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioCaptionsCoordinator initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:]();
        }
      }
      goto LABEL_93;
    }
    if (objc_opt_respondsToSelector()) {
      v24 = (__CFString *)[(VCAudioCaptionsCoordinator *)v10 performSelector:sel_logPrefix];
    }
    else {
      v24 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_93;
    }
    uint64_t v31 = VRTraceErrorLogLevelToCSTR();
    v32 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_93;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v42 = v31;
    __int16 v43 = 2080;
    v44 = "-[VCAudioCaptionsCoordinator initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:]";
    __int16 v45 = 1024;
    int v46 = 93;
    __int16 v47 = 2112;
    v48 = v24;
    __int16 v49 = 2048;
    v50 = v10;
    v33 = " [%s] %s:%d %@(%p) Failed to create audio captions object.";
    goto LABEL_92;
  }
  v12 = [VCCaptionsGibberishDetector alloc];
  double DoubleValueForKey = VCDefaults_GetDoubleValueForKey(@"captionsConfidenceGibberishThreshold", 0.6875);
  uint64_t v14 = [(VCCaptionsGibberishDetector *)v12 initWithGibberishThreshold:(int)VCDefaults_GetIntValueForKey(@"captionsConfidenceGibberishDetectionWindowLength", 30) windowLength:DoubleValueForKey];
  v10->_gibberishDetector = (VCCaptionsGibberishDetector *)v14;
  if (!v14)
  {
    if ((VCAudioCaptionsCoordinator *)objc_opt_class() == v10)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioCaptionsCoordinator initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:]();
        }
      }
      goto LABEL_93;
    }
    if (objc_opt_respondsToSelector()) {
      v25 = (__CFString *)[(VCAudioCaptionsCoordinator *)v10 performSelector:sel_logPrefix];
    }
    else {
      v25 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_93;
    }
    uint64_t v34 = VRTraceErrorLogLevelToCSTR();
    v32 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_93;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v42 = v34;
    __int16 v43 = 2080;
    v44 = "-[VCAudioCaptionsCoordinator initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:]";
    __int16 v45 = 1024;
    int v46 = 95;
    __int16 v47 = 2112;
    v48 = v25;
    __int16 v49 = 2048;
    v50 = v10;
    v33 = " [%s] %s:%d %@(%p) Failed to create gibberish detection object.";
    goto LABEL_92;
  }
  v15 = [[VCAudioCaptionsBufferInfoCollection alloc] initWithBufferLength:0.5];
  v10->_bufferInfos = v15;
  if (!v15)
  {
    if ((VCAudioCaptionsCoordinator *)objc_opt_class() == v10)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioCaptionsCoordinator initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:].cold.4();
        }
      }
      goto LABEL_93;
    }
    if (objc_opt_respondsToSelector()) {
      v26 = (__CFString *)[(VCAudioCaptionsCoordinator *)v10 performSelector:sel_logPrefix];
    }
    else {
      v26 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_93;
    }
    uint64_t v35 = VRTraceErrorLogLevelToCSTR();
    v32 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_93;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v42 = v35;
    __int16 v43 = 2080;
    v44 = "-[VCAudioCaptionsCoordinator initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:]";
    __int16 v45 = 1024;
    int v46 = 97;
    __int16 v47 = 2112;
    v48 = v26;
    __int16 v49 = 2048;
    v50 = v10;
    v33 = " [%s] %s:%d %@(%p) Failed to buffer info collection.";
    goto LABEL_92;
  }
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
  dispatch_queue_t v17 = dispatch_queue_create_with_target_V2("com.apple.AVConference.VCAudioCaptionsCoordinator.delegateQueue", 0, CustomRootQueue);
  v10->_delegateQueue = (OS_dispatch_queue *)v17;
  if (!v17)
  {
    if ((VCAudioCaptionsCoordinator *)objc_opt_class() == v10)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioCaptionsCoordinator initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:].cold.5();
        }
      }
      goto LABEL_93;
    }
    if (objc_opt_respondsToSelector()) {
      v27 = (__CFString *)[(VCAudioCaptionsCoordinator *)v10 performSelector:sel_logPrefix];
    }
    else {
      v27 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_93;
    }
    uint64_t v36 = VRTraceErrorLogLevelToCSTR();
    v32 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_93;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v42 = v36;
    __int16 v43 = 2080;
    v44 = "-[VCAudioCaptionsCoordinator initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:]";
    __int16 v45 = 1024;
    int v46 = 100;
    __int16 v47 = 2112;
    v48 = v27;
    __int16 v49 = 2048;
    v50 = v10;
    v33 = " [%s] %s:%d %@(%p) Failed to create delegateQueue";
    goto LABEL_92;
  }
  if (![(VCAudioCaptionsCoordinator *)v10 setUpSecondaryBufferQueue])
  {
    if ((VCAudioCaptionsCoordinator *)objc_opt_class() == v10)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioCaptionsCoordinator initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:].cold.8();
        }
      }
      goto LABEL_93;
    }
    if (objc_opt_respondsToSelector()) {
      v28 = (__CFString *)[(VCAudioCaptionsCoordinator *)v10 performSelector:sel_logPrefix];
    }
    else {
      v28 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_93;
    }
    uint64_t v37 = VRTraceErrorLogLevelToCSTR();
    v32 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_93;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v42 = v37;
    __int16 v43 = 2080;
    v44 = "-[VCAudioCaptionsCoordinator initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:]";
    __int16 v45 = 1024;
    int v46 = 102;
    __int16 v47 = 2112;
    v48 = v28;
    __int16 v49 = 2048;
    v50 = v10;
    v33 = " [%s] %s:%d %@(%p) Failed to create setup the secondary buffer queue";
    goto LABEL_92;
  }
  v10->_oneToOneEnabled = a3;
  v10->_stateLock._os_unfair_lock_opaque = 0;
  v10->_startStopSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  if (a6) {
    v18 = (opaqueRTCReporting *)CFRetain(a6);
  }
  else {
    v18 = 0;
  }
  v10->_reportingAgent = v18;
  int IsInternalOSInstalled = VRTraceIsInternalOSInstalled();
  if (IsInternalOSInstalled) {
    LOBYTE(IsInternalOSInstalled) = VCDefaults_GetBoolValueForKey(@"forceCaptionsVoiceDetection", 0);
  }
  v10->_forceCaptionsVoiceDetection = IsInternalOSInstalled;
  v20 = (opaqueVCVoiceDetector *)VCVoiceDetector_Create(0);
  v10->_voiceDetectorInfoPrimary.voiceDetector = v20;
  if (!v20)
  {
    if ((VCAudioCaptionsCoordinator *)objc_opt_class() == v10)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioCaptionsCoordinator initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:].cold.6();
        }
      }
      goto LABEL_93;
    }
    if (objc_opt_respondsToSelector()) {
      v29 = (__CFString *)[(VCAudioCaptionsCoordinator *)v10 performSelector:sel_logPrefix];
    }
    else {
      v29 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_93;
    }
    uint64_t v38 = VRTraceErrorLogLevelToCSTR();
    v32 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_93;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v42 = v38;
    __int16 v43 = 2080;
    v44 = "-[VCAudioCaptionsCoordinator initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:]";
    __int16 v45 = 1024;
    int v46 = 109;
    __int16 v47 = 2112;
    v48 = v29;
    __int16 v49 = 2048;
    v50 = v10;
    v33 = " [%s] %s:%d %@(%p) Failed to create the primary voice detector";
LABEL_92:
    _os_log_error_impl(&dword_1E1EA4000, v32, OS_LOG_TYPE_ERROR, v33, buf, 0x30u);
    goto LABEL_93;
  }
  v21 = (opaqueVCVoiceDetector *)VCVoiceDetector_Create(v10->_forceCaptionsVoiceDetection);
  v10->_voiceDetectorInfoSecondary.voiceDetector = v21;
  if (!v21)
  {
    if ((VCAudioCaptionsCoordinator *)objc_opt_class() == v10)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioCaptionsCoordinator initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:].cold.7();
        }
      }
      goto LABEL_93;
    }
    if (objc_opt_respondsToSelector()) {
      v30 = (__CFString *)[(VCAudioCaptionsCoordinator *)v10 performSelector:sel_logPrefix];
    }
    else {
      v30 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v39 = VRTraceErrorLogLevelToCSTR();
      v32 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v42 = v39;
        __int16 v43 = 2080;
        v44 = "-[VCAudioCaptionsCoordinator initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:]";
        __int16 v45 = 1024;
        int v46 = 111;
        __int16 v47 = 2112;
        v48 = v30;
        __int16 v49 = 2048;
        v50 = v10;
        v33 = " [%s] %s:%d %@(%p) Failed to create the secondary voice detector";
        goto LABEL_92;
      }
    }
LABEL_93:

    return 0;
  }
  v10->_lowPriorityThresholdSeconds = VCDefaults_GetInternalOSDoubleValueForKey(@"captionsLowPriorityThresholdSeconds", 0.75);
  unsigned int IntValueForKey = VRTraceIsInternalOSInstalled();
  if (IntValueForKey) {
    unsigned int IntValueForKey = VCDefaults_GetIntValueForKey(@"ignoreCaptionsForThreads", 0);
  }
  v10->_ignoreCaptionsForThreads = IntValueForKey;
  return v10;
}

- (void)invalidate
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d invalidate called several times by client", v2, v3, v4, v5, v6);
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  [(VCAudioCaptions *)self->_audioCaptions setDelegate:0];

  if (self->_voiceDetectorInfoPrimary.isVoiceDetectorRunning)
  {
    VCVoiceDetector_Stop(self->_voiceDetectorInfoPrimary.voiceDetector);
    self->_voiceDetectorInfoPrimary.isVoiceDetectorRunning = 0;
  }
  VCVoiceDetector_Destroy((void **)&self->_voiceDetectorInfoPrimary.voiceDetector);
  if (self->_voiceDetectorInfoSecondary.isVoiceDetectorRunning)
  {
    VCVoiceDetector_Stop(self->_voiceDetectorInfoSecondary.voiceDetector);
    self->_voiceDetectorInfoSecondary.isVoiceDetectorRunning = 0;
  }
  VCVoiceDetector_Destroy((void **)&self->_voiceDetectorInfoSecondary.voiceDetector);
  delegateQueue = self->_delegateQueue;
  if (delegateQueue) {
    dispatch_release(delegateQueue);
  }
  [(VCAudioCaptionsCoordinator *)self cleanUpSecondaryBufferQueue];
  v4.receiver = self;
  v4.super_class = (Class)VCAudioCaptionsCoordinator;
  [(VCObject *)&v4 dealloc];
}

- (BOOL)setUpSecondaryBufferQueue
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  OSStatus v4 = CMSimpleQueueCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 2, &self->_secondarySamplesQueue);
  if (v4)
  {
    OSStatus v6 = v4;
    if ((VCAudioCaptionsCoordinator *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v5) {
          return v5;
        }
        -[VCAudioCaptionsCoordinator setUpSecondaryBufferQueue]();
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v7 = (__CFString *)[(VCAudioCaptionsCoordinator *)self performSelector:sel_logPrefix];
      }
      else {
        v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x1E4F47A50];
        BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v5) {
          return v5;
        }
        int v26 = 136316418;
        uint64_t v27 = v18;
        __int16 v28 = 2080;
        v29 = "-[VCAudioCaptionsCoordinator setUpSecondaryBufferQueue]";
        __int16 v30 = 1024;
        int v31 = 170;
        __int16 v32 = 2112;
        v33 = v7;
        __int16 v34 = 2048;
        uint64_t v35 = self;
        __int16 v36 = 1024;
        OSStatus v37 = v6;
        _os_log_error_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to create samples queue. status=%d", (uint8_t *)&v26, 0x36u);
      }
    }
    goto LABEL_39;
  }
  if (VCAllocatorFirstCome_Create(v3, (uint64_t)"com.apple.AVConference.VCAudioCaptionsCoordinator.secondarySamplesAllocator", &self->_secondarySamplesAllocator))
  {
    if ((VCAudioCaptionsCoordinator *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        BOOL v8 = (__CFString *)[(VCAudioCaptionsCoordinator *)self performSelector:sel_logPrefix];
      }
      else {
        BOOL v8 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_39;
      }
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E4F47A50];
      BOOL v22 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      LOBYTE(v5) = 0;
      if (!v22) {
        return v5;
      }
      int v26 = 136316162;
      uint64_t v27 = v20;
      __int16 v28 = 2080;
      v29 = "-[VCAudioCaptionsCoordinator setUpSecondaryBufferQueue]";
      __int16 v30 = 1024;
      int v31 = 173;
      __int16 v32 = 2112;
      v33 = v8;
      __int16 v34 = 2048;
      uint64_t v35 = self;
      v13 = " [%s] %s:%d %@(%p) Failed to create the samples allocator";
LABEL_37:
      v16 = v21;
      uint32_t v17 = 48;
      goto LABEL_38;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E4F47A50];
      BOOL v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      LOBYTE(v5) = 0;
      if (!v12) {
        return v5;
      }
      int v26 = 136315650;
      uint64_t v27 = v10;
      __int16 v28 = 2080;
      v29 = "-[VCAudioCaptionsCoordinator setUpSecondaryBufferQueue]";
      __int16 v30 = 1024;
      int v31 = 173;
      v13 = " [%s] %s:%d Failed to create the samples allocator";
      goto LABEL_24;
    }
  }
  else
  {
    if (!VCAllocatorFirstCome_Create(v3, (uint64_t)"com.apple.AVConference.VCAudioCaptionsCoordinator.secondarySampleBufferInfoAllocator", &self->_secondarySampleBufferInfoAllocator))
    {
      LOBYTE(v5) = 1;
      return v5;
    }
    if ((VCAudioCaptionsCoordinator *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        v9 = (__CFString *)[(VCAudioCaptionsCoordinator *)self performSelector:sel_logPrefix];
      }
      else {
        v9 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_39;
      }
      uint64_t v23 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E4F47A50];
      BOOL v24 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      LOBYTE(v5) = 0;
      if (!v24) {
        return v5;
      }
      int v26 = 136316162;
      uint64_t v27 = v23;
      __int16 v28 = 2080;
      v29 = "-[VCAudioCaptionsCoordinator setUpSecondaryBufferQueue]";
      __int16 v30 = 1024;
      int v31 = 176;
      __int16 v32 = 2112;
      v33 = v9;
      __int16 v34 = 2048;
      uint64_t v35 = self;
      v13 = " [%s] %s:%d %@(%p) Failed to create the samples allocator";
      goto LABEL_37;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E4F47A50];
      BOOL v15 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      LOBYTE(v5) = 0;
      if (!v15) {
        return v5;
      }
      int v26 = 136315650;
      uint64_t v27 = v14;
      __int16 v28 = 2080;
      v29 = "-[VCAudioCaptionsCoordinator setUpSecondaryBufferQueue]";
      __int16 v30 = 1024;
      int v31 = 176;
      v13 = " [%s] %s:%d Failed to create the samples allocator";
LABEL_24:
      v16 = v11;
      uint32_t v17 = 28;
LABEL_38:
      _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v26, v17);
    }
  }
LABEL_39:
  LOBYTE(v5) = 0;
  return v5;
}

- (void)cleanUpSecondaryBufferQueue
{
  v7[1] = *MEMORY[0x1E4F143B8];
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  while (1)
  {
    v7[0] = (uint64_t)CMSimpleQueueDequeue(self->_secondarySamplesQueue);
    if (!v7[0]) {
      break;
    }
    _VCAudioCaptionsCoordinator_ReleaseSampleInfo((uint64_t)self, v7);
  }
  secondarySamplesQueue = self->_secondarySamplesQueue;
  if (secondarySamplesQueue)
  {
    CFRelease(secondarySamplesQueue);
    self->_secondarySamplesQueue = 0;
  }
  secondarySamplesAllocator = self->_secondarySamplesAllocator;
  if (secondarySamplesAllocator)
  {
    CFRelease(secondarySamplesAllocator);
    self->_secondarySamplesAllocator = 0;
  }
  secondarySampleBufferInfoAllocator = self->_secondarySampleBufferInfoAllocator;
  if (secondarySampleBufferInfoAllocator)
  {
    CFRelease(secondarySampleBufferInfoAllocator);
    self->_secondarySampleBufferInfoAllocator = 0;
  }
  os_unfair_lock_unlock(p_stateLock);
}

- (void)setOneToOneModeEnabled:(BOOL)a3
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (!self->_invalidated) {
    self->_oneToOneEnabled = a3;
  }

  os_unfair_lock_unlock(p_stateLock);
}

- (BOOL)registerStreamWithConfig:(const tagVCAudioCaptionsStreamConfig *)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (!self->_invalidated
    && VCAudioCaptionsBufferInfoCollection_AddBufferInfo((uint64_t)self->_bufferInfos, &a3->var0, 0))
  {
    objc_msgSend(+[VCCaptionsManager defaultManager](VCCaptionsManager, "defaultManager"), "registerCaptionsSource:streamToken:", self, a3->var0);
    if ((VCAudioCaptionsCoordinator *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_25;
      }
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      uint64_t v20 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
      int64_t var0 = a3->var0;
      int v30 = 136315906;
      uint64_t v31 = v19;
      __int16 v32 = 2080;
      v33 = "-[VCAudioCaptionsCoordinator registerStreamWithConfig:]";
      __int16 v34 = 1024;
      int v35 = 258;
      __int16 v36 = 2048;
      int64_t v37 = var0;
      BOOL v22 = " [%s] %s:%d Register captions source streamToken=%ld";
      uint64_t v23 = v20;
      uint32_t v24 = 38;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        OSStatus v6 = (__CFString *)[(VCAudioCaptionsCoordinator *)self performSelector:sel_logPrefix];
      }
      else {
        OSStatus v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_25;
      }
      uint64_t v25 = VRTraceErrorLogLevelToCSTR();
      int v26 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
      int64_t v27 = a3->var0;
      int v30 = 136316418;
      uint64_t v31 = v25;
      __int16 v32 = 2080;
      v33 = "-[VCAudioCaptionsCoordinator registerStreamWithConfig:]";
      __int16 v34 = 1024;
      int v35 = 258;
      __int16 v36 = 2112;
      int64_t v37 = (int64_t)v6;
      __int16 v38 = 2048;
      uint64_t v39 = self;
      __int16 v40 = 2048;
      int64_t v41 = v27;
      BOOL v22 = " [%s] %s:%d %@(%p) Register captions source streamToken=%ld";
      uint64_t v23 = v26;
      uint32_t v24 = 58;
    }
    _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v30, v24);
LABEL_25:
    BOOL v17 = 1;
    goto LABEL_16;
  }
  if ((VCAudioCaptionsCoordinator *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_15;
    }
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    int64_t v10 = a3->var0;
    BOOL invalidated = self->_invalidated;
    int v30 = 136316162;
    uint64_t v31 = v8;
    __int16 v32 = 2080;
    v33 = "-[VCAudioCaptionsCoordinator registerStreamWithConfig:]";
    __int16 v34 = 1024;
    int v35 = 260;
    __int16 v36 = 2048;
    int64_t v37 = v10;
    __int16 v38 = 1024;
    LODWORD(v39) = invalidated;
    BOOL v12 = " [%s] %s:%d Could not register streamToken=%ld for captions, invalidated=%{BOOL}d";
    v13 = v9;
    uint32_t v14 = 44;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v7 = (__CFString *)[(VCAudioCaptionsCoordinator *)self performSelector:sel_logPrefix];
    }
    else {
      v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_15;
    }
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    BOOL v28 = self->_invalidated;
    int64_t v29 = a3->var0;
    int v30 = 136316674;
    uint64_t v31 = v15;
    __int16 v32 = 2080;
    v33 = "-[VCAudioCaptionsCoordinator registerStreamWithConfig:]";
    __int16 v34 = 1024;
    int v35 = 260;
    __int16 v36 = 2112;
    int64_t v37 = (int64_t)v7;
    __int16 v38 = 2048;
    uint64_t v39 = self;
    __int16 v40 = 2048;
    int64_t v41 = v29;
    __int16 v42 = 1024;
    BOOL v43 = v28;
    BOOL v12 = " [%s] %s:%d %@(%p) Could not register streamToken=%ld for captions, invalidated=%{BOOL}d";
    v13 = v16;
    uint32_t v14 = 64;
  }
  _os_log_error_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v30, v14);
LABEL_15:
  BOOL v17 = 0;
LABEL_16:
  os_unfair_lock_unlock(p_stateLock);
  return v17;
}

- (void)registerCaptionsEventDelegate:(id)a3
{
  if (!a3 || [a3 conformsToProtocol:&unk_1F3DDCC90])
  {
    objc_storeWeak((id *)&self->_captionsDelegate, a3);
  }
}

- (id)captionsDelegate
{
  return objc_loadWeak((id *)&self->_captionsDelegate);
}

- (void)setCaptionsLocale:(id)a3
{
}

- (void)setCaptionsUsage:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    OSStatus v4 = @"ACSU";
    v5[0] = a3;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
    os_unfair_lock_lock(&self->_stateLock);
    if (!self->_invalidated) {
      reportingGenericEvent();
    }
    os_unfair_lock_unlock(&self->_stateLock);
  }
}

- (BOOL)lockedCaptionsEnabled
{
  os_unfair_lock_assert_owner(&self->_stateLock);
  audioCaptions = self->_audioCaptions;

  return [(VCAudioCaptions *)audioCaptions enabled];
}

- (BOOL)captionsEnabled
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  BOOL v4 = !self->_invalidated && [(VCAudioCaptionsCoordinator *)self lockedCaptionsEnabled];
  os_unfair_lock_unlock(p_stateLock);
  return v4;
}

- (BOOL)captionsSupported
{
  return +[VCAudioCaptions captionsSupported];
}

- (void)prewarmCaptions
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (!self->_invalidated) {
    [(VCAudioCaptions *)self->_audioCaptions prewarmCaptions];
  }

  os_unfair_lock_unlock(p_stateLock);
}

- (void)lockedEnableCaptions:(BOOL)a3
{
  BOOL v3 = a3;
  os_unfair_lock_assert_owner(&self->_stateLock);
  if (!self->_invalidated && [(VCAudioCaptionsCoordinator *)self lockedCaptionsEnabled] != v3)
  {
    [(VCAudioCaptions *)self->_audioCaptions enableCaptions:v3];
    self->_state = v3;
  }
}

- (void)enableCaptions:(BOOL)a3
{
  BOOL v3 = a3;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  [(VCAudioCaptionsCoordinator *)self lockedEnableCaptions:v3];

  os_unfair_lock_unlock(p_stateLock);
}

- (void)didDisableCaptions:(BOOL)a3 error:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  reportingGenericEvent();
  uint64_t v11 = 0;
  BOOL v12 = &v11;
  uint64_t v13 = 0x3052000000;
  uint32_t v14 = __Block_byref_object_copy__6;
  uint64_t v15 = __Block_byref_object_dispose__6;
  uint64_t v16 = 0;
  os_unfair_lock_lock(&self->_stateLock);
  uint64_t v7 = [(NSArray *)[(VCAudioCaptionsBufferInfoCollection *)self->_bufferInfos streamTokens] copy];
  v12[5] = v7;
  [(VCCaptionsGibberishDetector *)self->_gibberishDetector reset];
  os_unfair_lock_unlock(&self->_stateLock);
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__VCAudioCaptionsCoordinator_didDisableCaptions_error___block_invoke;
  block[3] = &unk_1E6DB6690;
  block[5] = a4;
  block[6] = &v11;
  BOOL v10 = a3;
  block[4] = self;
  dispatch_async(delegateQueue, block);
  _Block_object_dispose(&v11, 8);
}

void __55__VCAudioCaptionsCoordinator_didDisableCaptions_error___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v2 = [obj countByEnumeratingWithState:&v32 objects:v31 count:16];
  if (v2)
  {
    uint64_t v4 = v2;
    uint64_t v5 = *(void *)v33;
    *(void *)&long long v3 = 136315906;
    long long v17 = v3;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v33 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(__CFString **)(*((void *)&v32 + 1) + 8 * i);
        if (objc_opt_class() == *(void *)(a1 + 32))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v15 = VRTraceErrorLogLevelToCSTR();
            uint64_t v16 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v17;
              uint64_t v20 = v15;
              __int16 v21 = 2080;
              BOOL v22 = "-[VCAudioCaptionsCoordinator didDisableCaptions:error:]_block_invoke";
              __int16 v23 = 1024;
              int v24 = 348;
              __int16 v25 = 2112;
              int v26 = v7;
              BOOL v12 = v16;
              uint64_t v13 = " [%s] %s:%d Disabled captioning for token=%@";
              uint32_t v14 = 38;
              goto LABEL_15;
            }
          }
        }
        else
        {
          uint64_t v8 = &stru_1F3D3E450;
          if (objc_opt_respondsToSelector()) {
            uint64_t v8 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v9 = VRTraceErrorLogLevelToCSTR();
            BOOL v10 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v11 = *(void *)(a1 + 32);
              *(_DWORD *)buf = 136316418;
              uint64_t v20 = v9;
              __int16 v21 = 2080;
              BOOL v22 = "-[VCAudioCaptionsCoordinator didDisableCaptions:error:]_block_invoke";
              __int16 v23 = 1024;
              int v24 = 348;
              __int16 v25 = 2112;
              int v26 = v8;
              __int16 v27 = 2048;
              uint64_t v28 = v11;
              __int16 v29 = 2112;
              int v30 = v7;
              BOOL v12 = v10;
              uint64_t v13 = " [%s] %s:%d %@(%p) Disabled captioning for token=%@";
              uint32_t v14 = 58;
LABEL_15:
              _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, v14);
            }
          }
        }
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 168), "streamToken:didDisableCaptions:error:", -[__CFString unsignedIntValue](v7, "unsignedIntValue", v17), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 40));
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v32 objects:v31 count:16];
    }
    while (v4);
  }
}

- (void)didEnableCaptions:(BOOL)a3 error:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  reportingGenericEvent();
  uint64_t v11 = 0;
  BOOL v12 = &v11;
  uint64_t v13 = 0x3052000000;
  uint32_t v14 = __Block_byref_object_copy__6;
  uint64_t v15 = __Block_byref_object_dispose__6;
  uint64_t v16 = 0;
  os_unfair_lock_lock(&self->_stateLock);
  uint64_t v7 = [(NSArray *)[(VCAudioCaptionsBufferInfoCollection *)self->_bufferInfos streamTokens] copy];
  v12[5] = v7;
  [(VCCaptionsGibberishDetector *)self->_gibberishDetector reset];
  os_unfair_lock_unlock(&self->_stateLock);
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__VCAudioCaptionsCoordinator_didEnableCaptions_error___block_invoke;
  block[3] = &unk_1E6DB6690;
  block[5] = a4;
  block[6] = &v11;
  BOOL v10 = a3;
  block[4] = self;
  dispatch_async(delegateQueue, block);
  _Block_object_dispose(&v11, 8);
}

void __54__VCAudioCaptionsCoordinator_didEnableCaptions_error___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v2 = [obj countByEnumeratingWithState:&v32 objects:v31 count:16];
  if (v2)
  {
    uint64_t v4 = v2;
    uint64_t v5 = *(void *)v33;
    *(void *)&long long v3 = 136315906;
    long long v17 = v3;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v33 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(__CFString **)(*((void *)&v32 + 1) + 8 * i);
        if (objc_opt_class() == *(void *)(a1 + 32))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v15 = VRTraceErrorLogLevelToCSTR();
            uint64_t v16 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v17;
              uint64_t v20 = v15;
              __int16 v21 = 2080;
              BOOL v22 = "-[VCAudioCaptionsCoordinator didEnableCaptions:error:]_block_invoke";
              __int16 v23 = 1024;
              int v24 = 364;
              __int16 v25 = 2112;
              int v26 = v7;
              BOOL v12 = v16;
              uint64_t v13 = " [%s] %s:%d Enabled captioning for token=%@";
              uint32_t v14 = 38;
              goto LABEL_15;
            }
          }
        }
        else
        {
          uint64_t v8 = &stru_1F3D3E450;
          if (objc_opt_respondsToSelector()) {
            uint64_t v8 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v9 = VRTraceErrorLogLevelToCSTR();
            BOOL v10 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v11 = *(void *)(a1 + 32);
              *(_DWORD *)buf = 136316418;
              uint64_t v20 = v9;
              __int16 v21 = 2080;
              BOOL v22 = "-[VCAudioCaptionsCoordinator didEnableCaptions:error:]_block_invoke";
              __int16 v23 = 1024;
              int v24 = 364;
              __int16 v25 = 2112;
              int v26 = v8;
              __int16 v27 = 2048;
              uint64_t v28 = v11;
              __int16 v29 = 2112;
              int v30 = v7;
              BOOL v12 = v10;
              uint64_t v13 = " [%s] %s:%d %@(%p) Enabled captioning for token=%@";
              uint32_t v14 = 58;
LABEL_15:
              _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, v14);
            }
          }
        }
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 168), "streamToken:didEnableCaptions:error:", -[__CFString unsignedIntValue](v7, "unsignedIntValue", v17), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 40));
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v32 objects:v31 count:16];
    }
    while (v4);
  }
}

- (void)didStartCaptioningWithReason:(int)a3 streamToken:(int64_t)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ((VCAudioCaptionsCoordinator *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v19 = v8;
        __int16 v20 = 2080;
        __int16 v21 = "-[VCAudioCaptionsCoordinator didStartCaptioningWithReason:streamToken:]";
        __int16 v22 = 1024;
        int v23 = 372;
        __int16 v24 = 2048;
        int64_t v25 = a4;
        BOOL v10 = " [%s] %s:%d Started captioning for token=%ld";
        uint64_t v11 = v9;
        uint32_t v12 = 38;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v7 = (__CFString *)[(VCAudioCaptionsCoordinator *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      uint32_t v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v19 = v13;
        __int16 v20 = 2080;
        __int16 v21 = "-[VCAudioCaptionsCoordinator didStartCaptioningWithReason:streamToken:]";
        __int16 v22 = 1024;
        int v23 = 372;
        __int16 v24 = 2112;
        int64_t v25 = (int64_t)v7;
        __int16 v26 = 2048;
        __int16 v27 = self;
        __int16 v28 = 2048;
        int64_t v29 = a4;
        BOOL v10 = " [%s] %s:%d %@(%p) Started captioning for token=%ld";
        uint64_t v11 = v14;
        uint32_t v12 = 58;
        goto LABEL_11;
      }
    }
  }
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__VCAudioCaptionsCoordinator_didStartCaptioningWithReason_streamToken___block_invoke;
  block[3] = &unk_1E6DB3F58;
  block[4] = self;
  block[5] = a4;
  int v17 = a3;
  dispatch_async(delegateQueue, block);
}

uint64_t __71__VCAudioCaptionsCoordinator_didStartCaptioningWithReason_streamToken___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 168) streamToken:*(void *)(a1 + 40) didStartCaptioningWithReason:*(unsigned __int8 *)(a1 + 48)];
}

- (void)didStopCaptioningWithReason:(int)a3 streamToken:(int64_t)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ((VCAudioCaptionsCoordinator *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v19 = v8;
        __int16 v20 = 2080;
        __int16 v21 = "-[VCAudioCaptionsCoordinator didStopCaptioningWithReason:streamToken:]";
        __int16 v22 = 1024;
        int v23 = 379;
        __int16 v24 = 2048;
        int64_t v25 = a4;
        BOOL v10 = " [%s] %s:%d Stopped captioning for token=%ld";
        uint64_t v11 = v9;
        uint32_t v12 = 38;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v7 = (__CFString *)[(VCAudioCaptionsCoordinator *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      uint32_t v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v19 = v13;
        __int16 v20 = 2080;
        __int16 v21 = "-[VCAudioCaptionsCoordinator didStopCaptioningWithReason:streamToken:]";
        __int16 v22 = 1024;
        int v23 = 379;
        __int16 v24 = 2112;
        int64_t v25 = (int64_t)v7;
        __int16 v26 = 2048;
        __int16 v27 = self;
        __int16 v28 = 2048;
        int64_t v29 = a4;
        BOOL v10 = " [%s] %s:%d %@(%p) Stopped captioning for token=%ld";
        uint64_t v11 = v14;
        uint32_t v12 = 58;
        goto LABEL_11;
      }
    }
  }
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__VCAudioCaptionsCoordinator_didStopCaptioningWithReason_streamToken___block_invoke;
  block[3] = &unk_1E6DB3F58;
  block[4] = self;
  block[5] = a4;
  int v17 = a3;
  dispatch_async(delegateQueue, block);
}

uint64_t __70__VCAudioCaptionsCoordinator_didStopCaptioningWithReason_streamToken___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 168) streamToken:*(void *)(a1 + 40) didStopCaptioningWithReason:*(unsigned __int8 *)(a1 + 48)];
}

- (void)didUpdateCaptions:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ((VCAudioCaptionsCoordinator *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v20 = v6;
        __int16 v21 = 2080;
        __int16 v22 = "-[VCAudioCaptionsCoordinator didUpdateCaptions:]";
        __int16 v23 = 1024;
        int v24 = 386;
        __int16 v25 = 2048;
        uint64_t v26 = [a3 streamToken];
        uint64_t v8 = " [%s] %s:%d Got transcription for token=%ld";
        uint64_t v9 = v7;
        uint32_t v10 = 38;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCAudioCaptionsCoordinator *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint32_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v20 = v11;
        __int16 v21 = 2080;
        __int16 v22 = "-[VCAudioCaptionsCoordinator didUpdateCaptions:]";
        __int16 v23 = 1024;
        int v24 = 386;
        __int16 v25 = 2112;
        uint64_t v26 = (uint64_t)v5;
        __int16 v27 = 2048;
        __int16 v28 = self;
        __int16 v29 = 2048;
        uint64_t v30 = [a3 streamToken];
        uint64_t v8 = " [%s] %s:%d %@(%p) Got transcription for token=%ld";
        uint64_t v9 = v12;
        uint32_t v10 = 58;
        goto LABEL_11;
      }
    }
  }
  BOOL v13 = [(VCCaptionsGibberishDetector *)self->_gibberishDetector processTranscript:a3];
  BOOL v14 = -[VCCaptionsGibberishDetector gibberishStateForCaptionsToken:](self->_gibberishDetector, "gibberishStateForCaptionsToken:", [a3 streamToken]);
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__VCAudioCaptionsCoordinator_didUpdateCaptions___block_invoke;
  block[3] = &unk_1E6DB66B8;
  BOOL v17 = v13;
  block[4] = self;
  block[5] = a3;
  BOOL v18 = v14;
  dispatch_async(delegateQueue, block);
}

uint64_t __48__VCAudioCaptionsCoordinator_didUpdateCaptions___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 168), "streamToken:didDetectGibberish:", objc_msgSend(*(id *)(a1 + 40), "streamToken"), *(unsigned __int8 *)(a1 + 49));
  }
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 168);
  uint64_t v3 = [*(id *)(a1 + 40) streamToken];
  uint64_t v4 = *(void *)(a1 + 40);

  return [v2 streamToken:v3 didUpdateCaptions:v4];
}

- (int64_t)currentlyCaptionedStreamToken
{
  return self->_currentlyCaptionedStreamToken;
}

- (void)setCurrentlyCaptionedStreamToken:(int64_t)a3
{
  self->_currentlyCaptionedStreamToken = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (os_unfair_lock_s)stateLock
{
  return self->_stateLock;
}

- (void)setStateLock:(os_unfair_lock_s)a3
{
  self->_stateLock = a3;
}

intptr_t ___VCAudioCaptionsCoordinator_StartCaptioning_block_invoke(uint64_t a1, int a2)
{
  char v2 = a2;
  if (a2)
  {
    _VCAudioCaptionsCoordinator_PushAudioSamplesToRecognizer(*(void **)(a1 + 32), *(void *)(a1 + 40));
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      ___VCAudioCaptionsCoordinator_StartCaptioning_block_invoke_cold_1();
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 48) + 224));
}

intptr_t ___VCAudioCaptionsCoordinator_StopCaptioning_block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      ___VCAudioCaptionsCoordinator_StopCaptioning_block_invoke_cold_1();
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 224));
}

- (void)initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Requires valid taskIdentifier", v2, v3, v4, v5, v6);
}

- (void)initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create audio captions object.", v2, v3, v4, v5, v6);
}

- (void)initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create gibberish detection object.", v2, v3, v4, v5, v6);
}

- (void)initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to buffer info collection.", v2, v3, v4, v5, v6);
}

- (void)initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create delegateQueue", v2, v3, v4, v5, v6);
}

- (void)initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create the primary voice detector", v2, v3, v4, v5, v6);
}

- (void)initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create the secondary voice detector", v2, v3, v4, v5, v6);
}

- (void)initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:.cold.8()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create setup the secondary buffer queue", v2, v3, v4, v5, v6);
}

- (void)setUpSecondaryBufferQueue
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v4 = "-[VCAudioCaptionsCoordinator setUpSecondaryBufferQueue]";
  OUTLINED_FUNCTION_3();
  int v5 = 170;
  __int16 v6 = v0;
  int v7 = v1;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to create samples queue. status=%d", v3, 0x22u);
}

void ___VCAudioCaptionsCoordinator_StartCaptioning_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Tried to start captions but failed.", v2, v3, v4, v5, v6);
}

void ___VCAudioCaptionsCoordinator_StopCaptioning_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Tried to stop captions but failed.", v2, v3, v4, v5, v6);
}

@end