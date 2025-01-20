@interface VCSessionParticipantLocal
+ (BOOL)isCameraEnabledWithMediaStates:(id)a3;
+ (BOOL)negotiatorCipherSuite:(unsigned int *)a3 fromMediaStreamConfig:(id)a4;
+ (BOOL)updateBandwidthAllocator:(id)a3 activeStream:(id)a4 peerSubscribedStreams:(id)a5 streamGroup:(id)a6;
+ (BOOL)updateUplinkStreamsForPeerSubscribedStreams:(id)a3 streamGroup:(id)a4 uplinkBandwidthAllocator:(id)a5;
- (BOOL)addFeatureListStringsForVideoConfiguration:(id)a3 mediaType:(unsigned __int8)a4;
- (BOOL)addMediaConfigurationsToLocalConfiguration:(id)a3;
- (BOOL)addVideoConfigurationsToLocalConfiguration:(id)a3;
- (BOOL)applyCachedMediaStreams:(id)a3 toMultiwayConfig:(id)a4;
- (BOOL)applyCachedMediaStreamsWithStreamConfigurations:(id)a3 mediaNegotiatorConfig:(id)a4;
- (BOOL)applyCachedStreamGroupMediaStreams:(id)a3 toMultiwayConfig:(id)a4;
- (BOOL)checkSubscribedStreamsConsistency:(id)a3;
- (BOOL)completeStreamSetup:(id)a3 rtpCipherSuite:(int64_t)a4;
- (BOOL)configureAudioIOWithDeviceRole:(int)a3 operatingMode:(int)a4;
- (BOOL)configureMultiwayStreamGroups;
- (BOOL)configureOneToOneAudioStreamsWithDeviceRole:(int)a3;
- (BOOL)configureOneToOneVideoStreamsWithDeviceRole:(int)a3;
- (BOOL)configureWithOneToOneParticipantConfig:(id)a3 shouldConfigureGFTStreams:(BOOL)a4;
- (BOOL)containsStreamWithSSRC:(unsigned int)a3;
- (BOOL)createParticipantInfo;
- (BOOL)enableRedundancy:(BOOL)a3;
- (BOOL)enableVADFiltering;
- (BOOL)encryptionInfoReceived;
- (BOOL)featureListStringsRequiredForMediaType:(unsigned __int8)a3;
- (BOOL)initializeMediaNegotiator;
- (BOOL)initializeOneToOneStreamGroup:(id)a3 forLocalConfig:(id)a4;
- (BOOL)initializeStreamGroupsForLocalConfig:(id)a3;
- (BOOL)isActiveMediaType:(unsigned int)a3;
- (BOOL)isEnabledMediaType:(unsigned int)a3;
- (BOOL)isHighPriorityAudioWithPower:(float)a3 voiceActive:(BOOL)a4;
- (BOOL)isOneToOneModeEnabled;
- (BOOL)isOneToOneStreamGroup:(unsigned int)a3;
- (BOOL)isParticipantIDBasedKeyLookupEnabled;
- (BOOL)isRemoteOnPeace;
- (BOOL)isRemotePresentationLarge:(CGRect)a3;
- (BOOL)isRetransmissionEnabled;
- (BOOL)isStreamGroupActive:(id)a3;
- (BOOL)nativeParticipantSupportsStreamGroupID:(unsigned int)a3;
- (BOOL)onVideoFrame:(opaqueCMSampleBuffer *)a3 frameTime:(id *)a4 attribute:(id *)a5;
- (BOOL)prepareVideoFrame:(opaqueCMSampleBuffer *)a3;
- (BOOL)reconfigureAudioIOForMode:(int)a3 error:(id *)a4;
- (BOOL)reconfigureOneToOneAudioStream:(id)a3 error:(id *)a4;
- (BOOL)remoteParticipantsSupportStreamGroupID:(unsigned int)a3;
- (BOOL)setState:(unsigned int)a3;
- (BOOL)setupAudioStreamGroupWithStreamConfigs:(id)a3 negotiatorConfig:(id)a4 streamGroupConfiguration:(id)a5;
- (BOOL)setupAudioStreamsWithStreamConfiguration:(id)a3 streamGroupConfiguration:(id)a4;
- (BOOL)setupAudioStreamsWithStreamConfigurations:(id)a3 mediaNegotiatorConfig:(id)a4 streamGroupConfiguration:(id)a5;
- (BOOL)setupCameraStreamGroupWithStreamConfigs:(id)a3 negotiatorConfig:(id)a4 streamGroupConfiguration:(id)a5;
- (BOOL)setupCaptionsStreamsWithStreamConfiguration:(id)a3 streamGroupConfiguration:(id)a4;
- (BOOL)setupCaptionsStreamsWithStreamConfigurations:(id)a3 mediaNegotiatorConfig:(id)a4 streamGroupConfiguration:(id)a5;
- (BOOL)setupOneToOneVideoStreamWithConfig:(id)a3 streamGroupID:(unsigned int)a4;
- (BOOL)setupStreamGroupMediaSync;
- (BOOL)setupStreamGroupWithStreamGroupConfig:(id)a3 negotiatorConfig:(id)a4;
- (BOOL)setupStreamGroupsWithConfig:(id)a3 negotiatorConfig:(id)a4;
- (BOOL)setupStreamInputsWithConfig:(id)a3;
- (BOOL)setupVideoMediaStreamsWithStreamGroupConfiguration:(id)a3 streamGroupConfig:(id)a4 streamGroupID:(unsigned int)a5 mediaType:(unsigned int)a6;
- (BOOL)setupVideoStreamsWithStreamConfiguration:(id)a3 streamGroupConfiguration:(id)a4;
- (BOOL)setupVideoStreamsWithStreamConfigurations:(id)a3 mediaNegotiatorConfig:(id)a4 streamGroupConfiguration:(id)a5;
- (BOOL)shouldCapStream:(int64_t)a3 cappedBitrate:(unsigned int *)a4;
- (BOOL)shouldEnableUplinkRetransmissionForStreamGroupID:(unsigned int)a3;
- (BOOL)v1FeatureListStringsSupportedForMediaType:(unsigned __int8)a3;
- (BOOL)webParticipantSupportsStreamGroupID:(unsigned int)a3;
- (BOOL)wolfParticipantSupportsStreamGroupID:(unsigned int)a3;
- (CGSize)captureEncodingSize;
- (NSArray)peerSubscribedStreams;
- (NSArray)remoteParticipants;
- (NSSet)audioPayloadTypes;
- (NSSet)videoPayloadTypes;
- (VCSessionParticipantLocal)initWithConfig:(id)a3 delegate:(id)a4;
- (_VCSessionParticipantLocalOneToOneSettings)oneToOneSettings;
- (__CFString)activeStreamKeys;
- (id)applyMicReconfigurationForCameraTransition;
- (id)applyVideoEnabledSetting:(BOOL)a3;
- (id)audioRuleCollectionWithAudioStreamConfig:(id)a3;
- (id)clientCaptureRule;
- (id)copyOnVideoFrameBlock;
- (id)featureListString:(id)a3 removingPayload:(int)a4 andPayload:(int)a5 mediaType:(unsigned __int8)a6;
- (id)getAudioDumpName;
- (id)microphoneOnlyBandwidthTable;
- (id)multiwayAudioStreamNegotiatorConfigForStreamConfig:(id)a3;
- (id)multiwayVideoStreamNegotiatorConfigForStreamConfig:(id)a3 isSubstream:(BOOL)a4;
- (id)newAudioSendGroupConfigWithStreamGroupID:(unsigned int)a3 streamGroupConfiguration:(id)a4;
- (id)newAudioStreamOneToOneConfigurationWithStreamGroupId:(unsigned int)a3;
- (id)newAudioStreamSendGroupWithConfig:(id)a3 streamGroupID:(unsigned int)a4;
- (id)newMediaNegotiatorAudioConfigurationForMediaType:(unsigned int)a3;
- (id)newStreamGroupNegotiationConfigForStreamGroup:(id)a3;
- (id)newStreamInfoWithAudioStreamWithConfiguration:(id)a3 idsDestination:(id)a4 isMultiway:(BOOL)a5 streamGroupID:(unsigned int)a6 streamToken:(int64_t)a7;
- (id)newStreamInfoWithAudioStreamWithConfiguration:(id)a3 streamToken:(int64_t)a4 isMultiway:(BOOL)a5 streamGroupID:(unsigned int)a6;
- (id)newStreamInfoWithVideoStreamWithConfiguration:(id)a3 idsDestination:(id)a4 groupID:(unsigned int)a5;
- (id)newStreamInfoWithVideoStreamWithConfiguration:(id)a3 streamGroupID:(unsigned int)a4 rtpCipherSuite:(int64_t)a5;
- (id)newUplinkBandwidthAllocators;
- (id)newVideoConfigurationForMediaType:(unsigned __int8)a3;
- (id)newVideoSendGroupConfigWithStreamGroupID:(unsigned int)a3 streamGroupConfiguration:(id)a4;
- (id)newVideoStreamOneToOneConfigurationWithStreamGroupId:(unsigned int)a3;
- (id)newVideoStreamWithConfig:(id)a3 groupID:(unsigned int)a4;
- (id)processCachedParticipantData:(id)a3;
- (id)qualityTierTableForStreamToken:(int64_t)a3;
- (id)setupStreamRTP:(id)a3;
- (id)startCameraStreamGroups;
- (id)startMicStreamGroups;
- (id)supportedAudioRules;
- (id)u1VideoRuleCollectionsForMediaType:(unsigned __int8)a3;
- (id)updateMediaState:(unsigned int)a3 forStreamGroups:(id)a4;
- (id)videoCallMicrophoneBandwidthTable;
- (int)captureSourceIDFromStreamGroupConfig:(id)a3;
- (int)captureSourceIDFromStreamGroupID:(unsigned int)a3;
- (int)currentVideoCaptureFrameRate;
- (int)maxCaptureCameraFrameRate;
- (int)negotiateOneToOne:(id)a3;
- (int64_t)maxCaptureResolution;
- (opaqueCMFormatDescription)getAudioFormatDescriptionForStreamGroupID:(unsigned int)a3;
- (opaqueCMFormatDescription)getCaptionsFormatDescription;
- (tagVCAudioIOConfiguration)audioIOConfigWithDeviceRole:(SEL)a3 operatingMode:(int)a4;
- (tagVCNetworkStreamIdentifiers)generateSSRC:(BOOL)a3 streamID:(BOOL)a4 repairStreamID:(BOOL)a5 v2StreamID:(BOOL)a6;
- (unsigned)calculateUplinkTotalBitrateForMediaStreams:(id)a3;
- (unsigned)connectionStatsStreamID;
- (unsigned)currentUplinkTotalBitrate;
- (unsigned)generateIDSStreamID;
- (unsigned)generateSSRC;
- (unsigned)mediaStateForMediaType:(unsigned int)a3;
- (unsigned)oneToOneAudioStreamRedundancyMode;
- (unsigned)oneToOneVideoStreamRedundancyMode;
- (unsigned)oneToOneVideoStreamRedundancyPercentage;
- (unsigned)remainderBitrateSplitForStreamToken:(int64_t)a3;
- (unsigned)uplinkBitrateCapCell;
- (unsigned)uplinkBitrateCapWifi;
- (void)addCallInfoBlobToParticipantInfo:(id)a3;
- (void)applyScreenEnabledSetting:(BOOL)a3;
- (void)avConferencePreviewError:(id)a3;
- (void)cameraAvailabilityDidChange:(BOOL)a3;
- (void)captureSource1080pAvailabilityDidChange:(BOOL)a3;
- (void)captureSourceCenterStageEnabledDidChange:(BOOL)a3;
- (void)captureSourcePortraitBlurEnabledDidChange:(BOOL)a3;
- (void)captureSourcePositionDidChange:(BOOL)a3;
- (void)checkAndReportThermalIncreaseAudioOnly:(int)a3;
- (void)cleanupStreamInputs;
- (void)collectAudioChannelMetrics:(id *)a3;
- (void)collectVideoChannelMetrics:(id *)a3;
- (void)configureMultiwayStreamGroups;
- (void)createOpaqueData;
- (void)createParticipantInfo;
- (void)dealloc;
- (void)deregisterForVideoCapture;
- (void)deregisterForVideoCaptureAndStopProcessingAllMediaRecorderRequests:(BOOL)a3;
- (void)didReceiveCustomReportPacket:(tagRTCPPACKET *)a3 arrivalNTPTime:(tagNTP)a4;
- (void)didReceiveReportPacket:(tagRTCPPACKET *)a3 arrivalNTPTime:(tagNTP)a4;
- (void)didStopReacting;
- (void)dispatchedHandleActiveConnectionChangeForStreamGroups:(id)a3;
- (void)dispatchedSetAudioEnabled:(BOOL)a3;
- (void)dispatchedStartOneToOneStreams;
- (void)dispatchedUpdateUplinkTargetBitrate:(unsigned int)a3 rateChangeCounter:(unsigned int)a4;
- (void)dispatchedUpdateVCMediaQueueSize:(unsigned int)a3;
- (void)frameRateIsBeingThrottled:(int)a3 thermalLevelDidChange:(BOOL)a4 powerLevelDidChange:(BOOL)a5;
- (void)generateKeyFrameWithStreamID:(id)a3 streamGroupID:(unsigned int)a4 firType:(int)a5;
- (void)handleActiveConnectionChange:(id)a3;
- (void)initializeMediaNegotiator;
- (void)initializeMultiwayAudioStreamGroup:(id)a3 forLocalConfig:(id)a4;
- (void)initializeMultiwayVideoStreamGroup:(id)a3 forLocalConfig:(id)a4;
- (void)logDashboardLinks;
- (void)logRemoteParticipantInfo:(id)a3;
- (void)maxCaptureCameraFrameRate;
- (void)newUplinkBandwidthAllocators;
- (void)overrideVideoStreamConfigWithDefaults:(id)a3 streamGroupID:(unsigned int)a4;
- (void)reactionDidStart:(id)a3;
- (void)registerForVideoCapture:(int)a3;
- (void)reportCameraCompositionEnabled:(BOOL)a3;
- (void)reportVideoEnabledStatsWithVideoEnabled:(BOOL)a3;
- (void)resetOneToOneSettings;
- (void)resumeStreamsOnOneToOneModeSwitch;
- (void)serverDidDie;
- (void)setCellularUniqueTag:(unsigned int)a3;
- (void)setCurrentVideoCaptureFrameRate:(int)a3;
- (void)setEnableVADFiltering:(BOOL)a3;
- (void)setEncryptionInfoReceived:(BOOL)a3;
- (void)setIsRemoteOnPeace:(BOOL)a3;
- (void)setMediaSuggestion:(VCRateControlMediaSuggestion *)a3;
- (void)setMuted:(BOOL)a3;
- (void)setOneToOneModeEnabled:(BOOL)a3;
- (void)setPeerSubscribedStreams:(id)a3;
- (void)setRemoteParticipants:(id)a3;
- (void)setRetransmissionEnabled:(BOOL)a3;
- (void)setUpCaptions;
- (void)setUplinkBitrateCapCell:(unsigned int)a3;
- (void)setUplinkBitrateCapWifi:(unsigned int)a3;
- (void)setupEncodingModeWithVideoStreamConfig:(id)a3;
- (void)setupOneToOneAudioStreamWithConfig:(id)a3 streamGroupID:(unsigned int)a4;
- (void)setupOneToOneEncryptionInfoWithConfiguration:(id)a3;
- (void)setupSystemAudioCapture;
- (void)sourceFrameRateDidChange:(unsigned int)a3;
- (void)start;
- (void)startMultiwayStreams;
- (void)startSystemAudioCapture;
- (void)startVoiceActivityDetection;
- (void)stop;
- (void)stopSystemAudioCapture;
- (void)stopVideoCaptureClient;
- (void)stopVoiceActivityDetection;
- (void)streamGroup:(id)a3 didChangeState:(unsigned int)a4;
- (void)streamGroup:(id)a3 didRequestRedundancy:(BOOL)a4;
- (void)streamGroup:(id)a3 didSuspendStreams:(BOOL)a4;
- (void)streamGroupNegotiationVideoConfigForStreamGroup:(id)a3 streamConfig:(id)a4 mediaConfig:(id)a5;
- (void)suspendStreamsOnOneToOneModeSwitch;
- (void)thermalLevelDidChange:(int)a3;
- (void)updateActiveVoiceOnly;
- (void)updateAudioPriorityWithSampleBuffer:(opaqueVCAudioBufferList *)a3;
- (void)updateAudioSpectrumState;
- (void)updateCaptureSourceVideoFeatureStatus:(tagVCVideoCaptureFeatureStatus)a3;
- (void)updateMediaSettingsWithConfig:(id)a3;
- (void)updateMediaStreamsForStreamGroup:(id)a3 uplinkBitrateCap:(unsigned int)a4 rateChangeCounter:(unsigned int)a5;
- (void)updateMultiwayBandwithAllocationTable:(id)a3 mediaType:(unsigned int)a4 streamGroupID:(unsigned int)a5 encoderGroupID:(unsigned int)a6 minNetworkBitrate:(unsigned int)a7 maxNetworkBitrate:(unsigned int)a8;
- (void)updateOneToOneBandwidthAllocationTable:(id)a3 mediaType:(unsigned __int8)a4 streamGroupID:(unsigned int)a5;
- (void)updatePayloadTypesWithAudioConfigs:(id)a3;
- (void)updatePayloadTypesWithVideoConfigs:(id)a3;
- (void)updatePeerSubscribedStreams:(id)a3 streamGroup:(id)a4;
- (void)updateRedundancyEnabledForPeerSubscribedStreams:(id)a3;
- (void)updateSupportedAudioRules:(id)a3;
- (void)updateTargetBitrateOneToOne:(unsigned int)a3 rateChangeCounter:(unsigned int)a4;
- (void)updateUplinkTargetBitrate:(unsigned int)a3 rateChangeCounter:(unsigned int)a4;
- (void)updateUplinkTargetBitrateForStreamGroups;
- (void)updateVCMediaQueueSize:(unsigned int)a3;
- (void)updateVideoPaused:(BOOL)a3;
- (void)updateWindowState:(int)a3 isLocal:(BOOL)a4 windowRect:(CGRect)a5;
@end

@implementation VCSessionParticipantLocal

- (VCSessionParticipantLocal)initWithConfig:(id)a3 delegate:(id)a4
{
  v102[1] = *MEMORY[0x1E4F143B8];
  v86.receiver = self;
  v86.super_class = (Class)VCSessionParticipantLocal;
  v5 = [(VCSessionParticipant *)&v86 initWithConfig:a3 delegate:a4];
  v6 = v5;
  if (v5)
  {
    v5->_videoPriority = 0;
    int v7 = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-video-priority-enabled", @"enableVideoPriority", MEMORY[0x1E4F1CC38], 0), "BOOLValue");
    BOOL v8 = 0;
    if (v7) {
      BOOL v8 = +[VCHardwareSettings supportsVideoPriority];
    }
    v6->_BOOL videoPriorityEnabled = v8;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL videoPriorityEnabled = v6->_videoPriorityEnabled;
        *(_DWORD *)buf = 136315906;
        uint64_t v88 = v9;
        __int16 v89 = 2080;
        v90 = "-[VCSessionParticipantLocal initWithConfig:delegate:]";
        __int16 v91 = 1024;
        int v92 = 236;
        __int16 v93 = 1024;
        LODWORD(v94) = videoPriorityEnabled;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _videoPriorityEnabled=%d", buf, 0x22u);
      }
    }
    v6->super._direction = 1;
    v6->_maxSupportedMultiwayVideoResolution = [(VCSessionParticipantLocal *)v6 maxCaptureResolution];
    v6->super._oneToOneModeEnabled = [a3 isOneToOneModeEnabled];
    v6->super._isGKVoiceChat = [a3 isGKVoiceChat];
    v6->_isRetransmissionEnabled = [a3 isUplinkRetransmissionEnabled];
    int v12 = [(VCSessionParticipantLocal *)v6 maxCaptureCameraFrameRate];
    v6->_maxSupportedMultiwayCameraFrameRate = v12;
    v6->_currentVideoCaptureFrameRate = v12;
    v13 = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
    v6->super._uuid = v13;
    -[VCObject setLogPrefix:](v6, "setLogPrefix:", [NSString stringWithFormat:@"uuid:%@ (local)", v13]);
    [(VCSessionParticipantLocal *)v6 logDashboardLinks];
    v6->super._creationTime.wide = GetNTPTime();
    v6->_connectionStatsStreamID = [(VCSessionParticipantLocal *)v6 generateIDSStreamID];
    v6->_lastVideoPriority = 0;
    v6->_lastAudioPriority = 0;
    pthread_rwlock_init(&v6->_audioTimestampRWLock, 0);
    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v6->_generatedStreamIDs = v14;
    if (v14)
    {
      v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v6->_generatedSSRCs = v15;
      if (v15)
      {
        v16 = [[VCAudioPowerSpectrumSource alloc] initWithStreamToken:[(VCSessionParticipant *)v6 participantVideoToken] delegate:v6];
        v6->_powerSpectrumSource = v16;
        if (v16)
        {
          [+[VCAudioPowerSpectrumManager sharedInstance] registerAudioPowerMeterSource:v6->_powerSpectrumSource];
          v6->super._transportSessionID = [(VCSessionParticipant *)v6 participantVideoToken];
          v6->_peerSubscribedStreams = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
          v6->_localPublishedStreams = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
          v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
          v6->_oneToOneSettings.streamInfo = v17;
          if (v17)
          {
            v18 = [(VCSessionParticipantLocal *)v6 newUplinkBandwidthAllocators];
            v6->_uplinkBandwidthAllocators = v18;
            if (v18)
            {
              v6->_uplinkBandwidthAllocator = (VCSessionUplinkBandwidthAllocator *)[(NSArray *)v18 objectAtIndexedSubscript:v6->super._oneToOneModeEnabled];
              [(VCSessionParticipantLocal *)v6 setupSystemAudioCapture];
              v6->_isOneToOneAuthenticationTagEnabled = [a3 isOneToOneAuthenticationTagEnabled];
              uint64_t v19 = -[VCSessionParticipantLocal processCachedParticipantData:](v6, "processCachedParticipantData:", [a3 participantData]);
              v6->_audioPayloadTypes = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
              v6->_videoPayloadTypes = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
              if ([a3 sessionMode] == 2)
              {
                v20 = [[VCSessionMediaStreamPresenceConfigurationProvider alloc] initWithConfigurationType:1 supportedAudioRules:v6->super._supportedAudioRules streamIDGenerator:v6];
                if (v20)
                {
                  v21 = v20;
                  if ([(VCSessionParticipantLocal *)v6 setupStreamInputsWithConfig:v20])
                  {
                    if ([(VCSessionParticipantLocal *)v6 setupStreamGroupsWithConfig:v21 negotiatorConfig:v19])
                    {
                      v22 = 0;
                      goto LABEL_25;
                    }
                    if ((VCSessionParticipantLocal *)objc_opt_class() == v6)
                    {
                      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                      {
                        VRTraceErrorLogLevelToCSTR();
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                          -[VCSessionParticipantLocal initWithConfig:delegate:].cold.9();
                        }
                      }
                      goto LABEL_201;
                    }
                    if (objc_opt_respondsToSelector()) {
                      v54 = (__CFString *)[(VCSessionParticipantLocal *)v6 performSelector:sel_logPrefix];
                    }
                    else {
                      v54 = &stru_1F3D3E450;
                    }
                    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                    {
                      uint64_t v78 = VRTraceErrorLogLevelToCSTR();
                      v73 = *MEMORY[0x1E4F47A50];
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 136316162;
                        uint64_t v88 = v78;
                        __int16 v89 = 2080;
                        v90 = "-[VCSessionParticipantLocal initWithConfig:delegate:]";
                        __int16 v91 = 1024;
                        int v92 = 293;
                        __int16 v93 = 2112;
                        uint64_t v94 = (uint64_t)v54;
                        __int16 v95 = 2048;
                        v96 = v6;
                        v74 = " [%s] %s:%d %@(%p) Failed to setup the stream groups";
                        goto LABEL_169;
                      }
                    }
                  }
                  else
                  {
                    if ((VCSessionParticipantLocal *)objc_opt_class() == v6)
                    {
                      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                      {
                        VRTraceErrorLogLevelToCSTR();
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                          -[VCSessionParticipantLocal initWithConfig:delegate:]0();
                        }
                      }
                      goto LABEL_201;
                    }
                    if (objc_opt_respondsToSelector()) {
                      v52 = (__CFString *)[(VCSessionParticipantLocal *)v6 performSelector:sel_logPrefix];
                    }
                    else {
                      v52 = &stru_1F3D3E450;
                    }
                    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                    {
                      uint64_t v72 = VRTraceErrorLogLevelToCSTR();
                      v73 = *MEMORY[0x1E4F47A50];
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 136316162;
                        uint64_t v88 = v72;
                        __int16 v89 = 2080;
                        v90 = "-[VCSessionParticipantLocal initWithConfig:delegate:]";
                        __int16 v91 = 1024;
                        int v92 = 290;
                        __int16 v93 = 2112;
                        uint64_t v94 = (uint64_t)v52;
                        __int16 v95 = 2048;
                        v96 = v6;
                        v74 = " [%s] %s:%d %@(%p) Failed to setup the stream inputs";
LABEL_169:
                        _os_log_error_impl(&dword_1E1EA4000, v73, OS_LOG_TYPE_ERROR, v74, buf, 0x30u);
                      }
                    }
                  }
LABEL_201:
                  v22 = 0;
                  goto LABEL_202;
                }
                if ((VCSessionParticipantLocal *)objc_opt_class() == v6)
                {
                  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                  {
                    VRTraceErrorLogLevelToCSTR();
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                      -[VCSessionParticipantLocal initWithConfig:delegate:].cold.6();
                    }
                  }
                  goto LABEL_200;
                }
                if (objc_opt_respondsToSelector()) {
                  v51 = (__CFString *)[(VCSessionParticipantLocal *)v6 performSelector:sel_logPrefix];
                }
                else {
                  v51 = &stru_1F3D3E450;
                }
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  uint64_t v71 = VRTraceErrorLogLevelToCSTR();
                  v59 = *MEMORY[0x1E4F47A50];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136316162;
                    uint64_t v88 = v71;
                    __int16 v89 = 2080;
                    v90 = "-[VCSessionParticipantLocal initWithConfig:delegate:]";
                    __int16 v91 = 1024;
                    int v92 = 287;
                    __int16 v93 = 2112;
                    uint64_t v94 = (uint64_t)v51;
                    __int16 v95 = 2048;
                    v96 = v6;
                    v60 = " [%s] %s:%d %@(%p) Failed to allocate config provider";
                    goto LABEL_199;
                  }
                }
LABEL_200:
                v21 = 0;
                goto LABEL_201;
              }
              v6->_videoCaptureSource = 3;
              if (VCDefaults_GetBoolValueForKey(@"simulateWebRTCOnlyClient", 0))
              {
                v22 = 0;
              }
              else
              {
                v23 = -[VCSessionMediaStreamConfigurationProvider initWithStreamIDGenerator:sessionMode:supportedAudioRules:]([VCSessionMediaStreamConfigurationProvider alloc], "initWithStreamIDGenerator:sessionMode:supportedAudioRules:", v6, [a3 sessionMode], v6->super._supportedAudioRules);
                if (!v23)
                {
                  if ((VCSessionParticipantLocal *)objc_opt_class() == v6)
                  {
                    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                    {
                      VRTraceErrorLogLevelToCSTR();
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                        -[VCSessionParticipantLocal initWithConfig:delegate:]4();
                      }
                    }
                    goto LABEL_200;
                  }
                  if (objc_opt_respondsToSelector()) {
                    v68 = (__CFString *)[(VCSessionParticipantLocal *)v6 performSelector:sel_logPrefix];
                  }
                  else {
                    v68 = &stru_1F3D3E450;
                  }
                  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                  {
                    uint64_t v82 = VRTraceErrorLogLevelToCSTR();
                    v59 = *MEMORY[0x1E4F47A50];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136316162;
                      uint64_t v88 = v82;
                      __int16 v89 = 2080;
                      v90 = "-[VCSessionParticipantLocal initWithConfig:delegate:]";
                      __int16 v91 = 1024;
                      int v92 = 302;
                      __int16 v93 = 2112;
                      uint64_t v94 = (uint64_t)v68;
                      __int16 v95 = 2048;
                      v96 = v6;
                      v60 = " [%s] %s:%d %@(%p) Failed to allocate config provider";
                      goto LABEL_199;
                    }
                  }
                  goto LABEL_200;
                }
                v24 = v23;
                uint64_t v25 = [(VCSessionMediaStreamConfigurationProvider *)v23 audioStreamConfigurations];
                v101 = @"streamGroupID";
                v102[0] = &unk_1F3DC4A88;
                if (!-[VCSessionParticipantLocal setupAudioStreamGroupWithStreamConfigs:negotiatorConfig:streamGroupConfiguration:](v6, "setupAudioStreamGroupWithStreamConfigs:negotiatorConfig:streamGroupConfiguration:", v25, v19, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v102 forKeys:&v101 count:1]))
                {
                  if ((VCSessionParticipantLocal *)objc_opt_class() == v6)
                  {
                    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                    {
                      VRTraceErrorLogLevelToCSTR();
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                        -[VCSessionParticipantLocal initWithConfig:delegate:]6();
                      }
                    }
                  }
                  else
                  {
                    if (objc_opt_respondsToSelector()) {
                      v69 = (__CFString *)[(VCSessionParticipantLocal *)v6 performSelector:sel_logPrefix];
                    }
                    else {
                      v69 = &stru_1F3D3E450;
                    }
                    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                    {
                      uint64_t v83 = VRTraceErrorLogLevelToCSTR();
                      v84 = *MEMORY[0x1E4F47A50];
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 136316162;
                        uint64_t v88 = v83;
                        __int16 v89 = 2080;
                        v90 = "-[VCSessionParticipantLocal initWithConfig:delegate:]";
                        __int16 v91 = 1024;
                        int v92 = 305;
                        __int16 v93 = 2112;
                        uint64_t v94 = (uint64_t)v69;
                        __int16 v95 = 2048;
                        v96 = v6;
                        _os_log_error_impl(&dword_1E1EA4000, v84, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to setup audio streams", buf, 0x30u);
                      }
                    }
                  }
                  v21 = 0;
                  v22 = v24;
                  goto LABEL_202;
                }
                v99[0] = @"streamGroupID";
                v99[1] = @"streamGroupSyncGroupID";
                v100[0] = &unk_1F3DC4AA0;
                v100[1] = &unk_1F3DC4A88;
                v22 = v24;
                if (!-[VCSessionParticipantLocal setupCameraStreamGroupWithStreamConfigs:negotiatorConfig:streamGroupConfiguration:](v6, "setupCameraStreamGroupWithStreamConfigs:negotiatorConfig:streamGroupConfiguration:", -[VCSessionMediaStreamConfigurationProvider videoStreamConfigurations](v24, "videoStreamConfigurations"), v19, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v100 forKeys:v99 count:2]))
                {
                  if ((VCSessionParticipantLocal *)objc_opt_class() == v6)
                  {
                    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                    {
                      VRTraceErrorLogLevelToCSTR();
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                        -[VCSessionParticipantLocal initWithConfig:delegate:]5();
                      }
                    }
                    goto LABEL_211;
                  }
                  if (objc_opt_respondsToSelector()) {
                    v70 = (__CFString *)[(VCSessionParticipantLocal *)v6 performSelector:sel_logPrefix];
                  }
                  else {
                    v70 = &stru_1F3D3E450;
                  }
                  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                  {
                    uint64_t v85 = VRTraceErrorLogLevelToCSTR();
                    v76 = *MEMORY[0x1E4F47A50];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136316162;
                      uint64_t v88 = v85;
                      __int16 v89 = 2080;
                      v90 = "-[VCSessionParticipantLocal initWithConfig:delegate:]";
                      __int16 v91 = 1024;
                      int v92 = 310;
                      __int16 v93 = 2112;
                      uint64_t v94 = (uint64_t)v70;
                      __int16 v95 = 2048;
                      v96 = v6;
                      v77 = " [%s] %s:%d %@(%p) Failed to setup video stream";
                      goto LABEL_213;
                    }
                  }
LABEL_211:
                  v21 = 0;
                  goto LABEL_202;
                }
              }
              v26 = [[VCSessionMediaStreamPresenceConfigurationProvider alloc] initWithConfigurationType:2 supportedAudioRules:v6->super._supportedAudioRules streamIDGenerator:v6];
              if (v26)
              {
                v21 = v26;
                if (![(VCSessionParticipantLocal *)v6 setupStreamInputsWithConfig:v26])
                {
                  if ((VCSessionParticipantLocal *)objc_opt_class() == v6)
                  {
                    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                    {
                      VRTraceErrorLogLevelToCSTR();
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                        -[VCSessionParticipantLocal initWithConfig:delegate:]3();
                      }
                    }
                    goto LABEL_202;
                  }
                  if (objc_opt_respondsToSelector()) {
                    v55 = (__CFString *)[(VCSessionParticipantLocal *)v6 performSelector:sel_logPrefix];
                  }
                  else {
                    v55 = &stru_1F3D3E450;
                  }
                  if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
                    goto LABEL_202;
                  }
                  uint64_t v79 = VRTraceErrorLogLevelToCSTR();
                  v66 = *MEMORY[0x1E4F47A50];
                  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                    goto LABEL_202;
                  }
                  *(_DWORD *)buf = 136316162;
                  uint64_t v88 = v79;
                  __int16 v89 = 2080;
                  v90 = "-[VCSessionParticipantLocal initWithConfig:delegate:]";
                  __int16 v91 = 1024;
                  int v92 = 317;
                  __int16 v93 = 2112;
                  uint64_t v94 = (uint64_t)v55;
                  __int16 v95 = 2048;
                  v96 = v6;
                  v67 = " [%s] %s:%d %@(%p) Failed to setup the stream inputs";
                  goto LABEL_185;
                }
                if (![(VCSessionParticipantLocal *)v6 setupStreamGroupsWithConfig:v21 negotiatorConfig:v19])
                {
                  if ((VCSessionParticipantLocal *)objc_opt_class() == v6)
                  {
                    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                    {
                      VRTraceErrorLogLevelToCSTR();
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                        -[VCSessionParticipantLocal initWithConfig:delegate:]2();
                      }
                    }
                    goto LABEL_202;
                  }
                  if (objc_opt_respondsToSelector()) {
                    v56 = (__CFString *)[(VCSessionParticipantLocal *)v6 performSelector:sel_logPrefix];
                  }
                  else {
                    v56 = &stru_1F3D3E450;
                  }
                  if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
                    goto LABEL_202;
                  }
                  uint64_t v80 = VRTraceErrorLogLevelToCSTR();
                  v66 = *MEMORY[0x1E4F47A50];
                  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                    goto LABEL_202;
                  }
                  *(_DWORD *)buf = 136316162;
                  uint64_t v88 = v80;
                  __int16 v89 = 2080;
                  v90 = "-[VCSessionParticipantLocal initWithConfig:delegate:]";
                  __int16 v91 = 1024;
                  int v92 = 320;
                  __int16 v93 = 2112;
                  uint64_t v94 = (uint64_t)v56;
                  __int16 v95 = 2048;
                  v96 = v6;
                  v67 = " [%s] %s:%d %@(%p) Failed to setup the stream groups";
                  goto LABEL_185;
                }
LABEL_25:
                if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                {
                  uint64_t v27 = VRTraceErrorLogLevelToCSTR();
                  v28 = *MEMORY[0x1E4F47A50];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
                  {
                    videoPayloadTypes = v6->_videoPayloadTypes;
                    audioPayloadTypes = v6->_audioPayloadTypes;
                    *(_DWORD *)buf = 136316162;
                    uint64_t v88 = v27;
                    __int16 v89 = 2080;
                    v90 = "-[VCSessionParticipantLocal initWithConfig:delegate:]";
                    __int16 v91 = 1024;
                    int v92 = 322;
                    __int16 v93 = 2112;
                    uint64_t v94 = (uint64_t)videoPayloadTypes;
                    __int16 v95 = 2112;
                    v96 = (VCSessionParticipantLocal *)audioPayloadTypes;
                    _os_log_impl(&dword_1E1EA4000, v28, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d video payload types=%@, audio payload types=%@", buf, 0x30u);
                  }
                }
                objc_msgSend(-[NSArray objectAtIndexedSubscript:](v6->_uplinkBandwidthAllocators, "objectAtIndexedSubscript:", 0), "addBandwidthAllocationTableEntry:updateNow:", 0, 1);
                if ([(VCSessionParticipantLocal *)v6 initializeMediaNegotiator])
                {
                  if (v6->super._participantInfo)
                  {
                    v6->super._callInfoBlob = [[VCCallInfoBlob alloc] initWithData:[(NSDictionary *)v6->super._participantInfo objectForKeyedSubscript:@"vcSessionParticipantKeyCallInfoBlob"]];
                    v6->super._mediaBlobCompressed = (NSData *)[(NSDictionary *)v6->super._participantInfo objectForKeyedSubscript:@"vcSessionParticipantKeyMediaNegotiationData"];
LABEL_32:
                    [(VCSessionParticipant *)v6 setupMediaTypeSettingsWithConfig:a3];
                    v6->_fecRatio = -1.0;
                    v6->_averageSilenceAudioPower = -120.0;
                    v6->_audioPriorityRampUp = [+[VCDefaults sharedInstance] audioPriorityRampUpSpeed];
                    v6->_audioPriorityDecaySlow = [+[VCDefaults sharedInstance] audioPriorityDecaySlow];
                    v6->_audioPriorityDecayFast = [+[VCDefaults sharedInstance] audioPriorityDecayFast];
                    [+[VCDefaults sharedInstance] audioVoiceDetectionSensitivity];
                    v6->_audioVoiceDetectionSensitivity = v31;
                    float v32 = 2.0
                        / (double)([+[VCDefaults sharedInstance] silenceLevelMovingAveragePeriod]+ 1);
                    v6->_audioSilencePowerAverageMultiplier = v32;
                    v6->_forcedAudioPriorityValue = [+[VCDefaults sharedInstance] forceAudioPriorityValue];
                    v6->_forcedAudioPriorityEnabled = [+[VCDefaults sharedInstance] forceAudioPriorityEnabled];
                    [(VCSessionParticipantLocal *)v6 createOpaqueData];
                    double v33 = micro();
                    v6->_initTime = v33;
                    v6->_lastVideoEnabledChangedTime = v33;
                    v6->_presenceProvider = v21;
                    v6->_isHigherAudioREDCutoverU1Enabled = [a3 isHigherAudioREDCutoverU1Enabled];
                    if ((VCSessionParticipantLocal *)objc_opt_class() == v6)
                    {
                      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
                        goto LABEL_43;
                      }
                      uint64_t v35 = VRTraceErrorLogLevelToCSTR();
                      v36 = *MEMORY[0x1E4F47A50];
                      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
                        goto LABEL_43;
                      }
                      uint64_t v37 = [(VCSessionParticipant *)v6 description];
                      *(_DWORD *)buf = 136315906;
                      uint64_t v88 = v35;
                      __int16 v89 = 2080;
                      v90 = "-[VCSessionParticipantLocal initWithConfig:delegate:]";
                      __int16 v91 = 1024;
                      int v92 = 360;
                      __int16 v93 = 2112;
                      uint64_t v94 = v37;
                      v38 = " [%s] %s:%d Participant init %@";
                      v39 = v36;
                      uint32_t v40 = 38;
                    }
                    else
                    {
                      if (objc_opt_respondsToSelector()) {
                        v34 = (__CFString *)[(VCSessionParticipantLocal *)v6 performSelector:sel_logPrefix];
                      }
                      else {
                        v34 = &stru_1F3D3E450;
                      }
                      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
                        goto LABEL_43;
                      }
                      uint64_t v41 = VRTraceErrorLogLevelToCSTR();
                      v42 = *MEMORY[0x1E4F47A50];
                      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
                        goto LABEL_43;
                      }
                      uint64_t v43 = [(VCSessionParticipant *)v6 description];
                      *(_DWORD *)buf = 136316418;
                      uint64_t v88 = v41;
                      __int16 v89 = 2080;
                      v90 = "-[VCSessionParticipantLocal initWithConfig:delegate:]";
                      __int16 v91 = 1024;
                      int v92 = 360;
                      __int16 v93 = 2112;
                      uint64_t v94 = (uint64_t)v34;
                      __int16 v95 = 2048;
                      v96 = v6;
                      __int16 v97 = 2112;
                      uint64_t v98 = v43;
                      v38 = " [%s] %s:%d %@(%p) Participant init %@";
                      v39 = v42;
                      uint32_t v40 = 58;
                    }
                    _os_log_impl(&dword_1E1EA4000, v39, OS_LOG_TYPE_DEFAULT, v38, buf, v40);
LABEL_43:

                    return v6;
                  }
                  if ([(VCSessionParticipantLocal *)v6 createParticipantInfo]) {
                    goto LABEL_32;
                  }
                  if ((VCSessionParticipantLocal *)objc_opt_class() == v6)
                  {
                    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                    {
                      VRTraceErrorLogLevelToCSTR();
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                        -[VCSessionParticipantLocal initWithConfig:delegate:].cold.7();
                      }
                    }
                    goto LABEL_202;
                  }
                  if (objc_opt_respondsToSelector()) {
                    v57 = (__CFString *)[(VCSessionParticipantLocal *)v6 performSelector:sel_logPrefix];
                  }
                  else {
                    v57 = &stru_1F3D3E450;
                  }
                  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                  {
                    uint64_t v81 = VRTraceErrorLogLevelToCSTR();
                    v66 = *MEMORY[0x1E4F47A50];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136316162;
                      uint64_t v88 = v81;
                      __int16 v89 = 2080;
                      v90 = "-[VCSessionParticipantLocal initWithConfig:delegate:]";
                      __int16 v91 = 1024;
                      int v92 = 332;
                      __int16 v93 = 2112;
                      uint64_t v94 = (uint64_t)v57;
                      __int16 v95 = 2048;
                      v96 = v6;
                      v67 = " [%s] %s:%d %@(%p) Failed to create participant info";
                      goto LABEL_185;
                    }
                  }
LABEL_202:

                  v22 = v21;
                  v21 = (VCSessionMediaStreamPresenceConfigurationProvider *)v6;
                  v6 = 0;
                  goto LABEL_43;
                }
                if ((VCSessionParticipantLocal *)objc_opt_class() == v6)
                {
                  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                  {
                    VRTraceErrorLogLevelToCSTR();
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                      -[VCSessionParticipantLocal initWithConfig:delegate:].cold.8();
                    }
                  }
                  goto LABEL_202;
                }
                if (objc_opt_respondsToSelector()) {
                  v50 = (__CFString *)[(VCSessionParticipantLocal *)v6 performSelector:sel_logPrefix];
                }
                else {
                  v50 = &stru_1F3D3E450;
                }
                if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
                  goto LABEL_202;
                }
                uint64_t v65 = VRTraceErrorLogLevelToCSTR();
                v66 = *MEMORY[0x1E4F47A50];
                if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                  goto LABEL_202;
                }
                *(_DWORD *)buf = 136316162;
                uint64_t v88 = v65;
                __int16 v89 = 2080;
                v90 = "-[VCSessionParticipantLocal initWithConfig:delegate:]";
                __int16 v91 = 1024;
                int v92 = 328;
                __int16 v93 = 2112;
                uint64_t v94 = (uint64_t)v50;
                __int16 v95 = 2048;
                v96 = v6;
                v67 = " [%s] %s:%d %@(%p) Failed to initialize media negotiator";
LABEL_185:
                _os_log_error_impl(&dword_1E1EA4000, v66, OS_LOG_TYPE_ERROR, v67, buf, 0x30u);
                goto LABEL_202;
              }
              if ((VCSessionParticipantLocal *)objc_opt_class() == v6)
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  VRTraceErrorLogLevelToCSTR();
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                    -[VCSessionParticipantLocal initWithConfig:delegate:]1();
                  }
                }
                goto LABEL_211;
              }
              if (objc_opt_respondsToSelector()) {
                v53 = (__CFString *)[(VCSessionParticipantLocal *)v6 performSelector:sel_logPrefix];
              }
              else {
                v53 = &stru_1F3D3E450;
              }
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                uint64_t v75 = VRTraceErrorLogLevelToCSTR();
                v76 = *MEMORY[0x1E4F47A50];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136316162;
                  uint64_t v88 = v75;
                  __int16 v89 = 2080;
                  v90 = "-[VCSessionParticipantLocal initWithConfig:delegate:]";
                  __int16 v91 = 1024;
                  int v92 = 314;
                  __int16 v93 = 2112;
                  uint64_t v94 = (uint64_t)v53;
                  __int16 v95 = 2048;
                  v96 = v6;
                  v77 = " [%s] %s:%d %@(%p) Failed to allocate config provider";
LABEL_213:
                  _os_log_error_impl(&dword_1E1EA4000, v76, OS_LOG_TYPE_ERROR, v77, buf, 0x30u);
                  goto LABEL_211;
                }
              }
              goto LABEL_211;
            }
            if ((VCSessionParticipantLocal *)objc_opt_class() == v6)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                VRTraceErrorLogLevelToCSTR();
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                  -[VCSessionParticipantLocal initWithConfig:delegate:].cold.5();
                }
              }
              goto LABEL_200;
            }
            if (objc_opt_respondsToSelector()) {
              v49 = (__CFString *)[(VCSessionParticipantLocal *)v6 performSelector:sel_logPrefix];
            }
            else {
              v49 = &stru_1F3D3E450;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
              goto LABEL_200;
            }
            uint64_t v64 = VRTraceErrorLogLevelToCSTR();
            v59 = *MEMORY[0x1E4F47A50];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              goto LABEL_200;
            }
            *(_DWORD *)buf = 136316162;
            uint64_t v88 = v64;
            __int16 v89 = 2080;
            v90 = "-[VCSessionParticipantLocal initWithConfig:delegate:]";
            __int16 v91 = 1024;
            int v92 = 273;
            __int16 v93 = 2112;
            uint64_t v94 = (uint64_t)v49;
            __int16 v95 = 2048;
            v96 = v6;
            v60 = " [%s] %s:%d %@(%p) Failed to create uplinkBandwidthAllocators";
          }
          else
          {
            if ((VCSessionParticipantLocal *)objc_opt_class() == v6)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                VRTraceErrorLogLevelToCSTR();
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                  -[VCSessionParticipantLocal initWithConfig:delegate:].cold.4();
                }
              }
              goto LABEL_200;
            }
            if (objc_opt_respondsToSelector()) {
              v48 = (__CFString *)[(VCSessionParticipantLocal *)v6 performSelector:sel_logPrefix];
            }
            else {
              v48 = &stru_1F3D3E450;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
              goto LABEL_200;
            }
            uint64_t v63 = VRTraceErrorLogLevelToCSTR();
            v59 = *MEMORY[0x1E4F47A50];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              goto LABEL_200;
            }
            *(_DWORD *)buf = 136316162;
            uint64_t v88 = v63;
            __int16 v89 = 2080;
            v90 = "-[VCSessionParticipantLocal initWithConfig:delegate:]";
            __int16 v91 = 1024;
            int v92 = 270;
            __int16 v93 = 2112;
            uint64_t v94 = (uint64_t)v48;
            __int16 v95 = 2048;
            v96 = v6;
            v60 = " [%s] %s:%d %@(%p) Failed to allocate oneToOne streamInfo dictionary";
          }
        }
        else
        {
          if ((VCSessionParticipantLocal *)objc_opt_class() == v6)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                -[VCSessionParticipantLocal initWithConfig:delegate:]();
              }
            }
            goto LABEL_200;
          }
          if (objc_opt_respondsToSelector()) {
            v47 = (__CFString *)[(VCSessionParticipantLocal *)v6 performSelector:sel_logPrefix];
          }
          else {
            v47 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
            goto LABEL_200;
          }
          uint64_t v62 = VRTraceErrorLogLevelToCSTR();
          v59 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            goto LABEL_200;
          }
          *(_DWORD *)buf = 136316162;
          uint64_t v88 = v62;
          __int16 v89 = 2080;
          v90 = "-[VCSessionParticipantLocal initWithConfig:delegate:]";
          __int16 v91 = 1024;
          int v92 = 259;
          __int16 v93 = 2112;
          uint64_t v94 = (uint64_t)v47;
          __int16 v95 = 2048;
          v96 = v6;
          v60 = " [%s] %s:%d %@(%p) Failed to allocate power spectrum source";
        }
      }
      else
      {
        if ((VCSessionParticipantLocal *)objc_opt_class() == v6)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCSessionParticipantLocal initWithConfig:delegate:]();
            }
          }
          goto LABEL_200;
        }
        if (objc_opt_respondsToSelector()) {
          v46 = (__CFString *)[(VCSessionParticipantLocal *)v6 performSelector:sel_logPrefix];
        }
        else {
          v46 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_200;
        }
        uint64_t v61 = VRTraceErrorLogLevelToCSTR();
        v59 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          goto LABEL_200;
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v88 = v61;
        __int16 v89 = 2080;
        v90 = "-[VCSessionParticipantLocal initWithConfig:delegate:]";
        __int16 v91 = 1024;
        int v92 = 256;
        __int16 v93 = 2112;
        uint64_t v94 = (uint64_t)v46;
        __int16 v95 = 2048;
        v96 = v6;
        v60 = " [%s] %s:%d %@(%p) Failed to allocate generated SSRC set";
      }
    }
    else
    {
      if ((VCSessionParticipantLocal *)objc_opt_class() == v6)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSessionParticipantLocal initWithConfig:delegate:]();
          }
        }
        goto LABEL_200;
      }
      if (objc_opt_respondsToSelector()) {
        v45 = (__CFString *)[(VCSessionParticipantLocal *)v6 performSelector:sel_logPrefix];
      }
      else {
        v45 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_200;
      }
      uint64_t v58 = VRTraceErrorLogLevelToCSTR();
      v59 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_200;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v88 = v58;
      __int16 v89 = 2080;
      v90 = "-[VCSessionParticipantLocal initWithConfig:delegate:]";
      __int16 v91 = 1024;
      int v92 = 254;
      __int16 v93 = 2112;
      uint64_t v94 = (uint64_t)v45;
      __int16 v95 = 2048;
      v96 = v6;
      v60 = " [%s] %s:%d %@(%p) Failed to allocate generated stream ID set";
    }
LABEL_199:
    _os_log_error_impl(&dword_1E1EA4000, v59, OS_LOG_TYPE_ERROR, v60, buf, 0x30u);
    goto LABEL_200;
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  [(VCSessionParticipantLocal *)self cleanupStreamInputs];
  v3 = +[VCAudioPowerSpectrumManager sharedInstance];
  -[VCAudioPowerSpectrumManager unregisterAudioPowerSpectrumSourceForStreamToken:](v3, "unregisterAudioPowerSpectrumSourceForStreamToken:", objc_msgSend(NSNumber, "numberWithInteger:", -[VCAudioPowerSpectrumSource streamToken](self->_powerSpectrumSource, "streamToken")));
  [(VCAudioPowerSpectrumSource *)self->_powerSpectrumSource invalidate];

  pthread_rwlock_destroy(&self->_audioTimestampRWLock);
  [(VCRedundancyControllerAudio *)self->_oneToOneSettings.audioRedundancyController unregisterStatistics];

  v4.receiver = self;
  v4.super_class = (Class)VCSessionParticipantLocal;
  [(VCSessionParticipant *)&v4 dealloc];
}

- (void)logDashboardLinks
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [NSString stringWithFormat:@"https://avc-gft-dashboard.apple.com/multiway/conference/%@", self->super._uuid];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    objc_super v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v10 = v3;
      __int16 v11 = 2080;
      int v12 = "-[VCSessionParticipantLocal logDashboardLinks]";
      __int16 v13 = 1024;
      int v14 = 400;
      __int16 v15 = 2112;
      uint64_t v16 = v2;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCDashboard Participant DisplayURL=%@", buf, 0x26u);
    }
  }
  CFTypeRef v5 = VCGetSerialNumber();
  if (v5)
  {
    uint64_t v6 = [NSString stringWithFormat:@"https://avc-gft-dashboard.apple.com/multiway?serial=%@", v5];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      BOOL v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v10 = v7;
        __int16 v11 = 2080;
        int v12 = "-[VCSessionParticipantLocal logDashboardLinks]";
        __int16 v13 = 1024;
        int v14 = 404;
        __int16 v15 = 2112;
        uint64_t v16 = v6;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCDashboard Serial DisplayURL=%@", buf, 0x26u);
      }
    }
  }
}

- (id)newUplinkBandwidthAllocators
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
  if (!v3)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantLocal newUplinkBandwidthAllocators]();
        }
      }
      goto LABEL_31;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v9 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v9 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_31;
    }
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    __int16 v13 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_31;
    }
    int v18 = 136316162;
    uint64_t v19 = v12;
    __int16 v20 = 2080;
    v21 = "-[VCSessionParticipantLocal newUplinkBandwidthAllocators]";
    __int16 v22 = 1024;
    int v23 = 414;
    __int16 v24 = 2112;
    uint64_t v25 = v9;
    __int16 v26 = 2048;
    uint64_t v27 = self;
    int v14 = " [%s] %s:%d %@(%p) Failed to create bandwith allocator array";
    goto LABEL_38;
  }
  objc_super v4 = objc_alloc_init(VCSessionUplinkBandwidthAllocatorMultiway);
  if (!v4)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantLocal newUplinkBandwidthAllocators]();
        }
      }
      goto LABEL_31;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v10 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v10 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (uint64_t v15 = VRTraceErrorLogLevelToCSTR(),
          __int16 v13 = *MEMORY[0x1E4F47A50],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
LABEL_31:
      CFTypeRef v5 = 0;
LABEL_32:

      return 0;
    }
    int v18 = 136316162;
    uint64_t v19 = v15;
    __int16 v20 = 2080;
    v21 = "-[VCSessionParticipantLocal newUplinkBandwidthAllocators]";
    __int16 v22 = 1024;
    int v23 = 416;
    __int16 v24 = 2112;
    uint64_t v25 = v10;
    __int16 v26 = 2048;
    uint64_t v27 = self;
    int v14 = " [%s] %s:%d %@(%p) Failed to create VCSessionUplinkBandwidthAllocatorMultiway";
LABEL_38:
    _os_log_error_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v18, 0x30u);
    goto LABEL_31;
  }
  CFTypeRef v5 = v4;
  uint64_t v6 = objc_alloc_init(VCSessionUplinkBandwidthAllocatorOneToOne);
  if (!v6)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantLocal newUplinkBandwidthAllocators]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v11 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v11 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v16 = VRTraceErrorLogLevelToCSTR();
        uint64_t v17 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v18 = 136316162;
          uint64_t v19 = v16;
          __int16 v20 = 2080;
          v21 = "-[VCSessionParticipantLocal newUplinkBandwidthAllocators]";
          __int16 v22 = 1024;
          int v23 = 418;
          __int16 v24 = 2112;
          uint64_t v25 = v11;
          __int16 v26 = 2048;
          uint64_t v27 = self;
          _os_log_error_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to create VCSessionUplinkBandwidthAllocatorOneToOne", (uint8_t *)&v18, 0x30u);
        }
      }
    }
    goto LABEL_32;
  }
  uint64_t v7 = v6;
  [v3 addObject:v5];
  [v3 addObject:v7];

  return v3;
}

- (id)processCachedParticipantData:(id)a3
{
  if (!a3)
  {
LABEL_17:
    uint64_t v9 = 0;
LABEL_18:
    __int16 v11 = 0;
    goto LABEL_7;
  }
  id v4 = +[VCSessionParticipant participantInfoWithParticipantData:](VCSessionParticipant, "participantInfoWithParticipantData:");
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionParticipantLocal processCachedParticipantData:]();
      }
    }
    goto LABEL_17;
  }
  CFTypeRef v5 = v4;
  uint64_t v6 = [v4 objectForKeyedSubscript:@"vcSessionParticipantKeyMediaNegotiationData"];
  if (!v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionParticipantLocal processCachedParticipantData:]();
      }
    }
    goto LABEL_17;
  }
  uint64_t v7 = v6;
  BOOL v8 = objc_alloc_init(VCMediaNegotiatorLocalConfiguration);
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionParticipantLocal processCachedParticipantData:]();
      }
    }
    goto LABEL_17;
  }
  uint64_t v9 = v8;
  if (!+[VCSessionMediaNegotiator initializeLocalConfiguration:v8 negotiationData:v7 deviceRole:0 preferredAudioPayload:104])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionParticipantLocal processCachedParticipantData:].cold.4();
      }
    }
    goto LABEL_18;
  }
  self->_isOneToOneAuthenticationTagEnabled = [(VCMediaNegotiatorLocalConfiguration *)v9 isOneToOneAuthTagEnabled];

  uint64_t v10 = (NSString *)objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", @"vcSessionParticipantKeyUUID"), "copy");
  self->super._uuid = v10;
  -[VCObject setLogPrefix:](self, "setLogPrefix:", [NSString stringWithFormat:@"uuid:%@ ", v10]);
  self->super._participantInfo = (NSDictionary *)v5;
  __int16 v11 = v9;
LABEL_7:

  return v11;
}

- (void)updateAudioSpectrumState
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  BOOL v3 = self->super._videoEnabled && !self->super._videoPaused;
  int v4 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._mediaTypeSettingsDict, "objectForKeyedSubscript:", &unk_1F3DC4AB8), "mediaState");
  int v5 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._mediaTypeSettingsDict, "objectForKeyedSubscript:", &unk_1F3DC4AD0), "mediaState");
  int v6 = v5;
  int presentationState = self->super._presentationState;
  if (v3 || (!self->super._presentationState ? (BOOL v8 = v4 == 1) : (BOOL v8 = 1), !v8 ? (v9 = v5 == 1) : (v9 = 1), v9)) {
    char EnableAudioPowerSpectrumReport = VCTestMonitorManager_GetEnableAudioPowerSpectrumReport();
  }
  else {
    char EnableAudioPowerSpectrumReport = 1;
  }
  self->_BOOL isAudioPowerSpectrumEnabled = EnableAudioPowerSpectrumReport;
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
      goto LABEL_30;
    }
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    __int16 v13 = *MEMORY[0x1E4F47A50];
    int v14 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_30;
      }
      int v15 = VCTestMonitorManager_GetEnableAudioPowerSpectrumReport();
      BOOL isAudioPowerSpectrumEnabled = self->_isAudioPowerSpectrumEnabled;
      *(_DWORD *)buf = 136317186;
      uint64_t v43 = v12;
      __int16 v44 = 2080;
      v45 = "-[VCSessionParticipantLocal updateAudioSpectrumState]";
      __int16 v46 = 1024;
      int v47 = 475;
      __int16 v48 = 1024;
      *(_DWORD *)v49 = v3;
      *(_WORD *)&v49[4] = 1024;
      *(_DWORD *)&v49[6] = v4 == 1;
      LOWORD(v50) = 1024;
      *(_DWORD *)((char *)&v50 + 2) = v6 == 1;
      HIWORD(v50) = 1024;
      *(_DWORD *)v51 = presentationState == 0;
      *(_WORD *)&v51[4] = 1024;
      *(_DWORD *)v52 = v15;
      *(_WORD *)&v52[4] = 1024;
      *(_DWORD *)v53 = isAudioPowerSpectrumEnabled;
      uint64_t v17 = " [%s] %s:%d is2DCameraActive=%d is3DCameraActive=%d is3DCameraAltActive=%d isForeground=%d testEnabled=%d =>"
            " spectrumEnabled=%d";
      int v18 = v13;
      uint32_t v19 = 64;
LABEL_26:
      _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
      goto LABEL_30;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      int v35 = VCTestMonitorManager_GetEnableAudioPowerSpectrumReport();
      BOOL v36 = self->_isAudioPowerSpectrumEnabled;
      *(_DWORD *)buf = 136317186;
      uint64_t v43 = v12;
      __int16 v44 = 2080;
      v45 = "-[VCSessionParticipantLocal updateAudioSpectrumState]";
      __int16 v46 = 1024;
      int v47 = 475;
      __int16 v48 = 1024;
      *(_DWORD *)v49 = v3;
      *(_WORD *)&v49[4] = 1024;
      *(_DWORD *)&v49[6] = v4 == 1;
      LOWORD(v50) = 1024;
      *(_DWORD *)((char *)&v50 + 2) = v6 == 1;
      HIWORD(v50) = 1024;
      *(_DWORD *)v51 = presentationState == 0;
      *(_WORD *)&v51[4] = 1024;
      *(_DWORD *)v52 = v35;
      *(_WORD *)&v52[4] = 1024;
      *(_DWORD *)v53 = v36;
      uint64_t v27 = " [%s] %s:%d is2DCameraActive=%d is3DCameraActive=%d is3DCameraAltActive=%d isForeground=%d testEnabled=%d =>"
            " spectrumEnabled=%d";
      uint64_t v28 = v13;
      uint32_t v29 = 64;
      goto LABEL_39;
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      __int16 v11 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v11 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E4F47A50];
      __int16 v22 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_30;
        }
        int v23 = VCTestMonitorManager_GetEnableAudioPowerSpectrumReport();
        BOOL v24 = self->_isAudioPowerSpectrumEnabled;
        *(_DWORD *)buf = 136317698;
        uint64_t v43 = v20;
        __int16 v44 = 2080;
        v45 = "-[VCSessionParticipantLocal updateAudioSpectrumState]";
        __int16 v46 = 1024;
        int v47 = 475;
        __int16 v48 = 2112;
        *(void *)v49 = v11;
        *(_WORD *)&v49[8] = 2048;
        v50 = self;
        *(_WORD *)v51 = 1024;
        *(_DWORD *)&v51[2] = v3;
        *(_WORD *)v52 = 1024;
        *(_DWORD *)&v52[2] = v4 == 1;
        *(_WORD *)v53 = 1024;
        *(_DWORD *)&v53[2] = v6 == 1;
        __int16 v54 = 1024;
        BOOL v55 = presentationState == 0;
        __int16 v56 = 1024;
        int v57 = v23;
        __int16 v58 = 1024;
        BOOL v59 = v24;
        uint64_t v17 = " [%s] %s:%d %@(%p) is2DCameraActive=%d is3DCameraActive=%d is3DCameraAltActive=%d isForeground=%d testEnab"
              "led=%d => spectrumEnabled=%d";
        int v18 = v21;
        uint32_t v19 = 84;
        goto LABEL_26;
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        int v25 = VCTestMonitorManager_GetEnableAudioPowerSpectrumReport();
        BOOL v26 = self->_isAudioPowerSpectrumEnabled;
        *(_DWORD *)buf = 136317698;
        uint64_t v43 = v20;
        __int16 v44 = 2080;
        v45 = "-[VCSessionParticipantLocal updateAudioSpectrumState]";
        __int16 v46 = 1024;
        int v47 = 475;
        __int16 v48 = 2112;
        *(void *)v49 = v11;
        *(_WORD *)&v49[8] = 2048;
        v50 = self;
        *(_WORD *)v51 = 1024;
        *(_DWORD *)&v51[2] = v3;
        *(_WORD *)v52 = 1024;
        *(_DWORD *)&v52[2] = v4 == 1;
        *(_WORD *)v53 = 1024;
        *(_DWORD *)&v53[2] = v6 == 1;
        __int16 v54 = 1024;
        BOOL v55 = presentationState == 0;
        __int16 v56 = 1024;
        int v57 = v25;
        __int16 v58 = 1024;
        BOOL v59 = v26;
        uint64_t v27 = " [%s] %s:%d %@(%p) is2DCameraActive=%d is3DCameraActive=%d is3DCameraAltActive=%d isForeground=%d testEnab"
              "led=%d => spectrumEnabled=%d";
        uint64_t v28 = v21;
        uint32_t v29 = 84;
LABEL_39:
        _os_log_debug_impl(&dword_1E1EA4000, v28, OS_LOG_TYPE_DEBUG, v27, buf, v29);
      }
    }
  }
LABEL_30:
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  micStreamGroups = self->super._micStreamGroups;
  uint64_t v31 = [(NSMutableArray *)micStreamGroups countByEnumeratingWithState:&v38 objects:v37 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v39 != v33) {
          objc_enumerationMutation(micStreamGroups);
        }
        [*(id *)(*((void *)&v38 + 1) + 8 * i) setPowerSpectrumEnabled:self->_isAudioPowerSpectrumEnabled];
      }
      uint64_t v32 = [(NSMutableArray *)micStreamGroups countByEnumeratingWithState:&v38 objects:v37 count:16];
    }
    while (v32);
  }
}

- (BOOL)isParticipantIDBasedKeyLookupEnabled
{
  return 0;
}

- (unsigned)mediaStateForMediaType:(unsigned int)a3
{
  switch(a3)
  {
    case 0u:
      if (!self->super._audioEnabled) {
        goto LABEL_16;
      }
      int v5 = &OBJC_IVAR___VCSessionParticipant__audioPaused;
      goto LABEL_9;
    case 1u:
      if (!self->super._videoEnabled) {
        goto LABEL_16;
      }
      int v5 = &OBJC_IVAR___VCSessionParticipant__videoPaused;
LABEL_9:
      uint64_t v6 = *v5;
      goto LABEL_13;
    case 2u:
      return self->super._screenEnabled;
    case 3u:
      if (!self->super._screenEnabled) {
        goto LABEL_16;
      }
      uint64_t v6 = 1024;
LABEL_13:
      if (*((unsigned char *)&self->super.super.super.isa + v6)) {
        unsigned int result = 2;
      }
      else {
        unsigned int result = 1;
      }
      break;
    case 4u:
    case 5u:
    case 6u:
    case 7u:
    case 8u:
      BOOL v3 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._mediaTypeSettingsDict, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:"));
      return [v3 mediaState];
    default:
LABEL_16:
      unsigned int result = 0;
      break;
  }
  return result;
}

- (BOOL)setupAudioStreamGroupWithStreamConfigs:(id)a3 negotiatorConfig:(id)a4 streamGroupConfiguration:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  BOOL v7 = [(VCSessionParticipantLocal *)self setupAudioStreamsWithStreamConfigurations:a3 mediaNegotiatorConfig:a4 streamGroupConfiguration:a5];
  if (v7)
  {
    BOOL v8 = [(VCSessionParticipant *)self isPersonaCameraEnabled];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    micStreamGroups = self->super._micStreamGroups;
    uint64_t v10 = [(NSMutableArray *)micStreamGroups countByEnumeratingWithState:&v21 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      unsigned int v13 = !v8;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(micStreamGroups);
          }
          if (self->super._videoEnabled) {
            uint64_t v15 = 0;
          }
          else {
            uint64_t v15 = v13;
          }
          [*(id *)(*((void *)&v21 + 1) + 8 * i) setCurrentDTXEnabled:v15];
        }
        uint64_t v11 = [(NSMutableArray *)micStreamGroups countByEnumeratingWithState:&v21 objects:v20 count:16];
      }
      while (v11);
    }
    [(VCSessionParticipantLocal *)self updatePayloadTypesWithAudioConfigs:a3];
  }
  else if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionParticipantLocal setupAudioStreamGroupWithStreamConfigs:negotiatorConfig:streamGroupConfiguration:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v17 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v17 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      uint32_t v19 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v26 = v18;
        __int16 v27 = 2080;
        uint64_t v28 = "-[VCSessionParticipantLocal setupAudioStreamGroupWithStreamConfigs:negotiatorConfig:streamGroupConfiguration:]";
        __int16 v29 = 1024;
        int v30 = 509;
        __int16 v31 = 2112;
        uint64_t v32 = v17;
        __int16 v33 = 2048;
        v34 = self;
        _os_log_error_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to setup audio streams", buf, 0x30u);
      }
    }
  }
  return v7;
}

- (BOOL)setupCameraStreamGroupWithStreamConfigs:(id)a3 negotiatorConfig:(id)a4 streamGroupConfiguration:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (![a3 count])
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantLocal setupCameraStreamGroupWithStreamConfigs:negotiatorConfig:streamGroupConfiguration:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v10 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v10 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        unsigned int v13 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v17 = 136316162;
          uint64_t v18 = v12;
          __int16 v19 = 2080;
          uint64_t v20 = "-[VCSessionParticipantLocal setupCameraStreamGroupWithStreamConfigs:negotiatorConfig:streamGroupConfiguration:]";
          __int16 v21 = 1024;
          int v22 = 525;
          __int16 v23 = 2112;
          long long v24 = v10;
          __int16 v25 = 2048;
          uint64_t v26 = self;
          _os_log_error_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) No video streams to set up", (uint8_t *)&v17, 0x30u);
        }
      }
    }
    goto LABEL_4;
  }
  if ([(VCSessionParticipantLocal *)self setupVideoStreamsWithStreamConfigurations:a3 mediaNegotiatorConfig:a4 streamGroupConfiguration:a5])
  {
    [(VCSessionParticipantLocal *)self updatePayloadTypesWithVideoConfigs:a3];
LABEL_4:
    LOBYTE(v9) = 1;
    return v9;
  }
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v9) {
        return v9;
      }
      -[VCSessionParticipantLocal setupCameraStreamGroupWithStreamConfigs:negotiatorConfig:streamGroupConfiguration:]();
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v11 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v11 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      uint64_t v15 = *MEMORY[0x1E4F47A50];
      BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v9) {
        return v9;
      }
      int v17 = 136316162;
      uint64_t v18 = v14;
      __int16 v19 = 2080;
      uint64_t v20 = "-[VCSessionParticipantLocal setupCameraStreamGroupWithStreamConfigs:negotiatorConfig:streamGroupConfiguration:]";
      __int16 v21 = 1024;
      int v22 = 527;
      __int16 v23 = 2112;
      long long v24 = v11;
      __int16 v25 = 2048;
      uint64_t v26 = self;
      _os_log_error_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to setup video stream", (uint8_t *)&v17, 0x30u);
    }
  }
  LOBYTE(v9) = 0;
  return v9;
}

- (void)setupSystemAudioCapture
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(VCSessionParticipantLocal *)self getAudioFormatDescriptionForStreamGroupID:1835623282];
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(v3);
  *(_OWORD *)uint64_t v6 = xmmword_1E25A01A8;
  memset(&v6[2], 170, 40);
  LODWORD(v6[0]) = -1;
  LODWORD(v7) = self->super._deviceRole;
  HIDWORD(v7) = 6;
  int processId = self->super._processId;
  LODWORD(v8) = self->super._transportSessionID;
  HIDWORD(v8) = processId;
  LODWORD(v6[6]) = -[VCSessionParticipant preferredIOSamplesPerFrameForGroupID:](self, "preferredIOSamplesPerFrameForGroupID:", 1835623282, v6[0], *(void *)&StreamBasicDescription->mSampleRate, *(void *)&StreamBasicDescription->mFormatID, *(void *)&StreamBasicDescription->mBytesPerPacket, *(void *)&StreamBasicDescription->mBytesPerFrame, *(void *)&StreamBasicDescription->mBitsPerChannel, v6[6], v7, v8);
  self->_systemAudioCaptureSession = [[VCSystemAudioCaptureSession alloc] initWithConfiguration:v6];
  CFRelease(v3);
}

- (int)captureSourceIDFromStreamGroupID:(unsigned int)a3
{
  int result = 4;
  if ((int)a3 > 1835623286)
  {
    if ((int)a3 > 1936290408)
    {
      if (a3 == 1936290409) {
        return 7;
      }
      if (a3 == 1937339233) {
        return 5;
      }
      return 0;
    }
    if (a3 != 1835623287) {
      return a3 == 1935897189;
    }
  }
  else
  {
    if ((int)a3 <= 1667330163)
    {
      if (a3 == 1667329381 || a3 == 1667329399) {
        return 3;
      }
      return 0;
    }
    if (a3 != 1667330164 && a3 != 1835623282) {
      return 0;
    }
  }
  return result;
}

- (int)captureSourceIDFromStreamGroupConfig:(id)a3
{
  int v5 = (void *)[a3 objectForKeyedSubscript:@"streamGroupID"];
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      int result = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!result) {
        return result;
      }
      -[VCSessionParticipantLocal captureSourceIDFromStreamGroupConfig:]();
    }
    return 0;
  }
  int result = -[VCSessionParticipantLocal captureSourceIDFromStreamGroupID:](self, "captureSourceIDFromStreamGroupID:", [v5 unsignedIntValue]);
  if (result) {
    return result;
  }
  uint64_t v7 = [a3 objectForKeyedSubscript:@"streamInputID"];
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      int result = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!result) {
        return result;
      }
      -[VCSessionParticipantLocal captureSourceIDFromStreamGroupConfig:]();
    }
    return 0;
  }
  uint64_t v8 = (void *)[(NSMutableDictionary *)self->_streamInputIDToCaptureSourceIDMap objectForKeyedSubscript:v7];
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      int result = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!result) {
        return result;
      }
      -[VCSessionParticipantLocal captureSourceIDFromStreamGroupConfig:](v9);
    }
    return 0;
  }

  return [v8 unsignedIntValue];
}

- (BOOL)setupStreamGroupWithStreamGroupConfig:(id)a3 negotiatorConfig:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  int v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"streamGroupMediaType"), "unsignedIntValue");
  uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"streamGroupID"), "unsignedIntValue");
  int v9 = [(VCSessionParticipantLocal *)self captureSourceIDFromStreamGroupConfig:a3];
  if (!-[NSMutableDictionary objectForKeyedSubscript:](self->super._participantStreamTokens, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v8]))
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._participantStreamTokens, "setObject:forKeyedSubscript:", [NSNumber numberWithInteger:VCUniqueIDGenerator_GenerateID()], objc_msgSend(NSNumber, "numberWithUnsignedInt:", v8));
    if (v7 != 1986618469)
    {
      if (v7 == 1936684398)
      {
        if (!-[VCSessionParticipantLocal setupAudioStreamsWithStreamConfigurations:mediaNegotiatorConfig:streamGroupConfiguration:](self, "setupAudioStreamsWithStreamConfigurations:mediaNegotiatorConfig:streamGroupConfiguration:", [a3 objectForKeyedSubscript:@"streamConfigurations"], a4, a3))goto LABEL_12; {
        goto LABEL_9;
        }
      }
      if (v7 != 1835365473) {
        goto LABEL_12;
      }
    }
    uint64_t v10 = [a3 objectForKeyedSubscript:@"streamConfigurations"];
    if (v8 == 1667330164)
    {
      if (![(VCSessionParticipantLocal *)self setupCaptionsStreamsWithStreamConfigurations:v10 mediaNegotiatorConfig:a4 streamGroupConfiguration:a3])
      {
LABEL_12:
        if ((VCSessionParticipantLocal *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
            if (!v11) {
              return v11;
            }
            -[VCSessionParticipantLocal setupStreamGroupWithStreamGroupConfig:negotiatorConfig:]();
          }
          goto LABEL_23;
        }
        if (objc_opt_respondsToSelector()) {
          uint64_t v12 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
        }
        else {
          uint64_t v12 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v13 = VRTraceErrorLogLevelToCSTR();
          uint64_t v14 = *MEMORY[0x1E4F47A50];
          BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (!v11) {
            return v11;
          }
          int v23 = 136316162;
          uint64_t v24 = v13;
          __int16 v25 = 2080;
          uint64_t v26 = "-[VCSessionParticipantLocal setupStreamGroupWithStreamGroupConfig:negotiatorConfig:]";
          __int16 v27 = 1024;
          int v28 = 635;
          __int16 v29 = 2112;
          int v30 = v12;
          __int16 v31 = 2048;
          uint64_t v32 = self;
          uint64_t v15 = " [%s] %s:%d %@(%p) Failed to setup stream";
          uint64_t v16 = v14;
          uint32_t v17 = 48;
          goto LABEL_22;
        }
        goto LABEL_23;
      }
    }
    else if (![(VCSessionParticipantLocal *)self setupVideoStreamsWithStreamConfigurations:v10 mediaNegotiatorConfig:a4 streamGroupConfiguration:a3])
    {
      goto LABEL_12;
    }
LABEL_9:
    self->_forceMinBitrate = 0;
    self->_minBitrate = 2000000;
    LOBYTE(v11) = 1;
    return v11;
  }
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v11) {
        return v11;
      }
      -[VCSessionParticipantLocal setupStreamGroupWithStreamGroupConfig:negotiatorConfig:](v19);
    }
    goto LABEL_23;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v18 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
  }
  else {
    uint64_t v18 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v20 = VRTraceErrorLogLevelToCSTR();
    __int16 v21 = *MEMORY[0x1E4F47A50];
    BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v11) {
      return v11;
    }
    int v23 = 136316418;
    uint64_t v24 = v20;
    __int16 v25 = 2080;
    uint64_t v26 = "-[VCSessionParticipantLocal setupStreamGroupWithStreamGroupConfig:negotiatorConfig:]";
    __int16 v27 = 1024;
    int v28 = 608;
    __int16 v29 = 2112;
    int v30 = v18;
    __int16 v31 = 2048;
    uint64_t v32 = self;
    __int16 v33 = 1024;
    int v34 = v9;
    uint64_t v15 = " [%s] %s:%d %@(%p) Stream token already assigned for captureSourceID=%d";
    uint64_t v16 = v21;
    uint32_t v17 = 54;
LABEL_22:
    _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v23, v17);
  }
LABEL_23:
  LOBYTE(v11) = 0;
  return v11;
}

- (BOOL)setupStreamGroupMediaSync
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCSessionParticipantLocal;
  BOOL v3 = [(VCSessionParticipant *)&v5 setupStreamGroupMediaSync];
  if (v3) {
    LOBYTE(v3) = [(VCSessionParticipant *)self setupMediaSyncForStreamGroup:[(VCSessionParticipant *)self systemAudioGroup]];
  }
  return v3;
}

- (BOOL)setupStreamGroupsWithConfig:(id)a3 negotiatorConfig:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = (void *)[a3 streamGroupConfigurations];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v18 != v9) {
        objc_enumerationMutation(v6);
      }
      BOOL v11 = *(void **)(*((void *)&v17 + 1) + 8 * v10);
      int v12 = [(VCSessionParticipantLocal *)self captureSourceIDFromStreamGroupConfig:v11];
      if (v12 == 3)
      {
        if (objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", @"streamGroupID"), "unsignedIntValue") == 1667329381)
        {
          if (!-[VCSessionParticipantLocal setupCameraStreamGroupWithStreamConfigs:negotiatorConfig:streamGroupConfiguration:](self, "setupCameraStreamGroupWithStreamConfigs:negotiatorConfig:streamGroupConfiguration:", [v11 objectForKeyedSubscript:@"streamConfigurations"], a4, v11))goto LABEL_20; {
          goto LABEL_15;
          }
        }
      }
      else if (v12 == 4 {
             && objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", @"streamGroupID"), "unsignedIntValue") == 1835623282)
      }
      {
        if (!-[VCSessionParticipantLocal setupAudioStreamGroupWithStreamConfigs:negotiatorConfig:streamGroupConfiguration:](self, "setupAudioStreamGroupWithStreamConfigs:negotiatorConfig:streamGroupConfiguration:", [v11 objectForKeyedSubscript:@"streamConfigurations"], a4, v11))goto LABEL_20; {
        goto LABEL_15;
        }
      }
      if (![(VCSessionParticipantLocal *)self setupStreamGroupWithStreamGroupConfig:v11 negotiatorConfig:a4])
      {
LABEL_20:
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_23;
        }
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        BOOL v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (v13)
        {
          -[VCSessionParticipantLocal setupStreamGroupsWithConfig:negotiatorConfig:](v14);
          goto LABEL_23;
        }
        return v13;
      }
LABEL_15:
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v16 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  if ([(VCSessionParticipantLocal *)self setupStreamGroupMediaSync])
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v13) {
        return v13;
      }
      -[VCSessionParticipantLocal setupStreamGroupsWithConfig:negotiatorConfig:]();
    }
LABEL_23:
    LOBYTE(v13) = 0;
  }
  return v13;
}

- (BOOL)setupStreamInputsWithConfig:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  objc_super v5 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend((id)objc_msgSend(a3, "streamInputConfigurations"), "count"));
  uint64_t v6 = self;
  self->_streamInputIDToCaptureSourceIDMap = v5;
  if (v5)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id obj = (id)[a3 streamInputConfigurations];
    uint64_t v7 = [obj countByEnumeratingWithState:&v18 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "registerStreamInputCaptureSourceWithConfiguration:", *(void *)(*((void *)&v18 + 1) + 8 * i));
          if (!v11)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                -[VCSessionParticipantLocal setupStreamInputsWithConfig:]();
              }
            }
            goto LABEL_14;
          }
          uint64_t v12 = v11;
          uint64_t v13 = objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "streamInputIDForCaptureSourceID:", v11);
          uint64_t v14 = [NSNumber numberWithUnsignedInt:v12];
          -[NSMutableDictionary setObject:forKeyedSubscript:](v6->_streamInputIDToCaptureSourceIDMap, "setObject:forKeyedSubscript:", v14, [NSNumber numberWithInteger:v13]);
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v18 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    return 1;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionParticipantLocal setupStreamInputsWithConfig:]();
      }
    }
LABEL_14:
    [(VCSessionParticipantLocal *)v6 cleanupStreamInputs];
    return 0;
  }
}

- (void)cleanupStreamInputs
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = (void *)[(NSMutableDictionary *)self->_streamInputIDToCaptureSourceIDMap allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v8 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "unregisterStreamInputCaptureSourceWithCaptureSourceID:", objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7++), "unsignedIntValue"));
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v8 count:16];
    }
    while (v5);
  }

  self->_streamInputIDToCaptureSourceIDMap = 0;
}

- (void)start
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([+[VCDefaults sharedInstance] forceFECRepairStream])
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_13;
      }
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v13 = v4;
      __int16 v14 = 2080;
      uint64_t v15 = "-[VCSessionParticipantLocal start]";
      __int16 v16 = 1024;
      int v17 = 721;
      uint64_t v6 = " [%s] %s:%d _enableRedundancy set to YES by forceFECRepairStream";
      uint64_t v7 = v5;
      uint32_t v8 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        BOOL v3 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
      }
      else {
        BOOL v3 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_13;
      }
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      long long v10 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v13 = v9;
      __int16 v14 = 2080;
      uint64_t v15 = "-[VCSessionParticipantLocal start]";
      __int16 v16 = 1024;
      int v17 = 721;
      __int16 v18 = 2112;
      long long v19 = v3;
      __int16 v20 = 2048;
      long long v21 = self;
      uint64_t v6 = " [%s] %s:%d %@(%p) _enableRedundancy set to YES by forceFECRepairStream";
      uint64_t v7 = v10;
      uint32_t v8 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
LABEL_13:
    [(VCSessionParticipantLocal *)self enableRedundancy:1];
  }
  [(VCSessionParticipantLocal *)self startVoiceActivityDetection];
  self->_lastSentAudioHostTime = NAN;
  v11.receiver = self;
  v11.super_class = (Class)VCSessionParticipantLocal;
  [(VCSessionParticipant *)&v11 start];
}

- (void)dispatchedStartOneToOneStreams
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL oneToOneModeEnabled = self->super._oneToOneModeEnabled;
        *(_DWORD *)uint64_t v13 = 136315906;
        *(void *)&v13[4] = v4;
        *(_WORD *)&v13[12] = 2080;
        *(void *)&v13[14] = "-[VCSessionParticipantLocal dispatchedStartOneToOneStreams]";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 730;
        WORD2(v14) = 1024;
        *(_DWORD *)((char *)&v14 + 6) = oneToOneModeEnabled;
        uint64_t v7 = " [%s] %s:%d Starting stream groups with oneToOneModeEnabled=%d";
        uint32_t v8 = v5;
        uint32_t v9 = 34;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, v13, v9);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      BOOL v3 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      BOOL v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      objc_super v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL v12 = self->super._oneToOneModeEnabled;
        *(_DWORD *)uint64_t v13 = 136316418;
        *(void *)&v13[4] = v10;
        *(_WORD *)&v13[12] = 2080;
        *(void *)&v13[14] = "-[VCSessionParticipantLocal dispatchedStartOneToOneStreams]";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 730;
        WORD2(v14) = 2112;
        *(void *)((char *)&v14 + 6) = v3;
        HIWORD(v14) = 2048;
        uint64_t v15 = self;
        LOWORD(v16) = 1024;
        *(_DWORD *)((char *)&v16 + 2) = v12;
        uint64_t v7 = " [%s] %s:%d %@(%p) Starting stream groups with oneToOneModeEnabled=%d";
        uint32_t v8 = v11;
        uint32_t v9 = 54;
        goto LABEL_11;
      }
    }
  }
  [(VCSessionParticipantLocal *)self startMultiwayStreams];
}

- (void)stop
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCSessionParticipantLocal;
  [(VCSessionParticipant *)&v3 stop];
  [(VCSessionParticipantLocal *)self reportVideoEnabledStatsWithVideoEnabled:self->super._videoEnabled];
}

- (int64_t)maxCaptureResolution
{
  if (+[VCHardwareSettings supportsMultiway1080pStream])
  {
    return 20;
  }
  if (+[VCHardwareSettings supportsMultiway720pStream]) {
    return 16;
  }
  return 11;
}

- (void)dispatchedSetAudioEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v8[2] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._participantQueue);
  if (self->super._state == 1 && self->super._audioEnabled != v3)
  {
    unsigned int v6 = [(VCAudioIO *)self->super._audioIO state];
    if (v3)
    {
      if (!v6) {
        [(VCAudioIO *)self->super._audioIO start];
      }
    }
    else if (v6)
    {
      [(VCAudioIO *)self->super._audioIO stop];
    }
    v7.receiver = self;
    uint64_t v5 = &v7;
  }
  else
  {
    v8[0] = self;
    uint64_t v5 = (objc_super *)v8;
  }
  v5->super_class = (Class)VCSessionParticipantLocal;
  [(objc_super *)v5 dispatchedSetAudioEnabled:v3];
}

- (int)maxCaptureCameraFrameRate
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (self->super._oneToOneModeEnabled)
  {
    if (objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_oneToOneSettings.streamInfo, "objectForKeyedSubscript:", &unk_1F3DC4AA0), "streamConfigs"), "count"))
    {
      int v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_oneToOneSettings.streamInfo, "objectForKeyedSubscript:", &unk_1F3DC4AA0), "streamConfigs"), "objectAtIndexedSubscript:", 0), "framerate");
      goto LABEL_7;
    }
    int v3 = +[VCHardwareSettings maxOneToOneFramerateSupported];
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v16 = VRTraceErrorLogLevelToCSTR();
        uint64_t v17 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v24 = 136315906;
          uint64_t v25 = v16;
          __int16 v26 = 2080;
          __int16 v27 = "-[VCSessionParticipantLocal maxCaptureCameraFrameRate]";
          __int16 v28 = 1024;
          int v29 = 776;
          __int16 v30 = 1024;
          LODWORD(v31) = v3;
          __int16 v18 = " [%s] %s:%d no oneToOneSettings video config found, use default maxFrameRate=%d";
          long long v19 = v17;
          uint32_t v20 = 34;
LABEL_32:
          _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v24, v20);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v15 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v15 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v21 = VRTraceErrorLogLevelToCSTR();
        uint64_t v22 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v24 = 136316418;
          uint64_t v25 = v21;
          __int16 v26 = 2080;
          __int16 v27 = "-[VCSessionParticipantLocal maxCaptureCameraFrameRate]";
          __int16 v28 = 1024;
          int v29 = 776;
          __int16 v30 = 2112;
          __int16 v31 = v15;
          __int16 v32 = 2048;
          __int16 v33 = self;
          __int16 v34 = 1024;
          int v35 = v3;
          __int16 v18 = " [%s] %s:%d %@(%p) no oneToOneSettings video config found, use default maxFrameRate=%d";
          long long v19 = v22;
          uint32_t v20 = 54;
          goto LABEL_32;
        }
      }
    }
  }
  else
  {
    unsigned int v4 = +[VCHardwareSettings maxMultiwayFramerateSupported];
    if (v4 >= 0x1E) {
      int v3 = 30;
    }
    else {
      int v3 = v4;
    }
  }
LABEL_7:
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      objc_super v7 = *MEMORY[0x1E4F47A50];
      uint32_t v8 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v24 = 136315906;
          uint64_t v25 = v6;
          __int16 v26 = 2080;
          __int16 v27 = "-[VCSessionParticipantLocal maxCaptureCameraFrameRate]";
          __int16 v28 = 1024;
          int v29 = 781;
          __int16 v30 = 1024;
          LODWORD(v31) = v3;
          uint32_t v9 = " [%s] %s:%d maxFrameRate=%d";
          uint64_t v10 = v7;
          uint32_t v11 = 34;
LABEL_19:
          _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v24, v11);
        }
      }
      else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        -[VCSessionParticipantLocal maxCaptureCameraFrameRate](v6);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint64_t v13 = *MEMORY[0x1E4F47A50];
      long long v14 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          int v24 = 136316418;
          uint64_t v25 = v12;
          __int16 v26 = 2080;
          __int16 v27 = "-[VCSessionParticipantLocal maxCaptureCameraFrameRate]";
          __int16 v28 = 1024;
          int v29 = 781;
          __int16 v30 = 2112;
          __int16 v31 = v5;
          __int16 v32 = 2048;
          __int16 v33 = self;
          __int16 v34 = 1024;
          int v35 = v3;
          uint32_t v9 = " [%s] %s:%d %@(%p) maxFrameRate=%d";
          uint64_t v10 = v13;
          uint32_t v11 = 54;
          goto LABEL_19;
        }
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        int v24 = 136316418;
        uint64_t v25 = v12;
        __int16 v26 = 2080;
        __int16 v27 = "-[VCSessionParticipantLocal maxCaptureCameraFrameRate]";
        __int16 v28 = 1024;
        int v29 = 781;
        __int16 v30 = 2112;
        __int16 v31 = v5;
        __int16 v32 = 2048;
        __int16 v33 = self;
        __int16 v34 = 1024;
        int v35 = v3;
        _os_log_debug_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %@(%p) maxFrameRate=%d", (uint8_t *)&v24, 0x36u);
      }
    }
  }
  return v3;
}

- (void)setUplinkBitrateCapCell:(unsigned int)a3
{
  uint64_t minBitrate = *(void *)&a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      objc_super v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v24 = v6;
        __int16 v25 = 2080;
        __int16 v26 = "-[VCSessionParticipantLocal setUplinkBitrateCapCell:]";
        __int16 v27 = 1024;
        int v28 = 786;
        __int16 v29 = 1024;
        LODWORD(v30) = minBitrate;
        uint32_t v8 = " [%s] %s:%d Setting uplink bit rate cap cell is %d";
        uint32_t v9 = v7;
        uint32_t v10 = 34;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v24 = v11;
        __int16 v25 = 2080;
        __int16 v26 = "-[VCSessionParticipantLocal setUplinkBitrateCapCell:]";
        __int16 v27 = 1024;
        int v28 = 786;
        __int16 v29 = 2112;
        __int16 v30 = v5;
        __int16 v31 = 2048;
        __int16 v32 = self;
        __int16 v33 = 1024;
        int v34 = minBitrate;
        uint32_t v8 = " [%s] %s:%d %@(%p) Setting uplink bit rate cap cell is %d";
        uint32_t v9 = v12;
        uint32_t v10 = 54;
        goto LABEL_11;
      }
    }
  }
  if (self->_forceMinBitrate) {
    uint64_t minBitrate = self->_minBitrate;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v13 = (void *)[(NSMutableDictionary *)self->super._streamGroups allValues];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v18 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "updateUplinkBitrateCapCell:activeStreamIDs:", minBitrate, -[VCSessionUplinkBandwidthAllocator streamIDsForStreamToken:targetBitrateCap:](self->_uplinkBandwidthAllocator, "streamIDsForStreamToken:targetBitrateCap:", objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "streamToken"), minBitrate));
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v18 count:16];
    }
    while (v15);
  }
  self->_uplinkBitrateCapCell = minBitrate;
}

- (void)setUplinkBitrateCapWifi:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      objc_super v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v24 = v6;
        __int16 v25 = 2080;
        __int16 v26 = "-[VCSessionParticipantLocal setUplinkBitrateCapWifi:]";
        __int16 v27 = 1024;
        int v28 = 799;
        __int16 v29 = 1024;
        LODWORD(v30) = v3;
        uint32_t v8 = " [%s] %s:%d Setting uplink bit rate cap wifi is %d";
        uint32_t v9 = v7;
        uint32_t v10 = 34;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v24 = v11;
        __int16 v25 = 2080;
        __int16 v26 = "-[VCSessionParticipantLocal setUplinkBitrateCapWifi:]";
        __int16 v27 = 1024;
        int v28 = 799;
        __int16 v29 = 2112;
        __int16 v30 = v5;
        __int16 v31 = 2048;
        __int16 v32 = self;
        __int16 v33 = 1024;
        int v34 = v3;
        uint32_t v8 = " [%s] %s:%d %@(%p) Setting uplink bit rate cap wifi is %d";
        uint32_t v9 = v12;
        uint32_t v10 = 54;
        goto LABEL_11;
      }
    }
  }
  if (self->_forceMinBitrate) {
    self->_uplinkBitrateCapWifuint64_t i = self->_minBitrate;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v13 = (void *)[(NSMutableDictionary *)self->super._streamGroups allValues];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v18 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "updateUplinkBitrateCapWifi:activeStreamIDs:", v3, -[VCSessionUplinkBandwidthAllocator streamIDsForStreamToken:targetBitrateCap:](self->_uplinkBandwidthAllocator, "streamIDsForStreamToken:targetBitrateCap:", objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "streamToken"), v3));
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v18 count:16];
    }
    while (v15);
  }
  self->_uplinkBitrateCapWifuint64_t i = v3;
}

- (void)setEnableVADFiltering:(BOOL)a3
{
  self->_enableVADFiltering = a3;
  [(VCSessionParticipantLocal *)self updateActiveVoiceOnly];
}

- (BOOL)reconfigureOneToOneAudioStream:(id)a3 error:(id *)a4
{
  v77[1] = *MEMORY[0x1E4F143B8];
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint32_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = v8;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCSessionParticipantLocal reconfigureOneToOneAudioStream:error:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 816;
        uint32_t v10 = " [%s] %s:%d Updating videoEnabled on the oneToOne audio stream";
        uint64_t v11 = v9;
        uint32_t v12 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      objc_super v7 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      objc_super v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      uint64_t v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)&uint8_t buf[4] = v13;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCSessionParticipantLocal reconfigureOneToOneAudioStream:error:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 816;
        *(_WORD *)&buf[28] = 2112;
        *(void *)&buf[30] = v7;
        *(_WORD *)&buf[38] = 2048;
        *(void *)&buf[40] = self;
        uint32_t v10 = " [%s] %s:%d %@(%p) Updating videoEnabled on the oneToOne audio stream";
        uint64_t v11 = v14;
        uint32_t v12 = 48;
        goto LABEL_11;
      }
    }
  }
  uint64_t v15 = [(VCSessionParticipant *)self operatingMode];
  uint64_t v16 = (void *)[a3 defaultStreamConfig];
  if (v15 == [v16 oneToOneOperatingMode])
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        return 1;
      }
      uint64_t v23 = VRTraceErrorLogLevelToCSTR();
      uint64_t v24 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return 1;
      }
      BOOL v25 = [(VCSessionParticipant *)self dispatchedIsAnyCameraMediaTypeEnabled];
      *(_DWORD *)buf = 136316162;
      *(void *)&uint8_t buf[4] = v23;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[VCSessionParticipantLocal reconfigureOneToOneAudioStream:error:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 820;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v15;
      *(_WORD *)&buf[34] = 1024;
      *(_DWORD *)&buf[36] = v25;
      __int16 v26 = " [%s] %s:%d OneToOne Audio Stream is already configured in mode %d for cameraEnabled=%{BOOL}d";
      __int16 v27 = v24;
      uint32_t v28 = 40;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v17 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v17 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        return 1;
      }
      uint64_t v29 = VRTraceErrorLogLevelToCSTR();
      __int16 v30 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return 1;
      }
      BOOL v31 = [(VCSessionParticipant *)self dispatchedIsAnyCameraMediaTypeEnabled];
      *(_DWORD *)buf = 136316674;
      *(void *)&uint8_t buf[4] = v29;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[VCSessionParticipantLocal reconfigureOneToOneAudioStream:error:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 820;
      *(_WORD *)&buf[28] = 2112;
      *(void *)&buf[30] = v17;
      *(_WORD *)&buf[38] = 2048;
      *(void *)&buf[40] = self;
      LOWORD(v66) = 1024;
      *(_DWORD *)((char *)&v66 + 2) = v15;
      WORD3(v66) = 1024;
      DWORD2(v66) = v31;
      __int16 v26 = " [%s] %s:%d %@(%p) OneToOne Audio Stream is already configured in mode %d for cameraEnabled=%{BOOL}d";
      __int16 v27 = v30;
      uint32_t v28 = 60;
    }
    _os_log_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
    return 1;
  }
  if (self->super._audioEnabled && !self->super._audioPaused && [a3 state] == 2)
  {
    [a3 stop];
    [(VCAudioIO *)self->super._audioIO stop];
    int v18 = 1;
  }
  else
  {
    int v18 = 0;
  }
  [v16 setOneToOneOperatingMode:v15];
  v77[0] = v16;
  int v19 = objc_msgSend(a3, "setStreamConfig:withError:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v77, 1), a4);
  if (!*a4 && v19)
  {
    *(void *)&long long v20 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v75 = v20;
    long long v76 = v20;
    long long v73 = v20;
    long long v74 = v20;
    long long v71 = v20;
    long long v72 = v20;
    long long v69 = v20;
    long long v70 = v20;
    long long v67 = v20;
    long long v68 = v20;
    *(_OWORD *)&buf[32] = v20;
    long long v66 = v20;
    *(_OWORD *)buf = v20;
    *(_OWORD *)&buf[16] = v20;
    [(VCSessionParticipantLocal *)self audioIOConfigWithDeviceRole:self->super._deviceRole operatingMode:v15];
    BOOL v21 = [(VCAudioIO *)self->super._audioIO reconfigureWithConfig:buf];
    if (v21)
    {
      if (v18)
      {
        [a3 start];
        [(VCAudioIO *)self->super._audioIO start];
      }
      return v21;
    }
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_57;
      }
      uint64_t v35 = VRTraceErrorLogLevelToCSTR();
      uint64_t v36 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_57;
      }
      audioIO = self->super._audioIO;
      int deviceRole = self->super._deviceRole;
      *(_DWORD *)__int16 v48 = 136316674;
      uint64_t v49 = v35;
      __int16 v50 = 2080;
      v51 = "-[VCSessionParticipantLocal reconfigureOneToOneAudioStream:error:]";
      __int16 v52 = 1024;
      int v53 = 835;
      __int16 v54 = 2048;
      BOOL v55 = audioIO;
      __int16 v56 = 1024;
      *(_DWORD *)int v57 = v15;
      *(_WORD *)&v57[4] = 1024;
      *(_DWORD *)&v57[6] = deviceRole;
      LOWORD(v58) = 1024;
      *(_DWORD *)((char *)&v58 + 2) = buf[20];
      long long v39 = " [%s] %s:%d Failed to reconfigure: audioIO=%p operatingMode=%d deviceRole=%d direction=%d";
      long long v40 = v36;
      uint32_t v41 = 56;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v32 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v32 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_57;
      }
      uint64_t v42 = VRTraceErrorLogLevelToCSTR();
      uint64_t v43 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_57;
      }
      __int16 v44 = self->super._audioIO;
      int v45 = self->super._deviceRole;
      *(_DWORD *)__int16 v48 = 136317186;
      uint64_t v49 = v42;
      __int16 v50 = 2080;
      v51 = "-[VCSessionParticipantLocal reconfigureOneToOneAudioStream:error:]";
      __int16 v52 = 1024;
      int v53 = 835;
      __int16 v54 = 2112;
      BOOL v55 = v32;
      __int16 v56 = 2048;
      *(void *)int v57 = self;
      *(_WORD *)&v57[8] = 2048;
      __int16 v58 = v44;
      __int16 v59 = 1024;
      int v60 = v15;
      __int16 v61 = 1024;
      int v62 = v45;
      __int16 v63 = 1024;
      int v64 = buf[20];
      long long v39 = " [%s] %s:%d %@(%p) Failed to reconfigure: audioIO=%p operatingMode=%d deviceRole=%d direction=%d";
      long long v40 = v43;
      uint32_t v41 = 76;
    }
    _os_log_impl(&dword_1E1EA4000, v40, OS_LOG_TYPE_DEFAULT, v39, v48, v41);
LABEL_57:
    uint64_t v46 = [NSString stringWithFormat:@"%@. Unable to reconfigure _audioIO=%p in _state=%d", -[VCObject logPrefix](self, "logPrefix"), self->super._audioIO, self->super._state];
    *a4 = (id)[MEMORY[0x1E4F28C58] AVConferenceServiceError:32000 detailCode:0 description:v46];
    return v21;
  }
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionParticipantLocal reconfigureOneToOneAudioStream:error:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      long long v22 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      long long v22 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v33 = VRTraceErrorLogLevelToCSTR();
      int v34 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)&uint8_t buf[4] = v33;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCSessionParticipantLocal reconfigureOneToOneAudioStream:error:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 845;
        *(_WORD *)&buf[28] = 2112;
        *(void *)&buf[30] = v22;
        *(_WORD *)&buf[38] = 2048;
        *(void *)&buf[40] = self;
        _os_log_error_impl(&dword_1E1EA4000, v34, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) OneToOne Audio Stream was unable to be reconfigured", buf, 0x30u);
      }
    }
  }
  return 0;
}

- (BOOL)reconfigureAudioIOForMode:(int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint32_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = v8;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCSessionParticipantLocal reconfigureAudioIOForMode:error:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 852;
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = v5;
        uint32_t v10 = " [%s] %s:%d Updating videoEnabled on the local participant audioIO with newMode=%d";
        uint64_t v11 = v9;
        uint32_t v12 = 34;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      objc_super v7 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      objc_super v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      uint64_t v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        *(void *)&uint8_t buf[4] = v13;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCSessionParticipantLocal reconfigureAudioIOForMode:error:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 852;
        *(_WORD *)&buf[28] = 2112;
        *(void *)&buf[30] = v7;
        *(_WORD *)&buf[38] = 2048;
        *(void *)&buf[40] = self;
        LOWORD(v60) = 1024;
        *(_DWORD *)((char *)&v60 + 2) = v5;
        uint32_t v10 = " [%s] %s:%d %@(%p) Updating videoEnabled on the local participant audioIO with newMode=%d";
        uint64_t v11 = v14;
        uint32_t v12 = 54;
        goto LABEL_11;
      }
    }
  }
  if ([(VCAudioIO *)self->super._audioIO operatingMode] == v5)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        return 1;
      }
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      BOOL v21 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return 1;
      }
      BOOL v22 = [(VCSessionParticipant *)self dispatchedIsAnyCameraMediaTypeEnabled];
      *(_DWORD *)buf = 136316162;
      *(void *)&uint8_t buf[4] = v20;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[VCSessionParticipantLocal reconfigureAudioIOForMode:error:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 855;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v5;
      *(_WORD *)&buf[34] = 1024;
      *(_DWORD *)&buf[36] = v22;
      uint64_t v23 = " [%s] %s:%d OneToOne Audio Stream is already configured in mode %d for cameraEnabled=%{BOOL}d";
      uint64_t v24 = v21;
      uint32_t v25 = 40;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v15 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v15 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        return 1;
      }
      uint64_t v26 = VRTraceErrorLogLevelToCSTR();
      __int16 v27 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return 1;
      }
      BOOL v28 = [(VCSessionParticipant *)self dispatchedIsAnyCameraMediaTypeEnabled];
      *(_DWORD *)buf = 136316674;
      *(void *)&uint8_t buf[4] = v26;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[VCSessionParticipantLocal reconfigureAudioIOForMode:error:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 855;
      *(_WORD *)&buf[28] = 2112;
      *(void *)&buf[30] = v15;
      *(_WORD *)&buf[38] = 2048;
      *(void *)&buf[40] = self;
      LOWORD(v60) = 1024;
      *(_DWORD *)((char *)&v60 + 2) = v5;
      WORD3(v60) = 1024;
      DWORD2(v60) = v28;
      uint64_t v23 = " [%s] %s:%d %@(%p) OneToOne Audio Stream is already configured in mode %d for cameraEnabled=%{BOOL}d";
      uint64_t v24 = v27;
      uint32_t v25 = 60;
    }
    _os_log_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);
    return 1;
  }
  unsigned int v16 = [(VCAudioIO *)self->super._audioIO state];
  if (v16 == 2) {
    [(VCAudioIO *)self->super._audioIO stop];
  }
  *(void *)&long long v17 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v69 = v17;
  long long v70 = v17;
  long long v67 = v17;
  long long v68 = v17;
  long long v65 = v17;
  long long v66 = v17;
  long long v63 = v17;
  long long v64 = v17;
  long long v61 = v17;
  long long v62 = v17;
  *(_OWORD *)&buf[32] = v17;
  long long v60 = v17;
  *(_OWORD *)buf = v17;
  *(_OWORD *)&buf[16] = v17;
  [(VCSessionParticipantLocal *)self audioIOConfigWithDeviceRole:self->super._deviceRole operatingMode:v5];
  BOOL v18 = [(VCAudioIO *)self->super._audioIO reconfigureWithConfig:buf];
  if (v18)
  {
    if (v16 == 2) {
      [(VCAudioIO *)self->super._audioIO start];
    }
    return v18;
  }
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v29 = VRTraceErrorLogLevelToCSTR();
      __int16 v30 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        audioIO = self->super._audioIO;
        int deviceRole = self->super._deviceRole;
        *(_DWORD *)uint64_t v42 = 136316674;
        uint64_t v43 = v29;
        __int16 v44 = 2080;
        int v45 = "-[VCSessionParticipantLocal reconfigureAudioIOForMode:error:]";
        __int16 v46 = 1024;
        int v47 = 867;
        __int16 v48 = 2048;
        uint64_t v49 = audioIO;
        __int16 v50 = 1024;
        *(_DWORD *)v51 = v5;
        *(_WORD *)&v51[4] = 1024;
        *(_DWORD *)&unsigned char v51[6] = deviceRole;
        LOWORD(v52) = 1024;
        *(_DWORD *)((char *)&v52 + 2) = buf[20];
        uint64_t v33 = " [%s] %s:%d Failed to reconfigure: audioIO=%p operatingMode=%d deviceRole=%d direction=%d";
        int v34 = v30;
        uint32_t v35 = 56;
LABEL_40:
        _os_log_impl(&dword_1E1EA4000, v34, OS_LOG_TYPE_DEFAULT, v33, v42, v35);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      int v19 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      int v19 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v36 = VRTraceErrorLogLevelToCSTR();
      uint64_t v37 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        long long v38 = self->super._audioIO;
        int v39 = self->super._deviceRole;
        *(_DWORD *)uint64_t v42 = 136317186;
        uint64_t v43 = v36;
        __int16 v44 = 2080;
        int v45 = "-[VCSessionParticipantLocal reconfigureAudioIOForMode:error:]";
        __int16 v46 = 1024;
        int v47 = 867;
        __int16 v48 = 2112;
        uint64_t v49 = v19;
        __int16 v50 = 2048;
        *(void *)v51 = self;
        *(_WORD *)&v51[8] = 2048;
        __int16 v52 = v38;
        __int16 v53 = 1024;
        int v54 = v5;
        __int16 v55 = 1024;
        int v56 = v39;
        __int16 v57 = 1024;
        int v58 = buf[20];
        uint64_t v33 = " [%s] %s:%d %@(%p) Failed to reconfigure: audioIO=%p operatingMode=%d deviceRole=%d direction=%d";
        int v34 = v37;
        uint32_t v35 = 76;
        goto LABEL_40;
      }
    }
  }
  uint64_t v40 = [NSString stringWithFormat:@"%@. Unable to reconfigure _audioIO=%p in _state=%d", -[VCObject logPrefix](self, "logPrefix"), self->super._audioIO, self->super._state];
  if (a4) {
    *a4 = (id)[MEMORY[0x1E4F28C58] AVConferenceServiceError:32000 detailCode:0 description:v40];
  }
  return v18;
}

- (id)startMicStreamGroups
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[(NSMutableArray *)self->super._micStreamGroups mutableCopy];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  micStreamGroups = self->super._micStreamGroups;
  uint64_t v5 = [(NSMutableArray *)micStreamGroups countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(micStreamGroups);
        }
        if (self->super._oneToOneModeEnabled)
        {
          uint32_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (!-[VCSessionParticipantLocal isOneToOneStreamGroup:](self, "isOneToOneStreamGroup:", [v9 streamGroupID]))objc_msgSend(v3, "removeObject:", v9); {
        }
          }
      }
      uint64_t v6 = [(NSMutableArray *)micStreamGroups countByEnumeratingWithState:&v13 objects:v12 count:16];
    }
    while (v6);
  }
  id v10 = [(VCSessionParticipant *)self startStreamGroups:v3];

  return v10;
}

- (id)startCameraStreamGroups
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(VCSessionParticipant *)self cameraGroups];
  unsigned int v4 = (void *)[v3 mutableCopy];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v3);
        }
        if (self->super._oneToOneModeEnabled)
        {
          uint32_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (!-[VCSessionParticipantLocal isOneToOneStreamGroup:](self, "isOneToOneStreamGroup:", [v9 streamGroupID]))objc_msgSend(v4, "removeObject:", v9); {
        }
          }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v13 objects:v12 count:16];
    }
    while (v6);
  }
  id v10 = [(VCSessionParticipant *)self startStreamGroups:v4];

  return v10;
}

- (id)applyVideoEnabledSetting:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  self->super._videoEnabled = a3;
  id v5 = [(VCSessionParticipant *)self updateStreamGroups:[(VCSessionParticipant *)self cameraGroups]];
  if (v5)
  {
    long long v15 = v5;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionParticipantLocal applyVideoEnabledSetting:]();
      }
    }
  }
  else
  {
    id v6 = [(VCSessionParticipantLocal *)self applyMicReconfigurationForCameraTransition];
    if (!v6)
    {
      if (self->super._state == 1)
      {
        if (v3) {
          [(VCSessionParticipantLocal *)self registerForVideoCapture:self->_currentVideoCaptureFrameRate];
        }
        else {
          [(VCSessionParticipantLocal *)self deregisterForVideoCapture];
        }
      }
      [(VCSessionParticipantLocal *)self updateUplinkTargetBitrateForStreamGroups];
      [(VCSessionParticipantLocal *)self reportVideoEnabledStatsWithVideoEnabled:!v3];
      if ((VCSessionParticipantLocal *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
          return 0;
        }
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        uint32_t v9 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          return 0;
        }
        int v25 = 136316162;
        uint64_t v26 = v8;
        __int16 v27 = 2080;
        BOOL v28 = "-[VCSessionParticipantLocal applyVideoEnabledSetting:]";
        __int16 v29 = 1024;
        int v30 = 939;
        __int16 v31 = 2112;
        *(void *)__int16 v32 = [(VCSessionParticipant *)self description];
        *(_WORD *)&v32[8] = 1024;
        *(_DWORD *)&v32[10] = v3;
        id v10 = " [%s] %s:%d %@ videoEnabled[%d]";
        uint64_t v11 = v9;
        uint32_t v12 = 44;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v7 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
        }
        else {
          uint64_t v7 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
          return 0;
        }
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        long long v14 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          return 0;
        }
        int v25 = 136316674;
        uint64_t v26 = v13;
        __int16 v27 = 2080;
        BOOL v28 = "-[VCSessionParticipantLocal applyVideoEnabledSetting:]";
        __int16 v29 = 1024;
        int v30 = 939;
        __int16 v31 = 2112;
        *(void *)__int16 v32 = v7;
        *(_WORD *)&v32[8] = 2048;
        *(void *)&v32[10] = self;
        __int16 v33 = 2112;
        *(void *)int v34 = [(VCSessionParticipant *)self description];
        *(_WORD *)&v34[8] = 1024;
        *(_DWORD *)&v34[10] = v3;
        id v10 = " [%s] %s:%d %@(%p) %@ videoEnabled[%d]";
        uint64_t v11 = v14;
        uint32_t v12 = 64;
      }
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v25, v12);
      return 0;
    }
    long long v15 = v6;
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
        int v19 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v25 = 136316162;
          uint64_t v26 = v18;
          __int16 v27 = 2080;
          BOOL v28 = "-[VCSessionParticipantLocal applyVideoEnabledSetting:]";
          __int16 v29 = 1024;
          int v30 = 924;
          __int16 v31 = 1024;
          *(_DWORD *)__int16 v32 = v3;
          *(_WORD *)&v32[4] = 2112;
          *(void *)&v32[6] = v15;
          uint64_t v20 = " [%s] %s:%d Failed to apply audio reconfigure for videoEnabled=%d error=%@";
          BOOL v21 = v19;
          uint32_t v22 = 44;
LABEL_33:
          _os_log_error_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v25, v22);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v17 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v17 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v23 = VRTraceErrorLogLevelToCSTR();
        uint64_t v24 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v25 = 136316674;
          uint64_t v26 = v23;
          __int16 v27 = 2080;
          BOOL v28 = "-[VCSessionParticipantLocal applyVideoEnabledSetting:]";
          __int16 v29 = 1024;
          int v30 = 924;
          __int16 v31 = 2112;
          *(void *)__int16 v32 = v17;
          *(_WORD *)&v32[8] = 2048;
          *(void *)&v32[10] = self;
          __int16 v33 = 1024;
          *(_DWORD *)int v34 = v3;
          *(_WORD *)&v34[4] = 2112;
          *(void *)&v34[6] = v15;
          uint64_t v20 = " [%s] %s:%d %@(%p) Failed to apply audio reconfigure for videoEnabled=%d error=%@";
          BOOL v21 = v24;
          uint32_t v22 = 64;
          goto LABEL_33;
        }
      }
    }
  }
  return v15;
}

- (void)applyScreenEnabledSetting:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  self->super._screenEnabled = a3;
  [(VCSessionParticipantLocal *)self updateUplinkTargetBitrateForStreamGroups];
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136316162;
        uint64_t v14 = v6;
        __int16 v15 = 2080;
        long long v16 = "-[VCSessionParticipantLocal applyScreenEnabledSetting:]";
        __int16 v17 = 1024;
        int v18 = 947;
        __int16 v19 = 2112;
        p_isa = [(VCSessionParticipant *)self description];
        __int16 v21 = 1024;
        LODWORD(v22) = v3;
        uint64_t v8 = " [%s] %s:%d %@ screenEnabled[%d]";
        uint32_t v9 = v7;
        uint32_t v10 = 44;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      id v5 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      id v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint32_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136316674;
        uint64_t v14 = v11;
        __int16 v15 = 2080;
        long long v16 = "-[VCSessionParticipantLocal applyScreenEnabledSetting:]";
        __int16 v17 = 1024;
        int v18 = 947;
        __int16 v19 = 2112;
        p_isa = &v5->isa;
        __int16 v21 = 2048;
        uint32_t v22 = self;
        __int16 v23 = 2112;
        uint64_t v24 = [(VCSessionParticipant *)self description];
        __int16 v25 = 1024;
        BOOL v26 = v3;
        uint64_t v8 = " [%s] %s:%d %@(%p) %@ screenEnabled[%d]";
        uint32_t v9 = v12;
        uint32_t v10 = 64;
        goto LABEL_11;
      }
    }
  }
}

- (void)updateVideoPaused:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_12;
    }
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_DWORD *)int v13 = 136315906;
    *(void *)&v13[4] = v6;
    *(_WORD *)&v13[12] = 2080;
    *(void *)&v13[14] = "-[VCSessionParticipantLocal updateVideoPaused:]";
    *(_WORD *)&v13[22] = 1024;
    LODWORD(v14) = 951;
    WORD2(v14) = 1024;
    *(_DWORD *)((char *)&v14 + 6) = v3;
    uint64_t v8 = " [%s] %s:%d Changing participant videoPaused to %d";
    uint32_t v9 = v7;
    uint32_t v10 = 34;
    goto LABEL_11;
  }
  if (objc_opt_respondsToSelector()) {
    id v5 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
  }
  else {
    id v5 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    uint32_t v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int v13 = 136316418;
      *(void *)&v13[4] = v11;
      *(_WORD *)&v13[12] = 2080;
      *(void *)&v13[14] = "-[VCSessionParticipantLocal updateVideoPaused:]";
      *(_WORD *)&v13[22] = 1024;
      LODWORD(v14) = 951;
      WORD2(v14) = 2112;
      *(void *)((char *)&v14 + 6) = v5;
      HIWORD(v14) = 2048;
      __int16 v15 = self;
      LOWORD(v16) = 1024;
      *(_DWORD *)((char *)&v16 + 2) = v3;
      uint64_t v8 = " [%s] %s:%d %@(%p) Changing participant videoPaused to %d";
      uint32_t v9 = v12;
      uint32_t v10 = 54;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, v13, v10);
    }
  }
LABEL_12:
  self->super._videoPaused = v3;
  [(VCSessionParticipantLocal *)self updateUplinkTargetBitrateForStreamGroups];
  if (v3) {
    [(VCSessionParticipantLocal *)self deregisterForVideoCapture];
  }
  else {
    [(VCSessionParticipantLocal *)self registerForVideoCapture:self->_currentVideoCaptureFrameRate];
  }
  [(VCSessionParticipantLocal *)self updateAudioSpectrumState];
}

- (void)updateActiveVoiceOnly
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  micStreamGroups = self->super._micStreamGroups;
  uint64_t v4 = [(NSMutableArray *)micStreamGroups countByEnumeratingWithState:&v9 objects:v8 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(micStreamGroups);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) setVADFilteringEnabled:self->_enableVADFiltering];
      }
      uint64_t v5 = [(NSMutableArray *)micStreamGroups countByEnumeratingWithState:&v9 objects:v8 count:16];
    }
    while (v5);
  }
}

- (id)updateMediaState:(unsigned int)a3 forStreamGroups:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)VCSessionParticipantLocal;
  id v5 = [(VCSessionParticipant *)&v7 updateMediaState:*(void *)&a3 forStreamGroups:a4];
  if (!v5) {
    [(VCSessionParticipantLocal *)self dispatchedUpdateUplinkTargetBitrate:self->_currentUplinkTargetBitrate rateChangeCounter:self->_currentRateChangeCounter];
  }
  return v5;
}

- (int)currentVideoCaptureFrameRate
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = -1431655766;
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__VCSessionParticipantLocal_currentVideoCaptureFrameRate__block_invoke;
  block[3] = &unk_1E6DB4540;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(participantQueue, block);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __57__VCSessionParticipantLocal_currentVideoCaptureFrameRate__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 920);
  return result;
}

- (void)setCurrentVideoCaptureFrameRate:(int)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__VCSessionParticipantLocal_setCurrentVideoCaptureFrameRate___block_invoke;
  block[3] = &unk_1E6DB3F08;
  int v5 = a3;
  block[4] = self;
  dispatch_async(participantQueue, block);
}

void __61__VCSessionParticipantLocal_setCurrentVideoCaptureFrameRate___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  unsigned int v2 = *(_DWORD *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2 == *(_DWORD *)(v3 + 920))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      int v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 32);
        int v7 = *(_DWORD *)(v6 + 920);
        LODWORD(v6) = *(_DWORD *)(v6 + 924);
        int v8 = *(_DWORD *)(a1 + 40);
        int v26 = 136316418;
        uint64_t v27 = v4;
        __int16 v28 = 2080;
        __int16 v29 = "-[VCSessionParticipantLocal setCurrentVideoCaptureFrameRate:]_block_invoke";
        __int16 v30 = 1024;
        int v31 = 995;
        __int16 v32 = 1024;
        int v33 = v7;
        __int16 v34 = 1024;
        int v35 = v6;
        __int16 v36 = 1024;
        int v37 = v8;
        int v9 = " [%s] %s:%d Ignoring the change of video captureFrameRate. currentVideoCaptureFrameRate %d maxSupportedMult"
             "iwayFrameRate %d framerate %d";
        uint64_t v10 = v5;
        uint32_t v11 = 46;
LABEL_23:
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v26, v11);
      }
    }
  }
  else
  {
    unsigned int v12 = *(_DWORD *)(v3 + 924);
    if ((int)v2 >= (int)v12) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = v2;
    }
    *(_DWORD *)(v3 + 920) = v13;
    int v14 = [*(id *)(a1 + 32) isEnabledMediaType:1];
    __int16 v15 = *(_DWORD **)(a1 + 32);
    if (v15[42] == 1 && v14 != 0)
    {
      [v15 deregisterForVideoCaptureAndStopProcessingAllMediaRecorderRequests:0];
      [*(id *)(a1 + 32) registerForVideoCapture:v13];
      __int16 v15 = *(_DWORD **)(a1 + 32);
    }
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v17 = (void *)[v15 cameraGroups];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v41 objects:v40 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v42 != v20) {
            objc_enumerationMutation(v17);
          }
          [*(id *)(*((void *)&v41 + 1) + 8 * i) setCaptureFrameRate:v13];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v41 objects:v40 count:16];
      }
      while (v19);
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      __int16 v23 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = *(void *)(a1 + 32);
        int v25 = *(_DWORD *)(v24 + 924);
        LODWORD(v24) = *(_DWORD *)(v24 + 168);
        int v26 = 136316674;
        uint64_t v27 = v22;
        __int16 v28 = 2080;
        __int16 v29 = "-[VCSessionParticipantLocal setCurrentVideoCaptureFrameRate:]_block_invoke";
        __int16 v30 = 1024;
        int v31 = 1008;
        __int16 v32 = 1024;
        int v33 = v13;
        __int16 v34 = 1024;
        int v35 = v25;
        __int16 v36 = 1024;
        int v37 = v24;
        __int16 v38 = 1024;
        int v39 = v14;
        int v9 = " [%s] %s:%d Setting local capture rate, currentVideoCaptureFrameRate=%d fps, maxSupportedMultiwayCameraFram"
             "eRate=%d fps state=%d cameraMediaTypeEnabled=%{BOOL}d";
        uint64_t v10 = v23;
        uint32_t v11 = 52;
        goto LABEL_23;
      }
    }
  }
}

- (CGSize)captureEncodingSize
{
  if (self->super._oneToOneModeEnabled
    && (p_oneToOneSettings = &self->_oneToOneSettings,
        objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_oneToOneSettings.streamInfo, "objectForKeyedSubscript:", &unk_1F3DC4AA0), "streamConfigs"), "count")))
  {
    int64_t maxSupportedMultiwayVideoResolution = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](p_oneToOneSettings->streamInfo, "objectForKeyedSubscript:", &unk_1F3DC4AA0), "streamConfigs"), "objectAtIndexedSubscript:", 0), "videoResolution");
  }
  else
  {
    int64_t maxSupportedMultiwayVideoResolution = self->_maxSupportedMultiwayVideoResolution;
  }

  +[VideoUtil sizeForVideoResolution:maxSupportedMultiwayVideoResolution];
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)registerForVideoCapture:(int)a3
{
  v77[4] = *MEMORY[0x1E4F143B8];
  if (self->_videoCaptureSource != 3) {
    return;
  }
  uint64_t currentVideoCaptureFrameRate = *(void *)&a3;
  if (self->super._videoEnabled && !self->super._videoPaused)
  {
    [(VCSessionParticipantLocal *)self captureEncodingSize];
    double v19 = v17;
    double v20 = v18;
    if (self->super._sharingEnabled) {
      uint64_t currentVideoCaptureFrameRate = self->_currentVideoCaptureFrameRate;
    }
    uint64_t v21 = (int)v17;
    uint64_t v22 = (int)v18;
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v24 = VRTraceErrorLogLevelToCSTR();
        int v25 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long v74 = 136316418;
          *(void *)&v74[4] = v24;
          *(_WORD *)&v74[12] = 2080;
          *(void *)&v74[14] = "-[VCSessionParticipantLocal registerForVideoCapture:]";
          *(_WORD *)&v74[22] = 1024;
          *(_DWORD *)long long v75 = 1031;
          *(_WORD *)&v75[4] = 1024;
          *(_DWORD *)&v75[6] = v21;
          *(_WORD *)&v75[10] = 1024;
          *(_DWORD *)&v75[12] = v22;
          *(_WORD *)&v75[16] = 1024;
          *(_DWORD *)&v75[18] = currentVideoCaptureFrameRate;
          int v26 = " [%s] %s:%d encodeSize=%dx%d, videoCaptureFrameRate=%d";
          uint64_t v27 = v25;
          uint32_t v28 = 46;
LABEL_27:
          _os_log_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEFAULT, v26, v74, v28);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v23 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v23 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v29 = VRTraceErrorLogLevelToCSTR();
        __int16 v30 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long v74 = 136316930;
          *(void *)&v74[4] = v29;
          *(_WORD *)&v74[12] = 2080;
          *(void *)&v74[14] = "-[VCSessionParticipantLocal registerForVideoCapture:]";
          *(_WORD *)&v74[22] = 1024;
          *(_DWORD *)long long v75 = 1031;
          *(_WORD *)&v75[4] = 2112;
          *(void *)&v75[6] = v23;
          *(_WORD *)&v75[14] = 2048;
          *(void *)&v75[16] = self;
          *(_WORD *)&v75[24] = 1024;
          *(_DWORD *)&v75[26] = v21;
          *(_WORD *)&v75[30] = 1024;
          *(_DWORD *)&v75[32] = v22;
          *(_WORD *)&v75[36] = 1024;
          *(_DWORD *)&v75[38] = currentVideoCaptureFrameRate;
          int v26 = " [%s] %s:%d %@(%p) encodeSize=%dx%d, videoCaptureFrameRate=%d";
          uint64_t v27 = v30;
          uint32_t v28 = 66;
          goto LABEL_27;
        }
      }
    }
    if (![+[VCDefaults sharedInstance] forceHWI])goto LABEL_40; {
    uint64_t v21 = [+[VCDefaults sharedInstance] forceEncodeWidth];
    }
    uint64_t v22 = [+[VCDefaults sharedInstance] forceEncodeHeight];
    uint64_t currentVideoCaptureFrameRate = [+[VCDefaults sharedInstance] forceFramerate];
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v32 = VRTraceErrorLogLevelToCSTR();
        int v33 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long v74 = 136316418;
          *(void *)&v74[4] = v32;
          *(_WORD *)&v74[12] = 2080;
          *(void *)&v74[14] = "-[VCSessionParticipantLocal registerForVideoCapture:]";
          *(_WORD *)&v74[22] = 1024;
          *(_DWORD *)long long v75 = 1037;
          *(_WORD *)&v75[4] = 1024;
          *(_DWORD *)&v75[6] = v21;
          *(_WORD *)&v75[10] = 1024;
          *(_DWORD *)&v75[12] = v22;
          *(_WORD *)&v75[16] = 1024;
          *(_DWORD *)&v75[18] = currentVideoCaptureFrameRate;
          __int16 v34 = " [%s] %s:%d forcing capture settings %dx%d@%d fps";
          int v35 = v33;
          uint32_t v36 = 46;
LABEL_39:
          _os_log_impl(&dword_1E1EA4000, v35, OS_LOG_TYPE_DEFAULT, v34, v74, v36);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v31 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
      }
      else {
        int v31 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v37 = VRTraceErrorLogLevelToCSTR();
        __int16 v38 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long v74 = 136316930;
          *(void *)&v74[4] = v37;
          *(_WORD *)&v74[12] = 2080;
          *(void *)&v74[14] = "-[VCSessionParticipantLocal registerForVideoCapture:]";
          *(_WORD *)&v74[22] = 1024;
          *(_DWORD *)long long v75 = 1037;
          *(_WORD *)&v75[4] = 2112;
          *(void *)&v75[6] = v31;
          *(_WORD *)&v75[14] = 2048;
          *(void *)&v75[16] = self;
          *(_WORD *)&v75[24] = 1024;
          *(_DWORD *)&v75[26] = v21;
          *(_WORD *)&v75[30] = 1024;
          *(_DWORD *)&v75[32] = v22;
          *(_WORD *)&v75[36] = 1024;
          *(_DWORD *)&v75[38] = currentVideoCaptureFrameRate;
          __int16 v34 = " [%s] %s:%d %@(%p) forcing capture settings %dx%d@%d fps";
          int v35 = v38;
          uint32_t v36 = 66;
          goto LABEL_39;
        }
      }
    }
LABEL_40:
    self->_uint64_t currentVideoCaptureFrameRate = currentVideoCaptureFrameRate;

    int v39 = [VCVideoRule alloc];
    float v40 = (float)(int)currentVideoCaptureFrameRate;
    *(float *)&double v41 = (float)(int)currentVideoCaptureFrameRate;
    self->_videoRule = [(VCVideoRule *)v39 initWithFrameWidth:v21 frameHeight:v22 frameRate:v41];
    if (!objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "isClientRegisteredForVideoFrames:fromSource:", self, self->_videoCaptureSource))
    {
      if ((objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "registerForVideoFramesFromSource:withClient:width:height:frameRate:", 3, self, v21, v22, currentVideoCaptureFrameRate) & 1) == 0)
      {
        [(VCSessionParticipant *)self reportingAgent];
        v77[0] = &unk_1F3DC4AE8;
        v76[0] = @"SymptomReporterOptionalKeyCaptureSource";
        v76[1] = @"SymptomReporterOptionalKeyCaptureWidth";
        v77[1] = [NSNumber numberWithInt:v21];
        v76[2] = @"SymptomReporterOptionalKeyCaptureHeight";
        void v77[2] = [NSNumber numberWithInt:v22];
        v76[3] = @"SymptomReporterOptionalKeyCaptureFrameRate";
        v77[3] = [NSNumber numberWithInt:currentVideoCaptureFrameRate];
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:v76 count:4];
        reportingSymptom();
      }
LABEL_55:
      if ([(VCSessionParticipant *)self operatingMode] == 6)
      {
        int v56 = objc_alloc_init(VideoAttributes);
        [(VideoAttributes *)v56 setOrientation:0];
        -[VideoAttributes setRatio:](v56, "setRatio:", v19, v20);
        VCMediaRecorder_UpdateTargetScreenAttributes((uint64_t)self->super._mediaRecorder, (uint64_t)v56);
      }
      if ((VCSessionParticipantLocal *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_68;
        }
        uint64_t v59 = VRTraceErrorLogLevelToCSTR();
        long long v60 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_68;
        }
        int v61 = [(VCSessionParticipant *)self operatingMode];
        [(VideoAttributes *)[(VCMediaRecorder *)self->super._mediaRecorder targetScreenAttributes] ratio];
        uint64_t v63 = v62;
        [(VideoAttributes *)[(VCMediaRecorder *)self->super._mediaRecorder targetScreenAttributes] ratio];
        *(_DWORD *)long long v74 = 136316930;
        *(void *)&v74[4] = v59;
        *(_WORD *)&v74[12] = 2080;
        *(void *)&v74[14] = "-[VCSessionParticipantLocal registerForVideoCapture:]";
        *(_WORD *)&v74[22] = 1024;
        *(_DWORD *)long long v75 = 1076;
        *(_WORD *)&v75[4] = 1024;
        *(_DWORD *)&v75[6] = v61;
        *(_WORD *)&v75[10] = 2048;
        *(double *)&v75[12] = v19;
        *(_WORD *)&v75[20] = 2048;
        *(double *)&v75[22] = v20;
        *(_WORD *)&v75[30] = 2048;
        *(void *)&v75[32] = v63;
        *(_WORD *)&v75[40] = 2048;
        *(void *)&v75[42] = v64;
        long long v65 = " [%s] %s:%d operatingMode=%d, encodingSize=%3fx%3f, _mediaRecorder.targetScreenAttributes=%3fx%3f";
        long long v66 = v60;
        uint32_t v67 = 74;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          __int16 v57 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
        }
        else {
          __int16 v57 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_68;
        }
        uint64_t v68 = VRTraceErrorLogLevelToCSTR();
        long long v69 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_68;
        }
        int v70 = [(VCSessionParticipant *)self operatingMode];
        [(VideoAttributes *)[(VCMediaRecorder *)self->super._mediaRecorder targetScreenAttributes] ratio];
        uint64_t v72 = v71;
        [(VideoAttributes *)[(VCMediaRecorder *)self->super._mediaRecorder targetScreenAttributes] ratio];
        *(_DWORD *)long long v74 = 136317442;
        *(void *)&v74[4] = v68;
        *(_WORD *)&v74[12] = 2080;
        *(void *)&v74[14] = "-[VCSessionParticipantLocal registerForVideoCapture:]";
        *(_WORD *)&v74[22] = 1024;
        *(_DWORD *)long long v75 = 1076;
        *(_WORD *)&v75[4] = 2112;
        *(void *)&v75[6] = v57;
        *(_WORD *)&v75[14] = 2048;
        *(void *)&v75[16] = self;
        *(_WORD *)&v75[24] = 1024;
        *(_DWORD *)&v75[26] = v70;
        *(_WORD *)&v75[30] = 2048;
        *(double *)&v75[32] = v19;
        *(_WORD *)&v75[40] = 2048;
        *(double *)&v75[42] = v20;
        *(_WORD *)&v75[50] = 2048;
        *(void *)&v75[52] = v72;
        *(_WORD *)&v75[60] = 2048;
        *(void *)&v75[62] = v73;
        long long v65 = " [%s] %s:%d %@(%p) operatingMode=%d, encodingSize=%3fx%3f, _mediaRecorder.targetScreenAttributes=%3fx%3f";
        long long v66 = v69;
        uint32_t v67 = 94;
      }
      _os_log_impl(&dword_1E1EA4000, v66, OS_LOG_TYPE_DEFAULT, v65, v74, v67);
LABEL_68:
      *(float *)&double v58 = v40;
      -[VCMediaRecorder setFrameRate:](self->super._mediaRecorder, "setFrameRate:", v58, *(void *)v74, *(_OWORD *)&v74[8], *(_OWORD *)v75, *(void *)&v75[16], *(void *)&v75[24], *(_OWORD *)&v75[32], *(_OWORD *)&v75[48], *(void *)&v75[64]);
      return;
    }
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_54;
      }
      uint64_t v43 = VRTraceErrorLogLevelToCSTR();
      long long v44 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_54;
      }
      uint64_t v45 = (objc_class *)objc_opt_class();
      __int16 v46 = NSStringFromClass(v45);
      *(_DWORD *)long long v74 = 136316162;
      *(void *)&v74[4] = v43;
      *(_WORD *)&v74[12] = 2080;
      *(void *)&v74[14] = "-[VCSessionParticipantLocal registerForVideoCapture:]";
      *(_WORD *)&v74[22] = 1024;
      *(_DWORD *)long long v75 = 1045;
      *(_WORD *)&v75[4] = 2112;
      *(void *)&v75[6] = v46;
      *(_WORD *)&v75[14] = 2048;
      *(void *)&v75[16] = self;
      int v47 = " [%s] %s:%d %@ %p already registered for capture";
      __int16 v48 = v44;
      uint32_t v49 = 48;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        long long v42 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
      }
      else {
        long long v42 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_54;
      }
      uint64_t v50 = VRTraceErrorLogLevelToCSTR();
      v51 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_54;
      }
      __int16 v52 = (objc_class *)objc_opt_class();
      __int16 v53 = NSStringFromClass(v52);
      *(_DWORD *)long long v74 = 136316674;
      *(void *)&v74[4] = v50;
      *(_WORD *)&v74[12] = 2080;
      *(void *)&v74[14] = "-[VCSessionParticipantLocal registerForVideoCapture:]";
      *(_WORD *)&v74[22] = 1024;
      *(_DWORD *)long long v75 = 1045;
      *(_WORD *)&v75[4] = 2112;
      *(void *)&v75[6] = v42;
      *(_WORD *)&v75[14] = 2048;
      *(void *)&v75[16] = self;
      *(_WORD *)&v75[24] = 2112;
      *(void *)&v75[26] = v53;
      *(_WORD *)&v75[34] = 2048;
      *(void *)&v75[36] = self;
      int v47 = " [%s] %s:%d %@(%p) %@ %p already registered for capture";
      __int16 v48 = v51;
      uint32_t v49 = 68;
    }
    _os_log_impl(&dword_1E1EA4000, v48, OS_LOG_TYPE_DEFAULT, v47, v74, v49);
LABEL_54:
    objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton", *(void *)v74, *(_OWORD *)&v74[8], *(_OWORD *)v75, *(void *)&v75[16], *(void *)&v75[24], *(_OWORD *)&v75[32]), "setCaptureWidth:height:rate:forced:", v21, v22, currentVideoCaptureFrameRate, 0);
    id v54 = +[VCVideoCaptureServer VCVideoCaptureServerSingleton];
    *(float *)&double v55 = (float)(int)currentVideoCaptureFrameRate;
    [v54 updateCaptureRuleForClient:self width:v21 height:v22 frameRate:v55];
    goto LABEL_55;
  }
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      int v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL videoEnabled = self->super._videoEnabled;
        BOOL videoPaused = self->super._videoPaused;
        *(_DWORD *)long long v74 = 136316418;
        *(void *)&v74[4] = v6;
        *(_WORD *)&v74[12] = 2080;
        *(void *)&v74[14] = "-[VCSessionParticipantLocal registerForVideoCapture:]";
        *(_WORD *)&v74[22] = 1024;
        *(_DWORD *)long long v75 = 1023;
        *(_WORD *)&v75[4] = 1024;
        *(_DWORD *)&v75[6] = videoEnabled;
        *(_WORD *)&v75[10] = 1024;
        *(_DWORD *)&v75[12] = videoPaused;
        *(_WORD *)&v75[16] = 1024;
        *(_DWORD *)&v75[18] = currentVideoCaptureFrameRate;
        uint64_t v10 = " [%s] %s:%d Cannot register due to videoEnabled=%d videoPaused=%d (caching frame rate=%d)";
        uint32_t v11 = v7;
        uint32_t v12 = 46;
LABEL_14:
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, v74, v12);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      double v5 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      double v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      int v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL v15 = self->super._videoEnabled;
        BOOL v16 = self->super._videoPaused;
        *(_DWORD *)long long v74 = 136316930;
        *(void *)&v74[4] = v13;
        *(_WORD *)&v74[12] = 2080;
        *(void *)&v74[14] = "-[VCSessionParticipantLocal registerForVideoCapture:]";
        *(_WORD *)&v74[22] = 1024;
        *(_DWORD *)long long v75 = 1023;
        *(_WORD *)&v75[4] = 2112;
        *(void *)&v75[6] = v5;
        *(_WORD *)&v75[14] = 2048;
        *(void *)&v75[16] = self;
        *(_WORD *)&v75[24] = 1024;
        *(_DWORD *)&v75[26] = v15;
        *(_WORD *)&v75[30] = 1024;
        *(_DWORD *)&v75[32] = v16;
        *(_WORD *)&v75[36] = 1024;
        *(_DWORD *)&v75[38] = currentVideoCaptureFrameRate;
        uint64_t v10 = " [%s] %s:%d %@(%p) Cannot register due to videoEnabled=%d videoPaused=%d (caching frame rate=%d)";
        uint32_t v11 = v14;
        uint32_t v12 = 66;
        goto LABEL_14;
      }
    }
  }
}

- (void)deregisterForVideoCaptureAndStopProcessingAllMediaRecorderRequests:(BOOL)a3
{
  if (self->_videoCaptureSource == 3)
  {
    BOOL v3 = a3;
    objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "deregisterForVideoFramesFromSource:withClient:", 3, self);
    VCMediaRecorder_ClearHistoryBuffer((uint64_t)self->super._mediaRecorder);
    if (v3)
    {
      mediaRecorder = self->super._mediaRecorder;
      VCMediaRecorder_StopProcessingAllRequests((uint64_t)mediaRecorder);
    }
  }
}

- (void)deregisterForVideoCapture
{
}

- (void)resetOneToOneSettings
{
  p_oneToOneSettings = &self->_oneToOneSettings;
  [(NSMutableDictionary *)self->_oneToOneSettings.streamInfo removeAllObjects];
  p_oneToOneSettings->endToEndConnectionReceived = 0;
}

- (void)suspendStreamsOnOneToOneModeSwitch
{
  v3[5] = *MEMORY[0x1E4F143B8];
  participantQueue = self->super._participantQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__VCSessionParticipantLocal_suspendStreamsOnOneToOneModeSwitch__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_sync(participantQueue, v3);
}

void __63__VCSessionParticipantLocal_suspendStreamsOnOneToOneModeSwitch__block_invoke(uint64_t a1)
{
  unsigned int v2 = *(_DWORD **)(a1 + 32);
  if (v2[42] == 1)
  {
    [v2 deregisterForVideoCapture];
    if ([*(id *)(a1 + 32) stopMultiwayStreams])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v3 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __63__VCSessionParticipantLocal_suspendStreamsOnOneToOneModeSwitch__block_invoke_cold_1(v3);
        }
      }
    }
    else
    {
      uint64_t v4 = *(void *)(a1 + 32);
      if (*(unsigned char *)(v4 + 408))
      {
        [(id)v4 resetOneToOneSettings];
        uint64_t v4 = *(void *)(a1 + 32);
      }
      *(_DWORD *)(v4 + 568) = 0;
      *(_DWORD *)(*(void *)(a1 + 32) + 572) = 0;
      *(_DWORD *)(*(void *)(a1 + 32) + 168) = 0;
    }
  }
}

- (void)resumeStreamsOnOneToOneModeSwitch
{
  v3[5] = *MEMORY[0x1E4F143B8];
  participantQueue = self->super._participantQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__VCSessionParticipantLocal_resumeStreamsOnOneToOneModeSwitch__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_sync(participantQueue, v3);
}

uint64_t __62__VCSessionParticipantLocal_resumeStreamsOnOneToOneModeSwitch__block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (!*(_DWORD *)(result + 168))
  {
    if (*(unsigned char *)(result + 408)) {
      uint64_t v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(result + 960), "objectForKeyedSubscript:", &unk_1F3DC4AA0), "streamConfigs"), "objectAtIndexedSubscript:", 0), "framerate");
    }
    else {
      uint64_t v3 = [(id)result maxCaptureCameraFrameRate];
    }
    [*(id *)(a1 + 32) startMultiwayStreams];
    *(_DWORD *)(*(void *)(a1 + 32) + 924) = v3;
    uint64_t result = [*(id *)(a1 + 32) registerForVideoCapture:v3];
    *(unsigned char *)(*(void *)(a1 + 32) + 379) = *(unsigned char *)(*(void *)(a1 + 32) + 377);
    *(unsigned char *)(*(void *)(a1 + 32) + 378) = *(unsigned char *)(*(void *)(a1 + 32) + 376);
  }
  return result;
}

- (void)setRemoteParticipants:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__VCSessionParticipantLocal_setRemoteParticipants___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a3;
  dispatch_sync(participantQueue, block);
}

void __51__VCSessionParticipantLocal_setRemoteParticipants___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)double v17 = 136315650;
        *(void *)&v17[4] = v3;
        *(_WORD *)&v17[12] = 2080;
        *(void *)&v17[14] = "-[VCSessionParticipantLocal setRemoteParticipants:]_block_invoke";
        *(_WORD *)&v17[22] = 1024;
        LODWORD(v18) = 1151;
        double v5 = " [%s] %s:%d ";
        uint64_t v6 = v4;
        uint32_t v7 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, v5, v17, v7);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      unsigned int v2 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      unsigned int v2 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      int v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        *(_DWORD *)double v17 = 136316162;
        *(void *)&v17[4] = v8;
        *(_WORD *)&v17[12] = 2080;
        *(void *)&v17[14] = "-[VCSessionParticipantLocal setRemoteParticipants:]_block_invoke";
        *(_WORD *)&v17[22] = 1024;
        LODWORD(v18) = 1151;
        WORD2(v18) = 2112;
        *(void *)((char *)&v18 + 6) = v2;
        HIWORD(v18) = 2048;
        uint64_t v19 = v10;
        double v5 = " [%s] %s:%d %@(%p) ";
        uint64_t v6 = v9;
        uint32_t v7 = 48;
        goto LABEL_11;
      }
    }
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 379) = *(unsigned char *)(*(void *)(a1 + 32) + 377);
  *(unsigned char *)(*(void *)(a1 + 32) + 378) = *(unsigned char *)(*(void *)(a1 + 32) + 376);

  *(void *)(*(void *)(a1 + 32) + 1064) = [*(id *)(a1 + 40) copy];
  *(unsigned char *)(*(void *)(a1 + 32) + 1072) = (unint64_t)[*(id *)(*(void *)(a1 + 32) + 1064) count] > 1;
  uint32_t v11 = objc_msgSend(*(id *)(a1 + 32), "streamGroupWithID:", 1835623282, *(_OWORD *)v17, *(void *)&v17[16], v18, v19);
  uint64_t v12 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 1072);
  [v11 updateVoiceActivityEnabled:v12 isMediaPriorityEnabled:v12];
  uint64_t v13 = (void *)[*(id *)(a1 + 32) streamGroupWithID:1835623287];
  uint64_t v14 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 1072);
  [v13 updateVoiceActivityEnabled:v14 isMediaPriorityEnabled:v14];
  if (objc_msgSend(*(id *)(a1 + 32), "updateStreamGroups:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 472), "allValues")))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __51__VCSessionParticipantLocal_setRemoteParticipants___block_invoke_cold_1(v15);
      }
    }
  }
  else
  {
    BOOL v16 = *(_DWORD **)(a1 + 32);
    if (v16[142]) {
      [v16 updateUplinkTargetBitrateForStreamGroups];
    }
  }
}

- (void)startMultiwayStreams
{
  *(_DWORD *)uint64_t v3 = 136315906;
  *(void *)&v3[4] = a1;
  OUTLINED_FUNCTION_5_1();
  *(void *)&v3[14] = "-[VCSessionParticipantLocal startMultiwayStreams]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Failed to set mode=%d for stream groups", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[VCSessionParticipantLocal startMultiwayStreams]" >> 16, v4);
}

uint64_t __49__VCSessionParticipantLocal_startMultiwayStreams__block_invoke(uint64_t a1, void *a2)
{
  return [a2 vcSessionParticipant:*(void *)(a1 + 32) didStart:0 error:*(void *)(a1 + 40)];
}

- (void)setOneToOneModeEnabled:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__VCSessionParticipantLocal_setOneToOneModeEnabled___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  BOOL v5 = a3;
  block[4] = self;
  dispatch_sync(participantQueue, block);
}

void __52__VCSessionParticipantLocal_setOneToOneModeEnabled___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  if (v1 == *(unsigned __int8 *)(v2 + 408))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      int v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315650;
        uint64_t v13 = v3;
        __int16 v14 = 2080;
        uint64_t v15 = "-[VCSessionParticipantLocal setOneToOneModeEnabled:]_block_invoke";
        __int16 v16 = 1024;
        int v17 = 1200;
        BOOL v5 = " [%s] %s:%d We are already in the correct OneToOne mode";
LABEL_13:
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v12, 0x1Cu);
      }
    }
  }
  else
  {
    *(unsigned char *)(v2 + 408) = v1;
    *(void *)(*(void *)(a1 + 32) + 552) = [*(id *)(*(void *)(a1 + 32) + 544) objectAtIndexedSubscript:*(unsigned __int8 *)(*(void *)(a1 + 32) + 408)];
    int v7 = *(unsigned __int8 *)(a1 + 40);
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v7)
    {
      if (ErrorLogLevelForModule >= 7)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        uint64_t v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 136315650;
          uint64_t v13 = v9;
          __int16 v14 = 2080;
          uint64_t v15 = "-[VCSessionParticipantLocal setOneToOneModeEnabled:]_block_invoke";
          __int16 v16 = 1024;
          int v17 = 1210;
          _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Switching into oneToOne mode", (uint8_t *)&v12, 0x1Cu);
        }
      }
      *(_DWORD *)(*(void *)(a1 + 32) + 568) = *(_DWORD *)(*(void *)(a1 + 32) + 976);
      *(_DWORD *)(*(void *)(a1 + 32) + 572) = *(_DWORD *)(*(void *)(a1 + 32) + 980);
    }
    else if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      int v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315650;
        uint64_t v13 = v11;
        __int16 v14 = 2080;
        uint64_t v15 = "-[VCSessionParticipantLocal setOneToOneModeEnabled:]_block_invoke";
        __int16 v16 = 1024;
        int v17 = 1216;
        BOOL v5 = " [%s] %s:%d Switching out of oneToOne mode";
        goto LABEL_13;
      }
    }
  }
}

- (BOOL)isOneToOneModeEnabled
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = -86;
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__VCSessionParticipantLocal_isOneToOneModeEnabled__block_invoke;
  block[3] = &unk_1E6DB4540;
  block[4] = self;
  void block[5] = &v6;
  dispatch_sync(participantQueue, block);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__VCSessionParticipantLocal_isOneToOneModeEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 408);
  return result;
}

- (void)stopVideoCaptureClient
{
  if (self->super._videoEnabled) {
    [(VCSessionParticipantLocal *)self deregisterForVideoCapture];
  }
}

- (BOOL)setState:(unsigned int)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)VCSessionParticipantLocal;
  unsigned int v5 = -[VCSessionParticipant setState:](&v8, sel_setState_);
  BOOL v6 = v5;
  if (a3 == 1 && v5)
  {
    if (self->_currentUplinkTargetBitrate) {
      [(VCSessionParticipantLocal *)self updateUplinkTargetBitrateForStreamGroups];
    }
    if (self->super._videoEnabled) {
      [(VCSessionParticipantLocal *)self registerForVideoCapture:self->_currentVideoCaptureFrameRate];
    }
  }
  return v6;
}

- (void)startSystemAudioCapture
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      unsigned int v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v11 = 136315650;
        *(void *)&v11[4] = v4;
        *(_WORD *)&v11[12] = 2080;
        *(void *)&v11[14] = "-[VCSessionParticipantLocal startSystemAudioCapture]";
        *(_WORD *)&v11[22] = 1024;
        LODWORD(v12) = 1260;
        BOOL v6 = " [%s] %s:%d ";
        int v7 = v5;
        uint32_t v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, v11, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      char v3 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      char v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v11 = 136316162;
        *(void *)&v11[4] = v9;
        *(_WORD *)&v11[12] = 2080;
        *(void *)&v11[14] = "-[VCSessionParticipantLocal startSystemAudioCapture]";
        *(_WORD *)&v11[22] = 1024;
        LODWORD(v12) = 1260;
        WORD2(v12) = 2112;
        *(void *)((char *)&v12 + 6) = v3;
        HIWORD(v12) = 2048;
        uint64_t v13 = self;
        BOOL v6 = " [%s] %s:%d %@(%p) ";
        int v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }
  [(VCSystemAudioCaptureSession *)self->_systemAudioCaptureSession start];
  self->_isMixingSystemAudio = 1;
}

- (void)stopSystemAudioCapture
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  BOOL isMixingSystemAudio = self->_isMixingSystemAudio;
  uint64_t v4 = (VCSessionParticipantLocal *)objc_opt_class();
  if (isMixingSystemAudio)
  {
    if (v4 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_16;
      }
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint32_t v8 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      *(_DWORD *)uint64_t v21 = 136315650;
      *(void *)&v21[4] = v7;
      *(_WORD *)&v21[12] = 2080;
      *(void *)&v21[14] = "-[VCSessionParticipantLocal stopSystemAudioCapture]";
      *(_WORD *)&v21[22] = 1024;
      LODWORD(v22) = 1267;
      uint64_t v9 = " [%s] %s:%d stopping";
      uint64_t v10 = v8;
      uint32_t v11 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        unsigned int v5 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
      }
      else {
        unsigned int v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_16;
      }
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint64_t v13 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      *(_DWORD *)uint64_t v21 = 136316162;
      *(void *)&v21[4] = v12;
      *(_WORD *)&v21[12] = 2080;
      *(void *)&v21[14] = "-[VCSessionParticipantLocal stopSystemAudioCapture]";
      *(_WORD *)&v21[22] = 1024;
      LODWORD(v22) = 1267;
      WORD2(v22) = 2112;
      *(void *)((char *)&v22 + 6) = v5;
      HIWORD(v22) = 2048;
      __int16 v23 = self;
      uint64_t v9 = " [%s] %s:%d %@(%p) stopping";
      uint64_t v10 = v13;
      uint32_t v11 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, v21, v11);
LABEL_16:
    [(VCSystemAudioCaptureSession *)self->_systemAudioCaptureSession stop];
    goto LABEL_17;
  }
  if (v4 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      uint64_t v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v21 = 136315650;
        *(void *)&v21[4] = v14;
        *(_WORD *)&v21[12] = 2080;
        *(void *)&v21[14] = "-[VCSessionParticipantLocal stopSystemAudioCapture]";
        *(_WORD *)&v21[22] = 1024;
        LODWORD(v22) = 1270;
        __int16 v16 = " [%s] %s:%d ignore";
        int v17 = v15;
        uint32_t v18 = 28;
LABEL_25:
        _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, v16, v21, v18);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      BOOL v6 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      BOOL v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      uint64_t v20 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v21 = 136316162;
        *(void *)&v21[4] = v19;
        *(_WORD *)&v21[12] = 2080;
        *(void *)&v21[14] = "-[VCSessionParticipantLocal stopSystemAudioCapture]";
        *(_WORD *)&v21[22] = 1024;
        LODWORD(v22) = 1270;
        WORD2(v22) = 2112;
        *(void *)((char *)&v22 + 6) = v6;
        HIWORD(v22) = 2048;
        __int16 v23 = self;
        __int16 v16 = " [%s] %s:%d %@(%p) ignore";
        int v17 = v20;
        uint32_t v18 = 48;
        goto LABEL_25;
      }
    }
  }
LABEL_17:
  self->_BOOL isMixingSystemAudio = 0;
}

- (void)collectVideoChannelMetrics:(id *)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  VCMediaChannelMetrics_Reset((uint64_t)a3);
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__VCSessionParticipantLocal_collectVideoChannelMetrics___block_invoke;
  block[3] = &unk_1E6DB4568;
  block[4] = self;
  void block[5] = a3;
  dispatch_sync(participantQueue, block);
}

uint64_t __56__VCSessionParticipantLocal_collectVideoChannelMetrics___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 488);
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
        [*(id *)(*((void *)&v8 + 1) + 8 * v6++) collectAndLogChannelMetrics:*(void *)(a1 + 40)];
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v7 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)collectAudioChannelMetrics:(id *)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  VCMediaChannelMetrics_Reset((uint64_t)a3);
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__VCSessionParticipantLocal_collectAudioChannelMetrics___block_invoke;
  block[3] = &unk_1E6DB4568;
  block[4] = self;
  void block[5] = a3;
  dispatch_sync(participantQueue, block);
}

uint64_t __56__VCSessionParticipantLocal_collectAudioChannelMetrics___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 480);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v8 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) collectAndLogChannelMetrics:*(void *)(a1 + 40)];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v8 count:16];
    }
    while (v4);
  }
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "systemAudioGroup"), "collectAndLogChannelMetrics:", *(void *)(a1 + 40));
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "streamGroupWithID:", 1936290409), "collectAndLogChannelMetrics:", *(void *)(a1 + 40));
}

- (__CFString)activeStreamKeys
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = (void *)[(NSMutableDictionary *)self->super._streamGroups allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "addObjectsFromArray:", objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v8++), "activeStreamKeys"));
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v11 count:16];
    }
    while (v6);
  }
  long long v9 = (__CFString *)[v3 componentsJoinedByString:@","];

  return v9;
}

- (unsigned)calculateUplinkTotalBitrateForMediaStreams:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  unsigned int v7 = 0;
  uint64_t v8 = *(void *)v16;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v16 != v8) {
        objc_enumerationMutation(a3);
      }
      BOOL enableRedundancy = self->_enableRedundancy;
      long long v11 = objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "defaultStreamConfig"), "multiwayConfig");
      if (enableRedundancy) {
        int v12 = [v11 repairedMaxNetworkBitrate];
      }
      else {
        int v12 = [v11 maxNetworkBitrate];
      }
      v7 += v12;
    }
    uint64_t v6 = [a3 countByEnumeratingWithState:&v15 objects:v14 count:16];
  }
  while (v6);
  return v7;
}

+ (BOOL)isCameraEnabledWithMediaStates:(id)a3
{
  return objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", &unk_1F3DC4AB8), "unsignedIntValue")|| objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", &unk_1F3DC4AD0), "unsignedIntValue")|| objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", &unk_1F3DC4B00), "unsignedIntValue")|| objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", &unk_1F3DC4B18), "unsignedIntValue") != 0;
}

- (id)applyMicReconfigurationForCameraTransition
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  long long v22 = 0;
  BOOL v3 = [(VCSessionParticipant *)self dispatchedIsAnyCameraMediaTypeEnabled];
  uint64_t v4 = [(VCSessionParticipant *)self operatingMode];
  if (self->super._oneToOneModeEnabled)
  {
    if (self->super._audioIO)
    {
      BOOL v5 = [(VCSessionParticipantLocal *)self reconfigureAudioIOForMode:v4 error:&v22];
      if (v22 || !v5)
      {
        if ((VCSessionParticipantLocal *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
            goto LABEL_14;
          }
          uint64_t v7 = VRTraceErrorLogLevelToCSTR();
          uint64_t v8 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            goto LABEL_14;
          }
          *(_DWORD *)buf = 136316162;
          uint64_t v29 = v7;
          __int16 v30 = 2080;
          int v31 = "-[VCSessionParticipantLocal applyMicReconfigurationForCameraTransition]";
          __int16 v32 = 1024;
          int v33 = 1335;
          __int16 v34 = 1024;
          *(_DWORD *)int v35 = v3;
          *(_WORD *)&v35[4] = 1024;
          *(_DWORD *)&v35[6] = v4;
          long long v9 = " [%s] %s:%d Failed to update videoEnabled=%d on the audio stream with operatingMode=%d - stopping call";
          long long v10 = v8;
          uint32_t v11 = 40;
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            uint64_t v6 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
          }
          else {
            uint64_t v6 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
            goto LABEL_14;
          }
          uint64_t v12 = VRTraceErrorLogLevelToCSTR();
          long long v13 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            goto LABEL_14;
          }
          *(_DWORD *)buf = 136316674;
          uint64_t v29 = v12;
          __int16 v30 = 2080;
          int v31 = "-[VCSessionParticipantLocal applyMicReconfigurationForCameraTransition]";
          __int16 v32 = 1024;
          int v33 = 1335;
          __int16 v34 = 2112;
          *(void *)int v35 = v6;
          *(_WORD *)&v35[8] = 2048;
          uint32_t v36 = self;
          __int16 v37 = 1024;
          BOOL v38 = v3;
          __int16 v39 = 1024;
          int v40 = v4;
          long long v9 = " [%s] %s:%d %@(%p) Failed to update videoEnabled=%d on the audio stream with operatingMode=%d - stopping call";
          long long v10 = v13;
          uint32_t v11 = 60;
        }
        _os_log_error_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
LABEL_14:
        [(VCSessionParticipantLocal *)self stop];
      }
    }
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  micStreamGroups = self->super._micStreamGroups;
  uint64_t v15 = [(NSMutableArray *)micStreamGroups countByEnumeratingWithState:&v24 objects:v23 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v25;
    BOOL v18 = !v3;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(micStreamGroups);
        }
        uint64_t v20 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        [v20 setCurrentDTXEnabled:v18];
        [v20 setDeviceRole:self->super._deviceRole operatingMode:v4];
      }
      uint64_t v16 = [(NSMutableArray *)micStreamGroups countByEnumeratingWithState:&v24 objects:v23 count:16];
    }
    while (v16);
  }
  [(VCSessionParticipantLocal *)self updateAudioSpectrumState];
  return v22;
}

- (void)updateMediaSettingsWithConfig:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__VCSessionParticipantLocal_updateMediaSettingsWithConfig___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a3;
  dispatch_sync(participantQueue, block);
}

uint64_t __59__VCSessionParticipantLocal_updateMediaSettingsWithConfig___block_invoke(uint64_t result)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!*(_DWORD *)(*(void *)(result + 32) + 168))
  {
    uint64_t v1 = result;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v2 = VRTraceErrorLogLevelToCSTR();
      BOOL v3 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = *(void *)(v1 + 40);
        int v11 = 136315906;
        uint64_t v12 = v2;
        __int16 v13 = 2080;
        long long v14 = "-[VCSessionParticipantLocal updateMediaSettingsWithConfig:]_block_invoke";
        __int16 v15 = 1024;
        int v16 = 1353;
        __int16 v17 = 2112;
        uint64_t v18 = v4;
        _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Updating local media settings with config :%@", (uint8_t *)&v11, 0x26u);
      }
    }
    *(unsigned char *)(*(void *)(v1 + 32) + 373) = [*(id *)(v1 + 40) audioEnabled];
    int v5 = [*(id *)(v1 + 40) videoEnabled];
    uint64_t v6 = *(unsigned __int8 **)(v1 + 32);
    if (v6[374] == v5)
    {
      int v7 = [*(id *)(v1 + 32) dispatchedIsAnyCameraMediaTypeEnabled];
      int v8 = v7 ^ +[VCSessionParticipantLocal isCameraEnabledWithMediaStates:](VCSessionParticipantLocal, "isCameraEnabledWithMediaStates:", [*(id *)(v1 + 40) mediaStates]);
    }
    else
    {
      objc_msgSend(v6, "applyVideoEnabledSetting:", objc_msgSend(*(id *)(v1 + 40), "videoEnabled"));
      int v8 = 0;
    }
    int v9 = [*(id *)(v1 + 40) screenEnabled];
    long long v10 = *(unsigned __int8 **)(v1 + 32);
    if (v10[375] != v9) {
      objc_msgSend(v10, "applyScreenEnabledSetting:", objc_msgSend(*(id *)(v1 + 40), "screenEnabled"));
    }
    *(unsigned char *)(*(void *)(v1 + 32) + 376) = [*(id *)(v1 + 40) audioPaused];
    *(unsigned char *)(*(void *)(v1 + 32) + 377) = [*(id *)(v1 + 40) videoPaused];
    [*(id *)(v1 + 40) volume];
    objc_msgSend(*(id *)(v1 + 32), "setVolume:");
    objc_msgSend(*(id *)(v1 + 32), "setMuted:", objc_msgSend(*(id *)(v1 + 40), "audioMuted"));
    uint64_t result = [*(id *)(v1 + 32) updateMediaStatesWithConfig:*(void *)(v1 + 40)];
    if (v8) {
      return [*(id *)(v1 + 32) applyMicReconfigurationForCameraTransition];
    }
  }
  return result;
}

- (tagVCAudioIOConfiguration)audioIOConfigWithDeviceRole:(SEL)a3 operatingMode:(int)a4
{
  uint64_t result = (tagVCAudioIOConfiguration *)+[VCAudioStream audioIODirectionWithMediaStreamDirection:self->super._direction];
  *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&retstr->var4 = v10;
  *(_OWORD *)&retstr->var8 = v10;
  *(_OWORD *)&retstr->var12 = v10;
  *(_OWORD *)&retstr->var14 = v10;
  *(_OWORD *)&retstr->var16 = v10;
  *(_OWORD *)&retstr->var19.delegate = v10;
  *(_OWORD *)&retstr->var20.captionsToken = v10;
  *(_OWORD *)&retstr->var20.captionsUseSecondaryThread = v10;
  unsigned int transportSessionID = self->super._transportSessionID;
  *(_OWORD *)&retstr->var21 = v10;
  retstr->var0 = transportSessionID;
  retstr->var1 = 0;
  retstr->var2 = a5;
  retstr->var3 = a4;
  retstr->var4 = 0;
  retstr->var5 = result;
  int processId = self->super._processId;
  retstr->var6 = 0;
  unsigned int preferredIOSampleRate = self->super._preferredIOSampleRate;
  retstr->var7 = self;
  retstr->var8 = processId;
  retstr->var9 = preferredIOSampleRate;
  retstr->var10 = self->super._preferredIOSamplesPerFrame;
  retstr->var11 = 0;
  retstr->var12 = 0;
  retstr->var13 = 1;
  retstr->var14 = 0;
  retstr->var15 = 0;
  *(_WORD *)&retstr->var17 = 0;
  retstr->var16 = 0;
  *(_OWORD *)&retstr->var19.delegate = 0u;
  *(_OWORD *)&retstr->var19.clientContext = v10;
  *(_OWORD *)&retstr->var19.clientContext = 0u;
  *(_OWORD *)&retstr->var19.captionsCoordinator = v10;
  *(_OWORD *)&retstr->var19.captionsCoordinator = 0u;
  *(_OWORD *)&retstr->var19.injector = v10;
  *(_OWORD *)&retstr->var19.injector = 0u;
  *(_OWORD *)&retstr->var20.clientCallback = v10;
  retstr->var20.clientCallback = _VCSessionParticipantLocal_ProcessAudioSamples;
  retstr->var20.clientContext = self;
  retstr->var20.captionsToken = 0;
  retstr->var20.captionsCoordinator = 0;
  retstr->var20.captionsUseSecondaryThread = 0;
  retstr->var20.injector = 0;
  retstr->var21 = 0;
  *(_WORD *)&retstr->var22 = 0;
  return result;
}

- (BOOL)configureAudioIOWithDeviceRole:(int)a3 operatingMode:(int)a4
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v54 = v7;
  long long v55 = v7;
  long long v52 = v7;
  long long v53 = v7;
  long long v50 = v7;
  long long v51 = v7;
  long long v48 = v7;
  long long v49 = v7;
  long long v46 = v7;
  long long v47 = v7;
  long long v44 = v7;
  long long v45 = v7;
  long long v42 = v7;
  long long v43 = v7;
  if (self)
  {
    -[VCSessionParticipantLocal audioIOConfigWithDeviceRole:operatingMode:](self, "audioIOConfigWithDeviceRole:operatingMode:", *(void *)&a3, *(void *)&a4, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54, v55);
  }
  else
  {
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
  }
  audioIO = self->super._audioIO;
  if (audioIO)
  {
    if (![(VCAudioIO *)audioIO reconfigureWithConfig:&v42])
    {
      if ((VCSessionParticipantLocal *)objc_opt_class() != self)
      {
        if (objc_opt_respondsToSelector()) {
          int v9 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
        }
        else {
          int v9 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_44;
        }
        uint64_t v32 = VRTraceErrorLogLevelToCSTR();
        int v33 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_44;
        }
        __int16 v34 = self->super._audioIO;
        *(_DWORD *)buf = 136317186;
        uint64_t v57 = v32;
        __int16 v58 = 2080;
        uint64_t v59 = "-[VCSessionParticipantLocal configureAudioIOWithDeviceRole:operatingMode:]";
        __int16 v60 = 1024;
        int v61 = 1413;
        __int16 v62 = 2112;
        uint64_t v63 = v9;
        __int16 v64 = 2048;
        *(void *)long long v65 = self;
        *(_WORD *)&v65[8] = 2048;
        long long v66 = v34;
        *(_WORD *)uint32_t v67 = 1024;
        *(_DWORD *)&v67[2] = a4;
        __int16 v68 = 1024;
        int v69 = a3;
        __int16 v70 = 1024;
        int v71 = BYTE4(v43);
        __int16 v30 = " [%s] %s:%d %@(%p) Failed to reconfigure: audioIO=%p operatingMode=%d deviceRole=%d direction=%d";
        int v31 = v33;
        goto LABEL_42;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_44;
      }
      uint64_t v27 = VRTraceErrorLogLevelToCSTR();
      uint32_t v28 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_44;
      }
      uint64_t v29 = self->super._audioIO;
      *(_DWORD *)buf = 136316674;
      uint64_t v57 = v27;
      __int16 v58 = 2080;
      uint64_t v59 = "-[VCSessionParticipantLocal configureAudioIOWithDeviceRole:operatingMode:]";
      __int16 v60 = 1024;
      int v61 = 1413;
      __int16 v62 = 2048;
      uint64_t v63 = v29;
      __int16 v64 = 1024;
      *(_DWORD *)long long v65 = a4;
      *(_WORD *)&v65[4] = 1024;
      *(_DWORD *)&v65[6] = a3;
      LOWORD(v66) = 1024;
      *(_DWORD *)((char *)&v66 + 2) = BYTE4(v43);
      __int16 v30 = " [%s] %s:%d Failed to reconfigure: audioIO=%p operatingMode=%d deviceRole=%d direction=%d";
      int v31 = v28;
      goto LABEL_37;
    }
  }
  else
  {
    long long v10 = [[VCAudioIO alloc] initWithConfiguration:&v42];
    self->super._audioIO = v10;
    if (!v10)
    {
      if ((VCSessionParticipantLocal *)objc_opt_class() != self)
      {
        if (objc_opt_respondsToSelector()) {
          long long v26 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
        }
        else {
          long long v26 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_44;
        }
        uint64_t v39 = VRTraceErrorLogLevelToCSTR();
        int v40 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_44;
        }
        uint64_t v41 = self->super._audioIO;
        *(_DWORD *)buf = 136317186;
        uint64_t v57 = v39;
        __int16 v58 = 2080;
        uint64_t v59 = "-[VCSessionParticipantLocal configureAudioIOWithDeviceRole:operatingMode:]";
        __int16 v60 = 1024;
        int v61 = 1408;
        __int16 v62 = 2112;
        uint64_t v63 = v26;
        __int16 v64 = 2048;
        *(void *)long long v65 = self;
        *(_WORD *)&v65[8] = 2048;
        long long v66 = v41;
        *(_WORD *)uint32_t v67 = 1024;
        *(_DWORD *)&v67[2] = 6;
        __int16 v68 = 1024;
        int v69 = a3;
        __int16 v70 = 1024;
        int v71 = BYTE4(v43);
        __int16 v30 = " [%s] %s:%d %@(%p) Failed created audioIO=%p operatingMode:%d deviceRole:%d direction:%d";
        int v31 = v40;
LABEL_42:
        uint32_t v38 = 76;
        goto LABEL_43;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_44;
      }
      uint64_t v35 = VRTraceErrorLogLevelToCSTR();
      uint32_t v36 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_44;
      }
      __int16 v37 = self->super._audioIO;
      *(_DWORD *)buf = 136316674;
      uint64_t v57 = v35;
      __int16 v58 = 2080;
      uint64_t v59 = "-[VCSessionParticipantLocal configureAudioIOWithDeviceRole:operatingMode:]";
      __int16 v60 = 1024;
      int v61 = 1408;
      __int16 v62 = 2048;
      uint64_t v63 = v37;
      __int16 v64 = 1024;
      *(_DWORD *)long long v65 = 6;
      *(_WORD *)&v65[4] = 1024;
      *(_DWORD *)&v65[6] = a3;
      LOWORD(v66) = 1024;
      *(_DWORD *)((char *)&v66 + 2) = BYTE4(v43);
      __int16 v30 = " [%s] %s:%d Failed created audioIO=%p operatingMode:%d deviceRole:%d direction:%d";
      int v31 = v36;
LABEL_37:
      uint32_t v38 = 56;
LABEL_43:
      _os_log_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v38);
LABEL_44:

      BOOL result = 0;
      self->super._audioIO = 0;
      return result;
    }
    [(VCAudioIO *)v10 setIsGKVoiceChat:self->super._isGKVoiceChat];
    [(VCAudioIO *)self->super._audioIO setMuted:[(VCSessionParticipant *)self isMuted]];
  }
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 1;
    }
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    __int16 v13 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return 1;
    }
    long long v14 = self->super._audioIO;
    int v15 = BYTE4(v43);
    BOOL v16 = [(VCSessionParticipant *)self isMuted];
    *(_DWORD *)buf = 136316930;
    uint64_t v57 = v12;
    __int16 v58 = 2080;
    uint64_t v59 = "-[VCSessionParticipantLocal configureAudioIOWithDeviceRole:operatingMode:]";
    __int16 v60 = 1024;
    int v61 = 1415;
    __int16 v62 = 2048;
    uint64_t v63 = v14;
    __int16 v64 = 1024;
    *(_DWORD *)long long v65 = a4;
    *(_WORD *)&v65[4] = 1024;
    *(_DWORD *)&v65[6] = a3;
    LOWORD(v66) = 1024;
    *(_DWORD *)((char *)&v66 + 2) = v15;
    HIWORD(v66) = 1024;
    *(_DWORD *)uint32_t v67 = v16;
    __int16 v17 = " [%s] %s:%d configured audioIO=%p operatingMode=%d deviceRole=%d direction=%d isMuted=%d";
    uint64_t v18 = v13;
    uint32_t v19 = 62;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      int v11 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      int v11 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 1;
    }
    uint64_t v20 = VRTraceErrorLogLevelToCSTR();
    uint64_t v21 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return 1;
    }
    long long v22 = self->super._audioIO;
    int v23 = BYTE4(v43);
    BOOL v24 = [(VCSessionParticipant *)self isMuted];
    *(_DWORD *)buf = 136317442;
    uint64_t v57 = v20;
    __int16 v58 = 2080;
    uint64_t v59 = "-[VCSessionParticipantLocal configureAudioIOWithDeviceRole:operatingMode:]";
    __int16 v60 = 1024;
    int v61 = 1415;
    __int16 v62 = 2112;
    uint64_t v63 = v11;
    __int16 v64 = 2048;
    *(void *)long long v65 = self;
    *(_WORD *)&v65[8] = 2048;
    long long v66 = v22;
    *(_WORD *)uint32_t v67 = 1024;
    *(_DWORD *)&v67[2] = a4;
    __int16 v68 = 1024;
    int v69 = a3;
    __int16 v70 = 1024;
    int v71 = v23;
    __int16 v72 = 1024;
    BOOL v73 = v24;
    __int16 v17 = " [%s] %s:%d %@(%p) configured audioIO=%p operatingMode=%d deviceRole=%d direction=%d isMuted=%d";
    uint64_t v18 = v21;
    uint32_t v19 = 82;
  }
  _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
  return 1;
}

- (void)setMediaSuggestion:(VCRateControlMediaSuggestion *)a3
{
  uint64_t v4 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_oneToOneSettings.streamInfo, "objectForKeyedSubscript:", &unk_1F3DC4AA0), "stream");

  [v4 setMediaSuggestion:a3];
}

- (void)setEncryptionInfoReceived:(BOOL)a3
{
  self->_encryptionInfoReceived = a3;
}

- (unsigned)currentUplinkTotalBitrate
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = (void *)[(NSMutableDictionary *)self->super._streamGroups allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  unsigned int v5 = 0;
  uint64_t v6 = *(void *)v11;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v11 != v6) {
        objc_enumerationMutation(v2);
      }
      v5 += [*(id *)(*((void *)&v10 + 1) + 8 * i) currentUplinkTotalBitrate];
    }
    uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v9 count:16];
  }
  while (v4);
  return v5;
}

- (void)setCellularUniqueTag:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self->super._cellularUniqueTag = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  micStreamGroups = self->super._micStreamGroups;
  uint64_t v5 = [(NSMutableArray *)micStreamGroups countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(micStreamGroups);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * i) setCellularUniqueTag:v3];
      }
      uint64_t v6 = [(NSMutableArray *)micStreamGroups countByEnumeratingWithState:&v10 objects:v9 count:16];
    }
    while (v6);
  }
}

- (BOOL)isActiveMediaType:(unsigned int)a3
{
  switch(a3)
  {
    case 0u:
      if (!self->super._audioEnabled) {
        return 0;
      }
      uint64_t v5 = &OBJC_IVAR___VCSessionParticipant__audioPaused;
      return *((unsigned char *)&self->super.super.super.isa + *v5) == 0;
    case 1u:
      if (!self->super._videoEnabled) {
        return 0;
      }
      uint64_t v5 = &OBJC_IVAR___VCSessionParticipant__videoPaused;
      return *((unsigned char *)&self->super.super.super.isa + *v5) == 0;
    case 2u:
    case 3u:
      return self->super._screenEnabled;
    case 4u:
    case 5u:
    case 6u:
    case 7u:
    case 8u:
      return objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._mediaTypeSettingsDict, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:")), "mediaState") == 1;
    default:
      return 1;
  }
}

- (BOOL)isEnabledMediaType:(unsigned int)a3
{
  switch(a3)
  {
    case 0u:
      uint64_t v4 = &OBJC_IVAR___VCSessionParticipant__audioEnabled;
      goto LABEL_7;
    case 1u:
      uint64_t v4 = &OBJC_IVAR___VCSessionParticipant__videoEnabled;
      goto LABEL_7;
    case 2u:
    case 3u:
      uint64_t v4 = &OBJC_IVAR___VCSessionParticipant__screenEnabled;
LABEL_7:
      BOOL v3 = *((unsigned char *)&self->super.super.super.isa + *v4) == 0;
      goto LABEL_8;
    case 4u:
    case 5u:
    case 6u:
    case 7u:
    case 8u:
      BOOL v3 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._mediaTypeSettingsDict, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:")), "mediaState") == 0;
LABEL_8:
      BOOL result = !v3;
      break;
    default:
      BOOL result = 0;
      break;
  }
  return result;
}

- (BOOL)nativeParticipantSupportsStreamGroupID:(unsigned int)a3
{
  BOOL result = 1;
  if ((int)a3 <= 1835623281)
  {
    if (a3 == 1667329381) {
      return result;
    }
    int v4 = 1667330164;
    goto LABEL_7;
  }
  if (a3 != 1835623282 && a3 != 1935897189)
  {
    int v4 = 1937339233;
LABEL_7:
    if (a3 != v4) {
      return 0;
    }
  }
  return result;
}

- (BOOL)webParticipantSupportsStreamGroupID:(unsigned int)a3
{
  return a3 == 1667329399 || a3 == 1835623287;
}

- (BOOL)wolfParticipantSupportsStreamGroupID:(unsigned int)a3
{
  BOOL result = 1;
  if ((int)a3 > 1718909043)
  {
    if ((int)a3 > 1935897188)
    {
      if (a3 == 1935897189) {
        return result;
      }
      int v4 = 1937339233;
    }
    else
    {
      if (a3 == 1718909044) {
        return result;
      }
      int v4 = 1835623282;
    }
    goto LABEL_10;
  }
  if (a3 != 1650745716 && a3 != 1667329381)
  {
    int v4 = 1717854580;
LABEL_10:
    if (a3 != v4) {
      return 0;
    }
  }
  return result;
}

- (BOOL)remoteParticipantsSupportStreamGroupID:(unsigned int)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3 - 1684108337 < 5 || a3 - 1986618417 < 4 || a3 == 1936290409)
  {
LABEL_9:
    LOBYTE(v8) = 1;
  }
  else
  {
    uint64_t v5 = *(void *)&a3;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    remoteParticipants = self->_remoteParticipants;
    uint64_t v8 = [(NSArray *)remoteParticipants countByEnumeratingWithState:&v15 objects:v14 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(remoteParticipants);
          }
          uint64_t v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) capabilities];
          if (HIDWORD(v12) == 2)
          {
            if ([(VCSessionParticipantLocal *)self wolfParticipantSupportsStreamGroupID:v5])
            {
              goto LABEL_9;
            }
          }
          else if (HIDWORD(v12) == 1)
          {
            if ([(VCSessionParticipantLocal *)self webParticipantSupportsStreamGroupID:v5])
            {
              goto LABEL_9;
            }
          }
          else if (!HIDWORD(v12) {
                 && [(VCSessionParticipantLocal *)self nativeParticipantSupportsStreamGroupID:v5])
          }
          {
            goto LABEL_9;
          }
        }
        uint64_t v9 = [(NSArray *)remoteParticipants countByEnumeratingWithState:&v15 objects:v14 count:16];
        LOBYTE(v8) = 0;
      }
      while (v9);
    }
  }
  return v8;
}

- (BOOL)isOneToOneStreamGroup:(unsigned int)a3
{
  BOOL result = 1;
  if ((int)a3 > 1718909043)
  {
    if ((int)a3 > 1936290408)
    {
      if (a3 - 1986618417 < 4 || a3 == 1936290409) {
        return 0;
      }
      int v6 = 1937339233;
    }
    else
    {
      if (a3 == 1718909044)
      {
LABEL_18:
        id v7 = -[VCSessionMediaNegotiator negotiatedResultsForGroupID:](self->super._mediaNegotiator, "negotiatedResultsForGroupID:");
        return [v7 isSupported];
      }
      if (a3 == 1835623287) {
        return 0;
      }
      int v6 = 1935897189;
    }
    if (a3 == v6)
    {
      oneToOneConfig = self->super._oneToOneConfig;
      return [(VCSessionParticipantOneToOneConfig *)oneToOneConfig negotiatedScreenEnabled];
    }
    return result;
  }
  if ((int)a3 > 1667330163)
  {
    if (a3 - 1684108337 >= 5 && a3 != 1667330164)
    {
      int v5 = 1717854580;
      goto LABEL_13;
    }
    return 0;
  }
  if (a3 == 1650745716) {
    goto LABEL_18;
  }
  if (a3 != 1667329381)
  {
    int v5 = 1667329399;
LABEL_13:
    if (a3 != v5) {
      return result;
    }
    return 0;
  }
  uint64_t v9 = self->super._oneToOneConfig;

  return [(VCSessionParticipantOneToOneConfig *)v9 negotiatedVideoEnabled];
}

- (BOOL)isStreamGroupActive:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!self->super._oneToOneModeEnabled
    || (LODWORD(v5) = -[VCSessionParticipantLocal isOneToOneStreamGroup:](self, "isOneToOneStreamGroup:", [a3 streamGroupID]), v5))
  {
    uint64_t v6 = [a3 streamGroupID];
    id v7 = +[VCSessionParticipant mediaTypesFromStreamGroupID:v6];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v5 = [v7 countByEnumeratingWithState:&v13 objects:v12 count:16];
    if (v5)
    {
      uint64_t v8 = v5;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          if (-[VCSessionParticipantLocal isActiveMediaType:](self, "isActiveMediaType:", [*(id *)(*((void *)&v13 + 1) + 8 * i) unsignedIntValue]))
          {
            LOBYTE(v5) = [(VCSessionParticipantLocal *)self remoteParticipantsSupportStreamGroupID:v6];
            return v5;
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v12 count:16];
        LOBYTE(v5) = 0;
        if (v8) {
          continue;
        }
        break;
      }
    }
  }
  return v5;
}

- (BOOL)applyCachedMediaStreams:(id)a3 toMultiwayConfig:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
        int v11 = [a4 qualityIndex];
        if (v11 == [v10 qualityIndex])
        {
          int v12 = [a4 hasRepairedStreamID];
          if (v12 == [v10 hasRepairedStreamID])
          {
            objc_msgSend(a4, "setSsrc:", objc_msgSend(v10, "ssrc"));
            objc_msgSend(a4, "setIdsStreamID:", objc_msgSend(v10, "streamID"));
            if ([a4 hasV2StreamID]) {
              objc_msgSend(a4, "setV2StreamID:", objc_msgSend(v10, "v2StreamID"));
            }
            if ([a4 hasRepairedStreamID]) {
              objc_msgSend(a4, "setRepairedStreamID:", objc_msgSend(v10, "repairedStreamID"));
            }
            LOBYTE(v6) = 1;
            return v6;
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v15 objects:v14 count:16];
      uint64_t v7 = v6;
      if (v6) {
        continue;
      }
      break;
    }
  }
  return v6;
}

- (BOOL)applyCachedStreamGroupMediaStreams:(id)a3 toMultiwayConfig:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v27 objects:v26 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  BOOL v19 = 0;
  uint64_t v20 = *(void *)v28;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v28 != v20) {
        objc_enumerationMutation(a3);
      }
      uint64_t v8 = *(void **)(*((void *)&v27 + 1) + 8 * i);
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v9 = (void *)[v8 streamConfigs];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v21 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v23;
        while (2)
        {
          for (uint64_t j = 0; j != v11; ++j)
          {
            if (*(void *)v23 != v12) {
              objc_enumerationMutation(v9);
            }
            long long v14 = *(void **)(*((void *)&v22 + 1) + 8 * j);
            int v15 = [a4 qualityIndex];
            if (v15 == [v14 qualityIndex])
            {
              int v16 = [a4 hasRepairedStreamID];
              if (v16 != ([v14 repairedStreamID] == 0))
              {
                objc_msgSend(a4, "setSsrc:", objc_msgSend(v14, "ssrc"));
                objc_msgSend(a4, "setIdsStreamID:", objc_msgSend(v14, "streamID"));
                if ([a4 hasV2StreamID]) {
                  objc_msgSend(a4, "setV2StreamID:", objc_msgSend(v14, "v2StreamID"));
                }
                if ([v8 mediaType] == 1986618469) {
                  objc_msgSend(a4, "setParentStreamID:", objc_msgSend(v14, "parentStreamID"));
                }
                if ([a4 hasRepairedStreamID]) {
                  objc_msgSend(a4, "setRepairedStreamID:", objc_msgSend(v14, "repairedStreamID"));
                }
                BOOL v19 = 1;
                goto LABEL_23;
              }
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v21 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
LABEL_23:
      ;
    }
    uint64_t v6 = [a3 countByEnumeratingWithState:&v27 objects:v26 count:16];
  }
  while (v6);
  return v19;
}

- (BOOL)setupVideoStreamsWithStreamConfigurations:(id)a3 mediaNegotiatorConfig:(id)a4 streamGroupConfiguration:(id)a5
{
  BOOL v8 = [(VCSessionParticipantLocal *)self applyCachedMediaStreamsWithStreamConfigurations:a3 mediaNegotiatorConfig:a4];
  if (v8)
  {
    LOBYTE(v8) = [(VCSessionParticipantLocal *)self setupVideoStreamsWithStreamConfiguration:a3 streamGroupConfiguration:a5];
  }
  return v8;
}

- (BOOL)setupCaptionsStreamsWithStreamConfigurations:(id)a3 mediaNegotiatorConfig:(id)a4 streamGroupConfiguration:(id)a5
{
  BOOL v8 = [(VCSessionParticipantLocal *)self applyCachedMediaStreamsWithStreamConfigurations:a3 mediaNegotiatorConfig:a4];
  if (v8)
  {
    LOBYTE(v8) = [(VCSessionParticipantLocal *)self setupCaptionsStreamsWithStreamConfiguration:a3 streamGroupConfiguration:a5];
  }
  return v8;
}

- (BOOL)applyCachedMediaStreamsWithStreamConfigurations:(id)a3 mediaNegotiatorConfig:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (!a4
    || (long long v38 = 0u,
        long long v39 = 0u,
        long long v36 = 0u,
        long long v37 = 0u,
        (uint64_t v7 = [a3 countByEnumeratingWithState:&v36 objects:v35 count:16]) == 0))
  {
    LOBYTE(v17) = 1;
    return v17;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v37;
  uint64_t v24 = *(void *)v37;
LABEL_4:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v37 != v9) {
      objc_enumerationMutation(a3);
    }
    uint64_t v11 = *(void **)(*((void *)&v36 + 1) + 8 * v10);
    if (!-[VCSessionParticipantLocal applyCachedMediaStreams:toMultiwayConfig:](self, "applyCachedMediaStreams:toMultiwayConfig:", [a4 multiwayVideoStreams], objc_msgSend(v11, "multiwayConfig")))break; {
    long long v33 = 0u;
    }
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v12 = objc_msgSend((id)objc_msgSend(v11, "multiwayConfig"), "subStreamConfigs");
    uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v30 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v32;
LABEL_10:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(v12);
        }
        BOOL v17 = -[VCSessionParticipantLocal applyCachedMediaStreams:toMultiwayConfig:](self, "applyCachedMediaStreams:toMultiwayConfig:", [a4 multiwayVideoStreams], *(void *)(*((void *)&v31 + 1) + 8 * v16));
        if (!v17) {
          return v17;
        }
        if (v14 == ++v16)
        {
          uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v30 count:16];
          if (v14) {
            goto LABEL_10;
          }
          break;
        }
      }
    }
LABEL_26:
    ++v10;
    uint64_t v9 = v24;
    if (v10 == v8)
    {
      uint64_t v8 = [a3 countByEnumeratingWithState:&v36 objects:v35 count:16];
      LOBYTE(v17) = 1;
      if (v8) {
        goto LABEL_4;
      }
      return v17;
    }
  }
  if (-[VCSessionParticipantLocal applyCachedStreamGroupMediaStreams:toMultiwayConfig:](self, "applyCachedStreamGroupMediaStreams:toMultiwayConfig:", [a4 streamGroupConfigs], objc_msgSend(v11, "multiwayConfig")))
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v18 = objc_msgSend((id)objc_msgSend(v11, "multiwayConfig"), "subStreamConfigs");
    uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v25 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v27;
LABEL_20:
      uint64_t v22 = 0;
      while (1)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v18);
        }
        BOOL v17 = -[VCSessionParticipantLocal applyCachedStreamGroupMediaStreams:toMultiwayConfig:](self, "applyCachedStreamGroupMediaStreams:toMultiwayConfig:", [a4 streamGroupConfigs], *(void *)(*((void *)&v26 + 1) + 8 * v22));
        if (!v17) {
          return v17;
        }
        if (v20 == ++v22)
        {
          uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v25 count:16];
          if (v20) {
            goto LABEL_20;
          }
          goto LABEL_26;
        }
      }
    }
    goto LABEL_26;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    BOOL v17 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v17) {
      return v17;
    }
    -[VCSessionParticipantLocal applyCachedMediaStreamsWithStreamConfigurations:mediaNegotiatorConfig:]();
  }
  LOBYTE(v17) = 0;
  return v17;
}

- (BOOL)setupAudioStreamsWithStreamConfigurations:(id)a3 mediaNegotiatorConfig:(id)a4 streamGroupConfiguration:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v14) {
        return v14;
      }
      -[VCSessionParticipantLocal setupAudioStreamsWithStreamConfigurations:mediaNegotiatorConfig:streamGroupConfiguration:]();
    }
LABEL_19:
    LOBYTE(v14) = 0;
    return v14;
  }
  if (a4
    && (long long v19 = 0u,
        long long v20 = 0u,
        long long v17 = 0u,
        long long v18 = 0u,
        (uint64_t v9 = [a3 countByEnumeratingWithState:&v17 objects:v16 count:16]) != 0))
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
LABEL_5:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v18 != v11) {
        objc_enumerationMutation(a3);
      }
      uint64_t v13 = *(void **)(*((void *)&v17 + 1) + 8 * v12);
      if (!-[VCSessionParticipantLocal applyCachedMediaStreams:toMultiwayConfig:](self, "applyCachedMediaStreams:toMultiwayConfig:", [a4 multiwayAudioStreams], objc_msgSend(v13, "multiwayConfig"))&& !-[VCSessionParticipantLocal applyCachedStreamGroupMediaStreams:toMultiwayConfig:](self, "applyCachedStreamGroupMediaStreams:toMultiwayConfig:", objc_msgSend(a4, "streamGroupConfigs"), objc_msgSend(v13, "multiwayConfig")))
      {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [a3 countByEnumeratingWithState:&v17 objects:v16 count:16];
        if (v10) {
          goto LABEL_5;
        }
        goto LABEL_12;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_19;
    }
    VRTraceErrorLogLevelToCSTR();
    BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (v14)
    {
      -[VCSessionParticipantLocal setupAudioStreamsWithStreamConfigurations:mediaNegotiatorConfig:streamGroupConfiguration:]();
      goto LABEL_19;
    }
  }
  else
  {
LABEL_12:
    LOBYTE(v14) = [(VCSessionParticipantLocal *)self setupAudioStreamsWithStreamConfiguration:a3 streamGroupConfiguration:a5];
  }
  return v14;
}

- (id)newVideoSendGroupConfigWithStreamGroupID:(unsigned int)a3 streamGroupConfiguration:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_alloc_init(VCVideoStreamSendGroupConfig);
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionParticipantLocal newVideoSendGroupConfigWithStreamGroupID:streamGroupConfiguration:]();
      }
    }
    goto LABEL_25;
  }
  uint64_t v8 = [(VCSessionParticipantLocal *)self captureSourceIDFromStreamGroupConfig:a4];
  uint64_t v9 = objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "newFormatDescriptionForCaptureSource:", v8);
  if (!v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      long long v17 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v18 = 136316162;
        uint64_t v19 = v16;
        __int16 v20 = 2080;
        uint64_t v21 = "-[VCSessionParticipantLocal newVideoSendGroupConfigWithStreamGroupID:streamGroupConfiguration:]";
        __int16 v22 = 1024;
        int v23 = 1748;
        __int16 v24 = 1024;
        int v25 = v8;
        __int16 v26 = 2080;
        long long v27 = FourccToCStr(v5);
        _os_log_error_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_ERROR, " [%s] %s:%d Unable to retrieve the format for captureSource=%d streamGroupID=%s", (uint8_t *)&v18, 0x2Cu);
      }
    }
LABEL_25:

    return 0;
  }
  uint64_t v10 = (const opaqueCMFormatDescription *)v9;
  [(VCMediaStreamGroupConfig *)v7 setStreamGroupID:v5];
  [(VCMediaStreamGroupConfig *)v7 setMediaType:CMFormatDescriptionGetMediaType(v10)];
  [(VCMediaStreamGroupConfig *)v7 setMediaSubtype:CMFormatDescriptionGetMediaSubType(v10)];
  CFRelease(v10);
  -[VCMediaStreamGroupConfig setStreamToken:](v7, "setStreamToken:", objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._participantStreamTokens, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v5)), "unsignedIntValue"));
  [(VCMediaStreamGroupConfig *)v7 setDelegate:self];
  [(VCMediaStreamGroupConfig *)v7 setDelegateQueue:self->super._participantQueue];
  [(VCMediaStreamGroupConfig *)v7 setParticipantUUID:self->super._uuid];
  [(VCVideoStreamSendGroupConfig *)v7 setCaptureSource:v8];
  [(VCMediaStreamGroupConfig *)v7 setIdsParticipantID:self->super._idsParticipantID];
  [(VCMediaStreamGroupConfig *)v7 setSessionUUID:self->super._sessionUUID];
  [(VCMediaStreamSendGroupConfig *)v7 setShouldSynchronizeWithSourceRTPTimestamps:v5 != 1667329399];
  if ([a4 objectForKeyedSubscript:@"streamGroupSyncGroupID"]) {
    -[VCMediaStreamGroupConfig setSyncGroupID:](v7, "setSyncGroupID:", objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"streamGroupSyncGroupID"), "unsignedIntValue"));
  }
  [(VCMediaStreamGroupConfig *)v7 setNetworkFeedbackController:self->super._networkFeedbackController];
  if ([a4 objectForKeyedSubscript:@"streamGroupMode"]) {
    uint64_t v11 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"streamGroupMode"), "unsignedIntValue");
  }
  else {
    uint64_t v11 = 0;
  }
  [(VCMediaStreamSendGroupConfig *)v7 setStreamGroupMode:v11];
  if ([a4 objectForKeyedSubscript:@"streamGroupRedundancyMode"]) {
    uint64_t v12 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"streamGroupRedundancyMode"), "unsignedIntValue");
  }
  else {
    uint64_t v12 = 6;
  }
  [(VCMediaStreamSendGroupConfig *)v7 setRedundancyMode:v12];
  if ([a4 objectForKeyedSubscript:@"streamGroupRedundancyPercent"]) {
    uint64_t v13 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"streamGroupRedundancyPercent"), "unsignedIntValue");
  }
  else {
    uint64_t v13 = 100;
  }
  [(VCMediaStreamSendGroupConfig *)v7 setRedundancyPercentage:v13];
  if ([a4 objectForKeyedSubscript:@"streamGroupRedundancyControllerEnabled"]) {
    uint64_t v14 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"streamGroupRedundancyControllerEnabled"), "BOOLValue");
  }
  else {
    uint64_t v14 = 0;
  }
  [(VCMediaStreamSendGroupConfig *)v7 setStreamGroupRedundancyControlEnabled:v14];
  [(VCMediaStreamSendGroupConfig *)v7 setStatisticsCollector:self->super._statisticsCollector];
  return v7;
}

- (id)newAudioSendGroupConfigWithStreamGroupID:(unsigned int)a3 streamGroupConfiguration:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_alloc_init(VCAudioStreamSendGroupConfig);
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionParticipantLocal newAudioSendGroupConfigWithStreamGroupID:streamGroupConfiguration:]();
      }
    }
    goto LABEL_35;
  }
  uint64_t v8 = [(VCSessionParticipantLocal *)self captureSourceIDFromStreamGroupConfig:a4];
  if (v5 == 1667330164) {
    uint64_t v9 = [(VCSessionParticipantLocal *)self getCaptionsFormatDescription];
  }
  else {
    uint64_t v9 = [(VCSessionParticipantLocal *)self getAudioFormatDescriptionForStreamGroupID:v5];
  }
  uint64_t v10 = v9;
  if (!v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      uint64_t v19 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v20 = 136316162;
        uint64_t v21 = v18;
        __int16 v22 = 2080;
        int v23 = "-[VCSessionParticipantLocal newAudioSendGroupConfigWithStreamGroupID:streamGroupConfiguration:]";
        __int16 v24 = 1024;
        int v25 = 1824;
        __int16 v26 = 1024;
        int v27 = v8;
        __int16 v28 = 2080;
        long long v29 = FourccToCStr(v5);
        _os_log_error_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_ERROR, " [%s] %s:%d Unable to retrieve the format for captureSource=%d streamGroupID=%s", (uint8_t *)&v20, 0x2Cu);
      }
    }
LABEL_35:

    return 0;
  }
  [(VCMediaStreamGroupConfig *)v7 setMediaType:CMFormatDescriptionGetMediaType(v9)];
  [(VCMediaStreamGroupConfig *)v7 setMediaSubtype:CMFormatDescriptionGetMediaSubType(v10)];
  CFRelease(v10);
  [(VCMediaStreamGroupConfig *)v7 setStreamGroupID:v5];
  -[VCMediaStreamGroupConfig setStreamToken:](v7, "setStreamToken:", objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._participantStreamTokens, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v5)), "unsignedIntValue"));
  [(VCMediaStreamGroupConfig *)v7 setDelegate:self];
  [(VCMediaStreamGroupConfig *)v7 setDelegateQueue:self->super._participantQueue];
  [(VCMediaStreamGroupConfig *)v7 setParticipantUUID:self->super._uuid];
  [(VCMediaStreamGroupConfig *)v7 setIdsParticipantID:self->super._idsParticipantID];
  [(VCMediaStreamSendGroupConfig *)v7 setShouldSynchronizeWithSourceRTPTimestamps:v5 == 1937339233];
  [(VCMediaStreamGroupConfig *)v7 setSessionUUID:self->super._sessionUUID];
  if ([a4 objectForKeyedSubscript:@"streamGroupSyncGroupID"])
  {
    uint64_t v11 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"streamGroupSyncGroupID"), "unsignedIntValue");
LABEL_9:
    [(VCMediaStreamGroupConfig *)v7 setSyncGroupID:v11];
    goto LABEL_10;
  }
  unsigned int v12 = [(VCMediaStreamGroupConfig *)v7 mediaType];
  uint64_t v11 = 1835623282;
  if (v12 != 1936684398) {
    goto LABEL_9;
  }
LABEL_10:
  [(VCMediaStreamGroupConfig *)v7 setCaptureSource:v8];
  if (v5 == 1835623282) {
    [(VCAudioStreamSendGroupConfig *)v7 setSystemAudioCaptureSession:self->_systemAudioCaptureSession];
  }
  [(VCMediaStreamGroupConfig *)v7 setNetworkFeedbackController:self->super._networkFeedbackController];
  if ([a4 objectForKeyedSubscript:@"streamGroupMode"]) {
    uint64_t v13 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"streamGroupMode"), "unsignedIntValue");
  }
  else {
    uint64_t v13 = 0;
  }
  [(VCMediaStreamSendGroupConfig *)v7 setStreamGroupMode:v13];
  if ((!self->_isVCMediaQueueScheduledForServerBasedStreams
     || [(VCMediaStreamSendGroupConfig *)v7 streamGroupMode] == 1)
    && (v5 == 1835623287 || v5 == 1835623282))
  {
    [(VCAudioStreamSendGroupConfig *)v7 setShouldScheduleMediaQueue:1];
    if (![(VCMediaStreamSendGroupConfig *)v7 streamGroupMode]) {
      self->_isVCMediaQueueScheduledForServerBasedStreams = 1;
    }
  }
  if ([a4 objectForKeyedSubscript:@"streamGroupRedundancyMode"]) {
    uint64_t v14 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"streamGroupRedundancyMode"), "unsignedIntValue");
  }
  else {
    uint64_t v14 = 4;
  }
  [(VCMediaStreamSendGroupConfig *)v7 setRedundancyMode:v14];
  if ([a4 objectForKeyedSubscript:@"streamGroupRedundancyControllerEnabled"]) {
    uint64_t v15 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"streamGroupRedundancyControllerEnabled"), "BOOLValue");
  }
  else {
    uint64_t v15 = 1;
  }
  [(VCMediaStreamSendGroupConfig *)v7 setStreamGroupRedundancyControlEnabled:v15];
  [(VCMediaStreamSendGroupConfig *)v7 setStatisticsCollector:self->super._statisticsCollector];
  uint64_t v16 = [(VCAudioStreamSendGroupConfig *)v7 audioStreamGroupConfig];
  [(VCAudioStreamGroupCommonConfig *)v16 setAudioSessionID:self->super._transportSessionID];
  [(VCAudioStreamGroupCommonConfig *)v16 setIsMuted:self->super._isMuted];
  [(VCAudioStreamGroupCommonConfig *)v16 setProcessID:self->super._processId];
  [(VCAudioStreamGroupCommonConfig *)v16 setPreferredIOSampleRate:[(VCSessionParticipant *)self preferredIOSampleRateForGroupID:v5]];
  [(VCAudioStreamGroupCommonConfig *)v16 setPreferredIOSamplesPerFrame:[(VCSessionParticipant *)self preferredIOSamplesPerFrameForGroupID:v5]];
  [(VCAudioStreamGroupCommonConfig *)v16 setIsGKVoiceChat:self->super._isGKVoiceChat];
  [(VCAudioStreamGroupCommonConfig *)v16 setPowerSpectrumStreamToken:[(VCMediaStreamGroupConfig *)v7 streamToken]];
  return v7;
}

- (opaqueCMFormatDescription)getAudioFormatDescriptionForStreamGroupID:(unsigned int)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&asbd.mFormatID = v3;
  *(_OWORD *)&asbd.mBytesPerFrame = v3;
  CMAudioFormatDescriptionRef formatDescriptionOut = (CMAudioFormatDescriptionRef)0xAAAAAAAAAAAAAAAALL;
  asbd.mSampleRate = NAN;
  Format_Float((uint64_t)&asbd, 1, [(VCSessionParticipant *)self preferredIOSampleRateForGroupID:*(void *)&a3]);
  CMAudioFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &asbd, 0, 0, 0, 0, 0, &formatDescriptionOut);
  return formatDescriptionOut;
}

- (opaqueCMFormatDescription)getCaptionsFormatDescription
{
  v3[1] = *(CMFormatDescriptionRef *)MEMORY[0x1E4F143B8];
  v3[0] = (CMFormatDescriptionRef)0xAAAAAAAAAAAAAAAALL;
  CMFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0x6D657461u, 0x63617074u, 0, v3);
  return v3[0];
}

- (BOOL)setupVideoStreamsWithStreamConfiguration:(id)a3 streamGroupConfiguration:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"streamGroupID"), "unsignedIntValue");
  uint64_t v8 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"streamGroupMediaType"), "unsignedIntValue");
  id v9 = [(VCSessionParticipantLocal *)self newVideoSendGroupConfigWithStreamGroupID:v7 streamGroupConfiguration:a4];
  if (v9)
  {
    BOOL v10 = [(VCSessionParticipantLocal *)self setupVideoMediaStreamsWithStreamGroupConfiguration:a3 streamGroupConfig:v9 streamGroupID:v7 mediaType:v8];
    uint64_t v11 = [[VCVideoStreamSendGroup alloc] initWithConfig:v9];
    if (v11)
    {
      unsigned int v12 = v11;
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._streamGroups, "setObject:forKeyedSubscript:", v11, objc_msgSend(NSNumber, "numberWithInteger:", -[VCMediaStreamGroup streamToken](v11, "streamToken")));
      [(NSMutableArray *)self->super._videoStreamGroups addObject:v12];

      BOOL v10 = 1;
    }
    else if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantLocal setupVideoStreamsWithStreamConfiguration:streamGroupConfiguration:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v14 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
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
          int v20 = "-[VCSessionParticipantLocal setupVideoStreamsWithStreamConfiguration:streamGroupConfiguration:]";
          __int16 v21 = 1024;
          int v22 = 1921;
          __int16 v23 = 2112;
          __int16 v24 = v14;
          __int16 v25 = 2048;
          __int16 v26 = self;
          _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to initalize video stream group", (uint8_t *)&v17, 0x30u);
        }
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionParticipantLocal setupVideoStreamsWithStreamConfiguration:streamGroupConfiguration:]();
      }
    }
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)setupCaptionsStreamsWithStreamConfiguration:(id)a3 streamGroupConfiguration:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"streamGroupID"), "unsignedIntValue");
  uint64_t v8 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"streamGroupMediaType"), "unsignedIntValue");
  id v9 = [(VCSessionParticipantLocal *)self newAudioSendGroupConfigWithStreamGroupID:v7 streamGroupConfiguration:a4];
  if (v9)
  {
    BOOL v10 = [(VCSessionParticipantLocal *)self setupVideoMediaStreamsWithStreamGroupConfiguration:a3 streamGroupConfig:v9 streamGroupID:v7 mediaType:v8];
    uint64_t v11 = [[VCCaptionsStreamSendGroup alloc] initWithConfig:v9];
    if (v11)
    {
      unsigned int v12 = v11;
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._streamGroups, "setObject:forKeyedSubscript:", v11, objc_msgSend(NSNumber, "numberWithInteger:", -[VCMediaStreamGroup streamToken](v11, "streamToken")));

      BOOL v10 = 1;
    }
    else if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantLocal setupCaptionsStreamsWithStreamConfiguration:streamGroupConfiguration:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v14 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
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
          int v20 = "-[VCSessionParticipantLocal setupCaptionsStreamsWithStreamConfiguration:streamGroupConfiguration:]";
          __int16 v21 = 1024;
          int v22 = 1945;
          __int16 v23 = 2112;
          __int16 v24 = v14;
          __int16 v25 = 2048;
          __int16 v26 = self;
          _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to initalize video stream group", (uint8_t *)&v17, 0x30u);
        }
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionParticipantLocal setupCaptionsStreamsWithStreamConfiguration:streamGroupConfiguration:]();
      }
    }
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)setupVideoMediaStreamsWithStreamGroupConfiguration:(id)a3 streamGroupConfig:(id)a4 streamGroupID:(unsigned int)a5 mediaType:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v58 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ((int)[a3 count] < 1)
  {
LABEL_50:
    char v11 = 0;
    goto LABEL_51;
  }
  uint64_t v10 = 0;
  char v11 = 0;
  LODWORD(v12) = 0;
  unsigned int v57 = 15000;
  unsigned int v55 = v6;
  while (1)
  {
    uint64_t v13 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v10), "multiwayConfig");
    if (![v13 isTemporalStream] || !objc_msgSend(v13, "parentStreamID")) {
      break;
    }
    if ([v13 isTemporalStream])
    {
      if (!objc_msgSend(v58, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v13, "parentStreamID"))))
      {
        if ((VCSessionParticipantLocal *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCSessionParticipantLocal setupVideoMediaStreamsWithStreamGroupConfiguration:streamGroupConfig:streamGroupID:mediaType:]();
            }
          }
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            uint64_t v41 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
          }
          else {
            uint64_t v41 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v43 = VRTraceErrorLogLevelToCSTR();
            long long v44 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
            {
              int v45 = [v13 idsStreamID];
              *(_DWORD *)buf = 136316418;
              uint64_t v60 = v43;
              __int16 v61 = 2080;
              __int16 v62 = "-[VCSessionParticipantLocal setupVideoMediaStreamsWithStreamGroupConfiguration:streamGroupConfig:str"
                    "eamGroupID:mediaType:]";
              __int16 v63 = 1024;
              int v64 = 1978;
              __int16 v65 = 2112;
              long long v66 = v41;
              __int16 v67 = 2048;
              *(void *)__int16 v68 = self;
              *(_WORD *)&v68[8] = 1024;
              LODWORD(v69) = v45;
              long long v39 = " [%s] %s:%d %@(%p) Base temporal layer hasn't been configured for streamID=%d";
              uint64_t v40 = v44;
              goto LABEL_43;
            }
          }
        }
        goto LABEL_51;
      }
      if (!-[VCSessionParticipantLocal completeStreamSetup:rtpCipherSuite:](self, "completeStreamSetup:rtpCipherSuite:", [a3 objectAtIndexedSubscript:v10], 3))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSessionParticipantLocal setupVideoMediaStreamsWithStreamGroupConfiguration:streamGroupConfig:streamGroupID:mediaType:]();
          }
        }
        goto LABEL_50;
      }
      -[VCSessionParticipantLocal setupEncodingModeWithVideoStreamConfig:](self, "setupEncodingModeWithVideoStreamConfig:", [a3 objectAtIndexedSubscript:v10]);
      uint64_t v14 = objc_msgSend(v58, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v13, "parentStreamID")));
      objc_msgSend(v14, "addStreamConfig:", objc_msgSend(a3, "objectAtIndexedSubscript:", v10));
      uint64_t v15 = objc_msgSend(v58, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v13, "parentStreamID")));
      objc_msgSend(v58, "setObject:forKeyedSubscript:", v15, objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v13, "idsStreamID")));
      uint64_t v16 = objc_msgSend((id)objc_msgSend(v14, "streamConfigs"), "objectAtIndexedSubscript:", 0);
      if (!v16)
      {
LABEL_32:
        char v11 = 1;
        uint64_t v6 = v55;
        goto LABEL_17;
      }
      int v17 = (void *)v16;
      if ((VCSessionParticipantLocal *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_32;
        }
        uint64_t v31 = VRTraceErrorLogLevelToCSTR();
        long long v32 = *MEMORY[0x1E4F47A50];
        uint64_t v6 = v55;
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_31;
        }
        long long v54 = FourccToCStr(v7);
        int v52 = objc_msgSend((id)objc_msgSend(v17, "multiwayConfig"), "idsStreamID");
        int v50 = objc_msgSend((id)objc_msgSend(v17, "multiwayConfig"), "repairedStreamID");
        int v48 = objc_msgSend((id)objc_msgSend(v17, "multiwayConfig"), "maxNetworkBitrate");
        int v33 = [v13 idsStreamID];
        int v34 = [v13 maxNetworkBitrate];
        *(_DWORD *)buf = 136317186;
        uint64_t v60 = v31;
        __int16 v61 = 2080;
        __int16 v62 = "-[VCSessionParticipantLocal setupVideoMediaStreamsWithStreamGroupConfiguration:streamGroupConfig:streamGro"
              "upID:mediaType:]";
        __int16 v63 = 1024;
        int v64 = 1990;
        __int16 v65 = 2080;
        long long v66 = v54;
        __int16 v67 = 1024;
        *(_DWORD *)__int16 v68 = v52;
        *(_WORD *)&v68[4] = 1024;
        *(_DWORD *)&v68[6] = v50;
        LOWORD(v69) = 1024;
        *(_DWORD *)((char *)&v69 + 2) = v48;
        HIWORD(v69) = 1024;
        *(_DWORD *)__int16 v70 = v33;
        *(_WORD *)&v70[4] = 1024;
        *(_DWORD *)int v71 = v34;
        __int16 v23 = v32;
        __int16 v24 = " [%s] %s:%d temporalStream configured streamGroupID=%s baseStreamId=%d repairStreamId=%d maxNetworkBitrate"
              "=%d temporalID=%d maxNetworkBitrate=%d";
        uint32_t v25 = 68;
      }
      else
      {
        uint64_t v18 = &stru_1F3D3E450;
        if (objc_opt_respondsToSelector()) {
          uint64_t v18 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_32;
        }
        uint64_t v53 = VRTraceErrorLogLevelToCSTR();
        __int16 v19 = *MEMORY[0x1E4F47A50];
        uint64_t v6 = v55;
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_31;
        }
        long long v51 = FourccToCStr(v7);
        int v49 = objc_msgSend((id)objc_msgSend(v17, "multiwayConfig"), "idsStreamID");
        int v47 = objc_msgSend((id)objc_msgSend(v17, "multiwayConfig"), "repairedStreamID");
        int v20 = objc_msgSend((id)objc_msgSend(v17, "multiwayConfig"), "maxNetworkBitrate");
        long long v46 = v19;
        int v21 = [v13 idsStreamID];
        int v22 = [v13 maxNetworkBitrate];
        *(_DWORD *)buf = 136317698;
        uint64_t v60 = v53;
        __int16 v61 = 2080;
        __int16 v62 = "-[VCSessionParticipantLocal setupVideoMediaStreamsWithStreamGroupConfiguration:streamGroupConfig:streamGro"
              "upID:mediaType:]";
        __int16 v63 = 1024;
        int v64 = 1990;
        __int16 v65 = 2112;
        long long v66 = v18;
        __int16 v67 = 2048;
        *(void *)__int16 v68 = self;
        *(_WORD *)&v68[8] = 2080;
        int v69 = v51;
        *(_WORD *)__int16 v70 = 1024;
        *(_DWORD *)&v70[2] = v49;
        *(_WORD *)int v71 = 1024;
        *(_DWORD *)&v71[2] = v47;
        __int16 v72 = 1024;
        int v73 = v20;
        __int16 v74 = 1024;
        int v75 = v21;
        __int16 v76 = 1024;
        int v77 = v22;
        __int16 v23 = v46;
        __int16 v24 = " [%s] %s:%d %@(%p) temporalStream configured streamGroupID=%s baseStreamId=%d repairStreamId=%d maxNetwork"
              "Bitrate=%d temporalID=%d maxNetworkBitrate=%d";
        uint32_t v25 = 88;
      }
      _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, v24, buf, v25);
LABEL_31:
      char v11 = 1;
    }
LABEL_17:
    if ([v13 parentStreamID]) {
      uint64_t v12 = v12;
    }
    else {
      uint64_t v12 = (v12 + 1);
    }
    if (([v13 isOneToOne] & 1) == 0)
    {
      uint64_t v28 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v10), "multiwayConfig"), "maxNetworkBitrate");
      uint64_t v29 = [a3 objectAtIndexedSubscript:v10];
      if (v7 == 1935897189) {
        uint64_t v30 = v57;
      }
      else {
        uint64_t v30 = v28;
      }
      [(VCSessionParticipantLocal *)self updateMultiwayBandwithAllocationTable:v29 mediaType:v6 streamGroupID:v7 encoderGroupID:v12 minNetworkBitrate:v30 maxNetworkBitrate:v28];
      unsigned int v57 = v28 + 1;
    }
    if (++v10 >= (int)[a3 count]) {
      goto LABEL_51;
    }
  }
  id v26 = -[VCSessionParticipantLocal newStreamInfoWithVideoStreamWithConfiguration:streamGroupID:rtpCipherSuite:](self, "newStreamInfoWithVideoStreamWithConfiguration:streamGroupID:rtpCipherSuite:", [a3 objectAtIndexedSubscript:v10], v7, 3);
  if (v26)
  {
    uint64_t v27 = v26;
    [a4 addMediaStreamInfo:v26];
    objc_msgSend(v58, "setObject:forKeyedSubscript:", v27, objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v13, "idsStreamID")));

    goto LABEL_17;
  }
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v36 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionParticipantLocal setupVideoMediaStreamsWithStreamGroupConfiguration:streamGroupConfig:streamGroupID:mediaType:](v36);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v35 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v35 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v37 = VRTraceErrorLogLevelToCSTR();
      long long v38 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v60 = v37;
        __int16 v61 = 2080;
        __int16 v62 = "-[VCSessionParticipantLocal setupVideoMediaStreamsWithStreamGroupConfiguration:streamGroupConfig:streamGro"
              "upID:mediaType:]";
        __int16 v63 = 1024;
        int v64 = 1971;
        __int16 v65 = 2112;
        long long v66 = v35;
        __int16 v67 = 2048;
        *(void *)__int16 v68 = self;
        *(_WORD *)&v68[8] = 1024;
        LODWORD(v69) = v10;
        long long v39 = " [%s] %s:%d %@(%p) Failed to set up video stream %d";
        uint64_t v40 = v38;
LABEL_43:
        _os_log_error_impl(&dword_1E1EA4000, v40, OS_LOG_TYPE_ERROR, v39, buf, 0x36u);
      }
    }
  }
LABEL_51:

  return v11 & 1;
}

- (BOOL)setupAudioStreamsWithStreamConfiguration:(id)a3 streamGroupConfiguration:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"streamGroupID"), "unsignedIntValue");
  id v8 = [(VCSessionParticipantLocal *)self newAudioSendGroupConfigWithStreamGroupID:v7 streamGroupConfiguration:a4];
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionParticipantLocal setupAudioStreamsWithStreamConfiguration:streamGroupConfiguration:]();
      }
    }
    goto LABEL_21;
  }
  unsigned int v9 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._participantStreamTokens, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v7)), "unsignedIntValue");
  if ((int)[a3 count] >= 1)
  {
    uint64_t v10 = 0;
    while (1)
    {
      id v11 = -[VCSessionParticipantLocal newStreamInfoWithAudioStreamWithConfiguration:streamToken:isMultiway:streamGroupID:](self, "newStreamInfoWithAudioStreamWithConfiguration:streamToken:isMultiway:streamGroupID:", [a3 objectAtIndexedSubscript:v10], v9, 1, v7);
      if (!v11) {
        break;
      }
      uint64_t v12 = v11;
      [v8 addMediaStreamInfo:v11];

      if (++v10 >= (int)[a3 count]) {
        goto LABEL_6;
      }
    }
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantLocal setupAudioStreamsWithStreamConfiguration:streamGroupConfiguration:](v18);
        }
      }
      goto LABEL_21;
    }
    if (objc_opt_respondsToSelector()) {
      int v17 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      int v17 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_21;
    }
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    int v20 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    int v27 = 136316418;
    uint64_t v28 = v19;
    __int16 v29 = 2080;
    uint64_t v30 = "-[VCSessionParticipantLocal setupAudioStreamsWithStreamConfiguration:streamGroupConfiguration:]";
    __int16 v31 = 1024;
    int v32 = 2022;
    __int16 v33 = 2112;
    int v34 = v17;
    __int16 v35 = 2048;
    uint64_t v36 = self;
    __int16 v37 = 1024;
    int v38 = v10;
    int v22 = " [%s] %s:%d %@(%p) Failed to set up audio stream %d";
    __int16 v23 = v20;
    uint32_t v24 = 54;
    goto LABEL_32;
  }
LABEL_6:
  id v13 = [(VCSessionParticipantLocal *)self newAudioStreamSendGroupWithConfig:v8 streamGroupID:v7];
  if (!v13)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantLocal setupAudioStreamsWithStreamConfiguration:streamGroupConfiguration:]();
        }
      }
      goto LABEL_21;
    }
    if (objc_opt_respondsToSelector()) {
      int v21 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      int v21 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (uint64_t v25 = VRTraceErrorLogLevelToCSTR(),
          id v26 = *MEMORY[0x1E4F47A50],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
LABEL_21:
      BOOL v15 = 0;
      goto LABEL_11;
    }
    int v27 = 136316162;
    uint64_t v28 = v25;
    __int16 v29 = 2080;
    uint64_t v30 = "-[VCSessionParticipantLocal setupAudioStreamsWithStreamConfiguration:streamGroupConfiguration:]";
    __int16 v31 = 1024;
    int v32 = 2029;
    __int16 v33 = 2112;
    int v34 = v21;
    __int16 v35 = 2048;
    uint64_t v36 = self;
    int v22 = " [%s] %s:%d %@(%p) Failed to initalize audio stream group";
    __int16 v23 = v26;
    uint32_t v24 = 48;
LABEL_32:
    _os_log_error_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_ERROR, v22, (uint8_t *)&v27, v24);
    goto LABEL_21;
  }
  uint64_t v14 = v13;
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._streamGroups, "setObject:forKeyedSubscript:", v13, objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "streamToken")));
  if (v7 == 1835623287 || v7 == 1835623282)
  {
    [(NSMutableArray *)self->super._micStreamGroups addObject:v14];
    [v14 setVADFilteringEnabled:self->_enableVADFiltering];
    [(VCSessionParticipantLocal *)self updateAudioSpectrumState];
  }

  BOOL v15 = 1;
LABEL_11:

  return v15;
}

- (id)newAudioStreamSendGroupWithConfig:(id)a3 streamGroupID:(unsigned int)a4
{
  uint64_t v5 = &off_1E6DB3008;
  if (a4 != 1667330164) {
    uint64_t v5 = off_1E6DB2FF0;
  }
  id v6 = objc_alloc(*v5);

  return (id)[v6 initWithConfig:a3];
}

- (id)newStreamInfoWithVideoStreamWithConfiguration:(id)a3 streamGroupID:(unsigned int)a4 rtpCipherSuite:(int64_t)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([(VCSessionParticipantLocal *)self completeStreamSetup:a3 rtpCipherSuite:a5])
  {
    id result = [(VCSessionParticipantLocal *)self newStreamInfoWithVideoStreamWithConfiguration:a3 idsDestination:self->super._idsDestination groupID:v5];
    if (result) {
      return result;
    }
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantLocal newStreamInfoWithVideoStreamWithConfiguration:streamGroupID:rtpCipherSuite:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        unsigned int v9 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
      }
      else {
        unsigned int v9 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        id v11 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v12 = 136316418;
          uint64_t v13 = v10;
          __int16 v14 = 2080;
          BOOL v15 = "-[VCSessionParticipantLocal newStreamInfoWithVideoStreamWithConfiguration:streamGroupID:rtpCipherSuite:]";
          __int16 v16 = 1024;
          int v17 = 2069;
          __int16 v18 = 2112;
          uint64_t v19 = v9;
          __int16 v20 = 2048;
          int v21 = self;
          __int16 v22 = 2080;
          __int16 v23 = FourccToCStr(v5);
          _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to setup video stream for streamGroupId=%s", (uint8_t *)&v12, 0x3Au);
        }
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCSessionParticipantLocal newStreamInfoWithVideoStreamWithConfiguration:streamGroupID:rtpCipherSuite:]();
    }
  }
  return 0;
}

- (void)updateMultiwayBandwithAllocationTable:(id)a3 mediaType:(unsigned int)a4 streamGroupID:(unsigned int)a5 encoderGroupID:(unsigned int)a6 minNetworkBitrate:(unsigned int)a7 maxNetworkBitrate:(unsigned int)a8
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  if (a4 == 1986618469) {
    char v8 = 2;
  }
  else {
    char v8 = 3;
  }
  unsigned __int8 v36 = v8;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = (id)objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "subStreamConfigs");
  uint64_t v39 = [obj countByEnumeratingWithState:&v51 objects:v50 count:16];
  int v9 = 0;
  int v10 = 0;
  if (v39)
  {
    uint64_t v34 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v52 != v34) {
          objc_enumerationMutation(obj);
        }
        int v12 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        int v47 = [VCSessionBandwidthAllocationTableEntry alloc];
        uint64_t v45 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._participantStreamTokens, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", a5)), "unsignedIntValue");
        unsigned int v44 = [v12 maxNetworkBitrate] - v9;
        unsigned int v43 = [v12 maxNetworkBitrate] - v9;
        unsigned int v41 = [v12 maxMediaBitrate];
        unsigned int v40 = [v12 qualityIndex];
        unsigned int v13 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "idsStreamID");
        char v14 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "hasRepairedStreamID");
        int v15 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "repairedStreamID");
        int v16 = [v12 repairedMaxNetworkBitrate] - v10;
        char v17 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "startOnDemand") ^ 1;
        char v18 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "startOnDemand");
        LODWORD(v30) = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "v2StreamID");
        BYTE5(v29) = v18;
        BYTE4(v29) = v17;
        HIDWORD(v28) = v15;
        LODWORD(v29) = v16;
        LOBYTE(v28) = v14;
        uint64_t v19 = -[VCSessionBandwidthAllocationTableEntry initWithClient:type:streamToken:minNetworkBitrate:maxNetworkBitrate:mediaBitrate:qualityIndex:streamID:hasRepairStreamID:repairStreamID:repairMaxNetworkBitrate:subscribedTo:startOnDemand:streamGroupID:encoderGroupID:v2StreamID:](v47, "initWithClient:type:streamToken:minNetworkBitrate:maxNetworkBitrate:mediaBitrate:qualityIndex:streamID:hasRepairStreamID:repairStreamID:repairMaxNetworkBitrate:subscribedTo:startOnDemand:streamGroupID:encoderGroupID:v2StreamID:", 0, v36, v45, v44, v43, v41, __PAIR64__(v13, v40), v28, v29, __PAIR64__(a6, a5), v30);
        objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_uplinkBandwidthAllocators, "objectAtIndexedSubscript:", 0), "addBandwidthAllocationTableEntry:updateNow:", v19, 0);

        int v9 = [v12 maxNetworkBitrate];
        int v10 = [v12 repairedMaxNetworkBitrate];
      }
      uint64_t v39 = [obj countByEnumeratingWithState:&v51 objects:v50 count:16];
    }
    while (v39);
  }
  int v48 = [VCSessionBandwidthAllocationTableEntry alloc];
  uint64_t v46 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._participantStreamTokens, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", a5)), "unsignedIntValue");
  unsigned int v42 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "maxMediaBitrate");
  unsigned int v20 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "qualityIndex");
  unsigned int v21 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "idsStreamID");
  char v22 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "hasRepairedStreamID");
  int v23 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "repairedStreamID");
  int v24 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "repairedMaxNetworkBitrate") - v10;
  char v25 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "startOnDemand") ^ 1;
  char v26 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "startOnDemand");
  LODWORD(v30) = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "v2StreamID");
  BYTE5(v29) = v26;
  BYTE4(v29) = v25;
  HIDWORD(v28) = v23;
  LODWORD(v29) = v24;
  LOBYTE(v28) = v22;
  int v27 = -[VCSessionBandwidthAllocationTableEntry initWithClient:type:streamToken:minNetworkBitrate:maxNetworkBitrate:mediaBitrate:qualityIndex:streamID:hasRepairStreamID:repairStreamID:repairMaxNetworkBitrate:subscribedTo:startOnDemand:streamGroupID:encoderGroupID:v2StreamID:](v48, "initWithClient:type:streamToken:minNetworkBitrate:maxNetworkBitrate:mediaBitrate:qualityIndex:streamID:hasRepairStreamID:repairStreamID:repairMaxNetworkBitrate:subscribedTo:startOnDemand:streamGroupID:encoderGroupID:v2StreamID:", 0, v36, v46, a7 - v9, a8 - v9, v42, __PAIR64__(v21, v20), v28, v29, __PAIR64__(a6, a5), v30);
  objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_uplinkBandwidthAllocators, "objectAtIndexedSubscript:", 0), "addBandwidthAllocationTableEntry:updateNow:", v27, 0);
}

- (id)newStreamInfoWithAudioStreamWithConfiguration:(id)a3 streamToken:(int64_t)a4 isMultiway:(BOOL)a5 streamGroupID:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  BOOL v7 = a5;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (![(VCSessionParticipantLocal *)self completeStreamSetup:a3 rtpCipherSuite:3])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionParticipantLocal newStreamInfoWithAudioStreamWithConfiguration:streamToken:isMultiway:streamGroupID:]();
      }
    }
    return 0;
  }
  id v11 = [(VCSessionParticipantLocal *)self newStreamInfoWithAudioStreamWithConfiguration:a3 idsDestination:self->super._idsDestination isMultiway:v7 streamGroupID:v6 streamToken:a4];
  if (!v11)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantLocal newStreamInfoWithAudioStreamWithConfiguration:streamToken:isMultiway:streamGroupID:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        unsigned int v20 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
      }
      else {
        unsigned int v20 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v21 = VRTraceErrorLogLevelToCSTR();
        char v22 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v32 = v21;
          __int16 v33 = 2080;
          uint64_t v34 = "-[VCSessionParticipantLocal newStreamInfoWithAudioStreamWithConfiguration:streamToken:isMultiway:streamGroupID:]";
          __int16 v35 = 1024;
          int v36 = 2147;
          __int16 v37 = 2112;
          int v38 = v20;
          __int16 v39 = 2048;
          unsigned int v40 = self;
          _os_log_error_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to setup audio stream", buf, 0x30u);
        }
      }
    }
    return 0;
  }
  int v12 = v11;
  if ((objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "isOneToOne") & 1) == 0)
  {
    uint64_t v30 = [VCSessionBandwidthAllocationTableEntry alloc];
    unsigned int v29 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "maxNetworkBitrate");
    unsigned int v28 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "maxNetworkBitrate");
    unsigned int v27 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "maxMediaBitrate");
    unsigned int v26 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "qualityIndex");
    HIDWORD(v25) = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "idsStreamID");
    char v13 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "hasRepairedStreamID");
    int v14 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "repairedStreamID");
    int v15 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "repairedMaxNetworkBitrate");
    char v16 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "startOnDemand") ^ 1;
    char v17 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "startOnDemand");
    LODWORD(v25) = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "v2StreamID");
    BYTE5(v24) = v17;
    BYTE4(v24) = v16;
    HIDWORD(v23) = v14;
    LODWORD(v24) = v15;
    LOBYTE(v23) = v13;
    char v18 = -[VCSessionBandwidthAllocationTableEntry initWithClient:type:streamToken:minNetworkBitrate:maxNetworkBitrate:mediaBitrate:qualityIndex:streamID:hasRepairStreamID:repairStreamID:repairMaxNetworkBitrate:subscribedTo:startOnDemand:streamGroupID:encoderGroupID:v2StreamID:](v30, "initWithClient:type:streamToken:minNetworkBitrate:maxNetworkBitrate:mediaBitrate:qualityIndex:streamID:hasRepairStreamID:repairStreamID:repairMaxNetworkBitrate:subscribedTo:startOnDemand:streamGroupID:encoderGroupID:v2StreamID:", 0, 1, a4, v29, v28, v27, __PAIR64__(HIDWORD(v25), v26), v23, v24, v6, v25);
    objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_uplinkBandwidthAllocators, "objectAtIndexedSubscript:", 0), "addBandwidthAllocationTableEntry:updateNow:", v18, 0);
  }
  return v12;
}

- (BOOL)completeStreamSetup:(id)a3 rtpCipherSuite:(int64_t)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  objc_msgSend(a3, "setCName:", -[VCSessionParticipant uuid](self, "uuid"));
  v8.receiver = self;
  v8.super_class = (Class)VCSessionParticipantLocal;
  return [(VCSessionParticipant *)&v8 completeStreamSetup:a3 rtpCipherSuite:a4];
}

- (id)multiwayAudioStreamNegotiatorConfigForStreamConfig:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v4 = objc_alloc_init(VCMediaNegotiatorMultiwayAudioStream);
  -[VCMediaNegotiatorMultiwayMediaStream setSsrc:](v4, "setSsrc:", [a3 ssrc]);
  -[VCMediaNegotiatorMultiwayMediaStream setMaxNetworkBitrate:](v4, "setMaxNetworkBitrate:", [a3 maxNetworkBitrate]);
  -[VCMediaNegotiatorMultiwayMediaStream setMaxMediaBitrate:](v4, "setMaxMediaBitrate:", [a3 maxMediaBitrate]);
  [a3 maxPacketsPerSecond];
  [(VCMediaNegotiatorMultiwayMediaStream *)v4 setMaxPacketsPerSecond:v5];
  -[VCMediaNegotiatorMultiwayMediaStream setStreamID:](v4, "setStreamID:", [a3 idsStreamID]);
  -[VCMediaNegotiatorMultiwayMediaStream setV2StreamID:](v4, "setV2StreamID:", [a3 v2StreamID]);
  -[VCMediaNegotiatorMultiwayMediaStream setHasV2StreamID:](v4, "setHasV2StreamID:", [a3 hasV2StreamID]);
  -[VCMediaNegotiatorMultiwayMediaStream setQualityIndex:](v4, "setQualityIndex:", [a3 qualityIndex]);
  -[VCMediaNegotiatorMultiwayMediaStream setHasRepairedStreamID:](v4, "setHasRepairedStreamID:", [a3 hasRepairedStreamID]);
  -[VCMediaNegotiatorMultiwayMediaStream setRepairedStreamID:](v4, "setRepairedStreamID:", [a3 repairedStreamID]);
  -[VCMediaNegotiatorMultiwayMediaStream setRepairedMaxNetworkBitrate:](v4, "setRepairedMaxNetworkBitrate:", [a3 repairedMaxNetworkBitrate]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "audioRules"), "rules");
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        -[VCMediaNegotiatorMultiwayAudioStream addPayload:](v4, "addPayload:", [*(id *)(*((void *)&v13 + 1) + 8 * v10++) payload]);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v12 count:16];
    }
    while (v8);
  }
  return v4;
}

- (id)multiwayVideoStreamNegotiatorConfigForStreamConfig:(id)a3 isSubstream:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_alloc_init(VCMediaNegotiatorMultiwayVideoStream);
  -[VCMediaNegotiatorMultiwayMediaStream setSsrc:](v6, "setSsrc:", [a3 ssrc]);
  -[VCMediaNegotiatorMultiwayMediaStream setMaxNetworkBitrate:](v6, "setMaxNetworkBitrate:", [a3 maxNetworkBitrate]);
  -[VCMediaNegotiatorMultiwayMediaStream setMaxMediaBitrate:](v6, "setMaxMediaBitrate:", [a3 maxMediaBitrate]);
  [a3 maxPacketsPerSecond];
  [(VCMediaNegotiatorMultiwayMediaStream *)v6 setMaxPacketsPerSecond:v7];
  [(VCMediaNegotiatorMultiwayMediaStream *)v6 setIsSubstream:v4];
  -[VCMediaNegotiatorMultiwayMediaStream setStreamID:](v6, "setStreamID:", [a3 idsStreamID]);
  -[VCMediaNegotiatorMultiwayMediaStream setQualityIndex:](v6, "setQualityIndex:", [a3 qualityIndex]);
  +[VideoUtil sizeForVideoResolution:](VideoUtil, "sizeForVideoResolution:", [a3 resolution]);
  -[VCMediaNegotiatorMultiwayVideoStream setSize:](v6, "setSize:");
  -[VCMediaNegotiatorMultiwayVideoStream setFrameRate:](v6, "setFrameRate:", [a3 framerate]);
  -[VCMediaNegotiatorMultiwayVideoStream setKeyFrameInterval:](v6, "setKeyFrameInterval:", [a3 keyFrameInterval]);
  -[VCMediaNegotiatorMultiwayMediaStream setHasRepairedStreamID:](v6, "setHasRepairedStreamID:", [a3 hasRepairedStreamID]);
  -[VCMediaNegotiatorMultiwayMediaStream setRepairedStreamID:](v6, "setRepairedStreamID:", [a3 repairedStreamID]);
  -[VCMediaNegotiatorMultiwayMediaStream setRepairedMaxNetworkBitrate:](v6, "setRepairedMaxNetworkBitrate:", [a3 repairedMaxNetworkBitrate]);
  memset(v10, 0, sizeof(v10));
  if (objc_msgSend((id)objc_msgSend(a3, "payloads"), "countByEnumeratingWithState:objects:count:", v10, &v9, 16)) {
    -[VCMediaNegotiatorMultiwayVideoStream setPayload:](v6, "setPayload:", [**((id **)&v10[0] + 1) unsignedIntValue]);
  }
  return v6;
}

- (id)newMediaNegotiatorAudioConfigurationForMediaType:(unsigned int)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [+[VCDefaults sharedInstance] useSBR];
  BOOL v6 = [+[VCDefaults sharedInstance] audioRecordingEnabled];
  UInt32 v14 = 0;
  float v7 = (void *)[(VCAudioRuleCollection *)self->super._supportedAudioRules copy];
  if (a3)
  {
    if (a3 != 3)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantLocal newMediaNegotiatorAudioConfigurationForMediaType:]();
        }
      }
      goto LABEL_9;
    }
    uint64_t v8 = [[VCAudioRule alloc] initWithPayload:101 isSecondary:0 sbr:0 samplesPerBlock:480];
    [v7 clearAudioRules];
    [v7 addAudioRule:v8];
  }
  AUIOGetAUNumber(&v14);
  uint64_t v9 = [VCMediaNegotiatorAudioConfiguration alloc];
  uint64_t v10 = [(VCSessionParticipantLocal *)self generateSSRC];
  uint64_t v11 = [(VCMediaNegotiatorAudioConfiguration *)v9 initWithAllowAudioSwitching:1 allowAudioRecording:v6 useSBR:v5 ssrc:v10 audioUnitNumber:v14 audioRuleCollection:v7];
  if (!v11)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionParticipantLocal newMediaNegotiatorAudioConfigurationForMediaType:]();
      }
    }
LABEL_9:

    float v7 = 0;
    int v12 = 0;
    goto LABEL_10;
  }
  int v12 = (void *)v11;
LABEL_10:

  return v12;
}

- (BOOL)featureListStringsRequiredForMediaType:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  char v5 = a3 - 2;
  if (a3 - 2) < 5 && ((0x1Bu >> v5)) {
    return (0xFu >> v5) & 1;
  }
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      BOOL v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v8) {
        return v8;
      }
      -[VCSessionParticipantLocal featureListStringsRequiredForMediaType:](v7);
    }
LABEL_14:
    LOBYTE(v8) = 0;
    return v8;
  }
  if (objc_opt_respondsToSelector()) {
    BOOL v6 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
  }
  else {
    BOOL v6 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
    goto LABEL_14;
  }
  uint64_t v9 = VRTraceErrorLogLevelToCSTR();
  uint64_t v10 = *MEMORY[0x1E4F47A50];
  BOOL v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
  if (v8)
  {
    int v12 = 136316418;
    uint64_t v13 = v9;
    __int16 v14 = 2080;
    uint64_t v15 = "-[VCSessionParticipantLocal featureListStringsRequiredForMediaType:]";
    __int16 v16 = 1024;
    int v17 = 2288;
    __int16 v18 = 2112;
    uint64_t v19 = v6;
    __int16 v20 = 2048;
    uint64_t v21 = self;
    __int16 v22 = 1024;
    int v23 = v3;
    _os_log_error_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unexpected mediaType=%hhu", (uint8_t *)&v12, 0x36u);
    goto LABEL_14;
  }
  return v8;
}

- (BOOL)v1FeatureListStringsSupportedForMediaType:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  char v5 = a3 - 2;
  if (a3 - 2) < 5 && ((0x1Bu >> v5)) {
    return (7u >> v5) & 1;
  }
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      BOOL v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v8) {
        return v8;
      }
      -[VCSessionParticipantLocal v1FeatureListStringsSupportedForMediaType:](v7);
    }
LABEL_14:
    LOBYTE(v8) = 0;
    return v8;
  }
  if (objc_opt_respondsToSelector()) {
    BOOL v6 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
  }
  else {
    BOOL v6 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
    goto LABEL_14;
  }
  uint64_t v9 = VRTraceErrorLogLevelToCSTR();
  uint64_t v10 = *MEMORY[0x1E4F47A50];
  BOOL v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
  if (v8)
  {
    int v12 = 136316418;
    uint64_t v13 = v9;
    __int16 v14 = 2080;
    uint64_t v15 = "-[VCSessionParticipantLocal v1FeatureListStringsSupportedForMediaType:]";
    __int16 v16 = 1024;
    int v17 = 2310;
    __int16 v18 = 2112;
    uint64_t v19 = v6;
    __int16 v20 = 2048;
    uint64_t v21 = self;
    __int16 v22 = 1024;
    int v23 = v3;
    _os_log_error_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unexpected mediaType=%hhu", (uint8_t *)&v12, 0x36u);
    goto LABEL_14;
  }
  return v8;
}

- (id)u1VideoRuleCollectionsForMediaType:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 2u:
      char v5 = +[VCVideoRuleCollectionsCamera sharedInstance];
      return [(VCVideoRuleCollections *)v5 videoRulesCollectionsByRemovingPayload:126 andPayload:128 removeCellular:0];
    case 3u:
      goto LABEL_20;
    case 5u:
      BOOL v8 = VCVideoRuleCollectionsFaceTexture;
      goto LABEL_10;
    case 6u:
      BOOL v8 = VCVideoRuleCollectionsBodyData;
LABEL_10:
      uint64_t v9 = (void *)[(__objc2_class *)v8 newU1VideoRuleCollections];
      id result = v9;
      break;
    default:
      if ((VCSessionParticipantLocal *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v10 = VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSessionParticipantLocal u1VideoRuleCollectionsForMediaType:](v10);
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v7 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
        }
        else {
          uint64_t v7 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v11 = VRTraceErrorLogLevelToCSTR();
          int v12 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            int v13 = 136316418;
            uint64_t v14 = v11;
            __int16 v15 = 2080;
            __int16 v16 = "-[VCSessionParticipantLocal u1VideoRuleCollectionsForMediaType:]";
            __int16 v17 = 1024;
            int v18 = 2336;
            __int16 v19 = 2112;
            __int16 v20 = v7;
            __int16 v21 = 2048;
            __int16 v22 = self;
            __int16 v23 = 1024;
            int v24 = v3;
            _os_log_error_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unexpected mediaType=%hhu", (uint8_t *)&v13, 0x36u);
          }
        }
      }
LABEL_20:
      id result = 0;
      break;
  }
  return result;
}

- (BOOL)addFeatureListStringsForVideoConfiguration:(id)a3 mediaType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (!+[VCMediaNegotiatorBase featureListStringsRequiredForMediaType:a4])
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_28;
      }
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      uint64_t v14 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_28;
      }
      int v32 = 136315906;
      uint64_t v33 = v13;
      __int16 v34 = 2080;
      __int16 v35 = "-[VCSessionParticipantLocal addFeatureListStringsForVideoConfiguration:mediaType:]";
      __int16 v36 = 1024;
      int v37 = 2343;
      __int16 v38 = 1024;
      LODWORD(v39) = v4;
      __int16 v15 = " [%s] %s:%d [FLS] Skipping generation as it is NOT required for mediaType=%hhu";
      __int16 v16 = v14;
      uint32_t v17 = 34;
      goto LABEL_27;
    }
    if (objc_opt_respondsToSelector()) {
      int v12 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      int v12 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_28;
    }
    uint64_t v20 = VRTraceErrorLogLevelToCSTR();
    __int16 v21 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    int v32 = 136316418;
    uint64_t v33 = v20;
    __int16 v34 = 2080;
    __int16 v35 = "-[VCSessionParticipantLocal addFeatureListStringsForVideoConfiguration:mediaType:]";
    __int16 v36 = 1024;
    int v37 = 2343;
    __int16 v38 = 2112;
    uint64_t v39 = (uint64_t)v12;
    __int16 v40 = 2048;
    uint64_t v41 = self;
    __int16 v42 = 1024;
    LODWORD(v43) = v4;
    __int16 v15 = " [%s] %s:%d %@(%p) [FLS] Skipping generation as it is NOT required for mediaType=%hhu";
    __int16 v16 = v21;
    goto LABEL_22;
  }
  id v7 = +[VCVideoFeatureListStringHelper newLocalFeaturesStringFixedPositionWithType:](VCVideoFeatureListStringHelper, "newLocalFeaturesStringFixedPositionWithType:", +[VCMediaNegotiatorBase featureListStringTypeForMediaType:v4]);
  if (v7)
  {
    BOOL v8 = v7;
    objc_msgSend(a3, "setVideoFeatureStringsFixedPosition:", -[VCSessionParticipantLocal featureListString:removingPayload:andPayload:mediaType:](self, "featureListString:removingPayload:andPayload:mediaType:", v7, 126, 128, v4));

    if (!+[VCMediaNegotiatorBase v1FeatureListStringsSupportedForMediaType:v4])
    {
LABEL_6:
      if ((VCSessionParticipantLocal *)objc_opt_class() != self)
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v11 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
        }
        else {
          uint64_t v11 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_28;
        }
        uint64_t v22 = VRTraceErrorLogLevelToCSTR();
        __int16 v23 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_28;
        }
        int v32 = 136316930;
        uint64_t v33 = v22;
        __int16 v34 = 2080;
        __int16 v35 = "-[VCSessionParticipantLocal addFeatureListStringsForVideoConfiguration:mediaType:]";
        __int16 v36 = 1024;
        int v37 = 2363;
        __int16 v38 = 2112;
        uint64_t v39 = (uint64_t)v11;
        __int16 v40 = 2048;
        uint64_t v41 = self;
        __int16 v42 = 2112;
        uint64_t v43 = [a3 videoFeatureStrings];
        __int16 v44 = 2112;
        uint64_t v45 = [a3 videoFeatureStringsFixedPosition];
        __int16 v46 = 1024;
        int v47 = v4;
        __int16 v15 = " [%s] %s:%d %@(%p) [FLS] init videoFeatureStrings=%@, videoFeatureStringsFixedPosition=%@, mediaType=%hhu";
        __int16 v16 = v23;
        uint32_t v17 = 74;
        goto LABEL_27;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_28;
      }
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      __int16 v19 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_28;
      }
      int v32 = 136316418;
      uint64_t v33 = v18;
      __int16 v34 = 2080;
      __int16 v35 = "-[VCSessionParticipantLocal addFeatureListStringsForVideoConfiguration:mediaType:]";
      __int16 v36 = 1024;
      int v37 = 2363;
      __int16 v38 = 2112;
      uint64_t v39 = [a3 videoFeatureStrings];
      __int16 v40 = 2112;
      uint64_t v41 = (VCSessionParticipantLocal *)[a3 videoFeatureStringsFixedPosition];
      __int16 v42 = 1024;
      LODWORD(v43) = v4;
      __int16 v15 = " [%s] %s:%d [FLS] init videoFeatureStrings=%@, videoFeatureStringsFixedPosition=%@, mediaType=%hhu";
      __int16 v16 = v19;
LABEL_22:
      uint32_t v17 = 54;
LABEL_27:
      _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v32, v17);
LABEL_28:
      LOBYTE(v24) = 1;
      return v24;
    }
    id v9 = +[VCVideoFeatureListStringHelper newFeatureListStringsDictForGroupID:VCMediaNegotiatorMediaType_StreamGroupIDFromMediaType(v4) isOneToOne:1];
    if (v9)
    {
      uint64_t v10 = v9;
      objc_msgSend(a3, "setVideoFeatureStrings:", -[VCSessionParticipantLocal featureListString:removingPayload:andPayload:mediaType:](self, "featureListString:removingPayload:andPayload:mediaType:", v9, 126, 128, v4));

      goto LABEL_6;
    }
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        BOOL v24 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v24) {
          return v24;
        }
        -[VCSessionParticipantLocal addFeatureListStringsForVideoConfiguration:mediaType:]();
      }
      goto LABEL_51;
    }
    if (objc_opt_respondsToSelector()) {
      unsigned int v26 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      unsigned int v26 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v30 = VRTraceErrorLogLevelToCSTR();
      unsigned int v28 = *MEMORY[0x1E4F47A50];
      BOOL v24 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v24) {
        return v24;
      }
      int v32 = 136316162;
      uint64_t v33 = v30;
      __int16 v34 = 2080;
      __int16 v35 = "-[VCSessionParticipantLocal addFeatureListStringsForVideoConfiguration:mediaType:]";
      __int16 v36 = 1024;
      int v37 = 2358;
      __int16 v38 = 2112;
      uint64_t v39 = (uint64_t)v26;
      __int16 v40 = 2048;
      uint64_t v41 = self;
      unsigned int v29 = " [%s] %s:%d %@(%p) Failed to allocate the feature list strings";
LABEL_50:
      _os_log_error_impl(&dword_1E1EA4000, v28, OS_LOG_TYPE_ERROR, v29, (uint8_t *)&v32, 0x30u);
    }
  }
  else
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        BOOL v24 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v24) {
          return v24;
        }
        -[VCSessionParticipantLocal addFeatureListStringsForVideoConfiguration:mediaType:]();
      }
      goto LABEL_51;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v25 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v25 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v27 = VRTraceErrorLogLevelToCSTR();
      unsigned int v28 = *MEMORY[0x1E4F47A50];
      BOOL v24 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v24) {
        return v24;
      }
      int v32 = 136316162;
      uint64_t v33 = v27;
      __int16 v34 = 2080;
      __int16 v35 = "-[VCSessionParticipantLocal addFeatureListStringsForVideoConfiguration:mediaType:]";
      __int16 v36 = 1024;
      int v37 = 2352;
      __int16 v38 = 2112;
      uint64_t v39 = (uint64_t)v25;
      __int16 v40 = 2048;
      uint64_t v41 = self;
      unsigned int v29 = " [%s] %s:%d %@(%p) Failed to allocate the fixed position feature list strings";
      goto LABEL_50;
    }
  }
LABEL_51:
  LOBYTE(v24) = 0;
  return v24;
}

- (id)newVideoConfigurationForMediaType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  char v5 = objc_alloc_init(VCMediaNegotiatorVideoConfiguration);
  if (!v5)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantLocal newVideoConfigurationForMediaType:]();
        }
      }
      goto LABEL_23;
    }
    if (objc_opt_respondsToSelector()) {
      id v7 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      id v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_23;
    }
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    int v13 = 136316418;
    uint64_t v14 = v9;
    __int16 v15 = 2080;
    __int16 v16 = "-[VCSessionParticipantLocal newVideoConfigurationForMediaType:]";
    __int16 v17 = 1024;
    int v18 = 2373;
    __int16 v19 = 2112;
    uint64_t v20 = v7;
    __int16 v21 = 2048;
    uint64_t v22 = self;
    __int16 v23 = 1024;
    int v24 = v3;
    uint64_t v11 = " [%s] %s:%d %@(%p) Failed to allocate videoConfiguration for mediaType=%hhu";
    goto LABEL_25;
  }
  [(VCMediaNegotiatorCommonConfiguration *)v5 setSsrc:[(VCSessionParticipantLocal *)self generateSSRC]];
  [(VCMediaNegotiatorVideoConfiguration *)v5 setVideoRuleCollections:[(VCSessionParticipantLocal *)self u1VideoRuleCollectionsForMediaType:v3]];
  if (![(VCSessionParticipantLocal *)self addFeatureListStringsForVideoConfiguration:v5 mediaType:v3])
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantLocal newVideoConfigurationForMediaType:]();
        }
      }
      goto LABEL_23;
    }
    if (objc_opt_respondsToSelector()) {
      BOOL v8 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      BOOL v8 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (uint64_t v12 = VRTraceErrorLogLevelToCSTR(),
          uint64_t v10 = *MEMORY[0x1E4F47A50],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
LABEL_23:

      return 0;
    }
    int v13 = 136316418;
    uint64_t v14 = v12;
    __int16 v15 = 2080;
    __int16 v16 = "-[VCSessionParticipantLocal newVideoConfigurationForMediaType:]";
    __int16 v17 = 1024;
    int v18 = 2379;
    __int16 v19 = 2112;
    uint64_t v20 = v8;
    __int16 v21 = 2048;
    uint64_t v22 = self;
    __int16 v23 = 1024;
    int v24 = v3;
    uint64_t v11 = " [%s] %s:%d %@(%p) Failed to add FLS settings for mediaType=%hhu";
LABEL_25:
    _os_log_error_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v13, 0x36u);
    goto LABEL_23;
  }
  return v5;
}

- (void)streamGroupNegotiationVideoConfigForStreamGroup:(id)a3 streamConfig:(id)a4 mediaConfig:(id)a5
{
  BOOL v8 = (void *)[a5 multiwayConfig];
  if ([a3 mediaType] == 1986618469)
  {
    if ([a3 streamGroupID] == 1935897189) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = 3;
    }
    [a4 setCoordinateSystem:v9];
    if ([a5 videoResolution] == 27)
    {
      double v10 = (double)(unint64_t)[a5 customWidth];
      double v11 = (double)(unint64_t)[a5 customHeight];
    }
    else
    {
      +[VideoUtil sizeForVideoResolution:](VideoUtil, "sizeForVideoResolution:", [a5 videoResolution]);
      double v10 = v12;
    }
    objc_msgSend(a4, "setResolution:", v10, v11);
    objc_msgSend(a4, "setFramerate:", objc_msgSend(a5, "framerate"));
    objc_msgSend(a4, "setKeyFrameInterval:", objc_msgSend(a5, "keyFrameInterval"));
    objc_msgSend(a4, "setIsSubStream:", objc_msgSend(v8, "isSubStream"));
  }
  else
  {
    if ([a3 mediaType] != 1835365473) {
      return;
    }
    objc_msgSend(a4, "setFramerate:", objc_msgSend(a5, "framerate"));
  }
  objc_msgSend(a4, "setIsTemporalStream:", objc_msgSend(v8, "isTemporalStream"));
  uint64_t v13 = [v8 parentStreamID];

  [a4 setParentStreamID:v13];
}

+ (BOOL)negotiatorCipherSuite:(unsigned int *)a3 fromMediaStreamConfig:(id)a4
{
  int v6 = [a4 sframeCipherSuite];
  if (v6 == 2)
  {
    unsigned int v7 = 2;
LABEL_7:
    *a3 = v7;
LABEL_8:
    LOBYTE(v6) = 1;
    return v6;
  }
  if (v6 == 1)
  {
    *a3 = 1;
    return v6;
  }
  if ([a4 SRTPCipherSuite] == 3)
  {
    unsigned int v7 = 3;
    goto LABEL_7;
  }
  if (-[VCDefaults forceDisableMediaEncryption](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceDisableMediaEncryption")&& ![a4 SRTPCipherSuite])
  {
    *a3 = 0;
    goto LABEL_8;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    int v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v6) {
      return v6;
    }
    +[VCSessionParticipantLocal negotiatorCipherSuite:fromMediaStreamConfig:]();
  }
  LOBYTE(v6) = 0;
  return v6;
}

- (id)newStreamGroupNegotiationConfigForStreamGroup:(id)a3
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = -[VCMediaNegotiatorStreamGroupConfiguration initWithGroupID:mediaType:subtype:syncGroupID:]([VCMediaNegotiatorStreamGroupConfiguration alloc], "initWithGroupID:mediaType:subtype:syncGroupID:", [a3 streamGroupID], objc_msgSend(a3, "mediaType"), objc_msgSend(a3, "mediaSubtype"), objc_msgSend(a3, "syncGroupID"));
  if (v4)
  {
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id obj = (id)[a3 mediaStreamInfoArray];
    uint64_t v42 = [obj countByEnumeratingWithState:&v77 objects:v76 count:16];
    if (v42)
    {
      p_info = VCMediaControlInfo.info;
      uint64_t v6 = *(void *)v78;
      p_superclass = VCRedundancyControlAlgorithmAudio.superclass;
      id v45 = a3;
      uint64_t v41 = *(void *)v78;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v78 != v6)
          {
            uint64_t v9 = v8;
            objc_enumerationMutation(obj);
            uint64_t v8 = v9;
          }
          uint64_t v44 = v8;
          double v10 = *(void **)(*((void *)&v77 + 1) + 8 * v8);
          long long v72 = 0u;
          long long v73 = 0u;
          long long v74 = 0u;
          long long v75 = 0u;
          id v46 = (id)objc_msgSend(v10, "streamConfigs", v41);
          uint64_t v50 = [v46 countByEnumeratingWithState:&v72 objects:v71 count:16];
          if (v50)
          {
            uint64_t v49 = *(void *)v73;
            while (2)
            {
              uint64_t v11 = 0;
              do
              {
                if (*(void *)v73 != v49) {
                  objc_enumerationMutation(v46);
                }
                double v12 = *(void **)(*((void *)&v72 + 1) + 8 * v11);
                id v13 = objc_alloc_init((Class)(p_info + 231));
                unsigned int v52 = 0;
                if (!v13)
                {
                  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                  {
                    VRTraceErrorLogLevelToCSTR();
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                      -[VCSessionParticipantLocal newStreamGroupNegotiationConfigForStreamGroup:]();
                    }
                  }
                  goto LABEL_56;
                }
                uint64_t v14 = v13;
                if (([p_superclass + 154 negotiatorCipherSuite:&v52 fromMediaStreamConfig:v12] & 1) == 0)
                {

                  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                  {
                    VRTraceErrorLogLevelToCSTR();
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                      -[VCSessionParticipantLocal newStreamGroupNegotiationConfigForStreamGroup:].cold.7();
                    }
                  }
                  goto LABEL_56;
                }
                __int16 v15 = (void *)[v12 multiwayConfig];
                uint64_t v51 = v11;
                if (([v15 negotiationProtocolMask] & 2) != 0)
                {
                  objc_msgSend(v14, "setSsrc:", objc_msgSend(v15, "ssrc"));
                  objc_msgSend(v14, "setStreamID:", objc_msgSend(v15, "idsStreamID"));
                  objc_msgSend(v14, "setV2StreamID:", objc_msgSend(v15, "v2StreamID"));
                  objc_msgSend(v14, "setQualityIndex:", objc_msgSend(v15, "qualityIndex"));
                  objc_msgSend(v14, "setMaxNetworkBitrate:", objc_msgSend(v15, "maxNetworkBitrate"));
                  objc_msgSend(v14, "setMaxMediaBitrate:", objc_msgSend(v15, "maxMediaBitrate"));
                  [v15 maxPacketsPerSecond];
                  [v14 setMaxPacketsPerSecond:v20];
                  objc_msgSend(v14, "setRepairedStreamID:", objc_msgSend(v15, "repairedStreamID"));
                  objc_msgSend(v14, "setRepairedMaxNetworkBitrate:", objc_msgSend(v15, "repairedMaxNetworkBitrate"));
                  objc_msgSend(v14, "setRtpTimestampRate:", objc_msgSend(v12, "rtpTimestampRate"));
                  uint64_t v48 = v15;
                  if ([a3 mediaType] == 1986618469
                    || [a3 mediaType] == 1835365473)
                  {
                    [(VCSessionParticipantLocal *)self streamGroupNegotiationVideoConfigForStreamGroup:a3 streamConfig:v14 mediaConfig:v12];
                    __int16 v21 = objc_alloc_init(VCMediaNegotiatorStreamGroupCodecConfiguration);
                    if (!v21)
                    {

                      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                      {
                        VRTraceErrorLogLevelToCSTR();
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                          -[VCSessionParticipantLocal newStreamGroupNegotiationConfigForStreamGroup:]();
                        }
                      }
                      goto LABEL_56;
                    }
                    uint64_t v22 = v21;
                    __int16 v23 = objc_msgSend((id)objc_msgSend(v12, "txPayloadMap"), "allKeys");
                    if ([v23 count] != 1)
                    {

                      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                      {
                        VRTraceErrorLogLevelToCSTR();
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                          -[VCSessionParticipantLocal newStreamGroupNegotiationConfigForStreamGroup:].cold.5();
                        }
                      }
                      goto LABEL_56;
                    }
                    -[VCMediaNegotiatorStreamGroupCodecConfiguration setCodecType:](v22, "setCodecType:", +[VCPayloadUtils codecTypeForPayload:](VCPayloadUtils, "codecTypeForPayload:", objc_msgSend((id)objc_msgSend(v23, "objectAtIndexedSubscript:", 0), "unsignedIntValue")));
                    int v24 = objc_msgSend((id)objc_msgSend(v12, "txPayloadMap"), "allValues");
                    if ([v24 count] != 1)
                    {

                      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                      {
                        VRTraceErrorLogLevelToCSTR();
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                          -[VCSessionParticipantLocal newStreamGroupNegotiationConfigForStreamGroup:].cold.4();
                        }
                      }
                      goto LABEL_56;
                    }
                    -[VCMediaNegotiatorStreamGroupCodecConfiguration setRtpPayload:](v22, "setRtpPayload:", objc_msgSend((id)objc_msgSend(v24, "objectAtIndexedSubscript:", 0), "unsignedIntValue"));
                    if ([v12 profileLevel]) {
                      -[VCMediaNegotiatorStreamGroupCodecConfiguration setProfileLevelId:](v22, "setProfileLevelId:", +[VCVideoStreamConfig profileLevelIdForString:](VCVideoStreamConfig, "profileLevelIdForString:", [v12 profileLevel]));
                    }
                    -[VCMediaNegotiatorStreamGroupCodecConfiguration setRtcpSREnabled:](v22, "setRtcpSREnabled:", [v12 isRTCPEnabled]);
                    -[VCMediaNegotiatorStreamGroupCodecConfiguration setRtcpPSFB_FIREnabled:](v22, "setRtcpPSFB_FIREnabled:", objc_msgSend(v12, "rtcpPSFB_FIREnabled"));
                    [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v22 setH264PacketizationMode:1];
                    [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v22 setCipherSuite:v52];
                    -[VCMediaNegotiatorStreamGroupCodecConfiguration setEncoderUsage:](v22, "setEncoderUsage:", [v12 encoderUsage]);
                    [(VCMediaNegotiatorStreamGroupConfiguration *)v4 addCodecConfig:v22];
                    objc_msgSend(v14, "addCodec:", -[VCMediaNegotiatorStreamGroupConfiguration indexOfCodecConfig:](v4, "indexOfCodecConfig:", v22));
                  }
                  else if ([a3 mediaType] == 1936684398)
                  {
                    objc_msgSend(v14, "setAudioChannelCount:", objc_msgSend(v12, "channelCount"));
                    if ([v12 codecConfigurations])
                    {
                      long long v56 = 0uLL;
                      long long v57 = 0uLL;
                      long long v54 = 0uLL;
                      long long v55 = 0uLL;
                      uint64_t v25 = (void *)[v12 codecConfigurations];
                      uint64_t v26 = [v25 countByEnumeratingWithState:&v54 objects:v53 count:16];
                      if (v26)
                      {
                        uint64_t v27 = v26;
                        uint64_t v28 = *(void *)v55;
                        while (2)
                        {
                          for (uint64_t i = 0; i != v27; ++i)
                          {
                            if (*(void *)v55 != v28) {
                              objc_enumerationMutation(v25);
                            }
                            uint64_t v30 = objc_msgSend((id)objc_msgSend(v12, "codecConfigurations"), "objectForKey:", *(void *)(*((void *)&v54 + 1) + 8 * i));
                            __int16 v31 = objc_alloc_init(VCMediaNegotiatorStreamGroupCodecConfiguration);
                            if (!v31)
                            {

                              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                              {
                                VRTraceErrorLogLevelToCSTR();
                                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                                  -[VCSessionParticipantLocal newStreamGroupNegotiationConfigForStreamGroup:].cold.6();
                                }
                              }
                              goto LABEL_56;
                            }
                            int v32 = v31;
                            -[VCMediaNegotiatorStreamGroupCodecConfiguration setCodecType:](v31, "setCodecType:", [v30 codecType]);
                            -[VCMediaNegotiatorStreamGroupCodecConfiguration setRtpPayload:](v32, "setRtpPayload:", [v30 networkPayload]);
                            -[VCMediaNegotiatorStreamGroupCodecConfiguration setPTime:](v32, "setPTime:", [v30 pTime]);
                            -[VCMediaNegotiatorStreamGroupCodecConfiguration setUseInBandFEC:](v32, "setUseInBandFEC:", [v30 isOpusInBandFecEnabled]);
                            -[VCMediaNegotiatorStreamGroupCodecConfiguration setRtcpSREnabled:](v32, "setRtcpSREnabled:", [v12 isRTCPEnabled]);
                            [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v32 setCipherSuite:v52];
                            [(VCMediaNegotiatorStreamGroupConfiguration *)v4 addCodecConfig:v32];
                            objc_msgSend(v14, "addCodec:", -[VCMediaNegotiatorStreamGroupConfiguration indexOfCodecConfig:](v4, "indexOfCodecConfig:", v32));
                          }
                          uint64_t v27 = [v25 countByEnumeratingWithState:&v54 objects:v53 count:16];
                          a3 = v45;
                          if (v27) {
                            continue;
                          }
                          break;
                        }
                      }
                    }
                    else
                    {
                      long long v61 = 0uLL;
                      long long v62 = 0uLL;
                      long long v59 = 0uLL;
                      long long v60 = 0uLL;
                      uint64_t v33 = objc_msgSend((id)objc_msgSend(v12, "txPayloadMap"), "allKeys");
                      uint64_t v34 = [v33 countByEnumeratingWithState:&v59 objects:v58 count:16];
                      if (v34)
                      {
                        uint64_t v35 = v34;
                        uint64_t v36 = *(void *)v60;
                        do
                        {
                          for (uint64_t j = 0; j != v35; ++j)
                          {
                            if (*(void *)v60 != v36) {
                              objc_enumerationMutation(v33);
                            }
                            objc_msgSend(v14, "addPayload:", objc_msgSend(*(id *)(*((void *)&v59 + 1) + 8 * j), "unsignedIntValue"));
                          }
                          uint64_t v35 = [v33 countByEnumeratingWithState:&v59 objects:v58 count:16];
                        }
                        while (v35);
                      }
                    }
                  }
                  [(VCMediaNegotiatorStreamGroupConfiguration *)v4 addStreamConfig:v14];

                  -[NSMutableSet addObjectsFromArray:](self->_localPublishedStreams, "addObjectsFromArray:", [v48 streamIds]);
                  p_info = (__objc2_class_ro **)(VCMediaControlInfo + 32);
                  p_superclass = (__objc2_class **)(VCRedundancyControlAlgorithmAudio + 8);
                }
                else
                {
                  __int16 v16 = v15;
                  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                  {
                    uint64_t v17 = VRTraceErrorLogLevelToCSTR();
                    int v18 = *MEMORY[0x1E4F47A50];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
                    {
                      int v19 = [v16 qualityIndex];
                      *(_DWORD *)buf = 136315906;
                      uint64_t v64 = v17;
                      __int16 v65 = 2080;
                      long long v66 = "-[VCSessionParticipantLocal newStreamGroupNegotiationConfigForStreamGroup:]";
                      __int16 v67 = 1024;
                      int v68 = 2458;
                      __int16 v69 = 1024;
                      int v70 = v19;
                      _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Skipping stream = %d", buf, 0x22u);
                    }
                  }
                }
                uint64_t v11 = v51 + 1;
              }
              while (v51 + 1 != v50);
              uint64_t v38 = [v46 countByEnumeratingWithState:&v72 objects:v71 count:16];
              uint64_t v50 = v38;
              if (v38) {
                continue;
              }
              break;
            }
          }
          uint64_t v8 = v44 + 1;
          uint64_t v6 = v41;
        }
        while (v44 + 1 != v42);
        uint64_t v39 = [obj countByEnumeratingWithState:&v77 objects:v76 count:16];
        uint64_t v6 = v41;
        uint64_t v42 = v39;
      }
      while (v39);
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionParticipantLocal newStreamGroupNegotiationConfigForStreamGroup:]();
      }
    }
LABEL_56:

    return 0;
  }
  return v4;
}

- (void)initializeMultiwayAudioStreamGroup:(id)a3 forLocalConfig:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = (void *)[a3 mediaStreamInfoArray];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "streamConfigs"), "objectAtIndexedSubscript:", 0), "multiwayConfig");
        if ([v11 negotiationProtocolMask]) {
          objc_msgSend(a4, "addMultiwayAudioStream:", -[VCSessionParticipantLocal multiwayAudioStreamNegotiatorConfigForStreamConfig:](self, "multiwayAudioStreamNegotiatorConfigForStreamConfig:", v11));
        }
        -[NSMutableSet addObjectsFromArray:](self->_localPublishedStreams, "addObjectsFromArray:", [v11 streamIds]);
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v12 count:16];
    }
    while (v8);
  }
}

- (void)initializeMultiwayVideoStreamGroup:(id)a3 forLocalConfig:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = (void *)[a3 mediaStreamInfoArray];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "streamConfigs"), "objectAtIndexedSubscript:", 0), "multiwayConfig");
        if ([v11 negotiationProtocolMask])
        {
          objc_msgSend(a4, "addMultiwayVideoStream:", -[VCSessionParticipantLocal multiwayVideoStreamNegotiatorConfigForStreamConfig:isSubstream:](self, "multiwayVideoStreamNegotiatorConfigForStreamConfig:isSubstream:", v11, 0));
          -[NSMutableSet addObjectsFromArray:](self->_localPublishedStreams, "addObjectsFromArray:", [v11 streamIds]);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v12 count:16];
    }
    while (v8);
  }
}

- (BOOL)initializeStreamGroupsForLocalConfig:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  char v5 = (void *)[(NSMutableDictionary *)self->super._streamGroups allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v14 count:16];
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
        if ([v10 streamGroupID] == 1667329381)
        {
          [(VCSessionParticipantLocal *)self initializeMultiwayVideoStreamGroup:v10 forLocalConfig:a3];
        }
        else if ([v10 streamGroupID] == 1835623282)
        {
          [(VCSessionParticipantLocal *)self initializeMultiwayAudioStreamGroup:v10 forLocalConfig:a3];
        }
        if (![(VCSessionParticipantLocal *)self initializeOneToOneStreamGroup:v10 forLocalConfig:a3])
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCSessionParticipantLocal initializeStreamGroupsForLocalConfig:]();
            }
          }
          char v11 = 0;
          char v12 = 0;
          return v11 | v12;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v14 count:16];
      if (v7) {
        continue;
      }
      break;
    }
    char v11 = 1;
  }
  else
  {
    char v11 = 0;
  }
  char v12 = 1;
  return v11 | v12;
}

- (BOOL)initializeOneToOneStreamGroup:(id)a3 forLocalConfig:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = -[VCSessionParticipantLocal newStreamGroupNegotiationConfigForStreamGroup:](self, "newStreamGroupNegotiationConfigForStreamGroup:");
  if (v6)
  {
    id v7 = -[VCMediaNegotiatorStreamGroupU1Configuration initStreamGroupU1ConfigForGroupId:withLocalConfig:]([VCMediaNegotiatorStreamGroupU1Configuration alloc], "initStreamGroupU1ConfigForGroupId:withLocalConfig:", [a3 streamGroupID], a4);
    if (v7)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        uint64_t v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v17 = 136315906;
          uint64_t v18 = v8;
          __int16 v19 = 2080;
          float v20 = "-[VCSessionParticipantLocal initializeOneToOneStreamGroup:forLocalConfig:]";
          __int16 v21 = 1024;
          int v22 = 2599;
          __int16 v23 = 2080;
          int v24 = FourccToCStr([v6 groupID]);
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Successfully created stream group U1 config for groupID=%s", (uint8_t *)&v17, 0x26u);
        }
      }
      [v6 setU1Config:v7];
    }
    else
    {
      BOOL v11 = +[VCMediaNegotiatorBase isU1StreamGroup:](VCMediaNegotiatorBase, "isU1StreamGroup:", [v6 groupID]);
      if (v11) {
        int v12 = 3;
      }
      else {
        int v12 = 5;
      }
      if (v12 > (int)VRTraceGetErrorLogLevelForModule())
      {
        char v10 = !v11;
        goto LABEL_17;
      }
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      long long v14 = *MEMORY[0x1E4F47A50];
      long long v15 = *MEMORY[0x1E4F47A50];
      if (v11)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantLocal initializeOneToOneStreamGroup:forLocalConfig:]();
        }
        char v10 = 0;
        goto LABEL_17;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136315906;
        uint64_t v18 = v13;
        __int16 v19 = 2080;
        float v20 = "-[VCSessionParticipantLocal initializeOneToOneStreamGroup:forLocalConfig:]";
        __int16 v21 = 1024;
        int v22 = 2606;
        __int16 v23 = 2080;
        int v24 = FourccToCStr([v6 groupID]);
        _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to create stream group U1 config for groupID=%s", (uint8_t *)&v17, 0x26u);
      }
    }
    char v10 = 1;
LABEL_17:
    [a4 addStreamGroupConfig:v6];

    goto LABEL_18;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCSessionParticipantLocal initializeOneToOneStreamGroup:forLocalConfig:]();
    }
  }
  char v10 = 0;
LABEL_18:

  return v10;
}

- (id)featureListString:(id)a3 removingPayload:(int)a4 andPayload:(int)a5 mediaType:(unsigned __int8)a6
{
  id result = a3;
  if (a6 == 2)
  {
    uint64_t v8 = *(void *)&a5;
    uint64_t v9 = *(void *)&a4;
    char v10 = (void *)[a3 mutableCopy];
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, objc_msgSend(NSNumber, "numberWithUnsignedInt:", v9));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, objc_msgSend(NSNumber, "numberWithUnsignedInt:", v8));
    return v10;
  }
  return result;
}

- (BOOL)addVideoConfigurationsToLocalConfiguration:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int v5 = 2;
  id v6 = [(VCSessionParticipantLocal *)self newVideoConfigurationForMediaType:2];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = 1u;
    while (1)
    {
      [a3 setMediaConfiguration:v7 forMediaType:v5];

      if (v8 == 4) {
        return 1;
      }
      int v5 = *((unsigned __int8 *)&unk_1E25A01F0 + v8);
      id v7 = [(VCSessionParticipantLocal *)self newVideoConfigurationForMediaType:*((unsigned __int8 *)&unk_1E25A01F0 + v8++)];
      if (!v7)
      {
        BOOL v9 = (unint64_t)(v8 - 2) > 2;
        goto LABEL_6;
      }
    }
  }
  else
  {
    BOOL v9 = 0;
LABEL_6:
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantLocal addVideoConfigurationsToLocalConfiguration:](v12);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        char v10 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
      }
      else {
        char v10 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        long long v14 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v15 = 136316418;
          uint64_t v16 = v13;
          __int16 v17 = 2080;
          uint64_t v18 = "-[VCSessionParticipantLocal addVideoConfigurationsToLocalConfiguration:]";
          __int16 v19 = 1024;
          int v20 = 2637;
          __int16 v21 = 2112;
          int v22 = v10;
          __int16 v23 = 2048;
          int v24 = self;
          __int16 v25 = 1024;
          int v26 = v5;
          _os_log_error_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to create videoConfiguration for mediaType=%hhu", (uint8_t *)&v15, 0x36u);
        }
      }
    }
  }
  return v9;
}

- (BOOL)addMediaConfigurationsToLocalConfiguration:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = [(VCSessionParticipantLocal *)self newMediaNegotiatorAudioConfigurationForMediaType:0];
  if (!v5)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantLocal addMediaConfigurationsToLocalConfiguration:]();
        }
      }
      goto LABEL_30;
    }
    if (objc_opt_respondsToSelector()) {
      char v10 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      char v10 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_30;
    }
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    long long v14 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    int v19 = 136316162;
    uint64_t v20 = v13;
    __int16 v21 = 2080;
    int v22 = "-[VCSessionParticipantLocal addMediaConfigurationsToLocalConfiguration:]";
    __int16 v23 = 1024;
    int v24 = 2653;
    __int16 v25 = 2112;
    int v26 = v10;
    __int16 v27 = 2048;
    uint64_t v28 = self;
    int v15 = " [%s] %s:%d %@(%p) Failed to create microphoneConfiguration";
    goto LABEL_37;
  }
  id v6 = [(VCSessionParticipantLocal *)self newMediaNegotiatorAudioConfigurationForMediaType:3];
  if (!v6)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantLocal addMediaConfigurationsToLocalConfiguration:]();
        }
      }
      goto LABEL_30;
    }
    if (objc_opt_respondsToSelector()) {
      BOOL v11 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      BOOL v11 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (uint64_t v16 = VRTraceErrorLogLevelToCSTR(),
          long long v14 = *MEMORY[0x1E4F47A50],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
LABEL_30:
      id v7 = 0;
LABEL_31:
      BOOL v8 = 0;
      goto LABEL_4;
    }
    int v19 = 136316162;
    uint64_t v20 = v16;
    __int16 v21 = 2080;
    int v22 = "-[VCSessionParticipantLocal addMediaConfigurationsToLocalConfiguration:]";
    __int16 v23 = 1024;
    int v24 = 2657;
    __int16 v25 = 2112;
    int v26 = v11;
    __int16 v27 = 2048;
    uint64_t v28 = self;
    int v15 = " [%s] %s:%d %@(%p) Failed to create systemAudioConfiguration";
LABEL_37:
    _os_log_error_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v19, 0x30u);
    goto LABEL_30;
  }
  id v7 = v6;
  BOOL v8 = 1;
  [a3 setMediaConfiguration:v5 forMediaType:1];
  [a3 setMediaConfiguration:v7 forMediaType:4];
  if (![(VCSessionParticipantLocal *)self addVideoConfigurationsToLocalConfiguration:a3])
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantLocal addMediaConfigurationsToLocalConfiguration:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v12 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v12 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v17 = VRTraceErrorLogLevelToCSTR();
        uint64_t v18 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v19 = 136316162;
          uint64_t v20 = v17;
          __int16 v21 = 2080;
          int v22 = "-[VCSessionParticipantLocal addMediaConfigurationsToLocalConfiguration:]";
          __int16 v23 = 1024;
          int v24 = 2664;
          __int16 v25 = 2112;
          int v26 = v12;
          __int16 v27 = 2048;
          uint64_t v28 = self;
          _os_log_error_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to add U+1 video configurations to local settings", (uint8_t *)&v19, 0x30u);
        }
      }
    }
    goto LABEL_31;
  }
LABEL_4:

  return v8;
}

- (BOOL)initializeMediaNegotiator
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [[VCBitrateArbiter alloc] initWithDeviceRole:0 callLogFile:0];
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionParticipantLocal initializeMediaNegotiator]();
      }
    }
    goto LABEL_15;
  }
  uint64_t v4 = [[VCMediaNegotiatorLocalConfiguration alloc] initWithBitrateArbiter:v3];
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionParticipantLocal initializeMediaNegotiator]();
      }
    }
LABEL_15:
    id v5 = 0;
LABEL_16:
    BOOL v7 = 0;
    goto LABEL_8;
  }
  id v5 = v4;
  [(VCMediaNegotiatorLocalConfiguration *)v4 setPreferredAudioCodec:104];
  [(VCMediaNegotiatorLocalConfiguration *)v5 setAllowRTCPFB:0];
  [(VCMediaNegotiatorLocalConfiguration *)v5 setIsCaller:1];
  [(VCMediaNegotiatorLocalConfiguration *)v5 setCallLogFile:0];
  [(VCMediaNegotiatorLocalConfiguration *)v5 setBasebandCodec:0];
  [(VCMediaNegotiatorLocalConfiguration *)v5 setBasebandCodecSampleRate:0];
  [(VCMediaNegotiatorLocalConfiguration *)v5 setCreationTime:self->super._creationTime.wide];
  [(VCMediaNegotiatorLocalConfiguration *)v5 setOneToOneAuthTagEnabled:self->_isOneToOneAuthenticationTagEnabled];
  if ([+[VCDefaults sharedInstance](VCDefaults, "sharedInstance") supportsOneToOneMode]&& !+[VCDefaults BOOLeanValueForKey:@"simulateWebRTCOnlyClient" defaultValue:0])
  {
    [(VCMediaNegotiatorLocalConfiguration *)v5 setOneToOneModeSupported:1];
    [(VCMediaNegotiatorLocalConfiguration *)v5 setMediaControlInfoVersion:2];
  }
  [(VCSessionParticipantLocal *)self addMediaConfigurationsToLocalConfiguration:v5];
  if (![(VCSessionParticipantLocal *)self initializeStreamGroupsForLocalConfig:v5])
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantLocal initializeMediaNegotiator]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        BOOL v9 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
      }
      else {
        BOOL v9 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        BOOL v11 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v12 = 136316162;
          uint64_t v13 = v10;
          __int16 v14 = 2080;
          int v15 = "-[VCSessionParticipantLocal initializeMediaNegotiator]";
          __int16 v16 = 1024;
          int v17 = 2697;
          __int16 v18 = 2112;
          int v19 = v9;
          __int16 v20 = 2048;
          __int16 v21 = self;
          _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to initialize stream groups for local configuration", (uint8_t *)&v12, 0x30u);
        }
      }
    }
    goto LABEL_16;
  }
  [(VCMediaNegotiatorLocalConfiguration *)v5 setMediaRecorderVideoCodecs:[+[VCVideoRuleCollectionsMediaRecorder sharedInstance] mediaRecorderVideoCodecs]];
  [(VCMediaNegotiatorLocalConfiguration *)v5 setMediaRecorderImageTypes:[+[VCVideoRuleCollectionsMediaRecorder sharedInstance] mediaRecorderImageTypes]];

  id v6 = objc_alloc_init(VCSwitchManager);
  self->_oneToOneSettings.switchManager = v6;
  [(VCSwitchManager *)v6 initializeLocalSwitches];
  [(VCMediaNegotiatorLocalConfiguration *)v5 setFaceTimeSwitches:[(VCSwitchManager *)self->_oneToOneSettings.switchManager localSwitches]];
  self->super._mediaNegotiator = [[VCSessionMediaNegotiator alloc] initWithLocalConfiguration:v5];
  BOOL v7 = 1;
LABEL_8:

  return v7;
}

- (void)updatePayloadTypesWithVideoConfigs:(id)a3
{
  if ((int)[a3 count] >= 1)
  {
    uint64_t v5 = 0;
    do
      -[NSMutableSet addObjectsFromArray:](self->_videoPayloadTypes, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v5++), "txPayloadMap"), "allKeys"));
    while (v5 < (int)[a3 count]);
  }
}

- (void)updatePayloadTypesWithAudioConfigs:(id)a3
{
  if ((int)[a3 count] >= 1)
  {
    uint64_t v5 = 0;
    do
    {
      id v6 = (void *)[a3 objectAtIndexedSubscript:v5];
      -[NSMutableSet addObjectsFromArray:](self->_audioPayloadTypes, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(v6, "txPayloadMap"), "allKeys"));
      -[NSMutableSet addObjectsFromArray:](self->_audioPayloadTypes, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "multiwayConfig"), "txPayloadMap"), "allKeys"));
      ++v5;
    }
    while (v5 < (int)[a3 count]);
  }
}

- (unsigned)oneToOneVideoStreamRedundancyPercentage
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v2 = [(VCSwitchManager *)self->_oneToOneSettings.switchManager isSwitchEnabled:4];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  uint64_t v4 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    id v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315906;
      uint64_t v16 = v5;
      __int16 v17 = 2080;
      __int16 v18 = "-[VCSessionParticipantLocal oneToOneVideoStreamRedundancyPercentage]";
      __int16 v19 = 1024;
      int v20 = 2735;
      __int16 v21 = 1024;
      unsigned int v22 = v2;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Load switch highFecEnabled %d", (uint8_t *)&v15, 0x22u);
    }
  }
  objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-video-redundancy-percentage-max", @"videoRedundancyPercentageMax", &unk_1F3DC4B30, 1), "doubleValue");
  unsigned int v8 = v7;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315906;
      uint64_t v16 = v9;
      __int16 v17 = 2080;
      __int16 v18 = "-[VCSessionParticipantLocal oneToOneVideoStreamRedundancyPercentage]";
      __int16 v19 = 1024;
      int v20 = 2737;
      __int16 v21 = 1024;
      unsigned int v22 = v8;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d currentRedundancyPercentage before abTestSwitch %d", (uint8_t *)&v15, 0x22u);
    }
  }
  if (v2) {
    unsigned int v11 = v8;
  }
  else {
    unsigned int v11 = 100;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    uint64_t v13 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315906;
      uint64_t v16 = v12;
      __int16 v17 = 2080;
      __int16 v18 = "-[VCSessionParticipantLocal oneToOneVideoStreamRedundancyPercentage]";
      __int16 v19 = 1024;
      int v20 = 2739;
      __int16 v21 = 1024;
      unsigned int v22 = v11;
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d maxAllowedRedundancyPercentage after abTestSwitch %d", (uint8_t *)&v15, 0x22u);
    }
  }
  return v11;
}

- (unsigned)oneToOneVideoStreamRedundancyMode
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(VCSwitchManager *)self->_oneToOneSettings.switchManager isSwitchEnabled:16];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315906;
      uint64_t v8 = v4;
      __int16 v9 = 2080;
      uint64_t v10 = "-[VCSessionParticipantLocal oneToOneVideoStreamRedundancyMode]";
      __int16 v11 = 1024;
      int v12 = 2746;
      __int16 v13 = 1024;
      BOOL v14 = v3;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Load switch vplrFecEnabled %d", (uint8_t *)&v7, 0x22u);
    }
  }
  if ([(VCMediaNegotiatorResults *)[(VCSessionMediaNegotiator *)self->super._mediaNegotiator negotiatedSettings] mediaControlInfoVersion] > 1&& v3)
  {
    return 6;
  }
  else
  {
    return 5;
  }
}

- (unsigned)oneToOneAudioStreamRedundancyMode
{
  if ([(VCMediaNegotiatorResultsAudio *)[(VCSessionMediaNegotiator *)self->super._mediaNegotiator negotiatedAudioSettings] redPayload] != 20)return 1; {
  if (self->_isHigherAudioREDCutoverU1Enabled)
  }
    return 3;
  return 2;
}

- (int)negotiateOneToOne:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[(VCMediaNegotiatorLocalConfiguration *)[(VCSessionMediaNegotiator *)self->super._mediaNegotiator localSettings] copy];
  id v6 = v5;
  if (!v5)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v13 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v13 = &stru_1F3D3E450;
      }
      int v11 = -2143813630;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_45;
      }
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      __int16 v19 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_45;
      }
      int v27 = 136316162;
      uint64_t v28 = v18;
      __int16 v29 = 2080;
      uint64_t v30 = "-[VCSessionParticipantLocal negotiateOneToOne:]";
      __int16 v31 = 1024;
      int v32 = 2766;
      __int16 v33 = 2112;
      uint64_t v34 = v13;
      __int16 v35 = 2048;
      uint64_t v36 = self;
      int v20 = " [%s] %s:%d %@(%p) Failed to copy the local configuration";
LABEL_60:
      _os_log_error_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v27, 0x30u);
      goto LABEL_61;
    }
    int v11 = -2143813630;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        -[VCSessionParticipantLocal negotiateOneToOne:]();
LABEL_61:
        uint64_t v8 = 0;
        int v11 = -2143813630;
        goto LABEL_7;
      }
    }
LABEL_45:
    uint64_t v8 = 0;
    goto LABEL_7;
  }
  [v5 setIsCaller:0];
  int v7 = [[VCSessionMediaNegotiator alloc] initWithLocalConfiguration:v6];
  if (!v7)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        BOOL v14 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
      }
      else {
        BOOL v14 = &stru_1F3D3E450;
      }
      int v11 = -2143813630;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_45;
      }
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      __int16 v19 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_45;
      }
      int v27 = 136316162;
      uint64_t v28 = v21;
      __int16 v29 = 2080;
      uint64_t v30 = "-[VCSessionParticipantLocal negotiateOneToOne:]";
      __int16 v31 = 1024;
      int v32 = 2770;
      __int16 v33 = 2112;
      uint64_t v34 = v14;
      __int16 v35 = 2048;
      uint64_t v36 = self;
      int v20 = " [%s] %s:%d %@(%p) Failed to reinitialize the 1:1 media negotiator";
      goto LABEL_60;
    }
    int v11 = -2143813630;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        -[VCSessionParticipantLocal negotiateOneToOne:]();
        goto LABEL_61;
      }
    }
    goto LABEL_45;
  }
  uint64_t v8 = v7;
  id v9 = +[VCSessionParticipant participantInfoWithParticipantData:](VCSessionParticipant, "participantInfoWithParticipantData:", [a3 opaqueData]);
  [(VCSessionParticipantLocal *)self logRemoteParticipantInfo:v9];
  uint64_t v10 = [v9 objectForKeyedSubscript:@"vcSessionParticipantKeyMediaNegotiationData"];
  if (!v10)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      int v11 = -2143813631;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantLocal negotiateOneToOne:]();
        }
      }
      goto LABEL_7;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v15 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v15 = &stru_1F3D3E450;
    }
    int v11 = -2143813631;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_7;
    }
    uint64_t v22 = VRTraceErrorLogLevelToCSTR();
    uint64_t v23 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    int v27 = 136316162;
    uint64_t v28 = v22;
    __int16 v29 = 2080;
    uint64_t v30 = "-[VCSessionParticipantLocal negotiateOneToOne:]";
    __int16 v31 = 1024;
    int v32 = 2776;
    __int16 v33 = 2112;
    uint64_t v34 = v15;
    __int16 v35 = 2048;
    uint64_t v36 = self;
    int v24 = " [%s] %s:%d %@(%p) Failed to extract media blob from remote participant info";
LABEL_58:
    _os_log_error_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_ERROR, v24, (uint8_t *)&v27, 0x30u);
    goto LABEL_7;
  }
  if (![(VCSessionMediaNegotiator *)v8 processRemoteNegotiationData:v10])
  {
    int v11 = -2143813631;
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantLocal negotiateOneToOne:].cold.5();
        }
      }
      goto LABEL_7;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v16 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v16 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_7;
    }
    uint64_t v25 = VRTraceErrorLogLevelToCSTR();
    uint64_t v23 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    int v27 = 136316162;
    uint64_t v28 = v25;
    __int16 v29 = 2080;
    uint64_t v30 = "-[VCSessionParticipantLocal negotiateOneToOne:]";
    __int16 v31 = 1024;
    int v32 = 2779;
    __int16 v33 = 2112;
    uint64_t v34 = v16;
    __int16 v35 = 2048;
    uint64_t v36 = self;
    int v24 = " [%s] %s:%d %@(%p) Failed to negotiate one to one settings with remote media blob";
    goto LABEL_58;
  }
  if ([(VCMediaNegotiatorResultsFaceTimeSettings *)[(VCSessionMediaNegotiator *)v8 negotiatedFaceTimeSettings] oneToOneModeSupported])
  {

    int v11 = 0;
    self->super._mediaNegotiator = v8;
    goto LABEL_7;
  }
  int v11 = -2143813631;
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionParticipantLocal negotiateOneToOne:].cold.4();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      __int16 v17 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v17 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v26 = VRTraceErrorLogLevelToCSTR();
      uint64_t v23 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v27 = 136316162;
        uint64_t v28 = v26;
        __int16 v29 = 2080;
        uint64_t v30 = "-[VCSessionParticipantLocal negotiateOneToOne:]";
        __int16 v31 = 1024;
        int v32 = 2780;
        __int16 v33 = 2112;
        uint64_t v34 = v17;
        __int16 v35 = 2048;
        uint64_t v36 = self;
        int v24 = " [%s] %s:%d %@(%p) Failed to negotiate with devices that does not support one to one";
        goto LABEL_58;
      }
    }
  }
LABEL_7:

  return v11;
}

- (void)logRemoteParticipantInfo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v3 = -[VCCallInfoBlob initWithData:]([VCCallInfoBlob alloc], "initWithData:", [a3 objectForKeyedSubscript:@"vcSessionParticipantKeyCallInfoBlob"]);
  if (v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (objc_msgSend((id)-[VCCallInfoBlob formattedText](v3, "formattedText"), "stringByReplacingOccurrencesOfString:withString:", @"\n", @", "))
        {
          id v6 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[VCCallInfoBlob formattedText](v3, "formattedText"), "stringByReplacingOccurrencesOfString:withString:", @"\n", @", "), "description"), "UTF8String");
        }
        else
        {
          id v6 = "<nil>";
        }
        int v7 = 136315906;
        uint64_t v8 = v4;
        __int16 v9 = 2080;
        uint64_t v10 = "-[VCSessionParticipantLocal logRemoteParticipantInfo:]";
        __int16 v11 = 1024;
        int v12 = 2796;
        __int16 v13 = 2080;
        BOOL v14 = v6;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Remote callInfoBlob = %s", (uint8_t *)&v7, 0x26u);
      }
    }
  }
}

- (void)overrideVideoStreamConfigWithDefaults:(id)a3 streamGroupID:(unsigned int)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a4 == 1667329381)
  {
    if ([+[VCDefaults sharedInstance] forceHWI])
    {
      [a3 setVideoResolution:27];
      objc_msgSend(a3, "setCustomWidth:", -[VCDefaults forceEncodeWidth](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceEncodeWidth"));
      objc_msgSend(a3, "setCustomHeight:", -[VCDefaults forceEncodeHeight](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceEncodeHeight"));
      objc_msgSend(a3, "setFramerate:", -[VCDefaults forceFramerate](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceFramerate"));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v5 = VRTraceErrorLogLevelToCSTR();
        id v6 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v7 = 136316418;
          uint64_t v8 = v5;
          __int16 v9 = 2080;
          uint64_t v10 = "-[VCSessionParticipantLocal overrideVideoStreamConfigWithDefaults:streamGroupID:]";
          __int16 v11 = 1024;
          int v12 = 2808;
          __int16 v13 = 2048;
          uint64_t v14 = [a3 customWidth];
          __int16 v15 = 2048;
          uint64_t v16 = [a3 customHeight];
          __int16 v17 = 2048;
          uint64_t v18 = [a3 framerate];
          _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d forcing oneToOneVideoConfig settings width=%lu, height=%lu, framerate=%lufps", (uint8_t *)&v7, 0x3Au);
        }
      }
    }
  }
}

- (BOOL)setupOneToOneVideoStreamWithConfig:(id)a3 streamGroupID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = [(VCSessionParticipantLocal *)self newVideoStreamOneToOneConfigurationWithStreamGroupId:*(void *)&a4];
  if (!v7)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantLocal setupOneToOneVideoStreamWithConfig:streamGroupID:]();
        }
      }
      goto LABEL_38;
    }
    if (objc_opt_respondsToSelector()) {
      int v20 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      int v20 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_38;
    }
    uint64_t v22 = VRTraceErrorLogLevelToCSTR();
    uint64_t v23 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_38;
    }
    int v26 = 136316418;
    uint64_t v27 = v22;
    __int16 v28 = 2080;
    __int16 v29 = "-[VCSessionParticipantLocal setupOneToOneVideoStreamWithConfig:streamGroupID:]";
    __int16 v30 = 1024;
    int v31 = 2819;
    __int16 v32 = 2112;
    __int16 v33 = v20;
    __int16 v34 = 2048;
    __int16 v35 = self;
    __int16 v36 = 2080;
    uint64_t v37 = FourccToCStr(v4);
    int v24 = " [%s] %s:%d %@(%p) Error setting up the config for one-to-one mode for streamGroupId=%s";
    goto LABEL_40;
  }
  objc_msgSend((id)objc_msgSend(v7, "multiwayConfig"), "setRemoteIDSParticipantID:", objc_msgSend(a3, "idsParticipantID"));
  objc_msgSend(v7, "setTxMaxBitrate:", 1000* -[VCSessionMediaNegotiator remoteMaxBandwidthForArbiterMode:connectionType:](self->super._mediaNegotiator, "remoteMaxBandwidthForArbiterMode:connectionType:", 1, 3));
  objc_msgSend(v7, "setVideoResolution:", objc_msgSend((id)objc_msgSend(v7, "multiwayConfig"), "resolution"));
  if (v4 == 1935897189) {
    [v7 setPixelFormat:875704422];
  }
  [(VCSessionParticipantLocal *)self overrideVideoStreamConfigWithDefaults:v7 streamGroupID:v4];
  id v8 = [(VCSessionParticipantLocal *)self newStreamInfoWithVideoStreamWithConfiguration:v7 streamGroupID:v4 rtpCipherSuite:[(VCMediaNegotiatorResultsVideo *)[(VCSessionMediaNegotiator *)self->super._mediaNegotiator negotiatedVideoSettings] cipherSuite]];
  if (!v8)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantLocal setupOneToOneVideoStreamWithConfig:streamGroupID:]();
        }
      }
      goto LABEL_38;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v21 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v21 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (uint64_t v25 = VRTraceErrorLogLevelToCSTR(),
          uint64_t v23 = *MEMORY[0x1E4F47A50],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
LABEL_38:
      int v12 = 0;
      uint64_t v14 = 0;
      __int16 v9 = 0;
LABEL_13:
      BOOL v16 = 0;
      goto LABEL_14;
    }
    int v26 = 136316418;
    uint64_t v27 = v25;
    __int16 v28 = 2080;
    __int16 v29 = "-[VCSessionParticipantLocal setupOneToOneVideoStreamWithConfig:streamGroupID:]";
    __int16 v30 = 1024;
    int v31 = 2830;
    __int16 v32 = 2112;
    __int16 v33 = v21;
    __int16 v34 = 2048;
    __int16 v35 = self;
    __int16 v36 = 2080;
    uint64_t v37 = FourccToCStr(v4);
    int v24 = " [%s] %s:%d %@(%p) Failed to set up video stream for streamGroupId=%s";
LABEL_40:
    _os_log_error_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_ERROR, v24, (uint8_t *)&v26, 0x3Au);
    goto LABEL_38;
  }
  __int16 v9 = v8;
  -[NSMutableDictionary setObject:forKey:](self->_oneToOneSettings.streamInfo, "setObject:forKey:", v8, [NSNumber numberWithUnsignedInt:v4]);
  [(VCSessionParticipantLocal *)self updateOneToOneBandwidthAllocationTable:v9 mediaType:2 streamGroupID:v4];
  uint64_t v10 = [(VCSessionParticipantLocal *)self oneToOneVideoStreamRedundancyMode];
  uint64_t v11 = [(VCSessionParticipantLocal *)self oneToOneVideoStreamRedundancyPercentage];
  int v12 = objc_msgSend(-[VCSessionMediaStreamPresenceConfigurationProvider defaultEndToEndStreamGroupConfigurationForStreamGroup:](self->_presenceProvider, "defaultEndToEndStreamGroupConfigurationForStreamGroup:", v4), "mutableCopy");
  objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v10), @"streamGroupRedundancyMode");
  objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v11), @"streamGroupRedundancyPercent");
  __int16 v13 = [(VCSessionParticipantLocal *)self newVideoSendGroupConfigWithStreamGroupID:v4 streamGroupConfiguration:v12];
  if (!v13)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionParticipantLocal setupOneToOneVideoStreamWithConfig:streamGroupID:]();
      }
    }
    uint64_t v14 = 0;
    goto LABEL_13;
  }
  uint64_t v14 = v13;
  if (v4 == 1935897189)
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "streamConfigs"), "firstObject"), "setIsRedundancyControlEnabled:", 1);
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "streamConfigs"), "firstObject"), "setMaxRedundancyPercentage:", 100);
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "streamConfigs"), "firstObject"), "setRedundancyControllerMode:", 9);
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "streamConfigs"), "firstObject"), "setRedundancyControllerFECVersion:", 1);
  }
  else
  {
    [(VCSessionParticipant *)v13 setStatisticsCollector:[(VCSessionParticipantOneToOneConfig *)self->super._oneToOneConfig statisticsCollector]];
  }
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "streamConfigs"), "firstObject"), "setCaptureSource:", -[VCSessionParticipantLocal captureSource](v14, "captureSource"));
  [(VCSessionParticipantLocal *)v14 addMediaStreamInfo:v9];
  __int16 v15 = [(VCSessionParticipant *)self streamGroupWithID:v4];
  BOOL v16 = 1;
  if (([(__CFString *)v15 updateConfig:v14 forMode:1] & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      uint64_t v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v26 = 136316162;
        uint64_t v27 = v17;
        __int16 v28 = 2080;
        __int16 v29 = "-[VCSessionParticipantLocal setupOneToOneVideoStreamWithConfig:streamGroupID:]";
        __int16 v30 = 1024;
        int v31 = 2862;
        __int16 v32 = 2112;
        __int16 v33 = v15;
        __int16 v34 = 2112;
        __int16 v35 = v14;
        _os_log_error_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to update config for stream group=%@ configuration=%@", (uint8_t *)&v26, 0x30u);
      }
    }
    goto LABEL_13;
  }
LABEL_14:

  return v16;
}

- (void)setupOneToOneAudioStreamWithConfig:(id)a3 streamGroupID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = [(VCSessionParticipantLocal *)self newAudioStreamOneToOneConfigurationWithStreamGroupId:*(void *)&a4];
  if (!v7)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantLocal setupOneToOneAudioStreamWithConfig:streamGroupID:]();
        }
      }
      goto LABEL_39;
    }
    if (objc_opt_respondsToSelector()) {
      int v20 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      int v20 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_39;
    }
    uint64_t v22 = VRTraceErrorLogLevelToCSTR();
    uint64_t v23 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    *(_DWORD *)buf = 136316418;
    uint64_t v29 = v22;
    __int16 v30 = 2080;
    int v31 = "-[VCSessionParticipantLocal setupOneToOneAudioStreamWithConfig:streamGroupID:]";
    __int16 v32 = 1024;
    int v33 = 2879;
    __int16 v34 = 2112;
    __int16 v35 = v20;
    __int16 v36 = 2048;
    uint64_t v37 = self;
    __int16 v38 = 2080;
    uint64_t v39 = FourccToCStr(v4);
    int v24 = " [%s] %s:%d %@(%p) Error setting up the audio config for one-to-one mode for streamGroupId=%s";
    goto LABEL_41;
  }
  networkFeedbackController = self->super._networkFeedbackController;
  __int16 v9 = (VCNetworkFeedbackController *)[a3 networkFeedbackController];
  self->super._networkFeedbackController = v9;
  if (v9) {
    CFRetain(v9);
  }
  if (networkFeedbackController) {
    CFRelease(networkFeedbackController);
  }
  objc_msgSend((id)objc_msgSend(v7, "multiwayConfig"), "setMaxNetworkBitrate:", 1000* -[VCSessionMediaNegotiator remoteMaxBandwidthForArbiterMode:connectionType:](self->super._mediaNegotiator, "remoteMaxBandwidthForArbiterMode:connectionType:", VCBitrateArbiter_ModeFromOperatingMode(-[VCSessionParticipant operatingMode](self, "operatingMode")), 3));
  objc_msgSend(v7, "setUseWifiTiers:", objc_msgSend(a3, "initUsingWifiTiers"));
  id v10 = -[VCSessionParticipantLocal newStreamInfoWithAudioStreamWithConfiguration:idsDestination:isMultiway:streamGroupID:streamToken:](self, "newStreamInfoWithAudioStreamWithConfiguration:idsDestination:isMultiway:streamGroupID:streamToken:", v7, self->super._idsDestination, 0, v4, objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._participantStreamTokens, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v4)), "unsignedIntValue"));
  if (!v10)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantLocal setupOneToOneAudioStreamWithConfig:streamGroupID:]();
        }
      }
      goto LABEL_39;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v21 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v21 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (uint64_t v25 = VRTraceErrorLogLevelToCSTR(),
          uint64_t v23 = *MEMORY[0x1E4F47A50],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
LABEL_39:
      BOOL v16 = 0;
      uint64_t v11 = 0;
      goto LABEL_15;
    }
    *(_DWORD *)buf = 136316418;
    uint64_t v29 = v25;
    __int16 v30 = 2080;
    int v31 = "-[VCSessionParticipantLocal setupOneToOneAudioStreamWithConfig:streamGroupID:]";
    __int16 v32 = 1024;
    int v33 = 2889;
    __int16 v34 = 2112;
    __int16 v35 = v21;
    __int16 v36 = 2048;
    uint64_t v37 = self;
    __int16 v38 = 2080;
    uint64_t v39 = FourccToCStr(v4);
    int v24 = " [%s] %s:%d %@(%p) Error setting up the audio stream for one-to-one mode for streamGroupId=%s";
LABEL_41:
    _os_log_error_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_ERROR, v24, buf, 0x3Au);
    goto LABEL_39;
  }
  uint64_t v11 = v10;
  [(VCSessionParticipantLocal *)self updateOneToOneBandwidthAllocationTable:v10 mediaType:1 streamGroupID:v4];
  uint64_t v12 = [(VCSessionParticipantLocal *)self oneToOneAudioStreamRedundancyMode];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    uint64_t v14 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v29 = v13;
      __int16 v30 = 2080;
      int v31 = "-[VCSessionParticipantLocal setupOneToOneAudioStreamWithConfig:streamGroupID:]";
      __int16 v32 = 1024;
      int v33 = 2894;
      __int16 v34 = 1024;
      LODWORD(v35) = v12;
      _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Audio Redundancy Mode=%u", buf, 0x22u);
    }
  }
  v27[0] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", v4, @"streamGroupID");
  v27[1] = &unk_1F3DC4B18;
  v26[1] = @"streamGroupMode";
  v26[2] = @"streamGroupRedundancyMode";
  v27[2] = [NSNumber numberWithUnsignedInt:v12];
  __int16 v15 = -[VCSessionParticipantLocal newAudioSendGroupConfigWithStreamGroupID:streamGroupConfiguration:](self, "newAudioSendGroupConfigWithStreamGroupID:streamGroupConfiguration:", v4, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3]);
  if (v15)
  {
    BOOL v16 = v15;
    [(VCSessionParticipant *)v15 setStatisticsCollector:[(VCSessionParticipantOneToOneConfig *)self->super._oneToOneConfig statisticsCollector]];
    [(VCSessionParticipantLocal *)v16 addMediaStreamInfo:v11];
    uint64_t v17 = [(VCSessionParticipant *)self streamGroupWithID:v4];
    if (([(__CFString *)v17 updateConfig:v16 forMode:1] & 1) == 0
      && (int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      uint64_t v19 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v29 = v18;
        __int16 v30 = 2080;
        int v31 = "-[VCSessionParticipantLocal setupOneToOneAudioStreamWithConfig:streamGroupID:]";
        __int16 v32 = 1024;
        int v33 = 2909;
        __int16 v34 = 2112;
        __int16 v35 = v17;
        __int16 v36 = 2112;
        uint64_t v37 = v16;
        _os_log_error_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to update config for stream group=%@ configuration=%@", buf, 0x30u);
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionParticipantLocal setupOneToOneAudioStreamWithConfig:streamGroupID:]();
      }
    }
    BOOL v16 = 0;
  }
LABEL_15:
}

- (BOOL)configureMultiwayStreamGroups
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v3 = (void *)[(NSMutableDictionary *)self->super._streamGroups allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v15 != v6) {
        objc_enumerationMutation(v3);
      }
      id v8 = *(void **)(*((void *)&v14 + 1) + 8 * v7);
      objc_msgSend(v8, "setReportingAgent:", -[VCSessionParticipant reportingAgent](self, "reportingAgent"));
      __int16 v9 = (void *)[v8 streamGroupConfigForMode:0];
      if (v9)
      {
        id v10 = v9;
        if (!-[VCSessionParticipant configureStreamInfosForMultiway:streamGroupID:](self, "configureStreamInfosForMultiway:streamGroupID:", [v9 mediaStreamInfoArray], objc_msgSend(v8, "streamGroupID")))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
            if (!v11) {
              return v11;
            }
            -[VCSessionParticipantLocal configureMultiwayStreamGroups]();
          }
LABEL_19:
          LOBYTE(v11) = 0;
          return v11;
        }
        if (([v8 updateConfig:v10 forMode:0] & 1) == 0)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
            if (!v11) {
              return v11;
            }
            -[VCSessionParticipantLocal configureMultiwayStreamGroups]();
          }
          goto LABEL_19;
        }
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v13 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  LOBYTE(v11) = 1;
  return v11;
}

- (BOOL)configureWithOneToOneParticipantConfig:(id)a3 shouldConfigureGFTStreams:(BOOL)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__VCSessionParticipantLocal_configureWithOneToOneParticipantConfig_shouldConfigureGFTStreams___block_invoke;
  block[3] = &unk_1E6DB6A40;
  block[4] = self;
  void block[5] = a3;
  BOOL v8 = a4;
  void block[6] = &v9;
  dispatch_sync(participantQueue, block);
  char v5 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __94__VCSessionParticipantLocal_configureWithOneToOneParticipantConfig_shouldConfigureGFTStreams___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    BOOL v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v37 = 136315650;
      *(void *)&v37[4] = v2;
      *(_WORD *)&v37[12] = 2080;
      *(void *)&v37[14] = "-[VCSessionParticipantLocal configureWithOneToOneParticipantConfig:shouldConfigureGFTStreams:]_block_invoke";
      *(_WORD *)&v37[22] = 1024;
      LODWORD(v38) = 2943;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting one-to-one remote participant data", v37, 0x1Cu);
    }
  }
  [*(id *)(a1 + 32) setOneToOneConfig:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setupOneToOneAudioStreamWithConfig:*(void *)(a1 + 40) streamGroupID:1835623282];
  if ([*(id *)(a1 + 40) negotiatedVideoEnabled]) {
    [*(id *)(a1 + 32) setupOneToOneVideoStreamWithConfig:*(void *)(a1 + 40) streamGroupID:1667329381];
  }
  if ([*(id *)(a1 + 40) negotiatedScreenEnabled])
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_18;
      }
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      *(_DWORD *)uint64_t v37 = 136315650;
      *(void *)&v37[4] = v5;
      *(_WORD *)&v37[12] = 2080;
      *(void *)&v37[14] = "-[VCSessionParticipantLocal configureWithOneToOneParticipantConfig:shouldConfigureGFTStreams:]_block_invoke";
      *(_WORD *)&v37[22] = 1024;
      LODWORD(v38) = 2956;
      uint64_t v7 = " [%s] %s:%d Configuring U+1 screen and system audio streams";
      BOOL v8 = v6;
      uint32_t v9 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v4 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v4 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_18;
      }
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)uint64_t v37 = 136316162;
      *(void *)&v37[4] = v10;
      *(_WORD *)&v37[12] = 2080;
      *(void *)&v37[14] = "-[VCSessionParticipantLocal configureWithOneToOneParticipantConfig:shouldConfigureGFTStreams:]_block_invoke";
      *(_WORD *)&v37[22] = 1024;
      LODWORD(v38) = 2956;
      WORD2(v38) = 2112;
      *(void *)((char *)&v38 + 6) = v4;
      HIWORD(v38) = 2048;
      uint64_t v39 = v12;
      uint64_t v7 = " [%s] %s:%d %@(%p) Configuring U+1 screen and system audio streams";
      BOOL v8 = v11;
      uint32_t v9 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, v37, v9);
LABEL_18:
    objc_msgSend(*(id *)(a1 + 32), "setupOneToOneVideoStreamWithConfig:streamGroupID:", *(void *)(a1 + 40), 1935897189, *(_OWORD *)v37, *(void *)&v37[16], v38, v39);
    [*(id *)(a1 + 32) setupOneToOneAudioStreamWithConfig:*(void *)(a1 + 40) streamGroupID:1937339233];
  }
  if (objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 416), "negotiatedResultsForGroupID:", 1718909044), "isSupported"))objc_msgSend(*(id *)(a1 + 32), "setupOneToOneVideoStreamWithConfig:streamGroupID:", *(void *)(a1 + 40), 1718909044); {
  if (objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 416), "negotiatedResultsForGroupID:", 1650745716), "isSupported"))objc_msgSend(*(id *)(a1 + 32), "setupOneToOneVideoStreamWithConfig:streamGroupID:", *(void *)(a1 + 40), 1650745716);
  }
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      long long v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v16 = [*(id *)(a1 + 40) operatingMode];
        int v17 = *(unsigned __int8 *)(a1 + 56);
        *(_DWORD *)uint64_t v37 = 136316162;
        *(void *)&v37[4] = v14;
        *(_WORD *)&v37[12] = 2080;
        *(void *)&v37[14] = "-[VCSessionParticipantLocal configureWithOneToOneParticipantConfig:shouldConfigureGFTStrea"
                              "ms:]_block_invoke";
        *(_WORD *)&v37[22] = 1024;
        LODWORD(v38) = 2970;
        WORD2(v38) = 1024;
        *(_DWORD *)((char *)&v38 + 6) = v16;
        WORD5(v38) = 1024;
        HIDWORD(v38) = v17;
        uint64_t v18 = " [%s] %s:%d Calling configureWithDeviceRole with AVC operatingMode=%d shouldConfigureGFTStreams=%d";
        uint64_t v19 = v15;
        uint32_t v20 = 40;
LABEL_33:
        _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, v18, v37, v20);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v13 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      uint64_t v13 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      uint64_t v22 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = *(void *)(a1 + 32);
        int v24 = [*(id *)(a1 + 40) operatingMode];
        int v25 = *(unsigned __int8 *)(a1 + 56);
        *(_DWORD *)uint64_t v37 = 136316674;
        *(void *)&v37[4] = v21;
        *(_WORD *)&v37[12] = 2080;
        *(void *)&v37[14] = "-[VCSessionParticipantLocal configureWithOneToOneParticipantConfig:shouldConfigureGFTStrea"
                              "ms:]_block_invoke";
        *(_WORD *)&v37[22] = 1024;
        LODWORD(v38) = 2970;
        WORD2(v38) = 2112;
        *(void *)((char *)&v38 + 6) = v13;
        HIWORD(v38) = 2048;
        uint64_t v39 = v23;
        LOWORD(v40) = 1024;
        *(_DWORD *)((char *)&v40 + 2) = v24;
        HIWORD(v40) = 1024;
        LODWORD(v41) = v25;
        uint64_t v18 = " [%s] %s:%d %@(%p) Calling configureWithDeviceRole with AVC operatingMode=%d shouldConfigureGFTStreams=%d";
        uint64_t v19 = v22;
        uint32_t v20 = 60;
        goto LABEL_33;
      }
    }
  }
  if (*(unsigned char *)(a1 + 56))
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "dispatchedConfigureWithDeviceRole:negotiatedVideoEnabled:negotiatedScreenEnabled:operatingMode:", objc_msgSend(*(id *)(a1 + 40), "deviceRole"), objc_msgSend(*(id *)(a1 + 40), "negotiatedVideoEnabled"), objc_msgSend(*(id *)(a1 + 40), "negotiatedScreenEnabled"), objc_msgSend(*(id *)(a1 + 40), "operatingMode")) & 1) == 0)
    {
      if (objc_opt_class() == *(void *)(a1 + 32))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            __94__VCSessionParticipantLocal_configureWithOneToOneParticipantConfig_shouldConfigureGFTStreams___block_invoke_cold_2();
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          int v26 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
        }
        else {
          int v26 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v32 = VRTraceErrorLogLevelToCSTR();
          int v33 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            uint64_t v34 = *(void *)(a1 + 32);
            *(_DWORD *)uint64_t v37 = 136316162;
            *(void *)&v37[4] = v32;
            *(_WORD *)&v37[12] = 2080;
            *(void *)&v37[14] = "-[VCSessionParticipantLocal configureWithOneToOneParticipantConfig:shouldConfigureGFTS"
                                  "treams:]_block_invoke";
            *(_WORD *)&v37[22] = 1024;
            LODWORD(v38) = 2974;
            WORD2(v38) = 2112;
            *(void *)((char *)&v38 + 6) = v26;
            HIWORD(v38) = 2048;
            uint64_t v39 = v34;
LABEL_66:
            _os_log_error_impl(&dword_1E1EA4000, v33, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Fail configure participant", v37, 0x30u);
            return;
          }
        }
      }
      return;
    }
LABEL_40:
    objc_msgSend(*(id *)(a1 + 32), "setupOneToOneEncryptionInfoWithConfiguration:", *(void *)(a1 + 40), *(void *)v37, *(_OWORD *)&v37[8], v38, v39, v40, v41);
    int v27 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 960), "objectForKeyedSubscript:", &unk_1F3DC4AA0), "streamConfigs"), "objectAtIndexedSubscript:", 0), "framerate");
    *(_DWORD *)(*(void *)(a1 + 32) + 924) = *(_DWORD *)(*(void *)(a1 + 32) + 920);
    uint64_t v28 = *(void *)(a1 + 32);
    int v29 = v27;
    if (*(unsigned char *)(v28 + 409)) {
      int v29 = *(_DWORD *)(v28 + 920);
    }
    *(_DWORD *)(v28 + 920) = v29;
    *(_DWORD *)(*(void *)(a1 + 32) + 924) = v27;
    uint64_t v30 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v30 + 408) && *(unsigned char *)(v30 + 374) && !*(unsigned char *)(v30 + 377) && *(_DWORD *)(v30 + 168) == 1) {
      [(id)v30 registerForVideoCapture:*(unsigned int *)(v30 + 920)];
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    return;
  }
  if ([*(id *)(a1 + 32) configureOneToOneWithConfig:*(void *)(a1 + 40)]) {
    goto LABEL_40;
  }
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __94__VCSessionParticipantLocal_configureWithOneToOneParticipantConfig_shouldConfigureGFTStreams___block_invoke_cold_1();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      int v31 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      int v31 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v35 = VRTraceErrorLogLevelToCSTR();
      int v33 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        uint64_t v36 = *(void *)(a1 + 32);
        *(_DWORD *)uint64_t v37 = 136316162;
        *(void *)&v37[4] = v35;
        *(_WORD *)&v37[12] = 2080;
        *(void *)&v37[14] = "-[VCSessionParticipantLocal configureWithOneToOneParticipantConfig:shouldConfigureGFTStrea"
                              "ms:]_block_invoke";
        *(_WORD *)&v37[22] = 1024;
        LODWORD(v38) = 2977;
        WORD2(v38) = 2112;
        *(void *)((char *)&v38 + 6) = v31;
        HIWORD(v38) = 2048;
        uint64_t v39 = v36;
        goto LABEL_66;
      }
    }
  }
}

- (BOOL)configureOneToOneVideoStreamsWithDeviceRole:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  videoStreamGroups = self->super._videoStreamGroups;
  uint64_t v6 = [(NSMutableArray *)videoStreamGroups countByEnumeratingWithState:&v16 objects:v15 count:16];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  BOOL v8 = 0;
  uint64_t v9 = *(void *)v17;
  while (2)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v17 != v9) {
        objc_enumerationMutation(videoStreamGroups);
      }
      uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
      if (-[VCSessionParticipantLocal isOneToOneStreamGroup:](self, "isOneToOneStreamGroup:", [v11 streamGroupID]))
      {
        uint64_t v12 = (void *)[v11 streamGroupConfigForMode:1];
        if (!v12)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCSessionParticipantLocal configureOneToOneVideoStreamsWithDeviceRole:]();
            }
          }
          return v8;
        }
        uint64_t v13 = v12;
        if (!-[VCSessionParticipant configureOneToOneVideoStreamsWithDeviceRole:streamInfoArray:](self, "configureOneToOneVideoStreamsWithDeviceRole:streamInfoArray:", v3, [v12 mediaStreamInfoArray]))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCSessionParticipantLocal configureOneToOneVideoStreamsWithDeviceRole:]();
            }
          }
          return 0;
        }
        BOOL v8 = 1;
        if (([v11 updateConfig:v13 forMode:1] & 1) == 0)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCSessionParticipantLocal configureOneToOneVideoStreamsWithDeviceRole:]();
            }
          }
          return 0;
        }
      }
    }
    uint64_t v7 = [(NSMutableArray *)videoStreamGroups countByEnumeratingWithState:&v16 objects:v15 count:16];
    if (v7) {
      continue;
    }
    break;
  }
  return v8;
}

- (BOOL)configureOneToOneAudioStreamsWithDeviceRole:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:self->super._micStreamGroups];
  id v6 = [(VCSessionParticipant *)self systemAudioGroup];
  if (v6) {
    [v5 addObject:v6];
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
LABEL_5:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v17 != v9) {
        objc_enumerationMutation(v5);
      }
      uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * v10);
      if (-[VCSessionParticipantLocal isOneToOneStreamGroup:](self, "isOneToOneStreamGroup:", [v11 streamGroupID])&& objc_msgSend(v11, "streamGroupConfigForMode:", 1))
      {
        uint64_t v12 = (void *)[v11 streamGroupConfigForMode:1];
        if (!-[VCSessionParticipant configureOneToOneAudioStreamsWithDeviceRole:streamInfoArray:](self, "configureOneToOneAudioStreamsWithDeviceRole:streamInfoArray:", v3, [v12 mediaStreamInfoArray]))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            BOOL v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
            if (!v13) {
              return v13;
            }
            -[VCSessionParticipantLocal configureOneToOneAudioStreamsWithDeviceRole:]();
          }
LABEL_22:
          LOBYTE(v13) = 0;
          return v13;
        }
        if (([v11 updateConfig:v12 forMode:1] & 1) == 0)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            BOOL v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
            if (!v13) {
              return v13;
            }
            -[VCSessionParticipantLocal configureOneToOneAudioStreamsWithDeviceRole:]();
          }
          goto LABEL_22;
        }
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v5 countByEnumeratingWithState:&v16 objects:v15 count:16];
        if (v8) {
          goto LABEL_5;
        }
        break;
      }
    }
  }
  LOBYTE(v13) = 1;
  return v13;
}

- (void)updateOneToOneBandwidthAllocationTable:(id)a3 mediaType:(unsigned __int8)a4 streamGroupID:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v8 = (void *)[a3 streamConfigs];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        BOOL v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v13, "multiwayConfig"), "isOneToOne"))
        {
          if (v13)
          {
            uint64_t v14 = (void *)[v13 multiwayConfig];
            long long v15 = [VCSessionBandwidthAllocationTableEntry alloc];
            long long v16 = -[VCSessionBandwidthAllocationTableEntry initWithClient:type:streamToken:streamID:streamGroupID:](v15, "initWithClient:type:streamToken:streamID:streamGroupID:", self, v6, objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._participantStreamTokens, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v5)), "unsignedIntValue"), objc_msgSend(v14, "idsStreamID"), v5);
            objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_uplinkBandwidthAllocators, "objectAtIndexedSubscript:", 1), "addBandwidthAllocationTableEntry:updateNow:", v16, 0);
          }
          return;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v17 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
}

- (void)setupOneToOneEncryptionInfoWithConfiguration:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = [(VCSecurityKeyManager *)self->super._securityKeyManager latestSendKeyMaterialWithSecurityKeyMode:1];
  int v6 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", @"SecurityLocallyGenerated"), "BOOLValue");
  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315650;
        uint64_t v12 = v8;
        __int16 v13 = 2080;
        uint64_t v14 = "-[VCSessionParticipantLocal setupOneToOneEncryptionInfoWithConfiguration:]";
        __int16 v15 = 1024;
        int v16 = 3078;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Already received Key material, updating oneToOne streams with the cached key material", (uint8_t *)&v11, 0x1Cu);
      }
    }
    p_oneToOneSettings = &self->_oneToOneSettings;
    objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](p_oneToOneSettings->streamInfo, "objectForKeyedSubscript:", &unk_1F3DC4A88), "stream"), "handleEncryptionInfoChange:", v5);
    if ([a3 negotiatedVideoEnabled]) {
      objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](p_oneToOneSettings->streamInfo, "objectForKeyedSubscript:", &unk_1F3DC4AA0), "stream"), "handleEncryptionInfoChange:", v5);
    }
    if ([a3 negotiatedScreenEnabled]) {
      objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](p_oneToOneSettings->streamInfo, "objectForKeyedSubscript:", &unk_1F3DC4B48), "stream"), "handleEncryptionInfoChange:", v5);
    }
  }
}

- (id)newAudioStreamOneToOneConfigurationWithStreamGroupId:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = -[VCSessionParticipant newOneToOneAudioStreamConfigWithAudioSettings:streamDirection:streamGroupId:streamSsrc:](self, "newOneToOneAudioStreamConfigWithAudioSettings:streamDirection:streamGroupId:streamSsrc:", -[VCSessionMediaNegotiator negotiatedResultsForGroupID:](self->super._mediaNegotiator, "negotiatedResultsForGroupID:", v3), 1, v3, objc_msgSend(-[VCMediaNegotiatorLocalConfiguration mediaConfigurationForMediaType:](-[VCSessionMediaNegotiator localSettings](self->super._mediaNegotiator, "localSettings"), "mediaConfigurationForMediaType:", VCMediaNegotiatorMediaType_MediaTypeFromStreamGroupID(a3)), "ssrc"));
  if (v3 == 1835623282) {
    objc_msgSend(v5, "setIsLowLatency:", -[VCSessionParticipant supportsLowLatencyAudio](self, "supportsLowLatencyAudio"));
  }
  if (!v5)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantLocal newAudioStreamOneToOneConfigurationWithStreamGroupId:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        BOOL v7 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
      }
      else {
        BOOL v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        uint64_t v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v10 = 136316418;
          uint64_t v11 = v8;
          __int16 v12 = 2080;
          __int16 v13 = "-[VCSessionParticipantLocal newAudioStreamOneToOneConfigurationWithStreamGroupId:]";
          __int16 v14 = 1024;
          int v15 = 3103;
          __int16 v16 = 2112;
          uint64_t v17 = v7;
          __int16 v18 = 2048;
          long long v19 = self;
          __int16 v20 = 2080;
          long long v21 = FourccToCStr(v3);
          _os_log_error_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to create one to one audio stream config for streamGroupId=%s", (uint8_t *)&v10, 0x3Au);
        }
      }
    }
  }
  return v5;
}

- (id)newVideoStreamOneToOneConfigurationWithStreamGroupId:(unsigned int)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = -[VCSessionParticipant newOneToOneVideoStreamConfigWithStreamDirection:streamGroupId:streamSsrc:encodingType:videoSettings:](self, "newOneToOneVideoStreamConfigWithStreamDirection:streamGroupId:streamSsrc:encodingType:videoSettings:", 1, *(void *)&a3, objc_msgSend(-[VCMediaNegotiatorLocalConfiguration mediaConfigurationForMediaType:](-[VCSessionMediaNegotiator localSettings](self->super._mediaNegotiator, "localSettings"), "mediaConfigurationForMediaType:", VCMediaNegotiatorMediaType_MediaTypeFromStreamGroupID(a3)), "ssrc"), 1, -[VCSessionMediaNegotiator negotiatedResultsForGroupID:](self->super._mediaNegotiator, "negotiatedResultsForGroupID:", *(void *)&a3));
  if (!v4)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantLocal newVideoStreamOneToOneConfigurationWithStreamGroupId:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v6 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
      }
      else {
        int v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        uint64_t v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v9 = 136316162;
          uint64_t v10 = v7;
          __int16 v11 = 2080;
          __int16 v12 = "-[VCSessionParticipantLocal newVideoStreamOneToOneConfigurationWithStreamGroupId:]";
          __int16 v13 = 1024;
          int v14 = 3114;
          __int16 v15 = 2112;
          __int16 v16 = v6;
          __int16 v17 = 2048;
          __int16 v18 = self;
          _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to create one to one video stream config", (uint8_t *)&v9, 0x30u);
        }
      }
    }
  }
  return v4;
}

- (id)supportedAudioRules
{
  return self->super._supportedAudioRules;
}

- (void)updateSupportedAudioRules:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_oneToOneSettings.streamInfo, "objectForKeyedSubscript:", &unk_1F3DC4A88), "streamConfigs");
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:", objc_msgSend((id)objc_msgSend(v9, "audioRules"), "rules"));
        objc_msgSend(v10, "intersectSet:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", objc_msgSend(a3, "rules")));
        if ([v10 count])
        {
          __int16 v11 = objc_alloc_init(VCAudioRuleCollection);
          -[VCAudioRuleCollection addAudioRules:](v11, "addAudioRules:", [v10 allObjects]);
          [v9 setAudioRulesNegotiated:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v12 count:16];
    }
    while (v6);
  }
}

- (BOOL)containsStreamWithSSRC:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ((-[NSMutableSet containsObject:](self->_generatedSSRCs, "containsObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:")) & 1) == 0)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = (void *)[(NSMutableDictionary *)self->super._streamGroups allValues];
    uint64_t v5 = [v6 countByEnumeratingWithState:&v12 objects:v11 count:16];
    if (!v5) {
      return v5;
    }
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v13;
LABEL_6:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v6);
      }
      if ([*(id *)(*((void *)&v12 + 1) + 8 * v9) containsStreamWithSSRC:v3]) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v11 count:16];
        LOBYTE(v5) = 0;
        if (v7) {
          goto LABEL_6;
        }
        return v5;
      }
    }
  }
  LOBYTE(v5) = 1;
  return v5;
}

- (BOOL)isRemotePresentationLarge:(CGRect)a3
{
  return a3.size.width > 600.0 || a3.size.height > 600.0;
}

- (void)updateWindowState:(int)a3 isLocal:(BOOL)a4 windowRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  BOOL v9 = a4;
  uint64_t v10 = *(void *)&a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    self->super._int presentationState = a3;
    [(VCSessionParticipant *)self reportingAgent];
    reportingPIPEnabled();
    goto LABEL_20;
  }
  int isRemotePresentationLarge = self->_isRemotePresentationLarge;
  int remotePresentationState = self->_remotePresentationState;
  self->_int remotePresentationState = a3;
  int v14 = -[VCSessionParticipantLocal isRemotePresentationLarge:](self, "isRemotePresentationLarge:", a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  self->_int isRemotePresentationLarge = v14;
  BOOL v15 = remotePresentationState == v10 && isRemotePresentationLarge == v14;
  if (!v15 && self->super._oneToOneModeEnabled)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_19;
      }
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      __int16 v18 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      BOOL v19 = self->_isRemotePresentationLarge;
      *(_DWORD *)int v26 = 136316674;
      *(void *)&v26[4] = v17;
      *(_WORD *)&v26[12] = 2080;
      *(void *)&v26[14] = "-[VCSessionParticipantLocal updateWindowState:isLocal:windowRect:]";
      *(_WORD *)&v26[22] = 1024;
      *(_DWORD *)int v27 = 3175;
      *(_WORD *)&v27[4] = 1024;
      *(_DWORD *)&v27[6] = v19;
      *(_WORD *)&v27[10] = 2048;
      *(double *)&v27[12] = width;
      *(_WORD *)&v27[20] = 2048;
      *(double *)&v27[22] = height;
      *(_WORD *)&v27[30] = 1024;
      LODWORD(v28) = v10;
      __int16 v20 = " [%s] %s:%d Recalculating bandwidth allocation _isRemotePresentationLarge=%u width=%f height=%f, presentationState=%u";
      long long v21 = v18;
      uint32_t v22 = 60;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v16 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v16 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_19;
      }
      uint64_t v23 = VRTraceErrorLogLevelToCSTR();
      int v24 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      BOOL v25 = self->_isRemotePresentationLarge;
      *(_DWORD *)int v26 = 136317186;
      *(void *)&v26[4] = v23;
      *(_WORD *)&v26[12] = 2080;
      *(void *)&v26[14] = "-[VCSessionParticipantLocal updateWindowState:isLocal:windowRect:]";
      *(_WORD *)&v26[22] = 1024;
      *(_DWORD *)int v27 = 3175;
      *(_WORD *)&v27[4] = 2112;
      *(void *)&v27[6] = v16;
      *(_WORD *)&v27[14] = 2048;
      *(void *)&v27[16] = self;
      *(_WORD *)&v27[24] = 1024;
      *(_DWORD *)&v27[26] = v25;
      *(_WORD *)&v27[30] = 2048;
      double v28 = width;
      LOWORD(v29) = 2048;
      *(double *)((char *)&v29 + 2) = height;
      WORD5(v29) = 1024;
      HIDWORD(v29) = v10;
      __int16 v20 = " [%s] %s:%d %@(%p) Recalculating bandwidth allocation _isRemotePresentationLarge=%u width=%f height=%f, pres"
            "entationState=%u";
      long long v21 = v24;
      uint32_t v22 = 80;
    }
    _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, v20, v26, v22);
LABEL_19:
    -[VCSessionUplinkBandwidthAllocator addBandwidthAllocationTableEntry:updateNow:](self->_uplinkBandwidthAllocator, "addBandwidthAllocationTableEntry:updateNow:", 0, 1, *(_OWORD *)v26, *(void *)&v26[16], *(_OWORD *)v27, *(_OWORD *)&v27[16], *(void *)&v28, v29);
    [(VCSessionParticipantLocal *)self updateUplinkTargetBitrateForStreamGroups];
  }
LABEL_20:
  objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_oneToOneSettings.streamInfo, "objectForKeyedSubscript:", &unk_1F3DC4AA0), "stream"), "updateWindowState:isLocal:windowRect:", v10, v9, x, y, width, height);
  [(VCSessionParticipantLocal *)self updateAudioSpectrumState];
}

- (id)audioRuleCollectionWithAudioStreamConfig:(id)a3
{
  id v4 = self;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](-[VCAudioRuleCollection rules](self->super._supportedAudioRules, "rules"), "count"));
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id obj = (id)objc_msgSend((id)objc_msgSend(a3, "codecConfigurations"), "allKeys");
  uint64_t v37 = [obj countByEnumeratingWithState:&v63 objects:v62 count:16];
  if (v37)
  {
    uint64_t v36 = *(void *)v64;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v64 != v36) {
        objc_enumerationMutation(obj);
      }
      int v35 = [*(id *)(*((void *)&v63 + 1) + 8 * v6) integerValue];
      int v7 = +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:");
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      uint64_t v8 = [(VCAudioRuleCollection *)v4->super._supportedAudioRules rules];
      uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v58 objects:v57 count:16];
      if (!v9) {
        break;
      }
      uint64_t v10 = v9;
      __int16 v11 = v4;
      char v12 = 0;
      uint64_t v13 = *(void *)v59;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v59 != v13) {
            objc_enumerationMutation(v8);
          }
          BOOL v15 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          if ([v15 payload] == v7)
          {
            objc_msgSend(v5, "setObject:atIndexedSubscript:", v15, objc_msgSend(v5, "count"));
            char v12 = 1;
          }
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v58 objects:v57 count:16];
      }
      while (v10);
      id v4 = v11;
      if ((v12 & 1) == 0) {
        break;
      }
      if (++v6 == v37)
      {
        uint64_t v37 = [obj countByEnumeratingWithState:&v63 objects:v62 count:16];
        if (v37) {
          goto LABEL_3;
        }
        goto LABEL_18;
      }
    }
    if ((VCSessionParticipantLocal *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_35;
      }
      uint64_t v23 = VRTraceErrorLogLevelToCSTR();
      int v24 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_35;
      }
      uint64_t v25 = [(VCAudioRuleCollection *)v4->super._supportedAudioRules rules];
      uint64_t v26 = [(VCAudioRuleCollection *)v4->super._supportedAudioRules secondaryPayloads];
      *(_DWORD *)buf = 136316674;
      uint64_t v44 = v23;
      __int16 v45 = 2080;
      id v46 = "-[VCSessionParticipantLocal audioRuleCollectionWithAudioStreamConfig:]";
      __int16 v47 = 1024;
      int v48 = 3199;
      __int16 v49 = 1024;
      *(_DWORD *)uint64_t v50 = v7;
      *(_WORD *)&v50[4] = 1024;
      *(_DWORD *)&v50[6] = v35;
      *(_WORD *)uint64_t v51 = 2112;
      *(void *)&v51[2] = v25;
      *(_WORD *)unsigned int v52 = 2112;
      *(void *)&v52[2] = v26;
      int v27 = " [%s] %s:%d Missing payload:%d (codecType:%d). Supported rules:%@ secondary:%@";
      double v28 = v24;
      uint32_t v29 = 60;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint32_t v22 = (__CFString *)[(VCSessionParticipantLocal *)v4 performSelector:sel_logPrefix];
      }
      else {
        uint32_t v22 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_35;
      }
      uint64_t v30 = VRTraceErrorLogLevelToCSTR();
      int v31 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_35;
      }
      uint64_t v32 = [(VCAudioRuleCollection *)v4->super._supportedAudioRules rules];
      uint64_t v33 = [(VCAudioRuleCollection *)v4->super._supportedAudioRules secondaryPayloads];
      *(_DWORD *)buf = 136317186;
      uint64_t v44 = v30;
      __int16 v45 = 2080;
      id v46 = "-[VCSessionParticipantLocal audioRuleCollectionWithAudioStreamConfig:]";
      __int16 v47 = 1024;
      int v48 = 3199;
      __int16 v49 = 2112;
      *(void *)uint64_t v50 = v22;
      *(_WORD *)&v50[8] = 2048;
      *(void *)uint64_t v51 = v4;
      *(_WORD *)&v51[8] = 1024;
      *(_DWORD *)unsigned int v52 = v7;
      *(_WORD *)&v52[4] = 1024;
      *(_DWORD *)&unsigned char v52[6] = v35;
      __int16 v53 = 2112;
      uint64_t v54 = v32;
      __int16 v55 = 2112;
      uint64_t v56 = v33;
      int v27 = " [%s] %s:%d %@(%p) Missing payload:%d (codecType:%d). Supported rules:%@ secondary:%@";
      double v28 = v31;
      uint32_t v29 = 80;
    }
    _os_log_error_impl(&dword_1E1EA4000, v28, OS_LOG_TYPE_ERROR, v27, buf, v29);
LABEL_35:

    return 0;
  }
LABEL_18:
  uint64_t v16 = objc_alloc_init(VCAudioRuleCollection);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v17 = [v5 countByEnumeratingWithState:&v39 objects:v38 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v40 != v19) {
          objc_enumerationMutation(v5);
        }
        [(VCAudioRuleCollection *)v16 addAudioRule:*(void *)(*((void *)&v39 + 1) + 8 * j)];
      }
      uint64_t v18 = [v5 countByEnumeratingWithState:&v39 objects:v38 count:16];
    }
    while (v18);
  }

  return v16;
}

- (id)setupStreamRTP:(id)a3
{
  return (id)[a3 setupRTPForIDS];
}

- (void)addCallInfoBlobToParticipantInfo:(id)a3
{
  v32[3] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_alloc_init(VCCallInfoBlob);
  self->super._callInfoBlob = v5;
  [(VCCallInfoBlob *)v5 setCallID:self->super._transportSessionID];
  [(VCCallInfoBlob *)self->super._callInfoBlob setClientVersion:+[VCCallInfo getVCCurrentVersion]];
  memset(v32, 170, 20);
  VCGetDeviceModelString((char *)v32, 0x14uLL);
  uint64_t v6 = (void *)[[NSString alloc] initWithCString:v32 encoding:1];
  [(VCCallInfoBlob *)self->super._callInfoBlob setDeviceType:v6];
  memset(v31, 170, 20);
  VCGetSystemBuildVersionString((char *)v31, 20);
  int v7 = (void *)[[NSString alloc] initWithCString:v31 encoding:1];
  [(VCCallInfoBlob *)self->super._callInfoBlob setOsVersion:v7];
  uint64_t v8 = (void *)[[NSString alloc] initWithCString:"2090.17.2" encoding:1];
  [(VCCallInfoBlob *)self->super._callInfoBlob setFrameworkVersion:v8];
  objc_msgSend(a3, "setObject:forKeyedSubscript:", -[VCCallInfoBlob data](self->super._callInfoBlob, "data"), @"vcSessionParticipantKeyCallInfoBlob");
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      __int16 v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = objc_msgSend((id)-[VCCallInfoBlob formattedText](self->super._callInfoBlob, "formattedText"), "stringByReplacingOccurrencesOfString:withString:", @"\n", @", ");
        int v19 = 136315906;
        uint64_t v20 = v10;
        __int16 v21 = 2080;
        uint32_t v22 = "-[VCSessionParticipantLocal addCallInfoBlobToParticipantInfo:]";
        __int16 v23 = 1024;
        int v24 = 3238;
        __int16 v25 = 2112;
        uint64_t v26 = v12;
        uint64_t v13 = " [%s] %s:%d Local Participant callInfoBlob = %@";
        int v14 = v11;
        uint32_t v15 = 38;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v19, v15);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v9 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v9 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      uint64_t v17 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = objc_msgSend((id)-[VCCallInfoBlob formattedText](self->super._callInfoBlob, "formattedText"), "stringByReplacingOccurrencesOfString:withString:", @"\n", @", ");
        int v19 = 136316418;
        uint64_t v20 = v16;
        __int16 v21 = 2080;
        uint32_t v22 = "-[VCSessionParticipantLocal addCallInfoBlobToParticipantInfo:]";
        __int16 v23 = 1024;
        int v24 = 3238;
        __int16 v25 = 2112;
        uint64_t v26 = (uint64_t)v9;
        __int16 v27 = 2048;
        double v28 = self;
        __int16 v29 = 2112;
        uint64_t v30 = v18;
        uint64_t v13 = " [%s] %s:%d %@(%p) Local Participant callInfoBlob = %@";
        int v14 = v17;
        uint32_t v15 = 58;
        goto LABEL_11;
      }
    }
  }
}

- (BOOL)createParticipantInfo
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v3)
  {
    id v4 = (NSData *)[(VCSessionMediaNegotiator *)self->super._mediaNegotiator negotiationData];
    self->super._mediaBlobCompressed = v4;
    if (v4)
    {
      [v3 setObject:self->super._uuid forKeyedSubscript:@"vcSessionParticipantKeyUUID"];
      [v3 setObject:self->super._mediaBlobCompressed forKeyedSubscript:@"vcSessionParticipantKeyMediaNegotiationData"];
      [(VCSessionParticipantLocal *)self addCallInfoBlobToParticipantInfo:v3];
      self->super._participantInfo = (NSDictionary *)v3;
      goto LABEL_4;
    }
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantLocal createParticipantInfo]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v7 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
      }
      else {
        int v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        uint64_t v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v12 = 136316162;
          uint64_t v13 = v11;
          __int16 v14 = 2080;
          uint32_t v15 = "-[VCSessionParticipantLocal createParticipantInfo]";
          __int16 v16 = 1024;
          int v17 = 3250;
          __int16 v18 = 2112;
          int v19 = v7;
          __int16 v20 = 2048;
          __int16 v21 = self;
          uint64_t v10 = " [%s] %s:%d %@(%p) Failed to create new invite blob";
          goto LABEL_25;
        }
      }
    }
  }
  else if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionParticipantLocal createParticipantInfo]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v6 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v12 = 136316162;
        uint64_t v13 = v8;
        __int16 v14 = 2080;
        uint32_t v15 = "-[VCSessionParticipantLocal createParticipantInfo]";
        __int16 v16 = 1024;
        int v17 = 3247;
        __int16 v18 = 2112;
        int v19 = v6;
        __int16 v20 = 2048;
        __int16 v21 = self;
        uint64_t v10 = " [%s] %s:%d %@(%p) Failed to allocate participant info";
LABEL_25:
        _os_log_error_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v12, 0x30u);
      }
    }
  }
LABEL_4:

  return self->super._participantInfo != 0;
}

- (void)createOpaqueData
{
  self->super._opaqueData = (NSData *)+[VCSessionParticipant participantDataWithParticipantInfo:self->super._participantInfo];
}

- (void)setMuted:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__VCSessionParticipantLocal_setMuted___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __38__VCSessionParticipantLocal_setMuted___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 372) = *(unsigned char *)(a1 + 40);
  [*(id *)(*(void *)(a1 + 32) + 392) setMuted:*(unsigned __int8 *)(*(void *)(a1 + 32) + 372)];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 480);
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
        [*(id *)(*((void *)&v8 + 1) + 8 * v6++) setMuted:*(unsigned __int8 *)(a1 + 40)];
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v8 objects:v7 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

- (BOOL)isHighPriorityAudioWithPower:(float)a3 voiceActive:(BOOL)a4
{
  if (!a4)
  {
    if (a3 != -120.0)
    {
      BOOL v4 = 0;
      self->_averageSilenceAudioPower = self->_averageSilenceAudioPower
                                      + (float)((float)(a3 - self->_averageSilenceAudioPower)
                                              * self->_audioSilencePowerAverageMultiplier);
      return v4;
    }
    return 0;
  }
  return (float)(self->_averageSilenceAudioPower + self->_audioVoiceDetectionSensitivity) < a3;
}

- (void)startVoiceActivityDetection
{
  id v3 = (opaqueVCVoiceDetector *)VCVoiceDetector_Create(0);
  self->_voiceDetector = v3;
  BOOL v4 = [(VCAudioIO *)self->super._audioIO clientFormat];

  VCVoiceDetector_Start(v3, (uint64_t)v4);
}

- (void)stopVoiceActivityDetection
{
  p_voiceDetector = (void **)&self->_voiceDetector;
  VCVoiceDetector_Stop(self->_voiceDetector);

  VCVoiceDetector_Destroy(p_voiceDetector);
}

- (void)updateAudioPriorityWithSampleBuffer:(opaqueVCAudioBufferList *)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  Prioritdouble y = VCAudioBufferList_GetPriority((uint64_t)a3);
  if (!self->_forcedAudioPriorityEnabled) {
    goto LABEL_6;
  }
  double v6 = micro();
  if (v6 - self->_forcedAudioPriorityLastUpdateTime > 1.0)
  {
    self->_int forcedAudioPriorityValue = [+[VCDefaults sharedInstance] forceAudioPriorityValue];
    self->_forcedAudioPriorityLastUpdateTime = v6;
  }
  int forcedAudioPriorityValue = self->_forcedAudioPriorityValue;
  if (self->_forcedAudioPriorityValue)
  {
    VCAudioBufferList_SetPriority((uint64_t)a3, self->_forcedAudioPriorityValue);
    Prioritdouble y = forcedAudioPriorityValue;
  }
  else
  {
LABEL_6:
    if (!Priority)
    {
      if (self->super._oneToOneModeEnabled) {
        Prioritdouble y = 0;
      }
      else {
        Prioritdouble y = VCVoiceDetector_ProcessSampleBuffer(self->_voiceDetector, (uint64_t)a3, self->super._isMuted);
      }
    }
  }
  if (Priority != self->_lastAudioPriority)
  {
    self->_lastAudioPrioritdouble y = Priority;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __65__VCSessionParticipantLocal_updateAudioPriorityWithSampleBuffer___block_invoke;
    void v8[3] = &unk_1E6DB6978;
    v8[4] = self;
    char v9 = Priority;
    [(VCSessionParticipant *)self callDelegateWithBlock:v8];
  }
}

uint64_t __65__VCSessionParticipantLocal_updateAudioPriorityWithSampleBuffer___block_invoke(uint64_t a1, void *a2)
{
  return [a2 vcSessionParticipant:*(void *)(a1 + 32) didChangeMediaPriority:*(unsigned __int8 *)(a1 + 40) description:@"MediaTypeAudio"];
}

- (id)getAudioDumpName
{
  return 0;
}

- (id)newStreamInfoWithVideoStreamWithConfiguration:(id)a3 idsDestination:(id)a4 groupID:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantLocal newStreamInfoWithVideoStreamWithConfiguration:idsDestination:groupID:]();
        }
      }
      goto LABEL_57;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v22 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v22 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_57;
    }
    uint64_t v26 = VRTraceErrorLogLevelToCSTR();
    __int16 v27 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_57;
    }
    *(_DWORD *)buf = 136316418;
    uint64_t v40 = v26;
    __int16 v41 = 2080;
    long long v42 = "-[VCSessionParticipantLocal newStreamInfoWithVideoStreamWithConfiguration:idsDestination:groupID:]";
    __int16 v43 = 1024;
    int v44 = 3374;
    __int16 v45 = 2112;
    id v46 = v22;
    __int16 v47 = 2048;
    int v48 = self;
    __int16 v49 = 2080;
    *(void *)uint64_t v50 = FourccToCStr(v5);
    double v28 = " [%s] %s:%d %@(%p) Video stream config is missing for streamGroupID=%s!";
    __int16 v29 = v27;
    uint32_t v30 = 58;
    goto LABEL_67;
  }
  if (![a3 rtpTimestampRate]) {
    objc_msgSend(a3, "setRtpTimestampRate:", -[VCSessionParticipant preferredIOSampleRateForGroupID:](self, "preferredIOSampleRateForGroupID:", v5));
  }
  if ([(VCSessionParticipantLocal *)self shouldEnableUplinkRetransmissionForStreamGroupID:v5])
  {
    BOOL isRetransmissionEnabled = self->_isRetransmissionEnabled;
  }
  else
  {
    BOOL isRetransmissionEnabled = 0;
  }
  [a3 setIsUplinkRetransmissionEnabled:isRetransmissionEnabled];
  if (self->_isRetransmissionEnabled && (objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "isOneToOne") & 1) == 0)
  {
    [a3 setLtrpEnabled:1];
    [a3 setRtcpEnabled:1];
  }
  [(VCSessionParticipant *)self setFECConfigurationOnStreamConfig:a3 withStreamGroupID:v5];
  char v9 = [(VCSessionParticipantLocal *)self newVideoStreamWithConfig:a3 groupID:v5];
  uint64_t v10 = (VCSessionParticipantLocal *)objc_opt_class();
  if (!v9)
  {
    if (v10 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantLocal newStreamInfoWithVideoStreamWithConfiguration:idsDestination:groupID:]();
        }
      }
      goto LABEL_57;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v23 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v23 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (uint64_t v31 = VRTraceErrorLogLevelToCSTR(),
          uint64_t v32 = *MEMORY[0x1E4F47A50],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
LABEL_57:
      __int16 v20 = 0;
      char v9 = 0;
      goto LABEL_25;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v40 = v31;
    __int16 v41 = 2080;
    long long v42 = "-[VCSessionParticipantLocal newStreamInfoWithVideoStreamWithConfiguration:idsDestination:groupID:]";
    __int16 v43 = 1024;
    int v44 = 3387;
    __int16 v45 = 2112;
    id v46 = v23;
    __int16 v47 = 2048;
    int v48 = self;
    double v28 = " [%s] %s:%d %@(%p) Failed to allocate video stream!";
    __int16 v29 = v32;
    uint32_t v30 = 48;
LABEL_67:
    _os_log_error_impl(&dword_1E1EA4000, v29, OS_LOG_TYPE_ERROR, v28, buf, v30);
    goto LABEL_57;
  }
  if (v10 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint64_t v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316674;
        uint64_t v40 = v12;
        __int16 v41 = 2080;
        long long v42 = "-[VCSessionParticipantLocal newStreamInfoWithVideoStreamWithConfiguration:idsDestination:groupID:]";
        __int16 v43 = 1024;
        int v44 = 3388;
        __int16 v45 = 2048;
        id v46 = v9;
        __int16 v47 = 2080;
        int v48 = FourccToCStr(v5);
        __int16 v49 = 1024;
        *(_DWORD *)uint64_t v50 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "idsStreamID");
        *(_WORD *)&v50[4] = 1024;
        *(_DWORD *)&v50[6] = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "repairedStreamID");
        __int16 v14 = " [%s] %s:%d video stream successfully created: %p! streamGroupID=%s streamId=%d repairStreamId=%d";
        uint32_t v15 = v13;
        uint32_t v16 = 60;
LABEL_21:
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      long long v11 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      long long v11 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      __int16 v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136317186;
        uint64_t v40 = v17;
        __int16 v41 = 2080;
        long long v42 = "-[VCSessionParticipantLocal newStreamInfoWithVideoStreamWithConfiguration:idsDestination:groupID:]";
        __int16 v43 = 1024;
        int v44 = 3388;
        __int16 v45 = 2112;
        id v46 = v11;
        __int16 v47 = 2048;
        int v48 = self;
        __int16 v49 = 2048;
        *(void *)uint64_t v50 = v9;
        *(_WORD *)&v50[8] = 2080;
        uint64_t v51 = FourccToCStr(v5);
        __int16 v52 = 1024;
        int v53 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "idsStreamID");
        __int16 v54 = 1024;
        int v55 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "repairedStreamID");
        __int16 v14 = " [%s] %s:%d %@(%p) video stream successfully created: %p! streamGroupID=%s streamId=%d repairStreamId=%d";
        uint32_t v15 = v18;
        uint32_t v16 = 80;
        goto LABEL_21;
      }
    }
  }
  [(__CFString *)v9 setReportingAgent:[(VCSessionParticipant *)self reportingAgent]];
  [(__CFString *)v9 setDelegate:self];
  -[__CFString setLogPrefix:](v9, "setLogPrefix:", [NSString stringWithFormat:@"participantID:%@ streamGroupId=%s", self->super._uuid, FourccToCStr(v5)]);
  [(VCSessionParticipantLocal *)self setupEncodingModeWithVideoStreamConfig:a3];
  if (![(VCSessionParticipantLocal *)self setupStreamRTP:v9])
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantLocal newStreamInfoWithVideoStreamWithConfiguration:idsDestination:groupID:]();
        }
      }
      goto LABEL_65;
    }
    if (objc_opt_respondsToSelector()) {
      int v24 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      int v24 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_65;
    }
    uint64_t v33 = VRTraceErrorLogLevelToCSTR();
    uint64_t v34 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_65;
    }
    int v35 = FourccToCStr(v5);
    *(_DWORD *)buf = 136316418;
    uint64_t v40 = v33;
    __int16 v41 = 2080;
    long long v42 = "-[VCSessionParticipantLocal newStreamInfoWithVideoStreamWithConfiguration:idsDestination:groupID:]";
    __int16 v43 = 1024;
    int v44 = 3396;
    __int16 v45 = 2112;
    id v46 = v24;
    __int16 v47 = 2048;
    int v48 = self;
    __int16 v49 = 2080;
    *(void *)uint64_t v50 = v35;
    uint64_t v36 = " [%s] %s:%d %@(%p) invalid capabilies dictionary for streamGroupID=%s!";
    goto LABEL_69;
  }
  int v19 = objc_alloc_init(VCSessionParticipantMediaStreamInfo);
  if (!v19)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantLocal newStreamInfoWithVideoStreamWithConfiguration:idsDestination:groupID:].cold.4();
        }
      }
      goto LABEL_65;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v25 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v25 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (uint64_t v37 = VRTraceErrorLogLevelToCSTR(),
          uint64_t v34 = *MEMORY[0x1E4F47A50],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
LABEL_65:
      __int16 v20 = 0;
      goto LABEL_25;
    }
    long long v38 = FourccToCStr(v5);
    *(_DWORD *)buf = 136316418;
    uint64_t v40 = v37;
    __int16 v41 = 2080;
    long long v42 = "-[VCSessionParticipantLocal newStreamInfoWithVideoStreamWithConfiguration:idsDestination:groupID:]";
    __int16 v43 = 1024;
    int v44 = 3399;
    __int16 v45 = 2112;
    id v46 = v25;
    __int16 v47 = 2048;
    int v48 = self;
    __int16 v49 = 2080;
    *(void *)uint64_t v50 = v38;
    uint64_t v36 = " [%s] %s:%d %@(%p) Failed to allocate participant video stream info for streamGroupID=%s";
LABEL_69:
    _os_log_error_impl(&dword_1E1EA4000, v34, OS_LOG_TYPE_ERROR, v36, buf, 0x3Au);
    goto LABEL_65;
  }
  __int16 v20 = v19;
  [(VCSessionParticipantMediaStreamInfo *)v19 setStream:v9];
  [(VCSessionParticipantMediaStreamInfo *)v20 addStreamConfig:a3];
LABEL_25:

  return v20;
}

- (BOOL)shouldEnableUplinkRetransmissionForStreamGroupID:(unsigned int)a3
{
  BOOL result = 1;
  if ((int)a3 <= 1835623286)
  {
    if ((int)a3 > 1684108336)
    {
      if (a3 - 1684108337 >= 5)
      {
        int v4 = 1835623282;
        goto LABEL_13;
      }
      return 0;
    }
    if (a3 == 1667329399) {
      return 0;
    }
    int v4 = 1667330164;
LABEL_13:
    if (a3 != v4) {
      return result;
    }
    return 0;
  }
  if ((int)a3 <= 1986618416)
  {
    if (a3 == 1835623287 || a3 == 1936290409) {
      return 0;
    }
    int v4 = 1937339233;
    goto LABEL_13;
  }
  if (a3 - 1986618417 <= 3) {
    return 0;
  }
  return result;
}

- (id)newVideoStreamWithConfig:(id)a3 groupID:(unsigned int)a4
{
  double v6 = off_1E6DB3000;
  if (a4 != 1667330164) {
    double v6 = off_1E6DB3098;
  }
  id v7 = objc_alloc(*v6);
  uint64_t transportSessionID = self->super._transportSessionID;
  unint64_t idsParticipantID = self->super._idsParticipantID;
  uint64_t v10 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "ssrc");
  int64_t v11 = [(VCSessionParticipant *)self participantVideoToken];

  return (id)[v7 initWithTransportSessionID:transportSessionID idsParticipantID:idsParticipantID ssrc:v10 streamToken:v11];
}

- (id)newStreamInfoWithAudioStreamWithConfiguration:(id)a3 idsDestination:(id)a4 isMultiway:(BOOL)a5 streamGroupID:(unsigned int)a6 streamToken:(int64_t)a7
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantLocal newStreamInfoWithAudioStreamWithConfiguration:idsDestination:isMultiway:streamGroupID:streamToken:]();
        }
      }
      goto LABEL_64;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v26 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v26 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_64;
    }
    uint64_t v31 = VRTraceErrorLogLevelToCSTR();
    uint64_t v32 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_64;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v41 = v31;
    __int16 v42 = 2080;
    __int16 v43 = "-[VCSessionParticipantLocal newStreamInfoWithAudioStreamWithConfiguration:idsDestination:isMultiway:streamGrou"
          "pID:streamToken:]";
    __int16 v44 = 1024;
    int v45 = 3455;
    __int16 v46 = 2112;
    __int16 v47 = v26;
    __int16 v48 = 2048;
    __int16 v49 = self;
    uint64_t v33 = " [%s] %s:%d %@(%p) Audio stream config is missing!";
    goto LABEL_83;
  }
  uint64_t v9 = *(void *)&a6;
  if (![a3 rtpTimestampRate]) {
    objc_msgSend(a3, "setRtpTimestampRate:", -[VCSessionParticipant preferredIOSampleRateForGroupID:](self, "preferredIOSampleRateForGroupID:", v9));
  }
  uint64_t v12 = -[VCAudioStream initWithClientPid:ssrc:transportSessionID:streamToken:]([VCAudioStream alloc], "initWithClientPid:ssrc:transportSessionID:streamToken:", self->super._processId, objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "ssrc"), self->super._transportSessionID, a7);
  uint64_t v13 = (VCSessionParticipantLocal *)objc_opt_class();
  if (!v12)
  {
    if (v13 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantLocal newStreamInfoWithAudioStreamWithConfiguration:idsDestination:isMultiway:streamGroupID:streamToken:]();
        }
      }
      goto LABEL_64;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v27 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v27 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (uint64_t v34 = VRTraceErrorLogLevelToCSTR(),
          uint64_t v32 = *MEMORY[0x1E4F47A50],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
LABEL_64:
      int v24 = 0;
      uint64_t v12 = 0;
      goto LABEL_29;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v41 = v34;
    __int16 v42 = 2080;
    __int16 v43 = "-[VCSessionParticipantLocal newStreamInfoWithAudioStreamWithConfiguration:idsDestination:isMultiway:streamGrou"
          "pID:streamToken:]";
    __int16 v44 = 1024;
    int v45 = 3465;
    __int16 v46 = 2112;
    __int16 v47 = v27;
    __int16 v48 = 2048;
    __int16 v49 = self;
    uint64_t v33 = " [%s] %s:%d %@(%p) Failed to allocate audio stream!";
LABEL_83:
    _os_log_error_impl(&dword_1E1EA4000, v32, OS_LOG_TYPE_ERROR, v33, buf, 0x30u);
    goto LABEL_64;
  }
  if (v13 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_16;
    }
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    uint32_t v16 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136316674;
    uint64_t v41 = v15;
    __int16 v42 = 2080;
    __int16 v43 = "-[VCSessionParticipantLocal newStreamInfoWithAudioStreamWithConfiguration:idsDestination:isMultiway:streamGrou"
          "pID:streamToken:]";
    __int16 v44 = 1024;
    int v45 = 3466;
    __int16 v46 = 2048;
    __int16 v47 = v12;
    __int16 v48 = 2080;
    __int16 v49 = FourccToCStr(v9);
    __int16 v50 = 1024;
    *(_DWORD *)uint64_t v51 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "idsStreamID");
    *(_WORD *)&v51[4] = 1024;
    *(_DWORD *)&unsigned char v51[6] = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "v2StreamID");
    uint64_t v17 = " [%s] %s:%d audio stream successfully created: %p! streamGroupID=%s streamId=%d v2StreamID=%d";
    __int16 v18 = v16;
    uint32_t v19 = 60;
    goto LABEL_15;
  }
  if (objc_opt_respondsToSelector()) {
    __int16 v14 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
  }
  else {
    __int16 v14 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v20 = VRTraceErrorLogLevelToCSTR();
    __int16 v21 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136317186;
      uint64_t v41 = v20;
      __int16 v42 = 2080;
      __int16 v43 = "-[VCSessionParticipantLocal newStreamInfoWithAudioStreamWithConfiguration:idsDestination:isMultiway:streamGr"
            "oupID:streamToken:]";
      __int16 v44 = 1024;
      int v45 = 3466;
      __int16 v46 = 2112;
      __int16 v47 = v14;
      __int16 v48 = 2048;
      __int16 v49 = self;
      __int16 v50 = 2048;
      *(void *)uint64_t v51 = v12;
      *(_WORD *)&v51[8] = 2080;
      __int16 v52 = FourccToCStr(v9);
      __int16 v53 = 1024;
      int v54 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "idsStreamID");
      __int16 v55 = 1024;
      int v56 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "v2StreamID");
      uint64_t v17 = " [%s] %s:%d %@(%p) audio stream successfully created: %p! streamGroupID=%s streamId=%d v2StreamID=%d";
      __int16 v18 = v21;
      uint32_t v19 = 80;
LABEL_15:
      _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
    }
  }
LABEL_16:
  -[VCObject setLogPrefix:](v12, "setLogPrefix:", [NSString stringWithFormat:@"participantID:%@ ", self->super._uuid]);
  if (objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "isOneToOne")) {
    uint64_t v22 = [a3 networkFeedbackController];
  }
  else {
    uint64_t v22 = 0;
  }
  [(VCMediaStream *)v12 setNetworkFeedbackController:v22];
  if (![(VCSessionParticipantLocal *)self setupStreamRTP:v12])
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantLocal newStreamInfoWithAudioStreamWithConfiguration:idsDestination:isMultiway:streamGroupID:streamToken:]();
        }
      }
      goto LABEL_81;
    }
    if (objc_opt_respondsToSelector()) {
      double v28 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      double v28 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_81;
    }
    uint64_t v35 = VRTraceErrorLogLevelToCSTR();
    uint64_t v36 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_81;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v41 = v35;
    __int16 v42 = 2080;
    __int16 v43 = "-[VCSessionParticipantLocal newStreamInfoWithAudioStreamWithConfiguration:idsDestination:isMultiway:streamGrou"
          "pID:streamToken:]";
    __int16 v44 = 1024;
    int v45 = 3472;
    __int16 v46 = 2112;
    __int16 v47 = v28;
    __int16 v48 = 2048;
    __int16 v49 = self;
    uint64_t v37 = " [%s] %s:%d %@(%p) invalid capabilies dictionary!";
    goto LABEL_80;
  }
  __int16 v23 = objc_alloc_init(VCSessionParticipantMediaStreamInfo);
  if (!v23)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantLocal newStreamInfoWithAudioStreamWithConfiguration:idsDestination:isMultiway:streamGroupID:streamToken:].cold.4();
        }
      }
      goto LABEL_81;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v29 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v29 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_81;
    }
    uint64_t v38 = VRTraceErrorLogLevelToCSTR();
    uint64_t v36 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_81;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v41 = v38;
    __int16 v42 = 2080;
    __int16 v43 = "-[VCSessionParticipantLocal newStreamInfoWithAudioStreamWithConfiguration:idsDestination:isMultiway:streamGrou"
          "pID:streamToken:]";
    __int16 v44 = 1024;
    int v45 = 3475;
    __int16 v46 = 2112;
    __int16 v47 = v29;
    __int16 v48 = 2048;
    __int16 v49 = self;
    uint64_t v37 = " [%s] %s:%d %@(%p) Failed to allocate participant audio stream info";
LABEL_80:
    _os_log_error_impl(&dword_1E1EA4000, v36, OS_LOG_TYPE_ERROR, v37, buf, 0x30u);
    goto LABEL_81;
  }
  int v24 = v23;
  if (v9 != 1937339233 && !a5)
  {
    objc_msgSend(a3, "setAudioRules:", -[VCSessionParticipantLocal audioRuleCollectionWithAudioStreamConfig:](self, "audioRuleCollectionWithAudioStreamConfig:", a3));
    if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "audioRules"), "rules"), "count"))
    {

      if ((VCSessionParticipantLocal *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSessionParticipantLocal newStreamInfoWithAudioStreamWithConfiguration:idsDestination:isMultiway:streamGroupID:streamToken:].cold.5();
          }
        }
        goto LABEL_81;
      }
      if (objc_opt_respondsToSelector()) {
        uint32_t v30 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
      }
      else {
        uint32_t v30 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v39 = VRTraceErrorLogLevelToCSTR();
        uint64_t v36 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v41 = v39;
          __int16 v42 = 2080;
          __int16 v43 = "-[VCSessionParticipantLocal newStreamInfoWithAudioStreamWithConfiguration:idsDestination:isMultiway:stre"
                "amGroupID:streamToken:]";
          __int16 v44 = 1024;
          int v45 = 3479;
          __int16 v46 = 2112;
          __int16 v47 = v30;
          __int16 v48 = 2048;
          __int16 v49 = self;
          uint64_t v37 = " [%s] %s:%d %@(%p) Failed to initialize audio rule collection!";
          goto LABEL_80;
        }
      }
LABEL_81:
      int v24 = 0;
      goto LABEL_29;
    }
  }
  objc_msgSend(a3, "setForceEVSWideBand:", -[VCHardwareSettingsEmbedded deviceClass](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "deviceClass") == 6);
  if ([+[VCDefaults sharedInstance] forceEVSWideBand])
  {
    [a3 setForceEVSWideBand:1];
  }
  [(VCSessionParticipantMediaStreamInfo *)v24 setStream:v12];
  [(VCSessionParticipantMediaStreamInfo *)v24 addStreamConfig:a3];
  if (!a5 && objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "isOneToOne")) {
    -[NSMutableDictionary setObject:forKey:](self->_oneToOneSettings.streamInfo, "setObject:forKey:", v24, [NSNumber numberWithUnsignedInt:v9]);
  }
LABEL_29:

  return v24;
}

- (void)setupEncodingModeWithVideoStreamConfig:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [a3 setEncodingMode:0];
  [a3 setVideoPriorityPointer:&self->_videoPriority];
  if (self->_videoPriorityEnabled)
  {
    if (objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "maxMediaBitrate") == 20000) {
      [a3 setEncodingMode:1];
    }
  }
  else
  {
    atomic_store(0, &self->_videoPriority);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    double v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL videoPriorityEnabled = self->_videoPriorityEnabled;
      int v8 = 136316418;
      uint64_t v9 = v5;
      __int16 v10 = 2080;
      int64_t v11 = "-[VCSessionParticipantLocal setupEncodingModeWithVideoStreamConfig:]";
      __int16 v12 = 1024;
      int v13 = 3510;
      __int16 v14 = 1024;
      BOOL v15 = videoPriorityEnabled;
      __int16 v16 = 1024;
      int v17 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "maxMediaBitrate");
      __int16 v18 = 1024;
      int v19 = [a3 encodingMode];
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _videoPriorityEnabled=%d, maxMediaBitrate=%u, encodingMode=%d", (uint8_t *)&v8, 0x2Eu);
    }
  }
}

- (void)generateKeyFrameWithStreamID:(id)a3 streamGroupID:(unsigned int)a4 firType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = [(VCSessionParticipant *)self streamGroupWithID:*(void *)&a4];
  if (a4 && (__int16 v10 = v9) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [v10 generateKeyFrameWithStreamID:a3 firType:v5];
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    videoStreamGroups = self->super._videoStreamGroups;
    uint64_t v12 = [(NSMutableArray *)videoStreamGroups countByEnumeratingWithState:&v17 objects:v16 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
LABEL_9:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(videoStreamGroups);
        }
        if ([*(id *)(*((void *)&v17 + 1) + 8 * v15) generateKeyFrameWithStreamID:a3 firType:v5]) {
          break;
        }
        if (v13 == ++v15)
        {
          uint64_t v13 = [(NSMutableArray *)videoStreamGroups countByEnumeratingWithState:&v17 objects:v16 count:16];
          if (v13) {
            goto LABEL_9;
          }
          return;
        }
      }
    }
  }
}

- (BOOL)checkSubscribedStreamsConsistency:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v32 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        BoolValueForKedouble y = VCDefaults_GetBoolValueForKey(@"simulateStreamFracture", 0);
        if ([(NSMutableSet *)self->_localPublishedStreams containsObject:v9]) {
          BOOL v11 = !BoolValueForKey;
        }
        else {
          BOOL v11 = 0;
        }
        if (!v11)
        {
          if ((VCSessionParticipantLocal *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              uint64_t v14 = VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                -[VCSessionParticipantLocal checkSubscribedStreamsConsistency:](v14);
              }
            }
          }
          else
          {
            if (objc_opt_respondsToSelector()) {
              uint64_t v13 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
            }
            else {
              uint64_t v13 = &stru_1F3D3E450;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              uint64_t v15 = VRTraceErrorLogLevelToCSTR();
              __int16 v16 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316418;
                uint64_t v20 = v15;
                __int16 v21 = 2080;
                uint64_t v22 = "-[VCSessionParticipantLocal checkSubscribedStreamsConsistency:]";
                __int16 v23 = 1024;
                int v24 = 3531;
                __int16 v25 = 2112;
                uint64_t v26 = v13;
                __int16 v27 = 2048;
                double v28 = self;
                __int16 v29 = 2112;
                uint64_t v30 = v9;
                _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) MEDIA FRACTURE SITUATION! peer asking for unknown stream:%@", buf, 0x3Au);
              }
            }
          }
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __63__VCSessionParticipantLocal_checkSubscribedStreamsConsistency___block_invoke;
          v18[3] = &unk_1E6DB69A0;
          v18[4] = self;
          [(VCSessionParticipant *)self callDelegateWithBlock:v18];
          Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
          CFDictionaryAddValue(Mutable, @"VCSErrorDetected", &unk_1F3DC4B60);
          [(VCSessionParticipant *)self reportingAgent];
          reportingGenericEvent();
          if (Mutable) {
            CFRelease(Mutable);
          }
          return 0;
        }
      }
      uint64_t v6 = [a3 countByEnumeratingWithState:&v32 objects:v31 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  return 1;
}

uint64_t __63__VCSessionParticipantLocal_checkSubscribedStreamsConsistency___block_invoke(uint64_t a1, void *a2)
{
  id v4 = +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", 13, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSessionParticipantLocal.m", 3533), 0);
  uint64_t v5 = *(void *)(a1 + 32);

  return [a2 vcSessionParticipant:v5 didDetectError:v4];
}

- (void)setPeerSubscribedStreams:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__VCSessionParticipantLocal_setPeerSubscribedStreams___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a3;
  dispatch_async(participantQueue, block);
}

void __54__VCSessionParticipantLocal_setPeerSubscribedStreams___block_invoke(uint64_t a1)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      __str = 0;
      id v3 = *(void **)(a1 + 40);
      id v4 = v3 ? (const char *)objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String") : "<nil>";
      asprintf(&__str, "%s", v4);
      if (__str)
      {
        __lasts = 0;
        uint64_t v13 = strtok_r(__str, "\n", &__lasts);
        uint64_t v14 = (os_log_t *)MEMORY[0x1E4F47A50];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v15 = VRTraceErrorLogLevelToCSTR();
            __int16 v16 = *v14;
            if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              uint64_t v55 = v15;
              __int16 v56 = 2080;
              uint64_t v57 = "-[VCSessionParticipantLocal setPeerSubscribedStreams:]_block_invoke";
              __int16 v58 = 1024;
              int v59 = 3550;
              __int16 v60 = 2080;
              long long v61 = "peerSubscribedStreams=";
              __int16 v62 = 2080;
              long long v63 = v13;
              _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          uint64_t v13 = strtok_r(0, "\n", &__lasts);
        }
        while (v13);
        goto LABEL_26;
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
      __str = 0;
      uint64_t v5 = (const char *)[(__CFString *)v2 UTF8String];
      uint64_t v7 = *(const void **)(a1 + 32);
      uint64_t v6 = *(void **)(a1 + 40);
      int v8 = v6 ? (const char *)objc_msgSend((id)objc_msgSend(v6, "description"), "UTF8String") : "<nil>";
      asprintf(&__str, "%s(%p) %s", v5, v7, v8);
      if (__str)
      {
        __lasts = 0;
        uint64_t v9 = strtok_r(__str, "\n", &__lasts);
        __int16 v10 = (os_log_t *)MEMORY[0x1E4F47A50];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v11 = VRTraceErrorLogLevelToCSTR();
            uint64_t v12 = *v10;
            if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              uint64_t v55 = v11;
              __int16 v56 = 2080;
              uint64_t v57 = "-[VCSessionParticipantLocal setPeerSubscribedStreams:]_block_invoke";
              __int16 v58 = 1024;
              int v59 = 3550;
              __int16 v60 = 2080;
              long long v61 = "peerSubscribedStreams=";
              __int16 v62 = 2080;
              long long v63 = v9;
              _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          uint64_t v9 = strtok_r(0, "\n", &__lasts);
        }
        while (v9);
LABEL_26:
        free(__str);
      }
    }
  }
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      __str = 0;
      long long v18 = *(void **)(*(void *)(a1 + 32) + 816);
      long long v19 = v18 ? (const char *)objc_msgSend((id)objc_msgSend(v18, "description"), "UTF8String") : "<nil>";
      asprintf(&__str, "%s", v19);
      if (__str)
      {
        __lasts = 0;
        double v28 = strtok_r(__str, "\n", &__lasts);
        __int16 v29 = (os_log_t *)MEMORY[0x1E4F47A50];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v30 = VRTraceErrorLogLevelToCSTR();
            uint64_t v31 = *v29;
            if (os_log_type_enabled(*v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              uint64_t v55 = v30;
              __int16 v56 = 2080;
              uint64_t v57 = "-[VCSessionParticipantLocal setPeerSubscribedStreams:]_block_invoke";
              __int16 v58 = 1024;
              int v59 = 3551;
              __int16 v60 = 2080;
              long long v61 = "localPublishedStreams=";
              __int16 v62 = 2080;
              long long v63 = v28;
              _os_log_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          double v28 = strtok_r(0, "\n", &__lasts);
        }
        while (v28);
        goto LABEL_52;
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      long long v17 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      long long v17 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      __str = 0;
      uint64_t v20 = (const char *)[(__CFString *)v17 UTF8String];
      __int16 v21 = *(void **)(a1 + 32);
      uint64_t v22 = (void *)v21[102];
      __int16 v23 = v22 ? (const char *)objc_msgSend((id)objc_msgSend(v22, "description"), "UTF8String") : "<nil>";
      asprintf(&__str, "%s(%p) %s", v20, v21, v23);
      if (__str)
      {
        __lasts = 0;
        int v24 = strtok_r(__str, "\n", &__lasts);
        __int16 v25 = (os_log_t *)MEMORY[0x1E4F47A50];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v26 = VRTraceErrorLogLevelToCSTR();
            __int16 v27 = *v25;
            if (os_log_type_enabled(*v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              uint64_t v55 = v26;
              __int16 v56 = 2080;
              uint64_t v57 = "-[VCSessionParticipantLocal setPeerSubscribedStreams:]_block_invoke";
              __int16 v58 = 1024;
              int v59 = 3551;
              __int16 v60 = 2080;
              long long v61 = "localPublishedStreams=";
              __int16 v62 = 2080;
              long long v63 = v24;
              _os_log_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          int v24 = strtok_r(0, "\n", &__lasts);
        }
        while (v24);
LABEL_52:
        free(__str);
      }
    }
  }
  long long v32 = *(unsigned char **)(a1 + 32);
  if (v32[408])
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v39 = VRTraceErrorLogLevelToCSTR();
        uint64_t v40 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v55 = v39;
          __int16 v56 = 2080;
          uint64_t v57 = "-[VCSessionParticipantLocal setPeerSubscribedStreams:]_block_invoke";
          __int16 v58 = 1024;
          int v59 = 3554;
          uint64_t v41 = " [%s] %s:%d Peer subscribed streams update occured while in OneToOne mode. Ignoring subscribed streams update";
          __int16 v42 = v40;
          uint32_t v43 = 28;
LABEL_72:
          _os_log_impl(&dword_1E1EA4000, v42, OS_LOG_TYPE_DEFAULT, v41, buf, v43);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        long long v33 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        long long v33 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v44 = VRTraceErrorLogLevelToCSTR();
        int v45 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          __int16 v46 = *(char **)(a1 + 32);
          *(_DWORD *)buf = 136316162;
          uint64_t v55 = v44;
          __int16 v56 = 2080;
          uint64_t v57 = "-[VCSessionParticipantLocal setPeerSubscribedStreams:]_block_invoke";
          __int16 v58 = 1024;
          int v59 = 3554;
          __int16 v60 = 2112;
          long long v61 = (const char *)v33;
          __int16 v62 = 2048;
          long long v63 = v46;
          uint64_t v41 = " [%s] %s:%d %@(%p) Peer subscribed streams update occured while in OneToOne mode. Ignoring subscribed streams update";
          __int16 v42 = v45;
          uint32_t v43 = 48;
          goto LABEL_72;
        }
      }
    }
  }
  else
  {
    [v32 checkSubscribedStreamsConsistency:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) updateRedundancyEnabledForPeerSubscribedStreams:*(void *)(a1 + 40)];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v34 = (void *)[*(id *)(*(void *)(a1 + 32) + 472) allValues];
    uint64_t v35 = [v34 countByEnumeratingWithState:&v50 objects:v49 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v51 != v37) {
            objc_enumerationMutation(v34);
          }
          [*(id *)(a1 + 32) updatePeerSubscribedStreams:*(void *)(a1 + 40) streamGroup:*(void *)(*((void *)&v50 + 1) + 8 * i)];
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v50 objects:v49 count:16];
      }
      while (v36);
    }
    [*(id *)(a1 + 32) dispatchedUpdateUplinkTargetBitrate:*(unsigned int *)(*(void *)(a1 + 32) + 568) rateChangeCounter:*(unsigned int *)(*(void *)(a1 + 32) + 572)];
  }
}

- (void)updateRedundancyEnabledForPeerSubscribedStreams:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (![+[VCDefaults sharedInstance] forceFECRepairStream])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = (void *)[(NSMutableDictionary *)self->super._streamGroups allValues];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v12 count:16];
    if (!v7)
    {
      uint64_t v5 = 0;
      goto LABEL_3;
    }
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
LABEL_6:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", -[VCSessionUplinkBandwidthAllocator repairStreamIDsForStreamToken:](self->_uplinkBandwidthAllocator, "repairStreamIDsForStreamToken:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "streamToken")));
      if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", a3), "intersectsSet:", v11)) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v12 count:16];
        uint64_t v5 = 0;
        if (v8) {
          goto LABEL_6;
        }
        goto LABEL_3;
      }
    }
  }
  uint64_t v5 = 1;
LABEL_3:
  [(VCSessionParticipantLocal *)self enableRedundancy:v5];
}

- (void)updatePeerSubscribedStreams:(id)a3 streamGroup:(id)a4
{
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:", objc_msgSend((id)objc_msgSend(a4, "streamIDToMediaStreamMap"), "allKeys"));
  objc_msgSend(v7, "intersectSet:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", a3));
  uint64_t v8 = objc_msgSend((id)objc_msgSend(v7, "allObjects"), "mutableCopy");
  BOOL v9 = +[VCSessionParticipantLocal updateUplinkStreamsForPeerSubscribedStreams:v8 streamGroup:a4 uplinkBandwidthAllocator:self->_uplinkBandwidthAllocator];
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", -[VCSessionUplinkBandwidthAllocator repairStreamIDsForStreamToken:](self->_uplinkBandwidthAllocator, "repairStreamIDsForStreamToken:", objc_msgSend(a4, "streamToken")));
  LOBYTE(v10) = objc_msgSend(a4, "updatePeerSubscribedStreams:containsRepairStreams:", v8, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", v8), "intersectsSet:", v10));

  if ((v10 & 1) != 0 || v9)
  {
    uint64_t currentUplinkTargetBitrate = self->_currentUplinkTargetBitrate;
    uint64_t currentRateChangeCounter = self->_currentRateChangeCounter;
    [(VCSessionParticipantLocal *)self updateMediaStreamsForStreamGroup:a4 uplinkBitrateCap:currentUplinkTargetBitrate rateChangeCounter:currentRateChangeCounter];
  }
}

+ (BOOL)updateBandwidthAllocator:(id)a3 activeStream:(id)a4 peerSubscribedStreams:(id)a5 streamGroup:(id)a6
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = (void *)[a4 multiwayConfig];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v12 = (void *)[v11 streamIds];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v50 objects:v49 count:16];
  if (!v13) {
    return v13;
  }
  uint64_t v14 = v13;
  id v33 = a3;
  id v34 = a1;
  long long v32 = v11;
  LOBYTE(v15) = 0;
  LOBYTE(a1) = 0;
  uint64_t v16 = *(void *)v51;
  while (2)
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v51 != v16) {
        objc_enumerationMutation(v12);
      }
      uint64_t v18 = *(void *)(*((void *)&v50 + 1) + 8 * i);
      if (v15)
      {
        int v15 = 1;
        if ((a1 & 1) == 0) {
          goto LABEL_8;
        }
      }
      else
      {
        int v15 = objc_msgSend((id)objc_msgSend(a6, "peerSubscribedStreams"), "containsObject:", v18);
        if ((a1 & 1) == 0)
        {
LABEL_8:
          a1 = (id)[a6 shouldSubscribeToStreamID:v18 peerSubscribedStreams:a5];
          goto LABEL_11;
        }
      }
      a1 = (id)1;
LABEL_11:
      if (v15 & a1) {
        goto LABEL_18;
      }
    }
    uint64_t v14 = [v12 countByEnumeratingWithState:&v50 objects:v49 count:16];
    if (v14) {
      continue;
    }
    break;
  }
  if (v15 == a1)
  {
LABEL_18:
    LOBYTE(v13) = 0;
    return v13;
  }
  if ((id)objc_opt_class() == v34)
  {
    uint64_t v20 = v32;
    long long v19 = v33;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      __int16 v23 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (a1) {
          int v24 = "subscribed to";
        }
        else {
          int v24 = "unsubscribed from";
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v36 = v22;
        __int16 v37 = 2080;
        uint64_t v38 = "+[VCSessionParticipantLocal updateBandwidthAllocator:activeStream:peerSubscribedStreams:streamGroup:]";
        __int16 v39 = 1024;
        int v40 = 3628;
        __int16 v41 = 2080;
        __int16 v42 = (void *)v24;
        __int16 v43 = 2112;
        uint64_t v44 = [a6 streamDescriptionForMediaStreamConfig:a4];
        __int16 v25 = " [%s] %s:%d Remote %s %@";
        uint64_t v26 = v23;
        uint32_t v27 = 48;
LABEL_33:
        _os_log_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
      }
    }
  }
  else
  {
    uint64_t v20 = v32;
    long long v19 = v33;
    if (objc_opt_respondsToSelector()) {
      __int16 v21 = (__CFString *)[v34 performSelector:sel_logPrefix];
    }
    else {
      __int16 v21 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v28 = VRTraceErrorLogLevelToCSTR();
      __int16 v29 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (a1) {
          uint64_t v30 = "subscribed to";
        }
        else {
          uint64_t v30 = "unsubscribed from";
        }
        *(_DWORD *)buf = 136316674;
        uint64_t v36 = v28;
        __int16 v37 = 2080;
        uint64_t v38 = "+[VCSessionParticipantLocal updateBandwidthAllocator:activeStream:peerSubscribedStreams:streamGroup:]";
        __int16 v39 = 1024;
        int v40 = 3628;
        __int16 v41 = 2112;
        __int16 v42 = v21;
        __int16 v43 = 2048;
        uint64_t v44 = (uint64_t)v34;
        __int16 v45 = 2080;
        __int16 v46 = v30;
        __int16 v47 = 2112;
        uint64_t v48 = [a6 streamDescriptionForMediaStreamConfig:a4];
        __int16 v25 = " [%s] %s:%d %@(%p) Remote %s %@";
        uint64_t v26 = v29;
        uint32_t v27 = 68;
        goto LABEL_33;
      }
    }
  }
  LOBYTE(v13) = objc_msgSend(v19, "peerSubscription:streamID:", a1, objc_msgSend(v20, "idsStreamID"));
  return v13;
}

+ (BOOL)updateUplinkStreamsForPeerSubscribedStreams:(id)a3 streamGroup:(id)a4 uplinkBandwidthAllocator:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = (id)[a4 mediaStreamInfoArray];
  uint64_t v20 = [obj countByEnumeratingWithState:&v28 objects:v27 count:16];
  int v8 = 0;
  if (v20)
  {
    uint64_t v19 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = v9;
        uint64_t v10 = *(void **)(*((void *)&v28 + 1) + 8 * v9);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        uint64_t v11 = (void *)[v10 streamConfigs];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v22 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v24;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v24 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
              if (objc_msgSend((id)objc_msgSend(v16, "multiwayConfig"), "startOnDemand")) {
                v8 |= +[VCSessionParticipantLocal updateBandwidthAllocator:a5 activeStream:v16 peerSubscribedStreams:a3 streamGroup:a4];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v22 count:16];
          }
          while (v13);
        }
        uint64_t v9 = v21 + 1;
      }
      while (v21 + 1 != v20);
      uint64_t v20 = [obj countByEnumeratingWithState:&v28 objects:v27 count:16];
    }
    while (v20);
  }
  return v8 & 1;
}

- (BOOL)enableRedundancy:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  BOOL enableRedundancy = self->_enableRedundancy;
  if (enableRedundancy != a3)
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
        uint64_t v22 = "-[VCSessionParticipantLocal enableRedundancy:]";
        __int16 v23 = 1024;
        int v24 = 3658;
        __int16 v25 = 1024;
        BOOL v26 = v3;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Sender side redundancy changed to[%d]", buf, 0x22u);
      }
    }
    self->_BOOL enableRedundancy = v3;
    [(VCSessionUplinkBandwidthAllocator *)self->_uplinkBandwidthAllocator setRedundancyEnabled:v3];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    int v8 = (void *)[(NSMutableDictionary *)self->super._streamGroups allValues];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v14 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v15 + 1) + 8 * v12++) enableRedundancy:v3];
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v14 count:16];
      }
      while (v10);
    }
  }
  return enableRedundancy != v3;
}

- (void)setRetransmissionEnabled:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__VCSessionParticipantLocal_setRetransmissionEnabled___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __54__VCSessionParticipantLocal_setRetransmissionEnabled___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 472) allValues];
  uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v8 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
        if (objc_msgSend(*(id *)(a1 + 32), "shouldEnableUplinkRetransmissionForStreamGroupID:", objc_msgSend(v7, "streamGroupID")))objc_msgSend(v7, "setRetransmissionEnabled:", *(unsigned __int8 *)(a1 + 40)); {
        ++v6;
        }
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v8 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 1073) = *(unsigned char *)(a1 + 40);
  return result;
}

- (void)setUpCaptions
{
  v3[5] = *MEMORY[0x1E4F143B8];
  participantQueue = self->super._participantQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  CMFormatDescriptionRef v3[2] = __42__VCSessionParticipantLocal_setUpCaptions__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(participantQueue, v3);
}

uint64_t __42__VCSessionParticipantLocal_setUpCaptions__block_invoke(uint64_t result)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(result + 32) + 520))
  {
    uint64_t v1 = result;
    *(void *)(*(void *)(result + 32) + 1104) = VCUniqueIDGenerator_GenerateID();
    objc_msgSend(*(id *)(*(void *)(v1 + 32) + 216), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", *(void *)(*(void *)(v1 + 32) + 1104)), &unk_1F3DC4B78);
    long long v5 = 0u;
    memset(v4, 0, sizeof(v4));
    uint64_t v2 = *(void *)(v1 + 32);
    uint64_t v3 = *(void *)(v2 + 1104);
    BYTE8(v5) = 1;
    return objc_msgSend(*(id *)(*(void *)(v1 + 32) + 520), "registerStreamWithConfig:", &v3, Format_Float((uint64_t)v4, 1, *(_DWORD *)(v2 + 400)));
  }
  return result;
}

- (void)updateUplinkTargetBitrate:(unsigned int)a3 rateChangeCounter:(unsigned int)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__VCSessionParticipantLocal_updateUplinkTargetBitrate_rateChangeCounter___block_invoke;
  block[3] = &unk_1E6DB4568;
  block[4] = self;
  unsigned int v6 = a3;
  unsigned int v7 = a4;
  dispatch_async(participantQueue, block);
}

uint64_t __73__VCSessionParticipantLocal_updateUplinkTargetBitrate_rateChangeCounter___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_18;
    }
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = *(_DWORD *)(v5 + 568);
    if (*(unsigned char *)(v5 + 1000)) {
      unsigned int v7 = (int *)(v5 + 1004);
    }
    else {
      unsigned int v7 = (int *)(a1 + 40);
    }
    int v17 = *v7;
    *(_DWORD *)__int16 v21 = 136316162;
    *(void *)&v21[4] = v3;
    *(_WORD *)&v21[12] = 2080;
    *(void *)&v21[14] = "-[VCSessionParticipantLocal updateUplinkTargetBitrate:rateChangeCounter:]_block_invoke";
    *(_WORD *)&v21[22] = 1024;
    LODWORD(v22) = 3718;
    WORD2(v22) = 1024;
    *(_DWORD *)((char *)&v22 + 6) = v6;
    WORD5(v22) = 1024;
    HIDWORD(v22) = v17;
    uint64_t v14 = " [%s] %s:%d Uplink TargetBitrate changed from %u to %u";
    long long v15 = v4;
    uint32_t v16 = 40;
    goto LABEL_17;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v2 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
  }
  else {
    uint64_t v2 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    long long v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = *(_DWORD *)(v10 + 568);
      if (*(unsigned char *)(v10 + 1000)) {
        long long v12 = (int *)(v10 + 1004);
      }
      else {
        long long v12 = (int *)(a1 + 40);
      }
      int v13 = *v12;
      *(_DWORD *)__int16 v21 = 136316674;
      *(void *)&v21[4] = v8;
      *(_WORD *)&v21[12] = 2080;
      *(void *)&v21[14] = "-[VCSessionParticipantLocal updateUplinkTargetBitrate:rateChangeCounter:]_block_invoke";
      *(_WORD *)&v21[22] = 1024;
      LODWORD(v22) = 3718;
      WORD2(v22) = 2112;
      *(void *)((char *)&v22 + 6) = v2;
      HIWORD(v22) = 2048;
      uint64_t v23 = v10;
      LOWORD(v24) = 1024;
      *(_DWORD *)((char *)&v24 + 2) = v11;
      HIWORD(v24) = 1024;
      LODWORD(v25) = v13;
      uint64_t v14 = " [%s] %s:%d %@(%p) Uplink TargetBitrate changed from %u to %u";
      long long v15 = v9;
      uint32_t v16 = 60;
LABEL_17:
      _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, v21, v16);
    }
  }
LABEL_18:
  uint64_t v18 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v18 + 1000)) {
    uint64_t v19 = (_DWORD *)(v18 + 1004);
  }
  else {
    uint64_t v19 = (_DWORD *)(a1 + 40);
  }
  *(_DWORD *)(v18 + 568) = *v19;
  *(_DWORD *)(*(void *)(a1 + 32) + 572) = *(_DWORD *)(a1 + 44);
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedUpdateUplinkTargetBitrate:rateChangeCounter:", *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44), *(_OWORD *)v21, *(void *)&v21[16], v22, v23, v24, v25);
}

- (void)updateUplinkTargetBitrateForStreamGroups
{
  v3[5] = *MEMORY[0x1E4F143B8];
  participantQueue = self->super._participantQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  CMFormatDescriptionRef v3[2] = __69__VCSessionParticipantLocal_updateUplinkTargetBitrateForStreamGroups__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(participantQueue, v3);
}

uint64_t __69__VCSessionParticipantLocal_updateUplinkTargetBitrateForStreamGroups__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 568);
        *(_DWORD *)uint64_t v14 = 136315906;
        *(void *)&v14[4] = v3;
        *(_WORD *)&v14[12] = 2080;
        *(void *)&v14[14] = "-[VCSessionParticipantLocal updateUplinkTargetBitrateForStreamGroups]_block_invoke";
        *(_WORD *)&v14[22] = 1024;
        LODWORD(v15) = 3727;
        WORD2(v15) = 1024;
        *(_DWORD *)((char *)&v15 + 6) = v5;
        int v6 = " [%s] %s:%d Uplink TargetBitrate set to %u";
        unsigned int v7 = v4;
        uint32_t v8 = 34;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, v14, v8);
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
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        int v12 = *(_DWORD *)(v11 + 568);
        *(_DWORD *)uint64_t v14 = 136316418;
        *(void *)&v14[4] = v9;
        *(_WORD *)&v14[12] = 2080;
        *(void *)&v14[14] = "-[VCSessionParticipantLocal updateUplinkTargetBitrateForStreamGroups]_block_invoke";
        *(_WORD *)&v14[22] = 1024;
        LODWORD(v15) = 3727;
        WORD2(v15) = 2112;
        *(void *)((char *)&v15 + 6) = v2;
        HIWORD(v15) = 2048;
        uint64_t v16 = v11;
        LOWORD(v17) = 1024;
        *(_DWORD *)((char *)&v17 + 2) = v12;
        int v6 = " [%s] %s:%d %@(%p) Uplink TargetBitrate set to %u";
        unsigned int v7 = v10;
        uint32_t v8 = 54;
        goto LABEL_11;
      }
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedUpdateUplinkTargetBitrate:rateChangeCounter:", *(unsigned int *)(*(void *)(a1 + 32) + 568), *(unsigned int *)(*(void *)(a1 + 32) + 572), *(_OWORD *)v14, *(void *)&v14[16], v15, v16, v17, v18);
}

- (void)dispatchedUpdateUplinkTargetBitrate:(unsigned int)a3 rateChangeCounter:(unsigned int)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->super._state == 1)
  {
    uint64_t v4 = *(void *)&a4;
    uint64_t v5 = *(void *)&a3;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    unsigned int v7 = (void *)[(NSMutableDictionary *)self->super._streamGroups allValues];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v13 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          int v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          [v12 setCurrentUplinkTargetBitrate:v5];
          [(VCSessionParticipantLocal *)self updateMediaStreamsForStreamGroup:v12 uplinkBitrateCap:v5 rateChangeCounter:v4];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v13 count:16];
      }
      while (v9);
    }
  }
}

- (void)updateTargetBitrateOneToOne:(unsigned int)a3 rateChangeCounter:(unsigned int)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__VCSessionParticipantLocal_updateTargetBitrateOneToOne_rateChangeCounter___block_invoke;
  block[3] = &unk_1E6DB4568;
  block[4] = self;
  unsigned int v6 = a3;
  unsigned int v7 = a4;
  dispatch_async(participantQueue, block);
}

uint64_t __75__VCSessionParticipantLocal_updateTargetBitrateOneToOne_rateChangeCounter___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        uint64_t v6 = v5 + 944;
        LODWORD(v5) = *(_DWORD *)(v5 + 168);
        LODWORD(v6) = *(_DWORD *)(v6 + 32);
        int v7 = *(_DWORD *)(a1 + 40);
        int v8 = *(_DWORD *)(a1 + 44);
        *(_DWORD *)uint64_t v20 = 136316674;
        *(void *)&v20[4] = v3;
        *(_WORD *)&v20[12] = 2080;
        *(void *)&v20[14] = "-[VCSessionParticipantLocal updateTargetBitrateOneToOne:rateChangeCounter:]_block_invoke";
        *(_WORD *)&v20[22] = 1024;
        LODWORD(v21) = 3744;
        WORD2(v21) = 1024;
        *(_DWORD *)((char *)&v21 + 6) = v6;
        WORD5(v21) = 1024;
        HIDWORD(v21) = v7;
        LOWORD(v22) = 1024;
        *(_DWORD *)((char *)&v22 + 2) = v5;
        HIWORD(v22) = 1024;
        LODWORD(v23) = v8;
        uint64_t v9 = " [%s] %s:%d OneToOne TargetBitrate changed from %u to %u (state=%u, rateChangeCounter=%u)";
        uint64_t v10 = v4;
        uint32_t v11 = 52;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, v20, v11);
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
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      int v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(a1 + 32);
        int v15 = *(_DWORD *)(v14 + 168);
        int v16 = *(_DWORD *)(v14 + 976);
        int v17 = *(_DWORD *)(a1 + 40);
        int v18 = *(_DWORD *)(a1 + 44);
        *(_DWORD *)uint64_t v20 = 136317186;
        *(void *)&v20[4] = v12;
        *(_WORD *)&v20[12] = 2080;
        *(void *)&v20[14] = "-[VCSessionParticipantLocal updateTargetBitrateOneToOne:rateChangeCounter:]_block_invoke";
        *(_WORD *)&v20[22] = 1024;
        LODWORD(v21) = 3744;
        WORD2(v21) = 2112;
        *(void *)((char *)&v21 + 6) = v2;
        HIWORD(v21) = 2048;
        uint64_t v22 = v14;
        LOWORD(v23) = 1024;
        *(_DWORD *)((char *)&v23 + 2) = v16;
        HIWORD(v23) = 1024;
        LODWORD(v24) = v17;
        WORD2(v24) = 1024;
        *(_DWORD *)((char *)&v24 + 6) = v15;
        WORD5(v24) = 1024;
        HIDWORD(v24) = v18;
        uint64_t v9 = " [%s] %s:%d %@(%p) OneToOne TargetBitrate changed from %u to %u (state=%u, rateChangeCounter=%u)";
        uint64_t v10 = v13;
        uint32_t v11 = 72;
        goto LABEL_11;
      }
    }
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 976) = *(_DWORD *)(a1 + 40);
  *(_DWORD *)(*(void *)(a1 + 32) + 980) = *(_DWORD *)(a1 + 44);
  *(_DWORD *)(*(void *)(a1 + 32) + 568) = *(_DWORD *)(a1 + 40);
  *(_DWORD *)(*(void *)(a1 + 32) + 572) = *(_DWORD *)(a1 + 44);
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedUpdateUplinkTargetBitrate:rateChangeCounter:", *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44), *(_OWORD *)v20, *(void *)&v20[16], v21, v22, v23, v24, v25);
}

- (void)updateVCMediaQueueSize:(unsigned int)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__VCSessionParticipantLocal_updateVCMediaQueueSize___block_invoke;
  block[3] = &unk_1E6DB3F08;
  block[4] = self;
  unsigned int v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __52__VCSessionParticipantLocal_updateVCMediaQueueSize___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedUpdateVCMediaQueueSize:*(unsigned int *)(a1 + 40)];
}

- (void)dispatchedUpdateVCMediaQueueSize:(unsigned int)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (self->super._state == 1)
  {
    uint64_t v4 = *(void *)&a3;
    if (self->_currentVCMediaQueueSize == a3) {
      return;
    }
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        uint64_t v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          unsigned int currentVCMediaQueueSize = self->_currentVCMediaQueueSize;
          *(_DWORD *)buf = 136316162;
          uint64_t v29 = v9;
          __int16 v30 = 2080;
          long long v31 = "-[VCSessionParticipantLocal dispatchedUpdateVCMediaQueueSize:]";
          __int16 v32 = 1024;
          int v33 = 3766;
          __int16 v34 = 1024;
          *(_DWORD *)uint64_t v35 = currentVCMediaQueueSize;
          *(_WORD *)&v35[4] = 1024;
          *(_DWORD *)&v35[6] = v4;
          uint64_t v12 = " [%s] %s:%d VCMediaQueue size changed from old=%ums to new=%ums";
          int v13 = v10;
          uint32_t v14 = 40;
LABEL_23:
          _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        unsigned int v5 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
      }
      else {
        unsigned int v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        int v16 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v17 = self->_currentVCMediaQueueSize;
          *(_DWORD *)buf = 136316674;
          uint64_t v29 = v15;
          __int16 v30 = 2080;
          long long v31 = "-[VCSessionParticipantLocal dispatchedUpdateVCMediaQueueSize:]";
          __int16 v32 = 1024;
          int v33 = 3766;
          __int16 v34 = 2112;
          *(void *)uint64_t v35 = v5;
          *(_WORD *)&v35[8] = 2048;
          uint64_t v36 = self;
          __int16 v37 = 1024;
          unsigned int v38 = v17;
          __int16 v39 = 1024;
          int v40 = v4;
          uint64_t v12 = " [%s] %s:%d %@(%p) VCMediaQueue size changed from old=%ums to new=%ums";
          int v13 = v16;
          uint32_t v14 = 60;
          goto LABEL_23;
        }
      }
    }
    self->_unsigned int currentVCMediaQueueSize = v4;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    videoStreamGroups = self->super._videoStreamGroups;
    uint64_t v19 = [(NSMutableArray *)videoStreamGroups countByEnumeratingWithState:&v24 objects:v23 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v25 != v21) {
            objc_enumerationMutation(videoStreamGroups);
          }
          [*(id *)(*((void *)&v24 + 1) + 8 * i) setMediaQueueSize:v4];
        }
        uint64_t v20 = [(NSMutableArray *)videoStreamGroups countByEnumeratingWithState:&v24 objects:v23 count:16];
      }
      while (v20);
    }
    return;
  }
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionParticipantLocal dispatchedUpdateVCMediaQueueSize:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v6 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      int v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v29 = v7;
        __int16 v30 = 2080;
        long long v31 = "-[VCSessionParticipantLocal dispatchedUpdateVCMediaQueueSize:]";
        __int16 v32 = 1024;
        int v33 = 3762;
        __int16 v34 = 2112;
        *(void *)uint64_t v35 = v6;
        *(_WORD *)&v35[8] = 2048;
        uint64_t v36 = self;
        _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) VCMediaQueue size should only be updated when participant is running", buf, 0x30u);
      }
    }
  }
}

- (unsigned)generateIDSStreamID
{
  return (unint64_t)[(VCSessionParticipantLocal *)self generateSSRC:0 streamID:1 repairStreamID:0 v2StreamID:0] >> 32;
}

- (unsigned)generateSSRC
{
  return [(VCSessionParticipantLocal *)self generateSSRC:1 streamID:0 repairStreamID:0 v2StreamID:0];
}

- (tagVCNetworkStreamIdentifiers)generateSSRC:(BOOL)a3 streamID:(BOOL)a4 repairStreamID:(BOOL)a5 v2StreamID:(BOOL)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v16 = 0;
  unsigned int v17 = &v16;
  uint64_t v18 = 0x3010000000;
  uint64_t v19 = "";
  unint64_t v20 = 0xAAAAAAAAAAAAAAAALL;
  int v21 = -1431655766;
  participantQueue = self->super._participantQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__VCSessionParticipantLocal_generateSSRC_streamID_repairStreamID_v2StreamID___block_invoke;
  v11[3] = &unk_1E6DB6470;
  BOOL v12 = a3;
  v11[4] = self;
  v11[5] = &v16;
  BOOL v13 = a4;
  BOOL v14 = a5;
  BOOL v15 = a6;
  dispatch_sync(participantQueue, v11);
  uint64_t v7 = v17[4];
  int v8 = *((_DWORD *)v17 + 10);
  _Block_object_dispose(&v16, 8);
  uint64_t v9 = v7;
  int v10 = v8;
  result.var0 = v9;
  result.var1 = WORD2(v9);
  result.var2 = HIWORD(v9);
  result.var3 = v10;
  return result;
}

uint64_t __77__VCSessionParticipantLocal_generateSSRC_streamID_repairStreamID_v2StreamID___block_invoke(uint64_t a1)
{
  do
  {
    uint64_t result = RTPGenerateSSRC();
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = result;
    *(_WORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 36) = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                           + 32);
    *(_WORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 38) = *(_WORD *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 36)
                                                               + 1;
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    unsigned __int16 v4 = *(_WORD *)(v3 + 36);
    if (v4 < 0xFF9Bu) {
      __int16 v5 = 100;
    }
    else {
      __int16 v5 = 101;
    }
    *(_WORD *)(v3 + 40) = v5 + v4;
    if (*(unsigned char *)(a1 + 48))
    {
      uint64_t result = [*(id *)(a1 + 32) containsStreamWithSSRC:*(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 32)];
      BOOL v6 = (result & 1) == 0 && *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) > 0x3Fu;
    }
    else
    {
      BOOL v6 = 1;
    }
    if (*(unsigned char *)(a1 + 49))
    {
      uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1040), "containsObject:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", *(unsigned __int16 *)(*(void *)(*(void *)(a1 + 40) + 8) + 36)));
      BOOL v7 = (result & 1) == 0 && *(_WORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 36) != 0;
    }
    else
    {
      BOOL v7 = 1;
    }
    if (*(unsigned char *)(a1 + 50))
    {
      uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1040), "containsObject:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", *(unsigned __int16 *)(*(void *)(*(void *)(a1 + 40) + 8) + 38)));
      BOOL v8 = (result & 1) == 0 && *(_WORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 38) != 0;
    }
    else
    {
      BOOL v8 = 1;
    }
    if (*(unsigned char *)(a1 + 51))
    {
      uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1040), "containsObject:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", *(unsigned __int16 *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)));
      BOOL v9 = (result & 1) == 0 && *(_WORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
    }
    else
    {
      BOOL v9 = 1;
    }
  }
  while (!v6 || !v7 || !v8 || !v9);
  if (*(unsigned char *)(a1 + 49)) {
    uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1040), "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", *(unsigned __int16 *)(*(void *)(*(void *)(a1 + 40) + 8) + 36)));
  }
  else {
    *(_WORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 36) = 0;
  }
  if (*(unsigned char *)(a1 + 50)) {
    uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1040), "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", *(unsigned __int16 *)(*(void *)(*(void *)(a1 + 40) + 8) + 38)));
  }
  else {
    *(_WORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 38) = 0;
  }
  if (*(unsigned char *)(a1 + 51)) {
    uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1040), "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", *(unsigned __int16 *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)));
  }
  else {
    *(_WORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = 0;
  }
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v10 = *(void *)(a1 + 40);
    uint32_t v11 = *(void **)(*(void *)(a1 + 32) + 1048);
    uint64_t v12 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(*(void *)(v10 + 8) + 32)];
    return [v11 addObject:v12];
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = 0;
  }
  return result;
}

- (BOOL)onVideoFrame:(opaqueCMSampleBuffer *)a3 frameTime:(id *)a4 attribute:(id *)a5
{
  return 1;
}

- (BOOL)prepareVideoFrame:(opaqueCMSampleBuffer *)a3
{
  return 1;
}

- (void)sourceFrameRateDidChange:(unsigned int)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      BOOL v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)BOOL v14 = 136315906;
        *(void *)&v14[4] = v7;
        *(_WORD *)&v14[12] = 2080;
        *(void *)&v14[14] = "-[VCSessionParticipantLocal sourceFrameRateDidChange:]";
        *(_WORD *)&v14[22] = 1024;
        LODWORD(v15) = 3866;
        WORD2(v15) = 1024;
        *(_DWORD *)((char *)&v15 + 6) = a3;
        BOOL v9 = " [%s] %s:%d frameRate=%u";
        uint64_t v10 = v8;
        uint32_t v11 = 34;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, v14, v11);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      __int16 v5 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      BOOL v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)BOOL v14 = 136316418;
        *(void *)&v14[4] = v12;
        *(_WORD *)&v14[12] = 2080;
        *(void *)&v14[14] = "-[VCSessionParticipantLocal sourceFrameRateDidChange:]";
        *(_WORD *)&v14[22] = 1024;
        LODWORD(v15) = 3866;
        WORD2(v15) = 2112;
        *(void *)((char *)&v15 + 6) = v5;
        HIWORD(v15) = 2048;
        uint64_t v16 = self;
        LOWORD(v17) = 1024;
        *(_DWORD *)((char *)&v17 + 2) = a3;
        BOOL v9 = " [%s] %s:%d %@(%p) frameRate=%u";
        uint64_t v10 = v13;
        uint32_t v11 = 54;
        goto LABEL_11;
      }
    }
  }
  *(float *)&double v6 = (float)a3;
  -[VCMediaRecorder setFrameRate:](self->super._mediaRecorder, "setFrameRate:", v6, *(_OWORD *)v14, *(void *)&v14[16], v15, v16, v17, v18);
}

- (id)copyOnVideoFrameBlock
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  CMFormatDescriptionRef v3[2] = __50__VCSessionParticipantLocal_copyOnVideoFrameBlock__block_invoke;
  v3[3] = &unk_1E6DB7C50;
  v3[4] = self;
  return _Block_copy(v3);
}

uint64_t __50__VCSessionParticipantLocal_copyOnVideoFrameBlock__block_invoke(uint64_t a1, opaqueCMSampleBuffer *a2, uint64_t a3, uint64_t a4)
{
  return 1;
}

- (void)avConferencePreviewError:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315906;
        uint64_t v14 = v6;
        __int16 v15 = 2080;
        uint64_t v16 = "-[VCSessionParticipantLocal avConferencePreviewError:]";
        __int16 v17 = 1024;
        int v18 = 3879;
        __int16 v19 = 2112;
        id v20 = a3;
        BOOL v8 = " [%s] %s:%d avConferencePreviewError %@";
        BOOL v9 = v7;
        uint32_t v10 = 38;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      __int16 v5 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136316418;
        uint64_t v14 = v11;
        __int16 v15 = 2080;
        uint64_t v16 = "-[VCSessionParticipantLocal avConferencePreviewError:]";
        __int16 v17 = 1024;
        int v18 = 3879;
        __int16 v19 = 2112;
        id v20 = v5;
        __int16 v21 = 2048;
        uint64_t v22 = self;
        __int16 v23 = 2112;
        id v24 = a3;
        BOOL v8 = " [%s] %s:%d %@(%p) avConferencePreviewError %@";
        BOOL v9 = v12;
        uint32_t v10 = 58;
        goto LABEL_11;
      }
    }
  }
}

- (id)clientCaptureRule
{
  return 0;
}

- (void)thermalLevelDidChange:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v24 = v6;
        __int16 v25 = 2080;
        long long v26 = "-[VCSessionParticipantLocal thermalLevelDidChange:]";
        __int16 v27 = 1024;
        int v28 = 3887;
        __int16 v29 = 1024;
        LODWORD(v30) = v3;
        BOOL v8 = " [%s] %s:%d thermalLevelDidChange %u";
        BOOL v9 = v7;
        uint32_t v10 = 34;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      __int16 v5 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v24 = v11;
        __int16 v25 = 2080;
        long long v26 = "-[VCSessionParticipantLocal thermalLevelDidChange:]";
        __int16 v27 = 1024;
        int v28 = 3887;
        __int16 v29 = 2112;
        __int16 v30 = v5;
        __int16 v31 = 2048;
        __int16 v32 = self;
        __int16 v33 = 1024;
        int v34 = v3;
        BOOL v8 = " [%s] %s:%d %@(%p) thermalLevelDidChange %u";
        BOOL v9 = v12;
        uint32_t v10 = 54;
        goto LABEL_11;
      }
    }
  }
  [(VCSessionParticipant *)self reportingAgent];
  micro();
  reportingThermal();
  [(VCSessionParticipantLocal *)self checkAndReportThermalIncreaseAudioOnly:v3];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  remoteParticipants = self->_remoteParticipants;
  uint64_t v14 = [(NSArray *)remoteParticipants countByEnumeratingWithState:&v19 objects:v18 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(remoteParticipants);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * i) updateThermalLevel:v3];
      }
      uint64_t v15 = [(NSArray *)remoteParticipants countByEnumeratingWithState:&v19 objects:v18 count:16];
    }
    while (v15);
  }
}

- (void)cameraAvailabilityDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
      return;
    }
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    BOOL v8 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      int v15 = 136315906;
      uint64_t v16 = v6;
      __int16 v17 = 2080;
      int v18 = "-[VCSessionParticipantLocal cameraAvailabilityDidChange:]";
      __int16 v19 = 1024;
      int v20 = 3896;
      __int16 v21 = 1024;
      LODWORD(v22) = v3;
      BOOL v9 = " [%s] %s:%d cameraAvailabilityDidChange=%d ignored";
      uint32_t v10 = v7;
      uint32_t v11 = 34;
LABEL_13:
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, v11);
      return;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[VCSessionParticipantLocal cameraAvailabilityDidChange:]();
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      __int16 v5 = (__CFString *)[(VCSessionParticipantLocal *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      int v13 = *MEMORY[0x1E4F47A50];
      uint64_t v14 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
          return;
        }
        int v15 = 136316418;
        uint64_t v16 = v12;
        __int16 v17 = 2080;
        int v18 = "-[VCSessionParticipantLocal cameraAvailabilityDidChange:]";
        __int16 v19 = 1024;
        int v20 = 3896;
        __int16 v21 = 2112;
        long long v22 = v5;
        __int16 v23 = 2048;
        uint64_t v24 = self;
        __int16 v25 = 1024;
        BOOL v26 = v3;
        BOOL v9 = " [%s] %s:%d %@(%p) cameraAvailabilityDidChange=%d ignored";
        uint32_t v10 = v13;
        uint32_t v11 = 54;
        goto LABEL_13;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        int v15 = 136316418;
        uint64_t v16 = v12;
        __int16 v17 = 2080;
        int v18 = "-[VCSessionParticipantLocal cameraAvailabilityDidChange:]";
        __int16 v19 = 1024;
        int v20 = 3896;
        __int16 v21 = 2112;
        long long v22 = v5;
        __int16 v23 = 2048;
        uint64_t v24 = self;
        __int16 v25 = 1024;
        BOOL v26 = v3;
        _os_log_debug_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %@(%p) cameraAvailabilityDidChange=%d ignored", (uint8_t *)&v15, 0x36u);
      }
    }
  }
}

- (void)captureSourcePositionDidChange:(BOOL)a3
{
  [(VCSessionParticipant *)self reportingAgent];

  reportingGenericEvent();
}

- (void)captureSourceCenterStageEnabledDidChange:(BOOL)a3
{
  [(VCSessionParticipant *)self reportingAgent];

  reportingGenericEvent();
}

- (void)captureSourcePortraitBlurEnabledDidChange:(BOOL)a3
{
  [(VCSessionParticipant *)self reportingAgent];

  reportingGenericEvent();
}

- (void)updateCaptureSourceVideoFeatureStatus:(tagVCVideoCaptureFeatureStatus)a3
{
  uint64_t v3 = *(void *)&a3.var0;
  void v6[7] = *MEMORY[0x1E4F143B8];
  v5[0] = @"VideoEyeContact";
  v6[0] = [NSNumber numberWithChar:a3.var0];
  v5[1] = @"PMFENB";
  v6[1] = [NSNumber numberWithChar:((int)(v3 << 8) >> 24)];
  v5[2] = @"SLFENB";
  v6[2] = [NSNumber numberWithChar:((int)v3 >> 24)];
  v5[3] = @"CSFENB";
  v6[3] = [NSNumber numberWithChar:((__int16)v3 >> 8)];
  v5[4] = @"REFENB";
  v6[4] = [NSNumber numberWithChar:v3 << 24 >> 56];
  v5[5] = @"BGRFENB";
  v6[5] = [NSNumber numberWithChar:v3 << 16 >> 56];
  v5[6] = @"BGRCCFENB";
  v6[6] = [NSNumber numberWithChar:v3 << 8 >> 56];
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:7];
  [(VCSessionParticipant *)self reportingAgent];
  reportingGenericEvent();
}

- (void)frameRateIsBeingThrottled:(int)a3 thermalLevelDidChange:(BOOL)a4 powerLevelDidChange:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v7 = *(void *)&a3;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionaryAddValue(Mutable, @"VCSPUUID", self->super._uuid);
  CFDictionaryAddValue(Mutable, @"VCSPFR", (const void *)[NSNumber numberWithInt:v7]);
  CFDictionaryAddValue(Mutable, @"VCSPTLC", (const void *)[NSNumber numberWithBool:v6]);
  CFDictionaryAddValue(Mutable, @"VCSPPLC", (const void *)[NSNumber numberWithBool:v5]);
  [(VCSessionParticipant *)self reportingAgent];
  reportingGenericEvent();
  if (Mutable)
  {
    CFRelease(Mutable);
  }
}

- (void)captureSource1080pAvailabilityDidChange:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__VCSessionParticipantLocal_captureSource1080pAvailabilityDidChange___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __69__VCSessionParticipantLocal_captureSource1080pAvailabilityDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 552) setCamera1080pAvailable:*(unsigned __int8 *)(a1 + 40)];
}

- (void)reactionDidStart:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__VCSessionParticipantLocal_reactionDidStart___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __46__VCSessionParticipantLocal_reactionDidStart___block_invoke(uint64_t a1)
{
  v2[6] = *MEMORY[0x1E4F143B8];
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __46__VCSessionParticipantLocal_reactionDidStart___block_invoke_2;
  v2[3] = &unk_1E6DB6A68;
  return [*(id *)(a1 + 32) callDelegateWithBlock:v2];
}

uint64_t __46__VCSessionParticipantLocal_reactionDidStart___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 vcSessionParticipant:*(void *)(a1 + 32) reactionDidStart:*(void *)(a1 + 40)];
}

- (void)didStopReacting
{
  v3[5] = *MEMORY[0x1E4F143B8];
  participantQueue = self->super._participantQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  CMFormatDescriptionRef v3[2] = __44__VCSessionParticipantLocal_didStopReacting__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(participantQueue, v3);
}

uint64_t __44__VCSessionParticipantLocal_didStopReacting__block_invoke(uint64_t a1)
{
  v3[5] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  CMFormatDescriptionRef v3[2] = __44__VCSessionParticipantLocal_didStopReacting__block_invoke_2;
  v3[3] = &unk_1E6DB69A0;
  v3[4] = v1;
  return [v1 callDelegateWithBlock:v3];
}

uint64_t __44__VCSessionParticipantLocal_didStopReacting__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 vcSessionParticipantDidStopReacting:*(void *)(a1 + 32)];
}

- (void)reportVideoEnabledStatsWithVideoEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v9[3] = *MEMORY[0x1E4F143B8];
  double v5 = micro();
  double lastVideoEnabledChangedTime = self->_lastVideoEnabledChangedTime;
  v8[0] = @"VCSPUUID";
  uuid = self->super._uuid;
  if (!uuid) {
    uuid = (NSString *)[MEMORY[0x1E4F1CA98] null];
  }
  v9[0] = uuid;
  v8[1] = @"VIDSTATE";
  v9[1] = [NSNumber numberWithBool:v3];
  v8[2] = @"VIDDRTN";
  v9[2] = [NSNumber numberWithUnsignedInt:(v5 - lastVideoEnabledChangedTime)];
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];
  [(VCSessionParticipant *)self reportingAgent];
  reportingGenericEvent();
  self->_double lastVideoEnabledChangedTime = v5;
}

- (void)dispatchedHandleActiveConnectionChangeForStreamGroups:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = (id)[(NSMutableDictionary *)self->super._streamGroups allValues];
  uint64_t v5 = [obj countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(obj);
        }
        BOOL v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = [v9 streamToken];
        BOOL v11 = self->super._oneToOneModeEnabled || [v9 streamGroupID] == 1935897189;
        objc_msgSend(v9, "setActiveConnection:uplinkBitrateCap:activeMediaStreamIDs:mediaBitrates:rateChangeCounter:", a3, self->_currentUplinkTargetBitrate, -[VCSessionUplinkBandwidthAllocator streamIDsForStreamToken:targetBitrate:](self->_uplinkBandwidthAllocator, "streamIDsForStreamToken:targetBitrate:", v10, self->_currentUplinkTargetBitrate), -[VCSessionUplinkBandwidthAllocator targetBitratesForStreamToken:targetNetworkBitrate:preferNetworkBitrates:](self->_uplinkBandwidthAllocator, "targetBitratesForStreamToken:targetNetworkBitrate:preferNetworkBitrates:", v10, self->_currentUplinkTargetBitrate, v11), self->_currentRateChangeCounter);
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v14 objects:v13 count:16];
    }
    while (v6);
  }
  [(VCSessionParticipantLocal *)self dispatchedUpdateUplinkTargetBitrate:self->_currentUplinkTargetBitrate rateChangeCounter:self->_currentRateChangeCounter];
}

- (void)updateMediaStreamsForStreamGroup:(id)a3 uplinkBitrateCap:(unsigned int)a4 rateChangeCounter:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v9 = [a3 streamToken];
  BOOL v10 = self->super._oneToOneModeEnabled || [a3 streamGroupID] == 1935897189;
  objc_msgSend(a3, "updateUplinkBitrateCapCell:activeStreamIDs:", self->_uplinkBitrateCapCell, -[VCSessionUplinkBandwidthAllocator streamIDsForStreamToken:targetBitrateCap:](self->_uplinkBandwidthAllocator, "streamIDsForStreamToken:targetBitrateCap:", v9, self->_uplinkBitrateCapCell));
  objc_msgSend(a3, "updateUplinkBitrateCapWifi:activeStreamIDs:", self->_uplinkBitrateCapWifi, -[VCSessionUplinkBandwidthAllocator streamIDsForStreamToken:targetBitrateCap:](self->_uplinkBandwidthAllocator, "streamIDsForStreamToken:targetBitrateCap:", v9, self->_uplinkBitrateCapWifi));
  uint64_t v11 = [(VCSessionUplinkBandwidthAllocator *)self->_uplinkBandwidthAllocator targetBitratesForStreamToken:v9 targetNetworkBitrate:v6 preferNetworkBitrates:v10];
  uint64_t v12 = [(VCSessionUplinkBandwidthAllocator *)self->_uplinkBandwidthAllocator streamIDsForStreamToken:v9 targetBitrate:v6];

  [a3 updateActiveMediaStreamIDs:v12 withTargetBitrate:v6 mediaBitrates:v11 rateChangeCounter:v5];
}

- (void)serverDidDie
{
  uint64_t v2 = [(VCSessionParticipant *)self delegate];

  [(VCSessionParticipantDelegate *)v2 serverDidDie];
}

- (void)handleActiveConnectionChange:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__VCSessionParticipantLocal_handleActiveConnectionChange___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __58__VCSessionParticipantLocal_handleActiveConnectionChange___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      unsigned __int16 v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v5 = [*(id *)(a1 + 40) uplinkBitrateCap];
        *(_DWORD *)__int16 v32 = 136315906;
        *(void *)&void v32[4] = v3;
        *(_WORD *)&v32[12] = 2080;
        *(void *)&v32[14] = "-[VCSessionParticipantLocal handleActiveConnectionChange:]_block_invoke";
        *(_WORD *)&v32[22] = 1024;
        LODWORD(v33) = 4091;
        WORD2(v33) = 1024;
        *(_DWORD *)((char *)&v33 + 6) = v5;
        uint64_t v6 = " [%s] %s:%d Active connection changed with new connection uplinkBitrateCap %d";
        uint64_t v7 = v4;
        uint32_t v8 = 34;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, v32, v8);
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
      BOOL v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        int v12 = [*(id *)(a1 + 40) uplinkBitrateCap];
        *(_DWORD *)__int16 v32 = 136316418;
        *(void *)&void v32[4] = v9;
        *(_WORD *)&v32[12] = 2080;
        *(void *)&v32[14] = "-[VCSessionParticipantLocal handleActiveConnectionChange:]_block_invoke";
        *(_WORD *)&v32[22] = 1024;
        LODWORD(v33) = 4091;
        WORD2(v33) = 2112;
        *(void *)((char *)&v33 + 6) = v2;
        HIWORD(v33) = 2048;
        uint64_t v34 = v11;
        LOWORD(v35) = 1024;
        *(_DWORD *)((char *)&v35 + 2) = v12;
        uint64_t v6 = " [%s] %s:%d %@(%p) Active connection changed with new connection uplinkBitrateCap %d";
        uint64_t v7 = v10;
        uint32_t v8 = 54;
        goto LABEL_11;
      }
    }
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 432) = VCConnection_IsLocalOnWiFiOrWired(*(void *)(a1 + 40));
  int IsEndToEndLink = VCConnection_IsEndToEndLink(*(void *)(a1 + 40));
  uint64_t v14 = *(void *)(a1 + 32);
  if (IsEndToEndLink)
  {
    if (([(id)v14 dispatchedIsAnyCameraMediaTypeEnabled] & 1) != 0
      || *(unsigned char *)(*(void *)(a1 + 32) + 375))
    {
      unsigned int v15 = objc_msgSend(*(id *)(a1 + 40), "uplinkBitrateCapOneToOne", *(_OWORD *)v32, *(void *)&v32[16], v33, v34, v35, v36);
    }
    else
    {
      unsigned int v15 = [*(id *)(a1 + 40) uplinkAudioBitrateCapOneToOne];
    }
    unsigned int v16 = v15;
    uint64_t v17 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v17 + 1000)) {
      unsigned int v16 = *(_DWORD *)(v17 + 1004);
    }
    if (v16 < *(_DWORD *)(v17 + 976))
    {
      *(_DWORD *)(v17 + 976) = v16;
      *(_DWORD *)(*(void *)(a1 + 32) + 568) = v16;
    }
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_35;
      }
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      __int16 v21 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_35;
      }
      *(_DWORD *)__int16 v32 = 136315906;
      *(void *)&void v32[4] = v20;
      *(_WORD *)&v32[12] = 2080;
      *(void *)&v32[14] = "-[VCSessionParticipantLocal handleActiveConnectionChange:]_block_invoke";
      *(_WORD *)&v32[22] = 1024;
      LODWORD(v33) = 4102;
      WORD2(v33) = 1024;
      *(_DWORD *)((char *)&v33 + 6) = v16;
      long long v22 = " [%s] %s:%d Active connection changed with new connection oneToOneUplinkBitrateCap %d";
      __int16 v23 = v21;
      uint32_t v24 = 34;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v18 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v18 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_35;
      }
      uint64_t v25 = VRTraceErrorLogLevelToCSTR();
      BOOL v26 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_35;
      }
      uint64_t v27 = *(void *)(a1 + 32);
      *(_DWORD *)__int16 v32 = 136316418;
      *(void *)&void v32[4] = v25;
      *(_WORD *)&v32[12] = 2080;
      *(void *)&v32[14] = "-[VCSessionParticipantLocal handleActiveConnectionChange:]_block_invoke";
      *(_WORD *)&v32[22] = 1024;
      LODWORD(v33) = 4102;
      WORD2(v33) = 2112;
      *(void *)((char *)&v33 + 6) = v18;
      HIWORD(v33) = 2048;
      uint64_t v34 = v27;
      LOWORD(v35) = 1024;
      *(_DWORD *)((char *)&v35 + 2) = v16;
      long long v22 = " [%s] %s:%d %@(%p) Active connection changed with new connection oneToOneUplinkBitrateCap %d";
      __int16 v23 = v26;
      uint32_t v24 = 54;
    }
    _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, v22, v32, v24);
LABEL_35:
    *(unsigned char *)(*(void *)(a1 + 32) + 984) = 1;
    goto LABEL_36;
  }
  if (*(unsigned char *)(v14 + 1000))
  {
    int v19 = *(_DWORD *)(v14 + 1004);
  }
  else
  {
    int v19 = [*(id *)(a1 + 40) uplinkBitrateCap];
    uint64_t v14 = *(void *)(a1 + 32);
  }
  *(_DWORD *)(v14 + 568) = v19;
LABEL_36:
  *(_DWORD *)(*(void *)(a1 + 32) + 568) = VCDefaults_GetIntValueForKey(@"forcedTxRate", *(unsigned int *)(*(void *)(a1 + 32) + 568));
  [*(id *)(a1 + 32) dispatchedHandleActiveConnectionChangeForStreamGroups:*(void *)(a1 + 40)];
  int IsLocalOnCellular = VCConnection_IsLocalOnCellular(*(void *)(a1 + 40));
  uint64_t v29 = *(void *)(*(void *)(a1 + 32) + 424);
  if (IsLocalOnCellular) {
    unsigned int v30 = [*(id *)(a1 + 40) connectionMTU];
  }
  else {
    unsigned int v30 = 1280;
  }
  return VCMediaQueue_SetMTUBytes(v29, v30);
}

- (void)didReceiveReportPacket:(tagRTCPPACKET *)a3 arrivalNTPTime:(tagNTP)a4
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCSessionParticipantLocal didReceiveReportPacket:arrivalNTPTime:]();
    }
  }
}

- (void)didReceiveCustomReportPacket:(tagRTCPPACKET *)a3 arrivalNTPTime:(tagNTP)a4
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCSessionParticipantLocal didReceiveCustomReportPacket:arrivalNTPTime:]();
    }
  }
}

- (void)streamGroup:(id)a3 didSuspendStreams:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint32_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL isMixingSystemAudio = self->_isMixingSystemAudio;
      *(_DWORD *)buf = 136316418;
      uint64_t v31 = v7;
      __int16 v32 = 2080;
      long long v33 = "-[VCSessionParticipantLocal streamGroup:didSuspendStreams:]";
      __int16 v34 = 1024;
      int v35 = 4134;
      __int16 v36 = 2112;
      id v37 = a3;
      __int16 v38 = 1024;
      BOOL v39 = v4;
      __int16 v40 = 1024;
      BOOL v41 = isMixingSystemAudio;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamGroup=%@ didSuspendStreams=%d isMixingSystemAudio=%d", buf, 0x32u);
    }
  }
  if (self->super._state == 1)
  {
    if ([a3 streamGroupID] == 1937339233 && self->super._screenEnabled)
    {
      BOOL v10 = objc_msgSend((id)objc_opt_class(), "mediaTypesFromStreamGroupID:", objc_msgSend(a3, "streamGroupID"));
      if ([v10 count] == 1)
      {
        int v11 = objc_msgSend((id)objc_msgSend(v10, "anyObject"), "unsignedIntValue");
        if (v4)
        {
          if (self->_isMixingSystemAudio) {
            return;
          }
          [(VCSessionParticipantLocal *)self startSystemAudioCapture];
          [(VCSessionParticipant *)self swapScreenStreamGroupSyncSourceWithState:2];
          uint64_t v24 = MEMORY[0x1E4F143A8];
          uint64_t v25 = 3221225472;
          BOOL v26 = __59__VCSessionParticipantLocal_streamGroup_didSuspendStreams___block_invoke;
          uint64_t v27 = &unk_1E6DB7C78;
          int v28 = self;
          LODWORD(v29) = v11;
          int v12 = &v24;
        }
        else
        {
          if (!self->_isMixingSystemAudio) {
            return;
          }
          [(VCSessionParticipantLocal *)self stopSystemAudioCapture];
          [(VCSessionParticipant *)self swapScreenStreamGroupSyncSourceWithState:1];
          uint64_t v18 = MEMORY[0x1E4F143A8];
          uint64_t v19 = 3221225472;
          uint64_t v20 = __59__VCSessionParticipantLocal_streamGroup_didSuspendStreams___block_invoke_2;
          __int16 v21 = &unk_1E6DB7C78;
          long long v22 = self;
          LODWORD(v23) = v11;
          int v12 = &v18;
        }
        -[VCSessionParticipant callDelegateWithBlock:](self, "callDelegateWithBlock:", v12, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29);
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        unsigned int v16 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          BOOL v17 = self->_isMixingSystemAudio;
          *(_DWORD *)buf = 136316418;
          uint64_t v31 = v15;
          __int16 v32 = 2080;
          long long v33 = "-[VCSessionParticipantLocal streamGroup:didSuspendStreams:]";
          __int16 v34 = 1024;
          int v35 = 4142;
          __int16 v36 = 2112;
          id v37 = a3;
          __int16 v38 = 1024;
          BOOL v39 = v4;
          __int16 v40 = 1024;
          BOOL v41 = v17;
          _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d Unexpected number of mediaTypes for streamGroup=%@ didSuspendStreams=%d isMixingSystemAudio=%d", buf, 0x32u);
        }
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    uint64_t v14 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v31 = v13;
      __int16 v32 = 2080;
      long long v33 = "-[VCSessionParticipantLocal streamGroup:didSuspendStreams:]";
      __int16 v34 = 1024;
      int v35 = 4136;
      _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Participant is not running, ignoring delegate callback.", buf, 0x1Cu);
    }
  }
}

uint64_t __59__VCSessionParticipantLocal_streamGroup_didSuspendStreams___block_invoke(uint64_t a1, void *a2)
{
  return [a2 vcSessionParticipant:*(void *)(a1 + 32) mediaStateDidChange:2 forMediaType:*(unsigned int *)(a1 + 40) didSucceed:1 error:0];
}

uint64_t __59__VCSessionParticipantLocal_streamGroup_didSuspendStreams___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 vcSessionParticipant:*(void *)(a1 + 32) mediaStateDidChange:1 forMediaType:*(unsigned int *)(a1 + 40) didSucceed:1 error:0];
}

- (void)streamGroup:(id)a3 didChangeState:(unsigned int)a4
{
  uplinkBandwidthAllocator = self->_uplinkBandwidthAllocator;
  uint64_t v6 = [a3 streamToken];

  [(VCSessionUplinkBandwidthAllocator *)uplinkBandwidthAllocator streamToken:v6 enabled:a4 == 1];
}

- (void)streamGroup:(id)a3 didRequestRedundancy:(BOOL)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__VCSessionParticipantLocal_streamGroup_didRequestRedundancy___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v6 = a4;
  dispatch_async(participantQueue, block);
}

unsigned char *__62__VCSessionParticipantLocal_streamGroup_didRequestRedundancy___block_invoke(uint64_t a1)
{
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (result[408])
  {
    [result enableRedundancy:*(unsigned __int8 *)(a1 + 40)];
    uint64_t v3 = *(unsigned int **)(a1 + 32);
    uint64_t v4 = v3[142];
    uint64_t v5 = v3[143];
    return (unsigned char *)[v3 dispatchedUpdateUplinkTargetBitrate:v4 rateChangeCounter:v5];
  }
  return result;
}

- (void)reportCameraCompositionEnabled:(BOOL)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = @"VCSPUUID";
  v5[0] = self->super._uuid;
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [(VCSessionParticipant *)self reportingAgent];
  reportingGenericEvent();
}

- (void)checkAndReportThermalIncreaseAudioOnly:(int)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__VCSessionParticipantLocal_checkAndReportThermalIncreaseAudioOnly___block_invoke;
  block[3] = &unk_1E6DB3F08;
  block[4] = self;
  int v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __68__VCSessionParticipantLocal_checkAndReportThermalIncreaseAudioOnly___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) dispatchedIsAnyCameraMediaTypeEnabled];
  if ((result & 1) == 0)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 1064);
    uint64_t result = [v3 countByEnumeratingWithState:&v10 objects:v9 count:16];
    if (result)
    {
      uint64_t v4 = result;
      uint64_t v5 = *(void *)v11;
LABEL_5:
      uint64_t v6 = 0;
      while (1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t result = [*(id *)(*((void *)&v10 + 1) + 8 * v6) isAnyCameraMediaTypeEnabled];
        if (result) {
          break;
        }
        if (v4 == ++v6)
        {
          uint64_t result = [v3 countByEnumeratingWithState:&v10 objects:v9 count:16];
          uint64_t v4 = result;
          if (result) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      if (*(_DWORD *)(a1 + 40))
      {
        uint64_t v8 = [NSNumber numberWithUnsignedInt:@"SymptomReporterOptionalKeyThermalPressureLevel"];
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
        [*(id *)(a1 + 32) reportingAgent];
        return reportingSymptom();
      }
    }
  }
  return result;
}

- (id)qualityTierTableForStreamToken:(int64_t)a3
{
  uint64_t v4 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._streamGroups, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", a3)), "streamGroupID");
  if (self->_remotePresentationState) {
    BOOL isRemotePresentationLarge = 0;
  }
  else {
    BOOL isRemotePresentationLarge = self->_isRemotePresentationLarge;
  }
  BOOL enableRedundancy = self->_enableRedundancy;

  return +[VCSessionMediaStreamPresenceConfigurationProvider oneToOneTierTableForStreamGroupID:v4 splitType:isRemotePresentationLarge redundancyEnabled:enableRedundancy];
}

- (BOOL)shouldCapStream:(int64_t)a3 cappedBitrate:(unsigned int *)a4
{
  int v6 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._streamGroups, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", a3)), "streamGroupID");
  if (self->_remotePresentationState) {
    BOOL v7 = v6 == 1667329381;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    if (a4)
    {
      unsigned int v10 = 432400;
LABEL_14:
      *a4 = v10;
    }
  }
  else
  {
    if (!self->super._sharingEnabled || v6 != 1835623282) {
      return 0;
    }
    if (a4)
    {
      unsigned int v10 = 130000;
      goto LABEL_14;
    }
  }
  return 1;
}

- (unsigned)remainderBitrateSplitForStreamToken:(int64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._participantQueue);
  uint64_t v5 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._streamGroups, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", a3)), "streamGroupID");
  if (self->_remotePresentationState) {
    BOOL isRemotePresentationLarge = 0;
  }
  else {
    BOOL isRemotePresentationLarge = self->_isRemotePresentationLarge;
  }

  return +[VCSessionMediaStreamPresenceConfigurationProvider remainingBitrateSplitQualityIndexForStreamGroup:v5 splitType:isRemotePresentationLarge];
}

- (id)microphoneOnlyBandwidthTable
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._participantQueue);
  if ([(VCSessionParticipant *)self supportsLowLatencyAudio])
  {
    return (id)VCSessionLowLatencyMicrophoneOnlyBandwidthTable();
  }
  else
  {
    return (id)VCSessionMicrophoneOnlyBandwidthTable();
  }
}

- (id)videoCallMicrophoneBandwidthTable
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._participantQueue);
  if ([(VCSessionParticipant *)self supportsLowLatencyAudio])
  {
    return (id)VCSessionLowLatencyVideoCallMicrophoneBandwidthTable();
  }
  else
  {
    return (id)VCSessionVideoCallMicrophoneBandwidthTable();
  }
}

- (BOOL)encryptionInfoReceived
{
  return self->_encryptionInfoReceived;
}

- (unsigned)connectionStatsStreamID
{
  return self->_connectionStatsStreamID;
}

- (unsigned)uplinkBitrateCapWifi
{
  return self->_uplinkBitrateCapWifi;
}

- (unsigned)uplinkBitrateCapCell
{
  return self->_uplinkBitrateCapCell;
}

- (BOOL)enableVADFiltering
{
  return self->_enableVADFiltering;
}

- (NSArray)peerSubscribedStreams
{
  return self->_peerSubscribedStreams;
}

- (NSSet)audioPayloadTypes
{
  return &self->_audioPayloadTypes->super;
}

- (NSSet)videoPayloadTypes
{
  return &self->_videoPayloadTypes->super;
}

- (_VCSessionParticipantLocalOneToOneSettings)oneToOneSettings
{
  long long v3 = *(_OWORD *)&self[20].audioRedundancyController;
  *(_OWORD *)&retstr->audioRedundancyController = *(_OWORD *)&self[19].targetBitrate;
  *(_OWORD *)&retstr->streamInfo = v3;
  *(_OWORD *)&retstr->targetBitrate = *(_OWORD *)&self[20].streamInfo;
  return self;
}

- (BOOL)isRemoteOnPeace
{
  return self->_isRemoteOnPeace;
}

- (void)setIsRemoteOnPeace:(BOOL)a3
{
  self->_isRemoteOnPeace = a3;
}

- (BOOL)isRetransmissionEnabled
{
  return self->_isRetransmissionEnabled;
}

- (NSArray)remoteParticipants
{
  return self->_remoteParticipants;
}

uint64_t __VCSessionParticipantLocal_UpdateAudioPriorityWithSampleBuffer_block_invoke(uint64_t a1, void *a2)
{
  return [a2 vcSessionParticipant:*(void *)(a1 + 32) didChangeMediaPriority:*(unsigned __int8 *)(a1 + 40) description:@"MediaTypeAudio"];
}

- (void)initWithConfig:delegate:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate generated stream ID set", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:delegate:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate generated SSRC set", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:delegate:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate power spectrum source", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:delegate:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate oneToOne streamInfo dictionary", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:delegate:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create uplinkBandwidthAllocators", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:delegate:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate config provider", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:delegate:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create participant info", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:delegate:.cold.8()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to initialize media negotiator", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:delegate:.cold.9()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to setup the stream groups", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:delegate:.cold.10()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to setup the stream inputs", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:delegate:.cold.11()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate config provider", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:delegate:.cold.12()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to setup the stream groups", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:delegate:.cold.13()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to setup the stream inputs", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:delegate:.cold.14()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate config provider", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:delegate:.cold.15()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to setup video stream", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:delegate:.cold.16()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to setup audio streams", v2, v3, v4, v5, v6);
}

- (void)newUplinkBandwidthAllocators
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create VCSessionUplinkBandwidthAllocatorOneToOne", v2, v3, v4, v5, v6);
}

- (void)processCachedParticipantData:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to unserialize the participant info", v2, v3, v4, v5, v6);
}

- (void)processCachedParticipantData:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Media blob not found in participant info", v2, v3, v4, v5, v6);
}

- (void)processCachedParticipantData:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the negotiation local configuration", v2, v3, v4, v5, v6);
}

- (void)processCachedParticipantData:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to initialize the negotiation local configuration", v2, v3, v4, v5, v6);
}

- (void)setupAudioStreamGroupWithStreamConfigs:negotiatorConfig:streamGroupConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to setup audio streams", v2, v3, v4, v5, v6);
}

- (void)setupCameraStreamGroupWithStreamConfigs:negotiatorConfig:streamGroupConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d No video streams to set up", v2, v3, v4, v5, v6);
}

- (void)setupCameraStreamGroupWithStreamConfigs:negotiatorConfig:streamGroupConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to setup video stream", v2, v3, v4, v5, v6);
}

- (void)captureSourceIDFromStreamGroupConfig:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Stream group ID missing in stream group config", v2, v3, v4, v5, v6);
}

- (void)captureSourceIDFromStreamGroupConfig:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Stream input ID missing in stream group config", v2, v3, v4, v5, v6);
}

- (void)captureSourceIDFromStreamGroupConfig:(uint64_t)a1 .cold.3(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315906;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_5_1();
  uint64_t v4 = "-[VCSessionParticipantLocal captureSourceIDFromStreamGroupConfig:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_7_3(&dword_1E1EA4000, v1, (uint64_t)v1, " [%s] %s:%d Unknown stream input ID=%@", (uint8_t *)&v2);
}

- (void)setupStreamGroupWithStreamGroupConfig:negotiatorConfig:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to setup stream", v2, v3, v4, v5, v6);
}

- (void)setupStreamGroupWithStreamGroupConfig:(uint64_t)a1 negotiatorConfig:.cold.2(uint64_t a1)
{
  *(_DWORD *)uint64_t v3 = 136315906;
  *(void *)&v3[4] = a1;
  OUTLINED_FUNCTION_5_1();
  *(void *)&v3[14] = "-[VCSessionParticipantLocal setupStreamGroupWithStreamGroupConfig:negotiatorConfig:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Stream token already assigned for captureSourceID=%d", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[VCSessionParticipantLocal setupStreamGroupWithStreamGroupConfig:negotiatorConfig:]" >> 16, v4);
}

- (void)setupStreamGroupsWithConfig:negotiatorConfig:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d setupStreamGroupMediaSync failed", v2, v3, v4, v5, v6);
}

- (void)setupStreamGroupsWithConfig:(uint64_t)a1 negotiatorConfig:.cold.2(uint64_t a1)
{
  *(_DWORD *)uint64_t v3 = 136315906;
  *(void *)&v3[4] = a1;
  OUTLINED_FUNCTION_5_1();
  *(void *)&v3[14] = "-[VCSessionParticipantLocal setupStreamGroupsWithConfig:negotiatorConfig:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Failed to register stream group for capture source ID=%d", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[VCSessionParticipantLocal setupStreamGroupsWithConfig:negotiatorConfig:]" >> 16, v4);
}

- (void)setupStreamInputsWithConfig:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate registered stream group configuration set", v2, v3, v4, v5, v6);
}

- (void)setupStreamInputsWithConfig:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate registered stream input set", v2, v3, v4, v5, v6);
}

- (void)maxCaptureCameraFrameRate
{
  *(_DWORD *)uint64_t v3 = 136315906;
  *(void *)&v3[4] = a1;
  OUTLINED_FUNCTION_5_1();
  *(void *)&v3[14] = "-[VCSessionParticipantLocal maxCaptureCameraFrameRate]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d maxFrameRate=%d", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[VCSessionParticipantLocal maxCaptureCameraFrameRate]" >> 16, v4);
}

- (void)reconfigureOneToOneAudioStream:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d OneToOne Audio Stream was unable to be reconfigured", v2, v3, v4, v5, v6);
}

- (void)applyVideoEnabledSetting:.cold.1()
{
  int v2 = 136315906;
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to update camera stream group with videoEnabled=%d", v2, v3, v4, v5);
}

void __63__VCSessionParticipantLocal_suspendStreamsOnOneToOneModeSwitch__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315906;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_5_1();
  int v4 = "-[VCSessionParticipantLocal suspendStreamsOnOneToOneModeSwitch]_block_invoke";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_7_3(&dword_1E1EA4000, v1, (uint64_t)v1, " [%s] %s:%d Failed to stop Multiway streams. error=%@", (uint8_t *)&v2);
}

void __51__VCSessionParticipantLocal_setRemoteParticipants___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315906;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_5_1();
  int v4 = "-[VCSessionParticipantLocal setRemoteParticipants:]_block_invoke";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_7_3(&dword_1E1EA4000, v1, (uint64_t)v1, " [%s] %s:%d updateStreamGroups failed with error=%@", (uint8_t *)&v2);
}

- (void)applyCachedMediaStreamsWithStreamConfigurations:mediaNegotiatorConfig:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unable to apply the cached configuration", v2, v3, v4, v5, v6);
}

- (void)setupAudioStreamsWithStreamConfigurations:mediaNegotiatorConfig:streamGroupConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d streamConfigurations cannot be nil!", v2, v3, v4, v5, v6);
}

- (void)setupAudioStreamsWithStreamConfigurations:mediaNegotiatorConfig:streamGroupConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unable to apply the cached configuration", v2, v3, v4, v5, v6);
}

- (void)newVideoSendGroupConfigWithStreamGroupID:streamGroupConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate stream group", v2, v3, v4, v5, v6);
}

- (void)newAudioSendGroupConfigWithStreamGroupID:streamGroupConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate stream group", v2, v3, v4, v5, v6);
}

- (void)setupVideoStreamsWithStreamConfiguration:streamGroupConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate stream group", v2, v3, v4, v5, v6);
}

- (void)setupVideoStreamsWithStreamConfiguration:streamGroupConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to initalize video stream group", v2, v3, v4, v5, v6);
}

- (void)setupCaptionsStreamsWithStreamConfiguration:streamGroupConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate stream group", v2, v3, v4, v5, v6);
}

- (void)setupCaptionsStreamsWithStreamConfiguration:streamGroupConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to initalize video stream group", v2, v3, v4, v5, v6);
}

- (void)setupVideoMediaStreamsWithStreamGroupConfiguration:(uint64_t)a1 streamGroupConfig:streamGroupID:mediaType:.cold.1(uint64_t a1)
{
  *(_DWORD *)uint64_t v3 = 136315906;
  *(void *)&v3[4] = a1;
  OUTLINED_FUNCTION_5_1();
  *(void *)&v3[14] = "-[VCSessionParticipantLocal setupVideoMediaStreamsWithStreamGroupConfiguration:streamGroupConfig:"
                       "streamGroupID:mediaType:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Failed to set up video stream %d", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[VCSessionParticipantLocal setupVideoMediaStreamsWithStreamGroupConfiguration:streamGroupConfig:streamGroupID:mediaType:]" >> 16, v4);
}

- (void)setupVideoMediaStreamsWithStreamGroupConfiguration:streamGroupConfig:streamGroupID:mediaType:.cold.2()
{
  OUTLINED_FUNCTION_11_0();
  [v0 idsStreamID];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_8_5(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Base temporal layer hasn't been configured for streamID=%d", v3, v4, v5, v6, v7);
}

- (void)setupVideoMediaStreamsWithStreamGroupConfiguration:streamGroupConfig:streamGroupID:mediaType:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Stream setup failed", v2, v3, v4, v5, v6);
}

- (void)setupAudioStreamsWithStreamConfiguration:streamGroupConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate audio stream group config", v2, v3, v4, v5, v6);
}

- (void)setupAudioStreamsWithStreamConfiguration:(uint64_t)a1 streamGroupConfiguration:.cold.2(uint64_t a1)
{
  *(_DWORD *)uint64_t v3 = 136315906;
  *(void *)&v3[4] = a1;
  OUTLINED_FUNCTION_5_1();
  *(void *)&v3[14] = "-[VCSessionParticipantLocal setupAudioStreamsWithStreamConfiguration:streamGroupConfiguration:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Failed to set up audio stream %d", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[VCSessionParticipantLocal setupAudioStreamsWithStreamConfiguration:streamGroupConfiguration:]" >> 16, v4);
}

- (void)setupAudioStreamsWithStreamConfiguration:streamGroupConfiguration:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to initalize audio stream group", v2, v3, v4, v5, v6);
}

- (void)newStreamInfoWithVideoStreamWithConfiguration:streamGroupID:rtpCipherSuite:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_14_1(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Failed to setup video stream for streamGroupId=%s", v3, v4, v5, v6, v7);
}

- (void)newStreamInfoWithVideoStreamWithConfiguration:streamGroupID:rtpCipherSuite:.cold.2()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_14_1(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Stream setup failed for streamGroupId=%s", v3, v4, v5, v6, v7);
}

- (void)newStreamInfoWithAudioStreamWithConfiguration:streamToken:isMultiway:streamGroupID:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to setup audio stream", v2, v3, v4, v5, v6);
}

- (void)newStreamInfoWithAudioStreamWithConfiguration:streamToken:isMultiway:streamGroupID:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Stream setup failed", v2, v3, v4, v5, v6);
}

- (void)newMediaNegotiatorAudioConfigurationForMediaType:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  VCSessionMediaType_Name(v0);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Audio configuration for media negotiator not supported for mediaType=%@", v3, v4, v5, v6, v7);
}

- (void)newMediaNegotiatorAudioConfigurationForMediaType:.cold.2()
{
  OUTLINED_FUNCTION_11_0();
  VCSessionMediaType_Name(v0);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Failed to create audio configuration for media negotiator for mediaType=%@", v3, v4, v5, v6, v7);
}

- (void)featureListStringsRequiredForMediaType:(uint64_t)a1 .cold.1(uint64_t a1)
{
  *(_DWORD *)uint64_t v3 = 136315906;
  *(void *)&v3[4] = a1;
  OUTLINED_FUNCTION_5_1();
  *(void *)&v3[14] = "-[VCSessionParticipantLocal featureListStringsRequiredForMediaType:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Unexpected mediaType=%hhu", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[VCSessionParticipantLocal featureListStringsRequiredForMediaType:]" >> 16, v4);
}

- (void)v1FeatureListStringsSupportedForMediaType:(uint64_t)a1 .cold.1(uint64_t a1)
{
  *(_DWORD *)uint64_t v3 = 136315906;
  *(void *)&v3[4] = a1;
  OUTLINED_FUNCTION_5_1();
  *(void *)&v3[14] = "-[VCSessionParticipantLocal v1FeatureListStringsSupportedForMediaType:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Unexpected mediaType=%hhu", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[VCSessionParticipantLocal v1FeatureListStringsSupportedForMediaType:]" >> 16, v4);
}

- (void)u1VideoRuleCollectionsForMediaType:(uint64_t)a1 .cold.1(uint64_t a1)
{
  *(_DWORD *)uint64_t v3 = 136315906;
  *(void *)&v3[4] = a1;
  OUTLINED_FUNCTION_5_1();
  *(void *)&v3[14] = "-[VCSessionParticipantLocal u1VideoRuleCollectionsForMediaType:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Unexpected mediaType=%hhu", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[VCSessionParticipantLocal u1VideoRuleCollectionsForMediaType:]" >> 16, v4);
}

- (void)addFeatureListStringsForVideoConfiguration:mediaType:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the fixed position feature list strings", v2, v3, v4, v5, v6);
}

- (void)addFeatureListStringsForVideoConfiguration:mediaType:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the feature list strings", v2, v3, v4, v5, v6);
}

- (void)newVideoConfigurationForMediaType:.cold.1()
{
  int v2 = 136315906;
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate videoConfiguration for mediaType=%hhu", v2, v3, v4, v5);
}

- (void)newVideoConfigurationForMediaType:.cold.2()
{
  int v2 = 136315906;
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to add FLS settings for mediaType=%hhu", v2, v3, v4, v5);
}

+ (void)negotiatorCipherSuite:fromMediaStreamConfig:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  [v0 SRTPCipherSuite];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Failed to convert mediaStreamConfig cipherSuite(%ld) to negotiatorStreamGroupConfig cipherSuite", v3, v4, v5, v6, v7);
}

- (void)newStreamGroupNegotiationConfigForStreamGroup:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate media blob stream group config", v2, v3, v4, v5, v6);
}

- (void)newStreamGroupNegotiationConfigForStreamGroup:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate media blob stream group stream config", v2, v3, v4, v5, v6);
}

- (void)newStreamGroupNegotiationConfigForStreamGroup:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate media blob stream group codec config", v2, v3, v4, v5, v6);
}

- (void)newStreamGroupNegotiationConfigForStreamGroup:.cold.4()
{
  OUTLINED_FUNCTION_11_0();
  [v0 count];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Invalid rtpPayload for video, rtpPayload size: %lu", v3, v4, v5, v6, v7);
}

- (void)newStreamGroupNegotiationConfigForStreamGroup:.cold.5()
{
  OUTLINED_FUNCTION_11_0();
  [v0 count];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Invalid payload for video, payload size: %lu", v3, v4, v5, v6, v7);
}

- (void)newStreamGroupNegotiationConfigForStreamGroup:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate media blob stream group codec config", v2, v3, v4, v5, v6);
}

- (void)newStreamGroupNegotiationConfigForStreamGroup:.cold.7()
{
  OUTLINED_FUNCTION_11_0();
  int v1 = OUTLINED_FUNCTION_16_2(v0, *MEMORY[0x1E4F143B8]);
  FourccToCStr(v1);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v2, v3, " [%s] %s:%d Failed to retrieve the cipher suite for stream. streamGroupID=%s", v4, v5, v6, v7, v8);
}

- (void)initializeStreamGroupsForLocalConfig:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  int v1 = OUTLINED_FUNCTION_16_2(v0, *MEMORY[0x1E4F143B8]);
  FourccToCStr(v1);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v2, v3, " [%s] %s:%d Failed to create U1 stream group negotiation config for groupID=%s", v4, v5, v6, v7, v8);
}

- (void)initializeOneToOneStreamGroup:forLocalConfig:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create new stream group negotiation config", v2, v3, v4, v5, v6);
}

- (void)initializeOneToOneStreamGroup:forLocalConfig:.cold.2()
{
  OUTLINED_FUNCTION_11_0();
  FourccToCStr([v0 groupID]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Failed to create stream group U1 config for groupID=%s", v3, v4, v5, v6, v7);
}

- (void)addVideoConfigurationsToLocalConfiguration:(uint64_t)a1 .cold.1(uint64_t a1)
{
  *(_DWORD *)uint64_t v3 = 136315906;
  *(void *)&v3[4] = a1;
  OUTLINED_FUNCTION_5_1();
  *(void *)&v3[14] = "-[VCSessionParticipantLocal addVideoConfigurationsToLocalConfiguration:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Failed to create videoConfiguration for mediaType=%hhu", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[VCSessionParticipantLocal addVideoConfigurationsToLocalConfiguration:]" >> 16, v4);
}

- (void)addMediaConfigurationsToLocalConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create microphoneConfiguration", v2, v3, v4, v5, v6);
}

- (void)addMediaConfigurationsToLocalConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create systemAudioConfiguration", v2, v3, v4, v5, v6);
}

- (void)addMediaConfigurationsToLocalConfiguration:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to add U+1 video configurations to local settings", v2, v3, v4, v5, v6);
}

- (void)initializeMediaNegotiator
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to initialize stream groups for local configuration", v2, v3, v4, v5, v6);
}

- (void)negotiateOneToOne:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to copy the local configuration", v2, v3, v4, v5, v6);
}

- (void)negotiateOneToOne:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to reinitialize the 1:1 media negotiator", v2, v3, v4, v5, v6);
}

- (void)negotiateOneToOne:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to extract media blob from remote participant info", v2, v3, v4, v5, v6);
}

- (void)negotiateOneToOne:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to negotiate with devices that does not support one to one", v2, v3, v4, v5, v6);
}

- (void)negotiateOneToOne:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to negotiate one to one settings with remote media blob", v2, v3, v4, v5, v6);
}

- (void)setupOneToOneVideoStreamWithConfig:streamGroupID:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_14_1(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Error setting up the config for one-to-one mode for streamGroupId=%s", v3, v4, v5, v6, v7);
}

- (void)setupOneToOneVideoStreamWithConfig:streamGroupID:.cold.2()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_14_1(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Failed to set up video stream for streamGroupId=%s", v3, v4, v5, v6, v7);
}

- (void)setupOneToOneVideoStreamWithConfig:streamGroupID:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate audio stream group config", v2, v3, v4, v5, v6);
}

- (void)setupOneToOneAudioStreamWithConfig:streamGroupID:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_14_1(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Error setting up the audio config for one-to-one mode for streamGroupId=%s", v3, v4, v5, v6, v7);
}

- (void)setupOneToOneAudioStreamWithConfig:streamGroupID:.cold.2()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_14_1(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Error setting up the audio stream for one-to-one mode for streamGroupId=%s", v3, v4, v5, v6, v7);
}

- (void)setupOneToOneAudioStreamWithConfig:streamGroupID:.cold.3()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_14_1(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Failed to allocate audio stream group config for streamGroupId=%s", v3, v4, v5, v6, v7);
}

- (void)configureMultiwayStreamGroups
{
  OUTLINED_FUNCTION_11_0();
  int v1 = OUTLINED_FUNCTION_16_2(v0, *MEMORY[0x1E4F143B8]);
  FourccToCStr(v1);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v2, v3, " [%s] %s:%d Error configuring stream infos for streamGroupID=%s", v4, v5, v6, v7, v8);
}

void __94__VCSessionParticipantLocal_configureWithOneToOneParticipantConfig_shouldConfigureGFTStreams___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Fail configure participant", v2, v3, v4, v5, v6);
}

void __94__VCSessionParticipantLocal_configureWithOneToOneParticipantConfig_shouldConfigureGFTStreams___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Fail configure participant", v2, v3, v4, v5, v6);
}

- (void)configureOneToOneVideoStreamsWithDeviceRole:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  int v1 = OUTLINED_FUNCTION_16_2(v0, *MEMORY[0x1E4F143B8]);
  FourccToCStr(v1);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v2, v3, " [%s] %s:%d U+1 config for StreamGroupID=%s not set", v4, v5, v6, v7, v8);
}

- (void)configureOneToOneVideoStreamsWithDeviceRole:.cold.2()
{
  OUTLINED_FUNCTION_11_0();
  int v1 = OUTLINED_FUNCTION_16_2(v0, *MEMORY[0x1E4F143B8]);
  FourccToCStr(v1);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v2, v3, " [%s] %s:%d Failed to update config for StreamGroupID=%s", v4, v5, v6, v7, v8);
}

- (void)configureOneToOneVideoStreamsWithDeviceRole:.cold.3()
{
  OUTLINED_FUNCTION_11_0();
  int v1 = OUTLINED_FUNCTION_16_2(v0, *MEMORY[0x1E4F143B8]);
  FourccToCStr(v1);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v2, v3, " [%s] %s:%d Failed to configure one to one video streams StreamGroupID=%s", v4, v5, v6, v7, v8);
}

- (void)configureOneToOneAudioStreamsWithDeviceRole:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_16_2(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_8_5(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Failed to update config for StreamGroupID=%u", v3, v4, v5, v6, v7);
}

- (void)configureOneToOneAudioStreamsWithDeviceRole:.cold.2()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_16_2(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_8_5(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Failed to configure one to one audio streams StreamGroupID=%u", v3, v4, v5, v6, v7);
}

- (void)newAudioStreamOneToOneConfigurationWithStreamGroupId:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_14_1(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Failed to create one to one audio stream config for streamGroupId=%s", v3, v4, v5, v6, v7);
}

- (void)newVideoStreamOneToOneConfigurationWithStreamGroupId:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create one to one video stream config", v2, v3, v4, v5, v6);
}

- (void)createParticipantInfo
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create new invite blob", v2, v3, v4, v5, v6);
}

- (void)newStreamInfoWithVideoStreamWithConfiguration:idsDestination:groupID:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_14_1(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Video stream config is missing for streamGroupID=%s!", v3, v4, v5, v6, v7);
}

- (void)newStreamInfoWithVideoStreamWithConfiguration:idsDestination:groupID:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate video stream!", v2, v3, v4, v5, v6);
}

- (void)newStreamInfoWithVideoStreamWithConfiguration:idsDestination:groupID:.cold.3()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_14_1(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d invalid capabilies dictionary for streamGroupID=%s!", v3, v4, v5, v6, v7);
}

- (void)newStreamInfoWithVideoStreamWithConfiguration:idsDestination:groupID:.cold.4()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_14_1(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Failed to allocate participant video stream info for streamGroupID=%s", v3, v4, v5, v6, v7);
}

- (void)newStreamInfoWithAudioStreamWithConfiguration:idsDestination:isMultiway:streamGroupID:streamToken:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Audio stream config is missing!", v2, v3, v4, v5, v6);
}

- (void)newStreamInfoWithAudioStreamWithConfiguration:idsDestination:isMultiway:streamGroupID:streamToken:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate audio stream!", v2, v3, v4, v5, v6);
}

- (void)newStreamInfoWithAudioStreamWithConfiguration:idsDestination:isMultiway:streamGroupID:streamToken:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d invalid capabilies dictionary!", v2, v3, v4, v5, v6);
}

- (void)newStreamInfoWithAudioStreamWithConfiguration:idsDestination:isMultiway:streamGroupID:streamToken:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate participant audio stream info", v2, v3, v4, v5, v6);
}

- (void)newStreamInfoWithAudioStreamWithConfiguration:idsDestination:isMultiway:streamGroupID:streamToken:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to initialize audio rule collection!", v2, v3, v4, v5, v6);
}

- (void)checkSubscribedStreamsConsistency:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315906;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_5_1();
  uint64_t v4 = "-[VCSessionParticipantLocal checkSubscribedStreamsConsistency:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_7_3(&dword_1E1EA4000, v1, (uint64_t)v1, " [%s] %s:%d MEDIA FRACTURE SITUATION! peer asking for unknown stream:%@", (uint8_t *)&v2);
}

- (void)dispatchedUpdateVCMediaQueueSize:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCMediaQueue size should only be updated when participant is running", v2, v3, v4, v5, v6);
}

- (void)cameraAvailabilityDidChange:.cold.1()
{
  int v2 = 136315906;
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_0(&dword_1E1EA4000, v0, v1, " [%s] %s:%d cameraAvailabilityDidChange=%d ignored", v2, v3, v4, v5);
}

- (void)didReceiveReportPacket:arrivalNTPTime:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d This should no longer get called, VCSessionParticipantLocal is no longer managing U+1 streams", v2, v3, v4, v5, v6);
}

- (void)didReceiveCustomReportPacket:arrivalNTPTime:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d This should no longer get called, VCSessionParticipantLocal is no longer managing U+1 streams", v2, v3, v4, v5, v6);
}

@end