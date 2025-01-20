@interface VCRateControlMediaController
- (AVCStatisticsCollector)statisticsCollector;
- (BOOL)allowVideoStop;
- (BOOL)didMediaGetFlushedWithPayloadType:(unsigned __int8)a3 transactionID:(unsigned __int16)a4 packetDropped:(unsigned __int16)a5 sequenceNumberArray:(unsigned __int16 *)a6;
- (BOOL)disableBasebandFlush;
- (BOOL)enableAggressiveProbingSequence;
- (BOOL)increaseFlushCountForAudioStall:(int)a3 audioStallBitrate:(unsigned int)a4;
- (BOOL)increaseFlushCountForVideoRefresh:(int)a3 transactionID:(unsigned __int16)a4;
- (BOOL)isAudioOnly;
- (BOOL)isInThrottlingMode;
- (BOOL)isProbingLargeFrameRequiredAtTime:(double)a3;
- (BOOL)isRTPFlushBasebandFromVCRateControl;
- (BOOL)isRemoteAudioPaused;
- (BOOL)isSenderProbingEnabled;
- (BOOL)isVideoStoppedByVCRateControl;
- (BOOL)rampUpAudioFraction;
- (VCRateControlMediaController)initWithMediaQueue:(tagHANDLE *)a3 delegate:(id)a4;
- (VCRateControlServerBag)serverBag;
- (double)lastBasebandFlushCountChangeTime;
- (double)lastVideoRefreshFrameTime;
- (int)audioFractionTier;
- (int)basebandFlushCount;
- (int)basebandFlushedAudioCount;
- (int)basebandFlushedVideoCount;
- (tagHANDLE)mediaQueue;
- (tagVCMediaQueue)vcMediaQueue;
- (unsigned)afrcRemoteEstimatedBandwidth;
- (unsigned)probingLargeFrameSize;
- (unsigned)probingSequencePacketCount;
- (unsigned)probingSequencePacketSize;
- (unsigned)targetBitrate;
- (unsigned)videoSendingBitrate;
- (void)dealloc;
- (void)decreaseFlushCount:(int)a3;
- (void)enableBasebandLogDump:(void *)a3;
- (void)pauseVideoByUser:(BOOL)a3;
- (void)printLargeFrameStatsAtTime:(double)a3 timestamp:(unsigned int)a4 timeSinceLastProbingSequence:(double)a5 frameSize:(unsigned int)a6 wastedBytes:(unsigned int)a7 fecRatio:(double)a8 isFrameRequested:(BOOL)a9;
- (void)recordVideoRefreshFrameWithTimestamp:(unsigned int)a3 payloadType:(unsigned __int8)a4 packetCount:(unsigned int)a5 isKeyFrame:(BOOL)a6;
- (void)scheduleProbingSequenceAtTime:(double)a3;
- (void)scheduleProbingSequenceWithFrameSize:(unsigned int)a3 paddingBytes:(unsigned int)a4 timestamp:(unsigned int)a5 fecRatio:(double)a6 isProbingSequenceScheduled:(BOOL *)a7;
- (void)setAfrcRemoteEstimatedBandwidth:(unsigned int)a3;
- (void)setAllowVideoStop:(BOOL)a3;
- (void)setBasebandFlushCount:(int)a3;
- (void)setEnableAggressiveProbingSequence:(BOOL)a3;
- (void)setIsAudioOnly:(BOOL)a3;
- (void)setIsRTPFlushBasebandFromVCRateControl:(BOOL)a3;
- (void)setIsRemoteAudioPaused:(BOOL)a3;
- (void)setIsSenderProbingEnabled:(BOOL)a3;
- (void)setLastBasebandFlushCountChangeTime:(double)a3;
- (void)setMediaQueue:(tagHANDLE *)a3;
- (void)setServerBag:(id)a3;
- (void)setStatisticsCollector:(id)a3;
- (void)setTargetBitrate:(unsigned int)a3;
- (void)setVcMediaQueue:(tagVCMediaQueue *)a3;
- (void)setVideoSendingBitrate:(unsigned int)a3;
- (void)updateLargeFrameSizeWithBandwidth:(unsigned int)a3;
- (void)updateProbingLargeFrameSizeCap;
@end

@implementation VCRateControlMediaController

- (VCRateControlMediaController)initWithMediaQueue:(tagHANDLE *)a3 delegate:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)VCRateControlMediaController;
  v6 = [(VCRateControlMediaController *)&v11 init];
  if (v6)
  {
    v7 = objc_alloc_init(SenderLargeFrameInfo);
    v6->_senderLargeFrameInfo = v7;
    [(SenderLargeFrameInfo *)v7 setIsLargeFrameRequestDisabled:1];
    objc_storeWeak(&v6->_mediaControllerDelegate, a4);
    v6->_hMediaQueue = a3;
    v6->_minProbingSpacingAggressive = 0.099;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v13 = v8;
        __int16 v14 = 2080;
        v15 = "-[VCRateControlMediaController initWithMediaQueue:delegate:]";
        __int16 v16 = 1024;
        int v17 = 198;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d VCRateControlMediaController init", buf, 0x1Cu);
      }
    }
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  objc_storeWeak(&self->_mediaControllerDelegate, 0);

  v3.receiver = self;
  v3.super_class = (Class)VCRateControlMediaController;
  [(VCRateControlMediaController *)&v3 dealloc];
}

