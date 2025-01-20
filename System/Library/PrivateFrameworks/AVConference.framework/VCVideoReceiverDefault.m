@interface VCVideoReceiverDefault
- (BOOL)initializeDisplayLink;
- (BOOL)receivedFirstRemoteFrame;
- (BOOL)shouldEnableFaceZoom;
- (BOOL)shouldUpdateRemoteScreenAttributes;
- (VCVideoReceiverDefault)initWithConfig:(tagVCVideoReceiverConfig *)a3 delegate:(id)a4 delegateFunctions:(const tagVCVideoReceiverDelegateRealtimeInstanceVTable *)a5 reportingAgent:(opaqueRTCReporting *)a6 statisticsCollector:(id)a7 transmitterHandle:(tagHANDLE *)a8;
- (VideoAttributes)remoteVideoAttributes;
- (double)activeVideoStallDuration;
- (double)lastReceivedVideoRTCPPacketTime;
- (double)lastReceivedVideoRTPPacketTime;
- (double)roundTripTime;
- (double)videoReceiverRxFrameRate;
- (float)lastLastVideoStallDuration;
- (int)mode;
- (int)oneToOneStreamIndex;
- (tagVCVideoReceiverConfig)videoReceiverConfig;
- (unsigned)lastDisplayedFrameRTPTimestamp;
- (void)cleanUpDisplayLink;
- (void)collectChannelMetrics:(id *)a3 interval:(float)a4;
- (void)dealloc;
- (void)didSwitchFromStreamID:(unsigned __int16)a3 toStreamID:(unsigned __int16)a4;
- (void)handleActiveConnectionChange:(id)a3;
- (void)handleKeyFrameRequestWithSizeAndFistMBs:(unsigned __int16 *)a3 count:(int)a4 didReceiveRTCPFB:(BOOL)a5 didReceiveFIR:(BOOL)a6;
- (void)handleRequestingKeyFrameGenerationWithStreamID:(unsigned __int16)a3 firType:(int)a4;
- (void)initializeDisplayLink;
- (void)setDeferredAssemblyEnabled:(BOOL)a3;
- (void)setEnableRateAdaptation:(BOOL)a3 maxBitrate:(unsigned int)a4 minBitrate:(unsigned int)a5 adaptationInterval:(double)a6;
- (void)setFeedbackDelegate:(id)a3;
- (void)setJitterBufferMode:(int)a3;
- (void)setLooseAVSyncEnabled:(BOOL)a3;
- (void)setMode:(int)a3;
- (void)setReceivedFirstRemoteFrame:(BOOL)a3;
- (void)setRemoteVideoAttributes:(id)a3;
- (void)setShouldEnableFaceZoom:(BOOL)a3;
- (void)setShouldEnableMLEnhance:(BOOL)a3 streamID:(unsigned __int16)a4;
- (void)setShouldUpdateRemoteScreenAttributes:(BOOL)a3;
- (void)setSynchronizer:(id)a3;
- (void)setTargetStreamID:(unsigned __int16)a3;
- (void)setUpCannedInjector:(tagVCVideoReceiverConfig *)a3;
- (void)setUpRemoteAspectRatios;
- (void)setUpRemoteAspectRatiosForPayload:(int)a3;
- (void)setUpRemoteAspectRatiosFromFreatureListString:(const char *)a3;
- (void)setVideoExpected:(BOOL)a3;
- (void)setVideoReceiverConfig:(tagVCVideoReceiverConfig *)a3;
- (void)startVideo;
- (void)stopVideo;
- (void)updateSourcePlayoutTime:(const tagVCMediaTime *)a3;
- (void)videoReceiverRxFrameRate;
@end

@implementation VCVideoReceiverDefault

