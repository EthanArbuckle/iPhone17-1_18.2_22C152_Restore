@interface VCVideoStreamReceiveGroup
- (BOOL)isRemoteMediaStalled;
- (BOOL)isRemoteVideoEnabled;
- (BOOL)isRemoteVideoPaused;
- (BOOL)isVideoExpected;
- (BOOL)isVisible;
- (BOOL)setSyncSource:(id)a3;
- (VCVideoStreamReceiveGroup)initWithConfig:(id)a3;
- (id)setupRedundancyController;
- (id)willStart;
- (unsigned)lastDisplayedFrameRTPTimestamp;
- (unsigned)videoQuality;
- (unsigned)visibilityIndex;
- (void)checkAndReportRegressedPoorConnectionPercentage;
- (void)checkForAndReportPoorConnectionDespiteVideoReceivedForVideoStream:(id)a3 stallDuration:(double)a4;
- (void)checkForExtendedPoorConnectionWithStallDuration:(double)a3;
- (void)collectAndLogChannelMetrics:(id *)a3;
- (void)dealloc;
- (void)didStop;
- (void)isVideoExpected;
- (void)mediaStream:(id)a3 didReceiveNewMediaKeyIndex:(id)a4;
- (void)redundancyController:(id)a3 redundancyPercentageDidChange:(unsigned int)a4;
- (void)resetDidReceiveFirstFrame;
- (void)resetPerfTimers;
- (void)setActiveStreamIDs:(id)a3;
- (void)setExternalRenderLatency:(double)a3;
- (void)setIsRemoteMediaStalled:(BOOL)a3;
- (void)setIsRemoteMediaStalled:(BOOL)a3 duration:(double)a4;
- (void)setMediaSuspended:(BOOL)a3 forStreamToken:(id)a4;
- (void)setOptedInStreamID:(id)a3;
- (void)setRemoteVideoEnabled:(BOOL)a3;
- (void)setRemoteVideoPaused:(BOOL)a3;
- (void)setShouldEnableFaceZoom:(BOOL)a3;
- (void)setShouldEnableMLEnhance:(BOOL)a3 streamID:(unsigned __int16)a4;
- (void)setVideoDegraded:(BOOL)a3 duration:(double)a4;
- (void)setVideoQuality:(unsigned __int8)a3;
- (void)setVideoStreamDelegate:(id)a3 delegateFunctions:(const tagVCVideoStreamDelegateRealtimeInstanceVTable *)a4;
- (void)setVisibilityIndex:(unsigned int)a3;
- (void)setupExternalRenderLatency;
- (void)setupRedundancyController;
- (void)setupVideoPriority;
- (void)updateShouldEnableFaceZoom;
- (void)updateVideoExpected;
- (void)updateVideoPriority:(unsigned __int8)a3;
- (void)vcMediaStream:(id)a3 didReceiveFirstFrameWithTime:(id *)a4;
- (void)vcMediaStream:(id)a3 didSwitchFromStreamID:(unsigned __int16)a4 toStreamID:(unsigned __int16)a5;
- (void)vcMediaStream:(id)a3 priorityDidChange:(unsigned __int8)a4;
- (void)vcMediaStream:(id)a3 remoteMediaStalled:(BOOL)a4 duration:(double)a5;
- (void)vcMediaStream:(id)a3 requestKeyFrameGenerationWithStreamID:(unsigned __int16)a4 firType:(int)a5;
@end

@implementation VCVideoStreamReceiveGroup

- (VCVideoStreamReceiveGroup)initWithConfig:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)VCVideoStreamReceiveGroup;
  v3 = [(VCMediaStreamReceiveGroup *)&v13 initWithConfig:a3];
  if (v3)
  {
    if (![+[VCDefaults sharedInstance] forceFECRepairStream])
    {
LABEL_16:
      v3->_shouldConvertSourceRTPTimestamp = 1;
      [(VCVideoStreamReceiveGroup *)v3 setIsRemoteMediaStalled:v3->_isVideoDegraded];
      [(VCVideoStreamReceiveGroup *)v3 setupVideoPriority];
      [(VCVideoStreamReceiveGroup *)v3 setupExternalRenderLatency];
      v3->_poorConnectionPercentageABCReportingThreshold = objc_msgSend(+[GKSConnectivitySettings readStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "readStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-reporting-poor-connection-percentage-symptom-threshold", 0, &unk_1F3DC5A90, 0), "intValue");
      return v3;
    }
    if ((VCVideoStreamReceiveGroup *)objc_opt_class() == v3)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_15;
      }
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v15 = v5;
      __int16 v16 = 2080;
      v17 = "-[VCVideoStreamReceiveGroup initWithConfig:]";
      __int16 v18 = 1024;
      int v19 = 85;
      v7 = " [%s] %s:%d _isRedundancyRequested set to YES by forceFECRepairStream";
      v8 = v6;
      uint32_t v9 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v4 = (__CFString *)[(VCVideoStreamReceiveGroup *)v3 performSelector:sel_logPrefix];
      }
      else {
        v4 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_15;
      }
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v15 = v10;
      __int16 v16 = 2080;
      v17 = "-[VCVideoStreamReceiveGroup initWithConfig:]";
      __int16 v18 = 1024;
      int v19 = 85;
      __int16 v20 = 2112;
      v21 = v4;
      __int16 v22 = 2048;
      v23 = v3;
      v7 = " [%s] %s:%d %@(%p) _isRedundancyRequested set to YES by forceFECRepairStream";
      v8 = v11;
      uint32_t v9 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
LABEL_15:
    v3->_isRedundancyRequested = 1;
    goto LABEL_16;
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ((VCVideoStreamReceiveGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v13 = v4;
        __int16 v14 = 2080;
        uint64_t v15 = "-[VCVideoStreamReceiveGroup dealloc]";
        __int16 v16 = 1024;
        int v17 = 105;
        v6 = " [%s] %s:%d ";
        v7 = v5;
        uint32_t v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v3 = (__CFString *)[(VCVideoStreamReceiveGroup *)self performSelector:sel_logPrefix];
    }
    else {
      v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v13 = v9;
        __int16 v14 = 2080;
        uint64_t v15 = "-[VCVideoStreamReceiveGroup dealloc]";
        __int16 v16 = 1024;
        int v17 = 105;
        __int16 v18 = 2112;
        int v19 = v3;
        __int16 v20 = 2048;
        v21 = self;
        v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }

  v11.receiver = self;
  v11.super_class = (Class)VCVideoStreamReceiveGroup;
  [(VCMediaStreamReceiveGroup *)&v11 dealloc];
}

- (void)setupExternalRenderLatency
{
  [(VCMediaStreamGroup *)self streamGroupID];
  CFStringRef v3 = (const __CFString *)[NSString stringWithFormat:@"%@_%s", @"forceExternalRenderLatency", FourccToCStr(-[VCMediaStreamGroup streamGroupID](self, "streamGroupID"))];
  double DoubleValueForKey = VCDefaults_GetDoubleValueForKey(@"forceExternalRenderLatency", 0.0);
  double v5 = VCDefaults_GetDoubleValueForKey(v3, DoubleValueForKey);

  [(VCVideoStreamReceiveGroup *)self setExternalRenderLatency:v5];
}

- (void)setExternalRenderLatency:(double)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  [(VCMediaStreamGroup *)self externalRenderLatency];
  if (v5 != a3)
  {
    v18.receiver = self;
    v18.super_class = (Class)VCVideoStreamReceiveGroup;
    [(VCMediaStreamGroup *)&v18 setExternalRenderLatency:a3];
    id v6 = [(NSArray *)self->super.super._mediaStreams firstObject];
    if ((VCVideoStreamReceiveGroup *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_13;
      }
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      [(VCMediaStreamGroup *)self externalRenderLatency];
      *(_DWORD *)buf = 136315906;
      uint64_t v20 = v8;
      __int16 v21 = 2080;
      uint64_t v22 = "-[VCVideoStreamReceiveGroup setExternalRenderLatency:]";
      __int16 v23 = 1024;
      int v24 = 137;
      __int16 v25 = 2048;
      v26 = v10;
      objc_super v11 = " [%s] %s:%d Display external output latency=%f";
      v12 = v9;
      uint32_t v13 = 38;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v7 = (__CFString *)[(VCVideoStreamReceiveGroup *)self performSelector:sel_logPrefix];
      }
      else {
        v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_13;
      }
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      uint64_t v15 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      [(VCMediaStreamGroup *)self externalRenderLatency];
      *(_DWORD *)buf = 136316418;
      uint64_t v20 = v14;
      __int16 v21 = 2080;
      uint64_t v22 = "-[VCVideoStreamReceiveGroup setExternalRenderLatency:]";
      __int16 v23 = 1024;
      int v24 = 137;
      __int16 v25 = 2112;
      v26 = v7;
      __int16 v27 = 2048;
      v28 = self;
      __int16 v29 = 2048;
      uint64_t v30 = v16;
      objc_super v11 = " [%s] %s:%d %@(%p) Display external output latency=%f";
      v12 = v15;
      uint32_t v13 = 58;
    }
    _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
LABEL_13:
    [(VCMediaStreamGroup *)self externalRenderLatency];
    VCVideoStream_SetExternalOutputVideoLatency((uint64_t)v6, v17);
  }
}

- (void)resetDidReceiveFirstFrame
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  mediaStreamInfoArray = self->super.super._mediaStreamInfoArray;
  uint64_t v3 = [(NSArray *)mediaStreamInfoArray countByEnumeratingWithState:&v8 objects:v7 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(mediaStreamInfoArray);
        }
        objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "stream"), "setDidReceiveFirstFrame:", 0);
      }
      uint64_t v4 = [(NSArray *)mediaStreamInfoArray countByEnumeratingWithState:&v8 objects:v7 count:16];
    }
    while (v4);
  }
}

- (void)resetPerfTimers
{
  double v3 = micro();
  self->super.super._creationTime = v3;
  self->super.super._firstMediaPacketTime = v3;
  VCPerfTimingUtilsSetStartForKeyOnceWithTime(self->super.super._perfTimers, 16, self->super.super._creationTime);
  self->_haveReportedPerfTimers = 0;
}

