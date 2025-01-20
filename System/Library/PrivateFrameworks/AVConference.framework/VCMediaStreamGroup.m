@interface VCMediaStreamGroup
- (AVCStatisticsCollector)statisticsCollector;
- (BOOL)addSyncDestination:(id)a3;
- (BOOL)configureStreams;
- (BOOL)containsStreamWithIDSStreamID:(unsigned __int16)a3;
- (BOOL)containsStreamWithSSRC:(unsigned int)a3;
- (BOOL)encryptionInfoReceived;
- (BOOL)handleEncryptionInfoChange:(id)a3;
- (BOOL)hasRepairedStreams;
- (BOOL)isEnabledAtStart;
- (BOOL)removeSyncDestination:(id)a3;
- (BOOL)setupStreamsWithConfig:(id)a3;
- (BOOL)shouldSetPause:(BOOL)a3 onStream:(id)a4;
- (NSArray)mediaStreamInfoArray;
- (NSDictionary)streamIDToMediaStreamMap;
- (NSString)description;
- (TimingCollection)perfTimers;
- (VCMediaCaptureController)captureController;
- (VCMediaRecorder)mediaRecorder;
- (VCMediaStreamGroup)initWithConfig:(id)a3;
- (double)externalRenderLatency;
- (double)firstMediaFrameReceivedTime;
- (id)pause;
- (id)pauseMediaStreams;
- (id)resume;
- (id)resumeMediaStreams;
- (id)setPauseOnMediaStreams:(BOOL)a3;
- (id)start;
- (id)startCapture;
- (id)startMediaStreams;
- (id)stop;
- (id)stopCapture;
- (id)stopMediaStreams;
- (id)willStart;
- (int64_t)streamToken;
- (tagVCSecurityKeyHolder)securityKeyHolder;
- (unsigned)mediaSubtype;
- (unsigned)mediaType;
- (unsigned)state;
- (unsigned)streamGroupID;
- (unsigned)syncGroupID;
- (void)callDelegateWithBlock:(id)a3;
- (void)configureStreams;
- (void)dealloc;
- (void)didPause:(BOOL)a3;
- (void)didStart;
- (void)didStop;
- (void)finalizePerfTimersForFirstMediaFrameWithTime:(double)a3;
- (void)handleActiveConnectionChange:(id)a3;
- (void)mediaStream:(id)a3 didReceiveFlushRequestWithPayloads:(id)a4;
- (void)mediaStream:(id)a3 didReceiveNewMediaKeyIndex:(id)a4;
- (void)mediaStream:(id)a3 didReceiveRTPGapForMediaKeyIndex:(id)a4;
- (void)pauseMediaStreams;
- (void)perfTimerStarted;
- (void)registerMediaStreamNotificationDelegate;
- (void)reportParticipantsPerfTimings;
- (void)resetDecryptionTimeout;
- (void)resumeMediaStreams;
- (void)setCaptureController:(id)a3;
- (void)setEnabledAtStart:(BOOL)a3;
- (void)setEncryptionInfoReceived:(BOOL)a3;
- (void)setExternalRenderLatency:(double)a3;
- (void)setFirstMKIToFirstMediaReceivedTimerForMKIReceivedTime;
- (void)setFirstMediaFrameReceivedTime:(double)a3;
- (void)setMediaRecorder:(id)a3;
- (void)setMediaSubtype:(unsigned int)a3;
- (void)setMediaType:(unsigned int)a3;
- (void)setParticipantJoinedToFirstMKITimer;
- (void)setStatisticsCollector:(id)a3;
- (void)setSyncGroupID:(unsigned int)a3;
- (void)setTotalMediaStallSaveIntervalWithTime:(double)a3;
- (void)setupPerfTimersWithMediaKeyIndex:(id)a3 perfTimerIndexToStart:(int)a4;
- (void)unregisterMediaStreamNotificationDelegate;
@end

@implementation VCMediaStreamGroup

- (VCMediaStreamGroup)initWithConfig:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  v42.receiver = self;
  v42.super_class = (Class)VCMediaStreamGroup;
  v4 = [(VCObject *)&v42 init];
  if (!v4) {
    goto LABEL_69;
  }
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaStreamGroup initWithConfig:]();
      }
    }
    goto LABEL_69;
  }
  v4->_streamGroupID = [a3 streamGroupID];
  v4->_participantUUID = (NSString *)(id)[a3 participantUUID];
  -[VCObject setLogPrefix:](v4, "setLogPrefix:", [NSString stringWithFormat:@"streamGroupID=%s participantUUID=%@ ", FourccToCStr(v4->_streamGroupID), v4->_participantUUID]);
  v5 = (VCNetworkFeedbackController *)[a3 networkFeedbackController];
  v4->_networkFeedbackController = v5;
  if (v5) {
    CFRetain(v5);
  }
  if (![a3 delegate])
  {
    if ((VCMediaStreamGroup *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaStreamGroup initWithConfig:]();
        }
      }
      goto LABEL_69;
    }
    if (objc_opt_respondsToSelector()) {
      v24 = (__CFString *)[(VCMediaStreamGroup *)v4 performSelector:sel_logPrefix];
    }
    else {
      v24 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_69;
    }
    uint64_t v30 = VRTraceErrorLogLevelToCSTR();
    v31 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_69;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v44 = v30;
    __int16 v45 = 2080;
    v46 = "-[VCMediaStreamGroup initWithConfig:]";
    __int16 v47 = 1024;
    int v48 = 86;
    __int16 v49 = 2112;
    v50 = v24;
    __int16 v51 = 2048;
    v52 = v4;
    v32 = " [%s] %s:%d %@(%p) Delegate is nil";
    goto LABEL_58;
  }
  if (![a3 delegateQueue])
  {
    if ((VCMediaStreamGroup *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaStreamGroup initWithConfig:]();
        }
      }
      goto LABEL_69;
    }
    if (objc_opt_respondsToSelector()) {
      v25 = (__CFString *)[(VCMediaStreamGroup *)v4 performSelector:sel_logPrefix];
    }
    else {
      v25 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_69;
    }
    uint64_t v33 = VRTraceErrorLogLevelToCSTR();
    v31 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_69;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v44 = v33;
    __int16 v45 = 2080;
    v46 = "-[VCMediaStreamGroup initWithConfig:]";
    __int16 v47 = 1024;
    int v48 = 87;
    __int16 v49 = 2112;
    v50 = v25;
    __int16 v51 = 2048;
    v52 = v4;
    v32 = " [%s] %s:%d %@(%p) Delegate queue is nil";
LABEL_58:
    v34 = v31;
    uint32_t v35 = 48;
