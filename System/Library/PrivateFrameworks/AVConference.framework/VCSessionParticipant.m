@interface VCSessionParticipant
+ (id)mediaTypesFromStreamGroupID:(unsigned int)a3;
+ (id)participantDataWithMediaNegotiatorVersion:(int)a3 participantData:(id)a4;
+ (id)participantDataWithParticipantData:(id)a3 isReinit:(BOOL)a4;
+ (id)participantDataWithParticipantInfo:(id)a3;
+ (id)participantInfoWithParticipantData:(id)a3;
+ (id)streamGroupIDsFromParticipantData:(id)a3;
+ (unsigned)mediaStreamGroupStateToVCStreamGroupState:(unsigned int)a3;
+ (void)addCodecModesForPayload:(int)a3 toCodecConfig:(id)a4;
+ (void)applyVideoNegotiatedSettings:(id)a3 toStreamConfiguration:(id)a4 withFeatureStringDictionary:(id)a5;
- (AVCBasebandCongestionDetector)basebandCongestionDetector;
- (AVCStatisticsCollector)statisticsCollector;
- (BOOL)completeStreamSetup:(id)a3 rtpCipherSuite:(int64_t)a4;
- (BOOL)configureAudioIOWithDeviceRole:(int)a3 operatingMode:(int)a4;
- (BOOL)configureMultiwayStreamGroups;
- (BOOL)configureOneToOneAudioStreamsWithDeviceRole:(int)a3;
- (BOOL)configureOneToOneAudioStreamsWithDeviceRole:(int)a3 streamInfoArray:(id)a4;
- (BOOL)configureOneToOneVideoStreamsWithDeviceRole:(int)a3;
- (BOOL)configureOneToOneVideoStreamsWithDeviceRole:(int)a3 streamInfoArray:(id)a4;
- (BOOL)configureOneToOneWithConfig:(id)a3;
- (BOOL)configureStreamInfosForMultiway:(id)a3 streamGroupID:(unsigned int)a4;
- (BOOL)configureWithDeviceRole:(int)a3 negotiatedVideoEnabled:(BOOL)a4 negotiatedScreenEnabled:(BOOL)a5 operatingMode:(int)a6;
- (BOOL)didNegotiateStreamGroupWithID:(unsigned int)a3;
- (BOOL)dispatchedConfigureWithDeviceRole:(int)a3 negotiatedVideoEnabled:(BOOL)a4 negotiatedScreenEnabled:(BOOL)a5 operatingMode:(int)a6;
- (BOOL)dispatchedIsAnyCameraMediaTypeEnabled;
- (BOOL)dispatchedIsPersonaCameraEnabled;
- (BOOL)handleEncryptionInfoChange:(id)a3;
- (BOOL)isActiveMediaType:(unsigned int)a3;
- (BOOL)isAnyCameraMediaTypeEnabled;
- (BOOL)isAudioEnabled;
- (BOOL)isAudioPaused;
- (BOOL)isAudioStream:(id)a3;
- (BOOL)isEnabledMediaType:(unsigned int)a3;
- (BOOL)isLocalOnWiFi;
- (BOOL)isMuted;
- (BOOL)isOneToOneModeEnabled;
- (BOOL)isOneToOneTemporalSupportedForSettings:(id)a3 streamDirection:(int64_t)a4;
- (BOOL)isParticipantIDBasedKeyLookupEnabled;
- (BOOL)isPersonaCameraEnabled;
- (BOOL)isScreenEnabled;
- (BOOL)isStreamGroupActive:(id)a3;
- (BOOL)isVideoEnabled;
- (BOOL)isVideoPaused;
- (BOOL)isVideoStream:(id)a3;
- (BOOL)rtcpPSFBForFeedbackStoreBagConfig;
- (BOOL)rtcpPSFBForLTRAckStoreBagConfig;
- (BOOL)setAudioPosition:(float)a3;
- (BOOL)setState:(unsigned int)a3;
- (BOOL)setVolume:(float)a3;
- (BOOL)setupAudioStreamConfiguration:(id)a3 audioRules:(id)a4;
- (BOOL)setupMediaSyncForStreamGroup:(id)a3;
- (BOOL)setupSecurityKeyHolderForStreamConfig:(id)a3;
- (BOOL)setupStreamGroupMediaSync;
- (BOOL)sharingEnabled;
- (BOOL)shouldSetPause:(BOOL)a3 onStream:(id)a4;
- (BOOL)supportsLowLatencyAudio;
- (BOOL)updateConfigurationWithDeviceRole:(int)a3;
- (BOOL)updateMediaStatesWithConfig:(id)a3;
- (NSArray)allParticipantStreamInfo;
- (NSData)opaqueData;
- (NSDictionary)mediaTypeMixingList;
- (NSDictionary)participantStreamTokens;
- (NSString)description;
- (NSString)uuid;
- (VCAudioCaptionsCoordinator)captionsCoordinator;
- (VCAudioRuleCollection)supportedAudioRules;
- (VCCallInfoBlob)callInfoBlob;
- (VCMediaRecorder)mediaRecorder;
- (VCSessionMediaNegotiator)mediaNegotiator;
- (VCSessionParticipant)initWithConfig:(id)a3 delegate:(id)a4;
- (VCSessionParticipantDelegate)delegate;
- (VCSessionParticipantOneToOneConfig)oneToOneConfig;
- (VCSessionParticipantStreamDelegate)streamDelegate;
- (char)participantStateToString:(unsigned int)a3;
- (float)audioPosition;
- (float)volume;
- (id)applyMediaState:(unsigned int)a3 forMediaType:(unsigned int)a4;
- (id)applyVideoEnabledSetting:(BOOL)a3;
- (id)cameraGroups;
- (id)cameraGroupsExt;
- (id)captionsGroup;
- (id)completeMediaStateChange;
- (id)generateEncryptionKey;
- (id)getAudioDumpName;
- (id)microphoneGroup;
- (id)newAudioRateControlConfigWithMediaControlInfoVersion:(unsigned __int8)a3 enableFeedbackController:(BOOL)a4 isOneToOne:(BOOL)a5;
- (id)newOneToOneAudioStreamConfigWithAudioSettings:(id)a3 streamDirection:(int64_t)a4 streamGroupId:(unsigned int)a5 streamSsrc:(unsigned int)a6;
- (id)newOneToOneVideoStreamConfigWithStreamDirection:(int64_t)a3 streamGroupId:(unsigned int)a4 streamSsrc:(unsigned int)a5 encodingType:(unsigned __int8)a6 videoSettings:(id)a7;
- (id)newOneToOneVideoStreamMultiwayConfiguration:(unsigned __int8)a3 streamGroupId:(unsigned int)a4 videoSettings:(id)a5 streamDirection:(int64_t)a6;
- (id)newVideoRateControlConfigWithMediaControlInfoVersion:(unsigned __int8)a3 enableMediaControlInfoGenerator:(BOOL)a4 enableFeedbackController:(BOOL)a5 isOneToOne:(BOOL)a6;
- (id)pauseAudioStreams:(BOOL)a3;
- (id)screenGroup;
- (id)setAudioStreamGroupsPaused:(BOOL)a3;
- (id)setCameraStreamGroupsPaused:(BOOL)a3;
- (id)setPaused:(BOOL)a3 onStreamGroups:(id)a4;
- (id)startAudioIO;
- (id)startCameraStreamGroups;
- (id)startMediaStreams:(id)a3;
- (id)startMicStreamGroups;
- (id)startScreenGroup;
- (id)startStreamGroups;
- (id)startStreamGroups:(id)a3;
- (id)stopAudioIO;
- (id)stopAudioStreams;
- (id)stopMediaStreams:(id)a3;
- (id)stopMicStreamGroups;
- (id)stopMultiwayStreams;
- (id)stopScreenGroup;
- (id)stopStreamGroups:(id)a3;
- (id)streamGroupWithID:(unsigned int)a3;
- (id)streamGroupsForIDs:(id)a3;
- (id)streamGroupsForMediaType:(unsigned int)a3;
- (id)systemAudioGroup;
- (id)updateActiveStateForStreamGroup:(id)a3;
- (id)updateMediaState:(unsigned int)a3 forStreamGroups:(id)a4;
- (id)updateStreamGroups:(id)a3;
- (int)captureSourceIDFromStreamGroupID:(unsigned int)a3;
- (int)operatingMode;
- (int)securityKeyHolderUsageForStreamConfigDirection:(int64_t)a3;
- (int64_t)negotiatedCipherSuiteForStreamGroupID:(unsigned int)a3;
- (int64_t)participantMicrophoneToken;
- (int64_t)participantScreenToken;
- (int64_t)participantVideoToken;
- (opaqueRTCReporting)reportingAgent;
- (tagNTP)creationTime;
- (tagVCMediaQueue)mediaQueue;
- (unint64_t)idsParticipantID;
- (unsigned)cellularUniqueTag;
- (unsigned)mediaControlVersionForStreamGroup:(unsigned int)a3;
- (unsigned)preferredIOSampleRateForGroupID:(unsigned int)a3;
- (unsigned)preferredIOSamplesPerFrameForGroupID:(unsigned int)a3;
- (unsigned)preferredRTPTimestampRateForGroupID:(unsigned int)a3;
- (unsigned)presentationState;
- (unsigned)streamGroupStateFromStreamGroupID:(unsigned int)a3;
- (void)applyScreenEnabledSetting:(BOOL)a3;
- (void)audioPowerSpectrumSinkDidRegister;
- (void)audioPowerSpectrumSinkDidUnregister;
- (void)callDelegateWithBlock:(id)a3;
- (void)callStreamDelegateWithBlock:(id)a3;
- (void)collectAudioChannelMetrics:(id *)a3;
- (void)collectCaptionsChannelMetrics:(id *)a3;
- (void)collectVideoChannelMetrics:(id *)a3;
- (void)configureMultiwayStreamGroups;
- (void)configureOneToOneVideoSendingConfigs:(id)a3 streamGroupID:(unsigned int)a4;
- (void)createRedundancyControllers;
- (void)dealloc;
- (void)didChangeActualNetworkBitrateForStreamGroup:(id)a3;
- (void)didChangeReceivingStreamsForStreamGroup:(id)a3;
- (void)didChangeSendingStreamsForStreamGroup:(id)a3;
- (void)didDecryptionTimeOutForMKMRecoveryForStreamGroup:(id)a3;
- (void)didMediaDecryptionTimeOutForStreamGroup:(id)a3;
- (void)didUpdateBasebandCodec:(const _VCRemoteCodecInfo *)a3;
- (void)dispatchSetMediaType:(unsigned int)a3 mixingWithMediaType:(unsigned int)a4;
- (void)dispatchedSetAudioEnabled:(BOOL)a3;
- (void)dispatchedSetAudioPaused:(BOOL)a3;
- (void)dispatchedSetMediaState:(unsigned int)a3 forMediaType:(unsigned int)a4;
- (void)dispatchedSetScreenEnabled:(BOOL)a3;
- (void)dispatchedSetVideoEnabled:(BOOL)a3;
- (void)dispatchedSetVideoPaused:(BOOL)a3;
- (void)dispatchedStart;
- (void)dispatchedStartOneToOneStreams;
- (void)dispatchedStop;
- (void)handleActiveConnectionChange:(id)a3;
- (void)handleRemoteOneToOneSwitchWithStreamGroup:(id)a3 fromStreamID:(unsigned __int16)a4 toStreamID:(unsigned __int16)a5;
- (void)handleStreamGroupsActiveConnectionChange:(id)a3;
- (void)handleSymptomReportForDecryptionError;
- (void)logAllStreamTokens;
- (void)pullAudioSamples:(opaqueVCAudioBufferList *)a3;
- (void)pushAudioSamples:(opaqueVCAudioBufferList *)a3;
- (void)redundancyController:(id)a3 redundancyIntervalDidChange:(double)a4;
- (void)redundancyController:(id)a3 redundancyPercentageDidChange:(unsigned int)a4;
- (void)reportCameraCompositionEnabled:(BOOL)a3;
- (void)resetDecryptionTimeout;
- (void)sendAudioPowerSpectrumSourceRegistration:(BOOL)a3;
- (void)setAudioEnabled:(BOOL)a3;
- (void)setAudioPaused:(BOOL)a3;
- (void)setBasebandCongestionDetector:(id)a3;
- (void)setCaptionsCoordinator:(id)a3;
- (void)setCellularUniqueTag:(unsigned int)a3;
- (void)setFECConfigurationOnStreamConfig:(id)a3 withStreamGroupID:(unsigned int)a4;
- (void)setLocalOnWiFi:(BOOL)a3;
- (void)setMediaQueue:(tagVCMediaQueue *)a3;
- (void)setMediaRecorder:(id)a3;
- (void)setMediaState:(unsigned int)a3 forMediaType:(unsigned int)a4;
- (void)setMediaType:(unsigned int)a3 mixingWithMediaType:(unsigned int)a4;
- (void)setMuted:(BOOL)a3;
- (void)setOneToOneConfig:(id)a3;
- (void)setOneToOneModeEnabled:(BOOL)a3;
- (void)setPresentationState:(unsigned __int8)a3;
- (void)setReportingAgent:(opaqueRTCReporting *)a3;
- (void)setScreenEnabled:(BOOL)a3;
- (void)setSharingEnabled:(BOOL)a3;
- (void)setStatisticsCollector:(id)a3;
- (void)setStreamDelegate:(id)a3;
- (void)setVideoEnabled:(BOOL)a3;
- (void)setVideoPaused:(BOOL)a3;
- (void)setupMediaTypeSettingsWithConfig:(id)a3;
- (void)setupPreferredIOSettings;
- (void)start;
- (void)startMultiwayStreams;
- (void)startOneToOneStreams;
- (void)startScreenGroup;
- (void)startStreamGroups;
- (void)stop;
- (void)stopAudioIO;
- (void)stopInternal;
- (void)stopStreamGroups;
- (void)streamGroup:(id)a3 didChangeMediaPriority:(unsigned __int8)a4;
- (void)streamGroup:(id)a3 didReceiveFlushRequestWithPayloads:(id)a4;
- (void)streamGroup:(id)a3 didRemoteEnableChange:(BOOL)a4;
- (void)streamGroup:(id)a3 didRemotePauseChange:(BOOL)a4;
- (void)streamGroup:(id)a3 didRequestRedundancy:(BOOL)a4;
- (void)streamGroup:(id)a3 didSuspendStreams:(BOOL)a4;
- (void)streamGroup:(id)a3 didSwitchFromStreamID:(unsigned __int16)a4 toStreamID:(unsigned __int16)a5;
- (void)streamGroup:(id)a3 remoteMediaStalled:(BOOL)a4 duration:(double)a5;
- (void)streamGroup:(id)a3 requestKeyFrameGenerationWithStreamID:(unsigned __int16)a4 firType:(int)a5;
- (void)swapScreenStreamGroupSyncSourceWithState:(unsigned int)a3;
- (void)updateOneToOneVideoStreamCustomResolution:(id)a3 videoSettings:(id)a4;
- (void)updateVideoPaused:(BOOL)a3;
- (void)vcMediaStream:(id)a3 requestKeyFrameGenerationWithStreamID:(unsigned __int16)a4 firType:(int)a5;
@end

@implementation VCSessionParticipant

- (opaqueRTCReporting)reportingAgent
{
  return (opaqueRTCReporting *)objc_loadWeak(&self->_reportingAgentWeak);
}

- (void)setReportingAgent:(opaqueRTCReporting *)a3
{
}

- (int)operatingMode
{
  if (!self->_oneToOneModeEnabled) {
    return 6;
  }
  if ([(VCSessionParticipant *)self dispatchedIsAnyCameraMediaTypeEnabled]) {
    return 1;
  }
  return 2;
}

- (BOOL)isAnyCameraMediaTypeEnabled
{
  if ([(VCSessionParticipant *)self isEnabledMediaType:1]) {
    return 1;
  }

  return [(VCSessionParticipant *)self isPersonaCameraEnabled];
}

- (BOOL)dispatchedIsAnyCameraMediaTypeEnabled
{
  return self->_videoEnabled
      || [(VCSessionParticipant *)self dispatchedIsPersonaCameraEnabled];
}

- (BOOL)dispatchedIsPersonaCameraEnabled
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_participantQueue);
  if ([(VCSessionParticipant *)self isEnabledMediaType:6]
    || [(VCSessionParticipant *)self isEnabledMediaType:7])
  {
    return 1;
  }

  return [(VCSessionParticipant *)self isEnabledMediaType:8];
}

- (BOOL)isEnabledMediaType:(unsigned int)a3
{
}

- (BOOL)isPersonaCameraEnabled
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  participantQueue = self->_participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__VCSessionParticipant_isPersonaCameraEnabled__block_invoke;
  block[3] = &unk_1E6DB4540;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(participantQueue, block);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __46__VCSessionParticipant_isPersonaCameraEnabled__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) dispatchedIsPersonaCameraEnabled];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSDictionary)mediaTypeMixingList
{
  p_mediaTypeMixingListLock = &self->_mediaTypeMixingListLock;
  os_unfair_lock_lock(&self->_mediaTypeMixingListLock);
  v4 = (NSDictionary *)(id)[(NSMutableDictionary *)self->_mediaTypeMixingList copy];
  os_unfair_lock_unlock(p_mediaTypeMixingListLock);
  return v4;
}

- (void)callDelegateWithBlock:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v5 = MEMORY[0x1E4E56580](&self->_delegate, a2);
    if (v5)
    {
      uint64_t v6 = (const void *)v5;
      (*((void (**)(id, uint64_t))a3 + 2))(a3, v5);
      CFRelease(v6);
      return;
    }
    if ((VCSessionParticipant *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v8 = (__CFString *)[(VCSessionParticipant *)self performSelector:sel_logPrefix];
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
      int v13 = 136316162;
      uint64_t v14 = v12;
      __int16 v15 = 2080;
      v16 = "-[VCSessionParticipant callDelegateWithBlock:]";
      __int16 v17 = 1024;
      int v18 = 157;
      __int16 v19 = 2112;
      v20 = v8;
      __int16 v21 = 2048;
      v22 = self;
      v11 = " [%s] %s:%d %@(%p) delegate could not be loaded";
LABEL_27:
      _os_log_error_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v13, 0x30u);
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionParticipant callDelegateWithBlock:]();
      }
    }
  }
  else if ((VCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionParticipant callDelegateWithBlock:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v7 = (__CFString *)[(VCSessionParticipant *)self performSelector:sel_logPrefix];
    }
    else {
      v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v13 = 136316162;
        uint64_t v14 = v9;
        __int16 v15 = 2080;
        v16 = "-[VCSessionParticipant callDelegateWithBlock:]";
        __int16 v17 = 1024;
        int v18 = 149;
        __int16 v19 = 2112;
        v20 = v7;
        __int16 v21 = 2048;
        v22 = self;
        v11 = " [%s] %s:%d %@(%p) block is nil";
        goto LABEL_27;
      }
    }
  }
}

- (void)callStreamDelegateWithBlock:(id)a3
{
  v4 = (const void *)MEMORY[0x1E4E56580](&self->_streamDelegate, a2);
  (*((void (**)(id, const void *))a3 + 2))(a3, v4);
  if (v4)
  {
    CFRelease(v4);
  }
}

- (void)logAllStreamTokens
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v2 = (void *)[(NSMutableDictionary *)self->_participantStreamTokens allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v24 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v25;
    uint64_t v6 = (os_log_t *)MEMORY[0x1E4F47A50];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v25 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v9 = VRTraceErrorLogLevelToCSTR();
          uint64_t v10 = *v6;
          if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
          {
            int v11 = [v8 unsignedIntValue];
            *(_DWORD *)buf = 136316162;
            uint64_t v14 = v9;
            __int16 v15 = 2080;
            v16 = "-[VCSessionParticipant logAllStreamTokens]";
            __int16 v17 = 1024;
            int v18 = 169;
            __int16 v19 = 2048;
            v20 = self;
            __int16 v21 = 1024;
            int v22 = v11;
            _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d (%p) streamToken=%u", buf, 0x2Cu);
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v24 objects:v23 count:16];
    }
    while (v4);
  }
}

- (void)startOneToOneStreams
{
  v3[5] = *MEMORY[0x1E4F143B8];
  participantQueue = self->_participantQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__VCSessionParticipant_startOneToOneStreams__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(participantQueue, v3);
}

uint64_t __44__VCSessionParticipant_startOneToOneStreams__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v12 = 136315650;
        *(void *)&v12[4] = v3;
        *(_WORD *)&v12[12] = 2080;
        *(void *)&v12[14] = "-[VCSessionParticipant startOneToOneStreams]_block_invoke";
        *(_WORD *)&v12[22] = 1024;
        LODWORD(v13) = 175;
        uint64_t v5 = " [%s] %s:%d starting oneToOne streams";
        uint64_t v6 = v4;
        uint32_t v7 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, v5, v12, v7);
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
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        *(_DWORD *)uint64_t v12 = 136316162;
        *(void *)&v12[4] = v8;
        *(_WORD *)&v12[12] = 2080;
        *(void *)&v12[14] = "-[VCSessionParticipant startOneToOneStreams]_block_invoke";
        *(_WORD *)&v12[22] = 1024;
        LODWORD(v13) = 175;
        WORD2(v13) = 2112;
        *(void *)((char *)&v13 + 6) = v2;
        HIWORD(v13) = 2048;
        uint64_t v14 = v10;
        uint64_t v5 = " [%s] %s:%d %@(%p) starting oneToOne streams";
        uint64_t v6 = v9;
        uint32_t v7 = 48;
        goto LABEL_11;
      }
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedStartOneToOneStreams", *(_OWORD *)v12, *(void *)&v12[16], v13, v14);
}

- (void)setSharingEnabled:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  participantQueue = self->_participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__VCSessionParticipant_setSharingEnabled___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __42__VCSessionParticipant_setSharingEnabled___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 409) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setFECConfigurationOnStreamConfig:(id)a3 withStreamGroupID:(unsigned int)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    int v6 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "isOneToOne");
    if (a4 == 1718909044 || v6)
    {
      int v9 = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-fec-generator-enabled", @"isFECGeneratorEnabled", &unk_1F3DC6A98, 0), "BOOLValue");
      int FECFeedbackVersion = VCMediaControlInfoGeneratorGetFECFeedbackVersion(objc_msgSend((id)objc_msgSend(a3, "rateControlConfig"), "mediaControlInfoGenerator"));
      BOOL IsLossStatsEnabled = VCMediaControlInfo_IsLossStatsEnabled(FECFeedbackVersion);
      uint64_t v12 = v9 | IsLossStatsEnabled;
      if ((v9 & 1) == 0)
      {
        BOOL v13 = IsLossStatsEnabled;
        if (IsLossStatsEnabled)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v14 = VRTraceErrorLogLevelToCSTR();
            uint64_t v15 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              int v16 = 136315906;
              uint64_t v17 = v14;
              __int16 v18 = 2080;
              __int16 v19 = "-[VCSessionParticipant setFECConfigurationOnStreamConfig:withStreamGroupID:]";
              __int16 v20 = 1024;
              int v21 = 197;
              __int16 v22 = 1024;
              int v23 = FECFeedbackVersion;
              _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Enabling FECGenerator for FECFeedbackVersion=%d", (uint8_t *)&v16, 0x22u);
            }
          }
          uint64_t v12 = v13;
        }
      }
      [a3 setFecGeneratorEnabled:v12];
      [a3 setFecHeaderVersion:1];
    }
    else
    {
      [a3 setFecGeneratorEnabled:0];
      [a3 setFecHeaderVersion:0];
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315650;
      uint64_t v17 = v7;
      __int16 v18 = 2080;
      __int16 v19 = "-[VCSessionParticipant setFECConfigurationOnStreamConfig:withStreamGroupID:]";
      __int16 v20 = 1024;
      int v21 = 188;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d videoStreamConfig is nil!", (uint8_t *)&v16, 0x1Cu);
    }
  }
}

- (void)dispatchedStartOneToOneStreams
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to start the VCAudioIO. error=%@");
}

uint64_t __54__VCSessionParticipant_dispatchedStartOneToOneStreams__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:didStart:error:", *(void *)(a1 + 32), *(void *)(a1 + 40) == 0);
}

- (void)startMultiwayStreams
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to start the stream groups. error=%@");
}

uint64_t __44__VCSessionParticipant_startMultiwayStreams__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:didStart:error:", *(void *)(a1 + 32), *(void *)(a1 + 40) == 0);
}

- (id)stopMultiwayStreams
{
  [(VCSessionParticipant *)self stopStreamGroups];
  [(VCSessionParticipant *)self stopSystemAudioCapture];

  return [(VCSessionParticipant *)self stopAudioIO];
}

- (void)dispatchedStart
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Participant already started", v2, v3, v4, v5, v6);
}

uint64_t __39__VCSessionParticipant_dispatchedStart__block_invoke(uint64_t a1, void *a2)
{
  return [a2 vcSessionParticipant:*(void *)(a1 + 32) didStart:0 error:*(void *)(a1 + 40)];
}

- (void)dispatchedStop
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Participant already stopped", v2, v3, v4, v5, v6);
}

uint64_t __38__VCSessionParticipant_dispatchedStop__block_invoke(uint64_t a1, void *a2)
{
  return [a2 vcSessionParticipant:*(void *)(a1 + 32) didStopWithError:*(void *)(a1 + 40)];
}

- (void)dispatchedSetAudioEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_participantQueue);
  if (self->_audioEnabled == v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint8_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL audioEnabled = self->_audioEnabled;
        *(_DWORD *)buf = 136315906;
        uint64_t v10 = v5;
        __int16 v11 = 2080;
        uint64_t v12 = "-[VCSessionParticipant dispatchedSetAudioEnabled:]";
        __int16 v13 = 1024;
        int v14 = 308;
        __int16 v15 = 1024;
        BOOL v16 = audioEnabled;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Participant audio already set to enabled[%d]", buf, 0x22u);
      }
    }
  }
  else
  {
    if (self->_audioEnabled)
    {
      self->_audioPaused = 0;
      self->_audioPausedToStart = 0;
    }
    unsigned int state = self->_state;
    self->_BOOL audioEnabled = v3;
    if (state)
    {
      if ([(VCSessionParticipant *)self updateStreamGroups:self->_micStreamGroups])
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSessionParticipant dispatchedSetAudioEnabled:]();
          }
        }
      }
    }
  }
  -[VCSessionParticipant callDelegateWithBlock:](self, "callDelegateWithBlock:");
}

uint64_t __50__VCSessionParticipant_dispatchedSetAudioEnabled___block_invoke(uint64_t a1, void *a2)
{
  return [a2 vcSessionParticipant:*(void *)(a1 + 32) audioEnabled:*(unsigned __int8 *)(a1 + 40) didSucceed:1 error:0];
}

uint64_t __50__VCSessionParticipant_dispatchedSetAudioEnabled___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 vcSessionParticipant:*(void *)(a1 + 32) audioEnabled:*(unsigned __int8 *)(a1 + 40) didSucceed:1 error:0];
}

uint64_t __50__VCSessionParticipant_dispatchedSetAudioEnabled___block_invoke_37(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:audioEnabled:didSucceed:error:", *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40) == 0);
}

- (void)dispatchedSetVideoEnabled:(BOOL)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (self->_videoEnabled == a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint8_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL videoEnabled = self->_videoEnabled;
        *(_DWORD *)buf = 136315906;
        uint64_t v32 = v5;
        __int16 v33 = 2080;
        v34 = "-[VCSessionParticipant dispatchedSetVideoEnabled:]";
        __int16 v35 = 1024;
        int v36 = 343;
        __int16 v37 = 1024;
        BOOL v38 = videoEnabled;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Participant video already set to enabled[%d]", buf, 0x22u);
      }
    }
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    long long v27 = __50__VCSessionParticipant_dispatchedSetVideoEnabled___block_invoke;
    uint64_t v28 = &unk_1E6DB6978;
    v29 = self;
    LOBYTE(v30) = a3;
  }
  else
  {
    if (self->_videoEnabled)
    {
      self->_videoPaused = 0;
      self->_videoPausedToStart = 0;
    }
    unsigned int state = self->_state;
    if (state == 1)
    {
      if (!a3) {
        self->_videoPausedToStart = self->_videoPaused;
      }
      id v10 = [(VCSessionParticipant *)self applyVideoEnabledSetting:a3];
      uint64_t v11 = MEMORY[0x1E4F143A8];
      uint64_t v12 = 3221225472;
      __int16 v13 = __50__VCSessionParticipant_dispatchedSetVideoEnabled___block_invoke_3;
      int v14 = &unk_1E6DB9DA8;
      LOBYTE(v17) = a3;
      __int16 v15 = self;
      id v16 = v10;
    }
    else
    {
      if (state) {
        return;
      }
      id v9 = [(VCSessionParticipant *)self applyVideoEnabledSetting:a3];
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      __int16 v20 = __50__VCSessionParticipant_dispatchedSetVideoEnabled___block_invoke_2;
      int v21 = &unk_1E6DB9DA8;
      LOBYTE(v24) = a3;
      __int16 v22 = self;
      id v23 = v9;
    }
  }
  -[VCSessionParticipant callDelegateWithBlock:](self, "callDelegateWithBlock:", v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27,
    v28,
    v29,
    v30);
}

uint64_t __50__VCSessionParticipant_dispatchedSetVideoEnabled___block_invoke(uint64_t a1, void *a2)
{
  return [a2 vcSessionParticipant:*(void *)(a1 + 32) videoEnabled:*(unsigned __int8 *)(a1 + 40) didSucceed:1 error:0];
}

uint64_t __50__VCSessionParticipant_dispatchedSetVideoEnabled___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:videoEnabled:didSucceed:error:", *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40) == 0);
}

uint64_t __50__VCSessionParticipant_dispatchedSetVideoEnabled___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:videoEnabled:didSucceed:error:", *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40) == 0);
}

- (void)dispatchedSetScreenEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if ((VCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = objc_msgSend(-[VCSessionParticipant screenGroup](self, "screenGroup"), "mediaStreamInfoArray");
        unsigned int state = self->_state;
        *(_DWORD *)buf = 136316162;
        uint64_t v23 = v6;
        __int16 v24 = 2080;
        uint64_t v25 = "-[VCSessionParticipant dispatchedSetScreenEnabled:]";
        __int16 v26 = 1024;
        int v27 = 380;
        __int16 v28 = 2112;
        uint64_t v29 = v8;
        __int16 v30 = 1024;
        LODWORD(v31) = state;
        id v10 = " [%s] %s:%d screenStream[%@] state=%d";
        uint64_t v11 = v7;
        uint32_t v12 = 44;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCSessionParticipant *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      int v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = objc_msgSend(-[VCSessionParticipant screenGroup](self, "screenGroup"), "mediaStreamInfoArray");
        unsigned int v16 = self->_state;
        *(_DWORD *)buf = 136316674;
        uint64_t v23 = v13;
        __int16 v24 = 2080;
        uint64_t v25 = "-[VCSessionParticipant dispatchedSetScreenEnabled:]";
        __int16 v26 = 1024;
        int v27 = 380;
        __int16 v28 = 2112;
        uint64_t v29 = (uint64_t)v5;
        __int16 v30 = 2048;
        v31 = self;
        __int16 v32 = 2112;
        uint64_t v33 = v15;
        __int16 v34 = 1024;
        unsigned int v35 = v16;
        id v10 = " [%s] %s:%d %@(%p) screenStream[%@] state=%d";
        uint64_t v11 = v14;
        uint32_t v12 = 64;
        goto LABEL_11;
      }
    }
  }
  if (self->_screenEnabled == v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      uint64_t v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL screenEnabled = self->_screenEnabled;
        *(_DWORD *)buf = 136315906;
        uint64_t v23 = v17;
        __int16 v24 = 2080;
        uint64_t v25 = "-[VCSessionParticipant dispatchedSetScreenEnabled:]";
        __int16 v26 = 1024;
        int v27 = 382;
        __int16 v28 = 1024;
        LODWORD(v29) = screenEnabled;
        _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Participant screen video already set to enabled[%d]", buf, 0x22u);
      }
    }
  }
  else
  {
    unsigned int v20 = self->_state;
    if (v20 == 1)
    {
      if (v3) {
        id v21 = [(VCSessionParticipant *)self startScreenGroup];
      }
      else {
        id v21 = [(VCSessionParticipant *)self stopScreenGroup];
      }
      if (v21) {
        goto LABEL_25;
      }
    }
    else if (v20)
    {
      return;
    }
    [(VCSessionParticipant *)self applyScreenEnabledSetting:v3];
  }
LABEL_25:
  -[VCSessionParticipant callDelegateWithBlock:](self, "callDelegateWithBlock:");
}

uint64_t __51__VCSessionParticipant_dispatchedSetScreenEnabled___block_invoke(uint64_t a1, void *a2)
{
  return [a2 vcSessionParticipant:*(void *)(a1 + 32) screenEnabled:*(unsigned __int8 *)(a1 + 40) didSucceed:1 error:0];
}

uint64_t __51__VCSessionParticipant_dispatchedSetScreenEnabled___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 vcSessionParticipant:*(void *)(a1 + 32) screenEnabled:*(unsigned __int8 *)(a1 + 40) didSucceed:1 error:0];
}

uint64_t __51__VCSessionParticipant_dispatchedSetScreenEnabled___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:screenEnabled:didSucceed:error:", *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40) == 0);
}