- (id)setupRedundancyController
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (self->_videoRedundancyController) {
    return 0;
  }
  if ([(VCMediaStreamGroup *)self statisticsCollector])
  {
    double v3 = -[VCRedundancyControllerVideo initWithDelegate:mode:parameters:]([VCRedundancyControllerVideo alloc], "initWithDelegate:mode:parameters:", self, 7, [(VCMediaStreamGroup *)self statisticsCollector], 400);
    self->_videoRedundancyController = v3;
    if (v3)
    {
      [(VCRedundancyControllerVideo *)v3 setStatisticsID:self->super.super._idsParticipantID];
      if ((VCVideoStreamReceiveGroup *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          return 0;
        }
        uint64_t v5 = VRTraceErrorLogLevelToCSTR();
        id v6 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          return 0;
        }
        int v17 = 136315650;
        uint64_t v18 = v5;
        __int16 v19 = 2080;
        uint64_t v20 = "-[VCVideoStreamReceiveGroup setupRedundancyController]";
        __int16 v21 = 1024;
        int v22 = 184;
        v7 = " [%s] %s:%d Redundancy controller is created";
        long long v8 = v6;
        uint32_t v9 = 28;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v4 = (__CFString *)[(VCVideoStreamReceiveGroup *)self performSelector:sel_logPrefix];
        }
        else {
          uint64_t v4 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          return 0;
        }
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        long long v11 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          return 0;
        }
        int v17 = 136316162;
        uint64_t v18 = v10;
        __int16 v19 = 2080;
        uint64_t v20 = "-[VCVideoStreamReceiveGroup setupRedundancyController]";
        __int16 v21 = 1024;
        int v22 = 184;
        __int16 v23 = 2112;
        int v24 = v4;
        __int16 v25 = 2048;
        v26 = self;
        v7 = " [%s] %s:%d %@(%p) Redundancy controller is created";
        long long v8 = v11;
        uint32_t v9 = 48;
      }
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v17, v9);
      return 0;
    }
    uint32_t v13 = @"Failed to create video redundancy controller";
  }
  else
  {
    uint32_t v13 = @"Need statistics collector to create redundancy controller";
  }
  if ((VCVideoStreamReceiveGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoStreamReceiveGroup setupRedundancyController]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v14 = (__CFString *)[(VCVideoStreamReceiveGroup *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v14 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      uint64_t v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v17 = 136316418;
        uint64_t v18 = v15;
        __int16 v19 = 2080;
        uint64_t v20 = "-[VCVideoStreamReceiveGroup setupRedundancyController]";
        __int16 v21 = 1024;
        int v22 = 187;
        __int16 v23 = 2112;
        int v24 = v14;
        __int16 v25 = 2048;
        v26 = self;
        __int16 v27 = 2112;
        v28 = v13;
        _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) %@", (uint8_t *)&v17, 0x3Au);
      }
    }
  }
  return (id)[MEMORY[0x1E4F28C58] AVConferenceServiceError:32000 detailCode:0 description:v13];
}

- (BOOL)isVisible
{
  return self->_visibilityIndex == 0;
}

- (BOOL)isVideoExpected
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ((VCVideoStreamReceiveGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      id v6 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v7 = [(VCMediaStreamGroup *)self state];
          BOOL isRemoteMediaStalled = self->_isRemoteMediaStalled;
          *(_DWORD *)uint64_t v20 = 136316418;
          *(void *)&v20[4] = v4;
          *(_WORD *)&v20[12] = 2080;
          *(void *)&v20[14] = "-[VCVideoStreamReceiveGroup isVideoExpected]";
          *(_WORD *)&v20[22] = 1024;
          LODWORD(v21) = 198;
          WORD2(v21) = 1024;
          *(_DWORD *)((char *)&v21 + 6) = v7;
          WORD5(v21) = 1024;
          HIDWORD(v21) = isRemoteMediaStalled;
          LOWORD(v22) = 1024;
          *(_DWORD *)((char *)&v22 + 2) = [(VCVideoStreamReceiveGroup *)self isVisible];
          uint32_t v9 = " [%s] %s:%d state:%d remoteVideoPaused:%d isVisible:%d";
          uint64_t v10 = v5;
          uint32_t v11 = 46;
LABEL_13:
          _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, v20, v11);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        [(VCVideoStreamReceiveGroup *)v4 isVideoExpected];
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      double v3 = (__CFString *)[(VCVideoStreamReceiveGroup *)self performSelector:sel_logPrefix];
    }
    else {
      double v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
      return [(VCMediaStreamGroup *)self state] == 1
    }
          && !self->_isRemoteMediaStalled
          && [(VCVideoStreamReceiveGroup *)self isVisible];
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    uint32_t v13 = *MEMORY[0x1E4F47A50];
    uint64_t v14 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v15 = [(VCMediaStreamGroup *)self state];
        BOOL v16 = self->_isRemoteMediaStalled;
        *(_DWORD *)uint64_t v20 = 136316930;
        *(void *)&v20[4] = v12;
        *(_WORD *)&v20[12] = 2080;
        *(void *)&v20[14] = "-[VCVideoStreamReceiveGroup isVideoExpected]";
        *(_WORD *)&v20[22] = 1024;
        LODWORD(v21) = 198;
        WORD2(v21) = 2112;
        *(void *)((char *)&v21 + 6) = v3;
        HIWORD(v21) = 2048;
        int v22 = self;
        LOWORD(v23) = 1024;
        *(_DWORD *)((char *)&v23 + 2) = v15;
        HIWORD(v23) = 1024;
        LODWORD(v24) = v16;
        WORD2(v24) = 1024;
        *(_DWORD *)((char *)&v24 + 6) = [(VCVideoStreamReceiveGroup *)self isVisible];
        uint32_t v9 = " [%s] %s:%d %@(%p) state:%d remoteVideoPaused:%d isVisible:%d";
        uint64_t v10 = v13;
        uint32_t v11 = 66;
        goto LABEL_13;
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v17 = [(VCMediaStreamGroup *)self state];
      BOOL v18 = self->_isRemoteMediaStalled;
      *(_DWORD *)uint64_t v20 = 136316930;
      *(void *)&v20[4] = v12;
      *(_WORD *)&v20[12] = 2080;
      *(void *)&v20[14] = "-[VCVideoStreamReceiveGroup isVideoExpected]";
      *(_WORD *)&v20[22] = 1024;
      LODWORD(v21) = 198;
      WORD2(v21) = 2112;
      *(void *)((char *)&v21 + 6) = v3;
      HIWORD(v21) = 2048;
      int v22 = self;
      LOWORD(v23) = 1024;
      *(_DWORD *)((char *)&v23 + 2) = v17;
      HIWORD(v23) = 1024;
      LODWORD(v24) = v18;
      WORD2(v24) = 1024;
      *(_DWORD *)((char *)&v24 + 6) = [(VCVideoStreamReceiveGroup *)self isVisible];
      _os_log_debug_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %@(%p) state:%d remoteVideoPaused:%d isVisible:%d", v20, 0x42u);
    }
  }
  return [(VCMediaStreamGroup *)self state] == 1
      && !self->_isRemoteMediaStalled
      && [(VCVideoStreamReceiveGroup *)self isVisible];
}

- (void)setShouldEnableFaceZoom:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  mediaStreams = self->super.super._mediaStreams;
  uint64_t v5 = [(NSArray *)mediaStreams countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(mediaStreams);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * i) setShouldEnableFaceZoom:v3];
      }
      uint64_t v6 = [(NSArray *)mediaStreams countByEnumeratingWithState:&v10 objects:v9 count:16];
    }
    while (v6);
  }
}

- (void)updateShouldEnableFaceZoom
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([(VCMediaStreamGroup *)self streamGroupID] == 1667329381
    || [(VCMediaStreamGroup *)self streamGroupID] == 1667329399)
  {
    if ([+[VCDefaults sharedInstance] forceDisableFaceZoom])
    {
      if ((VCVideoStreamReceiveGroup *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v6 = VRTraceErrorLogLevelToCSTR();
          uint64_t v7 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v13 = 136315650;
            uint64_t v14 = v6;
            __int16 v15 = 2080;
            BOOL v16 = "-[VCVideoStreamReceiveGroup updateShouldEnableFaceZoom]";
            __int16 v17 = 1024;
            int v18 = 213;
            long long v8 = " [%s] %s:%d FaceZoom is disabled.";
            uint32_t v9 = v7;
            uint32_t v10 = 28;
LABEL_21:
            _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          BOOL v3 = (__CFString *)[(VCVideoStreamReceiveGroup *)self performSelector:sel_logPrefix];
        }
        else {
          BOOL v3 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v11 = VRTraceErrorLogLevelToCSTR();
          long long v12 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v13 = 136316162;
            uint64_t v14 = v11;
            __int16 v15 = 2080;
            BOOL v16 = "-[VCVideoStreamReceiveGroup updateShouldEnableFaceZoom]";
            __int16 v17 = 1024;
            int v18 = 213;
            __int16 v19 = 2112;
            uint64_t v20 = v3;
            __int16 v21 = 2048;
            int v22 = self;
            long long v8 = " [%s] %s:%d %@(%p) FaceZoom is disabled.";
            uint32_t v9 = v12;
            uint32_t v10 = 48;
            goto LABEL_21;
          }
        }
      }
    }
    else
    {
      if (self->_remoteVideoPaused || ![(VCVideoStreamReceiveGroup *)self isVisible])
      {
        uint64_t v4 = self;
        uint64_t v5 = 0;
      }
      else
      {
        uint64_t v4 = self;
        uint64_t v5 = 1;
      }
      [(VCVideoStreamReceiveGroup *)v4 setShouldEnableFaceZoom:v5];
    }
  }
}

- (BOOL)setSyncSource:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  long long v8 = &v7;
  uint64_t v9 = 0x2020000000;
  stateQueue = self->super.super._stateQueue;
  char v10 = 1;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__VCVideoStreamReceiveGroup_setSyncSource___block_invoke;
  v6[3] = &unk_1E6DB4590;
  v6[5] = a3;
  v6[6] = &v7;
  v6[4] = self;
  dispatch_sync(stateQueue, v6);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __43__VCVideoStreamReceiveGroup_setSyncSource___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 32);
  if ([*(id *)(a1 + 32) state])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        char v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __43__VCVideoStreamReceiveGroup_setSyncSource___block_invoke_cold_1(v9, v2, v10);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        long long v8 = (__CFString *)[*v2 performSelector:sel_logPrefix];
      }
      else {
        long long v8 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        long long v12 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          id v13 = *v2;
          *(_DWORD *)buf = 136316418;
          uint64_t v20 = v11;
          __int16 v21 = 2080;
          int v22 = "-[VCVideoStreamReceiveGroup setSyncSource:]_block_invoke";
          __int16 v23 = 1024;
          int v24 = 226;
          __int16 v25 = 2112;
          v26 = v8;
          __int16 v27 = 2048;
          id v28 = v13;
          __int16 v29 = 1024;
          int v30 = [v13 state];
          _os_log_error_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Stream group must be stopped when setting sync source. state=%d", buf, 0x36u);
        }
      }
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 592) = *(void *)(a1 + 40) == 0;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    BOOL v3 = *(void **)(*(void *)(a1 + 32) + 168);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v16 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "streamConfigs"), "firstObject"), "setSyncSource:", *(void *)(a1 + 40));
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v14 count:16];
      }
      while (v5);
    }
  }
}

