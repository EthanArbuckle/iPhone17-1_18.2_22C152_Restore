@interface VCCallSession
+ (id)getDecodePayloadTypes:(int)a3 secondaryPayloadTypes:(id)a4;
+ (id)keyPathsForValuesAffectingNetworkQuality;
+ (int)setRxPayloadList:(tagHANDLE *)a3 withPayloadTypes:(id)a4;
+ (int)setRxPayloadList:(tagHANDLE *)a3 withPayloadTypes:(id)a4 isRedEnabled:(BOOL)a5;
+ (void)stopSecureControlChannel:(id)a3;
- (BOOL)addMediaConfigurationsToLocalConfiguration:(id)a3;
- (BOOL)applyNegotiatedAudioSettings:(id *)a3;
- (BOOL)applyNegotiatedVideoSettings:(id *)a3;
- (BOOL)audioIsPaused;
- (BOOL)canNegotiateVideoPayload:(int)a3 supportedPayloads:(id)a4 isLocalOnCellular:(BOOL)a5 isRemoteOnCellular:(BOOL)a6;
- (BOOL)canSendSIPInviteWithError:(id *)a3;
- (BOOL)cancel:(id)a3;
- (BOOL)chooseDTXPayloads:(id)a3;
- (BOOL)choosePayload:(id)a3;
- (BOOL)chooseSecondaryPayloads:(id)a3;
- (BOOL)chooseVideoPayload:(id)a3 operatingMode:(int)a4 isLocalOnCellular:(BOOL)a5 isRemoteOnCellular:(BOOL)a6;
- (BOOL)chooseVideoPayloadForInterface:(int)a3;
- (BOOL)configureLegacyTransportWithInviteInfo:(id)a3 error:(id *)a4;
- (BOOL)createAudioTransmitter:(id *)a3;
- (BOOL)createMediaQueueHandle:(id *)a3;
- (BOOL)createRTPHandles:(id *)a3;
- (BOOL)createSDP:(int *)a3 audioPayloadCount:(int)a4 secondaryPayloadTypes:(int *)a5 secondaryPayloadCount:(int)a6 videoPayloadTypes:(int *)a7 videoPayloadCount:(int)a8 localFeatureList:(id)a9 answerBandwidth:(int)a10 maxBandwidth:(int)a11 imageSizesSend:(imageTag *)a12 imageSendCount:(int *)a13 imageSizesRecv:(imageTag *)a14 imageRecvCount:(int *)a15 sdp:(char *)a16 numSDPBytes:(int *)a17 error:(id *)a18;
- (BOOL)createVideoReceiverWithReportingAgent:(opaqueRTCReporting *)a3 fecHeaderV1Enabled:(BOOL)a4 videoJBEnabled:(BOOL)a5 error:(id *)a6;
- (BOOL)didSend200OK;
- (BOOL)disconnect:(id)a3 didRemoteCancel:(BOOL)a4;
- (BOOL)disconnectInternal:(BOOL)a3 disconnectError:(id)a4 didRemoteCancel:(BOOL)a5;
- (BOOL)doesVideoPayloadMatchRemoteImageAttributeRules:(id)a3;
- (BOOL)establishSIPDialogWithSDP:(id)a3 error:(id *)a4;
- (BOOL)evaluateEnableRRx:(int *)a3;
- (BOOL)getVideoSettings:(int)a3 forInterface:(int)a4 payload:(int)a5 width:(int *)a6 height:(int *)a7 framerate:(int *)a8 bitRate:(int *)a9;
- (BOOL)initializeDisplayLinkWithError:(id *)a3;
- (BOOL)initializeVideoReceiver:(id *)a3 reportingAgent:(opaqueRTCReporting *)a4 fecHeaderV1Enabled:(BOOL)a5 videoJBEnabled:(BOOL)a6;
- (BOOL)initializeVideoTransmitter:(id *)a3 videoRules:(VCCSVideoTransmitterVideoRules_t *)a4 unpausing:(BOOL)a5 reportingAgent:(opaqueRTCReporting *)a6 fecHeaderV1Enabled:(BOOL)a7 isFECGeneratorEnabled:(BOOL)a8;
- (BOOL)isAudioRunning;
- (BOOL)isBetterForSIPInviteWithSourceDestinationInfo:(tagVCSourceDestinationInfo *)a3 thanSession:(id)a4;
- (BOOL)isCallOngoing;
- (BOOL)isCaller;
- (BOOL)isCurrentPayloadTypeValid;
- (BOOL)isFECGeneratorEnabled;
- (BOOL)isGKVoiceChat;
- (BOOL)isLocalOrRemoteOnCellular;
- (BOOL)isLowBitrateCodecPreferred:(id)a3;
- (BOOL)isRTCPFBEnabled;
- (BOOL)isRemoteMediaStalled;
- (BOOL)isSIPEnabled;
- (BOOL)isSKEOptimizationEnabled;
- (BOOL)isSecureMessagingRequired;
- (BOOL)isStarted;
- (BOOL)isValidVideoPayloadOverride:(id)a3;
- (BOOL)isVideoRunning;
- (BOOL)isWaitingForICEResult;
- (BOOL)negotiateMaxBandwidth:(int *)a3;
- (BOOL)negotiatePayloads:(id *)a3 withError:(id *)a4;
- (BOOL)onCaptureFrame:(opaqueCMSampleBuffer *)a3 audioTS:(unsigned int)a4 audioHT:(double)a5 videoHT:(id *)a6 cameraBits:(unsigned __int8)a7;
- (BOOL)prepareSRTPWithError:(id *)a3;
- (BOOL)pullAudioSamples:(opaqueVCAudioBufferList *)a3 rtpTimestamp:(unsigned int *)a4 lastReceivedAudioTime:(double *)a5 padding:(char *)a6 paddingLength:(char *)a7 silence:(int *)a8;
- (BOOL)receivedSIPInvite;
- (BOOL)requiresWifi;
- (BOOL)sendSIPInviteWithError:(id *)a3;
- (BOOL)setMatchedFeaturesString:(char *)a3 localFeaturesString:(id)a4 remoteFeaturesString:(id)a5;
- (BOOL)setMediaQueueStreamSettings;
- (BOOL)setPauseAudio:(BOOL)a3 error:(id *)a4;
- (BOOL)setPauseAudio:(BOOL)a3 force:(BOOL)a4 error:(id *)a5;
- (BOOL)setPauseVideo:(BOOL)a3 error:(id *)a4;
- (BOOL)setPauseVideo:(BOOL)a3 force:(BOOL)a4 error:(id *)a5;
- (BOOL)setRTPPayloads:(id)a3 withError:(id *)a4;
- (BOOL)setupAudioCodecWithPayload:(int)a3;
- (BOOL)setupAudioCookies;
- (BOOL)setupCallerRTPChannelWithError:(id *)a3;
- (BOOL)setupIDSConnectionForCallID:(unsigned int)a3 destination:(id)a4 socket:(int)a5 error:(id *)a6;
- (BOOL)shouldNotifyDelegateDidStartBeforeAudioSetup;
- (BOOL)shouldSendAudio;
- (BOOL)shouldTimeoutPackets;
- (BOOL)sipConnectWithError:(id *)a3;
- (BOOL)startAFRC:(id *)a3;
- (BOOL)startConnectionWithParticipantID:(id)a3 callID:(unsigned int)a4 usingInviteData:(id)a5 isCaller:(BOOL)a6 capabilities:(id)a7 idsSocket:(int)a8 destination:(id)a9 error:(id *)a10;
- (BOOL)startMediaQueue:(id *)a3;
- (BOOL)startMediaWithPreNegotiatedSettings:(id *)a3;
- (BOOL)startRateControl:(id *)a3;
- (BOOL)startVCRC:(id *)a3;
- (BOOL)startVideo:(BOOL)a3 error:(id *)a4;
- (BOOL)startVideoReceive:(id *)a3;
- (BOOL)startVideoSend:(BOOL)a3 error:(id *)a4;
- (BOOL)stopMediaQueue:(id *)a3;
- (BOOL)stopRateControl:(id *)a3;
- (BOOL)stopVideo:(BOOL)a3 error:(id *)a4;
- (BOOL)stopVideoReceive:(id *)a3 isPausing:(BOOL)a4;
- (BOOL)stopVideoSend:(BOOL)a3 error:(id *)a4;
- (BOOL)treatAsCellular;
- (BOOL)useCompressedConnectionData;
- (BOOL)useControlByte;
- (BOOL)useRateControl;
- (BOOL)useUEP;
- (BOOL)videoIsPaused;
- (BOOL)videoReceiverInitializationError:(id *)a3 withDescription:(id)a4;
- (CGSize)computeVisibleAspectRatioWithRemoteScreenAspectRatio:(CGSize)a3 remoteExpectedAspectRatio:(CGSize)a4 encodeWidth:(int)a5 encodeHeight:(int)a6;
- (GKRingBuffer)ringBuf;
- (NSArray)mutedPeers;
- (NSData)srtpKeyBytes;
- (NSDictionary)dtxMetrics;
- (NSNumber)basebandCodecSampleRate;
- (NSString)basebandCodecType;
- (NSString)description;
- (NSString)peerCN;
- (NSString)peerReportingID;
- (NSString)sessionID;
- (VCAudioCaptionsDelegate)captionsDelegate;
- (VCCallInfo)localCallInfo;
- (VCCallSession)init;
- (VCCallSession)initWithDeviceRole:(int)a3 transportType:(unsigned int)a4 isGKVoiceChat:(BOOL)a5 reportingHierarchyToken:(id)a6;
- (VCCallSession)initWithRelevantStorebagEntries;
- (VCCallSessionDelegate)delegate;
- (VCCapabilities)capabilities;
- (VCConnectionManager)connectionManager;
- (VCImageAttributeRules)imageAttributeRules;
- (VideoAttributes)remoteVideoAttributes;
- (VideoConferenceChannelQualityDelegate)qualityDelegate;
- (__SecIdentity)retrieveIdentity;
- (const)matchedFeaturesStringForPayload:(int)a3;
- (double)audioReceivingBitrateKbps;
- (double)audioTransmittingBitrateKbps;
- (double)lastDecodedFrameTime;
- (double)networkConditionsTimeoutInSeconds;
- (double)networkQuality;
- (double)packetLossRate;
- (double)packetLossRate5Secs;
- (double)roundTripTime;
- (double)sessionReceivingBitrate;
- (double)sessionReceivingFramerate;
- (double)sessionTransmittingBitrate;
- (double)sessionTransmittingFramerate;
- (float)packetLateAndMissingRatio;
- (id)activeControlChannel;
- (id)addAudioPayload:(int)a3;
- (id)allPayloadsLocalFeaturesString;
- (id)callMetadata;
- (id)createInviteSDPWithError:(id *)a3;
- (id)getCompatibleLocalFeatureListForPayloads:(int *)a3 count:(int)a4;
- (id)getFeatureListStringForPayload:(int)a3;
- (id)getVideoRuleForVideoMode:(unint64_t)a3 interface:(int)a4 sessionBitrate:(int *)a5;
- (id)inviteDataForParticipantID:(id)a3 callID:(unsigned int *)a4 remoteInviteData:(id)a5 nonCellularCandidateTimeout:(double)a6 error:(id *)a7;
- (id)localParticipantID;
- (id)negotiatedAudioPayloadTypes;
- (id)newCameraConfiguration;
- (id)newConfigForPayloadType:(int)a3;
- (id)newMediaBlobWithRemoteMediaBlob:(id)a3 localCallID:(unsigned int)a4 isLowBitrateCodecPreferred:(BOOL)a5;
- (id)newMediaNegotiatorAudioConfigurationWithAllowAudioSwitching:(BOOL)a3 useSBR:(BOOL)a4 aacBlockSize:(unsigned int)a5;
- (id)newRemoteScreenAttributesForOrientation:(int)a3;
- (id)newSKEBlobWithRemoteSKEBlob:(id)a3;
- (id)newScreenConfigurationWithCameraConfiguration:(id)a3;
- (id)pickFeaturesStringForPayload:(int)a3 featureListDict:(id)a4 remote:(BOOL)a5;
- (id)remoteParticipantID;
- (id)vcrcServerBag;
- (int)Conference_SetBWEstMode:(BOOL)a3 bFakeLargeFrameMode:(BOOL)a4;
- (int)applyFeatureListStringForPayload:(int)a3;
- (int)audioTierAudioCodecBitrate;
- (int)audioTierNetworkBitrate;
- (int)audioTierPacketsPerBundle;
- (int)audioTierPayload;
- (int)audioTierRedNumPayloads;
- (int)bandwidthDownstream;
- (int)bandwidthUpstream;
- (int)bundledPackets;
- (int)deviceRole;
- (int)fillMediaControlInfo:(void *)a3;
- (int)flushBasebandQueueWithPayloads:(id)a3 flushCount:(unsigned int *)a4;
- (int)getAllCompatibleVideoPayloads:(int *)a3 forMediaType:(int)a4;
- (int)getAudioTxBitrate;
- (int)handleIncomingWithCallID:(unsigned int)a3 msgIn:(const char *)a4 msgOut:(char *)a5 optional:(void *)a6 confIndex:(int *)a7 error:(id *)a8;
- (int)interfaceForCurrentCall;
- (int)learntBitrateForSegment:(id)a3 defaultValue:(int)a4;
- (int)mapPacketMultiplexModeToRTPMode:(int64_t)a3;
- (int)mapPacketMultiplexModeToSIPMode:(int64_t)a3;
- (int)natType;
- (int)negotiatedReceivingFramerate;
- (int)numBufferBytesAvailable;
- (int)operatingMode;
- (int)packetsPerBundle;
- (int)preferredAudioCodec;
- (int)processMediaControlInfo:(void *)a3 isAudio:(BOOL)a4;
- (int)setSKEBlobOnTransportSession;
- (int)setupEncryptionWithKey:(const __CFData *)a3 confIndex:(int *)a4;
- (int)signalStrengthBars;
- (int)signalStrengthDisplayBars;
- (int)signalStrengthMaxDisplayBars;
- (int)sipCallback:(int)a3 callID:(unsigned int)a4 msgIn:(const char *)a5 msgOut:(char *)a6 optional:(void *)a7 confIndex:(int *)a8;
- (int64_t)calculateSIPEndAction:(BOOL)a3 currentState:(int64_t)a4 error:(id)a5;
- (int64_t)connectionChangeState;
- (int64_t)getCurrentMicMode;
- (int64_t)sampleRate;
- (int64_t)sipState;
- (int64_t)state;
- (int64_t)videoPayload;
- (opaqueRTCReporting)reportingAgent;
- (tagHANDLE)hAFRC;
- (tagHANDLE)hMediaQueue;
- (tagHANDLE)rtpHandle;
- (tagVCAudioReceiver)audioReceiver;
- (unsigned)audioRTPID;
- (unsigned)callID;
- (unsigned)codecBitmapForPayloads:(id)a3;
- (unsigned)currentAudioCap;
- (unsigned)defaultMediaControlInfoFECFeedbackVersion;
- (unsigned)inputMeter;
- (unsigned)lastReceived;
- (unsigned)lastSentAudioSampleTime;
- (unsigned)maxBitrateForConnectionType;
- (unsigned)maxPacketLength;
- (unsigned)mediaControlInfoFECFeedbackVersion;
- (unsigned)parameterSetForPayload:(int)a3;
- (unsigned)primaryConnectionType;
- (unsigned)remoteFrameHeight;
- (unsigned)remoteFrameWidth;
- (unsigned)vcrcServerBagProfileNumber;
- (unsigned)videoRTPID;
- (void)addLocalCallInfoToInviteDictionary:(id)a3;
- (void)addScreenConfigToSDP:(id)a3;
- (void)adjustBitrateForConnectionType;
- (void)applyNegotiatedCaptionsSettings;
- (void)applyNegotiatedFaceTimeSettings;
- (void)applyNegotiatedMediaRecorderSettings;
- (void)applyNegotiatedSettings;
- (void)cancelConnectionTimeoutTimer;
- (void)cancelFirstRemoteFrameTimer;
- (void)checkAbnormalOWRDAndResetLagReference;
- (void)checkAndReportThermalIncreaseAudioOnly:(int)a3;
- (void)cleanUpDisplayLink;
- (void)cleanUpVideoRTP;
- (void)cleanUpVideoReceiver;
- (void)cleanUpVideoTransmitter;
- (void)cleanupMedia;
- (void)cleanupWCMClient;
- (void)cleanupWRMClient;
- (void)configureRateController;
- (void)controlChannel:(id)a3 receivedData:(id)a4 transactionID:(unsigned int)a5 fromParticipant:(id)a6;
- (void)dealloc;
- (void)deregisterForReportingNotifications;
- (void)disableSessionHealthMonitor;
- (void)disconnectWithNoRemotePackets:(int64_t)a3;
- (void)disconnectWithNoRemotePackets:(int64_t)a3 timeoutUsed:(double)a4;
- (void)doSipEndAction:(int)a3 callID:(unsigned int)a4 error:(id)a5;
- (void)doSipEndProc:(id)a3;
- (void)enableAudio:(BOOL)a3;
- (void)enableSessionHealthMonitor;
- (void)gatherRealtimeStats:(__CFDictionary *)a3;
- (void)getAllPayloadsForAudio:(int *)a3 count:(int *)a4 secondaryPayloads:(int *)a5 secondaryCount:(int *)a6;
- (void)getAllPayloadsForScreen:(int *)a3 count:(int *)a4;
- (void)getAllPayloadsForVideo:(int *)a3 count:(int *)a4;
- (void)getFrontCaptureTime:(float *)a3 backCaptureTime:(float *)a4;
- (void)getVideoFeatureStatusSettings:(tagVCReportingClientSettingsPersist *)a3;
- (void)handleCellTechChange:(int)a3;
- (void)handleCellularMTUChanged:(unsigned __int16)a3;
- (void)handleDuplicationEnabled:(BOOL)a3 activeConnection:(id)a4;
- (void)handleFirstConnectionSetup:(id)a3;
- (void)handleKeyExchangeCompleted;
- (void)handleMediaReceivedOverPeerToPeerLinkWithConnectionId:(int)a3;
- (void)handleMediaReceivedOverRelayLinkWithConnectionId:(int)a3;
- (void)handleMicModeNotification:(id)a3;
- (void)handleNewConnectionSetup:(id)a3 isInitialConnection:(BOOL)a4;
- (void)handlePendingPrimaryConnectionChange;
- (void)handleReceivedPiggybackBlobIDS:(id)a3;
- (void)handleReceivedPiggybackBlobLegacy:(id)a3;
- (void)handleThermalPressureNotification:(id)a3;
- (void)handleVideoReceiverInitializationFailed;
- (void)localCameraSwitchedFrom:(int)a3 to:(int)a4;
- (void)lock;
- (void)logConnectionSuccess;
- (void)logDetailedNetworkInformation;
- (void)logIdentity:(__SecIdentity *)a3;
- (void)logPerfTimings;
- (void)mediaController:(void *)a3 mediaSuggestionDidChange:(VCRateControlMediaSuggestion)a4;
- (void)messageVCMomentsRequest:(id)a3;
- (void)negotiateFeaturesString:(id)a3 forPayload:(int)a4;
- (void)negotiateMediaMaxBandwidth;
- (void)negotiatedReceivingFramerate;
- (void)newCameraConfiguration;
- (void)nofityDelegateReceivedRemoteFrame:(__CVBuffer *)a3 frameTime:(id *)a4 cameraStatusBits:(unsigned __int8)a5 newRemoteVideoAttributes:(id)a6 remoteScreenAttributes:(id)a7;
- (void)notifyDelegateActiveConnectionDidChange;
- (void)notifyDelegateAndEndCall:(int64_t)a3 didRemoteCancel:(BOOL)a4 error:(id)a5;
- (void)notifyDelegateSessionStarted;
- (void)onPlayVideo:(__CVBuffer *)a3 frameTime:(id *)a4 cameraStatusBits:(unsigned __int8)a5;
- (void)packMeters:(char *)a3 withLength:(char *)a4;
- (void)primaryConnectionDidChangeTo:(id)a3 oldConnection:(id)a4;
- (void)processBlackFrame:(opaqueCMSampleBuffer *)a3;
- (void)processCancelRelayRequest:(id)a3 didOriginateRequest:(BOOL)a4;
- (void)processRelayRequestResponseDict:(id)a3 didOriginateRequest:(BOOL)a4;
- (void)processRelayUpdateDict:(id)a3 didOriginateRequest:(BOOL)a4;
- (void)processRemoteIPChange:(id)a3 callID:(unsigned int)a4;
- (void)processResolutionChangeToVideoRule:(id)a3 captureRule:(id)a4 featureListString:(id)a5;
- (void)processSIPMessage:(char *)a3 msgOut:(char *)a4 optional:(void *)a5 confIndex:(int *)a6;
- (void)processSymptomFromMessage:(id)a3 participantID:(id)a4 isLocalInitiated:(BOOL)a5 isLocalSideOnly:(BOOL)a6;
- (void)pushAudioSamples:(opaqueVCAudioBufferList *)a3;
- (void)rateController:(id)a3 targetBitrateDidChange:(unsigned int)a4 rateChangeCounter:(unsigned int)a5;
- (void)rcvdFirstRemoteFrame;
- (void)redundancyController:(id)a3 redundancyPercentageDidChange:(unsigned int)a4;
- (void)redundancyController:(id)a3 redundancyVectorDidChange:(id *)a4;
- (void)registerForReportingNotifications;
- (void)releaseRTPHandles;
- (void)remoteCellTechStateUpdate:(int)a3 maxRemoteBitrate:(unsigned int)a4;
- (void)remotePauseDidChangeToState:(BOOL)a3 forVideo:(BOOL)a4;
- (void)reportClientPersistentSettings;
- (void)reportDashboardEndResult:(BOOL)a3;
- (void)reportHandoverResultsWithDictionary:(id)a3 localBitrateCap:(int)a4 remoteBitrateCap:(int)a5;
- (void)reportImmediateWRMMetric:(int)a3 value:(unint64_t)a4;
- (void)reportOperatingMode;
- (void)reportSymptom:(unsigned int)a3;
- (void)reportWRMMetrics:(id *)a3;
- (void)reportingMomentsWithRequest:(id)a3;
- (void)requestWRMNotification;
- (void)resetState;
- (void)resetVideoRulesForInterface:(int)a3 videoReportingDictionary:(id)a4;
- (void)schedulePrimaryConnectionChange:(id)a3 oldConnection:(id)a4;
- (void)sendARPLData:(id)a3 toCallID:(unsigned int)a4;
- (void)sendBasebandCodecMessage;
- (void)sendCallingModeMessage;
- (void)sendData:(id)a3 messageType:(unsigned int)a4 encrypted:(BOOL)a5;
- (void)sendSymptomToRemote:(id)a3 groupID:(id)a4;
- (void)sendTimings;
- (void)sendWRMStatusUpdate:(id *)a3;
- (void)setBandwidthDownstream:(int)a3;
- (void)setBandwidthUpstream:(int)a3;
- (void)setBasebandCodecSampleRate:(id)a3;
- (void)setBasebandCodecType:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setCaptionsDelegate:(id)a3;
- (void)setConnectionChangeState:(int64_t)a3;
- (void)setConnectionManager:(id)a3;
- (void)setCurrentEncodeRule:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceRole:(int)a3;
- (void)setDidSend200OK:(BOOL)a3;
- (void)setDuplicationFlag:(BOOL)a3 withPreferredLocalLinkTypeForDuplication:(int)a4 notifyPeer:(BOOL)a5;
- (void)setHAFRC:(tagHANDLE *)a3;
- (void)setHMediaQueue:(tagHANDLE *)a3;
- (void)setImageAttributeRules:(id)a3;
- (void)setInputMeter:(unsigned __int8)a3;
- (void)setIsGKVoiceChat:(BOOL)a3;
- (void)setIsRTCPFBEnabled:(BOOL)a3;
- (void)setIsStarted:(BOOL)a3;
- (void)setIsWaitingForICEResult:(BOOL)a3;
- (void)setLastDecodedFrameTime:(double)a3;
- (void)setLastReceived:(unsigned int)a3;
- (void)setLocalIdentityForKeyExchange;
- (void)setMaxPacketLength:(unsigned __int16)a3;
- (void)setMutedPeers:(id)a3;
- (void)setNatType:(int)a3;
- (void)setNetworkConditionsTimeoutInSeconds:(double)a3;
- (void)setOperatingMode:(int)a3;
- (void)setPacketLateAndMissingRatio:(float)a3;
- (void)setPacketLossRate5Secs:(double)a3;
- (void)setPacketLossRate:(double)a3;
- (void)setPacketsPerBundle:(int)a3;
- (void)setPeerCN:(id)a3;
- (void)setPeerProtocolVersion:(unsigned int)a3;
- (void)setPeerReportingID:(id)a3;
- (void)setPreWarmState:(BOOL)a3;
- (void)setPreferredAudioCodec:(int)a3;
- (void)setQualityDelegate:(id)a3;
- (void)setReceivedSIPInvite:(BOOL)a3;
- (void)setRemoteCallInfoFromInviteDictionary:(id)a3;
- (void)setRemoteFrameHeight:(unsigned int)a3;
- (void)setRemoteFrameWidth:(unsigned int)a3;
- (void)setRemoteVideoAttributes:(id)a3;
- (void)setRequiresWifi:(BOOL)a3;
- (void)setResumeAudio;
- (void)setResumeVideo;
- (void)setRingBuf:(id)a3;
- (void)setRoundTripTime:(double)a3;
- (void)setRtpHandle:(tagHANDLE *)a3;
- (void)setSampleRate:(int64_t)a3;
- (void)setSessionConferenceState:(unsigned int)a3 callID:(unsigned int)a4;
- (void)setSessionConferenceVisualRectangle:(CGRect)a3 callID:(unsigned int)a4;
- (void)setSessionID:(id)a3;
- (void)setShouldSendAudio:(BOOL)a3;
- (void)setShouldTimeoutPackets:(BOOL)a3;
- (void)setSignalStrengthBars:(int)a3;
- (void)setSignalStrengthDisplayBars:(int)a3;
- (void)setSignalStrengthMaxDisplayBars:(int)a3;
- (void)setSipState:(int64_t)a3;
- (void)setSrtpKeyBytes:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setSuspendAudio;
- (void)setSuspendVideo;
- (void)setUpFirstRemoteFrameTimer;
- (void)setUseCompressedConnectionData:(BOOL)a3;
- (void)setUseControlByte:(BOOL)a3;
- (void)setUseRateControl:(BOOL)a3;
- (void)setUseUEP:(BOOL)a3;
- (void)setVideoPayload:(int64_t)a3;
- (void)setWRMCoexMetrics:(id)a3;
- (void)setWRMMetricConfig:(id *)a3;
- (void)setWRMNotification:(id *)a3;
- (void)setupAACELDPayload:(int)a3;
- (void)setupABTesting;
- (void)setupAudioOnOffStateMessages;
- (void)setupAudioPauseMessages;
- (void)setupAudioPausedHBMessages;
- (void)setupBasebandCodecInfoMessages;
- (void)setupBitrateNegotiation;
- (void)setupCalleeSIPStartTimeout:(float)a3;
- (void)setupCallingModeMessages;
- (void)setupCellTechChangeMessages;
- (void)setupConnectionTimeoutTimerWithErrorCode:(int)a3 detailedCode:(int)a4 description:(id)a5 reason:(id)a6;
- (void)setupDTLSDefaults;
- (void)setupDisconnectMessage;
- (void)setupHandoverCandidateChangeMessage;
- (void)setupMessaging;
- (void)setupMomentsMessages;
- (void)setupPeerInfo:(id)a3 usingInviteData:(id)a4 isCaller:(BOOL)a5 capabilities:(id)a6;
- (void)setupPiPStateChangeMessage;
- (void)setupPreferredInterfaceMessage;
- (void)setupSecureDataChannel;
- (void)setupSymptomEnabledMessage;
- (void)setupVideoPauseMessages;
- (void)setupWCMClient;
- (void)setupWRMAlertStateUpdateMessage;
- (void)setupWRMClient;
- (void)setupWRMCoexMetricsMessage;
- (void)shouldSendBlackFrame:(BOOL)a3;
- (void)shutdownVoiceChatFromRemoteSIPSignal:(int)a3 withReason:(const char *)a4;
- (void)sipConnectThreadProc:(id)a3;
- (void)startAWDStats;
- (void)startAudioIOWithCompletionHandler:(id)a3;
- (void)startAudioWithCompletionHandler:(id)a3;
- (void)startPausedHeartbeat;
- (void)stopAudioIO:(id)a3;
- (void)stopAudioWithCompletionHandler:(id)a3;
- (void)stopPausedHeartbeat;
- (void)telephonyInterface:(id)a3 vocoderInfoChangedToType:(id)a4 sampleRate:(id)a5;
- (void)thermalLevelDidChange:(int)a3;
- (void)timeoutUnfinishedConnection;
- (void)transportSession:(id)a3 cancelRelayRequest:(id)a4;
- (void)transportSession:(id)a3 connectionSetupDataDidChange:(id)a4;
- (void)transportSession:(id)a3 initiateRelayRequest:(id)a4;
- (void)transportSession:(id)a3 sendRelayResponse:(id)a4;
- (void)triggerInterfaceChange;
- (void)unlock;
- (void)updateCachedConnectionState;
- (void)updateDeviceRole:(int)a3;
- (void)updateLastReceivedAudioTime;
- (void)updateLastReceivedPacket:(BOOL)a3 packetType:(int)a4;
- (void)updateLastReceivedPacketWithTimestamp:(double)a3 packetType:(int)a4;
- (void)updateMaxPktLength;
- (void)updateNetworkCheckHint:(double)a3;
- (void)updateRelayedCallType:(unsigned __int8)a3;
- (void)updateRemoteMediaStallState:(double)a3;
- (void)updateRemoteMediaStallStateReporting:(double)a3;
- (void)updateSourcePlayoutTime:(const tagVCMediaTime *)a3;
- (void)updateStatistics:(tagVCStatisticsMessage *)a3;
- (void)updateVCRateControlWRMMetrics:(tagWRMMetricsInfo *)a3;
- (void)updateVideoQualityNotification:(double)a3;
- (void)updateVideoQualityStatusWithTime:(double)a3 isRemote:(BOOL)a4;
- (void)vcSecureDataChannel:(id)a3 messageType:(unsigned int)a4 receivedData:(id)a5;
- (void)verifyFaceTimeClassicNotOnNewerBuilds;
- (void)wcmGetCallConfig:(unsigned int *)a3 targetBitrate:(unsigned int *)a4;
- (void)wcmSetCallConfig:(unsigned int)a3 interferenceLevel:(unsigned int)a4;
@end

@implementation VCCallSession

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<VCCallSession localCallID = %d, remoteCallID = %d, state = %d, sentDidStartAsYES = %d>", -[VCCallInfo callID](self->localCallInfo, "callID"), -[VCCallInfo callID](self->remoteCallInfo, "callID"), self->state, self->sentClientSuccessfulDidStart];
}

- (VCCallSession)init
{
  return [(VCCallSession *)self initWithDeviceRole:0 transportType:0 isGKVoiceChat:0 reportingHierarchyToken:0];
}

- (VCCallSession)initWithDeviceRole:(int)a3 transportType:(unsigned int)a4 isGKVoiceChat:(BOOL)a5 reportingHierarchyToken:(id)a6
{
  BOOL v7 = a5;
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  v53.receiver = self;
  v53.super_class = (Class)VCCallSession;
  v10 = [(VCCallSession *)&v53 init];
  if ((char *)objc_opt_class() == v10)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_12;
    }
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 136316418;
    uint64_t v57 = v12;
    LOWORD(v58) = 2080;
    *(void *)((char *)&v58 + 2) = "-[VCCallSession initWithDeviceRole:transportType:isGKVoiceChat:reportingHierarchyToken:]";
    WORD5(v58) = 1024;
    HIDWORD(v58) = 344;
    *(_WORD *)v59 = 1024;
    *(_DWORD *)&v59[2] = a3;
    *(_WORD *)&v59[6] = 1024;
    *(_DWORD *)&v59[8] = a4;
    LOWORD(v60) = 1024;
    *(_DWORD *)((char *)&v60 + 2) = v7;
    v14 = "VCCallSession [%s] %s:%d deviceRole = %d, transportType = %d, isGKVoiceChat = %d";
    v15 = v13;
    uint32_t v16 = 46;
    goto LABEL_11;
  }
  if (objc_opt_respondsToSelector()) {
    v11 = (__CFString *)[v10 performSelector:sel_logPrefix];
  }
  else {
    v11 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v17 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316930;
      uint64_t v57 = v17;
      LOWORD(v58) = 2080;
      *(void *)((char *)&v58 + 2) = "-[VCCallSession initWithDeviceRole:transportType:isGKVoiceChat:reportingHierarchyToken:]";
      WORD5(v58) = 1024;
      HIDWORD(v58) = 344;
      *(_WORD *)v59 = 2112;
      *(void *)&v59[2] = v11;
      *(_WORD *)&v59[10] = 2048;
      *(void *)&long long v60 = v10;
      WORD4(v60) = 1024;
      *(_DWORD *)((char *)&v60 + 10) = a3;
      HIWORD(v60) = 1024;
      LODWORD(v61) = a4;
      WORD2(v61) = 1024;
      *(_DWORD *)((char *)&v61 + 6) = v7;
      v14 = "VCCallSession [%s] %s:%d %@(%p) deviceRole = %d, transportType = %d, isGKVoiceChat = %d";
      v15 = v18;
      uint32_t v16 = 66;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
    }
  }
LABEL_12:
  *((void *)v10 + 5) = 2;
  +[VCVTPWrapper startVTP];
  *((void *)v10 + 27) = 0xFFFFFFFFLL;
  id v19 = +[VideoConferenceManager defaultVideoConferenceManager];
  if (a4)
  {
    [v19 setupVTPCallback];
  }
  else
  {
    objc_msgSend(v19, "startSIPWithPacketMultiplexMode:transportType:", objc_msgSend(v10, "mapPacketMultiplexModeToSIPMode:", *((void *)v10 + 5)), 0);
    *((void *)v10 + 27) = objc_msgSend(+[VideoConferenceManager defaultVideoConferenceManager](VideoConferenceManager, "defaultVideoConferenceManager"), "SIPHandle");
  }
  *((void *)v10 + 94) = 0;
  *((void *)v10 + 95) = &stru_1F3D3E450;
  *((void *)v10 + 192) = &stru_1F3D3E450;
  *((void *)v10 + 3) = 0;
  *((void *)v10 + 4) = 0;
  *((_DWORD *)v10 + 94) = 0;
  v10[226] = 0;
  *((void *)v10 + 11) = 0;
  *((_WORD *)v10 + 112) = 0;
  *((void *)v10 + 16) = 0;
  *((void *)v10 + 17) = 0;
  *((void *)v10 + 6) = 0xFFFFFFFFLL;
  *((void *)v10 + 7) = 0xFFFFFFFFLL;
  *((void *)v10 + 42) = 0xFFFFFFFFLL;
  *((void *)v10 + 43) = 0xFFFFFFFFLL;
  v68.__sig = 0xAAAAAAAAAAAAAAAALL;
  *(void *)v68.__opaque = 0xAAAAAAAAAAAAAAAALL;
  pthread_mutexattr_init(&v68);
  pthread_mutexattr_settype(&v68, 2);
  v10[296] = 0;
  *((void *)v10 + 24) = -1;
  pthread_mutex_init((pthread_mutex_t *)(v10 + 232), &v68);
  pthread_mutexattr_destroy(&v68);
  v10[408] = 0;
  pthread_mutex_init((pthread_mutex_t *)(v10 + 416), 0);
  pthread_mutex_init((pthread_mutex_t *)v10 + 13, 0);
  *(_WORD *)(v10 + 385) = 0;
  *((void *)v10 + 64) = 0;
  *((_DWORD *)v10 + 165) = -1;
  *((void *)v10 + 83) = 0;
  v10[993] = v7;
  v10[592] = !v7;
  *((void *)v10 + 18) = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
  *((_WORD *)v10 + 600) = 1450;
  *((_DWORD *)v10 + 95) = 104;
  v10[977] = 1;
  *((_DWORD *)v10 + 82) = a3;
  *((void *)v10 + 75) = 0;
  v20 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  *((void *)v10 + 15) = dispatch_queue_create("com.apple.VideoConference.VCCallSession.connectionChangeQueue", v20);
  *((void *)v10 + 60) = dispatch_queue_create("com.apple.VideoConference.VCCallSession.videoQueue", v20);
  *((void *)v10 + 61) = dispatch_queue_create("com.apple.VideoConference.VCCallSession.videoAsyncQueue", v20);
  *((void *)v10 + 112) = dispatch_queue_create("com.apple.VideoConference.VCCallSession.qualityQueue", 0);
  *((void *)v10 + 62) = dispatch_queue_create("com.apple.VideoConference.VCCallSession.audioQueue", v20);
  *((void *)v10 + 63) = dispatch_queue_create("com.apple.VideoConference.VCCallSession.delegateNotificationQueue", v20);
  v10[528] = [+[VCDefaults sharedInstance] audioRecordingEnabled];
  *((_DWORD *)v10 + 133) = [+[VCDefaults sharedInstance] aacBlockSize];
  v10[384] = [+[VCDefaults sharedInstance] useSBR];
  *((void *)v10 + 146) = objc_alloc_init(MEMORY[0x1E4F47A20]);
  *((void *)v10 + 84) = objc_alloc_init(MEMORY[0x1E4F47A20]);
  *((void *)v10 + 86) = 0;
  *((void *)v10 + 99) = 0;
  v10[608] = 0;
  v10[648] = 0;
  *(void *)(v10 + 652) = 0;
  *(void *)(v10 + 620) = 0;
  *(void *)(v10 + 628) = 0;
  *(void *)(v10 + 612) = 0;
  *((_DWORD *)v10 + 159) = 0;
  v10[593] = 1;
  v10[817] = 0;
  v10[976] = 0;
  v10[980] = 0;
  pthread_mutex_init((pthread_mutex_t *)(v10 + 912), 0);
  *((void *)v10 + 123) = [[VCCallLinkCongestionDetector alloc] initWithRTTThreshold:3.0 lossRateThreshold:0.6];
  v10[992] = 1;
  *((void *)v10 + 136) = 0;
  v10[1080] = 0;
  *((_WORD *)v10 + 548) = 0;
  v10[1545] = 0;
  *((_DWORD *)v10 + 252) = 0;
  *((_OWORD *)v10 + 97) = 0u;
  *((_OWORD *)v10 + 98) = 0u;
  *((_OWORD *)v10 + 99) = 0u;
  *((_OWORD *)v10 + 100) = 0u;
  *((_OWORD *)v10 + 101) = 0u;
  *((_OWORD *)v10 + 102) = 0u;
  *((_OWORD *)v10 + 103) = 0u;
  *((_OWORD *)v10 + 104) = 0u;
  *((_OWORD *)v10 + 105) = 0u;
  *((_OWORD *)v10 + 106) = 0u;
  *((_DWORD *)v10 + 287) = 0;
  *((void *)v10 + 144) = dispatch_queue_create("com.apple.avconference.vccallsession.celltech", 0);
  *((void *)v10 + 148) = 0;
  if ((VTP_GetSendRecvStats((uint64_t *)v10 + 151, (uint64_t *)v10 + 152) & 0x80000000) != 0)
  {
    *((void *)v10 + 151) = -1;
    *((void *)v10 + 152) = -1;
  }
  *((void *)v10 + 156) = 0xFFFFFFFFLL;
  *((void *)v10 + 157) = 0xFFFFFFFFLL;
  *((void *)v10 + 127) = 0x4008000000000000;
  __asm { FMOV            V0.2D, #4.0 }
  *((_OWORD *)v10 + 64) = _Q0;
  *((void *)v10 + 130) = 0x4008000000000000;
  *(_OWORD *)(v10 + 1336) = 0u;
  int v26 = [+[VCDefaults sharedInstance] enableiRATSuggestion];
  if (v26 == -1) {
    BOOL v27 = +[GKSConnectivitySettings supportiRATRecommendation];
  }
  else {
    BOOL v27 = v26 != 0;
  }
  v10[1352] = v27;
  *((void *)v10 + 3) = objc_alloc_init(VCCallInfo);
  uint64_t ID = VCUniqueIDGenerator_GenerateID();
  [*((id *)v10 + 3) setCallID:ID];
  [*((id *)v10 + 3) setSupportsSKEOptimization:1];
  memset(v67, 170, 12);
  __sprintf_chk(v67, 0, 0xCuLL, "%010u", ID);
  *((void *)v10 + 191) = VRLogfileAlloc(0, (uint64_t)v67, (uint64_t)"CallSettings", (uint64_t)".calldump", "com.apple.VideoConference.CallSettingsLog", 32);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v29 = VRTraceErrorLogLevelToCSTR();
    v30 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v57 = v29;
      LOWORD(v58) = 2080;
      *(void *)((char *)&v58 + 2) = "-[VCCallSession initWithDeviceRole:transportType:isGKVoiceChat:reportingHierarchyToken:]";
      WORD5(v58) = 1024;
      HIDWORD(v58) = 495;
      _os_log_impl(&dword_1E1EA4000, v30, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Using the following path - traditional 1:1", buf, 0x1Cu);
    }
  }
  if (!v7)
  {
    uint64_t v57 = 0;
    long long v58 = 0uLL;
    *(_DWORD *)buf = ID;
    *(_DWORD *)v59 = 0;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    *(void *)&v59[4] = a6;
    v63 = &__block_literal_global_46;
    long long v64 = 0u;
    long long v65 = 0u;
    uint64_t v66 = 0;
    *((void *)v10 + 174) = reportingCreateAgent();
    *((_DWORD *)v10 + 350) = VCReporting_GetDynamicReportingModuleID();
    reportingSetPeriodicAggregationOccuredHandler();
    [+[VCQoSMonitorManager sharedInstance] registerQoSReportingSourceForToken:ID];
  }
  *((void *)v10 + 50) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  *((_OWORD *)v10 + 85) = 0u;
  v10[1407] = [+[VCDefaults sharedInstance] rateControlDumpEnabled];
  *((_DWORD *)v10 + 373) = 1;
  *((_DWORD *)v10 + 368) = -1;
  v31 = (void *)MEMORY[0x1E4F47AC8];
  *((_DWORD *)v10 + 355) = 0;
  v54[0] = *v31;
  v55[0] = objc_msgSend(NSNumber, "numberWithInt:", +[GKSConnectivitySettings getAdaptiveLearningState](GKSConnectivitySettings, "getAdaptiveLearningState"));
  v54[1] = *MEMORY[0x1E4F47AA8];
  v55[1] = objc_msgSend(NSNumber, "numberWithInt:", +[GKSConnectivitySettings getShortTermHistoryLength](GKSConnectivitySettings, "getShortTermHistoryLength"));
  v54[2] = *MEMORY[0x1E4F47A88];
  v55[2] = objc_msgSend(NSNumber, "numberWithInt:", +[GKSConnectivitySettings getLongTermHistoryLength](GKSConnectivitySettings, "getLongTermHistoryLength"));
  v54[3] = *MEMORY[0x1E4F47A60];
  v32 = NSNumber;
  +[GKSConnectivitySettings getAdaptiveLearningA];
  v55[3] = objc_msgSend(v32, "numberWithDouble:");
  v54[4] = *MEMORY[0x1E4F47A70];
  v33 = NSNumber;
  +[GKSConnectivitySettings getAdjustmentFactorA];
  v55[4] = objc_msgSend(v33, "numberWithDouble:");
  v54[5] = *MEMORY[0x1E4F47AB0];
  v34 = NSNumber;
  +[GKSConnectivitySettings getShortTermValueWeightA];
  v55[5] = objc_msgSend(v34, "numberWithDouble:");
  v54[6] = *MEMORY[0x1E4F47A90];
  v35 = NSNumber;
  +[GKSConnectivitySettings getLongTermValueWeightA];
  v55[6] = objc_msgSend(v35, "numberWithDouble:");
  v54[7] = *MEMORY[0x1E4F47A68];
  v36 = NSNumber;
  +[GKSConnectivitySettings getAdaptiveLearningB];
  v55[7] = objc_msgSend(v36, "numberWithDouble:");
  v54[8] = *MEMORY[0x1E4F47A78];
  v37 = NSNumber;
  +[GKSConnectivitySettings getAdjustmentFactorB];
  v55[8] = objc_msgSend(v37, "numberWithDouble:");
  v54[9] = *MEMORY[0x1E4F47AB8];
  v38 = NSNumber;
  +[GKSConnectivitySettings getShortTermValueWeightB];
  v55[9] = objc_msgSend(v38, "numberWithDouble:");
  v54[10] = *MEMORY[0x1E4F47A98];
  v39 = NSNumber;
  +[GKSConnectivitySettings getLongTermValueWeightB];
  v55[10] = objc_msgSend(v39, "numberWithDouble:");
  v54[11] = *MEMORY[0x1E4F47A80];
  v40 = NSNumber;
  +[GKSConnectivitySettings getAdjustmentFactorC];
  v55[11] = objc_msgSend(v40, "numberWithDouble:");
  v54[12] = *MEMORY[0x1E4F47AC0];
  v41 = NSNumber;
  +[GKSConnectivitySettings getShortTermValueWeightC];
  v55[12] = objc_msgSend(v41, "numberWithDouble:");
  v54[13] = *MEMORY[0x1E4F47AA0];
  v42 = NSNumber;
  +[GKSConnectivitySettings getLongTermValueWeightC];
  v55[13] = objc_msgSend(v42, "numberWithDouble:");
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:14];
  createAdaptiveLearningForAgent();
  reportingRegisterPeriodicTaskWeak();
  reportingRegisterSystemStats();
  reportingSymptomSetCallback();
  *((void *)v10 + 185) = dispatch_queue_create("com.apple.avconference.vccallsession.timestamp", 0);
  v10[1488] = 0;
  v43 = malloc_type_calloc(1uLL, 0x108uLL, 0x10A0040C891A16EuLL);
  v44 = off_1E6DB3078;
  *((void *)v10 + 187) = v43;
  if (a4 != 1) {
    v44 = off_1E6DB3080;
  }
  v45 = (void *)[objc_alloc(*v44) initWithCallID:ID reportingAgent:*((void *)v10 + 174)];
  *((void *)v10 + 189) = v45;
  [v45 setPerfTimings:*((void *)v10 + 84)];
  v46 = (void *)[*((id *)v10 + 189) connectionManager];
  *((void *)v10 + 10) = v46;
  [v46 setDuplicationCallback:VCCMDuplicationCallback_0 withContext:v10];
  objc_msgSend(*((id *)v10 + 10), "setDefaultLinkProbingCapabilityVersionForDeviceRole:", objc_msgSend(v10, "deviceRole"));
  *((_DWORD *)v10 + 377) = a4;
  v47 = objc_alloc_init(VCSwitchManager);
  *((void *)v10 + 14) = v47;
  [(VCSwitchManager *)v47 initializeLocalSwitches];
  objc_msgSend(*((id *)v10 + 10), "setCellPrimaryInterfaceChangeEnabled:", objc_msgSend(*((id *)v10 + 14), "isLocalSwitchEnabled:", 0x800000));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v48 = VRTraceErrorLogLevelToCSTR();
    v49 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v50 = [*((id *)v10 + 10) cellPrimaryInterfaceChangeEnabled];
      *(_DWORD *)buf = 136315906;
      uint64_t v57 = v48;
      LOWORD(v58) = 2080;
      *(void *)((char *)&v58 + 2) = "-[VCCallSession initWithDeviceRole:transportType:isGKVoiceChat:reportingHierarchyToken:]";
      WORD5(v58) = 1024;
      HIDWORD(v58) = 570;
      *(_WORD *)v59 = 1024;
      *(_DWORD *)&v59[2] = v50;
      _os_log_impl(&dword_1E1EA4000, v49, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Load switch wifiAssistStatusBarEnabled %d", buf, 0x22u);
    }
  }
  objc_msgSend(+[VCEffectsManager sharedManager](VCEffectsManager, "sharedManager"), "setReportingAgent:", *((void *)v10 + 174));
  [v10 registerForReportingNotifications];
  [v10 reportClientPersistentSettings];
  if ([v10 deviceRole] == 2 || objc_msgSend(v10, "deviceRole") == 4)
  {
    v51 = objc_alloc_init(VCTelephonyInterface);
    *((void *)v10 + 183) = v51;
    [(VCTelephonyInterface *)v51 setDelegate:v10];
    [*((id *)v10 + 183) registerForNotifications];
  }
  *((double *)v10 + 214) = micro();
  return (VCCallSession *)v10;
}

void __88__VCCallSession_initWithDeviceRole_transportType_isGKVoiceChat_reportingHierarchyToken___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (![a3 count] && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __88__VCCallSession_initWithDeviceRole_transportType_isGKVoiceChat_reportingHierarchyToken___block_invoke_cold_1();
    }
  }
}

uint64_t __88__VCCallSession_initWithDeviceRole_transportType_isGKVoiceChat_reportingHierarchyToken___block_invoke_30(uint64_t a1, uint64_t a2)
{
  v4 = +[VCQoSMonitorManager sharedInstance];
  uint64_t v5 = *(unsigned int *)(a1 + 32);

  return [(VCQoSMonitorManager *)v4 updateQoSReport:a2 toClientsWithToken:v5];
}

uint64_t __88__VCCallSession_initWithDeviceRole_transportType_isGKVoiceChat_reportingHierarchyToken___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "gatherRealtimeStats:");
}

- (void)gatherRealtimeStats:(__CFDictionary *)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    int operatingMode = self->operatingMode;
    BOOL v6 = operatingMode == 4 || operatingMode == 1;
    BOOL v7 = (CFAllocatorRef *)MEMORY[0x1E4F1CF80];
    if (v6)
    {
      [(VCCallSession *)self sessionReceivingBitrate];
      uint64_t v9 = (v8 / 1000.0);
      [(VCCallSession *)self sessionTransmittingBitrate];
      uint64_t v11 = (v10 / 1000.0);
      CFAllocatorRef v12 = *v7;
      CFStringRef v13 = CFStringCreateWithFormat(*v7, 0, @"%u", v9);
      CFDictionaryAddValue(a3, @"VRxR", v13);
      CFRelease(v13);
      CFStringRef v14 = CFStringCreateWithFormat(v12, 0, @"%u", v11);
      CFDictionaryAddValue(a3, @"VTxR", v14);
      CFRelease(v14);
      CFStringRef v15 = CFStringCreateWithFormat(v12, 0, @"%u", self->_mediaStallCount);
      CFDictionaryAddValue(a3, @"MSTC", v15);
      CFRelease(v15);
      self->_mediaStallCount = 0;
      CFStringRef v16 = CFStringCreateWithFormat(v12, 0, @"%f", *(void *)&self->_mediaStallTotalTime);
      CFDictionaryAddValue(a3, @"MSTT", v16);
      CFRelease(v16);
      self->_mediaStallTotalTime = 0.0;
      CFStringRef v17 = CFStringCreateWithFormat(v12, 0, @"%f", *(void *)&self->_maxMediaStallTime);
      CFDictionaryAddValue(a3, @"MMST", v17);
      CFRelease(v17);
      self->_maxMediaStallTime = 0.0;
      CFStringRef v18 = CFStringCreateWithFormat(v12, 0, @"%llu", [(VCConnectionManager *)self->connectionManager mediaExcessiveCellularTxBytes]+ [(VCConnectionManager *)self->connectionManager signalingExcessiveCellularTxBytes]);
      CFDictionaryAddValue(a3, @"CDupTxDb", v18);
      CFRelease(v18);
      CFStringRef v19 = CFStringCreateWithFormat(v12, 0, @"%llu", [(VCConnectionManager *)self->connectionManager mediaExcessiveCellularRxBytes]+ [(VCConnectionManager *)self->connectionManager signalingExcessiveCellularRxBytes]);
      CFDictionaryAddValue(a3, @"CDupRxDb", v19);
      CFRelease(v19);
      CFStringRef v20 = CFStringCreateWithFormat(v12, 0, @"%llu", [(VCConnectionManager *)self->connectionManager budgetConsumingCellularTxBytes]);
      CFDictionaryAddValue(a3, @"CBudgTxDb", v20);
      CFRelease(v20);
      CFStringRef v21 = CFStringCreateWithFormat(v12, 0, @"%llu", [(VCConnectionManager *)self->connectionManager budgetConsumingCellularRxBytes]);
      CFDictionaryAddValue(a3, @"CBudgRxDb", v21);
      CFRelease(v21);
      CFStringRef v22 = CFStringCreateWithFormat(v12, 0, @"%llu", [(VCConnectionManager *)self->connectionManager mediaCellularTxBytes]);
      CFDictionaryAddValue(a3, @"CTxDb", v22);
      CFRelease(v22);
      CFStringRef v23 = CFStringCreateWithFormat(v12, 0, @"%llu", [(VCConnectionManager *)self->connectionManager mediaCellularRxBytes]);
      CFDictionaryAddValue(a3, @"CRxDb", v23);
      CFRelease(v23);
      CFStringRef v24 = CFStringCreateWithFormat(v12, 0, @"%llu", [(VCConnectionManager *)self->connectionManager mediaWifiTxBytes]);
      CFDictionaryAddValue(a3, @"WTxDb", v24);
      CFRelease(v24);
      CFStringRef v25 = CFStringCreateWithFormat(v12, 0, @"%llu", [(VCConnectionManager *)self->connectionManager mediaWifiRxBytes]);
      CFDictionaryAddValue(a3, @"WRxDb", v25);
      CFRelease(v25);
      int operatingMode = self->operatingMode;
    }
    if (operatingMode == 1)
    {
      CFDictionaryRef v26 = (const __CFDictionary *)objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "copyRealtimeStatsDictionary");
      VCUtil_AppendFromDictionary(a3, v26);
      CFRelease(v26);
    }
    int v37 = 0;
    unsigned __int8 v36 = 0;
    +[VCWiFiUtils getInfraChannelNumber:&v37 is5Ghz:&v36];
    int valuePtr = v36;
    CFAllocatorRef v27 = *v7;
    CFNumberRef v28 = CFNumberCreate(*v7, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, @"iWiFi5GHz", v28);
    CFRelease(v28);
    uint64_t v35 = 0;
    int v34 = 0;
    [(VCTransportSession *)self->_transportSession getSignalStrengthBars:(char *)&v35 + 4 displayBars:&v35 maxDisplayBars:&v34];
    CFStringRef v29 = CFStringCreateWithFormat(v27, 0, @"%d", HIDWORD(v35));
    CFDictionaryAddValue(a3, @"SS", v29);
    CFRelease(v29);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v30 = VRTraceErrorLogLevelToCSTR();
      v31 = *MEMORY[0x1E4F47A50];
      v32 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v33 = objc_msgSend((id)-[__CFDictionary description](a3, "description"), "UTF8String");
          int valuePtr = 136315906;
          uint64_t v39 = v30;
          __int16 v40 = 2080;
          v41 = "-[VCCallSession gatherRealtimeStats:]";
          __int16 v42 = 1024;
          int v43 = 672;
          __int16 v44 = 2080;
          uint64_t v45 = v33;
          _os_log_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d RTCReporting: reporting dictionary %s", (uint8_t *)&valuePtr, 0x26u);
        }
      }
      else if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        -[VCCallSession gatherRealtimeStats:]();
      }
    }
  }
}

- (void)getVideoFeatureStatusSettings:(tagVCReportingClientSettingsPersist *)a3
{
  if (a3)
  {
    v4 = objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "copyInitialStatsDictionary");
    uint64_t v5 = (void *)[v4 objectForKeyedSubscript:@"VideoEyeContact"];
    if (v5) {
      a3->var0 = [v5 intValue];
    }
    BOOL v6 = (void *)[v4 objectForKeyedSubscript:@"REFENB"];
    if (v6) {
      a3->var5 = [v6 intValue];
    }
    BOOL v7 = (void *)[v4 objectForKeyedSubscript:@"CSFENB"];
    if (v7) {
      a3->var2 = [v7 intValue];
    }
    double v8 = (void *)[v4 objectForKeyedSubscript:@"PMFENB"];
    if (v8) {
      a3->var3 = [v8 intValue];
    }
    uint64_t v9 = (void *)[v4 objectForKeyedSubscript:@"SLFENB"];
    if (v9) {
      a3->var4 = [v9 intValue];
    }
    double v10 = (void *)[v4 objectForKeyedSubscript:@"BGRFENB"];
    if (v10) {
      a3->var6 = [v10 intValue];
    }
    uint64_t v11 = (void *)[v4 objectForKeyedSubscript:@"BGRCCFENB"];
    if (v11) {
      a3->var7 = [v11 intValue];
    }
    if (v4)
    {
      CFRelease(v4);
    }
  }
}

- (void)reportClientPersistentSettings
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  long long v2 = 0uLL;
  uint64_t v3 = 0;
  [(VCCallSession *)self getVideoFeatureStatusSettings:&v2];
  reportingSetReportingClientPersistentSetting();
}

- (BOOL)isCurrentPayloadTypeValid
{
  audioTransmitter = self->audioTransmitter;
  if (audioTransmitter) {
    LOBYTE(audioTransmitter) = [(VCAudioPayloadConfig *)[(VCAudioTransmitter *)audioTransmitter currentAudioPayloadConfig] payload] != 128;
  }
  return (char)audioTransmitter;
}

- (BOOL)requiresWifi
{
  return [(VCTransportSession *)self->_transportSession requiresWiFi];
}

- (void)setRequiresWifi:(BOOL)a3
{
}

- (BOOL)useCompressedConnectionData
{
  return [(VCTransportSession *)self->_transportSession useCompressedConnectionData];
}

- (void)setUseCompressedConnectionData:(BOOL)a3
{
}

+ (id)keyPathsForValuesAffectingNetworkQuality
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"packetLossRate", @"bandwidthUpstream", @"packetLateAndMissingRatio", 0);
}

- (unsigned)callID
{
  return [(VCCallInfo *)self->localCallInfo callID];
}

- (void)setOperatingMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v21[1] = *MEMORY[0x1E4F143B8];
  [(VCCallSession *)self lock];
  if (self->operatingMode != v3)
  {
    self->int operatingMode = v3;
    [(VCAudioTransmitter *)self->audioTransmitter setOperatingMode:v3];
    CFStringRef v20 = @"Mode";
    v21[0] = [NSNumber numberWithUnsignedInt:self->operatingMode];
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    [(VCCallSession *)self reportingAgent];
    reportingGenericEvent();
    if (self->state != 1)
    {
LABEL_28:
      [(VCCallSession *)self unlock];
      return;
    }
    int v5 = [(VCCallSession *)self evaluateEnableRRx:0];
    int operatingMode = self->operatingMode;
    BOOL v8 = operatingMode == 2 || operatingMode == 7;
    [(VCConnectionManager *)self->connectionManager setIsAudioOnly:v8];
    hAFRC = self->hAFRC;
    if (v3 == 2)
    {
      AFRCUpdateOperatingMode((uint64_t)hAFRC, 1, v5, 0);
      [(VCCallSession *)self configureRateController];
LABEL_21:
      unsigned int v12 = [(VCBitrateArbiter *)self->callSessionBitrateArbiter maxAllowedAudioOnlyBitrateForConnection:[(VCConnectionManager *)self->connectionManager getConnectionTypeForActiveConnectionWithQuality:1 forLocalInterface:1]];
      unsigned int v13 = [(VCBitrateArbiter *)self->callSessionBitrateArbiter maxAllowedAudioOnlyBitrateForConnection:[(VCConnectionManager *)self->connectionManager getConnectionTypeForActiveConnectionWithQuality:1 forLocalInterface:0]];
      if (v12 >= v13) {
        unsigned int v14 = v13;
      }
      else {
        unsigned int v14 = v12;
      }
      AFRCSetTxCap((uint64_t)self->hAFRC, 1000 * v14);
      videoQueue = self->videoQueue;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __34__VCCallSession_setOperatingMode___block_invoke_140;
      v18[3] = &unk_1E6DB3DC8;
      v18[4] = self;
      CFStringRef v16 = v18;
      goto LABEL_27;
    }
    AFRCUpdateOperatingMode((uint64_t)hAFRC, self->operatingMode == 7, v5, v3 == 4);
    [(VCCallSession *)self configureRateController];
    if (v3 == 4)
    {
      uint64_t v11 = 2;
    }
    else
    {
      if (v3 != 1) {
        goto LABEL_21;
      }
      double v10 = (void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self->connectionManager);
      if ([v10 isWifiToWifi]) {
        uint64_t v11 = 2;
      }
      else {
        uint64_t v11 = 1;
      }
      if (v10) {
        CFRelease(v10);
      }
    }
    [(VCCallSession *)self resetVideoRulesForInterface:v11 videoReportingDictionary:0];
    videoQueue = self->videoQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __34__VCCallSession_setOperatingMode___block_invoke;
    block[3] = &unk_1E6DB3DC8;
    block[4] = self;
    CFStringRef v16 = block;
LABEL_27:
    dispatch_async(videoQueue, v16);
    id v17 = +[VCAudioSession sharedVoiceChatInstance];
    [v17 setAudioSessionMode:*MEMORY[0x1E4F75BC0]];
    goto LABEL_28;
  }

  [(VCCallSession *)self unlock];
}

void __34__VCCallSession_setOperatingMode___block_invoke(uint64_t a1)
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  [*(id *)(a1 + 32) stopVideoSend:0 error:v2];
  [*(id *)(a1 + 32) startVideoSend:0 error:v2];
  if (v2[0] && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __34__VCCallSession_setOperatingMode___block_invoke_cold_1();
    }
  }
}

void __34__VCCallSession_setOperatingMode___block_invoke_140(uint64_t a1)
{
  v1[1] = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  [*(id *)(a1 + 32) stopVideoSend:0 error:v1];
  if (v1[0] && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __34__VCCallSession_setOperatingMode___block_invoke_140_cold_1();
    }
  }
}

- (void)configureRateController
{
  if (self->_rateController)
  {
    VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality((uint64_t)self->connectionManager, 1, 1);
    VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality((uint64_t)self->connectionManager, 1, 0);
    [(VCConnectionManager *)self->connectionManager getCellularTechForActiveConnectionWithQuality:1 forLocalInterface:1];
    [(VCConnectionManager *)self->connectionManager getCellularTechForActiveConnectionWithQuality:1 forLocalInterface:0];
    uint64_t v3 = (const void *)VCConnectionManager_CopyConnectionForQuality((uint64_t)self->connectionManager, 1);
    uint64_t v4 = VCBitrateArbiter_ModeFromOperatingMode(self->operatingMode);
    [(VCBitrateArbiter *)self->callSessionBitrateArbiter maxAllowedBitrateForVCConnection:v3 forLocalInterface:1 arbiterMode:v4 encodeRule:self->_currentEncodeRule];
    [(VCBitrateArbiter *)self->callSessionBitrateArbiter maxAllowedBitrateForVCConnection:v3 forLocalInterface:0 arbiterMode:v4 encodeRule:self->_currentEncodeRule];
    if (v3) {
      CFRelease(v3);
    }
    LOBYTE(v5) = 0;
    -[AVCRateController configureWithOperatingMode:isLocalCellular:localCellTech:isRemoteCellular:remoteCellTech:bitrateCapKbps:isTrafficBursty:featureFlags:](self->_rateController, "configureWithOperatingMode:isLocalCellular:localCellTech:isRemoteCellular:remoteCellTech:bitrateCapKbps:isTrafficBursty:featureFlags:", v5);
  }
}

- (void)startAWDStats
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  self->awdCallNonce = hwrandom();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      BOOL v8 = "-[VCCallSession startAWDStats]";
      __int16 v9 = 1024;
      int v10 = 852;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d startAWDStats", (uint8_t *)&v5, 0x1Cu);
    }
  }
  [(VCCallSession *)self isCaller];
  time(0);
  reportingAWDCallStart();
}

- (BOOL)videoIsPaused
{
  return [(VCCallInfo *)self->localCallInfo videoIsPaused];
}

- (void)setUseRateControl:(BOOL)a3
{
  self->BOOL useRateControl = a3;
  int v4 = [+[VCDefaults sharedInstance] rateControllerType];
  if (v4 == 3)
  {
    unsigned int v5 = 0;
  }
  else if (v4 == 1)
  {
    unsigned int v5 = 2;
  }
  else if (v4)
  {
    unsigned int v5 = 1;
  }
  else
  {
    unsigned int v5 = +[GKSConnectivitySettings getRateControllerType];
  }
  BOOL useRateControl = self->useRateControl;
  BOOL v7 = v5 < 2 && self->useRateControl;
  self->useVCRC = v7;
  if ((v5 & 0xFFFFFFFD) != 0) {
    BOOL useRateControl = 0;
  }
  self->useAFRC = useRateControl;
}

- (void)updateVideoQualityStatusWithTime:(double)a3 isRemote:(BOOL)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  videoQueue = self->videoQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__VCCallSession_updateVideoQualityStatusWithTime_isRemote___block_invoke;
  v5[3] = &unk_1E6DB45E0;
  BOOL v6 = a4;
  v5[4] = self;
  *(double *)&v5[5] = a3;
  dispatch_async(videoQueue, v5);
}

void __59__VCCallSession_updateVideoQualityStatusWithTime_isRemote___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = 32;
  if (!*(unsigned char *)(a1 + 48)) {
    uint64_t v3 = 24;
  }
  int v4 = *(void **)(v2 + v3);
  if ([v4 updateWithLastDecodedFrameTime:*(double *)(v2 + 640) time:*(double *)(a1 + 40)])
  {
    objc_msgSend(*(id *)(a1 + 32), "reportImmediateWRMMetric:value:", 0, objc_msgSend(v4, "isVideoQualityDegraded"));
    [v4 isVideoQualityDegraded];
    reportingVideoPaused();
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "session:withCallID:videoIsDegraded:isRemote:", *(void *)(a1 + 32), objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "callID"), objc_msgSend(v4, "isVideoQualityDegraded"), *(unsigned __int8 *)(a1 + 48));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      BOOL v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 640);
        int v9 = 136316162;
        uint64_t v10 = v5;
        __int16 v11 = 2080;
        unsigned int v12 = "-[VCCallSession updateVideoQualityStatusWithTime:isRemote:]_block_invoke";
        __int16 v13 = 1024;
        int v14 = 917;
        __int16 v15 = 2048;
        uint64_t v16 = v7;
        __int16 v17 = 1024;
        int v18 = [v4 isVideoQualityDegraded];
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d updateWithLastDecodedFrameTime returned YES. lastDecodedFrametime=%f isVideoQualityDegraded=%d", (uint8_t *)&v9, 0x2Cu);
      }
    }
  }
  if (*(unsigned char *)(a1 + 48) && [v4 isVideoQualityNearDegraded])
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v8 + 1545))
    {
      *(unsigned char *)(v8 + 1545) = 0;
      VCConnectionManager_ProcessWRMNotification(*(void *)(*(void *)(a1 + 32) + 80), (_DWORD *)(*(void *)(a1 + 32) + 1552));
    }
  }
}

- (BOOL)isBetterForSIPInviteWithSourceDestinationInfo:(tagVCSourceDestinationInfo *)a3 thanSession:(id)a4
{
  if (self->_sipState == 6)
  {
    BOOL v6 = [(VCConnectionManager *)[(VCCallSession *)self connectionManager] shouldAcceptDataFromSourceDestinationInfo:a3];
    if (v6)
    {
      if (a4)
      {
        unsigned int v7 = [(VCCallInfo *)self->localCallInfo callID];
        LOBYTE(v6) = v7 > [a4 callID];
      }
      else
      {
        LOBYTE(v6) = 1;
      }
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)evaluateEnableRRx:(int *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  CFPropertyListRef v5 = CFPreferencesCopyAppValue(@"enableBBNote", @"com.apple.VideoConference");
  if (v5)
  {
    BOOL v6 = v5;
    int v7 = CFEqual(v5, (CFTypeRef)*MEMORY[0x1E4F1CFC8]);
    BOOL v8 = v7 == 0;
    if (v7)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        uint64_t v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v21 = 136315650;
          uint64_t v22 = v9;
          __int16 v23 = 2080;
          CFStringRef v24 = "-[VCCallSession evaluateEnableRRx:]";
          __int16 v25 = 1024;
          int v26 = 958;
          _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Found enableBBNote NO. Disable baseband notification", (uint8_t *)&v21, 0x1Cu);
        }
      }
    }
    CFRelease(v6);
  }
  else
  {
    BOOL v8 = 1;
  }
  int v11 = v8 & VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality((uint64_t)self->connectionManager, 1, 1);
  if (v11 == 1
    && !NetworkUtils_IsLTEOrNewer([(VCConnectionManager *)self->connectionManager getCellularTechForActiveConnectionWithQuality:1 forLocalInterface:1]))
  {
    BOOL v14 = 0;
  }
  else
  {
    int operatingMode = self->operatingMode;
    BOOL v14 = operatingMode != 2 && operatingMode != 7;
  }
  CFPropertyListRef v15 = CFPreferencesCopyAppValue(@"enableRRx", @"com.apple.VideoConference");
  if (v15)
  {
    uint64_t v16 = v15;
    int v17 = CFEqual(v15, (CFTypeRef)*MEMORY[0x1E4F1CFD0]);
    BOOL v14 = v17 != 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      uint64_t v19 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 136315906;
        uint64_t v22 = v18;
        __int16 v23 = 2080;
        CFStringRef v24 = "-[VCCallSession evaluateEnableRRx:]";
        __int16 v25 = 1024;
        int v26 = 972;
        __int16 v27 = 1024;
        BOOL v28 = v17 != 0;
        _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Found enableRRx %d for AFRC.", (uint8_t *)&v21, 0x22u);
      }
    }
    CFRelease(v16);
  }
  if (a3) {
    *a3 = v11;
  }
  return v14;
}

- (void)updateMaxPktLength
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(VCConnectionManager *)self->connectionManager isConnectedOnIPv6ForActiveConnectionWithQuality:1];
  if (v3) {
    unsigned int v4 = 1280;
  }
  else {
    unsigned int v4 = 1450;
  }
  int IsInterfaceOnCellularForActiveConnectionWithQuality = VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality((uint64_t)self->connectionManager, 1, 1);
  if (IsInterfaceOnCellularForActiveConnectionWithQuality)
  {
    unsigned __int16 maxPacketLength = [(VCConnectionManager *)self->connectionManager getCellularMTUForActiveConnectionWithQuality:1];
    if (!maxPacketLength) {
      unsigned __int16 maxPacketLength = self->maxPacketLength;
    }
    if (maxPacketLength < v4 && maxPacketLength != 0) {
      LOWORD(v4) = maxPacketLength;
    }
  }
  else
  {
    unsigned __int16 maxPacketLength = 0;
  }
  if ([(VCConnectionManager *)self->connectionManager getCellularTechForActiveConnectionWithQuality:1 forLocalInterface:0])
  {
    int v8 = (unsigned __int16)v4;
    if ((unsigned __int16)v4 >= 0x583u)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      {
        LOWORD(v4) = 1410;
      }
      else
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        uint64_t v10 = *MEMORY[0x1E4F47A50];
        LOWORD(v4) = 1410;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 136316418;
          uint64_t v15 = v9;
          __int16 v16 = 2080;
          int v17 = "-[VCCallSession updateMaxPktLength]";
          __int16 v18 = 1024;
          int v19 = 1029;
          __int16 v20 = 2080;
          *(void *)int v21 = CelltechToStr();
          *(_WORD *)&v21[8] = 1024;
          *(_DWORD *)uint64_t v22 = v8;
          *(_WORD *)&v22[4] = 1024;
          v23[0] = 1410;
          _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d \t\t\t\t VCCallSession:UpdateMTU remote is %s. Lowering local MTU: %d -> %d ", (uint8_t *)&v14, 0x32u);
        }
      }
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() > 5)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    unsigned int v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v13 = self->maxPacketLength;
      int v14 = 136316674;
      uint64_t v15 = v11;
      __int16 v16 = 2080;
      int v17 = "-[VCCallSession updateMaxPktLength]";
      __int16 v18 = 1024;
      int v19 = 1034;
      __int16 v20 = 1024;
      *(_DWORD *)int v21 = v13;
      *(_WORD *)&v21[4] = 1024;
      *(_DWORD *)&v21[6] = (unsigned __int16)v4;
      *(_WORD *)uint64_t v22 = 1024;
      *(_DWORD *)&v22[2] = IsInterfaceOnCellularForActiveConnectionWithQuality;
      LOWORD(v23[0]) = 1024;
      *(_DWORD *)((char *)v23 + 2) = maxPacketLength;
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession:UpdateMTU MTU: %d -> %d Cellular: %d/%d ", (uint8_t *)&v14, 0x34u);
    }
  }
  if (self->maxPacketLength != (unsigned __int16)v4)
  {
    self->unsigned __int16 maxPacketLength = v4;
    RTPUpdateIsIPv6((uint64_t)self->rtpVideo, v3);
    RTPUpdateIsIPv6((uint64_t)self->rtpHandle, v3);
    VideoTransmitter_UpdateMTU((uint64_t)self->hVideoTransmitter, self->maxPacketLength, v3);
    [(VCSecureDataChannel *)self->secureDataChannel setMaxUDPPayloadSize:(int)VCMaxUDPPayloadSize(self->maxPacketLength, v3)];
  }
}

- (void)reportHandoverResultsWithDictionary:(id)a3 localBitrateCap:(int)a4 remoteBitrateCap:(int)a5
{
  if ([a3 objectForKeyedSubscript:@"captureRule"]) {
    uint64_t v9 = (__CFString *)[a3 objectForKeyedSubscript:@"captureRule"];
  }
  else {
    uint64_t v9 = @"NoRule";
  }
  if ([a3 objectForKeyedSubscript:@"encodeRule"]) {
    uint64_t v10 = (__CFString *)[a3 objectForKeyedSubscript:@"encodeRule"];
  }
  else {
    uint64_t v10 = @"NoRule";
  }
  reportingAgent = self->reportingAgent;
  uint64_t videoPayload_low = LODWORD(self->videoPayload);
  uint64_t v13 = [(__CFString *)v9 UTF8String];
  uint64_t v14 = [(__CFString *)v10 UTF8String];

  MEMORY[0x1F4105AB8](reportingAgent, videoPayload_low, v13, v14, (1000 * a4), (1000 * a5));
}

- (void)handleCellTechChange:(int)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([(VCCallSession *)self isCallOngoing])
  {
    int v5 = [(VCConnectionManager *)self->connectionManager getCellularTechForActiveConnectionWithQuality:1 forLocalInterface:1];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      int v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v13 = v6;
        __int16 v14 = 2080;
        uint64_t v15 = "-[VCCallSession handleCellTechChange:]";
        __int16 v16 = 1024;
        int v17 = 1067;
        __int16 v18 = 2080;
        uint64_t v19 = CelltechToStr();
        __int16 v20 = 2080;
        uint64_t v21 = CelltechToStr();
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession: handleCellTechChange (%s to %s) ", buf, 0x30u);
      }
    }
    cellTechQueue = self->cellTechQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __38__VCCallSession_handleCellTechChange___block_invoke;
    v9[3] = &unk_1E6DB4568;
    v9[4] = self;
    int v10 = a3;
    int v11 = v5;
    dispatch_async(cellTechQueue, v9);
  }
}

void __38__VCCallSession_handleCellTechChange___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(*(void *)(a1 + 32) + 80) getConnectionTypeForActiveConnectionWithQuality:1 forLocalInterface:1];
  int v3 = v2;
  if (v2 == -1 || v2 == 3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v18 = v5;
        __int16 v19 = 2080;
        __int16 v20 = "-[VCCallSession handleCellTechChange:]_block_invoke";
        __int16 v21 = 1024;
        int v22 = 1189;
        __int16 v23 = 1024;
        int v24 = v3;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession: Local cell tech change ignored, current connection type %d", buf, 0x22u);
      }
    }
  }
  else
  {
    GetConnectionTypeFromCellTech();
    if (IsConnectionDowngrading()) {
      int64_t v8 = 0;
    }
    else {
      int64_t v8 = 20000000000;
    }
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = *(NSObject **)(v9 + 1160);
    if (!v10
      || (dispatch_source_cancel(v10), uint64_t v9 = *(void *)(a1 + 32), (v11 = *(NSObject **)(v9 + 1160)) == 0)
      || (dispatch_release(v11),
          *(void *)(*(void *)(a1 + 32) + 1160) = 0,
          uint64_t v9 = *(void *)(a1 + 32),
          !*(void *)(v9 + 1160)))
    {
      *(void *)(*(void *)(a1 + 32) + 1160) = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(v9 + 1152));
      unsigned int v12 = *(NSObject **)(*(void *)(a1 + 32) + 1160);
      dispatch_time_t v13 = dispatch_time(0, v8);
      dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0);
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = *(NSObject **)(v14 + 1160);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __38__VCCallSession_handleCellTechChange___block_invoke_2;
      v16[3] = &unk_1E6DB4568;
      v16[5] = *(void *)(a1 + 40);
      v16[4] = v14;
      dispatch_source_set_event_handler(v15, v16);
      dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 1160));
    }
  }
}

void __38__VCCallSession_handleCellTechChange___block_invoke_2(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  int v2 = (unsigned int *)(a1 + 40);
  uint64_t v1 = *(unsigned int *)(a1 + 40);
  if (v1) {
    BOOL v3 = (int)v1 <= 9;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3 && v1 != *(_DWORD *)(a1 + 44))
  {
    [*(id *)(*(void *)(a1 + 32) + 80) updateCellularTech:v1 forLocalInterface:1];
    uint64_t IsInterfaceOnCellularForActiveConnectionWithQuality = VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality(*(void *)(*(void *)(a1 + 32) + 80), 1, 1);
    uint64_t v6 = VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality(*(void *)(*(void *)(a1 + 32) + 80), 1, 0);
    uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 80) getCellularTechForActiveConnectionWithQuality:1 forLocalInterface:0];
    VideoTransmitter_SetCellTech(*(void *)(*(void *)(a1 + 32) + 1256), IsInterfaceOnCellularForActiveConnectionWithQuality, *(_DWORD *)(a1 + 40), v6, v7);
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v9 = (void *)VCConnectionManager_CopyPrimaryConnection(*(void *)(*(void *)(a1 + 32) + 80));
    uint64_t v10 = [v9 isWifiToWifi];
    if (v10) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = 1;
    }
    if (v9) {
      CFRelease(v9);
    }
    [*(id *)(a1 + 32) resetVideoRulesForInterface:v11 videoReportingDictionary:v8];
    [*(id *)(*(void *)(a1 + 32) + 1232) setUseWiFiTiers:v10];
    unsigned int v12 = (const void *)VCConnectionManager_CopyConnectionForQuality(*(void *)(*(void *)(a1 + 32) + 80), 1);
    uint64_t v13 = [*(id *)(*(void *)(a1 + 32) + 1176) maxAllowedBitrateForVCConnection:v12 forLocalInterface:1 arbiterMode:VCBitrateArbiter_ModeFromOperatingMode(*(_DWORD *)(*(void *)(a1 + 32) + 1420)) encodeRule:*(void *)(*(void *)(a1 + 32) + 176)];
    if (v12) {
      CFRelease(v12);
    }
    if (v13)
    {
      if ([*(id *)(*(void *)(a1 + 32) + 32) supportsDynamicMaxBitrate])
      {
        int v34 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:v13];
        uint64_t v14 = (void *)[objc_alloc(NSNumber) initWithInt:*(unsigned int *)(a1 + 40)];
        uint64_t v15 = v8;
        uint64_t v16 = v7;
        uint64_t v17 = v6;
        uint64_t v18 = IsInterfaceOnCellularForActiveConnectionWithQuality;
        __int16 v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", v14, @"VCCellTechKey", v34, @"VCMaxBitrateKey", 0);
        __int16 v20 = (void *)[*(id *)(*(void *)(a1 + 32) + 1120) newPackedMessageFromDictionary:v19];
        [*(id *)(*(void *)(a1 + 32) + 1120) sendMessage:v20 withTopic:@"VCCellTechChangeTopic"];

        uint64_t IsInterfaceOnCellularForActiveConnectionWithQuality = v18;
        uint64_t v6 = v17;
        uint64_t v7 = v16;
        uint64_t v8 = v15;
      }
      else
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v21 = VRTraceErrorLogLevelToCSTR();
          int v22 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            uint64_t v36 = v21;
            __int16 v37 = 2080;
            v38 = "-[VCCallSession handleCellTechChange:]_block_invoke";
            __int16 v39 = 1024;
            int v40 = 1144;
            __int16 v41 = 1024;
            LODWORD(v42) = v13;
            _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Remote is legacy device: setting local bandwidth estimation cap: %d ", buf, 0x22u);
          }
        }
        AFRCSetBWECap(*(void *)(*(void *)(a1 + 32) + 344), 1000 * v13);
        [*(id *)(*(void *)(a1 + 32) + 352) setEstimatedBandwidthCap:(1000 * v13)];
      }
      AFRCUpdateCellTech(*(void *)(*(void *)(a1 + 32) + 344), IsInterfaceOnCellularForActiveConnectionWithQuality, *(_DWORD *)(a1 + 40), v6, v7, [*(id *)(a1 + 32) evaluateEnableRRx:0], 0);
      uint64_t v23 = *(void *)(a1 + 32);
      unsigned int v24 = *(_DWORD *)(v23 + 1148);
      if (v13 <= [*(id *)(v23 + 32) maxBandwidth]) {
        uint64_t v13 = v13;
      }
      else {
        uint64_t v13 = v24;
      }
      objc_msgSend(*(id *)(a1 + 32), "reportHandoverResultsWithDictionary:localBitrateCap:remoteBitrateCap:", v8, v13, objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "maxBandwidth"));
      VideoTransmitter_SetBitrate(*(void *)(*(void *)(a1 + 32) + 1256), 1000 * v13);
      *(_DWORD *)(*(void *)(a1 + 32) + 1148) = v13;
      uint64_t v25 = *(void *)(a1 + 32);
      uint64_t v26 = *(unsigned int *)(v25 + 1420);
      if (v26 == 7 || v26 == 2)
      {
        AFRCSetTxCap(*(void *)(*(void *)(a1 + 32) + 344), [(id)v25 currentAudioCap]);
        uint64_t v25 = *(void *)(a1 + 32);
        uint64_t v26 = *(unsigned int *)(v25 + 1420);
      }
      LOBYTE(v33) = 0;
      objc_msgSend(*(id *)(v25 + 352), "configureWithOperatingMode:isLocalCellular:localCellTech:isRemoteCellular:remoteCellTech:bitrateCapKbps:isTrafficBursty:featureFlags:", v26, IsInterfaceOnCellularForActiveConnectionWithQuality, *(unsigned int *)(a1 + 40), v6, v7, v13, v33);
      RTPSetBasebandCongestionDetector(*(void *)(*(void *)(a1 + 32) + 48), (const void *)[*(id *)(*(void *)(a1 + 32) + 352) basebandCongestionDetector]);
      uint64_t v27 = *(void *)(a1 + 32);
      if (!*(void *)(v27 + 352))
      {
        if (*v2)
        {
          uint64_t IsLTEOrNewer = NetworkUtils_IsLTEOrNewer(*v2);
          uint64_t v27 = *(void *)(a1 + 32);
        }
        else
        {
          uint64_t IsLTEOrNewer = 1;
        }
        [*(id *)(v27 + 360) setIsSenderProbingEnabled:IsLTEOrNewer];
      }
      uint64_t v29 = CelltechToStr();
      reportingLog();
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v30 = VRTraceErrorLogLevelToCSTR();
        v31 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v32 = [*(id *)(*(void *)(a1 + 32) + 32) maxBandwidth];
          *(_DWORD *)buf = 136316418;
          uint64_t v36 = v30;
          __int16 v37 = 2080;
          v38 = "-[VCCallSession handleCellTechChange:]_block_invoke";
          __int16 v39 = 1024;
          int v40 = 1182;
          __int16 v41 = 2080;
          uint64_t v42 = v29;
          __int16 v43 = 1024;
          int v44 = v13;
          __int16 v45 = 1024;
          int v46 = v32;
          _os_log_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession: Local CellTech has changed %s, max bitrate %u, max remote bitrate %u", buf, 0x32u);
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __38__VCCallSession_handleCellTechChange___block_invoke_2_cold_1();
      }
    }
  }
}

- (void)handleCellularMTUChanged:(unsigned __int16)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  cellTechQueue = self->cellTechQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__VCCallSession_handleCellularMTUChanged___block_invoke;
  block[3] = &unk_1E6DB4658;
  block[4] = self;
  unsigned __int16 v5 = a3;
  dispatch_async(cellTechQueue, block);
}

uint64_t __42__VCCallSession_handleCellularMTUChanged___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 80) updateCellularMTU:*(unsigned __int16 *)(a1 + 40)];
  int v2 = *(void **)(a1 + 32);

  return [v2 updateMaxPktLength];
}

- (void)checkAndReportThermalIncreaseAudioOnly:(int)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  int operatingMode = self->operatingMode;
  BOOL v5 = operatingMode != 2 && operatingMode != 7;
  if (a3)
  {
    if (!v5)
    {
      uint64_t v7 = @"SymptomReporterOptionalKeyThermalPressureLevel";
      v8[0] = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
      [(VCCallSession *)self reportingAgent];
      reportingSymptom();
    }
  }
}

- (void)thermalLevelDidChange:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(VCCallSession *)self reportingAgent];
  micro();
  reportingThermal();
  [(VCCallSession *)self checkAndReportThermalIncreaseAudioOnly:v3];
  hVideoTransmitter = self->hVideoTransmitter;

  VideoTransmitter_SetThermalLevel((uint64_t)hVideoTransmitter, v3);
}

- (void)remoteCellTechStateUpdate:(int)a3 maxRemoteBitrate:(unsigned int)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(VCCallSession *)self isCallOngoing])
  {
    cellTechQueue = self->cellTechQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__VCCallSession_remoteCellTechStateUpdate_maxRemoteBitrate___block_invoke;
    block[3] = &unk_1E6DB4568;
    block[4] = self;
    int v9 = a3;
    unsigned int v10 = a4;
    dispatch_async(cellTechQueue, block);
  }
}

void __60__VCCallSession_remoteCellTechStateUpdate_maxRemoteBitrate___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = CelltechToStr();
  uint64_t IsInterfaceOnCellularForActiveConnectionWithQuality = VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality(*(void *)(*(void *)(a1 + 32) + 80), 1, 1);
  uint64_t v4 = VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality(*(void *)(*(void *)(a1 + 32) + 80), 1, 0);
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 80) getCellularTechForActiveConnectionWithQuality:1 forLocalInterface:1];
  int v6 = [*(id *)(*(void *)(a1 + 32) + 80) getCellularTechForActiveConnectionWithQuality:1 forLocalInterface:0];
  int v7 = *(_DWORD *)(a1 + 40);
  if (v7
    && (v7 != v6
     || [*(id *)(*(void *)(a1 + 32) + 32) maxBandwidth] != *(_DWORD *)(a1 + 44)))
  {
    AFRCUpdateCellTech(*(void *)(*(void *)(a1 + 32) + 344), IsInterfaceOnCellularForActiveConnectionWithQuality, v5, v4, *(_DWORD *)(a1 + 40), [*(id *)(a1 + 32) evaluateEnableRRx:0], 0);
    reportingLog();
  }
  [*(id *)(*(void *)(a1 + 32) + 32) setMaxBandwidth:*(unsigned int *)(a1 + 44)];
  [*(id *)(*(void *)(a1 + 32) + 32) setCellBandwidth:*(unsigned int *)(a1 + 44)];
  [*(id *)(*(void *)(a1 + 32) + 80) updateCellularTech:*(unsigned int *)(a1 + 40) forLocalInterface:0];
  VideoTransmitter_SetCellTech(*(void *)(*(void *)(a1 + 32) + 1256), IsInterfaceOnCellularForActiveConnectionWithQuality, v5, v4, *(_DWORD *)(a1 + 40));
  uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  int v9 = (void *)VCConnectionManager_CopyPrimaryConnection(*(void *)(*(void *)(a1 + 32) + 80));
  uint64_t v10 = [v9 isWifiToWifi];
  if (v10) {
    uint64_t v11 = 2;
  }
  else {
    uint64_t v11 = 1;
  }
  if (v9) {
    CFRelease(v9);
  }
  [*(id *)(a1 + 32) resetVideoRulesForInterface:v11 videoReportingDictionary:v8];
  [*(id *)(*(void *)(a1 + 32) + 1232) setUseWiFiTiers:v10];
  unsigned int v12 = (const void *)VCConnectionManager_CopyConnectionForQuality(*(void *)(*(void *)(a1 + 32) + 80), 1);
  unsigned int v13 = [*(id *)(*(void *)(a1 + 32) + 1176) maxAllowedBitrateForVCConnection:v12 forLocalInterface:1 arbiterMode:VCBitrateArbiter_ModeFromOperatingMode(*(_DWORD *)(*(void *)(a1 + 32) + 1420)) encodeRule:*(void *)(*(void *)(a1 + 32) + 176)];
  if (v12) {
    CFRelease(v12);
  }
  unsigned int v14 = *(_DWORD *)(a1 + 44);
  if (v14 >= v13) {
    uint64_t v15 = v13;
  }
  else {
    uint64_t v15 = v14;
  }
  objc_msgSend(*(id *)(a1 + 32), "reportHandoverResultsWithDictionary:localBitrateCap:remoteBitrateCap:", v8, v15);
  VideoTransmitter_SetBitrate(*(void *)(*(void *)(a1 + 32) + 1256), 1000 * v15);
  *(_DWORD *)(*(void *)(a1 + 32) + 1148) = v15;
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(unsigned int *)(v16 + 1420);
  if (v17 == 7 || v17 == 2)
  {
    AFRCSetTxCap(*(void *)(*(void *)(a1 + 32) + 344), [(id)v16 currentAudioCap]);
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = *(unsigned int *)(v16 + 1420);
  }
  LOBYTE(v21) = 0;
  objc_msgSend(*(id *)(v16 + 352), "configureWithOperatingMode:isLocalCellular:localCellTech:isRemoteCellular:remoteCellTech:bitrateCapKbps:isTrafficBursty:featureFlags:", v17, IsInterfaceOnCellularForActiveConnectionWithQuality, v5, v4, *(unsigned int *)(a1 + 40), v15, v21);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v18 = VRTraceErrorLogLevelToCSTR();
    __int16 v19 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v20 = *(_DWORD *)(a1 + 44);
      *(_DWORD *)buf = 136316418;
      uint64_t v23 = v18;
      __int16 v24 = 2080;
      uint64_t v25 = "-[VCCallSession remoteCellTechStateUpdate:maxRemoteBitrate:]_block_invoke";
      __int16 v26 = 1024;
      int v27 = 1276;
      __int16 v28 = 2080;
      uint64_t v29 = v2;
      __int16 v30 = 1024;
      int v31 = v15;
      __int16 v32 = 1024;
      int v33 = v20;
      _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession: Remote CellTech has changed %s, max bitrate %u, max remote bitrate %u", buf, 0x32u);
    }
  }
}

- (id)getFeatureListStringForPayload:(int)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->featureListStringDict, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(void *)&a3)), "objectForKey:", @"matchedFeatureListString");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (v4) {
        int v7 = (const char *)objc_msgSend((id)objc_msgSend(v4, "description"), "UTF8String");
      }
      else {
        int v7 = "<nil>";
      }
      int64_t videoPayload = self->videoPayload;
      int v10 = 136316162;
      uint64_t v11 = v5;
      __int16 v12 = 2080;
      unsigned int v13 = "-[VCCallSession getFeatureListStringForPayload:]";
      __int16 v14 = 1024;
      int v15 = 1282;
      __int16 v16 = 2080;
      uint64_t v17 = v7;
      __int16 v18 = 2048;
      int64_t v19 = videoPayload;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d HandoverReport: transmitter updated feature list string to %s, for payload: %ld", (uint8_t *)&v10, 0x30u);
    }
  }
  return v4;
}

- (int)applyFeatureListStringForPayload:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)int v44 = v5;
  long long v45 = v5;
  memset(v42, 170, sizeof(v42));
  int v40 = -1431655766;
  unint64_t v41 = 0xAAAAAAAAAAAAAAAALL;
  int v6 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->featureListStringDict, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:")), "objectForKey:", @"matchedFeatureListString");
  int v7 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->featureListStringDict, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v3)), "objectForKey:", @"localFeatureListString");
  uint64_t v8 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->featureListStringDict, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v3)), "objectForKey:", @"remoteFeatureListString");
  if (v6)
  {
    int v9 = (void *)v8;
    self->remoteSupportsVisibleRect = +[VCVideoFeatureListStringHelper findFeatureString:value:valueLength:withPrefix:](VCVideoFeatureListStringHelper, "findFeatureString:value:valueLength:withPrefix:", [v6 UTF8String], 0, 0, "CR");
    self->canLocalResizePIP = +[VCVideoFeatureListStringHelper findFeatureString:value:valueLength:withPrefix:](VCVideoFeatureListStringHelper, "findFeatureString:value:valueLength:withPrefix:", [v7 UTF8String], 0, 0, "PR");
    if (+[VCVideoFeatureListStringHelper findFeatureString:value:valueLength:withPrefix:](VCVideoFeatureListStringHelper, "findFeatureString:value:valueLength:withPrefix:", [v6 UTF8String], v44, 32, "AR")&& sscanf(v44, "%d/%d,%d/%d", &v42[16], &v42[12], &v42[8], &v42[4]) == 4)
    {
      if (+[VCVideoFeatureListStringHelper findFeatureString:value:valueLength:withPrefix:](VCVideoFeatureListStringHelper, "findFeatureString:value:valueLength:withPrefix:", [v9 UTF8String], 0, 0, "PR"))
      {
        self->canRemoteResizePIP = 1;
LABEL_8:
        if (+[VCVideoFeatureListStringHelper findFeatureString:value:valueLength:withPrefix:](VCVideoFeatureListStringHelper, "findFeatureString:value:valueLength:withPrefix:", [v6 UTF8String], v44, 32, "XR"))
        {
          if (sscanf(v44, "%d/%d,%d/%d", v42, (char *)&v41 + 4, &v41, &v40) != 4)
          {
            *(_DWORD *)uint64_t v42 = *(_DWORD *)&v42[16];
            int v40 = *(_DWORD *)&v42[4];
            unint64_t v41 = *(void *)&v42[8];
          }
          BOOL v10 = 1;
        }
        else
        {
          BOOL v10 = 0;
          *(_DWORD *)uint64_t v42 = *(_DWORD *)&v42[16];
          int v40 = *(_DWORD *)&v42[4];
          unint64_t v41 = *(void *)&v42[8];
        }
        self->remoteSupportsExpectedAspectRatio = v10;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v12 = VRTraceErrorLogLevelToCSTR();
          unsigned int v13 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            if (self->canRemoteResizePIP) {
              __int16 v14 = "";
            }
            else {
              __int16 v14 = "No ";
            }
            *(_DWORD *)buf = 136317954;
            *(void *)&uint8_t buf[4] = v12;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "-[VCCallSession applyFeatureListStringForPayload:]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 1393;
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = *(_DWORD *)&v42[16];
            *(_WORD *)&buf[34] = 1024;
            *(_DWORD *)&buf[36] = *(_DWORD *)&v42[12];
            *(_WORD *)&buf[40] = 1024;
            *(_DWORD *)&buf[42] = *(_DWORD *)&v42[8];
            *(_WORD *)&buf[46] = 1024;
            *(_DWORD *)&buf[48] = *(_DWORD *)&v42[4];
            *(_WORD *)&buf[52] = 2080;
            *(void *)&buf[54] = v14;
            *(_WORD *)&buf[62] = 1024;
            *(_DWORD *)&buf[64] = *(_DWORD *)v42;
            *(_WORD *)&buf[68] = 1024;
            *(_DWORD *)&buf[70] = HIDWORD(v41);
            *(_WORD *)&buf[74] = 1024;
            *(_DWORD *)&buf[76] = v41;
            *(_WORD *)&buf[80] = 1024;
            *(_DWORD *)&buf[82] = v40;
            _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Setting remote screen aspect ratio numbers %d/%d,%d/%d (%sPR), remote expects to receive %d/%d,%d/%d", buf, 0x56u);
          }
        }
        CGFloat v15 = (double)*(int *)&v42[4];
        self->remoteScreenPortraitAspectRatio.width = (double)*(int *)&v42[8];
        self->remoteScreenPortraitAspectRatio.height = v15;
        CGFloat v16 = (double)*(int *)&v42[12];
        self->remoteScreenLandscapeAspectRatio.width = (double)*(int *)&v42[16];
        CGFloat v17 = (double)(int)v41;
        CGFloat v18 = (double)v40;
        self->remoteScreenLandscapeAspectRatio.height = v16;
        self->remoteExpectedPortraitAspectRatio.width = v17;
        self->remoteExpectedPortraitAspectRatio.height = v18;
        CGFloat v19 = (double)SHIDWORD(v41);
        self->remoteExpectedLandscapeAspectRatio.width = (double)*(int *)v42;
        self->remoteExpectedLandscapeAspectRatio.height = v19;
        if (!self->isGKVoiceChat && (objc_opt_respondsToSelector() & 1) != 0)
        {
          id v20 = [(VCCallSession *)self newRemoteScreenAttributesForOrientation:0];
          id v21 = [(VCCallSession *)self newRemoteScreenAttributesForOrientation:3];
          [(VCCallSessionDelegate *)self->delegate session:self didChangeRemoteScreenAttributes:v20];
          [(VCCallSessionDelegate *)self->delegate session:self didChangeRemoteScreenAttributes:v21];
        }
        if (*(unsigned char *)[v6 UTF8String])
        {
          [v6 UTF8String];
          __lasts = (char *)0xAAAAAAAAAAAAAAAALL;
          memset(buf, 170, 0xC80uLL);
          __strlcpy_chk();
          int v22 = strtok_r((char *)buf, ";", &__lasts);
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v39 = 0;
            int v24 = 0;
            unsigned int v25 = 0;
            unsigned int v38 = 0;
            unsigned int v26 = 0;
            do
            {
              int v27 = strchr(v23, 58);
              if (v27)
              {
                __int16 v28 = v27;
                unsigned int v29 = atoi(v27 + 1);
                *__int16 v28 = 0;
                if (v29 <= 0x63)
                {
                  unsigned int v30 = v29;
                  if (!strcmp(v23, "MVRA") || !strcmp(v23, "VRA"))
                  {
                    unsigned int v26 = v30 + 1;
                  }
                  else if (!strcmp(v23, "RVRA1") || !strcmp(v23, "RVRA2"))
                  {
                    unsigned int v25 = v30 + 1;
                  }
                  else if (!strcmp(v23, "UEP"))
                  {
                    LODWORD(v39) = v30 + 1;
                  }
                  else if (!strcmp(v23, "AS"))
                  {
                    unsigned int v38 = v30 + 1;
                  }
                  else
                  {
                    int v31 = strcmp(v23, "CR");
                    unsigned int v32 = HIDWORD(v39);
                    if (!v31) {
                      unsigned int v32 = v30 + 1;
                    }
                    HIDWORD(v39) = v32;
                  }
                }
              }
              if (!strcmp(v23, "LF")) {
                int v24 = 1;
              }
              uint64_t v23 = strtok_r(0, ";", &__lasts);
            }
            while (v23);
          }
          else
          {
            unsigned int v26 = 0;
            uint64_t v39 = 0;
            unsigned int v38 = 0;
            unsigned int v25 = 0;
            int v24 = 0;
          }
          int v34 = v24 == 1;
          int v33 = v39;
          BOOL v35 = (v26 | v39 | v38 | v25 | HIDWORD(v39) | v24) != 0;
        }
        else
        {
          int v33 = 0;
          int v34 = 0;
          BOOL v35 = 0;
        }
        unsigned int v36 = objc_msgSend((id)(id)CFPreferencesCopyAppValue(@"useFakeLF", @"enableRRx"), "BOOLValue");
        int v11 = [(VCCallSession *)self Conference_SetBWEstMode:v34 | v36 bFakeLargeFrameMode:v36 & ~v34];
        if ((v11 & 0x80000000) == 0)
        {
          [(VCCallSession *)self setUseControlByte:v35];
          [(VCCallSession *)self setUseUEP:v33 != 0];
        }
        return v11;
      }
    }
    else
    {
      *(_DWORD *)&v42[16] = 3;
      *(_DWORD *)&v42[4] = 3;
      *(void *)&v42[8] = 0x200000002;
    }
    self->canRemoteResizePIP = 0;
    goto LABEL_8;
  }
  int v11 = -2146369521;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCCallSession applyFeatureListStringForPayload:]();
    }
  }
  return v11;
}

- (BOOL)chooseVideoPayloadForInterface:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if ([(VCCapabilities *)self->caps isDuplexAudioOnly]
    || ![(VCCapabilities *)self->caps isVideoEnabled])
  {
    return 0;
  }
  unsigned int IsInterfaceOnCellularForActiveConnectionWithQuality = VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality((uint64_t)self->connectionManager, 1, 1);
  unsigned int v27 = VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality((uint64_t)self->connectionManager, 1, 0);
  long long v5 = objc_opt_new();
  if ([(VCMediaNegotiator *)self->_mediaNegotiator usePreNegotiation])
  {
    if (v3 == 2) {
      unsigned __int8 v6 = 1;
    }
    else {
      unsigned __int8 v6 = 2;
    }
    mediaNegotiator = self->_mediaNegotiator;
    if (self->operatingMode == 4) {
      uint64_t v8 = [(VCMediaNegotiatorBase *)mediaNegotiator negotiatedScreenSettings];
    }
    else {
      uint64_t v8 = [(VCMediaNegotiatorBase *)mediaNegotiator negotiatedVideoSettings];
    }
    CGFloat v17 = [(VCMediaNegotiatorResultsVideo *)v8 videoRuleCollections];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    CGFloat v18 = [(VCVideoRuleCollections *)v17 supportedPayloads];
    uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v36 objects:v35 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v37;
      uint64_t v22 = v6;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v37 != v21) {
            objc_enumerationMutation(v18);
          }
          int v24 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          if (objc_msgSend(-[VCVideoRuleCollections getVideoRulesForTransport:payload:encodingType:](v17, "getVideoRulesForTransport:payload:encodingType:", v22, objc_msgSend(v24, "unsignedIntValue"), 1), "count"))
          {
            [v5 addObject:v24];
          }
        }
        uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v36 objects:v35 count:16];
      }
      while (v20);
    }
  }
  else
  {
    id v10 = [(VCImageAttributeRules *)[(VCCallSession *)self imageAttributeRules] extractDimensionsForInterface:v3 direction:0];
    [v10 count];
    v26[3] = v26;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    int v11 = (void *)[v10 allKeys];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v30 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v32 != v14) {
            objc_enumerationMutation(v11);
          }
          CGFloat v16 = *(void **)(*((void *)&v31 + 1) + 8 * j);
          [v16 intValue];
          objc_msgSend(v5, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v16, "intValue")));
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v31 objects:v30 count:16];
      }
      while (v13);
    }
  }
  BOOL v9 = [(VCCallSession *)self chooseVideoPayload:v5 operatingMode:self->operatingMode isLocalOnCellular:IsInterfaceOnCellularForActiveConnectionWithQuality isRemoteOnCellular:v27];
  if (!v9)
  {
    uint64_t v29 = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if (VRTraceIsOSFaultDisabled())
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCallSession chooseVideoPayloadForInterface:]();
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        -[VCCallSession chooseVideoPayloadForInterface:]();
      }
    }
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", &v29, 32002, 223, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 1478), @"Could not find a compatible codec. Participant may switched wireless interface.", @"No matching codec");
    [(VCCallSession *)self disconnect:v29 didRemoteCancel:0];
  }

  return v9;
}

- (id)getVideoRuleForVideoMode:(unint64_t)a3 interface:(int)a4 sessionBitrate:(int *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unsigned int v18 = -1431655766;
  unsigned int v19 = -1431655766;
  int v17 = -1431655766;
  BOOL v9 = [(VCCallSession *)self getVideoSettings:a3 forInterface:*(void *)&a4 payload:LODWORD(self->videoPayload) width:&v19 height:&v18 framerate:&v17 bitRate:a5];
  uint64_t v10 = 192;
  if (self->operatingMode == 4) {
    uint64_t v10 = 200;
  }
  uint64_t v11 = *(unsigned int *)((char *)&self->super.isa + v10);
  if (!v9)
  {
    int64_t videoPayload = self->videoPayload;
    if (videoPayload == 123)
    {
      uint64_t v11 = 100;
    }
    else if (videoPayload == 100)
    {
      uint64_t v11 = 123;
    }
    [(VCCallSession *)self getVideoSettings:a3 forInterface:v6 payload:v11 width:&v19 height:&v18 framerate:&v17 bitRate:a5];
  }
  int v13 = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-facetime-photos-use-best-videorule", @"FaceTimePhotosUseBestVideoRule", MEMORY[0x1E4F1CC38], 0), "BOOLValue");
  if (a3 == 1 && v13) {
    [+[VCVideoRuleCollectionsCamera sharedInstance] getBestFrameWidth:&v19 frameHeight:&v18 frameRate:0];
  }
  uint64_t v14 = [VCVideoRule alloc];
  *(float *)&double v15 = (float)v17;
  return [(VCVideoRule *)v14 initWithFrameWidth:v19 frameHeight:v18 frameRate:v11 payload:v15];
}

- (void)setCurrentEncodeRule:(id)a3
{
  currentEncodeRule = self->_currentEncodeRule;
  if (currentEncodeRule != a3)
  {

    self->_currentEncodeRule = (VCVideoRule *)a3;
  }
}

- (void)resetVideoRulesForInterface:(int)a3 videoReportingDictionary:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  if (-[VCCallSession chooseVideoPayloadForInterface:](self, "chooseVideoPayloadForInterface:"))
  {
    id v7 = [(VCCallSession *)self getVideoRuleForVideoMode:1 interface:v5 sessionBitrate:0];
    id v8 = [(VCCallSession *)self getVideoRuleForVideoMode:2 interface:v5 sessionBitrate:0];
    id v9 = [(VCCallSession *)self getFeatureListStringForPayload:LODWORD(self->videoPayload)];
    [(VCCallSession *)self applyFeatureListStringForPayload:LODWORD(self->videoPayload)];
    [(VCCallSession *)self setCurrentEncodeRule:v8];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v31 = [v7 iWidth];
        int v30 = [v7 iHeight];
        [v7 fRate];
        double v13 = v12;
        [v7 fPref];
        double v15 = v14;
        int v29 = [v7 iPayload];
        int v28 = [v8 iWidth];
        int v16 = [v8 iHeight];
        [v8 fRate];
        double v18 = v17;
        [v8 fPref];
        *(_DWORD *)buf = 136318722;
        uint64_t v33 = v10;
        __int16 v34 = 2080;
        BOOL v35 = "-[VCCallSession resetVideoRulesForInterface:videoReportingDictionary:]";
        __int16 v36 = 1024;
        int v37 = 1551;
        __int16 v38 = 1024;
        int v39 = v31;
        __int16 v40 = 1024;
        int v41 = v30;
        __int16 v42 = 2048;
        double v43 = v13;
        __int16 v44 = 2048;
        double v45 = v15;
        __int16 v46 = 1024;
        int v47 = v29;
        __int16 v48 = 1024;
        int v49 = v28;
        __int16 v50 = 1024;
        int v51 = v16;
        __int16 v52 = 2048;
        double v53 = v18;
        __int16 v54 = 2048;
        double v55 = v19;
        __int16 v56 = 1024;
        int v57 = [v8 iPayload];
        __int16 v58 = 2080;
        uint64_t v59 = [v9 UTF8String];
        __int16 v60 = 1024;
        int v61 = v5;
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession: reset video rules to new capture rule = %dx%dx%.1ffps(%.1f, %d), new encode rule = %dx%dx%.1ffps(%.1f, %d), featureListString %s, interface %d", buf, 0x78u);
      }
    }
    [(VCCallSessionDelegate *)self->delegate session:self changeVideoRulesToCaptureRule:v7 encodeRule:v8 featureListString:v9];
    [v8 iWidth];
    [v8 iHeight];
    [v8 fRate];
    reportingVideoProp();
    if (a4)
    {
      if (v7 && v8)
      {
        uint64_t v20 = NSString;
        uint64_t v21 = [v7 iWidth];
        uint64_t v22 = [v7 iHeight];
        [v7 fRate];
        [a4 setObject:objc_msgSend(v20, "stringWithFormat:", @"%dx%d@%.1f", v21, v22, v23), @"captureRule" forKeyedSubscript];
        int v24 = NSString;
        uint64_t v25 = [v8 iWidth];
        uint64_t v26 = [v8 iHeight];
        [v8 fRate];
        [a4 setObject:objc_msgSend(v24, "stringWithFormat:", @"%dx%d@%.1f", v25, v26, v27), @"encodeRule" forKeyedSubscript];
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCallSession resetVideoRulesForInterface:videoReportingDictionary:]();
        }
      }
    }
  }
}

- (void)schedulePrimaryConnectionChange:(id)a3 oldConnection:(id)a4
{
  v5[7] = *MEMORY[0x1E4F143B8];
  connectionChangeQueue = self->connectionChangeQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__VCCallSession_schedulePrimaryConnectionChange_oldConnection___block_invoke;
  v5[3] = &unk_1E6DB43D8;
  v5[4] = self;
  v5[5] = a4;
  void v5[6] = a3;
  dispatch_async(connectionChangeQueue, v5);
}

void __63__VCCallSession_schedulePrimaryConnectionChange_oldConnection___block_invoke(void *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 4;
  uint64_t v1 = a1[4];
  unint64_t v3 = *(void *)(v1 + 88);
  if (v3 >= 2)
  {
    if (v3 == 2)
    {
      uint64_t v10 = a1[5];
      uint64_t v9 = a1[6];
      uint64_t v11 = (void *)a1[4];
      [v11 primaryConnectionDidChangeTo:v9 oldConnection:v10];
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __63__VCCallSession_schedulePrimaryConnectionChange_oldConnection___block_invoke_cold_1();
      }
    }
  }
  else
  {
    *(void *)(v1 + 88) = 1;
    if (!*(void *)(*v2 + 96))
    {
      *(void *)(*v2 + 96) = a1[5];
      id v4 = *(id *)(a1[4] + 96);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v5 = VRTraceErrorLogLevelToCSTR();
        uint64_t v6 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          id v7 = *(void **)(*v2 + 96);
          if (v7) {
            id v8 = (const char *)objc_msgSend((id)objc_msgSend(v7, "description"), "UTF8String");
          }
          else {
            id v8 = "<nil>";
          }
          int v12 = 136315906;
          uint64_t v13 = v5;
          __int16 v14 = 2080;
          double v15 = "-[VCCallSession schedulePrimaryConnectionChange:oldConnection:]_block_invoke";
          __int16 v16 = 1024;
          int v17 = 1585;
          __int16 v18 = 2080;
          float v19 = v8;
          _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d HandoverReport: schedule a pending primary connection change, old primary connection: %s", (uint8_t *)&v12, 0x26u);
        }
      }
    }
  }
}

- (void)handlePendingPrimaryConnectionChange
{
  v3[5] = *MEMORY[0x1E4F143B8];
  connectionChangeQueue = self->connectionChangeQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__VCCallSession_handlePendingPrimaryConnectionChange__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(connectionChangeQueue, v3);
}

void __53__VCCallSession_handlePendingPrimaryConnectionChange__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) lock];
  uint64_t v2 = (const void *)VCConnectionManager_CopyPrimaryConnection(*(void *)(*(void *)(a1 + 32) + 80));
  [*(id *)(a1 + 32) unlock];
  if (v2)
  {
    if (*(void *)(*(void *)(a1 + 32) + 88) == 1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v3 = VRTraceErrorLogLevelToCSTR();
        id v4 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v7 = 136315650;
          uint64_t v8 = v3;
          __int16 v9 = 2080;
          uint64_t v10 = "-[VCCallSession handlePendingPrimaryConnectionChange]_block_invoke";
          __int16 v11 = 1024;
          int v12 = 1607;
          _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d HandoverReport: handle a pending primary connection change", (uint8_t *)&v7, 0x1Cu);
        }
      }
      [*(id *)(a1 + 32) primaryConnectionDidChangeTo:v2 oldConnection:*(void *)(*(void *)(a1 + 32) + 96)];

      *(void *)(*(void *)(a1 + 32) + 96) = 0;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315650;
        uint64_t v8 = v5;
        __int16 v9 = 2080;
        uint64_t v10 = "-[VCCallSession handlePendingPrimaryConnectionChange]_block_invoke";
        __int16 v11 = 1024;
        int v12 = 1612;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d HandoverReport: audio/video setup done. Update connection change state to ready", (uint8_t *)&v7, 0x1Cu);
      }
    }
    *(void *)(*(void *)(a1 + 32) + 88) = 2;
    CFRelease(v2);
  }
}

- (void)primaryConnectionDidChangeTo:(id)a3 oldConnection:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ([(VCCallSession *)self isCallOngoing])
  {
    uint64_t v27 = 0;
    int v28 = &v27;
    uint64_t v29 = 0x2020000000;
    int IsLocalOnCellular = -1431655766;
    int IsLocalOnCellular = VCConnection_IsLocalOnCellular((uint64_t)a3);
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    int IsRemoteOnCellular = -1431655766;
    int IsRemoteOnCellular = VCConnection_IsRemoteOnCellular((uint64_t)a3);
    int v7 = VCConnection_IsLocalOnCellular((uint64_t)a4);
    int v8 = VCConnection_IsRemoteOnCellular((uint64_t)a4);
    int v9 = [a4 isWifiToWifi];
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    if (v9) {
      int v10 = 2;
    }
    else {
      int v10 = 1;
    }
    uint64_t v23 = 0x2020000000;
    int v24 = -1431655766;
    if ([a3 isWifiToWifi]) {
      int v11 = 2;
    }
    else {
      int v11 = 1;
    }
    int v24 = v11;
    BOOL v12 = v10 != *((_DWORD *)v22 + 6);
    int v13 = *((_DWORD *)v28 + 6);
    if (v7)
    {
      if (!v13) {
        [(VCCallSession *)self cleanupWCMClient];
      }
      LOBYTE(v13) = 0;
    }
    else if (v13)
    {
      [(VCCallSession *)self setupWCMClient];
      LOBYTE(v13) = 1;
    }
    cellTechQueue = self->cellTechQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__VCCallSession_primaryConnectionDidChangeTo_oldConnection___block_invoke;
    block[3] = &unk_1E6DB7318;
    int v16 = v7;
    int v17 = v8;
    BOOL v19 = v12;
    int v18 = v10;
    block[8] = v25;
    block[9] = &v21;
    block[4] = a3;
    void block[5] = self;
    block[6] = a4;
    block[7] = &v27;
    char v20 = v13;
    dispatch_async(cellTechQueue, block);
    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(v25, 8);
    _Block_object_dispose(&v27, 8);
  }
}

uint64_t __60__VCCallSession_primaryConnectionDidChangeTo_oldConnection___block_invoke(uint64_t a1)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      int v5 = *(_DWORD *)(a1 + 80);
      int v6 = *(_DWORD *)(a1 + 84);
      int v7 = *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      int v8 = *(unsigned __int8 *)(a1 + 92);
      int v9 = *(_DWORD *)(a1 + 88);
      int v10 = *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      *(_DWORD *)buf = 136317442;
      uint64_t v44 = v2;
      __int16 v45 = 2080;
      __int16 v46 = "-[VCCallSession primaryConnectionDidChangeTo:oldConnection:]_block_invoke";
      __int16 v47 = 1024;
      int v48 = 1648;
      __int16 v49 = 1024;
      int v50 = v5;
      __int16 v51 = 1024;
      int v52 = v4;
      __int16 v53 = 1024;
      int v54 = v6;
      __int16 v55 = 1024;
      int v56 = v7;
      __int16 v57 = 1024;
      int v58 = v8;
      __int16 v59 = 1024;
      int v60 = v9;
      __int16 v61 = 1024;
      int v62 = v10;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d HandoverReport: local use cellular[%d->%d], remote use cellular[%d->%d], need capture change[%d], interface[%d->%d].", buf, 0x46u);
    }
  }
  uint64_t v11 = VCConnection_LocalCellTech(*(void *)(a1 + 32));
  uint64_t v12 = VCConnection_RemoteCellTech(*(void *)(a1 + 32));
  VideoTransmitter_SetCellTech(*(void *)(*(void *)(a1 + 40) + 1256), *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), v11, *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), v12);
  uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)(a1 + 92)) {
    [*(id *)(a1 + 40) resetVideoRulesForInterface:*(unsigned int *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) videoReportingDictionary:v13];
  }
  uint64_t v14 = VCBitrateArbiter_ModeFromOperatingMode(*(_DWORD *)(*(void *)(a1 + 40) + 1420));
  uint64_t v15 = [*(id *)(*(void *)(a1 + 40) + 1176) maxAllowedBitrateForVCConnection:*(void *)(a1 + 32) forLocalInterface:1 arbiterMode:v14 encodeRule:*(void *)(*(void *)(a1 + 40) + 176)];
  uint64_t v16 = [*(id *)(*(void *)(a1 + 40) + 1176) maxAllowedBitrateForVCConnection:*(void *)(a1 + 32) forLocalInterface:0 arbiterMode:v14 encodeRule:*(void *)(*(void *)(a1 + 40) + 176)];
  uint64_t v17 = VCConnectionManager_CopyConnectionForQuality(*(void *)(*(void *)(a1 + 40) + 80), 1);
  int v18 = (void *)v17;
  if (v17 != *(void *)(a1 + 48) && v17 != *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      char v20 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v44 = v19;
        __int16 v45 = 2080;
        __int16 v46 = "-[VCCallSession primaryConnectionDidChangeTo:oldConnection:]_block_invoke";
        __int16 v47 = 1024;
        int v48 = 1668;
        _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Overwrite bitrate cap and cell related flags as primary and active connections differ in connectionManager", buf, 0x1Cu);
      }
    }
    if ([v18 isWifiToWifi]) {
      int v21 = 2;
    }
    else {
      int v21 = 1;
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v21;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = VCConnection_IsLocalOnCellular((uint64_t)v18);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = VCConnection_IsRemoteOnCellular((uint64_t)v18);
    uint64_t v11 = VCConnection_LocalCellTech((uint64_t)v18);
    uint64_t v12 = VCConnection_RemoteCellTech((uint64_t)v18);
    uint64_t v15 = [*(id *)(*(void *)(a1 + 40) + 1176) maxAllowedBitrateForVCConnection:v18 forLocalInterface:1 arbiterMode:v14 encodeRule:*(void *)(*(void *)(a1 + 40) + 176)];
    uint64_t v16 = [*(id *)(*(void *)(a1 + 40) + 1176) maxAllowedBitrateForVCConnection:v18 forLocalInterface:0 arbiterMode:v14 encodeRule:*(void *)(*(void *)(a1 + 40) + 176)];
    [*(id *)(*(void *)(a1 + 40) + 1232) setUseWiFiTiers:*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) == 2];
  }
  if (v18) {
    CFRelease(v18);
  }
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
    [*(id *)(*(void *)(a1 + 40) + 32) setMaxBandwidth:v16];
  }
  VCAudioReceiver_UpdateCellTech(*(void *)(*(void *)(a1 + 40) + 1224), v11, v12);
  if ([*(id *)(*(void *)(a1 + 40) + 320) isVideoEnabled]) {
    VideoReceiver_CellTechChanged();
  }
  int v22 = [*(id *)(a1 + 40) evaluateEnableRRx:0];
  int v23 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  int v24 = *(_DWORD *)(a1 + 80);
  AFRCUpdateCellTech(*(void *)(*(void *)(a1 + 40) + 344), v23, v11, *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), v12, v22, v23 != v24);
  if (v23 != v24) {
    MediaQueue_CleanupTxHistory();
  }
  if (v15 >= v16) {
    uint64_t v25 = v16;
  }
  else {
    uint64_t v25 = v15;
  }
  VideoTransmitter_SetBitrate(*(void *)(*(void *)(a1 + 40) + 1256), 1000 * v25);
  *(_DWORD *)(*(void *)(a1 + 40) + 1148) = v25;
  uint64_t v26 = *(void *)(a1 + 40);
  uint64_t v27 = *(unsigned int *)(v26 + 1420);
  if (v27 == 7 || v27 == 2)
  {
    AFRCSetTxCap(*(void *)(*(void *)(a1 + 40) + 344), [(id)v26 currentAudioCap]);
    uint64_t v26 = *(void *)(a1 + 40);
    uint64_t v27 = *(unsigned int *)(v26 + 1420);
  }
  LOBYTE(v40) = 0;
  objc_msgSend(*(id *)(v26 + 352), "configureWithOperatingMode:isLocalCellular:localCellTech:isRemoteCellular:remoteCellTech:bitrateCapKbps:isTrafficBursty:featureFlags:", v27, *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) != 0, v11, *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) != 0, v12, v25, v40);
  RTPSetBasebandCongestionDetector(*(void *)(*(void *)(a1 + 40) + 48), (const void *)[*(id *)(*(void *)(a1 + 40) + 352) basebandCongestionDetector]);
  uint64_t v28 = *(void *)(a1 + 40);
  if (!*(void *)(v28 + 352))
  {
    if (v11)
    {
      uint64_t IsLTEOrNewer = NetworkUtils_IsLTEOrNewer(v11);
      uint64_t v28 = *(void *)(a1 + 40);
    }
    else
    {
      uint64_t IsLTEOrNewer = 1;
    }
    [*(id *)(v28 + 360) setIsSenderProbingEnabled:IsLTEOrNewer];
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v30 = VRTraceErrorLogLevelToCSTR();
    uint64_t v31 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v32 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      *(_DWORD *)buf = 136316674;
      uint64_t v44 = v30;
      __int16 v45 = 2080;
      __int16 v46 = "-[VCCallSession primaryConnectionDidChangeTo:oldConnection:]_block_invoke";
      __int16 v47 = 1024;
      int v48 = 1719;
      __int16 v49 = 1024;
      int v50 = v32;
      __int16 v51 = 1024;
      int v52 = v25;
      __int16 v53 = 1024;
      int v54 = v15;
      __int16 v55 = 1024;
      int v56 = v16;
      _os_log_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession: handlePrimaryConnChange -- use cellular(%d), new bitrate cap %u, max local bitrate %u, max remote bitrate %u", buf, 0x34u);
    }
  }
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    int v41 = @"LCTCH";
    uint64_t v42 = [NSNumber numberWithUnsignedInt:v11];
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    reportingGenericEvent();
  }
  [*(id *)(a1 + 40) reportHandoverResultsWithDictionary:v13 localBitrateCap:v25 remoteBitrateCap:v16];
  if (*(unsigned char *)(a1 + 93))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v33 = VRTraceErrorLogLevelToCSTR();
      __int16 v34 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v44 = v33;
        __int16 v45 = 2080;
        __int16 v46 = "-[VCCallSession primaryConnectionDidChangeTo:oldConnection:]_block_invoke";
        __int16 v47 = 1024;
        int v48 = 1733;
        _os_log_impl(&dword_1E1EA4000, v34, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d HandoverReport: sending One-way SIP message to inform peer", buf, 0x1Cu);
      }
    }
    BOOL v35 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:v15];
    __int16 v36 = (void *)[objc_alloc(NSNumber) initWithInt:v11];
    int v37 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", v36, @"VCCellTechKey", v35, @"VCMaxBitrateKey", 0);
    __int16 v38 = (void *)[*(id *)(*(void *)(a1 + 40) + 1120) newPackedMessageFromDictionary:v37];
    [*(id *)(*(void *)(a1 + 40) + 1120) sendMessage:v38 withTopic:@"VCCellTechChangeTopic"];
  }
  [*(id *)(a1 + 40) updateCachedConnectionState];
  [*(id *)(a1 + 40) updateMaxPktLength];
  return [*(id *)(a1 + 40) notifyDelegateActiveConnectionDidChange];
}

- (void)setQualityDelegate:(id)a3
{
  p_qualityDelegateLock = &self->qualityDelegateLock;
  pthread_mutex_lock(&self->qualityDelegateLock);
  self->qualityDelegate = (VideoConferenceChannelQualityDelegate *)a3;

  pthread_mutex_unlock(p_qualityDelegateLock);
}

- (VideoConferenceChannelQualityDelegate)qualityDelegate
{
  return self->qualityDelegate;
}

- (int)getAudioTxBitrate
{
  audioTransmitter = self->audioTransmitter;
  if (audioTransmitter) {
    return [(VCAudioTransmitter *)audioTransmitter audioTxBitrate];
  }
  else {
    return 32000;
  }
}

- (double)networkQuality
{
  if (self->videoPayload == -1)
  {
    double v3 = (double)[(VCCallSession *)self getAudioTxBitrate];
    double v4 = 5000.0;
  }
  else
  {
    double v3 = 292000.0;
    double v4 = 68000.0;
  }
  v5.f64[0] = (double)self->bandwidthUpstream + 0.000001 - v4;
  double v6 = v3 - v4;
  v5.f64[1] = 1.0 - self->packetLateAndMissingRatio + -0.9;
  int v7 = (const double *)&unk_1E259FF30;
  float64x2_t v8 = vld1q_dup_f64(v7);
  v8.f64[0] = v6;
  float64x2_t v9 = vdivq_f64(v5, v8);
  __asm { FMOV            V1.2D, #1.0 }
  int8x16_t v15 = (int8x16_t)vcgtq_f64(v9, _Q1);
  int8x16_t v16 = (int8x16_t)vcltzq_f64(v9);
  float64x2_t v17 = (float64x2_t)vbslq_s8(vorrq_s8(v16, v15), vbicq_s8((int8x16_t)_Q1, vbicq_s8(v16, v15)), (int8x16_t)v9);
  *(void *)&double result = *(_OWORD *)&vmulq_laneq_f64(v17, v17, 1);
  return result;
}

- (void)updateRemoteMediaStallState:(double)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (a3 - self->lastReceivedPacketTimestamp > self->_remoteMediaStallTimeout && !self->isRemoteMediaStalled)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        double lastReceivedPacketTimestamp = self->lastReceivedPacketTimestamp;
        *(_DWORD *)buf = 136316162;
        uint64_t v25 = v11;
        __int16 v26 = 2080;
        uint64_t v27 = "-[VCCallSession updateRemoteMediaStallState:]";
        __int16 v28 = 1024;
        int v29 = 1796;
        __int16 v30 = 2048;
        double v31 = lastReceivedPacketTimestamp;
        __int16 v32 = 2048;
        double v33 = a3;
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession: Stalling lastReceivedPacketTime %f currentTime %f", buf, 0x30u);
      }
    }
    reportingLog();
    self->isRemoteMediaStalled = 1;
    self->int packetsSinceStall = 0;
    delegateNotificationQueue = self->delegateNotificationQueue;
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    int v21 = __45__VCCallSession_updateRemoteMediaStallState___block_invoke;
    int v22 = &unk_1E6DB3DC8;
    int v23 = self;
    p_uint64_t block = &block;
    goto LABEL_13;
  }
  if (self->packetsSinceStall >= 6 && self->isRemoteMediaStalled)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      double v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        double v7 = self->lastReceivedPacketTimestamp;
        int packetsSinceStall = self->packetsSinceStall;
        *(_DWORD *)buf = 136316418;
        uint64_t v25 = v5;
        __int16 v26 = 2080;
        uint64_t v27 = "-[VCCallSession updateRemoteMediaStallState:]";
        __int16 v28 = 1024;
        int v29 = 1804;
        __int16 v30 = 2048;
        double v31 = v7;
        __int16 v32 = 2048;
        double v33 = a3;
        __int16 v34 = 1024;
        int v35 = packetsSinceStall;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession: Unstalling lastReceivedPacketTime %f currentTime %f packetCount %d", buf, 0x36u);
      }
    }
    reportingLog();
    self->isRemoteMediaStalled = 0;
    delegateNotificationQueue = self->delegateNotificationQueue;
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    int8x16_t v16 = __45__VCCallSession_updateRemoteMediaStallState___block_invoke_220;
    float64x2_t v17 = &unk_1E6DB3DC8;
    int v18 = self;
    p_uint64_t block = &v14;
LABEL_13:
    dispatch_async(delegateNotificationQueue, p_block);
  }
  -[VCCallSession updateRemoteMediaStallStateReporting:](self, "updateRemoteMediaStallStateReporting:", a3, v14, v15, v16, v17, v18, block, v20, v21, v22, v23);
}

uint64_t __45__VCCallSession_updateRemoteMediaStallState___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) session:*(void *)(a1 + 32) remoteMediaStalled:*(unsigned __int8 *)(*(void *)(a1 + 32) + 608)];
}

uint64_t __45__VCCallSession_updateRemoteMediaStallState___block_invoke_220(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) session:*(void *)(a1 + 32) remoteMediaStalled:*(unsigned __int8 *)(*(void *)(a1 + 32) + 608)];
}

- (void)updateRemoteMediaStallStateReporting:(double)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a3 - self->lastReceivedPacketTimestamp <= 0.5)
  {
    if (!self->_isRemoteMediaStalledShort) {
      return;
    }
  }
  else if (!self->_isRemoteMediaStalledShort)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      double v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        double lastReceivedPacketTimestamp = self->lastReceivedPacketTimestamp;
        int v13 = 136316162;
        uint64_t v14 = v5;
        __int16 v15 = 2080;
        int8x16_t v16 = "-[VCCallSession updateRemoteMediaStallStateReporting:]";
        __int16 v17 = 1024;
        int v18 = 1818;
        __int16 v19 = 2048;
        double v20 = lastReceivedPacketTimestamp;
        __int16 v21 = 2048;
        double v22 = a3;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Entering short media stall lastReceivedPacketTime=%f, currentTime=%f", (uint8_t *)&v13, 0x30u);
      }
    }
    self->_lastMediaStallStartTime = a3;
    self->_isRemoteMediaStalledShort = 1;
    self->int packetsSinceShortMediaStall = 0;
    goto LABEL_15;
  }
  if (self->packetsSinceShortMediaStall < 6) {
    return;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    float64x2_t v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      double v10 = self->lastReceivedPacketTimestamp;
      int packetsSinceShortMediaStall = self->packetsSinceShortMediaStall;
      int v13 = 136316418;
      uint64_t v14 = v8;
      __int16 v15 = 2080;
      int8x16_t v16 = "-[VCCallSession updateRemoteMediaStallStateReporting:]";
      __int16 v17 = 1024;
      int v18 = 1825;
      __int16 v19 = 2048;
      double v20 = v10;
      __int16 v21 = 2048;
      double v22 = a3;
      __int16 v23 = 1024;
      int v24 = packetsSinceShortMediaStall;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Leaving short media stall lastReceivedPacketTime=%f, currentTime=%f, packetCount=%d", (uint8_t *)&v13, 0x36u);
    }
  }
  ++self->_mediaStallCount;
  double maxMediaStallTime = a3 - self->_lastMediaStallStartTime + 0.5;
  self->_mediaStallTotalTime = self->_mediaStallTotalTime + maxMediaStallTime;
  if (self->_maxMediaStallTime > maxMediaStallTime) {
    double maxMediaStallTime = self->_maxMediaStallTime;
  }
  self->_double maxMediaStallTime = maxMediaStallTime;
  self->_lastMediaStallStartTime = 0.0;
  self->_isRemoteMediaStalledShort = 0;
LABEL_15:
  -[VCCallSession reportImmediateWRMMetric:value:](self, "reportImmediateWRMMetric:value:", 1);
}

- (void)updateLastReceivedPacketWithTimestamp:(double)a3 packetType:(int)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->shouldUpdateLastReceivedPacketTimestamp)
  {
    timestampQueue = self->timestampQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__VCCallSession_updateLastReceivedPacketWithTimestamp_packetType___block_invoke;
    block[3] = &unk_1E6DB3F58;
    block[4] = self;
    *(double *)&void block[5] = a3;
    int v6 = a4;
    dispatch_async(timestampQueue, block);
  }
}

uint64_t __66__VCCallSession_updateLastReceivedPacketWithTimestamp_packetType___block_invoke(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) lock];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 593))
  {
    double v3 = *(double *)(a1 + 40);
    double v4 = *(double *)(v2 + 600);
    if (v3 > v4 && *(unsigned char *)(v2 + 608))
    {
      ++*(_DWORD *)(v2 + 652);
      uint64_t v2 = *(void *)(a1 + 32);
      double v4 = *(double *)(v2 + 600);
    }
    if (v3 > v4 && *(unsigned char *)(v2 + 648))
    {
      ++*(_DWORD *)(v2 + 656);
      uint64_t v2 = *(void *)(a1 + 32);
      double v4 = *(double *)(v2 + 600);
    }
    if (v3 > v4) {
      *(double *)(v2 + 600) = v3;
    }
    double v5 = micro();
    double v6 = v5;
    uint64_t v7 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(v7 + 1404) && v5 - *(double *)(v7 + 600) > *(double *)(v7 + 800) * 0.5)
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      CFDictionarySetValue(Mutable, @"SymptomReporterOptionalKeySessionID", *(const void **)(*(void *)(a1 + 32) + 760));
      CFDictionarySetValue(Mutable, @"SymptomReporterOptionalKeyPeerID", *(const void **)(*(void *)(a1 + 32) + 1536));
      reportingSymptom();
      *(unsigned char *)(*(void *)(a1 + 32) + 1404) = 1;
      CFRelease(Mutable);
      uint64_t v7 = *(void *)(a1 + 32);
    }
    if (!*(unsigned char *)(v7 + 904) || v6 - *(double *)(v7 + 600) <= *(double *)(v7 + 800))
    {
LABEL_20:
      double v13 = *(double *)(v7 + 688);
      if (v13 == 0.0)
      {
        *(double *)(v7 + 736) = v6;
        *(double *)(*(void *)(a1 + 32) + 728) = v6;
        *(double *)(*(void *)(a1 + 32) + 688) = v6;
        uint64_t v7 = *(void *)(a1 + 32);
        double v13 = *(double *)(v7 + 688);
      }
      if (v6 - v13 <= 1.0)
      {
LABEL_46:
        [(id)v7 updateRemoteMediaStallState:v6];
        uint64_t v23 = *(void *)(a1 + 32);
        double v24 = v6 - *(double *)(v23 + 600);
        BOOL v25 = v24 > 1.0;
        if (v24 <= 1.0)
        {
          if (*(unsigned char *)(v23 + 816)) {
LABEL_52:
          }
            reportingNoRemoteChanged();
        }
        else
        {
          if (v6 - *(double *)(v23 + 792) > 1.0)
          {
            *(double *)(v23 + 792) = v6;
            uint64_t v26 = *(void *)(a1 + 32);
            double v27 = v6 - *(double *)(v26 + 600);
            __int16 v28 = *(NSObject **)(v26 + 504);
            v43[0] = MEMORY[0x1E4F143A8];
            v43[1] = 3221225472;
            v43[2] = __66__VCCallSession_updateLastReceivedPacketWithTimestamp_packetType___block_invoke_229;
            v43[3] = &unk_1E6DB4568;
            v43[4] = v26;
            *(double *)&v43[5] = v27;
            dispatch_async(v28, v43);
            uint64_t v23 = *(void *)(a1 + 32);
          }
          if (!*(unsigned char *)(v23 + 816)) {
            goto LABEL_52;
          }
        }
        *(unsigned char *)(*(void *)(a1 + 32) + 816) = v25;
        uint64_t v29 = *(void *)(a1 + 32);
        if (!*(unsigned char *)(v29 + 904)) {
          return [(id)v29 unlock];
        }
        double v30 = v6 - *(double *)(v29 + 728);
        double v31 = *(double *)(v29 + 744);
        double v32 = v6 - *(double *)(v29 + 736);
        if (v30 <= v31 && v32 <= v31) {
          return [(id)v29 unlock];
        }
        if (v30 > v31
          && (int)VRTraceGetErrorLogLevelForModule() >= 3
          && (uint64_t v34 = VRTraceErrorLogLevelToCSTR(),
              uint64_t v35 = *MEMORY[0x1E4F47A50],
              os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
        {
          if (__66__VCCallSession_updateLastReceivedPacketWithTimestamp_packetType___block_invoke_cold_2(v34, v35, v32 > v31))goto LABEL_62; {
        }
          }
        else if (v32 > v31)
        {
LABEL_62:
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              __66__VCCallSession_updateLastReceivedPacketWithTimestamp_packetType___block_invoke_cold_1();
            }
          }
        }
        if ([*(id *)(a1 + 32) isCallOngoing])
        {
          global_queue = dispatch_get_global_queue(2, 0);
          v42[0] = MEMORY[0x1E4F143A8];
          v42[1] = 3221225472;
          v42[2] = __66__VCCallSession_updateLastReceivedPacketWithTimestamp_packetType___block_invoke_231;
          v42[3] = &unk_1E6DB3DC8;
          v42[4] = *(void *)(a1 + 32);
          dispatch_async(global_queue, v42);
        }
        uint64_t v29 = *(void *)(a1 + 32);
        return [(id)v29 unlock];
      }
      if (v6 - *(double *)(v7 + 600) > *(double *)(v7 + 744) + -3.0)
      {
        *(double *)(v7 + 728) = v6;
        *(double *)(*(void *)(a1 + 32) + 736) = v6;
        uint64_t v7 = *(void *)(a1 + 32);
      }
      uint64_t v14 = *(void **)(v7 + 352);
      if (v14)
      {
        uint64_t v53 = 0;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v46 = 0u;
        memset(buf, 0, sizeof(buf));
        VCRateControlGetStatistics([v14 statisticsCollector], 3, (uint64_t)buf);
        int v15 = 0;
        *(double *)(*(void *)(a1 + 32) + 680) = *(double *)&buf[24] / 100.0;
        *(double *)(*(void *)(a1 + 32) + 696) = *(double *)(*(void *)(a1 + 32) + 680)
                                                  + *(double *)(*(void *)(a1 + 32) + 696);
        *(double *)(*(void *)(a1 + 32) + 704) = *(double *)(*(void *)(a1 + 32) + 704) + 1.0;
        double v16 = (double)(*(_DWORD *)&buf[52] / 0x3E8u);
      }
      else
      {
        *(_DWORD *)buf = -1431655766;
        int v15 = RTPGetAFRCStat(*(void *)(v7 + 48), (double *)(v7 + 680), 0, buf, 0, 0, 0);
        LODWORD(v18) = *(_DWORD *)buf;
        double v16 = (double)v18 * 0.0009765625;
      }
      *(double *)(*(void *)(a1 + 32) + 768) = v16;
      [*(id *)(a1 + 32) checkAbnormalOWRDAndResetLagReference];
      *(double *)(*(void *)(a1 + 32) + 688) = v6;
      __int16 v19 = *(double **)(a1 + 32);
      if (v6 - v19[90] >= 5.0)
      {
        v19[89] = v19[87] / v19[88];
        *(void *)(*(void *)(a1 + 32) + 696) = 0;
        *(void *)(*(void *)(a1 + 32) + 704) = 0;
        *(double *)(*(void *)(a1 + 32) + 720) = v6;
      }
      uint64_t v20 = *(void *)(a1 + 32);
      if (v15 < 0)
      {
        *(double *)(v20 + 728) = v6;
        uint64_t v20 = *(void *)(a1 + 32);
      }
      else
      {
        if (*(unsigned char *)(v20 + 993))
        {
          __int16 v21 = *(NSObject **)(v20 + 896);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __66__VCCallSession_updateLastReceivedPacketWithTimestamp_packetType___block_invoke_228;
          block[3] = &unk_1E6DB4568;
          block[4] = v20;
          *(double *)&void block[5] = v6;
          dispatch_async(v21, block);
          uint64_t v20 = *(void *)(a1 + 32);
        }
        if (*(double *)(v20 + 680) < 0.6)
        {
          *(double *)(v20 + 728) = v6;
          uint64_t v20 = *(void *)(a1 + 32);
        }
        if (*(double *)(v20 + 768) >= 4.5) {
          goto LABEL_42;
        }
      }
      *(double *)(v20 + 736) = v6;
LABEL_42:
      uint64_t v22 = *(void *)(a1 + 32);
      if (*(void *)(v22 + 352)) {
        *(_DWORD *)(v22 + 520) = *(_DWORD *)(v22 + 1408);
      }
      else {
        RTPGetAFRCTxInfo(*(void *)(v22 + 48), (_DWORD *)(v22 + 520), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
      }
      *(float *)(*(void *)(a1 + 32) + 780) = VCAudioReceiver_GetPercentPacketsLateAndMissing(*(void *)(*(void *)(a1 + 32) + 1224));
      [*(id *)(a1 + 32) logDetailedNetworkInformation];
      [*(id *)(a1 + 32) updateNetworkCheckHint:v6];
      uint64_t v7 = *(void *)(a1 + 32);
      goto LABEL_46;
    }
    char v9 = [(id)v7 isCallOngoing];
    uint64_t v2 = *(void *)(a1 + 32);
    if (v9)
    {
      *(unsigned char *)(v2 + 593) = 0;
      int v10 = [*(id *)(*(void *)(a1 + 32) + 1512) detailedErrorCode];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        uint64_t v12 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v38 = *(void *)(a1 + 32);
          uint64_t v37 = *(void *)(a1 + 40);
          uint64_t v39 = *(void *)(v38 + 600);
          uint64_t v40 = *(void *)(v38 + 800);
          int v41 = *(_DWORD *)(a1 + 48);
          *(_DWORD *)buf = 136316930;
          *(void *)&uint8_t buf[4] = v11;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "-[VCCallSession updateLastReceivedPacketWithTimestamp:packetType:]_block_invoke";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 1910;
          *(_WORD *)&buf[28] = 2048;
          *(double *)&buf[30] = v6;
          *(_WORD *)&buf[38] = 2048;
          *(void *)&buf[40] = v37;
          *(_WORD *)&buf[48] = 2048;
          *(void *)&buf[50] = v39;
          *(_WORD *)&buf[58] = 2048;
          *(void *)&buf[60] = v40;
          *(_WORD *)&buf[68] = 1024;
          *(_DWORD *)&buf[70] = v41;
          _os_log_error_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_ERROR, "VCCallSession [%s] %s:%d Disconnecting due to no remote packet currentTime=%f lastPacketTime=%f lastReceivedPacketTimestamp=%f noRemotePacketsTimeout=%f packetType=%d", buf, 0x4Au);
        }
      }
      VCUtil_GenerateDiagnostics(0, 1, "Disconnecting due to no remote packets.", 1u);
      [*(id *)(a1 + 32) disconnectWithNoRemotePackets:v10];
      uint64_t v7 = *(void *)(a1 + 32);
      goto LABEL_20;
    }
  }

  return [(id)v2 unlock];
}

void __66__VCCallSession_updateLastReceivedPacketWithTimestamp_packetType___block_invoke_228(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (pthread_mutex_t **)(a1 + 32);
  [*(id *)(*(void *)(a1 + 32) + 984) addNewRTT:*(double *)(*(void *)(a1 + 32) + 768) packetLossRate:*(double *)(*(void *)(a1 + 32) + 680) timestamp:*(double *)(a1 + 40)];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    double v3 = *MEMORY[0x1E4F47A50];
    double v4 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t sig = (*v1)[12].__sig;
        uint64_t v6 = *(void *)&(*v1)[10].__opaque[32];
        int v11 = 136316162;
        uint64_t v12 = v2;
        __int16 v13 = 2080;
        uint64_t v14 = "-[VCCallSession updateLastReceivedPacketWithTimestamp:packetType:]_block_invoke";
        __int16 v15 = 1024;
        int v16 = 1971;
        __int16 v17 = 2048;
        uint64_t v18 = sig;
        __int16 v19 = 2048;
        uint64_t v20 = v6;
        _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d roundTripTime = %f, packetLossRate = %f", (uint8_t *)&v11, 0x30u);
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      __66__VCCallSession_updateLastReceivedPacketWithTimestamp_packetType___block_invoke_228_cold_1(v2, (uint64_t)v1, v3);
    }
  }
  pthread_mutex_lock(*v1 + 13);
  id v7 = *(id *)&(*v1)[12].__opaque[48];
  pthread_mutex_unlock(*v1 + 13);
  if ([*(id *)&(*v1)[15].__opaque[16] isLinkCongested]) {
    float v8 = 0.5;
  }
  else {
    float v8 = 0.0;
  }
  uint64_t v9 = [*(id *)&(*v1)->__opaque[24] participantID];
  *(float *)&double v10 = v8;
  [v7 lossRate:v9 forParticipantID:v10];
}

uint64_t __66__VCCallSession_updateLastReceivedPacketWithTimestamp_packetType___block_invoke_229(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "session:receivedNoPacketsForSeconds:", *(double *)(a1 + 40));
}

uint64_t __66__VCCallSession_updateLastReceivedPacketWithTimestamp_packetType___block_invoke_231(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 993)) {
    [*(id *)(v2 + 1512) reportNetworkConditionsDegraded];
  }
  v5[0] = 0;
  uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 2062);
  +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", v5, 32020, 202, v3, objc_msgSend(NSString, "stringWithFormat:", @"Network conditions became unusable for %d seconds", (int)*(double *)(*(void *)(a1 + 32) + 744)), @"Bad network conditions");
  return [*(id *)(a1 + 32) disconnect:v5[0] didRemoteCancel:0];
}

- (void)checkAbnormalOWRDAndResetLagReference
{
  float OWRD = VCAudioReceiver_GetOWRD((uint64_t)self->audioReceiver);
  if (OWRD > 2.0
    && ((roundTripTime = self->roundTripTime, v5 = roundTripTime <= 0.0, v6 = OWRD, double v7 = roundTripTime * 5.0, !v5)
      ? (BOOL v8 = v7 < v6)
      : (BOOL v8 = 0),
        v8))
  {
    int abnormalOWRDCount = self->abnormalOWRDCount;
    self->int abnormalOWRDCount = abnormalOWRDCount + 1;
    if (abnormalOWRDCount >= 3)
    {
      audioReceiver = self->audioReceiver;
      VCAudioReceiver_ResetLagReference((uint64_t)audioReceiver);
    }
  }
  else
  {
    self->int abnormalOWRDCount = 0;
  }
}

- (void)updateLastReceivedAudioTime
{
  double LatestAudioTimestamp = VCAudioReceiver_GetLatestAudioTimestamp((uint64_t)self->audioReceiver);

  [(VCCallSession *)self updateLastReceivedPacketWithTimestamp:5 packetType:LatestAudioTimestamp];
}

- (void)updateLastReceivedPacket:(BOOL)a3 packetType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (a3) {
    double lastReceivedPacketTimestamp = micro();
  }
  else {
    double lastReceivedPacketTimestamp = self->lastReceivedPacketTimestamp;
  }

  [(VCCallSession *)self updateLastReceivedPacketWithTimestamp:v4 packetType:lastReceivedPacketTimestamp];
}

- (void)dealloc
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if ((VCCallSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      BOOL v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        perfTimers = self->perfTimers;
        if (perfTimers) {
          double v7 = (const char *)objc_msgSend((id)-[TimingCollection description](perfTimers, "description"), "UTF8String");
        }
        else {
          double v7 = "<nil>";
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v28 = v4;
        __int16 v29 = 2080;
        double v30 = "-[VCCallSession dealloc]";
        __int16 v31 = 1024;
        int v32 = 2106;
        __int16 v33 = 2080;
        uint64_t v34 = (void *)v7;
        __int16 v35 = 1024;
        LODWORD(v36) = [(VCCallSession *)self callID];
        uint64_t v12 = "VCCallSession [%s] %s:%d perfTimers=%s, callID = %u";
        __int16 v13 = v5;
        uint32_t v14 = 44;
        goto LABEL_17;
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v3 = (__CFString *)[(VCCallSession *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        double v10 = self->perfTimers;
        if (v10) {
          int v11 = (const char *)objc_msgSend((id)-[TimingCollection description](v10, "description"), "UTF8String");
        }
        else {
          int v11 = "<nil>";
        }
        *(_DWORD *)buf = 136316674;
        uint64_t v28 = v8;
        __int16 v29 = 2080;
        double v30 = "-[VCCallSession dealloc]";
        __int16 v31 = 1024;
        int v32 = 2106;
        __int16 v33 = 2112;
        uint64_t v34 = v3;
        __int16 v35 = 2048;
        uint64_t v36 = self;
        __int16 v37 = 2080;
        uint64_t v38 = v11;
        __int16 v39 = 1024;
        unsigned int v40 = [(VCCallSession *)self callID];
        uint64_t v12 = "VCCallSession [%s] %s:%d %@(%p) perfTimers=%s, callID = %u";
        __int16 v13 = v9;
        uint32_t v14 = 64;
LABEL_17:
        _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
      }
    }
  }
  if ([(VCCapabilities *)self->caps isVideoEnabled]) {
    reportingGenericEvent();
  }
  reportingGenericEvent();
  reportingSetPeriodicAggregationOccuredHandler();
  reportingUnregisterPeriodicTask();
  reportingUnregisterPeriodicTask();
  [(VCCallSession *)self sendTimings];

  self->cameraTimers = 0;
  self->perfTimers = 0;
  [(VCCallSession *)self setDelegate:0];
  [(VCCallSession *)self setCaptionsDelegate:0];
  hSIP = self->hSIP;
  if (hSIP != (tagHANDLE *)0xFFFFFFFFLL) {
    SIPCloseCall((uint64_t)hSIP, [(VCCallInfo *)self->localCallInfo callID]);
  }
  [(VCTransportSession *)self->_transportSession setPerfTimings:0];
  [(VCTransportSession *)self->_transportSession stop];

  if (self->skeState)
  {
    SKEState_Destroy();
    self->skeState = 0;
  }
  if ([(VCCallSession *)self isSIPEnabled] && self->hSIP != (tagHANDLE *)0xFFFFFFFFLL) {
    objc_msgSend(+[VideoConferenceManager defaultVideoConferenceManager](VideoConferenceManager, "defaultVideoConferenceManager"), "stopSIPWithTransportType:", self->_transportType);
  }
  +[VCVTPWrapper stopVTP];
  [+[VCQoSMonitorManager sharedInstance] unregisterQoSReportingSourceForToken:[(VCCallInfo *)self->localCallInfo callID]];

  pausedAudioHeartBeat = self->pausedAudioHeartBeat;
  if (pausedAudioHeartBeat) {
    dispatch_release(pausedAudioHeartBeat);
  }
  dispatch_release((dispatch_object_t)self->connectionChangeQueue);
  dispatch_release((dispatch_object_t)self->videoQueue);
  dispatch_release((dispatch_object_t)self->videoAsyncQueue);
  dispatch_release((dispatch_object_t)self->audioQueue);
  dispatch_release((dispatch_object_t)self->delegateNotificationQueue);
  dispatch_release((dispatch_object_t)self->qualityQueue);

  pthread_mutex_destroy(&self->mutex);
  pthread_mutex_destroy(&self->srtpLock);
  pthread_mutex_destroy(&self->pauseLock);
  pthread_mutex_destroy(&self->qualityDelegateLock);
  dispatch_release((dispatch_object_t)self->cellTechQueue);
  dispatch_release((dispatch_object_t)self->timestampQueue);

  self->callSessionBitrateArbiter = 0;
  videoMediaControlInfoGenerator = self->videoMediaControlInfoGenerator;
  if (videoMediaControlInfoGenerator) {
    CFRelease(videoMediaControlInfoGenerator);
  }
  audioMediaControlInfoGenerator = self->audioMediaControlInfoGenerator;
  if (audioMediaControlInfoGenerator) {
    CFRelease(audioMediaControlInfoGenerator);
  }
  [(VCCallSession *)self setRemoteVideoAttributes:0];

  audioReceiver = self->audioReceiver;
  if (audioReceiver)
  {
    free(audioReceiver);
    self->audioReceiver = 0;
  }
  captionsReceiver = self->_captionsReceiver;
  if (captionsReceiver)
  {

    self->_captionsReceiver = 0;
  }
  wrmInfo = self->wrmInfo;
  if (wrmInfo)
  {
    free(wrmInfo);
    self->wrmInfo = 0;
  }

  hdTransferSession = self->hdTransferSession;
  if (hdTransferSession)
  {
    VTPixelTransferSessionInvalidate(hdTransferSession);
    uint64_t v23 = self->hdTransferSession;
    if (v23)
    {
      CFRelease(v23);
      self->hdTransferSession = 0;
    }
  }
  hdBufferPool = self->hdBufferPool;
  if (hdBufferPool)
  {
    CVPixelBufferPoolRelease(hdBufferPool);
    self->hdBufferPool = 0;
  }
  VCReporting_finalizeAggregation();
  reportingAgent = self->reportingAgent;
  if (reportingAgent) {
    CFRelease(reportingAgent);
  }

  VRLogfileFree((uint64_t *)&self->_callLogFile);
  objc_msgSend(+[VCEffectsManager sharedManager](VCEffectsManager, "sharedManager"), "setReportingAgent:", 0);
  [(VCCallSession *)self deregisterForReportingNotifications];
  v26.receiver = self;
  v26.super_class = (Class)VCCallSession;
  [(VCCallSession *)&v26 dealloc];
}

- (BOOL)isSIPEnabled
{
  return [(VCMediaNegotiatorBase *)self->_mediaNegotiator negotiatedFaceTimeSettings]
      && ![(VCMediaNegotiatorResultsFaceTimeSettings *)[(VCMediaNegotiatorBase *)self->_mediaNegotiator negotiatedFaceTimeSettings] SIPDisabled]|| self->_transportType == 0;
}

- (BOOL)isSecureMessagingRequired
{
  if ([(VCMediaNegotiatorResultsFaceTimeSettings *)[(VCMediaNegotiatorBase *)self->_mediaNegotiator negotiatedFaceTimeSettings] secureMessagingRequired])
  {
    return 1;
  }
  else
  {
    return ![(VCCallSession *)self isSIPEnabled];
  }
}

- (unsigned)mediaControlInfoFECFeedbackVersion
{
  uint64_t v2 = [(VCMediaNegotiatorBase *)self->_mediaNegotiator negotiatedFaceTimeSettings];

  return [(VCMediaNegotiatorResultsFaceTimeSettings *)v2 mediaControlInfoFECFeedbackVersion];
}

- (BOOL)isFECGeneratorEnabled
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  char v3 = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-fec-generator-enabled", @"isFECGeneratorEnabled", &unk_1F3DC47A0, 0), "BOOLValue");
  int v4 = [(VCCallSession *)self mediaControlInfoFECFeedbackVersion];
  BOOL IsLossStatsEnabled = VCMediaControlInfo_IsLossStatsEnabled(v4);
  BOOL result = v3 | IsLossStatsEnabled;
  if ((v3 & 1) == 0 && IsLossStatsEnabled)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315906;
        uint64_t v10 = v7;
        __int16 v11 = 2080;
        uint64_t v12 = "-[VCCallSession isFECGeneratorEnabled]";
        __int16 v13 = 1024;
        int v14 = 2259;
        __int16 v15 = 1024;
        int v16 = v4;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Enabling FECGenerator for FECFeedbackVersion %d", (uint8_t *)&v9, 0x22u);
      }
    }
    return IsLossStatsEnabled;
  }
  return result;
}

- (unsigned)defaultMediaControlInfoFECFeedbackVersion
{
  return objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-fec-feedback-version", @"fecFeedbackVersion", objc_msgSend(NSNumber, "numberWithUnsignedChar:", 1), 0), "unsignedIntValue");
}

- (id)activeControlChannel
{
  BOOL v3 = [(VCCallSession *)self isSecureMessagingRequired];
  uint64_t v4 = 1128;
  if (v3) {
    uint64_t v4 = 1136;
  }
  return *(Class *)((char *)&self->super.isa + v4);
}

- (void)timeoutUnfinishedConnection
{
  if (!self->isStarted
    && [(VCCallSession *)self isSIPEnabled]
    && self->hSIP != (tagHANDLE *)0xFFFFFFFFLL)
  {
    [(VCCallSession *)self setupConnectionTimeoutTimerWithErrorCode:32012 detailedCode:243 description:@"The connection timed out without getting started" reason:@"Client disconnected session before completely initializing it"];
  }
}

- (void)cancelConnectionTimeoutTimer
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->connectionTimeoutSource)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315650;
        uint64_t v7 = v3;
        __int16 v8 = 2080;
        int v9 = "-[VCCallSession cancelConnectionTimeoutTimer]";
        __int16 v10 = 1024;
        int v11 = 2289;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Cancelling Timeout Source", (uint8_t *)&v6, 0x1Cu);
      }
    }
    dispatch_source_cancel((dispatch_source_t)self->connectionTimeoutSource);
    connectionTimeoutSource = self->connectionTimeoutSource;
    if (connectionTimeoutSource)
    {
      dispatch_release(connectionTimeoutSource);
      self->connectionTimeoutSource = 0;
    }
  }
}

- (void)setupConnectionTimeoutTimerWithErrorCode:(int)a3 detailedCode:(int)a4 description:(id)a5 reason:(id)a6
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(VCCallSession *)self lock];
  [(VCCallSession *)self cancelConnectionTimeoutTimer];
  self->connectionTimeoutSource = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, 0);
  double v11 = micro();
  connectionTimeoutSource = self->connectionTimeoutSource;
  if (connectionTimeoutSource)
  {
    double v13 = v11;
    dispatch_time_t v14 = dispatch_walltime(0, 10000000000);
    dispatch_source_set_timer(connectionTimeoutSource, v14, 0x2540BE400uLL, 0x2540BE400uLL);
    __int16 v15 = self->connectionTimeoutSource;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __90__VCCallSession_setupConnectionTimeoutTimerWithErrorCode_detailedCode_description_reason___block_invoke;
    v16[3] = &unk_1E6DB7340;
    *(double *)&v16[7] = v13;
    int v17 = a3;
    int v18 = a4;
    v16[4] = self;
    v16[5] = a5;
    void v16[6] = a6;
    dispatch_source_set_event_handler(v15, v16);
    dispatch_resume((dispatch_object_t)self->connectionTimeoutSource);
  }
  [(VCCallSession *)self unlock];
}

void __90__VCCallSession_setupConnectionTimeoutTimerWithErrorCode_detailedCode_description_reason___block_invoke(uint64_t a1)
{
  v2[1] = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 1405))
  {
    reportingSymptom();
    *(unsigned char *)(*(void *)(a1 + 32) + 1405) = 1;
  }
  if (micro() - *(double *)(a1 + 56) > 60.0)
  {
    [*(id *)(a1 + 32) cancelConnectionTimeoutTimer];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __90__VCCallSession_setupConnectionTimeoutTimerWithErrorCode_detailedCode_description_reason___block_invoke_cold_1();
      }
    }
    v2[0] = 0;
    +[GKVoiceChatError getNSError:v2 code:*(int *)(a1 + 64) detailedCode:*(int *)(a1 + 68) filePath:0 description:*(void *)(a1 + 40) reason:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) disconnect:v2[0] didRemoteCancel:0];
  }
}

- (void)setUpFirstRemoteFrameTimer
{
  v7[5] = *MEMORY[0x1E4F143B8];
  if ([(VCCapabilities *)self->caps isVideoEnabled])
  {
    uint64_t v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, 0);
    self->firstRemoteFrameTimemoutSource = v3;
    if (v3)
    {
      uint64_t v4 = v3;
      dispatch_time_t v5 = dispatch_walltime(0, 5000000000);
      dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0x2540BE400uLL);
      firstRemoteFrameTimemoutSource = self->firstRemoteFrameTimemoutSource;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __43__VCCallSession_setUpFirstRemoteFrameTimer__block_invoke;
      v7[3] = &unk_1E6DB3DC8;
      v7[4] = self;
      dispatch_source_set_event_handler(firstRemoteFrameTimemoutSource, v7);
      dispatch_resume((dispatch_object_t)self->firstRemoteFrameTimemoutSource);
    }
  }
}

uint64_t __43__VCCallSession_setUpFirstRemoteFrameTimer__block_invoke(uint64_t a1)
{
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionarySetValue(Mutable, @"SymptomReporterOptionalKeySessionID", *(const void **)(*(void *)(a1 + 32) + 760));
  CFDictionarySetValue(Mutable, @"SymptomReporterOptionalKeyPeerID", *(const void **)(*(void *)(a1 + 32) + 1536));
  reportingSymptom();
  CFRelease(Mutable);
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 cancelFirstRemoteFrameTimer];
}

- (void)cancelFirstRemoteFrameTimer
{
  firstRemoteFrameTimemoutSource = self->firstRemoteFrameTimemoutSource;
  if (firstRemoteFrameTimemoutSource)
  {
    dispatch_source_cancel(firstRemoteFrameTimemoutSource);
    uint64_t v4 = self->firstRemoteFrameTimemoutSource;
    if (v4)
    {
      dispatch_release(v4);
      self->firstRemoteFrameTimemoutSource = 0;
    }
  }
}

- (BOOL)isLocalOrRemoteOnCellular
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"treatLTEAs4G", @"com.apple.VideoConference", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v4 = AppBooleanValue == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    return self->_isLocalCellular_LowestConnectionQuality || self->_isRemoteCellular_LowestConnectionQuality;
  }
  if (NetworkUtils_IsLTEOrNewer([(VCConnectionManager *)self->connectionManager getCellularTechForActiveConnectionWithQuality:1 forLocalInterface:1]))return 0; {
  char IsLTEOrNewer = NetworkUtils_IsLTEOrNewer([(VCConnectionManager *)self->connectionManager getCellularTechForActiveConnectionWithQuality:1 forLocalInterface:0]);
  }
  BOOL result = 0;
  if ((IsLTEOrNewer & 1) == 0) {
    return self->_isLocalCellular_LowestConnectionQuality || self->_isRemoteCellular_LowestConnectionQuality;
  }
  return result;
}

- (void)pushAudioSamples:(opaqueVCAudioBufferList *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (![(AVCRateController *)self->_rateController statisticsCollector])
  {
    uint64_t v27 = 0;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    if ((AFRCGetAudioTxInfo((uint64_t)self->hAFRC, 0, 0, 0, 0, 0, 0, 0, 0, (uint64_t)&v15) & 0x80000000) == 0)
    {
      videoRedundancyController = self->_videoRedundancyController;
      v13[10] = v25;
      v13[11] = v26;
      uint64_t v14 = v27;
      v13[6] = v21;
      v13[7] = v22;
      v13[8] = v23;
      v13[9] = v24;
      v13[2] = v17;
      v13[3] = v18;
      v13[4] = v19;
      v13[5] = v20;
      v13[0] = v15;
      v13[1] = v16;
      [(VCRedundancyControllerVideo *)videoRedundancyController updateRedundancyStrategyWithNetworkStatistics:v13];
    }
  }
  if (self->state == 1
    && [(VCCallSession *)self isAudioRunning]
    && [(VCCallSession *)self shouldSendAudio])
  {
    if (VCAudioBufferList_GetSampleCount((uint64_t)a3))
    {
      [(VCAudioTransmitter *)self->audioTransmitter pushAudioSamples:a3];
      int v6 = [(VCAudioTransmitter *)self->audioTransmitter actualAudioSendingBitrate];
      if (self->useVCRC)
      {
        [(VCAudioTransmitter *)self->audioTransmitter setQualityIndicator:[(VCRateControlMediaController *)self->_mediaController audioFractionTier] == 0];
        VCRateControlMediaController_SetAudioSendingBitrate((uint64_t)self->_mediaController, v6, v7, v8);
      }
      if (self->useAFRC) {
        AFRCUpdateAudioSendingBitrate((uint64_t)self->hAFRC, v6);
      }
      if (self->_shouldReportWRMMetrics)
      {
        global_queue = dispatch_get_global_queue(0, 0);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __34__VCCallSession_pushAudioSamples___block_invoke;
        block[3] = &unk_1E6DB3DC8;
        block[4] = self;
        dispatch_async(global_queue, block);
      }
    }
    else
    {
      int Timestamp = VCAudioBufferList_GetTimestamp((uint64_t)a3);
      float v11 = (float)(Timestamp
                  - [(VCAudioTransmitter *)self->audioTransmitter lastSentAudioSampleTime]);
      if ((float)(v11 / (float)[(VCCallSession *)self sampleRate]) > 0.5) {
        [(VCAudioTransmitter *)self->audioTransmitter pushAudioSamples:a3];
      }
    }
  }
}

uint64_t __34__VCCallSession_pushAudioSamples___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) lock];
  WRMIncrementTime(*(void *)(*(void *)(a1 + 32) + 1496));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  long long v4 = 0u;
  VCAudioTransmitter_UpdateWrmMetrics(*(void *)(*(void *)(a1 + 32) + 48), *(void *)(*(void *)(a1 + 32) + 1496));
  VCAudioReceiver_UpdateWrmMetrics(*(void *)(*(void *)(a1 + 32) + 1224), *(void *)(*(void *)(a1 + 32) + 1496));
  uint64_t v2 = *(uint64_t **)(a1 + 32);
  if (v2[44]) {
    objc_msgSend(v2, "updateVCRateControlWRMMetrics:", v2[187], v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19,
  }
      v20,
      v21,
      v22);
  else {
    AFRCSetWrmMetrics(v2[43], (_DWORD *)v2[187]);
  }
  if (WRMGenerateReport(*(unsigned __int8 **)(*(void *)(a1 + 32) + 1496), (uint64_t)&v4)) {
    WRMSubmitReport(*(void *)(*(void *)(a1 + 32) + 1496), (uint64_t)&v4);
  }
  return objc_msgSend(*(id *)(a1 + 32), "unlock", v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20,
           v21,
           v22);
}

- (void)updateVCRateControlWRMMetrics:(tagWRMMetricsInfo *)a3
{
  a3->isCallAudioOnly = [(VCRateControlMediaController *)self->_mediaController isAudioOnly];
  a3->bwEstimation = [(AVCStatisticsCollector *)[(AVCRateController *)self->_rateController statisticsCollector] sharedEstimatedBandwidth];
  a3->targetBitrate = self->_targetBitrate / 0x3E8;
  unsigned int isLocalCellular_LowestConnectionQuality = self->_isLocalCellular_LowestConnectionQuality;
  a3->adaptationPacketLossPercentage = (self->packetLossRate * 100.0);
  a3->isLocalCellular = isLocalCellular_LowestConnectionQuality;
  a3->isVideoPaused = VCRateControlMediaController_IsVideoStopped(self->_mediaController);
}

- (BOOL)isCaller
{
  return self->isInitiator;
}

- (BOOL)startConnectionWithParticipantID:(id)a3 callID:(unsigned int)a4 usingInviteData:(id)a5 isCaller:(BOOL)a6 capabilities:(id)a7 idsSocket:(int)a8 destination:(id)a9 error:(id *)a10
{
  BOOL v12 = a6;
  uint64_t v13 = *(void *)&a4;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    long long v17 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      id v18 = a3;
      int v19 = a8;
      int v20 = [(VCCallSession *)self deviceRole];
      if (a7) {
        long long v21 = (const char *)objc_msgSend((id)objc_msgSend(a7, "description"), "UTF8String");
      }
      else {
        long long v21 = "<nil>";
      }
      if (a5) {
        long long v22 = (const char *)objc_msgSend((id)objc_msgSend(a5, "description"), "UTF8String");
      }
      else {
        long long v22 = "<nil>";
      }
      *(_DWORD *)buf = 136316930;
      *(void *)&uint8_t buf[4] = v16;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[VCCallSession startConnectionWithParticipantID:callID:usingInviteData:isCaller:capabilitie"
                            "s:idsSocket:destination:error:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 2471;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v13;
      *(_WORD *)&buf[34] = 1024;
      *(_DWORD *)&buf[36] = v12;
      *(_WORD *)&buf[40] = 1024;
      *(_DWORD *)&buf[42] = v20;
      *(_WORD *)&buf[46] = 2080;
      long long v47 = v21;
      __int16 v48 = 2080;
      long long v49 = v22;
      _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d startConnectionWithParticipantID: calluint64_t ID = %d, isCaller = %d, self.deviceRole = %d, caps = %s, inviteData = %s", buf, 0x42u);
      a8 = v19;
      a3 = v18;
    }
  }
  if (!self->isGKVoiceChat) {
    self->_shouldReportWRMMetrics = [+[VCHardwareSettingsEmbedded sharedInstance] hasBaseband];
  }
  if (self->isStarted)
  {
    close(a8);
    return 1;
  }
  [(TimingCollection *)self->perfTimers startTimingForKey:12];
  objc_opt_class();
  objc_opt_isKindOfClass();
  reportingModeRoleTransportLog();
  if (v12)
  {
    uint64_t v23 = [a5 objectForKeyedSubscript:@"InviteDataMediaBlob"];
    if (v23)
    {
      uint64_t v24 = v23;
      [(VCCallSession *)self lock];
      LOBYTE(v24) = [(VCMediaNegotiator *)self->_mediaNegotiator processResponseBlob:v24];
      [(VCCallSession *)self unlock];
      if ((v24 & 1) == 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
        {
          VRTraceErrorLogLevelToCSTR();
          if (VRTraceIsOSFaultDisabled())
          {
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCCallSession startConnectionWithParticipantID:callID:usingInviteData:isCaller:capabilities:idsSocket:destination:error:]();
            }
          }
          else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
          {
            -[VCCallSession startConnectionWithParticipantID:callID:usingInviteData:isCaller:capabilities:idsSocket:destination:error:].cold.4();
          }
        }
        +[GKVoiceChatError getNSError:a10 code:32031 detailedCode:200 filePath:0 description:@"Failed to process response media blob" reason:@"Media blob error"];
        int v39 = a8;
        goto LABEL_61;
      }
    }
  }
  if ([(VCCallSession *)self isSIPEnabled] && self->hSIP == (tagHANDLE *)0xFFFFFFFFLL)
  {
    objc_msgSend(+[VideoConferenceManager defaultVideoConferenceManager](VideoConferenceManager, "defaultVideoConferenceManager"), "startSIPWithPacketMultiplexMode:transportType:", -[VCCallSession mapPacketMultiplexModeToSIPMode:](self, "mapPacketMultiplexModeToSIPMode:", self->packetMultiplexMode), self->_transportType);
    self->hSIP = (tagHANDLE *)objc_msgSend(+[VideoConferenceManager defaultVideoConferenceManager](VideoConferenceManager, "defaultVideoConferenceManager"), "SIPHandle");
  }
  BOOL v25 = [(VCCallSession *)self isSecureMessagingRequired];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v25)
  {
    if (ErrorLogLevelForModule >= 6)
    {
      uint64_t v27 = VRTraceErrorLogLevelToCSTR();
      uint64_t v28 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = v27;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCCallSession startConnectionWithParticipantID:callID:usingInviteData:isCaller:capabilit"
                              "ies:idsSocket:destination:error:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 2515;
        _os_log_impl(&dword_1E1EA4000, v28, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Starting secure control channel", buf, 0x1Cu);
      }
    }
    if ([(VCCapabilities *)self->caps isKeyExchangeEnabled]) {
      uint64_t v29 = 0;
    }
    else {
      uint64_t v29 = [(VCCapabilities *)self->caps isDTLSEnabled] ^ 1;
    }
    int v32 = [[VCControlChannelMultiWay alloc] initWithTransportSessionID:v13 reportingAgent:self->reportingAgent mode:v29];
    self->secureControlChannel = v32;
    [(VCControlChannel *)v32 setDataReceivedDelegate:self];
    memset(buf, 0, sizeof(buf));
    *(_DWORD *)buf = 1;
    if (![(VCControlChannelMultiWay *)self->secureControlChannel addActiveParticipant:0 participantUUID:@"00000000-0000-0000-0000-000000000000" withConfiguration:buf]&& (int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCallSession startConnectionWithParticipantID:callID:usingInviteData:isCaller:capabilities:idsSocket:destination:error:]();
      }
    }
    [(VCControlChannelMultiWay *)self->secureControlChannel start];
  }
  else
  {
    if (ErrorLogLevelForModule >= 6)
    {
      uint64_t v30 = VRTraceErrorLogLevelToCSTR();
      __int16 v31 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = v30;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCCallSession startConnectionWithParticipantID:callID:usingInviteData:isCaller:capabilit"
                              "ies:idsSocket:destination:error:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 2527;
        _os_log_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Starting SIP control channel", buf, 0x1Cu);
      }
    }
    self->controlChannel = (VCControlChannel *)[[VCControlChannelFaceTime alloc] initWithCallID:v13 reportingAgent:self->reportingAgent];
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v33 = VRTraceErrorLogLevelToCSTR();
    uint64_t v34 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v35 = [(VCCallSession *)self mediaControlInfoFECFeedbackVersion];
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = v33;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[VCCallSession startConnectionWithParticipantID:callID:usingInviteData:isCaller:capabilitie"
                            "s:idsSocket:destination:error:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 2530;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v35;
      _os_log_impl(&dword_1E1EA4000, v34, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Media control info FEC feedback version is '%d'", buf, 0x22u);
    }
  }
  [(VCCallSession *)self setupPeerInfo:a3 usingInviteData:a5 isCaller:v12 capabilities:a7];
  if (v12 && [a5 objectForKeyedSubscript:@"InviteDataSKEBlob"])
  {
    [(VCCallSession *)self lock];
    if (self->skeState)
    {
      if (SKEState_SetBlob())
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCCallSession startConnectionWithParticipantID:callID:usingInviteData:isCaller:capabilities:idsSocket:destination:error:]();
          }
        }
      }
    }
    [(VCCallSession *)self unlock];
  }
  reportingSetUserInfo();
  [(VCCallSession *)self applyNegotiatedFaceTimeSettings];
  [(VCCallSession *)self setupABTesting];
  [(VCSwitchManager *)self->_switchManager negotiatedSwitches];
  [(VCSwitchManager *)self->_switchManager remoteSwitches];
  [(VCMediaNegotiatorResultsFaceTimeSettings *)[(VCMediaNegotiatorBase *)self->_mediaNegotiator negotiatedFaceTimeSettings] remoteFaceTimeSwitchesAvailable];
  [(VCCallSession *)self vcrcServerBagProfileNumber];
  [(VCConnectionManager *)self->connectionManager primaryConnHealthAllowedDelay];
  reportingConnecting();
  uint64_t v36 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  if (a8 != -1 || a9)
  {
    BOOL v40 = [(VCCallSession *)self setupIDSConnectionForCallID:v13 destination:a9 socket:a8 error:a10];
    uint64_t v38 = v45;
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __123__VCCallSession_startConnectionWithParticipantID_callID_usingInviteData_isCaller_capabilities_idsSocket_destination_error___block_invoke_272;
    v45[3] = &unk_1E6DB7388;
    v45[4] = v36;
    if (!v40) {
      goto LABEL_50;
    }
LABEL_52:
    -[VCTransportSession setCallActive:](self->_transportSession, "setCallActive:", [a7 isAudioPausedToStart] ^ 1);
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __123__VCCallSession_startConnectionWithParticipantID_callID_usingInviteData_isCaller_capabilities_idsSocket_destination_error___block_invoke_3;
    v43[3] = &unk_1E6DB73B0;
    v43[4] = v36;
    v43[5] = v38;
    [(VCTransportSession *)self->_transportSession setEventHandler:v43];
    [(VCTransportSession *)self->_transportSession setConnectionSelectionVersionWithLocalFrameworkVersion:[(VCCallInfo *)self->localCallInfo frameworkVersion] remoteFrameworkVersion:[(VCCallInfo *)self->remoteCallInfo frameworkVersion]];
    [(VCTransportSession *)self->_transportSession start];
    return 1;
  }
  BOOL v37 = [(VCCallSession *)self configureLegacyTransportWithInviteInfo:a5 error:a10];
  uint64_t v38 = v44;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __123__VCCallSession_startConnectionWithParticipantID_callID_usingInviteData_isCaller_capabilities_idsSocket_destination_error___block_invoke_2;
  v44[3] = &unk_1E6DB7388;
  v44[4] = v36;
  if (v37) {
    goto LABEL_52;
  }
LABEL_50:
  int v39 = a8;
LABEL_61:
  close(v39);
  return 0;
}

void __123__VCCallSession_startConnectionWithParticipantID_callID_usingInviteData_isCaller_capabilities_idsSocket_destination_error___block_invoke(uint64_t a1, void *a2)
{
  if (![a2 count] && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __123__VCCallSession_startConnectionWithParticipantID_callID_usingInviteData_isCaller_capabilities_idsSocket_destination_error___block_invoke_cold_1();
    }
  }
}

uint64_t __123__VCCallSession_startConnectionWithParticipantID_callID_usingInviteData_isCaller_capabilities_idsSocket_destination_error___block_invoke_272(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)[*(id *)(a1 + 32) strong];

  return [v3 handleReceivedPiggybackBlobIDS:a2];
}

uint64_t __123__VCCallSession_startConnectionWithParticipantID_callID_usingInviteData_isCaller_capabilities_idsSocket_destination_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)[*(id *)(a1 + 32) strong];

  return [v3 handleReceivedPiggybackBlobLegacy:a2];
}

void __123__VCCallSession_startConnectionWithParticipantID_callID_usingInviteData_isCaller_capabilities_idsSocket_destination_error___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v6 = (void *)[*(id *)(a1 + 32) strong];
  if (v6 && (long long v7 = v6, ([v6 isCallOngoing] & 1) != 0))
  {
    switch(a2)
    {
      case 1:
        uint64_t v8 = [a3 objectForKeyedSubscript:@"transportSessionEventInfoNewLink"];
        uint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"transportSessionEventInfoIsFirstLink"), "BOOLValue");
        [v7 handleNewConnectionSetup:v8 isInitialConnection:v9];
        break;
      case 2:
      case 16:
        return;
      case 3:
        uint64_t v13 = [a3 objectForKeyedSubscript:@"transportSessionEventInfoNewPrimary"];
        uint64_t v14 = [a3 objectForKeyedSubscript:@"transportSessionEventInfoOldPrimary"];
        [v7 handlePrimaryConnectionChanged:v13 oldPrimaryConnection:v14];
        break;
      case 4:
        uint64_t v15 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"transportSessionEventInfoIsDuplicationEnabled"), "BOOLValue");
        uint64_t v16 = [a3 objectForKeyedSubscript:@"transportSessionEventInfoActiveConnection"];
        [v7 handleDuplicationEnabled:v15 activeConnection:v16];
        break;
      case 5:
        long long v17 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
        v17();
        break;
      case 6:
        id v18 = (void *)[v7 localCallInfo];
        [v18 setSupportsSKEOptimization:0];
        break;
      case 7:
        [v7 disconnect:a3 didRemoteCancel:0];
        break;
      case 8:
        uint64_t v19 = [a3 intValue];
        [v7 handleCellTechChange:v19];
        break;
      case 9:
        uint64_t v20 = [a3 unsignedShortValue];
        [v7 handleCellularMTUChanged:v20];
        break;
      case 10:
        [v7 hAFRC];
        AFRCMarkNetworkChange();
        break;
      default:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          uint64_t v21 = VRTraceErrorLogLevelToCSTR();
          long long v11 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v22 = 136315906;
            uint64_t v23 = v21;
            __int16 v24 = 2080;
            BOOL v25 = "-[VCCallSession startConnectionWithParticipantID:callID:usingInviteData:isCaller:capabilities:idsSocke"
                  "t:destination:error:]_block_invoke";
            __int16 v26 = 1024;
            int v27 = 2639;
            __int16 v28 = 1024;
            int v29 = a2;
            BOOL v12 = "VCCallSession [%s] %s:%d Received invalid transportSession event(%d)";
            goto LABEL_10;
          }
        }
        break;
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    long long v11 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 136315906;
      uint64_t v23 = v10;
      __int16 v24 = 2080;
      BOOL v25 = "-[VCCallSession startConnectionWithParticipantID:callID:usingInviteData:isCaller:capabilities:idsSocket:dest"
            "ination:error:]_block_invoke_3";
      __int16 v26 = 1024;
      int v27 = 2585;
      __int16 v28 = 1024;
      int v29 = a2;
      BOOL v12 = "VCCallSession [%s] %s:%d Received transportSession event %d while call is not ongoing. Skipping";
LABEL_10:
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v22, 0x22u);
    }
  }
}

- (void)verifyFaceTimeClassicNotOnNewerBuilds
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d Failed to allocate optionalDictionary", v2, v3, v4, v5, v6);
}

- (void)handleReceivedPiggybackBlobIDS:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint8_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = v5;
      __int16 v31 = 2080;
      int v32 = "-[VCCallSession handleReceivedPiggybackBlobIDS:]";
      __int16 v33 = 1024;
      int v34 = 2679;
      __int16 v35 = 2048;
      id v36 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Received piggyback blob %p", buf, 0x26u);
    }
  }
  [(VCCallSession *)self lock];
  if (a3)
  {
    if (self->skeState)
    {
      uint64_t v13 = SKEState_SetBlob();
      if (v13)
      {
        int v29 = v13;
        VCSignalErrorAt(v13, "Signalled error at %s: SKEState_SetBlob(1) failed", v14, v15, v16, v17, v18, v19, (char)"-[VCCallSession handleReceivedPiggybackBlobIDS:]");
      }
      else if (!self->isInitiator {
             && (int v20 = [(VCCallSession *)self setSKEBlobOnTransportSession]) != 0)
      }
      {
        int v29 = v20;
      }
      else
      {
        dispatch_time(0, 5000000000);
        uint64_t v21 = SKEState_CopySecretKeySync();
        if (!v21)
        {
          [(VCCallSession *)self handleKeyExchangeCompleted];
          [(VCCallSession *)self unlock];
          return;
        }
        int v29 = v21;
        VCSignalErrorAt(v21, "Signalled error at %s: SKEState_CopySecretKeySync failed", v22, v23, v24, v25, v26, v27, (char)"-[VCCallSession handleReceivedPiggybackBlobIDS:]");
      }
      [(VCCallSession *)self unlock];
      goto LABEL_18;
    }
    int v28 = VCSignalErrorAt(263, "Signalled error at %s: skeState is NULL", v7, v8, v9, v10, v11, v12, (char)"-[VCCallSession handleReceivedPiggybackBlobIDS:]");
  }
  else
  {
    int v28 = VCSignalErrorAt(260, "Signalled error at %s: Piggyback SKE blob is nil", v7, v8, v9, v10, v11, v12, (char)"-[VCCallSession handleReceivedPiggybackBlobIDS:]");
  }
  int v29 = v28;
  [(VCCallSession *)self unlock];
  if (v29)
  {
LABEL_18:
    *(void *)buf = 0;
    +[GKVoiceChatError getNSError:buf code:32018 detailedCode:v29 filePath:0 description:@"Media insecure" reason:@"Key exchange failed"];
    [(VCCallSession *)self disconnect:*(void *)buf didRemoteCancel:0];
  }
}

- (void)handleReceivedPiggybackBlobLegacy:(id)a3
{
  [(VCCallSession *)self lock];
  secretKey = self->secretKey;
  self->secretKey = (__CFData *)a3;
  if (a3) {
    CFRetain(a3);
  }
  if (secretKey) {
    CFRelease(secretKey);
  }
  [(VCCallSession *)self handleKeyExchangeCompleted];

  [(VCCallSession *)self unlock];
}

- (void)applyNegotiatedFaceTimeSettings
{
  [(VCSwitchManager *)self->_switchManager setRemoteSwitches:[(VCMediaNegotiatorResultsFaceTimeSettings *)[(VCMediaNegotiatorBase *)self->_mediaNegotiator negotiatedFaceTimeSettings] faceTimeSwitches]];
  [(VCSwitchManager *)self->_switchManager negotiateSwitches];
  uint64_t v3 = [(VCMediaNegotiatorResultsFaceTimeSettings *)[(VCMediaNegotiatorBase *)self->_mediaNegotiator negotiatedFaceTimeSettings] remoteLinkProbingCapabilityVersion];
  connectionManager = self->connectionManager;

  [(VCConnectionManager *)connectionManager setRemoteLinkProbingCapabilityVersion:v3];
}

- (void)setupABTesting
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    __str = 0;
    switchManager = self->_switchManager;
    uint64_t v4 = switchManager
       ? (const char *)objc_msgSend(-[VCSwitchManager description](switchManager, "description"), "UTF8String")
       : "<nil>";
    asprintf(&__str, "A/B testing: %s", v4);
    if (__str)
    {
      __lasts = 0;
      uint64_t v5 = strtok_r(__str, "\n", &__lasts);
      uint8_t v6 = (os_log_t *)MEMORY[0x1E4F47A50];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v7 = VRTraceErrorLogLevelToCSTR();
          uint64_t v8 = *v6;
          if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v30 = v7;
            __int16 v31 = 2080;
            int v32 = "-[VCCallSession setupABTesting]";
            __int16 v33 = 1024;
            int v34 = 2729;
            __int16 v35 = 2080;
            id v36 = "-[VCCallSession setupABTesting]";
            __int16 v37 = 2080;
            uint64_t v38 = v5;
            _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        uint64_t v5 = strtok_r(0, "\n", &__lasts);
      }
      while (v5);
      free(__str);
    }
  }
  [(VCConnectionManager *)self->connectionManager setPreferRelayOverP2PEnabled:[(VCSwitchManager *)self->_switchManager isSwitchEnabled:1]];
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v11 = [(VCConnectionManager *)self->connectionManager preferRelayOverP2PEnabled];
      *(_DWORD *)buf = 136315906;
      uint64_t v30 = v9;
      __int16 v31 = 2080;
      int v32 = "-[VCCallSession setupABTesting]";
      __int16 v33 = 1024;
      int v34 = 2732;
      __int16 v35 = 1024;
      LODWORD(v36) = v11;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Load switch preferRelayOverP2P %d", buf, 0x22u);
    }
  }
  [(VCConnectionManager *)self->connectionManager setFastMediaDuplicationEnabled:[(VCSwitchManager *)self->_switchManager isSwitchEnabled:64]];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    uint64_t v13 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v14 = [(VCConnectionManager *)self->connectionManager fastMediaDuplicationEnabled];
      *(_DWORD *)buf = 136315906;
      uint64_t v30 = v12;
      __int16 v31 = 2080;
      int v32 = "-[VCCallSession setupABTesting]";
      __int16 v33 = 1024;
      int v34 = 2734;
      __int16 v35 = 1024;
      LODWORD(v36) = v14;
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Load switch fastMediaDuplicationEnabled %d", buf, 0x22u);
    }
  }
  [(VCConnectionManager *)self->connectionManager setDuplicateImportantPktsEnabled:[(VCSwitchManager *)self->_switchManager isSwitchEnabled:512]];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    uint64_t v16 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v17 = [(VCConnectionManager *)self->connectionManager duplicateImportantPktsEnabled];
      *(_DWORD *)buf = 136315906;
      uint64_t v30 = v15;
      __int16 v31 = 2080;
      int v32 = "-[VCCallSession setupABTesting]";
      __int16 v33 = 1024;
      int v34 = 2736;
      __int16 v35 = 1024;
      LODWORD(v36) = v17;
      _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Load switch duplicateImportantPktsEnabled %d", buf, 0x22u);
    }
  }
  [(VCConnectionManager *)self->connectionManager setLowNetworkModeEnabled:[(VCSwitchManager *)self->_switchManager isSwitchEnabled:0x1000000]];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v18 = VRTraceErrorLogLevelToCSTR();
    uint64_t v19 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v20 = [(VCConnectionManager *)self->connectionManager lowNetworkModeEnabled];
      *(_DWORD *)buf = 136315906;
      uint64_t v30 = v18;
      __int16 v31 = 2080;
      int v32 = "-[VCCallSession setupABTesting]";
      __int16 v33 = 1024;
      int v34 = 2738;
      __int16 v35 = 1024;
      LODWORD(v36) = v20;
      _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Load switch lowNetworkModeEnabled %d", buf, 0x22u);
    }
  }
  [(VCConnectionManager *)self->connectionManager setDuplicationEnhancementEnabled:[(VCSwitchManager *)self->_switchManager isLocalSwitchEnabled:0x2000000]];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v21 = VRTraceErrorLogLevelToCSTR();
    uint64_t v22 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v23 = [(VCConnectionManager *)self->connectionManager duplicationEnhancementEnabled];
      *(_DWORD *)buf = 136315906;
      uint64_t v30 = v21;
      __int16 v31 = 2080;
      int v32 = "-[VCCallSession setupABTesting]";
      __int16 v33 = 1024;
      int v34 = 2740;
      __int16 v35 = 1024;
      LODWORD(v36) = v23;
      _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Load switch duplicationEnhancementEnabled %d", buf, 0x22u);
    }
  }
  [(VCConnectionManager *)self->connectionManager setiRATDuplicationEnabled:[(VCSwitchManager *)self->_switchManager isSwitchEnabled:0x8000000]];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v24 = VRTraceErrorLogLevelToCSTR();
    uint64_t v25 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v26 = [(VCConnectionManager *)self->connectionManager iRATDuplicationEnabled];
      *(_DWORD *)buf = 136315906;
      uint64_t v30 = v24;
      __int16 v31 = 2080;
      int v32 = "-[VCCallSession setupABTesting]";
      __int16 v33 = 1024;
      int v34 = 2742;
      __int16 v35 = 1024;
      LODWORD(v36) = v26;
      _os_log_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Load switch iRATDuplicationEnabled %d", buf, 0x22u);
    }
  }
}

- (void)setupWCMClient
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (MEMORY[0x1E4FB7058] && WCMEnabled() && !self->isGKVoiceChat)
  {
    if (NetworkUtils_IsLTEOrNewer([(VCConnectionManager *)self->connectionManager getCellularTechForActiveConnectionWithQuality:1 forLocalInterface:1]))
    {
      if (!self->vcWCMClient)
      {
        uint8_t v6 = objc_alloc_init(VCWCMClient);
        self->vcWCMClient = v6;
        [(VCWCMClient *)v6 setWcmClientDelegate:self];
        vcWCMClient = self->vcWCMClient;
        [(VCWCMClient *)vcWCMClient startWCMClient];
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315650;
        uint64_t v10 = v8;
        __int16 v11 = 2080;
        uint64_t v12 = "-[VCCallSession setupWCMClient]";
        __int16 v13 = 1024;
        int v14 = 2750;
        uint64_t v5 = "VCCallSession [%s] %s:%d WCM: non-LTE RAT not supported.";
        goto LABEL_7;
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315650;
      uint64_t v10 = v3;
      __int16 v11 = 2080;
      uint64_t v12 = "-[VCCallSession setupWCMClient]";
      __int16 v13 = 1024;
      int v14 = 2760;
      uint64_t v5 = "VCCallSession [%s] %s:%d WCM: not supported on this device.";
LABEL_7:
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v9, 0x1Cu);
    }
  }
}

- (void)cleanupWCMClient
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (MEMORY[0x1E4FB7058] && WCMEnabled() && !self->isGKVoiceChat)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 136315650;
        uint64_t v6 = v3;
        __int16 v7 = 2080;
        uint64_t v8 = "-[VCCallSession cleanupWCMClient]";
        __int16 v9 = 1024;
        int v10 = 2767;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d WCM: cleanup start.", (uint8_t *)&v5, 0x1Cu);
      }
    }
    [(VCWCMClient *)self->vcWCMClient stopWCMClient];
    [(VCWCMClient *)self->vcWCMClient setWcmClientDelegate:0];

    self->vcWCMClient = 0;
  }
}

- (void)setupWRMClient
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (!self->isGKVoiceChat && !self->vcWRMClient)
  {
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    uint64_t v4 = (os_log_t *)MEMORY[0x1E4F47A50];
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v24 = v5;
        __int16 v25 = 2080;
        BOOL v26 = "-[VCCallSession setupWRMClient]";
        __int16 v27 = 1024;
        int v28 = 2797;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d WRM: vcWRMClient setup start.", buf, 0x1Cu);
      }
    }
    *(void *)&long long v21 = self;
    *((void *)&v21 + 1) = MEMORY[0x1E4F1C280];
    uint64_t v22 = MEMORY[0x1E4F1C278];
    RTPSetWRMInfo((uint64_t)self->rtpHandle, (uint64_t)self->wrmInfo);
    RTPSetWRMMetricsCallback((uint64_t)self->rtpHandle, (uint64_t)WRMReportMetricsCallback, &v21);
    RTPSetWRMCallId((uint64_t)self->rtpHandle, [(VCCallInfo *)self->localCallInfo callID]);
    RTPSetWRMInfo((uint64_t)self->rtpVideo, (uint64_t)self->wrmInfo);
    RTPSetWRMMetricsCallback((uint64_t)self->rtpVideo, (uint64_t)WRMReportMetricsCallback, &v21);
    RTPSetWRMCallId((uint64_t)self->rtpVideo, [(VCCallInfo *)self->localCallInfo callID]);
    [(VCConnectionManager *)self->connectionManager setWRMUpdateCallback:VCCMWRMStatusUpdateCallback_0 requestNotificationCallback:VCCMWRMRequestNotificationCallback_0 withContext:self completionHandler:0];
    self->vcWRMClient = [[WRMClient alloc] initWithDelegate:self];
    BOOL v7 = [(VCSwitchManager *)self->_switchManager isSwitchEnabled:0x10000];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      __int16 v9 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v24 = v8;
        __int16 v25 = 2080;
        BOOL v26 = "-[VCCallSession setupWRMClient]";
        __int16 v27 = 1024;
        int v28 = 2818;
        __int16 v29 = 1024;
        BOOL v30 = v7;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Load switch iRATMetricsEnabled %d", buf, 0x22u);
      }
    }
    BOOL v10 = [(VCSwitchManager *)self->_switchManager isSwitchEnabled:128];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v24 = v11;
        __int16 v25 = 2080;
        BOOL v26 = "-[VCCallSession setupWRMClient]";
        __int16 v27 = 1024;
        int v28 = 2820;
        __int16 v29 = 1024;
        BOOL v30 = v10;
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Load switch iRATRtpEnabled %d", buf, 0x22u);
      }
    }
    BOOL v13 = [(VCSwitchManager *)self->_switchManager isSwitchEnabled:256];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      uint64_t v15 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v24 = v14;
        __int16 v25 = 2080;
        BOOL v26 = "-[VCCallSession setupWRMClient]";
        __int16 v27 = 1024;
        int v28 = 2822;
        __int16 v29 = 1024;
        BOOL v30 = v13;
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Load switch preWarmCellEnabled %d", buf, 0x22u);
      }
    }
    BOOL v16 = [(VCSwitchManager *)self->_switchManager isSwitchEnabled:0x10000000];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      uint64_t v18 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v24 = v17;
        __int16 v25 = 2080;
        BOOL v26 = "-[VCCallSession setupWRMClient]";
        __int16 v27 = 1024;
        int v28 = 2824;
        __int16 v29 = 1024;
        BOOL v30 = v16;
        _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Load switch wrmRSSIThresholdEnabled %d", buf, 0x22u);
      }
    }
    [self->vcWRMClient setRSSIThresholdEnabled:v16];
    uint64_t v19 = 0x10000;
    if (!v13) {
      uint64_t v19 = 0;
    }
    uint64_t v20 = 256;
    if (!v10) {
      uint64_t v20 = 0;
    }
    [self->vcWRMClient startWRMClientWithMode:1 metricsConfig:v20 | v7 | v19];
    [self->vcWRMClient setMediaControlInfoVersion:VCMediaControlInfoGeneratorGetVersion(self->videoMediaControlInfoGenerator)];
  }
}

- (void)cleanupWRMClient
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v9 = v3;
      __int16 v10 = 2080;
      uint64_t v11 = "-[VCCallSession cleanupWRMClient]";
      __int16 v12 = 1024;
      int v13 = 2833;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d WRM: vcWRMClient cleanup start.", buf, 0x1Cu);
    }
  }
  RTPSetWRMMetricsCallback((uint64_t)self->rtpHandle, 0, 0);
  vcWRMClient = self->vcWRMClient;
  self->vcWRMClient = 0;
  connectionManager = self->connectionManager;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__VCCallSession_cleanupWRMClient__block_invoke;
  v7[3] = &unk_1E6DB3DC8;
  v7[4] = vcWRMClient;
  [(VCConnectionManager *)connectionManager setWRMUpdateCallback:0 requestNotificationCallback:0 withContext:0 completionHandler:v7];
}

void __33__VCCallSession_cleanupWRMClient__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) stopWRMClient];
  uint64_t v2 = *(void **)(a1 + 32);
}

- (void)reportWRMMetrics:(id *)a3
{
}

- (void)reportImmediateWRMMetric:(int)a3 value:(unint64_t)a4
{
  if (self->_shouldReportWRMMetrics) {
    [self->vcWRMClient reportImmediateMetric:*(void *)&a3 value:a4];
  }
}

- (void)setWRMMetricConfig:(id *)a3
{
}

- (void)setWRMNotification:(id *)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (a3->var2 == 2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() > 6)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 136315650;
        uint64_t v24 = v4;
        __int16 v25 = 2080;
        BOOL v26 = "-[VCCallSession setWRMNotification:]";
        __int16 v27 = 1024;
        int v28 = 2859;
        uint64_t v6 = "VCCallSession [%s] %s:%d HandoverReport: Ignoring iRAT notification because the reason for recommendation i"
             "s WiFi link going down";
LABEL_5:
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v23, 0x1Cu);
      }
    }
  }
  else if ([(VCCallInfo *)self->remoteCallInfo isVideoQualityNearDegraded] || a3->var1)
  {
    self->_isWRMNotificationPending = 0;
    *(_OWORD *)&self->_savedWRMNotification.applicationType = 0u;
    *(_OWORD *)self->_savedWRMNotification.linkTypeChangeReasonString = 0u;
    *(_OWORD *)&self->_savedWRMNotification.linkTypeChangeReasonString[16] = 0u;
    *(_OWORD *)&self->_savedWRMNotification.linkTypeChangeReasonString[32] = 0u;
    *(_OWORD *)&self->_savedWRMNotification.linkTypeChangeReasonString[48] = 0u;
    *(_OWORD *)&self->_savedWRMNotification.linkTypeChangeReasonString[64] = 0u;
    *(_OWORD *)&self->_savedWRMNotification.linkTypeChangeReasonString[80] = 0u;
    *(_OWORD *)&self->_savedWRMNotification.linkTypeChangeReasonString[96] = 0u;
    *(_OWORD *)&self->_savedWRMNotification.linkTypeChangeReasonString[112] = 0u;
    *(_OWORD *)&self->_savedWRMNotification.linkBandwidthMin = 0u;
    VCConnectionManager_ProcessWRMNotification((uint64_t)self->connectionManager, a3);
  }
  else
  {
    self->_isWRMNotificationPending = 1;
    long long v15 = *(_OWORD *)&a3->var0;
    *(_OWORD *)self->_savedWRMNotification.linkTypeChangeReasonString = *(_OWORD *)a3->var3;
    *(_OWORD *)&self->_savedWRMNotification.applicationType = v15;
    long long v16 = *(_OWORD *)&a3->var3[16];
    long long v17 = *(_OWORD *)&a3->var3[32];
    long long v18 = *(_OWORD *)&a3->var3[48];
    *(_OWORD *)&self->_savedWRMNotification.linkTypeChangeReasonString[64] = *(_OWORD *)&a3->var3[64];
    *(_OWORD *)&self->_savedWRMNotification.linkTypeChangeReasonString[48] = v18;
    *(_OWORD *)&self->_savedWRMNotification.linkTypeChangeReasonString[32] = v17;
    *(_OWORD *)&self->_savedWRMNotification.linkTypeChangeReasonString[16] = v16;
    long long v19 = *(_OWORD *)&a3->var3[80];
    long long v20 = *(_OWORD *)&a3->var3[96];
    long long v21 = *(_OWORD *)&a3->var3[112];
    *(_OWORD *)&self->_savedWRMNotification.linkBandwidthMin = *(_OWORD *)&a3->var4;
    *(_OWORD *)&self->_savedWRMNotification.linkTypeChangeReasonString[112] = v21;
    *(_OWORD *)&self->_savedWRMNotification.linkTypeChangeReasonString[96] = v20;
    *(_OWORD *)&self->_savedWRMNotification.linkTypeChangeReasonString[80] = v19;
    if ((int)VRTraceGetErrorLogLevelForModule() > 6)
    {
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 136315650;
        uint64_t v24 = v22;
        __int16 v25 = 2080;
        BOOL v26 = "-[VCCallSession setWRMNotification:]";
        __int16 v27 = 1024;
        int v28 = 2867;
        uint64_t v6 = "VCCallSession [%s] %s:%d HandoverReport: Pending iRAT notification until video quality degrade";
        goto LABEL_5;
      }
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int var0 = a3->var0;
      int var1 = a3->var1;
      unint64_t var2 = a3->var2;
      unint64_t var4 = a3->var4;
      unint64_t var5 = a3->var5;
      int v23 = 136317186;
      uint64_t v24 = v8;
      __int16 v25 = 2080;
      BOOL v26 = "-[VCCallSession setWRMNotification:]";
      __int16 v27 = 1024;
      int v28 = 2875;
      __int16 v29 = 1024;
      int v30 = var0;
      __int16 v31 = 1024;
      int v32 = var1;
      __int16 v33 = 2048;
      unint64_t v34 = var2;
      __int16 v35 = 2080;
      var3 = a3->var3;
      __int16 v37 = 2048;
      unint64_t v38 = var5;
      __int16 v39 = 2048;
      unint64_t v40 = var4;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d WRM: Get iRAT notification for %u, %u, 0x%llx, %s, (%llu, %llu)", (uint8_t *)&v23, 0x50u);
    }
  }
}

- (void)setWRMCoexMetrics:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:");
  [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"WRMCoexIsLocal"];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    BOOL v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315906;
      uint64_t v11 = v6;
      __int16 v12 = 2080;
      int v13 = "-[VCCallSession setWRMCoexMetrics:]";
      __int16 v14 = 1024;
      int v15 = 2881;
      __int16 v16 = 2080;
      uint64_t v17 = objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d WRM: Get iRAT Coex Metrics %s", (uint8_t *)&v10, 0x26u);
    }
  }
  [(VCConnectionManager *)self->connectionManager processWRMCoexMetrics:v5];
  uint64_t v8 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a3];
  [v8 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"WRMCoexIsLocal"];
  id v9 = [(VCSessionMessaging *)self->messaging newPackedMessageFromDictionary:v8];
  [(VCSessionMessaging *)self->messaging sendMessage:v9 withTopic:@"VCWRMCoexMetricsMessage"];
}

- (void)setPreWarmState:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(VCConnectionManager *)self->connectionManager isPreWarmStateEnabled] != a3)
  {
    if (v3) {
      uint64_t v5 = @"VCWRMAlertStateEnabled";
    }
    else {
      uint64_t v5 = @"VCWRMAlertStateDisabled";
    }
    [(VCSessionMessaging *)self->messaging sendMessage:v5 withTopic:@"VCWRMAlertStateUpdateMessageTopic"];
  }
  connectionManager = self->connectionManager;

  VCConnectionManager_SetPreWarmState((uint64_t)connectionManager, v3);
}

- (void)sendWRMStatusUpdate:(id *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int var2 = a3->var2;
      unsigned int var3 = a3->var3;
      int v9 = 136316162;
      uint64_t v10 = v5;
      __int16 v11 = 2080;
      __int16 v12 = "-[VCCallSession sendWRMStatusUpdate:]";
      __int16 v13 = 1024;
      int v14 = 2901;
      __int16 v15 = 1024;
      int v16 = var2;
      __int16 v17 = 1024;
      unsigned int v18 = var3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d WRM: Send iRAT status update for %u, %u", (uint8_t *)&v9, 0x28u);
    }
  }
  [self->vcWRMClient sendStatusUpdateFaceTimeCalling:a3];
}

- (void)requestWRMNotification
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
      uint64_t v8 = "-[VCCallSession requestWRMNotification]";
      __int16 v9 = 1024;
      int v10 = 2906;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d WRM: Request for the latest iRAT notification by resubscribing again", (uint8_t *)&v5, 0x1Cu);
    }
  }
  [self->vcWRMClient requestNotificationFaceTimeCalling];
}

- (BOOL)disconnect:(id)a3 didRemoteCancel:(BOOL)a4
{
  return [(VCCallSession *)self disconnectInternal:0 disconnectError:a3 didRemoteCancel:a4];
}

- (BOOL)cancel:(id)a3
{
  return [(VCCallSession *)self disconnectInternal:1 disconnectError:a3 didRemoteCancel:0];
}

- (id)newMediaNegotiatorAudioConfigurationWithAllowAudioSwitching:(BOOL)a3 useSBR:(BOOL)a4 aacBlockSize:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  UInt32 v14 = 0;
  AUIOGetAUNumber(&v14);
  __int16 v9 = [[VCAudioRuleCollection alloc] initWithPhoneContinuity:self->_deviceRole != 0 allowAudioSwitching:v7 sbr:v6 aacBlockSize:v5];
  if (!v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCallSession newMediaNegotiatorAudioConfigurationWithAllowAudioSwitching:useSBR:aacBlockSize:]();
      }
    }
    goto LABEL_11;
  }
  int v10 = [VCMediaNegotiatorAudioConfiguration alloc];
  uint64_t v11 = [(VCMediaNegotiatorAudioConfiguration *)v10 initWithAllowAudioSwitching:v7 allowAudioRecording:self->allowAudioRecording useSBR:v6 ssrc:RTPGenerateSSRC() audioUnitNumber:v14 audioRuleCollection:v9];
  if (!v11)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCallSession newMediaNegotiatorAudioConfigurationWithAllowAudioSwitching:useSBR:aacBlockSize:]();
      }
    }
LABEL_11:

    return 0;
  }
  __int16 v12 = (void *)v11;

  return v12;
}

- (id)newCameraConfiguration
{
  uint64_t v2 = objc_alloc_init(VCMediaNegotiatorVideoConfiguration);
  if (!v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCallSession newCameraConfiguration]();
      }
    }
    goto LABEL_11;
  }
  [(VCMediaNegotiatorCommonConfiguration *)v2 setSsrc:RTPGenerateSSRC()];
  [(VCMediaNegotiatorVideoConfiguration *)v2 setVideoRuleCollections:+[VCVideoRuleCollectionsCamera sharedInstance]];
  id v3 = +[VCVideoFeatureListStringHelper newLocalFeaturesStringWithType:1];
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCallSession newCameraConfiguration]();
      }
    }
LABEL_11:

    return 0;
  }
  uint64_t v4 = v3;
  [(VCMediaNegotiatorVideoConfiguration *)v2 setVideoFeatureStrings:v3];

  return v2;
}

- (id)newScreenConfigurationWithCameraConfiguration:(id)a3
{
  id v3 = (void *)[a3 copy];
  if (v3)
  {
    [v3 setSsrc:RTPGenerateSSRC()];
    objc_msgSend(v3, "setVideoRuleCollections:", +[VCVideoRuleCollectionsScreen sharedInstance](VCVideoRuleCollectionsScreen, "sharedInstance"));
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCCallSession newScreenConfigurationWithCameraConfiguration:]();
    }
  }
  return v3;
}

- (BOOL)addMediaConfigurationsToLocalConfiguration:(id)a3
{
  id v5 = [(VCCallSession *)self newMediaNegotiatorAudioConfigurationWithAllowAudioSwitching:self->allowAudioSwitching useSBR:self->useSBR aacBlockSize:self->aacBlockSize];
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCallSession addMediaConfigurationsToLocalConfiguration:]();
      }
    }
    goto LABEL_12;
  }
  id v6 = [(VCCallSession *)self newCameraConfiguration];
  if (!v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCallSession addMediaConfigurationsToLocalConfiguration:]();
      }
    }
LABEL_12:
    __int16 v9 = 0;
    BOOL v7 = 0;
LABEL_17:
    BOOL v10 = 0;
    goto LABEL_5;
  }
  BOOL v7 = v6;
  id v8 = [(VCCallSession *)self newScreenConfigurationWithCameraConfiguration:v6];
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCallSession addMediaConfigurationsToLocalConfiguration:]();
      }
    }
    __int16 v9 = 0;
    goto LABEL_17;
  }
  __int16 v9 = v8;
  BOOL v10 = 1;
  [a3 setMediaConfiguration:v5 forMediaType:1];
  [a3 setMediaConfiguration:v7 forMediaType:2];
  [a3 setMediaConfiguration:v9 forMediaType:3];
LABEL_5:

  return v10;
}

- (id)newMediaBlobWithRemoteMediaBlob:(id)a3 localCallID:(unsigned int)a4 isLowBitrateCodecPreferred:(BOOL)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  int deviceRole = self->_deviceRole;
  if ((deviceRole == 4 || deviceRole == 2) && a5)
  {
    self->preferredAudioCodec = 98;
    self->allowAudioSwitching = 0;
  }
  BOOL v10 = [[VCMediaNegotiatorLocalConfiguration alloc] initWithBitrateArbiter:self->callSessionBitrateArbiter];
  if (!v10)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCallSession newMediaBlobWithRemoteMediaBlob:localCallID:isLowBitrateCodecPreferred:]();
      }
    }
    goto LABEL_39;
  }
  [(VCMediaNegotiatorLocalConfiguration *)v10 setFaceTimeSwitches:[(VCSwitchManager *)self->_switchManager localSwitches]];
  [(VCMediaNegotiatorLocalConfiguration *)v10 setPreferredAudioCodec:self->preferredAudioCodec];
  [(VCMediaNegotiatorLocalConfiguration *)v10 setAllowRTCPFB:self->isRTCPFBEnabled];
  [(VCMediaNegotiatorLocalConfiguration *)v10 setIsCaller:a3 == 0];
  [(VCMediaNegotiatorLocalConfiguration *)v10 setCallLogFile:self->_callLogFile];
  [(VCMediaNegotiatorLocalConfiguration *)v10 setSecureMessagingRequired:[(VCSwitchManager *)self->_switchManager isLocalSwitchEnabled:0x80000]];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    __int16 v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 136315906;
      uint64_t v26 = v11;
      __int16 v27 = 2080;
      int v28 = "-[VCCallSession newMediaBlobWithRemoteMediaBlob:localCallID:isLowBitrateCodecPreferred:]";
      __int16 v29 = 1024;
      int v30 = 3038;
      __int16 v31 = 1024;
      BOOL v32 = [(VCMediaNegotiatorLocalConfiguration *)v10 secureMessagingRequired];
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Load switch before negotiation secureMessagingRequired %d", (uint8_t *)&v25, 0x22u);
    }
  }
  [(VCMediaNegotiatorLocalConfiguration *)v10 setSIPDisabled:[(VCSwitchManager *)self->_switchManager isLocalSwitchEnabled:0x100000]];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    UInt32 v14 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v15 = [(VCMediaNegotiatorLocalConfiguration *)v10 SIPDisabled];
      int v25 = 136315906;
      uint64_t v26 = v13;
      __int16 v27 = 2080;
      int v28 = "-[VCCallSession newMediaBlobWithRemoteMediaBlob:localCallID:isLowBitrateCodecPreferred:]";
      __int16 v29 = 1024;
      int v30 = 3040;
      __int16 v31 = 1024;
      BOOL v32 = v15;
      _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Load switch before negotiation disableSIPEnabled %d", (uint8_t *)&v25, 0x22u);
    }
  }
  if ([(VCCallSession *)self deviceRole] == 2 || [(VCCallSession *)self deviceRole] == 4)
  {
    [(VCMediaNegotiatorLocalConfiguration *)v10 setBasebandCodec:self->basebandCodecType];
    [(VCMediaNegotiatorLocalConfiguration *)v10 setBasebandCodecSampleRate:[(NSNumber *)self->basebandCodecSampleRate unsignedIntValue]];
  }
  [(VCMediaNegotiatorLocalConfiguration *)v10 setMediaRecorderVideoCodecs:[+[VCVideoRuleCollectionsMediaRecorder sharedInstance] mediaRecorderVideoCodecs]];
  [(VCMediaNegotiatorLocalConfiguration *)v10 setMediaRecorderImageTypes:[+[VCVideoRuleCollectionsMediaRecorder sharedInstance] mediaRecorderImageTypes]];
  if ([(VCSwitchManager *)self->_switchManager isLocalSwitchEnabled:0x40000]) {
    uint64_t v16 = 2;
  }
  else {
    uint64_t v16 = 1;
  }
  [(VCMediaNegotiatorLocalConfiguration *)v10 setMediaControlInfoVersion:v16];
  [(VCMediaNegotiatorLocalConfiguration *)v10 setMediaControlInfoFECFeedbackVersion:[(VCCallSession *)self defaultMediaControlInfoFECFeedbackVersion]];
  [(VCMediaNegotiatorLocalConfiguration *)v10 setLinkProbingCapabilityVersion:[(VCConnectionManager *)self->connectionManager linkProbingCapabilityVersion]];
  [(VCCallSession *)self addMediaConfigurationsToLocalConfiguration:v10];
  __int16 v17 = [[VCMediaNegotiator alloc] initWithLocalSettings:v10];
  if (!v17)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCallSession newMediaBlobWithRemoteMediaBlob:localCallID:isLowBitrateCodecPreferred:]();
      }
    }
LABEL_39:
    unsigned int v18 = 0;
LABEL_40:
    id v19 = 0;
    goto LABEL_32;
  }
  unsigned int v18 = v17;
  if ([(VCMediaNegotiatorLocalConfiguration *)v10 isCaller])
  {
    id v19 = [(VCMediaNegotiator *)v18 negotiationData];
    if (!v19)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_40;
      }
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      long long v21 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_40;
      }
      int v25 = 136315650;
      uint64_t v26 = v20;
      __int16 v27 = 2080;
      int v28 = "-[VCCallSession newMediaBlobWithRemoteMediaBlob:localCallID:isLowBitrateCodecPreferred:]";
      __int16 v29 = 1024;
      int v30 = 3059;
      uint64_t v22 = "VCCallSession [%s] %s:%d Failed to create the invite media blob";
      goto LABEL_44;
    }
  }
  else
  {
    if (!a3)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_40;
      }
      uint64_t v24 = VRTraceErrorLogLevelToCSTR();
      long long v21 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_40;
      }
      int v25 = 136315650;
      uint64_t v26 = v24;
      __int16 v27 = 2080;
      int v28 = "-[VCCallSession newMediaBlobWithRemoteMediaBlob:localCallID:isLowBitrateCodecPreferred:]";
      __int16 v29 = 1024;
      int v30 = 3062;
      uint64_t v22 = "VCCallSession [%s] %s:%d Remote caller doesn't use media pre-negotiation";
LABEL_44:
      _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v25, 0x1Cu);
      goto LABEL_40;
    }
    if (![(VCMediaNegotiator *)v18 processRemoteNegotiationData:a3])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCallSession newMediaBlobWithRemoteMediaBlob:localCallID:isLowBitrateCodecPreferred:].cold.4();
        }
      }
      goto LABEL_40;
    }
    id v19 = [(VCMediaNegotiator *)v18 newResponseBlob];
    if (!v19)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCallSession newMediaBlobWithRemoteMediaBlob:localCallID:isLowBitrateCodecPreferred:]();
        }
      }
      goto LABEL_40;
    }
  }
  self->_mediaNegotiator = v18;
  unsigned int v18 = 0;
LABEL_32:

  return v19;
}

- (void)reportOperatingMode
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int operatingMode = self->operatingMode;
  if (!operatingMode && (int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = v3;
      __int16 v6 = 2080;
      BOOL v7 = "-[VCCallSession reportOperatingMode]";
      __int16 v8 = 1024;
      int v9 = 3087;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Operating mode is INVALID", buf, 0x1Cu);
    }
  }
  *(void *)buf = 0;
  snprintf(buf, 8uLL, "%u", operatingMode);
  reportingLog();
}

- (BOOL)isLowBitrateCodecPreferred:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v3 = (VCCallInfoBlob *)[a3 objectForKeyedSubscript:@"InviteDataCallInfoBlob"];
  if (v3) {
    uint64_t v3 = [[VCCallInfoBlob alloc] initWithData:v3];
  }
  BOOL v4 = [(NSString *)[(VCCallInfoBlob *)v3 deviceType] hasPrefix:@"Watch"];

  return v4;
}

- (id)inviteDataForParticipantID:(id)a3 callID:(unsigned int *)a4 remoteInviteData:(id)a5 nonCellularCandidateTimeout:(double)a6 error:(id *)a7
{
  v33[1] = *MEMORY[0x1E4F143B8];
  uint64_t v21 = 0;
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
  uint64_t v14 = [a5 objectForKeyedSubscript:@"InviteDataSKEBlob"];
  [(VCCallSession *)self lock];
  self->_inviteDataRequested = 1;
  [(VCCallSession *)self initWithRelevantStorebagEntries];
  [(VCCallSession *)self reportOperatingMode];
  BOOL v32 = @"transportSessionLegacyOptionNonCellularCandidateTimeout";
  v33[0] = [NSNumber numberWithDouble:a6];
  if (!-[VCTransportSession getConnectionSetupData:withOptions:error:](self->_transportSession, "getConnectionSetupData:withOptions:error:", &v21, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1], a7)|| *a7)
  {
LABEL_3:

    [(VCCallSession *)self unlock];
    return 0;
  }
  if (v21) {
    [v13 setObject:v21 forKeyedSubscript:@"InviteDataConnectionBlob"];
  }
  [(VCCallInfo *)self->localCallInfo setParticipantID:a3];
  self->state = 3;
  if (self->isGKVoiceChat || a5 && !v14) {
    id v16 = 0;
  }
  else {
    id v16 = [(VCCallSession *)self newSKEBlobWithRemoteSKEBlob:v14];
  }
  uint64_t v17 = [a5 objectForKeyedSubscript:@"InviteDataMediaBlob"];
  if (!a5 || v17)
  {
    id v20 = [(VCCallSession *)self newMediaBlobWithRemoteMediaBlob:v17 localCallID:*a4 isLowBitrateCodecPreferred:[(VCCallSession *)self isLowBitrateCodecPreferred:a5]];
    if (!v20)
    {
      reportingSymptom();
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if (VRTraceIsOSFaultDisabled())
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCCallSession inviteDataForParticipantID:callID:remoteInviteData:nonCellularCandidateTimeout:error:]();
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
        {
          -[VCCallSession inviteDataForParticipantID:callID:remoteInviteData:nonCellularCandidateTimeout:error:]();
        }
      }
      +[GKVoiceChatError getNSError:a7 code:32031 detailedCode:200 filePath:0 description:@"Failed to generate the media blob" reason:@"Media blob error"];

      goto LABEL_3;
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      id v19 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v23 = v18;
        __int16 v24 = 2080;
        int v25 = "-[VCCallSession inviteDataForParticipantID:callID:remoteInviteData:nonCellularCandidateTimeout:error:]";
        __int16 v26 = 1024;
        int v27 = 3169;
        __int16 v28 = 2112;
        id v29 = a5;
        __int16 v30 = 2112;
        uint64_t v31 = 0;
        _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d falls back to SDP. remoteInviteData = %@, remoteMediaBlob = %@", buf, 0x30u);
      }
    }
    id v20 = 0;
  }
  [(VCCallSession *)self addLocalCallInfoToInviteDictionary:v13];
  [(VCCallSession *)self unlock];
  if (!v16)
  {
    [(VCCallInfo *)self->localCallInfo setSupportsSKEOptimization:0];
    if (!v20) {
      return v13;
    }
    goto LABEL_19;
  }
  [v13 setObject:v16 forKeyedSubscript:@"InviteDataSKEBlob"];

  if (v20)
  {
LABEL_19:
    [v13 setObject:v20 forKeyedSubscript:@"InviteDataMediaBlob"];
  }
  return v13;
}

- (void)addLocalCallInfoToInviteDictionary:(id)a3
{
  v21[3] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(VCCallInfoBlob);
  [(VCCallInfoBlob *)v5 setCallID:[(VCCallInfo *)self->localCallInfo callID]];
  [(VCCallInfoBlob *)v5 setClientVersion:+[VCCallInfo getVCCurrentVersion]];
  memset(v21, 170, 20);
  VCGetDeviceModelString((char *)v21, 0x14uLL);
  __int16 v6 = (void *)[[NSString alloc] initWithCString:v21 encoding:1];
  [(VCCallInfoBlob *)v5 setDeviceType:v6];
  [(VCCallInfo *)self->localCallInfo setDeviceType:v6];
  memset(v20, 170, 20);
  VCGetSystemBuildVersionString((char *)v20, 20);
  BOOL v7 = (void *)[[NSString alloc] initWithCString:v20 encoding:1];
  [(VCCallInfoBlob *)v5 setOsVersion:v7];
  [(VCCallInfo *)self->localCallInfo setOSVersion:v7];
  __int16 v8 = (void *)[[NSString alloc] initWithCString:"2090.17.2" encoding:1];
  [(VCCallInfoBlob *)v5 setFrameworkVersion:v8];
  [(VCCallInfo *)self->localCallInfo setFrameworkVersion:v8];
  objc_msgSend(a3, "setObject:forKeyedSubscript:", -[VCCallInfoBlob data](v5, "data"), @"InviteDataCallInfoBlob");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_msgSend((id)-[VCCallInfoBlob formattedText](v5, "formattedText"), "stringByReplacingOccurrencesOfString:withString:", @"\n", @", "))
      {
        uint64_t v11 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[VCCallInfoBlob formattedText](v5, "formattedText"), "stringByReplacingOccurrencesOfString:withString:", @"\n", @", "), "description"), "UTF8String");
      }
      else
      {
        uint64_t v11 = "<nil>";
      }
      int v12 = 136315906;
      uint64_t v13 = v9;
      __int16 v14 = 2080;
      BOOL v15 = "-[VCCallSession addLocalCallInfoToInviteDictionary:]";
      __int16 v16 = 1024;
      int v17 = 3216;
      __int16 v18 = 2080;
      id v19 = v11;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Local callInfoBlob = %s", (uint8_t *)&v12, 0x26u);
    }
  }
}

- (void)setRemoteCallInfoFromInviteDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)[a3 objectForKeyedSubscript:@"InviteDataConnectionBlob"];
  __int16 v6 = (VCCallInfoBlob *)[a3 objectForKeyedSubscript:@"InviteDataCallInfoBlob"];
  if (v6) {
    __int16 v6 = [[VCCallInfoBlob alloc] initWithData:v6];
  }
  v14[4] = 0;
  *(_DWORD *)__int16 v14 = +[VCCallInfo getVCCurrentVersion];
  if (v5)
  {
    [v5 bytes];
    [v5 length];
    ICEGetCallInfoForConnectionData();
    uint64_t v7 = *(unsigned int *)&v14[1];
    goto LABEL_11;
  }
  if (v6)
  {
    uint64_t v7 = [(VCCallInfoBlob *)v6 callID];
    v14[0] = [(VCCallInfoBlob *)v6 clientVersion];
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    uint64_t v7 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v16 = v8;
    __int16 v17 = 2080;
    __int16 v18 = "-[VCCallSession setRemoteCallInfoFromInviteDictionary:]";
    __int16 v19 = 1024;
    int v20 = 3242;
    _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Both connectionBlob and callInfoBlob are nil. No callID and client version", buf, 0x1Cu);
  }
  uint64_t v7 = 0;
LABEL_11:
  [(VCCallInfo *)self->remoteCallInfo setCallID:v7];
  [(VCCallInfo *)self->remoteCallInfo setU8Version:v14[0]];
  if ([a3 objectForKeyedSubscript:@"InviteDataSKEBlob"]) {
    [(VCCallInfo *)self->remoteCallInfo setSupportsSKEOptimization:1];
  }
  if (v6)
  {
    [(VCCallInfo *)self->remoteCallInfo setDeviceType:[(VCCallInfoBlob *)v6 deviceType]];
    [(VCCallInfo *)self->remoteCallInfo setFrameworkVersion:[(VCCallInfoBlob *)v6 frameworkVersion]];
    [(VCCallInfo *)self->remoteCallInfo setOSVersion:[(VCCallInfoBlob *)v6 osVersion]];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (objc_msgSend((id)-[VCCallInfoBlob formattedText](v6, "formattedText"), "stringByReplacingOccurrencesOfString:withString:", @"\n", @", "))
        {
          int v12 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[VCCallInfoBlob formattedText](v6, "formattedText"), "stringByReplacingOccurrencesOfString:withString:", @"\n", @", "), "description"), "UTF8String");
        }
        else
        {
          int v12 = "<nil>";
        }
        unsigned int v13 = [(VCCallInfo *)self->localCallInfo callID];
        *(_DWORD *)buf = 136316162;
        uint64_t v16 = v10;
        __int16 v17 = 2080;
        __int16 v18 = "-[VCCallSession setRemoteCallInfoFromInviteDictionary:]";
        __int16 v19 = 1024;
        int v20 = 3257;
        __int16 v21 = 2080;
        uint64_t v22 = v12;
        __int16 v23 = 1024;
        unsigned int v24 = v13;
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Remote callInfoBlob = %s localCalluint64_t ID = %d", buf, 0x2Cu);
      }
    }
  }
}

- (void)setShouldSendAudio:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL shouldSendAudio = self->shouldSendAudio;
  if (!self->shouldSendAudio && a3)
  {
    [(VCAudioTransmitter *)self->audioTransmitter setInputMeter:0];
    [(VCPacketBundler *)[(VCAudioTransmitter *)self->audioTransmitter audioBundler] resetBuffer];
    [(VCPacketBundler *)[(VCAudioTransmitter *)self->audioTransmitter audioBundlerShortRED] resetBuffer];
    VCAudioReceiver_DiscardQueueExcess((uint64_t)self->audioReceiver);
    BOOL shouldSendAudio = self->shouldSendAudio;
  }
  if (shouldSendAudio != v3)
  {
    [(VCCallSessionDelegate *)self->delegate session:self isSendingAudio:v3 error:0];
    if (v3) {
      [(VCCallSession *)self stopPausedHeartbeat];
    }
    else {
      [(VCCallSession *)self startPausedHeartbeat];
    }
  }
  self->BOOL shouldSendAudio = v3;
}

- (void)setPacketsPerBundle:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  BOOL v4 = [(VCAudioTransmitter *)self->audioTransmitter audioBundler];

  [(VCPacketBundler *)v4 setPacketsPerBundle:v3];
}

- (int)packetsPerBundle
{
  uint64_t v2 = [(VCAudioTransmitter *)self->audioTransmitter audioBundler];

  return [(VCPacketBundler *)v2 packetsPerBundle];
}

- (int)numBufferBytesAvailable
{
  uint64_t v2 = [(VCAudioTransmitter *)self->audioTransmitter audioBundler];

  return [(VCPacketBundler *)v2 maxPacketSize];
}

- (int)bundledPackets
{
  uint64_t v2 = [(VCAudioTransmitter *)self->audioTransmitter audioBundler];

  return [(VCPacketBundler *)v2 bundledPackets];
}

- (void)setInputMeter:(unsigned __int8)a3
{
}

- (unsigned)inputMeter
{
  return [(VCAudioTransmitter *)self->audioTransmitter inputMeter];
}

- (unsigned)lastSentAudioSampleTime
{
  return [(VCAudioTransmitter *)self->audioTransmitter lastSentAudioSampleTime];
}

- (void)setIsGKVoiceChat:(BOOL)a3
{
  self->isGKVoiceChat = a3;
  if (a3) {
    self->allowAudioSwitching = 0;
  }
}

- (BOOL)isGKVoiceChat
{
  return self->isGKVoiceChat;
}

- (void)processRemoteIPChange:(id)a3 callID:(unsigned int)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    transportSession = self->_transportSession;
    [(VCTransportSession *)transportSession processRemoteIPChange:a3];
  }
}

- (BOOL)isCallOngoing
{
  return (self->state > 8uLL) | (0x7Eu >> self->state) & 1;
}

- (void)setSuspendAudio
{
  v3[5] = *MEMORY[0x1E4F143B8];
  audioQueue = self->audioQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __32__VCCallSession_setSuspendAudio__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(audioQueue, v3);
}

uint64_t __32__VCCallSession_setSuspendAudio__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) lock];
  [*(id *)(*(void *)(a1 + 32) + 1512) setCallActive:0];
  [*(id *)(*(void *)(a1 + 32) + 80) setConnectionPause:1 isLocalConnection:1];
  AFRCSetAudioPaused(*(void *)(*(void *)(a1 + 32) + 344), 1, 1);
  VCAudioReceiver_Reset(*(void *)(*(void *)(a1 + 32) + 1224));
  [*(id *)(a1 + 32) startPausedHeartbeat];
  [*(id *)(a1 + 32) unlock];
  [*(id *)(*(void *)(a1 + 32) + 1120) sendMessage:@"VCAudioPaused" withTopic:@"AudioPauseStateMessageTopic"];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);

  return objc_msgSend(v2, "didChangeLocalVariablesForSession:");
}

- (void)setResumeAudio
{
  v3[5] = *MEMORY[0x1E4F143B8];
  audioQueue = self->audioQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __31__VCCallSession_setResumeAudio__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(audioQueue, v3);
}

uint64_t __31__VCCallSession_setResumeAudio__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) lock];
  [*(id *)(a1 + 32) stopPausedHeartbeat];
  AFRCSetAudioPaused(*(void *)(*(void *)(a1 + 32) + 344), 0, 1);
  [*(id *)(*(void *)(a1 + 32) + 80) setConnectionPause:1 isLocalConnection:1];
  [*(id *)(a1 + 32) unlock];
  [*(id *)(*(void *)(a1 + 32) + 1512) setCallActive:1];
  [*(id *)(*(void *)(a1 + 32) + 1120) sendMessage:@"VCAudioUnpaused" withTopic:@"AudioPauseStateMessageTopic"];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);

  return objc_msgSend(v2, "didChangeLocalVariablesForSession:");
}

- (BOOL)setPauseAudio:(BOOL)a3 force:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a3;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL audioIsPaused = self->audioIsPaused;
      int64_t state = self->state;
      *(_DWORD *)buf = 136316418;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&unsigned char buf[12] = 2080;
      *(void *)&buf[14] = "-[VCCallSession setPauseAudio:force:error:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 3386;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = audioIsPaused;
      *(_WORD *)&buf[34] = 1024;
      *(_DWORD *)&buf[36] = v6;
      *(_WORD *)&buf[40] = 1024;
      *(_DWORD *)&buf[42] = state;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d setPauseAudio (was %d is %d state is %d)", buf, 0x2Eu);
    }
  }
  [(VCCallSession *)self lock];
  if (self->state != 1)
  {
    self->BOOL audioIsPaused = v6;
    [(VCTransportSession *)self->_transportSession setCallActive:v6 ^ 1];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      __int16 v17 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int64_t v18 = self->state;
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = v16;
        *(_WORD *)&unsigned char buf[12] = 2080;
        *(void *)&buf[14] = "-[VCCallSession setPauseAudio:force:error:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 3392;
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = v18;
        _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d setPauseAudio early return due to state == %d", buf, 0x22u);
      }
    }
    goto LABEL_14;
  }
  if (!a4 && (self->audioIsPaused == v6 || ![(VCCallSession *)self isCallOngoing]))
  {
LABEL_14:
    [(VCCallSession *)self unlock];

    [(VCCallSessionDelegate *)self->delegate session:self didPauseAudio:self->audioIsPaused error:0];
    return 1;
  }
  int deviceRole = self->_deviceRole;
  self->BOOL audioIsPaused = v6;
  [(VCTransportSession *)self->_transportSession setCallActive:v6 ^ 1];
  [(VCConnectionManager *)self->connectionManager setConnectionPause:v6 isLocalConnection:1];
  AFRCSetAudioPaused((uint64_t)self->hAFRC, v6, 1);
  if (v6)
  {
    [(VCCallSession *)self startPausedHeartbeat];
    if (self->isAudioRunning)
    {
      self->isAudioRunning = 0;
      [(VCCallSession *)self unlock];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __43__VCCallSession_setPauseAudio_force_error___block_invoke_340;
      v26[3] = &unk_1E6DB7400;
      void v26[4] = self;
      BOOL v27 = v6;
      id v14 = (id)[v26 copy];
      delegateNotificationQueue = self->delegateNotificationQueue;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __43__VCCallSession_setPauseAudio_force_error___block_invoke_2;
      void v25[3] = &unk_1E6DB5178;
      v25[4] = self;
      v25[5] = v14;
      dispatch_async(delegateNotificationQueue, v25);
    }
    else
    {
      [(VCCallSession *)self unlock];
    }
    __int16 v21 = @"VCAudioPaused";
  }
  else
  {
    [(VCCallSession *)self stopPausedHeartbeat];
    VCAudioReceiver_Reset((uint64_t)self->audioReceiver);
    int v37 = -1431655766;
    *(void *)&long long v19 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v35 = v19;
    long long v36 = v19;
    long long v33 = v19;
    long long v34 = v19;
    *(_OWORD *)&buf[32] = v19;
    long long v32 = v19;
    *(_OWORD *)buf = v19;
    *(_OWORD *)&buf[16] = v19;
    remoteCallInfo = self->remoteCallInfo;
    if (remoteCallInfo)
    {
      [(VCCallInfo *)remoteCallInfo audioVersionInfo:self->isGKVoiceChat];
    }
    else
    {
      int v37 = 0;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v32 = 0u;
      memset(buf, 0, sizeof(buf));
    }
    if (deviceRole == 1)
    {
      uint64_t v22 = [(VCCallSession *)self basebandCodecType];
      __int16 v23 = [(VCCallSession *)self basebandCodecSampleRate];
    }
    else
    {
      __int16 v23 = 0;
      uint64_t v22 = 0;
    }
    [(VCCallSession *)self unlock];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __43__VCCallSession_setPauseAudio_force_error___block_invoke;
    v28[3] = &unk_1E6DB73D8;
    int v29 = deviceRole;
    v28[4] = self;
    v28[5] = v23;
    v28[6] = v22;
    BOOL v30 = v6;
    -[VCCallSessionDelegate session:startAudioWithFarEndVersionInfo:internalFrameFormat:completionHandler:](-[VCCallSession delegate](self, "delegate"), "session:startAudioWithFarEndVersionInfo:internalFrameFormat:completionHandler:", self, buf, &self->_vpioFormat, (id)[v28 copy]);
    __int16 v21 = @"VCAudioUnpaused";
  }
  [(VCSessionMessaging *)self->messaging sendMessage:v21 withTopic:@"AudioPauseStateMessageTopic"];
  [(VCCallSessionDelegate *)self->delegate didChangeLocalVariablesForSession:self];

  return 1;
}

uint64_t __43__VCCallSession_setPauseAudio_force_error___block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  if (a2)
  {
    [v5 lock];
    *(unsigned char *)(*(void *)(a1 + 32) + 224) = 1;
    if (*(_DWORD *)(a1 + 56) == 1
      && (!objc_msgSend(*(id *)(a1 + 40), "isEqualToNumber:", objc_msgSend(*(id *)(a1 + 32), "basebandCodecSampleRate"))|| (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", objc_msgSend(*(id *)(a1 + 32), "basebandCodecType")) & 1) == 0))
    {
      if ([*(id *)(a1 + 32) basebandCodecType])
      {
        if ([*(id *)(a1 + 32) basebandCodecSampleRate])
        {
          BOOL v6 = (void *)[*(id *)(a1 + 32) delegate];
          uint64_t v7 = *(void **)(a1 + 32);
          uint64_t v8 = CStrToFourcc((char *)objc_msgSend((id)objc_msgSend(v7, "basebandCodecType"), "UTF8String"));
          objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "basebandCodecSampleRate"), "doubleValue");
          objc_msgSend(v6, "session:setRemoteBasebandCodecType:sampleRate:", v7, v8);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              __43__VCCallSession_setPauseAudio_force_error___block_invoke_cold_1();
            }
          }
        }
      }
    }
    [*(id *)(a1 + 32) unlock];
  }
  else
  {
    [v5 disconnect:a3 didRemoteCancel:0];
  }
  return [*(id *)(*(void *)(a1 + 32) + 8) session:*(void *)(a1 + 32) didPauseAudio:*(unsigned __int8 *)(a1 + 60) error:a3];
}

uint64_t __43__VCCallSession_setPauseAudio_force_error___block_invoke_340(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "session:didPauseAudio:error:");
}

uint64_t __43__VCCallSession_setPauseAudio_force_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v2 session:v3 stopAudioWithCompletionHandler:v4];
}

- (BOOL)setPauseAudio:(BOOL)a3 error:(id *)a4
{
  return [(VCCallSession *)self setPauseAudio:a3 force:0 error:a4];
}

- (void)setSuspendVideo
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v5 = [(VCCapabilities *)self->caps isVideoEnabled];
      *(_DWORD *)buf = 136315906;
      uint64_t v9 = v3;
      __int16 v10 = 2080;
      uint64_t v11 = "-[VCCallSession setSuspendVideo]";
      __int16 v12 = 1024;
      int v13 = 3486;
      __int16 v14 = 1024;
      BOOL v15 = v5;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d isVideoEnabled=%d", buf, 0x22u);
    }
  }
  if ([(VCCapabilities *)self->caps isVideoEnabled])
  {
    videoAsyncQueue = self->videoAsyncQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__VCCallSession_setSuspendVideo__block_invoke;
    block[3] = &unk_1E6DB3DC8;
    block[4] = self;
    dispatch_async(videoAsyncQueue, block);
  }
}

uint64_t __32__VCCallSession_setSuspendVideo__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) lock];
  [*(id *)(*(void *)(a1 + 32) + 1120) sendMessage:@"VCVideoPaused" withTopic:@"VideoPauseStateMessageTopic"];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "didChangeLocalVariablesForSession:");
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 unlock];
}

- (void)setResumeVideo
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v5 = [(VCCapabilities *)self->caps isVideoEnabled];
      *(_DWORD *)buf = 136315906;
      uint64_t v9 = v3;
      __int16 v10 = 2080;
      uint64_t v11 = "-[VCCallSession setResumeVideo]";
      __int16 v12 = 1024;
      int v13 = 3499;
      __int16 v14 = 1024;
      BOOL v15 = v5;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d isVideoEnabled=%d", buf, 0x22u);
    }
  }
  if ([(VCCapabilities *)self->caps isVideoEnabled])
  {
    videoAsyncQueue = self->videoAsyncQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __31__VCCallSession_setResumeVideo__block_invoke;
    block[3] = &unk_1E6DB3DC8;
    block[4] = self;
    dispatch_async(videoAsyncQueue, block);
  }
}

uint64_t __31__VCCallSession_setResumeVideo__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) lock];
  [*(id *)(*(void *)(a1 + 32) + 1120) sendMessage:@"VCVideoUnpaused" withTopic:@"VideoPauseStateMessageTopic"];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "didChangeLocalVariablesForSession:");
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 unlock];
}

- (BOOL)setPauseVideo:(BOOL)a3 force:(BOOL)a4 error:(id *)a5
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  videoAsyncQueue = self->videoAsyncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__VCCallSession_setPauseVideo_force_error___block_invoke;
  block[3] = &unk_1E6DB4658;
  block[4] = self;
  BOOL v8 = a4;
  BOOL v9 = a3;
  dispatch_async(videoAsyncQueue, block);
  return 1;
}

void __43__VCCallSession_setPauseVideo_force_error___block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 480);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__VCCallSession_setPauseVideo_force_error___block_invoke_2;
  block[3] = &unk_1E6DB4658;
  block[4] = v1;
  __int16 v4 = *(_WORD *)(a1 + 40);
  dispatch_sync(v2, block);
}

uint64_t __43__VCCallSession_setPauseVideo_force_error___block_invoke_2(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) lock];
  if (*(unsigned char *)(a1 + 40))
  {
    int v2 = *(unsigned __int8 *)(a1 + 41);
LABEL_7:
    [*(id *)(*(void *)(a1 + 32) + 24) setVideoIsPaused:v2 != 0];
    [*(id *)(*(void *)(a1 + 32) + 24) videoIsPaused];
    reportingLog();
    if (*(unsigned char *)(a1 + 41))
    {
      v7[0] = 0;
      [*(id *)(a1 + 32) stopVideo:1 error:v7];
    }
    else
    {
      v7[0] = 0;
      if (([*(id *)(a1 + 32) startVideo:1 error:v7] & 1) == 0)
      {
        reportingSymptom();
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            __43__VCCallSession_setPauseVideo_force_error___block_invoke_2_cold_1();
          }
        }
      }
    }
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "session:didPauseVideo:error:", *(void *)(a1 + 32), objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "videoIsPaused"), 0);
    if (*(unsigned char *)(a1 + 41)) {
      BOOL v6 = @"VCVideoPaused";
    }
    else {
      BOOL v6 = @"VCVideoUnpaused";
    }
    [*(id *)(*(void *)(a1 + 32) + 1120) sendMessage:v6 withTopic:@"VideoPauseStateMessageTopic"];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "didChangeLocalVariablesForSession:");
    return [*(id *)(a1 + 32) unlock];
  }
  int v3 = [*(id *)(*(void *)(a1 + 32) + 24) videoIsPaused];
  int v2 = *(unsigned __int8 *)(a1 + 41);
  if (v2 != v3) {
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "session:didPauseVideo:error:", *(void *)(a1 + 32), objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "videoIsPaused"), 0);
  __int16 v4 = *(void **)(a1 + 32);

  return [v4 unlock];
}

- (BOOL)setPauseVideo:(BOOL)a3 error:(id *)a4
{
  return [(VCCallSession *)self setPauseVideo:a3 force:0 error:a4];
}

- (void)processRelayRequestResponseDict:(id)a3 didOriginateRequest:(BOOL)a4
{
  BOOL v4 = a4;
  [(VCCallSession *)self lock];
  if ([(VCCallSession *)self isCallOngoing])
  {
    [(VCCallSession *)self unlock];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      transportSession = self->_transportSession;
      [(VCTransportSession *)transportSession processRelayRequestResponse:a3 didOriginateRequest:v4];
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCallSession processRelayRequestResponseDict:didOriginateRequest:]();
      }
    }
    [(VCCallSession *)self unlock];
  }
}

- (void)processRelayUpdateDict:(id)a3 didOriginateRequest:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [(VCCallSession *)self lock];
  if (![(VCCallSession *)self isCallOngoing])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136316162;
        uint64_t v12 = v9;
        __int16 v13 = 2080;
        __int16 v14 = "-[VCCallSession processRelayUpdateDict:didOriginateRequest:]";
        __int16 v15 = 1024;
        int v16 = 3588;
        __int16 v17 = 1024;
        int v18 = 3588;
        __int16 v19 = 1024;
        int v20 = ![(VCCallSession *)self isCallOngoing];
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m:%d: processRelayUpdateDict bailing because (![self isCallOngoing] == %d)", (uint8_t *)&v11, 0x28u);
      }
    }
    goto LABEL_15;
  }
  if (!self->remoteCallInfo)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCallSession processRelayUpdateDict:didOriginateRequest:]();
      }
    }
LABEL_15:
    [(VCCallSession *)self unlock];
    return;
  }
  [(VCCallSession *)self unlock];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(VCTransportSession *)self->_transportSession processRelayUpdate:a3 didOriginateRequest:v4];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"GKSRelayConnectionID"), "description");
    connectionManager = self->connectionManager;
    [(VCConnectionManager *)connectionManager setRelayConnectionID:v7];
  }
}

- (void)processCancelRelayRequest:(id)a3 didOriginateRequest:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (a3) {
        BOOL v8 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      }
      else {
        BOOL v8 = "<nil>";
      }
      int v9 = 136316162;
      uint64_t v10 = v6;
      __int16 v11 = 2080;
      uint64_t v12 = "-[VCCallSession processCancelRelayRequest:didOriginateRequest:]";
      __int16 v13 = 1024;
      int v14 = 3609;
      __int16 v15 = 2080;
      int v16 = v8;
      __int16 v17 = 1024;
      BOOL v18 = v4;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d STUB:processCancelRelayRequest:%s, %d", (uint8_t *)&v9, 0x2Cu);
    }
  }
}

- (void)rcvdFirstRemoteFrame
{
  v4[5] = *MEMORY[0x1E4F143B8];
  [(TimingCollection *)self->perfTimers stopTimingForKey:7];
  [(VCCallSession *)self cancelFirstRemoteFrameTimer];
  global_queue = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__VCCallSession_rcvdFirstRemoteFrame__block_invoke;
  v4[3] = &unk_1E6DB3DC8;
  v4[4] = self;
  dispatch_async(global_queue, v4);
}

uint64_t __37__VCCallSession_rcvdFirstRemoteFrame__block_invoke(uint64_t a1)
{
  reportingRemoteFrameSize();
  reportingGenericEvent();
  int v2 = *(void **)(a1 + 32);

  return [v2 logPerfTimings];
}

- (void)sendARPLData:(id)a3 toCallID:(unsigned int)a4
{
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
      __int16 v11 = "-[VCCallSession sendARPLData:toCallID:]";
      __int16 v12 = 1024;
      int v13 = 3627;
      __int16 v14 = 2080;
      uint64_t v15 = [a3 bytes];
      __int16 v16 = 1024;
      unsigned int v17 = a4;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d >>>>> Sending ARPL data <%s> with callID %d (in VCCallSession) <<<<<", (uint8_t *)&v8, 0x2Cu);
    }
  }
}

- (void)sendData:(id)a3 messageType:(unsigned int)a4 encrypted:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([a3 length])
  {
    if ([(VCCallSession *)self isSIPEnabled])
    {
      secureDataChannel = self->secureDataChannel;
      [(VCSecureDataChannel *)secureDataChannel sendData:a3 messageType:v6 encrypted:v5];
    }
    else
    {
      BOOL v10 = [(VCControlChannelMultiWay *)self->secureControlChannel sendReliableMessageAndWait:a3 withTopic:@"VCExternalClientDataTopic" participantID:0];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        __int16 v12 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v13 = "FAILURE";
          int v14 = 136316418;
          uint64_t v15 = v11;
          __int16 v16 = 2080;
          unsigned int v17 = "-[VCCallSession sendData:messageType:encrypted:]";
          if (v10) {
            int v13 = "SUCCESS";
          }
          __int16 v18 = 1024;
          int v19 = 3652;
          __int16 v20 = 2080;
          uint64_t v21 = v13;
          __int16 v22 = 1024;
          int v23 = 0;
          __int16 v24 = 2112;
          id v25 = a3;
          _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d sendReliableMessageAndWait result was %s, participantID=%d, data=%@", (uint8_t *)&v14, 0x36u);
        }
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCCallSession sendData:messageType:encrypted:]();
    }
  }
}

- (id)remoteParticipantID
{
  return [(VCCallInfo *)self->remoteCallInfo participantID];
}

- (id)localParticipantID
{
  return [(VCCallInfo *)self->localCallInfo participantID];
}

- (void)localCameraSwitchedFrom:(int)a3 to:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  reportingLog();
  [(TimingCollection *)self->cameraTimers stopTimingForKey:v5];
  cameraTimers = self->cameraTimers;

  [(TimingCollection *)cameraTimers startTimingForKey:v4];
}

- (void)getFrontCaptureTime:(float *)a3 backCaptureTime:(float *)a4
{
  [(TimingCollection *)self->cameraTimers stopTimingForKey:[(VCCallSessionDelegate *)self->delegate currentCameraID]];
  [(TimingCollection *)self->cameraTimers totalTimeForKey:0];
  *(float *)&double v7 = v7;
  *a3 = *(float *)&v7;
  [(TimingCollection *)self->cameraTimers totalTimeForKey:1];
  *(float *)&double v8 = v8;
  *a4 = *(float *)&v8;
}

- (int)negotiatedReceivingFramerate
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (![(VCMediaNegotiator *)self->_mediaNegotiator usePreNegotiation]
    || [(VCCapabilities *)self->caps isDuplexAudioOnly]
    || ![(VCCapabilities *)self->caps isVideoEnabled])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      LODWORD(v5) = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v5) {
        return v5;
      }
      -[VCCallSession negotiatedReceivingFramerate]();
    }
    LODWORD(v5) = 0;
    return v5;
  }
  mediaNegotiator = self->_mediaNegotiator;
  if (self->operatingMode == 4) {
    uint64_t v4 = [(VCMediaNegotiatorBase *)mediaNegotiator negotiatedScreenSettings];
  }
  else {
    uint64_t v4 = [(VCMediaNegotiatorBase *)mediaNegotiator negotiatedVideoSettings];
  }
  uint64_t v6 = (void *)v4;
  int IsInterfaceOnCellularForActiveConnectionWithQuality = VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality((uint64_t)self->connectionManager, 1, 1);
  int v8 = VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality((uint64_t)self->connectionManager, 1, 0);
  long long v20 = 0u;
  long long v21 = 0u;
  if (IsInterfaceOnCellularForActiveConnectionWithQuality | v8) {
    unsigned __int8 v9 = 2;
  }
  else {
    unsigned __int8 v9 = 1;
  }
  long long v22 = 0uLL;
  long long v23 = 0uLL;
  BOOL v10 = objc_msgSend((id)objc_msgSend(v6, "videoRuleCollections"), "supportedPayloads");
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
LABEL_17:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v21 != v13) {
        objc_enumerationMutation(v10);
      }
      uint64_t v15 = *(void **)(*((void *)&v20 + 1) + 8 * v14);
      if (objc_msgSend((id)objc_msgSend(v6, "videoRuleCollections"), "getVideoRulesForTransport:payload:encodingType:", v9, objc_msgSend(v15, "unsignedIntValue"), 2))
      {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v19 count:16];
        if (v12) {
          goto LABEL_17;
        }
        goto LABEL_23;
      }
    }
  }
  else
  {
LABEL_23:
    uint64_t v15 = 0;
  }
  id v16 = -[VCVideoRuleCollections getVideoRulesForTransport:payload:encodingType:](-[VCMediaNegotiatorResultsVideo videoRuleCollections](-[VCMediaNegotiatorBase negotiatedVideoSettings](self->_mediaNegotiator, "negotiatedVideoSettings"), "videoRuleCollections"), "getVideoRulesForTransport:payload:encodingType:", v9, [v15 intValue], 2);
  uint64_t v5 = [v16 count];
  if (v5)
  {
    objc_msgSend((id)objc_msgSend(v16, "objectAtIndex:", 0), "fRate");
    LODWORD(v5) = (int)v17;
  }
  return v5;
}

- (id)callMetadata
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  uint64_t v3 = [NSNumber numberWithUnsignedInt:self->callSessionBitrate];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v3, @"SessionBitRate", 0);
  if ((self->initialSentBytes & 0x8000000000000000) == 0 && !VTP_GetSendRecvStats(&v22, &v21))
  {
    uint64_t v5 = v22 - self->initialSentBytes + 4096;
    uint64_t v21 = v21 - self->initialReceivedBytes + 4096;
    uint64_t v22 = v5;
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithLongLong:");
    uint64_t v7 = [NSNumber numberWithLongLong:v21];
    [v4 setObject:v6 forKeyedSubscript:@"SessionSentBytes"];
    [v4 setObject:v7 forKeyedSubscript:@"SessionReceivedBytes"];
  }
  float v19 = NAN;
  float v20 = NAN;
  [(VCCallSession *)self getFrontCaptureTime:&v20 backCaptureTime:&v19];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    BOOL v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v24 = v9;
      __int16 v25 = 2080;
      uint64_t v26 = "-[VCCallSession callMetadata]";
      __int16 v27 = 1024;
      int v28 = 3735;
      __int16 v29 = 2048;
      double v30 = v20;
      __int16 v31 = 2048;
      double v32 = v19;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d session:didStopWithDelay:error: frontCaptureTime: %f backCaptureTime %f", buf, 0x30u);
    }
  }
  *(float *)&double v8 = v20;
  uint64_t v11 = [NSNumber numberWithFloat:v8];
  *(float *)&double v12 = v19;
  uint64_t v13 = [NSNumber numberWithFloat:v12];
  [v4 setObject:v11 forKeyedSubscript:@"FrontCaptureTime"];
  [v4 setObject:v13 forKeyedSubscript:@"BackCaptureTime"];
  uint64_t v14 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:self->awdCallNonce];
  [v4 setObject:v14 forKeyedSubscript:@"SessionDataNonce"];

  objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[VCCallSession primaryConnectionType](self, "primaryConnectionType")), @"connType");
  uint64_t v15 = (const void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self->connectionManager);
  uint64_t v16 = [NSNumber numberWithBool:VCConnection_IsLocalOnCellular((uint64_t)v15)];
  uint64_t v17 = [NSNumber numberWithBool:VCConnection_IsRemoteOnCellular((uint64_t)v15)];
  if (v15) {
    CFRelease(v15);
  }
  [v4 setObject:v16 forKeyedSubscript:@"LocalUsesCell"];
  [v4 setObject:v17 forKeyedSubscript:@"RemoteUsesCell"];
  return v4;
}

- (BOOL)pullAudioSamples:(opaqueVCAudioBufferList *)a3 rtpTimestamp:(unsigned int *)a4 lastReceivedAudioTime:(double *)a5 padding:(char *)a6 paddingLength:(char *)a7 silence:(int *)a8
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v18 = 0;
  v16[0] = a6;
  if (a7) {
    uint64_t v10 = *a7;
  }
  else {
    uint64_t v10 = 0;
  }
  v16[1] = v10;
  uint64_t v17 = v10;
  int v11 = VCAudioReceiver_PullAudioSamples((uint64_t)[(VCCallSession *)self audioReceiver], (uint64_t)a3, a4, a5, (uint64_t)v16, a8, &v18);
  BOOL v12 = v11;
  if (a7 && v11) {
    *a7 = v17;
  }
  AFRCSetReceiveQueueSize((uint64_t)self->hAFRC, v18);
  unsigned int v13 = self->awdTime + 1;
  self->awdTime = v13;
  HIDWORD(v14) = 652835029 * v13;
  LODWORD(v14) = 652835029 * v13;
  if ((v14 >> 2) <= 0x83126E) {
    VCAudioReceiver_ReportAWDMetrics(&self->audioReceiver->var0.var0);
  }
  return v12;
}

- (BOOL)isSKEOptimizationEnabled
{
  BOOL v3 = [(VCCallInfo *)self->remoteCallInfo supportsSKEOptimization];
  if (v3)
  {
    localCallInfo = self->localCallInfo;
    LOBYTE(v3) = [(VCCallInfo *)localCallInfo supportsSKEOptimization];
  }
  return v3;
}

- (unsigned)primaryConnectionType
{
  int v2 = (void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self->connectionManager);
  unsigned int v3 = [v2 type];
  if (v2) {
    CFRelease(v2);
  }
  return v3;
}

- (void)updateRelayedCallType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v6[1] = *MEMORY[0x1E4F143B8];
  [(VCCallSession *)self lock];
  self->_relayedCallType = v3;
  if ((v3 - 10) <= 0xF6u && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCCallSession updateRelayedCallType:]();
    }
  }
  uint64_t v5 = @"RelayedCT";
  v6[0] = objc_msgSend((id)objc_msgSend(NSNumber, "numberWithUnsignedChar:", v3), "stringValue");
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  reportingGenericEvent();
  [(VCCallSession *)self unlock];
}

- (void)setCapabilities:(id)a3
{
  [(VCCallSession *)self lock];
  caps = self->caps;
  uint64_t v5 = (VCCapabilities *)a3;
  self->caps = v5;
  if (self->state == 1)
  {
    BOOL v6 = [(VCCapabilities *)v5 isAudioEnabled];
    if (v6 != [(VCCapabilities *)caps isAudioEnabled]
      || (BOOL v7 = [(VCCapabilities *)self->caps isVideoEnabled],
          v7 != [(VCCapabilities *)caps isVideoEnabled]))
    {
      [(VCCallSession *)self sendCallingModeMessage];
    }
    BOOL v8 = [(VCCapabilities *)caps isAudioEnabled];
    if (v8 != [(VCCapabilities *)self->caps isAudioEnabled]) {
      -[VCCallSession enableAudio:](self, "enableAudio:", [a3 isAudioEnabled]);
    }
  }
  if (self->caps) {
    BOOL v9 = caps == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    [(VCCapabilities *)self->caps setPreferredAudioCodec:[(VCCapabilities *)caps preferredAudioCodec]];
    [(VCCapabilities *)self->caps setActualAudioCodec:[(VCCapabilities *)caps actualAudioCodec]];
    [(VCCapabilities *)self->caps setPreferredVideoCodec:[(VCCapabilities *)caps preferredVideoCodec]];
    [(VCCapabilities *)self->caps setActualVideoCodec:[(VCCapabilities *)caps actualVideoCodec]];
  }
  -[VCCallSession updateDeviceRole:](self, "updateDeviceRole:", [a3 deviceRole]);
  [(VCCallSession *)self unlock];
}

- (VCCapabilities)capabilities
{
  return self->caps;
}

- (opaqueRTCReporting)reportingAgent
{
  return self->reportingAgent;
}

- (int)audioTierNetworkBitrate
{
  int v2 = [(VCAudioTransmitter *)self->audioTransmitter currentAudioTier];

  return [(VCAudioTier *)v2 networkBitrate];
}

- (int)audioTierAudioCodecBitrate
{
  int v2 = [(VCAudioTransmitter *)self->audioTransmitter currentAudioTier];

  return [(VCAudioTier *)v2 audioCodecBitrate];
}

- (int)audioTierPacketsPerBundle
{
  int v2 = [(VCAudioTransmitter *)self->audioTransmitter currentAudioTier];

  return [(VCAudioTier *)v2 packetsPerBundle];
}

- (int)audioTierRedNumPayloads
{
  int v2 = [(VCAudioTransmitter *)self->audioTransmitter currentAudioTier];

  return [(VCAudioTier *)v2 redNumPayloads];
}

- (int)audioTierPayload
{
  int v2 = [(VCAudioTier *)[(VCAudioTransmitter *)self->audioTransmitter currentAudioTier] payloadConfig];

  return [(VCAudioPayloadConfig *)v2 payload];
}

- (NSDictionary)dtxMetrics
{
  return [(VCAudioTransmitter *)self->audioTransmitter dtxMetrics];
}

- (unsigned)currentAudioCap
{
  unsigned int v3 = [(VCBitrateArbiter *)self->callSessionBitrateArbiter maxAllowedAudioOnlyBitrateForConnection:[(VCConnectionManager *)self->connectionManager getConnectionTypeForActiveConnectionWithQuality:1 forLocalInterface:1]];
  unsigned int v4 = [(VCBitrateArbiter *)self->callSessionBitrateArbiter maxAllowedAudioOnlyBitrateForConnection:[(VCConnectionManager *)self->connectionManager getConnectionTypeForActiveConnectionWithQuality:1 forLocalInterface:0]];
  if (v4) {
    unsigned int callSessionBitrate = v4;
  }
  else {
    unsigned int callSessionBitrate = 40;
  }
  if (v3 < callSessionBitrate) {
    unsigned int callSessionBitrate = v3;
  }
  if (callSessionBitrate >= self->callSessionBitrate) {
    unsigned int callSessionBitrate = self->callSessionBitrate;
  }
  return 1000 * callSessionBitrate;
}

- (void)setSessionConferenceState:(unsigned int)a3 callID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    BOOL v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v12 = v6;
      __int16 v13 = 2080;
      unint64_t v14 = "-[VCCallSession setSessionConferenceState:callID:]";
      __int16 v15 = 1024;
      int v16 = 3888;
      __int16 v17 = 1024;
      int v18 = v4;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d setSessionConferenceState, %d", buf, 0x22u);
    }
  }
  if (v4 < 3)
  {
    reportingLog();
    VideoTransmitter_SetWindowState((uint64_t)self->hVideoTransmitter, 1, v4);
    id v8 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    BOOL v9 = objc_msgSend(v8, "initWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithInt:", v4), @"VCWindowState", 0);
    id v10 = [(VCSessionMessaging *)self->messaging newPackedMessageFromDictionary:v9];
    [(VCSessionMessaging *)self->messaging sendMessage:v10 withTopic:@"VCWindowStateChange"];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCCallSession setSessionConferenceState:callID:]();
    }
  }
}

- (void)setSessionConferenceVisualRectangle:(CGRect)a3 callID:(unsigned int)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    id v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316674;
      uint64_t v18 = v9;
      __int16 v19 = 2080;
      float v20 = "-[VCCallSession setSessionConferenceVisualRectangle:callID:]";
      __int16 v21 = 1024;
      int v22 = 3911;
      __int16 v23 = 2048;
      double v24 = x;
      __int16 v25 = 2048;
      double v26 = y;
      __int16 v27 = 2048;
      double v28 = width;
      __int16 v29 = 2048;
      double v30 = height;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d setSessionConferenceVisualRectangle: (%g, %g), %gx%g", buf, 0x44u);
    }
  }
  reportingVisualRectangle();
  VideoTransmitter_SetVisualRectangle(x, y, width, height, (uint64_t)self->hVideoTransmitter, 1);
  id v11 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v12 = [NSNumber numberWithDouble:x];
  uint64_t v13 = [NSNumber numberWithDouble:y];
  uint64_t v14 = [NSNumber numberWithDouble:width];
  __int16 v15 = objc_msgSend(v11, "initWithObjectsAndKeys:", v12, @"VCWindowOriginX", v13, @"VCWindowOriginY", v14, @"VCWindowWidth", objc_msgSend(NSNumber, "numberWithDouble:", height), @"VCWindowHeight", 0);
  id v16 = [(VCSessionMessaging *)self->messaging newPackedMessageFromDictionary:v15];
  [(VCSessionMessaging *)self->messaging sendMessage:v16 withTopic:@"VCWindowStateChange"];
}

- (void)setPeerProtocolVersion:(unsigned int)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self->_peerProtocolVersion = a3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315906;
      uint64_t v7 = v4;
      __int16 v8 = 2080;
      uint64_t v9 = "-[VCCallSession setPeerProtocolVersion:]";
      __int16 v10 = 1024;
      int v11 = 3930;
      __int16 v12 = 1024;
      unsigned int v13 = a3;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d PeerProtocolVersion set to %d", (uint8_t *)&v6, 0x22u);
    }
  }
}

- (void)messageVCMomentsRequest:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[a3 mutableCopy];
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMomentsRequestState"), "intValue") == 1)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", VideoReceiver_GetShowFrameRTPTimestamp()), @"vcMomentsRequestTimestamp");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315906;
        uint64_t v10 = v6;
        __int16 v11 = 2080;
        __int16 v12 = "-[VCCallSession messageVCMomentsRequest:]";
        __int16 v13 = 1024;
        int v14 = 3939;
        __int16 v15 = 1024;
        ShowFrameRTPint Timestamp = VideoReceiver_GetShowFrameRTPTimestamp();
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCMoments in VCCallSession requesting remote video frame for RTP timestamp %d", (uint8_t *)&v9, 0x22u);
      }
    }
  }
  [(VCCallSession *)self reportingMomentsWithRequest:a3];
  id v8 = [(VCSessionMessaging *)self->messaging newPackedMessageFromMomentsDictionary:v5];
  [(VCSessionMessaging *)self->messaging sendMessage:v8 withTopic:@"VCMomentsStateMessageTopic"];
}

- (void)reportSymptom:(unsigned int)a3
{
}

- (void)reportingMomentsWithRequest:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  unsigned __int8 v6 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMomentsRequestState"), "intValue");
  unsigned __int8 v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMomentsMediaType"), "intValue");
  id v8 = [(VCCallSession *)self remoteParticipantID];
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedChar:", v6), @"VCMRState");
  if (v8) {
    int v9 = v8;
  }
  else {
    int v9 = &stru_1F3D3E450;
  }
  [v5 setObject:v9 forKeyedSubscript:@"VCMRRecipientUUID"];
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedChar:", v7), @"VCMRMediaType");
  if (v6 == 4)
  {
    uint64_t v10 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMomentsRequestDidSucceed"), "BOOLValue");
    uint64_t v11 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMomentsFileSize"), "intValue");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v11), @"VCMRFileSize");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v10), @"VCMRFinishDidSucceed");
    if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMomentsRequestMode"), "unsignedIntValue") == 2)
    {
      ct_green_tea_logger_create_static();
      CTGreenTeaOsLogHandle = getCTGreenTeaOsLogHandle();
      if (CTGreenTeaOsLogHandle)
      {
        __int16 v13 = CTGreenTeaOsLogHandle;
        if (os_log_type_enabled(CTGreenTeaOsLogHandle, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)int v14 = 0;
          _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_INFO, "<FaceTime>[FaceTime][com.apple.AVConference]:Taken FaceTime Live Photo", v14, 2u);
        }
      }
    }
  }
  reportingMediaRecorderEvents();
}

- (BOOL)isVideoRunning
{
  if (self->state == 1) {
    return ![(VCCallSession *)self videoIsPaused];
  }
  else {
    return 0;
  }
}

- (void)triggerInterfaceChange
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    transportSession = self->_transportSession;
    [(VCTransportSession *)transportSession triggerInterfaceChange];
  }
}

- (void)notifyDelegateActiveConnectionDidChange
{
  v9[7] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = VCConnectionManager_CopyConnectionForQuality((uint64_t)self->connectionManager, 1);
  if (v3)
  {
    uint64_t v4 = (const void *)v3;
    if (VCConnection_IsRelay(v3)) {
      id v5 = @"RLY-";
    }
    else {
      id v5 = @"P2P-";
    }
    if ([(VCConnectionManager *)self->connectionManager isDuplicationEnabled]) {
      unsigned __int8 v6 = @"D-";
    }
    else {
      unsigned __int8 v6 = @"P-";
    }
    uint64_t v7 = [(__CFString *)v6 stringByAppendingString:v5];
    delegateNotificationQueue = self->delegateNotificationQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__VCCallSession_notifyDelegateActiveConnectionDidChange__block_invoke;
    v9[3] = &unk_1E6DB43D8;
    v9[4] = self;
    void v9[5] = v7;
    v9[6] = v4;
    dispatch_async(delegateNotificationQueue, v9);
    CFRelease(v4);
  }
}

uint64_t __56__VCCallSession_notifyDelegateActiveConnectionDidChange__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 8);
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 40), "stringByAppendingString:", objc_msgSend(*(id *)(a1 + 48), "localInterfaceTypeString"));
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 40), "stringByAppendingString:", objc_msgSend(*(id *)(a1 + 48), "remoteInterfaceTypeString"));
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 24) callID];

  return [v3 session:v2 connectionDidChangeWithLocalInterfaceType:v4 remoteInterfaceType:v5 callID:v6];
}

- (void)handleNewConnectionSetup:(id)a3 isInitialConnection:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  [(VCCallSession *)self updateMaxPktLength];
  [(VCCallSession *)self updateLastReceivedPacketWithTimestamp:8 packetType:micro()];
  [(VCCallSession *)self lock];
  if (VCConnection_IsLocalOnCellular((uint64_t)a3)) {
    AFRCAddBBDump();
  }
  if ((VCConnection_Priority((uint64_t)a3) & 0xFFFFFFFE) != 2
    && VCConnection_IsRemoteOnCellular((uint64_t)a3))
  {
    uint64_t v7 = [(VCBitrateArbiter *)self->callSessionBitrateArbiter maxAllowedBitrateForVCConnection:a3 forLocalInterface:0 arbiterMode:VCBitrateArbiter_ModeFromOperatingMode(self->operatingMode) encodeRule:self->_currentEncodeRule];
    if (!v7)
    {
      int operatingMode = self->operatingMode;
      if (operatingMode == 4 || operatingMode == 1) {
        uint64_t v7 = 100;
      }
      else {
        uint64_t v7 = 40;
      }
    }
    [(VCCallInfo *)self->remoteCallInfo setCellBandwidth:v7];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v12 = [(VCCallInfo *)self->remoteCallInfo cellBandwidth];
        int v13 = VCConnection_RemoteCellTech((uint64_t)a3);
        int v14 = self->operatingMode;
        int v15 = 136316418;
        uint64_t v16 = v10;
        __int16 v17 = 2080;
        uint64_t v18 = "-[VCCallSession handleNewConnectionSetup:isInitialConnection:]";
        __int16 v19 = 1024;
        int v20 = 4052;
        __int16 v21 = 1024;
        unsigned int v22 = v12;
        __int16 v23 = 1024;
        int v24 = v13;
        __int16 v25 = 1024;
        int v26 = v14;
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d connectionEstablishedCallback: initialize remote cell bitrate cap to %u, cell tech %d, operation mode %d", (uint8_t *)&v15, 0x2Eu);
      }
    }
  }
  if (v4)
  {
    [(VCCallSession *)self handleFirstConnectionSetup:a3];
    [(VCCallSession *)self updateCachedConnectionState];
    [(VCCallSession *)self unlock];
    [(VCCallSession *)self verifyFaceTimeClassicNotOnNewerBuilds];
  }
  else
  {
    [(VCCallSession *)self updateCachedConnectionState];
    [(VCCallSession *)self unlock];
  }
}

- (void)handleFirstConnectionSetup:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  [(VCCallInfo *)self->remoteCallInfo setIsPreLionOS:[(VCTransportSession *)self->_transportSession isRemoteOSPreLion]];
  if (self->didAttemptSIPInvite
    || ![(VCMediaNegotiator *)self->_mediaNegotiator usePreNegotiation]
    || (*(void *)buf = 0,
        [(VCCallSession *)self startMediaWithPreNegotiatedSettings:buf]))
  {
    int64_t sipState = self->_sipState;
    if (sipState == 6)
    {
      [(TimingCollection *)self->perfTimers startTimingForKey:1];
      double ICETimeout = GKSConnectivitySettings_GetICETimeout();
      if (ICETimeout <= 0.0)
      {
        LODWORD(ICETimeout) = 1114636288;
      }
      else
      {
        double ICETimeout = GKSConnectivitySettings_GetICETimeout();
        *(float *)&double ICETimeout = (float)(int)ICETimeout;
      }
      [(VCCallSession *)self setupCalleeSIPStartTimeout:ICETimeout];
    }
    else if (sipState == 5 && !self->didAttemptSIPInvite)
    {
      [(TimingCollection *)self->perfTimers startTimingForKey:1];
      [MEMORY[0x1E4F29060] detachNewThreadSelector:sel_sipConnectThreadProc_ toTarget:self withObject:0];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        uint64_t v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = v6;
          __int16 v50 = 2080;
          long long v51 = "-[VCCallSession handleFirstConnectionSetup:]";
          __int16 v52 = 1024;
          int v53 = 4085;
          _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession: sipConnectThreadProc", buf, 0x1Cu);
        }
      }
      self->didAttemptSIPInvite = 1;
    }
    VCConnection_IsLocalOnCellular((uint64_t)a3);
    VCConnection_LocalCellTech((uint64_t)a3);
    uint64_t v9 = CelltechToStr();
    int v10 = [a3 type];
    if ((v10 - 1) >= 6)
    {
      int v11 = v10;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        int v13 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          *(void *)&uint8_t buf[4] = v12;
          __int16 v50 = 2080;
          long long v51 = "reportingStatusCodeForConnectionType";
          __int16 v52 = 1024;
          int v53 = 10915;
          __int16 v54 = 1024;
          int v55 = v11;
          _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Invalid connection type %d", buf, 0x22u);
        }
      }
    }
    if (self->_isRedEnabled)
    {
      uint64_t v14 = 1;
    }
    else
    {
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      negotiatedAudioPayloads = self->negotiatedAudioPayloads;
      uint64_t v16 = [(NSMutableArray *)negotiatedAudioPayloads countByEnumeratingWithState:&v45 objects:v44 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v46;
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v46 != v18) {
              objc_enumerationMutation(negotiatedAudioPayloads);
            }
            if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v45 + 1) + 8 * i), "config"), "payload") == 108)
            {
              uint64_t v14 = 2;
              goto LABEL_32;
            }
          }
          uint64_t v17 = [(NSMutableArray *)negotiatedAudioPayloads countByEnumeratingWithState:&v45 objects:v44 count:16];
          uint64_t v14 = 0;
          if (v17) {
            continue;
          }
          break;
        }
      }
      else
      {
        uint64_t v14 = 0;
      }
    }
LABEL_32:
    int v20 = (const void *)VCConnectionManager_CopyConnectionForQuality((uint64_t)self->connectionManager, 1);
    uint64_t v21 = VCBitrateArbiter_ModeFromOperatingMode(self->operatingMode);
    unsigned int v22 = [(VCBitrateArbiter *)self->callSessionBitrateArbiter maxAllowedBitrateForVCConnection:v20 forLocalInterface:1 arbiterMode:v21 encodeRule:self->_currentEncodeRule];
    unsigned int v23 = [(VCBitrateArbiter *)self->callSessionBitrateArbiter maxAllowedBitrateForVCConnection:v20 forLocalInterface:0 arbiterMode:v21 encodeRule:self->_currentEncodeRule];
    if (v20) {
      CFRelease(v20);
    }
    CFAllocatorGetDefault();
    int v24 = (__CFString *)CTRegistrationCopyOperatorName();
    __int16 v25 = (__CFString *)CFPreferencesCopyAppValue(@"cannedReplay", @"com.apple.VideoConference");
    int v26 = v25;
    uint64_t v27 = @"Unavailable";
    if (v24) {
      uint64_t v27 = v24;
    }
    double v32 = @"Carrier";
    uint64_t v33 = @"CannedRelay";
    double v28 = @"missing";
    if (v25) {
      double v28 = v25;
    }
    v43[0] = v27;
    v43[1] = v28;
    v43[2] = objc_msgSend(NSString, "stringWithUTF8String:", v9, v32, v33, @"Interface");
    long long v34 = @"Upgrade";
    int v29 = [a3 type];
    double v30 = @"No";
    if (v29 == 6) {
      double v30 = @"Yes";
    }
    v43[3] = v30;
    long long v35 = @"RedState";
    v43[4] = [NSNumber numberWithInt:v14];
    long long v36 = @"WAState";
    v43[5] = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[VCWifiAssistManager wifiAssistState](+[VCWifiAssistManager sharedInstance](VCWifiAssistManager, "sharedInstance"), "wifiAssistState"));
    int v37 = @"REMBUILD";
    if ([(VCCallInfo *)self->remoteCallInfo OSVersion]) {
      uint64_t v31 = [(VCCallInfo *)self->remoteCallInfo OSVersion];
    }
    else {
      uint64_t v31 = @"unknown";
    }
    void v43[6] = v31;
    uint64_t v38 = @"localBitrateCap";
    v43[7] = [NSNumber numberWithDouble:(double)v22 * 1000.0];
    __int16 v39 = @"remoteBitrateCap";
    v43[8] = [NSNumber numberWithDouble:(double)v23 * 1000.0];
    unint64_t v40 = @"DeviceRole";
    v43[9] = [NSNumber numberWithInt:self->_deviceRole];
    uint64_t v41 = @"MicMode";
    v43[10] = objc_msgSend(NSNumber, "numberWithInteger:", -[VCCallSession getCurrentMicMode](self, "getCurrentMicMode"));
    uint64_t v42 = @"SpatialAudioSupported";
    v43[11] = objc_msgSend(NSNumber, "numberWithBool:", +[VCHardwareSettings isSpatialAudioSupported](VCHardwareSettings, "isSpatialAudioSupported"));
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:&v32 count:12];
    reportingGenericEvent();
    if (v24) {
      CFRelease(v24);
    }
    if (v26) {
      CFRelease(v26);
    }
    reportingStartTimer();
    [(VCCallSession *)self logConnectionSuccess];
    if (!self->secureDataChannel && ![(VCCapabilities *)self->caps isKeyExchangeEnabled]) {
      [(VCCallSession *)self setupSecureDataChannel];
    }
  }
  else
  {
    [(VCCallSession *)self disconnect:*(void *)buf didRemoteCancel:0];
  }
}

- (void)updateCachedConnectionState
{
  v3[5] = *MEMORY[0x1E4F143B8];
  cellTechQueue = self->cellTechQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__VCCallSession_updateCachedConnectionState__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(cellTechQueue, v3);
}

uint64_t __44__VCCallSession_updateCachedConnectionState__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1523) = [*(id *)(*(void *)(a1 + 32) + 80) isConnectedOnIPv6ForActiveConnectionWithQuality:1];
  *(unsigned char *)(*(void *)(a1 + 32) + 1521) = VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality(*(void *)(*(void *)(a1 + 32) + 80), 1, 1);
  *(unsigned char *)(*(void *)(a1 + 32) + 1522) = VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality(*(void *)(*(void *)(a1 + 32) + 80), 1, 0);
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 1232);
  uint64_t v4 = *(unsigned __int8 *)(v2 + 1521);
  uint64_t v5 = *(unsigned __int8 *)(v2 + 1522);
  uint64_t v6 = *(unsigned __int8 *)(v2 + 1523);
  uint64_t v7 = [(id)v2 currentAudioCap];

  return [v3 setCellTech:v4 remoteCellular:v5 isIPV6:v6 audioCap:v7];
}

- (void)handleKeyExchangeCompleted
{
  uint64_t v3 = (void *)MEMORY[0x1E4E589F0](self, a2);
  [(VCCallSession *)self setupSecureDataChannel];
}

- (void)setupSecureDataChannel
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v2 = "-[VCCallSession setupSecureDataChannel]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  _os_log_debug_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_DEBUG, "VCCallSession [%s] %s:%d Setting up secureDataChannel with dataChannelSharedSecret %@", v1, 0x26u);
}

- (void)redundancyController:(id)a3 redundancyVectorDidChange:(id *)a4
{
  if (a4->var0) {
    VideoTransmitter_SetFECLevelPerGroupSizeVector((uint64_t)self->hVideoTransmitter, a4->var0, (char *)a4->var1);
  }
}

- (void)redundancyController:(id)a3 redundancyPercentageDidChange:(unsigned int)a4
{
  float v4 = VCRedundancyControllerVideo_ConvertRedundancyPercentageToRatio(a4);
  double v5 = v4;

  VideoTransmitter_SetFECRatio(v5);
}

- (void)handleThermalPressureNotification:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", @"VCVideoCaptureServer_NotificationKeyThermalPressureLevel"), "intValue");
  float v4 = @"Thermal";
  v5[0] = [NSNumber numberWithUnsignedInt:v3];
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  reportingGenericEvent();
}

- (int64_t)getCurrentMicMode
{
  return MEMORY[0x1F40D0E98](@"com.apple.facetime", a2);
}

- (void)handleMicModeNotification:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  float v4 = (void *)[a3 userInfo];
  double v5 = (void *)[v4 objectForKey:*MEMORY[0x1E4F15A00]];
  if (v5)
  {
    if ([v5 isEqualToString:@"com.apple.facetime"])
    {
      int64_t v6 = [(VCCallSession *)self getCurrentMicMode];
      uint64_t v7 = @"MicMode";
      v8[0] = [NSNumber numberWithInteger:v6];
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
      reportingGenericEvent();
    }
  }
}

- (void)registerForReportingNotifications
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", self, sel_handleThermalPressureNotification_, @"VCVideoCaptureServer_NotificationNameThermalPressureLevel", 0);
  uint64_t v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = *MEMORY[0x1E4F159F8];

  [v3 addObserver:self selector:sel_handleMicModeNotification_ name:v4 object:0];
}

- (void)deregisterForReportingNotifications
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:name:object:", self, @"VCVideoCaptureServer_NotificationNameThermalPressureLevel", 0);
  uint64_t v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = *MEMORY[0x1E4F159F8];

  [v3 removeObserver:self name:v4 object:0];
}

- (tagHANDLE)rtpHandle
{
  return self->rtpHandle;
}

- (void)setRtpHandle:(tagHANDLE *)a3
{
  self->rtpHandle = a3;
}

- (int64_t)connectionChangeState
{
  return self->connectionChangeState;
}

- (void)setConnectionChangeState:(int64_t)a3
{
  self->connectionChangeState = a3;
}

- (VCConnectionManager)connectionManager
{
  return (VCConnectionManager *)objc_getProperty(self, a2, 80, 1);
}

- (void)setConnectionManager:(id)a3
{
}

- (unsigned)maxPacketLength
{
  return self->maxPacketLength;
}

- (void)setMaxPacketLength:(unsigned __int16)a3
{
  self->unsigned __int16 maxPacketLength = a3;
}

- (int64_t)state
{
  return self->state;
}

- (void)setState:(int64_t)a3
{
  self->int64_t state = a3;
}

- (int64_t)videoPayload
{
  return self->videoPayload;
}

- (void)setVideoPayload:(int64_t)a3
{
  self->int64_t videoPayload = a3;
}

- (int64_t)sampleRate
{
  return self->sampleRate;
}

- (void)setSampleRate:(int64_t)a3
{
  self->sampleRate = a3;
}

- (VCCallSessionDelegate)delegate
{
  return (VCCallSessionDelegate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isAudioRunning
{
  return self->isAudioRunning;
}

- (BOOL)isWaitingForICEResult
{
  return self->isWaitingForICEResult;
}

- (void)setIsWaitingForICEResult:(BOOL)a3
{
  self->isWaitingForICEResult = a3;
}

- (BOOL)receivedSIPInvite
{
  return self->receivedSIPInvite;
}

- (void)setReceivedSIPInvite:(BOOL)a3
{
  self->receivedSIPInvite = a3;
}

- (tagHANDLE)hMediaQueue
{
  return self->hMediaQueue;
}

- (void)setHMediaQueue:(tagHANDLE *)a3
{
  self->hMediaQueue = a3;
}

- (tagHANDLE)hAFRC
{
  return self->hAFRC;
}

- (void)setHAFRC:(tagHANDLE *)a3
{
  self->hAFRC = a3;
}

- (GKRingBuffer)ringBuf
{
  return self->ringBuf;
}

- (void)setRingBuf:(id)a3
{
}

- (unsigned)lastReceived
{
  return self->lastReceived;
}

- (void)setLastReceived:(unsigned int)a3
{
  self->lastReceived = a3;
}

- (int)preferredAudioCodec
{
  return self->preferredAudioCodec;
}

- (void)setPreferredAudioCodec:(int)a3
{
  self->preferredAudioCodec = a3;
}

- (BOOL)useControlByte
{
  return self->useControlByte;
}

- (void)setUseControlByte:(BOOL)a3
{
  self->useControlByte = a3;
}

- (BOOL)useUEP
{
  return self->useUEP;
}

- (void)setUseUEP:(BOOL)a3
{
  self->useUEP = a3;
}

- (int)bandwidthUpstream
{
  return self->bandwidthUpstream;
}

- (void)setBandwidthUpstream:(int)a3
{
  self->bandwidthUpstream = a3;
}

- (int)bandwidthDownstream
{
  return self->bandwidthDownstream;
}

- (void)setBandwidthDownstream:(int)a3
{
  self->bandwidthDownstream = a3;
}

- (NSArray)mutedPeers
{
  return self->mutedPeers;
}

- (void)setMutedPeers:(id)a3
{
}

- (BOOL)audioIsPaused
{
  return self->audioIsPaused;
}

- (int)natType
{
  return self->natType;
}

- (void)setNatType:(int)a3
{
  self->natType = a3;
}

- (NSString)peerCN
{
  return self->peerCN;
}

- (void)setPeerCN:(id)a3
{
}

- (double)packetLossRate
{
  return self->packetLossRate;
}

- (void)setPacketLossRate:(double)a3
{
  self->packetLossRate = a3;
}

- (double)packetLossRate5Secs
{
  return self->packetLossRate5Secs;
}

- (void)setPacketLossRate5Secs:(double)a3
{
  self->packetLossRate5Secs = a3;
}

- (double)networkConditionsTimeoutInSeconds
{
  return self->networkConditionsTimeoutInSeconds;
}

- (void)setNetworkConditionsTimeoutInSeconds:(double)a3
{
  self->networkConditionsTimeoutInSeconds = a3;
}

- (double)roundTripTime
{
  return self->roundTripTime;
}

- (void)setRoundTripTime:(double)a3
{
  self->double roundTripTime = a3;
}

- (int)signalStrengthBars
{
  return self->_signalStrengthBars;
}

- (void)setSignalStrengthBars:(int)a3
{
  self->_signalStrengthBars = a3;
}

- (int)signalStrengthDisplayBars
{
  return self->_signalStrengthDisplayBars;
}

- (void)setSignalStrengthDisplayBars:(int)a3
{
  self->_signalStrengthDisplayBars = a3;
}

- (int)signalStrengthMaxDisplayBars
{
  return self->_signalStrengthMaxDisplayBars;
}

- (void)setSignalStrengthMaxDisplayBars:(int)a3
{
  self->_signalStrengthMaxDisplayBars = a3;
}

- (float)packetLateAndMissingRatio
{
  return self->packetLateAndMissingRatio;
}

- (void)setPacketLateAndMissingRatio:(float)a3
{
  self->packetLateAndMissingRatio = a3;
}

- (NSString)sessionID
{
  return self->sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (BOOL)shouldTimeoutPackets
{
  return self->shouldTimeoutPackets;
}

- (void)setShouldTimeoutPackets:(BOOL)a3
{
  self->shouldTimeoutPackets = a3;
}

- (BOOL)useRateControl
{
  return self->useRateControl;
}

- (BOOL)isRTCPFBEnabled
{
  return self->isRTCPFBEnabled;
}

- (void)setIsRTCPFBEnabled:(BOOL)a3
{
  self->isRTCPFBEnabled = a3;
}

- (BOOL)shouldSendAudio
{
  return self->shouldSendAudio;
}

- (BOOL)isStarted
{
  return self->isStarted;
}

- (void)setIsStarted:(BOOL)a3
{
  self->isStarted = a3;
}

- (VCImageAttributeRules)imageAttributeRules
{
  return self->imageAttributeRules;
}

- (void)setImageAttributeRules:(id)a3
{
}

- (VideoAttributes)remoteVideoAttributes
{
  return self->remoteVideoAttributes;
}

- (void)setRemoteVideoAttributes:(id)a3
{
}

- (tagVCAudioReceiver)audioReceiver
{
  return self->audioReceiver;
}

- (unsigned)remoteFrameWidth
{
  return self->remoteFrameWidth;
}

- (void)setRemoteFrameWidth:(unsigned int)a3
{
  self->remoteFrameWidth = a3;
}

- (unsigned)remoteFrameHeight
{
  return self->remoteFrameHeight;
}

- (void)setRemoteFrameHeight:(unsigned int)a3
{
  self->remoteFrameHeight = a3;
}

- (int)operatingMode
{
  return self->operatingMode;
}

- (BOOL)isRemoteMediaStalled
{
  return self->isRemoteMediaStalled;
}

- (NSNumber)basebandCodecSampleRate
{
  return self->basebandCodecSampleRate;
}

- (void)setBasebandCodecSampleRate:(id)a3
{
}

- (NSString)basebandCodecType
{
  return self->basebandCodecType;
}

- (void)setBasebandCodecType:(id)a3
{
}

- (int)deviceRole
{
  return self->_deviceRole;
}

- (void)setDeviceRole:(int)a3
{
  self->_int deviceRole = a3;
}

- (int64_t)sipState
{
  return self->_sipState;
}

- (void)setSipState:(int64_t)a3
{
  self->_int64_t sipState = a3;
}

- (BOOL)didSend200OK
{
  return self->didSend200OK;
}

- (void)setDidSend200OK:(BOOL)a3
{
  self->didSend200OK = a3;
}

- (VCCallInfo)localCallInfo
{
  return self->localCallInfo;
}

- (NSString)peerReportingID
{
  return self->peerReportingID;
}

- (void)setPeerReportingID:(id)a3
{
}

- (double)lastDecodedFrameTime
{
  return self->_lastDecodedFrameTime;
}

- (void)setLastDecodedFrameTime:(double)a3
{
  self->_lastDecodedFrameTime = a3;
}

- (VCAudioCaptionsDelegate)captionsDelegate
{
  return (VCAudioCaptionsDelegate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCaptionsDelegate:(id)a3
{
}

- (NSData)srtpKeyBytes
{
  return (NSData *)objc_getProperty(self, a2, 1088, 1);
}

- (void)setSrtpKeyBytes:(id)a3
{
}

- (void)vcSecureDataChannel:(id)a3 messageType:(unsigned int)a4 receivedData:(id)a5
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a4 == 2)
  {
    captionsReceiver = self->_captionsReceiver;
    VCCaptionsReceiver_ProcessCaptionsData((uint64_t)captionsReceiver, a5);
  }
  else
  {
    delegateNotificationQueue = self->delegateNotificationQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __91__VCCallSession_VCSecureDataChannelDelegate__vcSecureDataChannel_messageType_receivedData___block_invoke;
    v7[3] = &unk_1E6DB3EE0;
    v7[4] = self;
    void v7[5] = a5;
    unsigned int v8 = a4;
    dispatch_async(delegateNotificationQueue, v7);
  }
}

uint64_t __91__VCCallSession_VCSecureDataChannelDelegate__vcSecureDataChannel_messageType_receivedData___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(v1 + 8);
  uint64_t v4 = *(unsigned int *)(a1 + 48);
  uint64_t v5 = [*(id *)(v1 + 24) callID];

  return [v3 session:v1 didReceiveData:v2 messageType:v4 withCallID:v5];
}

- (void)telephonyInterface:(id)a3 vocoderInfoChangedToType:(id)a4 sampleRate:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136316162;
      uint64_t v11 = v8;
      __int16 v12 = 2080;
      int v13 = "-[VCCallSession(VCTelephonyInterfaceDelegate) telephonyInterface:vocoderInfoChangedToType:sampleRate:]";
      __int16 v14 = 1024;
      int v15 = 4313;
      __int16 v16 = 2080;
      uint64_t v17 = [a4 UTF8String];
      __int16 v18 = 1024;
      int v19 = [a5 unsignedIntValue];
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d vocoderInfoChangedToType:%s sampleRate:%u", (uint8_t *)&v10, 0x2Cu);
    }
  }
  [(VCCallSession *)self lock];
  if (![(NSString *)[(VCCallSession *)self basebandCodecType] isEqualToString:a4]|| ![(NSNumber *)[(VCCallSession *)self basebandCodecSampleRate] isEqualToNumber:a5])
  {
    [(VCCallSession *)self setBasebandCodecSampleRate:a5];
    [(VCCallSession *)self setBasebandCodecType:a4];
  }
  if (self->state == 1) {
    [(VCCallSession *)self sendBasebandCodecMessage];
  }
  [(VCCallSession *)self unlock];
}

- (void)wcmSetCallConfig:(unsigned int)a3 interferenceLevel:(unsigned int)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315650;
      uint64_t v12 = v7;
      __int16 v13 = 2080;
      __int16 v14 = "-[VCCallSession(WCMClientDelegate) wcmSetCallConfig:interferenceLevel:]";
      __int16 v15 = 1024;
      int v16 = 4332;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d WCM: wcmSetCallConfig callback.", (uint8_t *)&v11, 0x1Cu);
    }
  }
  hAFRC = self->hAFRC;
  if (hAFRC != (tagHANDLE *)0xFFFFFFFFLL) {
    AFRCProcessWCMSetCallConfig((uint64_t)hAFRC, v5, a4);
  }
  rateController = self->_rateController;
  if (rateController) {
    [(AVCRateController *)rateController setTargetBitrateCap:v5];
  }
}

- (void)wcmGetCallConfig:(unsigned int *)a3 targetBitrate:(unsigned int *)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int v10 = 136315650;
      *(void *)&v10[4] = v7;
      *(_WORD *)&v10[12] = 2080;
      *(void *)&v10[14] = "-[VCCallSession(WCMClientDelegate) wcmGetCallConfig:targetBitrate:]";
      __int16 v11 = 1024;
      int v12 = 4343;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d WCM: wcmGetCallConfig callback.", v10, 0x1Cu);
    }
  }
  rateController = self->_rateController;
  if (rateController)
  {
    [(AVCRateController *)rateController configuration];
    if (a3) {
      *a3 = *(_DWORD *)&v10[12];
    }
    if (a4) {
      *a4 = [(AVCRateController *)self->_rateController targetBitrate];
    }
  }
  else
  {
    AFRCProcessWCMGetCallConfig((uint64_t)self->hAFRC, a3, a4);
  }
}

- (int)sipCallback:(int)a3 callID:(unsigned int)a4 msgIn:(const char *)a5 msgOut:(char *)a6 optional:(void *)a7 confIndex:(int *)a8
{
  uint64_t v12 = *(void *)&a4;
  uint64_t v13 = *(void *)&a3;
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  [(VCCallSession *)self updateLastReceivedPacket:1 packetType:2];
  switch((int)v13)
  {
    case 0:
    case 3:
    case 5:
    case 8:
      if ([(VCCallInfo *)self->localCallInfo callID] == v12)
      {
        if (a5 && a7) {
          reportingLog();
        }
        [(VCCallSession *)self shutdownVoiceChatFromRemoteSIPSignal:v13 withReason:a5];
      }
      return 0;
    case 1:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
        int v19 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = v18;
          *(_WORD *)&unsigned char buf[12] = 2080;
          *(void *)&buf[14] = "-[VCCallSession(Callbacks) sipCallback:callID:msgIn:msgOut:optional:confIndex:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 4452;
          _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d SIPCONNECTEDCONFERENCE", buf, 0x1Cu);
        }
      }
      id v20 = objc_alloc_init(MEMORY[0x1E4F28B28]);
      [(TimingCollection *)self->perfTimers stopTimingForKey:2];
      if ([(VCMediaNegotiator *)self->_mediaNegotiator usePreNegotiation])
      {
        [(VCCallSession *)self lock];
        self->_int64_t sipState = 1;
        [(VCCallSession *)self cancelConnectionTimeoutTimer];
        [(VCCallSession *)self unlock];
        [v20 drain];
        return 0;
      }
      [(TimingCollection *)self->perfTimers startTimingForKey:3];
      [(VCCallSession *)self lock];
      if ([(VCCallSession *)self state] != 6
        || [(VCCallInfo *)self->localCallInfo callID] != v12)
      {
        [(VCCallSession *)self unlock];
        [(TimingCollection *)self->perfTimers removeTimingForKey:3];
        [(VCCallSession *)self disconnect:0 didRemoteCancel:0];
        [v20 drain];
        return 3;
      }
      VCAudioReceiver_UpdateCellTech((uint64_t)self->audioReceiver, [(VCConnectionManager *)self->connectionManager getCellularTechForActiveConnectionWithQuality:1 forLocalInterface:1], [(VCConnectionManager *)self->connectionManager getCellularTechForActiveConnectionWithQuality:1 forLocalInterface:0]);
      if ([(VCCapabilities *)self->caps isVideoEnabled]) {
        VideoReceiver_CellTechChanged();
      }
      VCAudioReceiver_Start(&self->audioReceiver->var0.var0, v33);
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3052000000;
      *(void *)&buf[24] = __Block_byref_object_copy__15;
      *(void *)&buf[32] = __Block_byref_object_dispose__15;
      *(void *)&buf[40] = 0;
      *(int64x2_t *)&self->int64_t state = vdupq_n_s64(1uLL);
      [(VCCallSession *)self sendBasebandCodecMessage];
      [(VCCallSession *)self cancelConnectionTimeoutTimer];
      [(VCCallSession *)self unlock];
      if (![(VCCallSession *)self startMediaQueue:*(void *)&buf[8] + 40]) {
        goto LABEL_106;
      }
      [(TimingCollection *)self->perfTimers stopTimingForKey:3];
      if ([(VCCapabilities *)self->caps isDTLSEnabled])
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v34 = VRTraceErrorLogLevelToCSTR();
          long long v35 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int16 v59 = 136315650;
            *(void *)&v59[4] = v34;
            *(_WORD *)&unsigned char v59[12] = 2080;
            *(void *)&v59[14] = "-[VCCallSession(Callbacks) sipCallback:callID:msgIn:msgOut:optional:confIndex:]";
            *(_WORD *)&v59[22] = 1024;
            int v60 = 4499;
            _os_log_impl(&dword_1E1EA4000, v35, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d SIPCONNECTEDCONFERENCE: use DTLS-SRTP is enabled...", v59, 0x1Cu);
          }
        }
        if (self->srtpKeyBytes)
        {
          [(VCCallSession *)self processSIPMessage:"DTLS-SRTP" msgOut:0 optional:&self->srtpKeyBytes confIndex:a8];
          goto LABEL_87;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
        {
          VRTraceErrorLogLevelToCSTR();
          if (VRTraceIsOSFaultDisabled())
          {
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCCallSession(Callbacks) sipCallback:callID:msgIn:msgOut:optional:confIndex:]();
            }
          }
          else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
          {
            -[VCCallSession(Callbacks) sipCallback:callID:msgIn:msgOut:optional:confIndex:]();
          }
        }
        +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", *(void *)&buf[8] + 40, 32018, 205, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 4507), @"Video Insecure", @"Encryption key setup did not complete successfully");
LABEL_106:
        [(VCCallSession *)self disconnect:*(void *)(*(void *)&buf[8] + 40) didRemoteCancel:0];
        [v20 drain];
LABEL_107:
        int v27 = 3;
        goto LABEL_108;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v39 = VRTraceErrorLogLevelToCSTR();
        unint64_t v40 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int16 v59 = 136315650;
          *(void *)&v59[4] = v39;
          *(_WORD *)&unsigned char v59[12] = 2080;
          *(void *)&v59[14] = "-[VCCallSession(Callbacks) sipCallback:callID:msgIn:msgOut:optional:confIndex:]";
          *(_WORD *)&v59[22] = 1024;
          int v60 = 4516;
          _os_log_impl(&dword_1E1EA4000, v40, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d SIPCONNECTEDCONFERENCE: DTLS-SRTP is not enabled...", v59, 0x1Cu);
        }
      }
      if ([(VCCapabilities *)self->caps isKeyExchangeEnabled])
      {
        [(TimingCollection *)self->perfTimers startTimingForKey:4];
        uint64_t v58 = 0x403E000000000000;
        double v41 = micro();
        if ([(VCCapabilities *)self->caps isVideoEnabled])
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v42 = VRTraceErrorLogLevelToCSTR();
            double v43 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)__int16 v59 = 136315650;
              *(void *)&v59[4] = v42;
              *(_WORD *)&unsigned char v59[12] = 2080;
              *(void *)&v59[14] = "-[VCCallSession(Callbacks) sipCallback:callID:msgIn:msgOut:optional:confIndex:]";
              *(_WORD *)&v59[22] = 1024;
              int v60 = 4526;
              _os_log_impl(&dword_1E1EA4000, v43, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d SIPCONNECTEDCONFERENCE: Need to wait for SRTP to init... (video)", v59, 0x1Cu);
            }
          }
          int v44 = SRTPWaitUseEncryption((uint64_t)self->rtpVideo, (double *)&v58);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v45 = VRTraceErrorLogLevelToCSTR();
            long long v46 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              double v47 = micro();
              *(_DWORD *)__int16 v59 = 136316162;
              *(void *)&v59[4] = v45;
              *(_WORD *)&unsigned char v59[12] = 2080;
              *(void *)&v59[14] = "-[VCCallSession(Callbacks) sipCallback:callID:msgIn:msgOut:optional:confIndex:]";
              *(_WORD *)&v59[22] = 1024;
              int v60 = 4528;
              __int16 v61 = 2048;
              double v62 = v47 - v41;
              __int16 v63 = 1024;
              int v64 = v44;
              _os_log_impl(&dword_1E1EA4000, v46, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d SIPCONNECTEDCONFERENCE: end wait SRTP @ %.3f seconds (%08X)", v59, 0x2Cu);
            }
          }
          if (v44 < 0)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
            {
              VRTraceErrorLogLevelToCSTR();
              if (VRTraceIsOSFaultDisabled())
              {
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                  -[VCCallSession(Callbacks) sipCallback:callID:msgIn:msgOut:optional:confIndex:].cold.5();
                }
              }
              else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
              {
                -[VCCallSession(Callbacks) sipCallback:callID:msgIn:msgOut:optional:confIndex:].cold.6();
              }
            }
            +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", *(void *)&buf[8] + 40, 32018, 205, v44, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 4535), @"Video Insecure", @"Encryption key setup did not complete successfully");
            [(VCCallSession *)self disconnect:*(void *)(*(void *)&buf[8] + 40) didRemoteCancel:0];
            [v20 drain];
            goto LABEL_107;
          }
        }
        uint64_t v58 = 0x403E000000000000;
        double v48 = micro();
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v49 = VRTraceErrorLogLevelToCSTR();
          __int16 v50 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int16 v59 = 136315650;
            *(void *)&v59[4] = v49;
            *(_WORD *)&unsigned char v59[12] = 2080;
            *(void *)&v59[14] = "-[VCCallSession(Callbacks) sipCallback:callID:msgIn:msgOut:optional:confIndex:]";
            *(_WORD *)&v59[22] = 1024;
            int v60 = 4548;
            _os_log_impl(&dword_1E1EA4000, v50, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d SIPCONNECTEDCONFERENCE: Need to wait for SRTP to init... (audio)", v59, 0x1Cu);
          }
        }
        int v51 = SRTPWaitUseEncryption((uint64_t)self->rtpHandle, (double *)&v58);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v52 = VRTraceErrorLogLevelToCSTR();
          int v53 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            double v54 = micro();
            *(_DWORD *)__int16 v59 = 136316162;
            *(void *)&v59[4] = v52;
            *(_WORD *)&unsigned char v59[12] = 2080;
            *(void *)&v59[14] = "-[VCCallSession(Callbacks) sipCallback:callID:msgIn:msgOut:optional:confIndex:]";
            *(_WORD *)&v59[22] = 1024;
            int v60 = 4550;
            __int16 v61 = 2048;
            double v62 = v54 - v48;
            __int16 v63 = 1024;
            int v64 = v51;
            _os_log_impl(&dword_1E1EA4000, v53, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d SIPCONNECTEDCONFERENCE: end wait SRTP @ %.3f seconds (%08X)", v59, 0x2Cu);
          }
        }
        if (v51 < 0)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
          {
            VRTraceErrorLogLevelToCSTR();
            if (VRTraceIsOSFaultDisabled())
            {
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                -[VCCallSession(Callbacks) sipCallback:callID:msgIn:msgOut:optional:confIndex:]();
              }
            }
            else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
            {
              -[VCCallSession(Callbacks) sipCallback:callID:msgIn:msgOut:optional:confIndex:].cold.4();
            }
          }
          +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", *(void *)&buf[8] + 40, 32018, 206, v51, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 4557), @"Audio Insecure", @"Encryption key setup did not complete successfully");
          [(VCCallSession *)self disconnect:*(void *)(*(void *)&buf[8] + 40) didRemoteCancel:0];
          [v20 drain];
          goto LABEL_107;
        }
        [(TimingCollection *)self->perfTimers stopTimingForKey:4];
      }
LABEL_87:
      [(TimingCollection *)self->perfTimers startTimingForKey:5];
      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = __79__VCCallSession_Callbacks__sipCallback_callID_msgIn_msgOut_optional_confIndex___block_invoke;
      v57[3] = &unk_1E6DB5838;
      v57[4] = self;
      -[VCCallSession startAudioWithCompletionHandler:](self, "startAudioWithCompletionHandler:", (id)[v57 copy]);
      [(TimingCollection *)self->perfTimers startTimingForKey:6];
      [(TimingCollection *)self->perfTimers startTimingForKey:7];
      [(VCCallSession *)self setUpFirstRemoteFrameTimer];
      *(void *)__int16 v59 = 0;
      *(void *)&v59[8] = v59;
      *(void *)&v59[16] = 0x2020000000;
      LOBYTE(v60) = 1;
      videoQueue = self->videoQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __79__VCCallSession_Callbacks__sipCallback_callID_msgIn_msgOut_optional_confIndex___block_invoke_2;
      block[3] = &unk_1E6DB7440;
      block[4] = self;
      void block[5] = v59;
      void block[6] = buf;
      dispatch_sync(videoQueue, block);
      [(TimingCollection *)self->perfTimers stopTimingForKey:6];
      if (*(unsigned char *)(*(void *)&v59[8] + 24))
      {
        if ([(VCCallInfo *)self->localCallInfo videoIsPaused]) {
          [(VCCallSession *)self setPauseVideo:1 force:1 error:0];
        }
        [(VCCallSession *)self lock];
        [(VCCallSession *)self enableSessionHealthMonitor];
        [(VCCallSession *)self unlock];
        [(VCCallSession *)self handlePendingPrimaryConnectionChange];
        if ([(VCCallSession *)self shouldNotifyDelegateDidStartBeforeAudioSetup])
        {
          [(VCCallSession *)self notifyDelegateSessionStarted];
        }
        [v20 drain];
        int v27 = 0;
      }
      else
      {
        reportingSymptom();
        [(TimingCollection *)self->perfTimers removeTimingForKey:7];
        [(VCCallSession *)self cancelFirstRemoteFrameTimer];
        [(VCCallSession *)self disconnect:*(void *)(*(void *)&buf[8] + 40) didRemoteCancel:0];
        [v20 drain];
        int v27 = 3;
      }
      _Block_object_dispose(v59, 8);
LABEL_108:
      _Block_object_dispose(buf, 8);
      return v27;
    case 2:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v21 = VRTraceErrorLogLevelToCSTR();
        unsigned int v22 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int64_t state = self->state;
          *(_DWORD *)buf = 136316162;
          *(void *)&uint8_t buf[4] = v21;
          *(_WORD *)&unsigned char buf[12] = 2080;
          *(void *)&buf[14] = "-[VCCallSession(Callbacks) sipCallback:callID:msgIn:msgOut:optional:confIndex:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 4380;
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = state == 6;
          *(_WORD *)&buf[34] = 1024;
          *(_DWORD *)&buf[36] = state;
          _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d SIPINCOMINGCONFERENCE state == GKVoiceChatServiceStateCalleeAttemptingToConnect = %d, %d", buf, 0x28u);
        }
      }
      if (![(VCMediaNegotiator *)self->_mediaNegotiator usePreNegotiation])
      {
        *(void *)&long long v24 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&buf[27] = v24;
        *(_OWORD *)buf = v24;
        *(_OWORD *)&buf[16] = v24;
        SIPGetRemoteInfo((uint64_t)self->hSIP, [(VCCallInfo *)self->localCallInfo callID], (char *)buf, 0);
        -[VCCallInfo setUserAgent:](self->remoteCallInfo, "setUserAgent:", [NSString stringWithUTF8String:buf]);
      }
      [(VCCallSession *)self lock];
      [(TimingCollection *)self->perfTimers stopTimingForKey:1];
      [(TimingCollection *)self->perfTimers startTimingForKey:2];
      if ([(VCCallInfo *)self->remoteCallInfo usesInitialFECImplementation]) {
        int v25 = 1;
      }
      else {
        int v25 = 2;
      }
      self->fecMode = v25;
      id v26 = objc_alloc_init(MEMORY[0x1E4F28B28]);
      self->receivedSIPInvite = 1;
      *(void *)__int16 v59 = 0;
      if (self->_sipState != 6)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v36 = VRTraceErrorLogLevelToCSTR();
          int v37 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int64_t sipState = self->_sipState;
            *(_DWORD *)buf = 136315906;
            *(void *)&uint8_t buf[4] = v36;
            *(_WORD *)&unsigned char buf[12] = 2080;
            *(void *)&buf[14] = "-[VCCallSession(Callbacks) sipCallback:callID:msgIn:msgOut:optional:confIndex:]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 4415;
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = sipState;
            _os_log_impl(&dword_1E1EA4000, v37, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d SIPINCOMING: WE ARE BUSY BUSY (int64_t state = %d)", buf, 0x22u);
          }
        }
        int v27 = 3;
        goto LABEL_61;
      }
      if (![(VCMediaNegotiator *)self->_mediaNegotiator usePreNegotiation])
      {
        int v27 = [(VCCallSession *)self handleIncomingWithCallID:v12 msgIn:a5 msgOut:a6 optional:a7 confIndex:a8 error:v59];
        if (v27)
        {
LABEL_61:
          [(VCCallSession *)self unlock];
          [(VCCallSession *)self disconnect:*(void *)v59 didRemoteCancel:0];

          return v27;
        }
      }
      self->didSend200OK = 1;
      [(VCCallSession *)self unlock];

      if (![(VCMediaNegotiator *)self->_mediaNegotiator usePreNegotiation]
        && [(VCCallSession *)self isSKEOptimizationEnabled])
      {
        LODWORD(v58) = 1;
        *(void *)buf = 0;
        [(VCCallSession *)self lock];
        secretKedouble y = self->secretKey;
        if (secretKey)
        {
          *(void *)buf = CFRetain(secretKey);
          int v29 = buf;
        }
        else
        {
          int v29 = 0;
        }
        [(VCCallSession *)self unlock];
        [(VCCallSession *)self setupEncryptionWithKey:v29 confIndex:&v58];
        if (*(void *)buf) {
          CFRelease(*(CFTypeRef *)buf);
        }
      }
      return 0;
    case 6:
      [(VCCallSession *)self processSIPMessage:a5 msgOut:a6 optional:a7 confIndex:a8];
      return 0;
    case 15:
      if ([(VCCallInfo *)self->localCallInfo callID] != v12) {
        return 0;
      }
      int v27 = 0;
      if (!a5 || !a7 || !a8) {
        return v27;
      }
      reportingLog();
      return 0;
    case 16:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        int v16 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          *(void *)&uint8_t buf[4] = v15;
          *(_WORD *)&unsigned char buf[12] = 2080;
          *(void *)&buf[14] = "-[VCCallSession(Callbacks) sipCallback:callID:msgIn:msgOut:optional:confIndex:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 4671;
          *(_WORD *)&buf[28] = 2080;
          *(void *)&buf[30] = a5;
          _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d sipCallback(SIPGENERICREPORTLOG):%s", buf, 0x26u);
        }
      }
      reportingLog();
      return 0;
    case 17:
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(VCTransportSession *)self->_transportSession handleConnectionSetupDataChangeMessageDelivered];
      }
      return 0;
    case 18:
      uint64_t v17 = (const void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self->connectionManager);
      if (v17)
      {
        CFRelease(v17);
        return 0;
      }
      return 17;
    default:
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return 0;
      }
      uint64_t v30 = VRTraceErrorLogLevelToCSTR();
      uint64_t v31 = *MEMORY[0x1E4F47A50];
      int v27 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return v27;
      }
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = v30;
      *(_WORD *)&unsigned char buf[12] = 2080;
      *(void *)&buf[14] = "-[VCCallSession(Callbacks) sipCallback:callID:msgIn:msgOut:optional:confIndex:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 4691;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v13;
      _os_log_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d sipCallback: message %d requires no action.", buf, 0x22u);
      return 0;
  }
}

uint64_t __79__VCCallSession_Callbacks__sipCallback_callID_msgIn_msgOut_optional_confIndex___block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  [*(id *)(*(void *)(a1 + 32) + 672) stopTimingForKey:5];
  int64_t v6 = *(unsigned char **)(a1 + 32);
  if (a2)
  {
    if (v6[408])
    {
      [*(id *)(a1 + 32) setPauseAudio:1 force:1 error:0];
      int64_t v6 = *(unsigned char **)(a1 + 32);
    }
    [v6 updateLastReceivedPacketWithTimestamp:3 packetType:micro() + 10.0];
  }
  else
  {
    reportingSymptom();
    [*(id *)(a1 + 32) disconnect:a3 didRemoteCancel:0];
  }
  uint64_t result = [*(id *)(a1 + 32) shouldNotifyDelegateDidStartBeforeAudioSetup];
  if ((result & 1) == 0)
  {
    uint64_t v8 = *(void **)(a1 + 32);
    return [v8 notifyDelegateSessionStarted];
  }
  return result;
}

uint64_t __79__VCCallSession_Callbacks__sipCallback_callID_msgIn_msgOut_optional_confIndex___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) startVideo:0 error:*(void *)(*(void *)(a1 + 48) + 8) + 40];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int)flushBasebandQueueWithPayloads:(id)a3 flushCount:(unsigned int *)a4
{
  return [(VCTransportSession *)self->_transportSession flushBasebandQueueWithPayloads:a3 flushCount:a4];
}

- (void)handleMediaReceivedOverPeerToPeerLinkWithConnectionId:(int)a3
{
}

- (void)handleMediaReceivedOverRelayLinkWithConnectionId:(int)a3
{
}

- (BOOL)setupIDSConnectionForCallID:(unsigned int)a3 destination:(id)a4 socket:(int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  if (a4 || a5 != -1)
  {
    [(VCCallSession *)self lock];
    if (!self->_inviteDataRequested)
    {
      [(VCCallSession *)self initWithRelevantStorebagEntries];
      [(VCCallSession *)self reportOperatingMode];
    }
    if (![(VCCallInfo *)self->localCallInfo participantID])
    {
      int v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"%u", hwrandom());
      [(VCCallInfo *)self->localCallInfo setParticipantID:v10];
    }
    transportSession = self->_transportSession;
    [(VCTransportSession *)transportSession setDestination:a4];
    [(VCTransportSession *)transportSession setSocket:v7];
    if (self->isInitiator
      && [(VCCapabilities *)self->caps isKeyExchangeEnabled]
      && (int v12 = [(VCCallSession *)self setSKEBlobOnTransportSession]) != 0)
    {
      +[GKVoiceChatError getNSError:a6 code:32018 detailedCode:v12 filePath:0 description:@"Media insecure" reason:@"Key exchange failed"];
      BOOL v13 = 0;
    }
    else
    {
      BOOL v13 = 1;
    }
    [(VCCallSession *)self unlock];
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if (VRTraceIsOSFaultDisabled())
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCallSession(PrivateMethods) setupIDSConnectionForCallID:destination:socket:error:]();
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        -[VCCallSession(PrivateMethods) setupIDSConnectionForCallID:destination:socket:error:]();
      }
    }
    +[GKVoiceChatError getNSError:a6 code:32016 detailedCode:261 filePath:0 description:@"Cannot setup IDS connection" reason:@"No destination/socket"];
    return 0;
  }
  return v13;
}

- (int)setSKEBlobOnTransportSession
{
  dispatch_time(0, 5000000000);
  int v2 = SKEState_CopyBlobSync();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCCallSession(PrivateMethods) setSKEBlobOnTransportSession]();
    }
  }
  return v2;
}

- (BOOL)configureLegacyTransportWithInviteInfo:(id)a3 error:(id *)a4
{
  int64_t v6 = (void *)[a3 objectForKeyedSubscript:@"InviteDataConnectionBlob"];
  uint64_t v7 = [v6 length];
  if (v7)
  {
    transportSession = self->_transportSession;
    if ([(VCCapabilities *)self->caps isRelayForced]) {
      [(VCTransportSession *)transportSession setForceRelay];
    }
    [(VCTransportSession *)transportSession setAllowsRelay:[(VCCapabilities *)self->caps isRelayEnabled]];
    [(VCTransportSession *)transportSession setIsCaller:self->isInitiator];
    [(VCTransportSession *)transportSession setDelegate:self];
    [(VCTransportSession *)transportSession setLocalParticipantID:[(VCCallInfo *)self->localCallInfo participantID]];
    [(VCTransportSession *)transportSession setRemoteParticipantID:[(VCCallInfo *)self->remoteCallInfo participantID]];
    if ([(VCCapabilities *)self->caps isDTLSEnabled]) {
      uint64_t v9 = [(VCCallInfo *)self->remoteCallInfo callID];
    }
    else {
      uint64_t v9 = 0;
    }
    [(VCTransportSession *)transportSession setRemoteCallID:v9];
    if ([(VCCapabilities *)self->caps isDTLSEnabled]) {
      sessionuint64_t ID = self->sessionID;
    }
    else {
      sessionuint64_t ID = 0;
    }
    [(VCTransportSession *)transportSession setSessionID:sessionID];
    if ([(VCCallSession *)self isSKEOptimizationEnabled]) {
      uint64_t v11 = [MEMORY[0x1E4F29238] valueWithPointer:self->skeState];
    }
    else {
      uint64_t v11 = 0;
    }
    [(VCTransportSession *)transportSession setConnectionSetupPiggybackBlob:v11];
    [(VCTransportSession *)transportSession setRemoteConnectionData:v6];
    [(VCTransportSession *)transportSession setNATType:[(VCCallSession *)self natType]];
    [(VCTransportSession *)transportSession setOperatingMode:self->operatingMode];
    if ([(VCCapabilities *)self->caps isDTLSEnabled])
    {
      int v12 = [(VCCallSession *)self retrieveIdentity];
      [(VCTransportSession *)transportSession setIdentity:v12];
      if (v12) {
        CFRelease(v12);
      }
    }
    else
    {
      [(VCTransportSession *)transportSession setIdentity:0];
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if (VRTraceIsOSFaultDisabled())
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCallSession(PrivateMethods) configureLegacyTransportWithInviteInfo:error:]();
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        -[VCCallSession(PrivateMethods) configureLegacyTransportWithInviteInfo:error:]();
      }
    }
    +[GKVoiceChatError getNSError:a4 code:32016 detailedCode:201 filePath:0 description:@"Cannot setup legacy connection" reason:@"No remote connection blob"];
  }
  return v7 != 0;
}

- (id)newSKEBlobWithRemoteSKEBlob:(id)a3
{
  uint64_t v3 = [(VCCallSession *)self retrieveIdentity];
  if (v3)
  {
    uint64_t v4 = v3;
    int v5 = SKEState_Create();
    CFRelease(v4);
    if (v5)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCallSession(PrivateMethods) newSKEBlobWithRemoteSKEBlob:]();
        }
      }
    }
    else
    {
      dispatch_time(0, 5000000000);
      SKEState_CopyBlobSync();
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCallSession(PrivateMethods) newSKEBlobWithRemoteSKEBlob:]();
        }
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCCallSession(PrivateMethods) newSKEBlobWithRemoteSKEBlob:]();
    }
  }
  return 0;
}

uint64_t __61__VCCallSession_PrivateMethods__newSKEBlobWithRemoteSKEBlob___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v5 = 1;
  return [*(id *)(a1 + 32) processSIPMessage:"SKECheckRemoteCert" msgOut:a4 optional:a3 confIndex:&v5];
}

- (int)setupEncryptionWithKey:(const __CFData *)a3 confIndex:(int *)a4
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  uint64_t ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if ((int)ErrorLogLevelForModule >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    uint64_t ErrorLogLevelForModule = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
    if (ErrorLogLevelForModule)
    {
      *(_DWORD *)__int16 v59 = 136315650;
      *(void *)&v59[4] = v8;
      *(_WORD *)&unsigned char v59[12] = 2080;
      *(void *)&v59[14] = "-[VCCallSession(PrivateMethods) setupEncryptionWithKey:confIndex:]";
      *(_WORD *)&v59[22] = 1024;
      *(_DWORD *)&unsigned char v59[24] = 4911;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d setupEncryption", v59, 0x1Cu);
    }
  }
  uint64_t v10 = MEMORY[0x1F4188790](ErrorLogLevelForModule);
  memset(&v56[1], 170, 22);
  uint64_t v11 = MEMORY[0x1F4188790](v10);
  *(void *)((char *)&v55 + 6) = v12;
  uint64_t v54 = v12;
  *(void *)&long long v55 = v12;
  uint64_t v53 = v12;
  uint64_t v13 = MEMORY[0x1F4188790](v11);
  *(void *)((char *)&v52 + 6) = v14;
  uint64_t v51 = v14;
  *(void *)&long long v52 = v14;
  uint64_t v50 = v14;
  MEMORY[0x1F4188790](v13);
  *(void *)uint64_t v49 = v15;
  uint64_t v85 = v15;
  *(void *)&long long v16 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v84[0] = v16;
  v84[1] = v16;
  v83[2] = v16;
  v83[3] = v16;
  v83[0] = v16;
  v83[1] = v16;
  uint64_t v82 = v15;
  v81[0] = v16;
  v81[1] = v16;
  v80[2] = v16;
  v80[3] = v16;
  v80[0] = v16;
  v80[1] = v16;
  uint64_t v79 = v15;
  long long v77 = v16;
  long long v78 = v16;
  long long v75 = v16;
  long long v76 = v16;
  long long v73 = v16;
  long long v74 = v16;
  uint64_t v72 = v15;
  long long v70 = v16;
  long long v71 = v16;
  long long v68 = v16;
  long long v69 = v16;
  long long v66 = v16;
  long long v67 = v16;
  if ([(VCCapabilities *)self->caps isKeyExchangeEnabled]|| [(VCCapabilities *)self->caps isDTLSEnabled])
  {
    BOOL v17 = [(VCCapabilities *)self->caps isVideoEnabled];
    BOOL v18 = [(VCCapabilities *)self->caps isAudioEnabled];
    if (!a3) {
      goto LABEL_11;
    }
  }
  else
  {
    BOOL v18 = 0;
    BOOL v17 = 0;
    if (!a3) {
      goto LABEL_11;
    }
  }
  BOOL v19 = [(VCCapabilities *)self->caps isDTLSEnabled];
  if (!a4 && !v19)
  {
LABEL_11:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      uint64_t v21 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int16 v59 = 136315650;
        *(void *)&v59[4] = v20;
        *(_WORD *)&unsigned char v59[12] = 2080;
        *(void *)&v59[14] = "-[VCCallSession(PrivateMethods) setupEncryptionWithKey:confIndex:]";
        *(_WORD *)&v59[22] = 1024;
        *(_DWORD *)&unsigned char v59[24] = 4933;
        _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d ---- keyex cancels", v59, 0x1Cu);
      }
    }
LABEL_19:
    int v23 = 0;
    int v24 = 0;
    goto LABEL_20;
  }
  CFDataRef v22 = *a3;
  if (!v22 || CFDataGetLength(v22) <= 119)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCallSession(PrivateMethods) setupEncryptionWithKey:confIndex:]();
      }
    }
    goto LABEL_19;
  }
  BOOL v57 = v18;
  BOOL v58 = v17;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v27 = VRTraceErrorLogLevelToCSTR();
    double v28 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v59 = 136315650;
      *(void *)&v59[4] = v27;
      *(_WORD *)&unsigned char v59[12] = 2080;
      *(void *)&v59[14] = "-[VCCallSession(PrivateMethods) setupEncryptionWithKey:confIndex:]";
      *(_WORD *)&v59[22] = 1024;
      *(_DWORD *)&unsigned char v59[24] = 4942;
      _os_log_impl(&dword_1E1EA4000, v28, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d ---- keyex ok", v59, 0x1Cu);
    }
  }
  if (self->isInitiator) {
    int v29 = (UInt8 *)v56;
  }
  else {
    int v29 = (UInt8 *)&v53;
  }
  if (self->isInitiator) {
    uint64_t v30 = (UInt8 *)&v53;
  }
  else {
    uint64_t v30 = (UInt8 *)v56;
  }
  if (self->isInitiator) {
    uint64_t v31 = (UInt8 *)&v50;
  }
  else {
    uint64_t v31 = v47;
  }
  if (self->isInitiator) {
    double v32 = v47;
  }
  else {
    double v32 = (UInt8 *)&v50;
  }
  v87.location = 0;
  v87.length = 30;
  CFDataGetBytes(v22, v87, v29);
  v88.location = 30;
  v88.length = 30;
  CFDataGetBytes(v22, v88, v30);
  v89.location = 60;
  v89.length = 30;
  CFDataGetBytes(v22, v89, v31);
  v90.location = 90;
  v90.length = 30;
  CFDataGetBytes(v22, v90, v32);
  ByteToHex((unint64_t)v83, 65, (unsigned __int8 *)v56, 16);
  ByteToHex((unint64_t)v84 + 1, 29, (unsigned __int8 *)&v56[2], 14);
  ByteToHex((unint64_t)v80, 65, (unsigned __int8 *)&v53, 16);
  ByteToHex((unint64_t)v81 + 1, 29, (unsigned __int8 *)&v55, 14);
  ByteToHex((unint64_t)&v73, 65, (unsigned __int8 *)&v50, 16);
  ByteToHex((unint64_t)&v77 + 1, 29, (unsigned __int8 *)&v52, 14);
  ByteToHex((unint64_t)&v66, 65, v47, 16);
  ByteToHex((unint64_t)&v70 + 1, 29, &v48, 14);
  if ([(VCCapabilities *)self->caps isKeyExchangeEnabled]
    || [(VCCapabilities *)self->caps isDTLSEnabled])
  {
    unsigned int v33 = self->_peerProtocolVersion != 0;
    uint64_t v85 = 0;
    uint64_t v82 = 0;
    BOOL v34 = [(VCCapabilities *)self->caps isVideoEnabled];
    BOOL v18 = v57;
    BOOL v17 = v58;
    if (v34)
    {
      SRTPUseEncryption((uint64_t)self->rtpVideo, (uint64_t)v83, (uint64_t)v80, 5, 0, v33);
      int v23 = v35;
      if (v35 >= 0) {
        BOOL v17 = 0;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v36 = VRTraceErrorLogLevelToCSTR();
        int v37 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int16 v59 = 136315906;
          *(void *)&v59[4] = v36;
          *(_WORD *)&unsigned char v59[12] = 2080;
          *(void *)&v59[14] = "-[VCCallSession(PrivateMethods) setupEncryptionWithKey:confIndex:]";
          *(_WORD *)&v59[22] = 1024;
          *(_DWORD *)&unsigned char v59[24] = 4983;
          *(_WORD *)&v59[28] = 1024;
          *(_DWORD *)&v59[30] = v23;
          _os_log_impl(&dword_1E1EA4000, v37, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d UseVideoEncryption: [%08x]", v59, 0x22u);
        }
      }
    }
    else
    {
      int v23 = 0;
    }
    uint64_t v79 = 0;
    uint64_t v72 = 0;
    SRTPUseEncryption((uint64_t)self->rtpHandle, (uint64_t)&v73, (uint64_t)&v66, 5, 0, v33);
    int v24 = v38;
    if (v38 >= 0) {
      BOOL v18 = 0;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v39 = VRTraceErrorLogLevelToCSTR();
      unint64_t v40 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int16 v59 = 136315906;
        *(void *)&v59[4] = v39;
        *(_WORD *)&unsigned char v59[12] = 2080;
        *(void *)&v59[14] = "-[VCCallSession(PrivateMethods) setupEncryptionWithKey:confIndex:]";
        *(_WORD *)&v59[22] = 1024;
        *(_DWORD *)&unsigned char v59[24] = 4991;
        *(_WORD *)&v59[28] = 1024;
        *(_DWORD *)&v59[30] = v24;
        _os_log_impl(&dword_1E1EA4000, v40, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d UseAudioEncryption: [%08x]", v59, 0x22u);
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v41 = VRTraceErrorLogLevelToCSTR();
      uint64_t v42 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int16 v59 = 136315650;
        *(void *)&v59[4] = v41;
        *(_WORD *)&unsigned char v59[12] = 2080;
        *(void *)&v59[14] = "-[VCCallSession(PrivateMethods) setupEncryptionWithKey:confIndex:]";
        *(_WORD *)&v59[22] = 1024;
        *(_DWORD *)&unsigned char v59[24] = 4992;
        _os_log_impl(&dword_1E1EA4000, v42, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d ---- keyex done - using srtp", v59, 0x1Cu);
      }
    }
    if ([(VCCallSession *)self isSecureMessagingRequired])
    {
      long long v65 = 0u;
      memset(v64, 0, sizeof(v64));
      double v43 = (_DWORD *)CheckInHandleDebug();
      signed int v44 = v43[1808];
      if (v44 <= v43[2028]) {
        signed int v44 = v43[2028];
      }
      int v45 = v43[1918];
      if (v45 <= v43[2138]) {
        int v45 = v43[2138];
      }
      DWORD2(v65) = v45;
      unsigned int v46 = v43[1910];
      LODWORD(v64[0]) = v43[1800];
      *(void *)&long long v65 = __PAIR64__(v44, v46);
      CheckOutHandleDebug();
      long long v61 = v77;
      long long v62 = v78;
      uint64_t v63 = v79;
      *(_OWORD *)__int16 v59 = v73;
      *(_OWORD *)&v59[16] = v74;
      *(_OWORD *)&v59[32] = v75;
      long long v60 = v76;
      *(_OWORD *)&v64[1] = v66;
      *(_OWORD *)&v64[3] = v67;
      v64[13] = v72;
      *(_OWORD *)&v64[9] = v70;
      *(_OWORD *)&v64[11] = v71;
      *(_OWORD *)&v64[5] = v68;
      *(_OWORD *)&v64[7] = v69;
      objc_msgSend(-[VCCallSession activeControlChannel](self, "activeControlChannel"), "setEncryptionWithEncryptionMaterial:", v59);
    }
  }
  else
  {
    int v23 = 0;
    int v24 = 0;
    BOOL v18 = v57;
    BOOL v17 = v58;
  }
LABEL_20:
  pthread_mutex_lock(&self->srtpLock);
  if (self->didPrepareSRTP)
  {
    if (v17)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCallSession(PrivateMethods) setupEncryptionWithKey:confIndex:]();
        }
      }
      SRTPCancelEncryption();
    }
    if (v18)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCallSession(PrivateMethods) setupEncryptionWithKey:confIndex:]();
        }
      }
      SRTPCancelEncryption();
    }
  }
  pthread_mutex_unlock(&self->srtpLock);
  SRTPClearExchangeInfo((uint64_t)v83);
  SRTPClearExchangeInfo((uint64_t)&v73);
  SRTPClearExchangeInfo((uint64_t)v80);
  SRTPClearExchangeInfo((uint64_t)&v66);
  if (v18) {
    int v25 = v24;
  }
  else {
    int v25 = 0;
  }
  if (v17) {
    return v23;
  }
  else {
    return v25;
  }
}

- (VCCallSession)initWithRelevantStorebagEntries
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  double NoRemotePacketsTimeout = GKSConnectivitySettings_GetNoRemotePacketsTimeout();
  double v4 = 20.0;
  if (NoRemotePacketsTimeout > 20.0) {
    double v4 = GKSConnectivitySettings_GetNoRemotePacketsTimeout();
  }
  self->noRemotePacketsTimeout = v4;
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  uint64_t v6 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      double v9 = self->noRemotePacketsTimeout;
      int v16 = 136315906;
      uint64_t v17 = v7;
      __int16 v18 = 2080;
      BOOL v19 = "-[VCCallSession(PrivateMethods) initWithRelevantStorebagEntries]";
      __int16 v20 = 1024;
      int v21 = 5039;
      __int16 v22 = 2048;
      double v23 = v9;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d noRemotePacketsTimeout = %f", (uint8_t *)&v16, 0x26u);
    }
  }
  +[GKSConnectivitySettings getRemoteMediaStallTimeout];
  self->_remoteMediaStallTimeout = v10;
  self->double networkConditionsTimeoutInSeconds = fmax(GKSConnectivitySettings_GetNetworkConditionsTimeout(), 20.0);
  *(_OWORD *)&self->timeLastKnowGoodNetworkPLR = 0u;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    uint64_t v12 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      double networkConditionsTimeoutInSeconds = self->networkConditionsTimeoutInSeconds;
      int v16 = 136315906;
      uint64_t v17 = v11;
      __int16 v18 = 2080;
      BOOL v19 = "-[VCCallSession(PrivateMethods) initWithRelevantStorebagEntries]";
      __int16 v20 = 1024;
      int v21 = 5049;
      __int16 v22 = 2048;
      double v23 = networkConditionsTimeoutInSeconds;
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d double networkConditionsTimeoutInSeconds = %f", (uint8_t *)&v16, 0x26u);
    }
  }
  objc_msgSend(+[GKSConnectivitySettings getClientOption:](GKSConnectivitySettings, "getClientOption:", @"gk-p2p-video-throttling-timeout"), "doubleValue");
  if (v14 <= 15.0) {
    double v14 = 30.0;
  }
  self->videoThrottlingTimeout = v14;
  +[GKSConnectivitySettings getNoRemoteDuplicationThresholdFast];
  return (VCCallSession *)-[VCConnectionManager setNoRemoteDuplicationThresholdFast:](self->connectionManager, "setNoRemoteDuplicationThresholdFast:");
}

- (void)updateNetworkCheckHint:(double)a3
{
  v5[5] = *MEMORY[0x1E4F143B8];
  if (self->shouldTimeoutPackets)
  {
    double v3 = self->networkConditionsTimeoutInSeconds * 0.25;
    if (a3 - self->timeLastKnowGoodNetworkPLR > v3
      || a3 - self->timeLastKnowGoodNetworkRTT > v3
      || a3 - self->lastReceivedPacketTimestamp > self->noRemotePacketsTimeout * 0.25)
    {
      if (self->isCurrentNetworkBad) {
        return;
      }
      self->isCurrentNetworkBad = 1;
      goto LABEL_7;
    }
    if (self->isCurrentNetworkBad)
    {
      self->isCurrentNetworkBad = 0;
LABEL_7:
      delegateNotificationQueue = self->delegateNotificationQueue;
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      void v5[2] = __56__VCCallSession_PrivateMethods__updateNetworkCheckHint___block_invoke;
      v5[3] = &unk_1E6DB3DC8;
      v5[4] = self;
      dispatch_async(delegateNotificationQueue, v5);
    }
  }
}

uint64_t __56__VCCallSession_PrivateMethods__updateNetworkCheckHint___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(void **)(v2 + 8);
  uint64_t v4 = [*(id *)(v2 + 24) callID];
  uint64_t v5 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 1144);

  return [v3 session:v2 withCallID:v4 networkHint:v5];
}

- (void)logDetailedNetworkInformation
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  [(VCTransportSession *)self->_transportSession getSignalStrengthBars:&self->_signalStrengthBars displayBars:&self->_signalStrengthDisplayBars maxDisplayBars:&self->_signalStrengthMaxDisplayBars];
  int sampleLogCount = self->sampleLogCount;
  self->int sampleLogCount = sampleLogCount + 1;
  if ((sampleLogCount & 3) == 0 && (int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      [(VCCallSession *)self networkQuality];
      uint64_t v7 = v6;
      [(VCCallSession *)self roundTripTime];
      uint64_t v9 = v8;
      int v10 = [(VCCallSession *)self bandwidthUpstream];
      [(VCCallSession *)self packetLossRate5Secs];
      double v12 = v11 * 100.0;
      [(VCCallSession *)self packetLateAndMissingRatio];
      int v14 = 136317698;
      uint64_t v15 = v4;
      __int16 v16 = 2080;
      uint64_t v17 = "-[VCCallSession(PrivateMethods) logDetailedNetworkInformation]";
      __int16 v18 = 1024;
      int v19 = 5112;
      __int16 v20 = 2048;
      uint64_t v21 = v7;
      __int16 v22 = 2048;
      uint64_t v23 = v9;
      __int16 v24 = 1024;
      int v25 = v10;
      __int16 v26 = 2048;
      double v27 = v12;
      __int16 v28 = 2048;
      double v29 = v13 * 100.0;
      __int16 v30 = 1024;
      int v31 = [(VCCallSession *)self signalStrengthBars];
      __int16 v32 = 1024;
      int v33 = [(VCCallSession *)self signalStrengthDisplayBars];
      __int16 v34 = 1024;
      int v35 = [(VCCallSession *)self signalStrengthMaxDisplayBars];
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d NQ = %.3f, RTT = %.3f, TxBW = %ub/sec, PLR = %.2f%%, PLaMR = %.2f%%, signal = [%d %d %d]", (uint8_t *)&v14, 0x5Cu);
    }
  }
}

- (void)setupDTLSDefaults
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"forceDTLS", @"com.apple.VideoConference", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    [(VCCapabilities *)self->caps setIsDTLSEnabled:AppIntegerValue != 0];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL v6 = [(VCCapabilities *)self->caps isDTLSEnabled];
        unsigned int v7 = [(VCCallInfo *)self->localCallInfo callID];
        *(_DWORD *)buf = 136316162;
        uint64_t v13 = v4;
        __int16 v14 = 2080;
        uint64_t v15 = "-[VCCallSession(PrivateMethods) setupDTLSDefaults]";
        __int16 v16 = 1024;
        int v17 = 5122;
        __int16 v18 = 1024;
        unsigned int v19 = v6;
        __int16 v20 = 1024;
        unsigned int v21 = v7;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d DTLS force set to (%d) for call (%d): ", buf, 0x28u);
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v10 = [(VCCallInfo *)self->localCallInfo callID];
        *(_DWORD *)buf = 136315906;
        uint64_t v13 = v8;
        __int16 v14 = 2080;
        uint64_t v15 = "-[VCCallSession(PrivateMethods) setupDTLSDefaults]";
        __int16 v16 = 1024;
        int v17 = 5126;
        __int16 v18 = 1024;
        unsigned int v19 = v10;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d NO DTLS force set for call (%d).  We are ignoring the capabilities passed.", buf, 0x22u);
      }
    }
    [(VCCapabilities *)self->caps setIsDTLSEnabled:0];
  }
}

- (void)setupPeerInfo:(id)a3 usingInviteData:(id)a4 isCaller:(BOOL)a5 capabilities:(id)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!self->isStarted)
  {
    BOOL v7 = a5;
    self->isStarted = 1;
    self->isInitiator = a5;
    double v11 = objc_alloc_init(VCCallInfo);
    self->remoteCallInfo = v11;
    [(VCCallInfo *)v11 setParticipantID:a3];
    [(VCCallSession *)self setRemoteCallInfoFromInviteDictionary:a4];
    SIPSetEnableCompression((uint64_t)self->hSIP, [(VCCallInfo *)self->remoteCallInfo supportSDPCompression]);
    [(VCCallSession *)self setCapabilities:a6];
    [(VCCallSession *)self setupDTLSDefaults];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint64_t v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL v14 = [(VCCapabilities *)self->caps isAudioPausedToStart];
        BOOL v15 = [(VCCapabilities *)self->caps isVideoPausedToStart];
        int v17 = 136316162;
        uint64_t v18 = v12;
        __int16 v19 = 2080;
        __int16 v20 = "-[VCCallSession(PrivateMethods) setupPeerInfo:usingInviteData:isCaller:capabilities:]";
        __int16 v21 = 1024;
        int v22 = 5158;
        __int16 v23 = 1024;
        BOOL v24 = v14;
        __int16 v25 = 1024;
        BOOL v26 = v15;
        _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d setupPeerInfo isAudioPausedToStart = %d, isVideoPausedToStart = %d", (uint8_t *)&v17, 0x28u);
      }
    }
    self->BOOL audioIsPaused = [(VCCapabilities *)self->caps isAudioPausedToStart];
    [(VCCallInfo *)self->localCallInfo setVideoIsPaused:[(VCCapabilities *)self->caps isVideoPausedToStart]];
    if ([(VCCapabilities *)self->caps isKeyExchangeEnabled]) {
      [(VCCallSession *)self setLocalIdentityForKeyExchange];
    }
    int64_t v16 = 5;
    if (!v7) {
      int64_t v16 = 6;
    }
    self->int64_t state = v16;
    if (self->hSIP != (tagHANDLE *)0xFFFFFFFFLL)
    {
      self->_int64_t sipState = v16;
      [(VCCallSession *)self setupConnectionTimeoutTimerWithErrorCode:32002 detailedCode:257 description:@"Connection to remote participant timed out" reason:@"Connection took too long"];
    }
    [(VCCallSession *)self setupMessaging];
  }
}

- (__SecIdentity)retrieveIdentity
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  double v3 = (__SecIdentity *)[MEMORY[0x1E4F4E1E8] copyIdentity];
  if (v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315650;
        uint64_t v8 = v4;
        __int16 v9 = 2080;
        unsigned int v10 = "-[VCCallSession(PrivateMethods) retrieveIdentity]";
        __int16 v11 = 1024;
        int v12 = 5193;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d retreiveIdentity: using APS identity...", (uint8_t *)&v7, 0x1Cu);
      }
    }
  }
  [(VCCallSession *)self logIdentity:v3];
  return v3;
}

- (void)notifyDelegateAndEndCall:(int64_t)a3 didRemoteCancel:(BOOL)a4 error:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  unsigned int v9 = ((unint64_t)a3 > 7) | (0x7Fu >> a3);
  unsigned int v10 = ((unint64_t)a3 < 8) & (0x60u >> a3);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    int v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL sentClientSuccessfulDidStart = self->sentClientSuccessfulDidStart;
      *(_DWORD *)buf = 136316674;
      uint64_t v23 = v11;
      __int16 v24 = 2080;
      __int16 v25 = "-[VCCallSession(PrivateMethods) notifyDelegateAndEndCall:didRemoteCancel:error:]";
      __int16 v26 = 1024;
      int v27 = 5224;
      __int16 v28 = 1024;
      int v29 = v9 & 1;
      __int16 v30 = 1024;
      unsigned int v31 = v10;
      __int16 v32 = 1024;
      int v33 = a3;
      __int16 v34 = 1024;
      BOOL v35 = sentClientSuccessfulDidStart;
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession: notifying delegate didStop %d:%d (%d, %d)", buf, 0x34u);
    }
  }
  if (v9)
  {
    if (self->hSIP != (tagHANDLE *)0xFFFFFFFFLL)
    {
      global_queue = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __80__VCCallSession_PrivateMethods__notifyDelegateAndEndCall_didRemoteCancel_error___block_invoke;
      block[3] = &unk_1E6DB7490;
      BOOL v21 = a4;
      void block[5] = a5;
      void block[6] = a3;
      block[4] = self;
      dispatch_async(global_queue, block);
    }
    delegateNotificationQueue = self->delegateNotificationQueue;
    if (v10)
    {
      int64_t v16 = v19;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      int v17 = __80__VCCallSession_PrivateMethods__notifyDelegateAndEndCall_didRemoteCancel_error___block_invoke_2;
    }
    else
    {
      int64_t v16 = v18;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      int v17 = __80__VCCallSession_PrivateMethods__notifyDelegateAndEndCall_didRemoteCancel_error___block_invoke_3;
    }
    void v16[2] = v17;
    v16[3] = &unk_1E6DB3E40;
    v16[4] = self;
    v16[5] = a5;
    dispatch_async(delegateNotificationQueue, v16);
  }
}

uint64_t __80__VCCallSession_PrivateMethods__notifyDelegateAndEndCall_didRemoteCancel_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 calculateSIPEndAction:*(unsigned __int8 *)(a1 + 56) currentState:*(void *)(a1 + 48) error:*(void *)(a1 + 40)];
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 24) callID];
  uint64_t v5 = *(void *)(a1 + 40);

  return [v2 doSipEndAction:v3 callID:v4 error:v5];
}

void __80__VCCallSession_PrivateMethods__notifyDelegateAndEndCall_didRemoteCancel_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)VCConnectionManager_CopyPrimaryConnection(*(void *)(*(void *)(a1 + 32) + 80));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "session:didStart:connectionType:localInterfaceType:remoteInterfaceType:error:", *(void *)(a1 + 32), 0, objc_msgSend(v2, "type"), objc_msgSend(v2, "localInterfaceTypeString"), objc_msgSend(v2, "remoteInterfaceTypeString"), *(void *)(a1 + 40));
  if (v2)
  {
    CFRelease(v2);
  }
}

uint64_t __80__VCCallSession_PrivateMethods__notifyDelegateAndEndCall_didRemoteCancel_error___block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) session:*(void *)(a1 + 32) didStopWithError:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);

  return objc_msgSend(v2, "session:cleanUpWithDelay:error:");
}

- (int64_t)calculateSIPEndAction:(BOOL)a3 currentState:(int64_t)a4 error:(id)a5
{
  if (a3) {
    return 0;
  }
  if (a5)
  {
    uint64_t v8 = [a5 code];
    if ((unint64_t)(v8 - 32003) <= 6 && ((1 << (v8 - 3)) & 0x61) != 0) {
      return 3;
    }
  }
  switch(a4)
  {
    case 5:
      return 2;
    case 7:
      return 3;
    case 6:
      return self->didSend200OK;
    default:
      return 1;
  }
}

- (void)reportDashboardEndResult:(BOOL)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  switch(self->state)
  {
    case 1:
      if (!VCCTServiceMonitor_GetIsInHomeCountry() && (int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        int v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v17 = v6;
          __int16 v18 = 2080;
          __int16 v19 = "-[VCCallSession(PrivateMethods) reportDashboardEndResult:]";
          __int16 v20 = 1024;
          int v21 = 5340;
          __int16 v22 = 2080;
          uint64_t v23 = "home country";
          _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d reportDashboardEndResult: This call is in %s.", buf, 0x26u);
        }
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        unsigned int v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v10 = [(VCConnectionManager *)self->connectionManager signalingExcessiveCellularRxBytes];
          unint64_t v11 = [(VCConnectionManager *)self->connectionManager signalingExcessiveCellularTxBytes];
          unint64_t v12 = [(VCConnectionManager *)self->connectionManager mediaExcessiveCellularRxBytes];
          unint64_t v13 = [(VCConnectionManager *)self->connectionManager mediaExcessiveCellularTxBytes];
          unint64_t v14 = [(VCConnectionManager *)self->connectionManager budgetConsumingCellularTxBytes];
          unint64_t v15 = [(VCConnectionManager *)self->connectionManager budgetConsumingCellularRxBytes];
          *(_DWORD *)buf = 136317186;
          uint64_t v17 = v8;
          __int16 v18 = 2080;
          __int16 v19 = "-[VCCallSession(PrivateMethods) reportDashboardEndResult:]";
          __int16 v20 = 1024;
          int v21 = 5343;
          __int16 v22 = 2048;
          uint64_t v23 = (const char *)v10;
          __int16 v24 = 2048;
          unint64_t v25 = v11;
          __int16 v26 = 2048;
          unint64_t v27 = v12;
          __int16 v28 = 2048;
          unint64_t v29 = v13;
          __int16 v30 = 2048;
          unint64_t v31 = v14;
          __int16 v32 = 2048;
          unint64_t v33 = v15;
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Reporting excessive cellular data usage: signalingExcessiveCellularRxBytes %llu, signalingExcessiveCellularTxBytes %llu, mediaExcessiveCellularRxBytes %llu, mediaExcessiveCellularTxBytes %llu budgetConsumingCellularTxBytes:%llu budgetConsumingCellularRxBytes:%llu", buf, 0x58u);
        }
      }
      [(VCConnectionManager *)self->connectionManager signalingExcessiveCellularRxBytes];
      [(VCConnectionManager *)self->connectionManager signalingExcessiveCellularTxBytes];
      [(VCConnectionManager *)self->connectionManager mediaExcessiveCellularRxBytes];
      [(VCConnectionManager *)self->connectionManager mediaExcessiveCellularTxBytes];
      [(VCCallSession *)self dtxMetrics];
      reportingDisconnected();
      break;
    case 3:
    case 5:
      reportingAgent = self->reportingAgent;
      uint64_t v5 = 0;
      goto LABEL_12;
    case 6:
      reportingAgent = self->reportingAgent;
      uint64_t v5 = 1;
LABEL_12:
      MEMORY[0x1F4105A50](reportingAgent, v5, a3);
      break;
    default:
      return;
  }
}

- (void)cleanupMedia
{
  uint64_t v6 = objc_alloc_init(SnapshotTimer);
  [(SnapshotTimer *)v6 checkinWithTimeout:@"Media cleanup" forTask:1.75];
  pthread_mutex_lock(&self->srtpLock);
  if (self->didPrepareSRTP)
  {
    SRTPCancelEncryption();
    SRTPCancelEncryption();
    self->didPrepareSRTP = 0;
  }
  RTPSetAudioReceiver((uint64_t)self->rtpVideo, 0);
  self->rtpHandle = (tagHANDLE *)0xFFFFFFFFLL;
  self->rtpVideo = (tagHANDLE *)0xFFFFFFFFLL;
  audioReceiver = self->audioReceiver;
  if (audioReceiver)
  {
    VCAudioReceiver_Finalize(&audioReceiver->var0.var0);
    self->audioReceiver = 0;
  }

  self->_captionsReceiver = 0;
  pthread_mutex_unlock(&self->srtpLock);
  RTPCloseHandle();
  RTPCloseHandle();
  VCMediaControlInfoGeneratorDeregisterCallbacks(self->videoMediaControlInfoGenerator, (const char *)self);
  VCMediaControlInfoGeneratorDeregisterCallbacks(self->audioMediaControlInfoGenerator, (const char *)self);
  if (self->isWaitingForICEResult)
  {
    id v4 = +[VideoConferenceManager defaultVideoConferenceManager];
    id v5 = v4;
    objc_msgSend((id)objc_msgSend(v4, "resultQueue"), "addResult:forCallID:", 0, -[VCCallInfo callID](self->localCallInfo, "callID"));
  }
  [(VCCallSession *)self disableSessionHealthMonitor];
  [(SnapshotTimer *)v6 checkout];
}

- (void)startPausedHeartbeat
{
  v8[5] = *MEMORY[0x1E4F143B8];
  if (!self->pausedAudioHeartBeat && self->shouldTimeoutPackets)
  {
    [(VCPacketBundler *)[(VCAudioTransmitter *)self->audioTransmitter audioBundler] resetBuffer];
    [(VCPacketBundler *)[(VCAudioTransmitter *)self->audioTransmitter audioBundlerShortRED] resetBuffer];
    [+[VCDefaults sharedInstance] pauseHeartbeatInterval];
    if (v3 > 0.0)
    {
      float v4 = v3;
      global_queue = dispatch_get_global_queue(2, 0);
      uint64_t v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, global_queue);
      self->pausedAudioHeartBeat = v6;
      if (v6)
      {
        dispatch_source_set_timer((dispatch_source_t)v6, 0, (unint64_t)(v4 * 1000000000.0), 0x5F5E100uLL);
        pausedAudioHeartBeat = self->pausedAudioHeartBeat;
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        void v8[2] = __53__VCCallSession_PrivateMethods__startPausedHeartbeat__block_invoke;
        v8[3] = &unk_1E6DB3DC8;
        v8[4] = self;
        dispatch_source_set_event_handler(pausedAudioHeartBeat, v8);
        dispatch_resume((dispatch_object_t)self->pausedAudioHeartBeat);
      }
    }
  }
}

void __53__VCCallSession_PrivateMethods__startPausedHeartbeat__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) lock];
  [*(id *)(*(void *)(a1 + 32) + 1120) sendMessage:@"Ping!" withTopic:@"VCPingTopic"];
  [*(id *)(a1 + 32) unlock];
  [*(id *)(a1 + 32) updateLastReceivedPacketWithTimestamp:7 packetType:VCAudioReceiver_GetLatestAudioTimestamp(*(void *)(*(void *)(a1 + 32) + 1224))];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 1224);

  VCAudioReceiver_DiscardQueueExcess(v2);
}

- (void)stopPausedHeartbeat
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->pausedAudioHeartBeat)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      float v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315650;
        uint64_t v7 = v3;
        __int16 v8 = 2080;
        unsigned int v9 = "-[VCCallSession(PrivateMethods) stopPausedHeartbeat]";
        __int16 v10 = 1024;
        int v11 = 5451;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d We are tearing down our heartbeat!", (uint8_t *)&v6, 0x1Cu);
      }
    }
    dispatch_source_cancel((dispatch_source_t)self->pausedAudioHeartBeat);
    pausedAudioHeartBeat = self->pausedAudioHeartBeat;
    if (pausedAudioHeartBeat)
    {
      dispatch_release(pausedAudioHeartBeat);
      self->pausedAudioHeartBeat = 0;
    }
  }
}

- (void)logPerfTimings
{
  uint64_t v4 = 0;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = (os_log_t *)MEMORY[0x1E4F47A50];
  *(void *)&long long v2 = 136316162;
  long long v9 = v2;
  do
  {
    if (-[TimingCollection hasKey:](self->perfTimers, "hasKey:", v4, v9)
      && [(TimingCollection *)self->perfTimers isValidTimingForKey:v4]
      && (int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        [(TimingCollection *)self->perfTimers timingForKey:v4];
        *(_DWORD *)buf = v9;
        uint64_t v11 = v6;
        __int16 v12 = 2080;
        unint64_t v13 = "-[VCCallSession(PrivateMethods) logPerfTimings]";
        __int16 v14 = 1024;
        int v15 = 5462;
        __int16 v16 = 1024;
        int v17 = v4;
        __int16 v18 = 1024;
        int v19 = (int)(v8 * 1000.0);
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d sendTimings:Kedouble y = %d, value = %d", buf, 0x28u);
      }
    }
    uint64_t v4 = (v4 + 1);
  }
  while (v4 != 24);
}

- (void)sendTimings
{
  [(VCCallSession *)self logPerfTimings];
  reportingAgent = self->reportingAgent;
  perfTimers = self->perfTimers;

  MEMORY[0x1F4105B00](reportingAgent, 0, perfTimers, 0);
}

- (void)remotePauseDidChangeToState:(BOOL)a3 forVideo:(BOOL)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  videoQueue = self->videoQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__VCCallSession_PrivateMethods__remotePauseDidChangeToState_forVideo___block_invoke;
  block[3] = &unk_1E6DB4658;
  BOOL v6 = a4;
  block[4] = self;
  BOOL v7 = a3;
  dispatch_async(videoQueue, block);
}

uint64_t __70__VCCallSession_PrivateMethods__remotePauseDidChangeToState_forVideo___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    [*(id *)(*(void *)(a1 + 32) + 32) setVideoIsPaused:*(unsigned __int8 *)(a1 + 41) != 0];
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(v2 + 8);
    uint64_t v4 = *(unsigned __int8 *)(a1 + 41);
    uint64_t v5 = [*(id *)(v2 + 24) callID];
    return [v3 remoteVideoDidPause:v4 callID:v5];
  }
  else
  {
    if (*(unsigned char *)(a1 + 41))
    {
      VCAudioReceiver_Reset(*(void *)(*(void *)(a1 + 32) + 1224));
      BOOL v7 = *(unsigned char *)(a1 + 41) != 0;
    }
    else
    {
      BOOL v7 = 0;
    }
    [*(id *)(*(void *)(a1 + 32) + 80) setConnectionPause:v7 isLocalConnection:0];
    AFRCSetAudioPaused(*(void *)(*(void *)(a1 + 32) + 344), *(unsigned __int8 *)(a1 + 41), 0);
    uint64_t v8 = *(void *)(a1 + 32);
    long long v9 = *(void **)(v8 + 352);
    if (v9)
    {
      objc_msgSend((id)objc_msgSend(v9, "mediaController"), "setIsRemoteAudioPaused:", *(unsigned __int8 *)(a1 + 41));
      uint64_t v8 = *(void *)(a1 + 32);
    }
    __int16 v10 = *(void **)(v8 + 8);
    uint64_t v11 = *(unsigned __int8 *)(a1 + 41);
    uint64_t v12 = [*(id *)(v8 + 24) callID];
    return [v10 remoteAudioDidPause:v11 callID:v12];
  }
}

- (void)processSIPMessage:(char *)a3 msgOut:(char *)a4 optional:(void *)a5 confIndex:(int *)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    uint64_t v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = v11;
      __int16 v34 = 2080;
      BOOL v35 = "-[VCCallSession(PrivateMethods) processSIPMessage:msgOut:optional:confIndex:]";
      __int16 v36 = 1024;
      int v37 = 5498;
      __int16 v38 = 2080;
      uint64_t v39 = a3;
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d SipCallbackNotification SIPMESSAGE...%s", buf, 0x26u);
    }
  }
  if (!strcmp("SKEComplete", a3) || !strcmp("DTLS-SRTP", a3))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      int v17 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = v16;
        __int16 v34 = 2080;
        BOOL v35 = "-[VCCallSession(PrivateMethods) processSIPMessage:msgOut:optional:confIndex:]";
        __int16 v36 = 1024;
        int v37 = 5502;
        _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d SipCallbackNotification SKEComplete...", buf, 0x1Cu);
      }
    }
    [(VCCallSession *)self setupEncryptionWithKey:a5 confIndex:a6];
  }
  else if (!strcmp("SKECheckRemoteCert", a3))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      int v19 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = v18;
        __int16 v34 = 2080;
        BOOL v35 = "-[VCCallSession(PrivateMethods) processSIPMessage:msgOut:optional:confIndex:]";
        __int16 v36 = 1024;
        int v37 = 5505;
        _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d SipCallbackNotification SKECheckRemoteCert...", buf, 0x1Cu);
      }
    }
    if (a5)
    {
      if (self->peerCN)
      {
        uint64_t v20 = (void *)SecCertificateCopyCommonNames();
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v21 = VRTraceErrorLogLevelToCSTR();
          __int16 v22 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v23 = [(NSString *)self->peerCN UTF8String];
            *(_DWORD *)buf = 136315906;
            *(void *)&uint8_t buf[4] = v21;
            __int16 v34 = 2080;
            BOOL v35 = "-[VCCallSession(PrivateMethods) processSIPMessage:msgOut:optional:confIndex:]";
            __int16 v36 = 1024;
            int v37 = 5526;
            __int16 v38 = 2080;
            uint64_t v39 = (char *)v23;
            _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d SKECheckRemoteCert: peerCN = '%s'", buf, 0x26u);
          }
        }
        if (!v20) {
          goto LABEL_42;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v24 = VRTraceErrorLogLevelToCSTR();
          unint64_t v25 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v26 = objc_msgSend((id)objc_msgSend(v20, "description"), "UTF8String");
            *(_DWORD *)buf = 136315906;
            *(void *)&uint8_t buf[4] = v24;
            __int16 v34 = 2080;
            BOOL v35 = "-[VCCallSession(PrivateMethods) processSIPMessage:msgOut:optional:confIndex:]";
            __int16 v36 = 1024;
            int v37 = 5529;
            __int16 v38 = 2080;
            uint64_t v39 = (char *)v26;
            _os_log_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Common names: %s", buf, 0x26u);
          }
        }
        char v27 = [v20 containsObject:self->peerCN];
        CFRelease(v20);
        if ((v27 & 1) == 0)
        {
LABEL_42:
          if ((int)VRTraceGetErrorLogLevelForModule() > 6)
          {
            uint64_t v28 = VRTraceErrorLogLevelToCSTR();
            unint64_t v29 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              *(void *)&uint8_t buf[4] = v28;
              __int16 v34 = 2080;
              BOOL v35 = "-[VCCallSession(PrivateMethods) processSIPMessage:msgOut:optional:confIndex:]";
              __int16 v36 = 1024;
              int v37 = 5541;
              _os_log_impl(&dword_1E1EA4000, v29, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d SKECheckRemoteCert: specified peer common name not found...", buf, 0x1Cu);
            }
          }
          a5 = 0;
        }
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v30 = VRTraceErrorLogLevelToCSTR();
        unint64_t v31 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          *(void *)&uint8_t buf[4] = v30;
          __int16 v34 = 2080;
          BOOL v35 = "-[VCCallSession(PrivateMethods) processSIPMessage:msgOut:optional:confIndex:]";
          __int16 v36 = 1024;
          int v37 = 5545;
          __int16 v38 = 1024;
          LODWORD(v39) = a5 != 0;
          _os_log_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d SipCallbackNotification SKECheckRemoteCert valid == %d...", buf, 0x22u);
        }
      }
      if (a4) {
        *(_DWORD *)a4 = a5 != 0;
      }
    }
  }
  else if (!strcmp("SKEReportError", a3))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      __int16 v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = v13;
        __int16 v34 = 2080;
        BOOL v35 = "-[VCCallSession(PrivateMethods) processSIPMessage:msgOut:optional:confIndex:]";
        __int16 v36 = 1024;
        int v37 = 5551;
        _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d SipCallbackNotification SKEReportError...", buf, 0x1Cu);
      }
    }
    if (a5)
    {
      *(void *)buf = 0;
      +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", buf, 32018, (int)(objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", @"skeDetailCode"), "intValue") + 500), objc_msgSend(a5, "objectForKeyedSubscript:", @"filePath"), objc_msgSend(a5, "objectForKeyedSubscript:", @"description"), objc_msgSend(a5, "objectForKeyedSubscript:", @"reason"));
      global_queue = dispatch_get_global_queue(2, 0);
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __77__VCCallSession_PrivateMethods__processSIPMessage_msgOut_optional_confIndex___block_invoke;
      v32[3] = &unk_1E6DB3E40;
      v32[4] = self;
      v32[5] = *(void *)buf;
      dispatch_async(global_queue, v32);
    }
  }
}

uint64_t __77__VCCallSession_PrivateMethods__processSIPMessage_msgOut_optional_confIndex___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) disconnect:*(void *)(a1 + 40) didRemoteCancel:0];
}

- (void)lock
{
}

- (void)unlock
{
}

- (void)resetState
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315650;
      uint64_t v5 = v2;
      __int16 v6 = 2080;
      BOOL v7 = "-[VCCallSession(PrivateMethods) resetState]";
      __int16 v8 = 1024;
      int v9 = 5584;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d The call failed.", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

- (void)setupCalleeSIPStartTimeout:(float)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v6 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(float)(a3 * 1000000000.0));
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__VCCallSession_PrivateMethods__setupCalleeSIPStartTimeout___block_invoke;
  block[3] = &unk_1E6DB3F08;
  block[4] = v6;
  float v10 = a3;
  dispatch_after(v7, global_queue, block);
}

uint64_t __60__VCCallSession_PrivateMethods__setupCalleeSIPStartTimeout___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) strong];
  if (result)
  {
    uint64_t v3 = (void *)result;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      id v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v11 = v4;
        __int16 v12 = 2080;
        uint64_t v13 = "-[VCCallSession(PrivateMethods) setupCalleeSIPStartTimeout:]_block_invoke";
        __int16 v14 = 1024;
        int v15 = 5598;
        __int16 v16 = 1024;
        BOOL v17 = [v3 state] != 1;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d inviteeICEResultTimer:ready to go, %d", buf, 0x22u);
      }
    }
    [v3 lock];
    if ([v3 state] != 7 && objc_msgSend(v3, "state") != 1)
    {
      if ([v3 didSend200OK])
      {
        [v3 disconnectWithNoRemotePackets:212];
      }
      else
      {
        dispatch_time_t v6 = dispatch_time(0, (uint64_t)(float)(*(float *)(a1 + 40) * 1000000000.0));
        global_queue = dispatch_get_global_queue(0, 0);
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        void v8[2] = __60__VCCallSession_PrivateMethods__setupCalleeSIPStartTimeout___block_invoke_1319;
        v8[3] = &unk_1E6DB3F08;
        v8[4] = *(void *)(a1 + 32);
        int v9 = *(_DWORD *)(a1 + 40);
        dispatch_after(v6, global_queue, v8);
      }
    }
    return [v3 unlock];
  }
  return result;
}

void *__60__VCCallSession_PrivateMethods__setupCalleeSIPStartTimeout___block_invoke_1319(uint64_t a1)
{
  uint64_t result = (void *)[*(id *)(a1 + 32) strong];
  if (result)
  {
    uint64_t v3 = result;
    [result lock];
    if ([v3 state] != 7 && objc_msgSend(v3, "state") != 1) {
      [v3 disconnectWithNoRemotePackets:212 timeoutUsed:*(float *)(a1 + 40)];
    }
    return (void *)[v3 unlock];
  }
  return result;
}

- (void)addScreenConfigToSDP:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(SDPMediaLine);
  [(SDPMediaLine *)v5 setRtpId:[(VCCallSession *)self videoRTPID]];
  dispatch_time_t v6 = [+[VCVideoRuleCollectionsScreen sharedInstance] supportedPayloads];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v12 count:16];
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
        uint64_t v11 = [*(id *)(*((void *)&v13 + 1) + 8 * v10) intValue];
        +[SDPMini setPayload:v11 mediaLine:v5];
        [(SDPMediaLine *)v5 addWifiRules:[+[VCVideoRuleCollectionsScreen sharedInstance](VCVideoRuleCollectionsScreen, "sharedInstance") getVideoRulesForTransport:1 payload:v11 encodingType:1] cellularRules:[+[VCVideoRuleCollectionsScreen sharedInstance] getVideoRulesForTransport:2 payload:v11 encodingType:1] payload:v11 direction:0];
        [(SDPMediaLine *)v5 addWifiRules:[+[VCVideoRuleCollectionsScreen sharedInstance](VCVideoRuleCollectionsScreen, "sharedInstance") getVideoRulesForTransport:1 payload:v11 encodingType:2] cellularRules:[+[VCVideoRuleCollectionsScreen sharedInstance] getVideoRulesForTransport:2 payload:v11 encodingType:2] payload:v11 direction:1];
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v12 count:16];
    }
    while (v8);
  }
  [a3 addMediaLine:v5 mediaType:3];
}

- (BOOL)createSDP:(int *)a3 audioPayloadCount:(int)a4 secondaryPayloadTypes:(int *)a5 secondaryPayloadCount:(int)a6 videoPayloadTypes:(int *)a7 videoPayloadCount:(int)a8 localFeatureList:(id)a9 answerBandwidth:(int)a10 maxBandwidth:(int)a11 imageSizesSend:(imageTag *)a12 imageSendCount:(int *)a13 imageSizesRecv:(imageTag *)a14 imageRecvCount:(int *)a15 sdp:(char *)a16 numSDPBytes:(int *)a17 error:(id *)a18
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  BOOL v42 = [(VCCapabilities *)self->caps isVideoEnabled];
  uint64_t v23 = objc_alloc_init(SDPMini);
  uint64_t v24 = (void *)[[NSString alloc] initWithUTF8String:"GKVoiceChatService"];
  [(SDPMini *)v23 setOrigin:v24];

  [(SDPMini *)v23 setFeatureListDict:a9];
  -[SDPMini setAacBlockSize:](v23, "setAacBlockSize:", [NSNumber numberWithInt:self->aacBlockSize]);
  [(SDPMini *)v23 setAllowAudioRecording:self->allowAudioRecording];
  -[SDPMini setAudioRTPID:](v23, "setAudioRTPID:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[VCCallSession audioRTPID](self, "audioRTPID")));
  UInt32 v43 = 0;
  if ((AUIOGetAUNumber(&v43) & 0x80000000) == 0) {
    -[SDPMini setAudioUnitModel:](v23, "setAudioUnitModel:", [NSNumber numberWithUnsignedInt:v43]);
  }
  -[SDPMini setAnswerBandwidth:](v23, "setAnswerBandwidth:", [NSNumber numberWithInt:a10]);
  -[SDPMini setMaxBandwidth:](v23, "setMaxBandwidth:", [NSNumber numberWithInt:a11]);
  if (![(VCCallInfo *)self->remoteCallInfo sdp]
    || [(VCCallInfo *)self->remoteCallInfo supportsDynamicMaxBitrate])
  {
    [(SDPMini *)v23 setAllowsDynamicMaxBitrate:1];
    [(SDPMini *)v23 setAllowsContentsChangeWithAspectPreservation:1];
  }
  if (([(VCCallSession *)self deviceRole] == 2 || [(VCCallSession *)self deviceRole] == 4)
    && [(VCCallSession *)self basebandCodecSampleRate]
    && [(VCCallSession *)self basebandCodecType])
  {
    [(SDPMini *)v23 setBasebandCodecType:self->basebandCodecType sampleRate:self->basebandCodecSampleRate];
  }
  if (a4 >= 1)
  {
    uint64_t v25 = a4;
    do
    {
      uint64_t v26 = [(SDPMini *)v23 audioPayloads];
      -[NSMutableArray addObject:](v26, "addObject:", [NSNumber numberWithInt:*a3]);
      int v27 = *a3++;
      if ((v27 - 104) <= 2) {
        -[SDPMini setUseSbr:blockSize:forAACFormat:](v23, "setUseSbr:blockSize:forAACFormat:", self->useSBR, self->aacBlockSize);
      }
      --v25;
    }
    while (v25);
  }
  if (a5 && a6 && self->allowAudioSwitching && a6 >= 1)
  {
    uint64_t v28 = a6;
    do
    {
      unint64_t v29 = [(SDPMini *)v23 secondaryAudioPayloads];
      unsigned int v30 = *a5++;
      -[NSMutableArray addObject:](v29, "addObject:", [NSNumber numberWithInt:v30]);
      --v28;
    }
    while (v28);
  }
  unint64_t v31 = a16;
  BOOL v32 = v42;
  if (v42)
  {
    BOOL v39 = [(SDPMini *)v23 setVideoPayloads:a7 count:a8];
    id v33 = [(SDPMini *)v23 getMediaLineForType:2];
    objc_msgSend(v33, "setRtpId:", -[VCCallSession videoRTPID](self, "videoRTPID"));
    if (a7 && a8 >= 1)
    {
      unint64_t v34 = 0;
      do
      {
        [v33 createVideoImageAttr:a7[v34] direction:0 dimensions:a12[v34] count:a13[v34]];
        [v33 createVideoImageAttr:a7[v34] direction:1 dimensions:a14[v34] count:a15[v34]];
        ++v34;
      }
      while (v34 < a8);
    }
    if (self->isRTCPFBEnabled) {
      [(SDPMini *)v23 setVideoRTCPFB:1 useNACK:1];
    }
    BOOL v32 = v42;
    unint64_t v31 = a16;
    BOOL v35 = v39;
  }
  else
  {
    BOOL v35 = 0;
  }
  id v36 = [(SDPMini *)v23 toStringWithVideoEnabled:v32];
  if (v31
    && a17
    && ((int v37 = v36, !v32) || v35)
    && v23
    && v36
    && *a17 > (int)[v36 lengthOfBytesUsingEncoding:4])
  {
    strlcpy(v31, (const char *)[v37 UTF8String], *a17);
    *a17 = [v37 lengthOfBytesUsingEncoding:4] + 1;
    [(VCCallInfo *)self->localCallInfo setSdp:v23];

    return 1;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if (VRTraceIsOSFaultDisabled())
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCallSession(PrivateMethods) createSDP:audioPayloadCount:secondaryPayloadTypes:secondaryPayloadCount:videoPayloadTypes:videoPayloadCount:localFeatureList:answerBandwidth:maxBandwidth:imageSizesSend:imageSendCount:imageSizesRecv:imageRecvCount:sdp:numSDPBytes:error:]();
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        -[VCCallSession(PrivateMethods) createSDP:audioPayloadCount:secondaryPayloadTypes:secondaryPayloadCount:videoPayloadTypes:videoPayloadCount:localFeatureList:answerBandwidth:maxBandwidth:imageSizesSend:imageSendCount:imageSizesRecv:imageRecvCount:sdp:numSDPBytes:error:]();
      }
    }
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a18, 32002, 214, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 5757), @"Could not create session description", 0);

    return 0;
  }
}

- (void)negotiateMediaMaxBandwidth
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  [(VCBitrateArbiter *)self->callSessionBitrateArbiter updateNegotiatedSettings:[(VCMediaNegotiatorBase *)self->_mediaNegotiator negotiatedSettings]];
  uint64_t v3 = (const void *)VCConnectionManager_CopyConnectionForQuality((uint64_t)self->connectionManager, 1);
  uint64_t v4 = VCBitrateArbiter_ModeFromOperatingMode(self->operatingMode);
  unsigned int v5 = [(VCBitrateArbiter *)self->callSessionBitrateArbiter maxAllowedBitrateForVCConnection:v3 forLocalInterface:1 arbiterMode:v4 encodeRule:self->_currentEncodeRule];
  uint64_t v6 = [(VCBitrateArbiter *)self->callSessionBitrateArbiter maxAllowedBitrateForVCConnection:v3 forLocalInterface:0 arbiterMode:v4 encodeRule:self->_currentEncodeRule];
  if (v3) {
    CFRelease(v3);
  }
  [(VCCallInfo *)self->remoteCallInfo setMaxBandwidth:v6];
  uint64_t v7 = (const void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self->connectionManager);
  if (VCConnection_IsRemoteOnCellular((uint64_t)v7)) {
    [(VCCallInfo *)self->remoteCallInfo setCellBandwidth:v6];
  }
  if (v7) {
    CFRelease(v7);
  }
  if (v5 >= v6) {
    unsigned int v8 = v6;
  }
  else {
    unsigned int v8 = v5;
  }
  if (self->operatingMode == 4) {
    unsigned int carrierBitrateCap = [(VCBitrateArbiter *)self->callSessionBitrateArbiter maxAllowedScreenShareCellularBitrate];
  }
  else {
    unsigned int carrierBitrateCap = self->carrierBitrateCap;
  }
  if ([(VCCallSession *)self treatAsCellular] && v8 > carrierBitrateCap) {
    unsigned int v10 = carrierBitrateCap;
  }
  else {
    unsigned int v10 = v8;
  }
  self->unsigned int callSessionBitrate = v10;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    __int16 v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136316418;
      uint64_t v16 = v11;
      __int16 v17 = 2080;
      uint64_t v18 = "-[VCCallSession(PrivateMethods) negotiateMediaMaxBandwidth]";
      __int16 v19 = 1024;
      int v20 = 6063;
      __int16 v21 = 1024;
      unsigned int v22 = v5;
      __int16 v23 = 1024;
      int v24 = v6;
      __int16 v25 = 1024;
      unsigned int v26 = v10;
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d localMaxBandwidth: %u remoteMaxBandwidth: %u answerBandwidth: %u", (uint8_t *)&v15, 0x2Eu);
    }
  }
  int operatingMode = self->operatingMode;
  if (operatingMode == 7 || operatingMode == 2)
  {
    uint64_t v14 = [(VCCallSession *)self currentAudioCap];
    AFRCSetTxCap((uint64_t)self->hAFRC, v14);
    [(AVCRateController *)self->_rateController setTargetBitrateCap:v14];
  }
}

- (void)applyNegotiatedSettings
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(VCMediaNegotiatorBase *)self->_mediaNegotiator negotiatedSettings];
  [(VCCallInfo *)self->remoteCallInfo setSupportsDynamicMaxBitrate:[(VCMediaNegotiatorResults *)v3 supportsDynamicMaxBitrate]];
  [(VCCallSession *)self negotiateMediaMaxBandwidth];
  if ([(VCCallSession *)self deviceRole] == 1)
  {
    if ([(VCMediaNegotiatorResults *)v3 remoteBasebandCodec])
    {
      [(VCCallSession *)self setBasebandCodecType:[(VCMediaNegotiatorResults *)v3 remoteBasebandCodec]];
      -[VCCallSession setBasebandCodecSampleRate:](self, "setBasebandCodecSampleRate:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[VCMediaNegotiatorResults remoteBasebandCodecSampleRate](v3, "remoteBasebandCodecSampleRate")));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v4 = VRTraceErrorLogLevelToCSTR();
        unsigned int v5 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 136316162;
          uint64_t v10 = v4;
          __int16 v11 = 2080;
          __int16 v12 = "-[VCCallSession(PrivateMethods) applyNegotiatedSettings]";
          __int16 v13 = 1024;
          int v14 = 6082;
          __int16 v15 = 2080;
          uint64_t v16 = [(NSString *)[(VCMediaNegotiatorResults *)v3 remoteBasebandCodec] UTF8String];
          __int16 v17 = 1024;
          unsigned int v18 = [(VCMediaNegotiatorResults *)v3 remoteBasebandCodecSampleRate];
          _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Baseband codec information form negotiated settings: basebandCodecType:%s, sampleRate:%u", (uint8_t *)&v9, 0x2Cu);
        }
      }
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = [(VCMediaNegotiatorResults *)v3 mediaControlInfoVersion];
      int v9 = 136315906;
      uint64_t v10 = v6;
      __int16 v11 = 2080;
      __int16 v12 = "-[VCCallSession(PrivateMethods) applyNegotiatedSettings]";
      __int16 v13 = 1024;
      int v14 = 6084;
      __int16 v15 = 1024;
      LODWORD(v16) = v8;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d mediaControlInfoVersion = %d", (uint8_t *)&v9, 0x22u);
    }
  }
  [(VCCallInfo *)self->remoteCallInfo setUserAgent:[(VCMediaNegotiatorResults *)v3 remoteUserAgent]];
}

+ (int)setRxPayloadList:(tagHANDLE *)a3 withPayloadTypes:(id)a4
{
  return +[VCCallSession setRxPayloadList:a3 withPayloadTypes:a4 isRedEnabled:0];
}

+ (int)setRxPayloadList:(tagHANDLE *)a3 withPayloadTypes:(id)a4 isRedEnabled:(BOOL)a5
{
  unsigned int v8 = [a4 count] + a5;
  int v9 = malloc_type_calloc(v8, 4uLL, 0x100004052888210uLL);
  if (v9)
  {
    uint64_t v10 = v9;
    if ([a4 count])
    {
      uint64_t v11 = 0;
      unsigned int v12 = 1;
      do
      {
        v10[v11] = objc_msgSend((id)objc_msgSend(a4, "objectAtIndexedSubscript:", v11), "intValue");
        uint64_t v11 = v12;
      }
      while ([a4 count] > (unint64_t)v12++);
    }
    if (a5) {
      v10[[a4 count]] = 20;
    }
    int v14 = RTPSetRxPayloadList((uint64_t)a3, v8, v10);
    free(v10);
    return v14;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCCallSession(PrivateMethods) setRxPayloadList:withPayloadTypes:isRedEnabled:]();
      }
    }
    return -2147418109;
  }
}

- (BOOL)applyNegotiatedAudioSettings:(id *)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if (![(VCMediaNegotiator *)self->_mediaNegotiator usePreNegotiation])
  {
    LOBYTE(v14) = 1;
    return v14;
  }
  unsigned int v5 = [(VCMediaNegotiatorBase *)self->_mediaNegotiator negotiatedAudioSettings];
  [(VCCallInfo *)self->remoteCallInfo setAuNumber:[(VCMediaNegotiatorResultsAudio *)v5 audioUnitModel]];
  self->allowAudioSwitching = [(VCMediaNegotiatorResultsAudio *)v5 allowSwitching];
  self->allowAudioRecording = [(VCMediaNegotiatorResultsAudio *)v5 allowRecording];
  self->useSBR = [(VCMediaNegotiatorResultsAudio *)v5 useSBR];
  self->_isUseCaseWatchContinuitdouble y = +[VCPayloadUtils isUseCaseWatchContinuity:self->_deviceRole primaryPayload:[(VCMediaNegotiatorResultsAudio *)v5 primaryPayload]];
  if ([(VCMediaNegotiatorResultsAudio *)v5 dtxPayload] != 128)
  {
    int operatingMode = self->operatingMode;
    if (operatingMode == 7 || operatingMode == 2)
    {
      self->currentDTXPayload = (VCAudioPayload *)[(VCCallSession *)self addAudioPayload:[(VCMediaNegotiatorResultsAudio *)v5 dtxPayload]];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        unsigned int v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v9 = [(VCAudioPayloadConfig *)[(VCAudioPayload *)self->currentDTXPayload config] payload];
          *(_DWORD *)buf = 136315906;
          uint64_t v44 = v7;
          __int16 v45 = 2080;
          unsigned int v46 = "-[VCCallSession(PrivateMethods) applyNegotiatedAudioSettings:]";
          __int16 v47 = 1024;
          int v48 = 6130;
          __int16 v49 = 1024;
          int v50 = v9;
          _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Silence Suppression using DTX payload[%d] enabled", buf, 0x22u);
        }
      }
    }
  }
  self->_int currentRedPayloadType = [(VCMediaNegotiatorResultsAudio *)v5 redPayload];
  self->_BOOL isRedEnabled = [(VCMediaNegotiatorResultsAudio *)v5 redPayload] == 20;
  BOOL v10 = [+[VCDefaults sharedInstance] disableRed];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v10)
  {
    if (ErrorLogLevelForModule >= 5)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      __int16 v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v44 = v12;
        __int16 v45 = 2080;
        unsigned int v46 = "-[VCCallSession(PrivateMethods) applyNegotiatedAudioSettings:]";
        __int16 v47 = 1024;
        int v48 = 6137;
        _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Forcing Red to be disabled", buf, 0x1Cu);
      }
    }
    self->_BOOL isRedEnabled = 0;
  }
  else if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    uint64_t v16 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int currentRedPayloadType = self->_currentRedPayloadType;
      BOOL isRedEnabled = self->_isRedEnabled;
      *(_DWORD *)buf = 136316162;
      uint64_t v44 = v15;
      __int16 v45 = 2080;
      unsigned int v46 = "-[VCCallSession(PrivateMethods) applyNegotiatedAudioSettings:]";
      __int16 v47 = 1024;
      int v48 = 6140;
      __int16 v49 = 1024;
      int v50 = currentRedPayloadType;
      __int16 v51 = 1024;
      BOOL v52 = isRedEnabled;
      _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Apply negotiated redPayload settings. RedPayloadType:%d, isRedEnabled:%d", buf, 0x28u);
    }
  }
  if (![(VCCallSession *)self setupAudioCodecWithPayload:[(VCMediaNegotiatorResultsAudio *)v5 primaryPayload]])
  {
    reportingSymptom();
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v14)
      {
        unint64_t v29 = 0;
        goto LABEL_31;
      }
      -[VCCallSession(PrivateMethods) applyNegotiatedAudioSettings:].cold.4();
    }
    unint64_t v29 = 0;
    goto LABEL_52;
  }
  [(VCCapabilities *)self->caps setActualAudioCodec:[(VCAudioPayloadConfig *)[(VCAudioPayload *)self->currentAudioPayload config] payload]];
  if (self->allowAudioSwitching)
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v19 = [(VCMediaNegotiatorResultsAudio *)v5 secondaryPayloads];
    uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v39 objects:v38 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v40 != v22) {
            objc_enumerationMutation(v19);
          }
          -[VCCallSession addAudioPayload:](self, "addAudioPayload:", [*(id *)(*((void *)&v39 + 1) + 8 * i) unsignedIntValue]);
        }
        uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v39 objects:v38 count:16];
      }
      while (v21);
    }
  }
  unint64_t v24 = RTPSetRemoteSSRC((uint64_t)self->rtpHandle, [(VCMediaNegotiatorResultsAudio *)v5 remoteSSRC]);
  if ((v24 & 0x80000000) != 0)
  {
    unint64_t v29 = v24;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v14) {
        goto LABEL_31;
      }
      -[VCCallSession(PrivateMethods) applyNegotiatedAudioSettings:]();
    }
    goto LABEL_52;
  }
  id v25 = [(VCCallSession *)self negotiatedAudioPayloadTypes];
  unint64_t v26 = +[VCCallSession setRxPayloadList:self->rtpHandle withPayloadTypes:v25 isRedEnabled:self->_isRedEnabled];
  if ((v26 & 0x80000000) != 0
    || (RTPSetCellularUniqueTag((uint64_t)self->rtpHandle, [(VCTransportSession *)self->_transportSession basebandNotificationRegistrationToken]), (v26 & 0x80000000) != 0))
  {
    unint64_t v29 = v26;
    goto LABEL_52;
  }
  unint64_t v37 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v27 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v27 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v36[0] = v27;
  v36[1] = v27;
  v34[0] = v27;
  v34[1] = v27;
  unint64_t v35 = 0xAAAAAAAAAAAAAAAALL;
  v32[0] = v27;
  v32[1] = v27;
  unint64_t v33 = 0xAAAAAAAAAAAAAAAALL;
  MakeIPPORT();
  MakeIPPORT();
  int v31 = -1431655766;
  RTPCreateSockets((uint64_t)self->rtpHandle, (uint64_t)v36, (int *)v34, &v31, (int *)v32);
  unint64_t v29 = v28;
  if ((v28 & 0x80000000) != 0)
  {
LABEL_52:
    LOBYTE(v14) = 0;
    goto LABEL_31;
  }
  LOBYTE(v14) = [(VCCallSession *)self setRTPPayloads:v25 withError:a3];
LABEL_31:
  if (a3 && !v14)
  {
    if (!*a3) {
      +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a3, 32027, 200, (int)v29, 0, @"Failed to apply audio settings", objc_msgSend(NSString, "stringWithFormat:", @"Error: %x.", v29));
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 2) {
      goto LABEL_41;
    }
    VRTraceErrorLogLevelToCSTR();
    if (VRTraceIsOSFaultDisabled())
    {
      BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (v14)
      {
        -[VCCallSession(PrivateMethods) applyNegotiatedAudioSettings:]();
LABEL_41:
        LOBYTE(v14) = 0;
      }
    }
    else
    {
      BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT);
      if (v14)
      {
        -[VCCallSession(PrivateMethods) applyNegotiatedAudioSettings:]();
        goto LABEL_41;
      }
    }
  }
  return v14;
}

- (BOOL)applyNegotiatedVideoSettings:(id *)a3
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  if (![(VCMediaNegotiator *)self->_mediaNegotiator usePreNegotiation]
    || [(VCCapabilities *)self->caps isDuplexAudioOnly]
    || ![(VCCapabilities *)self->caps isVideoEnabled])
  {
    LOBYTE(v7) = 1;
    return v7;
  }
  mediaNegotiator = self->_mediaNegotiator;
  if (self->operatingMode == 4) {
    uint64_t v6 = [(VCMediaNegotiatorBase *)mediaNegotiator negotiatedScreenSettings];
  }
  else {
    uint64_t v6 = [(VCMediaNegotiatorBase *)mediaNegotiator negotiatedVideoSettings];
  }
  unsigned int v8 = v6;
  if (![(VCMediaNegotiatorResultsVideo *)v6 isSupported])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      uint64_t v48 = 16;
      LODWORD(v7) = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v7) {
        goto LABEL_63;
      }
      -[VCCallSession(PrivateMethods) applyNegotiatedVideoSettings:].cold.4();
    }
    LOBYTE(v7) = 0;
    uint64_t v48 = 16;
    goto LABEL_63;
  }
  int IsInterfaceOnCellularForActiveConnectionWithQuality = VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality((uint64_t)self->connectionManager, 1, 1);
  if (IsInterfaceOnCellularForActiveConnectionWithQuality | VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality((uint64_t)self->connectionManager, 1, 0))unsigned __int8 v10 = 2; {
  else
  }
    unsigned __int8 v10 = 1;
  uint64_t v54 = self;
  long long v55 = v8;
  if ([+[VCDefaults sharedInstance] forceHWI])
  {
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithInt:", -[VCDefaults forceVideoPayload](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceVideoPayload"));
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithInt:", -[VCDefaults forceRecvVideoPayload](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceRecvVideoPayload"));
    [(VCMediaNegotiatorResultsVideo *)v8 setFeatureStrings:+[VCVideoFeatureListStringHelper newLocalFeaturesStringWithType:1]];
  }
  else
  {
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    obuint64_t j = [(VCVideoRuleCollections *)[(VCMediaNegotiatorResultsVideo *)v8 videoRuleCollections] supportedPayloads];
    uint64_t v13 = [(NSMutableArray *)obj countByEnumeratingWithState:&v76 objects:v75 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      uint64_t v15 = *(void *)v77;
      uint64_t v16 = v10;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v77 != v15) {
            objc_enumerationMutation(obj);
          }
          unsigned int v18 = *(void **)(*((void *)&v76 + 1) + 8 * i);
          if (-[VCVideoRuleCollections getVideoRulesForTransport:payload:encodingType:](-[VCMediaNegotiatorResultsVideo videoRuleCollections](v8, "videoRuleCollections"), "getVideoRulesForTransport:payload:encodingType:", v16, [v18 unsignedIntValue], 1))
          {
            uint64_t v11 = (uint64_t)v18;
          }
          if (-[VCVideoRuleCollections getVideoRulesForTransport:payload:encodingType:](-[VCMediaNegotiatorResultsVideo videoRuleCollections](v8, "videoRuleCollections"), "getVideoRulesForTransport:payload:encodingType:", v16, [v18 unsignedIntValue], 2))
          {
            uint64_t v12 = (uint64_t)v18;
          }
        }
        uint64_t v14 = [(NSMutableArray *)obj countByEnumeratingWithState:&v76 objects:v75 count:16];
      }
      while (v14);
    }
    else
    {
      uint64_t v11 = 0;
      uint64_t v12 = 0;
    }
  }
  if (v12) {
    BOOL v19 = 1;
  }
  else {
    BOOL v19 = v11 == 0;
  }
  if (v19) {
    uint64_t v20 = v12;
  }
  else {
    uint64_t v20 = v11;
  }
  if (v11 == 0 && v20 != 0) {
    uint64_t v21 = (void *)v20;
  }
  else {
    uint64_t v21 = (void *)v11;
  }
  __int16 v51 = v21;
  if (v21) {
    BOOL v22 = v20 == 0;
  }
  else {
    BOOL v22 = 1;
  }
  if (v22)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      LODWORD(v7) = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v7)
      {
LABEL_84:
        uint64_t v48 = 32;
        goto LABEL_63;
      }
      -[VCCallSession(PrivateMethods) applyNegotiatedVideoSettings:]();
    }
    LOBYTE(v7) = 0;
    goto LABEL_84;
  }
  __int16 v23 = v54;
  int operatingMode = v54->operatingMode;
  id v25 = [(VCMediaNegotiatorBase *)v54->_mediaNegotiator localSettings];
  if (operatingMode == 4) {
    uint64_t v26 = 3;
  }
  else {
    uint64_t v26 = 2;
  }
  id v27 = [(VCMediaNegotiatorLocalConfiguration *)v25 mediaConfigurationForMediaType:v26];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  unint64_t v28 = v8;
  obja = [(VCVideoRuleCollections *)[(VCMediaNegotiatorResultsVideo *)v8 videoRuleCollections] supportedPayloads];
  uint64_t v29 = [(NSMutableArray *)obja countByEnumeratingWithState:&v71 objects:v70 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v72;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v72 != v31) {
          objc_enumerationMutation(obja);
        }
        uint64_t v33 = *(void *)(*((void *)&v71 + 1) + 8 * j);
        uint64_t v34 = [(NSDictionary *)[(VCMediaNegotiatorResultsVideo *)v28 featureStrings] objectForKeyedSubscript:v33];
        uint64_t v35 = objc_msgSend((id)objc_msgSend(v27, "videoFeatureStrings"), "objectForKeyedSubscript:", v33);
        id v36 = +[VCMediaNegotiator negotiatedFeaturesStringWithLocalFeaturesString:v35 remoteFeaturesString:v34];
        v68[0] = @"matchedFeatureListString";
        v68[1] = @"localFeatureListString";
        v68[2] = @"remoteFeatureListString";
        v69[0] = v36;
        v69[1] = v35;
        v69[2] = v34;
        unint64_t v28 = v55;
        __int16 v23 = v54;
        -[NSMutableDictionary setObject:forKeyedSubscript:](v54->featureListStringDict, "setObject:forKeyedSubscript:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:v68 count:3], v33);
      }
      uint64_t v30 = [(NSMutableArray *)obja countByEnumeratingWithState:&v71 objects:v70 count:16];
    }
    while (v30);
  }
  v23->int64_t videoPayload = [v51 integerValue];
  -[VCCapabilities setActualVideoCodec:](v23->caps, "setActualVideoCodec:", [v51 unsignedIntValue]);
  uint64_t v37 = RTPSetRemoteSSRC((uint64_t)v23->rtpVideo, [(VCMediaNegotiatorResultsVideo *)v28 remoteSSRC]);
  if ((v37 & 0x80000000) != 0) {
    goto LABEL_74;
  }
  int v38 = [(NSMutableArray *)[(VCVideoRuleCollections *)[(VCMediaNegotiatorResultsVideo *)v28 videoRuleCollections] supportedPayloads] count];
  long long v39 = (char *)malloc_type_calloc(v38, 4uLL, 0x100004052888210uLL);
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v40 = [(VCVideoRuleCollections *)[(VCMediaNegotiatorResultsVideo *)v28 videoRuleCollections] supportedPayloads];
  uint64_t v41 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v64 objects:v63 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    int v43 = 0;
    uint64_t v44 = *(void *)v65;
    do
    {
      uint64_t v45 = 0;
      int v46 = v43;
      __int16 v47 = &v39[4 * v43];
      do
      {
        if (*(void *)v65 != v44) {
          objc_enumerationMutation(v40);
        }
        *(_DWORD *)&v47[4 * v45] = [*(id *)(*((void *)&v64 + 1) + 8 * v45) unsignedIntValue];
        ++v45;
      }
      while (v42 != v45);
      uint64_t v42 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v64 objects:v63 count:16];
      int v43 = v46 + v45;
    }
    while (v42);
  }
  uint64_t v48 = RTPSetRxPayloadList((uint64_t)v23->rtpVideo, v38, v39);
  free(v39);
  if ((v48 & 0x80000000) != 0) {
    goto LABEL_75;
  }
  uint64_t v37 = RTPSetRTCPFB((uint64_t)v23->rtpVideo, [(VCMediaNegotiatorResultsVideo *)v55 isRTCPFBEnabled]);
  if ((v37 & 0x80000000) != 0
    || (uint64_t v37 = -[VCCallSession applyFeatureListStringForPayload:](v23, "applyFeatureListStringForPayload:", [v51 unsignedIntValue]), (v37 & 0x80000000) != 0))
  {
LABEL_74:
    uint64_t v48 = v37;
LABEL_75:
    LOBYTE(v7) = 0;
    goto LABEL_63;
  }
  [(VCCapabilities *)v23->caps setActualVideoCodec:LODWORD(v23->videoPayload)];
  unint64_t v62 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v49 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v49 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v61[0] = v49;
  v61[1] = v49;
  v59[0] = v49;
  v59[1] = v49;
  unint64_t v60 = 0xAAAAAAAAAAAAAAAALL;
  v57[0] = v49;
  v57[1] = v49;
  unint64_t v58 = 0xAAAAAAAAAAAAAAAALL;
  MakeIPPORT();
  MakeIPPORT();
  int v56 = -1431655766;
  RTPCreateSockets((uint64_t)v23->rtpVideo, (uint64_t)v61, (int *)v59, &v56, (int *)v57);
  uint64_t v48 = v7;
  LOBYTE(v7) = (int)v7 >= 0;
LABEL_63:
  if (a3 && !v7)
  {
    if (!*a3) {
      +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a3, 32028, 200, (int)v48, 0, @"Failed to apply video settings", objc_msgSend(NSString, "stringWithFormat:", @"Error: %x.", v48));
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if (VRTraceIsOSFaultDisabled())
      {
        LODWORD(v7) = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v7) {
          return v7;
        }
        -[VCCallSession(PrivateMethods) applyNegotiatedVideoSettings:]();
      }
      else
      {
        LODWORD(v7) = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT);
        if (!v7) {
          return v7;
        }
        -[VCCallSession(PrivateMethods) applyNegotiatedVideoSettings:]();
      }
    }
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)applyNegotiatedCaptionsSettings
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(VCMediaNegotiator *)self->_mediaNegotiator negotiatedCaptionsSettings];
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      return;
    }
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    unsigned __int8 v10 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v13 = 136315650;
    uint64_t v14 = v9;
    __int16 v15 = 2080;
    uint64_t v16 = "-[VCCallSession(PrivateMethods) applyNegotiatedCaptionsSettings]";
    __int16 v17 = 1024;
    int v18 = 6300;
    uint64_t v11 = "VCCallSession [%s] %s:%d No pre-negotiated captions settings.";
LABEL_12:
    _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v13, 0x1Cu);
    return;
  }
  uint64_t v4 = v3;
  if (![(VCCallSession *)self captionsDelegate])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      return;
    }
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    unsigned __int8 v10 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v13 = 136315650;
    uint64_t v14 = v12;
    __int16 v15 = 2080;
    uint64_t v16 = "-[VCCallSession(PrivateMethods) applyNegotiatedCaptionsSettings]";
    __int16 v17 = 1024;
    int v18 = 6307;
    uint64_t v11 = "VCCallSession [%s] %s:%d Captions delegate callback not set";
    goto LABEL_12;
  }
  unsigned int v5 = [(VCCallSession *)self captionsDelegate];
  uint64_t v6 = [(VCMediaNegotiatorResultsCaptions *)v4 localLanguages];
  uint64_t v7 = [(VCMediaNegotiatorResultsCaptions *)v4 remoteLanguages];
  uint64_t v8 = [(VCMediaNegotiatorResultsCaptions *)v4 remoteCanDisplayCaptions];

  [(VCAudioCaptionsDelegate *)v5 didUpdateCaptionsLocalLanguages:v6 remoteLanguages:v7 remoteCanDisplay:v8];
}

- (void)applyNegotiatedMediaRecorderSettings
{
  uint64_t v3 = [(VCMediaNegotiatorBase *)self->_mediaNegotiator negotiatedMediaRecorderSettings];
  delegate = self->delegate;
  uint64_t v5 = [(VCMediaNegotiatorResultsMediaRecorder *)v3 capabilities];
  uint64_t v6 = [(VCMediaNegotiatorResultsMediaRecorder *)v3 imageType];
  uint64_t v7 = [(VCMediaNegotiatorResultsMediaRecorder *)v3 videoCodec];

  [(VCCallSessionDelegate *)delegate session:self setMomentsCapabilities:v5 imageType:v6 videoCodec:v7];
}

- (BOOL)startMediaWithPreNegotiatedSettings:(id *)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v47 = v5;
      __int16 v48 = 2080;
      long long v49 = "-[VCCallSession(PrivateMethods) startMediaWithPreNegotiatedSettings:]";
      __int16 v50 = 1024;
      int v51 = 6318;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d ", buf, 0x1Cu);
    }
  }
  uint64_t v41 = 0;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 0;
  BOOL v7 = [(VCCallSession *)self createRTPHandles:a3];
  *((unsigned char *)v42 + 24) = v7;
  if (v7)
  {
    BOOL v8 = [(VCCallSession *)self prepareSRTPWithError:a3];
    *((unsigned char *)v42 + 24) = v8;
    if (v8)
    {
      BOOL v9 = [(VCCallSession *)self createMediaQueueHandle:a3];
      *((unsigned char *)v42 + 24) = v9;
      if (v9)
      {
        [(VCCallSession *)self applyNegotiatedSettings];
        BOOL v10 = [(VCCallSession *)self applyNegotiatedAudioSettings:a3];
        *((unsigned char *)v42 + 24) = v10;
        if (!v10) {
          goto LABEL_109;
        }
        BOOL v11 = [(VCCallSession *)self applyNegotiatedVideoSettings:a3];
        *((unsigned char *)v42 + 24) = v11;
        if (!v11) {
          goto LABEL_109;
        }
        [(VCCallSession *)self applyNegotiatedCaptionsSettings];
        [(VCCallSession *)self applyNegotiatedMediaRecorderSettings];
        if (![(VCCallSession *)self setMediaQueueStreamSettings]
          && (int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCCallSession(PrivateMethods) startMediaWithPreNegotiatedSettings:].cold.8();
          }
        }
        BOOL v12 = 0;
        unsigned int deviceRole = self->_deviceRole;
        if (deviceRole <= 5 && ((1 << deviceRole) & 0x29) != 0) {
          BOOL v12 = [(VCTransportSession *)self->_transportSession isHandoverSupported];
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v14 = VRTraceErrorLogLevelToCSTR();
          __int16 v15 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v16 = "NOT ";
            uint64_t v47 = v14;
            *(_DWORD *)buf = 136315906;
            long long v49 = "-[VCCallSession(PrivateMethods) startMediaWithPreNegotiatedSettings:]";
            __int16 v48 = 2080;
            if (v12) {
              uint64_t v16 = "";
            }
            __int16 v50 = 1024;
            int v51 = 6348;
            __int16 v52 = 2080;
            uint64_t v53 = v16;
            _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d HandoverReport: handover is %ssupported.", buf, 0x26u);
          }
        }
        [(VCConnectionManager *)self->connectionManager setSupportDuplication:v12];
        [(VCConnectionManager *)self->connectionManager resetConnectionStatTimers];
        if (self->useRateControl)
        {
          BOOL v17 = [(VCCallSession *)self startRateControl:a3];
          *((unsigned char *)v42 + 24) = v17;
          if (!v17)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                -[VCCallSession(PrivateMethods) startMediaWithPreNegotiatedSettings:].cold.7();
              }
            }
            goto LABEL_109;
          }
          hAFRC = self->hAFRC;
          if (hAFRC != (tagHANDLE *)0xFFFFFFFFLL) {
            AFRCSetAudioPayload((uint64_t)hAFRC, [(VCAudioPayloadConfig *)[(VCAudioPayload *)self->currentAudioPayload config] payload], [(VCAudioPayload *)self->currentAudioPayload bitrate]);
          }
          if (VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality((uint64_t)self->connectionManager, 1, 1))[(VCCallSession *)self setupWCMClient]; {
          unsigned int operatingMode = self->operatingMode;
          }
          if (operatingMode <= 7
            && ((1 << operatingMode) & 0x96) != 0
            && self->iRATSuggestionEnabled
            && self->_deviceRole != 4)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v20 = VRTraceErrorLogLevelToCSTR();
              uint64_t v21 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                uint64_t v47 = v20;
                __int16 v48 = 2080;
                long long v49 = "-[VCCallSession(PrivateMethods) startMediaWithPreNegotiatedSettings:]";
                __int16 v50 = 1024;
                int v51 = 6370;
                _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d HandoverReport: iRAT recommendation is enabled.", buf, 0x1Cu);
              }
            }
            wrmInfo = self->wrmInfo;
            if (wrmInfo) {
              WRMInitialize((uint64_t)wrmInfo, (uint64_t)self->rtpHandle);
            }
            [(VCCallSession *)self setupWRMClient];
            unsigned int operatingMode = self->operatingMode;
          }
          if (operatingMode == 7 || operatingMode == 2) {
            AFRCSetTxCap((uint64_t)self->hAFRC, [(VCCallSession *)self currentAudioCap]);
          }
        }
        BOOL v23 = [(VCCallSession *)self createAudioTransmitter:a3];
        *((unsigned char *)v42 + 24) = v23;
        if (v23)
        {
          [(VCAudioTransmitter *)self->audioTransmitter setCellTech:self->_isLocalCellular_LowestConnectionQuality remoteCellular:self->_isRemoteCellular_LowestConnectionQuality isIPV6:self->_isConnectedOnIPv6_LowestConnectionQuality audioCap:[(VCCallSession *)self currentAudioCap]];
          VCAudioReceiver_UpdateCellTech((uint64_t)self->audioReceiver, [(VCConnectionManager *)self->connectionManager getCellularTechForActiveConnectionWithQuality:1 forLocalInterface:1], [(VCConnectionManager *)self->connectionManager getCellularTechForActiveConnectionWithQuality:1 forLocalInterface:0]);
          int v25 = VCAudioReceiver_Start(&self->audioReceiver->var0.var0, v24);
          *((unsigned char *)v42 + 24) = v25;
          if (!v25)
          {
            uint64_t v32 = 4;
            goto LABEL_110;
          }
          self->int64_t state = 1;
          if ([(VCCallInfo *)self->remoteCallInfo usesInitialFECImplementation]) {
            int v26 = 1;
          }
          else {
            int v26 = 2;
          }
          self->fecMode = v26;
          BOOL v27 = [(VCCallSession *)self startMediaQueue:a3];
          *((unsigned char *)v42 + 24) = v27;
          if (v27)
          {
            if (![(VCCapabilities *)self->caps isKeyExchangeEnabled]
              && ![(VCCapabilities *)self->caps isDTLSEnabled])
            {
              [(TimingCollection *)self->perfTimers removeTimingForKey:3];
              uint64_t v32 = 0;
              goto LABEL_74;
            }
            cf[0] = 0;
            [(TimingCollection *)self->perfTimers stopTimingForKey:3];
            if ([(VCCapabilities *)self->caps isDTLSEnabled])
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                uint64_t v28 = VRTraceErrorLogLevelToCSTR();
                uint64_t v29 = *MEMORY[0x1E4F47A50];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315650;
                  uint64_t v47 = v28;
                  __int16 v48 = 2080;
                  long long v49 = "-[VCCallSession(PrivateMethods) startMediaWithPreNegotiatedSettings:]";
                  __int16 v50 = 1024;
                  int v51 = 6429;
                  _os_log_impl(&dword_1E1EA4000, v29, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d ---- check use dtls-srtp key", buf, 0x1Cu);
                }
              }
              if (self->srtpKeyBytes)
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                {
                  uint64_t v30 = VRTraceErrorLogLevelToCSTR();
                  uint64_t v31 = *MEMORY[0x1E4F47A50];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315650;
                    uint64_t v47 = v30;
                    __int16 v48 = 2080;
                    long long v49 = "-[VCCallSession(PrivateMethods) startMediaWithPreNegotiatedSettings:]";
                    __int16 v50 = 1024;
                    int v51 = 6431;
                    _os_log_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d ---- keyex use dtls-srtp key", buf, 0x1Cu);
                  }
                }
                uint64_t v32 = 0;
                cf[0] = CFRetain(self->srtpKeyBytes);
                if (!cf[0]) {
                  goto LABEL_74;
                }
LABEL_73:
                *(_DWORD *)buf = 1;
                uint64_t v32 = [(VCCallSession *)self setupEncryptionWithKey:cf confIndex:buf];
                CFRelease(cf[0]);
                if ((v32 & 0x80000000) == 0) {
                  goto LABEL_74;
                }
LABEL_110:
                if (!a3) {
                  goto LABEL_82;
                }
                goto LABEL_111;
              }
            }
            else
            {
              if (![(VCCallSession *)self isSKEOptimizationEnabled])
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                {
                  uint64_t v34 = VRTraceErrorLogLevelToCSTR();
                  uint64_t v35 = *MEMORY[0x1E4F47A50];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315650;
                    uint64_t v47 = v34;
                    __int16 v48 = 2080;
                    long long v49 = "-[VCCallSession(PrivateMethods) startMediaWithPreNegotiatedSettings:]";
                    __int16 v50 = 1024;
                    int v51 = 6418;
                    _os_log_impl(&dword_1E1EA4000, v35, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d ---- keyex initiate exchange", buf, 0x1Cu);
                  }
                }
                [(TimingCollection *)self->perfTimers startTimingForKey:4];
                uint64_t v36 = SIPKeyExchange((uint64_t *)&self->hSIP, [(VCCallInfo *)self->localCallInfo callID], 0, cf, 0);
                [(TimingCollection *)self->perfTimers stopTimingForKey:4];
                uint64_t v32 = 2148139061;
                if (v36 != -2146828235)
                {
                  uint64_t v32 = v36;
                  goto LABEL_110;
                }
LABEL_72:
                if (cf[0]) {
                  goto LABEL_73;
                }
LABEL_74:
                [(TimingCollection *)self->perfTimers startTimingForKey:5];
                v40[0] = MEMORY[0x1E4F143A8];
                v40[1] = 3221225472;
                v40[2] = __69__VCCallSession_PrivateMethods__startMediaWithPreNegotiatedSettings___block_invoke;
                v40[3] = &unk_1E6DB5838;
                v40[4] = self;
                -[VCCallSession startAudioWithCompletionHandler:](self, "startAudioWithCompletionHandler:", (id)[v40 copy]);
                [(TimingCollection *)self->perfTimers startTimingForKey:6];
                [(TimingCollection *)self->perfTimers startTimingForKey:7];
                [(VCCallSession *)self setUpFirstRemoteFrameTimer];
                videoQueue = self->videoQueue;
                block[0] = MEMORY[0x1E4F143A8];
                block[1] = 3221225472;
                block[2] = __69__VCCallSession_PrivateMethods__startMediaWithPreNegotiatedSettings___block_invoke_2;
                block[3] = &unk_1E6DB3F80;
                block[4] = self;
                void block[5] = &v41;
                void block[6] = a3;
                dispatch_sync(videoQueue, block);
                [(TimingCollection *)self->perfTimers stopTimingForKey:6];
                if (*((unsigned char *)v42 + 24))
                {
                  if ([(VCCallInfo *)self->localCallInfo videoIsPaused]) {
                    [(VCCallSession *)self setPauseVideo:1 force:1 error:0];
                  }
                  if ([(VCCapabilities *)self->caps isVideoEnabled]) {
                    VideoReceiver_CellTechChanged();
                  }
                  [(VCCallSession *)self lock];
                  [(VCCallSession *)self enableSessionHealthMonitor];
                  [(VCCallSession *)self unlock];
                  [(VCCallSession *)self handlePendingPrimaryConnectionChange];
                  if ([(VCCallSession *)self shouldNotifyDelegateDidStartBeforeAudioSetup])
                  {
                    [(VCCallSession *)self notifyDelegateSessionStarted];
                  }
                  LOBYTE(a3) = 1;
                  goto LABEL_82;
                }
                reportingSymptom();
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  VRTraceErrorLogLevelToCSTR();
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                    -[VCCallSession(PrivateMethods) startMediaWithPreNegotiatedSettings:]();
                  }
                }
                goto LABEL_110;
              }
              [(VCCallSession *)self lock];
              secretKedouble y = self->secretKey;
              if (secretKey)
              {
                cf[0] = CFRetain(secretKey);
              }
              else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                VRTraceErrorLogLevelToCSTR();
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                  -[VCCallSession(PrivateMethods) startMediaWithPreNegotiatedSettings:].cold.4();
                }
              }
              [(VCCallSession *)self unlock];
            }
            uint64_t v32 = 0;
            goto LABEL_72;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCCallSession(PrivateMethods) startMediaWithPreNegotiatedSettings:].cold.5();
            }
          }
LABEL_109:
          uint64_t v32 = 0;
          goto LABEL_110;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_109;
        }
        VRTraceErrorLogLevelToCSTR();
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          goto LABEL_109;
        }
        if (*a3) {
          objc_msgSend((id)objc_msgSend(*a3, "description"), "UTF8String");
        }
        -[VCCallSession(PrivateMethods) startMediaWithPreNegotiatedSettings:].cold.6();
      }
      else
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_109;
        }
        VRTraceErrorLogLevelToCSTR();
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          goto LABEL_109;
        }
        if (*a3) {
          objc_msgSend((id)objc_msgSend(*a3, "description"), "UTF8String");
        }
        -[VCCallSession(PrivateMethods) startMediaWithPreNegotiatedSettings:].cold.9();
      }
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_109;
      }
      VRTraceErrorLogLevelToCSTR();
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_109;
      }
      if (*a3) {
        objc_msgSend((id)objc_msgSend(*a3, "description"), "UTF8String");
      }
      -[VCCallSession(PrivateMethods) startMediaWithPreNegotiatedSettings:]0();
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_109;
    }
    VRTraceErrorLogLevelToCSTR();
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_109;
    }
    if (*a3) {
      objc_msgSend((id)objc_msgSend(*a3, "description"), "UTF8String");
    }
    -[VCCallSession(PrivateMethods) startMediaWithPreNegotiatedSettings:]1();
  }
  uint64_t v32 = 0;
LABEL_111:
  if (!*a3) {
    +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a3, 32029, 200, (int)v32, 0, @"Failed to start media", objc_msgSend(NSString, "stringWithFormat:", @"Error: %x.", v32));
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
  {
    VRTraceErrorLogLevelToCSTR();
    if (VRTraceIsOSFaultDisabled())
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        if (*a3) {
          objc_msgSend((id)objc_msgSend(*a3, "description"), "UTF8String");
        }
        -[VCCallSession(PrivateMethods) startMediaWithPreNegotiatedSettings:]();
      }
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
    {
      if (*a3) {
        objc_msgSend((id)objc_msgSend(*a3, "description"), "UTF8String");
      }
      -[VCCallSession(PrivateMethods) startMediaWithPreNegotiatedSettings:]();
    }
  }
  LOBYTE(a3) = 0;
LABEL_82:
  _Block_object_dispose(&v41, 8);
  return (char)a3;
}

uint64_t __69__VCCallSession_PrivateMethods__startMediaWithPreNegotiatedSettings___block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  [*(id *)(*(void *)(a1 + 32) + 672) stopTimingForKey:5];
  uint64_t v6 = *(unsigned char **)(a1 + 32);
  if (a2)
  {
    if (v6[408])
    {
      [*(id *)(a1 + 32) setPauseAudio:1 force:1 error:0];
      uint64_t v6 = *(unsigned char **)(a1 + 32);
    }
    [v6 updateLastReceivedPacketWithTimestamp:4 packetType:micro() + 10.0];
  }
  else
  {
    reportingSymptom();
    [*(id *)(a1 + 32) disconnect:a3 didRemoteCancel:0];
  }
  uint64_t result = [*(id *)(a1 + 32) shouldNotifyDelegateDidStartBeforeAudioSetup];
  if ((result & 1) == 0)
  {
    BOOL v8 = *(void **)(a1 + 32);
    return [v8 notifyDelegateSessionStarted];
  }
  return result;
}

uint64_t __69__VCCallSession_PrivateMethods__startMediaWithPreNegotiatedSettings___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) startVideo:0 error:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int)handleIncomingWithCallID:(unsigned int)a3 msgIn:(const char *)a4 msgOut:(char *)a5 optional:(void *)a6 confIndex:(int *)a7 error:(id *)a8
{
  BOOL v8 = self;
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  CFRange v89 = 0;
  if (!a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCallSession(PrivateMethods) handleIncomingWithCallID:msgIn:msgOut:optional:confIndex:error:]();
      }
    }
    goto LABEL_81;
  }
  if (![(VCCallSession *)self createRTPHandles:a8])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCallSession(PrivateMethods) handleIncomingWithCallID:msgIn:msgOut:optional:confIndex:error:]1();
      }
    }
LABEL_81:
    BOOL v17 = 0;
    __int16 v15 = 0;
    char v62 = 0;
    int v63 = 0;
    int v64 = 0;
    unint64_t v60 = 0;
    double v24 = 0;
    uint64_t v85 = 0;
    uint64_t v86 = 0;
    LODWORD(v80) = 0;
    goto LABEL_57;
  }
  if (![(VCCallSession *)v8 prepareSRTPWithError:a8])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCallSession(PrivateMethods) handleIncomingWithCallID:msgIn:msgOut:optional:confIndex:error:]0();
      }
    }
    goto LABEL_88;
  }
  if (![(VCCallSession *)v8 createMediaQueueHandle:a8])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCallSession(PrivateMethods) handleIncomingWithCallID:msgIn:msgOut:optional:confIndex:error:].cold.9();
      }
    }
LABEL_88:
    BOOL v17 = 0;
    __int16 v15 = 0;
    char v62 = 0;
    int v63 = 0;
    unint64_t v60 = 0;
    double v24 = 0;
    uint64_t v85 = 0;
    uint64_t v86 = 0;
    LODWORD(v80) = 0;
    goto LABEL_56;
  }
  memset(__b, 170, sizeof(__b));
  __strlcpy_chk();
  int v13 = (void *)[[NSString alloc] initWithCString:__b encoding:1];
  [(VCCallInfo *)v8->remoteCallInfo setSdpString:v13];

  if (![(VCCallSession *)v8 negotiatePayloads:0 withError:a8])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCallSession(PrivateMethods) handleIncomingWithCallID:msgIn:msgOut:optional:confIndex:error:].cold.8();
      }
    }
    BOOL v17 = 0;
    __int16 v15 = 0;
    goto LABEL_99;
  }
  long long v79 = a8;
  uint64_t v14 = [(NSMutableArray *)v8->negotiatedAudioPayloads count];
  __int16 v15 = malloc_type_calloc((int)v14, 4uLL, 0x100004052888210uLL);
  if ((int)v14 >= 1)
  {
    uint64_t v16 = 0;
    do
    {
      v15[v16] = objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](v8->negotiatedAudioPayloads, "objectAtIndex:", v16), "config"), "payload");
      ++v16;
    }
    while (v14 != v16);
  }
  BOOL v17 = malloc_type_calloc((int)v14, 4uLL, 0x100004052888210uLL);
  if (v8->allowAudioSwitching)
  {
    int v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v8->negotiatedAudioPayloads];
    [v18 removeObject:v8->currentAudioPayload];
    uint64_t v78 = [v18 count];
    if ((int)v78 >= 1)
    {
      uint64_t v19 = 0;
      do
      {
        v17[v19] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v18, "objectAtIndexedSubscript:", v19), "config"), "payload");
        ++v19;
      }
      while (v78 != v19);
    }
  }
  else
  {
    uint64_t v78 = 0;
  }
  uint64_t v20 = v79;
  if (![(VCCallSession *)v8 setRTPPayloads:[(VCCallSession *)v8 negotiatedAudioPayloadTypes] withError:v79])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCallSession(PrivateMethods) handleIncomingWithCallID:msgIn:msgOut:optional:confIndex:error:].cold.7();
      }
    }
    goto LABEL_99;
  }
  if (![(VCCallSession *)v8 setMediaQueueStreamSettings])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCallSession(PrivateMethods) handleIncomingWithCallID:msgIn:msgOut:optional:confIndex:error:].cold.6();
      }
    }
LABEL_99:
    char v62 = 0;
    unint64_t v60 = 0;
    double v24 = 0;
    uint64_t v85 = 0;
    uint64_t v86 = 0;
    LODWORD(v80) = 0;
    goto LABEL_55;
  }
  unsigned int v88 = 0;
  uint64_t v21 = (const void *)VCConnectionManager_CopyConnectionForQuality((uint64_t)v8->connectionManager, 1);
  unsigned int v75 = [(VCBitrateArbiter *)v8->callSessionBitrateArbiter maxAllowedBitrateForVCConnection:v21 forLocalInterface:1 arbiterMode:VCBitrateArbiter_ModeFromOperatingMode(v8->operatingMode) encodeRule:v8->_currentEncodeRule];
  if (v21) {
    CFRelease(v21);
  }
  uint64_t v76 = v14;
  long long v77 = a5;
  [(VCCallSession *)v8 negotiateMaxBandwidth:&v88];
  unsigned int v84 = [(VCConnectionManager *)v8->connectionManager getConnectionTypeForActiveConnectionWithQuality:1 forLocalInterface:1];
  int v87 = 2700;
  long long v73 = (tagHANDLE ***)a6;
  long long v74 = a7;
  if (v8->videoPayload < 1)
  {
    unint64_t v58 = 0;
    double v24 = 0;
    BOOL v23 = 0;
    BOOL v27 = 0;
    uint64_t v22 = 0;
    goto LABEL_52;
  }
  uint64_t v22 = [(VCCallSession *)v8 getAllCompatibleVideoPayloads:&v89 forMediaType:2];
  uint64_t v86 = malloc_type_calloc((int)v22, 8uLL, 0x2004093837F09uLL);
  BOOL v23 = malloc_type_calloc((int)v22, 8uLL, 0x2004093837F09uLL);
  double v24 = malloc_type_calloc((int)v22, 4uLL, 0x100004052888210uLL);
  int v25 = malloc_type_calloc((int)v22, 4uLL, 0x100004052888210uLL);
  if ((int)v22 < 1)
  {
    BOOL v27 = v86;
    unint64_t v58 = v25;
LABEL_52:
    uint64_t v59 = [(VCCallSession *)v8 getCompatibleLocalFeatureListForPayloads:v89 count:v22];
    unint64_t v60 = v58;
    LODWORD(v80) = v22;
    uint64_t v85 = v23;
    uint64_t v86 = v27;
    if (-[VCCallSession createSDP:audioPayloadCount:secondaryPayloadTypes:secondaryPayloadCount:videoPayloadTypes:videoPayloadCount:localFeatureList:answerBandwidth:maxBandwidth:imageSizesSend:imageSendCount:imageSizesRecv:imageRecvCount:sdp:numSDPBytes:error:](v8, "createSDP:audioPayloadCount:secondaryPayloadTypes:secondaryPayloadCount:videoPayloadTypes:videoPayloadCount:localFeatureList:answerBandwidth:maxBandwidth:imageSizesSend:imageSendCount:imageSizesRecv:imageRecvCount:sdp:numSDPBytes:error:", v15, v76, v17, v78, v89, v22, v59, __PAIR64__(v75, v88), v27, v24, v23, v58, v77, &v87, v20))
    {
      if ([(VCCallSession *)v8 createAudioTransmitter:v20])
      {
        [(VCAudioTransmitter *)v8->audioTransmitter setCellTech:v8->_isLocalCellular_LowestConnectionQuality remoteCellular:v8->_isRemoteCellular_LowestConnectionQuality isIPV6:v8->_isConnectedOnIPv6_LowestConnectionQuality audioCap:[(VCCallSession *)v8 currentAudioCap]];
        long long v61 = *v73;
        *long long v61 = v8->rtpVideo;
        v61[1] = v8->rtpHandle;
        *long long v74 = 0;
        char v62 = 1;
LABEL_55:
        int v63 = 1;
LABEL_56:
        int v64 = 1;
        goto LABEL_57;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCallSession(PrivateMethods) handleIncomingWithCallID:msgIn:msgOut:optional:confIndex:error:].cold.4();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCallSession(PrivateMethods) handleIncomingWithCallID:msgIn:msgOut:optional:confIndex:error:].cold.5();
      }
    }
LABEL_73:
    char v62 = 0;
    goto LABEL_55;
  }
  v83 = v24;
  long long v71 = v17;
  long long v72 = v15;
  uint64_t v26 = 0;
  uint64_t v80 = v22;
  uint64_t v81 = v22;
  BOOL v27 = v86;
  uint64_t v28 = v25;
  uint64_t v85 = v23;
  uint64_t v82 = v8;
  while (1)
  {
    uint64_t v29 = *((unsigned int *)v89 + v26);
    uint64_t v30 = [(VCCallInfo *)v8->remoteCallInfo sdp];
    id v31 = [(VCBitrateArbiter *)v8->callSessionBitrateArbiter maxAllowedBitrateRuleForConnection:v84];
    uint64_t v32 = [(VCCallInfo *)v8->remoteCallInfo isHDVideoSupported];
    v27[v26] = 0;
    v83[v26] = 0;
    *((void *)v23 + v26) = 0;
    uint64_t v33 = v28;
    v28[v26] = 0;
    MaxImageDimensions = getMaxImageDimensions(1, 2, v30, v29, v31, v32);
    uint64_t v35 = getMaxImageDimensions(1, 1, v30, v29, v31, v32);
    size_t v36 = v35 ? (MaxImageDimensions != 0) + 1 : (MaxImageDimensions != 0);
    v83[v26] = v36;
    if (v36)
    {
      v27[v26] = malloc_type_calloc(v36, 0x24uLL, 0x10000408AA14F5FuLL);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v37 = VRTraceErrorLogLevelToCSTR();
      int v38 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v92 = v37;
        __int16 v93 = 2080;
        v94 = "imageAttrForAnswer";
        __int16 v95 = 1024;
        int v96 = 5921;
        __int16 v97 = 1024;
        int v98 = v29;
        _os_log_impl(&dword_1E1EA4000, v38, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d *pSendCount is zero (payload=%d)", buf, 0x22u);
      }
    }
    if (MaxImageDimensions)
    {
      BOOL v27 = v86;
      uint64_t v39 = v86[v26];
      if (v39)
      {
        long long v40 = *(_OWORD *)MaxImageDimensions;
        long long v41 = *((_OWORD *)MaxImageDimensions + 1);
        *(_DWORD *)(v39 + 32) = MaxImageDimensions[8];
        *(_OWORD *)uint64_t v39 = v40;
        *(_OWORD *)(v39 + 16) = v41;
      }
      free(MaxImageDimensions);
      unsigned int v42 = 1;
      uint64_t v28 = v33;
    }
    else
    {
      unsigned int v42 = 0;
      uint64_t v28 = v33;
      BOOL v27 = v86;
    }
    BOOL v8 = v82;
    if (v35)
    {
      uint64_t v43 = v27[v26];
      if (v43)
      {
        uint64_t v44 = v43 + 36 * v42;
        long long v45 = *(_OWORD *)v35;
        long long v46 = *((_OWORD *)v35 + 1);
        *(_DWORD *)(v44 + 32) = v35[8];
        *(_OWORD *)uint64_t v44 = v45;
        *(_OWORD *)(v44 + 16) = v46;
      }
      free(v35);
    }
    uint64_t v47 = getMaxImageDimensions(0, 2, v30, v29, v31, v32);
    __int16 v48 = getMaxImageDimensions(0, 1, v30, v29, v31, v32);
    size_t v49 = v48 ? (v47 != 0) + 1 : (v47 != 0);
    v28[v26] = v49;
    if (!v49) {
      break;
    }
    __int16 v50 = malloc_type_calloc(v49, 0x24uLL, 0x10000408AA14F5FuLL);
    int v51 = v50;
    if (v47)
    {
      long long v52 = *(_OWORD *)v47;
      long long v53 = *((_OWORD *)v47 + 1);
      v50[8] = v47[8];
      *(_OWORD *)__int16 v50 = v52;
      *((_OWORD *)v50 + 1) = v53;
      free(v47);
      unsigned int v54 = 1;
    }
    else
    {
      unsigned int v54 = 0;
    }
    BOOL v23 = v85;
    if (v48)
    {
      long long v55 = &v51[9 * v54];
      long long v56 = *(_OWORD *)v48;
      long long v57 = *((_OWORD *)v48 + 1);
      v55[8] = v48[8];
      *(_OWORD *)long long v55 = v56;
      *((_OWORD *)v55 + 1) = v57;
      free(v48);
    }
    *((void *)v85 + v26++) = v51;
    if (v81 == v26)
    {
      unint64_t v58 = v28;
      BOOL v17 = v71;
      __int16 v15 = v72;
      double v24 = v83;
      uint64_t v20 = v79;
      uint64_t v22 = v80;
      goto LABEL_52;
    }
  }
  double v24 = v83;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCCallSession(PrivateMethods) handleIncomingWithCallID:msgIn:msgOut:optional:confIndex:error:]();
    }
  }
  unint64_t v60 = v28;
  free((void *)v86[v26]);
  v86[v26] = 0;
  v83[v26] = 0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    BOOL v17 = v71;
    __int16 v15 = v72;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCCallSession(PrivateMethods) handleIncomingWithCallID:msgIn:msgOut:optional:confIndex:error:]();
    }
    goto LABEL_73;
  }
  char v62 = 0;
  int v63 = 1;
  int v64 = 1;
  BOOL v17 = v71;
  __int16 v15 = v72;
LABEL_57:
  free(v15);
  free(v17);
  free(v89);
  if ((int)v80 >= 1)
  {
    uint64_t v65 = v80;
    long long v67 = (void **)v85;
    long long v66 = (void **)v86;
    do
    {
      long long v68 = *v66++;
      free(v68);
      long long v69 = *v67++;
      free(v69);
      --v65;
    }
    while (v65);
  }
  free(v86);
  free(v85);
  free(v24);
  free(v60);
  if ((v62 & 1) == 0)
  {
    if (v63) {
      [(VCCallSession *)v8 stopMediaQueue:0];
    }
    if (v64) {
      [(VCCallSession *)v8 releaseRTPHandles];
    }
    [(VCCallSession *)v8 resetState];
  }
  return 0;
}

- (void)getAllPayloadsForAudio:(int *)a3 count:(int *)a4 secondaryPayloads:(int *)a5 secondaryCount:(int *)a6
{
  if (a3 && a4)
  {
    int v11 = +[VCAudioRuleCollection getForcedPayload];
    if (v11 == 128)
    {
      if (self->_deviceRole) {
        BOOL v12 = &unk_1F3DC7728;
      }
      else {
        BOOL v12 = &unk_1F3DC7710;
      }
      int v13 = [v12 count];
      uint64_t v14 = (int *)malloc_type_calloc(1uLL, 4 * v13, 0x100004052888210uLL);
      if (v13 >= 1)
      {
        for (uint64_t i = 0; i != v13; ++i)
          v14[i] = objc_msgSend((id)objc_msgSend(v12, "objectAtIndexedSubscript:", i), "intValue");
      }
      *a3 = v14;
      *a4 = v13;
      if (a5 && a6 && self->allowAudioSwitching)
      {
        uint64_t v16 = (int *)malloc_type_malloc(0x14uLL, 0x1000040A86A77D5uLL);
        if (v16)
        {
          v16[4] = 13;
          *(_OWORD *)uint64_t v16 = xmmword_1E259FF60;
          *a6 = 5;
          *a5 = v16;
        }
      }
    }
    else
    {
      int v17 = v11;
      int v18 = (int *)malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
      int *v18 = v17;
      *a3 = v18;
      *a4 = 1;
    }
  }
}

- (void)getAllPayloadsForVideo:(int *)a3 count:(int *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!a3 || !a4) {
    return;
  }
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithArray:", -[VCVideoRuleCollections supportedPayloads](+[VCVideoRuleCollectionsCamera sharedInstance](VCVideoRuleCollectionsCamera, "sharedInstance"), "supportedPayloads"));
  if (![+[VCDefaults sharedInstance] forceHWI])
  {
    [v6 removeObject:&unk_1F3DC48A8];
    goto LABEL_15;
  }
  uint64_t v7 = [+[VCDefaults sharedInstance] forceVideoPayload];
  uint64_t v8 = [+[VCDefaults sharedInstance] forceRecvVideoPayload];
  uint64_t v9 = [NSNumber numberWithInt:v7];
  uint64_t v10 = [NSNumber numberWithInt:v8];
  if (v7 == 128)
  {
LABEL_15:
    int v18 = [v6 count];
    uint64_t v19 = (int *)malloc_type_malloc(4 * v18, 0x100004052888210uLL);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __62__VCCallSession_PrivateMethods__getAllPayloadsForVideo_count___block_invoke;
    void v20[3] = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
    v20[4] = v19;
    [v6 enumerateObjectsUsingBlock:v20];

    *a3 = v19;
    *a4 = v18;
    return;
  }
  uint64_t v11 = v10;
  int v12 = [v6 containsObject:v9];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v12)
  {
    if (ErrorLogLevelForModule >= 5)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      __int16 v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v22 = v14;
        __int16 v23 = 2080;
        double v24 = "-[VCCallSession(PrivateMethods) getAllPayloadsForVideo:count:]";
        __int16 v25 = 1024;
        int v26 = 6730;
        __int16 v27 = 1024;
        int v28 = v7;
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Video payload OVERRIDE to %d", buf, 0x22u);
      }
    }
    [v6 removeAllObjects];
    [v6 addObject:v9];
    if (v8 != 128)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v16 = VRTraceErrorLogLevelToCSTR();
        int v17 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v22 = v16;
          __int16 v23 = 2080;
          double v24 = "-[VCCallSession(PrivateMethods) getAllPayloadsForVideo:count:]";
          __int16 v25 = 1024;
          int v26 = 6744;
          __int16 v27 = 1024;
          int v28 = v8;
          _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Video receive payload OVERRIDE to %d", buf, 0x22u);
        }
      }
      [v6 addObject:v11];
    }
    goto LABEL_15;
  }
  if (ErrorLogLevelForModule >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCCallSession(PrivateMethods) getAllPayloadsForVideo:count:]();
    }
  }
  *a4 = 0;
  *a3 = 0;
}

uint64_t __62__VCCallSession_PrivateMethods__getAllPayloadsForVideo_count___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 intValue];
  *(_DWORD *)(*(void *)(a1 + 32) + 4 * a3) = result;
  return result;
}

- (void)getAllPayloadsForScreen:(int *)a3 count:(int *)a4
{
  void v9[5] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (a4)
    {
      uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithArray:", -[VCVideoRuleCollections supportedPayloads](+[VCVideoRuleCollectionsScreen sharedInstance](VCVideoRuleCollectionsScreen, "sharedInstance"), "supportedPayloads"));
      int v7 = [v6 count];
      uint64_t v8 = (int *)malloc_type_malloc(4 * v7, 0x100004052888210uLL);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __63__VCCallSession_PrivateMethods__getAllPayloadsForScreen_count___block_invoke;
      v9[3] = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
      v9[4] = v8;
      [v6 enumerateObjectsUsingBlock:v9];

      *a3 = v8;
      *a4 = v7;
    }
  }
}

uint64_t __63__VCCallSession_PrivateMethods__getAllPayloadsForScreen_count___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 intValue];
  *(_DWORD *)(*(void *)(a1 + 32) + 4 * a3) = result;
  return result;
}

- (BOOL)canSendSIPInviteWithError:(id *)a3
{
  int64_t sipState = self->_sipState;
  if (sipState != 5)
  {
    int64_t v5 = [(VCCallSession *)self state];
    +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a3, 32002, 215, v5, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 6790), @"no longer attempting to connect", @"State != GKVoiceChatServiceStateCallerAttemptingToConnect");
  }
  return sipState == 5;
}

- (id)createInviteSDPWithError:(id *)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  long long v56 = 0;
  long long v57 = 0;
  size_t count = 0;
  long long v55 = 0;
  unsigned int v53 = 0;
  bzero(v58, 0xA8CuLL);
  int v52 = 2700;
  [(VCCallSession *)self lock];
  [(VCCallSession *)self getAllPayloadsForAudio:&v56 count:&count secondaryPayloads:&v55 secondaryCount:&v53];
  [(VCCallSession *)self getAllPayloadsForVideo:&v57 count:(char *)&count + 4];
  uint64_t v44 = self;
  if (![(VCCallInfo *)self->remoteCallInfo supportSDPCompression] && v57)
  {
    *(_DWORD *)long long v57 = 126;
    HIDWORD(count) = 1;
  }
  int64_t v5 = (const void *)VCConnectionManager_CopyConnectionForQuality((uint64_t)self->connectionManager, 1);
  signed int v6 = [(VCBitrateArbiter *)self->callSessionBitrateArbiter maxAllowedBitrateForVCConnection:v5 forLocalInterface:1 arbiterMode:VCBitrateArbiter_ModeFromOperatingMode(self->operatingMode) encodeRule:self->_currentEncodeRule];
  if (v5) {
    CFRelease(v5);
  }
  signed int carrierBitrateCap = v44->carrierBitrateCap;
  if ([(VCCallSession *)v44 treatAsCellular] && v6 > carrierBitrateCap) {
    unsigned int v8 = carrierBitrateCap;
  }
  else {
    unsigned int v8 = v6;
  }
  v44->unsigned int callSessionBitrate = v8;
  uint64_t v9 = (void **)malloc_type_calloc(SHIDWORD(count), 8uLL, 0x2004093837F09uLL);
  unint64_t v10 = 0x1E4F29000;
  if (!v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCallSession(PrivateMethods) createInviteSDPWithError:]();
      }
    }
    goto LABEL_44;
  }
  uint64_t v11 = (void **)malloc_type_calloc(SHIDWORD(count), 8uLL, 0x2004093837F09uLL);
  if (!v11)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCallSession(PrivateMethods) createInviteSDPWithError:]();
      }
    }
LABEL_44:
    long long v41 = 0;
    unsigned int v42 = 0;
    int v12 = 0;
    goto LABEL_55;
  }
  int v12 = v11;
  unsigned int v42 = (int *)malloc_type_calloc(SHIDWORD(count), 4uLL, 0x100004052888210uLL);
  if (!v42)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCallSession(PrivateMethods) createInviteSDPWithError:]();
      }
    }
    long long v41 = 0;
    unsigned int v42 = 0;
    goto LABEL_55;
  }
  long long v41 = (int *)malloc_type_calloc(SHIDWORD(count), 4uLL, 0x100004052888210uLL);
  if (!v41)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCallSession(PrivateMethods) createInviteSDPWithError:].cold.4();
      }
    }
    long long v41 = 0;
    goto LABEL_55;
  }
  uint64_t v39 = v9;
  long long v40 = v12;
  int v38 = a3;
  unsigned int v43 = [(VCConnectionManager *)v44->connectionManager getConnectionTypeForActiveConnectionWithQuality:1 forLocalInterface:1];
  uint64_t v13 = HIDWORD(count);
  uint64_t v14 = v57;
  unsigned int v37 = v8;
  if (SHIDWORD(count) >= 1 && v57)
  {
    uint64_t v15 = 0;
    uint64_t v16 = v9;
    int v17 = v40;
    uint64_t v19 = v41;
    int v18 = v42;
    do
    {
      *int v17 = 0;
      *uint64_t v16 = 0;
      *uint64_t v19 = 0;
      size_t v49 = v18;
      int *v18 = 0;
      id v20 = [(VCBitrateArbiter *)v44->callSessionBitrateArbiter maxAllowedBitrateRuleForConnection:v43];
      char v48 = [(VCCallInfo *)v44->remoteCallInfo isHDVideoSupported];
      uint64_t v50 = v15;
      uint64_t v21 = *((unsigned int *)v57 + v15);
      uint64_t v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithArray:", -[VCVideoRuleCollections supportedVideoRulesForBitrate:transportType:payload:encodingType:](+[VCVideoRuleCollectionsCamera sharedInstance](VCVideoRuleCollectionsCamera, "sharedInstance"), "supportedVideoRulesForBitrate:transportType:payload:encodingType:", objc_msgSend(v20, "limitingRule"), 1, v21, 1));
      __int16 v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithArray:", -[VCVideoRuleCollections supportedVideoRulesForBitrate:transportType:payload:encodingType:](+[VCVideoRuleCollectionsCamera sharedInstance](VCVideoRuleCollectionsCamera, "sharedInstance"), "supportedVideoRulesForBitrate:transportType:payload:encodingType:", objc_msgSend(v20, "limitingRule"), 1, v21, 2));
      int v51 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithArray:", -[VCVideoRuleCollections getVideoRulesForTransport:payload:encodingType:](+[VCVideoRuleCollectionsCamera sharedInstance](VCVideoRuleCollectionsCamera, "sharedInstance"), "getVideoRulesForTransport:payload:encodingType:", 2, v21, 1));
      double v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithArray:", -[VCVideoRuleCollections getVideoRulesForTransport:payload:encodingType:](+[VCVideoRuleCollectionsCamera sharedInstance](VCVideoRuleCollectionsCamera, "sharedInstance"), "getVideoRulesForTransport:payload:encodingType:", 2, v21, 2));
      remove16x9Resolutions(v23);
      remove16x9Resolutions(v24);
      if ([+[VCDefaults sharedInstance] forceHWI])
      {
        int v25 = [+[VCDefaults sharedInstance] forceVideoPayload];
        int v26 = [+[VCDefaults sharedInstance] forceRecvVideoPayload];
        if (v25 != 128 && v25 != v21)
        {
          [v22 removeAllObjects];
          [v51 removeAllObjects];
        }
        if (v26 != 128 && v26 != v21)
        {
          [v23 removeAllObjects];
          [v24 removeAllObjects];
        }
      }
      long long v46 = v22;
      int v27 = [v22 count];
      int v28 = malloc_type_calloc(v27, 0x24uLL, 0x10000408AA14F5FuLL);
      *uint64_t v16 = v28;
      uint64_t v47 = v24;
      int *v49 = v27;
      int v18 = v49 + 1;
      addWifiInterfaceForImageDimensions(v28, v27, v48, v22);
      int v29 = [v23 count];
      uint64_t v30 = malloc_type_calloc(v29, 0x24uLL, 0x10000408AA14F5FuLL);
      *uint64_t v19 = v29;
      id v31 = v19 + 1;
      long long v45 = v19;
      uint64_t v32 = v17;
      *v17++ = v30;
      addWifiInterfaceForImageDimensions(v30, v29, v48, v23);
      addCellInterfaceForImageDimensions(v16, v49, v21, v51);
      addCellInterfaceForImageDimensions(v32, v45, v21, v47);

      uint64_t v15 = v50 + 1;
      uint64_t v13 = SHIDWORD(count);
      uint64_t v14 = v57;
      if (v50 + 1 >= SHIDWORD(count)) {
        break;
      }
      ++v16;
      uint64_t v19 = v31;
    }
    while (v57);
  }
  a3 = v38;
  uint64_t v9 = v39;
  LODWORD(v36) = 0;
  HIDWORD(v36) = v37;
  if (-[VCCallSession createSDP:audioPayloadCount:secondaryPayloadTypes:secondaryPayloadCount:videoPayloadTypes:videoPayloadCount:localFeatureList:answerBandwidth:maxBandwidth:imageSizesSend:imageSendCount:imageSizesRecv:imageRecvCount:sdp:numSDPBytes:error:](v44, "createSDP:audioPayloadCount:secondaryPayloadTypes:secondaryPayloadCount:videoPayloadTypes:videoPayloadCount:localFeatureList:answerBandwidth:maxBandwidth:imageSizesSend:imageSendCount:imageSizesRecv:imageRecvCount:sdp:numSDPBytes:error:", v56, count, v55, v53, v14, v13, [(VCCallSession *)v44 allPayloadsLocalFeaturesString], v36, v39, v42, v40, v41, v58, &v52, v38))
  {
    unint64_t v10 = 0x1E4F29000uLL;
    int v12 = v40;
    goto LABEL_27;
  }
  unint64_t v10 = 0x1E4F29000uLL;
  int v12 = v40;
  if ((int)VRTraceGetErrorLogLevelForModule() < 3
    || (VRTraceErrorLogLevelToCSTR(), !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
  {
LABEL_55:
    if (!a3) {
      goto LABEL_27;
    }
    goto LABEL_56;
  }
  -[VCCallSession(PrivateMethods) createInviteSDPWithError:].cold.5();
LABEL_56:
  if (!*a3) {
    +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a3, 32002, 215, -[VCCallSession state](v44, "state"), 0, @"Failed to create the offer SDP", objc_msgSend(*(id *)(v10 + 24), "stringWithFormat:", @"Error status: 0x%08x", 3));
  }
LABEL_27:
  free(v42);
  free(v41);
  free(v57);
  free(v56);
  free(v55);
  if (v9)
  {
    if (SHIDWORD(count) >= 1)
    {
      uint64_t v33 = 0;
      do
        free(v9[v33++]);
      while (v33 < SHIDWORD(count));
    }
    free(v9);
  }
  if (v12)
  {
    if (SHIDWORD(count) >= 1)
    {
      uint64_t v34 = 0;
      do
        free(v12[v34++]);
      while (v34 < SHIDWORD(count));
    }
    free(v12);
  }
  [(VCCallSession *)v44 unlock];
  return (id)objc_msgSend(*(id *)(v10 + 24), "stringWithFormat:", @"%s", v58);
}

- (BOOL)establishSIPDialogWithSDP:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int8x16_t v15 = vextq_s8(*(int8x16_t *)&self->rtpHandle, *(int8x16_t *)&self->rtpHandle, 8uLL);
  *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)((char *)v20 + 11) = v7;
  long long v19 = v7;
  v20[0] = v7;
  *(_OWORD *)((char *)v18 + 11) = v7;
  long long v17 = v7;
  v18[0] = v7;
  [(NSString *)[(VCCallInfo *)self->localCallInfo participantID] UTF8String];
  __strlcpy_chk();
  [(NSString *)[(VCCallInfo *)self->remoteCallInfo participantID] UTF8String];
  __strlcpy_chk();
  int IsLTEOrNewer = 1;
  [(TimingCollection *)self->perfTimers stopTimingForKey:1];
  [(TimingCollection *)self->perfTimers startTimingForKey:2];
  if (VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality((uint64_t)self->connectionManager, 1, 1))int IsLTEOrNewer = NetworkUtils_IsLTEOrNewer([(VCConnectionManager *)self->connectionManager getCellularTechForActiveConnectionWithQuality:1 forLocalInterface:1]); {
  int v9 = 1;
  }
  if (VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality((uint64_t)self->connectionManager, 1, 0))int v9 = NetworkUtils_IsLTEOrNewer([(VCConnectionManager *)self->connectionManager getCellularTechForActiveConnectionWithQuality:1 forLocalInterface:0]); {
  if ((IsLTEOrNewer & v9) == 1)
  }
    unsigned int dwRTT_ice = self->dwRTT_ice;
  else {
    unsigned int dwRTT_ice = -1;
  }
  bzero(v16, 0xA8DuLL);
  int v11 = SIPConnectIPPort((uint64_t *)&self->hSIP, -[VCCallInfo callID](self->localCallInfo, "callID"), -[VCCallInfo callID](self->remoteCallInfo, "callID"), (const char *)&v19, (const char *)&v17, (char *)[a3 UTF8String], v16, &v15, 1, dwRTT_ice);
  [(TimingCollection *)self->perfTimers stopTimingForKey:2];
  [(VCCallSession *)self lock];
  if (v11 < 0)
  {
    if ([(VCConnectionManager *)self->connectionManager isConnectedOnRelayForActiveConnectionWithQuality:1])
    {
      uint64_t v13 = 252;
    }
    else
    {
      uint64_t v13 = 216;
    }
    +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a4, 32002, v13, v11, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 6942), @"Unable to establish session with the remote participant.", @"SIPConnectIPPort failed");
    BOOL v12 = 0;
  }
  else
  {
    -[VCCallInfo setSdpString:](self->remoteCallInfo, "setSdpString:", [NSString stringWithCString:v16 encoding:1]);
    BOOL v12 = self->_sipState == 5;
  }
  [(VCCallSession *)self unlock];
  return v12;
}

- (BOOL)sendSIPInviteWithError:(id *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  [(VCCallSession *)self lock];
  if (![(VCCallSession *)self canSendSIPInviteWithError:a3])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      int v11 = *MEMORY[0x1E4F47A50];
      int v12 = 0;
      int v13 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_37;
      }
      if (*a3) {
        uint64_t v14 = (const char *)objc_msgSend((id)objc_msgSend(*a3, "description"), "UTF8String");
      }
      else {
        uint64_t v14 = "<nil>";
      }
      int v15 = 136315906;
      uint64_t v16 = v10;
      __int16 v17 = 2080;
      int v18 = "-[VCCallSession(PrivateMethods) sendSIPInviteWithError:]";
      __int16 v19 = 1024;
      int v20 = 6959;
      __int16 v21 = 2080;
      uint64_t v22 = v14;
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d sendSIPInviteWithError failed state: no longer attempting to connect! error = (%s)", (uint8_t *)&v15, 0x26u);
    }
    goto LABEL_36;
  }
  BOOL v5 = [(VCMediaNegotiator *)self->_mediaNegotiator usePreNegotiation];
  if (!v5)
  {
    if ([(VCCallSession *)self createRTPHandles:a3])
    {
      if ([(VCCallSession *)self prepareSRTPWithError:a3])
      {
        if ([(VCCallSession *)self createMediaQueueHandle:a3])
        {
          id v6 = [(VCCallSession *)self createInviteSDPWithError:a3];
          if ([v6 length]) {
            goto LABEL_8;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCCallSession(PrivateMethods) sendSIPInviteWithError:]();
            }
          }
          int v12 = 1;
LABEL_33:
          int v13 = 1;
          goto LABEL_37;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCCallSession(PrivateMethods) sendSIPInviteWithError:]();
          }
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCallSession(PrivateMethods) sendSIPInviteWithError:].cold.4();
        }
      }
      int v12 = 0;
      goto LABEL_33;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCallSession(PrivateMethods) sendSIPInviteWithError:].cold.5();
      }
    }
LABEL_36:
    int v12 = 0;
    int v13 = 0;
    goto LABEL_37;
  }
  id v6 = 0;
LABEL_8:
  [(VCCallSession *)self unlock];
  BOOL v7 = [(VCCallSession *)self establishSIPDialogWithSDP:v6 error:a3];
  [(VCCallSession *)self lock];
  if (v7)
  {
    BOOL v8 = 1;
    goto LABEL_10;
  }
  int v12 = !v5;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCCallSession(PrivateMethods) sendSIPInviteWithError:]();
    }
  }
  int v13 = !v5;
LABEL_37:
  if (self->state)
  {
    if (v12) {
      [(VCCallSession *)self stopMediaQueue:0];
    }
    if (v13) {
      [(VCCallSession *)self releaseRTPHandles];
    }
    [(VCCallSession *)self resetState];
  }
  BOOL v8 = 0;
LABEL_10:
  [(VCCallSession *)self unlock];
  return v8;
}

- (BOOL)treatAsCellular
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"treatLTEAs4G", @"com.apple.VideoConference", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v4 = AppBooleanValue == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4
    || (NetworkUtils_IsLTEOrNewer([(VCConnectionManager *)self->connectionManager getCellularTechForActiveConnectionWithQuality:1 forLocalInterface:1]) & 1) == 0)
  {
    return VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality((uint64_t)self->connectionManager, 1, 1);
  }
  else
  {
    return 0;
  }
}

- (int)fillMediaControlInfo:(void *)a3
{
  -[VCConnectionManager setConnectionHealthOnControlInfo:](self->connectionManager, "setConnectionHealthOnControlInfo:");
  if (self->useVCRC
    && VCRateControlSetFeedbackControlInfo([(AVCRateController *)self->_rateController feedbackController], a3))
  {
    AFRCSetFeedbackControlInfo((uint64_t)self->hAFRC, 0);
    return 0;
  }
  else
  {
    hAFRC = self->hAFRC;
    return AFRCSetFeedbackControlInfo((uint64_t)hAFRC, a3);
  }
}

- (int)processMediaControlInfo:(void *)a3 isAudio:(BOOL)a4
{
  BOOL v4 = a4;
  if (a4)
  {
    [(VCConnectionManager *)self->connectionManager processConnectionHealthFromControlInfo:a3];
    if (!self->useVCRC) {
      goto LABEL_6;
    }
    VCRateControlProcessFeedbackControlInfo((uint64_t)[(AVCRateController *)self->_rateController feedbackController], a3);
  }
  else if (!self->useVCRC)
  {
    goto LABEL_6;
  }
  VCRateControlProcessProbingControlInfo((_DWORD *)[(AVCRateController *)self->_rateController feedbackController], a3, v4);
LABEL_6:
  uint64_t v7 = 56;
  if (v4) {
    uint64_t v7 = 48;
  }
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa + v7);

  return RTPProcessMediaControlInfo(v8, a3, v4);
}

- (BOOL)createAudioTransmitter:(id *)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  BOOL v5 = objc_alloc_init(VCAudioTransmitterConfig);
  [(VCAudioTransmitterConfig *)v5 setRtpHandle:self->rtpHandle];
  [(VCAudioTransmitterConfig *)v5 setControlInfoGenerator:self->audioMediaControlInfoGenerator];
  [(VCAudioTransmitterConfig *)v5 setAudioPayloads:self->negotiatedAudioPayloads];
  [(VCAudioTransmitterConfig *)v5 setChosenAudioPayload:self->currentAudioPayload];
  [(VCAudioTransmitterConfig *)v5 setChosenDTXPayload:self->currentDTXPayload];
  [(VCAudioTransmitterConfig *)v5 setChosenRedPayloadType:self->_currentRedPayloadType];
  [(VCAudioTransmitterConfig *)v5 setRedEnabled:self->_isRedEnabled];
  [(VCAudioTransmitterConfig *)v5 setIncludeRedSequenceOffset:1];
  long long v6 = *(_OWORD *)&self->_vpioFormat.format.mBytesPerPacket;
  v45[0] = *(_OWORD *)&self->_vpioFormat.format.mSampleRate;
  v45[1] = v6;
  v45[2] = *(_OWORD *)&self->_vpioFormat.format.mBitsPerChannel;
  [(VCAudioTransmitterConfig *)v5 setInputFormat:v45];
  [(VCAudioTransmitterConfig *)v5 setUseRateControl:self->useRateControl];
  [(VCAudioTransmitterConfig *)v5 setBundlingScheme:1];
  [(VCAudioTransmitterConfig *)v5 setIsUseCaseWatchContinuity:self->_isUseCaseWatchContinuity];
  [(VCAudioTransmitterConfig *)v5 setAllowAudioSwitching:self->allowAudioSwitching];
  [(VCAudioTransmitterConfig *)v5 setAfrcHandle:self->hAFRC];
  [(VCAudioTransmitterConfig *)v5 setStatisticsCollector:[(AVCRateController *)self->_rateController statisticsCollector]];
  [(VCAudioTransmitterConfig *)v5 setOperatingMode:self->operatingMode];
  [(VCAudioTransmitterConfig *)v5 setSupportsAdaptation:!self->isGKVoiceChat];
  [(VCAudioTransmitterConfig *)v5 setNeedsPacketThread:self->isGKVoiceChat];
  [(VCAudioTransmitterConfig *)v5 setTransportSession:self->_transportSession];
  [(VCAudioTransmitterConfig *)v5 setReportingAgent:self->reportingAgent];
  [(VCAudioTransmitterConfig *)v5 setMediaQueue:self->hMediaQueue];
  [(VCAudioTransmitterConfig *)v5 setRtpVideo:self->rtpVideo];
  [(VCAudioTransmitterConfig *)v5 setShouldCreateRedundancyController:1];
  if (self->isGKVoiceChat) {
    uint64_t v7 = 4;
  }
  else {
    uint64_t v7 = 1;
  }
  [(VCAudioTransmitterConfig *)v5 setPacketsPerBundle:v7];
  if (self->_isRedEnabled) {
    uint64_t v8 = &unk_1F3DC7740;
  }
  else {
    uint64_t v8 = &unk_1F3DC7758;
  }
  [(VCAudioTransmitterConfig *)v5 setSupportedNumRedundantPayload:v8];
  [(VCAudioTransmitterConfig *)v5 setMediaControlInfoVersion:[(VCMediaNegotiatorResults *)[(VCMediaNegotiatorBase *)self->_mediaNegotiator negotiatedSettings] mediaControlInfoVersion]];
  [(VCAudioTransmitterConfig *)v5 setAlwaysOnAudioRedundancyEnabled:[(VCSwitchManager *)self->_switchManager isSwitchEnabled:2]];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v11 = [(VCAudioTransmitterConfig *)v5 alwaysOnAudioRedundancyEnabled];
      *(_DWORD *)buf = 136315906;
      uint64_t v47 = v9;
      __int16 v48 = 2080;
      size_t v49 = "-[VCCallSession(PrivateMethods) createAudioTransmitter:]";
      __int16 v50 = 1024;
      int v51 = 7097;
      __int16 v52 = 1024;
      LODWORD(v53) = v11;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Load switch alwaysOnAudioRedundancyEnabled %d", buf, 0x22u);
    }
  }
  [(VCAudioTransmitterConfig *)v5 setCellularAllowRedLowBitratesEnabled:[(VCSwitchManager *)self->_switchManager isSwitchEnabled:0x8000]];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    int v13 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v14 = [(VCAudioTransmitterConfig *)v5 cellularAllowRedLowBitratesEnabled];
      *(_DWORD *)buf = 136315906;
      uint64_t v47 = v12;
      __int16 v48 = 2080;
      size_t v49 = "-[VCCallSession(PrivateMethods) createAudioTransmitter:]";
      __int16 v50 = 1024;
      int v51 = 7099;
      __int16 v52 = 1024;
      LODWORD(v53) = v14;
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Load switch cellularLowTierRedundancyEnabled %d", buf, 0x22u);
    }
  }
  [(VCAudioTransmitterConfig *)v5 setWifiAllowRedLowBitratesEnabled:[(VCSwitchManager *)self->_switchManager isSwitchEnabled:0x4000]];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    uint64_t v16 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v17 = [(VCAudioTransmitterConfig *)v5 wifiAllowRedLowBitratesEnabled];
      *(_DWORD *)buf = 136315906;
      uint64_t v47 = v15;
      __int16 v48 = 2080;
      size_t v49 = "-[VCCallSession(PrivateMethods) createAudioTransmitter:]";
      __int16 v50 = 1024;
      int v51 = 7101;
      __int16 v52 = 1024;
      LODWORD(v53) = v17;
      _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Load switch wifiLowTierRedundancyEnabled %d", buf, 0x22u);
    }
  }
  [(VCAudioTransmitterConfig *)v5 setTierPickerMode:+[VCAudioTierPicker operatingModeToTierPickerMode:self->operatingMode isLowLatency:0 preferPlistForTierTable:0]];
  [(VCAudioTransmitterConfig *)v5 setCellularAllowRedLowBitratesEnabled:[(VCAudioTransmitterConfig *)v5 cellularAllowRedLowBitratesEnabled] ^ 1];
  [(VCAudioTransmitterConfig *)v5 setWifiAllowRedLowBitratesEnabled:[(VCAudioTransmitterConfig *)v5 wifiAllowRedLowBitratesEnabled] ^ 1];
  int v18 = [[VCAudioTransmitter alloc] initWithConfig:v5];
  __int16 v19 = v18;
  if (!v18)
  {
    uint64_t v35 = @"Failed to allocate audio transmitter";
    uint64_t v36 = 7112;
    uint64_t v33 = -2147418109;
    uint64_t v34 = @"Could not setup RTP";
    goto LABEL_36;
  }
  self->audioTransmitter = v18;
  if ((VCCallSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_28;
    }
    uint64_t v21 = VRTraceErrorLogLevelToCSTR();
    uint64_t v22 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    audioTransmitter = self->audioTransmitter;
    *(_DWORD *)buf = 136315906;
    uint64_t v47 = v21;
    __int16 v48 = 2080;
    size_t v49 = "-[VCCallSession(PrivateMethods) createAudioTransmitter:]";
    __int16 v50 = 1024;
    int v51 = 7115;
    __int16 v52 = 2048;
    uint64_t v53 = (uint64_t)audioTransmitter;
    double v24 = "VCCallSession [%s] %s:%d audioTransmitter=%p";
    int v25 = v22;
    uint32_t v26 = 38;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      int v20 = (__CFString *)[(VCCallSession *)self performSelector:sel_logPrefix];
    }
    else {
      int v20 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_28;
    }
    uint64_t v27 = VRTraceErrorLogLevelToCSTR();
    int v28 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    int v29 = self->audioTransmitter;
    *(_DWORD *)buf = 136316418;
    uint64_t v47 = v27;
    __int16 v48 = 2080;
    size_t v49 = "-[VCCallSession(PrivateMethods) createAudioTransmitter:]";
    __int16 v50 = 1024;
    int v51 = 7115;
    __int16 v52 = 2112;
    uint64_t v53 = (uint64_t)v20;
    __int16 v54 = 2048;
    long long v55 = self;
    __int16 v56 = 2048;
    long long v57 = v29;
    double v24 = "VCCallSession [%s] %s:%d %@(%p) audioTransmitter=%p";
    int v25 = v28;
    uint32_t v26 = 58;
  }
  _os_log_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);
LABEL_28:
  BOOL v30 = [(VCMediaNegotiator *)self->_mediaNegotiator usePreNegotiation];
  if (v30 || ![(VCCallInfo *)self->remoteCallInfo supportsSpecialAACBundle]) {
    [(VCPacketBundler *)[(VCAudioTransmitter *)self->audioTransmitter audioBundler] setAllowLargePackets:v30];
  }
  [(VCAudioTransmitter *)self->audioTransmitter setDelegate:self];
  if (self->useVCRC)
  {
    [(VCAudioTransmitter *)self->audioTransmitter setTargetBitrate:self->_targetBitrate];
    [(VCAudioTransmitter *)self->audioTransmitter setRateChangeCounter:self->_rateChangeCounter];
  }
  id v31 = (void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self->connectionManager);
  uint64_t v32 = [v31 isWifiToWifi];
  if (v31) {
    CFRelease(v31);
  }
  [(VCAudioTransmitter *)self->audioTransmitter setUseWiFiTiers:v32];
  uint64_t v33 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  uint64_t v36 = 0xFFFFFFFFLL;
LABEL_36:

  if (!v19)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      uint64_t v37 = VRTraceErrorLogLevelToCSTR();
      char IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
      uint64_t v39 = *MEMORY[0x1E4F47A50];
      if (IsOSFaultDisabled)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v40 = objc_msgSend((id)-[__CFString description](v34, "description"), "UTF8String");
          uint64_t v41 = objc_msgSend((id)-[__CFString description](v35, "description"), "UTF8String");
          *(_DWORD *)buf = 136316162;
          uint64_t v47 = v37;
          __int16 v48 = 2080;
          size_t v49 = "-[VCCallSession(PrivateMethods) createAudioTransmitter:]";
          __int16 v50 = 1024;
          int v51 = 7144;
          __int16 v52 = 2080;
          uint64_t v53 = v40;
          __int16 v54 = 2080;
          long long v55 = (VCCallSession *)v41;
          _os_log_error_impl(&dword_1E1EA4000, v39, OS_LOG_TYPE_ERROR, "VCCallSession [%s] %s:%d %s: %s", buf, 0x30u);
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        uint64_t v43 = objc_msgSend((id)-[__CFString description](v34, "description"), "UTF8String");
        uint64_t v44 = objc_msgSend((id)-[__CFString description](v35, "description"), "UTF8String");
        *(_DWORD *)buf = 136316162;
        uint64_t v47 = v37;
        __int16 v48 = 2080;
        size_t v49 = "-[VCCallSession(PrivateMethods) createAudioTransmitter:]";
        __int16 v50 = 1024;
        int v51 = 7144;
        __int16 v52 = 2080;
        uint64_t v53 = v43;
        __int16 v54 = 2080;
        long long v55 = (VCCallSession *)v44;
        _os_log_fault_impl(&dword_1E1EA4000, v39, OS_LOG_TYPE_FAULT, "VCCallSession [%s] %s:%d %s: %s", buf, 0x30u);
      }
    }
    +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a3, 32000, 217, v33, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", v36), v34, v35);
  }
  return v19 != 0;
}

- (BOOL)createRTPHandles:(id *)a3
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  int deviceRole = self->_deviceRole;
  if (deviceRole == 3 || deviceRole == 0) {
    BoolValueForKedouble y = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-facetime-jitter-buffer-mode", @"useErasureSensitiveMode", objc_msgSend(NSNumber, "numberWithInt:", deviceRole != 3), 0), "BOOLValue");
  }
  else {
    BoolValueForKedouble y = VCDefaults_GetBoolValueForKey(@"useErasureSensitiveMode", 1);
  }
  int v8 = BoolValueForKey;
  int v9 = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-facetime-jb-high-start", @"useHighStartMode", objc_msgSend(NSNumber, "numberWithInt:", self->_deviceRole == 0), 0), "BOOLValue");
  uint64_t v50 = 0xFFFFFFFFLL;
  uint64_t v51 = 0xFFFFFFFFLL;
  int v10 = RTPCreateHandle(&v51, 0, 1, 0, -[VCCallSession callID](self, "callID"), (uint64_t)MediaCallback, (uint64_t)self, objc_msgSend(-[VCMediaNegotiatorLocalConfiguration mediaConfigurationForMediaType:](-[VCMediaNegotiatorBase localSettings](self->_mediaNegotiator, "localSettings"), "mediaConfigurationForMediaType:", 1), "ssrc"));
  if (v10 < 0)
  {
    int v16 = v10;
    int v25 = @"Error creating handle";
    uint64_t v26 = 7185;
  }
  else
  {
    if ([(VCMediaNegotiator *)self->_mediaNegotiator usePreNegotiation]) {
      uint64_t v11 = [(VCMediaNegotiatorResults *)[(VCMediaNegotiatorBase *)self->_mediaNegotiator negotiatedSettings] mediaControlInfoVersion];
    }
    else {
      uint64_t v11 = 1;
    }
    uint64_t v12 = (void *)VCMediaControlInfoGeneratorCreateWithTypeAndVersion(0, v11);
    self->audioMediaControlInfoGenerator = v12;
    VCMediaControlInfoGeneratoSetFECFeedbackVersion(v12, (const char *)[(VCCallSession *)self mediaControlInfoFECFeedbackVersion]);
    if ([(VCCapabilities *)self->caps isVideoEnabled]) {
      VCMediaControlInfoGeneratorAddOptions(self->audioMediaControlInfoGenerator, (const char *)1);
    }
    VCMediaControlInfoGeneratorRegisterCallbacks(self->audioMediaControlInfoGenerator, (const char *)self, (uint64_t)VCCallSessionFillMediaControlInfoCallback, (uint64_t)VCCallSessionProcessMediaControlInfoCallback);
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    v64[0] = 1;
    v64[1] = v51;
    *((void *)&v78 + 1) = self->audioMediaControlInfoGenerator;
    LODWORD(v79) = [(VCCallSession *)self callID];
    DWORD1(v79) = v8;
    LODWORD(v83) = 0;
    HIDWORD(v79) = 1;
    LODWORD(v80) = v9;
    BYTE4(v80) = 1;
    *((void *)&v80 + 1) = self->reportingAgent;
    BYTE10(v82) = 0;
    Receiver = VCAudioReceiver_CreateReceiver((uint64_t)v64);
    if (Receiver)
    {
      BOOL v14 = (tagVCAudioReceiver *)Receiver;
      int v15 = RTPSetPacketMultiplexMode(v51, [(VCCallSession *)self mapPacketMultiplexModeToRTPMode:self->packetMultiplexMode]);
      if (v15 < 0)
      {
        int v16 = v15;
        int v25 = @"Error setting VTP mode";
        uint64_t v26 = 7212;
      }
      else
      {
        int v16 = RTPSetConnectionManager(v51, self->connectionManager);
        if ((v16 & 0x80000000) == 0)
        {
          if ([(VCCapabilities *)self->caps isVideoEnabled])
          {
            int operatingMode = self->operatingMode;
            int v18 = [(VCCallSession *)self callID];
            __int16 v19 = [(VCMediaNegotiatorBase *)self->_mediaNegotiator localSettings];
            if (operatingMode == 4) {
              uint64_t v20 = 3;
            }
            else {
              uint64_t v20 = 2;
            }
            int v21 = RTPCreateHandle(&v50, 1u, 1, 0, v18, (uint64_t)MediaCallback, (uint64_t)self, objc_msgSend(-[VCMediaNegotiatorLocalConfiguration mediaConfigurationForMediaType:](v19, "mediaConfigurationForMediaType:", v20), "ssrc"));
            if (v21 < 0)
            {
              int v16 = v21;
              int v25 = @"Error creating video handle";
              uint64_t v26 = 7221;
              uint64_t v24 = 218;
              goto LABEL_46;
            }
            uint64_t v22 = (void *)VCMediaControlInfoGeneratorCreateWithTypeAndVersion(1, v11);
            self->videoMediaControlInfoGenerator = v22;
            VCMediaControlInfoGeneratoSetFECFeedbackVersion(v22, (const char *)[(VCCallSession *)self mediaControlInfoFECFeedbackVersion]);
            VCMediaControlInfoGeneratorRegisterCallbacks(self->videoMediaControlInfoGenerator, (const char *)self, (uint64_t)VCCallSessionFillMediaControlInfoCallback, (uint64_t)VCCallSessionProcessMediaControlInfoCallback);
            int v23 = RTPSetPacketMultiplexMode(v50, [(VCCallSession *)self mapPacketMultiplexModeToRTPMode:self->packetMultiplexMode]);
            if (v23 < 0)
            {
              int v16 = v23;
              int v25 = @"Error setting VTP mode";
              uint64_t v26 = 7226;
              uint64_t v24 = 218;
              uint64_t v40 = @"Could not setup video RTP";
LABEL_47:
              VCAudioReceiver_Finalize(&v14->var0.var0);
              if (v50 != 0xFFFFFFFFLL) {
                CheckOutHandleDebug();
              }
              goto LABEL_49;
            }
            int v16 = RTPSetAudioReceiver(v50, (uint64_t)v14);
            uint64_t v24 = 218;
            if (v16 < 0)
            {
              int v25 = @"Failed to associate audio/video handles";
              uint64_t v26 = 7228;
LABEL_46:
              uint64_t v40 = @"Could not setup RTP";
              goto LABEL_47;
            }
          }
          else
          {
            uint64_t v24 = 217;
          }
          uint64_t v27 = [[VCCaptionsReceiver alloc] initWithDelegate:self];
          self->_captionsReceiver = v27;
          if (!v27)
          {
            int v25 = @"Failed to create the captions receiver";
            uint64_t v26 = 7233;
            goto LABEL_46;
          }
          int v28 = (tagHANDLE *)v50;
          self->rtpHandle = (tagHANDLE *)v51;
          self->rtpVideo = v28;
          self->audioReceiver = v14;
          if ((VCCallSession *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
              return 1;
            }
            uint64_t v30 = VRTraceErrorLogLevelToCSTR();
            id v31 = *MEMORY[0x1E4F47A50];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
              return 1;
            }
            audioReceiver = self->audioReceiver;
            *(_DWORD *)buf = 136315906;
            uint64_t v53 = v30;
            __int16 v54 = 2080;
            long long v55 = "-[VCCallSession(PrivateMethods) createRTPHandles:]";
            __int16 v56 = 1024;
            int v57 = 7239;
            __int16 v58 = 2048;
            uint64_t v59 = (uint64_t)audioReceiver;
            uint64_t v33 = "VCCallSession [%s] %s:%d audioReceiver=%p";
            uint64_t v34 = v31;
            uint32_t v35 = 38;
          }
          else
          {
            if (objc_opt_respondsToSelector()) {
              int v29 = (__CFString *)[(VCCallSession *)self performSelector:sel_logPrefix];
            }
            else {
              int v29 = &stru_1F3D3E450;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
              return 1;
            }
            uint64_t v36 = VRTraceErrorLogLevelToCSTR();
            uint64_t v37 = *MEMORY[0x1E4F47A50];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
              return 1;
            }
            int v38 = self->audioReceiver;
            *(_DWORD *)buf = 136316418;
            uint64_t v53 = v36;
            __int16 v54 = 2080;
            long long v55 = "-[VCCallSession(PrivateMethods) createRTPHandles:]";
            __int16 v56 = 1024;
            int v57 = 7239;
            __int16 v58 = 2112;
            uint64_t v59 = (uint64_t)v29;
            __int16 v60 = 2048;
            long long v61 = self;
            __int16 v62 = 2048;
            int v63 = v38;
            uint64_t v33 = "VCCallSession [%s] %s:%d %@(%p) audioReceiver=%p";
            uint64_t v34 = v37;
            uint32_t v35 = 58;
          }
          _os_log_impl(&dword_1E1EA4000, v34, OS_LOG_TYPE_DEFAULT, v33, buf, v35);
          return 1;
        }
        int v25 = @"Error setting connectionManager";
        uint64_t v26 = 7215;
      }
      uint64_t v24 = 217;
      goto LABEL_46;
    }
    int v25 = @"Failed to initialize audio receiver";
    int v16 = -2147418109;
    uint64_t v26 = 7209;
  }
  uint64_t v24 = 217;
  uint64_t v40 = @"Could not setup RTP";
LABEL_49:
  if (v51 != 0xFFFFFFFFLL) {
    CheckOutHandleDebug();
  }
  if (v16 < 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      uint64_t v41 = VRTraceErrorLogLevelToCSTR();
      char IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
      uint64_t v43 = *MEMORY[0x1E4F47A50];
      if (IsOSFaultDisabled)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v48 = v26;
          uint64_t v44 = [(__CFString *)v40 UTF8String];
          uint64_t v45 = [(__CFString *)v25 UTF8String];
          *(_DWORD *)buf = 136316162;
          uint64_t v53 = v41;
          __int16 v54 = 2080;
          long long v55 = "-[VCCallSession(PrivateMethods) createRTPHandles:]";
          __int16 v56 = 1024;
          int v57 = 7259;
          __int16 v58 = 2080;
          uint64_t v59 = v44;
          uint64_t v26 = v48;
          __int16 v60 = 2080;
          long long v61 = (VCCallSession *)v45;
          _os_log_error_impl(&dword_1E1EA4000, v43, OS_LOG_TYPE_ERROR, "VCCallSession [%s] %s:%d %s: %s", buf, 0x30u);
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        uint64_t v49 = v26;
        uint64_t v46 = [(__CFString *)v40 UTF8String];
        uint64_t v47 = [(__CFString *)v25 UTF8String];
        *(_DWORD *)buf = 136316162;
        uint64_t v53 = v41;
        __int16 v54 = 2080;
        long long v55 = "-[VCCallSession(PrivateMethods) createRTPHandles:]";
        __int16 v56 = 1024;
        int v57 = 7259;
        __int16 v58 = 2080;
        uint64_t v59 = v46;
        uint64_t v26 = v49;
        __int16 v60 = 2080;
        long long v61 = (VCCallSession *)v47;
        _os_log_fault_impl(&dword_1E1EA4000, v43, OS_LOG_TYPE_FAULT, "VCCallSession [%s] %s:%d %s: %s", buf, 0x30u);
      }
    }
    +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a3, 32000, v24, v16, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", v26), v40, v25);
  }
  return 0;
}

- (void)releaseRTPHandles
{
  RTPSetAudioReceiver((uint64_t)self->rtpVideo, 0);
  self->rtpHandle = (tagHANDLE *)0xFFFFFFFFLL;
  self->rtpVideo = (tagHANDLE *)0xFFFFFFFFLL;
  VCAudioReceiver_Finalize(&self->audioReceiver->var0.var0);
  audioTransmitter = self->audioTransmitter;
  *(_OWORD *)&self->audioReceiver = 0u;

  RTPCloseHandle();

  RTPCloseHandle();
}

- (BOOL)prepareSRTPWithError:(id *)a3
{
  if (![(VCCapabilities *)self->caps isKeyExchangeEnabled]
    && ![(VCCapabilities *)self->caps isDTLSEnabled])
  {
    return 1;
  }
  p_srtpLock = &self->srtpLock;
  pthread_mutex_lock(&self->srtpLock);
  self->didPrepareSRTP = 1;
  int v6 = SRTPPrepareEncryption();
  if ([(VCCapabilities *)self->caps isVideoEnabled]) {
    int v7 = SRTPPrepareEncryption();
  }
  else {
    int v7 = 0;
  }
  pthread_mutex_unlock(p_srtpLock);
  BOOL v8 = v6 >= 0;
  if ((v6 & 0x80000000) == 0) {
    goto LABEL_14;
  }
  +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a3, 32000, 259, v6, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 7315), @"Could not prepare SRTP for audio RTP handle", @"Error calling SRTPPrepareEncryption");
  if ((int)VRTraceGetErrorLogLevelForModule() < 2) {
    goto LABEL_14;
  }
  VRTraceErrorLogLevelToCSTR();
  if (VRTraceIsOSFaultDisabled())
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      -[VCCallSession(PrivateMethods) prepareSRTPWithError:]();
      if ((v7 & 0x80000000) == 0) {
        return v8;
      }
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
  {
LABEL_14:
    if ((v7 & 0x80000000) == 0) {
      return v8;
    }
    goto LABEL_15;
  }
  -[VCCallSession(PrivateMethods) prepareSRTPWithError:].cold.4();
  if ((v7 & 0x80000000) == 0) {
    return v8;
  }
LABEL_15:
  +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a3, 32000, 259, v7, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 7327), @"Could not prepare SRTP for video RTP handle", @"Error calling SRTPPrepareEncryption");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
  {
    VRTraceErrorLogLevelToCSTR();
    if (VRTraceIsOSFaultDisabled())
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCallSession(PrivateMethods) prepareSRTPWithError:]();
      }
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
    {
      -[VCCallSession(PrivateMethods) prepareSRTPWithError:]();
    }
  }
  return 0;
}

- (BOOL)createMediaQueueHandle:(id *)a3
{
  int Handle = MediaQueue_CreateHandle((uint64_t *)&self->hMediaQueue, (uint64_t)self->rtpHandle);
  if (Handle < 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if (VRTraceIsOSFaultDisabled())
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCallSession(PrivateMethods) createMediaQueueHandle:]();
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        -[VCCallSession(PrivateMethods) createMediaQueueHandle:]();
      }
    }
    +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a3, 32000, 219, Handle, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 7346), @"Could not setup media queue", @"Error creating handle");
  }
  else
  {
    MediaQueue_SetFECFeedbackVersion((uint64_t)self->hMediaQueue, [(VCCallSession *)self mediaControlInfoFECFeedbackVersion]);
  }
  return Handle >= 0;
}

+ (id)getDecodePayloadTypes:(int)a3 secondaryPayloadTypes:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a4, "count") + 1);
  objc_msgSend(v6, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v5));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [a4 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(a4);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = [v11 intValue];
        if (v12 != v5
          && +[VCPayloadUtils isPayloadSupportedInFaceTime:v12])
        {
          [v6 addObject:v11];
        }
      }
      uint64_t v8 = [a4 countByEnumeratingWithState:&v15 objects:v14 count:16];
    }
    while (v8);
  }
  return v6;
}

- (void)negotiateFeaturesString:(id)a3 forPayload:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v29[3] = *MEMORY[0x1E4F143B8];
  bzero(v17, 0xC80uLL);
  id v7 = [(VCCallSession *)self pickFeaturesStringForPayload:v4 featureListDict:[(VCCallSession *)self allPayloadsLocalFeaturesString] remote:0];
  id v8 = -[VCCallSession pickFeaturesStringForPayload:featureListDict:remote:](self, "pickFeaturesStringForPayload:featureListDict:remote:", v4, [a3 featureListDict], 1);
  if ([(VCCallSession *)self setMatchedFeaturesString:v17 localFeaturesString:v7 remoteFeaturesString:v8])
  {
    v28[0] = @"matchedFeatureListString";
    v29[0] = [NSString stringWithUTF8String:v17];
    v29[1] = v7;
    v28[1] = @"localFeatureListString";
    v28[2] = @"remoteFeatureListString";
    v29[2] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:3];
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->featureListStringDict, "setObject:forKeyedSubscript:", v9, [NSNumber numberWithInt:v4]);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v19 = v10;
        __int16 v20 = 2080;
        int v21 = "-[VCCallSession(PrivateMethods) negotiateFeaturesString:forPayload:]";
        __int16 v22 = 1024;
        int v23 = 7395;
        __int16 v24 = 2080;
        int v25 = v17;
        __int16 v26 = 1024;
        int v27 = v4;
        uint64_t v12 = "VCCallSession [%s] %s:%d matched FeaturesString = [%s], for payload %d";
        int v13 = v11;
        uint32_t v14 = 44;
LABEL_8:
        _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    long long v16 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v19 = v15;
      __int16 v20 = 2080;
      int v21 = "-[VCCallSession(PrivateMethods) negotiateFeaturesString:forPayload:]";
      __int16 v22 = 1024;
      int v23 = 7397;
      __int16 v24 = 1024;
      LODWORD(v25) = v4;
      uint64_t v12 = "VCCallSession [%s] %s:%d setMatchedFeaturesString returned NO for payload %d";
      int v13 = v16;
      uint32_t v14 = 34;
      goto LABEL_8;
    }
  }
}

- (BOOL)negotiatePayloads:(id *)a3 withError:(id *)a4
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  unsigned int v7 = [(VCCallInfo *)self->localCallInfo callID];
  id v8 = [[SDPMini alloc] initWithString:[(VCCallInfo *)self->remoteCallInfo sdpString]];
  if (v8)
  {
    uint64_t v9 = v8;
    unsigned int v83 = v7;
    long long v84 = a4;
    id v10 = [(SDPMini *)v8 getMediaLineForType:2];
    [(VCCallInfo *)self->remoteCallInfo setSdp:v9];
    objc_msgSend((id)objc_msgSend(v10, "imageAttributeRules"), "swapSendAndReceiveRules");
    [(VCCallInfo *)self->remoteCallInfo setSupportsDynamicMaxBitrate:[(SDPMini *)v9 allowsDynamicMaxBitrate]];
    [(VCCallInfo *)self->remoteCallInfo setAuNumber:[(NSNumber *)[(SDPMini *)v9 audioUnitModel] unsignedIntegerValue]];
    [(VCCallInfo *)self->remoteCallInfo setMaxBandwidth:[(NSNumber *)[(SDPMini *)v9 maxBandwidth] unsignedIntegerValue]];
    self->unsigned int callSessionBitrate = [(NSNumber *)[(SDPMini *)v9 answerBandwidth] unsignedIntegerValue];
    if ([(VCCallSession *)self deviceRole] == 1)
    {
      id v87 = 0;
      id v88 = 0;
      if ([(SDPMini *)v9 getBasebandCodecType:&v88 sampleRate:&v87])
      {
        [(VCCallSession *)self setBasebandCodecType:v88];
        [(VCCallSession *)self setBasebandCodecSampleRate:v87];
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v11 = VRTraceErrorLogLevelToCSTR();
          uint64_t v12 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v13 = [v88 UTF8String];
            int v14 = [v87 intValue];
            *(_DWORD *)buf = 136316162;
            uint64_t v95 = v11;
            __int16 v96 = 2080;
            __int16 v97 = "-[VCCallSession(PrivateMethods) negotiatePayloads:withError:]";
            __int16 v98 = 1024;
            int v99 = 7435;
            __int16 v100 = 2080;
            *(void *)v101 = v13;
            *(_WORD *)&v101[8] = 1024;
            v102[0] = v14;
            _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d SDP has basebandCodecType:%s, sampleRate:%d", buf, 0x2Cu);
          }
        }
      }
    }
    if (self->allowAudioRecording || [(SDPMini *)v9 allowAudioRecording])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        long long v16 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          if (self->allowAudioRecording)
          {
            BOOL v17 = [(SDPMini *)v9 allowAudioRecording];
            BOOL allowAudioRecording = self->allowAudioRecording;
          }
          else
          {
            BOOL allowAudioRecording = 0;
            BOOL v17 = 0;
          }
          BOOL v20 = [(SDPMini *)v9 allowAudioRecording];
          *(_DWORD *)buf = 136316418;
          uint64_t v95 = v15;
          __int16 v96 = 2080;
          __int16 v97 = "-[VCCallSession(PrivateMethods) negotiatePayloads:withError:]";
          __int16 v98 = 1024;
          int v99 = 7441;
          __int16 v100 = 1024;
          *(_DWORD *)v101 = v17;
          *(_WORD *)&v101[4] = 1024;
          *(_DWORD *)&v101[6] = allowAudioRecording;
          LOWORD(v102[0]) = 1024;
          *(_DWORD *)((char *)v102 + 2) = v20;
          _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d AllowAudioRecording: %d (local: %d remote: %d)", buf, 0x2Eu);
        }
      }
      BOOL v21 = self->allowAudioRecording && [(SDPMini *)v9 allowAudioRecording];
      self->BOOL allowAudioRecording = v21;
    }
    BOOL v22 = self->isRTCPFBEnabled && [(SDPMini *)v9 allowRTCPFB];
    self->BOOL isRTCPFBEnabled = v22;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v23 = VRTraceErrorLogLevelToCSTR();
      __int16 v24 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL isRTCPFBEnabled = self->isRTCPFBEnabled;
        *(_DWORD *)buf = 136315906;
        uint64_t v95 = v23;
        __int16 v96 = 2080;
        __int16 v97 = "-[VCCallSession(PrivateMethods) negotiatePayloads:withError:]";
        __int16 v98 = 1024;
        int v99 = 7447;
        __int16 v100 = 1024;
        *(_DWORD *)v101 = isRTCPFBEnabled;
        _os_log_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d BOOL isRTCPFBEnabled = %d", buf, 0x22u);
      }
    }
    if (![(NSMutableArray *)[(SDPMini *)v9 secondaryAudioPayloads] count]
      && self->preferredAudioCodec == 104
      && !self->_deviceRole)
    {
      self->preferredAudioCodec = 105;
    }
    if ([(SDPMini *)v9 aacBlockSize])
    {
      int v26 = [(NSNumber *)[(SDPMini *)v9 aacBlockSize] intValue];
      if (v26 > self->aacBlockSize) {
        self->aacBlockSize = v26;
      }
    }
    else
    {
      self->aacBlockSize = 512;
    }
    RTPSetRemoteSSRC((uint64_t)self->rtpHandle, [(NSNumber *)[(SDPMini *)v9 audioRTPID] intValue]);
    RTPSetRemoteSSRC((uint64_t)self->rtpVideo, [v10 rtpId]);
    RTPSetCellularUniqueTag((uint64_t)self->rtpHandle, [(VCTransportSession *)self->_transportSession basebandNotificationRegistrationToken]);
    int v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithArray:", objc_msgSend(v10, "payloads"));
    [v27 removeObject:&unk_1F3DC48A8];
    uint64_t v28 = [v27 count];
    long long v85 = v79;
    uint64_t v29 = v28;
    size_t v30 = 4 * v28;
    uint64_t v31 = (v30 + 15) & 0x7FFFFFFF0;
    uint64_t v32 = (unsigned int *)&v79[-v31];
    if (v28) {
      memset(&v79[-v31], 170, v30);
    }
    long long v86 = (NSMutableArray *)a3;
    if ((int)v28 >= 1)
    {
      uint64_t v33 = 0;
      do
      {
        v32[v33] = objc_msgSend((id)objc_msgSend(v27, "objectAtIndexedSubscript:", v33), "intValue");
        ++v33;
      }
      while (v28 != v33);
    }
    uint64_t v34 = [(SDPMini *)v9 audioPayloads];
    uint64_t v35 = [(SDPMini *)v9 secondaryAudioPayloads];
    +[VCCallSession setRxPayloadList:self->rtpHandle withPayloadTypes:v34];
    rtpVideo = self->rtpVideo;
    uint64_t v81 = v28;
    RTPSetRxPayloadList((uint64_t)rtpVideo, v28, v32);
    RTPSetRTCPFB((uint64_t)self->rtpVideo, [(SDPMini *)v9 allowRTCPFB]);
    if ([(NSMutableArray *)v34 count]) {
      self->_isUseCaseWatchContinuitdouble y = +[VCPayloadUtils isUseCaseWatchContinuity:primaryPayload:](VCPayloadUtils, "isUseCaseWatchContinuity:primaryPayload:", self->_deviceRole, objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](v34, "objectAtIndexedSubscript:", 0), "intValue"));
    }
    if (![(VCCallSession *)self choosePayload:v34])
    {
      int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      uint64_t v38 = v83;
      if (ErrorLogLevelForModule >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if (VRTraceIsOSFaultDisabled())
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCCallSession(PrivateMethods) negotiatePayloads:withError:].cold.7();
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
        {
          -[VCCallSession(PrivateMethods) negotiatePayloads:withError:].cold.8();
        }
      }
      SIPHangup((uint64_t *)&self->hSIP, v38, 222);
      uint64_t v53 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 7502);
      +[GKVoiceChatError getNSError:v84 code:32002 detailedCode:222 filePath:v53 description:@"Could not find a compatible codec.  The remote participant may be using an incompatible version." reason:@"No matching codec"];
      [(VCCapabilities *)self->caps setActualAudioCodec:0xFFFFFFFFLL];
      goto LABEL_81;
    }
    long long v82 = v9;
    if (!+[VCPayloadUtils isUseCaseWatchContinuity:self->_deviceRole primaryPayload:[(VCAudioPayloadConfig *)[(VCAudioPayload *)self->currentAudioPayload config] payload]])
    {
      if (!self->allowAudioSwitching
        || [(VCCallSession *)self chooseSecondaryPayloads:v35])
      {
LABEL_53:
        if (!self->isGKVoiceChat)
        {
          int operatingMode = self->operatingMode;
          if (operatingMode == 7 || operatingMode == 2) {
            [(VCCallSession *)self chooseDTXPayloads:v34];
          }
        }
        [(VCCapabilities *)self->caps setActualAudioCodec:[(VCAudioPayloadConfig *)[(VCAudioPayload *)self->currentAudioPayload config] payload]];
        uint64_t v40 = +[VCCallSession getDecodePayloadTypes:[(VCAudioPayloadConfig *)[(VCAudioPayload *)self->currentAudioPayload config] payload] secondaryPayloadTypes:v35];
        uint64_t v9 = v82;
        if (v86) {
          v86->super.super.isa = v40;
        }
        uint64_t IsInterfaceOnCellularForActiveConnectionWithQuality = VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality((uint64_t)self->connectionManager, 1, 1);
        uint64_t v42 = VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality((uint64_t)self->connectionManager, 1, 0);
        if (![(VCCapabilities *)self->caps isDuplexAudioOnly])
        {
          unsigned int v43 = self->operatingMode;
          if (v43 == 4) {
            uint64_t v44 = 1;
          }
          else {
            uint64_t v44 = v43;
          }
          if (![(VCCallSession *)self chooseVideoPayload:v27 operatingMode:v44 isLocalOnCellular:IsInterfaceOnCellularForActiveConnectionWithQuality isRemoteOnCellular:v42]&& [(VCCapabilities *)self->caps isDuplexVideoOnly])
          {
            int v45 = VRTraceGetErrorLogLevelForModule();
            uint64_t v46 = v83;
            if (v45 >= 2)
            {
              VRTraceErrorLogLevelToCSTR();
              if (VRTraceIsOSFaultDisabled())
              {
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                  -[VCCallSession(PrivateMethods) negotiatePayloads:withError:].cold.4();
                }
              }
              else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
              {
                -[VCCallSession(PrivateMethods) negotiatePayloads:withError:].cold.5();
              }
            }
            [(VCCapabilities *)self->caps setActualVideoCodec:0xFFFFFFFFLL];
            SIPHangup((uint64_t *)&self->hSIP, v46, 223);
            uint64_t v78 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 7551);
            +[GKVoiceChatError getNSError:v84 code:32002 detailedCode:223 filePath:v78 description:@"Could not find a compatible codec.  The remote participant may be using an incompatible version." reason:@"No matching codec"];
LABEL_81:

            [(VCCallInfo *)self->remoteCallInfo setSdp:0];
            return 0;
          }
          id v47 = [(SDPMini *)v9 getMediaLineForType:3];
          objc_msgSend((id)objc_msgSend(v47, "imageAttributeRules"), "swapSendAndReceiveRules");
          self->screenPayload = 0;
          long long v90 = 0u;
          long long v91 = 0u;
          long long v92 = 0u;
          long long v93 = 0u;
          long long v86 = [+[VCVideoRuleCollectionsScreen sharedInstance] supportedPayloads];
          uint64_t v48 = [(NSMutableArray *)v86 countByEnumeratingWithState:&v90 objects:v89 count:16];
          if (v48)
          {
            uint64_t v49 = v48;
            uint64_t v50 = *(void *)v91;
            int v80 = IsInterfaceOnCellularForActiveConnectionWithQuality;
            while (2)
            {
              for (uint64_t i = 0; i != v49; ++i)
              {
                if (*(void *)v91 != v50) {
                  objc_enumerationMutation(v86);
                }
                __int16 v52 = *(void **)(*((void *)&v90 + 1) + 8 * i);
                if (objc_msgSend((id)objc_msgSend(v47, "payloads"), "containsObject:", v52))
                {
                  self->screenPayload = [v52 integerValue];
                  uint64_t v9 = v82;
                  LODWORD(IsInterfaceOnCellularForActiveConnectionWithQuality) = v80;
                  goto LABEL_83;
                }
              }
              uint64_t v49 = [(NSMutableArray *)v86 countByEnumeratingWithState:&v90 objects:v89 count:16];
              uint64_t v9 = v82;
              LODWORD(IsInterfaceOnCellularForActiveConnectionWithQuality) = v80;
              if (v49) {
                continue;
              }
              break;
            }
          }
        }
LABEL_83:

        if (!self->isGKVoiceChat)
        {
          int v65 = self->operatingMode;
          if (v65 == 4 || v65 == 1)
          {
            if ((int)v81 >= 1)
            {
              do
              {
                unsigned int v66 = *v32++;
                [(VCCallSession *)self negotiateFeaturesString:v9 forPayload:v66];
                --v29;
              }
              while (v29);
            }
            int v67 = [(VCCallSession *)self applyFeatureListStringForPayload:LODWORD(self->videoPayload)];
            if (v67 < 0)
            {
              int v74 = v67;
              int v75 = VRTraceGetErrorLogLevelForModule();
              long long v76 = v84;
              uint64_t v77 = v83;
              if (v75 >= 2)
              {
                VRTraceErrorLogLevelToCSTR();
                if (VRTraceIsOSFaultDisabled())
                {
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                    -[VCCallSession(PrivateMethods) negotiatePayloads:withError:]();
                  }
                }
                else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
                {
                  -[VCCallSession(PrivateMethods) negotiatePayloads:withError:]();
                }
              }
              [(VCCapabilities *)self->caps setActualVideoCodec:0xFFFFFFFFLL];
              SIPHangup((uint64_t *)&self->hSIP, v77, 221);
              +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", v76, 32002, 221, v74, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 7591), @"SetBWEstMode critical failure.", @"Bad SDP.");

              goto LABEL_137;
            }
            [(VCCapabilities *)self->caps setActualVideoCodec:LODWORD(self->videoPayload)];
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v68 = VRTraceErrorLogLevelToCSTR();
              long long v69 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
              {
                int64_t videoPayload = self->videoPayload;
                *(_DWORD *)buf = 136315906;
                uint64_t v95 = v68;
                __int16 v96 = 2080;
                __int16 v97 = "-[VCCallSession(PrivateMethods) negotiatePayloads:withError:]";
                __int16 v98 = 1024;
                int v99 = 7601;
                __int16 v100 = 1024;
                *(_DWORD *)v101 = videoPayload;
                _os_log_impl(&dword_1E1EA4000, v69, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d ===== Actual Video Payload (%d) =====", buf, 0x22u);
              }
            }
          }
        }
        BOOL v54 = 0;
        unsigned int deviceRole = self->_deviceRole;
        if (deviceRole <= 5 && ((1 << deviceRole) & 0x29) != 0) {
          BOOL v54 = [(VCTransportSession *)self->_transportSession isHandoverSupported];
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v56 = VRTraceErrorLogLevelToCSTR();
          int v57 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            __int16 v58 = "NOT ";
            uint64_t v95 = v56;
            *(_DWORD *)buf = 136315906;
            __int16 v97 = "-[VCCallSession(PrivateMethods) negotiatePayloads:withError:]";
            __int16 v96 = 2080;
            if (v54) {
              __int16 v58 = "";
            }
            __int16 v98 = 1024;
            int v99 = 7605;
            __int16 v100 = 2080;
            *(void *)v101 = v58;
            _os_log_impl(&dword_1E1EA4000, v57, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d HandoverReport: handover is %ssupported.", buf, 0x26u);
          }
        }
        [(VCConnectionManager *)self->connectionManager setSupportDuplication:v54];
        if (!self->useRateControl || [(VCCallSession *)self startRateControl:v84])
        {
          hAFRC = self->hAFRC;
          if (hAFRC != (tagHANDLE *)0xFFFFFFFFLL) {
            AFRCSetAudioPayload((uint64_t)hAFRC, [(VCAudioPayloadConfig *)[(VCAudioPayload *)self->currentAudioPayload config] payload], [(VCAudioPayload *)self->currentAudioPayload bitrate]);
          }
          [(VCCallSession *)self lock];
          if (self->useRateControl) {
            int v60 = IsInterfaceOnCellularForActiveConnectionWithQuality;
          }
          else {
            int v60 = 0;
          }
          if (v60 == 1) {
            [(VCCallSession *)self setupWCMClient];
          }
          [(VCCallSession *)self unlock];
          [(VCCallSession *)self lock];
          if (self->useRateControl)
          {
            unsigned int v61 = self->operatingMode;
            if (v61 <= 7 && ((1 << v61) & 0x96) != 0 && self->iRATSuggestionEnabled)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                uint64_t v62 = VRTraceErrorLogLevelToCSTR();
                int v63 = *MEMORY[0x1E4F47A50];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315650;
                  uint64_t v95 = v62;
                  __int16 v96 = 2080;
                  __int16 v97 = "-[VCCallSession(PrivateMethods) negotiatePayloads:withError:]";
                  __int16 v98 = 1024;
                  int v99 = 7630;
                  _os_log_impl(&dword_1E1EA4000, v63, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d HandoverReport: iRAT recommendation is enabled.", buf, 0x1Cu);
                }
              }
              wrmInfo = self->wrmInfo;
              if (wrmInfo) {
                WRMInitialize((uint64_t)wrmInfo, (uint64_t)self->rtpHandle);
              }
              [(VCCallSession *)self setupWRMClient];
            }
          }
          [(VCCallSession *)self unlock];

          return 1;
        }

LABEL_137:
        [(VCCallInfo *)self->remoteCallInfo setSdp:0];
        return 0;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        uint64_t v71 = VRTraceErrorLogLevelToCSTR();
        long long v72 = *MEMORY[0x1E4F47A50];
        long long v73 = *MEMORY[0x1E4F47A50];
        if (*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            uint64_t v95 = v71;
            __int16 v96 = 2080;
            __int16 v97 = "-[VCCallSession(PrivateMethods) negotiatePayloads:withError:]";
            __int16 v98 = 1024;
            int v99 = 7518;
            _os_log_impl(&dword_1E1EA4000, v72, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Not using secondary audio, no codecs found", buf, 0x1Cu);
          }
        }
        else if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
        {
          -[VCCallSession(PrivateMethods) negotiatePayloads:withError:].cold.6();
        }
      }
    }
    self->allowAudioSwitching = 0;
    goto LABEL_53;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCCallSession(PrivateMethods) negotiatePayloads:withError:]();
    }
  }
  +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a4, 32002, 221, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 7410), @"Unable to parse session description. The remote participant may be using an incompatible version.", @"Bad SDP.");
  return 0;
}

- (BOOL)negotiateMaxBandwidth:(int *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return a3 != 0;
  }
  uint64_t v5 = (const void *)VCConnectionManager_CopyConnectionForQuality((uint64_t)self->connectionManager, 1);
  uint64_t v6 = VCBitrateArbiter_ModeFromOperatingMode(self->operatingMode);
  int v7 = [(VCBitrateArbiter *)self->callSessionBitrateArbiter maxAllowedBitrateForVCConnection:v5 forLocalInterface:1 arbiterMode:v6 encodeRule:self->_currentEncodeRule];
  uint64_t callSessionBitrate = self->callSessionBitrate;
  uint64_t v9 = (const void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self->connectionManager);
  if (VCConnection_IsRemoteOnCellular((uint64_t)v9)) {
    [(VCCallInfo *)self->remoteCallInfo setCellBandwidth:callSessionBitrate];
  }
  if (v9) {
    CFRelease(v9);
  }
  if (!callSessionBitrate)
  {
    if (![(VCCallSession *)self isLocalOrRemoteOnCellular])
    {
      LODWORD(callSessionBitrate) = 300;
      if (!v5) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
    int v10 = [(VCBitrateArbiter *)self->callSessionBitrateArbiter maxAllowedBitrateForVCConnection:v5 forLocalInterface:0 arbiterMode:v6 encodeRule:self->_currentEncodeRule];
    if (v10 <= 100) {
      LODWORD(callSessionBitrate) = 100;
    }
    else {
      LODWORD(callSessionBitrate) = v10;
    }
  }
  if (v5) {
LABEL_12:
  }
    CFRelease(v5);
LABEL_13:
  if (v7 >= (int)callSessionBitrate) {
    int v11 = callSessionBitrate;
  }
  else {
    int v11 = v7;
  }
  *a3 = v11;
  if (self->operatingMode == 4) {
    signed int carrierBitrateCap = [(VCBitrateArbiter *)self->callSessionBitrateArbiter maxAllowedScreenShareCellularBitrate];
  }
  else {
    signed int carrierBitrateCap = self->carrierBitrateCap;
  }
  BOOL v13 = [(VCCallSession *)self treatAsCellular];
  signed int v14 = *a3;
  if (v13 && v14 > carrierBitrateCap)
  {
    *a3 = carrierBitrateCap;
    signed int v14 = carrierBitrateCap;
  }
  self->uint64_t callSessionBitrate = v14;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    long long v16 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v17 = *a3;
      int v21 = 136316418;
      uint64_t v22 = v15;
      __int16 v23 = 2080;
      __int16 v24 = "-[VCCallSession(PrivateMethods) negotiateMaxBandwidth:]";
      __int16 v25 = 1024;
      int v26 = 7682;
      __int16 v27 = 1024;
      int v28 = v7;
      __int16 v29 = 1024;
      int v30 = callSessionBitrate;
      __int16 v31 = 1024;
      int v32 = v17;
      _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d localMaxBandwidth: %d remoteMaxBandwidth: %d answerBandwidth: %d", (uint8_t *)&v21, 0x2Eu);
    }
  }
  int operatingMode = self->operatingMode;
  if (operatingMode == 7 || operatingMode == 2)
  {
    uint64_t v19 = [(VCCallSession *)self currentAudioCap];
    AFRCSetTxCap((uint64_t)self->hAFRC, v19);
    [(AVCRateController *)self->_rateController setTargetBitrateCap:v19];
  }
  return a3 != 0;
}

- (BOOL)canNegotiateVideoPayload:(int)a3 supportedPayloads:(id)a4 isLocalOnCellular:(BOOL)a5 isRemoteOnCellular:(BOOL)a6
{
  if (a3 == 100)
  {
    if ([(VCMediaNegotiator *)self->_mediaNegotiator usePreNegotiation])
    {
      if (([(NSMutableArray *)[(VCVideoRuleCollections *)[(VCMediaNegotiatorResultsVideo *)[(VCMediaNegotiatorBase *)self->_mediaNegotiator negotiatedVideoSettings] videoRuleCollections] supportedPayloads] containsObject:&unk_1F3DC48A8] & 1) == 0)
      {
        LOBYTE(v7) = 0;
        return v7;
      }
    }
    else
    {
      int v7 = [(VCCallSession *)self doesVideoPayloadMatchRemoteImageAttributeRules:&unk_1F3DC48A8];
      if (!v7) {
        return v7;
      }
    }
    if (![+[VCDefaults sharedInstance] forceHWI]
      || [+[VCDefaults sharedInstance] forceVideoPayload] != 100)
    {
      LOBYTE(v7) = 1;
      return v7;
    }
    id v8 = &unk_1F3DC48A8;
  }
  else
  {
    if (a3 != 123)
    {
      LOBYTE(v7) = a3 == 126;
      return v7;
    }
    id v8 = &unk_1F3DC48F0;
  }

  LOBYTE(v7) = objc_msgSend(a4, "containsObject:", v8, a4, a5, a6);
  return v7;
}

- (BOOL)chooseVideoPayload:(id)a3 operatingMode:(int)a4 isLocalOnCellular:(BOOL)a5 isRemoteOnCellular:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (![a3 count]) {
    return 0;
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v11 = [a3 countByEnumeratingWithState:&v37 objects:v36 count:16];
  if (!v11)
  {
    if (a4 == 4)
    {
LABEL_20:
      BOOL v19 = 0;
      self->int64_t videoPayload = 128;
      return v19;
    }
    goto LABEL_31;
  }
  uint64_t v12 = v11;
  BOOL v27 = v6;
  char v13 = 0;
  char v14 = 0;
  char v15 = 0;
  uint64_t v16 = *(void *)v38;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v38 != v16) {
        objc_enumerationMutation(a3);
      }
      int v18 = [*(id *)(*((void *)&v37 + 1) + 8 * i) unsignedIntValue];
      switch(v18)
      {
        case 'd':
          char v15 = 1;
          break;
        case '{':
          char v14 = 1;
          break;
        case '~':
          char v13 = 1;
          break;
      }
    }
    uint64_t v12 = [a3 countByEnumeratingWithState:&v37 objects:v36 count:16];
  }
  while (v12);
  if (a4 == 4)
  {
    if (v14)
    {
      self->int64_t videoPayload = 123;
      return 1;
    }
    goto LABEL_20;
  }
  if (v15)
  {
    int64_t v20 = 100;
    if ([(VCCallSession *)self canNegotiateVideoPayload:100 supportedPayloads:[+[VCVideoRuleCollectionsCamera sharedInstance] supportedPayloads] isLocalOnCellular:v7 isRemoteOnCellular:v27])
    {
      goto LABEL_28;
    }
  }
  if ((v14 & 1) == 0)
  {
    if (v13)
    {
      BOOL v19 = 1;
      int64_t v20 = 126;
      goto LABEL_32;
    }
LABEL_31:
    BOOL v19 = 0;
    int64_t v20 = -1;
    goto LABEL_32;
  }
  BOOL v21 = [(VCCallSession *)self canNegotiateVideoPayload:123 supportedPayloads:[+[VCVideoRuleCollectionsCamera sharedInstance] supportedPayloads] isLocalOnCellular:v7 isRemoteOnCellular:v27];
  if (v21) {
    int64_t v20 = 123;
  }
  else {
    int64_t v20 = 126;
  }
  if (((v21 | v13) & 1) == 0) {
    goto LABEL_31;
  }
LABEL_28:
  BOOL v19 = 1;
LABEL_32:
  self->int64_t videoPayload = v20;
  if ([+[VCDefaults sharedInstance] forceHWI])
  {
    int v22 = [+[VCDefaults sharedInstance] forceVideoPayload];
    if (v22 != 128)
    {
      int v23 = v22;
      self->int64_t videoPayload = v22;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v24 = VRTraceErrorLogLevelToCSTR();
        __int16 v25 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v29 = v24;
          __int16 v30 = 2080;
          __int16 v31 = "-[VCCallSession(PrivateMethods) chooseVideoPayload:operatingMode:isLocalOnCellular:isRemoteOnCellular:]";
          __int16 v32 = 1024;
          int v33 = 7801;
          __int16 v34 = 1024;
          int v35 = v23;
          _os_log_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Video payload OVERRIDE to %d", buf, 0x22u);
        }
      }
      return 1;
    }
  }
  return v19;
}

- (BOOL)isValidVideoPayloadOverride:(id)a3
{
  uint64_t v4 = [+[VCDefaults sharedInstance] forceVideoPayload];
  uint64_t v5 = [+[VCDefaults sharedInstance] forceRecvVideoPayload];
  if ((v4 == 128
     || (int v6 = objc_msgSend(a3, "containsObject:", objc_msgSend(NSNumber, "numberWithInt:", v4))) != 0)
    && (v5 == 128
     || (int v6 = objc_msgSend(a3, "containsObject:", objc_msgSend(NSNumber, "numberWithInt:", v5))) != 0))
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (BOOL)doesVideoPayloadMatchRemoteImageAttributeRules:(id)a3
{
  id v4 = [(SDPMini *)[(VCCallInfo *)self->remoteCallInfo sdp] getMediaLineForType:2];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "imageAttributeRules"), "imageAttributeRules"), "objectForKeyedSubscript:", @"cellRules");
  int v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "imageAttributeRules"), "imageAttributeRules"), "objectForKeyedSubscript:", @"wifiRules");
  BOOL v7 = (void *)[v5 objectForKeyedSubscript:@"send"];
  id v8 = (void *)[v6 objectForKeyedSubscript:@"send"];
  uint64_t v9 = (void *)[v5 objectForKeyedSubscript:@"recv"];
  int v10 = (void *)[v6 objectForKeyedSubscript:@"recv"];
  if (![v7 objectForKeyedSubscript:a3] && !objc_msgSend(v8, "objectForKeyedSubscript:", a3)) {
    return ([v9 objectForKeyedSubscript:a3] || objc_msgSend(v10, "objectForKeyedSubscript:", a3))
  }
        && -[VCVideoRuleCollections getVideoRulesForTransport:payload:encodingType:](+[VCVideoRuleCollectionsCamera sharedInstance](VCVideoRuleCollectionsCamera, "sharedInstance"), "getVideoRulesForTransport:payload:encodingType:", 1, [a3 intValue], 2) != 0;
  BOOL v11 = 1;
  if (!-[VCVideoRuleCollections getVideoRulesForTransport:payload:encodingType:](+[VCVideoRuleCollectionsCamera sharedInstance](VCVideoRuleCollectionsCamera, "sharedInstance"), "getVideoRulesForTransport:payload:encodingType:", 1, [a3 intValue], 1))return (objc_msgSend(v9, "objectForKeyedSubscript:", a3) || objc_msgSend(v10, "objectForKeyedSubscript:", a3))&& -[VCVideoRuleCollections getVideoRulesForTransport:payload:encodingType:](+[VCVideoRuleCollectionsCamera sharedInstance](VCVideoRuleCollectionsCamera, "sharedInstance"), "getVideoRulesForTransport:payload:encodingType:", 1, objc_msgSend(a3, "intValue"), 2) != 0; {
  return v11;
  }
}

- (int)getAllCompatibleVideoPayloads:(int *)a3 forMediaType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a4 == 2)
  {
    BOOL v7 = off_1E6DB3088;
    goto LABEL_5;
  }
  if (a4 == 3)
  {
    BOOL v7 = off_1E6DB3090;
LABEL_5:
    uint64_t v8 = [[(__objc2_class *)*v7 sharedInstance] supportedPayloads];
    uint64_t v9 = objc_msgSend(-[SDPMini getMediaLineForType:](-[VCCallInfo sdp](self->remoteCallInfo, "sdp"), "getMediaLineForType:", v4), "payloads");
    goto LABEL_7;
  }
  uint64_t v9 = 0;
  uint64_t v8 = 0;
LABEL_7:
  int v10 = (void *)[MEMORY[0x1E4F1CA48] array];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __76__VCCallSession_PrivateMethods__getAllCompatibleVideoPayloads_forMediaType___block_invoke;
  v21[3] = &unk_1E6DB74D8;
  void v21[4] = v8;
  v21[5] = self;
  v21[6] = v10;
  [v9 enumerateObjectsUsingBlock:v21];
  if (![+[VCDefaults sharedInstance] forceHWI])
  {
    if ([v10 containsObject:&unk_1F3DC48F0]
      && [v10 containsObject:&unk_1F3DC4908])
    {
      [v10 removeObject:&unk_1F3DC4908];
    }
    [v10 removeObject:&unk_1F3DC48A8];
    goto LABEL_23;
  }
  if ([(VCCallSession *)self isValidVideoPayloadOverride:v10])
  {
    uint64_t v11 = [+[VCDefaults sharedInstance] forceVideoPayload];
    uint64_t v12 = [+[VCDefaults sharedInstance] forceRecvVideoPayload];
    [v10 removeAllObjects];
    if (v11 != 128)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        char v14 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v23 = v13;
          __int16 v24 = 2080;
          __int16 v25 = "-[VCCallSession(PrivateMethods) getAllCompatibleVideoPayloads:forMediaType:]";
          __int16 v26 = 1024;
          int v27 = 7879;
          __int16 v28 = 1024;
          int v29 = v11;
          _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Video payload OVERRIDE to %d", buf, 0x22u);
        }
      }
      objc_msgSend(v10, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", v11));
    }
    if (v12 != 128)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        uint64_t v16 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v23 = v15;
          __int16 v24 = 2080;
          __int16 v25 = "-[VCCallSession(PrivateMethods) getAllCompatibleVideoPayloads:forMediaType:]";
          __int16 v26 = 1024;
          int v27 = 7884;
          __int16 v28 = 1024;
          int v29 = v12;
          _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Video receive payload OVERRIDE to %d", buf, 0x22u);
        }
      }
      objc_msgSend(v10, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", v12));
    }
LABEL_23:
    int v17 = [v10 count];
    int v18 = (int *)malloc_type_malloc(4 * v17, 0x100004052888210uLL);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    _OWORD v20[2] = __76__VCCallSession_PrivateMethods__getAllCompatibleVideoPayloads_forMediaType___block_invoke_1483;
    void v20[3] = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
    v20[4] = v18;
    [v10 enumerateObjectsUsingBlock:v20];
    goto LABEL_28;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCCallSession(PrivateMethods) getAllCompatibleVideoPayloads:forMediaType:]();
    }
  }
  int v18 = 0;
  int v17 = 0;
LABEL_28:
  *a3 = v18;
  return v17;
}

uint64_t __76__VCCallSession_PrivateMethods__getAllCompatibleVideoPayloads_forMediaType___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) containsObject:a2];
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 40) doesVideoPayloadMatchRemoteImageAttributeRules:a2];
    if (result)
    {
      uint64_t v5 = *(void **)(a1 + 48);
      return [v5 addObject:a2];
    }
  }
  return result;
}

uint64_t __76__VCCallSession_PrivateMethods__getAllCompatibleVideoPayloads_forMediaType___block_invoke_1483(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 intValue];
  *(_DWORD *)(*(void *)(a1 + 32) + 4 * a3) = result;
  return result;
}

- (id)getCompatibleLocalFeatureListForPayloads:(int *)a3 count:(int)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  BOOL v7 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  if (a4 >= 1)
  {
    uint64_t v9 = a4;
    *(void *)&long long v8 = 136316162;
    long long v20 = v8;
    do
    {
      unsigned int v10 = *a3++;
      uint64_t v11 = objc_msgSend(NSNumber, "numberWithInt:", v10, v20);
      uint64_t v12 = objc_msgSend(-[VCCallSession allPayloadsLocalFeaturesString](self, "allPayloadsLocalFeaturesString"), "objectForKeyedSubscript:", v11);
      if (v12)
      {
        [v7 setObject:v12 forKeyedSubscript:v11];
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        char v14 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v15 = "<nil>";
          if (v11) {
            uint64_t v15 = (const char *)objc_msgSend((id)objc_msgSend(v11, "description"), "UTF8String");
          }
          *(_DWORD *)buf = v20;
          uint64_t v22 = v13;
          __int16 v23 = 2080;
          __int16 v24 = "-[VCCallSession(PrivateMethods) getCompatibleLocalFeatureListForPayloads:count:]";
          __int16 v25 = 1024;
          int v26 = 7926;
          __int16 v27 = 2080;
          __int16 v28 = v15;
          __int16 v29 = 1024;
          int v30 = a4;
          _os_log_error_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_ERROR, "VCCallSession [%s] %s:%d filterFeatureListForPayloads: Unexpected for %s count: %d", buf, 0x2Cu);
        }
      }
      --v9;
    }
    while (v9);
  }
  if (!a4)
  {
    uint64_t v16 = objc_msgSend(-[VCCallSession allPayloadsLocalFeaturesString](self, "allPayloadsLocalFeaturesString"), "objectForKeyedSubscript:", &unk_1F3DC4908);
    if (v16)
    {
      [v7 setObject:v16 forKeyedSubscript:&unk_1F3DC4908];
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      int v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCallSession(PrivateMethods) getCompatibleLocalFeatureListForPayloads:count:](v17, v18);
      }
    }
  }
  return v7;
}

- (BOOL)setRTPPayloads:(id)a3 withError:(id *)a4
{
  __int16 v28 = a4;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a3 count];
  uint64_t v7 = MEMORY[0x1F4188790](v6);
  unsigned int v10 = (char *)&v28 - v9;
  if (v7)
  {
    *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    size_t v12 = v8;
    uint64_t v13 = (char *)&v28 - v9;
    do
    {
      *((_DWORD *)v13 + 8) = -1431655766;
      *(_OWORD *)uint64_t v13 = v11;
      *((_OWORD *)v13 + 1) = v11;
      v13 += 36;
      v12 -= 36;
    }
    while (v12);
  }
  else
  {
    size_t v8 = 0;
  }
  bzero(v10, v8);
  int deviceRole = self->_deviceRole;
  if (deviceRole) {
    BOOL v15 = deviceRole == 3;
  }
  else {
    BOOL v15 = 1;
  }
  int v16 = !v15;
  int v29 = v16;
  if ([a3 count])
  {
    uint64_t v17 = 0;
    unsigned int v18 = 1;
    do
    {
      uint64_t v19 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v17), "intValue");
      id v20 = [(VCCallSession *)self newConfigForPayloadType:v19];
      BOOL v21 = &v10[36 * v17];
      *(_DWORD *)BOOL v21 = [v20 payload];
      *((_DWORD *)v21 + 1) = [v20 payload];
      *((_DWORD *)v21 + 3) = [v20 flags];
      *((_DWORD *)v21 + 2) = [v20 samplesPerFrame];
      *((_DWORD *)v21 + 5) = +[VCPayloadUtils canBundleExternallyForPayload:v19 forBundlingScheme:1 operatingMode:self->operatingMode];

      if ((v19 - 97) <= 1) {
        v10[36 * v17 + 16] = v29;
      }
      uint64_t v17 = v18;
    }
    while ([a3 count] > (unint64_t)v18++);
  }
  if (VCAudioReceiver_SetupDecoders((uint64_t)self->audioReceiver, (uint64_t)v10, [a3 count], (long long *)&self->_vpioFormat, 0))
  {
    int v23 = RTPSetSourceRate((uint64_t)self->rtpHandle, self->_vpioFormat.format.mSampleRate);
    if ((v23 & 0x80000000) == 0) {
      return v23 >= 0;
    }
  }
  else
  {
    int v23 = -2147418108;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v24 = VRTraceErrorLogLevelToCSTR();
    __int16 v25 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v31 = v24;
      __int16 v32 = 2080;
      int v33 = "-[VCCallSession(PrivateMethods) setRTPPayloads:withError:]";
      __int16 v34 = 1024;
      int v35 = 7982;
      __int16 v36 = 1024;
      int v37 = v23;
      _os_log_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d failed: result=%x", buf, 0x22u);
    }
  }
  uint64_t v26 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 7987);
  +[GKVoiceChatError getNSError:v28 code:32002 detailedCode:224 returnCode:v23 filePath:v26 description:@"Could not set RTP payload" reason:@"Error"];
  SIPHangup((uint64_t *)&self->hSIP, [(VCCallInfo *)self->localCallInfo callID], 224);
  return v23 >= 0;
}

- (BOOL)setMediaQueueStreamSettings
{
  LODWORD(v2) = self->_vpioFormat.samplesPerFrame;
  int v3 = RTPSetThrottlingAudioInterval((double)v2 / self->_vpioFormat.format.mSampleRate);
  if (v3 < 0 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCCallSession(PrivateMethods) setMediaQueueStreamSettings]();
    }
  }
  return v3 >= 0;
}

- (BOOL)setupCallerRTPChannelWithError:(id *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  VCAudioReceiver_UpdateCellTech((uint64_t)self->audioReceiver, [(VCConnectionManager *)self->connectionManager getCellularTechForActiveConnectionWithQuality:1 forLocalInterface:1], [(VCConnectionManager *)self->connectionManager getCellularTechForActiveConnectionWithQuality:1 forLocalInterface:0]);
  if ([(VCCapabilities *)self->caps isVideoEnabled]) {
    VideoReceiver_CellTechChanged();
  }
  uint64_t v12 = 0;
  if (![(VCCallSession *)self negotiatePayloads:&v12 withError:a3])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCallSession(PrivateMethods) setupCallerRTPChannelWithError:].cold.5();
      }
    }
    return 0;
  }
  if (![(VCCallSession *)self setRTPPayloads:v12 withError:a3])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCallSession(PrivateMethods) setupCallerRTPChannelWithError:].cold.4();
      }
    }
    return 0;
  }
  if (![(VCCallSession *)self setMediaQueueStreamSettings])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCallSession(PrivateMethods) setupCallerRTPChannelWithError:]();
      }
    }
    return 0;
  }
  if ((VCAudioReceiver_Start(&self->audioReceiver->var0.var0, v5) & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCallSession(PrivateMethods) setupCallerRTPChannelWithError:]();
      }
    }
    return 0;
  }
  int v11 = 0;
  [(VCCallSession *)self negotiateMaxBandwidth:&v11];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int64_t sipState = self->_sipState;
      *(_DWORD *)buf = 136316162;
      uint64_t v14 = v6;
      __int16 v15 = 2080;
      int v16 = "-[VCCallSession(PrivateMethods) setupCallerRTPChannelWithError:]";
      __int16 v17 = 1024;
      int v18 = 8044;
      __int16 v19 = 1024;
      BOOL v20 = sipState == 5;
      __int16 v21 = 1024;
      int v22 = sipState;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d (state == GKVoiceChatServiceStateCallerAttemptingToConnect = %d, int64_t sipState = %d", buf, 0x28u);
    }
  }
  BOOL v9 = [(VCCallSession *)self createAudioTransmitter:a3];
  if (!v9 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCCallSession(PrivateMethods) setupCallerRTPChannelWithError:]();
    }
  }
  return v9;
}

- (BOOL)sipConnectWithError:(id *)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!-[VCCallSession sendSIPInviteWithError:](self, "sendSIPInviteWithError:"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        if (*a3) {
          uint64_t v12 = (const char *)objc_msgSend((id)objc_msgSend(*a3, "description"), "UTF8String");
        }
        else {
          uint64_t v12 = "<nil>";
        }
        *(_DWORD *)uint64_t v13 = 136315906;
        *(void *)&v13[4] = v6;
        *(_WORD *)&_OWORD v13[12] = 2080;
        *(void *)&v13[14] = "-[VCCallSession(PrivateMethods) sipConnectWithError:]";
        *(_WORD *)&v13[22] = 1024;
        *(_DWORD *)&v13[24] = 8057;
        *(_WORD *)&v13[28] = 2080;
        *(void *)&v13[30] = v12;
        _os_log_error_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_ERROR, "VCCallSession [%s] %s:%d sendSIPInvite returned NO error = %s", v13, 0x26u);
        reportingSymptom();
        goto LABEL_16;
      }
    }
    reportingSymptom();
    if (a3)
    {
LABEL_16:
      id v10 = *a3;
LABEL_18:
      [(VCCallSession *)self disconnect:v10 didRemoteCancel:0];
      return 0;
    }
LABEL_17:
    id v10 = 0;
    goto LABEL_18;
  }
  if ([(VCMediaNegotiator *)self->_mediaNegotiator usePreNegotiation])
  {
    [(VCCallSession *)self lock];
    [(VCCallSession *)self cancelConnectionTimeoutTimer];
    [(VCCallSession *)self unlock];
    return 1;
  }
  [(TimingCollection *)self->perfTimers startTimingForKey:3];
  *(void *)&unsigned long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[27] = v8;
  *(_OWORD *)uint64_t v13 = v8;
  *(_OWORD *)&v13[16] = v8;
  SIPGetRemoteInfo((uint64_t)self->hSIP, [(VCCallInfo *)self->localCallInfo callID], v13, 0);
  -[VCCallInfo setUserAgent:](self->remoteCallInfo, "setUserAgent:", [NSString stringWithUTF8String:v13]);
  [(VCCallSession *)self lock];
  if (![(VCCallSession *)self setupCallerRTPChannelWithError:a3])
  {
    [(VCCallSession *)self unlock];
    if (a3) {
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  BOOL v5 = 1;
  if ([(VCCallInfo *)self->remoteCallInfo usesInitialFECImplementation]) {
    int v9 = 1;
  }
  else {
    int v9 = 2;
  }
  self->fecMode = v9;
  self->int64_t state = 1;
  [(VCCallSession *)self sendBasebandCodecMessage];
  [(VCCallSession *)self cancelConnectionTimeoutTimer];
  [(VCCallSession *)self unlock];
  if (![(VCCallSession *)self startMediaQueue:a3])
  {
    if (!a3) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  return v5;
}

- (void)stopAudioWithCompletionHandler:(id)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  [(VCCallSession *)self lock];
  if (self->isAudioRunning)
  {
    self->isAudioRunning = 0;
    [(VCCallSession *)self unlock];
    [(VCCallSessionDelegate *)[(VCCallSession *)self delegate] session:self stopAudioWithCompletionHandler:a3];
  }
  else
  {
    [(VCCallSession *)self unlock];
    if (a3) {
      (*((void (**)(id, uint64_t, void))a3 + 2))(a3, 1, 0);
    }
  }
  if ([(VCCapabilities *)self->caps isAudioEnabled]) {
    [(VCAudioTransmitter *)self->audioTransmitter stop];
  }
  reportingGenericEvent();
}

- (void)stopAudioIO:(id)a3
{
  v6[5] = *MEMORY[0x1E4F143B8];
  [(VCCallSession *)self lock];
  if (self->isAudioRunning)
  {
    self->isAudioRunning = 0;
    [(VCCallSessionDelegate *)[(VCCallSession *)self delegate] session:self stopAudioWithCompletionHandler:a3];
  }
  else if (a3)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __45__VCCallSession_PrivateMethods__stopAudioIO___block_invoke;
    v6[3] = &unk_1E6DB7500;
    v6[4] = a3;
    dispatch_async(global_queue, v6);
  }
  [(VCCallSession *)self unlock];
}

uint64_t __45__VCCallSession_PrivateMethods__stopAudioIO___block_invoke(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", v3, 32012, 264, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 8148), @"Could not stop audio.", @"Audio is not running");
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startAudioWithCompletionHandler:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  audioQueue = self->audioQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__VCCallSession_PrivateMethods__startAudioWithCompletionHandler___block_invoke;
  block[3] = &unk_1E6DB5178;
  block[4] = self;
  void block[5] = a3;
  dispatch_async(audioQueue, block);
}

uint64_t __65__VCCallSession_PrivateMethods__startAudioWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) lock];
  uint64_t v21 = 0;
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"disableAudio", @"com.apple.VideoConference", &keyExistsAndHasValidFormat);
  int v3 = *(void **)(a1 + 32);
  if (v3[19])
  {
    if ([v3 isCallOngoing])
    {
      uint64_t v4 = *(unsigned __int8 **)(a1 + 32);
      if (keyExistsAndHasValidFormat && AppBooleanValue)
      {
        [v4 unlock];
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          uint64_t v5 = VRTraceErrorLogLevelToCSTR();
          uint64_t v6 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            uint64_t v23 = v5;
            __int16 v24 = 2080;
            __int16 v25 = "-[VCCallSession(PrivateMethods) startAudioWithCompletionHandler:]_block_invoke";
            __int16 v26 = 1024;
            int v27 = 0x1FFF;
            _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d disableAudio is set to True, not starting audio!", buf, 0x1Cu);
          }
        }
        goto LABEL_23;
      }
      int v10 = v4[408];
      int v11 = v4[224];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        uint64_t v13 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v23 = v12;
          __int16 v24 = 2080;
          __int16 v25 = "-[VCCallSession(PrivateMethods) startAudioWithCompletionHandler:]_block_invoke";
          __int16 v26 = 1024;
          int v27 = 8201;
          __int16 v28 = 1024;
          int v29 = v11;
          __int16 v30 = 1024;
          BOOL v31 = v10 == 0;
          _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d alreadyStarted = %d, isEnabled = %d", buf, 0x28u);
        }
      }
      char v14 = [*(id *)(*(void *)(a1 + 32) + 1232) setupAudio:&v21];
      int v9 = *(id **)(a1 + 32);
      if (v14)
      {

        *(void *)(*(void *)(a1 + 32) + 144) = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1232), "audioPayloads"), "mutableCopy");
        __int16 v15 = *(void **)(a1 + 32);
        if (v11 | v10)
        {
          [v15 unlock];
LABEL_23:
          uint64_t result = *(void *)(a1 + 40);
          if (!result) {
            return result;
          }
          unsigned long long v8 = *(uint64_t (**)(void))(result + 16);
          return v8();
        }
        char v16 = [v15 setupAudioCookies];
        uint64_t v17 = *(void *)(a1 + 32);
        if (v16)
        {
          if (*(unsigned char *)(v17 + 993))
          {
            *(void *)(*(void *)(a1 + 32) + 368) = [[GKRingBuffer alloc] initWithCapacity:2048 bytesPerFrame:*(unsigned int *)(*(void *)(a1 + 32) + 568)];
            uint64_t v17 = *(void *)(a1 + 32);
          }
          int v18 = [*(id *)(v17 + 320) isAudioEnabled];
          uint64_t v19 = *(void *)(a1 + 32);
          if (v18)
          {
            [*(id *)(v19 + 1232) start];
            [*(id *)(a1 + 32) startAudioIOWithCompletionHandler:*(void *)(a1 + 40)];
          }
          else
          {
            [*(id *)(v19 + 672) stopTimingForKey:5];
            [*(id *)(a1 + 32) startPausedHeartbeat];
          }
          reportingGenericEvent();
          return [*(id *)(a1 + 32) unlock];
        }
        [(id)v17 unlock];
        +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", &v21, 32016, 226, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 8229), @"Couldn't setup encoder.", @"Bad cookie?");
        goto LABEL_15;
      }
    }
    else
    {
      +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", &v21, 32012, 225, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 8179), @"Could not start audio.", @"Call already completed");
      int v9 = *(id **)(a1 + 32);
    }
    [v9 unlock];
LABEL_15:
    uint64_t result = *(void *)(a1 + 40);
    if (!result) {
      return result;
    }
    unsigned long long v8 = *(uint64_t (**)(void))(result + 16);
    return v8();
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __65__VCCallSession_PrivateMethods__startAudioWithCompletionHandler___block_invoke_cold_1();
    }
  }
  [*(id *)(a1 + 32) unlock];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    unsigned long long v8 = *(uint64_t (**)(void))(result + 16);
    return v8();
  }
  return result;
}

- (void)startAudioIOWithCompletionHandler:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&unsigned char buf[12] = 2080;
      *(void *)&buf[14] = "-[VCCallSession(PrivateMethods) startAudioIOWithCompletionHandler:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 8256;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d ", buf, 0x1Cu);
    }
  }
  if (self->_deviceRole == 1)
  {
    uint64_t v7 = [(VCCallSession *)self basebandCodecType];
    unsigned long long v8 = [(VCCallSession *)self basebandCodecSampleRate];
  }
  else
  {
    uint64_t v7 = 0;
    unsigned long long v8 = 0;
  }
  int v19 = -1431655766;
  *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v17 = v9;
  long long v18 = v9;
  long long v15 = v9;
  long long v16 = v9;
  long long v13 = v9;
  long long v14 = v9;
  *(_OWORD *)buf = v9;
  *(_OWORD *)&buf[16] = v9;
  remoteCallInfo = self->remoteCallInfo;
  if (remoteCallInfo)
  {
    [(VCCallInfo *)remoteCallInfo audioVersionInfo:self->isGKVoiceChat];
  }
  else
  {
    int v19 = 0;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    memset(buf, 0, sizeof(buf));
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__VCCallSession_PrivateMethods__startAudioIOWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E6DB7528;
  v11[4] = self;
  v11[5] = v8;
  v11[6] = v7;
  v11[7] = a3;
  -[VCCallSessionDelegate session:startAudioWithFarEndVersionInfo:internalFrameFormat:completionHandler:](-[VCCallSession delegate](self, "delegate"), "session:startAudioWithFarEndVersionInfo:internalFrameFormat:completionHandler:", self, buf, &self->_vpioFormat, (id)[v11 copy]);
}

uint64_t __67__VCCallSession_PrivateMethods__startAudioIOWithCompletionHandler___block_invoke(uint64_t a1, int a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    v10[0] = 0;
    [*(id *)(a1 + 32) lock];
    *(unsigned char *)(*(void *)(a1 + 32) + 224) = 1;
    uint64_t v3 = [*(id *)(a1 + 32) isCallOngoing];
    if ((v3 & 1) == 0)
    {
      +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", v10, 32012, 228, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 8281), @"Audio started after call ended.", @"Call already completed");
      [*(id *)(a1 + 32) stopAudioWithCompletionHandler:0];
    }
    uint64_t v4 = *(_DWORD **)(a1 + 32);
    if (v4[82] == 1
      && (!objc_msgSend(*(id *)(a1 + 40), "isEqualToNumber:", objc_msgSend(v4, "basebandCodecSampleRate"))
       || (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", objc_msgSend(*(id *)(a1 + 32), "basebandCodecType")) & 1) == 0))
    {
      if ([*(id *)(a1 + 32) basebandCodecType])
      {
        if ([*(id *)(a1 + 32) basebandCodecSampleRate])
        {
          uint64_t v5 = (void *)[*(id *)(a1 + 32) delegate];
          uint64_t v6 = *(void **)(a1 + 32);
          uint64_t v7 = CStrToFourcc((char *)objc_msgSend((id)objc_msgSend(v6, "basebandCodecType"), "UTF8String"));
          objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "basebandCodecSampleRate"), "doubleValue");
          objc_msgSend(v5, "session:setRemoteBasebandCodecType:sampleRate:", v6, v7);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              __67__VCCallSession_PrivateMethods__startAudioIOWithCompletionHandler___block_invoke_cold_1();
            }
          }
        }
      }
    }
    [*(id *)(a1 + 32) unlock];
    uint64_t result = *(void *)(a1 + 56);
    if (result) {
      return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, v3, v10[0]);
    }
  }
  else
  {
    uint64_t result = *(void *)(a1 + 56);
    if (result)
    {
      long long v9 = *(uint64_t (**)(void))(result + 16);
      return v9();
    }
  }
  return result;
}

- (void)enableAudio:(BOOL)a3
{
  BOOL v3 = a3;
  [(VCCallSession *)self lock];
  if (v3)
  {
    [(VCCallSession *)self startAudioIOWithCompletionHandler:&v5];
    [(VCCallSession *)self stopPausedHeartbeat];
  }
  else
  {
    [(VCCallSession *)self stopAudioIO:0];
    [(VCCallSession *)self startPausedHeartbeat];
  }
  [(VCCallSession *)self unlock];
}

uint64_t __45__VCCallSession_PrivateMethods__enableAudio___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2)
  {
    if (*(unsigned char *)(v3 + 408))
    {
      [*(id *)(a1 + 32) setPauseAudio:1 force:1 error:0];
      uint64_t v3 = *(void *)(a1 + 32);
    }
    [(id)v3 updateLastReceivedPacketWithTimestamp:6 packetType:micro() + 10.0];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 8);
    uint64_t v7 = [*(id *)(v5 + 24) callID];
    unsigned long long v8 = v6;
    uint64_t v9 = v5;
    uint64_t v10 = 1;
    uint64_t v11 = 0;
  }
  else
  {
    long long v13 = *(void **)(v3 + 8);
    uint64_t v7 = [*(id *)(v3 + 24) callID];
    unsigned long long v8 = v13;
    uint64_t v9 = v3;
    uint64_t v10 = 0;
    uint64_t v11 = a3;
  }

  return [v8 session:v9 localAudioEnabled:v10 withCallID:v7 error:v11];
}

- (void)updateDeviceRole:(int)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  int deviceRole = self->_deviceRole;
  if (deviceRole == a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v7 = self->_deviceRole;
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = v5;
        __int16 v46 = 2080;
        id v47 = "-[VCCallSession(PrivateMethods) updateDeviceRole:]";
        __int16 v48 = 1024;
        int v49 = 8357;
        __int16 v50 = 1024;
        *(_DWORD *)uint64_t v51 = v7;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d SAME device role %d set, No-Op", buf, 0x22u);
      }
    }
    return;
  }
  uint64_t v8 = *(void *)&a3;
  if (a3 == 4 && deviceRole == 2 || a3 == 3 && !deviceRole || a3 == 2 && deviceRole == 4 || !a3 && deviceRole == 3)
  {
    uint64_t v9 = dispatch_semaphore_create(0);
    BOOL isAudioRunning = self->isAudioRunning;
    if ([(VCCapabilities *)[(VCCallSession *)self capabilities] isVideoEnabled])
    {
      if (v8) {
        BOOL v11 = 0;
      }
      else {
        BOOL v11 = self->_deviceRole == 3;
      }
      int v12 = v11;
    }
    else
    {
      int v12 = 0;
    }
    if ((VCCallSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        long long v15 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v16 = self->_deviceRole;
          *(_DWORD *)buf = 136316418;
          *(void *)&uint8_t buf[4] = v14;
          __int16 v46 = 2080;
          id v47 = "-[VCCallSession(PrivateMethods) updateDeviceRole:]";
          __int16 v48 = 1024;
          int v49 = 8379;
          __int16 v50 = 1024;
          *(_DWORD *)uint64_t v51 = v16;
          *(_WORD *)&v51[4] = 1024;
          *(_DWORD *)&v51[6] = v8;
          LOWORD(v52) = 1024;
          *(_DWORD *)((char *)&v52 + 2) = isAudioRunning;
          long long v17 = "VCCallSession [%s] %s:%d Updating from role %d to %d. shouldRestartAudio %d";
          long long v18 = v15;
          uint32_t v19 = 46;
LABEL_31:
          _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        long long v13 = (__CFString *)[(VCCallSession *)self performSelector:sel_logPrefix];
      }
      else {
        long long v13 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v20 = VRTraceErrorLogLevelToCSTR();
        uint64_t v21 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v22 = self->_deviceRole;
          *(_DWORD *)buf = 136316930;
          *(void *)&uint8_t buf[4] = v20;
          __int16 v46 = 2080;
          id v47 = "-[VCCallSession(PrivateMethods) updateDeviceRole:]";
          __int16 v48 = 1024;
          int v49 = 8379;
          __int16 v50 = 2112;
          *(void *)uint64_t v51 = v13;
          *(_WORD *)&v51[8] = 2048;
          __int16 v52 = self;
          __int16 v53 = 1024;
          int v54 = v22;
          __int16 v55 = 1024;
          int v56 = v8;
          __int16 v57 = 1024;
          BOOL v58 = isAudioRunning;
          long long v17 = "VCCallSession [%s] %s:%d %@(%p) Updating from role %d to %d. shouldRestartAudio %d";
          long long v18 = v21;
          uint32_t v19 = 66;
          goto LABEL_31;
        }
      }
    }
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __50__VCCallSession_PrivateMethods__updateDeviceRole___block_invoke;
    v44[3] = &unk_1E6DB5838;
    v44[4] = v9;
    id v23 = (id)[v44 copy];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __50__VCCallSession_PrivateMethods__updateDeviceRole___block_invoke_1522;
    v43[3] = &unk_1E6DB5838;
    v43[4] = v9;
    id v24 = (id)[v43 copy];
    if (isAudioRunning)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v25 = VRTraceErrorLogLevelToCSTR();
        __int16 v26 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = v25;
          __int16 v46 = 2080;
          id v47 = "-[VCCallSession(PrivateMethods) updateDeviceRole:]";
          __int16 v48 = 1024;
          int v49 = 8394;
          _os_log_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d stopping audio", buf, 0x1Cu);
        }
      }
      [(VCCallSession *)self stopAudioIO:v43];
      dispatch_time_t v27 = dispatch_time(0, 10000000000);
      if (dispatch_semaphore_wait(v9, v27))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
        {
          VRTraceErrorLogLevelToCSTR();
          if (VRTraceIsOSFaultDisabled())
          {
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCCallSession(PrivateMethods) updateDeviceRole:]();
            }
          }
          else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
          {
            -[VCCallSession(PrivateMethods) updateDeviceRole:].cold.4();
          }
        }
        *(void *)buf = 0;
        int v35 = NSString;
        __int16 v36 = @"Stop Audio Timed out";
LABEL_65:
        +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", buf, 32016, 258, 0, @"updateDeviceRole failed", [v35 stringWithFormat:v36]);
        [(VCCallSession *)self disconnect:*(void *)buf didRemoteCancel:0];
LABEL_66:
        dispatch_release(v9);
        return;
      }
      self->_int deviceRole = v8;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v32 = VRTraceErrorLogLevelToCSTR();
        int v33 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = v32;
          __int16 v46 = 2080;
          id v47 = "-[VCCallSession(PrivateMethods) updateDeviceRole:]";
          __int16 v48 = 1024;
          int v49 = 8412;
          _os_log_impl(&dword_1E1EA4000, v33, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d starting audio", buf, 0x1Cu);
        }
      }
      [(VCCallSession *)self startAudioIOWithCompletionHandler:v44];
      dispatch_time_t v34 = dispatch_time(0, 10000000000);
      if (dispatch_semaphore_wait(v9, v34))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
        {
          VRTraceErrorLogLevelToCSTR();
          if (VRTraceIsOSFaultDisabled())
          {
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCCallSession(PrivateMethods) updateDeviceRole:]();
            }
          }
          else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
          {
            -[VCCallSession(PrivateMethods) updateDeviceRole:]();
          }
        }
        *(void *)buf = 0;
        int v35 = NSString;
        __int16 v36 = @"Start Audio Timed out";
        goto LABEL_65;
      }
    }
    else
    {
      self->_int deviceRole = v8;
    }
    if (v12)
    {
      videoQueue = self->videoQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __50__VCCallSession_PrivateMethods__updateDeviceRole___block_invoke_1529;
      block[3] = &unk_1E6DB3DC8;
      block[4] = self;
      dispatch_async(videoQueue, block);
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v29 = VRTraceErrorLogLevelToCSTR();
      __int16 v30 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v31 = self->_deviceRole;
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = v29;
        __int16 v46 = 2080;
        id v47 = "-[VCCallSession(PrivateMethods) updateDeviceRole:]";
        __int16 v48 = 1024;
        int v49 = 8434;
        __int16 v50 = 1024;
        *(_DWORD *)uint64_t v51 = v31;
        _os_log_impl(&dword_1E1EA4000, v30, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Finished update to role %d", buf, 0x22u);
      }
    }
    goto LABEL_66;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
  {
    uint64_t v37 = VRTraceErrorLogLevelToCSTR();
    char IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
    long long v39 = *MEMORY[0x1E4F47A50];
    if (IsOSFaultDisabled)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v40 = self->_deviceRole;
        *(_DWORD *)buf = 136316162;
        *(void *)&uint8_t buf[4] = v37;
        __int16 v46 = 2080;
        id v47 = "-[VCCallSession(PrivateMethods) updateDeviceRole:]";
        __int16 v48 = 1024;
        int v49 = 8363;
        __int16 v50 = 1024;
        *(_DWORD *)uint64_t v51 = v40;
        *(_WORD *)&v51[4] = 1024;
        *(_DWORD *)&v51[6] = v8;
        _os_log_error_impl(&dword_1E1EA4000, v39, OS_LOG_TYPE_ERROR, "VCCallSession [%s] %s:%d Invalid transition from role %d to %d", buf, 0x28u);
      }
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
    {
      int v41 = self->_deviceRole;
      *(_DWORD *)buf = 136316162;
      *(void *)&uint8_t buf[4] = v37;
      __int16 v46 = 2080;
      id v47 = "-[VCCallSession(PrivateMethods) updateDeviceRole:]";
      __int16 v48 = 1024;
      int v49 = 8363;
      __int16 v50 = 1024;
      *(_DWORD *)uint64_t v51 = v41;
      *(_WORD *)&v51[4] = 1024;
      *(_DWORD *)&v51[6] = v8;
      _os_log_fault_impl(&dword_1E1EA4000, v39, OS_LOG_TYPE_FAULT, "VCCallSession [%s] %s:%d Invalid transition from role %d to %d", buf, 0x28u);
    }
  }
  *(void *)buf = 0;
  +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", buf, 32016, 258, 0, @"updateDeviceRole failed", objc_msgSend(NSString, "stringWithFormat:", @"Invalid transition from role %d to %d", self->_deviceRole, v8));
  [(VCCallSession *)self disconnect:*(void *)buf didRemoteCancel:0];
}

intptr_t __50__VCCallSession_PrivateMethods__updateDeviceRole___block_invoke(uint64_t a1, int a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315906;
      uint64_t v8 = v4;
      __int16 v9 = 2080;
      uint64_t v10 = "-[VCCallSession(PrivateMethods) updateDeviceRole:]_block_invoke";
      __int16 v11 = 1024;
      int v12 = 8382;
      __int16 v13 = 1024;
      int v14 = a2;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Finished starting audio didStart[%d]", (uint8_t *)&v7, 0x22u);
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __50__VCCallSession_PrivateMethods__updateDeviceRole___block_invoke_1522(uint64_t a1, int a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315906;
      uint64_t v8 = v4;
      __int16 v9 = 2080;
      uint64_t v10 = "-[VCCallSession(PrivateMethods) updateDeviceRole:]_block_invoke";
      __int16 v11 = 1024;
      int v12 = 8388;
      __int16 v13 = 1024;
      int v14 = a2;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Finished stopping audio didStop[%d]", (uint8_t *)&v7, 0x22u);
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __50__VCCallSession_PrivateMethods__updateDeviceRole___block_invoke_1529(uint64_t a1)
{
  [*(id *)(a1 + 32) stopVideoSend:0 error:0];
  unint64_t v2 = *(void **)(a1 + 32);

  return [v2 startVideoSend:1 error:0];
}

- (void)sendCallingModeMessage
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(VCCapabilities *)[(VCCallSession *)self capabilities] isAudioEnabled])
  {
    if ([(VCCapabilities *)[(VCCallSession *)self capabilities] isVideoEnabled]) {
      uint64_t v3 = @"VCVideoMode";
    }
    else {
      uint64_t v3 = @"VCAudioMode";
    }
  }
  else
  {
    uint64_t v3 = @"VCDataMode";
  }
  [(VCSessionMessaging *)self->messaging sendMessage:v3 withTopic:@"CallingModeTopic"];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315906;
      uint64_t v7 = v4;
      __int16 v8 = 2080;
      __int16 v9 = "-[VCCallSession(PrivateMethods) sendCallingModeMessage]";
      __int16 v10 = 1024;
      int v11 = 8453;
      __int16 v12 = 2080;
      uint64_t v13 = objc_msgSend((id)-[__CFString description](v3, "description"), "UTF8String");
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Sending VCCallingModeTopic %s", (uint8_t *)&v6, 0x26u);
    }
  }
}

- (BOOL)setupAudioCookies
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  memset(__b, 170, sizeof(__b));
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v20 = self;
  negotiatedAudioPayloads = self->negotiatedAudioPayloads;
  uint64_t v4 = [(NSMutableArray *)negotiatedAudioPayloads countByEnumeratingWithState:&v30 objects:v29 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v31;
    *(void *)&long long v5 = 136315906;
    long long v19 = v5;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(negotiatedAudioPayloads);
        }
        __int16 v9 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if (+[VCPayloadUtils shouldUseCookieForPayload:](VCPayloadUtils, "shouldUseCookieForPayload:", objc_msgSend((id)objc_msgSend(v9, "config", v19), "payload")))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v10 = VRTraceErrorLogLevelToCSTR();
            int v11 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              int v12 = objc_msgSend((id)objc_msgSend(v9, "config"), "payload");
              *(_DWORD *)buf = v19;
              uint64_t v22 = v10;
              __int16 v23 = 2080;
              id v24 = "-[VCCallSession(PrivateMethods) setupAudioCookies]";
              __int16 v25 = 1024;
              int v26 = 8463;
              __int16 v27 = 1024;
              int v28 = v12;
              _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Getting cookie for payload type %d", buf, 0x22u);
            }
          }
          *(_DWORD *)buf = 1024;
          int v13 = [v9 getMagicCookie:__b withLength:buf];
          if (v13) {
            BOOL v14 = *(_DWORD *)buf == 0;
          }
          else {
            BOOL v14 = 1;
          }
          if (v14)
          {
            if (!v13) {
              return v13;
            }
          }
          else
          {
            uint64_t audioReceiver = (uint64_t)v20->audioReceiver;
            int v16 = objc_msgSend((id)objc_msgSend(v9, "config"), "payload");
            int v17 = objc_msgSend((id)objc_msgSend(v9, "config"), "payload");
            if (!VCAudioReceiver_SetMagicCookieForPayload(audioReceiver, v16, v17, __b, *(UInt32 *)buf))
            {
              LOBYTE(v13) = 0;
              return v13;
            }
          }
        }
      }
      uint64_t v6 = [(NSMutableArray *)negotiatedAudioPayloads countByEnumeratingWithState:&v30 objects:v29 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  LOBYTE(v13) = 1;
  return v13;
}

- (int)interfaceForCurrentCall
{
  unint64_t v2 = (void *)VCConnectionManager_CopyConnectionForQuality((uint64_t)self->connectionManager, 1);
  int v3 = [v2 isWifiToWifi];
  if (v2) {
    CFRelease(v2);
  }
  if (v3) {
    return 2;
  }
  else {
    return 1;
  }
}

- (BOOL)startVideoSend:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  [(VCCallSession *)self lock];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    __int16 v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = [(VCCapabilities *)self->caps isDuplexAudioOnly];
      BOOL v10 = [(VCCapabilities *)self->caps isVideoEnabled];
      BOOL v11 = [(VCCallInfo *)self->localCallInfo videoIsPaused];
      unsigned int v12 = [(VCCapabilities *)self->caps actualVideoCodec];
      int64_t state = self->state;
      *(_DWORD *)buf = 136316930;
      uint64_t v99 = v7;
      __int16 v100 = 2080;
      v101 = "-[VCCallSession(PrivateMethods) startVideoSend:error:]";
      __int16 v102 = 1024;
      int v103 = 8494;
      __int16 v104 = 1024;
      *(_DWORD *)v105 = v9;
      *(_WORD *)&v105[4] = 1024;
      *(_DWORD *)&v105[6] = v10;
      *(_WORD *)v106 = 1024;
      *(_DWORD *)&v106[2] = v11;
      *(_WORD *)&v106[6] = 1024;
      *(_DWORD *)&v106[8] = v12;
      *(_WORD *)&v106[12] = 1024;
      *(_DWORD *)&v106[14] = state;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d startVideoSend: called: %d %d %d %d %d", buf, 0x3Au);
    }
  }
  if ([(VCCapabilities *)self->caps isDuplexAudioOnly]
    || [(VCCapabilities *)self->caps actualVideoCodec] == -1
    || (int operatingMode = self->operatingMode, operatingMode == 7)
    || operatingMode == 2)
  {
    [(VCCallSession *)self unlock];
    return 1;
  }
  if (![(VCCallSession *)self isCallOngoing] || self->state != 1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCallSession(PrivateMethods) startVideoSend:error:]();
      }
    }
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a4, 32012, 229, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 8506), @"Could not start video.", @"Call already completed");
    [(VCCallSession *)self unlock];
    return 0;
  }
  [(VCCallSession *)self unlock];
  signed int v97 = -1431655766;
  uint64_t v17 = [(VCCallSession *)self interfaceForCurrentCall];
  BOOL v15 = 1;
  id v18 = [(VCCallSession *)self getVideoRuleForVideoMode:1 interface:2 sessionBitrate:0];
  id v19 = [(VCCallSession *)self getVideoRuleForVideoMode:1 interface:1 sessionBitrate:0];
  id v20 = [(VCCallSession *)self getVideoRuleForVideoMode:2 interface:v17 sessionBitrate:&v97];
  if ([(VCCallInfo *)self->localCallInfo videoIsPaused]) {
    return v15;
  }
  unsigned int v95 = v17;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v21 = VRTraceErrorLogLevelToCSTR();
    uint64_t v22 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v93 = [v18 iWidth];
      int v92 = [v18 iHeight];
      [v18 fRate];
      double v24 = v23;
      [v18 fPref];
      double v26 = v25;
      int v91 = [v18 iPayload];
      int v90 = [v19 iWidth];
      int v89 = [v19 iHeight];
      [v19 fRate];
      double v28 = v27;
      [v19 fPref];
      double v30 = v29;
      int v88 = [v19 iPayload];
      int v31 = [v20 iWidth];
      int v32 = [v20 iHeight];
      [v20 fRate];
      double v34 = v33;
      [v20 fPref];
      double v36 = v35;
      int v37 = [v20 iPayload];
      *(_DWORD *)buf = 136319746;
      uint64_t v99 = v21;
      __int16 v100 = 2080;
      v101 = "-[VCCallSession(PrivateMethods) startVideoSend:error:]";
      __int16 v102 = 1024;
      int v103 = 8530;
      __int16 v104 = 1024;
      *(_DWORD *)v105 = v93;
      *(_WORD *)&v105[4] = 1024;
      *(_DWORD *)&v105[6] = v92;
      *(_WORD *)v106 = 2048;
      *(double *)&v106[2] = v24;
      *(_WORD *)&v106[10] = 2048;
      *(double *)&v106[12] = v26;
      __int16 v107 = 1024;
      int v108 = v91;
      __int16 v109 = 1024;
      int v110 = v90;
      __int16 v111 = 1024;
      int v112 = v89;
      __int16 v113 = 2048;
      double v114 = v28;
      __int16 v115 = 2048;
      double v116 = v30;
      __int16 v117 = 1024;
      int v118 = v88;
      __int16 v119 = 1024;
      int v120 = v31;
      __int16 v121 = 1024;
      int v122 = v32;
      __int16 v123 = 2048;
      double v124 = v34;
      __int16 v125 = 2048;
      double v126 = v36;
      __int16 v127 = 1024;
      int v128 = v37;
      __int16 v129 = 1024;
      unsigned int v130 = v95;
      _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCALLSESSION: start video with capture rule wifuint64_t i = %dx%dx%.1ffps(%.1f, %d), capture rule cell = %dx%dx%.1ffps(%.1f, %d), encode rule = %dx%dx%.1ffps(%.1f, %d), for interface %d", buf, 0x94u);
    }
  }
  if (v97 >= 1 && v97 < (signed int)self->callSessionBitrate) {
    self->unsigned int callSessionBitrate = v97;
  }
  [(VCCallSession *)self adjustBitrateForConnectionType];
  if ([+[VCDefaults sharedInstance] forceHWI])
  {
    self->unsigned int callSessionBitrate = [+[VCDefaults sharedInstance] forceBitrate];
    uint64_t v38 = [+[VCDefaults sharedInstance] forceCaptureWidth];
    uint64_t v39 = [+[VCDefaults sharedInstance] forceCaptureHeight];
    *(float *)&double v40 = (float)[+[VCDefaults sharedInstance] forceFramerate];
    [v18 setFrameWidth:v38 frameHeight:v39 frameRate:v40];
    uint64_t v41 = [+[VCDefaults sharedInstance] forceCaptureWidth];
    uint64_t v42 = [+[VCDefaults sharedInstance] forceCaptureHeight];
    *(float *)&double v43 = (float)[+[VCDefaults sharedInstance] forceFramerate];
    [v19 setFrameWidth:v41 frameHeight:v42 frameRate:v43];
    uint64_t v44 = [+[VCDefaults sharedInstance] forceEncodeWidth];
    uint64_t v45 = [+[VCDefaults sharedInstance] forceEncodeHeight];
    *(float *)&double v46 = (float)[+[VCDefaults sharedInstance] forceFramerate];
    [v20 setFrameWidth:v44 frameHeight:v45 frameRate:v46];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v47 = VRTraceErrorLogLevelToCSTR();
      __int16 v48 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v99 = v47;
        __int16 v100 = 2080;
        v101 = "-[VCCallSession(PrivateMethods) startVideoSend:error:]";
        __int16 v102 = 1024;
        int v103 = 8546;
        _os_log_impl(&dword_1E1EA4000, v48, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession: forcing camera and encoder settings to forceHWI", buf, 0x1Cu);
      }
    }
  }
  if ([+[VCDefaults sharedInstance] forceScreenHWI])
  {
    uint64_t v49 = [+[VCDefaults sharedInstance] forceEncodeWidth];
    uint64_t v50 = [+[VCDefaults sharedInstance] forceEncodeHeight];
    *(float *)&double v51 = (float)[+[VCDefaults sharedInstance] forceEncodeFramerate];
    [v18 setFrameWidth:v49 frameHeight:v50 frameRate:v51];
    uint64_t v52 = [+[VCDefaults sharedInstance] forceEncodeWidth];
    uint64_t v53 = [+[VCDefaults sharedInstance] forceEncodeHeight];
    *(float *)&double v54 = (float)[+[VCDefaults sharedInstance] forceEncodeFramerate];
    [v19 setFrameWidth:v52 frameHeight:v53 frameRate:v54];
    uint64_t v55 = [+[VCDefaults sharedInstance] forceEncodeWidth];
    uint64_t v56 = [+[VCDefaults sharedInstance] forceEncodeHeight];
    *(float *)&double v57 = (float)[+[VCDefaults sharedInstance] forceEncodeFramerate];
    [v20 setFrameWidth:v55 frameHeight:v56 frameRate:v57];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v58 = VRTraceErrorLogLevelToCSTR();
      uint64_t v59 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v94 = [v20 iWidth];
        int v60 = [v20 iHeight];
        [v20 fRate];
        *(_DWORD *)buf = 136316418;
        uint64_t v99 = v58;
        __int16 v100 = 2080;
        v101 = "-[VCCallSession(PrivateMethods) startVideoSend:error:]";
        __int16 v102 = 1024;
        int v103 = 8556;
        __int16 v104 = 1024;
        *(_DWORD *)v105 = v94;
        *(_WORD *)&v105[4] = 1024;
        *(_DWORD *)&v105[6] = v60;
        *(_WORD *)v106 = 2048;
        *(double *)&v106[2] = v61;
        _os_log_impl(&dword_1E1EA4000, v59, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession: forcing screen sharing encoder settings to %dx%d@%f", buf, 0x32u);
      }
    }
  }
  [(VCCallSession *)self setCurrentEncodeRule:v20];
  if (![(VCConnectionManager *)self->connectionManager getConnectionTypeForActiveConnectionWithQuality:1 forLocalInterface:1]&& [+[VCDefaults sharedInstance] max2GRate] >= 1)
  {
    self->unsigned int callSessionBitrate = [+[VCDefaults sharedInstance] max2GRate];
  }
  [v20 iWidth];
  [v20 iHeight];
  [v20 fRate];
  reportingVideoProp();
  v96[1] = v18;
  v96[2] = v19;
  v96[0] = v20;
  if (![(VCCallSession *)self initializeVideoTransmitter:a4 videoRules:v96 unpausing:v5 reportingAgent:self->reportingAgent fecHeaderV1Enabled:[(VCSwitchManager *)self->_switchManager isSwitchEnabled:0x20000] isFECGeneratorEnabled:[(VCCallSession *)self isFECGeneratorEnabled]])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCallSession(PrivateMethods) startVideoSend:error:]();
      }
    }
    goto LABEL_63;
  }
  if (([(VCCallSessionDelegate *)self->delegate session:self startVideoSend:a4 captureRuleWifi:v18 captureRuleCell:v19 interface:v95 isUnpausing:v5] & 1) == 0)
  {
LABEL_63:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCallSession(PrivateMethods) startVideoSend:error:]();
      }
    }
    return 0;
  }
  VideoReceiver_SetVTHandle((uint64_t)self->hVideoReceiver, (uint64_t)self->hVideoTransmitter);
  [(VCCallSession *)self configureRateController];
  BOOL v62 = [(VCSwitchManager *)self->_switchManager isSwitchEnabled:16];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v63 = VRTraceErrorLogLevelToCSTR();
    int v64 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v99 = v63;
      __int16 v100 = 2080;
      v101 = "-[VCCallSession(PrivateMethods) startVideoSend:error:]";
      __int16 v102 = 1024;
      int v103 = 8592;
      __int16 v104 = 1024;
      *(_DWORD *)v105 = v62;
      _os_log_impl(&dword_1E1EA4000, v64, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Load switch vplrFecEnabled %d", buf, 0x22u);
    }
  }
  if ([(VCMediaNegotiatorResults *)[(VCMediaNegotiatorBase *)self->_mediaNegotiator negotiatedSettings] mediaControlInfoVersion] > 1&& v62)
  {
    uint64_t v65 = 6;
  }
  else
  {
    uint64_t v65 = 5;
  }
  BOOL v66 = [(VCSwitchManager *)self->_switchManager isSwitchEnabled:4];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v67 = VRTraceErrorLogLevelToCSTR();
    uint64_t v68 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v99 = v67;
      __int16 v100 = 2080;
      v101 = "-[VCCallSession(PrivateMethods) startVideoSend:error:]";
      __int16 v102 = 1024;
      int v103 = 8595;
      __int16 v104 = 1024;
      *(_DWORD *)v105 = v66;
      _os_log_impl(&dword_1E1EA4000, v68, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Load switch highFecEnabled %d", buf, 0x22u);
    }
  }
  objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-video-redundancy-percentage-max", @"videoRedundancyPercentageMax", &unk_1F3DC4920, 1), "doubleValue");
  unsigned int v70 = v69;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v71 = VRTraceErrorLogLevelToCSTR();
    long long v72 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v99 = v71;
      __int16 v100 = 2080;
      v101 = "-[VCCallSession(PrivateMethods) startVideoSend:error:]";
      __int16 v102 = 1024;
      int v103 = 8597;
      __int16 v104 = 1024;
      *(_DWORD *)v105 = v70;
      _os_log_impl(&dword_1E1EA4000, v72, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d currentRedundancyPercentage before abTestSwitch %d", buf, 0x22u);
    }
  }
  if (v66) {
    uint64_t v73 = v70;
  }
  else {
    uint64_t v73 = 100;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v74 = VRTraceErrorLogLevelToCSTR();
    int v75 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v99 = v74;
      __int16 v100 = 2080;
      v101 = "-[VCCallSession(PrivateMethods) startVideoSend:error:]";
      __int16 v102 = 1024;
      int v103 = 8599;
      __int16 v104 = 1024;
      *(_DWORD *)v105 = v73;
      _os_log_impl(&dword_1E1EA4000, v75, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d maxAllowedRedundancyPercentage after abTestSwitch %d", buf, 0x22u);
    }
  }
  if (!self->_videoRedundancyController) {
    self->_videoRedundancyController = -[VCRedundancyControllerVideo initWithDelegate:mode:parameters:]([VCRedundancyControllerVideo alloc], "initWithDelegate:mode:parameters:", self, v65, [(AVCRateController *)self->_rateController statisticsCollector], v73);
  }
  if ((VCCallSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_74;
    }
    uint64_t v77 = VRTraceErrorLogLevelToCSTR();
    uint64_t v78 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_74;
    }
    unsigned int callSessionBitrate = self->callSessionBitrate;
    *(_DWORD *)buf = 136315906;
    uint64_t v99 = v77;
    __int16 v100 = 2080;
    v101 = "-[VCCallSession(PrivateMethods) startVideoSend:error:]";
    __int16 v102 = 1024;
    int v103 = 8608;
    __int16 v104 = 1024;
    *(_DWORD *)v105 = callSessionBitrate;
    int v80 = "VCCallSession [%s] %s:%d VCCallSession: startVideo maxBandwidth=%d, ";
    uint64_t v81 = v78;
    uint32_t v82 = 34;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      long long v76 = (__CFString *)[(VCCallSession *)self performSelector:sel_logPrefix];
    }
    else {
      long long v76 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_74;
    }
    uint64_t v83 = VRTraceErrorLogLevelToCSTR();
    long long v84 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_74;
    }
    unsigned int v85 = self->callSessionBitrate;
    *(_DWORD *)buf = 136316418;
    uint64_t v99 = v83;
    __int16 v100 = 2080;
    v101 = "-[VCCallSession(PrivateMethods) startVideoSend:error:]";
    __int16 v102 = 1024;
    int v103 = 8608;
    __int16 v104 = 2112;
    *(void *)v105 = v76;
    *(_WORD *)&v105[8] = 2048;
    *(void *)v106 = self;
    *(_WORD *)&v106[8] = 1024;
    *(_DWORD *)&v106[10] = v85;
    int v80 = "VCCallSession [%s] %s:%d %@(%p) VCCallSession: startVideo maxBandwidth=%d, ";
    uint64_t v81 = v84;
    uint32_t v82 = 54;
  }
  _os_log_impl(&dword_1E1EA4000, v81, OS_LOG_TYPE_DEFAULT, v80, buf, v82);
LABEL_74:
  [(VCCallSession *)self lock];
  BOOL v15 = [(VCCallSession *)self isCallOngoing];
  if (!v15) {
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a4, 32012, 230, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 8617), @"Could not start video.", @"Call already completed");
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v86 = VRTraceErrorLogLevelToCSTR();
    id v87 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v99 = v86;
      __int16 v100 = 2080;
      v101 = "-[VCCallSession(PrivateMethods) startVideoSend:error:]";
      __int16 v102 = 1024;
      int v103 = 8623;
      _os_log_impl(&dword_1E1EA4000, v87, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d startVideoSend: completed.", buf, 0x1Cu);
    }
  }
  [(VCCallSession *)self unlock];
  [(TimingCollection *)self->cameraTimers startTimingForKey:[(VCCallSessionDelegate *)self->delegate currentCameraID]];
  return v15;
}

- (BOOL)startVideoReceive:(id *)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  [(VCCallSession *)self lock];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v7 = [(VCCapabilities *)self->caps isDuplexAudioOnly];
      BOOL v8 = [(VCCapabilities *)self->caps isVideoEnabled];
      BOOL v9 = [(VCCallInfo *)self->localCallInfo videoIsPaused];
      unsigned int v10 = [(VCCapabilities *)self->caps actualVideoCodec];
      int64_t state = self->state;
      *(_DWORD *)buf = 136316930;
      uint64_t v31 = v5;
      __int16 v32 = 2080;
      float v33 = "-[VCCallSession(PrivateMethods) startVideoReceive:]";
      __int16 v34 = 1024;
      int v35 = 8640;
      __int16 v36 = 1024;
      *(_DWORD *)int v37 = v7;
      *(_WORD *)&v37[4] = 1024;
      *(_DWORD *)&v37[6] = v8;
      LOWORD(v38) = 1024;
      *(_DWORD *)((char *)&v38 + 2) = v9;
      HIWORD(v38) = 1024;
      *(_DWORD *)uint64_t v39 = v10;
      *(_WORD *)&v39[4] = 1024;
      int v40 = state;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d startVideoReceive: called: %d %d %d %d %d", buf, 0x3Au);
    }
  }
  if ([(VCCapabilities *)self->caps isDuplexAudioOnly]
    || [(VCCallInfo *)self->localCallInfo videoIsPaused]
    || [(VCCapabilities *)self->caps actualVideoCodec] == -1)
  {
    [(VCCallSession *)self unlock];
    return 1;
  }
  if (![(VCCallSession *)self isCallOngoing] || self->state != 1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCallSession(PrivateMethods) startVideoReceive:]();
      }
    }
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a3, 32012, 229, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 8653), @"Could not start video.", @"Call already completed");
    [(VCCallSession *)self unlock];
    return 0;
  }
  [(VCCallSession *)self unlock];
  BOOL v12 = [(VCSwitchManager *)self->_switchManager isSwitchEnabled:0x20000];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    BOOL v14 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v31 = v13;
      __int16 v32 = 2080;
      float v33 = "-[VCCallSession(PrivateMethods) startVideoReceive:]";
      __int16 v34 = 1024;
      int v35 = 8663;
      __int16 v36 = 1024;
      *(_DWORD *)int v37 = v12;
      _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Load switch fecHeaderV1Enabled %d", buf, 0x22u);
    }
  }
  BOOL v15 = [(VCSwitchManager *)self->_switchManager isSwitchEnabled:0x4000000];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    uint64_t v17 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v31 = v16;
      __int16 v32 = 2080;
      float v33 = "-[VCCallSession(PrivateMethods) startVideoReceive:]";
      __int16 v34 = 1024;
      int v35 = 8666;
      __int16 v36 = 1024;
      *(_DWORD *)int v37 = v15;
      _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Load switch videoJBEnabled %d", buf, 0x22u);
    }
  }
  if (![(VCCallSession *)self initializeVideoReceiver:a3 reportingAgent:self->reportingAgent fecHeaderV1Enabled:v12 videoJBEnabled:v15]|| ([(VCCallSessionDelegate *)self->delegate session:self startVideoReceive:a3] & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCallSession(PrivateMethods) startVideoReceive:]();
      }
    }
    return 0;
  }
  if ((VCCallSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_38;
    }
    uint64_t v21 = VRTraceErrorLogLevelToCSTR();
    uint64_t v22 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_38;
    }
    unsigned int callSessionBitrate = self->callSessionBitrate;
    *(_DWORD *)buf = 136315906;
    uint64_t v31 = v21;
    __int16 v32 = 2080;
    float v33 = "-[VCCallSession(PrivateMethods) startVideoReceive:]";
    __int16 v34 = 1024;
    int v35 = 8679;
    __int16 v36 = 1024;
    *(_DWORD *)int v37 = callSessionBitrate;
    double v24 = "VCCallSession [%s] %s:%d VCCallSession: startVideo maxBandwidth=%d, ";
    float v25 = v22;
    uint32_t v26 = 34;
    goto LABEL_37;
  }
  if (objc_opt_respondsToSelector()) {
    id v18 = (__CFString *)[(VCCallSession *)self performSelector:sel_logPrefix];
  }
  else {
    id v18 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v27 = VRTraceErrorLogLevelToCSTR();
    double v28 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v29 = self->callSessionBitrate;
      *(_DWORD *)buf = 136316418;
      uint64_t v31 = v27;
      __int16 v32 = 2080;
      float v33 = "-[VCCallSession(PrivateMethods) startVideoReceive:]";
      __int16 v34 = 1024;
      int v35 = 8679;
      __int16 v36 = 2112;
      *(void *)int v37 = v18;
      *(_WORD *)&v37[8] = 2048;
      uint64_t v38 = self;
      *(_WORD *)uint64_t v39 = 1024;
      *(_DWORD *)&v39[2] = v29;
      double v24 = "VCCallSession [%s] %s:%d %@(%p) VCCallSession: startVideo maxBandwidth=%d, ";
      float v25 = v28;
      uint32_t v26 = 54;
LABEL_37:
      _os_log_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);
    }
  }
LABEL_38:
  [(VCCallSession *)self lock];
  BOOL v19 = [(VCCallSession *)self isCallOngoing];
  if (!v19) {
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a3, 32012, 230, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 8688), @"Could not start video.", @"Call already completed");
  }
  [(VCCallSession *)self unlock];
  return v19;
}

- (BOOL)startVideo:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  BOOL v7 = [(VCCallSession *)self startVideoReceive:a4];
  if (v7)
  {
    LOBYTE(v7) = [(VCCallSession *)self startVideoSend:v5 error:a4];
  }
  return v7;
}

- (BOOL)stopVideoSend:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    BOOL v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = [(VCCapabilities *)self->caps isDuplexAudioOnly];
      BOOL v10 = [(VCCapabilities *)self->caps isVideoEnabled];
      unsigned int v11 = [(VCCapabilities *)self->caps actualVideoCodec];
      *(_DWORD *)BOOL v15 = 136316418;
      *(void *)&v15[4] = v7;
      __int16 v16 = 2080;
      uint64_t v17 = "-[VCCallSession(PrivateMethods) stopVideoSend:error:]";
      __int16 v18 = 1024;
      int v19 = 8713;
      __int16 v20 = 1024;
      BOOL v21 = v9;
      __int16 v22 = 1024;
      BOOL v23 = v10;
      __int16 v24 = 1024;
      BOOL v25 = v11 == -1;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d stopVideoSend: caps.isDuplexAudioOnldouble y = %d, caps.isVideoEnabled = %d, caps.actualVideoCodec == AV_CODEC_INVALID is %d", v15, 0x2Eu);
    }
  }
  if ([(VCCapabilities *)self->caps actualVideoCodec] == -1) {
    goto LABEL_16;
  }
  if (!v5)
  {
    VideoReceiver_SetVTHandle((uint64_t)self->hVideoReceiver, 0xFFFFFFFFLL);
    MediaQueue_ResetRefreshFrameState();
    [(VCCallSession *)self cleanUpVideoTransmitter];
    videoRedundancyController = self->_videoRedundancyController;
    if (videoRedundancyController)
    {

      self->_videoRedundancyController = 0;
    }
    int v12 = [(VCCallSessionDelegate *)self->delegate stopVideoSend:1 error:a4];
    if (!v12) {
      return v12;
    }
    goto LABEL_14;
  }
  VideoTransmitter_Pause((uint64_t)self->hVideoTransmitter, 1);
  if ([(VCCallSessionDelegate *)self->delegate stopVideoSend:0 error:a4])
  {
LABEL_14:
    int v12 = [(VCCallSessionDelegate *)self->delegate session:self didStopVideoIO:!v5 error:a4];
    if (!v12) {
      return v12;
    }
    [(TimingCollection *)self->cameraTimers stopTimingForKey:[(VCCallSessionDelegate *)self->delegate currentCameraID]];
LABEL_16:
    LOBYTE(v12) = 1;
    return v12;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 3)
  {
LABEL_10:
    LOBYTE(v12) = 0;
    return v12;
  }
  VRTraceErrorLogLevelToCSTR();
  int v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
  if (v12)
  {
    -[VCCallSession(PrivateMethods) stopVideoSend:error:]();
    goto LABEL_10;
  }
  return v12;
}

- (BOOL)stopVideoReceive:(id *)a3 isPausing:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    BOOL v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = [(VCCapabilities *)self->caps isDuplexAudioOnly];
      BOOL v10 = [(VCCapabilities *)self->caps isVideoEnabled];
      unsigned int v11 = [(VCCapabilities *)self->caps actualVideoCodec];
      *(_DWORD *)uint64_t v13 = 136316418;
      *(void *)&v13[4] = v7;
      __int16 v14 = 2080;
      BOOL v15 = "-[VCCallSession(PrivateMethods) stopVideoReceive:isPausing:]";
      __int16 v16 = 1024;
      int v17 = 8759;
      __int16 v18 = 1024;
      BOOL v19 = v9;
      __int16 v20 = 1024;
      BOOL v21 = v10;
      __int16 v22 = 1024;
      BOOL v23 = v11 == -1;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d stopVideoReceive: caps.isDuplexAudioOnldouble y = %d, caps.isVideoEnabled = %d, caps.actualVideoCodec == AV_CODEC_INVALID is %d", v13, 0x2Eu);
    }
  }
  if ([(VCCapabilities *)self->caps isDuplexAudioOnly]
    || [(VCCapabilities *)self->caps actualVideoCodec] == -1)
  {
    return 1;
  }
  [(VCCallSession *)self cleanUpDisplayLink];
  [(VCCallSession *)self cleanUpVideoReceiver];
  return [(VCCallSessionDelegate *)self->delegate session:self stopVideoReceive:a3 isPausing:v4];
}

- (BOOL)stopVideo:(BOOL)a3 error:(id *)a4
{
  BOOL v7 = -[VCCallSession stopVideoSend:error:](self, "stopVideoSend:error:");
  if (v7 && !a3)
  {
    LOBYTE(v7) = [(VCCallSession *)self stopVideoReceive:a4 isPausing:0];
  }
  return v7;
}

- (BOOL)getVideoSettings:(int)a3 forInterface:(int)a4 payload:(int)a5 width:(int *)a6 height:(int *)a7 framerate:(int *)a8 bitRate:(int *)a9
{
  uint64_t v12 = *(void *)&a5;
  uint64_t v13 = *(void *)&a4;
  int v14 = a3;
  __int16 v16 = a9;
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  long long v69 = 0u;
  int v68 = 320;
  *(void *)((char *)&v69 + 4) = 0xF000000140;
  v70[0] = 0xF000000F0;
  v70[1] = 1056964608;
  long long v65 = 0u;
  int v64 = 320;
  *(void *)((char *)&v65 + 4) = 0xF000000140;
  uint64_t v66 = 0xF000000F0;
  uint64_t v67 = 1056964608;
  if (self->operatingMode == 1)
  {
    uint64_t v17 = [(VCConnectionManager *)self->connectionManager getConnectionTypeForActiveConnectionWithQuality:1 forLocalInterface:1];
    if (v13 == 2 && v17 == 3 || (uint64_t v63 = 0, v13 == 1) && v17 != 3)
    {
      id v18 = [(VCBitrateArbiter *)self->callSessionBitrateArbiter maxAllowedBitrateRuleForConnection:v17];
      uint64_t v63 = (void *)[v18 limitingRule];
      if (a9) {
        *a9 = [v18 bitrate];
      }
    }
  }
  else if (a9)
  {
    __int16 v20 = (const void *)VCConnectionManager_CopyConnectionForQuality((uint64_t)self->connectionManager, 1);
    *a9 = [(VCBitrateArbiter *)self->callSessionBitrateArbiter maxAllowedBitrateForVCConnection:v20 forLocalInterface:1 arbiterMode:VCBitrateArbiter_ModeFromOperatingMode(self->operatingMode) encodeRule:self->_currentEncodeRule];
    if (v20) {
      CFRelease(v20);
    }
    uint64_t v63 = 0;
    int v14 = a3;
  }
  else
  {
    uint64_t v63 = 0;
  }
  if (![(VCMediaNegotiator *)self->_mediaNegotiator usePreNegotiation])
  {
    uint64_t v24 = 24;
    if (!self->didSend200OK) {
      uint64_t v24 = 32;
    }
    BOOL v25 = (void *)[*(id *)((char *)&self->super.isa + v24) sdp];
    uint64_t v26 = v25;
    int operatingMode = self->operatingMode;
    int v60 = a7;
    int v61 = v14;
    if (operatingMode == 1)
    {
      uint64_t v28 = 2;
    }
    else
    {
      if (operatingMode != 4)
      {
        __int16 v36 = a8;
        int v37 = 0;
        goto LABEL_33;
      }
      uint64_t v28 = 3;
    }
    __int16 v36 = a8;
    int v37 = (void *)[v25 getMediaLineForType:v28];
LABEL_33:
    -[VCCallSession setImageAttributeRules:](self, "setImageAttributeRules:", [v37 imageAttributeRules]);
    uint64_t v38 = objc_msgSend((id)objc_msgSend(v37, "imageAttributeRules"), "extractDimensionsForInterface:direction:", v13, 1);
    if (objc_msgSend(v38, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", self->videoPayload)))
    {
      +[SDPMediaLine fillImageStructWithDictionary:forInterface:imageStruct:](SDPMediaLine, "fillImageStructWithDictionary:forInterface:imageStruct:", objc_msgSend(v38, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", self->videoPayload)), v13, &v64);
      double v39 = (double)SDWORD1(v65);
      double v40 = (double)(int)v66;
    }
    else
    {
      double v39 = 320.0;
      double v40 = 240.0;
    }
    self->expectedDecodeSize.double width = v39;
    self->expectedDecodeSize.double height = v40;
    uint64_t v41 = objc_msgSend((id)objc_msgSend(v37, "imageAttributeRules"), "extractDimensionsForInterface:direction:", v13, 0);
    if (objc_msgSend(v41, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v12)))
    {
      +[SDPMediaLine fillImageStructWithDictionary:forInterface:imageStruct:](SDPMediaLine, "fillImageStructWithDictionary:forInterface:imageStruct:", objc_msgSend(v41, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", self->videoPayload)), v13, &v68);
    }
    else
    {
      objc_msgSend(v26, "rulesImageSizeForExternalPayload:pWidth:pHeight:", RTPGetExternalPayload((uint64_t)self->rtpVideo, (unsigned __int16)self->videoPayload), (char *)&v69 + 4, v70);
      HIDWORD(v70[0]) = [v26 rulesFramerate:LODWORD(self->videoPayload)];
    }
    a8 = v36;
    a7 = v60;
    __int16 v16 = a9;
    int v14 = v61;
    if (self->operatingMode != 1)
    {
LABEL_48:
      LOBYTE(v33) = 1;
      goto LABEL_49;
    }
    uint64_t v42 = [VCVideoRule alloc];
    *(float *)&double v43 = (float)SHIDWORD(v70[0]);
    __int16 v34 = [(VCVideoRule *)v42 initWithFrameWidth:DWORD1(v69) frameHeight:LODWORD(v70[0]) frameRate:v43];
    goto LABEL_41;
  }
  if (v13 == 2) {
    unsigned __int8 v21 = 1;
  }
  else {
    unsigned __int8 v21 = 2;
  }
  mediaNegotiator = self->_mediaNegotiator;
  if (self->operatingMode == 4) {
    BOOL v23 = [(VCMediaNegotiatorBase *)mediaNegotiator negotiatedScreenSettings];
  }
  else {
    BOOL v23 = [(VCMediaNegotiatorBase *)mediaNegotiator negotiatedVideoSettings];
  }
  unsigned int v29 = [(VCMediaNegotiatorResultsVideo *)v23 videoRuleCollections];
  double v30 = objc_msgSend(-[VCVideoRuleCollections getVideoRulesForTransport:payload:encodingType:](v29, "getVideoRulesForTransport:payload:encodingType:", v21, v12, 2), "firstObject");
  if (v30)
  {
    uint64_t v31 = v30;
    self->expectedDecodeSize.double width = (double)(int)[v30 iWidth];
    double v32 = (double)(int)[v31 iHeight];
  }
  else
  {
    self->expectedDecodeSize.double width = 320.0;
    double v32 = 240.0;
  }
  self->expectedDecodeSize.double height = v32;
  float v33 = (VCVideoRule *)objc_msgSend(-[VCVideoRuleCollections getVideoRulesForTransport:payload:encodingType:](v29, "getVideoRulesForTransport:payload:encodingType:", v21, v12, 1), "firstObject");
  if (!v33) {
    goto LABEL_49;
  }
  __int16 v34 = v33;
  DWORD1(v69) = [(VCVideoRule *)v33 iWidth];
  LODWORD(v70[0]) = [(VCVideoRule *)v34 iHeight];
  [(VCVideoRule *)v34 fRate];
  HIDWORD(v70[0]) = (int)v35;
LABEL_41:
  LOBYTE(v33) = 1;
  if (v63 && v34)
  {
    if ([(VCVideoRule *)v34 compare:v63] == 1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v44 = VRTraceErrorLogLevelToCSTR();
        uint64_t v45 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v59 = [(VCVideoRule *)v34 iWidth];
          int v58 = [(VCVideoRule *)v34 iHeight];
          [(VCVideoRule *)v34 fRate];
          int v62 = v14;
          double v46 = a6;
          int v48 = (int)v47;
          int v49 = [v63 iWidth];
          uint64_t v50 = v16;
          int v51 = [v63 iHeight];
          [v63 fRate];
          *(_DWORD *)buf = 136317186;
          uint64_t v72 = v44;
          __int16 v73 = 2080;
          uint64_t v74 = "-[VCCallSession(PrivateMethods) getVideoSettings:forInterface:payload:width:height:framerate:bitRate:]";
          __int16 v75 = 1024;
          int v76 = 8900;
          __int16 v77 = 1024;
          int v78 = v59;
          __int16 v79 = 1024;
          int v80 = v58;
          __int16 v81 = 1024;
          int v82 = v48;
          a6 = v46;
          int v14 = v62;
          __int16 v83 = 1024;
          int v84 = v49;
          __int16 v85 = 1024;
          int v86 = v51;
          __int16 v16 = v50;
          __int16 v87 = 1024;
          int v88 = (int)v52;
          _os_log_impl(&dword_1E1EA4000, v45, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession: limiting negotiated video settings from %dx%d@%d to %dx%d@%d due to slow connection", buf, 0x40u);
        }
      }
      DWORD1(v69) = [v63 iWidth];
      LODWORD(v70[0]) = [v63 iHeight];
      [v63 fRate];
      HIDWORD(v70[0]) = (int)v53;
    }
    goto LABEL_48;
  }
LABEL_49:
  if (v14 == 2)
  {
    int v56 = v70[0];
    *a6 = DWORD1(v69);
    *a7 = v56;
    *a8 = HIDWORD(v70[0]);
    if (v16 && *a7 * *a6 <= 307200) {
      *__int16 v16 = 802;
    }
  }
  else
  {
    if (v14 == 1)
    {
      int v54 = v70[0];
      *a6 = DWORD1(v69);
      *a7 = v54;
      int v55 = HIDWORD(v70[0]);
    }
    else
    {
      LOBYTE(v33) = 0;
      *a6 = 320;
      *a7 = 240;
      int v55 = 15;
    }
    *a8 = v55;
  }
  return (char)v33;
}

- (BOOL)startMediaQueue:(id *)a3
{
  LODWORD(v3) = self->_vpioFormat.samplesPerFrame;
  double v5 = (double)v3 / self->_vpioFormat.format.mSampleRate;
  MediaQueue_Start();
  RTPSetMediaQueue(v5, (uint64_t)self->rtpHandle, (uint64_t)self->hMediaQueue);
  RTPSetMediaQueue(v5, (uint64_t)self->rtpVideo, (uint64_t)self->hMediaQueue);
  if ([(VCCallInfo *)self->remoteCallInfo useNewPLCalc])
  {
    AFRCSetPLCalc((uint64_t)self->hAFRC, 1);
    MediaQueue_SetPLCalc((uint64_t)self->hMediaQueue, 1);
  }
  RTPSetRedundantAudio((uint64_t)self->rtpHandle, !self->isGKVoiceChat, self->_isRedEnabled);
  return 1;
}

- (BOOL)stopMediaQueue:(id *)a3
{
  self->hMediaQueue = (tagHANDLE *)0xFFFFFFFFLL;
  return 1;
}

- (unsigned)vcrcServerBagProfileNumber
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = +[VCRateControlServerBag profileNumberKeyWithMode:self->operatingMode];
  id v3 = +[GKSConnectivitySettings getVCRCSeverBagConfigWithKey:v2];
  if (v3)
  {
    return [v3 unsignedIntValue];
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136316162;
        uint64_t v8 = v5;
        __int16 v9 = 2080;
        BOOL v10 = "-[VCCallSession(PrivateMethods) vcrcServerBagProfileNumber]";
        __int16 v11 = 1024;
        int v12 = 8981;
        __int16 v13 = 2112;
        id v14 = v2;
        __int16 v15 = 1024;
        int v16 = 0;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Could not find server bag config for %@. Using default value %d", (uint8_t *)&v7, 0x2Cu);
      }
    }
    return 0;
  }
}

- (id)vcrcServerBag
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = +[VCRateControlServerBag keysWithMode:self->operatingMode];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
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
        objc_msgSend(v3, "setObject:forKeyedSubscript:", +[GKSConnectivitySettings getVCRCSeverBagConfigWithKey:](GKSConnectivitySettings, "getVCRCSeverBagConfigWithKey:", *(void *)(*((void *)&v12 + 1) + 8 * v8)), *(void *)(*((void *)&v12 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v11 count:16];
    }
    while (v6);
  }
  __int16 v9 = [[VCRateControlServerBag alloc] initWithMode:self->operatingMode serverBagDict:v3];

  return v9;
}

- (BOOL)startAFRC:(id *)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  if (self->hAFRC != (tagHANDLE *)0xFFFFFFFFLL) {
    return 1;
  }
  CFPropertyListRef v7 = CFPreferencesCopyAppValue(@"enableTFRCLog", @"com.apple.VideoConference");
  if (v7)
  {
    uint64_t v8 = v7;
    int v9 = CFEqual(v7, (CFTypeRef)*MEMORY[0x1E4F1CFD0]);
    BOOL v10 = v9 != 0;
    if (v9)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        long long v12 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v52 = v11;
          *(_WORD *)float v53 = 2080;
          *(void *)&v53[2] = "-[VCCallSession(PrivateMethods) startAFRC:]";
          *(_WORD *)&v53[10] = 1024;
          int v54 = 9008;
          _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Found enableTFRCLog YES. Enable rate control log", buf, 0x1Cu);
        }
      }
    }
    CFRelease(v8);
  }
  else
  {
    BOOL v10 = 0;
  }
  int v40 = -1431655766;
  BOOL v13 = [(VCCallSession *)self evaluateEnableRRx:&v40];
  int IsInterfaceOnCellularForActiveConnectionWithQuality = VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality((uint64_t)self->connectionManager, 1, 0);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    uint64_t v16 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = "YES";
      *(_DWORD *)buf = 136316162;
      if (v40) {
        id v18 = "YES";
      }
      else {
        id v18 = "NO";
      }
      uint64_t v52 = v15;
      *(void *)&v53[2] = "-[VCCallSession(PrivateMethods) startAFRC:]";
      *(_WORD *)float v53 = 2080;
      if (!IsInterfaceOnCellularForActiveConnectionWithQuality) {
        uint64_t v17 = "NO";
      }
      *(_WORD *)&v53[10] = 1024;
      int v54 = 9020;
      *(_WORD *)int v55 = 2080;
      *(void *)&v55[2] = v18;
      *(_WORD *)&v55[10] = 2080;
      int v56 = v17;
      _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Local device uses cellular:[%s], remote device uses cellular:[%s]", buf, 0x30u);
    }
  }
  int v58 = 0;
  int v19 = [(VCConnectionManager *)self->connectionManager connectionCount];
  BOOL v20 = [(VCConnectionManager *)self->connectionManager isLocalCellularInterfaceUsed];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v21 = VRTraceErrorLogLevelToCSTR();
    __int16 v22 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v41 = 136316162;
      uint64_t v42 = v21;
      __int16 v43 = 2080;
      uint64_t v44 = "-[VCCallSession(PrivateMethods) startAFRC:]";
      __int16 v45 = 1024;
      int v46 = 9028;
      __int16 v47 = 1024;
      int v48 = v19;
      __int16 v49 = 1024;
      BOOL v50 = v20;
      _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Current connection number %d, enableBBDump %d", v41, 0x28u);
    }
  }
  *(_DWORD *)buf = v40;
  LODWORD(v52) = IsInterfaceOnCellularForActiveConnectionWithQuality;
  HIDWORD(v52) = [(VCConnectionManager *)self->connectionManager getCellularTechForActiveConnectionWithQuality:1 forLocalInterface:1];
  int v23 = [(VCConnectionManager *)self->connectionManager getCellularTechForActiveConnectionWithQuality:1 forLocalInterface:0];
  int operatingMode = self->operatingMode;
  BOOL v26 = operatingMode == 2 || operatingMode == 7;
  *(_DWORD *)float v53 = v23;
  *(_DWORD *)&v53[4] = v26;
  *(_DWORD *)&v53[8] = v13;
  int v54 = v10;
  *(_DWORD *)int v55 = self->enableRateControlDump;
  *(_DWORD *)&v55[4] = v19;
  *(_DWORD *)&v55[8] = v20;
  LODWORD(v56) = operatingMode == 4;
  HIDWORD(v56) = self->_isRedEnabled;
  unsigned int v57 = [(VCCallSession *)self callID];
  BOOL v27 = [(VCSwitchManager *)self->_switchManager isSwitchEnabled:1024];
  LOBYTE(v58) = v27;
  BYTE2(v58) = self->useVCRC;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v28 = VRTraceErrorLogLevelToCSTR();
    unsigned int v29 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v41 = 136315906;
      uint64_t v42 = v28;
      __int16 v43 = 2080;
      uint64_t v44 = "-[VCCallSession(PrivateMethods) startAFRC:]";
      __int16 v45 = 1024;
      int v46 = 9045;
      __int16 v47 = 1024;
      int v48 = v27;
      _os_log_impl(&dword_1E1EA4000, v29, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Load switch allowBurstyLossRampDownEnabled %d", v41, 0x22u);
    }
  }
  BYTE1(v58) = ![(VCSwitchManager *)self->_switchManager isSwitchEnabled:8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v30 = VRTraceErrorLogLevelToCSTR();
    uint64_t v31 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v32 = [(VCSwitchManager *)self->_switchManager isSwitchEnabled:8];
      *(_DWORD *)uint64_t v41 = 136315906;
      uint64_t v42 = v30;
      __int16 v43 = 2080;
      uint64_t v44 = "-[VCCallSession(PrivateMethods) startAFRC:]";
      __int16 v45 = 1024;
      int v46 = 9047;
      __int16 v47 = 1024;
      int v48 = v32;
      _os_log_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Load switch lowFpsVideoEnabled %d", v41, 0x22u);
    }
  }
  HIBYTE(v58) = [(VCCallSession *)self mediaControlInfoFECFeedbackVersion];
  int v33 = AFRCCreateHandle((uint64_t *)&self->hAFRC, (uint64_t)self->hMediaQueue, self->reportingAgent, (int *)buf);
  BOOL v3 = v33 >= 0;
  if (v33 < 0)
  {
    int v36 = v33;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if (VRTraceIsOSFaultDisabled())
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCallSession(PrivateMethods) startAFRC:]();
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        -[VCCallSession(PrivateMethods) startAFRC:]();
      }
    }
    +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a3, 32000, 231, v36, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 9056), @"Could not setup AFRC", @"could not create handle");
  }
  else
  {
    char v39 = 0;
    if ((AFRCGetSendersLogState((uint64_t)self->hAFRC, (BOOL *)&v39, &self->bBWEstActiveProbingSenderLog) & 0x80000000) == 0) {
      MediaQueue_SetActiveProbingLog((uint64_t)self->hMediaQueue, v39);
    }
    if (!self->bBWEstOperatingModeInitialized
      || [(VCCallSession *)self Conference_SetBWEstMode:self->bBWEstNewBWEstModeEnabled bFakeLargeFrameMode:self->bBWEstFakeLargeFrameModeEnabled] < 0)
    {
      VTP_SetAFRCRecvMode((uint64_t)self->hAFRC, 0);
    }
    RTPSetAFRCHandle((uint64_t)self->rtpHandle, (uint64_t)self->hAFRC);
    RTPSetAFRCHandle((uint64_t)self->rtpVideo, (uint64_t)self->hAFRC);
    mediaController = [[VCRateControlMediaController alloc] initWithMediaQueue:self->hMediaQueue delegate:self];
    self->_mediaController = mediaController;
    if (HIDWORD(v52))
    {
      uint64_t IsLTEOrNewer = NetworkUtils_IsLTEOrNewer(HIDWORD(v52));
      mediaController = self->_mediaController;
    }
    else
    {
      uint64_t IsLTEOrNewer = 1;
    }
    [(VCRateControlMediaController *)mediaController setIsSenderProbingEnabled:IsLTEOrNewer];
    [(VCRateControlMediaController *)self->_mediaController setIsRTPFlushBasebandFromVCRateControl:1];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v37 = VRTraceErrorLogLevelToCSTR();
      uint64_t v38 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v41 = 136315650;
        uint64_t v42 = v37;
        __int16 v43 = 2080;
        uint64_t v44 = "-[VCCallSession(PrivateMethods) startAFRC:]";
        __int16 v45 = 1024;
        int v46 = 9096;
        _os_log_impl(&dword_1E1EA4000, v38, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Starting AFRC", v41, 0x1Cu);
      }
    }
  }
  return v3;
}

- (BOOL)startVCRC:(id *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!self->_rateController)
  {
    long long v15 = 0u;
    uint64_t v18 = 0;
    long long v17 = 0u;
    long long v16 = 0u;
    uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%010u", -[VCCallSession callID](self, "callID", a3));
    BYTE1(v15) = 1;
    id v4 = [(VCCallSession *)self vcrcServerBag];
    reportingAgent = self->reportingAgent;
    *((void *)&v15 + 1) = v4;
    *(void *)&long long v16 = reportingAgent;
    BYTE8(v16) = 1;
    rateController = [[AVCRateController alloc] initWithDelegate:self params:&v14];
    self->_rateController = rateController;
    mediaController = self->_mediaController;
    if (!mediaController)
    {
      uint64_t v8 = [[VCRateControlMediaController alloc] initWithMediaQueue:self->hMediaQueue delegate:self];
      self->_mediaController = v8;
      [(VCRateControlMediaController *)v8 setIsRTPFlushBasebandFromVCRateControl:1];
      rateController = self->_rateController;
      mediaController = self->_mediaController;
    }
    [(AVCRateController *)rateController setMediaController:mediaController];
    [(VCRateControlMediaController *)self->_mediaController setStatisticsCollector:[(AVCRateController *)self->_rateController statisticsCollector]];
    [(AVCStatisticsCollector *)[(VCRateControlMediaController *)self->_mediaController statisticsCollector] setMediaControlInfoFECFeedbackVersion:[(VCCallSession *)self mediaControlInfoFECFeedbackVersion]];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      BOOL v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = self->_rateController;
        long long v12 = self->_mediaController;
        *(_DWORD *)buf = 136316162;
        uint64_t v20 = v9;
        __int16 v21 = 2080;
        __int16 v22 = "-[VCCallSession(PrivateMethods) startVCRC:]";
        __int16 v23 = 1024;
        int v24 = 9120;
        __int16 v25 = 2048;
        BOOL v26 = v11;
        __int16 v27 = 2048;
        uint64_t v28 = v12;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Starting VCRateController (%p) and VCMediaController (%p)", buf, 0x30u);
      }
    }
    [(VCCallSession *)self configureRateController];
    RTPSetStatisticsCollector((uint64_t)self->rtpHandle, [(AVCRateController *)self->_rateController statisticsCollector]);
    RTPSetStatisticsCollector((uint64_t)self->rtpVideo, [(AVCRateController *)self->_rateController statisticsCollector]);
    RTPSetBasebandCongestionDetector((uint64_t)self->rtpHandle, [(AVCRateController *)self->_rateController basebandCongestionDetector]);
    [(AVCRateController *)self->_rateController start];
  }
  return 1;
}

- (BOOL)startRateControl:(id *)a3
{
  if (self->useAFRC && ![(VCCallSession *)self startAFRC:a3])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v7) {
        return v7;
      }
      -[VCCallSession(PrivateMethods) startRateControl:]();
    }
LABEL_15:
    LOBYTE(v7) = 0;
    return v7;
  }
  if (self->useVCRC && ![(VCCallSession *)self startVCRC:a3])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v7) {
        return v7;
      }
      -[VCCallSession(PrivateMethods) startRateControl:]();
    }
    goto LABEL_15;
  }
  hAFRC = self->hAFRC;
  if (hAFRC != (tagHANDLE *)0xFFFFFFFFLL)
  {
    rateController = self->_rateController;
    if (rateController) {
      AFRCSetStatisticsCollector((uint64_t)hAFRC, (uint64_t)[(AVCRateController *)rateController statisticsCollector]);
    }
  }
  LOBYTE(v7) = 1;
  return v7;
}

- (BOOL)stopRateControl:(id *)a3
{
  void v7[5] = *MEMORY[0x1E4F143B8];
  if (self->hAFRC != (tagHANDLE *)0xFFFFFFFFLL)
  {
    VTP_SetAFRCRecvMode(0xFFFFFFFFLL, 0);
    hAFRC = self->hAFRC;
    global_queue = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __49__VCCallSession_PrivateMethods__stopRateControl___block_invoke;
    v7[3] = &__block_descriptor_40_e5_v8__0l;
    v7[4] = hAFRC;
    dispatch_async(global_queue, v7);
    self->hAFRC = (tagHANDLE *)0xFFFFFFFFLL;
  }
  [(AVCRateController *)self->_rateController stop];
  return 1;
}

uint64_t __49__VCCallSession_PrivateMethods__stopRateControl___block_invoke()
{
  return AFRCCloseHandle();
}

- (void)setupAACELDPayload:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v7 = 0;
  int v6 = 0;
  if (![(VCMediaNegotiator *)self->_mediaNegotiator usePreNegotiation])
  {
    if ([(SDPMini *)[(VCCallInfo *)self->remoteCallInfo sdp] getUseSbr:&v7 blockSize:&v6 forAACFormat:v3])
    {
      BOOL useSBR = v7;
      if (v7) {
        BOOL useSBR = self->useSBR;
      }
      self->BOOL useSBR = useSBR;
      if (v6 > self->aacBlockSize) {
        self->aacBlockSize = v6;
      }
    }
    else
    {
      self->BOOL useSBR = 0;
    }
  }
}

- (id)newConfigForPayloadType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v3), @"vcAudioPayloadConfigKeyPayloadType");
  unsigned int v6 = v3 - 104;
  if ((v3 - 104) <= 2) {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->aacBlockSize), @"vcAudioPayloadConfigKeyBlockSize");
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", self->_vpioFormat.format.mSampleRate), @"vcAudioPayloadConfigKeyInputSampleRate");
  if (self->_isUseCaseWatchContinuity) {
    LODWORD(v7) = 1;
  }
  else {
    LODWORD(v7) = 3;
  }
  unsigned int v8 = [+[VCDefaults sharedInstance] forceAudioPacketsPerBundle];
  if (v8) {
    uint64_t v7 = v8;
  }
  else {
    uint64_t v7 = v7;
  }
  if ((v3 - 97) <= 1)
  {
    if (self->_isUseCaseWatchContinuity)
    {
      BOOL v9 = 0;
    }
    else
    {
      int operatingMode = self->operatingMode;
      BOOL v9 = operatingMode == 2 || operatingMode == 7;
    }
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v7), @"vcPayloadConfigKeyInternalBundleFactor");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_isUseCaseWatchContinuity), @"vcPayloadConfigKeyOctetAligned");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v9), @"vcPayloadConfigKeyDTXEnabled");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      int v19 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        isUseCaseWatchContinuitdouble y = self->_isUseCaseWatchContinuity;
        int v23 = 136316418;
        uint64_t v24 = v18;
        __int16 v25 = 2080;
        BOOL v26 = "-[VCCallSession(PrivateMethods) newConfigForPayloadType:]";
        __int16 v27 = 1024;
        int v28 = 9205;
        __int16 v29 = 1024;
        int v30 = v7;
        __int16 v31 = 1024;
        int v32 = isUseCaseWatchContinuity;
        __int16 v33 = 1024;
        BOOL v34 = v9;
        _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d AMR packetsPerBundle[%d] octetAligned[%d] dtxEnabled[%d]", (uint8_t *)&v23, 0x2Eu);
      }
    }
    goto LABEL_34;
  }
  if (v3 != 108)
  {
LABEL_34:
    if (v6 <= 2) {
      objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->useSBR), @"vcPayloadConfigKeyUseSBR");
    }
    goto LABEL_36;
  }
  int v10 = self->operatingMode;
  BOOL v11 = v10 == 2 || v10 == 7;
  uint64_t v12 = v11;
  if (v11) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = 3;
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v12), @"vcPayloadConfigKeyDTXEnabled");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v13), @"vcPayloadConfigKeyEVSSIDPeriod");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    long long v15 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 136316162;
      uint64_t v24 = v14;
      __int16 v25 = 2080;
      BOOL v26 = "-[VCCallSession(PrivateMethods) newConfigForPayloadType:]";
      __int16 v27 = 1024;
      int v28 = 9213;
      __int16 v29 = 1024;
      int v30 = v12;
      __int16 v31 = 1024;
      int v32 = v13;
      _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d EVS dtxEnabled[%d] evsSIDPeriod[%d]", (uint8_t *)&v23, 0x28u);
    }
  }
LABEL_36:
  __int16 v21 = [[VCAudioPayloadConfig alloc] initWithConfigDict:v5];

  return v21;
}

- (id)addAudioPayload:(int)a3
{
  id v4 = [(VCCallSession *)self newConfigForPayloadType:*(void *)&a3];
  id v5 = [[VCAudioPayload alloc] initWithConfig:v4];
  if (v5) {
    [(NSMutableArray *)self->negotiatedAudioPayloads addObject:v5];
  }

  return v5;
}

- (id)negotiatedAudioPayloadTypes
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableArray count](self->negotiatedAudioPayloads, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  negotiatedAudioPayloads = self->negotiatedAudioPayloads;
  uint64_t v5 = [(NSMutableArray *)negotiatedAudioPayloads countByEnumeratingWithState:&v11 objects:v10 count:16];
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
          objc_enumerationMutation(negotiatedAudioPayloads);
        }
        objc_msgSend(v3, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v8++), "config"), "payload")));
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)negotiatedAudioPayloads countByEnumeratingWithState:&v11 objects:v10 count:16];
    }
    while (v6);
  }
  return v3;
}

- (BOOL)setupAudioCodecWithPayload:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long v11 = 136315906;
      *(void *)&v11[4] = v5;
      *(_WORD *)&v11[12] = 2080;
      *(void *)&v11[14] = "-[VCCallSession(PrivateMethods) setupAudioCodecWithPayload:]";
      *(_WORD *)&v11[22] = 1024;
      *(_DWORD *)&v11[24] = 9248;
      *(_WORD *)&v11[28] = 1024;
      *(_DWORD *)&v11[30] = v3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Setting up audioCodec with payload=%d", v11, 0x22u);
    }
  }
  if ((v3 - 104) > 2) {
    self->BOOL useSBR = 0;
  }
  else {
    [(VCCallSession *)self setupAACELDPayload:v3];
  }
  uint64_t v7 = [(VCCallSession *)self addAudioPayload:v3];
  self->currentAudioPayload = v7;
  self->sampleRate = [(VCAudioPayloadConfig *)[(VCAudioPayload *)v7 config] inputSampleRate];
  self->_vpioFormat.samplesPerFrame = [(VCAudioPayloadConfig *)[(VCAudioPayload *)self->currentAudioPayload config] inputSampleRate]/ 0x32;
  uint64_t v8 = [(VCCallSession *)self delegate];
  if (v8) {
    [(VCCallSessionDelegate *)v8 audioIOFormat];
  }
  else {
    memset(v11, 0, sizeof(v11));
  }
  long long v9 = *(_OWORD *)&v11[16];
  *(_OWORD *)&self->_vpioFormat.format.mSampleRate = *(_OWORD *)v11;
  *(_OWORD *)&self->_vpioFormat.format.mBytesPerPacket = v9;
  *(void *)&self->_vpioFormat.format.mBitsPerChannel = *(void *)&v11[32];
  self->_vpioFormat.format.mSampleRate = (double)self->sampleRate;
  return self->currentAudioPayload != 0;
}

- (unsigned)codecBitmapForPayloads:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [a3 countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  unsigned int v6 = 0;
  uint64_t v7 = *(void *)v13;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(a3);
      }
      int v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) intValue];
      if (v9 <= 96)
      {
        if (v9)
        {
          if (v9 == 9)
          {
            v6 |= 0x40u;
          }
          else if (v9 == 13)
          {
            v6 |= 0x8000u;
          }
        }
        else
        {
          v6 |= 4u;
        }
      }
      else if (v9 > 118)
      {
        switch(v9)
        {
          case 'w':
            v6 |= 0x1000u;
            break;
          case 'y':
            v6 |= 0x800u;
            break;
          case 'z':
            v6 |= 0x400u;
            break;
        }
      }
      else
      {
        switch(v9)
        {
          case 'a':
            v6 |= 0x2000u;
            break;
          case 'b':
            v6 |= 0x4000u;
            break;
          case 'h':
            v6 |= 0x200u;
            break;
          case 'i':
            v6 |= 0x100u;
            break;
          case 'j':
            v6 |= 0x80u;
            break;
          case 'l':
            v6 |= 2u;
            break;
          default:
            continue;
        }
      }
    }
    uint64_t v5 = [a3 countByEnumeratingWithState:&v12 objects:v11 count:16];
  }
  while (v5);
  return v6;
}

- (BOOL)choosePayload:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 count];
  if (v5)
  {
    int v6 = +[VCAudioRuleCollection getForcedPayload];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    uint64_t v7 = [a3 countByEnumeratingWithState:&v47 objects:v46 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v48;
      LODWORD(v10) = 128;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v48 != v9) {
            objc_enumerationMutation(a3);
          }
          int v12 = [*(id *)(*((void *)&v47 + 1) + 8 * i) intValue];
          unsigned int preferredAudioCodec = v6;
          if (v6 == 128) {
            unsigned int preferredAudioCodec = self->preferredAudioCodec;
          }
          if (v12 == preferredAudioCodec) {
            uint64_t v10 = preferredAudioCodec;
          }
          else {
            uint64_t v10 = v10;
          }
        }
        uint64_t v8 = [a3 countByEnumeratingWithState:&v47 objects:v46 count:16];
      }
      while (v8);
      if (v10 != 128) {
        goto LABEL_77;
      }
    }
    if (v6 != 128)
    {
LABEL_28:
      LOBYTE(v5) = 0;
      return v5;
    }
    __int16 v14 = [(VCCallSession *)self codecBitmapForPayloads:a3];
    if ((v14 & 0x200) != 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        uint64_t v16 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v40 = 136315650;
          uint64_t v41 = v15;
          __int16 v42 = 2080;
          __int16 v43 = "-[VCCallSession(PrivateMethods) choosePayload:]";
          __int16 v44 = 1024;
          int v45 = 9328;
          _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Selecting PL_AAC_ELD/24000!", (uint8_t *)&v40, 0x1Cu);
        }
      }
      uint64_t v10 = 104;
      goto LABEL_77;
    }
    if ((v14 & 0x100) != 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v17 = VRTraceErrorLogLevelToCSTR();
        uint64_t v18 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v40 = 136315650;
          uint64_t v41 = v17;
          __int16 v42 = 2080;
          __int16 v43 = "-[VCCallSession(PrivateMethods) choosePayload:]";
          __int16 v44 = 1024;
          int v45 = 9331;
          _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Selecting PL_AAC_ELD/22050!", (uint8_t *)&v40, 0x1Cu);
        }
      }
      uint64_t v10 = 105;
      goto LABEL_77;
    }
    if ((v14 & 0x80) != 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v19 = VRTraceErrorLogLevelToCSTR();
        uint64_t v20 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v40 = 136315650;
          uint64_t v41 = v19;
          __int16 v42 = 2080;
          __int16 v43 = "-[VCCallSession(PrivateMethods) choosePayload:]";
          __int16 v44 = 1024;
          int v45 = 9334;
          _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Selecting PL_AAC_ELD/16000!", (uint8_t *)&v40, 0x1Cu);
        }
      }
      uint64_t v10 = 106;
      goto LABEL_77;
    }
    if ((v14 & 0x40) != 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v21 = VRTraceErrorLogLevelToCSTR();
        __int16 v22 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v40 = 136315650;
          uint64_t v41 = v21;
          __int16 v42 = 2080;
          __int16 v43 = "-[VCCallSession(PrivateMethods) choosePayload:]";
          __int16 v44 = 1024;
          int v45 = 9337;
          _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Selecting PL_G722!", (uint8_t *)&v40, 0x1Cu);
        }
      }
      uint64_t v10 = 9;
      goto LABEL_77;
    }
    if ((v14 & 0x1000) != 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v23 = VRTraceErrorLogLevelToCSTR();
        uint64_t v24 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v40 = 136315650;
          uint64_t v41 = v23;
          __int16 v42 = 2080;
          __int16 v43 = "-[VCCallSession(PrivateMethods) choosePayload:]";
          __int16 v44 = 1024;
          int v45 = 9340;
          _os_log_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Selecting PL_OPUS", (uint8_t *)&v40, 0x1Cu);
        }
      }
      uint64_t v10 = 119;
      goto LABEL_77;
    }
    if (v14 < 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v25 = VRTraceErrorLogLevelToCSTR();
        BOOL v26 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v40 = 136315650;
          uint64_t v41 = v25;
          __int16 v42 = 2080;
          __int16 v43 = "-[VCCallSession(PrivateMethods) choosePayload:]";
          __int16 v44 = 1024;
          int v45 = 9343;
          _os_log_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Selecting PL_CN", (uint8_t *)&v40, 0x1Cu);
        }
      }
      uint64_t v10 = 13;
      goto LABEL_77;
    }
    if ((v14 & 0x400) != 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v27 = VRTraceErrorLogLevelToCSTR();
        int v28 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v40 = 136315650;
          uint64_t v41 = v27;
          __int16 v42 = 2080;
          __int16 v43 = "-[VCCallSession(PrivateMethods) choosePayload:]";
          __int16 v44 = 1024;
          int v45 = 9346;
          _os_log_impl(&dword_1E1EA4000, v28, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Selecting PL_SPEEX_8K", (uint8_t *)&v40, 0x1Cu);
        }
      }
      uint64_t v10 = 122;
      goto LABEL_77;
    }
    if ((v14 & 0x800) != 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v29 = VRTraceErrorLogLevelToCSTR();
        int v30 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v40 = 136315650;
          uint64_t v41 = v29;
          __int16 v42 = 2080;
          __int16 v43 = "-[VCCallSession(PrivateMethods) choosePayload:]";
          __int16 v44 = 1024;
          int v45 = 9349;
          _os_log_impl(&dword_1E1EA4000, v30, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Selecting PL_SPEEX_16K", (uint8_t *)&v40, 0x1Cu);
        }
      }
      uint64_t v10 = 121;
      goto LABEL_77;
    }
    if ((v14 & 4) == 0)
    {
      if ((v14 & 0x4000) != 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v33 = VRTraceErrorLogLevelToCSTR();
          BOOL v34 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v40 = 136315650;
            uint64_t v41 = v33;
            __int16 v42 = 2080;
            __int16 v43 = "-[VCCallSession(PrivateMethods) choosePayload:]";
            __int16 v44 = 1024;
            int v45 = 9355;
            _os_log_impl(&dword_1E1EA4000, v34, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Selecting PL_AMR_16000!", (uint8_t *)&v40, 0x1Cu);
          }
        }
        uint64_t v10 = 98;
      }
      else if ((v14 & 0x2000) != 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v35 = VRTraceErrorLogLevelToCSTR();
          int v36 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v40 = 136315650;
            uint64_t v41 = v35;
            __int16 v42 = 2080;
            __int16 v43 = "-[VCCallSession(PrivateMethods) choosePayload:]";
            __int16 v44 = 1024;
            int v45 = 9358;
            _os_log_impl(&dword_1E1EA4000, v36, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Selecting PL_AMR_8000!", (uint8_t *)&v40, 0x1Cu);
          }
        }
        uint64_t v10 = 97;
      }
      else
      {
        if ((v14 & 2) == 0) {
          goto LABEL_28;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v37 = VRTraceErrorLogLevelToCSTR();
          uint64_t v38 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v40 = 136315650;
            uint64_t v41 = v37;
            __int16 v42 = 2080;
            __int16 v43 = "-[VCCallSession(PrivateMethods) choosePayload:]";
            __int16 v44 = 1024;
            int v45 = 9361;
            _os_log_impl(&dword_1E1EA4000, v38, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Selecting PL_EVS_32000!", (uint8_t *)&v40, 0x1Cu);
          }
        }
        uint64_t v10 = 108;
      }
LABEL_77:
      LOBYTE(v5) = [(VCCallSession *)self setupAudioCodecWithPayload:v10];
      return v5;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v31 = VRTraceErrorLogLevelToCSTR();
      int v32 = *MEMORY[0x1E4F47A50];
      uint64_t v10 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_77;
      }
      int v40 = 136315650;
      uint64_t v41 = v31;
      __int16 v42 = 2080;
      __int16 v43 = "-[VCCallSession(PrivateMethods) choosePayload:]";
      __int16 v44 = 1024;
      int v45 = 9352;
      _os_log_impl(&dword_1E1EA4000, v32, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Selecting MULAW!", (uint8_t *)&v40, 0x1Cu);
    }
    uint64_t v10 = 0;
    goto LABEL_77;
  }
  return v5;
}

- (BOOL)chooseSecondaryPayloads:(id)a3
{
  __int16 v4 = [(VCCallSession *)self codecBitmapForPayloads:a3];
  int v5 = [(VCAudioPayloadConfig *)[(VCAudioPayload *)self->currentAudioPayload config] payload];
  int v6 = v5;
  int v7 = 0;
  if ((v4 & 0x80) != 0 && v5 != 106) {
    int v7 = [(VCCallSession *)self addAudioPayload:106] != 0;
  }
  if ((v4 & 0x800) != 0 && v6 != 121 && [(VCCallSession *)self addAudioPayload:121]) {
    ++v7;
  }
  if ((v4 & 0x400) != 0 && v6 != 122 && [(VCCallSession *)self addAudioPayload:122]) {
    ++v7;
  }
  if ((v4 & 0x1000) != 0 && v6 != 119 && [(VCCallSession *)self addAudioPayload:119]) {
    ++v7;
  }
  if ((v4 & 0x4000) != 0 && v6 != 98 && [(VCCallSession *)self addAudioPayload:98]) {
    ++v7;
  }
  if ((v4 & 0x2000) != 0 && v6 != 97 && [(VCCallSession *)self addAudioPayload:97]) {
    ++v7;
  }
  if ((v4 & 2) != 0 && v6 != 108 && [(VCCallSession *)self addAudioPayload:108]) {
    ++v7;
  }
  return v7 != 0;
}

- (BOOL)chooseDTXPayloads:(id)a3
{
  if (([(VCCallSession *)self codecBitmapForPayloads:a3] & 0x8000) == 0
    || [(VCAudioPayloadConfig *)[(VCAudioPayload *)self->currentAudioPayload config] payload] == 13)
  {
    return 0;
  }
  self->currentDTXPayload = (VCAudioPayload *)[(VCCallSession *)self addAudioPayload:13];
  return 1;
}

- (void)shutdownVoiceChatFromRemoteSIPSignal:(int)a3 withReason:(const char *)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v7 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  v18[0] = 0;
  unsigned int v8 = [(VCCallSession *)self primaryConnectionType];
  switch(a3)
  {
    case 0:
      +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", v18, 32003, 235, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 9470), @"Remote participant hangup.", @"Remote participant hangup.");
      global_queue = dispatch_get_global_queue(2, 0);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __81__VCCallSession_PrivateMethods__shutdownVoiceChatFromRemoteSIPSignal_withReason___block_invoke_3;
      v15[3] = &unk_1E6DB3E40;
      v15[4] = self;
      v15[5] = v18[0];
      uint64_t v10 = v15;
      goto LABEL_10;
    case 3:
      if (a4) {
        a4 = (const char *)[NSString stringWithUTF8String:a4];
      }
      if ([(VCConnectionManager *)self->connectionManager isConnectedOnRelayForActiveConnectionWithQuality:1])
      {
        uint64_t v11 = 252;
      }
      else
      {
        uint64_t v11 = 216;
      }
      uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 9443);
      +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", v18, 32002, v11, v12, [NSString stringWithFormat:@"SIP failed with internal fatal error"], a4);
      global_queue = dispatch_get_global_queue(2, 0);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __81__VCCallSession_PrivateMethods__shutdownVoiceChatFromRemoteSIPSignal_withReason___block_invoke;
      v17[3] = &unk_1E6DB3E40;
      v17[4] = self;
      v17[5] = v18[0];
      uint64_t v10 = v17;
      goto LABEL_10;
    case 5:
      +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", v18, 32009, 234, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 9457), @"Remote participant cancelled request.", @"Remote participant cancelled session.");
      global_queue = dispatch_get_global_queue(2, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __81__VCCallSession_PrivateMethods__shutdownVoiceChatFromRemoteSIPSignal_withReason___block_invoke_2;
      block[3] = &unk_1E6DB3E40;
      block[4] = self;
      void block[5] = v18[0];
      uint64_t v10 = block;
LABEL_10:
      dispatch_async(global_queue, v10);
      break;
    case 8:
      uint64_t v13 = 232;
      if (v8 > 2) {
        uint64_t v13 = 254;
      }
      if (v8 == 2) {
        uint64_t v14 = 253;
      }
      else {
        uint64_t v14 = v13;
      }
      [(VCCallSession *)self disconnectWithNoRemotePackets:v14];
      break;
    default:
      break;
  }
}

uint64_t __81__VCCallSession_PrivateMethods__shutdownVoiceChatFromRemoteSIPSignal_withReason___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) disconnect:*(void *)(a1 + 40) didRemoteCancel:0];
}

uint64_t __81__VCCallSession_PrivateMethods__shutdownVoiceChatFromRemoteSIPSignal_withReason___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) disconnect:*(void *)(a1 + 40) didRemoteCancel:0];
}

uint64_t __81__VCCallSession_PrivateMethods__shutdownVoiceChatFromRemoteSIPSignal_withReason___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) disconnect:*(void *)(a1 + 40) didRemoteCancel:0];
}

- (void)sipConnectThreadProc:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3052000000;
  uint64_t v20 = __Block_byref_object_copy__15;
  uint64_t v21 = __Block_byref_object_dispose__15;
  uint64_t v22 = 0;
  if (self->_sipState != 5
    || ![(VCCallSession *)self sipConnectWithError:&v22]
    || [(VCMediaNegotiator *)self->_mediaNegotiator usePreNegotiation])
  {
    goto LABEL_38;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  if ([(VCCapabilities *)self->caps isKeyExchangeEnabled]
    || [(VCCapabilities *)self->caps isDTLSEnabled])
  {
    CFTypeRef cf = 0;
    [(TimingCollection *)self->perfTimers stopTimingForKey:3];
    if ([(VCCapabilities *)self->caps isDTLSEnabled])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v5 = VRTraceErrorLogLevelToCSTR();
        int v6 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = v5;
          *(_WORD *)&unsigned char buf[12] = 2080;
          *(void *)&buf[14] = "-[VCCallSession(PrivateMethods) sipConnectThreadProc:]";
          *(_WORD *)&buf[22] = 1024;
          int v24 = 9534;
          _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d ---- check use dtls-srtp key", buf, 0x1Cu);
        }
      }
      if (self->srtpKeyBytes)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v7 = VRTraceErrorLogLevelToCSTR();
          unsigned int v8 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            *(void *)&uint8_t buf[4] = v7;
            *(_WORD *)&unsigned char buf[12] = 2080;
            *(void *)&buf[14] = "-[VCCallSession(PrivateMethods) sipConnectThreadProc:]";
            *(_WORD *)&buf[22] = 1024;
            int v24 = 9536;
            _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d ---- keyex use dtls-srtp key", buf, 0x1Cu);
          }
        }
        CFTypeRef cf = CFRetain(self->srtpKeyBytes);
        if (!cf) {
          goto LABEL_31;
        }
        goto LABEL_30;
      }
    }
    else if ([(VCCallSession *)self isSKEOptimizationEnabled])
    {
      [(VCCallSession *)self lock];
      secretKedouble y = self->secretKey;
      if (secretKey)
      {
        CFTypeRef cf = CFRetain(secretKey);
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCallSession(PrivateMethods) sipConnectThreadProc:]();
        }
      }
      [(VCCallSession *)self unlock];
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        uint64_t v11 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = v10;
          *(_WORD *)&unsigned char buf[12] = 2080;
          *(void *)&buf[14] = "-[VCCallSession(PrivateMethods) sipConnectThreadProc:]";
          *(_WORD *)&buf[22] = 1024;
          int v24 = 9520;
          _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d ---- keyex initiate exchange", buf, 0x1Cu);
        }
      }
      [(TimingCollection *)self->perfTimers startTimingForKey:4];
      int v12 = SIPKeyExchange((uint64_t *)&self->hSIP, [(VCCallInfo *)self->localCallInfo callID], 0, &cf, 0);
      [(TimingCollection *)self->perfTimers stopTimingForKey:4];
      if (v12 == -2146828235)
      {
        [v4 drain];
        goto LABEL_38;
      }
    }
    if (cf)
    {
LABEL_30:
      *(_DWORD *)buf = 1;
      [(VCCallSession *)self setupEncryptionWithKey:&cf confIndex:buf];
      CFRelease(cf);
    }
  }
  else
  {
    [(TimingCollection *)self->perfTimers removeTimingForKey:3];
  }
LABEL_31:
  [(TimingCollection *)self->perfTimers startTimingForKey:5];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __54__VCCallSession_PrivateMethods__sipConnectThreadProc___block_invoke;
  v15[3] = &unk_1E6DB5838;
  v15[4] = self;
  -[VCCallSession startAudioWithCompletionHandler:](self, "startAudioWithCompletionHandler:", (id)[v15 copy]);
  [(TimingCollection *)self->perfTimers startTimingForKey:6];
  [(TimingCollection *)self->perfTimers startTimingForKey:7];
  [(VCCallSession *)self setUpFirstRemoteFrameTimer];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v24) = 1;
  videoQueue = self->videoQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__VCCallSession_PrivateMethods__sipConnectThreadProc___block_invoke_2;
  block[3] = &unk_1E6DB7440;
  block[4] = self;
  void block[5] = buf;
  void block[6] = &v17;
  dispatch_sync(videoQueue, block);
  if (*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    if ([(VCCallInfo *)self->localCallInfo videoIsPaused]) {
      [(VCCallSession *)self setPauseVideo:1 force:1 error:0];
    }
    [(VCCallSession *)self lock];
    [(VCCallSession *)self enableSessionHealthMonitor];
    [(VCCallSession *)self unlock];
    if ([(VCCallSession *)self shouldNotifyDelegateDidStartBeforeAudioSetup])
    {
      [(VCCallSession *)self notifyDelegateSessionStarted];
    }
  }
  else
  {
    reportingSymptom();
    [(TimingCollection *)self->perfTimers stopTimingForKey:7];
    [(VCCallSession *)self cancelFirstRemoteFrameTimer];
    [(VCCallSession *)self disconnect:v18[5] didRemoteCancel:0];
  }
  [(TimingCollection *)self->perfTimers stopTimingForKey:6];
  [(VCCallSession *)self handlePendingPrimaryConnectionChange];

  _Block_object_dispose(buf, 8);
LABEL_38:
  _Block_object_dispose(&v17, 8);
}

uint64_t __54__VCCallSession_PrivateMethods__sipConnectThreadProc___block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  [*(id *)(*(void *)(a1 + 32) + 672) stopTimingForKey:5];
  int v6 = *(unsigned char **)(a1 + 32);
  if (a2)
  {
    if (v6[408])
    {
      [*(id *)(a1 + 32) setPauseAudio:1 force:1 error:0];
      int v6 = *(unsigned char **)(a1 + 32);
    }
    [v6 updateLastReceivedPacketWithTimestamp:1 packetType:micro() + 10.0];
  }
  else
  {
    reportingSymptom();
    [*(id *)(a1 + 32) disconnect:a3 didRemoteCancel:0];
  }
  uint64_t result = [*(id *)(a1 + 32) shouldNotifyDelegateDidStartBeforeAudioSetup];
  if ((result & 1) == 0)
  {
    unsigned int v8 = *(void **)(a1 + 32);
    return [v8 notifyDelegateSessionStarted];
  }
  return result;
}

uint64_t __54__VCCallSession_PrivateMethods__sipConnectThreadProc___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) startVideo:0 error:*(void *)(*(void *)(a1 + 48) + 8) + 40];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)shouldNotifyDelegateDidStartBeforeAudioSetup
{
  if ([(VCCallSession *)self deviceRole] == 4
    || [(VCCallSession *)self deviceRole] == 5
    || ![(VCCapabilities *)self->caps isAudioEnabled]
    || [(VCCapabilities *)self->caps isVideoEnabled])
  {
    return 1;
  }

  return [(VCCallSession *)self isGKVoiceChat];
}

- (unsigned)audioRTPID
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unsigned int v9 = 0;
  int v3 = RTPGetLocalSSRC((uint64_t)self->rtpHandle, &v9);
  if ((v3 & 0x80000000) == 0) {
    return v9;
  }
  int v5 = v3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    unsigned int result = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    rtpint Handle = self->rtpHandle;
    *(_DWORD *)buf = 136316418;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    uint64_t v13 = "-[VCCallSession(PrivateMethods) audioRTPID]";
    __int16 v14 = 1024;
    int v15 = 9631;
    __int16 v16 = 1024;
    int v17 = 9631;
    __int16 v18 = 1024;
    int v19 = v5;
    __int16 v20 = 2048;
    uint64_t v21 = rtpHandle;
    _os_log_error_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_ERROR, "VCCallSession [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m:%d: RTPGetLocalSSRC for audio failed (%08X) handle = %p", buf, 0x32u);
  }
  return 0;
}

- (unsigned)videoRTPID
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = 0;
  if ((RTPGetLocalSSRC((uint64_t)self->rtpVideo, &v3) & 0x80000000) == 0) {
    return v3;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    unsigned int result = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    -[VCCallSession(PrivateMethods) videoRTPID]();
  }
  return 0;
}

- (void)doSipEndProc:(id)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  -[VCCallSession doSipEndAction:callID:error:](self, "doSipEndAction:callID:error:", [a3 intValue], -[VCCallInfo callID](self->localCallInfo, "callID"), 0);
}

- (void)disconnectWithNoRemotePackets:(int64_t)a3
{
}

- (void)disconnectWithNoRemotePackets:(int64_t)a3 timeoutUsed:(double)a4
{
  v8[7] = *MEMORY[0x1E4F143B8];
  global_queue = dispatch_get_global_queue(2, 0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __75__VCCallSession_PrivateMethods__disconnectWithNoRemotePackets_timeoutUsed___block_invoke;
  v8[3] = &unk_1E6DB4518;
  v8[4] = self;
  void v8[5] = a3;
  *(double *)&void v8[6] = a4;
  dispatch_async(global_queue, v8);
}

uint64_t __75__VCCallSession_PrivateMethods__disconnectWithNoRemotePackets_timeoutUsed___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    unsigned int v3 = *MEMORY[0x1E4F47A50];
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = [*(id *)(*(void *)(a1 + 32) + 24) callID];
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = v2;
        __int16 v12 = 2080;
        uint64_t v13 = "-[VCCallSession(PrivateMethods) disconnectWithNoRemotePackets:timeoutUsed:]_block_invoke";
        __int16 v14 = 1024;
        int v15 = 9664;
        __int16 v16 = 1024;
        int v17 = v5;
        _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Failing due to no remote packets.  local callid: %x", buf, 0x22u);
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      __75__VCCallSession_PrivateMethods__disconnectWithNoRemotePackets_timeoutUsed___block_invoke_cold_1();
    }
  }
  *(void *)buf = 0;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  if (!*(unsigned char *)(v6 + 993)) {
    [*(id *)(v6 + 1512) reportNetworkConditionsDegraded];
  }
  uint64_t v8 = (int)*(double *)(a1 + 48);
  uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 9677);
  +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", buf, 32001, v7, v8, v9, objc_msgSend(NSString, "stringWithFormat:", @"No remote packets for %d seconds", (int)*(double *)(a1 + 48)), @"Remote network outage?");
  return [*(id *)(a1 + 32) disconnect:*(void *)buf didRemoteCancel:0];
}

- (void)doSipEndAction:(int)a3 callID:(unsigned int)a4 error:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 2:
LABEL_9:
      SIPCancel((uint64_t)self->hSIP, v5);
      break;
    case 1:
      uint64_t v8 = (void *)[a5 userInfo];
      int v9 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", @"NSErrorUserInfoDetailedError"), "unsignedIntValue");
      uint64_t v10 = (__CFString *)[v8 objectForKeyedSubscript:*MEMORY[0x1E4F28588]];
      if (!v10) {
        uint64_t v10 = @"Normal Call Termination";
      }
      [(__CFString *)v10 UTF8String];
      if ((SIPHangupWithTimeout((uint64_t *)&self->hSIP, v5, 0x1388uLL, v9) & 0x80000000) != 0) {
        SIPCloseCall((uint64_t)self->hSIP, v5);
      }
      goto LABEL_9;
    case 0:
      SIPCloseCall((uint64_t)self->hSIP, a4);
      break;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    __int16 v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315906;
      uint64_t v14 = v11;
      __int16 v15 = 2080;
      __int16 v16 = "-[VCCallSession(PrivateMethods) doSipEndAction:callID:error:]";
      __int16 v17 = 1024;
      int v18 = 9711;
      __int16 v19 = 1024;
      int v20 = a3;
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Finished sip end action %d", (uint8_t *)&v13, 0x22u);
    }
  }
}

- (void)notifyDelegateSessionStarted
{
  v3[5] = *MEMORY[0x1E4F143B8];
  self->BOOL sentClientSuccessfulDidStart = 1;
  delegateNotificationQueue = self->delegateNotificationQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  void v3[2] = __61__VCCallSession_PrivateMethods__notifyDelegateSessionStarted__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(delegateNotificationQueue, v3);
}

uint64_t __61__VCCallSession_PrivateMethods__notifyDelegateSessionStarted__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)VCConnectionManager_CopyPrimaryConnection(*(void *)(*(void *)(a1 + 32) + 80));
  unsigned int v3 = (void *)[v2 localInterfaceTypeString];
  uint64_t v4 = (void *)[v2 remoteInterfaceTypeString];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "session:didStart:connectionType:localInterfaceType:remoteInterfaceType:error:", *(void *)(a1 + 32), 1, objc_msgSend(v2, "type"), v3, v4, 0);
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 1392);
  uint64_t v6 = [v3 UTF8String];
  uint64_t v7 = [v4 UTF8String];

  return MEMORY[0x1F4105AC8](v5, v6, v7);
}

- (int)Conference_SetBWEstMode:(BOOL)a3 bFakeLargeFrameMode:(BOOL)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  hAFRC = self->hAFRC;
  if (hAFRC == (tagHANDLE *)0xFFFFFFFFLL)
  {
    int v7 = 0;
    self->bBWEstOperatingModeInitialized = 1;
    self->bBWEstNewBWEstModeEnabled = a3;
    self->bBWEstFakeLargeFrameModeEnabled = a4;
  }
  else
  {
    self->bBWEstNewBWEstModeEnabled = a3;
    self->bBWEstFakeLargeFrameModeEnabled = a4;
    int v6 = AFRCSetBWEstMode((uint64_t)hAFRC, a3, [(VCCallInfo *)self->remoteCallInfo isIOS]);
    if (v6 < 0)
    {
      return v6;
    }
    else
    {
      __int16 v9 = 0;
      int v7 = AFRCGetSenderRecvrModes((uint64_t)self->hAFRC, (unsigned char *)&v9 + 1, &v9);
      if ((v7 & 0x80000000) == 0)
      {
        MediaQueue_SetAFRCSendMode((uint64_t)self->hMediaQueue, SHIBYTE(v9));
        VTP_SetAFRCRecvMode((uint64_t)self->hAFRC, v9);
        RTPSetAFRCRecvMode((uint64_t)self->rtpHandle, v9);
        RTPSetAFRCRecvMode((uint64_t)self->rtpVideo, v9);
        [(VCCallSessionDelegate *)self->delegate setBWEOptions:self->bBWEstOperatingModeInitialized UseNewBWEMode:self->bBWEstNewBWEstModeEnabled FakeLargeFrameMode:self->bBWEstFakeLargeFrameModeEnabled ProbingSenderLog:self->bBWEstActiveProbingSenderLog];
      }
    }
  }
  return v7;
}

- (void)setLocalIdentityForKeyExchange
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = [(VCCallSession *)self retrieveIdentity];
  if (v3)
  {
    uint64_t v4 = v3;
    if (self->hSIP != (tagHANDLE *)0xFFFFFFFFLL)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v5 = VRTraceErrorLogLevelToCSTR();
        int v6 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          BOOL v7 = [(VCCapabilities *)self->caps isKeyExchangeEnabled];
          uint64_t v8 = objc_msgSend((id)-[__SecIdentity description](v4, "description"), "UTF8String");
          peerCN = self->peerCN;
          if (peerCN) {
            uint64_t v10 = [[(NSString *)peerCN description] UTF8String];
          }
          else {
            uint64_t v10 = "<nil>";
          }
          caps = self->caps;
          if (caps) {
            __int16 v15 = (const char *)objc_msgSend(-[VCCapabilities description](caps, "description"), "UTF8String");
          }
          else {
            __int16 v15 = "<nil>";
          }
          *(_DWORD *)buf = 136316674;
          uint64_t v18 = v5;
          __int16 v19 = 2080;
          int v20 = "-[VCCallSession(PrivateMethods) setLocalIdentityForKeyExchange]";
          __int16 v21 = 1024;
          int v22 = 9782;
          __int16 v23 = 1024;
          BOOL v24 = v7;
          __int16 v25 = 2080;
          uint64_t v26 = v8;
          __int16 v27 = 2080;
          int v28 = v10;
          __int16 v29 = 2080;
          int v30 = v15;
          _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d SIPSetDoKeyExchange = %d, ident = %s, peerCN =%s, caps = %s", buf, 0x40u);
        }
      }
      SIPSetDoKeyExchange((uint64_t)self->hSIP, 0, v4);
    }
    CFRelease(v4);
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      __int16 v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v18 = v11;
        __int16 v19 = 2080;
        int v20 = "-[VCCallSession(PrivateMethods) setLocalIdentityForKeyExchange]";
        __int16 v21 = 1024;
        int v22 = 9789;
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Failed retreiving the localIdentity from APS", buf, 0x1Cu);
      }
    }
    global_queue = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__VCCallSession_PrivateMethods__setLocalIdentityForKeyExchange__block_invoke;
    block[3] = &unk_1E6DB3DC8;
    block[4] = self;
    dispatch_async(global_queue, block);
  }
}

uint64_t __63__VCCallSession_PrivateMethods__setLocalIdentityForKeyExchange__block_invoke(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  +[GKVoiceChatError getNSError:v3 code:32021 detailedCode:0 filePath:0 description:@"We could not establish end-to-end security for this call." reason:@"No local identity could be retrieved."];
  return [*(id *)(a1 + 32) disconnect:v3[0] didRemoteCancel:0];
}

- (void)logIdentity:(__SecIdentity *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    SecCertificateRef certificateRef = (SecCertificateRef)0xAAAAAAAAAAAAAAAALL;
    if (SecIdentityCopyCertificate(a3, &certificateRef))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v3 = VRTraceErrorLogLevelToCSTR();
        uint64_t v4 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v20 = v3;
          __int16 v21 = 2080;
          int v22 = "-[VCCallSession(PrivateMethods) logIdentity:]";
          __int16 v23 = 1024;
          int v24 = 9807;
          uint64_t v5 = "VCCallSession [%s] %s:%d setLocalIdentityForKeyExchange: SecIdentityCopyCertificate error";
LABEL_6:
          _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 0x1Cu);
        }
      }
    }
    else if (certificateRef)
    {
      int v6 = (void *)SecCertificateCopyCommonNames();
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        uint64_t v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v20 = v7;
          __int16 v21 = 2080;
          int v22 = "-[VCCallSession(PrivateMethods) logIdentity:]";
          __int16 v23 = 1024;
          int v24 = 9826;
          _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d setLocalIdentityForKeyExchange: display common name(s) from local cert...", buf, 0x1Cu);
        }
      }
      int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if (v6)
      {
        if (ErrorLogLevelForModule >= 7)
        {
          uint64_t v10 = VRTraceErrorLogLevelToCSTR();
          uint64_t v11 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v12 = objc_msgSend((id)objc_msgSend(v6, "description"), "UTF8String");
            *(_DWORD *)buf = 136315906;
            uint64_t v20 = v10;
            __int16 v21 = 2080;
            int v22 = "-[VCCallSession(PrivateMethods) logIdentity:]";
            __int16 v23 = 1024;
            int v24 = 9829;
            __int16 v25 = 2080;
            uint64_t v26 = v12;
            _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d %s", buf, 0x26u);
          }
        }
        CFRelease(v6);
      }
      else if (ErrorLogLevelForModule >= 7)
      {
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        __int16 v15 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v20 = v14;
          __int16 v21 = 2080;
          int v22 = "-[VCCallSession(PrivateMethods) logIdentity:]";
          __int16 v23 = 1024;
          int v24 = 9832;
          _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d setLocalIdentityForKeyExchange: no common name(s) found in local cert...", buf, 0x1Cu);
        }
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v16 = VRTraceErrorLogLevelToCSTR();
        __int16 v17 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v20 = v16;
          __int16 v21 = 2080;
          int v22 = "-[VCCallSession(PrivateMethods) logIdentity:]";
          __int16 v23 = 1024;
          int v24 = 9835;
          _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d setLocalIdentityForKeyExchange: done displaying common name(s) from local cert...", buf, 0x1Cu);
        }
      }
      CFRelease(certificateRef);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v20 = v13;
        __int16 v21 = 2080;
        int v22 = "-[VCCallSession(PrivateMethods) logIdentity:]";
        __int16 v23 = 1024;
        int v24 = 9838;
        uint64_t v5 = "VCCallSession [%s] %s:%d setLocalIdentityForKeyExchange: no local cert found...";
        goto LABEL_6;
      }
    }
  }
}

- (id)pickFeaturesStringForPayload:(int)a3 featureListDict:(id)a4 remote:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = objc_msgSend(a4, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"));
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v8)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (v5) {
          uint64_t v12 = "remote";
        }
        else {
          uint64_t v12 = "local";
        }
        if (a4) {
          uint64_t v13 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
        }
        else {
          uint64_t v13 = "<nil>";
        }
        int v17 = 136316674;
        uint64_t v18 = v10;
        __int16 v19 = 2080;
        uint64_t v20 = "-[VCCallSession(PrivateMethods) pickFeaturesStringForPayload:featureListDict:remote:]";
        __int16 v21 = 1024;
        int v22 = 9857;
        __int16 v23 = 1024;
        int v24 = a3;
        __int16 v25 = 2080;
        uint64_t v26 = v12;
        __int16 v27 = 2080;
        int v28 = v13;
        __int16 v29 = 2080;
        uint64_t v30 = objc_msgSend((id)objc_msgSend(v8, "description"), "UTF8String");
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d pickFeaturesStringForPayload for %d (%s) from %s: %s", (uint8_t *)&v17, 0x40u);
      }
    }
    return (id)[NSString stringWithString:v8];
  }
  else
  {
    if (ErrorLogLevelForModule >= 5)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      __int16 v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136315906;
        uint64_t v18 = v14;
        __int16 v19 = 2080;
        uint64_t v20 = "-[VCCallSession(PrivateMethods) pickFeaturesStringForPayload:featureListDict:remote:]";
        __int16 v21 = 1024;
        int v22 = 9851;
        __int16 v23 = 1024;
        int v24 = a3;
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d pickFeaturesStringForPayload: DID NOT FIND payload %d.", (uint8_t *)&v17, 0x22u);
      }
    }
    return 0;
  }
}

- (id)allPayloadsLocalFeaturesString
{
  id result = self->_allPayloadsLocalFeaturesString;
  if (!result)
  {
    id result = +[VCVideoFeatureListStringHelper newLocalFeaturesStringWithType:1];
    self->_allPayloadsLocalFeaturesString = (NSDictionary *)result;
  }
  return result;
}

- (BOOL)setMatchedFeaturesString:(char *)a3 localFeaturesString:(id)a4 remoteFeaturesString:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  __lasts = (char *)0xAAAAAAAAAAAAAAAALL;
  memset(v47, 170, sizeof(v47));
  memset(v46, 170, sizeof(v46));
  memset(__b, 170, sizeof(__b));
  memset(__str, 170, sizeof(__str));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v35 = v9;
      __int16 v36 = 2080;
      uint64_t v37 = "-[VCCallSession(PrivateMethods) setMatchedFeaturesString:localFeaturesString:remoteFeaturesString:]";
      __int16 v38 = 1024;
      int v39 = 9883;
      __int16 v40 = 2080;
      uint64_t v41 = [a4 UTF8String];
      __int16 v42 = 2080;
      uint64_t v43 = [a5 UTF8String];
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d setMatchedFeaturesString: local=[%s] remote=[%s]", buf, 0x30u);
    }
  }
  if (a4) {
    BOOL v11 = a5 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  BOOL v12 = !v11;
  if (v11)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      __int16 v23 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v35 = v22;
        __int16 v36 = 2080;
        uint64_t v37 = "-[VCCallSession(PrivateMethods) setMatchedFeaturesString:localFeaturesString:remoteFeaturesString:]";
        __int16 v38 = 1024;
        int v39 = 9886;
        _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d NO matched featuresString", buf, 0x1Cu);
      }
    }
  }
  else
  {
    [a4 UTF8String];
    __strlcpy_chk();
    [a5 UTF8String];
    __strlcpy_chk();
    uint64_t v13 = strtok_r(__str, ";", &__lasts);
    if (v13 && !strcmp(v13, "FLS"))
    {
      if ([(VCCallInfo *)self->remoteCallInfo requiresImplicitFeatureString])
      {
        __strlcpy_chk();
        LODWORD(v47[0]) = 5395532;
        __strlcpy_chk();
        strcpy((char *)&v47[2], "CABAC");
        unsigned int v14 = 2;
      }
      else
      {
        unsigned int v14 = 0;
      }
      __int16 v25 = strtok_r(0, ";", &__lasts);
      if (v25)
      {
        uint64_t v26 = v25;
        unint64_t v27 = v14;
        int v28 = (char *)&v47[2 * v14];
        __int16 v29 = (char *)&v46[2 * v14];
        do
        {
          strlcpy(v29, v26, 0x20uLL);
          strlcpy(v28, v26, 0x20uLL);
          uint64_t v30 = strchr(v28, 58);
          if (v30) {
            char *v30 = 0;
          }
          uint64_t v31 = strtok_r(0, ";", &__lasts);
          unsigned int v14 = v27 + 1;
          if (!v31) {
            break;
          }
          uint64_t v26 = v31;
          v28 += 32;
          v29 += 32;
        }
        while (v27++ < 0x63);
      }
    }
    else
    {
      unsigned int v14 = 0;
    }
    __int16 v15 = strtok_r(__b, ";", &__lasts);
    if (v15)
    {
      if (!strcmp(v15, "FLS"))
      {
        uint64_t v16 = strtok_r(0, ";", &__lasts);
        if (v16)
        {
          int v17 = v16;
          do
          {
            uint64_t v18 = strchr(v17, 58);
            if (v18) {
              char *v18 = 0;
            }
            if ((int)v14 >= 1)
            {
              __int16 v19 = (const char *)v46;
              uint64_t v20 = (const char *)v47;
              uint64_t v21 = v14;
              while (strcmp(v17, v20))
              {
                v19 += 32;
                v20 += 32;
                if (!--v21) {
                  goto LABEL_26;
                }
              }
              strlcat(a3, v19, 0xC80uLL);
              strlcat(a3, ";", 0xC80uLL);
            }
LABEL_26:
            int v17 = strtok_r(0, ";", &__lasts);
          }
          while (v17);
        }
      }
    }
  }
  return v12;
}

- (const)matchedFeaturesStringForPayload:(int)a3
{
  id v3 = [(VCCallSession *)self getFeatureListStringForPayload:*(void *)&a3];

  return (const char *)[v3 UTF8String];
}

- (void)setupBitrateNegotiation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  callSessionBitrateArbiter = self->callSessionBitrateArbiter;
  if (!callSessionBitrateArbiter)
  {
    callSessionBitrateArbiter = [[VCBitrateArbiter alloc] initWithDeviceRole:self->_deviceRole callLogFile:self->_callLogFile];
    self->callSessionBitrateArbiter = callSessionBitrateArbiter;
  }
  self->int carrierBitrateCap = [(VCBitrateArbiter *)callSessionBitrateArbiter maxAllowedCellularBitrate];
  [(VCCallInfo *)self->localCallInfo setMaxBandwidth:[(VCBitrateArbiter *)self->callSessionBitrateArbiter maxAllowedBitrate]];
  id v12 = 0;
  int v4 = VCCarrierBundle_QueryCarrierBundleValueForKey(@"MaxFaceTimeBitrate", &v12);
  int v5 = [v12 intValue];
  if (v4 && v5 >= 1)
  {
    self->int carrierBitrateCap = v5;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int carrierBitrateCap = self->carrierBitrateCap;
        *(_DWORD *)buf = 136315906;
        uint64_t v14 = v6;
        __int16 v15 = 2080;
        uint64_t v16 = "-[VCCallSession(PrivateMethods) setupBitrateNegotiation]";
        __int16 v17 = 1024;
        int v18 = 9960;
        __int16 v19 = 1024;
        int v20 = carrierBitrateCap;
        uint64_t v9 = "VCCallSession [%s] %s:%d Read key 'MaxFaceTimeBitrate' from carrier bundle: %d";
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v9, buf, 0x22u);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = self->carrierBitrateCap;
      *(_DWORD *)buf = 136315906;
      uint64_t v14 = v10;
      __int16 v15 = 2080;
      uint64_t v16 = "-[VCCallSession(PrivateMethods) setupBitrateNegotiation]";
      __int16 v17 = 1024;
      int v18 = 9962;
      __int16 v19 = 1024;
      int v20 = v11;
      uint64_t v9 = "VCCallSession [%s] %s:%d No key 'MaxFaceTimeBitrate' in carrier bundle: using default (%d)";
      goto LABEL_11;
    }
  }
}

- (void)adjustBitrateForConnectionType
{
  unsigned int v3 = [(VCCallSession *)self maxBitrateForConnectionType];
  if (self->callSessionBitrate > v3) {
    self->unsigned int callSessionBitrate = v3;
  }
}

- (unsigned)maxBitrateForConnectionType
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = [(VCCallSession *)self primaryConnectionType];
  if (v3 - 3 >= 2)
  {
    if (v3 != 2)
    {
      signed int v5 = 0;
      goto LABEL_15;
    }
    signed int v5 = objc_msgSend(+[GKSConnectivitySettings getClientOption:](GKSConnectivitySettings, "getClientOption:", @"gk-p2p-bitrate-max-wifi"), "intValue");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 136315906;
        uint64_t v17 = v9;
        __int16 v18 = 2080;
        __int16 v19 = "-[VCCallSession(PrivateMethods) maxBitrateForConnectionType]";
        __int16 v20 = 1024;
        int v21 = 9992;
        __int16 v22 = 1024;
        signed int v23 = v5;
        uint64_t v8 = "VCCallSession [%s] %s:%d UDP maxBitrateForConnectionType is %d";
        goto LABEL_14;
      }
    }
  }
  else
  {
    signed int v4 = objc_msgSend(+[GKSConnectivitySettings getClientOption:](GKSConnectivitySettings, "getClientOption:", @"gk-p2p-tcp-relay-bitrate-max"), "intValue");
    if (v4)
    {
      signed int v5 = v4;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        uint64_t v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 136315906;
          uint64_t v17 = v6;
          __int16 v18 = 2080;
          __int16 v19 = "-[VCCallSession(PrivateMethods) maxBitrateForConnectionType]";
          __int16 v20 = 1024;
          int v21 = 9984;
          __int16 v22 = 1024;
          signed int v23 = v5;
          uint64_t v8 = "VCCallSession [%s] %s:%d TCP maxBitrateForConnectionType is %d";
LABEL_14:
          _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v16, 0x22u);
        }
      }
    }
    else
    {
      signed int v5 = objc_msgSend(+[GKSConnectivitySettings getClientOption:](GKSConnectivitySettings, "getClientOption:", @"gk-p2p-bitrate-max-wifi"), "intValue");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        uint64_t v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 136315906;
          uint64_t v17 = v10;
          __int16 v18 = 2080;
          __int16 v19 = "-[VCCallSession(PrivateMethods) maxBitrateForConnectionType]";
          __int16 v20 = 1024;
          int v21 = 9987;
          __int16 v22 = 1024;
          signed int v23 = v5;
          uint64_t v8 = "VCCallSession [%s] %s:%d Use general RelayBitRate for TCP: %d";
          goto LABEL_14;
        }
      }
    }
  }
LABEL_15:
  int operatingMode = self->operatingMode;
  id v12 = (const void *)VCConnectionManager_CopyConnectionForQuality((uint64_t)self->connectionManager, 1);
  unsigned int v13 = [(VCBitrateArbiter *)self->callSessionBitrateArbiter maxAllowedBitrateForVCConnection:v12 forLocalInterface:1 arbiterMode:VCBitrateArbiter_ModeFromOperatingMode(self->operatingMode) encodeRule:self->_currentEncodeRule];
  if (v12) {
    CFRelease(v12);
  }
  if (operatingMode == 4) {
    signed int v14 = 0;
  }
  else {
    signed int v14 = v5;
  }
  if (v14 <= 0) {
    return v13;
  }
  else {
    return v14;
  }
}

- (void)logConnectionSuccess
{
  v4[5] = *MEMORY[0x1E4F143B8];
  global_queue = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__VCCallSession_PrivateMethods__logConnectionSuccess__block_invoke;
  v4[3] = &unk_1E6DB3DC8;
  v4[4] = self;
  dispatch_async(global_queue, v4);
}

uint64_t __53__VCCallSession_PrivateMethods__logConnectionSuccess__block_invoke()
{
  os_log_t v0 = (__CFString *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "infoDictionary"), "objectForKey:", @"CFBundleName");
  if (!v0) {
    os_log_t v0 = @"Unknown";
  }
  [(__CFString *)v0 UTF8String];

  return reportingLog();
}

- (void)enableSessionHealthMonitor
{
  v5[5] = *MEMORY[0x1E4F143B8];
  if (!self->sessionHealthMonitor)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    signed int v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, global_queue);
    self->sessionHealthMonitor = v4;
    dispatch_source_set_timer((dispatch_source_t)v4, 0, 0xB2D05E00uLL, 0x1C9C380uLL);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    void v5[2] = __59__VCCallSession_PrivateMethods__enableSessionHealthMonitor__block_invoke;
    v5[3] = &unk_1E6DB3DC8;
    v5[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)self->sessionHealthMonitor, v5);
    dispatch_source_set_cancel_handler((dispatch_source_t)self->sessionHealthMonitor, v5);
    dispatch_resume((dispatch_object_t)self->sessionHealthMonitor);
  }
}

void __59__VCCallSession_PrivateMethods__enableSessionHealthMonitor__block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) audioReceivingBitrateKbps];
  uint64_t v5 = v4;
  [*(id *)(a1 + 32) audioTransmittingBitrateKbps];
  double v7 = v6;
  uint64_t v8 = *(_DWORD **)(a1 + 32);
  int v9 = v8[355];
  if (v9 == 4 || v9 == 1)
  {
    [v8 sessionReceivingBitrate];
    double v12 = v11;
    [*(id *)(a1 + 32) sessionReceivingFramerate];
    uint64_t v14 = v13;
    [*(id *)(a1 + 32) sessionTransmittingBitrate];
    double v16 = v15;
    [*(id *)(a1 + 32) sessionTransmittingFramerate];
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)(a1 + 32);
    LODWORD(v1) = *(_DWORD *)(v19 + 1328);
    LODWORD(v2) = *(_DWORD *)(v19 + 1332);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      int v21 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v22 = [*(id *)(a1 + 32) callID];
        v49.double width = (double)v1;
        v49.double height = (double)v2;
        int v26 = 136317698;
        uint64_t v27 = v20;
        __int16 v28 = 2080;
        __int16 v29 = "-[VCCallSession(PrivateMethods) enableSessionHealthMonitor]_block_invoke";
        __int16 v30 = 1024;
        int v31 = 10049;
        __int16 v32 = 2048;
        double v33 = v16 / 1000.0;
        __int16 v34 = 2048;
        uint64_t v35 = v18;
        __int16 v36 = 2048;
        double v37 = v7;
        __int16 v38 = 2048;
        double v39 = v12 / 1000.0;
        __int16 v40 = 2048;
        uint64_t v41 = v14;
        __int16 v42 = 2048;
        uint64_t v43 = v5;
        __int16 v44 = 1024;
        int v45 = v22;
        __int16 v46 = 2112;
        long long v47 = NSStringFromSize(v49);
        _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d @=@ Health: VCCallSession videoTxBitrate=%5.3f kbps, videoTxFrameRate=%3.1f, audioTxBitrate=%5.3f kbps, videoRxBitrate=%5.3f kbps, videoRxFrameRate=%3.1f, audioRxBitrate=%5.3f kbps, callID=%d videoRxResolution=%@", (uint8_t *)&v26, 0x68u);
      }
    }
  }
  if (*(_DWORD *)(*(void *)(a1 + 32) + 1420) == 2 && (int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v23 = VRTraceErrorLogLevelToCSTR();
    uint64_t v24 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v25 = [*(id *)(a1 + 32) callID];
      int v26 = 136316418;
      uint64_t v27 = v23;
      __int16 v28 = 2080;
      __int16 v29 = "-[VCCallSession(PrivateMethods) enableSessionHealthMonitor]_block_invoke";
      __int16 v30 = 1024;
      int v31 = 10053;
      __int16 v32 = 2048;
      double v33 = v7;
      __int16 v34 = 2048;
      uint64_t v35 = v5;
      __int16 v36 = 1024;
      LODWORD(v37) = v25;
      _os_log_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d @=@ Health: VCCallSession-AudioOnly audioTxBitrate=%5.3f kbps, audioRxBitrate=%5.3f kbps, callID=%d", (uint8_t *)&v26, 0x36u);
    }
  }
}

- (double)audioReceivingBitrateKbps
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = 0;
  memset(v4, 0, sizeof(v4));
  VCAudioReceiver_CollectChannelMetrics((uint64_t)self->audioReceiver, v4);
  LODWORD(v2) = v4[0];
  return (double)v2;
}

- (double)audioTransmittingBitrateKbps
{
  audioTransmitter = self->audioTransmitter;
  if (!audioTransmitter) {
    return 0.0;
  }
  [(VCAudioTransmitter *)audioTransmitter currentChannelMetrics];
  LODWORD(v3) = v5;
  return (double)v3;
}

- (void)disableSessionHealthMonitor
{
  sessionHealthMonitor = self->sessionHealthMonitor;
  if (sessionHealthMonitor)
  {
    dispatch_source_cancel(sessionHealthMonitor);
    uint64_t v4 = self->sessionHealthMonitor;
    if (v4)
    {
      dispatch_release(v4);
      self->sessionHealthMonitor = 0;
    }
  }
}

- (void)sendBasebandCodecMessage
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  int deviceRole = self->_deviceRole;
  if (deviceRole != 4 && deviceRole != 2) {
    return;
  }
  if ([(VCCallSession *)self basebandCodecType]
    && [(VCCallSession *)self basebandCodecSampleRate])
  {
    id v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", -[VCCallSession basebandCodecType](self, "basebandCodecType"), @"VCBasebandCodecType", -[VCCallSession basebandCodecSampleRate](self, "basebandCodecSampleRate"), @"VCBasebandCodecSampleRate", 0);
    id v5 = -[VCSessionMessaging newPackedMessageFromDictionary:](self->messaging, "newPackedMessageFromDictionary:");
    [(VCSessionMessaging *)self->messaging sendMessage:v5 withTopic:@"VCBasebandCodecChange"];

    return;
  }
  if ((VCCallSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return;
    }
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    if ([(VCCallSession *)self basebandCodecType]) {
      int v9 = [[(NSString *)[(VCCallSession *)self basebandCodecType] description] UTF8String];
    }
    else {
      int v9 = "<nil>";
    }
    if ([(VCCallSession *)self basebandCodecSampleRate]) {
      uint64_t v17 = (const char *)objc_msgSend((id)-[NSNumber description](-[VCCallSession basebandCodecSampleRate](self, "basebandCodecSampleRate"), "description"), "UTF8String");
    }
    else {
      uint64_t v17 = "<nil>";
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v20 = v7;
    __int16 v21 = 2080;
    int v22 = "-[VCCallSession(PrivateMethods) sendBasebandCodecMessage]";
    __int16 v23 = 1024;
    int v24 = 10087;
    __int16 v25 = 2080;
    int v26 = (void *)v9;
    __int16 v27 = 2080;
    __int16 v28 = (VCCallSession *)v17;
    uint64_t v14 = "VCCallSession [%s] %s:%d Not sending message. codecType = %s, codecRate = %s";
    double v15 = v8;
    uint32_t v16 = 48;
LABEL_33:
    _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
    return;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v6 = (__CFString *)[(VCCallSession *)self performSelector:sel_logPrefix];
  }
  else {
    uint64_t v6 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    double v11 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if ([(VCCallSession *)self basebandCodecType]) {
        double v12 = [[(NSString *)[(VCCallSession *)self basebandCodecType] description] UTF8String];
      }
      else {
        double v12 = "<nil>";
      }
      if ([(VCCallSession *)self basebandCodecSampleRate]) {
        uint64_t v13 = (const char *)objc_msgSend((id)-[NSNumber description](-[VCCallSession basebandCodecSampleRate](self, "basebandCodecSampleRate"), "description"), "UTF8String");
      }
      else {
        uint64_t v13 = "<nil>";
      }
      *(_DWORD *)buf = 136316674;
      uint64_t v20 = v10;
      __int16 v21 = 2080;
      int v22 = "-[VCCallSession(PrivateMethods) sendBasebandCodecMessage]";
      __int16 v23 = 1024;
      int v24 = 10087;
      __int16 v25 = 2112;
      int v26 = v6;
      __int16 v27 = 2048;
      __int16 v28 = self;
      __int16 v29 = 2080;
      __int16 v30 = v12;
      __int16 v31 = 2080;
      __int16 v32 = v13;
      uint64_t v14 = "VCCallSession [%s] %s:%d %@(%p) Not sending message. codecType = %s, codecRate = %s";
      double v15 = v11;
      uint32_t v16 = 68;
      goto LABEL_33;
    }
  }
}

- (void)shouldSendBlackFrame:(BOOL)a3
{
  self->shouldSendBlackFrame = a3;
}

- (void)sendSymptomToRemote:(id)a3 groupID:(id)a4
{
  void v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"VCSymptomReporterSymptom";
  v6[1] = @"VCSymptomReporterGroupID";
  v7[0] = a3;
  v7[1] = a4;
  id v5 = -[VCSessionMessaging newPackedMessageFromDictionary:](self->messaging, "newPackedMessageFromDictionary:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2]);
  [(VCSessionMessaging *)self->messaging sendMessage:v5 withTopic:@"VCSymptomReporterMessage"];
}

- (void)setDuplicationFlag:(BOOL)a3 withPreferredLocalLinkTypeForDuplication:(int)a4 notifyPeer:(BOOL)a5
{
  void v10[2] = *MEMORY[0x1E4F143B8];
  if (a5)
  {
    BOOL v5 = a3;
    v9[0] = @"VCPreferredInterfaceKey";
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[VCConnectionManager preferredLocalInterfaceForDuplication](self->connectionManager, "preferredLocalInterfaceForDuplication", a3, *(void *)&a4));
    v9[1] = @"VCPreferredInterfaceDuplicatingKey";
    v10[0] = v7;
    v10[1] = [NSNumber numberWithBool:v5];
    id v8 = -[VCSessionMessaging newPackedMessageFromDictionary:](self->messaging, "newPackedMessageFromDictionary:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2]);
    [(VCSessionMessaging *)self->messaging sendMessage:v8 withTopic:@"VCPreferredInterfaceMessageTopic"];
  }
}

- (void)handleDuplicationEnabled:(BOOL)a3 activeConnection:(id)a4
{
  BOOL v5 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (a4)
  {
    if (ErrorLogLevelForModule >= 6)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      int v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (v5) {
          uint64_t v10 = "ON";
        }
        else {
          uint64_t v10 = "OFF";
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v15 = v8;
        __int16 v16 = 2080;
        uint64_t v17 = "-[VCCallSession(PrivateMethods) handleDuplicationEnabled:activeConnection:]";
        __int16 v18 = 1024;
        int v19 = 10151;
        __int16 v20 = 2080;
        __int16 v21 = v10;
        __int16 v22 = 2080;
        uint64_t v23 = objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession: duplication is %s with active connection %s", buf, 0x30u);
      }
    }
    cellTechQueue = self->cellTechQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__VCCallSession_PrivateMethods__handleDuplicationEnabled_activeConnection___block_invoke;
    block[3] = &unk_1E6DB3E18;
    block[4] = a4;
    void block[5] = self;
    BOOL v13 = v5;
    dispatch_async(cellTechQueue, block);
  }
  else if (ErrorLogLevelForModule >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCCallSession(PrivateMethods) handleDuplicationEnabled:activeConnection:]();
    }
  }
}

uint64_t __75__VCCallSession_PrivateMethods__handleDuplicationEnabled_activeConnection___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t IsLocalOnCellular = VCConnection_IsLocalOnCellular(*(void *)(a1 + 32));
  uint64_t IsRemoteOnCellular = VCConnection_IsRemoteOnCellular(*(void *)(a1 + 32));
  uint64_t v4 = VCConnection_LocalCellTech(*(void *)(a1 + 32));
  uint64_t v5 = VCConnection_RemoteCellTech(*(void *)(a1 + 32));
  VideoTransmitter_SetCellTech(*(void *)(*(void *)(a1 + 40) + 1256), IsLocalOnCellular, v4, IsRemoteOnCellular, v5);
  uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v7 = [*(id *)(a1 + 32) isWifiToWifi];
  if (v7) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 1;
  }
  [*(id *)(a1 + 40) resetVideoRulesForInterface:v8 videoReportingDictionary:v6];
  [*(id *)(*(void *)(a1 + 40) + 1232) setUseWiFiTiers:v7];
  uint64_t v9 = VCBitrateArbiter_ModeFromOperatingMode(*(_DWORD *)(*(void *)(a1 + 40) + 1420));
  unsigned int v10 = [*(id *)(*(void *)(a1 + 40) + 1176) maxAllowedBitrateForVCConnection:*(void *)(a1 + 32) forLocalInterface:1 arbiterMode:v9 encodeRule:*(void *)(*(void *)(a1 + 40) + 176)];
  if (!v10)
  {
    int v11 = *(_DWORD *)(*(void *)(a1 + 40) + 1420);
    if (v11 == 7 || v11 == 2) {
      unsigned int v10 = 40;
    }
    else {
      unsigned int v10 = 100;
    }
  }
  int v13 = [*(id *)(a1 + 32) remoteConnectionType];
  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v34 = v6;
  if (v13 == 3) {
    uint64_t v15 = [*(id *)(v14 + 1176) maxAllowedBitrateForVCConnection:*(void *)(a1 + 32) forLocalInterface:0 arbiterMode:v9 encodeRule:*(void *)(v14 + 176)];
  }
  else {
    uint64_t v15 = [*(id *)(v14 + 32) cellBandwidth];
  }
  uint64_t v16 = v15;
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  __int16 v18 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    __int16 v20 = *v18;
    if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v36 = v19;
      __int16 v37 = 2080;
      __int16 v38 = "-[VCCallSession(PrivateMethods) handleDuplicationEnabled:activeConnection:]_block_invoke";
      __int16 v39 = 1024;
      int v40 = 10178;
      __int16 v41 = 1024;
      unsigned int v42 = v16;
      __int16 v43 = 1024;
      int v44 = IsRemoteOnCellular;
      _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession: remoteBitrateCapToUse = %d, remoteUseCellular = %d", buf, 0x28u);
    }
  }
  if (v10 >= v16) {
    uint64_t v21 = v16;
  }
  else {
    uint64_t v21 = v10;
  }
  VideoTransmitter_SetBitrate(*(void *)(*(void *)(a1 + 40) + 1256), 1000 * v21);
  *(_DWORD *)(*(void *)(a1 + 40) + 1148) = v21;
  VCAudioReceiver_UpdateCellTech(*(void *)(*(void *)(a1 + 40) + 1224), v4, v5);
  if ([*(id *)(*(void *)(a1 + 40) + 320) isVideoEnabled]) {
    VideoReceiver_CellTechChanged();
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v22 = VRTraceErrorLogLevelToCSTR();
    uint64_t v23 = v18;
    uint64_t v24 = v22;
    __int16 v25 = *v23;
    if (os_log_type_enabled(*v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v36 = v24;
      __int16 v37 = 2080;
      __int16 v38 = "-[VCCallSession(PrivateMethods) handleDuplicationEnabled:activeConnection:]_block_invoke";
      __int16 v39 = 1024;
      int v40 = 10190;
      __int16 v41 = 1024;
      unsigned int v42 = v10;
      __int16 v43 = 1024;
      int v44 = IsLocalOnCellular;
      __int16 v45 = 1024;
      int v46 = IsRemoteOnCellular;
      _os_log_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession: localBitrateCapToUse = %d, useCellular = %d, %d", buf, 0x2Eu);
    }
  }
  AFRCUpdateCellTech(*(void *)(*(void *)(a1 + 40) + 344), IsLocalOnCellular, v4, IsRemoteOnCellular, v5, [*(id *)(a1 + 40) evaluateEnableRRx:0], 0);
  uint64_t v26 = *(void *)(a1 + 40);
  int v27 = *(_DWORD *)(v26 + 1420);
  if (v27 == 7 || v27 == 2)
  {
    AFRCSetTxCap(*(void *)(*(void *)(a1 + 40) + 344), [(id)v26 currentAudioCap]);
    uint64_t v26 = *(void *)(a1 + 40);
  }
  __int16 v28 = (const void *)VCConnectionManager_CopyPrimaryConnection(*(void *)(v26 + 80));
  if (!VCConnection_IsLocalOnWiFiOrWired((uint64_t)v28))
  {
    int v29 = 0;
    if (!v28) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  int v29 = *(unsigned __int8 *)(a1 + 48) << 9;
  if (v28) {
LABEL_32:
  }
    CFRelease(v28);
LABEL_33:
  HIDWORD(v33) = v29;
  LOBYTE(v33) = 0;
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 352), "configureWithOperatingMode:isLocalCellular:localCellTech:isRemoteCellular:remoteCellTech:bitrateCapKbps:isTrafficBursty:featureFlags:", *(unsigned int *)(*(void *)(a1 + 40) + 1420), IsLocalOnCellular, v4, IsRemoteOnCellular, v5, v21, v33);
  RTPSetBasebandCongestionDetector(*(void *)(*(void *)(a1 + 40) + 48), (const void *)[*(id *)(*(void *)(a1 + 40) + 352) basebandCongestionDetector]);
  uint64_t v30 = *(void *)(a1 + 40);
  if (!*(void *)(v30 + 352))
  {
    if (v4)
    {
      uint64_t IsLTEOrNewer = NetworkUtils_IsLTEOrNewer(v4);
      uint64_t v30 = *(void *)(a1 + 40);
    }
    else
    {
      uint64_t IsLTEOrNewer = 1;
    }
    [*(id *)(v30 + 360) setIsSenderProbingEnabled:IsLTEOrNewer];
    uint64_t v30 = *(void *)(a1 + 40);
  }
  [(id)v30 reportHandoverResultsWithDictionary:v34 localBitrateCap:v21 remoteBitrateCap:v16];
  [*(id *)(a1 + 40) updateCachedConnectionState];
  [*(id *)(a1 + 40) updateMaxPktLength];
  return [*(id *)(a1 + 40) notifyDelegateActiveConnectionDidChange];
}

- (int)mapPacketMultiplexModeToRTPMode:(int64_t)a3
{
  if (a3 == 1) {
    return 1;
  }
  if (a3 == 2) {
    return 2;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    int result = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    -[VCCallSession(PrivateMethods) mapPacketMultiplexModeToRTPMode:]();
  }
  return 0;
}

- (int)mapPacketMultiplexModeToSIPMode:(int64_t)a3
{
  if (a3 == 1) {
    return 1;
  }
  if (a3 == 2) {
    return 2;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    int result = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    -[VCCallSession(PrivateMethods) mapPacketMultiplexModeToSIPMode:]();
  }
  return 0;
}

- (BOOL)disconnectInternal:(BOOL)a3 disconnectError:(id)a4 didRemoteCancel:(BOOL)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  [(VCConnectionManager *)self->connectionManager remoteNoRemotePacketInterval];
  uint64_t v10 = v9;
  double v11 = fmax(micro() - self->lastReceivedPacketTimestamp, 0.0);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __84__VCCallSession_PrivateMethods__disconnectInternal_disconnectError_didRemoteCancel___block_invoke;
  v17[3] = &unk_1E6DB7570;
  BOOL v18 = a3;
  BOOL v19 = a5;
  v17[4] = self;
  v17[5] = a4;
  *(double *)&void v17[6] = v11;
  v17[7] = v10;
  [(VCCallSession *)self lock];
  LODWORD(a4) = self->_cleanupDone;
  self->_cleanupDone = 1;
  [(VCCallSession *)self unlock];
  if (!a4)
  {
    secureControlChannel = self->secureControlChannel;
    self->secureControlChannel = 0;
    if (![(VCCallSession *)self isSIPEnabled] && !a5)
    {
      if ([(VCCallSession *)self isSIPEnabled]) {
        goto LABEL_11;
      }
      if (self->hSIP != (tagHANDLE *)0xFFFFFFFFLL) {
        goto LABEL_11;
      }
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      void v16[2] = __84__VCCallSession_PrivateMethods__disconnectInternal_disconnectError_didRemoteCancel___block_invoke_3;
      v16[3] = &unk_1E6DB7598;
      v16[4] = secureControlChannel;
      if ([(VCControlChannelMultiWay *)secureControlChannel sendReliableMessage:@"VCDisconnectMessage" withTopic:@"VCDisconnectMessage" participantID:0 timeout:5 completion:v16])
      {
        goto LABEL_11;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCallSession(PrivateMethods) disconnectInternal:disconnectError:didRemoteCancel:]();
        }
      }
    }
    +[VCCallSession stopSecureControlChannel:secureControlChannel];
LABEL_11:
    [(VCCallSession *)self stopAudioWithCompletionHandler:v17];

    self->controlChannel = 0;
  }
  if (!self->sentClientSuccessfulDidStart && self->isStarted)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      uint64_t v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v21 = v13;
        __int16 v22 = 2080;
        uint64_t v23 = "-[VCCallSession(PrivateMethods) disconnectInternal:disconnectError:didRemoteCancel:]";
        __int16 v24 = 1024;
        int v25 = 10387;
        _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Ending the Call even though we haven't finished notifying the client that we have started", buf, 0x1Cu);
      }
    }
    VCUtil_GenerateDiagnostics(0, 1, "Ending the Call even though we haven't finished notifying the client that we have started", 1u);
  }
  return 1;
}

void __84__VCCallSession_PrivateMethods__disconnectInternal_disconnectError_didRemoteCancel___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = v5;
        *(_WORD *)&unsigned char buf[12] = 2080;
        *(void *)&buf[14] = "-[VCCallSession(PrivateMethods) disconnectInternal:disconnectError:didRemoteCancel:]_block_invoke";
        __int16 v29 = 1024;
        int v30 = 10262;
        __int16 v31 = 2080;
        *(void *)__int16 v32 = objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Stop audio failed with error: %s", buf, 0x26u);
      }
    }
  }
  [*(id *)(a1 + 32) lock];
  id v7 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  [*(id *)(a1 + 32) reportDashboardEndResult:*(unsigned __int8 *)(a1 + 64)];
  if ((int)VRTraceGetErrorLogLevelForModule() > 5)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = [*(id *)(a1 + 32) callID];
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = *(void *)(v11 + 128);
      int v14 = *(unsigned __int8 *)(a1 + 65);
      LODWORD(v11) = *(unsigned __int8 *)(v11 + 226);
      *(_DWORD *)buf = 136317186;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&unsigned char buf[12] = 2080;
      *(void *)&buf[14] = "-[VCCallSession(PrivateMethods) disconnectInternal:disconnectError:didRemoteCancel:]_block_invoke";
      __int16 v29 = 1024;
      int v30 = 10271;
      __int16 v31 = 1024;
      *(_DWORD *)__int16 v32 = v10;
      *(_WORD *)&v32[4] = 1024;
      *(_DWORD *)&void v32[6] = v13;
      __int16 v33 = 1024;
      BOOL v34 = v13 == 6;
      __int16 v35 = 1024;
      int v36 = v14;
      __int16 v37 = 1024;
      int v38 = v11;
      __int16 v39 = 2112;
      uint64_t v40 = v12;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d disconnect: calluint64_t ID = %d state = %d, stateIsCallee = %d, didRemoteCancel = %d, didSend200OK = %d, error = %@", buf, 0x44u);
    }
  }
  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v16 = *(NSObject **)(v15 + 480);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__VCCallSession_PrivateMethods__disconnectInternal_disconnectError_didRemoteCancel___block_invoke_1648;
  block[3] = &unk_1E6DB3DC8;
  block[4] = v15;
  dispatch_async(v16, block);
  [*(id *)(a1 + 32) stopMediaQueue:0];
  [*(id *)(a1 + 32) stopRateControl:0];
  [*(id *)(a1 + 32) stopPausedHeartbeat];
  objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1512), "connectionManager"), "stop");
  [*(id *)(a1 + 32) cleanupMedia];
  [*(id *)(a1 + 32) cleanupWCMClient];
  uint64_t v17 = *(uint64_t **)(a1 + 32);
  if (v17[187])
  {
    WRMUninitialize(v17[187]);
    uint64_t v17 = *(uint64_t **)(a1 + 32);
  }
  [v17 cleanupWRMClient];
  uint64_t v18 = *(void *)(a1 + 32);
  uint64_t v19 = *(void *)(v18 + 128);
  *(void *)(v18 + 128) = 7;
  __int16 v20 = *(void **)(a1 + 32);
  uint64_t v21 = (void *)v20[140];
  if (v21)
  {
    v20[140] = 0;
    __int16 v20 = *(void **)(a1 + 32);
  }
  [v20 cancelConnectionTimeoutTimer];
  uint64_t v22 = *(void *)(a1 + 32);
  uint64_t v23 = *(const void **)(v22 + 1432);
  if (v23)
  {
    CFRelease(v23);
    *(void *)(*(void *)(a1 + 32) + 1432) = 0;
    uint64_t v22 = *(void *)(a1 + 32);
  }
  if (*(void *)(v22 + 1424))
  {
    SKEState_Release();
    uint64_t v22 = *(void *)(a1 + 32);
  }
  [*(id *)(v22 + 1440) setDelegate:0];
  if ([*(id *)(a1 + 32) deviceRole] == 2)
  {
    [*(id *)(*(void *)(a1 + 32) + 1464) unregisterForNotifications];
    [*(id *)(*(void *)(a1 + 32) + 1464) setDelegate:0];
  }
  [*(id *)(a1 + 32) unlock];
  [*(id *)(a1 + 32) notifyDelegateAndEndCall:v19 didRemoteCancel:*(unsigned __int8 *)(a1 + 65) error:*(void *)(a1 + 40)];
  memset(buf, 170, 16);
  objc_msgSend(+[VideoConferenceManager defaultVideoConferenceManager](VideoConferenceManager, "defaultVideoConferenceManager"), "getClientUUID:", buf);
  [*(id *)(a1 + 40) code];
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "userInfo"), "objectForKey:", @"NSErrorUserInfoDetailedError"), "intValue");
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "domain"), "UTF8String");
  reportingCallEndError();
  uint64_t v24 = *(void *)(a1 + 32);
  int v25 = *(NSObject **)(v24 + 1152);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __84__VCCallSession_PrivateMethods__disconnectInternal_disconnectError_didRemoteCancel___block_invoke_2;
  v26[3] = &unk_1E6DB3DC8;
  void v26[4] = v24;
  dispatch_async(v25, v26);
  reportingStopTimer();
  reportingUnregisterPeriodicTask();
  reportingUnregisterPeriodicTask();
  [v21 stopMessaging];
}

uint64_t __84__VCCallSession_PrivateMethods__disconnectInternal_disconnectError_didRemoteCancel___block_invoke_1648(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 320) isVideoEnabled];
  if (result)
  {
    [*(id *)(a1 + 32) stopVideo:0 error:0];
    return reportingGenericEvent();
  }
  return result;
}

void __84__VCCallSession_PrivateMethods__disconnectInternal_disconnectError_didRemoteCancel___block_invoke_2(uint64_t a1)
{
  unint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 1160);
  if (v2)
  {
    dispatch_source_cancel(v2);
    unint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 1160);
    if (v3)
    {
      dispatch_release(v3);
      *(void *)(*(void *)(a1 + 32) + 1160) = 0;
    }
  }
}

uint64_t __84__VCCallSession_PrivateMethods__disconnectInternal_disconnectError_didRemoteCancel___block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = @"UNSUCCESSFULLY";
      *(_DWORD *)uint64_t v8 = 136315906;
      *(void *)&v8[4] = v4;
      *(_WORD *)&v8[12] = 2080;
      *(void *)&v8[14] = "-[VCCallSession(PrivateMethods) disconnectInternal:disconnectError:didRemoteCancel:]_block_invoke_3";
      if (a2) {
        uint64_t v6 = @"SUCCESSFULLY";
      }
      *(_WORD *)&v8[22] = 1024;
      int v9 = 10369;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Disconnect message was sent %@", v8, 0x26u);
    }
  }
  return +[VCCallSession stopSecureControlChannel:](VCCallSession, "stopSecureControlChannel:", *(void *)(a1 + 32), *(_OWORD *)v8, *(void *)&v8[16]);
}

+ (void)stopSecureControlChannel:(id)a3
{
  [a3 flushActiveMessages];
  [a3 removeActiveParticipant:0];
  [a3 stop];
}

- (void)setupMessaging
{
  [(VCCallSession *)self lock];
  if (!self->messaging)
  {
    self->messaging = [[VCSessionMessaging alloc] initWithControlChannel:[(VCCallSession *)self activeControlChannel] remoteVersion:0];
    [(VCCallSession *)self setupVideoPauseMessages];
    [(VCCallSession *)self setupAudioPauseMessages];
    [(VCCallSession *)self setupCellTechChangeMessages];
    [(VCCallSession *)self setupMomentsMessages];
    [(VCCallSession *)self setupAudioPausedHBMessages];
    [(VCCallSession *)self setupCallingModeMessages];
    [(VCCallSession *)self setupHandoverCandidateChangeMessage];
    [(VCCallSession *)self setupPiPStateChangeMessage];
    [(VCCallSession *)self setupPreferredInterfaceMessage];
    [(VCCallSession *)self setupSymptomEnabledMessage];
    [(VCCallSession *)self setupWRMAlertStateUpdateMessage];
    [(VCCallSession *)self setupWRMCoexMetricsMessage];
    if ([(VCCallSession *)self deviceRole] == 1
      || [(VCCallSession *)self deviceRole] == 2
      || [(VCCallSession *)self deviceRole] == 4)
    {
      [(VCCallSession *)self setupBasebandCodecInfoMessages];
    }
    if (![(VCCallSession *)self isSIPEnabled]) {
      [(VCCallSession *)self setupDisconnectMessage];
    }
  }

  [(VCCallSession *)self unlock];
}

- (void)setupAudioPauseMessages
{
  v3[5] = *MEMORY[0x1E4F143B8];
  messaging = self->messaging;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  void v3[2] = __50__VCCallSession_Messages__setupAudioPauseMessages__block_invoke;
  v3[3] = &unk_1E6DB75C0;
  v3[4] = self;
  [(VCSessionMessaging *)messaging addTopic:@"AudioPauseStateMessageTopic" associatedStrings:&unk_1F3DC7770 allowConcurrent:0 receiveHandler:v3];
}

uint64_t __50__VCCallSession_Messages__setupAudioPauseMessages__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [*(id *)(*(void *)(a1 + 32) + 24) callID];
      int v8 = 136316162;
      uint64_t v9 = v4;
      __int16 v10 = 2080;
      uint64_t v11 = "-[VCCallSession(Messages) setupAudioPauseMessages]_block_invoke";
      __int16 v12 = 1024;
      int v13 = 10443;
      __int16 v14 = 1024;
      int v15 = v6;
      __int16 v16 = 2080;
      uint64_t v17 = [a2 UTF8String];
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession callID[%u] receives message :%s", (uint8_t *)&v8, 0x2Cu);
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "remotePauseDidChangeToState:forVideo:", objc_msgSend(a2, "isEqualToString:", @"VCAudioPaused"), 0);
}

- (void)setupVideoPauseMessages
{
  v3[5] = *MEMORY[0x1E4F143B8];
  messaging = self->messaging;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  void v3[2] = __50__VCCallSession_Messages__setupVideoPauseMessages__block_invoke;
  v3[3] = &unk_1E6DB75C0;
  v3[4] = self;
  [(VCSessionMessaging *)messaging addTopic:@"VideoPauseStateMessageTopic" associatedStrings:&unk_1F3DC7788 allowConcurrent:0 receiveHandler:v3];
}

uint64_t __50__VCCallSession_Messages__setupVideoPauseMessages__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [*(id *)(*(void *)(a1 + 32) + 24) callID];
      int v8 = 136316162;
      uint64_t v9 = v4;
      __int16 v10 = 2080;
      uint64_t v11 = "-[VCCallSession(Messages) setupVideoPauseMessages]_block_invoke";
      __int16 v12 = 1024;
      int v13 = 10455;
      __int16 v14 = 1024;
      int v15 = v6;
      __int16 v16 = 2080;
      uint64_t v17 = [a2 UTF8String];
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession callID[%u] receives message :%s", (uint8_t *)&v8, 0x2Cu);
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "remotePauseDidChangeToState:forVideo:", objc_msgSend(a2, "isEqualToString:", @"VCVideoPaused"), 1);
}

- (void)setupAudioPausedHBMessages
{
  v3[5] = *MEMORY[0x1E4F143B8];
  messaging = self->messaging;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  void v3[2] = __53__VCCallSession_Messages__setupAudioPausedHBMessages__block_invoke;
  v3[3] = &unk_1E6DB75C0;
  v3[4] = self;
  [(VCSessionMessaging *)messaging addTopic:@"VCPingTopic" associatedStrings:&unk_1F3DC77A0 allowConcurrent:0 receiveHandler:v3];
}

uint64_t __53__VCCallSession_Messages__setupAudioPausedHBMessages__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [*(id *)(*(void *)(a1 + 32) + 24) callID];
      int v8 = 136316162;
      uint64_t v9 = v4;
      __int16 v10 = 2080;
      uint64_t v11 = "-[VCCallSession(Messages) setupAudioPausedHBMessages]_block_invoke";
      __int16 v12 = 1024;
      int v13 = 10466;
      __int16 v14 = 1024;
      int v15 = v6;
      __int16 v16 = 2080;
      uint64_t v17 = [a2 UTF8String];
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession callID[%u] receives message :%s", (uint8_t *)&v8, 0x2Cu);
    }
  }
  return [*(id *)(a1 + 32) updateLastReceivedPacket:1 packetType:7];
}

- (void)setupAudioOnOffStateMessages
{
  v3[5] = *MEMORY[0x1E4F143B8];
  messaging = self->messaging;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  void v3[2] = __55__VCCallSession_Messages__setupAudioOnOffStateMessages__block_invoke;
  v3[3] = &unk_1E6DB75C0;
  v3[4] = self;
  [(VCSessionMessaging *)messaging addTopic:@"AudioOnOffStateMessageTopic" associatedStrings:&unk_1F3DC77B8 allowConcurrent:0 receiveHandler:v3];
}

uint64_t __55__VCCallSession_Messages__setupAudioOnOffStateMessages__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [*(id *)(*(void *)(a1 + 32) + 24) callID];
      int v16 = 136316162;
      uint64_t v17 = v4;
      __int16 v18 = 2080;
      uint64_t v19 = "-[VCCallSession(Messages) setupAudioOnOffStateMessages]_block_invoke";
      __int16 v20 = 1024;
      int v21 = 10476;
      __int16 v22 = 1024;
      int v23 = v6;
      __int16 v24 = 2080;
      uint64_t v25 = [a2 UTF8String];
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession callID[%u] receives message :%s", (uint8_t *)&v16, 0x2Cu);
    }
  }
  if ([a2 isEqualToString:@"VCAudioEnabled"])
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = *(void **)(v7 + 8);
    uint64_t v9 = [*(id *)(v7 + 24) callID];
    __int16 v10 = v8;
    uint64_t v11 = v7;
    uint64_t v12 = 1;
  }
  else
  {
    uint64_t result = [a2 isEqualToString:@"VCAudioDisbaled"];
    if (!result) {
      return result;
    }
    uint64_t v14 = *(void *)(a1 + 32);
    int v15 = *(void **)(v14 + 8);
    uint64_t v9 = [*(id *)(v14 + 24) callID];
    __int16 v10 = v15;
    uint64_t v11 = v14;
    uint64_t v12 = 0;
  }
  return [v10 session:v11 remoteAudioEnabled:v12 withCallID:v9];
}

- (void)setupCallingModeMessages
{
  v3[5] = *MEMORY[0x1E4F143B8];
  messaging = self->messaging;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  void v3[2] = __51__VCCallSession_Messages__setupCallingModeMessages__block_invoke;
  v3[3] = &unk_1E6DB75C0;
  v3[4] = self;
  [(VCSessionMessaging *)messaging addTopic:@"CallingModeTopic" associatedStrings:&unk_1F3DC77D0 allowConcurrent:0 receiveHandler:v3];
}

uint64_t __51__VCCallSession_Messages__setupCallingModeMessages__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [*(id *)(*(void *)(a1 + 32) + 24) callID];
      int v18 = 136316162;
      uint64_t v19 = v4;
      __int16 v20 = 2080;
      int v21 = "-[VCCallSession(Messages) setupCallingModeMessages]_block_invoke";
      __int16 v22 = 1024;
      int v23 = 10494;
      __int16 v24 = 1024;
      int v25 = v6;
      __int16 v26 = 2080;
      uint64_t v27 = [a2 UTF8String];
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession callID[%u] receives message :%s", (uint8_t *)&v18, 0x2Cu);
    }
  }
  if ([a2 isEqualToString:@"VCDataMode"])
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = *(void **)(v7 + 8);
    uint64_t v9 = [*(id *)(v7 + 24) callID];
    __int16 v10 = v8;
    uint64_t v11 = v7;
    uint64_t v12 = 1;
  }
  else if ([a2 isEqualToString:@"VCAudioMode"])
  {
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void **)(v13 + 8);
    uint64_t v9 = [*(id *)(v13 + 24) callID];
    __int16 v10 = v14;
    uint64_t v11 = v13;
    uint64_t v12 = 2;
  }
  else
  {
    uint64_t result = [a2 isEqualToString:@"VCVideoMode"];
    if (!result) {
      return result;
    }
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = *(void **)(v16 + 8);
    uint64_t v9 = [*(id *)(v16 + 24) callID];
    __int16 v10 = v17;
    uint64_t v11 = v16;
    uint64_t v12 = 3;
  }
  return [v10 session:v11 remoteCallingModeChanged:v12 withCallID:v9];
}

- (void)setupBasebandCodecInfoMessages
{
  v3[5] = *MEMORY[0x1E4F143B8];
  messaging = self->messaging;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  void v3[2] = __57__VCCallSession_Messages__setupBasebandCodecInfoMessages__block_invoke;
  v3[3] = &unk_1E6DB75C0;
  v3[4] = self;
  [(VCSessionMessaging *)messaging addTopic:@"VCBasebandCodecChange" associatedStrings:0 allowConcurrent:0 receiveHandler:v3];
}

void __57__VCCallSession_Messages__setupBasebandCodecInfoMessages__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    unint64_t v3 = (void *)[*(id *)(*(void *)(a1 + 32) + 1120) newDictionaryFromUnpackedMessage:a2];
    uint64_t v4 = v3;
    if (v3)
    {
      uint64_t v5 = (void *)[v3 objectForKeyedSubscript:@"VCBasebandCodecSampleRate"];
      int v6 = (void *)[v4 objectForKeyedSubscript:@"VCBasebandCodecType"];
      uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v5, "intValue"));
      if (v7 && v6 != 0)
      {
        uint64_t v9 = (void *)v7;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v10 = VRTraceErrorLogLevelToCSTR();
          uint64_t v11 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v12 = [*(id *)(*(void *)(a1 + 32) + 24) callID];
            int v16 = 136316418;
            uint64_t v17 = v10;
            __int16 v18 = 2080;
            uint64_t v19 = "-[VCCallSession(Messages) setupBasebandCodecInfoMessages]_block_invoke";
            __int16 v20 = 1024;
            int v21 = 10524;
            __int16 v22 = 1024;
            int v23 = v12;
            __int16 v24 = 2080;
            uint64_t v25 = [v6 UTF8String];
            __int16 v26 = 1024;
            int v27 = [v9 unsignedIntValue];
            _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession callID[%u] received message about BasebandCodecChange type :%s, sampleRate %u", (uint8_t *)&v16, 0x32u);
          }
        }
        [*(id *)(a1 + 32) lock];
        [*(id *)(a1 + 32) setBasebandCodecSampleRate:v9];
        [*(id *)(a1 + 32) setBasebandCodecType:v6];
        if ([*(id *)(a1 + 32) isAudioRunning])
        {
          uint64_t v13 = (void *)[*(id *)(a1 + 32) delegate];
          uint64_t v14 = *(void *)(a1 + 32);
          uint64_t v15 = CStrToFourcc((char *)[v6 UTF8String]);
          [v9 doubleValue];
          objc_msgSend(v13, "session:setRemoteBasebandCodecType:sampleRate:", v14, v15);
        }
        [*(id *)(a1 + 32) unlock];
      }
    }
  }
}

- (void)setupDisconnectMessage
{
  v3[5] = *MEMORY[0x1E4F143B8];
  messaging = self->messaging;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  void v3[2] = __49__VCCallSession_Messages__setupDisconnectMessage__block_invoke;
  v3[3] = &unk_1E6DB75C0;
  v3[4] = self;
  [(VCSessionMessaging *)messaging addTopic:@"VCDisconnectMessage" associatedStrings:0 allowConcurrent:0 receiveHandler:v3];
}

uint64_t __49__VCCallSession_Messages__setupDisconnectMessage__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = [*(id *)(*(void *)(a1 + 32) + 24) callID];
      *(_DWORD *)buf = 136316162;
      *(void *)&uint8_t buf[4] = v6;
      __int16 v11 = 2080;
      int v12 = "-[VCCallSession(Messages) setupDisconnectMessage]_block_invoke";
      __int16 v13 = 1024;
      int v14 = 10546;
      __int16 v15 = 1024;
      int v16 = v8;
      __int16 v17 = 2112;
      uint64_t v18 = a4;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession callID[%u] received 'disconnect' message from remote participant '%@'", buf, 0x2Cu);
    }
  }
  *(void *)buf = 0;
  +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", buf, 32003, 235, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 10551), @"Remote participant hangup.", @"Remote participant hangup.");
  return [*(id *)(a1 + 32) disconnect:*(void *)buf didRemoteCancel:1];
}

- (void)setupHandoverCandidateChangeMessage
{
  v3[5] = *MEMORY[0x1E4F143B8];
  messaging = self->messaging;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  void v3[2] = __62__VCCallSession_Messages__setupHandoverCandidateChangeMessage__block_invoke;
  v3[3] = &unk_1E6DB75C0;
  v3[4] = self;
  [(VCSessionMessaging *)messaging addTopic:@"VCHandoverCandidateChange" associatedStrings:0 allowConcurrent:1 receiveHandler:v3];
}

void __62__VCCallSession_Messages__setupHandoverCandidateChangeMessage__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    unint64_t v3 = (void *)[*(id *)(*(void *)(a1 + 32) + 1120) newDictionaryFromUnpackedMessage:a2];
    uint64_t v4 = v3;
    if (v3)
    {
      uint64_t v5 = [v3 objectForKeyedSubscript:@"VCHandoverNewCandidateBlob"];
      uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v5 options:1];
      if (v6)
      {
        uint64_t v7 = (void *)v6;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v8 = VRTraceErrorLogLevelToCSTR();
          uint64_t v9 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v10 = [*(id *)(*(void *)(a1 + 32) + 24) callID];
            int v11 = 136316162;
            uint64_t v12 = v8;
            __int16 v13 = 2080;
            int v14 = "-[VCCallSession(Messages) setupHandoverCandidateChangeMessage]_block_invoke";
            __int16 v15 = 1024;
            int v16 = 10570;
            __int16 v17 = 1024;
            int v18 = v10;
            __int16 v19 = 2080;
            uint64_t v20 = objc_msgSend((id)objc_msgSend(v7, "description"), "UTF8String");
            _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d HandoverReport: VCCallSession callID[%d] received message about remote candidate change:%s", (uint8_t *)&v11, 0x2Cu);
          }
        }
        objc_msgSend(*(id *)(a1 + 32), "processRemoteIPChange:callID:", v7, objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "callID"));
      }
    }
  }
}

- (void)setupPiPStateChangeMessage
{
  v3[5] = *MEMORY[0x1E4F143B8];
  messaging = self->messaging;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  void v3[2] = __53__VCCallSession_Messages__setupPiPStateChangeMessage__block_invoke;
  v3[3] = &unk_1E6DB75C0;
  v3[4] = self;
  [(VCSessionMessaging *)messaging addTopic:@"VCWindowStateChange" associatedStrings:0 allowConcurrent:1 receiveHandler:v3];
}

void __53__VCCallSession_Messages__setupPiPStateChangeMessage__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v4 = (void *)[*(id *)(*(void *)(a1 + 32) + 1120) newDictionaryFromUnpackedMessage:a2];
    uint64_t v5 = v4;
    if (v4)
    {
      uint64_t v6 = (void *)[v4 objectForKeyedSubscript:@"VCWindowState"];
      uint64_t v7 = (void *)[v5 objectForKeyedSubscript:@"VCWindowWidth"];
      uint64_t v8 = (void *)[v5 objectForKeyedSubscript:@"VCWindowHeight"];
      int v9 = [v6 intValue];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        int v11 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v12 = [*(id *)(*(void *)(a1 + 32) + 24) callID];
          int v24 = 136316162;
          uint64_t v25 = v10;
          __int16 v26 = 2080;
          int v27 = "-[VCCallSession(Messages) setupPiPStateChangeMessage]_block_invoke";
          __int16 v28 = 1024;
          int v29 = 10594;
          __int16 v30 = 1024;
          int v31 = v12;
          __int16 v32 = 2112;
          uint64_t v33 = a2;
          _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession callID[%d] received message about PIP State change:%@", (uint8_t *)&v24, 0x2Cu);
        }
      }
      if (v6 && (v9 & 0x80000000) == 0 && v9 <= 2)
      {
        reportingLog();
        VideoTransmitter_SetWindowState(*(void *)(*(void *)(a1 + 32) + 1256), 0, v9);
      }
      if (v7) {
        BOOL v13 = v8 == 0;
      }
      else {
        BOOL v13 = 1;
      }
      if (!v13)
      {
        int v14 = (void *)[v5 objectForKeyedSubscript:@"VCWindowOriginX"];
        __int16 v15 = (void *)[v5 objectForKeyedSubscript:@"VCWindowOriginY"];
        [v14 doubleValue];
        double v17 = v16;
        [v15 doubleValue];
        double v19 = v18;
        [v7 doubleValue];
        double v21 = v20;
        [v8 doubleValue];
        double v23 = v22;
        reportingVisualRectangle();
        VideoTransmitter_SetVisualRectangle(v17, v19, v21, v23, *(void *)(*(void *)(a1 + 32) + 1256), 0);
      }
    }
  }
}

- (void)setupCellTechChangeMessages
{
  v3[5] = *MEMORY[0x1E4F143B8];
  messaging = self->messaging;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  void v3[2] = __54__VCCallSession_Messages__setupCellTechChangeMessages__block_invoke;
  v3[3] = &unk_1E6DB75C0;
  v3[4] = self;
  [(VCSessionMessaging *)messaging addTopic:@"VCCellTechChangeTopic" associatedStrings:0 allowConcurrent:0 receiveHandler:v3];
}

void __54__VCCallSession_Messages__setupCellTechChangeMessages__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    unint64_t v3 = (void *)[*(id *)(*(void *)(a1 + 32) + 1120) newDictionaryFromUnpackedMessage:a2];
    uint64_t v4 = v3;
    if (v3)
    {
      uint64_t v5 = [v3 objectForKeyedSubscript:@"VCCellTechKey"];
      uint64_t v6 = [v4 objectForKeyedSubscript:@"VCMaxBitrateKey"];
      if (v5 | v6)
      {
        uint64_t v7 = (void *)v6;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v8 = VRTraceErrorLogLevelToCSTR();
          int v9 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v10 = 136316162;
            uint64_t v11 = v8;
            __int16 v12 = 2080;
            BOOL v13 = "-[VCCallSession(Messages) setupCellTechChangeMessages]_block_invoke";
            __int16 v14 = 1024;
            int v15 = 10632;
            __int16 v16 = 1024;
            int v17 = [(id)v5 intValue];
            __int16 v18 = 1024;
            int v19 = [v7 unsignedIntValue];
            _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession received message about CellTech change :%d, remote bitrate %u", (uint8_t *)&v10, 0x28u);
          }
        }
        objc_msgSend(*(id *)(a1 + 32), "remoteCellTechStateUpdate:maxRemoteBitrate:", objc_msgSend((id)v5, "intValue"), objc_msgSend(v7, "unsignedIntValue"));
      }
    }
  }
}

- (void)setupMomentsMessages
{
  v3[5] = *MEMORY[0x1E4F143B8];
  messaging = self->messaging;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  void v3[2] = __47__VCCallSession_Messages__setupMomentsMessages__block_invoke;
  v3[3] = &unk_1E6DB75C0;
  v3[4] = self;
  [(VCSessionMessaging *)messaging addTopic:@"VCMomentsStateMessageTopic" associatedStrings:0 allowConcurrent:0 receiveHandler:v3];
}

void __47__VCCallSession_Messages__setupMomentsMessages__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = (void *)[*(id *)(*(void *)(a1 + 32) + 1120) newDictionaryFromUnpackedMomentsMessage:a2];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (v3) {
        uint64_t v6 = (const char *)objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String");
      }
      else {
        uint64_t v6 = "<nil>";
      }
      int v7 = 136315906;
      uint64_t v8 = v4;
      __int16 v9 = 2080;
      int v10 = "-[VCCallSession(Messages) setupMomentsMessages]_block_invoke";
      __int16 v11 = 1024;
      int v12 = 10651;
      __int16 v13 = 2080;
      __int16 v14 = v6;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d moment message %s", (uint8_t *)&v7, 0x26u);
    }
  }
  if (v3)
  {
    [*(id *)(*(void *)(a1 + 32) + 8) session:*(void *)(a1 + 32) didReceiveMomentsRequest:v3];
    [*(id *)(a1 + 32) reportingMomentsWithRequest:v3];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __47__VCCallSession_Messages__setupMomentsMessages__block_invoke_cold_1();
    }
  }
}

- (void)setupPreferredInterfaceMessage
{
  v3[5] = *MEMORY[0x1E4F143B8];
  messaging = self->messaging;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  void v3[2] = __57__VCCallSession_Messages__setupPreferredInterfaceMessage__block_invoke;
  v3[3] = &unk_1E6DB75C0;
  v3[4] = self;
  [(VCSessionMessaging *)messaging addTopic:@"VCPreferredInterfaceMessageTopic" associatedStrings:0 allowConcurrent:0 receiveHandler:v3];
}

void __57__VCCallSession_Messages__setupPreferredInterfaceMessage__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = (void *)[*(id *)(*(void *)(a1 + 32) + 1120) newDictionaryFromUnpackedMessage:a2];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (v3) {
        uint64_t v6 = (const char *)objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String");
      }
      else {
        uint64_t v6 = "<nil>";
      }
      int v9 = 136315906;
      uint64_t v10 = v4;
      __int16 v11 = 2080;
      int v12 = "-[VCCallSession(Messages) setupPreferredInterfaceMessage]_block_invoke";
      __int16 v13 = 1024;
      int v14 = 10668;
      __int16 v15 = 2080;
      __int16 v16 = v6;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Preferred interface message %s", (uint8_t *)&v9, 0x26u);
    }
  }
  if (v3)
  {
    unsigned __int8 v7 = objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", @"VCPreferredInterfaceKey"), "unsignedIntValue");
    uint64_t v8 = objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", @"VCPreferredInterfaceDuplicatingKey"), "BOOLValue");
    [*(id *)(*(void *)(a1 + 32) + 80) setPreferredRemoteInterfaceForDuplication:v7];
    [*(id *)(*(void *)(a1 + 32) + 80) processRemoteWRMSuggestion:v7 == 0 isRemoteDuplicating:v8];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __57__VCCallSession_Messages__setupPreferredInterfaceMessage__block_invoke_cold_1();
    }
  }
}

- (void)processSymptomFromMessage:(id)a3 participantID:(id)a4 isLocalInitiated:(BOOL)a5 isLocalSideOnly:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F47A30], "weakObjectHolderWithObject:", self, a4), "strong");
  id v11 = [(VCSessionMessaging *)self->messaging newDictionaryFromUnpackedMessage:a3];
  int v12 = v11;
  if (v11)
  {
    [v11 objectForKeyedSubscript:@"VCSymptomReporterSymptom"];
    int v13 = processGroupSymptoms();
    int v14 = (const void *)[v12 objectForKeyedSubscript:@"VCSymptomReporterGroupID"];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      __int16 v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 136316930;
        uint64_t v20 = v15;
        __int16 v21 = 2080;
        double v22 = "-[VCCallSession(Messages) processSymptomFromMessage:participantID:isLocalInitiated:isLocalSideOnly:]";
        __int16 v23 = 1024;
        int v24 = 10688;
        __int16 v25 = 1024;
        BOOL v26 = v7;
        __int16 v27 = 1024;
        BOOL v28 = v6;
        __int16 v29 = 2080;
        uint64_t v30 = [a3 UTF8String];
        __int16 v31 = 1024;
        int v32 = v13;
        __int16 v33 = 2112;
        uint64_t v34 = v14;
        _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d SymptomReporter: isLocalInitiated:%d isLocalSideOnly:%d message:%s, symptomuint64_t ID = %d, groupuint64_t ID = %@", (uint8_t *)&v19, 0x42u);
      }
    }
    if (v14)
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      CFDictionarySetValue(Mutable, @"SymptomReporterOptionalKeyGroupID", v14);
      __int16 v18 = (const void **)MEMORY[0x1E4F1CFD0];
      if (!v6) {
        __int16 v18 = (const void **)MEMORY[0x1E4F1CFC8];
      }
      CFDictionarySetValue(Mutable, @"SymptomReporterOptionalIsLocalSideOnly", *v18);
      [v10 reportingAgent];
      reportingSymptom();
      CFRelease(Mutable);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCallSession(Messages) processSymptomFromMessage:participantID:isLocalInitiated:isLocalSideOnly:]();
      }
    }
  }
}

- (void)setupSymptomEnabledMessage
{
  v6[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  messaging = self->messaging;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __53__VCCallSession_Messages__setupSymptomEnabledMessage__block_invoke;
  v6[3] = &unk_1E6DB75E8;
  v6[4] = v3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __53__VCCallSession_Messages__setupSymptomEnabledMessage__block_invoke_1879;
  v5[3] = &unk_1E6DB75C0;
  v5[4] = v3;
  [(VCSessionMessaging *)messaging addTopic:@"VCSymptomReporterMessage" associatedStrings:0 allowConcurrent:0 sendCompletionHandler:v6 receiveHandler:v5];
}

uint64_t __53__VCCallSession_Messages__setupSymptomEnabledMessage__block_invoke(uint64_t a1, void *a2, int a3, uint64_t a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v7 = (void *)[*(id *)(a1 + 32) strong];
  uint64_t v8 = v7;
  if (a3)
  {
    return [v7 processSymptomFromMessage:a2 participantID:a4 isLocalInitiated:1 isLocalSideOnly:0];
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      id v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136316162;
        uint64_t v13 = v10;
        __int16 v14 = 2080;
        uint64_t v15 = "-[VCCallSession(Messages) setupSymptomEnabledMessage]_block_invoke";
        __int16 v16 = 1024;
        int v17 = 10713;
        __int16 v18 = 2080;
        uint64_t v19 = [a2 UTF8String];
        __int16 v20 = 2112;
        uint64_t v21 = a4;
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d SymptomReporter: Failed to send symptom message %s to participantID %@, requesting only the local side", (uint8_t *)&v12, 0x30u);
      }
    }
    return [v8 processSymptomFromMessage:a2 participantID:a4 isLocalInitiated:1 isLocalSideOnly:1];
  }
}

uint64_t __53__VCCallSession_Messages__setupSymptomEnabledMessage__block_invoke_1879(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL v6 = (void *)[*(id *)(a1 + 32) strong];

  return [v6 processSymptomFromMessage:a2 participantID:a4 isLocalInitiated:0 isLocalSideOnly:0];
}

- (void)setupWRMAlertStateUpdateMessage
{
  v3[5] = *MEMORY[0x1E4F143B8];
  messaging = self->messaging;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  void v3[2] = __58__VCCallSession_Messages__setupWRMAlertStateUpdateMessage__block_invoke;
  v3[3] = &unk_1E6DB75C0;
  v3[4] = self;
  [(VCSessionMessaging *)messaging addTopic:@"VCWRMAlertStateUpdateMessageTopic" associatedStrings:&unk_1F3DC77E8 allowConcurrent:0 receiveHandler:v3];
}

void __58__VCCallSession_Messages__setupWRMAlertStateUpdateMessage__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315906;
      uint64_t v9 = v4;
      __int16 v10 = 2080;
      id v11 = "-[VCCallSession(Messages) setupWRMAlertStateUpdateMessage]_block_invoke";
      __int16 v12 = 1024;
      int v13 = 10728;
      __int16 v14 = 2080;
      uint64_t v15 = [a2 UTF8String];
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d WRM Alert state update message: %s", (uint8_t *)&v8, 0x26u);
    }
  }
  if (a2)
  {
    if ([a2 isEqualToString:@"VCWRMAlertStateEnabled"])
    {
      BOOL v6 = *(void **)(*(void *)(a1 + 32) + 80);
      uint64_t v7 = 1;
LABEL_12:
      [v6 setRemotePreWarmStateEnabled:v7];
      return;
    }
    if ([a2 isEqualToString:@"VCWRMAlertStateDisabled"])
    {
      BOOL v6 = *(void **)(*(void *)(a1 + 32) + 80);
      uint64_t v7 = 0;
      goto LABEL_12;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __58__VCCallSession_Messages__setupWRMAlertStateUpdateMessage__block_invoke_cold_2();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __58__VCCallSession_Messages__setupWRMAlertStateUpdateMessage__block_invoke_cold_1();
    }
  }
}

- (void)setupWRMCoexMetricsMessage
{
  v3[5] = *MEMORY[0x1E4F143B8];
  messaging = self->messaging;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  void v3[2] = __53__VCCallSession_Messages__setupWRMCoexMetricsMessage__block_invoke;
  v3[3] = &unk_1E6DB75C0;
  v3[4] = self;
  [(VCSessionMessaging *)messaging addTopic:@"VCWRMCoexMetricsMessage" associatedStrings:0 allowConcurrent:0 receiveHandler:v3];
}

void __53__VCCallSession_Messages__setupWRMCoexMetricsMessage__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = (void *)[*(id *)(*(void *)(a1 + 32) + 1120) newDictionaryFromUnpackedMessage:a2];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315906;
        uint64_t v7 = v4;
        __int16 v8 = 2080;
        uint64_t v9 = "-[VCCallSession(Messages) setupWRMCoexMetricsMessage]_block_invoke";
        __int16 v10 = 1024;
        int v11 = 10750;
        __int16 v12 = 2080;
        uint64_t v13 = objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String");
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d WRM: Get remote iRAT Coex Metrics %s", (uint8_t *)&v6, 0x26u);
      }
    }
    [*(id *)(*(void *)(a1 + 32) + 80) processWRMCoexMetrics:v3];
  }
}

- (void)controlChannel:(id)a3 receivedData:(id)a4 transactionID:(unsigned int)a5 fromParticipant:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    __int16 v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v11 = [(VCCallInfo *)self->localCallInfo callID];
      *(_DWORD *)buf = 136316418;
      uint64_t v15 = v9;
      __int16 v16 = 2080;
      int v17 = "-[VCCallSession(Messages) controlChannel:receivedData:transactionID:fromParticipant:]";
      __int16 v18 = 1024;
      int v19 = 10761;
      __int16 v20 = 1024;
      unsigned int v21 = v11;
      __int16 v22 = 2112;
      id v23 = a4;
      __int16 v24 = 2112;
      id v25 = a6;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession callID[%u] received data='%@' from remote participant '%@'", buf, 0x36u);
    }
  }
  delegateNotificationQueue = self->delegateNotificationQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __85__VCCallSession_Messages__controlChannel_receivedData_transactionID_fromParticipant___block_invoke;
  v13[3] = &unk_1E6DB3E40;
  v13[4] = self;
  v13[5] = a4;
  dispatch_async(delegateNotificationQueue, v13);
}

uint64_t __85__VCCallSession_Messages__controlChannel_receivedData_transactionID_fromParticipant___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(v1 + 8);
  uint64_t v4 = [*(id *)(v1 + 24) callID];

  return [v3 session:v1 didReceiveData:v2 messageType:1 withCallID:v4];
}

- (void)transportSession:(id)a3 connectionSetupDataDidChange:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(VCCallSessionDelegate *)self->delegate session:self localIPChange:a4 withCallID:[(VCCallInfo *)self->localCallInfo callID]];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (a4) {
        __int16 v8 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
      }
      else {
        __int16 v8 = "<nil>";
      }
      *(_DWORD *)buf = 136315906;
      uint64_t v13 = v6;
      __int16 v14 = 2080;
      uint64_t v15 = "-[VCCallSession(VCTransportSessionLegacyDelegate) transportSession:connectionSetupDataDidChange:]";
      __int16 v16 = 1024;
      int v17 = 10779;
      __int16 v18 = 2080;
      int v19 = v8;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d HandoverReport: sending SIP message to inform ipChange %s", buf, 0x26u);
    }
  }
  uint64_t v9 = objc_msgSend([NSString alloc], "initWithData:encoding:", objc_msgSend(a4, "base64EncodedDataWithOptions:", 1), 4);
  __int16 v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", v9, @"VCHandoverNewCandidateBlob", 0);

  id v11 = [(VCSessionMessaging *)self->messaging newPackedMessageFromDictionary:v10];
  [(VCSessionMessaging *)self->messaging sendMessage:v11 withTopic:@"VCHandoverCandidateChange"];
}

- (void)transportSession:(id)a3 cancelRelayRequest:(id)a4
{
  void block[6] = *MEMORY[0x1E4F143B8];
  delegateNotificationQueue = self->delegateNotificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__VCCallSession_VCTransportSessionLegacyDelegate__transportSession_cancelRelayRequest___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a4;
  dispatch_async(delegateNotificationQueue, block);
}

uint64_t __87__VCCallSession_VCTransportSessionLegacyDelegate__transportSession_cancelRelayRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) session:*(void *)(a1 + 32) cancelRelayRequest:*(void *)(a1 + 40)];
}

- (void)transportSession:(id)a3 initiateRelayRequest:(id)a4
{
  void block[6] = *MEMORY[0x1E4F143B8];
  if ([(VCCallSession *)self isCallOngoing])
  {
    delegateNotificationQueue = self->delegateNotificationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __89__VCCallSession_VCTransportSessionLegacyDelegate__transportSession_initiateRelayRequest___block_invoke;
    block[3] = &unk_1E6DB3E40;
    block[4] = self;
    void block[5] = a4;
    dispatch_async(delegateNotificationQueue, block);
  }
}

uint64_t __89__VCCallSession_VCTransportSessionLegacyDelegate__transportSession_initiateRelayRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) session:*(void *)(a1 + 32) initiateRelayRequest:*(void *)(a1 + 40)];
}

- (void)transportSession:(id)a3 sendRelayResponse:(id)a4
{
  void block[6] = *MEMORY[0x1E4F143B8];
  delegateNotificationQueue = self->delegateNotificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__VCCallSession_VCTransportSessionLegacyDelegate__transportSession_sendRelayResponse___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a4;
  dispatch_async(delegateNotificationQueue, block);
}

uint64_t __86__VCCallSession_VCTransportSessionLegacyDelegate__transportSession_sendRelayResponse___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) session:*(void *)(a1 + 32) sendRelayResponse:*(void *)(a1 + 40)];
}

- (void)rateController:(id)a3 targetBitrateDidChange:(unsigned int)a4 rateChangeCounter:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  hAFRC = self->hAFRC;
  if (hAFRC != (tagHANDLE *)0xFFFFFFFFLL) {
    AFRCUpdateRateTier((uint64_t)hAFRC, a4);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    __int16 v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v11 = [(VCCallInfo *)self->localCallInfo callID];
      int v12 = 136316418;
      uint64_t v13 = v9;
      __int16 v14 = 2080;
      uint64_t v15 = "-[VCCallSession(AVCRateControllerDelegate) rateController:targetBitrateDidChange:rateChangeCounter:]";
      __int16 v16 = 1024;
      int v17 = 10820;
      __int16 v18 = 1024;
      int v19 = v6;
      __int16 v20 = 1024;
      int v21 = v5;
      __int16 v22 = 1024;
      unsigned int v23 = v11;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCRC targetBitrateDidChange:%d, rateChangeCounter:%d callID %d", (uint8_t *)&v12, 0x2Eu);
    }
  }
  if (self->useVCRC)
  {
    [(VCAudioTransmitter *)self->audioTransmitter setTargetBitrate:v6];
    [(VCAudioTransmitter *)self->audioTransmitter setRateChangeCounter:v5];
    self->_targetBitrate = v6;
    self->_rateChangeCounter = v5;
  }
}

- (int)learntBitrateForSegment:(id)a3 defaultValue:(int)a4
{
  return reportingGetLearntBitrateForSegment();
}

- (void)mediaController:(void *)a3 mediaSuggestionDidChange:(VCRateControlMediaSuggestion)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = "flush audio";
      *(_DWORD *)int v17 = 136317442;
      *(void *)&v17[4] = v6;
      if ((*(void *)&a4 & 0x100000000) == 0) {
        __int16 v8 = "";
      }
      *(_WORD *)&v17[12] = 2080;
      *(void *)&v17[14] = "-[VCCallSession(VCRateControlMediaControllerDelegate) mediaController:mediaSuggestionDidChange:]";
      uint64_t v9 = "flush video";
      if ((*(_DWORD *)&a4.var0 & 0x1000000) == 0) {
        uint64_t v9 = "";
      }
      *(_WORD *)&v17[22] = 1024;
      LODWORD(v18) = 10846;
      __int16 v10 = "refresh video";
      if ((*(void *)&a4 & 0x10000) == 0) {
        __int16 v10 = "";
      }
      WORD2(v18) = 2080;
      *(void *)((char *)&v18 + 6) = v8;
      unsigned int v11 = "stop video";
      if (!a4.var0) {
        unsigned int v11 = "";
      }
      HIWORD(v18) = 2080;
      int v19 = v9;
      int v12 = "start video";
      if ((*(_WORD *)&a4.var0 & 0x100) == 0) {
        int v12 = "";
      }
      *(_WORD *)__int16 v20 = 2080;
      *(void *)&_OWORD v20[2] = v10;
      uint64_t v13 = "stall audio";
      if ((*(void *)&a4 & 0x10000000000) == 0) {
        uint64_t v13 = "";
      }
      *(_WORD *)&v20[10] = 2080;
      *(void *)&v20[12] = v11;
      __int16 v14 = "unstall audio";
      *(_WORD *)&v20[20] = 2080;
      *(void *)&v20[22] = v12;
      *(_WORD *)&v20[30] = 2080;
      if ((*(void *)&a4 & 0x1000000000000) == 0) {
        __int16 v14 = "";
      }
      int v21 = v13;
      __int16 v22 = 2080;
      unsigned int v23 = v14;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCRC mediaSuggestion:[%s,%s,%s,%s,%s,%s,%s]", v17, 0x62u);
    }
  }
  if (!self->didReportAudioStall && (*(void *)&a4 & 0x10000000000) != 0)
  {
    reportingSymptom();
    self->didReportAudioStall = 1;
  }
  if (self->useVCRC)
  {
    if ([(VCAudioTransmitter *)self->audioTransmitter isAudioStalled]) {
      unint64_t v16 = (*(void *)&a4 & 0x1000000000000) == 0;
    }
    else {
      unint64_t v16 = (*(unint64_t *)&a4 >> 40) & 1;
    }
    -[VCAudioTransmitter setIsAudioStalled:](self->audioTransmitter, "setIsAudioStalled:", v16, *(_OWORD *)v17, *(void *)&v17[16], v18, v19, *(_OWORD *)v20, *(_OWORD *)&v20[16]);
    VideoTransmitter_SetMediaSuggestion((uint64_t)self->hVideoTransmitter, *(void *)&a4);
  }
}

- (void)packMeters:(char *)a3 withLength:(char *)a4
{
}

- (void)processBlackFrame:(opaqueCMSampleBuffer *)a3
{
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (ImageBuffer)
  {
    if (self->shouldSendBlackFrame)
    {
      uint64_t v5 = ImageBuffer;
      CVPixelBufferLockBaseAddress(ImageBuffer, 0);
      if (CVPixelBufferIsPlanar(v5))
      {
        size_t PlaneCount = CVPixelBufferGetPlaneCount(v5);
        OSType PixelFormatType = CVPixelBufferGetPixelFormatType(v5);
        if (PlaneCount == 2 && (PixelFormatType | 0x10) == 0x34323076)
        {
          BOOL v8 = PixelFormatType == 875704438;
          BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(v5, 0);
          __int16 v10 = CVPixelBufferGetBaseAddressOfPlane(v5, 1uLL);
          size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(v5, 0);
          size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(v5, 0);
          memset(BaseAddressOfPlane, 16 * v8, HeightOfPlane * BytesPerRowOfPlane);
          size_t v13 = CVPixelBufferGetBytesPerRowOfPlane(v5, 1uLL);
          size_t v14 = CVPixelBufferGetHeightOfPlane(v5, 1uLL);
          memset(v10, 128, v14 * v13);
        }
      }
      CVPixelBufferUnlockBaseAddress(v5, 0);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCCallSession(VideoConferencing) processBlackFrame:]();
    }
  }
}

- (BOOL)onCaptureFrame:(opaqueCMSampleBuffer *)a3 audioTS:(unsigned int)a4 audioHT:(double)a5 videoHT:(id *)a6 cameraBits:(unsigned __int8)a7
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (self->hVideoTransmitter == (tagHANDLE *)0xFFFFFFFFLL) {
    return 0;
  }
  unsigned int v7 = a7;
  uint64_t v10 = *(void *)&a4;
  if (self->useVCRC) {
    VideoTransmitter_SetTargetBitrate((uint64_t)self->hVideoTransmitter, self->_targetBitrate- [(VCAudioTransmitter *)self->audioTransmitter actualAudioSendingBitrate], self->_rateChangeCounter, [(VCRateControlMediaController *)self->_mediaController isInThrottlingMode]);
  }
  if (![(AVCRateController *)self->_rateController statisticsCollector])
  {
    uint64_t v35 = 0;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    if ((AFRCGetAudioTxInfo((uint64_t)self->hAFRC, 0, 0, 0, 0, 0, 0, 0, 0, (uint64_t)&v23) & 0x80000000) == 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        size_t v14 = *MEMORY[0x1E4F47A50];
        uint64_t v15 = *MEMORY[0x1E4F47A50];
        if (*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            float v16 = *((double *)&v24 + 1);
            *(_DWORD *)buf = 136316162;
            *(void *)&uint8_t buf[4] = v13;
            *(_WORD *)&unsigned char buf[12] = 2080;
            *(void *)&buf[14] = "-[VCCallSession(VideoConferencing) onCaptureFrame:audioTS:audioHT:videoHT:cameraBits:]";
            *(_WORD *)&unsigned char buf[22] = 1024;
            *(_DWORD *)&unsigned char buf[24] = 110;
            *(_WORD *)&buf[28] = 2048;
            *(double *)&buf[30] = v16;
            *(_WORD *)&buf[38] = 1024;
            *(_DWORD *)&buf[40] = v26;
            _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d AFRC Statistics packetLossPercentage=%3.3f burstPacketLoss=%d", buf, 0x2Cu);
          }
        }
        else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          -[VCCallSession(VideoConferencing) onCaptureFrame:audioTS:audioHT:videoHT:cameraBits:](v13, (uint64_t)&v23, v14);
        }
      }
      long long v44 = v33;
      long long v45 = v34;
      uint64_t v46 = v35;
      long long v40 = v29;
      long long v41 = v30;
      long long v42 = v31;
      long long v43 = v32;
      *(_OWORD *)&uint8_t buf[32] = v25;
      long long v37 = v26;
      long long v38 = v27;
      long long v39 = v28;
      *(_OWORD *)buf = v23;
      *(_OWORD *)&buf[16] = v24;
      [(VCCallSession *)self updateStatistics:buf];
    }
  }
  [(VCCallSession *)self processBlackFrame:a3];
  hVideoTransmitter = self->hVideoTransmitter;
  long long v23 = *(_OWORD *)&a6->var0;
  *(void *)&long long v24 = a6->var3;
  int v19 = VideoTransmitter_EnqueueBuffer((uint64_t)hVideoTransmitter, a3, v10, &v23, 0, v7, a5);
  if (v19 < 0)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__VCCallSession_VideoConferencing__onCaptureFrame_audioTS_audioHT_videoHT_cameraBits___block_invoke;
    block[3] = &unk_1E6DB3F08;
    int v22 = v19;
    block[4] = self;
    dispatch_async(global_queue, block);
  }
  [(VCCallSession *)self updateVideoQualityNotification:a5];
  return v19 >= 0;
}

uint64_t __86__VCCallSession_VideoConferencing__onCaptureFrame_audioTS_audioHT_videoHT_cameraBits___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(int *)(a1 + 40);
  v5[0] = 0;
  uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSessionCategories.m", 126);
  +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", v5, 32017, 223, v2, v3, [NSString stringWithFormat:@"Error in VideoTransmitter encode"], @"VideoTransmitter returned error");
  return [*(id *)(a1 + 32) disconnect:v5[0] didRemoteCancel:0];
}

- (void)onPlayVideo:(__CVBuffer *)a3 frameTime:(id *)a4 cameraStatusBits:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  self->_lastDecodedFrameTime = micro();
  *(void *)&long long v9 = -1;
  *((void *)&v9 + 1) = -1;
  long long v29 = v9;
  long long v30 = v9;
  long long v27 = 0;
  uint64_t v28 = 0;
  CVPixelBufferRetain(a3);
  self->unsigned int remoteFrameWidth = CVPixelBufferGetWidth(a3);
  self->unsigned int remoteFrameHeight = CVPixelBufferGetHeight(a3);
  VideoUtil_GetVisibleRect(a3, (double *)&v29);
  if (*(void *)&self->remoteFrameWidth == 0x1E000000280
    && self->expectedDecodeSize.width == 1280.0
    && self->expectedDecodeSize.height == 720.0)
  {
    uint64_t ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if ((int)ErrorLogLevelForModule >= 6)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint64_t v13 = *MEMORY[0x1E4F47A50];
      uint64_t ErrorLogLevelForModule = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      if (ErrorLogLevelForModule)
      {
        unsigned int remoteFrameWidth = self->remoteFrameWidth;
        unsigned int remoteFrameHeight = self->remoteFrameHeight;
        *(_DWORD *)buf = 136317186;
        *(void *)&uint8_t buf[4] = v12;
        *(_WORD *)&unsigned char buf[12] = 2080;
        *(void *)&buf[14] = "-[VCCallSession(VideoConferencing) onPlayVideo:frameTime:cameraStatusBits:]";
        *(_WORD *)&unsigned char buf[22] = 1024;
        int v34 = 160;
        __int16 v35 = 1024;
        unsigned int v36 = remoteFrameWidth;
        __int16 v37 = 1024;
        unsigned int v38 = remoteFrameHeight;
        __int16 v39 = 2048;
        uint64_t v40 = v29;
        __int16 v41 = 2048;
        uint64_t v42 = *((void *)&v29 + 1);
        __int16 v43 = 2048;
        uint64_t v44 = v30;
        __int16 v45 = 2048;
        uint64_t v46 = *((void *)&v30 + 1);
        _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d receiving frame size %dx%d visible rect %g,%g,%g,%g", buf, 0x50u);
      }
    }
    p_hdTransferSession = &self->hdTransferSession;
    int v17 = (CFAllocatorRef *)MEMORY[0x1E4F1CF80];
    if (!self->hdTransferSession)
    {
      VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &self->hdTransferSession);
      VTSessionSetProperty(*p_hdTransferSession, (CFStringRef)*MEMORY[0x1E4F45168], (CFTypeRef)*MEMORY[0x1E4F45468]);
      uint64_t ErrorLogLevelForModule = VTSessionSetProperty(*p_hdTransferSession, (CFStringRef)*MEMORY[0x1E4F45120], (CFTypeRef)*MEMORY[0x1E4F1CFC8]);
    }
    hdBufferPool = self->hdBufferPool;
    if (hdBufferPool)
    {
      CFAllocatorRef v19 = *v17;
    }
    else
    {
      long long v23 = (void *)MEMORY[0x1E4E589F0](ErrorLogLevelForModule);
      uint64_t v31 = *MEMORY[0x1E4F2F128];
      long long v32 = @"AVConference:DecodeResize";
      uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      id v25 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      CFDictionaryRef v26 = (const __CFDictionary *)objc_msgSend(v25, "initWithObjectsAndKeys:", &unk_1F3DC6990, *MEMORY[0x1E4F24E10], &unk_1F3DC69A8, *MEMORY[0x1E4F24D08], &unk_1F3DC69C0, *MEMORY[0x1E4F24D70], &unk_1F3DC69D8, *MEMORY[0x1E4F2EFD8], v24, *MEMORY[0x1E4F24D20], 0);
      CFAllocatorRef v19 = *v17;
      CVPixelBufferPoolCreate(*v17, 0, v26, &self->hdBufferPool);

      hdBufferPool = self->hdBufferPool;
    }
    *(void *)buf = 0;
    CVPixelBufferPoolCreatePixelBuffer(v19, hdBufferPool, (CVPixelBufferRef *)buf);
    if (*(void *)buf)
    {
      VTPixelTransferSessionTransferImage(*p_hdTransferSession, a3, *(CVPixelBufferRef *)buf);
      CVPixelBufferRelease(a3);
      a3 = *(__CVBuffer **)buf;
    }
  }
  else
  {
    hdTransferSession = self->hdTransferSession;
    if (hdTransferSession)
    {
      VTPixelTransferSessionInvalidate(hdTransferSession);
      int v21 = self->hdTransferSession;
      if (v21)
      {
        CFRelease(v21);
        self->hdTransferSession = 0;
      }
    }
    int v22 = self->hdBufferPool;
    if (v22)
    {
      CVPixelBufferPoolRelease(v22);
      self->hdBufferPool = 0;
    }
  }
  VCCallSession_SetUpRemoteAttributes(a3, v5, self->remoteSupportsExpectedAspectRatio, !self->receivedFirstRemoteFrame, self->remoteExpectedPortraitAspectRatio.width, self->remoteExpectedPortraitAspectRatio.height, self->remoteExpectedLandscapeAspectRatio.width, self->remoteExpectedLandscapeAspectRatio.height, self->remoteScreenPortraitAspectRatio.width, self->remoteScreenPortraitAspectRatio.height, self->remoteScreenLandscapeAspectRatio.width, self->remoteScreenLandscapeAspectRatio.height, 0, v10, &v28, &v27);
  *(_OWORD *)buf = *(_OWORD *)&a4->var0;
  *(void *)&buf[16] = a4->var3;
  [(VCCallSession *)self nofityDelegateReceivedRemoteFrame:a3 frameTime:buf cameraStatusBits:v5 newRemoteVideoAttributes:v28 remoteScreenAttributes:v27];
}

- (void)nofityDelegateReceivedRemoteFrame:(__CVBuffer *)a3 frameTime:(id *)a4 cameraStatusBits:(unsigned __int8)a5 newRemoteVideoAttributes:(id)a6 remoteScreenAttributes:(id)a7
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ((a5 & 0x80) == 0) {
    return;
  }
  id v8 = a6;
  if (!VCVideoAttributes_IsEqual((uint64_t)self->remoteVideoAttributes, (uint64_t)a6))
  {
    uint64_t v12 = (void *)MEMORY[0x1E4E589F0]();
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_12;
    }
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    size_t v14 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    remoteVideoAttributes = self->remoteVideoAttributes;
    if (remoteVideoAttributes)
    {
      float v16 = (const char *)objc_msgSend(-[VideoAttributes description](remoteVideoAttributes, "description"), "UTF8String");
      if (v8)
      {
LABEL_8:
        int v17 = (const char *)objc_msgSend((id)objc_msgSend(v8, "description"), "UTF8String");
LABEL_11:
        *(_DWORD *)buf = 136316162;
        *(void *)&uint8_t buf[4] = v13;
        *(_WORD *)&unsigned char buf[12] = 2080;
        *(void *)&buf[14] = "-[VCCallSession(VideoConferencing) nofityDelegateReceivedRemoteFrame:frameTime:cameraStatu"
                              "sBits:newRemoteVideoAttributes:remoteScreenAttributes:]";
        *(_WORD *)&unsigned char buf[22] = 1024;
        int v23 = 406;
        __int16 v24 = 2080;
        id v25 = v16;
        __int16 v26 = 2080;
        long long v27 = v17;
        _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession: remote video attributes changing from %s to %s", buf, 0x30u);
LABEL_12:
        [(VCCallSession *)self setRemoteVideoAttributes:v8];
        goto LABEL_13;
      }
    }
    else
    {
      float v16 = "<nil>";
      if (v8) {
        goto LABEL_8;
      }
    }
    int v17 = "<nil>";
    goto LABEL_11;
  }

  id v8 = 0;
LABEL_13:
  if (self->hVideoReceiver != (tagHANDLE *)0xFFFFFFFFLL)
  {
    delegate = self->delegate;
    BOOL v19 = !self->receivedFirstRemoteFrame;
    BOOL v20 = [(VCCallSession *)self videoIsPaused];
    *(_OWORD *)buf = *(_OWORD *)&a4->var0;
    *(void *)&buf[16] = a4->var3;
    LOBYTE(v21) = v20;
    [(VCCallSessionDelegate *)delegate session:self receivedRemoteFrame:a3 atTime:buf withScreenAttributes:a7 videoAttributes:v8 isFirstFrame:v19 isVideoPaused:v21];
  }
  CVPixelBufferRelease(a3);

  if (!self->receivedFirstRemoteFrame)
  {
    self->receivedFirstRemoteFrame = 1;
    [(VCCallSession *)self rcvdFirstRemoteFrame];
  }
}

- (unsigned)parameterSetForPayload:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(VCMediaNegotiator *)self->_mediaNegotiator usePreNegotiation])
  {
    mediaNegotiator = self->_mediaNegotiator;
    if (self->operatingMode == 4) {
      uint64_t v6 = [(VCMediaNegotiatorBase *)mediaNegotiator negotiatedScreenSettings];
    }
    else {
      uint64_t v6 = [(VCMediaNegotiatorBase *)mediaNegotiator negotiatedVideoSettings];
    }
    id v8 = [(VCMediaNegotiatorResultsVideo *)v6 parameterSets];
    id v9 = -[NSDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v3]);
    return [v9 unsignedIntValue];
  }
  else
  {
    return VCVideoParamaterSets_DefaultSupportedSets(v3);
  }
}

- (CGSize)computeVisibleAspectRatioWithRemoteScreenAspectRatio:(CGSize)a3 remoteExpectedAspectRatio:(CGSize)a4 encodeWidth:(int)a5 encodeHeight:(int)a6
{
  double v6 = ComputeVisibleAspectRatioWithRemoteScreenAspectRatio(a5, a6, a3.width, a3.height, a4.width, a4.height);
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (void)cleanUpVideoRTP
{
  if (self->rtpVideo != (tagHANDLE *)0xFFFFFFFFLL)
  {
    RTPCloseHandle();
    self->rtpVideo = (tagHANDLE *)0xFFFFFFFFLL;
  }
}

- (void)cleanUpVideoReceiver
{
  if (self->hVideoReceiver != (tagHANDLE *)0xFFFFFFFFLL)
  {
    VideoReceiver_CloseHandle();
    self->hVideoReceiver = (tagHANDLE *)0xFFFFFFFFLL;
  }
}

- (void)cleanUpVideoTransmitter
{
  hVideoTransmitter = self->hVideoTransmitter;
  if (hVideoTransmitter != (tagHANDLE *)0xFFFFFFFFLL)
  {
    VideoTransmitter_CloseHandle((uint64_t)hVideoTransmitter);
    self->hVideoTransmitter = (tagHANDLE *)0xFFFFFFFFLL;
  }
}

- (void)cleanUpDisplayLink
{
  self->_displayLink = 0;
}

- (BOOL)initializeVideoTransmitter:(id *)a3 videoRules:(VCCSVideoTransmitterVideoRules_t *)a4 unpausing:(BOOL)a5 reportingAgent:(opaqueRTCReporting *)a6 fecHeaderV1Enabled:(BOOL)a7 isFECGeneratorEnabled:(BOOL)a8
{
  BOOL v55 = a5;
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  p_hVideoTransmitter = (uint64_t *)&self->hVideoTransmitter;
  if (self->hVideoTransmitter == (tagHANDLE *)0xFFFFFFFFLL)
  {
    BOOL v48 = [(VCConnectionManager *)self->connectionManager isConnectedOnIPv6ForActiveConnectionWithQuality:1];
    int IsInterfaceOnCellularForActiveConnectionWithQuality = VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality((uint64_t)self->connectionManager, 1, 1);
    int v52 = [(VCConnectionManager *)self->connectionManager getCellularTechForActiveConnectionWithQuality:1 forLocalInterface:1];
    int v54 = VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality((uint64_t)self->connectionManager, 1, 0);
    int v51 = [(VCConnectionManager *)self->connectionManager getCellularTechForActiveConnectionWithQuality:1 forLocalInterface:0];
    int v47 = [+[VCDefaults sharedInstance] enableTxSourceYuvDump];
    BOOL v45 = [+[VCDefaults sharedInstance] enableTxBitstreamDump];
    BOOL v44 = [+[VCDefaults sharedInstance] enableTxTimestampAlignmentLogs];
    int operatingMode = self->operatingMode;
    unsigned int v43 = [(VCCallSession *)self parameterSetForPayload:[(VCCapabilities *)self->caps actualVideoCodec]];
    BOOL bBWEstNewBWEstModeEnabled = self->bBWEstNewBWEstModeEnabled;
    v57[0] = self->bBWEstOperatingModeInitialized;
    v57[1] = bBWEstNewBWEstModeEnabled;
    BOOL bBWEstActiveProbingSenderLog = self->bBWEstActiveProbingSenderLog;
    _OWORD v57[2] = self->bBWEstFakeLargeFrameModeEnabled;
    v57[3] = bBWEstActiveProbingSenderLog;
    uint64_t v15 = (const void *)objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "copyCameraColorInfo");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      int v17 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v41 = [a4->var0 iWidth];
        int v18 = [a4->var0 iHeight];
        [a4->var0 fRate];
        unsigned int callSessionBitrate = self->callSessionBitrate;
        *(_DWORD *)buf = 136316674;
        *(void *)uint64_t v59 = v16;
        *(_WORD *)&v59[8] = 2080;
        *(void *)&v59[10] = "-[VCCallSession(VideoConferencing) initializeVideoTransmitter:videoRules:unpausing:reporti"
                              "ngAgent:fecHeaderV1Enabled:isFECGeneratorEnabled:]";
        *(_WORD *)&v59[18] = 1024;
        LODWORD(v60) = 558;
        WORD2(v60) = 1024;
        *(_DWORD *)((char *)&v60 + 6) = v41;
        WORD5(v60) = 1024;
        HIDWORD(v60) = v18;
        __int16 v61 = 1024;
        int v62 = (int)v20;
        __int16 v63 = 1024;
        unsigned int v64 = callSessionBitrate;
        _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession: Encode video settings %dx%d@%dfps, bitrate %d Kbps", buf, 0x34u);
      }
    }
    bzero(buf, 0x270uLL);
    long long v60 = 0uLL;
    *(_OWORD *)&v59[4] = (unint64_t)self->rtpVideo;
    rtpint Handle = self->rtpHandle;
    *(_DWORD *)buf = 1;
    videoMediaControlInfoGenerator = self->videoMediaControlInfoGenerator;
    long long v65 = rtpHandle;
    uint64_t v66 = videoMediaControlInfoGenerator;
    mediaController = self->_mediaController;
    uint64_t v67 = a6;
    int v68 = mediaController;
    long long v69 = [(AVCRateController *)self->_rateController statisticsCollector];
    unsigned int v103 = [(VCCallSession *)self callID];
    int v81 = [a4->var0 iWidth];
    int v82 = [a4->var0 iHeight];
    [a4->var0 fRate];
    int v83 = (int)v24;
    int v85 = [a4->var1 iWidth];
    int v86 = [a4->var1 iHeight];
    [a4->var1 fRate];
    int v87 = (int)v25;
    int v88 = [a4->var2 iWidth];
    int v89 = [a4->var2 iHeight];
    [a4->var2 fRate];
    unsigned int v26 = self->callSessionBitrate;
    int v90 = (int)v27;
    int v91 = 1000 * v26;
    unsigned int v94 = [(VCCapabilities *)self->caps actualVideoCodec];
    int v92 = -1;
    uint64_t v93 = 0x3FD0000000000000;
    uint64_t v98 = 0x20000000200;
    v101 = [(VCCallSession *)self matchedFeaturesStringForPayload:[(VCCapabilities *)self->caps actualVideoCodec]];
    BOOL remoteSupportsVisibleRect = self->remoteSupportsVisibleRect;
    __int16 v100 = v15;
    signed int v97 = v57;
    int v75 = IsInterfaceOnCellularForActiveConnectionWithQuality;
    int v76 = v52;
    int v77 = v54;
    BOOL v78 = (int)VCCPUCount() > 1;
    int v95 = [(VCAudioTransmitter *)self->audioTransmitter audioTxBitrate];
    int sampleRate = self->sampleRate;
    unsigned int v80 = [(VCCallInfo *)self->remoteCallInfo visibleRectCropping];
    BOOL v70 = [(VCCallInfo *)self->remoteCallInfo isIOS];
    unsigned __int16 maxPacketLength = self->maxPacketLength;
    BOOL v71 = v48;
    int v104 = v47;
    BOOL v105 = v45;
    BOOL v106 = v44;
    unsigned int v99 = v43;
    char v73 = 1;
    int fecMode = self->fecMode;
    BOOL useRateControl = self->useRateControl;
    BOOL v107 = [(VCCallInfo *)self->remoteCallInfo supportsDynamicContentsRectWithAspectPreservation];
    int v84 = 875704438;
    BOOL v111 = a7;
    int v28 = operatingMode;
    if (operatingMode == 4)
    {
      int v29 = 3;
    }
    else
    {
      int v28 = 1;
      int v29 = 2;
    }
    int v108 = v28;
    int v109 = v29;
    int v110 = 1;
    BOOL v112 = a8;
    char v113 = 1;
    int Handle = VideoTransmitter_CreateHandle(p_hVideoTransmitter, (unsigned int *)buf);
    if (v15) {
      CFRelease(v15);
    }
    if (Handle < 0)
    {
      [(VCCallSession *)self cleanUpVideoReceiver];
      [(VCCallSession *)self cleanUpVideoRTP];
      +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a3, 32017, 111, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSessionCategories.m", 632), @"Could not create video transmitting unit", @"Video unavailable");
    }
    uint64_t v30 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
    uint64_t v31 = [(AVCRateController *)self->_rateController statisticsCollector];
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __140__VCCallSession_VideoConferencing__initializeVideoTransmitter_videoRules_unpausing_reportingAgent_fecHeaderV1Enabled_isFECGeneratorEnabled___block_invoke;
    v56[3] = &unk_1E6DB3FA8;
    v56[4] = v30;
    [(AVCStatisticsCollector *)v31 registerStatisticsChangeHandlerWithType:3 handler:v56];
    if (self->canLocalResizePIP || !self->canRemoteResizePIP)
    {
      -[VCCallSession computeVisibleAspectRatioWithRemoteScreenAspectRatio:remoteExpectedAspectRatio:encodeWidth:encodeHeight:](self, "computeVisibleAspectRatioWithRemoteScreenAspectRatio:remoteExpectedAspectRatio:encodeWidth:encodeHeight:", [a4->var0 iHeight], objc_msgSend(a4->var0, "iWidth"), self->remoteScreenPortraitAspectRatio.width, self->remoteScreenPortraitAspectRatio.height, self->remoteExpectedPortraitAspectRatio.width, self->remoteExpectedPortraitAspectRatio.height);
      double v33 = v32;
      double v35 = v34;
      -[VCCallSession computeVisibleAspectRatioWithRemoteScreenAspectRatio:remoteExpectedAspectRatio:encodeWidth:encodeHeight:](self, "computeVisibleAspectRatioWithRemoteScreenAspectRatio:remoteExpectedAspectRatio:encodeWidth:encodeHeight:", [a4->var0 iWidth], objc_msgSend(a4->var0, "iHeight"), self->remoteScreenLandscapeAspectRatio.width, self->remoteScreenLandscapeAspectRatio.height, self->remoteExpectedLandscapeAspectRatio.width, self->remoteExpectedLandscapeAspectRatio.height);
    }
    else
    {
      objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "localScreenRatioForScreenOrientation:", 0);
      double v33 = v38;
      double v35 = v39;
      objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "localScreenRatioForScreenOrientation:", 3);
    }
    VideoTransmitter_SetAspectRatios(v33, v35, v36, v37);
    VideoTransmitter_SetCellTech(*p_hVideoTransmitter, IsInterfaceOnCellularForActiveConnectionWithQuality, v52, v54, v51);
  }
  else
  {
    int Handle = 0;
  }
  if (v55) {
    VideoTransmitter_Pause(*p_hVideoTransmitter, 0);
  }
  return Handle >= 0;
}

void __140__VCCallSession_VideoConferencing__initializeVideoTransmitter_videoRules_unpausing_reportingAgent_fecHeaderV1Enabled_isFECGeneratorEnabled___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4E56580]([*(id *)(a1 + 32) weak]);
  long long v4 = *(_OWORD *)(a2 + 176);
  v10[10] = *(_OWORD *)(a2 + 160);
  v10[11] = v4;
  uint64_t v11 = *(void *)(a2 + 192);
  long long v5 = *(_OWORD *)(a2 + 112);
  v10[6] = *(_OWORD *)(a2 + 96);
  v10[7] = v5;
  long long v6 = *(_OWORD *)(a2 + 144);
  v10[8] = *(_OWORD *)(a2 + 128);
  v10[9] = v6;
  long long v7 = *(_OWORD *)(a2 + 48);
  void v10[2] = *(_OWORD *)(a2 + 32);
  void v10[3] = v7;
  long long v8 = *(_OWORD *)(a2 + 80);
  v10[4] = *(_OWORD *)(a2 + 64);
  v10[5] = v8;
  long long v9 = *(_OWORD *)(a2 + 16);
  v10[0] = *(_OWORD *)a2;
  v10[1] = v9;
  [v3 updateStatistics:v10];
  if (v3) {
    CFRelease(v3);
  }
}

- (BOOL)initializeDisplayLinkWithError:(id *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  long long v9 = __67__VCCallSession_VideoConferencing__initializeDisplayLinkWithError___block_invoke;
  uint64_t v10 = &unk_1E6DB6DA0;
  uint64_t v11 = self;
  long long v5 = [[VCDisplayLink alloc] initWithHandler:&v7 threadPriority:39 threadOptions:0 threadIdentifier:@"com.apple.VCCallSession.VCDisplayLink" preferredFrameRate:0.0];
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
        -[VCCallSession(VideoConferencing) initializeDisplayLinkWithError:]();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCCallSession(VideoConferencing) initializeDisplayLinkWithError:]();
    }
  }
  [(VCCallSession *)self cleanUpDisplayLink];
  +[GKVoiceChatError getNSError:a3 code:32017 detailedCode:117 filePath:0 description:@"Could not create and activate display link" reason:@"Video unavailable"];
  return 0;
}

uint64_t __67__VCCallSession_VideoConferencing__initializeDisplayLinkWithError___block_invoke(uint64_t a1, double *a2)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 1248);
  if (result != 0xFFFFFFFFLL) {
    return VideoReceiver_DisplayLinkTick(a2[1], *a2, a2[2]);
  }
  return result;
}

- (void)handleVideoReceiverInitializationFailed
{
  [(VCCallSession *)self cleanUpVideoTransmitter];
  [(VCCallSession *)self cleanUpVideoReceiver];
  [(VCCallSession *)self cleanUpDisplayLink];

  [(VCCallSession *)self cleanUpVideoRTP];
}

- (BOOL)videoReceiverInitializationError:(id *)a3 withDescription:(id)a4
{
  return +[GKVoiceChatError getNSError:a3 code:32017 detailedCode:110 filePath:0 description:a4 reason:@"Video unavailable"];
}

- (BOOL)createVideoReceiverWithReportingAgent:(opaqueRTCReporting *)a3 fecHeaderV1Enabled:(BOOL)a4 videoJBEnabled:(BOOL)a5 error:(id *)a6
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  BOOL v26 = [+[VCDefaults sharedInstance] enableVPBLogging];
  BOOL v27 = [+[VCDefaults sharedInstance] enableBitstreamCapture];
  int v25 = [+[VCDefaults sharedInstance] enableRxDecodeYUVDump];
  BOOL v24 = [+[VCDefaults sharedInstance] enableRecvBitstreamDump];
  BOOL bBWEstNewBWEstModeEnabled = self->bBWEstNewBWEstModeEnabled;
  LODWORD(v31) = self->bBWEstOperatingModeInitialized;
  DWORD1(v31) = bBWEstNewBWEstModeEnabled;
  BOOL bBWEstActiveProbingSenderLog = self->bBWEstActiveProbingSenderLog;
  DWORD2(v31) = self->bBWEstFakeLargeFrameModeEnabled;
  HIDWORD(v31) = bBWEstActiveProbingSenderLog;
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFIndex v10 = [(NSMutableDictionary *)self->featureListStringDict count];
  Mutable = CFDictionaryCreateMutable(v9, v10, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  uint64_t v12 = (void *)[(NSMutableDictionary *)self->featureListStringDict allKeys];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v70 objects:v69 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v71;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v71 != v15) {
          objc_enumerationMutation(v12);
        }
        CFDictionaryAddValue(Mutable, *(const void **)(*((void *)&v70 + 1) + 8 * i), (const void *)objc_msgSend(NSString, "stringWithString:", objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->featureListStringDict, "objectForKeyedSubscript:", *(void *)(*((void *)&v70 + 1) + 8 * i)), "objectForKey:", @"matchedFeatureListString")));
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v70 objects:v69 count:16];
    }
    while (v14);
  }
  bzero(&v32, 0x578uLL);
  rtpVideo = self->rtpVideo;
  if (Mutable) {
    CFTypeRef v18 = CFRetain(Mutable);
  }
  else {
    CFTypeRef v18 = 0;
  }
  videoMediaControlInfoGenerator = self->videoMediaControlInfoGenerator;
  int v32 = 1;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  double v36 = rtpVideo;
  CFTypeRef v37 = v18;
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  uint64_t v40 = videoMediaControlInfoGenerator;
  uint64_t v41 = 0;
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  uint64_t v45 = [(VCCallSession *)self callID];
  int sampleRate = self->sampleRate;
  int v47 = sampleRate;
  BOOL v48 = v26;
  unsigned int v49 = [(VCCallSession *)self callID];
  BOOL v50 = [(VCCallSession *)self useControlByte];
  BOOL v51 = v27;
  int v52 = v25;
  BOOL v53 = [(VCCallSession *)self useUEP];
  BOOL v54 = v24;
  char v55 = 0;
  int v56 = self;
  unsigned int v57 = GCKVoiceChatOnPlayVideo;
  wrmInfo = self->wrmInfo;
  char v62 = 1;
  int v58 = wrmInfo;
  BOOL v63 = a4;
  __int16 v61 = 0;
  BOOL v60 = a5;
  uint64_t v44 = 0x200000000;
  int v59 = 60;
  __int16 v64 = 256;
  char v66 = 0;
  long long v65 = self->videoMediaControlInfoGenerator;
  int v67 = 1;
  BOOL v68 = [(VCCallSession *)self operatingMode] == 4;
  int v21 = VideoReceiver_CreateHandle((uint64_t *)&self->hVideoReceiver, (uint64_t)&v32, a3, &v31, 0);
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v18) {
    CFRelease(v18);
  }
  if (v21 < 0)
  {
    [(VCCallSession *)self videoReceiverInitializationError:a6 withDescription:@"Could not create video receiver"];
    [(VCCallSession *)self cleanUpDisplayLink];
    [(VCCallSession *)self cleanUpVideoReceiver];
  }
  return v21 >= 0;
}

- (BOOL)initializeVideoReceiver:(id *)a3 reportingAgent:(opaqueRTCReporting *)a4 fecHeaderV1Enabled:(BOOL)a5 videoJBEnabled:(BOOL)a6
{
  hVideoReceiver = self->hVideoReceiver;
  if (hVideoReceiver == (tagHANDLE *)0xFFFFFFFFLL)
  {
    if (![(VCCallSession *)self createVideoReceiverWithReportingAgent:a4 fecHeaderV1Enabled:a5 videoJBEnabled:a6 error:a3])
    {
      [(VCCallSession *)self handleVideoReceiverInitializationFailed];
      return 0;
    }
    hVideoReceiver = self->hVideoReceiver;
  }
  if ((VideoReceiver_SetVTHandleAndStart((uint64_t)hVideoReceiver, (uint64_t)self->hVideoTransmitter) & 0x80000000) != 0) {
    [(VCCallSession *)self videoReceiverInitializationError:a3 withDescription:@"Could not start video receiver"];
  }
  return 1;
}

- (double)sessionTransmittingFramerate
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  v3[0] = 0.0;
  VideoTransmitter_GetFramerate(3.0, (uint64_t)self->hVideoTransmitter, v3);
  return v3[0];
}

- (double)sessionTransmittingBitrate
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  v3[0] = 0.0;
  VideoTransmitter_GetBitrate(3.0, (uint64_t)self->hVideoTransmitter, v3);
  return v3[0];
}

- (double)sessionReceivingFramerate
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  v3[0] = 0.0;
  VideoReceiver_GetFramerate(3.0, (uint64_t)self->hVideoReceiver, v3);
  return v3[0];
}

- (double)sessionReceivingBitrate
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  VideoReceiver_GetBitrate(3.0, (uint64_t)self->hVideoReceiver, (uint64_t)v3, 0, 0, 0, 0);
  return *(double *)v3;
}

- (void)updateVideoQualityNotification:(double)a3
{
  if (a3 - self->lastVideoQualityNotificationUpdate > 0.5)
  {
    [(VCCallSession *)self updateVideoQualityStatusWithTime:0 isRemote:a3];
    if (!self->isRemoteMediaStalled) {
      [(VCCallSession *)self updateVideoQualityStatusWithTime:1 isRemote:a3];
    }
    self->lastVideoQualityNotificationUpdate = a3;
  }
}

- (id)newRemoteScreenAttributesForOrientation:(int)a3
{
  long long v5 = objc_alloc_init(VideoAttributes);
  id v6 = +[VCVideoCaptureServer VCVideoCaptureServerSingleton];
  if (a3 > 1)
  {
    uint64_t v9 = 3;
    [v6 localScreenRatioForScreenOrientation:3];
    if (self->canLocalResizePIP || !self->canRemoteResizePIP)
    {
      CFIndex v10 = &OBJC_IVAR___VCCallSession_remoteScreenLandscapeAspectRatio;
LABEL_9:
      uint64_t v11 = (double *)((char *)self + *v10);
      double v7 = *v11;
      double v8 = v11[1];
    }
  }
  else
  {
    [v6 localScreenRatioForScreenOrientation:0];
    if (self->canLocalResizePIP)
    {
      uint64_t v9 = 0;
LABEL_8:
      CFIndex v10 = &OBJC_IVAR___VCCallSession_remoteScreenPortraitAspectRatio;
      goto LABEL_9;
    }
    uint64_t v9 = 0;
    if (!self->canRemoteResizePIP) {
      goto LABEL_8;
    }
  }
  -[VideoAttributes setRatio:](v5, "setRatio:", v7, v8);
  [(VideoAttributes *)v5 setOrientation:v9];
  [(VideoAttributes *)v5 setCamera:0];
  [(VideoAttributes *)v5 setCameraSwitching:0];
  return v5;
}

- (void)processResolutionChangeToVideoRule:(id)a3 captureRule:(id)a4 featureListString:(id)a5
{
  if (a3)
  {
    if (a4)
    {
      int v9 = -[VCCallSession parameterSetForPayload:](self, "parameterSetForPayload:", [a3 iPayload]);
      hVideoTransmitter = self->hVideoTransmitter;
      int v11 = [a3 iWidth];
      int v12 = [a3 iHeight];
      int v13 = [a3 iPayload];
      [a3 fRate];
      VideoTransmitter_PrepareForResChange((uint64_t)hVideoTransmitter, v11, v12, v13, (int)v14, (unsigned char *)[a5 UTF8String], objc_msgSend(a4, "iWidth"), objc_msgSend(a4, "iHeight"), v9);
      if (objc_opt_respondsToSelector())
      {
        delegate = self->delegate;
        [(VCCallSessionDelegate *)delegate session:self didChangeVideoRule:a4];
      }
    }
  }
}

- (void)updateSourcePlayoutTime:(const tagVCMediaTime *)a3
{
  if (a3)
  {
    double v5 = micro();
    if (v5 - self->lastVideoCallAlarmTime > 0.0)
    {
      hVideoReceiver = self->hVideoReceiver;
      if (hVideoReceiver != (tagHANDLE *)0xFFFFFFFFLL) {
        VideoReceiver_UpdateSourcePlayoutTime((uint64_t)hVideoReceiver, a3);
      }
      self->lastVideoCallAlarmTime = v5;
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCCallSession(VideoConferencing) updateSourcePlayoutTime:]();
    }
  }
}

- (void)updateStatistics:(tagVCStatisticsMessage *)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  uint64_t v5 = 0;
  int v7 = 0;
  hVideoTransmitter = self->hVideoTransmitter;
  unsigned int audioReceivedPackets = a3->var0.feedback.audioReceivedPackets;
  VideoTransmitter_SetNetworkStats((uint64_t)hVideoTransmitter, (uint64_t)&audioReceivedPackets);
}

void __88__VCCallSession_initWithDeviceRole_transportType_isGKVoiceChat_reportingHierarchyToken___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d RTCReporting: can't configure the reporting agent.", v2, v3, v4, v5, v6);
}

- (void)gatherRealtimeStats:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_8();
  _os_log_debug_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_DEBUG, "VCCallSession [%s] %s:%d RTCReporting: reporting dictionary %s", v2, 0x26u);
}

void __34__VCCallSession_setOperatingMode___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11_0();
  id v1 = (void *)OUTLINED_FUNCTION_13_6(v0, *MEMORY[0x1E4F143B8]);
  if (v1) {
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v2, v3, "VCCallSession [%s] %s:%d setOperatingMode - startVideo failed with error %s", v4, v5, v6, v7, v8);
}

void __34__VCCallSession_setOperatingMode___block_invoke_140_cold_1()
{
  OUTLINED_FUNCTION_11_0();
  id v1 = (void *)OUTLINED_FUNCTION_13_6(v0, *MEMORY[0x1E4F143B8]);
  if (v1) {
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v2, v3, "VCCallSession [%s] %s:%d setOperatingMode - stop failed with error %s", v4, v5, v6, v7, v8);
}

void __38__VCCallSession_handleCellTechChange___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d VCCallSession: received unsupported cell tech change to %d", v2, v3, v4, 1115);
}

- (void)applyFeatureListStringForPayload:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCCallSession applyFeatureListStringForPayload:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d NO matched feature list string for selected payload %d", v2, *(const char **)v3, (unint64_t)"-[VCCallSession applyFeatureListStringForPayload:]" >> 16, v4);
}

- (void)chooseVideoPayloadForInterface:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCCallSession chooseVideoPayloadForInterface:]";
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d Could not find matching video codec for interface %d", v2, *(const char **)v3, (unint64_t)"-[VCCallSession chooseVideoPayloadForInterface:]" >> 16, v4);
}

- (void)chooseVideoPayloadForInterface:.cold.2()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v2 = "-[VCCallSession chooseVideoPayloadForInterface:]";
  __int16 v3 = 1024;
  OUTLINED_FUNCTION_6();
  _os_log_fault_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_FAULT, "VCCallSession [%s] %s:%d Could not find matching video codec for interface %d", v1, 0x22u);
}

- (void)resetVideoRulesForInterface:videoReportingDictionary:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d captureRule or encodeRule is nil", v2, v3, v4, v5, v6);
}

void __63__VCCallSession_schedulePrimaryConnectionChange_oldConnection___block_invoke_cold_1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  int v3 = 1592;
  __int16 v4 = 2048;
  uint64_t v5 = v0;
  OUTLINED_FUNCTION_7_3(&dword_1E1EA4000, v1, (uint64_t)v1, "VCCallSession [%s] %s:%d invalid connection change state %ld", v2);
}

void __66__VCCallSession_updateLastReceivedPacketWithTimestamp_packetType___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d RTT too high:Disconnecting", v2, v3, v4, v5, v6);
}

uint64_t __66__VCCallSession_updateLastReceivedPacketWithTimestamp_packetType___block_invoke_cold_2(uint64_t a1, uint64_t a2, char a3)
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v4, v5, "VCCallSession [%s] %s:%d PLR too high:Disconnecting", v6, v7, v8, v9, v11);
  return a3 & 1;
}

void __66__VCCallSession_updateLastReceivedPacketWithTimestamp_packetType___block_invoke_228_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*(void *)a2 + 768);
  uint64_t v4 = *(void *)(*(void *)a2 + 680);
  int v5 = 136316162;
  uint64_t v6 = a1;
  __int16 v7 = 2080;
  uint64_t v8 = "-[VCCallSession updateLastReceivedPacketWithTimestamp:packetType:]_block_invoke";
  __int16 v9 = 1024;
  int v10 = 1971;
  __int16 v11 = 2048;
  uint64_t v12 = v3;
  __int16 v13 = 2048;
  uint64_t v14 = v4;
  _os_log_debug_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_DEBUG, "VCCallSession [%s] %s:%d double roundTripTime = %f, packetLossRate = %f", (uint8_t *)&v5, 0x30u);
}

void __90__VCCallSession_setupConnectionTimeoutTimerWithErrorCode_detailedCode_description_reason___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d Connection timeout occurred, disconnecting", v2, v3, v4, v5, v6);
}

- (void)startConnectionWithParticipantID:callID:usingInviteData:isCaller:capabilities:idsSocket:destination:error:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCCallSession startConnectionWithParticipantID:callID:usingInviteData:isCaller:capabilities:idsS"
                      "ocket:destination:error:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d SKEState_SetBlob(0) failed with error %d", v2, *(const char **)v3, (unint64_t)"-[VCCallSession startConnectionWithParticipantID:callID:usingInviteData:isCaller:capabilities:idsSocket:destination:error:]" >> 16, v4);
}

- (void)startConnectionWithParticipantID:callID:usingInviteData:isCaller:capabilities:idsSocket:destination:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d Failed to add participant to Control Channel list of active participants", v2, v3, v4, v5, v6);
}

- (void)startConnectionWithParticipantID:callID:usingInviteData:isCaller:capabilities:idsSocket:destination:error:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d Failed to process response media blob", v2, v3, v4, v5, v6);
}

- (void)startConnectionWithParticipantID:callID:usingInviteData:isCaller:capabilities:idsSocket:destination:error:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_12_4(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d Failed to process response media blob", v2, v3, v4, v5, v6);
}

void __123__VCCallSession_startConnectionWithParticipantID_callID_usingInviteData_isCaller_capabilities_idsSocket_destination_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d Reporting not available (no backends)", v2, v3, v4, v5, v6);
}

- (void)newMediaNegotiatorAudioConfigurationWithAllowAudioSwitching:useSBR:aacBlockSize:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d Failed to create audio rules for media negotiator", v2, v3, v4, v5, v6);
}

- (void)newMediaNegotiatorAudioConfigurationWithAllowAudioSwitching:useSBR:aacBlockSize:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d Failed to create audio configuration for media negotiator", v2, v3, v4, v5, v6);
}

- (void)newCameraConfiguration
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d Failed to create local feature string for media negotiator", v2, v3, v4, v5, v6);
}

- (void)newScreenConfigurationWithCameraConfiguration:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v2 = "-[VCCallSession newScreenConfigurationWithCameraConfiguration:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_7_3(&dword_1E1EA4000, v0, (uint64_t)v0, "VCCallSession [%s] %s:%d Failed to copy cameraConfiguration=%@", v1);
}

- (void)addMediaConfigurationsToLocalConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d Failed to create local microphone configuration for media negotiator", v2, v3, v4, v5, v6);
}

- (void)addMediaConfigurationsToLocalConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d Failed to create cameraConfiguration", v2, v3, v4, v5, v6);
}

- (void)addMediaConfigurationsToLocalConfiguration:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d Failed to create screenConfiguration", v2, v3, v4, v5, v6);
}

- (void)newMediaBlobWithRemoteMediaBlob:localCallID:isLowBitrateCodecPreferred:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d Failed to create local configuration for the media negotiator", v2, v3, v4, v5, v6);
}

- (void)newMediaBlobWithRemoteMediaBlob:localCallID:isLowBitrateCodecPreferred:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d Failed to create media negotiator", v2, v3, v4, v5, v6);
}

- (void)newMediaBlobWithRemoteMediaBlob:localCallID:isLowBitrateCodecPreferred:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d Failed to create the response media blob", v2, v3, v4, v5, v6);
}

- (void)newMediaBlobWithRemoteMediaBlob:localCallID:isLowBitrateCodecPreferred:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d Failed to process media blob", v2, v3, v4, v5, v6);
}

- (void)inviteDataForParticipantID:callID:remoteInviteData:nonCellularCandidateTimeout:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d Failed to generate the media blob", v2, v3, v4, v5, v6);
}

- (void)inviteDataForParticipantID:callID:remoteInviteData:nonCellularCandidateTimeout:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_12_4(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d Failed to generate the media blob", v2, v3, v4, v5, v6);
}

void __43__VCCallSession_setPauseAudio_force_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d Baseband codec not set propertly", v2, v3, v4, v5, v6);
}

void __43__VCCallSession_setPauseVideo_force_error___block_invoke_2_cold_1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  int v3 = 3532;
  __int16 v4 = 2112;
  uint64_t v5 = v0;
  OUTLINED_FUNCTION_7_3(&dword_1E1EA4000, v1, (uint64_t)v1, "VCCallSession [%s] %s:%d failed to start video with error %@", v2);
}

- (void)processRelayRequestResponseDict:didOriginateRequest:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [v2 isCallOngoing];
  int v5 = 136316162;
  uint64_t v6 = v1;
  __int16 v7 = 2080;
  OUTLINED_FUNCTION_8();
  int v8 = 3571;
  __int16 v9 = v3;
  int v10 = 3571;
  __int16 v11 = v3;
  int v12 = v4;
  _os_log_error_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_ERROR, "VCCallSession [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m:%d: processRelayRequestResponseDict bailing because (![self isCallOngoing] == %d)", (uint8_t *)&v5, 0x28u);
}

- (void)processRelayUpdateDict:didOriginateRequest:.cold.1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  __int16 v3 = "-[VCCallSession processRelayUpdateDict:didOriginateRequest:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_5_5(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m:%d: processRelayUpdateDict: remoteCallInfo is nil.", v2);
}

- (void)sendData:messageType:encrypted:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d Attempt to send data with zero size. Ignoring...", v2, v3, v4, v5, v6);
}

- (void)negotiatedReceivingFramerate
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d framerate is not set.", v2, v3, v4, v5, v6);
}

- (void)updateRelayedCallType:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCCallSession updateRelayedCallType:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d Invalid relayedCallType=%d", v2, *(const char **)v3, (unint64_t)"-[VCCallSession updateRelayedCallType:]" >> 16, v4);
}

- (void)setSessionConferenceState:callID:.cold.1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v3 = "-[VCCallSession setSessionConferenceState:callID:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_5_5(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m:%d: setSessionConferenceState: invalid state", v2);
}

void __65__VCCallSession_PrivateMethods__startAudioWithCompletionHandler___block_invoke_cold_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v3 = "-[VCCallSession(PrivateMethods) startAudioWithCompletionHandler:]_block_invoke";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_5_5(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m:%d: Benign Error (possibly not): We started audio before we negotiated our codec.", v2);
}

void __67__VCCallSession_PrivateMethods__startAudioIOWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d Baseband codec not set propertly", v2, v3, v4, v5, v6);
}

void __75__VCCallSession_PrivateMethods__disconnectWithNoRemotePackets_timeoutUsed___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(v1 + 32) + 24) callID];
  OUTLINED_FUNCTION_7_1();
  uint64_t v5 = "-[VCCallSession(PrivateMethods) disconnectWithNoRemotePackets:timeoutUsed:]_block_invoke";
  OUTLINED_FUNCTION_3();
  int v6 = 9664;
  __int16 v7 = v2;
  int v8 = v3;
  _os_log_debug_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_DEBUG, "VCCallSession [%s] %s:%d Failing due to no remote packets.  local callid: %x", v4, 0x22u);
}

void __47__VCCallSession_Messages__setupMomentsMessages__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d setupMomentsMessages message is nil", v2, v3, v4, v5, v6);
}

void __57__VCCallSession_Messages__setupPreferredInterfaceMessage__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d setupPreferredInterfaceMessage message is nil", v2, v3, v4, v5, v6);
}

void __58__VCCallSession_Messages__setupWRMAlertStateUpdateMessage__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d setupWRMAlertStateUpdateMessage message is nil", v2, v3, v4, v5, v6);
}

void __58__VCCallSession_Messages__setupWRMAlertStateUpdateMessage__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCCallSession [%s] %s:%d setupWRMAlertStateUpdateMessage message is invalid", v2, v3, v4, v5, v6);
}

@end