- (void)enableBasebandLogDump:(void *)a3
{
  self->_logBasebandDump = a3;
}

- (void)setServerBag:(id)a3
{
  objc_super v3 = (VCRateControlServerBag *)a3;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  serverBag = self->_serverBag;
  if (serverBag != a3)
  {

    objc_super v3 = v3;
    self->_serverBag = v3;
  }
  BOOL v6 = [(VCRateControlServerBag *)v3 containsAllSecondaryKeysWithPrimaryKey:@"probingSequence"];
  if (v6)
  {
    self->_BOOL enableAggressiveProbingSequence = objc_msgSend(-[VCRateControlServerBag valueForSecondaryKeyWithPrimaryKey:secondaryKey:type:](self->_serverBag, "valueForSecondaryKeyWithPrimaryKey:secondaryKey:type:", @"probingSequence", @"aggModeEnabled", 0), "BOOLValue");
    objc_msgSend(-[VCRateControlServerBag valueForSecondaryKeyWithPrimaryKey:secondaryKey:type:](self->_serverBag, "valueForSecondaryKeyWithPrimaryKey:secondaryKey:type:", @"probingSequence", @"minAggProbingSpacing", 1), "doubleValue");
    self->_double minProbingSpacingAggressive = v7;
  }
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v9 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    objc_super v11 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [@"probingSequence" UTF8String];
      BOOL enableAggressiveProbingSequence = self->_enableAggressiveProbingSequence;
      double minProbingSpacingAggressive = self->_minProbingSpacingAggressive;
      int v20 = 136316930;
      uint64_t v21 = v10;
      __int16 v22 = 2080;
      v23 = "-[VCRateControlMediaController setServerBag:]";
      __int16 v24 = 1024;
      int v25 = 333;
      __int16 v26 = 2048;
      v27 = self;
      __int16 v28 = 2080;
      uint64_t v29 = v12;
      __int16 v30 = 1024;
      BOOL v31 = v6;
      __int16 v32 = 1024;
      BOOL v33 = enableAggressiveProbingSequence;
      __int16 v34 = 2048;
      double v35 = minProbingSpacingAggressive;
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d [%p] config for key=%s serverBagContainsGroup=%d _enableAggressiveProbingSequence=%d _minProbingSpacingAggressive=%f", (uint8_t *)&v20, 0x46u);
    }
  }
  BOOL v15 = [(VCRateControlServerBag *)self->_serverBag containsAllSecondaryKeysWithPrimaryKey:@"baseband"];
  if (v15) {
    self->_BOOL disableBasebandFlush = objc_msgSend(-[VCRateControlServerBag valueForSecondaryKeyWithPrimaryKey:secondaryKey:type:](self->_serverBag, "valueForSecondaryKeyWithPrimaryKey:secondaryKey:type:", @"baseband", @"disableBBFlush", 0), "BOOLValue");
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    int v17 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = [@"baseband" UTF8String];
      BOOL disableBasebandFlush = self->_disableBasebandFlush;
      int v20 = 136316674;
      uint64_t v21 = v16;
      __int16 v22 = 2080;
      v23 = "-[VCRateControlMediaController setServerBag:]";
      __int16 v24 = 1024;
      int v25 = 339;
      __int16 v26 = 2048;
      v27 = self;
      __int16 v28 = 2080;
      uint64_t v29 = v18;
      __int16 v30 = 1024;
      BOOL v31 = v15;
      __int16 v32 = 1024;
      BOOL v33 = disableBasebandFlush;
      _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d [%p] config for key=%s serverBagContainsGroup=%d _disableBasebandFlush=%d", (uint8_t *)&v20, 0x3Cu);
    }
  }
}

- (void)setStatisticsCollector:(id)a3
{
  v7[5] = *MEMORY[0x1E4F143B8];

  self->_statisticsCollector = (AVCStatisticsCollector *)a3;
  uint64_t v5 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  statisticsCollector = self->_statisticsCollector;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__VCRateControlMediaController_setStatisticsCollector___block_invoke;
  v7[3] = &unk_1E6DB3FA8;
  v7[4] = v5;
  [(AVCStatisticsCollector *)statisticsCollector registerStatisticsChangeHandlerWithType:10 handler:v7];
}