- (void)setVideoStreamDelegate:(id)a3 delegateFunctions:(const tagVCVideoStreamDelegateRealtimeInstanceVTable *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    stateQueue = self->super.super._stateQueue;
    remoteScreenAttributesDidChange = a4->remoteScreenAttributesDidChange;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__VCVideoStreamReceiveGroup_setVideoStreamDelegate_delegateFunctions___block_invoke;
    block[3] = &unk_1E6DB5450;
    block[4] = self;
    block[5] = a3;
    block[6] = remoteScreenAttributesDidChange;
    dispatch_async(stateQueue, block);
    return;
  }
  if ((VCVideoStreamReceiveGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v17 = v8;
        __int16 v18 = 2080;
        __int16 v19 = "-[VCVideoStreamReceiveGroup setVideoStreamDelegate:delegateFunctions:]";
        __int16 v20 = 1024;
        int v21 = 242;
        char v10 = " [%s] %s:%d videoStreamDelegateFunctions is NULL";
        uint64_t v11 = v9;
        uint32_t v12 = 28;
LABEL_14:
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v7 = (__CFString *)[(VCVideoStreamReceiveGroup *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      uint64_t v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v17 = v13;
        __int16 v18 = 2080;
        __int16 v19 = "-[VCVideoStreamReceiveGroup setVideoStreamDelegate:delegateFunctions:]";
        __int16 v20 = 1024;
        int v21 = 242;
        __int16 v22 = 2112;
        __int16 v23 = v7;
        __int16 v24 = 2048;
        __int16 v25 = self;
        char v10 = " [%s] %s:%d %@(%p) videoStreamDelegateFunctions is NULL";
        uint64_t v11 = v14;
        uint32_t v12 = 48;
        goto LABEL_14;
      }
    }
  }
}

uint64_t __70__VCVideoStreamReceiveGroup_setVideoStreamDelegate_delegateFunctions___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v2 = *(void **)(*(void *)(a1 + 32) + 168);
  uint64_t result = [v2 countByEnumeratingWithState:&v37 objects:v36 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v38;
    *(void *)&long long v4 = 136316162;
    long long v21 = v4;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v38 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v37 + 1) + 8 * v7);
        if (objc_msgSend(v8, "isOneToOneSupported", v21))
        {
          uint64_t v9 = (__CFString *)[v8 stream];
          if (objc_opt_class() == *(void *)(a1 + 32))
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v18 = VRTraceErrorLogLevelToCSTR();
              __int16 v19 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v20 = *(void *)(a1 + 40);
                *(_DWORD *)buf = v21;
                uint64_t v23 = v18;
                __int16 v24 = 2080;
                __int16 v25 = "-[VCVideoStreamReceiveGroup setVideoStreamDelegate:delegateFunctions:]_block_invoke";
                __int16 v26 = 1024;
                int v27 = 250;
                __int16 v28 = 2048;
                __int16 v29 = v9;
                __int16 v30 = 2048;
                uint64_t v31 = v20;
                long long v15 = v19;
                long long v16 = " [%s] %s:%d stream=%p, videoStreamDelegate=%p";
                uint32_t v17 = 48;
LABEL_16:
                _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, v17);
              }
            }
          }
          else
          {
            char v10 = &stru_1F3D3E450;
            if (objc_opt_respondsToSelector()) {
              char v10 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v11 = VRTraceErrorLogLevelToCSTR();
              uint32_t v12 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v13 = *(void *)(a1 + 32);
                uint64_t v14 = *(void *)(a1 + 40);
                *(_DWORD *)buf = 136316674;
                uint64_t v23 = v11;
                __int16 v24 = 2080;
                __int16 v25 = "-[VCVideoStreamReceiveGroup setVideoStreamDelegate:delegateFunctions:]_block_invoke";
                __int16 v26 = 1024;
                int v27 = 250;
                __int16 v28 = 2112;
                __int16 v29 = v10;
                __int16 v30 = 2048;
                uint64_t v31 = v13;
                __int16 v32 = 2048;
                v33 = v9;
                __int16 v34 = 2048;
                uint64_t v35 = v14;
                long long v15 = v12;
                long long v16 = " [%s] %s:%d %@(%p) stream=%p, videoStreamDelegate=%p";
                uint32_t v17 = 68;
                goto LABEL_16;
              }
            }
          }
          [(__CFString *)v9 setVideoStreamDelegate:*(void *)(a1 + 40) delegateFunctions:a1 + 48];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t result = [v2 countByEnumeratingWithState:&v37 objects:v36 count:16];
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

- (id)willStart
{
  self->_startTime = micro();
  self->_poorConnectionTotalLength = 0.0;
  [(VCVideoStreamReceiveGroup *)self resetDidReceiveFirstFrame];
  [(VCVideoStreamReceiveGroup *)self resetPerfTimers];

  return [(VCVideoStreamReceiveGroup *)self setupRedundancyController];
}

- (void)didStop
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(VCVideoStreamReceiveGroup *)self resetDidReceiveFirstFrame];
  v3.receiver = self;
  v3.super_class = (Class)VCVideoStreamReceiveGroup;
  [(VCMediaStreamGroup *)&v3 didStop];
}

- (void)setupVideoPriority
{
  self->_lastVideoPriority = 0;
  self->_videoQuality = 0;
}

- (void)updateVideoPriority:(unsigned __int8)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_videoQuality != a3)
  {
    self->_videoQuality = a3;
    uint64_t v5 = MEMORY[0x1E4E56580](&self->super.super._delegate, a2);
    if (v5)
    {
      delegateQueue = self->super.super._delegateQueue;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __49__VCVideoStreamReceiveGroup_updateVideoPriority___block_invoke;
      v7[3] = &unk_1E6DB3E18;
      v7[4] = v5;
      v7[5] = self;
      unsigned __int8 v8 = a3;
      dispatch_async(delegateQueue, v7);
    }
  }
}

void __49__VCVideoStreamReceiveGroup_updateVideoPriority___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) streamGroup:*(void *)(a1 + 40) didChangeMediaPriority:*(unsigned __int8 *)(a1 + 48)];
  v2 = *(const void **)(a1 + 32);

  CFRelease(v2);
}

- (void)setOptedInStreamID:(id)a3
{
  if (self->super._optedInStreamID != a3)
  {

    self->_previousOptedInStreamID = (NSNumber *)[(NSNumber *)self->super._optedInStreamID copy];
    self->super._optedInStreamID = (NSNumber *)a3;
  }
}

- (void)setActiveStreamIDs:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__VCVideoStreamReceiveGroup_setActiveStreamIDs___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = a3;
  block[5] = self;
  dispatch_async(stateQueue, block);
}

void __48__VCVideoStreamReceiveGroup_setActiveStreamIDs___block_invoke(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  objc_super v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v49 objects:v48 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v50 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v49 + 1) + 8 * i);
        uint64_t v9 = [*(id *)(*(void *)(a1 + 40) + 184) objectForKeyedSubscript:v8];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v2 setObject:v9 forKeyedSubscript:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v49 objects:v48 count:16];
    }
    while (v5);
  }
  uint64_t v10 = [v2 count];
  uint64_t v11 = *(unsigned char **)(a1 + 40);
  if (!v10)
  {
    if (objc_opt_class() == *(void *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_25;
      }
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      long long v15 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = v14;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[VCVideoStreamReceiveGroup setActiveStreamIDs:]_block_invoke";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v42) = 327;
      long long v16 = " [%s] %s:%d Opted out of all video streams!!!";
      uint32_t v17 = v15;
      uint32_t v18 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v13 = (__CFString *)[*(id *)(a1 + 40) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v13 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_25;
      }
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      uint64_t v20 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
      uint64_t v21 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136316162;
      *(void *)&uint8_t buf[4] = v19;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[VCVideoStreamReceiveGroup setActiveStreamIDs:]_block_invoke";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v42) = 327;
      WORD2(v42) = 2112;
      *(void *)((char *)&v42 + 6) = v13;
      HIWORD(v42) = 2048;
      uint64_t v43 = v21;
      long long v16 = " [%s] %s:%d %@(%p) Opted out of all video streams!!!";
      uint32_t v17 = v20;
      uint32_t v18 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
LABEL_25:
    if (![*(id *)(a1 + 40) isVideoExpected]) {
      goto LABEL_27;
    }
    __int16 v22 = *(unsigned char **)(a1 + 40);
    if (v22[521]) {
      goto LABEL_27;
    }
    char v12 = 1;
    objc_msgSend(v22, "setMediaSuspended:forStreamToken:", 1, objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "streamToken")));
    goto LABEL_13;
  }
  if (!v11[521]) {
    goto LABEL_27;
  }
  objc_msgSend(v11, "setMediaSuspended:forStreamToken:", 0, objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "streamToken")));
  char v12 = 0;
LABEL_13:
  *(unsigned char *)(*(void *)(a1 + 40) + 521) = v12;
LABEL_27:
  uint64_t v23 = [v2 count];
  uint64_t v24 = *(void *)(a1 + 40);
  if (*(void *)(v24 + 432)) {
    BOOL v25 = v23 == 2;
  }
  else {
    BOOL v25 = 1;
  }
  if (v25)
  {
    uint64_t v36 = MEMORY[0x1E4F143A8];
    uint64_t v37 = 3221225472;
    long long v38 = __48__VCVideoStreamReceiveGroup_setActiveStreamIDs___block_invoke_31;
    long long v39 = &unk_1E6DB8AD0;
    uint64_t v40 = v24;
    __int16 v26 = &v36;
LABEL_35:
    objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v26, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40, *(_OWORD *)buf, *(void *)&buf[16], v42, v43);
    goto LABEL_36;
  }
  if ([v2 count] == 1)
  {
    uint64_t v31 = MEMORY[0x1E4F143A8];
    uint64_t v32 = 3221225472;
    v33 = __48__VCVideoStreamReceiveGroup_setActiveStreamIDs___block_invoke_33;
    __int16 v34 = &unk_1E6DB8AD0;
    uint64_t v35 = *(void *)(a1 + 40);
    __int16 v26 = &v31;
    goto LABEL_35;
  }
  if (![v2 count])
  {
    *(unsigned char *)(*(void *)(a1 + 40) + 497) = 0;
    [*(id *)(a1 + 40) setOptedInStreamID:0];
  }
LABEL_36:
  if ((unint64_t)[v2 count] >= 3)
  {
    if (objc_opt_class() == *(void *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __48__VCVideoStreamReceiveGroup_setActiveStreamIDs___block_invoke_cold_1();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v27 = (__CFString *)[*(id *)(a1 + 40) performSelector:sel_logPrefix];
      }
      else {
        int v27 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v28 = VRTraceErrorLogLevelToCSTR();
        __int16 v29 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v30 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 136316674;
          *(void *)&uint8_t buf[4] = v28;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "-[VCVideoStreamReceiveGroup setActiveStreamIDs:]_block_invoke";
          *(_WORD *)&buf[22] = 1024;
          LODWORD(v42) = 376;
          WORD2(v42) = 2112;
          *(void *)((char *)&v42 + 6) = v27;
          HIWORD(v42) = 2048;
          uint64_t v43 = v30;
          __int16 v44 = 1024;
          int v45 = 2;
          __int16 v46 = 2112;
          v47 = v2;
          _os_log_error_impl(&dword_1E1EA4000, v29, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Trying to opt into more than %d video streams! Streams:%@", buf, 0x40u);
        }
      }
    }
  }
}

