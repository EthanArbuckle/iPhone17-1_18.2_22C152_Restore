@interface VCSessionParticipantRemote
+ (BOOL)isDeviceLargeScreen;
+ (unsigned)maxAudioNetworkBitrateForLocalInterfaceOnWiFi:(BOOL)a3 isLowLatencyAudio:(BOOL)a4;
+ (unsigned)maxBdatQualityIndexForVideoQuality:(unsigned __int8)a3 isLocalOnWiFi:(BOOL)a4;
+ (unsigned)maxCameraQualityIndexForVideoQuality:(unsigned __int8)a3 isLocalOnWiFi:(BOOL)a4 isRedundancyRequested:(BOOL)a5 isSharingEnabled:(BOOL)a6 enableNewTier:(BOOL)a7;
+ (unsigned)maxCameraQualityIndexForVideoQuality:(unsigned __int8)a3 useWiFiTable:(BOOL)a4 isSharingEnabled:(BOOL)a5 enableNewTier:(BOOL)a6;
+ (unsigned)maxCameraQualityIndexWithRedundancyForVideoQuality:(unsigned __int8)a3 useWiFiTable:(BOOL)a4 enableNewTier:(BOOL)a5;
+ (unsigned)maxFdatQualityIndexForVideoQuality:(unsigned __int8)a3 isLocalOnWiFi:(BOOL)a4;
+ (unsigned)maxFtxtQualityIndexForVideoQuality:(unsigned __int8)a3 isLocalOnWiFi:(BOOL)a4 isRedundancyRequested:(BOOL)a5 isSharingEnabled:(BOOL)a6;
+ (unsigned)maxQualityIndexForStreamGroupID:(unsigned int)a3 videoQuality:(unsigned __int8)a4 isLocalOnWiFi:(BOOL)a5 isRedundancyRequested:(BOOL)a6 isSharingEnabled:(BOOL)a7 enableNewTier:(BOOL)a8;
+ (unsigned)maxWebRTCCameraQualityIndexForVideoQuality:(unsigned __int8)a3 isLocalOnWiFi:(BOOL)a4 isSharingEnabled:(BOOL)a5 enableNewTier:(BOOL)a6;
- (BOOL)addOneToOneStreamConfigToMediaStreamInfo:(id)a3 negotiatorStreamGroupConfig:(id)a4;
- (BOOL)configureAudioIOWithDeviceRole:(int)a3 operatingMode:(int)a4;
- (BOOL)configureWithOneToOneParticipantConfig:(id)a3 operatingMode:(int)a4;
- (BOOL)enableMaxCameraBitrateVideoQualityNewTier;
- (BOOL)isActiveMediaType:(unsigned int)a3;
- (BOOL)isAudioActive;
- (BOOL)isEnabledMediaType:(unsigned int)a3;
- (BOOL)isInCanvas;
- (BOOL)isParticipantDawnburstOrLater;
- (BOOL)isParticipantIDBasedKeyLookupEnabled;
- (BOOL)isParticipantPeace:(id)a3;
- (BOOL)isRemoteAudioEnabled;
- (BOOL)isRemoteAudioPaused;
- (BOOL)isRemoteScreenEnabled;
- (BOOL)isRemoteVideoEnabled;
- (BOOL)isRemoteVideoPaused;
- (BOOL)isScreenActive;
- (BOOL)isScreenControlEnabled;
- (BOOL)isSeamlessTransitionSupportedForStreamGroup:(id)a3;
- (BOOL)isServerRTxEnabled;
- (BOOL)isStreamGroupActive:(id)a3;
- (BOOL)isVideoExpected;
- (BOOL)isVisible;
- (BOOL)processParticipantInfo;
- (BOOL)setShouldEnableMLEnhance:(BOOL)a3 streamWithVideoResolution:(int64_t)a4 videoStreamGroup:(id)a5;
- (BOOL)setupAudioStreamConfiguration:(id)a3 withStreamGroupConfig:(id)a4 streamGroupStreamConfig:(id)a5;
- (BOOL)setupBandwidthAllocationTableForMediaStreamConfigs:(id)a3 streamGroupID:(unsigned int)a4 entryType:(unsigned __int8)a5;
- (BOOL)setupStreamConfigWithCodecs:(id)a3 streamConfig:(id)a4 codecConfigs:(id)a5 featureStringsDict:(id)a6;
- (BOOL)setupStreamGroupWithConfig:(id)a3;
- (BOOL)setupStreamGroups;
- (BOOL)setupVideoStreamConfiguration:(id)a3 withStreamGroupStreamConfig:(id)a4 codecConfigs:(id)a5 multiwayConfig:(id)a6 groupID:(unsigned int)a7;
- (BOOL)shouldDisableMLEnhanceCommonFactors;
- (BOOL)shouldEnableMLEnhanceHighTier;
- (BOOL)shouldEnableMLEnhanceLowTier;
- (BOOL)shouldEnableMLEnhanceMiddleTier;
- (BOOL)shouldEnableMLEnhanceOneToOne;
- (BOOL)shouldEnablePacketRetransmissionForStreamGroupID:(unsigned int)a3;
- (BOOL)shouldSetupStreamGroupWithID:(unsigned int)a3;
- (BOOL)supportsGFTSwitchToOneToOne;
- (BOOL)supportsIDSParticipantIDBasedKeyIndexMatching;
- (BOOL)supportsNegotiatedCoordinateSystem;
- (NSArray)mediaEntries;
- (NSDictionary)participantSpatialAudioSourceIDs;
- (NSNumber)optedInAudioStreamID;
- (NSNumber)optedInVideoStreamID;
- (VCPositionalInfo)positionalInfo;
- (VCSessionParticipantMediaStreamInfo)cameraStreamInfo;
- (VCSessionParticipantMediaStreamInfo)micStreamInfo;
- (VCSessionParticipantMediaStreamInfo)screenStreamInfo;
- (VCSessionParticipantRemote)initWithConfig:(id)a3 delegate:(id)a4;
- (_VCSessionParticipantCapabilities)capabilities;
- (id)activeDownlinkStreamIDForStreamGroupID:(unsigned int)a3;
- (id)applyVideoEnabledSetting:(BOOL)a3;
- (id)audioGroup;
- (id)checkSubstreams:(id)a3 forLowerQualityIndex:(unsigned int)a4;
- (id)entryForStreamID:(id)a3;
- (id)getAudioDumpName;
- (id)getMajorVersionNumber;
- (id)newCaptionsStreamGroupWithStreamGroupConfig:(id)a3;
- (id)newMediaStreamConfigWithStreamConfig:(id)a3 streamGroupConfig:(id)a4 maxIDSStreamIDCount:(unsigned int)a5;
- (id)newMediaStreamConfigWithStreamGroupConfig:(id)a3 streamConfig:(id)a4 rateControlConfig:(id)a5 multiwayConfig:(id)a6;
- (id)newMediaStreamInfoWithNegotiationConfig:(id)a3 streamToken:(int64_t)a4;
- (id)newMediaStreamWithNegotiationConfig:(id)a3 streamToken:(int64_t)a4;
- (id)newMultiwayConfigWithStreamGroupStreamConfig:(id)a3 maxIDSStreamIDCount:(unsigned int)a4 groupID:(unsigned int)a5;
- (id)newStreamGroupConfigWithNegotiationConfig:(id)a3;
- (id)newSupportedRemoteMediaTypeStatesDict:(id)a3;
- (id)newVideoStreamGroupWithStreamGroupConfig:(id)a3;
- (id)optedInStreamIDForStreamGroupID:(unsigned int)a3;
- (id)recommendedStreamIDsForSelectedMediaEntries:(id)a3 forceSeamlessTransition:(BOOL)a4;
- (id)screenGroup;
- (id)setupStreamRTP:(id)a3;
- (id)startAudioIO;
- (id)startScreenGroup;
- (id)stopAudioStreams;
- (id)systemAudioStreamInfo;
- (id)updateActiveStateForStreamGroup:(id)a3;
- (id)updateMediaState:(unsigned int)a3 forStreamGroup:(id)a4;
- (id)videoGroup;
- (int)reportingResolutionForResolution:(int64_t)a3;
- (int)setupSpatialAudioWithMetadata:(void *)a3 spatialMetadataEntryMap:(__CFDictionary *)a4;
- (int)setupSpatialInfoForStreamGroupConfig:(id)a3;
- (int)spatialChannelIndex:(unsigned int *)a3 spatialAudioSourceID:(unint64_t *)a4 forMediaType:(unsigned int)a5;
- (int)storeSpatialAudioMetadataEntry:(void *)a3 forMediaType:(unsigned int)a4;
- (int64_t)participantMicrophoneToken;
- (int64_t)participantScreenToken;
- (unsigned)actualNetworkBitrateForStreamGroup:(unsigned int)a3;
- (unsigned)actualNetworkBitrateWithAudioBitrates:(id)a3;
- (unsigned)cappedVideoQualityWithShouldLimitCameraQualityForPIP:(BOOL)a3;
- (unsigned)lastDisplayedFrameRTPTimestamp;
- (unsigned)optedInNetworkBitrateForStreamGroup:(unsigned int)a3;
- (unsigned)prominenceIndex;
- (unsigned)remoteMediaStateForMediaType:(unsigned int)a3;
- (unsigned)videoQuality;
- (unsigned)visibilityIndex;
- (void)appendOptedInStreamID:(id)a3 toOptInStreamsIDs:(id)a4 targetBandwidthEntry:(id)a5 forceSeamlessTransition:(BOOL)a6;
- (void)appendStreamGroup:(id)a3 maxQualityIndex:(unsigned int)a4 mediaEntries:(id)a5;
- (void)appendStreamGroupsMediaEntries:(id)a3;
- (void)cancelAndReleaseFetchTimer;
- (void)cleanupNwActivity;
- (void)cleanupSpatialAudio;
- (void)collectAudioChannelMetrics:(id *)a3;
- (void)collectVideoChannelMetrics:(id *)a3;
- (void)completeAndReleaseNwActivity:(id)a3 withReason:(int)a4;
- (void)createAndResumeFetchTimer;
- (void)createJitterBufferTargetEstimatorSynchronizer:(tagVCJBTargetEstimatorSynchronizer *)a3 syncGroupID:(unsigned int)a4;
- (void)dealloc;
- (void)detectConnectionTimingSource;
- (void)didReceiveFirstFrameForStreamGroup:(id)a3;
- (void)didStopReacting;
- (void)dispatchedSetRemoteAudioEnabled:(BOOL)a3;
- (void)dispatchedSetRemoteAudioPaused:(BOOL)a3;
- (void)dispatchedSetRemoteScreenEnabled:(BOOL)a3;
- (void)dispatchedSetRemoteSystemAudioPaused:(BOOL)a3;
- (void)dispatchedSetRemoteVideoEnabled:(BOOL)a3;
- (void)dispatchedSetRemoteVideoPaused:(BOOL)a3;
- (void)dispatchedSetScreenControlEnabled:(BOOL)a3;
- (void)dispatchedSetVideoReceiverFeedbackDelegate:(id)a3;
- (void)getMajorVersionNumber;
- (void)initializeParticipantType;
- (void)isVideoExpected;
- (void)negotiateAudioRules:(id)a3;
- (void)networkQualityDidDegrade:(BOOL)a3 isLocalNetworkQualityDegraded:(BOOL)a4;
- (void)participantSpatialAudioSourceIDs;
- (void)processParticipantInfo;
- (void)pushEventToNwActivity:(int64_t)a3 started:(BOOL)a4;
- (void)reactionDidStart:(id)a3;
- (void)redundancyController:(id)a3 redundancyPercentageDidChange:(unsigned int)a4;
- (void)reportCameraCompositionEnabled:(BOOL)a3;
- (void)reportConnectionTiming;
- (void)reportConnectionTimingDispatched;
- (void)reportConnectionTimingWithStreamGroupDispatched:(id)a3;
- (void)setActiveStreamIDs:(id)a3;
- (void)setAudioPaused:(BOOL)a3;
- (void)setCapabilities:(_VCSessionParticipantCapabilities)a3;
- (void)setEnableMaxCameraBitrateVideoQualityNewTier:(BOOL)a3;
- (void)setIsServerRTxEnabled:(BOOL)a3;
- (void)setMediaRecorder:(id)a3;
- (void)setMediaSuspended:(BOOL)a3 forStreamToken:(id)a4;
- (void)setMuted:(BOOL)a3;
- (void)setProminenceIndex:(unsigned int)a3;
- (void)setRemoteAudioEnabled:(BOOL)a3;
- (void)setRemoteAudioPaused:(BOOL)a3;
- (void)setRemoteMediaStalled:(BOOL)a3;
- (void)setRemoteMediaState:(id)a3 forMediaType:(id)a4;
- (void)setRemoteMediaTypeStates:(id)a3;
- (void)setRemoteScreenEnabled:(BOOL)a3;
- (void)setRemoteSystemAudioPaused:(BOOL)a3;
- (void)setRemoteVideoEnabled:(BOOL)a3;
- (void)setRemoteVideoPaused:(BOOL)a3;
- (void)setScreenControlEnabled:(BOOL)a3;
- (void)setSharingEnabled:(BOOL)a3;
- (void)setShouldEnableFaceZoom:(BOOL)a3;
- (void)setStreamGroup:(unsigned int)a3 syncSourceStreamGroupID:(unsigned int)a4;
- (void)setTransitionToDisabled:(unsigned int)a3;
- (void)setTransitionToEnabled:(unsigned int)a3;
- (void)setTransitionToPaused:(unsigned int)a3;
- (void)setVideoDegraded:(BOOL)a3;
- (void)setVideoPaused:(BOOL)a3;
- (void)setVideoQuality:(unsigned __int8)a3;
- (void)setVideoReceiverFeedbackDelegate:(id)a3;
- (void)setVideoStreamDelegate:(id)a3 delegateFunctions:(const tagVCVideoStreamDelegateRealtimeInstanceVTable *)a4;
- (void)setVisibilityIndex:(unsigned int)a3;
- (void)setupJBTargetSynchronizers;
- (void)setupMediaStreamGroupConfig:(id)a3 withNegotiationConfig:(id)a4;
- (void)setupStreamGroups;
- (void)spatialMetadataEntryForMediaType:(unsigned int)a3;
- (void)start;
- (void)stop;
- (void)updateAndHandleVideoMediaStall:(BOOL)a3 isOneToOneStream:(BOOL)a4;
- (void)updateAudioSpectrumState;
- (void)updateDownlinkBandwithAllocatorClientConfigurations:(id)a3;
- (void)updateOneToOneAudioPositionalInfo:(const tagVCSpatialAudioMetadataPositionalInfo *)a3;
- (void)updatePositionalInfo:(id)a3 shouldReapply:(BOOL)a4;
- (void)updateScreenStreamConfigurationWithStreamGroupResult:(id)a3 multiwayConfig:(id)a4 screenStreamConfig:(id)a5;
- (void)updateShouldEnableFaceZoom;
- (void)updateShouldEnableMLEnhance;
- (void)updateShouldEnableMLEnhanceHighTierMultiway;
- (void)updateShouldEnableMLEnhanceLowTierMultiway;
- (void)updateShouldEnableMLEnhanceMiddleTierMultiway;
- (void)updateShouldEnableMLEnhanceOneToOne;
- (void)updateStreamConfigWithMLEnhance:(id)a3;
- (void)updateThermalLevel:(int)a3;
- (void)updateVideoMultiwayConfig:(id)a3 withStreamGroupStreamConfig:(id)a4;
- (void)validateMediaEntries:(id)a3;
@end

@implementation VCSessionParticipantRemote

- (VCSessionParticipantRemote)initWithConfig:(id)a3 delegate:(id)a4
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  v61.receiver = self;
  v61.super_class = (Class)VCSessionParticipantRemote;
  v5 = [(VCSessionParticipant *)&v61 initWithConfig:a3 delegate:a4];
  if (v5)
  {
    v5->_perfTimers = (TimingCollection *)objc_alloc_init(MEMORY[0x1E4F47A20]);
    v5->super._isGKVoiceChat = [a3 isGKVoiceChat];
    v5->super._direction = 2;
    v5->super._idsParticipantID = [a3 idsParticipantID];
    v5->_isVideoJitterForPlayoutEnabled = +[GKSConnectivitySettings isFeatureEnabledForStorebagKey:@"vc-video-jitter-buffer-for-video-playout" userDefaultKey:@"UseVideoJitterForVideoPlayoutForFaceTime" featureFlagDomain:"AVConference" featureFlagName:"UseVideoJitterForVideoPlayout"];
    v5->_shouldDisableMiddleTierMLEnhance = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-middle-tier-ml-enhance-disabled", @"mlEnhanceForMiddleQualityTiersDisabled", MEMORY[0x1E4F1CC28], 0), "BOOLValue");
    v5->_enableMaxCameraBitrateVideoQualityNewTier = [a3 enableMaxCameraBitrateVideoQualityNewTier];
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v5->_jbSynchronizerPerSyncGroupID = v6;
    if (v6)
    {
      v7 = objc_alloc_init(VCPositionalInfo);
      v5->_positionalInfo = v7;
      if (v7)
      {
        v8 = (VCSessionParticipantRemote *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "mediaNegotiator"), "localSettings"), "copy");
        if (v8)
        {
          v9 = v8;
          [(VCSessionParticipantRemote *)v8 setIsCaller:0];
          v5->super._mediaNegotiator = [[VCSessionMediaNegotiator alloc] initWithLocalConfiguration:v9];
          [(VCSessionParticipantRemote *)v5 setupJBTargetSynchronizers];
          v10 = (NSData *)(id)[a3 participantData];
          v5->super._opaqueData = v10;
          if (v10)
          {
            v11 = (NSDictionary *)+[VCSessionParticipant participantInfoWithParticipantData:v10];
            v5->super._participantInfo = v11;
            if (v11)
            {
              if ([(VCSessionParticipantRemote *)v5 processParticipantInfo])
              {
                v5->_mediaTable = [[VCSessionBandwidthAllocationTable alloc] initWithType:2];
                -[VCObject setLogPrefix:](v5->_mediaTable, "setLogPrefix:", [NSString stringWithFormat:@"participantID:%@ ", v5->super._uuid]);
                v5->_repairMediaTable = [[VCSessionBandwidthAllocationTable alloc] initWithType:2];
                -[VCObject setLogPrefix:](v5->_repairMediaTable, "setLogPrefix:", [NSString stringWithFormat:@"participantID:%@ ", v5->super._uuid]);
                int v12 = -[VCSessionParticipantRemote setupSpatialAudioWithMetadata:spatialMetadataEntryMap:](v5, "setupSpatialAudioWithMetadata:spatialMetadataEntryMap:", [a3 spatialMetadata], objc_msgSend(a3, "spatialMetadataEntryMap"));
                if (v12 < 0)
                {
                  int v41 = v12;
                  if ((VCSessionParticipantRemote *)objc_opt_class() == v5)
                  {
                    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                    {
                      VRTraceErrorLogLevelToCSTR();
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                        -[VCSessionParticipantRemote initWithConfig:delegate:].cold.6();
                      }
                    }
                    goto LABEL_118;
                  }
                  if (objc_opt_respondsToSelector()) {
                    v42 = (__CFString *)[(VCSessionParticipantRemote *)v5 performSelector:sel_logPrefix];
                  }
                  else {
                    v42 = &stru_1F3D3E450;
                  }
                  if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
                    goto LABEL_118;
                  }
                  uint64_t v54 = VRTraceErrorLogLevelToCSTR();
                  v55 = *MEMORY[0x1E4F47A50];
                  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                    goto LABEL_118;
                  }
                  *(_DWORD *)buf = 136316418;
                  uint64_t v63 = v54;
                  __int16 v64 = 2080;
                  v65 = "-[VCSessionParticipantRemote initWithConfig:delegate:]";
                  __int16 v66 = 1024;
                  int v67 = 210;
                  __int16 v68 = 2112;
                  uint64_t v69 = (uint64_t)v42;
                  __int16 v70 = 2048;
                  v71 = v5;
                  __int16 v72 = 1024;
                  LODWORD(v73) = v41;
                  v56 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to setup spatial audio! result=%08x";
                  v57 = v55;
                  uint32_t v58 = 54;
                }
                else
                {
                  v5->_isServerRTxEnabled = [a3 isServerRTxEnabled];
                  v5->_isEnhancedJBAdaptationsEnabled = [a3 isEnhancedJBAdaptationsEnabled];
                  v5->_outOfProcessCodecsEnabled = [a3 outOfProcessCodecsEnabled];
                  -[VCSessionParticipantRemote setProminenceIndex:](v5, "setProminenceIndex:", [a3 prominenceIndex]);
                  v5->_capabilities.supportsParticipantIDBasedKeyLookup = [(VCSessionParticipantRemote *)v5 supportsIDSParticipantIDBasedKeyIndexMatching];
                  [(TimingCollection *)v5->_perfTimers startTimingForKey:19];
                  if ([(VCSessionParticipantRemote *)v5 setupStreamGroups])
                  {
                    [(VCSessionParticipantRemote *)v5 initializeParticipantType];
                    v5->_capabilities.controlChannelVersion = [(VCMediaNegotiatorResults *)[(VCSessionMediaNegotiator *)v5->super._mediaNegotiator negotiatedSettings] controlChannelVersion];
                    v5->_capabilities.supportsGFTSwitchToOneToOne = [(VCSessionParticipantRemote *)v5 supportsGFTSwitchToOneToOne];
                    v5->super._audioEnabled = [a3 audioEnabled];
                    v5->super._videoEnabled = [a3 videoEnabled];
                    v5->super._screenEnabled = [a3 screenEnabled];
                    v5->super._audioPaused = [a3 audioPaused];
                    v5->super._videoPaused = [a3 videoPaused];
                    v5->super._isMuted = [a3 audioMuted];
                    [a3 volume];
                    v5->super._volume = v13;
                    [a3 audioPosition];
                    v5->super._audioPosition = v14;
                    v5->_nwActivity = (OS_nw_activity *)[a3 nwActivity];
                    v5->_remoteVideoEnabled = 1;
                    v5->_remoteAudioEnabled = 1;
                    v5->_remoteScreenEnabledStateChanged = 1;
                    v5->_remoteSystemAudioPaused = 0;
                    v5->_remoteMediaStates = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
                    v5->_thermalLevel = 0;
                    [(VCSessionParticipant *)v5 setupMediaTypeSettingsWithConfig:a3];
                    nwActivity = v5->_nwActivity;
                    if (nwActivity) {
                      nw_retain(nwActivity);
                    }
                    [(VCSessionParticipantRemote *)v5 updateDownlinkBandwithAllocatorClientConfigurations:a3];
                    if (![+[VCDefaults sharedInstance] forceFECRepairStream])goto LABEL_25; {
                    if ((VCSessionParticipantRemote *)objc_opt_class() == v5)
                    }
                    {
                      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
                        goto LABEL_24;
                      }
                      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
                      v18 = *MEMORY[0x1E4F47A50];
                      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
                        goto LABEL_24;
                      }
                      *(_DWORD *)buf = 136315650;
                      uint64_t v63 = v17;
                      __int16 v64 = 2080;
                      v65 = "-[VCSessionParticipantRemote initWithConfig:delegate:]";
                      __int16 v66 = 1024;
                      int v67 = 252;
                      v19 = "VCSessionParticipantRemote [%s] %s:%d _isRedundancyRequested set to YES by forceFECRepairStream";
                      v20 = v18;
                      uint32_t v21 = 28;
                    }
                    else
                    {
                      if (objc_opt_respondsToSelector()) {
                        v16 = (__CFString *)[(VCSessionParticipantRemote *)v5 performSelector:sel_logPrefix];
                      }
                      else {
                        v16 = &stru_1F3D3E450;
                      }
                      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
                        goto LABEL_24;
                      }
                      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
                      v23 = *MEMORY[0x1E4F47A50];
                      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
                        goto LABEL_24;
                      }
                      *(_DWORD *)buf = 136316162;
                      uint64_t v63 = v22;
                      __int16 v64 = 2080;
                      v65 = "-[VCSessionParticipantRemote initWithConfig:delegate:]";
                      __int16 v66 = 1024;
                      int v67 = 252;
                      __int16 v68 = 2112;
                      uint64_t v69 = (uint64_t)v16;
                      __int16 v70 = 2048;
                      v71 = v5;
                      v19 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) _isRedundancyRequested set to YES by forceFECRepairStream";
                      v20 = v23;
                      uint32_t v21 = 48;
                    }
                    _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
LABEL_24:
                    v5->_isRedundancyRequested = 1;
LABEL_25:
                    [(VCSessionParticipantRemote *)v5 updateAudioSpectrumState];
                    if ((VCSessionParticipantRemote *)objc_opt_class() == v5)
                    {
                      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
                        goto LABEL_36;
                      }
                      uint64_t v25 = VRTraceErrorLogLevelToCSTR();
                      v26 = *MEMORY[0x1E4F47A50];
                      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
                        goto LABEL_36;
                      }
                      uint64_t v27 = [(VCSessionParticipant *)v5 description];
                      *(_DWORD *)buf = 136315906;
                      uint64_t v63 = v25;
                      __int16 v64 = 2080;
                      v65 = "-[VCSessionParticipantRemote initWithConfig:delegate:]";
                      __int16 v66 = 1024;
                      int v67 = 259;
                      __int16 v68 = 2112;
                      uint64_t v69 = v27;
                      v28 = "VCSessionParticipantRemote [%s] %s:%d Participant init %@";
                      v29 = v26;
                      uint32_t v30 = 38;
                    }
                    else
                    {
                      if (objc_opt_respondsToSelector()) {
                        v24 = (__CFString *)[(VCSessionParticipantRemote *)v5 performSelector:sel_logPrefix];
                      }
                      else {
                        v24 = &stru_1F3D3E450;
                      }
                      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
                        goto LABEL_36;
                      }
                      uint64_t v31 = VRTraceErrorLogLevelToCSTR();
                      v32 = *MEMORY[0x1E4F47A50];
                      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
                        goto LABEL_36;
                      }
                      uint64_t v33 = [(VCSessionParticipant *)v5 description];
                      *(_DWORD *)buf = 136316418;
                      uint64_t v63 = v31;
                      __int16 v64 = 2080;
                      v65 = "-[VCSessionParticipantRemote initWithConfig:delegate:]";
                      __int16 v66 = 1024;
                      int v67 = 259;
                      __int16 v68 = 2112;
                      uint64_t v69 = (uint64_t)v24;
                      __int16 v70 = 2048;
                      v71 = v5;
                      __int16 v72 = 2112;
                      uint64_t v73 = v33;
                      v28 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Participant init %@";
                      v29 = v32;
                      uint32_t v30 = 58;
                    }
                    _os_log_impl(&dword_1E1EA4000, v29, OS_LOG_TYPE_DEFAULT, v28, buf, v30);
LABEL_36:

                    return v5;
                  }
                  if ((VCSessionParticipantRemote *)objc_opt_class() == v5)
                  {
                    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                    {
                      VRTraceErrorLogLevelToCSTR();
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                        -[VCSessionParticipantRemote initWithConfig:delegate:].cold.7();
                      }
                    }
                    goto LABEL_118;
                  }
                  if (objc_opt_respondsToSelector()) {
                    v43 = (__CFString *)[(VCSessionParticipantRemote *)v5 performSelector:sel_logPrefix];
                  }
                  else {
                    v43 = &stru_1F3D3E450;
                  }
                  if ((int)VRTraceGetErrorLogLevelForModule() < 3
                    || (uint64_t v59 = VRTraceErrorLogLevelToCSTR(),
                        v60 = *MEMORY[0x1E4F47A50],
                        !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
                  {
LABEL_118:

                    v9 = v5;
                    v5 = 0;
                    goto LABEL_36;
                  }
                  *(_DWORD *)buf = 136316162;
                  uint64_t v63 = v59;
                  __int16 v64 = 2080;
                  v65 = "-[VCSessionParticipantRemote initWithConfig:delegate:]";
                  __int16 v66 = 1024;
                  int v67 = 221;
                  __int16 v68 = 2112;
                  uint64_t v69 = (uint64_t)v43;
                  __int16 v70 = 2048;
                  v71 = v5;
                  v56 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to setup stream groups";
                  v57 = v60;
                  uint32_t v58 = 48;
                }
                _os_log_error_impl(&dword_1E1EA4000, v57, OS_LOG_TYPE_ERROR, v56, buf, v58);
                goto LABEL_118;
              }
              if ((VCSessionParticipantRemote *)objc_opt_class() == v5)
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  VRTraceErrorLogLevelToCSTR();
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                    -[VCSessionParticipantRemote initWithConfig:delegate:].cold.8();
                  }
                }
                goto LABEL_118;
              }
              if (objc_opt_respondsToSelector()) {
                v40 = (__CFString *)[(VCSessionParticipantRemote *)v5 performSelector:sel_logPrefix];
              }
              else {
                v40 = &stru_1F3D3E450;
              }
              if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
                goto LABEL_118;
              }
              uint64_t v53 = VRTraceErrorLogLevelToCSTR();
              v50 = *MEMORY[0x1E4F47A50];
              if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                goto LABEL_118;
              }
              *(_DWORD *)buf = 136316162;
              uint64_t v63 = v53;
              __int16 v64 = 2080;
              v65 = "-[VCSessionParticipantRemote initWithConfig:delegate:]";
              __int16 v66 = 1024;
              int v67 = 201;
              __int16 v68 = 2112;
              uint64_t v69 = (uint64_t)v40;
              __int16 v70 = 2048;
              v71 = v5;
              v51 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to process participant info!";
            }
            else
            {
              if ((VCSessionParticipantRemote *)objc_opt_class() == v5)
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  VRTraceErrorLogLevelToCSTR();
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                    -[VCSessionParticipantRemote initWithConfig:delegate:].cold.5();
                  }
                }
                goto LABEL_118;
              }
              if (objc_opt_respondsToSelector()) {
                v39 = (__CFString *)[(VCSessionParticipantRemote *)v5 performSelector:sel_logPrefix];
              }
              else {
                v39 = &stru_1F3D3E450;
              }
              if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
                goto LABEL_118;
              }
              uint64_t v52 = VRTraceErrorLogLevelToCSTR();
              v50 = *MEMORY[0x1E4F47A50];
              if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                goto LABEL_118;
              }
              *(_DWORD *)buf = 136316162;
              uint64_t v63 = v52;
              __int16 v64 = 2080;
              v65 = "-[VCSessionParticipantRemote initWithConfig:delegate:]";
              __int16 v66 = 1024;
              int v67 = 198;
              __int16 v68 = 2112;
              uint64_t v69 = (uint64_t)v39;
              __int16 v70 = 2048;
              v71 = v5;
              v51 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to deserialize remote participant data!";
            }
          }
          else
          {
            if ((VCSessionParticipantRemote *)objc_opt_class() == v5)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                VRTraceErrorLogLevelToCSTR();
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                  -[VCSessionParticipantRemote initWithConfig:delegate:].cold.4();
                }
              }
              goto LABEL_118;
            }
            if (objc_opt_respondsToSelector()) {
              v38 = (__CFString *)[(VCSessionParticipantRemote *)v5 performSelector:sel_logPrefix];
            }
            else {
              v38 = &stru_1F3D3E450;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
              goto LABEL_118;
            }
            uint64_t v49 = VRTraceErrorLogLevelToCSTR();
            v50 = *MEMORY[0x1E4F47A50];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              goto LABEL_118;
            }
            *(_DWORD *)buf = 136316162;
            uint64_t v63 = v49;
            __int16 v64 = 2080;
            v65 = "-[VCSessionParticipantRemote initWithConfig:delegate:]";
            __int16 v66 = 1024;
            int v67 = 195;
            __int16 v68 = 2112;
            uint64_t v69 = (uint64_t)v38;
            __int16 v70 = 2048;
            v71 = v5;
            v51 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Nil remote participant data!";
          }
          _os_log_error_impl(&dword_1E1EA4000, v50, OS_LOG_TYPE_ERROR, v51, buf, 0x30u);
          goto LABEL_118;
        }
        if ((VCSessionParticipantRemote *)objc_opt_class() == v5)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCSessionParticipantRemote initWithConfig:delegate:]();
            }
          }
          goto LABEL_97;
        }
        if (objc_opt_respondsToSelector()) {
          v37 = (__CFString *)[(VCSessionParticipantRemote *)v5 performSelector:sel_logPrefix];
        }
        else {
          v37 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 3
          || (uint64_t v48 = VRTraceErrorLogLevelToCSTR(),
              v45 = *MEMORY[0x1E4F47A50],
              !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
        {
LABEL_97:
          v9 = 0;
          goto LABEL_118;
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v63 = v48;
        __int16 v64 = 2080;
        v65 = "-[VCSessionParticipantRemote initWithConfig:delegate:]";
        __int16 v66 = 1024;
        int v67 = 187;
        __int16 v68 = 2112;
        uint64_t v69 = (uint64_t)v37;
        __int16 v70 = 2048;
        v71 = v5;
        v46 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to copy local configuration!";
      }
      else
      {
        if ((VCSessionParticipantRemote *)objc_opt_class() == v5)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCSessionParticipantRemote initWithConfig:delegate:]();
            }
          }
          goto LABEL_97;
        }
        if (objc_opt_respondsToSelector()) {
          v36 = (__CFString *)[(VCSessionParticipantRemote *)v5 performSelector:sel_logPrefix];
        }
        else {
          v36 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_97;
        }
        uint64_t v47 = VRTraceErrorLogLevelToCSTR();
        v45 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          goto LABEL_97;
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v63 = v47;
        __int16 v64 = 2080;
        v65 = "-[VCSessionParticipantRemote initWithConfig:delegate:]";
        __int16 v66 = 1024;
        int v67 = 184;
        __int16 v68 = 2112;
        uint64_t v69 = (uint64_t)v36;
        __int16 v70 = 2048;
        v71 = v5;
        v46 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to allocate positional info!";
      }
    }
    else
    {
      if ((VCSessionParticipantRemote *)objc_opt_class() == v5)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSessionParticipantRemote initWithConfig:delegate:]();
          }
        }
        goto LABEL_97;
      }
      if (objc_opt_respondsToSelector()) {
        v35 = (__CFString *)[(VCSessionParticipantRemote *)v5 performSelector:sel_logPrefix];
      }
      else {
        v35 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_97;
      }
      uint64_t v44 = VRTraceErrorLogLevelToCSTR();
      v45 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_97;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v63 = v44;
      __int16 v64 = 2080;
      v65 = "-[VCSessionParticipantRemote initWithConfig:delegate:]";
      __int16 v66 = 1024;
      int v67 = 181;
      __int16 v68 = 2112;
      uint64_t v69 = (uint64_t)v35;
      __int16 v70 = 2048;
      v71 = v5;
      v46 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed jitter target synchronizer  dictionary!";
    }
    _os_log_error_impl(&dword_1E1EA4000, v45, OS_LOG_TYPE_ERROR, v46, buf, 0x30u);
    goto LABEL_97;
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  [(VCSessionParticipantRemote *)self cleanupSpatialAudio];
  [(VCSessionParticipantRemote *)self cleanupNwActivity];

  v3.receiver = self;
  v3.super_class = (Class)VCSessionParticipantRemote;
  [(VCSessionParticipant *)&v3 dealloc];
}

- (void)start
{
  block[5] = *MEMORY[0x1E4F143B8];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__VCSessionParticipantRemote_start__block_invoke;
  block[3] = &unk_1E6DB3DC8;
  block[4] = self;
  dispatch_async(participantQueue, block);
  v6.receiver = self;
  v6.super_class = (Class)VCSessionParticipantRemote;
  [(VCSessionParticipant *)&v6 start];
  uint64_t v4 = self->super._participantQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__VCSessionParticipantRemote_start__block_invoke_2;
  v5[3] = &unk_1E6DB3DC8;
  v5[4] = self;
  dispatch_async(v4, v5);
}

uint64_t __35__VCSessionParticipantRemote_start__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 616) startTimingForKey:23];
}

uint64_t __35__VCSessionParticipantRemote_start__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) createAndResumeFetchTimer];
}

- (void)stop
{
  block[5] = *MEMORY[0x1E4F143B8];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__VCSessionParticipantRemote_stop__block_invoke;
  block[3] = &unk_1E6DB3DC8;
  block[4] = self;
  dispatch_async(participantQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)VCSessionParticipantRemote;
  [(VCSessionParticipant *)&v4 stop];
}

uint64_t __34__VCSessionParticipantRemote_stop__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelAndReleaseFetchTimer];
}

- (void)detectConnectionTimingSource
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._participantQueue);
  if (!self->_isConnectionTimingSourceDetected)
  {
    self->_isConnectionTimingSourceDetected = 1;
    self->_isCameraUsedForConnectionTiming = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_remoteMediaStates, "objectForKeyedSubscript:", &unk_1F3DC4428), "unsignedIntValue") == 1;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      objc_super v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unint64_t idsParticipantID = self->super._idsParticipantID;
        if (self->_isCameraUsedForConnectionTiming) {
          objc_super v6 = @"video";
        }
        else {
          objc_super v6 = @"audio";
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v24 = v3;
        __int16 v25 = 2080;
        v26 = "-[VCSessionParticipantRemote detectConnectionTimingSource]";
        __int16 v27 = 1024;
        int v28 = 309;
        __int16 v29 = 2048;
        uint32_t v30 = (VCSessionParticipantRemote *)idsParticipantID;
        __int16 v31 = 2112;
        v32 = v6;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VCSessionParticipantRemote [%s] %s:%d Connection timing for participantID=%llu clocked by %@ for this call", buf, 0x30u);
      }
    }
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = (id)[(NSMutableDictionary *)self->super._streamGroups allValues];
    uint64_t v21 = [obj countByEnumeratingWithState:&v41 objects:v40 count:16];
    if (v21)
    {
      uint64_t v20 = *(void *)v42;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v42 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = v7;
          v8 = *(__CFString **)(*((void *)&v41 + 1) + 8 * v7);
          id v9 = +[VCSessionParticipant mediaTypesFromStreamGroupID:[(__CFString *)v8 streamGroupID]];
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v35 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v37;
            do
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v37 != v12) {
                  objc_enumerationMutation(v9);
                }
                int v14 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_remoteMediaStates, "objectForKeyedSubscript:", *(void *)(*((void *)&v36 + 1) + 8 * i)), "unsignedIntValue");
                [(__CFString *)v8 setEnabledAtStart:v14 == 1];
                if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                {
                  uint64_t v15 = VRTraceErrorLogLevelToCSTR();
                  v16 = *MEMORY[0x1E4F47A50];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136316418;
                    uint64_t v17 = @"disabled";
                    if (v14 == 1) {
                      uint64_t v17 = @"enabled";
                    }
                    uint64_t v24 = v15;
                    __int16 v25 = 2080;
                    v26 = "-[VCSessionParticipantRemote detectConnectionTimingSource]";
                    __int16 v27 = 1024;
                    int v28 = 318;
                    __int16 v29 = 2112;
                    uint32_t v30 = self;
                    __int16 v31 = 2112;
                    v32 = v8;
                    __int16 v33 = 2112;
                    v34 = v17;
                    _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, "VCSessionParticipantRemote [%s] %s:%d Remote participant=%@ has streamGroup=%@ %@ at start", buf, 0x3Au);
                  }
                }
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v36 objects:v35 count:16];
            }
            while (v11);
          }
          if (!self->_isCameraUsedForConnectionTiming) {
            goto LABEL_28;
          }
          if ([(__CFString *)v8 streamGroupID] != 1667329381)
          {
            if (self->_isCameraUsedForConnectionTiming) {
              goto LABEL_31;
            }
LABEL_28:
            if ([(__CFString *)v8 streamGroupID] != 1835623282) {
              goto LABEL_31;
            }
          }
          [(__CFString *)v8 firstMediaFrameReceivedTime];
          if (v18 != 0.0) {
            [(VCSessionParticipantRemote *)self reportConnectionTimingWithStreamGroupDispatched:v8];
          }
LABEL_31:
          uint64_t v7 = v22 + 1;
        }
        while (v22 + 1 != v21);
        uint64_t v21 = [obj countByEnumeratingWithState:&v41 objects:v40 count:16];
      }
      while (v21);
    }
  }
}

- (void)initializeParticipantType
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableDictionary *)self->super._participantStreamTokens objectForKeyedSubscript:&unk_1F3DC4440]|| [(NSMutableDictionary *)self->super._participantStreamTokens objectForKeyedSubscript:&unk_1F3DC4458])
  {
    uint64_t v3 = @"webrtc";
    unsigned int v4 = 1;
  }
  else if ([(VCSessionParticipant *)self didNegotiateStreamGroupWithID:1650745716])
  {
    uint64_t v3 = @"wolf";
    unsigned int v4 = 2;
  }
  else
  {
    uint64_t v3 = @"wolf";
    unsigned int v4 = 2;
    if (![(VCSessionParticipant *)self didNegotiateStreamGroupWithID:1718909044])
    {
      BOOL v13 = [(VCSessionParticipant *)self didNegotiateStreamGroupWithID:1717854580];
      unsigned int v4 = v13 ? 2 : 0;
      if (!v13) {
        uint64_t v3 = @"native";
      }
    }
  }
  self->_capabilities.participantType = v4;
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136315906;
        uint64_t v15 = v6;
        __int16 v16 = 2080;
        uint64_t v17 = "-[VCSessionParticipantRemote initializeParticipantType]";
        __int16 v18 = 1024;
        int v19 = 345;
        __int16 v20 = 2112;
        uint64_t v21 = v3;
        v8 = "VCSessionParticipantRemote [%s] %s:%d remoteParticipantType=%@";
        id v9 = v7;
        uint32_t v10 = 38;
LABEL_14:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v14, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v5 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136316418;
        uint64_t v15 = v11;
        __int16 v16 = 2080;
        uint64_t v17 = "-[VCSessionParticipantRemote initializeParticipantType]";
        __int16 v18 = 1024;
        int v19 = 345;
        __int16 v20 = 2112;
        uint64_t v21 = v5;
        __int16 v22 = 2048;
        v23 = self;
        __int16 v24 = 2112;
        __int16 v25 = v3;
        v8 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) remoteParticipantType=%@";
        id v9 = v12;
        uint32_t v10 = 58;
        goto LABEL_14;
      }
    }
  }
}

- (int)setupSpatialAudioWithMetadata:(void *)a3 spatialMetadataEntryMap:(__CFDictionary *)a4
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  CFTypeRef cf = 0;
  unsigned int v48 = 0;
  [(VCSessionParticipantRemote *)self cleanupSpatialAudio];
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (a3 && a4)
  {
    CFIndex Count = CFDictionaryGetCount(a4);
    MutableCopy = CFDictionaryCreateMutableCopy(v7, Count + 1, a4);
  }
  else
  {
    MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  }
  self->_mediaTypeToSpatialAudioMetadataEntryMap = MutableCopy;
  if (!MutableCopy)
  {
    int v11 = -2143420414;
    if ((VCSessionParticipantRemote *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v27 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v27 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_28;
      }
      uint64_t v37 = VRTraceErrorLogLevelToCSTR();
      long long v38 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_28;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v56 = v37;
      __int16 v57 = 2080;
      uint32_t v58 = "-[VCSessionParticipantRemote setupSpatialAudioWithMetadata:spatialMetadataEntryMap:]";
      __int16 v59 = 1024;
      int v60 = 360;
      __int16 v61 = 2112;
      CFTypeRef v62 = v27;
      __int16 v63 = 2048;
      __int16 v64 = self;
      long long v39 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to allocate channel index map";
      v40 = v38;
      uint32_t v41 = 48;
      goto LABEL_84;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionParticipantRemote setupSpatialAudioWithMetadata:spatialMetadataEntryMap:]();
      }
    }
    goto LABEL_28;
  }
  if (!a3)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      {
LABEL_70:
        int v11 = 0;
        goto LABEL_28;
      }
      uint64_t v32 = VRTraceErrorLogLevelToCSTR();
      __int16 v33 = *MEMORY[0x1E4F47A50];
      int v11 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_28;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v56 = v32;
      __int16 v57 = 2080;
      uint32_t v58 = "-[VCSessionParticipantRemote setupSpatialAudioWithMetadata:spatialMetadataEntryMap:]";
      __int16 v59 = 1024;
      int v60 = 363;
      v34 = "VCSessionParticipantRemote [%s] %s:%d spatialMetadata is NULL";
      v35 = v33;
      uint32_t v36 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v28 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
      }
      else {
        int v28 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_70;
      }
      uint64_t v42 = VRTraceErrorLogLevelToCSTR();
      long long v43 = *MEMORY[0x1E4F47A50];
      int v11 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_28;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v56 = v42;
      __int16 v57 = 2080;
      uint32_t v58 = "-[VCSessionParticipantRemote setupSpatialAudioWithMetadata:spatialMetadataEntryMap:]";
      __int16 v59 = 1024;
      int v60 = 363;
      __int16 v61 = 2112;
      CFTypeRef v62 = v28;
      __int16 v63 = 2048;
      __int16 v64 = self;
      v34 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) spatialMetadata is NULL";
      v35 = v43;
      uint32_t v36 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v35, OS_LOG_TYPE_DEFAULT, v34, buf, v36);
    goto LABEL_70;
  }
  int Entry = VCSpatialAudioMetadata_CreateEntry((uint64_t)v7, (uint64_t)a3, objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._participantStreamTokens, "objectForKeyedSubscript:", &unk_1F3DC4470), "unsignedLongLongValue"), (uint64_t *)&cf);
  if (Entry < 0)
  {
    int v11 = Entry;
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantRemote setupSpatialAudioWithMetadata:spatialMetadataEntryMap:]();
        }
      }
      goto LABEL_28;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v29 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v29 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_28;
    }
    uint64_t v44 = VRTraceErrorLogLevelToCSTR();
    uint64_t v45 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136316418;
    uint64_t v56 = v44;
    __int16 v57 = 2080;
    uint32_t v58 = "-[VCSessionParticipantRemote setupSpatialAudioWithMetadata:spatialMetadataEntryMap:]";
    __int16 v59 = 1024;
    int v60 = 367;
    __int16 v61 = 2112;
    CFTypeRef v62 = v29;
    __int16 v63 = 2048;
    __int16 v64 = self;
    __int16 v65 = 1024;
    LODWORD(v66) = v11;
    long long v39 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to allocate spatial metadata entry. status=%08x";
LABEL_83:
    v40 = v45;
    uint32_t v41 = 54;
LABEL_84:
    _os_log_error_impl(&dword_1E1EA4000, v40, OS_LOG_TYPE_ERROR, v39, buf, v41);
    goto LABEL_28;
  }
  int v11 = VCSpatialAudioMetadata_ChannelIndex((uint64_t)cf, &v48);
  uint64_t v12 = (VCSessionParticipantRemote *)objc_opt_class();
  if (v11 < 0)
  {
    if (v12 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantRemote setupSpatialAudioWithMetadata:spatialMetadataEntryMap:]();
        }
      }
      goto LABEL_28;
    }
    if (objc_opt_respondsToSelector()) {
      uint32_t v30 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      uint32_t v30 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_28;
    }
    uint64_t v46 = VRTraceErrorLogLevelToCSTR();
    uint64_t v45 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136316418;
    uint64_t v56 = v46;
    __int16 v57 = 2080;
    uint32_t v58 = "-[VCSessionParticipantRemote setupSpatialAudioWithMetadata:spatialMetadataEntryMap:]";
    __int16 v59 = 1024;
    int v60 = 370;
    __int16 v61 = 2112;
    CFTypeRef v62 = v30;
    __int16 v63 = 2048;
    __int16 v64 = self;
    __int16 v65 = 1024;
    LODWORD(v66) = v11;
    long long v39 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to retrieve the channel index. status=%08x";
    goto LABEL_83;
  }
  if (v12 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_20;
    }
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    uint64_t v15 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v56 = v14;
    __int16 v57 = 2080;
    uint32_t v58 = "-[VCSessionParticipantRemote setupSpatialAudioWithMetadata:spatialMetadataEntryMap:]";
    __int16 v59 = 1024;
    int v60 = 371;
    __int16 v61 = 2048;
    CFTypeRef v62 = cf;
    __int16 v63 = 1024;
    LODWORD(v64) = v48;
    __int16 v16 = "VCSessionParticipantRemote [%s] %s:%d created entry=%p with channelIndex=%u";
    uint64_t v17 = v15;
    uint32_t v18 = 44;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      BOOL v13 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      BOOL v13 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_20;
    }
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    __int16 v20 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    *(_DWORD *)buf = 136316674;
    uint64_t v56 = v19;
    __int16 v57 = 2080;
    uint32_t v58 = "-[VCSessionParticipantRemote setupSpatialAudioWithMetadata:spatialMetadataEntryMap:]";
    __int16 v59 = 1024;
    int v60 = 371;
    __int16 v61 = 2112;
    CFTypeRef v62 = v13;
    __int16 v63 = 2048;
    __int16 v64 = self;
    __int16 v65 = 2048;
    CFTypeRef v66 = cf;
    __int16 v67 = 1024;
    unsigned int v68 = v48;
    __int16 v16 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) created entry=%p with channelIndex=%u";
    uint64_t v17 = v20;
    uint32_t v18 = 64;
  }
  _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
LABEL_20:
  int v11 = [(VCSessionParticipantRemote *)self storeSpatialAudioMetadataEntry:cf forMediaType:0];
  if ((v11 & 0x80000000) == 0)
  {
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    micStreamGroups = self->super._micStreamGroups;
    uint64_t v22 = [(NSMutableArray *)micStreamGroups countByEnumeratingWithState:&v51 objects:v50 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v52 != v24) {
            objc_enumerationMutation(micStreamGroups);
          }
          [*(id *)(*((void *)&v51 + 1) + 8 * i) setAudioChannelIndex:v48];
        }
        uint64_t v23 = [(NSMutableArray *)micStreamGroups countByEnumeratingWithState:&v51 objects:v50 count:16];
      }
      while (v23);
    }
    goto LABEL_28;
  }
  if ((VCSessionParticipantRemote *)objc_opt_class() != self)
  {
    if (objc_opt_respondsToSelector()) {
      __int16 v31 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v31 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_28;
    }
    uint64_t v47 = VRTraceErrorLogLevelToCSTR();
    uint64_t v45 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136316418;
    uint64_t v56 = v47;
    __int16 v57 = 2080;
    uint32_t v58 = "-[VCSessionParticipantRemote setupSpatialAudioWithMetadata:spatialMetadataEntryMap:]";
    __int16 v59 = 1024;
    int v60 = 374;
    __int16 v61 = 2112;
    CFTypeRef v62 = v31;
    __int16 v63 = 2048;
    __int16 v64 = self;
    __int16 v65 = 1024;
    LODWORD(v66) = v11;
    long long v39 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to store metadata entry for VCSessionMediaTypeMicrophone. status=%08x";
    goto LABEL_83;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCSessionParticipantRemote setupSpatialAudioWithMetadata:spatialMetadataEntryMap:].cold.4();
    }
  }
LABEL_28:
  if (cf) {
    CFRelease(cf);
  }
  return v11;
}

- (void)cleanupSpatialAudio
{
  mediaTypeToSpatialAudioMetadataEntryMap = self->_mediaTypeToSpatialAudioMetadataEntryMap;
  if (mediaTypeToSpatialAudioMetadataEntryMap)
  {
    CFRelease(mediaTypeToSpatialAudioMetadataEntryMap);
    self->_mediaTypeToSpatialAudioMetadataEntryMap = 0;
  }
}

- (void)spatialMetadataEntryForMediaType:(unsigned int)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unsigned int valuePtr = a3;
  if (!self->_mediaTypeToSpatialAudioMetadataEntryMap) {
    return 0;
  }
  CFNumberRef v4 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt32Type, &valuePtr);
  if (!v4)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantRemote spatialMetadataEntryForMediaType:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v8 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
      }
      else {
        v8 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        uint32_t v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v13 = v9;
          __int16 v14 = 2080;
          uint64_t v15 = "-[VCSessionParticipantRemote spatialMetadataEntryForMediaType:]";
          __int16 v16 = 1024;
          int v17 = 396;
          __int16 v18 = 2112;
          uint64_t v19 = v8;
          __int16 v20 = 2048;
          uint64_t v21 = self;
          _os_log_error_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to allocate media type key", buf, 0x30u);
        }
      }
    }
    return 0;
  }
  CFNumberRef v5 = v4;
  Value = (void *)CFDictionaryGetValue(self->_mediaTypeToSpatialAudioMetadataEntryMap, v4);
  CFRelease(v5);
  return Value;
}

- (int)storeSpatialAudioMetadataEntry:(void *)a3 forMediaType:(unsigned int)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unsigned int valuePtr = a4;
  CFNumberRef v6 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt32Type, &valuePtr);
  if (v6)
  {
    CFNumberRef v7 = v6;
    CFDictionaryAddValue(self->_mediaTypeToSpatialAudioMetadataEntryMap, v6, a3);
    CFRelease(v7);
    return 0;
  }
  else
  {
    int v8 = -2143420414;
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantRemote storeSpatialAudioMetadataEntry:forMediaType:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint32_t v10 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
      }
      else {
        uint32_t v10 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        uint64_t v12 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v15 = v11;
          __int16 v16 = 2080;
          int v17 = "-[VCSessionParticipantRemote storeSpatialAudioMetadataEntry:forMediaType:]";
          __int16 v18 = 1024;
          int v19 = 408;
          __int16 v20 = 2112;
          uint64_t v21 = v10;
          __int16 v22 = 2048;
          uint64_t v23 = self;
          _os_log_error_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to allocate media type key", buf, 0x30u);
        }
      }
    }
  }
  return v8;
}

- (NSDictionary)participantSpatialAudioSourceIDs
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  mediaTypeToSpatialAudioMetadataEntryMap = self->_mediaTypeToSpatialAudioMetadataEntryMap;
  if (mediaTypeToSpatialAudioMetadataEntryMap)
  {
    CFNumberRef v4 = (NSDictionary *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:CFDictionaryGetCount(mediaTypeToSpatialAudioMetadataEntryMap)];
    CFDictionaryApplyFunction(self->_mediaTypeToSpatialAudioMetadataEntryMap, (CFDictionaryApplierFunction)_VCSessionParticipantRemote_AddMetaDataToSpatialAudioSourceID, v4);
  }
  else
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantRemote participantSpatialAudioSourceIDs]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        CFNumberRef v6 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
      }
      else {
        CFNumberRef v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        int v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v9 = 136316162;
          uint64_t v10 = v7;
          __int16 v11 = 2080;
          uint64_t v12 = "-[VCSessionParticipantRemote participantSpatialAudioSourceIDs]";
          __int16 v13 = 1024;
          int v14 = 420;
          __int16 v15 = 2112;
          __int16 v16 = v6;
          __int16 v17 = 2048;
          __int16 v18 = self;
          _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to get spatial audio source IDs", (uint8_t *)&v9, 0x30u);
        }
      }
    }
    return 0;
  }
  return v4;
}

- (void)setAudioPaused:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__VCSessionParticipantRemote_setAudioPaused___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __45__VCSessionParticipantRemote_setAudioPaused___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 376) = *(unsigned char *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "updateActiveStateForStreamGroup:", objc_msgSend(*(id *)(a1 + 32), "audioGroup"));
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      CFNumberRef v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v5 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 376);
        *(_DWORD *)buf = 136315906;
        uint64_t v18 = v3;
        __int16 v19 = 2080;
        __int16 v20 = "-[VCSessionParticipantRemote setAudioPaused:]_block_invoke";
        __int16 v21 = 1024;
        int v22 = 433;
        __int16 v23 = 1024;
        LODWORD(v24) = v5;
        uint64_t v6 = "VCSessionParticipantRemote [%s] %s:%d setAudioPaused=%d";
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
      v2 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      v2 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        int v12 = *(unsigned __int8 *)(v11 + 376);
        *(_DWORD *)buf = 136316418;
        uint64_t v18 = v9;
        __int16 v19 = 2080;
        __int16 v20 = "-[VCSessionParticipantRemote setAudioPaused:]_block_invoke";
        __int16 v21 = 1024;
        int v22 = 433;
        __int16 v23 = 2112;
        uint64_t v24 = v2;
        __int16 v25 = 2048;
        uint64_t v26 = v11;
        __int16 v27 = 1024;
        int v28 = v12;
        uint64_t v6 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) setAudioPaused=%d";
        uint64_t v7 = v10;
        uint32_t v8 = 54;
        goto LABEL_11;
      }
    }
  }
  __int16 v13 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __45__VCSessionParticipantRemote_setAudioPaused___block_invoke_58;
  v15[3] = &unk_1E6DB6978;
  v15[4] = v13;
  char v16 = *(unsigned char *)(a1 + 40);
  return [v13 callDelegateWithBlock:v15];
}

uint64_t __45__VCSessionParticipantRemote_setAudioPaused___block_invoke_58(uint64_t a1, void *a2)
{
  return [a2 vcSessionParticipant:*(void *)(a1 + 32) audioPaused:*(unsigned __int8 *)(a1 + 40) didSucceed:1 error:0];
}

- (void)dispatchedSetRemoteAudioPaused:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (self->_remoteAudioPaused != a3)
  {
    self->_BOOL remoteAudioPaused = a3;
    [(VCSessionParticipantRemote *)self updateActiveStateForStreamGroup:[(VCSessionParticipantRemote *)self audioGroup]];
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_24;
      }
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      __int16 v13 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      BOOL remoteAudioPaused = self->_remoteAudioPaused;
      *(_DWORD *)buf = 136315906;
      uint64_t v25 = v12;
      __int16 v26 = 2080;
      __int16 v27 = "-[VCSessionParticipantRemote dispatchedSetRemoteAudioPaused:]";
      __int16 v28 = 1024;
      int v29 = 444;
      __int16 v30 = 1024;
      LODWORD(v31) = remoteAudioPaused;
      __int16 v15 = "VCSessionParticipantRemote [%s] %s:%d setRemoteAudioPaused=%d";
      char v16 = v13;
      uint32_t v17 = 34;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v6 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_24;
      }
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      __int16 v21 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      BOOL v22 = self->_remoteAudioPaused;
      *(_DWORD *)buf = 136316418;
      uint64_t v25 = v20;
      __int16 v26 = 2080;
      __int16 v27 = "-[VCSessionParticipantRemote dispatchedSetRemoteAudioPaused:]";
      __int16 v28 = 1024;
      int v29 = 444;
      __int16 v30 = 2112;
      __int16 v31 = v6;
      __int16 v32 = 2048;
      __int16 v33 = self;
      __int16 v34 = 1024;
      BOOL v35 = v22;
      __int16 v15 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) setRemoteAudioPaused=%d";
      char v16 = v21;
      uint32_t v17 = 54;
    }
    _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
LABEL_24:
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __61__VCSessionParticipantRemote_dispatchedSetRemoteAudioPaused___block_invoke;
    v23[3] = &unk_1E6DB69A0;
    v23[4] = self;
    [(VCSessionParticipant *)self callDelegateWithBlock:v23];
    return;
  }
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint32_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v25 = v7;
        __int16 v26 = 2080;
        __int16 v27 = "-[VCSessionParticipantRemote dispatchedSetRemoteAudioPaused:]";
        __int16 v28 = 1024;
        int v29 = 449;
        __int16 v30 = 1024;
        LODWORD(v31) = v3;
        uint64_t v9 = "VCSessionParticipantRemote [%s] %s:%d Ignoring setRemoteAudioPaused=%d";
        uint64_t v10 = v8;
        uint32_t v11 = 34;
LABEL_18:
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      int v5 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      int v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      __int16 v19 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v25 = v18;
        __int16 v26 = 2080;
        __int16 v27 = "-[VCSessionParticipantRemote dispatchedSetRemoteAudioPaused:]";
        __int16 v28 = 1024;
        int v29 = 449;
        __int16 v30 = 2112;
        __int16 v31 = v5;
        __int16 v32 = 2048;
        __int16 v33 = self;
        __int16 v34 = 1024;
        BOOL v35 = v3;
        uint64_t v9 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Ignoring setRemoteAudioPaused=%d";
        uint64_t v10 = v19;
        uint32_t v11 = 54;
        goto LABEL_18;
      }
    }
  }
}

uint64_t __61__VCSessionParticipantRemote_dispatchedSetRemoteAudioPaused___block_invoke(uint64_t a1, void *a2)
{
  return [a2 vcSessionParticipant:*(void *)(a1 + 32) remoteAudioPausedDidChange:*(unsigned __int8 *)(*(void *)(a1 + 32) + 707)];
}

- (void)setRemoteAudioPaused:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__VCSessionParticipantRemote_setRemoteAudioPaused___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __51__VCSessionParticipantRemote_setRemoteAudioPaused___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedSetRemoteAudioPaused:*(unsigned __int8 *)(a1 + 40)];
}

- (void)dispatchedSetRemoteAudioEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (self->_remoteAudioEnabled != a3)
  {
    self->_BOOL remoteAudioEnabled = a3;
    [(VCSessionParticipantRemote *)self updateActiveStateForStreamGroup:[(VCSessionParticipantRemote *)self audioGroup]];
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_24;
      }
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      __int16 v13 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      BOOL remoteAudioEnabled = self->_remoteAudioEnabled;
      *(_DWORD *)buf = 136315906;
      uint64_t v25 = v12;
      __int16 v26 = 2080;
      __int16 v27 = "-[VCSessionParticipantRemote dispatchedSetRemoteAudioEnabled:]";
      __int16 v28 = 1024;
      int v29 = 463;
      __int16 v30 = 1024;
      LODWORD(v31) = remoteAudioEnabled;
      __int16 v15 = "VCSessionParticipantRemote [%s] %s:%d setRemoteAudioEnabled=%d";
      char v16 = v13;
      uint32_t v17 = 34;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v6 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_24;
      }
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      __int16 v21 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      BOOL v22 = self->_remoteAudioEnabled;
      *(_DWORD *)buf = 136316418;
      uint64_t v25 = v20;
      __int16 v26 = 2080;
      __int16 v27 = "-[VCSessionParticipantRemote dispatchedSetRemoteAudioEnabled:]";
      __int16 v28 = 1024;
      int v29 = 463;
      __int16 v30 = 2112;
      __int16 v31 = v6;
      __int16 v32 = 2048;
      __int16 v33 = self;
      __int16 v34 = 1024;
      BOOL v35 = v22;
      __int16 v15 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) setRemoteAudioEnabled=%d";
      char v16 = v21;
      uint32_t v17 = 54;
    }
    _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
LABEL_24:
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __62__VCSessionParticipantRemote_dispatchedSetRemoteAudioEnabled___block_invoke;
    v23[3] = &unk_1E6DB69A0;
    v23[4] = self;
    [(VCSessionParticipant *)self callDelegateWithBlock:v23];
    return;
  }
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint32_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v25 = v7;
        __int16 v26 = 2080;
        __int16 v27 = "-[VCSessionParticipantRemote dispatchedSetRemoteAudioEnabled:]";
        __int16 v28 = 1024;
        int v29 = 468;
        __int16 v30 = 1024;
        LODWORD(v31) = v3;
        uint64_t v9 = "VCSessionParticipantRemote [%s] %s:%d Ignoring setRemoteAudioEnabled:%d";
        uint64_t v10 = v8;
        uint32_t v11 = 34;
LABEL_18:
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      BOOL v5 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      BOOL v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      __int16 v19 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v25 = v18;
        __int16 v26 = 2080;
        __int16 v27 = "-[VCSessionParticipantRemote dispatchedSetRemoteAudioEnabled:]";
        __int16 v28 = 1024;
        int v29 = 468;
        __int16 v30 = 2112;
        __int16 v31 = v5;
        __int16 v32 = 2048;
        __int16 v33 = self;
        __int16 v34 = 1024;
        BOOL v35 = v3;
        uint64_t v9 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Ignoring setRemoteAudioEnabled:%d";
        uint64_t v10 = v19;
        uint32_t v11 = 54;
        goto LABEL_18;
      }
    }
  }
}

uint64_t __62__VCSessionParticipantRemote_dispatchedSetRemoteAudioEnabled___block_invoke(uint64_t a1, void *a2)
{
  return [a2 vcSessionParticipant:*(void *)(a1 + 32) remoteAudioEnabledDidChange:*(unsigned __int8 *)(*(void *)(a1 + 32) + 706)];
}

- (void)setRemoteAudioEnabled:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__VCSessionParticipantRemote_setRemoteAudioEnabled___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __52__VCSessionParticipantRemote_setRemoteAudioEnabled___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedSetRemoteAudioEnabled:*(unsigned __int8 *)(a1 + 40)];
}

- (id)updateActiveStateForStreamGroup:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)VCSessionParticipantRemote;
  id v5 = -[VCSessionParticipant updateActiveStateForStreamGroup:](&v7, sel_updateActiveStateForStreamGroup_);
  if ([a3 streamGroupID] == 1667329381) {
    [(VCSessionParticipantRemote *)self updateShouldEnableMLEnhance];
  }
  return v5;
}

- (void)setVideoPaused:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__VCSessionParticipantRemote_setVideoPaused___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __45__VCSessionParticipantRemote_setVideoPaused___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 377) = *(unsigned char *)(a1 + 40);
  [*(id *)(a1 + 32) updateAudioSpectrumState];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = (void *)[*(id *)(a1 + 32) cameraGroups];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(a1 + 32) updateActiveStateForStreamGroup:*(void *)(*((void *)&v12 + 1) + 8 * v6++)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v11 count:16];
    }
    while (v4);
  }
  objc_super v7 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__VCSessionParticipantRemote_setVideoPaused___block_invoke_2;
  v9[3] = &unk_1E6DB6978;
  v9[4] = v7;
  char v10 = *(unsigned char *)(a1 + 40);
  return [v7 callDelegateWithBlock:v9];
}

uint64_t __45__VCSessionParticipantRemote_setVideoPaused___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 vcSessionParticipant:*(void *)(a1 + 32) videoPaused:*(unsigned __int8 *)(a1 + 40) didSucceed:1 error:0];
}

- (void)dispatchedSetRemoteVideoEnabled:(BOOL)a3
{
  int v3 = a3;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  int remoteVideoEnabled = self->_remoteVideoEnabled;
  uint64_t v6 = (VCSessionParticipantRemote *)objc_opt_class();
  if (remoteVideoEnabled != v3)
  {
    if (v6 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        long long v15 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v36 = v14;
          __int16 v37 = 2080;
          long long v38 = "-[VCSessionParticipantRemote dispatchedSetRemoteVideoEnabled:]";
          __int16 v39 = 1024;
          int v40 = 504;
          __int16 v41 = 1024;
          LODWORD(v42) = v3;
          uint64_t v16 = "VCSessionParticipantRemote [%s] %s:%d setRemoteVideoEnabled:%d";
          uint32_t v17 = v15;
          uint32_t v18 = 34;
LABEL_23:
          _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v8 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v8 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v21 = VRTraceErrorLogLevelToCSTR();
        BOOL v22 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          uint64_t v36 = v21;
          __int16 v37 = 2080;
          long long v38 = "-[VCSessionParticipantRemote dispatchedSetRemoteVideoEnabled:]";
          __int16 v39 = 1024;
          int v40 = 504;
          __int16 v41 = 2112;
          uint64_t v42 = v8;
          __int16 v43 = 2048;
          uint64_t v44 = self;
          __int16 v45 = 1024;
          int v46 = v3;
          uint64_t v16 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) setRemoteVideoEnabled:%d";
          uint32_t v17 = v22;
          uint32_t v18 = 54;
          goto LABEL_23;
        }
      }
    }
    self->_int remoteVideoEnabled = v3;
    [(VCSessionParticipantRemote *)self updateAndHandleVideoMediaStall:self->_isRemoteMediaStalled isOneToOneStream:self->_oneToOneVideoEnabled];
    [(VCSessionParticipantRemote *)self updateAudioSpectrumState];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v23 = [(VCSessionParticipant *)self cameraGroups];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v31 objects:v30 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v32 != v26) {
            objc_enumerationMutation(v23);
          }
          __int16 v28 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          [v28 setRemoteVideoEnabled:self->_remoteVideoEnabled];
          [(VCSessionParticipantRemote *)self updateActiveStateForStreamGroup:v28];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v31 objects:v30 count:16];
      }
      while (v25);
    }
    goto LABEL_31;
  }
  if (v6 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      char v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v36 = v9;
        __int16 v37 = 2080;
        long long v38 = "-[VCSessionParticipantRemote dispatchedSetRemoteVideoEnabled:]";
        __int16 v39 = 1024;
        int v40 = 513;
        __int16 v41 = 1024;
        LODWORD(v42) = v3;
        uint32_t v11 = "VCSessionParticipantRemote [%s] %s:%d Ignoring setRemoteVideoEnabled:%d";
        long long v12 = v10;
        uint32_t v13 = 34;
LABEL_18:
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      objc_super v7 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      objc_super v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      uint64_t v20 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v36 = v19;
        __int16 v37 = 2080;
        long long v38 = "-[VCSessionParticipantRemote dispatchedSetRemoteVideoEnabled:]";
        __int16 v39 = 1024;
        int v40 = 513;
        __int16 v41 = 2112;
        uint64_t v42 = v7;
        __int16 v43 = 2048;
        uint64_t v44 = self;
        __int16 v45 = 1024;
        int v46 = v3;
        uint32_t v11 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Ignoring setRemoteVideoEnabled:%d";
        long long v12 = v20;
        uint32_t v13 = 54;
        goto LABEL_18;
      }
    }
  }
LABEL_31:
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __62__VCSessionParticipantRemote_dispatchedSetRemoteVideoEnabled___block_invoke;
  v29[3] = &unk_1E6DB69A0;
  v29[4] = self;
  [(VCSessionParticipant *)self callDelegateWithBlock:v29];
}

uint64_t __62__VCSessionParticipantRemote_dispatchedSetRemoteVideoEnabled___block_invoke(uint64_t a1, void *a2)
{
  return [a2 vcSessionParticipant:*(void *)(a1 + 32) remoteVideoEnabledDidChange:*(unsigned __int8 *)(*(void *)(a1 + 32) + 544)];
}

- (void)setRemoteVideoEnabled:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__VCSessionParticipantRemote_setRemoteVideoEnabled___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __52__VCSessionParticipantRemote_setRemoteVideoEnabled___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedSetRemoteVideoEnabled:*(unsigned __int8 *)(a1 + 40)];
}

- (void)dispatchedSetRemoteScreenEnabled:(BOOL)a3
{
  int v3 = a3;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  int remoteScreenEnabled = self->_remoteScreenEnabled;
  uint64_t v6 = (VCSessionParticipantRemote *)objc_opt_class();
  if (remoteScreenEnabled != v3)
  {
    if (v6 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_24;
      }
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      long long v15 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      *(_DWORD *)buf = 136315906;
      uint64_t v39 = v14;
      __int16 v40 = 2080;
      __int16 v41 = "-[VCSessionParticipantRemote dispatchedSetRemoteScreenEnabled:]";
      __int16 v42 = 1024;
      int v43 = 528;
      __int16 v44 = 1024;
      *(_DWORD *)__int16 v45 = v3;
      uint64_t v16 = "VCSessionParticipantRemote [%s] %s:%d setRemoteScreenEnabled:%d";
      uint32_t v17 = v15;
      uint32_t v18 = 34;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v8 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v8 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6
        || (uint64_t v21 = VRTraceErrorLogLevelToCSTR(),
            BOOL v22 = *MEMORY[0x1E4F47A50],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)))
      {
LABEL_24:
        self->_int remoteScreenEnabled = v3;
        id v23 = [(VCSessionParticipantRemote *)self screenGroup];
        [v23 setRemoteVideoEnabled:self->_remoteScreenEnabled];
        if (self->_remoteScreenEnabled)
        {
          [v23 start];
          objc_msgSend(-[VCSessionParticipant systemAudioGroup](self, "systemAudioGroup"), "start");
          BOOL v24 = 0;
        }
        else
        {
          [v23 stop];
          objc_msgSend(-[VCSessionParticipant systemAudioGroup](self, "systemAudioGroup"), "stop");
          BOOL v24 = 1;
        }
        self->_BOOL remoteSystemAudioPaused = v24;
        if ((VCSessionParticipantRemote *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
            goto LABEL_38;
          }
          uint64_t v26 = VRTraceErrorLogLevelToCSTR();
          __int16 v27 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_38;
          }
          int v28 = [v23 state];
          BOOL remoteSystemAudioPaused = self->_remoteSystemAudioPaused;
          *(_DWORD *)buf = 136316162;
          uint64_t v39 = v26;
          __int16 v40 = 2080;
          __int16 v41 = "-[VCSessionParticipantRemote dispatchedSetRemoteScreenEnabled:]";
          __int16 v42 = 1024;
          int v43 = 542;
          __int16 v44 = 1024;
          *(_DWORD *)__int16 v45 = v28;
          *(_WORD *)&v45[4] = 1024;
          *(_DWORD *)&v45[6] = remoteSystemAudioPaused;
          __int16 v30 = "VCSessionParticipantRemote [%s] %s:%d Screen state=%d changed, remoteSystemAudioPaused:%d";
          long long v31 = v27;
          uint32_t v32 = 40;
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            uint64_t v25 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
          }
          else {
            uint64_t v25 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
            goto LABEL_38;
          }
          uint64_t v33 = VRTraceErrorLogLevelToCSTR();
          long long v34 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_38;
          }
          int v35 = [v23 state];
          BOOL v36 = self->_remoteSystemAudioPaused;
          *(_DWORD *)buf = 136316674;
          uint64_t v39 = v33;
          __int16 v40 = 2080;
          __int16 v41 = "-[VCSessionParticipantRemote dispatchedSetRemoteScreenEnabled:]";
          __int16 v42 = 1024;
          int v43 = 542;
          __int16 v44 = 2112;
          *(void *)__int16 v45 = v25;
          *(_WORD *)&v45[8] = 2048;
          int v46 = self;
          __int16 v47 = 1024;
          int v48 = v35;
          __int16 v49 = 1024;
          BOOL v50 = v36;
          __int16 v30 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Screen state=%d changed, remoteSystemAudioPaused:%d";
          long long v31 = v34;
          uint32_t v32 = 60;
        }
        _os_log_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);
LABEL_38:
        self->_remoteScreenEnabledStateChanged = 1;
        goto LABEL_39;
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v39 = v21;
      __int16 v40 = 2080;
      __int16 v41 = "-[VCSessionParticipantRemote dispatchedSetRemoteScreenEnabled:]";
      __int16 v42 = 1024;
      int v43 = 528;
      __int16 v44 = 2112;
      *(void *)__int16 v45 = v8;
      *(_WORD *)&v45[8] = 2048;
      int v46 = self;
      __int16 v47 = 1024;
      int v48 = v3;
      uint64_t v16 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) setRemoteScreenEnabled:%d";
      uint32_t v17 = v22;
      uint32_t v18 = 54;
    }
    _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
    goto LABEL_24;
  }
  if (v6 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_39;
    }
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    char v10 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_39;
    }
    *(_DWORD *)buf = 136315906;
    uint64_t v39 = v9;
    __int16 v40 = 2080;
    __int16 v41 = "-[VCSessionParticipantRemote dispatchedSetRemoteScreenEnabled:]";
    __int16 v42 = 1024;
    int v43 = 545;
    __int16 v44 = 1024;
    *(_DWORD *)__int16 v45 = v3;
    uint32_t v11 = "VCSessionParticipantRemote [%s] %s:%d Ignoring setRemoteScreenEnabled:%d";
    long long v12 = v10;
    uint32_t v13 = 34;
    goto LABEL_18;
  }
  if (objc_opt_respondsToSelector()) {
    objc_super v7 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
  }
  else {
    objc_super v7 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    uint64_t v20 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v39 = v19;
      __int16 v40 = 2080;
      __int16 v41 = "-[VCSessionParticipantRemote dispatchedSetRemoteScreenEnabled:]";
      __int16 v42 = 1024;
      int v43 = 545;
      __int16 v44 = 2112;
      *(void *)__int16 v45 = v7;
      *(_WORD *)&v45[8] = 2048;
      int v46 = self;
      __int16 v47 = 1024;
      int v48 = v3;
      uint32_t v11 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Ignoring setRemoteScreenEnabled:%d";
      long long v12 = v20;
      uint32_t v13 = 54;
LABEL_18:
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
    }
  }
LABEL_39:
  if (self->_remoteScreenEnabledStateChanged)
  {
    self->_remoteScreenEnabledStateChanged = 0;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __63__VCSessionParticipantRemote_dispatchedSetRemoteScreenEnabled___block_invoke;
    v37[3] = &unk_1E6DB69A0;
    v37[4] = self;
    [(VCSessionParticipant *)self callDelegateWithBlock:v37];
  }
}

uint64_t __63__VCSessionParticipantRemote_dispatchedSetRemoteScreenEnabled___block_invoke(uint64_t a1, void *a2)
{
  return [a2 vcSessionParticipant:*(void *)(a1 + 32) remoteScreenEnabledDidChange:*(unsigned __int8 *)(*(void *)(a1 + 32) + 545)];
}

- (void)dispatchedSetScreenControlEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (self->_screenControlEnabled != a3)
  {
    BOOL v6 = +[VCDefaults BOOLeanValueForKey:@"forceScreenControlJitterBufferModeFixed" defaultValue:0];
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6
        || (uint64_t v13 = VRTraceErrorLogLevelToCSTR(),
            uint64_t v14 = *MEMORY[0x1E4F47A50],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)))
      {
LABEL_24:
        self->_screenControlEnabled = v3;
        int v28 = @"VCSPUUID";
        uuid = self->super._uuid;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&uuid forKeys:&v28 count:1];
        [(VCSessionParticipant *)self reportingAgent];
        reportingGenericEvent();
        BOOL v22 = objc_msgSend(-[VCSessionParticipantRemote systemAudioStreamInfo](self, "systemAudioStreamInfo"), "stream");
        id v23 = [(VCSessionParticipantMediaStreamInfo *)[(VCSessionParticipantRemote *)self screenStreamInfo] stream];
        if (v6) {
          unsigned int v24 = 3;
        }
        else {
          unsigned int v24 = 1;
        }
        if (self->_screenControlEnabled) {
          uint64_t v25 = v24;
        }
        else {
          uint64_t v25 = 2;
        }
        objc_msgSend(v22, "setJitterBufferMode:");
        [(VCMediaStream *)v23 setJitterBufferMode:v25];
        id v26 = [(NSArray *)[(VCSessionParticipantMediaStreamInfo *)[(VCSessionParticipantRemote *)self screenStreamInfo] streamConfigs] firstObject];
        if ([v26 looseAVSyncEnabled]) {
          [(VCMediaStream *)v23 setLooseAVSyncEnabled:!v3];
        }
        BOOL v27 = !v3;
        if ([v26 deferredAssemblyEnabled]) {
          [(VCMediaStream *)v23 setDeferredAssemblyEnabled:v27];
        }
        VCJBTargetEstimatorSynchronizer_SetPolicy([v26 jbTargetEstimatorSynchronizer], v27);
        return;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v31 = v13;
      __int16 v32 = 2080;
      uint64_t v33 = "-[VCSessionParticipantRemote dispatchedSetScreenControlEnabled:]";
      __int16 v34 = 1024;
      int v35 = 558;
      __int16 v36 = 1024;
      *(_DWORD *)__int16 v37 = v3;
      *(_WORD *)&v37[4] = 1024;
      *(_DWORD *)&v37[6] = v6;
      long long v15 = "VCSessionParticipantRemote [%s] %s:%d setScreenControlEnabled=%d forceScreenControlJitterBufferModeFixed=%d";
      uint64_t v16 = v14;
      uint32_t v17 = 40;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        objc_super v7 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
      }
      else {
        objc_super v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_24;
      }
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      uint64_t v21 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      *(_DWORD *)buf = 136316674;
      uint64_t v31 = v20;
      __int16 v32 = 2080;
      uint64_t v33 = "-[VCSessionParticipantRemote dispatchedSetScreenControlEnabled:]";
      __int16 v34 = 1024;
      int v35 = 558;
      __int16 v36 = 2112;
      *(void *)__int16 v37 = v7;
      *(_WORD *)&v37[8] = 2048;
      long long v38 = self;
      __int16 v39 = 1024;
      BOOL v40 = v3;
      __int16 v41 = 1024;
      BOOL v42 = v6;
      long long v15 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) setScreenControlEnabled=%d forceScreenControlJitterBufferModeFixed=%d";
      uint64_t v16 = v21;
      uint32_t v17 = 60;
    }
    _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
    goto LABEL_24;
  }
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v31 = v8;
        __int16 v32 = 2080;
        uint64_t v33 = "-[VCSessionParticipantRemote dispatchedSetScreenControlEnabled:]";
        __int16 v34 = 1024;
        int v35 = 583;
        __int16 v36 = 1024;
        *(_DWORD *)__int16 v37 = v3;
        char v10 = "VCSessionParticipantRemote [%s] %s:%d Ignoring setScreenControlEnabled:%d";
        uint32_t v11 = v9;
        uint32_t v12 = 34;
LABEL_18:
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      BOOL v5 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      BOOL v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      uint64_t v19 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v31 = v18;
        __int16 v32 = 2080;
        uint64_t v33 = "-[VCSessionParticipantRemote dispatchedSetScreenControlEnabled:]";
        __int16 v34 = 1024;
        int v35 = 583;
        __int16 v36 = 2112;
        *(void *)__int16 v37 = v5;
        *(_WORD *)&v37[8] = 2048;
        long long v38 = self;
        __int16 v39 = 1024;
        BOOL v40 = v3;
        char v10 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Ignoring setScreenControlEnabled:%d";
        uint32_t v11 = v19;
        uint32_t v12 = 54;
        goto LABEL_18;
      }
    }
  }
}

- (void)setScreenControlEnabled:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__VCSessionParticipantRemote_setScreenControlEnabled___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __54__VCSessionParticipantRemote_setScreenControlEnabled___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedSetScreenControlEnabled:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setRemoteScreenEnabled:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__VCSessionParticipantRemote_setRemoteScreenEnabled___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __53__VCSessionParticipantRemote_setRemoteScreenEnabled___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedSetRemoteScreenEnabled:*(unsigned __int8 *)(a1 + 40)];
}

- (void)dispatchedSetRemoteSystemAudioPaused:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__VCSessionParticipantRemote_dispatchedSetRemoteSystemAudioPaused___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  BOOL v5 = a3;
  block[4] = self;
  dispatch_async(participantQueue, block);
}

void __67__VCSessionParticipantRemote_dispatchedSetRemoteSystemAudioPaused___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(a1 + 40);
  int v3 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 547);
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = *(void *)(a1 + 32);
  if (v2 != v3)
  {
    if (v4 == v5)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_24;
      }
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      long long v15 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      int v16 = *(unsigned __int8 *)(a1 + 40);
      int v29 = 136315906;
      uint64_t v30 = v14;
      __int16 v31 = 2080;
      __int16 v32 = "-[VCSessionParticipantRemote dispatchedSetRemoteSystemAudioPaused:]_block_invoke";
      __int16 v33 = 1024;
      int v34 = 602;
      __int16 v35 = 1024;
      LODWORD(v36) = v16;
      uint32_t v17 = "VCSessionParticipantRemote [%s] %s:%d setRemoteSystemAudioPaused:%d";
      uint64_t v18 = v15;
      uint32_t v19 = 34;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        objc_super v7 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        objc_super v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_24;
      }
      uint64_t v24 = VRTraceErrorLogLevelToCSTR();
      uint64_t v25 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      uint64_t v26 = *(void *)(a1 + 32);
      int v27 = *(unsigned __int8 *)(a1 + 40);
      int v29 = 136316418;
      uint64_t v30 = v24;
      __int16 v31 = 2080;
      __int16 v32 = "-[VCSessionParticipantRemote dispatchedSetRemoteSystemAudioPaused:]_block_invoke";
      __int16 v33 = 1024;
      int v34 = 602;
      __int16 v35 = 2112;
      __int16 v36 = v7;
      __int16 v37 = 2048;
      uint64_t v38 = v26;
      __int16 v39 = 1024;
      int v40 = v27;
      uint32_t v17 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) setRemoteSystemAudioPaused:%d";
      uint64_t v18 = v25;
      uint32_t v19 = 54;
    }
    _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v29, v19);
LABEL_24:
    *(unsigned char *)(*(void *)(a1 + 32) + 547) = *(unsigned char *)(a1 + 40);
    int v28 = *(unsigned char **)(a1 + 32);
    if (v28[547])
    {
      objc_msgSend((id)objc_msgSend(v28, "systemAudioGroup"), "pause");
      [*(id *)(a1 + 32) swapScreenStreamGroupSyncSourceWithState:2];
    }
    else
    {
      [v28 swapScreenStreamGroupSyncSourceWithState:1];
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "systemAudioGroup"), "resume");
    }
    return;
  }
  if (v4 == v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = *(unsigned __int8 *)(a1 + 40);
        int v29 = 136315906;
        uint64_t v30 = v8;
        __int16 v31 = 2080;
        __int16 v32 = "-[VCSessionParticipantRemote dispatchedSetRemoteSystemAudioPaused:]_block_invoke";
        __int16 v33 = 1024;
        int v34 = 612;
        __int16 v35 = 1024;
        LODWORD(v36) = v10;
        uint32_t v11 = "VCSessionParticipantRemote [%s] %s:%d Ignoring setRemoteSystemAudioPaused:%d";
        uint32_t v12 = v9;
        uint32_t v13 = 34;
LABEL_18:
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v29, v13);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v6 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      uint64_t v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      uint64_t v21 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = *(void *)(a1 + 32);
        int v23 = *(unsigned __int8 *)(a1 + 40);
        int v29 = 136316418;
        uint64_t v30 = v20;
        __int16 v31 = 2080;
        __int16 v32 = "-[VCSessionParticipantRemote dispatchedSetRemoteSystemAudioPaused:]_block_invoke";
        __int16 v33 = 1024;
        int v34 = 612;
        __int16 v35 = 2112;
        __int16 v36 = v6;
        __int16 v37 = 2048;
        uint64_t v38 = v22;
        __int16 v39 = 1024;
        int v40 = v23;
        uint32_t v11 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Ignoring setRemoteSystemAudioPaused:%d";
        uint32_t v12 = v21;
        uint32_t v13 = 54;
        goto LABEL_18;
      }
    }
  }
}

- (void)setRemoteSystemAudioPaused:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__VCSessionParticipantRemote_setRemoteSystemAudioPaused___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __57__VCSessionParticipantRemote_setRemoteSystemAudioPaused___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedSetRemoteSystemAudioPaused:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setTransitionToEnabled:(unsigned int)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)&a3;
  switch(a3)
  {
    case 0u:
      [(VCSessionParticipantRemote *)self dispatchedSetRemoteAudioEnabled:1];
      [(VCSessionParticipantRemote *)self dispatchedSetRemoteAudioPaused:0];
      break;
    case 1u:
      [(VCSessionParticipantRemote *)self dispatchedSetRemoteVideoEnabled:1];
      [(VCSessionParticipantRemote *)self dispatchedSetRemoteVideoPaused:0];
      break;
    case 2u:
      [(VCSessionParticipantRemote *)self dispatchedSetRemoteScreenEnabled:1];
      break;
    case 3u:
      [(VCSessionParticipant *)self swapScreenStreamGroupSyncSourceWithState:1];
      id v6 = [(VCSessionParticipant *)self streamGroupWithID:1937339233];
      [v6 resume];
      break;
    case 4u:
    case 5u:
    case 6u:
    case 7u:
    case 8u:
      if ([(VCSessionParticipant *)self updateMediaState:1 forStreamGroups:[(VCSessionParticipant *)self streamGroupsForMediaType:*(void *)&a3]])
      {
        if ((VCSessionParticipantRemote *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCSessionParticipantRemote setTransitionToEnabled:]();
            }
          }
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            BOOL v5 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
          }
          else {
            BOOL v5 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v7 = VRTraceErrorLogLevelToCSTR();
            uint64_t v8 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
            {
              int v9 = 136316418;
              uint64_t v10 = v7;
              __int16 v11 = 2080;
              uint32_t v12 = "-[VCSessionParticipantRemote setTransitionToEnabled:]";
              __int16 v13 = 1024;
              int v14 = 648;
              __int16 v15 = 2112;
              int v16 = v5;
              __int16 v17 = 2048;
              uint64_t v18 = self;
              __int16 v19 = 2112;
              uint64_t v20 = VCSessionMediaType_Name(v3);
              _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to update mediaState=enabled for mediaType=%@", (uint8_t *)&v9, 0x3Au);
            }
          }
        }
      }
      break;
    default:
      return;
  }
}

- (void)setTransitionToPaused:(unsigned int)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)&a3;
  switch(a3)
  {
    case 0u:
      [(VCSessionParticipantRemote *)self dispatchedSetRemoteAudioPaused:1];
      break;
    case 1u:
      if (!self->_remoteVideoEnabled) {
        [(VCSessionParticipantRemote *)self dispatchedSetRemoteVideoEnabled:1];
      }
      [(VCSessionParticipantRemote *)self dispatchedSetRemoteVideoPaused:1];
      break;
    case 2u:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantRemote setTransitionToPaused:]();
        }
      }
      break;
    case 3u:
      objc_msgSend(-[VCSessionParticipant streamGroupWithID:](self, "streamGroupWithID:", 1937339233), "pause");
      [(VCSessionParticipant *)self swapScreenStreamGroupSyncSourceWithState:2];
      break;
    case 4u:
    case 5u:
    case 6u:
    case 7u:
    case 8u:
      if ([(VCSessionParticipant *)self updateMediaState:2 forStreamGroups:[(VCSessionParticipant *)self streamGroupsForMediaType:*(void *)&a3]])
      {
        if ((VCSessionParticipantRemote *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCSessionParticipantRemote setTransitionToPaused:]();
            }
          }
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            BOOL v5 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
          }
          else {
            BOOL v5 = &stru_1F3D3E450;
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
              __int16 v11 = "-[VCSessionParticipantRemote setTransitionToPaused:]";
              __int16 v12 = 1024;
              int v13 = 682;
              __int16 v14 = 2112;
              __int16 v15 = v5;
              __int16 v16 = 2048;
              __int16 v17 = self;
              __int16 v18 = 2112;
              __int16 v19 = VCSessionMediaType_Name(v3);
              _os_log_error_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to update mediaState=paused for mediaType=%@", (uint8_t *)&v8, 0x3Au);
            }
          }
        }
      }
      break;
    default:
      return;
  }
}

- (void)setTransitionToDisabled:(unsigned int)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)&a3;
  switch(a3)
  {
    case 0u:
      [(VCSessionParticipantRemote *)self dispatchedSetRemoteAudioEnabled:0];
      break;
    case 1u:
      [(VCSessionParticipantRemote *)self dispatchedSetRemoteVideoEnabled:0];
      break;
    case 2u:
      [(VCSessionParticipantRemote *)self dispatchedSetRemoteScreenEnabled:0];
      break;
    case 4u:
    case 5u:
    case 6u:
    case 7u:
    case 8u:
      if ([(VCSessionParticipant *)self updateMediaState:0 forStreamGroups:[(VCSessionParticipant *)self streamGroupsForMediaType:*(void *)&a3]])
      {
        if ((VCSessionParticipantRemote *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCSessionParticipantRemote setTransitionToDisabled:]();
            }
          }
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            BOOL v5 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
          }
          else {
            BOOL v5 = &stru_1F3D3E450;
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
              __int16 v11 = "-[VCSessionParticipantRemote setTransitionToDisabled:]";
              __int16 v12 = 1024;
              int v13 = 708;
              __int16 v14 = 2112;
              __int16 v15 = v5;
              __int16 v16 = 2048;
              __int16 v17 = self;
              __int16 v18 = 2112;
              __int16 v19 = VCSessionMediaType_Name(v3);
              _os_log_error_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to update mediaState=disabled for mediaType=%@", (uint8_t *)&v8, 0x3Au);
            }
          }
        }
      }
      break;
    default:
      return;
  }
}

- (id)updateMediaState:(unsigned int)a3 forStreamGroup:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = -[VCSessionParticipant updateMediaState:forStreamGroups:](self, "updateMediaState:forStreamGroups:", *(void *)&a3, [MEMORY[0x1E4F1CAD0] setWithObject:a4]);
  if (v6)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantRemote updateMediaState:forStreamGroup:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v7 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        uint64_t v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v11 = 136316418;
          uint64_t v12 = v8;
          __int16 v13 = 2080;
          __int16 v14 = "-[VCSessionParticipantRemote updateMediaState:forStreamGroup:]";
          __int16 v15 = 1024;
          int v16 = 720;
          __int16 v17 = 2112;
          __int16 v18 = v7;
          __int16 v19 = 2048;
          uint64_t v20 = self;
          __int16 v21 = 2112;
          uint64_t v22 = VCSessionMediaType_Name([a4 mediaType]);
          _os_log_error_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to update mediaState=disabled for mediaType=%@", (uint8_t *)&v11, 0x3Au);
        }
      }
    }
  }
  return v6;
}

- (void)setRemoteMediaState:(id)a3 forMediaType:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [a4 unsignedIntValue];
  uint64_t v8 = [a3 unsignedIntValue];
  uint64_t v9 = [(NSMutableDictionary *)self->_remoteMediaStates objectForKeyedSubscript:a4];
  if (!v9 || [a3 isEqualToNumber:v9])
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_17;
      }
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      __int16 v13 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      __int16 v14 = VCSessionMediaState_Name(v8);
      __int16 v15 = VCSessionMediaType_Name(v7);
      remoteMediaStates = self->_remoteMediaStates;
      *(_DWORD *)__int16 v32 = 136316418;
      *(void *)&v32[4] = v12;
      *(_WORD *)&v32[12] = 2080;
      *(void *)&v32[14] = "-[VCSessionParticipantRemote setRemoteMediaState:forMediaType:]";
      *(_WORD *)&v32[22] = 1024;
      LODWORD(v33) = 730;
      WORD2(v33) = 2112;
      *(void *)((char *)&v33 + 6) = v14;
      HIWORD(v33) = 2112;
      int v34 = v15;
      *(_WORD *)__int16 v35 = 2112;
      *(void *)&v35[2] = remoteMediaStates;
      __int16 v17 = "VCSessionParticipantRemote [%s] %s:%d Setting remote mediaState=%@ for mediaType=%@ _remoteMediaStates=%@";
      __int16 v18 = v13;
      uint32_t v19 = 58;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v10 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v10 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_17;
      }
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      __int16 v21 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      uint64_t v22 = VCSessionMediaState_Name(v8);
      uint64_t v23 = VCSessionMediaType_Name(v7);
      uint64_t v24 = self->_remoteMediaStates;
      *(_DWORD *)__int16 v32 = 136316930;
      *(void *)&v32[4] = v20;
      *(_WORD *)&v32[12] = 2080;
      *(void *)&v32[14] = "-[VCSessionParticipantRemote setRemoteMediaState:forMediaType:]";
      *(_WORD *)&v32[22] = 1024;
      LODWORD(v33) = 730;
      WORD2(v33) = 2112;
      *(void *)((char *)&v33 + 6) = v10;
      HIWORD(v33) = 2048;
      int v34 = self;
      *(_WORD *)__int16 v35 = 2112;
      *(void *)&v35[2] = v22;
      *(_WORD *)&v35[10] = 2112;
      *(void *)&v35[12] = v23;
      *(_WORD *)&v35[20] = 2112;
      *(void *)&v35[22] = v24;
      __int16 v17 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Setting remote mediaState=%@ for mediaType=%@ _remoteMediaStates=%@";
      __int16 v18 = v21;
      uint32_t v19 = 78;
    }
    _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, v17, v32, v19);
LABEL_17:
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_remoteMediaStates, "setObject:forKeyedSubscript:", a3, a4, *(_OWORD *)v32, *(void *)&v32[16], v33, v34, *(_OWORD *)v35, *(_OWORD *)&v35[16]);
    objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._mediaTypeSettingsDict, "objectForKeyedSubscript:", a4), "setRemoteMediaState:", objc_msgSend(a3, "unsignedIntValue"));
    if (v8)
    {
      if (v8 == 2)
      {
        [(VCSessionParticipantRemote *)self setTransitionToPaused:v7];
      }
      else if (v8 == 1)
      {
        [(VCSessionParticipantRemote *)self setTransitionToEnabled:v7];
      }
    }
    else
    {
      [(VCSessionParticipantRemote *)self setTransitionToDisabled:v7];
    }
    return;
  }
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v25 = VRTraceErrorLogLevelToCSTR();
      uint64_t v26 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int16 v32 = 136316162;
        *(void *)&v32[4] = v25;
        *(_WORD *)&v32[12] = 2080;
        *(void *)&v32[14] = "-[VCSessionParticipantRemote setRemoteMediaState:forMediaType:]";
        *(_WORD *)&v32[22] = 1024;
        LODWORD(v33) = 746;
        WORD2(v33) = 2112;
        *(void *)((char *)&v33 + 6) = VCSessionMediaState_Name(v8);
        HIWORD(v33) = 2112;
        int v34 = VCSessionMediaType_Name(v7);
        int v27 = "VCSessionParticipantRemote [%s] %s:%d Ignoring setRemoteState=%@ forMediaType=%@";
        int v28 = v26;
        uint32_t v29 = 48;
LABEL_30:
        _os_log_impl(&dword_1E1EA4000, v28, OS_LOG_TYPE_DEFAULT, v27, v32, v29);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      int v11 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      int v11 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v30 = VRTraceErrorLogLevelToCSTR();
      __int16 v31 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int16 v32 = 136316674;
        *(void *)&v32[4] = v30;
        *(_WORD *)&v32[12] = 2080;
        *(void *)&v32[14] = "-[VCSessionParticipantRemote setRemoteMediaState:forMediaType:]";
        *(_WORD *)&v32[22] = 1024;
        LODWORD(v33) = 746;
        WORD2(v33) = 2112;
        *(void *)((char *)&v33 + 6) = v11;
        HIWORD(v33) = 2048;
        int v34 = self;
        *(_WORD *)__int16 v35 = 2112;
        *(void *)&v35[2] = VCSessionMediaState_Name(v8);
        *(_WORD *)&v35[10] = 2112;
        *(void *)&v35[12] = VCSessionMediaType_Name(v7);
        int v27 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Ignoring setRemoteState=%@ forMediaType=%@";
        int v28 = v31;
        uint32_t v29 = 68;
        goto LABEL_30;
      }
    }
  }
}

- (id)newSupportedRemoteMediaTypeStatesDict:(id)a3
{
  v7[7] = *MEMORY[0x1E4F143B8];
  BOOL v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a3, "count"));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__VCSessionParticipantRemote_newSupportedRemoteMediaTypeStatesDict___block_invoke;
  v7[3] = &unk_1E6DB69C8;
  v7[4] = self;
  v7[5] = v5;
  v7[6] = a3;
  [a3 enumerateKeysAndObjectsUsingBlock:v7];
  return v5;
}

void __68__VCSessionParticipantRemote_newSupportedRemoteMediaTypeStatesDict___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 384) objectForKeyedSubscript:a2])
  {
    uint64_t v6 = [*(id *)(a1 + 48) objectForKeyedSubscript:a2];
    uint64_t v7 = *(void **)(a1 + 40);
    [v7 setObject:v6 forKeyedSubscript:a2];
    return;
  }
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return;
    }
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    __int16 v10 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v17 = 136316162;
    uint64_t v18 = v9;
    __int16 v19 = 2080;
    uint64_t v20 = "-[VCSessionParticipantRemote newSupportedRemoteMediaTypeStatesDict:]_block_invoke";
    __int16 v21 = 1024;
    int v22 = 758;
    __int16 v23 = 2112;
    uint64_t v24 = VCSessionMediaType_Name([a2 unsignedIntValue]);
    __int16 v25 = 2112;
    uint64_t v26 = VCSessionMediaState_Name([a3 unsignedIntValue]);
    int v11 = "VCSessionParticipantRemote [%s] %s:%d mediaType=%@ not supported. Ignore set remote mediaState=%@";
    uint64_t v12 = v10;
    uint32_t v13 = 48;
LABEL_15:
    _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v17, v13);
    return;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v8 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
  }
  else {
    uint64_t v8 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    __int16 v15 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v16 = *(__CFString **)(a1 + 32);
      int v17 = 136316674;
      uint64_t v18 = v14;
      __int16 v19 = 2080;
      uint64_t v20 = "-[VCSessionParticipantRemote newSupportedRemoteMediaTypeStatesDict:]_block_invoke";
      __int16 v21 = 1024;
      int v22 = 758;
      __int16 v23 = 2112;
      uint64_t v24 = v8;
      __int16 v25 = 2048;
      uint64_t v26 = v16;
      __int16 v27 = 2112;
      int v28 = VCSessionMediaType_Name([a2 unsignedIntValue]);
      __int16 v29 = 2112;
      uint64_t v30 = VCSessionMediaState_Name([a3 unsignedIntValue]);
      int v11 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) mediaType=%@ not supported. Ignore set remote mediaState=%@";
      uint64_t v12 = v15;
      uint32_t v13 = 68;
      goto LABEL_15;
    }
  }
}

- (void)setRemoteMediaTypeStates:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__VCSessionParticipantRemote_setRemoteMediaTypeStates___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a3;
  dispatch_async(participantQueue, block);
}

void __55__VCSessionParticipantRemote_setRemoteMediaTypeStates___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) cancelAndReleaseFetchTimer];
  uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  uint64_t v3 = (void *)[*(id *)(a1 + 32) newSupportedRemoteMediaTypeStatesDict:*(void *)(a1 + 40)];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __55__VCSessionParticipantRemote_setRemoteMediaTypeStates___block_invoke_2;
  v23[3] = &unk_1E6DB69F0;
  v23[4] = *(void *)(a1 + 32);
  void v23[5] = v2;
  __int16 v19 = (void *)v2;
  [v3 enumerateKeysAndObjectsUsingBlock:v23];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v4 = (void *)[v3 allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(a1 + 32), "setRemoteMediaState:forMediaType:", objc_msgSend(v3, "objectForKeyedSubscript:", *(void *)(*((void *)&v30 + 1) + 8 * i)), *(void *)(*((void *)&v30 + 1) + 8 * i));
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v30 objects:v29 count:16];
    }
    while (v6);
  }
  objc_msgSend(*(id *)(a1 + 32), "updateAudioSpectrumState", v3);
  [*(id *)(a1 + 32) detectConnectionTimingSource];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v9 = (void *)[v19 allKeys];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v25 + 1) + 8 * j);
        int v15 = [v14 unsignedIntValue];
        int v16 = objc_msgSend((id)objc_msgSend(v19, "objectForKeyedSubscript:", v14), "unsignedIntValue");
        int v17 = *(void **)(a1 + 32);
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __55__VCSessionParticipantRemote_setRemoteMediaTypeStates___block_invoke_3;
        v20[3] = &unk_1E6DB6A18;
        v20[4] = v17;
        int v21 = v16;
        int v22 = v15;
        [v17 callDelegateWithBlock:v20];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v24 count:16];
    }
    while (v11);
  }
}

uint64_t __55__VCSessionParticipantRemote_setRemoteMediaTypeStates___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (void *)[*(id *)(*(void *)(a1 + 32) + 720) objectForKeyedSubscript:a2];
  if (!v6 || (uint64_t result = [v6 isEqualToNumber:a3], (result & 1) == 0))
  {
    [*(id *)(*(void *)(a1 + 32) + 720) setObject:a3 forKeyedSubscript:a2];
    uint64_t v8 = *(void **)(a1 + 40);
    return [v8 setObject:a3 forKeyedSubscript:a2];
  }
  return result;
}

uint64_t __55__VCSessionParticipantRemote_setRemoteMediaTypeStates___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 vcSessionParticipant:*(void *)(a1 + 32) remoteMediaStateDidChange:*(unsigned int *)(a1 + 40) forMediaType:*(unsigned int *)(a1 + 44)];
}

- (unsigned)remoteMediaStateForMediaType:(unsigned int)a3
{
  uint64_t v3 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_remoteMediaStates, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:*(void *)&a3]);

  return [v3 unsignedIntValue];
}

- (void)dispatchedSetRemoteVideoPaused:(BOOL)a3
{
  int v3 = a3;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  int remoteVideoPaused = self->_remoteVideoPaused;
  uint64_t v6 = (VCSessionParticipantRemote *)objc_opt_class();
  if (remoteVideoPaused != v3)
  {
    if (v6 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_24;
      }
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      int v15 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      *(_DWORD *)buf = 136315906;
      uint64_t v36 = v14;
      __int16 v37 = 2080;
      uint64_t v38 = "-[VCSessionParticipantRemote dispatchedSetRemoteVideoPaused:]";
      __int16 v39 = 1024;
      int v40 = 806;
      __int16 v41 = 1024;
      LODWORD(v42) = v3;
      int v16 = "VCSessionParticipantRemote [%s] %s:%d setRemoteVideoPaused=%d";
      int v17 = v15;
      uint32_t v18 = 34;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v8 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v8 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_24;
      }
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      int v22 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v36 = v21;
      __int16 v37 = 2080;
      uint64_t v38 = "-[VCSessionParticipantRemote dispatchedSetRemoteVideoPaused:]";
      __int16 v39 = 1024;
      int v40 = 806;
      __int16 v41 = 2112;
      BOOL v42 = v8;
      __int16 v43 = 2048;
      __int16 v44 = self;
      __int16 v45 = 1024;
      int v46 = v3;
      int v16 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) setRemoteVideoPaused=%d";
      int v17 = v22;
      uint32_t v18 = 54;
    }
    _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
LABEL_24:
    self->_int remoteVideoPaused = v3;
    [(VCSessionParticipantRemote *)self updateAndHandleVideoMediaStall:self->_isRemoteMediaStalled isOneToOneStream:self->_oneToOneVideoEnabled];
    [(VCSessionParticipantRemote *)self updateAudioSpectrumState];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v23 = [(VCSessionParticipant *)self cameraGroups];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v31 objects:v30 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v32 != v26) {
            objc_enumerationMutation(v23);
          }
          long long v28 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          [v28 setRemoteVideoPaused:self->_remoteVideoPaused];
          [(VCSessionParticipantRemote *)self updateActiveStateForStreamGroup:v28];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v31 objects:v30 count:16];
      }
      while (v25);
    }
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __61__VCSessionParticipantRemote_dispatchedSetRemoteVideoPaused___block_invoke;
    v29[3] = &unk_1E6DB69A0;
    v29[4] = self;
    [(VCSessionParticipant *)self callDelegateWithBlock:v29];
    return;
  }
  if (v6 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v36 = v9;
        __int16 v37 = 2080;
        uint64_t v38 = "-[VCSessionParticipantRemote dispatchedSetRemoteVideoPaused:]";
        __int16 v39 = 1024;
        int v40 = 818;
        __int16 v41 = 1024;
        LODWORD(v42) = v3;
        uint64_t v11 = "VCSessionParticipantRemote [%s] %s:%d Ignoring setRemoteVideoPaused=%d";
        uint64_t v12 = v10;
        uint32_t v13 = 34;
LABEL_18:
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v7 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      uint64_t v20 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v36 = v19;
        __int16 v37 = 2080;
        uint64_t v38 = "-[VCSessionParticipantRemote dispatchedSetRemoteVideoPaused:]";
        __int16 v39 = 1024;
        int v40 = 818;
        __int16 v41 = 2112;
        BOOL v42 = v7;
        __int16 v43 = 2048;
        __int16 v44 = self;
        __int16 v45 = 1024;
        int v46 = v3;
        uint64_t v11 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Ignoring setRemoteVideoPaused=%d";
        uint64_t v12 = v20;
        uint32_t v13 = 54;
        goto LABEL_18;
      }
    }
  }
}

uint64_t __61__VCSessionParticipantRemote_dispatchedSetRemoteVideoPaused___block_invoke(uint64_t a1, void *a2)
{
  return [a2 vcSessionParticipant:*(void *)(a1 + 32) remoteVideoPausedDidChange:*(unsigned __int8 *)(*(void *)(a1 + 32) + 546)];
}

- (void)setRemoteVideoPaused:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__VCSessionParticipantRemote_setRemoteVideoPaused___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __51__VCSessionParticipantRemote_setRemoteVideoPaused___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedSetRemoteVideoPaused:*(unsigned __int8 *)(a1 + 40)];
}

- (id)applyVideoEnabledSetting:(BOOL)a3
{
  int v3 = a3;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v28 = v6;
        __int16 v29 = 2080;
        long long v30 = "-[VCSessionParticipantRemote applyVideoEnabledSetting:]";
        __int16 v31 = 1024;
        int v32 = 831;
        __int16 v33 = 1024;
        LODWORD(v34) = v3;
        uint64_t v8 = "VCSessionParticipantRemote [%s] %s:%d Changing participant videoEnabled to %d";
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
      BOOL v5 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      BOOL v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v28 = v11;
        __int16 v29 = 2080;
        long long v30 = "-[VCSessionParticipantRemote applyVideoEnabledSetting:]";
        __int16 v31 = 1024;
        int v32 = 831;
        __int16 v33 = 2112;
        long long v34 = v5;
        __int16 v35 = 2048;
        uint64_t v36 = self;
        __int16 v37 = 1024;
        int v38 = v3;
        uint64_t v8 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Changing participant videoEnabled to %d";
        uint64_t v9 = v12;
        uint32_t v10 = 54;
        goto LABEL_11;
      }
    }
  }
  int videoEnabled = self->super._videoEnabled;
  self->super._int videoEnabled = v3;
  [(VCSessionParticipantRemote *)self updateAudioSpectrumState];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v14 = [(VCSessionParticipant *)self cameraGroups];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v22 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = [(VCSessionParticipantRemote *)self updateActiveStateForStreamGroup:*(void *)(*((void *)&v23 + 1) + 8 * i)];
        if (v19)
        {
          uint64_t v20 = v19;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCSessionParticipantRemote applyVideoEnabledSetting:]();
            }
          }
          return v20;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v22 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
  if (videoEnabled != v3 && self->super._oneToOneModeEnabled) {
    objc_msgSend(-[VCSessionParticipant microphoneGroup](self, "microphoneGroup"), "setDeviceRole:operatingMode:", -[VCSessionParticipantOneToOneConfig deviceRole](-[VCSessionParticipant oneToOneConfig](self, "oneToOneConfig"), "deviceRole"), -[VCSessionParticipant operatingMode](self, "operatingMode"));
  }
  return 0;
}

- (void)updateDownlinkBandwithAllocatorClientConfigurations:(id)a3
{
  -[VCSessionParticipantRemote setVideoQuality:](self, "setVideoQuality:", [a3 videoQuality]);
  -[VCSessionParticipantRemote setVisibilityIndex:](self, "setVisibilityIndex:", [a3 visibilityIndex]);

  [(VCSessionParticipantRemote *)self updateAudioSpectrumState];
}

- (void)setVideoQuality:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v17[1] = *MEMORY[0x1E4F143B8];
  int videoQuality = self->_videoQuality;
  if (a3 != 10 && videoQuality == 10 || a3 == 10 && videoQuality != 10)
  {
    [(VCSessionParticipant *)self reportingAgent];
    uint64_t v16 = @"VCSPUUID";
    v17[0] = self->super._uuid;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    reportingGenericEvent();
  }
  self->_int videoQuality = v3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [(VCSessionParticipant *)self cameraGroupsExt];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) setVideoQuality:v3];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v11 count:16];
    }
    while (v8);
  }
  [(VCSessionParticipant *)self participantVideoToken];
  kdebug_trace();
  [(VCSessionParticipantRemote *)self updateShouldEnableFaceZoom];
  [(VCSessionParticipantRemote *)self updateShouldEnableMLEnhance];
}

- (void)setVisibilityIndex:(unsigned int)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__VCSessionParticipantRemote_setVisibilityIndex___block_invoke;
  block[3] = &unk_1E6DB3F08;
  block[4] = self;
  unsigned int v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __49__VCSessionParticipantRemote_setVisibilityIndex___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(_DWORD *)(*(void *)(a1 + 32) + 552) = +[VCDefaults integerValueForKey:@"forceVisibilityIndex" defaultValue:*(unsigned int *)(a1 + 40)];
  [*(id *)(a1 + 32) participantVideoToken];
  kdebug_trace();
  [*(id *)(a1 + 32) updateAndHandleVideoMediaStall:*(unsigned __int8 *)(*(void *)(a1 + 32) + 578) isOneToOneStream:*(unsigned __int8 *)(*(void *)(a1 + 32) + 626)];
  [*(id *)(a1 + 32) updateAudioSpectrumState];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = (void *)[*(id *)(a1 + 32) cameraGroupsExt];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        [v7 setVisibilityIndex:*(unsigned int *)(a1 + 40)];
        [*(id *)(a1 + 32) updateActiveStateForStreamGroup:v7];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v9 count:16];
    }
    while (v4);
  }
  [*(id *)(a1 + 32) updateShouldEnableFaceZoom];
  return [*(id *)(a1 + 32) updateShouldEnableMLEnhance];
}

- (void)setProminenceIndex:(unsigned int)a3
{
  self->_prominenceIndex = +[VCDefaults integerValueForKey:@"forceProminenceIndex" defaultValue:a3];
  [(VCSessionParticipant *)self participantVideoToken];

  kdebug_trace();
}

- (void)updatePositionalInfo:(id)a3 shouldReapply:(BOOL)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a3 && (uint64_t v6 = self->_positionalInfo) != 0)
  {
    BOOL v7 = a4;
    [(VCPositionalInfo *)v6 unserialize:a3];
    [(VCSessionParticipantRemote *)self updateShouldEnableMLEnhance];
    if ([(VCPositionalInfo *)self->_positionalInfo hasPendingChanges] || v7)
    {
      uint64_t v8 = [(VCSessionParticipantRemote *)self spatialMetadataEntryForMediaType:0];
      uint64_t v9 = [(VCPositionalInfo *)self->_positionalInfo metadataPositionalInfo];
      VCSpatialAudioMetadata_UpdatePositionalInfo((uint64_t)v8, (long long *)v9);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    long long v11 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      positionalInfo = self->_positionalInfo;
      int v13 = 136316162;
      uint64_t v14 = v10;
      __int16 v15 = 2080;
      uint64_t v16 = "-[VCSessionParticipantRemote updatePositionalInfo:shouldReapply:]";
      __int16 v17 = 1024;
      int v18 = 891;
      __int16 v19 = 2048;
      id v20 = a3;
      __int16 v21 = 2048;
      int v22 = positionalInfo;
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, "VCSessionParticipantRemote [%s] %s:%d [AVC SPATIAL AUDIO] Positional info not available: positionalInfo=%p _positionalInfo=%p", (uint8_t *)&v13, 0x30u);
    }
  }
}

- (BOOL)isInCanvas
{
  return [(VCPositionalInfo *)self->_positionalInfo isInCanvas];
}

- (void)updateOneToOneAudioPositionalInfo:(const tagVCSpatialAudioMetadataPositionalInfo *)a3
{
  uint64_t v4 = [(VCSessionParticipantRemote *)self spatialMetadataEntryForMediaType:0];

  VCSpatialAudioMetadata_UpdatePositionalInfo((uint64_t)v4, (long long *)a3);
}

- (BOOL)processParticipantInfo
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (![(NSDictionary *)self->super._participantInfo objectForKeyedSubscript:@"vcSessionParticipantKeyUUID"])
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantRemote processParticipantInfo]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v13 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
      }
      else {
        int v13 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
        __int16 v19 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v27 = v18;
          __int16 v28 = 2080;
          __int16 v29 = "-[VCSessionParticipantRemote processParticipantInfo]";
          __int16 v30 = 1024;
          int v31 = 918;
          __int16 v32 = 2112;
          __int16 v33 = (VCSessionParticipantRemote *)v13;
          __int16 v34 = 2048;
          __int16 v35 = self;
          _os_log_error_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Missing participant UUID", buf, 0x30u);
        }
      }
    }
    BOOL v7 = 0;
    uint64_t v3 = 0;
    goto LABEL_62;
  }
  uint64_t v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._participantInfo, "objectForKeyedSubscript:", @"vcSessionParticipantKeyUUID"), "copy");
  uint64_t v4 = v3;
  self->super._uuid = v4;
  -[VCObject setLogPrefix:](self, "setLogPrefix:", [NSString stringWithFormat:@"uuid:%@ (remote)", v4]);
  if (![(NSDictionary *)self->super._participantInfo objectForKeyedSubscript:@"vcSessionParticipantKeyCallInfoBlob"])
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantRemote processParticipantInfo]();
        }
      }
      goto LABEL_61;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v14 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v14 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_61;
    }
    uint64_t v20 = VRTraceErrorLogLevelToCSTR();
    __int16 v21 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_61;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v27 = v20;
    __int16 v28 = 2080;
    __int16 v29 = "-[VCSessionParticipantRemote processParticipantInfo]";
    __int16 v30 = 1024;
    int v31 = 923;
    __int16 v32 = 2112;
    __int16 v33 = (VCSessionParticipantRemote *)v14;
    __int16 v34 = 2048;
    __int16 v35 = self;
    int v22 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Missing callInfo blob";
    goto LABEL_64;
  }
  id v5 = [(NSDictionary *)self->super._participantInfo objectForKeyedSubscript:@"vcSessionParticipantKeyMediaNegotiationData"];
  if (!v5)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantRemote processParticipantInfo]();
        }
      }
      goto LABEL_61;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v15 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v15 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_61;
    }
    uint64_t v23 = VRTraceErrorLogLevelToCSTR();
    __int16 v21 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_61;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v27 = v23;
    __int16 v28 = 2080;
    __int16 v29 = "-[VCSessionParticipantRemote processParticipantInfo]";
    __int16 v30 = 1024;
    int v31 = 926;
    __int16 v32 = 2112;
    __int16 v33 = (VCSessionParticipantRemote *)v15;
    __int16 v34 = 2048;
    __int16 v35 = self;
    int v22 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to retrieve the negotiation data";
    goto LABEL_64;
  }
  if (![(VCSessionMediaNegotiator *)self->super._mediaNegotiator processRemoteNegotiationData:v5])
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantRemote processParticipantInfo].cold.5();
        }
      }
      goto LABEL_61;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v16 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v16 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_61;
    }
    uint64_t v24 = VRTraceErrorLogLevelToCSTR();
    __int16 v21 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_61;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v27 = v24;
    __int16 v28 = 2080;
    __int16 v29 = "-[VCSessionParticipantRemote processParticipantInfo]";
    __int16 v30 = 1024;
    int v31 = 929;
    __int16 v32 = 2112;
    __int16 v33 = (VCSessionParticipantRemote *)v16;
    __int16 v34 = 2048;
    __int16 v35 = self;
    int v22 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Media negotiation failed";
    goto LABEL_64;
  }
  uint64_t v6 = [[VCCallInfoBlob alloc] initWithData:[(NSDictionary *)self->super._participantInfo objectForKeyedSubscript:@"vcSessionParticipantKeyCallInfoBlob"]];
  if (!v6)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantRemote processParticipantInfo].cold.4();
        }
      }
      goto LABEL_61;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v17 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v17 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (uint64_t v25 = VRTraceErrorLogLevelToCSTR(),
          __int16 v21 = *MEMORY[0x1E4F47A50],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
LABEL_61:
      BOOL v7 = 0;
LABEL_62:
      BOOL v11 = 0;
      goto LABEL_10;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v27 = v25;
    __int16 v28 = 2080;
    __int16 v29 = "-[VCSessionParticipantRemote processParticipantInfo]";
    __int16 v30 = 1024;
    int v31 = 932;
    __int16 v32 = 2112;
    __int16 v33 = (VCSessionParticipantRemote *)v17;
    __int16 v34 = 2048;
    __int16 v35 = self;
    int v22 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to allocate callInfo blob";
LABEL_64:
    _os_log_error_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_ERROR, v22, buf, 0x30u);
    goto LABEL_61;
  }
  BOOL v7 = v6;
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCSessionParticipantRemote-info");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uuid = self->super._uuid;
      *(_DWORD *)buf = 136316418;
      uint64_t v27 = v8;
      __int16 v28 = 2080;
      __int16 v29 = "-[VCSessionParticipantRemote processParticipantInfo]";
      __int16 v30 = 1024;
      int v31 = 934;
      __int16 v32 = 2048;
      __int16 v33 = self;
      __int16 v34 = 2112;
      __int16 v35 = (VCSessionParticipantRemote *)uuid;
      __int16 v36 = 2112;
      uint64_t v37 = [(VCCallInfoBlob *)v7 stringForCheckpoint];
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "VCSessionParticipantRemote [%s] %s:%d @:@ VCSessionParticipantRemote-info (%p) uuid=%@, %@", buf, 0x3Au);
    }
  }
  self->super._callInfoBlob = v7;
  self->_capabilities.isPeace = [(VCSessionParticipantRemote *)self isParticipantPeace:v7];
  self->_capabilities.isDawnburstOrLater = [(VCSessionParticipantRemote *)self isParticipantDawnburstOrLater];
  self->_receivedFirstFrame = [(VCMediaNegotiatorResults *)[(VCSessionMediaNegotiator *)self->super._mediaNegotiator negotiatedSettings] remoteBlobVersion] > 1;
  self->super._creationTime.wide = (unint64_t)[(VCMediaNegotiatorResults *)[(VCSessionMediaNegotiator *)self->super._mediaNegotiator negotiatedSettings] remoteBlobCreationTime];
  BOOL v11 = 1;
LABEL_10:

  return v11;
}

- (id)getMajorVersionNumber
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSString *)[(VCCallInfoBlob *)self->super._callInfoBlob frameworkVersion] componentsSeparatedByString:@"."];
  if (!v3 || (uint64_t v4 = v3, ![(NSArray *)v3 count]))
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantRemote getMajorVersionNumber]();
        }
      }
      goto LABEL_45;
    }
    if (objc_opt_respondsToSelector()) {
      long long v12 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      long long v12 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_45;
    }
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    __int16 v17 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_45;
    }
    int v23 = 136316162;
    uint64_t v24 = v16;
    __int16 v25 = 2080;
    long long v26 = "-[VCSessionParticipantRemote getMajorVersionNumber]";
    __int16 v27 = 1024;
    int v28 = 957;
    __int16 v29 = 2112;
    __int16 v30 = v12;
    __int16 v31 = 2048;
    __int16 v32 = self;
    uint64_t v18 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to parse version string";
    goto LABEL_44;
  }
  uint64_t v5 = [(NSArray *)v4 objectAtIndexedSubscript:0];
  if (!v5)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantRemote getMajorVersionNumber]();
        }
      }
      goto LABEL_45;
    }
    if (objc_opt_respondsToSelector()) {
      int v13 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      int v13 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_45;
    }
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    __int16 v17 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_45;
    }
    int v23 = 136316162;
    uint64_t v24 = v19;
    __int16 v25 = 2080;
    long long v26 = "-[VCSessionParticipantRemote getMajorVersionNumber]";
    __int16 v27 = 1024;
    int v28 = 959;
    __int16 v29 = 2112;
    __int16 v30 = v13;
    __int16 v31 = 2048;
    __int16 v32 = self;
    uint64_t v18 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to get substring";
LABEL_44:
    _os_log_error_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v23, 0x30u);
    goto LABEL_45;
  }
  uint64_t v6 = v5;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  if (!v7)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantRemote getMajorVersionNumber]();
        }
      }
      goto LABEL_45;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v14 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v14 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      __int16 v17 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v23 = 136316162;
        uint64_t v24 = v20;
        __int16 v25 = 2080;
        long long v26 = "-[VCSessionParticipantRemote getMajorVersionNumber]";
        __int16 v27 = 1024;
        int v28 = 961;
        __int16 v29 = 2112;
        __int16 v30 = v14;
        __int16 v31 = 2048;
        __int16 v32 = self;
        uint64_t v18 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to allocate formatter";
        goto LABEL_44;
      }
    }
LABEL_45:
    uint64_t v8 = 0;
    uint64_t v10 = &unk_1F3DC4488;
    goto LABEL_7;
  }
  uint64_t v8 = v7;
  [v7 setNumberStyle:1];
  uint64_t v9 = [v8 numberFromString:v6];
  if (v9)
  {
    uint64_t v10 = (void *)v9;
  }
  else
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantRemote getMajorVersionNumber].cold.4();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v15 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v15 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v21 = VRTraceErrorLogLevelToCSTR();
        int v22 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v23 = 136316162;
          uint64_t v24 = v21;
          __int16 v25 = 2080;
          long long v26 = "-[VCSessionParticipantRemote getMajorVersionNumber]";
          __int16 v27 = 1024;
          int v28 = 964;
          __int16 v29 = 2112;
          __int16 v30 = v15;
          __int16 v31 = 2048;
          __int16 v32 = self;
          _os_log_error_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to get number from string", (uint8_t *)&v23, 0x30u);
        }
      }
    }
    uint64_t v10 = 0;
  }
LABEL_7:

  return v10;
}

- (BOOL)supportsNegotiatedCoordinateSystem
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(VCCallInfoBlob *)self->super._callInfoBlob frameworkVersion];
  id v4 = [(VCSessionParticipantRemote *)self getMajorVersionNumber];
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      id v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v14 = 136316162;
        *(void *)&v14[4] = v6;
        *(_WORD *)&v14[12] = 2080;
        *(void *)&v14[14] = "-[VCSessionParticipantRemote supportsNegotiatedCoordinateSystem]";
        *(_WORD *)&v14[22] = 1024;
        *(_DWORD *)__int16 v15 = 973;
        *(_WORD *)&v15[4] = 1024;
        *(_DWORD *)&v15[6] = (int)[v4 intValue] > 1884;
        *(_WORD *)&v15[10] = 2080;
        *(void *)&v15[12] = [(NSString *)v3 UTF8String];
        uint64_t v8 = "VCSessionParticipantRemote [%s] %s:%d supportsNonZeroRegionOfInterestOrigin=%d remoteFrameworkVersion=%s";
        uint64_t v9 = v7;
        uint32_t v10 = 44;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, v14, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      long long v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v14 = 136316674;
        *(void *)&v14[4] = v11;
        *(_WORD *)&v14[12] = 2080;
        *(void *)&v14[14] = "-[VCSessionParticipantRemote supportsNegotiatedCoordinateSystem]";
        *(_WORD *)&v14[22] = 1024;
        *(_DWORD *)__int16 v15 = 973;
        *(_WORD *)&v15[4] = 2112;
        *(void *)&v15[6] = v5;
        *(_WORD *)&v15[14] = 2048;
        *(void *)&v15[16] = self;
        LOWORD(v16) = 1024;
        *(_DWORD *)((char *)&v16 + 2) = (int)[v4 intValue] > 1884;
        HIWORD(v16) = 2080;
        uint64_t v17 = [(NSString *)v3 UTF8String];
        uint64_t v8 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) supportsNonZeroRegionOfInterestOrigin=%d remoteFrameworkVersion=%s";
        uint64_t v9 = v12;
        uint32_t v10 = 64;
        goto LABEL_11;
      }
    }
  }
  return (int)objc_msgSend(v4, "intValue", *(_OWORD *)v14, *(void *)&v14[16], *(_OWORD *)v15, *(void *)&v15[16], v16, v17) > 1884;
}

- (BOOL)supportsGFTSwitchToOneToOne
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (self->_capabilities.participantType == 1)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        return 0;
      }
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      BOOL result = 0;
      if (!v9) {
        return result;
      }
      *(_DWORD *)uint64_t v24 = 136315650;
      *(void *)&v24[4] = v7;
      *(_WORD *)&v24[12] = 2080;
      *(void *)&v24[14] = "-[VCSessionParticipantRemote supportsGFTSwitchToOneToOne]";
      *(_WORD *)&v24[22] = 1024;
      *(_DWORD *)__int16 v25 = 979;
      uint64_t v11 = "VCSessionParticipantRemote [%s] %s:%d Web participants do not support switching from GFT to OneToOne";
      long long v12 = v8;
      uint32_t v13 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v3 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v3 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        return 0;
      }
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      uint64_t v20 = *MEMORY[0x1E4F47A50];
      BOOL v21 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      BOOL result = 0;
      if (!v21) {
        return result;
      }
      *(_DWORD *)uint64_t v24 = 136316162;
      *(void *)&v24[4] = v19;
      *(_WORD *)&v24[12] = 2080;
      *(void *)&v24[14] = "-[VCSessionParticipantRemote supportsGFTSwitchToOneToOne]";
      *(_WORD *)&v24[22] = 1024;
      *(_DWORD *)__int16 v25 = 979;
      *(_WORD *)&v25[4] = 2112;
      *(void *)&v25[6] = v3;
      *(_WORD *)&v25[14] = 2048;
      *(void *)&v25[16] = self;
      uint64_t v11 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Web participants do not support switching from GFT to OneToOne";
      long long v12 = v20;
      uint32_t v13 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, v24, v13);
    return 0;
  }
  id v4 = [(VCCallInfoBlob *)self->super._callInfoBlob frameworkVersion];
  id v5 = [(VCSessionParticipantRemote *)self getMajorVersionNumber];
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return (int)objc_msgSend(v5, "intValue", *(_OWORD *)v24, *(void *)&v24[16], *(_OWORD *)v25, *(void *)&v25[16], v26, v27) > 1849;
    }
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    __int16 v15 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return (int)objc_msgSend(v5, "intValue", *(_OWORD *)v24, *(void *)&v24[16], *(_OWORD *)v25, *(void *)&v25[16], v26, v27) > 1849;
    }
    *(_DWORD *)uint64_t v24 = 136316162;
    *(void *)&v24[4] = v14;
    *(_WORD *)&v24[12] = 2080;
    *(void *)&v24[14] = "-[VCSessionParticipantRemote supportsGFTSwitchToOneToOne]";
    *(_WORD *)&v24[22] = 1024;
    *(_DWORD *)__int16 v25 = 985;
    *(_WORD *)&v25[4] = 1024;
    *(_DWORD *)&v25[6] = (int)[v5 intValue] > 1849;
    *(_WORD *)&v25[10] = 2080;
    *(void *)&v25[12] = [(NSString *)v4 UTF8String];
    uint64_t v16 = "VCSessionParticipantRemote [%s] %s:%d supportsGFTSwitchToOneToOne:[%d] remoteFrameworkVersion:[%s] ";
    uint64_t v17 = v15;
    uint32_t v18 = 44;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v6 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return (int)objc_msgSend(v5, "intValue", *(_OWORD *)v24, *(void *)&v24[16], *(_OWORD *)v25, *(void *)&v25[16], v26, v27) > 1849;
    }
    uint64_t v22 = VRTraceErrorLogLevelToCSTR();
    int v23 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return (int)objc_msgSend(v5, "intValue", *(_OWORD *)v24, *(void *)&v24[16], *(_OWORD *)v25, *(void *)&v25[16], v26, v27) > 1849;
    }
    *(_DWORD *)uint64_t v24 = 136316674;
    *(void *)&v24[4] = v22;
    *(_WORD *)&v24[12] = 2080;
    *(void *)&v24[14] = "-[VCSessionParticipantRemote supportsGFTSwitchToOneToOne]";
    *(_WORD *)&v24[22] = 1024;
    *(_DWORD *)__int16 v25 = 985;
    *(_WORD *)&v25[4] = 2112;
    *(void *)&v25[6] = v6;
    *(_WORD *)&v25[14] = 2048;
    *(void *)&v25[16] = self;
    LOWORD(v26) = 1024;
    *(_DWORD *)((char *)&v26 + 2) = (int)[v5 intValue] > 1849;
    HIWORD(v26) = 2080;
    uint64_t v27 = [(NSString *)v4 UTF8String];
    uint64_t v16 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) supportsGFTSwitchToOneToOne:[%d] remoteFrameworkVersion:[%s] ";
    uint64_t v17 = v23;
    uint32_t v18 = 64;
  }
  _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, v16, v24, v18);
  return (int)objc_msgSend(v5, "intValue", *(_OWORD *)v24, *(void *)&v24[16], *(_OWORD *)v25, *(void *)&v25[16], v26, v27) > 1849;
}

- (BOOL)supportsIDSParticipantIDBasedKeyIndexMatching
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (self->_capabilities.participantType == 1 || !VCFeatureFlagManager_UseShortMKI()) {
    return 0;
  }
  uint64_t v3 = [(VCCallInfoBlob *)self->super._callInfoBlob frameworkVersion];
  int v4 = objc_msgSend(-[VCSessionParticipantRemote getMajorVersionNumber](self, "getMajorVersionNumber"), "intValue");
  BOOL v5 = v4 > 2044;
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      BOOL v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136316162;
        uint64_t v16 = v8;
        __int16 v17 = 2080;
        uint32_t v18 = "-[VCSessionParticipantRemote supportsIDSParticipantIDBasedKeyIndexMatching]";
        __int16 v19 = 1024;
        int v20 = 1003;
        __int16 v21 = 1024;
        *(_DWORD *)uint64_t v22 = v4 > 2044;
        *(_WORD *)&v22[4] = 2080;
        *(void *)&v22[6] = [(NSString *)v3 UTF8String];
        uint32_t v10 = "VCSessionParticipantRemote [%s] %s:%d supportsIDSParticipantIDBasedKeyIndexMatching=%d remoteFrameworkVersion=%s";
        uint64_t v11 = v9;
        uint32_t v12 = 44;
LABEL_15:
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v15, v12);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v6 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      uint64_t v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136316674;
        uint64_t v16 = v13;
        __int16 v17 = 2080;
        uint32_t v18 = "-[VCSessionParticipantRemote supportsIDSParticipantIDBasedKeyIndexMatching]";
        __int16 v19 = 1024;
        int v20 = 1003;
        __int16 v21 = 2112;
        *(void *)uint64_t v22 = v6;
        *(_WORD *)&v22[8] = 2048;
        *(void *)&v22[10] = self;
        __int16 v23 = 1024;
        BOOL v24 = v4 > 2044;
        __int16 v25 = 2080;
        uint64_t v26 = [(NSString *)v3 UTF8String];
        uint32_t v10 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) supportsIDSParticipantIDBasedKeyIndexMatching=%d remoteFrameworkVersion=%s";
        uint64_t v11 = v14;
        uint32_t v12 = 64;
        goto LABEL_15;
      }
    }
  }
  return v5;
}

- (BOOL)isParticipantPeace:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int v4 = (void *)[a3 osVersion];
  uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28FD8], "regularExpressionWithPattern:options:error:", @"^16", 1, 0), "numberOfMatchesInString:options:range:", v4, 4, 0, objc_msgSend(v4, "length"));
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136316162;
        uint64_t v16 = v7;
        __int16 v17 = 2080;
        uint32_t v18 = "-[VCSessionParticipantRemote isParticipantPeace:]";
        __int16 v19 = 1024;
        int v20 = 1012;
        __int16 v21 = 1024;
        *(_DWORD *)uint64_t v22 = v5 != 0;
        *(_WORD *)&v22[4] = 2048;
        *(void *)&v22[6] = v5;
        BOOL v9 = "VCSessionParticipantRemote [%s] %s:%d isParticipantPeace:[%d] numMatchesVersion:[%lu]";
        uint32_t v10 = v8;
        uint32_t v11 = 44;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, v11);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v6 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint64_t v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136316674;
        uint64_t v16 = v12;
        __int16 v17 = 2080;
        uint32_t v18 = "-[VCSessionParticipantRemote isParticipantPeace:]";
        __int16 v19 = 1024;
        int v20 = 1012;
        __int16 v21 = 2112;
        *(void *)uint64_t v22 = v6;
        *(_WORD *)&v22[8] = 2048;
        *(void *)&v22[10] = self;
        __int16 v23 = 1024;
        BOOL v24 = v5 != 0;
        __int16 v25 = 2048;
        uint64_t v26 = v5;
        BOOL v9 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) isParticipantPeace:[%d] numMatchesVersion:[%lu]";
        uint32_t v10 = v13;
        uint32_t v11 = 64;
        goto LABEL_11;
      }
    }
  }
  return v5 != 0;
}

- (BOOL)isParticipantDawnburstOrLater
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = [(VCSessionParticipantRemote *)self getMajorVersionNumber];
  int v4 = [v3 intValue];
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136316162;
        uint64_t v15 = v6;
        __int16 v16 = 2080;
        __int16 v17 = "-[VCSessionParticipantRemote isParticipantDawnburstOrLater]";
        __int16 v18 = 1024;
        int v19 = 1020;
        __int16 v20 = 1024;
        *(_DWORD *)__int16 v21 = v4 > 1964;
        *(_WORD *)&v21[4] = 2112;
        *(void *)&v21[6] = v3;
        uint64_t v8 = "VCSessionParticipantRemote [%s] %s:%d isDawnburstOrLater=%d for majorVersionNumber=%@";
        BOOL v9 = v7;
        uint32_t v10 = 44;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v14, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
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
        int v14 = 136316674;
        uint64_t v15 = v11;
        __int16 v16 = 2080;
        __int16 v17 = "-[VCSessionParticipantRemote isParticipantDawnburstOrLater]";
        __int16 v18 = 1024;
        int v19 = 1020;
        __int16 v20 = 2112;
        *(void *)__int16 v21 = v5;
        *(_WORD *)&v21[8] = 2048;
        *(void *)&v21[10] = self;
        __int16 v22 = 1024;
        BOOL v23 = v4 > 1964;
        __int16 v24 = 2112;
        id v25 = v3;
        uint64_t v8 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) isDawnburstOrLater=%d for majorVersionNumber=%@";
        BOOL v9 = v12;
        uint32_t v10 = 64;
        goto LABEL_11;
      }
    }
  }
  return v4 > 1964;
}

- (id)setupStreamRTP:(id)a3
{
  return (id)[a3 setupRTPForIDS];
}

- (BOOL)configureAudioIOWithDeviceRole:(int)a3 operatingMode:(int)a4
{
  return 1;
}

- (void)completeAndReleaseNwActivity:(id)a3 withReason:(int)a4
{
  nw_activity_complete_with_reason();

  nw_release(a3);
}

- (void)cleanupNwActivity
{
  participantMediaStallNwActivity = self->_participantMediaStallNwActivity;
  if (participantMediaStallNwActivity) {
    [(VCSessionParticipantRemote *)self completeAndReleaseNwActivity:self->_participantMediaStallNwActivity withReason:3];
  }
  participantPoorConnectionNwActivity = self->_participantPoorConnectionNwActivity;
  if (participantPoorConnectionNwActivity)
  {
    [(VCSessionParticipantRemote *)self completeAndReleaseNwActivity:participantPoorConnectionNwActivity withReason:3];
    if (!self->_nwActivity) {
      return;
    }
  }
  else
  {
    if (!self->_nwActivity) {
      return;
    }
    if (!participantMediaStallNwActivity)
    {
      uint64_t v5 = self;
      goto LABEL_9;
    }
  }
  uint64_t v5 = self;
LABEL_9:

  -[VCSessionParticipantRemote completeAndReleaseNwActivity:withReason:](v5, "completeAndReleaseNwActivity:withReason:");
}

- (BOOL)isActiveMediaType:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  switch(a3)
  {
    case 0u:
      BOOL result = [(VCSessionParticipantRemote *)self isAudioActive];
      break;
    case 1u:
      BOOL result = [(VCSessionParticipantRemote *)self isVideoExpected];
      break;
    case 2u:
    case 3u:
      BOOL result = [(VCSessionParticipantRemote *)self isScreenActive];
      break;
    case 4u:
    case 5u:
    case 6u:
    case 7u:
    case 8u:
      int v5 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._mediaTypeSettingsDict, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(void *)&a3)), "mediaState");
      int v6 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_remoteMediaStates, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v3)), "unsignedIntValue");
      BOOL result = v5 == 1 && v6 == 1;
      break;
    default:
      BOOL result = 1;
      break;
  }
  return result;
}

- (BOOL)isEnabledMediaType:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  switch(a3)
  {
    case 0u:
      uint64_t v8 = 373;
      goto LABEL_11;
    case 1u:
      if (!self->super._videoEnabled) {
        return 0;
      }
      uint64_t v8 = 544;
      goto LABEL_11;
    case 2u:
    case 3u:
      if (!self->super._screenEnabled) {
        return 0;
      }
      uint64_t v8 = 545;
LABEL_11:
      BOOL v7 = *((unsigned char *)&self->super.super.super.isa + v8) == 0;
      return !v7;
    case 4u:
    case 5u:
    case 6u:
    case 7u:
    case 8u:
      int v5 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._mediaTypeSettingsDict, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(void *)&a3)), "mediaState");
      int v6 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_remoteMediaStates, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v3)), "unsignedIntValue");
      if (v5) {
        BOOL v7 = v6 == 0;
      }
      else {
        BOOL v7 = 1;
      }
      return !v7;
    default:
      return 0;
  }
}

- (BOOL)isStreamGroupActive:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = +[VCSessionParticipant mediaTypesFromStreamGroupID:](VCSessionParticipant, "mediaTypesFromStreamGroupID:", [a3 streamGroupID]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (-[VCSessionParticipantRemote isActiveMediaType:](self, "isActiveMediaType:", [*(id *)(*((void *)&v11 + 1) + 8 * v8) unsignedIntValue]))
        {
          LOBYTE(v5) = 1;
          return v5;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v10 count:16];
      uint64_t v6 = v5;
      if (v5) {
        continue;
      }
      break;
    }
  }
  return v5;
}

- (BOOL)setupAudioStreamConfiguration:(id)a3 withStreamGroupConfig:(id)a4 streamGroupStreamConfig:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if ([a4 groupID] == 1835623282
    || [a4 groupID] == 1937339233
    || objc_msgSend((id)objc_msgSend(a5, "payloads"), "containsObject:", &unk_1F3DC44A0))
  {
    [a3 setupRedWithRxPayload:20 txPayload:20];
  }
  id v24 = a4;
  uint64_t v8 = objc_msgSend((id)objc_msgSend(a4, "codecConfigs"), "array");
  int v9 = [v8 count];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v23 = a5;
  id obj = (id)[a5 codecs];
  uint64_t v10 = [obj countByEnumeratingWithState:&v38 objects:v37 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v39;
LABEL_7:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v39 != v12) {
        objc_enumerationMutation(obj);
      }
      long long v14 = *(void **)(*((void *)&v38 + 1) + 8 * v13);
      if ((int)[v14 intValue] >= v9) {
        break;
      }
      uint64_t v15 = objc_msgSend(v8, "objectAtIndexedSubscript:", (int)objc_msgSend(v14, "intValue"));
      uint64_t v16 = +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", [v15 codecType]);
      __int16 v17 = -[VCAudioStreamCodecConfig initWithCodecType:]([VCAudioStreamCodecConfig alloc], "initWithCodecType:", [v15 codecType]);
      -[VCAudioStreamCodecConfig setNetworkPayload:](v17, "setNetworkPayload:", [v15 rtpPayload]);
      -[VCAudioStreamCodecConfig setPTime:](v17, "setPTime:", [v15 pTime]);
      -[VCAudioStreamCodecConfig setIsOpusInBandFecEnabled:](v17, "setIsOpusInBandFecEnabled:", [v15 useInBandFEC]);
      objc_msgSend(a3, "setRtcpEnabled:", objc_msgSend(v15, "rtcpSREnabled"));
      if ([a3 isRTCPEnabled])
      {
        [a3 setRtcpSendInterval:0.0];
        [a3 setRtcpTimeOutEnabled:1];
        [a3 setRtcpTimeOutInterval:30.0];
      }
      +[VCSessionParticipant addCodecModesForPayload:v16 toCodecConfig:v17];
      [a3 addCodecConfiguration:v17];

      if (v11 == ++v13)
      {
        uint64_t v11 = [obj countByEnumeratingWithState:&v38 objects:v37 count:16];
        if (v11) {
          goto LABEL_7;
        }
        goto LABEL_15;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_24;
    }
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    __int16 v20 = *MEMORY[0x1E4F47A50];
    BOOL v21 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (v21)
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v28 = v19;
      __int16 v29 = 2080;
      __int16 v30 = "-[VCSessionParticipantRemote setupAudioStreamConfiguration:withStreamGroupConfig:streamGroupStreamConfig:]";
      __int16 v31 = 1024;
      int v32 = 1131;
      __int16 v33 = 2112;
      __int16 v34 = v14;
      __int16 v35 = 1024;
      int v36 = v9;
      _os_log_error_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d codecIndex=%@ out of bounds, codecConfigCount=%d", buf, 0x2Cu);
      goto LABEL_24;
    }
  }
  else
  {
LABEL_15:
    if (objc_msgSend((id)objc_msgSend(a3, "codecConfigurations"), "count"))
    {
      objc_msgSend(a3, "setChannelCount:", objc_msgSend(v23, "audioChannelCount"));
      if ([a3 jitterBufferMode] != 3) {
        [a3 setJitterBufferMode:1];
      }
      if ([v24 groupID] == 1835623287
        || [v24 groupID] == 1936290409)
      {
        uint64_t v18 = 0;
      }
      else
      {
        if ([v24 groupID] == 1937339233) {
          [a3 setJitterBufferMode:0];
        }
        uint64_t v18 = 1;
      }
      [a3 setBundlingScheme:v18];
      if ([v24 groupID] == 1835623282) {
        objc_msgSend(a3, "setIsLowLatency:", -[VCSessionParticipant supportsLowLatencyAudio](self, "supportsLowLatencyAudio"));
      }
      if ([v24 groupID] == 1835623282) {
        [a3 setOutOfProcessCodecsEnabled:self->_outOfProcessCodecsEnabled];
      }
      [a3 setIsEnhancedJBAdaptationsEnabled:self->_isEnhancedJBAdaptationsEnabled];
      LOBYTE(v21) = 1;
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        BOOL v21 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v21) {
          return v21;
        }
        -[VCSessionParticipantRemote setupAudioStreamConfiguration:withStreamGroupConfig:streamGroupStreamConfig:]();
      }
LABEL_24:
      LOBYTE(v21) = 0;
    }
  }
  return v21;
}

- (id)checkSubstreams:(id)a3 forLowerQualityIndex:(unsigned int)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = 0;
  uint64_t v9 = *(void *)v15;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v15 != v9) {
        objc_enumerationMutation(a3);
      }
      uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
      if ([v11 qualityIndex] < a4)
      {
        a4 = [v11 qualityIndex];
        uint64_t v8 = v11;
      }
    }
    uint64_t v7 = [a3 countByEnumeratingWithState:&v14 objects:v13 count:16];
  }
  while (v7);
  return v8;
}

- (BOOL)setupBandwidthAllocationTableForMediaStreamConfigs:(id)a3 streamGroupID:(unsigned int)a4 entryType:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  unsigned int v7 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._participantStreamTokens, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(void *)&a4)), "unsignedIntValue");
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v105 objects:v104 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v106;
    int v11 = -1;
    unsigned int v76 = -1;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v106 != v10) {
          objc_enumerationMutation(a3);
        }
        uint64_t v13 = *(void **)(*((void *)&v105 + 1) + 8 * i);
        if ((objc_msgSend((id)objc_msgSend(v13, "multiwayConfig"), "isOneToOne") & 1) == 0)
        {
          if (objc_msgSend((id)objc_msgSend(v13, "multiwayConfig"), "qualityIndex") < v76)
          {
            unsigned int v76 = objc_msgSend((id)objc_msgSend(v13, "multiwayConfig"), "qualityIndex");
            int v11 = objc_msgSend((id)objc_msgSend(v13, "multiwayConfig"), "idsStreamID");
          }
          if (v5 == 2)
          {
            id v14 = -[VCSessionParticipantRemote checkSubstreams:forLowerQualityIndex:](self, "checkSubstreams:forLowerQualityIndex:", objc_msgSend((id)objc_msgSend(v13, "multiwayConfig"), "subStreamConfigs"), v76);
            if (v14)
            {
              long long v15 = v14;
              unsigned int v76 = [v14 idsStreamID];
              int v11 = [v15 qualityIndex];
            }
          }
        }
      }
      uint64_t v9 = [a3 countByEnumeratingWithState:&v105 objects:v104 count:16];
    }
    while (v9);
  }
  else
  {
    int v11 = -1;
    unsigned int v76 = -1;
  }
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_27;
    }
    uint64_t v17 = VRTraceErrorLogLevelToCSTR();
    uint64_t v18 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    *(_DWORD *)buf = 136316418;
    uint64_t v90 = v17;
    __int16 v91 = 2080;
    v92 = "-[VCSessionParticipantRemote setupBandwidthAllocationTableForMediaStreamConfigs:streamGroupID:entryType:]";
    __int16 v93 = 1024;
    int v94 = 1216;
    __int16 v95 = 2080;
    v96 = FourccToCStr(a4);
    __int16 v97 = 1024;
    *(_DWORD *)v98 = v76;
    *(_WORD *)&v98[4] = 1024;
    *(_DWORD *)&v98[6] = v11;
    uint64_t v19 = "VCSessionParticipantRemote [%s] %s:%d StreamGroupID=%s Lowest qualityIndex=%d streamID=%d";
    __int16 v20 = v18;
    uint32_t v21 = 50;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      long long v16 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      long long v16 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_27;
    }
    uint64_t v22 = VRTraceErrorLogLevelToCSTR();
    id v23 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    *(_DWORD *)buf = 136316930;
    uint64_t v90 = v22;
    __int16 v91 = 2080;
    v92 = "-[VCSessionParticipantRemote setupBandwidthAllocationTableForMediaStreamConfigs:streamGroupID:entryType:]";
    __int16 v93 = 1024;
    int v94 = 1216;
    __int16 v95 = 2112;
    v96 = (char *)v16;
    __int16 v97 = 2048;
    *(void *)v98 = self;
    *(_WORD *)&v98[8] = 2080;
    v99 = FourccToCStr(a4);
    __int16 v100 = 1024;
    unsigned int v101 = v76;
    __int16 v102 = 1024;
    int v103 = v11;
    uint64_t v19 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) StreamGroupID=%s Lowest qualityIndex=%d streamID=%d";
    __int16 v20 = v23;
    uint32_t v21 = 70;
  }
  _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
LABEL_27:
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  uint64_t v24 = [a3 countByEnumeratingWithState:&v85 objects:v84 count:16];
  if (!v24)
  {
LABEL_49:
    LOBYTE(v61) = 1;
    return v61;
  }
  uint64_t v25 = v24;
  uint64_t v77 = v7;
  uint64_t v26 = *(void *)v86;
  unsigned int v70 = v5;
  uint64_t v68 = *(void *)v86;
  id v69 = a3;
LABEL_29:
  uint64_t v27 = 0;
  uint64_t v71 = v25;
  while (1)
  {
    if (*(void *)v86 != v26) {
      objc_enumerationMutation(a3);
    }
    uint64_t v28 = *(void **)(*((void *)&v85 + 1) + 8 * v27);
    if (objc_msgSend((id)objc_msgSend(v28, "multiwayConfig"), "isOneToOne")) {
      goto LABEL_47;
    }
    __int16 v29 = [VCSessionBandwidthAllocationTableEntry alloc];
    uint64_t v30 = objc_msgSend((id)objc_msgSend(v28, "multiwayConfig"), "maxNetworkBitrate");
    uint64_t v31 = objc_msgSend((id)objc_msgSend(v28, "multiwayConfig"), "maxMediaBitrate");
    uint64_t v32 = objc_msgSend((id)objc_msgSend(v28, "multiwayConfig"), "qualityIndex");
    unsigned int v33 = objc_msgSend((id)objc_msgSend(v28, "multiwayConfig"), "idsStreamID");
    LODWORD(v67) = objc_msgSend((id)objc_msgSend(v28, "multiwayConfig"), "v2StreamID");
    __int16 v34 = -[VCSessionBandwidthAllocationTableEntry initWithClient:type:streamToken:networkBitrate:mediaBitrate:qualityIndex:streamID:streamGroupID:v2StreamID:](v29, "initWithClient:type:streamToken:networkBitrate:mediaBitrate:qualityIndex:streamID:streamGroupID:v2StreamID:", self, v5, v77, v30, v31, v32, __PAIR64__(a4, v33), v67);
    if (!v34) {
      break;
    }
    __int16 v35 = v34;
    uint64_t v72 = v27;
    -[VCSessionBandwidthAllocationTableEntry setIsLowestQuality:](v34, "setIsLowestQuality:", objc_msgSend((id)objc_msgSend(v28, "multiwayConfig"), "qualityIndex") == v76);
    uint64_t v73 = v35;
    [(VCSessionBandwidthAllocationTable *)self->_mediaTable addBandwidthAllocationTableEntry:v35];
    if (objc_msgSend((id)objc_msgSend(v28, "multiwayConfig"), "hasRepairedStreamID"))
    {
      int v36 = [VCSessionBandwidthAllocationTableEntry alloc];
      uint64_t v37 = objc_msgSend((id)objc_msgSend(v28, "multiwayConfig"), "repairedMaxNetworkBitrate");
      uint64_t v38 = objc_msgSend((id)objc_msgSend(v28, "multiwayConfig"), "maxMediaBitrate");
      uint64_t v39 = objc_msgSend((id)objc_msgSend(v28, "multiwayConfig"), "qualityIndex");
      unsigned int v40 = objc_msgSend((id)objc_msgSend(v28, "multiwayConfig"), "repairedStreamID");
      LODWORD(v67) = objc_msgSend((id)objc_msgSend(v28, "multiwayConfig"), "v2StreamID");
      long long v41 = -[VCSessionBandwidthAllocationTableEntry initWithClient:type:streamToken:networkBitrate:mediaBitrate:qualityIndex:streamID:streamGroupID:v2StreamID:](v36, "initWithClient:type:streamToken:networkBitrate:mediaBitrate:qualityIndex:streamID:streamGroupID:v2StreamID:", self, v5, v77, v37, v38, v39, __PAIR64__(a4, v40), v67);
      [(VCSessionBandwidthAllocationTableEntry *)v41 setIsLowestQuality:[(VCSessionBandwidthAllocationTableEntry *)v73 isLowestQuality]];
      [(VCSessionBandwidthAllocationTable *)self->_repairMediaTable addBandwidthAllocationTableEntry:v41];
    }
    if (v5 == 2)
    {
      uint64_t v42 = (void *)[v28 multiwayConfig];
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      id obj = (id)[v42 subStreamConfigs];
      uint64_t v43 = [obj countByEnumeratingWithState:&v80 objects:v79 count:16];
      if (v43)
      {
        uint64_t v44 = v43;
        uint64_t v45 = *(void *)v81;
        do
        {
          uint64_t v46 = 0;
          uint64_t v47 = self;
          do
          {
            if (*(void *)v81 != v45) {
              objc_enumerationMutation(obj);
            }
            int v48 = *(void **)(*((void *)&v80 + 1) + 8 * v46);
            __int16 v49 = [VCSessionBandwidthAllocationTableEntry alloc];
            uint64_t v50 = [v48 maxNetworkBitrate];
            uint64_t v51 = [v48 maxMediaBitrate];
            uint64_t v52 = [v48 qualityIndex];
            unsigned int v53 = [v48 idsStreamID];
            LODWORD(v67) = [v48 v2StreamID];
            long long v54 = -[VCSessionBandwidthAllocationTableEntry initWithClient:type:streamToken:networkBitrate:mediaBitrate:qualityIndex:streamID:streamGroupID:v2StreamID:](v49, "initWithClient:type:streamToken:networkBitrate:mediaBitrate:qualityIndex:streamID:streamGroupID:v2StreamID:", v47, 2, v77, v50, v51, v52, __PAIR64__(a4, v53), v67);
            -[VCSessionBandwidthAllocationTableEntry setIsLowestQuality:](v54, "setIsLowestQuality:", [v48 qualityIndex] == v76);
            [(VCSessionBandwidthAllocationTable *)v47->_mediaTable addBandwidthAllocationTableEntry:v54];
            if ([v48 hasRepairedStreamID])
            {
              v55 = [VCSessionBandwidthAllocationTableEntry alloc];
              uint64_t v56 = [v48 repairedMaxNetworkBitrate];
              uint64_t v57 = [v48 maxMediaBitrate];
              uint64_t v58 = [v48 qualityIndex];
              unsigned int v59 = [v48 repairedStreamID];
              LODWORD(v67) = [v48 v2StreamID];
              unint64_t v66 = __PAIR64__(a4, v59);
              uint64_t v47 = self;
              int v60 = -[VCSessionBandwidthAllocationTableEntry initWithClient:type:streamToken:networkBitrate:mediaBitrate:qualityIndex:streamID:streamGroupID:v2StreamID:](v55, "initWithClient:type:streamToken:networkBitrate:mediaBitrate:qualityIndex:streamID:streamGroupID:v2StreamID:", self, 2, v77, v56, v57, v58, v66, v67);
              [(VCSessionBandwidthAllocationTableEntry *)v60 setIsLowestQuality:[(VCSessionBandwidthAllocationTableEntry *)v54 isLowestQuality]];
              [(VCSessionBandwidthAllocationTable *)self->_repairMediaTable addBandwidthAllocationTableEntry:v60];
            }
            ++v46;
          }
          while (v44 != v46);
          uint64_t v44 = [obj countByEnumeratingWithState:&v80 objects:v79 count:16];
        }
        while (v44);
      }
    }

    uint64_t v5 = v70;
    uint64_t v26 = v68;
    a3 = v69;
    uint64_t v25 = v71;
    uint64_t v27 = v72;
LABEL_47:
    if (++v27 == v25)
    {
      uint64_t v25 = [a3 countByEnumeratingWithState:&v85 objects:v84 count:16];
      if (v25) {
        goto LABEL_29;
      }
      goto LABEL_49;
    }
  }
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v61 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v61) {
        return v61;
      }
      -[VCSessionParticipantRemote setupBandwidthAllocationTableForMediaStreamConfigs:streamGroupID:entryType:]();
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      CFTypeRef v62 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      CFTypeRef v62 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v63 = VRTraceErrorLogLevelToCSTR();
      __int16 v64 = *MEMORY[0x1E4F47A50];
      BOOL v61 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v61) {
        return v61;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v90 = v63;
      __int16 v91 = 2080;
      v92 = "-[VCSessionParticipantRemote setupBandwidthAllocationTableForMediaStreamConfigs:streamGroupID:entryType:]";
      __int16 v93 = 1024;
      int v94 = 1233;
      __int16 v95 = 2112;
      v96 = (char *)v62;
      __int16 v97 = 2048;
      *(void *)v98 = self;
      _os_log_error_impl(&dword_1E1EA4000, v64, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to allocate allocator entry!", buf, 0x30u);
    }
  }
  LOBYTE(v61) = 0;
  return v61;
}

- (id)entryForStreamID:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id result = -[VCSessionBandwidthAllocationTable entryForStreamID:](self->_mediaTable, "entryForStreamID:");
  if (!result)
  {
    id result = [(VCSessionBandwidthAllocationTable *)self->_repairMediaTable entryForStreamID:a3];
    if (!result)
    {
      if ((VCSessionParticipantRemote *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSessionParticipantRemote entryForStreamID:]();
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v6 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
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
            int v9 = 136316418;
            uint64_t v10 = v7;
            __int16 v11 = 2080;
            uint64_t v12 = "-[VCSessionParticipantRemote entryForStreamID:]";
            __int16 v13 = 1024;
            int v14 = 1305;
            __int16 v15 = 2112;
            long long v16 = v6;
            __int16 v17 = 2048;
            uint64_t v18 = self;
            __int16 v19 = 2112;
            id v20 = a3;
            _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) No media entry found for stream ID: %@", (uint8_t *)&v9, 0x3Au);
          }
        }
      }
      return 0;
    }
  }
  return result;
}

- (id)getAudioDumpName
{
  return 0;
}

- (void)setMuted:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__VCSessionParticipantRemote_setMuted___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __39__VCSessionParticipantRemote_setMuted___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 372) = *(unsigned char *)(a1 + 40);
  uint64_t v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "micStreamInfo"), "stream");
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 372);

  return [v2 setRemoteMuted:v3];
}

- (void)setActiveStreamIDs:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__VCSessionParticipantRemote_setActiveStreamIDs___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = a3;
  void block[5] = self;
  dispatch_async(participantQueue, block);
}

uint64_t __49__VCSessionParticipantRemote_setActiveStreamIDs___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[MEMORY[0x1E4F1CA80] setWithArray:*(void *)(a1 + 32)];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = (void *)[*(id *)(*(void *)(a1 + 40) + 472) allValues];
  uint64_t result = [v3 countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        int v9 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:", objc_msgSend((id)objc_msgSend(v8, "streamIDToMediaStreamMap"), "allKeys"));
        [v9 intersectSet:v2];
        [v2 minusSet:v9];
        [v8 setActiveStreamIDs:v9];
        ++v7;
      }
      while (v5 != v7);
      uint64_t result = [v3 countByEnumeratingWithState:&v11 objects:v10 count:16];
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

- (NSNumber)optedInAudioStreamID
{
  return (NSNumber *)[(VCSessionParticipantRemote *)self optedInStreamIDForStreamGroupID:1835623282];
}

- (NSNumber)optedInVideoStreamID
{
  return (NSNumber *)[(VCSessionParticipantRemote *)self optedInStreamIDForStreamGroupID:1667329381];
}

- (void)appendOptedInStreamID:(id)a3 toOptInStreamsIDs:(id)a4 targetBandwidthEntry:(id)a5 forceSeamlessTransition:(BOOL)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    BOOL v6 = a6;
    if ((objc_msgSend(a4, "containsObject:") & 1) == 0)
    {
      unsigned int v11 = [a5 maxNetworkBitrate];
      unsigned int v12 = objc_msgSend(-[VCSessionParticipantRemote entryForStreamID:](self, "entryForStreamID:", a3), "maxNetworkBitrate");
      unsigned int v13 = v12;
      if (v6 || v11 > v12)
      {
        [a4 addObject:a3];
        if ((VCSessionParticipantRemote *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v15 = VRTraceErrorLogLevelToCSTR();
            long long v16 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              int v22 = 136316674;
              uint64_t v23 = v15;
              __int16 v24 = 2080;
              uint64_t v25 = "-[VCSessionParticipantRemote appendOptedInStreamID:toOptInStreamsIDs:targetBandwidthEntry:forceSeamlessTransition:]";
              __int16 v26 = 1024;
              int v27 = 1376;
              __int16 v28 = 2112;
              __int16 v29 = [(VCSessionParticipantRemote *)self optedInVideoStreamID];
              __int16 v30 = 1024;
              *(_DWORD *)uint64_t v31 = v6;
              *(_WORD *)&v31[4] = 1024;
              *(_DWORD *)&v31[6] = v13;
              LOWORD(v32) = 1024;
              *(_DWORD *)((char *)&v32 + 2) = v11;
              __int16 v17 = "VCSessionParticipantRemote [%s] %s:%d Adding currently optedInVideoStreamID:%@ to allow seamless vid"
                    "eo stream transition. Force=%d, Bitrate %d -> %d";
              uint64_t v18 = v16;
              uint32_t v19 = 56;
LABEL_15:
              _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v22, v19);
            }
          }
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            long long v14 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
          }
          else {
            long long v14 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v20 = VRTraceErrorLogLevelToCSTR();
            uint64_t v21 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              int v22 = 136317186;
              uint64_t v23 = v20;
              __int16 v24 = 2080;
              uint64_t v25 = "-[VCSessionParticipantRemote appendOptedInStreamID:toOptInStreamsIDs:targetBandwidthEntry:forceSeamlessTransition:]";
              __int16 v26 = 1024;
              int v27 = 1376;
              __int16 v28 = 2112;
              __int16 v29 = (NSNumber *)v14;
              __int16 v30 = 2048;
              *(void *)uint64_t v31 = self;
              *(_WORD *)&v31[8] = 2112;
              uint64_t v32 = [(VCSessionParticipantRemote *)self optedInVideoStreamID];
              __int16 v33 = 1024;
              BOOL v34 = v6;
              __int16 v35 = 1024;
              unsigned int v36 = v13;
              __int16 v37 = 1024;
              unsigned int v38 = v11;
              __int16 v17 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Adding currently optedInVideoStreamID:%@ to allow seaml"
                    "ess video stream transition. Force=%d, Bitrate %d -> %d";
              uint64_t v18 = v21;
              uint32_t v19 = 76;
              goto LABEL_15;
            }
          }
        }
      }
    }
  }
}

- (id)recommendedStreamIDsForSelectedMediaEntries:(id)a3 forceSeamlessTransition:(BOOL)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  unsigned int v13 = &v12;
  uint64_t v14 = 0x3052000000;
  uint64_t v15 = __Block_byref_object_copy__10;
  long long v16 = __Block_byref_object_dispose__10;
  uint64_t v17 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v17 = [MEMORY[0x1E4F1CA48] array];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__VCSessionParticipantRemote_recommendedStreamIDsForSelectedMediaEntries_forceSeamlessTransition___block_invoke;
  block[3] = &unk_1E6DB6A40;
  block[4] = a3;
  void block[5] = self;
  void block[6] = &v12;
  BOOL v11 = a4;
  dispatch_sync(participantQueue, block);
  uint64_t v8 = (void *)v13[5];
  _Block_object_dispose(&v12, 8);
  return v8;
}

void __98__VCSessionParticipantRemote_recommendedStreamIDsForSelectedMediaEntries_forceSeamlessTransition___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v41 objects:v40 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v42;
    *(void *)&long long v4 = 136316162;
    long long v26 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v42 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(*(id *)(a1 + 40), "streamGroupWithID:", objc_msgSend(v8, "streamGroupID", v26));
        if (v9)
        {
          uint64_t v10 = (void *)v9;
          if ([*(id *)(a1 + 40) isStreamGroupActive:v9])
          {
            uint64_t v11 = [v8 v2StreamID]
                ? [v8 v2StreamID]
                : [v8 streamID];
            objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v11));
            if ([*(id *)(a1 + 40) isSeamlessTransitionSupportedForStreamGroup:v10]) {
              objc_msgSend(*(id *)(a1 + 40), "appendOptedInStreamID:toOptInStreamsIDs:targetBandwidthEntry:forceSeamlessTransition:", objc_msgSend(v10, "optedInStreamID"), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v8, *(unsigned __int8 *)(a1 + 56));
            }
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v12 = VRTraceErrorLogLevelToCSTR();
          unsigned int v13 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            int v27 = FourccToCStr([v8 streamGroupID]);
            int v14 = [v8 streamGroupID];
            *(_DWORD *)buf = v26;
            uint64_t v29 = v12;
            __int16 v30 = 2080;
            uint64_t v31 = "-[VCSessionParticipantRemote recommendedStreamIDsForSelectedMediaEntries:forceSeamlessTransition:]_block_invoke";
            __int16 v32 = 1024;
            int v33 = 1386;
            __int16 v34 = 2080;
            __int16 v35 = v27;
            __int16 v36 = 1024;
            LODWORD(v37) = v14;
            _os_log_error_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d Stream group '%s' (%d) doesn't exist!", buf, 0x2Cu);
          }
        }
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v41 objects:v40 count:16];
    }
    while (v5);
  }
  if (objc_opt_class() == *(void *)(a1 + 40))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      uint64_t v17 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        *(_DWORD *)buf = 136315906;
        uint64_t v29 = v16;
        __int16 v30 = 2080;
        uint64_t v31 = "-[VCSessionParticipantRemote recommendedStreamIDsForSelectedMediaEntries:forceSeamlessTransition:]_block_invoke";
        __int16 v32 = 1024;
        int v33 = 1398;
        __int16 v34 = 2112;
        __int16 v35 = v18;
        uint32_t v19 = "VCSessionParticipantRemote [%s] %s:%d %@";
        uint64_t v20 = v17;
        uint32_t v21 = 38;
LABEL_28:
        _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v15 = (__CFString *)[*(id *)(a1 + 40) performSelector:sel_logPrefix];
    }
    else {
      uint64_t v15 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      uint64_t v23 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = *(void *)(a1 + 40);
        uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        *(_DWORD *)buf = 136316418;
        uint64_t v29 = v22;
        __int16 v30 = 2080;
        uint64_t v31 = "-[VCSessionParticipantRemote recommendedStreamIDsForSelectedMediaEntries:forceSeamlessTransition:]_block_invoke";
        __int16 v32 = 1024;
        int v33 = 1398;
        __int16 v34 = 2112;
        __int16 v35 = v15;
        __int16 v36 = 2048;
        uint64_t v37 = v24;
        __int16 v38 = 2112;
        uint64_t v39 = v25;
        uint32_t v19 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) %@";
        uint64_t v20 = v23;
        uint32_t v21 = 58;
        goto LABEL_28;
      }
    }
  }
}

- (void)negotiateAudioRules:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__VCSessionParticipantRemote_negotiateAudioRules___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a3;
  dispatch_sync(participantQueue, block);
}

void __50__VCSessionParticipantRemote_negotiateAudioRules___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 296), "rules"));
  objc_msgSend(v2, "intersectSet:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", objc_msgSend(*(id *)(a1 + 40), "rules")));
  if ([v2 count])
  {
    [*(id *)(a1 + 40) clearAudioRules];
    uint64_t v3 = *(void **)(a1 + 40);
    uint64_t v4 = [v2 allObjects];
    [v3 addAudioRules:v4];
    return;
  }
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return;
    }
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return;
    }
    uint64_t v8 = [*(id *)(a1 + 40) rules];
    uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 296) rules];
    int v18 = 136316162;
    uint64_t v19 = v6;
    __int16 v20 = 2080;
    uint32_t v21 = "-[VCSessionParticipantRemote negotiateAudioRules:]_block_invoke";
    __int16 v22 = 1024;
    int v23 = 1410;
    __int16 v24 = 2112;
    uint64_t v25 = v8;
    __int16 v26 = 2112;
    uint64_t v27 = v9;
    uint64_t v10 = "VCSessionParticipantRemote [%s] %s:%d No compatible stream configuration! localAudioRules=%@ supportedAudioRules=%@";
    uint64_t v11 = v7;
    uint32_t v12 = 48;
LABEL_16:
    _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v18, v12);
    return;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v5 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
  }
  else {
    uint64_t v5 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    int v14 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v16 = [*(id *)(a1 + 40) rules];
      uint64_t v17 = [*(id *)(*(void *)(a1 + 32) + 296) rules];
      int v18 = 136316674;
      uint64_t v19 = v13;
      __int16 v20 = 2080;
      uint32_t v21 = "-[VCSessionParticipantRemote negotiateAudioRules:]_block_invoke";
      __int16 v22 = 1024;
      int v23 = 1410;
      __int16 v24 = 2112;
      uint64_t v25 = (uint64_t)v5;
      __int16 v26 = 2048;
      uint64_t v27 = v15;
      __int16 v28 = 2112;
      uint64_t v29 = v16;
      __int16 v30 = 2112;
      uint64_t v31 = v17;
      uint64_t v10 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) No compatible stream configuration! localAudioRules=%@ supportedAudioRules=%@";
      uint64_t v11 = v14;
      uint32_t v12 = 68;
      goto LABEL_16;
    }
  }
}

- (BOOL)isAudioActive
{
  return self->super._audioEnabled
      && self->_remoteAudioEnabled
      && !self->super._audioPaused
      && !self->_remoteAudioPaused;
}

- (void)updateAudioSpectrumState
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  BOOL v3 = self->super._videoEnabled && self->_remoteVideoEnabled && !self->super._videoPaused;
  BOOL v4 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._mediaTypeSettingsDict, "objectForKeyedSubscript:", &unk_1F3DC44B8), "mediaState") == 1&& objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._mediaTypeSettingsDict, "objectForKeyedSubscript:", &unk_1F3DC44B8), "remoteMediaState") == 1;
  BOOL v5 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._mediaTypeSettingsDict, "objectForKeyedSubscript:", &unk_1F3DC44D0), "mediaState") == 1&& objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._mediaTypeSettingsDict, "objectForKeyedSubscript:", &unk_1F3DC44D0), "remoteMediaState") == 1;
  unsigned int visibilityIndex = self->_visibilityIndex;
  if (visibilityIndex) {
    int v7 = 1;
  }
  else {
    int v7 = v3;
  }
  if (((v7 | v4) & 1) != 0 || v5) {
    uint64_t EnableAudioPowerSpectrumReport = VCTestMonitorManager_GetEnableAudioPowerSpectrumReport();
  }
  else {
    uint64_t EnableAudioPowerSpectrumReport = 1;
  }
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
      goto LABEL_34;
    }
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint64_t v11 = *MEMORY[0x1E4F47A50];
    uint32_t v12 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_34;
      }
      *(_DWORD *)buf = 136317186;
      uint64_t v33 = v10;
      __int16 v34 = 2080;
      __int16 v35 = "-[VCSessionParticipantRemote updateAudioSpectrumState]";
      __int16 v36 = 1024;
      int v37 = 1433;
      __int16 v38 = 1024;
      *(_DWORD *)uint64_t v39 = v3;
      *(_WORD *)&v39[4] = 1024;
      *(_DWORD *)&v39[6] = v4;
      LOWORD(v40) = 1024;
      *(_DWORD *)((char *)&v40 + 2) = v5;
      HIWORD(v40) = 1024;
      *(_DWORD *)long long v41 = visibilityIndex == 0;
      *(_WORD *)&v41[4] = 1024;
      *(_DWORD *)long long v42 = VCTestMonitorManager_GetEnableAudioPowerSpectrumReport();
      *(_WORD *)&v42[4] = 1024;
      *(_DWORD *)long long v43 = EnableAudioPowerSpectrumReport;
      uint64_t v13 = "VCSessionParticipantRemote [%s] %s:%d is2DCameraActive=%d is3DCameraActive=%d is3DCameraAltActive=%d isVisib"
            "le=%d testEnabled=%d => spectrumEnabled=%d";
      int v14 = v11;
      uint32_t v15 = 64;
LABEL_30:
      _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
      goto LABEL_34;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136317186;
      uint64_t v33 = v10;
      __int16 v34 = 2080;
      __int16 v35 = "-[VCSessionParticipantRemote updateAudioSpectrumState]";
      __int16 v36 = 1024;
      int v37 = 1433;
      __int16 v38 = 1024;
      *(_DWORD *)uint64_t v39 = v3;
      *(_WORD *)&v39[4] = 1024;
      *(_DWORD *)&v39[6] = v4;
      LOWORD(v40) = 1024;
      *(_DWORD *)((char *)&v40 + 2) = v5;
      HIWORD(v40) = 1024;
      *(_DWORD *)long long v41 = visibilityIndex == 0;
      *(_WORD *)&v41[4] = 1024;
      *(_DWORD *)long long v42 = VCTestMonitorManager_GetEnableAudioPowerSpectrumReport();
      *(_WORD *)&v42[4] = 1024;
      *(_DWORD *)long long v43 = EnableAudioPowerSpectrumReport;
      uint64_t v19 = "VCSessionParticipantRemote [%s] %s:%d is2DCameraActive=%d is3DCameraActive=%d is3DCameraAltActive=%d isVisib"
            "le=%d testEnabled=%d => spectrumEnabled=%d";
      __int16 v20 = v11;
      uint32_t v21 = 64;
      goto LABEL_43;
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v9 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v9 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      uint64_t v17 = *MEMORY[0x1E4F47A50];
      int v18 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_34;
        }
        *(_DWORD *)buf = 136317698;
        uint64_t v33 = v16;
        __int16 v34 = 2080;
        __int16 v35 = "-[VCSessionParticipantRemote updateAudioSpectrumState]";
        __int16 v36 = 1024;
        int v37 = 1433;
        __int16 v38 = 2112;
        *(void *)uint64_t v39 = v9;
        *(_WORD *)&v39[8] = 2048;
        unsigned int v40 = self;
        *(_WORD *)long long v41 = 1024;
        *(_DWORD *)&v41[2] = v3;
        *(_WORD *)long long v42 = 1024;
        *(_DWORD *)&v42[2] = v4;
        *(_WORD *)long long v43 = 1024;
        *(_DWORD *)&v43[2] = v5;
        __int16 v44 = 1024;
        BOOL v45 = visibilityIndex == 0;
        __int16 v46 = 1024;
        int v47 = VCTestMonitorManager_GetEnableAudioPowerSpectrumReport();
        __int16 v48 = 1024;
        int v49 = EnableAudioPowerSpectrumReport;
        uint64_t v13 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) is2DCameraActive=%d is3DCameraActive=%d is3DCameraAltActive=%"
              "d isVisible=%d testEnabled=%d => spectrumEnabled=%d";
        int v14 = v17;
        uint32_t v15 = 84;
        goto LABEL_30;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136317698;
        uint64_t v33 = v16;
        __int16 v34 = 2080;
        __int16 v35 = "-[VCSessionParticipantRemote updateAudioSpectrumState]";
        __int16 v36 = 1024;
        int v37 = 1433;
        __int16 v38 = 2112;
        *(void *)uint64_t v39 = v9;
        *(_WORD *)&v39[8] = 2048;
        unsigned int v40 = self;
        *(_WORD *)long long v41 = 1024;
        *(_DWORD *)&v41[2] = v3;
        *(_WORD *)long long v42 = 1024;
        *(_DWORD *)&v42[2] = v4;
        *(_WORD *)long long v43 = 1024;
        *(_DWORD *)&v43[2] = v5;
        __int16 v44 = 1024;
        BOOL v45 = visibilityIndex == 0;
        __int16 v46 = 1024;
        int v47 = VCTestMonitorManager_GetEnableAudioPowerSpectrumReport();
        __int16 v48 = 1024;
        int v49 = EnableAudioPowerSpectrumReport;
        uint64_t v19 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) is2DCameraActive=%d is3DCameraActive=%d is3DCameraAltActive=%"
              "d isVisible=%d testEnabled=%d => spectrumEnabled=%d";
        __int16 v20 = v17;
        uint32_t v21 = 84;
LABEL_43:
        _os_log_debug_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEBUG, v19, buf, v21);
      }
    }
  }
LABEL_34:
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  micStreamGroups = self->super._micStreamGroups;
  uint64_t v23 = [(NSMutableArray *)micStreamGroups countByEnumeratingWithState:&v28 objects:v27 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v29 != v25) {
          objc_enumerationMutation(micStreamGroups);
        }
        [*(id *)(*((void *)&v28 + 1) + 8 * i) setPowerSpectrumEnabled:EnableAudioPowerSpectrumReport];
      }
      uint64_t v24 = [(NSMutableArray *)micStreamGroups countByEnumeratingWithState:&v28 objects:v27 count:16];
    }
    while (v24);
  }
}

- (BOOL)isScreenActive
{
  return self->super._screenEnabled && self->_remoteScreenEnabled;
}

- (VCSessionParticipantMediaStreamInfo)micStreamInfo
{
  uint64_t v2 = objc_msgSend(-[VCSessionParticipant microphoneGroup](self, "microphoneGroup"), "mediaStreamInfoArray");

  return (VCSessionParticipantMediaStreamInfo *)[v2 firstObject];
}

- (VCSessionParticipantMediaStreamInfo)cameraStreamInfo
{
  uint64_t v2 = objc_msgSend(-[VCSessionParticipantRemote videoGroup](self, "videoGroup"), "mediaStreamInfoArray");

  return (VCSessionParticipantMediaStreamInfo *)[v2 firstObject];
}

- (VCSessionParticipantMediaStreamInfo)screenStreamInfo
{
  uint64_t result = [(VCSessionParticipantRemote *)self screenGroup];
  if (result)
  {
    BOOL v4 = objc_msgSend(-[VCSessionParticipantRemote screenGroup](self, "screenGroup"), "mediaStreamInfoArray");
    return (VCSessionParticipantMediaStreamInfo *)[v4 firstObject];
  }
  return result;
}

- (id)systemAudioStreamInfo
{
  uint64_t v2 = objc_msgSend(-[VCSessionParticipant systemAudioGroup](self, "systemAudioGroup"), "mediaStreamInfoArray");

  return (id)[v2 firstObject];
}

- (int64_t)participantScreenToken
{
  uint64_t v2 = (void *)[(NSMutableDictionary *)self->super._participantStreamTokens objectForKeyedSubscript:&unk_1F3DC44E8];

  return [v2 integerValue];
}

- (id)screenGroup
{
  streamGroups = self->super._streamGroups;
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[VCSessionParticipantRemote participantScreenToken](self, "participantScreenToken"));

  return (id)[(NSMutableDictionary *)streamGroups objectForKeyedSubscript:v3];
}

- (id)videoGroup
{
  streamGroups = self->super._streamGroups;
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[VCSessionParticipant participantVideoToken](self, "participantVideoToken"));

  return (id)[(NSMutableDictionary *)streamGroups objectForKeyedSubscript:v3];
}

- (id)audioGroup
{
  streamGroups = self->super._streamGroups;
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[VCSessionParticipantRemote participantMicrophoneToken](self, "participantMicrophoneToken"));

  return (id)[(NSMutableDictionary *)streamGroups objectForKeyedSubscript:v3];
}

- (_VCSessionParticipantCapabilities)capabilities
{
  p_capabilities = &self->_capabilities;
  uint64_t v3 = *(void *)&self->_capabilities.isPeace;
  uint64_t v4 = *(void *)&p_capabilities->controlChannelVersion;
  result.controlChannelVersion = v4;
  result.supportsGFTSwitchToOneToOne = BYTE4(v4);
  result.supportsParticipantIDBasedKeyLookup = BYTE5(v4);
  result.isDawnburstOrLater = BYTE6(v4);
  result.isPeace = v3;
  result.participantType = HIDWORD(v3);
  return result;
}

- (BOOL)isParticipantIDBasedKeyLookupEnabled
{
  return self->_capabilities.supportsParticipantIDBasedKeyLookup;
}

- (int64_t)participantMicrophoneToken
{
  if ((unint64_t)[(VCSessionParticipantRemote *)self capabilities] >> 32 == 1) {
    uint64_t v3 = &unk_1F3DC4458;
  }
  else {
    uint64_t v3 = &unk_1F3DC4470;
  }
  uint64_t v4 = (void *)[(NSMutableDictionary *)self->super._participantStreamTokens objectForKeyedSubscript:v3];

  return [v4 integerValue];
}

- (unsigned)lastDisplayedFrameRTPTimestamp
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__VCSessionParticipantRemote_lastDisplayedFrameRTPTimestamp__block_invoke;
  block[3] = &unk_1E6DB4540;
  block[4] = self;
  void block[5] = &v6;
  dispatch_sync(participantQueue, block);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __60__VCSessionParticipantRemote_lastDisplayedFrameRTPTimestamp__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "cameraGroups"), "firstObject"), "lastDisplayedFrameRTPTimestamp");
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)configureWithOneToOneParticipantConfig:(id)a3 operatingMode:(int)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__VCSessionParticipantRemote_configureWithOneToOneParticipantConfig_operatingMode___block_invoke;
  block[3] = &unk_1E6DB6448;
  block[4] = self;
  void block[5] = a3;
  void block[6] = &v9;
  int v8 = a4;
  dispatch_sync(participantQueue, block);
  char v5 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __83__VCSessionParticipantRemote_configureWithOneToOneParticipantConfig_operatingMode___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setOneToOneConfig:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "dispatchedConfigureWithDeviceRole:negotiatedVideoEnabled:negotiatedScreenEnabled:operatingMode:", objc_msgSend(*(id *)(a1 + 40), "deviceRole"), objc_msgSend(*(id *)(a1 + 40), "negotiatedVideoEnabled"), objc_msgSend(*(id *)(a1 + 40), "negotiatedScreenEnabled"), *(unsigned int *)(a1 + 56));
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __83__VCSessionParticipantRemote_configureWithOneToOneParticipantConfig_operatingMode___block_invoke_cold_1();
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
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v3 = VRTraceErrorLogLevelToCSTR();
        uint64_t v4 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v5 = *(void *)(a1 + 32);
          int v6 = 136316162;
          uint64_t v7 = v3;
          __int16 v8 = 2080;
          uint64_t v9 = "-[VCSessionParticipantRemote configureWithOneToOneParticipantConfig:operatingMode:]_block_invoke";
          __int16 v10 = 1024;
          int v11 = 1506;
          __int16 v12 = 2112;
          uint64_t v13 = v2;
          __int16 v14 = 2048;
          uint64_t v15 = v5;
          _os_log_error_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Fail configure participant", (uint8_t *)&v6, 0x30u);
        }
      }
    }
  }
}

- (void)dispatchedSetVideoReceiverFeedbackDelegate:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v4 = objc_msgSend(-[VCSessionParticipantRemote videoGroup](self, "videoGroup"), "mediaStreamInfoArray");
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        __int16 v10 = (void *)[v9 stream];
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        int v11 = (void *)[v9 streamConfigs];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v16 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v18;
          while (2)
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v18 != v14) {
                objc_enumerationMutation(v11);
              }
              if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * j), "multiwayConfig"), "isOneToOne"))
              {
                [v10 setVideoReceiverFeedbackDelegate:a3];
                goto LABEL_16;
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v16 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }
LABEL_16:
        ;
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v21 count:16];
    }
    while (v6);
  }
}

- (void)setVideoReceiverFeedbackDelegate:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__VCSessionParticipantRemote_setVideoReceiverFeedbackDelegate___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a3;
  dispatch_sync(participantQueue, block);
}

uint64_t __63__VCSessionParticipantRemote_setVideoReceiverFeedbackDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedSetVideoReceiverFeedbackDelegate:*(void *)(a1 + 40)];
}

- (void)setVideoStreamDelegate:(id)a3 delegateFunctions:(const tagVCVideoStreamDelegateRealtimeInstanceVTable *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    participantQueue = self->super._participantQueue;
    remoteScreenAttributesDidChange = a4->remoteScreenAttributesDidChange;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__VCSessionParticipantRemote_setVideoStreamDelegate_delegateFunctions___block_invoke;
    block[3] = &unk_1E6DB5450;
    block[4] = self;
    void block[5] = a3;
    void block[6] = remoteScreenAttributesDidChange;
    dispatch_async(participantQueue, block);
    return;
  }
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
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
        long long v19 = "-[VCSessionParticipantRemote setVideoStreamDelegate:delegateFunctions:]";
        __int16 v20 = 1024;
        int v21 = 1532;
        __int16 v10 = "VCSessionParticipantRemote [%s] %s:%d videoStreamDelegateFunctions is NULL";
        int v11 = v9;
        uint32_t v12 = 28;
LABEL_14:
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v7 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
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
        long long v19 = "-[VCSessionParticipantRemote setVideoStreamDelegate:delegateFunctions:]";
        __int16 v20 = 1024;
        int v21 = 1532;
        __int16 v22 = 2112;
        long long v23 = v7;
        __int16 v24 = 2048;
        long long v25 = self;
        __int16 v10 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) videoStreamDelegateFunctions is NULL";
        int v11 = v14;
        uint32_t v12 = 48;
        goto LABEL_14;
      }
    }
  }
}

uint64_t __71__VCSessionParticipantRemote_setVideoStreamDelegate_delegateFunctions___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) videoGroup];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setVideoStreamDelegate:v3 delegateFunctions:a1 + 48];
}

- (unsigned)actualNetworkBitrateWithAudioBitrates:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(VCSessionParticipantRemote *)self actualNetworkBitrateForStreamGroup:1835623282];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = (void *)[(NSMutableDictionary *)self->super._streamGroups allValues];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unsigned int v9 = 0;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        v9 += -[VCSessionParticipantRemote actualNetworkBitrateForStreamGroup:](self, "actualNetworkBitrateForStreamGroup:", [*(id *)(*((void *)&v14 + 1) + 8 * i) streamGroupID]);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v13 count:16];
    }
    while (v8);
  }
  else
  {
    unsigned int v9 = 0;
  }
  objc_msgSend(a3, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v5));
  return v9;
}

- (id)startAudioIO
{
  return 0;
}

- (id)stopAudioStreams
{
  return 0;
}

- (id)startScreenGroup
{
  return 0;
}

- (void)updateThermalLevel:(int)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__VCSessionParticipantRemote_updateThermalLevel___block_invoke;
  block[3] = &unk_1E6DB3F08;
  block[4] = self;
  int v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __49__VCSessionParticipantRemote_updateThermalLevel___block_invoke(uint64_t result)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(_DWORD *)(result + 40);
  if (*(_DWORD *)(v1 + 652) != v2)
  {
    uint64_t v3 = result;
    *(_DWORD *)(v1 + 652) = v2;
    if (objc_opt_class() == *(void *)(result + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return objc_msgSend(*(id *)(v3 + 32), "updateShouldEnableMLEnhance", *(_OWORD *)v15, *(void *)&v15[16], v16, v17, v18, v19);
      }
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return objc_msgSend(*(id *)(v3 + 32), "updateShouldEnableMLEnhance", *(_OWORD *)v15, *(void *)&v15[16], v16, v17, v18, v19);
      }
      int v7 = *(_DWORD *)(v3 + 40);
      *(_DWORD *)long long v15 = 136315906;
      *(void *)&v15[4] = v5;
      *(_WORD *)&v15[12] = 2080;
      *(void *)&v15[14] = "-[VCSessionParticipantRemote updateThermalLevel:]_block_invoke";
      *(_WORD *)&v15[22] = 1024;
      LODWORD(v16) = 1572;
      WORD2(v16) = 1024;
      *(_DWORD *)((char *)&v16 + 6) = v7;
      uint64_t v8 = "VCSessionParticipantRemote [%s] %s:%d New thermal level %d";
      unsigned int v9 = v6;
      uint32_t v10 = 34;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v4 = (__CFString *)[*(id *)(v3 + 32) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v4 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return objc_msgSend(*(id *)(v3 + 32), "updateShouldEnableMLEnhance", *(_OWORD *)v15, *(void *)&v15[16], v16, v17, v18, v19);
      }
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint32_t v12 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return objc_msgSend(*(id *)(v3 + 32), "updateShouldEnableMLEnhance", *(_OWORD *)v15, *(void *)&v15[16], v16, v17, v18, v19);
      }
      uint64_t v13 = *(void *)(v3 + 32);
      int v14 = *(_DWORD *)(v3 + 40);
      *(_DWORD *)long long v15 = 136316418;
      *(void *)&v15[4] = v11;
      *(_WORD *)&v15[12] = 2080;
      *(void *)&v15[14] = "-[VCSessionParticipantRemote updateThermalLevel:]_block_invoke";
      *(_WORD *)&v15[22] = 1024;
      LODWORD(v16) = 1572;
      WORD2(v16) = 2112;
      *(void *)((char *)&v16 + 6) = v4;
      HIWORD(v16) = 2048;
      uint64_t v17 = v13;
      LOWORD(v18) = 1024;
      *(_DWORD *)((char *)&v18 + 2) = v14;
      uint64_t v8 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) New thermal level %d";
      unsigned int v9 = v12;
      uint32_t v10 = 54;
    }
    _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, v15, v10);
    return objc_msgSend(*(id *)(v3 + 32), "updateShouldEnableMLEnhance", *(_OWORD *)v15, *(void *)&v15[16], v16, v17, v18, v19);
  }
  return result;
}

- (void)setMediaRecorder:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)VCSessionParticipantRemote;
  [(VCSessionParticipant *)&v6 setMediaRecorder:a3];
  participantQueue = self->super._participantQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__VCSessionParticipantRemote_setMediaRecorder___block_invoke;
  v5[3] = &unk_1E6DB3DC8;
  v5[4] = self;
  dispatch_async(participantQueue, v5);
}

uint64_t __47__VCSessionParticipantRemote_setMediaRecorder___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  int v2 = *(void **)(*(void *)(a1 + 32) + 480);
  uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v8 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
        if ([v7 streamGroupID] == 1835623282) {
          return [v7 setMediaRecorder:*(void *)(*(void *)(a1 + 32) + 512)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v8 count:16];
      uint64_t v4 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (void)setStreamGroup:(unsigned int)a3 syncSourceStreamGroupID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._participantQueue);
  id v7 = [(VCSessionParticipant *)self systemAudioGroup];
  id v8 = [(VCSessionParticipant *)self streamGroupWithID:v4];
  id v9 = [(VCSessionParticipant *)self streamGroupWithID:v5];
  uint64_t v10 = objc_msgSend(-[VCSessionParticipantRemote systemAudioStreamInfo](self, "systemAudioStreamInfo"), "stream");
  if (v4 == 1937339233)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_32;
      }
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      __int16 v20 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_32;
      }
      *(_DWORD *)uint64_t v32 = 136315906;
      *(void *)&v32[4] = v19;
      *(_WORD *)&v32[12] = 2080;
      *(void *)&v32[14] = "-[VCSessionParticipantRemote setStreamGroup:syncSourceStreamGroupID:]";
      *(_WORD *)&v32[22] = 1024;
      LODWORD(v33) = 1606;
      WORD2(v33) = 2080;
      *(void *)((char *)&v33 + 6) = FourccToCStr(v5);
      int v21 = "VCSessionParticipantRemote [%s] %s:%d Camera Composition has stopped. Removing stream group with streamGroup"
            "ID=%s as a sync source";
      __int16 v22 = v20;
      uint32_t v23 = 38;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        long long v12 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
      }
      else {
        long long v12 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_32;
      }
      uint64_t v28 = VRTraceErrorLogLevelToCSTR();
      long long v29 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_32;
      }
      *(_DWORD *)uint64_t v32 = 136316418;
      *(void *)&v32[4] = v28;
      *(_WORD *)&v32[12] = 2080;
      *(void *)&v32[14] = "-[VCSessionParticipantRemote setStreamGroup:syncSourceStreamGroupID:]";
      *(_WORD *)&v32[22] = 1024;
      LODWORD(v33) = 1606;
      WORD2(v33) = 2112;
      *(void *)((char *)&v33 + 6) = v12;
      HIWORD(v33) = 2048;
      __int16 v34 = self;
      LOWORD(v35) = 2080;
      *(void *)((char *)&v35 + 2) = FourccToCStr(v5);
      int v21 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Camera Composition has stopped. Removing stream group with stre"
            "amGroupID=%s as a sync source";
      __int16 v22 = v29;
      uint32_t v23 = 58;
    }
    _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, v21, v32, v23);
LABEL_32:
    objc_msgSend(v8, "removeSyncDestination:", v9, *(void *)v32, *(_OWORD *)&v32[8], v33, v34, v35);
    [v7 addSyncDestination:v9];
    uint64_t v26 = (void *)v10;
    uint64_t v27 = 0;
    goto LABEL_33;
  }
  if (v4 == 1835623282)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_26;
      }
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      long long v15 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_26;
      }
      *(_DWORD *)uint64_t v32 = 136315906;
      *(void *)&v32[4] = v14;
      *(_WORD *)&v32[12] = 2080;
      *(void *)&v32[14] = "-[VCSessionParticipantRemote setStreamGroup:syncSourceStreamGroupID:]";
      *(_WORD *)&v32[22] = 1024;
      LODWORD(v33) = 1599;
      WORD2(v33) = 2080;
      *(void *)((char *)&v33 + 6) = FourccToCStr(v5);
      long long v16 = "VCSessionParticipantRemote [%s] %s:%d Camera Composition has resumed. Adding stream group with streamGroupID"
            "=%s as a sync source";
      uint64_t v17 = v15;
      uint32_t v18 = 38;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        long long v11 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
      }
      else {
        long long v11 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_26;
      }
      uint64_t v24 = VRTraceErrorLogLevelToCSTR();
      long long v25 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_26;
      }
      *(_DWORD *)uint64_t v32 = 136316418;
      *(void *)&v32[4] = v24;
      *(_WORD *)&v32[12] = 2080;
      *(void *)&v32[14] = "-[VCSessionParticipantRemote setStreamGroup:syncSourceStreamGroupID:]";
      *(_WORD *)&v32[22] = 1024;
      LODWORD(v33) = 1599;
      WORD2(v33) = 2112;
      *(void *)((char *)&v33 + 6) = v11;
      HIWORD(v33) = 2048;
      __int16 v34 = self;
      LOWORD(v35) = 2080;
      *(void *)((char *)&v35 + 2) = FourccToCStr(v5);
      long long v16 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Camera Composition has resumed. Adding stream group with stream"
            "GroupID=%s as a sync source";
      uint64_t v17 = v25;
      uint32_t v18 = 58;
    }
    _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, v16, v32, v18);
LABEL_26:
    objc_msgSend(v7, "removeSyncDestination:", v9, *(_OWORD *)v32, *(void *)&v32[16], v33, v34, v35);
    [v8 addSyncDestination:v9];
    uint64_t v26 = (void *)v10;
    uint64_t v27 = 1;
LABEL_33:
    [v26 setJitterBufferMode:v27];
    return;
  }
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionParticipantRemote setStreamGroup:syncSourceStreamGroupID:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v13 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v13 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v30 = VRTraceErrorLogLevelToCSTR();
      long long v31 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t v32 = 136316418;
        *(void *)&v32[4] = v30;
        *(_WORD *)&v32[12] = 2080;
        *(void *)&v32[14] = "-[VCSessionParticipantRemote setStreamGroup:syncSourceStreamGroupID:]";
        *(_WORD *)&v32[22] = 1024;
        LODWORD(v33) = 1613;
        WORD2(v33) = 2112;
        *(void *)((char *)&v33 + 6) = v13;
        HIWORD(v33) = 2048;
        __int16 v34 = self;
        LOWORD(v35) = 2080;
        *(void *)((char *)&v35 + 2) = FourccToCStr(v5);
        _os_log_error_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Unable to sync the screen stream group with streamGroupID=%s", v32, 0x3Au);
      }
    }
  }
}

- (void)reactionDidStart:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__VCSessionParticipantRemote_reactionDidStart___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __47__VCSessionParticipantRemote_reactionDidStart___block_invoke(uint64_t a1)
{
  v2[6] = *MEMORY[0x1E4F143B8];
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __47__VCSessionParticipantRemote_reactionDidStart___block_invoke_2;
  v2[3] = &unk_1E6DB6A68;
  return [*(id *)(a1 + 32) callDelegateWithBlock:v2];
}

uint64_t __47__VCSessionParticipantRemote_reactionDidStart___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 vcSessionParticipant:*(void *)(a1 + 32) reactionDidStart:*(void *)(a1 + 40)];
}

- (void)didStopReacting
{
  v3[5] = *MEMORY[0x1E4F143B8];
  participantQueue = self->super._participantQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__VCSessionParticipantRemote_didStopReacting__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(participantQueue, v3);
}

uint64_t __45__VCSessionParticipantRemote_didStopReacting__block_invoke(uint64_t a1)
{
  v3[5] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__VCSessionParticipantRemote_didStopReacting__block_invoke_2;
  v3[3] = &unk_1E6DB69A0;
  v3[4] = v1;
  return [v1 callDelegateWithBlock:v3];
}

uint64_t __45__VCSessionParticipantRemote_didStopReacting__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 vcSessionParticipantDidStopReacting:*(void *)(a1 + 32)];
}

- (id)optedInStreamIDForStreamGroupID:(unsigned int)a3
{
  id v3 = [(VCSessionParticipant *)self streamGroupWithID:*(void *)&a3];

  return (id)[v3 optedInStreamID];
}

- (id)activeDownlinkStreamIDForStreamGroupID:(unsigned int)a3
{
  id v3 = [(VCSessionParticipant *)self streamGroupWithID:*(void *)&a3];

  return (id)[v3 activeStreamID];
}

- (unsigned)actualNetworkBitrateForStreamGroup:(unsigned int)a3
{
  id v4 = [(VCSessionParticipantRemote *)self optedInStreamIDForStreamGroupID:*(void *)&a3];
  if (v4)
  {
    id v5 = [(VCSessionParticipantRemote *)self entryForStreamID:v4];
    LODWORD(v4) = [v5 actualNetworkBitrate];
  }
  return v4;
}

- (unsigned)optedInNetworkBitrateForStreamGroup:(unsigned int)a3
{
  id v4 = [(VCSessionParticipantRemote *)self optedInStreamIDForStreamGroupID:*(void *)&a3];
  if (v4)
  {
    id v5 = [(VCSessionParticipantRemote *)self entryForStreamID:v4];
    LODWORD(v4) = [v5 maxNetworkBitrate];
  }
  return v4;
}

- (void)reportConnectionTiming
{
  v3[5] = *MEMORY[0x1E4F143B8];
  participantQueue = self->super._participantQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__VCSessionParticipantRemote_reportConnectionTiming__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(participantQueue, v3);
}

uint64_t __52__VCSessionParticipantRemote_reportConnectionTiming__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reportConnectionTimingDispatched];
}

- (void)reportConnectionTimingDispatched
{
  v34[3] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._participantQueue);
  uint64_t v3 = reportingStreamGroupFromStreamGroupID();
  v33[0] = @"VCSPIDSID";
  uint64_t v4 = [NSNumber numberWithUnsignedLongLong:self->super._idsParticipantID];
  uuid = self->super._uuid;
  v34[0] = v4;
  v34[1] = uuid;
  v33[1] = @"VCSPUUID";
  v33[2] = @"VCMSStreamGroup";
  v34[2] = [NSNumber numberWithUnsignedInt:v3];
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:3];
  perfTimers = self->_perfTimers;
  id v8 = [(VCSessionParticipant *)self reportingAgent];
  VCPerfTimingUtilsReport(perfTimers, (uint64_t)v8, 0, v6, v9);
  double v10 = micro();
  -[TimingCollection setStartTime:forKey:](self->_perfTimers, "setStartTime:forKey:", 19);
  [(TimingCollection *)self->_perfTimers setStopTime:19 forKey:v10];
  [(TimingCollection *)self->_perfTimers setStartTime:23 forKey:v10];
  [(TimingCollection *)self->_perfTimers setStopTime:23 forKey:v10];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    long long v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      unint64_t idsParticipantID = self->super._idsParticipantID;
      [(TimingCollection *)self->_perfTimers totalTimeForKey:19];
      uint64_t v15 = v14;
      [(TimingCollection *)self->_perfTimers totalTimeForKey:23];
      BOOL isCameraUsedForConnectionTiming = self->_isCameraUsedForConnectionTiming;
      int v19 = 136316674;
      uint64_t v20 = v11;
      __int16 v21 = 2080;
      __int16 v22 = "-[VCSessionParticipantRemote reportConnectionTimingDispatched]";
      if (isCameraUsedForConnectionTiming) {
        uint32_t v18 = @"came";
      }
      else {
        uint32_t v18 = @"mic";
      }
      __int16 v23 = 1024;
      int v24 = 1680;
      __int16 v25 = 2048;
      unint64_t v26 = idsParticipantID;
      __int16 v27 = 2048;
      uint64_t v28 = v15;
      __int16 v29 = 2048;
      uint64_t v30 = v16;
      __int16 v31 = 2112;
      uint64_t v32 = v18;
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "VCSessionParticipantRemote [%s] %s:%d Remote participantID=%llu V2 connection timing=%f, connection timing started=%f clocked by '%@' streamGroup", (uint8_t *)&v19, 0x44u);
    }
  }
}

- (void)reportConnectionTimingWithStreamGroupDispatched:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._participantQueue);
  if (!self->_isCameraUsedForConnectionTiming) {
    goto LABEL_4;
  }
  if ([a3 streamGroupID] != 1667329381)
  {
    if (self->_isCameraUsedForConnectionTiming) {
      return;
    }
LABEL_4:
    if ([a3 streamGroupID] != 1835623282) {
      return;
    }
  }
  if (!self->_isConnectionTimingReported)
  {
    self->_isConnectionTimingReported = 1;
    perfTimers = self->_perfTimers;
    [a3 firstMediaFrameReceivedTime];
    -[TimingCollection setStopTime:forKey:](perfTimers, "setStopTime:forKey:", 19);
    uint64_t v6 = self->_perfTimers;
    [a3 firstMediaFrameReceivedTime];
    -[TimingCollection setStopTime:forKey:](v6, "setStopTime:forKey:", 23);
    [a3 setFirstMediaFrameReceivedTime:0.0];
    [(VCSessionParticipantRemote *)self reportConnectionTimingDispatched];
  }
}

- (void)didReceiveFirstFrameForStreamGroup:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  if ([a3 streamGroupID] == 1667329381
    && self->_capabilities.controlChannelVersion == 1
    && !self->_receivedFirstFrame)
  {
    self->_receivedFirstFrame = 1;
    [(VCSessionParticipantRemote *)self setRemoteVideoEnabled:1];
  }
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__VCSessionParticipantRemote_didReceiveFirstFrameForStreamGroup___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a3;
  dispatch_async(participantQueue, block);
}

unsigned char *__65__VCSessionParticipantRemote_didReceiveFirstFrameForStreamGroup___block_invoke(uint64_t a1)
{
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (result[739]) {
    return (unsigned char *)[result reportConnectionTimingWithStreamGroupDispatched:*(void *)(a1 + 40)];
  }
  return result;
}

- (void)redundancyController:(id)a3 redundancyPercentageDidChange:(unsigned int)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (![+[VCDefaults sharedInstance] forceFECRepairStream])
  {
    participantQueue = self->super._participantQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __81__VCSessionParticipantRemote_redundancyController_redundancyPercentageDidChange___block_invoke;
    v8[3] = &unk_1E6DB3EE0;
    v8[4] = a3;
    v8[5] = self;
    unsigned int v9 = a4;
    dispatch_async(participantQueue, v8);
  }
}

void __81__VCSessionParticipantRemote_redundancyController_redundancyPercentageDidChange___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32) != *(void *)(*(void *)(a1 + 40) + 440)) {
    return;
  }
  if (objc_opt_class() == *(void *)(a1 + 40))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v5 = *(_DWORD *)(a1 + 48);
        *(_DWORD *)buf = 136315906;
        uint64_t v32 = v3;
        __int16 v33 = 2080;
        __int16 v34 = "-[VCSessionParticipantRemote redundancyController:redundancyPercentageDidChange:]_block_invoke";
        __int16 v35 = 1024;
        int v36 = 1726;
        __int16 v37 = 1024;
        LODWORD(v38) = v5;
        uint64_t v6 = "VCSessionParticipantRemote [%s] %s:%d New redundancy percentage %d";
        id v7 = v4;
        uint32_t v8 = 34;
LABEL_13:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      int v2 = (__CFString *)[*(id *)(a1 + 40) performSelector:sel_logPrefix];
    }
    else {
      int v2 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 40);
        int v12 = *(_DWORD *)(a1 + 48);
        *(_DWORD *)buf = 136316418;
        uint64_t v32 = v9;
        __int16 v33 = 2080;
        __int16 v34 = "-[VCSessionParticipantRemote redundancyController:redundancyPercentageDidChange:]_block_invoke";
        __int16 v35 = 1024;
        int v36 = 1726;
        __int16 v37 = 2112;
        __int16 v38 = v2;
        __int16 v39 = 2048;
        uint64_t v40 = v11;
        __int16 v41 = 1024;
        int v42 = v12;
        uint64_t v6 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) New redundancy percentage %d";
        id v7 = v10;
        uint32_t v8 = 54;
        goto LABEL_13;
      }
    }
  }
  uint64_t v13 = *(void *)(a1 + 40);
  if (*(_DWORD *)(a1 + 48))
  {
    if (*(unsigned char *)(v13 + 577)) {
      return;
    }
    *(unsigned char *)(v13 + 577) = 1;
    uint64_t v14 = *(void **)(a1 + 40);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __81__VCSessionParticipantRemote_redundancyController_redundancyPercentageDidChange___block_invoke_122;
    v29[3] = &unk_1E6DB69A0;
    v29[4] = v14;
    [v14 callDelegateWithBlock:v29];
    if (objc_opt_class() != *(void *)(a1 + 40))
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v15 = (__CFString *)[*(id *)(a1 + 40) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v15 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v24 = VRTraceErrorLogLevelToCSTR();
        __int16 v25 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v26 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 136316162;
          uint64_t v32 = v24;
          __int16 v33 = 2080;
          __int16 v34 = "-[VCSessionParticipantRemote redundancyController:redundancyPercentageDidChange:]_block_invoke";
          __int16 v35 = 1024;
          int v36 = 1741;
          __int16 v37 = 2112;
          __int16 v38 = v15;
          __int16 v39 = 2048;
          uint64_t v40 = v26;
          uint64_t v20 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Requesting video redundancy";
LABEL_38:
          __int16 v22 = v25;
          uint32_t v23 = 48;
          goto LABEL_39;
        }
      }
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return;
    }
    uint64_t v18 = VRTraceErrorLogLevelToCSTR();
    int v19 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v32 = v18;
    __int16 v33 = 2080;
    __int16 v34 = "-[VCSessionParticipantRemote redundancyController:redundancyPercentageDidChange:]_block_invoke_2";
    __int16 v35 = 1024;
    int v36 = 1741;
    uint64_t v20 = "VCSessionParticipantRemote [%s] %s:%d Requesting video redundancy";
LABEL_29:
    __int16 v22 = v19;
    uint32_t v23 = 28;
LABEL_39:
    _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, v20, buf, v23);
    return;
  }
  if (!*(unsigned char *)(v13 + 577)) {
    return;
  }
  *(unsigned char *)(v13 + 577) = 0;
  uint64_t v16 = *(void **)(a1 + 40);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __81__VCSessionParticipantRemote_redundancyController_redundancyPercentageDidChange___block_invoke_120;
  v30[3] = &unk_1E6DB69A0;
  v30[4] = v16;
  [v16 callDelegateWithBlock:v30];
  if (objc_opt_class() == *(void *)(a1 + 40))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return;
    }
    uint64_t v21 = VRTraceErrorLogLevelToCSTR();
    int v19 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v32 = v21;
    __int16 v33 = 2080;
    __int16 v34 = "-[VCSessionParticipantRemote redundancyController:redundancyPercentageDidChange:]_block_invoke_2";
    __int16 v35 = 1024;
    int v36 = 1734;
    uint64_t v20 = "VCSessionParticipantRemote [%s] %s:%d Dismissing video redundancy";
    goto LABEL_29;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v17 = (__CFString *)[*(id *)(a1 + 40) performSelector:sel_logPrefix];
  }
  else {
    uint64_t v17 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v27 = VRTraceErrorLogLevelToCSTR();
    __int16 v25 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136316162;
      uint64_t v32 = v27;
      __int16 v33 = 2080;
      __int16 v34 = "-[VCSessionParticipantRemote redundancyController:redundancyPercentageDidChange:]_block_invoke";
      __int16 v35 = 1024;
      int v36 = 1734;
      __int16 v37 = 2112;
      __int16 v38 = v17;
      __int16 v39 = 2048;
      uint64_t v40 = v28;
      uint64_t v20 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Dismissing video redundancy";
      goto LABEL_38;
    }
  }
}

uint64_t __81__VCSessionParticipantRemote_redundancyController_redundancyPercentageDidChange___block_invoke_120(uint64_t a1, void *a2)
{
  return [a2 vcSessionParticipant:*(void *)(a1 + 32) didRequestVideoRedundancy:0];
}

uint64_t __81__VCSessionParticipantRemote_redundancyController_redundancyPercentageDidChange___block_invoke_122(uint64_t a1, void *a2)
{
  return [a2 vcSessionParticipant:*(void *)(a1 + 32) didRequestVideoRedundancy:1];
}

- (void)collectVideoChannelMetrics:(id *)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  VCMediaChannelMetrics_Reset((uint64_t)a3);
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__VCSessionParticipantRemote_collectVideoChannelMetrics___block_invoke;
  block[3] = &unk_1E6DB4568;
  block[4] = self;
  void block[5] = a3;
  dispatch_sync(participantQueue, block);
}

uint64_t __57__VCSessionParticipantRemote_collectVideoChannelMetrics___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  int v2 = *(void **)(*(void *)(a1 + 32) + 488);
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
  block[2] = __57__VCSessionParticipantRemote_collectAudioChannelMetrics___block_invoke;
  block[3] = &unk_1E6DB4568;
  block[4] = self;
  void block[5] = a3;
  dispatch_sync(participantQueue, block);
}

uint64_t __57__VCSessionParticipantRemote_collectAudioChannelMetrics___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  int v2 = *(void **)(*(void *)(a1 + 32) + 480);
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

- (void)pushEventToNwActivity:(int64_t)a3 started:(BOOL)a4
{
  int v5 = a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (a3 == 8)
  {
    id v7 = &OBJC_IVAR___VCSessionParticipantRemote__participantPoorConnectionNwActivity;
  }
  else
  {
    if (a3 != 9)
    {
      if ((VCSessionParticipantRemote *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
          return;
        }
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        long long v12 = *MEMORY[0x1E4F47A50];
        uint64_t v13 = *MEMORY[0x1E4F47A50];
        if (!*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
            -[VCSessionParticipantRemote pushEventToNwActivity:started:]();
          }
          return;
        }
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
          return;
        }
        int v23 = 136315906;
        uint64_t v24 = v11;
        __int16 v25 = 2080;
        uint64_t v26 = "-[VCSessionParticipantRemote pushEventToNwActivity:started:]";
        __int16 v27 = 1024;
        int v28 = 1785;
        __int16 v29 = 1024;
        LODWORD(v30) = v5;
        uint64_t v14 = "VCSessionParticipantRemote [%s] %s:%d Invalid NW activity label:%d";
        uint64_t v15 = v12;
        uint32_t v16 = 34;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          long long v9 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
        }
        else {
          long long v9 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
          return;
        }
        uint64_t v17 = VRTraceErrorLogLevelToCSTR();
        uint64_t v18 = *MEMORY[0x1E4F47A50];
        int v19 = *MEMORY[0x1E4F47A50];
        if (!*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            int v23 = 136316418;
            uint64_t v24 = v17;
            __int16 v25 = 2080;
            uint64_t v26 = "-[VCSessionParticipantRemote pushEventToNwActivity:started:]";
            __int16 v27 = 1024;
            int v28 = 1785;
            __int16 v29 = 2112;
            uint64_t v30 = v9;
            __int16 v31 = 2048;
            uint64_t v32 = self;
            __int16 v33 = 1024;
            int v34 = v5;
            _os_log_debug_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEBUG, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Invalid NW activity label:%d", (uint8_t *)&v23, 0x36u);
          }
          return;
        }
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
          return;
        }
        int v23 = 136316418;
        uint64_t v24 = v17;
        __int16 v25 = 2080;
        uint64_t v26 = "-[VCSessionParticipantRemote pushEventToNwActivity:started:]";
        __int16 v27 = 1024;
        int v28 = 1785;
        __int16 v29 = 2112;
        uint64_t v30 = v9;
        __int16 v31 = 2048;
        uint64_t v32 = self;
        __int16 v33 = 1024;
        int v34 = v5;
        uint64_t v14 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Invalid NW activity label:%d";
        uint64_t v15 = v18;
        uint32_t v16 = 54;
      }
      _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v23, v16);
      return;
    }
    id v7 = &OBJC_IVAR___VCSessionParticipantRemote__participantMediaStallNwActivity;
  }
  uint64_t v8 = *v7;
  if (*(Class *)((char *)&self->super.super.super.isa + v8))
  {
    if (a4) {
      return;
    }
LABEL_15:
    nw_activity_complete_with_reason();
    nw_release(*(void **)((char *)&self->super.super.super.isa + v8));
    *(Class *)((char *)&self->super.super.super.isa + v8) = 0;
    return;
  }
  long long v10 = (objc_class *)nw_activity_create();
  *(Class *)((char *)&self->super.super.super.isa + v8) = v10;
  if (v10)
  {
    if (self->_nwActivity) {
      nw_activity_set_parent_activity();
    }
    nw_activity_activate();
    if (!a4) {
      goto LABEL_15;
    }
  }
  else if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionParticipantRemote pushEventToNwActivity:started:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v20 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v20 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      __int16 v22 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v23 = 136316162;
        uint64_t v24 = v21;
        __int16 v25 = 2080;
        uint64_t v26 = "-[VCSessionParticipantRemote pushEventToNwActivity:started:]";
        __int16 v27 = 1024;
        int v28 = 1791;
        __int16 v29 = 2112;
        uint64_t v30 = v20;
        __int16 v31 = 2048;
        uint64_t v32 = self;
        _os_log_error_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to create event nwActivity", (uint8_t *)&v23, 0x30u);
      }
    }
  }
}

- (void)setVideoDegraded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  BOOL isVideoDegraded = self->_isVideoDegraded;
  uint64_t v6 = (VCSessionParticipantRemote *)objc_opt_class();
  if (isVideoDegraded != v3)
  {
    if (v6 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_24;
      }
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      uint32_t v16 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      *(_DWORD *)uint64_t v26 = 136315906;
      *(void *)&v26[4] = v15;
      *(_WORD *)&v26[12] = 2080;
      *(void *)&v26[14] = "-[VCSessionParticipantRemote setVideoDegraded:]";
      *(_WORD *)&v26[22] = 1024;
      LODWORD(v27) = 1812;
      WORD2(v27) = 1024;
      *(_DWORD *)((char *)&v27 + 6) = v3;
      uint64_t v17 = "VCSessionParticipantRemote [%s] %s:%d videoDegraded=%d";
      uint64_t v18 = v16;
      uint32_t v19 = 34;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v8 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v8 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_24;
      }
      uint64_t v23 = VRTraceErrorLogLevelToCSTR();
      uint64_t v24 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      *(_DWORD *)uint64_t v26 = 136316418;
      *(void *)&v26[4] = v23;
      *(_WORD *)&v26[12] = 2080;
      *(void *)&v26[14] = "-[VCSessionParticipantRemote setVideoDegraded:]";
      *(_WORD *)&v26[22] = 1024;
      LODWORD(v27) = 1812;
      WORD2(v27) = 2112;
      *(void *)((char *)&v27 + 6) = v8;
      HIWORD(v27) = 2048;
      int v28 = self;
      LOWORD(v29) = 1024;
      *(_DWORD *)((char *)&v29 + 2) = v3;
      uint64_t v17 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) videoDegraded=%d";
      uint64_t v18 = v24;
      uint32_t v19 = 54;
    }
    _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, v17, v26, v19);
LABEL_24:
    int64_t v25 = [(VCMediaStream *)[(VCSessionParticipantMediaStreamInfo *)[(VCSessionParticipantRemote *)self cameraStreamInfo] stream] streamToken];
    if (!-[VCDefaults forceDisableVideoDegraded](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceDisableVideoDegraded"))[(id)VCRemoteVideoManager_DefaultManager() remoteVideoDidDegrade:v3 streamToken:v25]; {
    self->_BOOL isVideoDegraded = v3;
    }
    [(VCSessionParticipant *)self participantVideoToken];
    kdebug_trace();
    [(VCSessionParticipantRemote *)self pushEventToNwActivity:8 started:v3];
    return;
  }
  if (v6 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      long long v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL v11 = self->_isVideoDegraded;
        *(_DWORD *)uint64_t v26 = 136315906;
        *(void *)&v26[4] = v9;
        *(_WORD *)&v26[12] = 2080;
        *(void *)&v26[14] = "-[VCSessionParticipantRemote setVideoDegraded:]";
        *(_WORD *)&v26[22] = 1024;
        LODWORD(v27) = 1808;
        WORD2(v27) = 1024;
        *(_DWORD *)((char *)&v27 + 6) = v11;
        long long v12 = "VCSessionParticipantRemote [%s] %s:%d Ignoring setVideoDegraded=%d with same value";
        uint64_t v13 = v10;
        uint32_t v14 = 34;
LABEL_18:
        _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, v26, v14);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      id v7 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      id v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      uint64_t v21 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL v22 = self->_isVideoDegraded;
        *(_DWORD *)uint64_t v26 = 136316418;
        *(void *)&v26[4] = v20;
        *(_WORD *)&v26[12] = 2080;
        *(void *)&v26[14] = "-[VCSessionParticipantRemote setVideoDegraded:]";
        *(_WORD *)&v26[22] = 1024;
        LODWORD(v27) = 1808;
        WORD2(v27) = 2112;
        *(void *)((char *)&v27 + 6) = v7;
        HIWORD(v27) = 2048;
        int v28 = self;
        LOWORD(v29) = 1024;
        *(_DWORD *)((char *)&v29 + 2) = v22;
        long long v12 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Ignoring setVideoDegraded=%d with same value";
        uint64_t v13 = v21;
        uint32_t v14 = 54;
        goto LABEL_18;
      }
    }
  }
}

- (void)networkQualityDidDegrade:(BOOL)a3 isLocalNetworkQualityDegraded:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  int64_t v6 = [(VCMediaStream *)[(VCSessionParticipantMediaStreamInfo *)[(VCSessionParticipantRemote *)self cameraStreamInfo] stream] streamToken];
  id v7 = (void *)VCRemoteVideoManager_DefaultManager();

  [v7 networkQualityDidDegrade:v5 isLocalNetworkQualityDegraded:v4 streamToken:v6];
}

- (void)setRemoteMediaStalled:(BOOL)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (self->_isRemoteMediaStalled == a3)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v5 = VRTraceErrorLogLevelToCSTR();
        int64_t v6 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          BOOL isRemoteMediaStalled = self->_isRemoteMediaStalled;
          int v14 = 136315906;
          uint64_t v15 = v5;
          __int16 v16 = 2080;
          uint64_t v17 = "-[VCSessionParticipantRemote setRemoteMediaStalled:]";
          __int16 v18 = 1024;
          int v19 = 1830;
          __int16 v20 = 1024;
          LODWORD(v21) = isRemoteMediaStalled;
          uint64_t v8 = "VCSessionParticipantRemote [%s] %s:%d Ignoring setRemoteMediaStalled=%d with same value";
          uint64_t v9 = v6;
          uint32_t v10 = 34;
LABEL_15:
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v14, v10);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        BOOL v4 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
      }
      else {
        BOOL v4 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        long long v12 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          BOOL v13 = self->_isRemoteMediaStalled;
          int v14 = 136316418;
          uint64_t v15 = v11;
          __int16 v16 = 2080;
          uint64_t v17 = "-[VCSessionParticipantRemote setRemoteMediaStalled:]";
          __int16 v18 = 1024;
          int v19 = 1830;
          __int16 v20 = 2112;
          uint64_t v21 = v4;
          __int16 v22 = 2048;
          uint64_t v23 = self;
          __int16 v24 = 1024;
          BOOL v25 = v13;
          uint64_t v8 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Ignoring setRemoteMediaStalled=%d with same value";
          uint64_t v9 = v12;
          uint32_t v10 = 54;
          goto LABEL_15;
        }
      }
    }
  }
  else
  {
    self->_BOOL isRemoteMediaStalled = a3;
    [(VCSessionParticipantRemote *)self pushEventToNwActivity:9 started:a3];
  }
}

+ (BOOL)isDeviceLargeScreen
{
  int v2 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettingsEmbedded *)v2 isDeviceLargeScreen];
}

+ (unsigned)maxAudioNetworkBitrateForLocalInterfaceOnWiFi:(BOOL)a3 isLowLatencyAudio:(BOOL)a4
{
  BOOL v4 = a3;
  unsigned int result = [+[VCHardwareSettingsEmbedded sharedInstance] maxNetworkBitrateMultiwayAudioOnWifi:a3 isLowLatencyAudio:a4];
  if (v4) {
    unsigned int v6 = 165600;
  }
  else {
    unsigned int v6 = 55000;
  }
  if (result >= v6) {
    return v6;
  }
  return result;
}

+ (unsigned)maxCameraQualityIndexWithRedundancyForVideoQuality:(unsigned __int8)a3 useWiFiTable:(BOOL)a4 enableNewTier:(BOOL)a5
{
  BOOL v5 = a4;
  if (a3 == 10)
  {
    if (a4) {
      return 425;
    }
    else {
      return 250;
    }
  }
  else if (a3 == 5)
  {
    BOOL v7 = a5;
    int v8 = [a1 isDeviceLargeScreen];
    if (v5 || v7) {
      unsigned int v9 = 250;
    }
    else {
      unsigned int v9 = 125;
    }
    if (v5) {
      unsigned int v10 = 425;
    }
    else {
      unsigned int v10 = 250;
    }
    if (v8) {
      return v10;
    }
    else {
      return v9;
    }
  }
  else if (a3)
  {
    return 0;
  }
  else
  {
    return 62;
  }
}

+ (unsigned)maxCameraQualityIndexForVideoQuality:(unsigned __int8)a3 useWiFiTable:(BOOL)a4 isSharingEnabled:(BOOL)a5 enableNewTier:(BOOL)a6
{
  BOOL v7 = a4;
  if (a3 == 10)
  {
    if (a4) {
      unsigned int v8 = 1800;
    }
    else {
      unsigned int v8 = 250;
    }
  }
  else if (a3 == 5)
  {
    BOOL v9 = a6;
    int v10 = [a1 isDeviceLargeScreen];
    if (v7 || v9) {
      unsigned int v8 = 250;
    }
    else {
      unsigned int v8 = 125;
    }
    if (v7) {
      int v11 = 1000;
    }
    else {
      int v11 = 250;
    }
    if (v10) {
      unsigned int v8 = v11;
    }
  }
  else if (a3)
  {
    unsigned int v8 = 0;
  }
  else
  {
    unsigned int v8 = 62;
  }
  if (v8 > 0x1A9 && a5) {
    return 425;
  }
  else {
    return v8;
  }
}

+ (unsigned)maxWebRTCCameraQualityIndexForVideoQuality:(unsigned __int8)a3 isLocalOnWiFi:(BOOL)a4 isSharingEnabled:(BOOL)a5 enableNewTier:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  int v9 = a3;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  BOOL v11 = a5
     && +[VCHardwareSettings limitCameraDownlinkBitrateDuringSharing];
  int v12 = v8 && !v11;
  if (v9 == 10)
  {
    if (v12) {
      unsigned int v13 = 1250;
    }
    else {
      unsigned int v13 = 400;
    }
  }
  else if (v9 == 5)
  {
    int v14 = [a1 isDeviceLargeScreen];
    if (v12 | v6) {
      int v15 = 400;
    }
    else {
      int v15 = 93;
    }
    if (v12) {
      int v16 = 1250;
    }
    else {
      int v16 = 400;
    }
    if (v14) {
      unsigned int v13 = v16;
    }
    else {
      unsigned int v13 = v15;
    }
  }
  else if (v9)
  {
    unsigned int v13 = 0;
  }
  else
  {
    unsigned int v13 = 93;
  }
  if ((id)objc_opt_class() != a1)
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v17 = (__CFString *)[a1 performSelector:sel_logPrefix];
    }
    else {
      uint64_t v17 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
      return v13;
    }
    uint64_t v24 = VRTraceErrorLogLevelToCSTR();
    BOOL v25 = *MEMORY[0x1E4F47A50];
    uint64_t v26 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        int v31 = 136317954;
        uint64_t v32 = v24;
        __int16 v33 = 2080;
        int v34 = "+[VCSessionParticipantRemote maxWebRTCCameraQualityIndexForVideoQuality:isLocalOnWiFi:isSharingEnabled:enableNewTier:]";
        __int16 v35 = 1024;
        int v36 = 1944;
        __int16 v37 = 2112;
        *(void *)__int16 v38 = v17;
        *(_WORD *)&v38[8] = 2048;
        id v39 = a1;
        *(_WORD *)uint64_t v40 = 1024;
        *(_DWORD *)&v40[2] = v9;
        *(_WORD *)__int16 v41 = 1024;
        *(_DWORD *)&v41[2] = v8;
        *(_WORD *)int v42 = 1024;
        *(_DWORD *)&v42[2] = [a1 isDeviceLargeScreen];
        *(_WORD *)uint64_t v43 = 1024;
        *(_DWORD *)&v43[2] = v7;
        __int16 v44 = 1024;
        BOOL v45 = v11;
        __int16 v46 = 1024;
        unsigned int v47 = v13;
        __int16 v48 = 1024;
        BOOL v49 = v6;
        uint64_t v21 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) videoQuality=%d isLocalOnWiFi=%d isDeviceLargeScreen=%d isSha"
              "ringEnabled=%d, shouldLimitCameraQualityForSharing=%d, maxQualityIndex=%d, enableNewTier=%d";
        __int16 v22 = v25;
        uint32_t v23 = 90;
        goto LABEL_33;
      }
      return v13;
    }
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      return v13;
    }
    int v31 = 136317954;
    uint64_t v32 = v24;
    __int16 v33 = 2080;
    int v34 = "+[VCSessionParticipantRemote maxWebRTCCameraQualityIndexForVideoQuality:isLocalOnWiFi:isSharingEnabled:enableNewTier:]";
    __int16 v35 = 1024;
    int v36 = 1944;
    __int16 v37 = 2112;
    *(void *)__int16 v38 = v17;
    *(_WORD *)&v38[8] = 2048;
    id v39 = a1;
    *(_WORD *)uint64_t v40 = 1024;
    *(_DWORD *)&v40[2] = v9;
    *(_WORD *)__int16 v41 = 1024;
    *(_DWORD *)&v41[2] = v8;
    *(_WORD *)int v42 = 1024;
    *(_DWORD *)&v42[2] = [a1 isDeviceLargeScreen];
    *(_WORD *)uint64_t v43 = 1024;
    *(_DWORD *)&v43[2] = v7;
    __int16 v44 = 1024;
    BOOL v45 = v11;
    __int16 v46 = 1024;
    unsigned int v47 = v13;
    __int16 v48 = 1024;
    BOOL v49 = v6;
    long long v27 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) videoQuality=%d isLocalOnWiFi=%d isDeviceLargeScreen=%d isSharing"
          "Enabled=%d, shouldLimitCameraQualityForSharing=%d, maxQualityIndex=%d, enableNewTier=%d";
    int v28 = v25;
    uint32_t v29 = 90;
LABEL_39:
    _os_log_debug_impl(&dword_1E1EA4000, v28, OS_LOG_TYPE_DEBUG, v27, (uint8_t *)&v31, v29);
    return v13;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
    return v13;
  }
  uint64_t v18 = VRTraceErrorLogLevelToCSTR();
  int v19 = *MEMORY[0x1E4F47A50];
  __int16 v20 = *MEMORY[0x1E4F47A50];
  if (!*MEMORY[0x1E4F47A40])
  {
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      return v13;
    }
    int v31 = 136317442;
    uint64_t v32 = v18;
    __int16 v33 = 2080;
    int v34 = "+[VCSessionParticipantRemote maxWebRTCCameraQualityIndexForVideoQuality:isLocalOnWiFi:isSharingEnabled:enableNewTier:]";
    __int16 v35 = 1024;
    int v36 = 1944;
    __int16 v37 = 1024;
    *(_DWORD *)__int16 v38 = v9;
    *(_WORD *)&v38[4] = 1024;
    *(_DWORD *)&v38[6] = v8;
    LOWORD(v39) = 1024;
    *(_DWORD *)((char *)&v39 + 2) = [a1 isDeviceLargeScreen];
    HIWORD(v39) = 1024;
    *(_DWORD *)uint64_t v40 = v7;
    *(_WORD *)&v40[4] = 1024;
    *(_DWORD *)__int16 v41 = v11;
    *(_WORD *)&v41[4] = 1024;
    *(_DWORD *)int v42 = v13;
    *(_WORD *)&v42[4] = 1024;
    *(_DWORD *)uint64_t v43 = v6;
    long long v27 = "VCSessionParticipantRemote [%s] %s:%d videoQuality=%d isLocalOnWiFi=%d isDeviceLargeScreen=%d isSharingEnabled"
          "=%d, shouldLimitCameraQualityForSharing=%d, maxQualityIndex=%d, enableNewTier=%d";
    int v28 = v19;
    uint32_t v29 = 70;
    goto LABEL_39;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    int v31 = 136317442;
    uint64_t v32 = v18;
    __int16 v33 = 2080;
    int v34 = "+[VCSessionParticipantRemote maxWebRTCCameraQualityIndexForVideoQuality:isLocalOnWiFi:isSharingEnabled:enableNewTier:]";
    __int16 v35 = 1024;
    int v36 = 1944;
    __int16 v37 = 1024;
    *(_DWORD *)__int16 v38 = v9;
    *(_WORD *)&v38[4] = 1024;
    *(_DWORD *)&v38[6] = v8;
    LOWORD(v39) = 1024;
    *(_DWORD *)((char *)&v39 + 2) = [a1 isDeviceLargeScreen];
    HIWORD(v39) = 1024;
    *(_DWORD *)uint64_t v40 = v7;
    *(_WORD *)&v40[4] = 1024;
    *(_DWORD *)__int16 v41 = v11;
    *(_WORD *)&v41[4] = 1024;
    *(_DWORD *)int v42 = v13;
    *(_WORD *)&v42[4] = 1024;
    *(_DWORD *)uint64_t v43 = v6;
    uint64_t v21 = "VCSessionParticipantRemote [%s] %s:%d videoQuality=%d isLocalOnWiFi=%d isDeviceLargeScreen=%d isSharingEnabled"
          "=%d, shouldLimitCameraQualityForSharing=%d, maxQualityIndex=%d, enableNewTier=%d";
    __int16 v22 = v19;
    uint32_t v23 = 70;
LABEL_33:
    _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v31, v23);
  }
  return v13;
}

+ (unsigned)maxCameraQualityIndexForVideoQuality:(unsigned __int8)a3 isLocalOnWiFi:(BOOL)a4 isRedundancyRequested:(BOOL)a5 isSharingEnabled:(BOOL)a6 enableNewTier:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  uint64_t v11 = a3;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  BOOL v13 = a6
     && +[VCHardwareSettings limitCameraDownlinkBitrateDuringSharing];
  BOOL v14 = v10 && !v13;
  if (v9) {
    unsigned int v15 = [a1 maxCameraQualityIndexWithRedundancyForVideoQuality:v11 useWiFiTable:v14 enableNewTier:v7];
  }
  else {
    unsigned int v15 = [a1 maxCameraQualityIndexForVideoQuality:v11 useWiFiTable:v14 isSharingEnabled:v8 enableNewTier:v7];
  }
  unsigned int v16 = v15;
  if ((id)objc_opt_class() != a1)
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v17 = (__CFString *)[a1 performSelector:sel_logPrefix];
    }
    else {
      uint64_t v17 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
      return v16;
    }
    uint64_t v24 = VRTraceErrorLogLevelToCSTR();
    BOOL v25 = *MEMORY[0x1E4F47A50];
    os_log_t log = (os_log_t)*MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136318210;
        uint64_t v32 = v24;
        __int16 v33 = 2080;
        int v34 = "+[VCSessionParticipantRemote maxCameraQualityIndexForVideoQuality:isLocalOnWiFi:isRedundancyRequested:isSh"
              "aringEnabled:enableNewTier:]";
        __int16 v35 = 1024;
        int v36 = 1959;
        __int16 v37 = 2112;
        *(void *)__int16 v38 = v17;
        *(_WORD *)&v38[8] = 2048;
        id v39 = a1;
        *(_WORD *)uint64_t v40 = 1024;
        *(_DWORD *)&v40[2] = v11;
        *(_WORD *)__int16 v41 = 1024;
        *(_DWORD *)&v41[2] = v9;
        *(_WORD *)int v42 = 1024;
        *(_DWORD *)&v42[2] = v10;
        *(_WORD *)uint64_t v43 = 1024;
        *(_DWORD *)&v43[2] = [a1 isDeviceLargeScreen];
        *(_WORD *)__int16 v44 = 1024;
        *(_DWORD *)&v44[2] = v8;
        __int16 v45 = 1024;
        BOOL v46 = v13;
        __int16 v47 = 1024;
        unsigned int v48 = v16;
        __int16 v49 = 1024;
        BOOL v50 = v7;
        uint64_t v21 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) videoQuality=%d isRedundancyRequested=%d isLocalOnWiFi=%d isD"
              "eviceLargeScreen=%d isSharingEnabled=%d, shouldLimitCameraQualityForSharing=%d, maxQualityIndex=%d, enableNewTier=%d";
        __int16 v22 = log;
        uint32_t v23 = 96;
        goto LABEL_19;
      }
      return v16;
    }
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      return v16;
    }
    *(_DWORD *)buf = 136318210;
    uint64_t v32 = v24;
    __int16 v33 = 2080;
    int v34 = "+[VCSessionParticipantRemote maxCameraQualityIndexForVideoQuality:isLocalOnWiFi:isRedundancyRequested:isSharin"
          "gEnabled:enableNewTier:]";
    __int16 v35 = 1024;
    int v36 = 1959;
    __int16 v37 = 2112;
    *(void *)__int16 v38 = v17;
    *(_WORD *)&v38[8] = 2048;
    id v39 = a1;
    *(_WORD *)uint64_t v40 = 1024;
    *(_DWORD *)&v40[2] = v11;
    *(_WORD *)__int16 v41 = 1024;
    *(_DWORD *)&v41[2] = v9;
    *(_WORD *)int v42 = 1024;
    *(_DWORD *)&v42[2] = v10;
    *(_WORD *)uint64_t v43 = 1024;
    *(_DWORD *)&v43[2] = [a1 isDeviceLargeScreen];
    *(_WORD *)__int16 v44 = 1024;
    *(_DWORD *)&v44[2] = v8;
    __int16 v45 = 1024;
    BOOL v46 = v13;
    __int16 v47 = 1024;
    unsigned int v48 = v16;
    __int16 v49 = 1024;
    BOOL v50 = v7;
    uint64_t v26 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) videoQuality=%d isRedundancyRequested=%d isLocalOnWiFi=%d isDevic"
          "eLargeScreen=%d isSharingEnabled=%d, shouldLimitCameraQualityForSharing=%d, maxQualityIndex=%d, enableNewTier=%d";
    long long v27 = log;
    uint32_t v28 = 96;
LABEL_25:
    _os_log_debug_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEBUG, v26, buf, v28);
    return v16;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
    return v16;
  }
  uint64_t v18 = VRTraceErrorLogLevelToCSTR();
  int v19 = *MEMORY[0x1E4F47A50];
  __int16 v20 = *MEMORY[0x1E4F47A50];
  if (!*MEMORY[0x1E4F47A40])
  {
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      return v16;
    }
    *(_DWORD *)buf = 136317698;
    uint64_t v32 = v18;
    __int16 v33 = 2080;
    int v34 = "+[VCSessionParticipantRemote maxCameraQualityIndexForVideoQuality:isLocalOnWiFi:isRedundancyRequested:isSharin"
          "gEnabled:enableNewTier:]";
    __int16 v35 = 1024;
    int v36 = 1959;
    __int16 v37 = 1024;
    *(_DWORD *)__int16 v38 = v11;
    *(_WORD *)&v38[4] = 1024;
    *(_DWORD *)&v38[6] = v9;
    LOWORD(v39) = 1024;
    *(_DWORD *)((char *)&v39 + 2) = v10;
    HIWORD(v39) = 1024;
    *(_DWORD *)uint64_t v40 = [a1 isDeviceLargeScreen];
    *(_WORD *)&v40[4] = 1024;
    *(_DWORD *)__int16 v41 = v8;
    *(_WORD *)&v41[4] = 1024;
    *(_DWORD *)int v42 = v13;
    *(_WORD *)&v42[4] = 1024;
    *(_DWORD *)uint64_t v43 = v16;
    *(_WORD *)&v43[4] = 1024;
    *(_DWORD *)__int16 v44 = v7;
    uint64_t v26 = "VCSessionParticipantRemote [%s] %s:%d videoQuality=%d isRedundancyRequested=%d isLocalOnWiFi=%d isDeviceLargeS"
          "creen=%d isSharingEnabled=%d, shouldLimitCameraQualityForSharing=%d, maxQualityIndex=%d, enableNewTier=%d";
    long long v27 = v19;
    uint32_t v28 = 76;
    goto LABEL_25;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136317698;
    uint64_t v32 = v18;
    __int16 v33 = 2080;
    int v34 = "+[VCSessionParticipantRemote maxCameraQualityIndexForVideoQuality:isLocalOnWiFi:isRedundancyRequested:isSharin"
          "gEnabled:enableNewTier:]";
    __int16 v35 = 1024;
    int v36 = 1959;
    __int16 v37 = 1024;
    *(_DWORD *)__int16 v38 = v11;
    *(_WORD *)&v38[4] = 1024;
    *(_DWORD *)&v38[6] = v9;
    LOWORD(v39) = 1024;
    *(_DWORD *)((char *)&v39 + 2) = v10;
    HIWORD(v39) = 1024;
    *(_DWORD *)uint64_t v40 = [a1 isDeviceLargeScreen];
    *(_WORD *)&v40[4] = 1024;
    *(_DWORD *)__int16 v41 = v8;
    *(_WORD *)&v41[4] = 1024;
    *(_DWORD *)int v42 = v13;
    *(_WORD *)&v42[4] = 1024;
    *(_DWORD *)uint64_t v43 = v16;
    *(_WORD *)&v43[4] = 1024;
    *(_DWORD *)__int16 v44 = v7;
    uint64_t v21 = "VCSessionParticipantRemote [%s] %s:%d videoQuality=%d isRedundancyRequested=%d isLocalOnWiFi=%d isDeviceLargeS"
          "creen=%d isSharingEnabled=%d, shouldLimitCameraQualityForSharing=%d, maxQualityIndex=%d, enableNewTier=%d";
    __int16 v22 = v19;
    uint32_t v23 = 76;
LABEL_19:
    _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
  }
  return v16;
}

+ (unsigned)maxFtxtQualityIndexForVideoQuality:(unsigned __int8)a3 isLocalOnWiFi:(BOOL)a4 isRedundancyRequested:(BOOL)a5 isSharingEnabled:(BOOL)a6
{
  if (a6) {
    unsigned int v6 = 135;
  }
  else {
    unsigned int v6 = 275;
  }
  if (a3) {
    int v7 = 0;
  }
  else {
    int v7 = 96;
  }
  if (a3 == 5) {
    unsigned int v8 = 135;
  }
  else {
    unsigned int v8 = v7;
  }
  if (a3 == 10) {
    return v6;
  }
  else {
    return v8;
  }
}

+ (unsigned)maxBdatQualityIndexForVideoQuality:(unsigned __int8)a3 isLocalOnWiFi:(BOOL)a4
{
  if (a3 == 10 || a3 == 5) {
    return 140;
  }
  if (a3) {
    return 0;
  }
  return 98;
}

+ (unsigned)maxFdatQualityIndexForVideoQuality:(unsigned __int8)a3 isLocalOnWiFi:(BOOL)a4
{
  if (a3 == 10 || a3 == 5) {
    return 145;
  }
  if (a3) {
    return 0;
  }
  return 99;
}

+ (unsigned)maxQualityIndexForStreamGroupID:(unsigned int)a3 videoQuality:(unsigned __int8)a4 isLocalOnWiFi:(BOOL)a5 isRedundancyRequested:(BOOL)a6 isSharingEnabled:(BOOL)a7 enableNewTier:(BOOL)a8
{
  if ((int)a3 <= 1667329398)
  {
    if (a3 == 1650745716) {
      return [a1 maxBdatQualityIndexForVideoQuality:a4 isLocalOnWiFi:a5];
    }
    if (a3 == 1667329381) {
      return [a1 maxCameraQualityIndexForVideoQuality:a4 isLocalOnWiFi:a5 isRedundancyRequested:a6 isSharingEnabled:a7 enableNewTier:a8];
    }
  }
  else
  {
    switch(a3)
    {
      case 0x63616D77u:
        return [a1 maxWebRTCCameraQualityIndexForVideoQuality:a4 isLocalOnWiFi:a5 isSharingEnabled:a7 enableNewTier:a8];
      case 0x66646174u:
        return [a1 maxFdatQualityIndexForVideoQuality:a4 isLocalOnWiFi:a5];
      case 0x66747874u:
        return [a1 maxFtxtQualityIndexForVideoQuality:a4 isLocalOnWiFi:a5 isRedundancyRequested:a6 isSharingEnabled:a7];
    }
  }
  return -1;
}

- (void)appendStreamGroup:(id)a3 maxQualityIndex:(unsigned int)a4 mediaEntries:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_isRedundancyRequested && ([a3 hasRepairedStreams] & 1) != 0) {
    BOOL v9 = &OBJC_IVAR___VCSessionParticipantRemote__repairMediaTable;
  }
  else {
    BOOL v9 = &OBJC_IVAR___VCSessionParticipantRemote__mediaTable;
  }
  BOOL v10 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v9), "tableEntriesForStreamToken:", objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._participantStreamTokens, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "streamGroupID"))), "unsignedIntValue"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v16 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        unsigned int v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v15 qualityIndex] <= a4) {
          [a5 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v16 count:16];
    }
    while (v12);
  }
}

- (unsigned)cappedVideoQualityWithShouldLimitCameraQualityForPIP:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  int v5 = [(VCSessionParticipantRemote *)self videoQuality];
  if (v3)
  {
    unsigned int v6 = [(VCSessionParticipantRemote *)self videoQuality];
    if (v6 >= 5) {
      int v7 = 5;
    }
    else {
      int v7 = v6;
    }
  }
  else
  {
    int v7 = v5;
  }
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      BOOL v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136316162;
        uint64_t v18 = v9;
        __int16 v19 = 2080;
        long long v20 = "-[VCSessionParticipantRemote cappedVideoQualityWithShouldLimitCameraQualityForPIP:]";
        __int16 v21 = 1024;
        int v22 = 2049;
        __int16 v23 = 1024;
        *(_DWORD *)uint64_t v24 = v7;
        *(_WORD *)&v24[4] = 1024;
        *(_DWORD *)&v24[6] = [(VCSessionParticipantRemote *)self videoQuality];
        uint64_t v11 = "VCSessionParticipantRemote [%s] %s:%d cappedVideoQuality=%d self.videoQuality=%d";
        uint64_t v12 = v10;
        uint32_t v13 = 40;
LABEL_15:
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v17, v13);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      unsigned int v8 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      unsigned int v8 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      unsigned int v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136316674;
        uint64_t v18 = v14;
        __int16 v19 = 2080;
        long long v20 = "-[VCSessionParticipantRemote cappedVideoQualityWithShouldLimitCameraQualityForPIP:]";
        __int16 v21 = 1024;
        int v22 = 2049;
        __int16 v23 = 2112;
        *(void *)uint64_t v24 = v8;
        *(_WORD *)&v24[8] = 2048;
        BOOL v25 = self;
        __int16 v26 = 1024;
        int v27 = v7;
        __int16 v28 = 1024;
        int v29 = [(VCSessionParticipantRemote *)self videoQuality];
        uint64_t v11 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) cappedVideoQuality=%d self.videoQuality=%d";
        uint64_t v12 = v15;
        uint32_t v13 = 60;
        goto LABEL_15;
      }
    }
  }
  return v7;
}

- (void)appendStreamGroupsMediaEntries:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  BOOL v4 = (void *)[(NSMutableDictionary *)self->super._streamGroups allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v55 objects:v54 count:16];
  if (!v5)
  {
    uint64_t v30 = 0;
    int v31 = 0;
    int v34 = 0;
    int v7 = 0;
    goto LABEL_40;
  }
  uint64_t v6 = v5;
  uint64_t v30 = 0;
  int v31 = 0;
  int v34 = 0;
  int v7 = 0;
  uint64_t v8 = *(void *)v56;
  uint64_t v35 = *(void *)v56;
  do
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v56 != v8) {
        objc_enumerationMutation(v4);
      }
      BOOL v10 = *(void **)(*((void *)&v55 + 1) + 8 * v9);
      if ([(VCSessionParticipantRemote *)self isStreamGroupActive:v10])
      {
        if ([v10 streamGroupID] == 1667329381
          || [v10 streamGroupID] == 1667329399)
        {
          if (![(VCSessionParticipantRemote *)self isVisible]) {
            goto LABEL_25;
          }
          uint64_t v11 = v4;
          int v12 = v7;
          if ([(VCSessionParticipantRemote *)self prominenceIndex]) {
            BOOL v13 = [(VCSessionParticipant *)self presentationState] == 1;
          }
          else {
            BOOL v13 = 0;
          }
          uint64_t v15 = [(VCSessionParticipant *)self isLocalOnWiFi] & !v13;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
          {
            uint64_t v16 = VRTraceErrorLogLevelToCSTR();
            int v17 = *MEMORY[0x1E4F47A50];
            uint64_t v18 = *MEMORY[0x1E4F47A50];
            if (*MEMORY[0x1E4F47A40])
            {
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                BOOL sharingEnabled = self->super._sharingEnabled;
                BOOL v19 = [(VCSessionParticipant *)self isLocalOnWiFi];
                *(_DWORD *)buf = 136316674;
                uint64_t v38 = v16;
                __int16 v39 = 2080;
                uint64_t v40 = "-[VCSessionParticipantRemote appendStreamGroupsMediaEntries:]";
                __int16 v41 = 1024;
                int v42 = 2069;
                __int16 v43 = 1024;
                *(_DWORD *)__int16 v44 = sharingEnabled;
                *(_WORD *)&v44[4] = 1024;
                *(_DWORD *)&unsigned char v44[6] = v19;
                LOWORD(v45) = 1024;
                *(_DWORD *)((char *)&v45 + 2) = v15;
                HIWORD(v45) = 1024;
                *(_DWORD *)BOOL v46 = v13;
                _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, "VCSessionParticipantRemote [%s] %s:%d _sharingEnabled=%d, self.isLocalOnWiFi=%d, shouldUseWifiQuality=%d, shouldLimitCameraQualityForPIP=%d", buf, 0x34u);
              }
            }
            else if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              BOOL v33 = self->super._sharingEnabled;
              BOOL v20 = [(VCSessionParticipant *)self isLocalOnWiFi];
              *(_DWORD *)buf = 136316674;
              uint64_t v38 = v16;
              __int16 v39 = 2080;
              uint64_t v40 = "-[VCSessionParticipantRemote appendStreamGroupsMediaEntries:]";
              __int16 v41 = 1024;
              int v42 = 2069;
              __int16 v43 = 1024;
              *(_DWORD *)__int16 v44 = v33;
              *(_WORD *)&v44[4] = 1024;
              *(_DWORD *)&unsigned char v44[6] = v20;
              LOWORD(v45) = 1024;
              *(_DWORD *)((char *)&v45 + 2) = v15;
              HIWORD(v45) = 1024;
              *(_DWORD *)BOOL v46 = v13;
              _os_log_debug_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEBUG, "VCSessionParticipantRemote [%s] %s:%d _sharingEnabled=%d, self.isLocalOnWiFi=%d, shouldUseWifiQuality=%d, shouldLimitCameraQualityForPIP=%d", buf, 0x34u);
            }
          }
          uint64_t v14 = +[VCSessionParticipantRemote maxQualityIndexForStreamGroupID:videoQuality:isLocalOnWiFi:isRedundancyRequested:isSharingEnabled:enableNewTier:](VCSessionParticipantRemote, "maxQualityIndexForStreamGroupID:videoQuality:isLocalOnWiFi:isRedundancyRequested:isSharingEnabled:enableNewTier:", [v10 streamGroupID], -[VCSessionParticipantRemote cappedVideoQualityWithShouldLimitCameraQualityForPIP:](self, "cappedVideoQualityWithShouldLimitCameraQualityForPIP:", v13), v15, self->_isRedundancyRequested, self->super._sharingEnabled, self->_enableMaxCameraBitrateVideoQualityNewTier);
          int v7 = v12 + 1;
          BOOL v4 = v11;
          uint64_t v8 = v35;
          goto LABEL_24;
        }
        if ([v10 streamGroupID] == 1835623282
          || [v10 streamGroupID] == 1835623287)
        {
          ++v34;
          goto LABEL_15;
        }
        if ([v10 streamGroupID] == 1935897189)
        {
          ++v31;
          goto LABEL_15;
        }
        if ([v10 streamGroupID] == 1937339233)
        {
          ++HIDWORD(v30);
          goto LABEL_15;
        }
        if ([v10 streamGroupID] == 1667330164)
        {
          LODWORD(v30) = v30 + 1;
          goto LABEL_15;
        }
        if ([v10 streamGroupID] == 1718909044
          || [v10 streamGroupID] == 1650745716
          || [v10 streamGroupID] == 1717854580)
        {
          uint64_t v8 = v35;
          uint64_t v14 = +[VCSessionParticipantRemote maxQualityIndexForStreamGroupID:videoQuality:isLocalOnWiFi:isRedundancyRequested:isSharingEnabled:enableNewTier:](VCSessionParticipantRemote, "maxQualityIndexForStreamGroupID:videoQuality:isLocalOnWiFi:isRedundancyRequested:isSharingEnabled:enableNewTier:", [v10 streamGroupID], -[VCSessionParticipantRemote videoQuality](self, "videoQuality"), -[VCSessionParticipant isLocalOnWiFi](self, "isLocalOnWiFi"), self->_isRedundancyRequested, self->super._sharingEnabled, self->_enableMaxCameraBitrateVideoQualityNewTier);
        }
        else
        {
LABEL_15:
          uint64_t v14 = 0xFFFFFFFFLL;
        }
LABEL_24:
        [(VCSessionParticipantRemote *)self appendStreamGroup:v10 maxQualityIndex:v14 mediaEntries:a3];
      }
LABEL_25:
      ++v9;
    }
    while (v6 != v9);
    uint64_t v21 = [v4 countByEnumeratingWithState:&v55 objects:v54 count:16];
    uint64_t v6 = v21;
  }
  while (v21);
LABEL_40:
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v23 = VRTraceErrorLogLevelToCSTR();
      uint64_t v24 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316930;
        uint64_t v38 = v23;
        __int16 v39 = 2080;
        uint64_t v40 = "-[VCSessionParticipantRemote appendStreamGroupsMediaEntries:]";
        __int16 v41 = 1024;
        int v42 = 2087;
        __int16 v43 = 1024;
        *(_DWORD *)__int16 v44 = v7;
        *(_WORD *)&v44[4] = 1024;
        *(_DWORD *)&unsigned char v44[6] = v34;
        LOWORD(v45) = 1024;
        *(_DWORD *)((char *)&v45 + 2) = v31;
        HIWORD(v45) = 1024;
        *(_DWORD *)BOOL v46 = HIDWORD(v30);
        *(_WORD *)&v46[4] = 1024;
        *(_DWORD *)__int16 v47 = v30;
        BOOL v25 = "VCSessionParticipantRemote [%s] %s:%d appendStreamGroupsMediaEntries, count of streamGroups are cameraStre"
              "amGroupCount=%d, micrStreamGroupCount=%d, screenStreamGroupCount=%d, systemAudioStreamGroupCount=%d, capti"
              "onsStreamGroupCount=%d ";
        __int16 v26 = v24;
        uint32_t v27 = 58;
        goto LABEL_50;
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      int v22 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      int v22 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v28 = VRTraceErrorLogLevelToCSTR();
      int v29 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136317442;
        uint64_t v38 = v28;
        __int16 v39 = 2080;
        uint64_t v40 = "-[VCSessionParticipantRemote appendStreamGroupsMediaEntries:]";
        __int16 v41 = 1024;
        int v42 = 2087;
        __int16 v43 = 2112;
        *(void *)__int16 v44 = v22;
        *(_WORD *)&v44[8] = 2048;
        __int16 v45 = self;
        *(_WORD *)BOOL v46 = 1024;
        *(_DWORD *)&v46[2] = v7;
        *(_WORD *)__int16 v47 = 1024;
        *(_DWORD *)&v47[2] = v34;
        __int16 v48 = 1024;
        int v49 = v31;
        __int16 v50 = 1024;
        int v51 = HIDWORD(v30);
        __int16 v52 = 1024;
        int v53 = v30;
        BOOL v25 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) appendStreamGroupsMediaEntries, count of streamGroups are cam"
              "eraStreamGroupCount=%d, micrStreamGroupCount=%d, screenStreamGroupCount=%d, systemAudioStreamGroupCount=%d"
              ", captionsStreamGroupCount=%d ";
        __int16 v26 = v29;
        uint32_t v27 = 78;
LABEL_50:
        _os_log_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
      }
    }
  }
}

- (void)validateMediaEntries:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (![(VCSessionParticipantRemote *)self isAudioActive]) {
    return;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v30 objects:v29 count:16];
  if (!v5)
  {
LABEL_11:
    BOOL v10 = -[VCSessionBandwidthAllocationTable tableEntriesForStreamToken:](self->_mediaTable, "tableEntriesForStreamToken:", objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._participantStreamTokens, "objectForKeyedSubscript:", &unk_1F3DC4470), "unsignedIntValue"));
    id v11 = -[VCSessionBandwidthAllocationTable tableEntriesForStreamToken:](self->_mediaTable, "tableEntriesForStreamToken:", objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._participantStreamTokens, "objectForKeyedSubscript:", &unk_1F3DC4458), "unsignedIntValue"));
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 2) {
        goto LABEL_27;
      }
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      char IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
      uint64_t v15 = *MEMORY[0x1E4F47A50];
      if (IsOSFaultDisabled)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)BOOL v25 = 136316418;
          *(void *)&v25[4] = v13;
          *(_WORD *)&v25[12] = 2080;
          *(void *)&v25[14] = "-[VCSessionParticipantRemote validateMediaEntries:]";
          *(_WORD *)&v25[22] = 1024;
          LODWORD(v26) = 2106;
          WORD2(v26) = 2112;
          *(void *)((char *)&v26 + 6) = a3;
          HIWORD(v26) = 2112;
          uint32_t v27 = v10;
          *(_WORD *)uint64_t v28 = 2112;
          *(void *)&v28[2] = v11;
          uint64_t v16 = "VCSessionParticipantRemote [%s] %s:%d No audio entry was added. addedMediaEntries=%@ micEntries=%@ micwEntries=%@";
          int v17 = v15;
          uint32_t v18 = 58;
LABEL_23:
          _os_log_error_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_ERROR, v16, v25, v18);
        }
LABEL_27:
        VCTerminateProcess(@"Missing audio entries", @"VCSessionParticipantRemote", (uint64_t)[(VCSessionParticipant *)self reportingAgent]);
        return;
      }
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT)) {
        goto LABEL_27;
      }
      *(_DWORD *)BOOL v25 = 136316418;
      *(void *)&v25[4] = v13;
      *(_WORD *)&v25[12] = 2080;
      *(void *)&v25[14] = "-[VCSessionParticipantRemote validateMediaEntries:]";
      *(_WORD *)&v25[22] = 1024;
      LODWORD(v26) = 2106;
      WORD2(v26) = 2112;
      *(void *)((char *)&v26 + 6) = a3;
      HIWORD(v26) = 2112;
      uint32_t v27 = v10;
      *(_WORD *)uint64_t v28 = 2112;
      *(void *)&v28[2] = v11;
      int v22 = "VCSessionParticipantRemote [%s] %s:%d No audio entry was added. addedMediaEntries=%@ micEntries=%@ micwEntries=%@";
      uint64_t v23 = v15;
      uint32_t v24 = 58;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v12 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
      }
      else {
        int v12 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 2) {
        goto LABEL_27;
      }
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      char v20 = VRTraceIsOSFaultDisabled();
      uint64_t v21 = *MEMORY[0x1E4F47A50];
      if (v20)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)BOOL v25 = 136316930;
          *(void *)&v25[4] = v19;
          *(_WORD *)&v25[12] = 2080;
          *(void *)&v25[14] = "-[VCSessionParticipantRemote validateMediaEntries:]";
          *(_WORD *)&v25[22] = 1024;
          LODWORD(v26) = 2106;
          WORD2(v26) = 2112;
          *(void *)((char *)&v26 + 6) = v12;
          HIWORD(v26) = 2048;
          uint32_t v27 = self;
          *(_WORD *)uint64_t v28 = 2112;
          *(void *)&v28[2] = a3;
          *(_WORD *)&v28[10] = 2112;
          *(void *)&v28[12] = v10;
          *(_WORD *)&v28[20] = 2112;
          *(void *)&v28[22] = v11;
          uint64_t v16 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) No audio entry was added. addedMediaEntries=%@ micEntries=%"
                "@ micwEntries=%@";
          int v17 = v21;
          uint32_t v18 = 78;
          goto LABEL_23;
        }
        goto LABEL_27;
      }
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT)) {
        goto LABEL_27;
      }
      *(_DWORD *)BOOL v25 = 136316930;
      *(void *)&v25[4] = v19;
      *(_WORD *)&v25[12] = 2080;
      *(void *)&v25[14] = "-[VCSessionParticipantRemote validateMediaEntries:]";
      *(_WORD *)&v25[22] = 1024;
      LODWORD(v26) = 2106;
      WORD2(v26) = 2112;
      *(void *)((char *)&v26 + 6) = v12;
      HIWORD(v26) = 2048;
      uint32_t v27 = self;
      *(_WORD *)uint64_t v28 = 2112;
      *(void *)&v28[2] = a3;
      *(_WORD *)&v28[10] = 2112;
      *(void *)&v28[12] = v10;
      *(_WORD *)&v28[20] = 2112;
      *(void *)&v28[22] = v11;
      int v22 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) No audio entry was added. addedMediaEntries=%@ micEntries=%@ micwEntries=%@";
      uint64_t v23 = v21;
      uint32_t v24 = 78;
    }
    _os_log_fault_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_FAULT, v22, v25, v24);
    goto LABEL_27;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v31;
LABEL_4:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v31 != v7) {
      objc_enumerationMutation(a3);
    }
    uint64_t v9 = *(void **)(*((void *)&v30 + 1) + 8 * v8);
    if ([v9 streamGroupID] == 1835623282
      || [v9 streamGroupID] == 1835623287)
    {
      break;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [a3 countByEnumeratingWithState:&v30 objects:v29 count:16];
      if (v6) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
}

- (NSArray)mediaEntries
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v30 = 0;
  long long v31 = &v30;
  uint64_t v32 = 0x3052000000;
  long long v33 = __Block_byref_object_copy__10;
  uint64_t v34 = __Block_byref_object_dispose__10;
  uint64_t v35 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v35 = [MEMORY[0x1E4F1CA48] array];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__VCSessionParticipantRemote_mediaEntries__block_invoke;
  block[3] = &unk_1E6DB3EB8;
  block[4] = self;
  void block[5] = &v30;
  dispatch_sync(participantQueue, block);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  BOOL v4 = (void *)v31[5];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v51 objects:v50 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v52;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v52 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(VCSessionParticipantRemote **)(*((void *)&v51 + 1) + 8 * v7);
        if ((VCSessionParticipantRemote *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
            goto LABEL_21;
          }
          uint64_t v17 = VRTraceErrorLogLevelToCSTR();
          uint32_t v18 = *MEMORY[0x1E4F47A50];
          uint64_t v19 = *MEMORY[0x1E4F47A50];
          if (*MEMORY[0x1E4F47A40])
          {
            if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_21;
            }
            uuid = self->super._uuid;
            *(_DWORD *)buf = 136316162;
            uint64_t v37 = v17;
            __int16 v38 = 2080;
            __int16 v39 = "-[VCSessionParticipantRemote mediaEntries]";
            __int16 v40 = 1024;
            int v41 = 2123;
            __int16 v42 = 2112;
            __int16 v43 = (__CFString *)uuid;
            __int16 v44 = 2112;
            __int16 v45 = v8;
            uint64_t v14 = v18;
            uint64_t v15 = "VCSessionParticipantRemote [%s] %s:%d mediaEntries %@: %@";
            uint32_t v16 = 48;
            goto LABEL_17;
          }
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            BOOL v25 = self->super._uuid;
            *(_DWORD *)buf = 136316162;
            uint64_t v37 = v17;
            __int16 v38 = 2080;
            __int16 v39 = "-[VCSessionParticipantRemote mediaEntries]";
            __int16 v40 = 1024;
            int v41 = 2123;
            __int16 v42 = 2112;
            __int16 v43 = (__CFString *)v25;
            __int16 v44 = 2112;
            __int16 v45 = v8;
            int v22 = v18;
            uint64_t v23 = "VCSessionParticipantRemote [%s] %s:%d mediaEntries %@: %@";
            uint32_t v24 = 48;
            goto LABEL_24;
          }
        }
        else
        {
          uint64_t v9 = &stru_1F3D3E450;
          if (objc_opt_respondsToSelector()) {
            uint64_t v9 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
          {
            uint64_t v10 = VRTraceErrorLogLevelToCSTR();
            id v11 = *MEMORY[0x1E4F47A50];
            int v12 = *MEMORY[0x1E4F47A50];
            if (*MEMORY[0x1E4F47A40])
            {
              if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_21;
              }
              uint64_t v13 = self->super._uuid;
              *(_DWORD *)buf = 136316674;
              uint64_t v37 = v10;
              __int16 v38 = 2080;
              __int16 v39 = "-[VCSessionParticipantRemote mediaEntries]";
              __int16 v40 = 1024;
              int v41 = 2123;
              __int16 v42 = 2112;
              __int16 v43 = v9;
              __int16 v44 = 2048;
              __int16 v45 = self;
              __int16 v46 = 2112;
              __int16 v47 = v13;
              __int16 v48 = 2112;
              int v49 = v8;
              uint64_t v14 = v11;
              uint64_t v15 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) mediaEntries %@: %@";
              uint32_t v16 = 68;
LABEL_17:
              _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, v16);
              goto LABEL_21;
            }
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v21 = self->super._uuid;
              *(_DWORD *)buf = 136316674;
              uint64_t v37 = v10;
              __int16 v38 = 2080;
              __int16 v39 = "-[VCSessionParticipantRemote mediaEntries]";
              __int16 v40 = 1024;
              int v41 = 2123;
              __int16 v42 = 2112;
              __int16 v43 = v9;
              __int16 v44 = 2048;
              __int16 v45 = self;
              __int16 v46 = 2112;
              __int16 v47 = v21;
              __int16 v48 = 2112;
              int v49 = v8;
              int v22 = v11;
              uint64_t v23 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) mediaEntries %@: %@";
              uint32_t v24 = 68;
LABEL_24:
              _os_log_debug_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEBUG, v23, buf, v24);
            }
          }
        }
LABEL_21:
        ++v7;
      }
      while (v5 != v7);
      uint64_t v26 = [v4 countByEnumeratingWithState:&v51 objects:v50 count:16];
      uint64_t v5 = v26;
    }
    while (v26);
  }
  uint32_t v27 = (NSArray *)v31[5];
  _Block_object_dispose(&v30, 8);
  return v27;
}

uint64_t __42__VCSessionParticipantRemote_mediaEntries__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) appendStreamGroupsMediaEntries:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return [v2 validateMediaEntries:v3];
}

- (BOOL)isVisible
{
  return self->_visibilityIndex == 0;
}

- (void)setMediaSuspended:(BOOL)a3 forStreamToken:(id)a4
{
  BOOL v5 = a3;
  uint64_t v6 = (void *)VCRemoteVideoManager_DefaultManager();
  uint64_t v7 = [a4 unsignedIntValue];

  [v6 remoteVideoDidSuspend:v5 streamToken:v7];
}

- (BOOL)isVideoExpected
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      BOOL v5 = *MEMORY[0x1E4F47A50];
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          BOOL videoEnabled = self->super._videoEnabled;
          BOOL remoteVideoEnabled = self->_remoteVideoEnabled;
          BOOL videoPaused = self->super._videoPaused;
          BOOL remoteVideoPaused = self->_remoteVideoPaused;
          int v26 = 136316930;
          uint64_t v27 = v4;
          __int16 v28 = 2080;
          int v29 = "-[VCSessionParticipantRemote isVideoExpected]";
          __int16 v30 = 1024;
          int v31 = 2137;
          __int16 v32 = 1024;
          *(_DWORD *)long long v33 = videoEnabled;
          *(_WORD *)&v33[4] = 1024;
          *(_DWORD *)&v33[6] = remoteVideoEnabled;
          LOWORD(v34) = 1024;
          *(_DWORD *)((char *)&v34 + 2) = videoPaused;
          HIWORD(v34) = 1024;
          *(_DWORD *)uint64_t v35 = remoteVideoPaused;
          *(_WORD *)&v35[4] = 1024;
          *(_DWORD *)int v36 = [(VCSessionParticipantRemote *)self isVisible];
          id v11 = "VCSessionParticipantRemote [%s] %s:%d videoEnabled:%d remoteVideoEnabled:%d videoPaused:%d remoteVideoPa"
                "used:%d isVisible:%d";
          int v12 = v5;
          uint32_t v13 = 58;
LABEL_13:
          _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v26, v13);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        -[VCSessionParticipantRemote isVideoExpected]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v3 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
      return self->super._videoEnabled
    }
          && self->_remoteVideoEnabled
          && !self->super._videoPaused
          && !self->_remoteVideoPaused
          && [(VCSessionParticipantRemote *)self isVisible];
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    uint64_t v15 = *MEMORY[0x1E4F47A50];
    uint32_t v16 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v17 = self->super._videoEnabled;
        BOOL v18 = self->_remoteVideoEnabled;
        BOOL v19 = self->super._videoPaused;
        BOOL v20 = self->_remoteVideoPaused;
        int v26 = 136317442;
        uint64_t v27 = v14;
        __int16 v28 = 2080;
        int v29 = "-[VCSessionParticipantRemote isVideoExpected]";
        __int16 v30 = 1024;
        int v31 = 2137;
        __int16 v32 = 2112;
        *(void *)long long v33 = v3;
        *(_WORD *)&v33[8] = 2048;
        uint64_t v34 = self;
        *(_WORD *)uint64_t v35 = 1024;
        *(_DWORD *)&v35[2] = v17;
        *(_WORD *)int v36 = 1024;
        *(_DWORD *)&v36[2] = v18;
        __int16 v37 = 1024;
        BOOL v38 = v19;
        __int16 v39 = 1024;
        BOOL v40 = v20;
        __int16 v41 = 1024;
        BOOL v42 = [(VCSessionParticipantRemote *)self isVisible];
        id v11 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) videoEnabled:%d remoteVideoEnabled:%d videoPaused:%d remoteVi"
              "deoPaused:%d isVisible:%d";
        int v12 = v15;
        uint32_t v13 = 78;
        goto LABEL_13;
      }
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      BOOL v21 = self->super._videoEnabled;
      BOOL v22 = self->_remoteVideoEnabled;
      BOOL v23 = self->super._videoPaused;
      BOOL v24 = self->_remoteVideoPaused;
      int v26 = 136317442;
      uint64_t v27 = v14;
      __int16 v28 = 2080;
      int v29 = "-[VCSessionParticipantRemote isVideoExpected]";
      __int16 v30 = 1024;
      int v31 = 2137;
      __int16 v32 = 2112;
      *(void *)long long v33 = v3;
      *(_WORD *)&v33[8] = 2048;
      uint64_t v34 = self;
      *(_WORD *)uint64_t v35 = 1024;
      *(_DWORD *)&v35[2] = v21;
      *(_WORD *)int v36 = 1024;
      *(_DWORD *)&v36[2] = v22;
      __int16 v37 = 1024;
      BOOL v38 = v23;
      __int16 v39 = 1024;
      BOOL v40 = v24;
      __int16 v41 = 1024;
      BOOL v42 = [(VCSessionParticipantRemote *)self isVisible];
      _os_log_debug_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEBUG, "VCSessionParticipantRemote [%s] %s:%d %@(%p) videoEnabled:%d remoteVideoEnabled:%d videoPaused:%d remoteVideoPaused:%d isVisible:%d", (uint8_t *)&v26, 0x4Eu);
    }
  }
  return self->super._videoEnabled
      && self->_remoteVideoEnabled
      && !self->super._videoPaused
      && !self->_remoteVideoPaused
      && [(VCSessionParticipantRemote *)self isVisible];
}

- (void)updateScreenStreamConfigurationWithStreamGroupResult:(id)a3 multiwayConfig:(id)a4 screenStreamConfig:(id)a5
{
  [a3 resolution];
  uint64_t v10 = (int)v9;
  [a3 resolution];
  int64_t v12 = +[VideoUtil videoResolutionForWidth:v10 height:(int)v11];
  [a4 setResolution:v12];
  [a5 setVideoResolution:v12];
  uint64_t v13 = 1;
  [a5 setCaptureSource:1];
  uint64_t v14 = [a3 framerate];
  LODWORD(v10) = v14;
  [a4 setFramerate:v14];
  [a5 setFramerate:v10];
  [a5 setRemoteVideoInitialOrientation:2];
  uint64_t v15 = [a3 keyFrameInterval];
  [a4 setKeyFrameInterval:v15];
  [a5 setKeyFrameInterval:v15];
  [a5 setLtrpEnabled:0];
  if ([a3 coordinateSystem] == 1) {
    uint64_t v13 = [(VCSessionParticipantRemote *)self supportsNegotiatedCoordinateSystem] ^ 1;
  }
  [a5 setForceZeroRegionOfInterestOrigin:v13];
  [a5 setDeferredAssemblyEnabled:1];
  [a5 setLooseAVSyncEnabled:1];
  id v16 = +[VCVideoFeatureListStringHelper newFeatureListStringsDictForGroupID:isOneToOne:](VCVideoFeatureListStringHelper, "newFeatureListStringsDictForGroupID:isOneToOne:", 1935897189, [a4 isOneToOne]);
  objc_msgSend(a5, "setupTxPayloads:featureStrings:", objc_msgSend((id)objc_msgSend(a4, "payloads"), "allObjects"), v16);
  objc_msgSend(a5, "setupRxPayloads:featureStrings:", objc_msgSend((id)objc_msgSend(a4, "payloads"), "allObjects"), v16);
}

- (void)updateVideoMultiwayConfig:(id)a3 withStreamGroupStreamConfig:(id)a4
{
  objc_msgSend(a3, "setIsTemporalStream:", objc_msgSend(a4, "isTemporalStream"));
  if ([a3 isTemporalStream]) {
    objc_msgSend(a3, "setParentStreamID:", objc_msgSend(a4, "parentStreamID"));
  }
  objc_msgSend(a3, "setIsSubStream:", objc_msgSend(a4, "isSubStream"));
  [a4 resolution];
  if (v6 == 0.0 && ([a4 resolution], v7 == 0.0))
  {
    int64_t v8 = 11;
  }
  else
  {
    [a4 resolution];
    uint64_t v10 = (int)v9;
    [a4 resolution];
    int64_t v8 = +[VideoUtil videoResolutionForWidth:v10 height:(int)v11];
  }
  [a3 setResolution:v8];
  if ([a4 framerate]) {
    uint64_t v12 = [a4 framerate];
  }
  else {
    uint64_t v12 = 30;
  }
  [a3 setFramerate:v12];
  uint64_t v13 = [a4 keyFrameInterval];

  [a3 setKeyFrameInterval:v13];
}

- (id)newMultiwayConfigWithStreamGroupStreamConfig:(id)a3 maxIDSStreamIDCount:(unsigned int)a4 groupID:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  if ((int)a5 <= 1936290408)
  {
    if (a5 != 1835623282)
    {
      int v9 = 1835623287;
      goto LABEL_6;
    }
LABEL_7:
    uint64_t v10 = objc_alloc_init(VCMediaStreamMultiwayConfigAudio);
    [(VCMediaStreamMultiwayConfig *)v10 setShouldIgnoreRTPHeaderExtensions:1];
LABEL_8:
    [(VCMediaStreamMultiwayConfig *)v10 setStreamGroupID:v5];
    -[VCMediaStreamMultiwayConfig setSsrc:](v10, "setSsrc:", [a3 ssrc]);
    -[VCMediaStreamMultiwayConfig setMaxNetworkBitrate:](v10, "setMaxNetworkBitrate:", [a3 maxNetworkBitrate]);
    -[VCMediaStreamMultiwayConfig setMaxMediaBitrate:](v10, "setMaxMediaBitrate:", [a3 maxMediaBitrate]);
    *(float *)&double v11 = (float)[a3 maxPacketsPerSecond];
    [(VCMediaStreamMultiwayConfig *)v10 setMaxPacketsPerSecond:v11];
    -[VCMediaStreamMultiwayConfig setIdsStreamID:](v10, "setIdsStreamID:", [a3 streamID]);
    if ([a3 repairedStreamID])
    {
      -[VCMediaStreamMultiwayConfig setRepairedStreamID:](v10, "setRepairedStreamID:", [a3 repairedStreamID]);
      -[VCMediaStreamMultiwayConfig setRepairedMaxNetworkBitrate:](v10, "setRepairedMaxNetworkBitrate:", [a3 repairedMaxNetworkBitrate]);
    }
    -[VCMediaStreamMultiwayConfig setQualityIndex:](v10, "setQualityIndex:", [a3 qualityIndex]);
    [(VCMediaStreamMultiwayConfig *)v10 setMaxIDSStreamIdCount:v6];
    [(VCMediaStreamMultiwayConfig *)v10 setStartOnDemand:0];
    -[VCMediaStreamMultiwayConfig setV2StreamID:](v10, "setV2StreamID:", [a3 v2StreamID]);
    return v10;
  }
  if (a5 == 1936290409) {
    goto LABEL_7;
  }
  int v9 = 1937339233;
LABEL_6:
  if (a5 == v9) {
    goto LABEL_7;
  }
  uint64_t v13 = objc_alloc_init(VCMediaStreamMultiwayConfigVideo);
  if (v13)
  {
    uint64_t v10 = (VCMediaStreamMultiwayConfigAudio *)v13;
    [(VCSessionParticipantRemote *)self updateVideoMultiwayConfig:v13 withStreamGroupStreamConfig:a3];
    goto LABEL_8;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCSessionParticipantRemote newMultiwayConfigWithStreamGroupStreamConfig:maxIDSStreamIDCount:groupID:]();
    }
  }
  return 0;
}

- (BOOL)setupVideoStreamConfiguration:(id)a3 withStreamGroupStreamConfig:(id)a4 codecConfigs:(id)a5 multiwayConfig:(id)a6 groupID:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v13 = +[VCVideoFeatureListStringHelper newFeatureListStringsDictForGroupID:isOneToOne:](VCVideoFeatureListStringHelper, "newFeatureListStringsDictForGroupID:isOneToOne:", *(void *)&a7, [a6 isOneToOne]);
  uint64_t v14 = v13;
  if (!v13)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantRemote setupVideoStreamConfiguration:withStreamGroupStreamConfig:codecConfigs:multiwayConfig:groupID:]();
        }
      }
      goto LABEL_48;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v30 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v30 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_48;
    }
    uint64_t v32 = VRTraceErrorLogLevelToCSTR();
    long long v33 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_48;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v43 = v32;
    __int16 v44 = 2080;
    __int16 v45 = "-[VCSessionParticipantRemote setupVideoStreamConfiguration:withStreamGroupStreamConfig:codecConfigs:multiwayConfig:groupID:]";
    __int16 v46 = 1024;
    int v47 = 2223;
    __int16 v48 = 2112;
    int v49 = v30;
    __int16 v50 = 2048;
    long long v51 = self;
    uint64_t v34 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to create featureStringsDict";
    goto LABEL_50;
  }
  id v15 = a5;
  id v36 = v13;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v16 = (void *)[a4 payloads];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v38 objects:v37 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v39 != v19) {
          objc_enumerationMutation(v16);
        }
        objc_msgSend(a6, "addPayload:", objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * i), "unsignedIntValue"));
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v38 objects:v37 count:16];
    }
    while (v18);
  }
  objc_msgSend(a3, "setRxMinBitrate:", objc_msgSend(a4, "maxNetworkBitrate"));
  objc_msgSend(a3, "setRxMaxBitrate:", objc_msgSend(a4, "maxNetworkBitrate"));
  objc_msgSend(a3, "setTxMinBitrate:", objc_msgSend(a4, "maxNetworkBitrate"));
  objc_msgSend(a3, "setTxMaxBitrate:", objc_msgSend(a4, "maxNetworkBitrate"));
  objc_msgSend(a3, "setKeyFrameInterval:", objc_msgSend(a6, "keyFrameInterval"));
  int64_t v21 = +[VCHardwareSettings deviceClass];
  double v22 = 0.02;
  if (v21 != 8)
  {
    double v23 = (double)-[VCSessionParticipant preferredIOSamplesPerFrameForGroupID:](self, "preferredIOSamplesPerFrameForGroupID:", v7, 0.02);
    double v22 = v23
        / (double)[(VCSessionParticipant *)self preferredIOSampleRateForGroupID:v7];
  }
  [a3 setMinPlaybackInterval:v22];
  BOOL v24 = v7 == 1650745716 || v7 == 1718909044;
  double v25 = 0.0;
  if (v24) {
    double v25 = 0.02;
  }
  [a3 setMinRenderingDelay:v25];
  uint64_t v14 = v36;
  if (!-[VCSessionParticipantRemote setupStreamConfigWithCodecs:streamConfig:codecConfigs:featureStringsDict:](self, "setupStreamConfigWithCodecs:streamConfig:codecConfigs:featureStringsDict:", [a4 codecs], a3, v15, v36))
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantRemote setupVideoStreamConfiguration:withStreamGroupStreamConfig:codecConfigs:multiwayConfig:groupID:]();
        }
      }
      goto LABEL_48;
    }
    if (objc_opt_respondsToSelector()) {
      int v31 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      int v31 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (uint64_t v35 = VRTraceErrorLogLevelToCSTR(),
          long long v33 = *MEMORY[0x1E4F47A50],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
LABEL_48:
      BOOL v28 = 0;
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v43 = v35;
    __int16 v44 = 2080;
    __int16 v45 = "-[VCSessionParticipantRemote setupVideoStreamConfiguration:withStreamGroupStreamConfig:codecConfigs:multiwayConfig:groupID:]";
    __int16 v46 = 1024;
    int v47 = 2242;
    __int16 v48 = 2112;
    int v49 = v31;
    __int16 v50 = 2048;
    long long v51 = self;
    uint64_t v34 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) setupStreamConfigWithCodecs failed";
LABEL_50:
    _os_log_error_impl(&dword_1E1EA4000, v33, OS_LOG_TYPE_ERROR, v34, buf, 0x30u);
    goto LABEL_48;
  }
  [a3 setType:3];
  objc_msgSend(a3, "setVideoResolution:", objc_msgSend(a6, "resolution"));
  [a3 setRemoteVideoInitialOrientation:0];
  objc_msgSend(a3, "setFramerate:", objc_msgSend(a6, "framerate"));
  [a3 setSourceFramerate:30];
  BOOL v26 = [(VCSessionParticipantRemote *)self shouldEnablePacketRetransmissionForStreamGroupID:v7];
  BOOL isServerRTxEnabled = 0;
  if (v26) {
    BOOL isServerRTxEnabled = self->_isServerRTxEnabled;
  }
  [a3 setIsServerPacketRetransmissionEnabled:isServerRTxEnabled];
  if (v7 == 1667329399)
  {
    [a3 setIsVariableSliceModeEnabled:1];
    [a3 setCvoExtensionID:1];
    [a3 setUseVideoJitterForVideoPlayout:0];
  }
  else
  {
    if (v7 != 1935897189)
    {
      if (v7 == 1718909044)
      {
        [a3 setIsVariableSliceModeEnabled:1];
      }
      else if ((v7 | 0x4000000) != 0x66646174)
      {
        goto LABEL_27;
      }
      [a3 setMediaStallTimeout:2.0];
      [a3 setMediaStallReportRepeatInterval:1.0];
      goto LABEL_27;
    }
    [(VCSessionParticipantRemote *)self updateScreenStreamConfigurationWithStreamGroupResult:a4 multiwayConfig:a6 screenStreamConfig:a3];
  }
LABEL_27:
  [(VCSessionParticipant *)self setFECConfigurationOnStreamConfig:a3 withStreamGroupID:v7];
  BOOL v28 = 1;
LABEL_28:

  return v28;
}

- (id)newMediaStreamConfigWithStreamGroupConfig:(id)a3 streamConfig:(id)a4 rateControlConfig:(id)a5 multiwayConfig:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = [a3 groupID];
  uint64_t v12 = v11;
  if ((int)v11 > 1936290408)
  {
    if (v11 == 1936290409) {
      goto LABEL_7;
    }
    int v13 = 1937339233;
  }
  else
  {
    if (v11 == 1835623282) {
      goto LABEL_7;
    }
    int v13 = 1835623287;
  }
  if (v11 == v13)
  {
LABEL_7:
    uint64_t v14 = objc_alloc_init(VCSessionParticipantAudioStreamConfig);
    if (v14)
    {
      id v15 = v14;
      if ([(VCSessionParticipantRemote *)self setupAudioStreamConfiguration:v14 withStreamGroupConfig:a3 streamGroupStreamConfig:a4])
      {
        goto LABEL_9;
      }
      if ((VCSessionParticipantRemote *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSessionParticipantRemote newMediaStreamConfigWithStreamGroupConfig:streamConfig:rateControlConfig:multiwayConfig:].cold.6();
          }
        }
        goto LABEL_62;
      }
      if (objc_opt_respondsToSelector()) {
        int64_t v21 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
      }
      else {
        int64_t v21 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v24 = VRTraceErrorLogLevelToCSTR();
        double v25 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v30 = 136316162;
          uint64_t v31 = v24;
          __int16 v32 = 2080;
          long long v33 = "-[VCSessionParticipantRemote newMediaStreamConfigWithStreamGroupConfig:streamConfig:rateControlConfig:multiwayConfig:]";
          __int16 v34 = 1024;
          int v35 = 2283;
          __int16 v36 = 2112;
          __int16 v37 = v21;
          __int16 v38 = 2048;
          long long v39 = self;
          BOOL v26 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to setup the audio stream config";
LABEL_48:
          _os_log_error_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_ERROR, v26, (uint8_t *)&v30, 0x30u);
          goto LABEL_62;
        }
      }
      goto LABEL_62;
    }
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantRemote newMediaStreamConfigWithStreamGroupConfig:streamConfig:rateControlConfig:multiwayConfig:].cold.5();
        }
      }
      goto LABEL_61;
    }
    if (objc_opt_respondsToSelector()) {
      BOOL v20 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      BOOL v20 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      double v23 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v30 = 136316162;
        uint64_t v31 = v22;
        __int16 v32 = 2080;
        long long v33 = "-[VCSessionParticipantRemote newMediaStreamConfigWithStreamGroupConfig:streamConfig:rateControlConfig:multiwayConfig:]";
        __int16 v34 = 1024;
        int v35 = 2280;
        __int16 v36 = 2112;
        __int16 v37 = v20;
        __int16 v38 = 2048;
        long long v39 = self;
LABEL_43:
        _os_log_error_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to allocate stream configuration!", (uint8_t *)&v30, 0x30u);
        goto LABEL_61;
      }
    }
    goto LABEL_61;
  }
  uint64_t v18 = objc_alloc_init(VCSessionParticipantVideoStreamConfig);
  if (!v18)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantRemote newMediaStreamConfigWithStreamGroupConfig:streamConfig:rateControlConfig:multiwayConfig:]();
        }
      }
      goto LABEL_61;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v27 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v27 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v28 = VRTraceErrorLogLevelToCSTR();
      double v23 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v30 = 136316162;
        uint64_t v31 = v28;
        __int16 v32 = 2080;
        long long v33 = "-[VCSessionParticipantRemote newMediaStreamConfigWithStreamGroupConfig:streamConfig:rateControlConfig:multiwayConfig:]";
        __int16 v34 = 1024;
        int v35 = 2287;
        __int16 v36 = 2112;
        __int16 v37 = v27;
        __int16 v38 = 2048;
        long long v39 = self;
        goto LABEL_43;
      }
    }
LABEL_61:
    id v15 = 0;
    goto LABEL_62;
  }
  id v15 = v18;
  if (!-[VCSessionParticipantRemote setupVideoStreamConfiguration:withStreamGroupStreamConfig:codecConfigs:multiwayConfig:groupID:](self, "setupVideoStreamConfiguration:withStreamGroupStreamConfig:codecConfigs:multiwayConfig:groupID:", v18, a4, objc_msgSend((id)objc_msgSend(a3, "codecConfigs"), "array"), a6, v12))
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantRemote newMediaStreamConfigWithStreamGroupConfig:streamConfig:rateControlConfig:multiwayConfig:].cold.4();
        }
      }
      goto LABEL_62;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v19 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v19 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v29 = VRTraceErrorLogLevelToCSTR();
      double v25 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v30 = 136316162;
        uint64_t v31 = v29;
        __int16 v32 = 2080;
        long long v33 = "-[VCSessionParticipantRemote newMediaStreamConfigWithStreamGroupConfig:streamConfig:rateControlConfig:multiwayConfig:]";
        __int16 v34 = 1024;
        int v35 = 2294;
        __int16 v36 = 2112;
        __int16 v37 = v19;
        __int16 v38 = 2048;
        long long v39 = self;
        BOOL v26 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to setup the video stream config";
        goto LABEL_48;
      }
    }
LABEL_62:

    return 0;
  }
LABEL_9:
  [v15 setMultiwayConfig:a6];
  [v15 setDirection:2];
  objc_msgSend(v15, "setRemoteSSRC:", objc_msgSend(a4, "ssrc"));
  [v15 setRateControlConfig:a5];
  if (v12 == 1667329381) {
    [(VCSessionParticipantRemote *)self updateStreamConfigWithMLEnhance:v15];
  }
  uint64_t v16 = [a4 rtpTimestampRate];
  if (!v16) {
    uint64_t v16 = [(VCSessionParticipant *)self preferredIOSampleRateForGroupID:v12];
  }
  [v15 setRtpTimestampRate:v16];
  if ((objc_msgSend(a4, "applyCipherSuiteOnMediaStreamConfig:codecConfigs:", v15, objc_msgSend(a3, "codecConfigs")) & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionParticipantRemote newMediaStreamConfigWithStreamGroupConfig:streamConfig:rateControlConfig:multiwayConfig:]();
      }
    }
    goto LABEL_62;
  }
  if (![(VCSessionParticipant *)self completeStreamSetup:v15 rtpCipherSuite:3])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionParticipantRemote newMediaStreamConfigWithStreamGroupConfig:streamConfig:rateControlConfig:multiwayConfig:]();
      }
    }
    goto LABEL_62;
  }
  return v15;
}

- (BOOL)setupStreamConfigWithCodecs:(id)a3 streamConfig:(id)a4 codecConfigs:(id)a5 featureStringsDict:(id)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  int v28 = [a5 count];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = a3;
  uint64_t v9 = [a3 countByEnumeratingWithState:&v42 objects:v41 count:16];
  if (!v9) {
    return 0;
  }
  uint64_t v10 = v9;
  BOOL v11 = 0;
  uint64_t v26 = *(void *)v43;
  while (2)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v43 != v26) {
        objc_enumerationMutation(obj);
      }
      int v13 = *(void **)(*((void *)&v42 + 1) + 8 * i);
      if ((int)[v13 intValue] >= v28)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          return v11;
        }
        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
        uint64_t v19 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          return v11;
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v30 = v18;
        __int16 v31 = 2080;
        __int16 v32 = "-[VCSessionParticipantRemote setupStreamConfigWithCodecs:streamConfig:codecConfigs:featureStringsDict:]";
        __int16 v33 = 1024;
        int v34 = 2339;
        __int16 v35 = 2112;
        uint64_t v36 = (uint64_t)v13;
        __int16 v37 = 1024;
        LODWORD(v38) = v28;
        BOOL v20 = "VCSessionParticipantRemote [%s] %s:%d codecIndex=%@ out of bounds, codecConfigCount=%d";
        int64_t v21 = v19;
        uint32_t v22 = 44;
LABEL_22:
        _os_log_error_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_ERROR, v20, buf, v22);
        return v11;
      }
      uint64_t v14 = objc_msgSend(a5, "objectAtIndexedSubscript:", (int)objc_msgSend(v13, "intValue"));
      uint64_t v15 = +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", [v14 codecType]);
      uint64_t v16 = [v14 rtpPayload];
      [a4 addTxPayloadType:v15 networkPayload:v16];
      [a4 addRxPayloadType:v15 networkPayload:v16];
      if ([v14 profileLevelId])
      {
        objc_msgSend(a4, "setProfileLevel:", +[VCVideoStreamConfig profileLevelStringForId:](VCVideoStreamConfig, "profileLevelStringForId:", objc_msgSend(v14, "profileLevelId")));
        if (![a4 profileLevel])
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
            return v11;
          }
          uint64_t v23 = VRTraceErrorLogLevelToCSTR();
          uint64_t v24 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            return v11;
          }
          *(_DWORD *)buf = 136316418;
          uint64_t v30 = v23;
          __int16 v31 = 2080;
          __int16 v32 = "-[VCSessionParticipantRemote setupStreamConfigWithCodecs:streamConfig:codecConfigs:featureStringsDict:]";
          __int16 v33 = 1024;
          int v34 = 2347;
          __int16 v35 = 2048;
          uint64_t v36 = [v14 profileLevelId];
          __int16 v37 = 2112;
          __int16 v38 = v13;
          __int16 v39 = 1024;
          int v40 = v28;
          BOOL v20 = "VCSessionParticipantRemote [%s] %s:%d Could not retrieve a valid profileLevel string from profileLevelId"
                "=%lu with codecIndex=%@ codecConfigCount=%d";
          int64_t v21 = v24;
          uint32_t v22 = 54;
          goto LABEL_22;
        }
      }
      objc_msgSend(a4, "setRtcpEnabled:", objc_msgSend(v14, "rtcpSREnabled"));
      objc_msgSend(a4, "setRtcpPSFB_FIREnabled:", objc_msgSend(v14, "rtcpPSFB_FIREnabled"));
      if ([a4 isRTCPEnabled])
      {
        [a4 setRtcpSendInterval:0.0];
        [a4 setRtcpTimeOutEnabled:1];
        [a4 setRtcpTimeOutInterval:30.0];
      }
      objc_msgSend(a4, "addTxCodecFeatureListString:codecType:", objc_msgSend(a6, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v15)), objc_msgSend(v14, "codecType"));
      objc_msgSend(a4, "addRxCodecFeatureListString:codecType:", objc_msgSend(a6, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v15)), objc_msgSend(v14, "codecType"));
      BOOL v11 = 1;
    }
    uint64_t v10 = [obj countByEnumeratingWithState:&v42 objects:v41 count:16];
    if (v10) {
      continue;
    }
    return v11;
  }
}

- (id)newMediaStreamConfigWithStreamConfig:(id)a3 streamGroupConfig:(id)a4 maxIDSStreamIDCount:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = objc_alloc_init(VCMediaStreamRateControlConfig);
  if (!v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionParticipantRemote newMediaStreamConfigWithStreamConfig:streamGroupConfig:maxIDSStreamIDCount:]();
      }
    }
    goto LABEL_12;
  }
  id v10 = -[VCSessionParticipantRemote newMultiwayConfigWithStreamGroupStreamConfig:maxIDSStreamIDCount:groupID:](self, "newMultiwayConfigWithStreamGroupStreamConfig:maxIDSStreamIDCount:groupID:", a3, v5, [a4 groupID]);
  if (!v10)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionParticipantRemote newMediaStreamConfigWithStreamConfig:streamGroupConfig:maxIDSStreamIDCount:]();
      }
    }
LABEL_12:
    BOOL v11 = 0;
LABEL_13:
    int v13 = 0;
    goto LABEL_5;
  }
  BOOL v11 = v10;
  id v12 = [(VCSessionParticipantRemote *)self newMediaStreamConfigWithStreamGroupConfig:a4 streamConfig:a3 rateControlConfig:v9 multiwayConfig:v10];
  if (!v12)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantRemote newMediaStreamConfigWithStreamConfig:streamGroupConfig:maxIDSStreamIDCount:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v15 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v15 = &stru_1F3D3E450;
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
          int64_t v21 = "-[VCSessionParticipantRemote newMediaStreamConfigWithStreamConfig:streamGroupConfig:maxIDSStreamIDCount:]";
          __int16 v22 = 1024;
          int v23 = 2380;
          __int16 v24 = 2112;
          double v25 = v15;
          __int16 v26 = 2048;
          uint64_t v27 = self;
          _os_log_error_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to allocate stream configuration!", (uint8_t *)&v18, 0x30u);
        }
      }
    }
    goto LABEL_13;
  }
  int v13 = v12;
LABEL_5:

  return v13;
}

- (id)newMediaStreamInfoWithNegotiationConfig:(id)a3 streamToken:(int64_t)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_alloc_init(VCSessionParticipantMediaStreamInfo);
  if (!v7)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantRemote newMediaStreamInfoWithNegotiationConfig:streamToken:]();
        }
      }
      goto LABEL_38;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v32 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v32 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v35 = VRTraceErrorLogLevelToCSTR();
      uint64_t v28 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v46 = v35;
        __int16 v47 = 2080;
        __int16 v48 = "-[VCSessionParticipantRemote newMediaStreamInfoWithNegotiationConfig:streamToken:]";
        __int16 v49 = 1024;
        int v50 = 2398;
        __int16 v51 = 2112;
        uint64_t v52 = v32;
        __int16 v53 = 2048;
        long long v54 = self;
        uint64_t v29 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to create media stream info";
LABEL_41:
        _os_log_error_impl(&dword_1E1EA4000, v28, OS_LOG_TYPE_ERROR, v29, buf, 0x30u);
      }
    }
LABEL_38:
    __int16 v24 = 0;
    int v23 = 0;
    goto LABEL_39;
  }
  int64_t v39 = a4;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  int64_t v8 = (void *)[a3 streamConfigs];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v41 objects:v40 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    int v11 = 0;
    uint64_t v12 = *(void *)v42;
LABEL_4:
    uint64_t v13 = 0;
    int v14 = -v11;
    while (1)
    {
      if (*(void *)v42 != v12) {
        objc_enumerationMutation(v8);
      }
      uint64_t v15 = *(void **)(*((void *)&v41 + 1) + 8 * v13);
      uint64_t v16 = v14 + objc_msgSend((id)objc_msgSend(a3, "streamConfigs"), "count");
      if ([v15 v2StreamID])
      {
        uint64_t v16 = (2 * v16);
        if (v16 >= 0xD) {
          break;
        }
      }
      id v17 = [(VCSessionParticipantRemote *)self newMediaStreamConfigWithStreamConfig:v15 streamGroupConfig:a3 maxIDSStreamIDCount:v16];
      if (!v17)
      {
        if ((VCSessionParticipantRemote *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCSessionParticipantRemote newMediaStreamInfoWithNegotiationConfig:streamToken:].cold.4();
            }
          }
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            double v25 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
          }
          else {
            double v25 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v27 = VRTraceErrorLogLevelToCSTR();
            uint64_t v28 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              uint64_t v46 = v27;
              __int16 v47 = 2080;
              __int16 v48 = "-[VCSessionParticipantRemote newMediaStreamInfoWithNegotiationConfig:streamToken:]";
              __int16 v49 = 1024;
              int v50 = 2408;
              __int16 v51 = 2112;
              uint64_t v52 = v25;
              __int16 v53 = 2048;
              long long v54 = self;
              uint64_t v29 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to create media stream config";
              goto LABEL_41;
            }
          }
        }
        goto LABEL_38;
      }
      int v18 = v17;
      [(VCSessionParticipantMediaStreamInfo *)v7 addStreamConfig:v17];

      ++v13;
      --v14;
      if (v10 == v13)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v41 objects:v40 count:16];
        int v11 = -v14;
        if (v10) {
          goto LABEL_4;
        }
        goto LABEL_12;
      }
    }
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantRemote newMediaStreamInfoWithNegotiationConfig:streamToken:].cold.5();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v26 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v26 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v30 = VRTraceErrorLogLevelToCSTR();
        uint64_t v28 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v46 = v30;
          __int16 v47 = 2080;
          __int16 v48 = "-[VCSessionParticipantRemote newMediaStreamInfoWithNegotiationConfig:streamToken:]";
          __int16 v49 = 1024;
          int v50 = 2405;
          __int16 v51 = 2112;
          uint64_t v52 = v26;
          __int16 v53 = 2048;
          long long v54 = self;
          uint64_t v29 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) maxIDSStreamIDCount is beyond max allowed";
          goto LABEL_41;
        }
      }
    }
    goto LABEL_38;
  }
LABEL_12:
  if (![(VCSessionParticipantRemote *)self addOneToOneStreamConfigToMediaStreamInfo:v7 negotiatorStreamGroupConfig:a3]&& (int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    __int16 v20 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int64_t v21 = FourccToCStr([a3 groupID]);
      *(_DWORD *)buf = 136315906;
      uint64_t v46 = v19;
      __int16 v47 = 2080;
      __int16 v48 = "-[VCSessionParticipantRemote newMediaStreamInfoWithNegotiationConfig:streamToken:]";
      __int16 v49 = 1024;
      int v50 = 2416;
      __int16 v51 = 2080;
      uint64_t v52 = v21;
      _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, "VCSessionParticipantRemote [%s] %s:%d Failed to add one to one groupID=%s stream configuration to media stream info", buf, 0x26u);
    }
  }
  id v22 = [(VCSessionParticipantRemote *)self newMediaStreamWithNegotiationConfig:a3 streamToken:v39];
  if (!v22)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantRemote newMediaStreamInfoWithNegotiationConfig:streamToken:]();
        }
      }
      goto LABEL_38;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v33 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v33 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v36 = VRTraceErrorLogLevelToCSTR();
      uint64_t v28 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v46 = v36;
        __int16 v47 = 2080;
        __int16 v48 = "-[VCSessionParticipantRemote newMediaStreamInfoWithNegotiationConfig:streamToken:]";
        __int16 v49 = 1024;
        int v50 = 2421;
        __int16 v51 = 2112;
        uint64_t v52 = v33;
        __int16 v53 = 2048;
        long long v54 = self;
        uint64_t v29 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to create media stream";
        goto LABEL_41;
      }
    }
    goto LABEL_38;
  }
  int v23 = v22;
  [v22 setLogPrefix:objc_msgSend(NSString, "stringWithFormat:", @"participantID:%@ streamToken:%d", self->super._uuid, v39)];
  if ([(VCSessionParticipantRemote *)self setupStreamRTP:v23])
  {
    [(VCSessionParticipantMediaStreamInfo *)v7 setStream:v23];
    __int16 v24 = v7;
  }
  else
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantRemote newMediaStreamInfoWithNegotiationConfig:streamToken:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v34 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
      }
      else {
        int v34 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v37 = VRTraceErrorLogLevelToCSTR();
        __int16 v38 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v46 = v37;
          __int16 v47 = 2080;
          __int16 v48 = "-[VCSessionParticipantRemote newMediaStreamInfoWithNegotiationConfig:streamToken:]";
          __int16 v49 = 1024;
          int v50 = 2425;
          __int16 v51 = 2112;
          uint64_t v52 = v34;
          __int16 v53 = 2048;
          long long v54 = self;
          _os_log_error_impl(&dword_1E1EA4000, v38, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) invalid capabilies dictionary for media stream!", buf, 0x30u);
        }
      }
    }
    __int16 v24 = 0;
  }
LABEL_39:

  return v24;
}

- (void)setupMediaStreamGroupConfig:(id)a3 withNegotiationConfig:(id)a4
{
  objc_msgSend(a3, "setStreamGroupID:", objc_msgSend(a4, "groupID"));
  objc_msgSend(a3, "setSyncGroupID:", objc_msgSend(a4, "syncGroupID"));
  if ([a4 groupID] == 1667329381
    || [a4 groupID] == 1667329399)
  {
    uint64_t ID = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._participantStreamTokens, "objectForKeyedSubscript:", &unk_1F3DC4500), "integerValue");
  }
  else
  {
    uint64_t ID = VCUniqueIDGenerator_GenerateID();
  }
  [a3 setStreamToken:ID];
  objc_msgSend(a3, "setMediaType:", objc_msgSend(a4, "mediaType"));
  objc_msgSend(a3, "setMediaSubtype:", objc_msgSend(a4, "mediaSubtype"));
  [a3 setDelegate:self];
  [a3 setDelegateQueue:self->super._participantQueue];
  [a3 setParticipantUUID:self->super._uuid];
  [a3 setIdsParticipantID:self->super._idsParticipantID];
  objc_msgSend(a3, "setJbTargetEstimatorSynchronizer:", -[NSMutableDictionary objectForKeyedSubscript:](self->_jbSynchronizerPerSyncGroupID, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "streamGroupID"))));
  [a3 setNetworkFeedbackController:self->super._networkFeedbackController];
  sessionUUuint64_t ID = self->super._sessionUUID;

  [a3 setSessionUUID:sessionUUID];
}

- (int)spatialChannelIndex:(unsigned int *)a3 spatialAudioSourceID:(unint64_t *)a4 forMediaType:(unsigned int)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  unint64_t v30 = 0;
  unsigned int v29 = 0;
  uint64_t v9 = [(VCSessionParticipantRemote *)self spatialMetadataEntryForMediaType:*(void *)&a5];
  if (!v9)
  {
    int v11 = 0;
    goto LABEL_13;
  }
  uint64_t v10 = (uint64_t)v9;
  if (!a3)
  {
    int v11 = 0;
    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  int v11 = VCSpatialAudioMetadata_ChannelIndex((uint64_t)v9, &v29);
  if ((v11 & 0x80000000) == 0)
  {
    if (!a4) {
      goto LABEL_9;
    }
LABEL_7:
    int v11 = VCSpatialAudioMetadata_SpatialAudioSourceID(v10, &v30);
    if (v11 < 0)
    {
      if ((VCSessionParticipantRemote *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_8;
        }
        uint64_t v20 = VRTraceErrorLogLevelToCSTR();
        int64_t v21 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          goto LABEL_8;
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v32 = v20;
        __int16 v33 = 2080;
        int v34 = "-[VCSessionParticipantRemote spatialChannelIndex:spatialAudioSourceID:forMediaType:]";
        __int16 v35 = 1024;
        int v36 = 2469;
        __int16 v37 = 1024;
        *(_DWORD *)__int16 v38 = a5;
        *(_WORD *)&v38[4] = 1024;
        *(_DWORD *)&v38[6] = v11;
        id v22 = "VCSessionParticipantRemote [%s] %s:%d Failed to retrieve spatial audio source ID for mediaType=%d. status=%08x";
        int v23 = v21;
        uint32_t v24 = 40;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          int v14 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
        }
        else {
          int v14 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_8;
        }
        uint64_t v27 = VRTraceErrorLogLevelToCSTR();
        uint64_t v28 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          goto LABEL_8;
        }
        *(_DWORD *)buf = 136316674;
        uint64_t v32 = v27;
        __int16 v33 = 2080;
        int v34 = "-[VCSessionParticipantRemote spatialChannelIndex:spatialAudioSourceID:forMediaType:]";
        __int16 v35 = 1024;
        int v36 = 2469;
        __int16 v37 = 2112;
        *(void *)__int16 v38 = v14;
        *(_WORD *)&v38[8] = 2048;
        int64_t v39 = self;
        __int16 v40 = 1024;
        unsigned int v41 = a5;
        __int16 v42 = 1024;
        int v43 = v11;
        id v22 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to retrieve spatial audio source ID for mediaType=%d. status=%08x";
        int v23 = v28;
        uint32_t v24 = 60;
      }
      _os_log_error_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_ERROR, v22, buf, v24);
    }
LABEL_8:
    *a4 = v30;
    goto LABEL_9;
  }
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      uint64_t v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v32 = v15;
        __int16 v33 = 2080;
        int v34 = "-[VCSessionParticipantRemote spatialChannelIndex:spatialAudioSourceID:forMediaType:]";
        __int16 v35 = 1024;
        int v36 = 2465;
        __int16 v37 = 1024;
        *(_DWORD *)__int16 v38 = a5;
        *(_WORD *)&v38[4] = 1024;
        *(_DWORD *)&v38[6] = v11;
        id v17 = "VCSessionParticipantRemote [%s] %s:%d Failed to retrieve channel index for mediaType=%d. status=%08x";
        int v18 = v16;
        uint32_t v19 = 40;
LABEL_31:
        _os_log_error_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v13 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v13 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v25 = VRTraceErrorLogLevelToCSTR();
      __int16 v26 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316674;
        uint64_t v32 = v25;
        __int16 v33 = 2080;
        int v34 = "-[VCSessionParticipantRemote spatialChannelIndex:spatialAudioSourceID:forMediaType:]";
        __int16 v35 = 1024;
        int v36 = 2465;
        __int16 v37 = 2112;
        *(void *)__int16 v38 = v13;
        *(_WORD *)&v38[8] = 2048;
        int64_t v39 = self;
        __int16 v40 = 1024;
        unsigned int v41 = a5;
        __int16 v42 = 1024;
        int v43 = v11;
        id v17 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to retrieve channel index for mediaType=%d. status=%08x";
        int v18 = v26;
        uint32_t v19 = 60;
        goto LABEL_31;
      }
    }
  }
LABEL_13:
  if (a4) {
    goto LABEL_8;
  }
LABEL_9:
  if (a3) {
    *a3 = v29;
  }
  return v11;
}

- (int)setupSpatialInfoForStreamGroupConfig:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v22 = 0;
  unsigned int v21 = 0;
  uint64_t v5 = (void *)[a3 audioStreamGroupConfig];
  id v6 = +[VCSessionParticipant mediaTypesFromStreamGroupID:](VCSessionParticipant, "mediaTypesFromStreamGroupID:", [a3 streamGroupID]);
  if ([v6 count] == 1)
  {
    uint64_t v7 = objc_msgSend((id)objc_msgSend(v6, "anyObject"), "unsignedIntValue");
    int v8 = [(VCSessionParticipantRemote *)self spatialChannelIndex:&v21 spatialAudioSourceID:&v22 forMediaType:v7];
    if ((v8 & 0x80000000) == 0)
    {
      [v5 setSpatialAudioSourceID:v22];
      [v5 setAudioChannelIndex:v21];
      goto LABEL_4;
    }
    if ((VCSessionParticipantRemote *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        int v11 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
      }
      else {
        int v11 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_4;
      }
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      uint64_t v20 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_4;
      }
      *(_DWORD *)buf = 136316674;
      uint64_t v24 = v19;
      __int16 v25 = 2080;
      __int16 v26 = "-[VCSessionParticipantRemote setupSpatialInfoForStreamGroupConfig:]";
      __int16 v27 = 1024;
      int v28 = 2492;
      __int16 v29 = 2112;
      *(void *)unint64_t v30 = v11;
      *(_WORD *)&v30[8] = 2048;
      __int16 v31 = self;
      __int16 v32 = 1024;
      *(_DWORD *)__int16 v33 = v7;
      *(_WORD *)&v33[4] = 1024;
      *(_DWORD *)&v33[6] = v8;
      int v14 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to retrieve spatial information for mediaType=%d. status=%08x";
      uint64_t v15 = v20;
      uint32_t v16 = 60;
      goto LABEL_30;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint64_t v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v24 = v12;
        __int16 v25 = 2080;
        __int16 v26 = "-[VCSessionParticipantRemote setupSpatialInfoForStreamGroupConfig:]";
        __int16 v27 = 1024;
        int v28 = 2492;
        __int16 v29 = 1024;
        *(_DWORD *)unint64_t v30 = v7;
        *(_WORD *)&v30[4] = 1024;
        *(_DWORD *)&v30[6] = v8;
        int v14 = "VCSessionParticipantRemote [%s] %s:%d Failed to retrieve spatial information for mediaType=%d. status=%08x";
        uint64_t v15 = v13;
        uint32_t v16 = 40;
LABEL_30:
        _os_log_error_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
      }
    }
  }
  else
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantRemote setupSpatialInfoForStreamGroupConfig:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v10 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v10 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v17 = VRTraceErrorLogLevelToCSTR();
        int v18 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316674;
          uint64_t v24 = v17;
          __int16 v25 = 2080;
          __int16 v26 = "-[VCSessionParticipantRemote setupSpatialInfoForStreamGroupConfig:]";
          __int16 v27 = 1024;
          int v28 = 2488;
          __int16 v29 = 2112;
          *(void *)unint64_t v30 = v10;
          *(_WORD *)&v30[8] = 2048;
          __int16 v31 = self;
          __int16 v32 = 2048;
          *(void *)__int16 v33 = [v6 count];
          *(_WORD *)&v33[8] = 1024;
          int v34 = 0;
          _os_log_error_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Unexpected number of media types. Count=%lu. status=%08x", buf, 0x40u);
        }
      }
    }
    int v8 = 0;
  }
LABEL_4:
  if (+[VCHardwareSettings deviceClass] == 8
    && !v22
    && [a3 streamGroupID] == 1937339233)
  {
    objc_msgSend(v5, "setSpatialAudioSourceID:", objc_msgSend(a3, "streamToken"));
    [v5 setAudioChannelIndex:0];
    return 0;
  }
  return v8;
}

- (id)newStreamGroupConfigWithNegotiationConfig:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if ([a3 mediaType] != 1936684398)
  {
    uint64_t v10 = objc_alloc_init(VCVideoStreamReceiveGroupConfig);
    if (v10)
    {
      id v6 = v10;
      [(VCSessionParticipantRemote *)self setupMediaStreamGroupConfig:v10 withNegotiationConfig:a3];
      goto LABEL_12;
    }
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantRemote newStreamGroupConfigWithNegotiationConfig:].cold.4();
        }
      }
      goto LABEL_50;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v17 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v17 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v27 = VRTraceErrorLogLevelToCSTR();
      __int16 v26 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v30 = 136316162;
        uint64_t v31 = v27;
        __int16 v32 = 2080;
        __int16 v33 = "-[VCSessionParticipantRemote newStreamGroupConfigWithNegotiationConfig:]";
        __int16 v34 = 1024;
        int v35 = 2541;
        __int16 v36 = 2112;
        __int16 v37 = v17;
        __int16 v38 = 2048;
        int64_t v39 = self;
        goto LABEL_58;
      }
    }
LABEL_50:
    id v6 = 0;
    goto LABEL_51;
  }
  uint64_t v5 = objc_alloc_init(VCAudioStreamReceiveGroupConfig);
  if (!v5)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantRemote newStreamGroupConfigWithNegotiationConfig:]();
        }
      }
      goto LABEL_50;
    }
    if (objc_opt_respondsToSelector()) {
      uint32_t v16 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      uint32_t v16 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v25 = VRTraceErrorLogLevelToCSTR();
      __int16 v26 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v30 = 136316162;
        uint64_t v31 = v25;
        __int16 v32 = 2080;
        __int16 v33 = "-[VCSessionParticipantRemote newStreamGroupConfigWithNegotiationConfig:]";
        __int16 v34 = 1024;
        int v35 = 2519;
        __int16 v36 = 2112;
        __int16 v37 = v16;
        __int16 v38 = 2048;
        int64_t v39 = self;
LABEL_58:
        _os_log_error_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to create stream group config", (uint8_t *)&v30, 0x30u);
        goto LABEL_50;
      }
    }
    goto LABEL_50;
  }
  id v6 = v5;
  uint64_t v7 = [(VCAudioStreamReceiveGroupConfig *)v5 audioStreamGroupConfig];
  [(VCAudioStreamGroupCommonConfig *)v7 setAudioSessionID:self->super._transportSessionID];
  -[VCAudioStreamGroupCommonConfig setPreferredIOSampleRate:](v7, "setPreferredIOSampleRate:", -[VCSessionParticipant preferredIOSampleRateForGroupID:](self, "preferredIOSampleRateForGroupID:", [a3 groupID]));
  -[VCAudioStreamGroupCommonConfig setPreferredIOSamplesPerFrame:](v7, "setPreferredIOSamplesPerFrame:", -[VCSessionParticipant preferredIOSamplesPerFrameForGroupID:](self, "preferredIOSamplesPerFrameForGroupID:", [a3 groupID]));
  [(VCAudioStreamGroupCommonConfig *)v7 setIsGKVoiceChat:self->super._isGKVoiceChat];
  [(VCAudioStreamGroupCommonConfig *)v7 setProcessID:self->super._processId];
  if ([a3 groupID] == 1937339233)
  {
    int v8 = v6;
    uint64_t v9 = 5;
LABEL_9:
    [v8 setCaptureSource:v9];
    goto LABEL_11;
  }
  if ([a3 groupID] == 1936290409)
  {
    int v8 = v6;
    uint64_t v9 = 7;
    goto LABEL_9;
  }
  [v6 setCaptureSource:4];
  [(VCAudioStreamGroupCommonConfig *)v7 setPowerSpectrumStreamToken:[(VCSessionParticipant *)self participantVideoToken]];
  [(VCAudioStreamGroupCommonConfig *)v7 setCaptionsCoordinator:self->super._captionsCoordinator];
LABEL_11:
  [(VCSessionParticipantRemote *)self setupMediaStreamGroupConfig:v6 withNegotiationConfig:a3];
  int v11 = [(VCSessionParticipantRemote *)self setupSpatialInfoForStreamGroupConfig:v6];
  if (v11 < 0)
  {
    int v18 = v11;
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantRemote newStreamGroupConfigWithNegotiationConfig:]();
        }
      }
      goto LABEL_51;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v19 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v19 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v28 = VRTraceErrorLogLevelToCSTR();
      __int16 v29 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v30 = 136316418;
        uint64_t v31 = v28;
        __int16 v32 = 2080;
        __int16 v33 = "-[VCSessionParticipantRemote newStreamGroupConfigWithNegotiationConfig:]";
        __int16 v34 = 1024;
        int v35 = 2548;
        __int16 v36 = 2112;
        __int16 v37 = v19;
        __int16 v38 = 2048;
        int64_t v39 = self;
        __int16 v40 = 1024;
        int v41 = v18;
        uint64_t v22 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed configure stream group config spatial info. status=%08x";
        int v23 = v29;
        uint32_t v24 = 54;
        goto LABEL_56;
      }
    }
LABEL_51:

    return 0;
  }
LABEL_12:
  id v12 = -[VCSessionParticipantRemote newMediaStreamInfoWithNegotiationConfig:streamToken:](self, "newMediaStreamInfoWithNegotiationConfig:streamToken:", a3, [v6 streamToken]);
  if (!v12)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantRemote newStreamGroupConfigWithNegotiationConfig:]();
        }
      }
      goto LABEL_51;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v15 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v15 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      unsigned int v21 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v30 = 136316162;
        uint64_t v31 = v20;
        __int16 v32 = 2080;
        __int16 v33 = "-[VCSessionParticipantRemote newStreamGroupConfigWithNegotiationConfig:]";
        __int16 v34 = 1024;
        int v35 = 2551;
        __int16 v36 = 2112;
        __int16 v37 = v15;
        __int16 v38 = 2048;
        int64_t v39 = self;
        uint64_t v22 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to create media stream info";
        int v23 = v21;
        uint32_t v24 = 48;
LABEL_56:
        _os_log_error_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_ERROR, v22, (uint8_t *)&v30, v24);
        goto LABEL_51;
      }
    }
    goto LABEL_51;
  }
  uint64_t v13 = v12;
  [v6 addMediaStreamInfo:v12];

  return v6;
}

- (id)newMediaStreamWithNegotiationConfig:(id)a3 streamToken:(int64_t)a4
{
  if ([a3 mediaType] == 1936684398)
  {
    uint64_t v7 = [[VCAudioStream alloc] initWithClientPid:self->super._processId ssrc:0 transportSessionID:self->super._transportSessionID streamToken:a4];
LABEL_8:
    id v12 = v7;
    [(VCMediaStream *)v7 setNetworkFeedbackController:self->super._networkFeedbackController];
    return v12;
  }
  if ([a3 groupID] != 1667330164)
  {
    uint64_t v7 = [[VCVideoStream alloc] initWithTransportSessionID:self->super._transportSessionID idsParticipantID:self->super._idsParticipantID ssrc:0 streamToken:a4];
    goto LABEL_8;
  }
  int v8 = [VCCaptionsStream alloc];
  transportSessionuint64_t ID = self->super._transportSessionID;
  unint64_t idsParticipantID = self->super._idsParticipantID;

  return [(VCCaptionsStream *)v8 initWithTransportSessionID:transportSessionID idsParticipantID:idsParticipantID ssrc:0 streamToken:a4];
}

- (BOOL)addOneToOneStreamConfigToMediaStreamInfo:(id)a3 negotiatorStreamGroupConfig:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    int v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v35 = 136315906;
      uint64_t v36 = v7;
      __int16 v37 = 2080;
      __int16 v38 = "-[VCSessionParticipantRemote addOneToOneStreamConfigToMediaStreamInfo:negotiatorStreamGroupConfig:]";
      __int16 v39 = 1024;
      int v40 = 2583;
      __int16 v41 = 2080;
      uint64_t v42 = FourccToCStr([a4 groupID]);
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "VCSessionParticipantRemote [%s] %s:%d Add one to one stream config to media stream info for groupID=%s", (uint8_t *)&v35, 0x26u);
    }
  }
  if (![(VCMediaNegotiatorResultsFaceTimeSettings *)[(VCSessionMediaNegotiator *)self->super._mediaNegotiator negotiatedFaceTimeSettings] oneToOneModeSupported])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_39;
    }
    uint64_t v29 = VRTraceErrorLogLevelToCSTR();
    int v30 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_39;
    }
    BOOL v31 = [(VCMediaNegotiatorResultsFaceTimeSettings *)[(VCSessionMediaNegotiator *)self->super._mediaNegotiator negotiatedFaceTimeSettings] oneToOneModeSupported];
    int v35 = 136315906;
    uint64_t v36 = v29;
    __int16 v37 = 2080;
    __int16 v38 = "-[VCSessionParticipantRemote addOneToOneStreamConfigToMediaStreamInfo:negotiatorStreamGroupConfig:]";
    __int16 v39 = 1024;
    int v40 = 2584;
    __int16 v41 = 1024;
    LODWORD(v42) = v31;
    __int16 v26 = "VCSessionParticipantRemote [%s] %s:%d No one to one streams to setup oneToOneModeSupported=%d";
    uint64_t v27 = v30;
    uint32_t v28 = 34;
    goto LABEL_38;
  }
  if ([a4 mediaType] == 1986618469
    || [a4 mediaType] == 1835365473)
  {
    id v9 = -[VCSessionMediaNegotiator negotiatedResultsForGroupID:](self->super._mediaNegotiator, "negotiatedResultsForGroupID:", [a4 groupID]);
    if (v9)
    {
      uint64_t v10 = v9;
      if ([v9 isSupported])
      {
        id v11 = -[VCSessionParticipant newOneToOneVideoStreamConfigWithStreamDirection:streamGroupId:streamSsrc:encodingType:videoSettings:](self, "newOneToOneVideoStreamConfigWithStreamDirection:streamGroupId:streamSsrc:encodingType:videoSettings:", 2, [a4 groupID], objc_msgSend(v10, "remoteSSRC"), 2, v10);
LABEL_10:
        if ([a4 groupID] == 1667329381) {
          [(VCSessionParticipantRemote *)self updateStreamConfigWithMLEnhance:v11];
        }
        int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
        if (v11)
        {
          if (ErrorLogLevelForModule >= 7)
          {
            uint64_t v13 = VRTraceErrorLogLevelToCSTR();
            int v14 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v15 = FourccToCStr([a4 groupID]);
              int v35 = 136315906;
              uint64_t v36 = v13;
              __int16 v37 = 2080;
              __int16 v38 = "-[VCSessionParticipantRemote addOneToOneStreamConfigToMediaStreamInfo:negotiatorStreamGroupConfig:]";
              __int16 v39 = 1024;
              int v40 = 2611;
              __int16 v41 = 2080;
              uint64_t v42 = v15;
              _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, "VCSessionParticipantRemote [%s] %s:%d Added one to one stream config to %s streamGroup", (uint8_t *)&v35, 0x26u);
            }
          }
          [a3 addStreamConfig:v11];
          goto LABEL_17;
        }
        if (ErrorLogLevelForModule >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSessionParticipantRemote addOneToOneStreamConfigToMediaStreamInfo:negotiatorStreamGroupConfig:]();
          }
        }
LABEL_21:
        id v11 = 0;
        BOOL v16 = 0;
        goto LABEL_22;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v32 = VRTraceErrorLogLevelToCSTR();
      __int16 v33 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        __int16 v34 = FourccToCStr([a4 groupID]);
        int v35 = 136315906;
        uint64_t v36 = v32;
        __int16 v37 = 2080;
        __int16 v38 = "-[VCSessionParticipantRemote addOneToOneStreamConfigToMediaStreamInfo:negotiatorStreamGroupConfig:]";
        __int16 v39 = 1024;
        int v40 = 2588;
        __int16 v41 = 2080;
        uint64_t v42 = v34;
        __int16 v26 = "VCSessionParticipantRemote [%s] %s:%d One to one video streams not supported for groupID=%s";
        uint64_t v27 = v33;
        goto LABEL_37;
      }
    }
  }
  else
  {
    if ([a4 mediaType] != 1936684398)
    {
      id v11 = 0;
      goto LABEL_10;
    }
    uint64_t v18 = [a4 groupID];
    id v19 = [(VCSessionMediaNegotiator *)self->super._mediaNegotiator negotiatedResultsForGroupID:v18];
    if (v19)
    {
      id v20 = -[VCSessionParticipant newOneToOneAudioStreamConfigWithAudioSettings:streamDirection:streamGroupId:streamSsrc:](self, "newOneToOneAudioStreamConfigWithAudioSettings:streamDirection:streamGroupId:streamSsrc:", v19, 2, [a4 groupID], objc_msgSend(v19, "remoteSSRC"));
      id v11 = v20;
      if (v18 == 1835623282) {
        [v20 setOutOfProcessCodecsEnabled:self->_outOfProcessCodecsEnabled];
      }
      [v11 setIsEnhancedJBAdaptationsEnabled:self->_isEnhancedJBAdaptationsEnabled];
      goto LABEL_10;
    }
    BOOL v16 = v18 == 1937339233;
    if (v18 == 1937339233) {
      int v21 = 7;
    }
    else {
      int v21 = 3;
    }
    if (v21 > (int)VRTraceGetErrorLogLevelForModule())
    {
      id v11 = 0;
      goto LABEL_22;
    }
    uint64_t v22 = VRTraceErrorLogLevelToCSTR();
    int v23 = *MEMORY[0x1E4F47A50];
    uint32_t v24 = *MEMORY[0x1E4F47A50];
    if (v18 != 1937339233)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[VCSessionParticipantRemote addOneToOneStreamConfigToMediaStreamInfo:negotiatorStreamGroupConfig:]();
      }
      goto LABEL_21;
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = FourccToCStr(1937339233);
      int v35 = 136315906;
      uint64_t v36 = v22;
      __int16 v37 = 2080;
      __int16 v38 = "-[VCSessionParticipantRemote addOneToOneStreamConfigToMediaStreamInfo:negotiatorStreamGroupConfig:]";
      __int16 v39 = 1024;
      int v40 = 2597;
      __int16 v41 = 2080;
      uint64_t v42 = v25;
      __int16 v26 = "VCSessionParticipantRemote [%s] %s:%d One to one audio streams not supported for groupID=%s";
      uint64_t v27 = v23;
LABEL_37:
      uint32_t v28 = 38;
LABEL_38:
      _os_log_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEFAULT, v26, (uint8_t *)&v35, v28);
    }
  }
LABEL_39:
  id v11 = 0;
LABEL_17:
  BOOL v16 = 1;
LABEL_22:

  return v16;
}

- (BOOL)setupStreamGroupWithConfig:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (!-[VCSessionParticipantRemote shouldSetupStreamGroupWithID:](self, "shouldSetupStreamGroupWithID:", [a3 groupID]))
  {
    id v9 = 0;
    uint64_t v7 = 0;
    goto LABEL_15;
  }
  int v5 = [a3 mediaType];
  id v6 = [(VCSessionParticipantRemote *)self newStreamGroupConfigWithNegotiationConfig:a3];
  if (!v6)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantRemote setupStreamGroupWithConfig:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v14 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
      }
      else {
        int v14 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v17 = VRTraceErrorLogLevelToCSTR();
        uint64_t v18 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v26 = 136316162;
          uint64_t v27 = v17;
          __int16 v28 = 2080;
          uint64_t v29 = "-[VCSessionParticipantRemote setupStreamGroupWithConfig:]";
          __int16 v30 = 1024;
          int v31 = 2634;
          __int16 v32 = 2112;
          __int16 v33 = v14;
          __int16 v34 = 2048;
          int v35 = self;
          _os_log_error_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to create stream group config", (uint8_t *)&v26, 0x30u);
        }
      }
    }
    id v9 = 0;
    uint64_t v7 = 0;
    goto LABEL_66;
  }
  uint64_t v7 = v6;
  if (v5 != 1936684398)
  {
    if ([v6 streamGroupID] == 1667330164)
    {
      id v9 = [(VCSessionParticipantRemote *)self newCaptionsStreamGroupWithStreamGroupConfig:v7];
      if (v9) {
        goto LABEL_14;
      }
      if ((VCSessionParticipantRemote *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSessionParticipantRemote setupStreamGroupWithConfig:].cold.4();
          }
        }
        goto LABEL_65;
      }
      if (objc_opt_respondsToSelector()) {
        uint64_t v10 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v10 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v24 = VRTraceErrorLogLevelToCSTR();
        int v23 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v26 = 136316162;
          uint64_t v27 = v24;
          __int16 v28 = 2080;
          uint64_t v29 = "-[VCSessionParticipantRemote setupStreamGroupWithConfig:]";
          __int16 v30 = 1024;
          int v31 = 2651;
          __int16 v32 = 2112;
          __int16 v33 = v10;
          __int16 v34 = 2048;
          int v35 = self;
          goto LABEL_68;
        }
      }
    }
    else
    {
      id v9 = [(VCSessionParticipantRemote *)self newVideoStreamGroupWithStreamGroupConfig:v7];
      if (v9) {
        goto LABEL_14;
      }
      if ((VCSessionParticipantRemote *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSessionParticipantRemote setupStreamGroupWithConfig:].cold.5();
          }
        }
        goto LABEL_65;
      }
      if (objc_opt_respondsToSelector()) {
        int v21 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
      }
      else {
        int v21 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v25 = VRTraceErrorLogLevelToCSTR();
        int v23 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v26 = 136316162;
          uint64_t v27 = v25;
          __int16 v28 = 2080;
          uint64_t v29 = "-[VCSessionParticipantRemote setupStreamGroupWithConfig:]";
          __int16 v30 = 1024;
          int v31 = 2655;
          __int16 v32 = 2112;
          __int16 v33 = v21;
          __int16 v34 = 2048;
          int v35 = self;
          goto LABEL_68;
        }
      }
    }
LABEL_65:
    id v9 = 0;
LABEL_66:
    BOOL v12 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v6, "setJbTargetEstimatorSynchronizer:", -[NSMutableDictionary objectForKeyedSubscript:](self->_jbSynchronizerPerSyncGroupID, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v6, "streamGroupID"))));
  [v7 setNetworkFeedbackController:self->super._networkFeedbackController];
  int v8 = [[VCAudioStreamReceiveGroup alloc] initWithConfig:v7];
  if (!v8)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantRemote setupStreamGroupWithConfig:]();
        }
      }
      goto LABEL_65;
    }
    if (objc_opt_respondsToSelector()) {
      BOOL v16 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      BOOL v16 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      int v23 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v26 = 136316162;
        uint64_t v27 = v22;
        __int16 v28 = 2080;
        uint64_t v29 = "-[VCSessionParticipantRemote setupStreamGroupWithConfig:]";
        __int16 v30 = 1024;
        int v31 = 2642;
        __int16 v32 = 2112;
        __int16 v33 = v16;
        __int16 v34 = 2048;
        int v35 = self;
LABEL_68:
        _os_log_error_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to create receive media group", (uint8_t *)&v26, 0x30u);
        goto LABEL_65;
      }
    }
    goto LABEL_65;
  }
  id v9 = v8;
  if ([a3 groupID] == 1835623282
    || [a3 groupID] == 1835623287)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._participantStreamTokens, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", -[VCMediaStreamGroup streamToken](v9, "streamToken")), &unk_1F3DC4518);
    [(NSMutableArray *)self->super._micStreamGroups addObject:v9];
  }
LABEL_14:
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._streamGroups, "setObject:forKeyedSubscript:", v9, objc_msgSend(NSNumber, "numberWithInteger:", -[VCMediaStreamGroup streamToken](v9, "streamToken")));
  uint64_t v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[VCMediaStreamGroup streamToken](v9, "streamToken"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._participantStreamTokens, "setObject:forKeyedSubscript:", v11, objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[VCMediaStreamGroup streamGroupID](v9, "streamGroupID")));
  if (!-[VCSessionParticipantRemote setupBandwidthAllocationTableForMediaStreamConfigs:streamGroupID:entryType:](self, "setupBandwidthAllocationTableForMediaStreamConfigs:streamGroupID:entryType:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "mediaStreamInfoArray"), "firstObject"), "streamConfigs"), -[VCMediaStreamGroup streamGroupID](v9, "streamGroupID"), +[VCSessionBandwidthAllocationTableEntry entryTypeForMediaType:](VCSessionBandwidthAllocationTableEntry, "entryTypeForMediaType:", -[VCMediaStreamGroup mediaType](v9, "mediaType"))))
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantRemote setupStreamGroupWithConfig:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v15 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v15 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v19 = VRTraceErrorLogLevelToCSTR();
        id v20 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v26 = 136316162;
          uint64_t v27 = v19;
          __int16 v28 = 2080;
          uint64_t v29 = "-[VCSessionParticipantRemote setupStreamGroupWithConfig:]";
          __int16 v30 = 1024;
          int v31 = 2665;
          __int16 v32 = 2112;
          __int16 v33 = v15;
          __int16 v34 = 2048;
          int v35 = self;
          _os_log_error_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to setup bandwidth allocation table for video!", (uint8_t *)&v26, 0x30u);
        }
      }
    }
    goto LABEL_66;
  }
LABEL_15:
  BOOL v12 = 1;
LABEL_16:

  return v12;
}

- (id)newVideoStreamGroupWithStreamGroupConfig:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  objc_msgSend(a3, "setJbTargetEstimatorSynchronizer:", -[NSMutableDictionary objectForKeyedSubscript:](self->_jbSynchronizerPerSyncGroupID, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "syncGroupID"))));
  [a3 setNetworkFeedbackController:self->super._networkFeedbackController];
  int v5 = [[VCVideoStreamReceiveGroup alloc] initWithConfig:a3];
  if (v5)
  {
    [(NSMutableArray *)self->super._videoStreamGroups addObject:v5];
  }
  else if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionParticipantRemote newVideoStreamGroupWithStreamGroupConfig:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v7 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      id v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v10 = 136316162;
        uint64_t v11 = v8;
        __int16 v12 = 2080;
        uint64_t v13 = "-[VCSessionParticipantRemote newVideoStreamGroupWithStreamGroupConfig:]";
        __int16 v14 = 1024;
        int v15 = 2678;
        __int16 v16 = 2112;
        uint64_t v17 = v7;
        __int16 v18 = 2048;
        uint64_t v19 = self;
        _os_log_error_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to create video receive stream group", (uint8_t *)&v10, 0x30u);
      }
    }
  }
  return v5;
}

- (id)newCaptionsStreamGroupWithStreamGroupConfig:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  objc_msgSend(a3, "setJbTargetEstimatorSynchronizer:", -[NSMutableDictionary objectForKeyedSubscript:](self->_jbSynchronizerPerSyncGroupID, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "syncGroupID"))));
  int v5 = [(VCVideoStreamReceiveGroup *)[VCCaptionsStreamReceiveGroup alloc] initWithConfig:a3];
  if (!v5)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantRemote newCaptionsStreamGroupWithStreamGroupConfig:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v7 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        id v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v10 = 136316162;
          uint64_t v11 = v8;
          __int16 v12 = 2080;
          uint64_t v13 = "-[VCSessionParticipantRemote newCaptionsStreamGroupWithStreamGroupConfig:]";
          __int16 v14 = 1024;
          int v15 = 2688;
          __int16 v16 = 2112;
          uint64_t v17 = v7;
          __int16 v18 = 2048;
          uint64_t v19 = self;
          _os_log_error_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to create captions receive stream group", (uint8_t *)&v10, 0x30u);
        }
      }
    }
  }
  return v5;
}

- (BOOL)shouldEnablePacketRetransmissionForStreamGroupID:(unsigned int)a3
{
  BOOL result = 1;
  if ((int)a3 > 1717854579)
  {
    if (a3 != 1717854580 && a3 != 1718909044)
    {
      int v4 = 1935897189;
LABEL_8:
      if (a3 != v4) {
        return 0;
      }
    }
  }
  else if (a3 != 1650745716 && a3 != 1667329381)
  {
    int v4 = 1667329399;
    goto LABEL_8;
  }
  return result;
}

- (BOOL)shouldSetupStreamGroupWithID:(unsigned int)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL BoolValueForKey = VCDefaults_GetBoolValueForKey(@"simulateWebRTCOnlyClient", 0);
  BOOL v6 = BoolValueForKey;
  if ((int)a3 > 1718909043)
  {
    if ((int)a3 > 1935897188)
    {
      if (a3 == 1935897189 || a3 == 1937339233)
      {
        char v14 = +[VCHardwareSettings deviceClass] == 6 || v6;
        if ((v14 & 1) == 0) {
          return 1;
        }
        goto LABEL_13;
      }
      goto LABEL_25;
    }
    if (a3 != 1718909044)
    {
      if (a3 == 1835623287)
      {
        uint64_t v7 = self;
        uint64_t v8 = 1835623282;
        goto LABEL_28;
      }
      goto LABEL_25;
    }
LABEL_9:
    char v9 = +[VCHardwareSettings deviceClass] != 8 || v6;
    if ((v9 & 1) == 0) {
      return 1;
    }
    goto LABEL_13;
  }
  switch(a3)
  {
    case 0x62646174u:
      goto LABEL_9;
    case 0x63616D77u:
      uint64_t v7 = self;
      uint64_t v8 = 1667329381;
LABEL_28:
      if (![(VCSessionParticipant *)v7 didNegotiateStreamGroupWithID:v8] || v6) {
        return 1;
      }
LABEL_13:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        uint64_t v11 = *MEMORY[0x1E4F47A50];
        BOOL v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
        BOOL result = 0;
        if (!v12) {
          return result;
        }
        int v15 = 136315906;
        uint64_t v16 = v10;
        __int16 v17 = 2080;
        __int16 v18 = "-[VCSessionParticipantRemote shouldSetupStreamGroupWithID:]";
        __int16 v19 = 1024;
        int v20 = 2730;
        __int16 v21 = 2080;
        uint64_t v22 = FourccToCStr(a3);
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, "VCSessionParticipantRemote [%s] %s:%d Skipping streamGroupID=%s", (uint8_t *)&v15, 0x26u);
      }
      return 0;
    case 0x66646174u:
      goto LABEL_9;
  }
LABEL_25:
  if (BoolValueForKey) {
    goto LABEL_13;
  }
  return 1;
}

- (void)createJitterBufferTargetEstimatorSynchronizer:(tagVCJBTargetEstimatorSynchronizer *)a3 syncGroupID:(unsigned int)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v26 = 0;
  memset(&v25[4], 0, 192);
  *(_DWORD *)uint64_t v25 = 1;
  CStringPtr = CFStringGetCStringPtr((CFStringRef)self->super._sessionUUID, 0x8000100u);
  uint64_t v8 = CFStringGetCStringPtr((CFStringRef)self->super._uuid, 0x8000100u);
  char v9 = FourccToCStr(a4);
  snprintf(&v25[4], 0xC8uLL, "session_%s-participant_%s-groupid_%s", CStringPtr, v8, v9);
  if ((VCJBTargetEstimatorSynchronizer_Create(*MEMORY[0x1E4F1CF80], (uint64_t *)a3, v25) & 0x80000000) != 0)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipantRemote createJitterBufferTargetEstimatorSynchronizer:syncGroupID:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v10 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v10 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        BOOL v12 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          uint64_t v14 = v11;
          __int16 v15 = 2080;
          uint64_t v16 = "-[VCSessionParticipantRemote createJitterBufferTargetEstimatorSynchronizer:syncGroupID:]";
          __int16 v17 = 1024;
          int v18 = 2743;
          __int16 v19 = 2112;
          int v20 = v10;
          __int16 v21 = 2048;
          uint64_t v22 = self;
          __int16 v23 = 2048;
          uint64_t v24 = self;
          _os_log_error_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to create Jitter Buffer Target Synchronizer remoteParticipant=%p", buf, 0x3Au);
        }
      }
    }
  }
}

- (void)setupJBTargetSynchronizers
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = [(VCSessionMediaNegotiator *)self->super._mediaNegotiator negotiatedStreamGroups];
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v37 objects:v36 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v38;
    *(void *)&long long v4 = 136316162;
    long long v19 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v38 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        if ((objc_msgSend(v8, "groupID", v19) == 1935897189 || self->_isVideoJitterForPlayoutEnabled)
          && !-[NSMutableDictionary objectForKey:](self->_jbSynchronizerPerSyncGroupID, "objectForKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v8, "syncGroupID"))))
        {
          CFTypeRef cf = 0;
          -[VCSessionParticipantRemote createJitterBufferTargetEstimatorSynchronizer:syncGroupID:](self, "createJitterBufferTargetEstimatorSynchronizer:syncGroupID:", &cf, [v8 syncGroupID]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_jbSynchronizerPerSyncGroupID, "setObject:forKeyedSubscript:", cf, objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v8, "syncGroupID")));
          if ((VCSessionParticipantRemote *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v16 = VRTraceErrorLogLevelToCSTR();
              __int16 v17 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v8, "syncGroupID"));
                *(_DWORD *)buf = v19;
                uint64_t v23 = v16;
                __int16 v24 = 2080;
                uint64_t v25 = "-[VCSessionParticipantRemote setupJBTargetSynchronizers]";
                __int16 v26 = 1024;
                int v27 = 2755;
                __int16 v28 = 2112;
                uint64_t v29 = v18;
                __int16 v30 = 2048;
                int v31 = (void *)cf;
                uint64_t v13 = v17;
                uint64_t v14 = "VCSessionParticipantRemote [%s] %s:%d New Target Synchronizer syncGroupID=%@ jbTargetEstimatorSynchronizer=%p";
                uint32_t v15 = 48;
LABEL_18:
                _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, v15);
              }
            }
          }
          else
          {
            char v9 = &stru_1F3D3E450;
            if (objc_opt_respondsToSelector()) {
              char v9 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v10 = VRTraceErrorLogLevelToCSTR();
              uint64_t v11 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v8, "syncGroupID"));
                *(_DWORD *)buf = 136316674;
                uint64_t v23 = v10;
                __int16 v24 = 2080;
                uint64_t v25 = "-[VCSessionParticipantRemote setupJBTargetSynchronizers]";
                __int16 v26 = 1024;
                int v27 = 2755;
                __int16 v28 = 2112;
                uint64_t v29 = (uint64_t)v9;
                __int16 v30 = 2048;
                int v31 = self;
                __int16 v32 = 2112;
                uint64_t v33 = v12;
                __int16 v34 = 2048;
                CFTypeRef v35 = cf;
                uint64_t v13 = v11;
                uint64_t v14 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) New Target Synchronizer syncGroupID=%@ jbTargetEstima"
                      "torSynchronizer=%p";
                uint32_t v15 = 68;
                goto LABEL_18;
              }
            }
          }
          if (cf) {
            CFRelease(cf);
          }
          continue;
        }
      }
      uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v37 objects:v36 count:16];
    }
    while (v5);
  }
}

- (BOOL)setupStreamGroups
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)[(VCSessionMediaNegotiator *)self->super._mediaNegotiator negotiatedStreamGroups] count])
  {
    [(VCSessionParticipantRemote *)self setupJBTargetSynchronizers];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v3 = [(VCSessionMediaNegotiator *)self->super._mediaNegotiator negotiatedStreamGroups];
    uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v35 objects:v34 count:16];
    if (v4)
    {
      uint64_t v6 = v4;
      uint64_t v7 = *(void *)v36;
      *(void *)&long long v5 = 136315650;
      long long v21 = v5;
      while (2)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v36 != v7) {
            objc_enumerationMutation(v3);
          }
          char v9 = *(void **)(*((void *)&v35 + 1) + 8 * v8);
          if (objc_msgSend(v9, "groupID", v21) == 1936290409
            && !+[VCHardwareSettings isSiriVoicePlayoutSupported])
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
            {
              uint64_t v10 = VRTraceErrorLogLevelToCSTR();
              uint64_t v11 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v21;
                uint64_t v23 = v10;
                __int16 v24 = 2080;
                uint64_t v25 = "-[VCSessionParticipantRemote setupStreamGroups]";
                __int16 v26 = 1024;
                int v27 = 2774;
                _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, "VCSessionParticipantRemote [%s] %s:%d Siri config was negotiated, but device does not support playout", buf, 0x1Cu);
              }
            }
          }
          else if (![(VCSessionParticipantRemote *)self setupStreamGroupWithConfig:v9])
          {
            if ((VCSessionParticipantRemote *)objc_opt_class() == self)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                VRTraceErrorLogLevelToCSTR();
                BOOL v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
                if (!v13) {
                  return v13;
                }
                -[VCSessionParticipantRemote setupStreamGroups]();
              }
            }
            else
            {
              if (objc_opt_respondsToSelector()) {
                uint64_t v16 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
              }
              else {
                uint64_t v16 = &stru_1F3D3E450;
              }
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                uint64_t v17 = VRTraceErrorLogLevelToCSTR();
                uint64_t v18 = *MEMORY[0x1E4F47A50];
                BOOL v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
                if (!v13) {
                  return v13;
                }
                long long v19 = FourccToCStr([v9 groupID]);
                *(_DWORD *)buf = 136316418;
                uint64_t v23 = v17;
                __int16 v24 = 2080;
                uint64_t v25 = "-[VCSessionParticipantRemote setupStreamGroups]";
                __int16 v26 = 1024;
                int v27 = 2778;
                __int16 v28 = 2112;
                uint64_t v29 = v16;
                __int16 v30 = 2048;
                int v31 = self;
                __int16 v32 = 2080;
                uint64_t v33 = v19;
                _os_log_error_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to setup stream group=%s", buf, 0x3Au);
              }
            }
            LOBYTE(v13) = 0;
            return v13;
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v12 = [(NSArray *)v3 countByEnumeratingWithState:&v35 objects:v34 count:16];
        uint64_t v6 = v12;
        if (v12) {
          continue;
        }
        break;
      }
    }
    LOBYTE(v13) = [(VCSessionParticipant *)self setupStreamGroupMediaSync];
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      uint32_t v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v23 = v14;
        __int16 v24 = 2080;
        uint64_t v25 = "-[VCSessionParticipantRemote setupStreamGroups]";
        __int16 v26 = 1024;
        int v27 = 2766;
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, "VCSessionParticipantRemote [%s] %s:%d There are no negotiated stream groups", buf, 0x1Cu);
      }
    }
    LOBYTE(v13) = 1;
  }
  return v13;
}

- (void)updateShouldEnableFaceZoom
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([+[VCDefaults sharedInstance] forceDisableFaceZoom])
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
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
          uint64_t v16 = "-[VCSessionParticipantRemote updateShouldEnableFaceZoom]";
          __int16 v17 = 1024;
          int v18 = 2788;
          uint64_t v8 = "VCSessionParticipantRemote [%s] %s:%d FaceZoom is disabled.";
          char v9 = v7;
          uint32_t v10 = 28;
LABEL_19:
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v3 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v3 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        uint64_t v12 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 136316162;
          uint64_t v14 = v11;
          __int16 v15 = 2080;
          uint64_t v16 = "-[VCSessionParticipantRemote updateShouldEnableFaceZoom]";
          __int16 v17 = 1024;
          int v18 = 2788;
          __int16 v19 = 2112;
          int v20 = v3;
          __int16 v21 = 2048;
          uint64_t v22 = self;
          uint64_t v8 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) FaceZoom is disabled.";
          char v9 = v12;
          uint32_t v10 = 48;
          goto LABEL_19;
        }
      }
    }
  }
  else
  {
    if (self->_videoQuality || ![(VCSessionParticipantRemote *)self isVisible])
    {
      uint64_t v4 = self;
      uint64_t v5 = 0;
    }
    else
    {
      uint64_t v4 = self;
      uint64_t v5 = 1;
    }
    [(VCSessionParticipantRemote *)v4 setShouldEnableFaceZoom:v5];
  }
}

- (void)setShouldEnableFaceZoom:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = objc_msgSend(-[VCSessionParticipantRemote videoGroup](self, "videoGroup"), "mediaStreamInfoArray");
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v9 count:16];
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
        objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8++), "stream"), "setShouldEnableFaceZoom:", v3);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v9 count:16];
    }
    while (v6);
  }
}

- (void)setSharingEnabled:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__VCSessionParticipantRemote_setSharingEnabled___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __48__VCSessionParticipantRemote_setSharingEnabled___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 409) = *(unsigned char *)(a1 + 40);
  return [*(id *)(a1 + 32) updateShouldEnableMLEnhance];
}

- (void)updateStreamConfigWithMLEnhance:(id)a3
{
  if (objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "isOneToOne"))
  {
    BOOL v5 = [(VCSessionParticipantRemote *)self shouldEnableMLEnhanceOneToOne];
  }
  else if ([a3 videoResolution])
  {
    if ([a3 videoResolution] == 16)
    {
      BOOL v5 = [(VCSessionParticipantRemote *)self shouldEnableMLEnhanceHighTier];
    }
    else
    {
      if ([a3 videoResolution] != 8 && objc_msgSend(a3, "videoResolution") != 11) {
        return;
      }
      BOOL v5 = [(VCSessionParticipantRemote *)self shouldEnableMLEnhanceMiddleTier];
    }
  }
  else
  {
    BOOL v5 = [(VCSessionParticipantRemote *)self shouldEnableMLEnhanceLowTier];
  }

  [a3 setShouldEnableMLEnhance:v5];
}

- (void)updateShouldEnableMLEnhance
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (+[VCDefaults BOOLeanValueForKey:@"forceDisableMLEnhance" defaultValue:0])
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v4 = VRTraceErrorLogLevelToCSTR();
        BOOL v5 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 136315650;
          uint64_t v12 = v4;
          __int16 v13 = 2080;
          uint64_t v14 = "-[VCSessionParticipantRemote updateShouldEnableMLEnhance]";
          __int16 v15 = 1024;
          int v16 = 2825;
          uint64_t v6 = "VCSessionParticipantRemote [%s] %s:%d ML Enhance is disabled by default.";
          uint64_t v7 = v5;
          uint32_t v8 = 28;
LABEL_15:
          _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v11, v8);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        BOOL v3 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
      }
      else {
        BOOL v3 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        long long v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 136316162;
          uint64_t v12 = v9;
          __int16 v13 = 2080;
          uint64_t v14 = "-[VCSessionParticipantRemote updateShouldEnableMLEnhance]";
          __int16 v15 = 1024;
          int v16 = 2825;
          __int16 v17 = 2112;
          int v18 = v3;
          __int16 v19 = 2048;
          int v20 = self;
          uint64_t v6 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) ML Enhance is disabled by default.";
          uint64_t v7 = v10;
          uint32_t v8 = 48;
          goto LABEL_15;
        }
      }
    }
  }
  else
  {
    [(VCSessionParticipantRemote *)self updateShouldEnableMLEnhanceLowTierMultiway];
    [(VCSessionParticipantRemote *)self updateShouldEnableMLEnhanceMiddleTierMultiway];
    [(VCSessionParticipantRemote *)self updateShouldEnableMLEnhanceHighTierMultiway];
    [(VCSessionParticipantRemote *)self updateShouldEnableMLEnhanceOneToOne];
  }
}

- (BOOL)shouldEnableMLEnhanceLowTier
{
  unsigned int thermalLevel = self->_thermalLevel;
  BOOL v4 = self->super._sharingEnabled
    && +[VCHardwareSettings disableMLScalarDuringSharing];
  int v5 = [(VCSessionParticipant *)self presentationState];
  if ((unint64_t)(+[VCHardwareSettings deviceClass] - 1) > 1) {
    LOBYTE(v6) = 0;
  }
  else {
    int v6 = ![(VCPositionalInfo *)self->_positionalInfo isInCanvas];
  }
  BOOL v7 = v5 == 1;
  char v8 = +[VCHardwareSettings isDeviceLargeScreen];
  char v9 = thermalLevel > 0x14 || v4;
  return (v9 | v6 | v7 & ~v8) ^ 1;
}

- (BOOL)shouldEnableMLEnhanceOneToOne
{
  return ![(VCSessionParticipantRemote *)self shouldDisableMLEnhanceCommonFactors];
}

- (BOOL)shouldDisableMLEnhanceCommonFactors
{
  unsigned int thermalLevel = self->_thermalLevel;
  BOOL v4 = self->super._sharingEnabled
    && +[VCHardwareSettings disableMLScalarDuringSharing];
  int v5 = [(VCSessionParticipant *)self presentationState];
  if (thermalLevel > 0x14) {
    return 1;
  }
  if (v5 == 1) {
    return 1;
  }
  return v4;
}

- (BOOL)shouldEnableMLEnhanceHighTier
{
  BOOL v3 = [(VCSessionParticipantRemote *)self shouldDisableMLEnhanceCommonFactors];
  int64_t v4 = +[VCHardwareSettings deviceClass];
  if (v4 == 4)
  {
    int v5 = 0;
    BOOL v6 = [(VCSessionParticipant *)self presentationState] == 3;
  }
  else
  {
    int64_t v7 = v4;
    BOOL v8 = +[VCHardwareSettings isAppleSilicon];
    BOOL v10 = v7 != 3 && v7 != 0;
    int v5 = !v8 || v10;
    BOOL v6 = 0;
  }
  unsigned int prominenceIndex = self->_prominenceIndex;
  unsigned int v12 = +[VCHardwareSettings maxHighTierMLEnhanceParticipants];
  if (((v3 | v5) & 1) != 0 || v6 || prominenceIndex >= v12) {
    return 0;
  }

  return VCDefaults_GetBoolValueForKey(@"mlEnhanceForHighQualityTierEnabled", 1);
}

- (BOOL)shouldEnableMLEnhanceMiddleTier
{
  BOOL v3 = [(VCSessionParticipantRemote *)self shouldDisableMLEnhanceCommonFactors];
  int64_t v4 = +[VCHardwareSettings deviceClass];
  if (v4 == 4)
  {
    BOOL v5 = 0;
    BOOL v6 = [(VCSessionParticipant *)self presentationState] == 3;
  }
  else
  {
    unint64_t v7 = v4;
    BOOL v8 = +[VCHardwareSettings isAppleSilicon];
    BOOL v9 = v7 >= 4 || (v7 & 0xF) == 2;
    if (v8) {
      BOOL v5 = v9;
    }
    else {
      BOOL v5 = v7 != 1;
    }
    BOOL v6 = 0;
  }
  unsigned int prominenceIndex = self->_prominenceIndex;
  unsigned int v11 = +[VCHardwareSettings maxHighTierMLEnhanceParticipants];
  BOOL result = 0;
  if (!v3 && !v6 && !v5 && prominenceIndex < v11) {
    return !self->_shouldDisableMiddleTierMLEnhance;
  }
  return result;
}

- (void)updateShouldEnableMLEnhanceLowTierMultiway
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(VCSessionParticipantRemote *)self shouldEnableMLEnhanceLowTier];
  id v4 = [(VCSessionParticipantRemote *)self videoGroup];
  BOOL v5 = [(VCSessionParticipantRemote *)self setShouldEnableMLEnhance:v3 streamWithVideoResolution:0 videoStreamGroup:v4];
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      BOOL v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136316418;
        uint64_t v15 = v7;
        __int16 v16 = 2080;
        __int16 v17 = "-[VCSessionParticipantRemote updateShouldEnableMLEnhanceLowTierMultiway]";
        __int16 v18 = 1024;
        int v19 = 2919;
        __int16 v20 = 1024;
        *(_DWORD *)uint64_t v21 = v3;
        *(_WORD *)&v21[4] = 2048;
        *(void *)&v21[6] = [v4 streamToken];
        *(_WORD *)&v21[14] = 1024;
        *(_DWORD *)&v21[16] = v5;
        BOOL v9 = "VCSessionParticipantRemote [%s] %s:%d ML Enhance for low tier (96x96) shouldEnableMLEnhance=%d streamToken="
             "%ld update didSucceed=%d";
        BOOL v10 = v8;
        uint32_t v11 = 50;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v14, v11);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      BOOL v6 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      BOOL v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      __int16 v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136316930;
        uint64_t v15 = v12;
        __int16 v16 = 2080;
        __int16 v17 = "-[VCSessionParticipantRemote updateShouldEnableMLEnhanceLowTierMultiway]";
        __int16 v18 = 1024;
        int v19 = 2919;
        __int16 v20 = 2112;
        *(void *)uint64_t v21 = v6;
        *(_WORD *)&v21[8] = 2048;
        *(void *)&v21[10] = self;
        *(_WORD *)&unsigned char v21[18] = 1024;
        BOOL v22 = v3;
        __int16 v23 = 2048;
        uint64_t v24 = [v4 streamToken];
        __int16 v25 = 1024;
        BOOL v26 = v5;
        BOOL v9 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) ML Enhance for low tier (96x96) shouldEnableMLEnhance=%d strea"
             "mToken=%ld update didSucceed=%d";
        BOOL v10 = v13;
        uint32_t v11 = 70;
        goto LABEL_11;
      }
    }
  }
}

- (void)updateShouldEnableMLEnhanceMiddleTierMultiway
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(VCSessionParticipantRemote *)self shouldEnableMLEnhanceMiddleTier];
  id v4 = [(VCSessionParticipantRemote *)self videoGroup];
  BOOL v5 = [(VCSessionParticipantRemote *)self setShouldEnableMLEnhance:v3 streamWithVideoResolution:8 videoStreamGroup:v4];
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      BOOL v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int16 v25 = 136316418;
        *(void *)&v25[4] = v7;
        *(_WORD *)&v25[12] = 2080;
        *(void *)&v25[14] = "-[VCSessionParticipantRemote updateShouldEnableMLEnhanceMiddleTierMultiway]";
        *(_WORD *)&v25[22] = 1024;
        *(_DWORD *)BOOL v26 = 2928;
        *(_WORD *)&v26[4] = 1024;
        *(_DWORD *)&v26[6] = v3;
        *(_WORD *)&v26[10] = 2048;
        *(void *)&v26[12] = [v4 streamToken];
        *(_WORD *)&v26[20] = 1024;
        *(_DWORD *)&v26[22] = v5;
        BOOL v9 = "VCSessionParticipantRemote [%s] %s:%d ML Enhance for Middle tier (320x320) shouldEnableMLEnhance=%d streamT"
             "oken=%ld update didSucceed=%d";
        BOOL v10 = v8;
        uint32_t v11 = 50;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, v25, v11);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      BOOL v6 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      BOOL v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      __int16 v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int16 v25 = 136316930;
        *(void *)&v25[4] = v12;
        *(_WORD *)&v25[12] = 2080;
        *(void *)&v25[14] = "-[VCSessionParticipantRemote updateShouldEnableMLEnhanceMiddleTierMultiway]";
        *(_WORD *)&v25[22] = 1024;
        *(_DWORD *)BOOL v26 = 2928;
        *(_WORD *)&v26[4] = 2112;
        *(void *)&v26[6] = v6;
        *(_WORD *)&v26[14] = 2048;
        *(void *)&v26[16] = self;
        *(_WORD *)&unsigned char v26[24] = 1024;
        *(_DWORD *)&v26[26] = v3;
        *(_WORD *)&v26[30] = 2048;
        uint64_t v27 = [v4 streamToken];
        LOWORD(v28) = 1024;
        *(_DWORD *)((char *)&v28 + 2) = v5;
        BOOL v9 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) ML Enhance for Middle tier (320x320) shouldEnableMLEnhance=%d "
             "streamToken=%ld update didSucceed=%d";
        BOOL v10 = v13;
        uint32_t v11 = 70;
        goto LABEL_11;
      }
    }
  }
  BOOL v14 = -[VCSessionParticipantRemote setShouldEnableMLEnhance:streamWithVideoResolution:videoStreamGroup:](self, "setShouldEnableMLEnhance:streamWithVideoResolution:videoStreamGroup:", v3, 11, v4, *(_OWORD *)v25, *(void *)&v25[16], *(_OWORD *)v26, *(_OWORD *)&v26[16], v27, v28);
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      __int16 v17 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = [v4 streamToken];
        *(_DWORD *)__int16 v25 = 136316418;
        *(void *)&v25[4] = v16;
        *(_WORD *)&v25[12] = 2080;
        *(void *)&v25[14] = "-[VCSessionParticipantRemote updateShouldEnableMLEnhanceMiddleTierMultiway]";
        *(_WORD *)&v25[22] = 1024;
        *(_DWORD *)BOOL v26 = 2932;
        *(_WORD *)&v26[4] = 1024;
        *(_DWORD *)&v26[6] = v3;
        *(_WORD *)&v26[10] = 2048;
        *(void *)&v26[12] = v18;
        *(_WORD *)&v26[20] = 1024;
        *(_DWORD *)&v26[22] = v14;
        int v19 = "VCSessionParticipantRemote [%s] %s:%d ML Enhance for Middle tier (480x480) shouldEnableMLEnhance=%d stream"
              "Token=%ld update didSucceed=%d";
        __int16 v20 = v17;
        uint32_t v21 = 50;
LABEL_22:
        _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, v19, v25, v21);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v15 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v15 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      __int16 v23 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = [v4 streamToken];
        *(_DWORD *)__int16 v25 = 136316930;
        *(void *)&v25[4] = v22;
        *(_WORD *)&v25[12] = 2080;
        *(void *)&v25[14] = "-[VCSessionParticipantRemote updateShouldEnableMLEnhanceMiddleTierMultiway]";
        *(_WORD *)&v25[22] = 1024;
        *(_DWORD *)BOOL v26 = 2932;
        *(_WORD *)&v26[4] = 2112;
        *(void *)&v26[6] = v15;
        *(_WORD *)&v26[14] = 2048;
        *(void *)&v26[16] = self;
        *(_WORD *)&unsigned char v26[24] = 1024;
        *(_DWORD *)&v26[26] = v3;
        *(_WORD *)&v26[30] = 2048;
        uint64_t v27 = v24;
        LOWORD(v28) = 1024;
        *(_DWORD *)((char *)&v28 + 2) = v14;
        int v19 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) ML Enhance for Middle tier (480x480) shouldEnableMLEnhance=%d"
              " streamToken=%ld update didSucceed=%d";
        __int16 v20 = v23;
        uint32_t v21 = 70;
        goto LABEL_22;
      }
    }
  }
}

- (void)updateShouldEnableMLEnhanceHighTierMultiway
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(VCSessionParticipantRemote *)self shouldEnableMLEnhanceHighTier];
  id v4 = [(VCSessionParticipantRemote *)self videoGroup];
  BOOL v5 = [(VCSessionParticipantRemote *)self setShouldEnableMLEnhance:v3 streamWithVideoResolution:16 videoStreamGroup:v4];
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      BOOL v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136316418;
        uint64_t v15 = v7;
        __int16 v16 = 2080;
        __int16 v17 = "-[VCSessionParticipantRemote updateShouldEnableMLEnhanceHighTierMultiway]";
        __int16 v18 = 1024;
        int v19 = 2941;
        __int16 v20 = 1024;
        *(_DWORD *)uint32_t v21 = v3;
        *(_WORD *)&v21[4] = 2048;
        *(void *)&v21[6] = [v4 streamToken];
        *(_WORD *)&v21[14] = 1024;
        *(_DWORD *)&v21[16] = v5;
        BOOL v9 = "VCSessionParticipantRemote [%s] %s:%d ML Enhance for high tier (720x720) shouldEnableMLEnhance=%d streamTok"
             "en=%ld update didSucceed=%d";
        BOOL v10 = v8;
        uint32_t v11 = 50;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v14, v11);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      BOOL v6 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
    }
    else {
      BOOL v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      __int16 v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136316930;
        uint64_t v15 = v12;
        __int16 v16 = 2080;
        __int16 v17 = "-[VCSessionParticipantRemote updateShouldEnableMLEnhanceHighTierMultiway]";
        __int16 v18 = 1024;
        int v19 = 2941;
        __int16 v20 = 2112;
        *(void *)uint32_t v21 = v6;
        *(_WORD *)&v21[8] = 2048;
        *(void *)&v21[10] = self;
        *(_WORD *)&unsigned char v21[18] = 1024;
        BOOL v22 = v3;
        __int16 v23 = 2048;
        uint64_t v24 = [v4 streamToken];
        __int16 v25 = 1024;
        BOOL v26 = v5;
        BOOL v9 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) ML Enhance for high tier (720x720) shouldEnableMLEnhance=%d st"
             "reamToken=%ld update didSucceed=%d";
        BOOL v10 = v13;
        uint32_t v11 = 70;
        goto LABEL_11;
      }
    }
  }
}

- (BOOL)setShouldEnableMLEnhance:(BOOL)a3 streamWithVideoResolution:(int64_t)a4 videoStreamGroup:(id)a5
{
  BOOL v7 = a3;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  [(VCSessionParticipantRemote *)self reportingResolutionForResolution:a4];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  BOOL v9 = (void *)[a5 mediaStreamInfoArray];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    id v24 = a5;
    BOOL v25 = v7;
    uint64_t v12 = *(void *)v33;
    uint64_t v23 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(v9);
        }
        int v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        uint64_t v15 = (void *)[v14 streamConfigs];
        uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v26 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v28;
          while (2)
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v28 != v18) {
                objc_enumerationMutation(v15);
              }
              __int16 v20 = *(void **)(*((void *)&v27 + 1) + 8 * j);
              if ([v20 videoResolution] == a4)
              {
                objc_msgSend(v24, "setShouldEnableMLEnhance:streamID:", v25, objc_msgSend((id)objc_msgSend(v20, "multiwayConfig"), "idsStreamID"));
                BOOL v21 = 1;
                goto LABEL_19;
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v26 count:16];
            if (v17) {
              continue;
            }
            break;
          }
        }
        uint64_t v12 = v23;
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v31 count:16];
      BOOL v21 = 0;
    }
    while (v11);
  }
  else
  {
    BOOL v21 = 0;
  }
LABEL_19:
  [(VCSessionParticipant *)self reportingAgent];
  reportingMLEnhance();
  return v21;
}

- (void)updateShouldEnableMLEnhanceOneToOne
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  BOOL v28 = [(VCSessionParticipantRemote *)self shouldEnableMLEnhanceOneToOne];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v27 = [(VCSessionParticipantRemote *)self videoGroup];
  id obj = (id)[v27 mediaStreamInfoArray];
  uint64_t v3 = [obj countByEnumeratingWithState:&v47 objects:v46 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v48;
    *(void *)&long long v4 = 136316162;
    long long v25 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v48 != v6) {
          objc_enumerationMutation(obj);
        }
        BOOL v8 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        BOOL v9 = objc_msgSend(v8, "streamConfigs", v25);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v42 objects:v41 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v43;
          while (2)
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v43 != v12) {
                objc_enumerationMutation(v9);
              }
              int v14 = *(void **)(*((void *)&v42 + 1) + 8 * j);
              if (objc_msgSend((id)objc_msgSend(v14, "multiwayConfig"), "isOneToOne"))
              {
                objc_msgSend(v27, "setShouldEnableMLEnhance:streamID:", v28, objc_msgSend((id)objc_msgSend(v14, "multiwayConfig"), "idsStreamID"));
                if ((VCSessionParticipantRemote *)objc_opt_class() == self)
                {
                  if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
                    goto LABEL_25;
                  }
                  uint64_t v22 = VRTraceErrorLogLevelToCSTR();
                  uint64_t v23 = *MEMORY[0x1E4F47A50];
                  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_25;
                  }
                  id v24 = FourccToCStr([v27 streamGroupID]);
                  *(_DWORD *)buf = v25;
                  uint64_t v30 = v22;
                  __int16 v31 = 2080;
                  long long v32 = "-[VCSessionParticipantRemote updateShouldEnableMLEnhanceOneToOne]";
                  __int16 v33 = 1024;
                  int v34 = 2969;
                  __int16 v35 = 1024;
                  *(_DWORD *)uint64_t v36 = v28;
                  *(_WORD *)&v36[4] = 2080;
                  *(void *)&unsigned char v36[6] = v24;
                  int v19 = v23;
                  __int16 v20 = "VCSessionParticipantRemote [%s] %s:%d ML Enhance updated for OneToOne shouldEnableMLEnhance=%d streamGroupID=%s";
                  uint32_t v21 = 44;
                }
                else
                {
                  uint64_t v15 = &stru_1F3D3E450;
                  if (objc_opt_respondsToSelector()) {
                    uint64_t v15 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
                  }
                  if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
                    goto LABEL_25;
                  }
                  uint64_t v16 = VRTraceErrorLogLevelToCSTR();
                  uint64_t v17 = *MEMORY[0x1E4F47A50];
                  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_25;
                  }
                  uint64_t v18 = FourccToCStr([v27 streamGroupID]);
                  *(_DWORD *)buf = 136316674;
                  uint64_t v30 = v16;
                  __int16 v31 = 2080;
                  long long v32 = "-[VCSessionParticipantRemote updateShouldEnableMLEnhanceOneToOne]";
                  __int16 v33 = 1024;
                  int v34 = 2969;
                  __int16 v35 = 2112;
                  *(void *)uint64_t v36 = v15;
                  *(_WORD *)&v36[8] = 2048;
                  *(void *)&v36[10] = self;
                  __int16 v37 = 1024;
                  BOOL v38 = v28;
                  __int16 v39 = 2080;
                  long long v40 = v18;
                  int v19 = v17;
                  __int16 v20 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) ML Enhance updated for OneToOne shouldEnableMLEnhan"
                        "ce=%d streamGroupID=%s";
                  uint32_t v21 = 64;
                }
                _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, v21);
                goto LABEL_25;
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v42 objects:v41 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }
LABEL_25:
        ;
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v47 objects:v46 count:16];
    }
    while (v5);
  }
  [(VCSessionParticipant *)self reportingAgent];
  reportingMLEnhance();
}

- (BOOL)isSeamlessTransitionSupportedForStreamGroup:(id)a3
{
  return (objc_opt_isKindOfClass() & 1) != 0 && [a3 streamGroupID] != 1667329399;
}

- (void)createAndResumeFetchTimer
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to allocate fetch timer dispatch source!", v2, v3, v4, v5, v6);
}

uint64_t __55__VCSessionParticipantRemote_createAndResumeFetchTimer__block_invoke(uint64_t a1)
{
  v3[5] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__VCSessionParticipantRemote_createAndResumeFetchTimer__block_invoke_2;
  v3[3] = &unk_1E6DB69A0;
  v3[4] = v1;
  return [v1 callDelegateWithBlock:v3];
}

uint64_t __55__VCSessionParticipantRemote_createAndResumeFetchTimer__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint8_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)int v14 = 136315650;
        *(void *)&v14[4] = v5;
        *(_WORD *)&v14[12] = 2080;
        *(void *)&v14[14] = "-[VCSessionParticipantRemote createAndResumeFetchTimer]_block_invoke_2";
        *(_WORD *)&v14[22] = 1024;
        LODWORD(v15) = 2994;
        BOOL v7 = "VCSessionParticipantRemote [%s] %s:%d Fetching stream group state update";
        BOOL v8 = v6;
        uint32_t v9 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, v14, v9);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v4 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      uint64_t v4 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        *(_DWORD *)int v14 = 136316162;
        *(void *)&v14[4] = v10;
        *(_WORD *)&v14[12] = 2080;
        *(void *)&v14[14] = "-[VCSessionParticipantRemote createAndResumeFetchTimer]_block_invoke";
        *(_WORD *)&v14[22] = 1024;
        LODWORD(v15) = 2994;
        WORD2(v15) = 2112;
        *(void *)((char *)&v15 + 6) = v4;
        HIWORD(v15) = 2048;
        uint64_t v16 = v12;
        BOOL v7 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Fetching stream group state update";
        BOOL v8 = v11;
        uint32_t v9 = 48;
        goto LABEL_11;
      }
    }
  }
  return objc_msgSend(a2, "vcSessionParticipantFetchStreamGroupState:", *(void *)(a1 + 32), *(_OWORD *)v14, *(void *)&v14[16], v15, v16);
}

void __55__VCSessionParticipantRemote_createAndResumeFetchTimer__block_invoke_167(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 728);
  if (v2)
  {
    dispatch_release(v2);
    *(void *)(*(void *)(a1 + 32) + 728) = 0;
  }
}

- (void)cancelAndReleaseFetchTimer
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_remoteStreamGroupStateUpdateTimer)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_13;
      }
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      int v11 = 136315650;
      uint64_t v12 = v4;
      __int16 v13 = 2080;
      int v14 = "-[VCSessionParticipantRemote cancelAndReleaseFetchTimer]";
      __int16 v15 = 1024;
      int v16 = 3009;
      uint8_t v6 = "VCSessionParticipantRemote [%s] %s:%d Cancel stream group state update timer";
      BOOL v7 = v5;
      uint32_t v8 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v3 = (__CFString *)[(VCSessionParticipantRemote *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v3 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_13;
      }
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      int v11 = 136316162;
      uint64_t v12 = v9;
      __int16 v13 = 2080;
      int v14 = "-[VCSessionParticipantRemote cancelAndReleaseFetchTimer]";
      __int16 v15 = 1024;
      int v16 = 3009;
      __int16 v17 = 2112;
      uint64_t v18 = v3;
      __int16 v19 = 2048;
      __int16 v20 = self;
      uint8_t v6 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Cancel stream group state update timer";
      BOOL v7 = v10;
      uint32_t v8 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v11, v8);
LABEL_13:
    dispatch_source_cancel((dispatch_source_t)self->_remoteStreamGroupStateUpdateTimer);
  }
}

- (void)updateAndHandleVideoMediaStall:(BOOL)a3 isOneToOneStream:(BOOL)a4
{
  BOOL v4 = a4;
  int v5 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  BOOL isVideoExpected = self->_isVideoExpected;
  if (isVideoExpected != [(VCSessionParticipantRemote *)self isVideoExpected])
  {
    self->_BOOL isVideoExpected = [(VCSessionParticipantRemote *)self isVideoExpected];
    self->_double lastVideoExpectationSwitch = micro();
  }
  int isRemoteMediaStalled = self->_isRemoteMediaStalled;
  if ((v5 & 1) == 0 && self->_isRemoteMediaStalled)
  {
    if (!self->_isVideoExpected) {
      goto LABEL_17;
    }
    int isRemoteMediaStalled = 1;
  }
  if (isRemoteMediaStalled == v5) {
    return;
  }
  if (!self->_isVideoExpected || !v4) {
    return;
  }
  if (!v5)
  {
LABEL_17:
    [(VCSessionParticipantRemote *)self setVideoDegraded:0];
    int v11 = self;
    uint64_t v12 = 0;
    goto LABEL_18;
  }
  double v10 = micro();
  if (v10 - self->_lastVideoExpectationSwitch > 10.0)
  {
    [(VCSessionParticipantRemote *)self setVideoDegraded:1];
    int v11 = self;
    uint64_t v12 = 1;
LABEL_18:
    [(VCSessionParticipantRemote *)v11 setRemoteMediaStalled:v12];
    return;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    int v14 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      double lastVideoExpectationSwitch = self->_lastVideoExpectationSwitch;
      int v16 = 136316418;
      uint64_t v17 = v13;
      __int16 v18 = 2080;
      __int16 v19 = "-[VCSessionParticipantRemote updateAndHandleVideoMediaStall:isOneToOneStream:]";
      __int16 v20 = 1024;
      int v21 = 3037;
      __int16 v22 = 2048;
      double v23 = v10;
      __int16 v24 = 2048;
      double v25 = lastVideoExpectationSwitch;
      __int16 v26 = 2048;
      double v27 = v10 - lastVideoExpectationSwitch;
      _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, "VCSessionParticipantRemote [%s] %s:%d We are experiencing a video stall too soon after we switch video on. Ignoring... currentTime=%f lastVideoExpectationSwitch=%f diff=%f", (uint8_t *)&v16, 0x3Au);
    }
  }
}

- (void)reportCameraCompositionEnabled:(BOOL)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = @"VCSPUUID";
  v5[0] = self->super._uuid;
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [(VCSessionParticipant *)self reportingAgent];
  reportingGenericEvent();
}

- (int)reportingResolutionForResolution:(int64_t)a3
{
  if ((unint64_t)a3 < 0x1C)
  {
    if (a3 == 27) {
      return 28;
    }
    else {
      return a3;
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionParticipantRemote reportingResolutionForResolution:]();
      }
    }
    return 28;
  }
}

- (BOOL)isRemoteVideoEnabled
{
  return self->_remoteVideoEnabled;
}

- (unsigned)videoQuality
{
  return self->_videoQuality;
}

- (unsigned)visibilityIndex
{
  return self->_visibilityIndex;
}

- (unsigned)prominenceIndex
{
  return self->_prominenceIndex;
}

- (BOOL)isRemoteVideoPaused
{
  return self->_remoteVideoPaused;
}

- (BOOL)isRemoteScreenEnabled
{
  return self->_remoteScreenEnabled;
}

- (void)setCapabilities:(_VCSessionParticipantCapabilities)a3
{
  self->_capabilities = a3;
}

- (VCPositionalInfo)positionalInfo
{
  return self->_positionalInfo;
}

- (BOOL)isScreenControlEnabled
{
  return self->_screenControlEnabled;
}

- (BOOL)enableMaxCameraBitrateVideoQualityNewTier
{
  return self->_enableMaxCameraBitrateVideoQualityNewTier;
}

- (void)setEnableMaxCameraBitrateVideoQualityNewTier:(BOOL)a3
{
  self->_enableMaxCameraBitrateVideoQualityNewTier = a3;
}

- (BOOL)isRemoteAudioEnabled
{
  return self->_remoteAudioEnabled;
}

- (BOOL)isRemoteAudioPaused
{
  return self->_remoteAudioPaused;
}

- (BOOL)isServerRTxEnabled
{
  return self->_isServerRTxEnabled;
}

- (void)setIsServerRTxEnabled:(BOOL)a3
{
  self->_BOOL isServerRTxEnabled = a3;
}

- (void)initWithConfig:delegate:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed jitter target synchronizer  dictionary!", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:delegate:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to allocate positional info!", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:delegate:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to copy local configuration!", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:delegate:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Nil remote participant data!", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:delegate:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to deserialize remote participant data!", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:delegate:.cold.6()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCSessionParticipantRemote initWithConfig:delegate:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to setup spatial audio! result=%08x", v2, *(const char **)v3, (unint64_t)"-[VCSessionParticipantRemote initWithConfig:delegate:]" >> 16, v4);
}

- (void)initWithConfig:delegate:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to setup stream groups", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:delegate:.cold.8()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to process participant info!", v2, v3, v4, v5, v6);
}

- (void)setupSpatialAudioWithMetadata:spatialMetadataEntryMap:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to allocate channel index map", v2, v3, v4, v5, v6);
}

- (void)setupSpatialAudioWithMetadata:spatialMetadataEntryMap:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCSessionParticipantRemote setupSpatialAudioWithMetadata:spatialMetadataEntryMap:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to allocate spatial metadata entry. status=%08x", v2, *(const char **)v3, (unint64_t)"-[VCSessionParticipantRemote setupSpatialAudioWithMetadata:spatialMetadataEntryMap:]" >> 16, v4);
}

- (void)setupSpatialAudioWithMetadata:spatialMetadataEntryMap:.cold.3()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCSessionParticipantRemote setupSpatialAudioWithMetadata:spatialMetadataEntryMap:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to retrieve the channel index. status=%08x", v2, *(const char **)v3, (unint64_t)"-[VCSessionParticipantRemote setupSpatialAudioWithMetadata:spatialMetadataEntryMap:]" >> 16, v4);
}

- (void)setupSpatialAudioWithMetadata:spatialMetadataEntryMap:.cold.4()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCSessionParticipantRemote setupSpatialAudioWithMetadata:spatialMetadataEntryMap:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to store metadata entry for VCSessionMediaTypeMicrophone. status=%08x", v2, *(const char **)v3, (unint64_t)"-[VCSessionParticipantRemote setupSpatialAudioWithMetadata:spatialMetadataEntryMap:]" >> 16, v4);
}

- (void)spatialMetadataEntryForMediaType:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to allocate media type key", v2, v3, v4, v5, v6);
}

- (void)storeSpatialAudioMetadataEntry:forMediaType:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to allocate media type key", v2, v3, v4, v5, v6);
}

- (void)participantSpatialAudioSourceIDs
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to get spatial audio source IDs", v2, v3, v4, v5, v6);
}

- (void)setTransitionToEnabled:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  VCSessionMediaType_Name(v0);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, "VCSessionParticipantRemote [%s] %s:%d Failed to update mediaState=enabled for mediaType=%@", v3, v4, v5, v6, v7);
}

- (void)setTransitionToPaused:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Screen pause state is not supported", v2, v3, v4, v5, v6);
}

- (void)setTransitionToPaused:.cold.2()
{
  OUTLINED_FUNCTION_11_0();
  VCSessionMediaType_Name(v0);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, "VCSessionParticipantRemote [%s] %s:%d Failed to update mediaState=paused for mediaType=%@", v3, v4, v5, v6, v7);
}

- (void)setTransitionToDisabled:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  VCSessionMediaType_Name(v0);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, "VCSessionParticipantRemote [%s] %s:%d Failed to update mediaState=disabled for mediaType=%@", v3, v4, v5, v6, v7);
}

- (void)updateMediaState:forStreamGroup:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  VCSessionMediaType_Name([v0 mediaType]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, "VCSessionParticipantRemote [%s] %s:%d Failed to update mediaState=disabled for mediaType=%@", v3, v4, v5, v6, v7);
}

- (void)applyVideoEnabledSetting:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCSessionParticipantRemote applyVideoEnabledSetting:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to update stream group with videoEnabled=%d", v2, *(const char **)v3, (unint64_t)"-[VCSessionParticipantRemote applyVideoEnabledSetting:]" >> 16, v4);
}

- (void)processParticipantInfo
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Media negotiation failed", v2, v3, v4, v5, v6);
}

- (void)getMajorVersionNumber
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to get number from string", v2, v3, v4, v5, v6);
}

- (void)setupAudioStreamConfiguration:withStreamGroupConfig:streamGroupStreamConfig:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d No codec configurations for stream configuration!", v2, v3, v4, v5, v6);
}

- (void)setupBandwidthAllocationTableForMediaStreamConfigs:streamGroupID:entryType:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to allocate allocator entry!", v2, v3, v4, v5, v6);
}

- (void)entryForStreamID:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d No media entry found for stream ID: %@");
}

void __83__VCSessionParticipantRemote_configureWithOneToOneParticipantConfig_operatingMode___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Fail configure participant", v2, v3, v4, v5, v6);
}

- (void)setStreamGroup:syncSourceStreamGroupID:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  FourccToCStr(v0);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, "VCSessionParticipantRemote [%s] %s:%d Unable to sync the screen stream group with streamGroupID=%s", v3, v4, v5, v6, v7);
}

- (void)pushEventToNwActivity:started:.cold.1()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v4 = "-[VCSessionParticipantRemote pushEventToNwActivity:started:]";
  OUTLINED_FUNCTION_3();
  int v5 = 1785;
  __int16 v6 = v0;
  int v7 = v1;
  _os_log_debug_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_DEBUG, "VCSessionParticipantRemote [%s] %s:%d Invalid NW activity label:%d", v3, 0x22u);
}

- (void)pushEventToNwActivity:started:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to create event nwActivity", v2, v3, v4, v5, v6);
}

- (void)isVideoExpected
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v2 = v1[374];
  int v3 = v1[544];
  int v4 = v1[377];
  int v5 = v1[546];
  [v1 isVisible];
  OUTLINED_FUNCTION_7_1();
  uint64_t v9 = "-[VCSessionParticipantRemote isVideoExpected]";
  OUTLINED_FUNCTION_3();
  int v10 = 2137;
  __int16 v11 = v6;
  int v12 = v2;
  __int16 v13 = v6;
  int v14 = v3;
  __int16 v15 = v6;
  int v16 = v4;
  __int16 v17 = v6;
  int v18 = v5;
  __int16 v19 = v6;
  int v20 = v7;
  _os_log_debug_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_DEBUG, "VCSessionParticipantRemote [%s] %s:%d videoEnabled:%d remoteVideoEnabled:%d videoPaused:%d remoteVideoPaused:%d isVisible:%d", v8, 0x3Au);
}

- (void)newMultiwayConfigWithStreamGroupStreamConfig:maxIDSStreamIDCount:groupID:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Unable to allocate multiway config", v2, v3, v4, v5, v6);
}

- (void)setupVideoStreamConfiguration:withStreamGroupStreamConfig:codecConfigs:multiwayConfig:groupID:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to create featureStringsDict", v2, v3, v4, v5, v6);
}

- (void)setupVideoStreamConfiguration:withStreamGroupStreamConfig:codecConfigs:multiwayConfig:groupID:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d setupStreamConfigWithCodecs failed", v2, v3, v4, v5, v6);
}

- (void)newMediaStreamConfigWithStreamGroupConfig:streamConfig:rateControlConfig:multiwayConfig:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to allocate stream configuration!", v2, v3, v4, v5, v6);
}

- (void)newMediaStreamConfigWithStreamGroupConfig:streamConfig:rateControlConfig:multiwayConfig:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Stream setup failed", v2, v3, v4, v5, v6);
}

- (void)newMediaStreamConfigWithStreamGroupConfig:streamConfig:rateControlConfig:multiwayConfig:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d cipher suite setup failed", v2, v3, v4, v5, v6);
}

- (void)newMediaStreamConfigWithStreamGroupConfig:streamConfig:rateControlConfig:multiwayConfig:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to setup the video stream config", v2, v3, v4, v5, v6);
}

- (void)newMediaStreamConfigWithStreamGroupConfig:streamConfig:rateControlConfig:multiwayConfig:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to allocate stream configuration!", v2, v3, v4, v5, v6);
}

- (void)newMediaStreamConfigWithStreamGroupConfig:streamConfig:rateControlConfig:multiwayConfig:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to setup the audio stream config", v2, v3, v4, v5, v6);
}

- (void)newMediaStreamConfigWithStreamConfig:streamGroupConfig:maxIDSStreamIDCount:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Unable to allocate rate control config", v2, v3, v4, v5, v6);
}

- (void)newMediaStreamConfigWithStreamConfig:streamGroupConfig:maxIDSStreamIDCount:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Unable to allocate multiway config", v2, v3, v4, v5, v6);
}

- (void)newMediaStreamConfigWithStreamConfig:streamGroupConfig:maxIDSStreamIDCount:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to allocate stream configuration!", v2, v3, v4, v5, v6);
}

- (void)newMediaStreamInfoWithNegotiationConfig:streamToken:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to create media stream info", v2, v3, v4, v5, v6);
}

- (void)newMediaStreamInfoWithNegotiationConfig:streamToken:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to create media stream", v2, v3, v4, v5, v6);
}

- (void)newMediaStreamInfoWithNegotiationConfig:streamToken:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d invalid capabilies dictionary for media stream!", v2, v3, v4, v5, v6);
}

- (void)newMediaStreamInfoWithNegotiationConfig:streamToken:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to create media stream config", v2, v3, v4, v5, v6);
}

- (void)newMediaStreamInfoWithNegotiationConfig:streamToken:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d maxIDSStreamIDCount is beyond max allowed", v2, v3, v4, v5, v6);
}

- (void)setupSpatialInfoForStreamGroupConfig:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [v1 count];
  OUTLINED_FUNCTION_7_1();
  uint64_t v5 = "-[VCSessionParticipantRemote setupSpatialInfoForStreamGroupConfig:]";
  OUTLINED_FUNCTION_3();
  int v6 = 2488;
  __int16 v7 = 2048;
  uint64_t v8 = v2;
  __int16 v9 = v3;
  int v10 = 0;
  _os_log_error_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d Unexpected number of media types. Count=%lu. status=%08x", v4, 0x2Cu);
}

- (void)newStreamGroupConfigWithNegotiationConfig:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to create stream group config", v2, v3, v4, v5, v6);
}

- (void)newStreamGroupConfigWithNegotiationConfig:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCSessionParticipantRemote newStreamGroupConfigWithNegotiationConfig:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed configure stream group config spatial info. status=%08x", v2, *(const char **)v3, (unint64_t)"-[VCSessionParticipantRemote newStreamGroupConfigWithNegotiationConfig:]" >> 16, v4);
}

- (void)newStreamGroupConfigWithNegotiationConfig:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to create media stream info", v2, v3, v4, v5, v6);
}

- (void)newStreamGroupConfigWithNegotiationConfig:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to create stream group config", v2, v3, v4, v5, v6);
}

- (void)addOneToOneStreamConfigToMediaStreamInfo:negotiatorStreamGroupConfig:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  FourccToCStr([v0 groupID]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, "VCSessionParticipantRemote [%s] %s:%d One to one groupID=%s stream configuration not available", v3, v4, v5, v6, v7);
}

- (void)addOneToOneStreamConfigToMediaStreamInfo:negotiatorStreamGroupConfig:.cold.2()
{
  OUTLINED_FUNCTION_11_0();
  FourccToCStr(v0);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, "VCSessionParticipantRemote [%s] %s:%d One to one audio streams not supported for groupID=%s", v3, v4, v5, v6, v7);
}

- (void)setupStreamGroupWithConfig:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to create stream group config", v2, v3, v4, v5, v6);
}

- (void)setupStreamGroupWithConfig:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to create receive media group", v2, v3, v4, v5, v6);
}

- (void)setupStreamGroupWithConfig:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to setup bandwidth allocation table for video!", v2, v3, v4, v5, v6);
}

- (void)setupStreamGroupWithConfig:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to create receive media group", v2, v3, v4, v5, v6);
}

- (void)setupStreamGroupWithConfig:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to create receive media group", v2, v3, v4, v5, v6);
}

- (void)newVideoStreamGroupWithStreamGroupConfig:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to create video receive stream group", v2, v3, v4, v5, v6);
}

- (void)newCaptionsStreamGroupWithStreamGroupConfig:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to create captions receive stream group", v2, v3, v4, v5, v6);
}

- (void)createJitterBufferTargetEstimatorSynchronizer:syncGroupID:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCSessionParticipantRemote createJitterBufferTargetEstimatorSynchronizer:syncGroupID:]";
  OUTLINED_FUNCTION_3();
  LODWORD(v4) = 2743;
  WORD2(v4) = 2048;
  HIWORD(v4) = v0;
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to create Jitter Buffer Target Synchronizer remoteParticipant=%p", v2, *(const char **)v3, (unint64_t)"-[VCSessionParticipantRemote createJitterBufferTargetEstimatorSynchronizer:syncGroupID:]" >> 16, v4);
}

- (void)setupStreamGroups
{
  OUTLINED_FUNCTION_11_0();
  FourccToCStr([v0 groupID]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, "VCSessionParticipantRemote [%s] %s:%d Failed to setup stream group=%s", v3, v4, v5, v6, v7);
}

- (void)reportingResolutionForResolution:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCSessionParticipantRemote reportingResolutionForResolution:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Invalid resolution: %d", v2, *(const char **)v3, (unint64_t)"-[VCSessionParticipantRemote reportingResolutionForResolution:]" >> 16, 3055);
}

@end