LABEL_68:
    _os_log_error_impl(&dword_1E1EA4000, v34, OS_LOG_TYPE_ERROR, v32, buf, v35);
    goto LABEL_69;
  }
  v6 = (const char *)objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"%s.stateQueue.%s.%u", "com.apple.AVConference.VCMediaStreamGroup", FourccToCStr(v4->_streamGroupID), objc_msgSend(a3, "streamToken")), "UTF8String");
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  dispatch_queue_t v8 = dispatch_queue_create_with_target_V2(v6, 0, CustomRootQueue);
  v4->_stateQueue = (OS_dispatch_queue *)v8;
  if (!v8)
  {
    if ((VCMediaStreamGroup *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v28 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaStreamGroup initWithConfig:].cold.4(v28, a3);
        }
      }
      goto LABEL_69;
    }
    if (objc_opt_respondsToSelector()) {
      v26 = (__CFString *)[(VCMediaStreamGroup *)v4 performSelector:sel_logPrefix];
    }
    else {
      v26 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v36 = VRTraceErrorLogLevelToCSTR();
      v37 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v38 = [a3 streamToken];
        *(_DWORD *)buf = 136316418;
        uint64_t v44 = v36;
        __int16 v45 = 2080;
        v46 = "-[VCMediaStreamGroup initWithConfig:]";
        __int16 v47 = 1024;
        int v48 = 91;
        __int16 v49 = 2112;
        v50 = v26;
        __int16 v51 = 2048;
        v52 = v4;
        __int16 v53 = 1024;
        LODWORD(v54) = v38;
        v32 = " [%s] %s:%d %@(%p) Failed to create the state queue for streamToken=%u";
LABEL_67:
        v34 = v37;
        uint32_t v35 = 54;
        goto LABEL_68;
      }
    }
LABEL_69:

    return 0;
  }
  v9 = (tagVCJBTargetEstimatorSynchronizer *)[a3 jbTargetEstimatorSynchronizer];
  v4->_jbTargetEstimatorSynchronizer = v9;
  if (v9) {
    CFRetain(v9);
  }
  if ((VCMediaStreamGroup *)objc_opt_class() == v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        jbTargetEstimatorSynchronizer = v4->_jbTargetEstimatorSynchronizer;
        v14 = FourccToCStr([a3 syncGroupID]);
        *(_DWORD *)buf = 136316162;
        uint64_t v44 = v11;
        __int16 v45 = 2080;
        v46 = "-[VCMediaStreamGroup initWithConfig:]";
        __int16 v47 = 1024;
        int v48 = 95;
        __int16 v49 = 2048;
        v50 = (__CFString *)jbTargetEstimatorSynchronizer;
        __int16 v51 = 2080;
        v52 = v14;
        v15 = " [%s] %s:%d Create Stream Group with TargetEstimatorSynchronizer=%p syncGroupID=%s";
        v16 = v12;
        uint32_t v17 = 48;
LABEL_20:
        _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v10 = (__CFString *)[(VCMediaStreamGroup *)v4 performSelector:sel_logPrefix];
    }
    else {
      v10 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        v20 = v4->_jbTargetEstimatorSynchronizer;
        v21 = FourccToCStr([a3 syncGroupID]);
        *(_DWORD *)buf = 136316674;
        uint64_t v44 = v18;
        __int16 v45 = 2080;
        v46 = "-[VCMediaStreamGroup initWithConfig:]";
        __int16 v47 = 1024;
        int v48 = 95;
        __int16 v49 = 2112;
        v50 = v10;
        __int16 v51 = 2048;
        v52 = v4;
        __int16 v53 = 2048;
        v54 = v20;
        __int16 v55 = 2080;
        v56 = v21;
        v15 = " [%s] %s:%d %@(%p) Create Stream Group with TargetEstimatorSynchronizer=%p syncGroupID=%s";
        v16 = v19;
        uint32_t v17 = 68;
        goto LABEL_20;
      }
    }
  }
  if (![(VCMediaStreamGroup *)v4 setupStreamsWithConfig:a3])
  {
    if ((VCMediaStreamGroup *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v29 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaStreamGroup initWithConfig:].cold.5(v29, a3);
        }
      }
      goto LABEL_69;
    }
    if (objc_opt_respondsToSelector()) {
      v27 = (__CFString *)[(VCMediaStreamGroup *)v4 performSelector:sel_logPrefix];
    }
    else {
      v27 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v39 = VRTraceErrorLogLevelToCSTR();
      v37 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v40 = [a3 streamToken];
        *(_DWORD *)buf = 136316418;
        uint64_t v44 = v39;
        __int16 v45 = 2080;
        v46 = "-[VCMediaStreamGroup initWithConfig:]";
        __int16 v47 = 1024;
        int v48 = 98;
        __int16 v49 = 2112;
        v50 = v27;
        __int16 v51 = 2048;
        v52 = v4;
        __int16 v53 = 1024;
        LODWORD(v54) = v40;
        v32 = " [%s] %s:%d %@(%p) Failed to setup the streams for streamToken=%u";
        goto LABEL_67;
      }
    }
    goto LABEL_69;
  }
  v4->_perfTimers = (TimingCollection *)objc_alloc_init(MEMORY[0x1E4F47A20]);
  double v22 = micro();
  v4->_creationTime = v22;
  VCPerfTimingUtilsSetStartForKeyOnceWithTime(v4->_perfTimers, 20, v22);
  VCPerfTimingUtilsSetStartForKeyOnceWithTime(v4->_perfTimers, 16, v4->_creationTime);
  [(VCMediaStreamGroup *)v4 registerMediaStreamNotificationDelegate];
  v4->_syncGroupID = [a3 syncGroupID];
  v4->_state = 0;
  v4->_streamToken = [a3 streamToken];
  v23 = [a3 delegateQueue];
  v4->_delegateQueue = (OS_dispatch_queue *)v23;
  dispatch_retain(v23);
  v4->_mediaType = [a3 mediaType];
  v4->_mediaSubtype = [a3 mediaSubtype];
  v4->_idsParticipantID = [a3 idsParticipantID];
  v4->_sessionUUID = (NSString *)(id)[a3 sessionUUID];
  objc_storeWeak(&v4->_delegate, (id)[a3 delegate]);
  objc_storeWeak(&v4->_captureController, (id)[a3 captureController]);
  return v4;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [(VCMediaStreamGroup *)self unregisterMediaStreamNotificationDelegate];
  delegateQueue = self->_delegateQueue;
  if (delegateQueue)
  {
    dispatch_release(delegateQueue);
    self->_delegateQueue = 0;
  }
  stateQueue = self->_stateQueue;
  if (stateQueue)
  {
    dispatch_release(stateQueue);
    self->_stateQueue = 0;
  }
  objc_storeWeak(&self->_captureController, 0);
  objc_storeWeak(&self->_delegate, 0);

  jbTargetEstimatorSynchronizer = self->_jbTargetEstimatorSynchronizer;
  if (jbTargetEstimatorSynchronizer)
  {
    CFRelease(jbTargetEstimatorSynchronizer);
    self->_jbTargetEstimatorSynchronizer = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)VCMediaStreamGroup;
  [(VCObject *)&v6 dealloc];
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"%p streamGroupID=%s state=%d participantUUID=%@", self, FourccToCStr(self->_streamGroupID), self->_state, self->_participantUUID];
}