uint64_t __48__VCVideoStreamReceiveGroup_setActiveStreamIDs___block_invoke_31(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *(void *)(a1 + 32);
  if (!*(void *)(v8 + 432) && *(void *)(v8 + 504) && objc_msgSend(a2, "isEqualToNumber:"))
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v20 = VRTraceErrorLogLevelToCSTR();
        uint64_t v21 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t v28 = 136315906;
          *(void *)&v28[4] = v20;
          *(_WORD *)&v28[12] = 2080;
          *(void *)&v28[14] = "-[VCVideoStreamReceiveGroup setActiveStreamIDs:]_block_invoke";
          *(_WORD *)&v28[22] = 1024;
          LODWORD(v29) = 348;
          WORD2(v29) = 2112;
          *(void *)((char *)&v29 + 6) = a2;
          __int16 v22 = " [%s] %s:%d Opted out and back in to the same video streamID %@, large sequence number gaps may occur";
          uint64_t v23 = v21;
          uint32_t v24 = 38;
LABEL_28:
          _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, v22, v28, v24);
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
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v25 = VRTraceErrorLogLevelToCSTR();
        __int16 v26 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v27 = *(void *)(a1 + 32);
          *(_DWORD *)uint64_t v28 = 136316418;
          *(void *)&v28[4] = v25;
          *(_WORD *)&v28[12] = 2080;
          *(void *)&v28[14] = "-[VCVideoStreamReceiveGroup setActiveStreamIDs:]_block_invoke";
          *(_WORD *)&v28[22] = 1024;
          LODWORD(v29) = 348;
          WORD2(v29) = 2112;
          *(void *)((char *)&v29 + 6) = v11;
          HIWORD(v29) = 2048;
          uint64_t v30 = v27;
          LOWORD(v31) = 2112;
          *(void *)((char *)&v31 + 2) = a2;
          __int16 v22 = " [%s] %s:%d %@(%p) Opted out and back in to the same video streamID %@, large sequence number gaps may occur";
          uint64_t v23 = v26;
          uint32_t v24 = 58;
          goto LABEL_28;
        }
      }
    }
  }
  uint64_t result = objc_msgSend(a2, "isEqual:", *(void *)(*(void *)(a1 + 32) + 432), *(_OWORD *)v28, *(void *)&v28[16], v29, v30, v31);
  if (result) {
    return result;
  }
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_19;
    }
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    uint64_t v13 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)uint64_t v28 = 136315906;
    *(void *)&v28[4] = v12;
    *(_WORD *)&v28[12] = 2080;
    *(void *)&v28[14] = "-[VCVideoStreamReceiveGroup setActiveStreamIDs:]_block_invoke";
    *(_WORD *)&v28[22] = 1024;
    LODWORD(v29) = 352;
    WORD2(v29) = 2112;
    *(void *)((char *)&v29 + 6) = a2;
    uint64_t v14 = " [%s] %s:%d Starting seamless video switch with target stream id: %@";
    long long v15 = v13;
    uint32_t v16 = 38;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v10 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      uint64_t v10 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_19;
    }
    uint64_t v17 = VRTraceErrorLogLevelToCSTR();
    uint32_t v18 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    uint64_t v19 = *(void *)(a1 + 32);
    *(_DWORD *)uint64_t v28 = 136316418;
    *(void *)&v28[4] = v17;
    *(_WORD *)&v28[12] = 2080;
    *(void *)&v28[14] = "-[VCVideoStreamReceiveGroup setActiveStreamIDs:]_block_invoke";
    *(_WORD *)&v28[22] = 1024;
    LODWORD(v29) = 352;
    WORD2(v29) = 2112;
    *(void *)((char *)&v29 + 6) = v10;
    HIWORD(v29) = 2048;
    uint64_t v30 = v19;
    LOWORD(v31) = 2112;
    *(void *)((char *)&v31 + 2) = a2;
    uint64_t v14 = " [%s] %s:%d %@(%p) Starting seamless video switch with target stream id: %@";
    long long v15 = v18;
    uint32_t v16 = 58;
  }
  _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, v28, v16);
LABEL_19:
  *(unsigned char *)(*(void *)(a1 + 32) + 497) = 1;
  uint64_t result = objc_msgSend(a3, "setTargetStreamID:", a2, *(void *)v28, *(_OWORD *)&v28[8], v29, v30, v31);
  *a4 = 1;
  return result;
}

uint64_t __48__VCVideoStreamReceiveGroup_setActiveStreamIDs___block_invoke_33(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  char v6 = objc_msgSend(a2, "isEqual:", objc_msgSend(a3, "targetStreamID"));
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = *(void *)(a1 + 32);
  if (v6)
  {
    if (v7 != v8)
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v9 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v9 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v17 = VRTraceErrorLogLevelToCSTR();
        uint32_t v18 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = *(void *)(a1 + 32);
          *(_DWORD *)uint64_t v23 = 136316418;
          *(void *)&v23[4] = v17;
          *(_WORD *)&v23[12] = 2080;
          *(void *)&v23[14] = "-[VCVideoStreamReceiveGroup setActiveStreamIDs:]_block_invoke";
          *(_WORD *)&v23[22] = 1024;
          LODWORD(v24) = 364;
          WORD2(v24) = 2112;
          *(void *)((char *)&v24 + 6) = v9;
          HIWORD(v24) = 2048;
          uint64_t v25 = v19;
          LOWORD(v26) = 2112;
          *(void *)((char *)&v26 + 2) = a2;
          uint64_t v13 = " [%s] %s:%d %@(%p) Ending seamless video switch with target stream id: %@";
LABEL_23:
          long long v15 = v18;
          uint32_t v16 = 58;
          goto LABEL_24;
        }
      }
      goto LABEL_25;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_25;
    }
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    uint64_t v12 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    *(_DWORD *)uint64_t v23 = 136315906;
    *(void *)&v23[4] = v11;
    *(_WORD *)&v23[12] = 2080;
    *(void *)&v23[14] = "-[VCVideoStreamReceiveGroup setActiveStreamIDs:]_block_invoke";
    *(_WORD *)&v23[22] = 1024;
    LODWORD(v24) = 364;
    WORD2(v24) = 2112;
    *(void *)((char *)&v24 + 6) = a2;
    uint64_t v13 = " [%s] %s:%d Ending seamless video switch with target stream id: %@";
LABEL_14:
    long long v15 = v12;
    uint32_t v16 = 38;
LABEL_24:
    _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v13, v23, v16);
    goto LABEL_25;
  }
  if (v7 == v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_25;
    }
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    uint64_t v12 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    *(_DWORD *)uint64_t v23 = 136315906;
    *(void *)&v23[4] = v14;
    *(_WORD *)&v23[12] = 2080;
    *(void *)&v23[14] = "-[VCVideoStreamReceiveGroup setActiveStreamIDs:]_block_invoke";
    *(_WORD *)&v23[22] = 1024;
    LODWORD(v24) = 362;
    WORD2(v24) = 2112;
    *(void *)((char *)&v24 + 6) = a2;
    uint64_t v13 = " [%s] %s:%d Non-seamless video switch with target stream id: %@";
    goto LABEL_14;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v10 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
  }
  else {
    uint64_t v10 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v20 = VRTraceErrorLogLevelToCSTR();
    uint32_t v18 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = *(void *)(a1 + 32);
      *(_DWORD *)uint64_t v23 = 136316418;
      *(void *)&v23[4] = v20;
      *(_WORD *)&v23[12] = 2080;
      *(void *)&v23[14] = "-[VCVideoStreamReceiveGroup setActiveStreamIDs:]_block_invoke";
      *(_WORD *)&v23[22] = 1024;
      LODWORD(v24) = 362;
      WORD2(v24) = 2112;
      *(void *)((char *)&v24 + 6) = v10;
      HIWORD(v24) = 2048;
      uint64_t v25 = v21;
      LOWORD(v26) = 2112;
      *(void *)((char *)&v26 + 2) = a2;
      uint64_t v13 = " [%s] %s:%d %@(%p) Non-seamless video switch with target stream id: %@";
      goto LABEL_23;
    }
  }
LABEL_25:
  objc_msgSend(a3, "setTargetStreamID:", a2, *(_OWORD *)v23, *(void *)&v23[16], v24, v25, v26);
  *(unsigned char *)(*(void *)(a1 + 32) + 497) = 0;
  return [*(id *)(a1 + 32) setOptedInStreamID:a2];
}

- (void)setMediaSuspended:(BOOL)a3 forStreamToken:(id)a4
{
  BOOL v5 = a3;
  char v6 = (void *)VCRemoteVideoManager_DefaultManager();
  uint64_t v7 = [a4 unsignedIntValue];

  [v6 remoteVideoDidSuspend:v5 streamToken:v7];
}

- (void)setRemoteVideoPaused:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__VCVideoStreamReceiveGroup_setRemoteVideoPaused___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_async(stateQueue, block);
}

void __50__VCVideoStreamReceiveGroup_setRemoteVideoPaused___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 476) != v2)
  {
    *(unsigned char *)(v1 + 476) = v2;
    [*(id *)(a1 + 32) updateVideoExpected];
    [*(id *)(a1 + 32) setIsRemoteMediaStalled:*(unsigned __int8 *)(*(void *)(a1 + 32) + 477)];
    uint64_t v4 = MEMORY[0x1E4E56580](*(void *)(a1 + 32) + 296);
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(NSObject **)(v5 + 304);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __50__VCVideoStreamReceiveGroup_setRemoteVideoPaused___block_invoke_2;
      v7[3] = &unk_1E6DB3E18;
      v7[4] = v4;
      v7[5] = v5;
      char v8 = *(unsigned char *)(a1 + 40);
      dispatch_async(v6, v7);
    }
  }
}

void __50__VCVideoStreamReceiveGroup_setRemoteVideoPaused___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) streamGroup:*(void *)(a1 + 40) didRemotePauseChange:*(unsigned __int8 *)(a1 + 48)];
  int v2 = *(const void **)(a1 + 32);

  CFRelease(v2);
}

- (void)setRemoteVideoEnabled:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__VCVideoStreamReceiveGroup_setRemoteVideoEnabled___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_async(stateQueue, block);
}

uint64_t __51__VCVideoStreamReceiveGroup_setRemoteVideoEnabled___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 608) != v2)
  {
    uint64_t v3 = result;
    *(unsigned char *)(v1 + 608) = v2;
    [*(id *)(result + 32) updateVideoExpected];
    [*(id *)(v3 + 32) setIsRemoteMediaStalled:*(unsigned __int8 *)(*(void *)(v3 + 32) + 477)];
    uint64_t result = *(void *)(v3 + 32);
    if (!*(unsigned char *)(result + 608))
    {
      return [(id)result resetDidReceiveFirstFrame];
    }
  }
  return result;
}

- (void)setVisibilityIndex:(unsigned int)a3
{
  self->_visibilityIndex = +[VCDefaults integerValueForKey:@"forceVisibilityIndex" defaultValue:a3];
  [(VCMediaStreamGroup *)self streamToken];
  kdebug_trace();
  [(VCVideoStreamReceiveGroup *)self updateVideoExpected];
  [(VCVideoStreamReceiveGroup *)self setIsRemoteMediaStalled:self->_isVideoDegraded];

  [(VCVideoStreamReceiveGroup *)self updateShouldEnableFaceZoom];
}

