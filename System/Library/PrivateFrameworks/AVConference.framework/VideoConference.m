@interface VideoConference
+ (void)terminateProcess:(id)a3 terminateSource:(id)a4 agent:(opaqueRTCReporting *)a5;
- (AudioStreamBasicDescription)audioIOFormat;
- (BOOL)actionDidFinishForContext:(const tagVCAsynchronousActionContext *)a3 withError:(id *)a4;
- (BOOL)actionWillBeginForContext:(const tagVCAsynchronousActionContext *)a3 withError:(id *)a4;
- (BOOL)conferenceMatchesSourceDestinationInfo:(tagVCSourceDestinationInfo *)a3;
- (BOOL)deregisterForVideoFramesWithDeviceRole:(int)a3;
- (BOOL)disableVAD;
- (BOOL)getIsAudioPaused:(BOOL *)a3 callID:(unsigned int)a4 error:(id *)a5;
- (BOOL)getIsVideoPaused:(BOOL *)a3 callID:(unsigned int)a4 error:(id *)a5;
- (BOOL)hasMic;
- (BOOL)hasSessionWaitingForSIPInvite;
- (BOOL)initiateResolutionChangeToWidth:(int)a3 height:(int)a4 rate:(int)a5;
- (BOOL)isFocus;
- (BOOL)isGKVoiceChat;
- (BOOL)isInputFrequencyMeteringEnabled;
- (BOOL)isInputMeteringEnabled;
- (BOOL)isMicrophoneMuted;
- (BOOL)isOutputFrequencyMeteringEnabled;
- (BOOL)isOutputMeteringEnabled;
- (BOOL)isSpeakerPhoneEnabled;
- (BOOL)isUsingSuppression;
- (BOOL)isValid;
- (BOOL)matchesCallID:(unsigned int)a3;
- (BOOL)matchesOpenSessionForParticipantID:(id)a3;
- (BOOL)matchesParticipantID:(id)a3;
- (BOOL)onVideoFrame:(opaqueCMSampleBuffer *)a3 frameTime:(id *)a4 attribute:(id *)a5;
- (BOOL)recvSamplesForSession:(id)a3 sampleBuffer:(opaqueVCAudioBufferList *)a4;
- (BOOL)registerForVideoFramesWithDeviceRole:(int)a3 captureRule:(id)a4 isUnpausing:(BOOL)a5;
- (BOOL)requiresWifi;
- (BOOL)session:(id)a3 didStopVideoIO:(BOOL)a4 error:(id *)a5;
- (BOOL)session:(id)a3 receivedRemoteFrame:(__CVBuffer *)a4 atTime:(id *)a5 withScreenAttributes:(id)a6 videoAttributes:(id)a7 isFirstFrame:(BOOL)a8 isVideoPaused:(BOOL)a9;
- (BOOL)session:(id)a3 startVideoReceive:(id *)a4;
- (BOOL)session:(id)a3 startVideoSend:(id *)a4 captureRuleWifi:(id)a5 captureRuleCell:(id)a6 interface:(int)a7 isUnpausing:(BOOL)a8;
- (BOOL)session:(id)a3 stopVideoReceive:(id *)a4 isPausing:(BOOL)a5;
- (BOOL)setActive:(BOOL)a3;
- (BOOL)setPauseAudio:(BOOL)a3;
- (BOOL)setPauseAudio:(BOOL)a3 callID:(unsigned int)a4 error:(id *)a5;
- (BOOL)setPauseVideo:(BOOL)a3;
- (BOOL)setPauseVideo:(BOOL)a3 callID:(unsigned int)a4 error:(id *)a5;
- (BOOL)shouldPrioritizeParticipantIDForSIPInvite;
- (BOOL)shouldReinitializeCallWithDuration:(double)a3 forCallID:(unsigned int)a4;
- (BOOL)shouldSendAudioForCallID:(unsigned int)a3;
- (BOOL)shouldTimeoutPackets;
- (BOOL)startConnectionWithParticipantID:(id)a3 callID:(unsigned int)a4 oldCallID:(unsigned int)a5 usingInviteData:(id)a6 isCaller:(BOOL)a7 relayResponseDict:(id)a8 didOriginateRelayRequest:(BOOL)a9 capabilities:(id)a10 idsSocket:(int)a11 destination:(id)a12 error:(id *)a13;
- (BOOL)startConnectionWithParticipantID:(id)a3 callID:(unsigned int)a4 usingInviteData:(id)a5 isCaller:(BOOL)a6 capabilities:(id)a7 idsSocket:(int)a8 destination:(id)a9 error:(id *)a10;
- (BOOL)startConnectionWithParticipantID:(id)a3 callID:(unsigned int)a4 usingInviteData:(id)a5 isCaller:(BOOL)a6 relayResponseDict:(id)a7 didOriginateRelayRequest:(BOOL)a8 capabilities:(id)a9 idsSocket:(int)a10 destination:(id)a11 error:(id *)a12;
- (BOOL)stopVideoSend:(BOOL)a3 error:(id *)a4;
- (BOOL)updateSpeaking:(unsigned int)a3 timeStamp:(unsigned int)a4;
- (BOOL)useCompressedConnectionData;
- (BOOL)useViceroyBlobFormat;
- (CGSize)remoteFrameSizeForCallID:(unsigned int)a3;
- (NSMutableDictionary)sessionDict;
- (NSString)currentFocus;
- (VCMediaRecorder)vcMediaRecorder;
- (VCVideoRule)conferenceCaptureRule;
- (VideoConference)initWithClientPid:(int)a3;
- (VideoConferenceChannelQualityDelegate)qualityDelegate;
- (VideoConferenceDelegate)delegate;
- (VideoConferenceSpeakingDelegate)speakingDelegate;
- (double)localBitrateForCallID:(unsigned int)a3;
- (double)localFramerateForCallID:(unsigned int)a3;
- (double)localPacketLossRateForCallID:(unsigned int)a3;
- (double)networkQualityForCallID:(unsigned int)a3;
- (double)packetLossRateForCallID:(unsigned int)a3;
- (double)remoteBitrateForCallID:(unsigned int)a3;
- (double)remoteFramerateForCallID:(unsigned int)a3;
- (double)remotePacketLossRateForCallID:(unsigned int)a3;
- (double)roundTripTimeForCallID:(unsigned int)a3;
- (float)conferenceVolume;
- (float)inputMeterLevel;
- (float)outputMeterLevel;
- (float)powerIntToFloat:(unsigned __int8)a3;
- (id)callMetadataForCallID:(unsigned int)a3;
- (id)clientCaptureRule;
- (id)connectionBlobForParticipantID:(id)a3 callID:(unsigned int *)a4 error:(id *)a5;
- (id)inviteDataForParticipantID:(id)a3 callID:(unsigned int *)a4 remoteInviteData:(id)a5 nonCellularCandidateTimeout:(double)a6 error:(id *)a7;
- (id)loopbackSessionWaitingForSIPInvite;
- (id)newSessionWithDeviceRole:(int)a3 reportingHierarchyToken:(id)a4;
- (id)openSessionForParticipant:(id)a3;
- (id)sessionForIncomingParticipantID:(id)a3;
- (id)sessionForParticipantID:(id)a3;
- (id)sessionForSourceDestinationInfo:(tagVCSourceDestinationInfo *)a3;
- (id)statsForCallID:(unsigned int)a3;
- (int)chatMode;
- (int)conferenceOperatingMode;
- (int)currentCameraID;
- (int)deviceRole;
- (int)downstreamBandwidth;
- (int)localFrameHeight;
- (int)localFrameWidth;
- (int)natType;
- (int)natTypeForCallSessions:(const char *)a3;
- (int)packetsPerBundle;
- (int)pullDecodedAsFocus:(opaqueVCAudioBufferList *)a3;
- (int)pullDecodedAsFocusClient:(opaqueVCAudioBufferList *)a3;
- (int)pullDecodedMeshMode:(opaqueVCAudioBufferList *)a3;
- (int)setupSpatialAudioWithCallID:(unsigned int)a3;
- (int)sipCallbackNotification:(int)a3 callID:(unsigned int)a4 msgIn:(const char *)a5 msgOut:(char *)a6 optional:(void *)a7 confIndex:(int *)a8;
- (int)stateForCallID:(unsigned int)a3;
- (int)tryrdlock;
- (int)upstreamBandwidth;
- (int64_t)inputAudioPowerSpectrumToken;
- (int64_t)outputAudioPowerSpectrumToken;
- (unsigned)calculateTalkingMaskAtTimeStamp:(unsigned int)a3;
- (unsigned)callIDForOpenSessionWithParticipantID:(id)a3;
- (unsigned)initializeNewCallWithDeviceRole:(int)a3;
- (unsigned)initializeNewCallWithDeviceRole:(int)a3 reportingHierarchyToken:(id)a4;
- (unsigned)lastActiveCall;
- (unsigned)momentsCapabilitiesWithNegotiationBlobMomentsSettings_Capabilities:(int)a3;
- (unsigned)powerFloatToInt:(float)a3;
- (unsigned)preferredCodec;
- (unsigned)pruneQuietestPeers:(unsigned int)a3 talking:(unsigned int)a4 mask:(unsigned int)a5 meters:(char *)a6;
- (unsigned)talkingPeersLimit;
- (unsigned)transportType;
- (void)NATTypeDictionaryUpdated:(id)a3;
- (void)avConferencePreviewError:(id)a3;
- (void)avConferenceScreenCaptureError:(id)a3;
- (void)calculateMixingArrays:(unsigned int *)a3 talkingMask:(unsigned int)a4;
- (void)cameraAvailabilityDidChange:(BOOL)a3;
- (void)cancelCallID:(unsigned int)a3;
- (void)cancelCallID:(unsigned int)a3 error:(id)a4;
- (void)captureAsFocus:(opaqueVCAudioBufferList *)a3;
- (void)captureAsFocusClient:(opaqueVCAudioBufferList *)a3;
- (void)captureMeshMode:(opaqueVCAudioBufferList *)a3;
- (void)cleanUpMediaRecorder;
- (void)cleanupManager;
- (void)cleanupProc:(id)a3;
- (void)cleanupQueues;
- (void)cleanupSession:(id)a3 didRemoteCancel:(BOOL)a4;
- (void)cleanupSession:(id)a3 withDelay:(unint64_t)a4;
- (void)cleanupSpatialAudioForCallID:(unsigned int)a3;
- (void)dealloc;
- (void)defaultCleanupSession:(id)a3;
- (void)didResumeAudioIO:(id)a3;
- (void)didSuspendAudioIO:(id)a3;
- (void)didUpdateBasebandCodec:(const _VCRemoteCodecInfo *)a3;
- (void)forceNoICE:(BOOL)a3;
- (void)handleCellTechChange:(int)a3 cellularMaxPktLen:(unsigned __int16)a4;
- (void)markUnfinishedSessions;
- (void)mediaRecorder:(id)a3 shouldProcessRequest:(id)a4 recipientID:(id)a5;
- (void)notifyDelegateOfLocalVariablesChange;
- (void)processRelayRequestResponse:(unsigned int)a3 responseDict:(id)a4 didOriginateRequest:(BOOL)a5;
- (void)processRelayUpdate:(unsigned int)a3 updateDict:(id)a4 didOriginateRequest:(BOOL)a5;
- (void)processRemoteIPChange:(id)a3 callID:(unsigned int)a4;
- (void)pullAudioSamples:(opaqueVCAudioBufferList *)a3;
- (void)pushAudioSamples:(opaqueVCAudioBufferList *)a3;
- (void)rdlock;
- (void)remoteAudioDidPause:(BOOL)a3 callID:(unsigned int)a4;
- (void)remoteCancelledCallID:(unsigned int)a3;
- (void)remoteVideoDidPause:(BOOL)a3 callID:(unsigned int)a4;
- (void)sendARPLData:(id)a3 toCallID:(unsigned int)a4;
- (void)sendData:(id)a3 toCallID:(unsigned int)a4 encrypted:(BOOL)a5;
- (void)serverDidDie;
- (void)session:(id)a3 cancelRelayRequest:(id)a4;
- (void)session:(id)a3 changeVideoRulesToCaptureRule:(id)a4 encodeRule:(id)a5 featureListString:(id)a6;
- (void)session:(id)a3 cleanUpWithDelay:(int64_t)a4 error:(id)a5;
- (void)session:(id)a3 connectionDidChangeWithLocalInterfaceType:(id)a4 remoteInterfaceType:(id)a5 callID:(unsigned int)a6;
- (void)session:(id)a3 didChangeRemoteScreenAttributes:(id)a4;
- (void)session:(id)a3 didChangeVideoRule:(id)a4;
- (void)session:(id)a3 didPauseAudio:(BOOL)a4 error:(id)a5;
- (void)session:(id)a3 didPauseVideo:(BOOL)a4 error:(id)a5;
- (void)session:(id)a3 didReceiveARPLData:(id)a4 fromCallID:(unsigned int)a5;
- (void)session:(id)a3 didReceiveData:(id)a4 messageType:(unsigned int)a5 withCallID:(unsigned int)a6;
- (void)session:(id)a3 didReceiveMomentsRequest:(id)a4;
- (void)session:(id)a3 didStart:(BOOL)a4 connectionType:(unsigned int)a5 localInterfaceType:(id)a6 remoteInterfaceType:(id)a7 error:(id)a8;
- (void)session:(id)a3 didStopWithError:(id)a4;
- (void)session:(id)a3 initiateRelayRequest:(id)a4;
- (void)session:(id)a3 isSendingAudio:(BOOL)a4 error:(id)a5;
- (void)session:(id)a3 localAudioEnabled:(BOOL)a4 withCallID:(unsigned int)a5 error:(id)a6;
- (void)session:(id)a3 localIPChange:(id)a4 withCallID:(unsigned int)a5;
- (void)session:(id)a3 packMeters:(char *)a4 withLength:(char *)a5;
- (void)session:(id)a3 receivedNoPacketsForSeconds:(double)a4;
- (void)session:(id)a3 remoteAudioEnabled:(BOOL)a4 withCallID:(unsigned int)a5;
- (void)session:(id)a3 remoteCallingModeChanged:(unsigned int)a4 withCallID:(unsigned int)a5;
- (void)session:(id)a3 remoteMediaStalled:(BOOL)a4;
- (void)session:(id)a3 sendRelayResponse:(id)a4;
- (void)session:(id)a3 setMomentsCapabilities:(unsigned int)a4 imageType:(int)a5 videoCodec:(int)a6;
- (void)session:(id)a3 setRemoteBasebandCodecType:(unsigned int)a4 sampleRate:(double)a5;
- (void)session:(id)a3 startAudioWithFarEndVersionInfo:(VoiceIOFarEndVersionInfo *)a4 internalFrameFormat:(const tagVCAudioFrameFormat *)a5 completionHandler:(id)a6;
- (void)session:(id)a3 stopAudioWithCompletionHandler:(id)a4;
- (void)session:(id)a3 withCallID:(unsigned int)a4 networkHint:(BOOL)a5;
- (void)session:(id)a3 withCallID:(unsigned int)a4 videoIsDegraded:(BOOL)a5 isRemote:(BOOL)a6;
- (void)setBWEOptions:(BOOL)a3 UseNewBWEMode:(BOOL)a4 FakeLargeFrameMode:(BOOL)a5 ProbingSenderLog:(BOOL)a6;
- (void)setCallReport:(unsigned int)a3 withReport:(id)a4;
- (void)setChatMode:(int)a3;
- (void)setConferenceOperatingMode:(int)a3;
- (void)setConferenceState:(unsigned int)a3 forCallID:(unsigned int)a4;
- (void)setConferenceVisualRectangle:(CGRect)a3 forCallID:(unsigned int)a4;
- (void)setConferenceVolume:(float)a3;
- (void)setCurrentFocus:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableVAD:(BOOL)a3;
- (void)setDownstreamBandwidth:(int)a3;
- (void)setEnableSpeakerPhone:(BOOL)a3;
- (void)setHasMic:(BOOL)a3;
- (void)setInputFrequencyMeteringEnabled:(BOOL)a3;
- (void)setInputMeteringEnabled:(BOOL)a3;
- (void)setIsFocus:(BOOL)a3;
- (void)setIsGKVoiceChat:(BOOL)a3;
- (void)setIsUsingSuppression:(BOOL)a3;
- (void)setIsValid:(BOOL)a3;
- (void)setLastActiveCall:(unsigned int)a3;
- (void)setMicrophoneMuted:(BOOL)a3;
- (void)setOutputFrequencyMeteringEnabled:(BOOL)a3;
- (void)setOutputMeteringEnabled:(BOOL)a3;
- (void)setPacketsPerBundle:(int)a3;
- (void)setPeerCN:(id)a3 callID:(unsigned int)a4;
- (void)setPeerProtocolVersion:(unsigned int)a3 forCallID:(unsigned int)a4;
- (void)setPeerReportingID:(id)a3 sessionID:(id)a4 callID:(unsigned int)a5;
- (void)setPreferredCodec:(unsigned int)a3;
- (void)setQualityDelegate:(id)a3;
- (void)setRequiresWifi:(BOOL)a3;
- (void)setSendAudio:(BOOL)a3 forCallID:(unsigned int)a4;
- (void)setSessionDict:(id)a3;
- (void)setSessionID:(id)a3 callID:(unsigned int)a4;
- (void)setShouldPrioritizeParticipantIDForSIPInvite:(BOOL)a3;
- (void)setShouldTimeoutPackets:(BOOL)a3;
- (void)setSpeakingDelegate:(id)a3;
- (void)setTalkingPeersLimit:(unsigned int)a3;
- (void)setTransportType:(unsigned int)a3;
- (void)setUpAudioIO:(int)a3 callID:(unsigned int)a4;
- (void)setUpstreamBandwidth:(int)a3;
- (void)setUseCompressedConnectionData:(BOOL)a3;
- (void)setUseViceroyBlobFormat:(BOOL)a3;
- (void)setupNATObserver;
- (void)shouldSendBlackFrame:(BOOL)a3 callID:(id)a4;
- (void)stopAllCalls:(id)a3;
- (void)stopCallID:(unsigned int)a3;
- (void)stopCallID:(unsigned int)a3 didRemoteCancel:(BOOL)a4 error:(id)a5;
- (void)thermalLevelDidChange:(int)a3;
- (void)threadSafeCleanupSession:(id)a3;
- (void)triggerInterfaceChange;
- (void)unlock;
- (void)updateAudioTimestampsForSession:(id)a3 withNewSampleTime:(unsigned int)a4 hostTime:(double)a5 numSamples:(int)a6;
- (void)updateCapabilities:(id)a3 forCallID:(unsigned int)a4;
- (void)updateCapabilities:(id)a3 forSession:(id)a4;
- (void)updateMeter:(unsigned __int8)a3 forParticipant:(id)a4 atIndex:(unsigned int)a5;
- (void)updateMeters:(unsigned __int16)a3;
- (void)updateRelayedCallType:(unsigned __int8)a3 forCallID:(unsigned int)a4;
- (void)updatedConnectedPeers:(id)a3;
- (void)updatedMutedPeers:(id)a3 forParticipantID:(id)a4;
- (void)vcAudioPowerLevelMonitor:(id)a3 isAudioBelowThreshold:(BOOL)a4;
- (void)warmupForCall;
- (void)wrlock;
@end

@implementation VideoConference

- (VideoConference)initWithClientPid:(int)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if ((VideoConference *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v25 = v6;
        __int16 v26 = 2080;
        v27 = "-[VideoConference initWithClientPid:]";
        __int16 v28 = 1024;
        int v29 = 289;
        v8 = "VideoConference [%s] %s:%d ";
        v9 = v7;
        uint32_t v10 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v5 = (__CFString *)[(VideoConference *)self performSelector:sel_logPrefix];
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
        *(_DWORD *)buf = 136316162;
        uint64_t v25 = v11;
        __int16 v26 = 2080;
        v27 = "-[VideoConference initWithClientPid:]";
        __int16 v28 = 1024;
        int v29 = 289;
        __int16 v30 = 2112;
        v31 = v5;
        __int16 v32 = 2048;
        v33 = self;
        v8 = "VideoConference [%s] %s:%d %@(%p) ";
        v9 = v12;
        uint32_t v10 = 48;
        goto LABEL_11;
      }
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)VideoConference;
  v13 = [(VCObject *)&v23 init];
  *((_DWORD *)v13 + 42) = a3;
  v13[741] = 0;
  *((void *)v13 + 28) = +[VideoConferenceManager defaultVideoConferenceManager];
  pthread_rwlock_init((pthread_rwlock_t *)(v13 + 232), 0);
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
  *((void *)v13 + 54) = v14;
  *((void *)v13 + 55) = (id)[v14 allValues];
  *((void *)v13 + 56) = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*((id *)v13 + 55), "count"));
  [*((id *)v13 + 28) addVideoConference:v13];
  [*((id *)v13 + 28) setActiveConference:v13];
  *((void *)v13 + 66) = 0;
  *((void *)v13 + 67) = 0;
  *((void *)v13 + 68) = 0;
  *((_DWORD *)v13 + 145) = 0;
  *((_DWORD *)v13 + 144) = 0;
  *((void *)v13 + 73) = objc_alloc_init(VCVideoRule);
  *((void *)v13 + 74) = objc_alloc_init(CameraConferenceSynchronizer);
  *((void *)v13 + 75) = 0;
  *((_DWORD *)v13 + 184) = 0;
  pthread_mutex_init((pthread_mutex_t *)(v13 + 608), 0);
  pthread_mutex_init((pthread_mutex_t *)(v13 + 672), 0);
  v13[740] = 0;
  *((_DWORD *)v13 + 186) = 2;
  v13[748] = 0;
  v13[893] = 0;
  *((void *)v13 + 94) = 0;
  *((void *)v13 + 95) = 0;
  v13[892] = 1;
  *((void *)v13 + 97) = 0;
  *(void *)(v13 + 796) = 0;
  *(void *)(v13 + 804) = 0;
  *((_DWORD *)v13 + 198) = -1;
  *((_DWORD *)v13 + 208) = 1008981770;
  *((_DWORD *)v13 + 209) = 0;
  v13[840] = 0;
  *((_DWORD *)v13 + 211) = 0;
  *((_DWORD *)v13 + 212) = 1;
  v13[768] = 1;
  *((_DWORD *)v13 + 193) = 1065353216;
  uint64_t v15 = MEMORY[0x1E4F1F9F8];
  *(_OWORD *)(v13 + 852) = *MEMORY[0x1E4F1F9F8];
  *(void *)(v13 + 868) = *(void *)(v15 + 16);
  *((_DWORD *)v13 + 220) = 104;
  *((_DWORD *)v13 + 221) = 0;
  v13[894] = 0;
  v13[877] = 1;
  *((_DWORD *)v13 + 258) = 0;
  *((_DWORD *)v13 + 121) = -1024458752;
  *((_DWORD *)v13 + 120) = -1024458752;
  *((void *)v13 + 61) = VCUniqueIDGenerator_GenerateID();
  *((void *)v13 + 63) = [[VCAudioPowerSpectrumSource alloc] initWithStreamToken:*((void *)v13 + 61) delegate:0];
  [+[VCAudioPowerSpectrumManager sharedInstance] registerAudioPowerMeterSource:*((void *)v13 + 63)];
  *((void *)v13 + 62) = VCUniqueIDGenerator_GenerateID();
  *((void *)v13 + 64) = [[VCAudioPowerSpectrumSource alloc] initWithStreamToken:*((void *)v13 + 62) delegate:0];
  [+[VCAudioPowerSpectrumManager sharedInstance] registerAudioPowerMeterSource:*((void *)v13 + 64)];
  buf[0] = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"disableAudio", @"com.apple.VideoConference", buf);
  Boolean keyExistsAndHasValidFormat = 0;
  int v17 = CFPreferencesGetAppBooleanValue(@"disableFacetimeTimeout", @"com.apple.VideoConference", &keyExistsAndHasValidFormat);
  if (!buf[0] || (char v18 = 0, !AppBooleanValue))
  {
    if (keyExistsAndHasValidFormat) {
      BOOL v19 = v17 == 0;
    }
    else {
      BOOL v19 = 1;
    }
    char v18 = v19;
  }
  v13[895] = v18;
  v13[876] = 0;
  v13[896] = 0;
  v13[897] = 1;
  if (!v13[893] && (int)*MEMORY[0x1E4F47A38] <= 6) {
    VRTraceSetErrorLogLevel();
  }
  pthread_mutex_init((pthread_mutex_t *)(v13 + 912), 0);
  *((void *)v13 + 113) = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"summaryType", &unk_1F3DC4938, @"carrierType", &unk_1F3DC4938, @"nonCarrierType", 0);
  v13[1009] = 0;
  v13[1010] = 0;
  v13[1011] = 0;
  v13[1012] = 0;
  v13[1013] = 0;
  v13[1014] = 1;
  v13[1015] = 1;
  *((_DWORD *)v13 + 259) = 0;
  *((_DWORD *)v13 + 260) = 0;
  v20 = objc_alloc_init(VCAudioPowerLevelMonitor);
  *((void *)v13 + 123) = v20;
  [(VCAudioPowerLevelMonitor *)v20 setDelegate:v13];
  *((_DWORD *)v13 + 254) = 0;
  *((void *)v13 + 128) = dispatch_queue_create("com.apple.VideoConference.Notification", 0);
  *((void *)v13 + 132) = 0;
  *((_DWORD *)v13 + 266) = 0;
  *((void *)v13 + 134) = 0;
  return (VideoConference *)v13;
}

- (void)dealloc
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ((VideoConference *)objc_opt_class() != self)
  {
    if (objc_opt_respondsToSelector()) {
      v3 = (__CFString *)[(VideoConference *)self performSelector:sel_logPrefix];
    }
    else {
      v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_12;
    }
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint32_t v10 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v17 = v9;
    __int16 v18 = 2080;
    BOOL v19 = "-[VideoConference dealloc]";
    __int16 v20 = 1024;
    int v21 = 413;
    __int16 v22 = 2112;
    objc_super v23 = v3;
    __int16 v24 = 2048;
    uint64_t v25 = self;
    uint64_t v6 = "VideoConference [%s] %s:%d %@(%p) ";
    v7 = v10;
    uint32_t v8 = 48;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v17 = v4;
      __int16 v18 = 2080;
      BOOL v19 = "-[VideoConference dealloc]";
      __int16 v20 = 1024;
      int v21 = 413;
      uint64_t v6 = "VideoConference [%s] %s:%d ";
      v7 = v5;
      uint32_t v8 = 28;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    }
  }
LABEL_12:
  [(VideoConference *)self cleanupQueues];
  [(VideoConference *)self cleanUpMediaRecorder];

  self->mutedPeers = 0;
  self->connectedPeers = 0;

  self->currentFocus = 0;
  self->_startedSessions = 0;

  self->_sessionDict = 0;
  self->_sessionArray = 0;

  self->natTypeDictionary = 0;
  VCFFTMeter_Destroy((uint64_t *)&self->_inputFFTMeter);
  VCFFTMeter_Destroy((uint64_t *)&self->_outputFFTMeter);

  self->_remoteAudioPowerLevelMonitor = 0;
  uint64_t v11 = +[VCAudioPowerSpectrumManager sharedInstance];
  -[VCAudioPowerSpectrumManager unregisterAudioPowerSpectrumSourceForStreamToken:](v11, "unregisterAudioPowerSpectrumSourceForStreamToken:", objc_msgSend(NSNumber, "numberWithInteger:", -[VCAudioPowerSpectrumSource streamToken](self->_inputAudioPowerSpectrumSource, "streamToken")));
  v12 = +[VCAudioPowerSpectrumManager sharedInstance];
  -[VCAudioPowerSpectrumManager unregisterAudioPowerSpectrumSourceForStreamToken:](v12, "unregisterAudioPowerSpectrumSourceForStreamToken:", objc_msgSend(NSNumber, "numberWithInteger:", -[VCAudioPowerSpectrumSource streamToken](self->_outputAudioPowerSpectrumSource, "streamToken")));
  [(VCAudioPowerSpectrumSource *)self->_inputAudioPowerSpectrumSource invalidate];

  [(VCAudioPowerSpectrumSource *)self->_outputAudioPowerSpectrumSource invalidate];
  pthread_mutex_destroy(&self->natMutex);

  objc_sync_enter(self);
  [(GKNATObserver *)self->natObserver setDelegate:0];

  self->natObserver = 0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v17 = v13;
      __int16 v18 = 2080;
      BOOL v19 = "-[VideoConference dealloc]";
      __int16 v20 = 1024;
      int v21 = 449;
      _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d Tearing down the natObserver.", buf, 0x1Cu);
    }
  }
  objc_sync_exit(self);

  self->synchronizer = 0;
  self->conferenceCaptureRule = 0;
  pthread_mutex_destroy(&self->xRemoteLayer);
  pthread_mutex_destroy(&self->xAudioTS);
  pthread_rwlock_destroy(&self->stateLock);
  dispatch_release((dispatch_object_t)self->delegateNotificationQueue);
  objc_storeWeak(&self->delegate, 0);
  v15.receiver = self;
  v15.super_class = (Class)VideoConference;
  [(VCObject *)&v15 dealloc];
}

- (unsigned)initializeNewCallWithDeviceRole:(int)a3
{
  return [(VideoConference *)self initializeNewCallWithDeviceRole:*(void *)&a3 reportingHierarchyToken:0];
}

- (unsigned)initializeNewCallWithDeviceRole:(int)a3 reportingHierarchyToken:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  v10[5] = *MEMORY[0x1E4F143B8];
  global_queue = dispatch_get_global_queue(0, 0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__VideoConference_initializeNewCallWithDeviceRole_reportingHierarchyToken___block_invoke;
  v10[3] = &unk_1E6DB3DC8;
  v10[4] = self;
  dispatch_async(global_queue, v10);
  self->_deviceRole = v5;
  id v8 = [(VideoConference *)self newSessionWithDeviceRole:v5 reportingHierarchyToken:a4];
  self->frontQueue = (VCImageQueue *)objc_msgSend((id)VCRemoteVideoManager_DefaultManager(), "newQueueForStreamToken:videoMode:", objc_msgSend(v8, "callID"), 0);
  self->backQueue = (VCImageQueue *)objc_msgSend((id)VCRemoteVideoManager_DefaultManager(), "newQueueForStreamToken:videoMode:", objc_msgSend(v8, "callID"), 1);
  self->screenQueue = (VCImageQueue *)objc_msgSend((id)VCRemoteVideoManager_DefaultManager(), "newQueueForStreamToken:videoMode:", objc_msgSend(v8, "callID"), 2);
  LODWORD(self) = [v8 callID];

  return self;
}

uint64_t __75__VideoConference_initializeNewCallWithDeviceRole_reportingHierarchyToken___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) warmupForCall];
}

