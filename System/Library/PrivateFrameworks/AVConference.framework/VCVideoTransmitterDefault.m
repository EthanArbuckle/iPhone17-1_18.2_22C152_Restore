@interface VCVideoTransmitterDefault
+ (void)setupBandwidthEstimationOptions:(tagBWEOPTION *)a3;
+ (void)setupBandwidthEstimationOptions:(tagBWEOPTION *)a3 featureString:(id)a4;
- (BOOL)isRtxEnabled;
- (BOOL)setEncodingMode:(int)a3;
- (VCVideoTransmitterDefault)initWithConfig:(id)a3;
- (tagHANDLE)videoTransmitterHandle;
- (unsigned)setTemporaryMaximumBitrate:(unsigned int)a3;
- (void)collectChannelMetrics:(id *)a3 interval:(float)a4;
- (void)dealloc;
- (void)generateKeyFrameWithFIRType:(int)a3;
- (void)handleActiveConnectionChange:(id)a3;
- (void)handleActiveConnectionChangeDefault:(id)a3;
- (void)handleActiveConnectionChangeMultiway:(id)a3;
- (void)handleThermalLevelChange:(int)a3;
- (void)setFECRatio:(double)a3;
- (void)setFECRedundancyVector:(id *)a3;
- (void)setHighestActiveQualityIndex:(unsigned int)a3;
- (void)setIsEndToEndBasedBandwidthProbingEnabled:(BOOL)a3;
- (void)setIsServerBasedBandwidthProbingEnabled:(BOOL)a3;
- (void)setKeyFrameOnlyStreamID:(unsigned __int16)a3;
- (void)setMediaSuggestion:(VCRateControlMediaSuggestion *)a3;
- (void)setRtxEnabled:(BOOL)a3;
- (void)setStreamIDs:(unsigned __int16 *)a3 numOfStreamIDs:(unsigned __int8)a4 repairedStreamIDs:(unsigned __int16 *)a5 numOfRepairedStreamIDs:(unsigned __int8)a6;
- (void)setTargetBitrate:(unsigned int)a3;
- (void)setTemporalBitrateArray:(id)a3;
- (void)setUpAspectRatios:(BOOL)a3;
- (void)setUpAspectRatiosFromFeatureListString:(const char *)a3;
- (void)startVideo;
- (void)stopVideo;
- (void)updateWindowState:(int)a3 isLocal:(BOOL)a4 windowRect:(CGRect)a5;
@end

@implementation VCVideoTransmitterDefault

- (VCVideoTransmitterDefault)initWithConfig:(id)a3
{
  uint64_t v126 = *MEMORY[0x1E4F143B8];
  uint64_t v54 = 0;
  uint64_t v55 = 0;
  if ([a3 rtpTimestampRate]) {
    unsigned int v5 = [a3 rtpTimestampRate];
  }
  else {
    unsigned int v5 = 24000;
  }
  self->_unsigned int audioTimestampRate = v5;
  v53.receiver = self;
  v53.super_class = (Class)VCVideoTransmitterDefault;
  v6 = [(VCVideoTransmitterBase *)&v53 initWithConfig:a3];
  if (!v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v43 = VRTraceErrorLogLevelToCSTR();
      v44 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoTransmitterDefault initWithConfig:](v43, v44);
      }
    }
    goto LABEL_56;
  }
  v7 = v6;
  if (!a3)
  {
    if ((VCVideoTransmitterDefault *)objc_opt_class() == v6)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_57;
      }
      uint64_t v46 = VRTraceErrorLogLevelToCSTR();
      v47 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_57;
      }
      LODWORD(v117.value) = 136315650;
      *(CMTimeValue *)((char *)&v117.value + 4) = v46;
      LOWORD(v117.flags) = 2080;
      *(void *)((char *)&v117.flags + 2) = "-[VCVideoTransmitterDefault initWithConfig:]";
      HIWORD(v117.epoch) = 1024;
      int v118 = 59;
      v48 = " [%s] %s:%d The provided config is nil";
      v49 = v47;
      uint32_t v50 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v45 = (__CFString *)[(VCVideoTransmitterDefault *)v7 performSelector:sel_logPrefix];
      }
      else {
        v45 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_57;
      }
      uint64_t v51 = VRTraceErrorLogLevelToCSTR();
      v52 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_57;
      }
      LODWORD(v117.value) = 136316162;
      *(CMTimeValue *)((char *)&v117.value + 4) = v51;
      LOWORD(v117.flags) = 2080;
      *(void *)((char *)&v117.flags + 2) = "-[VCVideoTransmitterDefault initWithConfig:]";
      HIWORD(v117.epoch) = 1024;
      int v118 = 59;
      __int16 v119 = 2112;
      *(void *)v120 = v45;
      *(_WORD *)&v120[8] = 2048;
      *(void *)&v120[10] = v7;
      v48 = " [%s] %s:%d %@(%p) The provided config is nil";
      v49 = v52;
      uint32_t v50 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v49, OS_LOG_TYPE_DEFAULT, v48, (uint8_t *)&v117, v50);