- (void)dispatchedSetAudioPaused:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!self->_audioEnabled)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionParticipant dispatchedSetAudioPaused:]();
      }
    }
    +[VCSessionErrorUtils VCSessionParticipantErrorEvent:errorPath:](VCSessionErrorUtils, "VCSessionParticipantErrorEvent:errorPath:", 9, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSessionParticipant.m", 417));
    goto LABEL_24;
  }
  if (self->_audioPaused == a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL audioPaused = self->_audioPaused;
        *(_DWORD *)buf = 136315906;
        uint64_t v17 = v5;
        __int16 v18 = 2080;
        uint64_t v19 = "-[VCSessionParticipant dispatchedSetAudioPaused:]";
        __int16 v20 = 1024;
        int v21 = 425;
        __int16 v22 = 1024;
        BOOL v23 = audioPaused;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Participant audio already set to paused[%d]", buf, 0x22u);
      }
    }
    goto LABEL_24;
  }
  if (!self->_state)
  {
    self->_BOOL audioPaused = a3;
    goto LABEL_24;
  }
  if (self->_audioPausedToStart)
  {
    if (a3)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipant dispatchedSetAudioPaused:]();
        }
      }
    }
    else if ([(VCSessionParticipant *)self startMicStreamGroups])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipant dispatchedSetAudioPaused:]();
        }
      }
    }
    else
    {
      self->_audioPausedToStart = 0;
    }
    goto LABEL_24;
  }
  id v8 = [(VCSessionParticipant *)self setAudioStreamGroupsPaused:a3];
  if (v8)
  {
    id v10 = v8;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_24;
    }
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    uint32_t v12 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v17 = v11;
    __int16 v18 = 2080;
    uint64_t v19 = "-[VCSessionParticipant dispatchedSetAudioPaused:]";
    __int16 v20 = 1024;
    int v21 = 454;
    __int16 v22 = 1024;
    BOOL v23 = v3;
    __int16 v24 = 2112;
    id v25 = v10;
    uint64_t v13 = " [%s] %s:%d setAudioStreamGroupsPaused=%d failed with error=%@";
LABEL_35:
    _os_log_error_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_ERROR, v13, buf, 0x2Cu);
    goto LABEL_24;
  }
  id v9 = [(VCSessionParticipant *)self pauseAudioStreams:v3];
  if (!v9)
  {
    self->_BOOL audioPaused = v3;
    goto LABEL_24;
  }
  id v14 = v9;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    uint32_t v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v17 = v15;
      __int16 v18 = 2080;
      uint64_t v19 = "-[VCSessionParticipant dispatchedSetAudioPaused:]";
      __int16 v20 = 1024;
      int v21 = 456;
      __int16 v22 = 1024;
      BOOL v23 = v3;
      __int16 v24 = 2112;
      id v25 = v14;
      uint64_t v13 = " [%s] %s:%d pauseAudioStreams=%d failed with error=%@";
      goto LABEL_35;
    }
  }
LABEL_24:
  -[VCSessionParticipant callDelegateWithBlock:](self, "callDelegateWithBlock:");
}

uint64_t __49__VCSessionParticipant_dispatchedSetAudioPaused___block_invoke(uint64_t a1, void *a2)
{
  return [a2 vcSessionParticipant:*(void *)(a1 + 32) audioPaused:*(unsigned __int8 *)(a1 + 48) didSucceed:0 error:*(void *)(a1 + 40)];
}

uint64_t __49__VCSessionParticipant_dispatchedSetAudioPaused___block_invoke_38(uint64_t a1, void *a2)
{
  return [a2 vcSessionParticipant:*(void *)(a1 + 32) audioPaused:*(unsigned __int8 *)(a1 + 40) didSucceed:1 error:0];
}

uint64_t __49__VCSessionParticipant_dispatchedSetAudioPaused___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 vcSessionParticipant:*(void *)(a1 + 32) audioPaused:*(unsigned __int8 *)(a1 + 40) didSucceed:1 error:0];
}

uint64_t __49__VCSessionParticipant_dispatchedSetAudioPaused___block_invoke_39(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:audioPaused:didSucceed:error:", *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40) == 0);
}

- (void)dispatchedSetVideoPaused:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (self->_videoEnabled)
  {
    if (self->_videoPaused == a3)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v5 = VRTraceErrorLogLevelToCSTR();
        uint64_t v6 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          BOOL videoPaused = self->_videoPaused;
          *(_DWORD *)buf = 136315906;
          uint64_t v17 = v5;
          __int16 v18 = 2080;
          uint64_t v19 = "-[VCSessionParticipant dispatchedSetVideoPaused:]";
          __int16 v20 = 1024;
          int v21 = 477;
          __int16 v22 = 1024;
          BOOL v23 = videoPaused;
          _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Participant video already set to paused[%d]", buf, 0x22u);
        }
      }
      goto LABEL_31;
    }
    if (!self->_state)
    {
      self->_BOOL videoPaused = a3;
      [(VCSessionParticipant *)self updateAudioSpectrumState];
      goto LABEL_31;
    }
    if (self->_videoPausedToStart)
    {
      if (a3)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSessionParticipant dispatchedSetVideoPaused:]();
          }
        }
        goto LABEL_31;
      }
      id v12 = [(VCSessionParticipant *)self startVideo];
      self->_videoPausedToStart = 0;
      if (v12)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_31;
        }
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        id v10 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          goto LABEL_31;
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v17 = v13;
        __int16 v18 = 2080;
        uint64_t v19 = "-[VCSessionParticipant dispatchedSetVideoPaused:]";
        __int16 v20 = 1024;
        int v21 = 504;
        __int16 v22 = 1024;
        BOOL v23 = v3;
        __int16 v24 = 2112;
        id v25 = v12;
        uint64_t v11 = " [%s] %s:%d Failed to startVideo for videoPausedToStart paused=%d error=%@ ";
        goto LABEL_27;
      }
      id v14 = self;
      BOOL v15 = 0;
    }
    else
    {
      id v8 = [(VCSessionParticipant *)self pauseVideo:a3];
      if (v8)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_31;
        }
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        id v10 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          goto LABEL_31;
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v17 = v9;
        __int16 v18 = 2080;
        uint64_t v19 = "-[VCSessionParticipant dispatchedSetVideoPaused:]";
        __int16 v20 = 1024;
        int v21 = 514;
        __int16 v22 = 1024;
        BOOL v23 = v3;
        __int16 v24 = 2112;
        id v25 = v8;
        uint64_t v11 = " [%s] %s:%d paused=%d error=%@ ";
LABEL_27:
        _os_log_error_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_ERROR, v11, buf, 0x2Cu);
        goto LABEL_31;
      }
      id v14 = self;
      BOOL v15 = v3;
    }
    [(VCSessionParticipant *)v14 updateVideoPaused:v15];
    goto LABEL_31;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCSessionParticipant dispatchedSetVideoPaused:]();
    }
  }
  +[VCSessionErrorUtils VCSessionParticipantErrorEvent:errorPath:](VCSessionErrorUtils, "VCSessionParticipantErrorEvent:errorPath:", 9, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSessionParticipant.m", 469));
LABEL_31:
  -[VCSessionParticipant callDelegateWithBlock:](self, "callDelegateWithBlock:");
}

uint64_t __49__VCSessionParticipant_dispatchedSetVideoPaused___block_invoke(uint64_t a1, void *a2)
{
  return [a2 vcSessionParticipant:*(void *)(a1 + 32) videoPaused:*(unsigned __int8 *)(a1 + 48) didSucceed:0 error:*(void *)(a1 + 40)];
}

uint64_t __49__VCSessionParticipant_dispatchedSetVideoPaused___block_invoke_40(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 40);

  return [v2 vcSessionParticipant:v3 videoPaused:v4 didSucceed:1 error:0];
}

uint64_t __49__VCSessionParticipant_dispatchedSetVideoPaused___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 vcSessionParticipant:*(void *)(a1 + 32) videoPaused:*(unsigned __int8 *)(a1 + 40) didSucceed:1 error:0];
}

uint64_t __49__VCSessionParticipant_dispatchedSetVideoPaused___block_invoke_41(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:videoPaused:didSucceed:error:", *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40) == 0);
}

- (void)dispatchedSetMediaState:(unsigned int)a3 forMediaType:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaTypeSettingsDict, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:*(void *)&a4]);
  if (!v7)
  {
    id v12 = +[VCSessionErrorUtils VCSessionParticipantErrorEvent:errorPath:](VCSessionErrorUtils, "VCSessionParticipantErrorEvent:errorPath:", 12, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSessionParticipant.m", 527));
    if ((VCSessionParticipant *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_5;
      }
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      BOOL v15 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_5;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v44 = v14;
      __int16 v45 = 2080;
      v46 = "-[VCSessionParticipant dispatchedSetMediaState:forMediaType:]";
      __int16 v47 = 1024;
      int v48 = 528;
      __int16 v49 = 2112;
      v50 = VCSessionMediaType_Name(v4);
      __int16 v51 = 2112;
      v52 = VCSessionMediaState_Name(v5);
      unsigned int v16 = " [%s] %s:%d mediaTypeSettings is missing for mediaType=%@ mediaState=%@";
      uint64_t v17 = v15;
      uint32_t v18 = 48;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v13 = (__CFString *)[(VCSessionParticipant *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v13 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_5;
      }
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      __int16 v20 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_5;
      }
      *(_DWORD *)buf = 136316674;
      uint64_t v44 = v19;
      __int16 v45 = 2080;
      v46 = "-[VCSessionParticipant dispatchedSetMediaState:forMediaType:]";
      __int16 v47 = 1024;
      int v48 = 528;
      __int16 v49 = 2112;
      v50 = v13;
      __int16 v51 = 2048;
      v52 = self;
      __int16 v53 = 2112;
      v54 = VCSessionMediaType_Name(v4);
      __int16 v55 = 2112;
      v56 = VCSessionMediaState_Name(v5);
      unsigned int v16 = " [%s] %s:%d %@(%p) mediaTypeSettings is missing for mediaType=%@ mediaState=%@";
      uint64_t v17 = v20;
      uint32_t v18 = 68;
    }
    _os_log_error_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);
    goto LABEL_5;
  }
  id v8 = v7;
  uint64_t v9 = [v7 mediaState];
  if (v9 == v5)
  {
    if ((VCSessionParticipant *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_41;
      }
      uint64_t v24 = VRTraceErrorLogLevelToCSTR();
      id v25 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_41;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v44 = v24;
      __int16 v45 = 2080;
      v46 = "-[VCSessionParticipant dispatchedSetMediaState:forMediaType:]";
      __int16 v47 = 1024;
      int v48 = 531;
      __int16 v49 = 2112;
      v50 = VCSessionMediaType_Name(v4);
      __int16 v51 = 2112;
      v52 = VCSessionMediaState_Name(v5);
      uint64_t v26 = " [%s] %s:%d mediaType=%@ already set to mediaState=%@";
      int v27 = v25;
      uint32_t v28 = 48;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v21 = (__CFString *)[(VCSessionParticipant *)self performSelector:sel_logPrefix];
      }
      else {
        int v21 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_41;
      }
      uint64_t v35 = VRTraceErrorLogLevelToCSTR();
      uint64_t v36 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_41;
      }
      *(_DWORD *)buf = 136316674;
      uint64_t v44 = v35;
      __int16 v45 = 2080;
      v46 = "-[VCSessionParticipant dispatchedSetMediaState:forMediaType:]";
      __int16 v47 = 1024;
      int v48 = 531;
      __int16 v49 = 2112;
      v50 = v21;
      __int16 v51 = 2048;
      v52 = self;
      __int16 v53 = 2112;
      v54 = VCSessionMediaType_Name(v4);
      __int16 v55 = 2112;
      v56 = VCSessionMediaState_Name(v5);
      uint64_t v26 = " [%s] %s:%d %@(%p) mediaType=%@ already set to mediaState=%@";
      int v27 = v36;
      uint32_t v28 = 68;
    }
    _os_log_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
LABEL_41:
    id v12 = 0;
    goto LABEL_5;
  }
  uint64_t v10 = v9;
  [v8 setMediaState:v5];
  uint64_t v11 = [(VCSessionParticipant *)self applyMediaState:v5 forMediaType:v4];
  if (!v11)
  {
    id v12 = [(VCSessionParticipant *)self completeMediaStateChange];
    if (!v12) {
      goto LABEL_5;
    }
    [v8 setMediaState:v10];
    if ((VCSessionParticipant *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        BOOL v23 = (__CFString *)[(VCSessionParticipant *)self performSelector:sel_logPrefix];
      }
      else {
        BOOL v23 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v39 = VRTraceErrorLogLevelToCSTR();
        BOOL v38 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316930;
          uint64_t v44 = v39;
          __int16 v45 = 2080;
          v46 = "-[VCSessionParticipant dispatchedSetMediaState:forMediaType:]";
          __int16 v47 = 1024;
          int v48 = 538;
          __int16 v49 = 2112;
          v50 = v23;
          __int16 v51 = 2048;
          v52 = self;
          __int16 v53 = 2112;
          v54 = VCSessionMediaType_Name(v4);
          __int16 v55 = 2112;
          v56 = VCSessionMediaState_Name(v5);
          __int16 v57 = 2112;
          v58 = v12;
          v31 = " [%s] %s:%d %@(%p) Failed to complete setting the mediaState=%@ for mediaType=%@. error=%@";
          goto LABEL_50;
        }
      }
      goto LABEL_5;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_5;
    }
    uint64_t v32 = VRTraceErrorLogLevelToCSTR();
    __int16 v30 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    *(_DWORD *)buf = 136316418;
    uint64_t v44 = v32;
    __int16 v45 = 2080;
    v46 = "-[VCSessionParticipant dispatchedSetMediaState:forMediaType:]";
    __int16 v47 = 1024;
    int v48 = 538;
    __int16 v49 = 2112;
    v50 = VCSessionMediaType_Name(v4);
    __int16 v51 = 2112;
    v52 = VCSessionMediaState_Name(v5);
    __int16 v53 = 2112;
    v54 = v12;
    v31 = " [%s] %s:%d Failed to complete setting the mediaState=%@ for mediaType=%@. error=%@";
LABEL_35:
    uint64_t v33 = v30;
    uint32_t v34 = 58;
LABEL_51:
    _os_log_impl(&dword_1E1EA4000, v33, OS_LOG_TYPE_DEFAULT, v31, buf, v34);
    goto LABEL_5;
  }
  id v12 = v11;
  [v8 setMediaState:v10];
  if ((VCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_5;
    }
    uint64_t v29 = VRTraceErrorLogLevelToCSTR();
    __int16 v30 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    *(_DWORD *)buf = 136316418;
    uint64_t v44 = v29;
    __int16 v45 = 2080;
    v46 = "-[VCSessionParticipant dispatchedSetMediaState:forMediaType:]";
    __int16 v47 = 1024;
    int v48 = 535;
    __int16 v49 = 2112;
    v50 = VCSessionMediaType_Name(v4);
    __int16 v51 = 2112;
    v52 = VCSessionMediaState_Name(v5);
    __int16 v53 = 2112;
    v54 = v12;
    v31 = " [%s] %s:%d Failed to set the mediaState=%@ for mediaType=%@. error=%@";
    goto LABEL_35;
  }
  if (objc_opt_respondsToSelector()) {
    __int16 v22 = (__CFString *)[(VCSessionParticipant *)self performSelector:sel_logPrefix];
  }
  else {
    __int16 v22 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v37 = VRTraceErrorLogLevelToCSTR();
    BOOL v38 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316930;
      uint64_t v44 = v37;
      __int16 v45 = 2080;
      v46 = "-[VCSessionParticipant dispatchedSetMediaState:forMediaType:]";
      __int16 v47 = 1024;
      int v48 = 535;
      __int16 v49 = 2112;
      v50 = v22;
      __int16 v51 = 2048;
      v52 = self;
      __int16 v53 = 2112;
      v54 = VCSessionMediaType_Name(v4);
      __int16 v55 = 2112;
      v56 = VCSessionMediaState_Name(v5);
      __int16 v57 = 2112;
      v58 = v12;
      v31 = " [%s] %s:%d %@(%p) Failed to set the mediaState=%@ for mediaType=%@. error=%@";
LABEL_50:
      uint64_t v33 = v38;
      uint32_t v34 = 78;
      goto LABEL_51;
    }
  }
LABEL_5:
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __61__VCSessionParticipant_dispatchedSetMediaState_forMediaType___block_invoke;
  v40[3] = &unk_1E6DB9DD0;
  int v41 = v5;
  int v42 = v4;
  v40[4] = self;
  v40[5] = v12;
  [(VCSessionParticipant *)self callDelegateWithBlock:v40];
}

uint64_t __61__VCSessionParticipant_dispatchedSetMediaState_forMediaType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:mediaStateDidChange:forMediaType:didSucceed:error:", *(void *)(a1 + 32), *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52), *(void *)(a1 + 40) == 0);
}

- (void)dispatchSetMediaType:(unsigned int)a3 mixingWithMediaType:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_participantQueue);
  uint64_t v7 = [NSNumber numberWithUnsignedInt:v5];
  id v8 = [(NSDictionary *)[(VCSessionParticipant *)self mediaTypeMixingList] objectForKeyedSubscript:v7];
  BOOL v10 = v5 != v4 && v8 == 0;
  if (v8) {
    BOOL v11 = [v8 integerValue] != v4;
  }
  else {
    BOOL v11 = 0;
  }
  if (v10 || v11)
  {
    os_unfair_lock_lock(&self->_mediaTypeMixingListLock);
    if (v5 == v4)
    {
      [(NSMutableDictionary *)self->_mediaTypeMixingList setObject:0 forKeyedSubscript:v7];
      os_unfair_lock_unlock(&self->_mediaTypeMixingListLock);
      if (v5 != 2) {
        goto LABEL_21;
      }
      uint64_t v12 = 1937339233;
    }
    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mediaTypeMixingList, "setObject:forKeyedSubscript:", [NSNumber numberWithUnsignedInt:v4], v7);
      os_unfair_lock_unlock(&self->_mediaTypeMixingListLock);
      if (v5 != 2 || v4 != 1)
      {
LABEL_21:
        if ((VCSessionParticipant *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
            goto LABEL_40;
          }
          uint64_t v20 = VRTraceErrorLogLevelToCSTR();
          int v21 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_40;
          }
          *(_DWORD *)buf = 136316162;
          uint64_t v33 = v20;
          __int16 v34 = 2080;
          uint64_t v35 = "-[VCSessionParticipant dispatchSetMediaType:mixingWithMediaType:]";
          __int16 v36 = 1024;
          int v37 = 568;
          __int16 v38 = 2112;
          *(void *)uint64_t v39 = VCSessionMediaType_Name(v5);
          *(_WORD *)&v39[8] = 2112;
          v40 = VCSessionMediaType_Name(v4);
          __int16 v22 = " [%s] %s:%d Setting mediaType=%@ mixingMediaType=%@";
          BOOL v23 = v21;
          uint32_t v24 = 48;
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            uint64_t v14 = (__CFString *)[(VCSessionParticipant *)self performSelector:sel_logPrefix];
          }
          else {
            uint64_t v14 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
            goto LABEL_40;
          }
          uint64_t v27 = VRTraceErrorLogLevelToCSTR();
          uint32_t v28 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_40;
          }
          *(_DWORD *)buf = 136316674;
          uint64_t v33 = v27;
          __int16 v34 = 2080;
          uint64_t v35 = "-[VCSessionParticipant dispatchSetMediaType:mixingWithMediaType:]";
          __int16 v36 = 1024;
          int v37 = 568;
          __int16 v38 = 2112;
          *(void *)uint64_t v39 = v14;
          *(_WORD *)&v39[8] = 2048;
          v40 = self;
          __int16 v41 = 2112;
          *(void *)int v42 = VCSessionMediaType_Name(v5);
          *(_WORD *)&v42[8] = 2112;
          v43 = VCSessionMediaType_Name(v4);
          __int16 v22 = " [%s] %s:%d %@(%p) Setting mediaType=%@ mixingMediaType=%@";
          BOOL v23 = v28;
          uint32_t v24 = 68;
        }
        _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
LABEL_40:
        [(VCSessionParticipant *)self reportCameraCompositionEnabled:v5 != v4];
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __65__VCSessionParticipant_dispatchSetMediaType_mixingWithMediaType___block_invoke;
        v29[3] = &unk_1E6DB6A18;
        v29[4] = self;
        int v30 = v5;
        int v31 = v4;
        [(VCSessionParticipant *)self callDelegateWithBlock:v29];
        return;
      }
      uint64_t v12 = 1835623282;
    }
    [(VCSessionParticipant *)self setStreamGroup:1935897189 syncSourceStreamGroupID:v12];
    goto LABEL_21;
  }
  if ((VCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      unsigned int v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v33 = v15;
        __int16 v34 = 2080;
        uint64_t v35 = "-[VCSessionParticipant dispatchSetMediaType:mixingWithMediaType:]";
        __int16 v36 = 1024;
        int v37 = 576;
        __int16 v38 = 1024;
        *(_DWORD *)uint64_t v39 = v5;
        *(_WORD *)&v39[4] = 1024;
        *(_DWORD *)&v39[6] = v4;
        uint64_t v17 = " [%s] %s:%d mediaType=%d already mixingMediaType=%d";
        uint32_t v18 = v16;
        uint32_t v19 = 40;
LABEL_34:
        _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v13 = (__CFString *)[(VCSessionParticipant *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v13 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v25 = VRTraceErrorLogLevelToCSTR();
      uint64_t v26 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316674;
        uint64_t v33 = v25;
        __int16 v34 = 2080;
        uint64_t v35 = "-[VCSessionParticipant dispatchSetMediaType:mixingWithMediaType:]";
        __int16 v36 = 1024;
        int v37 = 576;
        __int16 v38 = 2112;
        *(void *)uint64_t v39 = v13;
        *(_WORD *)&v39[8] = 2048;
        v40 = self;
        __int16 v41 = 1024;
        *(_DWORD *)int v42 = v5;
        *(_WORD *)&v42[4] = 1024;
        *(_DWORD *)&v42[6] = v4;
        uint64_t v17 = " [%s] %s:%d %@(%p) mediaType=%d already mixingMediaType=%d";
        uint32_t v18 = v26;
        uint32_t v19 = 60;
        goto LABEL_34;
      }
    }
  }
}

uint64_t __65__VCSessionParticipant_dispatchSetMediaType_mixingWithMediaType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 vcSessionParticipant:*(void *)(a1 + 32) mediaMixingDidChangeForMediaType:*(unsigned int *)(a1 + 40) mixingMediaType:*(unsigned int *)(a1 + 44)];
}

- (void)reportCameraCompositionEnabled:(BOOL)a3
{
}

+ (id)participantInfoWithParticipantData:(id)a3
{
  if (a3) {
    return (id)[MEMORY[0x1E4F28F98] propertyListWithData:a3 options:0 format:0 error:0];
  }
  else {
    return 0;
  }
}

+ (id)participantDataWithParticipantInfo:(id)a3
{
  if (a3) {
    return (id)[MEMORY[0x1E4F28F98] dataWithPropertyList:a3 format:200 options:0 error:0];
  }
  else {
    return 0;
  }
}

+ (id)participantDataWithMediaNegotiatorVersion:(int)a3 participantData:(id)a4
{
  if (!a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCSessionParticipant participantDataWithMediaNegotiatorVersion:participantData:]();
      }
    }
    return 0;
  }
  id v4 = +[VCSessionParticipant participantInfoWithParticipantData:a4];
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCSessionParticipant participantDataWithMediaNegotiatorVersion:participantData:]();
      }
    }
    return 0;
  }
  id v5 = v4;
  uint64_t v6 = [v4 objectForKeyedSubscript:@"vcSessionParticipantKeyMediaNegotiationData"];
  if (!v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCSessionParticipant participantDataWithMediaNegotiatorVersion:participantData:]();
      }
    }
    return 0;
  }
  uint64_t v7 = v6;
  id v8 = +[VCSessionMediaNegotiator mediaBlobForVersion:0 negotiationData:v6];
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCSessionParticipant participantDataWithMediaNegotiatorVersion:participantData:].cold.4();
      }
    }
    return 0;
  }
  id v9 = v8;
  id v10 = +[VCSessionMediaNegotiator mediaBlobForVersion:1 negotiationData:v7];
  if (!v10)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCSessionParticipant participantDataWithMediaNegotiatorVersion:participantData:].cold.5();
      }
    }
    return 0;
  }
  id v11 = v10;
  uint64_t v12 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v5];
  if (!v12)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCSessionParticipant participantDataWithMediaNegotiatorVersion:participantData:].cold.6();
      }
    }
    return 0;
  }
  uint64_t v13 = v12;
  [v12 setObject:0 forKeyedSubscript:@"vcSessionParticipantKeyMediaNegotiationData"];
  [v13 setObject:v9 forKeyedSubscript:@"vcSessionParticipantKeyMediaBlob"];
  [v13 setObject:v11 forKeyedSubscript:@"b2n"];

  return +[VCSessionParticipant participantDataWithParticipantInfo:v13];
}

+ (id)participantDataWithParticipantData:(id)a3 isReinit:(BOOL)a4
{
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCSessionParticipant participantDataWithParticipantData:isReinit:]();
      }
    }
    return 0;
  }
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = +[VCSessionParticipant participantInfoWithParticipantData:](VCSessionParticipant, "participantInfoWithParticipantData:");
  if (!v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCSessionParticipant participantDataWithParticipantData:isReinit:]();
      }
    }
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = [v6 objectForKeyedSubscript:@"vcSessionParticipantKeyMediaNegotiationData"];
  if (v4 && v8) {
    return v5;
  }
  if (v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCSessionParticipant participantDataWithParticipantData:isReinit:]();
      }
    }
    return 0;
  }
  uint64_t v9 = [v7 objectForKeyedSubscript:@"vcSessionParticipantKeyMediaBlob"];
  uint64_t v10 = [v7 objectForKeyedSubscript:@"b2n"];
  uint64_t v11 = [v7 objectForKeyedSubscript:@"b2w"];
  if (v4)
  {
    if (!v9)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          +[VCSessionParticipant participantDataWithParticipantData:isReinit:].cold.4();
        }
      }
      return 0;
    }
    if (!v10)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          +[VCSessionParticipant participantDataWithParticipantData:isReinit:].cold.5();
        }
      }
      return 0;
    }
    id v12 = +[VCSessionMediaNegotiator negotiationDataWithVersion1:v9 version2:v10];
  }
  else
  {
    uint64_t v13 = v11;
    if (!v9 && !v10 && !v11)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          +[VCSessionParticipant participantDataWithParticipantData:isReinit:].cold.8();
        }
      }
      return 0;
    }
    if (v10)
    {
      uint64_t v14 = 1;
      uint64_t v13 = v10;
    }
    else if (v11)
    {
      uint64_t v14 = 1;
    }
    else
    {
      if (![v7 objectForKeyedSubscript:@"vcSessionParticipantKeyMediaBlob"])
      {
LABEL_25:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            +[VCSessionParticipant participantDataWithParticipantData:isReinit:].cold.6();
          }
        }
        return 0;
      }
      uint64_t v14 = 0;
      uint64_t v13 = v9;
    }
    id v12 = +[VCSessionMediaNegotiator negotiationDataWithVersion:v14 mediaBlob:v13];
  }
  id v15 = v12;
  if (!v12) {
    goto LABEL_25;
  }
  unsigned int v16 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v7];
  if (!v16)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCSessionParticipant participantDataWithParticipantData:isReinit:].cold.7();
      }
    }
    return 0;
  }
  uint64_t v17 = v16;
  [v16 setObject:v15 forKeyedSubscript:@"vcSessionParticipantKeyMediaNegotiationData"];
  [v17 setObject:0 forKeyedSubscript:@"vcSessionParticipantKeyMediaBlob"];
  [v17 setObject:0 forKeyedSubscript:@"b2n"];
  [v17 setObject:0 forKeyedSubscript:@"b2w"];

  return +[VCSessionParticipant participantDataWithParticipantInfo:v17];
}

+ (id)streamGroupIDsFromParticipantData:(id)a3
{
  id v3 = +[VCSessionParticipant participantInfoWithParticipantData:a3];
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCSessionParticipant streamGroupIDsFromParticipantData:]();
      }
    }
    return 0;
  }
  uint64_t v4 = [v3 objectForKeyedSubscript:@"vcSessionParticipantKeyMediaNegotiationData"];
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCSessionParticipant streamGroupIDsFromParticipantData:]();
      }
    }
    return 0;
  }

  return +[VCSessionMediaNegotiator streamGroupIDsWithMediaBlob:v4];
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v3 stringWithFormat:@"%@[%p] idsDestination[%@] idsParticipantID[%llu] participantUUID[%@] state[%s]", NSStringFromClass(v4), self, self->_idsDestination, self->_idsParticipantID, self->_uuid, -[VCSessionParticipant participantStateToString:](self, "participantStateToString:", self->_state)];
}

- (id)generateEncryptionKey
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[MEMORY[0x1E4F1CA58] dataWithCapacity:30];
  unsigned int v3 = 0;
  do
  {
    __int16 v6 = -21846;
    __int16 v6 = hwrandom();
    [v2 appendBytes:&v6 length:2];
  }
  while (v3++ < 0xE);
  return v2;
}

- (void)stopInternal
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((VCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      id v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v11 = 136315650;
        *(void *)&v11[4] = v4;
        *(_WORD *)&v11[12] = 2080;
        *(void *)&v11[14] = "-[VCSessionParticipant stopInternal]";
        *(_WORD *)&v11[22] = 1024;
        LODWORD(v12) = 709;
        __int16 v6 = " [%s] %s:%d Tearing down participant";
        uint64_t v7 = v5;
        uint32_t v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, v11, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      unsigned int v3 = (__CFString *)[(VCSessionParticipant *)self performSelector:sel_logPrefix];
    }
    else {
      unsigned int v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v11 = 136316162;
        *(void *)&v11[4] = v9;
        *(_WORD *)&v11[12] = 2080;
        *(void *)&v11[14] = "-[VCSessionParticipant stopInternal]";
        *(_WORD *)&v11[22] = 1024;
        LODWORD(v12) = 709;
        WORD2(v12) = 2112;
        *(void *)((char *)&v12 + 6) = v3;
        HIWORD(v12) = 2048;
        uint64_t v13 = self;
        __int16 v6 = " [%s] %s:%d %@(%p) Tearing down participant";
        uint64_t v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }
  [(VCSessionParticipant *)self stopVideoCaptureClient];
  [(VCSessionParticipant *)self stopStreamGroups];
  [(VCSessionParticipant *)self stopOneToOneStreams];
  [(VCSessionParticipant *)self setState:0];
}

- (BOOL)isAudioStream:(id)a3
{
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isVideoStream:(id)a3
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)startAudioIO
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(VCSessionParticipant *)self onStartAudioIO];
  UInt32 v18 = 0;
  memset(v17, 0, sizeof(v17));
  AUIOGetAUNumber(&v18);
  [(VCAudioIO *)self->_audioIO setFarEndVersionInfo:v17];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      audioIO = self->_audioIO;
      int v7 = 136316162;
      uint64_t v8 = v3;
      __int16 v9 = 2080;
      uint64_t v10 = "-[VCSessionParticipant startAudioIO]";
      __int16 v11 = 1024;
      int v12 = 734;
      __int16 v13 = 2048;
      uint64_t v14 = self;
      __int16 v15 = 2048;
      unsigned int v16 = audioIO;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d (%p) starting audioIO=%p", (uint8_t *)&v7, 0x30u);
    }
  }
  return [(VCAudioIO *)self->_audioIO start];
}

- (id)stopAudioIO
{
  id v2 = [(VCAudioIO *)self->_audioIO stop];
  if (v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionParticipant stopAudioIO]();
      }
    }
  }
  return v2;
}

- (id)startMediaStreams:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [a3 countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  __int16 v6 = 0;
  uint64_t v7 = *(void *)v14;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v14 != v7) {
        objc_enumerationMutation(a3);
      }
      __int16 v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
      if (!objc_msgSend((id)objc_msgSend(v9, "stream"), "state"))
      {
        uint64_t v10 = objc_msgSend((id)objc_msgSend(v9, "stream"), "start");
        if (v10) {
          __int16 v6 = (void *)v10;
        }
      }
    }
    uint64_t v5 = [a3 countByEnumeratingWithState:&v13 objects:v12 count:16];
  }
  while (v5);
  return v6;
}

- (id)stopMicStreamGroups
{
  if (self->_oneToOneModeEnabled) {
    return 0;
  }
  else {
    return [(VCSessionParticipant *)self stopStreamGroups:self->_micStreamGroups];
  }
}

- (id)startMicStreamGroups
{
  if (self->_oneToOneModeEnabled) {
    return 0;
  }
  else {
    return [(VCSessionParticipant *)self startStreamGroups:self->_micStreamGroups];
  }
}

- (id)startCameraStreamGroups
{
  if (self->_oneToOneModeEnabled) {
    return 0;
  }
  id v4 = [(VCSessionParticipant *)self cameraGroups];

  return [(VCSessionParticipant *)self startStreamGroups:v4];
}

- (id)stopStreamGroups:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id result = (id)[a3 countByEnumeratingWithState:&v9 objects:v8 count:16];
  if (result)
  {
    id v5 = result;
    uint64_t v6 = *(void *)v10;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(a3);
      }
      id result = (id)[*(id *)(*((void *)&v9 + 1) + 8 * v7) stop];
      if (result) {
        break;
      }
      if (v5 == (id)++v7)
      {
        id result = (id)[a3 countByEnumeratingWithState:&v9 objects:v8 count:16];
        id v5 = result;
        if (result) {
          goto LABEL_3;
        }
        return result;
      }
    }
  }
  return result;
}

- (id)startStreamGroups:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = [*(id *)(*((void *)&v13 + 1) + 8 * v8) start];
        if (v9)
        {
          long long v10 = (void *)v9;
          [(VCSessionParticipant *)self stopStreamGroups:a3];
          return v10;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v13 objects:v12 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  return 0;
}