- (id)newSessionWithDeviceRole:(int)a3 reportingHierarchyToken:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [[VCCallSession alloc] initWithDeviceRole:*(void *)&a3 transportType:self->_transportType isGKVoiceChat:BYTE1(self->downstreamBandwidth) reportingHierarchyToken:a4];
  v7 = v6;
  if (!a3) {
    [(VCCallSession *)v6 setPreferredAudioCodec:*(unsigned int *)&self->disableVAD];
  }
  [(VCCallSession *)v7 setDelegate:self];
  [(VCCallSession *)v7 setPacketsPerBundle:self->packetsPerBundle];
  [(VCCallSession *)v7 setUseCompressedConnectionData:self->isGKVoiceChat];
  [(VCCallSession *)v7 setRequiresWifi:BYTE5(self->recvRTPTimeStamp.epoch)];
  [(VCCallSession *)v7 setNatType:[(VideoConference *)self natTypeForCallSessions:"newSession"]];
  [(VCCallSession *)v7 setQualityDelegate:self->qualityDelegate];
  [(VCCallSession *)v7 setShouldTimeoutPackets:HIBYTE(self->downstreamBandwidth)];
  if (self->conferenceOperatingMode) {
    -[VCCallSession setOperatingMode:](v7, "setOperatingMode:");
  }
  if (!BYTE1(self->downstreamBandwidth)) {
    [(VCCallSession *)v7 setupBitrateNegotiation];
  }
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  uint64_t v9 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint64_t v11 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315906;
      uint64_t v18 = v10;
      __int16 v19 = 2080;
      __int16 v20 = "-[VideoConference newSessionWithDeviceRole:reportingHierarchyToken:]";
      __int16 v21 = 1024;
      int v22 = 520;
      __int16 v23 = 1024;
      LODWORD(v24) = [(VCCallSession *)v7 requiresWifi];
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d session.requiresWifi = %d", (uint8_t *)&v17, 0x22u);
    }
  }
  [(VideoConference *)self wrlock];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sessionDict, "setObject:forKeyedSubscript:", v7, objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[VCCallSession callID](v7, "callID")));

  self->_sessionArray = (NSArray *)(id)[(NSMutableDictionary *)self->_sessionDict allValues];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    uint64_t v13 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      sessionArray = self->_sessionArray;
      if (sessionArray) {
        objc_super v15 = [(NSString *)[(NSArray *)sessionArray description] UTF8String];
      }
      else {
        objc_super v15 = "<nil>";
      }
      int v17 = 136315906;
      uint64_t v18 = v12;
      __int16 v19 = 2080;
      __int16 v20 = "-[VideoConference newSessionWithDeviceRole:reportingHierarchyToken:]";
      __int16 v21 = 1024;
      int v22 = 526;
      __int16 v23 = 2080;
      __int16 v24 = v15;
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d New session array = %s", (uint8_t *)&v17, 0x26u);
    }
  }
  [(VideoConference *)self unlock];
  return v7;
}

- (void)cleanupManager
{
}

- (void)sendARPLData:(id)a3 toCallID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(VideoConference *)self rdlock];
  id v7 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v4]);
  [(VideoConference *)self unlock];
  if (!v7 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315650;
      uint64_t v13 = v8;
      __int16 v14 = 2080;
      objc_super v15 = "-[VideoConference sendARPLData:toCallID:]";
      __int16 v16 = 1024;
      int v17 = 543;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d >>>>> ERROR: VCCallSession is nil (in VideoConference) <<<<<", (uint8_t *)&v12, 0x1Cu);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint64_t v11 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315906;
      uint64_t v13 = v10;
      __int16 v14 = 2080;
      objc_super v15 = "-[VideoConference sendARPLData:toCallID:]";
      __int16 v16 = 1024;
      int v17 = 546;
      __int16 v18 = 1024;
      int v19 = v4;
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d >>>>> Relaying outgoing ARPL data from VideoConferenceManager to VCCallsession with callID=%d (in VideoConference) <<<<<", (uint8_t *)&v12, 0x22u);
    }
  }
  [v7 sendARPLData:a3 toCallID:v4];
}

- (void)sendData:(id)a3 toCallID:(unsigned int)a4 encrypted:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  [(VideoConference *)self rdlock];
  id v9 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v6]);
  [(VideoConference *)self unlock];

  [v9 sendData:a3 messageType:1 encrypted:v5];
}

- (void)warmupForCall
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (warmupForCall_sDispatchOnceVPInit != -1) {
    dispatch_once(&warmupForCall_sDispatchOnceVPInit, &__block_literal_global_47);
  }
  objc_sync_enter(self);
  if (!self->_isWarmedUp)
  {
    self->_isWarmedUp = 1;
    global_queue = dispatch_get_global_queue(0, 0);
    dispatch_async(global_queue, &__block_literal_global_40);
    if ((objc_msgSend(+[VCTestMonitorManager sharedManager](VCTestMonitorManager, "sharedManager"), "enableLoopbackInterface") & 1) == 0)
    {
      if (!BYTE1(self->downstreamBandwidth))
      {
        if (self->_transportType == 1) {
          +[VCServerBag clearBagWithRefreshIntervalInSeconds:86400];
        }
        +[VCServerBag pullStoreBagKeys];
      }
      if (!self->_transportType)
      {
        [(VideoConference *)self setupNATObserver];
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v4 = VRTraceErrorLogLevelToCSTR();
          BOOL v5 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v6 = BYTE5(self->recvRTPTimeStamp.epoch);
            int v7 = 136315906;
            uint64_t v8 = v4;
            __int16 v9 = 2080;
            uint64_t v10 = "-[VideoConference warmupForCall]";
            __int16 v11 = 1024;
            int v12 = 597;
            __int16 v13 = 1024;
            int v14 = v6;
            _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d warmupForCall: Setting up the natObserver. (requiresWifi: %d)", (uint8_t *)&v7, 0x22u);
          }
        }
      }
    }
  }
  objc_sync_exit(self);
}

uint64_t __32__VideoConference_warmupForCall__block_invoke()
{
  return MEMORY[0x1F41678E0]();
}

uint64_t __32__VideoConference_warmupForCall__block_invoke_2()
{
  CFPreferencesAppSynchronize(@"com.apple.VideoConference");
  CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x1E4F1D3D8]);
  VRTraceReset();

  return VRTracePrintLoggingInfo();
}

- (void)setupNATObserver
{
  v7[3] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = 0;
  if (+[VCServerBag verifyRequiredKeys:&v5]
    && setupNATObserver_onceToken != -1)
  {
    dispatch_once(&setupNATObserver_onceToken, &__block_literal_global_44);
  }
  v3 = (void *)MEMORY[0x1E4E589F0]();
  v6[0] = @"checkTCPSSL";
  v6[1] = @"favorNonCar";
  v7[0] = MEMORY[0x1E4F1CC38];
  v7[1] = MEMORY[0x1E4F1CC38];
  v6[2] = @"addCarrier";
  v7[2] = MEMORY[0x1E4F1CC38];
  uint64_t v4 = -[GKNATObserver initWithOptions:]([GKNATObserver alloc], "initWithOptions:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3]);
  self->natObserver = v4;
  [(GKNATObserver *)v4 setDelegate:self];
}

void __35__VideoConference_setupNATObserver__block_invoke()
{
  if (GetSNATMAPServer() && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __35__VideoConference_setupNATObserver__block_invoke_cold_1();
    }
  }
}

- (void)setIsGKVoiceChat:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BYTE1(self->downstreamBandwidth) = a3;
  objc_msgSend(+[VCAudioManager sharedVoiceChatInstance](VCAudioManager, "sharedVoiceChatInstance"), "setIsGKVoiceChat:", a3);
  [(VCAudioIO *)self->_audioIO setIsGKVoiceChat:v3];
  [(VideoConference *)self rdlock];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  sessionArray = self->_sessionArray;
  uint64_t v6 = [(NSArray *)sessionArray countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(sessionArray);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) setIsGKVoiceChat:BYTE1(self->downstreamBandwidth)];
      }
      uint64_t v7 = [(NSArray *)sessionArray countByEnumeratingWithState:&v11 objects:v10 count:16];
    }
    while (v7);
  }
  [(VideoConference *)self unlock];
}

- (int)natType
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v3 = [(VideoConference *)self natTypeForCallSessions:"natType"];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = BYTE5(self->recvRTPTimeStamp.epoch);
      int v8 = 136316162;
      uint64_t v9 = v4;
      __int16 v10 = 2080;
      long long v11 = "-[VideoConference natType]";
      __int16 v12 = 1024;
      int v13 = 643;
      __int16 v14 = 1024;
      int v15 = v3;
      __int16 v16 = 1024;
      int v17 = v6;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d Getting natType: %d [requiresWifi: %d]", (uint8_t *)&v8, 0x28u);
    }
  }
  return v3;
}

- (double)packetLossRateForCallID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(VideoConference *)self rdlock];
  id v5 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v3]);
  [(VideoConference *)self unlock];

  [v5 packetLossRate];
  return result;
}

- (double)networkQualityForCallID:(unsigned int)a3
{
  uint64_t mostRecentStartedCall = *(void *)&a3;
  if (!a3) {
    uint64_t mostRecentStartedCall = self->mostRecentStartedCall;
  }
  [(VideoConference *)self rdlock];
  objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", mostRecentStartedCall)), "networkQuality");
  double v6 = v5;
  [(VideoConference *)self unlock];
  return v6;
}

- (void)setDelegate:(id)a3
{
}

- (VideoConferenceDelegate)delegate
{
  return (VideoConferenceDelegate *)objc_loadWeak(&self->delegate);
}

- (void)setChatMode:(int)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(VideoConference *)self wrlock];
  self->chatMode = a3;
  if (a3 == 2)
  {
    LOBYTE(self->downstreamBandwidth) = 0;
  }
  else if (!a3)
  {
    BYTE4(self->recvRTPTimeStamp.epoch) = 0;
    LOBYTE(self->downstreamBandwidth) = 1;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    sessionArray = self->_sessionArray;
    uint64_t v6 = [(NSArray *)sessionArray countByEnumeratingWithState:&v11 objects:v10 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(sessionArray);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * i) setUseRateControl:1];
        }
        uint64_t v7 = [(NSArray *)sessionArray countByEnumeratingWithState:&v11 objects:v10 count:16];
      }
      while (v7);
    }
  }
  [(VideoConference *)self unlock];
}

- (void)setIsFocus:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(VideoConference *)self wrlock];
  if (!self->isFocus && v3)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    sessionArray = self->_sessionArray;
    uint64_t v7 = [(NSArray *)sessionArray countByEnumeratingWithState:&v13 objects:v12 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(sessionArray);
          }
          long long v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (([v11 isEqual:self->currentFocusSession] & 1) == 0) {
            VCAudioReceiver_DiscardQueueExcess([v11 audioReceiver]);
          }
        }
        uint64_t v8 = [(NSArray *)sessionArray countByEnumeratingWithState:&v13 objects:v12 count:16];
      }
      while (v8);
    }
  }
  self->isFocus = v3;
  [(VideoConference *)self unlock];
}

- (BOOL)isOutputMeteringEnabled
{
  return self->outputMeteringEnabled;
}

- (void)setOutputMeteringEnabled:(BOOL)a3
{
  self->outputMeteringEnabled = a3;
  -[VCAudioIO setOutputMeteringEnabled:](self->_audioIO, "setOutputMeteringEnabled:");
}

- (void)setIsUsingSuppression:(BOOL)a3
{
  BYTE2(self->downstreamBandwidth) = a3;
}

- (BOOL)isInputFrequencyMeteringEnabled
{
  return self->inputFrequencyMeteringEnabled;
}

- (void)setInputFrequencyMeteringEnabled:(BOOL)a3
{
  if (self->inputFrequencyMeteringEnabled != a3)
  {
    if (a3) {
      self->_inputFFTMeter = (opaqueVCFFTMeter *)VCFFTMeter_Create();
    }
    else {
      VCFFTMeter_Destroy((uint64_t *)&self->_inputFFTMeter);
    }
    self->inputFrequencyMeteringEnabled = a3;
  }
}

- (BOOL)isOutputFrequencyMeteringEnabled
{
  return self->outputFrequencyMeteringEnabled;
}

- (void)setOutputFrequencyMeteringEnabled:(BOOL)a3
{
  if (self->outputFrequencyMeteringEnabled != a3)
  {
    if (a3) {
      self->_outputFFTMeter = (opaqueVCFFTMeter *)VCFFTMeter_Create();
    }
    else {
      VCFFTMeter_Destroy((uint64_t *)&self->_outputFFTMeter);
    }
    self->outputFrequencyMeteringEnabled = a3;
  }
}

- (BOOL)isInputMeteringEnabled
{
  return self->inputMeteringEnabled;
}

- (void)setInputMeteringEnabled:(BOOL)a3
{
  self->inputMeteringEnabled = a3;
  -[VCAudioIO setInputMeteringEnabled:](self->_audioIO, "setInputMeteringEnabled:");
}

- (float)outputMeterLevel
{
  return self->outputMeterLevel;
}

- (float)inputMeterLevel
{
  return self->inputMeterLevel;
}

- (void)cleanupQueues
{
  p_xRemoteLayer = &self->xRemoteLayer;
  pthread_mutex_lock(&self->xRemoteLayer);

  self->frontQueue = 0;
  self->backQueue = 0;

  self->screenQueue = 0;

  pthread_mutex_unlock(p_xRemoteLayer);
}

- (id)connectionBlobForParticipantID:(id)a3 callID:(unsigned int *)a4 error:(id *)a5
{
  id v5 = [(VideoConference *)self inviteDataForParticipantID:a3 callID:a4 remoteInviteData:0 nonCellularCandidateTimeout:a5 error:0.0];

  return (id)[v5 objectForKeyedSubscript:@"InviteDataConnectionBlob"];
}

- (id)inviteDataForParticipantID:(id)a3 callID:(unsigned int *)a4 remoteInviteData:(id)a5 nonCellularCandidateTimeout:(double)a6 error:(id *)a7
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (!a4) {
    return 0;
  }
  unsigned int v13 = *a4;
  int v14 = objc_msgSend(+[VCTestMonitorManager sharedManager](VCTestMonitorManager, "sharedManager"), "enableLoopbackInterface");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    long long v16 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = v15;
      __int16 v39 = 2080;
      v40 = "-[VideoConference inviteDataForParticipantID:callID:remoteInviteData:nonCellularCandidateTimeout:error:]";
      __int16 v41 = 1024;
      int v42 = 956;
      __int16 v43 = 1024;
      *(_DWORD *)v44 = v14;
      _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d inviteDataForParticipantID skipReachingServers:%d", buf, 0x22u);
    }
  }
  if ((v14 & 1) != 0 || BYTE1(self->downstreamBandwidth))
  {
    +[VCServerBag verifyRequiredVoiceChatKeys:0];
  }
  else
  {
    +[VCServerBag pullStoreBagKeys];
    *(void *)buf = 0;
    if (!+[VCServerBag verifyRequiredKeys:buf]
      && (int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VideoConference inviteDataForParticipantID:callID:remoteInviteData:nonCellularCandidateTimeout:error:]();
      }
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v17 = VRTraceErrorLogLevelToCSTR();
    uint64_t v18 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v19 = *a4;
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = v17;
      __int16 v39 = 2080;
      v40 = "-[VideoConference inviteDataForParticipantID:callID:remoteInviteData:nonCellularCandidateTimeout:error:]";
      __int16 v41 = 1024;
      int v42 = 971;
      __int16 v43 = 1024;
      *(_DWORD *)v44 = v19;
      _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d inviteDataForParticipantID:callID %d", buf, 0x22u);
    }
  }
  if (*a4)
  {
    [(VideoConference *)self rdlock];
    id v20 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:*a4]);
    [(VideoConference *)self unlock];
    [v20 setRequiresWifi:BYTE5(self->recvRTPTimeStamp.epoch)];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      int v22 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v23 = BYTE5(self->recvRTPTimeStamp.epoch);
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = v21;
        __int16 v39 = 2080;
        v40 = "-[VideoConference inviteDataForParticipantID:callID:remoteInviteData:nonCellularCandidateTimeout:error:]";
        __int16 v41 = 1024;
        int v42 = 989;
        __int16 v43 = 1024;
        *(_DWORD *)v44 = v23;
        _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d inviteDataForParticipantID: session.requiresWifuint64_t i = %d", buf, 0x22u);
      }
    }
    if (v14) {
      uint64_t v24 = 0;
    }
    else {
      uint64_t v24 = [(VideoConference *)self natTypeForCallSessions:"connectionBlobForParticipantID"];
    }
    [v20 setNatType:v24];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v27 = VRTraceErrorLogLevelToCSTR();
      __int16 v28 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v29 = [v20 callID];
        *(_DWORD *)buf = 136316162;
        *(void *)&uint8_t buf[4] = v27;
        __int16 v39 = 2080;
        v40 = "-[VideoConference inviteDataForParticipantID:callID:remoteInviteData:nonCellularCandidateTimeout:error:]";
        __int16 v41 = 1024;
        int v42 = 997;
        __int16 v43 = 1024;
        *(_DWORD *)v44 = v24;
        *(_WORD *)&v44[4] = 1024;
        *(_DWORD *)&v44[6] = v29;
        _os_log_impl(&dword_1E1EA4000, v28, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d inviteDataForParticipantID: Setting natType %d for callID %d", buf, 0x28u);
      }
    }
  }
  else
  {
    id v20 = [(VideoConference *)self newSessionWithDeviceRole:0 reportingHierarchyToken:0];
    *a4 = [v20 callID];
    id v26 = v20;
  }
  uint64_t v25 = (void *)[v20 inviteDataForParticipantID:a3 callID:a4 remoteInviteData:a5 nonCellularCandidateTimeout:a7 error:a6];
  if (v13 != *a4 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v30 = VRTraceErrorLogLevelToCSTR();
    v31 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      *(void *)&uint8_t buf[4] = v30;
      __int16 v39 = 2080;
      v40 = "-[VideoConference inviteDataForParticipantID:callID:remoteInviteData:nonCellularCandidateTimeout:error:]";
      __int16 v41 = 1024;
      int v42 = 1007;
      __int16 v43 = 2048;
      *(void *)v44 = self;
      *(_WORD *)&v44[8] = 2048;
      v45 = a4;
      __int16 v46 = 1024;
      unsigned int v47 = v13;
      _os_log_error_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_ERROR, "VideoConference [%s] %s:%d VideoConference: CALLID MISMATCH %p client callID %ld internal callID %u", buf, 0x36u);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v32 = VRTraceErrorLogLevelToCSTR();
    v33 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (v25) {
        uint64_t v34 = (const char *)objc_msgSend((id)objc_msgSend(v25, "description"), "UTF8String");
      }
      else {
        uint64_t v34 = "<nil>";
      }
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = v32;
      __int16 v39 = 2080;
      v40 = "-[VideoConference inviteDataForParticipantID:callID:remoteInviteData:nonCellularCandidateTimeout:error:]";
      __int16 v41 = 1024;
      int v42 = 1010;
      __int16 v43 = 2080;
      *(void *)v44 = v34;
      _os_log_impl(&dword_1E1EA4000, v33, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d Returning invite data: %s", buf, 0x26u);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v35 = VRTraceErrorLogLevelToCSTR();
    v36 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = v35;
      __int16 v39 = 2080;
      v40 = "-[VideoConference inviteDataForParticipantID:callID:remoteInviteData:nonCellularCandidateTimeout:error:]";
      __int16 v41 = 1024;
      int v42 = 1012;
      _os_log_impl(&dword_1E1EA4000, v36, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d connection-data-returned", buf, 0x1Cu);
    }
  }
  return v25;
}

- (int)natTypeForCallSessions:(const char *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  p_natMutex = &self->natMutex;
  pthread_mutex_lock(&self->natMutex);
  if ([(NSDictionary *)self->natTypeDictionary objectForKeyedSubscript:@"summaryType"])
  {
    int v6 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->natTypeDictionary, "objectForKeyedSubscript:", @"summaryType"), "unsignedLongValue");
  }
  else
  {
    int v6 = 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      natTypeDictionary = self->natTypeDictionary;
      if (natTypeDictionary) {
        __int16 v10 = [(NSString *)[(NSDictionary *)natTypeDictionary description] UTF8String];
      }
      else {
        __int16 v10 = "<nil>";
      }
      int v12 = 136316418;
      uint64_t v13 = v7;
      __int16 v14 = 2080;
      uint64_t v15 = "-[VideoConference natTypeForCallSessions:]";
      __int16 v16 = 1024;
      int v17 = 1029;
      __int16 v18 = 2080;
      unsigned int v19 = a3;
      __int16 v20 = 2080;
      uint64_t v21 = v10;
      __int16 v22 = 1024;
      int v23 = v6;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d natTypeForCallSessions(%s): natTypeDictionary %s. natType is %d.", (uint8_t *)&v12, 0x36u);
    }
  }
  pthread_mutex_unlock(p_natMutex);
  return v6;
}

- (void)notifyDelegateOfLocalVariablesChange
{
  v3[5] = *MEMORY[0x1E4F143B8];
  delegateNotificationQueue = self->delegateNotificationQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__VideoConference_notifyDelegateOfLocalVariablesChange__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(delegateNotificationQueue, v3);
}

uint64_t __55__VideoConference_notifyDelegateOfLocalVariablesChange__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    BOOL v3 = (void *)[*(id *)(a1 + 32) delegate];
    return objc_msgSend(v3, "videoConference:didChangeLocalVariablesForCallID:");
  }
  return result;
}

- (void)setRequiresWifi:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"requiresNoWifi", @"com.apple.VideoConference", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v6 = AppBooleanValue == 0;
  }
  else {
    BOOL v6 = 1;
  }
  BOOL v7 = v6 && a3;
  BYTE5(self->recvRTPTimeStamp.epoch) = v7;
  [(VideoConference *)self notifyDelegateOfLocalVariablesChange];
}

- (id)callMetadataForCallID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(VideoConference *)self rdlock];
  id v5 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v3]);
  [(VideoConference *)self unlock];

  return (id)[v5 callMetadata];
}

- (void)processRemoteIPChange:(id)a3 callID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  [(VideoConference *)self rdlock];
  id v7 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v4]);
  [(VideoConference *)self unlock];

  [v7 processRemoteIPChange:a3 callID:v4];
}

- (void)setUseViceroyBlobFormat:(BOOL)a3
{
  self->useViceroyBlobFormat = a3;
  if (a3) {
    self->isGKVoiceChat = 1;
  }
}

+ (void)terminateProcess:(id)a3 terminateSource:(id)a4 agent:(opaqueRTCReporting *)a5
{
}

- (void)mediaRecorder:(id)a3 shouldProcessRequest:(id)a4 recipientID:(id)a5
{
  block[6] = *MEMORY[0x1E4F143B8];
  [(VideoConference *)self rdlock];
  uint64_t v7 = [(NSMutableDictionary *)self->_sessionDict allValues];
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__VideoConference_mediaRecorder_shouldProcessRequest_recipientID___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = v7;
  block[5] = a4;
  dispatch_async(global_queue, block);
  [(VideoConference *)self unlock];
}

void __66__VideoConference_mediaRecorder_shouldProcessRequest_recipientID___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  size_t v2 = [*(id *)(a1 + 32) count];
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__VideoConference_mediaRecorder_shouldProcessRequest_recipientID___block_invoke_2;
  block[3] = &unk_1E6DB7610;
  long long v5 = *(_OWORD *)(a1 + 32);
  dispatch_apply(v2, global_queue, block);
}

uint64_t __66__VideoConference_mediaRecorder_shouldProcessRequest_recipientID___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)[*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  uint64_t v4 = *(void *)(a1 + 40);

  return [v3 messageVCMomentsRequest:v4];
}

- (BOOL)actionWillBeginForContext:(const tagVCAsynchronousActionContext *)a3 withError:(id *)a4
{
  return 1;
}

- (BOOL)actionDidFinishForContext:(const tagVCAsynchronousActionContext *)a3 withError:(id *)a4
{
  return 1;
}

- (void)vcAudioPowerLevelMonitor:(id)a3 isAudioBelowThreshold:(BOOL)a4
{
  BOOL v4 = a4;
  [(VideoConference *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [(VideoConference *)self delegate];
    [(VideoConferenceDelegate *)v6 videoConference:self isRemoteAudioBelowThreshold:v4];
  }
}

- (BOOL)getIsVideoPaused:(BOOL *)a3 callID:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  [(VideoConference *)self rdlock];
  id v9 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v6]);
  [(VideoConference *)self unlock];
  if (v9)
  {
    if (a3) {
      *a3 = [v9 videoIsPaused];
    }
  }
  else
  {
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a5, 32004, 101, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VideoConference.m", 1147), @"No CallID", @"Called without a callID we know about");
  }
  return v9 != 0;
}

- (BOOL)getIsAudioPaused:(BOOL *)a3 callID:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  [(VideoConference *)self rdlock];
  id v9 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v6]);
  [(VideoConference *)self unlock];
  if (v9)
  {
    if (a3) {
      *a3 = [v9 audioIsPaused];
    }
  }
  else
  {
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a5, 32004, 102, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VideoConference.m", 1180), @"No CallID", @"Called without a callID we know about");
  }
  return v9 != 0;
}

- (BOOL)shouldSendAudioForCallID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(VideoConference *)self rdlock];
  id v5 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v3]);
  [(VideoConference *)self unlock];

  return [v5 shouldSendAudio];
}

- (void)setSendAudio:(BOOL)a3 forCallID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v5 = a3;
  [(VideoConference *)self rdlock];
  objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v4)), "setShouldSendAudio:", v5);

  [(VideoConference *)self unlock];
}

- (BOOL)setPauseAudio:(BOOL)a3 callID:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  BOOL v7 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [(VideoConference *)self rdlock];
  self->shouldResumeAudio = !v7;
  id v9 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v6]);
  [(VideoConference *)self unlock];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    long long v11 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (v9) {
        int v12 = (const char *)objc_msgSend((id)objc_msgSend(v9, "description"), "UTF8String");
      }
      else {
        int v12 = "<nil>";
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v15 = v10;
      __int16 v16 = 2080;
      int v17 = "-[VideoConference setPauseAudio:callID:error:]";
      __int16 v18 = 1024;
      int v19 = 1220;
      __int16 v20 = 2080;
      uint64_t v21 = v12;
      __int16 v22 = 1024;
      int v23 = v6;
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d setPauseAudio called...session = %s, callID = %d", buf, 0x2Cu);
    }
  }
  if (v9) {
    return [v9 setPauseAudio:v7 error:a5];
  }
  +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a5, 32004, 103, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VideoConference.m", 1230), @"No CallID", @"Called without a callID we know about");
  return 0;
}

- (BOOL)setPauseVideo:(BOOL)a3 callID:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  BOOL v7 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  [(VideoConference *)self rdlock];
  self->shouldResumeVideo = !v7;
  id v9 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v6]);
  [(VideoConference *)self unlock];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    long long v11 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (v9) {
        int v12 = (const char *)objc_msgSend((id)objc_msgSend(v9, "description"), "UTF8String");
      }
      else {
        int v12 = "<nil>";
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v15 = v10;
      __int16 v16 = 2080;
      int v17 = "-[VideoConference setPauseVideo:callID:error:]";
      __int16 v18 = 1024;
      int v19 = 1254;
      __int16 v20 = 2080;
      uint64_t v21 = v12;
      __int16 v22 = 1024;
      int v23 = v6;
      __int16 v24 = 1024;
      BOOL v25 = v7;
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d setPauseVideo called...session = %s, callID = %d, isPaused = %d", buf, 0x32u);
    }
  }
  if (v9) {
    return [v9 setPauseVideo:v7 error:a5];
  }
  +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a5, 32004, 104, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VideoConference.m", 1263), @"No CallID", @"Called without a callID we know about");
  return 0;
}

- (void)setPeerCN:(id)a3 callID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [(VideoConference *)self rdlock];
  id v7 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v4]);
  [(VideoConference *)self unlock];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    id v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (v7)
      {
        uint64_t v10 = (const char *)objc_msgSend((id)objc_msgSend(v7, "description"), "UTF8String");
        if (a3)
        {
LABEL_5:
          long long v11 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
LABEL_8:
          int v12 = 136316418;
          uint64_t v13 = v8;
          __int16 v14 = 2080;
          uint64_t v15 = "-[VideoConference setPeerCN:callID:]";
          __int16 v16 = 1024;
          int v17 = 1277;
          __int16 v18 = 2080;
          int v19 = v10;
          __int16 v20 = 2080;
          uint64_t v21 = v11;
          __int16 v22 = 1024;
          int v23 = v4;
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d setPeerCN: called...session = %s, peerCN = %s callID = %d", (uint8_t *)&v12, 0x36u);
          goto LABEL_9;
        }
      }
      else
      {
        uint64_t v10 = "<nil>";
        if (a3) {
          goto LABEL_5;
        }
      }
      long long v11 = "<nil>";
      goto LABEL_8;
    }
  }
LABEL_9:
  [v7 setPeerCN:a3];
}

- (void)setSessionID:(id)a3 callID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  [(VideoConference *)self rdlock];
  id v7 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v4]);
  [(VideoConference *)self unlock];
  if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
    goto LABEL_9;
  }
  uint64_t v8 = VRTraceErrorLogLevelToCSTR();
  id v9 = *MEMORY[0x1E4F47A50];
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_9;
  }
  if (!v7)
  {
    uint64_t v10 = "<nil>";
    if (a3) {
      goto LABEL_5;
    }
LABEL_7:
    long long v11 = "<nil>";
    goto LABEL_8;
  }
  uint64_t v10 = (const char *)objc_msgSend((id)objc_msgSend(v7, "description"), "UTF8String");
  if (!a3) {
    goto LABEL_7;
  }
LABEL_5:
  long long v11 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
LABEL_8:
  int v13 = 136316418;
  uint64_t v14 = v8;
  __int16 v15 = 2080;
  __int16 v16 = "-[VideoConference setSessionID:callID:]";
  __int16 v17 = 1024;
  int v18 = 1286;
  __int16 v19 = 2080;
  __int16 v20 = v10;
  __int16 v21 = 2080;
  __int16 v22 = v11;
  __int16 v23 = 1024;
  int v24 = v4;
  _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d setSessionID: called...session = %s, sessionID = %s callID = %d", (uint8_t *)&v13, 0x36u);
LABEL_9:
  if (a3) {
    int v12 = (__CFString *)a3;
  }
  else {
    int v12 = &stru_1F3D3E450;
  }
  [v7 setSessionID:v12];
}

- (void)setPeerReportingID:(id)a3 sessionID:(id)a4 callID:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  [(VideoConference *)self rdlock];
  id v9 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v5]);
  [(VideoConference *)self unlock];
  if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
    goto LABEL_11;
  }
  uint64_t v10 = VRTraceErrorLogLevelToCSTR();
  long long v11 = *MEMORY[0x1E4F47A50];
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_11;
  }
  if (a3)
  {
    int v12 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
    if (v9) {
      goto LABEL_5;
    }
LABEL_8:
    int v13 = "<nil>";
    if (a4) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v14 = "<nil>";
    goto LABEL_10;
  }
  int v12 = "<nil>";
  if (!v9) {
    goto LABEL_8;
  }
LABEL_5:
  int v13 = (const char *)objc_msgSend((id)objc_msgSend(v9, "description"), "UTF8String");
  if (!a4) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v14 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
LABEL_10:
  int v17 = 136316674;
  uint64_t v18 = v10;
  __int16 v19 = 2080;
  __int16 v20 = "-[VideoConference setPeerReportingID:sessionID:callID:]";
  __int16 v21 = 1024;
  int v22 = 1297;
  __int16 v23 = 2080;
  int v24 = v12;
  __int16 v25 = 2080;
  uint64_t v26 = v13;
  __int16 v27 = 2080;
  __int16 v28 = v14;
  __int16 v29 = 1024;
  int v30 = v5;
  _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d setPeerReportingID: called...peerReportingID = %s, session = %s, sessionID = %s callID = %d", (uint8_t *)&v17, 0x40u);
LABEL_11:
  if (a3) {
    __int16 v15 = (__CFString *)a3;
  }
  else {
    __int16 v15 = &stru_1F3D3E450;
  }
  [v9 setPeerReportingID:v15];
  if (a4) {
    __int16 v16 = (__CFString *)a4;
  }
  else {
    __int16 v16 = &stru_1F3D3E450;
  }
  [v9 setSessionID:v16];
}

- (void)updateRelayedCallType:(unsigned __int8)a3 forCallID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = a3;
  [(VideoConference *)self rdlock];
  id v7 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v4]);
  [(VideoConference *)self unlock];

  [v7 updateRelayedCallType:v5];
}