void __55__VCRateControlMediaController_setStatisticsCollector___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a2 == 10)
  {
    objc_super v3 = (void *)MEMORY[0x1E4E56580]([*(id *)(a1 + 32) weak]);
    if (v3)
    {
      uint64_t v4 = v3;
      switch(*(_DWORD *)(a2 + 24))
      {
        case 0:
          if ([v3 isRTPFlushBasebandFromVCRateControl]) {
            [v4 decreaseFlushCount:1];
          }
          break;
        case 1:
          if ([v3 isRTPFlushBasebandFromVCRateControl]) {
            objc_msgSend(v4, "setBasebandFlushCount:", *(_DWORD *)(a2 + 28) + objc_msgSend(v4, "basebandFlushCount"));
          }
          break;
        case 2:
          if ([v3 isRTPFlushBasebandFromVCRateControl]) {
            [v4 increaseFlushCountForVideoRefresh:1 transactionID:*(unsigned __int16 *)(a2 + 32)];
          }
          break;
        case 3:
          if ([v3 isRTPFlushBasebandFromVCRateControl]) {
            [v4 increaseFlushCountForAudioStall:1 audioStallBitrate:*(unsigned int *)(a2 + 36)];
          }
          break;
        case 4:
          [v3 recordVideoRefreshFrameWithTimestamp:*(unsigned int *)(a2 + 64) payloadType:*(unsigned __int8 *)(a2 + 68) packetCount:*(unsigned int *)(a2 + 72) isKeyFrame:*(unsigned __int8 *)(a2 + 44)];
          break;
        default:
          break;
      }
      CFRelease(v4);
    }
  }
}

- (void)pauseVideoByUser:(BOOL)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!self->_isAudioOnly)
  {
    BOOL v3 = a3;
    if (self->_isVideoPausedByUser && !a3) {
      VCRateControlMediaController_SetAudioFractionTier((uint64_t)self, 0);
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      BOOL v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (v3) {
          double v7 = "pause";
        }
        else {
          double v7 = "resume";
        }
        unsigned int targetBitrate = self->_targetBitrate;
        *(_DWORD *)buf = 136316418;
        uint64_t v18 = v5;
        __int16 v19 = 2080;
        int v20 = "-[VCRateControlMediaController pauseVideoByUser:]";
        __int16 v21 = 1024;
        int v22 = 688;
        __int16 v23 = 2080;
        __int16 v24 = v7;
        __int16 v25 = 1024;
        unsigned int v26 = targetBitrate;
        __int16 v27 = 1024;
        BOOL IsVideoStopped = VCRateControlMediaController_IsVideoStopped(self);
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d Video %s by user [rate:%u, videoStopped:%d]", buf, 0x32u);
      }
    }
    logBasebandDump = self->_logBasebandDump;
    if (logBasebandDump)
    {
      if (v3) {
        uint64_t v10 = "pause";
      }
      else {
        uint64_t v10 = "resume";
      }
      VCRateControlMediaController_IsVideoStopped(self);
      VRLogfilePrintWithTimestamp((uint64_t)logBasebandDump, "Video %s by user, [rate:%u, BBRate:%u, audioFraction:%d, videoStopped:%d]\n", v11, v12, v13, v14, v15, v16, (char)v10);
    }
    self->_isVideoPausedByUser = v3;
  }
}

- (void)setIsRemoteAudioPaused:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_isRemoteAudioPaused && !a3)
  {
    memset(&v6[4], 0, 13);
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    memset(v19, 0, sizeof(v19));
    statisticsCollector = self->_statisticsCollector;
    *(_DWORD *)BOOL v6 = 7;
    __int16 v7 = 1;
    char v8 = 1;
    uint64_t v9 = 0x600000000;
    VCRateControlSetStatistics(statisticsCollector, v6);
  }
  self->_isRemoteAudioPaused = a3;
}

- (void)decreaseFlushCount:(int)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  int basebandFlushCount = self->_basebandFlushCount;
  double v12 = micro();
  int v13 = self->_basebandFlushCount - a3;
  self->_int basebandFlushCount = v13;
  self->_lastBasebandFlushCountChangeTime = v12;
  if (v13 >= 1) {
    self->_lastBasebandHighNBDCDTime = v12;
  }
  logBasebandDump = self->_logBasebandDump;
  if (logBasebandDump)
  {
    VRLogfilePrintWithTimestamp((uint64_t)logBasebandDump, "Decrease basebandFlushCount %d -> %d.\n", v6, v7, v8, v9, v10, v11, basebandFlushCount);
    int v13 = self->_basebandFlushCount;
  }
  if (v13 < 0 && (int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    long long v16 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v17 = self->_basebandFlushCount;
      *(_DWORD *)buf = 136315906;
      uint64_t v19 = v15;
      __int16 v20 = 2080;
      __int16 v21 = "-[VCRateControlMediaController decreaseFlushCount:]";
      __int16 v22 = 1024;
      int v23 = 797;
      __int16 v24 = 1024;
      int v25 = v17;
      _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d Negative flush count: %d. Bad flush count maintainance!", buf, 0x22u);
    }
  }
}