- (void)checkAndReportRegressedPoorConnectionPercentage
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ([(VCMediaStreamGroup *)self streamGroupID] == 1667329381
    && !self->_poorConnectionPercentageRegressedFromTelemetrySymptomReported)
  {
    if (self->_poorConnectionPercentageABCReportingThreshold)
    {
      double v3 = micro();
      double v4 = v3 - self->_isVideoDegradedStartTime + self->_poorConnectionTotalLength;
      self->_poorConnectionTotalLength = v4;
      int v5 = (int)(v4 * 10000.0 / (v3 - self->_startTime));
      if (self->_poorConnectionPercentageABCReportingThreshold < v5)
      {
        if ((VCVideoStreamReceiveGroup *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
            goto LABEL_16;
          }
          uint64_t v7 = VRTraceErrorLogLevelToCSTR();
          char v8 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_16;
          }
          int poorConnectionPercentageABCReportingThreshold = self->_poorConnectionPercentageABCReportingThreshold;
          int v17 = 136316162;
          uint64_t v18 = v7;
          __int16 v19 = 2080;
          uint64_t v20 = "-[VCVideoStreamReceiveGroup checkAndReportRegressedPoorConnectionPercentage]";
          __int16 v21 = 1024;
          int v22 = 436;
          __int16 v23 = 1024;
          *(_DWORD *)long long v24 = v5;
          *(_WORD *)&v24[4] = 1024;
          *(_DWORD *)&v24[6] = poorConnectionPercentageABCReportingThreshold;
          uint64_t v10 = " [%s] %s:%d PoorConnectionPercentage=%d >= ReportingThresholdFromTelemetry=%d";
          uint64_t v11 = v8;
          uint32_t v12 = 40;
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            uint64_t v6 = (__CFString *)[(VCVideoStreamReceiveGroup *)self performSelector:sel_logPrefix];
          }
          else {
            uint64_t v6 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
            goto LABEL_16;
          }
          uint64_t v13 = VRTraceErrorLogLevelToCSTR();
          uint64_t v14 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_16;
          }
          int v15 = self->_poorConnectionPercentageABCReportingThreshold;
          int v17 = 136316674;
          uint64_t v18 = v13;
          __int16 v19 = 2080;
          uint64_t v20 = "-[VCVideoStreamReceiveGroup checkAndReportRegressedPoorConnectionPercentage]";
          __int16 v21 = 1024;
          int v22 = 436;
          __int16 v23 = 2112;
          *(void *)long long v24 = v6;
          *(_WORD *)&v24[8] = 2048;
          uint64_t v25 = self;
          __int16 v26 = 1024;
          int v27 = v5;
          __int16 v28 = 1024;
          int v29 = v15;
          uint64_t v10 = " [%s] %s:%d %@(%p) PoorConnectionPercentage=%d >= ReportingThresholdFromTelemetry=%d";
          uint64_t v11 = v14;
          uint32_t v12 = 60;
        }
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v17, v12);
LABEL_16:
        Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        CFDictionarySetValue(Mutable, @"SymptomReporterOptionalKeySessionID", self->super.super._sessionUUID);
        CFDictionarySetValue(Mutable, @"SymptomReporterOptionalKeyParticipantID", (const void *)[NSNumber numberWithUnsignedLongLong:self->super.super._idsParticipantID]);
        [(VCObject *)self reportingAgent];
        reportingSymptom();
        CFRelease(Mutable);
        self->_poorConnectionPercentageRegressedFromTelemetrySymptomReported = 1;
      }
    }
  }
}

- (void)setVideoDegraded:(BOOL)a3 duration:(double)a4
{
  BOOL v5 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if ((VCVideoStreamReceiveGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_12;
    }
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_DWORD *)int v29 = 136315906;
    *(void *)&v29[4] = v8;
    *(_WORD *)&v29[12] = 2080;
    *(void *)&v29[14] = "-[VCVideoStreamReceiveGroup setVideoDegraded:duration:]";
    *(_WORD *)&v29[22] = 1024;
    LODWORD(v30) = 449;
    WORD2(v30) = 1024;
    *(_DWORD *)((char *)&v30 + 6) = v5;
    uint64_t v10 = " [%s] %s:%d videoDegraded=%d";
    uint64_t v11 = v9;
    uint32_t v12 = 34;
    goto LABEL_11;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v7 = (__CFString *)[(VCVideoStreamReceiveGroup *)self performSelector:sel_logPrefix];
  }
  else {
    uint64_t v7 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    uint64_t v14 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int v29 = 136316418;
      *(void *)&v29[4] = v13;
      *(_WORD *)&v29[12] = 2080;
      *(void *)&v29[14] = "-[VCVideoStreamReceiveGroup setVideoDegraded:duration:]";
      *(_WORD *)&v29[22] = 1024;
      LODWORD(v30) = 449;
      WORD2(v30) = 2112;
      *(void *)((char *)&v30 + 6) = v7;
      HIWORD(v30) = 2048;
      long long v31 = self;
      LOWORD(v32) = 1024;
      *(_DWORD *)((char *)&v32 + 2) = v5;
      uint64_t v10 = " [%s] %s:%d %@(%p) videoDegraded=%d";
      uint64_t v11 = v14;
      uint32_t v12 = 54;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, v29, v12);
    }
  }
LABEL_12:
  if ((a4 > 5.0 || !v5) && self->_reportedDegradeStatus != v5)
  {
    [(VCMediaStreamGroup *)self streamGroupID];
    uint64_t v15 = reportingStreamGroupFromStreamGroupID();
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    CFDictionaryAddValue(Mutable, @"VCSPUUID", self->super.super._participantUUID);
    CFDictionaryAddValue(Mutable, @"VCSPVideoDegraded", (const void *)[NSNumber numberWithBool:v5]);
    CFDictionaryAddValue(Mutable, @"VCMSStreamGroup", (const void *)[NSNumber numberWithUnsignedInt:v15]);
    [(VCObject *)self reportingAgent];
    reportingGenericEvent();
    if (Mutable) {
      CFRelease(Mutable);
    }
    self->_reportedDegradeStatus = v5;
  }
  if (*(&self->_isVideoDegraded + 1) == v5)
  {
    if ((VCVideoStreamReceiveGroup *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v20 = VRTraceErrorLogLevelToCSTR();
        __int16 v21 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v22 = *((unsigned __int8 *)&self->_isVideoDegraded + 1);
          *(_DWORD *)int v29 = 136315906;
          *(void *)&v29[4] = v20;
          *(_WORD *)&v29[12] = 2080;
          *(void *)&v29[14] = "-[VCVideoStreamReceiveGroup setVideoDegraded:duration:]";
          *(_WORD *)&v29[22] = 1024;
          LODWORD(v30) = 463;
          WORD2(v30) = 1024;
          *(_DWORD *)((char *)&v30 + 6) = v22;
          __int16 v23 = " [%s] %s:%d Ignoring setVideoDegraded=%d with same value";
          long long v24 = v21;
          uint32_t v25 = 34;
LABEL_39:
          _os_log_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_DEFAULT, v23, v29, v25);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v17 = (__CFString *)[(VCVideoStreamReceiveGroup *)self performSelector:sel_logPrefix];
      }
      else {
        int v17 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v26 = VRTraceErrorLogLevelToCSTR();
        int v27 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v28 = *((unsigned __int8 *)&self->_isVideoDegraded + 1);
          *(_DWORD *)int v29 = 136316418;
          *(void *)&v29[4] = v26;
          *(_WORD *)&v29[12] = 2080;
          *(void *)&v29[14] = "-[VCVideoStreamReceiveGroup setVideoDegraded:duration:]";
          *(_WORD *)&v29[22] = 1024;
          LODWORD(v30) = 463;
          WORD2(v30) = 2112;
          *(void *)((char *)&v30 + 6) = v17;
          HIWORD(v30) = 2048;
          long long v31 = self;
          LOWORD(v32) = 1024;
          *(_DWORD *)((char *)&v32 + 2) = v28;
          __int16 v23 = " [%s] %s:%d %@(%p) Ignoring setVideoDegraded=%d with same value";
          long long v24 = v27;
          uint32_t v25 = 54;
          goto LABEL_39;
        }
      }
    }
  }
  else
  {
    int64_t v18 = [(VCMediaStreamGroup *)self streamToken];
    if (!-[VCDefaults forceDisableVideoDegraded](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceDisableVideoDegraded"))[(id)VCRemoteVideoManager_DefaultManager() remoteVideoDidDegrade:v5 streamToken:v18]; {
    if (self->_isVideoDegradedStartTime != 0.0 && *(&self->_isVideoDegraded + 1) && !v5)
    }
      [(VCVideoStreamReceiveGroup *)self checkAndReportRegressedPoorConnectionPercentage];
    *(&self->_isVideoDegraded + 1) = v5;
    -[VCNetworkFeedbackController reportImmediateWRMMetric:value:](self->super.super._networkFeedbackController, "reportImmediateWRMMetric:value:", 0, v5, *(_OWORD *)v29, *(void *)&v29[16], v30, v31, v32, v33);
    kdebug_trace();
    if (*(&self->_isVideoDegraded + 1)) {
      double v19 = micro();
    }
    else {
      double v19 = 0.0;
    }
    self->_isVideoDegradedStartTime = v19;
  }
}

- (unsigned)lastDisplayedFrameRTPTimestamp
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__VCVideoStreamReceiveGroup_lastDisplayedFrameRTPTimestamp__block_invoke;
  block[3] = &unk_1E6DB3EB8;
  block[4] = self;
  void block[5] = &v6;
  dispatch_sync(stateQueue, block);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __59__VCVideoStreamReceiveGroup_lastDisplayedFrameRTPTimestamp__block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 184) objectForKeyedSubscript:*(void *)(*(void *)(a1 + 32) + 440)];
  if (v2)
  {
    unsigned int v3 = (void *)v2;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 lastDisplayedFrameRTPTimestamp];
      return;
    }
  }
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return;
    }
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return;
    }
    uint64_t v7 = *(__CFString **)(*(void *)(a1 + 32) + 440);
    int v15 = 136315906;
    uint64_t v16 = v5;
    __int16 v17 = 2080;
    int64_t v18 = "-[VCVideoStreamReceiveGroup lastDisplayedFrameRTPTimestamp]_block_invoke";
    __int16 v19 = 1024;
    int v20 = 488;
    __int16 v21 = 2112;
    int v22 = v7;
    uint64_t v8 = " [%s] %s:%d Can not find VCMediaStream from _activeDownlinkStreamID=%@";
    int v9 = v6;
    uint32_t v10 = 38;
LABEL_15:
    _os_log_error_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v15, v10);
    return;
  }
  if (objc_opt_respondsToSelector()) {
    double v4 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
  }
  else {
    double v4 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    uint32_t v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = *(void *)(v13 + 440);
      int v15 = 136316418;
      uint64_t v16 = v11;
      __int16 v17 = 2080;
      int64_t v18 = "-[VCVideoStreamReceiveGroup lastDisplayedFrameRTPTimestamp]_block_invoke";
      __int16 v19 = 1024;
      int v20 = 488;
      __int16 v21 = 2112;
      int v22 = v4;
      __int16 v23 = 2048;
      uint64_t v24 = v13;
      __int16 v25 = 2112;
      uint64_t v26 = v14;
      uint64_t v8 = " [%s] %s:%d %@(%p) Can not find VCMediaStream from _activeDownlinkStreamID=%@";
      int v9 = v12;
      uint32_t v10 = 58;
      goto LABEL_15;
    }
  }
}