LABEL_57:

    return 0;
  }
  CMTimeMake(&v117, 0, v6->_audioTimestampRate);
  long long v8 = *(_OWORD *)&v117.value;
  v7->super._latestSampleBufferTimestamp.epoch = v117.epoch;
  *(_OWORD *)&v7->super._latestSampleBufferTimestamp.value = v8;
  v9 = (void *)[a3 mediaControlInfoGenerator];
  if (v9) {
    v9 = (void *)CFRetain(v9);
  }
  v7->super._controlInfoGenerator = v9;
  v10 = (void *)[a3 customFeatureListStrings];
  v11 = objc_msgSend(v10, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "videoPayload")));
  v7->_transmitterMode = [a3 mode];
  int v12 = 0;
  if ([a3 mode] == 1 && v11)
  {
    if ([a3 setupBWEstimationOptionWithFeatureString]) {
      +[VCVideoTransmitterDefault setupBandwidthEstimationOptions:&v54 featureString:v11];
    }
    else {
      +[VCVideoTransmitterDefault setupBandwidthEstimationOptions:&v54];
    }
    if ((VCVideoTransmitterDefault *)objc_opt_class() == v7)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_24;
      }
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      LODWORD(v117.value) = 136316674;
      *(CMTimeValue *)((char *)&v117.value + 4) = v14;
      LOWORD(v117.flags) = 2080;
      *(void *)((char *)&v117.flags + 2) = "-[VCVideoTransmitterDefault initWithConfig:]";
      HIWORD(v117.epoch) = 1024;
      int v118 = 76;
      __int16 v119 = 1024;
      *(_DWORD *)v120 = HIDWORD(v54);
      *(_WORD *)&v120[4] = 1024;
      *(_DWORD *)&v120[6] = v55;
      *(_WORD *)&v120[10] = 1024;
      *(_DWORD *)&v120[12] = HIDWORD(v55);
      *(_WORD *)&v120[16] = 1024;
      *(_DWORD *)v121 = v54;
      v16 = " [%s] %s:%d setup bandwidthEstimationOptions fEnableNewBWEMode=%d, fEnableFakeLargeFrameMode=%d, fEnableActi"
            "veProbingSenderLog=%d, fBWEInitialized=%d";
      v17 = v15;
      uint32_t v18 = 52;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v13 = (__CFString *)[(VCVideoTransmitterDefault *)v7 performSelector:sel_logPrefix];
      }
      else {
        v13 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_24;
      }
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      LODWORD(v117.value) = 136317186;
      *(CMTimeValue *)((char *)&v117.value + 4) = v19;
      LOWORD(v117.flags) = 2080;
      *(void *)((char *)&v117.flags + 2) = "-[VCVideoTransmitterDefault initWithConfig:]";
      HIWORD(v117.epoch) = 1024;
      int v118 = 76;
      __int16 v119 = 2112;
      *(void *)v120 = v13;
      *(_WORD *)&v120[8] = 2048;
      *(void *)&v120[10] = v7;
      *(_WORD *)v121 = 1024;
      *(_DWORD *)&v121[2] = HIDWORD(v54);
      __int16 v122 = 1024;
      *(_DWORD *)v123 = v55;
      *(_WORD *)&v123[4] = 1024;
      *(_DWORD *)&v123[6] = HIDWORD(v55);
      __int16 v124 = 1024;
      int v125 = v54;
      v16 = " [%s] %s:%d %@(%p) setup bandwidthEstimationOptions fEnableNewBWEMode=%d, fEnableFakeLargeFrameMode=%d, fEna"
            "bleActiveProbingSenderLog=%d, fBWEInitialized=%d";
      v17 = v20;
      uint32_t v18 = 72;
    }
    _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v117, v18);
