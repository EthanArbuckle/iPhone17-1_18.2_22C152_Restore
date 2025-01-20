@interface VCRedundancyControlAlgorithmVideo
- ($C2BB56CA84CB3474CB2B6B99F63D2246)setupFeedbackAnalyzerConfig;
- ($CB0759397B546F099C641D8C4C77BDE7)getFecLevelPerFrameSizeVector;
- (BOOL)isRedundancyStrategyResetPending;
- (VCRedundancyControlAlgorithmVideo)initWithRedundancyControllerMode:(unsigned int)a3 maxAllowedRedundancyPercentage:(unsigned int)a4 mediaControlInfoFECFeedbackVersion:(unsigned __int8)a5;
- (double)redundancyInterval;
- (unsigned)computeRedundancyWithBurstyLoss;
- (unsigned)computeRedundancyWithLossPercentage;
- (unsigned)redundancyPercentage;
- (void)checkForRedundancyFreeze:(tagVCStatisticsMessage *)a3;
- (void)dealloc;
- (void)processNWConnectionStatistics:(tagVCStatisticsMessage *)a3;
- (void)processRCNetworkStatistics:(tagVCStatisticsMessage *)a3;
- (void)processRTCPPSFBStatistics:(tagVCStatisticsMessage *)a3;
- (void)reset;
- (void)setIsRedundancyStrategyResetPending:(BOOL)a3;
- (void)setupFeedbackAnalyzerConfig;
- (void)stateFrozen:(tagVCStatisticsMessage *)a3;
- (void)stateRunning:(tagVCStatisticsMessage *)a3;
- (void)updateBurstyLoss:(unsigned int)a3;
- (void)updateRedundancyStrategyWithNetworkStatistics:(tagVCStatisticsMessage *)a3;
@end

@implementation VCRedundancyControlAlgorithmVideo

- (VCRedundancyControlAlgorithmVideo)initWithRedundancyControllerMode:(unsigned int)a3 maxAllowedRedundancyPercentage:(unsigned int)a4 mediaControlInfoFECFeedbackVersion:(unsigned __int8)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)VCRedundancyControlAlgorithmVideo;
  v8 = [(VCRedundancyControlAlgorithmVideo *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_redundancyMode = a3;
    v8->_redundancyPercentage = 0;
    v8->_maxAllowedRedundancyPercentage = a4;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        *(void *)&buf[4] = v10;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCRedundancyControlAlgorithmVideo initWithRedundancyControllerMode:maxAllowedRedundancyP"
                              "ercentage:mediaControlInfoFECFeedbackVersion:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 62;
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = a4;
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting maxAllowedRedundancyPercentage = %d", buf, 0x22u);
      }
    }
    v9->_mediaControlInfoFECFeedbackVersion = a5;
    *(_OWORD *)buf = xmmword_1E259C0D0;
    *(_OWORD *)&buf[16] = unk_1E259C0E0;
    *(void *)&buf[32] = -1;
    [(VCRedundancyControlAlgorithmVideo *)v9 setupFeedbackAnalyzerConfig];
    v9->_isRedundancyStrategyResetPending = 0;
    VCFECFeedbackAnalyzer_Create(*MEMORY[0x1E4F1CF80], (uint64_t *)&v9->_feedbackAnalyzer, (long long *)buf);
    *(void *)&v9->_freezeReason = 0xFFFFFFFFLL;
  }
  return v9;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  feedbackAnalyzer = self->_feedbackAnalyzer;
  if (feedbackAnalyzer)
  {
    CFRelease(feedbackAnalyzer);
    self->_feedbackAnalyzer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VCRedundancyControlAlgorithmVideo;
  [(VCRedundancyControlAlgorithmVideo *)&v4 dealloc];
}