- (BOOL)setupStreamsWithConfig:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];

  self->_mediaStreamInfoArray = (NSArray *)(id)[a3 mediaStreamInfoArray];
  self->_mediaStreams = (NSArray *)(id)[a3 mediaStreams];
  self->_streamIDToMediaStreamMap = (NSDictionary *)(id)[a3 streamIDToMediaStreamMap];
  self->_groupEntries = (NSDictionary *)(id)[a3 groupEntries];
  self->_hasRepairedStreams = [a3 hasRepairedStreams];
  self->_rtpTimestampRate = [a3 rtpTimestampRate];
  mediaStreamInfoArray = self->_mediaStreamInfoArray;
  BOOL v6 = mediaStreamInfoArray && self->_mediaStreams && self->_streamIDToMediaStreamMap && self->_groupEntries != 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [(NSArray *)mediaStreamInfoArray countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(mediaStreamInfoArray);
        }
        objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "stream"), "setDelegate:", self);
      }
      uint64_t v8 = [(NSArray *)mediaStreamInfoArray countByEnumeratingWithState:&v13 objects:v12 count:16];
    }
    while (v8);
  }
  return v6;
}

- (BOOL)configureStreams
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v22 = 0;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obj = self->_mediaStreamInfoArray;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v41 objects:v40 count:16];
  uint64_t v19 = v3;
  if (v3)
  {
    uint64_t v18 = *(void *)v42;
LABEL_3:
    uint64_t v4 = 0;
    while (1)
    {
      if (*(void *)v42 != v18) {
        objc_enumerationMutation(obj);
      }
      v5 = *(void **)(*((void *)&v41 + 1) + 8 * v4);
      BOOL v6 = (void *)[v5 stream];
      objc_msgSend(v6, "setReportingAgent:", -[VCObject reportingAgent](self, "reportingAgent"));
      v21 = v6;
      [v6 setNetworkFeedbackController:self->_networkFeedbackController];
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      v20 = v5;
      uint64_t v7 = (void *)[v5 streamConfigs];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v36 objects:v35 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v37 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            [v12 setJbTargetEstimatorSynchronizer:self->_jbTargetEstimatorSynchronizer];
            objc_msgSend((id)objc_msgSend(v12, "multiwayConfig"), "setStreamGroupID:", self->_streamGroupID);
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v36 objects:v35 count:16];
        }
        while (v9);
      }
      if ((objc_msgSend(v21, "setStreamConfig:withError:", objc_msgSend(v20, "streamConfigs"), &v22) & 1) == 0) {
        break;
      }
      if (++v4 == v19)
      {
        uint64_t v19 = [(NSArray *)obj countByEnumeratingWithState:&v41 objects:v40 count:16];
        if (v19) {
          goto LABEL_3;
        }
        LOBYTE(v3) = 1;
        return v3;
      }
    }
    if ((VCMediaStreamGroup *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        LODWORD(v3) = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v3) {
          return v3;
        }
        -[VCMediaStreamGroup configureStreams]();
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        long long v13 = (__CFString *)[(VCMediaStreamGroup *)self performSelector:sel_logPrefix];
      }
      else {
        long long v13 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        long long v15 = *MEMORY[0x1E4F47A50];
        LODWORD(v3) = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v3) {
          return v3;
        }
        *(_DWORD *)buf = 136316418;
        uint64_t v24 = v14;
        __int16 v25 = 2080;
        v26 = "-[VCMediaStreamGroup configureStreams]";
        __int16 v27 = 1024;
        int v28 = 196;
        __int16 v29 = 2112;
        uint64_t v30 = v13;
        __int16 v31 = 2048;
        v32 = self;
        __int16 v33 = 2112;
        uint64_t v34 = v22;
        _os_log_error_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Error configuring media stream [%@]", buf, 0x3Au);
      }
    }
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)callDelegateWithBlock:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v5 = MEMORY[0x1E4E56580](&self->_delegate, a2);
    if (v5)
    {
      delegateQueue = self->_delegateQueue;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __44__VCMediaStreamGroup_callDelegateWithBlock___block_invoke;
      v13[3] = &unk_1E6DB5000;
      v13[4] = v5;
      v13[5] = a3;
      dispatch_async(delegateQueue, v13);
      return;
    }
    if ((VCMediaStreamGroup *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v8 = (__CFString *)[(VCMediaStreamGroup *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v8 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        return;
      }
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        return;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v15 = v12;
      __int16 v16 = 2080;
      uint64_t v17 = "-[VCMediaStreamGroup callDelegateWithBlock:]";
      __int16 v18 = 1024;
      int v19 = 218;
      __int16 v20 = 2112;
      v21 = v8;
      __int16 v22 = 2048;
      v23 = self;
      uint64_t v11 = " [%s] %s:%d %@(%p) delegate could not be loaded";
LABEL_25:
      _os_log_error_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_ERROR, v11, buf, 0x30u);
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaStreamGroup callDelegateWithBlock:]();
      }
    }
  }
  else if ((VCMediaStreamGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaStreamGroup callDelegateWithBlock:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v7 = (__CFString *)[(VCMediaStreamGroup *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v15 = v9;
        __int16 v16 = 2080;
        uint64_t v17 = "-[VCMediaStreamGroup callDelegateWithBlock:]";
        __int16 v18 = 1024;
        int v19 = 208;
        __int16 v20 = 2112;
        v21 = v7;
        __int16 v22 = 2048;
        v23 = self;
        uint64_t v11 = " [%s] %s:%d %@(%p) block is nil";
        goto LABEL_25;
      }
    }
  }
}

void __44__VCMediaStreamGroup_callDelegateWithBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(const void **)(a1 + 32);

  CFRelease(v2);
}

- (BOOL)containsStreamWithIDSStreamID:(unsigned __int16)a3
{
  int v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  mediaStreamInfoArray = self->_mediaStreamInfoArray;
  uint64_t v5 = [(NSArray *)mediaStreamInfoArray countByEnumeratingWithState:&v22 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(mediaStreamInfoArray);
        }
        uint64_t v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        uint64_t v10 = (void *)[v9 streamConfigs];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v16 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v18;
          while (2)
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v18 != v13) {
                objc_enumerationMutation(v10);
              }
              if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * j), "multiwayConfig"), "idsStreamID") == v3)
              {
                LOBYTE(v5) = 1;
                return v5;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v16 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v6 = [(NSArray *)mediaStreamInfoArray countByEnumeratingWithState:&v22 objects:v21 count:16];
      LOBYTE(v5) = 0;
    }
    while (v6);
  }
  return v5;
}

- (void)setParticipantJoinedToFirstMKITimer
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Could not find mediaKeyIndex=%@. PerfTimer will not be set for participant joined to first MKI");
}

- (void)setFirstMKIToFirstMediaReceivedTimerForMKIReceivedTime
{
  [(TimingCollection *)self->_perfTimers setStartTime:17 forKey:self->_firstMediaKeyIndexTime];
  perfTimers = self->_perfTimers;
  double firstMediaPacketTime = self->_firstMediaPacketTime;

  [(TimingCollection *)perfTimers setStopTime:17 forKey:firstMediaPacketTime];
}

- (void)setTotalMediaStallSaveIntervalWithTime:(double)a3
{
  double firstMediaKeyIndexTime = self->_firstMediaKeyIndexTime;
  if (self->_firstMediaFrameGapDetected || firstMediaKeyIndexTime <= self->_firstMediaPacketTime) {
    a3 = self->_firstMediaKeyIndexTime;
  }
  [(TimingCollection *)self->_perfTimers setStartTime:18 forKey:firstMediaKeyIndexTime];
  perfTimers = self->_perfTimers;

  [(TimingCollection *)perfTimers setStopTime:18 forKey:a3];
}