- (VCVideoReceiverDefault)initWithConfig:(tagVCVideoReceiverConfig *)a3 delegate:(id)a4 delegateFunctions:(const tagVCVideoReceiverDelegateRealtimeInstanceVTable *)a5 reportingAgent:(opaqueRTCReporting *)a6 statisticsCollector:(id)a7 transmitterHandle:(tagHANDLE *)a8
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  v48.receiver = self;
  v48.super_class = (Class)VCVideoReceiverDefault;
  v12 = [(VCVideoReceiverBase *)&v48 initWithDelegate:a4 delegateFunctions:a5];
  v13 = v12;
  if (!v12) {
    return v13;
  }
  p_videoReceiverConfig = &v12->_videoReceiverConfig;
  memcpy(&v12->_videoReceiverConfig, a3, sizeof(v12->_videoReceiverConfig));
  v13->super._vTable.setExternalOutputLatency = _VCVideoReceiverDefault_SetExternalOutputLatency;
  participantId = v13->_videoReceiverConfig.participantId;
  if (participantId) {
    CFRetain(participantId);
  }
  sessionId = v13->_videoReceiverConfig.sessionId;
  if (sessionId) {
    CFRetain(sessionId);
  }
  v13->_BOOL notifyDelegateVideoAttributeChanges = v13->_videoReceiverConfig.mode == 0;
  mediaControlInfoGenerator = a3->mediaControlInfoGenerator;
  if (mediaControlInfoGenerator) {
    mediaControlInfoGenerator = (void *)CFRetain(mediaControlInfoGenerator);
  }
  v13->_controlInfoGenerator = mediaControlInfoGenerator;
  if (p_videoReceiverConfig->streamCount)
  {
    unint64_t v18 = 0;
    p_sframeCryptor = (CFTypeRef *)&v13->_videoReceiverConfig.streamConfigs[0].sframeCryptor;
    do
    {
      v20 = *(p_sframeCryptor - 2);
      if (v20) {
        CFRetain(v20);
      }
      if (*p_sframeCryptor) {
        CFRetain(*p_sframeCryptor);
      }
      ++v18;
      p_sframeCryptor += 14;
    }
    while (v18 < p_videoReceiverConfig->streamCount);
  }
  [(VCVideoReceiverDefault *)v13 setUpRemoteAspectRatios];
  [(VCVideoReceiverDefault *)v13 setUpCannedInjector:a3];
  a3->callbackContext = v13;
  a3->remoteFrameCallback = _VCVideoReceiverDefault_RemoteFrameCallback;
  a3->sampleBufferCallback = _VCVideoReceiverDefault_SampleBufferCallback;
  a3->streamSwitchCallback = streamSwitchCallback;
  a3->keyFrameGenerationCallback = keyFrameGenerationCallback;
  a3->ackLTRFrameCallback = _VCVideoReceiverDefault_ackLTRWithTS;
  a3->sendLTRAckCallback = _VCVideoReceiverDefault_sendLTRAckWithTS;
  a3->modeSwitchCallback = _VCVideoReceiverDefault_ModeSwitchCallback;
  a3->videoStallPercentageThreshold = objc_msgSend(+[GKSConnectivitySettings readStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "readStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-reporting-video-stall-percentage-symptom-threshold", 0, &unk_1F3DC4650, 0), "intValue");
  char v21 = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-video-enable-late-frame-recovery", @"enableLateVideoFrameRecovery", MEMORY[0x1E4F1CC38], 0), "BOOLValue");
  BOOL isLateFrameRecoveryEnabled = 0;
  if (v21) {
    BOOL isLateFrameRecoveryEnabled = a3->isLateFrameRecoveryEnabled;
  }
  a3->BOOL isLateFrameRecoveryEnabled = isLateFrameRecoveryEnabled;
  if ([+[VCDefaults sharedInstance] isReceiverTestVerificationEnabled])
  {
    v13->_validationContext = objc_alloc_init(VCVideoHardwareDumpCollector);
  }
  p_videoReceiverint Handle = &v13->_videoReceiverHandle;
  int Handle = VideoReceiver_CreateHandle((uint64_t *)&v13->_videoReceiverHandle, (uint64_t)a3, a6, 0, a7);
  if ((VCVideoReceiverDefault *)objc_opt_class() == v13)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v26 = VRTraceErrorLogLevelToCSTR();
      v27 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL notifyDelegateVideoAttributeChanges = v13->_notifyDelegateVideoAttributeChanges;
        int mode = v13->_videoReceiverConfig.mode;
        v30 = *p_videoReceiverHandle;
        *(_DWORD *)buf = 136316674;
        uint64_t v50 = v26;
        __int16 v51 = 2080;
        v52 = "-[VCVideoReceiverDefault initWithConfig:delegate:delegateFunctions:reportingAgent:statisticsCollector:transmitterHandle:]";
        __int16 v53 = 1024;
        int v54 = 179;
        __int16 v55 = 1024;
        *(_DWORD *)v56 = mode;
        *(_WORD *)&v56[4] = 1024;
        *(_DWORD *)&v56[6] = notifyDelegateVideoAttributeChanges;
        *(_WORD *)&v56[10] = 1024;
        *(_DWORD *)&v56[12] = v30;
        *(_WORD *)&v56[16] = 2048;
        *(void *)&v56[18] = v13;
        v31 = " [%s] %s:%d mode=%d, _notifyDelegateVideoAttributeChanges=%d _videoReceiverHandle=0x%x videoReceiver=%p";
        v32 = v27;
        uint32_t v33 = 56;