- ($C2BB56CA84CB3474CB2B6B99F63D2246)setupFeedbackAnalyzerConfig
{
  retstr->var4 = 0.0;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-fec-feedback-analyzer-level-match-percentile", 0, &unk_1F3DC8A60, 1), "doubleValue");
  retstr->var0 = v4;
  objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-fec-feedback-analyzer-buffer-max-length", 0, &unk_1F3DC8A90, 1), "doubleValue");
  double v6 = v5;
  retstr->var1 = v5;
  objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-fec-feedback-analyzer-report-min-period", 0, &unk_1F3DC8AA0, 1), "doubleValue");
  if (v7 <= 0.0)
  {
    double v8 = 0.02;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCRedundancyControlAlgorithmVideo setupFeedbackAnalyzerConfig](v9);
      }
    }
  }
  else
  {
    double v8 = v7;
  }
  retstr->var2 = (int)(v6 / v8);
  objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-fec-feedback-analyzer-vplr-window-size", 0, &unk_1F3DC8AB0, 1), "doubleValue");
  retstr->var3 = v10;
  result = ($C2BB56CA84CB3474CB2B6B99F63D2246 *)objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-fec-feedback-analyzer-interpolation-threshold", 0, &unk_1F3DC8A70, 1), "doubleValue");
  retstr->var4 = v12;
  return result;
}

- (void)stateRunning:(tagVCStatisticsMessage *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a3->var0.feedback.videoReceivedPackets)
  {
    self->_int freezeReason = 0;
  }
  else
  {
    if (self->_offChannelTimeRatio <= 0.4)
    {
      if ((atomic_exchange((atomic_uchar *volatile)&self->_isRedundancyStrategyResetPending, 0) & 1) == 0)
      {
        if (self->_freezeReason == -1) {
          return;
        }
        goto LABEL_10;
      }
      int v5 = 2;
    }
    else
    {
      int v5 = 1;
    }
    self->_int freezeReason = v5;
  }
LABEL_10:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    double v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int freezeReason = self->_freezeReason;
      unsigned int videoReceivedPackets = a3->var0.feedback.videoReceivedPackets;
      double offChannelTimeRatio = self->_offChannelTimeRatio;
      unsigned __int8 v11 = atomic_load((unsigned __int8 *)&self->_isRedundancyStrategyResetPending);
      int v12 = 136316674;
      uint64_t v13 = v6;
      __int16 v14 = 2080;
      uint64_t v15 = "-[VCRedundancyControlAlgorithmVideo stateRunning:]";
      __int16 v16 = 1024;
      int v17 = 102;
      __int16 v18 = 1024;
      int v19 = freezeReason;
      __int16 v20 = 1024;
      unsigned int v21 = videoReceivedPackets;
      __int16 v22 = 2048;
      double v23 = offChannelTimeRatio;
      __int16 v24 = 1024;
      int v25 = v11 & 1;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Redundancy frozen reason=%d isNetworkCongested=%d _offChannelTimeRatio=%2.3f bluetoohResetFlag=%d", (uint8_t *)&v12, 0x38u);
    }
  }
  self->_state = 1;
}

- (void)stateFrozen:(tagVCStatisticsMessage *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int freezeReason = self->_freezeReason;
  if (freezeReason)
  {
    if (freezeReason != 2 && (freezeReason != 1 || self->_offChannelTimeRatio >= 0.25)) {
      return;
    }
  }
  else if (a3->var0.feedback.videoReceivedPackets)
  {
    return;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    double v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = self->_freezeReason;
      unsigned int videoReceivedPackets = a3->var0.feedback.videoReceivedPackets;
      double offChannelTimeRatio = self->_offChannelTimeRatio;
      int v11 = 136316418;
      uint64_t v12 = v6;
      __int16 v13 = 2080;
      __int16 v14 = "-[VCRedundancyControlAlgorithmVideo stateFrozen:]";
      __int16 v15 = 1024;
      int v16 = 124;
      __int16 v17 = 1024;
      int v18 = v8;
      __int16 v19 = 1024;
      unsigned int v20 = videoReceivedPackets;
      __int16 v21 = 2048;
      double v22 = offChannelTimeRatio;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Redundancy unfrozen reason=%d isNetworkCongested=%d _offChannelTimeRatio=%2.3f", (uint8_t *)&v11, 0x32u);
    }
  }
  *(void *)&self->_int freezeReason = 0xFFFFFFFFLL;
  [(VCRedundancyControlAlgorithmVideo *)self reset];
}