- (void)setShouldEnableMLEnhance:(BOOL)a3 streamID:(unsigned __int16)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(VCMediaStreamGroup *)self streamGroupID] != 1935897189)
  {
    stateQueue = self->super.super._stateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__VCVideoStreamReceiveGroup_setShouldEnableMLEnhance_streamID___block_invoke;
    block[3] = &unk_1E6DB6E60;
    block[4] = self;
    BOOL v10 = a3;
    unsigned __int16 v9 = a4;
    dispatch_async(stateQueue, block);
  }
}

uint64_t __63__VCVideoStreamReceiveGroup_setShouldEnableMLEnhance_streamID___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 168);
  uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v7 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "stream"), "setShouldEnableMLEnhance:streamID:", *(unsigned __int8 *)(a1 + 42), *(unsigned __int16 *)(a1 + 40));
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v7 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)redundancyController:(id)a3 redundancyPercentageDidChange:(unsigned int)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (![+[VCDefaults sharedInstance] forceFECRepairStream])
  {
    stateQueue = self->super.super._stateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__VCVideoStreamReceiveGroup_redundancyController_redundancyPercentageDidChange___block_invoke;
    block[3] = &unk_1E6DB3F08;
    block[4] = self;
    unsigned int v8 = a4;
    dispatch_async(stateQueue, block);
  }
}

void __80__VCVideoStreamReceiveGroup_redundancyController_redundancyPercentageDidChange___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v5 = *(_DWORD *)(a1 + 40);
        *(_DWORD *)buf = 136315906;
        uint64_t v20 = v3;
        __int16 v21 = 2080;
        int v22 = "-[VCVideoStreamReceiveGroup redundancyController:redundancyPercentageDidChange:]_block_invoke";
        __int16 v23 = 1024;
        int v24 = 513;
        __int16 v25 = 1024;
        LODWORD(v26) = v5;
        uint64_t v6 = " [%s] %s:%d New redundancy percentage %d";
        uint64_t v7 = v4;
        uint32_t v8 = 34;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
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
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      long long v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        int v12 = *(_DWORD *)(a1 + 40);
        *(_DWORD *)buf = 136316418;
        uint64_t v20 = v9;
        __int16 v21 = 2080;
        int v22 = "-[VCVideoStreamReceiveGroup redundancyController:redundancyPercentageDidChange:]_block_invoke";
        __int16 v23 = 1024;
        int v24 = 513;
        __int16 v25 = 2112;
        uint64_t v26 = v2;
        __int16 v27 = 2048;
        uint64_t v28 = v11;
        __int16 v29 = 1024;
        int v30 = v12;
        uint64_t v6 = " [%s] %s:%d %@(%p) New redundancy percentage %d";
        uint64_t v7 = v10;
        uint32_t v8 = 54;
        goto LABEL_11;
      }
    }
  }
  uint64_t v13 = *(void *)(a1 + 32);
  if (*(_DWORD *)(a1 + 40))
  {
    if (*(unsigned char *)(v13 + 520)) {
      return;
    }
    char v14 = 1;
  }
  else
  {
    if (!*(unsigned char *)(v13 + 520)) {
      return;
    }
    char v14 = 0;
  }
  *(unsigned char *)(v13 + 520) = v14;
  uint64_t v15 = MEMORY[0x1E4E56580](*(void *)(a1 + 32) + 296);
  if (v15)
  {
    uint64_t v16 = *(void *)(a1 + 32);
    __int16 v17 = *(NSObject **)(v16 + 304);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __80__VCVideoStreamReceiveGroup_redundancyController_redundancyPercentageDidChange___block_invoke_52;
    v18[3] = &unk_1E6DB3E40;
    v18[4] = v16;
    v18[5] = v15;
    dispatch_async(v17, v18);
  }
}

void __80__VCVideoStreamReceiveGroup_redundancyController_redundancyPercentageDidChange___block_invoke_52(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (*(unsigned char *)(*(void *)(a1 + 32) + 520)) {
          int v5 = "Requesting";
        }
        else {
          int v5 = "Dismissing";
        }
        *(_DWORD *)uint64_t v13 = 136315906;
        *(void *)&v13[4] = v3;
        *(_WORD *)&v13[12] = 2080;
        *(void *)&v13[14] = "-[VCVideoStreamReceiveGroup redundancyController:redundancyPercentageDidChange:]_block_invoke";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 532;
        WORD2(v14) = 2080;
        *(void *)((char *)&v14 + 6) = v5;
        uint64_t v6 = " [%s] %s:%d %s video redundancy";
        uint64_t v7 = v4;
        uint32_t v8 = 38;
        goto LABEL_17;
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
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      long long v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        if (*(unsigned char *)(v11 + 520)) {
          int v12 = "Requesting";
        }
        else {
          int v12 = "Dismissing";
        }
        *(_DWORD *)uint64_t v13 = 136316418;
        *(void *)&v13[4] = v9;
        *(_WORD *)&v13[12] = 2080;
        *(void *)&v13[14] = "-[VCVideoStreamReceiveGroup redundancyController:redundancyPercentageDidChange:]_block_invoke";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 532;
        WORD2(v14) = 2112;
        *(void *)((char *)&v14 + 6) = v2;
        HIWORD(v14) = 2048;
        uint64_t v15 = v11;
        LOWORD(v16) = 2080;
        *(void *)((char *)&v16 + 2) = v12;
        uint64_t v6 = " [%s] %s:%d %@(%p) %s video redundancy";
        uint64_t v7 = v10;
        uint32_t v8 = 58;
LABEL_17:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, v13, v8);
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "streamGroup:didRequestRedundancy:", *(void *)(a1 + 32), *(unsigned __int8 *)(*(void *)(a1 + 32) + 520), *(_OWORD *)v13, *(void *)&v13[16], v14, v15, v16);
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

- (void)vcMediaStream:(id)a3 priorityDidChange:(unsigned __int8)a4
{
}

- (void)vcMediaStream:(id)a3 didReceiveFirstFrameWithTime:(id *)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  double v8 = NAN;
  double v8 = micro();
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__VCVideoStreamReceiveGroup_vcMediaStream_didReceiveFirstFrameWithTime___block_invoke;
  block[3] = &unk_1E6DB3EB8;
  block[4] = self;
  void block[5] = v7;
  dispatch_async(stateQueue, block);
  _Block_object_dispose(v7, 8);
}

uint64_t __72__VCVideoStreamReceiveGroup_vcMediaStream_didReceiveFirstFrameWithTime___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setFirstMediaFrameReceivedTime:*(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  double v2 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  v11.receiver = *(id *)(a1 + 32);
  v11.super_class = (Class)VCVideoStreamReceiveGroup;
  objc_msgSendSuper2(&v11, sel_finalizePerfTimersForFirstMediaFrameWithTime_, v2);
  int v3 = [*(id *)(*(void *)(a1 + 32) + 240) hasKey:6];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  if (v3)
  {
    uint64_t v6 = *(void *)(v5 + 8);
    double v7 = *(double *)(v6 + 24);
    if (v7 - *(double *)(v4 + 264) < 0.001)
    {
      *(double *)(v6 + 24) = v7 + 0.001;
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
    }
  }
  VCPerfTimingUtilsSetStopForKeyOnceWithTime(*(void **)(v4 + 240), 6, *(double *)(*(void *)(v5 + 8) + 24));
  [*(id *)(a1 + 32) reportParticipantsPerfTimings];
  double v8 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__VCVideoStreamReceiveGroup_vcMediaStream_didReceiveFirstFrameWithTime___block_invoke_2;
  v10[3] = &unk_1E6DB4630;
  v10[4] = v8;
  return [v8 callDelegateWithBlock:v10];
}

uint64_t __72__VCVideoStreamReceiveGroup_vcMediaStream_didReceiveFirstFrameWithTime___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 didReceiveFirstFrameForStreamGroup:*(void *)(a1 + 32)];
}

- (void)vcMediaStream:(id)a3 didSwitchFromStreamID:(unsigned __int16)a4 toStreamID:(unsigned __int16)a5
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__VCVideoStreamReceiveGroup_vcMediaStream_didSwitchFromStreamID_toStreamID___block_invoke;
  block[3] = &unk_1E6DB3F08;
  unsigned __int16 v7 = a5;
  block[4] = self;
  unsigned __int16 v8 = a4;
  dispatch_async(stateQueue, block);
}

uint64_t __76__VCVideoStreamReceiveGroup_vcMediaStream_didSwitchFromStreamID_toStreamID___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(a1 + 40)];
  if (objc_opt_class() != *(void *)(a1 + 32))
  {
    if (objc_opt_respondsToSelector()) {
      int v3 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      int v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_12;
    }
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    uint64_t v12 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void *)(v13 + 432);
    int v15 = *(unsigned __int16 *)(a1 + 40);
    *(_DWORD *)buf = 136316674;
    uint64_t v25 = v11;
    __int16 v26 = 2080;
    __int16 v27 = "-[VCVideoStreamReceiveGroup vcMediaStream:didSwitchFromStreamID:toStreamID:]_block_invoke";
    __int16 v28 = 1024;
    int v29 = 573;
    __int16 v30 = 2112;
    *(void *)uint64_t v31 = v3;
    *(_WORD *)&v31[8] = 2048;
    *(void *)&v31[10] = v13;
    __int16 v32 = 1024;
    int v33 = v15;
    __int16 v34 = 2112;
    uint64_t v35 = v14;
    unsigned __int16 v8 = " [%s] %s:%d %@(%p) Completed transition to streamId:%d (previous:%@). Opt out of old stream id if needed.";
    uint64_t v9 = v12;
    uint32_t v10 = 64;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = *(unsigned __int16 *)(a1 + 40);
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 432);
      *(_DWORD *)buf = 136316162;
      uint64_t v25 = v4;
      __int16 v26 = 2080;
      __int16 v27 = "-[VCVideoStreamReceiveGroup vcMediaStream:didSwitchFromStreamID:toStreamID:]_block_invoke";
      __int16 v28 = 1024;
      int v29 = 573;
      __int16 v30 = 1024;
      *(_DWORD *)uint64_t v31 = v6;
      *(_WORD *)&v31[4] = 2112;
      *(void *)&v31[6] = v7;
      unsigned __int16 v8 = " [%s] %s:%d Completed transition to streamId:%d (previous:%@). Opt out of old stream id if needed.";
      uint64_t v9 = v5;
      uint32_t v10 = 44;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
    }
  }
LABEL_12:
  long long v16 = *(unsigned char **)(a1 + 32);
  if (v16[497])
  {
    [v16 setOptedInStreamID:v2];
    *(unsigned char *)(*(void *)(a1 + 32) + 497) = 0;
    uint64_t v17 = *(void **)(a1 + 32);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __76__VCVideoStreamReceiveGroup_vcMediaStream_didSwitchFromStreamID_toStreamID___block_invoke_58;
    v22[3] = &unk_1E6DB4608;
    v22[4] = v17;
    HIDWORD(v18) = *(_DWORD *)(a1 + 40);
    LODWORD(v18) = HIDWORD(v18);
    int v23 = v18 >> 16;
    [v17 callDelegateWithBlock:v22];
    long long v16 = *(unsigned char **)(a1 + 32);
  }
  v16[448] = *(_WORD *)(a1 + 40) == 0;
  [*(id *)(a1 + 32) setActiveStreamID:v2];
  __int16 v19 = *(void **)(a1 + 32);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __76__VCVideoStreamReceiveGroup_vcMediaStream_didSwitchFromStreamID_toStreamID___block_invoke_2;
  v21[3] = &unk_1E6DB4630;
  v21[4] = v19;
  return [v19 callDelegateWithBlock:v21];
}

