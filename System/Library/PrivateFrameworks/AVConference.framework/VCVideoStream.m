@interface VCVideoStream
+ (BOOL)isFeatureListStringExpectedForStreamType:(int64_t)a3;
+ (BOOL)isLowLatencyStreamType:(int64_t)a3;
+ (BOOL)shouldEnableRateControlForStreamType:(int64_t)a3;
+ (BOOL)shouldRegisterReportingForStreamType:(int64_t)a3;
+ (BOOL)shouldUseRandomRTPTimestampWithType:(int64_t)a3;
+ (id)capabilities;
+ (id)newFeatureListStringsWithConfiguration:(id)a3;
+ (id)supportedVideoPayloads;
+ (void)terminateProcess:(id)a3 terminateSource:(id)a4 agent:(opaqueRTCReporting *)a5;
- (BOOL)configureStreamInputCaptureSourceWithStreamInputID:(int64_t)a3 frameRate:(unsigned int)a4;
- (BOOL)didReceiveFirstFrame;
- (BOOL)enableRateControlFeebackInConfig:(id)a3;
- (BOOL)isClientSpecificUserInfoSupported:(int)a3;
- (BOOL)isCompoundStreamIDsIncreased;
- (BOOL)isEndToEndBasedBandwidthProbingEnabled;
- (BOOL)isLowLatencyStreamType;
- (BOOL)isScreenConfig:(id)a3;
- (BOOL)isServerBasedBandwidthProbingEnabled;
- (BOOL)isTemporalScalingEnabled;
- (BOOL)isTransportIPv6;
- (BOOL)onConfigureStreamWithConfiguration:(id)a3 error:(id *)a4;
- (BOOL)onVideoFrame:(opaqueCMSampleBuffer *)a3 frameTime:(id *)a4 attribute:(id *)a5;
- (BOOL)registerForCameraCaptureWithConfig:(id)a3;
- (BOOL)registerForVideoCapture;
- (BOOL)setEncodingMode:(int)a3;
- (BOOL)setRTPPayloads:(int *)a3 numPayloads:(int)a4 withError:(id *)a5;
- (BOOL)shouldEnableFaceZoom;
- (BOOL)startSynchronization:(id)a3;
- (BOOL)useUEPForVideoConfig:(int)a3;
- (BOOL)validateStreamConfiguration:(id)a3 error:(id *)a4;
- (BOOL)validateVideoStreamConfigurations:(id)a3;
- (NSNumber)sendingStreamID;
- (NSNumber)targetStreamID;
- (VCVideoReceiverBase)videoReceiver;
- (VCVideoReceiverFeedbackDelegate)getVideoReceiverFeedbackDelegate;
- (VCVideoStream)init;
- (VCVideoStream)initWithTransportSessionID:(unsigned int)a3 idsParticipantID:(unint64_t)a4 ssrc:(unsigned int)a5 streamToken:(int64_t)a6;
- (VCVideoTransmitterBase)videoTransmitter;
- (__CFDictionary)getClientSpecificUserInfo;
- (__CFString)getReportingClientName;
- (__CFString)getReportingServiceName;
- (double)activeVideoStallDuration;
- (double)fecRatio;
- (double)lastReceivedRTCPPacketTime;
- (double)lastReceivedRTPPacketTime;
- (double)lastSentAudioHostTime;
- (double)rtcpHeartbeatLeeway;
- (double)videoRxFrameRate;
- (id)clientCaptureRule;
- (id)copyOnVideoFrameBlock;
- (id)getReceiveStatsCollectorWithStreamConfig:(id)a3;
- (id)getTransmitMediaControllerWithStreamConfig:(id)a3;
- (id)getTransmitStatsCollectorWithStreamConfig:(id)a3;
- (id)newScreenCaptureConfigForVideoConfig:(id)a3;
- (id)newVideoTransmitterConfigWithVideoStreamConfig:(id)a3;
- (id)supportedPayloads;
- (int)operatingModeForVideoStreamType:(int64_t)a3;
- (int)pickScreenDisplayMode;
- (int)remoteCameraReportingClientType;
- (int)reportVideoStreamType;
- (int)screenSharingReportingClientType;
- (tagVCNACKGeneratorStoreBagsConfig)readServerPacketRetransmissionsForVideoStoreBagConfig:(SEL)a3;
- (tagVCVideoReceiverConfig)videoReceiverConfigWithVideoStreamConfig:(SEL)a3;
- (tagVCVideoReceiverDelegateRealtimeInstanceVTable)videoReceiverDelegateFunctions;
- (tagVCVideoStreamReceiverConfig)videoStreamReceiverConfigWithDumpID:(SEL)a3 reportingAgent:(unsigned int)a4;
- (unsigned)customHeight;
- (unsigned)customWidth;
- (unsigned)dumpIDFromCallID;
- (unsigned)getMaxTemporalBitrateForStreamIDs:(id)a3;
- (unsigned)lastDisplayedFrameRTPTimestamp;
- (unsigned)lastSentAudioSampleTime;
- (unsigned)maxFramerateFromStreamConfigs:(id)a3;
- (unsigned)networkMTU;
- (unsigned)screenDisplayID;
- (unsigned)targetBitrateChangeCounter;
- (unsigned)targetEncoderBitrate;
- (unsigned)vcVideoReceiver:(id)a3 receivedTMMBR:(unsigned int)a4;
- (void)addReceiverStreamConfigsToReceiverConfig:(tagVCVideoReceiverConfig *)a3 streamConfig:(id)a4;
- (void)avConferencePreviewError:(id)a3;
- (void)avConferenceScreenCaptureError:(id)a3;
- (void)cameraAvailabilityDidChange:(BOOL)a3;
- (void)cleanupBeforeReconfigure:(id)a3;
- (void)cleaunpReceiverConfig:(tagVCVideoReceiverConfig *)a3;
- (void)collectImageQueuePerformanceMetrics:(__CFDictionary *)a3;
- (void)collectRxChannelMetrics:(id *)a3;
- (void)collectRxChannelMetrics:(id *)a3 interval:(float)a4;
- (void)collectTxChannelMetrics:(id *)a3;
- (void)configureMediaStallSettingsWithConfig:(id)a3;
- (void)dealloc;
- (void)deregisterCurrentStreamInputCaptureSource;
- (void)deregisterForVideoCapture;
- (void)destroyVideoModules;
- (void)destroyVideoReceiver;
- (void)destroyVideoTransmitter;
- (void)enableRedundancyController:(id)a3;
- (void)gatherRealtimeStats:(__CFDictionary *)a3;
- (void)generateKeyFrameWithFIRType:(int)a3;
- (void)handleActiveConnectionChange:(id)a3;
- (void)handleNWConnectionNotification:(tagVCNWConnectionNotification *)a3;
- (void)handleNWConnectionPacketEvent:(packet_id *)a3 eventType:(int)a4;
- (void)handleThermalPressureNotification:(id)a3;
- (void)handleVTPSendFailedWithData:(void *)a3;
- (void)initVideoTransmitter;
- (void)onPauseWithCompletionHandler:(id)a3;
- (void)onRTCPTimeout;
- (void)onRTPTimeout;
- (void)onResumeWithCompletionHandler:(id)a3;
- (void)onSendRTCPPacket;
- (void)onStartWithCompletionHandler:(id)a3;
- (void)onStopWithCompletionHandler:(id)a3;
- (void)overrideConfigWithDefaults:(id)a3;
- (void)rateAdaptation:(id)a3 targetBitrateDidChange:(unsigned int)a4 rateChangeCounter:(unsigned int)a5;
- (void)redundancyController:(id)a3 redundancyPercentageDidChange:(unsigned int)a4;
- (void)redundancyController:(id)a3 redundancyVectorDidChange:(id *)a4;
- (void)reportFailedToRegisterVideoFramesFromSource:(int)a3 width:(int)a4 height:(int)a5 frameRate:(int)a6;
- (void)reportStreamPerfTimings;
- (void)requestLastDecodedFrame;
- (void)resetRemoteMediaStalled;
- (void)sendLastRemoteVideoFrame:(__CVBuffer *)a3;
- (void)setCustomHeight:(unsigned int)a3;
- (void)setCustomWidth:(unsigned int)a3;
- (void)setDeferredAssemblyEnabled:(BOOL)a3;
- (void)setDidReceiveFirstFrame:(BOOL)a3;
- (void)setFECRedundancyVector:(id *)a3;
- (void)setFecRatio:(double)a3;
- (void)setIsEndToEndBasedBandwidthProbingEnabled:(BOOL)a3;
- (void)setIsServerBasedBandwidthProbingEnabled:(BOOL)a3;
- (void)setJitterBufferMode:(int)a3;
- (void)setLastSentAudioHostTime:(double)a3;
- (void)setLastSentAudioSampleTime:(unsigned int)a3;
- (void)setLooseAVSyncEnabled:(BOOL)a3;
- (void)setMediaSuggestion:(VCRateControlMediaSuggestion *)a3;
- (void)setPeerSubscribedStreamIDs:(id)a3;
- (void)setScreenDisplayID:(unsigned int)a3;
- (void)setShouldEnableFaceZoom:(BOOL)a3;
- (void)setShouldEnableMLEnhance:(BOOL)a3 streamID:(unsigned __int16)a4;
- (void)setStreamIDs:(id)a3 repairStreamIDs:(id)a4;
- (void)setTargetBitrateChangeCounter:(unsigned int)a3;
- (void)setTargetEncoderBitrate:(unsigned int)a3;
- (void)setTargetStreamID:(id)a3;
- (void)setTransmitterStreamIDs:(id)a3 repairStreamIDs:(id)a4;
- (void)setUplinkRetransmissionEnabled:(BOOL)a3;
- (void)setVideoExpected:(BOOL)a3;
- (void)setVideoReceiverFeedbackDelegate:(id)a3;
- (void)setVideoStreamDelegate:(id)a3 delegateFunctions:(const tagVCVideoStreamDelegateRealtimeInstanceVTable *)a4;
- (void)setupColorInfo:(id)a3;
- (void)setupCompoundStreamIDsWithStreamIDs:(id)a3;
- (void)setupInternalRedundancyControllerWithStreamConfig:(id)a3;
- (void)setupMultiwayVideoReceiverConfig:(tagVCVideoReceiverConfig *)a3 forTransportStream:(id)a4;
- (void)setupMultiwayVideoReceiverStreamSwitchInfo:(tagVCVideoReceiverStreamConfig *)a3 forTransportStream:(id)a4;
- (void)setupMultiwayVideoReceiverTemporalScalingConfig:(tagVCVideoReceiverStreamConfig *)a3 forTransportStream:(id)a4;
- (void)setupReportingAgent;
- (void)setupThermalNotifications;
- (void)setupVideoReceiver:(id)a3 withTransmitterHandle:(tagHANDLE *)a4;
- (void)setupVideoStream;
- (void)setupVideoTransmitterConfigColorInfo:(id)a3;
- (void)sourceFrameRateDidChange:(unsigned int)a3;
- (void)startRateAdaptationWithStreamConfig:(id)a3;
- (void)stopRateAdaptation;
- (void)stopSynchronization;
- (void)thermalLevelDidChange:(int)a3;
- (void)updateShouldCacheRemoteVideoFrame;
- (void)updateSourcePlayoutTime:(const tagVCMediaTime *)a3;
- (void)updateVideoConfig:(id)a3;
- (void)updateVideoReceiver:(id)a3;
- (void)updateWindowState:(int)a3 isLocal:(BOOL)a4 windowRect:(CGRect)a5;
- (void)vcVideoReceiver:(id)a3 didSwitchFromStreamID:(unsigned __int16)a4 toStreamID:(unsigned __int16)a5;
- (void)vcVideoReceiver:(id)a3 downlinkQualityDidChange:(id)a4;
- (void)vcVideoReceiver:(id)a3 requestKeyFrameGenerationWithStreamID:(unsigned __int16)a4 firType:(int)a5;
- (void)vcVideoReceiverRequestKeyFrame:(id)a3 rtcpPSFBType:(unsigned int)a4;
@end

@implementation VCVideoStream

- (void)overrideConfigWithDefaults:(id)a3
{
  unsigned int v4 = [+[VCDefaults sharedInstance] forceVideoStreamResolution];
  if (v4 <= 0xD) {
    [a3 setVideoResolution:v4];
  }
  int v5 = [+[VCDefaults sharedInstance] forceVideoStreamTxMaxBitrate];
  if (v5 >= 1) {
    [a3 setTxMaxBitrate:v5];
  }
  int v6 = [+[VCDefaults sharedInstance] forceVideoStreamTxMinBitrate];
  if (v6 >= 1) {
    [a3 setTxMinBitrate:v6];
  }
  int v7 = [+[VCDefaults sharedInstance] forceVideoStreamFramerate];
  if (v7 >= 1) {
    [a3 setFramerate:v7];
  }
  int v8 = [+[VCDefaults sharedInstance] forceVideoStreamKeyFrameInterval];
  if (v8 >= 1) {
    [a3 setKeyFrameInterval:v8];
  }
  int v9 = [+[VCDefaults sharedInstance] forceVideoStreamRxMaxBitrate];
  if (v9 >= 1) {
    [a3 setRxMaxBitrate:v9];
  }
  int v10 = [+[VCDefaults sharedInstance] forceVideoStreamRxMinBitrate];
  if (v10 >= 1)
  {
    [a3 setRxMinBitrate:v10];
  }
}

- (id)newVideoTransmitterConfigWithVideoStreamConfig:(id)a3
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  int v5 = objc_alloc_init(VCVideoTransmitterConfig);
  if ([(VCMediaStreamMultiwayConfig *)[(VCMediaStreamConfig *)[(VCMediaStream *)self defaultStreamConfig] multiwayConfig] hasQualityIndex])
  {
    [(VCVideoTransmitterConfig *)v5 setQualityIndex:[(VCMediaStreamMultiwayConfig *)[(VCMediaStreamConfig *)[(VCMediaStream *)self defaultStreamConfig] multiwayConfig] qualityIndex]];
  }
  -[VCVideoTransmitterConfig setVideoResolution:](v5, "setVideoResolution:", [a3 videoResolution]);
  [(VCVideoTransmitterConfig *)v5 setVideoSource:3];
  -[VCVideoTransmitterConfig setFramerate:](v5, "setFramerate:", [a3 framerate]);
  -[VCVideoTransmitterConfig setCodecType:](v5, "setCodecType:", [a3 primaryTxCodecType]);
  -[VCVideoTransmitterConfig setTxMaxBitrate:](v5, "setTxMaxBitrate:", [a3 txMaxBitrate]);
  -[VCVideoTransmitterConfig setTxMinBitrate:](v5, "setTxMinBitrate:", [a3 txMinBitrate]);
  -[VCVideoTransmitterConfig setKeyFrameInterval:](v5, "setKeyFrameInterval:", [a3 keyFrameInterval]);
  -[VCVideoTransmitterConfig setEnableCVO:](v5, "setEnableCVO:", [a3 enableCVO]);
  -[VCVideoTransmitterConfig setCvoExtensionID:](v5, "setCvoExtensionID:", [a3 cvoExtensionID]);
  -[VCVideoTransmitterConfig setRecommendedMTU:](v5, "setRecommendedMTU:", [a3 recommendedMTU]);
  [(VCVideoTransmitterConfig *)v5 setReportingAgent:[(VCObject *)self reportingAgent]];
  [(VCVideoTransmitterConfig *)v5 setReportingParentID:self->_reportingModuleID];
  [(VCVideoTransmitterConfig *)v5 setStatisticsCollector:[(VCVideoStream *)self getTransmitStatsCollectorWithStreamConfig:a3]];
  -[VCVideoTransmitterConfig setVideoPayload:](v5, "setVideoPayload:", +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", [a3 primaryTxCodecType]));
  -[VCVideoTransmitterConfig setEncodingMode:](v5, "setEncodingMode:", [a3 encodingMode]);
  -[VCVideoTransmitterConfig setEncoderUsage:](v5, "setEncoderUsage:", [a3 encoderUsage]);
  -[VCVideoTransmitterConfig setVideoPriorityPointer:](v5, "setVideoPriorityPointer:", [a3 videoPriorityPointer]);
  -[VCVideoTransmitterConfig setTilesPerFrame:](v5, "setTilesPerFrame:", [a3 tilesPerFrame]);
  -[VCVideoTransmitterConfig setPixelFormat:](v5, "setPixelFormat:", [a3 pixelFormat]);
  -[VCVideoTransmitterConfig setRemoteIDSParticipantID:](v5, "setRemoteIDSParticipantID:", objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "remoteIDSParticipantID"));
  [(VCVideoTransmitterConfig *)v5 setMediaController:[(VCVideoStream *)self getTransmitMediaControllerWithStreamConfig:a3]];
  [(VCVideoTransmitterConfig *)v5 setMediaControlInfoGenerator:[(VCMediaStream *)self mediaControlInfoGenerator]];
  [(VCVideoTransmitterConfig *)v5 setRtpTimestampRate:self->_rtpTimestampRate];
  -[VCVideoTransmitterConfig setProfileLevel:](v5, "setProfileLevel:", [a3 profileLevel]);
  -[VCVideoTransmitterConfig setParameterSets:](v5, "setParameterSets:", [a3 parameterSets]);
  -[VCVideoTransmitterConfig setTemporalScalingEnabled:](v5, "setTemporalScalingEnabled:", [a3 temporalScalingEnabled]);
  -[VCVideoTransmitterConfig setMaxEncoderPixels:](v5, "setMaxEncoderPixels:", [a3 maxEncoderPixels]);
  -[VCVideoTransmitterConfig setRtxEnabled:](v5, "setRtxEnabled:", [a3 isUplinkRetransmissionEnabled]);
  [(VCVideoTransmitterConfig *)v5 setMinKeyFrameGenerationIntervalInSeconds:0.25];
  -[VCVideoTransmitterConfig setFoveationEnabled:](v5, "setFoveationEnabled:", [a3 foveationEnabled]);
  [(VCVideoStream *)self setupVideoTransmitterConfigColorInfo:v5];
  if (self->super._isRTTBasedFIRThrottlingEnabled)
  {
    objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-video-transmitter-minimum-key-frame-generation-interval-for-facetime", @"minimumKeyFrameGenerationIntervalFaceTime", &unk_1F3DC8B80, 1), "doubleValue");
    -[VCVideoTransmitterConfig setMinKeyFrameGenerationIntervalInSeconds:](v5, "setMinKeyFrameGenerationIntervalInSeconds:");
  }
  if ([a3 videoResolution] == 27)
  {
    -[VCVideoTransmitterConfig setCustomWidth:](v5, "setCustomWidth:", [a3 customWidth]);
    -[VCVideoTransmitterConfig setCustomHeight:](v5, "setCustomHeight:", [a3 customHeight]);
  }
  if ([a3 temporalScalingEnabled])
  {
    -[VCVideoTransmitterConfig setTxMaxBitrate:](v5, "setTxMaxBitrate:", objc_msgSend((id)objc_msgSend((id)-[NSMutableArray lastObject](self->super._transportArray, "lastObject"), "streamConfig"), "txMaxBitrate"));
    -[VCVideoTransmitterConfig setTxMinBitrate:](v5, "setTxMinBitrate:", objc_msgSend((id)objc_msgSend((id)-[NSMutableArray firstObject](self->super._transportArray, "firstObject"), "streamConfig"), "txMinBitrate"));
    [(VCVideoTransmitterConfig *)v5 setMaxSupportedTemporalLayers:+[VCHardwareSettings maxVCPSupportedTemporalLayers]];
  }
  id v64 = a3;
  if ([(NSMutableArray *)self->super._transportArray count] == 1
    && [a3 temporalScalingEnabled]
    && objc_msgSend((id)objc_msgSend(a3, "txBitrateTiers"), "count"))
  {
    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    int v6 = (void *)[a3 txBitrateTiers];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v91 objects:v90 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v92;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v92 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v91 + 1) + 8 * i);
          uint64_t v12 = objc_msgSend((id)-[NSMutableArray firstObject](self->super._transportArray, "firstObject"), "rtpHandle");
          uint64_t v13 = [(VCVideoTransmitterConfig *)v5 streamConfigs];
          *(void *)(v13 + 32 * [(VCVideoTransmitterConfig *)v5 streamCount]) = v12;
          LODWORD(v11) = [v11 unsignedIntValue];
          uint64_t v14 = [(VCVideoTransmitterConfig *)v5 streamConfigs];
          *(_DWORD *)(v14 + 32 * [(VCVideoTransmitterConfig *)v5 streamCount] + 16) = v11;
          LOWORD(v11) = objc_msgSend((id)-[NSMutableArray firstObject](self->super._transportArray, "firstObject"), "idsStreamId");
          uint64_t v15 = [(VCVideoTransmitterConfig *)v5 streamConfigs];
          *(_WORD *)(v15 + 32 * [(VCVideoTransmitterConfig *)v5 streamCount] + 8) = (_WORD)v11;
          uint64_t v16 = objc_msgSend((id)-[NSMutableArray firstObject](self->super._transportArray, "firstObject"), "transmitterSframeCryptor");
          uint64_t v17 = [(VCVideoTransmitterConfig *)v5 streamConfigs];
          *(void *)(v17 + 32 * [(VCVideoTransmitterConfig *)v5 streamCount] + 24) = v16;
          [(VCVideoTransmitterConfig *)v5 setStreamCount:[(VCVideoTransmitterConfig *)v5 streamCount] + 1];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v91 objects:v90 count:16];
      }
      while (v8);
    }
  }
  else
  {
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    transportArray = self->super._transportArray;
    uint64_t v19 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v86 objects:v85 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v87;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v87 != v21) {
            objc_enumerationMutation(transportArray);
          }
          v23 = *(void **)(*((void *)&v86 + 1) + 8 * j);
          v24 = (void *)[v23 streamConfig];
          uint64_t v25 = [v23 rtpHandle];
          uint64_t v26 = [(VCVideoTransmitterConfig *)v5 streamConfigs];
          *(void *)(v26 + 32 * [(VCVideoTransmitterConfig *)v5 streamCount]) = v25;
          LODWORD(v24) = [v24 txMaxBitrate];
          uint64_t v27 = [(VCVideoTransmitterConfig *)v5 streamConfigs];
          *(_DWORD *)(v27 + 32 * [(VCVideoTransmitterConfig *)v5 streamCount] + 16) = v24;
          LOWORD(v24) = [v23 idsStreamId];
          uint64_t v28 = [(VCVideoTransmitterConfig *)v5 streamConfigs];
          *(_WORD *)(v28 + 32 * [(VCVideoTransmitterConfig *)v5 streamCount] + 8) = (_WORD)v24;
          uint64_t v29 = [v23 transmitterSframeCryptor];
          uint64_t v30 = [(VCVideoTransmitterConfig *)v5 streamConfigs];
          *(void *)(v30 + 32 * [(VCVideoTransmitterConfig *)v5 streamCount] + 24) = v29;
          [(VCVideoTransmitterConfig *)v5 setStreamCount:[(VCVideoTransmitterConfig *)v5 streamCount] + 1];
        }
        uint64_t v20 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v86 objects:v85 count:16];
      }
      while (v20);
    }
  }
  switch([v64 type])
  {
    case 1:
    case 6:
      goto LABEL_49;
    case 2:
      [(VCVideoTransmitterConfig *)v5 setIsIPv6:[(VCVideoStream *)self isTransportIPv6]];
      [(VCVideoTransmitterConfig *)v5 setMode:5];
      [(VCVideoTransmitterConfig *)v5 setEncoderUsage:1];
      [(VCVideoTransmitterConfig *)v5 setMinKeyFrameGenerationIntervalInSeconds:0.01];
      [(VCVideoTransmitterConfig *)v5 setUseRateControl:1];
      [(VCVideoTransmitterConfig *)v5 setReinitEncoderOnFrameSizeChangeEnabled:1];
      [(VCVideoTransmitterConfig *)v5 setCaptureSource:2];
      v31 = (void *)[v64 txCodecFeatureListStrings];
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __64__VCVideoStream_newVideoTransmitterConfigWithVideoStreamConfig___block_invoke;
      v68[3] = &unk_1E6DB93A8;
      v68[4] = v5;
      [v31 enumerateKeysAndObjectsUsingBlock:v68];
      if ([v64 hdrMode] == 1)
      {
        uint64_t v32 = *MEMORY[0x1E4F24AA8];
        uint64_t v33 = *MEMORY[0x1E4F44B58];
        v83[0] = *MEMORY[0x1E4F44868];
        v83[1] = v33;
        uint64_t v34 = *MEMORY[0x1E4F24BF8];
        v84[0] = v32;
        v84[1] = v34;
        v83[2] = *MEMORY[0x1E4F44BB0];
        v84[2] = *MEMORY[0x1E4F24C30];
        v35 = (void *)MEMORY[0x1E4F1C9E8];
        v36 = v84;
        v37 = v83;
        uint64_t v38 = 3;
      }
      else
      {
        if ([v64 hdrMode] != 2) {
          return v5;
        }
        uint64_t v48 = *MEMORY[0x1E4F24BF8];
        uint64_t v49 = *MEMORY[0x1E4F44BB0];
        v81[0] = *MEMORY[0x1E4F44B58];
        v81[1] = v49;
        uint64_t v50 = *MEMORY[0x1E4F24C28];
        v82[0] = v48;
        v82[1] = v50;
        v35 = (void *)MEMORY[0x1E4F1C9E8];
        v36 = v82;
        v37 = v81;
        uint64_t v38 = 2;
      }
      -[VCVideoTransmitterConfig setColorInfo:](v5, "setColorInfo:", [v35 dictionaryWithObjects:v36 forKeys:v37 count:v38]);
      return v5;
    case 3:
      if (objc_msgSend((id)objc_msgSend(v64, "multiwayConfig"), "isOneToOne")) {
        uint64_t v39 = 1;
      }
      else {
        uint64_t v39 = 2;
      }
      [(VCVideoTransmitterConfig *)v5 setMode:v39];
      if (![(VCVideoTransmitterConfig *)v5 encoderUsage]) {
        [(VCVideoTransmitterConfig *)v5 setEncoderUsage:2];
      }
      if ([(VCVideoTransmitterConfig *)v5 mode] == 2) {
        [(VCVideoTransmitterConfig *)v5 setMinKeyFrameGenerationIntervalInSeconds:1.0];
      }
      -[VCVideoTransmitterConfig setIsFecGeneratorEnabled:](v5, "setIsFecGeneratorEnabled:", [v64 fecGeneratorEnabled]);
      -[VCVideoTransmitterConfig setFecHeaderV1Enabled:](v5, "setFecHeaderV1Enabled:", [v64 fecHeaderVersion] == 1);
      -[VCVideoTransmitterConfig setUseRateControl:](v5, "setUseRateControl:", objc_msgSend((id)objc_msgSend(v64, "multiwayConfig"), "isOneToOne"));
      int v40 = objc_msgSend((id)objc_msgSend(v64, "multiwayConfig"), "isOneToOne");
      v41 = self;
      if (v40) {
        v41 = (VCVideoStream *)[v64 rateControlConfig];
      }
      [(VCVideoTransmitterConfig *)v5 setMediaControlInfoGenerator:[(VCMediaStream *)v41 mediaControlInfoGenerator]];
      -[VCVideoTransmitterConfig setUseInBandFec:](v5, "setUseInBandFec:", [v64 useInBandFEC]);
      [(VCVideoTransmitterConfig *)v5 setSetupBWEstimationOptionWithFeatureString:0];
      if (HIDWORD(self->_colorInfo)) {
        -[VCVideoTransmitterConfig setRecommendedMTU:](v5, "setRecommendedMTU:");
      }
      if (![(VCVideoStream *)self isScreenConfig:v64])
      {
        [(VCVideoTransmitterConfig *)v5 setPixelFormat:VCVideoUtil_DefaultCameraCapturePixelFormat()];
        goto LABEL_78;
      }
      if ((VCVideoStream *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v51 = VRTraceErrorLogLevelToCSTR();
          v52 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v53 = objc_msgSend((id)objc_msgSend(v64, "multiwayConfig"), "isOneToOne");
            v54 = "No";
            uint64_t v70 = v51;
            *(_DWORD *)buf = 136315906;
            v72 = "-[VCVideoStream newVideoTransmitterConfigWithVideoStreamConfig:]";
            __int16 v71 = 2080;
            if (v53) {
              v54 = "Yes";
            }
            __int16 v73 = 1024;
            int v74 = 394;
            __int16 v75 = 2080;
            v76 = (void *)v54;
            v55 = "VCVideoStream [%s] %s:%d Configured for Screen Sharing (isOneToOne=%s)";
            v56 = v52;
            uint32_t v57 = 38;
            goto LABEL_73;
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          v42 = (__CFString *)[(VCVideoStream *)self performSelector:sel_logPrefix];
        }
        else {
          v42 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v58 = VRTraceErrorLogLevelToCSTR();
          v59 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v60 = objc_msgSend((id)objc_msgSend(v64, "multiwayConfig"), "isOneToOne");
            *(_DWORD *)buf = 136316418;
            v61 = "No";
            uint64_t v70 = v58;
            v72 = "-[VCVideoStream newVideoTransmitterConfigWithVideoStreamConfig:]";
            __int16 v71 = 2080;
            __int16 v73 = 1024;
            if (v60) {
              v61 = "Yes";
            }
            int v74 = 394;
            __int16 v75 = 2112;
            v76 = v42;
            __int16 v77 = 2048;
            v78 = self;
            __int16 v79 = 2080;
            v80 = v61;
            v55 = "VCVideoStream [%s] %s:%d %@(%p) Configured for Screen Sharing (isOneToOne=%s)";
            v56 = v59;
            uint32_t v57 = 58;
LABEL_73:
            _os_log_impl(&dword_1E1EA4000, v56, OS_LOG_TYPE_DEFAULT, v55, buf, v57);
          }
        }
      }
      -[VCVideoTransmitterConfig setCaptureSource:](v5, "setCaptureSource:", [v64 captureSource]);
      [(VCVideoTransmitterConfig *)v5 setEncoderUsage:5];
      [(VCVideoTransmitterConfig *)v5 setSetupBWEstimationOptionWithFeatureString:0];
      [(VCVideoTransmitterConfig *)v5 setReinitEncoderOnFrameSizeChangeEnabled:0];
      if ((+[VCHardwareSettings deviceClass] == 8
         || !+[VCHardwareSettings deviceClass])
        && [v64 captureSource] == 1)
      {
        [(VCVideoTransmitterConfig *)v5 setReinitEncoderOnFrameSizeChangeEnabled:1];
      }
LABEL_78:
      if (objc_msgSend(v64, "rtcpPSFB_LTRAckEnabled")) {
        uint64_t v62 = 2;
      }
      else {
        uint64_t v62 = 1;
      }
      [(VCVideoTransmitterConfig *)v5 setLtrAckFeedbackType:v62];
      v43 = (void *)[v64 txCodecFeatureListStrings];
      v65[0] = MEMORY[0x1E4F143A8];
      v65[1] = 3221225472;
      v65[2] = __64__VCVideoStream_newVideoTransmitterConfigWithVideoStreamConfig___block_invoke_13;
      v65[3] = &unk_1E6DB93A8;
      v65[4] = v5;
      v44 = v65;
LABEL_82:
      [v43 enumerateKeysAndObjectsUsingBlock:v44];
      return v5;
    case 4:
      [(VCVideoTransmitterConfig *)v5 setEncoderBitrateAveragingInterval:150];
LABEL_49:
      [(VCVideoTransmitterConfig *)v5 setIsIPv6:[(VCVideoStream *)self isTransportIPv6]];
      [(VCVideoTransmitterConfig *)v5 setMode:3];
      [(VCVideoTransmitterConfig *)v5 setEncoderUsage:1];
      [(VCVideoTransmitterConfig *)v5 setMinKeyFrameGenerationIntervalInSeconds:0.01];
      [(VCVideoTransmitterConfig *)v5 setUseRateControl:1];
      v43 = (void *)[v64 txCodecFeatureListStrings];
      v67[0] = MEMORY[0x1E4F143A8];
      v67[1] = 3221225472;
      v67[2] = __64__VCVideoStream_newVideoTransmitterConfigWithVideoStreamConfig___block_invoke_2;
      v67[3] = &unk_1E6DB93A8;
      v67[4] = v5;
      v44 = v67;
      goto LABEL_82;
    case 5:
      [(VCVideoTransmitterConfig *)v5 setMode:5];
      if ([v64 tilesPerFrame] == 1) {
        uint64_t v45 = 5;
      }
      else {
        uint64_t v45 = 1;
      }
      [(VCVideoTransmitterConfig *)v5 setEncoderUsage:v45];
      uint64_t v46 = [v64 tilesPerFrame];
      double v47 = 0.01;
      if (v46 == 1) {
        double v47 = 1.0;
      }
      [(VCVideoTransmitterConfig *)v5 setMinKeyFrameGenerationIntervalInSeconds:v47];
      [(VCVideoTransmitterConfig *)v5 setIsFecGeneratorEnabled:0];
      [(VCVideoTransmitterConfig *)v5 setFecHeaderV1Enabled:0];
      -[VCVideoTransmitterConfig setFecEnabled:](v5, "setFecEnabled:", [v64 fecEnabled]);
      -[VCVideoTransmitterConfig setRtxEnabled:](v5, "setRtxEnabled:", [v64 rtxEnabled]);
      -[VCVideoTransmitterConfig setAccessNetworkType:](v5, "setAccessNetworkType:", [v64 accessNetworkType]);
      [(VCVideoTransmitterConfig *)v5 setUseRateControl:1];
      [(VCVideoTransmitterConfig *)v5 setMediaControlInfoGenerator:[(VCMediaStream *)self mediaControlInfoGenerator]];
      -[VCVideoTransmitterConfig setUseInBandFec:](v5, "setUseInBandFec:", [v64 useInBandFEC]);
      -[VCVideoTransmitterConfig setCaptureSource:](v5, "setCaptureSource:", [v64 captureSource]);
      if ([v64 tilesPerFrame] == 1)
      {
        -[VCVideoTransmitterConfig setMaxEncoderPixels:](v5, "setMaxEncoderPixels:", [v64 customHeight] * objc_msgSend(v64, "customWidth"));
        [(VCVideoTransmitterConfig *)v5 setReinitEncoderOnFrameSizeChangeEnabled:1];
      }
      v43 = (void *)[v64 txCodecFeatureListStrings];
      v66[0] = MEMORY[0x1E4F143A8];
      v66[1] = 3221225472;
      v66[2] = __64__VCVideoStream_newVideoTransmitterConfigWithVideoStreamConfig___block_invoke_3;
      v66[3] = &unk_1E6DB93A8;
      v66[4] = v5;
      v44 = v66;
      goto LABEL_82;
    default:
      [(VCVideoTransmitterConfig *)v5 setMode:6];
      if (![(VCVideoTransmitterConfig *)v5 encoderUsage]) {
        [(VCVideoTransmitterConfig *)v5 setEncoderUsage:2];
      }
      [(VCVideoTransmitterConfig *)v5 setPixelFormat:875704438];
      return v5;
  }
}

uint64_t __64__VCVideoStream_newVideoTransmitterConfigWithVideoStreamConfig___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", [a2 unsignedIntValue]);
  int v6 = *(void **)(a1 + 32);

  return [v6 addCustomFeatureListString:a3 payload:v5];
}

uint64_t __64__VCVideoStream_newVideoTransmitterConfigWithVideoStreamConfig___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", [a2 unsignedIntValue]);
  int v6 = *(void **)(a1 + 32);

  return [v6 addCustomFeatureListString:a3 payload:v5];
}