- (void)checkForRedundancyFreeze:(tagVCStatisticsMessage *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  int state = self->_state;
  if (state == 1)
  {
    long long v10 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 152);
    long long v26 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 136);
    long long v27 = v10;
    uint64_t v28 = *((void *)&a3->var0.localRCEvent + 21);
    long long v11 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 88);
    long long v22 = *(_OWORD *)(&a3->var0.localRCEvent + 3);
    long long v23 = v11;
    long long v12 = *(_OWORD *)(&a3->var0.localRCEvent + 5);
    long long v24 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 104);
    long long v25 = v12;
    long long v13 = *(_OWORD *)(&a3->var0.localRCEvent + 1);
    long long v18 = *(_OWORD *)&a3->var0.rtcpRR.lastSequenceNumber;
    long long v19 = v13;
    long long v14 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 56);
    long long v20 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 40);
    long long v21 = v14;
    long long v15 = *(_OWORD *)&a3->isVCRCInternal;
    long long v16 = *(_OWORD *)&a3->type;
    long long v17 = v15;
    [(VCRedundancyControlAlgorithmVideo *)self stateFrozen:&v16];
  }
  else if (!state)
  {
    long long v4 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 152);
    long long v26 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 136);
    long long v27 = v4;
    uint64_t v28 = *((void *)&a3->var0.localRCEvent + 21);
    long long v5 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 88);
    long long v22 = *(_OWORD *)(&a3->var0.localRCEvent + 3);
    long long v23 = v5;
    long long v6 = *(_OWORD *)(&a3->var0.localRCEvent + 5);
    long long v24 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 104);
    long long v25 = v6;
    long long v7 = *(_OWORD *)(&a3->var0.localRCEvent + 1);
    long long v18 = *(_OWORD *)&a3->var0.rtcpRR.lastSequenceNumber;
    long long v19 = v7;
    long long v8 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 56);
    long long v20 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 40);
    long long v21 = v8;
    long long v9 = *(_OWORD *)&a3->isVCRCInternal;
    long long v16 = *(_OWORD *)&a3->type;
    long long v17 = v9;
    [(VCRedundancyControlAlgorithmVideo *)self stateRunning:&v16];
  }
}

- (void)reset
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    long long v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      long long v8 = "-[VCRedundancyControlAlgorithmVideo reset]";
      __int16 v9 = 1024;
      int v10 = 145;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Redundancy reset", (uint8_t *)&v5, 0x1Cu);
    }
  }
  self->_plrEnvelope = 0.0;
  *(void *)&self->_burstyLossArraySize = 0;
  VCFECFeedbackAnalyzer_CleanHistory((uint64_t)self->_feedbackAnalyzer);
}