- (BOOL)didMediaGetFlushedWithPayloadType:(unsigned __int8)a3 transactionID:(unsigned __int16)a4 packetDropped:(unsigned __int16)a5 sequenceNumberArray:(unsigned __int16 *)a6
{
  if (!self->_isRTPFlushBasebandFromVCRateControl) {
    return 1;
  }
  int v6 = a5;
  if (self->_videoPayloadType == a3)
  {
    self->_basebandFlushedVideoCount += a5;
    if (a5 && self->_videoFlushTransactionID < a4)
    {
      uint64_t v8 = (void *)MEMORY[0x1E4E56580](&self->_mediaControllerDelegate, a2);
      [v8 mediaController:self mediaSuggestionDidChange:0x10000];
      if (v8) {
        CFRelease(v8);
      }
      return 1;
    }
  }
  else
  {
    self->_basebandFlushedAudioCount += a5;
  }
  if (self->_isAudioStall)
  {
    vcMediaQueue = self->_vcMediaQueue;
    if (vcMediaQueue)
    {
      VCMediaQueue_BasebandFlushAcked((uint64_t)vcMediaQueue, a5, a6, a4);
    }
    else
    {
      hMediaQueue = self->_hMediaQueue;
      if (hMediaQueue != (tagHANDLE *)0xFFFFFFFFLL) {
        MediaQueue_BBFlushAcked((uint64_t)hMediaQueue, a5, (uint64_t)a6, a4);
      }
    }
    if (v6) {
      return 1;
    }
  }
  return 0;
}

- (int)basebandFlushCount
{
  if (self->_isRTPFlushBasebandFromVCRateControl) {
    return self->_basebandFlushCount;
  }
  else {
    return 0;
  }
}

- (void)setTargetBitrate:(unsigned int)a3
{
  self->_unsigned int targetBitrate = a3;
  self->_isInThrottlingMode = a3 >> 5 < 0xC35;
}

- (BOOL)rampUpAudioFraction
{
  if (self->_isAudioOnly) {
    goto LABEL_2;
  }
  BOOL IsVideoStopped = VCRateControlMediaController_IsVideoStopped(self);
  if (!IsVideoStopped) {
    return IsVideoStopped;
  }
  double v4 = micro();
  if (v4 - self->_lastAudioFractionChangeTime <= 2.0)
  {
LABEL_2:
    LOBYTE(IsVideoStopped) = 0;
  }
  else
  {
    int audioFractionTier = self->_audioFractionTier;
    if (audioFractionTier == 1)
    {
      int v6 = 0;
    }
    else
    {
      LOBYTE(IsVideoStopped) = 0;
      if (audioFractionTier != 2) {
        return IsVideoStopped;
      }
      int v6 = 1;
    }
    VCRateControlMediaController_SetAudioFractionTier((uint64_t)self, v6);
    self->_lastAudioFractionChangeTime = v4;
    logBasebandDump = self->_logBasebandDump;
    if (logBasebandDump) {
      VRLogfilePrintWithTimestamp((uint64_t)logBasebandDump, "Change audio fraction tier from %d -> %d.\n", v7, v8, v9, v10, v11, v12, audioFractionTier);
    }
    LOBYTE(IsVideoStopped) = 1;
  }
  return IsVideoStopped;
}

- (unsigned)probingLargeFrameSize
{
  statisticsCollector = self->_statisticsCollector;
  if (statisticsCollector
    && [(AVCStatisticsCollector *)statisticsCollector mode] != 1
    && [(AVCStatisticsCollector *)self->_statisticsCollector mode] != 3
    && [(AVCStatisticsCollector *)self->_statisticsCollector mode] != 7
    || !self->_isSenderProbingEnabled)
  {
    return 0;
  }
  double v4 = micro();
  self->_uint64_t probingLargeFrameSize = 0;
  [(SenderLargeFrameInfo *)self->_senderLargeFrameInfo lastProbingSequenceTimeExpect];
  if (v5 == 0.0)
  {
    [(SenderLargeFrameInfo *)self->_senderLargeFrameInfo setLastProbingSequenceTimeExpect:v4];
    [(SenderLargeFrameInfo *)self->_senderLargeFrameInfo setLastProbingSequenceTimeActual:v4];
    [(SenderLargeFrameInfo *)self->_senderLargeFrameInfo setStartTime:v4];
  }
  BOOL v6 = [(VCRateControlMediaController *)self isProbingLargeFrameRequiredAtTime:v4];
  uint64_t v7 = self->_statisticsCollector;
  if (v7) {
    uint64_t afrcRemoteEstimatedBandwidth = [(AVCStatisticsCollector *)v7 sharedRemoteEstimatedBandwidth];
  }
  else {
    uint64_t afrcRemoteEstimatedBandwidth = self->_afrcRemoteEstimatedBandwidth;
  }
  [(VCRateControlMediaController *)self updateLargeFrameSizeWithBandwidth:afrcRemoteEstimatedBandwidth];
  if (v6)
  {
    uint64_t probingLargeFrameSize = [(SenderLargeFrameInfo *)self->_senderLargeFrameInfo largeFrameSizeAtCurrentBandwidth];
    self->_uint64_t probingLargeFrameSize = probingLargeFrameSize;
  }
  else
  {
    uint64_t probingLargeFrameSize = self->_probingLargeFrameSize;
  }
  [(SenderLargeFrameInfo *)self->_senderLargeFrameInfo setLargeFrameSizeRequested:probingLargeFrameSize];
  return self->_probingLargeFrameSize;
}