uint64_t __64__VCVideoStream_newVideoTransmitterConfigWithVideoStreamConfig___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", [a2 unsignedIntValue]);
  int v6 = *(void **)(a1 + 32);

  return [v6 addCustomFeatureListString:a3 payload:v5];
}

uint64_t __64__VCVideoStream_newVideoTransmitterConfigWithVideoStreamConfig___block_invoke_13(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", [a2 unsignedIntValue]);
  int v6 = *(void **)(a1 + 32);

  return [v6 addCustomFeatureListString:a3 payload:v5];
}

- (void)initVideoTransmitter
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v3 = [(VCMediaStream *)self defaultStreamConfig];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v30 = 136315906;
      *(void *)&v30[4] = v4;
      *(_WORD *)&v30[12] = 2080;
      *(void *)&v30[14] = "-[VCVideoStream initVideoTransmitter]";
      *(_WORD *)&v30[22] = 1024;
      LODWORD(v31) = 430;
      WORD2(v31) = 2048;
      *(void *)((char *)&v31 + 6) = self;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d VCVideoStream[%p]", v30, 0x26u);
    }
  }
  id v6 = [(VCVideoStream *)self newVideoTransmitterConfigWithVideoStreamConfig:v3];
  unint64_t v7 = [(VCMediaStreamConfig *)v3 type];
  uint64_t v8 = &OBJC_IVAR___AVCPreviewCALayerHost__preview;
  if (v7 <= 6)
  {
    if (((1 << v7) & 0x76) != 0)
    {
      uint64_t v9 = VCVideoTransmitterDefault;
LABEL_7:
      self->_videoTransmitter = (VCVideoTransmitterBase *)[[v9 alloc] initWithConfig:v6];
      goto LABEL_8;
    }
    if (!v7)
    {
      uint64_t v9 = VCVideoStreamTransmitter;
      goto LABEL_7;
    }
    self->_videoTransmitter = (VCVideoTransmitterBase *)[[VCVideoTransmitterDefault alloc] initWithConfig:v6];
    v22 = [(VCMediaStreamConfig *)[(VCMediaStream *)self defaultStreamConfig] multiwayConfig];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v23 = (void *)[(VCMediaStreamMultiwayConfig *)v22 subStreamConfigs];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v35 objects:v34 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v36 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          uint64_t v29 = [v28 keyFrameInterval];
          if (v29 == [v28 framerate]) {
            -[VCVideoTransmitterBase setKeyFrameOnlyStreamID:](self->_videoTransmitter, "setKeyFrameOnlyStreamID:", [v28 idsStreamID]);
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v35 objects:v34 count:16];
      }
      while (v25);
    }
    [(VCObject *)self reportingAgent];
    [(VCVideoTransmitterBase *)self->_videoTransmitter encodingWidth];
    [(VCVideoTransmitterBase *)self->_videoTransmitter encodingHeight];
    [(VCVideoTransmitterBase *)self->_videoTransmitter targetFramerate];
    reportingVideoProp();
    uint64_t v8 = &OBJC_IVAR___AVCPreviewCALayerHost__preview;
  }
LABEL_8:
  if ((VCVideoStream *)objc_opt_class() != self)
  {
    if (objc_opt_respondsToSelector()) {
      int v10 = (__CFString *)[(VCVideoStream *)self performSelector:sel_logPrefix];
    }
    else {
      int v10 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_19;
    }
    uint64_t v17 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    uint64_t v19 = *(uint64_t *)((char *)&self->super.super.super.isa + v8[573]);
    *(_DWORD *)uint64_t v30 = 136316418;
    *(void *)&v30[4] = v17;
    *(_WORD *)&v30[12] = 2080;
    *(void *)&v30[14] = "-[VCVideoStream initVideoTransmitter]";
    *(_WORD *)&v30[22] = 1024;
    LODWORD(v31) = 456;
    WORD2(v31) = 2112;
    *(void *)((char *)&v31 + 6) = v10;
    HIWORD(v31) = 2048;
    uint64_t v32 = self;
    LOWORD(v33) = 2048;
    *(void *)((char *)&v33 + 2) = v19;
    uint64_t v14 = "VCVideoStream [%s] %s:%d %@(%p) videoTransmitter=%p";
    uint64_t v15 = v18;
    uint32_t v16 = 58;
    goto LABEL_18;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    uint64_t v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(uint64_t *)((char *)&self->super.super.super.isa + v8[573]);
      *(_DWORD *)uint64_t v30 = 136315906;
      *(void *)&v30[4] = v11;
      *(_WORD *)&v30[12] = 2080;
      *(void *)&v30[14] = "-[VCVideoStream initVideoTransmitter]";
      *(_WORD *)&v30[22] = 1024;
      LODWORD(v31) = 456;
      WORD2(v31) = 2048;
      *(void *)((char *)&v31 + 6) = v13;
      uint64_t v14 = "VCVideoStream [%s] %s:%d videoTransmitter=%p";
      uint64_t v15 = v12;
      uint32_t v16 = 38;
LABEL_18:
      _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, v30, v16);
    }
  }
LABEL_19:

  [(VCVideoCaptureConverter *)self->_captureConverter setDestinationFramerate:[(VCMediaStreamConfig *)v3 framerate]];
  -[VCVideoCaptureConverter setSourceFramerate:](self->_captureConverter, "setSourceFramerate:", objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "getCaptureFrameRateForSource:", self->_captureSource));
  uint64_t v20 = v8[573];
  [*(id *)((char *)&self->super.super.super.isa + v20) setIsServerBasedBandwidthProbingEnabled:self->_isServerBasedBandwidthProbingEnabled];
  uint64_t initialTargetBitrate = self->_initialTargetBitrate;
  if (!initialTargetBitrate) {
    uint64_t initialTargetBitrate = [(VCMediaStreamConfig *)v3 txMinBitrate];
  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v20), "setTargetBitrate:", initialTargetBitrate, *(_OWORD *)v30, *(void *)&v30[16], v31, v32, v33);
}

- (void)destroyVideoTransmitter
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315906;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      uint64_t v9 = "-[VCVideoStream destroyVideoTransmitter]";
      __int16 v10 = 1024;
      int v11 = 470;
      __int16 v12 = 2048;
      uint64_t v13 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d VCVideoStream[%p]", (uint8_t *)&v6, 0x26u);
    }
  }
  videoTransmitter = self->_videoTransmitter;
  if (videoTransmitter)
  {
    self->_uint64_t initialTargetBitrate = [(VCVideoTransmitterBase *)videoTransmitter targetBitrate];
    videoTransmitter = self->_videoTransmitter;
  }
  [(VCVideoTransmitterBase *)videoTransmitter stopVideo];

  self->_videoTransmitter = 0;
}

+ (id)newFeatureListStringsWithConfiguration:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "rxCodecFeatureListStrings"), "objectForKeyedSubscript:", &unk_1F3DC6108);
  if (v5) {
    [v4 setObject:v5 forKeyedSubscript:&unk_1F3DC6120];
  }
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "rxCodecFeatureListStrings"), "objectForKeyedSubscript:", &unk_1F3DC6138);
  if (v6) {
    [v4 setObject:v6 forKeyedSubscript:&unk_1F3DC6150];
  }
  return v4;
}

- (void)setVideoExpected:(BOOL)a3
{
}

- (id)newScreenCaptureConfigForVideoConfig:(id)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v5 setObject:self forKeyedSubscript:@"Client"];
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", self->_captureSourceID), @"CaptureSourceID");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_customWidth), @"VideoWidth");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_customHeight), @"VideoHeight");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "framerate")), @"FrameRate");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->super._clientPID), @"ClientPid");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[VCVideoStream pickScreenDisplayMode](self, "pickScreenDisplayMode")), @"ScreenCaptureConfigurationDisplayMode");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a3, "shouldSendBlackFramesOnClearScreen")), @"ShouldSendBlackFramesOnClearScreen");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a3, "foveationEnabled")), @"FoveationEnabled");
  [v5 setObject:&unk_1F3DC6168 forKeyedSubscript:@"ResolutionScaling"];
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_screenDisplayID), @"ScreenDisplayID");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "pixelFormat")), @"PixelFormat");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "hdrMode")), @"HDRMode");
  int64_t type = self->_type;
  BOOL v8 = type == 2 || type == 5;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v8), @"EnableIdleFrameAdjustments");
  int64_t v9 = self->_type;
  BOOL v11 = v9 == 1 || v9 == 6;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v11), @"ScreenWatcherExempt");
  [v5 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"ShouldAllowReconfigureForLocalDisplay"];
  __int16 v12 = NSNumber;
  int64_t v13 = self->_type;
  BOOL v14 = 1;
  if (v13 != 1 && v13 != 6) {
    BOOL v14 = v13 == 5 && (unint64_t)objc_msgSend(a3, "tilesPerFrame", 1) > 1;
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(v12, "numberWithInt:", v14), @"ShouldOptimizeForLowLatency");
  if ([a3 remoteDeviceName]) {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(a3, "remoteDeviceName"), @"RemoteDeviceName");
  }
  remoteScreenAttributesDidChange = self->_videoStreamDelegateFunctions.remoteScreenAttributesDidChange;
  if (remoteScreenAttributesDidChange) {
    [v5 setObject:remoteScreenAttributesDidChange forKeyedSubscript:@"ColorInfo"];
  }
  int64_t v16 = self->_type;
  if (v16 == 2)
  {
    [v5 setObject:&unk_1F3DC6180 forKeyedSubscript:@"BiomeEventType"];
    int64_t v16 = self->_type;
  }
  if (v16 == 6)
  {
    [v5 setObject:&unk_1F3DC6198 forKeyedSubscript:@"CaptureThermalLevelModerate"];
    [v5 setObject:&unk_1F3DC61B0 forKeyedSubscript:@"CaptureThermalLevelHeavy"];
  }
  return v5;
}

- (int)pickScreenDisplayMode
{
  int64_t type = self->_type;
  if (type == 6) {
    return 1;
  }
  if (type != 2) {
    return 0;
  }
  if (self->super._clientPID) {
    return 1;
  }
  return 2;
}

- (BOOL)isScreenConfig:(id)a3
{
  unint64_t v4 = [a3 type];
  BOOL result = 0;
  if (v4 <= 6)
  {
    if (((1 << v4) & 0x66) != 0) {
      return 1;
    }
    if (v4 == 3)
    {
      if ([a3 captureSource] != 2) {
        return [a3 captureSource] == 1;
      }
      return 1;
    }
  }
  return result;
}

- (void)setupMultiwayVideoReceiverTemporalScalingConfig:(tagVCVideoReceiverStreamConfig *)a3 forTransportStream:(id)a4
{
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a4, "streamConfig"), "multiwayConfig");
  if ([v7 isTemporalStream])
  {
    if ([v7 parentStreamID])
    {
      unsigned __int16 temporalScalingBaseLayerStreamID = self->_temporalScalingBaseLayerStreamID;
    }
    else
    {
      unsigned __int16 temporalScalingBaseLayerStreamID = [a4 idsStreamId];
      self->_unsigned __int16 temporalScalingBaseLayerStreamID = temporalScalingBaseLayerStreamID;
    }
    a3->streamInfo.baseStreamID = temporalScalingBaseLayerStreamID;
    a3->isTemporalScalingEnabled = 1;
  }
  else
  {
    a3->streamInfo.baseStreamID = [a4 idsStreamId];
    a3->isTemporalScalingEnabled = 0;
    self->_unsigned __int16 temporalScalingBaseLayerStreamID = 0;
  }
}

- (void)setupMultiwayVideoReceiverStreamSwitchInfo:(tagVCVideoReceiverStreamConfig *)a3 forTransportStream:(id)a4
{
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a4, "streamConfig"), "multiwayConfig");
  a3->streamInfo.streamID = [a4 idsStreamId];
  [(VCVideoStream *)self setupMultiwayVideoReceiverTemporalScalingConfig:a3 forTransportStream:a4];
  a3->streamInfo.repairStreamID = [v7 repairedStreamID];
  signed int v8 = objc_msgSend((id)objc_msgSend(v7, "subStreamConfigs"), "count");
  a3->streamInfo.subStreamCount = v8;
  if (v8 >= 1)
  {
    uint64_t v9 = 0;
    do
    {
      __int16 v10 = &a3->streamInfo.streamID + v9;
      v10[6] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "subStreamConfigs"), "objectAtIndexedSubscript:", v9), "idsStreamID");
      v10[15] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "subStreamConfigs"), "objectAtIndexedSubscript:", v9++), "repairedStreamID");
    }
    while (v9 < (int)a3->streamInfo.subStreamCount);
  }
}

- (void)setupMultiwayVideoReceiverConfig:(tagVCVideoReceiverConfig *)a3 forTransportStream:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = (void *)[a4 streamConfig];
  signed int v8 = (void *)[v7 multiwayConfig];
  *(void *)&long long v22 = [a4 rtpHandle];
  *(void *)&long long v23 = [v7 keyFrameInterval] == 0;
  WORD1(v23) = [v7 framerate];
  *((void *)&v23 + 1) = [a4 receiverSframeCryptor];
  *(void *)&long long v24 = [(VCMediaStream *)self mediaControlInfoGenerator];
  *((void *)&v24 + 1) = objc_msgSend((id)objc_msgSend(v7, "rateControlConfig"), "statisticsCollector");
  LODWORD(v25) = 1;
  BYTE5(v25) = [v7 isRTCPForLossFeedbackEnabled];
  BYTE6(v25) = objc_msgSend(v7, "rtcpPSFB_LTRAckEnabled");
  if (objc_msgSend(v7, "rtcpPSFB_LTRAckEnabled")) {
    int v9 = 2;
  }
  else {
    int v9 = 1;
  }
  DWORD2(v25) = v9;
  BYTE12(v25) = [v7 shouldEnableMLEnhance];
  if (v8)
  {
    BYTE5(v23) = [v8 isOneToOne];
    BYTE4(v25) = [v8 isOneToOne];
    BYTE13(v25) = [v8 isOneToOne];
    if ([v8 isOneToOne])
    {
      *(void *)&long long v24 = objc_msgSend((id)objc_msgSend(v7, "rateControlConfig"), "mediaControlInfoGenerator");
      LODWORD(v25) = 0;
    }
    if (a3->streamSwitchEnabled) {
      [(VCVideoStream *)self setupMultiwayVideoReceiverStreamSwitchInfo:&v19 forTransportStream:a4];
    }
    __int16 v10 = (void *)[a4 streamConfig];
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend((id)objc_msgSend(v10, "rxCodecFeatureListStrings"), "count"));
    __int16 v12 = (void *)[v10 rxCodecFeatureListStrings];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __69__VCVideoStream_setupMultiwayVideoReceiverConfig_forTransportStream___block_invoke;
    v18[3] = &unk_1E6DB93A8;
    v18[4] = v11;
    [v12 enumerateKeysAndObjectsUsingBlock:v18];
    *((void *)&v22 + 1) = v11;
  }
  unsigned int streamCount = a3->streamCount;
  BOOL v14 = (char *)a3 + 112 * a3->streamCount;
  long long v15 = v21;
  *(_OWORD *)(v14 + 56) = v22;
  long long v16 = v24;
  *(_OWORD *)(v14 + 72) = v23;
  *(_OWORD *)(v14 + 88) = v16;
  *(_OWORD *)(v14 + 104) = v25;
  long long v17 = v20;
  *(_OWORD *)(v14 + 8) = v19;
  *(_OWORD *)(v14 + 24) = v17;
  a3->unsigned int streamCount = streamCount + 1;
  *(_OWORD *)(v14 + 40) = v15;
}

uint64_t __69__VCVideoStream_setupMultiwayVideoReceiverConfig_forTransportStream___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", [a2 unsignedIntValue]);
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = [NSNumber numberWithUnsignedInt:v5];

  return [v6 setObject:a3 forKeyedSubscript:v7];
}

- (void)addReceiverStreamConfigsToReceiverConfig:(tagVCVideoReceiverConfig *)a3 streamConfig:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = +[VCVideoStream newFeatureListStringsWithConfiguration:a4];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  transportArray = self->super._transportArray;
  uint64_t v9 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v19 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(transportArray);
        }
        uint64_t v13 = [*(id *)(*((void *)&v19 + 1) + 8 * i) rtpHandle];
        char v14 = [a4 ltrpEnabled];
        if (v7) {
          CFTypeRef v15 = CFRetain(v7);
        }
        else {
          CFTypeRef v15 = 0;
        }
        unsigned int v16 = a3->streamCount++;
        long long v17 = (char *)a3 + 112 * v16;
        *(_OWORD *)(v17 + 8) = 0u;
        *(_OWORD *)(v17 + 24) = 0u;
        *(_OWORD *)(v17 + 40) = 0u;
        *((void *)v17 + 7) = v13;
        *((void *)v17 + 8) = v15;
        *(_OWORD *)(v17 + 72) = 0u;
        *(_OWORD *)(v17 + 88) = 0u;
        *(void *)(v17 + 102) = 0;
        v17[110] = v14;
        v17[111] = 0;
        *((void *)v17 + 14) = 1;
      }
      uint64_t v10 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v19 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)cleaunpReceiverConfig:(tagVCVideoReceiverConfig *)a3
{
  unint64_t streamCount = a3->streamCount;
  if (streamCount)
  {
    unint64_t v5 = 0;
    uint64_t v6 = 64;
    do
    {
      id v7 = *(const void **)((char *)&a3->streamCount + v6);
      if (v7)
      {
        CFRelease(v7);
        *(void *)((char *)&a3->streamCount + v6) = 0;
        unint64_t streamCount = a3->streamCount;
      }
      ++v5;
      v6 += 112;
    }
    while (v5 < streamCount);
  }
}

- (tagVCVideoStreamReceiverConfig)videoStreamReceiverConfigWithDumpID:(SEL)a3 reportingAgent:(unsigned int)a4
{
  retstr->var10 = 0;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  retstr->var2 = 0u;
  *(_OWORD *)&retstr->var3 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  retstr->var0 = [(VCMediaStreamTransport *)[(VCMediaStream *)self defaultTransport] rtpHandle];
  retstr->var1 = self;
  BOOL result = (tagVCVideoStreamReceiverConfig *)[(VCVideoStream *)self videoReceiverDelegateFunctions];
  retstr->var2.didReceiveSampleBuffer = result;
  retstr->var2.didReceiveRemoteFrame = v10;
  retstr->var3 = a5;
  int reportingModuleID = self->_reportingModuleID;
  retstr->var4 = a4;
  retstr->var5 = reportingModuleID;
  retstr->var6 = self->_statisticsCollector;
  retstr->var7 = self->super._transportSetupInfo.setupType == 5;
  retstr->var8 = self;
  rateAdaptation = self->super._rateAdaptation;
  retstr->var9 = VCMediaStream_RTCPPacketsCallback;
  retstr->var10 = rateAdaptation;
  return result;
}

- (tagVCVideoReceiverConfig)videoReceiverConfigWithVideoStreamConfig:(SEL)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  bzero(retstr, 0x578uLL);
  retstr->streamToken = self->super._streamToken;
  if ([a4 syncSource])
  {
    int v7 = objc_msgSend((id)objc_msgSend(a4, "syncSource"), "getSyncSourceSampleRate");
    unsigned int rtpTimestampRate = self->_rtpTimestampRate;
  }
  else
  {
    unsigned int rtpTimestampRate = self->_rtpTimestampRate;
    int v7 = rtpTimestampRate;
  }
  retstr->audioTSRate = v7;
  retstr->videoTSRate = rtpTimestampRate;
  retstr->enableVPBLogging = [+[VCDefaults sharedInstance] enableVPBLogging];
  *(void *)&retstr->dumpID = 0;
  retstr->enableBitstreamCapture = [+[VCDefaults sharedInstance] enableBitstreamCapture];
  retstr->enableRxDecodeYUVDump = 0;
  retstr->enableRecvBitstreamDump = [+[VCDefaults sharedInstance] enableRecvBitstreamDump];
  retstr->decoderNumOfTiles = [a4 tilesPerFrame];
  retstr->reportingParentID = self->_reportingModuleID;
  retstr->mediaControlInfoGenerator = [(VCMediaStream *)self mediaControlInfoGenerator];
  retstr->useRTCPForFIR = 1;
  retstr->isLTRPEnabled = [a4 ltrpEnabled];
  retstr->isVariableSliceModeEnabled = [a4 isVariableSliceModeEnabled];
  retstr->cvoExtensionID = [a4 cvoExtensionID];
  retstr->videoJBEnabled = [a4 useVideoJitterForVideoPlayout];
  retstr->jbTargetEstimatorSynchronizer = (tagVCJBTargetEstimatorSynchronizer *)[a4 jbTargetEstimatorSynchronizer];
  if ([(VCMediaStream *)self networkFeedbackController]) {
    retstr->wrmInfo = [(VCNetworkFeedbackController *)[(VCMediaStream *)self networkFeedbackController] wrmInfo];
  }
  retstr->participantId = (__CFString *)objc_msgSend((id)objc_msgSend(a4, "multiwayConfig"), "participantId");
  retstr->sessionId = (__CFString *)objc_msgSend((id)objc_msgSend(a4, "multiwayConfig"), "sessionId");
  retstr->streamGroupID = objc_msgSend((id)objc_msgSend(a4, "multiwayConfig"), "streamGroupID");
  retstr->isReferenceFrameEnabled = 1;
  retstr->enableDeferredAssembly = [a4 deferredAssemblyEnabled];
  retstr->deferredAssemblyOffset = 0.0;
  retstr->externalPresentationClockType = 1;
  if ([a4 isServerPacketRetransmissionEnabled])
  {
    retstr->isServerPacketRetransmissionEnabled = 1;
    p_isLateFrameRecoveryEnabled = &retstr->isLateFrameRecoveryEnabled;
    retstr->isLateFrameRecoveryEnabled = 1;
  }
  else
  {
    int v10 = [a4 rtxEnabled];
    retstr->isServerPacketRetransmissionEnabled = v10;
    p_isLateFrameRecoveryEnabled = &retstr->isLateFrameRecoveryEnabled;
    retstr->isLateFrameRecoveryEnabled = 1;
    if (!v10) {
      goto LABEL_10;
    }
  }
  [(VCVideoStream *)self readServerPacketRetransmissionsForVideoStoreBagConfig:a4];
  long long v11 = *(_OWORD *)&buf[16];
  *(_OWORD *)&retstr->nackGeneratorStoreBagsConfig.nackGeneratorStorebagConfigVersion = *(_OWORD *)buf;
  *(_OWORD *)retstr->nackGeneratorStoreBagsConfig.nackThrottlingFactorBuckets = v11;
  long long v12 = v60;
  *(_OWORD *)retstr->nackGeneratorStoreBagsConfig.nackThrottlingPlrBuckets = *(_OWORD *)&buf[32];
  *(_OWORD *)&retstr->nackGeneratorStoreBagsConfig.nackGenerationMaxPLR = v12;
LABEL_10:
  [a4 minPlaybackInterval];
  retstr->minPlaybackInterval = v13;
  [a4 minRenderingDelay];
  retstr->minRenderingDelay = v14;
  retstr->maxDisplayRefreshRate = [+[VCHardwareSettingsEmbedded sharedInstance] maxDisplayRefreshRate];
  BOOL v15 = [a4 direction] == 2 || objc_msgSend(a4, "direction") == 3;
  BOOL BoolValueForKey = VCDefaults_GetBoolValueForKey(@"videoJBUseErasureSensitiveMode", [a4 jitterBufferMode] == 0);
  switch([a4 type])
  {
    case 0:
      retstr->triggerSoundAlarmOnRTPReceive = 1;
      goto LABEL_90;
    case 1:
    case 6:
      [(VCVideoStream *)self addReceiverStreamConfigsToReceiverConfig:retstr streamConfig:a4];
      retstr->mode = 2;
      retstr->isVCRCStatsOnlyVideoBased = 1;
      retstr->rateAdaptation = self->super._rateAdaptation;
      *(_WORD *)&retstr->isAsyncDecodingEnabled = 257;
      retstr->useDisplayLink = v15;
      retstr->useInternalClockForPresentation = v15;
      retstr->externalPresentationClockType = !v15;
      retstr->enableJitterBufferInReceiver = 1;
      retstr->enableJitterBufferInPlayer = [a4 hdrMode] != 0;
      retstr->enableImmediateDecode = [a4 hdrMode] == 0;
      retstr->enableQueueAlarmForDisplay = [a4 hdrMode] != 0;
      int v17 = !BoolValueForKey && [a4 hdrMode] == 0;
      retstr->jitterBufferMode = v17;
      retstr->isScreenSharing = 1;
      goto LABEL_90;
    case 2:
      [(VCVideoStream *)self addReceiverStreamConfigsToReceiverConfig:retstr streamConfig:a4];
      retstr->mode = 3;
      retstr->isVCRCStatsOnlyVideoBased = 1;
      retstr->rateAdaptation = self->super._rateAdaptation;
      *(_WORD *)&retstr->isAsyncDecodingEnabled = 257;
      retstr->useDisplayLink = v15;
      retstr->useInternalClockForPresentation = v15;
      retstr->externalPresentationClockType = !v15;
      *(_WORD *)&retstr->enableJitterBufferInReceiver = 257;
      retstr->enableImmediateDecode = 0;
      retstr->enableQueueAlarmForDisplay = 1;
      retstr->jitterBufferMode = !BoolValueForKey;
      retstr->isScreenSharing = 1;
      goto LABEL_90;
    case 3:
      if (self->super._operatingMode == 6) {
        char v18 = objc_msgSend((id)objc_msgSend(a4, "multiwayConfig"), "isOneToOne") ^ 1;
      }
      else {
        char v18 = 0;
      }
      retstr->streamSwitchEnabled = v18;
      id v53 = a4;
      BOOL v52 = v15;
      BOOL v19 = !self->super._isWRMinitialized && [a4 direction] == 2;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      transportArray = self->super._transportArray;
      uint64_t v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](transportArray, "countByEnumeratingWithState:objects:count:", &v55, v54, 16, p_isLateFrameRecoveryEnabled);
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v56;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v56 != v25) {
              objc_enumerationMutation(transportArray);
            }
            uint64_t v27 = *(void **)(*((void *)&v55 + 1) + 8 * i);
            [(VCVideoStream *)self setupMultiwayVideoReceiverConfig:retstr forTransportStream:v27];
            if (v19)
            {
              if ([(VCMediaStream *)self networkFeedbackController])
              {
                -[VCMediaStream initializeWRMUsingRtpHandle:](self, "initializeWRMUsingRtpHandle:", [v27 rtpHandle]);
                self->super._isWRMinitialized = 1;
              }
              else if (![(VCMediaStream *)self networkFeedbackController] {
                     && (int)VRTraceGetErrorLogLevelForModule() >= 5)
              }
              {
                uint64_t v28 = VRTraceErrorLogLevelToCSTR();
                uint64_t v29 = *MEMORY[0x1E4F47A50];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315650;
                  *(void *)&uint8_t buf[4] = v28;
                  *(_WORD *)&buf[12] = 2080;
                  *(void *)&buf[14] = "-[VCVideoStream videoReceiverConfigWithVideoStreamConfig:]";
                  *(_WORD *)&buf[22] = 1024;
                  *(_DWORD *)&buf[24] = 837;
                  _os_log_impl(&dword_1E1EA4000, v29, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d NetworkFeedbackController is nil in VideoStream", buf, 0x1Cu);
                }
              }
            }
          }
          uint64_t v24 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v55 objects:v54 count:16];
        }
        while (v24);
      }
      if ([v53 direction] == 1)
      {
        int v30 = 0;
      }
      else
      {
        uint64_t v31 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v53, "rxPayloadMap"), "allKeys"), "firstObject"), "intValue");
        int v30 = [(VCVideoStream *)self useUEPForVideoConfig:v31];
        int v32 = v31 & 0xFFFFFFFE;
        BOOL v34 = v31 == 110 || v32 == 124;
        retstr->enableFrameDiscontinuityStatus = v34;
        BOOL v36 = retstr->isLateFrameRecoveryEnabled && v31 != 110 && v32 != 124;
        *uint64_t v51 = v36;
      }
      retstr->mode = objc_msgSend((id)objc_msgSend(v53, "multiwayConfig"), "isOneToOne") ^ 1;
      retstr->useRTCPForFIR = objc_msgSend(v53, "rtcpPSFB_FIREnabled");
      retstr->sendRTCP_PSFB_FIR = objc_msgSend(v53, "rtcpPSFB_FIREnabled");
      retstr->isVCRCStatsOnlyVideoBased = 0;
      *(_WORD *)&retstr->isAsyncDecodingEnabled = 0;
      retstr->decoderNumOfTiles = [v53 tilesPerFrame];
      retstr->enableUEP = v30;
      retstr->reportingParentID = self->_reportingModuleID;
      retstr->shouldEnableFaceZoom = self->_shouldEnableFaceZoom;
      retstr->idsParticipantID = objc_msgSend((id)objc_msgSend(v53, "multiwayConfig"), "remoteIDSParticipantID");
      retstr->triggerSoundAlarmOnRTPReceive = 1;
      retstr->fecHeaderV1Enabled = [v53 fecHeaderVersion] == 1;
      retstr->isReferenceFrameEnabled = 0;
      retstr->enableJitterBufferInReceiver = VCDefaults_GetBoolValueForKey(@"enableVideoJitterBufferInReceiver", 1);
      retstr->forceZeroRegionOfInterestOrigin = [v53 forceZeroRegionOfInterestOrigin];
      if (![(VCVideoStream *)self isScreenConfig:v53]
        && ![v53 useVideoJitterForVideoPlayout])
      {
        goto LABEL_87;
      }
      if ((VCVideoStream *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v38 = VRTraceErrorLogLevelToCSTR();
          uint64_t v39 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v40 = objc_msgSend((id)objc_msgSend(v53, "multiwayConfig"), "isOneToOne");
            v41 = "No";
            *(void *)&uint8_t buf[4] = v38;
            *(_DWORD *)buf = 136315906;
            *(void *)&buf[14] = "-[VCVideoStream videoReceiverConfigWithVideoStreamConfig:]";
            *(_WORD *)&buf[12] = 2080;
            if (v40) {
              v41 = "Yes";
            }
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 866;
            *(_WORD *)&buf[28] = 2080;
            *(void *)&buf[30] = v41;
            v42 = "VCVideoStream [%s] %s:%d Configured for Screen Sharing (isOneToOne=%s)";
            v43 = v39;
            uint32_t v44 = 38;
            goto LABEL_83;
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          long long v37 = (__CFString *)[(VCVideoStream *)self performSelector:sel_logPrefix];
        }
        else {
          long long v37 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v45 = VRTraceErrorLogLevelToCSTR();
          uint64_t v46 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v47 = objc_msgSend((id)objc_msgSend(v53, "multiwayConfig"), "isOneToOne");
            *(_DWORD *)buf = 136316418;
            uint64_t v48 = "No";
            *(void *)&uint8_t buf[4] = v45;
            *(void *)&buf[14] = "-[VCVideoStream videoReceiverConfigWithVideoStreamConfig:]";
            *(_WORD *)&buf[12] = 2080;
            *(_WORD *)&buf[22] = 1024;
            if (v47) {
              uint64_t v48 = "Yes";
            }
            *(_DWORD *)&buf[24] = 866;
            *(_WORD *)&buf[28] = 2112;
            *(void *)&buf[30] = v37;
            *(_WORD *)&buf[38] = 2048;
            *(void *)&buf[40] = self;
            LOWORD(v60) = 2080;
            *(void *)((char *)&v60 + 2) = v48;
            v42 = "VCVideoStream [%s] %s:%d %@(%p) Configured for Screen Sharing (isOneToOne=%s)";
            v43 = v46;
            uint32_t v44 = 58;
LABEL_83:
            _os_log_impl(&dword_1E1EA4000, v43, OS_LOG_TYPE_DEFAULT, v42, buf, v44);
          }
        }
      }
      retstr->isAsyncDecodingEnabled = 1;
      retstr->useDisplayLink = v52;
      retstr->jitterBufferMode = 2;
      retstr->enableJitterBufferInReceiver = 1;
      retstr->enableImmediateDecode = 0;
      retstr->enableQueueAlarmForDisplay = v52;
      retstr->isScreenSharing = 1;
      objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-video-receiver-deferred-assembly-offset", @"videoReceiverDeferredAssemblyOffset", &unk_1F3DC8B90, 1), "doubleValue");
      retstr->deferredAssemblyOffset = v49;
      if (+[VCHardwareSettings deviceClass] != 8
        && objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-video-player-enable-loose-sync-for-facetime", @"looseAVSyncEnabled", objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v53, "looseAVSyncEnabled")), 0), "BOOLValue"))
      {
        retstr->enableAVLooseSync = 1;
        retstr->enableJitterBufferInPlayer = 1;
        retstr->useInternalClockForPresentation = 1;
        retstr->externalPresentationClockType = 0;
        retstr->triggerSoundAlarmOnRTPReceive = 0;
        retstr->enableHighWatermarkQueueDiscard = 1;
      }
LABEL_87:
      if (objc_msgSend((id)objc_msgSend(v53, "multiwayConfig"), "isOneToOne")
        && [(VCMediaStream *)self networkFeedbackController])
      {
        retstr->wrmInfo = [(VCNetworkFeedbackController *)[(VCMediaStream *)self networkFeedbackController] wrmInfo];
      }
LABEL_90:
      BOOL result = (tagVCVideoReceiverConfig *)VCDefaults_GetBoolValueForKey(@"forceVideoStreamLowLatency", 0);
      if (result)
      {
        *(_WORD *)&retstr->enableJitterBufferInPlayer = 256;
        retstr->enableQueueAlarmForDisplay = 0;
      }
      return result;
    case 4:
      [(VCVideoStream *)self addReceiverStreamConfigsToReceiverConfig:retstr streamConfig:a4];
      retstr->mode = 3;
      retstr->isVCRCStatsOnlyVideoBased = 1;
      retstr->rateAdaptation = self->super._rateAdaptation;
      *(_WORD *)&retstr->isAsyncDecodingEnabled = 257;
      if ([a4 syncSource])
      {
        retstr->externalPresentationClockType = 2;
      }
      else
      {
        retstr->useDisplayLink = v15;
        retstr->useInternalClockForPresentation = v15;
        retstr->externalPresentationClockType = !v15;
        *(_WORD *)&retstr->enableJitterBufferInReceiver = 257;
        retstr->enableImmediateDecode = 0;
        retstr->enableQueueAlarmForDisplay = 1;
        retstr->jitterBufferMode = !BoolValueForKey;
      }
      goto LABEL_90;
    case 5:
      [(VCVideoStream *)self addReceiverStreamConfigsToReceiverConfig:retstr streamConfig:a4];
      retstr->mode = 3;
      retstr->streamSwitchEnabled = 0;
      retstr->isVCRCStatsOnlyVideoBased = 1;
      retstr->rateAdaptation = self->super._rateAdaptation;
      *(_WORD *)&retstr->isAsyncDecodingEnabled = 257;
      retstr->decoderNumOfTiles = [a4 tilesPerFrame];
      retstr->triggerSoundAlarmOnRTPReceive = 0;
      retstr->fecHeaderV1Enabled = 0;
      retstr->isReferenceFrameEnabled = 0;
      retstr->forceZeroRegionOfInterestOrigin = [a4 forceZeroRegionOfInterestOrigin];
      retstr->enableJitterBufferInReceiver = 1;
      retstr->isScreenSharing = 1;
      if ([a4 syncSource])
      {
        retstr->externalPresentationClockType = 2;
      }
      else
      {
        retstr->useDisplayLink = v15;
        retstr->jitterBufferMode = 2;
        retstr->enableImmediateDecode = 0;
        retstr->enableQueueAlarmForDisplay = v15;
      }
      retstr->enableDeferredAssembly = 1;
      objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-video-receiver-deferred-assembly-offset", @"videoReceiverDeferredAssemblyOffset", &unk_1F3DC8B90, 1), "doubleValue");
      retstr->deferredAssemblyOffset = v20;
      int v21 = [a4 direction] != 1
         && -[VCVideoStream useUEPForVideoConfig:](self, "useUEPForVideoConfig:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "rxPayloadMap"), "allKeys"), "firstObject"), "intValue"));
      retstr->enableUEP = v21;
      goto LABEL_90;
    default:
      goto LABEL_90;
  }
}