LABEL_24:
    int v12 = VideoUtil_FeatureListStringOptionExists([v11 UTF8String], (uint64_t)"CR");
    v7->_canLocalResizePIP = +[VCVideoFeatureListStringHelper isResizePIPSupportedInFeatureListString:v11];
    -[VCVideoTransmitterDefault setUpAspectRatiosFromFeatureListString:](v7, "setUpAspectRatiosFromFeatureListString:", [v11 UTF8String]);
  }
  bzero(v56, 0x270uLL);
  if ((int)[a3 streamCount] >= 1)
  {
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    do
    {
      uint64_t v23 = v56[0]++;
      v24 = &v56[8 * v23];
      uint64_t v25 = [a3 streamConfigs];
      long long v26 = *(_OWORD *)(v25 + v21 + 16);
      *(_OWORD *)(v24 + 2) = *(_OWORD *)(v25 + v21);
      *(_OWORD *)(v24 + 6) = v26;
      ++v22;
      v21 += 32;
    }
    while (v22 < (int)[a3 streamCount]);
  }
  int v97 = [a3 encoderUsage];
  if ([a3 mode] == 1)
  {
    unsigned int encodingWidth = v7->super._encodingWidth;
    unsigned int v74 = v7->super._encodingWidth;
    unsigned int encodingHeight = v7->super._encodingHeight;
    unsigned int v78 = v7->super._encodingHeight;
    int v76 = [a3 framerate];
    int v79 = [a3 framerate];
  }
  controlInfoGenerator = v7->super._controlInfoGenerator;
  uint64_t v58 = [a3 reportingAgent];
  int v59 = [a3 reportingParentID];
  unsigned int v70 = v7->super._encodingWidth;
  unsigned int v71 = v7->super._encodingHeight;
  int v73 = [a3 pixelFormat];
  int v72 = [a3 framerate];
  int v80 = [a3 txMaxBitrate];
  int v84 = [a3 videoPayload];
  int v81 = -1;
  int v82 = [a3 keyFrameInterval];
  [a3 minKeyFrameGenerationIntervalInSeconds];
  double DoubleValueForKey = VCDefaults_GetDoubleValueForKey(@"minKeyFrameGenerationInterval", v27);
  uint64_t v87 = 0x20000000200;
  uint64_t v90 = [v11 UTF8String];
  int v68 = v12;
  BOOL v67 = (int)VCCPUCount() > 1;
  int v69 = 1;
  char v62 = 1;
  if ([a3 recommendedMTU]) {
    __int16 v28 = [a3 recommendedMTU];
  }
  else {
    __int16 v28 = 1280;
  }
  __int16 v91 = v28;
  char v63 = [a3 isIPv6];
  int v88 = [a3 parameterSets];
  char v65 = 1;
  int v66 = 2;
  int v94 = [a3 mode];
  int v95 = [a3 captureSource];
  unsigned int audioTimestampRate = v7->_audioTimestampRate;
  int v96 = [a3 encodingMode];
  uint64_t v89 = [a3 colorInfo];
  uint64_t v98 = [a3 videoPriorityPointer];
  int v99 = [a3 tilesPerFrame];
  uint64_t v61 = [a3 statisticsCollector];
  char v64 = [a3 useRateControl];
  int v104 = [a3 qualityIndex];
  int v92 = [+[VCDefaults sharedInstance] enableTxSourceYuvDump];
  BOOL v93 = [+[VCDefaults sharedInstance] enableTxBitstreamDump];
  char v101 = [a3 reinitEncoderOnFrameSizeChangeEnabled];
  uint64_t v103 = [a3 remoteIDSParticipantID];
  uint64_t v60 = [a3 mediaController];
  v86 = &v54;
  uint64_t v105 = [a3 profileLevel];
  char v102 = [a3 isFecGeneratorEnabled];
  char v100 = [a3 fecHeaderV1Enabled];
  char v106 = [a3 temporalScalingEnabled];
  int v107 = [a3 maxSupportedTemporalLayers];
  int v108 = [a3 cvoExtensionID];
  char v109 = [a3 useInBandFec];
  uint64_t v110 = [a3 maxEncoderPixels];
  int v111 = [a3 encoderBitrateAveragingInterval];
  int v112 = [a3 ltrAckFeedbackType];
  char v114 = [a3 fecEnabled];
  char v115 = [a3 rtxEnabled];
  char v116 = [a3 foveationEnabled];
  if ([+[VCDefaults sharedInstance] isTransmitterTestVerificationEnabled])
  {
    v29 = objc_alloc_init(VCVideoHardwareDumpCollector);
    v7->_verificationContext = v29;
    v113 = v29;
  }
  p_videoTransmitterint Handle = &v7->_videoTransmitterHandle;
  int Handle = VideoTransmitter_CreateHandle((uint64_t *)&v7->_videoTransmitterHandle, v56);
  if ((VCVideoTransmitterDefault *)objc_opt_class() == v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v33 = VRTraceErrorLogLevelToCSTR();
      v34 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        v35 = *p_videoTransmitterHandle;
        LODWORD(v117.value) = 136316162;
        *(CMTimeValue *)((char *)&v117.value + 4) = v33;
        LOWORD(v117.flags) = 2080;
        *(void *)((char *)&v117.flags + 2) = "-[VCVideoTransmitterDefault initWithConfig:]";
        HIWORD(v117.epoch) = 1024;
        int v118 = 157;
        __int16 v119 = 1024;
        *(_DWORD *)v120 = v35;
        *(_WORD *)&v120[4] = 2048;
        *(void *)&v120[6] = v7;
        v36 = " [%s] %s:%d Created videoTransmitterHandle=0x%x videoTransmitter=%p";
        v37 = v34;
        uint32_t v38 = 44;
LABEL_45:
        _os_log_impl(&dword_1E1EA4000, v37, OS_LOG_TYPE_DEFAULT, v36, (uint8_t *)&v117, v38);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v32 = (__CFString *)[(VCVideoTransmitterDefault *)v7 performSelector:sel_logPrefix];
    }
    else {
      v32 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v39 = VRTraceErrorLogLevelToCSTR();
      v40 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        v41 = *p_videoTransmitterHandle;
        LODWORD(v117.value) = 136316674;
        *(CMTimeValue *)((char *)&v117.value + 4) = v39;
        LOWORD(v117.flags) = 2080;
        *(void *)((char *)&v117.flags + 2) = "-[VCVideoTransmitterDefault initWithConfig:]";
        HIWORD(v117.epoch) = 1024;
        int v118 = 157;
        __int16 v119 = 2112;
        *(void *)v120 = v32;
        *(_WORD *)&v120[8] = 2048;
        *(void *)&v120[10] = v7;
        *(_WORD *)v121 = 1024;
        *(_DWORD *)&v121[2] = v41;
        __int16 v122 = 2048;
        *(void *)v123 = v7;
        v36 = " [%s] %s:%d %@(%p) Created videoTransmitterHandle=0x%x videoTransmitter=%p";
        v37 = v40;
        uint32_t v38 = 64;
        goto LABEL_45;
      }
    }
  }
  if (Handle < 0)
  {

LABEL_56:
    v7 = 0;
    goto LABEL_57;
  }
  [(VCVideoTransmitterDefault *)v7 setUpAspectRatios:0];
  v7->super._realtimeSPI.enqueueVideoFrame = VCVideoTransmitterDefault_EnqueueVideoFrame;
  v7->super._realtimeSPI.setFECRatio = VCVideoTransmitterDefault_SetFECRatio;
  v7->super._realtimeSPI.setMediaQueueSize = VCVideoTransmitterDefault_SetMediaQueueSize;
  return v7;
}