uint64_t __76__VCVideoStreamReceiveGroup_vcMediaStream_didSwitchFromStreamID_toStreamID___block_invoke_58(uint64_t a1, void *a2)
{
  return [a2 streamGroup:*(void *)(a1 + 32) didSwitchFromStreamID:*(unsigned __int16 *)(a1 + 40) toStreamID:*(unsigned __int16 *)(a1 + 42)];
}

uint64_t __76__VCVideoStreamReceiveGroup_vcMediaStream_didSwitchFromStreamID_toStreamID___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 didChangeReceivingStreamsForStreamGroup:*(void *)(a1 + 32)];
}

- (void)updateVideoExpected
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL isVideoExpected = self->_isVideoExpected;
  if (isVideoExpected != [(VCVideoStreamReceiveGroup *)self isVideoExpected])
  {
    self->_BOOL isVideoExpected = [(VCVideoStreamReceiveGroup *)self isVideoExpected];
    self->_lastVideoExpectationSwitch = micro();
    networkFeedbackController = self->super.super._networkFeedbackController;
    if (networkFeedbackController)
    {
      [(VCNetworkFeedbackController *)networkFeedbackController setIsVideoPaused:!self->_isVideoExpected];
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      int v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v18 = v5;
        __int16 v19 = 2080;
        uint64_t v20 = "-[VCVideoStreamReceiveGroup updateVideoExpected]";
        __int16 v21 = 1024;
        int v22 = 597;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d networkFeedbackController is nil in VCVideoStreamReceiveGroup", buf, 0x1Cu);
      }
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    mediaStreams = self->super.super._mediaStreams;
    uint64_t v8 = [(NSArray *)mediaStreams countByEnumeratingWithState:&v13 objects:v12 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(mediaStreams);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * i) setVideoExpected:self->_isVideoExpected];
        }
        uint64_t v9 = [(NSArray *)mediaStreams countByEnumeratingWithState:&v13 objects:v12 count:16];
      }
      while (v9);
    }
  }
}

- (void)setIsRemoteMediaStalled:(BOOL)a3 duration:(double)a4
{
  int v6 = self;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  BOOL isVideoDegraded = self->_isVideoDegraded;
  if (!a3 && self->_isVideoDegraded)
  {
    if (!self->_isVideoExpected) {
      goto LABEL_13;
    }
    BOOL isVideoDegraded = 1;
  }
  if (isVideoDegraded == a3 && self->_reportedDegradeStatus == a3
    || !self->_isVideoExpected
    || !self->super._optedInStreamID && !self->super._receivingEndToEndStream)
  {
    return;
  }
  if (!a3)
  {
LABEL_13:
    uint64_t v9 = 0;
    goto LABEL_14;
  }
  double v8 = micro();
  self = v6;
  if (v8 - v6->_lastVideoExpectationSwitch > 10.0)
  {
    uint64_t v9 = 1;
LABEL_14:
    [(VCVideoStreamReceiveGroup *)self setVideoDegraded:v9 duration:a4];
    v6->_BOOL isVideoDegraded = a3;
    return;
  }
  if ((VCVideoStreamReceiveGroup *)objc_opt_class() == v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        double lastVideoExpectationSwitch = v6->_lastVideoExpectationSwitch;
        int v20 = 136316418;
        uint64_t v21 = v11;
        __int16 v22 = 2080;
        uint64_t v23 = "-[VCVideoStreamReceiveGroup setIsRemoteMediaStalled:duration:]";
        __int16 v24 = 1024;
        int v25 = 630;
        __int16 v26 = 2048;
        double v27 = v8;
        __int16 v28 = 2048;
        double v29 = lastVideoExpectationSwitch;
        __int16 v30 = 2048;
        double v31 = v8 - lastVideoExpectationSwitch;
        long long v14 = " [%s] %s:%d We are experiencing a video stall too soon after we switch video on. Ignoring... currentTime=%"
              "f lastVideoExpectationSwitch=%f diff=%f";
        long long v15 = v12;
        uint32_t v16 = 58;
LABEL_26:
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v20, v16);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v10 = (__CFString *)[(VCVideoStreamReceiveGroup *)v6 performSelector:sel_logPrefix];
    }
    else {
      uint64_t v10 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      uint64_t v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        double v19 = v6->_lastVideoExpectationSwitch;
        int v20 = 136316930;
        uint64_t v21 = v17;
        __int16 v22 = 2080;
        uint64_t v23 = "-[VCVideoStreamReceiveGroup setIsRemoteMediaStalled:duration:]";
        __int16 v24 = 1024;
        int v25 = 630;
        __int16 v26 = 2112;
        double v27 = *(double *)&v10;
        __int16 v28 = 2048;
        double v29 = *(double *)&v6;
        __int16 v30 = 2048;
        double v31 = v8;
        __int16 v32 = 2048;
        double v33 = v19;
        __int16 v34 = 2048;
        double v35 = v8 - v19;
        long long v14 = " [%s] %s:%d %@(%p) We are experiencing a video stall too soon after we switch video on. Ignoring... curren"
              "tTime=%f lastVideoExpectationSwitch=%f diff=%f";
        long long v15 = v18;
        uint32_t v16 = 78;
        goto LABEL_26;
      }
    }
  }
}

- (void)vcMediaStream:(id)a3 remoteMediaStalled:(BOOL)a4 duration:(double)a5
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__VCVideoStreamReceiveGroup_vcMediaStream_remoteMediaStalled_duration___block_invoke;
  block[3] = &unk_1E6DB7490;
  BOOL v7 = a4;
  *(double *)&void block[6] = a5;
  block[4] = self;
  void block[5] = a3;
  dispatch_async(stateQueue, block);
}

uint64_t __71__VCVideoStreamReceiveGroup_vcMediaStream_remoteMediaStalled_duration___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsRemoteMediaStalled:*(unsigned __int8 *)(a1 + 56) duration:*(double *)(a1 + 48)];
  uint64_t result = [*(id *)(a1 + 32) checkForExtendedPoorConnectionWithStallDuration:*(double *)(a1 + 48)];
  if (*(unsigned char *)(a1 + 56))
  {
    int v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    double v5 = *(double *)(a1 + 48);
    return [v3 checkForAndReportPoorConnectionDespiteVideoReceivedForVideoStream:v4 stallDuration:v5];
  }
  return result;
}

- (void)vcMediaStream:(id)a3 requestKeyFrameGenerationWithStreamID:(unsigned __int16)a4 firType:(int)a5
{
  int v6 = a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if ((VCVideoStreamReceiveGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_12;
    }
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 136315906;
    uint64_t v22 = v9;
    __int16 v23 = 2080;
    __int16 v24 = "-[VCVideoStreamReceiveGroup vcMediaStream:requestKeyFrameGenerationWithStreamID:firType:]";
    __int16 v25 = 1024;
    int v26 = 649;
    __int16 v27 = 1024;
    LODWORD(v28) = v6;
    uint64_t v11 = " [%s] %s:%d Requesting streamID to generate a key frame %hu";
    uint64_t v12 = v10;
    uint32_t v13 = 34;
    goto LABEL_11;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v8 = (__CFString *)[(VCVideoStreamReceiveGroup *)self performSelector:sel_logPrefix];
  }
  else {
    uint64_t v8 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    long long v15 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v22 = v14;
      __int16 v23 = 2080;
      __int16 v24 = "-[VCVideoStreamReceiveGroup vcMediaStream:requestKeyFrameGenerationWithStreamID:firType:]";
      __int16 v25 = 1024;
      int v26 = 649;
      __int16 v27 = 2112;
      __int16 v28 = v8;
      __int16 v29 = 2048;
      __int16 v30 = self;
      __int16 v31 = 1024;
      int v32 = v6;
      uint64_t v11 = " [%s] %s:%d %@(%p) Requesting streamID to generate a key frame %hu";
      uint64_t v12 = v15;
      uint32_t v13 = 54;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
    }
  }
LABEL_12:
  uint64_t v16 = MEMORY[0x1E4E56580](&self->super.super._delegate);
  if (v16)
  {
    delegateQueue = self->super.super._delegateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __89__VCVideoStreamReceiveGroup_vcMediaStream_requestKeyFrameGenerationWithStreamID_firType___block_invoke;
    block[3] = &unk_1E6DB8AF8;
    block[4] = v16;
    void block[5] = self;
    __int16 v20 = v6;
    int v19 = a5;
    dispatch_async(delegateQueue, block);
  }
}

void __89__VCVideoStreamReceiveGroup_vcMediaStream_requestKeyFrameGenerationWithStreamID_firType___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) streamGroup:*(void *)(a1 + 40) requestKeyFrameGenerationWithStreamID:*(unsigned __int16 *)(a1 + 52) firType:*(unsigned int *)(a1 + 48)];
  uint64_t v2 = *(const void **)(a1 + 32);

  CFRelease(v2);
}

- (void)checkForExtendedPoorConnectionWithStallDuration:(double)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (*(&self->_isVideoDegraded + 1)
    && self->_isVideoExpected
    && (self->super._optedInStreamID || self->super._receivingEndToEndStream))
  {
    double v5 = micro();
    double lastRecordedExtendedPoorConnection = self->_lastRecordedExtendedPoorConnection;
    BOOL v7 = lastRecordedExtendedPoorConnection != 0.0;
    if (v5 - lastRecordedExtendedPoorConnection > 30.0) {
      BOOL v7 = 0;
    }
    if (a3 > 30.0 && self->_isVideoDegradedStartTime != 0.0 && !v7)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        uint64_t v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          unint64_t idsParticipantID = self->super.super._idsParticipantID;
          double isVideoDegradedStartTime = self->_isVideoDegradedStartTime;
          int v13 = 136316674;
          uint64_t v14 = v8;
          __int16 v15 = 2080;
          uint64_t v16 = "-[VCVideoStreamReceiveGroup checkForExtendedPoorConnectionWithStallDuration:]";
          __int16 v17 = 1024;
          int v18 = 671;
          __int16 v19 = 2048;
          unint64_t v20 = idsParticipantID;
          __int16 v21 = 2048;
          double v22 = a3;
          __int16 v23 = 2048;
          double v24 = v5;
          __int16 v25 = 2048;
          double v26 = isVideoDegradedStartTime;
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ExtendedPoorConnection detected for idsParticipantID=%llu duration=%f now=%f  isVideoDegradedStartTime=%f", (uint8_t *)&v13, 0x44u);
        }
      }
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      CFDictionarySetValue(Mutable, @"SymptomReporterOptionalKeySessionID", self->super.super._sessionUUID);
      CFDictionarySetValue(Mutable, @"SymptomReporterOptionalKeyParticipantID", (const void *)[NSNumber numberWithUnsignedLongLong:self->super.super._idsParticipantID]);
      [(VCObject *)self reportingAgent];
      reportingSymptom();
      CFRelease(Mutable);
      self->_double lastRecordedExtendedPoorConnection = v5;
    }
  }
}