- (id)updateStreamGroups:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v36 objects:v35 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v37;
  while (2)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v37 != v7) {
        objc_enumerationMutation(a3);
      }
      uint64_t v9 = *(void **)(*((void *)&v36 + 1) + 8 * i);
      long long v10 = [(VCSessionParticipant *)self updateActiveStateForStreamGroup:v9];
      if (v10)
      {
        long long v12 = v10;
        [(VCSessionParticipant *)self stopStreamGroups:a3];
        if ((VCSessionParticipant *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
            return 0;
          }
          uint64_t v14 = VRTraceErrorLogLevelToCSTR();
          long long v15 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            return 0;
          }
          int v21 = 136316162;
          uint64_t v22 = v14;
          __int16 v23 = 2080;
          uint32_t v24 = "-[VCSessionParticipant updateStreamGroups:]";
          __int16 v25 = 1024;
          int v26 = 804;
          __int16 v27 = 2080;
          uint32_t v28 = FourccToCStr([v9 streamGroupID]);
          __int16 v29 = 2112;
          int v30 = v12;
          long long v16 = " [%s] %s:%d Failed to update streamgroup=%s, Error=%@";
          uint64_t v17 = v15;
          uint32_t v18 = 48;
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            long long v13 = (__CFString *)[(VCSessionParticipant *)self performSelector:sel_logPrefix];
          }
          else {
            long long v13 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
            return 0;
          }
          uint64_t v19 = VRTraceErrorLogLevelToCSTR();
          uint64_t v20 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            return 0;
          }
          int v21 = 136316674;
          uint64_t v22 = v19;
          __int16 v23 = 2080;
          uint32_t v24 = "-[VCSessionParticipant updateStreamGroups:]";
          __int16 v25 = 1024;
          int v26 = 804;
          __int16 v27 = 2112;
          uint32_t v28 = (char *)v13;
          __int16 v29 = 2048;
          int v30 = self;
          __int16 v31 = 2080;
          uint64_t v32 = FourccToCStr([v9 streamGroupID]);
          __int16 v33 = 2112;
          __int16 v34 = v12;
          long long v16 = " [%s] %s:%d %@(%p) Failed to update streamgroup=%s, Error=%@";
          uint64_t v17 = v20;
          uint32_t v18 = 68;
        }
        _os_log_error_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v21, v18);
        return 0;
      }
    }
    uint64_t v6 = [a3 countByEnumeratingWithState:&v36 objects:v35 count:16];
    if (v6) {
      continue;
    }
    break;
  }
  return 0;
}

- (BOOL)isActiveMediaType:(unsigned int)a3
{
}

- (BOOL)isStreamGroupActive:(id)a3
{
}

- (id)updateActiveStateForStreamGroup:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  if (self->_state != 1) {
    return 0;
  }
  BOOL v4 = -[VCSessionParticipant isStreamGroupActive:](self, "isStreamGroupActive:");
  int v5 = [a3 state];
  int v6 = v5;
  if (!v4 || v5)
  {
    if (v5) {
      char v10 = v4;
    }
    else {
      char v10 = 1;
    }
    if (v10)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        long long v12 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 136316418;
          uint64_t v15 = v11;
          __int16 v16 = 2080;
          uint64_t v17 = "-[VCSessionParticipant updateActiveStateForStreamGroup:]";
          __int16 v18 = 1024;
          int v19 = 832;
          __int16 v20 = 2112;
          id v21 = a3;
          __int16 v22 = 1024;
          LODWORD(v23[0]) = v4;
          WORD2(v23[0]) = 1024;
          *(_DWORD *)((char *)v23 + 6) = v6 != 0;
          _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Ignore start/stop for stream group=%@ isStreamGroupActive=%d isStreamGroupStarted=%d", (uint8_t *)&v14, 0x32u);
        }
      }
    }
    else
    {
      [a3 stop];
    }
    return 0;
  }
  uint64_t v7 = (void *)[a3 start];
  if (v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v14 = 136316162;
        uint64_t v15 = v8;
        __int16 v16 = 2080;
        uint64_t v17 = "-[VCSessionParticipant updateActiveStateForStreamGroup:]";
        __int16 v18 = 1024;
        int v19 = 837;
        __int16 v20 = 2112;
        id v21 = a3;
        __int16 v22 = 2112;
        v23[0] = v7;
        _os_log_error_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to update stream group=%@ with error=%@", (uint8_t *)&v14, 0x30u);
      }
    }
  }
  return v7;
}

- (id)startStreamGroups
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v55 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!v55)
  {
    id v36 = +[VCSessionErrorUtils VCSessionParticipantErrorEvent:errorPath:](VCSessionErrorUtils, "VCSessionParticipantErrorEvent:errorPath:", 10, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSessionParticipant.m", 846));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3
      && (VRTraceErrorLogLevelToCSTR(), os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
      -[VCSessionParticipant startStreamGroups]();
      if (!v36) {
        goto LABEL_43;
      }
    }
    else if (!v36)
    {
      goto LABEL_43;
    }
    goto LABEL_36;
  }
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  obuint64_t j = (id)[(NSMutableDictionary *)self->_streamGroups allValues];
  uint64_t v3 = [obj countByEnumeratingWithState:&v76 objects:v75 count:16];
  if (!v3) {
    goto LABEL_32;
  }
  uint64_t v4 = v3;
  int v5 = (os_log_t *)MEMORY[0x1E4F47A50];
  uint64_t v6 = *(void *)v77;
  while (2)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v77 != v6) {
        objc_enumerationMutation(obj);
      }
      uint64_t v8 = *(void **)(*((void *)&v76 + 1) + 8 * i);
      BOOL v9 = [(VCSessionParticipant *)self isStreamGroupActive:v8];
      char v10 = (VCSessionParticipant *)objc_opt_class();
      if (v9)
      {
        if (v10 == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v27 = VRTraceErrorLogLevelToCSTR();
            os_log_t v28 = *v5;
            if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v29 = FourccToCStr([v8 streamGroupID]);
              int v30 = [v8 streamToken];
              *(_DWORD *)buf = 136316162;
              uint64_t v62 = v27;
              __int16 v63 = 2080;
              v64 = "-[VCSessionParticipant startStreamGroups]";
              __int16 v65 = 1024;
              int v66 = 855;
              __int16 v67 = 2080;
              v68 = v29;
              int v5 = (os_log_t *)MEMORY[0x1E4F47A50];
              __int16 v69 = 1024;
              *(_DWORD *)v70 = v30;
              __int16 v16 = v28;
              uint64_t v17 = " [%s] %s:%d Starting stream group. streamGroupID=%s, streamToken=%u";
              uint32_t v18 = 44;
              goto LABEL_23;
            }
          }
        }
        else
        {
          uint64_t v11 = &stru_1F3D3E450;
          if (objc_opt_respondsToSelector()) {
            uint64_t v11 = (__CFString *)[(VCSessionParticipant *)self performSelector:sel_logPrefix];
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v12 = VRTraceErrorLogLevelToCSTR();
            os_log_t v13 = *v5;
            if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
            {
              int v14 = FourccToCStr([v8 streamGroupID]);
              int v15 = [v8 streamToken];
              *(_DWORD *)buf = 136316674;
              uint64_t v62 = v12;
              __int16 v63 = 2080;
              v64 = "-[VCSessionParticipant startStreamGroups]";
              __int16 v65 = 1024;
              int v66 = 855;
              __int16 v67 = 2112;
              v68 = v11;
              __int16 v69 = 2048;
              *(void *)v70 = self;
              *(_WORD *)&v70[8] = 2080;
              *(void *)&v70[10] = v14;
              int v5 = (os_log_t *)MEMORY[0x1E4F47A50];
              __int16 v71 = 1024;
              int v72 = v15;
              __int16 v16 = v13;
              uint64_t v17 = " [%s] %s:%d %@(%p) Starting stream group. streamGroupID=%s, streamToken=%u";
              uint32_t v18 = 64;
LABEL_23:
              _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, v17, buf, v18);
            }
          }
        }
        uint64_t v31 = [v8 start];
        if (!v31)
        {
          [v55 addObject:v8];
          continue;
        }
        id v36 = (id)v31;
        if ((VCSessionParticipant *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v43 = VRTraceErrorLogLevelToCSTR();
            os_log_t v44 = *v5;
            if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
            {
              __int16 v45 = FourccToCStr([v8 streamGroupID]);
              int v46 = [v8 streamToken];
              *(_DWORD *)buf = 136316418;
              uint64_t v62 = v43;
              __int16 v63 = 2080;
              v64 = "-[VCSessionParticipant startStreamGroups]";
              __int16 v65 = 1024;
              int v66 = 857;
              __int16 v67 = 2080;
              v68 = v45;
              __int16 v69 = 1024;
              *(_DWORD *)v70 = v46;
              *(_WORD *)&v70[4] = 2112;
              *(void *)&v70[6] = v36;
              __int16 v47 = " [%s] %s:%d Failed to start stream group. streamGroupID=%s streamToken=%u error=%@";
              int v48 = v44;
              uint32_t v49 = 54;
LABEL_54:
              _os_log_error_impl(&dword_1E1EA4000, v48, OS_LOG_TYPE_ERROR, v47, buf, v49);
            }
          }
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            int v42 = (__CFString *)[(VCSessionParticipant *)self performSelector:sel_logPrefix];
          }
          else {
            int v42 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v50 = VRTraceErrorLogLevelToCSTR();
            os_log_t v51 = *v5;
            if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
            {
              v52 = FourccToCStr([v8 streamGroupID]);
              int v53 = [v8 streamToken];
              *(_DWORD *)buf = 136316930;
              uint64_t v62 = v50;
              __int16 v63 = 2080;
              v64 = "-[VCSessionParticipant startStreamGroups]";
              __int16 v65 = 1024;
              int v66 = 857;
              __int16 v67 = 2112;
              v68 = v42;
              __int16 v69 = 2048;
              *(void *)v70 = self;
              *(_WORD *)&v70[8] = 2080;
              *(void *)&v70[10] = v52;
              __int16 v71 = 1024;
              int v72 = v53;
              __int16 v73 = 2112;
              id v74 = v36;
              __int16 v47 = " [%s] %s:%d %@(%p) Failed to start stream group. streamGroupID=%s streamToken=%u error=%@";
              int v48 = v51;
              uint32_t v49 = 74;
              goto LABEL_54;
            }
          }
        }
LABEL_36:
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        uint64_t v37 = [v55 countByEnumeratingWithState:&v57 objects:v56 count:16];
        if (v37)
        {
          uint64_t v38 = v37;
          uint64_t v39 = *(void *)v58;
          do
          {
            for (uint64_t j = 0; j != v38; ++j)
            {
              if (*(void *)v58 != v39) {
                objc_enumerationMutation(v55);
              }
              [*(id *)(*((void *)&v57 + 1) + 8 * j) stop];
            }
            uint64_t v38 = [v55 countByEnumeratingWithState:&v57 objects:v56 count:16];
          }
          while (v38);
        }
        goto LABEL_43;
      }
      if (v10 == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v32 = VRTraceErrorLogLevelToCSTR();
          os_log_t v33 = *v5;
          if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v34 = FourccToCStr([v8 streamGroupID]);
            int v35 = [v8 streamToken];
            *(_DWORD *)buf = 136316162;
            uint64_t v62 = v32;
            __int16 v63 = 2080;
            v64 = "-[VCSessionParticipant startStreamGroups]";
            __int16 v65 = 1024;
            int v66 = 852;
            __int16 v67 = 2080;
            v68 = v34;
            __int16 v69 = 1024;
            *(_DWORD *)v70 = v35;
            uint32_t v24 = v33;
            __int16 v25 = " [%s] %s:%d streamGroupID=%s, streamToken=%u is inactive";
            uint32_t v26 = 44;
            goto LABEL_29;
          }
        }
      }
      else
      {
        int v19 = &stru_1F3D3E450;
        if (objc_opt_respondsToSelector()) {
          int v19 = (__CFString *)[(VCSessionParticipant *)self performSelector:sel_logPrefix];
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v20 = VRTraceErrorLogLevelToCSTR();
          os_log_t v21 = *v5;
          if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v22 = FourccToCStr([v8 streamGroupID]);
            int v23 = [v8 streamToken];
            *(_DWORD *)buf = 136316674;
            uint64_t v62 = v20;
            __int16 v63 = 2080;
            v64 = "-[VCSessionParticipant startStreamGroups]";
            __int16 v65 = 1024;
            int v66 = 852;
            __int16 v67 = 2112;
            v68 = v19;
            __int16 v69 = 2048;
            *(void *)v70 = self;
            *(_WORD *)&v70[8] = 2080;
            *(void *)&v70[10] = v22;
            int v5 = (os_log_t *)MEMORY[0x1E4F47A50];
            __int16 v71 = 1024;
            int v72 = v23;
            uint32_t v24 = v21;
            __int16 v25 = " [%s] %s:%d %@(%p) streamGroupID=%s, streamToken=%u is inactive";
            uint32_t v26 = 64;
LABEL_29:
            _os_log_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_DEFAULT, v25, buf, v26);
            continue;
          }
        }
      }
    }
    uint64_t v4 = [obj countByEnumeratingWithState:&v76 objects:v75 count:16];
    if (v4) {
      continue;
    }
    break;
  }
LABEL_32:
  id v36 = 0;
LABEL_43:

  return v36;
}

- (void)stopStreamGroups
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = (void *)[(NSMutableDictionary *)self->_streamGroups allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v7 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v6++) stop];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v7 count:16];
    }
    while (v4);
  }
}

- (id)startScreenGroup
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((VCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)int v15 = 136316418;
        *(void *)&v15[4] = v4;
        *(_WORD *)&v15[12] = 2080;
        *(void *)&v15[14] = "-[VCSessionParticipant startScreenGroup]";
        *(_WORD *)&v15[22] = 1024;
        LODWORD(v16) = 882;
        WORD2(v16) = 2112;
        *(void *)((char *)&v16 + 6) = [(VCSessionParticipant *)self screenGroup];
        HIWORD(v16) = 2112;
        uint64_t v17 = [(VCSessionParticipant *)self systemAudioGroup];
        *(_WORD *)uint32_t v18 = 1024;
        *(_DWORD *)&v18[2] = +[VCHardwareSettings supportsDedicatedSystemAudioStream];
        uint64_t v6 = " [%s] %s:%d screenStreamGroup=%@, sysaStreamGroup=%@, supportsDedicatedSystemAudioStream=%d";
        uint64_t v7 = v5;
        uint32_t v8 = 54;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, v15, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v3 = (__CFString *)[(VCSessionParticipant *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      long long v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)int v15 = 136316930;
        *(void *)&v15[4] = v9;
        *(_WORD *)&v15[12] = 2080;
        *(void *)&v15[14] = "-[VCSessionParticipant startScreenGroup]";
        *(_WORD *)&v15[22] = 1024;
        LODWORD(v16) = 882;
        WORD2(v16) = 2112;
        *(void *)((char *)&v16 + 6) = v3;
        HIWORD(v16) = 2048;
        uint64_t v17 = self;
        *(_WORD *)uint32_t v18 = 2112;
        *(void *)&v18[2] = [(VCSessionParticipant *)self screenGroup];
        *(_WORD *)&v18[10] = 2112;
        *(void *)&v18[12] = [(VCSessionParticipant *)self systemAudioGroup];
        *(_WORD *)&v18[20] = 1024;
        *(_DWORD *)&v18[22] = +[VCHardwareSettings supportsDedicatedSystemAudioStream];
        uint64_t v6 = " [%s] %s:%d %@(%p) screenStreamGroup=%@, sysaStreamGroup=%@, supportsDedicatedSystemAudioStream=%d";
        uint64_t v7 = v10;
        uint32_t v8 = 74;
        goto LABEL_11;
      }
    }
  }
  uint64_t v11 = objc_msgSend(-[VCSessionParticipant screenGroup](self, "screenGroup", *(_OWORD *)v15, *(void *)&v15[16], v16, v17, *(_OWORD *)v18, *(_OWORD *)&v18[16]), "start");
  if (v11)
  {
    os_log_t v13 = (void *)v11;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionParticipant startScreenGroup]();
      }
    }
    goto LABEL_23;
  }
  if ([(VCSessionParticipant *)self systemAudioGroup])
  {
    uint64_t v12 = objc_msgSend(-[VCSessionParticipant systemAudioGroup](self, "systemAudioGroup"), "start");
    if (v12)
    {
      os_log_t v13 = (void *)v12;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipant startScreenGroup]();
        }
      }
LABEL_23:
      [(VCSessionParticipant *)self stopScreenGroup];
      return v13;
    }
  }
  [(VCSessionParticipant *)self startSystemAudioCapture];
  [(VCSessionParticipant *)self swapScreenStreamGroupSyncSourceWithState:2];
  return 0;
}

- (id)stopScreenGroup
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((VCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_12;
    }
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_DWORD *)int v14 = 136316162;
    *(void *)&v14[4] = v4;
    *(_WORD *)&v14[12] = 2080;
    *(void *)&v14[14] = "-[VCSessionParticipant stopScreenGroup]";
    *(_WORD *)&v14[22] = 1024;
    LODWORD(v15) = 901;
    WORD2(v15) = 2112;
    *(void *)((char *)&v15 + 6) = [(VCSessionParticipant *)self screenGroup];
    HIWORD(v15) = 2112;
    long long v16 = [(VCSessionParticipant *)self systemAudioGroup];
    uint64_t v6 = " [%s] %s:%d streamGroup: %@, streamGroup: %@";
    uint64_t v7 = v5;
    uint32_t v8 = 48;
    goto LABEL_11;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v3 = (__CFString *)[(VCSessionParticipant *)self performSelector:sel_logPrefix];
  }
  else {
    uint64_t v3 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    long long v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int v14 = 136316674;
      *(void *)&v14[4] = v9;
      *(_WORD *)&v14[12] = 2080;
      *(void *)&v14[14] = "-[VCSessionParticipant stopScreenGroup]";
      *(_WORD *)&v14[22] = 1024;
      LODWORD(v15) = 901;
      WORD2(v15) = 2112;
      *(void *)((char *)&v15 + 6) = v3;
      HIWORD(v15) = 2048;
      long long v16 = self;
      *(_WORD *)uint64_t v17 = 2112;
      *(void *)&v17[2] = [(VCSessionParticipant *)self screenGroup];
      *(_WORD *)&v17[10] = 2112;
      *(void *)&v17[12] = [(VCSessionParticipant *)self systemAudioGroup];
      uint64_t v6 = " [%s] %s:%d %@(%p) streamGroup: %@, streamGroup: %@";
      uint64_t v7 = v10;
      uint32_t v8 = 68;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, v14, v8);
    }
  }
LABEL_12:
  uint64_t v11 = objc_msgSend(-[VCSessionParticipant screenGroup](self, "screenGroup", *(_OWORD *)v14, *(void *)&v14[16], v15, v16, *(_OWORD *)v17, *(void *)&v17[16], v18), "stop");
  if ([(VCSessionParticipant *)self systemAudioGroup]) {
    uint64_t v12 = objc_msgSend(-[VCSessionParticipant systemAudioGroup](self, "systemAudioGroup"), "stop");
  }
  else {
    uint64_t v12 = 0;
  }
  [(VCSessionParticipant *)self stopSystemAudioCapture];
  if (v11) {
    return v11;
  }
  else {
    return v12;
  }
}

- (id)stopMediaStreams:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [a3 countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  uint64_t v6 = 0;
  uint64_t v7 = *(void *)v14;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v14 != v7) {
        objc_enumerationMutation(a3);
      }
      uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
      if (objc_msgSend((id)objc_msgSend(v9, "stream"), "state"))
      {
        uint64_t v10 = objc_msgSend((id)objc_msgSend(v9, "stream"), "stop");
        if (v10) {
          uint64_t v6 = (void *)v10;
        }
      }
    }
    uint64_t v5 = [a3 countByEnumeratingWithState:&v13 objects:v12 count:16];
  }
  while (v5);
  return v6;
}

- (id)stopAudioStreams
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(VCSessionParticipant *)self stopSystemAudioCapture];
  if ((VCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_12;
    }
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    audioIO = self->_audioIO;
    *(_DWORD *)long long v15 = 136315906;
    *(void *)&v15[4] = v4;
    *(_WORD *)&v15[12] = 2080;
    *(void *)&v15[14] = "-[VCSessionParticipant stopAudioStreams]";
    *(_WORD *)&v15[22] = 1024;
    LODWORD(v16) = 941;
    WORD2(v16) = 2048;
    *(void *)((char *)&v16 + 6) = audioIO;
    uint64_t v7 = " [%s] %s:%d Stopping audioIO=%p";
    uint32_t v8 = v5;
    uint32_t v9 = 38;
    goto LABEL_11;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v3 = (__CFString *)[(VCSessionParticipant *)self performSelector:sel_logPrefix];
  }
  else {
    uint64_t v3 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint64_t v11 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = self->_audioIO;
      *(_DWORD *)long long v15 = 136316418;
      *(void *)&v15[4] = v10;
      *(_WORD *)&v15[12] = 2080;
      *(void *)&v15[14] = "-[VCSessionParticipant stopAudioStreams]";
      *(_WORD *)&v15[22] = 1024;
      LODWORD(v16) = 941;
      WORD2(v16) = 2112;
      *(void *)((char *)&v16 + 6) = v3;
      HIWORD(v16) = 2048;
      uint64_t v17 = self;
      LOWORD(v18) = 2048;
      *(void *)((char *)&v18 + 2) = v12;
      uint64_t v7 = " [%s] %s:%d %@(%p) Stopping audioIO=%p";
      uint32_t v8 = v11;
      uint32_t v9 = 58;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, v15, v9);
    }
  }
LABEL_12:
  if ([(VCAudioIO *)self->_audioIO state] == 2) {
    id v13 = [(VCAudioIO *)self->_audioIO stop];
  }
  else {
    id v13 = 0;
  }
  [(VCSessionParticipant *)self stopAudioIOCompletion];
  return v13;
}

- (id)setAudioStreamGroupsPaused:(BOOL)a3
{
  return [(VCSessionParticipant *)self setPaused:a3 onStreamGroups:self->_micStreamGroups];
}

- (id)setCameraStreamGroupsPaused:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(VCSessionParticipant *)self cameraGroups];

  return [(VCSessionParticipant *)self setPaused:v3 onStreamGroups:v5];
}

- (id)setPaused:(BOOL)a3 onStreamGroups:(id)a4
{
  BOOL v5 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [a4 countByEnumeratingWithState:&v16 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint32_t v8 = 0;
    uint64_t v9 = *(void *)v17;
    while (1)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(a4);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        int v12 = [v11 state];
        if (v5)
        {
          if (v12 == 1)
          {
            uint64_t v13 = [v11 pause];
            goto LABEL_12;
          }
        }
        else if (v12 == 2)
        {
          uint64_t v13 = [v11 resume];
          goto LABEL_12;
        }
        uint64_t v13 = 0;
LABEL_12:
        if (v13) {
          uint32_t v8 = (void *)v13;
        }
      }
      uint64_t v7 = [a4 countByEnumeratingWithState:&v16 objects:v15 count:16];
      if (!v7) {
        return v8;
      }
    }
  }
  return 0;
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

- (id)pauseAudioStreams:(BOOL)a3
{
  if (a3) {
    [(VCSessionParticipant *)self onPauseAudioStreams];
  }
  else {
    [(VCSessionParticipant *)self onDidResumeAudio];
  }
  return 0;
}

+ (void)addCodecModesForPayload:(int)a3 toCodecConfig:(id)a4
{
  switch(a3)
  {
    case 'q':
      uint64_t v5 = 25;
      int v6 = &unk_1F3DC8A00;
      break;
    case 'l':
      uint64_t v5 = 14;
      int v6 = &unk_1F3DC89D0;
      break;
    case 'b':
      uint64_t v5 = 1;
      int v6 = &unk_1F3DC89E8;
      break;
    default:
      return;
  }
  [a4 setSupportedModes:v6];

  [a4 setPreferredMode:v5];
}

- (BOOL)setupAudioStreamConfiguration:(id)a3 audioRules:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  int v21 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "streamGroupID");
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  int v6 = (void *)[a4 rules];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v36 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v37;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v37 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = [*(id *)(*((void *)&v36 + 1) + 8 * v10) payload];
      if (v11 == 20)
      {
        [a3 setupRedWithRxPayload:20 txPayload:20];
      }
      else
      {
        uint64_t v12 = v11;
        uint64_t v13 = [[VCAudioStreamCodecConfig alloc] initWithCodecType:+[VCPayloadUtils codecTypeForPayload:v11]];
        long long v14 = v13;
        if (v12 == 101 && self->_isLowLatencyAudio && v21 == 1835623282) {
          [(VCAudioStreamCodecConfig *)v13 setPTime:10];
        }
        if (!v14)
        {
          if ((VCSessionParticipant *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
              goto LABEL_35;
            }
            VRTraceErrorLogLevelToCSTR();
            BOOL v16 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
            if (v16)
            {
              -[VCSessionParticipant setupAudioStreamConfiguration:audioRules:]();
              goto LABEL_35;
            }
          }
          else
          {
            if (objc_opt_respondsToSelector()) {
              long long v17 = (__CFString *)[(VCSessionParticipant *)self performSelector:sel_logPrefix];
            }
            else {
              long long v17 = &stru_1F3D3E450;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              uint64_t v18 = VRTraceErrorLogLevelToCSTR();
              long long v19 = *MEMORY[0x1E4F47A50];
              BOOL v16 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
              if (!v16) {
                return v16;
              }
              *(_DWORD *)buf = 136316418;
              uint64_t v24 = v18;
              __int16 v25 = 2080;
              uint32_t v26 = "-[VCSessionParticipant setupAudioStreamConfiguration:audioRules:]";
              __int16 v27 = 1024;
              int v28 = 1065;
              __int16 v29 = 2112;
              int v30 = v17;
              __int16 v31 = 2048;
              uint64_t v32 = self;
              __int16 v33 = 1024;
              int v34 = v12;
              _os_log_error_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate codec config for payload=%d!", buf, 0x36u);
            }
LABEL_35:
            LOBYTE(v16) = 0;
          }
          return v16;
        }
        +[VCSessionParticipant addCodecModesForPayload:v12 toCodecConfig:v14];
        [a3 addCodecConfiguration:v14];
        objc_msgSend(a3, "setForceEVSWideBand:", -[VCHardwareSettingsEmbedded deviceClass](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "deviceClass") == 6);
        if ([+[VCDefaults sharedInstance] forceEVSWideBand])
        {
          [a3 setForceEVSWideBand:1];
        }
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v36 objects:v35 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  [a3 setAudioRules:a4];
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "audioRules"), "rules"), "count"))
  {
    if (objc_msgSend((id)objc_msgSend(a3, "codecConfigurations"), "count"))
    {
      LOBYTE(v16) = 1;
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_35;
      }
      VRTraceErrorLogLevelToCSTR();
      BOOL v16 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (v16)
      {
        -[VCSessionParticipant setupAudioStreamConfiguration:audioRules:]();
        goto LABEL_35;
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_35;
    }
    VRTraceErrorLogLevelToCSTR();
    BOOL v16 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (v16)
    {
      -[VCSessionParticipant setupAudioStreamConfiguration:audioRules:]();
      goto LABEL_35;
    }
  }
  return v16;
}

- (void)updateOneToOneVideoStreamCustomResolution:(id)a3 videoSettings:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  int v6 = objc_msgSend((id)objc_msgSend(a4, "videoRuleCollections"), "supportedPayloads");
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = [*(id *)(*((void *)&v14 + 1) + 8 * i) unsignedIntValue];
        if (!v9) {
          uint64_t v9 = objc_msgSend((id)objc_msgSend(a4, "videoRuleCollections"), "getVideoRulesForTransport:payload:encodingType:", 1, v12, 1);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v13 count:16];
    }
    while (v8);
  }
  else
  {
    uint64_t v9 = 0;
  }
  if (+[VideoUtil videoResolutionForWidth:height:](VideoUtil, "videoResolutionForWidth:height:", objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", 0), "iWidth"), objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", 0), "iHeight")) == 27)
  {
    objc_msgSend(a3, "setCustomWidth:", (int)objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", 0), "iWidth"));
    objc_msgSend(a3, "setCustomHeight:", (int)objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", 0), "iHeight"));
  }
}

- (BOOL)isOneToOneTemporalSupportedForSettings:(id)a3 streamDirection:(int64_t)a4
{
  if (a4 == 1)
  {
    BOOL v4 = (void *)[a3 videoRuleCollections];
    uint64_t v5 = 1;
    return [v4 getVideoRulesForTransport:1 payload:100 encodingType:v5] != 0;
  }
  if (a4 == 2)
  {
    BOOL v4 = (void *)[a3 videoRuleCollections];
    uint64_t v5 = 2;
    return [v4 getVideoRulesForTransport:1 payload:100 encodingType:v5] != 0;
  }
  return 0;
}

- (id)newOneToOneVideoStreamMultiwayConfiguration:(unsigned __int8)a3 streamGroupId:(unsigned int)a4 videoSettings:(id)a5 streamDirection:(int64_t)a6
{
  uint64_t v8 = *(void *)&a4;
  uint64_t v9 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = objc_alloc_init(VCMediaStreamMultiwayConfigVideo);
  if (v11)
  {
    int v21 = self;
    int64_t v22 = a6;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v12 = objc_msgSend((id)objc_msgSend(a5, "videoRuleCollections"), "supportedPayloads");
    uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v23 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      long long v15 = 0;
      uint64_t v16 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v12);
          }
          uint64_t v18 = [*(id *)(*((void *)&v24 + 1) + 8 * i) unsignedIntValue];
          [(VCMediaStreamMultiwayConfigVideo *)v11 addPayload:v18];
          if (!v15) {
            long long v15 = objc_msgSend((id)objc_msgSend(a5, "videoRuleCollections"), "getVideoRulesForTransport:payload:encodingType:", 1, v18, v9);
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v23 count:16];
      }
      while (v14);
    }
    else
    {
      long long v15 = 0;
    }
    [(VCMediaStreamMultiwayConfig *)v11 setIsOneToOne:1];
    [(VCMediaStreamMultiwayConfig *)v11 setStreamGroupID:v8];
    -[VCMediaStreamMultiwayConfigVideo setResolution:](v11, "setResolution:", +[VideoUtil videoResolutionForWidth:height:](VideoUtil, "videoResolutionForWidth:height:", objc_msgSend((id)objc_msgSend(v15, "objectAtIndexedSubscript:", 0), "iWidth"), objc_msgSend((id)objc_msgSend(v15, "objectAtIndexedSubscript:", 0), "iHeight")));
    objc_msgSend((id)objc_msgSend(v15, "objectAtIndexedSubscript:", 0), "fRate");
    [(VCMediaStreamMultiwayConfigVideo *)v11 setFramerate:v19];
    [(VCMediaStreamMultiwayConfigVideo *)v11 setKeyFrameInterval:0];
    if (v8 == 1650745716
      || v8 == 1935897189
      && [(VCSessionParticipant *)v21 isOneToOneTemporalSupportedForSettings:a5 streamDirection:v22])
    {
      [(VCMediaStreamMultiwayConfigVideo *)v11 setIsTemporalStream:1];
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCSessionParticipant newOneToOneVideoStreamMultiwayConfiguration:streamGroupId:videoSettings:streamDirection:]();
    }
  }
  return v11;
}

- (BOOL)didNegotiateStreamGroupWithID:(unsigned int)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v4 = [(VCSessionMediaNegotiator *)self->_mediaNegotiator negotiatedStreamGroups];
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v10 count:16];
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
        if ([*(id *)(*((void *)&v11 + 1) + 8 * v8) groupID] == a3)
        {
          LOBYTE(v5) = 1;
          return v5;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v10 count:16];
      uint64_t v6 = v5;
      if (v5) {
        continue;
      }
      break;
    }
  }
  return v5;
}

- (BOOL)supportsLowLatencyAudio
{
  if (+[VCHardwareSettings deviceClass] != 8) {
    return 0;
  }
  if (self->_oneToOneModeEnabled)
  {
    if ((objc_msgSend(-[VCSessionMediaNegotiator negotiatedResultsForGroupID:](self->_mediaNegotiator, "negotiatedResultsForGroupID:", 1650745716), "isSupported") & 1) == 0)
    {
      id v3 = [(VCSessionMediaNegotiator *)self->_mediaNegotiator negotiatedResultsForGroupID:1718909044];
      return [v3 isSupported];
    }
    return 1;
  }
  if ([(VCSessionParticipant *)self didNegotiateStreamGroupWithID:1650745716]
    || [(VCSessionParticipant *)self didNegotiateStreamGroupWithID:1718909044])
  {
    return 1;
  }

  return [(VCSessionParticipant *)self didNegotiateStreamGroupWithID:1717854580];
}