- (void)setUpAspectRatios:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ((VCVideoTransmitterDefault *)objc_opt_class() != self)
  {
    if (objc_opt_respondsToSelector()) {
      unsigned int v5 = (__CFString *)[(VCVideoTransmitterDefault *)self performSelector:sel_logPrefix];
    }
    else {
      unsigned int v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_12;
    }
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    uint64_t v14 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    BOOL canLocalResizePIP = self->_canLocalResizePIP;
    BOOL canRemoteResizePIP = self->_canRemoteResizePIP;
    *(_DWORD *)uint64_t v25 = 136316930;
    *(void *)&v25[4] = v13;
    *(_WORD *)&v25[12] = 2080;
    *(void *)&v25[14] = "-[VCVideoTransmitterDefault setUpAspectRatios:]";
    *(_WORD *)&v25[22] = 1024;
    LODWORD(v26) = 178;
    WORD2(v26) = 2112;
    *(void *)((char *)&v26 + 6) = v5;
    HIWORD(v26) = 2048;
    double v27 = self;
    LOWORD(v28) = 1024;
    *(_DWORD *)((char *)&v28 + 2) = v3;
    HIWORD(v28) = 1024;
    LODWORD(v29) = canLocalResizePIP;
    WORD2(v29) = 1024;
    *(_DWORD *)((char *)&v29 + 6) = canRemoteResizePIP;
    v10 = " [%s] %s:%d %@(%p) portraitFrameRotated=%d, _canLocalResizePIP=%d, _canRemoteResizePIP=%d";
    v11 = v14;
    uint32_t v12 = 66;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = self->_canLocalResizePIP;
      BOOL v9 = self->_canRemoteResizePIP;
      *(_DWORD *)uint64_t v25 = 136316418;
      *(void *)&v25[4] = v6;
      *(_WORD *)&v25[12] = 2080;
      *(void *)&v25[14] = "-[VCVideoTransmitterDefault setUpAspectRatios:]";
      *(_WORD *)&v25[22] = 1024;
      LODWORD(v26) = 178;
      WORD2(v26) = 1024;
      *(_DWORD *)((char *)&v26 + 6) = v3;
      WORD5(v26) = 1024;
      HIDWORD(v26) = v8;
      LOWORD(v27) = 1024;
      *(_DWORD *)((char *)&v27 + 2) = v9;
      v10 = " [%s] %s:%d portraitFrameRotated=%d, _canLocalResizePIP=%d, _canRemoteResizePIP=%d";
      v11 = v7;
      uint32_t v12 = 46;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, v25, v12);
    }
  }
LABEL_12:
  if (self->_canLocalResizePIP || !self->_canRemoteResizePIP)
  {
    +[VideoUtil computeVisibleAspectRatioWithRemoteScreenAspectRatio:remoteExpectedAspectRatio:encodeWidth:encodeHeight:](VideoUtil, "computeVisibleAspectRatioWithRemoteScreenAspectRatio:remoteExpectedAspectRatio:encodeWidth:encodeHeight:", self->super._encodingHeight, self->super._encodingWidth, self->_remoteScreenPortraitAspectRatio.width, self->_remoteScreenPortraitAspectRatio.height, self->_remoteExpectedPortraitAspectRatio.width, self->_remoteExpectedPortraitAspectRatio.height, *(_OWORD *)v25, *(void *)&v25[16], v26, v27, v28, v29, v30);
    double v18 = v17;
    double v20 = v19;
    +[VideoUtil computeVisibleAspectRatioWithRemoteScreenAspectRatio:remoteExpectedAspectRatio:encodeWidth:encodeHeight:](VideoUtil, "computeVisibleAspectRatioWithRemoteScreenAspectRatio:remoteExpectedAspectRatio:encodeWidth:encodeHeight:", self->super._encodingWidth, self->super._encodingHeight, self->_remoteScreenLandscapeAspectRatio.width, self->_remoteScreenLandscapeAspectRatio.height, self->_remoteExpectedLandscapeAspectRatio.width, self->_remoteExpectedLandscapeAspectRatio.height);
  }
  else
  {
    objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "localScreenRatioForScreenOrientation:", 0);
    double v18 = v23;
    double v20 = v24;
    objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "localScreenRatioForScreenOrientation:", 3);
  }
  VideoTransmitter_SetAspectRatios(v18, v20, v21, v22);
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  controlInfoGenerator = self->super._controlInfoGenerator;
  if (controlInfoGenerator) {
    CFRelease(controlInfoGenerator);
  }
  VideoTransmitter_CloseHandle((uint64_t)self->_videoTransmitterHandle);
  [(VCVideoHardwareDumpCollector *)self->_verificationContext invalidate];

  v4.receiver = self;
  v4.super_class = (Class)VCVideoTransmitterDefault;
  [(VCVideoTransmitterBase *)&v4 dealloc];
}