LABEL_29:
        _os_log_impl(&dword_1E1EA4000, v32, OS_LOG_TYPE_DEFAULT, v31, buf, v33);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v25 = (__CFString *)[(VCVideoReceiverDefault *)v13 performSelector:sel_logPrefix];
    }
    else {
      v25 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v34 = VRTraceErrorLogLevelToCSTR();
      v35 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v36 = v13->_videoReceiverConfig.mode;
        BOOL v37 = v13->_notifyDelegateVideoAttributeChanges;
        v38 = *p_videoReceiverHandle;
        *(_DWORD *)buf = 136317186;
        uint64_t v50 = v34;
        __int16 v51 = 2080;
        v52 = "-[VCVideoReceiverDefault initWithConfig:delegate:delegateFunctions:reportingAgent:statisticsCollector:transmitterHandle:]";
        __int16 v53 = 1024;
        int v54 = 179;
        __int16 v55 = 2112;
        *(void *)v56 = v25;
        *(_WORD *)&v56[8] = 2048;
        *(void *)&v56[10] = v13;
        *(_WORD *)&v56[18] = 1024;
        *(_DWORD *)&v56[20] = v36;
        *(_WORD *)&v56[24] = 1024;
        BOOL v57 = v37;
        __int16 v58 = 1024;
        int v59 = (int)v38;
        __int16 v60 = 2048;
        v61 = v13;
        v31 = " [%s] %s:%d %@(%p) mode=%d, _notifyDelegateVideoAttributeChanges=%d _videoReceiverHandle=0x%x videoReceiver=%p";
        v32 = v35;
        uint32_t v33 = 76;
        goto LABEL_29;
      }
    }
  }
  if ((Handle & 0x80000000) == 0)
  {
    v13->super._rtpTimestampRate = a3->videoTSRate;
    v13->_videoTransmitterint Handle = a8;
    v13->_forceZeroRegionOfInterestOrigin = a3->forceZeroRegionOfInterestOrigin;
    int v39 = [(VCVideoReceiverDefault *)v13 oneToOneStreamIndex];
    if (a3->isReceiverSideVCRCFeedbackEnabled)
    {
      rtpint Handle = a3->streamConfigs[v39].rtpHandle;
      if (rtpHandle == (tagHANDLE *)0xFFFFFFFFLL)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v45 = VRTraceErrorLogLevelToCSTR();
          v46 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCVideoReceiverDefault initWithConfig:delegate:delegateFunctions:reportingAgent:statisticsCollector:transmitterHandle:](v45, (uint64_t *)&v13->_videoReceiverHandle, v46);
          }
        }
      }
      else
      {
        v13->_rateAdaptation = (VCVideoStreamRateAdaptationFeedbackOnly *)a3->rateAdaptation;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v41 = VRTraceErrorLogLevelToCSTR();
          v42 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            v43 = *p_videoReceiverHandle;
            rateAdaptation = v13->_rateAdaptation;
            *(_DWORD *)buf = 136316418;
            uint64_t v50 = v41;
            __int16 v51 = 2080;
            v52 = "-[VCVideoReceiverDefault initWithConfig:delegate:delegateFunctions:reportingAgent:statisticsCollector:"
                  "transmitterHandle:]";
            __int16 v53 = 1024;
            int v54 = 195;
            __int16 v55 = 1024;
            *(_DWORD *)v56 = v43;
            *(_WORD *)&v56[4] = 2048;
            *(void *)&v56[6] = rateAdaptation;
            *(_WORD *)&v56[14] = 1024;
            *(_DWORD *)&v56[16] = rtpHandle;
            _os_log_impl(&dword_1E1EA4000, v42, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d init video receiver 0x%x and rateAdaptation %p with rtp handle 0x%x", buf, 0x32u);
          }
        }
      }
    }
  }
  return v13;
}

- (void)setUpCannedInjector:(tagVCVideoReceiverConfig *)a3
{
  if ([+[VCDefaults sharedInstance] useCannedVideoPackets])
  {
    id v6 = (id)VCDefaults_CopyStringValueForKey(@"cannedVideoPacketFile");
    v5 = [[VCCannedVideoPacketSource alloc] initWithMode:[+[VCDefaults sharedInstance] cannedVideoPacketMode] filePath:v6];
    self->_cannedPacketSource = v5;
    a3->cannedReplayContext = v5;
  }
}

- (void)setMode:(int)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  self->_videoReceiverConfig.int mode = a3;
  self->_BOOL notifyDelegateVideoAttributeChanges = a3 == 0;
  self->_pendingVideoAttributesUpdateOnModeChange = 1;
  if ((VCVideoReceiverDefault *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315906;
        uint64_t v14 = v6;
        __int16 v15 = 2080;
        v16 = "-[VCVideoReceiverDefault setMode:]";
        __int16 v17 = 1024;
        int v18 = 220;
        __int16 v19 = 1024;
        LODWORD(v20) = a3;
        v8 = " [%s] %s:%d New mode=%d";
        v9 = v7;
        uint32_t v10 = 34;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v5 = (__CFString *)[(VCVideoReceiverDefault *)self performSelector:sel_logPrefix];
    }
    else {
      v5 = &stru_1F3D3E450;
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
        v16 = "-[VCVideoReceiverDefault setMode:]";
        __int16 v17 = 1024;
        int v18 = 220;
        __int16 v19 = 2112;
        v20 = v5;
        __int16 v21 = 2048;
        v22 = self;
        __int16 v23 = 1024;
        int v24 = a3;
        v8 = " [%s] %s:%d %@(%p) New mode=%d";
        v9 = v12;
        uint32_t v10 = 54;
        goto LABEL_11;
      }
    }
  }
}

- (int)mode
{
  return self->_videoReceiverConfig.mode;
}

- (void)setFeedbackDelegate:(id)a3
{
}