- (void)setupPerfTimersWithMediaKeyIndex:(id)a3 perfTimerIndexToStart:(int)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  double v7 = micro();
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__VCMediaStreamGroup_setupPerfTimersWithMediaKeyIndex_perfTimerIndexToStart___block_invoke;
  block[3] = &unk_1E6DB7288;
  *(double *)&block[6] = v7;
  block[4] = self;
  block[5] = a3;
  int v10 = a4;
  dispatch_async(stateQueue, block);
}

uint64_t __77__VCMediaStreamGroup_setupPerfTimersWithMediaKeyIndex_perfTimerIndexToStart___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 280))
  {
    *(void *)(v2 + 256) = *(void *)(a1 + 48);
    *(void *)(*(void *)(a1 + 32) + 280) = [*(id *)(a1 + 40) copy];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  [*(id *)(v2 + 240) setStartTime:*(unsigned int *)(a1 + 56) forKey:*(double *)(a1 + 48)];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 240) setStopTime:21 forKey:*(double *)(a1 + 48)];
  uint64_t v4 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v4 + 424))
  {
    uint64_t result = [*(id *)(v4 + 240) setStartTime:22 forKey:*(double *)(a1 + 48)];
    *(unsigned char *)(*(void *)(a1 + 32) + 424) = 1;
  }
  return result;
}

- (void)finalizePerfTimersForFirstMediaFrameWithTime:(double)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  [(VCMediaStreamGroup *)self setParticipantJoinedToFirstMKITimer];
  [(VCMediaStreamGroup *)self setFirstMKIToFirstMediaReceivedTimerForMKIReceivedTime];
  [(VCMediaStreamGroup *)self setTotalMediaStallSaveIntervalWithTime:a3];
  perfTimers = self->_perfTimers;

  [(TimingCollection *)perfTimers setStopTime:22 forKey:a3];
}

- (void)setFirstMediaFrameReceivedTime:(double)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__VCMediaStreamGroup_setFirstMediaFrameReceivedTime___block_invoke;
  block[3] = &unk_1E6DB4568;
  block[4] = self;
  *(double *)&block[5] = a3;
  dispatch_async(stateQueue, block);
}

double __53__VCMediaStreamGroup_setFirstMediaFrameReceivedTime___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 416) = result;
  return result;
}

- (double)firstMediaFrameReceivedTime
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  double v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = -1;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__VCMediaStreamGroup_firstMediaFrameReceivedTime__block_invoke;
  block[3] = &unk_1E6DB4540;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(stateQueue, block);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __49__VCMediaStreamGroup_firstMediaFrameReceivedTime__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 416);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setEnabledAtStart:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__VCMediaStreamGroup_setEnabledAtStart___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_async(stateQueue, block);
}

uint64_t __40__VCMediaStreamGroup_setEnabledAtStart___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 408) = *(unsigned char *)(result + 40);
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 408)) {
    return [*(id *)(v1 + 240) removeTimingForKey:20];
  }
  return result;
}

- (BOOL)isEnabledAtStart
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__VCMediaStreamGroup_isEnabledAtStart__block_invoke;
  block[3] = &unk_1E6DB4540;
  block[4] = self;
  void block[5] = &v6;
  dispatch_sync(stateQueue, block);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__VCMediaStreamGroup_isEnabledAtStart__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 408);
  return result;
}

- (void)setCaptureController:(id)a3
{
}

- (VCMediaCaptureController)captureController
{
  double result = (VCMediaCaptureController *)objc_loadWeak(&self->_captureController);
  if (!result) {
    return (VCMediaCaptureController *)self;
  }
  return result;
}

- (tagVCSecurityKeyHolder)securityKeyHolder
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  char v3 = objc_msgSend((id)objc_msgSend(-[NSArray firstObject](self->_mediaStreamInfoArray, "firstObject"), "streamConfigs"), "firstObject");

  return (tagVCSecurityKeyHolder *)[v3 securityKeyHolder];
}

- (id)startMediaStreams
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  unsigned int state = self->_state;
  uint64_t v4 = (VCMediaStreamGroup *)objc_opt_class();
  if (state)
  {
    if (v4 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        return 0;
      }
      uint64_t v24 = VRTraceErrorLogLevelToCSTR();
      long long v25 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return 0;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v37 = v24;
      __int16 v38 = 2080;
      long long v39 = "-[VCMediaStreamGroup startMediaStreams]";
      __int16 v40 = 1024;
      int v41 = 352;
      uint64_t v26 = " [%s] %s:%d Starting stream group that isn't stopped";
      __int16 v27 = v25;
      uint32_t v28 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        long long v23 = (__CFString *)[(VCMediaStreamGroup *)self performSelector:sel_logPrefix];
      }
      else {
        long long v23 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        return 0;
      }
      uint64_t v29 = VRTraceErrorLogLevelToCSTR();
      uint64_t v30 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return 0;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v37 = v29;
      __int16 v38 = 2080;
      long long v39 = "-[VCMediaStreamGroup startMediaStreams]";
      __int16 v40 = 1024;
      int v41 = 352;
      __int16 v42 = 2112;
      long long v43 = v23;
      __int16 v44 = 2048;
      uint64_t v45 = self;
      uint64_t v26 = " [%s] %s:%d %@(%p) Starting stream group that isn't stopped";
      __int16 v27 = v30;
      uint32_t v28 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
    return 0;
  }
  if (v4 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_13;
    }
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    double v7 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    groupEntries = self->_groupEntries;
    *(_DWORD *)buf = 136315906;
    uint64_t v37 = v6;
    __int16 v38 = 2080;
    long long v39 = "-[VCMediaStreamGroup startMediaStreams]";
    __int16 v40 = 1024;
    int v41 = 353;
    __int16 v42 = 2112;
    long long v43 = groupEntries;
    char v9 = " [%s] %s:%d Starting group. groupEntries=%@";
    uint64_t v10 = v7;
    uint32_t v11 = 38;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      BOOL v5 = (__CFString *)[(VCMediaStreamGroup *)self performSelector:sel_logPrefix];
    }
    else {
      BOOL v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_13;
    }
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    uint64_t v13 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    uint64_t v14 = self->_groupEntries;
    *(_DWORD *)buf = 136316418;
    uint64_t v37 = v12;
    __int16 v38 = 2080;
    long long v39 = "-[VCMediaStreamGroup startMediaStreams]";
    __int16 v40 = 1024;
    int v41 = 353;
    __int16 v42 = 2112;
    long long v43 = v5;
    __int16 v44 = 2048;
    uint64_t v45 = self;
    __int16 v46 = 2112;
    __int16 v47 = v14;
    char v9 = " [%s] %s:%d %@(%p) Starting group. groupEntries=%@";
    uint64_t v10 = v13;
    uint32_t v11 = 58;
  }
  _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
LABEL_13:
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v15 = [(NSDictionary *)self->_groupEntries allValues];
  uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v32 objects:v31 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v33 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = [*(id *)(*((void *)&v32 + 1) + 8 * i) start];
        if (v20)
        {
          v21 = (void *)v20;
          self->_unsigned int state = 1;
          [(VCMediaStreamGroup *)self stopMediaStreams];
          return v21;
        }
      }
      uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v32 objects:v31 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }
  v21 = 0;
  self->_unsigned int state = 1;
  return v21;
}