- (void)setUpAspectRatiosFromFeatureListString:(const char *)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  self->_BOOL canRemoteResizePIP = 0;
  int v24 = -1431655766;
  int v22 = -1431655766;
  unint64_t v23 = 0xAAAAAAAAAAAAAAAALL;
  if (+[VCVideoFeatureListStringHelper extractAspectRatios:a3 landscapeX:&v24 landscapeY:(char *)&v23 + 4 portraitX:&v23 portraitY:&v22])
  {
    if (+[VCVideoFeatureListStringHelper isResizePIPSupportedInFeatureListString:](VCVideoFeatureListStringHelper, "isResizePIPSupportedInFeatureListString:", [NSString stringWithUTF8String:a3]))
    {
      self->_BOOL canRemoteResizePIP = 1;
    }
  }
  else
  {
    int v24 = 3;
    int v22 = 3;
    unint64_t v23 = 0x200000002;
  }
  int v21 = -1431655766;
  int v19 = -1431655766;
  unint64_t v20 = 0xAAAAAAAAAAAAAAAALL;
  if (!+[VCVideoFeatureListStringHelper extractExpectedAspectRatios:a3 expectedLandscapeX:&v21 expectedLandscapeY:(char *)&v20 + 4 expectedPortraitX:&v20 expectedPortraitY:&v19])
  {
    int v21 = v24;
    int v19 = v22;
    unint64_t v20 = v23;
  }
  if ((VCVideoTransmitterDefault *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (self->_canRemoteResizePIP) {
          BOOL v8 = "";
        }
        else {
          BOOL v8 = "No ";
        }
        *(_DWORD *)buf = 136317954;
        uint64_t v26 = v6;
        __int16 v27 = 2080;
        uint64_t v28 = "-[VCVideoTransmitterDefault setUpAspectRatiosFromFeatureListString:]";
        __int16 v29 = 1024;
        int v30 = 260;
        __int16 v31 = 1024;
        *(_DWORD *)v32 = v24;
        *(_WORD *)&v32[4] = 1024;
        *(_DWORD *)&v32[6] = HIDWORD(v23);
        LOWORD(v33) = 1024;
        *(_DWORD *)((char *)&v33 + 2) = v23;
        HIWORD(v33) = 1024;
        *(_DWORD *)v34 = v22;
        *(_WORD *)&v34[4] = 2080;
        v35 = v8;
        *(_WORD *)v36 = 1024;
        *(_DWORD *)&v36[2] = v21;
        *(_WORD *)v37 = 1024;
        *(_DWORD *)&v37[2] = HIDWORD(v20);
        LOWORD(v38) = 1024;
        *(_DWORD *)((char *)&v38 + 2) = v20;
        HIWORD(v38) = 1024;
        *(_DWORD *)uint64_t v39 = v19;
        BOOL v9 = " [%s] %s:%d Setting remote screen aspect ratio numbers %d/%d,%d/%d (%sPR), remote expects to receive %d/%d,%d/%d";
        v10 = v7;
        uint32_t v11 = 86;
        goto LABEL_23;
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCVideoTransmitterDefault *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint64_t v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (self->_canRemoteResizePIP) {
          uint64_t v14 = "";
        }
        else {
          uint64_t v14 = "No ";
        }
        *(_DWORD *)buf = 136318466;
        uint64_t v26 = v12;
        __int16 v27 = 2080;
        uint64_t v28 = "-[VCVideoTransmitterDefault setUpAspectRatiosFromFeatureListString:]";
        __int16 v29 = 1024;
        int v30 = 260;
        __int16 v31 = 2112;
        *(void *)v32 = v5;
        *(_WORD *)&v32[8] = 2048;
        uint64_t v33 = self;
        *(_WORD *)v34 = 1024;
        *(_DWORD *)&v34[2] = v24;
        LOWORD(v35) = 1024;
        *(_DWORD *)((char *)&v35 + 2) = HIDWORD(v23);
        HIWORD(v35) = 1024;
        *(_DWORD *)v36 = v23;
        *(_WORD *)&v36[4] = 1024;
        *(_DWORD *)v37 = v22;
        *(_WORD *)&v37[4] = 2080;
        uint32_t v38 = v14;
        *(_WORD *)uint64_t v39 = 1024;
        *(_DWORD *)&v39[2] = v21;
        __int16 v40 = 1024;
        int v41 = HIDWORD(v20);
        __int16 v42 = 1024;
        int v43 = v20;
        __int16 v44 = 1024;
        int v45 = v19;
        BOOL v9 = " [%s] %s:%d %@(%p) Setting remote screen aspect ratio numbers %d/%d,%d/%d (%sPR), remote expects to receive %d/%d,%d/%d";
        v10 = v13;
        uint32_t v11 = 106;
LABEL_23:
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      }
    }
  }
  CGFloat v15 = (double)v22;
  self->_remoteScreenPortraitAspectRatio.width = (double)(int)v23;
  self->_remoteScreenPortraitAspectRatio.height = v15;
  CGFloat v16 = (double)SHIDWORD(v23);
  self->_remoteScreenLandscapeAspectRatio.width = (double)v24;
  self->_remoteScreenLandscapeAspectRatio.height = v16;
  CGFloat v17 = (double)v19;
  self->_remoteExpectedPortraitAspectRatio.width = (double)(int)v20;
  self->_remoteExpectedPortraitAspectRatio.height = v17;
  CGFloat v18 = (double)SHIDWORD(v20);
  self->_remoteExpectedLandscapeAspectRatio.width = (double)v21;
  self->_remoteExpectedLandscapeAspectRatio.height = v18;
}