- (tagVCNACKGeneratorStoreBagsConfig)readServerPacketRetransmissionsForVideoStoreBagConfig:(SEL)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)retstr->nackThrottlingPlrBuckets = 0u;
  *(_OWORD *)&retstr->double nackGenerationMaxPLR = 0u;
  *(_OWORD *)&retstr->nackGeneratorStorebagConfigVersion = 0u;
  *(_OWORD *)retstr->nackThrottlingFactorBuckets = 0u;
  objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-nack-generator-population-percentage-with-additional-delay-budget", @"delayBudgetForServerPacketRetransmissionForVideo", 0, 1), "doubleValue");
  double v7 = v6;
  if ([a4 isServerPacketRetransmissionEnabled]) {
    BOOL v8 = (double)arc4random() / 4294967300.0 < v7;
  }
  else {
    BOOL v8 = 0;
  }
  retstr->isExtraDelayForPacketRetransmissionsEnabled = v8;
  objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-nack-generator-storebag-config-version", 0, &unk_1F3DC61C8, 1), "doubleValue");
  uint64_t v10 = (int)v9;
  retstr->nackGeneratorStorebagConfigVersion = v10;
  objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-nack-generator-seq-num-aging-time", 0, &unk_1F3DC8BA0, 1), "doubleValue");
  float v12 = v11;
  retstr->nackSeqNumAgingDuration = v12;
  objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-nack-generator-nack-bit-rate-limiting-max-ratio", 0, &unk_1F3DC8BB0, 1), "doubleValue");
  float v14 = v13;
  retstr->nackThrottlingBitRateLimitingMaxRatio = v14;
  objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-nack-generator-nack-generation-max-plr", 0, &unk_1F3DC8BA0, 1), "doubleValue");
  *(float *)&double v15 = v15;
  retstr->double nackGenerationMaxPLR = *(float *)&v15;
  objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-nack-generator-nack-generation-max-rtt", 0, &unk_1F3DC61E0, 1), "doubleValue");
  *(float *)&double v16 = v16;
  retstr->double nackGenerationMaxRTT = *(float *)&v16;
  int v17 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:objc_msgSend(+[GKSConnectivitySettings getStorebagValueStorebagKey:defaultValue:](GKSConnectivitySettings, "getStorebagValueStorebagKey:defaultValue:", @"vc-nack-generator-nack-throttling-plr-buckets", @"0.005, 0.01, 0.025, 1.0"), "componentsSeparatedByString:", @","];
  char v18 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:objc_msgSend(+[GKSConnectivitySettings getStorebagValueStorebagKey:defaultValue:](GKSConnectivitySettings, "getStorebagValueStorebagKey:defaultValue:", @"vc-nack-generator-nack-throttling-factor-buckets", @"1.0, 0.8, 0.5, 0.3"), "componentsSeparatedByString:", @","];
  if (((unint64_t)[v17 count] > 4 || (unint64_t)objc_msgSend(v18, "count") > 4)
    && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    double v20 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      int v36 = 136316162;
      uint64_t v37 = v19;
      __int16 v38 = 2080;
      uint64_t v39 = "-[VCVideoStream readServerPacketRetransmissionsForVideoStoreBagConfig:]";
      __int16 v40 = 1024;
      int v41 = 930;
      __int16 v42 = 2048;
      *(void *)v43 = [v17 count];
      *(_WORD *)&v43[8] = 2048;
      *(void *)&v43[10] = [v18 count];
      _os_log_error_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_ERROR, "VCVideoStream [%s] %s:%d Unexpected size for plrBuckets(size=%lu) or factorBuckets(size=%lu) storebag", (uint8_t *)&v36, 0x30u);
    }
  }
  for (uint64_t i = 0; i != 4; ++i)
  {
    objc_msgSend((id)objc_msgSend(v18, "objectAtIndexedSubscript:", i), "doubleValue");
    *(float *)&double v22 = v22;
    uint64_t v23 = (char *)retstr + 4 * i;
    *((_DWORD *)v23 + 4) = LODWORD(v22);
    objc_msgSend((id)objc_msgSend(v17, "objectAtIndexedSubscript:", i), "doubleValue");
    *(float *)&double v24 = v24;
    *((_DWORD *)v23 + 8) = LODWORD(v24);
  }
  objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-nack-generator-rtt-for-rtx-fulfillment-wait-time", @"rttForRTxFulfillmentWaitTime", &unk_1F3DC8BC0, 1), "doubleValue");
  float v26 = v25;
  retstr->rttForRTxFulfillmentWaitTime = v26;
  objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-nack-generator-rtt-for-rtx-fulfillment-Multiplier", @"rttForRTxFulfillmentMultiplier", &unk_1F3DC61F8, 1), "doubleValue");
  float v28 = v27;
  retstr->rttForRTxFulfillmentMultiplier = v28;
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    uint64_t v29 = VRTraceErrorLogLevelToCSTR();
    int v30 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = [v17 componentsJoinedByString:@","];
      uint64_t v32 = [v18 componentsJoinedByString:@","];
      double nackGenerationMaxPLR = retstr->nackGenerationMaxPLR;
      double nackGenerationMaxRTT = retstr->nackGenerationMaxRTT;
      int v36 = 136318210;
      uint64_t v37 = v29;
      __int16 v38 = 2080;
      uint64_t v39 = "-[VCVideoStream readServerPacketRetransmissionsForVideoStoreBagConfig:]";
      __int16 v40 = 1024;
      int v41 = 940;
      __int16 v42 = 1024;
      *(_DWORD *)v43 = v10;
      *(_WORD *)&v43[4] = 2048;
      *(double *)&v43[6] = v12;
      *(_WORD *)&v43[14] = 1024;
      *(_DWORD *)&v43[16] = v8;
      __int16 v44 = 2048;
      double v45 = v14;
      __int16 v46 = 2112;
      uint64_t v47 = v31;
      __int16 v48 = 2112;
      uint64_t v49 = v32;
      __int16 v50 = 2048;
      double v51 = nackGenerationMaxPLR;
      __int16 v52 = 2048;
      double v53 = nackGenerationMaxRTT;
      __int16 v54 = 2048;
      double v55 = v26;
      __int16 v56 = 2048;
      double v57 = v28;
      _os_log_impl(&dword_1E1EA4000, v30, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d Loaded storebag values for VCNackGenerator: nackGeneratorStorebagConfigVersion=%u nackSeqNumAgingDuration=%f isExtraDelayForPacketRetransmissionsEnabled=%d nackThrottlingBitRateLimitingMaxRatio=%f nackThrottlingPlrBuckets[%@] nackThrottlingFactorBuckets[%@] nackGenerationMaxPLR=%f nackGenerationMaxRTT=%f rttForRTxFulfillmentWaitTime=%.2f rttForRTxFulfillmentMultiplier=%.2f", (uint8_t *)&v36, 0x78u);
    }
  }
  [a4 setNackGeneratorStorebagConfigVersion:v10];
  [a4 setIsExtraDelayForPacketRetransmissionsEnabled:v8];

  return result;
}

- (void)setupVideoReceiver:(id)a3 withTransmitterHandle:(tagHANDLE *)a4
{
  __dst[175] = *MEMORY[0x1E4F143B8];
  BOOL v7 = [a3 direction] == 2 || objc_msgSend(a3, "direction") == 3;
  memcpy(__dst, &unk_1E25A24A0, 0x578uLL);
  if (self) {
    [(VCVideoStream *)self videoReceiverConfigWithVideoStreamConfig:a3];
  }
  else {
    bzero(__dst, 0x578uLL);
  }
  unint64_t v51 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v49 = v8;
  long long v50 = v8;
  long long v47 = v8;
  long long v48 = v8;
  long long v46 = v8;
  uint64_t v9 = [(VCVideoStream *)self dumpIDFromCallID];
  if (v7)
  {
    uint64_t v10 = [(VCObject *)self reportingAgent];
    if (self)
    {
LABEL_9:
      [(VCVideoStream *)self videoStreamReceiverConfigWithDumpID:v9 reportingAgent:v10];
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v10 = 0;
    if (self) {
      goto LABEL_9;
    }
  }
  unint64_t v51 = 0;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v46 = 0u;
LABEL_12:
  if ([a3 type] != 4)
  {
    if ([a3 overlayToken]) {
      uint64_t v11 = [a3 overlayToken];
    }
    else {
      uint64_t v11 = __dst[128];
    }
    __dst[169] = v11;
  }
  uint64_t v12 = [(VCVideoStream *)self videoReceiverDelegateFunctions];
  unint64_t v14 = objc_msgSend(a3, "type", v12, v13);
  if (v14 <= 6)
  {
    if (((1 << v14) & 0x76) != 0)
    {
      double v15 = [VCVideoReceiverDefault alloc];
      if (v7) {
        double v16 = [(VCObject *)self reportingAgent];
      }
      else {
        double v16 = 0;
      }
      videoReceiver = [(VCVideoReceiverDefault *)v15 initWithConfig:__dst delegate:self delegateFunctions:&v45 reportingAgent:v16 statisticsCollector:self->_statisticsCollector transmitterHandle:a4];
      self->_videoReceiver = videoReceiver;
      goto LABEL_23;
    }
    if (!v14)
    {
      self->_videoReceiver = (VCVideoReceiverBase *)[[VCVideoStreamReceiver alloc] initWithConfig:&v46];
      goto LABEL_24;
    }
    if ([a3 direction] != 1 || objc_msgSend(a3, "isRTCPEnabled"))
    {
      float v28 = [VCVideoReceiverDefault alloc];
      if (v7) {
        uint64_t v29 = [(VCObject *)self reportingAgent];
      }
      else {
        uint64_t v29 = 0;
      }
      int v30 = -[VCVideoReceiverDefault initWithConfig:delegate:delegateFunctions:reportingAgent:statisticsCollector:transmitterHandle:](v28, "initWithConfig:delegate:delegateFunctions:reportingAgent:statisticsCollector:transmitterHandle:", __dst, self, &v45, v29, objc_msgSend((id)objc_msgSend(a3, "rateControlConfig"), "statisticsCollector"), a4);
      self->_videoReceiver = v30;
      targetStreamID = self->_targetStreamID;
      if (targetStreamID) {
        [(VCVideoReceiverBase *)v30 setTargetStreamID:[(NSNumber *)targetStreamID unsignedShortValue]];
      }
      if ((VCVideoStream *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_59;
        }
        uint64_t v33 = VRTraceErrorLogLevelToCSTR();
        BOOL v34 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_59;
        }
        long long v35 = *(void **)&self->_constantTransportOverhead;
        *(_DWORD *)buf = 136315906;
        uint64_t v53 = v33;
        __int16 v54 = 2080;
        double v55 = "-[VCVideoStream setupVideoReceiver:withTransmitterHandle:]";
        __int16 v56 = 1024;
        int v57 = 983;
        __int16 v58 = 2048;
        v59 = v35;
        int v36 = "VCVideoStream [%s] %s:%d externalOutputVideoLatency=%f";
        uint64_t v37 = v34;
        uint32_t v38 = 38;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v32 = (__CFString *)[(VCVideoStream *)self performSelector:sel_logPrefix];
        }
        else {
          uint64_t v32 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_59;
        }
        uint64_t v42 = VRTraceErrorLogLevelToCSTR();
        v43 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_59;
        }
        __int16 v44 = *(VCVideoReceiverBase **)&self->_constantTransportOverhead;
        *(_DWORD *)buf = 136316418;
        uint64_t v53 = v42;
        __int16 v54 = 2080;
        double v55 = "-[VCVideoStream setupVideoReceiver:withTransmitterHandle:]";
        __int16 v56 = 1024;
        int v57 = 983;
        __int16 v58 = 2112;
        v59 = v32;
        __int16 v60 = 2048;
        uint64_t v61 = self;
        __int16 v62 = 2048;
        v63 = v44;
        int v36 = "VCVideoStream [%s] %s:%d %@(%p) externalOutputVideoLatency=%f";
        uint64_t v37 = v43;
        uint32_t v38 = 58;
      }
      _os_log_impl(&dword_1E1EA4000, v37, OS_LOG_TYPE_DEFAULT, v36, buf, v38);
LABEL_59:
      videoReceiver = self->_videoReceiver;
LABEL_23:
      VCVideoReceiver_SetExternalOutputVideoLatency((uint64_t)videoReceiver);
      goto LABEL_24;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v39 = VRTraceErrorLogLevelToCSTR();
      __int16 v40 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v41 = self->_targetStreamID;
        *(_DWORD *)buf = 136315906;
        uint64_t v53 = v39;
        __int16 v54 = 2080;
        double v55 = "-[VCVideoStream setupVideoReceiver:withTransmitterHandle:]";
        __int16 v56 = 1024;
        int v57 = 986;
        __int16 v58 = 2112;
        v59 = v41;
        _os_log_impl(&dword_1E1EA4000, v40, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d Skipping video receiver for target stream[%@]", buf, 0x26u);
      }
    }
  }
LABEL_24:
  [(VCVideoReceiverBase *)self->_videoReceiver setVideoExpected:v7];
  if ((VCVideoStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      double v20 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v21 = self->_videoReceiver;
        *(_DWORD *)buf = 136315906;
        uint64_t v53 = v19;
        __int16 v54 = 2080;
        double v55 = "-[VCVideoStream setupVideoReceiver:withTransmitterHandle:]";
        __int16 v56 = 1024;
        int v57 = 994;
        __int16 v58 = 2048;
        v59 = v21;
        double v22 = "VCVideoStream [%s] %s:%d videoReceiver=%p";
        uint64_t v23 = v20;
        uint32_t v24 = 38;
LABEL_34:
        _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      char v18 = (__CFString *)[(VCVideoStream *)self performSelector:sel_logPrefix];
    }
    else {
      char v18 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v25 = VRTraceErrorLogLevelToCSTR();
      float v26 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        double v27 = self->_videoReceiver;
        *(_DWORD *)buf = 136316418;
        uint64_t v53 = v25;
        __int16 v54 = 2080;
        double v55 = "-[VCVideoStream setupVideoReceiver:withTransmitterHandle:]";
        __int16 v56 = 1024;
        int v57 = 994;
        __int16 v58 = 2112;
        v59 = v18;
        __int16 v60 = 2048;
        uint64_t v61 = self;
        __int16 v62 = 2048;
        v63 = v27;
        double v22 = "VCVideoStream [%s] %s:%d %@(%p) videoReceiver=%p";
        uint64_t v23 = v26;
        uint32_t v24 = 58;
        goto LABEL_34;
      }
    }
  }
  self->_lastMediaPriority = 0;
  self->super._isServerPacketRetransmissionEnabled = BYTE4(__dst[157]);
  [(VCVideoStream *)self cleaunpReceiverConfig:__dst];
}

- (BOOL)useUEPForVideoConfig:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = +[VCVideoFeatureListStringHelper newLocalFeaturesStringWithType:2];
  unint64_t v5 = objc_msgSend(v4, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v3));
  unsigned int v7 = 0;
  if (v5) {
    VideoUtil_ParseFeatureListString([v5 UTF8String], &v7, 0);
  }

  return v7 != 0;
}

- (void)updateVideoReceiver:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    double v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315906;
      uint64_t v12 = v5;
      __int16 v13 = 2080;
      unint64_t v14 = "-[VCVideoStream updateVideoReceiver:]";
      __int16 v15 = 1024;
      int v16 = 1012;
      __int16 v17 = 2048;
      char v18 = self;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d VCVideoStream[%p]", (uint8_t *)&v11, 0x26u);
    }
  }
  -[VCVideoReceiverBase setRemoteVideoOrientation:](self->_videoReceiver, "setRemoteVideoOrientation:", [a3 remoteVideoInitialOrientation]);
  -[VCVideoReceiverBase setEnableCVO:cvoExtensionID:](self->_videoReceiver, "setEnableCVO:cvoExtensionID:", [a3 enableCVO], objc_msgSend(a3, "cvoExtensionID"));
  videoReceiver = self->_videoReceiver;
  uint64_t v8 = [a3 isRateAdaptationEnabled];
  uint64_t v9 = [a3 rxMaxBitrate];
  uint64_t v10 = [a3 rxMinBitrate];
  [a3 rtcpSendInterval];
  -[VCVideoReceiverBase setEnableRateAdaptation:maxBitrate:minBitrate:adaptationInterval:](videoReceiver, "setEnableRateAdaptation:maxBitrate:minBitrate:adaptationInterval:", v8, v9, v10);
}

- (void)destroyVideoReceiver
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    id v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315906;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      uint64_t v8 = "-[VCVideoStream destroyVideoReceiver]";
      __int16 v9 = 1024;
      int v10 = 1022;
      __int16 v11 = 2048;
      uint64_t v12 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d VCVideoStream[%p]", (uint8_t *)&v5, 0x26u);
    }
  }
  [(VCVideoReceiverBase *)self->_videoReceiver stopVideo];
  [(VCVideoReceiverBase *)self->_videoReceiver setDelegate:0];

  self->_videoReceiver = 0;
}

- (void)destroyVideoModules
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    id v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315906;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      uint64_t v8 = "-[VCVideoStream destroyVideoModules]";
      __int16 v9 = 1024;
      int v10 = 1030;
      __int16 v11 = 2048;
      uint64_t v12 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d VCVideoStream[%p]", (uint8_t *)&v5, 0x26u);
    }
  }
  [(VCVideoStream *)self destroyVideoTransmitter];
  [(VCVideoStream *)self destroyVideoReceiver];
}

- (void)setupCompoundStreamIDsWithStreamIDs:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  int v5 = [(VCMediaStream *)self compoundStreamIDs];
  if (v5)
  {
    uint64_t v6 = v5;
    __int16 v7 = (void *)[MEMORY[0x1E4F1CA80] setWithArray:a3];
    objc_msgSend(v7, "minusSet:", objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:", v6));
    self->_isCompoundStreamIDsIncreased = [v7 count] != 0;
  }
  [(VCMediaStream *)self setCompoundStreamIDs:a3];

  self->_sendingStreamID = (NSNumber *)objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "copy");
  if ((VCVideoStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      __str = 0;
      __int16 v9 = [(VCMediaStream *)self compoundStreamIDs]
         ? [(NSString *)[(NSArray *)[(VCMediaStream *)self compoundStreamIDs] description] UTF8String]: "<nil>";
      asprintf(&__str, "%s", v9);
      if (__str)
      {
        __lasts = 0;
        int v16 = strtok_r(__str, "\n", &__lasts);
        __int16 v17 = (os_log_t *)MEMORY[0x1E4F47A50];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v18 = VRTraceErrorLogLevelToCSTR();
            uint64_t v19 = *v17;
            if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              uint64_t v33 = v18;
              __int16 v34 = 2080;
              long long v35 = "-[VCVideoStream setupCompoundStreamIDsWithStreamIDs:]";
              __int16 v36 = 1024;
              int v37 = 1051;
              __int16 v38 = 2080;
              uint64_t v39 = "compoundStreamIDs=";
              __int16 v40 = 2080;
              int v41 = (VCVideoStream *)v16;
              _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          int v16 = strtok_r(0, "\n", &__lasts);
        }
        while (v16);
        goto LABEL_28;
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v8 = (__CFString *)[(VCVideoStream *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v8 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      __str = 0;
      int v10 = (const char *)[(__CFString *)v8 UTF8String];
      __int16 v11 = [(VCMediaStream *)self compoundStreamIDs]
          ? [(NSString *)[(NSArray *)[(VCMediaStream *)self compoundStreamIDs] description] UTF8String]: "<nil>";
      asprintf(&__str, "%s(%p) %s", v10, self, v11);
      if (__str)
      {
        __lasts = 0;
        uint64_t v12 = strtok_r(__str, "\n", &__lasts);
        uint64_t v13 = (os_log_t *)MEMORY[0x1E4F47A50];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v14 = VRTraceErrorLogLevelToCSTR();
            __int16 v15 = *v13;
            if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              uint64_t v33 = v14;
              __int16 v34 = 2080;
              long long v35 = "-[VCVideoStream setupCompoundStreamIDsWithStreamIDs:]";
              __int16 v36 = 1024;
              int v37 = 1051;
              __int16 v38 = 2080;
              uint64_t v39 = "compoundStreamIDs=";
              __int16 v40 = 2080;
              int v41 = (VCVideoStream *)v12;
              _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          uint64_t v12 = strtok_r(0, "\n", &__lasts);
        }
        while (v12);
LABEL_28:
        free(__str);
      }
    }
  }
  if ((VCVideoStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      double v22 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        sendingStreamID = self->_sendingStreamID;
        *(_DWORD *)buf = 136315906;
        uint64_t v33 = v21;
        __int16 v34 = 2080;
        long long v35 = "-[VCVideoStream setupCompoundStreamIDsWithStreamIDs:]";
        __int16 v36 = 1024;
        int v37 = 1052;
        __int16 v38 = 2112;
        uint64_t v39 = (const char *)sendingStreamID;
        uint32_t v24 = "VCVideoStream [%s] %s:%d sendingStreamID=%@";
        uint64_t v25 = v22;
        uint32_t v26 = 38;
LABEL_39:
        _os_log_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      double v20 = (__CFString *)[(VCVideoStream *)self performSelector:sel_logPrefix];
    }
    else {
      double v20 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v27 = VRTraceErrorLogLevelToCSTR();
      float v28 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v29 = self->_sendingStreamID;
        *(_DWORD *)buf = 136316418;
        uint64_t v33 = v27;
        __int16 v34 = 2080;
        long long v35 = "-[VCVideoStream setupCompoundStreamIDsWithStreamIDs:]";
        __int16 v36 = 1024;
        int v37 = 1052;
        __int16 v38 = 2112;
        uint64_t v39 = (const char *)v20;
        __int16 v40 = 2048;
        int v41 = self;
        __int16 v42 = 2112;
        v43 = v29;
        uint32_t v24 = "VCVideoStream [%s] %s:%d %@(%p) sendingStreamID=%@";
        uint64_t v25 = v28;
        uint32_t v26 = 58;
        goto LABEL_39;
      }
    }
  }
}

- (unsigned)dumpIDFromCallID
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (!self->super._callID) {
    return 0;
  }
  v6[0] = 0;
  uint64_t v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28FD8], "regularExpressionWithPattern:options:error:", @"^\\d{1,10}$", 0, v6), "numberOfMatchesInString:options:range:", self->super._callID, 0, 0, -[NSString length](self->super._callID, "length"));
  callID = self->super._callID;
  if (v3 == 1) {
    return [(NSString *)callID integerValue];
  }
  else {
    return [(NSString *)callID hash];
  }
}

- (void)enableRedundancyController:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (self->_redundancyController)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        redundancyController = self->_redundancyController;
        int v14 = 136315906;
        uint64_t v15 = v11;
        __int16 v16 = 2080;
        __int16 v17 = "-[VCVideoStream enableRedundancyController:]";
        __int16 v18 = 1024;
        int v19 = 1066;
        __int16 v20 = 2048;
        uint64_t v21 = redundancyController;
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d _redundancyController[%p] is not NULL", (uint8_t *)&v14, 0x26u);
      }
    }
  }
  else if ([a3 type] == 5 && objc_msgSend(a3, "fecEnabled"))
  {
    statisticsCollector = self->_statisticsCollector;
    [a3 setRedundancyControllerMode:5];
    uint64_t v6 = -[VCRedundancyControllerVideo initWithDelegate:mode:parameters:]([VCRedundancyControllerVideo alloc], "initWithDelegate:mode:parameters:", self, [a3 redundancyControllerMode], statisticsCollector, 0xAAAA000000000064);
    self->_redundancyController = v6;
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v6)
    {
      if (ErrorLogLevelForModule >= 7)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        __int16 v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v10 = self->_redundancyController;
          int v14 = 136315906;
          uint64_t v15 = v8;
          __int16 v16 = 2080;
          __int16 v17 = "-[VCVideoStream enableRedundancyController:]";
          __int16 v18 = 1024;
          int v19 = 1079;
          __int16 v20 = 2112;
          uint64_t v21 = v10;
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d Set up and using internal redundancy controller=%@", (uint8_t *)&v14, 0x26u);
        }
      }
      if ([(VCRedundancyControllerVideo *)self->_redundancyController statisticsCollector]) {
        objc_msgSend((id)objc_msgSend(a3, "rateControlConfig"), "setStatisticsCollector:", -[VCRedundancyControllerVideo statisticsCollector](self->_redundancyController, "statisticsCollector"));
      }
    }
    else if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoStream enableRedundancyController:]();
      }
    }
  }
}

- (void)startRateAdaptationWithStreamConfig:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  [a3 setTxInitialBitrate:self->_initialTargetBitrate];
  BOOL v5 = [a3 direction] == 2 || objc_msgSend(a3, "direction") == 3;
  uint64_t v6 = [(VCMediaStreamTransport *)[(VCMediaStream *)self defaultTransport] rtpHandle];
  connection = self->super._connection;
  __int16 v38 = v6;
  __int16 v42 = connection;
  unint64_t type = self->_type;
  if (type <= 6)
  {
    if (((1 << type) & 0x76) != 0)
    {
      int v30 = 3;
      char v40 = 1;
      int v41 = self;
      uint64_t v31 = 2;
      int v32 = [a3 rxMaxBitrate];
      int v33 = [a3 rxMinBitrate];
      int v34 = [a3 txInitialBitrate];
      int v35 = [a3 accessNetworkType];
      char v36 = [a3 foveationEnabled];
      memset(v37, 170, sizeof(v37));
      uint64_t v29 = [(VCObject *)self reportingAgent];
      __int16 v9 = off_1E6DB30A8;
LABEL_7:

      self->super._rateAdaptation = (VCMediaStreamRateAdaptation *)[objc_alloc(*v9) initWithMediaStreamRateAdaptationParam:&v27];
      goto LABEL_8;
    }
    if (!type)
    {
      int v30 = 2;
      if (v5) {
        uint64_t v11 = [(VCObject *)self reportingAgent];
      }
      else {
        uint64_t v11 = 0;
      }
      uint64_t v29 = v11;
      int reportingModuleID = self->_reportingModuleID;
      unsigned int v28 = [(VCVideoStream *)self dumpIDFromCallID];
      __int16 v9 = off_1E6DB30A0;
      goto LABEL_7;
    }
  }
LABEL_8:
  if (+[VCVideoStream shouldEnableRateControlForStreamType:self->_type])
  {
    if ((VCVideoStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_23;
      }
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint64_t v13 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      int64_t v14 = self->_type;
      int v15 = [a3 txMaxBitrate];
      int v16 = [a3 txMinBitrate];
      int v17 = [a3 txInitialBitrate];
      *(_DWORD *)buf = 136316674;
      uint64_t v44 = v12;
      __int16 v45 = 2080;
      long long v46 = "-[VCVideoStream startRateAdaptationWithStreamConfig:]";
      __int16 v47 = 1024;
      int v48 = 1132;
      __int16 v49 = 1024;
      *(_DWORD *)long long v50 = v14;
      *(_WORD *)&v50[4] = 1024;
      *(_DWORD *)&v50[6] = v15;
      LOWORD(v51) = 1024;
      *(_DWORD *)((char *)&v51 + 2) = v16;
      HIWORD(v51) = 1024;
      *(_DWORD *)__int16 v52 = v17;
      __int16 v18 = "VCVideoStream [%s] %s:%d Start VCRC in VideoStream with type=%d and maxBitrate=%d, minBitrate=%d, initialBitrate=%d";
      int v19 = v13;
      uint32_t v20 = 52;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v10 = (__CFString *)[(VCVideoStream *)self performSelector:sel_logPrefix];
      }
      else {
        int v10 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_23;
      }
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      uint64_t v22 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      int64_t v23 = self->_type;
      int v24 = [a3 txMaxBitrate];
      int v25 = [a3 txMinBitrate];
      int v26 = [a3 txInitialBitrate];
      *(_DWORD *)buf = 136317186;
      uint64_t v44 = v21;
      __int16 v45 = 2080;
      long long v46 = "-[VCVideoStream startRateAdaptationWithStreamConfig:]";
      __int16 v47 = 1024;
      int v48 = 1132;
      __int16 v49 = 2112;
      *(void *)long long v50 = v10;
      *(_WORD *)&v50[8] = 2048;
      unint64_t v51 = self;
      *(_WORD *)__int16 v52 = 1024;
      *(_DWORD *)&v52[2] = v23;
      __int16 v53 = 1024;
      int v54 = v24;
      __int16 v55 = 1024;
      int v56 = v25;
      __int16 v57 = 1024;
      int v58 = v26;
      __int16 v18 = "VCVideoStream [%s] %s:%d %@(%p) Start VCRC in VideoStream with type=%d and maxBitrate=%d, minBitrate=%d, initialBitrate=%d";
      int v19 = v22;
      uint32_t v20 = 72;
    }
    _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
LABEL_23:
    [(VCMediaStreamRateAdaptation *)self->super._rateAdaptation start];

    self->_statisticsCollector = [(AVCRateController *)[(VCMediaStreamRateAdaptation *)self->super._rateAdaptation vcrcRateController] statisticsCollector];
  }
  [(VCVideoStream *)self enableRedundancyController:a3];
}

- (void)stopRateAdaptation
{
  if (+[VCVideoStream shouldEnableRateControlForStreamType:self->_type])
  {
    [(VCMediaStreamRateAdaptation *)self->super._rateAdaptation stop];

    self->_statisticsCollector = 0;
  }

  self->super._rateAdaptation = 0;
}

- (tagVCVideoReceiverDelegateRealtimeInstanceVTable)videoReceiverDelegateFunctions
{
  v2 = VCVideoStream_DidReceiveSampleBuffer;
  uint64_t v3 = _VCVideoStream_DidReceiveRemoteFrame;
  result.didReceiveRemoteFrame = v3;
  result.didReceiveSampleBuffer = v2;
  return result;
}

- (void)handleNWConnectionNotification:(tagVCNWConnectionNotification *)a3
{
  id v4 = [(AVCRateController *)[(VCMediaStreamRateAdaptation *)self->super._rateAdaptation vcrcRateController] nwConnectionCongestionDetector];

  [(VCNWConnectionCongestionDetector *)v4 processNWConnectionNotification:a3];
}

- (void)handleNWConnectionPacketEvent:(packet_id *)a3 eventType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v6 = [(AVCRateController *)[(VCMediaStreamRateAdaptation *)self->super._rateAdaptation vcrcRateController] nwConnectionCongestionDetector];

  [(VCNWConnectionCongestionDetector *)v6 processNWConnectionPacketEvent:a3 eventType:v4];
}

- (void)setMediaSuggestion:(VCRateControlMediaSuggestion *)a3
{
}

+ (BOOL)shouldUseRandomRTPTimestampWithType:(int64_t)a3
{
  if (!a3) {
    return 1;
  }
  if (a3 == 3) {
    return VCDefaults_GetBoolValueForKey(@"simulateWebRTCOnlyClient", 0);
  }
  return 0;
}

- (void)setupColorInfo:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if ([a3 pixelFormat] == 2019963956)
  {
    if (+[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", @"forceHDR10ColorInfo", 0)|| [a3 type] == 2 && objc_msgSend(a3, "hdrMode") == 1)
    {
      BOOL v5 = (const void *)*MEMORY[0x1E4F24AA8];
      uint64_t v6 = (const void *)*MEMORY[0x1E4F24BF8];
      __int16 v7 = (const void *)*MEMORY[0x1E4F24C30];
      if ((VCVideoStream *)objc_opt_class() != self)
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v8 = (__CFString *)[(VCVideoStream *)self performSelector:sel_logPrefix];
        }
        else {
          uint64_t v8 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_50;
        }
        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
        int v16 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_50;
        }
        int v36 = 136316162;
        uint64_t v37 = v18;
        __int16 v38 = 2080;
        uint64_t v39 = "-[VCVideoStream setupColorInfo:]";
        __int16 v40 = 1024;
        int v41 = 1202;
        __int16 v42 = 2112;
        v43 = v8;
        __int16 v44 = 2048;
        __int16 v45 = self;
        uint64_t v13 = "VCVideoStream [%s] %s:%d %@(%p) ITU_R_2020 color settings used to configure capture and encoder (except when in Airplay)";
        goto LABEL_48;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v17 = VRTraceErrorLogLevelToCSTR();
        uint64_t v12 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v36 = 136315650;
          uint64_t v37 = v17;
          __int16 v38 = 2080;
          uint64_t v39 = "-[VCVideoStream setupColorInfo:]";
          __int16 v40 = 1024;
          int v41 = 1202;
          uint64_t v13 = "VCVideoStream [%s] %s:%d ITU_R_2020 color settings used to configure capture and encoder (except when in Airplay)";
          goto LABEL_43;
        }
      }
      goto LABEL_50;
    }
    BOOL v5 = (const void *)*MEMORY[0x1E4F24AC0];
    uint64_t v6 = (const void *)*MEMORY[0x1E4F24BF8];
    __int16 v7 = (const void *)*MEMORY[0x1E4F24C48];
    if ((VCVideoStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v20 = VRTraceErrorLogLevelToCSTR();
        uint64_t v12 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v36 = 136315650;
          uint64_t v37 = v20;
          __int16 v38 = 2080;
          uint64_t v39 = "-[VCVideoStream setupColorInfo:]";
          __int16 v40 = 1024;
          int v41 = 1207;
          uint64_t v13 = "VCVideoStream [%s] %s:%d P3D65-PQ color settings used to configure capture and encoder";
          goto LABEL_43;
        }
      }
      goto LABEL_50;
    }
    if (objc_opt_respondsToSelector()) {
      int v10 = (__CFString *)[(VCVideoStream *)self performSelector:sel_logPrefix];
    }
    else {
      int v10 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_50;
    }
    uint64_t v23 = VRTraceErrorLogLevelToCSTR();
    int v16 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_50;
    }
    int v36 = 136316162;
    uint64_t v37 = v23;
    __int16 v38 = 2080;
    uint64_t v39 = "-[VCVideoStream setupColorInfo:]";
    __int16 v40 = 1024;
    int v41 = 1207;
    __int16 v42 = 2112;
    v43 = v10;
    __int16 v44 = 2048;
    __int16 v45 = self;
    uint64_t v13 = "VCVideoStream [%s] %s:%d %@(%p) P3D65-PQ color settings used to configure capture and encoder";
    goto LABEL_48;
  }
  if ([a3 type] == 1
    || [a3 type] == 6
    || [a3 type] == 5
    && !+[VCHardwareSettings deviceClass])
  {
    BOOL v5 = (const void *)*MEMORY[0x1E4F24AC0];
    uint64_t v6 = (const void *)*MEMORY[0x1E4F24C10];
    __int16 v7 = (const void *)*MEMORY[0x1E4F24C48];
    if ((VCVideoStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        uint64_t v12 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v36 = 136315650;
          uint64_t v37 = v11;
          __int16 v38 = 2080;
          uint64_t v39 = "-[VCVideoStream setupColorInfo:]";
          __int16 v40 = 1024;
          int v41 = 1214;
          uint64_t v13 = "VCVideoStream [%s] %s:%d P3D65-sRGB color settings used to configure capture and encoder";
LABEL_43:
          uint64_t v21 = v12;
          uint32_t v22 = 28;
LABEL_49:
          _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v36, v22);
        }
      }