- (id)newOneToOneAudioStreamConfigWithAudioSettings:(id)a3 streamDirection:(int64_t)a4 streamGroupId:(unsigned int)a5 streamSsrc:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  long long v11 = objc_alloc_init(VCSessionParticipantAudioStreamConfig);
  if (v11)
  {
    long long v12 = v11;
    [(VCMediaStreamConfig *)v11 setDirection:a4];
    if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2) {
      [(VCMediaStreamConfig *)v12 setRemoteSSRC:v6];
    }
    [(VCAudioStreamConfig *)v12 setAudioStreamMode:5];
    [(VCAudioStreamConfig *)v12 setIsHigherAudioREDCutoverU1Enabled:[(VCAudioRuleCollection *)self->_supportedAudioRules isHigherAudioREDCutoverU1Enabled]];
    [(VCAudioStreamConfig *)v12 setSupportsAdaptation:a5 != 1937339233];
    [(VCAudioStreamConfig *)v12 setOneToOneOperatingMode:[(VCSessionParticipant *)self operatingMode]];
    [(VCAudioStreamConfig *)v12 setBundlingScheme:1];
    long long v13 = objc_alloc_init(VCMediaStreamMultiwayConfigAudio);
    if (v13)
    {
      long long v14 = v13;
      uint64_t v15 = objc_alloc_init(VCMediaStreamRateControlConfig);
      if (v15)
      {
        uint64_t v16 = v15;
        int64_t v44 = a4;
        long long v17 = [VCAudioRuleCollection alloc];
        uint64_t v18 = v14;
        uint64_t v19 = [a3 primaryPayload];
        uint64_t v20 = [a3 dtxPayload];
        int v46 = v16;
        unsigned int v45 = a5;
        uint64_t v21 = [a3 redPayload];
        uint64_t v22 = [a3 secondaryPayloads];
        __int16 v47 = self;
        uint64_t v23 = [a3 allowSwitching];
        uint64_t v24 = [a3 useSBR];
        LODWORD(v43) = 480;
        uint64_t v25 = v19;
        long long v14 = v18;
        uint64_t v26 = v21;
        long long v27 = v46;
        id v28 = [(VCAudioRuleCollection *)v17 initPrimaryPayload:v25 dtxPayload:v20 redPayload:v26 secondaryPayloads:v22 allowAudioSwitching:v23 sbr:v24 aacBlockSize:v43];
        [(VCMediaStreamMultiwayConfig *)v18 setIsOneToOne:1];
        [(VCMediaStreamMultiwayConfig *)v18 setSsrc:v6];
        [(VCMediaStreamMultiwayConfig *)v18 setStreamGroupID:v45];
        [(VCMediaStreamMultiwayConfigAudio *)v18 setAudioRules:v28];
        [(VCMediaStreamConfig *)v12 setMultiwayConfig:v18];
        [(VCMediaStreamConfig *)v12 setRateControlConfig:v46];
        [(VCAudioStreamConfig *)v12 setExternalIOFormat:[(VCAudioIO *)v47->_audioIO clientFormat]];
        if (v47->_deviceRole == 3) {
          uint64_t v29 = 6;
        }
        else {
          uint64_t v29 = 5;
        }
        [(VCAudioStreamConfig *)v12 setAudioStreamMode:v29];
        [(VCAudioStreamConfig *)v12 setShouldApplyRedAsBoolean:1];
        [(VCMediaStreamConfig *)v12 setRtpTimestampRate:[(VCSessionParticipant *)v47 preferredRTPTimestampRateForGroupID:[(VCMediaStreamMultiwayConfig *)[(VCMediaStreamConfig *)v12 multiwayConfig] streamGroupID]]];
        if (v45 == 1835623282) {
          [(VCAudioStreamConfig *)v12 setIsLowLatency:[(VCSessionParticipant *)v47 supportsLowLatencyAudio]];
        }
        if ([(VCSessionParticipant *)v47 setupAudioStreamConfiguration:v12 audioRules:[(VCMediaStreamMultiwayConfigAudio *)v18 audioRules]])
        {
          long long v49 = 0u;
          long long v50 = 0u;
          if ([a3 redPayload] == 20) {
            int v30 = &unk_1F3DC8A18;
          }
          else {
            int v30 = &unk_1F3DC8A30;
          }
          long long v51 = 0uLL;
          long long v52 = 0uLL;
          uint64_t v31 = [v30 countByEnumeratingWithState:&v49 objects:v48 count:16];
          if (v31)
          {
            uint64_t v32 = v31;
            uint64_t v33 = *(void *)v50;
            do
            {
              for (uint64_t i = 0; i != v32; ++i)
              {
                if (*(void *)v50 != v33) {
                  objc_enumerationMutation(v30);
                }
                -[VCAudioStreamConfig addSupportedNumRedundantPayload:](v12, "addSupportedNumRedundantPayload:", [*(id *)(*((void *)&v49 + 1) + 8 * i) intValue]);
              }
              uint64_t v32 = [v30 countByEnumeratingWithState:&v49 objects:v48 count:16];
            }
            while (v32);
          }
          if (-[VCSessionParticipant completeStreamSetup:rtpCipherSuite:](v47, "completeStreamSetup:rtpCipherSuite:", v12, [a3 cipherSuite]))
          {
            if (v44 == 2)
            {
              [(VCMediaStreamConfig *)v12 setRtcpEnabled:1];
              [(VCMediaStreamConfig *)v12 setRtcpSendInterval:5.0];
            }
            int v35 = 0;
            goto LABEL_26;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCSessionParticipant newOneToOneAudioStreamConfigWithAudioSettings:streamDirection:streamGroupId:streamSsrc:].cold.4();
            }
LABEL_60:
            int v35 = v12;
            long long v12 = 0;
            long long v27 = v46;
            goto LABEL_26;
          }
        }
        else
        {
          if ((VCSessionParticipant *)objc_opt_class() != v47)
          {
            if (objc_opt_respondsToSelector()) {
              long long v38 = (__CFString *)[(VCSessionParticipant *)v47 performSelector:sel_logPrefix];
            }
            else {
              long long v38 = &stru_1F3D3E450;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              uint64_t v41 = VRTraceErrorLogLevelToCSTR();
              int v42 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316162;
                uint64_t v54 = v41;
                __int16 v55 = 2080;
                v56 = "-[VCSessionParticipant newOneToOneAudioStreamConfigWithAudioSettings:streamDirection:streamGroupId:streamSsrc:]";
                __int16 v57 = 1024;
                int v58 = 1220;
                __int16 v59 = 2112;
                long long v60 = v38;
                __int16 v61 = 2048;
                uint64_t v62 = v47;
                _os_log_error_impl(&dword_1E1EA4000, v42, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to setup the audio stream config", buf, 0x30u);
              }
            }
            goto LABEL_60;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCSessionParticipant newOneToOneAudioStreamConfigWithAudioSettings:streamDirection:streamGroupId:streamSsrc:].cold.5();
            }
            goto LABEL_60;
          }
        }
      }
      else
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSessionParticipant newOneToOneAudioStreamConfigWithAudioSettings:streamDirection:streamGroupId:streamSsrc:]();
          }
        }
        long long v27 = 0;
        id v28 = 0;
      }
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipant newOneToOneAudioStreamConfigWithAudioSettings:streamDirection:streamGroupId:streamSsrc:]();
        }
      }
      long long v27 = 0;
      id v28 = 0;
      long long v14 = 0;
    }
    int v35 = v12;
    long long v12 = 0;
    goto LABEL_26;
  }
  if ((VCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionParticipant newOneToOneAudioStreamConfigWithAudioSettings:streamDirection:streamGroupId:streamSsrc:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      long long v37 = (__CFString *)[(VCSessionParticipant *)self performSelector:sel_logPrefix];
    }
    else {
      long long v37 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v39 = VRTraceErrorLogLevelToCSTR();
      uint64_t v40 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v54 = v39;
        __int16 v55 = 2080;
        v56 = "-[VCSessionParticipant newOneToOneAudioStreamConfigWithAudioSettings:streamDirection:streamGroupId:streamSsrc:]";
        __int16 v57 = 1024;
        int v58 = 1174;
        __int16 v59 = 2112;
        long long v60 = v37;
        __int16 v61 = 2048;
        uint64_t v62 = self;
        _os_log_error_impl(&dword_1E1EA4000, v40, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate stream configuration!", buf, 0x30u);
      }
    }
  }
  int v35 = 0;
  long long v27 = 0;
  long long v12 = 0;
  id v28 = 0;
  long long v14 = 0;
LABEL_26:

  return v12;
}

+ (void)applyVideoNegotiatedSettings:(id)a3 toStreamConfiguration:(id)a4 withFeatureStringDictionary:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "videoRuleCollections"), "supportedPayloads");
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v16 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v17 + 1) + 8 * v13);
        objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(a3, "featureStrings"), "objectForKeyedSubscript:", v14), v14);
        if (objc_msgSend((id)objc_msgSend(a3, "videoRuleCollections"), "getVideoRulesForTransport:payload:encodingType:", 1, objc_msgSend(v14, "unsignedIntValue"), 1))
        {
          [v7 addObject:v14];
        }
        if (objc_msgSend((id)objc_msgSend(a3, "videoRuleCollections"), "getVideoRulesForTransport:payload:encodingType:", 1, objc_msgSend(v14, "unsignedIntValue"), 2))
        {
          [v8 addObject:v14];
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v16 count:16];
    }
    while (v11);
  }
  [a4 setupRxPayloads:v8 featureStrings:v6];
  [a4 setupTxPayloads:v7 featureStrings:v6];
}

- (int)captureSourceIDFromStreamGroupID:(unsigned int)a3
{
  return 0;
}

- (BOOL)rtcpPSFBForFeedbackStoreBagConfig
{
  id v2 = +[GKSConnectivitySettings getStorebagValueForStorebagKey:@"vc-rtcp-psfb-for-loss-feedback" userDefaultKey:@"rtcpPSBFForLossFeedbackEnabled" defaultValue:&unk_1F3DC6A98 isDoubleType:1];
  double v3 = (double)arc4random() / 4294967300.0;
  [v2 doubleValue];
  return v3 < v4;
}

- (BOOL)rtcpPSFBForLTRAckStoreBagConfig
{
  id v2 = +[GKSConnectivitySettings getStorebagValueForStorebagKey:@"vc-rtcp-psfb-for-ltr-ack" userDefaultKey:@"rtcpPSBFForLTRAckEnabled" defaultValue:&unk_1F3DC6A98 isDoubleType:1];
  double v3 = (double)arc4random() / 4294967300.0;
  [v2 doubleValue];
  return v3 < v4;
}

- (unsigned)mediaControlVersionForStreamGroup:(unsigned int)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  unsigned __int8 result = 1;
  if ((int)a3 <= 1718909043)
  {
    if (a3 != 1650745716)
    {
      if (a3 == 1667329381) {
        return result;
      }
      goto LABEL_8;
    }
    return 2;
  }
  if (a3 == 1718909044) {
    return result;
  }
  if (a3 == 1935897189) {
    return 2;
  }
LABEL_8:
  if ((VCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      return 1;
    }
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return 1;
    }
    int v14 = 136315906;
    uint64_t v15 = v7;
    __int16 v16 = 2080;
    long long v17 = "-[VCSessionParticipant mediaControlVersionForStreamGroup:]";
    __int16 v18 = 1024;
    int v19 = 1290;
    __int16 v20 = 2080;
    uint64_t v21 = FourccToCStr(a3);
    uint64_t v9 = " [%s] %s:%d Media version control for unsupported streamGroupID=%s";
    uint64_t v10 = v8;
    uint32_t v11 = 38;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      id v6 = (__CFString *)[(VCSessionParticipant *)self performSelector:sel_logPrefix];
    }
    else {
      id v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      return 1;
    }
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    uint64_t v13 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return 1;
    }
    int v14 = 136316418;
    uint64_t v15 = v12;
    __int16 v16 = 2080;
    long long v17 = "-[VCSessionParticipant mediaControlVersionForStreamGroup:]";
    __int16 v18 = 1024;
    int v19 = 1290;
    __int16 v20 = 2112;
    uint64_t v21 = (char *)v6;
    __int16 v22 = 2048;
    uint64_t v23 = self;
    __int16 v24 = 2080;
    uint64_t v25 = FourccToCStr(a3);
    uint64_t v9 = " [%s] %s:%d %@(%p) Media version control for unsupported streamGroupID=%s";
    uint64_t v10 = v13;
    uint32_t v11 = 58;
  }
  _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v14, v11);
  return 1;
}

- (id)newOneToOneVideoStreamConfigWithStreamDirection:(int64_t)a3 streamGroupId:(unsigned int)a4 streamSsrc:(unsigned int)a5 encodingType:(unsigned __int8)a6 videoSettings:(id)a7
{
  uint64_t v8 = a6;
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a4;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = objc_alloc_init(VCSessionParticipantVideoStreamConfig);
  if (!v13)
  {
    if ((VCSessionParticipant *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipant newOneToOneVideoStreamConfigWithStreamDirection:streamGroupId:streamSsrc:encodingType:videoSettings:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        id v28 = (__CFString *)[(VCSessionParticipant *)self performSelector:sel_logPrefix];
      }
      else {
        id v28 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v29 = VRTraceErrorLogLevelToCSTR();
        int v30 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v31 = 136316162;
          uint64_t v32 = v29;
          __int16 v33 = 2080;
          int v34 = "-[VCSessionParticipant newOneToOneVideoStreamConfigWithStreamDirection:streamGroupId:streamSsrc:encoding"
                "Type:videoSettings:]";
          __int16 v35 = 1024;
          int v36 = 1302;
          __int16 v37 = 2112;
          long long v38 = v28;
          __int16 v39 = 2048;
          uint64_t v40 = self;
          _os_log_error_impl(&dword_1E1EA4000, v30, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate one to one video stream configuration!", (uint8_t *)&v31, 0x30u);
        }
      }
    }
    __int16 v18 = 0;
    uint64_t v26 = 0;
    __int16 v16 = 0;
    goto LABEL_33;
  }
  int v14 = v13;
  id v15 = [(VCSessionParticipant *)self newOneToOneVideoStreamMultiwayConfiguration:v8 streamGroupId:v10 videoSettings:a7 streamDirection:a3];
  if (v15)
  {
    __int16 v16 = v15;
    id v17 = [(VCSessionParticipant *)self newVideoRateControlConfigWithMediaControlInfoVersion:[(VCSessionParticipant *)self mediaControlVersionForStreamGroup:v10] enableMediaControlInfoGenerator:1 enableFeedbackController:v10 == 1667329381 isOneToOne:1];
    if (v17)
    {
      __int16 v18 = v17;
      [(VCMediaStreamConfig *)v14 setMultiwayConfig:v16];
      -[VCVideoStreamConfig setFramerate:](v14, "setFramerate:", [v16 framerate]);
      [(VCMediaStreamConfig *)v14 setDirection:a3];
      [(VCMediaStreamConfig *)v14 setRateControlConfig:v18];
      [(VCVideoStreamConfig *)v14 setType:3];
      -[VCVideoStreamConfig setSourceFramerate:](v14, "setSourceFramerate:", [v16 framerate]);
      [(VCVideoStreamConfig *)v14 setRemoteVideoInitialOrientation:2 * (v10 == 1935897189)];
      [(VCVideoStreamConfig *)v14 setKeyFrameInterval:0];
      [(VCMediaStreamConfig *)v14 setRtpTimestampRate:[(VCSessionParticipant *)self preferredRTPTimestampRateForGroupID:[(VCMediaStreamMultiwayConfig *)[(VCMediaStreamConfig *)v14 multiwayConfig] streamGroupID]]];
      [(VCVideoStreamConfig *)v14 setAudioIOSampleRate:self->_preferredIOSampleRate];
      int64_t v19 = +[VCHardwareSettings deviceClass];
      double v21 = 0.02;
      if (v19 != 8)
      {
        LODWORD(v21) = self->_preferredIOSamplesPerFrame;
        LODWORD(v20) = self->_preferredIOSampleRate;
        double v21 = (double)*(unint64_t *)&v21 / (double)v20;
      }
      [(VCVideoStreamConfig *)v14 setMinPlaybackInterval:v21];
      BOOL v22 = v10 == 1650745716 || v10 == 1718909044;
      double v23 = 0.0;
      if (v22) {
        double v23 = 0.02;
      }
      [(VCVideoStreamConfig *)v14 setMinRenderingDelay:v23];
      -[VCVideoStreamConfig setTemporalScalingEnabled:](v14, "setTemporalScalingEnabled:", [v16 isTemporalStream]);
      [(VCMediaStreamConfig *)v14 setCaptureSource:[(VCSessionParticipant *)self captureSourceIDFromStreamGroupID:v10]];
      -[VCVideoStreamConfig setVideoResolution:](v14, "setVideoResolution:", [v16 resolution]);
      if ([(VCVideoStreamConfig *)v14 videoResolution] == 27) {
        [(VCSessionParticipant *)self updateOneToOneVideoStreamCustomResolution:v14 videoSettings:a7];
      }
      if (a3 == 2)
      {
        [(VCVideoStreamConfig *)v14 setRxMaxBitrate:[(VCMediaNegotiatorResults *)[(VCSessionMediaNegotiator *)self->_mediaNegotiator negotiatedSettings] maxBandwidthWithArbiterMode:1 connectionType:3]];
        [(VCMediaStreamConfig *)v14 setRemoteSSRC:v9];
      }
      else
      {
        [(VCSessionParticipant *)self configureOneToOneVideoSendingConfigs:v14 streamGroupID:v10];
        [(VCMediaStreamConfig *)v14 setLocalSSRC:v9];
        [(VCMediaStreamMultiwayConfig *)[(VCMediaStreamConfig *)v14 multiwayConfig] setSsrc:v9];
      }
      +[VCSessionParticipant applyVideoNegotiatedSettings:toStreamConfiguration:withFeatureStringDictionary:](VCSessionParticipant, "applyVideoNegotiatedSettings:toStreamConfiguration:withFeatureStringDictionary:", a7, v14, [a7 featureStrings]);
      if (v10 == 1935897189)
      {
        [(VCMediaStreamConfig *)v14 setIsRTCPForLossFeedbackEnabled:[(VCSessionParticipant *)self rtcpPSFBForFeedbackStoreBagConfig]];
        [(VCMediaStreamConfig *)v14 setRtcpPSFB_LTRAckEnabled:[(VCSessionParticipant *)self rtcpPSFBForLTRAckStoreBagConfig]];
      }
      else if (v10 == 1718909044)
      {
        [(VCMediaStreamConfig *)v14 setRtcpPSFB_LTRAckEnabled:[(VCSessionParticipant *)self rtcpPSFBForLTRAckStoreBagConfig]];
        if (v8 == 1)
        {
          [(VCVideoStreamConfig *)v14 setEncoderUsage:4];
          [(VCVideoStreamConfig *)v14 setEncodingMode:0];
        }
      }
      if (-[VCSessionParticipant completeStreamSetup:rtpCipherSuite:](self, "completeStreamSetup:rtpCipherSuite:", v14, [a7 cipherSuite]))
      {
        if (a3 == 2)
        {
          [(VCMediaStreamConfig *)v14 setRtcpEnabled:1];
          [(VCVideoStreamConfig *)v14 setLtrpEnabled:1];
          [(VCMediaStreamConfig *)v14 setRtcpSendInterval:5.0];
          [(VCMediaStreamConfig *)v14 setRtcpTimeOutEnabled:1];
          [(VCVideoStreamConfig *)v14 setDeferredAssemblyEnabled:v10 == 1935897189];
          [(VCVideoStreamConfig *)v14 setLooseAVSyncEnabled:v10 == 1935897189];
        }
        else if (a3 == 1)
        {
          BOOL v24 = 1;
          if (v10 != 1667329381 && v10 != 1935897189) {
            BOOL v24 = v10 == 1718909044;
          }
          [(VCMediaStreamConfig *)v14 setRtcpEnabled:v24];
          BOOL v25 = 1;
          if (v10 != 1667329381 && v10 != 1935897189) {
            BOOL v25 = v10 == 1718909044;
          }
          [(VCVideoStreamConfig *)v14 setLtrpEnabled:v25];
        }
        [(VCSessionParticipant *)self setFECConfigurationOnStreamConfig:v14 withStreamGroupID:v10];
        uint64_t v26 = v14;
LABEL_33:
        int v14 = 0;
        goto LABEL_34;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipant newOneToOneVideoStreamConfigWithStreamDirection:streamGroupId:streamSsrc:encodingType:videoSettings:].cold.4();
        }
      }
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipant newOneToOneVideoStreamConfigWithStreamDirection:streamGroupId:streamSsrc:encodingType:videoSettings:]();
        }
      }
      __int16 v18 = 0;
    }
    uint64_t v26 = 0;
    goto LABEL_34;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCSessionParticipant newOneToOneVideoStreamConfigWithStreamDirection:streamGroupId:streamSsrc:encodingType:videoSettings:]();
    }
  }
  __int16 v18 = 0;
  uint64_t v26 = 0;
  __int16 v16 = 0;
LABEL_34:

  return v26;
}

- (void)configureOneToOneVideoSendingConfigs:(id)a3 streamGroupID:(unsigned int)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a4 == 1667329381)
  {
    unsigned int v6 = +[VCHardwareSettings maxOneToOneFramerateSupported];
    if ([a3 framerate] <= (unint64_t)v6) {
      goto LABEL_19;
    }
    if ((VCSessionParticipant *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_18;
      }
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      *(_DWORD *)id v15 = 136316162;
      *(void *)&v15[4] = v8;
      *(_WORD *)&v15[12] = 2080;
      *(void *)&v15[14] = "-[VCSessionParticipant configureOneToOneVideoSendingConfigs:streamGroupID:]";
      *(_WORD *)&v15[22] = 1024;
      LODWORD(v16) = 1398;
      WORD2(v16) = 2048;
      *(void *)((char *)&v16 + 6) = [a3 framerate];
      HIWORD(v16) = 1024;
      LODWORD(v17) = v6;
      uint64_t v10 = " [%s] %s:%d frameRate reduce config.framerate=%lu to frameRateByHW=%d due to hardware rule";
      uint32_t v11 = v9;
      uint32_t v12 = 44;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v7 = (__CFString *)[(VCSessionParticipant *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_18;
      }
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      int v14 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      *(_DWORD *)id v15 = 136316674;
      *(void *)&v15[4] = v13;
      *(_WORD *)&v15[12] = 2080;
      *(void *)&v15[14] = "-[VCSessionParticipant configureOneToOneVideoSendingConfigs:streamGroupID:]";
      *(_WORD *)&v15[22] = 1024;
      LODWORD(v16) = 1398;
      WORD2(v16) = 2112;
      *(void *)((char *)&v16 + 6) = v7;
      HIWORD(v16) = 2048;
      id v17 = self;
      LOWORD(v18) = 2048;
      *(void *)((char *)&v18 + 2) = [a3 framerate];
      WORD5(v18) = 1024;
      HIDWORD(v18) = v6;
      uint64_t v10 = " [%s] %s:%d %@(%p) frameRate reduce config.framerate=%lu to frameRateByHW=%d due to hardware rule";
      uint32_t v11 = v14;
      uint32_t v12 = 64;
    }
    _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, v15, v12);
LABEL_18:
    objc_msgSend(a3, "setFramerate:", v6, *(_OWORD *)v15, *(void *)&v15[16], v16, v17, v18);
    goto LABEL_19;
  }
  if (a4 != 1650745716)
  {
LABEL_19:
    objc_msgSend(a3, "setTxMaxBitrate:", -[VCMediaNegotiatorResults maxBandwidthWithArbiterMode:connectionType:](-[VCSessionMediaNegotiator negotiatedSettings](self->_mediaNegotiator, "negotiatedSettings"), "maxBandwidthWithArbiterMode:connectionType:", 1, 3));
    [a3 setUseInBandFEC:1];
    return;
  }
  [a3 setTxMinBitrate:90560];
  [a3 setTxMaxBitrate:140640];
  [a3 addTxBitrateTier:&unk_1F3DC6CF0];
  [a3 addTxBitrateTier:&unk_1F3DC6D08];

  [a3 setUseInBandFEC:0];
}

- (int64_t)participantMicrophoneToken
{
  id v2 = (void *)[(NSMutableDictionary *)self->_participantStreamTokens objectForKeyedSubscript:&unk_1F3DC6D20];

  return [v2 integerValue];
}

- (int64_t)participantVideoToken
{
  id v2 = (void *)[(NSMutableDictionary *)self->_participantStreamTokens objectForKeyedSubscript:&unk_1F3DC6D38];

  return [v2 integerValue];
}

- (id)cameraGroups
{
  double v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  id v4 = [(VCSessionParticipant *)self streamGroupWithID:1667329381];
  if (v4) {
    [v3 addObject:v4];
  }
  id v5 = [(VCSessionParticipant *)self streamGroupWithID:1667329399];
  if (v5) {
    [v3 addObject:v5];
  }
  return v3;
}

- (id)cameraGroupsExt
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  double v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [&unk_1F3DC8A48 countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(&unk_1F3DC8A48);
        }
        id v8 = -[VCSessionParticipant streamGroupWithID:](self, "streamGroupWithID:", [*(id *)(*((void *)&v11 + 1) + 8 * v7) intValue]);
        if (v8) {
          [v3 addObject:v8];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [&unk_1F3DC8A48 countByEnumeratingWithState:&v11 objects:v10 count:16];
    }
    while (v5);
  }
  return v3;
}

- (int64_t)participantScreenToken
{
  id v2 = (void *)[(NSMutableDictionary *)self->_participantStreamTokens objectForKeyedSubscript:&unk_1F3DC6DB0];

  return [v2 integerValue];
}

- (id)screenGroup
{
  streamGroups = self->_streamGroups;
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[VCSessionParticipant participantScreenToken](self, "participantScreenToken"));

  return (id)[(NSMutableDictionary *)streamGroups objectForKeyedSubscript:v3];
}

- (id)systemAudioGroup
{
  return [(VCSessionParticipant *)self streamGroupWithID:1937339233];
}

- (id)microphoneGroup
{
  return [(VCSessionParticipant *)self streamGroupWithID:1835623282];
}

- (id)captionsGroup
{
  return [(VCSessionParticipant *)self streamGroupWithID:1667330164];
}

- (id)streamGroupWithID:(unsigned int)a3
{
  uint64_t v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_participantStreamTokens, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:*(void *)&a3]);
  streamGroups = self->_streamGroups;

  return (id)[(NSMutableDictionary *)streamGroups objectForKeyedSubscript:v4];
}

- (NSDictionary)participantStreamTokens
{
  return &self->_participantStreamTokens->super;
}

- (int)securityKeyHolderUsageForStreamConfigDirection:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 3) {
    return a3;
  }
  else {
    return 0;
  }
}

- (BOOL)setupSecurityKeyHolderForStreamConfig:(id)a3
{
  cf[1] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  if (!self->_securityKeyManager)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v6) {
        return v6;
      }
      -[VCSessionParticipant setupSecurityKeyHolderForStreamConfig:]();
    }
    goto LABEL_17;
  }
  cf[0] = 0;
  if (objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "streamGroupID") == 1667329399
    || objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "streamGroupID") == 1835623287)
  {
    unsigned int v5 = 2;
  }
  else
  {
    unsigned int v5 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "isOneToOne");
  }
  if (VCSecurityKeyHolder_Create(*MEMORY[0x1E4F1CF80], (uint64_t)self->_securityKeyManager, -[VCSessionParticipant securityKeyHolderUsageForStreamConfigDirection:](self, "securityKeyHolderUsageForStreamConfigDirection:", [a3 direction]), self->_idsParticipantID, -[VCSessionParticipant isParticipantIDBasedKeyLookupEnabled](self, "isParticipantIDBasedKeyLookupEnabled"), v5, (uint64_t *)cf))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v6) {
        return v6;
      }
      -[VCSessionParticipant setupSecurityKeyHolderForStreamConfig:]();
    }
LABEL_17:
    LOBYTE(v6) = 0;
    return v6;
  }
  [a3 setSecurityKeyHolder:cf[0]];
  if (cf[0]) {
    CFRelease(cf[0]);
  }
  LOBYTE(v6) = 1;
  return v6;
}

- (id)getAudioDumpName
{
  return 0;
}

- (BOOL)completeStreamSetup:(id)a3 rtpCipherSuite:(int64_t)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "setSessionId:", self->_sessionUUID);
  objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "setParticipantId:", self->_uuid);
  objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "setRemoteIDSParticipantID:", self->_idsParticipantID);
  objc_msgSend(a3, "setSendMediaKey:", -[VCSessionParticipant generateEncryptionKey](self, "generateEncryptionKey"));
  objc_msgSend(a3, "setReceiveMediaKey:", -[VCSessionParticipant generateEncryptionKey](self, "generateEncryptionKey"));
  BOOL v7 = [+[VCDefaults sharedInstance] forceDisableMediaEncryption];
  if (v7 || [a3 sframeCipherSuite])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 136316162;
        uint64_t v17 = v8;
        __int16 v18 = 2080;
        uint64_t v19 = "-[VCSessionParticipant completeStreamSetup:rtpCipherSuite:]";
        __int16 v20 = 1024;
        int v21 = 1536;
        __int16 v22 = 1024;
        BOOL v23 = v7;
        __int16 v24 = 1024;
        int v25 = [a3 sframeCipherSuite];
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Disabling SRTP encryption. isEncryptionDisabled=%d, sframeCipherSuite=%d", (uint8_t *)&v16, 0x28u);
      }
    }
    id v10 = a3;
    int64_t v11 = 0;
  }
  else
  {
    id v10 = a3;
    int64_t v11 = a4;
  }
  [v10 setSRTPCipherSuite:v11];
  [a3 setSRTCPCipherSuite:0];
  [a3 setDecryptionTimeOutEnabled:0];
  [a3 setDecryptionTimeOutInterval:(double)self->_decryptionTimeOutInterval];
  [a3 setDecryptionMKMRecoveryInterval:self->_participantMKMRecoveryTimeout];
  BOOL v12 = [(VCSessionParticipant *)self setupSecurityKeyHolderForStreamConfig:a3];
  if (v12)
  {
    if (v7)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        long long v14 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 136315650;
          uint64_t v17 = v13;
          __int16 v18 = 2080;
          uint64_t v19 = "-[VCSessionParticipant completeStreamSetup:rtpCipherSuite:]";
          __int16 v20 = 1024;
          int v21 = 1551;
          _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Disabling SFrame encryption. isEncryptionDisabled=YES", (uint8_t *)&v16, 0x1Cu);
        }
      }
      [a3 setSframeCipherSuite:0];
    }
    [(VCSessionParticipant *)self setupNetworkAddressesForMediaConfig:a3];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCSessionParticipant completeStreamSetup:rtpCipherSuite:]();
    }
  }
  return v12;
}

- (BOOL)configureAudioIOWithDeviceRole:(int)a3 operatingMode:(int)a4
{
}

- (BOOL)updateConfigurationWithDeviceRole:(int)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  participantQueue = self->_participantQueue;
  char v11 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__VCSessionParticipant_updateConfigurationWithDeviceRole___block_invoke;
  v6[3] = &unk_1E6DB6790;
  int v7 = a3;
  v6[4] = self;
  v6[5] = &v8;
  dispatch_sync(participantQueue, v6);
  char v4 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

void __58__VCSessionParticipant_updateConfigurationWithDeviceRole___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 304) == *(_DWORD *)(a1 + 48))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v3 = *(void **)(v2 + 480);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v27 objects:v26 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v28;
LABEL_5:
      uint64_t v7 = 0;
      while (1)
      {
        if (*(void *)v28 != v6) {
          objc_enumerationMutation(v3);
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * v7), "setDeviceRole:operatingMode:", *(unsigned int *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "operatingMode"));
        if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
          break;
        }
        if (v5 == ++v7)
        {
          uint64_t v5 = [v3 countByEnumeratingWithState:&v27 objects:v26 count:16];
          if (v5) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      uint64_t v8 = (void *)[*(id *)(a1 + 32) streamGroupWithID:1667330164];
      if (v8
        && (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend(v8, "setDeviceRole:operatingMode:", *(unsigned int *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "operatingMode"))) == 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            __58__VCSessionParticipant_updateConfigurationWithDeviceRole___block_invoke_cold_2();
          }
        }
      }
      else
      {
        uint64_t v9 = *(void *)(a1 + 32);
        int v10 = *(_DWORD *)(v9 + 168);
        if (v10 == 1)
        {
          int v11 = [*(id *)(v9 + 392) state];
          if (v11 == 2) {
            [*(id *)(*(void *)(a1 + 32) + 392) stop];
          }
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "configureAudioIOWithDeviceRole:operatingMode:", *(unsigned int *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "operatingMode"));
          if (v11 == 2) {
            [*(id *)(*(void *)(a1 + 32) + 392) start];
          }
        }
        else if (!v10)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend((id)v9, "configureAudioIOWithDeviceRole:operatingMode:", *(unsigned int *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "operatingMode"));
        }
      }
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      *(_DWORD *)(*(void *)(a1 + 32) + 304) = *(_DWORD *)(a1 + 48);
    }
    else if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __58__VCSessionParticipant_updateConfigurationWithDeviceRole___block_invoke_cold_1();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v12 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v12 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        long long v14 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v15 = *(void *)(a1 + 32);
          int v16 = 136316162;
          uint64_t v17 = v13;
          __int16 v18 = 2080;
          uint64_t v19 = "-[VCSessionParticipant updateConfigurationWithDeviceRole:]_block_invoke";
          __int16 v20 = 1024;
          int v21 = 1604;
          __int16 v22 = 2112;
          BOOL v23 = v12;
          __int16 v24 = 2048;
          uint64_t v25 = v15;
          _os_log_error_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Error configuring audioIO", (uint8_t *)&v16, 0x30u);
        }
      }
    }
  }
}

- (BOOL)configureOneToOneAudioStreamsWithDeviceRole:(int)a3
{
  return 1;
}