- (void)startVideo
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ((VCVideoTransmitterDefault *)objc_opt_class() != self)
  {
    if (objc_opt_respondsToSelector()) {
      BOOL v3 = (__CFString *)[(VCVideoTransmitterDefault *)self performSelector:sel_logPrefix];
    }
    else {
      BOOL v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_12;
    }
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    int v13 = 136316162;
    uint64_t v14 = v9;
    __int16 v15 = 2080;
    CGFloat v16 = "-[VCVideoTransmitterDefault startVideo]";
    __int16 v17 = 1024;
    int v18 = 270;
    __int16 v19 = 2112;
    unint64_t v20 = v3;
    __int16 v21 = 2048;
    int v22 = self;
    uint64_t v6 = " [%s] %s:%d %@(%p) ";
    v7 = v10;
    uint32_t v8 = 48;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315650;
      uint64_t v14 = v4;
      __int16 v15 = 2080;
      CGFloat v16 = "-[VCVideoTransmitterDefault startVideo]";
      __int16 v17 = 1024;
      int v18 = 270;
      uint64_t v6 = " [%s] %s:%d ";
      v7 = v5;
      uint32_t v8 = 28;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v13, v8);
    }
  }
LABEL_12:
  if ((VideoTransmitter_ResumeEncoder() & 0x80000000) != 0 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    uint64_t v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315650;
      uint64_t v14 = v11;
      __int16 v15 = 2080;
      CGFloat v16 = "-[VCVideoTransmitterDefault startVideo]";
      __int16 v17 = 1024;
      int v18 = 272;
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Start Video Failed", (uint8_t *)&v13, 0x1Cu);
    }
  }
}

- (void)stopVideo
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ((VCVideoTransmitterDefault *)objc_opt_class() != self)
  {
    if (objc_opt_respondsToSelector()) {
      BOOL v3 = (__CFString *)[(VCVideoTransmitterDefault *)self performSelector:sel_logPrefix];
    }
    else {
      BOOL v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_12;
    }
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    int v13 = 136316162;
    uint64_t v14 = v9;
    __int16 v15 = 2080;
    CGFloat v16 = "-[VCVideoTransmitterDefault stopVideo]";
    __int16 v17 = 1024;
    int v18 = 280;
    __int16 v19 = 2112;
    unint64_t v20 = v3;
    __int16 v21 = 2048;
    int v22 = self;
    uint64_t v6 = " [%s] %s:%d %@(%p) ";
    v7 = v10;
    uint32_t v8 = 48;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315650;
      uint64_t v14 = v4;
      __int16 v15 = 2080;
      CGFloat v16 = "-[VCVideoTransmitterDefault stopVideo]";
      __int16 v17 = 1024;
      int v18 = 280;
      uint64_t v6 = " [%s] %s:%d ";
      v7 = v5;
      uint32_t v8 = 28;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v13, v8);
    }
  }
LABEL_12:
  if ((VideoTransmitter_PauseEncoder() & 0x80000000) != 0 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    uint64_t v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315650;
      uint64_t v14 = v11;
      __int16 v15 = 2080;
      CGFloat v16 = "-[VCVideoTransmitterDefault stopVideo]";
      __int16 v17 = 1024;
      int v18 = 282;
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Stop Video Failed", (uint8_t *)&v13, 0x1Cu);
    }
  }
}

+ (void)setupBandwidthEstimationOptions:(tagBWEOPTION *)a3
{
  *a3 = (tagBWEOPTION)xmmword_1E25A00E0;
}

+ (void)setupBandwidthEstimationOptions:(tagBWEOPTION *)a3 featureString:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unsigned int v9 = 0;
  BOOL v8 = 0;
  VideoUtil_ParseFeatureListString([a4 UTF8String], &v9, &v8);
  int v5 = objc_msgSend((id)(id)CFPreferencesCopyAppValue(@"useFakeLF", @"com.apple.VideoConference"), "BOOLValue");
  if (v8) {
    int v6 = 1;
  }
  else {
    int v6 = v5;
  }
  if (v8) {
    int v7 = 0;
  }
  else {
    int v7 = v5;
  }
  a3->var2 = v7;
  a3->var3 = 0;
  a3->var0 = v6 | v7;
  a3->var1 = v6;
}