- (id)stopMediaStreams
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  unsigned int state = self->_state;
  uint64_t v4 = (VCMediaStreamGroup *)objc_opt_class();
  if (!state)
  {
    if (v4 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        return 0;
      }
      uint64_t v25 = VRTraceErrorLogLevelToCSTR();
      uint64_t v26 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return 0;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v38 = v25;
      __int16 v39 = 2080;
      __int16 v40 = "-[VCMediaStreamGroup stopMediaStreams]";
      __int16 v41 = 1024;
      int v42 = 370;
      __int16 v27 = " [%s] %s:%d Stopping stream group that is already stopped";
      uint32_t v28 = v26;
      uint32_t v29 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v24 = (__CFString *)[(VCMediaStreamGroup *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v24 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        return 0;
      }
      uint64_t v30 = VRTraceErrorLogLevelToCSTR();
      __int16 v31 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return 0;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v38 = v30;
      __int16 v39 = 2080;
      __int16 v40 = "-[VCMediaStreamGroup stopMediaStreams]";
      __int16 v41 = 1024;
      int v42 = 370;
      __int16 v43 = 2112;
      __int16 v44 = v24;
      __int16 v45 = 2048;
      __int16 v46 = self;
      __int16 v27 = " [%s] %s:%d %@(%p) Stopping stream group that is already stopped";
      uint32_t v28 = v31;
      uint32_t v29 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v28, OS_LOG_TYPE_DEFAULT, v27, buf, v29);
    return 0;
  }
  if (v4 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_13;
    }
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    double v7 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    groupEntries = self->_groupEntries;
    *(_DWORD *)buf = 136315906;
    uint64_t v38 = v6;
    __int16 v39 = 2080;
    __int16 v40 = "-[VCMediaStreamGroup stopMediaStreams]";
    __int16 v41 = 1024;
    int v42 = 371;
    __int16 v43 = 2112;
    __int16 v44 = groupEntries;
    char v9 = " [%s] %s:%d Stopping group. groupEntries=%@";
    uint64_t v10 = v7;
    uint32_t v11 = 38;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      BOOL v5 = (__CFString *)[(VCMediaStreamGroup *)self performSelector:sel_logPrefix];
    }
    else {
      BOOL v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_13;
    }
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    uint64_t v13 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    uint64_t v14 = self->_groupEntries;
    *(_DWORD *)buf = 136316418;
    uint64_t v38 = v12;
    __int16 v39 = 2080;
    __int16 v40 = "-[VCMediaStreamGroup stopMediaStreams]";
    __int16 v41 = 1024;
    int v42 = 371;
    __int16 v43 = 2112;
    __int16 v44 = v5;
    __int16 v45 = 2048;
    __int16 v46 = self;
    __int16 v47 = 2112;
    uint64_t v48 = v14;
    char v9 = " [%s] %s:%d %@(%p) Stopping group. groupEntries=%@";
    uint64_t v10 = v13;
    uint32_t v11 = 58;
  }
  _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
LABEL_13:
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v15 = [(NSDictionary *)self->_groupEntries allValues];
  uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v33 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = 0;
    uint64_t v19 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v34 != v19) {
          objc_enumerationMutation(v15);
        }
        v21 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if ([v21 state])
        {
          uint64_t v22 = [v21 stop];
          if (v22) {
            uint64_t v18 = (void *)v22;
          }
        }
      }
      uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v33 objects:v32 count:16];
    }
    while (v17);
  }
  else
  {
    uint64_t v18 = 0;
  }
  self->_unsigned int state = 0;
  return v18;
}

- (BOOL)shouldSetPause:(BOOL)a3 onStream:(id)a4
{
  BOOL v4 = a3;
  int v5 = [a4 state];
  if (v4) {
    int v6 = 4;
  }
  else {
    int v6 = 2;
  }
  return v5 != v6;
}

- (id)setPauseOnMediaStreams:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  int v5 = [(NSDictionary *)self->_groupEntries allValues];
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([(VCMediaStreamGroup *)self shouldSetPause:v3 onStream:v10])
        {
          uint64_t v11 = [v10 setPause:v3];
          if (v11)
          {
            uint64_t v12 = (void *)v11;
            [(VCMediaStreamGroup *)self stopCapture];
            [(VCMediaStreamGroup *)self stopMediaStreams];
            return v12;
          }
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v14 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  return 0;
}

- (id)pauseMediaStreams
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  unsigned int state = self->_state;
  BOOL v4 = (VCMediaStreamGroup *)objc_opt_class();
  if (state == 1)
  {
    if (v4 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_19;
      }
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      groupEntries = self->_groupEntries;
      *(_DWORD *)buf = 136315906;
      uint64_t v23 = v7;
      __int16 v24 = 2080;
      uint64_t v25 = "-[VCMediaStreamGroup pauseMediaStreams]";
      __int16 v26 = 1024;
      int v27 = 418;
      __int16 v28 = 2112;
      uint32_t v29 = groupEntries;
      uint64_t v10 = " [%s] %s:%d Pausing group. groupEntries=%@";
      uint64_t v11 = v8;
      uint32_t v12 = 38;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v5 = (__CFString *)[(VCMediaStreamGroup *)self performSelector:sel_logPrefix];
      }
      else {
        int v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_19;
      }
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      uint64_t v14 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      long long v15 = self->_groupEntries;
      *(_DWORD *)buf = 136316418;
      uint64_t v23 = v13;
      __int16 v24 = 2080;
      uint64_t v25 = "-[VCMediaStreamGroup pauseMediaStreams]";
      __int16 v26 = 1024;
      int v27 = 418;
      __int16 v28 = 2112;
      uint32_t v29 = v5;
      __int16 v30 = 2048;
      __int16 v31 = self;
      __int16 v32 = 2112;
      long long v33 = v15;
      uint64_t v10 = " [%s] %s:%d %@(%p) Pausing group. groupEntries=%@";
      uint64_t v11 = v14;
      uint32_t v12 = 58;
    }
    _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
LABEL_19:
    id result = [(VCMediaStreamGroup *)self setPauseOnMediaStreams:1];
    if (!result) {
      self->_unsigned int state = 2;
    }
    return result;
  }
  if (v4 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaStreamGroup pauseMediaStreams]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v6 = (__CFString *)[(VCMediaStreamGroup *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      long long v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        v21 = self->_groupEntries;
        *(_DWORD *)buf = 136316418;
        uint64_t v23 = v17;
        __int16 v24 = 2080;
        uint64_t v25 = "-[VCMediaStreamGroup pauseMediaStreams]";
        __int16 v26 = 1024;
        int v27 = 412;
        __int16 v28 = 2112;
        uint32_t v29 = v6;
        __int16 v30 = 2048;
        __int16 v31 = self;
        __int16 v32 = 2112;
        long long v33 = v21;
        _os_log_error_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Pausing stream group that isn't running=%@", buf, 0x3Au);
      }
    }
  }
  if (self->_state == 2) {
    return 0;
  }
  uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid state=%d", self->_state);
  uint64_t v20 = [NSString stringWithFormat:@"%@. Failed to pause streamToken=%u", -[VCObject logPrefix](self, "logPrefix"), self->_streamToken];
  return (id)[MEMORY[0x1E4F28C58] AVConferenceServiceError:32026, self->_state, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStreamGroup.m", 416), v20, v19 detailedCode filePath description reason];
}