- (int)oneToOneStreamIndex
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  p_videoReceiverConfig = &self->_videoReceiverConfig;
  if (self->_videoReceiverConfig.mode || (uint64_t streamCount = p_videoReceiverConfig->streamCount, (int)streamCount < 1))
  {
LABEL_2:
    LODWORD(v4) = 0;
  }
  else
  {
    uint64_t v4 = 0;
    p_isOneToOne = &self->_videoReceiverConfig.streamConfigs[0].isOneToOne;
    while (1)
    {
      BOOL v8 = *p_isOneToOne;
      p_isOneToOne += 112;
      if (v8) {
        break;
      }
      if (streamCount == ++v4) {
        goto LABEL_2;
      }
    }
  }
  if ((VCVideoReceiverDefault *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint32_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int mode = p_videoReceiverConfig->mode;
        unsigned int v12 = p_videoReceiverConfig->streamCount;
        int v21 = 136316418;
        uint64_t v22 = v9;
        __int16 v23 = 2080;
        int v24 = "-[VCVideoReceiverDefault oneToOneStreamIndex]";
        __int16 v25 = 1024;
        int v26 = 243;
        __int16 v27 = 1024;
        *(_DWORD *)v28 = mode;
        *(_WORD *)&v28[4] = 1024;
        *(_DWORD *)&v28[6] = v12;
        LOWORD(v29) = 1024;
        *(_DWORD *)((char *)&v29 + 2) = v4;
        int v13 = " [%s] %s:%d mode=%d, streamCount=%d, streamIndex=%d";
        uint64_t v14 = v10;
        uint32_t v15 = 46;
LABEL_18:
        _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v21, v15);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v5 = (__CFString *)[(VCVideoReceiverDefault *)self performSelector:sel_logPrefix];
    }
    else {
      v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      __int16 v17 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v18 = p_videoReceiverConfig->mode;
        unsigned int v19 = p_videoReceiverConfig->streamCount;
        int v21 = 136316930;
        uint64_t v22 = v16;
        __int16 v23 = 2080;
        int v24 = "-[VCVideoReceiverDefault oneToOneStreamIndex]";
        __int16 v25 = 1024;
        int v26 = 243;
        __int16 v27 = 2112;
        *(void *)v28 = v5;
        *(_WORD *)&v28[8] = 2048;
        v29 = self;
        __int16 v30 = 1024;
        int v31 = v18;
        __int16 v32 = 1024;
        unsigned int v33 = v19;
        __int16 v34 = 1024;
        int v35 = v4;
        int v13 = " [%s] %s:%d %@(%p) mode=%d, streamCount=%d, streamIndex=%d";
        uint64_t v14 = v17;
        uint32_t v15 = 66;
        goto LABEL_18;
      }
    }
  }
  return v4;
}

- (void)setUpRemoteAspectRatios
{
  uint64_t v3 = +[VCVideoFeatureListStringHelper defaultPayload:self->_videoReceiverConfig.streamConfigs[[(VCVideoReceiverDefault *)self oneToOneStreamIndex]].featureListStrings];

  [(VCVideoReceiverDefault *)self setUpRemoteAspectRatiosForPayload:v3];
}

- (void)setUpRemoteAspectRatiosForPayload:(int)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a3 != 128)
  {
    uint64_t v3 = *(void *)&a3;
    int v5 = [(VCVideoReceiverDefault *)self oneToOneStreamIndex];
    *(void *)&v8[14] = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v7[7] = v6;
    *(_OWORD *)BOOL v8 = v6;
    v7[5] = v6;
    v7[6] = v6;
    v7[3] = v6;
    v7[4] = v6;
    v7[1] = v6;
    v7[2] = v6;
    v7[0] = v6;
    if (+[VCVideoFeatureListStringHelper featureListString:v7 maxSize:150 payload:v3 featureListStrings:self->_videoReceiverConfig.streamConfigs[v5].featureListStrings])
    {
      [(VCVideoReceiverDefault *)self setUpRemoteAspectRatiosFromFreatureListString:v7];
    }
  }
}