- (void)updateCapabilities:(id)a3 forSession:(id)a4
{
  if ([a4 isAudioRunning])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VideoConference updateCapabilities:forSession:]();
      }
    }
  }
  else
  {
    int deviceRole = self->_deviceRole;
    if (deviceRole != [a3 deviceRole])
    {
      self->lastSentAudioSampleTime = 0;
      if ([a3 isVideoEnabled])
      {
        if (![(VideoConference *)self deregisterForVideoFramesWithDeviceRole:self->_deviceRole]&& (int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VideoConference updateCapabilities:forSession:]();
          }
        }
        if (!-[VideoConference registerForVideoFramesWithDeviceRole:captureRule:isUnpausing:](self, "registerForVideoFramesWithDeviceRole:captureRule:isUnpausing:", [a3 deviceRole], self->conferenceCaptureRule, 1)&& (int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VideoConference updateCapabilities:forSession:]();
          }
        }
      }
    }
    [a4 setCapabilities:a3];
    -[VideoConference setUpAudioIO:callID:](self, "setUpAudioIO:callID:", [a3 deviceRole], objc_msgSend(a4, "callID"));
    self->_int deviceRole = [a3 deviceRole];
    if ([a3 isVideoEnabled])
    {
      if ([a3 isVideoSourceScreen]) {
        uint64_t v8 = 4;
      }
      else {
        uint64_t v8 = 1;
      }
    }
    else if ([a3 isAudioEnabled])
    {
      if ([a3 isHalfDuplexAudio]) {
        uint64_t v8 = 7;
      }
      else {
        uint64_t v8 = 2;
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
    [(VideoConference *)self setConferenceOperatingMode:v8];
  }
}

- (void)updateCapabilities:(id)a3 forCallID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int deviceRole = self->_deviceRole;
      *(_DWORD *)buf = 136316674;
      uint64_t v14 = v7;
      __int16 v15 = 2080;
      __int16 v16 = "-[VideoConference updateCapabilities:forCallID:]";
      __int16 v17 = 1024;
      int v18 = 1347;
      __int16 v19 = 2048;
      __int16 v20 = self;
      __int16 v21 = 1024;
      int v22 = v4;
      __int16 v23 = 2112;
      id v24 = a3;
      __int16 v25 = 1024;
      int v26 = deviceRole;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d self = %p, callID = %d, capabilities = %@, _int deviceRole = %d", buf, 0x3Cu);
    }
  }
  [(VideoConference *)self rdlock];
  id v10 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v4]);
  [(VideoConference *)self unlock];
  int v11 = self->_deviceRole;
  if (v11 == [a3 deviceRole] || !objc_msgSend(v10, "isAudioRunning"))
  {
    [(VideoConference *)self updateCapabilities:a3 forSession:v10];
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __48__VideoConference_updateCapabilities_forCallID___block_invoke;
    v12[3] = &unk_1E6DB7638;
    v12[4] = self;
    v12[5] = a3;
    v12[6] = v10;
    [v10 stopAudioWithCompletionHandler:v12];
  }
}

uint64_t __48__VideoConference_updateCapabilities_forCallID___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateCapabilities:*(void *)(a1 + 40) forSession:*(void *)(a1 + 48)];
  size_t v2 = *(void **)(a1 + 48);

  return [v2 startAudioWithCompletionHandler:0];
}

- (BOOL)shouldReinitializeCallWithDuration:(double)a3 forCallID:(unsigned int)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  char v8 = 0;
  uint64_t v7 = 0;
  [(VideoConference *)self getIsAudioPaused:&v8 callID:*(void *)&a4 error:&v7];
  return a3 > 15.0 && v8 == 0;
}

- (void)cleanUpMediaRecorder
{
  vcMediaRecorder = self->_vcMediaRecorder;
  if (vcMediaRecorder)
  {
    [(VCMediaRecorder *)vcMediaRecorder invalidate];

    self->_vcMediaRecorder = 0;
  }
}

- (void)setConferenceOperatingMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(VideoConference *)self wrlock];
  if (self->conferenceOperatingMode != v3)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    sessionArray = self->_sessionArray;
    uint64_t v6 = [(NSArray *)sessionArray countByEnumeratingWithState:&v15 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(sessionArray);
          }
          [*(id *)(*((void *)&v15 + 1) + 8 * i) setOperatingMode:v3];
        }
        uint64_t v7 = [(NSArray *)sessionArray countByEnumeratingWithState:&v15 objects:v14 count:16];
      }
      while (v7);
    }
    id v10 = [(NSArray *)self->_sessionArray firstObject];
    if (v3 == 1)
    {
      if (!self->_vcMediaRecorder)
      {
        int v11 = v10;
        self->_vcMediaRecorder = -[VCMediaRecorder initWithStreamToken:delegate:reportingAgent:]([VCMediaRecorder alloc], "initWithStreamToken:delegate:reportingAgent:", [v10 callID], self, -[VCObject reportingAgent](self, "reportingAgent"));
        -[VCMediaRecorderManager registerMediaRecorder:withStreamToken:](+[VCMediaRecorderManager sharedInstance](VCMediaRecorderManager, "sharedInstance"), "registerMediaRecorder:withStreamToken:", self->_vcMediaRecorder, [v11 callID]);
      }
    }
    else
    {
      [(VideoConference *)self cleanUpMediaRecorder];
    }
    self->conferenceOperatingMode = v3;
  }
  BOOL v13 = v3 != 2 && v3 != 7;
  BYTE4(self->recvRTPTimeStamp.epoch) = v13;
  [(VideoConference *)self unlock];
  [(VideoConference *)self notifyDelegateOfLocalVariablesChange];
}

- (int)conferenceOperatingMode
{
  [(VideoConference *)self rdlock];
  int conferenceOperatingMode = self->conferenceOperatingMode;
  [(VideoConference *)self unlock];
  return conferenceOperatingMode;
}

- (BOOL)startConnectionWithParticipantID:(id)a3 callID:(unsigned int)a4 oldCallID:(unsigned int)a5 usingInviteData:(id)a6 isCaller:(BOOL)a7 relayResponseDict:(id)a8 didOriginateRelayRequest:(BOOL)a9 capabilities:(id)a10 idsSocket:(int)a11 destination:(id)a12 error:(id *)a13
{
  self->lastActiveCall = a5;
  return -[VideoConference startConnectionWithParticipantID:callID:usingInviteData:isCaller:relayResponseDict:didOriginateRelayRequest:capabilities:idsSocket:destination:error:](self, "startConnectionWithParticipantID:callID:usingInviteData:isCaller:relayResponseDict:didOriginateRelayRequest:capabilities:idsSocket:destination:error:", a3, *(void *)&a4, a6, a7, a8, a9);
}

- (BOOL)startConnectionWithParticipantID:(id)a3 callID:(unsigned int)a4 usingInviteData:(id)a5 isCaller:(BOOL)a6 relayResponseDict:(id)a7 didOriginateRelayRequest:(BOOL)a8 capabilities:(id)a9 idsSocket:(int)a10 destination:(id)a11 error:(id *)a12
{
  BOOL v12 = a8;
  uint64_t v14 = *(void *)&a4;
  BOOL v16 = [(VideoConference *)self startConnectionWithParticipantID:a3 callID:*(void *)&a4 usingInviteData:a5 isCaller:a6 capabilities:a9 idsSocket:a10 destination:a11 error:a12];
  BOOL v17 = v16;
  if (a7 && v16) {
    [(VideoConference *)self processRelayRequestResponse:v14 responseDict:a7 didOriginateRequest:v12];
  }
  return v17;
}

- (void)setUpAudioIO:(int)a3 callID:(unsigned int)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  [(VideoConference *)self rdlock];
  if ([(NSMutableArray *)self->_startedSessions count])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VideoConference setUpAudioIO:callID:]();
      }
    }
  }
  else
  {
    *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v22 = v7;
    long long v23 = v7;
    long long v24 = v7;
    long long v25 = v7;
    *(_OWORD *)&v21[32] = v7;
    *(_OWORD *)&v21[48] = v7;
    *(_OWORD *)__int16 v21 = v7;
    *(_OWORD *)&v21[16] = v7;
    long long v19 = v7;
    long long v20 = v7;
    long long v17 = v7;
    long long v18 = v7;
    long long v16 = v7;
    unint64_t v14 = __PAIR64__(self->_audioChannelIndex, a4);
    LODWORD(v15) = self->conferenceOperatingMode;
    HIDWORD(v15) = a3;
    LODWORD(v16) = 0;
    WORD2(v16) = 259;
    *((void *)&v16 + 1) = self;
    LODWORD(v17) = self->_clientPid;
    BYTE12(v17) = 0;
    *(void *)((char *)&v17 + 4) = 0;
    *(void *)&long long v18 = a4;
    DWORD2(v18) = 1;
    memset(&v21[8], 0, 48);
    long long v19 = 0uLL;
    WORD4(v20) = 0;
    *(void *)&long long v20 = 0;
    *(void *)__int16 v21 = self;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    *(void *)&v21[56] = self;
    *(void *)&long long v25 = 0;
    WORD4(v25) = 0;
    audioIO = self->_audioIO;
    if (audioIO)
    {
      [(VCAudioIO *)audioIO reconfigureWithConfig:&v14];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        id v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v11 = self->_audioIO;
          int conferenceOperatingMode = self->conferenceOperatingMode;
          unsigned int audioChannelIndex = self->_audioChannelIndex;
          *(_DWORD *)buf = 136317186;
          uint64_t v27 = v9;
          __int16 v28 = 2080;
          __int16 v29 = "-[VideoConference setUpAudioIO:callID:]";
          __int16 v30 = 1024;
          int v31 = 1512;
          __int16 v32 = 2048;
          v33 = self;
          __int16 v34 = 2048;
          uint64_t v35 = v11;
          __int16 v36 = 1024;
          int v37 = conferenceOperatingMode;
          __int16 v38 = 1024;
          int v39 = a3;
          __int16 v40 = 1024;
          int v41 = BYTE4(v16);
          __int16 v42 = 1024;
          unsigned int v43 = audioChannelIndex;
          _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d (%p) reconfigured audioIO=%p operatingMode:%d deviceRole:%d direction:%d channelIndex=%u", buf, 0x48u);
        }
      }
    }
    else
    {
      self->_audioIO = [[VCAudioIO alloc] initWithConfiguration:&v14];
    }
    -[VCAudioIO setMuted:](self->_audioIO, "setMuted:", self->microphoneMuted, v14, v15, v16, v17, v18, v19, v20, *(_OWORD *)v21, *(_OWORD *)&v21[16], *(_OWORD *)&v21[32], *(_OWORD *)&v21[48], v22, v23, v24, v25);
    [(VCAudioIO *)self->_audioIO setInputMeteringEnabled:self->inputMeteringEnabled];
    [(VCAudioIO *)self->_audioIO setOutputMeteringEnabled:self->outputMeteringEnabled];
  }
  [(VideoConference *)self unlock];
}

- (int)setupSpatialAudioWithCallID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  cf[1] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  CFTypeRef v15 = 0;
  cf[0] = 0;
  CFTypeRef v14 = 0;
  if (!+[VCHardwareSettings isSpatialAudioSupported]) {
    return 0;
  }
  uint64_t v5 = *MEMORY[0x1E4F1CF80];
  int v6 = VCSpatialAudioMetadata_Create((const __CFAllocator *)*MEMORY[0x1E4F1CF80], 32, 0, 0, (uint64_t *)cf);
  if (v6 < 0)
  {
    int v10 = v6;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VideoConference setupSpatialAudioWithCallID:]();
      }
    }
  }
  else
  {
    int Entry = VCSpatialAudioMetadata_CreateEntry(v5, (uint64_t)cf[0], 0, (uint64_t *)&v15);
    if (Entry < 0)
    {
      int v10 = Entry;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VideoConference setupSpatialAudioWithCallID:]();
        }
      }
    }
    else
    {
      [(VideoConference *)self wrlock];
      int v8 = VCSpatialAudioMetadata_ChannelIndex((uint64_t)v15, &self->_audioChannelIndex);
      if (v8 < 0)
      {
        int v10 = v8;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VideoConference setupSpatialAudioWithCallID:]();
          }
        }
      }
      else
      {
        VCSpatialAudioMetadata_Serialize((uint64_t)cf[0], (CMBlockBufferRef *)&v14);
        id v9 = +[VCAudioManager sharedVoiceChatInstance];
        int v10 = [v9 registerAudioSessionId:v3 maxChannelCountMic:1 maxChannelCountSpeaker:32 spatialMetadata:v14];
        if (v10 < 0)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VideoConference setupSpatialAudioWithCallID:].cold.4();
            }
          }
        }
        else
        {
          int v11 = (void *)cf[0];
          self->_spatialMetadataint Entry = (void *)v15;
          CFTypeRef v15 = 0;
          spatialMetadata = self->_spatialMetadata;
          self->_spatialMetadata = v11;
          if (v11) {
            CFRetain(v11);
          }
          if (spatialMetadata) {
            CFRelease(spatialMetadata);
          }
          [(VideoConference *)self unlock];
        }
      }
    }
  }
  if (cf[0]) {
    CFRelease(cf[0]);
  }
  if (v15) {
    CFRelease(v15);
  }
  if (v14) {
    CFRelease(v14);
  }
  return v10;
}

- (void)cleanupSpatialAudioForCallID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (+[VCHardwareSettings isSpatialAudioSupported])
  {
    spatialMetadataint Entry = self->_spatialMetadataEntry;
    if (spatialMetadataEntry)
    {
      CFRelease(spatialMetadataEntry);
      self->_spatialMetadataint Entry = 0;
    }
    self->_unsigned int audioChannelIndex = 0;
    spatialMetadata = self->_spatialMetadata;
    if (spatialMetadata)
    {
      CFRelease(spatialMetadata);
      self->_spatialMetadata = 0;
    }
    id v7 = +[VCAudioManager sharedVoiceChatInstance];
    [v7 unregisterAudioSessionId:v3];
  }
}

- (BOOL)startConnectionWithParticipantID:(id)a3 callID:(unsigned int)a4 usingInviteData:(id)a5 isCaller:(BOOL)a6 capabilities:(id)a7 idsSocket:(int)a8 destination:(id)a9 error:(id *)a10
{
  uint64_t v10 = *(void *)&a8;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (!a3 || !a7 || !a10)
  {
    if (a10) {
      +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a10, 32016, 105, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", *(void *)&a4, a5, a6, a7, "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VideoConference.m", 1582), @"Invalid Parameter", @"Called with an invalid parameter");
    }
    close(v10);
    return 0;
  }
  BOOL v12 = a6;
  uint64_t v14 = *(void *)&a4;
  if ((objc_msgSend(+[VCTestMonitorManager sharedManager](VCTestMonitorManager, "sharedManager"), "enableLoopbackInterface") & 1) == 0)
  {
    objc_sync_enter(self);
    [(GKNATObserver *)self->natObserver shouldTryNATCheck];
    objc_sync_exit(self);
  }
  BOOL v27 = v12;
  [(VideoConference *)self setupSpatialAudioWithCallID:v14];
  [(VideoConference *)self updateCapabilities:a7 forCallID:v14];
  [(VideoConference *)self rdlock];
  long long v17 = (VCCallSession *)(id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v14]);
  if ([a7 isVideoEnabled]) {
    self->uint64_t mostRecentStartedCall = v14;
  }
  self->shouldResumeVideo = [a7 isVideoPausedToStart] ^ 1;
  [(VideoConference *)self unlock];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v18 = VRTraceErrorLogLevelToCSTR();
    long long v19 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (v17) {
        long long v20 = [(NSString *)[(VCCallSession *)v17 description] UTF8String];
      }
      else {
        long long v20 = "<nil>";
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v29 = v18;
      __int16 v30 = 2080;
      int v31 = "-[VideoConference startConnectionWithParticipantID:callID:usingInviteData:isCaller:capabilities:idsSocket:de"
            "stination:error:]";
      __int16 v32 = 1024;
      int v33 = 1613;
      __int16 v34 = 2080;
      uint64_t v35 = v20;
      __int16 v36 = 1024;
      int v37 = v14;
      _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d startConnectionWithParticipantID called...session = %s, callID = %d", buf, 0x2Cu);
    }
  }
  pthread_mutex_lock(&self->xRemoteLayer);
  [(VCImageQueue *)self->frontQueue stop];
  [(VCImageQueue *)self->backQueue stop];
  [(VCImageQueue *)self->screenQueue stop];
  pthread_mutex_unlock(&self->xRemoteLayer);
  if (!v17)
  {
    [(VideoConference *)self cleanupSpatialAudioForCallID:v14];
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a10, 32004, 106, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VideoConference.m", 1670), @"No CallID", @"Called without a callID we know about");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      long long v22 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v29 = v21;
        __int16 v30 = 2080;
        int v31 = "-[VideoConference startConnectionWithParticipantID:callID:usingInviteData:isCaller:capabilities:idsSocket:"
              "destination:error:]";
        __int16 v32 = 1024;
        int v33 = 1674;
        _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d startConnectionWithParticipantID-completed", buf, 0x1Cu);
      }
    }
    close(v10);
    return 0;
  }
  [(VideoConference *)self setUpAudioIO:self->_deviceRole callID:v14];
  [(VideoConference *)self wrlock];
  if ([a3 isEqual:self->currentFocus]) {
    self->currentFocusSession = v17;
  }
  [(VCCallSession *)v17 setUseRateControl:LOBYTE(self->downstreamBandwidth)];
  [(VideoConference *)self unlock];
  if (BYTE1(self->downstreamBandwidth)) {
    [a7 setIsRelayEnabled:0];
  }
  else {
    [(VideoConference *)self setPacketsPerBundle:1];
  }
  BOOL v23 = [(VCCallSession *)v17 startConnectionWithParticipantID:a3 callID:v14 usingInviteData:a5 isCaller:v27 capabilities:a7 idsSocket:v10 destination:a9 error:a10];
  if (!BYTE1(self->downstreamBandwidth)) {
    [(VCCallSession *)v17 startAWDStats];
  }
  if (!v23)
  {

    self->_audioIO = 0;
    [(VideoConference *)self cleanupSpatialAudioForCallID:v14];
  }
  self->dAudioHostTime = 0.0;
  self->dwAudioTS = 0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v25 = VRTraceErrorLogLevelToCSTR();
    int v26 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v29 = v25;
      __int16 v30 = 2080;
      int v31 = "-[VideoConference startConnectionWithParticipantID:callID:usingInviteData:isCaller:capabilities:idsSocket:de"
            "stination:error:]";
      __int16 v32 = 1024;
      int v33 = 1662;
      _os_log_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d startConnectionWithParticipantID-completed", buf, 0x1Cu);
    }
  }
  return v23;
}

- (BOOL)setActive:(BOOL)a3
{
  return 1;
}

- (void)setCurrentFocus:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  [(VideoConference *)self wrlock];

  self->currentFocus = (NSString *)a3;
  long long v19 = self;
  if (a3)
  {
    currentFocusSession = self->currentFocusSession;
    int v6 = [(VideoConference *)self sessionForParticipantID:a3];
    self->currentFocusSession = v6;
    if (([(VCCallSession *)currentFocusSession isEqual:v6] & 1) == 0) {
      VCAudioReceiver_DiscardQueueExcess((uint64_t)[(VCCallSession *)self->currentFocusSession audioReceiver]);
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      int v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        id v9 = self->currentFocusSession;
        *(_DWORD *)buf = 136315906;
        uint64_t v21 = v7;
        __int16 v22 = 2080;
        BOOL v23 = "-[VideoConference setCurrentFocus:]";
        __int16 v24 = 1024;
        int v25 = 1704;
        __int16 v26 = 2048;
        BOOL v27 = v9;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d setCurrentFocus: updateLastReceivedPacket at client for session: %p", buf, 0x26u);
      }
    }
    [(VCCallSession *)self->currentFocusSession updateLastReceivedPacket:1 packetType:9];
  }
  else
  {
    self->currentFocusSession = 0;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    sessionArray = self->_sessionArray;
    uint64_t v11 = [(NSArray *)sessionArray countByEnumeratingWithState:&v29 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v30;
      uint64_t v14 = (os_log_t *)MEMORY[0x1E4F47A50];
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v30 != v13) {
            objc_enumerationMutation(sessionArray);
          }
          long long v16 = *(VCCallSession **)(*((void *)&v29 + 1) + 8 * i);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v17 = VRTraceErrorLogLevelToCSTR();
            uint64_t v18 = *v14;
            if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              uint64_t v21 = v17;
              __int16 v22 = 2080;
              BOOL v23 = "-[VideoConference setCurrentFocus:]";
              __int16 v24 = 1024;
              int v25 = 1695;
              __int16 v26 = 2048;
              BOOL v27 = v16;
              _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d setCurrentFocus: updateLastReceivedPacket at focus for session: %p", buf, 0x26u);
            }
          }
          [(VCCallSession *)v16 updateLastReceivedPacket:1 packetType:9];
        }
        uint64_t v12 = [(NSArray *)sessionArray countByEnumeratingWithState:&v29 objects:v28 count:16];
      }
      while (v12);
    }
  }
  [(VideoConference *)v19 unlock];
}

- (void)setQualityDelegate:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(VideoConference *)self rdlock];
  self->qualityDelegate = (VideoConferenceChannelQualityDelegate *)a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  sessionArray = self->_sessionArray;
  uint64_t v6 = [(NSArray *)sessionArray countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(sessionArray);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) setQualityDelegate:a3];
      }
      uint64_t v7 = [(NSArray *)sessionArray countByEnumeratingWithState:&v11 objects:v10 count:16];
    }
    while (v7);
  }
  [(VideoConference *)self unlock];
}

- (VideoConferenceChannelQualityDelegate)qualityDelegate
{
  return self->qualityDelegate;
}

- (void)updatedMutedPeers:(id)a3 forParticipantID:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(VideoConference *)self wrlock];
  if (a4)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    sessionArray = self->_sessionArray;
    uint64_t v8 = [(NSArray *)sessionArray countByEnumeratingWithState:&v15 objects:v14 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(sessionArray);
          }
          long long v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v12, "remoteParticipantID"), "isEqualToString:", a4))
          {
            [v12 setMutedPeers:a3];
            goto LABEL_13;
          }
        }
        uint64_t v9 = [(NSArray *)sessionArray countByEnumeratingWithState:&v15 objects:v14 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    id v13 = a3;

    self->mutedPeers = (NSArray *)a3;
  }
LABEL_13:
  [(VideoConference *)self unlock];
}

- (void)updatedConnectedPeers:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(VideoConference *)self wrlock];
  long long v19 = 0uLL;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = 0;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      int v10 = v7;
      long long v11 = (char *)&v19 + v7;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(a3);
        }
        NSUInteger v12 = [(NSArray *)self->connectedPeers indexOfObject:*(void *)(*((void *)&v15 + 1) + 8 * v9)];
        if (v12 != 0x7FFFFFFFFFFFFFFFLL) {
          v11[v9] = self->speakingArray[v12];
        }
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v15 objects:v14 count:16];
      int v7 = v10 + v9;
    }
    while (v6);
  }
  *(_OWORD *)self->speakingArray = v19;
  id v13 = a3;

  self->connectedPeers = (NSArray *)a3;
  [(VideoConference *)self unlock];
}

- (void)stopAllCalls:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  [(VideoConference *)self rdlock];
  uint64_t v5 = (void *)[(NSArray *)self->_sessionArray copy];
  [(VideoConference *)self unlock];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        -[VideoConference stopCallID:didRemoteCancel:error:](self, "stopCallID:didRemoteCancel:error:", [*(id *)(*((void *)&v19 + 1) + 8 * v9++) callID], 0, a3);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v18 count:16];
    }
    while (v7);
  }

  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    long long v11 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315650;
      uint64_t v13 = v10;
      __int16 v14 = 2080;
      long long v15 = "-[VideoConference stopAllCalls:]";
      __int16 v16 = 1024;
      int v17 = 1771;
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d stopAllCalls-completed", (uint8_t *)&v12, 0x1Cu);
    }
  }
}

- (void)stopCallID:(unsigned int)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [(VideoConference *)self stopCallID:*(void *)&a3 didRemoteCancel:0 error:0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      uint64_t v8 = "-[VideoConference stopCallID:]";
      __int16 v9 = 1024;
      int v10 = 1776;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d stopCallID-completed", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (void)cancelCallID:(unsigned int)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [(VideoConference *)self cancelCallID:*(void *)&a3 error:0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      uint64_t v8 = "-[VideoConference cancelCallID:]";
      __int16 v9 = 1024;
      int v10 = 1781;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d cancelCallID-completed", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (void)remoteCancelledCallID:(unsigned int)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [(VideoConference *)self stopCallID:*(void *)&a3 didRemoteCancel:1 error:0];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      uint64_t v8 = "-[VideoConference remoteCancelledCallID:]";
      __int16 v9 = 1024;
      int v10 = 1786;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d remoteCancelledCallID-completed", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (void)setCallReport:(unsigned int)a3 withReport:(id)a4
{
  v9[1] = *MEMORY[0x1E4F143B8];
  int v5 = [a4 lengthOfBytesUsingEncoding:4];
  if (v5)
  {
    size_t v6 = (v5 + 1);
    if (v5 != -1) {
      memset((char *)v9 - ((v6 + 15) & 0x1FFFFFFF0), 170, v6);
    }
    [a4 getCString:(char *)v9 - ((v6 + 15) & 0x1FFFFFFF0) maxLength:(int)v6 encoding:4];
    if (*((unsigned char *)v9 - ((v6 + 15) & 0x1FFFFFFF0)))
    {
      __int16 v7 = (void *)[[NSString alloc] initWithUTF8String:(char *)v9 - ((v6 + 15) & 0x1FFFFFFF0)];
      uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v7, @"Report", 0);
    }
    else
    {
      uint64_t v8 = 0;
    }
    reportingClassSendMsgToServer();
  }
}

- (BOOL)isMicrophoneMuted
{
  return self->microphoneMuted;
}

- (void)setMicrophoneMuted:(BOOL)a3
{
  self->microphoneMuted = a3;
  -[VCAudioIO setMuted:](self->_audioIO, "setMuted:");

  [(VideoConference *)self notifyDelegateOfLocalVariablesChange];
}

- (double)localFramerateForCallID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(VideoConference *)self rdlock];
  int v5 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:v3];
  objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", v5), "sessionTransmittingFramerate");
  double v7 = v6;

  [(VideoConference *)self unlock];
  return v7;
}

- (double)localBitrateForCallID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(VideoConference *)self rdlock];
  int v5 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:v3];
  objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", v5), "sessionTransmittingBitrate");
  double v7 = v6;

  [(VideoConference *)self unlock];
  return v7;
}

- (double)remoteFramerateForCallID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(VideoConference *)self rdlock];
  int v5 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:v3];
  objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", v5), "sessionReceivingFramerate");
  double v7 = v6;

  [(VideoConference *)self unlock];
  return v7;
}

- (double)remoteBitrateForCallID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(VideoConference *)self rdlock];
  int v5 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:v3];
  objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", v5), "sessionReceivingBitrate");
  double v7 = v6;

  [(VideoConference *)self unlock];
  return v7;
}

- (double)remotePacketLossRateForCallID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(VideoConference *)self rdlock];
  objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v3)), "packetLateAndMissingRatio");
  double v6 = v5;
  [(VideoConference *)self unlock];
  return v6;
}

- (double)localPacketLossRateForCallID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(VideoConference *)self rdlock];
  objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v3)), "packetLossRate");
  double v6 = v5;
  [(VideoConference *)self unlock];
  return v6;
}

- (double)roundTripTimeForCallID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(VideoConference *)self rdlock];
  objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v3)), "roundTripTime");
  double v6 = v5;
  [(VideoConference *)self unlock];
  return v6;
}

- (CGSize)remoteFrameSizeForCallID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(VideoConference *)self rdlock];
  double v5 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v3]);
  double v6 = (double)[v5 remoteFrameWidth];
  double v7 = (double)[v5 remoteFrameHeight];
  [(VideoConference *)self unlock];
  double v8 = v6;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (id)statsForCallID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v33[17] = *MEMORY[0x1E4F143B8];
  [(VideoConference *)self rdlock];
  double v5 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v3]);
  [v5 roundTripTime];
  double v7 = v6;
  [v5 packetLossRate];
  double v9 = v8;
  [v5 packetLateAndMissingRatio];
  float v11 = v10;
  [v5 sessionReceivingBitrate];
  double v13 = v12;
  [v5 sessionReceivingFramerate];
  double v15 = v14;
  [v5 sessionTransmittingBitrate];
  double v17 = v16;
  [v5 sessionTransmittingFramerate];
  double v19 = v18;
  uint64_t v20 = [v5 remoteFrameWidth];
  uint64_t v21 = [v5 remoteFrameHeight];
  int v22 = [v5 primaryConnectionType];
  uint64_t v23 = [v5 audioTierNetworkBitrate];
  uint64_t v24 = [v5 audioTierAudioCodecBitrate];
  uint64_t v25 = [v5 audioTierRedNumPayloads];
  uint64_t v26 = [v5 audioTierPacketsPerBundle];
  uint64_t v27 = [v5 audioTierPayload];
  [(VideoConference *)self unlock];
  __int16 v28 = AVConferenceConnectionTypeP2P;
  long long v29 = AVConferenceConnectionTypeRelayP2PUpgrade;
  if (v22 != 6) {
    long long v29 = AVConferenceConnectionTypeRelay;
  }
  if (v22 != 1) {
    __int16 v28 = v29;
  }
  long long v31 = *v28;
  v32[0] = @"LocalFrameHeight";
  v33[0] = objc_msgSend(NSNumber, "numberWithInt:", -[VideoConference localFrameHeight](self, "localFrameHeight"));
  v32[1] = @"LocalFrameWidth";
  v33[1] = objc_msgSend(NSNumber, "numberWithInt:", -[VideoConference localFrameWidth](self, "localFrameWidth"));
  v32[2] = @"RemoteFrameHeight";
  v33[2] = [NSNumber numberWithUnsignedInt:v21];
  v32[3] = @"RemoteFrameWidth";
  v33[3] = [NSNumber numberWithUnsignedInt:v20];
  v32[4] = @"AudioTierNetworkBitrate";
  v33[4] = [NSNumber numberWithInt:v23];
  v32[5] = @"AudioTierAudioBitrate";
  v33[5] = [NSNumber numberWithInt:v24];
  v32[6] = @"AudioTierPacketsPerBundle";
  v33[6] = [NSNumber numberWithInt:v26];
  v32[7] = @"AudioTierRedNumPayloads";
  v33[7] = [NSNumber numberWithInt:v25];
  v32[8] = @"AudioTierPayload";
  v33[8] = [NSNumber numberWithInt:v27];
  v32[9] = @"RoundTripTime";
  v33[9] = [NSNumber numberWithDouble:v7];
  v32[10] = @"LocalPacketLossRate";
  v33[10] = [NSNumber numberWithDouble:v9];
  v32[11] = @"RemotePacketLossRate";
  v33[11] = [NSNumber numberWithDouble:v11];
  v32[12] = @"RemoteBitRate";
  v33[12] = [NSNumber numberWithDouble:v13];
  v32[13] = @"LocalBitRate";
  v33[13] = [NSNumber numberWithDouble:v17];
  v32[14] = @"RemoteFrameRate";
  v33[14] = [NSNumber numberWithDouble:v15];
  v32[15] = @"LocalFrameRate";
  v32[16] = @"AVConferenceConnectionType";
  v33[15] = [NSNumber numberWithDouble:v19];
  v33[16] = v31;
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:17];
}

- (void)forceNoICE:(BOOL)a3
{
  self->forceNoICE = a3;
}

- (void)setPacketsPerBundle:(int)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (self->packetsPerBundle != a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      double v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int packetsPerBundle = self->packetsPerBundle;
        *(_DWORD *)buf = 136316162;
        uint64_t v19 = v5;
        __int16 v20 = 2080;
        uint64_t v21 = "-[VideoConference setPacketsPerBundle:]";
        __int16 v22 = 1024;
        int v23 = 2005;
        __int16 v24 = 1024;
        int v25 = packetsPerBundle;
        __int16 v26 = 1024;
        int v27 = a3;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d VideoConference setPacketsPerBundle %d -> %d", buf, 0x28u);
      }
    }
    self->int packetsPerBundle = a3;
    [(VideoConference *)self rdlock];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    sessionArray = self->_sessionArray;
    uint64_t v9 = [(NSArray *)sessionArray countByEnumeratingWithState:&v14 objects:v13 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(sessionArray);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * i) setPacketsPerBundle:self->packetsPerBundle];
        }
        uint64_t v10 = [(NSArray *)sessionArray countByEnumeratingWithState:&v14 objects:v13 count:16];
      }
      while (v10);
    }
    [(VideoConference *)self unlock];
  }
}