- (id)resumeMediaStreams
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  unsigned int state = self->_state;
  BOOL v4 = (VCMediaStreamGroup *)objc_opt_class();
  if (state == 2)
  {
    if (v4 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_19;
      }
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      groupEntries = self->_groupEntries;
      *(_DWORD *)buf = 136315906;
      uint64_t v23 = v7;
      __int16 v24 = 2080;
      uint64_t v25 = "-[VCMediaStreamGroup resumeMediaStreams]";
      __int16 v26 = 1024;
      int v27 = 438;
      __int16 v28 = 2112;
      uint32_t v29 = groupEntries;
      uint64_t v10 = " [%s] %s:%d Resuming group. groupEntries=%@";
      uint64_t v11 = v8;
      uint32_t v12 = 38;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v5 = (__CFString *)[(VCMediaStreamGroup *)self performSelector:sel_logPrefix];
      }
      else {
        int v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_19;
      }
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      uint64_t v14 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      long long v15 = self->_groupEntries;
      *(_DWORD *)buf = 136316418;
      uint64_t v23 = v13;
      __int16 v24 = 2080;
      uint64_t v25 = "-[VCMediaStreamGroup resumeMediaStreams]";
      __int16 v26 = 1024;
      int v27 = 438;
      __int16 v28 = 2112;
      uint32_t v29 = v5;
      __int16 v30 = 2048;
      __int16 v31 = self;
      __int16 v32 = 2112;
      long long v33 = v15;
      uint64_t v10 = " [%s] %s:%d %@(%p) Resuming group. groupEntries=%@";
      uint64_t v11 = v14;
      uint32_t v12 = 58;
    }
    _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
LABEL_19:
    id result = [(VCMediaStreamGroup *)self setPauseOnMediaStreams:0];
    if (!result) {
      self->_unsigned int state = 1;
    }
    return result;
  }
  if (v4 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaStreamGroup resumeMediaStreams]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v6 = (__CFString *)[(VCMediaStreamGroup *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      long long v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        v21 = self->_groupEntries;
        *(_DWORD *)buf = 136316418;
        uint64_t v23 = v17;
        __int16 v24 = 2080;
        uint64_t v25 = "-[VCMediaStreamGroup resumeMediaStreams]";
        __int16 v26 = 1024;
        int v27 = 432;
        __int16 v28 = 2112;
        uint32_t v29 = v6;
        __int16 v30 = 2048;
        __int16 v31 = self;
        __int16 v32 = 2112;
        long long v33 = v21;
        _os_log_error_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Resuming stream group that isn't paused=%@", buf, 0x3Au);
      }
    }
  }
  if (self->_state == 1) {
    return 0;
  }
  uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid state=%d", self->_state);
  uint64_t v20 = [NSString stringWithFormat:@"%@. Failed to resume streamToken=%u", -[VCObject logPrefix](self, "logPrefix"), self->_streamToken];
  return (id)[MEMORY[0x1E4F28C58] AVConferenceServiceError:32026, self->_state, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStreamGroup.m", 436), v20, v19 detailedCode filePath description reason];
}

- (void)perfTimerStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  double v3 = micro();
  self->_ignoreMKINotifications = 0;
  if ([(TimingCollection *)self->_perfTimers hasKey:20]) {
    [(TimingCollection *)self->_perfTimers setStopTime:20 forKey:v3];
  }
  perfTimers = self->_perfTimers;

  [(TimingCollection *)perfTimers setStartTime:21 forKey:v3];
}

- (id)start
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 0;
  uint32_t v12 = &v11;
  uint64_t v13 = 0x3052000000;
  uint64_t v14 = __Block_byref_object_copy__34;
  long long v15 = __Block_byref_object_dispose__34;
  uint64_t v16 = 0;
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ StreamGroup-Start");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    BOOL v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = [(VCObject *)self logPrefix];
      int64_t streamToken = self->_streamToken;
      *(_DWORD *)buf = 136316418;
      uint64_t v18 = v3;
      __int16 v19 = 2080;
      uint64_t v20 = "-[VCMediaStreamGroup start]";
      __int16 v21 = 1024;
      int v22 = 463;
      __int16 v23 = 2048;
      __int16 v24 = self;
      __int16 v25 = 2112;
      __int16 v26 = v5;
      __int16 v27 = 1024;
      int v28 = streamToken;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ StreamGroup-Start (%p) %@ streamToken=%u", buf, 0x36u);
    }
  }
  stateQueue = self->_stateQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __27__VCMediaStreamGroup_start__block_invoke;
  v10[3] = &unk_1E6DB3EB8;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(stateQueue, v10);
  uint64_t v8 = (void *)v12[5];
  _Block_object_dispose(&v11, 8);
  return v8;
}

uint64_t __27__VCMediaStreamGroup_start__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned int **)(a1 + 32);
  uint64_t v3 = v2[79];
  if (v3)
  {
    uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid state=%d", v3);
    uint64_t v5 = [NSString stringWithFormat:@"%@. Failed already running streamToken=%u", objc_msgSend(*(id *)(a1 + 32), "logPrefix"), *(void *)(*(void *)(a1 + 32) + 352)];
    uint64_t result = [MEMORY[0x1E4F28C58] AVConferenceServiceError:32026, *(unsigned int *)(*(void *)(a1 + 32) + 316), objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStreamGroup.m", 469), v5, v4 detailedCode filePath description reason];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
    return result;
  }
  uint64_t result = [v2 willStart];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    [*(id *)(a1 + 32) perfTimerStarted];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) startMediaStreams];
    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
LABEL_11:
      uint64_t v8 = *(void **)(a1 + 32);
      return [v8 didStop];
    }
    uint64_t v7 = *(unsigned char **)(a1 + 32);
    if (!v7[288])
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [v7 startCapture];
      if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
      {
LABEL_10:
        [*(id *)(a1 + 32) stopMediaStreams];
        goto LABEL_11;
      }
      uint64_t v7 = *(unsigned char **)(a1 + 32);
    }
    uint64_t result = [v7 didStart];
    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
      return result;
    }
    goto LABEL_10;
  }
  return result;
}

- (id)stop
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 0;
  uint32_t v12 = &v11;
  uint64_t v13 = 0x3052000000;
  uint64_t v14 = __Block_byref_object_copy__34;
  long long v15 = __Block_byref_object_dispose__34;
  uint64_t v16 = 0;
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ StreamGroup-Stop");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [(VCObject *)self logPrefix];
      int64_t streamToken = self->_streamToken;
      *(_DWORD *)buf = 136316418;
      uint64_t v18 = v3;
      __int16 v19 = 2080;
      uint64_t v20 = "-[VCMediaStreamGroup stop]";
      __int16 v21 = 1024;
      int v22 = 504;
      __int16 v23 = 2048;
      __int16 v24 = self;
      __int16 v25 = 2112;
      __int16 v26 = v5;
      __int16 v27 = 1024;
      int v28 = streamToken;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ StreamGroup-Stop (%p) %@ streamToken=%u", buf, 0x36u);
    }
  }
  stateQueue = self->_stateQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __26__VCMediaStreamGroup_stop__block_invoke;
  v10[3] = &unk_1E6DB3EB8;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(stateQueue, v10);
  uint64_t v8 = (void *)v12[5];
  _Block_object_dispose(&v11, 8);
  return v8;
}