- (void)updateRedundancyStrategyWithNetworkStatistics:(tagVCStatisticsMessage *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  int type = a3->type;
  if (a3->type == 13)
  {
    long long v10 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 152);
    long long v32 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 136);
    long long v33 = v10;
    uint64_t v34 = *((void *)&a3->var0.localRCEvent + 21);
    long long v11 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 88);
    long long v28 = *(_OWORD *)(&a3->var0.localRCEvent + 3);
    long long v29 = v11;
    long long v12 = *(_OWORD *)(&a3->var0.localRCEvent + 5);
    long long v30 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 104);
    long long v31 = v12;
    long long v13 = *(_OWORD *)(&a3->var0.localRCEvent + 1);
    long long v24 = *(_OWORD *)&a3->var0.rtcpRR.lastSequenceNumber;
    long long v25 = v13;
    long long v14 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 56);
    long long v26 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 40);
    long long v27 = v14;
    long long v15 = *(_OWORD *)&a3->isVCRCInternal;
    long long v22 = *(_OWORD *)&a3->type;
    long long v23 = v15;
    [(VCRedundancyControlAlgorithmVideo *)self processRTCPPSFBStatistics:&v22];
  }
  else if (type == 11)
  {
    long long v16 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 152);
    long long v32 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 136);
    long long v33 = v16;
    uint64_t v34 = *((void *)&a3->var0.localRCEvent + 21);
    long long v17 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 88);
    long long v28 = *(_OWORD *)(&a3->var0.localRCEvent + 3);
    long long v29 = v17;
    long long v18 = *(_OWORD *)(&a3->var0.localRCEvent + 5);
    long long v30 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 104);
    long long v31 = v18;
    long long v19 = *(_OWORD *)(&a3->var0.localRCEvent + 1);
    long long v24 = *(_OWORD *)&a3->var0.rtcpRR.lastSequenceNumber;
    long long v25 = v19;
    long long v20 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 56);
    long long v26 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 40);
    long long v27 = v20;
    long long v21 = *(_OWORD *)&a3->isVCRCInternal;
    long long v22 = *(_OWORD *)&a3->type;
    long long v23 = v21;
    [(VCRedundancyControlAlgorithmVideo *)self processNWConnectionStatistics:&v22];
  }
  else if (type == 3)
  {
    long long v4 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 152);
    long long v32 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 136);
    long long v33 = v4;
    uint64_t v34 = *((void *)&a3->var0.localRCEvent + 21);
    long long v5 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 88);
    long long v28 = *(_OWORD *)(&a3->var0.localRCEvent + 3);
    long long v29 = v5;
    long long v6 = *(_OWORD *)(&a3->var0.localRCEvent + 5);
    long long v30 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 104);
    long long v31 = v6;
    long long v7 = *(_OWORD *)(&a3->var0.localRCEvent + 1);
    long long v24 = *(_OWORD *)&a3->var0.rtcpRR.lastSequenceNumber;
    long long v25 = v7;
    long long v8 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 56);
    long long v26 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 40);
    long long v27 = v8;
    long long v9 = *(_OWORD *)&a3->isVCRCInternal;
    long long v22 = *(_OWORD *)&a3->type;
    long long v23 = v9;
    [(VCRedundancyControlAlgorithmVideo *)self processRCNetworkStatistics:&v22];
  }
}

- (void)processNWConnectionStatistics:(tagVCStatisticsMessage *)a3
{
  if (a3->type == 11)
  {
    LODWORD(self->_offChannelTimeRatio) = a3->var0.feedback.receiveQueueTarget;
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    long long v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      [(VCRedundancyControlAlgorithmVideo *)v4 processNWConnectionStatistics:v5];
    }
  }
}

- (void)processRTCPPSFBStatistics:(tagVCStatisticsMessage *)a3
{
  VCFECFeedbackAnalyzer_ProcessFeedback((uint64_t)self->_feedbackAnalyzer, *(void *)&a3->arrivalTime, a3->var0.videoLossFeedback.frameSize | ((unint64_t)a3->var0.videoLossFeedback.packetsLost << 16) | 0xAAAAAAAA00000000);
  double VPLR = VCFECFeedbackAnalyzer_GetVPLR((uint64_t)self->_feedbackAnalyzer);
  self->_packetLossPercentage = VPLR;
  self->_packetLossPercentageVideo = VPLR;
}