- (void)setUpRemoteAspectRatiosFromFreatureListString:(const char *)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  int v34 = 3;
  int v32 = 3;
  uint64_t v33 = 0x200000002;
  BOOL v5 = +[VCVideoFeatureListStringHelper extractAspectRatios:a3 landscapeX:&v34 landscapeY:(char *)&v33 + 4 portraitX:&v33 portraitY:&v32];
  self->_canRemoteResizePIP = +[VCVideoFeatureListStringHelper isResizePIPSupportedInFeatureListString:](VCVideoFeatureListStringHelper, "isResizePIPSupportedInFeatureListString:", [NSString stringWithUTF8String:a3]);
  int v31 = -1431655766;
  int v29 = -1431655766;
  unint64_t v30 = 0xAAAAAAAAAAAAAAAALL;
  BOOL v6 = +[VCVideoFeatureListStringHelper extractExpectedAspectRatios:a3 expectedLandscapeX:&v31 expectedLandscapeY:(char *)&v30 + 4 expectedPortraitX:&v30 expectedPortraitY:&v29];
  self->_BOOL remoteSupportsExpectedAspectRatio = v6;
  if (!v6)
  {
    int v31 = v34;
    int v29 = v32;
    unint64_t v30 = v33;
  }
  if ((VCVideoReceiverDefault *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL remoteSupportsExpectedAspectRatio = self->_remoteSupportsExpectedAspectRatio;
        *(_DWORD *)buf = 136316162;
        uint64_t v36 = v8;
        __int16 v37 = 2080;
        v38 = "-[VCVideoReceiverDefault setUpRemoteAspectRatiosFromFreatureListString:]";
        __int16 v39 = 1024;
        int v40 = 295;
        __int16 v41 = 1024;
        *(_DWORD *)v42 = v5;
        *(_WORD *)&v42[4] = 1024;
        *(_DWORD *)&v42[6] = remoteSupportsExpectedAspectRatio;
        uint64_t v11 = " [%s] %s:%d containsAspectRatios=%d, _remoteSupportsExpectedAspectRatio=%d";
        unsigned int v12 = v9;
        uint32_t v13 = 40;
LABEL_13:
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v7 = (__CFString *)[(VCVideoReceiverDefault *)self performSelector:sel_logPrefix];
    }
    else {
      v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      uint32_t v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL v16 = self->_remoteSupportsExpectedAspectRatio;
        *(_DWORD *)buf = 136316674;
        uint64_t v36 = v14;
        __int16 v37 = 2080;
        v38 = "-[VCVideoReceiverDefault setUpRemoteAspectRatiosFromFreatureListString:]";
        __int16 v39 = 1024;
        int v40 = 295;
        __int16 v41 = 2112;
        *(void *)v42 = v7;
        *(_WORD *)&v42[8] = 2048;
        *(void *)v43 = self;
        *(_WORD *)&v43[8] = 1024;
        *(_DWORD *)v44 = v5;
        *(_WORD *)&v44[4] = 1024;
        *(_DWORD *)&v44[6] = v16;
        uint64_t v11 = " [%s] %s:%d %@(%p) containsAspectRatios=%d, _remoteSupportsExpectedAspectRatio=%d";
        unsigned int v12 = v15;
        uint32_t v13 = 60;
        goto LABEL_13;
      }
    }
  }
  if ((VCVideoReceiverDefault *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      unsigned int v19 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316930;
        uint64_t v36 = v18;
        __int16 v37 = 2080;
        v38 = "-[VCVideoReceiverDefault setUpRemoteAspectRatiosFromFreatureListString:]";
        __int16 v39 = 1024;
        int v40 = 296;
        __int16 v41 = 2080;
        *(void *)v42 = a3;
        *(_WORD *)&v42[8] = 1024;
        *(_DWORD *)v43 = v34;
        *(_WORD *)&v43[4] = 1024;
        *(_DWORD *)&v43[6] = HIDWORD(v33);
        *(_WORD *)v44 = 1024;
        *(_DWORD *)&v44[2] = v30;
        *(_WORD *)&v44[6] = 1024;
        *(_DWORD *)&v44[8] = v29;
        v20 = " [%s] %s:%d featureListString=%s, AR=%d/%d, XR=%d/%d";
        int v21 = v19;
        uint32_t v22 = 62;
LABEL_24:
        _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      __int16 v17 = (__CFString *)[(VCVideoReceiverDefault *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v17 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v23 = VRTraceErrorLogLevelToCSTR();
      int v24 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136317442;
        uint64_t v36 = v23;
        __int16 v37 = 2080;
        v38 = "-[VCVideoReceiverDefault setUpRemoteAspectRatiosFromFreatureListString:]";
        __int16 v39 = 1024;
        int v40 = 296;
        __int16 v41 = 2112;
        *(void *)v42 = v17;
        *(_WORD *)&v42[8] = 2048;
        *(void *)v43 = self;
        *(_WORD *)&v43[8] = 2080;
        *(void *)v44 = a3;
        *(_WORD *)&v44[8] = 1024;
        *(_DWORD *)&v44[10] = v34;
        __int16 v45 = 1024;
        int v46 = HIDWORD(v33);
        __int16 v47 = 1024;
        int v48 = v30;
        __int16 v49 = 1024;
        int v50 = v29;
        v20 = " [%s] %s:%d %@(%p) featureListString=%s, AR=%d/%d, XR=%d/%d";
        int v21 = v24;
        uint32_t v22 = 82;
        goto LABEL_24;
      }
    }
  }
  CGFloat v25 = (double)v32;
  self->_remoteScreenPortraitAspectRatio.width = (double)(int)v33;
  self->_remoteScreenPortraitAspectRatio.height = v25;
  CGFloat v26 = (double)SHIDWORD(v33);
  self->_remoteScreenLandscapeAspectRatio.width = (double)v34;
  self->_remoteScreenLandscapeAspectRatio.height = v26;
  CGFloat v27 = (double)v29;
  self->_remoteExpectedPortraitAspectRatio.width = (double)(int)v30;
  self->_remoteExpectedPortraitAspectRatio.height = v27;
  CGFloat v28 = (double)SHIDWORD(v30);
  self->_remoteExpectedLandscapeAspectRatio.width = (double)v31;
  self->_remoteExpectedLandscapeAspectRatio.height = v28;
}