- (unsigned)probingSequencePacketCount
{
  if (self->_isSenderProbingEnabled)
  {
    unsigned int result = [(SenderLargeFrameInfo *)self->_senderLargeFrameInfo isLastFrameProbingSequence];
    if (result) {
      unsigned int result = [(SenderLargeFrameInfo *)self->_senderLargeFrameInfo probingSequencePacketCount];
    }
  }
  else
  {
    unsigned int result = 0;
  }
  self->_probingSequencePacketCount = result;
  return result;
}

- (unsigned)probingSequencePacketSize
{
  if (self->_isSenderProbingEnabled)
  {
    unsigned int result = [(SenderLargeFrameInfo *)self->_senderLargeFrameInfo isLastFrameProbingSequence];
    if (result) {
      unsigned int result = [(SenderLargeFrameInfo *)self->_senderLargeFrameInfo probingSequencePacketSize];
    }
  }
  else
  {
    unsigned int result = 0;
  }
  self->_probingSequencePacketSize = result;
  return result;
}

- (void)scheduleProbingSequenceWithFrameSize:(unsigned int)a3 paddingBytes:(unsigned int)a4 timestamp:(unsigned int)a5 fecRatio:(double)a6 isProbingSequenceScheduled:(BOOL *)a7
{
  if (self->_isSenderProbingEnabled)
  {
    uint64_t v9 = *(void *)&a5;
    LODWORD(v10) = a4;
    uint64_t v11 = *(void *)&a3;
    if ([(SenderLargeFrameInfo *)self->_senderLargeFrameInfo largeFrameSizeAtCurrentBandwidth])
    {
      if (v10 >= 9) {
        uint64_t v10 = v10;
      }
      else {
        uint64_t v10 = 0;
      }
      if ([(SenderLargeFrameInfo *)self->_senderLargeFrameInfo largeFrameSizeAtCurrentBandwidth] > ((double)v11 * a6))goto LABEL_7; {
      double v13 = micro();
      }
      [(SenderLargeFrameInfo *)self->_senderLargeFrameInfo lastProbingSequenceTimeActual];
      double v15 = v13 - v14;
      if ([(SenderLargeFrameInfo *)self->_senderLargeFrameInfo largeFrameSizeRequested])
      {
        [(VCRateControlMediaController *)self scheduleProbingSequenceAtTime:v13];
        long long v16 = self;
        double v17 = v13;
        uint64_t v18 = v9;
        double v19 = v15;
        uint64_t v20 = v11;
        uint64_t v21 = v10;
        double v22 = a6;
        uint64_t v23 = 1;
      }
      else
      {
        double minProbingSpacingAggressive = 1.0;
        if (!self->_isInThrottlingMode)
        {
          if (self->_enableAggressiveProbingSequence) {
            double minProbingSpacingAggressive = self->_minProbingSpacingAggressive;
          }
          else {
            double minProbingSpacingAggressive = 0.333;
          }
        }
        if (v15 <= minProbingSpacingAggressive)
        {
LABEL_7:
          [(SenderLargeFrameInfo *)self->_senderLargeFrameInfo setIsLastFrameProbingSequence:0];
          if (!a7) {
            return;
          }
          goto LABEL_8;
        }
        [(VCRateControlMediaController *)self scheduleProbingSequenceAtTime:v13];
        long long v16 = self;
        double v17 = v13;
        uint64_t v18 = v9;
        double v19 = v15;
        uint64_t v20 = v11;
        uint64_t v21 = v10;
        double v22 = a6;
        uint64_t v23 = 0;
      }
      [(VCRateControlMediaController *)v16 printLargeFrameStatsAtTime:v18 timestamp:v20 timeSinceLastProbingSequence:v21 frameSize:v23 wastedBytes:v17 fecRatio:v19 isFrameRequested:v22];
      if (!a7) {
        return;
      }
LABEL_8:
      *a7 = [(SenderLargeFrameInfo *)self->_senderLargeFrameInfo isLastFrameProbingSequence];
    }
  }
}

- (void)recordVideoRefreshFrameWithTimestamp:(unsigned int)a3 payloadType:(unsigned __int8)a4 packetCount:(unsigned int)a5 isKeyFrame:(BOOL)a6
{
  BOOL v6 = a6;
  double v17 = micro();
  self->_lastVideoRefreshFrameTime = v17;
  self->_videoRefreshFrameTimestamp = a3;
  self->_videoRefreshFramePacketCount = a5;
  if (v6)
  {
    self->_lastVideoKeyFrameTime = v17;
    self->_videoPayloadType = a4;
  }
  logBasebandDump = self->_logBasebandDump;
  if (logBasebandDump)
  {
    double v19 = "RefreshFrame";
    if (v6) {
      double v19 = "KeyFrame";
    }
    VRLogfilePrintWithTimestamp((uint64_t)logBasebandDump, "%s frame (%08X) is generated PT (%u), %d packets.\n", v11, v12, v13, v14, v15, v16, (char)v19);
  }
}