uint64_t __26__VCMediaStreamGroup_stop__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(_DWORD **)(a1 + 32);
  if (v2[79])
  {
    [v2 willStop];
    uint64_t v3 = [*(id *)(a1 + 32) stopCapture];
    uint64_t v4 = [*(id *)(a1 + 32) stopMediaStreams];
    if (v3) {
      uint64_t v5 = v3;
    }
    else {
      uint64_t v5 = v4;
    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v5;
    uint64_t v6 = *(void **)(a1 + 32);
    return [v6 didStop];
  }
  else
  {
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid state=%d", 0);
    uint64_t v9 = [NSString stringWithFormat:@"%@. Failed already stopped streamToken=%u", objc_msgSend(*(id *)(a1 + 32), "logPrefix"), *(void *)(*(void *)(a1 + 32) + 352)];
    uint64_t result = [MEMORY[0x1E4F28C58] AVConferenceServiceError:32026, *(unsigned int *)(*(void *)(a1 + 32) + 316), objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStreamGroup.m", 511), v9, v8 detailedCode filePath description reason];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

- (id)pause
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 0;
  uint32_t v12 = &v11;
  uint64_t v13 = 0x3052000000;
  uint64_t v14 = __Block_byref_object_copy__34;
  long long v15 = __Block_byref_object_dispose__34;
  uint64_t v16 = 0;
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ StreamGroup-Pause");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [(VCObject *)self logPrefix];
      int64_t streamToken = self->_streamToken;
      *(_DWORD *)buf = 136316418;
      uint64_t v18 = v3;
      __int16 v19 = 2080;
      uint64_t v20 = "-[VCMediaStreamGroup pause]";
      __int16 v21 = 1024;
      int v22 = 525;
      __int16 v23 = 2048;
      __int16 v24 = self;
      __int16 v25 = 2112;
      __int16 v26 = v5;
      __int16 v27 = 1024;
      int v28 = streamToken;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ StreamGroup-Pause (%p) %@ streamToken=%u", buf, 0x36u);
    }
  }
  stateQueue = self->_stateQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __27__VCMediaStreamGroup_pause__block_invoke;
  v10[3] = &unk_1E6DB4540;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(stateQueue, v10);
  uint64_t v8 = (void *)v12[5];
  _Block_object_dispose(&v11, 8);
  return v8;
}

uint64_t __27__VCMediaStreamGroup_pause__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) pauseMediaStreams];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 didPause:1];
  }
  return result;
}

- (id)resume
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 0;
  uint32_t v12 = &v11;
  uint64_t v13 = 0x3052000000;
  uint64_t v14 = __Block_byref_object_copy__34;
  long long v15 = __Block_byref_object_dispose__34;
  uint64_t v16 = 0;
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ StreamGroup-Resume");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [(VCObject *)self logPrefix];
      int64_t streamToken = self->_streamToken;
      *(_DWORD *)buf = 136316418;
      uint64_t v18 = v3;
      __int16 v19 = 2080;
      uint64_t v20 = "-[VCMediaStreamGroup resume]";
      __int16 v21 = 1024;
      int v22 = 538;
      __int16 v23 = 2048;
      __int16 v24 = self;
      __int16 v25 = 2112;
      __int16 v26 = v5;
      __int16 v27 = 1024;
      int v28 = streamToken;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ StreamGroup-Resume (%p) %@ streamToken=%u", buf, 0x36u);
    }
  }
  stateQueue = self->_stateQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __28__VCMediaStreamGroup_resume__block_invoke;
  v10[3] = &unk_1E6DB4540;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(stateQueue, v10);
  uint64_t v8 = (void *)v12[5];
  _Block_object_dispose(&v11, 8);
  return v8;
}

uint64_t __28__VCMediaStreamGroup_resume__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) resumeMediaStreams];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 didPause:0];
  }
  return result;
}

- (void)handleActiveConnectionChange:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [(NSDictionary *)self->_groupEntries allValues];
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v8++) handleActiveConnectionChange:a3];
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v9 count:16];
    }
    while (v6);
  }
}

- (BOOL)containsStreamWithSSRC:(unsigned int)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  mediaStreamInfoArray = self->_mediaStreamInfoArray;
  uint64_t v5 = [(NSArray *)mediaStreamInfoArray countByEnumeratingWithState:&v23 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(mediaStreamInfoArray);
        }
        uint64_t v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v10 = (void *)[v9 streamConfigs];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v17 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v19;
          while (2)
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v19 != v13) {
                objc_enumerationMutation(v10);
              }
              long long v15 = *(void **)(*((void *)&v18 + 1) + 8 * j);
              if (objc_msgSend((id)objc_msgSend(v15, "multiwayConfig"), "ssrc") == a3
                && !objc_msgSend((id)objc_msgSend(v15, "multiwayConfig"), "isOneToOne"))
              {
                LOBYTE(v5) = 1;
                return v5;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v17 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v6 = [(NSArray *)mediaStreamInfoArray countByEnumeratingWithState:&v23 objects:v22 count:16];
      LOBYTE(v5) = 0;
    }
    while (v6);
  }
  return v5;
}

- (BOOL)addSyncDestination:(id)a3
{
  return 1;
}

- (BOOL)removeSyncDestination:(id)a3
{
  return 1;
}

- (void)reportParticipantsPerfTimings
{
  v10[3] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (self->_haveReportedPerfTimers)
  {
    [(TimingCollection *)self->_perfTimers removeTimingForKey:5];
    [(TimingCollection *)self->_perfTimers removeTimingForKey:6];
    [(TimingCollection *)self->_perfTimers removeTimingForKey:17];
    [(TimingCollection *)self->_perfTimers removeTimingForKey:18];
    [(TimingCollection *)self->_perfTimers removeTimingForKey:19];
  }
  else
  {
    self->_haveReportedPerfTimers = 1;
  }
  [(VCMediaStreamGroup *)self streamGroupID];
  v9[0] = @"VCMSStreamGroup";
  v10[0] = [NSNumber numberWithUnsignedInt:reportingStreamGroupFromStreamGroupID()];
  v9[1] = @"VCSPIDSID";
  uint64_t v3 = [NSNumber numberWithUnsignedLongLong:self->_idsParticipantID];
  v9[2] = @"VCSPUUID";
  participantUUID = (__CFString *)self->_participantUUID;
  if (!participantUUID) {
    participantUUID = @"Unknown";
  }
  v10[1] = v3;
  v10[2] = participantUUID;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];
  perfTimers = self->_perfTimers;
  uint64_t v7 = [(VCObject *)self reportingAgent];
  VCPerfTimingUtilsReport(perfTimers, (uint64_t)v7, 0, v5, v8);
}

- (id)startCapture
{
  return 0;
}

- (id)stopCapture
{
  return 0;
}

- (BOOL)handleEncryptionInfoChange:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  mediaStreams = self->_mediaStreams;
  uint64_t v6 = [(NSArray *)mediaStreams countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(mediaStreams);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) handleEncryptionInfoChange:a3];
      }
      uint64_t v7 = [(NSArray *)mediaStreams countByEnumeratingWithState:&v12 objects:v11 count:16];
    }
    while (v7);
  }
  self->_encryptionInfoReceived = 1;
  return 1;
}