- (void)processRCNetworkStatistics:(tagVCStatisticsMessage *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (a3->type == 3)
  {
    self->_float packetLossPercentage = a3->var0.network.packetLossPercentage;
    if (self->_mediaControlInfoFECFeedbackVersion == 1) {
      double VPLR = VCFECFeedbackAnalyzer_GetVPLR((uint64_t)self->_feedbackAnalyzer);
    }
    else {
      double VPLR = a3->var0.network.packetLossPercentageVideo;
    }
    self->_float packetLossPercentageVideo = VPLR;
    long long v7 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 152);
    long long v37 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 136);
    long long v38 = v7;
    uint64_t v39 = *((void *)&a3->var0.localRCEvent + 21);
    long long v8 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 88);
    long long v33 = *(_OWORD *)(&a3->var0.localRCEvent + 3);
    long long v34 = v8;
    long long v9 = *(_OWORD *)(&a3->var0.localRCEvent + 5);
    long long v35 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 104);
    long long v36 = v9;
    long long v10 = *(_OWORD *)(&a3->var0.localRCEvent + 1);
    *(_OWORD *)&buf[32] = *(_OWORD *)&a3->var0.rtcpRR.lastSequenceNumber;
    *(_OWORD *)long long v31 = v10;
    long long v11 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 56);
    *(_OWORD *)&v31[16] = *(_OWORD *)((char *)&a3->var0.localRCEvent + 40);
    long long v32 = v11;
    long long v12 = *(_OWORD *)&a3->isVCRCInternal;
    *(_OWORD *)buf = *(_OWORD *)&a3->type;
    *(_OWORD *)&buf[16] = v12;
    [(VCRedundancyControlAlgorithmVideo *)self checkForRedundancyFreeze:buf];
    if (self->_state != 1)
    {
      if (VCMediaControlInfo_IsLossStatsEnabled(self->_mediaControlInfoFECFeedbackVersion))
      {
        uint64_t v29 = 0;
        FECUtil_UnpackFrameLoss(*((unsigned __int16 *)&a3->var0.localRCEvent + 28), (int *)&v29 + 1, (int *)&v29);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          uint64_t v13 = VRTraceErrorLogLevelToCSTR();
          long long v14 = *MEMORY[0x1E4F47A50];
          long long v15 = *MEMORY[0x1E4F47A50];
          if (*MEMORY[0x1E4F47A40])
          {
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              *(void *)&buf[4] = v13;
              *(_WORD *)&buf[12] = 2080;
              *(void *)&buf[14] = "-[VCRedundancyControlAlgorithmVideo processRCNetworkStatistics:]";
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = 208;
              *(_WORD *)&buf[28] = 1024;
              *(_DWORD *)&buf[30] = HIDWORD(v29);
              *(_WORD *)&buf[34] = 1024;
              *(_DWORD *)&buf[36] = v29;
              _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Frame Losss Stats size=%d loss=%d", buf, 0x28u);
            }
          }
          else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136316162;
            *(void *)&buf[4] = v13;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "-[VCRedundancyControlAlgorithmVideo processRCNetworkStatistics:]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 208;
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = HIDWORD(v29);
            *(_WORD *)&buf[34] = 1024;
            *(_DWORD *)&buf[36] = v29;
            _os_log_debug_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Frame Losss Stats size=%d loss=%d", buf, 0x28u);
          }
        }
        VCFECFeedbackAnalyzer_ProcessFeedback((uint64_t)self->_feedbackAnalyzer, *(void *)&a3->arrivalTime, WORD2(v29) | (v29 << 16) | 0xAAAAAAAA00000000);
      }
      [(VCRedundancyControlAlgorithmVideo *)self updateBurstyLoss:a3->var0.baseband.transmittedBytes];
      unsigned int v16 = [(VCRedundancyControlAlgorithmVideo *)self computeRedundancyWithLossPercentage];
      unsigned int v17 = [(VCRedundancyControlAlgorithmVideo *)self computeRedundancyWithBurstyLoss];
      if (v16 <= v17) {
        unsigned int v18 = v17;
      }
      else {
        unsigned int v18 = v16;
      }
      if (self->_mediaControlInfoFECFeedbackVersion) {
        unsigned int v19 = v16;
      }
      else {
        unsigned int v19 = v18;
      }
      if (self->_redundancyPercentage != v19)
      {
        unsigned int v20 = v17;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v21 = VRTraceErrorLogLevelToCSTR();
          long long v22 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            unsigned int redundancyPercentage = self->_redundancyPercentage;
            unsigned int redundancyMode = self->_redundancyMode;
            float plrEnvelope = self->_plrEnvelope;
            float packetLossPercentage = self->_packetLossPercentage;
            float packetLossPercentageVideo = self->_packetLossPercentageVideo;
            int mediaControlInfoFECFeedbackVersion = self->_mediaControlInfoFECFeedbackVersion;
            *(_DWORD *)buf = 136317954;
            *(void *)&buf[4] = v21;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "-[VCRedundancyControlAlgorithmVideo processRCNetworkStatistics:]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 227;
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = redundancyPercentage;
            *(_WORD *)&buf[34] = 1024;
            *(_DWORD *)&buf[36] = v19;
            *(_WORD *)&unsigned char buf[40] = 1024;
            *(_DWORD *)&buf[42] = redundancyMode;
            *(_WORD *)&buf[46] = 1024;
            *(_DWORD *)long long v31 = v16;
            *(_WORD *)&v31[4] = 1024;
            *(_DWORD *)&v31[6] = v20;
            *(_WORD *)&v31[10] = 2048;
            *(double *)&v31[12] = plrEnvelope;
            *(_WORD *)&v31[20] = 2048;
            *(double *)&v31[22] = packetLossPercentage;
            *(_WORD *)&v31[30] = 2048;
            *(double *)&long long v32 = packetLossPercentageVideo;
            WORD4(v32) = 1024;
            *(_DWORD *)((char *)&v32 + 10) = mediaControlInfoFECFeedbackVersion;
            _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Redundancy level changed from %d to %d _redundancyMode=%d redundancyPercentageBasedOnPLR=%d redundancyPercentageBasedOnBurstyLoss=%d _plrEnvelope=%3.3f _packetLossPercentage=%3.3f _packetLossPercentageVideo=%3.3f _mediaControlInfoFECFeedbackVersion=%d", buf, 0x5Eu);
          }
        }
        self->_unsigned int redundancyPercentage = v19;
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCRedundancyControlAlgorithmVideo processRCNetworkStatistics:](v6);
    }
  }
}