- (BOOL)increaseFlushCountForVideoRefresh:(int)a3 transactionID:(unsigned __int16)a4
{
  int basebandFlushCount = self->_basebandFlushCount;
  self->_int basebandFlushCount = basebandFlushCount + a3;
  self->_lastBasebandFlushCountChangeTime = micro();
  self->_videoFlushTransactionID = a4;
  logBasebandDump = self->_logBasebandDump;
  if (logBasebandDump) {
    VRLogfilePrintWithTimestamp((uint64_t)logBasebandDump, "Increase basebandFlushCount %d -> %d due to video refresh [TID:%0X].\n", v7, v8, v9, v10, v11, v12, basebandFlushCount);
  }
  return self->_basebandFlushableQueueDepth != 0;
}

- (BOOL)increaseFlushCountForAudioStall:(int)a3 audioStallBitrate:(unsigned int)a4
{
  if (a4)
  {
    double v13 = micro();
    int basebandFlushCount = self->_basebandFlushCount;
    self->_int basebandFlushCount = basebandFlushCount + a3;
    self->_lastBasebandFlushCountChangeTime = v13;
    self->_lastAudioStallFlushTime = v13;
    logBasebandDump = self->_logBasebandDump;
    if (logBasebandDump) {
      VRLogfilePrintWithTimestamp((uint64_t)logBasebandDump, "Increase basebandFlushCount %d -> %d due to audio stall.\n", v7, v8, v9, v10, v11, v12, basebandFlushCount);
    }
  }
  self->_audioStallBitrate = a4;
  return self->_basebandFlushableQueueDepth != 0;
}

- (void)scheduleProbingSequenceAtTime:(double)a3
{
  senderLargeFrameInfo = self->_senderLargeFrameInfo;
  [(SenderLargeFrameInfo *)senderLargeFrameInfo lastProbingSequenceTimeExpect];
  [(SenderLargeFrameInfo *)senderLargeFrameInfo setLastProbingSequenceTimeExpect:v6 + 0.666];
  [(SenderLargeFrameInfo *)self->_senderLargeFrameInfo setLastProbingSequenceTimeActual:a3];
  [(SenderLargeFrameInfo *)self->_senderLargeFrameInfo lastProbingSequenceTimeExpect];
  uint64_t v7 = self->_senderLargeFrameInfo;
  if (v8 >= a3 + -0.666)
  {
    [(SenderLargeFrameInfo *)v7 lastProbingSequenceTimeExpect];
    if (v9 <= a3 + 0.666) {
      goto LABEL_5;
    }
    uint64_t v7 = self->_senderLargeFrameInfo;
  }
  -[SenderLargeFrameInfo setLastProbingSequenceTimeExpect:](v7, "setLastProbingSequenceTimeExpect:");
LABEL_5:
  [(SenderLargeFrameInfo *)self->_senderLargeFrameInfo setProbingSequenceCount:[(SenderLargeFrameInfo *)self->_senderLargeFrameInfo probingSequenceCount] + 1];
  uint64_t v10 = self->_senderLargeFrameInfo;

  [(SenderLargeFrameInfo *)v10 setIsLastFrameProbingSequence:1];
}

- (void)printLargeFrameStatsAtTime:(double)a3 timestamp:(unsigned int)a4 timeSinceLastProbingSequence:(double)a5 frameSize:(unsigned int)a6 wastedBytes:(unsigned int)a7 fecRatio:(double)a8 isFrameRequested:(BOOL)a9
{
  char v10 = a6;
  [(SenderLargeFrameInfo *)self->_senderLargeFrameInfo startTime];
  [(SenderLargeFrameInfo *)self->_senderLargeFrameInfo probingSequenceCount];
  [(SenderLargeFrameInfo *)self->_senderLargeFrameInfo setTotalLargeFrameWaste:[(SenderLargeFrameInfo *)self->_senderLargeFrameInfo totalLargeFrameWaste] + a7];
  [(SenderLargeFrameInfo *)self->_senderLargeFrameInfo totalLargeFrameWaste];
  statisticsCollector = self->_statisticsCollector;
  if (statisticsCollector) {
    [(AVCStatisticsCollector *)statisticsCollector sharedRemoteEstimatedBandwidth];
  }
  logBWEDump = self->_logBWEDump;
  [(SenderLargeFrameInfo *)self->_senderLargeFrameInfo largeFrameSizeAtCurrentBandwidth];
  VRLogfilePrintWithTimestamp((uint64_t)logBWEDump, "A LARGE FRAME of %d size %s (actual:%d, req:%d), rate:%f, [waste:%d wastBitrate:%d, avgWastBitrate:%d], txRate:%d, remoteBW:%d, throttling:%d, timestamp:%u\n", v14, v15, v16, v17, v18, v19, v10);
}