- (void)generateKeyFrameWithFIRType:(int)a3
{
  int v3 = a3;
  v6[1] = *(double *)MEMORY[0x1E4F143B8];
  videoTransmitterint Handle = self->_videoTransmitterHandle;
  if (a3 != 2) {
    *(void *)&a3 = 0;
  }
  VideoTransmitter_GenerateKeyFrameNow((uint64_t)videoTransmitterHandle, 0, *(uint64_t *)&a3, 0, 1, v3);
  v6[0] = NAN;
  VideoTransmitter_GetLastKeyFrameSentTime((uint64_t)self->_videoTransmitterHandle, v6);
  [(VCVideoTransmitterBase *)self setLastKeyFrameSentTime:v6[0]];
}

- (unsigned)setTemporaryMaximumBitrate:(unsigned int)a3
{
  unsigned int result = self->super._temporaryMaximumBitrate;
  if (result == a3) {
    return a3;
  }
  if (self->super._txMaxBitrate >= a3 && self->super._txMinBitrate <= a3)
  {
    VideoTransmitter_SetBitrate((uint64_t)self->_videoTransmitterHandle, a3);
    self->super._temporaryMaximumBitrate = a3;
    return a3;
  }
  return result;
}

- (void)setTargetBitrate:(unsigned int)a3
{
  if (self->super._targetBitrate != a3 && self->super._txMaxBitrate >= a3 && self->super._txMinBitrate <= a3)
  {
    VideoTransmitter_SetTargetBitrate((uint64_t)self->_videoTransmitterHandle, a3, self->super._targetBitrateChangeCounter, 0);
    self->super._targetBitrate = a3;
  }
}

- (void)setTemporalBitrateArray:(id)a3
{
}

- (void)setHighestActiveQualityIndex:(unsigned int)a3
{
}

- (void)setKeyFrameOnlyStreamID:(unsigned __int16)a3
{
}

- (void)setStreamIDs:(unsigned __int16 *)a3 numOfStreamIDs:(unsigned __int8)a4 repairedStreamIDs:(unsigned __int16 *)a5 numOfRepairedStreamIDs:(unsigned __int8)a6
{
}

- (void)setFECRatio:(double)a3
{
}

- (void)setFECRedundancyVector:(id *)a3
{
}

- (void)setIsServerBasedBandwidthProbingEnabled:(BOOL)a3
{
  self->super._isServerBasedBandwidthProbingEnabled = a3;
  VideoTransmitter_SetServerBasedBandwidthProbing((uint64_t)self->_videoTransmitterHandle, a3);
}

- (void)setIsEndToEndBasedBandwidthProbingEnabled:(BOOL)a3
{
  self->super._isEndToEndBasedBandwidthProbingEnabled = a3;
  VideoTransmitter_SetEndToEndBasedBandwidthProbing((uint64_t)self->_videoTransmitterHandle, a3);
}

- (void)collectChannelMetrics:(id *)a3 interval:(float)a4
{
  v9[1] = *(double *)MEMORY[0x1E4F143B8];
  double v8 = 0.0;
  v9[0] = 0.0;
  unsigned int v7 = 0;
  VideoTransmitter_GetBitrate(a4, (uint64_t)self->_videoTransmitterHandle, v9);
  VideoTransmitter_GetFramerate(a4, (uint64_t)self->_videoTransmitterHandle, &v8);
  VideoTransmitter_GetLastVideoSampleTime((uint64_t)self->_videoTransmitterHandle, &v7);
  a3->var0 = (v9[0] / 1000.0);
  a3->var3 = v8;
  a3->var2 = 0;
  a3->var5 = self->super._lastSentAudioHostTime;
  a3->var6 = self->super._lastSentAudioSampleTime;
  a3->var7 = self->_lastSentVideoHostTime;
  a3->var8 = v7;
}

- (void)setMediaSuggestion:(VCRateControlMediaSuggestion *)a3
{
}

- (BOOL)setEncodingMode:(int)a3
{
  return (int)VideoTransmitter_SetEncodingMode((uint64_t)self->_videoTransmitterHandle, *(uint64_t *)&a3) >= 0;
}

- (void)handleThermalLevelChange:(int)a3
{
}

- (void)updateWindowState:(int)a3 isLocal:(BOOL)a4 windowRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  BOOL v9 = a4;
  VideoTransmitter_SetWindowState((uint64_t)self->_videoTransmitterHandle, a4, a3);
  v13.origin.double x = x;
  v13.origin.double y = y;
  v13.size.double width = width;
  v13.size.double height = height;
  if (!CGRectEqualToRect(v13, *MEMORY[0x1E4F1DB28]))
  {
    videoTransmitterint Handle = self->_videoTransmitterHandle;
    VideoTransmitter_SetVisualRectangle(x, y, width, height, (uint64_t)videoTransmitterHandle, v9);
  }
}