- (BOOL)configureOneToOneAudioStreamsWithDeviceRole:(int)a3 streamInfoArray:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v36 = 0;
  if (self->_oneToOneModeEnabled || ![a4 count])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v48 = v6;
        __int16 v49 = 2080;
        long long v50 = "-[VCSessionParticipant configureOneToOneAudioStreamsWithDeviceRole:streamInfoArray:]";
        __int16 v51 = 1024;
        int v52 = 1621;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d There are no audio streams to configure, bypassing configuration", buf, 0x1Cu);
      }
    }
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v32 = [a4 countByEnumeratingWithState:&v43 objects:v42 count:16];
  if (v32)
  {
    if (a3 == 3) {
      uint64_t v9 = 6;
    }
    else {
      uint64_t v9 = 5;
    }
    uint64_t v31 = *(void *)v44;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v44 != v31) {
          objc_enumerationMutation(a4);
        }
        uint64_t v33 = v10;
        int v11 = *(void **)(*((void *)&v43 + 1) + 8 * v10);
        __int16 v35 = (void *)[v11 stream];
        objc_msgSend(v35, "setReportingAgent:", -[VCSessionParticipant reportingAgent](self, "reportingAgent"));
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        int v34 = v11;
        uint64_t v12 = (void *)[v11 streamConfigs];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v38 objects:v37 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v39;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v39 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void **)(*((void *)&v38 + 1) + 8 * i);
              [v17 setAudioStreamMode:v9];
              [v17 setCellularUniqueTag:self->_cellularUniqueTag];
              if (objc_msgSend((id)objc_msgSend(v17, "multiwayConfig"), "isOneToOne")) {
                statisticsCollector = [(VCSessionParticipantOneToOneConfig *)self->_oneToOneConfig statisticsCollector];
              }
              else {
                statisticsCollector = self->_statisticsCollector;
              }
              objc_msgSend((id)objc_msgSend(v17, "rateControlConfig"), "setStatisticsCollector:", statisticsCollector);
              if (objc_msgSend((id)objc_msgSend(v17, "multiwayConfig"), "isOneToOne")) {
                basebandCongestionDetector = [(VCSessionParticipantOneToOneConfig *)self->_oneToOneConfig basebandCongestionDetector];
              }
              else {
                basebandCongestionDetector = self->_basebandCongestionDetector;
              }
              objc_msgSend((id)objc_msgSend(v17, "rateControlConfig"), "setBasebandCongestionDetector:", basebandCongestionDetector);
              if (objc_msgSend((id)objc_msgSend(v17, "multiwayConfig"), "isOneToOne")) {
                __int16 v20 = [(VCSessionParticipantOneToOneConfig *)self->_oneToOneConfig feedbackController];
              }
              else {
                __int16 v20 = 0;
              }
              objc_msgSend((id)objc_msgSend(v17, "rateControlConfig"), "setFeedbackController:", v20);
              objc_msgSend((id)objc_msgSend(v17, "rateControlConfig"), "setShouldCreateMediaControlInfoGenerator:", 0);
              objc_msgSend((id)objc_msgSend(v17, "rateControlConfig"), "setShouldRegisterMediaControlInfoGeneratorCallbacks:", objc_msgSend((id)objc_msgSend(v17, "multiwayConfig"), "isOneToOne"));
              if (objc_msgSend((id)objc_msgSend(v17, "multiwayConfig"), "isOneToOne")) {
                uint64_t v21 = [(VCMediaNegotiatorResults *)[(VCSessionMediaNegotiator *)self->_mediaNegotiator negotiatedSettings] mediaControlInfoVersion];
              }
              else {
                uint64_t v21 = 1;
              }
              objc_msgSend((id)objc_msgSend(v17, "rateControlConfig"), "setMediaControlInfoVersion:", v21);
              objc_msgSend((id)objc_msgSend(v17, "rateControlConfig"), "setMediaControlInfoGeneratorType:", 0);
              if (objc_msgSend((id)objc_msgSend(v17, "multiwayConfig"), "isOneToOne")) {
                __int16 v22 = [(VCSessionParticipantOneToOneConfig *)self->_oneToOneConfig audioMediaControlInfoGenerator];
              }
              else {
                __int16 v22 = 0;
              }
              objc_msgSend((id)objc_msgSend(v17, "rateControlConfig"), "setMediaControlInfoGenerator:", v22);
              objc_msgSend((id)objc_msgSend(v17, "rateControlConfig"), "setMediaControlInfoGeneratorOptions:", objc_msgSend((id)objc_msgSend(v17, "multiwayConfig"), "isOneToOne"));
              if (objc_msgSend((id)objc_msgSend(v17, "multiwayConfig"), "isOneToOne")) {
                BOOL v23 = [(VCSessionParticipantOneToOneConfig *)self->_oneToOneConfig mediaController];
              }
              else {
                BOOL v23 = 0;
              }
              objc_msgSend((id)objc_msgSend(v17, "rateControlConfig"), "setMediaController:", v23);
              objc_msgSend((id)objc_msgSend(v17, "rateControlConfig"), "setVcMediaQueue:", self->_mediaQueue);
              if (objc_msgSend((id)objc_msgSend(v17, "multiwayConfig"), "isOneToOne")) {
                __int16 v24 = [(VCSessionParticipantOneToOneConfig *)self->_oneToOneConfig mediaQueue];
              }
              else {
                __int16 v24 = (tagHANDLE *)0xFFFFFFFFLL;
              }
              objc_msgSend((id)objc_msgSend(v17, "rateControlConfig"), "setMediaQueue:", v24);
              audioIO = self->_audioIO;
              if (audioIO)
              {
                LODWORD(v26) = [(VCAudioIO *)audioIO clientFormat][40];
                double v27 = (double)v26 / *(double *)[(VCAudioIO *)self->_audioIO clientFormat];
              }
              else
              {
                double v27 = (double)(self->_preferredIOSamplesPerFrame / self->_preferredIOSampleRate);
              }
              objc_msgSend((id)objc_msgSend(v17, "rateControlConfig"), "setMediaQueueThrottlingInterval:", v27);
              [v17 setShouldApplyRedAsBoolean:1];
              objc_msgSend(v17, "setExternalIOFormat:", -[VCAudioIO clientFormat](self->_audioIO, "clientFormat"));
              if (self->_oneToOneModeEnabled) {
                long long v28 = [(VCSessionParticipantOneToOneConfig *)self->_oneToOneConfig networkFeedbackController];
              }
              else {
                long long v28 = 0;
              }
              [v17 setNetworkFeedbackController:v28];
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v38 objects:v37 count:16];
          }
          while (v14);
        }
        if ((objc_msgSend(v35, "setStreamConfig:withError:", objc_msgSend(v34, "streamConfigs"), &v36) & 1) == 0)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCSessionParticipant configureOneToOneAudioStreamsWithDeviceRole:streamInfoArray:]();
            }
          }
          return 0;
        }
        uint64_t v10 = v33 + 1;
      }
      while (v33 + 1 != v32);
      uint64_t v32 = [a4 countByEnumeratingWithState:&v43 objects:v42 count:16];
      if (v32) {
        continue;
      }
      break;
    }
    return 1;
  }
  return v8;
}

- (id)newVideoRateControlConfigWithMediaControlInfoVersion:(unsigned __int8)a3 enableMediaControlInfoGenerator:(BOOL)a4 enableFeedbackController:(BOOL)a5 isOneToOne:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v9 = a3;
  int v11 = objc_alloc_init(VCMediaStreamRateControlConfig);
  uint64_t v12 = v11;
  if (v11)
  {
    if (v6)
    {
      [(VCMediaStreamRateControlConfig *)v11 setStatisticsCollector:[(VCSessionParticipantOneToOneConfig *)self->_oneToOneConfig statisticsCollector]];
      [(VCMediaStreamRateControlConfig *)v12 setBasebandCongestionDetector:[(VCSessionParticipantOneToOneConfig *)self->_oneToOneConfig basebandCongestionDetector]];
      uint64_t v13 = 0;
      if (v7 && v6) {
        uint64_t v13 = [(VCSessionParticipantOneToOneConfig *)self->_oneToOneConfig feedbackController];
      }
    }
    else
    {
      [(VCMediaStreamRateControlConfig *)v11 setStatisticsCollector:self->_statisticsCollector];
      [(VCMediaStreamRateControlConfig *)v12 setBasebandCongestionDetector:self->_basebandCongestionDetector];
      uint64_t v13 = 0;
    }
    [(VCMediaStreamRateControlConfig *)v12 setFeedbackController:v13];
    [(VCMediaStreamRateControlConfig *)v12 setShouldCreateMediaControlInfoGenerator:!v6 & v8];
    [(VCMediaStreamRateControlConfig *)v12 setShouldRegisterMediaControlInfoGeneratorCallbacks:v6];
    if (!v6)
    {
      [(VCMediaStreamRateControlConfig *)v12 setMediaControlInfoVersion:v9];
      [(VCMediaStreamRateControlConfig *)v12 setMediaControlInfoGeneratorType:1];
      uint64_t v14 = 0;
    }
    else
    {
      [(VCMediaStreamRateControlConfig *)v12 setMediaControlInfoVersion:[(VCMediaNegotiatorResults *)[(VCSessionMediaNegotiator *)self->_mediaNegotiator negotiatedSettings] mediaControlInfoVersion]];
      [(VCMediaStreamRateControlConfig *)v12 setMediaControlInfoGeneratorType:1];
      uint64_t v14 = [(VCSessionParticipantOneToOneConfig *)self->_oneToOneConfig videoMediaControlInfoGenerator];
    }
    [(VCMediaStreamRateControlConfig *)v12 setMediaControlInfoGenerator:v14];
    [(VCMediaStreamRateControlConfig *)v12 setMediaControlInfoGeneratorOptions:0];
    if (v6)
    {
      [(VCMediaStreamRateControlConfig *)v12 setMediaController:[(VCSessionParticipantOneToOneConfig *)self->_oneToOneConfig mediaController]];
      uint64_t v15 = [(VCSessionParticipantOneToOneConfig *)self->_oneToOneConfig mediaQueue];
    }
    else
    {
      [(VCMediaStreamRateControlConfig *)v12 setMediaController:0];
      uint64_t v15 = (tagHANDLE *)0xFFFFFFFFLL;
    }
    [(VCMediaStreamRateControlConfig *)v12 setMediaQueue:v15];
    [(VCMediaStreamRateControlConfig *)v12 setVcMediaQueue:self->_mediaQueue];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCSessionParticipant newVideoRateControlConfigWithMediaControlInfoVersion:enableMediaControlInfoGenerator:enableFeedbackController:isOneToOne:]();
    }
  }
  return v12;
}

- (id)newAudioRateControlConfigWithMediaControlInfoVersion:(unsigned __int8)a3 enableFeedbackController:(BOOL)a4 isOneToOne:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v7 = a3;
  uint64_t v9 = objc_alloc_init(VCMediaStreamRateControlConfig);
  uint64_t v10 = v9;
  if (v5)
  {
    [(VCMediaStreamRateControlConfig *)v9 setStatisticsCollector:[(VCSessionParticipantOneToOneConfig *)self->_oneToOneConfig statisticsCollector]];
    [(VCMediaStreamRateControlConfig *)v10 setBasebandCongestionDetector:[(VCSessionParticipantOneToOneConfig *)self->_oneToOneConfig basebandCongestionDetector]];
    int v11 = 0;
    if (v6 && v5) {
      int v11 = [(VCSessionParticipantOneToOneConfig *)self->_oneToOneConfig feedbackController];
    }
  }
  else
  {
    [(VCMediaStreamRateControlConfig *)v9 setStatisticsCollector:self->_statisticsCollector];
    [(VCMediaStreamRateControlConfig *)v10 setBasebandCongestionDetector:self->_basebandCongestionDetector];
    int v11 = 0;
  }
  [(VCMediaStreamRateControlConfig *)v10 setFeedbackController:v11];
  [(VCMediaStreamRateControlConfig *)v10 setShouldCreateMediaControlInfoGenerator:0];
  [(VCMediaStreamRateControlConfig *)v10 setShouldRegisterMediaControlInfoGeneratorCallbacks:v5];
  if (v5)
  {
    [(VCMediaStreamRateControlConfig *)v10 setMediaControlInfoVersion:[(VCMediaNegotiatorResults *)[(VCSessionMediaNegotiator *)self->_mediaNegotiator negotiatedSettings] mediaControlInfoVersion]];
    [(VCMediaStreamRateControlConfig *)v10 setMediaControlInfoGeneratorType:0];
    uint64_t v12 = [(VCSessionParticipantOneToOneConfig *)self->_oneToOneConfig audioMediaControlInfoGenerator];
  }
  else
  {
    [(VCMediaStreamRateControlConfig *)v10 setMediaControlInfoVersion:v7];
    [(VCMediaStreamRateControlConfig *)v10 setMediaControlInfoGeneratorType:0];
    uint64_t v12 = 0;
  }
  [(VCMediaStreamRateControlConfig *)v10 setMediaControlInfoGenerator:v12];
  [(VCMediaStreamRateControlConfig *)v10 setMediaControlInfoGeneratorOptions:v5];
  if (v5)
  {
    [(VCMediaStreamRateControlConfig *)v10 setMediaController:[(VCSessionParticipantOneToOneConfig *)self->_oneToOneConfig mediaController]];
    [(VCMediaStreamRateControlConfig *)v10 setVcMediaQueue:self->_mediaQueue];
    uint64_t v13 = [(VCSessionParticipantOneToOneConfig *)self->_oneToOneConfig mediaQueue];
  }
  else
  {
    [(VCMediaStreamRateControlConfig *)v10 setMediaController:0];
    [(VCMediaStreamRateControlConfig *)v10 setVcMediaQueue:self->_mediaQueue];
    uint64_t v13 = (tagHANDLE *)0xFFFFFFFFLL;
  }
  [(VCMediaStreamRateControlConfig *)v10 setMediaQueue:v13];
  audioIO = self->_audioIO;
  if (audioIO)
  {
    LODWORD(v15) = [(VCAudioIO *)audioIO clientFormat][40];
    double v16 = (double)v15 / *(double *)[(VCAudioIO *)self->_audioIO clientFormat];
  }
  else
  {
    double v16 = (double)(self->_preferredIOSamplesPerFrame / self->_preferredIOSampleRate);
  }
  [(VCMediaStreamRateControlConfig *)v10 setMediaQueueThrottlingInterval:v16];
  return v10;
}

- (BOOL)configureOneToOneVideoStreamsWithDeviceRole:(int)a3
{
  return 1;
}

- (BOOL)configureOneToOneVideoStreamsWithDeviceRole:(int)a3 streamInfoArray:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(a4, "count", *(void *)&a3))
  {
    *(void *)buf = 0;
    id v6 = [(VCSessionParticipant *)self newVideoRateControlConfigWithMediaControlInfoVersion:1 enableMediaControlInfoGenerator:1 enableFeedbackController:0 isOneToOne:0];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v23 = [a4 countByEnumeratingWithState:&v35 objects:v34 count:16];
    if (v23)
    {
      BOOL v7 = 0;
      uint64_t v25 = *(void *)v36;
      while (2)
      {
        uint64_t v8 = 0;
        do
        {
          BOOL v24 = v7;
          if (*(void *)v36 != v25) {
            objc_enumerationMutation(a4);
          }
          uint64_t v26 = v8;
          uint64_t v9 = *(void **)(*((void *)&v35 + 1) + 8 * v8);
          uint64_t v10 = (void *)[v9 stream];
          objc_msgSend(v10, "setReportingAgent:", -[VCSessionParticipant reportingAgent](self, "reportingAgent"));
          long long v28 = v10;
          [v10 setOperatingMode:6];
          long long v32 = 0u;
          long long v33 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          double v27 = v9;
          int v11 = (void *)[v9 streamConfigs];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v29 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v31;
            while (2)
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v31 != v14) {
                  objc_enumerationMutation(v11);
                }
                double v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
                if (objc_msgSend((id)objc_msgSend(v16, "multiwayConfig"), "isOneToOne"))
                {
                  id v17 = -[VCSessionParticipant newVideoRateControlConfigWithMediaControlInfoVersion:enableMediaControlInfoGenerator:enableFeedbackController:isOneToOne:](self, "newVideoRateControlConfigWithMediaControlInfoVersion:enableMediaControlInfoGenerator:enableFeedbackController:isOneToOne:", 1, 1, objc_msgSend((id)objc_msgSend(v16, "multiwayConfig"), "streamGroupID") == 1667329381, 1);
                  if (!v17)
                  {
                    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
                    if (ErrorLogLevelForModule < 3)
                    {
                      BOOL v7 = v24;
                    }
                    else
                    {
                      VRTraceErrorLogLevelToCSTR();
                      BOOL v7 = v24;
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                        -[VCSessionParticipant configureOneToOneVideoStreamsWithDeviceRole:streamInfoArray:]();
                      }
                    }
                    goto LABEL_37;
                  }
                }
                else
                {
                  id v17 = v6;
                }
                [v16 setRateControlConfig:v17];

                if (objc_msgSend((id)objc_msgSend(v16, "multiwayConfig"), "isOneToOne")) {
                  networkFeedbackController = self->_networkFeedbackController;
                }
                else {
                  networkFeedbackController = 0;
                }
                [v16 setNetworkFeedbackController:networkFeedbackController];
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v29 count:16];
              if (v13) {
                continue;
              }
              break;
            }
          }
          if ((objc_msgSend(v28, "setStreamConfig:withError:", objc_msgSend(v27, "streamConfigs"), buf) & 1) == 0)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                -[VCSessionParticipant configureOneToOneVideoStreamsWithDeviceRole:streamInfoArray:]();
              }
            }
            goto LABEL_36;
          }
          uint64_t v8 = v26 + 1;
          BOOL v7 = 1;
        }
        while (v26 + 1 != v23);
        uint64_t v23 = [a4 countByEnumeratingWithState:&v35 objects:v34 count:16];
        if (v23) {
          continue;
        }
        break;
      }
    }
    else
    {
LABEL_36:
      BOOL v7 = 0;
    }
LABEL_37:
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      uint64_t v21 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = v20;
        __int16 v40 = 2080;
        long long v41 = "-[VCSessionParticipant configureOneToOneVideoStreamsWithDeviceRole:streamInfoArray:]";
        __int16 v42 = 1024;
        int v43 = 1704;
        _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d There are no video streams to configure, bypassing configuration", buf, 0x1Cu);
      }
    }
    return 1;
  }
  return v7;
}

- (BOOL)configureOneToOneWithConfig:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ((VCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      BOOL v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v19 = 136316674;
        *(void *)&v19[4] = v6;
        *(_WORD *)&v19[12] = 2080;
        *(void *)&v19[14] = "-[VCSessionParticipant configureOneToOneWithConfig:]";
        *(_WORD *)&v19[22] = 1024;
        LODWORD(v20) = 1741;
        WORD2(v20) = 1024;
        *(_DWORD *)((char *)&v20 + 6) = [a3 deviceRole];
        WORD5(v20) = 1024;
        HIDWORD(v20) = [a3 negotiatedVideoEnabled];
        LOWORD(v21) = 1024;
        *(_DWORD *)((char *)&v21 + 2) = [a3 negotiatedScreenEnabled];
        HIWORD(v21) = 1024;
        LODWORD(v22) = [a3 operatingMode];
        uint64_t v8 = " [%s] %s:%d deviceRole=%d, negotiatedVideoEnabled=%d, negotiatedScreenEnabled=%d, operatingMode=%d";
        uint64_t v9 = v7;
        uint32_t v10 = 52;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, v19, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      BOOL v5 = (__CFString *)[(VCSessionParticipant *)self performSelector:sel_logPrefix];
    }
    else {
      BOOL v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v19 = 136317186;
        *(void *)&v19[4] = v11;
        *(_WORD *)&v19[12] = 2080;
        *(void *)&v19[14] = "-[VCSessionParticipant configureOneToOneWithConfig:]";
        *(_WORD *)&v19[22] = 1024;
        LODWORD(v20) = 1741;
        WORD2(v20) = 2112;
        *(void *)((char *)&v20 + 6) = v5;
        HIWORD(v20) = 2048;
        uint64_t v21 = self;
        LOWORD(v22) = 1024;
        *(_DWORD *)((char *)&v22 + 2) = [a3 deviceRole];
        HIWORD(v22) = 1024;
        LODWORD(v23) = [a3 negotiatedVideoEnabled];
        WORD2(v23) = 1024;
        *(_DWORD *)((char *)&v23 + 6) = [a3 negotiatedScreenEnabled];
        WORD5(v23) = 1024;
        HIDWORD(v23) = [a3 operatingMode];
        uint64_t v8 = " [%s] %s:%d %@(%p) deviceRole=%d, negotiatedVideoEnabled=%d, negotiatedScreenEnabled=%d, operatingMode=%d";
        uint64_t v9 = v12;
        uint32_t v10 = 72;
        goto LABEL_11;
      }
    }
  }
  unsigned int v13 = [(VCAudioIO *)self->_audioIO state];
  if (v13 == 2) {
    [(VCAudioIO *)self->_audioIO stop];
  }
  if (-[VCSessionParticipant configureAudioIOWithDeviceRole:operatingMode:](self, "configureAudioIOWithDeviceRole:operatingMode:", [a3 deviceRole], objc_msgSend(a3, "operatingMode")))
  {
    if (-[VCSessionParticipant configureOneToOneAudioStreamsWithDeviceRole:](self, "configureOneToOneAudioStreamsWithDeviceRole:", [a3 deviceRole]))
    {
      if (v13 == 2) {
        [(VCAudioIO *)self->_audioIO start];
      }
      if (![a3 negotiatedVideoEnabled]
        || -[VCSessionParticipant configureOneToOneVideoStreamsWithDeviceRole:](self, "configureOneToOneVideoStreamsWithDeviceRole:", [a3 deviceRole]))
      {
        self->_deviceRole = [a3 deviceRole];
        LOBYTE(v14) = 1;
        return v14;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v14) {
          return v14;
        }
        -[VCSessionParticipant configureOneToOneWithConfig:]();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v14) {
        return v14;
      }
      -[VCSessionParticipant configureOneToOneWithConfig:]();
    }
  }
  else if ((VCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v14) {
        return v14;
      }
      -[VCSessionParticipant configureOneToOneWithConfig:]();
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      unint64_t v15 = (__CFString *)[(VCSessionParticipant *)self performSelector:sel_logPrefix];
    }
    else {
      unint64_t v15 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      id v17 = *MEMORY[0x1E4F47A50];
      BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v14) {
        return v14;
      }
      *(_DWORD *)uint64_t v19 = 136316162;
      *(void *)&v19[4] = v16;
      *(_WORD *)&v19[12] = 2080;
      *(void *)&v19[14] = "-[VCSessionParticipant configureOneToOneWithConfig:]";
      *(_WORD *)&v19[22] = 1024;
      LODWORD(v20) = 1747;
      WORD2(v20) = 2112;
      *(void *)((char *)&v20 + 6) = v15;
      HIWORD(v20) = 2048;
      uint64_t v21 = self;
      _os_log_error_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Error configuring audioIO", v19, 0x30u);
    }
  }
  LOBYTE(v14) = 0;
  return v14;
}

- (BOOL)configureWithDeviceRole:(int)a3 negotiatedVideoEnabled:(BOOL)a4 negotiatedScreenEnabled:(BOOL)a5 operatingMode:(int)a6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  unint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  participantQueue = self->_participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __109__VCSessionParticipant_configureWithDeviceRole_negotiatedVideoEnabled_negotiatedScreenEnabled_operatingMode___block_invoke;
  block[3] = &unk_1E6DB9DF8;
  block[4] = self;
  void block[5] = &v14;
  BOOL v12 = a4;
  BOOL v13 = a5;
  int v10 = a3;
  int v11 = a6;
  dispatch_sync(participantQueue, block);
  char v7 = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v7;
}

void __109__VCSessionParticipant_configureWithDeviceRole_negotiatedVideoEnabled_negotiatedScreenEnabled_operatingMode___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) dispatchedConfigureWithDeviceRole:*(unsigned int *)(a1 + 48) negotiatedVideoEnabled:*(unsigned __int8 *)(a1 + 56) negotiatedScreenEnabled:*(unsigned __int8 *)(a1 + 57) operatingMode:*(unsigned int *)(a1 + 52)];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __109__VCSessionParticipant_configureWithDeviceRole_negotiatedVideoEnabled_negotiatedScreenEnabled_operatingMode___block_invoke_cold_1();
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
          uint64_t v9 = "-[VCSessionParticipant configureWithDeviceRole:negotiatedVideoEnabled:negotiatedScreenEnabled:operatingMo"
               "de:]_block_invoke";
          __int16 v10 = 1024;
          int v11 = 1773;
          __int16 v12 = 2112;
          BOOL v13 = v2;
          __int16 v14 = 2048;
          uint64_t v15 = v5;
          _os_log_error_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Fail configure participant", (uint8_t *)&v6, 0x30u);
        }
      }
    }
  }
}

- (BOOL)dispatchedConfigureWithDeviceRole:(int)a3 negotiatedVideoEnabled:(BOOL)a4 negotiatedScreenEnabled:(BOOL)a5 operatingMode:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v9 = *(void *)&a3;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_participantQueue);
  if ((VCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      BOOL v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316674;
        uint64_t v38 = v12;
        __int16 v39 = 2080;
        __int16 v40 = "-[VCSessionParticipant dispatchedConfigureWithDeviceRole:negotiatedVideoEnabled:negotiatedScreenEnabled:operatingMode:]";
        __int16 v41 = 1024;
        int v42 = 1784;
        __int16 v43 = 1024;
        *(_DWORD *)uint64_t v44 = v9;
        *(_WORD *)&v44[4] = 1024;
        *(_DWORD *)&v44[6] = v8;
        LOWORD(v45) = 1024;
        *(_DWORD *)((char *)&v45 + 2) = v7;
        HIWORD(v45) = 1024;
        *(_DWORD *)long long v46 = v6;
        __int16 v14 = " [%s] %s:%d deviceRole=%d, negotiatedVideoEnabled=%d, negotiatedScreenEnabled=%d, operatingMode=%d";
        uint64_t v15 = v13;
        uint32_t v16 = 52;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      int v11 = (__CFString *)[(VCSessionParticipant *)self performSelector:sel_logPrefix];
    }
    else {
      int v11 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      uint64_t v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136317186;
        uint64_t v38 = v17;
        __int16 v39 = 2080;
        __int16 v40 = "-[VCSessionParticipant dispatchedConfigureWithDeviceRole:negotiatedVideoEnabled:negotiatedScreenEnabled:operatingMode:]";
        __int16 v41 = 1024;
        int v42 = 1784;
        __int16 v43 = 2112;
        *(void *)uint64_t v44 = v11;
        *(_WORD *)&v44[8] = 2048;
        long long v45 = self;
        *(_WORD *)long long v46 = 1024;
        *(_DWORD *)&v46[2] = v9;
        __int16 v47 = 1024;
        BOOL v48 = v8;
        __int16 v49 = 1024;
        BOOL v50 = v7;
        __int16 v51 = 1024;
        int v52 = v6;
        __int16 v14 = " [%s] %s:%d %@(%p) deviceRole=%d, negotiatedVideoEnabled=%d, negotiatedScreenEnabled=%d, operatingMode=%d";
        uint64_t v15 = v18;
        uint32_t v16 = 72;
        goto LABEL_11;
      }
    }
  }
  uint64_t v19 = objc_alloc_init(VCSessionParticipantOneToOneConfig);
  if (!v19)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v27 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v27) {
        return v27;
      }
      -[VCSessionParticipant dispatchedConfigureWithDeviceRole:negotiatedVideoEnabled:negotiatedScreenEnabled:operatingMode:]();
    }
    goto LABEL_34;
  }
  long long v20 = v19;
  [(VCSessionParticipantOneToOneConfig *)v19 setDeviceRole:v9];
  [(VCSessionParticipantOneToOneConfig *)v20 setNegotiatedVideoEnabled:v8];
  [(VCSessionParticipantOneToOneConfig *)v20 setNegotiatedScreenEnabled:v7];
  [(VCSessionParticipantOneToOneConfig *)v20 setOperatingMode:v6];
  BOOL v21 = [(VCSessionParticipant *)self configureOneToOneWithConfig:v20];

  if (!v21)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v27 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v27) {
        return v27;
      }
      -[VCSessionParticipant dispatchedConfigureWithDeviceRole:negotiatedVideoEnabled:negotiatedScreenEnabled:operatingMode:]();
    }
    goto LABEL_34;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  micStreamGroups = self->_micStreamGroups;
  uint64_t v23 = [(NSMutableArray *)micStreamGroups countByEnumeratingWithState:&v33 objects:v32 count:16];
  if (!v23)
  {
LABEL_22:
    LOBYTE(v27) = [(VCSessionParticipant *)self configureMultiwayStreamGroups];
    self->_deviceRole = v9;
    return v27;
  }
  uint64_t v24 = v23;
  uint64_t v25 = *(void *)v34;
LABEL_16:
  uint64_t v26 = 0;
  while (1)
  {
    if (*(void *)v34 != v25) {
      objc_enumerationMutation(micStreamGroups);
    }
    if (([*(id *)(*((void *)&v33 + 1) + 8 * v26) setDeviceRole:v9 operatingMode:v6] & 1) == 0) {
      break;
    }
    if (v24 == ++v26)
    {
      uint64_t v24 = [(NSMutableArray *)micStreamGroups countByEnumeratingWithState:&v33 objects:v32 count:16];
      if (v24) {
        goto LABEL_16;
      }
      goto LABEL_22;
    }
  }
  if ((VCSessionParticipant *)objc_opt_class() != self)
  {
    if (objc_opt_respondsToSelector()) {
      long long v28 = (__CFString *)[(VCSessionParticipant *)self performSelector:sel_logPrefix];
    }
    else {
      long long v28 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v29 = VRTraceErrorLogLevelToCSTR();
      long long v30 = *MEMORY[0x1E4F47A50];
      BOOL v27 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v27) {
        return v27;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v38 = v29;
      __int16 v39 = 2080;
      __int16 v40 = "-[VCSessionParticipant dispatchedConfigureWithDeviceRole:negotiatedVideoEnabled:negotiatedScreenEnabled:operatingMode:]";
      __int16 v41 = 1024;
      int v42 = 1797;
      __int16 v43 = 2112;
      *(void *)uint64_t v44 = v28;
      *(_WORD *)&v44[8] = 2048;
      long long v45 = self;
      _os_log_error_impl(&dword_1E1EA4000, v30, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Error setting device role on stream group", buf, 0x30u);
    }
LABEL_34:
    LOBYTE(v27) = 0;
    return v27;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
    goto LABEL_34;
  }
  VRTraceErrorLogLevelToCSTR();
  BOOL v27 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
  if (v27)
  {
    -[VCSessionParticipant dispatchedConfigureWithDeviceRole:negotiatedVideoEnabled:negotiatedScreenEnabled:operatingMode:]();
    goto LABEL_34;
  }
  return v27;
}

- (BOOL)configureStreamInfosForMultiway:(id)a3 streamGroupID:(unsigned int)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (a4 == 1718909044 || a4 == 1937339233 || a4 == 1935897189) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 1;
  }
  long long v48 = 0u;
  long long v49 = 0u;
  BOOL v8 = a4 == 1667329381 || a4 == 1835623282;
  long long v46 = 0uLL;
  long long v47 = 0uLL;
  uint64_t v26 = [a3 countByEnumeratingWithState:&v46 objects:v45 count:16];
  if (v26)
  {
    uint64_t v28 = *(void *)v47;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v47 != v28) {
          objc_enumerationMutation(a3);
        }
        uint64_t v29 = v9;
        __int16 v10 = *(void **)(*((void *)&v46 + 1) + 8 * v9);
        objc_msgSend((id)objc_msgSend(v10, "stream"), "setOperatingMode:", 6);
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        int v11 = (void *)[v10 streamConfigs];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v41 objects:v40 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v42;
LABEL_19:
          uint64_t v15 = 0;
          while (1)
          {
            if (*(void *)v42 != v14) {
              objc_enumerationMutation(v11);
            }
            uint32_t v16 = *(void **)(*((void *)&v41 + 1) + 8 * v15);
            if (a4 == 1937339233 || a4 == 1835623282) {
              id v17 = -[VCSessionParticipant newAudioRateControlConfigWithMediaControlInfoVersion:enableFeedbackController:isOneToOne:](self, "newAudioRateControlConfigWithMediaControlInfoVersion:enableFeedbackController:isOneToOne:", v6, v8, objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * v15), "multiwayConfig"), "isOneToOne"));
            }
            else {
              id v17 = -[VCSessionParticipant newVideoRateControlConfigWithMediaControlInfoVersion:enableMediaControlInfoGenerator:enableFeedbackController:isOneToOne:](self, "newVideoRateControlConfigWithMediaControlInfoVersion:enableMediaControlInfoGenerator:enableFeedbackController:isOneToOne:", v6, a4 != 1667329399, v8, objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * v15), "multiwayConfig"), "isOneToOne"));
            }
            uint64_t v18 = v17;
            if (!v17) {
              break;
            }
            [v16 setRateControlConfig:v17];

            if (objc_msgSend((id)objc_msgSend(v16, "multiwayConfig"), "isOneToOne")) {
              networkFeedbackController = self->_networkFeedbackController;
            }
            else {
              networkFeedbackController = 0;
            }
            [v16 setNetworkFeedbackController:networkFeedbackController];
            if (v13 == ++v15)
            {
              uint64_t v13 = [v11 countByEnumeratingWithState:&v41 objects:v40 count:16];
              if (v13) {
                goto LABEL_19;
              }
              goto LABEL_32;
            }
          }
          if ((VCSessionParticipant *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              BOOL v21 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
              if (!v21) {
                return v21;
              }
              -[VCSessionParticipant configureStreamInfosForMultiway:streamGroupID:]();
            }
          }
          else
          {
            if (objc_opt_respondsToSelector()) {
              uint64_t v22 = (__CFString *)[(VCSessionParticipant *)self performSelector:sel_logPrefix];
            }
            else {
              uint64_t v22 = &stru_1F3D3E450;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              uint64_t v23 = VRTraceErrorLogLevelToCSTR();
              uint64_t v24 = *MEMORY[0x1E4F47A50];
              BOOL v21 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
              if (!v21) {
                return v21;
              }
              *(_DWORD *)buf = 136316162;
              uint64_t v31 = v23;
              __int16 v32 = 2080;
              long long v33 = "-[VCSessionParticipant configureStreamInfosForMultiway:streamGroupID:]";
              __int16 v34 = 1024;
              int v35 = 1822;
              __int16 v36 = 2112;
              long long v37 = v22;
              __int16 v38 = 2048;
              __int16 v39 = self;
              _os_log_error_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to create rate control config", buf, 0x30u);
            }
          }
          LOBYTE(v21) = 0;
          return v21;
        }
LABEL_32:
        uint64_t v9 = v29 + 1;
      }
      while (v29 + 1 != v26);
      uint64_t v20 = [a3 countByEnumeratingWithState:&v46 objects:v45 count:16];
      LOBYTE(v21) = 1;
      uint64_t v26 = v20;
      if (v20) {
        continue;
      }
      break;
    }
  }
  else
  {
    LOBYTE(v21) = 1;
  }
  return v21;
}

- (BOOL)configureMultiwayStreamGroups
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableDictionary *)self->_streamGroups count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v3 = (void *)[(NSMutableDictionary *)self->_streamGroups allValues];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v11 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v13;
LABEL_4:
      uint64_t v7 = 0;
      while (1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
        objc_msgSend(v8, "setReportingAgent:", -[VCSessionParticipant reportingAgent](self, "reportingAgent"));
        if (!-[VCSessionParticipant configureStreamInfosForMultiway:streamGroupID:](self, "configureStreamInfosForMultiway:streamGroupID:", [v8 mediaStreamInfoArray], objc_msgSend(v8, "streamGroupID")))break; {
        if (([v8 configureStreams] & 1) == 0)
        }
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
            if (!v9) {
              return v9;
            }
            -[VCSessionParticipant configureMultiwayStreamGroups]();
          }
          goto LABEL_19;
        }
        if (v5 == ++v7)
        {
          uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v11 count:16];
          if (v5) {
            goto LABEL_4;
          }
          goto LABEL_11;
        }
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v9) {
          return v9;
        }
        -[VCSessionParticipant configureMultiwayStreamGroups]();
      }
LABEL_19:
      LOBYTE(v9) = 0;
      return v9;
    }
  }
LABEL_11:
  LOBYTE(v9) = 1;
  return v9;
}