- (void)setHasMic:(BOOL)a3
{
  BOOL v3 = a3;
  [(VideoConference *)self wrlock];
  self->hasMic = v3;
  if (v3)
  {
    if (self->isTalking && [(VideoConferenceManager *)self->manager conferenceWithMic] != self) {
      [(VideoConferenceSpeakingDelegate *)self->speakingDelegate didStartSpeaking:0];
    }
    [(VideoConference *)self unlock];
    manager = self->manager;
    double v6 = self;
LABEL_13:
    [(VideoConferenceManager *)manager setConferenceWithMic:v6];
    return;
  }
  if ([(VideoConferenceManager *)self->manager conferenceWithMic] == self)
  {
    if (self->isTalking) {
      [(VideoConferenceSpeakingDelegate *)self->speakingDelegate didStopSpeaking:0];
    }
    [(VideoConference *)self unlock];
    manager = self->manager;
    double v6 = 0;
    goto LABEL_13;
  }

  [(VideoConference *)self unlock];
}

- (BOOL)hasMic
{
  return self->hasMic;
}

- (void)setConferenceVolume:(float)a3
{
  float v3 = 1.0;
  if (a3 <= 1.0) {
    float v3 = a3;
  }
  BOOL v4 = a3 < 0.0;
  float v5 = 0.0;
  if (!v4) {
    float v5 = v3;
  }
  self->conferenceVolume = v5;
}

- (float)conferenceVolume
{
  return self->conferenceVolume;
}

- (void)setEnableSpeakerPhone:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[VCAudioManager sharedVoiceChatInstance];

  [v4 setSpeakerPhoneEnabled:v3];
}

- (BOOL)isSpeakerPhoneEnabled
{
  id v2 = +[VCAudioManager sharedVoiceChatInstance];

  return [v2 isSpeakerPhoneEnabled];
}

- (void)processRelayRequestResponse:(unsigned int)a3 responseDict:(id)a4 didOriginateRequest:(BOOL)a5
{
  uint64_t v7 = *(void *)&a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [(VideoConference *)self rdlock];
  uint64_t v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v7]);
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      double v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v17 = v11;
        __int16 v18 = 2080;
        uint64_t v19 = "-[VideoConference processRelayRequestResponse:responseDict:didOriginateRequest:]";
        __int16 v20 = 1024;
        int v21 = 2066;
        __int16 v22 = 2080;
        uint64_t v23 = objc_msgSend((id)objc_msgSend(v10, "description"), "UTF8String");
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d processRelayRequestResponse:session %s", buf, 0x26u);
      }
    }
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__VideoConference_processRelayRequestResponse_responseDict_didOriginateRequest___block_invoke;
    block[3] = &unk_1E6DB3E18;
    void block[4] = v10;
    block[5] = a4;
    BOOL v15 = a5;
    dispatch_async(global_queue, block);
  }
  [(VideoConference *)self unlock];
}

uint64_t __80__VideoConference_processRelayRequestResponse_responseDict_didOriginateRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) processRelayRequestResponseDict:*(void *)(a1 + 40) didOriginateRequest:*(unsigned __int8 *)(a1 + 48)];
}

- (void)processRelayUpdate:(unsigned int)a3 updateDict:(id)a4 didOriginateRequest:(BOOL)a5
{
  uint64_t v7 = *(void *)&a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [(VideoConference *)self rdlock];
  uint64_t v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v7]);
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      double v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v17 = v11;
        __int16 v18 = 2080;
        uint64_t v19 = "-[VideoConference processRelayUpdate:updateDict:didOriginateRequest:]";
        __int16 v20 = 1024;
        int v21 = 2087;
        __int16 v22 = 2080;
        uint64_t v23 = objc_msgSend((id)objc_msgSend(v10, "description"), "UTF8String");
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d processRelayUpdate:session %s", buf, 0x26u);
      }
    }
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__VideoConference_processRelayUpdate_updateDict_didOriginateRequest___block_invoke;
    block[3] = &unk_1E6DB3E18;
    void block[4] = v10;
    block[5] = a4;
    BOOL v15 = a5;
    dispatch_async(global_queue, block);
  }
  [(VideoConference *)self unlock];
}

uint64_t __69__VideoConference_processRelayUpdate_updateDict_didOriginateRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) processRelayUpdateDict:*(void *)(a1 + 40) didOriginateRequest:*(unsigned __int8 *)(a1 + 48)];
}

- (void)handleCellTechChange:(int)a3 cellularMaxPktLen:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(VideoConference *)self rdlock];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_sessionArray];
  [(VideoConference *)self unlock];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
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
        double v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        [v12 handleCellularMTUChanged:v4];
        [v12 handleCellTechChange:v5];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v13 count:16];
    }
    while (v9);
  }
}

- (void)setPeerProtocolVersion:(unsigned int)a3 forCallID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  [(VideoConference *)self rdlock];
  id v7 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v4]);
  [(VideoConference *)self unlock];

  [v7 setPeerProtocolVersion:v5];
}

- (unsigned)powerFloatToInt:(float)a3
{
  if (a3 >= 0.0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    if (a3 < -120.0) {
      a3 = -120.0;
    }
    return (int)(float)(a3 * 2.0 + 255.0);
  }
  return v4;
}

- (float)powerIntToFloat:(unsigned __int8)a3
{
  float result = ((double)a3 + -255.0) * 0.5;
  if (((a3 + 1) & 0xFE) == 0) {
    return NAN;
  }
  return result;
}

- (void)didSuspendAudioIO:(id)a3
{
  v6[5] = *MEMORY[0x1E4F143B8];
  [(VideoConference *)self rdlock];
  uint64_t v4 = [(NSMutableDictionary *)self->_sessionDict allValues];
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__VideoConference_didSuspendAudioIO___block_invoke;
  void v6[3] = &unk_1E6DB3DC8;
  v6[4] = v4;
  dispatch_async(global_queue, v6);
  [(VideoConference *)self unlock];
}

void __37__VideoConference_didSuspendAudioIO___block_invoke(uint64_t a1)
{
  v4[5] = *MEMORY[0x1E4F143B8];
  size_t v2 = [*(id *)(a1 + 32) count];
  global_queue = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__VideoConference_didSuspendAudioIO___block_invoke_2;
  v4[3] = &unk_1E6DB7660;
  v4[4] = *(void *)(a1 + 32);
  dispatch_apply(v2, global_queue, v4);
}

uint64_t __37__VideoConference_didSuspendAudioIO___block_invoke_2(uint64_t a1, uint64_t a2)
{
  size_t v2 = (void *)[*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  [v2 setSuspendAudio];

  return [v2 setSuspendVideo];
}

- (void)didResumeAudioIO:(id)a3
{
  v6[5] = *MEMORY[0x1E4F143B8];
  [(VideoConference *)self rdlock];
  uint64_t v4 = [(NSMutableDictionary *)self->_sessionDict allValues];
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__VideoConference_didResumeAudioIO___block_invoke;
  void v6[3] = &unk_1E6DB3DC8;
  v6[4] = v4;
  dispatch_async(global_queue, v6);
  [(VideoConference *)self unlock];
}

void __36__VideoConference_didResumeAudioIO___block_invoke(uint64_t a1)
{
  v4[5] = *MEMORY[0x1E4F143B8];
  size_t v2 = [*(id *)(a1 + 32) count];
  global_queue = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__VideoConference_didResumeAudioIO___block_invoke_2;
  v4[3] = &unk_1E6DB7660;
  v4[4] = *(void *)(a1 + 32);
  dispatch_apply(v2, global_queue, v4);
}

uint64_t __36__VideoConference_didResumeAudioIO___block_invoke_2(uint64_t a1, uint64_t a2)
{
  size_t v2 = (void *)[*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  [v2 setResumeAudio];

  return [v2 setResumeVideo];
}

- (void)serverDidDie
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", v3, 32000, 119, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VideoConference.m", 2180), @"Call failed", @"Media server terminated");
  [(VideoConference *)self stopAllCalls:v3[0]];
}

- (void)didUpdateBasebandCodec:(const _VCRemoteCodecInfo *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [NSString stringWithUTF8String:FourccToCStr(a3->codecType)];
  uint64_t v6 = [NSNumber numberWithDouble:a3->sampleRate];
  [(VideoConference *)self rdlock];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  sessionArray = self->_sessionArray;
  uint64_t v8 = [(NSArray *)sessionArray countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(sessionArray);
        }
        double v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        [v12 setBasebandCodecType:v5];
        [v12 setBasebandCodecSampleRate:v6];
        [v12 sendBasebandCodecMessage];
      }
      uint64_t v9 = [(NSArray *)sessionArray countByEnumeratingWithState:&v14 objects:v13 count:16];
    }
    while (v9);
  }
  [(VideoConference *)self unlock];
}

- (void)pushAudioSamples:(opaqueVCAudioBufferList *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  float AveragePower = VCAudioBufferList_GetAveragePower((uint64_t)a3);
  uint64_t VoiceActivity = VCAudioBufferList_GetVoiceActivity((uint64_t)a3);
  uint64_t Timestamp = VCAudioBufferList_GetTimestamp((uint64_t)a3);
  [(VCAudioPowerSpectrumSource *)self->_inputAudioPowerSpectrumSource pushAudioSamples:a3];
  if ([(VideoConference *)self tryrdlock])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int16 v22 = 136315906;
        *(void *)&v22[4] = v8;
        *(_WORD *)&v22[12] = 2080;
        *(void *)&v22[14] = "-[VideoConference pushAudioSamples:]";
        *(_WORD *)&v22[22] = 1024;
        LODWORD(v23[0]) = 2263;
        WORD2(v23[0]) = 1024;
        *(_DWORD *)((char *)v23 + 6) = Timestamp;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d IOProc:  Missing grabbing lock onCaptureSound at %u", v22, 0x22u);
      }
    }
  }
  else
  {
    if (BYTE4(self->recvRTPTimeStamp.epoch)) {
      self->isTalking = 1;
    }
    else {
      [(VideoConference *)self updateSpeaking:VoiceActivity timeStamp:Timestamp];
    }
    int chatMode = self->chatMode;
    if (chatMode == 2)
    {
      if (self->hasMic) {
        [(VideoConference *)self captureMeshMode:a3];
      }
    }
    else if (!chatMode)
    {
      if (self->isFocus) {
        [(VideoConference *)self captureAsFocus:a3];
      }
      else {
        [(VideoConference *)self captureAsFocusClient:a3];
      }
    }
    VCMediaRecorder_AddLocalAudioSampleBuffer((uint64_t)self->_vcMediaRecorder, (uint64_t)a3, self->dwAudioTS);
    if (self->inputMeteringEnabled && self->inputMeterLevel != AveragePower)
    {
      self->inputMeterLevel = AveragePower;
      uint64_t v11 = [(VideoConference *)self delegate];
      *(float *)&double v12 = self->inputMeterLevel;
      [(VideoConferenceDelegate *)v11 videoConference:self updateInputMeterLevel:v12];
    }
    if (self->inputFrequencyMeteringEnabled)
    {
      double v13 = VCFFTMeter_Compute((uint64_t)self->_inputFFTMeter, (uint64_t)a3);
      [(VideoConferenceDelegate *)[(VideoConference *)self delegate] videoConference:self updateInputFrequencyLevel:v13];
      if (v13) {
        CFRelease(v13);
      }
    }
    if (!BYTE1(self->downstreamBandwidth))
    {
      int timescale = self->recvRTPTimeStamp.timescale;
      if (timescale)
      {
        uint64_t v15 = *(void *)&self->recvRTPTimeStamp.flags;
        unsigned int value_high = HIDWORD(self->recvRTPTimeStamp.value);
        *(void *)__int16 v22 = *(void *)(&self->packetsPerBundle + 1);
        *(void *)&v22[8] = __PAIR64__(timescale, value_high);
        *(void *)&v22[16] = v15;
        v23[0] = VCAudioBufferList_GetHostTime((uint64_t)a3);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        sessionArray = self->_sessionArray;
        uint64_t v18 = -[NSArray countByEnumeratingWithState:objects:count:](sessionArray, "countByEnumeratingWithState:objects:count:", &v25, v24, 16, *(void *)v22, *(void *)&v22[8], *(void *)&v22[16], v23[0]);
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v26;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v26 != v20) {
                objc_enumerationMutation(sessionArray);
              }
              [*(id *)(*((void *)&v25 + 1) + 8 * i) updateSourcePlayoutTime:v22];
            }
            uint64_t v19 = [(NSArray *)sessionArray countByEnumeratingWithState:&v25 objects:v24 count:16];
          }
          while (v19);
        }
      }
    }
    [(VideoConference *)self unlock];
  }
  if (!BYTE1(self->downstreamBandwidth))
  {
    pthread_mutex_lock(&self->xAudioTS);
    self->dAudioHostTime = VCAudioBufferList_GetHostTime((uint64_t)a3);
    self->dwAudioTS = self->lastSentAudioSampleTime;
    pthread_mutex_unlock(&self->xAudioTS);
  }
}

- (void)pullAudioSamples:(opaqueVCAudioBufferList *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t Timestamp = VCAudioBufferList_GetTimestamp((uint64_t)a3);
  VCAudioBufferList_ZeroMemory((uint64_t)a3);
  if ([(VideoConference *)self tryrdlock])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      id v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136316162;
        uint64_t v15 = v6;
        __int16 v16 = 2080;
        long long v17 = "-[VideoConference pullAudioSamples:]";
        __int16 v18 = 1024;
        int v19 = 2323;
        __int16 v20 = 2048;
        int v21 = self;
        __int16 v22 = 1024;
        int v23 = Timestamp;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d VideoConference[%p] IOProc:  Missing grabbing lock onPlaySound at %u", (uint8_t *)&v14, 0x2Cu);
      }
    }
  }
  else
  {
    int chatMode = self->chatMode;
    if (chatMode == 2)
    {
      [(VideoConference *)self pullDecodedMeshMode:a3];
    }
    else if (!chatMode)
    {
      if (self->isFocus) {
        [(VideoConference *)self pullDecodedAsFocus:a3];
      }
      else {
        [(VideoConference *)self pullDecodedAsFocusClient:a3];
      }
    }
    float conferenceVolume = self->conferenceVolume;
    if (conferenceVolume < 1.0) {
      VCAudioBufferList_ApplyGain((uint64_t)a3, conferenceVolume);
    }
    [(VCAudioPowerSpectrumSource *)self->_outputAudioPowerSpectrumSource pushAudioSamples:a3];
    float AveragePower = VCAudioBufferList_GetAveragePower((uint64_t)a3);
    -[VCAudioPowerLevelMonitor detectRemoteAveragePowerLevel:timestamp:](self->_remoteAudioPowerLevelMonitor, "detectRemoteAveragePowerLevel:timestamp:", Timestamp);
    if (self->outputMeteringEnabled && self->outputMeterLevel != AveragePower)
    {
      self->outputMeterLevel = AveragePower;
      uint64_t v11 = [(VideoConference *)self delegate];
      *(float *)&double v12 = self->outputMeterLevel;
      [(VideoConferenceDelegate *)v11 videoConference:self updateOutputMeterLevel:v12];
    }
    if (self->outputFrequencyMeteringEnabled)
    {
      double v13 = VCFFTMeter_Compute((uint64_t)self->_outputFFTMeter, (uint64_t)a3);
      [(VideoConferenceDelegate *)[(VideoConference *)self delegate] videoConference:self updateOutputFrequencyLevel:v13];
      if (v13) {
        CFRelease(v13);
      }
    }
    VCMediaRecorder_AddRemoteAudioSampleBuffer((uint64_t)self->_vcMediaRecorder, (uint64_t)a3, self->dwAudioTS);
    [(VideoConference *)self unlock];
  }
}

- (int)chatMode
{
  return self->chatMode;
}

- (BOOL)isFocus
{
  return self->isFocus;
}

- (NSString)currentFocus
{
  return self->currentFocus;
}

- (int)packetsPerBundle
{
  return self->packetsPerBundle;
}

- (unsigned)preferredCodec
{
  return *(_DWORD *)&self->disableVAD;
}

- (void)setPreferredCodec:(unsigned int)a3
{
  *(_DWORD *)&self->disableVAD = a3;
}

- (int)upstreamBandwidth
{
  return self->preferredCodec;
}

- (void)setUpstreamBandwidth:(int)a3
{
  self->preferredCodec = a3;
}

- (int)downstreamBandwidth
{
  return self->upstreamBandwidth;
}

- (void)setDownstreamBandwidth:(int)a3
{
  self->upstreamBandwidth = a3;
}

- (VideoConferenceSpeakingDelegate)speakingDelegate
{
  return self->speakingDelegate;
}

- (void)setSpeakingDelegate:(id)a3
{
  self->speakingDelegate = (VideoConferenceSpeakingDelegate *)a3;
}

- (BOOL)useViceroyBlobFormat
{
  return self->useViceroyBlobFormat;
}

- (BOOL)isUsingSuppression
{
  return BYTE2(self->downstreamBandwidth);
}

- (BOOL)shouldTimeoutPackets
{
  return HIBYTE(self->downstreamBandwidth) & 1;
}

- (void)setShouldTimeoutPackets:(BOOL)a3
{
  HIBYTE(self->downstreamBandwidth) = a3;
}

- (BOOL)useCompressedConnectionData
{
  return self->isGKVoiceChat;
}

- (void)setUseCompressedConnectionData:(BOOL)a3
{
  self->isGKVoiceChat = a3;
}

- (BOOL)isGKVoiceChat
{
  return BYTE1(self->downstreamBandwidth);
}

- (BOOL)requiresWifi
{
  return BYTE5(self->recvRTPTimeStamp.epoch);
}

- (unsigned)talkingPeersLimit
{
  return self->talkingPeersLimit;
}

- (void)setTalkingPeersLimit:(unsigned int)a3
{
  self->talkingPeersLimit = a3;
}

- (BOOL)disableVAD
{
  return BYTE4(self->recvRTPTimeStamp.epoch) & 1;
}

- (void)setDisableVAD:(BOOL)a3
{
  BYTE4(self->recvRTPTimeStamp.epoch) = a3;
}

- (int)localFrameWidth
{
  return self->localFrameWidth;
}

- (int)localFrameHeight
{
  return self->localFrameHeight;
}

- (BOOL)shouldPrioritizeParticipantIDForSIPInvite
{
  return self->shouldPrioritizeParticipantIDForSIPInvite;
}

- (void)setShouldPrioritizeParticipantIDForSIPInvite:(BOOL)a3
{
  self->shouldPrioritizeParticipantIDForSIPInvite = a3;
}

- (VCVideoRule)conferenceCaptureRule
{
  return self->conferenceCaptureRule;
}

- (unsigned)lastActiveCall
{
  return self->lastActiveCall;
}

- (void)setLastActiveCall:(unsigned int)a3
{
  self->lastActiveCall = a3;
}

- (BOOL)isValid
{
  return self->isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->isValid = a3;
}

- (int)deviceRole
{
  return self->_deviceRole;
}

- (unsigned)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(unsigned int)a3
{
  self->_transportType = a3;
}

- (int64_t)inputAudioPowerSpectrumToken
{
  return self->_inputAudioPowerSpectrumToken;
}

- (int64_t)outputAudioPowerSpectrumToken
{
  return self->_outputAudioPowerSpectrumToken;
}

- (VCMediaRecorder)vcMediaRecorder
{
  return self->_vcMediaRecorder;
}

- (NSMutableDictionary)sessionDict
{
  return self->_sessionDict;
}

- (void)setSessionDict:(id)a3
{
}

- (BOOL)updateSpeaking:(unsigned int)a3 timeStamp:(unsigned int)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (!self->isTalking)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        id v7 = *MEMORY[0x1E4F47A50];
        uint64_t v8 = *MEMORY[0x1E4F47A50];
        if (*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            int v13 = 136315906;
            uint64_t v14 = v6;
            __int16 v15 = 2080;
            __int16 v16 = "-[VideoConference(AudioProcessing) updateSpeaking:timeStamp:]";
            __int16 v17 = 1024;
            int v18 = 2345;
            __int16 v19 = 1024;
            unsigned int v20 = a4;
            _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d START TALKING at %u", (uint8_t *)&v13, 0x22u);
          }
        }
        else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          -[VideoConference(AudioProcessing) updateSpeaking:timeStamp:]();
        }
      }
      self->isTalking = 1;
      if (self->hasMic) {
        [(VideoConferenceSpeakingDelegate *)self->speakingDelegate didStartSpeaking:0];
      }
    }
    BOOL result = 0;
    self->talkTime = a4;
  }
  else if (self->isTalking)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 136315906;
          uint64_t v14 = v9;
          __int16 v15 = 2080;
          __int16 v16 = "-[VideoConference(AudioProcessing) updateSpeaking:timeStamp:]";
          __int16 v17 = 1024;
          int v18 = 2353;
          __int16 v19 = 1024;
          unsigned int v20 = a4;
          _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d STOP TALKING at %u", (uint8_t *)&v13, 0x22u);
        }
      }
      else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        -[VideoConference(AudioProcessing) updateSpeaking:timeStamp:]();
      }
    }
    self->isTalking = 0;
    if (self->hasMic) {
      [(VideoConferenceSpeakingDelegate *)self->speakingDelegate didStopSpeaking:0];
    }
    return 1;
  }
  else
  {
    return 0;
  }
  return result;
}

- (unsigned)pruneQuietestPeers:(unsigned int)a3 talking:(unsigned int)a4 mask:(unsigned int)a5 meters:(char *)a6
{
  for (unsigned int i = self->talkingPeersLimit; a4 > i; --a4)
  {
    if (a3)
    {
      uint64_t v7 = 0;
      char v8 = 0;
      unsigned __int8 v9 = -1;
      do
      {
        if (((a5 >> v7) & 1) != 0 && a6[v7] < v9)
        {
          unsigned __int8 v9 = a6[v7];
          char v8 = v7;
        }
        ++v7;
      }
      while (a3 != v7);
    }
    else
    {
      char v8 = 0;
    }
    a5 &= ~(1 << v8);
  }
  return a5;
}

- (unsigned)calculateTalkingMaskAtTimeStamp:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  BOOL v5 = self->isTalking && self->hasMic;
  sourceBuffer = self->_sourceBuffer;
  unsigned int SampleCapacity = VCAudioBufferList_GetSampleCapacity((uint64_t)sourceBuffer);
  VCAudioBufferList_SetSampleCount((uint64_t)sourceBuffer, SampleCapacity);
  uint64_t v33 = 200;
  uint64_t SampleCount = VCAudioBufferList_GetSampleCount((uint64_t)self->_sourceBuffer);
  int v9 = [(NSArray *)self->_sessionArray count];
  size_t v10 = (v9 + 1);
  uint64_t v11 = (v10 + 15) & 0x1FFFFFFF0;
  double v12 = (unsigned __int8 *)&v27 - v11;
  if (v9 != -1) {
    memset((char *)&v27 - v11, 170, v10);
  }
  size_t v27 = v10;
  bzero(v12, v10);
  *(float *)&double v13 = self->inputMeterLevel;
  unsigned __int8 v14 = [(VideoConference *)self powerFloatToInt:v13];
  long long v28 = v12;
  unsigned __int8 *v12 = v14;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  sessionArray = self->_sessionArray;
  uint64_t v16 = [(NSArray *)sessionArray countByEnumeratingWithState:&v35 objects:v34 count:16];
  unsigned int v32 = v5;
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v36;
    int v19 = 1;
    unsigned int v31 = v5;
    do
    {
      uint64_t v20 = 0;
      uint64_t v30 = v19;
      uint64_t v29 = &v28[v19];
      do
      {
        if (*(void *)v36 != v18) {
          objc_enumerationMutation(sessionArray);
        }
        uint64_t v21 = *(void **)(*((void *)&v35 + 1) + 8 * v20);
        if ([v21 state] == 1
          && [v21 isAudioRunning]
          && [v21 shouldSendAudio])
        {
          int v22 = objc_msgSend((id)objc_msgSend(v21, "ringBuf"), "needsNewNumSamples:timestamp:", SampleCount, v3);
          if (v22)
          {
            int v23 = SampleCount - v22;
            if ((int)((SampleCount - v22) | v22) < 0) {
              int v23 = 0;
            }
            uint64_t v24 = v33;
            VCAudioBufferList_SetTime(*(uint64_t *)((char *)&self->super.super.isa + v33), v23 + v3, 0.0);
            [(VideoConference *)self recvSamplesForSession:v21 sampleBuffer:*(Class *)((char *)&self->super.super.isa + v24)];
          }
          if ([v21 lastReceived] >= v3)
          {
            NSUInteger v25 = -[NSArray indexOfObject:](self->connectedPeers, "indexOfObject:", [v21 remoteParticipantID]);
            if (v25 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v29[v20] = self->speakingArray[v25];
              v32 |= 1 << (v19 + v20);
              ++v31;
            }
          }
        }
        ++v20;
      }
      while (v17 != v20);
      uint64_t v17 = [(NSArray *)sessionArray countByEnumeratingWithState:&v35 objects:v34 count:16];
      int v19 = v30 + v20;
    }
    while (v17);
  }
  else
  {
    unsigned int v31 = v5;
  }
  return [(VideoConference *)self pruneQuietestPeers:v27 talking:v31 mask:v32 meters:v28];
}

- (void)calculateMixingArrays:(unsigned int *)a3 talkingMask:(unsigned int)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  sessionArray = self->_sessionArray;
  uint64_t v6 = [(NSArray *)sessionArray countByEnumeratingWithState:&v35 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    LODWORD(v8) = 0;
    uint64_t v9 = *(void *)v36;
    uint64_t v22 = *(void *)v36;
    int v23 = sessionArray;
    uint64_t v21 = a3;
    do
    {
      uint64_t v10 = 0;
      uint64_t v8 = (int)v8;
      uint64_t v25 = v7;
      do
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(sessionArray);
        }
        uint64_t v11 = *(void **)(*((void *)&v35 + 1) + 8 * v10);
        if ([v11 state] == 1 && objc_msgSend(v11, "isAudioRunning"))
        {
          unsigned int v12 = a4 & ~(1 << (v8 + 1));
          int v13 = objc_msgSend((id)objc_msgSend(v11, "mutedPeers"), "count");
          uint64_t v27 = v8;
          if (v13)
          {
            if (!objc_msgSend((id)objc_msgSend(v11, "mutedPeers"), "containsObject:", objc_msgSend(v11, "localParticipantID"))|| (v12 &= ~1u, --v13, v13))
            {
              long long v32 = 0u;
              long long v33 = 0u;
              long long v30 = 0u;
              long long v31 = 0u;
              obj = self->_sessionArray;
              uint64_t v14 = [(NSArray *)obj countByEnumeratingWithState:&v30 objects:v29 count:16];
              if (v14)
              {
                uint64_t v15 = v14;
                uint64_t v16 = *(void *)v31;
                int v17 = 1;
                while (2)
                {
                  uint64_t v18 = 0;
                  char v19 = v17;
                  int v26 = v17 + v15;
                  do
                  {
                    if (*(void *)v31 != v16) {
                      objc_enumerationMutation(obj);
                    }
                    if (objc_msgSend((id)objc_msgSend(v11, "mutedPeers"), "containsObject:", objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * v18), "remoteParticipantID")))
                    {
                      v12 &= ~(1 << (v19 + v18));
                      if (!--v13)
                      {
                        a3 = v21;
                        goto LABEL_23;
                      }
                    }
                    ++v18;
                  }
                  while (v15 != v18);
                  uint64_t v15 = [(NSArray *)obj countByEnumeratingWithState:&v30 objects:v29 count:16];
                  a3 = v21;
                  int v17 = v26;
                  if (v15) {
                    continue;
                  }
                  break;
                }
              }
            }
          }
LABEL_23:
          ++v8;
          a3[v27] = v12;
          uint64_t v9 = v22;
          sessionArray = v23;
          uint64_t v7 = v25;
        }
        else
        {
          a3[v8++] = 0;
        }
        ++v10;
      }
      while (v10 != v7);
      uint64_t v7 = [(NSArray *)sessionArray countByEnumeratingWithState:&v35 objects:v34 count:16];
    }
    while (v7);
  }
}

- (void)captureAsFocus:(opaqueVCAudioBufferList *)a3
{
  uint64_t v3 = a3;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  uint64_t Timestamp = VCAudioBufferList_GetTimestamp((uint64_t)a3);
  unsigned int SampleCount = VCAudioBufferList_GetSampleCount((uint64_t)v3);
  uint64_t v6 = 216;
  VCAudioBufferList_Reset((uint64_t)self->_sinkBufferMix);
  sinkBufferMix = self->_sinkBufferMix;
  unsigned int v8 = VCAudioBufferList_GetSampleCount((uint64_t)v3);
  VCAudioBufferList_SetSampleCount((uint64_t)sinkBufferMix, v8);
  unsigned int v44 = Timestamp;
  uint64_t v9 = [(VideoConference *)self calculateTalkingMaskAtTimeStamp:Timestamp];
  uint64_t v48 = 440;
  NSUInteger v39 = [(NSArray *)self->_sessionArray count];
  size_t v10 = 4 * v39;
  uint64_t v11 = (char *)&v36 - ((v10 + 15) & 0x7FFFFFFF0);
  if (v39) {
    memset((char *)&v36 - ((v10 + 15) & 0x7FFFFFFF0), 170, v10);
  }
  else {
    size_t v10 = 0;
  }
  bzero(v11, v10);
  [(VideoConference *)self calculateMixingArrays:v11 talkingMask:v9];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v45 = *(Class *)((char *)&self->super.super.isa + v48);
  uint64_t v12 = [v45 countByEnumeratingWithState:&v52 objects:v51 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    LODWORD(v14) = 0;
    uint64_t v47 = (v39 + 1);
    uint64_t v46 = (int)v39;
    uint64_t v36 = (int)v39 - 1;
    uint64_t v49 = *(void *)v53;
    long long v38 = v3;
    uint64_t v41 = 216;
    long long v37 = v11;
    do
    {
      uint64_t v15 = 0;
      uint64_t v14 = (int)v14;
      uint64_t v40 = (int)v14;
      uint64_t v42 = v13;
      do
      {
        if (*(void *)v53 != v49) {
          objc_enumerationMutation(v45);
        }
        uint64_t v50 = v14 + 1;
        uint64_t v16 = *(void **)(*((void *)&v52 + 1) + 8 * v15);
        if (objc_msgSend(v16, "state", v36) == 1)
        {
          if ([v16 isAudioRunning])
          {
            if ([v16 shouldSendAudio])
            {
              unsigned int v17 = *(_DWORD *)&v11[4 * v14];
              if (v17 != -1)
              {
                if (v17)
                {
                  VCAudioBufferList_Reset(*(uint64_t *)((char *)&self->super.super.isa + v6));
                  uint64_t v19 = *(uint64_t *)((char *)&self->super.super.isa + v6);
                  double HostTime = VCAudioBufferList_GetHostTime((uint64_t)v3);
                  int v21 = VCAudioBufferList_GetTimestamp((uint64_t)v3);
                  VCAudioBufferList_SetTime(v19, v21, HostTime);
                  uint64_t v22 = *(uint64_t *)((char *)&self->super.super.isa + v6);
                  unsigned int v23 = VCAudioBufferList_GetSampleCount((uint64_t)v3);
                  VCAudioBufferList_SetSampleCount(v22, v23);
                  VCAudioBufferList_ZeroMemory(*(uint64_t *)((char *)&self->super.super.isa + v6));
                  if (v17) {
                    VCAudioBufferList_Mix(*(uint64_t *)((char *)&self->super.super.isa + v6), (uint64_t)v3);
                  }
                  if ((int)v39 >= 1)
                  {
                    uint64_t v24 = 1;
                    do
                    {
                      if ((v17 >> v24))
                      {
                        uint64_t v25 = (void *)[*(id *)((char *)&self->super.super.isa + v48) objectAtIndexedSubscript:v24 - 1];
                        sinkBuffer = self->_sinkBuffer;
                        uint64_t v27 = self;
                        uint64_t v28 = SampleCount;
                        VCAudioBufferList_SetSampleCount((uint64_t)sinkBuffer, SampleCount);
                        uint64_t AudioBufferList = VCAudioBufferList_GetAudioBufferList((uint64_t)v27->_sinkBuffer);
                        long long v30 = (void *)[v25 ringBuf];
                        uint64_t v31 = v28;
                        self = v27;
                        if ([v30 fetch:*(void *)(AudioBufferList + 16) numSamples:v31 timestamp:v44])VCAudioBufferList_Mix(*(uint64_t *)((char *)&v27->super.super.isa + v41), (uint64_t)v27->_sinkBuffer); {
                      }
                        }
                      ++v24;
                    }
                    while (v47 != v24);
                  }
                  if (self->isTalking)
                  {
                    uint64_t v6 = v41;
                    uint64_t v11 = v37;
                    if (self->hasMic)
                    {
                      *(float *)&double v32 = VCAudioBufferList_GetAveragePower(*(uint64_t *)((char *)&self->super.super.isa
                                                                                    + v41));
                      int v33 = [(VideoConference *)self powerFloatToInt:v32];
                    }
                    else
                    {
                      int v33 = 0;
                    }
                    uint64_t v3 = v38;
                  }
                  else
                  {
                    int v33 = 0;
                    uint64_t v3 = v38;
                    uint64_t v6 = v41;
                    uint64_t v11 = v37;
                  }
                  objc_msgSend(v16, "setInputMeter:", ((int)(v33 + objc_msgSend(v16, "bundledPackets") * objc_msgSend(v16, "inputMeter"))/ (int)(objc_msgSend(v16, "bundledPackets") + 1)));
                  [v16 pushAudioSamples:*(Class *)((char *)&self->super.super.isa + v6)];
                  uint64_t v13 = v42;
                  if (v14 < v36)
                  {
                    uint64_t v34 = (int)v50;
                    do
                    {
                      if (*(_DWORD *)&v11[4 * v34] == v17)
                      {
                        long long v35 = (void *)[*(id *)((char *)&self->super.super.isa + v48) objectAtIndexedSubscript:v34];
                        if ([v35 shouldSendAudio])
                        {
                          objc_msgSend(v35, "setInputMeter:", ((int)(v33+ objc_msgSend(v35, "bundledPackets")* objc_msgSend(v35, "inputMeter"))/ (int)(objc_msgSend(v35, "bundledPackets") + 1)));
                          [v35 pushAudioSamples:*(Class *)((char *)&self->super.super.isa + v6)];
                        }
                        *(_DWORD *)&v11[4 * v34] = -1;
                        uint64_t v13 = v42;
                      }
                      ++v34;
                    }
                    while (v34 < v46);
                  }
                }
                else
                {
                  unsigned int v18 = VCAudioBufferList_GetSampleCount((uint64_t)v3);
                  VCAudioBufferList_SetSampleCount((uint64_t)v3, 0);
                  [v16 pushAudioSamples:v3];
                  VCAudioBufferList_SetSampleCount((uint64_t)v3, v18);
                  uint64_t v13 = v42;
                }
              }
            }
          }
        }
        ++v15;
        uint64_t v14 = v50;
      }
      while (v15 != v13);
      LODWORD(v14) = v40 + v13;
      uint64_t v13 = [v45 countByEnumeratingWithState:&v52 objects:v51 count:16];
    }
    while (v13);
  }
}