- (void)updateBurstyLoss:(unsigned int)a3
{
  self->_burstyLoss[self->_burstyLossArrayIndex] = a3;
  unsigned int burstyLossArraySize = self->_burstyLossArraySize;
  self->_burstyLossArrayIndex = (self->_burstyLossArrayIndex + 1) & 7;
  if (burstyLossArraySize <= 7) {
    self->_unsigned int burstyLossArraySize = burstyLossArraySize + 1;
  }
}

- (unsigned)computeRedundancyWithLossPercentage
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (self->_redundancyMode == 6)
  {
    double packetLossPercentageVideo = self->_packetLossPercentageVideo;
    double plrEnvelope = self->_plrEnvelope;
    double v5 = dbl_1E259C0C0[plrEnvelope < packetLossPercentageVideo];
    double v6 = plrEnvelope * (1.0 - v5) + packetLossPercentageVideo * v5;
    self->_double plrEnvelope = v6;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      long long v8 = *MEMORY[0x1E4F47A50];
      long long v9 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          float packetLossPercentage = self->_packetLossPercentage;
          double v11 = packetLossPercentage;
          float v12 = self->_packetLossPercentageVideo;
          double v13 = v12;
          float v14 = self->_plrEnvelope;
          double v15 = v14;
          float v16 = v6;
          double v17 = v16;
          float VPLR = VCFECFeedbackAnalyzer_GetVPLR((uint64_t)self->_feedbackAnalyzer);
          int v33 = 136316930;
          uint64_t v34 = v7;
          __int16 v35 = 2080;
          long long v36 = "-[VCRedundancyControlAlgorithmVideo computeRedundancyWithLossPercentage]";
          __int16 v37 = 1024;
          int v38 = 275;
          __int16 v39 = 2048;
          double v40 = v11;
          __int16 v41 = 2048;
          double v42 = v13;
          __int16 v43 = 2048;
          double v44 = v15;
          __int16 v45 = 2048;
          double v46 = v17;
          __int16 v47 = 2048;
          double v48 = VPLR;
          _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Redundancy level _packetLossPercentage=%2.2f _packetLossPercentageVideo=%2.2f _plrEnvelope=%2.2f currentPLR=%2.2f GetFECVPLR=%2.2f", (uint8_t *)&v33, 0x4Eu);
        }
      }
      else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        float v24 = self->_packetLossPercentage;
        double v25 = v24;
        float v26 = self->_packetLossPercentageVideo;
        double v27 = v26;
        float v28 = self->_plrEnvelope;
        double v29 = v28;
        float v30 = v6;
        double v31 = v30;
        float v32 = VCFECFeedbackAnalyzer_GetVPLR((uint64_t)self->_feedbackAnalyzer);
        int v33 = 136316930;
        uint64_t v34 = v7;
        __int16 v35 = 2080;
        long long v36 = "-[VCRedundancyControlAlgorithmVideo computeRedundancyWithLossPercentage]";
        __int16 v37 = 1024;
        int v38 = 275;
        __int16 v39 = 2048;
        double v40 = v25;
        __int16 v41 = 2048;
        double v42 = v27;
        __int16 v43 = 2048;
        double v44 = v29;
        __int16 v45 = 2048;
        double v46 = v31;
        __int16 v47 = 2048;
        double v48 = v32;
        _os_log_debug_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Redundancy level _packetLossPercentage=%2.2f _packetLossPercentageVideo=%2.2f _plrEnvelope=%2.2f currentPLR=%2.2f GetFECVPLR=%2.2f", (uint8_t *)&v33, 0x4Eu);
      }
    }
  }
  else
  {
    double v6 = self->_packetLossPercentage;
  }
  if (v6 >= 0.05)
  {
    if (v6 >= 30.0) {
      int v20 = 300;
    }
    else {
      int v20 = 200;
    }
    if (v6 >= 20.0) {
      int v21 = v20;
    }
    else {
      int v21 = 100;
    }
    if (v6 >= 5.0) {
      int v22 = v21;
    }
    else {
      int v22 = 50;
    }
    if (v6 >= 2.0) {
      unsigned int v19 = v22;
    }
    else {
      unsigned int v19 = 25;
    }
  }
  else
  {
    unsigned int v19 = 0;
  }
  if (v19 >= self->_maxAllowedRedundancyPercentage) {
    return self->_maxAllowedRedundancyPercentage;
  }
  else {
    return v19;
  }
}