- (VCSessionParticipant)initWithConfig:(id)a3 delegate:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v33.receiver = self;
  v33.super_class = (Class)VCSessionParticipant;
  uint64_t v6 = [(VCObject *)&v33 init];
  if (!v6) {
    return v6;
  }
  if (![a3 idsDestination])
  {
    if ((VCSessionParticipant *)objc_opt_class() == v6)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipant initWithConfig:delegate:]();
        }
      }
      goto LABEL_46;
    }
    if (objc_opt_respondsToSelector()) {
      BOOL v21 = (__CFString *)[(VCSessionParticipant *)v6 performSelector:sel_logPrefix];
    }
    else {
      BOOL v21 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_46;
    }
    uint64_t v24 = VRTraceErrorLogLevelToCSTR();
    uint64_t v25 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_46;
    }
    uint64_t v26 = objc_msgSend((id)objc_msgSend(a3, "idsDestination"), "UTF8String");
    *(_DWORD *)buf = 136316418;
    uint64_t v35 = v24;
    __int16 v36 = 2080;
    long long v37 = "-[VCSessionParticipant initWithConfig:delegate:]";
    __int16 v38 = 1024;
    int v39 = 1853;
    __int16 v40 = 2112;
    long long v41 = v21;
    __int16 v42 = 2048;
    long long v43 = v6;
    __int16 v44 = 2080;
    uint64_t v45 = v26;
    BOOL v27 = " [%s] %s:%d %@(%p) Unable to initialize participant. Destination=%s ";
    uint64_t v28 = v25;
    uint32_t v29 = 58;
LABEL_49:
    _os_log_error_impl(&dword_1E1EA4000, v28, OS_LOG_TYPE_ERROR, v27, buf, v29);
    goto LABEL_46;
  }
  objc_storeWeak(&v6->_delegate, a4);
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  v6->_participantQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCSessionParticipant.participantQueue", 0, CustomRootQueue);
  v6->_unsigned int state = 0;
  v6->_volume = 1.0;
  v6->_audioPosition = 0.0;
  v6->_streamGroups = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v6->_micStreamGroups = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6->_videoStreamGroups = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6->_isLowLatencyAudio = [a3 isLowLatencyAudio];
  v6->_transportSessionID = [a3 transportSessionID];
  v6->_captionsCoordinator = (VCAudioCaptionsCoordinator *)(id)[a3 captionsCoordinator];
  networkFeedbackController = v6->_networkFeedbackController;
  BOOL v9 = (VCNetworkFeedbackController *)[a3 networkFeedbackController];
  v6->_networkFeedbackController = v9;
  if (v9) {
    CFRetain(v9);
  }
  if (networkFeedbackController) {
    CFRelease(networkFeedbackController);
  }
  [(VCSessionParticipant *)v6 setupPreferredIOSettings];
  __int16 v10 = [[VCAudioRuleCollection alloc] initWithPhoneContinuity:0 allowAudioSwitching:1 sbr:0 aacBlockSize:480 isLowLatencyAudio:v6->_isLowLatencyAudio];
  v6->_supportedAudioRules = v10;
  if (!v10)
  {
    if ((VCSessionParticipant *)objc_opt_class() == v6)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipant initWithConfig:delegate:]();
        }
      }
      goto LABEL_46;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v22 = (__CFString *)[(VCSessionParticipant *)v6 performSelector:sel_logPrefix];
    }
    else {
      uint64_t v22 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_46;
    }
    uint64_t v30 = VRTraceErrorLogLevelToCSTR();
    uint64_t v31 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_46;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v35 = v30;
    __int16 v36 = 2080;
    long long v37 = "-[VCSessionParticipant initWithConfig:delegate:]";
    __int16 v38 = 1024;
    int v39 = 1876;
    __int16 v40 = 2112;
    long long v41 = v22;
    __int16 v42 = 2048;
    long long v43 = v6;
    BOOL v27 = " [%s] %s:%d %@(%p) Failed to create the list of supported audio rules";
LABEL_48:
    uint64_t v28 = v31;
    uint32_t v29 = 48;
    goto LABEL_49;
  }
  -[VCAudioRuleCollection setIsHigherAudioREDCutoverU1Enabled:](v6->_supportedAudioRules, "setIsHigherAudioREDCutoverU1Enabled:", [a3 isHigherAudioREDCutoverU1Enabled]);
  v6->_processId = [a3 processId];
  uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
  v6->_participantStreamTokens = (NSMutableDictionary *)v11;
  if (!v11)
  {
    if ((VCSessionParticipant *)objc_opt_class() == v6)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipant initWithConfig:delegate:]();
        }
      }
      goto LABEL_46;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v23 = (__CFString *)[(VCSessionParticipant *)v6 performSelector:sel_logPrefix];
    }
    else {
      uint64_t v23 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (uint64_t v32 = VRTraceErrorLogLevelToCSTR(),
          uint64_t v31 = *MEMORY[0x1E4F47A50],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
LABEL_46:

      return 0;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v35 = v32;
    __int16 v36 = 2080;
    long long v37 = "-[VCSessionParticipant initWithConfig:delegate:]";
    __int16 v38 = 1024;
    int v39 = 1885;
    __int16 v40 = 2112;
    long long v41 = v23;
    __int16 v42 = 2048;
    long long v43 = v6;
    BOOL v27 = " [%s] %s:%d %@(%p) Failed to create the participant stream token dictionary";
    goto LABEL_48;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6->_participantStreamTokens, "setObject:forKeyedSubscript:", [NSNumber numberWithInteger:VCUniqueIDGenerator_GenerateID()], &unk_1F3DC6D38);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    long long v13 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [(NSMutableDictionary *)v6->_participantStreamTokens objectForKeyedSubscript:&unk_1F3DC6D38];
      *(_DWORD *)buf = 136316162;
      uint64_t v35 = v12;
      __int16 v36 = 2080;
      long long v37 = "-[VCSessionParticipant initWithConfig:delegate:]";
      __int16 v38 = 1024;
      int v39 = 1888;
      __int16 v40 = 2048;
      long long v41 = (__CFString *)v6;
      __int16 v42 = 2112;
      long long v43 = (VCSessionParticipant *)v14;
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d (%p) Generated video stream token=%@", buf, 0x30u);
    }
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6->_participantStreamTokens, "setObject:forKeyedSubscript:", [NSNumber numberWithInteger:VCUniqueIDGenerator_GenerateID()], &unk_1F3DC6D20);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    uint64_t v16 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [(NSMutableDictionary *)v6->_participantStreamTokens objectForKeyedSubscript:&unk_1F3DC6D20];
      *(_DWORD *)buf = 136316162;
      uint64_t v35 = v15;
      __int16 v36 = 2080;
      long long v37 = "-[VCSessionParticipant initWithConfig:delegate:]";
      __int16 v38 = 1024;
      int v39 = 1890;
      __int16 v40 = 2048;
      long long v41 = (__CFString *)v6;
      __int16 v42 = 2112;
      long long v43 = (VCSessionParticipant *)v17;
      _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d (%p) Generated audio stream token=%@", buf, 0x30u);
    }
  }
  v6->_idsDestination = (NSString *)(id)[a3 idsDestination];
  v6->_sessionUUID = (NSString *)(id)[a3 sessionUUID];
  v6->_BOOL audioEnabled = 1;
  v6->_BOOL videoEnabled = [a3 videoEnabled];
  v6->_BOOL videoPaused = [a3 videoPaused];
  v6->_participantMKMRecoveryTimeout = (double)+[GKSConnectivitySettings getDecryptionMKMRecoveryInterval];
  v6->_decryptionTimeOutInterval = +[GKSConnectivitySettings getDecryptionTimeoutInterval];
  [(VCSessionParticipant *)v6 updateAudioSpectrumState];
  v6->_securityKeyManager = (VCSecurityKeyManager *)(id)[a3 securityKeyManager];
  v6->_mediaTypeSettingsDict = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v18 = +[VCSessionMediaTypeSettings settingsWithMediaType:1];
  [(VCSessionMediaTypeSettings *)v18 setMediaState:v6->_videoEnabled];
  [(NSMutableDictionary *)v6->_mediaTypeSettingsDict setObject:v18 forKeyedSubscript:&unk_1F3DC6DC8];
  uint64_t v19 = +[VCSessionMediaTypeSettings settingsWithMediaType:0];
  [(VCSessionMediaTypeSettings *)v19 setMediaState:1];
  [(NSMutableDictionary *)v6->_mediaTypeSettingsDict setObject:v19 forKeyedSubscript:&unk_1F3DC6DE0];
  v6->_mediaTypeMixingList = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v6->_mediaTypeMixingListLock._os_unfair_lock_opaque = 0;
  return v6;
}

- (void)dealloc
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ((VCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v15 = v4;
        __int16 v16 = 2080;
        uint64_t v17 = "-[VCSessionParticipant dealloc]";
        __int16 v18 = 1024;
        int v19 = 1923;
        __int16 v20 = 2112;
        p_isa = [(VCSessionParticipant *)self description];
        uint64_t v6 = " [%s] %s:%d Participant dealloc %@";
        uint64_t v7 = v5;
        uint32_t v8 = 38;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v3 = (__CFString *)[(VCSessionParticipant *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      __int16 v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v15 = v9;
        __int16 v16 = 2080;
        uint64_t v17 = "-[VCSessionParticipant dealloc]";
        __int16 v18 = 1024;
        int v19 = 1923;
        __int16 v20 = 2112;
        p_isa = &v3->isa;
        __int16 v22 = 2048;
        uint64_t v23 = self;
        __int16 v24 = 2112;
        uint64_t v25 = [(VCSessionParticipant *)self description];
        uint64_t v6 = " [%s] %s:%d %@(%p) Participant dealloc %@";
        uint64_t v7 = v10;
        uint32_t v8 = 58;
        goto LABEL_11;
      }
    }
  }

  mediaQueue = self->_mediaQueue;
  if (mediaQueue) {
    CFRelease(mediaQueue);
  }

  [(NSMutableDictionary *)self->_mediaTypeMixingList removeAllObjects];
  participantQueue = self->_participantQueue;
  if (participantQueue) {
    dispatch_release(participantQueue);
  }
  objc_storeWeak(&self->_delegate, 0);
  objc_storeWeak(&self->_streamDelegate, 0);
  objc_storeWeak(&self->_reportingAgentWeak, 0);
  v13.receiver = self;
  v13.super_class = (Class)VCSessionParticipant;
  [(VCObject *)&v13 dealloc];
}

- (BOOL)updateMediaStatesWithConfig:(id)a3
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  if ([a3 mediaStates])
  {
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    obuint64_t j = (id)objc_msgSend((id)objc_msgSend(a3, "mediaStates"), "allKeys");
    uint64_t v5 = [obj countByEnumeratingWithState:&v75 objects:v74 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v76;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v76 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void **)(*((void *)&v75 + 1) + 8 * i);
          uint64_t v10 = [v9 unsignedIntValue];
          uint64_t v11 = (VCSessionMediaTypeSettings *)[(NSMutableDictionary *)self->_mediaTypeSettingsDict objectForKeyedSubscript:v9];
          uint64_t v12 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "mediaStates"), "objectForKeyedSubscript:", v9), "unsignedIntValue");
          if (!v11)
          {
            objc_super v13 = +[VCSessionMediaTypeSettings settingsWithMediaType:](VCSessionMediaTypeSettings, "settingsWithMediaType:", [v9 unsignedIntValue]);
            if (!v13)
            {
              if ((VCSessionParticipant *)objc_opt_class() == self)
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  VRTraceErrorLogLevelToCSTR();
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                    -[VCSessionParticipant updateMediaStatesWithConfig:]();
                  }
                }
              }
              else
              {
                if (objc_opt_respondsToSelector()) {
                  uint64_t v35 = (__CFString *)[(VCSessionParticipant *)self performSelector:sel_logPrefix];
                }
                else {
                  uint64_t v35 = &stru_1F3D3E450;
                }
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  uint64_t v36 = VRTraceErrorLogLevelToCSTR();
                  long long v37 = *MEMORY[0x1E4F47A50];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136316418;
                    uint64_t v63 = v36;
                    __int16 v64 = 2080;
                    __int16 v65 = "-[VCSessionParticipant updateMediaStatesWithConfig:]";
                    __int16 v66 = 1024;
                    int v67 = 1970;
                    __int16 v68 = 2112;
                    __int16 v69 = v35;
                    __int16 v70 = 2048;
                    __int16 v71 = self;
                    __int16 v72 = 2112;
                    __int16 v73 = VCSessionMediaType_Name(v10);
                    _os_log_error_impl(&dword_1E1EA4000, v37, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate the media type settings for mediaType=%@", buf, 0x3Au);
                  }
                }
              }
              BOOL v46 = 0;
              goto LABEL_13;
            }
            uint64_t v11 = v13;
            [(NSMutableDictionary *)self->_mediaTypeSettingsDict setObject:v13 forKeyedSubscript:v9];
          }
          [(VCSessionMediaTypeSettings *)v11 setMediaState:v12];
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v75 objects:v74 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    if ((VCSessionParticipant *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_12;
      }
      uint64_t v39 = VRTraceErrorLogLevelToCSTR();
      __int16 v40 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v63 = v39;
      __int16 v64 = 2080;
      __int16 v65 = "-[VCSessionParticipant updateMediaStatesWithConfig:]";
      __int16 v66 = 1024;
      int v67 = 1963;
      long long v41 = " [%s] %s:%d Media state data dictionary is nil";
      __int16 v42 = v40;
      uint32_t v43 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v38 = (__CFString *)[(VCSessionParticipant *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v38 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_12;
      }
      uint64_t v44 = VRTraceErrorLogLevelToCSTR();
      uint64_t v45 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v63 = v44;
      __int16 v64 = 2080;
      __int16 v65 = "-[VCSessionParticipant updateMediaStatesWithConfig:]";
      __int16 v66 = 1024;
      int v67 = 1963;
      __int16 v68 = 2112;
      __int16 v69 = v38;
      __int16 v70 = 2048;
      __int16 v71 = self;
      long long v41 = " [%s] %s:%d %@(%p) Media state data dictionary is nil";
      __int16 v42 = v45;
      uint32_t v43 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v42, OS_LOG_TYPE_DEFAULT, v41, buf, v43);
  }
LABEL_12:
  BOOL v46 = 1;
LABEL_13:
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v47 = (id)[(NSMutableDictionary *)self->_streamGroups allValues];
  uint64_t v49 = [v47 countByEnumeratingWithState:&v58 objects:v57 count:16];
  if (v49)
  {
    uint64_t v48 = *(void *)v59;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v59 != v48) {
          objc_enumerationMutation(v47);
        }
        obja = v14;
        uint64_t v15 = *(void **)(*((void *)&v58 + 1) + 8 * (void)v14);
        id v16 = +[VCSessionParticipant mediaTypesFromStreamGroupID:](VCSessionParticipant, "mediaTypesFromStreamGroupID:", [v15 streamGroupID]);
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v53 objects:v52 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v54;
          do
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v54 != v19) {
                objc_enumerationMutation(v16);
              }
              BOOL v21 = *(void **)(*((void *)&v53 + 1) + 8 * j);
              uint64_t v22 = [v21 unsignedIntValue];
              uint64_t v23 = (VCSessionMediaTypeSettings *)[(NSMutableDictionary *)self->_mediaTypeSettingsDict objectForKeyedSubscript:v21];
              if (!v23)
              {
                uint64_t v23 = +[VCSessionMediaTypeSettings settingsWithMediaType:v22];
                [(NSMutableDictionary *)self->_mediaTypeSettingsDict setObject:v23 forKeyedSubscript:v21];
              }
              -[VCSessionMediaTypeSettings addStreamGroupID:](v23, "addStreamGroupID:", [v15 streamGroupID]);
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v53 objects:v52 count:16];
          }
          while (v18);
        }
        ++v14;
      }
      while (obja + 1 != (char *)v49);
      uint64_t v49 = [v47 countByEnumeratingWithState:&v58 objects:v57 count:16];
    }
    while (v49);
  }
  if ((VCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v25 = VRTraceErrorLogLevelToCSTR();
      uint64_t v26 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        mediaTypeSettingsDict = self->_mediaTypeSettingsDict;
        *(_DWORD *)buf = 136315906;
        uint64_t v63 = v25;
        __int16 v64 = 2080;
        __int16 v65 = "-[VCSessionParticipant updateMediaStatesWithConfig:]";
        __int16 v66 = 1024;
        int v67 = 1988;
        __int16 v68 = 2112;
        __int16 v69 = mediaTypeSettingsDict;
        uint64_t v28 = " [%s] %s:%d _mediaTypeSettingsDict=%@";
        uint32_t v29 = v26;
        uint32_t v30 = 38;
LABEL_39:
        _os_log_impl(&dword_1E1EA4000, v29, OS_LOG_TYPE_DEFAULT, v28, buf, v30);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      __int16 v24 = (__CFString *)[(VCSessionParticipant *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v24 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v31 = VRTraceErrorLogLevelToCSTR();
      uint64_t v32 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        objc_super v33 = self->_mediaTypeSettingsDict;
        *(_DWORD *)buf = 136316418;
        uint64_t v63 = v31;
        __int16 v64 = 2080;
        __int16 v65 = "-[VCSessionParticipant updateMediaStatesWithConfig:]";
        __int16 v66 = 1024;
        int v67 = 1988;
        __int16 v68 = 2112;
        __int16 v69 = v24;
        __int16 v70 = 2048;
        __int16 v71 = self;
        __int16 v72 = 2112;
        __int16 v73 = (__CFString *)v33;
        uint64_t v28 = " [%s] %s:%d %@(%p) _mediaTypeSettingsDict=%@";
        uint32_t v29 = v32;
        uint32_t v30 = 58;
        goto LABEL_39;
      }
    }
  }
  return v46;
}

- (void)setupMediaTypeSettingsWithConfig:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obuint64_t j = (id)[(NSMutableDictionary *)self->_streamGroups allValues];
  uint64_t v24 = [obj countByEnumeratingWithState:&v46 objects:v45 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v47;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v47 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = v4;
        uint64_t v5 = *(void **)(*((void *)&v46 + 1) + 8 * v4);
        id v6 = +[VCSessionParticipant mediaTypesFromStreamGroupID:](VCSessionParticipant, "mediaTypesFromStreamGroupID:", [v5 streamGroupID]);
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v26 = v6;
        uint64_t v7 = [v6 countByEnumeratingWithState:&v41 objects:v40 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v42;
          do
          {
            uint64_t v10 = 0;
            do
            {
              if (*(void *)v42 != v9) {
                objc_enumerationMutation(v26);
              }
              uint64_t v11 = *(void **)(*((void *)&v41 + 1) + 8 * v10);
              uint64_t v12 = [v11 unsignedIntValue];
              objc_super v13 = (VCSessionMediaTypeSettings *)[(NSMutableDictionary *)self->_mediaTypeSettingsDict objectForKeyedSubscript:v11];
              if (!v13)
              {
                objc_super v13 = +[VCSessionMediaTypeSettings settingsWithMediaType:v12];
                [(NSMutableDictionary *)self->_mediaTypeSettingsDict setObject:v13 forKeyedSubscript:v11];
              }
              -[VCSessionMediaTypeSettings addStreamGroupID:](v13, "addStreamGroupID:", [v5 streamGroupID]);
              uint64_t v14 = objc_msgSend((id)objc_msgSend(a3, "mediaStates"), "objectForKeyedSubscript:", v11);
              if (v14)
              {
                uint64_t videoEnabled = [v14 unsignedIntValue];
              }
              else if (v12)
              {
                if (v12 != 1) {
                  goto LABEL_16;
                }
                uint64_t videoEnabled = self->_videoEnabled;
              }
              else
              {
                uint64_t videoEnabled = 1;
              }
              [(VCSessionMediaTypeSettings *)v13 setMediaState:videoEnabled];
LABEL_16:
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                uint64_t v16 = VRTraceErrorLogLevelToCSTR();
                uint64_t v17 = *MEMORY[0x1E4F47A50];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v18 = FourccToCStr([v5 streamGroupID]);
                  uint64_t v19 = VCSessionMediaType_Name(v12);
                  __int16 v20 = VCSessionMediaState_Name([(VCSessionMediaTypeSettings *)v13 mediaState]);
                  *(_DWORD *)buf = 136316418;
                  uint64_t v29 = v16;
                  __int16 v30 = 2080;
                  uint64_t v31 = "-[VCSessionParticipant setupMediaTypeSettingsWithConfig:]";
                  __int16 v32 = 1024;
                  int v33 = 2012;
                  __int16 v34 = 2080;
                  uint64_t v35 = v18;
                  __int16 v36 = 2112;
                  long long v37 = v19;
                  __int16 v38 = 2112;
                  uint64_t v39 = v20;
                  _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Adding streamGroupID=%s for mediaType=%@ mediaState=%@", buf, 0x3Au);
                }
              }
              ++v10;
            }
            while (v8 != v10);
            uint64_t v21 = [v26 countByEnumeratingWithState:&v41 objects:v40 count:16];
            uint64_t v8 = v21;
          }
          while (v21);
        }
        uint64_t v4 = v25 + 1;
      }
      while (v25 + 1 != v24);
      uint64_t v24 = [obj countByEnumeratingWithState:&v46 objects:v45 count:16];
    }
    while (v24);
  }
}

- (void)setupPreferredIOSettings
{
  if (self->_isLowLatencyAudio) {
    uint64_t v3 = 48000;
  }
  else {
    uint64_t v3 = 24000;
  }
  double DoubleValueForKey = VCDefaults_GetDoubleValueForKey(@"forceAudioBlockSize", dbl_1E25A32A0[!self->_isLowLatencyAudio]);
  unsigned int IntValueForKey = VCDefaults_GetIntValueForKey(@"forceAudioSampleRate", v3);
  self->_preferredIOSampleRate = IntValueForKey;
  self->_preferredIOSamplesPerFrame = (DoubleValueForKey * (double)IntValueForKey);
}

- (unsigned)preferredRTPTimestampRateForGroupID:(unsigned int)a3
{
  unsigned int result = 48000;
  if ((int)a3 > 1935897188)
  {
    if (a3 == 1935897189) {
      return result;
    }
    int v4 = 1937339233;
  }
  else
  {
    if (a3 == 1650745716) {
      return result;
    }
    int v4 = 1718909044;
  }
  if (a3 != v4) {
    return 24000;
  }
  return result;
}

- (unsigned)preferredIOSampleRateForGroupID:(unsigned int)a3
{
  uint64_t v3 = 48000;
  if (a3 != 1935897189 && a3 != 1937339233)
  {
    if (self->_isLowLatencyAudio) {
      uint64_t v3 = 48000;
    }
    else {
      uint64_t v3 = 24000;
    }
  }
  return VCDefaults_GetIntValueForKey(@"forceAudioSampleRate", v3);
}

- (unsigned)preferredIOSamplesPerFrameForGroupID:(unsigned int)a3
{
  unsigned int v5 = -[VCSessionParticipant preferredIOSampleRateForGroupID:](self, "preferredIOSampleRateForGroupID:");
  double v6 = 0.02;
  if (a3 != 1935897189 && a3 != 1937339233) {
    double v6 = dbl_1E25A32A0[!self->_isLowLatencyAudio];
  }
  return (VCDefaults_GetDoubleValueForKey(@"forceAudioBlockSize", v6) * (double)v5);
}

- (BOOL)setState:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  unsigned int state = self->_state;
  if (state != a3)
  {
    if ((VCSessionParticipant *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_13;
      }
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      uint64_t v9 = [(VCSessionParticipant *)self participantStateToString:self->_state];
      int v17 = 136316162;
      uint64_t v18 = v7;
      __int16 v19 = 2080;
      __int16 v20 = "-[VCSessionParticipant setState:]";
      __int16 v21 = 1024;
      int v22 = 2098;
      __int16 v23 = 2080;
      uint64_t v24 = v9;
      __int16 v25 = 2080;
      id v26 = [(VCSessionParticipant *)self participantStateToString:v3];
      uint64_t v10 = " [%s] %s:%d Exiting state participant %s. Entering state participant %s.";
      uint64_t v11 = v8;
      uint32_t v12 = 48;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        double v6 = (__CFString *)[(VCSessionParticipant *)self performSelector:sel_logPrefix];
      }
      else {
        double v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_13;
      }
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      uint64_t v14 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      uint64_t v15 = [(VCSessionParticipant *)self participantStateToString:self->_state];
      int v17 = 136316674;
      uint64_t v18 = v13;
      __int16 v19 = 2080;
      __int16 v20 = "-[VCSessionParticipant setState:]";
      __int16 v21 = 1024;
      int v22 = 2098;
      __int16 v23 = 2112;
      uint64_t v24 = v6;
      __int16 v25 = 2048;
      id v26 = (char *)self;
      __int16 v27 = 2080;
      uint64_t v28 = v15;
      __int16 v29 = 2080;
      __int16 v30 = [(VCSessionParticipant *)self participantStateToString:v3];
      uint64_t v10 = " [%s] %s:%d %@(%p) Exiting state participant %s. Entering state participant %s.";
      uint64_t v11 = v14;
      uint32_t v12 = 68;
    }
    _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v17, v12);
LABEL_13:
    self->_unsigned int state = v3;
  }
  return state != v3;
}

- (char)participantStateToString:(unsigned int)a3
{
  if (a3) {
    return "Running";
  }
  else {
    return "Stopped";
  }
}

- (VCSessionParticipantDelegate)delegate
{
  return (VCSessionParticipantDelegate *)objc_loadWeak(&self->_delegate);
}

- (VCSessionParticipantStreamDelegate)streamDelegate
{
  return (VCSessionParticipantStreamDelegate *)objc_loadWeak(&self->_streamDelegate);
}

- (void)setStreamDelegate:(id)a3
{
}

- (void)start
{
  v4[5] = *MEMORY[0x1E4F143B8];
  [(VCSessionParticipant *)self participantVideoToken];
  kdebug_trace();
  participantQueue = self->_participantQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__VCSessionParticipant_start__block_invoke;
  v4[3] = &unk_1E6DB3DC8;
  v4[4] = self;
  dispatch_async(participantQueue, v4);
}

uint64_t __29__VCSessionParticipant_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedStart];
}

- (void)stop
{
  v4[5] = *MEMORY[0x1E4F143B8];
  [(VCSessionParticipant *)self participantVideoToken];
  kdebug_trace();
  participantQueue = self->_participantQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __28__VCSessionParticipant_stop__block_invoke;
  v4[3] = &unk_1E6DB3DC8;
  v4[4] = self;
  dispatch_async(participantQueue, v4);
}

uint64_t __28__VCSessionParticipant_stop__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedStop];
}

- (id)applyVideoEnabledSetting:(BOOL)a3
{
}

- (void)applyScreenEnabledSetting:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ((VCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315906;
        uint64_t v14 = v6;
        __int16 v15 = 2080;
        uint64_t v16 = "-[VCSessionParticipant applyScreenEnabledSetting:]";
        __int16 v17 = 1024;
        int v18 = 2145;
        __int16 v19 = 1024;
        LODWORD(v20) = v3;
        uint64_t v8 = " [%s] %s:%d Changing participant screenEnabled to %d";
        uint64_t v9 = v7;
        uint32_t v10 = 34;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      unsigned int v5 = (__CFString *)[(VCSessionParticipant *)self performSelector:sel_logPrefix];
    }
    else {
      unsigned int v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint32_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136316418;
        uint64_t v14 = v11;
        __int16 v15 = 2080;
        uint64_t v16 = "-[VCSessionParticipant applyScreenEnabledSetting:]";
        __int16 v17 = 1024;
        int v18 = 2145;
        __int16 v19 = 2112;
        __int16 v20 = v5;
        __int16 v21 = 2048;
        int v22 = self;
        __int16 v23 = 1024;
        BOOL v24 = v3;
        uint64_t v8 = " [%s] %s:%d %@(%p) Changing participant screenEnabled to %d";
        uint64_t v9 = v12;
        uint32_t v10 = 54;
        goto LABEL_11;
      }
    }
  }
  self->_BOOL screenEnabled = v3;
}

- (id)streamGroupsForMediaType:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  unsigned int v5 = (void *)[MEMORY[0x1E4F1CA80] set];
  uint64_t v6 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaTypeSettingsDict, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v3]);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v7 = (void *)[v6 streamGroupIDs];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v39 objects:v38 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v40;
    *(void *)&long long v9 = 136315906;
    long long v25 = v9;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v40 != v11) {
          objc_enumerationMutation(v7);
        }
        int v13 = *(__CFString **)(*((void *)&v39 + 1) + 8 * v12);
        uint64_t v14 = -[NSMutableDictionary objectForKeyedSubscript:](self->_participantStreamTokens, "objectForKeyedSubscript:", v13, v25);
        if (v14)
        {
          objc_msgSend(v5, "addObject:", -[NSMutableDictionary objectForKeyedSubscript:](self->_streamGroups, "objectForKeyedSubscript:", v14));
          goto LABEL_8;
        }
        if ((VCSessionParticipant *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v21 = VRTraceErrorLogLevelToCSTR();
            int v22 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v25;
              uint64_t v27 = v21;
              __int16 v28 = 2080;
              __int16 v29 = "-[VCSessionParticipant streamGroupsForMediaType:]";
              __int16 v30 = 1024;
              int v31 = 2155;
              __int16 v32 = 2112;
              int v33 = v13;
              int v18 = v22;
              __int16 v19 = " [%s] %s:%d Stream token not found for streamGroupID=%@";
              uint32_t v20 = 38;
              goto LABEL_19;
            }
          }
        }
        else
        {
          __int16 v15 = &stru_1F3D3E450;
          if (objc_opt_respondsToSelector()) {
            __int16 v15 = (__CFString *)[(VCSessionParticipant *)self performSelector:sel_logPrefix];
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v16 = VRTraceErrorLogLevelToCSTR();
            __int16 v17 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316418;
              uint64_t v27 = v16;
              __int16 v28 = 2080;
              __int16 v29 = "-[VCSessionParticipant streamGroupsForMediaType:]";
              __int16 v30 = 1024;
              int v31 = 2155;
              __int16 v32 = 2112;
              int v33 = v15;
              __int16 v34 = 2048;
              uint64_t v35 = self;
              __int16 v36 = 2112;
              long long v37 = v13;
              int v18 = v17;
              __int16 v19 = " [%s] %s:%d %@(%p) Stream token not found for streamGroupID=%@";
              uint32_t v20 = 58;
LABEL_19:
              _os_log_error_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_ERROR, v19, buf, v20);
            }
          }
        }
LABEL_8:
        ++v12;
      }
      while (v10 != v12);
      uint64_t v23 = [v7 countByEnumeratingWithState:&v39 objects:v38 count:16];
      uint64_t v10 = v23;
    }
    while (v23);
  }
  return v5;
}

- (id)streamGroupsForIDs:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  BOOL v24 = (void *)[MEMORY[0x1E4F1CA80] set];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v38 objects:v37 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v39;
    *(void *)&long long v6 = 136315906;
    long long v23 = v6;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v39 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(__CFString **)(*((void *)&v38 + 1) + 8 * v9);
        uint64_t v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_participantStreamTokens, "objectForKeyedSubscript:", v10, v23);
        if (v11)
        {
          uint64_t v12 = [(NSMutableDictionary *)self->_streamGroups objectForKeyedSubscript:v11];
          if (v12) {
            [v24 addObject:v12];
          }
        }
        else if ((VCSessionParticipant *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v19 = VRTraceErrorLogLevelToCSTR();
            uint32_t v20 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v23;
              uint64_t v26 = v19;
              __int16 v27 = 2080;
              __int16 v28 = "-[VCSessionParticipant streamGroupsForIDs:]";
              __int16 v29 = 1024;
              int v30 = 2168;
              __int16 v31 = 2112;
              __int16 v32 = v10;
              uint64_t v16 = v20;
              __int16 v17 = " [%s] %s:%d Stream token not found for streamGroupID=%@";
              uint32_t v18 = 38;
              goto LABEL_20;
            }
          }
        }
        else
        {
          int v13 = &stru_1F3D3E450;
          if (objc_opt_respondsToSelector()) {
            int v13 = (__CFString *)[(VCSessionParticipant *)self performSelector:sel_logPrefix];
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v14 = VRTraceErrorLogLevelToCSTR();
            __int16 v15 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316418;
              uint64_t v26 = v14;
              __int16 v27 = 2080;
              __int16 v28 = "-[VCSessionParticipant streamGroupsForIDs:]";
              __int16 v29 = 1024;
              int v30 = 2168;
              __int16 v31 = 2112;
              __int16 v32 = v13;
              __int16 v33 = 2048;
              __int16 v34 = self;
              __int16 v35 = 2112;
              __int16 v36 = v10;
              uint64_t v16 = v15;
              __int16 v17 = " [%s] %s:%d %@(%p) Stream token not found for streamGroupID=%@";
              uint32_t v18 = 58;
LABEL_20:
              _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, v17, buf, v18);
            }
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v21 = [a3 countByEnumeratingWithState:&v38 objects:v37 count:16];
      uint64_t v7 = v21;
    }
    while (v21);
  }
  return v24;
}

- (id)completeMediaStateChange
{
  return 0;
}

- (id)applyMediaState:(unsigned int)a3 forMediaType:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  long long v6 = self;
  uint64_t v123 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaTypeSettingsDict, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:*(void *)&a4]);
  if (!v7)
  {
    long long v56 = +[VCSessionErrorUtils VCSessionParticipantErrorEvent:errorPath:](VCSessionErrorUtils, "VCSessionParticipantErrorEvent:errorPath:", 12, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSessionParticipant.m", 2190));
    if ((VCSessionParticipant *)objc_opt_class() == v6)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipant applyMediaState:forMediaType:]();
        }
      }
      return v56;
    }
    if (objc_opt_respondsToSelector()) {
      long long v58 = (__CFString *)[(VCSessionParticipant *)v6 performSelector:sel_logPrefix];
    }
    else {
      long long v58 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return v56;
    }
    uint64_t v59 = VRTraceErrorLogLevelToCSTR();
    long long v60 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return v56;
    }
    *(_DWORD *)buf = 136316418;
    uint64_t v93 = v59;
    __int16 v94 = 2080;
    v95 = "-[VCSessionParticipant applyMediaState:forMediaType:]";
    __int16 v96 = 1024;
    int v97 = 2191;
    __int16 v98 = 2112;
    v99 = v58;
    __int16 v100 = 2048;
    v101 = v6;
    __int16 v102 = 2112;
    v103 = VCSessionMediaType_Name(v4);
    uint64_t v62 = " [%s] %s:%d %@(%p) mediaTypeSettings is missing for mediaType=%@";
    uint64_t v63 = v60;