LABEL_50:
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 3, MEMORY[0x1E4F1D048], MEMORY[0x1E4F1D540]);
      self->_videoStreamDelegateFunctions.remoteScreenAttributesDidChange = Mutable;
      if (Mutable)
      {
        CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F24A90], v5);
        CFDictionaryAddValue((CFMutableDictionaryRef)self->_videoStreamDelegateFunctions.remoteScreenAttributesDidChange, (const void *)*MEMORY[0x1E4F24BC8], v6);
        CFDictionaryAddValue((CFMutableDictionaryRef)self->_videoStreamDelegateFunctions.remoteScreenAttributesDidChange, (const void *)*MEMORY[0x1E4F24C18], v7);
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCVideoStream setupColorInfo:]();
        }
      }
      return;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v9 = (__CFString *)[(VCVideoStream *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v9 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_50;
    }
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    int v16 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_50;
    }
    int v36 = 136316162;
    uint64_t v37 = v15;
    __int16 v38 = 2080;
    uint64_t v39 = "-[VCVideoStream setupColorInfo:]";
    __int16 v40 = 1024;
    int v41 = 1214;
    __int16 v42 = 2112;
    v43 = v9;
    __int16 v44 = 2048;
    __int16 v45 = self;
    uint64_t v13 = "VCVideoStream [%s] %s:%d %@(%p) P3D65-sRGB color settings used to configure capture and encoder";
LABEL_48:
    uint64_t v21 = v16;
    uint32_t v22 = 48;
    goto LABEL_49;
  }
  if ([a3 type] == 4 && objc_msgSend(a3, "hdrMode") == 1)
  {
    BOOL v5 = (const void *)*MEMORY[0x1E4F24AA8];
    uint64_t v6 = (const void *)*MEMORY[0x1E4F24BD8];
    __int16 v7 = (const void *)*MEMORY[0x1E4F24C30];
    if ((VCVideoStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v34 = VRTraceErrorLogLevelToCSTR();
        uint64_t v12 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v36 = 136315650;
          uint64_t v37 = v34;
          __int16 v38 = 2080;
          uint64_t v39 = "-[VCVideoStream setupColorInfo:]";
          __int16 v40 = 1024;
          int v41 = 1223;
          uint64_t v13 = "VCVideoStream [%s] %s:%d ITU_R_2100_HLG color settings used to configure encoder";
          goto LABEL_43;
        }
      }
      goto LABEL_50;
    }
    if (objc_opt_respondsToSelector()) {
      int64_t v14 = (__CFString *)[(VCVideoStream *)self performSelector:sel_logPrefix];
    }
    else {
      int64_t v14 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_50;
    }
    uint64_t v35 = VRTraceErrorLogLevelToCSTR();
    int v16 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_50;
    }
    int v36 = 136316162;
    uint64_t v37 = v35;
    __int16 v38 = 2080;
    uint64_t v39 = "-[VCVideoStream setupColorInfo:]";
    __int16 v40 = 1024;
    int v41 = 1223;
    __int16 v42 = 2112;
    v43 = v14;
    __int16 v44 = 2048;
    __int16 v45 = self;
    uint64_t v13 = "VCVideoStream [%s] %s:%d %@(%p) ITU_R_2100_HLG color settings used to configure encoder";
    goto LABEL_48;
  }
  if ((VCVideoStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
      return;
    }
    uint64_t v25 = VRTraceErrorLogLevelToCSTR();
    int v26 = *MEMORY[0x1E4F47A50];
    uint64_t v27 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      int v36 = 136315650;
      uint64_t v37 = v25;
      __int16 v38 = 2080;
      uint64_t v39 = "-[VCVideoStream setupColorInfo:]";
      __int16 v40 = 1024;
      int v41 = 1225;
      unsigned int v28 = "VCVideoStream [%s] %s:%d No color settings applied";
      uint64_t v29 = v26;
      uint32_t v30 = 28;
      goto LABEL_62;
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      -[VCVideoStream setupColorInfo:]();
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      int v19 = (__CFString *)[(VCVideoStream *)self performSelector:sel_logPrefix];
    }
    else {
      int v19 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v31 = VRTraceErrorLogLevelToCSTR();
      int v32 = *MEMORY[0x1E4F47A50];
      int v33 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
          return;
        }
        int v36 = 136316162;
        uint64_t v37 = v31;
        __int16 v38 = 2080;
        uint64_t v39 = "-[VCVideoStream setupColorInfo:]";
        __int16 v40 = 1024;
        int v41 = 1225;
        __int16 v42 = 2112;
        v43 = v19;
        __int16 v44 = 2048;
        __int16 v45 = self;
        unsigned int v28 = "VCVideoStream [%s] %s:%d %@(%p) No color settings applied";
        uint64_t v29 = v32;
        uint32_t v30 = 48;
LABEL_62:
        _os_log_impl(&dword_1E1EA4000, v29, OS_LOG_TYPE_DEFAULT, v28, (uint8_t *)&v36, v30);
        return;
      }
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        int v36 = 136316162;
        uint64_t v37 = v31;
        __int16 v38 = 2080;
        uint64_t v39 = "-[VCVideoStream setupColorInfo:]";
        __int16 v40 = 1024;
        int v41 = 1225;
        __int16 v42 = 2112;
        v43 = v19;
        __int16 v44 = 2048;
        __int16 v45 = self;
        _os_log_debug_impl(&dword_1E1EA4000, v32, OS_LOG_TYPE_DEBUG, "VCVideoStream [%s] %s:%d %@(%p) No color settings applied", (uint8_t *)&v36, 0x30u);
      }
    }
  }
}

- (void)setupVideoTransmitterConfigColorInfo:(id)a3
{
  v13[3] = *MEMORY[0x1E4F143B8];
  CFDictionaryRef remoteScreenAttributesDidChange = (const __CFDictionary *)self->_videoStreamDelegateFunctions.remoteScreenAttributesDidChange;
  if (remoteScreenAttributesDidChange)
  {
    Value = CFDictionaryGetValue(remoteScreenAttributesDidChange, (const void *)*MEMORY[0x1E4F24A90]);
    __int16 v7 = CFDictionaryGetValue((CFDictionaryRef)self->_videoStreamDelegateFunctions.remoteScreenAttributesDidChange, (const void *)*MEMORY[0x1E4F24BC8]);
    uint64_t v8 = CFDictionaryGetValue((CFDictionaryRef)self->_videoStreamDelegateFunctions.remoteScreenAttributesDidChange, (const void *)*MEMORY[0x1E4F24C18]);
    if (Value) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (!v9 && v8 != 0)
    {
      uint64_t v11 = *MEMORY[0x1E4F44B58];
      v12[0] = *MEMORY[0x1E4F44868];
      v12[1] = v11;
      v13[0] = Value;
      v13[1] = v7;
      v12[2] = *MEMORY[0x1E4F44BB0];
      v13[2] = v8;
      objc_msgSend(a3, "setColorInfo:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v13, v12, 3));
    }
  }
}

+ (void)terminateProcess:(id)a3 terminateSource:(id)a4 agent:(opaqueRTCReporting *)a5
{
}

- (void)updateShouldCacheRemoteVideoFrame
{
  unint64_t type = self->_type;
  if (type <= 6) {
    self->_shouldCacheRemoteVideoFrame = 1uLL >> (8 * type);
  }
}

- (BOOL)setRTPPayloads:(int *)a3 numPayloads:(int)a4 withError:(id *)a5
{
  size_t v7 = a4;
  uint64_t v8 = malloc_type_calloc(a4, 4uLL, 0x100004052888210uLL);
  BOOL v9 = malloc_type_calloc(v7, 4uLL, 0x100004052888210uLL);
  int v10 = v9;
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  BOOL v12 = !v11;
  if (v12 && a4 >= 1)
  {
    uint64_t v14 = a4;
    uint64_t v15 = v9;
    do
    {
      int v16 = *a3++;
      *v15++ = v16;
      --v14;
    }
    while (v14);
  }
  if (v8) {
    free(v8);
  }
  if (v10) {
    free(v10);
  }
  return v12;
}

- (double)lastReceivedRTPPacketTime
{
  [(VCVideoReceiverBase *)self->_videoReceiver lastReceivedVideoRTPPacketTime];
  return result;
}

- (double)lastReceivedRTCPPacketTime
{
  [(VCVideoReceiverBase *)self->_videoReceiver lastReceivedVideoRTCPPacketTime];
  return result;
}

- (VCVideoStream)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCVideoStream;
  v2 = [(VCMediaStream *)&v5 init];
  uint64_t v3 = v2;
  if (v2)
  {
    *(void *)&v2->_constantTransportOverhead = 0x7FF8000000000000;
    [(VCVideoStream *)v2 setupVideoStream];
    v3->_externalOutputVideoLatency = micro();
  }
  return v3;
}

- (VCVideoStream)initWithTransportSessionID:(unsigned int)a3 idsParticipantID:(unint64_t)a4 ssrc:(unsigned int)a5 streamToken:(int64_t)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)VCVideoStream;
  size_t v7 = [(VCMediaStream *)&v15 initWithTransportSessionID:*(void *)&a3 localSSRC:*(void *)&a5 streamToken:a6];
  uint64_t v8 = v7;
  if (v7)
  {
    *(void *)&v7->_constantTransportOverhead = 0x7FF8000000000000;
    v7->_captureConverter = [[VCVideoCaptureConverter alloc] initWithConvertedFrameHandler:VCVideoStream_ProcessConvertedFrame context:v7];
    [(VCVideoStream *)v8 setupVideoStream];
    v8->_externalOutputVideoLatency = micro();
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      int v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        remoteQueue = v8->_remoteQueue;
        int64_t streamToken = v8->super._streamToken;
        unsigned int transportSessionID = v8->super._transportSessionID;
        *(_DWORD *)buf = 136316930;
        uint64_t v17 = v9;
        __int16 v18 = 2080;
        int v19 = "-[VCVideoStream initWithTransportSessionID:idsParticipantID:ssrc:streamToken:]";
        __int16 v20 = 1024;
        int v21 = 1340;
        __int16 v22 = 2048;
        uint64_t v23 = v8;
        __int16 v24 = 2048;
        uint64_t v25 = remoteQueue;
        __int16 v26 = 2048;
        unint64_t v27 = a4;
        __int16 v28 = 1024;
        int v29 = streamToken;
        __int16 v30 = 1024;
        unsigned int v31 = transportSessionID;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d VCVideoStream[%p] init queue=%p for idsParticipantID=%llu streamToken=%u transportSessionID=%d", buf, 0x46u);
      }
    }
  }
  return v8;
}

- (void)handleThermalPressureNotification:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", @"VCVideoCaptureServer_NotificationKeyThermalPressureLevel"), "intValue");
  if ((VCVideoStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      size_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v16 = v6;
        __int16 v17 = 2080;
        __int16 v18 = "-[VCVideoStream handleThermalPressureNotification:]";
        __int16 v19 = 1024;
        int v20 = 1349;
        __int16 v21 = 1024;
        LODWORD(v22) = v4;
        uint64_t v8 = "VCVideoStream [%s] %s:%d Received thermal notification at level=%d";
        uint64_t v9 = v7;
        uint32_t v10 = 34;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      objc_super v5 = (__CFString *)[(VCVideoStream *)self performSelector:sel_logPrefix];
    }
    else {
      objc_super v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      BOOL v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v16 = v11;
        __int16 v17 = 2080;
        __int16 v18 = "-[VCVideoStream handleThermalPressureNotification:]";
        __int16 v19 = 1024;
        int v20 = 1349;
        __int16 v21 = 2112;
        __int16 v22 = v5;
        __int16 v23 = 2048;
        __int16 v24 = self;
        __int16 v25 = 1024;
        int v26 = v4;
        uint64_t v8 = "VCVideoStream [%s] %s:%d %@(%p) Received thermal notification at level=%d";
        uint64_t v9 = v12;
        uint32_t v10 = 54;
        goto LABEL_11;
      }
    }
  }
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", v4, @"Thermal");
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  [(VCObject *)self reportingAgent];
  reportingGenericEvent();
}

- (void)setupThermalNotifications
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((VCVideoStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      objc_super v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v11 = 136315650;
        *(void *)&v11[4] = v4;
        *(_WORD *)&v11[12] = 2080;
        *(void *)&v11[14] = "-[VCVideoStream setupThermalNotifications]";
        *(_WORD *)&v11[22] = 1024;
        LODWORD(v12) = 1361;
        uint64_t v6 = "VCVideoStream [%s] %s:%d Setting up thermal notifications";
        size_t v7 = v5;
        uint32_t v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, v11, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v3 = (__CFString *)[(VCVideoStream *)self performSelector:sel_logPrefix];
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
        *(_DWORD *)uint64_t v11 = 136316162;
        *(void *)&v11[4] = v9;
        *(_WORD *)&v11[12] = 2080;
        *(void *)&v11[14] = "-[VCVideoStream setupThermalNotifications]";
        *(_WORD *)&v11[22] = 1024;
        LODWORD(v12) = 1361;
        WORD2(v12) = 2112;
        *(void *)((char *)&v12 + 6) = v3;
        HIWORD(v12) = 2048;
        uint64_t v13 = self;
        uint64_t v6 = "VCVideoStream [%s] %s:%d %@(%p) Setting up thermal notifications";
        size_t v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", *(_OWORD *)v11, *(void *)&v11[16], v12, v13), "addObserver:selector:name:object:", self, sel_handleThermalPressureNotification_, @"VCVideoCaptureServer_NotificationNameThermalPressureLevel", 0);
}

- (void)setupVideoStream
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  self->_isVideoCaptureRegistered = 0;
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  self->_lastDecodedFrameQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCVideoStream.lastDecodedFrameQueue", 0, CustomRootQueue);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    objc_super v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int64_t streamToken = self->super._streamToken;
      unsigned int transportSessionID = self->super._transportSessionID;
      int v8 = 136316418;
      uint64_t v9 = v4;
      __int16 v10 = 2080;
      uint64_t v11 = "-[VCVideoStream setupVideoStream]";
      __int16 v12 = 1024;
      int v13 = 1375;
      __int16 v14 = 2048;
      objc_super v15 = self;
      __int16 v16 = 1024;
      int v17 = streamToken;
      __int16 v18 = 1024;
      unsigned int v19 = transportSessionID;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d VCVideoStream[%p] remoteVideo create queue for streamToken=%u transportSessionID=%d", (uint8_t *)&v8, 0x32u);
    }
  }
  self->_remoteQueue = (VCImageQueue *)[(id)VCRemoteVideoManager_DefaultManager() newQueueForStreamToken:self->super._streamToken videoMode:0 imageQueueProtected:1];
  self->_lastMediaPriority = 0;
  [(VCObject *)self setReportingAgent:0];
  self->super._notificationHandler = _VCVideoStreamNWConnectionNotificationCallback;
  self->super._packetEventHandler = _VCVideoStreamNWConnectionPacketEventCallback;
  [(VCVideoStream *)self configureMediaStallSettingsWithConfig:0];
  FigCFWeakReferenceStore();
  VTP_SetCallback((uint64_t)_VCVideoStreamVTPNotificationCallback, (uint64_t)self->_weakStream);
}

- (void)dealloc
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int64_t streamToken = self->super._streamToken;
      *(_DWORD *)buf = 136316162;
      uint64_t v11 = v3;
      __int16 v12 = 2080;
      int v13 = "-[VCVideoStream dealloc]";
      __int16 v14 = 1024;
      int v15 = 1389;
      __int16 v16 = 2048;
      int v17 = self;
      __int16 v18 = 1024;
      int v19 = streamToken;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d VCVideoStream[%p] remoteVideo release queue for streamToken=%u", buf, 0x2Cu);
    }
  }
  [(id)VCRemoteVideoManager_DefaultManager() releaseQueueForStreamToken:self->super._streamToken];
  if (self->_captureSourceID && [(VCMediaStream *)self defaultStreamConfig])
  {
    id v6 = [(VCVideoStream *)self newScreenCaptureConfigForVideoConfig:[(VCMediaStream *)self defaultStreamConfig]];
    objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "deregisterCaptureConfig:forSource:", v6, -[VCMediaStreamConfig captureSource](-[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig"), "captureSource"));
  }
  [(VCVideoStream *)self deregisterCurrentStreamInputCaptureSource];

  _VCVideoStream_ReportingVideoStreamEventWithVideoAttributesAndStreamID((uint64_t)self, 5, 0, 0);
  dispatch_release((dispatch_object_t)self->_lastDecodedFrameQueue);
  CVPixelBufferRelease(self->_cachedRemoteVideoFrame);

  CFDictionaryRef remoteScreenAttributesDidChange = self->_videoStreamDelegateFunctions.remoteScreenAttributesDidChange;
  if (remoteScreenAttributesDidChange) {
    CFRelease(remoteScreenAttributesDidChange);
  }

  [(VCObject *)self reportingAgent];
  reportingCacheModuleSpecificInfo();
  int operatingMode = self->super._operatingMode;
  if (operatingMode != 1 && operatingMode != 6) {
    [(VCMediaStream *)self deregisterAggregationHandlers];
  }
  VTP_SetCallback(0, 0);
  FigCFWeakReferenceStore();
  v9.receiver = self;
  v9.super_class = (Class)VCVideoStream;
  [(VCMediaStream *)&v9 dealloc];
}

+ (id)supportedVideoPayloads
{
  return &unk_1F3DC87A8;
}

+ (id)capabilities
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  uint64_t v3 = (void *)MGCopyAnswer();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        int v9 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", @"w"), "intValue");
        int v10 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", @"h"), "intValue");
        if (v9 != 320 || (uint64_t v11 = &unk_1F3DC6210, v10 != 240))
        {
          if (v9 != 640 || (uint64_t v11 = &unk_1F3DC6240, v10 != 480))
          {
            if (v9 != 1280 || (uint64_t v11 = &unk_1F3DC6258, v10 != 720))
            {
              if (v9 != 1920) {
                continue;
              }
              uint64_t v11 = &unk_1F3DC6270;
              if (v10 != 1080) {
                continue;
              }
            }
          }
        }
        [v2 addObject:v11];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v17 count:16];
    }
    while (v5);
  }

  [v14 addObject:&unk_1F3DC6210];
  [v14 addObject:&unk_1F3DC6228];
  [v14 addObject:&unk_1F3DC6288];
  [v14 addObject:&unk_1F3DC6240];
  [v14 addObject:&unk_1F3DC62A0];
  [v14 addObject:&unk_1F3DC6258];
  [v14 addObject:&unk_1F3DC62B8];
  [v14 addObject:&unk_1F3DC6270];
  v15[0] = @"avcKeySupportedVideoEncodingCodecs";
  v16[0] = +[VCVideoStream supportedVideoPayloads];
  v15[1] = @"avcKeySupportedVideoDecodingCodecs";
  v16[1] = +[VCVideoStream supportedVideoPayloads];
  v15[2] = @"avcKeySupportedVideoEncodingResolutions";
  v16[2] = [v2 array];
  v15[3] = @"avcKeySupportedVideoDecodingResolutions";
  v16[3] = [v14 array];
  __int16 v12 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];

  return v12;
}

- (void)updateVideoConfig:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  VCMediaStream_Lock((uint64_t)self);
  id v30 = 0;
  if ([(VCMediaStream *)self state] == 2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (a3) {
          size_t v7 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
        }
        else {
          size_t v7 = "<nil>";
        }
        *(_DWORD *)buf = 136316162;
        *(void *)&uint8_t buf[4] = v5;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCVideoStream updateVideoConfig:]";
        *(_WORD *)&buf[22] = 1024;
        int v32 = 1517;
        __int16 v33 = 2048;
        uint64_t v34 = self;
        __int16 v35 = 2080;
        int v36 = (VCVideoStream *)v7;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d VCVideoStream[%p] videoConfigDict=%s", buf, 0x30u);
      }
    }
    int v13 = [(VCMediaStream *)self defaultStreamConfig];
    int v14 = [(VCMediaStreamConfig *)v13 updateWithClientDictionary:a3];
    char v15 = v14;
    if (v14)
    {
      [(VCMediaStream *)self stopRTCPSendHeartbeat];
      if ([(VCMediaStream *)self isSendingMedia])
      {
        memset(buf, 170, sizeof(buf));
        videoTransmitter = self->_videoTransmitter;
        if (videoTransmitter)
        {
          [(VCVideoTransmitterBase *)videoTransmitter lastFrameTime];
          videoTransmitter = self->_videoTransmitter;
        }
        else
        {
          memset(buf, 0, sizeof(buf));
        }
        uint64_t v21 = [(VCVideoTransmitterBase *)videoTransmitter lastRTPTimestamp];
        [(VCVideoStream *)self deregisterForVideoCapture];
        [(VCVideoStream *)self destroyVideoTransmitter];
        [(VCVideoStream *)self registerForVideoCapture];
        [(VCVideoStream *)self initVideoTransmitter];
        long long v26 = *(_OWORD *)buf;
        uint64_t v27 = *(void *)&buf[16];
        [(VCVideoTransmitterBase *)self->_videoTransmitter setLastFrameTime:&v26];
        [(VCVideoTransmitterBase *)self->_videoTransmitter setLastRTPTimestamp:v21];
        [(VCVideoTransmitterBase *)self->_videoTransmitter startVideo];
      }
      [(VCImageQueue *)self->_remoteQueue setFrameRate:[(VCMediaStreamConfig *)v13 framerate]];
      [(VCVideoStream *)self updateVideoReceiver:v13];
      [(VCMediaStream *)self startRTCPSendHeartbeat];
      _VCVideoStream_ReportingVideoStreamEventWithVideoAttributesAndStreamID((uint64_t)self, 205, 0, 0);
    }
    else
    {
      +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", &v30, 32016, 105, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCVideoStream.m", 1555), @"Invalid Parameter", @"Called with an invalid parameter");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        uint64_t v17 = VRTraceErrorLogLevelToCSTR();
        char IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
        long long v19 = *MEMORY[0x1E4F47A50];
        if (IsOSFaultDisabled)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            if (v30) {
              long long v20 = (const char *)objc_msgSend((id)objc_msgSend(v30, "description"), "UTF8String");
            }
            else {
              long long v20 = "<nil>";
            }
            *(_DWORD *)buf = 136316162;
            *(void *)&uint8_t buf[4] = v17;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "-[VCVideoStream updateVideoConfig:]";
            *(_WORD *)&buf[22] = 1024;
            int v32 = 1558;
            __int16 v33 = 2048;
            uint64_t v34 = self;
            __int16 v35 = 2080;
            int v36 = (VCVideoStream *)v20;
            _os_log_error_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_ERROR, "VCVideoStream [%s] %s:%d VCVideoStream[%p] error[%s]", buf, 0x30u);
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
        {
          if (v30) {
            __int16 v23 = (const char *)objc_msgSend((id)objc_msgSend(v30, "description"), "UTF8String");
          }
          else {
            __int16 v23 = "<nil>";
          }
          *(_DWORD *)buf = 136316162;
          *(void *)&uint8_t buf[4] = v17;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "-[VCVideoStream updateVideoConfig:]";
          *(_WORD *)&buf[22] = 1024;
          int v32 = 1558;
          __int16 v33 = 2048;
          uint64_t v34 = self;
          __int16 v35 = 2080;
          int v36 = (VCVideoStream *)v23;
          _os_log_fault_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_FAULT, "VCVideoStream [%s] %s:%d VCVideoStream[%p] error[%s]", buf, 0x30u);
        }
      }
      a3 = 0;
    }
    delegateNotificationQueue = self->super._delegateNotificationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__VCVideoStream_updateVideoConfig___block_invoke_169;
    block[3] = &unk_1E6DB5238;
    char v25 = v15;
    block[4] = self;
    block[5] = v30;
    block[6] = a3;
    __int16 v12 = block;
  }
  else
  {
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", &v30, 32016, 5, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCVideoStream.m", 1504), @"Bad API usage", @"updateVideoConfig Called while video stream is not running");
    if ((VCVideoStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCVideoStream updateVideoConfig:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v8 = (__CFString *)[(VCVideoStream *)self performSelector:sel_logPrefix];
      }
      else {
        int v8 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        int v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          if (v30) {
            uint64_t v22 = (const char *)objc_msgSend((id)objc_msgSend(v30, "description"), "UTF8String");
          }
          else {
            uint64_t v22 = "<nil>";
          }
          *(_DWORD *)buf = 136316418;
          *(void *)&uint8_t buf[4] = v9;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "-[VCVideoStream updateVideoConfig:]";
          *(_WORD *)&buf[22] = 1024;
          int v32 = 1507;
          __int16 v33 = 2112;
          uint64_t v34 = (VCVideoStream *)v8;
          __int16 v35 = 2048;
          int v36 = self;
          __int16 v37 = 2080;
          __int16 v38 = v22;
          _os_log_error_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_ERROR, "VCVideoStream [%s] %s:%d %@(%p) error[%s]", buf, 0x3Au);
        }
      }
    }
    delegateNotificationQueue = self->super._delegateNotificationQueue;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __35__VCVideoStream_updateVideoConfig___block_invoke;
    v28[3] = &unk_1E6DB5238;
    char v29 = 0;
    v28[4] = self;
    v28[5] = v30;
    v28[6] = 0;
    __int16 v12 = v28;
  }
  dispatch_async(delegateNotificationQueue, v12);
  VCMediaStream_Unlock((uint64_t)self);
}

uint64_t __35__VCVideoStream_updateVideoConfig___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    return [v3 vcMediaStream:v5 didUpdateVideoConfiguration:v4 error:v6 dictionary:v7];
  }
  return result;
}

uint64_t __35__VCVideoStream_updateVideoConfig___block_invoke_169(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    return [v3 vcMediaStream:v5 didUpdateVideoConfiguration:v4 error:v6 dictionary:v7];
  }
  return result;
}

- (void)requestLastDecodedFrame
{
  v3[5] = *MEMORY[0x1E4F143B8];
  lastDecodedFrameQueue = self->_lastDecodedFrameQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__VCVideoStream_requestLastDecodedFrame__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(lastDecodedFrameQueue, v3);
}

uint64_t __40__VCVideoStream_requestLastDecodedFrame__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendLastRemoteVideoFrame:*(void *)(*(void *)(a1 + 32) + 832)];
}

- (void)resetRemoteMediaStalled
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((VCVideoStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_12;
    }
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_DWORD *)uint64_t v11 = 136315650;
    *(void *)&v11[4] = v4;
    *(_WORD *)&v11[12] = 2080;
    *(void *)&v11[14] = "-[VCVideoStream resetRemoteMediaStalled]";
    *(_WORD *)&v11[22] = 1024;
    LODWORD(v12) = 1612;
    uint64_t v6 = "VCVideoStream [%s] %s:%d ";
    uint64_t v7 = v5;
    uint32_t v8 = 28;
    goto LABEL_11;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v3 = (__CFString *)[(VCVideoStream *)self performSelector:sel_logPrefix];
  }
  else {
    uint64_t v3 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    int v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v11 = 136316162;
      *(void *)&v11[4] = v9;
      *(_WORD *)&v11[12] = 2080;
      *(void *)&v11[14] = "-[VCVideoStream resetRemoteMediaStalled]";
      *(_WORD *)&v11[22] = 1024;
      LODWORD(v12) = 1612;
      WORD2(v12) = 2112;
      *(void *)((char *)&v12 + 6) = v3;
      HIWORD(v12) = 2048;
      int v13 = self;
      uint64_t v6 = "VCVideoStream [%s] %s:%d %@(%p) ";
      uint64_t v7 = v10;
      uint32_t v8 = 48;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, v11, v8);
    }
  }
LABEL_12:
  self->_isRemoteMediaStalled = 0;
  self->_lastMediaStallReportTime = 0.0;
  [(VCMediaStream *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [(VCMediaStreamDelegate *)[(VCMediaStream *)self delegate] vcMediaStream:self remoteMediaStalled:0 duration:0.0];
  }
}

- (void)generateKeyFrameWithFIRType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(VCMediaStreamConfig *)[(VCMediaStream *)self defaultStreamConfig] keyFrameInterval];
  uint64_t v6 = (VCVideoStream *)objc_opt_class();
  if (!v5)
  {
    if (v6 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_24;
      }
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      uint64_t v17 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      sendingStreamID = self->_sendingStreamID;
      *(_DWORD *)char v25 = 136316162;
      *(void *)&v25[4] = v16;
      *(_WORD *)&v25[12] = 2080;
      *(void *)&v25[14] = "-[VCVideoStream generateKeyFrameWithFIRType:]";
      *(_WORD *)&v25[22] = 1024;
      LODWORD(v26) = 1626;
      WORD2(v26) = 2112;
      *(void *)((char *)&v26 + 6) = sendingStreamID;
      HIWORD(v26) = 2112;
      uint64_t v27 = [(VCMediaStream *)self compoundStreamIDs];
      long long v19 = "VCVideoStream [%s] %s:%d Sending stream ID is %@, compound stream ID is %@";
      long long v20 = v17;
      uint32_t v21 = 48;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint32_t v8 = (__CFString *)[(VCVideoStream *)self performSelector:sel_logPrefix];
      }
      else {
        uint32_t v8 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_24;
      }
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      __int16 v23 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      __int16 v24 = self->_sendingStreamID;
      *(_DWORD *)char v25 = 136316674;
      *(void *)&v25[4] = v22;
      *(_WORD *)&v25[12] = 2080;
      *(void *)&v25[14] = "-[VCVideoStream generateKeyFrameWithFIRType:]";
      *(_WORD *)&v25[22] = 1024;
      LODWORD(v26) = 1626;
      WORD2(v26) = 2112;
      *(void *)((char *)&v26 + 6) = v8;
      HIWORD(v26) = 2048;
      uint64_t v27 = (NSArray *)self;
      *(_WORD *)__int16 v28 = 2112;
      *(void *)&v28[2] = v24;
      *(_WORD *)&v28[10] = 2112;
      *(void *)&v28[12] = [(VCMediaStream *)self compoundStreamIDs];
      long long v19 = "VCVideoStream [%s] %s:%d %@(%p) Sending stream ID is %@, compound stream ID is %@";
      long long v20 = v23;
      uint32_t v21 = 68;
    }
    _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, v19, v25, v21);
LABEL_24:
    -[VCVideoTransmitterBase generateKeyFrameWithFIRType:](self->_videoTransmitter, "generateKeyFrameWithFIRType:", v3, *(_OWORD *)v25, *(void *)&v25[16], v26, v27, *(_OWORD *)v28, *(void *)&v28[16]);
    return;
  }
  if (v6 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      int v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)char v25 = 136315650;
        *(void *)&v25[4] = v9;
        *(_WORD *)&v25[12] = 2080;
        *(void *)&v25[14] = "-[VCVideoStream generateKeyFrameWithFIRType:]";
        *(_WORD *)&v25[22] = 1024;
        LODWORD(v26) = 1623;
        uint64_t v11 = "VCVideoStream [%s] %s:%d Returning, No need to request a key frame generation with periodic IDR";
        long long v12 = v10;
        uint32_t v13 = 28;
LABEL_15:
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, v25, v13);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v7 = (__CFString *)[(VCVideoStream *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      char v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)char v25 = 136316162;
        *(void *)&v25[4] = v14;
        *(_WORD *)&v25[12] = 2080;
        *(void *)&v25[14] = "-[VCVideoStream generateKeyFrameWithFIRType:]";
        *(_WORD *)&v25[22] = 1024;
        LODWORD(v26) = 1623;
        WORD2(v26) = 2112;
        *(void *)((char *)&v26 + 6) = v7;
        HIWORD(v26) = 2048;
        uint64_t v27 = (NSArray *)self;
        uint64_t v11 = "VCVideoStream [%s] %s:%d %@(%p) Returning, No need to request a key frame generation with periodic IDR";
        long long v12 = v15;
        uint32_t v13 = 48;
        goto LABEL_15;
      }
    }
  }
}

- (double)fecRatio
{
  return self->_fecRatio;
}

- (void)setFecRatio:(double)a3
{
  self->_fecRatio = a3;
  VCVideoTransmitter_SetFECRatio((uint64_t)self->_videoTransmitter);
}

- (void)setFECRedundancyVector:(id *)a3
{
}

- (void)sendLastRemoteVideoFrame:(__CVBuffer *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return;
  }
  id v4 = +[VideoUtil convertPixelBuffer:a3 toImageType:0 withAssetIdentifier:0 cameraStatusBits:0 allowTimeMetaData:1];
  if (v4)
  {
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v4, @"vcMediaStreamLastDecodedFrame", 0);
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      delegateNotificationQueue = self->super._delegateNotificationQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __42__VCVideoStream_sendLastRemoteVideoFrame___block_invoke;
      block[3] = &unk_1E6DB3E40;
      block[4] = v6;
      block[5] = self;
      dispatch_async(delegateNotificationQueue, block);

      return;
    }
    if ((VCVideoStream *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v9 = (__CFString *)[(VCVideoStream *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v9 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        return;
      }
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        return;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v16 = v13;
      __int16 v17 = 2080;
      long long v18 = "-[VCVideoStream sendLastRemoteVideoFrame:]";
      __int16 v19 = 1024;
      int v20 = 1673;
      __int16 v21 = 2112;
      uint64_t v22 = v9;
      __int16 v23 = 2048;
      __int16 v24 = self;
      long long v12 = "VCVideoStream [%s] %s:%d %@(%p) Failed to create last frame XPC args";
LABEL_26:
      _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, v12, buf, 0x30u);
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoStream sendLastRemoteVideoFrame:]();
      }
    }
  }
  else if ((VCVideoStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoStream sendLastRemoteVideoFrame:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint32_t v8 = (__CFString *)[(VCVideoStream *)self performSelector:sel_logPrefix];
    }
    else {
      uint32_t v8 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v16 = v10;
        __int16 v17 = 2080;
        long long v18 = "-[VCVideoStream sendLastRemoteVideoFrame:]";
        __int16 v19 = 1024;
        int v20 = 1669;
        __int16 v21 = 2112;
        uint64_t v22 = v8;
        __int16 v23 = 2048;
        __int16 v24 = self;
        long long v12 = "VCVideoStream [%s] %s:%d %@(%p) Failed to create frame data";
        goto LABEL_26;
      }
    }
  }
}

uint64_t __42__VCVideoStream_sendLastRemoteVideoFrame___block_invoke(uint64_t a1)
{
  id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v2 sendMessageAsync:"vcMediaStreamDidGetLastDecodedFrame" arguments:v3 context:v4];
}

- (BOOL)validateVideoStreamConfigurations:(id)a3
{
  if (![a3 count]) {
    return 0;
  }
  uint64_t v4 = (void *)[a3 objectAtIndexedSubscript:0];
  if ((unint64_t)[a3 count] >= 2
    && [v4 direction] != 2
    && ![v4 temporalScalingEnabled])
  {
    return 0;
  }
  if ((unint64_t)[a3 count] < 2) {
    return 1;
  }
  unsigned int v6 = 2;
  uint64_t v7 = 1;
  do
  {
    uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v7), "direction");
    BOOL v5 = v8 == [v4 direction];
    if (!v5) {
      break;
    }
    uint64_t v7 = v6;
  }
  while ([a3 count] > (unint64_t)v6++);
  return v5;
}