- (unsigned)computeRedundancyWithBurstyLoss
{
  uint64_t burstyLossArraySize = self->_burstyLossArraySize;
  if (burstyLossArraySize)
  {
    unsigned int v3 = 0;
    burstyLoss = self->_burstyLoss;
    do
    {
      unsigned int v6 = *burstyLoss++;
      unsigned int v5 = v6;
      if (v3 <= v6) {
        unsigned int v3 = v5;
      }
      --burstyLossArraySize;
    }
    while (burstyLossArraySize);
    if (v3 >= 5) {
      unsigned int v7 = 300;
    }
    else {
      unsigned int v7 = dword_1E259C0F8[v3];
    }
  }
  else
  {
    unsigned int v7 = 0;
  }
  if (v7 >= self->_maxAllowedRedundancyPercentage) {
    return self->_maxAllowedRedundancyPercentage;
  }
  else {
    return v7;
  }
}

- ($CB0759397B546F099C641D8C4C77BDE7)getFecLevelPerFrameSizeVector
{
  retstr->var1[31] = 0;
  *(_OWORD *)&retstr->var1[15].var0 = 0u;
  *(_OWORD *)&retstr->var1[23].var0 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var1[7].var0 = 0u;
  return ($CB0759397B546F099C641D8C4C77BDE7 *)VCFECFeedbackAnalyzer_GetFECLevelVector((uint64_t)self->_feedbackAnalyzer, (uint64_t)retstr);
}

- (BOOL)isRedundancyStrategyResetPending
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_isRedundancyStrategyResetPending);
  return v2 & 1;
}

- (void)setIsRedundancyStrategyResetPending:(BOOL)a3
{
}

- (unsigned)redundancyPercentage
{
  return self->_redundancyPercentage;
}

- (double)redundancyInterval
{
  return self->_redundancyInterval;
}

- (void)setupFeedbackAnalyzerConfig
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v3 = 136316162;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_0();
  int v5 = 84;
  __int16 v6 = 2048;
  uint64_t v7 = v1;
  __int16 v8 = 2048;
  uint64_t v9 = 0x3F947AE147AE147BLL;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Unexpected reportMinPeriod storebag value %f, falling back to default %f", (uint8_t *)&v3, 0x30u);
}

- (void)processNWConnectionStatistics:(os_log_t)log .cold.1(uint64_t a1, int *a2, os_log_t log)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v3 = *a2;
  int v4 = 136315906;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  uint64_t v7 = "-[VCRedundancyControlAlgorithmVideo processNWConnectionStatistics:]";
  __int16 v8 = 1024;
  int v9 = 170;
  __int16 v10 = 1024;
  int v11 = v3;
  _os_log_error_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d wrong type of statistics message is processed by VCRedundancyControl type=%d", (uint8_t *)&v4, 0x22u);
}

- (void)processRCNetworkStatistics:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 191;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d wrong type of statistics message is processed by VCRedundancyControl", (uint8_t *)&v2, 0x1Cu);
}

@end