- (void)captureAsFocusClient:(opaqueVCAudioBufferList *)a3
{
  unsigned int SampleCount = VCAudioBufferList_GetSampleCount((uint64_t)a3);
  if ([(VCCallSession *)self->currentFocusSession shouldSendAudio]
    && [(VCCallSession *)self->currentFocusSession state] == 1
    && [(VCCallSession *)self->currentFocusSession isAudioRunning])
  {
    if (self->hasMic && self->isTalking)
    {
      *(float *)&double v6 = VCAudioBufferList_GetAveragePower((uint64_t)a3);
      [(VCCallSession *)self->currentFocusSession setInputMeter:(([(VideoConference *)self powerFloatToInt:v6]+ [(VCCallSession *)self->currentFocusSession bundledPackets]* [(VCCallSession *)self->currentFocusSession inputMeter])/ ([(VCCallSession *)self->currentFocusSession bundledPackets] + 1))];
    }
    else
    {
      VCAudioBufferList_SetSampleCount((uint64_t)a3, 0);
    }
    [(VCCallSession *)self->currentFocusSession pushAudioSamples:a3];
  }

  VCAudioBufferList_SetSampleCount((uint64_t)a3, SampleCount);
}

- (void)updateAudioTimestampsForSession:(id)a3 withNewSampleTime:(unsigned int)a4 hostTime:(double)a5 numSamples:(int)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  signed int v11 = a4 - self->lastSentAudioSampleTime;
  unsigned int v12 = llround((a5 - self->dAudioHostTime) * (float)([a3 sampleRate] / a6)) * a6;
  if (self->lastSentAudioSampleTime)
  {
    if (v11 != a6 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      uint64_t v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        unsigned int lastSentAudioSampleTime = self->lastSentAudioSampleTime;
        double v24 = a5 - self->dAudioHostTime;
        int v25 = 136317186;
        uint64_t v26 = v13;
        __int16 v27 = 2080;
        uint64_t v28 = "-[VideoConference(AudioProcessing) updateAudioTimestampsForSession:withNewSampleTime:hostTime:numSamples:]";
        __int16 v29 = 1024;
        int v30 = 2568;
        __int16 v31 = 1024;
        unsigned int v32 = v11;
        __int16 v33 = 1024;
        unsigned int v34 = lastSentAudioSampleTime;
        __int16 v35 = 1024;
        unsigned int v36 = a4;
        __int16 v37 = 2048;
        double v38 = a5;
        __int16 v39 = 2048;
        double v40 = v24;
        __int16 v41 = 1024;
        unsigned int v42 = v12;
        _os_log_error_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_ERROR, "VideoConference [%s] %s:%d Timestamp jumped by %d, %d to %d at %f. host time jump %f (%d)", (uint8_t *)&v25, 0x48u);
      }
    }
  }
  if (self->dAudioHostTime != 0.0)
  {
    int v15 = 5 * a6;
    int v16 = v11 - v12;
    if ((int)(v11 - v12) < 0) {
      int v16 = v12 - v11;
    }
    if (v11 >= 0) {
      int v17 = v11;
    }
    else {
      int v17 = -v11;
    }
    if (v15 < v16 || v15 < v17)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v19 = VRTraceErrorLogLevelToCSTR();
        uint64_t v20 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v21 = self->lastSentAudioSampleTime;
          double v22 = a5 - self->dAudioHostTime;
          int v25 = 136316930;
          uint64_t v26 = v19;
          __int16 v27 = 2080;
          uint64_t v28 = "-[VideoConference(AudioProcessing) updateAudioTimestampsForSession:withNewSampleTime:hostTime:numSamples:]";
          __int16 v29 = 1024;
          int v30 = 2574;
          __int16 v31 = 1024;
          unsigned int v32 = v12;
          __int16 v33 = 1024;
          unsigned int v34 = v21;
          __int16 v35 = 1024;
          unsigned int v36 = a4;
          __int16 v37 = 2048;
          double v38 = v22;
          __int16 v39 = 1024;
          LODWORD(v40) = v12;
          _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d Detected large timestamp jump by %d, from %d to %d. host time jump %f (%d)", (uint8_t *)&v25, 0x3Eu);
        }
      }
      VCAudioReceiver_DiscardQueueExcess([a3 audioReceiver]);
    }
  }
  self->unsigned int lastSentAudioSampleTime = a4;
}

- (void)captureMeshMode:(opaqueVCAudioBufferList *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  double HostTime = VCAudioBufferList_GetHostTime((uint64_t)a3);
  unsigned int Timestamp = VCAudioBufferList_GetTimestamp((uint64_t)a3);
  unsigned int SampleCount = VCAudioBufferList_GetSampleCount((uint64_t)a3);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  sessionArray = self->_sessionArray;
  uint64_t v7 = [(NSArray *)sessionArray countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(sessionArray);
        }
        signed int v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v11 state] == 1)
        {
          if ([v11 isAudioRunning])
          {
            if ([v11 isCurrentPayloadTypeValid] && !BYTE1(self->downstreamBandwidth)) {
              [(VideoConference *)self updateAudioTimestampsForSession:v11 withNewSampleTime:Timestamp hostTime:SampleCount numSamples:HostTime];
            }
            if (self->isTalking || !BYTE1(self->downstreamBandwidth)) {
              [v11 pushAudioSamples:a3];
            }
          }
          if ([v11 isRemoteMediaStalled] && (self->timeStampUpdateCounter & 1) == 0
            || ([v11 isRemoteMediaStalled] & 1) == 0
            && -1030792151 * self->timeStampUpdateCounter <= 0xA3D70A3)
          {
            [v11 updateLastReceivedAudioTime];
          }
          ++self->timeStampUpdateCounter;
        }
      }
      uint64_t v8 = [(NSArray *)sessionArray countByEnumeratingWithState:&v15 objects:v14 count:16];
    }
    while (v8);
  }
}

- (void)updateMeter:(unsigned __int8)a3 forParticipant:(id)a4 atIndex:(unsigned int)a5
{
  speakingArray = self->speakingArray;
  uint64_t v7 = a5;
  if (!a3 || self->speakingArray[a5])
  {
    if (!a3 && self->speakingArray[a5]) {
      [(VideoConferenceSpeakingDelegate *)self->speakingDelegate didStopSpeaking:a4];
    }
  }
  else
  {
    [(VideoConferenceSpeakingDelegate *)self->speakingDelegate didStartSpeaking:a4];
  }
  speakingArray[v7] = a3;
}

- (void)updateMeters:(unsigned __int16)a3
{
  char v3 = a3;
  NSUInteger v5 = [(NSArray *)self->connectedPeers count];
  if (v5)
  {
    NSUInteger v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      [(VideoConference *)self updateMeter:((1 << i) & v3) forParticipant:[(NSArray *)self->connectedPeers objectAtIndexedSubscript:i] atIndex:i];
  }
}

- (BOOL)recvSamplesForSession:(id)a3 sampleBuffer:(opaqueVCAudioBufferList *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  memset(v18, 170, sizeof(v18));
  double v15 = 0.0;
  long long v16 = &v18[1];
  int64x2_t v17 = vdupq_n_s64(0x10uLL);
  uint64_t SampleCount = VCAudioBufferList_GetSampleCount((uint64_t)a4);
  uint64_t Timestamp = VCAudioBufferList_GetTimestamp((uint64_t)a4);
  if ([a3 state] != 1 || !objc_msgSend(a3, "isAudioRunning")) {
    goto LABEL_8;
  }
  if (!VCAudioReceiver_PullAudioSamples([a3 audioReceiver], (uint64_t)a4, 0, &v15, (uint64_t)&v16, v18, 0))goto LABEL_7; {
  [a3 updateLastReceivedPacketWithTimestamp:5 packetType:v15];
  }
  if (v17.i64[1])
  {
    objc_msgSend((id)objc_msgSend(a3, "ringBuf"), "store:numSamples:timestamp:", *(void *)(VCAudioBufferList_GetAudioBufferList((uint64_t)a4) + 16), SampleCount, Timestamp);
    if (!v18[0] || LOBYTE(v18[1]))
    {
      objc_msgSend(a3, "setLastReceived:", (Timestamp + SampleCount), *(void *)&v15, v16, v17.i64[0]);
      if (LOBYTE(v18[1]))
      {
        NSUInteger v13 = -[NSArray indexOfObject:](self->connectedPeers, "indexOfObject:", [a3 remoteParticipantID]);
        if (v13 != 0x7FFFFFFFFFFFFFFFLL)
        {
          NSUInteger v11 = v13;
          BOOL v10 = 1;
          uint64_t v12 = LOBYTE(v18[1]);
          goto LABEL_11;
        }
      }
      return 1;
    }
LABEL_7:
    if (Timestamp > objc_msgSend(a3, "lastReceived", *(void *)&v15, v16, v17.i64[0]))
    {
LABEL_8:
      NSUInteger v9 = -[NSArray indexOfObject:](self->connectedPeers, "indexOfObject:", objc_msgSend(a3, "remoteParticipantID", *(void *)&v15));
      if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
        return 0;
      }
      NSUInteger v11 = v9;
      uint64_t v12 = 0;
      BOOL v10 = 0;
LABEL_11:
      -[VideoConference updateMeter:forParticipant:atIndex:](self, "updateMeter:forParticipant:atIndex:", v12, [a3 remoteParticipantID], v11);
      return v10;
    }
    return 1;
  }
  return 0;
}

- (int)pullDecodedAsFocus:(opaqueVCAudioBufferList *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t Timestamp = VCAudioBufferList_GetTimestamp((uint64_t)a3);
  double HostTime = VCAudioBufferList_GetHostTime((uint64_t)a3);
  unsigned int v21 = a3;
  uint64_t SampleCount = VCAudioBufferList_GetSampleCount((uint64_t)a3);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  sessionArray = self->_sessionArray;
  uint64_t v9 = [(NSArray *)sessionArray countByEnumeratingWithState:&v26 objects:v25 count:16];
  if (!v9) {
    return 0;
  }
  uint64_t v10 = v9;
  int v23 = 0;
  unsigned int v24 = SampleCount;
  uint64_t v11 = *(void *)v27;
  uint64_t v12 = &OBJC_IVAR___VCCallSession_peerCN;
  double v22 = sessionArray;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v27 != v11) {
        objc_enumerationMutation(sessionArray);
      }
      uint64_t v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
      if ((objc_msgSend(*(id *)((char *)&self->super.super.isa + v12[162]), "containsObject:", objc_msgSend(v14, "remoteParticipantID")) & 1) == 0&& objc_msgSend(v14, "isAudioRunning")&& objc_msgSend(v14, "shouldSendAudio"))
      {
        int v15 = objc_msgSend((id)objc_msgSend(v14, "ringBuf"), "needsNewNumSamples:timestamp:", SampleCount, Timestamp);
        int v16 = v15;
        if (v15)
        {
          if ((int)SampleCount - v15 > (int)SampleCount || (int)SampleCount - v15 < 0) {
            int v18 = 0;
          }
          else {
            int v18 = SampleCount - v15;
          }
          VCAudioBufferList_SetTime((uint64_t)self->_sourceBuffer, v18 + Timestamp, HostTime);
          BOOL v19 = [(VideoConference *)self recvSamplesForSession:v14 sampleBuffer:self->_sourceBuffer];
        }
        else
        {
          int v18 = 0;
          BOOL v19 = 1;
        }
        if (Timestamp <= [v14 lastReceived] && v19)
        {
          if (!v16 || v18) {
            objc_msgSend((id)objc_msgSend(v14, "ringBuf"), "fetch:numSamples:timestamp:", *(void *)(VCAudioBufferList_GetAudioBufferList((uint64_t)self->_sourceBuffer) + 16), v24, Timestamp);
          }
          VCAudioBufferList_Mix((uint64_t)v21, (uint64_t)self->_sourceBuffer);
          ++v23;
        }
        uint64_t SampleCount = v24;
        sessionArray = v22;
        uint64_t v12 = &OBJC_IVAR___VCCallSession_peerCN;
      }
    }
    uint64_t v10 = [(NSArray *)sessionArray countByEnumeratingWithState:&v26 objects:v25 count:16];
  }
  while (v10);
  return v23;
}

- (int)pullDecodedAsFocusClient:(opaqueVCAudioBufferList *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  memset(v11, 170, sizeof(v11));
  double v8 = 0.0;
  uint64_t v9 = &v11[1];
  int64x2_t v10 = vdupq_n_s64(0x10uLL);
  if ([(VCCallSession *)self->currentFocusSession state] != 1
    || ![(VCCallSession *)self->currentFocusSession isAudioRunning]
    || ![(VCCallSession *)self->currentFocusSession shouldSendAudio])
  {
    return 0;
  }
  if (VCAudioReceiver_PullAudioSamples((uint64_t)[(VCCallSession *)self->currentFocusSession audioReceiver], (uint64_t)a3, 0, &v8, (uint64_t)&v9, v11, 0)&& ([(VCCallSession *)self->currentFocusSession updateLastReceivedPacketWithTimestamp:5 packetType:v8], !v11[0]))
  {
    int v6 = 1;
    if (v10.i64[1] < 2uLL) {
      return v6;
    }
    uint64_t v5 = LOWORD(v11[1]);
  }
  else
  {
    uint64_t v5 = 0;
    int v6 = 0;
  }
  [(VideoConference *)self updateMeters:v5];
  return v6;
}

- (int)pullDecodedMeshMode:(opaqueVCAudioBufferList *)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  sourceBuffer = self->_sourceBuffer;
  unsigned int SampleCount = VCAudioBufferList_GetSampleCount((uint64_t)a3);
  VCAudioBufferList_SetSampleCount((uint64_t)sourceBuffer, SampleCount);
  int v29 = -1431655766;
  uint64_t v7 = self->_sourceBuffer;
  double HostTime = VCAudioBufferList_GetHostTime((uint64_t)a3);
  int Timestamp = VCAudioBufferList_GetTimestamp((uint64_t)a3);
  VCAudioBufferList_SetTime((uint64_t)v7, Timestamp, HostTime);
  int v28 = -1431655766;
  long long v26 = self;
  uint64_t v27 = 0;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  sessionArray = self->_sessionArray;
  uint64_t v11 = [(NSArray *)sessionArray countByEnumeratingWithState:&v35 objects:v34 count:16];
  if (!v11) {
    return 0;
  }
  uint64_t v13 = v11;
  int v14 = 0;
  uint64_t v15 = *(void *)v36;
  *(void *)&long long v12 = 136315906;
  long long v25 = v12;
  int v16 = a3;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v36 != v15) {
        objc_enumerationMutation(sessionArray);
      }
      int v18 = *(void **)(*((void *)&v35 + 1) + 8 * i);
      if (objc_msgSend(v18, "state", v25) == 1 && objc_msgSend(v18, "isAudioRunning"))
      {
        double v19 = micro();
        int v20 = [v18 pullAudioSamples:v16 rtpTimestamp:&v29 lastReceivedAudioTime:&v27 padding:0 paddingLength:0 silence:&v28];
        double v21 = micro() - v19;
        if (v21 > 0.005 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v22 = VRTraceErrorLogLevelToCSTR();
          int v23 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v25;
            *(void *)&uint8_t buf[4] = v22;
            *(_WORD *)&unsigned char buf[12] = 2080;
            *(void *)&buf[14] = "-[VideoConference(AudioProcessing) pullDecodedMeshMode:]";
            *(_WORD *)&buf[22] = 1024;
            int v31 = 2765;
            __int16 v32 = 2048;
            double v33 = v21;
            _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d pullAudioSamples() took a long time = %f", buf, 0x26u);
          }
        }
        if (v20)
        {
          VCAudioBufferList_GetNetworkTimestamp((uint64_t)a3, (uint64_t)buf);
          *(_OWORD *)(&v26->packetsPerBundle + 1) = *(_OWORD *)buf;
          *(void *)&v26->recvRTPTimeStamp.flags = *(void *)&buf[16];
          if (!v28) {
            ++v14;
          }
          if (v16 != a3) {
            VCAudioBufferList_Mix((uint64_t)a3, (uint64_t)v16);
          }
          int v16 = v26->_sourceBuffer;
        }
      }
    }
    uint64_t v13 = [(NSArray *)sessionArray countByEnumeratingWithState:&v35 objects:v34 count:16];
  }
  while (v13);
  return v14;
}

- (int)sipCallbackNotification:(int)a3 callID:(unsigned int)a4 msgIn:(const char *)a5 msgOut:(char *)a6 optional:(void *)a7 confIndex:(int *)a8
{
  uint64_t v12 = *(void *)&a4;
  uint64_t v13 = *(void *)&a3;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v15 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    int64x2_t v17 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v31 = v16;
      __int16 v32 = 2080;
      double v33 = "-[VideoConference(SIPDispatch) sipCallbackNotification:callID:msgIn:msgOut:optional:confIndex:]";
      __int16 v34 = 1024;
      int v35 = 2794;
      __int16 v36 = 1024;
      LODWORD(v37) = v13;
      _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d sipCallbackNotification:%d", buf, 0x22u);
    }
  }
  [(VideoConference *)self rdlock];
  if (v13 == 13)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() > 6)
    {
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      double v19 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL shouldPrioritizeParticipantIDForSIPInvite = self->shouldPrioritizeParticipantIDForSIPInvite;
        *(_DWORD *)buf = 136315906;
        uint64_t v31 = v18;
        __int16 v32 = 2080;
        double v33 = "-[VideoConference(SIPDispatch) sipCallbackNotification:callID:msgIn:msgOut:optional:confIndex:]";
        __int16 v34 = 1024;
        int v35 = 2803;
        __int16 v36 = 1024;
        LODWORD(v37) = shouldPrioritizeParticipantIDForSIPInvite;
        _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d shouldPrioritizeParticipantIDForSIPInvite %d", buf, 0x22u);
      }
    }
    if (self->shouldPrioritizeParticipantIDForSIPInvite)
    {
      id v25 = -[VideoConference sessionForIncomingParticipantID:](self, "sessionForIncomingParticipantID:", objc_msgSend(NSString, "stringWithFormat:", @"%s", a5));
      if (v25) {
        goto LABEL_19;
      }
      id v25 = [(VideoConference *)self sessionForSourceDestinationInfo:a6];
      if (v25) {
        goto LABEL_19;
      }
    }
    else
    {
      id v25 = [(VideoConference *)self sessionForSourceDestinationInfo:a6];
      if (v25) {
        goto LABEL_19;
      }
      id v25 = -[VideoConference sessionForIncomingParticipantID:](self, "sessionForIncomingParticipantID:", objc_msgSend(NSString, "stringWithFormat:", @"%s", a5));
      if (v25) {
        goto LABEL_19;
      }
    }
    id v25 = [(VideoConference *)self loopbackSessionWaitingForSIPInvite];
    if (!v25)
    {
      int v26 = 3;
      goto LABEL_20;
    }
LABEL_19:
    int v26 = 0;
    *(_DWORD *)a7 = [v25 callID];
LABEL_20:
    [(VideoConference *)self unlock];
    [v15 drain];
    return v26;
  }
  int v29 = a7;
  double v21 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v12]);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v22 = VRTraceErrorLogLevelToCSTR();
    int v23 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (v21) {
        unsigned int v24 = (const char *)objc_msgSend((id)objc_msgSend(v21, "description"), "UTF8String");
      }
      else {
        unsigned int v24 = "<nil>";
      }
      *(_DWORD *)buf = 136315906;
      uint64_t v31 = v22;
      __int16 v32 = 2080;
      double v33 = "-[VideoConference(SIPDispatch) sipCallbackNotification:callID:msgIn:msgOut:optional:confIndex:]";
      __int16 v34 = 1024;
      int v35 = 2838;
      __int16 v36 = 2080;
      long long v37 = v24;
      _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d sipCallbackNotification:session = %s", buf, 0x26u);
    }
  }
  id v27 = v21;
  [(VideoConference *)self unlock];
  if (v21)
  {
    int v26 = [v21 sipCallback:v13 callID:v12 msgIn:a5 msgOut:a6 optional:v29 confIndex:a8];
  }
  else
  {

    return 3;
  }
  return v26;
}

- (BOOL)matchesCallID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(VideoConference *)self rdlock];
  LOBYTE(v3) = -[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v3]) != 0;
  [(VideoConference *)self unlock];
  return v3;
}

- (BOOL)matchesOpenSessionForParticipantID:(id)a3
{
  [(VideoConference *)self rdlock];
  id v5 = [(VideoConference *)self openSessionForParticipant:a3];
  [(VideoConference *)self unlock];
  return v5 != 0;
}

- (unsigned)callIDForOpenSessionWithParticipantID:(id)a3
{
  [(VideoConference *)self rdlock];
  id v5 = [(VideoConference *)self openSessionForParticipant:a3];
  id v6 = v5;
  [(VideoConference *)self unlock];
  if (v5) {
    unsigned int v7 = [v5 callID];
  }
  else {
    unsigned int v7 = -1;
  }

  return v7;
}

- (id)openSessionForParticipant:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  sessionDict = self->_sessionDict;
  uint64_t v6 = [(NSMutableDictionary *)sessionDict countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v14;
LABEL_3:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v14 != v8) {
      objc_enumerationMutation(sessionDict);
    }
    int64x2_t v10 = (void *)[(NSMutableDictionary *)self->_sessionDict objectForKeyedSubscript:*(void *)(*((void *)&v13 + 1) + 8 * v9)];
    if ([v10 remoteParticipantID])
    {
      if (objc_msgSend((id)objc_msgSend(v10, "remoteParticipantID"), "isEqualToString:", a3)
        && [v10 state] != 7)
      {
        return v10;
      }
    }
    if (v7 == ++v9)
    {
      uint64_t v7 = [(NSMutableDictionary *)sessionDict countByEnumeratingWithState:&v13 objects:v12 count:16];
      if (v7) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (BOOL)matchesParticipantID:(id)a3
{
  [(VideoConference *)self rdlock];
  id v5 = [(VideoConference *)self sessionForParticipantID:a3];
  [(VideoConference *)self unlock];
  return v5 != 0;
}

- (id)sessionForParticipantID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  sessionArray = self->_sessionArray;
  uint64_t v5 = [(NSArray *)sessionArray countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v13;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v13 != v7) {
      objc_enumerationMutation(sessionArray);
    }
    uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
    if ([v9 remoteParticipantID])
    {
      if (objc_msgSend((id)objc_msgSend(v9, "remoteParticipantID"), "isEqualToString:", a3)) {
        return v9;
      }
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSArray *)sessionArray countByEnumeratingWithState:&v12 objects:v11 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (BOOL)conferenceMatchesSourceDestinationInfo:(tagVCSourceDestinationInfo *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  [(VideoConference *)self rdlock];
  unint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v24[10] = v5;
  v24[11] = v5;
  v24[8] = v5;
  v24[9] = v5;
  v24[6] = v5;
  v24[7] = v5;
  v24[4] = v5;
  v24[5] = v5;
  v24[2] = v5;
  v24[3] = v5;
  v24[0] = v5;
  v24[1] = v5;
  id v6 = [(VideoConference *)self sessionForSourceDestinationInfo:a3];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (self)
      {
        uint64_t v9 = (const char *)objc_msgSend((id)-[VideoConference description](self, "description"), "UTF8String");
        if (v6)
        {
LABEL_5:
          int64x2_t v10 = (const char *)objc_msgSend((id)objc_msgSend(v6, "description"), "UTF8String");
LABEL_8:
          int v12 = 136316418;
          uint64_t v13 = v7;
          __int16 v14 = 2080;
          long long v15 = "-[VideoConference(SessionInfo) conferenceMatchesSourceDestinationInfo:]";
          __int16 v16 = 1024;
          int v17 = 2941;
          __int16 v18 = 2080;
          double v19 = v9;
          __int16 v20 = 2080;
          double v21 = v10;
          __int16 v22 = 2080;
          int v23 = VCSDInfoToStringRepresentation((uint64_t)a3, (char *)v24);
          _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d %s matches session %s for %s", (uint8_t *)&v12, 0x3Au);
          goto LABEL_9;
        }
      }
      else
      {
        uint64_t v9 = "<nil>";
        if (v6) {
          goto LABEL_5;
        }
      }
      int64x2_t v10 = "<nil>";
      goto LABEL_8;
    }
  }
LABEL_9:
  [(VideoConference *)self unlock];
  return v6 != 0;
}

- (id)sessionForSourceDestinationInfo:(tagVCSourceDestinationInfo *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  sessionDict = self->_sessionDict;
  uint64_t v6 = [(NSMutableDictionary *)sessionDict countByEnumeratingWithState:&v29 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(sessionDict);
        }
        uint64_t v11 = (void *)[(NSMutableDictionary *)self->_sessionDict objectForKeyedSubscript:*(void *)(*((void *)&v29 + 1) + 8 * i)];
        if ([v11 isBetterForSIPInviteWithSourceDestinationInfo:a3 thanSession:v8]) {
          uint64_t v8 = v11;
        }
      }
      uint64_t v7 = [(NSMutableDictionary *)sessionDict countByEnumeratingWithState:&v29 objects:v28 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    uint64_t v13 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (v8) {
        __int16 v14 = (const char *)objc_msgSend((id)objc_msgSend(v8, "description"), "UTF8String");
      }
      else {
        __int16 v14 = "<nil>";
      }
      long long v15 = self->_sessionDict;
      if (v15) {
        __int16 v16 = (const char *)objc_msgSend((id)-[NSMutableDictionary description](v15, "description"), "UTF8String");
      }
      else {
        __int16 v16 = "<nil>";
      }
      int v18 = 136316162;
      uint64_t v19 = v12;
      __int16 v20 = 2080;
      double v21 = "-[VideoConference(SessionInfo) sessionForSourceDestinationInfo:]";
      __int16 v22 = 1024;
      int v23 = 2960;
      __int16 v24 = 2080;
      unint64_t v25 = v14;
      __int16 v26 = 2080;
      id v27 = v16;
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d returns %s out of %s", (uint8_t *)&v18, 0x30u);
    }
  }
  return v8;
}

- (BOOL)hasSessionWaitingForSIPInvite
{
  [(VideoConference *)self rdlock];
  id v3 = [(VideoConference *)self loopbackSessionWaitingForSIPInvite];
  [(VideoConference *)self unlock];
  return v3 != 0;
}

- (id)loopbackSessionWaitingForSIPInvite
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  sessionDict = self->_sessionDict;
  uint64_t v4 = [(NSMutableDictionary *)sessionDict countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)v12;
LABEL_3:
  uint64_t v7 = 0;
  while (1)
  {
    if (*(void *)v12 != v6) {
      objc_enumerationMutation(sessionDict);
    }
    uint64_t v8 = (void *)[(NSMutableDictionary *)self->_sessionDict objectForKeyedSubscript:*(void *)(*((void *)&v11 + 1) + 8 * v7)];
    if ([v8 state] == 6
      && [v8 remoteParticipantID]
      && ![v8 receivedSIPInvite])
    {
      return v8;
    }
    if (v5 == ++v7)
    {
      uint64_t v5 = [(NSMutableDictionary *)sessionDict countByEnumeratingWithState:&v11 objects:v10 count:16];
      if (v5) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)sessionForIncomingParticipantID:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  sessionDict = self->_sessionDict;
  uint64_t v6 = [(NSMutableDictionary *)sessionDict countByEnumeratingWithState:&v24 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(sessionDict);
        }
        int64x2_t v10 = (void *)[(NSMutableDictionary *)self->_sessionDict objectForKeyedSubscript:*(void *)(*((void *)&v24 + 1) + 8 * i)];
        if ([v10 sipState] == 6
          && [v10 remoteParticipantID]
          && objc_msgSend((id)objc_msgSend(v10, "remoteParticipantID"), "isEqualToString:", a3))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v11 = VRTraceErrorLogLevelToCSTR();
            long long v12 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              if (v10) {
                long long v13 = (const char *)objc_msgSend((id)objc_msgSend(v10, "description"), "UTF8String");
              }
              else {
                long long v13 = "<nil>";
              }
              int v15 = 136315906;
              uint64_t v16 = v11;
              __int16 v17 = 2080;
              int v18 = "-[VideoConference(SessionInfo) sessionForIncomingParticipantID:]";
              __int16 v19 = 1024;
              int v20 = 3002;
              __int16 v21 = 2080;
              __int16 v22 = v13;
              _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d sessionForIncomingParticipantID returned: %s", (uint8_t *)&v15, 0x26u);
            }
          }
          return v10;
        }
      }
      uint64_t v7 = [(NSMutableDictionary *)sessionDict countByEnumeratingWithState:&v24 objects:v23 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  return 0;
}