- (BOOL)isProbingLargeFrameRequiredAtTime:(double)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if ([(SenderLargeFrameInfo *)self->_senderLargeFrameInfo isLargeFrameRequestDisabled])
  {
    [(SenderLargeFrameInfo *)self->_senderLargeFrameInfo startTime];
    double v6 = a3 - v5;
    BOOL v7 = v6 >= 3.0 && !self->_shouldDisableLargeFrameRequestsWhenInitialRampUp;
    if (v7 || v6 >= 10.0) {
      [(SenderLargeFrameInfo *)self->_senderLargeFrameInfo setIsLargeFrameRequestDisabled:0];
    }
  }
  [(VCRateControlMediaController *)self updateProbingLargeFrameSizeCap];
  if ([(SenderLargeFrameInfo *)self->_senderLargeFrameInfo isLargeFrameRequestDisabled]) {
    return 0;
  }
  [(SenderLargeFrameInfo *)self->_senderLargeFrameInfo lastProbingSequenceTimeExpect];
  double v10 = a3 - v9;
  [(SenderLargeFrameInfo *)self->_senderLargeFrameInfo lastProbingSequenceTimeActual];
  double v12 = a3 - v11;
  BOOL v13 = a3 - v11 >= 0.333 && v10 >= 0.666;
  if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
    goto LABEL_23;
  }
  uint64_t v14 = VRTraceErrorLogLevelToCSTR();
  uint64_t v15 = *MEMORY[0x1E4F47A50];
  uint64_t v16 = *MEMORY[0x1E4F47A50];
  if (*MEMORY[0x1E4F47A40])
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      if (v13) {
        uint64_t v17 = "";
      }
      else {
        uint64_t v17 = "not";
      }
      [(SenderLargeFrameInfo *)self->_senderLargeFrameInfo lastProbingSequenceTimeExpect];
      uint64_t v19 = v18;
      [(SenderLargeFrameInfo *)self->_senderLargeFrameInfo lastProbingSequenceTimeActual];
      int v26 = 136317186;
      uint64_t v27 = v14;
      __int16 v28 = 2080;
      uint64_t v29 = "-[VCRateControlMediaController isProbingLargeFrameRequiredAtTime:]";
      __int16 v30 = 1024;
      int v31 = 1232;
      __int16 v32 = 2080;
      BOOL v33 = v17;
      __int16 v34 = 2048;
      double v35 = a3;
      __int16 v36 = 2048;
      uint64_t v37 = v19;
      __int16 v38 = 2048;
      uint64_t v39 = v20;
      __int16 v40 = 2048;
      double v41 = v10;
      __int16 v42 = 2048;
      double v43 = v12;
      _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d A fake large frame is %s required [time:%.2f, expected:%.2f, actual:%.2f, timeDiffExpect:%.2f, timeDiffActual:%.2f]", (uint8_t *)&v26, 0x58u);
      if (!v13) {
        return 0;
      }
      goto LABEL_24;
    }
LABEL_23:
    if (!v13) {
      return 0;
    }
    goto LABEL_24;
  }
  if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    goto LABEL_23;
  }
  if (v13) {
    double v22 = "";
  }
  else {
    double v22 = "not";
  }
  [(SenderLargeFrameInfo *)self->_senderLargeFrameInfo lastProbingSequenceTimeExpect];
  uint64_t v24 = v23;
  [(SenderLargeFrameInfo *)self->_senderLargeFrameInfo lastProbingSequenceTimeActual];
  int v26 = 136317186;
  uint64_t v27 = v14;
  __int16 v28 = 2080;
  uint64_t v29 = "-[VCRateControlMediaController isProbingLargeFrameRequiredAtTime:]";
  __int16 v30 = 1024;
  int v31 = 1232;
  __int16 v32 = 2080;
  BOOL v33 = v22;
  __int16 v34 = 2048;
  double v35 = a3;
  __int16 v36 = 2048;
  uint64_t v37 = v24;
  __int16 v38 = 2048;
  uint64_t v39 = v25;
  __int16 v40 = 2048;
  double v41 = v10;
  __int16 v42 = 2048;
  double v43 = v12;
  _os_log_debug_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEBUG, "VCRC [%s] %s:%d A fake large frame is %s required [time:%.2f, expected:%.2f, actual:%.2f, timeDiffExpect:%.2f, timeDiffActual:%.2f]", (uint8_t *)&v26, 0x58u);
  if (!v13) {
    return 0;
  }
LABEL_24:
  if (self->_isRateLimitedMaxTimeExceeded) {
    return 1;
  }
  if (v12 > 2.0)
  {
    self->_probingLargeFrameSizeCap >>= 1;
    return 1;
  }
  return 0;
}

- (void)updateProbingLargeFrameSizeCap
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCRC [%s] %s:%d Audio sending bitrate used up all available uplink bandwidth, do minimum probing by setting large frame size cap to 0", v2, v3, v4, v5, v6);
}