- (void)cleanupBeforeReconfigure:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->super._transportArray count]) {
    int v5 = objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->super._transportArray, "objectAtIndexedSubscript:", 0), "streamConfig"), "localSSRC");
  }
  else {
    int v5 = 0;
  }
  if ([a3 count]) {
    int v6 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "localSSRC");
  }
  else {
    int v6 = 0;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v28 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unsigned int v9 = 0;
    uint64_t v10 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(a3);
        }
        v9 += [*(id *)(*((void *)&v28 + 1) + 8 * i) tilesPerFrame];
      }
      uint64_t v8 = [a3 countByEnumeratingWithState:&v28 objects:v27 count:16];
    }
    while (v8);
    uint64_t v12 = v9;
  }
  else
  {
    uint64_t v12 = 0;
  }
  BOOL v13 = [(NSMutableArray *)self->super._transportArray count] == v12 && v6 == v5;
  if (!v13 && [(NSMutableArray *)self->super._transportArray count])
  {
    if ((VCVideoStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCVideoStream cleanupBeforeReconfigure:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v14 = (__CFString *)[(VCVideoStream *)self performSelector:sel_logPrefix];
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
          int v17 = 136316162;
          uint64_t v18 = v15;
          __int16 v19 = 2080;
          int v20 = "-[VCVideoStream cleanupBeforeReconfigure:]";
          __int16 v21 = 1024;
          int v22 = 1719;
          __int16 v23 = 2112;
          __int16 v24 = v14;
          __int16 v25 = 2048;
          long long v26 = self;
          _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, "VCVideoStream [%s] %s:%d %@(%p) Reconfiguring VCVideoStream with a different number of transports.", (uint8_t *)&v17, 0x30u);
        }
      }
    }
    [(NSMutableArray *)self->super._transportArray removeAllObjects];
  }
}

- (void)setTargetStreamID:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (!-[NSNumber isEqualToNumber:](self->_targetStreamID, "isEqualToNumber:")
    || [a3 unsignedIntValue] != self->_currentStreamID)
  {
    if ((VCVideoStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_17;
      }
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      int v23 = 136315906;
      uint64_t v24 = v7;
      __int16 v25 = 2080;
      long long v26 = "-[VCVideoStream setTargetStreamID:]";
      __int16 v27 = 1024;
      int v28 = 1730;
      __int16 v29 = 2112;
      id v30 = a3;
      unsigned int v9 = "VCVideoStream [%s] %s:%d Setting target stream id: %@";
      uint64_t v10 = v8;
      uint32_t v11 = 38;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v6 = (__CFString *)[(VCVideoStream *)self performSelector:sel_logPrefix];
      }
      else {
        int v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_17;
      }
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      BOOL v13 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      int v23 = 136316418;
      uint64_t v24 = v12;
      __int16 v25 = 2080;
      long long v26 = "-[VCVideoStream setTargetStreamID:]";
      __int16 v27 = 1024;
      int v28 = 1730;
      __int16 v29 = 2112;
      id v30 = v6;
      __int16 v31 = 2048;
      uint64_t v32 = self;
      __int16 v33 = 2112;
      id v34 = a3;
      unsigned int v9 = "VCVideoStream [%s] %s:%d %@(%p) Setting target stream id: %@";
      uint64_t v10 = v13;
      uint32_t v11 = 58;
    }
    _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v23, v11);
LABEL_17:

    self->_targetStreamID = (NSNumber *)a3;
    -[VCVideoReceiverBase setTargetStreamID:](self->_videoReceiver, "setTargetStreamID:", [a3 unsignedShortValue]);
    return;
  }
  if ((VCVideoStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      uint64_t v15 = *MEMORY[0x1E4F47A50];
      uint64_t v16 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v23 = 136315906;
          uint64_t v24 = v14;
          __int16 v25 = 2080;
          long long v26 = "-[VCVideoStream setTargetStreamID:]";
          __int16 v27 = 1024;
          int v28 = 1727;
          __int16 v29 = 2112;
          id v30 = a3;
          int v17 = "VCVideoStream [%s] %s:%d TargetStreamID didn't change %@";
          uint64_t v18 = v15;
          uint32_t v19 = 38;
LABEL_28:
          _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v23, v19);
        }
      }
      else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        -[VCVideoStream setTargetStreamID:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      int v5 = (__CFString *)[(VCVideoStream *)self performSelector:sel_logPrefix];
    }
    else {
      int v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      __int16 v21 = *MEMORY[0x1E4F47A50];
      int v22 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          int v23 = 136316418;
          uint64_t v24 = v20;
          __int16 v25 = 2080;
          long long v26 = "-[VCVideoStream setTargetStreamID:]";
          __int16 v27 = 1024;
          int v28 = 1727;
          __int16 v29 = 2112;
          id v30 = v5;
          __int16 v31 = 2048;
          uint64_t v32 = self;
          __int16 v33 = 2112;
          id v34 = a3;
          int v17 = "VCVideoStream [%s] %s:%d %@(%p) TargetStreamID didn't change %@";
          uint64_t v18 = v21;
          uint32_t v19 = 58;
          goto LABEL_28;
        }
      }
      else if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        int v23 = 136316418;
        uint64_t v24 = v20;
        __int16 v25 = 2080;
        long long v26 = "-[VCVideoStream setTargetStreamID:]";
        __int16 v27 = 1024;
        int v28 = 1727;
        __int16 v29 = 2112;
        id v30 = v5;
        __int16 v31 = 2048;
        uint64_t v32 = self;
        __int16 v33 = 2112;
        id v34 = a3;
        _os_log_debug_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEBUG, "VCVideoStream [%s] %s:%d %@(%p) TargetStreamID didn't change %@", (uint8_t *)&v23, 0x3Au);
      }
    }
  }
}

- (void)setShouldEnableFaceZoom:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_shouldEnableFaceZoom != a3)
  {
    BOOL v3 = a3;
    self->_shouldEnableFaceZoom = a3;
    if ((VCVideoStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_13;
      }
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_DWORD *)BOOL v13 = 136315906;
      *(void *)&void v13[4] = v6;
      *(_WORD *)&v13[12] = 2080;
      *(void *)&v13[14] = "-[VCVideoStream setShouldEnableFaceZoom:]";
      *(_WORD *)&v13[22] = 1024;
      LODWORD(v14) = 1739;
      WORD2(v14) = 1024;
      *(_DWORD *)((char *)&v14 + 6) = v3;
      uint64_t v8 = "VCVideoStream [%s] %s:%d Setting shouldEnableFaceZoom in receiver=%d";
      unsigned int v9 = v7;
      uint32_t v10 = 34;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v5 = (__CFString *)[(VCVideoStream *)self performSelector:sel_logPrefix];
      }
      else {
        int v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_13;
      }
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_DWORD *)BOOL v13 = 136316418;
      *(void *)&void v13[4] = v11;
      *(_WORD *)&v13[12] = 2080;
      *(void *)&v13[14] = "-[VCVideoStream setShouldEnableFaceZoom:]";
      *(_WORD *)&v13[22] = 1024;
      LODWORD(v14) = 1739;
      WORD2(v14) = 2112;
      *(void *)((char *)&v14 + 6) = v5;
      HIWORD(v14) = 2048;
      uint64_t v15 = self;
      LOWORD(v16) = 1024;
      *(_DWORD *)((char *)&v16 + 2) = v3;
      uint64_t v8 = "VCVideoStream [%s] %s:%d %@(%p) Setting shouldEnableFaceZoom in receiver=%d";
      unsigned int v9 = v12;
      uint32_t v10 = 54;
    }
    _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, v13, v10);
LABEL_13:
    -[VCVideoReceiverBase setShouldEnableFaceZoom:](self->_videoReceiver, "setShouldEnableFaceZoom:", v3, *(_OWORD *)v13, *(void *)&v13[16], v14, v15, v16, v17);
  }
}

- (void)setShouldEnableMLEnhance:(BOOL)a3 streamID:(unsigned __int16)a4
{
}

- (unsigned)lastDisplayedFrameRTPTimestamp
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      videoReceiver = self->_videoReceiver;
      int v7 = 136316418;
      uint64_t v8 = v3;
      __int16 v9 = 2080;
      uint32_t v10 = "-[VCVideoStream lastDisplayedFrameRTPTimestamp]";
      __int16 v11 = 1024;
      int v12 = 1751;
      __int16 v13 = 2048;
      long long v14 = self;
      __int16 v15 = 2048;
      uint64_t v16 = videoReceiver;
      __int16 v17 = 1024;
      unsigned int v18 = [(VCVideoReceiverBase *)videoReceiver lastDisplayedFrameRTPTimestamp];
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d From VCVideoStream[%p], _videoReceiver[%p], RTPTimestamp[%u]", (uint8_t *)&v7, 0x36u);
    }
  }
  return [(VCVideoReceiverBase *)self->_videoReceiver lastDisplayedFrameRTPTimestamp];
}

+ (BOOL)isLowLatencyStreamType:(int64_t)a3
{
  return ((unint64_t)a3 < 7) & (0x76u >> a3);
}

- (BOOL)isLowLatencyStreamType
{
  return +[VCVideoStream isLowLatencyStreamType:self->_type];
}

+ (BOOL)isFeatureListStringExpectedForStreamType:(int64_t)a3
{
  return ((unint64_t)a3 < 7) & (0x76u >> a3);
}

+ (BOOL)shouldEnableRateControlForStreamType:(int64_t)a3
{
  return ((unint64_t)a3 < 7) & (0x76u >> a3);
}

+ (BOOL)shouldRegisterReportingForStreamType:(int64_t)a3
{
  return ((unint64_t)a3 < 7) & (0x76u >> a3);
}

- (BOOL)validateStreamConfiguration:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!+[VCVideoStream isFeatureListStringExpectedForStreamType:](VCVideoStream, "isFeatureListStringExpectedForStreamType:", [a3 type])|| objc_msgSend((id)objc_msgSend(a3, "rxCodecFeatureListStrings"), "count")&& objc_msgSend((id)objc_msgSend(a3, "txCodecFeatureListStrings"), "count"))
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a4, 32016, 105, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCVideoStream.m", 1833), @"Invalid configuration", @"Feature string is nil");
    if ((VCVideoStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if (VRTraceIsOSFaultDisabled())
        {
          BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (!v7) {
            return v7;
          }
          -[VCVideoStream validateStreamConfiguration:error:]();
        }
        else
        {
          BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT);
          if (!v7) {
            return v7;
          }
          -[VCVideoStream validateStreamConfiguration:error:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v8 = (__CFString *)[(VCVideoStream *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v8 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        char IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
        __int16 v11 = *MEMORY[0x1E4F47A50];
        if (IsOSFaultDisabled)
        {
          BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (!v7) {
            return v7;
          }
          if (*a4) {
            int v12 = (const char *)objc_msgSend((id)objc_msgSend(*a4, "description"), "UTF8String");
          }
          else {
            int v12 = "<nil>";
          }
          *(_DWORD *)buf = 136316418;
          uint64_t v16 = v9;
          __int16 v17 = 2080;
          unsigned int v18 = "-[VCVideoStream validateStreamConfiguration:error:]";
          __int16 v19 = 1024;
          int v20 = 1836;
          __int16 v21 = 2112;
          int v22 = v8;
          __int16 v23 = 2048;
          uint64_t v24 = self;
          __int16 v25 = 2080;
          long long v26 = v12;
          _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, "VCVideoStream [%s] %s:%d %@(%p) error[%s]", buf, 0x3Au);
        }
        else
        {
          BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT);
          if (!v7) {
            return v7;
          }
          if (*a4) {
            __int16 v13 = (const char *)objc_msgSend((id)objc_msgSend(*a4, "description"), "UTF8String");
          }
          else {
            __int16 v13 = "<nil>";
          }
          *(_DWORD *)buf = 136316418;
          uint64_t v16 = v9;
          __int16 v17 = 2080;
          unsigned int v18 = "-[VCVideoStream validateStreamConfiguration:error:]";
          __int16 v19 = 1024;
          int v20 = 1836;
          __int16 v21 = 2112;
          int v22 = v8;
          __int16 v23 = 2048;
          uint64_t v24 = self;
          __int16 v25 = 2080;
          long long v26 = v13;
          _os_log_fault_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_FAULT, "VCVideoStream [%s] %s:%d %@(%p) error[%s]", buf, 0x3Au);
        }
      }
    }
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (BOOL)setEncodingMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136316162;
      uint64_t v10 = v5;
      __int16 v11 = 2080;
      int v12 = "-[VCVideoStream setEncodingMode:]";
      __int16 v13 = 1024;
      int v14 = 1844;
      __int16 v15 = 2048;
      uint64_t v16 = self;
      __int16 v17 = 1024;
      int v18 = v3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d VCVideoStream[%p]: encodingMode=%d", (uint8_t *)&v9, 0x2Cu);
    }
  }
  VCMediaStream_Lock((uint64_t)self);
  BOOL v7 = [(VCVideoTransmitterBase *)self->_videoTransmitter setEncodingMode:v3];
  VCMediaStream_Unlock((uint64_t)self);
  return v7;
}

- (BOOL)enableRateControlFeebackInConfig:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [a3 setRtcpEnabled:1];
  [a3 setRtcpReceiveCallbackEnabled:0];
  if ([a3 rateControlConfig])
  {
    uint64_t v4 = 0;
LABEL_5:
    BOOL v6 = 1;
    objc_msgSend((id)objc_msgSend(a3, "rateControlConfig"), "setShouldCreateMediaControlInfoGenerator:", 1);
    objc_msgSend((id)objc_msgSend(a3, "rateControlConfig"), "setMediaControlInfoVersion:", 2);
    objc_msgSend((id)objc_msgSend(a3, "rateControlConfig"), "setMediaControlInfoGeneratorType:", 1);
    goto LABEL_6;
  }
  uint64_t v5 = objc_alloc_init(VCMediaStreamRateControlConfig);
  if (v5)
  {
    uint64_t v4 = v5;
    [a3 setRateControlConfig:v5];
    goto LABEL_5;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    int v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315650;
      uint64_t v11 = v8;
      __int16 v12 = 2080;
      __int16 v13 = "-[VCVideoStream enableRateControlFeebackInConfig:]";
      __int16 v14 = 1024;
      int v15 = 1861;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d Could not allocate memory for creating VCMediaStreamRateControlConfig object", (uint8_t *)&v10, 0x1Cu);
    }
  }
  uint64_t v4 = 0;
  BOOL v6 = 0;
LABEL_6:

  return v6;
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

- (void)setUplinkRetransmissionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  VCMediaStream_Lock((uint64_t)self);
  if (self->super._isUplinkRetransmissionEnabled != v3)
  {
    [(VCMediaStreamConfig *)[(VCMediaStream *)self defaultStreamConfig] setIsUplinkRetransmissionEnabled:v3];
    self->super._isUplinkRetransmissionEnabled = v3;
    if ([(VCMediaStream *)self state] == 2) {
      [(VCVideoTransmitterBase *)self->_videoTransmitter setRtxEnabled:v3];
    }
  }

  VCMediaStream_Unlock((uint64_t)self);
}

- (double)activeVideoStallDuration
{
  VCMediaStream_Lock((uint64_t)self);
  double v3 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [(VCVideoReceiverBase *)self->_videoReceiver activeVideoStallDuration];
    double v3 = v4;
  }
  VCMediaStream_Unlock((uint64_t)self);
  return v3;
}

- (double)videoRxFrameRate
{
  VCMediaStream_Lock((uint64_t)self);
  double v3 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [(VCVideoReceiverBase *)self->_videoReceiver videoReceiverRxFrameRate];
    double v3 = v4;
  }
  VCMediaStream_Unlock((uint64_t)self);
  return v3;
}

- (id)supportedPayloads
{
  return +[VCVideoStream supportedVideoPayloads];
}

- (id)getTransmitMediaControllerWithStreamConfig:(id)a3
{
  if ([a3 type] != 3) {
    return 0;
  }
  double v4 = (void *)[a3 rateControlConfig];

  return (id)[v4 mediaController];
}

- (id)getTransmitStatsCollectorWithStreamConfig:(id)a3
{
  unint64_t v5 = [a3 type];
  if (v5 <= 6 && ((1 << v5) & 0x76) != 0) {
    return self->_statisticsCollector;
  }
  BOOL v7 = (void *)[a3 rateControlConfig];

  return (id)[v7 statisticsCollector];
}

- (id)getReceiveStatsCollectorWithStreamConfig:(id)a3
{
  unint64_t v5 = [a3 type];
  id result = 0;
  if (v5 <= 6)
  {
    if (((1 << v5) & 0x76) != 0)
    {
      if ([a3 direction] == 2) {
        return self->_statisticsCollector;
      }
      else {
        return 0;
      }
    }
    else if (v5 == 3)
    {
      BOOL v7 = (void *)[a3 rateControlConfig];
      return (id)[v7 statisticsCollector];
    }
  }
  return result;
}

- (void)deregisterCurrentStreamInputCaptureSource
{
  if (self->_captureSource == 6)
  {
    if (self->_streamInputCaptureSource)
    {
      objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "unregisterStreamInputCaptureSourceWithCaptureSourceID:", self->_streamInputCaptureSource);
      self->_streamInputCaptureSource = 0;
    }
  }
}

- (BOOL)configureStreamInputCaptureSourceWithStreamInputID:(int64_t)a3 frameRate:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  [(VCVideoStream *)self deregisterCurrentStreamInputCaptureSource];
  int v7 = objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "registerStreamInputCaptureSourceWithID:frameRate:", a3, v4);
  self->_streamInputCaptureSource = v7;
  if (!v7 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCVideoStream configureStreamInputCaptureSourceWithStreamInputID:frameRate:]();
    }
  }
  return v7 != 0;
}

- (unsigned)maxFramerateFromStreamConfigs:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v4 = [a3 countByEnumeratingWithState:&v37 objects:v36 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v38;
    *(void *)&long long v5 = 136316162;
    long long v22 = v5;
    while (1)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(a3);
        }
        int v10 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        if (objc_msgSend(v10, "framerate", v22) > v7)
        {
          if ((VCVideoStream *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v18 = VRTraceErrorLogLevelToCSTR();
              uint64_t v19 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v20 = [v10 framerate];
                *(_DWORD *)buf = v22;
                uint64_t v25 = v18;
                __int16 v26 = 2080;
                uint64_t v27 = "-[VCVideoStream maxFramerateFromStreamConfigs:]";
                __int16 v28 = 1024;
                int v29 = 2004;
                __int16 v30 = 1024;
                *(_DWORD *)__int16 v31 = v7;
                *(_WORD *)&v31[4] = 2048;
                *(void *)&v31[6] = v20;
                int v15 = v19;
                uint64_t v16 = "VCVideoStream [%s] %s:%d Updating maxFramerate from old=%u to new=%lu";
                uint32_t v17 = 44;
LABEL_16:
                _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, v17);
              }
            }
          }
          else
          {
            uint64_t v11 = &stru_1F3D3E450;
            if (objc_opt_respondsToSelector()) {
              uint64_t v11 = (__CFString *)[(VCVideoStream *)self performSelector:sel_logPrefix];
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v12 = VRTraceErrorLogLevelToCSTR();
              __int16 v13 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v14 = [v10 framerate];
                *(_DWORD *)buf = 136316674;
                uint64_t v25 = v12;
                __int16 v26 = 2080;
                uint64_t v27 = "-[VCVideoStream maxFramerateFromStreamConfigs:]";
                __int16 v28 = 1024;
                int v29 = 2004;
                __int16 v30 = 2112;
                *(void *)__int16 v31 = v11;
                *(_WORD *)&v31[8] = 2048;
                *(void *)&v31[10] = self;
                __int16 v32 = 1024;
                int v33 = v7;
                __int16 v34 = 2048;
                uint64_t v35 = v14;
                int v15 = v13;
                uint64_t v16 = "VCVideoStream [%s] %s:%d %@(%p) Updating maxFramerate from old=%u to new=%lu";
                uint32_t v17 = 64;
                goto LABEL_16;
              }
            }
          }
          unint64_t v7 = [v10 framerate];
          continue;
        }
      }
      uint64_t v6 = [a3 countByEnumeratingWithState:&v37 objects:v36 count:16];
      if (!v6) {
        return v7;
      }
    }
  }
  LODWORD(v7) = 0;
  return v7;
}

- (void)configureMediaStallSettingsWithConfig:(id)a3
{
  self->_sendContinuousStallMessages = [a3 type] == 3;
  if (a3)
  {
    [a3 mediaStallTimeout];
    objc_msgSend(a3, "mediaStallTimeout", 5.0);
    self->_mediaStallTimeout = VCDefaults_GetDoubleValueForKey(@"mediaStallTimeout", v5);
    [a3 mediaStallReportRepeatInterval];
    [a3 mediaStallReportRepeatInterval];
    double v7 = v6;
    self->_sendContinuousStallMessages = 1;
  }
  else
  {
    double v7 = 5.0;
    self->_mediaStallTimeout = VCDefaults_GetDoubleValueForKey(@"mediaStallTimeout", 5.0);
  }
  self->_mediaStallReportRepeatInterval = VCDefaults_GetDoubleValueForKey(@"mediaStallReportRepeatInterval", v7);
}

- (BOOL)onConfigureStreamWithConfiguration:(id)a3 error:(id *)a4
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  if (!-[VCVideoStream validateVideoStreamConfigurations:](self, "validateVideoStreamConfigurations:"))
  {
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a4, 32016, 105, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCVideoStream.m", 2033), @"Invalid Parameter", @"Called with an invalid parameter");
    if ((VCVideoStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if (VRTraceIsOSFaultDisabled())
        {
          BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (!v11) {
            return v11;
          }
          -[VCVideoStream onConfigureStreamWithConfiguration:error:].cold.9();
        }
        else
        {
          BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT);
          if (!v11) {
            return v11;
          }
          -[VCVideoStream onConfigureStreamWithConfiguration:error:]0();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v10 = (__CFString *)[(VCVideoStream *)self performSelector:sel_logPrefix];
      }
      else {
        int v10 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        char IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
        uint64_t v14 = *MEMORY[0x1E4F47A50];
        if (IsOSFaultDisabled)
        {
          BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (!v11) {
            return v11;
          }
          if (*a4) {
            int v15 = (const char *)objc_msgSend((id)objc_msgSend(*a4, "description"), "UTF8String");
          }
          else {
            int v15 = "<nil>";
          }
          *(_DWORD *)buf = 136316418;
          uint64_t v78 = v12;
          __int16 v79 = 2080;
          v80 = "-[VCVideoStream onConfigureStreamWithConfiguration:error:]";
          __int16 v81 = 1024;
          int v82 = 2036;
          __int16 v83 = 2112;
          v84 = v10;
          __int16 v85 = 2048;
          long long v86 = self;
          __int16 v87 = 2080;
          long long v88 = v15;
          int v48 = "VCVideoStream [%s] %s:%d %@(%p) error[%s]";
LABEL_154:
          __int16 v49 = v14;
          uint32_t v50 = 58;
LABEL_155:
          _os_log_error_impl(&dword_1E1EA4000, v49, OS_LOG_TYPE_ERROR, v48, buf, v50);
        }
        else
        {
          BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT);
          if (!v11) {
            return v11;
          }
          if (*a4) {
            __int16 v23 = (const char *)objc_msgSend((id)objc_msgSend(*a4, "description"), "UTF8String");
          }
          else {
            __int16 v23 = "<nil>";
          }
          *(_DWORD *)buf = 136316418;
          uint64_t v78 = v12;
          __int16 v79 = 2080;
          v80 = "-[VCVideoStream onConfigureStreamWithConfiguration:error:]";
          __int16 v81 = 1024;
          int v82 = 2036;
          __int16 v83 = 2112;
          v84 = v10;
          __int16 v85 = 2048;
          long long v86 = self;
          __int16 v87 = 2080;
          long long v88 = v23;
          int v56 = "VCVideoStream [%s] %s:%d %@(%p) error[%s]";
LABEL_158:
          __int16 v57 = v14;
          uint32_t v58 = 58;
LABEL_159:
          _os_log_fault_impl(&dword_1E1EA4000, v57, OS_LOG_TYPE_FAULT, v56, buf, v58);
        }
      }
    }
    goto LABEL_160;
  }
  double v7 = (void *)[a3 objectAtIndexedSubscript:0];
  [(VCVideoStream *)self cleanupBeforeReconfigure:a3];
  [(VCVideoStream *)self overrideConfigWithDefaults:v7];
  p_int64_t type = &self->_type;
  self->_int64_t type = [v7 type];
  [(VCVideoStream *)self updateShouldCacheRemoteVideoFrame];
  self->_captureSource = [v7 captureSource];
  LODWORD(self->_colorInfo) = objc_msgSend((id)objc_msgSend(v7, "multiwayConfig"), "qualityIndex");
  [(VCVideoStream *)self configureMediaStallSettingsWithConfig:v7];
  int64_t type = self->_type;
  if (type == 6)
  {
LABEL_5:
    self->_screenDisplayID = [v7 screenDisplayID];
    goto LABEL_20;
  }
  if (type != 2)
  {
    if (type != 1) {
      goto LABEL_20;
    }
    goto LABEL_5;
  }
  self->_captureSource = 2;
LABEL_20:
  if ([(VCVideoStream *)self isScreenConfig:v7])
  {
    self->_customHeight = [v7 customHeight];
    self->_customWidth = [v7 customWidth];
  }
  [(VCVideoStream *)self setupColorInfo:v7];
  int64_t v16 = [v7 captureSourceID];
  self->_captureSourceID = v16;
  if (v16)
  {
    if ([(VCMediaStream *)self defaultStreamConfig])
    {
      id v17 = [(VCVideoStream *)self newScreenCaptureConfigForVideoConfig:[(VCMediaStream *)self defaultStreamConfig]];
      objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "deregisterCaptureConfig:forSource:", v17, -[VCMediaStreamConfig captureSource](-[VCMediaStream defaultStreamConfig](self, "defaultStreamConfig"), "captureSource"));
    }
    id v18 = [(VCVideoStream *)self newScreenCaptureConfigForVideoConfig:v7];
    objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "registerCaptureConfig:forSource:", v18, objc_msgSend(v7, "captureSource"));
  }
  if ([v7 temporalScalingEnabled]) {
    self->_isTemporalScalingEnabled = 1;
  }
  if ([v7 isRedundancyControlEnabled] && objc_msgSend(v7, "type") == 3) {
    [(VCVideoStream *)self setupInternalRedundancyControllerWithStreamConfig:v7];
  }
  uint64_t v19 = [(VCVideoStream *)self maxFramerateFromStreamConfigs:a3];
  if (self->_captureSource == 6
    && !-[VCVideoStream configureStreamInputCaptureSourceWithStreamInputID:frameRate:](self, "configureStreamInputCaptureSourceWithStreamInputID:frameRate:", [v7 streamInputID], v19))
  {
    if (a4)
    {
      long long v22 = (void *)[MEMORY[0x1E4F28C58] AVConferenceServiceError:32000, 0, @"Can not register capture source streamInput, streamInputID could be wrong" detailCode description];
      LOBYTE(v11) = 0;
      *a4 = v22;
      return v11;
    }
LABEL_160:
    LOBYTE(v11) = 0;
    return v11;
  }
  unsigned int v61 = v19;
  BOOL v68 = [(VCVideoStream *)self isLowLatencyStreamType];
  if (v68
    && self->super._transportSetupInfo.setupType == 1
    && ([v7 direction] == 2 || objc_msgSend(v7, "direction") == 3))
  {
    int v71 = 1500000;
    int v20 = setsockopt(self->super._transportSetupInfo.var0.socketInfo.rtpSocket, 0xFFFF, 4098, &v71, 4u);
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v20)
    {
      if (ErrorLogLevelForModule >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCVideoStream onConfigureStreamWithConfiguration:error:].cold.8();
        }
      }
    }
    else if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v24 = VRTraceErrorLogLevelToCSTR();
      uint64_t v25 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v78 = v24;
        __int16 v79 = 2080;
        v80 = "-[VCVideoStream onConfigureStreamWithConfiguration:error:]";
        __int16 v81 = 1024;
        int v82 = 2112;
        __int16 v83 = 1024;
        LODWORD(v84) = 1500000;
        _os_log_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d Set socket receive buffer size=%d", buf, 0x22u);
      }
    }
  }
  self->super._int operatingMode = [(VCVideoStream *)self operatingModeForVideoStreamType:*p_type];
  [(VCVideoStream *)self setupThermalNotifications];
  v69 = a4;
  if (*p_type)
  {
    if ([v7 rtpTimestampRate]) {
      unsigned int v26 = [v7 rtpTimestampRate];
    }
    else {
      unsigned int v26 = 24000;
    }
  }
  else
  {
    unsigned int v26 = 90000;
  }
  self->_unsigned int rtpTimestampRate = v26;
  p_transportSetupInfo = &self->super._transportSetupInfo;
  self->super._transportSetupInfo.sourceRate = v26;
  self->super._useRandomTS = +[VCVideoStream shouldUseRandomRTPTimestampWithType:*p_type];
  uint64_t v67 = [(NSMutableArray *)self->super._transportArray count];
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  obuint64_t j = a3;
  uint64_t v62 = [a3 countByEnumeratingWithState:&v73 objects:v72 count:16];
  if (v62)
  {
    unsigned int v27 = 0;
    uint64_t v63 = *(void *)v74;
LABEL_58:
    uint64_t v28 = 0;
    while (1)
    {
      if (*(void *)v74 != v63) {
        objc_enumerationMutation(obj);
      }
      int v29 = *(void **)(*((void *)&v73 + 1) + 8 * v28);
      int v66 = [v29 remoteSSRC];
      int v30 = [v29 tilesPerFrame];
      BOOL v11 = [(VCVideoStream *)self validateStreamConfiguration:v29 error:v69];
      if (!v11) {
        break;
      }
      uint64_t v64 = v28;
      if (v30 >= 1)
      {
        int v31 = 0;
        while (1)
        {
          uint64_t localSSRC = self->super._localSSRC;
          if (v68)
          {
            uint64_t localSSRC = (v31 + localSSRC);
            if ([v29 remoteSSRC]) {
              [v29 setRemoteSSRC:(v66 + v31)];
            }
          }
          else if ([v29 temporalScalingEnabled])
          {
            uint64_t localSSRC = objc_msgSend((id)objc_msgSend(v29, "multiwayConfig"), "ssrc");
          }
          if (v67)
          {
            id v33 = (id)[(NSMutableArray *)self->super._transportArray objectAtIndexedSubscript:v27++];
            if (!v33) {
              goto LABEL_92;
            }
          }
          else
          {
            id v33 = [(VCMediaStream *)self createTransportWithStreamConfig:v29 ssrc:localSSRC];
            if (!v33)
            {
LABEL_92:
              if ((VCVideoStream *)objc_opt_class() == self)
              {
                uint64_t v35 = v69;
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  VRTraceErrorLogLevelToCSTR();
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                    -[VCVideoStream onConfigureStreamWithConfiguration:error:]();
                  }
                }
              }
              else
              {
                uint64_t v35 = v69;
                if (objc_opt_respondsToSelector()) {
                  int v36 = (__CFString *)[(VCVideoStream *)self performSelector:sel_logPrefix];
                }
                else {
                  int v36 = &stru_1F3D3E450;
                }
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  uint64_t v39 = VRTraceErrorLogLevelToCSTR();
                  long long v40 = *MEMORY[0x1E4F47A50];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136316162;
                    uint64_t v78 = v39;
                    __int16 v79 = 2080;
                    v80 = "-[VCVideoStream onConfigureStreamWithConfiguration:error:]";
                    __int16 v81 = 1024;
                    int v82 = 2154;
                    __int16 v83 = 2112;
                    v84 = v36;
                    __int16 v85 = 2048;
                    long long v86 = self;
                    _os_log_error_impl(&dword_1E1EA4000, v40, OS_LOG_TYPE_ERROR, "VCVideoStream [%s] %s:%d %@(%p) Failed to create transport", buf, 0x30u);
                  }
                }
              }
              +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", v35, 32016, 105, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCVideoStream.m", 2158), @"Failed to create transport", @"Create transport failed");
              if ((VCVideoStream *)objc_opt_class() == self)
              {
                if ((int)VRTraceGetErrorLogLevelForModule() < 2) {
                  goto LABEL_160;
                }
                VRTraceErrorLogLevelToCSTR();
                if (VRTraceIsOSFaultDisabled())
                {
                  BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
                  if (!v11) {
                    return v11;
                  }
                  -[VCVideoStream onConfigureStreamWithConfiguration:error:]();
                }
                else
                {
                  BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT);
                  if (!v11) {
                    return v11;
                  }
                  -[VCVideoStream onConfigureStreamWithConfiguration:error:]();
                }
                goto LABEL_160;
              }
              if (objc_opt_respondsToSelector()) {
                uint64_t v41 = (__CFString *)[(VCVideoStream *)self performSelector:sel_logPrefix];
              }
              else {
                uint64_t v41 = &stru_1F3D3E450;
              }
              if ((int)VRTraceGetErrorLogLevelForModule() < 2) {
                goto LABEL_160;
              }
              uint64_t v42 = VRTraceErrorLogLevelToCSTR();
              char v43 = VRTraceIsOSFaultDisabled();
              uint64_t v14 = *MEMORY[0x1E4F47A50];
              if (v43)
              {
                BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
                if (!v11) {
                  return v11;
                }
                if (*v35) {
                  __int16 v44 = (const char *)objc_msgSend((id)objc_msgSend(*v35, "description"), "UTF8String");
                }
                else {
                  __int16 v44 = "<nil>";
                }
                *(_DWORD *)buf = 136316418;
                uint64_t v78 = v42;
                __int16 v79 = 2080;
                v80 = "-[VCVideoStream onConfigureStreamWithConfiguration:error:]";
                __int16 v81 = 1024;
                int v82 = 2161;
                __int16 v83 = 2112;
                v84 = v41;
                __int16 v85 = 2048;
                long long v86 = self;
                __int16 v87 = 2080;
                long long v88 = v44;
                int v48 = "VCVideoStream [%s] %s:%d %@(%p) error[%s]";
                goto LABEL_154;
              }
              BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT);
              if (!v11) {
                return v11;
              }
              if (*v35) {
                unint64_t v51 = (const char *)objc_msgSend((id)objc_msgSend(*v35, "description"), "UTF8String");
              }
              else {
                unint64_t v51 = "<nil>";
              }
              *(_DWORD *)buf = 136316418;
              uint64_t v78 = v42;
              __int16 v79 = 2080;
              v80 = "-[VCVideoStream onConfigureStreamWithConfiguration:error:]";
              __int16 v81 = 1024;
              int v82 = 2161;
              __int16 v83 = 2112;
              v84 = v41;
              __int16 v85 = 2048;
              long long v86 = self;
              __int16 v87 = 2080;
              long long v88 = v51;
              int v56 = "VCVideoStream [%s] %s:%d %@(%p) error[%s]";
              goto LABEL_158;
            }
          }
          if (+[VCVideoStream shouldEnableRateControlForStreamType:*p_type]&& ![(VCVideoStream *)self enableRateControlFeebackInConfig:v29])
          {
            break;
          }
          if (!*p_type && p_transportSetupInfo->setupType == 5) {
            self->super._transportSetupInfo.var0.ipInfo.srcIPPORT.szIfName[12] = 1;
          }

          self->_statisticsCollector = (AVCStatisticsCollector *)[(VCVideoStream *)self getReceiveStatsCollectorWithStreamConfig:v29];
          BOOL v34 = [v29 type] == 3 || objc_msgSend(v29, "type") == 5;
          if ((objc_msgSend(v33, "configureWithStreamConfig:setupInfo:reducedSizeRTCPPackets:hopByHopEncryptRTCPPackets:statisticsCollector:basebandCongestionDetector:error:", v29, p_transportSetupInfo, v34, objc_msgSend(v29, "type") == 3, self->_statisticsCollector, objc_msgSend((id)objc_msgSend(v29, "rateControlConfig"), "basebandCongestionDetector"), v69) & 1) == 0)
          {
            if ((VCVideoStream *)objc_opt_class() == self)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() < 2) {
                goto LABEL_160;
              }
              VRTraceErrorLogLevelToCSTR();
              if (VRTraceIsOSFaultDisabled())
              {
                BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
                if (!v11) {
                  return v11;
                }
                -[VCVideoStream onConfigureStreamWithConfiguration:error:].cold.4();
              }
              else
              {
                BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT);
                if (!v11) {
                  return v11;
                }
                -[VCVideoStream onConfigureStreamWithConfiguration:error:].cold.5();
              }
              goto LABEL_160;
            }
            if (objc_opt_respondsToSelector()) {
              long long v37 = (__CFString *)[(VCVideoStream *)self performSelector:sel_logPrefix];
            }
            else {
              long long v37 = &stru_1F3D3E450;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() < 2) {
              goto LABEL_160;
            }
            uint64_t v45 = VRTraceErrorLogLevelToCSTR();
            char v46 = VRTraceIsOSFaultDisabled();
            __int16 v47 = *MEMORY[0x1E4F47A50];
            if (v46)
            {
              BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
              if (!v11) {
                return v11;
              }
              *(_DWORD *)buf = 136316162;
              uint64_t v78 = v45;
              __int16 v79 = 2080;
              v80 = "-[VCVideoStream onConfigureStreamWithConfiguration:error:]";
              __int16 v81 = 1024;
              int v82 = 2188;
              __int16 v83 = 2112;
              v84 = v37;
              __int16 v85 = 2048;
              long long v86 = self;
              int v48 = "VCVideoStream [%s] %s:%d %@(%p) Failed to configure transport";
              __int16 v49 = v47;
              uint32_t v50 = 48;
              goto LABEL_155;
            }
            BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT);
            if (!v11) {
              return v11;
            }
            *(_DWORD *)buf = 136316162;
            uint64_t v78 = v45;
            __int16 v79 = 2080;
            v80 = "-[VCVideoStream onConfigureStreamWithConfiguration:error:]";
            __int16 v81 = 1024;
            int v82 = 2188;
            __int16 v83 = 2112;
            v84 = v37;
            __int16 v85 = 2048;
            long long v86 = self;
            int v56 = "VCVideoStream [%s] %s:%d %@(%p) Failed to configure transport";
            __int16 v57 = v47;
            uint32_t v58 = 48;
            goto LABEL_159;
          }
          RTPSetTimestampRateScale([v33 rtpHandle], 0);
          if (v30 == ++v31) {
            goto LABEL_83;
          }
        }
        if ((VCVideoStream *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 2) {
            goto LABEL_160;
          }
          VRTraceErrorLogLevelToCSTR();
          if (VRTraceIsOSFaultDisabled())
          {
            BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
            if (!v11) {
              return v11;
            }
            -[VCVideoStream onConfigureStreamWithConfiguration:error:].cold.6();
          }
          else
          {
            BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT);
            if (!v11) {
              return v11;
            }
            -[VCVideoStream onConfigureStreamWithConfiguration:error:].cold.7();
          }
          goto LABEL_160;
        }
        if (objc_opt_respondsToSelector()) {
          long long v38 = (__CFString *)[(VCVideoStream *)self performSelector:sel_logPrefix];
        }
        else {
          long long v38 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 2) {
          goto LABEL_160;
        }
        uint64_t v52 = VRTraceErrorLogLevelToCSTR();
        char v53 = VRTraceIsOSFaultDisabled();
        int v54 = *MEMORY[0x1E4F47A50];
        if (v53)
        {
          BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (!v11) {
            return v11;
          }
          int64_t v55 = *p_type;
          *(_DWORD *)buf = 136316418;
          uint64_t v78 = v52;
          __int16 v79 = 2080;
          v80 = "-[VCVideoStream onConfigureStreamWithConfiguration:error:]";
          __int16 v81 = 1024;
          int v82 = 2168;
          __int16 v83 = 2112;
          v84 = v38;
          __int16 v85 = 2048;
          long long v86 = self;
          __int16 v87 = 1024;
          LODWORD(v88) = v55;
          int v48 = "VCVideoStream [%s] %s:%d %@(%p) Failed to update stream config for VCVideoStreamType=%d";
          __int16 v49 = v54;
          uint32_t v50 = 54;
          goto LABEL_155;
        }
        BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT);
        if (!v11) {
          return v11;
        }
        int64_t v59 = *p_type;
        *(_DWORD *)buf = 136316418;
        uint64_t v78 = v52;
        __int16 v79 = 2080;
        v80 = "-[VCVideoStream onConfigureStreamWithConfiguration:error:]";
        __int16 v81 = 1024;
        int v82 = 2168;
        __int16 v83 = 2112;
        v84 = v38;
        __int16 v85 = 2048;
        long long v86 = self;
        __int16 v87 = 1024;
        LODWORD(v88) = v59;
        int v56 = "VCVideoStream [%s] %s:%d %@(%p) Failed to update stream config for VCVideoStreamType=%d";
        __int16 v57 = v54;
        uint32_t v58 = 54;
        goto LABEL_159;
      }