- (int)stateForCallID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(VideoConference *)self rdlock];
  uint64_t v5 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v3]);
  if (v5) {
    int v6 = [v5 state];
  }
  else {
    int v6 = 8;
  }
  [(VideoConference *)self unlock];
  return v6;
}

- (void)wrlock
{
}

- (int)tryrdlock
{
  return pthread_rwlock_tryrdlock(&self->stateLock);
}

- (void)rdlock
{
}

- (void)unlock
{
}

- (void)stopCallID:(unsigned int)a3 didRemoteCancel:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  uint64_t v7 = *(void *)&a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  [(VideoConference *)self rdlock];
  int64x2_t v10 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:v7];
  uint64_t v11 = (void *)[(NSMutableDictionary *)self->_sessionDict objectForKeyedSubscript:v10];
  id v12 = v11;

  [(VideoConference *)self unlock];
  if ([v11 isCallOngoing]) {
    [(VCObject *)self startTimeoutTimer];
  }
  [v11 disconnect:a5 didRemoteCancel:v6];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    long long v14 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (v11) {
        int v15 = (const char *)objc_msgSend((id)objc_msgSend(v11, "description"), "UTF8String");
      }
      else {
        int v15 = "<nil>";
      }
      int v16 = 136316418;
      uint64_t v17 = v13;
      __int16 v18 = 2080;
      __int16 v19 = "-[VideoConference(PrivateMethods) stopCallID:didRemoteCancel:error:]";
      __int16 v20 = 1024;
      int v21 = 3063;
      __int16 v22 = 1024;
      int v23 = v7;
      __int16 v24 = 1024;
      BOOL v25 = v6;
      __int16 v26 = 2080;
      long long v27 = v15;
      _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d stopCallID: %d, didRemoteCancel = %d, session = %s", (uint8_t *)&v16, 0x32u);
    }
  }

  if (!v7) {
    [(VideoConference *)self markUnfinishedSessions];
  }
  [(id)VCRemoteVideoManager_DefaultManager() releaseQueueForStreamToken:v7];
}

- (void)cancelCallID:(unsigned int)a3 error:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  [(VideoConference *)self rdlock];
  uint64_t v8 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:v5];
  id v9 = (void *)[(NSMutableDictionary *)self->_sessionDict objectForKeyedSubscript:v8];
  id v10 = v9;

  [(VideoConference *)self unlock];
  [v9 cancel:a4];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    id v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (v9) {
        uint64_t v13 = (const char *)objc_msgSend((id)objc_msgSend(v9, "description"), "UTF8String");
      }
      else {
        uint64_t v13 = "<nil>";
      }
      int v14 = 136316162;
      uint64_t v15 = v11;
      __int16 v16 = 2080;
      uint64_t v17 = "-[VideoConference(PrivateMethods) cancelCallID:error:]";
      __int16 v18 = 1024;
      int v19 = 3093;
      __int16 v20 = 1024;
      int v21 = v5;
      __int16 v22 = 2080;
      int v23 = v13;
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d cancelCallID: %d, session = %s", (uint8_t *)&v14, 0x2Cu);
    }
  }

  if (!v5) {
    [(VideoConference *)self markUnfinishedSessions];
  }
  [(id)VCRemoteVideoManager_DefaultManager() releaseQueueForStreamToken:v5];
}

- (void)cleanupSession:(id)a3 withDelay:(unint64_t)a4
{
  v7[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1E4F29060];
  v6[0] = @"session";
  v6[1] = @"date";
  v7[0] = a3;
  v7[1] = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:(double)a4];
  objc_msgSend(v5, "detachNewThreadSelector:toTarget:withObject:", sel_cleanupProc_, self, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v7, v6, 2));
}

- (void)cleanupProc:(id)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  objc_msgSend(MEMORY[0x1E4F29060], "sleepUntilDate:", objc_msgSend(a3, "objectForKeyedSubscript:", @"date"));
  -[VideoConference threadSafeCleanupSession:](self, "threadSafeCleanupSession:", [a3 objectForKeyedSubscript:@"session"]);
}

- (void)defaultCleanupSession:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    BOOL v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315650;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      id v10 = "-[VideoConference(PrivateMethods) defaultCleanupSession:]";
      __int16 v11 = 1024;
      int v12 = 3125;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d defaultCleanupSession!", (uint8_t *)&v7, 0x1Cu);
    }
  }
  [(VideoConference *)self cleanupSession:a3 withDelay:0];
}

- (void)threadSafeCleanupSession:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  BOOL v6 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315650;
      uint64_t v12 = v7;
      __int16 v13 = 2080;
      int v14 = "-[VideoConference(PrivateMethods) threadSafeCleanupSession:]";
      __int16 v15 = 1024;
      int v16 = 3130;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d threadSafeCleanupSession!", (uint8_t *)&v11, 0x1Cu);
    }
  }
  [(VideoConference *)self wrlock];
  [(VideoConference *)self cleanupSession:a3 didRemoteCancel:0];
  [(VideoConference *)self unlock];
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    id v10 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315650;
      uint64_t v12 = v9;
      __int16 v13 = 2080;
      int v14 = "-[VideoConference(PrivateMethods) threadSafeCleanupSession:]";
      __int16 v15 = 1024;
      int v16 = 3135;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d threadSafeCleanupSession end!", (uint8_t *)&v11, 0x1Cu);
    }
  }
}

- (void)cleanupSession:(id)a3 didRemoteCancel:(BOOL)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (a3) {
        uint64_t v8 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      }
      else {
        uint64_t v8 = "<nil>";
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v12 = v6;
      __int16 v13 = 2080;
      int v14 = "-[VideoConference(PrivateMethods) cleanupSession:didRemoteCancel:]";
      __int16 v15 = 1024;
      int v16 = 3140;
      __int16 v17 = 2080;
      __int16 v18 = v8;
      __int16 v19 = 1024;
      BOOL v20 = [a3 state] == 1;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d cleanupSession: session = %s, session.state == GKVoiceChatServiceStateRunning = %d", buf, 0x2Cu);
    }
  }
  if (a3)
  {
    if ([a3 isEqual:self->currentFocusSession])
    {
      self->currentFocusSession = 0;

      self->currentFocus = 0;
    }
    if (-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "callID"))))
    {
      delegateNotificationQueue = self->delegateNotificationQueue;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __66__VideoConference_PrivateMethods__cleanupSession_didRemoteCancel___block_invoke;
      v10[3] = &unk_1E6DB3E40;
      v10[4] = self;
      v10[5] = a3;
      dispatch_async(delegateNotificationQueue, v10);
      -[VideoConference cleanupSpatialAudioForCallID:](self, "cleanupSpatialAudioForCallID:", [a3 callID]);
      objc_msgSend(+[VCCaptionsManager defaultManager](VCCaptionsManager, "defaultManager"), "unregisterCaptionsSourceWithStreamToken:", objc_msgSend(a3, "callID"));
      [(VideoConference *)self cleanUpMediaRecorder];
      -[NSMutableDictionary removeObjectForKey:](self->_sessionDict, "removeObjectForKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "callID")));

      self->_sessionArray = (NSArray *)(id)[(NSMutableDictionary *)self->_sessionDict allValues];
    }
  }
}

uint64_t __66__VideoConference_PrivateMethods__cleanupSession_didRemoteCancel___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = [*(id *)(a1 + 40) callID];
    return [v3 videoConference:v4 closeConnectionForCallID:v5];
  }
  return result;
}

- (BOOL)setPauseAudio:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [(VideoConference *)self rdlock];
  uint64_t v5 = [(NSMutableDictionary *)self->_sessionDict allValues];
  global_queue = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__VideoConference_PrivateMethods__setPauseAudio___block_invoke;
  v8[3] = &unk_1E6DB3E18;
  v8[4] = v5;
  v8[5] = self;
  BOOL v9 = a3;
  dispatch_async(global_queue, v8);
  [(VideoConference *)self unlock];
  return 1;
}

void __49__VideoConference_PrivateMethods__setPauseAudio___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  size_t v2 = [*(id *)(a1 + 32) count];
  global_queue = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__VideoConference_PrivateMethods__setPauseAudio___block_invoke_2;
  v4[3] = &unk_1E6DB7688;
  long long v5 = *(_OWORD *)(a1 + 32);
  char v6 = *(unsigned char *)(a1 + 48);
  dispatch_apply(v2, global_queue, v4);
}

void __49__VideoConference_PrivateMethods__setPauseAudio___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  long long v5 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule >= 6)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void **)(a1 + 40);
      if (v8)
      {
        BOOL v9 = (const char *)objc_msgSend((id)objc_msgSend(v8, "description"), "UTF8String");
        if (v3)
        {
LABEL_5:
          uint64_t v10 = (const char *)objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String");
LABEL_8:
          *(_DWORD *)buf = 136316162;
          uint64_t v18 = v6;
          __int16 v19 = 2080;
          BOOL v20 = "-[VideoConference(PrivateMethods) setPauseAudio:]_block_invoke_2";
          __int16 v21 = 1024;
          int v22 = 3175;
          __int16 v23 = 2080;
          uint64_t v24 = v9;
          __int16 v25 = 2080;
          __int16 v26 = v10;
          _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d InterruptMe:%s Begin Pausing audio session %s", buf, 0x30u);
          goto LABEL_9;
        }
      }
      else
      {
        BOOL v9 = "<nil>";
        if (v3) {
          goto LABEL_5;
        }
      }
      uint64_t v10 = "<nil>";
      goto LABEL_8;
    }
  }
LABEL_9:
  uint64_t v16 = 0;
  [v3 setPauseAudio:*(unsigned __int8 *)(a1 + 48) error:&v16];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    uint64_t v12 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = *(void **)(a1 + 40);
      if (v13)
      {
        int v14 = (const char *)objc_msgSend((id)objc_msgSend(v13, "description"), "UTF8String");
        if (v3)
        {
LABEL_13:
          __int16 v15 = (const char *)objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String");
LABEL_16:
          *(_DWORD *)buf = 136316162;
          uint64_t v18 = v11;
          __int16 v19 = 2080;
          BOOL v20 = "-[VideoConference(PrivateMethods) setPauseAudio:]_block_invoke";
          __int16 v21 = 1024;
          int v22 = 3179;
          __int16 v23 = 2080;
          uint64_t v24 = v14;
          __int16 v25 = 2080;
          __int16 v26 = v15;
          _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d InterruptMe:%s End Pausing audio session  done%s", buf, 0x30u);
          return;
        }
      }
      else
      {
        int v14 = "<nil>";
        if (v3) {
          goto LABEL_13;
        }
      }
      __int16 v15 = "<nil>";
      goto LABEL_16;
    }
  }
}

- (BOOL)setPauseVideo:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [(VideoConference *)self rdlock];
  uint64_t v5 = [(NSMutableDictionary *)self->_sessionDict allValues];
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__VideoConference_PrivateMethods__setPauseVideo___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  void block[4] = v5;
  BOOL v9 = a3;
  dispatch_async(global_queue, block);
  [(VideoConference *)self unlock];
  return 1;
}

void __49__VideoConference_PrivateMethods__setPauseVideo___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  size_t v2 = [*(id *)(a1 + 32) count];
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__VideoConference_PrivateMethods__setPauseVideo___block_invoke_2;
  block[3] = &unk_1E6DB5FD0;
  void block[4] = *(void *)(a1 + 32);
  char v5 = *(unsigned char *)(a1 + 40);
  dispatch_apply(v2, global_queue, block);
}

uint64_t __49__VideoConference_PrivateMethods__setPauseVideo___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  v5[0] = 0;
  return [v3 setPauseVideo:*(unsigned __int8 *)(a1 + 40) error:v5];
}

- (void)markUnfinishedSessions
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(VideoConference *)self rdlock];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_sessionArray];
  [(VideoConference *)self unlock];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
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
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) timeoutUnfinishedConnection];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v8 count:16];
    }
    while (v5);
  }
}

- (void)session:(id)a3 withCallID:(unsigned int)a4 networkHint:(BOOL)a5
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  delegateNotificationQueue = self->delegateNotificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__VideoConference_SessionDelegate__session_withCallID_networkHint___block_invoke;
  block[3] = &unk_1E6DB76B0;
  void block[4] = self;
  unsigned int v7 = a4;
  BOOL v8 = a5;
  dispatch_async(delegateNotificationQueue, block);
}

uint64_t __67__VideoConference_SessionDelegate__session_withCallID_networkHint___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(unsigned int *)(a1 + 40);
    uint64_t v6 = *(unsigned __int8 *)(a1 + 44);
    return [v3 videoConference:v4 withCallID:v5 networkHint:v6];
  }
  return result;
}

- (void)session:(id)a3 withCallID:(unsigned int)a4 videoIsDegraded:(BOOL)a5 isRemote:(BOOL)a6
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  delegateNotificationQueue = self->delegateNotificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__VideoConference_SessionDelegate__session_withCallID_videoIsDegraded_isRemote___block_invoke;
  block[3] = &unk_1E6DB76D8;
  void block[4] = self;
  unsigned int v8 = a4;
  BOOL v9 = a5;
  BOOL v10 = a6;
  dispatch_async(delegateNotificationQueue, block);
}

uint64_t __80__VideoConference_SessionDelegate__session_withCallID_videoIsDegraded_isRemote___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result) {
    uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "videoConference:videoQualityNotificationForCallID:isDegraded:isRemote:", *(void *)(a1 + 32), *(unsigned int *)(a1 + 40), *(unsigned __int8 *)(a1 + 44), *(unsigned __int8 *)(a1 + 45));
  }
  if (*(unsigned char *)(a1 + 45))
  {
    uint64_t v3 = (void *)VCRemoteVideoManager_DefaultManager();
    uint64_t v4 = *(unsigned __int8 *)(a1 + 44);
    uint64_t v5 = *(unsigned int *)(a1 + 40);
    return [v3 remoteVideoDidDegrade:v4 streamToken:v5];
  }
  return result;
}

- (void)session:(id)a3 localIPChange:(id)a4 withCallID:(unsigned int)a5
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  delegateNotificationQueue = self->delegateNotificationQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __69__VideoConference_SessionDelegate__session_localIPChange_withCallID___block_invoke;
  void v6[3] = &unk_1E6DB3EE0;
  v6[4] = self;
  v6[5] = a4;
  unsigned int v7 = a5;
  dispatch_async(delegateNotificationQueue, v6);
}

uint64_t __69__VideoConference_SessionDelegate__session_localIPChange_withCallID___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(unsigned int *)(a1 + 48);
    return [v3 videoConference:v4 localIPChange:v5 withCallID:v6];
  }
  return result;
}

- (void)session:(id)a3 connectionDidChangeWithLocalInterfaceType:(id)a4 remoteInterfaceType:(id)a5 callID:(unsigned int)a6
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  delegateNotificationQueue = self->delegateNotificationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __113__VideoConference_SessionDelegate__session_connectionDidChangeWithLocalInterfaceType_remoteInterfaceType_callID___block_invoke;
  void v7[3] = &unk_1E6DB3EE0;
  void v7[4] = a4;
  v7[5] = a5;
  unsigned int v8 = a6;
  dispatch_async(delegateNotificationQueue, v7);
}

uint64_t __113__VideoConference_SessionDelegate__session_connectionDidChangeWithLocalInterfaceType_remoteInterfaceType_callID___block_invoke(uint64_t a1)
{
  size_t v2 = (void *)VCRemoteVideoManager_DefaultManager();
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(unsigned int *)(a1 + 48);

  return [v2 connectionDidChangeWithLocalInterfaceType:v3 remoteInterfaceType:v4 streamToken:v5];
}

- (void)session:(id)a3 didStart:(BOOL)a4 connectionType:(unsigned int)a5 localInterfaceType:(id)a6 remoteInterfaceType:(id)a7 error:(id)a8
{
  uint64_t v11 = *(void *)&a5;
  BOOL v12 = a4;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  if (!a4 || ([a3 isCallOngoing] & 1) != 0)
  {
    [(VideoConference *)self rdlock];
    uint64_t v15 = [a3 callID];
    uint64_t v16 = &OBJC_IVAR___VCCallSession_peerCN;
    id v34 = a8;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7
      || (uint64_t v31 = VRTraceErrorLogLevelToCSTR(),
          log = *MEMORY[0x1E4F47A50],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)))
    {
LABEL_22:
      id v33 = a7;
      if (objc_msgSend(*(id *)((char *)&self->super.super.isa + v16[141]), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "callID"))))
      {
        if (v12)
        {
          self->uint64_t mostRecentStartedCall = v15;
        }
        else
        {
          [(VCObject *)self stopTimeoutTimer];
          [(VideoConference *)self defaultCleanupSession:a3];
        }
      }
      [(VideoConference *)self unlock];
      int v18 = v15;
      __int16 v19 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:v15];
      BOOL v20 = (void *)[objc_alloc(NSNumber) initWithBool:v12];
      __int16 v21 = (void *)[objc_alloc(NSNumber) initWithInt:v11];
      int v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", v19, @"callID", v20, @"didStart", v21, @"connType", 0);
      MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VideoConference-didStart");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v23 = VRTraceErrorLogLevelToCSTR();
        uint64_t v24 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v25 = [(VideoConference *)self conferenceOperatingMode];
          *(_DWORD *)buf = 136316162;
          uint64_t v39 = v23;
          __int16 v40 = 2080;
          __int16 v41 = "-[VideoConference(SessionDelegate) session:didStart:connectionType:localInterfaceType:remoteInterfaceType:error:]";
          __int16 v42 = 1024;
          int v43 = 3328;
          __int16 v44 = 2048;
          id v45 = self;
          __int16 v46 = 1024;
          int v47 = v25;
          _os_log_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d @:@ VideoConference-didStart (%p) operatingMode=%d", buf, 0x2Cu);
        }
      }
      delegateNotificationQueue = self->delegateNotificationQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __113__VideoConference_SessionDelegate__session_didStart_connectionType_localInterfaceType_remoteInterfaceType_error___block_invoke;
      block[3] = &unk_1E6DB7700;
      BOOL v37 = v12;
      int v36 = v18;
      void block[4] = self;
      void block[5] = v22;
      void block[6] = v34;
      void block[7] = a6;
      block[8] = v33;
      dispatch_async(delegateNotificationQueue, block);

      return;
    }
    if (a3)
    {
      long long v30 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      if (a6) {
        goto LABEL_7;
      }
    }
    else
    {
      long long v30 = "<nil>";
      if (a6)
      {
LABEL_7:
        long long v29 = (const char *)objc_msgSend((id)objc_msgSend(a6, "description"), "UTF8String");
        if (a7)
        {
LABEL_8:
          uint64_t v28 = (const char *)objc_msgSend((id)objc_msgSend(a7, "description"), "UTF8String");
LABEL_15:
          if (a8) {
            uint64_t v27 = (const char *)objc_msgSend((id)objc_msgSend(a8, "description"), "UTF8String");
          }
          else {
            uint64_t v27 = "<nil>";
          }
          if (-[NSMutableDictionary objectForKey:](self->_sessionDict, "objectForKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "callID"))))
          {
            __int16 v17 = (const char *)objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_sessionDict, "objectForKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "callID"))), "description"), "UTF8String");
          }
          else
          {
            __int16 v17 = "<nil>";
          }
          *(_DWORD *)buf = 136317442;
          uint64_t v39 = v31;
          __int16 v40 = 2080;
          __int16 v41 = "-[VideoConference(SessionDelegate) session:didStart:connectionType:localInterfaceType:remoteInterfaceType:error:]";
          __int16 v42 = 1024;
          int v43 = 3302;
          __int16 v44 = 2080;
          id v45 = (VideoConference *)v30;
          __int16 v46 = 1024;
          int v47 = v12;
          __int16 v48 = 1024;
          int v49 = v11;
          __int16 v50 = 2080;
          v51 = v29;
          __int16 v52 = 2080;
          long long v53 = v28;
          __int16 v54 = 2080;
          long long v55 = v27;
          __int16 v56 = 2080;
          v57 = v17;
          _os_log_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d didStart:session %s, didStart = %d, connType = %u, InterfaceType = %s, %s, error = %s, claimed Session = %s", buf, 0x5Au);
          uint64_t v16 = &OBJC_IVAR___VCCallSession_peerCN;
          goto LABEL_22;
        }
LABEL_14:
        uint64_t v28 = "<nil>";
        goto LABEL_15;
      }
    }
    long long v29 = "<nil>";
    if (a7) {
      goto LABEL_8;
    }
    goto LABEL_14;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VideoConference(SessionDelegate) session:didStart:connectionType:localInterfaceType:remoteInterfaceType:error:]();
    }
  }
}

uint64_t __113__VideoConference_SessionDelegate__session_didStart_connectionType_localInterfaceType_remoteInterfaceType_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  char v2 = objc_opt_respondsToSelector();
  uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
  if (v2)
  {
    [v3 videoConference:*(void *)(a1 + 32) didStartSession:*(unsigned __int8 *)(a1 + 76) withCallID:*(unsigned int *)(a1 + 72) withUserInfo:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
  }
  else if (objc_opt_respondsToSelector())
  {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "videoConference:didStartSession:withCallID:error:", *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 76), *(unsigned int *)(a1 + 72), *(void *)(a1 + 48));
  }
  uint64_t v4 = (void *)VCRemoteVideoManager_DefaultManager();
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = *(unsigned int *)(a1 + 72);

  return [v4 connectionDidChangeWithLocalInterfaceType:v5 remoteInterfaceType:v6 streamToken:v7];
}

- (void)session:(id)a3 cleanUpWithDelay:(int64_t)a4 error:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    BOOL v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = [a3 callID];
      if (a5) {
        BOOL v12 = (const char *)objc_msgSend((id)objc_msgSend(a5, "description"), "UTF8String");
      }
      else {
        BOOL v12 = "<nil>";
      }
      int v14 = 136316418;
      uint64_t v15 = v9;
      __int16 v16 = 2080;
      __int16 v17 = "-[VideoConference(SessionDelegate) session:cleanUpWithDelay:error:]";
      __int16 v18 = 1024;
      int v19 = 3353;
      __int16 v20 = 1024;
      int v21 = v11;
      __int16 v22 = 2048;
      int64_t v23 = a4;
      __int16 v24 = 2080;
      int v25 = v12;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d VideoConference: clean up session (call ID %d) with delay %ld, error %s", (uint8_t *)&v14, 0x36u);
    }
  }
  [(VideoConference *)self rdlock];
  id v13 = a3;
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "callID"))))
  {
    [(VideoConference *)self cleanupSession:a3 withDelay:a4];
  }
  [a3 setQualityDelegate:0];
  [(VideoConference *)self unlock];
}

- (void)session:(id)a3 didStopWithError:(id)a4
{
  v8[7] = *MEMORY[0x1E4F143B8];
  [(VCObject *)self stopTimeoutTimer];
  delegateNotificationQueue = self->delegateNotificationQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__VideoConference_SessionDelegate__session_didStopWithError___block_invoke;
  v8[3] = &unk_1E6DB43D8;
  v8[4] = a3;
  v8[5] = self;
  void v8[6] = a4;
  dispatch_async(delegateNotificationQueue, v8);
}

uint64_t __61__VideoConference_SessionDelegate__session_didStopWithError___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  uint64_t v3 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule >= 6)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [*(id *)(a1 + 32) callID];
      int v16 = 136315906;
      uint64_t v17 = v4;
      __int16 v18 = 2080;
      int v19 = "-[VideoConference(SessionDelegate) session:didStopWithError:]_block_invoke";
      __int16 v20 = 1024;
      int v21 = 3372;
      __int16 v22 = 1024;
      int v23 = v6;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d VideoConference: notifying delegate of didStop for call ID %d", (uint8_t *)&v16, 0x22u);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    unsigned int v8 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = [*(id *)(a1 + 32) callID];
      if ([*(id *)(a1 + 32) dtxMetrics]) {
        BOOL v10 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "dtxMetrics"), "description"), "UTF8String");
      }
      else {
        BOOL v10 = "<nil>";
      }
      int v16 = 136316162;
      uint64_t v17 = v7;
      __int16 v18 = 2080;
      int v19 = "-[VideoConference(SessionDelegate) session:didStopWithError:]_block_invoke";
      __int16 v20 = 1024;
      int v21 = 3373;
      __int16 v22 = 1024;
      int v23 = v9;
      __int16 v24 = 2080;
      int v25 = v10;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d VCCallSession callID[%d] call end audio metrics: %s", (uint8_t *)&v16, 0x2Cu);
    }
  }
  [*(id *)(a1 + 40) delegate];
  char v11 = objc_opt_respondsToSelector();
  BOOL v12 = (void *)[*(id *)(a1 + 40) delegate];
  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v14 = [*(id *)(a1 + 32) callID];
  if (v11) {
    return objc_msgSend(v12, "videoConference:didStopWithCallID:error:callMetadata:", v13, v14, *(void *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "callMetadata"));
  }
  else {
    return [v12 videoConference:v13 didStopWithCallID:v14 error:*(void *)(a1 + 48)];
  }
}

- (void)session:(id)a3 receivedNoPacketsForSeconds:(double)a4
{
  v5[7] = *MEMORY[0x1E4F143B8];
  delegateNotificationQueue = self->delegateNotificationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __72__VideoConference_SessionDelegate__session_receivedNoPacketsForSeconds___block_invoke;
  v5[3] = &unk_1E6DB5450;
  *(double *)&v5[6] = a4;
  v5[4] = self;
  v5[5] = a3;
  dispatch_async(delegateNotificationQueue, v5);
}

uint64_t __72__VideoConference_SessionDelegate__session_receivedNoPacketsForSeconds___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    double v4 = *(double *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = [*(id *)(a1 + 40) callID];
    return [v3 videoConference:v5 receivedNoRemotePacketsForTime:v6 callID:v4];
  }
  return result;
}

- (void)session:(id)a3 remoteMediaStalled:(BOOL)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  delegateNotificationQueue = self->delegateNotificationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __63__VideoConference_SessionDelegate__session_remoteMediaStalled___block_invoke;
  v5[3] = &unk_1E6DB3E18;
  BOOL v6 = a4;
  v5[4] = self;
  v5[5] = a3;
  dispatch_async(delegateNotificationQueue, v5);
}

uint64_t __63__VideoConference_SessionDelegate__session_remoteMediaStalled___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "videoConference:remoteMediaStalled:callID:", *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), objc_msgSend(*(id *)(a1 + 40), "callID"));
  }
  char v2 = (void *)VCRemoteVideoManager_DefaultManager();
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v4 = [*(id *)(a1 + 40) callID];

  return [v2 remoteMediaDidStall:v3 streamToken:v4];
}

- (void)session:(id)a3 packMeters:(char *)a4 withLength:(char *)a5
{
  int chatMode = self->chatMode;
  if (chatMode == 2)
  {
    char v14 = 0;
  }
  else
  {
    if (chatMode) {
      return;
    }
    if (self->isFocus)
    {
      int v10 = [(NSArray *)self->connectedPeers count];
      if (v10 < 2)
      {
        __int16 v11 = 0;
      }
      else
      {
        __int16 v11 = 0;
        for (uint64_t i = 1; i != v10; ++i)
        {
          if (self->speakingArray[i]) {
            int v13 = 1 << i;
          }
          else {
            LOWORD(v13) = 0;
          }
          v11 |= v13;
        }
      }
      *(_WORD *)a4 = v11 | ([a3 inputMeter] != 0);
      char v14 = 2;
    }
    else
    {
      *a4 = [a3 inputMeter];
      char v14 = 1;
    }
  }
  *a5 = v14;
}

- (void)session:(id)a3 didChangeVideoRule:(id)a4
{
  if (!objc_msgSend(a4, "iWidth", a3) || !objc_msgSend(a4, "iHeight"))
  {
    uint64_t v6 = [(VCVideoRule *)self->conferenceCaptureRule iWidth];
    uint64_t v7 = [(VCVideoRule *)self->conferenceCaptureRule iHeight];
    [a4 fRate];
    objc_msgSend(a4, "setFrameWidth:frameHeight:frameRate:", v6, v7);
  }
  [a4 fRate];
  if (v8 == 0.0)
  {
    uint64_t v9 = [a4 iWidth];
    uint64_t v10 = [a4 iHeight];
    [(VCVideoRule *)self->conferenceCaptureRule fRate];
    objc_msgSend(a4, "setFrameWidth:frameHeight:frameRate:", v9, v10);
  }
  uint64_t v11 = [a4 iWidth];
  uint64_t v12 = [a4 iHeight];
  [a4 fRate];

  [(VideoConference *)self initiateResolutionChangeToWidth:v11 height:v12 rate:(int)v13];
}

- (BOOL)session:(id)a3 receivedRemoteFrame:(__CVBuffer *)a4 atTime:(id *)a5 withScreenAttributes:(id)a6 videoAttributes:(id)a7 isFirstFrame:(BOOL)a8 isVideoPaused:(BOOL)a9
{
  BOOL v51 = a8;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  p_xRemoteLayer = &self->xRemoteLayer;
  pthread_mutex_lock(&self->xRemoteLayer);
  if (a7)
  {
    CFMutableDictionaryRef EncodedCFDictionary = VideoAttributes_CreateEncodedCFDictionary(a7);
    VCImageQueue_EnqueueAttributes((uint64_t)self->currentQueue, EncodedCFDictionary);
    if (EncodedCFDictionary) {
      CFRelease(EncodedCFDictionary);
    }
    if ([a7 videoSourceScreen])
    {
      self->currentQueue = self->screenQueue;
      uint64_t v17 = "screen";
    }
    else if ([a7 camera] && (backQueue = self->backQueue) != 0)
    {
      self->currentQueue = backQueue;
      uint64_t v17 = "back";
    }
    else
    {
      self->currentQueue = self->frontQueue;
      uint64_t v17 = "front";
    }
  }
  else
  {
    if (self->currentQueue) {
      goto LABEL_13;
    }
    self->currentQueue = self->frontQueue;
    uint64_t v17 = "front";
  }
  self->currentFacing = v17;
LABEL_13:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    __int16 v20 = *MEMORY[0x1E4F47A50];
    int v21 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        currentFacing = self->currentFacing;
        LODWORD(buf.var0) = 136315906;
        *(int64_t *)((char *)&buf.var0 + 4) = v19;
        LOWORD(buf.var2) = 2080;
        *(void *)((char *)&buf.var2 + 2) = "-[VideoConference(SessionDelegate) session:receivedRemoteFrame:atTime:withS"
                                             "creenAttributes:videoAttributes:isFirstFrame:isVideoPaused:]";
        HIWORD(buf.var3) = 1024;
        int v56 = 3494;
        __int16 v57 = 2080;
        uint64_t v58 = (VideoConference *)currentFacing;
        _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d FigImageQueueEnqueueImage [remote - %s] queue", (uint8_t *)&buf, 0x26u);
      }
    }
    else if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      -[VideoConference(SessionDelegate) session:receivedRemoteFrame:atTime:withScreenAttributes:videoAttributes:isFirstFrame:isVideoPaused:].cold.4();
    }
  }
  if (!self->currentQueue && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VideoConference(SessionDelegate) session:receivedRemoteFrame:atTime:withScreenAttributes:videoAttributes:isFirstFrame:isVideoPaused:]();
    }
  }
  if (self->_deviceRole == 3)
  {
    uint64_t v23 = VCCameraStatusBitsFromVideoAttributes(a7);
    __int16 v24 = +[VCVideoRelay sharedInstance];
    $3CC8671D27C23BF42ADDB32F2B5E48AE buf = *a5;
    if (![(VCVideoRelay *)v24 enqueueFrame:a4 atTime:&buf cameraStatusBits:v23]&& (int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v25 = VRTraceErrorLogLevelToCSTR();
      uint64_t v26 = *MEMORY[0x1E4F47A50];
      uint64_t v27 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_39;
        }
        LODWORD(buf.var0) = 136315906;
        *(int64_t *)((char *)&buf.var0 + 4) = v25;
        LOWORD(buf.var2) = 2080;
        *(void *)((char *)&buf.var2 + 2) = "-[VideoConference(SessionDelegate) session:receivedRemoteFrame:atTime:withS"
                                             "creenAttributes:videoAttributes:isFirstFrame:isVideoPaused:]";
        HIWORD(buf.var3) = 1024;
        int v56 = 3509;
        __int16 v57 = 2048;
        uint64_t v58 = self;
        uint64_t v28 = "VideoConference [%s] %s:%d VCVideoRelay enqueueFrame failed; self = %p";
LABEL_34:
        _os_log_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_DEFAULT, v28, (uint8_t *)&buf, 0x26u);
        goto LABEL_39;
      }
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        -[VideoConference(SessionDelegate) session:receivedRemoteFrame:atTime:withScreenAttributes:videoAttributes:isFirstFrame:isVideoPaused:]();
      }
    }
  }
  else
  {
    currentQueue = self->currentQueue;
    $3CC8671D27C23BF42ADDB32F2B5E48AE buf = *a5;
    if ((VCImageQueue_EnqueueFrame((uint64_t)currentQueue, a4, (CMTime *)&buf) & 1) == 0
      && (int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v30 = VRTraceErrorLogLevelToCSTR();
      uint64_t v26 = *MEMORY[0x1E4F47A50];
      uint64_t v31 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_39;
        }
        long long v32 = self->currentFacing;
        LODWORD(buf.var0) = 136315906;
        *(int64_t *)((char *)&buf.var0 + 4) = v30;
        LOWORD(buf.var2) = 2080;
        *(void *)((char *)&buf.var2 + 2) = "-[VideoConference(SessionDelegate) session:receivedRemoteFrame:atTime:withS"
                                             "creenAttributes:videoAttributes:isFirstFrame:isVideoPaused:]";
        HIWORD(buf.var3) = 1024;
        int v56 = 3514;
        __int16 v57 = 2080;
        uint64_t v58 = (VideoConference *)v32;
        uint64_t v28 = "VideoConference [%s] %s:%d FigImageQueueEnqueueImage skipped [remote - %s] queue full!";
        goto LABEL_34;
      }
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        -[VideoConference(SessionDelegate) session:receivedRemoteFrame:atTime:withScreenAttributes:videoAttributes:isFirstFrame:isVideoPaused:]();
      }
    }
  }