LABEL_85:
    uint32_t v64 = 58;
    goto LABEL_86;
  }
  uint64_t v8 = v7;
  unsigned int v81 = a3;
  uint64_t v9 = (void *)[v7 streamGroupIDs];
  v86 = v6;
  unsigned int v80 = v4;
  if ([(VCSessionParticipant *)v6 isActiveMediaType:v4] && v6->_state == 1)
  {
    uint64_t v10 = (void *)[MEMORY[0x1E4F1CA80] setWithSet:v9];
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v9, "count"));
  }
  else
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v9, "count"));
    uint64_t v11 = (void *)[MEMORY[0x1E4F1CA80] setWithSet:v9];
    long long v119 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    obuint64_t j = (id)[(NSMutableDictionary *)v6->_mediaTypeSettingsDict allValues];
    uint64_t v85 = [obj countByEnumeratingWithState:&v119 objects:v118 count:16];
    if (v85)
    {
      uint64_t v83 = *(void *)v120;
      v84 = v8;
      do
      {
        for (uint64_t i = 0; i != v85; ++i)
        {
          if (*(void *)v120 != v83) {
            objc_enumerationMutation(obj);
          }
          int v13 = *(void **)(*((void *)&v119 + 1) + 8 * i);
          if (v13 != v8)
          {
            BOOL v14 = -[VCSessionParticipant isActiveMediaType:](v86, "isActiveMediaType:", [*(id *)(*((void *)&v119 + 1) + 8 * i) mediaType])&& v86->_state == 1;
            long long v116 = 0u;
            long long v117 = 0u;
            long long v114 = 0u;
            long long v115 = 0u;
            __int16 v15 = (void *)[v13 streamGroupIDs];
            uint64_t v16 = [v15 countByEnumeratingWithState:&v114 objects:v113 count:16];
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v18 = *(void *)v115;
              do
              {
                for (uint64_t j = 0; j != v17; ++j)
                {
                  if (*(void *)v115 != v18) {
                    objc_enumerationMutation(v15);
                  }
                  uint64_t v20 = *(void *)(*((void *)&v114 + 1) + 8 * j);
                  if (([v9 containsObject:v20] & v14) == 1)
                  {
                    [v10 addObject:v20];
                    [v11 removeObject:v20];
                  }
                }
                uint64_t v17 = [v15 countByEnumeratingWithState:&v114 objects:v113 count:16];
              }
              while (v17);
            }
          }
          uint64_t v8 = v84;
        }
        uint64_t v85 = [obj countByEnumeratingWithState:&v119 objects:v118 count:16];
      }
      while (v85);
      long long v6 = v86;
    }
  }
  uint64_t v21 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v10, "count"));
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  uint64_t v22 = [v10 countByEnumeratingWithState:&v109 objects:v108 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v110;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v110 != v24) {
          objc_enumerationMutation(v10);
        }
        uint64_t v26 = *(__CFString **)(*((void *)&v109 + 1) + 8 * v25);
        uint64_t v27 = [(NSMutableDictionary *)v6->_participantStreamTokens objectForKeyedSubscript:v26];
        if (v27)
        {
          objc_msgSend(v21, "addObject:", -[NSMutableDictionary objectForKeyedSubscript:](v6->_streamGroups, "objectForKeyedSubscript:", v27));
          goto LABEL_33;
        }
        if ((VCSessionParticipant *)objc_opt_class() == v6)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v34 = VRTraceErrorLogLevelToCSTR();
            __int16 v35 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315906;
              uint64_t v93 = v34;
              __int16 v94 = 2080;
              v95 = "-[VCSessionParticipant applyMediaState:forMediaType:]";
              __int16 v96 = 1024;
              int v97 = 2221;
              __int16 v98 = 2112;
              v99 = v26;
              __int16 v31 = v35;
              __int16 v32 = " [%s] %s:%d Stream token not found for streamGroupID=%@";
              uint32_t v33 = 38;
              goto LABEL_44;
            }
          }
        }
        else
        {
          __int16 v28 = &stru_1F3D3E450;
          if (objc_opt_respondsToSelector()) {
            __int16 v28 = (__CFString *)[(VCSessionParticipant *)v6 performSelector:sel_logPrefix];
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v29 = VRTraceErrorLogLevelToCSTR();
            int v30 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316418;
              uint64_t v93 = v29;
              __int16 v94 = 2080;
              v95 = "-[VCSessionParticipant applyMediaState:forMediaType:]";
              __int16 v96 = 1024;
              int v97 = 2221;
              __int16 v98 = 2112;
              v99 = v28;
              __int16 v100 = 2048;
              v101 = v86;
              __int16 v102 = 2112;
              v103 = v26;
              __int16 v31 = v30;
              __int16 v32 = " [%s] %s:%d %@(%p) Stream token not found for streamGroupID=%@";
              uint32_t v33 = 58;
LABEL_44:
              _os_log_error_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_ERROR, v32, buf, v33);
            }
          }
        }
LABEL_33:
        ++v25;
        long long v6 = v86;
      }
      while (v23 != v25);
      uint64_t v36 = [v10 countByEnumeratingWithState:&v109 objects:v108 count:16];
      uint64_t v23 = v36;
    }
    while (v36);
  }
  uint64_t v37 = [v21 count];
  uint64_t v38 = v81;
  if (!v37
    || (uint64_t v39 = [(VCSessionParticipant *)v6 updateMediaState:v81 forStreamGroups:v21]) == 0)
  {
    long long v40 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v11, "count", v38));
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    uint64_t v41 = [v11 countByEnumeratingWithState:&v88 objects:v87 count:16];
    if (!v41) {
      goto LABEL_68;
    }
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v89;
    while (1)
    {
      uint64_t v44 = 0;
      do
      {
        if (*(void *)v89 != v43) {
          objc_enumerationMutation(v11);
        }
        uint64_t v45 = *(__CFString **)(*((void *)&v88 + 1) + 8 * v44);
        uint64_t v46 = [(NSMutableDictionary *)v6->_participantStreamTokens objectForKeyedSubscript:v45];
        if (v46)
        {
          objc_msgSend(v40, "addObject:", -[NSMutableDictionary objectForKeyedSubscript:](v6->_streamGroups, "objectForKeyedSubscript:", v46));
          goto LABEL_55;
        }
        if ((VCSessionParticipant *)objc_opt_class() == v6)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v53 = VRTraceErrorLogLevelToCSTR();
            long long v54 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315906;
              uint64_t v93 = v53;
              __int16 v94 = 2080;
              v95 = "-[VCSessionParticipant applyMediaState:forMediaType:]";
              __int16 v96 = 1024;
              int v97 = 2236;
              __int16 v98 = 2112;
              v99 = v45;
              uint64_t v50 = v54;
              __int16 v51 = " [%s] %s:%d Stream token not found for streamGroupID=%@";
              uint32_t v52 = 38;
              goto LABEL_66;
            }
          }
        }
        else
        {
          long long v47 = &stru_1F3D3E450;
          if (objc_opt_respondsToSelector()) {
            long long v47 = (__CFString *)[(VCSessionParticipant *)v6 performSelector:sel_logPrefix];
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v48 = VRTraceErrorLogLevelToCSTR();
            long long v49 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316418;
              uint64_t v93 = v48;
              __int16 v94 = 2080;
              v95 = "-[VCSessionParticipant applyMediaState:forMediaType:]";
              __int16 v96 = 1024;
              int v97 = 2236;
              __int16 v98 = 2112;
              v99 = v47;
              __int16 v100 = 2048;
              v101 = v86;
              __int16 v102 = 2112;
              v103 = v45;
              uint64_t v50 = v49;
              __int16 v51 = " [%s] %s:%d %@(%p) Stream token not found for streamGroupID=%@";
              uint32_t v52 = 58;
LABEL_66:
              _os_log_error_impl(&dword_1E1EA4000, v50, OS_LOG_TYPE_ERROR, v51, buf, v52);
            }
          }
        }
LABEL_55:
        ++v44;
        long long v6 = v86;
      }
      while (v42 != v44);
      uint64_t v55 = [v11 countByEnumeratingWithState:&v88 objects:v87 count:16];
      uint64_t v42 = v55;
      if (!v55)
      {
LABEL_68:
        if (![v40 count]) {
          return 0;
        }
        long long v56 = [(VCSessionParticipant *)v6 updateMediaState:0 forStreamGroups:v40];
        if (v56)
        {
          if ((VCSessionParticipant *)objc_opt_class() == v6)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              uint64_t v70 = VRTraceErrorLogLevelToCSTR();
              __int16 v71 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
              {
                __int16 v72 = VCSessionMediaType_Name(v80);
                *(_DWORD *)buf = 136316162;
                uint64_t v93 = v70;
                __int16 v94 = 2080;
                v95 = "-[VCSessionParticipant applyMediaState:forMediaType:]";
                __int16 v96 = 1024;
                int v97 = 2243;
                __int16 v98 = 2112;
                v99 = v72;
                __int16 v100 = 2112;
                v101 = (VCSessionParticipant *)v56;
                uint64_t v62 = " [%s] %s:%d Failed to deactivate stream groups. mediaState=%@ error=%@";
                uint64_t v63 = v71;
                uint32_t v64 = 48;
                goto LABEL_86;
              }
            }
          }
          else
          {
            if (objc_opt_respondsToSelector()) {
              __int16 v57 = (__CFString *)[(VCSessionParticipant *)v6 performSelector:sel_logPrefix];
            }
            else {
              __int16 v57 = &stru_1F3D3E450;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              uint64_t v73 = VRTraceErrorLogLevelToCSTR();
              id v74 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
              {
                long long v75 = VCSessionMediaType_Name(v80);
                *(_DWORD *)buf = 136316674;
                uint64_t v93 = v73;
                __int16 v94 = 2080;
                v95 = "-[VCSessionParticipant applyMediaState:forMediaType:]";
                __int16 v96 = 1024;
                int v97 = 2243;
                __int16 v98 = 2112;
                v99 = v57;
                __int16 v100 = 2048;
                v101 = v86;
                __int16 v102 = 2112;
                v103 = v75;
                __int16 v104 = 2112;
                v105 = v56;
                uint64_t v62 = " [%s] %s:%d %@(%p) Failed to deactivate stream groups. mediaState=%@ error=%@";
                uint64_t v63 = v74;
                uint32_t v64 = 68;
                goto LABEL_86;
              }
            }
          }
        }
        return v56;
      }
    }
  }
  long long v56 = (__CFString *)v39;
  if ((VCSessionParticipant *)objc_opt_class() == v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return v56;
    }
    uint64_t v66 = VRTraceErrorLogLevelToCSTR();
    int v67 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return v56;
    }
    __int16 v68 = VCSessionMediaType_Name(v80);
    __int16 v69 = VCSessionMediaState_Name(v81);
    *(_DWORD *)buf = 136316418;
    uint64_t v93 = v66;
    __int16 v94 = 2080;
    v95 = "-[VCSessionParticipant applyMediaState:forMediaType:]";
    __int16 v96 = 1024;
    int v97 = 2228;
    __int16 v98 = 2112;
    v99 = v68;
    __int16 v100 = 2112;
    v101 = (VCSessionParticipant *)v69;
    __int16 v102 = 2112;
    v103 = v56;
    uint64_t v62 = " [%s] %s:%d Failed to activate stream groups. mediaType=%@ mediaState=%@ error=%@";
    uint64_t v63 = v67;
    goto LABEL_85;
  }
  if (objc_opt_respondsToSelector()) {
    __int16 v65 = (__CFString *)[(VCSessionParticipant *)v6 performSelector:sel_logPrefix];
  }
  else {
    __int16 v65 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v76 = VRTraceErrorLogLevelToCSTR();
    long long v77 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      long long v78 = VCSessionMediaType_Name(v80);
      uint64_t v79 = VCSessionMediaState_Name(v81);
      *(_DWORD *)buf = 136316930;
      uint64_t v93 = v76;
      __int16 v94 = 2080;
      v95 = "-[VCSessionParticipant applyMediaState:forMediaType:]";
      __int16 v96 = 1024;
      int v97 = 2228;
      __int16 v98 = 2112;
      v99 = v65;
      __int16 v100 = 2048;
      v101 = v86;
      __int16 v102 = 2112;
      v103 = v78;
      __int16 v104 = 2112;
      v105 = v79;
      __int16 v106 = 2112;
      v107 = v56;
      uint64_t v62 = " [%s] %s:%d %@(%p) Failed to activate stream groups. mediaType=%@ mediaState=%@ error=%@";
      uint64_t v63 = v77;
      uint32_t v64 = 78;
LABEL_86:
      _os_log_error_impl(&dword_1E1EA4000, v63, OS_LOG_TYPE_ERROR, v62, buf, v64);
    }
  }
  return v56;
}

- (id)updateMediaState:(unsigned int)a3 forStreamGroups:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_participantQueue);
  obuint64_t j = a4;
  if (![a4 count]
    && (id v7 = +[VCSessionErrorUtils VCSessionParticipantErrorEvent:errorPath:](VCSessionErrorUtils, "VCSessionParticipantErrorEvent:errorPath:", 12, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSessionParticipant.m", 2254))) != 0)
  {
    uint64_t v20 = v7;
    if ((VCSessionParticipant *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionParticipant updateMediaState:forStreamGroups:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v32 = (__CFString *)[(VCSessionParticipant *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v32 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v33 = VRTraceErrorLogLevelToCSTR();
        uint64_t v34 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          uint64_t v39 = v33;
          __int16 v40 = 2080;
          uint64_t v41 = "-[VCSessionParticipant updateMediaState:forStreamGroups:]";
          __int16 v42 = 1024;
          int v43 = 2256;
          __int16 v44 = 2112;
          uint64_t v45 = v32;
          __int16 v46 = 2048;
          long long v47 = self;
          __int16 v48 = 2112;
          *(void *)long long v49 = v20;
          _os_log_error_impl(&dword_1E1EA4000, v34, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Stream groups not found. error=%@", buf, 0x3Au);
        }
      }
    }
  }
  else
  {
    if (self->_state == 1)
    {
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      uint64_t v8 = [a4 countByEnumeratingWithState:&v56 objects:v55 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v57;
        uint64_t v11 = &selRef_isInputAvailable;
        do
        {
          uint64_t v12 = 0;
          uint64_t v36 = v11[417];
          do
          {
            if (*(void *)v57 != v10) {
              objc_enumerationMutation(obj);
            }
            int v13 = *(VCSessionParticipant **)(*((void *)&v56 + 1) + 8 * v12);
            BOOL v14 = [(VCSessionParticipant *)self isStreamGroupActive:v13];
            int v15 = [(VCSessionParticipant *)v13 state];
            int v16 = v15;
            int v17 = !v14;
            if (v14 && v5 == 1 && !v15)
            {
              uint64_t v18 = [(VCSessionParticipant *)v13 start];
              goto LABEL_20;
            }
            if (v5 == 1 || v15 == 0) {
              int v17 = 0;
            }
            if (v17 == 1)
            {
              uint64_t v18 = [(VCSessionParticipant *)v13 stop];
LABEL_20:
              uint64_t v20 = (void *)v18;
              if (v18) {
                return v20;
              }
              goto LABEL_21;
            }
            if ((VCSessionParticipant *)objc_opt_class() == self)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                uint64_t v27 = VRTraceErrorLogLevelToCSTR();
                __int16 v28 = *MEMORY[0x1E4F47A50];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v29 = VCSessionMediaState_Name(v5);
                  *(_DWORD *)buf = 136316674;
                  uint64_t v39 = v27;
                  __int16 v40 = 2080;
                  uint64_t v41 = "-[VCSessionParticipant updateMediaState:forStreamGroups:]";
                  __int16 v42 = 1024;
                  int v43 = 2270;
                  __int16 v44 = 2112;
                  uint64_t v45 = v29;
                  __int16 v46 = 2112;
                  long long v47 = v13;
                  __int16 v48 = 1024;
                  *(_DWORD *)long long v49 = v14;
                  *(_WORD *)&v49[4] = 1024;
                  *(_DWORD *)&v49[6] = v16 != 0;
                  uint64_t v24 = v28;
                  uint64_t v25 = " [%s] %s:%d Ignore mediaState=%@ for streamGroup=%@ isStreamGroupActive=%d isStreamGroupStarted=%d";
                  uint32_t v26 = 60;
                  goto LABEL_32;
                }
              }
            }
            else
            {
              uint64_t v21 = &stru_1F3D3E450;
              if (objc_opt_respondsToSelector()) {
                uint64_t v21 = (__CFString *)[(VCSessionParticipant *)self performSelector:v36];
              }
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                uint64_t v35 = VRTraceErrorLogLevelToCSTR();
                uint64_t v22 = *MEMORY[0x1E4F47A50];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v23 = VCSessionMediaState_Name(v5);
                  *(_DWORD *)buf = 136317186;
                  uint64_t v39 = v35;
                  __int16 v40 = 2080;
                  uint64_t v41 = "-[VCSessionParticipant updateMediaState:forStreamGroups:]";
                  __int16 v42 = 1024;
                  int v43 = 2270;
                  __int16 v44 = 2112;
                  uint64_t v45 = v21;
                  __int16 v46 = 2048;
                  long long v47 = self;
                  __int16 v48 = 2112;
                  *(void *)long long v49 = v23;
                  *(_WORD *)&v49[8] = 2112;
                  uint64_t v50 = v13;
                  __int16 v51 = 1024;
                  BOOL v52 = v14;
                  __int16 v53 = 1024;
                  BOOL v54 = v16 != 0;
                  uint64_t v24 = v22;
                  uint64_t v25 = " [%s] %s:%d %@(%p) Ignore mediaState=%@ for streamGroup=%@ isStreamGroupActive=%d isStreamGroupStarted=%d";
                  uint32_t v26 = 80;
LABEL_32:
                  _os_log_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_DEFAULT, v25, buf, v26);
                }
              }
            }
LABEL_21:
            ++v12;
          }
          while (v9 != v12);
          uint64_t v30 = [obj countByEnumeratingWithState:&v56 objects:v55 count:16];
          uint64_t v9 = v30;
          uint64_t v11 = &selRef_isInputAvailable;
        }
        while (v30);
      }
    }
    return 0;
  }
  return v20;
}

- (void)updateVideoPaused:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((VCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      id v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)int v13 = 136315906;
        *(void *)&v13[4] = v6;
        *(_WORD *)&v13[12] = 2080;
        *(void *)&v13[14] = "-[VCSessionParticipant updateVideoPaused:]";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 2282;
        WORD2(v14) = 1024;
        *(_DWORD *)((char *)&v14 + 6) = v3;
        uint64_t v8 = " [%s] %s:%d Changing participant videoPaused to %d";
        uint64_t v9 = v7;
        uint32_t v10 = 34;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, v13, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCSessionParticipant *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)int v13 = 136316418;
        *(void *)&v13[4] = v11;
        *(_WORD *)&v13[12] = 2080;
        *(void *)&v13[14] = "-[VCSessionParticipant updateVideoPaused:]";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 2282;
        WORD2(v14) = 2112;
        *(void *)((char *)&v14 + 6) = v5;
        HIWORD(v14) = 2048;
        int v15 = self;
        LOWORD(v16) = 1024;
        *(_DWORD *)((char *)&v16 + 2) = v3;
        uint64_t v8 = " [%s] %s:%d %@(%p) Changing participant videoPaused to %d";
        uint64_t v9 = v12;
        uint32_t v10 = 54;
        goto LABEL_11;
      }
    }
  }
  self->_BOOL videoPaused = v3;
  [(VCSessionParticipant *)self updateAudioSpectrumState];
}

- (BOOL)isMuted
{
  return self->_isMuted;
}

- (NSArray)allParticipantStreamInfo
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = (void *)[(NSMutableDictionary *)self->_streamGroups allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        -[NSArray addObjectsFromArray:](v3, "addObjectsFromArray:", [*(id *)(*((void *)&v11 + 1) + 8 * v8++) mediaStreamInfoArray]);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v10 count:16];
    }
    while (v6);
  }
  return v3;
}

- (void)setMuted:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  participantQueue = self->_participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__VCSessionParticipant_setMuted___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __33__VCSessionParticipant_setMuted___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 392) setMuted:*(unsigned __int8 *)(a1 + 40)];
  *(unsigned char *)(*(void *)(a1 + 32) + 372) = *(unsigned char *)(a1 + 40);
  return result;
}

- (BOOL)setVolume:(float)a3
{
  BOOL v3 = a3 <= 1.0 && a3 >= 0.0;
  if (v3) {
    self->_volume = a3;
  }
  return v3;
}

- (BOOL)setAudioPosition:(float)a3
{
  BOOL v3 = a3 <= 1.0 && a3 >= -1.0;
  if (v3) {
    self->_audioPosition = a3;
  }
  return v3;
}

- (void)setAudioEnabled:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  participantQueue = self->_participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__VCSessionParticipant_setAudioEnabled___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __40__VCSessionParticipant_setAudioEnabled___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedSetAudioEnabled:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setVideoEnabled:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  participantQueue = self->_participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__VCSessionParticipant_setVideoEnabled___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __40__VCSessionParticipant_setVideoEnabled___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedSetVideoEnabled:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setScreenEnabled:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  participantQueue = self->_participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__VCSessionParticipant_setScreenEnabled___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __41__VCSessionParticipant_setScreenEnabled___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedSetScreenEnabled:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setAudioPaused:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  participantQueue = self->_participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__VCSessionParticipant_setAudioPaused___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __39__VCSessionParticipant_setAudioPaused___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedSetAudioPaused:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setVideoPaused:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  participantQueue = self->_participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__VCSessionParticipant_setVideoPaused___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __39__VCSessionParticipant_setVideoPaused___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedSetVideoPaused:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setMediaState:(unsigned int)a3 forMediaType:(unsigned int)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  participantQueue = self->_participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__VCSessionParticipant_setMediaState_forMediaType___block_invoke;
  block[3] = &unk_1E6DB4568;
  block[4] = self;
  unsigned int v6 = a3;
  unsigned int v7 = a4;
  dispatch_async(participantQueue, block);
}

uint64_t __51__VCSessionParticipant_setMediaState_forMediaType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedSetMediaState:*(unsigned int *)(a1 + 40) forMediaType:*(unsigned int *)(a1 + 44)];
}

- (void)setMediaType:(unsigned int)a3 mixingWithMediaType:(unsigned int)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  participantQueue = self->_participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__VCSessionParticipant_setMediaType_mixingWithMediaType___block_invoke;
  block[3] = &unk_1E6DB4568;
  block[4] = self;
  unsigned int v6 = a3;
  unsigned int v7 = a4;
  dispatch_async(participantQueue, block);
}

uint64_t __57__VCSessionParticipant_setMediaType_mixingWithMediaType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchSetMediaType:*(unsigned int *)(a1 + 40) mixingWithMediaType:*(unsigned int *)(a1 + 44)];
}

- (unsigned)streamGroupStateFromStreamGroupID:(unsigned int)a3
{
  uint64_t v3 = objc_msgSend(-[VCSessionParticipant streamGroupWithID:](self, "streamGroupWithID:", *(void *)&a3), "state");
  uint64_t v4 = objc_opt_class();

  return [v4 mediaStreamGroupStateToVCStreamGroupState:v3];
}

+ (unsigned)mediaStreamGroupStateToVCStreamGroupState:(unsigned int)a3
{
  unsigned int v3 = a3;
  if (a3 >= 3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCSessionParticipant mediaStreamGroupStateToVCStreamGroupState:]();
      }
    }
    return -1;
  }
  return v3;
}

+ (id)mediaTypesFromStreamGroupID:(unsigned int)a3
{
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CA80] set];
  BOOL v5 = v4;
  unsigned int v6 = &unk_1F3DC6DC8;
  if ((int)a3 > 1718909043)
  {
    if ((int)a3 <= 1936290408)
    {
      if ((int)a3 > 1835623286)
      {
        if (a3 != 1835623287)
        {
          if (a3 == 1935897189)
          {
            unsigned int v6 = &unk_1F3DC6DF8;
            goto LABEL_28;
          }
          return v5;
        }
      }
      else
      {
        if (a3 == 1718909044)
        {
          unsigned int v6 = &unk_1F3DC6E58;
          goto LABEL_28;
        }
        if (a3 != 1835623282) {
          return v5;
        }
      }
      unsigned int v6 = &unk_1F3DC6DE0;
      goto LABEL_28;
    }
    if (a3 - 1986618417 < 4) {
      goto LABEL_28;
    }
    if (a3 == 1936290409)
    {
      unsigned int v6 = &unk_1F3DC6E40;
      goto LABEL_28;
    }
    if (a3 == 1937339233)
    {
      unsigned int v6 = &unk_1F3DC6E10;
      goto LABEL_28;
    }
  }
  else if ((int)a3 <= 1667330163)
  {
    if (a3 == 1650745716)
    {
      [v4 addObject:&unk_1F3DC6E58];
      [v5 addObject:&unk_1F3DC6E70];
      unsigned int v6 = &unk_1F3DC6E88;
      goto LABEL_28;
    }
    if (a3 == 1667329381 || a3 == 1667329399) {
      goto LABEL_28;
    }
  }
  else
  {
    if (a3 - 1684108337 < 5)
    {
LABEL_28:
      [v5 addObject:v6];
      return v5;
    }
    if (a3 == 1667330164)
    {
      unsigned int v6 = &unk_1F3DC6E28;
      goto LABEL_28;
    }
    if (a3 == 1717854580)
    {
      unsigned int v6 = &unk_1F3DC6E70;
      goto LABEL_28;
    }
  }
  return v5;
}

- (void)setStatisticsCollector:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  statisticsCollector = self->_statisticsCollector;

  self->_statisticsCollector = (AVCStatisticsCollector *)a3;
  if (!statisticsCollector) {
    [(VCSessionParticipant *)self createRedundancyControllers];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unsigned int v6 = (void *)[(NSMutableDictionary *)self->_streamGroups allValues];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v10++) setStatisticsCollector:self->_statisticsCollector];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v11 count:16];
    }
    while (v8);
  }
}

- (void)setBasebandCongestionDetector:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];

  self->_basebandCongestionDetector = (AVCBasebandCongestionDetector *)a3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    unsigned int v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v18 = v5;
      __int16 v19 = 2080;
      uint64_t v20 = "-[VCSessionParticipant setBasebandCongestionDetector:]";
      __int16 v21 = 1024;
      int v22 = 2451;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Set VCRateControl baseband congestion detector to all audio streams", buf, 0x1Cu);
    }
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  micStreamGroups = self->_micStreamGroups;
  uint64_t v8 = [(NSMutableArray *)micStreamGroups countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(micStreamGroups);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * i) setBasebandCongestionDetector:self->_basebandCongestionDetector];
      }
      uint64_t v9 = [(NSMutableArray *)micStreamGroups countByEnumeratingWithState:&v13 objects:v12 count:16];
    }
    while (v9);
  }
}

- (void)createRedundancyControllers
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = -[VCRedundancyControllerVideo initWithDelegate:mode:parameters:]([VCRedundancyControllerVideo alloc], "initWithDelegate:mode:parameters:", self, 7, self->_statisticsCollector, 400);
  self->_videoRedundancyController = v3;
  [(VCRedundancyControllerVideo *)v3 setStatisticsID:self->_idsParticipantID];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315650;
      uint64_t v7 = v4;
      __int16 v8 = 2080;
      uint64_t v9 = "-[VCSessionParticipant createRedundancyControllers]";
      __int16 v10 = 1024;
      int v11 = 2463;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Redundancy controllers are created", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

- (void)collectVideoChannelMetrics:(id *)a3
{
}

- (void)collectAudioChannelMetrics:(id *)a3
{
}

- (void)collectCaptionsChannelMetrics:(id *)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  VCMediaChannelMetrics_Reset((uint64_t)a3);
  participantQueue = self->_participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__VCSessionParticipant_collectCaptionsChannelMetrics___block_invoke;
  block[3] = &unk_1E6DB4568;
  block[4] = self;
  void block[5] = a3;
  dispatch_sync(participantQueue, block);
}

uint64_t __54__VCSessionParticipant_collectCaptionsChannelMetrics___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) captionsGroup];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 collectAndLogChannelMetrics:v3];
}

- (void)setMediaQueue:(tagVCMediaQueue *)a3
{
  mediaQueue = self->_mediaQueue;
  if (mediaQueue != a3)
  {
    if (mediaQueue) {
      CFRelease(mediaQueue);
    }
    if (a3) {
      int v6 = (tagVCMediaQueue *)CFRetain(a3);
    }
    else {
      int v6 = 0;
    }
    self->_mediaQueue = v6;
  }
}

- (void)handleStreamGroupsActiveConnectionChange:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = (void *)[(NSMutableDictionary *)self->_streamGroups allValues];
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
        [*(id *)(*((void *)&v10 + 1) + 8 * v8++) handleActiveConnectionChange:a3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v9 count:16];
    }
    while (v6);
  }
}

- (BOOL)setupMediaSyncForStreamGroup:(id)a3
{
  id v4 = -[VCSessionParticipant streamGroupWithID:](self, "streamGroupWithID:", [a3 syncGroupID]);
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionParticipant setupMediaSyncForStreamGroup:](v6, a3);
      }
    }
    goto LABEL_3;
  }
  if ([v4 addSyncDestination:a3])
  {
LABEL_3:
    LOBYTE(v5) = 1;
    return v5;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v5) {
      return v5;
    }
    -[VCSessionParticipant setupMediaSyncForStreamGroup:](v7, a3);
  }
  LOBYTE(v5) = 0;
  return v5;
}

- (BOOL)setupStreamGroupMediaSync
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  videoStreamGroups = self->_videoStreamGroups;
  uint64_t v4 = [(NSMutableArray *)videoStreamGroups countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v12 != v6) {
        objc_enumerationMutation(videoStreamGroups);
      }
      BOOL v8 = [(VCSessionParticipant *)self setupMediaSyncForStreamGroup:*(void *)(*((void *)&v11 + 1) + 8 * v7)];
      if (!v8) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [(NSMutableArray *)videoStreamGroups countByEnumeratingWithState:&v11 objects:v10 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v8) = 1;
  }
  return v8;
}

- (void)swapScreenStreamGroupSyncSourceWithState:(unsigned int)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_participantQueue);
  id v5 = [(VCSessionParticipant *)self systemAudioGroup];
  id v6 = [(VCSessionParticipant *)self microphoneGroup];
  id v7 = [(VCSessionParticipant *)self screenGroup];
  if (a3 == 1)
  {
    if ((VCSessionParticipant *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_26;
      }
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      long long v16 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_26;
      }
      *(_DWORD *)uint64_t v25 = 136315650;
      *(void *)&v25[4] = v15;
      *(_WORD *)&v25[12] = 2080;
      *(void *)&v25[14] = "-[VCSessionParticipant swapScreenStreamGroupSyncSourceWithState:]";
      *(_WORD *)&v25[22] = 1024;
      LODWORD(v26) = 2533;
      uint64_t v17 = " [%s] %s:%d System Audio Stream Group has resumed, swapping sync sources";
      uint64_t v18 = v16;
      uint32_t v19 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v9 = (__CFString *)[(VCSessionParticipant *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v9 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_26;
      }
      uint64_t v23 = VRTraceErrorLogLevelToCSTR();
      uint64_t v24 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_26;
      }
      *(_DWORD *)uint64_t v25 = 136316162;
      *(void *)&v25[4] = v23;
      *(_WORD *)&v25[12] = 2080;
      *(void *)&v25[14] = "-[VCSessionParticipant swapScreenStreamGroupSyncSourceWithState:]";
      *(_WORD *)&v25[22] = 1024;
      LODWORD(v26) = 2533;
      WORD2(v26) = 2112;
      *(void *)((char *)&v26 + 6) = v9;
      HIWORD(v26) = 2048;
      uint64_t v27 = self;
      uint64_t v17 = " [%s] %s:%d %@(%p) System Audio Stream Group has resumed, swapping sync sources";
      uint64_t v18 = v24;
      uint32_t v19 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, v17, v25, v19);
LABEL_26:
    int v22 = v6;
    id v6 = v5;
    goto LABEL_27;
  }
  if (a3 != 2) {
    return;
  }
  if ((VCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_20;
    }
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    long long v11 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    *(_DWORD *)uint64_t v25 = 136315650;
    *(void *)&v25[4] = v10;
    *(_WORD *)&v25[12] = 2080;
    *(void *)&v25[14] = "-[VCSessionParticipant swapScreenStreamGroupSyncSourceWithState:]";
    *(_WORD *)&v25[22] = 1024;
    LODWORD(v26) = 2526;
    long long v12 = " [%s] %s:%d System Audio Stream Group has paused, swapping sync sources";
    long long v13 = v11;
    uint32_t v14 = 28;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      BOOL v8 = (__CFString *)[(VCSessionParticipant *)self performSelector:sel_logPrefix];
    }
    else {
      BOOL v8 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_20;
    }
    uint64_t v20 = VRTraceErrorLogLevelToCSTR();
    __int16 v21 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    *(_DWORD *)uint64_t v25 = 136316162;
    *(void *)&v25[4] = v20;
    *(_WORD *)&v25[12] = 2080;
    *(void *)&v25[14] = "-[VCSessionParticipant swapScreenStreamGroupSyncSourceWithState:]";
    *(_WORD *)&v25[22] = 1024;
    LODWORD(v26) = 2526;
    WORD2(v26) = 2112;
    *(void *)((char *)&v26 + 6) = v8;
    HIWORD(v26) = 2048;
    uint64_t v27 = self;
    long long v12 = " [%s] %s:%d %@(%p) System Audio Stream Group has paused, swapping sync sources";
    long long v13 = v21;
    uint32_t v14 = 48;
  }
  _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, v25, v14);
LABEL_20:
  int v22 = v5;
LABEL_27:
  objc_msgSend(v22, "removeSyncDestination:", v7, *(_OWORD *)v25, *(void *)&v25[16], v26, v27);
  [v6 addSyncDestination:v7];
}

- (void)setMediaRecorder:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  participantQueue = self->_participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__VCSessionParticipant_setMediaRecorder___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a3;
  dispatch_async(participantQueue, block);
}

id __41__VCSessionParticipant_setMediaRecorder___block_invoke(uint64_t a1)
{
  id result = *(id *)(a1 + 40);
  *(void *)(*(void *)(a1 + 32) + 512) = result;
  return result;
}