- (void)dealloc
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ((VCVideoReceiverDefault *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      BOOL v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v20 = v4;
        __int16 v21 = 2080;
        uint32_t v22 = "-[VCVideoReceiverDefault dealloc]";
        __int16 v23 = 1024;
        int v24 = 304;
        BOOL v6 = " [%s] %s:%d dealloc called";
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
      uint64_t v3 = (__CFString *)[(VCVideoReceiverDefault *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint32_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v20 = v9;
        __int16 v21 = 2080;
        uint32_t v22 = "-[VCVideoReceiverDefault dealloc]";
        __int16 v23 = 1024;
        int v24 = 304;
        __int16 v25 = 2112;
        CGFloat v26 = v3;
        __int16 v27 = 2048;
        CGFloat v28 = self;
        BOOL v6 = " [%s] %s:%d %@(%p) dealloc called";
        v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }
  [(VCVideoReceiverDefault *)self cleanUpDisplayLink];
  if (self->_videoReceiverHandle != (tagHANDLE *)0xFFFFFFFFLL)
  {
    VideoReceiver_CloseHandle();
    self->_videoReceiverint Handle = (tagHANDLE *)0xFFFFFFFFLL;
  }

  p_videoReceiverConfig = &self->_videoReceiverConfig;
  participantId = self->_videoReceiverConfig.participantId;
  if (participantId)
  {
    CFRelease(participantId);
    self->_videoReceiverConfig.participantId = 0;
  }
  sessionId = self->_videoReceiverConfig.sessionId;
  if (sessionId)
  {
    CFRelease(sessionId);
    self->_videoReceiverConfig.sessionId = 0;
  }
  controlInfoGenerator = self->_controlInfoGenerator;
  if (controlInfoGenerator) {
    CFRelease(controlInfoGenerator);
  }
  if (p_videoReceiverConfig->streamCount)
  {
    unint64_t v15 = 0;
    p_sframeCryptor = &self->_videoReceiverConfig.streamConfigs[0].sframeCryptor;
    do
    {
      __int16 v17 = *(p_sframeCryptor - 2);
      if (v17) {
        CFRelease(v17);
      }
      if (*p_sframeCryptor) {
        CFRelease(*p_sframeCryptor);
      }
      ++v15;
      p_sframeCryptor += 14;
    }
    while (v15 < p_videoReceiverConfig->streamCount);
  }

  [(VCVideoHardwareDumpCollector *)self->_validationContext invalidate];
  v18.receiver = self;
  v18.super_class = (Class)VCVideoReceiverDefault;
  [(VCVideoReceiverBase *)&v18 dealloc];
}

- (void)setVideoExpected:(BOOL)a3
{
}

- (BOOL)initializeDisplayLink
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_videoReceiverConfig.enableQueueAlarmForDisplay) {
    uint64_t v3 = 3;
  }
  else {
    uint64_t v3 = 0;
  }
  if (self->_videoReceiverConfig.enableQueueAlarmForDisplay) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 39;
  }
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __47__VCVideoReceiverDefault_initializeDisplayLink__block_invoke;
  uint32_t v10 = &unk_1E6DB6DA0;
  uint64_t v11 = self;
  BOOL v5 = [[VCDisplayLink alloc] initWithHandler:&v7 threadPriority:v4 threadOptions:v3 threadIdentifier:@"com.apple.VCVideoReceiverDefault.VCDisplayLink" preferredFrameRate:0.0];
  self->_displayLink = v5;
  if (v5)
  {
    if ([(VCDisplayLink *)v5 activate]) {
      return 1;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoReceiverDefault initializeDisplayLink]();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCVideoReceiverDefault initializeDisplayLink]();
    }
  }
  [(VCVideoReceiverDefault *)self cleanUpDisplayLink];
  return 0;
}

uint64_t __47__VCVideoReceiverDefault_initializeDisplayLink__block_invoke(uint64_t a1, double *a2)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 1512);
  if (result != 0xFFFFFFFFLL) {
    return VideoReceiver_DisplayLinkTick(a2[1], *a2, a2[2]);
  }
  return result;
}

- (void)cleanUpDisplayLink
{
  self->_displayLink = 0;
}

- (void)startVideo
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_videoReceiverConfig.useDisplayLink) {
    [(VCVideoReceiverDefault *)self initializeDisplayLink];
  }
  int v3 = VideoReceiver_SetVTHandleAndStart((uint64_t)self->_videoReceiverHandle, (uint64_t)self->_videoTransmitterHandle);
  [(VCCannedVideoPacketSource *)self->_cannedPacketSource startCannedInjection];
  if (v3 < 0 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    BOOL v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      videoReceiverint Handle = self->_videoReceiverHandle;
      int v7 = 136316418;
      uint64_t v8 = v4;
      __int16 v9 = 2080;
      uint32_t v10 = "-[VCVideoReceiverDefault startVideo]";
      __int16 v11 = 1024;
      int v12 = 388;
      __int16 v13 = 1024;
      int v14 = 388;
      __int16 v15 = 2048;
      BOOL v16 = videoReceiverHandle;
      __int16 v17 = 1024;
      int v18 = v3;
      _os_log_error_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCVideoReceiverDefault.m:%d: VideoReceiver[%p] startVideo failed (%d)", (uint8_t *)&v7, 0x32u);
    }
  }
}

- (void)stopVideo
{
  if (self->_videoReceiverHandle != (tagHANDLE *)0xFFFFFFFFLL)
  {
    VideoReceiver_CloseHandle();
    self->_videoReceiverint Handle = (tagHANDLE *)0xFFFFFFFFLL;
  }
}

- (double)lastReceivedVideoRTPPacketTime
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0x7FF8000000000000;
  VideoReceiver_GetLastReceivedVideoRTPPacketTime((uint64_t)self->_videoReceiverHandle, v3);
  return *(double *)v3;
}

- (double)lastReceivedVideoRTCPPacketTime
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0x7FF8000000000000;
  VideoReceiver_GetLastReceivedVideoRTCPPacketTime((uint64_t)self->_videoReceiverHandle, v3);
  return *(double *)v3;
}

- (float)lastLastVideoStallDuration
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = NAN;
  VideoReceiver_GetLastVideoStallDuration((uint64_t)self->_videoReceiverHandle, &v3);
  return v3;
}

- (void)setTargetStreamID:(unsigned __int16)a3
{
  videoReceiverint Handle = self->_videoReceiverHandle;
  if (videoReceiverHandle != (tagHANDLE *)0xFFFFFFFFLL) {
    VideoReceiver_SetTargetStreamID((uint64_t)videoReceiverHandle, a3);
  }
}