- (void)collectAndLogChannelMetrics:(id *)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  mediaStreams = self->super.super._mediaStreams;
  uint64_t v6 = [(NSArray *)mediaStreams countByEnumeratingWithState:&v63 objects:v62 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v64;
    *(void *)&long long v7 = 136317698;
    long long v33 = v7;
    __int16 v34 = mediaStreams;
    double v35 = a3;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v64 != v9) {
          objc_enumerationMutation(mediaStreams);
        }
        uint64_t v11 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        if (objc_msgSend(v11, "state", v33) == 2)
        {
          uint64_t v61 = 0;
          memset(v60, 0, sizeof(v60));
          [v11 collectRxChannelMetrics:v60];
          VCMediaChannelMetrics_Sum((uint64_t)a3, (uint64_t)v60);
          if ((VCVideoStreamReceiveGroup *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
            {
              uint64_t v24 = VRTraceErrorLogLevelToCSTR();
              __int16 v25 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
              {
                long long v38 = FourccToCStr([(VCMediaStreamGroup *)self streamGroupID]);
                int v26 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "defaultStreamConfig"), "multiwayConfig"), "idsStreamID");
                int v27 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "defaultStreamConfig"), "multiwayConfig"), "repairedStreamID");
                int v28 = v60[0];
                long long v29 = v60[2];
                __int16 v30 = NSStringFromSize(*(NSSize *)((char *)&v60[2] + 8));
                unint64_t syncUpdateCalled = self->_syncUpdateCalled;
                double displayLatency = self->_displayLatency;
                *(_DWORD *)buf = v33;
                uint64_t v40 = v24;
                __int16 v41 = 2080;
                long long v42 = "-[VCVideoStreamReceiveGroup collectAndLogChannelMetrics:]";
                __int16 v43 = 1024;
                int v44 = 687;
                __int16 v45 = 2080;
                __int16 v46 = v38;
                __int16 v47 = 1024;
                *(_DWORD *)v48 = v26;
                *(_WORD *)&v48[4] = 1024;
                *(_DWORD *)&v48[6] = v27;
                LOWORD(v49) = 1024;
                *(_DWORD *)((char *)&v49 + 2) = v28;
                mediaStreams = v34;
                a3 = v35;
                HIWORD(v49) = 2048;
                uint64_t v50 = v29;
                *(_WORD *)long long v51 = 2112;
                *(void *)&v51[2] = v30;
                __int16 v52 = 2048;
                unint64_t v53 = syncUpdateCalled;
                __int16 v54 = 2048;
                double v55 = displayLatency;
                __int16 v21 = v25;
                double v22 = " [%s] %s:%d Health Monitor for Video Stream Receive GroupID=%s StreamID[main:%u repair:%u] Video[%"
                      "ukbps %4.1ffps] VideoResolution=%@ syncUpdateCalled=%ld videoDisplayLatency=%f";
                uint32_t v23 = 96;
                goto LABEL_16;
              }
            }
          }
          else
          {
            uint64_t v12 = &stru_1F3D3E450;
            if (objc_opt_respondsToSelector()) {
              uint64_t v12 = (__CFString *)[(VCVideoStreamReceiveGroup *)self performSelector:sel_logPrefix];
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
            {
              uint64_t v13 = VRTraceErrorLogLevelToCSTR();
              uint64_t v14 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v37 = FourccToCStr([(VCMediaStreamGroup *)self streamGroupID]);
                int v36 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "defaultStreamConfig"), "multiwayConfig"), "idsStreamID");
                int v15 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "defaultStreamConfig"), "multiwayConfig"), "repairedStreamID");
                int v16 = v60[0];
                unint64_t v17 = *(void *)&v60[2];
                int v18 = NSStringFromSize(*(NSSize *)((char *)&v60[2] + 8));
                unint64_t v19 = self->_syncUpdateCalled;
                double v20 = self->_displayLatency;
                *(_DWORD *)buf = 136318210;
                uint64_t v40 = v13;
                __int16 v41 = 2080;
                long long v42 = "-[VCVideoStreamReceiveGroup collectAndLogChannelMetrics:]";
                __int16 v43 = 1024;
                int v44 = 687;
                __int16 v45 = 2112;
                __int16 v46 = v12;
                __int16 v47 = 2048;
                *(void *)v48 = self;
                *(_WORD *)&v48[8] = 2080;
                long long v49 = v37;
                LOWORD(v50) = 1024;
                *(_DWORD *)((char *)&v50 + 2) = v36;
                HIWORD(v50) = 1024;
                *(_DWORD *)long long v51 = v15;
                *(_WORD *)&v51[4] = 1024;
                *(_DWORD *)&v51[6] = v16;
                __int16 v52 = 2048;
                unint64_t v53 = v17;
                mediaStreams = v34;
                a3 = v35;
                __int16 v54 = 2112;
                double v55 = *(double *)&v18;
                __int16 v56 = 2048;
                unint64_t v57 = v19;
                __int16 v58 = 2048;
                double v59 = v20;
                __int16 v21 = v14;
                double v22 = " [%s] %s:%d %@(%p) Health Monitor for Video Stream Receive GroupID=%s StreamID[main:%u repair:%u] "
                      "Video[%ukbps %4.1ffps] VideoResolution=%@ syncUpdateCalled=%ld videoDisplayLatency=%f";
                uint32_t v23 = 116;
LABEL_16:
                _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, v22, buf, v23);
                continue;
              }
            }
          }
        }
      }
      uint64_t v8 = [(NSArray *)mediaStreams countByEnumeratingWithState:&v63 objects:v62 count:16];
    }
    while (v8);
  }
}

- (void)checkForAndReportPoorConnectionDespiteVideoReceivedForVideoStream:(id)a3 stallDuration:(double)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (*(&self->_isVideoDegraded + 1)
    && self->_isVideoExpected
    && (self->super._optedInStreamID || self->super._receivingEndToEndStream))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [a3 activeVideoStallDuration];
      double v8 = vabdd_f64(v7, a4);
      [a3 videoRxFrameRate];
      double v10 = v9;
      BOOL v11 = self->_isVideoDegradedStartTime == 0.0 || v8 <= 0.5;
      if (!v11
        && a4 > 5.0
        && self->_didReportSymptomOnPoorConnectionDespiteVideoIsReceived == 0.0
        && v9 > 0.0
        && [(VCMediaStreamGroup *)self streamGroupID] == 1667329381)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          uint64_t v12 = VRTraceErrorLogLevelToCSTR();
          uint64_t v13 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            unint64_t idsParticipantID = self->super.super._idsParticipantID;
            double isVideoDegradedStartTime = self->_isVideoDegradedStartTime;
            int v17 = 136316674;
            uint64_t v18 = v12;
            __int16 v19 = 2080;
            double v20 = "-[VCVideoStreamReceiveGroup checkForAndReportPoorConnectionDespiteVideoReceivedForVideoStream:stallDuration:]";
            __int16 v21 = 1024;
            int v22 = 705;
            __int16 v23 = 2048;
            unint64_t v24 = idsParticipantID;
            __int16 v25 = 2048;
            double v26 = a4;
            __int16 v27 = 2048;
            double v28 = isVideoDegradedStartTime;
            __int16 v29 = 2048;
            double v30 = v10;
            _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Poor connection detected for idsParticipantID=%llu duration=%2.3f isVideoDegradedStartTime=%2.3f videoRxFramerate[past 5s]=%2.3f", (uint8_t *)&v17, 0x44u);
          }
        }
        Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        CFDictionarySetValue(Mutable, @"SymptomReporterOptionalKeySessionID", self->super.super._sessionUUID);
        CFDictionarySetValue(Mutable, @"SymptomReporterOptionalKeyParticipantID", (const void *)[NSNumber numberWithUnsignedLongLong:self->super.super._idsParticipantID]);
        [(VCObject *)self reportingAgent];
        reportingSymptom();
        CFRelease(Mutable);
        self->_didReportSymptomOnPoorConnectionDespiteVideoIsReceived = 1.0;
      }
    }
  }
}

- (void)mediaStream:(id)a3 didReceiveNewMediaKeyIndex:(id)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)VCVideoStreamReceiveGroup;
  -[VCMediaStreamGroup mediaStream:didReceiveNewMediaKeyIndex:](&v6, sel_mediaStream_didReceiveNewMediaKeyIndex_, a3);
  [(VCMediaStreamGroup *)self setupPerfTimersWithMediaKeyIndex:a4 perfTimerIndexToStart:6];
}

- (BOOL)isRemoteVideoPaused
{
  return self->_isRemoteMediaStalled;
}

- (unsigned)videoQuality
{
  return self->_remoteVideoPaused;
}

- (void)setVideoQuality:(unsigned __int8)a3
{
  self->_remoteVideoPaused = a3;
}

- (BOOL)isRemoteMediaStalled
{
  return self->_isVideoDegraded;
}

- (void)setIsRemoteMediaStalled:(BOOL)a3
{
  self->_BOOL isVideoDegraded = a3;
}

- (unsigned)visibilityIndex
{
  return self->_visibilityIndex;
}

- (BOOL)isRemoteVideoEnabled
{
  return self->_remoteVideoEnabled;
}

- (void)setupRedundancyController
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v4 = v0;
  double v5 = "-[VCVideoStreamReceiveGroup setupRedundancyController]";
  __int16 v6 = 1024;
  int v7 = 187;
  __int16 v8 = 2112;
  uint64_t v9 = v1;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@", v3, 0x26u);
}

- (void)isVideoExpected
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v6 = [a2 state];
  int v7 = a2[476];
  [a2 isVisible];
  int v10 = 136316418;
  uint64_t v11 = a1;
  OUTLINED_FUNCTION_0();
  int v12 = 198;
  __int16 v13 = v8;
  int v14 = v6;
  __int16 v15 = v8;
  int v16 = v7;
  __int16 v17 = v8;
  int v18 = v9;
  _os_log_debug_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_DEBUG, " [%s] %s:%d state:%d remoteVideoPaused:%d isVisible:%d", (uint8_t *)&v10, 0x2Eu);
}

void __43__VCVideoStreamReceiveGroup_setSyncSource___block_invoke_cold_1(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v5 = [*a2 state];
  int v6 = 136315906;
  uint64_t v7 = a1;
  __int16 v8 = 2080;
  int v9 = "-[VCVideoStreamReceiveGroup setSyncSource:]_block_invoke";
  __int16 v10 = 1024;
  int v11 = 226;
  __int16 v12 = 1024;
  int v13 = v5;
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Stream group must be stopped when setting sync source. state=%d", (uint8_t *)&v6, 0x22u);
}

void __48__VCVideoStreamReceiveGroup_setActiveStreamIDs___block_invoke_cold_1()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v4 = 376;
  __int16 v5 = v0;
  int v6 = 2;
  __int16 v7 = 2112;
  uint64_t v8 = v1;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Trying to opt into more than %d video streams! Streams:%@", v3, 0x2Cu);
}

@end