LABEL_83:
      ++v28;
      if (v64 + 1 == v62)
      {
        uint64_t v62 = [obj countByEnumeratingWithState:&v73 objects:v72 count:16];
        if (v62) {
          goto LABEL_58;
        }
        goto LABEL_85;
      }
    }
  }
  else
  {
LABEL_85:
    [(VCMediaStream *)self registerMediaControlInfoGeneratorWithConfigs:obj];
    [(VCVideoStream *)self overrideConfigWithDefaults:[(VCMediaStream *)self defaultStreamConfig]];
    if (self->_baseQualityIndex && self->super._operatingMode == 6) {
      -[VCMediaStream updateTransportsWithConstantConnectionOverhead:](self, "updateTransportsWithConstantConnectionOverhead:");
    }
    -[VCImageQueue setImageQueueProtected:](self->_remoteQueue, "setImageQueueProtected:", [v7 isVideoProtected]);
    [(VCImageQueue *)self->_remoteQueue setFrameRate:v61];
    if ((unint64_t)*p_type <= 6 && ((1 << *p_type) & 0x66) != 0) {
      [(VCImageQueue *)self->_remoteQueue setLowLatencyEnabled:1];
    }
    [(VCImageQueue *)self->_remoteQueue setLowLatencyEnabled:VCDefaults_GetBoolValueForKey(@"forceVideoStreamLowLatency", [(VCImageQueue *)self->_remoteQueue isLowLatencyEnabled])];
    LOBYTE(v11) = 1;
  }
  return v11;
}

- (int)operatingModeForVideoStreamType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5) {
    return 5;
  }
  else {
    return dword_1E25A2A38[a3 - 1];
  }
}

- (void)deregisterForVideoCapture
{
  if (self->_captureSource == 6)
  {
    objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "unregisterVideoSink:withCaptureSource:", self, self->_streamInputCaptureSource);
  }
  else
  {
    int64_t captureSourceID = self->_captureSourceID;
    id v4 = +[VCVideoCaptureServer VCVideoCaptureServerSingleton];
    if (captureSourceID) {
      [v4 deregisterCaptureClientForScreenShare:self];
    }
    else {
      [v4 deregisterForVideoFramesFromSource:self->_captureSource withClient:self];
    }
  }
  [(VCMomentsCollectorDelegate *)[(VCMediaStream *)self momentsCollectorDelegate] cleanUpActiveRequests];
  atomic_store(0, (unsigned __int8 *)&self->_isVideoCaptureRegistered);
}

- (void)reportFailedToRegisterVideoFramesFromSource:(int)a3 width:(int)a4 height:(int)a5 frameRate:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  uint64_t v9 = *(void *)&a3;
  v11[4] = *MEMORY[0x1E4F143B8];
  [(VCObject *)self reportingAgent];
  v10[0] = @"SymptomReporterOptionalKeyCaptureSource";
  v11[0] = [NSNumber numberWithUnsignedInt:v9];
  v10[1] = @"SymptomReporterOptionalKeyCaptureWidth";
  v11[1] = [NSNumber numberWithInt:v8];
  v10[2] = @"SymptomReporterOptionalKeyCaptureHeight";
  v11[2] = [NSNumber numberWithInt:v7];
  v10[3] = @"SymptomReporterOptionalKeyCaptureFrameRate";
  v11[3] = [NSNumber numberWithInt:v6];
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:4];
  reportingSymptom();
}

- (BOOL)registerForCameraCaptureWithConfig:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  +[VideoUtil sizeForVideoResolution:](VideoUtil, "sizeForVideoResolution:", [a3 videoResolution]);
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  +[VideoUtil getBestCaptureSizeForEncodingSize:](VideoUtil, "getBestCaptureSizeForEncodingSize:");
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  if ((VCVideoStream *)objc_opt_class() != self)
  {
    if (objc_opt_respondsToSelector()) {
      __int16 v13 = (__CFString *)[(VCVideoStream *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v13 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_12;
    }
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    int v20 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    int v25 = 136317186;
    uint64_t v26 = v19;
    __int16 v27 = 2080;
    uint64_t v28 = "-[VCVideoStream registerForCameraCaptureWithConfig:]";
    __int16 v29 = 1024;
    int v30 = 2268;
    __int16 v31 = 2112;
    *(void *)__int16 v32 = v13;
    *(_WORD *)&v32[8] = 2048;
    id v33 = self;
    *(_WORD *)BOOL v34 = 1024;
    *(_DWORD *)&v34[2] = v10;
    __int16 v35 = 1024;
    int v36 = v12;
    __int16 v37 = 1024;
    int v38 = v6;
    __int16 v39 = 1024;
    int v40 = v8;
    int64_t v16 = "VCVideoStream [%s] %s:%d %@(%p) capture=%dx%d, encode=%dx%d";
    id v17 = v20;
    uint32_t v18 = 72;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    int v15 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 136316674;
      uint64_t v26 = v14;
      __int16 v27 = 2080;
      uint64_t v28 = "-[VCVideoStream registerForCameraCaptureWithConfig:]";
      __int16 v29 = 1024;
      int v30 = 2268;
      __int16 v31 = 1024;
      *(_DWORD *)__int16 v32 = v10;
      *(_WORD *)&v32[4] = 1024;
      *(_DWORD *)&v32[6] = v12;
      LOWORD(v33) = 1024;
      *(_DWORD *)((char *)&v33 + 2) = v6;
      HIWORD(v33) = 1024;
      *(_DWORD *)BOOL v34 = v8;
      int64_t v16 = "VCVideoStream [%s] %s:%d capture=%dx%d, encode=%dx%d";
      id v17 = v15;
      uint32_t v18 = 52;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v25, v18);
    }
  }
LABEL_12:

  __int16 v21 = [VCVideoRule alloc];
  *(float *)&double v22 = (float)(unint64_t)[a3 framerate];
  self->_videoRule = [(VCVideoRule *)v21 initWithFrameWidth:v6 frameHeight:v8 frameRate:v22];
  char v23 = objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "registerForVideoFramesFromSource:withClient:width:height:frameRate:", self->_captureSource, self, v10, v12, objc_msgSend(a3, "framerate"));
  if ((v23 & 1) == 0) {
    -[VCVideoStream reportFailedToRegisterVideoFramesFromSource:width:height:frameRate:](self, "reportFailedToRegisterVideoFramesFromSource:width:height:frameRate:", self->_captureSource, v10, v12, [a3 framerate]);
  }
  return v23;
}

- (BOOL)registerForVideoCapture
{
  double v3 = [(VCMediaStream *)self defaultStreamConfig];
  unint64_t type = self->_type;
  BOOL result = 1;
  if (type <= 6)
  {
    if (((1 << type) & 0x66) != 0)
    {
      if (self->_captureSourceID)
      {
        objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "registerCaptureClientForScreenShare:", self);
      }
      else
      {
        id v6 = [(VCVideoStream *)self newScreenCaptureConfigForVideoConfig:v3];
        char v7 = objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "registerForVideoFramesFromSource:sourceConfig:", self->_captureSource, v6);

        if ((v7 & 1) == 0)
        {
          [(VCVideoStream *)self reportFailedToRegisterVideoFramesFromSource:self->_captureSource width:self->_customWidth height:self->_customHeight frameRate:[(VCMediaStreamConfig *)v3 framerate]];
          BOOL result = 0;
          goto LABEL_13;
        }
      }
LABEL_12:
      BOOL result = 1;
      goto LABEL_13;
    }
    if (type)
    {
      if (type != 4) {
        goto LABEL_13;
      }
      int captureSource = self->_captureSource;
      if (captureSource == 6)
      {
        objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "registerVideoSink:withCaptureSource:", self, self->_streamInputCaptureSource);
        goto LABEL_12;
      }
      if (captureSource != 3) {
        goto LABEL_13;
      }
    }
    BOOL result = [(VCVideoStream *)self registerForCameraCaptureWithConfig:v3];
  }
LABEL_13:
  atomic_store(result, (unsigned __int8 *)&self->_isVideoCaptureRegistered);
  return result;
}

- (void)collectImageQueuePerformanceMetrics:(__CFDictionary *)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef theDict = 0;
  [(VCImageQueue *)self->_remoteQueue createAndCopyPerformanceDictionary:&theDict];
  int v20 = 0;
  int Int32IfPresent = FigCFDictionaryGetInt32IfPresent();
  id v6 = (CFAllocatorRef *)MEMORY[0x1E4F1CF80];
  if (Int32IfPresent)
  {
    int v7 = v20 - self->_lastDisplayedFromImageQueueCount;
    int valuePtr = v7;
    CFNumberRef v8 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, @"VIQDCnt", v8);
    CFRelease(v8);
    self->_lastDisplayedFromImageQueueCount = v20;
  }
  else
  {
    int v7 = 0;
  }
  int v19 = 0;
  if (FigCFDictionaryGetInt32IfPresent())
  {
    int v9 = v19 - self->_lastDroppedFromImageQueueCount;
    int valuePtr = v9;
    CFNumberRef v10 = CFNumberCreate(*v6, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, @"VIQLCnt", v10);
    CFRelease(v10);
    self->_lastDroppedFromImageQueueCount = v19;
  }
  else
  {
    int v9 = 0;
  }
  CFTypeRef cf = 0;
  [(VCImageQueue *)self->_remoteQueue createAndCopyLatencyStatsDictionary:&cf];
  if (cf)
  {
    if (FigCFDictionaryGetDoubleIfPresent())
    {
      int valuePtr = (int)(0.0 * 1000.0);
      CFNumberRef v11 = CFNumberCreate(*v6, kCFNumberIntType, &valuePtr);
      CFDictionaryAddValue(a3, @"VIQMinHEL", v11);
      CFRelease(v11);
    }
    if (FigCFDictionaryGetDoubleIfPresent())
    {
      int valuePtr = (int)(0.0 * 1000.0);
      CFNumberRef v12 = CFNumberCreate(*v6, kCFNumberIntType, &valuePtr);
      CFDictionaryAddValue(a3, @"VIQMaxHEL", v12);
      CFRelease(v12);
    }
    if (FigCFDictionaryGetDoubleIfPresent())
    {
      int valuePtr = (int)(0.0 * 1000.0);
      CFNumberRef v13 = CFNumberCreate(*v6, kCFNumberIntType, &valuePtr);
      CFDictionaryAddValue(a3, @"VIQAHEL", v13);
      CFRelease(v13);
    }
    FigCFDictionaryGetIntIfPresent();
    if (cf) {
      CFRelease(cf);
    }
  }
  Value = CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x1E4F34BD8]);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    int64_t v16 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      remoteQueue = self->_remoteQueue;
      int valuePtr = 136317698;
      uint64_t v23 = v15;
      __int16 v24 = 2080;
      int v25 = "-[VCVideoStream collectImageQueuePerformanceMetrics:]";
      __int16 v26 = 1024;
      int v27 = 2382;
      __int16 v28 = 2048;
      __int16 v29 = remoteQueue;
      __int16 v30 = 1024;
      int v31 = v7;
      __int16 v32 = 1024;
      int v33 = v9;
      __int16 v34 = 2048;
      uint64_t v35 = 0;
      __int16 v36 = 2048;
      uint64_t v37 = 0;
      __int16 v38 = 2048;
      uint64_t v39 = 0;
      __int16 v40 = 1024;
      int v41 = 0;
      __int16 v42 = 2112;
      char v43 = Value;
      _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d VCImageQueue[%p] Displayed=%d, Dropped=%d, MinPresentationLatency=%f, MaxPresentationLatency=%f, AvgPresentationLatency=%f, LatencySampleCount=%d, DisplayedCountHistogram:%@", (uint8_t *)&valuePtr, 0x60u);
    }
  }
  if (theDict) {
    CFRelease(theDict);
  }
}

- (void)setupReportingAgent
{
  if (![(VCObject *)self reportingAgent])
  {
    self->super._isReportingAgentOwner = 1;
    uint64_t ReportingClientType = _VCVideoStream_GetReportingClientType(self);
    id v4 = [(VCVideoStream *)self getReportingServiceName];
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    [(VCMediaStream *)self applyClientSessionID:ReportingClientType clientUserInfo:v5];
    HIBYTE(v18) = -86;
    *(_WORD *)((char *)&v18 + 5) = -21846;
    memset(v30, 170, 3);
    *(_DWORD *)((char *)&v29 + 1) = -1431655766;
    HIDWORD(v29) = -1431655766;
    *(_OWORD *)&v30[3] = 0uLL;
    LODWORD(v15) = self->super._streamToken;
    HIDWORD(v15) = -1431655766;
    clientSessionID = self->super._clientSessionID;
    uint64_t v17 = 0;
    LODWORD(v18) = ReportingClientType;
    BYTE4(v18) = 0;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    __int16 v21 = [(VCVideoStream *)self getReportingClientName];
    double v22 = v4;
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    uint64_t v25 = v5;
    v28[0] = 0;
    *(_OWORD *)&v28[1] = *(_OWORD *)v30;
    *(void *)&v28[16] = (unsigned __int128)0 >> 96;
    LOBYTE(v29) = 0;
    Agent = (const void *)reportingCreateAgent();
    [(VCObject *)self setReportingAgent:Agent];
    if (Agent) {
      CFRelease(Agent);
    }
    [(VCObject *)self reportingAgent];
    self->_int reportingModuleID = VCReporting_GetDynamicReportingModuleID();
    uint64_t v7 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
    [(VCObject *)self reportingAgent];
    [(VCVideoStream *)self getReportingClientName];
    [(VCVideoStream *)self getClientSpecificUserInfo];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    CFNumberRef v12 = __36__VCVideoStream_setupReportingAgent__block_invoke;
    CFNumberRef v13 = &unk_1E6DB5888;
    uint64_t v14 = v7;
    reportingSetUserInfo();
  }
  if (+[VCVideoStream shouldRegisterReportingForStreamType:](VCVideoStream, "shouldRegisterReportingForStreamType:", self->_type, v10, v11, v12, v13, v14, v15, clientSessionID, v17, v18, v19, v20, v21, v22, v23, v24, v25,
         v26,
         v27,
         *(void *)v28,
         *(void *)&v28[8],
         *(void *)&v28[16],
         v29))
  {
    [(VCObject *)self reportingAgent];
    reportingRegisterPeriodicTaskWeak();
  }
  int operatingMode = self->super._operatingMode;
  if (operatingMode != 1 && operatingMode != 6) {
    [(VCMediaStream *)self registerAggregationHandlers];
  }
}

void __36__VCVideoStream_setupReportingAgent__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (![a2 count])
  {
    [*(id *)(a1 + 32) strong];
    uint64_t v3 = objc_opt_class();
    if (v3 == [*(id *)(a1 + 32) strong])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __36__VCVideoStream_setupReportingAgent__block_invoke_cold_1();
        }
      }
    }
    else
    {
      [*(id *)(a1 + 32) strong];
      if (objc_opt_respondsToSelector()) {
        id v4 = (__CFString *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "performSelector:", sel_logPrefix);
      }
      else {
        id v4 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v5 = VRTraceErrorLogLevelToCSTR();
        id v6 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v7 = [*(id *)(a1 + 32) strong];
          int v8 = 136316162;
          uint64_t v9 = v5;
          __int16 v10 = 2080;
          uint64_t v11 = "-[VCVideoStream setupReportingAgent]_block_invoke";
          __int16 v12 = 1024;
          int v13 = 2411;
          __int16 v14 = 2112;
          uint64_t v15 = v4;
          __int16 v16 = 2048;
          uint64_t v17 = v7;
          _os_log_error_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_ERROR, "VCVideoStream [%s] %s:%d %@(%p) RTCReporting: can't configure the reporting agent.", (uint8_t *)&v8, 0x30u);
        }
      }
    }
  }
}

uint64_t __36__VCVideoStream_setupReportingAgent__block_invoke_238(uint64_t a1, void *a2, uint64_t a3)
{
  VCMediaStream_Lock((uint64_t)a2);
  if ([a2 state] == 2) {
    [a2 gatherRealtimeStats:a3];
  }

  return VCMediaStream_Unlock((uint64_t)a2);
}

- (void)gatherRealtimeStats:(__CFDictionary *)a3
{
  if (a3)
  {
    [(VCObject *)self reportingAgent];
    uint64_t v5 = selectDestinationForRTMetrics();
    [(VCVideoStream *)self collectImageQueuePerformanceMetrics:v5];
    [(VCMediaStream *)self collectChannelSequenceMetrics:v5];
    CFDictionaryRef v6 = (const __CFDictionary *)objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "copyReportingStatsForCaptureSource:", self->_streamInputCaptureSource);
    if (v6)
    {
      CFDictionaryRef v7 = v6;
      VCUtil_AppendFromDictionary(a3, v6);
      CFRelease(v7);
    }
  }
}

- (unsigned)networkMTU
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->super._transportSetupInfo.setupType == 5)
  {
    transportSession = self->super._transportSession;
    return [(VCTransportSession *)transportSession networkMTU];
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315906;
        uint64_t v7 = v4;
        __int16 v8 = 2080;
        uint64_t v9 = "-[VCVideoStream networkMTU]";
        __int16 v10 = 1024;
        int v11 = 2456;
        __int16 v12 = 1024;
        int v13 = 1280;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d Cannot determine MTU. Returning minMTU=%d as a fallback", (uint8_t *)&v6, 0x22u);
      }
    }
    return 1280;
  }
}

- (BOOL)isTransportIPv6
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->super._transportSetupInfo.setupType == 5)
  {
    transportSession = self->super._transportSession;
    return [(VCTransportSession *)transportSession isIPv6];
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315650;
        uint64_t v7 = v4;
        __int16 v8 = 2080;
        uint64_t v9 = "-[VCVideoStream isTransportIPv6]";
        __int16 v10 = 1024;
        int v11 = 2464;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d Cannot determine isIPv6. Returning YES as a fallback", (uint8_t *)&v6, 0x1Cu);
      }
    }
    return 1;
  }
}

- (void)setupInternalRedundancyControllerWithStreamConfig:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  redundancyController = self->_redundancyController;
  if (redundancyController) {
    goto LABEL_7;
  }
  int v6 = -[VCRedundancyControllerVideo initWithDelegate:mode:parameters:]([VCRedundancyControllerVideo alloc], "initWithDelegate:mode:parameters:", self, [a3 redundancyControllerMode], 0, objc_msgSend(a3, "maxRedundancyPercentage") | (unint64_t)(objc_msgSend(a3, "redundancyControllerFECVersion") << 40) | 0xAAAA000100000000);
  self->_redundancyController = v6;
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v6)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        __int16 v10 = self->_redundancyController;
        int v11 = 136315906;
        uint64_t v12 = v8;
        __int16 v13 = 2080;
        uint64_t v14 = "-[VCVideoStream setupInternalRedundancyControllerWithStreamConfig:]";
        __int16 v15 = 1024;
        int v16 = 2483;
        __int16 v17 = 2112;
        uint64_t v18 = v10;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d Set up and using internal redundancy controller=%@", (uint8_t *)&v11, 0x26u);
      }
    }
  }
  else if (ErrorLogLevelForModule >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCVideoStream setupInternalRedundancyControllerWithStreamConfig:]();
    }
  }
  redundancyController = self->_redundancyController;
  if (redundancyController) {
LABEL_7:
  }
    objc_msgSend((id)objc_msgSend(a3, "rateControlConfig"), "setStatisticsCollector:", -[VCRedundancyControllerVideo statisticsCollector](redundancyController, "statisticsCollector"));
}

- (void)onStartWithCompletionHandler:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  self->_lastDecodedVideoFrameTime = 0.0;
  _VCVideoStream_CacheRemoteVideoFrame((uint64_t)self, 0);
  [(VCVideoStream *)self destroyVideoModules];
  if (self->super._operatingMode == 6)
  {
    if ((self->_reportingModuleID + 1) <= 1)
    {
      [(VCObject *)self reportingAgent];
      self->_int reportingModuleID = VCReporting_GetDynamicReportingModuleID();
      [(VCObject *)self reportingAgent];
      [(VCVideoStream *)self getReportingServiceName];
      [(VCVideoStream *)self getClientSpecificUserInfo];
      reportingCacheModuleSpecificInfo();
    }
  }
  else
  {
    [(VCVideoStream *)self setupReportingAgent];
  }
  self->_reportingDefaultRealtimePeriod = reportingDefaultRealtimePeriod();
  uint64_t v5 = [(VCMediaStream *)self defaultStreamConfig];
  if ([(VCVideoStream *)self isLowLatencyStreamType]) {
    [(VCMediaStreamConfig *)v5 setRecommendedMTU:[(VCVideoStream *)self networkMTU]];
  }
  unint64_t v6 = [(VCMediaStreamConfig *)v5 recommendedMTU];
  if (v6 >= 0x5AA) {
    uint64_t v7 = 1450;
  }
  else {
    uint64_t v7 = v6;
  }
  [(VCMediaStreamConfig *)v5 setRecommendedMTU:v7];
  [(VCVideoStream *)self startRateAdaptationWithStreamConfig:v5];
  if (![(VCMediaStream *)self isSendingMedia]) {
    goto LABEL_14;
  }
  [(VCVideoStream *)self initVideoTransmitter];
  if (![(VCMediaStreamConfig *)v5 resetSendRTPTimestampOnStop])
  {
    long long v18 = *(_OWORD *)(&self->_isTemporalScalingEnabled + 2);
    uint64_t v19 = *(void *)&self->_lastSentFrameHostTimeBeforeStop.flags;
    [(VCVideoTransmitterBase *)self->_videoTransmitter setLastFrameTime:&v18];
    [(VCVideoTransmitterBase *)self->_videoTransmitter setLastRTPTimestamp:HIDWORD(self->_lastSentFrameHostTimeBeforeStop.epoch)];
  }
  [(VCVideoTransmitterBase *)self->_videoTransmitter startVideo];
  if (![(VCVideoStream *)self registerForVideoCapture])
  {
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", &v20, 32016, 109, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCVideoStream.m", 2537), @"Screen capture failed", @"Screen capture is busy or not permitted");
    uint64_t v8 = 0;
  }
  else
  {
LABEL_14:
    uint64_t v8 = 1;
  }
  if (self->_type) {
    uint64_t v9 = [(VCVideoTransmitterBase *)self->_videoTransmitter videoTransmitterHandle];
  }
  else {
    uint64_t v9 = 0xFFFFFFFFLL;
  }
  [(VCVideoStream *)self setupVideoReceiver:v5 withTransmitterHandle:v9];
  [(VCVideoStream *)self updateVideoReceiver:v5];
  if ([(VCMediaStreamConfig *)v5 syncSource])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      int v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [(VCMediaStreamConfig *)v5 syncSource];
        *(_DWORD *)buf = 136316162;
        uint64_t v22 = v10;
        __int16 v23 = 2080;
        uint64_t v24 = "-[VCVideoStream onStartWithCompletionHandler:]";
        __int16 v25 = 1024;
        int v26 = 2552;
        __int16 v27 = 2048;
        __int16 v28 = self;
        __int16 v29 = 2048;
        uint64_t v30 = v12;
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d VCVideoStream[%p]: Starting synchronization using syncSource=%p", buf, 0x30u);
      }
    }
    [(VCVideoStream *)self startSynchronization:[(VCMediaStreamConfig *)v5 syncSource]];
  }
  [(VCVideoReceiverBase *)self->_videoReceiver startVideo];
  if ([(VCVideoStream *)self isScreenConfig:v5]) {
    [(VCImageQueue *)self->_remoteQueue stop];
  }
  [(VCImageQueue *)self->_remoteQueue start];
  if (self->super._operatingMode != 6)
  {
    [(VCObject *)self reportingAgent];
    reportingStartTimer();
  }
  _VCVideoStream_ReportingVideoStreamEventWithVideoAttributesAndStreamID((uint64_t)self, 201, 0, 0);
  __int16 v13 = [(VCMediaStream *)self defaultStreamConfig];
  if ([(VCMediaStreamConfig *)v13 type] == 5
    && (([(VCMediaStreamConfig *)v13 fecEnabled] & 1) != 0
     || [(VCMediaStreamConfig *)v13 rtxEnabled]))
  {
    CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 2, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    if ([(VCMediaStreamConfig *)v13 fecEnabled])
    {
      *(_DWORD *)buf = [(VCMediaStreamConfig *)v13 fecEnabled];
      CFNumberRef v16 = CFNumberCreate(v14, kCFNumberIntType, buf);
      CFDictionaryAddValue(Mutable, @"FecRDKScreenSharing", v16);
      CFRelease(v16);
    }
    if ([(VCMediaStreamConfig *)v13 rtxEnabled])
    {
      *(_DWORD *)buf = [(VCMediaStreamConfig *)v13 rtxEnabled];
      CFNumberRef v17 = CFNumberCreate(v14, kCFNumberIntType, buf);
      CFDictionaryAddValue(Mutable, @"RtxRDKScreenSharing", v17);
      CFRelease(v17);
    }
    reportingFeatureConfigEvent();
    CFRelease(Mutable);
  }
  (*((void (**)(id, uint64_t, uint64_t))a3 + 2))(a3, v8, v20);
}

- (void)onStopWithCompletionHandler:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(VCMediaStream *)self defaultStreamConfig];
  if ([(VCMediaStreamConfig *)v5 syncSource])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)int v11 = 136316162;
        *(void *)&v11[4] = v6;
        *(_WORD *)&v11[12] = 2080;
        *(void *)&v11[14] = "-[VCVideoStream onStopWithCompletionHandler:]";
        *(_WORD *)&v11[22] = 1024;
        int v12 = 2579;
        __int16 v13 = 2048;
        CFAllocatorRef v14 = self;
        __int16 v15 = 2048;
        uint64_t v16 = [(VCMediaStreamConfig *)v5 syncSource];
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d VCVideoStream[%p]: Stopping synchronization using syncSource=%p", v11, 0x30u);
      }
    }
    [(VCVideoStream *)self stopSynchronization];
  }
  if ([(VCMediaStream *)self shouldStopReportingTimer])
  {
    [(VCObject *)self reportingAgent];
    reportingStopTimer();
  }
  if (+[VCVideoStream shouldRegisterReportingForStreamType:self->_type])
  {
    [(VCObject *)self reportingAgent];
    reportingUnregisterPeriodicTask();
  }
  int operatingMode = self->super._operatingMode;
  if (operatingMode != 1 && operatingMode != 6) {
    [(VCMediaStream *)self deregisterAggregationHandlers];
  }
  _VCVideoStream_ReportingAlgosVideoStreamEvent(self);
  _VCVideoStream_ReportingVideoStreamEventWithVideoAttributesAndStreamID((uint64_t)self, 202, 0, 0);
  if (([(VCMediaStreamConfig *)v5 resetSendRTPTimestampOnStop] & 1) == 0)
  {
    videoTransmitter = self->_videoTransmitter;
    if (videoTransmitter) {
      [(VCVideoTransmitterBase *)videoTransmitter lastFrameTime];
    }
    else {
      memset(v11, 0, sizeof(v11));
    }
    *(_OWORD *)(&self->_isTemporalScalingEnabled + 2) = *(_OWORD *)v11;
    *(void *)&self->_lastSentFrameHostTimeBeforeStop.flags = *(void *)&v11[16];
    HIDWORD(self->_lastSentFrameHostTimeBeforeStop.epoch) = [(VCVideoTransmitterBase *)self->_videoTransmitter lastRTPTimestamp];
  }
  VCMediaStream_Unlock((uint64_t)self);
  [(VCVideoStream *)self destroyVideoModules];
  _VCVideoStream_CacheRemoteVideoFrame((uint64_t)self, 0);
  [(VCVideoStream *)self resetRemoteMediaStalled];
  VCMediaStream_Lock((uint64_t)self);
  if ([(VCMediaStream *)self isSendingMedia]
    && (self->_type != 3
     || [(VCVideoStream *)self isScreenConfig:[(VCMediaStream *)self defaultStreamConfig]]))
  {
    [(VCVideoStream *)self deregisterForVideoCapture];
  }
  [(VCImageQueue *)self->_remoteQueue pause];
  [(VCVideoStream *)self stopRateAdaptation];
  (*((void (**)(id, uint64_t, void))a3 + 2))(a3, 1, 0);
}

- (void)onPauseWithCompletionHandler:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_type == 2)
  {
    objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "setPauseCapture:", 1);
  }
  else
  {
    uint64_t v5 = [(VCMediaStream *)self defaultStreamConfig];
    if ([(VCMediaStreamConfig *)v5 syncSource])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        uint64_t v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v8 = 136316162;
          uint64_t v9 = v6;
          __int16 v10 = 2080;
          int v11 = "-[VCVideoStream onPauseWithCompletionHandler:]";
          __int16 v12 = 1024;
          int v13 = 2637;
          __int16 v14 = 2048;
          __int16 v15 = self;
          __int16 v16 = 2048;
          uint64_t v17 = [(VCMediaStreamConfig *)v5 syncSource];
          _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d VCVideoStream[%p]: Stopping synchronization using syncSource=%p", (uint8_t *)&v8, 0x30u);
        }
      }
      [(VCVideoStream *)self stopSynchronization];
    }
    [(VCVideoTransmitterBase *)self->_videoTransmitter stopVideo];
    [(VCImageQueue *)self->_remoteQueue pause];
    if ([(VCImageQueue *)self->_remoteQueue usingRemoteQueue]) {
      objc_msgSend((id)VCRemoteVideoManager_DefaultManager(), "remoteVideoDidPause:streamToken:", 1, -[VCImageQueue streamToken](self->_remoteQueue, "streamToken"));
    }
  }
  _VCVideoStream_ReportingVideoStreamEventWithVideoAttributesAndStreamID((uint64_t)self, 3, 0, 0);
  _VCVideoStream_ReportingVideoStreamEventWithVideoAttributesAndStreamID((uint64_t)self, 203, 0, 0);
  (*((void (**)(id, uint64_t, void))a3 + 2))(a3, 1, 0);
}