- (unsigned)lastDisplayedFrameRTPTimestamp
{
  if (self->_videoReceiverHandle == (tagHANDLE *)0xFFFFFFFFLL) {
    return 0;
  }
  else {
    return VideoReceiver_GetShowFrameRTPTimestamp();
  }
}

- (double)roundTripTime
{
  return self->super._roundTripTime;
}

- (void)setEnableRateAdaptation:(BOOL)a3 maxBitrate:(unsigned int)a4 minBitrate:(unsigned int)a5 adaptationInterval:(double)a6
{
}

- (void)handleRequestingKeyFrameGenerationWithStreamID:(unsigned __int16)a3 firType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = a3;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  double v7 = micro();
  if (!self->_videoReceiverConfig.mode
    || self->_lastKeyFrameRequestStreamID != v5
    || ((double lastKeyFrameRequestTime = self->_lastKeyFrameRequestTime, lastKeyFrameRequestTime != 0.0)
      ? (BOOL v9 = v7 - lastKeyFrameRequestTime < 0.5)
      : (BOOL v9 = 0),
        !v9))
  {
    if ((VCVideoReceiverDefault *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_18;
      }
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      int v12 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      int v27 = 136316162;
      uint64_t v28 = v11;
      __int16 v29 = 2080;
      unint64_t v30 = "-[VCVideoReceiverDefault handleRequestingKeyFrameGenerationWithStreamID:firType:]";
      __int16 v31 = 1024;
      int v32 = 602;
      __int16 v33 = 1024;
      *(_DWORD *)int v34 = v5;
      *(_WORD *)&v34[4] = 1024;
      *(_DWORD *)&v34[6] = v4;
      __int16 v13 = " [%s] %s:%d Requesting Key Frame with streamID:%d FIRType:%d";
      int v14 = v12;
      uint32_t v15 = 40;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint32_t v10 = (__CFString *)[(VCVideoReceiverDefault *)self performSelector:sel_logPrefix];
      }
      else {
        uint32_t v10 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_18;
      }
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      __int16 v17 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      int v27 = 136316674;
      uint64_t v28 = v16;
      __int16 v29 = 2080;
      unint64_t v30 = "-[VCVideoReceiverDefault handleRequestingKeyFrameGenerationWithStreamID:firType:]";
      __int16 v31 = 1024;
      int v32 = 602;
      __int16 v33 = 2112;
      *(void *)int v34 = v10;
      *(_WORD *)&v34[8] = 2048;
      int v35 = self;
      __int16 v36 = 1024;
      int v37 = v5;
      __int16 v38 = 1024;
      int v39 = v4;
      __int16 v13 = " [%s] %s:%d %@(%p) Requesting Key Frame with streamID:%d FIRType:%d";
      int v14 = v17;
      uint32_t v15 = 60;
    }
    _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v27, v15);
LABEL_18:
    self->_double lastKeyFrameRequestTime = v7;
    self->_lastKeyFrameRequestStreamID = v5;
    int v18 = (void *)MEMORY[0x1E4E56580](&self->super._delegate);
    [v18 vcVideoReceiver:self requestKeyFrameGenerationWithStreamID:v5 firType:v4];
    CFRelease(v18);
    VideoReceiver_IncrementFIRCount((uint64_t)self->_videoReceiverHandle, v4);
    return;
  }
  if ((VCVideoReceiverDefault *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      __int16 v21 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v27 = 136315906;
        uint64_t v28 = v20;
        __int16 v29 = 2080;
        unint64_t v30 = "-[VCVideoReceiverDefault handleRequestingKeyFrameGenerationWithStreamID:firType:]";
        __int16 v31 = 1024;
        int v32 = 598;
        __int16 v33 = 1024;
        *(_DWORD *)int v34 = v5;
        uint32_t v22 = " [%s] %s:%d Ignoring key frame request key frame too soon for the same streamID:%d";
        __int16 v23 = v21;
        uint32_t v24 = 34;
LABEL_30:
        _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v27, v24);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v19 = (__CFString *)[(VCVideoReceiverDefault *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v19 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v25 = VRTraceErrorLogLevelToCSTR();
      CGFloat v26 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v27 = 136316418;
        uint64_t v28 = v25;
        __int16 v29 = 2080;
        unint64_t v30 = "-[VCVideoReceiverDefault handleRequestingKeyFrameGenerationWithStreamID:firType:]";
        __int16 v31 = 1024;
        int v32 = 598;
        __int16 v33 = 2112;
        *(void *)int v34 = v19;
        *(_WORD *)&v34[8] = 2048;
        int v35 = self;
        __int16 v36 = 1024;
        int v37 = v5;
        uint32_t v22 = " [%s] %s:%d %@(%p) Ignoring key frame request key frame too soon for the same streamID:%d";
        __int16 v23 = v26;
        uint32_t v24 = 54;
        goto LABEL_30;
      }
    }
  }
}

- (void)handleKeyFrameRequestWithSizeAndFistMBs:(unsigned __int16 *)a3 count:(int)a4 didReceiveRTCPFB:(BOOL)a5 didReceiveFIR:(BOOL)a6
{
  double v7 = (void *)MEMORY[0x1E4E56580](&self->super._delegate, a2, a3, *(void *)&a4, a5, a6);
  [v7 vcVideoReceiverRequestKeyFrame:self rtcpPSFBType:4];

  CFRelease(v7);
}