- (void)resetDecryptionTimeout
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  mediaStreams = self->_mediaStreams;
  uint64_t v3 = [(NSArray *)mediaStreams countByEnumeratingWithState:&v8 objects:v7 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(mediaStreams);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * i) resetDecryptionTimeout];
      }
      uint64_t v4 = [(NSArray *)mediaStreams countByEnumeratingWithState:&v8 objects:v7 count:16];
    }
    while (v4);
  }
}

- (void)registerMediaStreamNotificationDelegate
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  mediaStreams = self->_mediaStreams;
  uint64_t v4 = [(NSArray *)mediaStreams countByEnumeratingWithState:&v9 objects:v8 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(mediaStreams);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) setNotificationDelegate:self];
      }
      uint64_t v5 = [(NSArray *)mediaStreams countByEnumeratingWithState:&v9 objects:v8 count:16];
    }
    while (v5);
  }
}

- (void)unregisterMediaStreamNotificationDelegate
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  mediaStreams = self->_mediaStreams;
  uint64_t v3 = [(NSArray *)mediaStreams countByEnumeratingWithState:&v8 objects:v7 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(mediaStreams);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * i) setNotificationDelegate:0];
      }
      uint64_t v4 = [(NSArray *)mediaStreams countByEnumeratingWithState:&v8 objects:v7 count:16];
    }
    while (v4);
  }
}

- (void)mediaStream:(id)a3 didReceiveNewMediaKeyIndex:(id)a4
{
  v5[7] = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__VCMediaStreamGroup_mediaStream_didReceiveNewMediaKeyIndex___block_invoke;
  v5[3] = &unk_1E6DB43D8;
  v5[4] = self;
  v5[5] = a4;
  v5[6] = a3;
  dispatch_async(stateQueue, v5);
}

void __61__VCMediaStreamGroup_mediaStream_didReceiveNewMediaKeyIndex___block_invoke(uint64_t a1)
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if ((VCSecurityKeyHolder_CopyKeyMaterialForKeyIndex([*(id *)(a1 + 32) securityKeyHolder], *(const char **)(a1 + 40), (uint64_t *)v3) & 0x80000000) == 0)
  {
    uint64_t v2 = [v3[0] firstObject];
    if (v2)
    {
      [*(id *)(a1 + 48) handleEncryptionInfoChange:v2];
      [*(id *)(a1 + 48) resetDecryptionTimeout];
    }
  }
}

- (void)mediaStream:(id)a3 didReceiveRTPGapForMediaKeyIndex:(id)a4
{
  void block[6] = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__VCMediaStreamGroup_mediaStream_didReceiveRTPGapForMediaKeyIndex___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a3;
  dispatch_async(stateQueue, block);
}

void __67__VCMediaStreamGroup_mediaStream_didReceiveRTPGapForMediaKeyIndex___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 272) = 1;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v5 = 136315906;
      uint64_t v6 = v2;
      __int16 v7 = 2080;
      long long v8 = "-[VCMediaStreamGroup mediaStream:didReceiveRTPGapForMediaKeyIndex:]_block_invoke";
      __int16 v9 = 1024;
      int v10 = 666;
      __int16 v11 = 2048;
      uint64_t v12 = v4;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d RTP sequence number gap detected for stream=%p", (uint8_t *)&v5, 0x26u);
    }
  }
}

- (void)mediaStream:(id)a3 didReceiveFlushRequestWithPayloads:(id)a4
{
  v6[6] = *MEMORY[0x1E4F143B8];
  if (objc_opt_respondsToSelector())
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __69__VCMediaStreamGroup_mediaStream_didReceiveFlushRequestWithPayloads___block_invoke;
    v6[3] = &unk_1E6DB9410;
    v6[4] = self;
    v6[5] = a4;
    [(VCMediaStreamGroup *)self callDelegateWithBlock:v6];
  }
}

uint64_t __69__VCMediaStreamGroup_mediaStream_didReceiveFlushRequestWithPayloads___block_invoke(uint64_t a1, void *a2)
{
  return [a2 streamGroup:*(void *)(a1 + 32) didReceiveFlushRequestWithPayloads:*(void *)(a1 + 40)];
}

- (unsigned)streamGroupID
{
  return self->_streamGroupID;
}

- (unsigned)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(unsigned int)a3
{
  self->_mediaType = a3;
}

- (unsigned)mediaSubtype
{
  return self->_mediaSubtype;
}

- (void)setMediaSubtype:(unsigned int)a3
{
  self->_mediaSubtype = a3;
}

- (unsigned)syncGroupID
{
  return self->_syncGroupID;
}

- (void)setSyncGroupID:(unsigned int)a3
{
  self->_syncGroupID = a3;
}

- (unsigned)state
{
  return self->_state;
}

- (int64_t)streamToken
{
  return self->_streamToken;
}

- (NSDictionary)streamIDToMediaStreamMap
{
  return self->_streamIDToMediaStreamMap;
}

- (NSArray)mediaStreamInfoArray
{
  return self->_mediaStreamInfoArray;
}

- (BOOL)encryptionInfoReceived
{
  return self->_encryptionInfoReceived;
}

- (void)setEncryptionInfoReceived:(BOOL)a3
{
  self->_encryptionInfoReceived = a3;
}

- (BOOL)hasRepairedStreams
{
  return self->_hasRepairedStreams;
}

- (AVCStatisticsCollector)statisticsCollector
{
  return self->_statisticsCollector;
}

- (void)setStatisticsCollector:(id)a3
{
}

- (VCMediaRecorder)mediaRecorder
{
  return self->_mediaRecorder;
}

- (void)setMediaRecorder:(id)a3
{
}

- (double)externalRenderLatency
{
  return self->_externalRenderLatency;
}

- (void)setExternalRenderLatency:(double)a3
{
  self->_externalRenderLatency = a3;
}

- (TimingCollection)perfTimers
{
  return self->_perfTimers;
}

- (id)willStart
{
  return 0;
}

- (void)didStart
{
}

- (void)didStop
{
}

- (void)didPause:(BOOL)a3
{
}

- (void)initWithConfig:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Configuration is nil", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Delegate is nil", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Delegate queue is nil", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:(uint64_t)a1 .cold.4(uint64_t a1, void *a2)
{
  [a2 streamToken];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8_5(&dword_1E1EA4000, v2, v3, " [%s] %s:%d Failed to create the state queue for streamToken=%u", v4, v5, v6, v7, v8);
}

- (void)initWithConfig:(uint64_t)a1 .cold.5(uint64_t a1, void *a2)
{
  [a2 streamToken];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8_5(&dword_1E1EA4000, v2, v3, " [%s] %s:%d Failed to setup the streams for streamToken=%u", v4, v5, v6, v7, v8);
}

- (void)configureStreams
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Error configuring media stream [%@]");
}

- (void)callDelegateWithBlock:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d block is nil", v2, v3, v4, v5, v6);
}

- (void)callDelegateWithBlock:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d delegate could not be loaded", v2, v3, v4, v5, v6);
}

- (void)pauseMediaStreams
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Pausing stream group that isn't running=%@");
}

- (void)resumeMediaStreams
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Resuming stream group that isn't paused=%@");
}

@end