- (void)onResumeWithCompletionHandler:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  self->_lastDecodedVideoFrameTime = 0.0;
  if (self->_type == 2)
  {
    objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "setPauseCapture:", 0);
  }
  else
  {
    uint64_t v5 = [(VCMediaStream *)self defaultStreamConfig];
    if ([(VCMediaStreamConfig *)v5 syncSource])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        uint64_t v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v8 = 136316162;
          uint64_t v9 = v6;
          __int16 v10 = 2080;
          int v11 = "-[VCVideoStream onResumeWithCompletionHandler:]";
          __int16 v12 = 1024;
          int v13 = 2666;
          __int16 v14 = 2048;
          __int16 v15 = self;
          __int16 v16 = 2048;
          uint64_t v17 = [(VCMediaStreamConfig *)v5 syncSource];
          _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d VCVideoStream[%p]: Starting synchronization using syncSource=%p", (uint8_t *)&v8, 0x30u);
        }
      }
      [(VCVideoStream *)self startSynchronization:[(VCMediaStreamConfig *)v5 syncSource]];
    }
    [(VCVideoTransmitterBase *)self->_videoTransmitter startVideo];
    [(VCImageQueue *)self->_remoteQueue start];
    if ([(VCImageQueue *)self->_remoteQueue usingRemoteQueue]) {
      objc_msgSend((id)VCRemoteVideoManager_DefaultManager(), "remoteVideoDidPause:streamToken:", 0, -[VCImageQueue streamToken](self->_remoteQueue, "streamToken"));
    }
    _VCVideoStream_ReportingAlgosVideoStreamEvent(self);
    _VCVideoStream_ReportingVideoStreamEventWithVideoAttributesAndStreamID((uint64_t)self, 204, 0, 0);
  }
  (*((void (**)(id, uint64_t, void))a3 + 2))(a3, 1, 0);
}

- (void)onRTPTimeout
{
}

- (void)onRTCPTimeout
{
}

- (void)onSendRTCPPacket
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(VCMediaStream *)self defaultTransport];
  uint64_t v4 = [(VCMediaStreamTransport *)v3 streamDirection];
  if ((v4 & 0xFFFFFFFFFFFFFFFDLL) == 1 && [(VCMediaStreamTransport *)v3 isRTCPEnabled])
  {
    uint64_t v6 = 0;
    memset(v5, 0, sizeof(v5));
    [(VCMediaStream *)self sendControlPacketWithParameters:v5];
  }
  if ((v4 & 0xFFFFFFFFFFFFFFFELL) == 2) {
    [(VCVideoReceiverBase *)self->_videoReceiver rtcpSendIntervalElapsed];
  }
}

- (double)rtcpHeartbeatLeeway
{
  return 0.001;
}

- (unsigned)getMaxTemporalBitrateForStreamIDs:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  transportArray = self->super._transportArray;
  uint64_t v6 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v35 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unsigned int v8 = 0;
    uint64_t v9 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(transportArray);
        }
        int v11 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        int v12 = [v11 idsStreamId];
        if (objc_msgSend((id)objc_msgSend(a3, "firstObject"), "unsignedIntegerValue") == v12) {
          unsigned int v8 = objc_msgSend((id)objc_msgSend(v11, "streamConfig"), "txMaxBitrate");
        }
      }
      uint64_t v7 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v35 objects:v34 count:16];
    }
    while (v7);
  }
  else
  {
    unsigned int v8 = 0;
  }
  if ((VCVideoStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      __int16 v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 136315906;
        uint64_t v23 = v14;
        __int16 v24 = 2080;
        __int16 v25 = "-[VCVideoStream getMaxTemporalBitrateForStreamIDs:]";
        __int16 v26 = 1024;
        int v27 = 2724;
        __int16 v28 = 1024;
        LODWORD(v29) = v8;
        __int16 v16 = "VCVideoStream [%s] %s:%d Max temporal bitrate=%d";
        uint64_t v17 = v15;
        uint32_t v18 = 34;
LABEL_22:
        _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v22, v18);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      int v13 = (__CFString *)[(VCVideoStream *)self performSelector:sel_logPrefix];
    }
    else {
      int v13 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      uint64_t v20 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 136316418;
        uint64_t v23 = v19;
        __int16 v24 = 2080;
        __int16 v25 = "-[VCVideoStream getMaxTemporalBitrateForStreamIDs:]";
        __int16 v26 = 1024;
        int v27 = 2724;
        __int16 v28 = 2112;
        __int16 v29 = v13;
        __int16 v30 = 2048;
        uint64_t v31 = self;
        __int16 v32 = 1024;
        unsigned int v33 = v8;
        __int16 v16 = "VCVideoStream [%s] %s:%d %@(%p) Max temporal bitrate=%d";
        uint64_t v17 = v20;
        uint32_t v18 = 54;
        goto LABEL_22;
      }
    }
  }
  return v8;
}

- (void)setTransmitterStreamIDs:(id)a3 repairStreamIDs:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v8 = [a3 count];
  unint64_t v9 = (2 * v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  __int16 v10 = (char *)&v34 - v9;
  if (v8) {
    memset((char *)&v34 - v9, 170, 2 * v8);
  }
  long long v38 = v10;
  __int16 v40 = self;
  int v41 = [(VCMediaStream *)self defaultStreamConfig];
  if ([(VCMediaStreamConfig *)v41 temporalScalingEnabled])
  {
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    transportArray = v40->super._transportArray;
    uint64_t v12 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v54 objects:v53 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v55 != v14) {
            objc_enumerationMutation(transportArray);
          }
          objc_msgSend(v7, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(*(id *)(*((void *)&v54 + 1) + 8 * i), "idsStreamId")));
        }
        uint64_t v13 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v54 objects:v53 count:16];
      }
      while (v13);
    }
  }
  if ((int)[a3 count] >= 1)
  {
    uint64_t v17 = 0;
    char v18 = 0;
    unsigned __int8 v19 = 0;
    uint64_t v39 = sel_logPrefix;
    *(void *)&long long v16 = 136316162;
    long long v34 = v16;
    *(void *)&long long v16 = 136316674;
    long long v35 = v16;
    uint64_t v20 = v40;
    __int16 v21 = v38;
    while (1)
    {
      unsigned __int16 v22 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v17, (void)v34, *((void *)&v34 + 1)), "unsignedIntegerValue");
      if (![(VCMediaStreamConfig *)v41 temporalScalingEnabled]
        || !objc_msgSend(v7, "containsObject:", objc_msgSend(a3, "objectAtIndexedSubscript:", v17)))
      {
        goto LABEL_28;
      }
      if ((v18 & 1) == 0) {
        break;
      }
      char v18 = 1;
LABEL_29:
      if (++v17 >= (int)[a3 count]) {
        goto LABEL_32;
      }
    }
    if ((VCVideoStream *)objc_opt_class() == v20)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_27;
      }
      os_log_t v37 = (os_log_t)VRTraceErrorLogLevelToCSTR();
      __int16 v28 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_27;
      }
      unsigned __int16 v29 = objc_msgSend((id)objc_msgSend(v7, "firstObject"), "unsignedIntegerValue");
      int v42 = v34;
      os_log_t v43 = v37;
      __int16 v44 = 2080;
      uint64_t v45 = "-[VCVideoStream setTransmitterStreamIDs:repairStreamIDs:]";
      __int16 v46 = 1024;
      int v47 = 2748;
      __int16 v48 = 1024;
      *(_DWORD *)__int16 v49 = v22;
      __int16 v21 = v38;
      v49[2] = 1024;
      *(_DWORD *)&v49[3] = v29;
      __int16 v25 = v28;
      __int16 v26 = "VCVideoStream [%s] %s:%d Replacing temporal streamID=%d->%d";
      uint32_t v27 = 40;
    }
    else
    {
      uint64_t v23 = &stru_1F3D3E450;
      if (objc_opt_respondsToSelector()) {
        uint64_t v23 = (__CFString *)[(VCVideoStream *)v20 performSelector:v39];
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_27;
      }
      uint64_t v36 = VRTraceErrorLogLevelToCSTR();
      os_log_t v37 = (os_log_t)*MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_27;
      }
      unsigned __int16 v24 = objc_msgSend((id)objc_msgSend(v7, "firstObject"), "unsignedIntegerValue");
      int v42 = v35;
      os_log_t v43 = (os_log_t)v36;
      __int16 v44 = 2080;
      uint64_t v45 = "-[VCVideoStream setTransmitterStreamIDs:repairStreamIDs:]";
      __int16 v46 = 1024;
      int v47 = 2748;
      __int16 v48 = 2112;
      *(void *)__int16 v49 = v23;
      v49[4] = 2048;
      *(void *)&v49[5] = v20;
      v49[9] = 1024;
      int v50 = v22;
      __int16 v25 = v37;
      __int16 v21 = v38;
      __int16 v51 = 1024;
      int v52 = v24;
      __int16 v26 = "VCVideoStream [%s] %s:%d %@(%p) Replacing temporal streamID=%d->%d";
      uint32_t v27 = 60;
    }
    _os_log_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEFAULT, v26, (uint8_t *)&v42, v27);
LABEL_27:
    unsigned __int16 v22 = objc_msgSend((id)objc_msgSend(v7, "firstObject"), "unsignedIntegerValue");
    char v18 = 1;
LABEL_28:
    *(_WORD *)&v21[2 * v19++] = v22;
    goto LABEL_29;
  }
  unsigned __int8 v19 = 0;
  __int16 v21 = v38;
LABEL_32:
  unsigned __int8 v30 = [a4 count];
  unsigned __int8 v31 = v30;
  __int16 v32 = (char *)&v34 - ((2 * v30 + 15) & 0x3F0);
  if (v30) {
    memset((char *)&v34 - ((2 * v30 + 15) & 0x3F0), 170, 2 * v30);
  }
  if ((int)[a4 count] >= 1)
  {
    uint64_t v33 = 0;
    do
    {
      *(_WORD *)&v32[2 * v33] = objc_msgSend((id)objc_msgSend(a4, "objectAtIndexedSubscript:", v33), "unsignedIntegerValue");
      ++v33;
    }
    while (v33 < (int)[a4 count]);
  }
  [(VCVideoTransmitterBase *)v40->_videoTransmitter setStreamIDs:v21 numOfStreamIDs:v19 repairedStreamIDs:v32 numOfRepairedStreamIDs:v31];
}

- (void)setStreamIDs:(id)a3 repairStreamIDs:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  uint64_t v45 = [(VCMediaStream *)self defaultStreamConfig];
  id v44 = a4;
  if ((VCVideoStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      __str = 0;
      uint64_t v8 = a3 ? (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String") : "<nil>";
      asprintf(&__str, "%s", v8);
      if (__str)
      {
        id v42 = a3;
        __lasts = 0;
        __int16 v15 = strtok_r(__str, "\n", &__lasts);
        long long v16 = (os_log_t *)MEMORY[0x1E4F47A50];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v17 = VRTraceErrorLogLevelToCSTR();
            char v18 = *v16;
            if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              uint64_t v54 = v17;
              __int16 v55 = 2080;
              long long v56 = "-[VCVideoStream setStreamIDs:repairStreamIDs:]";
              __int16 v57 = 1024;
              int v58 = 2768;
              __int16 v59 = 2080;
              __int16 v60 = "streamIDs=";
              __int16 v61 = 2080;
              uint64_t v62 = v15;
              _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          __int16 v15 = strtok_r(0, "\n", &__lasts);
        }
        while (v15);
        goto LABEL_26;
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      id v7 = (__CFString *)[(VCVideoStream *)self performSelector:sel_logPrefix];
    }
    else {
      id v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      __str = 0;
      unint64_t v9 = (const char *)[(__CFString *)v7 UTF8String];
      __int16 v10 = a3 ? (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String") : "<nil>";
      asprintf(&__str, "%s(%p) %s", v9, self, v10);
      if (__str)
      {
        id v42 = a3;
        __lasts = 0;
        int v11 = strtok_r(__str, "\n", &__lasts);
        uint64_t v12 = (os_log_t *)MEMORY[0x1E4F47A50];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v13 = VRTraceErrorLogLevelToCSTR();
            uint64_t v14 = *v12;
            if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              uint64_t v54 = v13;
              __int16 v55 = 2080;
              long long v56 = "-[VCVideoStream setStreamIDs:repairStreamIDs:]";
              __int16 v57 = 1024;
              int v58 = 2768;
              __int16 v59 = 2080;
              __int16 v60 = "streamIDs=";
              __int16 v61 = 2080;
              uint64_t v62 = v11;
              _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          int v11 = strtok_r(0, "\n", &__lasts);
        }
        while (v11);
LABEL_26:
        free(__str);
        a3 = v42;
      }
    }
  }
  if ((VCVideoStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      __str = 0;
      id v43 = a3;
      if (a4) {
        uint64_t v20 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
      }
      else {
        uint64_t v20 = "<nil>";
      }
      asprintf(&__str, "%s", v20);
      if (!__str) {
        goto LABEL_53;
      }
      __lasts = 0;
      uint32_t v27 = strtok_r(__str, "\n", &__lasts);
      __int16 v28 = (os_log_t *)MEMORY[0x1E4F47A50];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v29 = VRTraceErrorLogLevelToCSTR();
          unsigned __int8 v30 = *v28;
          if (os_log_type_enabled(*v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v54 = v29;
            __int16 v55 = 2080;
            long long v56 = "-[VCVideoStream setStreamIDs:repairStreamIDs:]";
            __int16 v57 = 1024;
            int v58 = 2769;
            __int16 v59 = 2080;
            __int16 v60 = "repairStreamIDs=";
            __int16 v61 = 2080;
            uint64_t v62 = v27;
            _os_log_impl(&dword_1E1EA4000, v30, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        uint32_t v27 = strtok_r(0, "\n", &__lasts);
      }
      while (v27);
      goto LABEL_52;
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      unsigned __int8 v19 = (__CFString *)[(VCVideoStream *)self performSelector:sel_logPrefix];
    }
    else {
      unsigned __int8 v19 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      __str = 0;
      __int16 v21 = (const char *)[(__CFString *)v19 UTF8String];
      id v43 = a3;
      if (a4) {
        unsigned __int16 v22 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
      }
      else {
        unsigned __int16 v22 = "<nil>";
      }
      asprintf(&__str, "%s(%p) %s", v21, self, v22);
      if (!__str) {
        goto LABEL_53;
      }
      __lasts = 0;
      uint64_t v23 = strtok_r(__str, "\n", &__lasts);
      unsigned __int16 v24 = (os_log_t *)MEMORY[0x1E4F47A50];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v25 = VRTraceErrorLogLevelToCSTR();
          __int16 v26 = *v24;
          if (os_log_type_enabled(*v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v54 = v25;
            __int16 v55 = 2080;
            long long v56 = "-[VCVideoStream setStreamIDs:repairStreamIDs:]";
            __int16 v57 = 1024;
            int v58 = 2769;
            __int16 v59 = 2080;
            __int16 v60 = "repairStreamIDs=";
            __int16 v61 = 2080;
            uint64_t v62 = v23;
            _os_log_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        uint64_t v23 = strtok_r(0, "\n", &__lasts);
      }
      while (v23);
LABEL_52:
      free(__str);
LABEL_53:
      a3 = v43;
    }
  }
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v32 = a3;
  [v31 addObjectsFromArray:a3];
  [v31 addObjectsFromArray:a4];
  if ([(VCMediaStreamConfig *)v45 temporalScalingEnabled])
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    transportArray = self->super._transportArray;
    uint64_t v34 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v49 objects:v48 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v50 != v36) {
            objc_enumerationMutation(transportArray);
          }
          long long v38 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          if ((objc_msgSend(v31, "containsObject:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v38, "idsStreamId"))) & 1) == 0)objc_msgSend(v31, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v38, "idsStreamId"))); {
        }
          }
        uint64_t v35 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v49 objects:v48 count:16];
      }
      while (v35);
    }
  }
  [(VCVideoStream *)self setupCompoundStreamIDsWithStreamIDs:v31];

  if ([(VCMediaStreamConfig *)v45 temporalScalingEnabled])
  {
    unsigned int v39 = [(VCVideoStream *)self getMaxTemporalBitrateForStreamIDs:v32];
    unsigned int v40 = [(VCVideoTransmitterBase *)self->_videoTransmitter targetBitrate];
    if (v39 >= v40) {
      uint64_t v41 = v40;
    }
    else {
      uint64_t v41 = v39;
    }
    [(VCVideoTransmitterBase *)self->_videoTransmitter setTargetBitrate:v41];
  }
  [(VCVideoStream *)self setTransmitterStreamIDs:v32 repairStreamIDs:v44];
}

- (void)setPeerSubscribedStreamIDs:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(VCMediaStream *)self defaultStreamConfig];
  os_log_t v37 = self;
  id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(VCMediaStreamConfig *)v5 temporalScalingEnabled]
    && (long long v57 = 0u,
        long long v58 = 0u,
        long long v55 = 0u,
        long long v56 = 0u,
        transportArray = self->super._transportArray,
        (uint64_t v7 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v55 objects:v54 count:16]) != 0))
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v56 != v11) {
          objc_enumerationMutation(transportArray);
        }
        uint64_t v13 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        if (objc_msgSend(a3, "containsObject:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v13, "idsStreamId", v37))))
        {
          uint64_t v14 = (void *)[v13 streamConfig];
          objc_msgSend(v39, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "txMaxBitrate")));
          uint64_t v10 = [v14 txMaxBitrate];
          uint64_t v9 = objc_msgSend((id)objc_msgSend(v14, "multiwayConfig"), "qualityIndex");
        }
      }
      uint64_t v8 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v55 objects:v54 count:16];
    }
    while (v8);
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  for (int j = objc_msgSend(v39, "count", v37); j < (int)objc_msgSend(v38[68], "count"); ++j)
    objc_msgSend(v39, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v10));
  uint64_t v16 = [v39 count];
  if (v16 != [v38[68] count])
  {
    if ((id *)objc_opt_class() == v38)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
        unsigned __int8 v19 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = [v39 count];
          uint64_t v21 = [v38[68] count];
          *(_DWORD *)buf = 136316162;
          uint64_t v41 = v18;
          __int16 v42 = 2080;
          id v43 = "-[VCVideoStream setPeerSubscribedStreamIDs:]";
          __int16 v44 = 1024;
          int v45 = 2821;
          __int16 v46 = 2048;
          uint64_t v47 = v20;
          __int16 v48 = 2048;
          uint64_t v49 = v21;
          unsigned __int16 v22 = "VCVideoStream [%s] %s:%d Bitrate array size (%lu) does not match transport array size (%lu)";
          uint64_t v23 = v19;
          uint32_t v24 = 48;
LABEL_26:
          _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v17 = (__CFString *)[v38 performSelector:sel_logPrefix];
      }
      else {
        uint64_t v17 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v25 = VRTraceErrorLogLevelToCSTR();
        __int16 v26 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v27 = [v39 count];
          uint64_t v28 = [v38[68] count];
          *(_DWORD *)buf = 136316674;
          uint64_t v41 = v25;
          __int16 v42 = 2080;
          id v43 = "-[VCVideoStream setPeerSubscribedStreamIDs:]";
          __int16 v44 = 1024;
          int v45 = 2821;
          __int16 v46 = 2112;
          uint64_t v47 = (uint64_t)v17;
          __int16 v48 = 2048;
          uint64_t v49 = (uint64_t)v38;
          __int16 v50 = 2048;
          uint64_t v51 = v27;
          __int16 v52 = 2048;
          uint64_t v53 = v28;
          unsigned __int16 v22 = "VCVideoStream [%s] %s:%d %@(%p) Bitrate array size (%lu) does not match transport array size (%lu)";
          uint64_t v23 = v26;
          uint32_t v24 = 68;
          goto LABEL_26;
        }
      }
    }
  }
  [v38[106] setTemporalBitrateArray:v39];
  [v38[106] setHighestActiveQualityIndex:v9];
  if ((id *)objc_opt_class() == v38)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      goto LABEL_38;
    }
    uint64_t v30 = VRTraceErrorLogLevelToCSTR();
    id v31 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_38;
    }
    *(_DWORD *)buf = 136315906;
    uint64_t v41 = v30;
    __int16 v42 = 2080;
    id v43 = "-[VCVideoStream setPeerSubscribedStreamIDs:]";
    __int16 v44 = 1024;
    int v45 = 2827;
    __int16 v46 = 2112;
    uint64_t v47 = (uint64_t)v39;
    id v32 = "VCVideoStream [%s] %s:%d Setting temporal stream bitrate array to %@";
    uint64_t v33 = v31;
    uint32_t v34 = 38;
    goto LABEL_37;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v29 = (__CFString *)[v38 performSelector:sel_logPrefix];
  }
  else {
    uint64_t v29 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v35 = VRTraceErrorLogLevelToCSTR();
    uint64_t v36 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v41 = v35;
      __int16 v42 = 2080;
      id v43 = "-[VCVideoStream setPeerSubscribedStreamIDs:]";
      __int16 v44 = 1024;
      int v45 = 2827;
      __int16 v46 = 2112;
      uint64_t v47 = (uint64_t)v29;
      __int16 v48 = 2048;
      uint64_t v49 = (uint64_t)v38;
      __int16 v50 = 2112;
      uint64_t v51 = (uint64_t)v39;
      id v32 = "VCVideoStream [%s] %s:%d %@(%p) Setting temporal stream bitrate array to %@";
      uint64_t v33 = v36;
      uint32_t v34 = 58;
LABEL_37:
      _os_log_impl(&dword_1E1EA4000, v33, OS_LOG_TYPE_DEFAULT, v32, buf, v34);
    }
  }
LABEL_38:
  if (v39) {
    CFRelease(v39);
  }
}

- (double)lastSentAudioHostTime
{
  [(VCVideoTransmitterBase *)self->_videoTransmitter lastSentAudioHostTime];
  return result;
}

- (unsigned)lastSentAudioSampleTime
{
  return [(VCVideoTransmitterBase *)self->_videoTransmitter lastSentAudioSampleTime];
}

- (void)setLastSentAudioHostTime:(double)a3
{
}

- (void)setLastSentAudioSampleTime:(unsigned int)a3
{
}

- (void)setIsServerBasedBandwidthProbingEnabled:(BOOL)a3
{
  self->_isServerBasedBandwidthProbingEnabled = a3;
  -[VCVideoTransmitterBase setIsServerBasedBandwidthProbingEnabled:](self->_videoTransmitter, "setIsServerBasedBandwidthProbingEnabled:");
}

- (void)setIsEndToEndBasedBandwidthProbingEnabled:(BOOL)a3
{
  self->_isEndToEndBasedBandwidthProbingEnabled = a3;
  -[VCVideoTransmitterBase setIsEndToEndBasedBandwidthProbingEnabled:](self->_videoTransmitter, "setIsEndToEndBasedBandwidthProbingEnabled:");
}

- (void)setTargetEncoderBitrate:(unsigned int)a3
{
}

- (unsigned)targetEncoderBitrate
{
  return [(VCVideoTransmitterBase *)self->_videoTransmitter targetBitrate];
}

- (void)setTargetBitrateChangeCounter:(unsigned int)a3
{
}

- (unsigned)targetBitrateChangeCounter
{
  return [(VCVideoTransmitterBase *)self->_videoTransmitter targetBitrateChangeCounter];
}

- (void)handleVTPSendFailedWithData:(void *)a3
{
  if (a3)
  {
    -[VCVideoStream handleNWConnectionPacketEvent:eventType:](self, "handleNWConnectionPacketEvent:eventType:");
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCVideoStream handleVTPSendFailedWithData:]();
    }
  }
}

- (void)setVideoStreamDelegate:(id)a3 delegateFunctions:(const tagVCVideoStreamDelegateRealtimeInstanceVTable *)a4
{
  v6[7] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    delegateNotificationQueue = self->super._delegateNotificationQueue;
    CFDictionaryRef remoteScreenAttributesDidChange = a4->remoteScreenAttributesDidChange;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __58__VCVideoStream_setVideoStreamDelegate_delegateFunctions___block_invoke;
    v6[3] = &unk_1E6DB5450;
    v6[4] = self;
    v6[5] = a3;
    v6[6] = remoteScreenAttributesDidChange;
    dispatch_async(delegateNotificationQueue, v6);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCVideoStream setVideoStreamDelegate:delegateFunctions:]();
    }
  }
}

void *__58__VCVideoStream_setVideoStreamDelegate_delegateFunctions___block_invoke(void *result)
{
  *(void *)(result[4] + 1112) = result[5];
  *(void *)(result[4] + 1120) = result[6];
  return result;
}

- (void)setDidReceiveFirstFrame:(BOOL)a3
{
  VCMediaStream_Lock((uint64_t)self);
  if (!a3) {
    [(id)VCRemoteVideoManager_DefaultManager() resetDidReceiveFirstFrameForStreamToken:self->super._streamToken];
  }
  self->_didReceiveFirstFrame = a3;

  VCMediaStream_Unlock((uint64_t)self);
}

- (BOOL)didReceiveFirstFrame
{
  VCMediaStream_Lock((uint64_t)self);
  BOOL didReceiveFirstFrame = self->_didReceiveFirstFrame;
  VCMediaStream_Unlock((uint64_t)self);
  return didReceiveFirstFrame;
}

- (int)remoteCameraReportingClientType
{
  if ([(NSString *)self->super._clientName isEqualToString:*MEMORY[0x1E4F47B30]]) {
    return 16;
  }
  else {
    return 10;
  }
}

- (int)screenSharingReportingClientType
{
  if ([(NSString *)self->super._clientName isEqualToString:@"CoreDeviceScreenSharing"]) {
    return 13;
  }
  if ([(NSString *)self->super._clientName isEqualToString:@"RemoteDesktopScreenSharing"]
    || [(NSString *)self->super._clientName isEqualToString:*MEMORY[0x1E4F47AE8]])
  {
    return 15;
  }
  if ([(NSString *)self->super._clientName isEqualToString:@"NearbyScreenSharing"]) {
    return 19;
  }
  return -1;
}

- (__CFString)getReportingServiceName
{
  if ([(VCMediaStreamConfig *)[(VCMediaStream *)self defaultStreamConfig] type]) {
    return @"Video";
  }
  else {
    return (__CFString *)*MEMORY[0x1E4F47B18];
  }
}

- (__CFString)getReportingClientName
{
  uint64_t v3 = &stru_1F3D3E450;
  switch([(VCMediaStreamConfig *)[(VCMediaStream *)self defaultStreamConfig] type])
  {
    case 0:
      uint64_t v4 = (__CFString **)MEMORY[0x1E4F47B10];
      return *v4;
    case 1:
      uint64_t v4 = (__CFString **)MEMORY[0x1E4F47B58];
      return *v4;
    case 2:
      uint64_t v4 = (__CFString **)MEMORY[0x1E4F47AD0];
      return *v4;
    case 3:
      uint64_t v4 = (__CFString **)MEMORY[0x1E4F47B20];
      return *v4;
    case 4:
      uint64_t v5 = (__CFString **)MEMORY[0x1E4F47B30];
      if ([(NSString *)self->super._clientName isEqualToString:*MEMORY[0x1E4F47B30]]) {
        return *v5;
      }
      uint64_t v4 = (__CFString **)MEMORY[0x1E4F47B38];
      return *v4;
    case 5:
      if ([(NSString *)self->super._clientName isEqualToString:@"CoreDeviceScreenSharing"])
      {
        uint64_t v4 = (__CFString **)MEMORY[0x1E4F47AF0];
        return *v4;
      }
      if ([(NSString *)self->super._clientName isEqualToString:@"RemoteDesktopScreenSharing"])
      {
        uint64_t v4 = (__CFString **)MEMORY[0x1E4F47B40];
        return *v4;
      }
      clientName = self->super._clientName;
      uint64_t v8 = (__CFString **)MEMORY[0x1E4F47AE8];
      if ([(NSString *)clientName isEqualToString:*MEMORY[0x1E4F47AE8]]) {
        return *v8;
      }
      return v3;
    case 6:
      uint64_t v4 = (__CFString **)MEMORY[0x1E4F47B28];
      return *v4;
    default:
      return v3;
  }
}

- (int)reportVideoStreamType
{
  id v2 = [(VCMediaStream *)self defaultStreamConfig];
  unint64_t v3 = [(VCMediaStreamConfig *)v2 type];
  if (v3 > 6) {
    return -1;
  }
  if (((1 << v3) & 0x66) != 0) {
    return 1;
  }
  if (((1 << v3) & 0x11) != 0) {
    return 0;
  }
  if ([(VCMediaStreamConfig *)v2 captureSource] == 2) {
    return 1;
  }
  return [(VCMediaStreamConfig *)v2 captureSource] == 1;
}

- (BOOL)isClientSpecificUserInfoSupported:(int)a3
{
  return (a3 < 0x14) & (0x9A740u >> a3);
}

- (__CFDictionary)getClientSpecificUserInfo
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t ReportingClientType = _VCVideoStream_GetReportingClientType(self);
  if (![(VCVideoStream *)self isClientSpecificUserInfoSupported:ReportingClientType])return 0; {
  uint64_t v4 = [(VCVideoStream *)self reportVideoStreamType];
  }
  uint64_t v5 = [(VCMediaStream *)self defaultStreamConfig];
  if (ReportingClientType == 6)
  {
    unsigned int v21 = v4;
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    transportArray = self->super._transportArray;
    uint64_t v8 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v25 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      int v10 = 0;
      uint64_t v11 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(transportArray);
          }
          uint64_t v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          int v14 = [(VCMediaStreamConfig *)v5 temporalScalingEnabled];
          if (v14 & v10)
          {
            int v10 = 1;
          }
          else
          {
            int v15 = v14;
            if ([v13 idsStreamId]) {
              uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v13, "idsStreamId"));
            }
            else {
              uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[VCMediaStreamMultiwayConfig streamGroupID](-[VCMediaStreamConfig multiwayConfig](v5, "multiwayConfig"), "streamGroupID"));
            }
            v10 |= v15;
            [v6 addObject:v16];
          }
        }
        uint64_t v9 = [(NSMutableArray *)transportArray countByEnumeratingWithState:&v25 objects:v24 count:16];
      }
      while (v9);
    }
    [(VCMediaStreamMultiwayConfig *)[(VCMediaStreamConfig *)v5 multiwayConfig] streamGroupID];
    uint64_t v17 = reportingStreamGroupFromStreamGroupID();
    v22[0] = @"VCMediaStreamType";
    v23[0] = [NSNumber numberWithInt:v21];
    v22[1] = @"VCSUUID";
    v23[1] = [(VCMediaStreamMultiwayConfig *)[(VCMediaStreamConfig *)v5 multiwayConfig] sessionId];
    v22[2] = @"VCSPUUID";
    v23[2] = [(VCMediaStreamMultiwayConfig *)[(VCMediaStreamConfig *)v5 multiwayConfig] participantId];
    v22[3] = @"VCVSStreamIDs";
    v23[3] = [v6 componentsJoinedByString:@","];
    v22[4] = @"VCMSDirection";
    v23[4] = objc_msgSend(NSNumber, "numberWithInteger:", -[VCMediaStreamConfig direction](v5, "direction"));
    v22[5] = @"VCMSStreamGroup";
    v23[5] = [NSNumber numberWithUnsignedInt:v17];
    uint64_t v18 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:6];
  }
  else
  {
    uint64_t v18 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v4), @"VCMediaStreamType");
    objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", self->super._streamToken), @"VCVSStreamToken");
    objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", -[VCMediaStreamConfig direction](v5, "direction")), @"VCMSDirection");
    callID = self->super._callID;
    if (callID) {
      [v18 setObject:callID forKeyedSubscript:@"CallID"];
    }
    [(VCMediaStream *)self applyClientSessionID:_VCVideoStream_GetReportingClientType(self) clientUserInfo:v18];
  }
  return (__CFDictionary *)v18;
}

- (BOOL)startSynchronization:(id)a3
{
  return [(VCVideoReceiverBase *)self->_videoReceiver startSynchronization:a3];
}

- (void)stopSynchronization
{
}

- (VCVideoReceiverFeedbackDelegate)getVideoReceiverFeedbackDelegate
{
  return (VCVideoReceiverFeedbackDelegate *)self->_videoTransmitter;
}

- (void)setVideoReceiverFeedbackDelegate:(id)a3
{
}

uint64_t __VCVideoStream_DidReceiveSampleBuffer_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    unint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    long long v5 = *(_OWORD *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 56);
    return [v3 vcMediaStream:v4 didReceiveFirstFrameWithTime:&v5];
  }
  return result;
}

- (void)vcVideoReceiver:(id)a3 requestKeyFrameGenerationWithStreamID:(unsigned __int16)a4 firType:(int)a5
{
  int v6 = a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if ((VCVideoStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      int v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v21 = v9;
        __int16 v22 = 2080;
        uint64_t v23 = "-[VCVideoStream vcVideoReceiver:requestKeyFrameGenerationWithStreamID:firType:]";
        __int16 v24 = 1024;
        int v25 = 3496;
        __int16 v26 = 1024;
        *(_DWORD *)long long v27 = v6;
        *(_WORD *)&v27[4] = 1024;
        *(_DWORD *)&v27[6] = a5;
        uint64_t v11 = "VCVideoStream [%s] %s:%d Requesting streamID:%hu to generate a key frame for FIRType:%d";
        uint64_t v12 = v10;
        uint32_t v13 = 40;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v8 = (__CFString *)[(VCVideoStream *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v8 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      int v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316674;
        uint64_t v21 = v14;
        __int16 v22 = 2080;
        uint64_t v23 = "-[VCVideoStream vcVideoReceiver:requestKeyFrameGenerationWithStreamID:firType:]";
        __int16 v24 = 1024;
        int v25 = 3496;
        __int16 v26 = 2112;
        *(void *)long long v27 = v8;
        *(_WORD *)&v27[8] = 2048;
        long long v28 = self;
        __int16 v29 = 1024;
        int v30 = v6;
        __int16 v31 = 1024;
        int v32 = a5;
        uint64_t v11 = "VCVideoStream [%s] %s:%d %@(%p) Requesting streamID:%hu to generate a key frame for FIRType:%d";
        uint64_t v12 = v15;
        uint32_t v13 = 60;
        goto LABEL_11;
      }
    }
  }
  delegateNotificationQueue = self->super._delegateNotificationQueue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __79__VCVideoStream_vcVideoReceiver_requestKeyFrameGenerationWithStreamID_firType___block_invoke;
  v17[3] = &unk_1E6DB76D8;
  v17[4] = self;
  __int16 v19 = v6;
  int v18 = a5;
  dispatch_async(delegateNotificationQueue, v17);
}

uint64_t __79__VCVideoStream_vcVideoReceiver_requestKeyFrameGenerationWithStreamID_firType___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(unsigned __int16 *)(a1 + 44);
  uint64_t v5 = *(unsigned int *)(a1 + 40);

  return [v2 vcMediaStream:v3 requestKeyFrameGenerationWithStreamID:v4 firType:v5];
}