- (void)didSwitchFromStreamID:(unsigned __int16)a3 toStreamID:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  double v7 = (void *)MEMORY[0x1E4E56580](&self->super._delegate, a2);
  if (objc_opt_respondsToSelector()) {
    [v7 vcVideoReceiver:self didSwitchFromStreamID:v5 toStreamID:v4];
  }

  CFRelease(v7);
}

- (void)collectChannelMetrics:(id *)a3 interval:(float)a4
{
  a3->var0 = 0;
  a3->var2 = 0;
  a3->var4.width = 0.0;
  a3->var4.height = 0.0;
  a3->var3 = 0.0;
  VideoReceiver_GetMediaChannelMetrics(a4, (uint64_t)self->_videoReceiverHandle, (uint64_t)a3);
}

- (void)setSynchronizer:(id)a3
{
}

- (void)updateSourcePlayoutTime:(const tagVCMediaTime *)a3
{
  videoReceiverint Handle = self->_videoReceiverHandle;
  if (videoReceiverHandle != (tagHANDLE *)0xFFFFFFFFLL) {
    VideoReceiver_UpdateSourcePlayoutTime((uint64_t)videoReceiverHandle, a3);
  }
}

- (void)handleActiveConnectionChange:(id)a3
{
}

- (void)setShouldEnableFaceZoom:(BOOL)a3
{
  self->_shouldEnableFaceZoom = a3;
  videoReceiverint Handle = self->_videoReceiverHandle;
  if (videoReceiverHandle != (tagHANDLE *)0xFFFFFFFFLL) {
    VideoReceiver_SetShouldEnableFaceZoom((uint64_t)videoReceiverHandle, a3);
  }
}

- (void)setShouldEnableMLEnhance:(BOOL)a3 streamID:(unsigned __int16)a4
{
  videoReceiverint Handle = self->_videoReceiverHandle;
  if (videoReceiverHandle != (tagHANDLE *)0xFFFFFFFFLL) {
    VideoReceiver_SetShouldEnableMLEnhance((uint64_t)videoReceiverHandle, a4, a3);
  }
}

- (double)activeVideoStallDuration
{
  v4[1] = *(double *)MEMORY[0x1E4F143B8];
  v4[0] = 0.0;
  videoReceiverint Handle = self->_videoReceiverHandle;
  if (videoReceiverHandle == (tagHANDLE *)0xFFFFFFFFLL) {
    return 0.0;
  }
  VideoReceiver_GetActiveVideoStallDuration((uint64_t)videoReceiverHandle, v4);
  return v4[0];
}

- (double)videoReceiverRxFrameRate
{
  p_videoReceiverRxFrameRate = &self->_videoReceiverRxFrameRate;
  self->_videoReceiverRxFrameRate = 0.0;
  videoReceiverint Handle = self->_videoReceiverHandle;
  if (videoReceiverHandle == (tagHANDLE *)0xFFFFFFFFLL)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoReceiverDefault videoReceiverRxFrameRate]();
      }
    }
  }
  else
  {
    VideoReceiver_GetFramerate(5.0, (uint64_t)videoReceiverHandle, p_videoReceiverRxFrameRate);
  }
  return *p_videoReceiverRxFrameRate;
}

- (void)setJitterBufferMode:(int)a3
{
}

- (void)setDeferredAssemblyEnabled:(BOOL)a3
{
}

- (void)setLooseAVSyncEnabled:(BOOL)a3
{
}

- (VideoAttributes)remoteVideoAttributes
{
  return (VideoAttributes *)objc_getProperty(self, a2, 1544, 1);
}

- (void)setRemoteVideoAttributes:(id)a3
{
}

- (BOOL)shouldEnableFaceZoom
{
  return self->_shouldEnableFaceZoom;
}

- (BOOL)shouldUpdateRemoteScreenAttributes
{
  return self->_shouldUpdateRemoteScreenAttributes;
}

- (void)setShouldUpdateRemoteScreenAttributes:(BOOL)a3
{
  self->_shouldUpdateRemoteScreenAttributes = a3;
}

- (tagVCVideoReceiverConfig)videoReceiverConfig
{
  objc_copyStruct(retstr, &self->_videoReceiverConfig, 1400, 1, 0);
  return result;
}

- (void)setVideoReceiverConfig:(tagVCVideoReceiverConfig *)a3
{
}

- (BOOL)receivedFirstRemoteFrame
{
  return self->_receivedFirstRemoteFrame;
}

- (void)setReceivedFirstRemoteFrame:(BOOL)a3
{
  self->_receivedFirstRemoteFrame = a3;
}

- (void)initWithConfig:(os_log_t)log delegate:delegateFunctions:reportingAgent:statisticsCollector:transmitterHandle:.cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a2;
  int v4 = 136315906;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  double v7 = "-[VCVideoReceiverDefault initWithConfig:delegate:delegateFunctions:reportingAgent:statisticsCollector:transmitterHandle:]";
  __int16 v8 = 1024;
  int v9 = 191;
  __int16 v10 = 1024;
  int v11 = v3;
  _os_log_error_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d init video receiver 0x%x with an invalid rtp handle", (uint8_t *)&v4, 0x22u);
}

- (void)initializeDisplayLink
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to activate VCDisplayLink", v2, v3, v4, v5, v6);
}

- (void)videoReceiverRxFrameRate
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d handle is invalid", v2, v3, v4, v5, v6);
}

@end