LABEL_39:
  pthread_mutex_unlock(p_xRemoteLayer);
  if (a6)
  {
    VCMediaRecorder_UpdateTargetScreenAttributes((uint64_t)self->_vcMediaRecorder, (uint64_t)a7);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v33 = VRTraceErrorLogLevelToCSTR();
      id v34 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        [a6 ratio];
        int v36 = v35;
        [a6 ratio];
        uint64_t v38 = v37;
        int v39 = [a6 orientation];
        LODWORD(buf.var0) = 136316418;
        *(int64_t *)((char *)&buf.var0 + 4) = v33;
        LOWORD(buf.var2) = 2080;
        *(void *)((char *)&buf.var2 + 2) = "-[VideoConference(SessionDelegate) session:receivedRemoteFrame:atTime:withS"
                                             "creenAttributes:videoAttributes:isFirstFrame:isVideoPaused:]";
        HIWORD(buf.var3) = 1024;
        int v56 = 3524;
        __int16 v57 = 2048;
        uint64_t v58 = v36;
        __int16 v59 = 2048;
        uint64_t v60 = v38;
        __int16 v61 = 1024;
        int v62 = v39;
        _os_log_impl(&dword_1E1EA4000, v34, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d screen attributes: %fx%f orientation:%d", (uint8_t *)&buf, 0x36u);
      }
    }
    delegateNotificationQueue = self->delegateNotificationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __135__VideoConference_SessionDelegate__session_receivedRemoteFrame_atTime_withScreenAttributes_videoAttributes_isFirstFrame_isVideoPaused___block_invoke;
    block[3] = &unk_1E6DB43D8;
    void block[4] = self;
    void block[5] = a6;
    void block[6] = a3;
    dispatch_async(delegateNotificationQueue, block);
  }
  if (a7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v41 = VRTraceErrorLogLevelToCSTR();
      __int16 v42 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        [a7 ratio];
        __int16 v44 = v43;
        [a7 ratio];
        uint64_t v46 = v45;
        int v47 = [a7 orientation];
        LODWORD(buf.var0) = 136316418;
        *(int64_t *)((char *)&buf.var0 + 4) = v41;
        LOWORD(buf.var2) = 2080;
        *(void *)((char *)&buf.var2 + 2) = "-[VideoConference(SessionDelegate) session:receivedRemoteFrame:atTime:withS"
                                             "creenAttributes:videoAttributes:isFirstFrame:isVideoPaused:]";
        HIWORD(buf.var3) = 1024;
        int v56 = 3537;
        __int16 v57 = 2048;
        uint64_t v58 = v44;
        __int16 v59 = 2048;
        uint64_t v60 = v46;
        __int16 v61 = 1024;
        int v62 = v47;
        _os_log_impl(&dword_1E1EA4000, v42, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d video attributes: %fx%f orientation:%d", (uint8_t *)&buf, 0x36u);
      }
    }
    __int16 v48 = self->delegateNotificationQueue;
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __135__VideoConference_SessionDelegate__session_receivedRemoteFrame_atTime_withScreenAttributes_videoAttributes_isFirstFrame_isVideoPaused___block_invoke_639;
    v53[3] = &unk_1E6DB43D8;
    v53[4] = self;
    v53[5] = a7;
    v53[6] = a3;
    dispatch_async(v48, v53);
  }
  if (v51)
  {
    synchronizer = self->synchronizer;
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __135__VideoConference_SessionDelegate__session_receivedRemoteFrame_atTime_withScreenAttributes_videoAttributes_isFirstFrame_isVideoPaused___block_invoke_2;
    v52[3] = &unk_1E6DB3E40;
    v52[4] = self;
    v52[5] = a3;
    [(CameraConferenceSynchronizer *)synchronizer scheduleFirstRemoteFrameNotification:v52];
  }
  return 1;
}

void __135__VideoConference_SessionDelegate__session_receivedRemoteFrame_atTime_withScreenAttributes_videoAttributes_isFirstFrame_isVideoPaused___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "videoConference:didRemoteScreenAttributesChange:forCallID:", *(void *)(a1 + 32), *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "callID"));
  }
  uint64_t v2 = VCRemoteVideoManager_DefaultManager();
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 48) callID];

  VCRemoteVideoManager_RemoteScreenAttributesDidChange(v2, v3, v4);
}

void __135__VideoConference_SessionDelegate__session_receivedRemoteFrame_atTime_withScreenAttributes_videoAttributes_isFirstFrame_isVideoPaused___block_invoke_639(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "videoConference:didRemoteVideoAttributesChange:forCallID:", *(void *)(a1 + 32), *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "callID"));
  }
  uint64_t v2 = VCRemoteVideoManager_DefaultManager();
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 48) callID];

  VCRemoteVideoManager_RemoteVideoAttributesDidChange(v2, v3, v4);
}

void __135__VideoConference_SessionDelegate__session_receivedRemoteFrame_atTime_withScreenAttributes_videoAttributes_isFirstFrame_isVideoPaused___block_invoke_2(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  long long v1 = *(_OWORD *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 1024);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __135__VideoConference_SessionDelegate__session_receivedRemoteFrame_atTime_withScreenAttributes_videoAttributes_isFirstFrame_isVideoPaused___block_invoke_3;
  block[3] = &unk_1E6DB3E40;
  long long v4 = v1;
  dispatch_async(v2, block);
}

void __135__VideoConference_SessionDelegate__session_receivedRemoteFrame_atTime_withScreenAttributes_videoAttributes_isFirstFrame_isVideoPaused___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "videoConference:didReceiveFirstRemoteFrameForCallID:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "callID"));
  }
  uint64_t v2 = VCRemoteVideoManager_DefaultManager();
  uint64_t v3 = [*(id *)(a1 + 40) callID];

  VCRemoteVideoManager_DidReceiveFirstRemoteFrameForStreamToken(v2, v3);
}

- (void)session:(id)a3 didReceiveARPLData:(id)a4 fromCallID:(unsigned int)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)$3CC8671D27C23BF42ADDB32F2B5E48AE buf = 136315906;
      uint64_t v16 = v8;
      __int16 v17 = 2080;
      __int16 v18 = "-[VideoConference(SessionDelegate) session:didReceiveARPLData:fromCallID:]";
      __int16 v19 = 1024;
      int v20 = 3570;
      __int16 v21 = 1024;
      unsigned int v22 = a5;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d >>>>> Relaying incoming ARPL data from VCCallSession to VideoConferenceManager with callID=%d (in VideoConference) <<<<<", buf, 0x22u);
    }
  }
  if (!a4 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint64_t v11 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)$3CC8671D27C23BF42ADDB32F2B5E48AE buf = 136315650;
      uint64_t v16 = v10;
      __int16 v17 = 2080;
      __int16 v18 = "-[VideoConference(SessionDelegate) session:didReceiveARPLData:fromCallID:]";
      __int16 v19 = 1024;
      int v20 = 3573;
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d >>>>> DATA ERROR (in VideoConference) <<<<<", buf, 0x1Cu);
    }
  }
  delegateNotificationQueue = self->delegateNotificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__VideoConference_SessionDelegate__session_didReceiveARPLData_fromCallID___block_invoke;
  block[3] = &unk_1E6DB3EE0;
  void block[4] = self;
  void block[5] = a4;
  unsigned int v14 = a5;
  dispatch_async(delegateNotificationQueue, block);
}

uint64_t __74__VideoConference_SessionDelegate__session_didReceiveARPLData_fromCallID___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(unsigned int *)(a1 + 48);
    return [v3 videoConference:v4 didReceiveARPLData:v5 fromCallID:v6];
  }
  return result;
}

- (void)session:(id)a3 didReceiveData:(id)a4 messageType:(unsigned int)a5 withCallID:(unsigned int)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a5 == 1)
  {
    delegateNotificationQueue = self->delegateNotificationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__VideoConference_SessionDelegate__session_didReceiveData_messageType_withCallID___block_invoke;
    block[3] = &unk_1E6DB3EE0;
    void block[4] = self;
    void block[5] = a4;
    unsigned int v12 = a6;
    dispatch_async(delegateNotificationQueue, block);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)$3CC8671D27C23BF42ADDB32F2B5E48AE buf = 136316162;
      uint64_t v14 = v9;
      __int16 v15 = 2080;
      uint64_t v16 = "-[VideoConference(SessionDelegate) session:didReceiveData:messageType:withCallID:]";
      __int16 v17 = 1024;
      int v18 = 3594;
      __int16 v19 = 1024;
      unsigned int v20 = a6;
      __int16 v21 = 1024;
      unsigned int v22 = a5;
      _os_log_error_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_ERROR, "VideoConference [%s] %s:%d Unsupported data received from callId=%d with messageType=%u", buf, 0x28u);
    }
  }
}

uint64_t __82__VideoConference_SessionDelegate__session_didReceiveData_messageType_withCallID___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(unsigned int *)(a1 + 48);

  return [v2 videoConference:v3 didReceiveData:v4 forCallID:v5];
}

- (BOOL)session:(id)a3 startVideoSend:(id *)a4 captureRuleWifi:(id)a5 captureRuleCell:(id)a6 interface:(int)a7 isUnpausing:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    float v13 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int deviceRole = self->_deviceRole;
      int v29 = 136316930;
      uint64_t v30 = v12;
      __int16 v31 = 2080;
      long long v32 = "-[VideoConference(SessionDelegate) session:startVideoSend:captureRuleWifi:captureRuleCell:interface:isUnpausing:]";
      __int16 v33 = 1024;
      int v34 = 3608;
      __int16 v35 = 2048;
      *(void *)int v36 = self;
      *(_WORD *)&v36[8] = 2112;
      id v37 = a5;
      __int16 v38 = 2112;
      id v39 = a6;
      __int16 v40 = 1024;
      BOOL v41 = v8;
      __int16 v42 = 1024;
      int v43 = deviceRole;
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d self = %p, captureRuleWifuint64_t i = %@, captureRuleCell=%@, isUnpausing = %d, _deviceRole = %d", (uint8_t *)&v29, 0x46u);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    uint64_t v16 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 136315906;
      uint64_t v30 = v15;
      __int16 v31 = 2080;
      long long v32 = "-[VideoConference(SessionDelegate) session:startVideoSend:captureRuleWifi:captureRuleCell:interface:isUnpausing:]";
      __int16 v33 = 1024;
      int v34 = 3611;
      __int16 v35 = 2112;
      *(void *)int v36 = a5;
      _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d Capture rule set to %@", (uint8_t *)&v29, 0x26u);
    }
  }
  if ([+[VCDefaults sharedInstance] momentsUserPreferenceEnabled])
  {
    vcMediaRecorder = self->_vcMediaRecorder;
    [a5 fRate];
    -[VCMediaRecorder setFrameRate:](vcMediaRecorder, "setFrameRate:");
  }
  LOBYTE(self->downstreamBandwidth) = 1;
  if (![+[VCDefaults sharedInstance] forceHWI])
  {
    int v18 = [a5 iWidth];
    if ([a5 iHeight] * v18 == 176640)
    {
      [a5 fRate];
      objc_msgSend(a5, "setFrameWidth:frameHeight:frameRate:", 640, 480);
    }
    int v19 = [a5 iWidth];
    if ([a5 iHeight] * v19 == 130560)
    {
      [a5 fRate];
      objc_msgSend(a5, "setFrameWidth:frameHeight:frameRate:", 1280, 720);
    }
  }
  if (v8 && [(VCVideoRule *)self->conferenceCaptureRule iWidth])
  {
    conferenceCaptureRule = self->conferenceCaptureRule;
    __int16 v21 = a5;
  }
  else
  {
    __int16 v21 = self->conferenceCaptureRule;
    conferenceCaptureRule = a5;
  }
  [v21 setToVideoRule:conferenceCaptureRule];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v22 = VRTraceErrorLogLevelToCSTR();
    uint64_t v23 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v24 = [a5 iWidth];
      int v25 = [a5 iHeight];
      [a5 fRate];
      int v29 = 136316418;
      uint64_t v30 = v22;
      __int16 v31 = 2080;
      long long v32 = "-[VideoConference(SessionDelegate) session:startVideoSend:captureRuleWifi:captureRuleCell:interface:isUnpausing:]";
      __int16 v33 = 1024;
      int v34 = 3645;
      __int16 v35 = 1024;
      *(_DWORD *)int v36 = v24;
      *(_WORD *)&v36[4] = 1024;
      *(_DWORD *)&v36[6] = v25;
      LOWORD(v37) = 1024;
      *(_DWORD *)((char *)&v37 + 2) = (int)v26;
      _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d VIDEOCONFERENCE: Capture video settings %dx%d@%dfps", (uint8_t *)&v29, 0x2Eu);
    }
  }
  BOOL v27 = [(VideoConference *)self registerForVideoFramesWithDeviceRole:self->_deviceRole captureRule:a5 isUnpausing:v8];
  if (!v27 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VideoConference(SessionDelegate) session:startVideoSend:captureRuleWifi:captureRuleCell:interface:isUnpausing:]();
    }
  }
  return v27;
}

- (BOOL)registerForVideoFramesWithDeviceRole:(int)a3 captureRule:(id)a4 isUnpausing:(BOOL)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v21[0] = 0;
  int v20 = 0;
  BOOL v8 = [+[VCVideoRuleCollectionsCamera sharedInstance] getBestFrameWidth:(char *)v21 + 4 frameHeight:v21 frameRate:&v20];
  if (a3 != 4)
  {
    if (v8)
    {
      if ([(VideoConference *)self conferenceOperatingMode] == 1)
      {
        id v10 = +[VCVideoCaptureServer VCVideoCaptureServerSingleton];
        uint64_t v11 = [a4 iWidth];
        uint64_t v12 = [a4 iHeight];
        [a4 fRate];
        if (([v10 registerForVideoFramesFromSource:3 withClient:self width:v11 height:v12 frameRate:(int)v13] & 1) == 0)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
            goto LABEL_19;
          }
          VRTraceErrorLogLevelToCSTR();
          BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (v9)
          {
            -[VideoConference(SessionDelegate) registerForVideoFramesWithDeviceRole:captureRule:isUnpausing:]();
            goto LABEL_19;
          }
          return v9;
        }
      }
      else if ([(VideoConference *)self conferenceOperatingMode] == 4)
      {
        id v14 = +[VCVideoCaptureServer VCVideoCaptureServerSingleton];
        uint64_t v15 = [a4 iWidth];
        uint64_t v16 = [a4 iHeight];
        [a4 fRate];
        if (([v14 registerForVideoFramesFromSource:1 withClient:self width:v15 height:v16 frameRate:(int)v17] & 1) == 0)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
            goto LABEL_19;
          }
          VRTraceErrorLogLevelToCSTR();
          BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (v9)
          {
            -[VideoConference(SessionDelegate) registerForVideoFramesWithDeviceRole:captureRule:isUnpausing:]();
            goto LABEL_19;
          }
          return v9;
        }
      }
      synchronizer = self->synchronizer;
      objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "localScreenRatioForScreenOrientation:", 0);
      -[CameraConferenceSynchronizer setLocalPortraitAspectRatio:](synchronizer, "setLocalPortraitAspectRatio:");
      [(CameraConferenceSynchronizer *)self->synchronizer scheduleCameraChangeToCaptureSettings:a4];
    }
LABEL_15:
    LOBYTE(v9) = 1;
    return v9;
  }
  if ([+[VCVideoRelay sharedInstance] registerForVideoFrames:self])
  {
    goto LABEL_15;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 3)
  {
LABEL_19:
    LOBYTE(v9) = 0;
    return v9;
  }
  VRTraceErrorLogLevelToCSTR();
  BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
  if (v9)
  {
    -[VideoConference(SessionDelegate) registerForVideoFramesWithDeviceRole:captureRule:isUnpausing:]();
    goto LABEL_19;
  }
  return v9;
}

- (BOOL)session:(id)a3 startVideoReceive:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  p_xRemoteLayer = &self->xRemoteLayer;
  pthread_mutex_lock(&self->xRemoteLayer);
  uint64_t v7 = [a3 negotiatedReceivingFramerate];
  if (v7)
  {
    uint64_t v8 = v7;
    [(VCImageQueue *)self->frontQueue setFrameRate:v7];
    [(VCImageQueue *)self->backQueue setFrameRate:v8];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      id v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315906;
        uint64_t v13 = v9;
        __int16 v14 = 2080;
        uint64_t v15 = "-[VideoConference(SessionDelegate) session:startVideoReceive:]";
        __int16 v16 = 1024;
        int v17 = 3729;
        __int16 v18 = 1024;
        int v19 = v8;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d set receiving framerate for remote queue: %dfps", (uint8_t *)&v12, 0x22u);
      }
    }
  }
  [(VCImageQueue *)self->frontQueue start];
  [(VCImageQueue *)self->backQueue start];
  [(VCImageQueue *)self->screenQueue start];
  pthread_mutex_unlock(p_xRemoteLayer);
  return 1;
}

- (BOOL)stopVideoSend:(BOOL)a3 error:(id *)a4
{
  BOOL v4 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int deviceRole = self->_deviceRole;
      int v13 = 136316418;
      uint64_t v14 = v6;
      __int16 v15 = 2080;
      __int16 v16 = "-[VideoConference(SessionDelegate) stopVideoSend:error:]";
      __int16 v17 = 1024;
      int v18 = 3747;
      __int16 v19 = 2048;
      uint64_t v20 = self;
      __int16 v21 = 1024;
      BOOL v22 = v4;
      __int16 v23 = 1024;
      int v24 = deviceRole;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d self = %p, fullTeardown = %d, _int deviceRole = %d", (uint8_t *)&v13, 0x32u);
    }
  }
  BOOL v9 = [(VideoConference *)self deregisterForVideoFramesWithDeviceRole:self->_deviceRole];
  if (v9)
  {
    VCMediaRecorder_ClearHistoryBuffer((uint64_t)self->_vcMediaRecorder);
    VCMediaRecorder_StopProcessingAllRequests((uint64_t)self->_vcMediaRecorder);
    if (v4)
    {
      self->localFrameWidth = 0;
      self->localFrameHeight = 0;
      [(VCVideoRule *)self->conferenceCaptureRule setToVideoRule:0];
      [(CameraConferenceSynchronizer *)self->synchronizer reset];
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315650;
        uint64_t v14 = v10;
        __int16 v15 = 2080;
        __int16 v16 = "-[VideoConference(SessionDelegate) stopVideoSend:error:]";
        __int16 v17 = 1024;
        int v18 = 3766;
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d video-stop-completed", (uint8_t *)&v13, 0x1Cu);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VideoConference(SessionDelegate) stopVideoSend:error:]();
    }
  }
  return v9;
}

- (BOOL)deregisterForVideoFramesWithDeviceRole:(int)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v9[0] = 0;
  int v8 = 0;
  BOOL v5 = [+[VCVideoRuleCollectionsCamera sharedInstance] getBestFrameWidth:(char *)v9 + 4 frameHeight:v9 frameRate:&v8];
  if (a3 != 4)
  {
    if (v5)
    {
      if ((objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "deregisterForVideoFramesFromSource:withClient:", 3, self) & 1) == 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_17;
        }
        VRTraceErrorLogLevelToCSTR();
        BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (v6)
        {
          -[VideoConference(SessionDelegate) deregisterForVideoFramesWithDeviceRole:]();
          goto LABEL_17;
        }
        return v6;
      }
      if ((objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "deregisterForVideoFramesFromSource:withClient:", 1, self) & 1) == 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_17;
        }
        VRTraceErrorLogLevelToCSTR();
        BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (v6)
        {
          -[VideoConference(SessionDelegate) deregisterForVideoFramesWithDeviceRole:]();
          goto LABEL_17;
        }
        return v6;
      }
      [(CameraConferenceSynchronizer *)self->synchronizer scheduleCameraChangeToPreviewSettings];
    }
LABEL_10:
    LOBYTE(v6) = 1;
    return v6;
  }
  if ([+[VCVideoRelay sharedInstance] deregisterForVideoFrames:self])
  {
    goto LABEL_10;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 3)
  {
LABEL_17:
    LOBYTE(v6) = 0;
    return v6;
  }
  VRTraceErrorLogLevelToCSTR();
  BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
  if (v6)
  {
    -[VideoConference(SessionDelegate) deregisterForVideoFramesWithDeviceRole:]();
    goto LABEL_17;
  }
  return v6;
}

- (BOOL)session:(id)a3 stopVideoReceive:(id *)a4 isPausing:(BOOL)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ((VideoConference *)objc_opt_class() != self)
  {
    if (objc_opt_respondsToSelector()) {
      BOOL v6 = (__CFString *)[(VideoConference *)self performSelector:sel_logPrefix];
    }
    else {
      BOOL v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_12;
    }
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    int v13 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    int v17 = 136316162;
    uint64_t v18 = v12;
    __int16 v19 = 2080;
    uint64_t v20 = "-[VideoConference(SessionDelegate) session:stopVideoReceive:isPausing:]";
    __int16 v21 = 1024;
    int v22 = 3805;
    __int16 v23 = 2112;
    int v24 = v6;
    __int16 v25 = 2048;
    float v26 = self;
    BOOL v9 = "VideoConference [%s] %s:%d %@(%p) ";
    uint64_t v10 = v13;
    uint32_t v11 = 48;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    int v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315650;
      uint64_t v18 = v7;
      __int16 v19 = 2080;
      uint64_t v20 = "-[VideoConference(SessionDelegate) session:stopVideoReceive:isPausing:]";
      __int16 v21 = 1024;
      int v22 = 3805;
      BOOL v9 = "VideoConference [%s] %s:%d ";
      uint64_t v10 = v8;
      uint32_t v11 = 28;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v17, v11);
    }
  }
LABEL_12:
  pthread_mutex_lock(&self->xRemoteLayer);
  [(VCImageQueue *)self->frontQueue pause];
  [(VCImageQueue *)self->backQueue pause];
  [(VCImageQueue *)self->screenQueue pause];
  pthread_mutex_unlock(&self->xRemoteLayer);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    __int16 v15 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315650;
      uint64_t v18 = v14;
      __int16 v19 = 2080;
      uint64_t v20 = "-[VideoConference(SessionDelegate) session:stopVideoReceive:isPausing:]";
      __int16 v21 = 1024;
      int v22 = 3815;
      _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d video-stop-completed", (uint8_t *)&v17, 0x1Cu);
    }
  }
  return 1;
}

- (BOOL)session:(id)a3 didStopVideoIO:(BOOL)a4 error:(id *)a5
{
  BOOL v5 = a4;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if ((VideoConference *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)$3CC8671D27C23BF42ADDB32F2B5E48AE buf = 136315650;
        uint64_t v31 = v9;
        __int16 v32 = 2080;
        __int16 v33 = "-[VideoConference(SessionDelegate) session:didStopVideoIO:error:]";
        __int16 v34 = 1024;
        int v35 = 3827;
        uint32_t v11 = "VideoConference [%s] %s:%d ";
        uint64_t v12 = v10;
        uint32_t v13 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      int v8 = (__CFString *)[(VideoConference *)self performSelector:sel_logPrefix];
    }
    else {
      int v8 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      __int16 v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)$3CC8671D27C23BF42ADDB32F2B5E48AE buf = 136316162;
        uint64_t v31 = v14;
        __int16 v32 = 2080;
        __int16 v33 = "-[VideoConference(SessionDelegate) session:didStopVideoIO:error:]";
        __int16 v34 = 1024;
        int v35 = 3827;
        __int16 v36 = 2112;
        id v37 = v8;
        __int16 v38 = 2048;
        id v39 = self;
        uint32_t v11 = "VideoConference [%s] %s:%d %@(%p) ";
        uint64_t v12 = v15;
        uint32_t v13 = 48;
        goto LABEL_11;
      }
    }
  }
  [(VideoConference *)self rdlock];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  sessionArray = self->_sessionArray;
  uint64_t v17 = [(NSArray *)sessionArray countByEnumeratingWithState:&v26 objects:v25 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(sessionArray);
        }
        id v21 = *(id *)(*((void *)&v26 + 1) + 8 * i);
        if (v21 != a3 && ([v21 isVideoRunning] & 1) != 0)
        {
          [(VideoConference *)self unlock];
          return 0;
        }
      }
      uint64_t v18 = [(NSArray *)sessionArray countByEnumeratingWithState:&v26 objects:v25 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }
  [(VideoConference *)self unlock];
  objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "deregisterForVideoFramesFromSource:withClient:", 3, self);
  objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "deregisterForVideoFramesFromSource:withClient:", 1, self);
  [(CameraConferenceSynchronizer *)self->synchronizer scheduleCameraChangeToPreviewSettings];
  if (v5)
  {
    self->localFrameHeight = 0;
    self->localFrameWidth = 0;
    [(VCVideoRule *)self->conferenceCaptureRule setToVideoRule:0];
    [(CameraConferenceSynchronizer *)self->synchronizer reset];
  }
  pthread_mutex_lock(&self->xRemoteLayer);
  [(VCImageQueue *)self->frontQueue pause];
  [(VCImageQueue *)self->backQueue pause];
  [(VCImageQueue *)self->screenQueue pause];
  pthread_mutex_unlock(&self->xRemoteLayer);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v22 = VRTraceErrorLogLevelToCSTR();
    __int16 v23 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)$3CC8671D27C23BF42ADDB32F2B5E48AE buf = 136315650;
      uint64_t v31 = v22;
      __int16 v32 = 2080;
      __int16 v33 = "-[VideoConference(SessionDelegate) session:didStopVideoIO:error:]";
      __int16 v34 = 1024;
      int v35 = 3860;
      _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d video-stop-completed", buf, 0x1Cu);
    }
  }
  return 1;
}

- (void)session:(id)a3 isSendingAudio:(BOOL)a4 error:(id)a5
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  delegateNotificationQueue = self->delegateNotificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__VideoConference_SessionDelegate__session_isSendingAudio_error___block_invoke;
  block[3] = &unk_1E6DB5238;
  void block[4] = self;
  void block[5] = a3;
  BOOL v7 = a4;
  void block[6] = a5;
  dispatch_async(delegateNotificationQueue, block);
}

uint64_t __65__VideoConference_SessionDelegate__session_isSendingAudio_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = [*(id *)(a1 + 40) callID];
    uint64_t v6 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 48);
    return [v3 videoConference:v4 withCallID:v5 isSendingAudio:v6 error:v7];
  }
  return result;
}

- (void)session:(id)a3 didPauseAudio:(BOOL)a4 error:(id)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!a4) {
    [(VideoConference *)self setMicrophoneMuted:self->microphoneMuted];
  }
  delegateNotificationQueue = self->delegateNotificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__VideoConference_SessionDelegate__session_didPauseAudio_error___block_invoke;
  block[3] = &unk_1E6DB5238;
  void block[4] = self;
  void block[5] = a3;
  BOOL v11 = a4;
  void block[6] = a5;
  dispatch_async(delegateNotificationQueue, block);
}

uint64_t __64__VideoConference_SessionDelegate__session_didPauseAudio_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = [*(id *)(a1 + 40) callID];
    uint64_t v6 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 48);
    return [v3 videoConference:v4 withCallID:v5 didPauseAudio:v6 error:v7];
  }
  return result;
}

- (void)session:(id)a3 didPauseVideo:(BOOL)a4 error:(id)a5
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  delegateNotificationQueue = self->delegateNotificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__VideoConference_SessionDelegate__session_didPauseVideo_error___block_invoke;
  block[3] = &unk_1E6DB5238;
  void block[4] = self;
  void block[5] = a3;
  BOOL v7 = a4;
  void block[6] = a5;
  dispatch_async(delegateNotificationQueue, block);
}

uint64_t __64__VideoConference_SessionDelegate__session_didPauseVideo_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = [*(id *)(a1 + 40) callID];
    uint64_t v6 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 48);
    return [v3 videoConference:v4 withCallID:v5 didPauseVideo:v6 error:v7];
  }
  return result;
}

- (void)remoteAudioDidPause:(BOOL)a3 callID:(unsigned int)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  delegateNotificationQueue = self->delegateNotificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__VideoConference_SessionDelegate__remoteAudioDidPause_callID___block_invoke;
  block[3] = &unk_1E6DB76B0;
  void block[4] = self;
  BOOL v7 = a3;
  unsigned int v6 = a4;
  dispatch_async(delegateNotificationQueue, block);
}

uint64_t __63__VideoConference_SessionDelegate__remoteAudioDidPause_callID___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result) {
    uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "videoConference:remoteAudioPaused:callID:", *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 44), *(unsigned int *)(a1 + 40));
  }
  if (!*(unsigned char *)(a1 + 44))
  {
    uint64_t result = *(void *)(a1 + 32);
    if (*(unsigned char *)(result + 1014))
    {
      uint64_t v3 = *(unsigned int *)(a1 + 40);
      return [(id)result setPauseAudio:0 callID:v3 error:0];
    }
  }
  return result;
}

- (void)remoteVideoDidPause:(BOOL)a3 callID:(unsigned int)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  delegateNotificationQueue = self->delegateNotificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__VideoConference_SessionDelegate__remoteVideoDidPause_callID___block_invoke;
  block[3] = &unk_1E6DB76B0;
  void block[4] = self;
  BOOL v7 = a3;
  unsigned int v6 = a4;
  dispatch_async(delegateNotificationQueue, block);
}

unsigned char *__63__VideoConference_SessionDelegate__remoteVideoDidPause_callID___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "videoConference:remoteVideoPaused:callID:", *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 44), *(unsigned int *)(a1 + 40));
  }
  uint64_t result = (unsigned char *)[(id)VCRemoteVideoManager_DefaultManager() remoteVideoDidPause:*(unsigned __int8 *)(a1 + 44) streamToken:*(unsigned int *)(a1 + 40)];
  if (!*(unsigned char *)(a1 + 44))
  {
    uint64_t result = *(unsigned char **)(a1 + 32);
    if (result[1015])
    {
      uint64_t v3 = *(unsigned int *)(a1 + 40);
      return (unsigned char *)[result setPauseVideo:0 callID:v3 error:0];
    }
  }
  return result;
}