- (void)vcVideoReceiverRequestKeyFrame:(id)a3 rtcpPSFBType:(unsigned int)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  VCMediaStream_Lock((uint64_t)self);
  if (a4 == 1)
  {
    int v6 = self;
    int v7 = 224;
    goto LABEL_5;
  }
  if (a4 == 4)
  {
    int v6 = self;
    int v7 = 222;
LABEL_5:
    _VCVideoStream_ReportingVideoStreamEventWithVideoAttributesAndStreamID((uint64_t)v6, v7, 0, 0);
    goto LABEL_6;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v20 = VRTraceErrorLogLevelToCSTR();
    uint64_t v21 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      int v22 = 136316162;
      uint64_t v23 = v20;
      __int16 v24 = 2080;
      int v25 = "-[VCVideoStream vcVideoReceiverRequestKeyFrame:rtcpPSFBType:]";
      __int16 v26 = 1024;
      int v27 = 3513;
      __int16 v28 = 2048;
      __int16 v29 = self;
      __int16 v30 = 1024;
      LODWORD(v31) = a4;
      _os_log_error_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_ERROR, "VCVideoStream [%s] %s:%d VCVideoStream[%p] requesting Key frame for unknown RTCP FB:%d", (uint8_t *)&v22, 0x2Cu);
    }
  }
LABEL_6:
  if (self->_videoTransmitter)
  {
    uint64_t v8 = [(VCMediaStream *)self defaultStreamConfig];
    [(VCVideoReceiverBase *)self->_videoReceiver roundTripTime];
    double v10 = v9;
    double v11 = micro();
    [(VCVideoTransmitterBase *)self->_videoTransmitter lastKeyFrameSentTime];
    double v13 = v11 - v12;
    double v14 = (double)(unint64_t)[(VCMediaStreamConfig *)v8 keyFrameInterval] - v13;
    unint64_t v15 = [(VCMediaStreamConfig *)v8 framerate];
    if (v13 <= v10 + v10 || v14 <= 2.0 / (double)v15)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
        __int16 v19 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v22 = 136316674;
          uint64_t v23 = v18;
          __int16 v24 = 2080;
          int v25 = "-[VCVideoStream vcVideoReceiverRequestKeyFrame:rtcpPSFBType:]";
          __int16 v26 = 1024;
          int v27 = 3532;
          __int16 v28 = 2048;
          __int16 v29 = self;
          __int16 v30 = 2048;
          double v31 = v10;
          __int16 v32 = 2048;
          double v33 = v13;
          __int16 v34 = 2048;
          double v35 = v14;
          _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d VCVideoStream[%p] Ignoring request to generate key frame. RTT:%.3f timeDelta:%.3f timeToNextKeyFrame:%.3f", (uint8_t *)&v22, 0x44u);
        }
      }
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v16 = VRTraceErrorLogLevelToCSTR();
        uint64_t v17 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v22 = 136316674;
          uint64_t v23 = v16;
          __int16 v24 = 2080;
          int v25 = "-[VCVideoStream vcVideoReceiverRequestKeyFrame:rtcpPSFBType:]";
          __int16 v26 = 1024;
          int v27 = 3529;
          __int16 v28 = 2048;
          __int16 v29 = self;
          __int16 v30 = 2048;
          double v31 = v10;
          __int16 v32 = 2048;
          double v33 = v13;
          __int16 v34 = 2048;
          double v35 = v14;
          _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d VCVideoStream[%p] Requesting to generate key frame. RTT:%.3f timeDelta:%.3f timeToNextKeyFrame:%.3f", (uint8_t *)&v22, 0x44u);
        }
      }
      [(VCVideoTransmitterBase *)self->_videoTransmitter generateKeyFrameWithFIRType:0];
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCVideoStream vcVideoReceiverRequestKeyFrame:rtcpPSFBType:]();
    }
  }
  VCMediaStream_Unlock((uint64_t)self);
}

- (void)vcVideoReceiver:(id)a3 downlinkQualityDidChange:(id)a4
{
  void block[6] = *MEMORY[0x1E4F143B8];
  VCMediaStream_Lock((uint64_t)self);
  delegateNotificationQueue = self->super._delegateNotificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__VCVideoStream_vcVideoReceiver_downlinkQualityDidChange___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  block[5] = a4;
  dispatch_async(delegateNotificationQueue, block);
  VCMediaStream_Unlock((uint64_t)self);
}

uint64_t __58__VCVideoStream_vcVideoReceiver_downlinkQualityDidChange___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    return [v3 vcMediaStream:v4 downlinkQualityDidChange:v5];
  }
  return result;
}

- (unsigned)vcVideoReceiver:(id)a3 receivedTMMBR:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  v13[1] = *MEMORY[0x1E4F143B8];
  VCMediaStream_Lock((uint64_t)self);
  unsigned int v6 = [(VCVideoTransmitterBase *)self->_videoTransmitter setTemporaryMaximumBitrate:v4];
  unsigned int v7 = v6;
  if (self->_uplinkOperatingBitrate != v6)
  {
    self->_uplinkOperatingBitrate = v6;
    _VCVideoStream_ReportingVideoStreamEventWithVideoAttributesAndStreamID((uint64_t)self, 225, 0, 0);
    uint64_t v12 = 0x1F3D47BB0;
    v13[0] = [NSNumber numberWithUnsignedInt:self->_uplinkOperatingBitrate];
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    delegateNotificationQueue = self->super._delegateNotificationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__VCVideoStream_vcVideoReceiver_receivedTMMBR___block_invoke;
    block[3] = &unk_1E6DB3E40;
    block[4] = self;
    block[5] = v8;
    dispatch_async(delegateNotificationQueue, block);
  }
  VCMediaStream_Unlock((uint64_t)self);
  return v7;
}

uint64_t __47__VCVideoStream_vcVideoReceiver_receivedTMMBR___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    return [v3 vcMediaStream:v4 uplinkQualityDidChange:v5];
  }
  return result;
}

- (void)vcVideoReceiver:(id)a3 didSwitchFromStreamID:(unsigned __int16)a4 toStreamID:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  delegateNotificationQueue = self->super._delegateNotificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__VCVideoStream_vcVideoReceiver_didSwitchFromStreamID_toStreamID___block_invoke;
  block[3] = &unk_1E6DB3F08;
  block[4] = self;
  unsigned __int16 v9 = a4;
  unsigned __int16 v10 = a5;
  dispatch_async(delegateNotificationQueue, block);
  self->_currentStreamID = v5;
  _VCVideoStream_ReportingVideoStreamEventWithVideoAttributesAndStreamID((uint64_t)self, 230, 0, (const void *)[NSNumber numberWithUnsignedShort:v5]);
}

uint64_t __66__VCVideoStream_vcVideoReceiver_didSwitchFromStreamID_toStreamID___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(unsigned __int16 *)(a1 + 40);
    uint64_t v6 = *(unsigned __int16 *)(a1 + 42);
    return [v3 vcMediaStream:v4 didSwitchFromStreamID:v5 toStreamID:v6];
  }
  return result;
}

- (BOOL)onVideoFrame:(opaqueCMSampleBuffer *)a3 frameTime:(id *)a4 attribute:(id *)a5
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a4;
  VCVideoStream_OnVideoFrame((uint64_t)self, (uint64_t)a3, (uint64_t)&v6, (uint64_t)a5);
  return 1;
}

- (void)sourceFrameRateDidChange:(unsigned int)a3
{
}

- (id)copyOnVideoFrameBlock
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__VCVideoStream_copyOnVideoFrameBlock__block_invoke;
  v3[3] = &unk_1E6DB7C50;
  v3[4] = self;
  return _Block_copy(v3);
}

uint64_t __38__VCVideoStream_copyOnVideoFrameBlock__block_invoke(uint64_t a1, uint64_t a2, long long *a3, uint64_t a4)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  long long v6 = *a3;
  uint64_t v7 = *((void *)a3 + 2);
  VCVideoStream_OnVideoFrame(v4, a2, (uint64_t)&v6, a4);
  return 1;
}

- (void)avConferencePreviewError:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((VCVideoStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoStream avConferencePreviewError:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCVideoStream *)self performSelector:sel_logPrefix];
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
        int v8 = 136316418;
        uint64_t v9 = v6;
        __int16 v10 = 2080;
        uint64_t v11 = "-[VCVideoStream avConferencePreviewError:]";
        __int16 v12 = 1024;
        int v13 = 3605;
        __int16 v14 = 2112;
        unint64_t v15 = v5;
        __int16 v16 = 2048;
        uint64_t v17 = self;
        __int16 v18 = 2080;
        uint64_t v19 = [a3 UTF8String];
        _os_log_error_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_ERROR, "VCVideoStream [%s] %s:%d %@(%p) received an error=%s", (uint8_t *)&v8, 0x3Au);
      }
    }
  }
}

- (void)avConferenceScreenCaptureError:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((VCVideoStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoStream avConferenceScreenCaptureError:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCVideoStream *)self performSelector:sel_logPrefix];
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
        int v8 = 136316418;
        uint64_t v9 = v6;
        __int16 v10 = 2080;
        uint64_t v11 = "-[VCVideoStream avConferenceScreenCaptureError:]";
        __int16 v12 = 1024;
        int v13 = 3609;
        __int16 v14 = 2112;
        unint64_t v15 = v5;
        __int16 v16 = 2048;
        uint64_t v17 = self;
        __int16 v18 = 2080;
        uint64_t v19 = [a3 UTF8String];
        _os_log_error_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_ERROR, "VCVideoStream [%s] %s:%d %@(%p) received a capture error=%s", (uint8_t *)&v8, 0x3Au);
      }
    }
  }
}

- (id)clientCaptureRule
{
  return self->_videoRule;
}

- (void)thermalLevelDidChange:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([(VCMediaStreamMultiwayConfig *)[(VCMediaStreamConfig *)[(VCMediaStream *)self defaultStreamConfig] multiwayConfig] isOneToOne])
  {
    if ((VCVideoStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_13;
      }
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      int v13 = 136315906;
      uint64_t v14 = v6;
      __int16 v15 = 2080;
      __int16 v16 = "-[VCVideoStream thermalLevelDidChange:]";
      __int16 v17 = 1024;
      int v18 = 3619;
      __int16 v19 = 1024;
      LODWORD(v20) = v3;
      int v8 = "VCVideoStream [%s] %s:%d thermalLevelDidChange thermalLevel=%u";
      uint64_t v9 = v7;
      uint32_t v10 = 34;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v5 = (__CFString *)[(VCVideoStream *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_13;
      }
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      __int16 v12 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      int v13 = 136316418;
      uint64_t v14 = v11;
      __int16 v15 = 2080;
      __int16 v16 = "-[VCVideoStream thermalLevelDidChange:]";
      __int16 v17 = 1024;
      int v18 = 3619;
      __int16 v19 = 2112;
      uint64_t v20 = v5;
      __int16 v21 = 2048;
      int v22 = self;
      __int16 v23 = 1024;
      int v24 = v3;
      int v8 = "VCVideoStream [%s] %s:%d %@(%p) thermalLevelDidChange thermalLevel=%u";
      uint64_t v9 = v12;
      uint32_t v10 = 54;
    }
    _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
LABEL_13:
    VCMediaStream_Lock((uint64_t)self);
    [(VCVideoTransmitterBase *)self->_videoTransmitter handleThermalLevelChange:v3];
    VCMediaStream_Unlock((uint64_t)self);
  }
}

- (void)cameraAvailabilityDidChange:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      int v8 = "-[VCVideoStream cameraAvailabilityDidChange:]";
      __int16 v9 = 1024;
      int v10 = 3627;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d Handling of camera availability did change not implemented yet", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (void)collectRxChannelMetrics:(id *)a3 interval:(float)a4
{
}

- (void)collectRxChannelMetrics:(id *)a3
{
  *(float *)&double v3 = (float)self->_reportingDefaultRealtimePeriod;
  [(VCVideoReceiverBase *)self->_videoReceiver collectChannelMetrics:a3 interval:v3];
}

- (void)collectTxChannelMetrics:(id *)a3
{
  *(float *)&double v3 = (float)self->_reportingDefaultRealtimePeriod;
  [(VCVideoTransmitterBase *)self->_videoTransmitter collectChannelMetrics:a3 interval:v3];
}

- (void)handleActiveConnectionChange:(id)a3
{
  VCMediaStream_Lock((uint64_t)self);
  HIDWORD(self->_colorInfo) = [a3 maxConnectionMTU];
  self->_baseQualityIndex = VCConnection_PerPacketConnectionOverhead((uint64_t)a3);
  if (self->super._operatingMode == 6) {
    -[VCMediaStream updateTransportsWithConstantConnectionOverhead:](self, "updateTransportsWithConstantConnectionOverhead:");
  }
  [(VCVideoTransmitterBase *)self->_videoTransmitter handleActiveConnectionChange:a3];
  [(VCObject *)self reportingAgent];
  [(VCVideoTransmitterBase *)self->_videoTransmitter encodingWidth];
  [(VCVideoTransmitterBase *)self->_videoTransmitter encodingHeight];
  [(VCVideoTransmitterBase *)self->_videoTransmitter targetFramerate];
  reportingVideoProp();
  [(VCVideoReceiverBase *)self->_videoReceiver handleActiveConnectionChange:a3];

  VCMediaStream_Unlock((uint64_t)self);
}

- (void)rateAdaptation:(id)a3 targetBitrateDidChange:(unsigned int)a4 rateChangeCounter:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!+[VCVideoStream shouldEnableRateControlForStreamType:self->_type]|| self->super._rateAdaptation != a3)
  {
    return;
  }
  if ((VCVideoStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_14;
    }
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint64_t v11 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    __int16 v12 = [(VCMediaStreamRateAdaptation *)self->super._rateAdaptation vcrcRateController];
    *(_DWORD *)uint64_t v20 = 136316418;
    *(void *)&v20[4] = v10;
    *(_WORD *)&v20[12] = 2080;
    *(void *)&v20[14] = "-[VCVideoStream rateAdaptation:targetBitrateDidChange:rateChangeCounter:]";
    *(_WORD *)&v20[22] = 1024;
    LODWORD(v21) = 3680;
    WORD2(v21) = 2048;
    *(void *)((char *)&v21 + 6) = v12;
    HIWORD(v21) = 1024;
    *(_DWORD *)int v22 = v6;
    *(_WORD *)&v22[4] = 1024;
    *(_DWORD *)&void v22[6] = v5;
    int v13 = "VCVideoStream [%s] %s:%d vcrcRateController=%p gives targetBitrate=%d, rateChangeCounter=%d";
    uint64_t v14 = v11;
    uint32_t v15 = 50;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      __int16 v9 = (__CFString *)[(VCVideoStream *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v9 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_14;
    }
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    __int16 v17 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    int v18 = [(VCMediaStreamRateAdaptation *)self->super._rateAdaptation vcrcRateController];
    *(_DWORD *)uint64_t v20 = 136316930;
    *(void *)&v20[4] = v16;
    *(_WORD *)&v20[12] = 2080;
    *(void *)&v20[14] = "-[VCVideoStream rateAdaptation:targetBitrateDidChange:rateChangeCounter:]";
    *(_WORD *)&v20[22] = 1024;
    LODWORD(v21) = 3680;
    WORD2(v21) = 2112;
    *(void *)((char *)&v21 + 6) = v9;
    HIWORD(v21) = 2048;
    *(void *)int v22 = self;
    *(_WORD *)&v22[8] = 2048;
    *(void *)&v22[10] = v18;
    *(_WORD *)&v22[18] = 1024;
    *(_DWORD *)&v22[20] = v6;
    LOWORD(v23) = 1024;
    *(_DWORD *)((char *)&v23 + 2) = v5;
    int v13 = "VCVideoStream [%s] %s:%d %@(%p) vcrcRateController=%p gives targetBitrate=%d, rateChangeCounter=%d";
    uint64_t v14 = v17;
    uint32_t v15 = 70;
  }
  _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, v13, v20, v15);
LABEL_14:
  -[VCVideoTransmitterBase setTargetBitrateChangeCounter:](self->_videoTransmitter, "setTargetBitrateChangeCounter:", v5, *(_OWORD *)v20, *(void *)&v20[16], v21, *(void *)v22, *(_OWORD *)&v22[8], v23);
  [(VCVideoTransmitterBase *)self->_videoTransmitter setTargetBitrate:v6];
  if (!self->_initialTargetBitrate) {
    self->_uint64_t initialTargetBitrate = v6;
  }
  if (self->_type == 5)
  {
    rateSharingGroup = self->super._rateSharingGroup;
    if (rateSharingGroup) {
      -[VCRateSharingGroup setTargetBitrate:fromRateSharingClient:](rateSharingGroup, "setTargetBitrate:fromRateSharingClient:", v6, [a3 vcrcRateController]);
    }
  }
}

- (void)redundancyController:(id)a3 redundancyPercentageDidChange:(unsigned int)a4
{
  if (self->_redundancyController == a3)
  {
    double v5 = VCRedundancyControllerVideo_ConvertRedundancyPercentageToRatio(a4);
    [(VCVideoStream *)self setFecRatio:v5];
  }
}

- (void)redundancyController:(id)a3 redundancyVectorDidChange:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (self->_redundancyController != a3) {
    return;
  }
  [(VCVideoStream *)self setFECRedundancyVector:a4];
  if ((VCVideoStream *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return;
    }
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    __int16 v9 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int var0 = a4->var0;
    int v17 = 136316162;
    uint64_t v18 = v8;
    __int16 v19 = 2080;
    uint64_t v20 = "-[VCVideoStream redundancyController:redundancyVectorDidChange:]";
    __int16 v21 = 1024;
    int v22 = 3711;
    __int16 v23 = 2112;
    id v24 = a3;
    __int16 v25 = 1024;
    LODWORD(v26) = var0;
    uint64_t v11 = "VCVideoStream [%s] %s:%d VCVideoStream received redundancyController update redundancyControler=%@ redundancyArrayCount=%u";
    __int16 v12 = v9;
    uint32_t v13 = 44;
LABEL_13:
    _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v17, v13);
    return;
  }
  if (objc_opt_respondsToSelector()) {
    __int16 v7 = (__CFString *)[(VCVideoStream *)self performSelector:sel_logPrefix];
  }
  else {
    __int16 v7 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    uint32_t v15 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v16 = a4->var0;
      int v17 = 136316674;
      uint64_t v18 = v14;
      __int16 v19 = 2080;
      uint64_t v20 = "-[VCVideoStream redundancyController:redundancyVectorDidChange:]";
      __int16 v21 = 1024;
      int v22 = 3711;
      __int16 v23 = 2112;
      id v24 = v7;
      __int16 v25 = 2048;
      __int16 v26 = self;
      __int16 v27 = 2112;
      id v28 = a3;
      __int16 v29 = 1024;
      int v30 = v16;
      uint64_t v11 = "VCVideoStream [%s] %s:%d %@(%p) VCVideoStream received redundancyController update redundancyControler=%@ re"
            "dundancyArrayCount=%u";
      __int16 v12 = v15;
      uint32_t v13 = 64;
      goto LABEL_13;
    }
  }
}

- (void)updateWindowState:(int)a3 isLocal:(BOOL)a4 windowRect:(CGRect)a5
{
}

- (void)updateSourcePlayoutTime:(const tagVCMediaTime *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (VCMediaStream_State((uint64_t)self) != 2) {
    return;
  }
  unint64_t type = self->_type;
  if (type <= 6)
  {
    if (type == 3)
    {
      [(VCVideoReceiverBase *)self->_videoReceiver updateSourcePlayoutTime:a3];
    }
    else if ((VCVideoStream *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCVideoStream updateSourcePlayoutTime:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v6 = (__CFString *)[(VCVideoStream *)self performSelector:sel_logPrefix];
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
          int v25 = 136316162;
          uint64_t v26 = v7;
          __int16 v27 = 2080;
          id v28 = "-[VCVideoStream updateSourcePlayoutTime:]";
          __int16 v29 = 1024;
          int v30 = 3736;
          __int16 v31 = 2112;
          double v32 = *(double *)&v6;
          __int16 v33 = 2048;
          __int16 v34 = self;
          _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, "VCVideoStream [%s] %s:%d %@(%p) This should not be called for IP camera or display", (uint8_t *)&v25, 0x30u);
        }
      }
    }
  }
  double v9 = micro();
  double lastDecodedVideoFrameTime = self->_lastDecodedVideoFrameTime;
  if (lastDecodedVideoFrameTime == 0.0)
  {
    self->_double lastDecodedVideoFrameTime = v9;
    double lastDecodedVideoFrameTime = v9;
  }
  if (v9 - lastDecodedVideoFrameTime <= self->_mediaStallTimeout)
  {
    if (self->_isRemoteMediaStalled)
    {
      self->_isRemoteMediaStalled = 0;
      self->_lastMediaStallReportTime = 0.0;
      [(VCMediaStreamDelegate *)self->super._delegate vcMediaStream:self remoteMediaStalled:0 duration:0.0];
    }
    goto LABEL_30;
  }
  if (!self->_isRemoteMediaStalled)
  {
    if (!self->_sendContinuousStallMessages) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (self->_sendContinuousStallMessages)
  {
LABEL_24:
    if (v9 - self->_lastMediaStallReportTime <= self->_mediaStallReportRepeatInterval)
    {
LABEL_29:
      self->_isRemoteMediaStalled = 1;
      goto LABEL_30;
    }
LABEL_25:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      __int16 v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        double v13 = self->_lastDecodedVideoFrameTime;
        int v25 = 136316162;
        uint64_t v26 = v11;
        __int16 v27 = 2080;
        id v28 = "-[VCVideoStream updateSourcePlayoutTime:]";
        __int16 v29 = 1024;
        int v30 = 3751;
        __int16 v31 = 2048;
        double v32 = v13;
        __int16 v33 = 2048;
        __int16 v34 = *(VCVideoStream **)&v9;
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d remote media stall lastDecodedVideoFrameTime=%f currentTime=%f", (uint8_t *)&v25, 0x30u);
      }
    }
    self->_lastMediaStallReportTime = v9;
    [(VCMediaStreamDelegate *)self->super._delegate vcMediaStream:self remoteMediaStalled:1 duration:v9 - self->_lastDecodedVideoFrameTime];
    goto LABEL_29;
  }
LABEL_30:
  uint64_t v14 = [(VCMediaStream *)self defaultStreamConfig];
  if (VCVideoStreamConfig_StreamType((uint64_t)v14) == 3 && VCMediaStreamConfig_Direction((uint64_t)v14) == 2)
  {
    double v15 = v9 - self->_lastDecodedVideoFrameTime;
    double lastStatisticsCollectorVideoStallTotalUpdateTime = self->_lastStatisticsCollectorVideoStallTotalUpdateTime;
    if (v15 >= 1.0)
    {
      if (v9 - lastStatisticsCollectorVideoStallTotalUpdateTime >= 1.0)
      {
        uint64_t v21 = VCMediaStreamConfig_MultiwayConfig((uint64_t)v14);
        unint64_t v22 = VCMediaStreamMultiwayConfig_RemoteIDSParticipantID(v21);
        _VCMediaStream_SubmitStatisticsCollectorVideoStallUpdate((uint64_t)self, v22, v9, v15);
        self->_double lastStatisticsCollectorVideoStallTotalUpdateTime = v9;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v23 = VRTraceErrorLogLevelToCSTR();
          id v24 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v25 = 136315906;
            uint64_t v26 = v23;
            __int16 v27 = 2080;
            id v28 = "VCVideoStream_SubmitStatisticsCollectorVideoStallUpdate";
            __int16 v29 = 1024;
            int v30 = 1587;
            __int16 v31 = 2048;
            double v32 = v15;
            _os_log_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d VideoStallTimeTotal=%.2f", (uint8_t *)&v25, 0x26u);
          }
        }
      }
    }
    else if (lastStatisticsCollectorVideoStallTotalUpdateTime > 0.0)
    {
      uint64_t v17 = VCMediaStreamConfig_MultiwayConfig((uint64_t)v14);
      unint64_t v18 = VCMediaStreamMultiwayConfig_RemoteIDSParticipantID(v17);
      _VCMediaStream_SubmitStatisticsCollectorVideoStallUpdate((uint64_t)self, v18, v9, v15);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v19 = VRTraceErrorLogLevelToCSTR();
        uint64_t v20 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v25 = 136315906;
          uint64_t v26 = v19;
          __int16 v27 = 2080;
          id v28 = "VCVideoStream_SubmitStatisticsCollectorVideoStallUpdate";
          __int16 v29 = 1024;
          int v30 = 1592;
          __int16 v31 = 2048;
          double v32 = v15;
          _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d VideoStallTimeTotal=%.2f", (uint8_t *)&v25, 0x26u);
        }
      }
      self->_double lastStatisticsCollectorVideoStallTotalUpdateTime = 0.0;
    }
  }
  VCMediaStream_CheckForDecryptionTimeout((uint64_t)self);
}

- (void)reportStreamPerfTimings
{
  v3[5] = *MEMORY[0x1E4F143B8];
  delegateNotificationQueue = self->super._delegateNotificationQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__VCVideoStream_reportStreamPerfTimings__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(delegateNotificationQueue, v3);
}

void __40__VCVideoStream_reportStreamPerfTimings__block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v2 = *(unsigned char **)(a1 + 32);
  if (!v2[1168])
  {
    [v2 reportingAgent];
    uint64_t DynamicReportingModuleID = VCReporting_GetDynamicReportingModuleID();
    double v9 = @"VCMSStreamToken";
    v10[0] = [NSNumber numberWithInteger:*(void *)(*(void *)(a1 + 32) + 616)];
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    double v5 = *(void **)(a1 + 32);
    uint64_t v6 = (void *)v5[93];
    uint64_t v7 = [v5 reportingAgent];
    VCPerfTimingUtilsReport(v6, v7, DynamicReportingModuleID, v4, v8);
    *(unsigned char *)(*(void *)(a1 + 32) + 1168) = 1;
  }
}

- (NSNumber)targetStreamID
{
  return self->_targetStreamID;
}

- (BOOL)isServerBasedBandwidthProbingEnabled
{
  return self->_isServerBasedBandwidthProbingEnabled;
}

- (BOOL)isEndToEndBasedBandwidthProbingEnabled
{
  return self->_isEndToEndBasedBandwidthProbingEnabled;
}

- (NSNumber)sendingStreamID
{
  return self->_sendingStreamID;
}

- (BOOL)isCompoundStreamIDsIncreased
{
  return self->_isCompoundStreamIDsIncreased;
}

- (BOOL)shouldEnableFaceZoom
{
  return self->_shouldEnableFaceZoom;
}

- (unsigned)screenDisplayID
{
  return self->_screenDisplayID;
}

- (void)setScreenDisplayID:(unsigned int)a3
{
  self->_screenDisplayID = a3;
}

- (unsigned)customWidth
{
  return self->_customWidth;
}

- (void)setCustomWidth:(unsigned int)a3
{
  self->_customWidth = a3;
}

- (unsigned)customHeight
{
  return self->_customHeight;
}

- (void)setCustomHeight:(unsigned int)a3
{
  self->_customHeight = a3;
}

- (VCVideoReceiverBase)videoReceiver
{
  return self->_videoReceiver;
}

- (VCVideoTransmitterBase)videoTransmitter
{
  return self->_videoTransmitter;
}

- (BOOL)isTemporalScalingEnabled
{
  return self->_isTemporalScalingEnabled;
}

void ___VCVideoStream_CacheRemoteVideoFrame_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 832) = *(void *)(a1 + 40);
}

uint64_t ___VCVideoStream_DidReceiveRemoteFrame_block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    double v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 40);
    return [v3 vcMediaStream:v4 priorityDidChange:v5];
  }
  return result;
}

uint64_t ___VCVideoStream_DidReceiveRemoteFrame_block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    double v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    long long v5 = *(_OWORD *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 56);
    return [v3 vcMediaStream:v4 didReceiveFirstFrameWithTime:&v5];
  }
  return result;
}

void ___VCVideoStream_NotifyVideoStreamDelegate_block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    double v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(v4 + 1112);
      int v7 = 136316418;
      uint64_t v8 = v2;
      __int16 v9 = 2080;
      uint64_t v10 = "_VCVideoStream_NotifyVideoStreamDelegate_block_invoke";
      __int16 v11 = 1024;
      int v12 = 3372;
      __int16 v13 = 2048;
      uint64_t v14 = v4;
      __int16 v15 = 2112;
      uint64_t v16 = v5;
      __int16 v17 = 2048;
      uint64_t v18 = v6;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, "VCVideoStream [%s] %s:%d VCVideoStream[%p] remoteScreenAttributesForDelegate=%@, self.videoStreamDelegate=%p", (uint8_t *)&v7, 0x3Au);
    }
  }
  (*(void (**)(void, void))(*(void *)(a1 + 32) + 1120))(*(void *)(*(void *)(a1 + 32) + 1112), *(void *)(a1 + 40));
}

- (void)enableRedundancyController:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVideoStream [%s] %s:%d Failed to create video redundancy controller", v2, v3, v4, v5, v6);
}

- (void)setupColorInfo:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVideoStream [%s] %s:%d Memory allocation for colorInfo dictionary failed", v2, v3, v4, v5, v6);
}

- (void)setupColorInfo:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v2 = 1225;
  _os_log_debug_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_DEBUG, "VCVideoStream [%s] %s:%d No color settings applied", v1, 0x1Cu);
}

- (void)updateVideoConfig:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_13_6(v0, *MEMORY[0x1E4F143B8]);
  if (v1) {
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v2, v3, "VCVideoStream [%s] %s:%d error[%s]", v4, v5, v6, v7, v8);
}

- (void)sendLastRemoteVideoFrame:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVideoStream [%s] %s:%d Failed to create frame data", v2, v3, v4, v5, v6);
}

- (void)sendLastRemoteVideoFrame:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVideoStream [%s] %s:%d Failed to create last frame XPC args", v2, v3, v4, v5, v6);
}

- (void)cleanupBeforeReconfigure:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVideoStream [%s] %s:%d Reconfiguring VCVideoStream with a different number of transports.", v2, v3, v4, v5, v6);
}

- (void)setTargetStreamID:.cold.1()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v3 = "-[VCVideoStream setTargetStreamID:]";
  OUTLINED_FUNCTION_3();
  int v4 = 1727;
  __int16 v5 = 2112;
  uint64_t v6 = v0;
  _os_log_debug_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_DEBUG, "VCVideoStream [%s] %s:%d TargetStreamID didn't change %@", v2, 0x26u);
}

- (void)validateStreamConfiguration:error:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  os_log_t v1 = (void *)OUTLINED_FUNCTION_13_6(v0, *MEMORY[0x1E4F143B8]);
  if (v1) {
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v2, v3, "VCVideoStream [%s] %s:%d error[%s]", v4, v5, v6, v7, v8);
}

- (void)validateStreamConfiguration:error:.cold.2()
{
  OUTLINED_FUNCTION_11_0();
  os_log_t v1 = (void *)OUTLINED_FUNCTION_13_6(v0, *MEMORY[0x1E4F143B8]);
  if (v1) {
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_21(&dword_1E1EA4000, v2, v3, "VCVideoStream [%s] %s:%d error[%s]", v4, v5, v6, v7, v8);
}

- (void)configureStreamInputCaptureSourceWithStreamInputID:frameRate:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v2 = "-[VCVideoStream configureStreamInputCaptureSourceWithStreamInputID:frameRate:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_7_3(&dword_1E1EA4000, v0, (uint64_t)v0, "VCVideoStream [%s] %s:%d Can not find streamInput for streamInputID=%ld", v1);
}

- (void)onConfigureStreamWithConfiguration:error:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  os_log_t v1 = (void *)OUTLINED_FUNCTION_13_6(v0, *MEMORY[0x1E4F143B8]);
  if (v1) {
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v2, v3, "VCVideoStream [%s] %s:%d error[%s]", v4, v5, v6, v7, v8);
}

- (void)onConfigureStreamWithConfiguration:error:.cold.2()
{
  OUTLINED_FUNCTION_11_0();
  os_log_t v1 = (void *)OUTLINED_FUNCTION_13_6(v0, *MEMORY[0x1E4F143B8]);
  if (v1) {
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_21(&dword_1E1EA4000, v2, v3, "VCVideoStream [%s] %s:%d error[%s]", v4, v5, v6, v7, v8);
}

- (void)onConfigureStreamWithConfiguration:error:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVideoStream [%s] %s:%d Failed to create transport", v2, v3, v4, v5, v6);
}

- (void)onConfigureStreamWithConfiguration:error:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVideoStream [%s] %s:%d Failed to configure transport", v2, v3, v4, v5, v6);
}

- (void)onConfigureStreamWithConfiguration:error:.cold.5()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_15_3();
  _os_log_fault_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_FAULT, "VCVideoStream [%s] %s:%d Failed to configure transport", v1, 0x1Cu);
}

- (void)onConfigureStreamWithConfiguration:error:.cold.6()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_14_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCVideoStream [%s] %s:%d Failed to update stream config for VCVideoStreamType=%d", v2, v3, v4, v5);
}

- (void)onConfigureStreamWithConfiguration:error:.cold.7()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_14_6();
  _os_log_fault_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_FAULT, "VCVideoStream [%s] %s:%d Failed to update stream config for VCVideoStreamType=%d", v1, 0x22u);
}

- (void)onConfigureStreamWithConfiguration:error:.cold.8()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_2(&dword_1E1EA4000, v0, v1, "VCVideoStream [%s] %s:%d Error setting socket receive buffer size=%d", v2, v3, v4, v5, v6);
}

- (void)onConfigureStreamWithConfiguration:error:.cold.9()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_13_6(v0, *MEMORY[0x1E4F143B8]);
  if (v1) {
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v2, v3, "VCVideoStream [%s] %s:%d error[%s]", v4, v5, v6, v7, v8);
}

- (void)onConfigureStreamWithConfiguration:error:.cold.10()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v1 = (void *)OUTLINED_FUNCTION_13_6(v0, *MEMORY[0x1E4F143B8]);
  if (v1) {
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_21(&dword_1E1EA4000, v2, v3, "VCVideoStream [%s] %s:%d error[%s]", v4, v5, v6, v7, v8);
}

void __36__VCVideoStream_setupReportingAgent__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVideoStream [%s] %s:%d RTCReporting: can't configure the reporting agent.", v2, v3, v4, v5, v6);
}

- (void)setupInternalRedundancyControllerWithStreamConfig:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVideoStream [%s] %s:%d Failed to create video redundancy controller", v2, v3, v4, v5, v6);
}

- (void)handleVTPSendFailedWithData:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVideoStream [%s] %s:%d VTP send failed with no data!", v2, v3, v4, v5, v6);
}

- (void)setVideoStreamDelegate:delegateFunctions:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVideoStream [%s] %s:%d videoStreamDelegateFunctions is NULL", v2, v3, v4, v5, v6);
}

- (void)vcVideoReceiverRequestKeyFrame:rtcpPSFBType:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v2 = "-[VCVideoStream vcVideoReceiverRequestKeyFrame:rtcpPSFBType:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_7_3(&dword_1E1EA4000, v0, (uint64_t)v0, "VCVideoStream [%s] %s:%d VCVideoStream[%p] Unable to request key frame", v1);
}

- (void)avConferencePreviewError:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  [v0 UTF8String];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, "VCVideoStream [%s] %s:%d received an error=%s", v3, v4, v5, v6, v7);
}

- (void)avConferenceScreenCaptureError:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  [v0 UTF8String];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, "VCVideoStream [%s] %s:%d received a capture error=%s", v3, v4, v5, v6, v7);
}

- (void)updateSourcePlayoutTime:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVideoStream [%s] %s:%d This should not be called for IP camera or display", v2, v3, v4, v5, v6);
}

@end