- (void)updateLargeFrameSizeWithBandwidth:(unsigned int)a3
{
  unsigned int probingLargeFrameSizeCap = a3 / 0x190;
  if (a3 / 0x190 >= self->_probingLargeFrameSizeCap) {
    unsigned int probingLargeFrameSizeCap = self->_probingLargeFrameSizeCap;
  }
  if (probingLargeFrameSizeCap < 0xABE)
  {
    if (probingLargeFrameSizeCap <= 0x112) {
      int v7 = 257;
    }
    else {
      int v7 = probingLargeFrameSizeCap;
    }
    if (probingLargeFrameSizeCap < 0x1F4)
    {
      unsigned int v8 = 1;
    }
    else
    {
      int v7 = (probingLargeFrameSizeCap >> 1) + 1;
      unsigned int v8 = 2;
    }
    BOOL v9 = probingLargeFrameSizeCap >= 0x6D6;
    if (probingLargeFrameSizeCap >= 0x6D6) {
      signed int v6 = (unsigned __int16)probingLargeFrameSizeCap / 3u + 1;
    }
    else {
      signed int v6 = v7;
    }
    if (v9) {
      uint64_t v5 = 3;
    }
    else {
      uint64_t v5 = v8;
    }
  }
  else
  {
    LODWORD(v5) = 2;
    do
      uint64_t v5 = (v5 + 1);
    while (probingLargeFrameSizeCap / v5 > 0x564);
    signed int v6 = probingLargeFrameSizeCap / v5 + 1;
  }
  if (v6 <= 257) {
    uint64_t v10 = 257;
  }
  else {
    uint64_t v10 = v6;
  }
  [(SenderLargeFrameInfo *)self->_senderLargeFrameInfo setProbingSequencePacketCount:v5];
  [(SenderLargeFrameInfo *)self->_senderLargeFrameInfo setProbingSequencePacketSize:v10];
  senderLargeFrameInfo = self->_senderLargeFrameInfo;

  [(SenderLargeFrameInfo *)senderLargeFrameInfo setLargeFrameSizeAtCurrentBandwidth:(v5 * v10)];
}

- (AVCStatisticsCollector)statisticsCollector
{
  return self->_statisticsCollector;
}

- (unsigned)videoSendingBitrate
{
  return self->_videoSendingBitrate;
}

- (void)setVideoSendingBitrate:(unsigned int)a3
{
  self->_videoSendingBitrate = a3;
}

- (unsigned)targetBitrate
{
  return self->_targetBitrate;
}

- (void)setBasebandFlushCount:(int)a3
{
  self->_int basebandFlushCount = a3;
}

- (int)basebandFlushedVideoCount
{
  return self->_basebandFlushedVideoCount;
}

- (int)basebandFlushedAudioCount
{
  return self->_basebandFlushedAudioCount;
}

- (BOOL)isVideoStoppedByVCRateControl
{
  return self->_isVideoStoppedByVCRateControl;
}

- (BOOL)isSenderProbingEnabled
{
  return self->_isSenderProbingEnabled;
}

- (void)setIsSenderProbingEnabled:(BOOL)a3
{
  self->_isSenderProbingEnabled = a3;
}

- (BOOL)isAudioOnly
{
  return self->_isAudioOnly;
}

- (void)setIsAudioOnly:(BOOL)a3
{
  self->_isAudioOnly = a3;
}

- (BOOL)isInThrottlingMode
{
  return self->_isInThrottlingMode;
}

- (BOOL)isRemoteAudioPaused
{
  return self->_isRemoteAudioPaused;
}

- (BOOL)allowVideoStop
{
  return self->_allowVideoStop;
}

- (void)setAllowVideoStop:(BOOL)a3
{
  self->_allowVideoStop = a3;
}

- (unsigned)afrcRemoteEstimatedBandwidth
{
  return self->_afrcRemoteEstimatedBandwidth;
}

- (void)setAfrcRemoteEstimatedBandwidth:(unsigned int)a3
{
  self->_uint64_t afrcRemoteEstimatedBandwidth = a3;
}

- (BOOL)isRTPFlushBasebandFromVCRateControl
{
  return self->_isRTPFlushBasebandFromVCRateControl;
}

- (void)setIsRTPFlushBasebandFromVCRateControl:(BOOL)a3
{
  self->_isRTPFlushBasebandFromVCRateControl = a3;
}

- (int)audioFractionTier
{
  return self->_audioFractionTier;
}

- (double)lastVideoRefreshFrameTime
{
  return self->_lastVideoRefreshFrameTime;
}

- (BOOL)enableAggressiveProbingSequence
{
  return self->_enableAggressiveProbingSequence;
}

- (void)setEnableAggressiveProbingSequence:(BOOL)a3
{
  self->_BOOL enableAggressiveProbingSequence = a3;
}

- (VCRateControlServerBag)serverBag
{
  return self->_serverBag;
}

- (tagHANDLE)mediaQueue
{
  return self->_hMediaQueue;
}

- (void)setMediaQueue:(tagHANDLE *)a3
{
  self->_hMediaQueue = a3;
}

- (tagVCMediaQueue)vcMediaQueue
{
  return self->_vcMediaQueue;
}

- (void)setVcMediaQueue:(tagVCMediaQueue *)a3
{
  self->_vcMediaQueue = a3;
}

- (BOOL)disableBasebandFlush
{
  return self->_disableBasebandFlush;
}

- (double)lastBasebandFlushCountChangeTime
{
  return self->_lastBasebandFlushCountChangeTime;
}

- (void)setLastBasebandFlushCountChangeTime:(double)a3
{
  self->_lastBasebandFlushCountChangeTime = a3;
}

@end