- (void)session:(id)a3 initiateRelayRequest:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  [(VideoConference *)self rdlock];
  int v7 = [a3 callID];
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "callID"))))
  {
    if ((VideoConference *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_19;
      }
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      if (a3) {
        BOOL v11 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      }
      else {
        BOOL v11 = "<nil>";
      }
      *(_DWORD *)$3CC8671D27C23BF42ADDB32F2B5E48AE buf = 136315906;
      uint64_t v22 = v9;
      __int16 v23 = 2080;
      int v24 = "-[VideoConference(SessionDelegate) session:initiateRelayRequest:]";
      __int16 v25 = 1024;
      int v26 = 3941;
      __int16 v27 = 2080;
      long long v28 = (void *)v11;
      __int16 v15 = "VideoConference [%s] %s:%d session=%s";
      __int16 v16 = v10;
      uint32_t v17 = 38;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v8 = (__CFString *)[(VideoConference *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v8 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_19;
      }
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint32_t v13 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      if (a3) {
        uint64_t v14 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      }
      else {
        uint64_t v14 = "<nil>";
      }
      *(_DWORD *)$3CC8671D27C23BF42ADDB32F2B5E48AE buf = 136316418;
      uint64_t v22 = v12;
      __int16 v23 = 2080;
      int v24 = "-[VideoConference(SessionDelegate) session:initiateRelayRequest:]";
      __int16 v25 = 1024;
      int v26 = 3941;
      __int16 v27 = 2112;
      long long v28 = v8;
      __int16 v29 = 2048;
      uint64_t v30 = self;
      __int16 v31 = 2080;
      __int16 v32 = v14;
      __int16 v15 = "VideoConference [%s] %s:%d %@(%p) session=%s";
      __int16 v16 = v13;
      uint32_t v17 = 58;
    }
    _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
LABEL_19:
    delegateNotificationQueue = self->delegateNotificationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__VideoConference_SessionDelegate__session_initiateRelayRequest___block_invoke;
    block[3] = &unk_1E6DB3EE0;
    int v20 = v7;
    void block[4] = self;
    void block[5] = a4;
    dispatch_async(delegateNotificationQueue, block);
  }
  [(VideoConference *)self unlock];
}

uint64_t __65__VideoConference_SessionDelegate__session_initiateRelayRequest___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(unsigned int *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    return [v3 videoConference:v5 inititiateRelayRequest:v4 requestDict:v6];
  }
  return result;
}

- (void)session:(id)a3 sendRelayResponse:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  [(VideoConference *)self rdlock];
  int v7 = [a3 callID];
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "callID"))))
  {
    if ((VideoConference *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_19;
      }
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      if (a3) {
        BOOL v11 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      }
      else {
        BOOL v11 = "<nil>";
      }
      *(_DWORD *)$3CC8671D27C23BF42ADDB32F2B5E48AE buf = 136315906;
      uint64_t v22 = v9;
      __int16 v23 = 2080;
      int v24 = "-[VideoConference(SessionDelegate) session:sendRelayResponse:]";
      __int16 v25 = 1024;
      int v26 = 3961;
      __int16 v27 = 2080;
      long long v28 = (void *)v11;
      __int16 v15 = "VideoConference [%s] %s:%d session=%s";
      __int16 v16 = v10;
      uint32_t v17 = 38;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v8 = (__CFString *)[(VideoConference *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v8 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_19;
      }
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint32_t v13 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      if (a3) {
        uint64_t v14 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      }
      else {
        uint64_t v14 = "<nil>";
      }
      *(_DWORD *)$3CC8671D27C23BF42ADDB32F2B5E48AE buf = 136316418;
      uint64_t v22 = v12;
      __int16 v23 = 2080;
      int v24 = "-[VideoConference(SessionDelegate) session:sendRelayResponse:]";
      __int16 v25 = 1024;
      int v26 = 3961;
      __int16 v27 = 2112;
      long long v28 = v8;
      __int16 v29 = 2048;
      uint64_t v30 = self;
      __int16 v31 = 2080;
      __int16 v32 = v14;
      __int16 v15 = "VideoConference [%s] %s:%d %@(%p) session=%s";
      __int16 v16 = v13;
      uint32_t v17 = 58;
    }
    _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
LABEL_19:
    delegateNotificationQueue = self->delegateNotificationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__VideoConference_SessionDelegate__session_sendRelayResponse___block_invoke;
    block[3] = &unk_1E6DB3EE0;
    int v20 = v7;
    void block[4] = self;
    void block[5] = a4;
    dispatch_async(delegateNotificationQueue, block);
  }
  [(VideoConference *)self unlock];
}

uint64_t __62__VideoConference_SessionDelegate__session_sendRelayResponse___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(unsigned int *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    return [v3 videoConference:v5 sendRelayUpdate:v4 updateDict:v6];
  }
  return result;
}

- (void)session:(id)a3 cancelRelayRequest:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v6 = [a3 callID];
  delegateNotificationQueue = self->delegateNotificationQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__VideoConference_SessionDelegate__session_cancelRelayRequest___block_invoke;
  v8[3] = &unk_1E6DB3EE0;
  int v9 = v6;
  v8[4] = self;
  v8[5] = a4;
  dispatch_async(delegateNotificationQueue, v8);
}

uint64_t __63__VideoConference_SessionDelegate__session_cancelRelayRequest___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(unsigned int *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    return [v3 videoConference:v5 cancelRelayRequest:v4 requestDict:v6];
  }
  return result;
}

- (void)session:(id)a3 didChangeRemoteScreenAttributes:(id)a4
{
  v8[7] = *MEMORY[0x1E4F143B8];
  [(VCMediaRecorder *)self->_vcMediaRecorder setInitialRemoteScreenAttributes:a4];
  delegateNotificationQueue = self->delegateNotificationQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__VideoConference_SessionDelegate__session_didChangeRemoteScreenAttributes___block_invoke;
  v8[3] = &unk_1E6DB43D8;
  v8[4] = self;
  v8[5] = a4;
  void v8[6] = a3;
  dispatch_async(delegateNotificationQueue, v8);
}

void __76__VideoConference_SessionDelegate__session_didChangeRemoteScreenAttributes___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "videoConference:didRemoteScreenAttributesChange:forCallID:", *(void *)(a1 + 32), *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "callID"));
  }
  uint64_t v2 = VCRemoteVideoManager_DefaultManager();
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 48) callID];

  VCRemoteVideoManager_RemoteScreenAttributesDidChange(v2, v3, v4);
}

- (void)session:(id)a3 remoteAudioEnabled:(BOOL)a4 withCallID:(unsigned int)a5
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  delegateNotificationQueue = self->delegateNotificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__VideoConference_SessionDelegate__session_remoteAudioEnabled_withCallID___block_invoke;
  block[3] = &unk_1E6DB76B0;
  void block[4] = self;
  BOOL v8 = a4;
  unsigned int v7 = a5;
  dispatch_async(delegateNotificationQueue, block);
}

uint64_t __74__VideoConference_SessionDelegate__session_remoteAudioEnabled_withCallID___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 44);
    uint64_t v6 = *(unsigned int *)(a1 + 40);
    return [v3 videoConference:v4 remoteAudioEnabled:v5 forCallID:v6];
  }
  return result;
}

- (void)session:(id)a3 localAudioEnabled:(BOOL)a4 withCallID:(unsigned int)a5 error:(id)a6
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  delegateNotificationQueue = self->delegateNotificationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__VideoConference_SessionDelegate__session_localAudioEnabled_withCallID_error___block_invoke;
  void v7[3] = &unk_1E6DB7728;
  BOOL v9 = a4;
  unsigned int v8 = a5;
  void v7[4] = self;
  v7[5] = a6;
  dispatch_async(delegateNotificationQueue, v7);
}

uint64_t __79__VideoConference_SessionDelegate__session_localAudioEnabled_withCallID_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(unsigned __int8 *)(a1 + 52);
    uint64_t v5 = *(unsigned int *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    return [v3 videoConference:v6 localAudioEnabled:v4 forCallID:v5 error:v7];
  }
  return result;
}

- (void)session:(id)a3 remoteCallingModeChanged:(unsigned int)a4 withCallID:(unsigned int)a5
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  delegateNotificationQueue = self->delegateNotificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__VideoConference_SessionDelegate__session_remoteCallingModeChanged_withCallID___block_invoke;
  block[3] = &unk_1E6DB4568;
  void block[4] = self;
  unsigned int v7 = a4;
  unsigned int v8 = a5;
  dispatch_async(delegateNotificationQueue, block);
}

uint64_t __80__VideoConference_SessionDelegate__session_remoteCallingModeChanged_withCallID___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(unsigned int *)(a1 + 40);
    uint64_t v6 = *(unsigned int *)(a1 + 44);
    return [v3 videoConference:v4 remoteCallingModeChanged:v5 forCallID:v6];
  }
  return result;
}

- (void)setBWEOptions:(BOOL)a3 UseNewBWEMode:(BOOL)a4 FakeLargeFrameMode:(BOOL)a5 ProbingSenderLog:(BOOL)a6
{
  self->bweOperatingModeInitialized = a3;
  self->useNewBWEMode = a4;
  self->useFakeLargeFrameMode = a5;
  self->useActiveProbingSenderLog = a6;
}

- (int)currentCameraID
{
  return self->currentCamera;
}

- (void)session:(id)a3 changeVideoRulesToCaptureRule:(id)a4 encodeRule:(id)a5 featureListString:(id)a6
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  int v11 = [a4 iWidth];
  if ([a4 iHeight] * v11 == 130560)
  {
    [a4 fRate];
    objc_msgSend(a4, "setFrameWidth:frameHeight:frameRate:", 1280, 720);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    uint32_t v13 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v31 = [a4 iWidth];
      int v30 = [a4 iHeight];
      [a4 fRate];
      double v15 = v14;
      [a4 fPref];
      double v17 = v16;
      int v29 = [a4 iPayload];
      int v18 = [a5 iWidth];
      int v19 = [a5 iHeight];
      [a5 fRate];
      double v21 = v20;
      [a5 fPref];
      *(_DWORD *)$3CC8671D27C23BF42ADDB32F2B5E48AE buf = 136318466;
      uint64_t v33 = v12;
      __int16 v34 = 2080;
      int v35 = "-[VideoConference(SessionDelegate) session:changeVideoRulesToCaptureRule:encodeRule:featureListString:]";
      __int16 v36 = 1024;
      int v37 = 4066;
      __int16 v38 = 1024;
      int v39 = v31;
      __int16 v40 = 1024;
      int v41 = v30;
      __int16 v42 = 2048;
      double v43 = v15;
      __int16 v44 = 2048;
      double v45 = v17;
      __int16 v46 = 1024;
      int v47 = v29;
      __int16 v48 = 1024;
      int v49 = v18;
      __int16 v50 = 1024;
      int v51 = v19;
      __int16 v52 = 2048;
      double v53 = v21;
      __int16 v54 = 2048;
      double v55 = v22;
      __int16 v56 = 1024;
      int v57 = [a5 iPayload];
      __int16 v58 = 2080;
      uint64_t v59 = [a6 UTF8String];
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d VideoConference: schedule camera change, resolution change with new capture rule = %dx%dx%.1ffps(%.1f, %d), new encode rule = %dx%dx%.1ffps(%.1f, %d), featureListString %s", buf, 0x72u);
    }
  }
  if ([(VCMediaRecorder *)self->_vcMediaRecorder isActive])
  {
    [a4 setFrameWidth:0 frameHeight:0 frameRate:0.0];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v23 = VRTraceErrorLogLevelToCSTR();
      int v24 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)$3CC8671D27C23BF42ADDB32F2B5E48AE buf = 136315650;
        uint64_t v33 = v23;
        __int16 v34 = 2080;
        int v35 = "-[VideoConference(SessionDelegate) session:changeVideoRulesToCaptureRule:encodeRule:featureListString:]";
        __int16 v36 = 1024;
        int v37 = 4069;
        _os_log_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d VideoConference: captureRule reset for VCMoments", buf, 0x1Cu);
      }
    }
  }
  if (a4) {
    [(CameraConferenceSynchronizer *)self->synchronizer scheduleCameraChangeToCaptureSettings:a4];
  }
  if (a5 && a6) {
    [a3 processResolutionChangeToVideoRule:a5 captureRule:a4 featureListString:a6];
  }
  uint64_t v25 = [a3 negotiatedReceivingFramerate];
  if (v25)
  {
    uint64_t v26 = v25;
    [(VCImageQueue *)self->frontQueue setFrameRate:v25];
    [(VCImageQueue *)self->backQueue setFrameRate:v26];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v27 = VRTraceErrorLogLevelToCSTR();
      long long v28 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)$3CC8671D27C23BF42ADDB32F2B5E48AE buf = 136315906;
        uint64_t v33 = v27;
        __int16 v34 = 2080;
        int v35 = "-[VideoConference(SessionDelegate) session:changeVideoRulesToCaptureRule:encodeRule:featureListString:]";
        __int16 v36 = 1024;
        int v37 = 4085;
        __int16 v38 = 1024;
        int v39 = v26;
        _os_log_impl(&dword_1E1EA4000, v28, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d reset receiving framerate for remote queue: %dfps", buf, 0x22u);
      }
    }
  }
}

- (void)session:(id)a3 startAudioWithFarEndVersionInfo:(VoiceIOFarEndVersionInfo *)a4 internalFrameFormat:(const tagVCAudioFrameFormat *)a5 completionHandler:(id)a6
{
  v16[6] = *MEMORY[0x1E4F143B8];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __114__VideoConference_SessionDelegate__session_startAudioWithFarEndVersionInfo_internalFrameFormat_completionHandler___block_invoke;
  v16[3] = &unk_1E6DB5860;
  v16[4] = self;
  v16[5] = a6;
  id v11 = (id)[v16 copy];
  uint64_t v15 = 0;
  [(VideoConference *)self rdlock];
  if ([(NSMutableArray *)self->_startedSessions containsObject:a3])
  {
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", &v15, 32012, 7, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VideoConference.m", 4114), @"Could not start audio.", @"Audio is already running");
    [(VideoConference *)self unlock];
    goto LABEL_4;
  }
  uint64_t v12 = [(NSMutableArray *)self->_startedSessions count];
  [(NSMutableArray *)self->_startedSessions addObject:a3];
  [(VideoConference *)self unlock];
  if (v12)
  {
LABEL_4:
    if (a6) {
      (*((void (**)(id, BOOL))a6 + 2))(a6, v15 == 0);
    }
    return;
  }
  [(VCAudioIO *)self->_audioIO setClientFormat:a5];
  VCAudioBufferList_AllocateFrame((uint64_t)a5, &self->_sourceBuffer);
  VCAudioBufferList_AllocateFrame((uint64_t)a5, &self->_sinkBufferMix);
  VCAudioBufferList_AllocateFrame((uint64_t)a5, &self->_sinkBuffer);
  [(VCAudioIO *)self->_audioIO setFarEndVersionInfo:a4];
  if ([a3 basebandCodecType] && objc_msgSend(a3, "basebandCodecSampleRate"))
  {
    audioIO = self->_audioIO;
    uint64_t v14 = CStrToFourcc((char *)objc_msgSend((id)objc_msgSend(a3, "basebandCodecType"), "UTF8String"));
    objc_msgSend((id)objc_msgSend(a3, "basebandCodecSampleRate"), "doubleValue");
    -[VCAudioIO setRemoteCodecType:sampleRate:](audioIO, "setRemoteCodecType:sampleRate:", v14);
  }
  [(VCAudioIO *)self->_audioIO startWithCompletionHandler:v11];
}

uint64_t __114__VideoConference_SessionDelegate__session_startAudioWithFarEndVersionInfo_internalFrameFormat_completionHandler___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    VCAudioBufferList_Destroy((uint64_t *)(*(void *)(a1 + 32) + 200));
    VCAudioBufferList_Destroy((uint64_t *)(*(void *)(a1 + 32) + 216));
    VCAudioBufferList_Destroy((uint64_t *)(*(void *)(a1 + 32) + 208));
    [*(id *)(*(void *)(a1 + 32) + 448) removeAllObjects];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)session:(id)a3 stopAudioWithCompletionHandler:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __75__VideoConference_SessionDelegate__session_stopAudioWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E6DB5860;
  v9[4] = self;
  v9[5] = a4;
  [(VideoConference *)self rdlock];
  if (([(NSMutableArray *)self->_startedSessions containsObject:a3] & 1) == 0)
  {
    uint64_t v10 = *MEMORY[0x1E4F28588];
    v11[0] = @"Stopping audio session but session wasn't started";
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"VideoConference", -2, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1));
    [(VideoConference *)self unlock];
    if (!a4) {
      return;
    }
    goto LABEL_6;
  }
  [(NSMutableArray *)self->_startedSessions removeObject:a3];
  uint64_t v7 = [(NSMutableArray *)self->_startedSessions count];
  [(VideoConference *)self unlock];
  if (!v7)
  {
    [(VCAudioIO *)self->_audioIO stopWithCompletionHandler:v9];
    return;
  }
  uint64_t v8 = 0;
  if (a4) {
LABEL_6:
  }
    (*((void (**)(id, uint64_t, uint64_t))a4 + 2))(a4, 1, v8);
}

uint64_t __75__VideoConference_SessionDelegate__session_stopAudioWithCompletionHandler___block_invoke(uint64_t a1)
{
  VCAudioBufferList_Destroy((uint64_t *)(*(void *)(a1 + 32) + 200));
  VCAudioBufferList_Destroy((uint64_t *)(*(void *)(a1 + 32) + 216));
  VCAudioBufferList_Destroy((uint64_t *)(*(void *)(a1 + 32) + 208));
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)session:(id)a3 setRemoteBasebandCodecType:(unsigned int)a4 sampleRate:(double)a5
{
}

- (AudioStreamBasicDescription)audioIOFormat
{
  uint64_t result = [(VCAudioIO *)self->_audioIO clientFormat];
  long long v5 = *(_OWORD *)&result->mBytesPerPacket;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&result->mSampleRate;
  *(_OWORD *)&retstr->mBytesPerPacket = v5;
  *(void *)&retstr->mBitsPerChannel = *(void *)&result->mBitsPerChannel;
  return result;
}

- (void)session:(id)a3 setMomentsCapabilities:(unsigned int)a4 imageType:(int)a5 videoCodec:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  [(VCMediaRecorder *)self->_vcMediaRecorder setCapabilities:*(void *)&a4];
  [(VCMediaRecorder *)self->_vcMediaRecorder setVideoCodec:v6];
  vcMediaRecorder = self->_vcMediaRecorder;

  [(VCMediaRecorder *)vcMediaRecorder setImageType:v7];
}

- (unsigned)momentsCapabilitiesWithNegotiationBlobMomentsSettings_Capabilities:(int)a3
{
  if (a3 == 4) {
    unsigned int v3 = 7;
  }
  else {
    unsigned int v3 = 0;
  }
  if (a3 == 2) {
    return 1;
  }
  else {
    return v3;
  }
}

- (void)session:(id)a3 didReceiveMomentsRequest:(id)a4
{
}

- (id)clientCaptureRule
{
  return self->conferenceCaptureRule;
}

- (BOOL)initiateResolutionChangeToWidth:(int)a3 height:(int)a4 rate:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  uint64_t v10 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule >= 5)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    uint64_t v12 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136316418;
      uint64_t v18 = v11;
      __int16 v19 = 2080;
      float v20 = "-[VideoConference(VideoProcessing) initiateResolutionChangeToWidth:height:rate:]";
      __int16 v21 = 1024;
      int v22 = 4218;
      __int16 v23 = 1024;
      int v24 = v7;
      __int16 v25 = 1024;
      int v26 = v6;
      __int16 v27 = 1024;
      int v28 = v5;
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d VideoConference:initiateResolutionChange:  %dx%d@%dfps", (uint8_t *)&v17, 0x2Eu);
    }
  }
  objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "setCaptureWidth:height:rate:", v7, v6, v5);
  *(float *)&double v13 = (float)(int)v5;
  [(VCVideoRule *)self->conferenceCaptureRule setFrameWidth:v7 frameHeight:v6 frameRate:v13];
  if ((int)VRTraceGetErrorLogLevelForModule() > 5)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    uint64_t v15 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315650;
      uint64_t v18 = v14;
      __int16 v19 = 2080;
      float v20 = "-[VideoConference(VideoProcessing) initiateResolutionChangeToWidth:height:rate:]";
      __int16 v21 = 1024;
      int v22 = 4224;
      _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d video-resolution-change", (uint8_t *)&v17, 0x1Cu);
    }
  }
  return 1;
}

- (BOOL)onVideoFrame:(opaqueCMSampleBuffer *)a3 frameTime:(id *)a4 attribute:(id *)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (self->_deviceRole == 3) {
    return 1;
  }
  uint64_t v7 = self;
  uint64_t var6 = a5->var6;
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  v7->localFrameWidth = CVPixelBufferGetWidth(ImageBuffer);
  v7->localFrameHeight = CVPixelBufferGetHeight(ImageBuffer);
  VCMediaRecorder_AddLocalVideoSampleBuffer((uint64_t)v7->_vcMediaRecorder, a3, var6, v7->dwAudioTS);
  -[CameraConferenceSynchronizer cameraSizeChangedTo:](v7->synchronizer, "cameraSizeChangedTo:", (double)v7->localFrameWidth, (double)v7->localFrameHeight);
  if (v7->dAudioHostTime == 0.0) {
    return 1;
  }
  pthread_mutex_lock(&v7->xAudioTS);
  uint64_t dwAudioTS = v7->dwAudioTS;
  dAudiodouble HostTime = v7->dAudioHostTime;
  pthread_mutex_unlock(&v7->xAudioTS);
  uint64_t currentCamera = v7->currentCamera;
  unsigned int v15 = (var6 >> 3) & 1;
  if (currentCamera != v15) {
    v7->uint64_t currentCamera = v15;
  }
  if ([(VideoConference *)v7 tryrdlock])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VideoConference(VideoProcessing) onVideoFrame:frameTime:attribute:]();
      }
    }
    return 0;
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    obj = v7->_sessionArray;
    uint64_t v16 = [(NSArray *)obj countByEnumeratingWithState:&v27 objects:v26 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      int v22 = v7;
      uint64_t v18 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v28 != v18) {
            objc_enumerationMutation(obj);
          }
          float v20 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if (currentCamera != v15) {
            [*(id *)(*((void *)&v27 + 1) + 8 * i) localCameraSwitchedFrom:currentCamera to:v22->currentCamera];
          }
          long long v24 = *(_OWORD *)&a4->var0;
          int64_t var3 = a4->var3;
          char v21 = [v20 onCaptureFrame:a3 audioTS:dwAudioTS audioHT:&v24 videoHT:var6 cameraBits:dAudioHostTime];
        }
        BOOL v10 = v21;
        uint64_t v17 = [(NSArray *)obj countByEnumeratingWithState:&v27 objects:v26 count:16];
      }
      while (v17);
      uint64_t v7 = v22;
    }
    else
    {
      BOOL v10 = 0;
    }
    [(VideoConference *)v7 unlock];
  }
  return v10;
}

- (void)avConferencePreviewError:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1E4E589F0](self, a2);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VideoConference(VideoProcessing) avConferencePreviewError:]();
    }
  }
  v7[0] = 0;
  if ([a3 isEqualToString:@"avCaptureStartPreviewFail"])
  {
    uint64_t v6 = 107;
  }
  else if ([a3 isEqualToString:@"avCaptureStartCaptureFail"])
  {
    uint64_t v6 = 109;
  }
  else if ([a3 isEqualToString:@"avCaptureStopFail"])
  {
    uint64_t v6 = 108;
  }
  else
  {
    uint64_t v6 = 113;
  }
  +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", v7, 32023, v6, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VideoConference.m", 4323), @"Camera failure", a3);
  [(VideoConference *)self stopAllCalls:v7[0]];
  [(CameraConferenceSynchronizer *)self->synchronizer reset];
}

- (void)avConferenceScreenCaptureError:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1E4E589F0](self, a2);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
  {
    VRTraceErrorLogLevelToCSTR();
    if (VRTraceIsOSFaultDisabled())
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VideoConference(VideoProcessing) avConferenceScreenCaptureError:]();
      }
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
    {
      -[VideoConference(VideoProcessing) avConferenceScreenCaptureError:]();
    }
  }
  v7[0] = 0;
  if ([a3 isEqualToString:@"vcScreenCaptureFailStart"])
  {
    uint64_t v6 = 109;
  }
  else if ([a3 isEqualToString:@"vcScreenCaptureFailPreempt"])
  {
    uint64_t v6 = 114;
  }
  else
  {
    uint64_t v6 = 113;
  }
  +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", v7, 32029, v6, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VideoConference.m", 4349), @"SreenCapture failure", a3);
  [(VideoConference *)self stopAllCalls:v7[0]];
  [(CameraConferenceSynchronizer *)self->synchronizer reset];
}

- (void)shouldSendBlackFrame:(BOOL)a3 callID:(id)a4
{
  BOOL v4 = a3;
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_sessionDict objectForKeyedSubscript:a4];

  [v5 shouldSendBlackFrame:v4];
}

- (void)setConferenceState:(unsigned int)a3 forCallID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  [(VideoConference *)self rdlock];
  id v7 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v4]);
  [(VideoConference *)self unlock];

  [v7 setSessionConferenceState:v5 callID:v4];
}

- (void)setConferenceVisualRectangle:(CGRect)a3 forCallID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(VideoConference *)self rdlock];
  id v10 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v4]);
  [(VideoConference *)self unlock];

  objc_msgSend(v10, "setSessionConferenceVisualRectangle:callID:", v4, x, y, width, height);
}

- (void)thermalLevelDidChange:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(VideoConference *)self rdlock];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_sessionArray];
  [(VideoConference *)self unlock];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v9++) thermalLevelDidChange:v3];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v10 count:16];
    }
    while (v7);
  }
}

- (void)cameraAvailabilityDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(VideoConference *)self rdlock];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_sessionArray];
  [(VideoConference *)self unlock];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
        if (v3) {
          [v10 setResumeVideo];
        }
        else {
          [v10 setSuspendVideo];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v11 count:16];
    }
    while (v7);
  }
}

- (void)triggerInterfaceChange
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [(VideoConference *)self rdlock];
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_sessionArray];
  [(VideoConference *)self unlock];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)$3CC8671D27C23BF42ADDB32F2B5E48AE buf = 136315650;
      uint64_t v16 = v4;
      __int16 v17 = 2080;
      uint64_t v18 = "-[VideoConference(NATDelegate) triggerInterfaceChange]";
      __int16 v19 = 1024;
      int v20 = 4432;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d Forced interface change", buf, 0x1Cu);
    }
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = [v3 countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v9++) triggerInterfaceChange];
      }
      while (v7 != v9);
      uint64_t v7 = [v3 countByEnumeratingWithState:&v11 objects:v10 count:16];
    }
    while (v7);
  }
}

- (void)NATTypeDictionaryUpdated:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  p_natMutedouble x = &self->natMutex;
  pthread_mutex_lock(&self->natMutex);

  self->natTypeDictionardouble y = (NSDictionary *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:a3];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = BYTE5(self->recvRTPTimeStamp.epoch);
      natTypeDictionardouble y = self->natTypeDictionary;
      if (natTypeDictionary) {
        id v10 = [(NSString *)[(NSDictionary *)natTypeDictionary description] UTF8String];
      }
      else {
        id v10 = "<nil>";
      }
      *(_DWORD *)$3CC8671D27C23BF42ADDB32F2B5E48AE buf = 136316162;
      uint64_t v16 = v6;
      __int16 v17 = 2080;
      uint64_t v18 = "-[VideoConference(NATDelegate) NATTypeDictionaryUpdated:]";
      __int16 v19 = 1024;
      int v20 = 4446;
      __int16 v21 = 1024;
      int v22 = v8;
      __int16 v23 = 2080;
      long long v24 = v10;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d NATTypeDictionaryUpdated: requiresWifi: %d  natTypeDictionary %s", buf, 0x2Cu);
    }
  }
  pthread_mutex_unlock(p_natMutex);
  int v11 = [(VideoConference *)self natTypeForCallSessions:"NATTypeDictionaryUpdated"];
  global_queue = dispatch_get_global_queue(0, 0);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__VideoConference_NATDelegate__NATTypeDictionaryUpdated___block_invoke;
  v13[3] = &unk_1E6DB3F08;
  v13[4] = self;
  int v14 = v11;
  dispatch_async(global_queue, v13);
}

void __57__VideoConference_NATDelegate__NATTypeDictionaryUpdated___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) rdlock];
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:*(void *)(*(void *)(a1 + 32) + 440)];
  [*(id *)(a1 + 32) unlock];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v32 objects:v31 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = "VideoConference";
    uint64_t v7 = (os_log_t *)MEMORY[0x1E4F47A50];
    uint64_t v8 = *(void *)v33;
    *(void *)&long long v4 = 136316162;
    long long v19 = v4;
    do
    {
      uint64_t v9 = 0;
      uint64_t v20 = v5;
      do
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v2);
        }
        id v10 = *(void **)(*((void *)&v32 + 1) + 8 * v9);
        objc_msgSend(v10, "setNatType:", *(unsigned int *)(a1 + 40), v19);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v11 = VRTraceErrorLogLevelToCSTR();
          long long v12 = *v7;
          if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v13 = v8;
            int v14 = v6;
            long long v15 = v2;
            uint64_t v16 = v7;
            int v17 = *(_DWORD *)(a1 + 40);
            int v18 = [v10 callID];
            *(_DWORD *)$3CC8671D27C23BF42ADDB32F2B5E48AE buf = v19;
            uint64_t v22 = v11;
            __int16 v23 = 2080;
            long long v24 = "-[VideoConference(NATDelegate) NATTypeDictionaryUpdated:]_block_invoke";
            __int16 v25 = 1024;
            int v26 = 4464;
            __int16 v27 = 1024;
            int v28 = v17;
            uint64_t v7 = v16;
            uint64_t v2 = v15;
            uint64_t v6 = v14;
            uint64_t v8 = v13;
            uint64_t v5 = v20;
            __int16 v29 = 1024;
            int v30 = v18;
            _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d Setting natType %d for callID %d", buf, 0x28u);
          }
        }
        ++v9;
      }
      while (v5 != v9);
      uint64_t v5 = [v2 countByEnumeratingWithState:&v32 objects:v31 count:16];
    }
    while (v5);
  }
}

void __35__VideoConference_setupNATObserver__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VideoConference [%s] %s:%d Something is wrong with getting the snatmapserver", v2, v3, v4, v5, v6);
}

- (void)inviteDataForParticipantID:callID:remoteInviteData:nonCellularCandidateTimeout:error:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VideoConference [%s] %s:%d Error to verify loaded Server Bags %@");
}

- (void)updateCapabilities:forSession:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VideoConference [%s] %s:%d audio for the session should not be running", v2, v3, v4, v5, v6);
}

- (void)updateCapabilities:forSession:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VideoConference [%s] %s:%d registerForVideoFramesWithDeviceRole failed; self = %p",
    v2,
    v3,
    v4,
    v5);
}

- (void)updateCapabilities:forSession:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VideoConference [%s] %s:%d deregisterForVideoFramesWithDeviceRole failed; self = %p",
    v2,
    v3,
    v4,
    v5);
}

- (void)setUpAudioIO:callID:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VideoConference [%s] %s:%d _startedSessions is not empty", v2, v3, v4, v5, v6);
}

- (void)setupSpatialAudioWithCallID:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VideoConference [%s] %s:%d Failed to create the spatial metadata. status=%08x", v2, v3, v4, v5);
}

- (void)setupSpatialAudioWithCallID:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VideoConference [%s] %s:%d Failed to allocate spatial metadata entry. status=%08x", v2, v3, v4, v5);
}

- (void)setupSpatialAudioWithCallID:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VideoConference [%s] %s:%d Failed to retrieve the channel index. status=%08x", v2, v3, v4, v5);
}

- (void)setupSpatialAudioWithCallID:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VideoConference [%s] %s:%d Failed to register the spatial metadata. status=%08x", v2, v3, v4, v5);
}

@end