- (VCMediaRecorder)mediaRecorder
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__42;
  uint64_t v10 = __Block_byref_object_dispose__42;
  uint64_t v11 = 0;
  participantQueue = self->_participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__VCSessionParticipant_mediaRecorder__block_invoke;
  block[3] = &unk_1E6DB4540;
  block[4] = self;
  void block[5] = &v6;
  dispatch_sync(participantQueue, block);
  uint64_t v3 = (VCMediaRecorder *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __37__VCSessionParticipant_mediaRecorder__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 512);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setCaptionsCoordinator:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  participantQueue = self->_participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__VCSessionParticipant_setCaptionsCoordinator___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a3;
  dispatch_async(participantQueue, block);
}

id __47__VCSessionParticipant_setCaptionsCoordinator___block_invoke(uint64_t a1)
{
  id result = *(id *)(a1 + 40);
  *(void *)(*(void *)(a1 + 32) + 520) = result;
  return result;
}

- (VCAudioCaptionsCoordinator)captionsCoordinator
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__42;
  uint64_t v10 = __Block_byref_object_dispose__42;
  uint64_t v11 = 0;
  participantQueue = self->_participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__VCSessionParticipant_captionsCoordinator__block_invoke;
  block[3] = &unk_1E6DB4540;
  block[4] = self;
  void block[5] = &v6;
  dispatch_sync(participantQueue, block);
  uint64_t v3 = (VCAudioCaptionsCoordinator *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __43__VCSessionParticipant_captionsCoordinator__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 520);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)vcMediaStream:(id)a3 requestKeyFrameGenerationWithStreamID:(unsigned __int16)a4 firType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136316162;
      uint64_t v12 = v8;
      __int16 v13 = 2080;
      uint32_t v14 = "-[VCSessionParticipant vcMediaStream:requestKeyFrameGenerationWithStreamID:firType:]";
      __int16 v15 = 1024;
      int v16 = 2581;
      __int16 v17 = 1024;
      int v18 = v6;
      __int16 v19 = 1024;
      int v20 = v5;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d requestKeyFrameGenerationWithStreamID:%d FIRType:%d", (uint8_t *)&v11, 0x28u);
    }
  }
  uint64_t v10 = (void *)MEMORY[0x1E4E56580](&self->_delegate);
  [v10 vcSessionParticipant:self requestKeyFrameGenerationWithStreamID:v6 streamGroupID:0 firType:v5];
  if (v10) {
    CFRelease(v10);
  }
}

- (BOOL)handleEncryptionInfoChange:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = (void *)[(NSMutableDictionary *)self->_streamGroups allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v8++) handleEncryptionInfoChange:a3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v10 count:16];
    }
    while (v6);
  }
  return 1;
}

- (void)resetDecryptionTimeout
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v2 = 2603;
  _os_log_debug_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Resetting decryption status", v1, 0x1Cu);
}

- (void)pullAudioSamples:(opaqueVCAudioBufferList *)a3
{
}

- (void)pushAudioSamples:(opaqueVCAudioBufferList *)a3
{
}

- (void)handleActiveConnectionChange:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  participantQueue = self->_participantQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__VCSessionParticipant_handleActiveConnectionChange___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __53__VCSessionParticipant_handleActiveConnectionChange___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 432) = VCConnection_IsLocalOnWiFiOrWired(*(void *)(a1 + 40));
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 handleStreamGroupsActiveConnectionChange:v3];
}

- (void)redundancyController:(id)a3 redundancyIntervalDidChange:(double)a4
{
}

- (void)redundancyController:(id)a3 redundancyPercentageDidChange:(unsigned int)a4
{
}

- (void)audioPowerSpectrumSinkDidRegister
{
}

- (void)audioPowerSpectrumSinkDidUnregister
{
}

- (void)sendAudioPowerSpectrumSourceRegistration:(BOOL)a3
{
  BOOL v3 = a3;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionaryAddValue(Mutable, @"VCSPUUID", self->_uuid);
  CFDictionaryAddValue(Mutable, @"VCSPAPSReg", (const void *)[NSNumber numberWithBool:v3]);
  [(VCSessionParticipant *)self reportingAgent];
  reportingGenericEvent();
  if (Mutable)
  {
    CFRelease(Mutable);
  }
}

- (int64_t)negotiatedCipherSuiteForStreamGroupID:(unsigned int)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  participantQueue = self->_participantQueue;
  uint64_t v11 = -1;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__VCSessionParticipant_negotiatedCipherSuiteForStreamGroupID___block_invoke;
  v6[3] = &unk_1E6DB6470;
  v6[4] = self;
  v6[5] = &v8;
  unsigned int v7 = a3;
  dispatch_sync(participantQueue, v6);
  int64_t v4 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __62__VCSessionParticipant_negotiatedCipherSuiteForStreamGroupID___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 416), "negotiatedResultsForGroupID:", *(unsigned int *)(a1 + 48)), "cipherSuite");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)didUpdateBasebandCodec:(const _VCRemoteCodecInfo *)a3
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCSessionParticipant didUpdateBasebandCodec:]();
    }
  }
}

- (void)handleRemoteOneToOneSwitchWithStreamGroup:(id)a3 fromStreamID:(unsigned __int16)a4 toStreamID:(unsigned __int16)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!a4 || !a5)
  {
    BOOL v6 = a4 || a5 == 0;
    BOOL v7 = !v6;
    if ([a3 streamGroupID] == 1835623282)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        uint64_t v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 136315906;
          uint64_t v12 = v8;
          __int16 v13 = 2080;
          long long v14 = "-[VCSessionParticipant handleRemoteOneToOneSwitchWithStreamGroup:fromStreamID:toStreamID:]";
          __int16 v15 = 1024;
          int v16 = 2705;
          __int16 v17 = 1024;
          BOOL v18 = v7;
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Detected remote switch of oneToOne mode %d", (uint8_t *)&v11, 0x22u);
        }
      }
      uint64_t v10 = (void *)MEMORY[0x1E4E56580](&self->_delegate);
      [v10 vcSessionParticipant:self oneToOneModeDidChange:!v7];
      if (v10) {
        CFRelease(v10);
      }
    }
  }
}

- (void)handleSymptomReportForDecryptionError
{
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionarySetValue(Mutable, @"SymptomReporterOptionalKeySessionID", self->_sessionUUID);
  CFDictionarySetValue(Mutable, @"SymptomReporterOptionalKeyParticipantID", (const void *)[NSNumber numberWithUnsignedLongLong:self->_idsParticipantID]);
  [(VCSessionParticipant *)self reportingAgent];
  reportingSymptom();

  CFRelease(Mutable);
}

- (void)streamGroup:(id)a3 didChangeMediaPriority:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315906;
      uint64_t v13 = v7;
      __int16 v14 = 2080;
      __int16 v15 = "-[VCSessionParticipant streamGroup:didChangeMediaPriority:]";
      __int16 v16 = 1024;
      int v17 = 2723;
      __int16 v18 = 1024;
      int v19 = v4;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d priority %hhu", (uint8_t *)&v12, 0x22u);
    }
  }
  uint64_t v9 = (void *)MEMORY[0x1E4E56580](&self->_delegate);
  int v10 = [a3 streamGroupID];
  if (v10 > 1835623281)
  {
    if (v10 != 1835623287 && v10 != 1835623282) {
      goto LABEL_12;
    }
    int v11 = AVCSessionParticipantMediaTypeKeyAudio;
  }
  else
  {
    int v11 = &AVCSessionParticipantMediaTypeKeyVideo;
    if (v10 != 1667329381 && v10 != 1667329399) {
      goto LABEL_12;
    }
  }
  [v9 vcSessionParticipant:self didChangeMediaPriority:v4 description:*v11];
LABEL_12:
  if (v9) {
    CFRelease(v9);
  }
}

- (void)didChangeSendingStreamsForStreamGroup:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    BOOL v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v9 = v5;
      __int16 v10 = 2080;
      int v11 = "-[VCSessionParticipant didChangeSendingStreamsForStreamGroup:]";
      __int16 v12 = 1024;
      int v13 = 2745;
      __int16 v14 = 2112;
      id v15 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamGroup %@", buf, 0x26u);
    }
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__VCSessionParticipant_didChangeSendingStreamsForStreamGroup___block_invoke;
  v7[3] = &unk_1E6DB69A0;
  v7[4] = self;
  [(VCSessionParticipant *)self callDelegateWithBlock:v7];
}

uint64_t __62__VCSessionParticipant_didChangeSendingStreamsForStreamGroup___block_invoke(uint64_t a1, void *a2)
{
  return [a2 vcSessionParticipantDidChangeSendingStreams:*(void *)(a1 + 32)];
}

- (void)didMediaDecryptionTimeOutForStreamGroup:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    BOOL v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v12 = v5;
      __int16 v13 = 2080;
      __int16 v14 = "-[VCSessionParticipant didMediaDecryptionTimeOutForStreamGroup:]";
      __int16 v15 = 1024;
      int v16 = 2752;
      __int16 v17 = 2112;
      id v18 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamGroup %@", buf, 0x26u);
    }
  }
  [(VCSessionParticipant *)self reportingAgent];
  uuid = self->_uuid;
  uint64_t v9 = @"VCSPUUID";
  __int16 v10 = uuid;
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  reportingGenericEvent();
  uint64_t v8 = (void *)MEMORY[0x1E4E56580](&self->_delegate);
  [v8 vcSessionParticipantDidMediaDecryptionTimeOut:self];
  if (v8) {
    CFRelease(v8);
  }
}

- (void)streamGroup:(id)a3 didRemoteEnableChange:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = "NO";
      *(_DWORD *)uint64_t v9 = 136315906;
      *(void *)&v9[4] = v6;
      *(_WORD *)&v9[12] = 2080;
      *(void *)&v9[14] = "-[VCSessionParticipant streamGroup:didRemoteEnableChange:]";
      if (v4) {
        uint64_t v8 = "YES";
      }
      *(_WORD *)&v9[22] = 1024;
      int v10 = 2760;
      __int16 v11 = 2080;
      uint64_t v12 = v8;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d enabled %s", v9, 0x26u);
    }
  }
  [(VCSessionParticipant *)self updateAudioSpectrumState];
}

- (void)streamGroup:(id)a3 didRemotePauseChange:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = "NO";
      *(_DWORD *)uint64_t v9 = 136315906;
      *(void *)&v9[4] = v6;
      *(_WORD *)&v9[12] = 2080;
      *(void *)&v9[14] = "-[VCSessionParticipant streamGroup:didRemotePauseChange:]";
      if (v4) {
        uint64_t v8 = "YES";
      }
      *(_WORD *)&v9[22] = 1024;
      int v10 = 2765;
      __int16 v11 = 2080;
      uint64_t v12 = v8;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d paused %s", v9, 0x26u);
    }
  }
  [(VCSessionParticipant *)self updateAudioSpectrumState];
}

- (void)streamGroup:(id)a3 didSwitchFromStreamID:(unsigned __int16)a4 toStreamID:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v6 == v5)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      int v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136315650;
        uint64_t v15 = v9;
        __int16 v16 = 2080;
        __int16 v17 = "-[VCSessionParticipant streamGroup:didSwitchFromStreamID:toStreamID:]";
        __int16 v18 = 1024;
        int v19 = 2771;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d fromStreamID & toStreamID are equal, no switch needed", (uint8_t *)&v14, 0x1Cu);
      }
    }
  }
  else
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136316162;
        uint64_t v15 = v11;
        __int16 v16 = 2080;
        __int16 v17 = "-[VCSessionParticipant streamGroup:didSwitchFromStreamID:toStreamID:]";
        __int16 v18 = 1024;
        int v19 = 2774;
        __int16 v20 = 1024;
        int v21 = v6;
        __int16 v22 = 1024;
        int v23 = v5;
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d switched streamID %hu -> %hu", (uint8_t *)&v14, 0x28u);
      }
    }
    uint64_t v13 = (void *)MEMORY[0x1E4E56580](&self->_delegate);
    [v13 vcSessionParticipant:self didSwitchFromStreamID:v6 toStreamID:v5];
    if (v13) {
      CFRelease(v13);
    }
  }
}

- (void)didChangeReceivingStreamsForStreamGroup:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315906;
      uint64_t v7 = v4;
      __int16 v8 = 2080;
      uint64_t v9 = "-[VCSessionParticipant didChangeReceivingStreamsForStreamGroup:]";
      __int16 v10 = 1024;
      int v11 = 2781;
      __int16 v12 = 2112;
      id v13 = a3;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamGroup %@", (uint8_t *)&v6, 0x26u);
    }
  }
}

- (void)didChangeActualNetworkBitrateForStreamGroup:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v9 = v5;
      __int16 v10 = 2080;
      int v11 = "-[VCSessionParticipant didChangeActualNetworkBitrateForStreamGroup:]";
      __int16 v12 = 1024;
      int v13 = 2785;
      __int16 v14 = 2112;
      id v15 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamGroup %@", buf, 0x26u);
    }
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__VCSessionParticipant_didChangeActualNetworkBitrateForStreamGroup___block_invoke;
  v7[3] = &unk_1E6DB6A68;
  v7[4] = self;
  void v7[5] = a3;
  [(VCSessionParticipant *)self callDelegateWithBlock:v7];
}

uint64_t __68__VCSessionParticipant_didChangeActualNetworkBitrateForStreamGroup___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) streamGroupID];

  return [a2 vcSessionParticipant:v3 didChangeActualNetworkBitrateForStreamGroupID:v4];
}

- (void)streamGroup:(id)a3 didRequestRedundancy:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = "NO";
      int v8 = 136315906;
      uint64_t v9 = v5;
      __int16 v10 = 2080;
      int v11 = "-[VCSessionParticipant streamGroup:didRequestRedundancy:]";
      if (v4) {
        uint64_t v7 = "YES";
      }
      __int16 v12 = 1024;
      int v13 = 2792;
      __int16 v14 = 2080;
      id v15 = v7;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d requestRedundancy %s", (uint8_t *)&v8, 0x26u);
    }
  }
}

- (void)streamGroup:(id)a3 requestKeyFrameGenerationWithStreamID:(unsigned __int16)a4 firType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    __int16 v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315906;
      uint64_t v13 = v9;
      __int16 v14 = 2080;
      id v15 = "-[VCSessionParticipant streamGroup:requestKeyFrameGenerationWithStreamID:firType:]";
      __int16 v16 = 1024;
      int v17 = 2796;
      __int16 v18 = 1024;
      int v19 = v6;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamID %d", (uint8_t *)&v12, 0x22u);
    }
  }
  int v11 = (void *)MEMORY[0x1E4E56580](&self->_delegate);
  objc_msgSend(v11, "vcSessionParticipant:requestKeyFrameGenerationWithStreamID:streamGroupID:firType:", self, v6, objc_msgSend(a3, "streamGroupID"), v5);
  if (v11) {
    CFRelease(v11);
  }
}

- (void)didDecryptionTimeOutForMKMRecoveryForStreamGroup:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ((VCSessionParticipant *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionParticipant didDecryptionTimeOutForMKMRecoveryForStreamGroup:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCSessionParticipant *)self performSelector:sel_logPrefix];
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
        *(_DWORD *)buf = 136316418;
        uint64_t v14 = v6;
        __int16 v15 = 2080;
        __int16 v16 = "-[VCSessionParticipant didDecryptionTimeOutForMKMRecoveryForStreamGroup:]";
        __int16 v17 = 1024;
        int v18 = 2803;
        __int16 v19 = 2112;
        uint64_t v20 = v5;
        __int16 v21 = 2048;
        __int16 v22 = self;
        __int16 v23 = 2112;
        id v24 = a3;
        _os_log_error_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) streamGroup=%@", buf, 0x3Au);
      }
    }
  }
  double v8 = micro();
  if (v8 - self->_lastParticipantMKMRecoveryTime > self->_participantMKMRecoveryTimeout)
  {
    self->_lastParticipantMKMRecoveryTime = v8;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __73__VCSessionParticipant_didDecryptionTimeOutForMKMRecoveryForStreamGroup___block_invoke;
    v12[3] = &unk_1E6DB69A0;
    v12[4] = self;
    [(VCSessionParticipant *)self callDelegateWithBlock:v12];
    dispatch_time_t v9 = dispatch_time(0, 5000000000);
    participantQueue = self->_participantQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __73__VCSessionParticipant_didDecryptionTimeOutForMKMRecoveryForStreamGroup___block_invoke_2;
    v11[3] = &unk_1E6DB3DC8;
    v11[4] = self;
    dispatch_after(v9, participantQueue, v11);
  }
}

uint64_t __73__VCSessionParticipant_didDecryptionTimeOutForMKMRecoveryForStreamGroup___block_invoke(uint64_t a1, void *a2)
{
  return [a2 vcSessionParticipantDidMediaDecryptionTimeOutForMKMRecovery:*(void *)(a1 + 32)];
}

uint64_t __73__VCSessionParticipant_didDecryptionTimeOutForMKMRecoveryForStreamGroup___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleSymptomReportForDecryptionError];
}

- (void)streamGroup:(id)a3 didSuspendStreams:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136316162;
      uint64_t v9 = v6;
      __int16 v10 = 2080;
      int v11 = "-[VCSessionParticipant streamGroup:didSuspendStreams:]";
      __int16 v12 = 1024;
      int v13 = 2819;
      __int16 v14 = 2112;
      id v15 = a3;
      __int16 v16 = 1024;
      BOOL v17 = v4;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamGroup %@ didSuspendStreams:%d", (uint8_t *)&v8, 0x2Cu);
    }
  }
}

- (void)streamGroup:(id)a3 remoteMediaStalled:(BOOL)a4 duration:(double)a5
{
  BOOL v6 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    __int16 v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v13 = v9;
      __int16 v14 = 2080;
      id v15 = "-[VCSessionParticipant streamGroup:remoteMediaStalled:duration:]";
      __int16 v16 = 1024;
      int v17 = 2823;
      __int16 v18 = 2112;
      id v19 = a3;
      __int16 v20 = 1024;
      BOOL v21 = v6;
      __int16 v22 = 2048;
      double v23 = a5;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamGroup=%@ remoteMediaStalled=%d duration=%f", buf, 0x36u);
    }
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__VCSessionParticipant_streamGroup_remoteMediaStalled_duration___block_invoke;
  v11[3] = &unk_1E6DB6A18;
  v11[4] = self;
  *(double *)&void v11[5] = a5;
  [(VCSessionParticipant *)self callDelegateWithBlock:v11];
}

uint64_t __64__VCSessionParticipant_streamGroup_remoteMediaStalled_duration___block_invoke(uint64_t a1, void *a2)
{
  return [a2 vcSessionParticipantDidRemoteMediaStallTimeout:*(void *)(a1 + 32) duration:*(double *)(a1 + 40)];
}

- (void)streamGroup:(id)a3 didReceiveFlushRequestWithPayloads:(id)a4
{
  v4[5] = *MEMORY[0x1E4F143B8];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__VCSessionParticipant_streamGroup_didReceiveFlushRequestWithPayloads___block_invoke;
  v4[3] = &unk_1E6DB69A0;
  v4[4] = a4;
  [(VCSessionParticipant *)self callDelegateWithBlock:v4];
}

uint64_t __71__VCSessionParticipant_streamGroup_didReceiveFlushRequestWithPayloads___block_invoke(uint64_t a1, void *a2)
{
  return [a2 vcSessionParticipantDidMediaReceiveFlushRequestWithPayloads:*(void *)(a1 + 32)];
}

- (NSString)uuid
{
  return self->_uuid;
}

- (NSData)opaqueData
{
  return self->_opaqueData;
}

- (tagNTP)creationTime
{
  return (tagNTP)self->_creationTime.wide;
}

- (BOOL)isAudioEnabled
{
  return self->_audioEnabled;
}

- (BOOL)isVideoEnabled
{
  return self->_videoEnabled;
}

- (BOOL)isAudioPaused
{
  return self->_audioPaused;
}

- (BOOL)isVideoPaused
{
  return self->_videoPaused;
}

- (float)volume
{
  return self->_volume;
}

- (float)audioPosition
{
  return self->_audioPosition;
}

- (AVCStatisticsCollector)statisticsCollector
{
  return self->_statisticsCollector;
}

- (AVCBasebandCongestionDetector)basebandCongestionDetector
{
  return self->_basebandCongestionDetector;
}

- (unsigned)cellularUniqueTag
{
  return self->_cellularUniqueTag;
}

- (void)setCellularUniqueTag:(unsigned int)a3
{
  self->_cellularUniqueTag = a3;
}

- (VCAudioRuleCollection)supportedAudioRules
{
  return self->_supportedAudioRules;
}

- (unint64_t)idsParticipantID
{
  return self->_idsParticipantID;
}

- (VCSessionMediaNegotiator)mediaNegotiator
{
  return self->_mediaNegotiator;
}

- (BOOL)isLocalOnWiFi
{
  return self->_localOnWiFi;
}

- (void)setLocalOnWiFi:(BOOL)a3
{
  self->_localOnWiFuint64_t i = a3;
}

- (tagVCMediaQueue)mediaQueue
{
  return self->_mediaQueue;
}

- (VCCallInfoBlob)callInfoBlob
{
  return self->_callInfoBlob;
}

- (BOOL)sharingEnabled
{
  return self->_sharingEnabled;
}

- (unsigned)presentationState
{
  return self->_presentationState;
}

- (void)setPresentationState:(unsigned __int8)a3
{
  self->_presentationState = a3;
}

- (BOOL)isScreenEnabled
{
  return self->_screenEnabled;
}

- (VCSessionParticipantOneToOneConfig)oneToOneConfig
{
  return self->_oneToOneConfig;
}

- (void)setOneToOneConfig:(id)a3
{
}

- (BOOL)isOneToOneModeEnabled
{
  return self->_oneToOneModeEnabled;
}

- (void)setOneToOneModeEnabled:(BOOL)a3
{
  self->_oneToOneModeEnabled = a3;
}

- (BOOL)isParticipantIDBasedKeyLookupEnabled
{
  return self->_isParticipantIDBasedKeyLookupEnabled;
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

- (void)dispatchedSetAudioEnabled:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d updateStreamGroups failed with error=%@");
}

- (void)dispatchedSetAudioPaused:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Can't set pause when participant audio is not enabled", v2, v3, v4, v5, v6);
}

- (void)dispatchedSetAudioPaused:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Shouldn't come here when setting audio paused", v2, v3, v4, v5, v6);
}

- (void)dispatchedSetAudioPaused:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d startAudioStreamGroups failed with error=%@");
}

- (void)dispatchedSetVideoPaused:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Can't set pause when participant video is not enabled", v2, v3, v4, v5, v6);
}

- (void)dispatchedSetVideoPaused:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Shouldn't come here when setting video paused", v2, v3, v4, v5, v6);
}

+ (void)participantDataWithMediaNegotiatorVersion:participantData:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d The participant info data is nil", v2, v3, v4, v5, v6);
}

+ (void)participantDataWithMediaNegotiatorVersion:participantData:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to unserialize the participant info", v2, v3, v4, v5, v6);
}

+ (void)participantDataWithMediaNegotiatorVersion:participantData:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Media blob missing in the participant info", v2, v3, v4, v5, v6);
}

+ (void)participantDataWithMediaNegotiatorVersion:participantData:.cold.4()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v4 = "+[VCSessionParticipant participantDataWithMediaNegotiatorVersion:participantData:]";
  OUTLINED_FUNCTION_3();
  int v5 = 615;
  __int16 v6 = v0;
  int v7 = 0;
  OUTLINED_FUNCTION_5_5(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Negotiation data not available for version=%d", v3);
}

+ (void)participantDataWithMediaNegotiatorVersion:participantData:.cold.5()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v4 = "+[VCSessionParticipant participantDataWithMediaNegotiatorVersion:participantData:]";
  OUTLINED_FUNCTION_3();
  int v5 = 618;
  __int16 v6 = v0;
  int v7 = 1;
  OUTLINED_FUNCTION_5_5(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Negotiation data not available for version=%d", v3);
}

+ (void)participantDataWithMediaNegotiatorVersion:participantData:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate output dictionary", v2, v3, v4, v5, v6);
}

+ (void)participantDataWithParticipantData:isReinit:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d The participant info data is nil", v2, v3, v4, v5, v6);
}

+ (void)participantDataWithParticipantData:isReinit:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to unserialize the participant info", v2, v3, v4, v5, v6);
}

+ (void)participantDataWithParticipantData:isReinit:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unexpected participant data in participant info dictionary", v2, v3, v4, v5, v6);
}

+ (void)participantDataWithParticipantData:isReinit:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Negotiation v1 blob not present in particiant info", v2, v3, v4, v5, v6);
}

+ (void)participantDataWithParticipantData:isReinit:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Negotiation v2 blob not present in particiant info", v2, v3, v4, v5, v6);
}

+ (void)participantDataWithParticipantData:isReinit:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to generate the negotation data entry", v2, v3, v4, v5, v6);
}

+ (void)participantDataWithParticipantData:isReinit:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate output dictionary", v2, v3, v4, v5, v6);
}

+ (void)participantDataWithParticipantData:isReinit:.cold.8()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Missing media blob entry in particiant info. ParticipantInfo=%@");
}

+ (void)streamGroupIDsFromParticipantData:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to unserialize the participant info", v2, v3, v4, v5, v6);
}

+ (void)streamGroupIDsFromParticipantData:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Media blob is nil", v2, v3, v4, v5, v6);
}

- (void)stopAudioIO
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to stop the VCAudioIO. error=%@");
}

- (void)startStreamGroups
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate temporary stream group array", v2, v3, v4, v5, v6);
}

- (void)startScreenGroup
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to start screen group. Error=%@");
}

- (void)setupAudioStreamConfiguration:audioRules:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d No audio rules for stream configuration!", v2, v3, v4, v5, v6);
}

- (void)setupAudioStreamConfiguration:audioRules:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d No codec configurations for stream configuration!", v2, v3, v4, v5, v6);
}

- (void)setupAudioStreamConfiguration:audioRules:.cold.3()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v4 = "-[VCSessionParticipant setupAudioStreamConfiguration:audioRules:]";
  OUTLINED_FUNCTION_3();
  int v5 = 1065;
  __int16 v6 = v0;
  int v7 = v1;
  OUTLINED_FUNCTION_5_5(&dword_1E1EA4000, v2, (uint64_t)v2, " [%s] %s:%d Failed to allocate codec config for payload=%d!", v3);
}

- (void)newOneToOneVideoStreamMultiwayConfiguration:streamGroupId:videoSettings:streamDirection:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unable to allocate multiway video config", v2, v3, v4, v5, v6);
}

- (void)newOneToOneAudioStreamConfigWithAudioSettings:streamDirection:streamGroupId:streamSsrc:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate stream configuration!", v2, v3, v4, v5, v6);
}

- (void)newOneToOneAudioStreamConfigWithAudioSettings:streamDirection:streamGroupId:streamSsrc:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unable to allocate multiway audio config", v2, v3, v4, v5, v6);
}

- (void)newOneToOneAudioStreamConfigWithAudioSettings:streamDirection:streamGroupId:streamSsrc:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unable to allocate rate controller audio config", v2, v3, v4, v5, v6);
}

- (void)newOneToOneAudioStreamConfigWithAudioSettings:streamDirection:streamGroupId:streamSsrc:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Stream setup failed", v2, v3, v4, v5, v6);
}

- (void)newOneToOneAudioStreamConfigWithAudioSettings:streamDirection:streamGroupId:streamSsrc:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to setup the audio stream config", v2, v3, v4, v5, v6);
}

- (void)newOneToOneVideoStreamConfigWithStreamDirection:streamGroupId:streamSsrc:encodingType:videoSettings:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate one to one video stream configuration!", v2, v3, v4, v5, v6);
}

- (void)newOneToOneVideoStreamConfigWithStreamDirection:streamGroupId:streamSsrc:encodingType:videoSettings:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unable to allocate multiway video config", v2, v3, v4, v5, v6);
}

- (void)newOneToOneVideoStreamConfigWithStreamDirection:streamGroupId:streamSsrc:encodingType:videoSettings:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unable to allocate rate controller config", v2, v3, v4, v5, v6);
}

- (void)newOneToOneVideoStreamConfigWithStreamDirection:streamGroupId:streamSsrc:encodingType:videoSettings:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Stream setup failed", v2, v3, v4, v5, v6);
}

- (void)setupSecurityKeyHolderForStreamConfig:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid VCSecurityKeyManager", v2, v3, v4, v5, v6);
}

- (void)setupSecurityKeyHolderForStreamConfig:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCSecurityKeyHolder_Create failed", v2, v3, v4, v5, v6);
}

- (void)completeStreamSetup:rtpCipherSuite:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d setupSecurityKeyHolderForStreamConfig failed", v2, v3, v4, v5, v6);
}

void __58__VCSessionParticipant_updateConfigurationWithDeviceRole___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Error configuring audioIO", v2, v3, v4, v5, v6);
}

void __58__VCSessionParticipant_updateConfigurationWithDeviceRole___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to setDevice role on captionsStreamGroup=%@");
}

- (void)configureOneToOneAudioStreamsWithDeviceRole:streamInfoArray:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Error configuring audio stream [%@]");
}

- (void)newVideoRateControlConfigWithMediaControlInfoVersion:enableMediaControlInfoGenerator:enableFeedbackController:isOneToOne:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unable to allocate video rate control config", v2, v3, v4, v5, v6);
}

- (void)configureOneToOneVideoStreamsWithDeviceRole:streamInfoArray:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Error configuring stream [%@]");
}

- (void)configureOneToOneVideoStreamsWithDeviceRole:streamInfoArray:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate one to one rate config", v2, v3, v4, v5, v6);
}

- (void)configureOneToOneWithConfig:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Error configuring video stream", v2, v3, v4, v5, v6);
}

- (void)configureOneToOneWithConfig:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Error configuring audio stream", v2, v3, v4, v5, v6);
}

- (void)configureOneToOneWithConfig:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Error configuring audioIO", v2, v3, v4, v5, v6);
}

void __109__VCSessionParticipant_configureWithDeviceRole_negotiatedVideoEnabled_negotiatedScreenEnabled_operatingMode___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Fail configure participant", v2, v3, v4, v5, v6);
}

- (void)dispatchedConfigureWithDeviceRole:negotiatedVideoEnabled:negotiatedScreenEnabled:operatingMode:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unable to create the oneToOneConfig", v2, v3, v4, v5, v6);
}

- (void)dispatchedConfigureWithDeviceRole:negotiatedVideoEnabled:negotiatedScreenEnabled:operatingMode:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Error setting device role on stream group", v2, v3, v4, v5, v6);
}

- (void)dispatchedConfigureWithDeviceRole:negotiatedVideoEnabled:negotiatedScreenEnabled:operatingMode:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Error configuring streams", v2, v3, v4, v5, v6);
}

- (void)configureStreamInfosForMultiway:streamGroupID:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create rate control config", v2, v3, v4, v5, v6);
}

- (void)configureMultiwayStreamGroups
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  FourccToCStr([v2 streamGroupID]);
  int v4 = 136315906;
  uint64_t v5 = v1;
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_7_3(&dword_1E1EA4000, v0, v3, " [%s] %s:%d Error configuring stream infos for streamGroupID=%s", (uint8_t *)&v4);
}

- (void)initWithConfig:delegate:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  objc_msgSend((id)objc_msgSend(v2, "idsDestination"), "UTF8String");
  int v4 = 136315906;
  uint64_t v5 = v1;
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_7_3(&dword_1E1EA4000, v0, v3, " [%s] %s:%d Unable to initialize participant. Destination=%s ", (uint8_t *)&v4);
}

- (void)initWithConfig:delegate:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create the list of supported audio rules", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:delegate:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create the participant stream token dictionary", v2, v3, v4, v5, v6);
}

- (void)updateMediaStatesWithConfig:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  VCSessionMediaType_Name(v2);
  int v4 = 136315906;
  uint64_t v5 = v1;
  OUTLINED_FUNCTION_5_1();
  uint8_t v6 = "-[VCSessionParticipant updateMediaStatesWithConfig:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7_3(&dword_1E1EA4000, v0, v3, " [%s] %s:%d Failed to allocate the media type settings for mediaType=%@", (uint8_t *)&v4);
}

- (void)applyMediaState:forMediaType:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  VCSessionMediaType_Name(v2);
  int v4 = 136315906;
  uint64_t v5 = v1;
  OUTLINED_FUNCTION_5_1();
  uint8_t v6 = "-[VCSessionParticipant applyMediaState:forMediaType:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7_3(&dword_1E1EA4000, v0, v3, " [%s] %s:%d mediaTypeSettings is missing for mediaType=%@", (uint8_t *)&v4);
}

- (void)updateMediaState:forStreamGroups:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Stream groups not found. error=%@");
}

+ (void)mediaStreamGroupStateToVCStreamGroupState:.cold.1()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  int v4 = "+[VCSessionParticipant mediaStreamGroupStateToVCStreamGroupState:]";
  OUTLINED_FUNCTION_3();
  int v5 = 2384;
  __int16 v6 = v0;
  int v7 = v1;
  OUTLINED_FUNCTION_5_5(&dword_1E1EA4000, v2, (uint64_t)v2, " [%s] %s:%d Unknown media stream group state: %d", v3);
}

- (void)setupMediaSyncForStreamGroup:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  FourccToCStr([a2 syncGroupID]);
  FourccToCStr([a2 streamGroupID]);
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_12_10();
  OUTLINED_FUNCTION_5_11(&dword_1E1EA4000, v3, v4, " [%s] %s:%d Sync group=%s not found for group=%s", v5, v6, v7, v8, 2u);
}

- (void)setupMediaSyncForStreamGroup:(uint64_t)a1 .cold.2(uint64_t a1, void *a2)
{
  FourccToCStr([a2 streamGroupID]);
  FourccToCStr([a2 syncGroupID]);
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_12_10();
  OUTLINED_FUNCTION_5_11(&dword_1E1EA4000, v3, v4, " [%s] %s:%d Failed to add %s as sync destination to %s", v5, v6, v7, v8, 2u);
}

- (void)didUpdateBasebandCodec:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unexpected SPI call", v2, v3, v4, v5, v6);
}

- (void)didDecryptionTimeOutForMKMRecoveryForStreamGroup:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d streamGroup=%@");
}

@end