- (void)handleActiveConnectionChangeDefault:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  int IsLocalOnCellular = VCConnection_IsLocalOnCellular((uint64_t)a3);
  uint64_t IsRemoteOnCellular = VCConnection_IsRemoteOnCellular((uint64_t)a3);
  videoTransmitterint Handle = self->_videoTransmitterHandle;
  int v8 = VCConnection_LocalCellTech((uint64_t)a3);
  int v9 = VCConnection_RemoteCellTech((uint64_t)a3);
  VideoTransmitter_SetCellTech((uint64_t)videoTransmitterHandle, IsLocalOnCellular, v8, IsRemoteOnCellular, v9);
  if (self->_transmitterMode != 1) {
    goto LABEL_14;
  }
  if ((VCVideoTransmitterDefault *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_13;
    }
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    uint64_t v12 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    unsigned int txMaxBitrate = self->super._txMaxBitrate;
    *(_DWORD *)__int16 v27 = 136316162;
    *(void *)&v27[4] = v11;
    *(_WORD *)&v27[12] = 2080;
    *(void *)&v27[14] = "-[VCVideoTransmitterDefault handleActiveConnectionChangeDefault:]";
    *(_WORD *)&v27[22] = 1024;
    LODWORD(v28) = 510;
    WORD2(v28) = 1024;
    *(_DWORD *)((char *)&v28 + 6) = txMaxBitrate;
    WORD5(v28) = 1024;
    HIDWORD(v28) = [a3 uplinkBitrateCapOneToOne];
    uint64_t v14 = " [%s] %s:%d Received new connection, changing max tx bitrate from [%d] to [%d]";
    __int16 v15 = v12;
    uint32_t v16 = 40;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v10 = (__CFString *)[(VCVideoTransmitterDefault *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v10 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_13;
    }
    uint64_t v17 = VRTraceErrorLogLevelToCSTR();
    int v18 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    unsigned int v19 = self->super._txMaxBitrate;
    *(_DWORD *)__int16 v27 = 136316674;
    *(void *)&v27[4] = v17;
    *(_WORD *)&v27[12] = 2080;
    *(void *)&v27[14] = "-[VCVideoTransmitterDefault handleActiveConnectionChangeDefault:]";
    *(_WORD *)&v27[22] = 1024;
    LODWORD(v28) = 510;
    WORD2(v28) = 2112;
    *(void *)((char *)&v28 + 6) = v10;
    HIWORD(v28) = 2048;
    __int16 v29 = self;
    LOWORD(v30) = 1024;
    *(_DWORD *)((char *)&v30 + 2) = v19;
    HIWORD(v30) = 1024;
    LODWORD(v31) = [a3 uplinkBitrateCapOneToOne];
    uint64_t v14 = " [%s] %s:%d %@(%p) Received new connection, changing max tx bitrate from [%d] to [%d]";
    __int16 v15 = v18;
    uint32_t v16 = 60;
  }
  _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, v27, v16);
LABEL_13:
  self->super._unsigned int txMaxBitrate = objc_msgSend(a3, "uplinkBitrateCapOneToOne", *(_OWORD *)v27, *(void *)&v27[16], v28, v29, v30, v31);
LABEL_14:
  IsIPint v6 = VCConnection_IsIPv6((uint64_t)a3);
  if (self->_transmitterMode != 1 || (IsLocalOnCellular | IsRemoteOnCellular) == 0)
  {
    int v22 = self->_videoTransmitterHandle;
    if (IsLocalOnCellular)
    {
      int v23 = (unsigned __int16)[a3 connectionMTU];
      int v24 = v22;
    }
    else
    {
      int v24 = self->_videoTransmitterHandle;
      int v23 = 1280;
    }
  }
  else
  {
    if ([a3 maxConnectionMTU]) {
      unsigned __int16 v26 = [a3 maxConnectionMTU];
    }
    else {
      unsigned __int16 v26 = [a3 connectionMTU];
    }
    int v23 = v26;
    int v24 = self->_videoTransmitterHandle;
  }
  VideoTransmitter_UpdateMTU((uint64_t)v24, v23, IsIPv6);
  [(VCVideoTransmitterDefault *)self setUpAspectRatios:IsRemoteOnCellular];
}

- (void)handleActiveConnectionChangeMultiway:(id)a3
{
  IsIPint v6 = VCConnection_IsIPv6((uint64_t)a3);
  videoTransmitterint Handle = self->_videoTransmitterHandle;
  int v7 = (unsigned __int16)[a3 maxConnectionMTU];

  VideoTransmitter_UpdateMTU((uint64_t)videoTransmitterHandle, v7, IsIPv6);
}

- (void)handleActiveConnectionChange:(id)a3
{
  if (self->_transmitterMode == 2) {
    [(VCVideoTransmitterDefault *)self handleActiveConnectionChangeMultiway:a3];
  }
  else {
    [(VCVideoTransmitterDefault *)self handleActiveConnectionChangeDefault:a3];
  }
}

- (BOOL)isRtxEnabled
{
  return self->super._rtxEnabled;
}

- (void)setRtxEnabled:(BOOL)a3
{
  self->super._rtxEnabled = a3;
  videoTransmitterint Handle = self->_videoTransmitterHandle;
  if (videoTransmitterHandle != (tagHANDLE *)0xFFFFFFFFLL) {
    VideoTransmitter_SetIsRtxEnabled((uint64_t)videoTransmitterHandle, a3);
  }
}

- (tagHANDLE)videoTransmitterHandle
{
  return self->_videoTransmitterHandle;
}

- (void)initWithConfig:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  int v5 = "-[VCVideoTransmitterDefault initWithConfig:]";
  __int16 v6 = 1024;
  int v7 = 58;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to initialize the transmitter.", (uint8_t *)&v2, 0x1Cu);
}

@end