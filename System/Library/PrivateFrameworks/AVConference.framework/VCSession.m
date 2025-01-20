@interface VCSession
+ (BOOL)isEnhancedJBAdaptationsEnabled;
+ (BOOL)isServerPacketRetransmissionEnabledForVideo;
+ (BOOL)isUplinkRetransmissionEnabledForVideo;
+ (id)mediaStateMessageKeyForMediaType:(unsigned int)a3;
+ (id)mediaStateMessageStreamGroupKeysForMediaType:(unsigned int)a3;
+ (id)mediaStateMessageValueForMediaState:(unsigned int)a3;
+ (int)deviceRoleForSessionMode:(int64_t)a3;
+ (unsigned)mediaStateForMediaStateMessageValue:(id)a3;
+ (unsigned)mediaTypeForMediaStateMessageKey:(id)a3;
+ (void)addUUIDToMutableData:(id)a3 fromUUIDString:(id)a4;
+ (void)cleanupControlChannelParticipantConfig:(id *)a3;
+ (void)initVideoFeatureStatusSettings:(tagVCReportingClientSettingsPersist *)a3;
+ (void)terminateProcess:(id)a3 terminateSource:(id)a4 agent:(opaqueRTCReporting *)a5;
- (AVCRateController)downlinkRateController;
- (BOOL)actionDidFinishForContext:(const tagVCAsynchronousActionContext *)a3 withError:(id *)a4;
- (BOOL)actionWillBeginForContext:(const tagVCAsynchronousActionContext *)a3 withError:(id *)a4;
- (BOOL)addOneToOneParticipant:(id)a3;
- (BOOL)completeTransitionToOneToOneEnabled:(BOOL)a3;
- (BOOL)composeControlChannelParticipantConfig:(id *)a3 withRemoteParticipant:(id)a4;
- (BOOL)configureLocalParticipantWithOneToOneRemoteParticipant:(id)a3 isInitialConfiguration:(BOOL)a4;
- (BOOL)configureRemoteParticipant:(id)a3 withConfig:(id)a4;
- (BOOL)configureRemoteParticipantForOneToOne:(id)a3;
- (BOOL)detectSSRCCollision:(id)a3 resetNeeded:(BOOL *)a4;
- (BOOL)detectSSRCCollisionWithRemoteMediaStream:(id)a3 remoteBlobCreationTime:(tagNTP)a4 resetNeeded:(BOOL *)a5;
- (BOOL)generateReceptionReportList:(_RTCP_RECEPTION_REPORT *)a3 reportCount:(char *)a4;
- (BOOL)handleEncryptionInfoChange:(id)a3;
- (BOOL)isAVCForcingECNDefaultSet;
- (BOOL)isECNCapableWithRemoteParticipant:(id)a3;
- (BOOL)isECNPermittedFromNetworkingLayer;
- (BOOL)isNetworkForcingECNDefaultSet;
- (BOOL)isOneToOneRemoteMediaStalling;
- (BOOL)isOneToOneRemoteParticipantUsingScreen;
- (BOOL)isOneToOneUsingScreen;
- (BOOL)isOneToOneUsingVideo;
- (BOOL)isPersonaCameraSupported;
- (BOOL)isTLEEnabledOnPrimaryConnection;
- (BOOL)isUsingPersonaCamera;
- (BOOL)multiwayToOneToOneSwitchConfigure;
- (BOOL)negotiateOneToOneWithRemoteParticipant:(id)a3;
- (BOOL)oneToOneModeEnabled;
- (BOOL)registerRemoteParticipantToSession:(id)a3;
- (BOOL)screenAndCameraMixingEnabled;
- (BOOL)setOneToOneConfigOnRemoteParticipant:(id)a3;
- (BOOL)sharingEnabled;
- (BOOL)shouldSendControlChannelMessages;
- (BOOL)switchFromMultiwayToOneToOne;
- (BOOL)switchFromOneToOneToMultiway;
- (BOOL)validateStreamGroup:(id)a3 state:(id)a4;
- (NSArray)remoteParticipants;
- (NSDictionary)capabilities;
- (NSDictionary)transportMetadata;
- (NSMutableDictionary)optInDictionary;
- (NSMutableDictionary)remoteParticipantsMapByServerID;
- (NSString)description;
- (NSString)idsDestination;
- (NSString)uuid;
- (OS_nw_activity)nwActivity;
- (OS_nw_activity)parentNWActivity;
- (VCConnectionProtocol)currentActiveConnection;
- (VCSession)initWithIDSDestination:(id)a3 configurationDict:(id)a4 negotiationData:(id)a5 delegate:(id)a6 processId:(int)a7 isGKVoiceChat:(BOOL)a8;
- (VCSession)initWithRelevantStorebagEntries;
- (VCSessionDelegate)delegate;
- (VCSessionMessaging)sessionMessaging;
- (VCSessionParticipant)localParticipant;
- (VCSessionParticipantRemote)oneToOneRemoteParticipant;
- (VCSessionStatsController)sessionStatsController;
- (VCTransportSession)transportSession;
- (__CFDictionary)getClientSpecificUserInfo;
- (__CFString)configurationSpecificReportingServiceName;
- (char)sessionStateToString:(unsigned int)a3;
- (id)computeConversationTimeBaseTruncated;
- (id)newEncryptionLabelWithLocalUUID:(id)a3 remoteUUID:(id)a4;
- (id)newNegotiatorForOneToOneWithRemoteParticipant:(id)a3;
- (id)newNetworkBitrateString:(id *)a3;
- (id)newParticipantOneToOneConfigWithIDSParticipantID:(unint64_t)a3 isLocal:(BOOL)a4 mediaControlInfoVersion:(unsigned __int8)a5 videoEnabled:(BOOL)a6 screenEnabled:(BOOL)a7 remoteParticipant:(id)a8;
- (id)participantForID:(id)a3;
- (id)participantsToString;
- (id)stateMessageWithSupportsNestedDictionary:(BOOL)a3;
- (id)vcrcServerBagWithOperatingMode:(int)a3;
- (int)flushBasebandWithPayloads:(id)a3;
- (int)getStorebagValueForIntegerKey:(id)a3 defaultValue:(id)a4;
- (int)learntBitrateForSegment:(id)a3 defaultValue:(int)a4;
- (int)maxRemoteParticipants30fps;
- (int)reportingClientType;
- (int)reportingModuleID;
- (int)reserveAudioChannelForMediaType:(unsigned int)a3 spatialAudioSourceID:(unint64_t)a4;
- (int)selectDataPath;
- (int)setupOneToOne;
- (int)setupOneToOneMediaControlInfoGeneratorsWithVersion:(unsigned __int8)a3 oneToOneConfig:(id)a4 videoEnabled:(BOOL)a5;
- (int)setupOneToOneMediaQueue;
- (int)setupRateControllerOneToOne;
- (int)setupSpatialAudio;
- (int64_t)getCurrentMicMode;
- (tagVCMediaQueue)mediaQueue;
- (unsigned)calculateExpectedTotalNetworkBitrateDownlink;
- (unsigned)calculateExpectedTotalNetworkBitrateUplink;
- (unsigned)detailedErrorCodeForNoRemotePacketsError;
- (unsigned)transportSessionID;
- (unsigned)vcrcServerBagProfileNumber;
- (void)addNegotiatedCipherSuitesForParticipant:(id)a3 toReportingDictionary:(id)a4;
- (void)addParticipantConfigurations:(id)a3;
- (void)additionalFlushCountToOneToOneRateController:(unsigned int)a3;
- (void)appendMediaTypeMixingListToMessageDictionary:(id)a3;
- (void)applyLinkConstrains:(id)a3;
- (void)applyNegotiatedOneToOneFaceTimeSettings;
- (void)applyRemoteLinkConstrains:(id)a3;
- (void)applySpatialMetadata;
- (void)broadcastInitialMediaState;
- (void)broadcastMediaStateUpdateMessage;
- (void)broadcastMessage:(id)a3 withTopic:(id)a4;
- (void)broadcastMessageDictionary:(id)a3 withTopic:(id)a4;
- (void)broadcastSingleStateMessage:(id)a3 withTopic:(id)a4;
- (void)cleanUpMediaRecorder;
- (void)cleanUpOneToOneVideoStreamDelegate;
- (void)cleanupNwActivity;
- (void)cleanupOneToOne;
- (void)cleanupOneToOneDelegates;
- (void)cleanupOneToOneMediaQueue;
- (void)cleanupOneToOneVideoReceiverDelegate;
- (void)cleanupRateControllerOneToOne;
- (void)cleanupSpatialAudio;
- (void)cleanupVCRC;
- (void)collectSessionEventKeyFieldsAndSubtype:(__CFDictionary *)a3 eventType:(unsigned __int16)a4 withParticipant:(id)a5 keyChangeReason:(id)a6 newMKI:(id)a7 withStreamGroupID:(unsigned int)a8 withStreamID:(unsigned __int16)a9 collectSubtype:(unsigned __int16 *)a10;
- (void)completionHandlerOneToOneEnabled:(BOOL)a3 didSucceed:(BOOL)a4 configurationDict:(id)a5;
- (void)configureOneToOneRateController:(id)a3;
- (void)configureOneToOneRateController:(id)a3 isUsingCamera:(BOOL)a4 isUsingScreen:(BOOL)a5;
- (void)configureOneToOneReportingOnVideoEnabled;
- (void)createMediaQueue;
- (void)createSessionMessaging;
- (void)dealloc;
- (void)deregisterForThermalFeatureNotifications;
- (void)destroySessionMessaging;
- (void)didEncryptionKeyRollTimeout;
- (void)didLocalNetworkConditionChange:(BOOL)a3 isLocalNetworkQualityDegraded:(BOOL)a4 isRemoteNetworkQualityDegraded:(BOOL)a5;
- (void)didReceiveMomentsRequest:(id)a3;
- (void)didReceivedSessionStatsAtTime:(double)a3;
- (void)didRemoveSpatialMetadataEntry;
- (void)dispatchedAddParticipantConfigurations:(id)a3;
- (void)dispatchedAddParticipantWithConfig:(id)a3;
- (void)dispatchedHandleActiveConnectionChange:(id)a3;
- (void)dispatchedParticipant:(id)a3 didStart:(BOOL)a4 error:(id)a5;
- (void)dispatchedParticipant:(id)a3 didStopWithError:(id)a4;
- (void)dispatchedRemoteCellTechStateUpdate:(id)a3 maxRemoteBitrate:(id)a4;
- (void)dispatchedRemoveParticipant:(id)a3;
- (void)dispatchedSetOneToOneModeEnabled:(BOOL)a3 isLocal:(BOOL)a4 configurationDict:(id)a5;
- (void)dispatchedSetScreenAndCameraMixingEnabled:(BOOL)a3;
- (void)dispatchedSetSharingEnabled:(BOOL)a3;
- (void)dispatchedStart;
- (void)dispatchedStopWithError:(id)a3;
- (void)dispatchedStopWithError:(id)a3 didRemoteCancel:(BOOL)a4;
- (void)dispatchedTransportStop;
- (void)dispatchedUpdateConfiguration:(id)a3;
- (void)distributeBitrateAndOptInToStreamIDsWithSeamlessTransition:(BOOL)a3;
- (void)dumpVCSessionMetadataToDataStore;
- (void)enableDataCollectionInReportingConfig:(id *)a3;
- (void)generateKeyFrameWithReceivedMessage:(id)a3 forParticipant:(id)a4;
- (void)generateReportDictionary:(__CFDictionary *)a3;
- (void)handleActiveConnectionChange:(id)a3;
- (void)handleActiveConnectionChangeForMultiway:(id)a3;
- (void)handleActiveConnectionChangeForOneToOne:(id)a3;
- (void)handleCellTechChange:(int)a3 connection:(id)a4;
- (void)handleCellularMTUChanged:(unsigned __int16)a3 connection:(id)a4;
- (void)handleDeviceStateMessage:(id)a3 forParticipantId:(id)a4;
- (void)handleEncryptionInfoEvent:(id)a3;
- (void)handleMediaQueueSizeExceedThresholdWithQueueSize:(double)a3 mediaQueueStreamId:(unsigned int)a4 type:(int)a5;
- (void)handleMembershipChangeInfoEvent:(id)a3;
- (void)handleMicModeNotification:(id)a3;
- (void)handleNetworkCapabilityMessage:(id)a3 forParticipantId:(id)a4;
- (void)handlePreferredInterfaceForDuplicationUpdate:(unsigned __int8)a3 notifyPeer:(BOOL)a4 enableDuplication:(BOOL)a5 isMediaUnrecoverableSignal:(BOOL)a6;
- (void)handlePrimaryConnectionChanged:(id)a3;
- (void)handleThermalPressureNotification:(id)a3;
- (void)mediaController:(void *)a3 mediaSuggestionDidChange:(VCRateControlMediaSuggestion)a4;
- (void)mediaQualityDegraded:(BOOL)a3;
- (void)mediaRecorder:(id)a3 shouldProcessRequest:(id)a4 recipientID:(id)a5;
- (void)mediaStateChangedForParticipant:(id)a3;
- (void)messageExistingParticipantsPostOneToOneModeSwitch;
- (void)messageMediaInitialStateToParticipant:(id)a3;
- (void)multiwayToOneToOneSwitchResume;
- (void)multiwayToOneToOneSwitchSuspend;
- (void)notifyDelegateActiveConnectionDidChange;
- (void)notifyRemoteOfCellTechChange:(id)a3 remoteParticipant:(id)a4;
- (void)oneToOneToMultiwaySwitchConfigure;
- (void)oneToOneToMultiwaySwitchResume;
- (void)oneToOneToMultiwaySwitchSuspend;
- (void)optInStreamWithIDSStreamIDs:(id)a3;
- (void)optOutStreamWithIDSStreamIDs:(id)a3;
- (void)preWarmStateChanged:(BOOL)a3;
- (void)processDidStop;
- (void)processMediaStateMessage:(id)a3 remoteParticipantID:(id)a4;
- (void)processMediaTypeMixingList:(id)a3 forRemoteParticipant:(id)a4;
- (void)processMediaTypeStatesWithMessage:(id)a3 mediaTypeStates:(id)a4;
- (void)processStreamGroupStateMessageKey:(id)a3 value:(id)a4 mediaTypeStates:(id)a5;
- (void)processSymptomFromMessage:(id)a3 participantID:(id)a4 isLocalInitiated:(BOOL)a5 isLocalSideOnly:(BOOL)a6;
- (void)rateController:(id)a3 isECNEnabled:(BOOL)isECNForcedByNetwork isECNCapable:(BOOL)a5;
- (void)rateController:(id)a3 targetBitrateDidChange:(unsigned int)a4 rateChangeCounter:(unsigned int)a5;
- (void)readAndSetABCSymptomsReportingThresholdsFromStorebags:(id *)a3;
- (void)recommendedSettingsChanged:(id)a3;
- (void)registerForThermalFeatureNotifications;
- (void)registerQoSReporting;
- (void)registerReportingTask;
- (void)remoteCellTechStateUpdate:(int)a3 maxRemoteBitrate:(unsigned int)a4;
- (void)removeDelegatesForRemoteParticipant:(id)a3;
- (void)removeParticipant:(id)a3;
- (void)renewOneToOneMediaQueue;
- (void)reportActiveConnectionOneToOne;
- (void)reportClientPersistentSettings;
- (void)reportCompletedSwitchingToOneToOne:(BOOL)a3;
- (void)reportExistingParticipantsAnew;
- (void)reportKeysForDeviceStateMessage:(unsigned __int16)a3 stateMessage:(id)a4 InPayload:(id)a5 ForParitcipant:(id)a6;
- (void)reportLocalRateControlExperimentConfiguration;
- (void)reportStartedSwitchingToOneToOne:(BOOL)a3;
- (void)reportSwitchingError:(BOOL)a3 errorEvent:(unsigned int)a4;
- (void)reportingIntervalChanged:(double)a3;
- (void)reportingMomentsToGreenTeaWithRequest:(id)a3;
- (void)reportingSessionDownlinkOptInEvent:(id)a3 selectedMediaEntriesForParticipants:(id)a4;
- (void)reportingSessionParticipantEvent:(unsigned __int16)a3 keyChangeReason:(id)a4 newMKI:(id)a5;
- (void)reportingSessionParticipantEvent:(unsigned __int16)a3 withParticipant:(id)a4;
- (void)reportingSessionParticipantEvent:(unsigned __int16)a3 withParticipant:(id)a4 keyChangeReason:(id)a5 newMKI:(id)a6;
- (void)reportingSessionParticipantEvent:(unsigned __int16)a3 withParticipant:(id)a4 keyChangeReason:(id)a5 newMKI:(id)a6 withStreamGroupID:(unsigned int)a7 withStreamID:(unsigned __int16)a8;
- (void)reportingSessionParticipantEvent:(unsigned __int16)a3 withParticipant:(id)a4 streamGroupID:(unsigned int)a5 streamID:(unsigned __int16)a6;
- (void)reportingSessionRemoteParticipantEvent:(unsigned __int16)a3 withParticipant:(id)a4 value:(id)a5;
- (void)reportingSessionStopEventWithError:(id)a3;
- (void)reportingSetUserInfo;
- (void)resetDecryptionTimeout;
- (void)revertMultiwayToOneToOneModeSwitchConfigure;
- (void)sendDeviceStateMessageToParticipant:(id)a3 withStatus:(id)a4 checkDNUStatus:(BOOL)a5;
- (void)sendMediaStateUpdateMessageToRemoteParticipant:(id)a3;
- (void)sendNetworkCapabilitiesMessageToParticipant:(id)a3;
- (void)sendStreamGroupStateToParticipant:(id)a3;
- (void)sendSymptomsToRemoteParticipants:(id)a3 symptom:(id)a4 groupID:(id)a5;
- (void)sendThermalAndSliceMessageToPariticipant:(id)a3;
- (void)serverDidDie;
- (void)setBytesInFlightFlagWithParticipant:(id)a3;
- (void)setCurrentActiveConnection:(id)a3;
- (void)setDelegatesForRemoteParticipant:(id)a3;
- (void)setIsOneToOneRemoteMediaStalling:(BOOL)a3;
- (void)setIsSpatialAudioSupported:(BOOL)a3;
- (void)setIsUplinkRetransmissionEnabled:(BOOL)a3;
- (void)setLinkTypeForFeedbackController:(id)a3 withActiveConnection:(id)a4;
- (void)setMediaQueue:(tagVCMediaQueue *)a3;
- (void)setMediaQueuePeakBitrateWithTargetBitrate:(unsigned int)a3;
- (void)setNwActivity:(id)a3;
- (void)setOneToOneModeEnabled:(BOOL)a3;
- (void)setOneToOneModeEnabled:(BOOL)a3 configurationDict:(id)a4;
- (void)setOneToOneVideoStreamBandwidthProbing:(BOOL)a3;
- (void)setOptInDictionary:(id)a3;
- (void)setParentNWActivity:(id)a3;
- (void)setRemoteParticipantsMapByServerID:(id)a3;
- (void)setRemoteScreenControlEnabled:(BOOL)a3;
- (void)setReportingConfig:(id *)a3;
- (void)setScreenAndCameraMixingEnabled:(BOOL)a3;
- (void)setSessionInfoSynchronizerCallbacks;
- (void)setSessionInfoSynchronizerErrorResponseCallback;
- (void)setSessionInfoSynchronizerPeerSubscribedStreamsCallback;
- (void)setSessionMessaging:(id)a3;
- (void)setSharingEnabled:(BOOL)a3;
- (void)setState:(unsigned int)a3;
- (void)setTransportConnectionSelectionVersionWithLocalFrameWorkVersion:(id)a3 remoteFrameworkVersion:(id)a4;
- (void)setTransportSessionEventHandler;
- (void)setupAudioEnabledMessages;
- (void)setupAudioPausedMessages;
- (void)setupCellTechChangeMessages;
- (void)setupDeviceStateMessage;
- (void)setupDisconnectMessage;
- (void)setupKeyFrameGenerationMessages;
- (void)setupLinkConstrainsChangedMessages;
- (void)setupMediaQualityDegradedMessage;
- (void)setupMediaStateUpdateMessage;
- (void)setupMomentsMessages;
- (void)setupMultiwayABTesting;
- (void)setupNetworkCapabilityMessage;
- (void)setupNetworkQualityDegradedMessage;
- (void)setupOneToOneABTesting;
- (void)setupOneToOneAdaptiveLearning;
- (void)setupOneToOneEnabledMessages;
- (void)setupOneToOneVideoReceiverDelegate;
- (void)setupOneToOneVideoStreamDelegate;
- (void)setupPiPStateChangeMessage;
- (void)setupPreferredInterfaceMessage;
- (void)setupRateControllersMultiway;
- (void)setupReactionMessages;
- (void)setupSpatialAudio;
- (void)setupStreamGroupStateFetchMessage;
- (void)setupSymptomEnabledMessages;
- (void)setupTransportSessionWithDestination:(id)a3;
- (void)setupUplinkBitrateCaps;
- (void)setupVideoEnabledMessages;
- (void)setupVideoPausedMessages;
- (void)setupVideoRedundancyMessages;
- (void)setupWRMAlertUpdateMessage;
- (void)start;
- (void)startDeallocTimer;
- (void)startOneToOne;
- (void)startRateControllerOneToOne;
- (void)startRateControllersMultiwayFromOneToOne:(BOOL)a3;
- (void)startReportingForOneToOneEnabled:(BOOL)a3 withPayload:(id)a4;
- (void)startSessionMessaging;
- (void)stopAllParticipants;
- (void)stopMediaQueueOneToOne;
- (void)stopRateControllerOneToOne;
- (void)stopSessionMessaging;
- (void)stopTimeoutTimer;
- (void)stopWithError:(id)a3;
- (void)stopWithError:(id)a3 didRemoteCancel:(BOOL)a4;
- (void)tearDown;
- (void)unregisterQoSReporting;
- (void)unregisterRemoteParticipantFromSession:(id)a3;
- (void)unregisterReportingTask;
- (void)updateConfiguration:(id)a3;
- (void)updateLocalStreamConfiguration;
- (void)updateLocalVideoCaptureFrameRate;
- (void)updateMediaRecorderCapabillities:(unsigned int)a3 imageType:(int)a4 videoCodec:(int)a5;
- (void)updateMultiwayRateControllerWithActiveConnection:(id)a3 isScreenEnabled:(BOOL)a4 isLocal:(BOOL)a5;
- (void)updateMultiwayRateControllersWithActiveConnection:(id)a3;
- (void)updateNetworkFeedbackControllerReport:(id *)a3;
- (void)updateOneToOneRateControllerForVideoEnabled:(BOOL)a3;
- (void)updateOneToOneRateControllerForVideoEnabled:(BOOL)a3 screenEnabled:(BOOL)a4;
- (void)updateOneToOneVideoReceiverDelegate:(BOOL)a3;
- (void)updateParticipantConfigurations:(id)a3;
- (void)updateParticipantWindowState;
- (void)updatePresentationInfo:(id)a3;
- (void)updateStateMessage:(id)a3 stateState:(unsigned int)a4 streamGroupKey:(id)a5;
- (void)updateVCMediaQueueForMediaType:(unsigned int)a3 mediaState:(unsigned int)a4;
- (void)vcSessionParticipant:(id)a3 audioEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)vcSessionParticipant:(id)a3 audioPaused:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)vcSessionParticipant:(id)a3 didChangeActualNetworkBitrateForStreamGroupID:(unsigned int)a4;
- (void)vcSessionParticipant:(id)a3 didChangeMediaPriority:(unsigned __int8)a4 description:(id)a5;
- (void)vcSessionParticipant:(id)a3 didDetectError:(id)a4;
- (void)vcSessionParticipant:(id)a3 didRequestVideoRedundancy:(BOOL)a4;
- (void)vcSessionParticipant:(id)a3 didStart:(BOOL)a4 error:(id)a5;
- (void)vcSessionParticipant:(id)a3 didStopWithError:(id)a4;
- (void)vcSessionParticipant:(id)a3 didSwitchFromStreamID:(unsigned __int16)a4 toStreamID:(unsigned __int16)a5;
- (void)vcSessionParticipant:(id)a3 mediaMixingDidChangeForMediaType:(unsigned int)a4 mixingMediaType:(unsigned int)a5;
- (void)vcSessionParticipant:(id)a3 mediaStateDidChange:(unsigned int)a4 forMediaType:(unsigned int)a5 didSucceed:(BOOL)a6 error:(id)a7;
- (void)vcSessionParticipant:(id)a3 oneToOneModeDidChange:(BOOL)a4;
- (void)vcSessionParticipant:(id)a3 reactionDidStart:(id)a4;
- (void)vcSessionParticipant:(id)a3 remoteAudioEnabledDidChange:(BOOL)a4;
- (void)vcSessionParticipant:(id)a3 remoteAudioPausedDidChange:(BOOL)a4;
- (void)vcSessionParticipant:(id)a3 remoteMediaStateDidChange:(unsigned int)a4 forMediaType:(unsigned int)a5;
- (void)vcSessionParticipant:(id)a3 remoteScreenEnabledDidChange:(BOOL)a4;
- (void)vcSessionParticipant:(id)a3 remoteVideoEnabledDidChange:(BOOL)a4;
- (void)vcSessionParticipant:(id)a3 remoteVideoPausedDidChange:(BOOL)a4;
- (void)vcSessionParticipant:(id)a3 requestKeyFrameGenerationWithStreamID:(unsigned __int16)a4 streamGroupID:(unsigned int)a5 firType:(int)a6;
- (void)vcSessionParticipant:(id)a3 screenEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)vcSessionParticipant:(id)a3 videoEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)vcSessionParticipant:(id)a3 videoPaused:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)vcSessionParticipantDidChangeReceivingStreams:(id)a3;
- (void)vcSessionParticipantDidChangeSendingStreams:(id)a3;
- (void)vcSessionParticipantDidMediaDecryptionTimeOut:(id)a3;
- (void)vcSessionParticipantDidMediaDecryptionTimeOutForMKMRecovery:(id)a3;
- (void)vcSessionParticipantDidMediaReceiveFlushRequestWithPayloads:(id)a3;
- (void)vcSessionParticipantDidRemoteMediaStallTimeout:(id)a3 duration:(double)a4;
- (void)vcSessionParticipantDidStopReacting:(id)a3;
- (void)vcSessionParticipantFetchStreamGroupState:(id)a3;
@end

@implementation VCSession

- (VCSession)initWithIDSDestination:(id)a3 configurationDict:(id)a4 negotiationData:(id)a5 delegate:(id)a6 processId:(int)a7 isGKVoiceChat:(BOOL)a8
{
  uint64_t v8 = a8;
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    __str[0] = 0;
    v13 = a4 ? (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String") : "<nil>";
    asprintf(__str, "%s", v13);
    if (__str[0])
    {
      id v76 = a4;
      unsigned int v78 = v8;
      __lasts = 0;
      v14 = strtok_r(__str[0], "\n", &__lasts);
      v15 = (os_log_t *)MEMORY[0x1E4F47A50];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v16 = VRTraceErrorLogLevelToCSTR();
          v17 = *v15;
          if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            *(void *)&buf[4] = v16;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "-[VCSession initWithIDSDestination:configurationDict:negotiationData:delegate:processI"
                                  "d:isGKVoiceChat:]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 185;
            *(_WORD *)&buf[28] = 2080;
            *(void *)&buf[30] = "";
            *(_WORD *)&buf[38] = 2080;
            *(void *)&buf[40] = v14;
            _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        v14 = strtok_r(0, "\n", &__lasts);
      }
      while (v14);
      free(__str[0]);
      uint64_t v8 = v78;
      a4 = v76;
    }
  }
  v95.receiver = self;
  v95.super_class = (Class)VCSession;
  v18 = [(VCObject *)&v95 init];
  v19 = v18;
  if (v18)
  {
    if (a3)
    {
      v18->_isGKVoiceChat = v8;
      +[VCServerBag pullStoreBagKeys];
      objc_storeWeak((id *)&v19->_delegate, a6);
      CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
      v19->_sessionQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCSession.sessionQueue", 0, CustomRootQueue);
      v19->_notificationQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCSession.notificationQueue", 0, CustomRootQueue);
      v19->_state = 0;
      v21 = dispatch_semaphore_create(0);
      v19->_stopCompletedSemaphore = (OS_dispatch_semaphore *)v21;
      dispatch_semaphore_signal(v21);
      v19->_uuid = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
      v19->_idsDestination = (NSString *)[a3 copy];
      v19->_switchFromGFTToOneToOneEnabled = _os_feature_enabled_impl();
      v22 = [[VCSessionConfiguration alloc] initWithClientDictionary:a4];
      v19->_configuration = v22;
      [(VCSessionConfiguration *)v22 setIsGKVoiceChat:v8];
      v19->_siriSpatialAudioSourceID = VCUniqueIDGenerator_GenerateID();
      +[VCVTPWrapper startVTP];
      reportingGetDefaults();
      __int16 v94 = -21846;
      LOBYTE(v94) = [(VCSessionConfiguration *)v19->_configuration isOneToOneAuthenticationTagEnabled];
      HIBYTE(v94) = [(VCSessionConfiguration *)v19->_configuration isGftTLEEnabled];
      v19->_securityKeyManager = [[VCSecurityKeyManager alloc] initWithDelegate:v19 options:&v94];
      v19->_mediaTypeToSpatialMetadataEntryMap = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      v19->_isEnhancedJBAdaptationsEnabled = +[VCSession isEnhancedJBAdaptationsEnabled];
      v19->_isServerPacketRetransmissionForVideoEnabled = +[VCSession isServerPacketRetransmissionEnabledForVideo];
      v19->_isUplinkRetransmissionForVideoEnabled = +[VCSession isUplinkRetransmissionEnabledForVideo];
      v19->_shouldCreateSecondAggregator = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-server-should-use-second-aggregator", @"createSecondAggregatorForU1", MEMORY[0x1E4F1CC38], 0), "BOOLValue");
      v19->_abSwitches = [[VCSessionSwitches alloc] initWithConversationID:[(VCSessionConfiguration *)v19->_configuration conversationID]];
      v23 = objc_alloc_init(VCSessionParticipantConfig);
      [(VCSessionParticipantConfig *)v23 setIdsDestination:a3];
      [(VCSessionParticipantConfig *)v23 setParticipantData:a5];
      [(VCSessionParticipantConfig *)v23 setProcessId:a7];
      [(VCSessionParticipantConfig *)v23 setSessionUUID:v19->_uuid];
      [(VCSessionParticipantConfig *)v23 setIsGKVoiceChat:v19->_isGKVoiceChat];
      [(VCSessionParticipantConfig *)v23 setIsLowLatencyAudio:+[VCHardwareSettings deviceClass] == 8];
      [(VCSessionParticipantConfig *)v23 setSessionMode:[(VCSessionConfiguration *)v19->_configuration sessionMode]];
      [(VCSessionParticipantConfig *)v23 setIsOneToOneModeEnabled:[(VCSessionConfiguration *)v19->_configuration isOneToOneModeEnabled]];
      v19->_BOOL oneToOneModeEnabled = [(VCSessionConfiguration *)v19->_configuration isOneToOneModeEnabled];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v24 = VRTraceErrorLogLevelToCSTR();
        v25 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          BOOL oneToOneModeEnabled = v19->_oneToOneModeEnabled;
          uint64_t v77 = [(VCSessionConfiguration *)v19->_configuration sessionMode];
          id v83 = a3;
          uint64_t v26 = [(VCSessionConfiguration *)v19->_configuration serviceName];
          BOOL v27 = [(VCSessionConfiguration *)v19->_configuration isOneToOneAuthenticationTagEnabled];
          BOOL v28 = [(VCSessionConfiguration *)v19->_configuration isGftTLEEnabled];
          *(_DWORD *)buf = 136316930;
          *(void *)&buf[4] = v24;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "-[VCSession initWithIDSDestination:configurationDict:negotiationData:delegate:processId:isGKVoiceChat:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 243;
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = oneToOneModeEnabled;
          *(_WORD *)&buf[34] = 2048;
          *(void *)&buf[36] = v77;
          *(_WORD *)&buf[44] = 2112;
          *(void *)&buf[46] = v26;
          a3 = v83;
          *(_WORD *)&buf[54] = 1024;
          *(_DWORD *)&buf[56] = v27;
          *(_WORD *)&buf[60] = 1024;
          *(_DWORD *)&buf[62] = v28;
          _os_log_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Using the following path - oneToOneModeEnabled=%d sessionMode=%ld serviceName=%@, oneToOneAuthenticationTagEnabled=%d, gftTLEEnabled=%d", buf, 0x42u);
        }
      }
      [(VCSessionParticipantConfig *)v23 setSpatialMetadata:v19->_spatialMetadata];
      [(VCSessionParticipantConfig *)v23 setSpatialMetadataEntryMap:v19->_mediaTypeToSpatialMetadataEntryMap];
      [(VCSessionParticipantConfig *)v23 setSecurityKeyManager:v19->_securityKeyManager];
      [(VCSessionParticipantConfig *)v23 setIsUplinkRetransmissionEnabled:v19->_isUplinkRetransmissionForVideoEnabled];
      [(VCSessionParticipantConfig *)v23 setOneToOneAuthenticationTagEnabled:[(VCSessionConfiguration *)v19->_configuration isOneToOneAuthenticationTagEnabled]];
      [(VCSessionParticipantConfig *)v23 setIsHigherAudioREDCutoverU1Enabled:[(VCSessionSwitches *)v19->_abSwitches isFeatureEnabled:32]];
      v29 = [[VCSessionParticipantLocal alloc] initWithConfig:v23 delegate:v19];
      v19->_localParticipant = v29;
      if (!v29)
      {
        if ((VCSession *)objc_opt_class() == v19)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCSession initWithIDSDestination:configurationDict:negotiationData:delegate:processId:isGKVoiceChat:]();
            }
          }
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            v33 = (__CFString *)[(VCSession *)v19 performSelector:sel_logPrefix];
          }
          else {
            v33 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v53 = VRTraceErrorLogLevelToCSTR();
            v54 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              *(void *)&buf[4] = v53;
              *(_WORD *)&buf[12] = 2080;
              *(void *)&buf[14] = "-[VCSession initWithIDSDestination:configurationDict:negotiationData:delegate:proces"
                                    "sId:isGKVoiceChat:]";
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = 257;
              *(_WORD *)&buf[28] = 2112;
              *(void *)&buf[30] = v33;
              *(_WORD *)&buf[38] = 2048;
              *(void *)&buf[40] = v19;
              _os_log_error_impl(&dword_1E1EA4000, v54, OS_LOG_TYPE_ERROR, "VCSession [%s] %s:%d %@(%p) Unable to initialize the session's local participant!", buf, 0x30u);
            }
          }
        }

        goto LABEL_69;
      }

      v19->_conversationID = (NSString *)[(NSString *)[(NSUUID *)[(VCSessionConfiguration *)v19->_configuration conversationID] UUIDString] copy];
      v19->_conversationTimeBase = (NSDate *)[(NSDate *)[(VCSessionConfiguration *)v19->_configuration conversationTimeBase] copy];
      v19->_conversationTimeBaseTruncated = (NSDate *)[(NSDate *)[(VCSessionConfiguration *)v19->_configuration conversationTimeBaseTruncated] copy];
      [(VCSession *)v19 setParentNWActivity:[(VCSessionConfiguration *)v19->_configuration parentNWActivity]];
      v19->_nwActivity = (OS_nw_activity *)nw_activity_create();
      if (v19->_parentNWActivity) {
        nw_activity_set_parent_activity();
      }
      nw_activity_activate();
      v19->_uint64_t transportSessionID = [(VCSessionParticipant *)v19->_localParticipant participantVideoToken];
      if ([+[VCDefaults sharedInstance] forceDisableReporting])
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v30 = VRTraceErrorLogLevelToCSTR();
          v31 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            *(void *)&buf[4] = v30;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "-[VCSession initWithIDSDestination:configurationDict:negotiationData:delegate:processI"
                                  "d:isGKVoiceChat:]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 287;
            _os_log_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Reporting agent is disabled through default.", buf, 0x1Cu);
          }
        }
      }
      else
      {
        uint64_t v101 = 0;
        long long v99 = 0u;
        long long v100 = 0u;
        long long v98 = 0u;
        memset(buf, 0, sizeof(buf));
        [(VCSession *)v19 setReportingConfig:buf];
        long long v91 = v99;
        long long v92 = v100;
        uint64_t v93 = v101;
        long long v87 = *(_OWORD *)&buf[32];
        long long v88 = *(_OWORD *)&buf[48];
        long long v89 = *(_OWORD *)&buf[64];
        long long v90 = v98;
        *(_OWORD *)__str = *(_OWORD *)buf;
        long long v86 = *(_OWORD *)&buf[16];
        v19->super._id reportingAgent = (id)reportingCreateAgent();
        v19->_reportingModuleID = VCReporting_GetDynamicReportingModuleID();
        [(VCSession *)v19 registerQoSReporting];
        if ([(VCSessionConfiguration *)v19->_configuration isOneToOneModeEnabled]) {
          [(VCSession *)v19 setupOneToOneAdaptiveLearning];
        }
        [(VCSession *)v19 dumpVCSessionMetadataToDataStore];
      }
      [(VCSecurityKeyManager *)v19->_securityKeyManager setReportingAgent:v19->super._reportingAgent];
      v19->_captionsCoordinator = [[VCAudioCaptionsCoordinator alloc] initWithOneToOneEnabled:v19->_oneToOneModeEnabled isLocal:0 taskIdentifier:@"facetimecaptions" reportingAgent:v19->super._reportingAgent];
      v19->_mediaRecorder = [[VCMediaRecorder alloc] initWithStreamToken:v19->_transportSessionID delegate:v19 reportingAgent:[(VCObject *)v19 reportingAgent]];
      [+[VCMediaRecorderManager sharedInstance] registerMediaRecorder:v19->_mediaRecorder withStreamToken:v19->_transportSessionID];
      [(VCSessionParticipant *)v19->_localParticipant setMediaRecorder:v19->_mediaRecorder];
      [(VCSession *)v19 setupSpatialAudio];
      [(VCSession *)v19 createSessionMessaging];
      [(VCSessionParticipant *)v19->_localParticipant setReportingAgent:v19->super._reportingAgent];
      v19->_bitrateArbiter = objc_alloc_init(VCSessionBitrateArbiter);
      [(VCSession *)v19 setupUplinkBitrateCaps];
      [(VCSessionParticipant *)v19->_localParticipant setStreamDelegate:v19];
      v19->_remoteParticipantsMapByUUID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v19->_remoteParticipantsMapByServerID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v19->_startingParticipants = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v19->_stoppingParticipants = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v19->_initializingParticipants = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v19->_useReducedSizeRTCP = 1;
      v19->_sessionStartTime = NAN;
      if (!v19->_oneToOneModeEnabled) {
        v19->_downlinkBandwidthAllocator = [[VCSessionDownlinkBandwidthAllocator alloc] initWithReportingAgent:v19->super._reportingAgent];
      }
      v19->_presentationInfo = objc_alloc_init(VCSessionPresentationInfo);
      if (![+[VCDefaults sharedInstance] forceDisableMediaQueue])[(VCSession *)v19 createMediaQueue]; {
      id v84 = a3;
      }
      [(VCSession *)v19 setupTransportSessionWithDestination:a3];
      [(VCSession *)v19 setupRateControllersMultiway];
      [(VCSession *)v19 setupOneToOne];
      [(VCSession *)v19 reportLocalRateControlExperimentConfiguration];
      BOOL v34 = [(VCSessionConfiguration *)v19->_configuration isOneToOneModeEnabled];
      v35 = &OBJC_IVAR___VCSession__oneToOneSettings;
      if (!v34) {
        v35 = &OBJC_IVAR___VCSession__downlinkRateController;
      }
      -[VCConnectionManager setStatisticsCollector:](-[VCTransportSession connectionManager](v19->_transportSession, "connectionManager"), "setStatisticsCollector:", [*(id *)((char *)&v19->super.super.isa + *v35) statisticsCollector]);
      [(VCSession *)v19 setSessionInfoSynchronizerCallbacks];
      v36 = [VCSessionStatsController alloc];
      uint64_t v37 = [(VCTransportSession *)v19->_transportSession connectionManager];
      uint64_t v38 = [(AVCRateController *)v19->_uplinkRateController statisticsCollector];
      uint64_t v39 = [(AVCRateController *)v19->_downlinkRateController statisticsCollector];
      id reportingAgent = v19->super._reportingAgent;
      uint64_t transportSessionID = v19->_transportSessionID;
      LOWORD(v75) = [(VCSessionParticipantLocal *)v19->_localParticipant connectionStatsStreamID];
      v19->_sessionStatsController = [(VCSessionStatsController *)v36 initWithDelegate:v19 connectionManager:v37 uplinkStatsCollector:v38 downlinkStatsCollector:v39 reportingAgent:reportingAgent transportSessionID:transportSessionID streamID:v75 mediaQueue:v19->_mediaQueue];
      [(VCSessionParticipantLocal *)v19->_localParticipant setCellularUniqueTag:[(VCTransportSession *)v19->_transportSession basebandNotificationRegistrationToken]];
      v19->_switchManager = objc_alloc_init(VCSwitchManager);
      if (!v19->_oneToOneModeEnabled)
      {
        [(VCSession *)v19 reportingSetUserInfo];
        [(VCSession *)v19 setupMultiwayABTesting];
      }
      reportingRegisterSystemStats();
      reportingSymptomSetCallback();
      uint64_t v42 = +[VCSession deviceRoleForSessionMode:[(VCSessionConfiguration *)v19->_configuration sessionMode]];
      if (v19->_oneToOneModeEnabled
        || [(VCSessionParticipant *)v19->_localParticipant configureWithDeviceRole:v42 negotiatedVideoEnabled:0 negotiatedScreenEnabled:0 operatingMode:6])
      {
        v19->_currentConnectionType = -1;
        v19->_feedbackController = [[VCNetworkFeedbackController alloc] initWithDelegate:v19 connectionManager:[(VCTransportSession *)v19->_transportSession connectionManager]];
        [(VCNetworkFeedbackController *)v19->_feedbackController setDownlinkTargetCellBitrateCap:[(VCSessionBitrateArbiter *)v19->_bitrateArbiter maxBitrateExpensiveDownlink]];
        v19->_forceDisableMediaPriority = [+[VCDefaults sharedInstance] forceDisableMediaPriority];
        if ((VCSession *)objc_opt_class() == v19)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
            goto LABEL_96;
          }
          __str[0] = 0;
          v44 = [(VCSession *)v19 description]
              ? [[(NSString *)[(VCSession *)v19 description] description] UTF8String]: "<nil>";
          asprintf(__str, "Session init %s", v44);
          if (!__str[0]) {
            goto LABEL_96;
          }
          unsigned int v81 = v42;
          __lasts = 0;
          v68 = strtok_r(__str[0], "\n", &__lasts);
          v69 = (os_log_t *)MEMORY[0x1E4F47A50];
          do
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
            {
              uint64_t v70 = VRTraceErrorLogLevelToCSTR();
              v71 = *v69;
              if (os_log_type_enabled(*v69, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136316162;
                *(void *)&buf[4] = v70;
                *(_WORD *)&buf[12] = 2080;
                *(void *)&buf[14] = "-[VCSession initWithIDSDestination:configurationDict:negotiationData:delegate:proc"
                                      "essId:isGKVoiceChat:]";
                *(_WORD *)&buf[22] = 1024;
                *(_DWORD *)&buf[24] = 366;
                *(_WORD *)&buf[28] = 2080;
                *(void *)&buf[30] = "";
                *(_WORD *)&buf[38] = 2080;
                *(void *)&buf[40] = v68;
                _os_log_impl(&dword_1E1EA4000, v71, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d %s %s", buf, 0x30u);
              }
            }
            v68 = strtok_r(0, "\n", &__lasts);
          }
          while (v68);
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            v43 = (__CFString *)[(VCSession *)v19 performSelector:sel_logPrefix];
          }
          else {
            v43 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
            goto LABEL_96;
          }
          __str[0] = 0;
          v51 = (const char *)[(__CFString *)v43 UTF8String];
          v52 = [(VCSession *)v19 description]
              ? [[(NSString *)[(VCSession *)v19 description] description] UTF8String]: "<nil>";
          asprintf(__str, "%s(%p) Session init %s", v51, v19, v52);
          if (!__str[0]) {
            goto LABEL_96;
          }
          unsigned int v81 = v42;
          __lasts = 0;
          v56 = strtok_r(__str[0], "\n", &__lasts);
          v57 = (os_log_t *)MEMORY[0x1E4F47A50];
          do
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
            {
              uint64_t v58 = VRTraceErrorLogLevelToCSTR();
              v59 = *v57;
              if (os_log_type_enabled(*v57, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136316162;
                *(void *)&buf[4] = v58;
                *(_WORD *)&buf[12] = 2080;
                *(void *)&buf[14] = "-[VCSession initWithIDSDestination:configurationDict:negotiationData:delegate:proc"
                                      "essId:isGKVoiceChat:]";
                *(_WORD *)&buf[22] = 1024;
                *(_DWORD *)&buf[24] = 366;
                *(_WORD *)&buf[28] = 2080;
                *(void *)&buf[30] = "";
                *(_WORD *)&buf[38] = 2080;
                *(void *)&buf[40] = v56;
                _os_log_impl(&dword_1E1EA4000, v59, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d %s %s", buf, 0x30u);
              }
            }
            v56 = strtok_r(0, "\n", &__lasts);
          }
          while (v56);
        }
        free(__str[0]);
        uint64_t v42 = v81;
LABEL_96:
        [(VCConnectionManager *)[(VCTransportSession *)v19->_transportSession connectionManager] setCellPrimaryInterfaceChangeEnabled:1];
        [(VCConnectionManager *)[(VCTransportSession *)v19->_transportSession connectionManager] setShouldLimitMultiwayBandwidthWhenConstrained:[(VCSessionSwitches *)v19->_abSwitches isFeatureEnabled:2]];
        BOOL v72 = v19->_oneToOneModeEnabled;
        v73 = [(VCTransportSession *)v19->_transportSession connectionManager];
        if (v72)
        {
          [(VCConnectionManager *)v73 setDefaultLinkProbingCapabilityVersionForDeviceRole:v42];
        }
        else
        {
          [(VCConnectionManager *)v73 setiRATDuplicationEnabled:1];
          [(VCConnectionHealthMonitor *)[(VCConnectionManager *)[(VCTransportSession *)v19->_transportSession connectionManager] connectionHealthMonitor] setUsingServerBasedLinks:1];
        }
        v19->_forceFixedEncryptionLabel = +[VCDefaults BOOLeanValueForKey:@"controlChannelV2ForceFixedEncryptionLabel" defaultValue:0];
        v19->_isSSRCCollisionDetectionEnabled = ![+[VCDefaults sharedInstance] forceDisableSSRCCollisionDetection];
        [(VCSession *)v19 reportClientPersistentSettings];
        [(VCSession *)v19 reportingSessionParticipantEvent:163 withParticipant:0];
        kdebug_trace();
        objc_msgSend(+[VCEffectsManager sharedManager](VCEffectsManager, "sharedManager"), "setReportingAgent:", v19->super._reportingAgent);
        [(VCSession *)v19 registerForThermalFeatureNotifications];
        v19->_isDNUCollectionEnabled = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F83948], "sharedInstance"), "optInApple");
        return v19;
      }
      if ((VCSession *)objc_opt_class() == v19)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_69;
        }
        uint64_t v60 = VRTraceErrorLogLevelToCSTR();
        v61 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          goto LABEL_69;
        }
        uint64_t v62 = [v84 UTF8String];
        localParticipant = v19->_localParticipant;
        *(_DWORD *)buf = 136316162;
        *(void *)&buf[4] = v60;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCSession initWithIDSDestination:configurationDict:negotiationData:delegate:processId:isGKVoiceChat:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 356;
        *(_WORD *)&buf[28] = 2080;
        *(void *)&buf[30] = v62;
        *(_WORD *)&buf[38] = 2048;
        *(void *)&buf[40] = localParticipant;
        v48 = "VCSession [%s] %s:%d Unable to configure local participant streams for the session. Destination=%s localParticipant=%p";
        v49 = v61;
        uint32_t v50 = 48;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          v55 = (__CFString *)[(VCSession *)v19 performSelector:sel_logPrefix];
        }
        else {
          v55 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_69;
        }
        uint64_t v64 = VRTraceErrorLogLevelToCSTR();
        v65 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          goto LABEL_69;
        }
        uint64_t v66 = [v84 UTF8String];
        v67 = v19->_localParticipant;
        *(_DWORD *)buf = 136316674;
        *(void *)&buf[4] = v64;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCSession initWithIDSDestination:configurationDict:negotiationData:delegate:processId:isGKVoiceChat:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 356;
        *(_WORD *)&buf[28] = 2112;
        *(void *)&buf[30] = v55;
        *(_WORD *)&buf[38] = 2048;
        *(void *)&buf[40] = v19;
        *(_WORD *)&buf[48] = 2080;
        *(void *)&buf[50] = v66;
        *(_WORD *)&buf[58] = 2048;
        *(void *)&buf[60] = v67;
        v48 = "VCSession [%s] %s:%d %@(%p) Unable to configure local participant streams for the session. Destination=%s "
              "localParticipant=%p";
        v49 = v65;
        uint32_t v50 = 68;
      }
    }
    else
    {
      if ((VCSession *)objc_opt_class() == v18)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSession initWithIDSDestination:configurationDict:negotiationData:delegate:processId:isGKVoiceChat:]();
          }
        }
        goto LABEL_69;
      }
      if (objc_opt_respondsToSelector()) {
        v32 = (__CFString *)[(VCSession *)v19 performSelector:sel_logPrefix];
      }
      else {
        v32 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3
        || (uint64_t v45 = VRTraceErrorLogLevelToCSTR(),
            v46 = *MEMORY[0x1E4F47A50],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
      {
LABEL_69:

        return 0;
      }
      uint64_t v47 = [0 UTF8String];
      *(_DWORD *)buf = 136316418;
      *(void *)&buf[4] = v45;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[VCSession initWithIDSDestination:configurationDict:negotiationData:delegate:processId:isGKVoiceChat:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 189;
      *(_WORD *)&buf[28] = 2112;
      *(void *)&buf[30] = v32;
      *(_WORD *)&buf[38] = 2048;
      *(void *)&buf[40] = v19;
      *(_WORD *)&buf[48] = 2080;
      *(void *)&buf[50] = v47;
      v48 = "VCSession [%s] %s:%d %@(%p) Unable to initialize the session. Destination=%s";
      v49 = v46;
      uint32_t v50 = 58;
    }
    _os_log_error_impl(&dword_1E1EA4000, v49, OS_LOG_TYPE_ERROR, v48, buf, v50);
    goto LABEL_69;
  }
  return v19;
}

- (void)cleanUpMediaRecorder
{
  mediaRecorder = self->_mediaRecorder;
  if (mediaRecorder)
  {
    [(VCMediaRecorder *)mediaRecorder invalidate];

    self->_mediaRecorder = 0;
  }
}

- (void)dealloc
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      __str = 0;
      v4 = [(VCSession *)self description]
         ? [[(NSString *)[(VCSession *)self description] description] UTF8String]: "<nil>";
      asprintf(&__str, "Session dealloc %s", v4);
      if (__str)
      {
        __lasts = 0;
        v11 = strtok_r(__str, "\n", &__lasts);
        v12 = (os_log_t *)MEMORY[0x1E4F47A50];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            uint64_t v13 = VRTraceErrorLogLevelToCSTR();
            v14 = *v12;
            if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              uint64_t v24 = v13;
              __int16 v25 = 2080;
              uint64_t v26 = "-[VCSession dealloc]";
              __int16 v27 = 1024;
              int v28 = 401;
              __int16 v29 = 2080;
              uint64_t v30 = "";
              __int16 v31 = 2080;
              v32 = v11;
              _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          v11 = strtok_r(0, "\n", &__lasts);
        }
        while (v11);
        goto LABEL_26;
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v3 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      __str = 0;
      v5 = (const char *)[(__CFString *)v3 UTF8String];
      v6 = [(VCSession *)self description]
         ? [[(NSString *)[(VCSession *)self description] description] UTF8String]: "<nil>";
      asprintf(&__str, "%s(%p) Session dealloc %s", v5, self, v6);
      if (__str)
      {
        __lasts = 0;
        v7 = strtok_r(__str, "\n", &__lasts);
        uint64_t v8 = (os_log_t *)MEMORY[0x1E4F47A50];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            uint64_t v9 = VRTraceErrorLogLevelToCSTR();
            v10 = *v8;
            if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              uint64_t v24 = v9;
              __int16 v25 = 2080;
              uint64_t v26 = "-[VCSession dealloc]";
              __int16 v27 = 1024;
              int v28 = 401;
              __int16 v29 = 2080;
              uint64_t v30 = "";
              __int16 v31 = 2080;
              v32 = v7;
              _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          v7 = strtok_r(0, "\n", &__lasts);
        }
        while (v7);
LABEL_26:
        free(__str);
      }
    }
  }
  [(VCSession *)self unregisterQoSReporting];
  [(VCSession *)self cleanUpMediaRecorder];
  [(VCSession *)self cleanupOneToOne];
  [(VCSession *)self cleanupSpatialAudio];

  mediaTypeToSpatialMetadataEntryMap = self->_mediaTypeToSpatialMetadataEntryMap;
  if (mediaTypeToSpatialMetadataEntryMap) {
    CFRelease(mediaTypeToSpatialMetadataEntryMap);
  }

  self->_remoteParticipantsMapByUUID = 0;
  [(VCSessionParticipant *)self->_localParticipant setStreamDelegate:0];

  self->_localParticipant = 0;
  [(VCSession *)self destroySessionMessaging];

  mediaQueue = self->_mediaQueue;
  if (mediaQueue) {
    CFRelease(mediaQueue);
  }
  sessionQueue = self->_sessionQueue;
  if (sessionQueue)
  {
    dispatch_release(sessionQueue);
    self->_sessionQueue = 0;
  }
  notificationQueue = self->_notificationQueue;
  if (notificationQueue)
  {
    dispatch_release(notificationQueue);
    self->_notificationQueue = 0;
  }
  stopCompletedSemaphore = self->_stopCompletedSemaphore;
  if (stopCompletedSemaphore)
  {
    dispatch_release(stopCompletedSemaphore);
    self->_stopCompletedSemaphore = 0;
  }
  objc_storeWeak((id *)&self->_delegate, 0);

  [(VCSession *)self cleanupNwActivity];
  [(VCSession *)self cleanupVCRC];

  +[VCVTPWrapper stopVTP];
  [(VCAudioCaptionsCoordinator *)self->_captionsCoordinator invalidate];

  reportingReleaseObject();
  objc_msgSend(+[VCEffectsManager sharedManager](VCEffectsManager, "sharedManager"), "setReportingAgent:", 0);
  [(VCSession *)self deregisterForThermalFeatureNotifications];

  v20.receiver = self;
  v20.super_class = (Class)VCSession;
  [(VCObject *)&v20 dealloc];
}

- (void)setReportingConfig:(id *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    a3->var0 = self->_transportSessionID;
    a3->var1 = (__CFString *)self->_conversationID;
    a3->var2 = (__CFDate *)self->_conversationTimeBase;
    a3->var5 = [(VCSessionConfiguration *)self->_configuration reportingHierarchyToken];
    v5 = [(VCSession *)self nwActivity];
    v6 = (__CFString *)*MEMORY[0x1E4F47B20];
    a3->var6 = v5;
    a3->var7 = v6;
    a3->var8 = [(VCSession *)self configurationSpecificReportingServiceName];
    a3->var10 = (__CFString *)[(VCCallInfoBlob *)[(VCSessionParticipant *)self->_localParticipant callInfoBlob] deviceType];
    a3->var9 = (__CFString *)[(VCCallInfoBlob *)[(VCSessionParticipant *)self->_localParticipant callInfoBlob] osVersion];
    a3->var4 = [(VCSessionConfiguration *)self->_configuration isOneToOneModeEnabled];
    a3->var11 = [(VCSession *)self getClientSpecificUserInfo];
    int v7 = 5;
    if (!+[VCDefaults BOOLeanValueForKey:@"useAggregatorMultiwayforU1" defaultValue:1])
    {
      if ([(VCSessionConfiguration *)self->_configuration isOneToOneModeEnabled]) {
        int v7 = 0;
      }
      else {
        int v7 = 5;
      }
    }
    self->_reportingClientType = v7;
    a3->var3 = v7;
    a3->var12 = &__block_literal_global_51;
    a3->var14 = self->_shouldCreateSecondAggregator;
    [(VCSession *)self readAndSetABCSymptomsReportingThresholdsFromStorebags:a3];
    [(VCSession *)self enableDataCollectionInReportingConfig:a3];
  }
  else if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSession setReportingConfig:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v8 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v8 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v11 = 136316162;
        uint64_t v12 = v9;
        __int16 v13 = 2080;
        v14 = "-[VCSession setReportingConfig:]";
        __int16 v15 = 1024;
        int v16 = 466;
        __int16 v17 = 2112;
        v18 = v8;
        __int16 v19 = 2048;
        objc_super v20 = self;
        _os_log_error_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_ERROR, "VCSession [%s] %s:%d %@(%p) reportingConfig must not be nil", (uint8_t *)&v11, 0x30u);
      }
    }
  }
}

void __32__VCSession_setReportingConfig___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _VCSession_ReportingConfigurationCallback(a2, a3 != 0);
}

- (void)dumpVCSessionMetadataToDataStore
{
}

- (void)enableDataCollectionInReportingConfig:(id *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (self->_oneToOneModeEnabled)
    {
      if (+[VCHardwareSettings isDataCollectionSupported])
      {
        BOOL v5 = [(VCSessionSwitches *)self->_abSwitches isFeatureEnabled:16];
        a3->var16 = v5;
        if (v5) {
          v6 = @"Data collection enabled, waiting for RTCReport confirmation";
        }
        else {
          v6 = @"Data collection is disabled, VCSession not sampled by Trial";
        }
      }
      else
      {
        v6 = @"Data collection is not available on this platform";
      }
    }
    else
    {
      v6 = @"Data collection is not available outside U+1";
    }
  }
  else
  {
    v6 = @"Invalid reportingConfig, data collection disabled";
  }
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136315906;
        uint64_t v16 = v8;
        __int16 v17 = 2080;
        v18 = "-[VCSession enableDataCollectionInReportingConfig:]";
        __int16 v19 = 1024;
        int v20 = 523;
        __int16 v21 = 2080;
        uint64_t v22 = [(__CFString *)v6 UTF8String];
        v10 = "VCSession [%s] %s:%d %s";
        int v11 = v9;
        uint32_t v12 = 38;
LABEL_17:
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v15, v12);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      int v7 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      int v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136316418;
        uint64_t v16 = v13;
        __int16 v17 = 2080;
        v18 = "-[VCSession enableDataCollectionInReportingConfig:]";
        __int16 v19 = 1024;
        int v20 = 523;
        __int16 v21 = 2112;
        uint64_t v22 = (uint64_t)v7;
        __int16 v23 = 2048;
        uint64_t v24 = self;
        __int16 v25 = 2080;
        uint64_t v26 = [(__CFString *)v6 UTF8String];
        v10 = "VCSession [%s] %s:%d %@(%p) %s";
        int v11 = v14;
        uint32_t v12 = 58;
        goto LABEL_17;
      }
    }
  }
}

- (void)stopTimeoutTimer
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_stopCompletedSemaphore);
  v3.receiver = self;
  v3.super_class = (Class)VCSession;
  [(VCObject *)&v3 stopTimeoutTimer];
}

- (void)startDeallocTimer
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSession [%s] %s:%d Dealloc timer starting without stop completing", v2, v3, v4, v5, v6);
}

- (NSDictionary)capabilities
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [+[VCHardwareSettingsEmbedded sharedInstance] maxActiveVideoDecoders];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v9 = v3;
      __int16 v10 = 2080;
      int v11 = "-[VCSession capabilities]";
      __int16 v12 = 1024;
      int v13 = 552;
      __int16 v14 = 1024;
      int v15 = v2;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d maxActiveVideoDecodes=%d", buf, 0x22u);
    }
  }
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", v2, @"avcKeySupportedMaxVideoDecodes");
  return (NSDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v7 forKeys:&v6 count:1];
}

- (NSDictionary)transportMetadata
{
  v6[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] getSentBytes:&v4 receivedBytes:&v3];
  v5[0] = @"avcKeySessionSentBytes";
  v6[0] = [NSNumber numberWithLongLong:v4];
  v5[1] = @"avcKeySessionReceivedBytes";
  v6[1] = [NSNumber numberWithLongLong:v3];
  return (NSDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
}

- (void)setTransportConnectionSelectionVersionWithLocalFrameWorkVersion:(id)a3 remoteFrameworkVersion:(id)a4
{
  [(VCTransportSession *)self->_transportSession setConnectionSelectionVersionWithLocalFrameworkVersion:a3 remoteFrameworkVersion:a4];
  if (self->_oneToOneModeEnabled)
  {
    uint64_t v5 = [(VCTransportSession *)self->_transportSession connectionManager];
    [(VCConnectionManager *)v5 setOptIntoExistingSubscribedStreams:1];
  }
}

- (int)selectDataPath
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int result = +[VCDefaults integerValueForKey:@"datagramChannelIDSDataPath" defaultValue:_os_feature_enabled_impl()];
  int v3 = result;
  if (result >= 2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      int result = 0;
      if (!v6) {
        return result;
      }
      int v7 = 136316418;
      uint64_t v8 = v4;
      __int16 v9 = 2080;
      __int16 v10 = "-[VCSession selectDataPath]";
      __int16 v11 = 1024;
      int v12 = 581;
      __int16 v13 = 1024;
      int v14 = v3;
      __int16 v15 = 2112;
      uint64_t v16 = @"datagramChannelIDSDataPath";
      __int16 v17 = 1024;
      int v18 = 0;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Wrong value=%d read from user default [%@]. Resetting it to default value=%d", (uint8_t *)&v7, 0x32u);
    }
    return 0;
  }
  return result;
}

- (void)setupTransportSessionWithDestination:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(VCSession *)self selectDataPath];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    int v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = @"direct";
      *(_DWORD *)int v14 = 136315906;
      *(void *)&v14[4] = v6;
      *(_WORD *)&v14[12] = 2080;
      *(void *)&v14[14] = "-[VCSession setupTransportSessionWithDestination:]";
      if (!v5) {
        uint64_t v8 = @"shared";
      }
      *(_WORD *)&v14[22] = 1024;
      int v15 = 589;
      __int16 v16 = 2112;
      __int16 v17 = v8;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Session will use [%@] data path", v14, 0x26u);
    }
  }
  __int16 v9 = [[VCTransportSessionIDSMultiLink alloc] initWithCallID:self->_transportSessionID requireEncryptionInfo:1 reportingAgent:self->super._reportingAgent notificationQueue:self->_sessionQueue isMultiwaySession:1 dataPath:v5];
  reportingSetDataPath();
  [(VCTransportSession *)v9 setPerfTimings:objc_alloc_init(MEMORY[0x1E4F47A20])];
  [(VCTransportSessionIDS *)v9 setDestination:a3];
  self->_transportSession = &v9->super.super;
  [(VCConnectionManager *)[(VCTransportSession *)v9 connectionManager] setIsOneToOneModeEnabled:self->_oneToOneModeEnabled];
  [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] setGftTLEEnabled:[(VCSessionConfiguration *)self->_configuration isGftTLEEnabled]];
  if (self->_oneToOneModeEnabled)
  {
    __int16 v10 = @"2045";
    __int16 v11 = self;
    int v12 = @"2045";
  }
  else
  {
    __int16 v13 = [(VCCallInfoBlob *)[(VCSessionParticipant *)self->_localParticipant callInfoBlob] frameworkVersion];
    int v12 = [(VCCallInfoBlob *)[(VCSessionParticipant *)self->_localParticipant callInfoBlob] frameworkVersion];
    __int16 v11 = self;
    __int16 v10 = (__CFString *)v13;
  }
  -[VCSession setTransportConnectionSelectionVersionWithLocalFrameWorkVersion:remoteFrameworkVersion:](v11, "setTransportConnectionSelectionVersionWithLocalFrameWorkVersion:remoteFrameworkVersion:", v10, v12, *(_OWORD *)v14, *(void *)&v14[16]);
}

- (void)setState:(unsigned int)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (self->_state != a3)
  {
    uint64_t v3 = *(void *)&a3;
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_13;
      }
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      int v7 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      uint64_t v8 = [(VCSession *)self sessionStateToString:self->_state];
      int v15 = 136316162;
      uint64_t v16 = v6;
      __int16 v17 = 2080;
      uint64_t v18 = "-[VCSession setState:]";
      __int16 v19 = 1024;
      int v20 = 606;
      __int16 v21 = 2080;
      uint64_t v22 = v8;
      __int16 v23 = 2080;
      uint64_t v24 = [(VCSession *)self sessionStateToString:v3];
      __int16 v9 = "VCSession [%s] %s:%d Exiting state session %s. Entering state session %s.";
      __int16 v10 = v7;
      uint32_t v11 = 48;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v5 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_13;
      }
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      __int16 v13 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      int v14 = [(VCSession *)self sessionStateToString:self->_state];
      int v15 = 136316674;
      uint64_t v16 = v12;
      __int16 v17 = 2080;
      uint64_t v18 = "-[VCSession setState:]";
      __int16 v19 = 1024;
      int v20 = 606;
      __int16 v21 = 2112;
      uint64_t v22 = v5;
      __int16 v23 = 2048;
      uint64_t v24 = (char *)self;
      __int16 v25 = 2080;
      uint64_t v26 = v14;
      __int16 v27 = 2080;
      int v28 = [(VCSession *)self sessionStateToString:v3];
      __int16 v9 = "VCSession [%s] %s:%d %@(%p) Exiting state session %s. Entering state session %s.";
      __int16 v10 = v13;
      uint32_t v11 = 68;
    }
    _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, v11);
LABEL_13:
    self->_state = v3;
  }
}

- (char)sessionStateToString:(unsigned int)a3
{
  if (a3 - 1 > 3) {
    return "Stopped";
  }
  else {
    return off_1E6DB7BA0[a3 - 1];
  }
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"idsDestination[%@] state[%s] localParticipantID[%@] remoteParticipants[%@]", self->_idsDestination, -[VCSession sessionStateToString:](self, "sessionStateToString:", self->_state), -[VCSessionParticipant uuid](self->_localParticipant, "uuid"), -[VCSession remoteParticipants](self, "remoteParticipants")];
}

- (id)participantsToString
{
  return (id)[NSString stringWithFormat:@"stoppingParticipants[%@] startingParticipants[%@] initializingParticipants[%@]", self->_stoppingParticipants, self->_startingParticipants, self->_initializingParticipants];
}

- (VCSessionDelegate)delegate
{
  return (VCSessionDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)addParticipantConfigurations:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__VCSession_addParticipantConfigurations___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  block[5] = a3;
  dispatch_async(sessionQueue, block);
}

uint64_t __42__VCSession_addParticipantConfigurations___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedAddParticipantConfigurations:*(void *)(a1 + 40)];
}

- (void)removeParticipant:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__VCSession_removeParticipant___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  block[5] = a3;
  dispatch_async(sessionQueue, block);
}

uint64_t __31__VCSession_removeParticipant___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedRemoveParticipant:*(void *)(a1 + 40)];
}

- (VCSessionParticipantRemote)oneToOneRemoteParticipant
{
  uint64_t v2 = [(VCSession *)self remoteParticipants];

  return (VCSessionParticipantRemote *)[(NSArray *)v2 firstObject];
}

- (void)start
{
  v4[5] = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  sessionQueue = self->_sessionQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __18__VCSession_start__block_invoke;
  v4[3] = &unk_1E6DB3DC8;
  v4[4] = self;
  dispatch_async(sessionQueue, v4);
}

uint64_t __18__VCSession_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedStart];
}

- (void)stopWithError:(id)a3
{
  kdebug_trace();

  [(VCSession *)self stopWithError:a3 didRemoteCancel:0];
}

- (void)stopWithError:(id)a3 didRemoteCancel:(BOOL)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __43__VCSession_stopWithError_didRemoteCancel___block_invoke;
  v5[3] = &unk_1E6DB3E18;
  v5[4] = self;
  v5[5] = a3;
  BOOL v6 = a4;
  dispatch_async(sessionQueue, v5);
}

uint64_t __43__VCSession_stopWithError_didRemoteCancel___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedStopWithError:*(void *)(a1 + 40) didRemoteCancel:*(unsigned __int8 *)(a1 + 48)];
}

- (void)updateConfiguration:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__VCSession_updateConfiguration___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  block[5] = a3;
  dispatch_async(sessionQueue, block);
}

uint64_t __33__VCSession_updateConfiguration___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) dispatchedUpdateConfiguration:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 reportingSessionParticipantEvent:169 withParticipant:0];
}

- (id)participantForID:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  __int16 v10 = __Block_byref_object_copy__16;
  sessionQueue = self->_sessionQueue;
  uint32_t v11 = __Block_byref_object_dispose__16;
  uint64_t v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30__VCSession_participantForID___block_invoke;
  void v6[3] = &unk_1E6DB6928;
  v6[4] = a3;
  v6[5] = self;
  v6[6] = &v7;
  dispatch_sync(sessionQueue, v6);
  uint64_t v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __30__VCSession_participantForID___block_invoke(uint64_t a1)
{
  int v2 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 240), "uuid"));
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2) {
    uint64_t result = *(void *)(v3 + 240);
  }
  else {
    uint64_t result = [*(id *)(v3 + 248) objectForKeyedSubscript:*(void *)(a1 + 32)];
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
  return result;
}

- (void)mediaStateChangedForParticipant:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    BOOL v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315906;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      __int16 v10 = "-[VCSession mediaStateChangedForParticipant:]";
      __int16 v11 = 1024;
      int v12 = 692;
      __int16 v13 = 2112;
      uint64_t v14 = [a3 uuid];
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d uuid:%@", (uint8_t *)&v7, 0x26u);
    }
  }
  if (!self->_oneToOneModeEnabled) {
    [(VCSession *)self distributeBitrateAndOptInToStreamIDsWithSeamlessTransition:1];
  }
}

- (NSArray)remoteParticipants
{
  return (NSArray *)[(NSMutableDictionary *)self->_remoteParticipantsMapByUUID allValues];
}

- (void)setParentNWActivity:(id)a3
{
  parentNWActivity = self->_parentNWActivity;
  if (parentNWActivity) {
    nw_release(parentNWActivity);
  }
  self->_parentNWActivity = (OS_nw_activity *)a3;
  if (a3)
  {
    nw_retain(a3);
  }
}

- (__CFString)configurationSpecificReportingServiceName
{
  uint64_t v3 = [(VCSessionConfiguration *)self->_configuration serviceName];
  configuration = self->_configuration;
  if (!v3)
  {
    BOOL v7 = [(VCSessionConfiguration *)configuration isOneToOneModeEnabled];
    uint64_t v5 = NSString;
    if (v7) {
      BOOL v6 = "twoway";
    }
    else {
      BOOL v6 = "session";
    }
LABEL_10:
    return (__CFString *)[v5 stringWithUTF8String:v6];
  }
  if ([(NSString *)[(VCSessionConfiguration *)configuration serviceName] isEqualToString:@"com.apple.private.alloy.dropin.communication"])
  {
    uint64_t v5 = NSString;
    BOOL v6 = "dropin";
    goto LABEL_10;
  }
  uint64_t v8 = self->_configuration;

  return (__CFString *)[(VCSessionConfiguration *)v8 serviceName];
}

- (void)reportingSetUserInfo
{
}

void __33__VCSession_reportingSetUserInfo__block_invoke(uint64_t a1, uint64_t a2)
{
  _VCSession_ReportingConfigurationCallback(*(void *)(a1 + 32), a2 != 0);
}

- (void)setOneToOneModeEnabled:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__VCSession_setOneToOneModeEnabled___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_async(sessionQueue, block);
}

uint64_t __36__VCSession_setOneToOneModeEnabled___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedSetOneToOneModeEnabled:*(unsigned __int8 *)(a1 + 40) isLocal:1 configurationDict:0];
}

- (void)setOneToOneModeEnabled:(BOOL)a3 configurationDict:(id)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __54__VCSession_setOneToOneModeEnabled_configurationDict___block_invoke;
  v5[3] = &unk_1E6DB3E18;
  BOOL v6 = a3;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(sessionQueue, v5);
}

uint64_t __54__VCSession_setOneToOneModeEnabled_configurationDict___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedSetOneToOneModeEnabled:*(unsigned __int8 *)(a1 + 48) isLocal:1 configurationDict:*(void *)(a1 + 40)];
}

- (void)setRemoteScreenControlEnabled:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__VCSession_setRemoteScreenControlEnabled___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_async(sessionQueue, block);
}

uint64_t __43__VCSession_setRemoteScreenControlEnabled___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedSetRemoteScreenControlEnabled:*(unsigned __int8 *)(a1 + 40) isLocal:0];
}

- (void)generateKeyFrameWithReceivedMessage:(id)a3 forParticipant:(id)a4
{
  v5[7] = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __64__VCSession_generateKeyFrameWithReceivedMessage_forParticipant___block_invoke;
  v5[3] = &unk_1E6DB43D8;
  v5[4] = self;
  v5[5] = a4;
  void v5[6] = a3;
  dispatch_async(sessionQueue, v5);
}

void __64__VCSession_generateKeyFrameWithReceivedMessage_forParticipant___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  int v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "remoteParticipantsMapByServerID"), "objectForKeyedSubscript:", *(void *)(a1 + 40));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(v5 + 200);
      int v8 = *(_DWORD *)(v5 + 336);
      uint64_t v9 = [v2 uuid];
      uint64_t v10 = *(void *)(a1 + 48);
      int v16 = 136316930;
      uint64_t v17 = v3;
      __int16 v18 = 2080;
      __int16 v19 = "-[VCSession generateKeyFrameWithReceivedMessage:forParticipant:]_block_invoke";
      __int16 v20 = 1024;
      int v21 = 767;
      __int16 v22 = 2112;
      uint64_t v23 = v7;
      __int16 v24 = 1024;
      int v25 = v8;
      __int16 v26 = 2112;
      uint64_t v27 = v6;
      __int16 v28 = 2112;
      uint64_t v29 = v9;
      __int16 v30 = 2112;
      uint64_t v31 = v10;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d VCSession[%@] transportSessionID[%u] idsParticipantID[%@] participantUUID[%@] receives message[%@]", (uint8_t *)&v16, 0x4Au);
    }
  }
  __int16 v11 = *(void **)(a1 + 48);
  if (v11)
  {
    uint64_t v12 = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", @"VCSessionMessageStreamID"), "unsignedIntValue");
    uint64_t v13 = [NSNumber numberWithUnsignedInt:v12];
    if ([*(id *)(a1 + 48) objectForKeyedSubscript:@"VCSessionMessageFIRType"]) {
      uint64_t v14 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", @"VCSessionMessageFIRType"), "unsignedIntValue");
    }
    else {
      uint64_t v14 = 0;
    }
    if ([*(id *)(a1 + 48) objectForKeyedSubscript:@"VCSessionMesageStreamGroupID"]) {
      uint64_t v15 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", @"VCSessionMesageStreamGroupID"), "unsignedIntValue");
    }
    else {
      uint64_t v15 = 0;
    }
    [*(id *)(a1 + 32) reportingSessionParticipantEvent:233 withParticipant:v2 streamGroupID:v15 streamID:(unsigned __int16)v12];
    [*(id *)(*(void *)(a1 + 32) + 240) generateKeyFrameWithStreamID:v13 streamGroupID:v15 firType:v14];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __64__VCSession_generateKeyFrameWithReceivedMessage_forParticipant___block_invoke_cold_1();
    }
  }
}

- (void)setSharingEnabled:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__VCSession_setSharingEnabled___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_async(sessionQueue, block);
}

uint64_t __31__VCSession_setSharingEnabled___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedSetSharingEnabled:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setScreenAndCameraMixingEnabled:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__VCSession_setScreenAndCameraMixingEnabled___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_async(sessionQueue, block);
}

uint64_t __45__VCSession_setScreenAndCameraMixingEnabled___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedSetScreenAndCameraMixingEnabled:*(unsigned __int8 *)(a1 + 40)];
}

- (void)dispatchedSetSharingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  BOOL sharingEnabled = self->_sharingEnabled;
  uint64_t v6 = (VCSession *)objc_opt_class();
  if (sharingEnabled != v3)
  {
    if (v6 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_24;
      }
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      uint64_t v15 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      *(_DWORD *)buf = 136315906;
      uint64_t v41 = v14;
      __int16 v42 = 2080;
      v43 = "-[VCSession dispatchedSetSharingEnabled:]";
      __int16 v44 = 1024;
      int v45 = 803;
      __int16 v46 = 1024;
      LODWORD(v47) = v3;
      int v16 = "VCSession [%s] %s:%d changing _sharingEnabled to %d";
      uint64_t v17 = v15;
      uint32_t v18 = 34;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v8 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
      }
      else {
        int v8 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_24;
      }
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      __int16 v22 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v41 = v21;
      __int16 v42 = 2080;
      v43 = "-[VCSession dispatchedSetSharingEnabled:]";
      __int16 v44 = 1024;
      int v45 = 803;
      __int16 v46 = 2112;
      uint64_t v47 = v8;
      __int16 v48 = 2048;
      v49 = self;
      __int16 v50 = 1024;
      BOOL v51 = v3;
      int v16 = "VCSession [%s] %s:%d %@(%p) changing _sharingEnabled to %d";
      uint64_t v17 = v22;
      uint32_t v18 = 54;
    }
    _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
LABEL_24:
    self->_BOOL sharingEnabled = v3;
    [(VCSessionParticipant *)self->_localParticipant setSharingEnabled:v3];
    v38[0] = @"VCSPExpanseEnabled";
    v38[1] = @"VCSPUUID";
    v39[0] = [NSNumber numberWithBool:v3];
    v39[1] = [(VCSessionParticipant *)self->_localParticipant uuid];
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];
    reportingGenericEvent();
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v23 = self;
    __int16 v24 = [(VCSession *)self remoteParticipants];
    uint64_t v25 = [(NSArray *)v24 countByEnumeratingWithState:&v34 objects:v33 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v35 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          [v29 setSharingEnabled:v3];
          v31[0] = @"VCSPExpanseEnabled";
          uint64_t v30 = [NSNumber numberWithBool:v3];
          v31[1] = @"VCSPUUID";
          v32[0] = v30;
          v32[1] = [v29 uuid];
          [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
          reportingGenericEvent();
        }
        uint64_t v26 = [(NSArray *)v24 countByEnumeratingWithState:&v34 objects:v33 count:16];
      }
      while (v26);
    }
    if (!v23->_oneToOneModeEnabled) {
      [(VCSession *)v23 distributeBitrateAndOptInToStreamIDsWithSeamlessTransition:0];
    }
    objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "setViewPointCorrectionEnabled:", !v23->_sharingEnabled);
    [(VCSession *)v23 updateLocalVideoCaptureFrameRate];
    return;
  }
  if (v6 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v41 = v9;
        __int16 v42 = 2080;
        v43 = "-[VCSession dispatchedSetSharingEnabled:]";
        __int16 v44 = 1024;
        int v45 = 822;
        __int16 v46 = 1024;
        LODWORD(v47) = v3;
        __int16 v11 = "VCSession [%s] %s:%d _sharingEnabled already %d";
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
      uint64_t v7 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      __int16 v20 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v41 = v19;
        __int16 v42 = 2080;
        v43 = "-[VCSession dispatchedSetSharingEnabled:]";
        __int16 v44 = 1024;
        int v45 = 822;
        __int16 v46 = 2112;
        uint64_t v47 = v7;
        __int16 v48 = 2048;
        v49 = self;
        __int16 v50 = 1024;
        BOOL v51 = v3;
        __int16 v11 = "VCSession [%s] %s:%d %@(%p) _sharingEnabled already %d";
        uint64_t v12 = v20;
        uint32_t v13 = 54;
        goto LABEL_18;
      }
    }
  }
}

- (void)dispatchedSetScreenAndCameraMixingEnabled:(BOOL)a3
{
  int v3 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sessionQueue);
  int screenAndCameraMixingEnabled = self->_screenAndCameraMixingEnabled;
  uint64_t v6 = (VCSession *)objc_opt_class();
  if (screenAndCameraMixingEnabled != v3)
  {
    if (v6 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6
        || (uint64_t v14 = VRTraceErrorLogLevelToCSTR(),
            uint64_t v15 = *MEMORY[0x1E4F47A50],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)))
      {
LABEL_24:
        self->_int screenAndCameraMixingEnabled = v3;
        if (v3) {
          uint64_t v23 = 1;
        }
        else {
          uint64_t v23 = 2;
        }
        -[VCSessionParticipant setMediaType:mixingWithMediaType:](self->_localParticipant, "setMediaType:mixingWithMediaType:", 2, v23, *(_OWORD *)v24, *(void *)&v24[16], v25, v26, v27, v28);
        return;
      }
      *(_DWORD *)__int16 v24 = 136315906;
      *(void *)&v24[4] = v14;
      *(_WORD *)&v24[12] = 2080;
      *(void *)&v24[14] = "-[VCSession dispatchedSetScreenAndCameraMixingEnabled:]";
      *(_WORD *)&v24[22] = 1024;
      LODWORD(v25) = 829;
      WORD2(v25) = 1024;
      *(_DWORD *)((char *)&v25 + 6) = v3;
      int v16 = "VCSession [%s] %s:%d changing _screenAndCameraMixingEnabled=%d";
      uint64_t v17 = v15;
      uint32_t v18 = 34;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v8 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
      }
      else {
        int v8 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_24;
      }
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      __int16 v22 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      *(_DWORD *)__int16 v24 = 136316418;
      *(void *)&v24[4] = v21;
      *(_WORD *)&v24[12] = 2080;
      *(void *)&v24[14] = "-[VCSession dispatchedSetScreenAndCameraMixingEnabled:]";
      *(_WORD *)&v24[22] = 1024;
      LODWORD(v25) = 829;
      WORD2(v25) = 2112;
      *(void *)((char *)&v25 + 6) = v8;
      HIWORD(v25) = 2048;
      uint64_t v26 = self;
      LOWORD(v27) = 1024;
      *(_DWORD *)((char *)&v27 + 2) = v3;
      int v16 = "VCSession [%s] %s:%d %@(%p) changing _screenAndCameraMixingEnabled=%d";
      uint64_t v17 = v22;
      uint32_t v18 = 54;
    }
    _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, v16, v24, v18);
    goto LABEL_24;
  }
  if (v6 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int16 v24 = 136315906;
        *(void *)&v24[4] = v9;
        *(_WORD *)&v24[12] = 2080;
        *(void *)&v24[14] = "-[VCSession dispatchedSetScreenAndCameraMixingEnabled:]";
        *(_WORD *)&v24[22] = 1024;
        LODWORD(v25) = 837;
        WORD2(v25) = 1024;
        *(_DWORD *)((char *)&v25 + 6) = v3;
        __int16 v11 = "VCSession [%s] %s:%d _screenAndCameraMixingEnabled=%d already";
        uint64_t v12 = v10;
        uint32_t v13 = 34;
LABEL_18:
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, v24, v13);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v7 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      __int16 v20 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int16 v24 = 136316418;
        *(void *)&v24[4] = v19;
        *(_WORD *)&v24[12] = 2080;
        *(void *)&v24[14] = "-[VCSession dispatchedSetScreenAndCameraMixingEnabled:]";
        *(_WORD *)&v24[22] = 1024;
        LODWORD(v25) = 837;
        WORD2(v25) = 2112;
        *(void *)((char *)&v25 + 6) = v7;
        HIWORD(v25) = 2048;
        uint64_t v26 = self;
        LOWORD(v27) = 1024;
        *(_DWORD *)((char *)&v27 + 2) = v3;
        __int16 v11 = "VCSession [%s] %s:%d %@(%p) _screenAndCameraMixingEnabled=%d already";
        uint64_t v12 = v20;
        uint32_t v13 = 54;
        goto LABEL_18;
      }
    }
  }
}

- (void)sendStreamGroupStateToParticipant:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__VCSession_sendStreamGroupStateToParticipant___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = a3;
  void block[5] = self;
  dispatch_async(sessionQueue, block);
}

uint64_t __47__VCSession_sendStreamGroupStateToParticipant___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t result = *(void *)(a1 + 40);
  if (v2 != *(void *)(result + 240) && *(_DWORD *)(result + 168) == 3) {
    return objc_msgSend((id)result, "messageMediaInitialStateToParticipant:");
  }
  return result;
}

- (int)getStorebagValueForIntegerKey:(id)a3 defaultValue:(id)a4
{
  id v4 = +[GKSConnectivitySettings readStorebagValueForStorebagKey:a3 userDefaultKey:0 defaultValue:a4 isDoubleType:0];

  return [v4 intValue];
}

- (void)readAndSetABCSymptomsReportingThresholdsFromStorebags:(id *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    a3->var15.int var0 = [(VCSession *)self getStorebagValueForIntegerKey:@"vc-reporting-audio-connection-time-symptom-threshold" defaultValue:&unk_1F3DC49B0];
    a3->var15.int var1 = [(VCSession *)self getStorebagValueForIntegerKey:@"vc-reporting-audio-erasure-percentage-symptom-threshold" defaultValue:&unk_1F3DC49B0];
    a3->var15.int var2 = [(VCSession *)self getStorebagValueForIntegerKey:@"vc-reporting-poor-connection-percentage-symptom-threshold" defaultValue:&unk_1F3DC49B0];
    a3->var15.int var3 = [(VCSession *)self getStorebagValueForIntegerKey:@"vc-reporting-video-connection-time-symptom-threshold" defaultValue:&unk_1F3DC49B0];
    a3->var15.int var4 = [(VCSession *)self getStorebagValueForIntegerKey:@"vc-reporting-video-stall-percentage-symptom-threshold" defaultValue:&unk_1F3DC49B0];
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        uint64_t v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int var0 = a3->var15.var0;
          int var1 = a3->var15.var1;
          int var2 = a3->var15.var2;
          int var3 = a3->var15.var3;
          int var4 = a3->var15.var4;
          int v23 = 136316930;
          uint64_t v24 = v6;
          __int16 v25 = 2080;
          uint64_t v26 = "-[VCSession readAndSetABCSymptomsReportingThresholdsFromStorebags:]";
          __int16 v27 = 1024;
          int v28 = 865;
          __int16 v29 = 1024;
          *(_DWORD *)uint64_t v30 = var0;
          *(_WORD *)&v30[4] = 1024;
          *(_DWORD *)&v30[6] = var1;
          LOWORD(v31) = 1024;
          *(_DWORD *)((char *)&v31 + 2) = var2;
          HIWORD(v31) = 1024;
          *(_DWORD *)uint64_t v32 = var3;
          *(_WORD *)&v32[4] = 1024;
          *(_DWORD *)uint64_t v33 = var4;
          uint32_t v13 = "VCSession [%s] %s:%d Threshold values: audioConnectionTimeThreshold=%d, audioErasurePercentageThreshold="
                "%d, poorConnectionPercentageThreshold=%d, videoConnectionTimeThreshold=%d, videoStallPercentageThreshold=%d";
          uint64_t v14 = v7;
          uint32_t v15 = 58;
LABEL_15:
          _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v23, v15);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        BOOL v5 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
      }
      else {
        BOOL v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v16 = VRTraceErrorLogLevelToCSTR();
        uint64_t v17 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v18 = a3->var15.var0;
          int v19 = a3->var15.var1;
          int v20 = a3->var15.var2;
          int v21 = a3->var15.var3;
          int v22 = a3->var15.var4;
          int v23 = 136317442;
          uint64_t v24 = v16;
          __int16 v25 = 2080;
          uint64_t v26 = "-[VCSession readAndSetABCSymptomsReportingThresholdsFromStorebags:]";
          __int16 v27 = 1024;
          int v28 = 865;
          __int16 v29 = 2112;
          *(void *)uint64_t v30 = v5;
          *(_WORD *)&v30[8] = 2048;
          uint64_t v31 = self;
          *(_WORD *)uint64_t v32 = 1024;
          *(_DWORD *)&void v32[2] = v18;
          *(_WORD *)uint64_t v33 = 1024;
          *(_DWORD *)&v33[2] = v19;
          __int16 v34 = 1024;
          int v35 = v20;
          __int16 v36 = 1024;
          int v37 = v21;
          __int16 v38 = 1024;
          int v39 = v22;
          uint32_t v13 = "VCSession [%s] %s:%d %@(%p) Threshold values: audioConnectionTimeThreshold=%d, audioErasurePercentageThr"
                "eshold=%d, poorConnectionPercentageThreshold=%d, videoConnectionTimeThreshold=%d, videoStallPercentageThreshold=%d";
          uint64_t v14 = v17;
          uint32_t v15 = 78;
          goto LABEL_15;
        }
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCSession readAndSetABCSymptomsReportingThresholdsFromStorebags:]();
    }
  }
}

+ (void)terminateProcess:(id)a3 terminateSource:(id)a4 agent:(opaqueRTCReporting *)a5
{
}

- (void)setTransportSessionEventHandler
{
  v4[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__VCSession_setTransportSessionEventHandler__block_invoke;
  v4[3] = &unk_1E6DB7A78;
  v4[4] = v3;
  [(VCTransportSession *)self->_transportSession setEventHandler:v4];
}

void __44__VCSession_setTransportSessionEventHandler__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (_DWORD *)[*(id *)(a1 + 32) strong];
  if (v5)
  {
    uint64_t v6 = v5;
    switch(a2)
    {
      case 1:
        uint64_t v7 = [a3 objectForKeyedSubscript:@"transportSessionEventInfoNewLink"];
        if ([v6 currentActiveConnection]) {
          BOOL v8 = 1;
        }
        else {
          BOOL v8 = v7 == 0;
        }
        if (!v8)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
            goto LABEL_82;
          }
          uint64_t v9 = VRTraceErrorLogLevelToCSTR();
          uint64_t v10 = *MEMORY[0x1E4F47A50];
          __int16 v11 = *MEMORY[0x1E4F47A50];
          if (!*MEMORY[0x1E4F47A40])
          {
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
              __44__VCSession_setTransportSessionEventHandler__block_invoke_cold_1();
            }
            goto LABEL_82;
          }
          if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_82;
          }
          *(_DWORD *)__int16 v48 = 136315906;
          *(void *)&v48[4] = v9;
          *(_WORD *)&v48[12] = 2080;
          *(void *)&v48[14] = "-[VCSession setTransportSessionEventHandler]_block_invoke";
          *(_WORD *)&v48[22] = 1024;
          LODWORD(v49[0]) = 889;
          WORD2(v49[0]) = 2112;
          *(void *)((char *)v49 + 6) = v7;
          uint64_t v12 = "VCSession [%s] %s:%d Established initial connection '%@'";
          uint32_t v13 = v10;
          uint32_t v14 = 38;
          goto LABEL_32;
        }
        break;
      case 2:
        uint64_t v19 = [a3 objectForKeyedSubscript:@"transportSessionEventInfoDisconnectedLink"];
        if (VCConnection_Equal([v6 currentActiveConnection], v19)) {
          BOOL v20 = v19 == 0;
        }
        else {
          BOOL v20 = 1;
        }
        if (!v20)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
          {
            uint64_t v21 = VRTraceErrorLogLevelToCSTR();
            int v22 = *MEMORY[0x1E4F47A50];
            int v23 = *MEMORY[0x1E4F47A50];
            if (*MEMORY[0x1E4F47A40])
            {
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)__int16 v48 = 136315906;
                *(void *)&v48[4] = v21;
                *(_WORD *)&v48[12] = 2080;
                *(void *)&v48[14] = "-[VCSession setTransportSessionEventHandler]_block_invoke";
                *(_WORD *)&v48[22] = 1024;
                LODWORD(v49[0]) = 898;
                WORD2(v49[0]) = 2112;
                *(void *)((char *)v49 + 6) = v19;
                _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Removing current active connection '%@'", v48, 0x26u);
              }
            }
            else if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              __44__VCSession_setTransportSessionEventHandler__block_invoke_cold_2();
            }
          }
          __int16 v46 = v6;
          uint64_t v47 = 0;
          goto LABEL_83;
        }
        break;
      case 3:
        uint64_t v18 = [a3 objectForKeyedSubscript:@"transportSessionEventInfoNewPrimary"];
        [v6 handlePrimaryConnectionChanged:v18];
        break;
      case 4:
        int v24 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"transportSessionEventInfoIsDuplicationEnabled"), "BOOLValue");
        uint64_t v7 = [a3 objectForKeyedSubscript:@"transportSessionEventInfoActiveConnection"];
        if ((VCConnection_Equal([v6 currentActiveConnection], v7) & 1) == 0 && v7)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
          {
            uint64_t v25 = VRTraceErrorLogLevelToCSTR();
            uint64_t v26 = *MEMORY[0x1E4F47A50];
            __int16 v27 = *MEMORY[0x1E4F47A50];
            if (*MEMORY[0x1E4F47A40])
            {
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)__int16 v48 = 136316162;
                *(void *)&v48[4] = v25;
                *(_WORD *)&v48[12] = 2080;
                *(void *)&v48[14] = "-[VCSession setTransportSessionEventHandler]_block_invoke";
                *(_WORD *)&v48[22] = 1024;
                LODWORD(v49[0]) = 913;
                WORD2(v49[0]) = 1024;
                *(_DWORD *)((char *)v49 + 6) = v24;
                WORD5(v49[0]) = 2112;
                *(void *)((char *)v49 + 12) = v7;
                uint64_t v12 = "VCSession [%s] %s:%d Duplication state changed to %d, active connection is '%@'";
                uint32_t v13 = v26;
                uint32_t v14 = 44;
LABEL_32:
                _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, v48, v14);
              }
            }
            else if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)__int16 v48 = 136316162;
              *(void *)&v48[4] = v25;
              *(_WORD *)&v48[12] = 2080;
              *(void *)&v48[14] = "-[VCSession setTransportSessionEventHandler]_block_invoke";
              *(_WORD *)&v48[22] = 1024;
              LODWORD(v49[0]) = 913;
              WORD2(v49[0]) = 1024;
              *(_DWORD *)((char *)v49 + 6) = v24;
              WORD5(v49[0]) = 2112;
              *(void *)((char *)v49 + 12) = v7;
              _os_log_debug_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_DEBUG, "VCSession [%s] %s:%d Duplication state changed to %d, active connection is '%@'", v48, 0x2Cu);
            }
          }
LABEL_82:
          __int16 v46 = v6;
          uint64_t v47 = v7;
LABEL_83:
          objc_msgSend(v46, "setCurrentActiveConnection:", v47, *(_OWORD *)v48, *(void *)&v48[16], v49[0], *(void *)&v49[1]);
          goto LABEL_84;
        }
        break;
      case 7:
        [v5 dispatchedStopWithError:a3 didRemoteCancel:0];
        break;
      case 8:
        if ([v5 currentActiveConnection])
        {
          uint64_t v29 = [a3 intValue];
          uint64_t v30 = [v6 currentActiveConnection];
          [v6 handleCellTechChange:v29 connection:v30];
        }
        break;
      case 9:
        if ([v5 currentActiveConnection])
        {
          uint64_t v31 = [a3 unsignedShortValue];
          uint64_t v32 = [v6 currentActiveConnection];
          [v6 handleCellularMTUChanged:v31 connection:v32];
        }
        break;
      case 10:
      case 13:
      case 14:
      case 16:
        return;
      case 11:
        [v5 handleEncryptionInfoEvent:a3];
        break;
      case 12:
        [v5 handleMembershipChangeInfoEvent:a3];
        break;
      case 15:
        unsigned __int8 v33 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"transportSessionEventInfoPreferredInterfaceForDuplication"), "intValue");
        uint64_t v34 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"transportSessionEventInfoNotifyPeer"), "BOOLValue");
        uint64_t v35 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"transportSessionEventInfoIsDuplicationEnabled"), "BOOLValue");
        uint64_t v36 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"transportSessionEventInfoIsMediaUnrecoverableSignal"), "BOOLValue");
        [v6 handlePreferredInterfaceForDuplicationUpdate:v33 notifyPeer:v34 enableDuplication:v35 isMediaUnrecoverableSignal:v36];
        break;
      case 17:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          uint64_t v37 = VRTraceErrorLogLevelToCSTR();
          __int16 v38 = *MEMORY[0x1E4F47A50];
          int v39 = *MEMORY[0x1E4F47A50];
          if (*MEMORY[0x1E4F47A40])
          {
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)__int16 v48 = 136315906;
              *(void *)&v48[4] = v37;
              *(_WORD *)&v48[12] = 2080;
              *(void *)&v48[14] = "-[VCSession setTransportSessionEventHandler]_block_invoke";
              *(_WORD *)&v48[22] = 1024;
              LODWORD(v49[0]) = 955;
              WORD2(v49[0]) = 2112;
              *(void *)((char *)v49 + 6) = a3;
              _os_log_impl(&dword_1E1EA4000, v38, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Link constrains changed: '%@'", v48, 0x26u);
            }
          }
          else if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            __44__VCSession_setTransportSessionEventHandler__block_invoke_cold_3();
          }
        }
        [v6 applyLinkConstrains:a3];
LABEL_84:
        objc_msgSend(v6, "handleActiveConnectionChange:", objc_msgSend(v6, "currentActiveConnection"));
        break;
      case 18:
        v5[194] = -1;
        uint64_t v40 = [v5 currentActiveConnection];
        [v6 handleActiveConnectionChange:v40];
        break;
      case 19:
        uint64_t v41 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"transportSessionEventInfoIsMediaQualityDegraded"), "BOOLValue");
        [v6 mediaQualityDegraded:v41];
        break;
      case 20:
        uint64_t v42 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"transportSessionEventInfoDidLocalNetworkConditionChange"), "BOOLValue");
        uint64_t v43 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"transportSessionEventInfoIsLocalNetworkQualityDegraded"), "BOOLValue");
        uint64_t v44 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"transportSessionEventInfoIsRemoteNetworkQualityDegraded"), "BOOLValue");
        [v6 didLocalNetworkConditionChange:v42 isLocalNetworkQualityDegraded:v43 isRemoteNetworkQualityDegraded:v44];
        break;
      case 21:
        uint64_t v45 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"transportSessionEventInfoIsUplinkRetransmissionSupported"), "BOOLValue");
        [v6 setIsUplinkRetransmissionEnabled:v45];
        break;
      default:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          uint64_t v28 = VRTraceErrorLogLevelToCSTR();
          uint64_t v16 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int16 v48 = 136315906;
            *(void *)&v48[4] = v28;
            *(_WORD *)&v48[12] = 2080;
            *(void *)&v48[14] = "-[VCSession setTransportSessionEventHandler]_block_invoke";
            *(_WORD *)&v48[22] = 1024;
            LODWORD(v49[0]) = 973;
            WORD2(v49[0]) = 1024;
            *(_DWORD *)((char *)v49 + 6) = a2;
            uint64_t v17 = "VCSession [%s] %s:%d Received invalid transportSession event(%d)";
            goto LABEL_14;
          }
        }
        break;
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    uint64_t v16 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v48 = 136315906;
      *(void *)&v48[4] = v15;
      *(_WORD *)&v48[12] = 2080;
      *(void *)&v48[14] = "-[VCSession setTransportSessionEventHandler]_block_invoke";
      *(_WORD *)&v48[22] = 1024;
      LODWORD(v49[0]) = 882;
      WORD2(v49[0]) = 1024;
      *(_DWORD *)((char *)v49 + 6) = a2;
      uint64_t v17 = "VCSession [%s] %s:%d Received transportSession event %d while call is not ongoing. Skipping";
LABEL_14:
      _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, v17, v48, 0x22u);
    }
  }
}

- (void)applyLinkConstrains:(id)a3
{
  BOOL v5 = [(VCTransportSession *)self->_transportSession connectionManager];
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"transportSessionEventPayloadKey_IsCellular"), "BOOLValue");
  uint64_t v7 = (void *)MEMORY[0x1E4F6A6E8];
  if (!v6) {
    uint64_t v7 = (void *)MEMORY[0x1E4F6A720];
  }
  -[VCConnectionManager applyLinkFlags:isCellular:](v5, "applyLinkFlags:isCellular:", (unsigned __int16)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *v7), "intValue"), v6);
  if (self->_oneToOneModeEnabled)
  {
    sessionMessaging = self->_sessionMessaging;
    unint64_t v9 = [(VCSessionParticipant *)[(VCSession *)self oneToOneRemoteParticipant] idsParticipantID];
    [(VCSessionMessaging *)sessionMessaging sendMessageDictionary:a3 withTopic:@"VCSessionMessageTopicLinkConstrainesChanged" participantID:v9];
  }
}

- (void)applyRemoteLinkConstrains:(id)a3
{
  id v4 = [(VCTransportSession *)self->_transportSession connectionManager];
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"transportSessionEventPayloadKey_IsCellular"), "BOOLValue");
  uint64_t v6 = (void *)MEMORY[0x1E4F6A6E8];
  if (!v5) {
    uint64_t v6 = (void *)MEMORY[0x1E4F6A720];
  }
  uint64_t v7 = (unsigned __int16)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *v6), "intValue");

  [(VCConnectionManager *)v4 applyRemoteLinkFlags:v7 isCellular:v5];
}

- (void)notifyRemoteOfCellTechChange:(id)a3 remoteParticipant:(id)a4
{
  v11[2] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    if ([(VCSession *)self isOneToOneUsingVideo]
      || [(VCSession *)self isOneToOneUsingScreen])
    {
      uint64_t v7 = [a3 uplinkBitrateCapOneToOne];
    }
    else
    {
      uint64_t v7 = [a3 uplinkAudioBitrateCapOneToOne];
    }
    BOOL v8 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:v7];
    unint64_t v9 = (void *)[objc_alloc(NSNumber) initWithInt:VCConnection_LocalCellTech((uint64_t)a3)];
    v10[0] = @"VCCellTechKey";
    v10[1] = @"VCMaxBitrateKey";
    v11[0] = v9;
    v11[1] = v8;
    -[VCSessionMessaging sendMessageDictionary:withTopic:participantID:](self->_sessionMessaging, "sendMessageDictionary:withTopic:participantID:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2], @"VCCellTechChangeTopic", objc_msgSend(a4, "idsParticipantID"));
  }
}

- (void)handleCellTechChange:(int)a3 connection:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  int v7 = [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] getCellularTechForActiveConnectionWithQuality:1 forLocalInterface:1];
  if (v5)
  {
    if ((int)v5 <= 9 && v7 != v5 && (self->_state | 2) == 3)
    {
      [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] updateCellularTech:v5 forLocalInterface:1];
      [(VCSession *)self handleActiveConnectionChange:a4];
      if (self->_oneToOneModeEnabled)
      {
        BOOL v8 = [(VCSession *)self oneToOneRemoteParticipant];
        [(VCSession *)self notifyRemoteOfCellTechChange:a4 remoteParticipant:v8];
      }
    }
  }
}

- (void)handlePrimaryConnectionChanged:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      int v7 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 136315906;
          uint64_t v10 = v5;
          __int16 v11 = 2080;
          uint64_t v12 = "-[VCSession handlePrimaryConnectionChanged:]";
          __int16 v13 = 1024;
          int v14 = 1038;
          __int16 v15 = 2112;
          id v16 = a3;
          _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Primary connection changed to '%@'", (uint8_t *)&v9, 0x26u);
        }
      }
      else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        -[VCSession handlePrimaryConnectionChanged:]();
      }
    }
    BOOL v8 = (const void *)VCConnectionManager_CopyConnectionForQuality((uint64_t)[(VCTransportSession *)self->_transportSession connectionManager], 1);
    if ((VCConnection_Equal((uint64_t)[(VCSession *)self currentActiveConnection], (uint64_t)v8) & 1) != 0|| !v8)
    {
      if (!v8) {
        return;
      }
    }
    else
    {
      [(VCSession *)self setCurrentActiveConnection:v8];
      [(VCSession *)self handleActiveConnectionChange:[(VCSession *)self currentActiveConnection]];
      VCMediaQueue_CleanupTxHistory((uint64_t)self->_mediaQueue);
      [(VCSessionStatsController *)[(VCSession *)self sessionStatsController] reset];
    }
    CFRelease(v8);
  }
}

- (void)handleCellularMTUChanged:(unsigned __int16)a3 connection:(id)a4
{
  [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] updateCellularMTU:a3];

  [(VCSession *)self handleActiveConnectionChange:a4];
}

- (void)handleActiveConnectionChange:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__VCSession_handleActiveConnectionChange___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a3;
  dispatch_async(sessionQueue, block);
}

uint64_t __42__VCSession_handleActiveConnectionChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedHandleActiveConnectionChange:*(void *)(a1 + 40)];
}

- (void)dispatchedHandleActiveConnectionChange:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v23 = v5;
      __int16 v24 = 2080;
      uint64_t v25 = "-[VCSession dispatchedHandleActiveConnectionChange:]";
      __int16 v26 = 1024;
      int v27 = 1062;
      __int16 v28 = 2112;
      id v29 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Connection changed to '%@'", buf, 0x26u);
    }
  }
  if ((self->_state | 2) == 3)
  {
    int IsEndToEndLink = VCConnection_IsEndToEndLink((uint64_t)a3);
    if (!self->_oneToOneModeEnabled || IsEndToEndLink == 0)
    {
      if ((IsEndToEndLink & 1) == 0) {
        [(VCSession *)self handleActiveConnectionChangeForMultiway:a3];
      }
    }
    else
    {
      [(VCSession *)self handleActiveConnectionChangeForOneToOne:a3];
    }
    [(VCSessionParticipantLocal *)self->_localParticipant handleActiveConnectionChange:a3];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    int v9 = [(VCSession *)self remoteParticipants];
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v18 objects:v17 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          int v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if (!self->_oneToOneModeEnabled)
          {
            __int16 v15 = @"sliceStatus";
            uint64_t v16 = [NSNumber numberWithUnsignedChar:VCConnection_ReportingSliceStatus((uint64_t)a3)];
            -[VCSession sendDeviceStateMessageToParticipant:withStatus:checkDNUStatus:](self, "sendDeviceStateMessageToParticipant:withStatus:checkDNUStatus:", v14, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1], 0);
          }
          [v14 handleActiveConnectionChange:a3];
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v18 objects:v17 count:16];
      }
      while (v11);
    }
    if (self->_feedbackController) {
      [(VCNetworkFeedbackController *)self->_feedbackController setIsLocalCellular:VCConnection_IsLocalOnCellular((uint64_t)a3)];
    }
  }
}

- (void)updateMultiwayRateControllersWithActiveConnection:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(VCSession *)self updateMultiwayRateControllerWithActiveConnection:a3 isScreenEnabled:[(VCSessionParticipant *)self->_localParticipant isScreenEnabled] isLocal:1];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(VCSession *)self remoteParticipants];
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * v9) isRemoteScreenEnabled])
        {
          uint64_t v10 = 1;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v11 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v10 = 0;
LABEL_11:
  [(VCSession *)self updateMultiwayRateControllerWithActiveConnection:a3 isScreenEnabled:v10 isLocal:0];
  -[VCNetworkFeedbackController setClientTargetBitrateCap:](self->_feedbackController, "setClientTargetBitrateCap:", [a3 uplinkBitrateCap]);
  if (VCConnection_IsLocalOnCellular((uint64_t)a3)) {
    -[VCNetworkFeedbackController setDownlinkTargetCellBitrateCap:](self->_feedbackController, "setDownlinkTargetCellBitrateCap:", [a3 downlinkBitrateCap]);
  }
}

- (void)handleActiveConnectionChangeForMultiway:(id)a3
{
  int IsLocalOnCellular = VCConnection_IsLocalOnCellular((uint64_t)a3);
  int IsLocalConstrained = VCConnection_IsLocalConstrained((uint64_t)a3);
  int currentConnectionType = self->_currentConnectionType;
  if (currentConnectionType != [a3 localConnectionType])
  {
    self->_int currentConnectionType = [a3 localConnectionType];
    [(VCSession *)self reportingSessionParticipantEvent:159 withParticipant:0];
    p_isCurrentConnectionConstrained = &self->_isCurrentConnectionConstrained;
    if (self->_isCurrentConnectionConstrained == IsLocalConstrained) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  p_isCurrentConnectionConstrained = &self->_isCurrentConnectionConstrained;
  if (self->_isCurrentConnectionConstrained != IsLocalConstrained)
  {
LABEL_8:
    BOOL *p_isCurrentConnectionConstrained = IsLocalConstrained;
LABEL_9:
    [(VCSession *)self updateMultiwayRateControllersWithActiveConnection:a3];
    if (!IsLocalOnCellular) {
      return;
    }
    goto LABEL_4;
  }
  if (!IsLocalOnCellular) {
    return;
  }
LABEL_4:
  uint64_t v9 = [(AVCRateController *)self->_uplinkRateController basebandCongestionDetector];
  localParticipant = self->_localParticipant;

  [(VCSessionParticipant *)localParticipant setBasebandCongestionDetector:v9];
}

- (void)handlePreferredInterfaceForDuplicationUpdate:(unsigned __int8)a3 notifyPeer:(BOOL)a4 enableDuplication:(BOOL)a5 isMediaUnrecoverableSignal:(BOOL)a6
{
  v12[3] = *MEMORY[0x1E4F143B8];
  if (self->_oneToOneModeEnabled && a4)
  {
    BOOL v7 = a6;
    BOOL v8 = a5;
    uint64_t v9 = a3;
    if ([(VCSession *)self oneToOneRemoteParticipant])
    {
      v11[0] = @"VCPreferredInterfaceKey";
      v12[0] = [NSNumber numberWithUnsignedChar:v9];
      v11[1] = @"VCPreferredInterfaceDuplicatingKey";
      v12[1] = [NSNumber numberWithBool:v8];
      v11[2] = @"VCPreferredInterfaceMediaUnrecoverableSignalKey";
      v12[2] = [NSNumber numberWithBool:v7];
      -[VCSessionMessaging sendMessageDictionary:withTopic:participantID:](self->_sessionMessaging, "sendMessageDictionary:withTopic:participantID:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3], @"VCPreferredInterfaceMessageTopic", -[VCSessionParticipant idsParticipantID](-[VCSession oneToOneRemoteParticipant](self, "oneToOneRemoteParticipant"), "idsParticipantID"));
    }
  }
}

- (unsigned)calculateExpectedTotalNetworkBitrateDownlink
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v4 = [(VCSession *)self remoteParticipants];
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v27 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unsigned int v7 = 0;
    uint64_t v8 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v4);
        }
        v7 += [*(id *)(*((void *)&v27 + 1) + 8 * i) actualNetworkBitrateWithAudioBitrates:v3];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v27 objects:v26 count:16];
    }
    while (v6);
  }
  else
  {
    unsigned int v7 = 0;
  }
  [v3 sortUsingSelector:sel_compare_];
  unint64_t v10 = [v3 count];
  if ([(VCSessionDownlinkBandwidthAllocator *)self->_downlinkBandwidthAllocator simultaneousTalkers])
  {
    BOOL v11 = v10 == 0;
  }
  else
  {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    unint64_t v12 = v10 - 1;
    unint64_t v13 = 2;
    do
    {
      v7 += objc_msgSend((id)objc_msgSend(v3, "objectAtIndexedSubscript:", v12), "unsignedIntValue");
      BOOL v14 = v13 > [(VCSessionDownlinkBandwidthAllocator *)self->_downlinkBandwidthAllocator simultaneousTalkers]|| v13 > v10;
      ++v13;
      --v12;
    }
    while (!v14);
  }

  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    uint64_t v16 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315906;
      uint64_t v19 = v15;
      __int16 v20 = 2080;
      long long v21 = "-[VCSession calculateExpectedTotalNetworkBitrateDownlink]";
      __int16 v22 = 1024;
      int v23 = 1169;
      __int16 v24 = 1024;
      unsigned int v25 = v7;
      _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d New downlink expected bitrate:%u", (uint8_t *)&v18, 0x22u);
    }
  }
  return v7;
}

- (unsigned)calculateExpectedTotalNetworkBitrateUplink
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unsigned int v2 = [(VCSessionParticipantLocal *)self->_localParticipant currentUplinkTotalBitrate];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    id v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315906;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      uint64_t v9 = "-[VCSession calculateExpectedTotalNetworkBitrateUplink]";
      __int16 v10 = 1024;
      int v11 = 1176;
      __int16 v12 = 1024;
      unsigned int v13 = v2;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d New uplink expected bitrate:%u", (uint8_t *)&v6, 0x22u);
    }
  }
  return v2;
}

- (void)setOneToOneVideoStreamBandwidthProbing:(BOOL)a3
{
  BOOL v3 = a3;
  localParticipant = self->_localParticipant;
  if (localParticipant)
  {
    [(VCSessionParticipantLocal *)localParticipant oneToOneSettings];
    localParticipant = (VCSessionParticipantLocal *)v11;
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v10 = 0u;
  }
  objc_msgSend((id)objc_msgSend((id)-[VCSessionParticipantLocal objectForKeyedSubscript:](localParticipant, "objectForKeyedSubscript:", &unk_1F3DC49C8), "stream"), "setIsEndToEndBasedBandwidthProbingEnabled:", v3);
  int v6 = self->_localParticipant;
  if (v6)
  {
    [(VCSessionParticipantLocal *)v6 oneToOneSettings];
    int v6 = (VCSessionParticipantLocal *)v8;
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
    long long v7 = 0u;
  }
  objc_msgSend((id)objc_msgSend((id)-[VCSessionParticipantLocal objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", &unk_1F3DC49E0, v7, v8, v9, v10, v11, v12), "stream"), "setIsEndToEndBasedBandwidthProbingEnabled:", v3);
}

- (void)vcSessionParticipant:(id)a3 didStart:(BOOL)a4 error:(id)a5
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__VCSession_vcSessionParticipant_didStart_error___block_invoke;
  block[3] = &unk_1E6DB5238;
  block[4] = self;
  void block[5] = a3;
  BOOL v7 = a4;
  block[6] = a5;
  dispatch_async(sessionQueue, block);
}

uint64_t __49__VCSession_vcSessionParticipant_didStart_error___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) dispatchedParticipant:*(void *)(a1 + 40) didStart:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 48)];
  if (*(unsigned char *)(a1 + 56))
  {
    [*(id *)(a1 + 40) participantVideoToken];
    return kdebug_trace();
  }
  return result;
}

- (void)vcSessionParticipant:(id)a3 didStopWithError:(id)a4
{
  v5[7] = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __51__VCSession_vcSessionParticipant_didStopWithError___block_invoke;
  v5[3] = &unk_1E6DB43D8;
  v5[4] = self;
  v5[5] = a3;
  void v5[6] = a4;
  dispatch_async(sessionQueue, v5);
}

uint64_t __51__VCSession_vcSessionParticipant_didStopWithError___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) dispatchedParticipant:*(void *)(a1 + 40) didStopWithError:*(void *)(a1 + 48)];
  [*(id *)(a1 + 40) participantVideoToken];

  return kdebug_trace();
}

- (void)vcSessionParticipant:(id)a3 audioEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__VCSession_vcSessionParticipant_audioEnabled_didSucceed_error___block_invoke;
  block[3] = &unk_1E6DB7AA0;
  BOOL v8 = a5;
  block[4] = a3;
  void block[5] = self;
  BOOL v9 = a4;
  block[6] = a6;
  dispatch_async(sessionQueue, block);
}

void __64__VCSession_vcSessionParticipant_audioEnabled_didSucceed_error___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  char v2 = *(unsigned char *)(a1 + 56);
  if (v2)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    BOOL v3 = *(void **)(a1 + 40);
    if (v4 != v3[30])
    {
      objc_msgSend(v3, "mediaStateChangedForParticipant:");
LABEL_19:
      [*(id *)(a1 + 40) reportingSessionParticipantEvent:170 withParticipant:*(void *)(a1 + 32)];
      char v2 = *(unsigned char *)(a1 + 56);
      goto LABEL_20;
    }
    if (objc_opt_class() == *(void *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7
        || (uint64_t v6 = VRTraceErrorLogLevelToCSTR(),
            BOOL v7 = *MEMORY[0x1E4F47A50],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)))
      {
LABEL_15:
        [*(id *)(a1 + 40) broadcastMediaStateUpdateMessage];
        if (*(unsigned char *)(a1 + 57)) {
          uint64_t v14 = @"VCSessionMessageAudioEnabled";
        }
        else {
          uint64_t v14 = @"VCSessionMessageAudioDisabled";
        }
        [*(id *)(a1 + 40) broadcastSingleStateMessage:v14 withTopic:@"VCSessionMessageTopicAudioEnabledState"];
        goto LABEL_19;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v22 = v6;
      __int16 v23 = 2080;
      __int16 v24 = "-[VCSession vcSessionParticipant:audioEnabled:didSucceed:error:]_block_invoke";
      __int16 v25 = 1024;
      int v26 = 1212;
      BOOL v8 = "VCSession [%s] %s:%d Broadcasting audioEnabled state";
      BOOL v9 = v7;
      uint32_t v10 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v5 = (__CFString *)[*(id *)(a1 + 40) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_15;
      }
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      long long v12 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      uint64_t v13 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136316162;
      uint64_t v22 = v11;
      __int16 v23 = 2080;
      __int16 v24 = "-[VCSession vcSessionParticipant:audioEnabled:didSucceed:error:]_block_invoke";
      __int16 v25 = 1024;
      int v26 = 1212;
      __int16 v27 = 2112;
      long long v28 = v5;
      __int16 v29 = 2048;
      uint64_t v30 = v13;
      BOOL v8 = "VCSession [%s] %s:%d %@(%p) Broadcasting audioEnabled state";
      BOOL v9 = v12;
      uint32_t v10 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
    goto LABEL_15;
  }
LABEL_20:
  uint64_t v15 = *(void *)(a1 + 40);
  uint64_t v16 = *(NSObject **)(v15 + 184);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __64__VCSession_vcSessionParticipant_audioEnabled_didSucceed_error___block_invoke_175;
  v18[3] = &unk_1E6DB7AA0;
  uint64_t v17 = *(void *)(a1 + 32);
  v18[4] = v15;
  v18[5] = v17;
  char v19 = *(unsigned char *)(a1 + 57);
  char v20 = v2;
  v18[6] = *(void *)(a1 + 48);
  dispatch_async(v16, v18);
}

uint64_t __64__VCSession_vcSessionParticipant_audioEnabled_didSucceed_error___block_invoke_175(uint64_t a1)
{
  char v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) uuid];
  uint64_t v5 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 57);
  uint64_t v7 = *(void *)(a1 + 48);

  return [v2 vcSession:v3 participantID:v4 audioEnabled:v5 didSucceed:v6 error:v7];
}

- (void)updateOneToOneVideoReceiverDelegate:(BOOL)a3
{
  if (!self->_oneToOneModeEnabled)
  {
    if (a3) {
      [(VCSession *)self setupOneToOneVideoReceiverDelegate];
    }
    else {
      [(VCSession *)self cleanupOneToOneVideoReceiverDelegate];
    }
  }
}

- (void)vcSessionParticipant:(id)a3 videoEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__VCSession_vcSessionParticipant_videoEnabled_didSucceed_error___block_invoke;
  block[3] = &unk_1E6DB7AA0;
  BOOL v8 = a5;
  block[4] = a3;
  void block[5] = self;
  BOOL v9 = a4;
  block[6] = a6;
  dispatch_async(sessionQueue, block);
}

void __64__VCSession_vcSessionParticipant_videoEnabled_didSucceed_error___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(a1 + 56)) {
    goto LABEL_24;
  }
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  if (v3 == *(void *)(v2 + 240))
  {
    if (*(unsigned char *)(v2 + 409))
    {
      [*(id *)(a1 + 32) handleActiveConnectionChange:*(void *)(v2 + 328)];
      [*(id *)(a1 + 40) configureOneToOneReportingOnVideoEnabled];
    }
    if (objc_opt_class() == *(void *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7
        || (uint64_t v5 = VRTraceErrorLogLevelToCSTR(),
            uint64_t v6 = *MEMORY[0x1E4F47A50],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)))
      {
LABEL_17:
        [*(id *)(a1 + 40) broadcastMediaStateUpdateMessage];
        if (*(unsigned char *)(a1 + 57)) {
          uint64_t v13 = @"VCSessionMessageVideoEnabled";
        }
        else {
          uint64_t v13 = @"VCSessionMessageVideoDisabled";
        }
        [*(id *)(a1 + 40) broadcastSingleStateMessage:v13 withTopic:@"VCSessionMessageTopicVideoEnabledStateb"];
        [*(id *)(a1 + 40) updateOneToOneVideoReceiverDelegate:*(unsigned __int8 *)(a1 + 57)];
        goto LABEL_21;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v22 = v5;
      __int16 v23 = 2080;
      __int16 v24 = "-[VCSession vcSessionParticipant:videoEnabled:didSucceed:error:]_block_invoke";
      __int16 v25 = 1024;
      int v26 = 1245;
      uint64_t v7 = "VCSession [%s] %s:%d Broadcasting videoEnabled state";
      BOOL v8 = v6;
      uint32_t v9 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v4 = (__CFString *)[*(id *)(a1 + 40) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v4 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_17;
      }
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136316162;
      uint64_t v22 = v10;
      __int16 v23 = 2080;
      __int16 v24 = "-[VCSession vcSessionParticipant:videoEnabled:didSucceed:error:]_block_invoke";
      __int16 v25 = 1024;
      int v26 = 1245;
      __int16 v27 = 2112;
      long long v28 = v4;
      __int16 v29 = 2048;
      uint64_t v30 = v12;
      uint64_t v7 = "VCSession [%s] %s:%d %@(%p) Broadcasting videoEnabled state";
      BOOL v8 = v11;
      uint32_t v9 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
    goto LABEL_17;
  }
  objc_msgSend((id)v2, "mediaStateChangedForParticipant:");
LABEL_21:
  [*(id *)(a1 + 40) reportingSessionParticipantEvent:171 withParticipant:*(void *)(a1 + 32)];
  uint64_t v14 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) == *(void *)(v14 + 240) && *(unsigned char *)(v14 + 409)) {
    [(id)v14 configureOneToOneRateController:*(void *)(v14 + 328)];
  }
LABEL_24:
  uint64_t v15 = *(void *)(a1 + 40);
  uint64_t v16 = *(NSObject **)(v15 + 184);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __64__VCSession_vcSessionParticipant_videoEnabled_didSucceed_error___block_invoke_185;
  v18[3] = &unk_1E6DB7AA0;
  uint64_t v17 = *(void *)(a1 + 32);
  v18[4] = v15;
  v18[5] = v17;
  char v19 = *(unsigned char *)(a1 + 57);
  char v20 = *(unsigned char *)(a1 + 56);
  v18[6] = *(void *)(a1 + 48);
  dispatch_async(v16, v18);
}

uint64_t __64__VCSession_vcSessionParticipant_videoEnabled_didSucceed_error___block_invoke_185(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) uuid];
  uint64_t v5 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 57);
  uint64_t v7 = *(void *)(a1 + 48);

  return [v2 vcSession:v3 participantID:v4 videoEnabled:v5 didSucceed:v6 error:v7];
}

- (void)vcSessionParticipant:(id)a3 screenEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__VCSession_vcSessionParticipant_screenEnabled_didSucceed_error___block_invoke;
  block[3] = &unk_1E6DB7AA0;
  BOOL v8 = a5;
  block[4] = a3;
  void block[5] = self;
  BOOL v9 = a4;
  block[6] = a6;
  dispatch_async(sessionQueue, block);
}

void __65__VCSession_vcSessionParticipant_screenEnabled_didSucceed_error___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  char v2 = *(unsigned char *)(a1 + 56);
  if (!v2) {
    goto LABEL_28;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  if (v4 != v3[30])
  {
    objc_msgSend(v3, "mediaStateChangedForParticipant:");
    [*(id *)(a1 + 40) updateMultiwayRateControllerWithActiveConnection:*(void *)(*(void *)(a1 + 40) + 328) isScreenEnabled:*(unsigned __int8 *)(a1 + 57) isLocal:0];
    goto LABEL_16;
  }
  if (objc_opt_class() == *(void *)(a1 + 40))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_15;
    }
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v29 = v6;
    __int16 v30 = 2080;
    uint64_t v31 = "-[VCSession vcSessionParticipant:screenEnabled:didSucceed:error:]_block_invoke";
    __int16 v32 = 1024;
    int v33 = 1267;
    BOOL v8 = "VCSession [%s] %s:%d Broadcasting screenEnabled state";
    BOOL v9 = v7;
    uint32_t v10 = 28;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[*(id *)(a1 + 40) performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_15;
    }
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    uint64_t v12 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    uint64_t v13 = *(const char **)(a1 + 40);
    *(_DWORD *)buf = 136316162;
    uint64_t v29 = v11;
    __int16 v30 = 2080;
    uint64_t v31 = "-[VCSession vcSessionParticipant:screenEnabled:didSucceed:error:]_block_invoke";
    __int16 v32 = 1024;
    int v33 = 1267;
    __int16 v34 = 2112;
    uint64_t v35 = v5;
    __int16 v36 = 2048;
    uint64_t v37 = v13;
    BOOL v8 = "VCSession [%s] %s:%d %@(%p) Broadcasting screenEnabled state";
    BOOL v9 = v12;
    uint32_t v10 = 48;
  }
  _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_15:
  [*(id *)(a1 + 40) broadcastMediaStateUpdateMessage];
  [*(id *)(a1 + 40) updateMultiwayRateControllerWithActiveConnection:*(void *)(*(void *)(a1 + 40) + 328) isScreenEnabled:*(unsigned __int8 *)(a1 + 57) isLocal:1];
LABEL_16:
  uint64_t v14 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v14 + 409))
  {
    objc_msgSend((id)objc_msgSend(*(id *)(v14 + 320), "connectionManager"), "setIsOneToOneScreenEnabled:", *(unsigned __int8 *)(a1 + 57));
    uint64_t v15 = *(void **)(a1 + 40);
    if (*(void *)(a1 + 32) == v15[30])
    {
      [v15 configureOneToOneRateController:v15[41]];
      [*(id *)(a1 + 40) setOneToOneVideoStreamBandwidthProbing:*(unsigned char *)(a1 + 57) == 0];
    }
  }
  if (*(unsigned char *)(a1 + 57))
  {
    int v16 = VCMediaQueue_SetHighlyBurstyTrafficMode(*(void *)(*(void *)(a1 + 40) + 480), 1);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      int v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        char v19 = "YES";
        int v20 = *(unsigned __int8 *)(a1 + 57);
        *(_DWORD *)buf = 136316162;
        uint64_t v29 = v17;
        if (!v20) {
          char v19 = "NO";
        }
        uint64_t v31 = "-[VCSession vcSessionParticipant:screenEnabled:didSucceed:error:]_block_invoke";
        __int16 v32 = 1024;
        long long v21 = "PASS";
        int v33 = 1284;
        __int16 v30 = 2080;
        __int16 v34 = 2080;
        if (v16) {
          long long v21 = "FAILED";
        }
        uint64_t v35 = (void *)v19;
        __int16 v36 = 2080;
        uint64_t v37 = v21;
        _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Enabling screensharing mode in VCMediaQueue=%s, VCMediaQueue set screenEnabled=%s", buf, 0x30u);
      }
    }
  }
  [*(id *)(a1 + 40) reportingSessionParticipantEvent:188 withParticipant:*(void *)(a1 + 32)];
  char v2 = *(unsigned char *)(a1 + 56);
LABEL_28:
  uint64_t v22 = *(void *)(a1 + 40);
  __int16 v23 = *(NSObject **)(v22 + 184);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __65__VCSession_vcSessionParticipant_screenEnabled_didSucceed_error___block_invoke_190;
  v25[3] = &unk_1E6DB7AA0;
  uint64_t v24 = *(void *)(a1 + 32);
  v25[4] = v22;
  v25[5] = v24;
  char v26 = *(unsigned char *)(a1 + 57);
  char v27 = v2;
  v25[6] = *(void *)(a1 + 48);
  dispatch_async(v23, v25);
}

uint64_t __65__VCSession_vcSessionParticipant_screenEnabled_didSucceed_error___block_invoke_190(uint64_t a1)
{
  char v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) uuid];
  uint64_t v5 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 57);
  uint64_t v7 = *(void *)(a1 + 48);

  return [v2 vcSession:v3 participantID:v4 screenEnabled:v5 didSucceed:v6 error:v7];
}

- (void)vcSessionParticipantFetchStreamGroupState:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__VCSession_vcSessionParticipantFetchStreamGroupState___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = a3;
  void block[5] = self;
  dispatch_async(sessionQueue, block);
}

void *__55__VCSession_vcSessionParticipantFetchStreamGroupState___block_invoke(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (result != *(void **)(v3 + 240) && *(_DWORD *)(v3 + 168) == 3)
  {
    uint64_t v4 = *(void **)(v3 + 224);
    uint64_t v5 = [result idsParticipantID];
    return (void *)[v4 sendMessage:@"VCSessionMessageTopicFetchStreamGroupsState" withTopic:@"VCSessionMessageTopicFetchStreamGroupsState" participantID:v5];
  }
  return result;
}

- (void)vcSessionParticipant:(id)a3 remoteAudioEnabledDidChange:(BOOL)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  notificationQueue = self->_notificationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __62__VCSession_vcSessionParticipant_remoteAudioEnabledDidChange___block_invoke;
  v5[3] = &unk_1E6DB3E18;
  v5[4] = self;
  v5[5] = a3;
  BOOL v6 = a4;
  dispatch_async(notificationQueue, v5);
}

uint64_t __62__VCSession_vcSessionParticipant_remoteAudioEnabledDidChange___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "reportingSessionRemoteParticipantEvent:withParticipant:value:", 174, *(void *)(a1 + 40), objc_msgSend(NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 48)));
  [*(id *)(a1 + 40) setRemoteAudioEnabled:*(unsigned __int8 *)(a1 + 48)];
  char v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) uuid];
  uint64_t v5 = *(unsigned __int8 *)(a1 + 48);

  return [v2 vcSession:v3 participantID:v4 remoteAudioEnabledDidChange:v5];
}

- (void)vcSessionParticipant:(id)a3 remoteVideoEnabledDidChange:(BOOL)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__VCSession_vcSessionParticipant_remoteVideoEnabledDidChange___block_invoke;
  block[3] = &unk_1E6DB3E18;
  block[4] = self;
  void block[5] = a3;
  BOOL v10 = a4;
  dispatch_async(notificationQueue, block);
  sessionQueue = self->_sessionQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__VCSession_vcSessionParticipant_remoteVideoEnabledDidChange___block_invoke_2;
  v8[3] = &unk_1E6DB3E40;
  v8[4] = self;
  v8[5] = a3;
  dispatch_async(sessionQueue, v8);
}

uint64_t __62__VCSession_vcSessionParticipant_remoteVideoEnabledDidChange___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "reportingSessionRemoteParticipantEvent:withParticipant:value:", 175, *(void *)(a1 + 40), objc_msgSend(NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 48)));
  char v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) uuid];
  uint64_t v5 = *(unsigned __int8 *)(a1 + 48);

  return [v2 vcSession:v3 participantID:v4 remoteVideoEnabledDidChange:v5];
}

uint64_t __62__VCSession_vcSessionParticipant_remoteVideoEnabledDidChange___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) mediaStateChangedForParticipant:*(void *)(a1 + 40)];
}

- (void)vcSessionParticipant:(id)a3 remoteScreenEnabledDidChange:(BOOL)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__VCSession_vcSessionParticipant_remoteScreenEnabledDidChange___block_invoke;
  block[3] = &unk_1E6DB3E18;
  BOOL v12 = a4;
  block[4] = self;
  void block[5] = a3;
  dispatch_async(notificationQueue, block);
  sessionQueue = self->_sessionQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__VCSession_vcSessionParticipant_remoteScreenEnabledDidChange___block_invoke_2;
  v9[3] = &unk_1E6DB3E18;
  BOOL v10 = a4;
  v9[4] = self;
  v9[5] = a3;
  dispatch_async(sessionQueue, v9);
}

uint64_t __63__VCSession_vcSessionParticipant_remoteScreenEnabledDidChange___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateMultiwayRateControllerWithActiveConnection:*(void *)(*(void *)(a1 + 32) + 328) isScreenEnabled:*(unsigned __int8 *)(a1 + 48) isLocal:0];
  objc_msgSend(*(id *)(a1 + 32), "reportingSessionRemoteParticipantEvent:withParticipant:value:", 189, *(void *)(a1 + 40), objc_msgSend(NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 48)));
  char v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) uuid];
  uint64_t v5 = *(unsigned __int8 *)(a1 + 48);

  return [v2 vcSession:v3 participantID:v4 remoteScreenEnabledDidChange:v5];
}

uint64_t __63__VCSession_vcSessionParticipant_remoteScreenEnabledDidChange___block_invoke_2(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 320), "connectionManager"), "setIsOneToOneScreenEnabled:", *(unsigned __int8 *)(a1 + 48));
  char v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 mediaStateChangedForParticipant:v3];
}

- (void)vcSessionParticipant:(id)a3 audioPaused:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__VCSession_vcSessionParticipant_audioPaused_didSucceed_error___block_invoke;
  block[3] = &unk_1E6DB7AA0;
  BOOL v8 = a5;
  block[4] = a3;
  void block[5] = self;
  BOOL v9 = a4;
  void block[6] = a6;
  dispatch_async(sessionQueue, block);
}

void __63__VCSession_vcSessionParticipant_audioPaused_didSucceed_error___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(a1 + 56)) {
    goto LABEL_19;
  }
  uint64_t v3 = *(void *)(a1 + 32);
  char v2 = *(void **)(a1 + 40);
  if (v3 != v2[30])
  {
    objc_msgSend(v2, "mediaStateChangedForParticipant:");
    goto LABEL_19;
  }
  if (objc_opt_class() != *(void *)(a1 + 40))
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v4 = (__CFString *)[*(id *)(a1 + 40) performSelector:sel_logPrefix];
    }
    else {
      uint64_t v4 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_15;
    }
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint64_t v11 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    uint64_t v12 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 136316162;
    uint64_t v21 = v10;
    __int16 v22 = 2080;
    __int16 v23 = "-[VCSession vcSessionParticipant:audioPaused:didSucceed:error:]_block_invoke";
    __int16 v24 = 1024;
    int v25 = 1338;
    __int16 v26 = 2112;
    char v27 = v4;
    __int16 v28 = 2048;
    uint64_t v29 = v12;
    uint64_t v7 = "VCSession [%s] %s:%d %@(%p) Broadcasting audioPaused state";
    BOOL v8 = v11;
    uint32_t v9 = 48;
    goto LABEL_14;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    BOOL v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v21 = v5;
      __int16 v22 = 2080;
      __int16 v23 = "-[VCSession vcSessionParticipant:audioPaused:didSucceed:error:]_block_invoke";
      __int16 v24 = 1024;
      int v25 = 1338;
      uint64_t v7 = "VCSession [%s] %s:%d Broadcasting audioPaused state";
      BOOL v8 = v6;
      uint32_t v9 = 28;
LABEL_14:
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
    }
  }
LABEL_15:
  [*(id *)(a1 + 40) broadcastMediaStateUpdateMessage];
  if (*(unsigned char *)(a1 + 57)) {
    uint64_t v13 = @"VCSessionMessageAudioPaused";
  }
  else {
    uint64_t v13 = @"VCSessionMessageAudioUnpaused";
  }
  [*(id *)(a1 + 40) broadcastSingleStateMessage:v13 withTopic:@"VCSessionMessageTopicAudioPausedState"];
LABEL_19:
  [*(id *)(a1 + 40) reportingSessionParticipantEvent:172 withParticipant:*(void *)(a1 + 32)];
  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v15 = *(NSObject **)(v14 + 184);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __63__VCSession_vcSessionParticipant_audioPaused_didSucceed_error___block_invoke_203;
  v17[3] = &unk_1E6DB7AA0;
  char v18 = *(unsigned char *)(a1 + 57);
  uint64_t v16 = *(void *)(a1 + 32);
  v17[4] = v14;
  v17[5] = v16;
  char v19 = *(unsigned char *)(a1 + 56);
  v17[6] = *(void *)(a1 + 48);
  dispatch_async(v15, v17);
}

uint64_t __63__VCSession_vcSessionParticipant_audioPaused_didSucceed_error___block_invoke_203(uint64_t a1)
{
  char v2 = *(unsigned char **)(a1 + 32);
  if (v2[409])
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2, "transportSession"), "connectionManager"), "setConnectionPause:isLocalConnection:", *(unsigned __int8 *)(a1 + 56), 1);
    char v2 = *(unsigned char **)(a1 + 32);
  }
  uint64_t v3 = (void *)[v2 delegate];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) uuid];
  uint64_t v6 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 57);
  uint64_t v8 = *(void *)(a1 + 48);

  return [v3 vcSession:v4 participantID:v5 audioPaused:v6 didSucceed:v7 error:v8];
}

- (void)vcSessionParticipant:(id)a3 videoPaused:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__VCSession_vcSessionParticipant_videoPaused_didSucceed_error___block_invoke;
  block[3] = &unk_1E6DB7AA0;
  BOOL v8 = a5;
  block[4] = a3;
  void block[5] = self;
  BOOL v9 = a4;
  void block[6] = a6;
  dispatch_async(sessionQueue, block);
}

void __63__VCSession_vcSessionParticipant_videoPaused_didSucceed_error___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  char v2 = *(unsigned char *)(a1 + 56);
  if (v2)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(a1 + 40);
    if (v4 != v3[30])
    {
      objc_msgSend(v3, "mediaStateChangedForParticipant:");
LABEL_19:
      [*(id *)(a1 + 40) reportingSessionParticipantEvent:173 withParticipant:*(void *)(a1 + 32)];
      char v2 = *(unsigned char *)(a1 + 56);
      goto LABEL_20;
    }
    if (objc_opt_class() == *(void *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7
        || (uint64_t v6 = VRTraceErrorLogLevelToCSTR(),
            uint64_t v7 = *MEMORY[0x1E4F47A50],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)))
      {
LABEL_15:
        [*(id *)(a1 + 40) broadcastMediaStateUpdateMessage];
        if (*(unsigned char *)(a1 + 57)) {
          uint64_t v14 = @"VCSessionMessageVideoPaused";
        }
        else {
          uint64_t v14 = @"VCSessionMessageVideoUnpaused";
        }
        [*(id *)(a1 + 40) broadcastSingleStateMessage:v14 withTopic:@"VCSessionMessageTopicVideoPausedState"];
        goto LABEL_19;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v22 = v6;
      __int16 v23 = 2080;
      __int16 v24 = "-[VCSession vcSessionParticipant:videoPaused:didSucceed:error:]_block_invoke";
      __int16 v25 = 1024;
      int v26 = 1360;
      BOOL v8 = "VCSession [%s] %s:%d Broadcasting videoPaused state";
      BOOL v9 = v7;
      uint32_t v10 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v5 = (__CFString *)[*(id *)(a1 + 40) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_15;
      }
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      uint64_t v13 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136316162;
      uint64_t v22 = v11;
      __int16 v23 = 2080;
      __int16 v24 = "-[VCSession vcSessionParticipant:videoPaused:didSucceed:error:]_block_invoke";
      __int16 v25 = 1024;
      int v26 = 1360;
      __int16 v27 = 2112;
      __int16 v28 = v5;
      __int16 v29 = 2048;
      uint64_t v30 = v13;
      BOOL v8 = "VCSession [%s] %s:%d %@(%p) Broadcasting videoPaused state";
      BOOL v9 = v12;
      uint32_t v10 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
    goto LABEL_15;
  }
LABEL_20:
  uint64_t v15 = *(void *)(a1 + 40);
  uint64_t v16 = *(NSObject **)(v15 + 184);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __63__VCSession_vcSessionParticipant_videoPaused_didSucceed_error___block_invoke_213;
  v18[3] = &unk_1E6DB7AA0;
  uint64_t v17 = *(void *)(a1 + 32);
  v18[4] = v15;
  v18[5] = v17;
  char v19 = *(unsigned char *)(a1 + 57);
  char v20 = v2;
  v18[6] = *(void *)(a1 + 48);
  dispatch_async(v16, v18);
}

uint64_t __63__VCSession_vcSessionParticipant_videoPaused_didSucceed_error___block_invoke_213(uint64_t a1)
{
  char v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) uuid];
  uint64_t v5 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 57);
  uint64_t v7 = *(void *)(a1 + 48);

  return [v2 vcSession:v3 participantID:v4 videoPaused:v5 didSucceed:v6 error:v7];
}

- (void)vcSessionParticipant:(id)a3 remoteAudioPausedDidChange:(BOOL)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  notificationQueue = self->_notificationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __61__VCSession_vcSessionParticipant_remoteAudioPausedDidChange___block_invoke;
  v5[3] = &unk_1E6DB3E18;
  v5[4] = self;
  v5[5] = a3;
  BOOL v6 = a4;
  dispatch_async(notificationQueue, v5);
}

uint64_t __61__VCSession_vcSessionParticipant_remoteAudioPausedDidChange___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "reportingSessionRemoteParticipantEvent:withParticipant:value:", 176, *(void *)(a1 + 40), objc_msgSend(NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 48)));
  char v2 = *(unsigned char **)(a1 + 32);
  if (v2[409])
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2, "transportSession"), "connectionManager"), "setConnectionPause:isLocalConnection:", *(unsigned __int8 *)(a1 + 48), 0);
    char v2 = *(unsigned char **)(a1 + 32);
  }
  uint64_t v3 = (void *)[v2 delegate];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) uuid];
  uint64_t v6 = *(unsigned __int8 *)(a1 + 48);

  return [v3 vcSession:v4 participantID:v5 remoteAudioPausedDidChange:v6];
}

- (void)vcSessionParticipant:(id)a3 remoteVideoPausedDidChange:(BOOL)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__VCSession_vcSessionParticipant_remoteVideoPausedDidChange___block_invoke;
  block[3] = &unk_1E6DB3E18;
  block[4] = self;
  void block[5] = a3;
  BOOL v10 = a4;
  dispatch_async(notificationQueue, block);
  sessionQueue = self->_sessionQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__VCSession_vcSessionParticipant_remoteVideoPausedDidChange___block_invoke_2;
  v8[3] = &unk_1E6DB3E40;
  v8[4] = self;
  v8[5] = a3;
  dispatch_async(sessionQueue, v8);
}

uint64_t __61__VCSession_vcSessionParticipant_remoteVideoPausedDidChange___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "reportingSessionRemoteParticipantEvent:withParticipant:value:", 177, *(void *)(a1 + 40), objc_msgSend(NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 48)));
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSession:participantID:remoteVideoPausedDidChange:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "uuid"), *(unsigned __int8 *)(a1 + 48));
  char v2 = (void *)VCRemoteVideoManager_DefaultManager();
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v4 = [*(id *)(a1 + 40) participantVideoToken];

  return [v2 remoteVideoDidPause:v3 streamToken:v4];
}

uint64_t __61__VCSession_vcSessionParticipant_remoteVideoPausedDidChange___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) mediaStateChangedForParticipant:*(void *)(a1 + 40)];
}

- (void)vcSessionParticipant:(id)a3 didChangeMediaPriority:(unsigned __int8)a4 description:(id)a5
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__VCSession_vcSessionParticipant_didChangeMediaPriority_description___block_invoke;
  block[3] = &unk_1E6DB5238;
  block[4] = self;
  void block[5] = a3;
  unsigned __int8 v7 = a4;
  void block[6] = a5;
  dispatch_async(notificationQueue, block);
}

uint64_t __69__VCSession_vcSessionParticipant_didChangeMediaPriority_description___block_invoke(uint64_t result)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(result + 32) + 616))
  {
    uint64_t v1 = result;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v2 = VRTraceErrorLogLevelToCSTR();
      uint64_t v3 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = [*(id *)(v1 + 40) uuid];
        int v5 = *(unsigned __int8 *)(v1 + 56);
        uint64_t v6 = *(void *)(v1 + 48);
        int v7 = 136316418;
        uint64_t v8 = v2;
        __int16 v9 = 2080;
        BOOL v10 = "-[VCSession vcSessionParticipant:didChangeMediaPriority:description:]_block_invoke";
        __int16 v11 = 1024;
        int v12 = 1398;
        __int16 v13 = 2112;
        uint64_t v14 = v4;
        __int16 v15 = 1024;
        int v16 = v5;
        __int16 v17 = 2112;
        uint64_t v18 = v6;
        _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Participant=%@ didChangeMediaPriority=%d, description=%@", (uint8_t *)&v7, 0x36u);
      }
    }
    return objc_msgSend((id)objc_msgSend(*(id *)(v1 + 32), "delegate"), "vcSession:participantID:didChangeMediaPriority:description:", *(void *)(v1 + 32), objc_msgSend(*(id *)(v1 + 40), "uuid"), *(unsigned __int8 *)(v1 + 56), *(void *)(v1 + 48));
  }
  return result;
}

- (void)vcSessionParticipant:(id)a3 didChangeActualNetworkBitrateForStreamGroupID:(unsigned int)a4
{
}

- (void)vcSessionParticipant:(id)a3 requestKeyFrameGenerationWithStreamID:(unsigned __int16)a4 streamGroupID:(unsigned int)a5 firType:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    int v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v16 = v11;
      __int16 v17 = 2080;
      uint64_t v18 = "-[VCSession vcSessionParticipant:requestKeyFrameGenerationWithStreamID:streamGroupID:firType:]";
      __int16 v19 = 1024;
      int v20 = 1409;
      __int16 v21 = 2112;
      uint64_t v22 = [a3 uuid];
      __int16 v23 = 1024;
      int v24 = v8;
      __int16 v25 = 1024;
      int v26 = v6;
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Participant:%@ requestKeyFrameGenerationWithStreamID:%d FIRType:%d", buf, 0x32u);
    }
  }
  v14[0] = objc_msgSend(NSNumber, "numberWithUnsignedShort:", v8, @"VCSessionMessageStreamID");
  v13[1] = @"VCSessionMessageFIRType";
  v14[1] = [NSNumber numberWithInt:v6];
  v13[2] = @"VCSessionMesageStreamGroupID";
  v14[2] = [NSNumber numberWithUnsignedInt:v7];
  -[VCSessionMessaging sendMessageDictionary:withTopic:participantID:](self->_sessionMessaging, "sendMessageDictionary:withTopic:participantID:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3], @"VCSessionMessageTopicGenerateKeyFrame", objc_msgSend(a3, "idsParticipantID"));
  [(VCSession *)self reportingSessionParticipantEvent:232 withParticipant:a3 streamGroupID:v7 streamID:v8];
}

- (void)vcSessionParticipant:(id)a3 didSwitchFromStreamID:(unsigned __int16)a4 toStreamID:(unsigned __int16)a5
{
  v6[5] = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__VCSession_vcSessionParticipant_didSwitchFromStreamID_toStreamID___block_invoke;
  void v6[3] = &unk_1E6DB3DC8;
  v6[4] = self;
  dispatch_async(sessionQueue, v6);
}

unsigned char *__67__VCSession_vcSessionParticipant_didSwitchFromStreamID_toStreamID___block_invoke(uint64_t a1)
{
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (!result[409]) {
    return (unsigned char *)[result distributeBitrateAndOptInToStreamIDsWithSeamlessTransition:1];
  }
  return result;
}

- (void)vcSessionParticipant:(id)a3 didRequestVideoRedundancy:(BOOL)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __60__VCSession_vcSessionParticipant_didRequestVideoRedundancy___block_invoke;
  v5[3] = &unk_1E6DB3E18;
  BOOL v6 = a4;
  v5[4] = self;
  v5[5] = a3;
  dispatch_async(sessionQueue, v5);
}

uint64_t __60__VCSession_vcSessionParticipant_didRequestVideoRedundancy___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 409))
  {
    [(id)v2 distributeBitrateAndOptInToStreamIDsWithSeamlessTransition:0];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v3 = @"VCSessionMessageVideoRedundancyRequested";
  }
  else {
    uint64_t v3 = @"VCSessionMessageVideoRedundancyDismissed";
  }
  uint64_t v4 = *(void **)(v2 + 224);
  uint64_t v5 = [*(id *)(a1 + 40) idsParticipantID];

  return [v4 sendMessage:v3 withTopic:@"VCSessionMessageTopicVideoRedundancyState" participantID:v5];
}

- (void)vcSessionParticipantDidChangeSendingStreams:(id)a3
{
  v4[5] = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__VCSession_vcSessionParticipantDidChangeSendingStreams___block_invoke;
  v4[3] = &unk_1E6DB3DC8;
  v4[4] = self;
  dispatch_async(sessionQueue, v4);
}

uint64_t __57__VCSession_vcSessionParticipantDidChangeSendingStreams___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) calculateExpectedTotalNetworkBitrateUplink];
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 416);

  return [v3 setExpectedBitrate:v2];
}

- (void)vcSessionParticipantDidChangeReceivingStreams:(id)a3
{
  v4[5] = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__VCSession_vcSessionParticipantDidChangeReceivingStreams___block_invoke;
  v4[3] = &unk_1E6DB3DC8;
  v4[4] = self;
  dispatch_async(sessionQueue, v4);
}

uint64_t __59__VCSession_vcSessionParticipantDidChangeReceivingStreams___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) calculateExpectedTotalNetworkBitrateDownlink];
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 424);

  return [v3 setExpectedBitrate:v2];
}

- (void)vcSessionParticipantDidMediaDecryptionTimeOut:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__VCSession_vcSessionParticipantDidMediaDecryptionTimeOut___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a3;
  dispatch_async(sessionQueue, block);
}

void __59__VCSession_vcSessionParticipantDidMediaDecryptionTimeOut___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class() != *(void *)(a1 + 32))
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v2 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      uint64_t v2 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      goto LABEL_12;
    }
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    int v12 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    uint64_t v13 = *(void *)(a1 + 32);
    int v14 = *(_DWORD *)(v13 + 168);
    uint64_t v15 = [*(id *)(a1 + 40) uuid];
    uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 472);
    *(_DWORD *)buf = 136316930;
    uint64_t v19 = v11;
    __int16 v20 = 2080;
    __int16 v21 = "-[VCSession vcSessionParticipantDidMediaDecryptionTimeOut:]_block_invoke";
    __int16 v22 = 1024;
    int v23 = 1452;
    __int16 v24 = 2112;
    *(void *)__int16 v25 = v2;
    *(_WORD *)&v25[8] = 2048;
    *(void *)&v25[10] = v13;
    *(_WORD *)&v25[18] = 1024;
    *(_DWORD *)&v25[20] = v14;
    __int16 v26 = 2112;
    uint64_t v27 = v15;
    __int16 v28 = 2048;
    uint64_t v29 = v16;
    uint64_t v8 = "VCSession [%s] %s:%d %@(%p) Session State:%d, Participant:%@, sessionStartTime:%f";
    __int16 v9 = v12;
    uint32_t v10 = 74;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 168);
      uint64_t v6 = [*(id *)(a1 + 40) uuid];
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 472);
      *(_DWORD *)buf = 136316418;
      uint64_t v19 = v3;
      __int16 v20 = 2080;
      __int16 v21 = "-[VCSession vcSessionParticipantDidMediaDecryptionTimeOut:]_block_invoke";
      __int16 v22 = 1024;
      int v23 = 1452;
      __int16 v24 = 1024;
      *(_DWORD *)__int16 v25 = v5;
      *(_WORD *)&v25[4] = 2112;
      *(void *)&v25[6] = v6;
      *(_WORD *)&v25[14] = 2048;
      *(void *)&v25[16] = v7;
      uint64_t v8 = "VCSession [%s] %s:%d Session State:%d, Participant:%@, sessionStartTime:%f";
      __int16 v9 = v4;
      uint32_t v10 = 54;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
    }
  }
LABEL_12:
  if (*(_DWORD *)(*(void *)(a1 + 32) + 168) == 3)
  {
    double v17 = micro() - *(double *)(*(void *)(a1 + 32) + 472);
    if (v17 < (double)+[GKSConnectivitySettings getNewSessionJoiningInterval](GKSConnectivitySettings, "getNewSessionJoiningInterval"))[*(id *)(a1 + 32) dispatchedStopWithError:+[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", 12, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession.m", 1456), 0)]; {
  }
    }
}

- (void)vcSessionParticipantDidMediaDecryptionTimeOutForMKMRecovery:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__VCSession_vcSessionParticipantDidMediaDecryptionTimeOutForMKMRecovery___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a3;
  dispatch_async(sessionQueue, block);
}

void __73__VCSession_vcSessionParticipantDidMediaDecryptionTimeOutForMKMRecovery___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class() != *(void *)(a1 + 32))
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v2 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      uint64_t v2 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      goto LABEL_12;
    }
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    int v12 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    uint64_t v13 = *(void *)(a1 + 32);
    int v14 = *(_DWORD *)(v13 + 168);
    uint64_t v15 = [*(id *)(a1 + 40) uuid];
    uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 472);
    *(_DWORD *)buf = 136316930;
    uint64_t v24 = v11;
    __int16 v25 = 2080;
    __int16 v26 = "-[VCSession vcSessionParticipantDidMediaDecryptionTimeOutForMKMRecovery:]_block_invoke";
    __int16 v27 = 1024;
    int v28 = 1465;
    __int16 v29 = 2112;
    *(void *)uint64_t v30 = v2;
    *(_WORD *)&v30[8] = 2048;
    *(void *)&unsigned char v30[10] = v13;
    *(_WORD *)&v30[18] = 1024;
    *(_DWORD *)&v30[20] = v14;
    __int16 v31 = 2112;
    uint64_t v32 = v15;
    __int16 v33 = 2048;
    uint64_t v34 = v16;
    uint64_t v8 = "VCSession [%s] %s:%d %@(%p) Session State:%d, Participant:%@, sessionStartTime:%f";
    __int16 v9 = v12;
    uint32_t v10 = 74;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 168);
      uint64_t v6 = [*(id *)(a1 + 40) uuid];
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 472);
      *(_DWORD *)buf = 136316418;
      uint64_t v24 = v3;
      __int16 v25 = 2080;
      __int16 v26 = "-[VCSession vcSessionParticipantDidMediaDecryptionTimeOutForMKMRecovery:]_block_invoke";
      __int16 v27 = 1024;
      int v28 = 1465;
      __int16 v29 = 1024;
      *(_DWORD *)uint64_t v30 = v5;
      *(_WORD *)&v30[4] = 2112;
      *(void *)&v30[6] = v6;
      *(_WORD *)&v30[14] = 2048;
      *(void *)&v30[16] = v7;
      uint64_t v8 = "VCSession [%s] %s:%d Session State:%d, Participant:%@, sessionStartTime:%f";
      __int16 v9 = v4;
      uint32_t v10 = 54;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
    }
  }
LABEL_12:
  uint64_t v17 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v17 + 168) == 3)
  {
    uint64_t v18 = *(void **)(v17 + 320);
    uint64_t v22 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 40), "idsParticipantID", *(double *)(v17 + 472)));
    objc_msgSend(v18, "startMKMRecoveryForParticipantIDs:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v22, 1));
    uint64_t v19 = *(unsigned char **)(a1 + 32);
    if (!v19[409])
    {
      [v19 reportingAgent];
      __int16 v20 = @"VCSPUUID";
      uint64_t v21 = [*(id *)(a1 + 40) uuid];
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      reportingGenericEvent();
    }
  }
}

- (void)vcSessionParticipantDidRemoteMediaStallTimeout:(id)a3 duration:(double)a4
{
  v5[7] = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __69__VCSession_vcSessionParticipantDidRemoteMediaStallTimeout_duration___block_invoke;
  v5[3] = &unk_1E6DB5450;
  *(double *)&void v5[6] = a4;
  v5[4] = self;
  v5[5] = a3;
  dispatch_async(sessionQueue, v5);
}

uint64_t __69__VCSession_vcSessionParticipantDidRemoteMediaStallTimeout_duration___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t result = *(void *)(a1 + 32);
  if (!*(unsigned char *)(result + 409)) {
    return result;
  }
  if (*(double *)(a1 + 48) >= 10.0 && !*(unsigned char *)(result + 685))
  {
    int v3 = [(id)result detailedErrorCodeForNoRemotePacketsError];
    if (v3 == 25)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        uint64_t v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = *(void *)(a1 + 48);
          *(_DWORD *)buf = 136315906;
          uint64_t v24 = v7;
          __int16 v25 = 2080;
          __int16 v26 = "-[VCSession vcSessionParticipantDidRemoteMediaStallTimeout:duration:]_block_invoke";
          __int16 v27 = 1024;
          int v28 = 1490;
          __int16 v29 = 2048;
          uint64_t v30 = v9;
          _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Call is stalling for=%f seconds and only WLAN links are available", buf, 0x26u);
        }
      }
    }
    else
    {
      if (v3 == 24)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          uint64_t v4 = VRTraceErrorLogLevelToCSTR();
          int v5 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v6 = *(void *)(a1 + 48);
            *(_DWORD *)buf = 136315906;
            uint64_t v24 = v4;
            __int16 v25 = 2080;
            __int16 v26 = "-[VCSession vcSessionParticipantDidRemoteMediaStallTimeout:duration:]_block_invoke";
            __int16 v27 = 1024;
            int v28 = 1486;
            __int16 v29 = 2048;
            uint64_t v30 = v6;
            _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Call is stalling for=%f seconds and no links available", buf, 0x26u);
          }
        }
        goto LABEL_17;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        uint64_t v11 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v12 = *(void *)(a1 + 48);
          *(_DWORD *)buf = 136315906;
          uint64_t v24 = v10;
          __int16 v25 = 2080;
          __int16 v26 = "-[VCSession vcSessionParticipantDidRemoteMediaStallTimeout:duration:]_block_invoke";
          __int16 v27 = 1024;
          int v28 = 1493;
          __int16 v29 = 2048;
          uint64_t v30 = v12;
          _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Call is stalling for=%f seconds and cellular links are available", buf, 0x26u);
        }
      }
    }
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    CFDictionarySetValue(Mutable, @"SymptomReporterOptionalKeyParticipantID", (const void *)objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 40), "idsParticipantID")));
    reportingSymptom();
    *(unsigned char *)(*(void *)(a1 + 32) + 685) = 1;
    CFRelease(Mutable);
  }
LABEL_17:
  BOOL BoolValueForKey = VCDefaults_GetBoolValueForKey(@"disableFacetimeTimeout", 0);
  double v15 = *(double *)(a1 + 48);
  uint64_t result = *(void *)(a1 + 32);
  if (v15 < *(double *)(result + 648) || BoolValueForKey)
  {
    double v17 = *(double *)(result + 392);
    if (v15 < v17 || *(unsigned char *)(result + 411))
    {
      if (v15 < v17 && *(unsigned char *)(result + 411))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v18 = VRTraceErrorLogLevelToCSTR();
          uint64_t v19 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            uint64_t v24 = v18;
            __int16 v25 = 2080;
            __int16 v26 = "-[VCSession vcSessionParticipantDidRemoteMediaStallTimeout:duration:]_block_invoke";
            __int16 v27 = 1024;
            int v28 = 1513;
            _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Call is no longer stalling", buf, 0x1Cu);
          }
        }
        return [*(id *)(a1 + 32) setIsOneToOneRemoteMediaStalling:0];
      }
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v20 = VRTraceErrorLogLevelToCSTR();
        uint64_t v21 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v22 = *(void *)(a1 + 48);
          *(_DWORD *)buf = 136315906;
          uint64_t v24 = v20;
          __int16 v25 = 2080;
          __int16 v26 = "-[VCSession vcSessionParticipantDidRemoteMediaStallTimeout:duration:]_block_invoke";
          __int16 v27 = 1024;
          int v28 = 1509;
          __int16 v29 = 2048;
          uint64_t v30 = v22;
          _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Call is stalling for %f seconds trying to reconnect", buf, 0x26u);
        }
      }
      uint64_t result = [*(id *)(a1 + 32) setIsOneToOneRemoteMediaStalling:1];
      *(unsigned char *)(*(void *)(a1 + 32) + 685) = 0;
    }
  }
  else
  {
    uint64_t v16 = [(id)result detailedErrorCodeForNoRemotePacketsError];
    return [*(id *)(a1 + 32) dispatchedStopWithError:+[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", v16, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession.m", 1506), (uint64_t)*(double *)(a1 + 48))];
  }
  return result;
}

- (void)vcSessionParticipant:(id)a3 oneToOneModeDidChange:(BOOL)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v12 = v6;
      __int16 v13 = 2080;
      int v14 = "-[VCSession vcSessionParticipant:oneToOneModeDidChange:]";
      __int16 v15 = 1024;
      int v16 = 1521;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Received signal from the remote side to switch oneToOneMode", buf, 0x1Cu);
    }
  }
  sessionQueue = self->_sessionQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__VCSession_vcSessionParticipant_oneToOneModeDidChange___block_invoke;
  v9[3] = &unk_1E6DB3DF0;
  v9[4] = self;
  BOOL v10 = a4;
  dispatch_async(sessionQueue, v9);
}

uint64_t __56__VCSession_vcSessionParticipant_oneToOneModeDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedSetOneToOneModeEnabled:*(unsigned __int8 *)(a1 + 40) isLocal:0 configurationDict:0];
}

- (void)vcSessionParticipant:(id)a3 didDetectError:(id)a4
{
  v5[7] = *MEMORY[0x1E4F143B8];
  notificationQueue = self->_notificationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __49__VCSession_vcSessionParticipant_didDetectError___block_invoke;
  v5[3] = &unk_1E6DB43D8;
  v5[4] = self;
  v5[5] = a3;
  void v5[6] = a4;
  dispatch_async(notificationQueue, v5);
}

uint64_t __49__VCSession_vcSessionParticipant_didDetectError___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) uuid];
  uint64_t v5 = *(void *)(a1 + 48);

  return [v2 vcSession:v3 participantID:v4 didDetectError:v5];
}

- (void)vcSessionParticipant:(id)a3 mediaStateDidChange:(unsigned int)a4 forMediaType:(unsigned int)a5 didSucceed:(BOOL)a6 error:(id)a7
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __84__VCSession_vcSessionParticipant_mediaStateDidChange_forMediaType_didSucceed_error___block_invoke;
  v8[3] = &unk_1E6DB7AC8;
  BOOL v11 = a6;
  v8[4] = a3;
  v8[5] = self;
  unsigned int v9 = a5;
  unsigned int v10 = a4;
  void v8[6] = a7;
  dispatch_async(sessionQueue, v8);
}

void __84__VCSession_vcSessionParticipant_mediaStateDidChange_forMediaType_didSucceed_error___block_invoke(int32x2_t *a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (a1[8].i8[0])
  {
    int32x2_t v3 = a1[4];
    uint64_t v2 = (void *)a1[5];
    if (*(void *)&v3 == v2[30])
    {
      [v2 broadcastMediaStateUpdateMessage];
      [*(id *)&a1[5] updateVCMediaQueueForMediaType:a1[7].u32[0] mediaState:a1[7].u32[1]];
    }
    else
    {
      objc_msgSend(v2, "mediaStateChangedForParticipant:");
    }
  }
  else if (objc_opt_class() == *(void *)&a1[5])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __84__VCSession_vcSessionParticipant_mediaStateDidChange_forMediaType_didSucceed_error___block_invoke_cold_1(v5, (uint64_t)a1, v6);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v4 = (__CFString *)[*(id *)&a1[5] performSelector:sel_logPrefix];
    }
    else {
      uint64_t v4 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        __int32 v13 = a1[7].i32[0];
        __int32 v12 = a1[7].i32[1];
        int32x2_t v15 = a1[4];
        int32x2_t v14 = a1[5];
        int32x2_t v16 = a1[6];
        *(_DWORD *)buf = 136317186;
        uint64_t v20 = v7;
        __int16 v21 = 2080;
        uint64_t v22 = "-[VCSession vcSessionParticipant:mediaStateDidChange:forMediaType:didSucceed:error:]_block_invoke";
        __int16 v23 = 1024;
        int v24 = 1543;
        __int16 v25 = 2112;
        __int16 v26 = v4;
        __int16 v27 = 2048;
        int32x2_t v28 = v14;
        __int16 v29 = 1024;
        __int32 v30 = v12;
        __int16 v31 = 1024;
        __int32 v32 = v13;
        __int16 v33 = 2112;
        int32x2_t v34 = v15;
        __int16 v35 = 2112;
        int32x2_t v36 = v16;
        _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, "VCSession [%s] %s:%d %@(%p) Error updating media state=%d for media type=%d, participant=%@, error=%@", buf, 0x50u);
      }
    }
  }
  int32x2_t v9 = a1[5];
  unsigned int v10 = *(NSObject **)(*(void *)&v9 + 184);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__VCSession_vcSessionParticipant_mediaStateDidChange_forMediaType_didSucceed_error___block_invoke_238;
  block[3] = &unk_1E6DB7AC8;
  int32x2_t v11 = a1[4];
  block[4] = v9;
  void block[5] = v11;
  void block[7] = vrev64_s32(a1[7]);
  __int8 v18 = a1[8].i8[0];
  void block[6] = a1[6];
  dispatch_async(v10, block);
}

uint64_t __84__VCSession_vcSessionParticipant_mediaStateDidChange_forMediaType_didSucceed_error___block_invoke_238(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) uuid];
  uint64_t v5 = *(unsigned int *)(a1 + 56);
  uint64_t v6 = *(unsigned int *)(a1 + 60);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 48);

  return [v2 vcSession:v3 participantID:v4 mediaStateDidChange:v5 forMediaType:v6 didSucceed:v7 error:v8];
}

- (void)vcSessionParticipant:(id)a3 remoteMediaStateDidChange:(unsigned int)a4 forMediaType:(unsigned int)a5
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__VCSession_vcSessionParticipant_remoteMediaStateDidChange_forMediaType___block_invoke;
  void v6[3] = &unk_1E6DB5450;
  v6[4] = self;
  v6[5] = a3;
  unsigned int v7 = a4;
  unsigned int v8 = a5;
  dispatch_async(sessionQueue, v6);
}

void __73__VCSession_vcSessionParticipant_remoteMediaStateDidChange_forMediaType___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) mediaStateChangedForParticipant:*(void *)(a1 + 40)];
  long long v2 = *(_OWORD *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 184);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __73__VCSession_vcSessionParticipant_remoteMediaStateDidChange_forMediaType___block_invoke_2;
  v4[3] = &unk_1E6DB5450;
  long long v5 = v2;
  uint64_t v6 = *(void *)(a1 + 48);
  dispatch_async(v3, v4);
}

uint64_t __73__VCSession_vcSessionParticipant_remoteMediaStateDidChange_forMediaType___block_invoke_2(uint64_t a1)
{
  long long v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) uuid];
  uint64_t v5 = *(unsigned int *)(a1 + 48);
  uint64_t v6 = *(unsigned int *)(a1 + 52);

  return [v2 vcSession:v3 participantID:v4 remoteMediaStateDidChange:v5 forMediaType:v6];
}

- (void)vcSessionParticipant:(id)a3 mediaMixingDidChangeForMediaType:(unsigned int)a4 mixingMediaType:(unsigned int)a5
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __83__VCSession_vcSessionParticipant_mediaMixingDidChangeForMediaType_mixingMediaType___block_invoke;
  void v6[3] = &unk_1E6DB5450;
  v6[4] = a3;
  v6[5] = self;
  unsigned int v7 = a4;
  unsigned int v8 = a5;
  dispatch_async(sessionQueue, v6);
}

void __83__VCSession_vcSessionParticipant_mediaMixingDidChangeForMediaType_mixingMediaType___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  if (v3 == *(void *)(v2 + 240))
  {
    if (objc_opt_class() == *(void *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_13;
      }
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v16 = v5;
      __int16 v17 = 2080;
      __int8 v18 = "-[VCSession vcSessionParticipant:mediaMixingDidChangeForMediaType:mixingMediaType:]_block_invoke";
      __int16 v19 = 1024;
      int v20 = 1563;
      unsigned int v7 = "VCSession [%s] %s:%d Broadcasting mediaMixingDidChangeForMediaType state";
      unsigned int v8 = v6;
      uint32_t v9 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v4 = (__CFString *)[*(id *)(a1 + 40) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v4 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_13;
      }
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      int32x2_t v11 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136316162;
      uint64_t v16 = v10;
      __int16 v17 = 2080;
      __int8 v18 = "-[VCSession vcSessionParticipant:mediaMixingDidChangeForMediaType:mixingMediaType:]_block_invoke";
      __int16 v19 = 1024;
      int v20 = 1563;
      __int16 v21 = 2112;
      uint64_t v22 = v4;
      __int16 v23 = 2048;
      uint64_t v24 = v12;
      unsigned int v7 = "VCSession [%s] %s:%d %@(%p) Broadcasting mediaMixingDidChangeForMediaType state";
      unsigned int v8 = v11;
      uint32_t v9 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
LABEL_13:
    [*(id *)(a1 + 40) broadcastMediaStateUpdateMessage];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v2 = *(void *)(a1 + 40);
  }
  __int32 v13 = *(NSObject **)(v2 + 184);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__VCSession_vcSessionParticipant_mediaMixingDidChangeForMediaType_mixingMediaType___block_invoke_239;
  block[3] = &unk_1E6DB5450;
  block[4] = v2;
  void block[5] = v3;
  void block[6] = *(void *)(a1 + 48);
  dispatch_async(v13, block);
}

uint64_t __83__VCSession_vcSessionParticipant_mediaMixingDidChangeForMediaType_mixingMediaType___block_invoke_239(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) uuid];
  uint64_t v5 = *(unsigned int *)(a1 + 48);
  uint64_t v6 = *(unsigned int *)(a1 + 52);

  return [v2 vcSession:v3 participantID:v4 mixingDidChangeForMediaType:v5 mixingMediaType:v6];
}

- (void)vcSessionParticipant:(id)a3 reactionDidStart:(id)a4
{
  v5[7] = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __51__VCSession_vcSessionParticipant_reactionDidStart___block_invoke;
  v5[3] = &unk_1E6DB43D8;
  v5[4] = a3;
  v5[5] = self;
  void v5[6] = a4;
  dispatch_async(sessionQueue, v5);
}

void __51__VCSession_vcSessionParticipant_reactionDidStart___block_invoke(uint64_t a1)
{
  v30[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2 == *(void *)(v3 + 240))
  {
    uint64_t v4 = *(void *)(a1 + 48);
    __int16 v29 = @"VCSessionMessageReactionStarted";
    v30[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
    if (objc_opt_class() == *(void *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_13;
      }
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      unsigned int v8 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 136315906;
      uint64_t v18 = v7;
      __int16 v19 = 2080;
      int v20 = "-[VCSession vcSessionParticipant:reactionDidStart:]_block_invoke";
      __int16 v21 = 1024;
      int v22 = 1576;
      __int16 v23 = 2112;
      uint64_t v24 = v5;
      uint32_t v9 = "VCSession [%s] %s:%d Broadcasting reactionDidStart status=%@";
      uint64_t v10 = v8;
      uint32_t v11 = 38;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v6 = (__CFString *)[*(id *)(a1 + 40) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_13;
      }
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      __int32 v13 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136316418;
      uint64_t v18 = v12;
      __int16 v19 = 2080;
      int v20 = "-[VCSession vcSessionParticipant:reactionDidStart:]_block_invoke";
      __int16 v21 = 1024;
      int v22 = 1576;
      __int16 v23 = 2112;
      uint64_t v24 = (uint64_t)v6;
      __int16 v25 = 2048;
      uint64_t v26 = v14;
      __int16 v27 = 2112;
      uint64_t v28 = v5;
      uint32_t v9 = "VCSession [%s] %s:%d %@(%p) Broadcasting reactionDidStart status=%@";
      uint64_t v10 = v13;
      uint32_t v11 = 58;
    }
    _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
LABEL_13:
    [*(id *)(a1 + 40) broadcastMessageDictionary:v5 withTopic:@"VCSessionMessageReactionStateTopic"];
    [*(id *)(a1 + 40) reportingAgent];
    reportingVideoFeatureToggle();
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
  }
  int32x2_t v15 = *(NSObject **)(v3 + 184);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__VCSession_vcSessionParticipant_reactionDidStart___block_invoke_249;
  block[3] = &unk_1E6DB43D8;
  block[4] = v3;
  void block[5] = v2;
  void block[6] = *(void *)(a1 + 48);
  dispatch_async(v15, block);
}

uint64_t __51__VCSession_vcSessionParticipant_reactionDidStart___block_invoke_249(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) uuid];
  uint64_t v5 = *(void *)(a1 + 48);

  return [v2 vcSession:v3 participantID:v4 reactionDidStart:v5];
}

- (void)vcSessionParticipantDidStopReacting:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__VCSession_vcSessionParticipantDidStopReacting___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = a3;
  void block[5] = self;
  dispatch_async(sessionQueue, block);
}

void __49__VCSession_vcSessionParticipantDidStopReacting___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  if (v3 == *(void *)(v2 + 240))
  {
    if (objc_opt_class() == *(void *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_13;
      }
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v16 = v5;
      __int16 v17 = 2080;
      uint64_t v18 = "-[VCSession vcSessionParticipantDidStopReacting:]_block_invoke";
      __int16 v19 = 1024;
      int v20 = 1590;
      uint64_t v7 = "VCSession [%s] %s:%d Broadcasting didStopReacting";
      unsigned int v8 = v6;
      uint32_t v9 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v4 = (__CFString *)[*(id *)(a1 + 40) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v4 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_13;
      }
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint32_t v11 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136316162;
      uint64_t v16 = v10;
      __int16 v17 = 2080;
      uint64_t v18 = "-[VCSession vcSessionParticipantDidStopReacting:]_block_invoke";
      __int16 v19 = 1024;
      int v20 = 1590;
      __int16 v21 = 2112;
      int v22 = v4;
      __int16 v23 = 2048;
      uint64_t v24 = v12;
      uint64_t v7 = "VCSession [%s] %s:%d %@(%p) Broadcasting didStopReacting";
      unsigned int v8 = v11;
      uint32_t v9 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
LABEL_13:
    [*(id *)(a1 + 40) broadcastMessageDictionary:&unk_1F3DC8CA0 withTopic:@"VCSessionMessageReactionStateTopic"];
    [*(id *)(a1 + 40) reportingAgent];
    reportingVideoFeatureToggle();
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v2 = *(void *)(a1 + 40);
  }
  __int32 v13 = *(NSObject **)(v2 + 184);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __49__VCSession_vcSessionParticipantDidStopReacting___block_invoke_254;
  void v14[3] = &unk_1E6DB3E40;
  v14[4] = v2;
  v14[5] = v3;
  dispatch_async(v13, v14);
}

uint64_t __49__VCSession_vcSessionParticipantDidStopReacting___block_invoke_254(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) uuid];

  return [v2 vcSession:v3 participantDidStopReacting:v4];
}

- (void)vcSessionParticipantDidMediaReceiveFlushRequestWithPayloads:(id)a3
{
  if (self->_oneToOneModeEnabled
    && -[VCTransportSession flushBasebandQueueWithPayloads:flushCount:](self->_transportSession, "flushBasebandQueueWithPayloads:flushCount:")&& (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCSession vcSessionParticipantDidMediaReceiveFlushRequestWithPayloads:]();
    }
  }
}

- (void)serverDidDie
{
  v3[5] = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __25__VCSession_serverDidDie__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(sessionQueue, v3);
}

uint64_t __25__VCSession_serverDidDie__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 808))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 808) = 1;
    [*(id *)(result + 32) reportingAgent];
    reportingSymptom();
    id v3 = +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", 23, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession.m", 1632), 0);
    uint64_t v4 = *(void **)(v2 + 32);
    return [v4 dispatchedStopWithError:v3 didRemoteCancel:0];
  }
  return result;
}

- (void)didReceivedSessionStatsAtTime:(double)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v9 = 0;
  long long v7 = 0u;
  long long v8 = 0u;
  [(VCSession *)self updateNetworkFeedbackControllerReport:&v7];
  feedbackController = self->_feedbackController;
  v5[0] = v7;
  v5[1] = v8;
  int v6 = v9;
  [(VCNetworkFeedbackController *)feedbackController sendFeedbackControllerReport:v5];
}

- (void)updateNetworkFeedbackControllerReport:(id *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  a3->int var0 = self->_currentConnectionType == 3;
  uint64_t v16 = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  VCRateControlGetStatistics((uint64_t)[(AVCRateController *)self->_uplinkRateController statisticsCollector], 5, (uint64_t)&v7);
  unsigned int v5 = (*(double *)&v9 * 100.0);
  a3->var5 = self->_uplinkTargetBitrate;
  a3->var6 = v5;
  a3->var7 = HIDWORD(v8);
  a3->var8 = [(AVCStatisticsCollector *)[(AVCRateController *)self->_uplinkRateController statisticsCollector] estimatedBandwidthCap] != 0;
  VCRateControlGetStatistics((uint64_t)[(AVCRateController *)self->_downlinkRateController statisticsCollector], 5, (uint64_t)&v7);
  unsigned int v6 = (*(double *)&v9 * 100.0);
  a3->int var1 = self->_downlinkTargetBitrate;
  a3->int var2 = v6;
  a3->int var3 = HIDWORD(v8);
  a3->int var4 = [(AVCStatisticsCollector *)[(AVCRateController *)self->_downlinkRateController statisticsCollector] estimatedBandwidthCap] != 0;
}

- (void)rateController:(id)a3 targetBitrateDidChange:(unsigned int)a4 rateChangeCounter:(unsigned int)a5
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__VCSession_rateController_targetBitrateDidChange_rateChangeCounter___block_invoke;
  void v6[3] = &unk_1E6DB5450;
  v6[4] = a3;
  v6[5] = self;
  unsigned int v7 = a4;
  unsigned int v8 = a5;
  dispatch_async(sessionQueue, v6);
}

void __69__VCSession_rateController_targetBitrateDidChange_rateChangeCounter___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "statisticsCollector"), "mode") == 4)
  {
    *(_DWORD *)(*(void *)(a1 + 40) + 432) = *(_DWORD *)(a1 + 48);
    [*(id *)(*(void *)(a1 + 40) + 240) updateUplinkTargetBitrate:*(unsigned int *)(a1 + 48) rateChangeCounter:*(unsigned int *)(a1 + 52)];
    [*(id *)(a1 + 40) reportingSessionParticipantEvent:160 withParticipant:0];
    [*(id *)(*(void *)(a1 + 40) + 280) setClientTargetBitrate:*(unsigned int *)(a1 + 48)];
    uint64_t v2 = *(void *)(a1 + 40);
    uint64_t v3 = *(unsigned int *)(v2 + 432);
LABEL_9:
    [(id)v2 setMediaQueuePeakBitrateWithTargetBitrate:v3];
    goto LABEL_21;
  }
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "statisticsCollector"), "mode") == 5)
  {
    if (objc_opt_class() == *(void *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_18;
      }
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      unsigned int v6 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      int v7 = *(_DWORD *)(*(void *)(a1 + 40) + 436);
      int v8 = *(_DWORD *)(a1 + 48);
      *(_DWORD *)buf = 136316162;
      uint64_t v25 = v5;
      __int16 v26 = 2080;
      __int16 v27 = "-[VCSession rateController:targetBitrateDidChange:rateChangeCounter:]_block_invoke";
      __int16 v28 = 1024;
      int v29 = 1673;
      __int16 v30 = 1024;
      *(_DWORD *)__int16 v31 = v7;
      *(_WORD *)&v31[4] = 1024;
      *(_DWORD *)&v31[6] = v8;
      uint64_t v9 = "VCSession [%s] %s:%d Downlink TargetBitrate changed from %u to %u";
      long long v10 = v6;
      uint32_t v11 = 40;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v4 = (__CFString *)[*(id *)(a1 + 40) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v4 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_18;
      }
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      long long v13 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      uint64_t v14 = *(void *)(a1 + 40);
      int v15 = *(_DWORD *)(v14 + 436);
      int v16 = *(_DWORD *)(a1 + 48);
      *(_DWORD *)buf = 136316674;
      uint64_t v25 = v12;
      __int16 v26 = 2080;
      __int16 v27 = "-[VCSession rateController:targetBitrateDidChange:rateChangeCounter:]_block_invoke";
      __int16 v28 = 1024;
      int v29 = 1673;
      __int16 v30 = 2112;
      *(void *)__int16 v31 = v4;
      *(_WORD *)&v31[8] = 2048;
      uint64_t v32 = v14;
      __int16 v33 = 1024;
      int v34 = v15;
      __int16 v35 = 1024;
      int v36 = v16;
      uint64_t v9 = "VCSession [%s] %s:%d %@(%p) Downlink TargetBitrate changed from %u to %u";
      long long v10 = v13;
      uint32_t v11 = 60;
    }
    _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
LABEL_18:
    *(_DWORD *)(*(void *)(a1 + 40) + 436) = *(_DWORD *)(a1 + 48);
    [*(id *)(a1 + 40) reportingSessionParticipantEvent:181 withParticipant:0];
    uint64_t v17 = *(void *)(a1 + 40);
    if (!*(unsigned char *)(v17 + 409))
    {
      [(id)v17 distributeBitrateAndOptInToStreamIDsWithSeamlessTransition:0];
      uint64_t v17 = *(void *)(a1 + 40);
    }
    [*(id *)(v17 + 280) setDownlinkTargetBitrate:*(unsigned int *)(v17 + 436)];
    goto LABEL_21;
  }
  [*(id *)(*(void *)(a1 + 40) + 240) updateTargetBitrateOneToOne:*(unsigned int *)(a1 + 48) rateChangeCounter:*(unsigned int *)(a1 + 52)];
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v2 + 409))
  {
    uint64_t v3 = *(unsigned int *)(a1 + 48);
    goto LABEL_9;
  }
LABEL_21:
  if ([*(id *)(*(void *)(a1 + 40) + 232) sessionMode] == 2
    || ![*(id *)(*(void *)(a1 + 40) + 232) sessionMode])
  {
    v22[0] = @"Targetbitrate";
    v23[0] = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
    v22[1] = @"BandwidthEstimation";
    v23[1] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "statisticsCollector"), "sharedEstimatedBandwidth"));
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
    uint64_t v19 = *(void *)(a1 + 40);
    int v20 = *(NSObject **)(v19 + 184);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__VCSession_rateController_targetBitrateDidChange_rateChangeCounter___block_invoke_255;
    block[3] = &unk_1E6DB43D8;
    block[4] = *(void *)(a1 + 32);
    void block[5] = v19;
    void block[6] = v18;
    dispatch_async(v20, block);
  }
}

uint64_t __69__VCSession_rateController_targetBitrateDidChange_rateChangeCounter___block_invoke_255(uint64_t a1)
{
  int v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "statisticsCollector"), "mode");
  uint64_t v3 = (void *)[*(id *)(a1 + 40) delegate];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  if (v2 == 4)
  {
    return [v3 vcSession:v4 uplinkRateAdaptationDidChangeWithInfo:v5];
  }
  else
  {
    return [v3 vcSession:v4 downlinkRateAdaptationDidChangeWithInfo:v5];
  }
}

- (int)learntBitrateForSegment:(id)a3 defaultValue:(int)a4
{
  [(VCObject *)self reportingAgent];

  return reportingGetLearntBitrateForSegment();
}

- (void)rateController:(id)a3 isECNEnabled:(BOOL)isECNForcedByNetwork isECNCapable:(BOOL)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (self->_oneToOneSettings.rateController == a3 && self->_isECNCapable)
  {
    if (self->_ecnLinkType == 3) {
      isECNForcedByNetwork = self->_isECNForcedByNetwork;
    }
    self->_BOOL isECNEnabled = isECNForcedByNetwork;
    if (self->_isECNCapable)
    {
      self->_BOOL isECNCapable = a5;
      isECNForcedByNetwork = self->_isECNEnabled;
    }
    int v6 = VCMediaQueue_SetECNEnabled((uint64_t)self->_mediaQueue, isECNForcedByNetwork);
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (!v6 || ErrorLogLevelForModule >= 3)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      if (v6)
      {
        long long v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          BOOL isECNCapable = self->_isECNCapable;
          int ecnLinkType = self->_ecnLinkType;
          BOOL isECNEnabled = self->_isECNEnabled;
          int v27 = 136316674;
          if (isECNCapable) {
            uint64_t v14 = "YES";
          }
          else {
            uint64_t v14 = "NO";
          }
          uint64_t v28 = v9;
          if (isECNEnabled) {
            int v15 = "YES";
          }
          else {
            int v15 = "NO";
          }
          __int16 v29 = 2080;
          __int16 v30 = "-[VCSession rateController:isECNEnabled:isECNCapable:]";
          __int16 v31 = 1024;
          int v32 = 1715;
          __int16 v33 = 2080;
          int v34 = v14;
          __int16 v35 = 1024;
          int v36 = ecnLinkType;
          __int16 v37 = 2080;
          uint64_t v38 = v15;
          __int16 v39 = 2080;
          uint64_t v40 = "FAILED";
LABEL_30:
          _os_log_error_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_ERROR, "VCSession [%s] %s:%d VCRC current ECN status: _isECNCapable=%s and _ecnLinkType=%d, changing ECN status isECNEnabled=%s, VCMediaQueue set isECNEnabled=%s", (uint8_t *)&v27, 0x40u);
        }
      }
      else
      {
        char IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
        long long v10 = *MEMORY[0x1E4F47A50];
        if (IsOSFaultDisabled)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            BOOL v17 = self->_isECNCapable;
            int v18 = self->_ecnLinkType;
            BOOL v19 = self->_isECNEnabled;
            int v27 = 136316674;
            if (v17) {
              int v20 = "YES";
            }
            else {
              int v20 = "NO";
            }
            uint64_t v28 = v9;
            if (v19) {
              __int16 v21 = "YES";
            }
            else {
              __int16 v21 = "NO";
            }
            __int16 v29 = 2080;
            __int16 v30 = "-[VCSession rateController:isECNEnabled:isECNCapable:]";
            __int16 v31 = 1024;
            int v32 = 1715;
            __int16 v33 = 2080;
            int v34 = v20;
            __int16 v35 = 1024;
            int v36 = v18;
            __int16 v37 = 2080;
            uint64_t v38 = v21;
            __int16 v39 = 2080;
            uint64_t v40 = "PASS";
            goto LABEL_30;
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
        {
          BOOL v22 = self->_isECNCapable;
          int v23 = self->_ecnLinkType;
          BOOL v24 = self->_isECNEnabled;
          int v27 = 136316674;
          if (v22) {
            uint64_t v25 = "YES";
          }
          else {
            uint64_t v25 = "NO";
          }
          uint64_t v28 = v9;
          if (v24) {
            __int16 v26 = "YES";
          }
          else {
            __int16 v26 = "NO";
          }
          __int16 v29 = 2080;
          __int16 v30 = "-[VCSession rateController:isECNEnabled:isECNCapable:]";
          __int16 v31 = 1024;
          int v32 = 1715;
          __int16 v33 = 2080;
          int v34 = v25;
          __int16 v35 = 1024;
          int v36 = v23;
          __int16 v37 = 2080;
          uint64_t v38 = v26;
          __int16 v39 = 2080;
          uint64_t v40 = "PASS";
          _os_log_fault_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_FAULT, "VCSession [%s] %s:%d VCRC current ECN status: _isECNCapable=%s and _ecnLinkType=%d, changing ECN status isECNEnabled=%s, VCMediaQueue set isECNEnabled=%s", (uint8_t *)&v27, 0x40u);
        }
      }
    }
  }
}

- (void)mediaController:(void *)a3 mediaSuggestionDidChange:(VCRateControlMediaSuggestion)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  VCRateControlMediaSuggestion v28 = a4;
  if (self->_oneToOneSettings.mediaController == a3)
  {
    [(VCSessionParticipantLocal *)self->_localParticipant setMediaSuggestion:&v28];
    return;
  }
  if ((*(_DWORD *)&a4.var0 & 0xFF000000) == 0)
  {
    int v6 = 0;
    goto LABEL_16;
  }
  int v6 = [(VCSession *)self flushBasebandWithPayloads:[(VCSessionParticipantLocal *)self->_localParticipant videoPayloadTypes]];
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        long long v10 = [(VCSessionParticipantLocal *)self->_localParticipant videoPayloadTypes];
        *(_DWORD *)buf = 136316162;
        uint64_t v30 = v8;
        __int16 v31 = 2080;
        int v32 = "-[VCSession mediaController:mediaSuggestionDidChange:]";
        __int16 v33 = 1024;
        int v34 = 1731;
        __int16 v35 = 2112;
        int v36 = v10;
        __int16 v37 = 1024;
        LODWORD(v38) = v6;
        uint32_t v11 = "VCSession [%s] %s:%d flush baseband for videoPayloads:%@, successfulFlushCount: %d";
        uint64_t v12 = v9;
        uint32_t v13 = 44;
LABEL_15:
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      int v7 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      int v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      int v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v16 = [(VCSessionParticipantLocal *)self->_localParticipant videoPayloadTypes];
        *(_DWORD *)buf = 136316674;
        uint64_t v30 = v14;
        __int16 v31 = 2080;
        int v32 = "-[VCSession mediaController:mediaSuggestionDidChange:]";
        __int16 v33 = 1024;
        int v34 = 1731;
        __int16 v35 = 2112;
        int v36 = v7;
        __int16 v37 = 2048;
        uint64_t v38 = self;
        __int16 v39 = 2112;
        uint64_t v40 = v16;
        __int16 v41 = 1024;
        int v42 = v6;
        uint32_t v11 = "VCSession [%s] %s:%d %@(%p) flush baseband for videoPayloads:%@, successfulFlushCount: %d";
        uint64_t v12 = v15;
        uint32_t v13 = 64;
        goto LABEL_15;
      }
    }
  }
LABEL_16:
  if ((*(void *)&a4 & 0xFF00000000) == 0) {
    return;
  }
  int v17 = [(VCSession *)self flushBasebandWithPayloads:[(VCSessionParticipantLocal *)self->_localParticipant audioPayloadTypes]]+ v6;
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      int v20 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        __int16 v21 = [(VCSessionParticipantLocal *)self->_localParticipant audioPayloadTypes];
        *(_DWORD *)buf = 136316162;
        uint64_t v30 = v19;
        __int16 v31 = 2080;
        int v32 = "-[VCSession mediaController:mediaSuggestionDidChange:]";
        __int16 v33 = 1024;
        int v34 = 1735;
        __int16 v35 = 2112;
        int v36 = v21;
        __int16 v37 = 1024;
        LODWORD(v38) = v17;
        BOOL v22 = "VCSession [%s] %s:%d flush baseband for audioPayloads:%@, successfulFlushCount: %d";
        int v23 = v20;
        uint32_t v24 = 44;
LABEL_27:
        _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      int v18 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      int v18 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v25 = VRTraceErrorLogLevelToCSTR();
      __int16 v26 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v27 = [(VCSessionParticipantLocal *)self->_localParticipant audioPayloadTypes];
        *(_DWORD *)buf = 136316674;
        uint64_t v30 = v25;
        __int16 v31 = 2080;
        int v32 = "-[VCSession mediaController:mediaSuggestionDidChange:]";
        __int16 v33 = 1024;
        int v34 = 1735;
        __int16 v35 = 2112;
        int v36 = v18;
        __int16 v37 = 2048;
        uint64_t v38 = self;
        __int16 v39 = 2112;
        uint64_t v40 = v27;
        __int16 v41 = 1024;
        int v42 = v17;
        BOOL v22 = "VCSession [%s] %s:%d %@(%p) flush baseband for audioPayloads:%@, successfulFlushCount: %d";
        int v23 = v26;
        uint32_t v24 = 64;
        goto LABEL_27;
      }
    }
  }
}

- (int)flushBasebandWithPayloads:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v12 = 0;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v3 = [a3 countByEnumeratingWithState:&v16 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(a3);
        }
        uint64_t v7 = *(void *)(*((void *)&v16 + 1) + 8 * v6);
        v13[0] = @"transportSessionBasebandQueueFlushPayloadType";
        v13[1] = @"transportSessionBasebandQueueFlushPayloadTypeFieldOffset";
        v14[0] = v7;
        v14[1] = &unk_1F3DC49F8;
        v13[2] = @"transportSessionBasebandQueueFlushTransactionID";
        v14[2] = [NSNumber numberWithUnsignedInt:self->_basebandFlushTransactionID];
        void v14[3] = &unk_1F3DC4A10;
        void v13[3] = @"transportSessionBasebandQueueFlushCriterion";
        v13[4] = @"transportSessionBasebandQueueFlushTimestamp";
        v14[4] = &unk_1F3DC4A10;
        objc_msgSend(v10, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v14, v13, 5));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [a3 countByEnumeratingWithState:&v16 objects:v15 count:16];
    }
    while (v4);
  }
  [(VCTransportSession *)self->_transportSession flushBasebandQueueWithPayloads:v10 flushCount:&v12];

  ++self->_basebandFlushTransactionID;
  return v12;
}

- (void)updatePresentationInfo:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__VCSession_updatePresentationInfo___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a3;
  dispatch_async(sessionQueue, block);
}

uint64_t __36__VCSession_updatePresentationInfo___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int v2 = (void *)VCVideoCaptureServer_CopyLocalVideoAttributes((uint64_t)+[VCVideoCaptureServer VCVideoCaptureServerSingleton]);
  unsigned int v3 = [v2 orientation];

  VCSpatialAudioMetadata_UpdateOrientation(*(void *)(*(void *)(a1 + 32) + 632), v3);
  if (*(void *)(a1 + 40) && (uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 720)) != 0)
  {
    objc_msgSend(v4, "unserialize:");
    int v5 = [*(id *)(*(void *)(a1 + 32) + 720) hasPendingChanges];
    uint64_t v6 = *(void *)(a1 + 32);
    if (v5)
    {
      VCSpatialAudioMetadata_UpdateGlobalInfo(*(void *)(v6 + 632), (long long *)[*(id *)(v6 + 720) metadataGlobalInfo]);
      uint64_t v6 = *(void *)(a1 + 32);
      if (!*(unsigned char *)(v6 + 409))
      {
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        uint64_t v7 = (void *)[(id)v6 remoteParticipants];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v22 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v24;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v24 != v10) {
                objc_enumerationMutation(v7);
              }
              int v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
              objc_msgSend(v12, "setPresentationState:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 720), "uiState"));
              [v12 updateShouldEnableMLEnhance];
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v22 count:16];
          }
          while (v9);
        }
        [*(id *)(a1 + 32) distributeBitrateAndOptInToStreamIDsWithSeamlessTransition:0];
        uint64_t v6 = *(void *)(a1 + 32);
      }
    }
    [(id)v6 updateParticipantWindowState];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    uint64_t v14 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315650;
      uint64_t v17 = v13;
      __int16 v18 = 2080;
      long long v19 = "-[VCSession updatePresentationInfo:]_block_invoke";
      __int16 v20 = 1024;
      int v21 = 1785;
      _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d [AVC SPATIAL AUDIO] Presentation info is nil", (uint8_t *)&v16, 0x1Cu);
    }
  }
  return [*(id *)(a1 + 32) applySpatialMetadata];
}

- (void)applySpatialMetadata
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCSession applySpatialMetadata]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCSession [%s] %s:%d [AVC SPATIAL AUDIO] Serialization failed. result=%08x", v2, *(const char **)v3, (unint64_t)"-[VCSession applySpatialMetadata]" >> 16, v4);
}

void __33__VCSession_applySpatialMetadata__block_invoke(uint64_t a1, int a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a2 < 0)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = *(NSObject **)(v4 + 176);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __33__VCSession_applySpatialMetadata__block_invoke_2;
    block[3] = &unk_1E6DB3DC8;
    block[4] = v4;
    dispatch_async(v5, block);
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __33__VCSession_applySpatialMetadata__block_invoke_cold_1();
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
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        uint64_t v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v9 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 136316418;
          uint64_t v12 = v7;
          __int16 v13 = 2080;
          uint64_t v14 = "-[VCSession applySpatialMetadata]_block_invoke";
          __int16 v15 = 1024;
          int v16 = 1810;
          __int16 v17 = 2112;
          __int16 v18 = v6;
          __int16 v19 = 2048;
          uint64_t v20 = v9;
          __int16 v21 = 1024;
          int v22 = a2;
          _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, "VCSession [%s] %s:%d %@(%p) [AVC SPATIAL AUDIO] Failed to apply the spatial metadata. result=%08x", buf, 0x36u);
        }
      }
    }
  }
}

uint64_t __33__VCSession_applySpatialMetadata__block_invoke_2(uint64_t a1)
{
  return VCSpatialAudioMetadata_SetNeedsRefresh(*(void *)(*(void *)(a1 + 32) + 632));
}

- (BOOL)isTLEEnabledOnPrimaryConnection
{
  int v2 = (const void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)[(VCTransportSession *)self->_transportSession connectionManager]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL IsQUICPod = VCConnectionIDS_IsQUICPod((uint64_t)v2);
    if (!v2) {
      return IsQUICPod;
    }
    goto LABEL_5;
  }
  BOOL IsQUICPod = 0;
  if (v2) {
LABEL_5:
  }
    CFRelease(v2);
  return IsQUICPod;
}

- (void)sendThermalAndSliceMessageToPariticipant:(id)a3
{
  int v5 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_lastThermalLevel), @"Thermal");
  [(VCSession *)self sendDeviceStateMessageToParticipant:a3 withStatus:v5 checkDNUStatus:1];
  uint64_t v6 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedChar:", VCConnection_ReportingSliceStatus((uint64_t)self->_currentActiveConnection)), @"sliceStatus");

  [(VCSession *)self sendDeviceStateMessageToParticipant:a3 withStatus:v6 checkDNUStatus:0];
}

- (void)sendDeviceStateMessageToParticipant:(id)a3 withStatus:(id)a4 checkDNUStatus:(BOOL)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a5 && !self->_isDNUCollectionEnabled)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      __int16 v13 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        log = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v16 = v12;
          __int16 v17 = 2080;
          __int16 v18 = "-[VCSession sendDeviceStateMessageToParticipant:withStatus:checkDNUStatus:]";
          __int16 v19 = 1024;
          int v20 = 1849;
          _os_log_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Diagnostics collection is off", buf, 0x1Cu);
        }
      }
      else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        -[VCSession sendDeviceStateMessageToParticipant:withStatus:checkDNUStatus:]();
      }
    }
  }
  else
  {
    [a3 capabilities];
    if (v8 != 1)
    {
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:a4];
      sessionMessaging = self->_sessionMessaging;
      uint64_t v11 = [a3 idsParticipantID];
      [(VCSessionMessaging *)sessionMessaging sendMessageDictionary:v9 withTopic:@"VCSessionMessageTopicDeviceState" participantID:v11];
    }
  }
}

- (void)sendNetworkCapabilitiesMessageToParticipant:(id)a3
{
  v11[6] = *MEMORY[0x1E4F143B8];
  [a3 capabilities];
  if (v5 != 1)
  {
    if (self->_oneToOneModeEnabled) {
      uint64_t v6 = &OBJC_IVAR___VCSession__oneToOneSettings;
    }
    else {
      uint64_t v6 = &OBJC_IVAR___VCSession__uplinkRateController;
    }
    uint64_t v7 = *(Class *)((char *)&self->super.super.isa + *v6);
    v10[0] = @"RCEV";
    v11[0] = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "rateControlExperimentConfig"));
    v10[1] = @"RCEG";
    v11[1] = objc_msgSend(NSNumber, "numberWithInt:", (unint64_t)objc_msgSend(v7, "rateControlExperimentConfig") >> 32);
    void v10[2] = @"SBVERS";
    int v8 = NSNumber;
    [v7 rateControlExperimentConfig];
    v11[2] = [v8 numberWithUnsignedInt:v9];
    v10[3] = @"RULRTX";
    void v11[3] = [NSNumber numberWithBool:self->_isUplinkRetransmissionForVideoEnabled];
    v10[4] = @"RTLE";
    v11[4] = objc_msgSend(NSNumber, "numberWithBool:", -[VCSession isTLEEnabledOnPrimaryConnection](self, "isTLEEnabledOnPrimaryConnection"));
    v10[5] = @"MQSchP";
    v11[5] = [NSNumber numberWithUnsignedInt:self->_mediaQueueConfiguration.schedulePolicy];
    -[VCSessionMessaging sendMessageDictionary:withTopic:participantID:](self->_sessionMessaging, "sendMessageDictionary:withTopic:participantID:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:6], @"VCSessionMessageTopicRateControlConfig", objc_msgSend(a3, "idsParticipantID"));
  }
}

- (void)updateParticipantWindowState
{
  uint64_t v3 = [(VCSessionPresentationInfo *)self->_presentationInfo uiState];
  presentationInfo = self->_presentationInfo;
  if (presentationInfo)
  {
    [(VCSessionPresentationInfo *)presentationInfo avcSessionPresentationInfo];
    double v5 = v16;
    double v6 = v15;
    double v7 = v18;
    double v8 = v17;
  }
  else
  {
    double v7 = 0.0;
    double v8 = 0.0;
    double v5 = 0.0;
    double v6 = 0.0;
  }
  -[VCSessionParticipantLocal updateWindowState:isLocal:windowRect:](self->_localParticipant, "updateWindowState:isLocal:windowRect:", v3, 1, v6, v5, v8, v7);
  id v9 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v10 = [NSNumber numberWithInt:v3];
  uint64_t v11 = [NSNumber numberWithDouble:v6];
  uint64_t v12 = [NSNumber numberWithDouble:v5];
  uint64_t v13 = [NSNumber numberWithDouble:v8];
  uint64_t v14 = objc_msgSend(v9, "initWithObjectsAndKeys:", v10, @"VCWindowState", v11, @"VCWindowOriginX", v12, @"VCWindowOriginY", v13, @"VCWindowWidth", objc_msgSend(NSNumber, "numberWithDouble:", v7), @"VCWindowHeight", 0);
  if ([(VCSession *)self oneToOneModeEnabled]
    && [(VCSession *)self oneToOneRemoteParticipant])
  {
    [(VCSessionMessaging *)self->_sessionMessaging sendMessageDictionary:v14 withTopic:@"VCWindowStateChange" participantID:[(VCSessionParticipant *)[(VCSession *)self oneToOneRemoteParticipant] idsParticipantID]];
  }
}

- (void)updateParticipantConfigurations:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__VCSession_updateParticipantConfigurations___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a3;
  dispatch_async(sessionQueue, block);
}

unsigned char *__45__VCSession_updateParticipantConfigurations___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
      goto LABEL_18;
    }
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    double v5 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      double v6 = *(__CFString **)(a1 + 40);
      *(_DWORD *)buf = 136315906;
      uint64_t v34 = v3;
      __int16 v35 = 2080;
      int v36 = "-[VCSession updateParticipantConfigurations:]_block_invoke";
      __int16 v37 = 1024;
      int v38 = 1899;
      __int16 v39 = 2112;
      uint64_t v40 = v6;
      double v7 = "VCSession [%s] %s:%d %@";
      double v8 = v4;
      uint32_t v9 = 38;
LABEL_13:
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
      goto LABEL_18;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __45__VCSession_updateParticipantConfigurations___block_invoke_cold_1();
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      int v2 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      int v2 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_18;
        }
        uint64_t v13 = *(void *)(a1 + 32);
        uint64_t v14 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 136316418;
        uint64_t v34 = v10;
        __int16 v35 = 2080;
        int v36 = "-[VCSession updateParticipantConfigurations:]_block_invoke";
        __int16 v37 = 1024;
        int v38 = 1899;
        __int16 v39 = 2112;
        uint64_t v40 = v2;
        __int16 v41 = 2048;
        uint64_t v42 = v13;
        __int16 v43 = 2112;
        uint64_t v44 = v14;
        double v7 = "VCSession [%s] %s:%d %@(%p) %@";
        double v8 = v11;
        uint32_t v9 = 58;
        goto LABEL_13;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v15 = *(void *)(a1 + 32);
        uint64_t v16 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 136316418;
        uint64_t v34 = v10;
        __int16 v35 = 2080;
        int v36 = "-[VCSession updateParticipantConfigurations:]_block_invoke";
        __int16 v37 = 1024;
        int v38 = 1899;
        __int16 v39 = 2112;
        uint64_t v40 = v2;
        __int16 v41 = 2048;
        uint64_t v42 = v15;
        __int16 v43 = 2112;
        uint64_t v44 = v16;
        _os_log_debug_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEBUG, "VCSession [%s] %s:%d %@(%p) %@", buf, 0x3Au);
      }
    }
  }
LABEL_18:
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  double v17 = *(void **)(a1 + 40);
  uint64_t result = (unsigned char *)[v17 countByEnumeratingWithState:&v29 objects:v28 count:16];
  if (result)
  {
    __int16 v19 = result;
    char v20 = 0;
    uint64_t v21 = *(void *)v30;
    do
    {
      int v22 = 0;
      do
      {
        if (*(void *)v30 != v21) {
          objc_enumerationMutation(v17);
        }
        uint64_t v23 = *(void **)(*((void *)&v29 + 1) + 8 * (void)v22);
        long long v24 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 248), "objectForKeyedSubscript:", objc_msgSend(v23, "uuid"));
        int v25 = [v23 videoQuality];
        if (v25 != [v24 videoQuality])
        {
          objc_msgSend(v24, "setVideoQuality:", objc_msgSend(v23, "videoQuality"));
          char v20 = 1;
        }
        int v26 = [v24 visibilityIndex];
        if (v26 != [v23 visibilityIndex])
        {
          objc_msgSend(v24, "setVisibilityIndex:", objc_msgSend(v23, "visibilityIndex"));
          char v20 = 1;
        }
        int v27 = [v24 prominenceIndex];
        if (v27 != [v23 prominenceIndex])
        {
          objc_msgSend(v24, "setProminenceIndex:", objc_msgSend(v23, "prominenceIndex"));
          char v20 = 1;
        }
        objc_msgSend(v24, "updatePositionalInfo:shouldReapply:", objc_msgSend(v23, "positionalInfo"), 0);
        ++v22;
      }
      while (v19 != v22);
      uint64_t result = (unsigned char *)[v17 countByEnumeratingWithState:&v29 objects:v28 count:16];
      __int16 v19 = result;
    }
    while (result);
    if (v20)
    {
      uint64_t result = *(unsigned char **)(a1 + 32);
      if (!result[409]) {
        return (unsigned char *)[result distributeBitrateAndOptInToStreamIDsWithSeamlessTransition:1];
      }
    }
  }
  return result;
}

- (void)distributeBitrateAndOptInToStreamIDsWithSeamlessTransition:(BOOL)a3
{
  BOOL v44 = a3;
  uint64_t v3 = self;
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      double v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v57 = v5;
        __int16 v58 = 2080;
        v59 = "-[VCSession distributeBitrateAndOptInToStreamIDsWithSeamlessTransition:]";
        __int16 v60 = 1024;
        int v61 = 1926;
        __int16 v62 = 1024;
        LODWORD(v63) = v44;
        double v7 = "VCSession [%s] %s:%d forceSeamLess:%d";
        double v8 = v6;
        uint32_t v9 = 34;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v4 = (__CFString *)[(VCSession *)v3 performSelector:sel_logPrefix];
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
        *(_DWORD *)buf = 136316418;
        uint64_t v57 = v10;
        __int16 v58 = 2080;
        v59 = "-[VCSession distributeBitrateAndOptInToStreamIDsWithSeamlessTransition:]";
        __int16 v60 = 1024;
        int v61 = 1926;
        __int16 v62 = 2112;
        v63 = v4;
        __int16 v64 = 2048;
        v65 = v3;
        __int16 v66 = 1024;
        BOOL v67 = v44;
        double v7 = "VCSession [%s] %s:%d %@(%p) forceSeamLess:%d";
        double v8 = v11;
        uint32_t v9 = 54;
        goto LABEL_11;
      }
    }
  }
  uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSArray count](-[VCSession remoteParticipants](v3, "remoteParticipants"), "count"));
  id v13 = [(VCSessionDownlinkBandwidthAllocator *)v3->_downlinkBandwidthAllocator distributeBitrate:v3->_downlinkTargetBitrate];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v45 = v13;
  obuint64_t j = (id)[v13 allKeys];
  uint64_t v14 = [obj countByEnumeratingWithState:&v52 objects:v51 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v53 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v52 + 1) + 8 * i);
        __int16 v19 = v3;
        char v20 = (void *)[(NSMutableDictionary *)v3->_remoteParticipantsMapByUUID objectForKeyedSubscript:v18];
        uint64_t v21 = objc_msgSend(v20, "recommendedStreamIDsForSelectedMediaEntries:forceSeamlessTransition:", objc_msgSend(v45, "objectForKeyedSubscript:", v18), v44);
        int v22 = v20;
        uint64_t v3 = v19;
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v22, "idsParticipantID")));
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v52 objects:v51 count:16];
    }
    while (v15);
  }
  if (([(NSMutableDictionary *)v3->_optInDictionary isEqualToDictionary:v12] & 1) == 0)
  {
    if ((VCSession *)objc_opt_class() == v3)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_31;
      }
      uint64_t v24 = VRTraceErrorLogLevelToCSTR();
      int v25 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_31;
      }
      unsigned int downlinkTargetBitrate = v3->_downlinkTargetBitrate;
      *(_DWORD *)buf = 136315906;
      uint64_t v57 = v24;
      __int16 v58 = 2080;
      v59 = "-[VCSession distributeBitrateAndOptInToStreamIDsWithSeamlessTransition:]";
      __int16 v60 = 1024;
      int v61 = 1938;
      __int16 v62 = 1024;
      LODWORD(v63) = downlinkTargetBitrate;
      int v27 = "VCSession [%s] %s:%d New opt-in dictionary for new downlink target bitrate:[%u]";
      VCRateControlMediaSuggestion v28 = v25;
      uint32_t v29 = 34;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v23 = (__CFString *)[(VCSession *)v3 performSelector:sel_logPrefix];
      }
      else {
        uint64_t v23 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_31;
      }
      uint64_t v30 = VRTraceErrorLogLevelToCSTR();
      long long v31 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_31;
      }
      unsigned int v32 = v3->_downlinkTargetBitrate;
      *(_DWORD *)buf = 136316418;
      uint64_t v57 = v30;
      __int16 v58 = 2080;
      v59 = "-[VCSession distributeBitrateAndOptInToStreamIDsWithSeamlessTransition:]";
      __int16 v60 = 1024;
      int v61 = 1938;
      __int16 v62 = 2112;
      v63 = v23;
      __int16 v64 = 2048;
      v65 = v3;
      __int16 v66 = 1024;
      BOOL v67 = v32;
      int v27 = "VCSession [%s] %s:%d %@(%p) New opt-in dictionary for new downlink target bitrate:[%u]";
      VCRateControlMediaSuggestion v28 = v31;
      uint32_t v29 = 54;
    }
    _os_log_impl(&dword_1E1EA4000, v28, OS_LOG_TYPE_DEFAULT, v27, buf, v29);
LABEL_31:
    objc_msgSend((id)-[VCTransportSession sessionInfoSynchronizer](v3->_transportSession, "sessionInfoSynchronizer"), "setVCIDSSessionInfoSubscribedStreamIDs:", v12);
    __int16 v33 = &OBJC_IVAR___VCCallSession_peerCN;
    if ([v12 count]) {
      [(AVCRateController *)v3->_downlinkRateController setPaused:1];
    }
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    uint64_t v34 = [(VCSession *)v3 remoteParticipants];
    uint64_t v35 = [(NSArray *)v34 countByEnumeratingWithState:&v47 objects:v46 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      char v37 = 0;
      uint64_t v38 = *(void *)v48;
      do
      {
        for (uint64_t j = 0; j != v36; ++j)
        {
          if (*(void *)v48 != v38) {
            objc_enumerationMutation(v34);
          }
          uint64_t v40 = *(void **)(*((void *)&v47 + 1) + 8 * j);
          objc_msgSend(v40, "setActiveStreamIDs:", objc_msgSend(v12, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v40, "idsParticipantID"))));
          if ([v40 isVideoExpected] && objc_msgSend(v40, "optedInVideoStreamID")) {
            char v41 = 1;
          }
          else {
            char v41 = [v40 isRemoteScreenEnabled];
          }
          v37 |= v41;
        }
        uint64_t v36 = [(NSArray *)v34 countByEnumeratingWithState:&v47 objects:v46 count:16];
      }
      while (v36);
      BOOL v42 = (v37 & 1) == 0;
      __int16 v33 = &OBJC_IVAR___VCCallSession_peerCN;
    }
    else
    {
      BOOL v42 = 1;
    }
    objc_msgSend((id)objc_msgSend(*(id *)((char *)&v3->super.super.isa + v33[565]), "statisticsCollector"), "setEstimatedBandwidthCap:", v42);
    [(VCSession *)v3 reportingSessionDownlinkOptInEvent:v12 selectedMediaEntriesForParticipants:v45];
    [(VCSession *)v3 setOptInDictionary:v12];
  }
}

- (void)reportingSessionDownlinkOptInEvent:(id)a3 selectedMediaEntriesForParticipants:(id)a4
{
  uint64_t v5 = self;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)[(VCSession *)self remoteParticipants] count])
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    CFDictionaryAddValue(Mutable, @"VCSPTargetBitrate", (const void *)[NSNumber numberWithUnsignedInt:v5->_downlinkTargetBitrate]);
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    obuint64_t j = (id)[a4 allKeys];
    uint64_t v26 = [obj countByEnumeratingWithState:&v33 objects:v32 count:16];
    if (v26)
    {
      uint64_t v23 = *(void *)v34;
      uint64_t v24 = v5;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v34 != v23) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v33 + 1) + 8 * v8);
          uint64_t v10 = (void *)[(NSMutableDictionary *)v5->_remoteParticipantsMapByUUID objectForKeyedSubscript:v9];
          id v11 = v6;
          [v6 addObject:v9];
          id v12 = a4;
          id v13 = (void *)[a4 objectForKeyedSubscript:v9];
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v27 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            LODWORD(v16) = 0;
            uint64_t v17 = *(void *)v29;
            do
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v29 != v17) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v16 = [*(id *)(*((void *)&v28 + 1) + 8 * i) maxNetworkBitrate]
                    + v16;
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v27 count:16];
            }
            while (v15);
          }
          else
          {
            uint64_t v16 = 0;
          }
          objc_msgSend(v7, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v16));
          __int16 v19 = objc_msgSend(a3, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v10, "idsParticipantID")));
          if ([v19 count]) {
            objc_msgSend(v22, "addObject:", objc_msgSend(v19, "componentsJoinedByString:", @","));
          }
          ++v8;
          uint64_t v5 = v24;
          id v6 = v11;
          a4 = v12;
        }
        while (v8 != v26);
        uint64_t v26 = [obj countByEnumeratingWithState:&v33 objects:v32 count:16];
      }
      while (v26);
    }
    if ([v6 count]) {
      CFDictionaryAddValue(Mutable, @"VCSPUUIDList", (const void *)[v6 componentsJoinedByString:@","]);
    }
    if ([v7 count]) {
      CFDictionaryAddValue(Mutable, @"VCSPDownlinkBitrates", (const void *)[v7 componentsJoinedByString:@","]);
    }
    if ([v22 count]) {
      CFDictionaryAddValue(Mutable, @"VCSPActiveStreamIDTuples", (const void *)[v22 componentsJoinedByString:@";"]);
    }

    reportingGenericEvent();
    if (Mutable) {
      CFRelease(Mutable);
    }
  }
}

- (void)reportingSessionStopEventWithError:(id)a3
{
  v8[3] = *MEMORY[0x1E4F143B8];
  if (self->_oneToOneModeEnabled)
  {
    if ([a3 domain]) {
      uint64_t v5 = (__CFString *)[a3 domain];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    [a3 code];
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"NSErrorUserInfoDetailedError"), "intValue");
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"NSErrorUserInfoReturnCode"), "intValue");
    [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] remoteNoRemotePacketInterval];
    [(__CFString *)v5 UTF8String];
    reportingCallEndError();
  }
  else
  {
    v7[0] = @"VCSCallEndReason";
    v8[0] = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a3, "code"));
    v7[1] = @"VCSCallEndDetailedReason";
    v8[1] = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"NSErrorUserInfoDetailedError"), "intValue"));
    v7[2] = @"VCSErrorDomain";
    if ([a3 domain]) {
      id v6 = (__CFString *)[a3 domain];
    }
    else {
      id v6 = &stru_1F3D3E450;
    }
    v8[2] = v6;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];
    reportingGenericEvent();
  }
}

+ (int)deviceRoleForSessionMode:(int64_t)a3
{
  if (a3 == 1) {
    int v3 = 3;
  }
  else {
    int v3 = 0;
  }
  if (a3 == 2) {
    return 6;
  }
  else {
    return v3;
  }
}

- (void)setSessionInfoSynchronizerCallbacks
{
  [(VCSession *)self setSessionInfoSynchronizerErrorResponseCallback];

  [(VCSession *)self setSessionInfoSynchronizerPeerSubscribedStreamsCallback];
}

- (void)setSessionInfoSynchronizerErrorResponseCallback
{
  v4[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  objc_msgSend((id)-[VCTransportSession sessionInfoSynchronizer](self->_transportSession, "sessionInfoSynchronizer", MEMORY[0x1E4F143A8], 3221225472, __60__VCSession_setSessionInfoSynchronizerErrorResponseCallback__block_invoke, &unk_1E6DB3E68, v3), "setErrorResponseCallback:", v4);
}

void __60__VCSession_setSessionInfoSynchronizerErrorResponseCallback__block_invoke(uint64_t a1, int a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[*(id *)(a1 + 32) strong];
  if (v3)
  {
    uint64_t v4 = v3;
    if (a2)
    {
      if (a2 != 7) {
        return;
      }
      uint64_t v5 = (void *)[v3 transportSession];
      if (!v5 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __60__VCSession_setSessionInfoSynchronizerErrorResponseCallback__block_invoke_cold_1();
        }
      }
      if ([v4 optInDictionary])
      {
        objc_msgSend((id)objc_msgSend(v5, "sessionInfoSynchronizer"), "retryVCIDSSessionInfoSubscribedStreamIDs");
        return;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        id v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 136315650;
          uint64_t v12 = v10;
          __int16 v13 = 2080;
          uint64_t v14 = "-[VCSession setSessionInfoSynchronizerErrorResponseCallback]_block_invoke";
          __int16 v15 = 1024;
          int v16 = 2078;
          uint64_t v8 = "VCSession [%s] %s:%d Opt in dictionary is invalid";
          goto LABEL_13;
        }
      }
    }
    else
    {
      uint64_t v9 = (void *)[v3 downlinkRateController];
      [v9 setPaused:0];
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    id v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315650;
      uint64_t v12 = v6;
      __int16 v13 = 2080;
      uint64_t v14 = "-[VCSession setSessionInfoSynchronizerErrorResponseCallback]_block_invoke";
      __int16 v15 = 1024;
      int v16 = 2067;
      uint64_t v8 = "VCSession [%s] %s:%d strongSelf is nil, return";
LABEL_13:
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, 0x1Cu);
    }
  }
}

- (void)setSessionInfoSynchronizerPeerSubscribedStreamsCallback
{
  v4[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  objc_msgSend((id)-[VCTransportSession sessionInfoSynchronizer](self->_transportSession, "sessionInfoSynchronizer", MEMORY[0x1E4F143A8], 3221225472, __68__VCSession_setSessionInfoSynchronizerPeerSubscribedStreamsCallback__block_invoke, &unk_1E6DB7AF0, v3), "setPeerSubscribedStreamCallback:", v4);
}

void __68__VCSession_setSessionInfoSynchronizerPeerSubscribedStreamsCallback__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[*(id *)(a1 + 32) strong];
  if (v3)
  {
    uint64_t v4 = (void *)[v3 localParticipant];
    [v4 setPeerSubscribedStreams:a2];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315650;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      uint64_t v10 = "-[VCSession setSessionInfoSynchronizerPeerSubscribedStreamsCallback]_block_invoke";
      __int16 v11 = 1024;
      int v12 = 2092;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d strongSelf is nil, return", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

- (id)vcrcServerBagWithOperatingMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = +[VCRateControlServerBag keysWithMode:v3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "setObject:forKeyedSubscript:", +[GKSConnectivitySettings getVCRCSeverBagConfigWithKey:](GKSConnectivitySettings, "getVCRCSeverBagConfigWithKey:", *(void *)(*((void *)&v13 + 1) + 8 * v9)), *(void *)(*((void *)&v13 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v12 count:16];
    }
    while (v7);
  }
  uint64_t v10 = [[VCRateControlServerBag alloc] initWithMode:v3 serverBagDict:v4];

  return v10;
}

- (void)setupRateControllersMultiway
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [NSString stringWithFormat:@"session_%@", self->_uuid];
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v11 = 0;
  long long v10 = 0u;
  uint64_t v7 = v3;
  BYTE1(v8) = 1;
  id v4 = [(VCSession *)self vcrcServerBagWithOperatingMode:6];
  id reportingAgent = self->super._reportingAgent;
  *((void *)&v8 + 1) = v4;
  *(void *)&long long v9 = reportingAgent;
  BYTE8(v9) = 1;
  BYTE8(v10) = 1;
  *(void *)&long long v10 = self->_nwActivity;
  self->_uplinkRateController = [[AVCRateController alloc] initWithDelegate:self params:&v7];
  BYTE8(v10) = 0;
  BYTE1(v8) = 0;
  self->_downlinkRateController = [[AVCRateController alloc] initWithDelegate:self params:&v7];
  uint64_t v6 = [[VCRateControlMediaController alloc] initWithMediaQueue:0xFFFFFFFFLL delegate:self];
  self->_uplinkMediaController = v6;
  [(AVCRateController *)self->_uplinkRateController setMediaController:v6];
  [(VCRateControlMediaController *)self->_uplinkMediaController setStatisticsCollector:[(AVCRateController *)self->_uplinkRateController statisticsCollector]];
  [(VCSessionParticipant *)self->_localParticipant setStatisticsCollector:[(AVCRateController *)self->_uplinkRateController statisticsCollector]];
  [(VCSessionParticipant *)self->_localParticipant setBasebandCongestionDetector:[(AVCRateController *)self->_uplinkRateController basebandCongestionDetector]];
}

- (void)didRemoveSpatialMetadataEntry
{
  v3[5] = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__VCSession_didRemoveSpatialMetadataEntry__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(sessionQueue, v3);
}

uint64_t __42__VCSession_didRemoveSpatialMetadataEntry__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) applySpatialMetadata];
}

- (int)setupSpatialAudio
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  CFTypeRef v19 = 0;
  CFTypeRef cf = 0;
  if ([(VCSessionConfiguration *)self->_configuration sessionMode]
    && [(VCSessionConfiguration *)self->_configuration sessionMode] != 2
    || !+[VCHardwareSettings isSpatialAudioSupported])
  {
    [(VCSession *)self cleanupSpatialAudio];
    uint64_t v16 = 0;
    int v8 = 0;
LABEL_24:
    [(VCSession *)self setIsSpatialAudioSupported:v16];
    goto LABEL_25;
  }
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __30__VCSession_setupSpatialAudio__block_invoke;
  v18[3] = &unk_1E6DB3DC8;
  v18[4] = v3;
  BOOL v4 = +[VCHardwareSettings isSiriVoicePlayoutSupported];
  if (+[VCHardwareSettings deviceClass] == 8) {
    uint64_t v5 = 33;
  }
  else {
    uint64_t v5 = 32;
  }
  int v6 = VCSpatialAudioMetadata_Create((const __CFAllocator *)*MEMORY[0x1E4F1CF80], v5, 0, v18, (uint64_t *)&cf);
  if (v6 < 0)
  {
    int v8 = v6;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSession setupSpatialAudio]();
      }
    }
  }
  else
  {
    VCSpatialAudioMetadata_Serialize((uint64_t)cf, (CMBlockBufferRef *)&v19);
    id v7 = +[VCAudioManager sharedVoiceChatInstance];
    int v8 = [v7 registerAudioSessionId:self->_transportSessionID maxChannelCountMic:1 maxChannelCountSpeaker:32 spatialMetadata:v19];
    if (v8 < 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSession setupSpatialAudio]();
        }
      }
    }
    else
    {
      spatialMetadata = self->_spatialMetadata;
      CFTypeRef v10 = cf;
      self->_spatialMetadata = (void *)cf;
      if (v10) {
        CFRetain(v10);
      }
      if (spatialMetadata) {
        CFRelease(spatialMetadata);
      }
      if (!v4
        || (int v8 = [(VCSession *)self reserveAudioChannelForMediaType:4 spatialAudioSourceID:self->_siriSpatialAudioSourceID], (v8 & 0x80000000) == 0))
      {
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v11 = (void *)[(NSMutableDictionary *)self->_remoteParticipantsMapByUUID allValues];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v21 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v23;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v23 != v14) {
                objc_enumerationMutation(v11);
              }
              [*(id *)(*((void *)&v22 + 1) + 8 * i) setupSpatialAudioWithMetadata:self->_spatialMetadata spatialMetadataEntryMap:self->_mediaTypeToSpatialMetadataEntryMap];
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v21 count:16];
          }
          while (v13);
        }
        uint64_t v16 = 1;
        goto LABEL_24;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSession setupSpatialAudio]();
        }
      }
    }
  }
LABEL_25:
  if (cf) {
    CFRelease(cf);
  }
  if (v19) {
    CFRelease(v19);
  }
  return v8;
}

void __30__VCSession_setupSpatialAudio__block_invoke(uint64_t a1)
{
  os_log_t v1 = (void *)MEMORY[0x1E4E56580]([*(id *)(a1 + 32) weak]);
  [v1 didRemoveSpatialMetadataEntry];
  if (v1)
  {
    CFRelease(v1);
  }
}

- (int)reserveAudioChannelForMediaType:(unsigned int)a3 spatialAudioSourceID:(unint64_t)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v12 = 0;
  unsigned int valuePtr = a3;
  value = 0;
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  int Entry = VCSpatialAudioMetadata_CreateEntry(*MEMORY[0x1E4F1CF80], (uint64_t)self->_spatialMetadata, a4, (uint64_t *)&value);
  if (Entry < 0)
  {
    int v7 = Entry;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSession reserveAudioChannelForMediaType:spatialAudioSourceID:]();
      }
    }
  }
  else
  {
    int v7 = VCSpatialAudioMetadata_ChannelIndex((uint64_t)value, &v12);
    if (v7 < 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSession reserveAudioChannelForMediaType:spatialAudioSourceID:]();
        }
      }
    }
    else
    {
      CFNumberRef v8 = CFNumberCreate(v5, kCFNumberSInt32Type, &valuePtr);
      if (v8)
      {
        CFNumberRef v9 = v8;
        CFDictionaryAddValue(self->_mediaTypeToSpatialMetadataEntryMap, v8, value);
        CFRelease(v9);
      }
      else
      {
        int v7 = -2143813630;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSession reserveAudioChannelForMediaType:spatialAudioSourceID:]();
          }
        }
      }
    }
  }
  if (value) {
    CFRelease(value);
  }
  return v7;
}

- (void)cleanupSpatialAudio
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (+[VCHardwareSettings isSpatialAudioSupported])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v3 = (void *)[(NSMutableDictionary *)self->_remoteParticipantsMapByUUID allValues];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v10 count:16];
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
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * v7++) cleanupSpatialAudio];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v10 count:16];
      }
      while (v5);
    }
    spatialMetadata = self->_spatialMetadata;
    if (spatialMetadata)
    {
      CFRelease(spatialMetadata);
      self->_spatialMetadata = 0;
    }
    mediaTypeToSpatialMetadataEntryMap = self->_mediaTypeToSpatialMetadataEntryMap;
    if (mediaTypeToSpatialMetadataEntryMap) {
      CFDictionaryRemoveAllValues(mediaTypeToSpatialMetadataEntryMap);
    }
    objc_msgSend(+[VCAudioManager sharedVoiceChatInstance](VCAudioManager, "sharedVoiceChatInstance"), "unregisterAudioSessionId:", self->_transportSessionID);
  }
}

- (void)updateMultiwayRateControllerWithActiveConnection:(id)a3 isScreenEnabled:(BOOL)a4 isLocal:(BOOL)a5
{
  BOOL v5 = a4;
  CFNumberRef v8 = &OBJC_IVAR___VCSession__downlinkRateController;
  if (a5) {
    CFNumberRef v8 = &OBJC_IVAR___VCSession__uplinkRateController;
  }
  CFNumberRef v9 = *(Class *)((char *)&self->super.super.isa + *v8);
  if (a5) {
    unsigned int v10 = [a3 uplinkBitrateCap];
  }
  else {
    unsigned int v10 = [a3 downlinkBitrateCap];
  }
  unsigned int v11 = v10;
  long long v12 = (const void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)[(VCTransportSession *)self->_transportSession connectionManager]);
  if (VCConnection_IsLocalOnWiFiOrWired((uint64_t)v12))
  {
    if (![(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] isDuplicationEnabled]&& !v5)
    {
LABEL_9:
      int v13 = 0;
      if (!v12) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  else if (!v5)
  {
    goto LABEL_9;
  }
  int v13 = 512;
  if (v12) {
LABEL_13:
  }
    CFRelease(v12);
LABEL_14:
  uint64_t IsLocalOnCellular = VCConnection_IsLocalOnCellular((uint64_t)a3);
  uint64_t v15 = VCConnection_LocalCellTech((uint64_t)a3);
  HIDWORD(v16) = v13;
  LOBYTE(v16) = v5;
  objc_msgSend(v9, "configureWithOperatingMode:isLocalCellular:localCellTech:isRemoteCellular:remoteCellTech:bitrateCapKbps:isTrafficBursty:featureFlags:", 6, IsLocalOnCellular, v15, 0, VCConnection_RemoteCellTech((uint64_t)a3), v11 / 0x3E8uLL, v16);
}

- (void)startRateControllersMultiwayFromOneToOne:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v5 = 10000000;
  [(VCRateControlMediaController *)self->_uplinkMediaController setIsAudioOnly:[(VCSessionParticipant *)self->_localParticipant isVideoEnabled] ^ 1];
  currentActiveConnection = self->_currentActiveConnection;
  int v7 = 10000000;
  if (currentActiveConnection) {
    int v7 = [(VCConnectionProtocol *)currentActiveConnection uplinkBitrateCap];
  }
  if (v3)
  {
    localParticipant = self->_localParticipant;
    if (localParticipant)
    {
      [(VCSessionParticipantLocal *)localParticipant oneToOneSettings];
      unsigned int v9 = v21;
    }
    else
    {
      unsigned int v9 = 0;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v19 = 0u;
    }
    unsigned int v10 = v9 >> (v9 < 0x2DC6C0);
  }
  else
  {
    unsigned int v10 = 0;
  }
  uplinkRateController = self->_uplinkRateController;
  int v14 = 4;
  uint64_t v15 = 0;
  int v16 = v7;
  LODWORD(v17) = 0;
  DWORD1(v17) = v10;
  long long v18 = 0uLL;
  *((void *)&v17 + 1) = 0;
  [(AVCRateController *)uplinkRateController configure:&v14];
  long long v12 = self->_currentActiveConnection;
  if (v12) {
    int v5 = [(VCConnectionProtocol *)v12 downlinkBitrateCap];
  }
  downlinkRateController = self->_downlinkRateController;
  int v14 = 5;
  uint64_t v15 = 0;
  int v16 = v5;
  long long v17 = 0u;
  long long v18 = 0u;
  [(AVCRateController *)downlinkRateController configure:&v14];
  [(AVCRateController *)self->_uplinkRateController start];
  [(AVCRateController *)self->_downlinkRateController start];
}

- (void)setupUplinkBitrateCaps
{
  [(VCSessionParticipantLocal *)self->_localParticipant setUplinkBitrateCapWifi:[(VCSessionBitrateArbiter *)self->_bitrateArbiter maxBitrateWiFiUplink]];
  uint64_t v3 = [(VCSessionBitrateArbiter *)self->_bitrateArbiter maxBitrateNonExpensiveUplink];
  localParticipant = self->_localParticipant;

  [(VCSessionParticipantLocal *)localParticipant setUplinkBitrateCapCell:v3];
}

- (void)createMediaQueue
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCSession createMediaQueue]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCSession [%s] %s:%d Failed to create media queue with error 0x%X", v2, *(const char **)v3, (unint64_t)"-[VCSession createMediaQueue]" >> 16, v4);
}

uint64_t __29__VCSession_createMediaQueue__block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    return objc_msgSend(a2, "handleMediaQueueSizeExceedThresholdWithQueueSize:mediaQueueStreamId:type:");
  }
  return result;
}

- (void)updateVCMediaQueueForMediaType:(unsigned int)a3 mediaState:(unsigned int)a4
{
  if (a3 == 6 && self->_mediaQueueConfiguration.schedulePolicy == 2)
  {
    int v4 = &OBJC_IVAR___VCSession__mediaQueueMinBitrateWithoutThrottlingDefault;
    if (a4 == 1) {
      int v4 = &OBJC_IVAR___VCSession__mediaQueueMinBitrateWithoutThrottling3DCamera;
    }
    VCMediaQueue_SetMinBitrateWithoutThrottling((uint64_t)self->_mediaQueue, *(_DWORD *)((char *)&self->super.super.isa + *v4));
  }
}

- (void)handleMediaQueueSizeExceedThresholdWithQueueSize:(double)a3 mediaQueueStreamId:(unsigned int)a4 type:(int)a5
{
  v36[2] = *MEMORY[0x1E4F143B8];
  if (a5 != 2)
  {
    if (a5 == 1)
    {
      if ((VCSession *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
          goto LABEL_23;
        }
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        int v13 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_23;
        }
        int v26 = 136316162;
        uint64_t v27 = v12;
        __int16 v28 = 2080;
        long long v29 = "-[VCSession handleMediaQueueSizeExceedThresholdWithQueueSize:mediaQueueStreamId:type:]";
        __int16 v30 = 1024;
        int v31 = 2337;
        __int16 v32 = 1024;
        *(_DWORD *)long long v33 = a4;
        *(_WORD *)&v33[4] = 2048;
        *(double *)&unsigned char v33[6] = a3;
        int v14 = "VCSession [%s] %s:%d VCMediaQueue size threshold exceeded for mediaQueueStreamId=%u queueSizeInSecond=%f - FLUSHING!";
        uint64_t v15 = v13;
        uint32_t v16 = 44;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          unsigned int v9 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
        }
        else {
          unsigned int v9 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
          goto LABEL_23;
        }
        uint64_t v22 = VRTraceErrorLogLevelToCSTR();
        long long v23 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_23;
        }
        int v26 = 136316674;
        uint64_t v27 = v22;
        __int16 v28 = 2080;
        long long v29 = "-[VCSession handleMediaQueueSizeExceedThresholdWithQueueSize:mediaQueueStreamId:type:]";
        __int16 v30 = 1024;
        int v31 = 2337;
        __int16 v32 = 2112;
        *(void *)long long v33 = v9;
        *(_WORD *)&v33[8] = 2048;
        *(void *)&v33[10] = self;
        *(_WORD *)&v33[18] = 1024;
        unsigned int v34 = a4;
        __int16 v35 = 2048;
        *(double *)long long v36 = a3;
        int v14 = "VCSession [%s] %s:%d %@(%p) VCMediaQueue size threshold exceeded for mediaQueueStreamId=%u queueSizeInSeco"
              "nd=%f - FLUSHING!";
        uint64_t v15 = v23;
        uint32_t v16 = 64;
      }
      _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v26, v16);
LABEL_23:
      VCMediaQueue_FlushPacketsInStream((uint64_t)self->_mediaQueue, a4, 1u);
      return;
    }
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        return;
      }
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      long long v18 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        return;
      }
      int v26 = 136316418;
      uint64_t v27 = v17;
      __int16 v28 = 2080;
      long long v29 = "-[VCSession handleMediaQueueSizeExceedThresholdWithQueueSize:mediaQueueStreamId:type:]";
      __int16 v30 = 1024;
      int v31 = 2344;
      __int16 v32 = 1024;
      *(_DWORD *)long long v33 = a5;
      *(_WORD *)&v33[4] = 1024;
      *(_DWORD *)&unsigned char v33[6] = a4;
      *(_WORD *)&v33[10] = 2048;
      *(double *)&v33[12] = a3;
      long long v19 = "VCSession [%s] %s:%d Should not handle media queue threshold exceeded with type=%d for mediaQueueStreamId=%u queueSize=%f!";
      long long v20 = v18;
      uint32_t v21 = 50;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        unsigned int v11 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
      }
      else {
        unsigned int v11 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        return;
      }
      uint64_t v24 = VRTraceErrorLogLevelToCSTR();
      long long v25 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        return;
      }
      int v26 = 136316930;
      uint64_t v27 = v24;
      __int16 v28 = 2080;
      long long v29 = "-[VCSession handleMediaQueueSizeExceedThresholdWithQueueSize:mediaQueueStreamId:type:]";
      __int16 v30 = 1024;
      int v31 = 2344;
      __int16 v32 = 2112;
      *(void *)long long v33 = v11;
      *(_WORD *)&v33[8] = 2048;
      *(void *)&v33[10] = self;
      *(_WORD *)&v33[18] = 1024;
      unsigned int v34 = a5;
      __int16 v35 = 1024;
      LODWORD(v36[0]) = a4;
      WORD2(v36[0]) = 2048;
      *(double *)((char *)v36 + 6) = a3;
      long long v19 = "VCSession [%s] %s:%d %@(%p) Should not handle media queue threshold exceeded with type=%d for mediaQueueStre"
            "amId=%u queueSize=%f!";
      long long v20 = v25;
      uint32_t v21 = 70;
    }
    _os_log_error_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v26, v21);
    return;
  }
  localParticipant = self->_localParticipant;

  [(VCSessionParticipantLocal *)localParticipant updateVCMediaQueueSize:(a3 * 1000.0)];
}

- (void)setMediaQueuePeakBitrateWithTargetBitrate:(unsigned int)a3
{
  if (self->_mediaQueue)
  {
    if (self->_oneToOneModeEnabled) {
      double v5 = 10.0;
    }
    else {
      double v5 = 1.5;
    }
    BOOL v6 = [(VCSessionParticipant *)self->_localParticipant isScreenEnabled];
    double v7 = 1.1;
    if (!v6) {
      double v7 = v5;
    }
    mediaQueue = self->_mediaQueue;
    VCMediaQueue_SetPeakBitrate(mediaQueue, (v7 * (double)a3));
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCSession setMediaQueuePeakBitrateWithTargetBitrate:]();
    }
  }
}

- (int)maxRemoteParticipants30fps
{
  id v2 = +[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-facetime-30-fps-support", @"maxParticipantCountSend30Fps", objc_msgSend(NSNumber, "numberWithUnsignedInt:", +[VCHardwareSettings maxRemoteParticipants30fps](VCHardwareSettings, "maxRemoteParticipants30fps")), 0);

  return [v2 intValue];
}

- (void)updateLocalVideoCaptureFrameRate
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (self->_sharingEnabled && VCDefaults_GetManagedBoolValueForKey(@"allowScreenToLimitCameraFrameRate", 1))
  {
    [(VCSessionParticipantLocal *)self->_localParticipant setCurrentVideoCaptureFrameRate:+[VCHardwareSettings maxFpsCameraCaptureDuringSharing]];
    if ((VCSession *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v3 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v3 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v19 = VRTraceErrorLogLevelToCSTR();
        uint64_t v12 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v20 = [(VCSessionParticipantLocal *)self->_localParticipant currentVideoCaptureFrameRate];
          *(_DWORD *)__int16 v32 = 136316418;
          *(void *)&v32[4] = v19;
          *(_WORD *)&v32[12] = 2080;
          *(void *)&v32[14] = "-[VCSession updateLocalVideoCaptureFrameRate]";
          *(_WORD *)&v32[22] = 1024;
          LODWORD(v33) = 2369;
          WORD2(v33) = 2112;
          *(void *)((char *)&v33 + 6) = v3;
          HIWORD(v33) = 2048;
          unsigned int v34 = self;
          LOWORD(v35) = 1024;
          *(_DWORD *)((char *)&v35 + 2) = v20;
          unsigned int v10 = "VCSession [%s] %s:%d %@(%p) Screen is enabled, constraining the local camera framerate=%d fps";
          goto LABEL_32;
        }
      }
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return;
    }
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    CFNumberRef v8 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v16 = [(VCSessionParticipantLocal *)self->_localParticipant currentVideoCaptureFrameRate];
    *(_DWORD *)__int16 v32 = 136315906;
    *(void *)&v32[4] = v15;
    *(_WORD *)&v32[12] = 2080;
    *(void *)&v32[14] = "-[VCSession updateLocalVideoCaptureFrameRate]";
    *(_WORD *)&v32[22] = 1024;
    LODWORD(v33) = 2369;
    WORD2(v33) = 1024;
    *(_DWORD *)((char *)&v33 + 6) = v16;
    unsigned int v10 = "VCSession [%s] %s:%d Screen is enabled, constraining the local camera framerate=%d fps";
LABEL_27:
    uint64_t v17 = v8;
    uint32_t v18 = 34;
LABEL_33:
    _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, v10, v32, v18);
    return;
  }
  if (!self->_oneToOneModeEnabled)
  {
    int v5 = [(NSArray *)[(VCSession *)self remoteParticipants] count];
    if ([(VCSession *)self maxRemoteParticipants30fps] >= v5)
    {
      [(VCSessionParticipantLocal *)self->_localParticipant setCurrentVideoCaptureFrameRate:30];
      if ((VCSession *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v26 = VRTraceErrorLogLevelToCSTR();
          uint64_t v27 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int16 v32 = 136316162;
            *(void *)&v32[4] = v26;
            *(_WORD *)&v32[12] = 2080;
            *(void *)&v32[14] = "-[VCSession updateLocalVideoCaptureFrameRate]";
            *(_WORD *)&v32[22] = 1024;
            LODWORD(v33) = 2376;
            WORD2(v33) = 2048;
            *(void *)((char *)&v33 + 6) = [(NSArray *)[(VCSession *)self remoteParticipants] count];
            HIWORD(v33) = 1024;
            LODWORD(v34) = 30;
            unsigned int v10 = "VCSession [%s] %s:%d Removing or adding a remote participant %lu, changing max video capture framerate to %d fps";
            uint64_t v17 = v27;
            uint32_t v18 = 44;
            goto LABEL_33;
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          int v14 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
        }
        else {
          int v14 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v30 = VRTraceErrorLogLevelToCSTR();
          int v31 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int16 v32 = 136316674;
            *(void *)&v32[4] = v30;
            *(_WORD *)&v32[12] = 2080;
            *(void *)&v32[14] = "-[VCSession updateLocalVideoCaptureFrameRate]";
            *(_WORD *)&v32[22] = 1024;
            LODWORD(v33) = 2376;
            WORD2(v33) = 2112;
            *(void *)((char *)&v33 + 6) = v14;
            HIWORD(v33) = 2048;
            unsigned int v34 = self;
            LOWORD(v35) = 2048;
            *(void *)((char *)&v35 + 2) = [(NSArray *)[(VCSession *)self remoteParticipants] count];
            WORD5(v35) = 1024;
            HIDWORD(v35) = 30;
            unsigned int v10 = "VCSession [%s] %s:%d %@(%p) Removing or adding a remote participant %lu, changing max video capture fr"
                  "amerate to %d fps";
            uint64_t v17 = v31;
            uint32_t v18 = 64;
            goto LABEL_33;
          }
        }
      }
      return;
    }
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_45;
      }
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      uint64_t v22 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_45;
      }
      *(_DWORD *)__int16 v32 = 136316162;
      *(void *)&v32[4] = v21;
      *(_WORD *)&v32[12] = 2080;
      *(void *)&v32[14] = "-[VCSession updateLocalVideoCaptureFrameRate]";
      *(_WORD *)&v32[22] = 1024;
      LODWORD(v33) = 2372;
      WORD2(v33) = 2048;
      *(void *)((char *)&v33 + 6) = [(NSArray *)[(VCSession *)self remoteParticipants] count];
      HIWORD(v33) = 1024;
      LODWORD(v34) = 15;
      long long v23 = "VCSession [%s] %s:%d Too many remote Participants %lu, constraining the local capture to %d fps";
      uint64_t v24 = v22;
      uint32_t v25 = 44;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        BOOL v6 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
      }
      else {
        BOOL v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_45;
      }
      uint64_t v28 = VRTraceErrorLogLevelToCSTR();
      long long v29 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_45;
      }
      *(_DWORD *)__int16 v32 = 136316674;
      *(void *)&v32[4] = v28;
      *(_WORD *)&v32[12] = 2080;
      *(void *)&v32[14] = "-[VCSession updateLocalVideoCaptureFrameRate]";
      *(_WORD *)&v32[22] = 1024;
      LODWORD(v33) = 2372;
      WORD2(v33) = 2112;
      *(void *)((char *)&v33 + 6) = v6;
      HIWORD(v33) = 2048;
      unsigned int v34 = self;
      LOWORD(v35) = 2048;
      *(void *)((char *)&v35 + 2) = [(NSArray *)[(VCSession *)self remoteParticipants] count];
      WORD5(v35) = 1024;
      HIDWORD(v35) = 15;
      long long v23 = "VCSession [%s] %s:%d %@(%p) Too many remote Participants %lu, constraining the local capture to %d fps";
      uint64_t v24 = v29;
      uint32_t v25 = 64;
    }
    _os_log_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_DEFAULT, v23, v32, v25);
LABEL_45:
    -[VCSessionParticipantLocal setCurrentVideoCaptureFrameRate:](self->_localParticipant, "setCurrentVideoCaptureFrameRate:", 15, *(_OWORD *)v32, *(void *)&v32[16], v33, v34, v35);
    return;
  }
  [(VCSessionParticipantLocal *)self->_localParticipant setCurrentVideoCaptureFrameRate:[(VCSessionParticipantLocal *)self->_localParticipant maxCaptureCameraFrameRate]];
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return;
    }
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    CFNumberRef v8 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v9 = [(VCSessionParticipantLocal *)self->_localParticipant maxCaptureCameraFrameRate];
    *(_DWORD *)__int16 v32 = 136315906;
    *(void *)&v32[4] = v7;
    *(_WORD *)&v32[12] = 2080;
    *(void *)&v32[14] = "-[VCSession updateLocalVideoCaptureFrameRate]";
    *(_WORD *)&v32[22] = 1024;
    LODWORD(v33) = 2380;
    WORD2(v33) = 1024;
    *(_DWORD *)((char *)&v33 + 6) = v9;
    unsigned int v10 = "VCSession [%s] %s:%d Restoring camera capture framerate to %d fps";
    goto LABEL_27;
  }
  if (objc_opt_respondsToSelector()) {
    int v4 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
  }
  else {
    int v4 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    uint64_t v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v13 = [(VCSessionParticipantLocal *)self->_localParticipant maxCaptureCameraFrameRate];
      *(_DWORD *)__int16 v32 = 136316418;
      *(void *)&v32[4] = v11;
      *(_WORD *)&v32[12] = 2080;
      *(void *)&v32[14] = "-[VCSession updateLocalVideoCaptureFrameRate]";
      *(_WORD *)&v32[22] = 1024;
      LODWORD(v33) = 2380;
      WORD2(v33) = 2112;
      *(void *)((char *)&v33 + 6) = v4;
      HIWORD(v33) = 2048;
      unsigned int v34 = self;
      LOWORD(v35) = 1024;
      *(_DWORD *)((char *)&v35 + 2) = v13;
      unsigned int v10 = "VCSession [%s] %s:%d %@(%p) Restoring camera capture framerate to %d fps";
LABEL_32:
      uint64_t v17 = v12;
      uint32_t v18 = 54;
      goto LABEL_33;
    }
  }
}

- (void)updateLocalStreamConfiguration
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(VCSessionParticipantLocal *)self->_localParticipant setEnableVADFiltering:[(NSMutableDictionary *)self->_remoteParticipantsMapByServerID count] >= (unint64_t)[+[VCDefaults sharedInstance] minParticipantCountSendVoiceActiveOnly]];
  uint64_t v3 = objc_msgSend(-[VCSessionParticipantLocal supportedAudioRules](self->_localParticipant, "supportedAudioRules"), "copy");
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  int v4 = [(VCSession *)self remoteParticipants];
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    LODWORD(v7) = 0;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v4);
        }
        unsigned int v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        [v10 negotiateAudioRules:v3];
        uint64_t v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "mediaNegotiator"), "negotiatedMediaRecorderSettings"), "capabilities") | v7;
        uint64_t v11 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "mediaNegotiator"), "negotiatedMediaRecorderSettings"), "imageType");
        uint64_t v12 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "mediaNegotiator"), "negotiatedMediaRecorderSettings"), "videoCodec");
      }
      uint64_t v13 = v12;
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v14 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v11 = 0;
    uint64_t v13 = 128;
  }
  [(VCSessionParticipantLocal *)self->_localParticipant updateSupportedAudioRules:v3];
  [(VCSession *)self updateMediaRecorderCapabillities:v7 imageType:v11 videoCodec:v13];
  [(VCSession *)self updateLocalVideoCaptureFrameRate];
}

- (void)optInStreamWithIDSStreamIDs:(id)a3
{
  v7[5] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = +[VCDatagramChannelManager sharedInstance];
  idsDestination = self->_idsDestination;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__VCSession_optInStreamWithIDSStreamIDs___block_invoke;
  void v7[3] = &unk_1E6DB7B18;
  v7[4] = a3;
  [(VCDatagramChannelManager *)v5 executeBlockForIDSDestination:idsDestination blockToExecute:v7];
}

uint64_t __41__VCSession_optInStreamWithIDSStreamIDs___block_invoke(uint64_t a1, void *a2)
{
  return [a2 optInStreamIDs:*(void *)(a1 + 32)];
}

- (void)optOutStreamWithIDSStreamIDs:(id)a3
{
  v7[5] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = +[VCDatagramChannelManager sharedInstance];
  idsDestination = self->_idsDestination;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__VCSession_optOutStreamWithIDSStreamIDs___block_invoke;
  void v7[3] = &unk_1E6DB7B18;
  v7[4] = a3;
  [(VCDatagramChannelManager *)v5 executeBlockForIDSDestination:idsDestination blockToExecute:v7];
}

uint64_t __42__VCSession_optOutStreamWithIDSStreamIDs___block_invoke(uint64_t a1, void *a2)
{
  return [a2 optOutStreamIDs:*(void *)(a1 + 32)];
}

- (BOOL)detectSSRCCollision:(id)a3 resetNeeded:(BOOL *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (self->_isSSRCCollisionDetectionEnabled)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v7 = (void *)[a3 allParticipantStreamInfo];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v28;
      uint64_t v19 = *(void *)v28;
      int v20 = v7;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          uint64_t v13 = objc_msgSend(v12, "streamConfigs", v19);
          uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v21 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v23;
            while (2)
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v23 != v16) {
                  objc_enumerationMutation(v13);
                }
                if (-[VCSession detectSSRCCollisionWithRemoteMediaStream:remoteBlobCreationTime:resetNeeded:](self, "detectSSRCCollisionWithRemoteMediaStream:remoteBlobCreationTime:resetNeeded:", *(void *)(*((void *)&v22 + 1) + 8 * j), [a3 creationTime], a4))
                {
                  LOBYTE(v8) = 1;
                  return v8;
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v21 count:16];
              if (v15) {
                continue;
              }
              break;
            }
          }
          uint64_t v10 = v19;
          uint64_t v7 = v20;
        }
        uint64_t v9 = [v20 countByEnumeratingWithState:&v27 objects:v26 count:16];
        LOBYTE(v8) = 0;
      }
      while (v9);
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (BOOL)detectSSRCCollisionWithRemoteMediaStream:(id)a3 remoteBlobCreationTime:(tagNTP)a4 resetNeeded:(BOOL *)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v9 = -[VCSessionParticipantLocal containsStreamWithSSRC:](self->_localParticipant, "containsStreamWithSSRC:", objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "ssrc"));
  if (v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136315906;
        uint64_t v15 = v10;
        __int16 v16 = 2080;
        long long v17 = "-[VCSession detectSSRCCollisionWithRemoteMediaStream:remoteBlobCreationTime:resetNeeded:]";
        __int16 v18 = 1024;
        int v19 = 2440;
        __int16 v20 = 1024;
        int v21 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "ssrc");
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d SSRC collision detected! SSRC=%u", (uint8_t *)&v14, 0x22u);
      }
    }
    if ((unint64_t)[(VCSessionParticipant *)self->_localParticipant creationTime] >> 32 > a4.time.sec)
    {
      BOOL v12 = 1;
LABEL_9:
      *a5 = v12;
      return v9;
    }
    if ((unint64_t)[(VCSessionParticipant *)self->_localParticipant creationTime] >> 32 == a4.time.sec)
    {
      BOOL v12 = [(VCSessionParticipant *)self->_localParticipant creationTime] > a4.time.frac;
      goto LABEL_9;
    }
  }
  return v9;
}

- (void)handleEncryptionInfoEvent:(id)a3
{
  v25[5] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F6A918]];
  uint64_t v6 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F6A920]];
  uint64_t v7 = [VCMediaKeyIndex alloc];
  uint64_t v8 = -[VCMediaKeyIndex initWithNSUUID:](v7, "initWithNSUUID:", [a3 objectForKeyedSubscript:*MEMORY[0x1E4F6A910]]);
  uint64_t v9 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F6A930]];
  uint64_t v10 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F6A908]];
  uint64_t v11 = [a3 objectForKeyedSubscript:@"maxSN"];
  uint64_t v12 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F6A928]];
  v24[0] = @"SecurityKey";
  v24[1] = @"SecuritySalt";
  v25[0] = v5;
  v25[1] = v6;
  v24[2] = @"SecurityKeyIndex";
  v24[3] = @"SecurityLocallyGenerated";
  v25[2] = v8;
  v25[3] = v10;
  v24[4] = @"SecurityKeySetTime";
  v25[4] = [NSNumber numberWithDouble:micro()];
  uint64_t v13 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v25, v24, 5), "mutableCopy");
  [v13 setObject:v11 forKeyedSubscript:@"SecurityMaxSequenceNumber"];
  [v13 setObject:v12 forKeyedSubscript:@"SecurityIDSParticipantID"];
  [v13 setObject:v9 forKeyedSubscript:@"SecurityShortKeyIndexLength"];
  [(VCControlChannelMultiWay *)self->_controlChannel addNewKeyMaterial:v13];
  if ([(VCSecurityKeyManager *)self->_securityKeyManager addSecurityKeyMaterial:v13 securityKeyMode:self->_oneToOneModeEnabled])
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
        int v19 = "-[VCSession handleEncryptionInfoEvent:]";
        __int16 v20 = 1024;
        int v21 = 2479;
        __int16 v22 = 2112;
        long long v23 = v8;
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Security key material with key index '%@' added", (uint8_t *)&v16, 0x26u);
      }
    }
  }
}

- (void)handleMembershipChangeInfoEvent:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315906;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      uint64_t v10 = "-[VCSession handleMembershipChangeInfoEvent:]";
      __int16 v11 = 1024;
      int v12 = 2486;
      __int16 v13 = 2112;
      id v14 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Start pruning keys in the security key manager due to membershipChangeReason: %@", (uint8_t *)&v7, 0x26u);
    }
  }
  [(VCSecurityKeyManager *)self->_securityKeyManager pruneSendKeyMaterialWithDelay:1.0];
  [(VCSession *)self reportingSessionParticipantEvent:168 keyChangeReason:a3 newMKI:0];
}

- (void)setDelegatesForRemoteParticipant:(id)a3
{
}

- (void)messageMediaInitialStateToParticipant:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ([(VCSessionParticipantLocal *)self->_localParticipant encryptionInfoReceived])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = [a3 uuid];
        BOOL v8 = [(VCSessionParticipant *)self->_localParticipant isAudioEnabled];
        BOOL v9 = [(VCSessionParticipant *)self->_localParticipant isVideoEnabled];
        BOOL v10 = [(VCSessionParticipant *)self->_localParticipant isScreenEnabled];
        int v16 = 136316674;
        uint64_t v17 = v5;
        __int16 v18 = 2080;
        int v19 = "-[VCSession messageMediaInitialStateToParticipant:]";
        __int16 v20 = 1024;
        int v21 = 2501;
        __int16 v22 = 2112;
        uint64_t v23 = v7;
        __int16 v24 = 1024;
        BOOL v25 = v8;
        __int16 v26 = 1024;
        BOOL v27 = v9;
        __int16 v28 = 1024;
        BOOL v29 = v10;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Send initial state to participant=%@. audioEnabled=%d videoEnabled=%d screenEnabled=%d", (uint8_t *)&v16, 0x38u);
      }
    }
    [a3 capabilities];
    if (v11 == 1)
    {
      sessionMessaging = self->_sessionMessaging;
      if ([(VCSessionParticipant *)self->_localParticipant isAudioEnabled]) {
        __int16 v13 = @"VCSessionMessageAudioEnabled";
      }
      else {
        __int16 v13 = @"VCSessionMessageAudioDisabled";
      }
      -[VCSessionMessaging sendMessage:withTopic:participantID:](sessionMessaging, "sendMessage:withTopic:participantID:", v13, @"VCSessionMessageTopicAudioEnabledState", [a3 idsParticipantID]);
      id v14 = self->_sessionMessaging;
      if ([(VCSessionParticipant *)self->_localParticipant isVideoEnabled]) {
        uint64_t v15 = @"VCSessionMessageVideoEnabled";
      }
      else {
        uint64_t v15 = @"VCSessionMessageVideoDisabled";
      }
      -[VCSessionMessaging sendMessage:withTopic:participantID:](v14, "sendMessage:withTopic:participantID:", v15, @"VCSessionMessageTopicVideoEnabledStateb", [a3 idsParticipantID]);
    }
    else
    {
      [(VCSession *)self sendMediaStateUpdateMessageToRemoteParticipant:a3];
    }
  }
}

- (void)broadcastInitialMediaState
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([(VCSessionParticipantLocal *)self->_localParticipant encryptionInfoReceived])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      int v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL v5 = [(VCSessionParticipant *)self->_localParticipant isAudioEnabled];
        BOOL v6 = [(VCSessionParticipant *)self->_localParticipant isVideoEnabled];
        BOOL v7 = [(VCSessionParticipant *)self->_localParticipant isScreenEnabled];
        int v10 = 136316418;
        uint64_t v11 = v3;
        __int16 v12 = 2080;
        __int16 v13 = "-[VCSession broadcastInitialMediaState]";
        __int16 v14 = 1024;
        int v15 = 2515;
        __int16 v16 = 1024;
        BOOL v17 = v5;
        __int16 v18 = 1024;
        BOOL v19 = v6;
        __int16 v20 = 1024;
        BOOL v21 = v7;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Broadcasting initial state. audioEnabled=%d videoEnabled=%d screenEnabled=%d", (uint8_t *)&v10, 0x2Eu);
      }
    }
    [(VCSession *)self broadcastMediaStateUpdateMessage];
    if ([(VCSessionParticipant *)self->_localParticipant isAudioEnabled]) {
      BOOL v8 = @"VCSessionMessageAudioEnabled";
    }
    else {
      BOOL v8 = @"VCSessionMessageAudioDisabled";
    }
    [(VCSession *)self broadcastSingleStateMessage:v8 withTopic:@"VCSessionMessageTopicAudioEnabledState"];
    if ([(VCSessionParticipant *)self->_localParticipant isVideoEnabled]) {
      BOOL v9 = @"VCSessionMessageVideoEnabled";
    }
    else {
      BOOL v9 = @"VCSessionMessageVideoDisabled";
    }
    [(VCSession *)self broadcastSingleStateMessage:v9 withTopic:@"VCSessionMessageTopicVideoEnabledStateb"];
  }
}

+ (void)addUUIDToMutableData:(id)a3 fromUUIDString:(id)a4
{
  v6[2] = *MEMORY[0x1E4F143B8];
  BOOL v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:a4];
  v6[0] = 0xAAAAAAAAAAAAAAAALL;
  v6[1] = 0xAAAAAAAAAAAAAAAALL;
  [v5 getUUIDBytes:v6];

  [a3 appendBytes:v6 length:16];
}

- (id)newEncryptionLabelWithLocalUUID:(id)a3 remoteUUID:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithBytes:"VCControlChannelV2" length:18];
  if (self->_forceFixedEncryptionLabel)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      int v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315906;
        uint64_t v12 = v9;
        __int16 v13 = 2080;
        __int16 v14 = "-[VCSession newEncryptionLabelWithLocalUUID:remoteUUID:]";
        __int16 v15 = 1024;
        int v16 = 2534;
        __int16 v17 = 2080;
        __int16 v18 = "VCControlChannelV2";
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Fixed label '%s' is being used due to default", (uint8_t *)&v11, 0x26u);
      }
    }
  }
  else
  {
    +[VCSession addUUIDToMutableData:v7 fromUUIDString:a3];
    +[VCSession addUUIDToMutableData:v7 fromUUIDString:a4];
  }
  return v7;
}

+ (void)cleanupControlChannelParticipantConfig:(id *)a3
{
  if (a3)
  {
    int var4 = a3->var4;
    if (var4) {
      CFRelease(var4);
    }
    int var3 = a3->var3;
    if (var3) {
      CFRelease(var3);
    }
    int var2 = a3->var2;
    if (var2) {
      CFRelease(var2);
    }
    int var1 = a3->var1;
    if (var1)
    {
      CFRelease(var1);
    }
  }
}

- (BOOL)composeControlChannelParticipantConfig:(id *)a3 withRemoteParticipant:(id)a4
{
  if (a3)
  {
    BOOL v5 = a3;
    if (a4)
    {
      [a4 capabilities];
      v5->int var0 = v7;
      v5->var5 = 1;
      BOOL v8 = -[VCSession newEncryptionLabelWithLocalUUID:remoteUUID:](self, "newEncryptionLabelWithLocalUUID:remoteUUID:", -[VCSessionParticipant uuid](self->_localParticipant, "uuid"), [a4 uuid]);
      v5->int var3 = v8;
      if (v8)
      {
        uint64_t v9 = -[VCSession newEncryptionLabelWithLocalUUID:remoteUUID:](self, "newEncryptionLabelWithLocalUUID:remoteUUID:", [a4 uuid], -[VCSessionParticipant uuid](self->_localParticipant, "uuid"));
        v5->int var4 = v9;
        if (v9)
        {
          uint64_t v10 = *MEMORY[0x1E4F1CF80];
          if (VCSecurityKeyHolder_Create(*MEMORY[0x1E4F1CF80], (uint64_t)self->_securityKeyManager, 1, [(VCSessionParticipant *)self->_localParticipant idsParticipantID], 0, 2u, (uint64_t *)&v5->var1))
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                -[VCSession composeControlChannelParticipantConfig:withRemoteParticipant:].cold.6();
              }
            }
          }
          else
          {
            if (!VCSecurityKeyHolder_Create(v10, (uint64_t)self->_securityKeyManager, 2, [a4 idsParticipantID], objc_msgSend(a4, "isParticipantIDBasedKeyLookupEnabled"), 2u, (uint64_t *)&v5->var2))
            {
              BOOL v5 = 0;
              BOOL v11 = 1;
              goto LABEL_8;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                -[VCSession composeControlChannelParticipantConfig:withRemoteParticipant:].cold.5();
              }
            }
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSession composeControlChannelParticipantConfig:withRemoteParticipant:].cold.4();
          }
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSession composeControlChannelParticipantConfig:withRemoteParticipant:]();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSession composeControlChannelParticipantConfig:withRemoteParticipant:]();
      }
    }
    BOOL v11 = 0;
    goto LABEL_8;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCSession composeControlChannelParticipantConfig:withRemoteParticipant:]();
    }
  }
  BOOL v11 = 0;
  BOOL v5 = 0;
LABEL_8:
  +[VCSession cleanupControlChannelParticipantConfig:v5];
  return v11;
}

- (BOOL)isNetworkForcingECNDefaultSet
{
  CFPropertyListRef v2 = CFPreferencesCopyAppValue(@"network_enable_l4s", @"-g");
  CFPropertyListRef v3 = v2;
  if (v2) {
    CFRelease(v2);
  }
  return v3 != 0;
}

- (BOOL)isAVCForcingECNDefaultSet
{
  CFPropertyListRef v2 = CFPreferencesCopyAppValue(@"ecnEnabled", @"com.apple.VideoConference");
  CFPropertyListRef v3 = v2;
  if (v2) {
    CFRelease(v2);
  }
  return v3 != 0;
}

- (BOOL)isECNPermittedFromNetworkingLayer
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(VCSession *)self isNetworkForcingECNDefaultSet]) {
    BOOL v2 = CFPreferencesGetAppBooleanValue(@"network_enable_l4s", @"-g", 0) != 0;
  }
  else {
    BOOL v2 = 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    int v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315906;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      uint64_t v9 = "-[VCSession isECNPermittedFromNetworkingLayer]";
      __int16 v10 = 1024;
      int v11 = 2611;
      __int16 v12 = 1024;
      BOOL v13 = v2;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Network layer ECN Default is set=%d", (uint8_t *)&v6, 0x22u);
    }
  }
  return v2;
}

- (BOOL)isECNCapableWithRemoteParticipant:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(VCCallInfoBlob *)[(VCSessionParticipant *)self->_localParticipant callInfoBlob] frameworkVersion];
  int v6 = objc_msgSend((id)objc_msgSend(a3, "callInfoBlob"), "frameworkVersion");
  LODWORD(v5) = [(NSString *)v5 integerValue];
  int v7 = [v6 integerValue];
  int v8 = [@"1965" integerValue];
  BOOL v10 = (int)v5 >= v8 && v7 >= v8;
  BOOL v11 = v7 < (int)[@"2045" integerValue];
  double v12 = (double)arc4random() / 4294967300.0;
  objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-ecn-enabled-p2p-only", @"ecnEnabledProbabiltyForP2POnly", &unk_1F3DC8B40, 1), "doubleValue");
  if (v12 >= v13 || v11) {
    unsigned __int8 v15 = 4;
  }
  else {
    unsigned __int8 v15 = 1;
  }
  self->_int ecnLinkType = v15;
  self->_BOOL isECNCapable = v10;
  self->_BOOL isECNEnabled = v11;
  uint64_t v16 = VCConnectionManager_CopyPrimaryConnection((uint64_t)[(VCTransportSession *)self->_transportSession connectionManager]);
  __int16 v17 = (void *)v16;
  if (v16 && (VCConnection_IsRelay(v16) & 1) == 0) {
    self->_BOOL isECNEnabled = 1;
  }

  if ([(VCSession *)self isAVCForcingECNDefaultSet])
  {
    BOOL BoolValueForKey = VCDefaults_GetBoolValueForKey(@"ecnEnabled", self->_isECNEnabled);
    self->_BOOL isECNEnabled = BoolValueForKey;
    self->_BOOL isECNCapable = BoolValueForKey;
    self->_int ecnLinkType = 0;
  }
  VCRateControlFeedbackController_SetLinkTypeToSupportECN((uint64_t)[(AVCRateController *)self->_oneToOneSettings.rateController feedbackController], self->_ecnLinkType);
  if ((network_config_get_l4s_enabled() & 1) == 0)
  {
    self->_BOOL isECNEnabled = 0;
    self->_BOOL isECNCapable = 0;
    self->_int ecnLinkType = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      __int16 v20 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v30 = 136315650;
        uint64_t v31 = v19;
        __int16 v32 = 2080;
        long long v33 = "-[VCSession isECNCapableWithRemoteParticipant:]";
        __int16 v34 = 1024;
        int v35 = 2669;
        _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Forced turned off ECN via developer setting", (uint8_t *)&v30, 0x1Cu);
      }
    }
  }
  if ([(VCSession *)self isNetworkForcingECNDefaultSet])
  {
    BOOL v21 = [(VCSession *)self isECNPermittedFromNetworkingLayer];
    self->_isECNForcedByNetwork = v21;
    self->_BOOL isECNCapable = v21;
    self->_BOOL isECNEnabled = v21;
    self->_int ecnLinkType = 3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      uint64_t v23 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v30 = 136315650;
        uint64_t v31 = v22;
        __int16 v32 = 2080;
        long long v33 = "-[VCSession isECNCapableWithRemoteParticipant:]";
        __int16 v34 = 1024;
        int v35 = 2676;
        _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Forced ECN setting via networking layer default", (uint8_t *)&v30, 0x1Cu);
      }
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v24 = VRTraceErrorLogLevelToCSTR();
    BOOL v25 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL isECNEnabled = self->_isECNEnabled;
      BOOL isECNCapable = self->_isECNCapable;
      int ecnLinkType = self->_ecnLinkType;
      int v30 = 136316674;
      uint64_t v31 = v24;
      __int16 v32 = 2080;
      long long v33 = "-[VCSession isECNCapableWithRemoteParticipant:]";
      __int16 v34 = 1024;
      int v35 = 2679;
      __int16 v36 = 1024;
      BOOL v37 = isECNEnabled;
      __int16 v38 = 1024;
      BOOL v39 = isECNCapable;
      __int16 v40 = 1024;
      BOOL v41 = v10;
      __int16 v42 = 1024;
      int v43 = ecnLinkType;
      _os_log_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d _isECNEnabled=%d, _isECNCapable=%d, buildSettingECNParam=%d, _ecnLinkType=%d", (uint8_t *)&v30, 0x34u);
    }
  }
  return self->_isECNCapable;
}

- (void)setBytesInFlightFlagWithParticipant:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "callInfoBlob"), "frameworkVersion"), "integerValue");
  int v5 = [@"2015" integerValue];
  int v6 = _os_feature_enabled_impl();
  int v7 = v6;
  if (v4 >= v5) {
    BOOL v8 = v6;
  }
  else {
    BOOL v8 = 0;
  }
  self->_BOOL isBytesInFlightAdaptationEnabled = v8;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    BOOL v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL isBytesInFlightAdaptationEnabled = self->_isBytesInFlightAdaptationEnabled;
      int v12 = 136316418;
      uint64_t v13 = v9;
      __int16 v14 = 2080;
      unsigned __int8 v15 = "-[VCSession setBytesInFlightFlagWithParticipant:]";
      __int16 v16 = 1024;
      int v17 = 2695;
      __int16 v18 = 1024;
      BOOL v19 = isBytesInFlightAdaptationEnabled;
      __int16 v20 = 1024;
      BOOL v21 = v4 >= v5;
      __int16 v22 = 1024;
      int v23 = v7;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d isBytesInFlightAdaptationEnabled=%d remoteBIFSupported=%d localBIFEnabled=%d", (uint8_t *)&v12, 0x2Eu);
    }
  }
}

- (BOOL)registerRemoteParticipantToSession:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sessionQueue);
  memset(v12, 0, sizeof(v12));
  if (![(VCSession *)self composeControlChannelParticipantConfig:v12 withRemoteParticipant:a3])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSession registerRemoteParticipantToSession:]();
      }
    }
    goto LABEL_20;
  }
  if (!-[VCControlChannelMultiWay addActiveParticipant:participantUUID:withConfiguration:](self->_controlChannel, "addActiveParticipant:participantUUID:withConfiguration:", [a3 idsParticipantID], objc_msgSend(a3, "uuid"), v12))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSession registerRemoteParticipantToSession:]();
      }
    }
LABEL_20:
    BOOL v10 = 0;
    goto LABEL_13;
  }
  sessionMessaging = self->_sessionMessaging;
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a3, "idsParticipantID"));
  [(VCSessionMessaging *)sessionMessaging addParticipant:v6 controlChannelProtocolVersion:LODWORD(v12[0])];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_remoteParticipantsMapByUUID, "setObject:forKeyedSubscript:", a3, [a3 uuid]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_remoteParticipantsMapByServerID, "setObject:forKeyedSubscript:", a3, objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a3, "idsParticipantID")));
  [(VCSessionParticipantLocal *)self->_localParticipant setRemoteParticipants:[(NSMutableDictionary *)self->_remoteParticipantsMapByUUID allValues]];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    BOOL v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = [(NSMutableDictionary *)self->_remoteParticipantsMapByUUID count];
      *(_DWORD *)buf = 136315906;
      uint64_t v14 = v7;
      __int16 v15 = 2080;
      __int16 v16 = "-[VCSession registerRemoteParticipantToSession:]";
      __int16 v17 = 1024;
      int v18 = 2714;
      __int16 v19 = 1024;
      int v20 = v9;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Participant count:%d", buf, 0x22u);
    }
  }
  [(VCSession *)self sendThermalAndSliceMessageToPariticipant:a3];
  [(VCSession *)self sendNetworkCapabilitiesMessageToParticipant:a3];
  [(VCSession *)self updateLocalStreamConfiguration];
  [(VCSession *)self reportingSessionParticipantEvent:161 withParticipant:a3];
  if (self->_currentActiveConnection) {
    objc_msgSend(a3, "handleActiveConnectionChange:");
  }
  if (!self->_oneToOneModeEnabled)
  {
    [(VCSessionDownlinkBandwidthAllocator *)self->_downlinkBandwidthAllocator registerForBandwidthAllocationWithClient:a3];
    [(VCSession *)self distributeBitrateAndOptInToStreamIDsWithSeamlessTransition:1];
  }
  if (self->_state == 3) {
    [(VCSession *)self messageMediaInitialStateToParticipant:a3];
  }
  BOOL v10 = 1;
LABEL_13:
  +[VCSession cleanupControlChannelParticipantConfig:v12];
  return v10;
}

- (void)removeDelegatesForRemoteParticipant:(id)a3
{
}

- (void)unregisterRemoteParticipantFromSession:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!self->_oneToOneModeEnabled)
  {
    [(VCSessionDownlinkBandwidthAllocator *)self->_downlinkBandwidthAllocator deregisterForBandwidthAllocationWithClient:a3];
    [(VCSession *)self distributeBitrateAndOptInToStreamIDsWithSeamlessTransition:1];
  }
  [(VCSession *)self reportingSessionParticipantEvent:162 withParticipant:a3];
  -[VCControlChannelMultiWay removeActiveParticipant:](self->_controlChannel, "removeActiveParticipant:", [a3 idsParticipantID]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_remoteParticipantsMapByUUID, "setObject:forKeyedSubscript:", 0, [a3 uuid]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_remoteParticipantsMapByServerID, "setObject:forKeyedSubscript:", 0, objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a3, "idsParticipantID")));
  [(VCSessionParticipantLocal *)self->_localParticipant setRemoteParticipants:[(NSMutableDictionary *)self->_remoteParticipantsMapByUUID allValues]];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = [(NSMutableDictionary *)self->_remoteParticipantsMapByUUID count];
      int v8 = 136315906;
      uint64_t v9 = v5;
      __int16 v10 = 2080;
      BOOL v11 = "-[VCSession unregisterRemoteParticipantFromSession:]";
      __int16 v12 = 1024;
      int v13 = 2762;
      __int16 v14 = 1024;
      int v15 = v7;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Participant count:%d", (uint8_t *)&v8, 0x22u);
    }
  }
  [(VCSession *)self updateLocalStreamConfiguration];
}

- (void)sendSymptomsToRemoteParticipants:(id)a3 symptom:(id)a4 groupID:(id)a5
{
  void block[8] = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__VCSession_sendSymptomsToRemoteParticipants_symptom_groupID___block_invoke;
  block[3] = &unk_1E6DB6740;
  block[4] = a4;
  void block[5] = a5;
  void block[6] = a3;
  void block[7] = self;
  dispatch_async(sessionQueue, block);
}

void __62__VCSession_sendSymptomsToRemoteParticipants_symptom_groupID___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v2 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"VCSessionMessageSymptom"];
  [v2 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"VCSessionMessageGroupID"];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    int v4 = *MEMORY[0x1E4F47A50];
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 136315906;
        uint64_t v19 = v3;
        __int16 v20 = 2080;
        uint64_t v21 = "-[VCSession sendSymptomsToRemoteParticipants:symptom:groupID:]_block_invoke";
        __int16 v22 = 1024;
        int v23 = 2772;
        __int16 v24 = 2048;
        uint64_t v25 = v6;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d remoteParticipantIDs = %p", buf, 0x26u);
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      __62__VCSession_sendSymptomsToRemoteParticipants_symptom_groupID___block_invoke_cold_1();
    }
  }
  int v7 = *(void **)(a1 + 48);
  if (v7 && !objc_msgSend(v7, "isEqual:", objc_msgSend(MEMORY[0x1E4F1CA98], "null")))
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    int v8 = *(void **)(a1 + 48);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v13 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*(void *)(a1 + 56) + 224), "sendMessageDictionary:withTopic:participantID:", v2, @"VCSessionMessageTopicSymptom", objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 56) + 256), "objectForKeyedSubscript:", *(void *)(*((void *)&v14 + 1) + 8 * i)), "idsParticipantID"));
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v13 count:16];
      }
      while (v10);
    }
  }
  else
  {
    [*(id *)(a1 + 56) broadcastMessageDictionary:v2 withTopic:@"VCSessionMessageTopicSymptom"];
  }
}

+ (void)initVideoFeatureStatusSettings:(tagVCReportingClientSettingsPersist *)a3
{
  if (a3)
  {
    *(void *)&a3->int var0 = -1;
    int v4 = objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "copyInitialStatsDictionary");
    uint64_t v5 = (void *)[v4 objectForKeyedSubscript:@"VideoEyeContact"];
    if (v5) {
      a3->int var0 = [v5 intValue];
    }
    uint64_t v6 = (void *)[v4 objectForKeyedSubscript:@"REFENB"];
    if (v6) {
      a3->var5 = [v6 intValue];
    }
    int v7 = (void *)[v4 objectForKeyedSubscript:@"CSFENB"];
    if (v7) {
      a3->int var2 = [v7 intValue];
    }
    int v8 = (void *)[v4 objectForKeyedSubscript:@"PMFENB"];
    if (v8) {
      a3->int var3 = [v8 intValue];
    }
    uint64_t v9 = (void *)[v4 objectForKeyedSubscript:@"SLFENB"];
    if (v9) {
      a3->int var4 = [v9 intValue];
    }
    uint64_t v10 = (void *)[v4 objectForKeyedSubscript:@"BGRFENB"];
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
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = 0xAAAAAAAAAAAAAAAALL;
  v4[0] = 0;
  abSwitches = self->_abSwitches;
  if (abSwitches) {
    abSwitches = [(VCSessionSwitches *)abSwitches switches];
  }
  v4[1] = abSwitches;
  LOBYTE(v5) = [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] enableNetworkConditionMonitoring];
  BYTE1(v5) = [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] enableMotionBasedDuplication];
  +[VCSession initVideoFeatureStatusSettings:v4];
  if (self->_oneToOneModeEnabled) {
    BYTE1(v4[0]) = +[VCHardwareSettings isMLEnhanceOneToOneSupported];
  }
  reportingSetReportingClientPersistentSetting();
}

- (void)cleanupVCRC
{
  uplinkMediaController = self->_uplinkMediaController;
}

- (void)cleanupNwActivity
{
  parentNWActivity = self->_parentNWActivity;
  if (parentNWActivity) {
    nw_release(parentNWActivity);
  }
  if (self->_nwActivity)
  {
    nw_activity_complete_with_reason();
    nwActivity = self->_nwActivity;
    nw_release(nwActivity);
  }
}

- (void)setupMultiwayABTesting
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(VCSwitchManager *)self->_switchManager initializeLocalSwitches];
  [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] setUseMediaDrivenDuplication:[(VCSwitchManager *)self->_switchManager isLocalSwitchEnabled:0x20000000]];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    int v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v5 = [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] useMediaDrivenDuplication];
      int v6 = 136315906;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      uint64_t v9 = "-[VCSession setupMultiwayABTesting]";
      __int16 v10 = 1024;
      int v11 = 2877;
      __int16 v12 = 1024;
      BOOL v13 = v5;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Load switch useMediaDrivenDuplication %d", (uint8_t *)&v6, 0x22u);
    }
  }
}

- (void)setIsSpatialAudioSupported:(BOOL)a3
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (self->_isSpatialAudioSupported != a3)
  {
    self->_isSpatialAudioSupported = a3;
    uint64_t v3 = @"SpatialAudioSupported";
    v4[0] = objc_msgSend(NSNumber, "numberWithBool:");
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
    reportingGenericEvent();
  }
}

- (void)registerQoSReporting
{
}

uint64_t __33__VCSession_registerQoSReporting__block_invoke(uint64_t a1, uint64_t a2)
{
  int v4 = +[VCQoSMonitorManager sharedInstance];
  uint64_t v5 = *(void *)(a1 + 32);

  return [(VCQoSMonitorManager *)v4 updateQoSReport:a2 toClientsWithToken:v5];
}

uint64_t __33__VCSession_registerQoSReporting__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = +[VCQoSMonitorManager sharedInstance];
  uint64_t v6 = *(void *)(a1 + 32);

  return [(VCQoSMonitorManager *)v5 updateEventDrivenQoSReport:a3 toClientsWithToken:v6];
}

- (void)unregisterQoSReporting
{
  reportingSetPeriodicAggregationOccuredHandler();
  [(VCObject *)self reportingAgent];
  ReportingVC_SetEventDrivenAggregationOccurredHandler();
  uint64_t v3 = +[VCQoSMonitorManager sharedInstance];
  uint64_t transportSessionID = self->_transportSessionID;

  [(VCQoSMonitorManager *)v3 unregisterQoSReportingSourceForToken:transportSessionID];
}

- (BOOL)generateReceptionReportList:(_RTCP_RECEPTION_REPORT *)a3 reportCount:(char *)a4
{
  return 0;
}

- (BOOL)handleEncryptionInfoChange:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  -[VCSession reportingSessionParticipantEvent:withParticipant:keyChangeReason:newMKI:](self, "reportingSessionParticipantEvent:withParticipant:keyChangeReason:newMKI:", 167, self->_localParticipant, 0, [a3 objectForKeyedSubscript:@"SecurityKeyIndex"]);
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__VCSession_handleEncryptionInfoChange___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a3;
  dispatch_async(sessionQueue, block);
  return 1;
}

void __40__VCSession_handleEncryptionInfoChange___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 240) handleEncryptionInfoChange:*(void *)(a1 + 40)];
  if (([*(id *)(*(void *)(a1 + 32) + 240) encryptionInfoReceived] & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 240) setEncryptionInfoReceived:1];
    [*(id *)(a1 + 32) broadcastInitialMediaState];
  }
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      int v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(__CFString **)(*(void *)(a1 + 32) + 208);
        int v13 = 136315906;
        uint64_t v14 = v3;
        __int16 v15 = 2080;
        long long v16 = "-[VCSession handleEncryptionInfoChange:]_block_invoke";
        __int16 v17 = 1024;
        int v18 = 2935;
        __int16 v19 = 2112;
        __int16 v20 = v5;
        uint64_t v6 = "VCSession [%s] %s:%d Received encryption info from IDS with destination[%@]";
        uint64_t v7 = v4;
        uint32_t v8 = 38;
LABEL_13:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v13, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      id v2 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      id v2 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      __int16 v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        uint64_t v12 = *(void *)(v11 + 208);
        int v13 = 136316418;
        uint64_t v14 = v9;
        __int16 v15 = 2080;
        long long v16 = "-[VCSession handleEncryptionInfoChange:]_block_invoke";
        __int16 v17 = 1024;
        int v18 = 2935;
        __int16 v19 = 2112;
        __int16 v20 = v2;
        __int16 v21 = 2048;
        uint64_t v22 = v11;
        __int16 v23 = 2112;
        uint64_t v24 = v12;
        uint64_t v6 = "VCSession [%s] %s:%d %@(%p) Received encryption info from IDS with destination[%@]";
        uint64_t v7 = v10;
        uint32_t v8 = 58;
        goto LABEL_13;
      }
    }
  }
}

- (void)resetDecryptionTimeout
{
  v3[5] = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __35__VCSession_resetDecryptionTimeout__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(sessionQueue, v3);
}

uint64_t __35__VCSession_resetDecryptionTimeout__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  os_log_t v1 = (void *)[*(id *)(*(void *)(a1 + 32) + 248) allValues];
  uint64_t result = [v1 countByEnumeratingWithState:&v7 objects:v6 count:16];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v5++) resetDecryptionTimeout];
      }
      while (v3 != v5);
      uint64_t result = [v1 countByEnumeratingWithState:&v7 objects:v6 count:16];
      uint64_t v3 = result;
    }
    while (result);
  }
  return result;
}

- (void)didEncryptionKeyRollTimeout
{
  [(VCObject *)self reportingAgent];
  reportingSymptom();
  id v3 = +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", 21, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession.m", 2951), 0);

  [(VCSession *)self stopWithError:v3];
}

- (id)computeConversationTimeBaseTruncated
{
  [(NSDate *)self->_conversationTimeBase timeIntervalSinceReferenceDate];
  double v3 = (double)(14400 * ((int)v2 / 14400));
  uint64_t v4 = (void *)MEMORY[0x1E4F1C9C8];

  return (id)[v4 dateWithTimeIntervalSinceReferenceDate:v3];
}

- (__CFDictionary)getClientSpecificUserInfo
{
  v8[3] = *MEMORY[0x1E4F143B8];
  uuid = self->_uuid;
  conversationID = self->_conversationID;
  v7[0] = @"VCSUUID";
  v7[1] = @"CID";
  if (conversationID) {
    uint64_t v4 = (__CFString *)conversationID;
  }
  else {
    uint64_t v4 = &stru_1F3D3E450;
  }
  v8[0] = uuid;
  v8[1] = v4;
  v7[2] = @"ConversationBaseDate";
  conversationTimeBaseTruncated = self->_conversationTimeBaseTruncated;
  if (!conversationTimeBaseTruncated) {
    conversationTimeBaseTruncated = [(VCSession *)self computeConversationTimeBaseTruncated];
  }
  v8[2] = conversationTimeBaseTruncated;
  return (__CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];
}

- (void)reportingSessionParticipantEvent:(unsigned __int16)a3 withParticipant:(id)a4 streamGroupID:(unsigned int)a5 streamID:(unsigned __int16)a6
{
}

- (void)reportingSessionParticipantEvent:(unsigned __int16)a3 withParticipant:(id)a4
{
}

- (void)reportingSessionParticipantEvent:(unsigned __int16)a3 keyChangeReason:(id)a4 newMKI:(id)a5
{
}

- (void)reportingSessionParticipantEvent:(unsigned __int16)a3 withParticipant:(id)a4 keyChangeReason:(id)a5 newMKI:(id)a6
{
}

- (void)reportingSessionParticipantEvent:(unsigned __int16)a3 withParticipant:(id)a4 keyChangeReason:(id)a5 newMKI:(id)a6 withStreamGroupID:(unsigned int)a7 withStreamID:(unsigned __int16)a8
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  __int16 v26 = 0;
  if (self->super._reportingAgent)
  {
    uint64_t v10 = *(void *)&a7;
    uint64_t v14 = a3;
    if (a4 || (unsigned __int16)(a3 - 170) > 8u)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      LOWORD(v25) = a8;
      [(VCSession *)self collectSessionEventKeyFieldsAndSubtype:Mutable eventType:v14 withParticipant:a4 keyChangeReason:a5 newMKI:a6 withStreamGroupID:v10 withStreamID:v25 collectSubtype:&v26];
      reportingGenericEvent();
      if (Mutable) {
        CFRelease(Mutable);
      }
    }
    else
    {
      if ((VCSession *)objc_opt_class() != self)
      {
        if (objc_opt_respondsToSelector()) {
          __int16 v15 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
        }
        else {
          __int16 v15 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          return;
        }
        uint64_t v23 = VRTraceErrorLogLevelToCSTR();
        uint64_t v24 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          return;
        }
        *(_DWORD *)buf = 136316418;
        uint64_t v28 = v23;
        __int16 v29 = 2080;
        int v30 = "-[VCSession reportingSessionParticipantEvent:withParticipant:keyChangeReason:newMKI:withStreamGroupID:withStreamID:]";
        __int16 v31 = 1024;
        int v32 = 2993;
        __int16 v33 = 2112;
        __int16 v34 = v15;
        __int16 v35 = 2048;
        __int16 v36 = self;
        __int16 v37 = 1024;
        int v38 = v14;
        __int16 v20 = "VCSession [%s] %s:%d %@(%p) Session Event failed - EventType:%d needs a participant but it is nil";
        __int16 v21 = v24;
        uint32_t v22 = 54;
LABEL_27:
        _os_log_error_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_ERROR, v20, buf, v22);
        return;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSession reportingSessionParticipantEvent:withParticipant:keyChangeReason:newMKI:withStreamGroupID:withStreamID:]();
        }
      }
    }
  }
  else if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSession reportingSessionParticipantEvent:withParticipant:keyChangeReason:newMKI:withStreamGroupID:withStreamID:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      long long v16 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      long long v16 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      __int16 v19 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v28 = v18;
        __int16 v29 = 2080;
        int v30 = "-[VCSession reportingSessionParticipantEvent:withParticipant:keyChangeReason:newMKI:withStreamGroupID:withStreamID:]";
        __int16 v31 = 1024;
        int v32 = 2988;
        __int16 v33 = 2112;
        __int16 v34 = v16;
        __int16 v35 = 2048;
        __int16 v36 = self;
        __int16 v20 = "VCSession [%s] %s:%d %@(%p) Reporting agent is not properly configured";
        __int16 v21 = v19;
        uint32_t v22 = 48;
        goto LABEL_27;
      }
    }
  }
}

- (void)reportingMomentsToGreenTeaWithRequest:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMomentsRequestMode"), "unsignedIntValue") == 2)
  {
    ct_green_tea_logger_create_static();
    CTGreenTeaOsLogHandle = getCTGreenTeaOsLogHandle();
    if (CTGreenTeaOsLogHandle)
    {
      uint64_t v4 = CTGreenTeaOsLogHandle;
      if (os_log_type_enabled(CTGreenTeaOsLogHandle, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v5 = 0;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_INFO, "<FaceTime>[FaceTime][com.apple.AVConference]:Taken FaceTime Live Photo", v5, 2u);
      }
    }
  }
}

- (void)addNegotiatedCipherSuitesForParticipant:(id)a3 toReportingDictionary:(id)a4
{
  uint64_t v7 = [NSString stringWithFormat:@"%@_ABT", @"CPHRS"];
  objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", -[VCSessionConfiguration isOneToOneAuthenticationTagEnabled](self->_configuration, "isOneToOneAuthenticationTagEnabled")), v7);
  uint64_t v8 = [NSString stringWithFormat:@"%@_%d", @"CPHRS", reportingStreamGroupFromStreamGroupID()];
  uint64_t v9 = [a3 negotiatedCipherSuiteForStreamGroupID:1835623282];
  objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", v9), v8);
  uint64_t v10 = [NSString stringWithFormat:@"%@_%d", @"CPHRS", reportingStreamGroupFromStreamGroupID()];
  uint64_t v11 = [a3 negotiatedCipherSuiteForStreamGroupID:1667329381];
  objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", v11), v10);
  uint64_t v12 = [NSString stringWithFormat:@"%@_%d", @"CPHRS", reportingStreamGroupFromStreamGroupID()];
  uint64_t v13 = [a3 negotiatedCipherSuiteForStreamGroupID:1937339233];
  objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", v13), v12);
  uint64_t v14 = [NSString stringWithFormat:@"%@_%d", @"CPHRS", reportingStreamGroupFromStreamGroupID()];
  uint64_t v15 = [a3 negotiatedCipherSuiteForStreamGroupID:1935897189];
  objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", v15), v14);
  uint64_t v16 = [NSString stringWithFormat:@"%@_%d", @"CPHRS", reportingStreamGroupFromStreamGroupID()];
  uint64_t v17 = [a3 negotiatedCipherSuiteForStreamGroupID:1667329399];
  objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", v17), v16);
  uint64_t v18 = [NSString stringWithFormat:@"%@_%d", @"CPHRS", reportingStreamGroupFromStreamGroupID()];
  uint64_t v19 = [a3 negotiatedCipherSuiteForStreamGroupID:1835623287];
  objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", v19), v18);
  uint64_t v20 = [NSString stringWithFormat:@"%@_%d", @"CPHRS", reportingStreamGroupFromStreamGroupID()];
  uint64_t v21 = [a3 negotiatedCipherSuiteForStreamGroupID:1667330164];
  objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", v21), v20);
  uint64_t v22 = [NSString stringWithFormat:@"%@_%d", @"CPHRS", reportingStreamGroupFromStreamGroupID()];
  uint64_t v23 = [a3 negotiatedCipherSuiteForStreamGroupID:1718909044];
  objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", v23), v22);
  uint64_t v24 = [NSString stringWithFormat:@"%@_%d", @"CPHRS", reportingStreamGroupFromStreamGroupID()];
  uint64_t v25 = [a3 negotiatedCipherSuiteForStreamGroupID:1650745716];
  objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", v25), v24);
  uint64_t v26 = [NSString stringWithFormat:@"%@_%d", @"CPHRS", reportingStreamGroupFromStreamGroupID()];
  uint64_t v27 = [a3 negotiatedCipherSuiteForStreamGroupID:1717854580];
  uint64_t v28 = [NSNumber numberWithInteger:v27];

  [a4 setObject:v28 forKeyedSubscript:v26];
}

- (void)collectSessionEventKeyFieldsAndSubtype:(__CFDictionary *)a3 eventType:(unsigned __int16)a4 withParticipant:(id)a5 keyChangeReason:(id)a6 newMKI:(id)a7 withStreamGroupID:(unsigned int)a8 withStreamID:(unsigned __int16)a9 collectSubtype:(unsigned __int16 *)a10
{
  if (a10)
  {
    *a10 = 0;
    switch(a4)
    {
      case 0x9Fu:
        conversationID = (__CFString *)[NSNumber numberWithInt:self->_currentConnectionType];
        uint64_t v14 = @"VCSPConnectionType";
        goto LABEL_39;
      case 0xA0u:
        uint64_t v16 = NSNumber;
        uint64_t v17 = 432;
        goto LABEL_28;
      case 0xA1u:
        CFDictionaryAddValue(a3, @"VCSPIDSID", self->_idsDestination);
        CFDictionaryAddValue(a3, @"VCSPAudioEnabled", (const void *)objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a5, "isAudioEnabled")));
        CFDictionaryAddValue(a3, @"VCSPVideoEnabled", (const void *)objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a5, "isVideoEnabled")));
        CFDictionaryAddValue(a3, @"REMBUILD", (const void *)objc_msgSend((id)objc_msgSend(a5, "callInfoBlob"), "osVersion"));
        CFDictionaryAddValue(a3, @"RDT", (const void *)objc_msgSend((id)objc_msgSend(a5, "callInfoBlob"), "deviceType"));
        CFDictionaryAddValue(a3, @"VCSECNLinkType", (const void *)[NSNumber numberWithUnsignedChar:self->_ecnLinkType]);
        CFDictionaryAddValue(a3, @"MicMode", (const void *)objc_msgSend(NSNumber, "numberWithInteger:", -[VCSession getCurrentMicMode](self, "getCurrentMicMode")));
        [(VCSession *)self addNegotiatedCipherSuitesForParticipant:a5 toReportingDictionary:a3];
        goto LABEL_9;
      case 0xA2u:
LABEL_9:
        BOOL v18 = (unint64_t)[a5 capabilities] >> 32 == 1;
        CFDictionaryAddValue(a3, @"VCSPIsWebUser", (const void *)[NSNumber numberWithBool:v18]);
        conversationID = (__CFString *)[a5 uuid];
        uint64_t v14 = @"VCSPUUID";
        goto LABEL_39;
      case 0xA3u:
        CFDictionaryAddValue(a3, @"VCSPUUID", [(VCSessionParticipant *)self->_localParticipant uuid]);
        CFDictionaryAddValue(a3, @"LocSw", (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[VCSwitchManager localSwitches](self->_switchManager, "localSwitches")));
        CFDictionaryAddValue(a3, @"SesSw", (const void *)objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[VCSessionSwitches switches](self->_abSwitches, "switches")));
        CFDictionaryRef v19 = (const __CFDictionary *)objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "copyInitialStatsDictionary");
        VCUtil_AppendFromDictionary(a3, v19);
        if (v19) {
          CFRelease(v19);
        }
        CFDictionaryAddValue(a3, @"MicMode", (const void *)objc_msgSend(NSNumber, "numberWithInteger:", -[VCSession getCurrentMicMode](self, "getCurrentMicMode")));
        CFDictionaryAddValue(a3, @"SpatialAudioSupported", (const void *)[NSNumber numberWithBool:self->_isSpatialAudioSupported]);
        goto LABEL_13;
      case 0xA4u:
        CFDictionaryAddValue(a3, @"VCSPAudioEnabled", (const void *)objc_msgSend(NSNumber, "numberWithBool:", -[VCSessionParticipant isAudioEnabled](self->_localParticipant, "isAudioEnabled")));
        CFDictionaryAddValue(a3, @"VCSPVideoEnabled", (const void *)objc_msgSend(NSNumber, "numberWithBool:", -[VCSessionParticipant isVideoEnabled](self->_localParticipant, "isVideoEnabled")));
        CFDictionaryAddValue(a3, @"VCSPScreenEnabled", (const void *)objc_msgSend(NSNumber, "numberWithBool:", -[VCSessionParticipant isScreenEnabled](self->_localParticipant, "isScreenEnabled")));
        if (self->_conversationID) {
          conversationID = (__CFString *)self->_conversationID;
        }
        else {
          conversationID = &stru_1F3D3E450;
        }
        uint64_t v14 = @"CID";
        goto LABEL_39;
      case 0xA5u:
      case 0xA6u:
      case 0xAEu:
      case 0xAFu:
      case 0xB0u:
      case 0xB1u:
      case 0xB2u:
      case 0xB3u:
      case 0xB4u:
      case 0xB6u:
      case 0xB7u:
      case 0xB8u:
      case 0xB9u:
      case 0xBAu:
      case 0xBBu:
        return;
      case 0xA7u:
        if ([a5 uuid]) {
          uint64_t v21 = (__CFString *)[a5 uuid];
        }
        else {
          uint64_t v21 = @"nil";
        }
        CFDictionaryAddValue(a3, @"VCSPUUID", v21);
        if (a7) {
          conversationID = (__CFString *)[a7 description];
        }
        else {
          conversationID = @"nil";
        }
        uint64_t v14 = @"VCSNewMKI";
        goto LABEL_39;
      case 0xA8u:
        if (a6) {
          conversationID = (__CFString *)[a6 stringValue];
        }
        else {
          conversationID = @"nil";
        }
        uint64_t v14 = @"VCSKeyChangeReason";
        goto LABEL_39;
      case 0xA9u:
LABEL_13:
        CFDictionaryAddValue(a3, @"VCSOneToOneModeEnabled", (const void *)[NSNumber numberWithBool:self->_oneToOneModeEnabled]);
        CFDictionaryAddValue(a3, @"VCSMode", (const void *)objc_msgSend(NSNumber, "numberWithInteger:", -[VCSessionConfiguration sessionMode](self->_configuration, "sessionMode")));
        conversationID = (__CFString *)objc_msgSend(NSNumber, "numberWithBool:", -[VCSessionConfiguration outOfProcessCodecsEnabled](self->_configuration, "outOfProcessCodecsEnabled"));
        uint64_t v14 = @"VCSOOPCodecs";
        goto LABEL_39;
      case 0xAAu:
        CFDictionaryAddValue(a3, @"VCSPUUID", (const void *)[a5 uuid]);
        conversationID = (__CFString *)objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a5, "isAudioEnabled"));
        uint64_t v14 = @"VCSPAudioEnabled";
        goto LABEL_39;
      case 0xABu:
        CFDictionaryAddValue(a3, @"VCSPUUID", (const void *)[a5 uuid]);
        CFDictionaryAddValue(a3, @"VCSPVideoEnabled", (const void *)objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a5, "isVideoEnabled")));
        *a10 = 1;
        return;
      case 0xACu:
        CFDictionaryAddValue(a3, @"VCSPUUID", (const void *)[a5 uuid]);
        conversationID = (__CFString *)objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a5, "isAudioPaused"));
        uint64_t v14 = @"VCSPAudioPaused";
        goto LABEL_39;
      case 0xADu:
        CFDictionaryAddValue(a3, @"VCSPUUID", (const void *)[a5 uuid]);
        conversationID = (__CFString *)objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a5, "isVideoPaused"));
        uint64_t v14 = @"VCSPVideoPaused";
        goto LABEL_39;
      case 0xB5u:
        uint64_t v16 = NSNumber;
        uint64_t v17 = 436;
LABEL_28:
        conversationID = (__CFString *)[v16 numberWithUnsignedInt:*(unsigned int *)((char *)&self->super.super.isa + v17)];
        uint64_t v14 = @"VCSPTargetBitrate";
        goto LABEL_39;
      case 0xBCu:
        CFDictionaryAddValue(a3, @"VCSPUUID", (const void *)[a5 uuid]);
        CFDictionaryAddValue(a3, @"VCSPScreenEnabled", (const void *)objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a5, "isScreenEnabled")));
        conversationID = (__CFString *)[NSNumber numberWithInt:self->_localParticipant == a5];
        uint64_t v14 = @"VCSPIsLocalParticipant";
        goto LABEL_39;
      default:
        if ((a4 - 232) >= 2) {
          return;
        }
        CFDictionaryAddValue(a3, @"VCMSStreamGroup", (const void *)[NSNumber numberWithUnsignedInt:*(void *)&a8]);
        if ([a5 uuid]) {
          uint64_t v15 = (__CFString *)[a5 uuid];
        }
        else {
          uint64_t v15 = @"nil";
        }
        CFDictionaryAddValue(a3, @"VCSPUUID", v15);
        conversationID = (__CFString *)[NSNumber numberWithUnsignedShort:a9];
        uint64_t v14 = @"VCASStreamIDs";
LABEL_39:
        CFDictionaryAddValue(a3, v14, conversationID);
        break;
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCSession collectSessionEventKeyFieldsAndSubtype:eventType:withParticipant:keyChangeReason:newMKI:withStreamGroupID:withStreamID:collectSubtype:]();
    }
  }
}

- (void)reportingSessionRemoteParticipantEvent:(unsigned __int16)a3 withParticipant:(id)a4 value:(id)a5
{
  int v7 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = @"VCSPAudioEnabled";
  switch(a3)
  {
    case 0xAEu:
      goto LABEL_7;
    case 0xAFu:
      uint64_t v9 = @"VCSPVideoEnabled";
      goto LABEL_7;
    case 0xB0u:
      uint64_t v9 = @"VCSPAudioPaused";
      goto LABEL_7;
    case 0xB1u:
      uint64_t v9 = @"VCSPVideoPaused";
      goto LABEL_7;
    default:
      if (a3 == 189)
      {
        uint64_t v9 = @"VCSPScreenEnabled";
LABEL_7:
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        CFDictionaryAddValue(Mutable, @"VCSPUUID", (const void *)[a4 uuid]);
        CFDictionaryAddValue(Mutable, v9, a5);
        reportingGenericEvent();
        if (Mutable)
        {
          CFRelease(Mutable);
        }
      }
      else if ((VCSession *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSession reportingSessionRemoteParticipantEvent:withParticipant:value:]();
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v11 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
        }
        else {
          uint64_t v11 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v12 = VRTraceErrorLogLevelToCSTR();
          uint64_t v13 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            int v14 = 136316418;
            uint64_t v15 = v12;
            __int16 v16 = 2080;
            uint64_t v17 = "-[VCSession reportingSessionRemoteParticipantEvent:withParticipant:value:]";
            __int16 v18 = 1024;
            int v19 = 3163;
            __int16 v20 = 2112;
            uint64_t v21 = v11;
            __int16 v22 = 2048;
            uint64_t v23 = self;
            __int16 v24 = 1024;
            int v25 = v7;
            _os_log_error_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_ERROR, "VCSession [%s] %s:%d %@(%p) EventType:%d is not relevant for Session Remote Participant Event logging", (uint8_t *)&v14, 0x36u);
          }
        }
      }
      return;
  }
}

- (void)reportLocalRateControlExperimentConfiguration
{
  void v7[3] = *MEMORY[0x1E4F143B8];
  if (self->_oneToOneModeEnabled) {
    double v2 = &OBJC_IVAR___VCSession__oneToOneSettings;
  }
  else {
    double v2 = &OBJC_IVAR___VCSession__uplinkRateController;
  }
  double v3 = *(Class *)((char *)&self->super.super.isa + *v2);
  v6[0] = @"RCEV";
  v7[0] = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "rateControlExperimentConfig"));
  v6[1] = @"RCEG";
  v7[1] = objc_msgSend(NSNumber, "numberWithInt:", (unint64_t)objc_msgSend(v3, "rateControlExperimentConfig") >> 32);
  v6[2] = @"SBVERS";
  uint64_t v4 = NSNumber;
  [v3 rateControlExperimentConfig];
  v7[2] = [v4 numberWithUnsignedInt:v5];
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];
  reportingGenericEvent();
}

- (void)handleThermalPressureNotification:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", @"VCVideoCaptureServer_NotificationKeyThermalPressureLevel"), "intValue");
  uint64_t v9 = @"Thermal";
  v10[0] = [NSNumber numberWithUnsignedInt:v4];
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  sessionQueue = self->_sessionQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__VCSession_handleThermalPressureNotification___block_invoke;
  void v7[3] = &unk_1E6DB3EE0;
  void v7[4] = self;
  v7[5] = v5;
  int v8 = v4;
  dispatch_async(sessionQueue, v7);
}

uint64_t __47__VCSession_handleThermalPressureNotification___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t result = reportingGenericEvent();
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v3 + 688) != *(_DWORD *)(a1 + 48))
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v4 = (void *)[*(id *)(v3 + 248) allValues];
    uint64_t result = [v4 countByEnumeratingWithState:&v9 objects:v8 count:16];
    if (result)
    {
      uint64_t v5 = result;
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(a1 + 32) sendDeviceStateMessageToParticipant:*(void *)(*((void *)&v9 + 1) + 8 * v7++) withStatus:*(void *)(a1 + 40) checkDNUStatus:1];
        }
        while (v5 != v7);
        uint64_t result = [v4 countByEnumeratingWithState:&v9 objects:v8 count:16];
        uint64_t v5 = result;
      }
      while (result);
    }
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 688) = *(_DWORD *)(a1 + 48);
  return result;
}

- (int64_t)getCurrentMicMode
{
  return MEMORY[0x1F40D0E98](@"com.apple.facetime", a2);
}

- (void)handleMicModeNotification:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[a3 userInfo];
  uint64_t v5 = (void *)[v4 objectForKey:*MEMORY[0x1E4F15A00]];
  if (v5)
  {
    if ([v5 isEqualToString:@"com.apple.facetime"])
    {
      int64_t v6 = [(VCSession *)self getCurrentMicMode];
      uint64_t v7 = @"MicMode";
      v8[0] = [NSNumber numberWithInteger:v6];
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
      reportingGenericEvent();
    }
  }
}

- (void)registerForThermalFeatureNotifications
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", self, sel_handleThermalPressureNotification_, @"VCVideoCaptureServer_NotificationNameThermalPressureLevel", 0);
  uint64_t v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = *MEMORY[0x1E4F159F8];

  [v3 addObserver:self selector:sel_handleMicModeNotification_ name:v4 object:0];
}

- (void)deregisterForThermalFeatureNotifications
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:name:object:", self, @"VCVideoCaptureServer_NotificationNameThermalPressureLevel", 0);
  uint64_t v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = *MEMORY[0x1E4F159F8];

  [v3 removeObserver:self name:v4 object:0];
}

- (void)dispatchedAddParticipantWithConfig:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (a3) {
          int v8 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
        }
        else {
          int v8 = "<nil>";
        }
        *(_DWORD *)buf = 136315906;
        uint64_t v47 = v6;
        __int16 v48 = 2080;
        long long v49 = "-[VCSession dispatchedAddParticipantWithConfig:]";
        __int16 v50 = 1024;
        int v51 = 3265;
        __int16 v52 = 2080;
        long long v53 = (void *)v8;
        long long v12 = "VCSession [%s] %s:%d Adding participant[%s]";
        uint64_t v13 = v7;
        uint32_t v14 = 38;
        goto LABEL_17;
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      long long v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (a3) {
          long long v11 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
        }
        else {
          long long v11 = "<nil>";
        }
        *(_DWORD *)buf = 136316418;
        uint64_t v47 = v9;
        __int16 v48 = 2080;
        long long v49 = "-[VCSession dispatchedAddParticipantWithConfig:]";
        __int16 v50 = 1024;
        int v51 = 3265;
        __int16 v52 = 2112;
        long long v53 = v5;
        __int16 v54 = 2048;
        long long v55 = self;
        __int16 v56 = 2080;
        uint64_t v57 = (uint64_t)v11;
        long long v12 = "VCSession [%s] %s:%d %@(%p) Adding participant[%s]";
        uint64_t v13 = v10;
        uint32_t v14 = 58;
LABEL_17:
        _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
      }
    }
  }
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_remoteParticipantsMapByServerID, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a3, "idsParticipantID"))))
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSession dispatchedAddParticipantWithConfig:].cold.5();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v15 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v15 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v22 = VRTraceErrorLogLevelToCSTR();
        uint64_t v23 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v33 = [a3 idsParticipantID];
          *(_DWORD *)buf = 136316418;
          uint64_t v47 = v22;
          __int16 v48 = 2080;
          long long v49 = "-[VCSession dispatchedAddParticipantWithConfig:]";
          __int16 v50 = 1024;
          int v51 = 3268;
          __int16 v52 = 2112;
          long long v53 = v15;
          __int16 v54 = 2048;
          long long v55 = self;
          __int16 v56 = 2048;
          uint64_t v57 = v33;
          _os_log_error_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_ERROR, "VCSession [%s] %s:%d %@(%p) Another participant with same idsParticipantID=%llu already exists!", buf, 0x3Au);
        }
      }
    }
    id v24 = +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", 1, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession.m", 3269), 0);
    notificationQueue = self->_notificationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__VCSession_dispatchedAddParticipantWithConfig___block_invoke;
    block[3] = &unk_1E6DB43D8;
    block[4] = self;
    void block[5] = a3;
    void block[6] = v24;
    uint64_t v26 = block;
    goto LABEL_42;
  }
  if (self->_localParticipant
    && objc_msgSend((id)objc_msgSend(a3, "uuid"), "isEqualToString:", -[VCSessionParticipant uuid](self->_localParticipant, "uuid")))
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSession dispatchedAddParticipantWithConfig:].cold.4();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v16 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v16 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v30 = VRTraceErrorLogLevelToCSTR();
        __int16 v31 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v39 = [a3 uuid];
          *(_DWORD *)buf = 136316418;
          uint64_t v47 = v30;
          __int16 v48 = 2080;
          long long v49 = "-[VCSession dispatchedAddParticipantWithConfig:]";
          __int16 v50 = 1024;
          int v51 = 3278;
          __int16 v52 = 2112;
          long long v53 = v16;
          __int16 v54 = 2048;
          long long v55 = self;
          __int16 v56 = 2112;
          uint64_t v57 = v39;
          _os_log_error_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_ERROR, "VCSession [%s] %s:%d %@(%p) Attempting to add a remote participant that is using same uuid as local participant's uuid=%@!", buf, 0x3Au);
        }
      }
    }
    id v32 = +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", 1, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession.m", 3279), 0);
    notificationQueue = self->_notificationQueue;
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __48__VCSession_dispatchedAddParticipantWithConfig___block_invoke_539;
    v44[3] = &unk_1E6DB43D8;
    v44[4] = self;
    v44[5] = a3;
    v44[6] = v32;
    uint64_t v26 = v44;
    goto LABEL_42;
  }
  objc_msgSend(a3, "setOutOfProcessCodecsEnabled:", -[VCSessionConfiguration outOfProcessCodecsEnabled](self->_configuration, "outOfProcessCodecsEnabled"));
  [a3 setSpatialMetadata:self->_spatialMetadata];
  [a3 setSpatialMetadataEntryMap:self->_mediaTypeToSpatialMetadataEntryMap];
  objc_msgSend(a3, "setMediaNegotiator:", -[VCSessionParticipant mediaNegotiator](self->_localParticipant, "mediaNegotiator"));
  [a3 setSecurityKeyManager:self->_securityKeyManager];
  [a3 setSessionUUID:self->_uuid];
  [a3 setTransportSessionID:self->_transportSessionID];
  [a3 setIdsDestination:self->_idsDestination];
  [a3 setIsGKVoiceChat:self->_isGKVoiceChat];
  objc_msgSend(a3, "setSessionMode:", -[VCSessionConfiguration sessionMode](self->_configuration, "sessionMode"));
  [a3 setNetworkFeedbackController:self->_feedbackController];
  [a3 setCaptionsCoordinator:self->_captionsCoordinator];
  objc_msgSend(a3, "setIsLowLatencyAudio:", +[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass") == 8);
  objc_msgSend(a3, "setIsOneToOneModeEnabled:", -[VCSessionConfiguration isOneToOneModeEnabled](self->_configuration, "isOneToOneModeEnabled"));
  objc_msgSend(a3, "setOneToOneAuthenticationTagEnabled:", -[VCSessionConfiguration isOneToOneAuthenticationTagEnabled](self->_configuration, "isOneToOneAuthenticationTagEnabled"));
  uint64_t v17 = (void *)nw_activity_create();
  [a3 setNwActivity:v17];
  nw_release(v17);
  if (self->_nwActivity)
  {
    [a3 nwActivity];
    nw_activity_set_parent_activity();
  }
  [a3 nwActivity];
  nw_activity_activate();
  [a3 setIsServerRTxEnabled:self->_isServerPacketRetransmissionForVideoEnabled];
  [a3 setIsEnhancedJBAdaptationsEnabled:self->_isEnhancedJBAdaptationsEnabled];
  objc_msgSend(a3, "setEnableMaxCameraBitrateVideoQualityNewTier:", -[VCSessionSwitches isFeatureEnabled:](self->_abSwitches, "isFeatureEnabled:", 64));
  objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "setUpDefaultAspectRatios");
  __int16 v18 = [[VCSessionParticipantRemote alloc] initWithConfig:a3 delegate:self];
  if (!v18)
  {
    id v27 = +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", 15, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession.m", 3322), 0);
    notificationQueue = self->_notificationQueue;
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __48__VCSession_dispatchedAddParticipantWithConfig___block_invoke_2;
    v43[3] = &unk_1E6DB43D8;
    v43[4] = self;
    v43[5] = a3;
    v43[6] = v27;
    uint64_t v26 = v43;
LABEL_42:
    dispatch_async(notificationQueue, v26);
    return;
  }
  int v19 = v18;
  if ([(VCSessionParticipantRemote *)v18 capabilities]) {
    [(VCSessionParticipantLocal *)self->_localParticipant setIsRemoteOnPeace:1];
  }
  [(VCSessionParticipant *)v19 setStatisticsCollector:[(AVCRateController *)self->_downlinkRateController statisticsCollector]];
  [(VCSessionParticipant *)v19 setReportingAgent:self->super._reportingAgent];
  [(VCSessionParticipantRemote *)v19 setSharingEnabled:self->_sharingEnabled];
  [(VCSessionParticipantRemote *)v19 setMediaRecorder:self->_mediaRecorder];
  p_localSourceNeedsReset = &self->_localSourceNeedsReset;
  if (self->_localSourceNeedsReset)
  {
    uint64_t v21 = 10;
    goto LABEL_48;
  }
  if ([(VCSession *)self detectSSRCCollision:v19 resetNeeded:&self->_localSourceNeedsReset])
  {
    if (*p_localSourceNeedsReset) {
      uint64_t v21 = 10;
    }
    else {
      uint64_t v21 = 9;
    }
LABEL_48:
    id v28 = +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", v21, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession.m", 3339), 0);
    __int16 v29 = self->_notificationQueue;
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __48__VCSession_dispatchedAddParticipantWithConfig___block_invoke_3;
    v42[3] = &unk_1E6DB43D8;
    v42[4] = self;
    v42[5] = a3;
    v42[6] = v28;
    dispatch_async(v29, v42);
    if (*p_localSourceNeedsReset && (self->_state | 2) == 3) {
      [(VCSession *)self dispatchedStopWithError:v28];
    }
    goto LABEL_51;
  }
  if (self->_oneToOneModeEnabled)
  {
    if ([(VCSession *)self isECNCapableWithRemoteParticipant:v19])
    {
      if (VCMediaQueue_SetECNEnabled((uint64_t)self->_mediaQueue, self->_isECNEnabled))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSession dispatchedAddParticipantWithConfig:]();
          }
        }
      }
    }
    [(VCSession *)self setBytesInFlightFlagWithParticipant:v19];
    if (![(VCSession *)self addOneToOneParticipant:v19])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSession dispatchedAddParticipantWithConfig:]();
        }
      }
      id v36 = +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", 15, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession.m", 3376), 0);
      __int16 v37 = self->_notificationQueue;
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __48__VCSession_dispatchedAddParticipantWithConfig___block_invoke_541;
      v41[3] = &unk_1E6DB43D8;
      v41[4] = self;
      v41[5] = a3;
      v41[6] = v36;
      dispatch_async(v37, v41);
      goto LABEL_51;
    }
    [(VCSession *)self setTransportConnectionSelectionVersionWithLocalFrameWorkVersion:[(VCCallInfoBlob *)[(VCSessionParticipant *)self->_localParticipant callInfoBlob] frameworkVersion] remoteFrameworkVersion:[(VCCallInfoBlob *)[(VCSessionParticipant *)v19 callInfoBlob] frameworkVersion]];
  }
  else
  {
    if (![(VCSession *)self configureRemoteParticipant:v19 withConfig:a3])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSession dispatchedAddParticipantWithConfig:]();
        }
      }
      goto LABEL_51;
    }
    [(VCSession *)self setDelegatesForRemoteParticipant:v19];
    if (self->_state == 1) {
      [(NSMutableArray *)self->_startingParticipants addObject:v19];
    }
  }
  if ([(VCSessionParticipant *)v19 isVideoEnabled])
  {
    __int16 v34 = [(VCTransportSession *)self->_transportSession connectionManager];
    -[VCConnectionManager addMediaHealthStatsHistoryEntryForParticipantID:](v34, "addMediaHealthStatsHistoryEntryForParticipantID:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a3, "idsParticipantID")));
  }
  if ((self->_state | 2) == 3)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_remoteParticipantsMapByServerID, "setObject:forKeyedSubscript:", v19, objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a3, "idsParticipantID")));
    [(VCSessionParticipantRemote *)v19 start];
  }
  -[VCSessionParticipantRemote updatePositionalInfo:shouldReapply:](v19, "updatePositionalInfo:shouldReapply:", [a3 positionalInfo], 0);
  [(VCSession *)self applySpatialMetadata];
  if ((self->_state | 2) != 3)
  {
    if ([(VCSession *)self registerRemoteParticipantToSession:v19]) {
      id v35 = 0;
    }
    else {
      id v35 = +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", 17, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession.m", 3403), 0);
    }
    int v38 = self->_notificationQueue;
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __48__VCSession_dispatchedAddParticipantWithConfig___block_invoke_2_542;
    v40[3] = &unk_1E6DB43D8;
    v40[4] = self;
    v40[5] = v19;
    v40[6] = v35;
    dispatch_async(v38, v40);
    [(NSMutableArray *)self->_initializingParticipants removeObject:v19];
  }
LABEL_51:
}

uint64_t __48__VCSession_dispatchedAddParticipantWithConfig___block_invoke(uint64_t a1)
{
  double v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) uuid];
  uint64_t v5 = *(void *)(a1 + 48);

  return [v2 vcSession:v3 addParticipantWithID:v4 didSucceed:0 error:v5];
}

uint64_t __48__VCSession_dispatchedAddParticipantWithConfig___block_invoke_539(uint64_t a1)
{
  double v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) uuid];
  uint64_t v5 = *(void *)(a1 + 48);

  return [v2 vcSession:v3 addParticipantWithID:v4 didSucceed:0 error:v5];
}

uint64_t __48__VCSession_dispatchedAddParticipantWithConfig___block_invoke_2(uint64_t a1)
{
  double v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) uuid];
  uint64_t v5 = *(void *)(a1 + 48);

  return [v2 vcSession:v3 addParticipantWithID:v4 didSucceed:0 error:v5];
}

uint64_t __48__VCSession_dispatchedAddParticipantWithConfig___block_invoke_3(uint64_t a1)
{
  double v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) uuid];
  uint64_t v5 = *(void *)(a1 + 48);

  return [v2 vcSession:v3 addParticipantWithID:v4 didSucceed:0 error:v5];
}

uint64_t __48__VCSession_dispatchedAddParticipantWithConfig___block_invoke_541(uint64_t a1)
{
  double v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) uuid];
  uint64_t v5 = *(void *)(a1 + 48);

  return [v2 vcSession:v3 addParticipantWithID:v4 didSucceed:0 error:v5];
}

uint64_t __48__VCSession_dispatchedAddParticipantWithConfig___block_invoke_2_542(uint64_t a1)
{
  double v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) uuid];
  BOOL v5 = *(void *)(a1 + 48) == 0;

  return objc_msgSend(v2, "vcSession:addParticipantWithID:didSucceed:error:", v3, v4, v5);
}

- (BOOL)configureRemoteParticipant:(id)a3 withConfig:(id)a4
{
  v15[7] = *MEMORY[0x1E4F143B8];
  if (-[VCSession setOneToOneConfigOnRemoteParticipant:](self, "setOneToOneConfigOnRemoteParticipant:"))
  {
    if (objc_msgSend(a3, "configureWithDeviceRole:negotiatedVideoEnabled:negotiatedScreenEnabled:operatingMode:", +[VCSession deviceRoleForSessionMode:](VCSession, "deviceRoleForSessionMode:", -[VCSessionConfiguration sessionMode](self->_configuration, "sessionMode")), 0, 0, 6))
    {
      [(NSMutableArray *)self->_initializingParticipants addObject:a3];
      return 1;
    }
    id v13 = +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", 17, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession.m", 3428), 0);
    notificationQueue = self->_notificationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__VCSession_configureRemoteParticipant_withConfig___block_invoke_2;
    block[3] = &unk_1E6DB43D8;
    block[4] = self;
    void block[5] = a4;
    void block[6] = v13;
    long long v12 = block;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSession configureRemoteParticipant:withConfig:](v8, a3, v9);
      }
    }
    id v10 = +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", 17, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession.m", 3420), 0);
    notificationQueue = self->_notificationQueue;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __51__VCSession_configureRemoteParticipant_withConfig___block_invoke;
    v15[3] = &unk_1E6DB43D8;
    v15[4] = self;
    v15[5] = a4;
    v15[6] = v10;
    long long v12 = v15;
  }
  dispatch_async(notificationQueue, v12);
  return 0;
}

uint64_t __51__VCSession_configureRemoteParticipant_withConfig___block_invoke(uint64_t a1)
{
  double v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) uuid];
  uint64_t v5 = *(void *)(a1 + 48);

  return [v2 vcSession:v3 addParticipantWithID:v4 didSucceed:0 error:v5];
}

uint64_t __51__VCSession_configureRemoteParticipant_withConfig___block_invoke_2(uint64_t a1)
{
  double v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) uuid];
  uint64_t v5 = *(void *)(a1 + 48);

  return [v2 vcSession:v3 addParticipantWithID:v4 didSucceed:0 error:v5];
}

- (void)dispatchedAddParticipantConfigurations:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(a3);
        }
        [(VCSession *)self dispatchedAddParticipantWithConfig:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [a3 countByEnumeratingWithState:&v10 objects:v9 count:16];
    }
    while (v6);
  }
  if (!self->_oneToOneModeEnabled) {
    [(VCSession *)self distributeBitrateAndOptInToStreamIDsWithSeamlessTransition:1];
  }
}

- (void)dispatchedRemoveParticipant:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v24 = v6;
        __int16 v25 = 2080;
        uint64_t v26 = "-[VCSession dispatchedRemoveParticipant:]";
        __int16 v27 = 1024;
        int v28 = 3448;
        __int16 v29 = 2112;
        id v30 = a3;
        uint64_t v8 = "VCSession [%s] %s:%d Removing participant[%@]";
        uint64_t v9 = v7;
        uint32_t v10 = 38;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      long long v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v24 = v11;
        __int16 v25 = 2080;
        uint64_t v26 = "-[VCSession dispatchedRemoveParticipant:]";
        __int16 v27 = 1024;
        int v28 = 3448;
        __int16 v29 = 2112;
        id v30 = v5;
        __int16 v31 = 2048;
        id v32 = self;
        __int16 v33 = 2112;
        id v34 = a3;
        uint64_t v8 = "VCSession [%s] %s:%d %@(%p) Removing participant[%@]";
        uint64_t v9 = v12;
        uint32_t v10 = 58;
        goto LABEL_11;
      }
    }
  }
  uint64_t v13 = [(NSMutableDictionary *)self->_remoteParticipantsMapByUUID objectForKeyedSubscript:a3];
  if (v13)
  {
    uint64_t v14 = (VCSessionParticipantRemote *)v13;
    if (self->_oneToOneModeEnabled)
    {
      VCConnectionManager_AddTelemetryForPacketHistory((uint64_t)[(VCTransportSession *)self->_transportSession connectionManager], (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]));
      VCReporting_finalizeAggregationWithPayload();
      if (v14 == [(VCSession *)self oneToOneRemoteParticipant]) {
        [(VCSession *)self cleanupOneToOneDelegates];
      }
    }
    int v19 = [(VCTransportSession *)self->_transportSession connectionManager];
    -[VCConnectionManager removeMediaHealthStatsHistoryEntryForParticipantID:](v19, "removeMediaHealthStatsHistoryEntryForParticipantID:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[VCSessionParticipant idsParticipantID](v14, "idsParticipantID")));
    if ((self->_state | 2) == 3) {
      [(VCSessionParticipantRemote *)v14 stop];
    }
    [(NSMutableArray *)self->_startingParticipants removeObject:v14];
    int v20 = [(NSMutableSet *)self->_stoppingParticipants containsObject:v14];
    [(NSMutableSet *)self->_stoppingParticipants removeObject:v14];
    [(NSMutableArray *)self->_initializingParticipants removeObject:v14];
    [(VCSession *)self removeDelegatesForRemoteParticipant:v14];
    if (![(NSMutableSet *)self->_stoppingParticipants count] && v20) {
      [(VCSession *)self processDidStop];
    }
    [(VCSessionParticipant *)v14 participantVideoToken];
    [(VCSessionParticipant *)v14 idsParticipantID];
    kdebug_trace();
    [(VCSession *)self unregisterRemoteParticipantFromSession:v14];
    notificationQueue = self->_notificationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__VCSession_dispatchedRemoveParticipant___block_invoke_2;
    block[3] = &unk_1E6DB3E40;
    block[4] = self;
    void block[5] = a3;
    uint64_t v17 = block;
  }
  else
  {
    id v15 = +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", 3, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession.m", 3451), 0);
    __int16 v16 = self->_notificationQueue;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    void v22[2] = __41__VCSession_dispatchedRemoveParticipant___block_invoke;
    v22[3] = &unk_1E6DB43D8;
    v22[4] = self;
    v22[5] = a3;
    v22[6] = v15;
    uint64_t v17 = v22;
    notificationQueue = v16;
  }
  dispatch_async(notificationQueue, v17);
}

uint64_t __41__VCSession_dispatchedRemoveParticipant___block_invoke(uint64_t a1)
{
  double v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);

  return [v2 vcSession:v3 removeParticipantWithID:v4 didSucceed:0 error:v5];
}

uint64_t __41__VCSession_dispatchedRemoveParticipant___block_invoke_2(uint64_t a1)
{
  double v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v2 vcSession:v3 removeParticipantWithID:v4 didSucceed:1 error:0];
}

- (void)dispatchedStart
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSession [%s] %s:%d Local source marked as invalid. Can't start.", v2, v3, v4, v5, v6);
}

uint64_t __28__VCSession_dispatchedStart__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v2 vcSession:v3 didStart:0 error:v4];
}

uint64_t __28__VCSession_dispatchedStart__block_invoke_545(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v2 vcSession:v3 didStart:0 error:v4];
}

uint64_t __28__VCSession_dispatchedStart__block_invoke_546(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v2 vcSession:v3 didStart:0 error:v4];
}

- (void)stopMediaQueueOneToOne
{
  p_oneToOneSettings = &self->_oneToOneSettings;
  if (self->_oneToOneSettings.mediaQueue != (tagHANDLE *)0xFFFFFFFFLL) {
    MediaQueue_Stop();
  }
  uint64_t vcMediaQueue = (uint64_t)p_oneToOneSettings->vcMediaQueue;
  if (vcMediaQueue)
  {
    VCMediaQueue_Stop(vcMediaQueue);
  }
}

- (void)dispatchedStopWithError:(id)a3
{
}

- (void)dispatchedStopWithError:(id)a3 didRemoteCancel:(BOOL)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_33;
    }
    __str = 0;
    uint64_t v7 = a3 ? (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String") : "<nil>";
    id v15 = [(VCSession *)self remoteParticipants]
        ? [(NSString *)[(NSArray *)[(VCSession *)self remoteParticipants] description] UTF8String]: "<nil>";
    asprintf(&__str, "Stop called. error=%s, remoteParticipants=%s", v7, v15);
    if (!__str) {
      goto LABEL_33;
    }
    id v36 = a3;
    __lasts = 0;
    __int16 v16 = strtok_r(__str, "\n", &__lasts);
    uint64_t v17 = (os_log_t *)MEMORY[0x1E4F47A50];
    do
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
        int v19 = *v17;
        if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v42 = v18;
          __int16 v43 = 2080;
          uint64_t v44 = "-[VCSession dispatchedStopWithError:didRemoteCancel:]";
          __int16 v45 = 1024;
          int v46 = 3618;
          __int16 v47 = 2080;
          __int16 v48 = "";
          __int16 v49 = 2080;
          __int16 v50 = (VCSession *)v16;
          _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d %s %s", buf, 0x30u);
        }
      }
      __int16 v16 = strtok_r(0, "\n", &__lasts);
    }
    while (v16);
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint8_t v6 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      uint8_t v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_33;
    }
    __str = 0;
    uint64_t v8 = (const char *)[(__CFString *)v6 UTF8String];
    uint64_t v9 = a3 ? (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String") : "<nil>";
    uint32_t v10 = [(VCSession *)self remoteParticipants]
        ? [(NSString *)[(NSArray *)[(VCSession *)self remoteParticipants] description] UTF8String]: "<nil>";
    asprintf(&__str, "%s(%p) Stop called. error=%s, remoteParticipants=%s", v8, self, v9, v10);
    if (!__str) {
      goto LABEL_33;
    }
    id v36 = a3;
    __lasts = 0;
    uint64_t v11 = strtok_r(__str, "\n", &__lasts);
    long long v12 = (os_log_t *)MEMORY[0x1E4F47A50];
    do
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        uint64_t v14 = *v12;
        if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v42 = v13;
          __int16 v43 = 2080;
          uint64_t v44 = "-[VCSession dispatchedStopWithError:didRemoteCancel:]";
          __int16 v45 = 1024;
          int v46 = 3618;
          __int16 v47 = 2080;
          __int16 v48 = "";
          __int16 v49 = 2080;
          __int16 v50 = (VCSession *)v11;
          _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d %s %s", buf, 0x30u);
        }
      }
      uint64_t v11 = strtok_r(0, "\n", &__lasts);
    }
    while (v11);
  }
  free(__str);
  a3 = v36;
LABEL_33:
  switch(self->_state)
  {
    case 0u:
    case 2u:
    case 4u:
      if (self->_oneToOneModeEnabled) {
        return;
      }
      if ((VCSession *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          uint64_t v24 = VRTraceErrorLogLevelToCSTR();
          __int16 v25 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            stopError = self->_stopError;
            *(_DWORD *)buf = 136315906;
            uint64_t v42 = v24;
            __int16 v43 = 2080;
            uint64_t v44 = "-[VCSession dispatchedStopWithError:didRemoteCancel:]";
            __int16 v45 = 1024;
            int v46 = 3626;
            __int16 v47 = 2048;
            __int16 v48 = (const char *)stopError;
            __int16 v27 = "VCSession [%s] %s:%d Session already stopped. stopError=%p";
            int v28 = v25;
            uint32_t v29 = 38;
LABEL_58:
            _os_log_impl(&dword_1E1EA4000, v28, OS_LOG_TYPE_DEFAULT, v27, buf, v29);
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          int v20 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
        }
        else {
          int v20 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          uint64_t v31 = VRTraceErrorLogLevelToCSTR();
          id v32 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            __int16 v33 = self->_stopError;
            *(_DWORD *)buf = 136316418;
            uint64_t v42 = v31;
            __int16 v43 = 2080;
            uint64_t v44 = "-[VCSession dispatchedStopWithError:didRemoteCancel:]";
            __int16 v45 = 1024;
            int v46 = 3626;
            __int16 v47 = 2112;
            __int16 v48 = (const char *)v20;
            __int16 v49 = 2048;
            __int16 v50 = self;
            __int16 v51 = 2048;
            __int16 v52 = v33;
            __int16 v27 = "VCSession [%s] %s:%d %@(%p) Session already stopped. stopError=%p";
            int v28 = v32;
            uint32_t v29 = 58;
            goto LABEL_58;
          }
        }
      }
      id v34 = self->_stopError;
      if (!v34) {
        id v34 = +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", 7, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession.m", 3627), 0);
      }
      notificationQueue = self->_notificationQueue;
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      void v38[2] = __53__VCSession_dispatchedStopWithError_didRemoteCancel___block_invoke;
      v38[3] = &unk_1E6DB3E40;
      v38[4] = self;
      v38[5] = v34;
      dispatch_async(notificationQueue, v38);
      return;
    case 1u:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v21 = VRTraceErrorLogLevelToCSTR();
        uint64_t v22 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v42 = v21;
          __int16 v43 = 2080;
          uint64_t v44 = "-[VCSession dispatchedStopWithError:didRemoteCancel:]";
          __int16 v45 = 1024;
          int v46 = 3633;
          _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Session stop when start in progress, transitioning to stopping", buf, 0x1Cu);
        }
      }
      if (self->_oneToOneModeEnabled) {
        id v23 = 0;
      }
      else {
        id v23 = +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", 5, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession.m", 3636), 0);
      }
      id v30 = self->_notificationQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __53__VCSession_dispatchedStopWithError_didRemoteCancel___block_invoke_552;
      block[3] = &unk_1E6DB3E40;
      block[4] = self;
      void block[5] = v23;
      dispatch_async(v30, block);
      goto LABEL_49;
    default:
      self->_stopError = (NSError *)a3;
LABEL_49:
      if (self->_oneToOneModeEnabled) {
        [(VCSession *)self reportingSessionStopEventWithError:self->_stopError];
      }
      if (self->_nwActivityActiveSession)
      {
        nw_activity_complete_with_reason();
        nw_release(self->_nwActivityActiveSession);
        self->_nwActivityActiveSession = 0;
      }
      [(VCSession *)self setState:4];
      [(VCObject *)self startTimeoutTimer];
      [(VCSession *)self tearDown];
      [(VCSession *)self stopMediaQueueOneToOne];
      [(VCSession *)self unregisterReportingTask];
      return;
  }
}

uint64_t __53__VCSession_dispatchedStopWithError_didRemoteCancel___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v2 vcSession:v3 didStopWithError:v4];
}

uint64_t __53__VCSession_dispatchedStopWithError_didRemoteCancel___block_invoke_552(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v2 vcSession:v3 didStart:0 error:v4];
}

- (void)dispatchedTransportStop
{
  [(VCSession *)self stopSessionMessaging];
  transportSession = self->_transportSession;

  [(VCTransportSession *)transportSession stop];
}

- (void)tearDown
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      uint64_t v8 = "-[VCSession tearDown]";
      __int16 v9 = 1024;
      int v10 = 3676;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Tearing down session", (uint8_t *)&v5, 0x1Cu);
    }
  }
  reportingStopTimer();
  [(VCSession *)self stopAllParticipants];
  VCMediaQueue_Stop((uint64_t)self->_mediaQueue);
  [(VCSessionStatsController *)self->_sessionStatsController stopLocalSessionStatsUpdate];
  [(VCSecurityKeyManager *)self->_securityKeyManager stop];
  [(AVCRateController *)self->_uplinkRateController stop];
  [(AVCRateController *)self->_downlinkRateController stop];
  [(VCSession *)self stopRateControllerOneToOne];
}

- (void)dispatchedUpdateConfiguration:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      __int16 v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v41 = v6;
        __int16 v42 = 2080;
        __int16 v43 = "-[VCSession dispatchedUpdateConfiguration:]";
        __int16 v44 = 1024;
        int v45 = 3688;
        __int16 v46 = 2048;
        __int16 v47 = self;
        __int16 v48 = 2112;
        uint64_t v49 = (uint64_t)a3;
        uint64_t v8 = "VCSession [%s] %s:%d VCSession:[%p] configurationDict:[%@]";
        __int16 v9 = v7;
        uint32_t v10 = 48;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      int v5 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      int v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      long long v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316674;
        uint64_t v41 = v11;
        __int16 v42 = 2080;
        __int16 v43 = "-[VCSession dispatchedUpdateConfiguration:]";
        __int16 v44 = 1024;
        int v45 = 3688;
        __int16 v46 = 2112;
        __int16 v47 = (VCSession *)v5;
        __int16 v48 = 2048;
        uint64_t v49 = (uint64_t)self;
        __int16 v50 = 2048;
        __int16 v51 = self;
        __int16 v52 = 2112;
        id v53 = a3;
        uint64_t v8 = "VCSession [%s] %s:%d %@(%p) VCSession:[%p] configurationDict:[%@]";
        __int16 v9 = v12;
        uint32_t v10 = 68;
        goto LABEL_11;
      }
    }
  }
  int64_t v13 = [(VCSessionConfiguration *)self->_configuration sessionMode];
  BOOL v14 = [(VCSessionConfiguration *)self->_configuration isOneToOneModeEnabled];
  BOOL v15 = [(VCSessionConfiguration *)self->_configuration isRemoteScreenControlEnabled];
  if (![(VCSessionConfiguration *)self->_configuration updateWithClientDictionary:a3])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSession dispatchedUpdateConfiguration:]();
      }
    }
    goto LABEL_42;
  }
  if (v13 != [(VCSessionConfiguration *)self->_configuration sessionMode])
  {
    uint64_t v16 = +[VCSession deviceRoleForSessionMode:[(VCSessionConfiguration *)self->_configuration sessionMode]];
    if ([(VCSessionParticipant *)self->_localParticipant updateConfigurationWithDeviceRole:v16])
    {
      id v32 = a3;
      [(VCSession *)self setupSpatialAudio];
      BOOL v31 = v14;
      BOOL v17 = [(VCSessionConfiguration *)self->_configuration sessionMode] != 1
         && +[VCHardwareSettings isSpatialAudioSupported];
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      uint64_t v18 = (void *)[(NSMutableDictionary *)self->_remoteParticipantsMapByUUID allValues];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v35 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v37;
        while (2)
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v37 != v21) {
              objc_enumerationMutation(v18);
            }
            id v23 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            if (([v23 updateConfigurationWithDeviceRole:v16] & 1) == 0)
            {
              a3 = v32;
              BOOL v14 = v31;
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                uint64_t v28 = VRTraceErrorLogLevelToCSTR();
                uint32_t v29 = *MEMORY[0x1E4F47A50];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
                {
                  uint64_t v30 = [v23 uuid];
                  *(_DWORD *)buf = 136316162;
                  uint64_t v41 = v28;
                  __int16 v42 = 2080;
                  __int16 v43 = "-[VCSession dispatchedUpdateConfiguration:]";
                  __int16 v44 = 1024;
                  int v45 = 3709;
                  __int16 v46 = 2048;
                  __int16 v47 = self;
                  __int16 v48 = 2112;
                  uint64_t v49 = v30;
                  _os_log_error_impl(&dword_1E1EA4000, v29, OS_LOG_TYPE_ERROR, "VCSession [%s] %s:%d VCSession:[%p] Failed to update the remote participant:[%@] configuration", buf, 0x30u);
                }
              }
              goto LABEL_42;
            }
            if (v17) {
              objc_msgSend(v23, "updatePositionalInfo:shouldReapply:", objc_msgSend((id)objc_msgSend(v23, "positionalInfo"), "serialize"), 1);
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v36 objects:v35 count:16];
          if (v20) {
            continue;
          }
          break;
        }
      }
      if (v17) {
        [(VCSession *)self applySpatialMetadata];
      }
      a3 = v32;
      BOOL v14 = v31;
      if (v15 != [(VCSessionConfiguration *)self->_configuration isRemoteScreenControlEnabled])[(VCSession *)self setRemoteScreenControlEnabled:[(VCSessionConfiguration *)self->_configuration isRemoteScreenControlEnabled]]; {
      goto LABEL_32;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSession dispatchedUpdateConfiguration:]();
      }
    }
LABEL_42:
    id v24 = +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", 11, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession.m", 3731), 0);
    int v25 = 0;
    goto LABEL_35;
  }
LABEL_32:
  if (v14 != [(VCSessionConfiguration *)self->_configuration isOneToOneModeEnabled]) {
    [(VCSession *)self setOneToOneModeEnabled:[(VCSessionConfiguration *)self->_configuration isOneToOneModeEnabled] configurationDict:a3];
  }
  id v24 = 0;
  int v25 = 1;
LABEL_35:
  BOOL v26 = [(VCSessionConfiguration *)self->_configuration isOneToOneModeEnabled];
  if (!v25 || ((v14 ^ v26) & 1) == 0)
  {
    notificationQueue = self->_notificationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__VCSession_dispatchedUpdateConfiguration___block_invoke;
    block[3] = &unk_1E6DB5238;
    block[4] = self;
    void block[5] = a3;
    char v34 = v25;
    void block[6] = v24;
    dispatch_async(notificationQueue, block);
  }
}

uint64_t __43__VCSession_dispatchedUpdateConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 48);

  return [v2 vcSession:v3 updateConfiguration:v4 didSucceed:v5 error:v6];
}

- (void)stopAllParticipants
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(VCSession *)self cleanupOneToOneDelegates];
  [(NSMutableSet *)self->_stoppingParticipants addObjectsFromArray:[(VCSession *)self remoteParticipants]];
  [(NSMutableSet *)self->_stoppingParticipants addObjectsFromArray:self->_startingParticipants];
  [(NSMutableSet *)self->_stoppingParticipants addObjectsFromArray:self->_initializingParticipants];
  [(NSMutableSet *)self->_stoppingParticipants addObject:self->_localParticipant];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  stoppingParticipants = self->_stoppingParticipants;
  uint64_t v4 = [(NSMutableSet *)stoppingParticipants countByEnumeratingWithState:&v9 objects:v8 count:16];
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
          objc_enumerationMutation(stoppingParticipants);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) stop];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableSet *)stoppingParticipants countByEnumeratingWithState:&v9 objects:v8 count:16];
    }
    while (v5);
  }
}

- (void)dispatchedParticipant:(id)a3 didStart:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      long long v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316674;
        uint64_t v46 = v10;
        __int16 v47 = 2080;
        __int16 v48 = "-[VCSession dispatchedParticipant:didStart:error:]";
        __int16 v49 = 1024;
        int v50 = 3756;
        __int16 v51 = 1024;
        *(_DWORD *)__int16 v52 = v6;
        *(_WORD *)&v52[4] = 2112;
        *(void *)&v52[6] = a5;
        *(_WORD *)&v52[14] = 2112;
        *(void *)&v52[16] = [a3 uuid];
        __int16 v53 = 2112;
        id v54 = [(VCSession *)self participantsToString];
        long long v12 = "VCSession [%s] %s:%d Participant didStart:%d error:[%@] participantID[%@] %@";
        uint64_t v13 = v11;
        uint32_t v14 = 64;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      long long v9 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      long long v9 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      uint64_t v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136317186;
        uint64_t v46 = v15;
        __int16 v47 = 2080;
        __int16 v48 = "-[VCSession dispatchedParticipant:didStart:error:]";
        __int16 v49 = 1024;
        int v50 = 3756;
        __int16 v51 = 2112;
        *(void *)__int16 v52 = v9;
        *(_WORD *)&v52[8] = 2048;
        *(void *)&v52[10] = self;
        *(_WORD *)&v52[18] = 1024;
        *(_DWORD *)&v52[20] = v6;
        __int16 v53 = 2112;
        id v54 = a5;
        __int16 v55 = 2112;
        uint64_t v56 = [a3 uuid];
        __int16 v57 = 2112;
        id v58 = [(VCSession *)self participantsToString];
        long long v12 = "VCSession [%s] %s:%d %@(%p) Participant didStart:%d error:[%@] participantID[%@] %@";
        uint64_t v13 = v16;
        uint32_t v14 = 84;
        goto LABEL_11;
      }
    }
  }
  [(NSMutableArray *)self->_startingParticipants removeObject:a3];
  if (!v6 && self->_state == 1)
  {
    [(VCSession *)self setState:2];
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSession dispatchedParticipant:didStart:error:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        BOOL v17 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
      }
      else {
        BOOL v17 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
        uint64_t v19 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v46 = v18;
          __int16 v47 = 2080;
          __int16 v48 = "-[VCSession dispatchedParticipant:didStart:error:]";
          __int16 v49 = 1024;
          int v50 = 3762;
          __int16 v51 = 2112;
          *(void *)__int16 v52 = v17;
          *(_WORD *)&v52[8] = 2048;
          *(void *)&v52[10] = self;
          _os_log_error_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_ERROR, "VCSession [%s] %s:%d %@(%p) Session failed to start.", buf, 0x30u);
        }
      }
    }
  }
  BOOL v20 = v6;
  if (![(NSMutableArray *)self->_startingParticipants count])
  {
    unsigned int state = self->_state;
    if (state != 4 && state != 2)
    {
      BOOL v20 = v6;
      if (state == 1)
      {
        [(VCSession *)self setState:3];
        MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCSession-didStart");
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v25 = VRTraceErrorLogLevelToCSTR();
          BOOL v26 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            uint64_t v46 = v25;
            __int16 v47 = 2080;
            __int16 v48 = "-[VCSession dispatchedParticipant:didStart:error:]";
            __int16 v49 = 1024;
            int v50 = 3768;
            __int16 v51 = 2048;
            *(void *)__int16 v52 = self;
            _os_log_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d @:@ VCSession-didStart (%p)", buf, 0x26u);
          }
        }
        [a3 logAllStreamTokens];
        [(VCSession *)self broadcastInitialMediaState];
        notificationQueue = self->_notificationQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __50__VCSession_dispatchedParticipant_didStart_error___block_invoke;
        block[3] = &unk_1E6DB3DC8;
        block[4] = self;
        dispatch_async(notificationQueue, block);
        BOOL v20 = v6;
      }
      goto LABEL_25;
    }
    [(VCSession *)self tearDown];
    [(VCSession *)self stopMediaQueueOneToOne];
    [(VCSession *)self dispatchedTransportStop];
    [(VCSession *)self unregisterReportingTask];
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      {
LABEL_61:
        BOOL v20 = 0;
        goto LABEL_25;
      }
      uint64_t v29 = VRTraceErrorLogLevelToCSTR();
      uint64_t v30 = *MEMORY[0x1E4F47A50];
      BOOL v20 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
      unsigned int v31 = self->_state;
      uint64_t v32 = [a3 uuid];
      id v33 = [(VCSession *)self participantsToString];
      *(_DWORD *)buf = 136316418;
      uint64_t v46 = v29;
      __int16 v47 = 2080;
      __int16 v48 = "-[VCSession dispatchedParticipant:didStart:error:]";
      __int16 v49 = 1024;
      int v50 = 3782;
      __int16 v51 = 1024;
      *(_DWORD *)__int16 v52 = v31;
      *(_WORD *)&v52[4] = 2112;
      *(void *)&v52[6] = v32;
      *(_WORD *)&v52[14] = 2112;
      *(void *)&v52[16] = v33;
      char v34 = "VCSession [%s] %s:%d Resetting Participant shouldStart to false as session state=%d failed to move to start,"
            " participantID[%@] %@";
      uint64_t v35 = v30;
      uint32_t v36 = 54;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        id v24 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
      }
      else {
        id v24 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_61;
      }
      uint64_t v37 = VRTraceErrorLogLevelToCSTR();
      long long v38 = *MEMORY[0x1E4F47A50];
      BOOL v20 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
      unsigned int v39 = self->_state;
      uint64_t v40 = [a3 uuid];
      id v41 = [(VCSession *)self participantsToString];
      *(_DWORD *)buf = 136316930;
      uint64_t v46 = v37;
      __int16 v47 = 2080;
      __int16 v48 = "-[VCSession dispatchedParticipant:didStart:error:]";
      __int16 v49 = 1024;
      int v50 = 3782;
      __int16 v51 = 2112;
      *(void *)__int16 v52 = v24;
      *(_WORD *)&v52[8] = 2048;
      *(void *)&v52[10] = self;
      *(_WORD *)&v52[18] = 1024;
      *(_DWORD *)&v52[20] = v39;
      __int16 v53 = 2112;
      id v54 = (id)v40;
      __int16 v55 = 2112;
      uint64_t v56 = (uint64_t)v41;
      char v34 = "VCSession [%s] %s:%d %@(%p) Resetting Participant shouldStart to false as session state=%d failed to move to"
            " start, participantID[%@] %@";
      uint64_t v35 = v38;
      uint32_t v36 = 74;
    }
    _os_log_impl(&dword_1E1EA4000, v35, OS_LOG_TYPE_DEFAULT, v34, buf, v36);
    goto LABEL_61;
  }
LABEL_25:
  if ([(NSMutableArray *)self->_initializingParticipants containsObject:a3])
  {
    if (v6)
    {
      if ([(VCSession *)self registerRemoteParticipantToSession:a3])
      {
        char v21 = 1;
        goto LABEL_49;
      }
      a5 = +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", 17, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession.m", 3791), 0);
      LOBYTE(v20) = 0;
    }
    else
    {
      if (!-[NSMutableDictionary objectForKeyedSubscript:](self->_remoteParticipantsMapByUUID, "objectForKeyedSubscript:", [a3 uuid]))-[NSMutableDictionary setObject:forKeyedSubscript:](self->_remoteParticipantsMapByServerID, "setObject:forKeyedSubscript:", 0, objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a3, "idsParticipantID"))); {
      [(VCSession *)self removeDelegatesForRemoteParticipant:a3];
      }
    }
    char v21 = 0;
LABEL_49:
    uint64_t v28 = self->_notificationQueue;
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __50__VCSession_dispatchedParticipant_didStart_error___block_invoke_553;
    v42[3] = &unk_1E6DB5238;
    v42[4] = self;
    v42[5] = a3;
    char v43 = v21;
    v42[6] = a5;
    dispatch_async(v28, v42);
    [(NSMutableArray *)self->_initializingParticipants removeObject:a3];
    if (!v20) {
      return;
    }
    goto LABEL_50;
  }
  if (!v20) {
    return;
  }
LABEL_50:
  [(VCSession *)self setupOneToOneVideoReceiverDelegate];
  [(VCSession *)self setupOneToOneVideoStreamDelegate];
  if (self->_oneToOneModeEnabled) {
    [(VCSession *)self startOneToOne];
  }
}

uint64_t __50__VCSession_dispatchedParticipant_didStart_error___block_invoke(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSession:didStart:error:", *(void *)(a1 + 32), 1, 0);
  uint64_t result = [+[VCDefaults sharedInstance] forceMuteAtStart];
  if (result)
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 240);
    return [v3 setMuted:1];
  }
  return result;
}

uint64_t __50__VCSession_dispatchedParticipant_didStart_error___block_invoke_553(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) uuid];
  uint64_t v5 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 48);

  return [v2 vcSession:v3 addParticipantWithID:v4 didSucceed:v5 error:v6];
}

- (void)setupOneToOneVideoReceiverDelegate
{
  if (self->_oneToOneModeEnabled && [(VCSessionParticipant *)self->_localParticipant isVideoEnabled])
  {
    localParticipant = self->_localParticipant;
    if (localParticipant)
    {
      [(VCSessionParticipantLocal *)localParticipant oneToOneSettings];
      localParticipant = (VCSessionParticipantLocal *)v6;
    }
    else
    {
      long long v6 = 0u;
      long long v7 = 0u;
      long long v5 = 0u;
    }
    uint64_t v4 = objc_msgSend((id)objc_msgSend((id)-[VCSessionParticipantLocal objectForKeyedSubscript:](localParticipant, "objectForKeyedSubscript:", &unk_1F3DC49C8, v5, v6, v7), "stream"), "getVideoReceiverFeedbackDelegate");
    if (v4) {
      objc_msgSend(-[NSArray firstObject](-[VCSession remoteParticipants](self, "remoteParticipants"), "firstObject"), "setVideoReceiverFeedbackDelegate:", v4);
    }
  }
}

- (void)setupOneToOneVideoStreamDelegate
{
  v2[1] = *MEMORY[0x1E4F143B8];
  if (self->_oneToOneModeEnabled)
  {
    v2[0] = VCSession_RemoteScreenAttributesDidChange;
    [(VCSessionParticipantRemote *)[(VCSession *)self oneToOneRemoteParticipant] setVideoStreamDelegate:self delegateFunctions:v2];
  }
}

void __VCSession_RemoteScreenAttributesDidChange_block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 136315906;
      uint64_t v6 = v2;
      __int16 v7 = 2080;
      uint64_t v8 = "VCSession_RemoteScreenAttributesDidChange_block_invoke";
      __int16 v9 = 1024;
      int v10 = 3849;
      __int16 v11 = 2112;
      uint64_t v12 = v4;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d remoteScreenAttributes=%@", (uint8_t *)&v5, 0x26u);
    }
  }
  VCMediaRecorder_UpdateTargetScreenAttributes(*(void *)(*(void *)(a1 + 40) + 824), *(void *)(a1 + 32));
}

- (void)processDidStop
{
  void v9[5] = *MEMORY[0x1E4F143B8];
  unsigned int state = self->_state;
  if (state == 2)
  {
    id v6 = +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", 8, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession.m", 3865), 0);
    notificationQueue = self->_notificationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __27__VCSession_processDidStop__block_invoke_2;
    block[3] = &unk_1E6DB3E40;
    block[4] = self;
    void block[5] = v6;
    int v5 = block;
    uint64_t v4 = notificationQueue;
    goto LABEL_5;
  }
  if (state == 4)
  {
    uint64_t v4 = self->_notificationQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __27__VCSession_processDidStop__block_invoke;
    v9[3] = &unk_1E6DB3DC8;
    v9[4] = self;
    int v5 = v9;
LABEL_5:
    dispatch_async(v4, v5);
  }
  [(VCNetworkFeedbackController *)self->_feedbackController stop];
  [(VCSession *)self setState:0];
  [(VCSession *)self dispatchedTransportStop];
  [(VCSession *)self stopTimeoutTimer];
}

void __27__VCSession_processDidStop__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 624) = 0;
}

uint64_t __27__VCSession_processDidStop__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v2 vcSession:v3 didStart:0 error:v4];
}

- (void)dispatchedParticipant:(id)a3 didStopWithError:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_12;
    }
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    __int16 v9 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    int v17 = 136316418;
    uint64_t v18 = v8;
    __int16 v19 = 2080;
    BOOL v20 = "-[VCSession dispatchedParticipant:didStopWithError:]";
    __int16 v21 = 1024;
    int v22 = 3877;
    __int16 v23 = 2112;
    id v24 = a4;
    __int16 v25 = 2112;
    BOOL v26 = (VCSession *)[a3 uuid];
    __int16 v27 = 2112;
    id v28 = [(VCSession *)self participantsToString];
    int v10 = "VCSession [%s] %s:%d Participant didStopWithError:[%@] participantID[%@] %@";
    __int16 v11 = v9;
    uint32_t v12 = 58;
    goto LABEL_11;
  }
  if (objc_opt_respondsToSelector()) {
    __int16 v7 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
  }
  else {
    __int16 v7 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    uint32_t v14 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136316930;
      uint64_t v18 = v13;
      __int16 v19 = 2080;
      BOOL v20 = "-[VCSession dispatchedParticipant:didStopWithError:]";
      __int16 v21 = 1024;
      int v22 = 3877;
      __int16 v23 = 2112;
      id v24 = v7;
      __int16 v25 = 2048;
      BOOL v26 = self;
      __int16 v27 = 2112;
      id v28 = a4;
      __int16 v29 = 2112;
      uint64_t v30 = [a3 uuid];
      __int16 v31 = 2112;
      id v32 = [(VCSession *)self participantsToString];
      int v10 = "VCSession [%s] %s:%d %@(%p) Participant didStopWithError:[%@] participantID[%@] %@";
      __int16 v11 = v14;
      uint32_t v12 = 78;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v17, v12);
    }
  }
LABEL_12:
  unsigned int state = self->_state;
  if (state == 4 || state == 2)
  {
    [(NSMutableSet *)self->_stoppingParticipants removeObject:a3];
    if (![(NSMutableSet *)self->_stoppingParticipants count]) {
      [(VCSession *)self processDidStop];
    }
  }
}

- (id)newNetworkBitrateString:(id *)a3
{
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:5];
  for (uint64_t i = 0; i != 4; ++i)
    objc_msgSend(v4, "appendFormat:", @"%d ", a3->var1[i]);
  objc_msgSend(v4, "appendFormat:", @"%d", a3->var1[4]);
  return v4;
}

- (void)generateReportDictionary:(__CFDictionary *)a3
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v36 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v92 = 0;
  memset(v91, 0, sizeof(v91));
  uint64_t v90 = 0;
  memset(v89, 0, sizeof(v89));
  uint64_t v88 = 0;
  long long v87 = 0u;
  long long v86 = 0u;
  long long v85 = 0u;
  memset(v84, 0, sizeof(v84));
  uint64_t v83 = 0;
  long long v82 = 0u;
  long long aSize = 0u;
  NSSize v80 = (NSSize)0;
  memset(v79, 0, sizeof(v79));
  uint64_t v78 = 0;
  memset(v77, 0, sizeof(v77));
  uint64_t v76 = 0;
  memset(v75, 0, sizeof(v75));
  uint64_t v74 = 0;
  memset(v73, 0, sizeof(v73));
  uint64_t v72 = 0;
  memset(v71, 0, sizeof(v71));
  uint64_t v70 = 0;
  memset(v69, 0, sizeof(v69));
  uint64_t v68 = 0;
  memset(v67, 0, sizeof(v67));
  uint64_t v66 = 0;
  memset(v65, 0, sizeof(v65));
  localParticipant = self->_localParticipant;
  if (localParticipant)
  {
    [(VCSessionParticipantLocal *)localParticipant collectVideoChannelMetrics:v84];
    [(VCSessionParticipantLocal *)self->_localParticipant collectAudioChannelMetrics:v77];
    [(VCSessionParticipant *)self->_localParticipant collectCaptionsChannelMetrics:v73];
    CFDictionaryAddValue(a3, @"VCSActiveStreamsList", [(VCSessionParticipantLocal *)self->_localParticipant activeStreamKeys]);
  }
  uint64_t v37 = v5;
  VCMediaChannelMetrics_Sum((uint64_t)v91, (uint64_t)v84);
  VCMediaChannelMetrics_Sum((uint64_t)v91, (uint64_t)v77);
  VCMediaChannelMetrics_Sum((uint64_t)v91, (uint64_t)v73);
  id v7 = [(VCSession *)self newNetworkBitrateString:v77];
  if (self->_oneToOneModeEnabled) {
    uint64_t v8 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @" videoTxFrameRate=%3.1f,", (void)v85);
  }
  else {
    uint64_t v8 = &stru_1F3D3E450;
  }
  id v9 = [NSString alloc];
  int v10 = objc_msgSend(v9, "initWithFormat:", @"[hostTime:%f/%f sampleTime:%u/%u (Audio/Video)]", *((void *)&v86 + 1), *((void *)&v87 + 1), v87, v88);
  CFDictionaryAddValue(a3, @"VCSECNEnabled", (const void *)[NSNumber numberWithBool:self->_isECNEnabled]);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    uint32_t v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [(VCSessionParticipant *)self->_localParticipant uuid];
      *(_DWORD *)buf = 136317442;
      uint64_t v47 = v11;
      __int16 v48 = 2080;
      __int16 v49 = "-[VCSession generateReportDictionary:]";
      __int16 v50 = 1024;
      int v51 = 3936;
      __int16 v52 = 2112;
      uint64_t v53 = (uint64_t)v13;
      __int16 v54 = 1024;
      *(_DWORD *)__int16 v55 = v84[0];
      *(_WORD *)&v55[4] = 2112;
      *(void *)&v55[6] = v8;
      *(_WORD *)&v55[14] = 1024;
      *(_DWORD *)&v55[16] = v77[0];
      LOWORD(v56) = 2112;
      *(void *)((char *)&v56 + 2) = v7;
      WORD5(v56) = 1024;
      HIDWORD(v56) = v73[0];
      *(_WORD *)__int16 v57 = 2112;
      *(void *)&v57[2] = v10;
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d @=@ Health: VCSession-local localParticipant=%@, videoTxBitrate=%u kbps,%@ audioTxBitrate=%u kbps [%@], captionsTxBitrate=%u kbps avTxTimestamps=%@", buf, 0x56u);
    }
  }

  CFDictionaryAddValue(a3, @"VCSVTxBR", (const void *)[NSNumber numberWithUnsignedInt:LODWORD(v84[0])]);
  CFDictionaryAddValue(a3, @"VCSATxBR", (const void *)[NSNumber numberWithUnsignedInt:LODWORD(v77[0])]);
  CFDictionaryAddValue(a3, @"VCSCTxBR", (const void *)[NSNumber numberWithUnsignedInt:LODWORD(v73[0])]);
  CFMutableDictionaryRef theDict = a3;
  CFDictionaryAddValue(a3, @"VCSTxBR", (const void *)[NSNumber numberWithUnsignedInt:LODWORD(v91[0])]);
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  char v34 = self;
  obuint64_t j = [(VCSession *)self remoteParticipants];
  uint64_t v42 = [(NSArray *)obj countByEnumeratingWithState:&v61 objects:v60 count:16];
  uint64_t v14 = 0;
  if (v42)
  {
    uint64_t v41 = *(void *)v62;
    unint64_t v15 = 0x1E4F28000uLL;
    uint64_t v16 = v36;
    int v17 = v37;
    uint64_t v18 = v38;
    do
    {
      for (uint64_t i = 0; i != v42; ++i)
      {
        if (*(void *)v62 != v41) {
          objc_enumerationMutation(obj);
        }
        BOOL v20 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        int v21 = [v20 isInCanvas];
        [v20 collectVideoChannelMetrics:v79];
        [v20 collectAudioChannelMetrics:v75];
        [v20 collectCaptionsChannelMetrics:v71];
        objc_msgSend(v16, "addObject:", objc_msgSend(v20, "uuid"));
        objc_msgSend(v17, "addObject:", objc_msgSend((id)objc_msgSend(*(id *)(v15 + 3792), "numberWithUnsignedInt:", LODWORD(v79[0].width)), "stringValue"));
        objc_msgSend(v18, "addObject:", objc_msgSend((id)objc_msgSend(*(id *)(v15 + 3792), "numberWithUnsignedInt:", LODWORD(v75[0])), "stringValue"));
        VCMediaChannelMetrics_Sum((uint64_t)v69, (uint64_t)v79);
        VCMediaChannelMetrics_Sum((uint64_t)v67, (uint64_t)v75);
        VCMediaChannelMetrics_Sum((uint64_t)v65, (uint64_t)v71);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v22 = VRTraceErrorLogLevelToCSTR();
          __int16 v23 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v39 = [v20 uuid];
            uint64_t v24 = [v20 activeDownlinkStreamIDForStreamGroupID:1667329381];
            uint64_t v25 = [v20 activeDownlinkStreamIDForStreamGroupID:1835623282];
            int width_low = LODWORD(v79[0].width);
            CGFloat width = v80.width;
            int v28 = v75[0];
            v94.CGFloat width = v80.height;
            *(void *)&v94.height = aSize;
            __int16 v29 = NSStringFromSize(v94);
            *(_DWORD *)buf = 136317698;
            uint64_t v47 = v22;
            __int16 v48 = 2080;
            __int16 v49 = "-[VCSession generateReportDictionary:]";
            __int16 v50 = 1024;
            int v51 = 3964;
            __int16 v52 = 2112;
            uint64_t v53 = v39;
            __int16 v54 = 2112;
            *(void *)__int16 v55 = v24;
            *(_WORD *)&v55[8] = 2112;
            *(void *)&v55[10] = v25;
            *(_WORD *)&v55[18] = 1024;
            LODWORD(v56) = width_low;
            int v17 = v37;
            uint64_t v18 = v38;
            WORD2(v56) = 2048;
            *(CGFloat *)((char *)&v56 + 6) = width;
            unint64_t v15 = 0x1E4F28000;
            HIWORD(v56) = 1024;
            *(_DWORD *)__int16 v57 = v28;
            uint64_t v16 = v36;
            *(_WORD *)&v57[4] = 2112;
            *(void *)&v57[6] = v29;
            __int16 v58 = 1024;
            int v59 = v71[0];
            _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d @=@ Health: VCSession-remote remoteParticipant=%@, videoStreamID=%@, audioStreamID=%@, videoRxBitrate=%u kbps, videoRxFrameRate=%3.1f, audioRxBitrate=%u kbps, videoRxResolution=%@, captionsRxBitrate=%u kbps", buf, 0x60u);
          }
        }
        uint64_t v14 = (v14 + v21);
      }
      uint64_t v42 = [(NSArray *)obj countByEnumeratingWithState:&v61 objects:v60 count:16];
    }
    while (v42);
  }
  else
  {
    unint64_t v15 = 0x1E4F28000uLL;
    uint64_t v16 = v36;
    int v17 = v37;
  }
  CFDictionaryAddValue(theDict, @"VCSInCanvasCounter", (const void *)[*(id *)(v15 + 3792) numberWithUnsignedInt:v14]);
  CFDictionaryAddValue(theDict, @"VCSVRxBR", (const void *)[*(id *)(v15 + 3792) numberWithUnsignedInt:LODWORD(v69[0])]);
  CFDictionaryAddValue(theDict, @"VCSARxBR", (const void *)[*(id *)(v15 + 3792) numberWithUnsignedInt:LODWORD(v67[0])]);
  CFDictionaryAddValue(theDict, @"VCSCRxBR", (const void *)[*(id *)(v15 + 3792) numberWithUnsignedInt:LODWORD(v65[0])]);
  VCMediaChannelMetrics_Sum((uint64_t)v89, (uint64_t)v69);
  VCMediaChannelMetrics_Sum((uint64_t)v89, (uint64_t)v67);
  VCMediaChannelMetrics_Sum((uint64_t)v89, (uint64_t)v65);
  CFDictionaryAddValue(theDict, @"VCSRxBR", (const void *)[*(id *)(v15 + 3792) numberWithUnsignedInt:LODWORD(v89[0])]);
  if ([v16 count])
  {
    CFDictionaryAddValue(theDict, @"VCSPUUIDList", (const void *)[v16 componentsJoinedByString:@","]);
    CFDictionaryAddValue(theDict, @"VCSVRxBRs", (const void *)[v17 componentsJoinedByString:@","]);
    CFDictionaryAddValue(theDict, @"VCSARxBRs", (const void *)[v38 componentsJoinedByString:@","]);
    CFDictionaryAddValue(theDict, @"VCSCRxBRs", (const void *)[v38 componentsJoinedByString:@","]);
  }
  CFDictionaryRef v30 = (const __CFDictionary *)objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "copyRealtimeStatsDictionary");
  VCUtil_AppendFromDictionary(theDict, v30);
  if (v30) {
    CFRelease(v30);
  }

  __int16 v31 = [(VCTransportSession *)v34->_transportSession connectionManager];
  if (v31)
  {
    id v32 = v31;
    -[__CFDictionary setObject:forKeyedSubscript:](theDict, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v15 + 3792), "numberWithUnsignedLongLong:", -[VCConnectionManager mediaCellularTxBytes](v31, "mediaCellularTxBytes")), @"CTxDb");
    -[__CFDictionary setObject:forKeyedSubscript:](theDict, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v15 + 3792), "numberWithUnsignedLongLong:", -[VCConnectionManager mediaCellularRxBytes](v32, "mediaCellularRxBytes")), @"CRxDb");
    -[__CFDictionary setObject:forKeyedSubscript:](theDict, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v15 + 3792), "numberWithUnsignedLongLong:", -[VCConnectionManager mediaExcessiveCellularTxBytes](v32, "mediaExcessiveCellularTxBytes")+ -[VCConnectionManager signalingExcessiveCellularTxBytes](v32, "signalingExcessiveCellularTxBytes")), @"CDupTxDb");
    -[__CFDictionary setObject:forKeyedSubscript:](theDict, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v15 + 3792), "numberWithUnsignedLongLong:", -[VCConnectionManager mediaExcessiveCellularRxBytes](v32, "mediaExcessiveCellularRxBytes")+ -[VCConnectionManager signalingExcessiveCellularRxBytes](v32, "signalingExcessiveCellularRxBytes")), @"CDupRxDb");
    -[__CFDictionary setObject:forKeyedSubscript:](theDict, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v15 + 3792), "numberWithUnsignedLongLong:", -[VCConnectionManager budgetConsumingCellularTxBytes](v32, "budgetConsumingCellularTxBytes")), @"CBudgTxDb");
    -[__CFDictionary setObject:forKeyedSubscript:](theDict, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v15 + 3792), "numberWithUnsignedLongLong:", -[VCConnectionManager budgetConsumingCellularRxBytes](v32, "budgetConsumingCellularRxBytes")), @"CBudgRxDb");
    -[__CFDictionary setObject:forKeyedSubscript:](theDict, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v15 + 3792), "numberWithUnsignedLongLong:", -[VCConnectionManager mediaWifiTxBytes](v32, "mediaWifiTxBytes")), @"WTxDb");
    -[__CFDictionary setObject:forKeyedSubscript:](theDict, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v15 + 3792), "numberWithUnsignedLongLong:", -[VCConnectionManager mediaWifiRxBytes](v32, "mediaWifiRxBytes")), @"WRxDb");
    -[__CFDictionary setObject:forKeyedSubscript:](theDict, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v15 + 3792), "numberWithUnsignedInt:", -[VCConnectionManager sendSuccessCountSinceLastCheck](v32, "sendSuccessCountSinceLastCheck")), @"PSSCTR");
    -[__CFDictionary setObject:forKeyedSubscript:](theDict, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v15 + 3792), "numberWithUnsignedInt:", -[VCConnectionManager sendFailureCountSinceLastCheck](v32, "sendFailureCountSinceLastCheck")), @"PSFCTR");
    -[__CFDictionary setObject:forKeyedSubscript:](theDict, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v15 + 3792), "numberWithUnsignedLongLong:", -[VCConnectionManager onTheWireTotalBytesReceivedSinceLastCheck](v32, "onTheWireTotalBytesReceivedSinceLastCheck")), @"WPRSZ");
    -[__CFDictionary setObject:forKeyedSubscript:](theDict, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v15 + 3792), "numberWithUnsignedLongLong:", -[VCConnectionManager onTheWireTotalBytesSentSinceLastCheck](v32, "onTheWireTotalBytesSentSinceLastCheck")), @"WPSSZ");
  }
  *(_DWORD *)buf = 0;
  unsigned __int8 v45 = 0;
  +[VCWiFiUtils getInfraChannelNumber:buf is5Ghz:&v45];
  unsigned int valuePtr = v45;
  CFNumberRef v33 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(theDict, @"iWiFi5GHz", v33);
  CFRelease(v33);
  unsigned int valuePtr = 0;
  uint64_t v43 = 0;
  [(VCTransportSession *)v34->_transportSession getSignalStrengthBars:&valuePtr displayBars:(char *)&v43 + 4 maxDisplayBars:&v43];
  CFDictionaryAddValue(theDict, @"SS", (const void *)[*(id *)(v15 + 3792) numberWithInt:valuePtr]);
}

- (void)registerReportingTask
{
}

void __34__VCSession_registerReportingTask__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4E56580]([*(id *)(a1 + 32) weak]);
    if (v3)
    {
      uint64_t v4 = v3;
      [v3 generateReportDictionary:a2];
      CFRelease(v4);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      id v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315650;
        uint64_t v8 = v5;
        __int16 v9 = 2080;
        int v10 = "-[VCSession registerReportingTask]_block_invoke";
        __int16 v11 = 1024;
        int v12 = 4033;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d [VCSession]: reporting periodic task: strongSelf == nil", (uint8_t *)&v7, 0x1Cu);
      }
    }
  }
}

- (void)unregisterReportingTask
{
  reportingUnregisterPeriodicTask();
  reportingUnregisterPeriodicTask();

  VCReporting_finalizeAggregation();
}

- (void)recommendedSettingsChanged:(id)a3
{
  uint64_t v4 = [a3 targetBitrateCap];
  uplinkRateController = self->_uplinkRateController;

  [(AVCRateController *)uplinkRateController setTargetBitrateCap:v4];
}

- (void)reportingIntervalChanged:(double)a3
{
}

- (void)preWarmStateChanged:(BOOL)a3
{
  if (self->_oneToOneModeEnabled)
  {
    BOOL v3 = a3;
    if ([(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] isPreWarmStateEnabled] != a3)
    {
      if ([(VCSession *)self oneToOneRemoteParticipant])
      {
        if (v3) {
          uint64_t v5 = @"VCWRMAlertStateEnabled";
        }
        else {
          uint64_t v5 = @"VCWRMAlertStateDisabled";
        }
        [(VCSessionMessaging *)self->_sessionMessaging sendMessage:v5 withTopic:@"VCWRMAlertStateUpdateMessageTopic" participantID:[(VCSessionParticipant *)[(VCSession *)self oneToOneRemoteParticipant] idsParticipantID]];
        id v6 = [(VCTransportSession *)self->_transportSession connectionManager];
        VCConnectionManager_SetPreWarmState((uint64_t)v6, v3);
      }
    }
  }
}

- (void)mediaQualityDegraded:(BOOL)a3
{
  if (self->_oneToOneModeEnabled)
  {
    BOOL v3 = a3;
    if ([(VCSession *)self oneToOneRemoteParticipant])
    {
      sessionMessaging = self->_sessionMessaging;
      if (v3) {
        id v6 = @"VCMediaQualityDegraded";
      }
      else {
        id v6 = @"VCMediaQualityRecovered";
      }
      unint64_t v7 = [(VCSessionParticipant *)[(VCSession *)self oneToOneRemoteParticipant] idsParticipantID];
      [(VCSessionMessaging *)sessionMessaging sendMessage:v6 withTopic:@"VCMediaQualityDegradedMessageTopic" participantID:v7];
    }
  }
}

- (void)setIsUplinkRetransmissionEnabled:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__VCSession_setIsUplinkRetransmissionEnabled___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  BOOL v5 = a3;
  block[4] = self;
  dispatch_async(sessionQueue, block);
}

uint64_t __46__VCSession_setIsUplinkRetransmissionEnabled___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t result = +[VCSession isUplinkRetransmissionEnabledForVideo];
  if (result)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v5 = *(unsigned __int8 *)(a1 + 40);
        int v7 = 136315906;
        uint64_t v8 = v3;
        __int16 v9 = 2080;
        int v10 = "-[VCSession setIsUplinkRetransmissionEnabled:]_block_invoke";
        __int16 v11 = 1024;
        int v12 = 4077;
        __int16 v13 = 1024;
        int v14 = v5;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d isUplinkRetransmissionEnabled=%d", (uint8_t *)&v7, 0x22u);
      }
    }
    unsigned __int8 v6 = *(unsigned char *)(a1 + 40);
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 240) setRetransmissionEnabled:v6];
    *(unsigned char *)(*(void *)(a1 + 32) + 810) = v6;
  }
  return result;
}

- (void)didLocalNetworkConditionChange:(BOOL)a3 isLocalNetworkQualityDegraded:(BOOL)a4 isRemoteNetworkQualityDegraded:(BOOL)a5
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __105__VCSession_didLocalNetworkConditionChange_isLocalNetworkQualityDegraded_isRemoteNetworkQualityDegraded___block_invoke;
  block[3] = &unk_1E6DB6E60;
  block[4] = self;
  BOOL v7 = a3;
  BOOL v8 = a4;
  BOOL v9 = a5;
  dispatch_async(sessionQueue, block);
}

unsigned char *__105__VCSession_didLocalNetworkConditionChange_isLocalNetworkQualityDegraded_isRemoteNetworkQualityDegraded___block_invoke(uint64_t a1)
{
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (result[409])
  {
    uint64_t result = (unsigned char *)[result oneToOneRemoteParticipant];
    if (result)
    {
      if (*(unsigned char *)(a1 + 40))
      {
        if (*(unsigned char *)(a1 + 41)) {
          uint64_t v3 = @"VCNetworkQualityDegraded";
        }
        else {
          uint64_t v3 = @"VCNetworkQualityRecovered";
        }
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 224), "sendMessage:withTopic:participantID:", v3, @"VCNetworkQualityDegradedMessageTopic", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "oneToOneRemoteParticipant"), "idsParticipantID"));
      }
      uint64_t v4 = (void *)[*(id *)(a1 + 32) oneToOneRemoteParticipant];
      int v5 = *(unsigned __int8 *)(a1 + 41);
      if (*(unsigned char *)(a1 + 41)) {
        BOOL v6 = 1;
      }
      else {
        BOOL v6 = *(unsigned char *)(a1 + 42) != 0;
      }
      return (unsigned char *)[v4 networkQualityDidDegrade:v6 isLocalNetworkQualityDegraded:v5 != 0];
    }
  }
  return result;
}

+ (BOOL)isServerPacketRetransmissionEnabledForVideo
{
  return +[GKSConnectivitySettings isFeatureEnabledForStorebagKey:@"vc-server-video-packet-retransmission-enabled" userDefaultKey:@"serverPacketRetransmissionEnabledForVideo" featureFlagDomain:"AVConference" featureFlagName:"EnableServerPacketRetransmissionForVideo"];
}

+ (BOOL)isEnhancedJBAdaptationsEnabled
{
  return +[GKSConnectivitySettings isFeatureEnabledForStorebagKey:@"vc-enhanced-jb-adaptations" userDefaultKey:@"enableEnhancedJBAdaptations" featureFlagDomain:"AVConference" featureFlagName:"EnableEnhancedJBAdaptations"];
}

+ (BOOL)isUplinkRetransmissionEnabledForVideo
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"uplinkRetransmissionEnabledForVideo", @"com.apple.VideoConference", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    int v3 = AppBooleanValue == 1;
  }
  else {
    int v3 = _os_feature_enabled_impl();
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    int v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316674;
      uint64_t v9 = v4;
      __int16 v10 = 2080;
      __int16 v11 = "+[VCSession isUplinkRetransmissionEnabledForVideo]";
      __int16 v12 = 1024;
      int v13 = 4114;
      __int16 v14 = 2080;
      uint64_t v15 = "AVConference";
      __int16 v16 = 2080;
      int v17 = "EnableUplinkRetransmissionForVideo";
      __int16 v18 = 1024;
      int v19 = keyExistsAndHasValidFormat;
      __int16 v20 = 1024;
      int v21 = v3;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Using feature flag domain=%s name=%s defaultExists=%d value=%d ", buf, 0x3Cu);
    }
  }
  return v3;
}

- (void)mediaRecorder:(id)a3 shouldProcessRequest:(id)a4 recipientID:(id)a5
{
  void block[8] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = objc_msgSend(a4, "mutableCopy", a3);
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__VCSession_mediaRecorder_shouldProcessRequest_recipientID___block_invoke;
  block[3] = &unk_1E6DB6740;
  block[4] = self;
  void block[5] = a5;
  void block[6] = a4;
  void block[7] = v8;
  dispatch_async(sessionQueue, block);
}

void __60__VCSession_mediaRecorder_shouldProcessRequest_recipientID___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 248) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", @"vcMomentsRequestState"), "intValue") == 1)
  {
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v2, "lastDisplayedFrameRTPTimestamp")), @"vcMomentsRequestTimestamp");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = [*(id *)(a1 + 56) objectForKeyedSubscript:@"vcMomentsRequesteeID"];
        uint64_t v6 = [*(id *)(a1 + 56) objectForKeyedSubscript:@"vcMomentsRequestTimestamp"];
        int v7 = 136316162;
        uint64_t v8 = v3;
        __int16 v9 = 2080;
        __int16 v10 = "-[VCSession mediaRecorder:shouldProcessRequest:recipientID:]_block_invoke";
        __int16 v11 = 1024;
        int v12 = 4127;
        __int16 v13 = 2112;
        uint64_t v14 = v5;
        __int16 v15 = 2112;
        uint64_t v16 = v6;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Media recording requestee=%@, RTP timestamp=%@", (uint8_t *)&v7, 0x30u);
      }
    }
  }
  [*(id *)(a1 + 32) reportingMomentsToGreenTeaWithRequest:*(void *)(a1 + 48)];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 224), "sendMessageDictionary:withTopic:participantID:", *(void *)(a1 + 56), @"VCSessionMomentsStateMessageTopic", objc_msgSend(v2, "idsParticipantID"));
}

- (void)didReceiveMomentsRequest:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__VCSession_didReceiveMomentsRequest___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a3;
  dispatch_async(sessionQueue, block);
}

uint64_t __38__VCSession_didReceiveMomentsRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 824) processRequest:*(void *)(a1 + 40)];
}

- (void)updateMediaRecorderCapabillities:(unsigned int)a3 imageType:(int)a4 videoCodec:(int)a5
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__VCSession_updateMediaRecorderCapabillities_imageType_videoCodec___block_invoke;
  void v6[3] = &unk_1E6DB3F58;
  v6[4] = self;
  unsigned int v7 = a3;
  int v8 = a4;
  int v9 = a5;
  dispatch_async(sessionQueue, v6);
}

void __67__VCSession_updateMediaRecorderCapabillities_imageType_videoCodec___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 824) setCapabilities:*(unsigned int *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 824) setImageType:*(unsigned int *)(a1 + 44)];
  [*(id *)(*(void *)(a1 + 32) + 824) setVideoCodec:*(unsigned int *)(a1 + 48)];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = *(_DWORD *)(a1 + 40);
      int v5 = *(_DWORD *)(a1 + 44);
      int v6 = *(_DWORD *)(a1 + 48);
      int v7 = 136316418;
      uint64_t v8 = v2;
      __int16 v9 = 2080;
      uint64_t v10 = "-[VCSession updateMediaRecorderCapabillities:imageType:videoCodec:]_block_invoke";
      __int16 v11 = 1024;
      int v12 = 4148;
      __int16 v13 = 1024;
      int v14 = v4;
      __int16 v15 = 1024;
      int v16 = v5;
      __int16 v17 = 1024;
      int v18 = v6;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d capabilities=0x%02x, imageType=%d, videoCodec=%d", (uint8_t *)&v7, 0x2Eu);
    }
  }
}

- (BOOL)actionWillBeginForContext:(const tagVCAsynchronousActionContext *)a3 withError:(id *)a4
{
  return 1;
}

- (BOOL)actionDidFinishForContext:(const tagVCAsynchronousActionContext *)a3 withError:(id *)a4
{
  return 1;
}

- (void)additionalFlushCountToOneToOneRateController:(unsigned int)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (self->_oneToOneModeEnabled)
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
    int v8 = 0;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v21 = 0;
    int v4 = [(AVCRateController *)self->_oneToOneSettings.rateController statisticsCollector];
    int v5 = 10;
    int v9 = 1;
    unsigned int v10 = a3;
    VCRateControlSetStatistics(v4, &v5);
  }
}

- (VCSessionParticipant)localParticipant
{
  return &self->_localParticipant->super;
}

- (NSString)idsDestination
{
  return self->_idsDestination;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (unsigned)transportSessionID
{
  return self->_transportSessionID;
}

- (VCConnectionProtocol)currentActiveConnection
{
  return self->_currentActiveConnection;
}

- (void)setCurrentActiveConnection:(id)a3
{
}

- (NSMutableDictionary)optInDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 464, 1);
}

- (void)setOptInDictionary:(id)a3
{
}

- (NSMutableDictionary)remoteParticipantsMapByServerID
{
  return self->_remoteParticipantsMapByServerID;
}

- (void)setRemoteParticipantsMapByServerID:(id)a3
{
}

- (tagVCMediaQueue)mediaQueue
{
  return self->_mediaQueue;
}

- (void)setMediaQueue:(tagVCMediaQueue *)a3
{
  self->_mediaQueue = a3;
}

- (VCTransportSession)transportSession
{
  return self->_transportSession;
}

- (AVCRateController)downlinkRateController
{
  return self->_downlinkRateController;
}

- (VCSessionMessaging)sessionMessaging
{
  return self->_sessionMessaging;
}

- (void)setSessionMessaging:(id)a3
{
}

- (VCSessionStatsController)sessionStatsController
{
  return self->_sessionStatsController;
}

- (OS_nw_activity)parentNWActivity
{
  return self->_parentNWActivity;
}

- (OS_nw_activity)nwActivity
{
  return self->_nwActivity;
}

- (void)setNwActivity:(id)a3
{
}

- (BOOL)oneToOneModeEnabled
{
  return self->_oneToOneModeEnabled;
}

- (BOOL)sharingEnabled
{
  return self->_sharingEnabled;
}

- (int)reportingClientType
{
  return self->_reportingClientType;
}

- (int)reportingModuleID
{
  return self->_reportingModuleID;
}

- (BOOL)screenAndCameraMixingEnabled
{
  return self->_screenAndCameraMixingEnabled;
}

- (BOOL)isOneToOneRemoteMediaStalling
{
  return self->_isOneToOneRemoteMediaStalling;
}

- (void)setIsOneToOneRemoteMediaStalling:(BOOL)a3
{
  self->_isOneToOneRemoteMediaStalling = a3;
}

- (int)setupOneToOne
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v3 = [(VCSession *)self setupOneToOneMediaQueue];
  if (v3 < 0)
  {
    int v4 = v3;
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSession(OneToOne) setupOneToOne]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v6 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        int v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v12 = 136316418;
          uint64_t v13 = v8;
          __int16 v14 = 2080;
          long long v15 = "-[VCSession(OneToOne) setupOneToOne]";
          __int16 v16 = 1024;
          int v17 = 56;
          __int16 v18 = 2112;
          long long v19 = v6;
          __int16 v20 = 2048;
          uint64_t v21 = self;
          __int16 v22 = 1024;
          int v23 = v4;
          unsigned int v10 = " [%s] %s:%d %@(%p) Failed to create the media queue. error=%x";
LABEL_25:
          _os_log_error_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v12, 0x36u);
        }
      }
    }
  }
  else
  {
    int v4 = [(VCSession *)self setupRateControllerOneToOne];
    if ((v4 & 0x80000000) == 0)
    {
      [(VCSession *)self initWithRelevantStorebagEntries];
      return v4;
    }
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSession(OneToOne) setupOneToOne]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v7 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        int v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v12 = 136316418;
          uint64_t v13 = v11;
          __int16 v14 = 2080;
          long long v15 = "-[VCSession(OneToOne) setupOneToOne]";
          __int16 v16 = 1024;
          int v17 = 59;
          __int16 v18 = 2112;
          long long v19 = v7;
          __int16 v20 = 2048;
          uint64_t v21 = self;
          __int16 v22 = 1024;
          int v23 = v4;
          unsigned int v10 = " [%s] %s:%d %@(%p) Failed to create rate controller. error=%x";
          goto LABEL_25;
        }
      }
    }
  }
  return v4;
}

- (int)setupOneToOneMediaQueue
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  p_oneToOneSettings = &self->_oneToOneSettings;
  self->_oneToOneSettings.mediaQueue = (tagHANDLE *)0xFFFFFFFFLL;
  p_mediaQueue = (uint64_t *)&self->_oneToOneSettings.mediaQueue;
  if (VCDefaults_GetBoolValueForKey(@"ForceVCMediaQueueForOneToOne", 1))
  {
    p_oneToOneSettings->uint64_t vcMediaQueue = self->_mediaQueue;
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        return 0;
      }
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      int Handle = 0;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 136315650;
        uint64_t v19 = v7;
        __int16 v20 = 2080;
        uint64_t v21 = "-[VCSession(OneToOne) setupOneToOneMediaQueue]";
        __int16 v22 = 1024;
        int v23 = 73;
        int v9 = " [%s] %s:%d Using VCMediaQueue2.0";
        unsigned int v10 = v8;
        uint32_t v11 = 28;
LABEL_17:
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v18, v11);
        return 0;
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v5 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
      }
      else {
        int v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        return 0;
      }
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      __int16 v14 = *MEMORY[0x1E4F47A50];
      int Handle = 0;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 136316162;
        uint64_t v19 = v13;
        __int16 v20 = 2080;
        uint64_t v21 = "-[VCSession(OneToOne) setupOneToOneMediaQueue]";
        __int16 v22 = 1024;
        int v23 = 73;
        __int16 v24 = 2112;
        uint64_t v25 = v5;
        __int16 v26 = 2048;
        __int16 v27 = self;
        int v9 = " [%s] %s:%d %@(%p) Using VCMediaQueue2.0";
        unsigned int v10 = v14;
        uint32_t v11 = 48;
        goto LABEL_17;
      }
    }
  }
  else
  {
    int Handle = MediaQueue_CreateHandle(p_mediaQueue, 0xFFFFFFFFLL);
    if (Handle < 0)
    {
      if ((VCSession *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSession(OneToOne) setupOneToOneMediaQueue]();
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          int v12 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
        }
        else {
          int v12 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v16 = VRTraceErrorLogLevelToCSTR();
          int v17 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            int v18 = 136316418;
            uint64_t v19 = v16;
            __int16 v20 = 2080;
            uint64_t v21 = "-[VCSession(OneToOne) setupOneToOneMediaQueue]";
            __int16 v22 = 1024;
            int v23 = 77;
            __int16 v24 = 2112;
            uint64_t v25 = v12;
            __int16 v26 = 2048;
            __int16 v27 = self;
            __int16 v28 = 1024;
            int v29 = Handle;
            _os_log_error_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to create the media queue. error=%x", (uint8_t *)&v18, 0x36u);
          }
        }
      }
    }
    else
    {
      MediaQueue_SetFECFeedbackVersion(*p_mediaQueue, 1);
    }
  }
  return Handle;
}

- (id)newNegotiatorForOneToOneWithRemoteParticipant:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  int v5 = (void *)[(VCMediaNegotiatorLocalConfiguration *)[(VCSessionMediaNegotiator *)[(VCSessionParticipant *)self->_localParticipant mediaNegotiator] localSettings] copy];
  uint64_t v6 = v5;
  if (!v5)
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSession(OneToOne) newNegotiatorForOneToOneWithRemoteParticipant:]();
        }
      }
      goto LABEL_38;
    }
    if (objc_opt_respondsToSelector()) {
      uint32_t v11 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      uint32_t v11 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_38;
    }
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    uint64_t v16 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_38;
    }
    int v26 = 136316162;
    uint64_t v27 = v15;
    __int16 v28 = 2080;
    int v29 = "-[VCSession(OneToOne) newNegotiatorForOneToOneWithRemoteParticipant:]";
    __int16 v30 = 1024;
    int v31 = 91;
    __int16 v32 = 2112;
    CFNumberRef v33 = v11;
    __int16 v34 = 2048;
    uint64_t v35 = self;
    int v17 = " [%s] %s:%d %@(%p) Failed to copy the local configuration";
    goto LABEL_60;
  }
  [v5 setIsCaller:0];
  uint64_t v7 = [[VCSessionMediaNegotiator alloc] initWithLocalConfiguration:v6];
  if (!v7)
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSession(OneToOne) newNegotiatorForOneToOneWithRemoteParticipant:]();
        }
      }
      goto LABEL_38;
    }
    if (objc_opt_respondsToSelector()) {
      int v12 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      int v12 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (uint64_t v18 = VRTraceErrorLogLevelToCSTR(),
          uint64_t v16 = *MEMORY[0x1E4F47A50],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
LABEL_38:
      uint64_t v8 = 0;
      goto LABEL_39;
    }
    int v26 = 136316162;
    uint64_t v27 = v18;
    __int16 v28 = 2080;
    int v29 = "-[VCSession(OneToOne) newNegotiatorForOneToOneWithRemoteParticipant:]";
    __int16 v30 = 1024;
    int v31 = 95;
    __int16 v32 = 2112;
    CFNumberRef v33 = v12;
    __int16 v34 = 2048;
    uint64_t v35 = self;
    int v17 = " [%s] %s:%d %@(%p) Failed to reinitialize the 1:1 media negotiator";
LABEL_60:
    _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v26, 0x30u);
    goto LABEL_38;
  }
  uint64_t v8 = v7;
  uint64_t v9 = objc_msgSend(+[VCSessionParticipant participantInfoWithParticipantData:](VCSessionParticipant, "participantInfoWithParticipantData:", objc_msgSend(a3, "opaqueData")), "objectForKeyedSubscript:", @"vcSessionParticipantKeyMediaNegotiationData");
  if (v9)
  {
    if ([(VCSessionMediaNegotiator *)v8 processRemoteNegotiationData:v9])
    {

      return v8;
    }
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSession(OneToOne) newNegotiatorForOneToOneWithRemoteParticipant:].cold.5();
        }
      }
      goto LABEL_39;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v14 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v14 = &stru_1F3D3E450;
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
        int v29 = "-[VCSession(OneToOne) newNegotiatorForOneToOneWithRemoteParticipant:]";
        __int16 v30 = 1024;
        int v31 = 103;
        __int16 v32 = 2112;
        CFNumberRef v33 = v14;
        __int16 v34 = 2048;
        uint64_t v35 = self;
        __int16 v24 = " [%s] %s:%d %@(%p) Failed to negotiate one to one settings with remote media blob";
        goto LABEL_58;
      }
    }
  }
  else
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSession(OneToOne) newNegotiatorForOneToOneWithRemoteParticipant:].cold.4();
        }
      }
      goto LABEL_39;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v13 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v13 = &stru_1F3D3E450;
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
        int v29 = "-[VCSession(OneToOne) newNegotiatorForOneToOneWithRemoteParticipant:]";
        __int16 v30 = 1024;
        int v31 = 100;
        __int16 v32 = 2112;
        CFNumberRef v33 = v13;
        __int16 v34 = 2048;
        uint64_t v35 = self;
        __int16 v24 = " [%s] %s:%d %@(%p) Failed to extract media blob from remote participant info";
LABEL_58:
        _os_log_error_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_ERROR, v24, (uint8_t *)&v26, 0x30u);
      }
    }
  }
LABEL_39:

  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSession(OneToOne) newNegotiatorForOneToOneWithRemoteParticipant:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v19 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v19 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      uint64_t v21 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v26 = 136316418;
        uint64_t v27 = v20;
        __int16 v28 = 2080;
        int v29 = "-[VCSession(OneToOne) newNegotiatorForOneToOneWithRemoteParticipant:]";
        __int16 v30 = 1024;
        int v31 = 109;
        __int16 v32 = 2112;
        CFNumberRef v33 = v19;
        __int16 v34 = 2048;
        uint64_t v35 = self;
        __int16 v36 = 2048;
        id v37 = a3;
        _os_log_error_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unable to negotiate oneToOne data with participant=%p", (uint8_t *)&v26, 0x3Au);
      }
    }
  }

  return 0;
}

- (BOOL)setOneToOneConfigOnRemoteParticipant:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = -[VCSession newNegotiatorForOneToOneWithRemoteParticipant:](self, "newNegotiatorForOneToOneWithRemoteParticipant:");
  id v6 = -[VCSession newParticipantOneToOneConfigWithIDSParticipantID:isLocal:mediaControlInfoVersion:videoEnabled:screenEnabled:remoteParticipant:](self, "newParticipantOneToOneConfigWithIDSParticipantID:isLocal:mediaControlInfoVersion:videoEnabled:screenEnabled:remoteParticipant:", -[VCSessionParticipant idsParticipantID](-[VCSession oneToOneRemoteParticipant](self, "oneToOneRemoteParticipant"), "idsParticipantID"), 0, objc_msgSend((id)objc_msgSend(v5, "negotiatedSettings"), "mediaControlInfoVersion"), objc_msgSend((id)objc_msgSend(v5, "negotiatedVideoSettings"), "isSupported"), objc_msgSend((id)objc_msgSend(v5, "negotiatedScreenSettings"), "isSupported"), a3);

  if (v6)
  {
    [a3 setOneToOneConfig:v6];
  }
  else if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSession(OneToOne) setOneToOneConfigOnRemoteParticipant:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v8 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v8 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      unsigned int v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v11 = 136316162;
        uint64_t v12 = v9;
        __int16 v13 = 2080;
        __int16 v14 = "-[VCSession(OneToOne) setOneToOneConfigOnRemoteParticipant:]";
        __int16 v15 = 1024;
        int v16 = 124;
        __int16 v17 = 2112;
        uint64_t v18 = v8;
        __int16 v19 = 2048;
        uint64_t v20 = self;
        _os_log_error_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) OneToOne config was nil", (uint8_t *)&v11, 0x30u);
      }
    }
  }
  return v6 != 0;
}

- (int)setupRateControllerOneToOne
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  p_oneToOneSettings = &self->_oneToOneSettings;
  if (self->_oneToOneSettings.rateController)
  {
    int v9 = -2143813628;
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSession(OneToOne) setupRateControllerOneToOne].cold.5();
        }
      }
      goto LABEL_60;
    }
    if (objc_opt_respondsToSelector()) {
      int v11 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      int v11 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_60;
    }
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    __int16 v17 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_60;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v29 = v16;
    __int16 v30 = 2080;
    int v31 = "-[VCSession(OneToOne) setupRateControllerOneToOne]";
    __int16 v32 = 1024;
    int v33 = 135;
    __int16 v34 = 2112;
    uint64_t v35 = v11;
    __int16 v36 = 2048;
    id v37 = self;
    uint64_t v18 = " [%s] %s:%d %@(%p) 1:1 rate controller already configured";
    goto LABEL_59;
  }
  if (self->_oneToOneSettings.mediaController)
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      int v9 = -2143813628;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSession(OneToOne) setupRateControllerOneToOne].cold.4();
        }
      }
      goto LABEL_60;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v12 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v12 = &stru_1F3D3E450;
    }
    int v9 = -2143813628;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_60;
    }
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    __int16 v17 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_60;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v29 = v19;
    __int16 v30 = 2080;
    int v31 = "-[VCSession(OneToOne) setupRateControllerOneToOne]";
    __int16 v32 = 1024;
    int v33 = 136;
    __int16 v34 = 2112;
    uint64_t v35 = v12;
    __int16 v36 = 2048;
    id v37 = self;
    uint64_t v18 = " [%s] %s:%d %@(%p) 1:1 media controller already configured";
    goto LABEL_59;
  }
  if (self->_oneToOneSettings.mediaQueue == (tagHANDLE *)0xFFFFFFFFLL && !self->_oneToOneSettings.vcMediaQueue)
  {
    int v9 = -2143813628;
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSession(OneToOne) setupRateControllerOneToOne]();
        }
      }
      goto LABEL_60;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v15 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v15 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      __int16 v17 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v29 = v22;
        __int16 v30 = 2080;
        int v31 = "-[VCSession(OneToOne) setupRateControllerOneToOne]";
        __int16 v32 = 1024;
        int v33 = 137;
        __int16 v34 = 2112;
        uint64_t v35 = v15;
        __int16 v36 = 2048;
        id v37 = self;
        uint64_t v18 = " [%s] %s:%d %@(%p) Media queue was not setup for 1:1";
        goto LABEL_59;
      }
    }
    goto LABEL_60;
  }
  uint64_t v4 = [NSString stringWithFormat:@"session_%@_1:1", self->_uuid];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v27 = 0;
  uint64_t v23 = v4;
  BYTE1(v24) = 1;
  id v5 = [(VCSession *)self vcrcServerBagWithOperatingMode:1];
  id reportingAgent = self->super._reportingAgent;
  *((void *)&v24 + 1) = v5;
  *(void *)&long long v25 = reportingAgent;
  BYTE8(v25) = 1;
  BYTE8(v26) = 1;
  uint64_t v7 = [[AVCRateController alloc] initWithDelegate:self params:&v23];
  p_oneToOneSettings->rateController = v7;
  if (!v7)
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      int v9 = -2143813630;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSession(OneToOne) setupRateControllerOneToOne]();
        }
      }
      goto LABEL_60;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v13 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v13 = &stru_1F3D3E450;
    }
    int v9 = -2143813630;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_60;
    }
    uint64_t v20 = VRTraceErrorLogLevelToCSTR();
    __int16 v17 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_60;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v29 = v20;
    __int16 v30 = 2080;
    int v31 = "-[VCSession(OneToOne) setupRateControllerOneToOne]";
    __int16 v32 = 1024;
    int v33 = 150;
    __int16 v34 = 2112;
    uint64_t v35 = v13;
    __int16 v36 = 2048;
    id v37 = self;
    uint64_t v18 = " [%s] %s:%d %@(%p) Failed to allocate 1:1 rate controller";
LABEL_59:
    _os_log_error_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_ERROR, v18, buf, 0x30u);
    goto LABEL_60;
  }
  [(AVCStatisticsCollector *)[(AVCRateController *)v7 statisticsCollector] setMediaControlInfoFECFeedbackVersion:1];
  uint64_t v8 = [[VCRateControlMediaController alloc] initWithMediaQueue:p_oneToOneSettings->mediaQueue delegate:self];
  p_oneToOneSettings->mediaController = v8;
  if (!v8)
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      int v9 = -2143813630;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSession(OneToOne) setupRateControllerOneToOne]();
        }
      }
      goto LABEL_60;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v14 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v14 = &stru_1F3D3E450;
    }
    int v9 = -2143813630;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      __int16 v17 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v29 = v21;
        __int16 v30 = 2080;
        int v31 = "-[VCSession(OneToOne) setupRateControllerOneToOne]";
        __int16 v32 = 1024;
        int v33 = 154;
        __int16 v34 = 2112;
        uint64_t v35 = v14;
        __int16 v36 = 2048;
        id v37 = self;
        uint64_t v18 = " [%s] %s:%d %@(%p) Failed to allocate 1:1 media controller";
        goto LABEL_59;
      }
    }
LABEL_60:
    [(VCSession *)self cleanupRateControllerOneToOne];
    return v9;
  }
  [(VCRateControlMediaController *)v8 setVcMediaQueue:p_oneToOneSettings->vcMediaQueue];
  [(VCRateControlMediaController *)p_oneToOneSettings->mediaController setIsRTPFlushBasebandFromVCRateControl:1];
  [(AVCRateController *)p_oneToOneSettings->rateController setMediaController:p_oneToOneSettings->mediaController];
  [(VCRateControlMediaController *)p_oneToOneSettings->mediaController setStatisticsCollector:[(AVCRateController *)p_oneToOneSettings->rateController statisticsCollector]];
  [(AVCRateControlFeedbackController *)[(AVCRateController *)p_oneToOneSettings->rateController feedbackController] setConnectionHealthMonitor:[(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] connectionHealthMonitor]];
  return 0;
}

- (void)updateOneToOneRateControllerForVideoEnabled:(BOOL)a3 screenEnabled:(BOOL)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__VCSession_OneToOne__updateOneToOneRateControllerForVideoEnabled_screenEnabled___block_invoke;
  block[3] = &unk_1E6DB4658;
  block[4] = self;
  BOOL v6 = a3;
  BOOL v7 = a4;
  dispatch_async(sessionQueue, block);
}

uint64_t __81__VCSession_OneToOne__updateOneToOneRateControllerForVideoEnabled_screenEnabled___block_invoke(uint64_t a1)
{
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "oneToOneRemoteParticipant"), "oneToOneConfig"), "negotiatedVideoEnabled"))BOOL v2 = *(unsigned char *)(a1 + 40) != 0; {
  else
  }
    BOOL v2 = 0;
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "oneToOneRemoteParticipant"), "oneToOneConfig"), "negotiatedScreenEnabled"))BOOL v3 = *(unsigned char *)(a1 + 41) != 0; {
  else
  }
    BOOL v3 = 0;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = v4[41];

  return [v4 configureOneToOneRateController:v5 isUsingCamera:v2 isUsingScreen:v3];
}

- (void)updateOneToOneRateControllerForVideoEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(VCSession *)self isOneToOneUsingScreen];

  [(VCSession *)self updateOneToOneRateControllerForVideoEnabled:v3 screenEnabled:v5];
}

- (VCSession)initWithRelevantStorebagEntries
{
  double NoRemotePacketsTimeout = GKSConnectivitySettings_GetNoRemotePacketsTimeout();
  double v4 = 20.0;
  if (NoRemotePacketsTimeout > 20.0) {
    double v4 = GKSConnectivitySettings_GetNoRemotePacketsTimeout();
  }
  self->_remoteMediaStallDisconnectTimeout = v4;
  +[GKSConnectivitySettings getRemoteMediaStallTimeout];
  self->_remoteMediaStallReconnectTimeout = v5;
  +[GKSConnectivitySettings getNoRemoteDuplicationThresholdFast];
  double v7 = v6;
  uint64_t v8 = [(VCTransportSession *)self->_transportSession connectionManager];

  return (VCSession *)[(VCConnectionManager *)v8 setNoRemoteDuplicationThresholdFast:v7];
}

- (void)cleanupRateControllerOneToOne
{
  p_oneToOneSettings = &self->_oneToOneSettings;

  p_oneToOneSettings->rateController = 0;
  p_oneToOneSettings->mediaController = 0;
}

- (BOOL)configureLocalParticipantWithOneToOneRemoteParticipant:(id)a3 isInitialConfiguration:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  BOOL v7 = [(VCMediaNegotiatorResultsVideo *)[(VCSessionMediaNegotiator *)[(VCSessionParticipant *)self->_localParticipant mediaNegotiator] negotiatedVideoSettings] isSupported];
  BOOL v8 = [(VCMediaNegotiatorResultsVideo *)[(VCSessionMediaNegotiator *)[(VCSessionParticipant *)self->_localParticipant mediaNegotiator] negotiatedScreenSettings] isSupported];
  uint64_t v9 = [(VCMediaNegotiatorResults *)[(VCSessionMediaNegotiator *)[(VCSessionParticipant *)self->_localParticipant mediaNegotiator] negotiatedSettings] mediaControlInfoVersion];
  if (v7 && [(VCSessionParticipant *)self->_localParticipant isVideoEnabled])
  {
    BOOL v10 = 1;
    if (!v8)
    {
LABEL_4:
      BOOL v11 = 0;
      goto LABEL_7;
    }
  }
  else
  {
    BOOL v10 = [(VCSession *)self isUsingPersonaCamera];
    if (!v8) {
      goto LABEL_4;
    }
  }
  BOOL v11 = [(VCSessionParticipant *)self->_localParticipant isScreenEnabled];
LABEL_7:
  [(VCSession *)self configureOneToOneRateController:self->_currentActiveConnection isUsingCamera:v10 isUsingScreen:v11];
  uint64_t v12 = objc_msgSend(+[VCAudioManager sharedVoiceChatInstance](VCAudioManager, "sharedVoiceChatInstance"), "prewarmingClientOperatingMode");
  if (v12) {
    goto LABEL_8;
  }
  if (v10) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = 2;
  }
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v30 = VRTraceErrorLogLevelToCSTR();
      uint64_t v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v33 = v30;
        __int16 v34 = 2080;
        uint64_t v35 = "-[VCSession(OneToOne) configureLocalParticipantWithOneToOneRemoteParticipant:isInitialConfiguration:]";
        __int16 v36 = 1024;
        int v37 = 212;
        __int16 v38 = 1024;
        *(_DWORD *)uint64_t v39 = v12;
        *(_WORD *)&v39[4] = 1024;
        *(_DWORD *)&v39[6] = v10;
        uint64_t v19 = " [%s] %s:%d Failed to get pre-warming client's operating mode from VCAudioManager! Defaulting to operating"
              "Mode=%d (due to isUsingCamera=%{BOOL}d)";
        uint64_t v20 = v18;
        uint32_t v21 = 40;
LABEL_25:
        _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      __int16 v17 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v17 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      int v31 = v17;
      uint64_t v29 = VRTraceErrorLogLevelToCSTR();
      uint64_t v22 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316674;
        uint64_t v33 = v29;
        __int16 v34 = 2080;
        uint64_t v35 = "-[VCSession(OneToOne) configureLocalParticipantWithOneToOneRemoteParticipant:isInitialConfiguration:]";
        __int16 v36 = 1024;
        int v37 = 212;
        __int16 v38 = 2112;
        *(void *)uint64_t v39 = v31;
        *(_WORD *)&v39[8] = 2048;
        uint64_t v40 = self;
        __int16 v41 = 1024;
        int v42 = v12;
        __int16 v43 = 1024;
        BOOL v44 = v10;
        uint64_t v19 = " [%s] %s:%d %@(%p) Failed to get pre-warming client's operating mode from VCAudioManager! Defaulting to op"
              "eratingMode=%d (due to isUsingCamera=%{BOOL}d)";
        uint64_t v20 = v22;
        uint32_t v21 = 60;
        goto LABEL_25;
      }
    }
  }
LABEL_8:
  [(VCSession *)self applyNegotiatedOneToOneFaceTimeSettings];
  id v13 = -[VCSession newParticipantOneToOneConfigWithIDSParticipantID:isLocal:mediaControlInfoVersion:videoEnabled:screenEnabled:remoteParticipant:](self, "newParticipantOneToOneConfigWithIDSParticipantID:isLocal:mediaControlInfoVersion:videoEnabled:screenEnabled:remoteParticipant:", [a3 idsParticipantID], 1, v9, v7, v8, a3);
  __int16 v14 = v13;
  if (!v13)
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSession(OneToOne) configureLocalParticipantWithOneToOneRemoteParticipant:isInitialConfiguration:]();
        }
      }
      goto LABEL_45;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v23 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v23 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_45;
    }
    uint64_t v25 = VRTraceErrorLogLevelToCSTR();
    long long v26 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_45;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v33 = v25;
    __int16 v34 = 2080;
    uint64_t v35 = "-[VCSession(OneToOne) configureLocalParticipantWithOneToOneRemoteParticipant:isInitialConfiguration:]";
    __int16 v36 = 1024;
    int v37 = 218;
    __int16 v38 = 2112;
    *(void *)uint64_t v39 = v23;
    *(_WORD *)&v39[8] = 2048;
    uint64_t v40 = self;
    uint64_t v27 = " [%s] %s:%d %@(%p) Failed to allocate local 1:1 config!";
    goto LABEL_47;
  }
  [v13 setOperatingMode:v12];
  if (![(VCSessionParticipantLocal *)self->_localParticipant configureWithOneToOneParticipantConfig:v14 shouldConfigureGFTStreams:v4])
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSession(OneToOne) configureLocalParticipantWithOneToOneRemoteParticipant:isInitialConfiguration:]();
        }
      }
      goto LABEL_45;
    }
    if (objc_opt_respondsToSelector()) {
      long long v24 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      long long v24 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (uint64_t v28 = VRTraceErrorLogLevelToCSTR(),
          long long v26 = *MEMORY[0x1E4F47A50],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
LABEL_45:
      BOOL v15 = 0;
      goto LABEL_11;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v33 = v28;
    __int16 v34 = 2080;
    uint64_t v35 = "-[VCSession(OneToOne) configureLocalParticipantWithOneToOneRemoteParticipant:isInitialConfiguration:]";
    __int16 v36 = 1024;
    int v37 = 222;
    __int16 v38 = 2112;
    *(void *)uint64_t v39 = v24;
    *(_WORD *)&v39[8] = 2048;
    uint64_t v40 = self;
    uint64_t v27 = " [%s] %s:%d %@(%p) Failed to configure local participant for 1:1!";
LABEL_47:
    _os_log_error_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_ERROR, v27, buf, 0x30u);
    goto LABEL_45;
  }
  [(VCSession *)self setDelegatesForRemoteParticipant:a3];
  MediaQueue_CleanupTxHistory();
  BOOL v15 = 1;
LABEL_11:

  return v15;
}

- (int)setupOneToOneMediaControlInfoGeneratorsWithVersion:(unsigned __int8)a3 oneToOneConfig:(id)a4 videoEnabled:(BOOL)a5
{
  uint64_t v7 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = (const void *)VCMediaControlInfoGeneratorCreateWithTypeAndVersion(0, a3);
  if (!v9)
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSession(OneToOne) setupOneToOneMediaControlInfoGeneratorsWithVersion:oneToOneConfig:videoEnabled:]();
        }
      }
      goto LABEL_31;
    }
    if (objc_opt_respondsToSelector()) {
      BOOL v15 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      BOOL v15 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_31;
    }
    uint64_t v17 = VRTraceErrorLogLevelToCSTR();
    uint64_t v18 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_31;
    }
    *(_DWORD *)uint32_t v21 = 136316162;
    *(void *)&v21[4] = v17;
    *(_WORD *)&v21[12] = 2080;
    *(void *)&v21[14] = "-[VCSession(OneToOne) setupOneToOneMediaControlInfoGeneratorsWithVersion:oneToOneConfig:videoEnabled:]";
    *(_WORD *)&v21[22] = 1024;
    LODWORD(v22) = 236;
    WORD2(v22) = 2112;
    *(void *)((char *)&v22 + 6) = v15;
    HIWORD(v22) = 2048;
    uint64_t v23 = self;
    uint64_t v19 = " [%s] %s:%d %@(%p) Failed to allocate 1:1 audio media control info generator";
LABEL_34:
    _os_log_error_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_ERROR, v19, v21, 0x30u);
    goto LABEL_31;
  }
  [a4 setAudioMediaControlInfoGenerator:v9];
  VCMediaControlInfoGeneratoSetFECFeedbackVersion((void *)[a4 audioMediaControlInfoGenerator], (const char *)1);
  if (self->_isECNCapable) {
    VCMediaControlInfoGeneratorAddOptions((void *)[a4 audioMediaControlInfoGenerator], (const char *)2);
  }
  if (!a5)
  {
    uint64_t v12 = v9;
    goto LABEL_10;
  }
  if ([(VCSessionParticipant *)self->_localParticipant isVideoEnabled]) {
    VCMediaControlInfoGeneratorAddOptions((void *)[a4 audioMediaControlInfoGenerator], (const char *)1);
  }
  uint64_t v10 = VCMediaControlInfoGeneratorCreateWithTypeAndVersion(1, v7);
  if (v10)
  {
    BOOL v11 = (const void *)v10;
    [a4 setVideoMediaControlInfoGenerator:v10];
    VCMediaControlInfoGeneratoSetFECFeedbackVersion((void *)[a4 videoMediaControlInfoGenerator], (const char *)1);
    CFRelease(v9);
    uint64_t v12 = v11;
LABEL_10:
    CFRelease(v12);
    return 0;
  }
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSession(OneToOne) setupOneToOneMediaControlInfoGeneratorsWithVersion:oneToOneConfig:videoEnabled:]();
      }
    }
    goto LABEL_31;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v16 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
  }
  else {
    uint64_t v16 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v20 = VRTraceErrorLogLevelToCSTR();
    uint64_t v18 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint32_t v21 = 136316162;
      *(void *)&v21[4] = v20;
      *(_WORD *)&v21[12] = 2080;
      *(void *)&v21[14] = "-[VCSession(OneToOne) setupOneToOneMediaControlInfoGeneratorsWithVersion:oneToOneConfig:videoEnabled:]";
      *(_WORD *)&v21[22] = 1024;
      LODWORD(v22) = 248;
      WORD2(v22) = 2112;
      *(void *)((char *)&v22 + 6) = v16;
      HIWORD(v22) = 2048;
      uint64_t v23 = self;
      uint64_t v19 = " [%s] %s:%d %@(%p) Failed to allocate 1:1 video media control info generator";
      goto LABEL_34;
    }
  }
LABEL_31:
  int v13 = -2143813630;
  objc_msgSend(a4, "setAudioMediaControlInfoGenerator:", 0, *(_OWORD *)v21, *(void *)&v21[16], v22, v23);
  [a4 setVideoMediaControlInfoGenerator:0];
  if (v9) {
    CFRelease(v9);
  }
  return v13;
}

- (id)newParticipantOneToOneConfigWithIDSParticipantID:(unint64_t)a3 isLocal:(BOOL)a4 mediaControlInfoVersion:(unsigned __int8)a5 videoEnabled:(BOOL)a6 screenEnabled:(BOOL)a7 remoteParticipant:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  uint64_t v11 = a5;
  BOOL v12 = a4;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  BOOL v15 = objc_alloc_init(VCSessionParticipantOneToOneConfig);
  if (!v15)
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSession(OneToOne) newParticipantOneToOneConfigWithIDSParticipantID:isLocal:mediaControlInfoVersion:videoEnabled:screenEnabled:remoteParticipant:]();
        }
      }
      goto LABEL_31;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v19 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v19 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_31;
    }
    uint64_t v21 = VRTraceErrorLogLevelToCSTR();
    long long v22 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_31;
    }
    int v25 = 136316162;
    uint64_t v26 = v21;
    __int16 v27 = 2080;
    uint64_t v28 = "-[VCSession(OneToOne) newParticipantOneToOneConfigWithIDSParticipantID:isLocal:mediaControlInfoVersion:videoEn"
          "abled:screenEnabled:remoteParticipant:]";
    __int16 v29 = 1024;
    int v30 = 271;
    __int16 v31 = 2112;
    __int16 v32 = v19;
    __int16 v33 = 2048;
    __int16 v34 = self;
    uint64_t v23 = " [%s] %s:%d %@(%p) Failed to allocate one to one participant configuration";
    goto LABEL_33;
  }
  if (!v12)
  {
    if (([(VCSession *)self setupOneToOneMediaControlInfoGeneratorsWithVersion:v11 oneToOneConfig:v15 videoEnabled:v10] & 0x80000000) == 0)goto LABEL_5; {
    if ((VCSession *)objc_opt_class() == self)
    }
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSession(OneToOne) newParticipantOneToOneConfigWithIDSParticipantID:isLocal:mediaControlInfoVersion:videoEnabled:screenEnabled:remoteParticipant:]();
        }
      }
      goto LABEL_31;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v20 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v20 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (uint64_t v24 = VRTraceErrorLogLevelToCSTR(),
          long long v22 = *MEMORY[0x1E4F47A50],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
LABEL_31:

      return 0;
    }
    int v25 = 136316162;
    uint64_t v26 = v24;
    __int16 v27 = 2080;
    uint64_t v28 = "-[VCSession(OneToOne) newParticipantOneToOneConfigWithIDSParticipantID:isLocal:mediaControlInfoVersion:videoEn"
          "abled:screenEnabled:remoteParticipant:]";
    __int16 v29 = 1024;
    int v30 = 275;
    __int16 v31 = 2112;
    __int16 v32 = v20;
    __int16 v33 = 2048;
    __int16 v34 = self;
    uint64_t v23 = " [%s] %s:%d %@(%p) Failed to setup the OneToOne MCIG";
LABEL_33:
    _os_log_error_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_ERROR, v23, (uint8_t *)&v25, 0x30u);
    goto LABEL_31;
  }
  -[VCSessionParticipantOneToOneConfig setAudioMediaControlInfoGenerator:](v15, "setAudioMediaControlInfoGenerator:", objc_msgSend((id)objc_msgSend(a8, "oneToOneConfig"), "audioMediaControlInfoGenerator"));
  -[VCSessionParticipantOneToOneConfig setVideoMediaControlInfoGenerator:](v15, "setVideoMediaControlInfoGenerator:", objc_msgSend((id)objc_msgSend(a8, "oneToOneConfig"), "videoMediaControlInfoGenerator"));
LABEL_5:
  [(VCSessionParticipantOneToOneConfig *)v15 setIdsParticipantID:a3];
  [(VCSessionParticipantOneToOneConfig *)v15 setDeviceRole:+[VCSession deviceRoleForSessionMode:[(VCSessionConfiguration *)self->_configuration sessionMode]]];
  [(VCSessionParticipantOneToOneConfig *)v15 setFeedbackController:[(AVCRateController *)self->_oneToOneSettings.rateController feedbackController]];
  [(VCSessionParticipantOneToOneConfig *)v15 setStatisticsCollector:[(AVCRateController *)self->_oneToOneSettings.rateController statisticsCollector]];
  [(VCSessionParticipantOneToOneConfig *)v15 setBasebandCongestionDetector:[(AVCRateController *)self->_oneToOneSettings.rateController basebandCongestionDetector]];
  [(VCSessionParticipantOneToOneConfig *)v15 setMediaController:self->_oneToOneSettings.mediaController];
  if (v12)
  {
    [(VCSessionParticipantOneToOneConfig *)v15 setMediaQueue:self->_oneToOneSettings.mediaQueue];
    uint64_t vcMediaQueue = self->_oneToOneSettings.vcMediaQueue;
  }
  else
  {
    [(VCSessionParticipantOneToOneConfig *)v15 setMediaQueue:0xFFFFFFFFLL];
    uint64_t vcMediaQueue = 0;
  }
  [(VCSessionParticipantOneToOneConfig *)v15 setVcMediaQueue:vcMediaQueue];
  [(VCSessionParticipantOneToOneConfig *)v15 setNegotiatedVideoEnabled:v10];
  [(VCSessionParticipantOneToOneConfig *)v15 setNegotiatedScreenEnabled:v9];
  uint64_t v17 = (void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)[(VCTransportSession *)[(VCSession *)self transportSession] connectionManager]);
  -[VCSessionParticipantOneToOneConfig setInitUsingWifiTiers:](v15, "setInitUsingWifiTiers:", [v17 isWifiToWifi]);
  if (v17) {
    CFRelease(v17);
  }
  [(VCSessionParticipantOneToOneConfig *)v15 setNetworkFeedbackController:self->_feedbackController];
  return v15;
}

- (void)startRateControllerOneToOne
{
  [(AVCRateControlFeedbackController *)[(AVCRateController *)self->_oneToOneSettings.rateController feedbackController] setIsFeedbackReceived:0];
  [(VCSession *)self configureOneToOneRateController:self->_currentActiveConnection];
  rateController = self->_oneToOneSettings.rateController;

  [(AVCRateController *)rateController start];
}

- (void)stopRateControllerOneToOne
{
}

- (BOOL)isOneToOneUsingVideo
{
  if ([(VCSessionParticipantOneToOneConfig *)[(VCSessionParticipant *)[(VCSession *)self oneToOneRemoteParticipant] oneToOneConfig] negotiatedVideoEnabled])
  {
    BOOL v3 = [(VCSessionParticipant *)self->_localParticipant isVideoEnabled];
  }
  else
  {
    BOOL v3 = 0;
  }
  return v3 | [(VCSession *)self isUsingPersonaCamera];
}

- (BOOL)isUsingPersonaCamera
{
  BOOL v3 = [(VCSession *)self isPersonaCameraSupported];
  if (v3)
  {
    localParticipant = self->_localParticipant;
    LOBYTE(v3) = [(VCSessionParticipant *)localParticipant isPersonaCameraEnabled];
  }
  return v3;
}

- (BOOL)isPersonaCameraSupported
{
  BOOL v2 = [(VCSessionParticipant *)self->_localParticipant mediaNegotiator];
  if (objc_msgSend(-[VCSessionMediaNegotiator negotiatedResultsForGroupID:](v2, "negotiatedResultsForGroupID:", 1718909044), "isSupported"))return 1; {
  id v4 = [(VCSessionMediaNegotiator *)v2 negotiatedResultsForGroupID:1650745716];
  }

  return [v4 isSupported];
}

- (BOOL)isOneToOneUsingScreen
{
  BOOL v3 = [(VCSessionParticipantOneToOneConfig *)[(VCSessionParticipant *)[(VCSession *)self oneToOneRemoteParticipant] oneToOneConfig] negotiatedScreenEnabled];
  if (v3)
  {
    localParticipant = self->_localParticipant;
    LOBYTE(v3) = [(VCSessionParticipant *)localParticipant isScreenEnabled];
  }
  return v3;
}

- (BOOL)isOneToOneRemoteParticipantUsingScreen
{
  BOOL v3 = [(VCSessionParticipantOneToOneConfig *)[(VCSessionParticipant *)[(VCSession *)self oneToOneRemoteParticipant] oneToOneConfig] negotiatedScreenEnabled];
  if (v3)
  {
    id v4 = [(VCSession *)self oneToOneRemoteParticipant];
    LOBYTE(v3) = [(VCSessionParticipant *)v4 isScreenEnabled];
  }
  return v3;
}

- (BOOL)configureRemoteParticipantForOneToOne:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(VCMediaNegotiatorResultsVideo *)[(VCSessionMediaNegotiator *)[(VCSessionParticipant *)self->_localParticipant mediaNegotiator] negotiatedVideoSettings] isSupported];
  BOOL v6 = [(VCMediaNegotiatorResultsVideo *)[(VCSessionMediaNegotiator *)[(VCSessionParticipant *)self->_localParticipant mediaNegotiator] negotiatedScreenSettings] isSupported];
  BOOL v7 = v5 && [(VCSessionParticipant *)self->_localParticipant isVideoEnabled]
    || [(VCSession *)self isUsingPersonaCamera];
  uint64_t v8 = [(VCMediaNegotiatorResults *)[(VCSessionMediaNegotiator *)[(VCSessionParticipant *)self->_localParticipant mediaNegotiator] negotiatedSettings] mediaControlInfoVersion];
  uint64_t v9 = objc_msgSend(+[VCAudioManager sharedVoiceChatInstance](VCAudioManager, "sharedVoiceChatInstance"), "prewarmingClientOperatingMode");
  if (!v9)
  {
    if (v7) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = 2;
    }
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_6;
      }
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      BOOL v15 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_6;
      }
      *(_DWORD *)__int16 v27 = 136316162;
      *(void *)&v27[4] = v14;
      *(_WORD *)&v27[12] = 2080;
      *(void *)&v27[14] = "-[VCSession(OneToOne) configureRemoteParticipantForOneToOne:]";
      *(_WORD *)&v27[22] = 1024;
      LODWORD(v28) = 352;
      WORD2(v28) = 1024;
      *(_DWORD *)((char *)&v28 + 6) = v9;
      WORD5(v28) = 1024;
      HIDWORD(v28) = v7;
      uint64_t v16 = " [%s] %s:%d Failed to get pre-warming client's operating mode from VCAudioManager! Defaulting to operatingMo"
            "de=%d (due to isUsingCamera=%{BOOL}d)";
      uint64_t v17 = v15;
      uint32_t v18 = 40;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v13 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
      }
      else {
        int v13 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_6;
      }
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      uint64_t v20 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_6;
      }
      *(_DWORD *)__int16 v27 = 136316674;
      *(void *)&v27[4] = v19;
      *(_WORD *)&v27[12] = 2080;
      *(void *)&v27[14] = "-[VCSession(OneToOne) configureRemoteParticipantForOneToOne:]";
      *(_WORD *)&v27[22] = 1024;
      LODWORD(v28) = 352;
      WORD2(v28) = 2112;
      *(void *)((char *)&v28 + 6) = v13;
      HIWORD(v28) = 2048;
      __int16 v29 = self;
      LOWORD(v30) = 1024;
      *(_DWORD *)((char *)&v30 + 2) = v9;
      HIWORD(v30) = 1024;
      LODWORD(v31) = v7;
      uint64_t v16 = " [%s] %s:%d %@(%p) Failed to get pre-warming client's operating mode from VCAudioManager! Defaulting to oper"
            "atingMode=%d (due to isUsingCamera=%{BOOL}d)";
      uint64_t v17 = v20;
      uint32_t v18 = 60;
    }
    _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, v16, v27, v18);
  }
LABEL_6:
  id v10 = -[VCSession newParticipantOneToOneConfigWithIDSParticipantID:isLocal:mediaControlInfoVersion:videoEnabled:screenEnabled:remoteParticipant:](self, "newParticipantOneToOneConfigWithIDSParticipantID:isLocal:mediaControlInfoVersion:videoEnabled:screenEnabled:remoteParticipant:", objc_msgSend(a3, "idsParticipantID", *(_OWORD *)v27, *(void *)&v27[16], v28, v29, v30, v31), 0, v8, v5, v6, a3);
  if (!v10)
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSession(OneToOne) configureRemoteParticipantForOneToOne:]();
        }
      }
      goto LABEL_43;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v21 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v21 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_43;
    }
    uint64_t v23 = VRTraceErrorLogLevelToCSTR();
    uint64_t v24 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    *(_DWORD *)__int16 v27 = 136316162;
    *(void *)&v27[4] = v23;
    *(_WORD *)&v27[12] = 2080;
    *(void *)&v27[14] = "-[VCSession(OneToOne) configureRemoteParticipantForOneToOne:]";
    *(_WORD *)&v27[22] = 1024;
    LODWORD(v28) = 356;
    WORD2(v28) = 2112;
    *(void *)((char *)&v28 + 6) = v21;
    HIWORD(v28) = 2048;
    __int16 v29 = self;
    int v25 = " [%s] %s:%d %@(%p) Failed to allocate local 1:1 config!";
    goto LABEL_45;
  }
  if (([a3 configureWithOneToOneParticipantConfig:v10 operatingMode:v9] & 1) == 0)
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSession(OneToOne) configureRemoteParticipantForOneToOne:]();
        }
      }
      goto LABEL_43;
    }
    if (objc_opt_respondsToSelector()) {
      long long v22 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      long long v22 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (uint64_t v26 = VRTraceErrorLogLevelToCSTR(),
          uint64_t v24 = *MEMORY[0x1E4F47A50],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
LABEL_43:
      BOOL v11 = 0;
      goto LABEL_9;
    }
    *(_DWORD *)__int16 v27 = 136316162;
    *(void *)&v27[4] = v26;
    *(_WORD *)&v27[12] = 2080;
    *(void *)&v27[14] = "-[VCSession(OneToOne) configureRemoteParticipantForOneToOne:]";
    *(_WORD *)&v27[22] = 1024;
    LODWORD(v28) = 359;
    WORD2(v28) = 2112;
    *(void *)((char *)&v28 + 6) = v22;
    HIWORD(v28) = 2048;
    __int16 v29 = self;
    int v25 = " [%s] %s:%d %@(%p) Failed to configure remote participant for 1:1!";
LABEL_45:
    _os_log_error_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_ERROR, v25, v27, 0x30u);
    goto LABEL_43;
  }
  [(VCSession *)self setDelegatesForRemoteParticipant:a3];
  BOOL v11 = 1;
LABEL_9:

  return v11;
}

- (unsigned)detailedErrorCodeForNoRemotePacketsError
{
  BOOL v2 = [(VCTransportSession *)[(VCSession *)self transportSession] connectionManager];
  if (![(VCConnectionManager *)v2 isEndToEndLinkAvailable]) {
    return 24;
  }
  int v3 = [(VCConnectionManager *)v2 isEndToEndLinkWithCellAvailable:1];
  if (v3 | [(VCConnectionManager *)v2 isEndToEndLinkWithCellAvailable:0])return 14; {
  else
  }
    return 25;
}

- (void)reportExistingParticipantsAnew
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v3 = (void *)[(NSMutableDictionary *)self->_remoteParticipantsMapByUUID allKeys];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obuint64_t j = v3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v9 = (void *)[(NSMutableDictionary *)self->_remoteParticipantsMapByUUID objectForKeyedSubscript:v8];
        id v10 = (void *)MEMORY[0x1E4F1CA60];
        v14[0] = v8;
        v13[0] = @"VCSPUUID";
        v13[1] = @"VCSPIDSID";
        v14[1] = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v9, "idsParticipantID"));
        v13[2] = @"VCSPAudioEnabled";
        v14[2] = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v9, "isAudioEnabled"));
        void v13[3] = @"VCSPVideoEnabled";
        void v14[3] = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v9, "isVideoEnabled"));
        BOOL v11 = objc_msgSend(v10, "dictionaryWithDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v14, v13, 4));
        [(VCSession *)self addNegotiatedCipherSuitesForParticipant:v9 toReportingDictionary:v11];
        objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v9, "callInfoBlob"), "osVersion"), @"REMBUILD");
        objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v9, "callInfoBlob"), "deviceType"), @"RDT");
        reportingGenericEvent();
        [v9 reportConnectionTiming];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)reportStartedSwitchingToOneToOne:(BOOL)a3
{
  reportingGenericEvent();

  [(VCSession *)self reportClientPersistentSettings];
}

- (void)reportCompletedSwitchingToOneToOne:(BOOL)a3
{
  BOOL v3 = a3;
  v32[1] = *MEMORY[0x1E4F143B8];
  if (self->_oneToOneSwitchStartTime != 0.0)
  {
    double v5 = micro();
    double oneToOneSwitchStartTime = self->_oneToOneSwitchStartTime;
    BOOL v7 = @"VCSOTOST";
    double v8 = v5 - oneToOneSwitchStartTime;
    if (v3) {
      BOOL v7 = @"VCGFTSWTT";
    }
    uint64_t v31 = v7;
    v32[0] = [NSNumber numberWithDouble:v5 - oneToOneSwitchStartTime];
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    self->_double oneToOneSwitchStartTime = 0.0;
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        BOOL v11 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v17 = 136316162;
          uint64_t v18 = v10;
          __int16 v19 = 2080;
          uint64_t v20 = "-[VCSession(OneToOne) reportCompletedSwitchingToOneToOne:]";
          __int16 v21 = 1024;
          int v22 = 423;
          __int16 v23 = 2048;
          double v24 = v8;
          __int16 v25 = 1024;
          LODWORD(v26) = v3;
          BOOL v12 = " [%s] %s:%d SwitchTime=%f switchingToOneToOne=%d";
          int v13 = v11;
          uint32_t v14 = 44;
LABEL_15:
          _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v17, v14);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v9 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v9 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        long long v16 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v17 = 136316674;
          uint64_t v18 = v15;
          __int16 v19 = 2080;
          uint64_t v20 = "-[VCSession(OneToOne) reportCompletedSwitchingToOneToOne:]";
          __int16 v21 = 1024;
          int v22 = 423;
          __int16 v23 = 2112;
          double v24 = *(double *)&v9;
          __int16 v25 = 2048;
          uint64_t v26 = self;
          __int16 v27 = 2048;
          double v28 = v8;
          __int16 v29 = 1024;
          BOOL v30 = v3;
          BOOL v12 = " [%s] %s:%d %@(%p) SwitchTime=%f switchingToOneToOne=%d";
          int v13 = v16;
          uint32_t v14 = 64;
          goto LABEL_15;
        }
      }
    }
  }
  reportingGenericEvent();
  [(VCSession *)self reportLocalRateControlExperimentConfiguration];
}

- (void)reportSwitchingError:(BOOL)a3 errorEvent:(unsigned int)a4
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = @"VCSErrorDetected";
  v5[0] = [NSNumber numberWithUnsignedInt:*(void *)&a4];
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  reportingGenericEvent();
}

- (void)oneToOneToMultiwaySwitchSuspend
{
  if ((self->_state | 2) == 3)
  {
    [(VCSessionParticipantLocal *)self->_localParticipant suspendStreamsOnOneToOneModeSwitch];
    [(VCSession *)self stopRateControllerOneToOne];
    uint64_t vcMediaQueue = self->_oneToOneSettings.vcMediaQueue;
    if (vcMediaQueue)
    {
      VCMediaQueue_Stop((uint64_t)vcMediaQueue);
    }
  }
}

- (void)oneToOneToMultiwaySwitchResume
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  VCConnectionManager_AddTelemetryForPacketHistory((uint64_t)[(VCTransportSession *)self->_transportSession connectionManager], (uint64_t)v3);
  [(VCSession *)self startReportingForOneToOneEnabled:0 withPayload:v3];
  [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] reportCurrentPrimaryConnection];
  [(VCSession *)self reportExistingParticipantsAnew];
  if ((self->_state | 2) == 3)
  {
    [(VCSession *)self startRateControllersMultiwayFromOneToOne:1];
    [(VCSessionStatsController *)self->_sessionStatsController reset];
    [(VCSessionStatsController *)self->_sessionStatsController startLocalSessionStatsUpdate];
    VCMediaQueue_Start((uint64_t)self->_mediaQueue);
    if (self->_state == 1)
    {
      [(NSMutableArray *)self->_startingParticipants addObject:self->_localParticipant];
      localParticipant = self->_localParticipant;
      [(VCSessionParticipantLocal *)localParticipant start];
    }
    else
    {
      [(VCSessionParticipantLocal *)self->_localParticipant resumeStreamsOnOneToOneModeSwitch];
      [(NSMutableDictionary *)self->_optInDictionary removeAllObjects];
      [(VCSession *)self distributeBitrateAndOptInToStreamIDsWithSeamlessTransition:0];
    }
  }
}

- (void)oneToOneToMultiwaySwitchConfigure
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!self->_downlinkBandwidthAllocator) {
    self->_downlinkBandwidthAllocator = [[VCSessionDownlinkBandwidthAllocator alloc] initWithReportingAgent:self->super._reportingAgent];
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = [(VCSession *)self remoteParticipants];
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v8 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [(VCSessionDownlinkBandwidthAllocator *)self->_downlinkBandwidthAllocator registerForBandwidthAllocationWithClient:*(void *)(*((void *)&v9 + 1) + 8 * i)];
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v8 count:16];
    }
    while (v5);
  }
  [(VCSession *)self reportingSetUserInfo];
  [(VCSession *)self setupMultiwayABTesting];
  if (self->_state != 3) {
    [(VCSessionParticipant *)self->_localParticipant configureWithDeviceRole:+[VCSession deviceRoleForSessionMode:[(VCSessionConfiguration *)self->_configuration sessionMode]] negotiatedVideoEnabled:0 negotiatedScreenEnabled:0 operatingMode:6];
  }
  [(VCSessionParticipantLocal *)self->_localParticipant setOneToOneModeEnabled:0];
  [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] setStatisticsCollector:[(AVCRateController *)self->_downlinkRateController statisticsCollector]];
  [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] setIsOneToOneModeEnabled:0];
  [(VCTransportSession *)self->_transportSession setOneToOneModeEnabled:0 isInitiator:self->_isOneToOneInitiator];
  [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] setiRATDuplicationEnabled:1];
  [(VCConnectionHealthMonitor *)[(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] connectionHealthMonitor] setUsingServerBasedLinks:1];
  [(VCSession *)self setTransportConnectionSelectionVersionWithLocalFrameWorkVersion:[(VCCallInfoBlob *)[(VCSessionParticipant *)self->_localParticipant callInfoBlob] frameworkVersion] remoteFrameworkVersion:[(VCCallInfoBlob *)[(VCSessionParticipant *)self->_localParticipant callInfoBlob] frameworkVersion]];
  [(VCSession *)self messageExistingParticipantsPostOneToOneModeSwitch];
  self->_oneToOneSettings.startedOneToOne = 0;
  self->_BOOL oneToOneModeEnabled = 0;
  [(VCSessionConfiguration *)self->_configuration setOneToOneModeEnabled:0];
  [(VCSessionParticipantLocal *)self->_localParticipant setOneToOneModeEnabled:0];
  [(VCAudioCaptionsCoordinator *)self->_captionsCoordinator setOneToOneModeEnabled:0];
  VCMediaQueue_SetOneToOne((uint64_t)self->_mediaQueue, 0);
}

- (BOOL)switchFromOneToOneToMultiway
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (self->_oneToOneModeEnabled)
  {
    [(VCSession *)self reportStartedSwitchingToOneToOne:0];
    [(VCSession *)self oneToOneToMultiwaySwitchSuspend];
    [(VCSession *)self oneToOneToMultiwaySwitchConfigure];
    [(VCSession *)self oneToOneToMultiwaySwitchResume];
    [(VCSession *)self reportCompletedSwitchingToOneToOne:0];
    return 1;
  }
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315650;
        uint64_t v13 = v5;
        __int16 v14 = 2080;
        uint64_t v15 = "-[VCSession(OneToOne) switchFromOneToOneToMultiway]";
        __int16 v16 = 1024;
        int v17 = 521;
        BOOL v7 = " [%s] %s:%d Already switched to GFT, ignoring.";
        double v8 = v6;
        uint32_t v9 = 28;
LABEL_14:
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v12, v9);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v4 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v4 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      long long v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136316162;
        uint64_t v13 = v10;
        __int16 v14 = 2080;
        uint64_t v15 = "-[VCSession(OneToOne) switchFromOneToOneToMultiway]";
        __int16 v16 = 1024;
        int v17 = 521;
        __int16 v18 = 2112;
        __int16 v19 = v4;
        __int16 v20 = 2048;
        __int16 v21 = self;
        BOOL v7 = " [%s] %s:%d %@(%p) Already switched to GFT, ignoring.";
        double v8 = v11;
        uint32_t v9 = 48;
        goto LABEL_14;
      }
    }
  }
  return 1;
}

- (void)messageExistingParticipantsPostOneToOneModeSwitch
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[(NSMutableDictionary *)self->_remoteParticipantsMapByUUID allKeys];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  obuint64_t j = v3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = [(NSMutableDictionary *)self->_remoteParticipantsMapByUUID objectForKeyedSubscript:*(void *)(*((void *)&v13 + 1) + 8 * v7)];
        [(VCSession *)self sendNetworkCapabilitiesMessageToParticipant:v8];
        uint64_t v10 = @"Thermal";
        uint64_t v11 = [NSNumber numberWithUnsignedInt:self->_lastThermalLevel];
        -[VCSession sendDeviceStateMessageToParticipant:withStatus:checkDNUStatus:](self, "sendDeviceStateMessageToParticipant:withStatus:checkDNUStatus:", v8, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1], 1);
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v13 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)multiwayToOneToOneSwitchSuspend
{
  if ((self->_state | 2) == 3)
  {
    [(VCSessionParticipantLocal *)self->_localParticipant suspendStreamsOnOneToOneModeSwitch];
    [(VCSessionStatsController *)self->_sessionStatsController stopLocalSessionStatsUpdate];
    VCMediaQueue_Stop((uint64_t)self->_mediaQueue);
    [(AVCRateController *)self->_uplinkRateController stop];
    [(AVCRateController *)self->_downlinkRateController stop];
    downlinkBandwidthAllocator = self->_downlinkBandwidthAllocator;
    uint64_t v4 = [(VCSession *)self oneToOneRemoteParticipant];
    [(VCSessionDownlinkBandwidthAllocator *)downlinkBandwidthAllocator deregisterForBandwidthAllocationWithClient:v4];
  }
}

- (void)multiwayToOneToOneSwitchResume
{
  if ((self->_state | 2) == 3)
  {
    +[VCSession deviceRoleForSessionMode:[(VCSessionConfiguration *)self->_configuration sessionMode]];
    [(VCSession *)self isOneToOneUsingVideo];
    reportingModeRoleTransportLog();
    localParticipant = self->_localParticipant;
    [(VCSessionParticipantLocal *)localParticipant resumeStreamsOnOneToOneModeSwitch];
  }
}

- (void)revertMultiwayToOneToOneModeSwitchConfigure
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(VCSession *)self remoteParticipants];
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v8 count:16];
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
        [(VCSessionDownlinkBandwidthAllocator *)self->_downlinkBandwidthAllocator registerForBandwidthAllocationWithClient:*(void *)(*((void *)&v9 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v8 count:16];
    }
    while (v5);
  }
  [(VCSessionParticipantLocal *)self->_localParticipant setOneToOneModeEnabled:0];
  [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] setStatisticsCollector:[(AVCRateController *)self->_downlinkRateController statisticsCollector]];
  [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] setIsOneToOneModeEnabled:0];
  [(VCTransportSession *)self->_transportSession setOneToOneModeEnabled:0 isInitiator:self->_isOneToOneInitiator];
  [(VCSession *)self setTransportConnectionSelectionVersionWithLocalFrameWorkVersion:[(VCCallInfoBlob *)[(VCSessionParticipant *)self->_localParticipant callInfoBlob] frameworkVersion] remoteFrameworkVersion:[(VCCallInfoBlob *)[(VCSessionParticipant *)self->_localParticipant callInfoBlob] frameworkVersion]];
  self->_BOOL oneToOneModeEnabled = 0;
  [(VCSessionConfiguration *)self->_configuration setOneToOneModeEnabled:0];
  [(VCAudioCaptionsCoordinator *)self->_captionsCoordinator setOneToOneModeEnabled:0];
  VCMediaQueue_SetOneToOne((uint64_t)self->_mediaQueue, 0);
}

- (BOOL)multiwayToOneToOneSwitchConfigure
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(VCSession *)self renewOneToOneMediaQueue];
  self->_BOOL oneToOneModeEnabled = 1;
  [(VCSessionConfiguration *)self->_configuration setOneToOneModeEnabled:1];
  [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] setIsOneToOneModeEnabled:1];
  [(VCSession *)self startReportingForOneToOneEnabled:1 withPayload:0];
  [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] reportCurrentPrimaryConnection];
  [(VCSession *)self reportExistingParticipantsAnew];
  [(VCSession *)self setupOneToOneAdaptiveLearning];
  [(VCAudioCaptionsCoordinator *)self->_captionsCoordinator setOneToOneModeEnabled:1];
  uint64_t v3 = +[VCSession deviceRoleForSessionMode:[(VCSessionConfiguration *)self->_configuration sessionMode]];
  [(VCSession *)self setTransportConnectionSelectionVersionWithLocalFrameWorkVersion:@"2045" remoteFrameworkVersion:@"2045"];
  [(VCTransportSession *)self->_transportSession setRemoteDeviceVersionIDS];
  [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] setDefaultLinkProbingCapabilityVersionForDeviceRole:v3];
  [(VCTransportSession *)self->_transportSession setOneToOneModeEnabled:1 isInitiator:self->_isOneToOneInitiator];
  [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] setStatisticsCollector:[(VCSessionParticipantOneToOneConfig *)[(VCSessionParticipant *)[(VCSession *)self oneToOneRemoteParticipant] oneToOneConfig] statisticsCollector]];
  [(VCSession *)self messageExistingParticipantsPostOneToOneModeSwitch];
  if ([(VCSession *)self oneToOneRemoteParticipant]
    && ![(VCSession *)self negotiateOneToOneWithRemoteParticipant:[(VCSession *)self oneToOneRemoteParticipant]])
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSession(OneToOne) multiwayToOneToOneSwitchConfigure]();
        }
      }
      goto LABEL_11;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long v11 = 136316162;
        *(void *)&v11[4] = v7;
        *(_WORD *)&v11[12] = 2080;
        *(void *)&v11[14] = "-[VCSession(OneToOne) multiwayToOneToOneSwitchConfigure]";
        *(_WORD *)&v11[22] = 1024;
        LODWORD(v12) = 616;
        WORD2(v12) = 2112;
        *(void *)((char *)&v12 + 6) = v5;
        HIWORD(v12) = 2048;
        uint64_t v13 = self;
        long long v9 = " [%s] %s:%d %@(%p) Failed to negotiate with devices that do not support one to one mode";
LABEL_32:
        _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, v9, v11, 0x30u);
      }
    }
  }
  else
  {
    [(VCSessionParticipantLocal *)self->_localParticipant setOneToOneModeEnabled:1];
    if ([(VCSession *)self oneToOneRemoteParticipant])
    {
      if ([(VCSession *)self configureLocalParticipantWithOneToOneRemoteParticipant:[(VCSession *)self oneToOneRemoteParticipant] isInitialConfiguration:0])
      {
        [(VCSession *)self setTransportConnectionSelectionVersionWithLocalFrameWorkVersion:[(VCCallInfoBlob *)[(VCSessionParticipant *)self->_localParticipant callInfoBlob] frameworkVersion] remoteFrameworkVersion:[(VCCallInfoBlob *)[(VCSessionParticipant *)[(VCSession *)self oneToOneRemoteParticipant] callInfoBlob] frameworkVersion]];
        return 1;
      }
      if ((VCSession *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSession(OneToOne) multiwayToOneToOneSwitchConfigure]();
          }
        }
        goto LABEL_11;
      }
      if (objc_opt_respondsToSelector()) {
        uint64_t v6 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        uint64_t v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long v11 = 136316162;
          *(void *)&v11[4] = v10;
          *(_WORD *)&v11[12] = 2080;
          *(void *)&v11[14] = "-[VCSession(OneToOne) multiwayToOneToOneSwitchConfigure]";
          *(_WORD *)&v11[22] = 1024;
          LODWORD(v12) = 622;
          WORD2(v12) = 2112;
          *(void *)((char *)&v12 + 6) = v6;
          HIWORD(v12) = 2048;
          uint64_t v13 = self;
          long long v9 = " [%s] %s:%d %@(%p) Failed to reconfigure local participant failed to switch";
          goto LABEL_32;
        }
      }
    }
    else
    {
      if ((self->_state | 2) != 3) {
        return 1;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSession(OneToOne) multiwayToOneToOneSwitchConfigure]();
        }
      }
    }
  }
LABEL_11:
  [(VCSession *)self revertMultiwayToOneToOneModeSwitchConfigure];
  return 0;
}

- (BOOL)switchFromMultiwayToOneToOne
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (self->_oneToOneModeEnabled)
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return 1;
      }
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return 1;
      }
      int v16 = 136315650;
      uint64_t v17 = v5;
      __int16 v18 = 2080;
      __int16 v19 = "-[VCSession(OneToOne) switchFromMultiwayToOneToOne]";
      __int16 v20 = 1024;
      int v21 = 638;
      uint64_t v7 = " [%s] %s:%d Already switched to OneToOne, ignoring.";
      uint64_t v8 = v6;
      uint32_t v9 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v3 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v3 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return 1;
      }
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      long long v11 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return 1;
      }
      int v16 = 136316162;
      uint64_t v17 = v10;
      __int16 v18 = 2080;
      __int16 v19 = "-[VCSession(OneToOne) switchFromMultiwayToOneToOne]";
      __int16 v20 = 1024;
      int v21 = 638;
      __int16 v22 = 2112;
      __int16 v23 = v3;
      __int16 v24 = 2048;
      __int16 v25 = self;
      uint64_t v7 = " [%s] %s:%d %@(%p) Already switched to OneToOne, ignoring.";
      uint64_t v8 = v11;
      uint32_t v9 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v16, v9);
    return 1;
  }
  [(VCSession *)self reportStartedSwitchingToOneToOne:1];
  [(VCSession *)self multiwayToOneToOneSwitchSuspend];
  if ([(VCSession *)self multiwayToOneToOneSwitchConfigure])
  {
    [(VCSession *)self multiwayToOneToOneSwitchResume];
    BOOL v4 = 1;
    [(VCSession *)self reportCompletedSwitchingToOneToOne:1];
  }
  else
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSession(OneToOne) switchFromMultiwayToOneToOne]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v13 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v13 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        long long v15 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v16 = 136316162;
          uint64_t v17 = v14;
          __int16 v18 = 2080;
          __int16 v19 = "-[VCSession(OneToOne) switchFromMultiwayToOneToOne]";
          __int16 v20 = 1024;
          int v21 = 648;
          __int16 v22 = 2112;
          __int16 v23 = v13;
          __int16 v24 = 2048;
          __int16 v25 = self;
          _os_log_error_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to reconfigure session for switch to OneToOne", (uint8_t *)&v16, 0x30u);
        }
      }
    }
    [(VCSession *)self oneToOneToMultiwaySwitchResume];
    return 0;
  }
  return v4;
}

- (void)cleanupOneToOneMediaQueue
{
  p_oneToOneSettings = &self->_oneToOneSettings;
  if (self->_oneToOneSettings.mediaQueue != (tagHANDLE *)0xFFFFFFFFLL)
  {
    MediaQueue_CloseHandle();
    p_oneToOneSettings->mediaQueue = (tagHANDLE *)0xFFFFFFFFLL;
  }
  uint64_t vcMediaQueue = (uint64_t)p_oneToOneSettings->vcMediaQueue;
  if (vcMediaQueue)
  {
    VCMediaQueue_FlushAllPackets(vcMediaQueue);
  }
}

- (void)cleanupOneToOne
{
  [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] setStartConnectionHealthMonitoring:0];
  [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] setIsOneToOneModeEnabled:0];
  [(VCTransportSession *)self->_transportSession setOneToOneModeEnabled:0 isInitiator:self->_isOneToOneInitiator];
  [(VCSession *)self cleanupRateControllerOneToOne];
  [(VCSession *)self cleanupOneToOneMediaQueue];

  reportingStopTimer();
}

- (void)cleanupOneToOneDelegates
{
  [(VCSession *)self cleanupOneToOneVideoReceiverDelegate];

  [(VCSession *)self cleanUpOneToOneVideoStreamDelegate];
}

- (void)cleanupOneToOneVideoReceiverDelegate
{
  if (self->_oneToOneModeEnabled)
  {
    BOOL v2 = [(VCSession *)self oneToOneRemoteParticipant];
    [(VCSessionParticipantRemote *)v2 setVideoReceiverFeedbackDelegate:0];
  }
}

- (void)cleanUpOneToOneVideoStreamDelegate
{
  v2[1] = *MEMORY[0x1E4F143B8];
  if (self->_oneToOneModeEnabled)
  {
    v2[0] = 0;
    [(VCSessionParticipantRemote *)[(VCSession *)self oneToOneRemoteParticipant] setVideoStreamDelegate:0 delegateFunctions:v2];
  }
}

- (void)startReportingForOneToOneEnabled:(BOOL)a3 withPayload:(id)a4
{
  BOOL v4 = a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (VCSession *)objc_opt_class();
  if (v4)
  {
    if (v6 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7
        || (uint64_t v9 = VRTraceErrorLogLevelToCSTR(),
            uint64_t v10 = *MEMORY[0x1E4F47A50],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)))
      {
LABEL_19:
        if (+[VCDefaults BOOLeanValueForKey:@"useAggregatorMultiwayforU1" defaultValue:1])
        {
          int v21 = 5;
        }
        else
        {
          int v21 = 0;
        }
        self->_reportingClientType = v21;
        goto LABEL_28;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v25 = v9;
      __int16 v26 = 2080;
      __int16 v27 = "-[VCSession(OneToOne) startReportingForOneToOneEnabled:withPayload:]";
      __int16 v28 = 1024;
      int v29 = 707;
      long long v11 = " [%s] %s:%d RTCReporting: Switching to one-to-one mode reporting";
      long long v12 = v10;
      uint32_t v13 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v7 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_19;
      }
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      __int16 v20 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v25 = v19;
      __int16 v26 = 2080;
      __int16 v27 = "-[VCSession(OneToOne) startReportingForOneToOneEnabled:withPayload:]";
      __int16 v28 = 1024;
      int v29 = 707;
      __int16 v30 = 2112;
      uint64_t v31 = v7;
      __int16 v32 = 2048;
      __int16 v33 = self;
      long long v11 = " [%s] %s:%d %@(%p) RTCReporting: Switching to one-to-one mode reporting";
      long long v12 = v20;
      uint32_t v13 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
    goto LABEL_19;
  }
  if (v6 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_28;
    }
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    long long v15 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v25 = v14;
    __int16 v26 = 2080;
    __int16 v27 = "-[VCSession(OneToOne) startReportingForOneToOneEnabled:withPayload:]";
    __int16 v28 = 1024;
    int v29 = 712;
    int v16 = " [%s] %s:%d RTCReporting: Switching to one-to-many mode reporting";
    uint64_t v17 = v15;
    uint32_t v18 = 28;
LABEL_27:
    _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
    goto LABEL_28;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v8 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
  }
  else {
    uint64_t v8 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v22 = VRTraceErrorLogLevelToCSTR();
    __int16 v23 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v25 = v22;
      __int16 v26 = 2080;
      __int16 v27 = "-[VCSession(OneToOne) startReportingForOneToOneEnabled:withPayload:]";
      __int16 v28 = 1024;
      int v29 = 712;
      __int16 v30 = 2112;
      uint64_t v31 = v8;
      __int16 v32 = 2048;
      __int16 v33 = self;
      int v16 = " [%s] %s:%d %@(%p) RTCReporting: Switching to one-to-many mode reporting";
      uint64_t v17 = v23;
      uint32_t v18 = 48;
      goto LABEL_27;
    }
  }
LABEL_28:
  reportingSetAggregatorForClientType();
  [(VCSession *)self reportingSetUserInfo];
  reportingSetPeriodicAggregationOccuredHandler();
  reportingSetPeriodicAggregationOccuredHandler();
  ReportingVC_SetEventDrivenAggregationOccurredHandler();
}

uint64_t __68__VCSession_OneToOne__startReportingForOneToOneEnabled_withPayload___block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v4 = +[VCQoSMonitorManager sharedInstance];
  uint64_t v5 = *(void *)(a1 + 32);

  return [(VCQoSMonitorManager *)v4 updateQoSReport:a2 toClientsWithToken:v5];
}

uint64_t __68__VCSession_OneToOne__startReportingForOneToOneEnabled_withPayload___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = +[VCQoSMonitorManager sharedInstance];
  uint64_t v6 = *(void *)(a1 + 32);

  return [(VCQoSMonitorManager *)v5 updateEventDrivenQoSReport:a3 toClientsWithToken:v6];
}

- (void)renewOneToOneMediaQueue
{
  p_oneToOneSettings = &self->_oneToOneSettings;
  uint64_t vcMediaQueue = self->_oneToOneSettings.vcMediaQueue;
  if (vcMediaQueue)
  {
    VCMediaQueue_FlushAllPackets((uint64_t)vcMediaQueue);
    uint64_t v4 = (uint64_t)p_oneToOneSettings->vcMediaQueue;
    VCMediaQueue_SetOneToOne(v4, 1);
  }
  else
  {
    p_mediaQueue = (uint64_t *)&p_oneToOneSettings->mediaQueue;
    MediaQueue_CloseHandle();
    MediaQueue_CreateHandle(p_mediaQueue, 0xFFFFFFFFLL);
    uint64_t v6 = (void *)*(p_mediaQueue - 1);
    uint64_t v7 = *p_mediaQueue;
    [v6 setMediaQueue:v7];
  }
}

- (void)setupOneToOneAdaptiveLearning
{
  v15[14] = *MEMORY[0x1E4F143B8];
  v14[0] = *MEMORY[0x1E4F47AC8];
  v15[0] = objc_msgSend(NSNumber, "numberWithInt:", +[GKSConnectivitySettings getAdaptiveLearningState](GKSConnectivitySettings, "getAdaptiveLearningState"));
  v14[1] = *MEMORY[0x1E4F47AA8];
  v15[1] = objc_msgSend(NSNumber, "numberWithInt:", +[GKSConnectivitySettings getShortTermHistoryLength](GKSConnectivitySettings, "getShortTermHistoryLength"));
  v14[2] = *MEMORY[0x1E4F47A88];
  v15[2] = objc_msgSend(NSNumber, "numberWithInt:", +[GKSConnectivitySettings getLongTermHistoryLength](GKSConnectivitySettings, "getLongTermHistoryLength"));
  void v14[3] = *MEMORY[0x1E4F47A60];
  uint64_t v3 = NSNumber;
  +[GKSConnectivitySettings getAdaptiveLearningA];
  v15[3] = objc_msgSend(v3, "numberWithDouble:");
  void v14[4] = *MEMORY[0x1E4F47A70];
  uint64_t v4 = NSNumber;
  +[GKSConnectivitySettings getAdjustmentFactorA];
  v15[4] = objc_msgSend(v4, "numberWithDouble:");
  void v14[5] = *MEMORY[0x1E4F47AB0];
  uint64_t v5 = NSNumber;
  +[GKSConnectivitySettings getShortTermValueWeightA];
  v15[5] = objc_msgSend(v5, "numberWithDouble:");
  void v14[6] = *MEMORY[0x1E4F47A90];
  uint64_t v6 = NSNumber;
  +[GKSConnectivitySettings getLongTermValueWeightA];
  v15[6] = objc_msgSend(v6, "numberWithDouble:");
  v14[7] = *MEMORY[0x1E4F47A68];
  uint64_t v7 = NSNumber;
  +[GKSConnectivitySettings getAdaptiveLearningB];
  v15[7] = objc_msgSend(v7, "numberWithDouble:");
  v14[8] = *MEMORY[0x1E4F47A78];
  uint64_t v8 = NSNumber;
  +[GKSConnectivitySettings getAdjustmentFactorB];
  void v15[8] = objc_msgSend(v8, "numberWithDouble:");
  v14[9] = *MEMORY[0x1E4F47AB8];
  uint64_t v9 = NSNumber;
  +[GKSConnectivitySettings getShortTermValueWeightB];
  v15[9] = objc_msgSend(v9, "numberWithDouble:");
  v14[10] = *MEMORY[0x1E4F47A98];
  uint64_t v10 = NSNumber;
  +[GKSConnectivitySettings getLongTermValueWeightB];
  v15[10] = objc_msgSend(v10, "numberWithDouble:");
  v14[11] = *MEMORY[0x1E4F47A80];
  long long v11 = NSNumber;
  +[GKSConnectivitySettings getAdjustmentFactorC];
  v15[11] = objc_msgSend(v11, "numberWithDouble:");
  v14[12] = *MEMORY[0x1E4F47AC0];
  long long v12 = NSNumber;
  +[GKSConnectivitySettings getShortTermValueWeightC];
  v15[12] = objc_msgSend(v12, "numberWithDouble:");
  v14[13] = *MEMORY[0x1E4F47AA0];
  uint32_t v13 = NSNumber;
  +[GKSConnectivitySettings getLongTermValueWeightC];
  v15[13] = objc_msgSend(v13, "numberWithDouble:");
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:14];
  [(VCObject *)self reportingAgent];
  createAdaptiveLearningForAgent();
}

- (BOOL)negotiateOneToOneWithRemoteParticipant:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  int v4 = [(VCSessionParticipantLocal *)self->_localParticipant negotiateOneToOne:a3];
  if (v4 < 0)
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSession(OneToOne) negotiateOneToOneWithRemoteParticipant:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v40 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v40 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v41 = VRTraceErrorLogLevelToCSTR();
        int v42 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__int16 v43 = 136316162;
          *(void *)&v43[4] = v41;
          *(_WORD *)&v43[12] = 2080;
          *(void *)&v43[14] = "-[VCSession(OneToOne) negotiateOneToOneWithRemoteParticipant:]";
          *(_WORD *)&v43[22] = 1024;
          LODWORD(v44) = 765;
          WORD2(v44) = 2112;
          *(void *)((char *)&v44 + 6) = v40;
          HIWORD(v44) = 2048;
          uint64_t v45 = self;
          _os_log_error_impl(&dword_1E1EA4000, v42, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to negotiate one to one settings!", v43, 0x30u);
        }
      }
    }
    return v4 >= 0;
  }
  uint64_t v5 = [(VCSessionMediaNegotiator *)[(VCSessionParticipant *)self->_localParticipant mediaNegotiator] negotiatedVideoSettings];
  BOOL v6 = [(VCMediaNegotiatorResultsVideo *)v5 isSupported];
  uint64_t v7 = (VCSession *)objc_opt_class();
  if (!v6)
  {
    if (v7 != self)
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v9 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v9 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v19 = VRTraceErrorLogLevelToCSTR();
        __int16 v20 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int16 v43 = 136316162;
          *(void *)&v43[4] = v19;
          *(_WORD *)&v43[12] = 2080;
          *(void *)&v43[14] = "-[VCSession(OneToOne) negotiateOneToOneWithRemoteParticipant:]";
          *(_WORD *)&v43[22] = 1024;
          LODWORD(v44) = 772;
          WORD2(v44) = 2112;
          *(void *)((char *)&v44 + 6) = v9;
          HIWORD(v44) = 2048;
          uint64_t v45 = self;
          long long v12 = " [%s] %s:%d %@(%p) Negotiated 1:1 camera not supported";
          uint32_t v13 = v20;
          uint32_t v14 = 48;
          goto LABEL_23;
        }
      }
      goto LABEL_24;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_24;
    }
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    int v16 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    *(_DWORD *)__int16 v43 = 136315650;
    *(void *)&v43[4] = v15;
    *(_WORD *)&v43[12] = 2080;
    *(void *)&v43[14] = "-[VCSession(OneToOne) negotiateOneToOneWithRemoteParticipant:]";
    *(_WORD *)&v43[22] = 1024;
    LODWORD(v44) = 772;
    long long v12 = " [%s] %s:%d Negotiated 1:1 camera not supported";
    uint32_t v13 = v16;
    uint32_t v14 = 28;
LABEL_23:
    _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, v43, v14);
    goto LABEL_24;
  }
  if (v7 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_24;
    }
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    long long v11 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    *(_DWORD *)__int16 v43 = 136315906;
    *(void *)&v43[4] = v10;
    *(_WORD *)&v43[12] = 2080;
    *(void *)&v43[14] = "-[VCSession(OneToOne) negotiateOneToOneWithRemoteParticipant:]";
    *(_WORD *)&v43[22] = 1024;
    LODWORD(v44) = 770;
    WORD2(v44) = 2112;
    *(void *)((char *)&v44 + 6) = [(VCMediaNegotiatorResultsVideo *)v5 videoRuleCollections];
    long long v12 = " [%s] %s:%d Negotiated 1:1 camera rules: %@";
    uint32_t v13 = v11;
    uint32_t v14 = 38;
    goto LABEL_23;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v8 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
  }
  else {
    uint64_t v8 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v17 = VRTraceErrorLogLevelToCSTR();
    uint32_t v18 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v43 = 136316418;
      *(void *)&v43[4] = v17;
      *(_WORD *)&v43[12] = 2080;
      *(void *)&v43[14] = "-[VCSession(OneToOne) negotiateOneToOneWithRemoteParticipant:]";
      *(_WORD *)&v43[22] = 1024;
      LODWORD(v44) = 770;
      WORD2(v44) = 2112;
      *(void *)((char *)&v44 + 6) = v8;
      HIWORD(v44) = 2048;
      uint64_t v45 = self;
      LOWORD(v46) = 2112;
      *(void *)((char *)&v46 + 2) = [(VCMediaNegotiatorResultsVideo *)v5 videoRuleCollections];
      long long v12 = " [%s] %s:%d %@(%p) Negotiated 1:1 camera rules: %@";
      uint32_t v13 = v18;
      uint32_t v14 = 58;
      goto LABEL_23;
    }
  }
LABEL_24:
  int v21 = [(VCSessionMediaNegotiator *)[(VCSessionParticipant *)self->_localParticipant mediaNegotiator] negotiatedScreenSettings];
  BOOL v22 = [(VCMediaNegotiatorResultsVideo *)v21 isSupported];
  __int16 v23 = (VCSession *)objc_opt_class();
  if (!v22)
  {
    if (v23 != self)
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v25 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v25 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v37 = VRTraceErrorLogLevelToCSTR();
        __int16 v38 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int16 v43 = 136316162;
          *(void *)&v43[4] = v37;
          *(_WORD *)&v43[12] = 2080;
          *(void *)&v43[14] = "-[VCSession(OneToOne) negotiateOneToOneWithRemoteParticipant:]";
          *(_WORD *)&v43[22] = 1024;
          LODWORD(v44) = 779;
          WORD2(v44) = 2112;
          *(void *)((char *)&v44 + 6) = v25;
          HIWORD(v44) = 2048;
          uint64_t v45 = self;
          int v29 = " [%s] %s:%d %@(%p) Negotiated 1:1 screen not supported";
          __int16 v30 = v38;
          uint32_t v31 = 48;
          goto LABEL_45;
        }
      }
      return v4 >= 0;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return v4 >= 0;
    }
    uint64_t v32 = VRTraceErrorLogLevelToCSTR();
    __int16 v33 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return v4 >= 0;
    }
    *(_DWORD *)__int16 v43 = 136315650;
    *(void *)&v43[4] = v32;
    *(_WORD *)&v43[12] = 2080;
    *(void *)&v43[14] = "-[VCSession(OneToOne) negotiateOneToOneWithRemoteParticipant:]";
    *(_WORD *)&v43[22] = 1024;
    LODWORD(v44) = 779;
    int v29 = " [%s] %s:%d Negotiated 1:1 screen not supported";
    __int16 v30 = v33;
    uint32_t v31 = 28;
LABEL_45:
    _os_log_impl(&dword_1E1EA4000, v30, OS_LOG_TYPE_DEFAULT, v29, v43, v31);
    return v4 >= 0;
  }
  if (v23 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return v4 >= 0;
    }
    uint64_t v26 = VRTraceErrorLogLevelToCSTR();
    __int16 v27 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return v4 >= 0;
    }
    uint64_t v28 = [(VCMediaNegotiatorResultsVideo *)v21 videoRuleCollections];
    *(_DWORD *)__int16 v43 = 136315906;
    *(void *)&v43[4] = v26;
    *(_WORD *)&v43[12] = 2080;
    *(void *)&v43[14] = "-[VCSession(OneToOne) negotiateOneToOneWithRemoteParticipant:]";
    *(_WORD *)&v43[22] = 1024;
    LODWORD(v44) = 777;
    WORD2(v44) = 2112;
    *(void *)((char *)&v44 + 6) = v28;
    int v29 = " [%s] %s:%d Negotiated 1:1 screen rules: %@";
    __int16 v30 = v27;
    uint32_t v31 = 38;
    goto LABEL_45;
  }
  if (objc_opt_respondsToSelector()) {
    __int16 v24 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
  }
  else {
    __int16 v24 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v34 = VRTraceErrorLogLevelToCSTR();
    uint64_t v35 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v36 = [(VCMediaNegotiatorResultsVideo *)v21 videoRuleCollections];
      *(_DWORD *)__int16 v43 = 136316418;
      *(void *)&v43[4] = v34;
      *(_WORD *)&v43[12] = 2080;
      *(void *)&v43[14] = "-[VCSession(OneToOne) negotiateOneToOneWithRemoteParticipant:]";
      *(_WORD *)&v43[22] = 1024;
      LODWORD(v44) = 777;
      WORD2(v44) = 2112;
      *(void *)((char *)&v44 + 6) = v24;
      HIWORD(v44) = 2048;
      uint64_t v45 = self;
      LOWORD(v46) = 2112;
      *(void *)((char *)&v46 + 2) = v36;
      int v29 = " [%s] %s:%d %@(%p) Negotiated 1:1 screen rules: %@";
      __int16 v30 = v35;
      uint32_t v31 = 58;
      goto LABEL_45;
    }
  }
  return v4 >= 0;
}

- (void)configureOneToOneRateController:(id)a3
{
  BOOL v5 = [(VCSession *)self isOneToOneUsingVideo];
  BOOL v6 = [(VCSession *)self isOneToOneUsingScreen];

  [(VCSession *)self configureOneToOneRateController:a3 isUsingCamera:v5 isUsingScreen:v6];
}

- (void)configureOneToOneRateController:(id)a3 isUsingCamera:(BOOL)a4 isUsingScreen:(BOOL)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        return;
      }
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      int v21 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v31 = v20;
      __int16 v32 = 2080;
      __int16 v33 = "-[VCSession(OneToOne) configureOneToOneRateController:isUsingCamera:isUsingScreen:]";
      __int16 v34 = 1024;
      int v35 = 792;
      BOOL v22 = " [%s] %s:%d We cannot configure the OneToOne RateController as there is not an active connection yet";
      __int16 v23 = v21;
      uint32_t v24 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        long long v11 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
      }
      else {
        long long v11 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        return;
      }
      uint64_t v25 = VRTraceErrorLogLevelToCSTR();
      uint64_t v26 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v31 = v25;
      __int16 v32 = 2080;
      __int16 v33 = "-[VCSession(OneToOne) configureOneToOneRateController:isUsingCamera:isUsingScreen:]";
      __int16 v34 = 1024;
      int v35 = 792;
      __int16 v36 = 2112;
      uint64_t v37 = v11;
      __int16 v38 = 2048;
      uint64_t v39 = self;
      BOOL v22 = " [%s] %s:%d %@(%p) We cannot configure the OneToOne RateController as there is not an active connection yet";
      __int16 v23 = v26;
      uint32_t v24 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
    return;
  }
  BOOL v6 = a5;
  [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] updateNegotiatedSettingsOnetoOne:[(VCSessionMediaNegotiator *)[(VCSessionParticipant *)self->_localParticipant mediaNegotiator] negotiatedSettings]];
  [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] updateAllBitrateCapsForConnection:a3];
  uint64_t v9 = (const void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)[(VCTransportSession *)self->_transportSession connectionManager]);
  if (VCConnection_IsLocalOnWiFiOrWired((uint64_t)v9))
  {
    if ([(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] isDuplicationEnabled])
    {
      int v10 = 512;
    }
    else
    {
      int v10 = 0;
    }
  }
  else
  {
    int v10 = 0;
  }
  if (self->_isBytesInFlightAdaptationEnabled) {
    int v12 = v10 | 0x4000;
  }
  else {
    int v12 = v10;
  }
  if ([(VCSession *)self isUsingPersonaCamera]) {
    v12 |= 0x8000u;
  }
  if (v9) {
    CFRelease(v9);
  }
  unsigned int IsInterfaceOnCellularForActiveConnectionWithQuality = VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality((uint64_t)[(VCTransportSession *)self->_transportSession connectionManager], 1, 0);
  if (a4 || v6)
  {
    int v13 = v12;
    unsigned int v14 = [a3 uplinkBitrateCapOneToOne];
    uint64_t v15 = 1;
  }
  else
  {
    int v13 = v12;
    unsigned int v14 = [a3 uplinkAudioBitrateCapOneToOne];
    uint64_t v15 = 2;
  }
  rateController = self->_oneToOneSettings.rateController;
  uint64_t IsLocalOnCellular = VCConnection_IsLocalOnCellular((uint64_t)a3);
  uint64_t v18 = VCConnection_LocalCellTech((uint64_t)a3);
  HIDWORD(v27) = v13;
  LOBYTE(v27) = v6;
  -[AVCRateController configureWithOperatingMode:isLocalCellular:localCellTech:isRemoteCellular:remoteCellTech:bitrateCapKbps:isTrafficBursty:featureFlags:](rateController, "configureWithOperatingMode:isLocalCellular:localCellTech:isRemoteCellular:remoteCellTech:bitrateCapKbps:isTrafficBursty:featureFlags:", v15, IsLocalOnCellular, v18, IsInterfaceOnCellularForActiveConnectionWithQuality, VCConnection_RemoteCellTech((uint64_t)a3), v14 / 0x3E8uLL, v27);
  uint64_t v19 = self->_oneToOneSettings.rateController;
  if (!v19 || ([(AVCRateController *)v19 configuration], v29 != v15))
  {
    if ((self->_state | 2) == 3) {
      [(AVCRateController *)self->_oneToOneSettings.rateController start];
    }
  }
}

- (unsigned)vcrcServerBagProfileNumber
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([(VCSession *)self isOneToOneUsingVideo]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  int v4 = +[VCRateControlServerBag profileNumberKeyWithMode:v3];
  id v5 = +[GKSConnectivitySettings getVCRCSeverBagConfigWithKey:v4];
  if (!v5)
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return 0;
      }
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return 0;
      }
      int v15 = 136316162;
      uint64_t v16 = v8;
      __int16 v17 = 2080;
      uint64_t v18 = "-[VCSession(OneToOne) vcrcServerBagProfileNumber]";
      __int16 v19 = 1024;
      int v20 = 831;
      __int16 v21 = 2112;
      BOOL v22 = v4;
      __int16 v23 = 1024;
      LODWORD(v24) = 0;
      int v10 = " [%s] %s:%d Could not find server bag config for key=%@. Using default value=%d";
      long long v11 = v9;
      uint32_t v12 = 44;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v7 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return 0;
      }
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      unsigned int v14 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return 0;
      }
      int v15 = 136316674;
      uint64_t v16 = v13;
      __int16 v17 = 2080;
      uint64_t v18 = "-[VCSession(OneToOne) vcrcServerBagProfileNumber]";
      __int16 v19 = 1024;
      int v20 = 831;
      __int16 v21 = 2112;
      BOOL v22 = v7;
      __int16 v23 = 2048;
      uint32_t v24 = self;
      __int16 v25 = 2112;
      uint64_t v26 = v4;
      __int16 v27 = 1024;
      int v28 = 0;
      int v10 = " [%s] %s:%d %@(%p) Could not find server bag config for key=%@. Using default value=%d";
      long long v11 = v14;
      uint32_t v12 = 64;
    }
    _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v15, v12);
    return 0;
  }

  return [v5 unsignedIntValue];
}

- (BOOL)addOneToOneParticipant:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", 16, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession+OneToOne.m", 840), 0);
  if (![+[VCDefaults sharedInstance] supportsOneToOneMode])
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSession(OneToOne) addOneToOneParticipant:].cold.4();
        }
      }
      goto LABEL_73;
    }
    if (objc_opt_respondsToSelector()) {
      int v20 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      int v20 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_73;
    }
    uint64_t v24 = VRTraceErrorLogLevelToCSTR();
    __int16 v25 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_73;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v32 = v24;
    __int16 v33 = 2080;
    __int16 v34 = "-[VCSession(OneToOne) addOneToOneParticipant:]";
    __int16 v35 = 1024;
    int v36 = 841;
    __int16 v37 = 2112;
    __int16 v38 = v20;
    __int16 v39 = 2048;
    uint64_t v40 = self;
    uint64_t v26 = " [%s] %s:%d %@(%p) Trying to add a oneToOne participant even though we do not support OneToOne mode";
    goto LABEL_72;
  }
  if ([(NSArray *)[(VCSession *)self remoteParticipants] count])
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      {
LABEL_25:
        int v13 = 0;
        goto LABEL_26;
      }
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint32_t v12 = *MEMORY[0x1E4F47A50];
      int v13 = 0;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v32 = v11;
        __int16 v33 = 2080;
        __int16 v34 = "-[VCSession(OneToOne) addOneToOneParticipant:]";
        __int16 v35 = 1024;
        int v36 = 844;
        unsigned int v14 = " [%s] %s:%d Attempting to add another participant while in 1:1 mode!";
        int v15 = v12;
        uint32_t v16 = 28;
LABEL_24:
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
        goto LABEL_25;
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        BOOL v6 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
      }
      else {
        BOOL v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_25;
      }
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      uint64_t v18 = *MEMORY[0x1E4F47A50];
      int v13 = 0;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v32 = v17;
        __int16 v33 = 2080;
        __int16 v34 = "-[VCSession(OneToOne) addOneToOneParticipant:]";
        __int16 v35 = 1024;
        int v36 = 844;
        __int16 v37 = 2112;
        __int16 v38 = v6;
        __int16 v39 = 2048;
        uint64_t v40 = self;
        unsigned int v14 = " [%s] %s:%d %@(%p) Attempting to add another participant while in 1:1 mode!";
        int v15 = v18;
        uint32_t v16 = 48;
        goto LABEL_24;
      }
    }
LABEL_26:
    notificationQueue = self->_notificationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__VCSession_OneToOne__addOneToOneParticipant___block_invoke;
    block[3] = &unk_1E6DB43D8;
    block[4] = self;
    void block[5] = a3;
    void block[6] = v5;
    dispatch_async(notificationQueue, block);
    if (v13) {
      [(VCSession *)self dispatchedStopWithError:v5];
    }
    return 0;
  }
  if (![(VCSession *)self negotiateOneToOneWithRemoteParticipant:a3])
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSession(OneToOne) addOneToOneParticipant:]();
        }
      }
      goto LABEL_73;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v21 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v21 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_73;
    }
    uint64_t v27 = VRTraceErrorLogLevelToCSTR();
    __int16 v25 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_73;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v32 = v27;
    __int16 v33 = 2080;
    __int16 v34 = "-[VCSession(OneToOne) addOneToOneParticipant:]";
    __int16 v35 = 1024;
    int v36 = 846;
    __int16 v37 = 2112;
    __int16 v38 = v21;
    __int16 v39 = 2048;
    uint64_t v40 = self;
    uint64_t v26 = " [%s] %s:%d %@(%p) Failed to negotiate with the remoteParticipant";
    goto LABEL_72;
  }
  if (![(VCSession *)self configureRemoteParticipantForOneToOne:a3])
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSession(OneToOne) addOneToOneParticipant:]();
        }
      }
      goto LABEL_73;
    }
    if (objc_opt_respondsToSelector()) {
      BOOL v22 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      BOOL v22 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_73;
    }
    uint64_t v28 = VRTraceErrorLogLevelToCSTR();
    __int16 v25 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_73;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v32 = v28;
    __int16 v33 = 2080;
    __int16 v34 = "-[VCSession(OneToOne) addOneToOneParticipant:]";
    __int16 v35 = 1024;
    int v36 = 847;
    __int16 v37 = 2112;
    __int16 v38 = v22;
    __int16 v39 = 2048;
    uint64_t v40 = self;
    uint64_t v26 = " [%s] %s:%d %@(%p) Failed to configure the remoteParticipant for OneToOne";
LABEL_72:
    _os_log_error_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_ERROR, v26, buf, 0x30u);
    goto LABEL_73;
  }
  if ((self->_state | 2) == 3)
  {
    [(VCSessionParticipantLocal *)self->_localParticipant suspendStreamsOnOneToOneModeSwitch];
    uint64_t vcMediaQueue = self->_oneToOneSettings.vcMediaQueue;
    if (vcMediaQueue) {
      VCMediaQueue_FlushAllPackets((uint64_t)vcMediaQueue);
    }
  }
  if (![(VCSession *)self configureLocalParticipantWithOneToOneRemoteParticipant:a3 isInitialConfiguration:1])
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSession(OneToOne) addOneToOneParticipant:]();
        }
      }
      goto LABEL_73;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v23 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v23 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v29 = VRTraceErrorLogLevelToCSTR();
      __int16 v25 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v32 = v29;
        __int16 v33 = 2080;
        __int16 v34 = "-[VCSession(OneToOne) addOneToOneParticipant:]";
        __int16 v35 = 1024;
        int v36 = 855;
        __int16 v37 = 2112;
        __int16 v38 = v23;
        __int16 v39 = 2048;
        uint64_t v40 = self;
        uint64_t v26 = " [%s] %s:%d %@(%p) Failed to setup the remote participant in OneToOneMode";
        goto LABEL_72;
      }
    }
LABEL_73:
    int v13 = 1;
    goto LABEL_26;
  }
  [(NSMutableArray *)self->_initializingParticipants addObject:a3];
  unsigned int state = self->_state;
  if (state == 1)
  {
    [(NSMutableArray *)self->_startingParticipants addObject:a3];
    unsigned int state = self->_state;
  }
  BOOL result = 1;
  if ((state | 2) == 3)
  {
    self->_isOneToOneInitiator = 1;
    [(VCTransportSession *)self->_transportSession setOneToOneModeEnabled:1 isInitiator:1];
    [(VCSession *)self startOneToOne];
    localParticipant = self->_localParticipant;
    if (self->_state == 1) {
      [(VCSessionParticipantLocal *)localParticipant start];
    }
    else {
      [(VCSessionParticipantLocal *)localParticipant resumeStreamsOnOneToOneModeSwitch];
    }
    return 1;
  }
  return result;
}

uint64_t __46__VCSession_OneToOne__addOneToOneParticipant___block_invoke(uint64_t a1)
{
  BOOL v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) uuid];
  uint64_t v5 = *(void *)(a1 + 48);

  return [v2 vcSession:v3 addParticipantWithID:v4 didSucceed:0 error:v5];
}

- (BOOL)shouldSendControlChannelMessages
{
  return (self->_state & 0xFFFFFFFD) == 1;
}

- (BOOL)completeTransitionToOneToOneEnabled:(BOOL)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (self->_oneToOneModeEnabled == a3)
  {
    LOBYTE(v3) = 1;
    return v3;
  }
  BOOL v4 = a3;
  if (self->_oneToOneModeEnabled)
  {
    if ([(VCSession *)self switchFromOneToOneToMultiway])
    {
LABEL_5:
      [(VCTransportSession *)self->_transportSession resetActiveConnection];
      BOOL v3 = 1;
      goto LABEL_8;
    }
  }
  else if ([(VCSession *)self switchFromMultiwayToOneToOne])
  {
    goto LABEL_5;
  }
  BOOL v3 = 0;
LABEL_8:
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = "Failed";
        int v17 = 136316162;
        uint64_t v18 = v7;
        __int16 v19 = 2080;
        int v20 = "-[VCSession(OneToOne) completeTransitionToOneToOneEnabled:]";
        if (v3) {
          uint64_t v9 = "Successfully completed";
        }
        __int16 v21 = 1024;
        int v22 = 904;
        __int16 v23 = 2080;
        uint64_t v24 = (void *)v9;
        __int16 v25 = 1024;
        LODWORD(v26) = v4;
        int v10 = " [%s] %s:%d %s transition to oneToOneModeEnabled=%d";
        uint64_t v11 = v8;
        uint32_t v12 = 44;
        goto LABEL_22;
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      BOOL v6 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      BOOL v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      unsigned int v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v15 = "Failed";
        int v17 = 136316674;
        uint64_t v18 = v13;
        __int16 v19 = 2080;
        int v20 = "-[VCSession(OneToOne) completeTransitionToOneToOneEnabled:]";
        if (v3) {
          int v15 = "Successfully completed";
        }
        __int16 v21 = 1024;
        int v22 = 904;
        __int16 v23 = 2112;
        uint64_t v24 = v6;
        __int16 v25 = 2048;
        uint64_t v26 = self;
        __int16 v27 = 2080;
        uint64_t v28 = v15;
        __int16 v29 = 1024;
        BOOL v30 = v4;
        int v10 = " [%s] %s:%d %@(%p) %s transition to oneToOneModeEnabled=%d";
        uint64_t v11 = v14;
        uint32_t v12 = 64;
LABEL_22:
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v17, v12);
      }
    }
  }
  return v3;
}

- (void)completionHandlerOneToOneEnabled:(BOOL)a3 didSucceed:(BOOL)a4 configurationDict:(id)a5
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  sessionQueue = self->_sessionQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85__VCSession_OneToOne__completionHandlerOneToOneEnabled_didSucceed_configurationDict___block_invoke;
  void v6[3] = &unk_1E6DB66B8;
  BOOL v7 = a4;
  BOOL v8 = a3;
  v6[4] = self;
  void v6[5] = a5;
  dispatch_async(sessionQueue, v6);
}

void __85__VCSession_OneToOne__completionHandlerOneToOneEnabled_didSucceed_configurationDict___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(a1 + 48);
  BOOL v3 = *(void **)(a1 + 32);
  if (!v2)
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __85__VCSession_OneToOne__completionHandlerOneToOneEnabled_didSucceed_configurationDict___block_invoke_cold_1();
        }
      }
      goto LABEL_24;
    }
    if (objc_opt_respondsToSelector()) {
      BOOL v8 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      BOOL v8 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_24;
    }
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint64_t v11 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    uint64_t v12 = *(void *)(a1 + 32);
    int v13 = *(unsigned __int8 *)(a1 + 49);
    *(_DWORD *)buf = 136316418;
    uint64_t v24 = v10;
    __int16 v25 = 2080;
    uint64_t v26 = "-[VCSession(OneToOne) completionHandlerOneToOneEnabled:didSucceed:configurationDict:]_block_invoke";
    __int16 v27 = 1024;
    int v28 = 911;
    __int16 v29 = 2112;
    BOOL v30 = v8;
    __int16 v31 = 2048;
    uint64_t v32 = v12;
    __int16 v33 = 1024;
    int v34 = v13;
    unsigned int v14 = " [%s] %s:%d %@(%p) Failed to send oneToOneModeEnabled=%d message";
    goto LABEL_26;
  }
  if (([v3 completeTransitionToOneToOneEnabled:*(unsigned __int8 *)(a1 + 49)] & 1) == 0)
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __85__VCSession_OneToOne__completionHandlerOneToOneEnabled_didSucceed_configurationDict___block_invoke_cold_2();
        }
      }
      goto LABEL_24;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v9 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      uint64_t v9 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (uint64_t v15 = VRTraceErrorLogLevelToCSTR(),
          uint64_t v11 = *MEMORY[0x1E4F47A50],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
LABEL_24:
      char v4 = 0;
      goto LABEL_4;
    }
    uint64_t v16 = *(void *)(a1 + 32);
    int v17 = *(unsigned __int8 *)(a1 + 49);
    *(_DWORD *)buf = 136316418;
    uint64_t v24 = v15;
    __int16 v25 = 2080;
    uint64_t v26 = "-[VCSession(OneToOne) completionHandlerOneToOneEnabled:didSucceed:configurationDict:]_block_invoke";
    __int16 v27 = 1024;
    int v28 = 914;
    __int16 v29 = 2112;
    BOOL v30 = v9;
    __int16 v31 = 2048;
    uint64_t v32 = v16;
    __int16 v33 = 1024;
    int v34 = v17;
    unsigned int v14 = " [%s] %s:%d %@(%p) Failed to complete transition to oneToOneModeEnabled=%d";
LABEL_26:
    _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, v14, buf, 0x36u);
    goto LABEL_24;
  }
  char v4 = 1;
LABEL_4:
  char v5 = *(unsigned char *)(a1 + 49);
  long long v6 = *(_OWORD *)(a1 + 32);
  BOOL v7 = *(NSObject **)(*(void *)(a1 + 32) + 184);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__VCSession_OneToOne__completionHandlerOneToOneEnabled_didSucceed_configurationDict___block_invoke_70;
  block[3] = &unk_1E6DB94D8;
  char v20 = v4;
  char v21 = v5;
  long long v19 = v6;
  char v22 = *(unsigned char *)(a1 + 48);
  dispatch_async(v7, block);
}

uint64_t __85__VCSession_OneToOne__completionHandlerOneToOneEnabled_didSucceed_configurationDict___block_invoke_70(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    id v2 = 0;
  }
  else
  {
    if (*(unsigned char *)(a1 + 49)) {
      uint64_t v3 = 20;
    }
    else {
      uint64_t v3 = 19;
    }
    id v2 = +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", v3, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession+OneToOne.m", 920), 0);
    [*(id *)(a1 + 32) reportSwitchingError:*(unsigned __int8 *)(a1 + 49) errorEvent:v3];
  }
  if (*(void *)(a1 + 40)) {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSession:updateConfiguration:didSucceed:error:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 50), v2);
  }
  char v4 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 49);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 48);

  return [v4 vcSession:v5 oneToOneModeEnabled:v6 didSucceed:v7 error:v2];
}

- (void)dispatchedSetOneToOneModeEnabled:(BOOL)a3 isLocal:(BOOL)a4 configurationDict:(id)a5
{
  BOOL v6 = a3;
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  if (self->_oneToOneModeEnabled == a3) {
    goto LABEL_56;
  }
  BOOL v8 = a4;
  uint64_t v9 = [(VCSession *)self oneToOneRemoteParticipant];
  uint64_t v10 = v9;
  if (v9)
  {
    [(VCSessionParticipantRemote *)v9 capabilities];
    uint64_t v12 = HIDWORD(v11) & 1;
  }
  else
  {
    LODWORD(v12) = 1;
  }
  if (v6)
  {
    char v13 = self->_switchFromGFTToOneToOneEnabled ? v12 : 0;
    if ((v13 & 1) == 0)
    {
      if ((VCSession *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
          goto LABEL_31;
        }
        uint64_t v43 = VRTraceErrorLogLevelToCSTR();
        long long v44 = *MEMORY[0x1E4F47A50];
        BOOL v45 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
        char v31 = 0;
        if (!v45) {
          goto LABEL_57;
        }
        BOOL switchFromGFTToOneToOneEnabled = self->_switchFromGFTToOneToOneEnabled;
        *(_DWORD *)buf = 136316162;
        uint64_t v69 = v43;
        __int16 v70 = 2080;
        v71 = "-[VCSession(OneToOne) dispatchedSetOneToOneModeEnabled:isLocal:configurationDict:]";
        __int16 v72 = 1024;
        int v73 = 941;
        __int16 v74 = 1024;
        *(_DWORD *)uint64_t v75 = switchFromGFTToOneToOneEnabled;
        *(_WORD *)&v75[4] = 1024;
        *(_DWORD *)&v75[6] = v12;
        uint64_t v47 = " [%s] %s:%d Switching from multiway to OneToOne enabled is not supported. switchFromGFTToOneToOneEnabled=%"
              "d remoteSupportsGFTSwitchToOneToOne=%d ";
        __int16 v48 = v44;
        uint32_t v49 = 40;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v41 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
        }
        else {
          uint64_t v41 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
          goto LABEL_31;
        }
        uint64_t v50 = VRTraceErrorLogLevelToCSTR();
        int v51 = *MEMORY[0x1E4F47A50];
        BOOL v52 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
        char v31 = 0;
        if (!v52) {
          goto LABEL_57;
        }
        BOOL v53 = self->_switchFromGFTToOneToOneEnabled;
        *(_DWORD *)buf = 136316674;
        uint64_t v69 = v50;
        __int16 v70 = 2080;
        v71 = "-[VCSession(OneToOne) dispatchedSetOneToOneModeEnabled:isLocal:configurationDict:]";
        __int16 v72 = 1024;
        int v73 = 941;
        __int16 v74 = 2112;
        *(void *)uint64_t v75 = v41;
        *(_WORD *)&v75[8] = 2048;
        *(void *)uint64_t v76 = self;
        *(_WORD *)&v76[8] = 1024;
        BOOL v77 = v53;
        __int16 v78 = 1024;
        int v79 = v12;
        uint64_t v47 = " [%s] %s:%d %@(%p) Switching from multiway to OneToOne enabled is not supported. switchFromGFTToOneToOneEn"
              "abled=%d remoteSupportsGFTSwitchToOneToOne=%d ";
        __int16 v48 = v51;
        uint32_t v49 = 60;
      }
      _os_log_impl(&dword_1E1EA4000, v48, OS_LOG_TYPE_DEFAULT, v47, buf, v49);
      goto LABEL_31;
    }
  }
  NSUInteger v14 = [(NSArray *)[(VCSession *)self remoteParticipants] count];
  if (v6)
  {
    NSUInteger v15 = v14;
    if (v14 >= 2)
    {
      [(VCObject *)self reportingAgent];
      reportingSymptom();
      if ((VCSession *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          uint64_t v18 = VRTraceErrorLogLevelToCSTR();
          long long v19 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316418;
            uint64_t v69 = v18;
            __int16 v70 = 2080;
            v71 = "-[VCSession(OneToOne) dispatchedSetOneToOneModeEnabled:isLocal:configurationDict:]";
            __int16 v72 = 1024;
            int v73 = 951;
            __int16 v74 = 1024;
            *(_DWORD *)uint64_t v75 = 0;
            *(_WORD *)&v75[4] = 1024;
            *(_DWORD *)&v75[6] = v6;
            *(_WORD *)uint64_t v76 = 2048;
            *(void *)&v76[2] = v15;
            char v20 = " [%s] %s:%d Switch to U+1 requested at improper time - canSwitch=%{BOOL}d, oneToOneModeEnabled=%{BOOL}"
                  "d, remoteParticipantCount=%lu";
            char v21 = v19;
            uint32_t v22 = 50;
            goto LABEL_28;
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v16 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
        }
        else {
          uint64_t v16 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          uint64_t v29 = VRTraceErrorLogLevelToCSTR();
          BOOL v30 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316930;
            uint64_t v69 = v29;
            __int16 v70 = 2080;
            v71 = "-[VCSession(OneToOne) dispatchedSetOneToOneModeEnabled:isLocal:configurationDict:]";
            __int16 v72 = 1024;
            int v73 = 951;
            __int16 v74 = 2112;
            *(void *)uint64_t v75 = v16;
            *(_WORD *)&v75[8] = 2048;
            *(void *)uint64_t v76 = self;
            *(_WORD *)&v76[8] = 1024;
            BOOL v77 = 0;
            __int16 v78 = 1024;
            int v79 = v6;
            __int16 v80 = 2048;
            NSUInteger v81 = v15;
            char v20 = " [%s] %s:%d %@(%p) Switch to U+1 requested at improper time - canSwitch=%{BOOL}d, oneToOneModeEnabled="
                  "%{BOOL}d, remoteParticipantCount=%lu";
            char v21 = v30;
            uint32_t v22 = 70;
LABEL_28:
            _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
            char v31 = 0;
            if (!v8) {
              return;
            }
            goto LABEL_57;
          }
        }
      }
      if (!v8) {
        return;
      }
      goto LABEL_31;
    }
  }
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v23 = VRTraceErrorLogLevelToCSTR();
      uint64_t v24 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL oneToOneModeEnabled = self->_oneToOneModeEnabled;
        *(_DWORD *)buf = 136316418;
        uint64_t v69 = v23;
        __int16 v70 = 2080;
        v71 = "-[VCSession(OneToOne) dispatchedSetOneToOneModeEnabled:isLocal:configurationDict:]";
        __int16 v72 = 1024;
        int v73 = 954;
        __int16 v74 = 1024;
        *(_DWORD *)uint64_t v75 = oneToOneModeEnabled;
        *(_WORD *)&v75[4] = 1024;
        *(_DWORD *)&v75[6] = v6;
        *(_WORD *)uint64_t v76 = 1024;
        *(_DWORD *)&v76[2] = v8;
        uint64_t v26 = " [%s] %s:%d Starting Switch _oneToOneModeEnabled=%d to oneToOneEnabled=%d isLocal=%d";
        __int16 v27 = v24;
        uint32_t v28 = 46;
LABEL_36:
        _os_log_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      int v17 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      int v17 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v32 = VRTraceErrorLogLevelToCSTR();
      __int16 v33 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL v34 = self->_oneToOneModeEnabled;
        *(_DWORD *)buf = 136316930;
        uint64_t v69 = v32;
        __int16 v70 = 2080;
        v71 = "-[VCSession(OneToOne) dispatchedSetOneToOneModeEnabled:isLocal:configurationDict:]";
        __int16 v72 = 1024;
        int v73 = 954;
        __int16 v74 = 2112;
        *(void *)uint64_t v75 = v17;
        *(_WORD *)&v75[8] = 2048;
        *(void *)uint64_t v76 = self;
        *(_WORD *)&v76[8] = 1024;
        BOOL v77 = v34;
        __int16 v78 = 1024;
        int v79 = v6;
        __int16 v80 = 1024;
        LODWORD(v81) = v8;
        uint64_t v26 = " [%s] %s:%d %@(%p) Starting Switch _oneToOneModeEnabled=%d to oneToOneEnabled=%d isLocal=%d";
        __int16 v27 = v33;
        uint32_t v28 = 66;
        goto LABEL_36;
      }
    }
  }
  if (v6
    && [(NSString *)[(VCSessionParticipant *)self->_localParticipant uuid] compare:[(VCSessionParticipant *)[(VCSession *)self oneToOneRemoteParticipant] uuid]] == NSOrderedDescending)
  {
    self->_isOneToOneInitiator = 1;
  }
  if (v8) {
    self->_double oneToOneSwitchStartTime = micro();
  }
  if ([(VCSession *)self isOneToOneUsingScreen]
    || [(VCSession *)self isOneToOneRemoteParticipantUsingScreen])
  {
    [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] setIsOneToOneScreenEnabled:1];
  }
  if (!v10 || !v8 || ![(VCSession *)self shouldSendControlChannelMessages])
  {
    if (![(VCSession *)self completeTransitionToOneToOneEnabled:v6])
    {
      if ((VCSession *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_31;
        }
        uint64_t v54 = VRTraceErrorLogLevelToCSTR();
        __int16 v55 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          goto LABEL_31;
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v69 = v54;
        __int16 v70 = 2080;
        v71 = "-[VCSession(OneToOne) dispatchedSetOneToOneModeEnabled:isLocal:configurationDict:]";
        __int16 v72 = 1024;
        int v73 = 978;
        __int16 v74 = 1024;
        *(_DWORD *)uint64_t v75 = v6;
        *(_WORD *)&v75[4] = 1024;
        *(_DWORD *)&v75[6] = v8;
        long long v56 = " [%s] %s:%d Failed to complete the switch to oneToOneEnabled=%d isLocal=%d";
        __int16 v57 = v55;
        uint32_t v58 = 40;
        goto LABEL_88;
      }
      if (objc_opt_respondsToSelector()) {
        int v42 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
      }
      else {
        int v42 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_31;
      }
      uint64_t v59 = VRTraceErrorLogLevelToCSTR();
      __int16 v60 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_31;
      }
      *(_DWORD *)buf = 136316674;
      uint64_t v69 = v59;
      __int16 v70 = 2080;
      v71 = "-[VCSession(OneToOne) dispatchedSetOneToOneModeEnabled:isLocal:configurationDict:]";
      __int16 v72 = 1024;
      int v73 = 978;
      __int16 v74 = 2112;
      *(void *)uint64_t v75 = v42;
      *(_WORD *)&v75[8] = 2048;
      *(void *)uint64_t v76 = self;
      *(_WORD *)&v76[8] = 1024;
      BOOL v77 = v6;
      __int16 v78 = 1024;
      int v79 = v8;
      long long v56 = " [%s] %s:%d %@(%p) Failed to complete the switch to oneToOneEnabled=%d isLocal=%d";
      __int16 v57 = v60;
LABEL_87:
      uint32_t v58 = 60;
LABEL_88:
      _os_log_error_impl(&dword_1E1EA4000, v57, OS_LOG_TYPE_ERROR, v56, buf, v58);
      goto LABEL_31;
    }
LABEL_56:
    char v31 = 1;
    goto LABEL_57;
  }
  uint64_t v35 = objc_alloc_init(VCControlChannelMessageOptions);
  [(VCControlChannelMessageOptions *)v35 setDuplicateMessageOnServerLink:1];
  if (v6) {
    int v36 = @"VCSessionMessageOneToOneEnabled";
  }
  else {
    int v36 = @"VCSessionMessageOneToOneDisabled";
  }
  sessionMessaging = self->_sessionMessaging;
  uint64_t v38 = [(VCSessionParticipant *)v10 idsParticipantID];
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __82__VCSession_OneToOne__dispatchedSetOneToOneModeEnabled_isLocal_configurationDict___block_invoke;
  v66[3] = &unk_1E6DB9500;
  BOOL v67 = v6;
  v66[4] = self;
  v66[5] = a5;
  if (![(VCSessionMessaging *)sessionMessaging sendReliableMessage:v36 withTopic:@"VCSessionMessageTopicOneToOneEnabledState" participantID:v38 withOptions:v35 completion:v66])
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSession(OneToOne) dispatchedSetOneToOneModeEnabled:isLocal:configurationDict:]();
        }
      }
      goto LABEL_31;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v39 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v39 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v61 = VRTraceErrorLogLevelToCSTR();
      long long v62 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316674;
        uint64_t v69 = v61;
        __int16 v70 = 2080;
        v71 = "-[VCSession(OneToOne) dispatchedSetOneToOneModeEnabled:isLocal:configurationDict:]";
        __int16 v72 = 1024;
        int v73 = 975;
        __int16 v74 = 2112;
        *(void *)uint64_t v75 = v39;
        *(_WORD *)&v75[8] = 2048;
        *(void *)uint64_t v76 = self;
        *(_WORD *)&v76[8] = 1024;
        BOOL v77 = v6;
        __int16 v78 = 1024;
        int v79 = 1;
        long long v56 = " [%s] %s:%d %@(%p) Failed to send the oneToOneEnabledState message oneToOneEnabled=%d isLocal=%d";
        __int16 v57 = v62;
        goto LABEL_87;
      }
    }
LABEL_31:
    char v31 = 0;
LABEL_57:
    notificationQueue = self->_notificationQueue;
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __82__VCSession_OneToOne__dispatchedSetOneToOneModeEnabled_isLocal_configurationDict___block_invoke_82;
    v63[3] = &unk_1E6DB66B8;
    char v64 = v31;
    BOOL v65 = v6;
    v63[4] = self;
    v63[5] = a5;
    dispatch_async(notificationQueue, v63);
  }
}

uint64_t __82__VCSession_OneToOne__dispatchedSetOneToOneModeEnabled_isLocal_configurationDict___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completionHandlerOneToOneEnabled:*(unsigned __int8 *)(a1 + 48) didSucceed:a2 configurationDict:*(void *)(a1 + 40)];
}

uint64_t __82__VCSession_OneToOne__dispatchedSetOneToOneModeEnabled_isLocal_configurationDict___block_invoke_82(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    id v2 = 0;
  }
  else
  {
    if (*(unsigned char *)(a1 + 49)) {
      uint64_t v3 = 20;
    }
    else {
      uint64_t v3 = 19;
    }
    id v2 = +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", v3, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession+OneToOne.m", 986), 0);
    [*(id *)(a1 + 32) reportSwitchingError:*(unsigned __int8 *)(a1 + 49) errorEvent:v3];
  }
  if (*(void *)(a1 + 40)) {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSession:updateConfiguration:didSucceed:error:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), v2);
  }
  char v4 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 49);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 48);

  return [v4 vcSession:v5 oneToOneModeEnabled:v6 didSucceed:v7 error:v2];
}

- (void)applyNegotiatedOneToOneFaceTimeSettings
{
  localParticipant = self->_localParticipant;
  if (localParticipant)
  {
    [(VCSessionParticipantLocal *)localParticipant oneToOneSettings];
    char v4 = (void *)*((void *)&v6 + 1);
    localParticipant = self->_localParticipant;
  }
  else
  {
    char v4 = 0;
    long long v6 = 0u;
    long long v7 = 0u;
    long long v5 = 0u;
  }
  objc_msgSend(v4, "setRemoteSwitches:isCaller:", -[VCMediaNegotiatorResultsFaceTimeSettings faceTimeSwitches](-[VCSessionMediaNegotiator negotiatedFaceTimeSettings](-[VCSessionParticipant mediaNegotiator](localParticipant, "mediaNegotiator", v5, v6, v7), "negotiatedFaceTimeSettings"), "faceTimeSwitches"), self->_isOneToOneInitiator);
  [v4 negotiateSwitchesForIsCaller:self->_isOneToOneInitiator];
  [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] setRemoteLinkProbingCapabilityVersion:[(VCMediaNegotiatorResultsFaceTimeSettings *)[(VCSessionMediaNegotiator *)[(VCSessionParticipant *)self->_localParticipant mediaNegotiator] negotiatedFaceTimeSettings] remoteLinkProbingCapabilityVersion]];
}

- (void)setupOneToOneABTesting
{
  uint64_t v137 = *MEMORY[0x1E4F143B8];
  [(VCSession *)self applyNegotiatedOneToOneFaceTimeSettings];
  localParticipant = self->_localParticipant;
  if (localParticipant)
  {
    [(VCSessionParticipantLocal *)localParticipant oneToOneSettings];
    char v4 = (void *)*((void *)&v123 + 1);
  }
  else
  {
    char v4 = 0;
    long long v123 = 0u;
    long long v124 = 0u;
    long long v122 = 0u;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    __str = 0;
    long long v5 = v4 ? (const char *)objc_msgSend((id)objc_msgSend(v4, "description"), "UTF8String") : "<nil>";
    asprintf(&__str, "A/B testing: %s", v5);
    if (__str)
    {
      v119 = v4;
      __lasts = 0;
      long long v6 = strtok_r(__str, "\n", &__lasts);
      long long v7 = (os_log_t *)MEMORY[0x1E4F47A50];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v8 = VRTraceErrorLogLevelToCSTR();
          uint64_t v9 = *v7;
          if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v126 = v8;
            __int16 v127 = 2080;
            v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
            __int16 v129 = 1024;
            int v130 = 1007;
            __int16 v131 = 2080;
            v132 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
            __int16 v133 = 2080;
            v134 = (VCSession *)v6;
            _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        long long v6 = strtok_r(0, "\n", &__lasts);
      }
      while (v6);
      free(__str);
      char v4 = v119;
    }
  }
  [v4 negotiatedSwitches];
  [v4 remoteSwitches];
  [(VCMediaNegotiatorResultsFaceTimeSettings *)[(VCSessionMediaNegotiator *)[(VCSessionParticipant *)self->_localParticipant mediaNegotiator] negotiatedFaceTimeSettings] remoteFaceTimeSwitchesAvailable];
  [(VCSession *)self vcrcServerBagProfileNumber];
  [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] primaryConnHealthAllowedDelay];
  reportingConnecting();
  unsigned int v10 = [v4 isSwitchEnabled:0x10000];
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      char v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v126 = v12;
        __int16 v127 = 2080;
        v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
        __int16 v129 = 1024;
        int v130 = 1013;
        __int16 v131 = 1024;
        LODWORD(v132) = v10;
        NSUInteger v14 = " [%s] %s:%d Load switch iRATMetricsEnabled %d";
        NSUInteger v15 = v13;
        uint32_t v16 = 34;
LABEL_25:
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      unint64_t v11 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      unint64_t v11 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      uint64_t v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v126 = v17;
        __int16 v127 = 2080;
        v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
        __int16 v129 = 1024;
        int v130 = 1013;
        __int16 v131 = 2112;
        v132 = (const char *)v11;
        __int16 v133 = 2048;
        v134 = self;
        __int16 v135 = 1024;
        int v136 = v10;
        NSUInteger v14 = " [%s] %s:%d %@(%p) Load switch iRATMetricsEnabled %d";
        NSUInteger v15 = v18;
        uint32_t v16 = 54;
        goto LABEL_25;
      }
    }
  }
  int v19 = [v4 isSwitchEnabled:128];
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      uint32_t v22 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v126 = v21;
        __int16 v127 = 2080;
        v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
        __int16 v129 = 1024;
        int v130 = 1015;
        __int16 v131 = 1024;
        LODWORD(v132) = v19;
        uint64_t v23 = " [%s] %s:%d Load switch iRATRtpEnabled %d";
        uint64_t v24 = v22;
        uint32_t v25 = 34;
LABEL_36:
        _os_log_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      char v20 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      char v20 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v26 = VRTraceErrorLogLevelToCSTR();
      __int16 v27 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v126 = v26;
        __int16 v127 = 2080;
        v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
        __int16 v129 = 1024;
        int v130 = 1015;
        __int16 v131 = 2112;
        v132 = (const char *)v20;
        __int16 v133 = 2048;
        v134 = self;
        __int16 v135 = 1024;
        int v136 = v19;
        uint64_t v23 = " [%s] %s:%d %@(%p) Load switch iRATRtpEnabled %d";
        uint64_t v24 = v27;
        uint32_t v25 = 54;
        goto LABEL_36;
      }
    }
  }
  int v28 = [v4 isSwitchEnabled:256];
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v30 = VRTraceErrorLogLevelToCSTR();
      char v31 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v126 = v30;
        __int16 v127 = 2080;
        v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
        __int16 v129 = 1024;
        int v130 = 1017;
        __int16 v131 = 1024;
        LODWORD(v132) = v28;
        uint64_t v32 = " [%s] %s:%d Load switch preWarmCellEnabled %d";
        __int16 v33 = v31;
        uint32_t v34 = 34;
LABEL_47:
        _os_log_impl(&dword_1E1EA4000, v33, OS_LOG_TYPE_DEFAULT, v32, buf, v34);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v29 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v29 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v35 = VRTraceErrorLogLevelToCSTR();
      int v36 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v126 = v35;
        __int16 v127 = 2080;
        v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
        __int16 v129 = 1024;
        int v130 = 1017;
        __int16 v131 = 2112;
        v132 = (const char *)v29;
        __int16 v133 = 2048;
        v134 = self;
        __int16 v135 = 1024;
        int v136 = v28;
        uint64_t v32 = " [%s] %s:%d %@(%p) Load switch preWarmCellEnabled %d";
        __int16 v33 = v36;
        uint32_t v34 = 54;
        goto LABEL_47;
      }
    }
  }
  uint64_t v37 = 0x10000;
  if (!v28) {
    uint64_t v37 = 0;
  }
  uint64_t v38 = 256;
  if (!v19) {
    uint64_t v38 = 0;
  }
  [(VCNetworkFeedbackController *)self->_feedbackController updateMetricsConfig:v38 | v10 | v37];
  uint64_t v39 = [v4 isSwitchEnabled:0x10000000];
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v41 = VRTraceErrorLogLevelToCSTR();
      int v42 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v126 = v41;
        __int16 v127 = 2080;
        v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
        __int16 v129 = 1024;
        int v130 = 1021;
        __int16 v131 = 1024;
        LODWORD(v132) = v39;
        uint64_t v43 = " [%s] %s:%d Load switch wrmRSSIThresholdEnabled %d";
        long long v44 = v42;
        uint32_t v45 = 34;
LABEL_62:
        _os_log_impl(&dword_1E1EA4000, v44, OS_LOG_TYPE_DEFAULT, v43, buf, v45);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v40 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v40 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v46 = VRTraceErrorLogLevelToCSTR();
      uint64_t v47 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v126 = v46;
        __int16 v127 = 2080;
        v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
        __int16 v129 = 1024;
        int v130 = 1021;
        __int16 v131 = 2112;
        v132 = (const char *)v40;
        __int16 v133 = 2048;
        v134 = self;
        __int16 v135 = 1024;
        int v136 = v39;
        uint64_t v43 = " [%s] %s:%d %@(%p) Load switch wrmRSSIThresholdEnabled %d";
        long long v44 = v47;
        uint32_t v45 = 54;
        goto LABEL_62;
      }
    }
  }
  [(VCNetworkFeedbackController *)self->_feedbackController setRSSIThresholdEnabled:v39];
  -[VCConnectionManager setPreferRelayOverP2P:reason:](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "setPreferRelayOverP2P:reason:", [v4 isSwitchEnabled:1], 1);
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v49 = VRTraceErrorLogLevelToCSTR();
      uint64_t v50 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL v51 = [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] preferRelayOverP2PEnabled];
        *(_DWORD *)buf = 136315906;
        uint64_t v126 = v49;
        __int16 v127 = 2080;
        v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
        __int16 v129 = 1024;
        int v130 = 1025;
        __int16 v131 = 1024;
        LODWORD(v132) = v51;
        BOOL v52 = " [%s] %s:%d Load switch preferRelayOverP2P %d";
        BOOL v53 = v50;
        uint32_t v54 = 34;
LABEL_73:
        _os_log_impl(&dword_1E1EA4000, v53, OS_LOG_TYPE_DEFAULT, v52, buf, v54);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      __int16 v48 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v48 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v55 = VRTraceErrorLogLevelToCSTR();
      long long v56 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL v57 = [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] preferRelayOverP2PEnabled];
        *(_DWORD *)buf = 136316418;
        uint64_t v126 = v55;
        __int16 v127 = 2080;
        v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
        __int16 v129 = 1024;
        int v130 = 1025;
        __int16 v131 = 2112;
        v132 = (const char *)v48;
        __int16 v133 = 2048;
        v134 = self;
        __int16 v135 = 1024;
        int v136 = v57;
        BOOL v52 = " [%s] %s:%d %@(%p) Load switch preferRelayOverP2P %d";
        BOOL v53 = v56;
        uint32_t v54 = 54;
        goto LABEL_73;
      }
    }
  }
  -[VCConnectionManager setFastMediaDuplicationEnabled:](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "setFastMediaDuplicationEnabled:", [v4 isSwitchEnabled:64]);
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v59 = VRTraceErrorLogLevelToCSTR();
      __int16 v60 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL v61 = [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] fastMediaDuplicationEnabled];
        *(_DWORD *)buf = 136315906;
        uint64_t v126 = v59;
        __int16 v127 = 2080;
        v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
        __int16 v129 = 1024;
        int v130 = 1027;
        __int16 v131 = 1024;
        LODWORD(v132) = v61;
        long long v62 = " [%s] %s:%d Load switch fastMediaDuplicationEnabled %d";
        long long v63 = v60;
        uint32_t v64 = 34;
LABEL_84:
        _os_log_impl(&dword_1E1EA4000, v63, OS_LOG_TYPE_DEFAULT, v62, buf, v64);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint32_t v58 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      uint32_t v58 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v65 = VRTraceErrorLogLevelToCSTR();
      uint64_t v66 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL v67 = [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] fastMediaDuplicationEnabled];
        *(_DWORD *)buf = 136316418;
        uint64_t v126 = v65;
        __int16 v127 = 2080;
        v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
        __int16 v129 = 1024;
        int v130 = 1027;
        __int16 v131 = 2112;
        v132 = (const char *)v58;
        __int16 v133 = 2048;
        v134 = self;
        __int16 v135 = 1024;
        int v136 = v67;
        long long v62 = " [%s] %s:%d %@(%p) Load switch fastMediaDuplicationEnabled %d";
        long long v63 = v66;
        uint32_t v64 = 54;
        goto LABEL_84;
      }
    }
  }
  -[VCConnectionManager setDuplicateImportantPktsEnabled:](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "setDuplicateImportantPktsEnabled:", [v4 isSwitchEnabled:512]);
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v69 = VRTraceErrorLogLevelToCSTR();
      __int16 v70 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL v71 = [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] duplicateImportantPktsEnabled];
        *(_DWORD *)buf = 136315906;
        uint64_t v126 = v69;
        __int16 v127 = 2080;
        v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
        __int16 v129 = 1024;
        int v130 = 1029;
        __int16 v131 = 1024;
        LODWORD(v132) = v71;
        __int16 v72 = " [%s] %s:%d Load switch duplicateImportantPktsEnabled %d";
        int v73 = v70;
        uint32_t v74 = 34;
LABEL_95:
        _os_log_impl(&dword_1E1EA4000, v73, OS_LOG_TYPE_DEFAULT, v72, buf, v74);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v68 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v68 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v75 = VRTraceErrorLogLevelToCSTR();
      uint64_t v76 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL v77 = [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] duplicateImportantPktsEnabled];
        *(_DWORD *)buf = 136316418;
        uint64_t v126 = v75;
        __int16 v127 = 2080;
        v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
        __int16 v129 = 1024;
        int v130 = 1029;
        __int16 v131 = 2112;
        v132 = (const char *)v68;
        __int16 v133 = 2048;
        v134 = self;
        __int16 v135 = 1024;
        int v136 = v77;
        __int16 v72 = " [%s] %s:%d %@(%p) Load switch duplicateImportantPktsEnabled %d";
        int v73 = v76;
        uint32_t v74 = 54;
        goto LABEL_95;
      }
    }
  }
  -[VCConnectionManager setLowNetworkModeEnabled:](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "setLowNetworkModeEnabled:", [v4 isSwitchEnabled:0x1000000]);
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v79 = VRTraceErrorLogLevelToCSTR();
      __int16 v80 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL v81 = [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] lowNetworkModeEnabled];
        *(_DWORD *)buf = 136315906;
        uint64_t v126 = v79;
        __int16 v127 = 2080;
        v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
        __int16 v129 = 1024;
        int v130 = 1031;
        __int16 v131 = 1024;
        LODWORD(v132) = v81;
        uint64_t v82 = " [%s] %s:%d Load switch lowNetworkModeEnabled %d";
        uint64_t v83 = v80;
        uint32_t v84 = 34;
LABEL_106:
        _os_log_impl(&dword_1E1EA4000, v83, OS_LOG_TYPE_DEFAULT, v82, buf, v84);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      __int16 v78 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v78 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v85 = VRTraceErrorLogLevelToCSTR();
      long long v86 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL v87 = [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] lowNetworkModeEnabled];
        *(_DWORD *)buf = 136316418;
        uint64_t v126 = v85;
        __int16 v127 = 2080;
        v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
        __int16 v129 = 1024;
        int v130 = 1031;
        __int16 v131 = 2112;
        v132 = (const char *)v78;
        __int16 v133 = 2048;
        v134 = self;
        __int16 v135 = 1024;
        int v136 = v87;
        uint64_t v82 = " [%s] %s:%d %@(%p) Load switch lowNetworkModeEnabled %d";
        uint64_t v83 = v86;
        uint32_t v84 = 54;
        goto LABEL_106;
      }
    }
  }
  -[VCConnectionManager setDuplicationEnhancementEnabled:](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "setDuplicationEnhancementEnabled:", [v4 isLocalSwitchEnabled:0x2000000]);
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v89 = VRTraceErrorLogLevelToCSTR();
      uint64_t v90 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL v91 = [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] duplicationEnhancementEnabled];
        *(_DWORD *)buf = 136315906;
        uint64_t v126 = v89;
        __int16 v127 = 2080;
        v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
        __int16 v129 = 1024;
        int v130 = 1033;
        __int16 v131 = 1024;
        LODWORD(v132) = v91;
        uint64_t v92 = " [%s] %s:%d Load switch duplicationEnhancementEnabled %d";
        uint64_t v93 = v90;
        uint32_t v94 = 34;
LABEL_117:
        _os_log_impl(&dword_1E1EA4000, v93, OS_LOG_TYPE_DEFAULT, v92, buf, v94);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v88 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v88 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v95 = VRTraceErrorLogLevelToCSTR();
      v96 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL v97 = [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] duplicationEnhancementEnabled];
        *(_DWORD *)buf = 136316418;
        uint64_t v126 = v95;
        __int16 v127 = 2080;
        v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
        __int16 v129 = 1024;
        int v130 = 1033;
        __int16 v131 = 2112;
        v132 = (const char *)v88;
        __int16 v133 = 2048;
        v134 = self;
        __int16 v135 = 1024;
        int v136 = v97;
        uint64_t v92 = " [%s] %s:%d %@(%p) Load switch duplicationEnhancementEnabled %d";
        uint64_t v93 = v96;
        uint32_t v94 = 54;
        goto LABEL_117;
      }
    }
  }
  -[VCConnectionManager setiRATDuplicationEnabled:](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "setiRATDuplicationEnabled:", [v4 isSwitchEnabled:0x8000000]);
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v99 = VRTraceErrorLogLevelToCSTR();
      long long v100 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL v101 = [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] iRATDuplicationEnabled];
        *(_DWORD *)buf = 136315906;
        uint64_t v126 = v99;
        __int16 v127 = 2080;
        v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
        __int16 v129 = 1024;
        int v130 = 1035;
        __int16 v131 = 1024;
        LODWORD(v132) = v101;
        uint64_t v102 = " [%s] %s:%d Load switch iRATDuplicationEnabled %d";
        v103 = v100;
        uint32_t v104 = 34;
LABEL_128:
        _os_log_impl(&dword_1E1EA4000, v103, OS_LOG_TYPE_DEFAULT, v102, buf, v104);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      long long v98 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      long long v98 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v105 = VRTraceErrorLogLevelToCSTR();
      v106 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL v107 = [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] iRATDuplicationEnabled];
        *(_DWORD *)buf = 136316418;
        uint64_t v126 = v105;
        __int16 v127 = 2080;
        v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
        __int16 v129 = 1024;
        int v130 = 1035;
        __int16 v131 = 2112;
        v132 = (const char *)v98;
        __int16 v133 = 2048;
        v134 = self;
        __int16 v135 = 1024;
        int v136 = v107;
        uint64_t v102 = " [%s] %s:%d %@(%p) Load switch iRATDuplicationEnabled %d";
        v103 = v106;
        uint32_t v104 = 54;
        goto LABEL_128;
      }
    }
  }
  -[VCConnectionManager setUseMediaDrivenDuplication:](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "setUseMediaDrivenDuplication:", [v4 isSwitchEnabled:0x20000000]);
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_140;
    }
    uint64_t v109 = VRTraceErrorLogLevelToCSTR();
    v110 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_140;
    }
    BOOL v111 = [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] useMediaDrivenDuplication];
    *(_DWORD *)buf = 136315906;
    uint64_t v126 = v109;
    __int16 v127 = 2080;
    v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
    __int16 v129 = 1024;
    int v130 = 1037;
    __int16 v131 = 1024;
    LODWORD(v132) = v111;
    v112 = " [%s] %s:%d Load switch useMediaDrivenDuplication %d";
    v113 = v110;
    uint32_t v114 = 34;
    goto LABEL_139;
  }
  if (objc_opt_respondsToSelector()) {
    v108 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
  }
  else {
    v108 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v115 = VRTraceErrorLogLevelToCSTR();
    v116 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v117 = [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] useMediaDrivenDuplication];
      *(_DWORD *)buf = 136316418;
      uint64_t v126 = v115;
      __int16 v127 = 2080;
      v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
      __int16 v129 = 1024;
      int v130 = 1037;
      __int16 v131 = 2112;
      v132 = (const char *)v108;
      __int16 v133 = 2048;
      v134 = self;
      __int16 v135 = 1024;
      int v136 = v117;
      v112 = " [%s] %s:%d %@(%p) Load switch useMediaDrivenDuplication %d";
      v113 = v116;
      uint32_t v114 = 54;
LABEL_139:
      _os_log_impl(&dword_1E1EA4000, v113, OS_LOG_TYPE_DEFAULT, v112, buf, v114);
    }
  }
LABEL_140:
  [(VCSessionParticipantRemote *)[(VCSession *)self oneToOneRemoteParticipant] capabilities];
  if ((v118 & 0x100000000) != 0) {
    [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] applyLinkRecommendation];
  }
}

- (void)startOneToOne
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  p_oneToOneSettings = &self->_oneToOneSettings;
  if (!self->_oneToOneSettings.receivedFirstConnection)
  {
    if ((VCSession *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        int v19 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
      }
      else {
        int v19 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        return;
      }
      uint64_t v29 = VRTraceErrorLogLevelToCSTR();
      uint64_t v30 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v39 = v29;
      __int16 v40 = 2080;
      uint64_t v41 = "-[VCSession(OneToOne) startOneToOne]";
      __int16 v42 = 1024;
      int v43 = 1046;
      __int16 v44 = 2112;
      uint32_t v45 = v19;
      __int16 v46 = 2048;
      uint64_t v47 = self;
      uint64_t v24 = " [%s] %s:%d %@(%p) We cannot start oneToOne if we haven't yet received an active connection";
      goto LABEL_60;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      return;
    }
    uint64_t v22 = VRTraceErrorLogLevelToCSTR();
    uint64_t v23 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v39 = v22;
    __int16 v40 = 2080;
    uint64_t v41 = "-[VCSession(OneToOne) startOneToOne]";
    __int16 v42 = 1024;
    int v43 = 1046;
    uint64_t v24 = " [%s] %s:%d We cannot start oneToOne if we haven't yet received an active connection";
    goto LABEL_47;
  }
  if (![(VCSession *)self oneToOneRemoteParticipant])
  {
    if ((VCSession *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        char v20 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
      }
      else {
        char v20 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        return;
      }
      uint64_t v31 = VRTraceErrorLogLevelToCSTR();
      uint64_t v30 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v39 = v31;
      __int16 v40 = 2080;
      uint64_t v41 = "-[VCSession(OneToOne) startOneToOne]";
      __int16 v42 = 1024;
      int v43 = 1047;
      __int16 v44 = 2112;
      uint32_t v45 = v20;
      __int16 v46 = 2048;
      uint64_t v47 = self;
      uint64_t v24 = " [%s] %s:%d %@(%p) We cannot start oneToOne if we haven't yet started the remote participant";
      goto LABEL_60;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      return;
    }
    uint64_t v25 = VRTraceErrorLogLevelToCSTR();
    uint64_t v23 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v39 = v25;
    __int16 v40 = 2080;
    uint64_t v41 = "-[VCSession(OneToOne) startOneToOne]";
    __int16 v42 = 1024;
    int v43 = 1047;
    uint64_t v24 = " [%s] %s:%d We cannot start oneToOne if we haven't yet started the remote participant";
LABEL_47:
    __int16 v27 = v23;
    uint32_t v28 = 28;
LABEL_61:
    _os_log_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEFAULT, v24, buf, v28);
    return;
  }
  BOOL startedOneToOne = p_oneToOneSettings->startedOneToOne;
  long long v5 = (VCSession *)objc_opt_class();
  if (startedOneToOne)
  {
    if (v5 != self)
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v21 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v21 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        return;
      }
      uint64_t v32 = VRTraceErrorLogLevelToCSTR();
      uint64_t v30 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v39 = v32;
      __int16 v40 = 2080;
      uint64_t v41 = "-[VCSession(OneToOne) startOneToOne]";
      __int16 v42 = 1024;
      int v43 = 1048;
      __int16 v44 = 2112;
      uint32_t v45 = v21;
      __int16 v46 = 2048;
      uint64_t v47 = self;
      uint64_t v24 = " [%s] %s:%d %@(%p) We cannot start oneToOne if we have already started oneToOne";
LABEL_60:
      __int16 v27 = v30;
      uint32_t v28 = 48;
      goto LABEL_61;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      return;
    }
    uint64_t v26 = VRTraceErrorLogLevelToCSTR();
    uint64_t v23 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v39 = v26;
    __int16 v40 = 2080;
    uint64_t v41 = "-[VCSession(OneToOne) startOneToOne]";
    __int16 v42 = 1024;
    int v43 = 1048;
    uint64_t v24 = " [%s] %s:%d We cannot start oneToOne if we have already started oneToOne";
    goto LABEL_47;
  }
  if (v5 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_15;
    }
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v39 = v7;
    __int16 v40 = 2080;
    uint64_t v41 = "-[VCSession(OneToOne) startOneToOne]";
    __int16 v42 = 1024;
    int v43 = 1049;
    uint64_t v9 = " [%s] %s:%d ";
    unsigned int v10 = v8;
    uint32_t v11 = 28;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      long long v6 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      long long v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_15;
    }
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    char v13 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v39 = v12;
    __int16 v40 = 2080;
    uint64_t v41 = "-[VCSession(OneToOne) startOneToOne]";
    __int16 v42 = 1024;
    int v43 = 1049;
    __int16 v44 = 2112;
    uint32_t v45 = v6;
    __int16 v46 = 2048;
    uint64_t v47 = self;
    uint64_t v9 = " [%s] %s:%d %@(%p) ";
    unsigned int v10 = v13;
    uint32_t v11 = 48;
  }
  _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
LABEL_15:
  [(VCSession *)self setupOneToOneABTesting];
  [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] reportFirstActiveConnectionOneToOne:self->_currentActiveConnection remoteOSVersion:[(VCCallInfoBlob *)[(VCSessionParticipant *)[(VCSession *)self oneToOneRemoteParticipant] callInfoBlob] osVersion] redState:[(VCMediaNegotiatorResultsAudio *)[(VCSessionMediaNegotiator *)[(VCSessionParticipant *)self->_localParticipant mediaNegotiator] negotiatedAudioSettings] redPayload] == 20 isAudioOnly:[(VCSession *)self isOneToOneUsingVideo] ^ 1];
  if (VCOverlayManager_isOverlayEnabled()) {
    [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] setOverlayToken:[(VCSessionParticipant *)[(VCSession *)self oneToOneRemoteParticipant] participantVideoToken]];
  }
  [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] setStartConnectionHealthMonitoring:1];
  if (VCReporting_GetClientType() == self->_reportingClientType)
  {
    [(VCSession *)self reportingSetUserInfo];
  }
  else
  {
    [(VCSession *)self startReportingForOneToOneEnabled:1 withPayload:0];
    [(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] reportCurrentPrimaryConnection];
    [(VCSession *)self reportExistingParticipantsAnew];
  }
  [(VCSession *)self isOneToOneUsingVideo];
  +[VCSession deviceRoleForSessionMode:[(VCSessionConfiguration *)self->_configuration sessionMode]];
  reportingModeRoleTransportLog();
  [(VCSession *)self startRateControllerOneToOne];
  MediaQueue_Start();
  VCMediaQueue_Start((uint64_t)p_oneToOneSettings->vcMediaQueue);
  [(VCTransportSession *)self->_transportSession setOneToOneModeEnabled:1 isInitiator:self->_isOneToOneInitiator];
  [(VCSessionParticipantLocal *)self->_localParticipant handleActiveConnectionChange:self->_currentActiveConnection];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  NSUInteger v14 = [(VCSession *)self remoteParticipants];
  uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v34 objects:v33 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v35 != v17) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v34 + 1) + 8 * i) handleActiveConnectionChange:self->_currentActiveConnection];
      }
      uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v34 objects:v33 count:16];
    }
    while (v16);
  }
  p_oneToOneSettings->BOOL startedOneToOne = 1;
}

uint64_t __56__VCSession_OneToOne__setIsOneToOneRemoteMediaStalling___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v6 = 136316162;
      uint64_t v7 = v2;
      __int16 v8 = 2080;
      uint64_t v9 = "-[VCSession(OneToOne) setIsOneToOneRemoteMediaStalling:]_block_invoke";
      __int16 v10 = 1024;
      int v11 = 1085;
      __int16 v12 = 1024;
      int v13 = 1085;
      __int16 v14 = 2048;
      uint64_t v15 = v4;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession+OneToOne.m:%d: [%p] OneToOne session should reconnect (ids reinit)", (uint8_t *)&v6, 0x2Cu);
    }
  }
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSessionShouldReconnect:", *(void *)(a1 + 32));
}

- (void)reportActiveConnectionOneToOne
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_oneToOneSettings.receivedFirstConnection)
  {
    uint64_t v3 = [(VCTransportSession *)self->_transportSession connectionManager];
    currentActiveConnection = self->_currentActiveConnection;
    uint64_t v5 = [(VCSession *)self isOneToOneUsingVideo] ^ 1;
    [(VCConnectionManager *)v3 reportActiveConnectionOneToOne:currentActiveConnection isAudioOnly:v5];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315650;
      uint64_t v9 = v6;
      __int16 v10 = 2080;
      int v11 = "-[VCSession(OneToOne) reportActiveConnectionOneToOne]";
      __int16 v12 = 1024;
      int v13 = 1095;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d We haven't yet received an active connection", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

- (void)notifyDelegateActiveConnectionDidChange
{
  v10[7] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (const void *)VCConnectionManager_CopyConnectionForQuality((uint64_t)[(VCTransportSession *)self->_transportSession connectionManager], 1);
  id v4 = [(NSArray *)[(VCSession *)self remoteParticipants] firstObject];
  if (v3)
  {
    id v5 = v4;
    if (VCConnection_IsRelay((uint64_t)v3)) {
      uint64_t v6 = @"RLY-";
    }
    else {
      uint64_t v6 = @"P2P-";
    }
    if ([(VCConnectionManager *)[(VCTransportSession *)self->_transportSession connectionManager] isDuplicationEnabled])
    {
      uint64_t v7 = @"D-";
    }
    else
    {
      uint64_t v7 = @"P-";
    }
    uint64_t v8 = [(__CFString *)v7 stringByAppendingString:v6];
    notificationQueue = self->_notificationQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __62__VCSession_OneToOne__notifyDelegateActiveConnectionDidChange__block_invoke;
    v10[3] = &unk_1E6DB43D8;
    v10[4] = v8;
    v10[5] = v3;
    void v10[6] = v5;
    dispatch_async(notificationQueue, v10);
    CFRelease(v3);
  }
}

uint64_t __62__VCSession_OneToOne__notifyDelegateActiveConnectionDidChange__block_invoke(id *a1)
{
  uint64_t v2 = (void *)VCRemoteVideoManager_DefaultManager();
  uint64_t v3 = objc_msgSend(a1[4], "stringByAppendingString:", objc_msgSend(a1[5], "localInterfaceTypeString"));
  uint64_t v4 = objc_msgSend(a1[4], "stringByAppendingString:", objc_msgSend(a1[5], "remoteInterfaceTypeString"));
  uint64_t v5 = [a1[6] participantVideoToken];

  return [v2 connectionDidChangeWithLocalInterfaceType:v3 remoteInterfaceType:v4 streamToken:v5];
}

- (void)setLinkTypeForFeedbackController:(id)a3 withActiveConnection:(id)a4
{
  if (VCConnection_IsRelay((uint64_t)a4)) {
    int v5 = 2;
  }
  else {
    int v5 = 1;
  }

  VCRateControlFeedbackController_UpdateTxLinkType((unsigned __int8 *)a3, v5);
}

- (void)handleActiveConnectionChangeForOneToOne:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  self->_maxConnectionMTU = [a3 updateMaxConnectionMTU:self->_maxConnectionMTU];
  [(VCSession *)self configureOneToOneRateController:a3];
  p_oneToOneSettings = &self->_oneToOneSettings;
  BOOL receivedFirstConnection = self->_oneToOneSettings.receivedFirstConnection;
  self->_oneToOneSettings.BOOL receivedFirstConnection = a3 != 0;
  if (a3
    && !receivedFirstConnection
    && [(NSArray *)[(VCSession *)self remoteParticipants] count])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315650;
        uint64_t v10 = v7;
        __int16 v11 = 2080;
        __int16 v12 = "-[VCSession(OneToOne) handleActiveConnectionChangeForOneToOne:]";
        __int16 v13 = 1024;
        int v14 = 1130;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d We have received the first active connection, we can now start OneToOne", (uint8_t *)&v9, 0x1Cu);
      }
    }
    [(VCSession *)self startOneToOne];
  }
  else if (self->_isReconnectPending)
  {
    [(VCTransportSession *)self->_transportSession setOneToOneModeEnabled:1 isInitiator:self->_isOneToOneInitiator];
    self->_isReconnectPending = 0;
    reportingGenericEvent();
  }
  else
  {
    [(VCSession *)self reportActiveConnectionOneToOne];
  }
  if (VCConnection_IsLocalOnCellular((uint64_t)a3)) {
    [(VCSessionParticipant *)self->_localParticipant setBasebandCongestionDetector:[(AVCRateController *)p_oneToOneSettings->rateController basebandCongestionDetector]];
  }
  [(VCSession *)self setLinkTypeForFeedbackController:[(AVCRateController *)p_oneToOneSettings->rateController feedbackController] withActiveConnection:a3];
  [(VCSession *)self notifyDelegateActiveConnectionDidChange];
}

- (void)configureOneToOneReportingOnVideoEnabled
{
  if ([(VCSession *)self isOneToOneUsingVideo])
  {
    +[VCSession deviceRoleForSessionMode:[(VCSessionConfiguration *)self->_configuration sessionMode]];
    reportingModeRoleTransportLog();
    uint64_t v3 = [(VCTransportSession *)self->_transportSession connectionManager];
    currentActiveConnection = self->_currentActiveConnection;
    [(VCConnectionManager *)v3 reportActiveConnectionOneToOne:currentActiveConnection isAudioOnly:0];
  }
}

- (void)createSessionMessaging
{
  if (!self->_sessionMessaging)
  {
    self->_controlChannel = [[VCControlChannelMultiWay alloc] initWithTransportSessionID:self->_transportSessionID reportingAgent:self->super._reportingAgent];
    self->_sessionMessaging = [[VCSessionMessaging alloc] initWithControlChannel:self->_controlChannel remoteVersion:0];
    [(VCSession *)self setupAudioEnabledMessages];
    [(VCSession *)self setupVideoEnabledMessages];
    [(VCSession *)self setupMediaStateUpdateMessage];
    [(VCSession *)self setupStreamGroupStateFetchMessage];
    [(VCSession *)self setupAudioPausedMessages];
    [(VCSession *)self setupVideoPausedMessages];
    [(VCSession *)self setupKeyFrameGenerationMessages];
    [(VCSession *)self setupSymptomEnabledMessages];
    [(VCSession *)self setupWRMAlertUpdateMessage];
    [(VCSession *)self setupMomentsMessages];
    [(VCSession *)self setupPreferredInterfaceMessage];
    [(VCSession *)self setupPiPStateChangeMessage];
    [(VCSession *)self setupDisconnectMessage];
    [(VCSession *)self setupCellTechChangeMessages];
    [(VCSession *)self setupOneToOneEnabledMessages];
    [(VCSession *)self setupLinkConstrainsChangedMessages];
    [(VCSession *)self setupMediaQualityDegradedMessage];
    [(VCSession *)self setupNetworkCapabilityMessage];
    [(VCSession *)self setupNetworkQualityDegradedMessage];
    [(VCSession *)self setupReactionMessages];
    [(VCSession *)self setupDeviceStateMessage];
  }
}

- (void)destroySessionMessaging
{
  self->_sessionMessaging = 0;
  self->_controlChannel = 0;
}

- (void)startSessionMessaging
{
  [(VCControlChannelMultiWay *)self->_controlChannel start];
  sessionMessaging = self->_sessionMessaging;

  [(VCSessionMessaging *)sessionMessaging startMessaging];
}

- (void)stopSessionMessaging
{
  [(VCSessionMessaging *)self->_sessionMessaging stopMessaging];
  [(VCControlChannelMultiWay *)self->_controlChannel flushActiveMessages];
  [(VCControlChannelMultiWay *)self->_controlChannel removeAllActiveParticipants];
  controlChannel = self->_controlChannel;

  [(VCControlChannelMultiWay *)controlChannel stop];
}

- (void)broadcastMessage:(id)a3 withTopic:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [(VCSession *)self remoteParticipants];
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        -[VCSessionMessaging sendMessage:withTopic:participantID:](self->_sessionMessaging, "sendMessage:withTopic:participantID:", a3, a4, [*(id *)(*((void *)&v13 + 1) + 8 * v11++) idsParticipantID]);
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v13 objects:v12 count:16];
    }
    while (v9);
  }
}

- (void)broadcastMessageDictionary:(id)a3 withTopic:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [(VCSession *)self remoteParticipants];
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        -[VCSessionMessaging sendMessageDictionary:withTopic:participantID:](self->_sessionMessaging, "sendMessageDictionary:withTopic:participantID:", a3, a4, [*(id *)(*((void *)&v13 + 1) + 8 * v11++) idsParticipantID]);
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v13 objects:v12 count:16];
    }
    while (v9);
  }
}

- (void)broadcastSingleStateMessage:(id)a3 withTopic:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [(VCSession *)self remoteParticipants];
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        __int16 v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        [v12 capabilities];
        if (v13 == 1) {
          -[VCSessionMessaging sendMessage:withTopic:participantID:](self->_sessionMessaging, "sendMessage:withTopic:participantID:", a3, a4, [v12 idsParticipantID]);
        }
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v14 count:16];
    }
    while (v9);
  }
}

- (void)setupAudioEnabledMessages
{
  v5[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  sessionMessaging = self->_sessionMessaging;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __49__VCSession_Messaging__setupAudioEnabledMessages__block_invoke;
  v5[3] = &unk_1E6DB75C0;
  v5[4] = v3;
  [(VCSessionMessaging *)sessionMessaging addTopic:@"VCSessionMessageTopicAudioEnabledState" associatedStrings:&unk_1F3DC87D8 allowConcurrent:0 receiveHandler:v5];
}

void __49__VCSession_Messaging__setupAudioEnabledMessages__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)[*(id *)(a1 + 32) strong];
  uint64_t v7 = objc_msgSend((id)objc_msgSend(v6, "remoteParticipantsMapByServerID"), "objectForKeyedSubscript:", a4);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136316930;
      uint64_t v11 = v8;
      __int16 v12 = 2080;
      int v13 = "-[VCSession(Messaging) setupAudioEnabledMessages]_block_invoke";
      __int16 v14 = 1024;
      int v15 = 147;
      __int16 v16 = 2112;
      uint64_t v17 = [v6 uuid];
      __int16 v18 = 1024;
      int v19 = [v6 transportSessionID];
      __int16 v20 = 2112;
      uint64_t v21 = a4;
      __int16 v22 = 2112;
      uint64_t v23 = [v7 uuid];
      __int16 v24 = 2080;
      uint64_t v25 = [a2 UTF8String];
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCSession[%@] transportSessionID[%u] participantId:[%@] participantUUID[%@] receives message:%s", (uint8_t *)&v10, 0x4Au);
    }
  }
  if (v7) {
    objc_msgSend(v7, "setRemoteAudioEnabled:", objc_msgSend(a2, "isEqualToString:", @"VCSessionMessageAudioEnabled"));
  }
}

- (void)setupVideoEnabledMessages
{
  v5[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  sessionMessaging = self->_sessionMessaging;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __49__VCSession_Messaging__setupVideoEnabledMessages__block_invoke;
  v5[3] = &unk_1E6DB75C0;
  v5[4] = v3;
  [(VCSessionMessaging *)sessionMessaging addTopic:@"VCSessionMessageTopicVideoEnabledStateb" associatedStrings:&unk_1F3DC87F0 allowConcurrent:0 receiveHandler:v5];
}

void __49__VCSession_Messaging__setupVideoEnabledMessages__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)[*(id *)(a1 + 32) strong];
  uint64_t v7 = objc_msgSend((id)objc_msgSend(v6, "remoteParticipantsMapByServerID"), "objectForKeyedSubscript:", a4);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136316930;
      uint64_t v11 = v8;
      __int16 v12 = 2080;
      int v13 = "-[VCSession(Messaging) setupVideoEnabledMessages]_block_invoke";
      __int16 v14 = 1024;
      int v15 = 162;
      __int16 v16 = 2112;
      uint64_t v17 = [v6 uuid];
      __int16 v18 = 1024;
      int v19 = [v6 transportSessionID];
      __int16 v20 = 2112;
      uint64_t v21 = a4;
      __int16 v22 = 2112;
      uint64_t v23 = [v7 uuid];
      __int16 v24 = 2080;
      uint64_t v25 = [a2 UTF8String];
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCSession[%@] transportSessionID[%u] participantId:[%@] participantUUID[%@] receives message:%s", (uint8_t *)&v10, 0x4Au);
    }
  }
  if (v7) {
    objc_msgSend(v7, "setRemoteVideoEnabled:", objc_msgSend(a2, "isEqualToString:", @"VCSessionMessageVideoEnabled"));
  }
}

- (void)setupStreamGroupStateFetchMessage
{
  v5[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  sessionMessaging = self->_sessionMessaging;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __57__VCSession_Messaging__setupStreamGroupStateFetchMessage__block_invoke;
  v5[3] = &unk_1E6DB9610;
  v5[4] = v3;
  [(VCSessionMessaging *)sessionMessaging addTopic:@"VCSessionMessageTopicFetchStreamGroupsState" associatedStrings:0 allowConcurrent:0 sendMessageDictionaryCompletionHandler:0 receiveMessageDictionaryHandler:v5];
}

void __57__VCSession_Messaging__setupStreamGroupStateFetchMessage__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)[*(id *)(a1 + 32) strong];
  uint64_t v7 = objc_msgSend((id)objc_msgSend(v6, "remoteParticipantsMapByServerID"), "objectForKeyedSubscript:", a4);
  if (a2)
  {
    uint64_t v8 = (void *)v7;
    if (v7)
    {
      int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if (v6)
      {
        if (ErrorLogLevelForModule >= 6)
        {
          uint64_t v10 = VRTraceErrorLogLevelToCSTR();
          uint64_t v11 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v12 = 136316930;
            uint64_t v13 = v10;
            __int16 v14 = 2080;
            int v15 = "-[VCSession(Messaging) setupStreamGroupStateFetchMessage]_block_invoke";
            __int16 v16 = 1024;
            int v17 = 182;
            __int16 v18 = 2112;
            uint64_t v19 = [v6 uuid];
            __int16 v20 = 1024;
            int v21 = [v6 transportSessionID];
            __int16 v22 = 2112;
            uint64_t v23 = a4;
            __int16 v24 = 2112;
            uint64_t v25 = [v8 uuid];
            __int16 v26 = 2112;
            uint64_t v27 = a2;
            _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCSession[%@] transportSessionID=%u participantId[%@] participantUUID[%@] message=%@", (uint8_t *)&v12, 0x4Au);
          }
        }
        [v6 sendStreamGroupStateToParticipant:v8];
      }
      else if (ErrorLogLevelForModule >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __57__VCSession_Messaging__setupStreamGroupStateFetchMessage__block_invoke_cold_3();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __57__VCSession_Messaging__setupStreamGroupStateFetchMessage__block_invoke_cold_2();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __57__VCSession_Messaging__setupStreamGroupStateFetchMessage__block_invoke_cold_1();
    }
  }
}

- (void)setupAudioPausedMessages
{
  v5[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  sessionMessaging = self->_sessionMessaging;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __48__VCSession_Messaging__setupAudioPausedMessages__block_invoke;
  v5[3] = &unk_1E6DB75C0;
  v5[4] = v3;
  [(VCSessionMessaging *)sessionMessaging addTopic:@"VCSessionMessageTopicAudioPausedState" associatedStrings:&unk_1F3DC8808 allowConcurrent:0 receiveHandler:v5];
}

uint64_t __48__VCSession_Messaging__setupAudioPausedMessages__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)[*(id *)(a1 + 32) strong];
  uint64_t result = objc_msgSend((id)objc_msgSend(v6, "remoteParticipantsMapByServerID"), "objectForKeyedSubscript:", a4);
  if (result)
  {
    uint64_t v8 = (void *)result;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136316930;
        uint64_t v12 = v9;
        __int16 v13 = 2080;
        __int16 v14 = "-[VCSession(Messaging) setupAudioPausedMessages]_block_invoke";
        __int16 v15 = 1024;
        int v16 = 199;
        __int16 v17 = 2112;
        uint64_t v18 = [v6 uuid];
        __int16 v19 = 1024;
        int v20 = [v6 transportSessionID];
        __int16 v21 = 2112;
        uint64_t v22 = a4;
        __int16 v23 = 2112;
        uint64_t v24 = [v8 uuid];
        __int16 v25 = 2080;
        uint64_t v26 = [a2 UTF8String];
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCSession[%@] transportSessionID[%u] participantId:[%@] participantUUID[%@] receives message:%s", (uint8_t *)&v11, 0x4Au);
      }
    }
    return objc_msgSend(v8, "setRemoteAudioPaused:", objc_msgSend(a2, "isEqualToString:", @"VCSessionMessageAudioPaused"));
  }
  return result;
}

- (void)setupOneToOneEnabledMessages
{
  v5[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  sessionMessaging = self->_sessionMessaging;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __52__VCSession_Messaging__setupOneToOneEnabledMessages__block_invoke;
  v5[3] = &unk_1E6DB75C0;
  v5[4] = v3;
  [(VCSessionMessaging *)sessionMessaging addTopic:@"VCSessionMessageTopicOneToOneEnabledState" associatedStrings:&unk_1F3DC8820 allowConcurrent:0 receiveHandler:v5];
}

void __52__VCSession_Messaging__setupOneToOneEnabledMessages__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void v8[7] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [*(id *)(a1 + 32) strong];
  uint64_t v7 = *(NSObject **)(v6 + 176);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __52__VCSession_Messaging__setupOneToOneEnabledMessages__block_invoke_2;
  v8[3] = &unk_1E6DB43D8;
  void v8[4] = v6;
  v8[5] = a4;
  void v8[6] = a2;
  dispatch_async(v7, v8);
}

void __52__VCSession_Messaging__setupOneToOneEnabledMessages__block_invoke_2(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "remoteParticipantsMapByServerID"), "objectForKeyedSubscript:", *(void *)(a1 + 40));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [*(id *)(a1 + 32) uuid];
      int v6 = [*(id *)(a1 + 32) transportSessionID];
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v8 = [v2 uuid];
      uint64_t v9 = [*(id *)(a1 + 48) UTF8String];
      int v10 = 136316930;
      uint64_t v11 = v3;
      __int16 v12 = 2080;
      __int16 v13 = "-[VCSession(Messaging) setupOneToOneEnabledMessages]_block_invoke_2";
      __int16 v14 = 1024;
      int v15 = 214;
      __int16 v16 = 2112;
      uint64_t v17 = v5;
      __int16 v18 = 1024;
      int v19 = v6;
      __int16 v20 = 2112;
      uint64_t v21 = v7;
      __int16 v22 = 2112;
      uint64_t v23 = v8;
      __int16 v24 = 2080;
      uint64_t v25 = v9;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCSession[%@] transportSessionID[%u] participantId:[%@] participantUUID[%@] receives message:%s", (uint8_t *)&v10, 0x4Au);
    }
  }
  if (v2) {
    objc_msgSend(*(id *)(a1 + 32), "dispatchedSetOneToOneModeEnabled:isLocal:configurationDict:", objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", @"VCSessionMessageOneToOneEnabled"), 0, 0);
  }
}

- (void)setupVideoPausedMessages
{
  v5[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  sessionMessaging = self->_sessionMessaging;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __48__VCSession_Messaging__setupVideoPausedMessages__block_invoke;
  v5[3] = &unk_1E6DB75C0;
  v5[4] = v3;
  [(VCSessionMessaging *)sessionMessaging addTopic:@"VCSessionMessageTopicVideoPausedState" associatedStrings:&unk_1F3DC8838 allowConcurrent:0 receiveHandler:v5];
}

uint64_t __48__VCSession_Messaging__setupVideoPausedMessages__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int v6 = (void *)[*(id *)(a1 + 32) strong];
  uint64_t result = objc_msgSend((id)objc_msgSend(v6, "remoteParticipantsMapByServerID"), "objectForKeyedSubscript:", a4);
  if (result)
  {
    uint64_t v8 = (void *)result;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      int v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136316930;
        uint64_t v12 = v9;
        __int16 v13 = 2080;
        __int16 v14 = "-[VCSession(Messaging) setupVideoPausedMessages]_block_invoke";
        __int16 v15 = 1024;
        int v16 = 232;
        __int16 v17 = 2112;
        uint64_t v18 = [v6 uuid];
        __int16 v19 = 1024;
        int v20 = [v6 transportSessionID];
        __int16 v21 = 2112;
        uint64_t v22 = a4;
        __int16 v23 = 2112;
        uint64_t v24 = [v8 uuid];
        __int16 v25 = 2080;
        uint64_t v26 = [a2 UTF8String];
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCSession[%@] transportSessionID[%u] participantId:[%@] participantUUID[%@] receives message:%s", (uint8_t *)&v11, 0x4Au);
      }
    }
    return objc_msgSend(v8, "setRemoteVideoPaused:", objc_msgSend(a2, "isEqualToString:", @"VCSessionMessageVideoPaused"));
  }
  return result;
}

- (void)setupKeyFrameGenerationMessages
{
  v5[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  sessionMessaging = self->_sessionMessaging;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __55__VCSession_Messaging__setupKeyFrameGenerationMessages__block_invoke;
  v5[3] = &unk_1E6DB9610;
  v5[4] = v3;
  [(VCSessionMessaging *)sessionMessaging addTopic:@"VCSessionMessageTopicGenerateKeyFrame" associatedStrings:0 allowConcurrent:1 requireReliable:0 sendMessageDictionaryCompletionHandler:0 receiveMessageDictionaryHandler:v5];
}

uint64_t __55__VCSession_Messaging__setupKeyFrameGenerationMessages__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v6 = (void *)[*(id *)(a1 + 32) strong];

  return [v6 generateKeyFrameWithReceivedMessage:a2 forParticipant:a4];
}

- (void)processSymptomFromMessage:(id)a3 participantID:(id)a4 isLocalInitiated:(BOOL)a5 isLocalSideOnly:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  int v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F47A30], "weakObjectHolderWithObject:", self), "strong");
  uint64_t v11 = objc_msgSend((id)objc_msgSend(v10, "remoteParticipantsMapByServerID"), "objectForKeyedSubscript:", a4);
  if (a3)
  {
    uint64_t v12 = (void *)v11;
    if (v11)
    {
      [a3 objectForKeyedSubscript:@"VCSessionMessageSymptom"];
      int v13 = processGroupSymptoms();
      __int16 v14 = (const void *)[a3 objectForKeyedSubscript:@"VCSessionMessageGroupID"];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        int v16 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136317954;
          uint64_t v20 = v15;
          __int16 v21 = 2080;
          uint64_t v22 = "-[VCSession(Messaging) processSymptomFromMessage:participantID:isLocalInitiated:isLocalSideOnly:]";
          __int16 v23 = 1024;
          int v24 = 259;
          __int16 v25 = 2112;
          uint64_t v26 = [v10 uuid];
          __int16 v27 = 1024;
          int v28 = [v10 transportSessionID];
          __int16 v29 = 2112;
          id v30 = a4;
          __int16 v31 = 2112;
          uint64_t v32 = [v12 uuid];
          __int16 v33 = 1024;
          BOOL v34 = v7;
          __int16 v35 = 1024;
          BOOL v36 = v6;
          __int16 v37 = 2112;
          id v38 = a3;
          __int16 v39 = 1024;
          int v40 = v13;
          __int16 v41 = 2112;
          __int16 v42 = v14;
          _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SymptomReporter: VCSession[%@] transportSessionID[%u] participantId:[%@] participantUUID:[%@] isLocalInitiated:%d isLocalSideOnly:%d message:%@, symptomID: %d, groupID: %@", buf, 0x66u);
        }
      }
      if (v14)
      {
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        CFDictionarySetValue(Mutable, @"SymptomReporterOptionalKeyGroupID", v14);
        uint64_t v18 = (const void **)MEMORY[0x1E4F1CFD0];
        if (!v6) {
          uint64_t v18 = (const void **)MEMORY[0x1E4F1CFC8];
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
          -[VCSession(Messaging) processSymptomFromMessage:participantID:isLocalInitiated:isLocalSideOnly:]();
        }
      }
    }
  }
}

- (void)setupSymptomEnabledMessages
{
  void v6[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  sessionMessaging = self->_sessionMessaging;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__VCSession_Messaging__setupSymptomEnabledMessages__block_invoke;
  void v6[3] = &unk_1E6DB9638;
  v6[4] = v3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __51__VCSession_Messaging__setupSymptomEnabledMessages__block_invoke_83;
  v5[3] = &unk_1E6DB9610;
  v5[4] = v3;
  [(VCSessionMessaging *)sessionMessaging addTopic:@"VCSessionMessageTopicSymptom" associatedStrings:0 allowConcurrent:0 sendMessageDictionaryCompletionHandler:v6 receiveMessageDictionaryHandler:v5];
}

uint64_t __51__VCSession_Messaging__setupSymptomEnabledMessages__block_invoke(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
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
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136316162;
        uint64_t v13 = v10;
        __int16 v14 = 2080;
        uint64_t v15 = "-[VCSession(Messaging) setupSymptomEnabledMessages]_block_invoke";
        __int16 v16 = 1024;
        int v17 = 283;
        __int16 v18 = 2112;
        uint64_t v19 = a2;
        __int16 v20 = 2112;
        uint64_t v21 = a4;
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SymptomReporter: Failed to send symptom message %@ to participantID %@, requesting only the local side", (uint8_t *)&v12, 0x30u);
      }
    }
    return [v8 processSymptomFromMessage:a2 participantID:a4 isLocalInitiated:1 isLocalSideOnly:1];
  }
}

uint64_t __51__VCSession_Messaging__setupSymptomEnabledMessages__block_invoke_83(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL v6 = (void *)[*(id *)(a1 + 32) strong];

  return [v6 processSymptomFromMessage:a2 participantID:a4 isLocalInitiated:0 isLocalSideOnly:0];
}

- (void)setupWRMAlertUpdateMessage
{
  void v5[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  sessionMessaging = self->_sessionMessaging;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __50__VCSession_Messaging__setupWRMAlertUpdateMessage__block_invoke;
  v5[3] = &unk_1E6DB75C0;
  v5[4] = v3;
  [(VCSessionMessaging *)sessionMessaging addTopic:@"VCWRMAlertStateUpdateMessageTopic" associatedStrings:&unk_1F3DC8850 allowConcurrent:0 receiveHandler:v5];
}

void __50__VCSession_Messaging__setupWRMAlertUpdateMessage__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    BOOL v6 = (void *)[*(id *)(a1 + 32) strong];
    BOOL v7 = objc_msgSend((id)objc_msgSend(v6, "remoteParticipantsMapByServerID"), "objectForKeyedSubscript:", a4);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136316930;
        uint64_t v13 = v8;
        __int16 v14 = 2080;
        uint64_t v15 = "-[VCSession(Messaging) setupWRMAlertUpdateMessage]_block_invoke";
        __int16 v16 = 1024;
        int v17 = 302;
        __int16 v18 = 2112;
        uint64_t v19 = [v6 uuid];
        __int16 v20 = 1024;
        int v21 = [v6 transportSessionID];
        __int16 v22 = 2112;
        uint64_t v23 = a4;
        __int16 v24 = 2112;
        uint64_t v25 = [v7 uuid];
        __int16 v26 = 2080;
        uint64_t v27 = [a2 UTF8String];
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCSession[%@] transportSessionID[%u] participantId:[%@] participantUUID[%@] receives message:%s", (uint8_t *)&v12, 0x4Au);
      }
    }
    if ([a2 isEqualToString:@"VCWRMAlertStateEnabled"])
    {
      uint64_t v10 = objc_msgSend((id)objc_msgSend(v6, "transportSession"), "connectionManager");
      uint64_t v11 = 1;
LABEL_12:
      [v10 setRemotePreWarmStateEnabled:v11];
      return;
    }
    if ([a2 isEqualToString:@"VCWRMAlertStateDisabled"])
    {
      uint64_t v10 = objc_msgSend((id)objc_msgSend(v6, "transportSession"), "connectionManager");
      uint64_t v11 = 0;
      goto LABEL_12;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __50__VCSession_Messaging__setupWRMAlertUpdateMessage__block_invoke_cold_2();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __50__VCSession_Messaging__setupWRMAlertUpdateMessage__block_invoke_cold_1();
    }
  }
}

- (void)setupMomentsMessages
{
  void v5[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  sessionMessaging = self->_sessionMessaging;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __44__VCSession_Messaging__setupMomentsMessages__block_invoke;
  v5[3] = &unk_1E6DB9610;
  v5[4] = v3;
  [(VCSessionMessaging *)sessionMessaging addTopic:@"VCSessionMomentsStateMessageTopic" associatedStrings:0 allowConcurrent:0 sendMessageDictionaryCompletionHandler:0 receiveMessageDictionaryHandler:v5];
}

void __44__VCSession_Messaging__setupMomentsMessages__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v6 = (void *)[*(id *)(a1 + 32) strong];
  uint64_t v7 = [a2 objectForKeyedSubscript:@"vcMomentsRequesterID"];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136316418;
      uint64_t v11 = v8;
      __int16 v12 = 2080;
      uint64_t v13 = "-[VCSession(Messaging) setupMomentsMessages]_block_invoke";
      __int16 v14 = 1024;
      int v15 = 325;
      __int16 v16 = 2112;
      int v17 = a2;
      __int16 v18 = 2112;
      uint64_t v19 = a4;
      __int16 v20 = 2112;
      uint64_t v21 = v7;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d moment message %@ from participantId:[%@] participantUUID:[%@]", (uint8_t *)&v10, 0x3Au);
    }
  }
  if (a2)
  {
    [v6 didReceiveMomentsRequest:a2];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __44__VCSession_Messaging__setupMomentsMessages__block_invoke_cold_1();
    }
  }
}

- (void)setupVideoRedundancyMessages
{
  void v5[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  sessionMessaging = self->_sessionMessaging;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __52__VCSession_Messaging__setupVideoRedundancyMessages__block_invoke;
  v5[3] = &unk_1E6DB75C0;
  v5[4] = v3;
  [(VCSessionMessaging *)sessionMessaging addTopic:@"VCSessionMessageTopicVideoRedundancyState" associatedStrings:&unk_1F3DC8868 allowConcurrent:0 receiveHandler:v5];
}

void __52__VCSession_Messaging__setupVideoRedundancyMessages__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  BOOL v6 = (void *)[*(id *)(a1 + 32) strong];
  uint64_t v7 = objc_msgSend((id)objc_msgSend(v6, "remoteParticipantsMapByServerID"), "objectForKeyedSubscript:", a4);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136316930;
      uint64_t v11 = v8;
      __int16 v12 = 2080;
      uint64_t v13 = "-[VCSession(Messaging) setupVideoRedundancyMessages]_block_invoke";
      __int16 v14 = 1024;
      int v15 = 342;
      __int16 v16 = 2112;
      uint64_t v17 = [v6 uuid];
      __int16 v18 = 1024;
      int v19 = [v6 transportSessionID];
      __int16 v20 = 2112;
      uint64_t v21 = a4;
      __int16 v22 = 2112;
      uint64_t v23 = [v7 uuid];
      __int16 v24 = 2080;
      uint64_t v25 = [a2 UTF8String];
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCSession[%@] transportSessionID[%u] participantId:[%@] participantUUID[%@] receives message:%s", (uint8_t *)&v10, 0x4Au);
    }
  }
}

- (void)setupPreferredInterfaceMessage
{
  void v5[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  sessionMessaging = self->_sessionMessaging;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __54__VCSession_Messaging__setupPreferredInterfaceMessage__block_invoke;
  v5[3] = &unk_1E6DB9610;
  v5[4] = v3;
  [(VCSessionMessaging *)sessionMessaging addTopic:@"VCPreferredInterfaceMessageTopic" associatedStrings:0 allowConcurrent:0 sendMessageDictionaryCompletionHandler:0 receiveMessageDictionaryHandler:v5];
}

void __54__VCSession_Messaging__setupPreferredInterfaceMessage__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  BOOL v6 = (void *)[*(id *)(a1 + 32) strong];
  uint64_t v7 = objc_msgSend((id)objc_msgSend(v6, "remoteParticipantsMapByServerID"), "objectForKeyedSubscript:", a4);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136316930;
      uint64_t v13 = v8;
      __int16 v14 = 2080;
      int v15 = "-[VCSession(Messaging) setupPreferredInterfaceMessage]_block_invoke";
      __int16 v16 = 1024;
      int v17 = 356;
      __int16 v18 = 2112;
      uint64_t v19 = [v6 uuid];
      __int16 v20 = 1024;
      int v21 = [v6 transportSessionID];
      __int16 v22 = 2112;
      uint64_t v23 = a4;
      __int16 v24 = 2112;
      uint64_t v25 = [v7 uuid];
      __int16 v26 = 2112;
      uint64_t v27 = a2;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCSession[%@] transportSessionID[%u] idsParticipantID[%@] participantUUID[%@] receives message[%@]", (uint8_t *)&v12, 0x4Au);
    }
  }
  if (a2)
  {
    unsigned __int8 v10 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"VCPreferredInterfaceKey"), "unsignedIntValue");
    uint64_t v11 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"VCPreferredInterfaceDuplicatingKey"), "BOOLValue");
    if (objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"VCPreferredInterfaceMediaUnrecoverableSignalKey"), "BOOLValue"))
    {
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "transportSession"), "connectionManager"), "updateWithRemoteMediaHealthDuplication:", v11);
    }
    else
    {
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "transportSession"), "connectionManager"), "setPreferredRemoteInterfaceForDuplication:", v10);
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "transportSession"), "connectionManager"), "processRemoteWRMSuggestion:isRemoteDuplicating:", v10 == 0, v11);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __54__VCSession_Messaging__setupPreferredInterfaceMessage__block_invoke_cold_1();
    }
  }
}

- (void)setupPiPStateChangeMessage
{
  void v5[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  sessionMessaging = self->_sessionMessaging;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __50__VCSession_Messaging__setupPiPStateChangeMessage__block_invoke;
  v5[3] = &unk_1E6DB9610;
  v5[4] = v3;
  [(VCSessionMessaging *)sessionMessaging addTopic:@"VCWindowStateChange" associatedStrings:0 allowConcurrent:1 sendMessageDictionaryCompletionHandler:0 receiveMessageDictionaryHandler:v5];
}

void *__50__VCSession_Messaging__setupPiPStateChangeMessage__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t result = (void *)[*(id *)(a1 + 32) strong];
  if (a2)
  {
    uint64_t v4 = result;
    uint64_t v5 = (void *)[a2 objectForKeyedSubscript:@"VCWindowState"];
    BOOL v6 = (void *)[a2 objectForKeyedSubscript:@"VCWindowWidth"];
    uint64_t v7 = (void *)[a2 objectForKeyedSubscript:@"VCWindowHeight"];
    uint64_t v8 = (void *)[a2 objectForKeyedSubscript:@"VCWindowOriginX"];
    uint64_t v9 = (void *)[a2 objectForKeyedSubscript:@"VCWindowOriginY"];
    uint64_t v10 = [v5 intValue];
    double v11 = *MEMORY[0x1E4F1DB28];
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    if (v6 && v7)
    {
      [v8 doubleValue];
      double v11 = v15;
      [v9 doubleValue];
      double v12 = v16;
      [v6 doubleValue];
      double v13 = v17;
      [v7 doubleValue];
      double v14 = v18;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      __int16 v20 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 136315906;
        uint64_t v22 = v19;
        __int16 v23 = 2080;
        __int16 v24 = "-[VCSession(Messaging) setupPiPStateChangeMessage]_block_invoke";
        __int16 v25 = 1024;
        int v26 = 396;
        __int16 v27 = 2112;
        uint64_t v28 = a2;
        _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCSession received message about PIP State change:%@", (uint8_t *)&v21, 0x26u);
      }
    }
    uint64_t result = (void *)[v4 localParticipant];
    if (v5 && (v10 & 0x80000000) == 0 && (int)v10 <= 2) {
      return objc_msgSend(result, "updateWindowState:isLocal:windowRect:", v10, 0, v11, v12, v13, v14);
    }
  }
  return result;
}

- (void)setupDisconnectMessage
{
  void v5[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  sessionMessaging = self->_sessionMessaging;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __46__VCSession_Messaging__setupDisconnectMessage__block_invoke;
  v5[3] = &unk_1E6DB75C0;
  v5[4] = v3;
  [(VCSessionMessaging *)sessionMessaging addTopic:@"VCDisconnectMessage" associatedStrings:0 allowConcurrent:0 receiveHandler:v5];
}

uint64_t __46__VCSession_Messaging__setupDisconnectMessage__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[*(id *)(a1 + 32) strong];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v10 = v6;
      __int16 v11 = 2080;
      double v12 = "-[VCSession(Messaging) setupDisconnectMessage]_block_invoke";
      __int16 v13 = 1024;
      int v14 = 412;
      __int16 v15 = 1024;
      int v16 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "transportSession"), "connectionManager"), "callID");
      __int16 v17 = 2112;
      uint64_t v18 = a4;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCSession callID[%u] received 'disconnect' message from remote participant '%@'", buf, 0x2Cu);
    }
  }
  return [v5 stopWithError:+[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", 22, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession+Messaging.m", 413), 0), 1 didRemoteCancel];
}

- (void)setupMediaQualityDegradedMessage
{
  void v5[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  sessionMessaging = self->_sessionMessaging;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __56__VCSession_Messaging__setupMediaQualityDegradedMessage__block_invoke;
  v5[3] = &unk_1E6DB75C0;
  v5[4] = v3;
  [(VCSessionMessaging *)sessionMessaging addTopic:@"VCMediaQualityDegradedMessageTopic" associatedStrings:&unk_1F3DC8880 allowConcurrent:0 receiveHandler:v5];
}

void __56__VCSession_Messaging__setupMediaQualityDegradedMessage__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v6 = (void *)[*(id *)(a1 + 32) strong];
    uint64_t v7 = objc_msgSend((id)objc_msgSend(v6, "remoteParticipantsMapByServerID"), "objectForKeyedSubscript:", a4);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136316930;
        uint64_t v13 = v8;
        __int16 v14 = 2080;
        __int16 v15 = "-[VCSession(Messaging) setupMediaQualityDegradedMessage]_block_invoke";
        __int16 v16 = 1024;
        int v17 = 428;
        __int16 v18 = 2112;
        uint64_t v19 = [v6 uuid];
        __int16 v20 = 1024;
        int v21 = [v6 transportSessionID];
        __int16 v22 = 2112;
        uint64_t v23 = a4;
        __int16 v24 = 2112;
        uint64_t v25 = [v7 uuid];
        __int16 v26 = 2080;
        uint64_t v27 = [a2 UTF8String];
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCSession=%@ transportSessionID=%u participantId=%@ participantUUID=%@ receives message=%s", (uint8_t *)&v12, 0x4Au);
      }
    }
    if ([a2 isEqualToString:@"VCMediaQualityDegraded"])
    {
      uint64_t v10 = objc_msgSend((id)objc_msgSend(v6, "transportSession"), "connectionManager");
      uint64_t v11 = 1;
LABEL_12:
      [v10 setIsRemoteMediaQualityDegraded:v11];
      return;
    }
    if ([a2 isEqualToString:@"VCMediaQualityRecovered"])
    {
      uint64_t v10 = objc_msgSend((id)objc_msgSend(v6, "transportSession"), "connectionManager");
      uint64_t v11 = 0;
      goto LABEL_12;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __56__VCSession_Messaging__setupMediaQualityDegradedMessage__block_invoke_cold_2();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __56__VCSession_Messaging__setupMediaQualityDegradedMessage__block_invoke_cold_1();
    }
  }
}

- (void)setupNetworkQualityDegradedMessage
{
  void v5[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  sessionMessaging = self->_sessionMessaging;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __58__VCSession_Messaging__setupNetworkQualityDegradedMessage__block_invoke;
  v5[3] = &unk_1E6DB75C0;
  v5[4] = v3;
  [(VCSessionMessaging *)sessionMessaging addTopic:@"VCNetworkQualityDegradedMessageTopic" associatedStrings:&unk_1F3DC8898 allowConcurrent:0 receiveHandler:v5];
}

void __58__VCSession_Messaging__setupNetworkQualityDegradedMessage__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v6 = (void *)[*(id *)(a1 + 32) strong];
    uint64_t v7 = objc_msgSend((id)objc_msgSend(v6, "remoteParticipantsMapByServerID"), "objectForKeyedSubscript:", a4);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136316930;
        uint64_t v13 = v8;
        __int16 v14 = 2080;
        __int16 v15 = "-[VCSession(Messaging) setupNetworkQualityDegradedMessage]_block_invoke";
        __int16 v16 = 1024;
        int v17 = 451;
        __int16 v18 = 2112;
        uint64_t v19 = [v6 uuid];
        __int16 v20 = 1024;
        int v21 = [v6 transportSessionID];
        __int16 v22 = 2112;
        uint64_t v23 = a4;
        __int16 v24 = 2112;
        uint64_t v25 = [v7 uuid];
        __int16 v26 = 2080;
        uint64_t v27 = [a2 UTF8String];
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCSession=%@ transportSessionID=%u participantId=%@ participantUUID=%@ receives message=%s", (uint8_t *)&v12, 0x4Au);
      }
    }
    if ([a2 isEqualToString:@"VCNetworkQualityDegraded"])
    {
      uint64_t v10 = objc_msgSend((id)objc_msgSend(v6, "transportSession"), "connectionManager");
      uint64_t v11 = 1;
LABEL_12:
      [v10 setIsRemoteNetworkQualityDegraded:v11];
      return;
    }
    if ([a2 isEqualToString:@"VCNetworkQualityRecovered"])
    {
      uint64_t v10 = objc_msgSend((id)objc_msgSend(v6, "transportSession"), "connectionManager");
      uint64_t v11 = 0;
      goto LABEL_12;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __58__VCSession_Messaging__setupNetworkQualityDegradedMessage__block_invoke_cold_2();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __58__VCSession_Messaging__setupNetworkQualityDegradedMessage__block_invoke_cold_1();
    }
  }
}

- (void)setupDeviceStateMessage
{
  void v5[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  sessionMessaging = self->_sessionMessaging;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __47__VCSession_Messaging__setupDeviceStateMessage__block_invoke;
  v5[3] = &unk_1E6DB9610;
  v5[4] = v3;
  [(VCSessionMessaging *)sessionMessaging addTopic:@"VCSessionMessageTopicDeviceState" associatedStrings:0 allowConcurrent:0 requireReliable:1 sendMessageDictionaryCompletionHandler:0 receiveMessageDictionaryHandler:v5];
}

void __47__VCSession_Messaging__setupDeviceStateMessage__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void v8[7] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [*(id *)(a1 + 32) strong];
  uint64_t v7 = *(NSObject **)(v6 + 176);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __47__VCSession_Messaging__setupDeviceStateMessage__block_invoke_2;
  v8[3] = &unk_1E6DB43D8;
  void v8[4] = v6;
  v8[5] = a2;
  void v8[6] = a4;
  dispatch_async(v7, v8);
}

uint64_t __47__VCSession_Messaging__setupDeviceStateMessage__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleDeviceStateMessage:*(void *)(a1 + 40) forParticipantId:*(void *)(a1 + 48)];
}

- (void)handleDeviceStateMessage:(id)a3 forParticipantId:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sessionQueue);
  if (a3)
  {
    uint64_t v7 = (void *)[(NSMutableDictionary *)self->_remoteParticipantsMapByServerID objectForKeyedSubscript:a4];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = [v7 uuid];
      int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if (v9)
      {
        if (ErrorLogLevelForModule >= 7)
        {
          __str = 0;
          asprintf(&__str, "%s", (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String"));
          if (__str)
          {
            __lasts = 0;
            uint64_t v11 = strtok_r(__str, "\n", &__lasts);
            int v12 = (os_log_t *)MEMORY[0x1E4F47A50];
            do
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                uint64_t v13 = VRTraceErrorLogLevelToCSTR();
                __int16 v14 = *v12;
                if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136316162;
                  uint64_t v19 = v13;
                  __int16 v20 = 2080;
                  int v21 = "-[VCSession(Messaging) handleDeviceStateMessage:forParticipantId:]";
                  __int16 v22 = 1024;
                  int v23 = 486;
                  __int16 v24 = 2080;
                  uint64_t v25 = "Received State Update:";
                  __int16 v26 = 2080;
                  uint64_t v27 = v11;
                  _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
                }
              }
              uint64_t v11 = strtok_r(0, "\n", &__lasts);
            }
            while (v11);
            free(__str);
          }
        }
        uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
        if ([a3 objectForKeyedSubscript:@"Thermal"]) {
          [(VCSession *)self reportKeysForDeviceStateMessage:362 stateMessage:a3 InPayload:v15 ForParitcipant:v8];
        }
        if ([a3 objectForKeyedSubscript:@"sliceStatus"]) {
          [(VCSession *)self reportKeysForDeviceStateMessage:38 stateMessage:a3 InPayload:v15 ForParitcipant:v8];
        }
      }
      else if (ErrorLogLevelForModule >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSession(Messaging) handleDeviceStateMessage:forParticipantId:]();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSession(Messaging) handleDeviceStateMessage:forParticipantId:]();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCSession(Messaging) handleDeviceStateMessage:forParticipantId:]();
    }
  }
}

- (void)reportKeysForDeviceStateMessage:(unsigned __int16)a3 stateMessage:(id)a4 InPayload:(id)a5 ForParitcipant:(id)a6
{
  if (a3 == 362)
  {
    uint64_t v10 = @"Thermal";
    uint64_t v9 = @"Thermal";
  }
  else
  {
    if (a3 != 38) {
      goto LABEL_6;
    }
    uint64_t v9 = @"RemoteSliceStatus";
    uint64_t v10 = @"sliceStatus";
  }
  objc_msgSend(a5, "setObject:forKeyedSubscript:", objc_msgSend(a6, "uuid"), @"VCSPUUID");
  objc_msgSend(a5, "setObject:forKeyedSubscript:", objc_msgSend(a4, "objectForKeyedSubscript:", v10), v9);
LABEL_6:
  [(VCObject *)self reportingAgent];

  reportingGenericEvent();
}

- (void)handleNetworkCapabilityMessage:(id)a3 forParticipantId:(id)a4
{
  uint64_t v6 = self;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sessionQueue);
  if (a3)
  {
    uint64_t v7 = (void *)[(NSMutableDictionary *)v6->_remoteParticipantsMapByServerID objectForKeyedSubscript:a4];
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v7)
    {
      if (ErrorLogLevelForModule >= 7)
      {
        __str = 0;
        asprintf(&__str, "%s", (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String"));
        if (__str)
        {
          __int16 v14 = v6;
          __lasts = 0;
          uint64_t v9 = strtok_r(__str, "\n", &__lasts);
          uint64_t v10 = (os_log_t *)MEMORY[0x1E4F47A50];
          do
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v11 = VRTraceErrorLogLevelToCSTR();
              int v12 = *v10;
              if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136316162;
                uint64_t v20 = v11;
                __int16 v21 = 2080;
                __int16 v22 = "-[VCSession(Messaging) handleNetworkCapabilityMessage:forParticipantId:]";
                __int16 v23 = 1024;
                int v24 = 530;
                __int16 v25 = 2080;
                __int16 v26 = "Received State Update:";
                __int16 v27 = 2080;
                uint64_t v28 = v9;
                _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
              }
            }
            uint64_t v9 = strtok_r(0, "\n", &__lasts);
          }
          while (v9);
          free(__str);
          uint64_t v6 = v14;
        }
      }
      if ([v7 uuid]
        && [a3 objectForKeyedSubscript:@"RCEV"]
        && [a3 objectForKeyedSubscript:@"RCEG"])
      {
        v17[0] = @"VCSPUUID";
        v18[0] = [v7 uuid];
        v17[1] = @"RCEV";
        v18[1] = [a3 objectForKeyedSubscript:@"RCEV"];
        v17[2] = @"RCEG";
        v18[2] = [a3 objectForKeyedSubscript:@"RCEG"];
        id v13 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v18, v17, 3), "mutableCopy");
        if ([a3 objectForKeyedSubscript:@"SBVERS"]) {
          objc_msgSend(v13, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"SBVERS"), @"SBVERS");
        }
        if ([a3 objectForKeyedSubscript:@"RULRTX"]) {
          objc_msgSend(v13, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"RULRTX"), @"RULRTX");
        }
        if ([a3 objectForKeyedSubscript:@"RTLE"]) {
          objc_msgSend(v13, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"RTLE"), @"RTLE");
        }
        if ([a3 objectForKeyedSubscript:@"MQSchP"]) {
          objc_msgSend(v13, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", @"MQSchP"), @"MQSchP");
        }
        [(VCObject *)v6 reportingAgent];
        reportingGenericEvent();
      }
    }
    else if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSession(Messaging) handleNetworkCapabilityMessage:forParticipantId:]();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCSession(Messaging) handleNetworkCapabilityMessage:forParticipantId:]();
    }
  }
}

- (void)setupNetworkCapabilityMessage
{
  void v5[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  sessionMessaging = self->_sessionMessaging;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __53__VCSession_Messaging__setupNetworkCapabilityMessage__block_invoke;
  v5[3] = &unk_1E6DB9610;
  v5[4] = v3;
  [(VCSessionMessaging *)sessionMessaging addTopic:@"VCSessionMessageTopicRateControlConfig" associatedStrings:0 allowConcurrent:0 sendMessageDictionaryCompletionHandler:0 receiveMessageDictionaryHandler:v5];
}

void __53__VCSession_Messaging__setupNetworkCapabilityMessage__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void v8[7] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [*(id *)(a1 + 32) strong];
  uint64_t v7 = *(NSObject **)(v6 + 176);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __53__VCSession_Messaging__setupNetworkCapabilityMessage__block_invoke_2;
  v8[3] = &unk_1E6DB43D8;
  void v8[4] = v6;
  v8[5] = a2;
  void v8[6] = a4;
  dispatch_async(v7, v8);
}

uint64_t __53__VCSession_Messaging__setupNetworkCapabilityMessage__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleNetworkCapabilityMessage:*(void *)(a1 + 40) forParticipantId:*(void *)(a1 + 48)];
}

- (void)dispatchedRemoteCellTechStateUpdate:(id)a3 maxRemoteBitrate:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sessionQueue);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136316162;
      uint64_t v10 = v7;
      __int16 v11 = 2080;
      int v12 = "-[VCSession(Messaging) dispatchedRemoteCellTechStateUpdate:maxRemoteBitrate:]";
      __int16 v13 = 1024;
      int v14 = 573;
      __int16 v15 = 1024;
      int v16 = [a3 intValue];
      __int16 v17 = 1024;
      int v18 = [a4 unsignedIntValue];
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCSession received message about CellTech change :%d, remote bitrate %u", (uint8_t *)&v9, 0x28u);
    }
  }
  -[VCSession remoteCellTechStateUpdate:maxRemoteBitrate:](self, "remoteCellTechStateUpdate:maxRemoteBitrate:", [a3 intValue], objc_msgSend(a4, "unsignedIntValue"));
}

- (void)remoteCellTechStateUpdate:(int)a3 maxRemoteBitrate:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a3 && a3 < 10)
  {
    uint64_t v7 = CelltechToStr();
    uint64_t v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F47A30], "weakObjectHolderWithObject:", self), "strong");
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "transportSession"), "connectionManager"), "updateCellularTech:forLocalInterface:", v4, 0);
    [v8 configureOneToOneRateController:self->_currentActiveConnection];
    if (([v8 isOneToOneUsingVideo] & 1) != 0 || objc_msgSend(v8, "isOneToOneUsingScreen")) {
      int v9 = [(VCConnectionProtocol *)self->_currentActiveConnection uplinkBitrateCapOneToOne];
    }
    else {
      int v9 = [(VCConnectionProtocol *)self->_currentActiveConnection uplinkAudioBitrateCapOneToOne];
    }
    int v10 = v9;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      int v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136316418;
        uint64_t v14 = v11;
        __int16 v15 = 2080;
        int v16 = "-[VCSession(Messaging) remoteCellTechStateUpdate:maxRemoteBitrate:]";
        __int16 v17 = 1024;
        int v18 = 595;
        __int16 v19 = 2080;
        uint64_t v20 = v7;
        __int16 v21 = 1024;
        int v22 = v10;
        __int16 v23 = 1024;
        unsigned int v24 = a4;
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCSession: Remote CellTech has changed %s, max bitrate %u, max remote bitrate %u", (uint8_t *)&v13, 0x32u);
      }
    }
    [(VCSessionParticipantLocal *)self->_localParticipant handleActiveConnectionChange:self->_currentActiveConnection];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCSession(Messaging) remoteCellTechStateUpdate:maxRemoteBitrate:]();
    }
  }
}

- (void)setupCellTechChangeMessages
{
  void v5[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  sessionMessaging = self->_sessionMessaging;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __51__VCSession_Messaging__setupCellTechChangeMessages__block_invoke;
  v5[3] = &unk_1E6DB9610;
  v5[4] = v3;
  [(VCSessionMessaging *)sessionMessaging addTopic:@"VCCellTechChangeTopic" associatedStrings:0 allowConcurrent:1 sendMessageDictionaryCompletionHandler:0 receiveMessageDictionaryHandler:v5];
}

void __51__VCSession_Messaging__setupCellTechChangeMessages__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      return;
    }
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v12 = v6;
    __int16 v13 = 2080;
    uint64_t v14 = "-[VCSession(Messaging) setupCellTechChangeMessages]_block_invoke";
    __int16 v15 = 1024;
    int v16 = 608;
    uint64_t v8 = " [%s] %s:%d Cell tech message is nil ";
LABEL_12:
    _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 0x1Cu);
    return;
  }
  if (![a2 objectForKeyedSubscript:@"VCCellTechKey"])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      return;
    }
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v12 = v9;
    __int16 v13 = 2080;
    uint64_t v14 = "-[VCSession(Messaging) setupCellTechChangeMessages]_block_invoke";
    __int16 v15 = 1024;
    int v16 = 609;
    uint64_t v8 = " [%s] %s:%d Cell tech is nil";
    goto LABEL_12;
  }
  uint64_t v4 = [*(id *)(a1 + 32) strong];
  if (v4)
  {
    uint64_t v5 = *(NSObject **)(v4 + 176);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __51__VCSession_Messaging__setupCellTechChangeMessages__block_invoke_225;
    v10[3] = &unk_1E6DB3E40;
    v10[4] = v4;
    v10[5] = a2;
    dispatch_async(v5, v10);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __51__VCSession_Messaging__setupCellTechChangeMessages__block_invoke_cold_1();
    }
  }
}

uint64_t __51__VCSession_Messaging__setupCellTechChangeMessages__block_invoke_225(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"VCCellTechKey"];
  uint64_t v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"VCMaxBitrateKey"];

  return [v2 dispatchedRemoteCellTechStateUpdate:v3 maxRemoteBitrate:v4];
}

- (void)setupLinkConstrainsChangedMessages
{
  void v5[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  sessionMessaging = self->_sessionMessaging;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __58__VCSession_Messaging__setupLinkConstrainsChangedMessages__block_invoke;
  v5[3] = &unk_1E6DB9610;
  v5[4] = v3;
  [(VCSessionMessaging *)sessionMessaging addTopic:@"VCSessionMessageTopicLinkConstrainesChanged" associatedStrings:0 allowConcurrent:1 sendMessageDictionaryCompletionHandler:0 receiveMessageDictionaryHandler:v5];
}

void *__58__VCSession_Messaging__setupLinkConstrainsChangedMessages__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = (void *)[*(id *)(a1 + 32) strong];
  if (a2)
  {
    uint64_t v4 = result;
    [result applyRemoteLinkConstrains:a2];
    uint64_t v5 = [v4 currentActiveConnection];
    return (void *)[v4 configureOneToOneRateController:v5];
  }
  return result;
}

- (void)setupReactionMessages
{
  v7[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  sessionMessaging = self->_sessionMessaging;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__VCSession_Messaging__setupReactionMessages__block_invoke;
  void v7[3] = &unk_1E6DB9610;
  void v7[4] = v3;
  [(VCSessionMessaging *)sessionMessaging addTopic:@"VCSessionMessageTopicReaction" associatedStrings:0 allowConcurrent:1 sendMessageDictionaryCompletionHandler:0 receiveMessageDictionaryHandler:v7];
  uint64_t v5 = self->_sessionMessaging;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__VCSession_Messaging__setupReactionMessages__block_invoke_242;
  void v6[3] = &unk_1E6DB9610;
  v6[4] = v3;
  [(VCSessionMessaging *)v5 addTopic:@"VCSessionMessageReactionStateTopic" associatedStrings:0 allowConcurrent:1 sendMessageDictionaryCompletionHandler:0 receiveMessageDictionaryHandler:v6];
}

void __45__VCSession_Messaging__setupReactionMessages__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void v8[7] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v6 = [*(id *)(a1 + 32) strong];
    uint64_t v7 = *(NSObject **)(v6 + 176);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __45__VCSession_Messaging__setupReactionMessages__block_invoke_235;
    v8[3] = &unk_1E6DB43D8;
    void v8[4] = v6;
    v8[5] = a4;
    void v8[6] = a2;
    dispatch_async(v7, v8);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __45__VCSession_Messaging__setupReactionMessages__block_invoke_cold_1();
    }
  }
}

void __45__VCSession_Messaging__setupReactionMessages__block_invoke_235(uint64_t a1)
{
  uint64_t v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "remoteParticipantsMapByServerID"), "objectForKeyedSubscript:", *(void *)(a1 + 40));
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    uint64_t v4 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"VCReactionStartedType"];
    [v3 reactionDidStart:v4];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __45__VCSession_Messaging__setupReactionMessages__block_invoke_235_cold_1();
    }
  }
}

void __45__VCSession_Messaging__setupReactionMessages__block_invoke_242(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v6 = [*(id *)(a1 + 32) strong];
    if (v6)
    {
      uint64_t v7 = *(NSObject **)(v6 + 176);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __45__VCSession_Messaging__setupReactionMessages__block_invoke_243;
      block[3] = &unk_1E6DB43D8;
      void block[4] = v6;
      void block[5] = a4;
      void block[6] = a2;
      dispatch_async(v7, block);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v12 = v8;
        __int16 v13 = 2080;
        uint64_t v14 = "-[VCSession(Messaging) setupReactionMessages]_block_invoke";
        __int16 v15 = 1024;
        int v16 = 669;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d strongSelf is nil", buf, 0x1Cu);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __45__VCSession_Messaging__setupReactionMessages__block_invoke_242_cold_1();
    }
  }
}

void __45__VCSession_Messaging__setupReactionMessages__block_invoke_243(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "remoteParticipantsMapByServerID"), "objectForKeyedSubscript:", *(void *)(a1 + 40));
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    uint64_t v4 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"VCSessionMessageReactionStarted"];
    uint64_t v5 = *(void **)(a1 + 48);
    if (v4)
    {
      uint64_t v6 = [v5 objectForKeyedSubscript:@"VCSessionMessageReactionStarted"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v3 reactionDidStart:v6];
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __45__VCSession_Messaging__setupReactionMessages__block_invoke_243_cold_2();
        }
      }
    }
    else if ([v5 objectForKeyedSubscript:@"VCSessionMessageReactionStopped"])
    {
      [v3 didStopReacting];
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(a1 + 48);
        int v10 = 136315906;
        uint64_t v11 = v7;
        __int16 v12 = 2080;
        __int16 v13 = "-[VCSession(Messaging) setupReactionMessages]_block_invoke";
        __int16 v14 = 1024;
        int v15 = 690;
        __int16 v16 = 2112;
        uint64_t v17 = v9;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unsupported reaction state %@", (uint8_t *)&v10, 0x26u);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __45__VCSession_Messaging__setupReactionMessages__block_invoke_243_cold_1();
    }
  }
}

+ (id)mediaStateMessageStreamGroupKeysForMediaType:(unsigned int)a3
{
  switch(a3)
  {
    case 0u:
      uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v4 = [&unk_1F3DC6408 stringValue];
      uint64_t v5 = &unk_1F3DC6420;
      goto LABEL_17;
    case 1u:
      uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v4 = [&unk_1F3DC6438 stringValue];
      uint64_t v5 = &unk_1F3DC6450;
      goto LABEL_17;
    case 2u:
      uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v9 = &unk_1F3DC6468;
      goto LABEL_11;
    case 3u:
      uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v9 = &unk_1F3DC6480;
      goto LABEL_11;
    case 4u:
      uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v9 = &unk_1F3DC6498;
      goto LABEL_11;
    case 5u:
      uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v9 = &unk_1F3DC64B0;
LABEL_11:
      uint64_t v10 = [v9 stringValue];
      return (id)[v8 setWithObject:v10];
    case 6u:
      uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v11 = &unk_1F3DC64C8;
      goto LABEL_16;
    case 7u:
      uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v11 = &unk_1F3DC64F8;
LABEL_16:
      uint64_t v4 = [v11 stringValue];
      uint64_t v5 = &unk_1F3DC64E0;
LABEL_17:
      id result = (id)objc_msgSend(v3, "setWithObjects:", v4, objc_msgSend(v5, "stringValue"), 0);
      break;
    case 8u:
      id result = (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_msgSend(&unk_1F3DC64E0, "stringValue"), 0, v12);
      break;
    default:
      uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
      id result = (id)[v6 set];
      break;
  }
  return result;
}

+ (id)mediaStateMessageKeyForMediaType:(unsigned int)a3
{
  if (a3 > 8) {
    return 0;
  }
  else {
    return (id)[off_1E6DB9658[a3] stringValue];
  }
}

+ (unsigned)mediaTypeForMediaStateMessageKey:(id)a3
{
  int v3 = [a3 unsignedIntValue];
  unsigned int result = 0;
  if (!(!v6 & v5))
  {
    switch(v3)
    {
      case 1:
      case 5:
        goto LABEL_6;
      case 2:
      case 6:
        return result;
      case 3:
        goto LABEL_8;
      case 4:
        goto LABEL_9;
      case 7:
        goto LABEL_10;
      case 8:
        goto LABEL_11;
      case 9:
      case 10:
        goto LABEL_7;
      case 11:
        goto LABEL_12;
      default:
        JUMPOUT(0);
    }
  }
  switch(v3)
  {
    case 128:
LABEL_6:
      unsigned int result = 1;
      break;
    case 129:
      return result;
    case 130:
LABEL_8:
      unsigned int result = 2;
      break;
    case 131:
LABEL_9:
      unsigned int result = 3;
      break;
    case 132:
LABEL_10:
      unsigned int result = 4;
      break;
    case 133:
LABEL_11:
      unsigned int result = 5;
      break;
    case 134:
      unsigned int result = 6;
      break;
    case 135:
LABEL_12:
      unsigned int result = 7;
      break;
    case 136:
      unsigned int result = 8;
      break;
    case 140:
LABEL_7:
      unsigned int result = -2;
      break;
    default:
      unsigned int result = -1;
      break;
  }
  return result;
}

+ (id)mediaStateMessageValueForMediaState:(unsigned int)a3
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return (id)qword_1E6DB96A0[a3];
  }
}

+ (unsigned)mediaStateForMediaStateMessageValue:(id)a3
{
  unsigned int result = [a3 unsignedIntValue];
  if (result >= 3) {
    return -1;
  }
  return result;
}

- (void)updateStateMessage:(id)a3 stateState:(unsigned int)a4 streamGroupKey:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v8 = (void *)[a3 objectForKeyedSubscript:a5];
  if (!v8 || (int v9 = [v8 unsignedIntValue]) == 0 || v9 == 2 && v6 == 1)
  {
    uint64_t v10 = [NSNumber numberWithUnsignedInt:v6];
    [a3 setObject:v10 forKeyedSubscript:a5];
  }
}

- (id)stateMessageWithSupportsNestedDictionary:(BOOL)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v5 = 0;
  do
  {
    uint64_t v6 = [(VCSessionParticipantLocal *)self->_localParticipant mediaStateForMediaType:v5];
    id v7 = +[VCSession mediaStateMessageValueForMediaState:v6];
    if (v7)
    {
      id v8 = v7;
      id v9 = +[VCSession mediaStateMessageKeyForMediaType:v5];
      if (v9)
      {
        [v4 setObject:v8 forKeyedSubscript:v9];
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v10 = +[VCSession mediaStateMessageStreamGroupKeysForMediaType:v5];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v51 objects:v50 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v52;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v52 != v13) {
                objc_enumerationMutation(v10);
              }
              [(VCSession *)self updateStateMessage:v4 stateState:v6 streamGroupKey:*(void *)(*((void *)&v51 + 1) + 8 * i)];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v51 objects:v50 count:16];
          }
          while (v12);
        }
        if ((VCSession *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v36 = VRTraceErrorLogLevelToCSTR();
            __int16 v37 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              id v38 = VCSessionMediaType_Name(v5);
              __int16 v39 = VCSessionMediaState_Name(v6);
              *(_DWORD *)buf = 136316162;
              uint64_t v56 = v36;
              __int16 v57 = 2080;
              uint32_t v58 = "-[VCSession(Messaging) stateMessageWithSupportsNestedDictionary:]";
              __int16 v59 = 1024;
              int v60 = 853;
              __int16 v61 = 2112;
              long long v62 = v38;
              __int16 v63 = 2112;
              uint32_t v64 = (VCSession *)v39;
              uint64_t v20 = v37;
              __int16 v21 = " [%s] %s:%d Sending State Update: mediaType=%@ mediaState=%@";
              uint32_t v22 = 48;
              goto LABEL_33;
            }
          }
        }
        else
        {
          int v15 = &stru_1F3D3E450;
          if (objc_opt_respondsToSelector()) {
            int v15 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v16 = VRTraceErrorLogLevelToCSTR();
            uint64_t v17 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v18 = VCSessionMediaType_Name(v5);
              __int16 v19 = VCSessionMediaState_Name(v6);
              *(_DWORD *)buf = 136316674;
              uint64_t v56 = v16;
              __int16 v57 = 2080;
              uint32_t v58 = "-[VCSession(Messaging) stateMessageWithSupportsNestedDictionary:]";
              __int16 v59 = 1024;
              int v60 = 853;
              __int16 v61 = 2112;
              long long v62 = v15;
              __int16 v63 = 2048;
              uint32_t v64 = self;
              __int16 v65 = 2112;
              uint64_t v66 = v18;
              __int16 v67 = 2112;
              uint64_t v68 = v19;
              uint64_t v20 = v17;
              __int16 v21 = " [%s] %s:%d %@(%p) Sending State Update: mediaType=%@ mediaState=%@";
              uint32_t v22 = 68;
LABEL_33:
              _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, v22);
            }
          }
        }
      }
      else if ((VCSession *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v44 = VRTraceErrorLogLevelToCSTR();
          uint32_t v45 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            __int16 v46 = VCSessionMediaType_Name(v5);
            uint64_t v47 = VCSessionMediaState_Name(v6);
            *(_DWORD *)buf = 136316162;
            uint64_t v56 = v44;
            __int16 v57 = 2080;
            uint32_t v58 = "-[VCSession(Messaging) stateMessageWithSupportsNestedDictionary:]";
            __int16 v59 = 1024;
            int v60 = 844;
            __int16 v61 = 2112;
            long long v62 = v46;
            __int16 v63 = 2112;
            uint32_t v64 = (VCSession *)v47;
            uint64_t v28 = v45;
            uint64_t v29 = " [%s] %s:%d Sending State Update: Failed to add message entry for mediaType=%@ mediaState=%@. Key is nil.";
            goto LABEL_40;
          }
        }
      }
      else
      {
        id v30 = &stru_1F3D3E450;
        if (objc_opt_respondsToSelector()) {
          id v30 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v31 = VRTraceErrorLogLevelToCSTR();
          uint64_t v32 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            __int16 v33 = VCSessionMediaType_Name(v5);
            BOOL v34 = VCSessionMediaState_Name(v6);
            *(_DWORD *)buf = 136316674;
            uint64_t v56 = v31;
            __int16 v57 = 2080;
            uint32_t v58 = "-[VCSession(Messaging) stateMessageWithSupportsNestedDictionary:]";
            __int16 v59 = 1024;
            int v60 = 844;
            __int16 v61 = 2112;
            long long v62 = v30;
            __int16 v63 = 2048;
            uint32_t v64 = self;
            __int16 v65 = 2112;
            uint64_t v66 = v33;
            __int16 v67 = 2112;
            uint64_t v68 = v34;
            uint64_t v28 = v32;
            uint64_t v29 = " [%s] %s:%d %@(%p) Sending State Update: Failed to add message entry for mediaType=%@ mediaState=%@. Key is nil.";
LABEL_29:
            uint32_t v35 = 68;
LABEL_41:
            _os_log_error_impl(&dword_1E1EA4000, v28, OS_LOG_TYPE_ERROR, v29, buf, v35);
          }
        }
      }
    }
    else if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v40 = VRTraceErrorLogLevelToCSTR();
        __int16 v41 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          __int16 v42 = VCSessionMediaType_Name(v5);
          uint64_t v43 = VCSessionMediaState_Name(v6);
          *(_DWORD *)buf = 136316162;
          uint64_t v56 = v40;
          __int16 v57 = 2080;
          uint32_t v58 = "-[VCSession(Messaging) stateMessageWithSupportsNestedDictionary:]";
          __int16 v59 = 1024;
          int v60 = 839;
          __int16 v61 = 2112;
          long long v62 = v42;
          __int16 v63 = 2112;
          uint32_t v64 = (VCSession *)v43;
          uint64_t v28 = v41;
          uint64_t v29 = " [%s] %s:%d Sending State Update: Failed to add message entry for mediaType=%@ mediaState=%@. Value is nil.";
LABEL_40:
          uint32_t v35 = 48;
          goto LABEL_41;
        }
      }
    }
    else
    {
      __int16 v23 = &stru_1F3D3E450;
      if (objc_opt_respondsToSelector()) {
        __int16 v23 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v24 = VRTraceErrorLogLevelToCSTR();
        uint64_t v25 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          __int16 v26 = VCSessionMediaType_Name(v5);
          __int16 v27 = VCSessionMediaState_Name(v6);
          *(_DWORD *)buf = 136316674;
          uint64_t v56 = v24;
          __int16 v57 = 2080;
          uint32_t v58 = "-[VCSession(Messaging) stateMessageWithSupportsNestedDictionary:]";
          __int16 v59 = 1024;
          int v60 = 839;
          __int16 v61 = 2112;
          long long v62 = v23;
          __int16 v63 = 2048;
          uint32_t v64 = self;
          __int16 v65 = 2112;
          uint64_t v66 = v26;
          __int16 v67 = 2112;
          uint64_t v68 = v27;
          uint64_t v28 = v25;
          uint64_t v29 = " [%s] %s:%d %@(%p) Sending State Update: Failed to add message entry for mediaType=%@ mediaState=%@. Value is nil.";
          goto LABEL_29;
        }
      }
    }
    uint64_t v5 = (v5 + 1);
  }
  while (v5 != 9);
  if (a3) {
    [(VCSession *)self appendMediaTypeMixingListToMessageDictionary:v4];
  }
  return v4;
}

- (void)appendMediaTypeMixingListToMessageDictionary:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (__CFString *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v6 = [(VCSessionParticipant *)self->_localParticipant mediaTypeMixingList];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v7 = [(NSDictionary *)v6 countByEnumeratingWithState:&v32 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v6);
        }
        -[__CFString setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", *(void *)(*((void *)&v32 + 1) + 8 * i)), [*(id *)(*((void *)&v32 + 1) + 8 * i) stringValue]);
      }
      uint64_t v8 = [(NSDictionary *)v6 countByEnumeratingWithState:&v32 objects:v31 count:16];
    }
    while (v8);
  }
  if ([(__CFString *)v5 count])
  {
    objc_msgSend(a3, "setObject:forKeyedSubscript:", v5, objc_msgSend(&unk_1F3DC6600, "stringValue"));
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        uint64_t v13 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 136315906;
          uint64_t v20 = v12;
          __int16 v21 = 2080;
          uint32_t v22 = "-[VCSession(Messaging) appendMediaTypeMixingListToMessageDictionary:]";
          __int16 v23 = 1024;
          int v24 = 870;
          __int16 v25 = 2112;
          __int16 v26 = v5;
          __int16 v14 = " [%s] %s:%d Sending State Update: appending mediaTypeMixingList=%@";
          int v15 = v13;
          uint32_t v16 = 38;
LABEL_19:
          _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v19, v16);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v11 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v11 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v17 = VRTraceErrorLogLevelToCSTR();
        uint64_t v18 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 136316418;
          uint64_t v20 = v17;
          __int16 v21 = 2080;
          uint32_t v22 = "-[VCSession(Messaging) appendMediaTypeMixingListToMessageDictionary:]";
          __int16 v23 = 1024;
          int v24 = 870;
          __int16 v25 = 2112;
          __int16 v26 = v11;
          __int16 v27 = 2048;
          uint64_t v28 = self;
          __int16 v29 = 2112;
          id v30 = v5;
          __int16 v14 = " [%s] %s:%d %@(%p) Sending State Update: appending mediaTypeMixingList=%@";
          int v15 = v18;
          uint32_t v16 = 58;
          goto LABEL_19;
        }
      }
    }
  }
}

- (void)broadcastMediaStateUpdateMessage
{
  uint64_t v2 = self;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sessionQueue);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obuint64_t j = [(VCSession *)v2 remoteParticipants];
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v44 objects:v43 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    id v6 = 0;
    uint64_t v7 = *(void *)v45;
    __int16 v26 = v2;
    uint64_t v28 = *(void *)v45;
    do
    {
      uint64_t v8 = 0;
      uint64_t v29 = v4;
      do
      {
        if (*(void *)v45 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v44 + 1) + 8 * v8);
        [v9 capabilities];
        if (v10 == 2)
        {
          [v9 capabilities];
          uint64_t v12 = v11;
          if ((v11 & 0x1000000000000) == 0 || v6)
          {
            if ((v11 & 0x1000000000000) == 0 && !v5)
            {
              id v5 = [(VCSession *)v2 stateMessageWithSupportsNestedDictionary:0];
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                __str = 0;
                if (v5) {
                  __int16 v14 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
                }
                else {
                  __int16 v14 = "<nil>";
                }
                asprintf(&__str, "%s", v14);
                if (__str)
                {
                  __int16 v27 = v5;
                  __lasts = 0;
                  uint64_t v18 = strtok_r(__str, "\n", &__lasts);
                  do
                  {
                    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                    {
                      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
                      uint64_t v20 = *MEMORY[0x1E4F47A50];
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 136316162;
                        uint64_t v34 = v19;
                        __int16 v35 = 2080;
                        uint64_t v36 = "-[VCSession(Messaging) broadcastMediaStateUpdateMessage]";
                        __int16 v37 = 1024;
                        int v38 = 889;
                        __int16 v39 = 2080;
                        uint64_t v40 = "Sending State Update:";
                        __int16 v41 = 2080;
                        __int16 v42 = v18;
                        _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
                      }
                    }
                    uint64_t v18 = strtok_r(0, "\n", &__lasts);
                  }
                  while (v18);
LABEL_32:
                  free(__str);
                  id v5 = v27;
                }
LABEL_33:
                uint64_t v2 = v26;
              }
            }
          }
          else
          {
            id v6 = [(VCSession *)v2 stateMessageWithSupportsNestedDictionary:1];
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              __str = 0;
              if (v6) {
                uint64_t v13 = (const char *)objc_msgSend((id)objc_msgSend(v6, "description"), "UTF8String");
              }
              else {
                uint64_t v13 = "<nil>";
              }
              asprintf(&__str, "%s", v13);
              if (__str)
              {
                __int16 v27 = v5;
                __lasts = 0;
                int v15 = strtok_r(__str, "\n", &__lasts);
                do
                {
                  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                  {
                    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
                    uint64_t v17 = *MEMORY[0x1E4F47A50];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136316162;
                      uint64_t v34 = v16;
                      __int16 v35 = 2080;
                      uint64_t v36 = "-[VCSession(Messaging) broadcastMediaStateUpdateMessage]";
                      __int16 v37 = 1024;
                      int v38 = 886;
                      __int16 v39 = 2080;
                      uint64_t v40 = "Sending State Update:";
                      __int16 v41 = 2080;
                      __int16 v42 = v15;
                      _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
                    }
                  }
                  int v15 = strtok_r(0, "\n", &__lasts);
                }
                while (v15);
                goto LABEL_32;
              }
              goto LABEL_33;
            }
          }
          if ((v12 & 0x1000000000000) != 0) {
            id v21 = v6;
          }
          else {
            id v21 = v5;
          }
          uint32_t v22 = v5;
          sessionMessaging = v2->_sessionMessaging;
          uint64_t v24 = [v9 idsParticipantID];
          __int16 v25 = sessionMessaging;
          id v5 = v22;
          [(VCSessionMessaging *)v25 sendMessageDictionary:v21 withTopic:@"VCSessionMessageTopicStreamGroupsState" participantID:v24];
          uint64_t v7 = v28;
          uint64_t v4 = v29;
        }
        ++v8;
      }
      while (v8 != v4);
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v44 objects:v43 count:16];
    }
    while (v4);
  }
}

- (void)sendMediaStateUpdateMessageToRemoteParticipant:(id)a3
{
  [a3 capabilities];
  id v6 = [(VCSession *)self stateMessageWithSupportsNestedDictionary:HIWORD(v5) & 1];
  sessionMessaging = self->_sessionMessaging;
  uint64_t v8 = [a3 idsParticipantID];

  [(VCSessionMessaging *)sessionMessaging sendMessageDictionary:v6 withTopic:@"VCSessionMessageTopicStreamGroupsState" participantID:v8];
}

- (BOOL)validateStreamGroup:(id)a3 state:(id)a4
{
  if (!a3)
  {
    BOOL v5 = 0;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    BOOL v6 = 0;
    return v5 && v6;
  }
  BOOL v5 = [a3 unsignedIntValue] != 0;
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  [a4 unsignedIntValue];
  BOOL v6 = [a4 unsignedIntValue] < 3;
  return v5 && v6;
}

- (void)setupMediaStateUpdateMessage
{
  void v5[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  sessionMessaging = self->_sessionMessaging;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __52__VCSession_Messaging__setupMediaStateUpdateMessage__block_invoke;
  v5[3] = &unk_1E6DB9610;
  v5[4] = v3;
  [(VCSessionMessaging *)sessionMessaging addTopic:@"VCSessionMessageTopicStreamGroupsState" associatedStrings:0 allowConcurrent:0 sendMessageDictionaryCompletionHandler:0 receiveMessageDictionaryHandler:v5];
}

uint64_t __52__VCSession_Messaging__setupMediaStateUpdateMessage__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL v6 = (void *)[*(id *)(a1 + 32) strong];

  return [v6 processMediaStateMessage:a2 remoteParticipantID:a4];
}

- (void)processStreamGroupStateMessageKey:(id)a3 value:(id)a4 mediaTypeStates:(id)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = +[VCSession mediaTypeForMediaStateMessageKey:](VCSession, "mediaTypeForMediaStateMessageKey:");
  if (v9 != -1)
  {
    uint64_t v10 = v9;
    uint64_t v11 = VCSessionMediaType_Name(v9);
    uint64_t v12 = +[VCSession mediaStateForMediaStateMessageValue:a4];
    if (v10 == -2) {
      return;
    }
    uint64_t v13 = v12;
    __int16 v14 = VCSessionMediaState_Name(v12);
    int v15 = objc_msgSend(a5, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v10));
    if (!v15) {
      goto LABEL_22;
    }
    uint64_t v16 = [v15 unsignedIntValue];
    if (v16 == v13) {
      goto LABEL_22;
    }
    uint64_t v17 = v16;
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5
        || (uint64_t v18 = VRTraceErrorLogLevelToCSTR(),
            uint64_t v19 = *MEMORY[0x1E4F47A50],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)))
      {
LABEL_16:
        if (v17 == 1 || v13 == 1) {
          uint64_t v13 = 1;
        }
        else {
          uint64_t v13 = v13;
        }
LABEL_22:
        uint64_t v26 = [NSNumber numberWithUnsignedInt:v13];
        objc_msgSend(a5, "setObject:forKeyedSubscript:", v26, objc_msgSend(NSNumber, "numberWithUnsignedInt:", v10));
        return;
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v37 = v18;
      __int16 v38 = 2080;
      __int16 v39 = "-[VCSession(Messaging) processStreamGroupStateMessageKey:value:mediaTypeStates:]";
      __int16 v40 = 1024;
      int v41 = 937;
      __int16 v42 = 2112;
      id v43 = v11;
      __int16 v44 = 2112;
      long long v45 = (VCSession *)v14;
      __int16 v46 = 2112;
      long long v47 = VCSessionMediaState_Name(v17);
      uint64_t v20 = " [%s] %s:%d Media states for mediaType=%@ are mismatched state=%@ != state=%@";
      id v21 = v19;
      uint32_t v22 = 58;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v35 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v35 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_16;
      }
      uint64_t v23 = VRTraceErrorLogLevelToCSTR();
      uint64_t v24 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      *(_DWORD *)buf = 136316930;
      uint64_t v37 = v23;
      __int16 v38 = 2080;
      __int16 v39 = "-[VCSession(Messaging) processStreamGroupStateMessageKey:value:mediaTypeStates:]";
      __int16 v40 = 1024;
      int v41 = 937;
      __int16 v42 = 2112;
      id v43 = v35;
      __int16 v44 = 2048;
      long long v45 = self;
      __int16 v46 = 2112;
      long long v47 = v11;
      __int16 v48 = 2112;
      uint64_t v49 = v14;
      __int16 v50 = 2112;
      long long v51 = VCSessionMediaState_Name(v17);
      uint64_t v20 = " [%s] %s:%d %@(%p) Media states for mediaType=%@ are mismatched state=%@ != state=%@";
      id v21 = v24;
      uint32_t v22 = 78;
    }
    _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
    goto LABEL_16;
  }
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v28 = VRTraceErrorLogLevelToCSTR();
      uint64_t v29 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v37 = v28;
        __int16 v38 = 2080;
        __int16 v39 = "-[VCSession(Messaging) processStreamGroupStateMessageKey:value:mediaTypeStates:]";
        __int16 v40 = 1024;
        int v41 = 924;
        __int16 v42 = 2112;
        id v43 = a3;
        id v30 = " [%s] %s:%d Found unsupported key=%@";
        uint64_t v31 = v29;
        uint32_t v32 = 38;
LABEL_34:
        _os_log_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      __int16 v27 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v27 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v33 = VRTraceErrorLogLevelToCSTR();
      uint64_t v34 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v37 = v33;
        __int16 v38 = 2080;
        __int16 v39 = "-[VCSession(Messaging) processStreamGroupStateMessageKey:value:mediaTypeStates:]";
        __int16 v40 = 1024;
        int v41 = 924;
        __int16 v42 = 2112;
        id v43 = v27;
        __int16 v44 = 2048;
        long long v45 = self;
        __int16 v46 = 2112;
        long long v47 = a3;
        id v30 = " [%s] %s:%d %@(%p) Found unsupported key=%@";
        uint64_t v31 = v34;
        uint32_t v32 = 58;
        goto LABEL_34;
      }
    }
  }
}

- (void)processMediaTypeStatesWithMessage:(id)a3 mediaTypeStates:(id)a4
{
  uint64_t v8 = 0;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = "";
  uint64_t v10 = (os_log_t *)MEMORY[0x1E4F47A50];
  *(void *)&long long v4 = 136315906;
  long long v40 = v4;
  do
  {
    id v11 = +[VCSession mediaStateMessageKeyForMediaType:](VCSession, "mediaStateMessageKeyForMediaType:", v8, v40);
    if (v11)
    {
      uint64_t v12 = [a3 objectForKeyedSubscript:v11];
      if (!v12) {
        goto LABEL_22;
      }
      uint64_t v13 = +[VCSession mediaStateForMediaStateMessageValue:v12];
      uint64_t v14 = [NSNumber numberWithUnsignedInt:v13];
      objc_msgSend(a4, "setObject:forKeyedSubscript:", v14, objc_msgSend(NSNumber, "numberWithUnsignedInt:", v8));
      if ((VCSession *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v33 = VRTraceErrorLogLevelToCSTR();
          os_log_t v34 = *v10;
          if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v35 = VCSessionMediaType_Name(v8);
            uint64_t v36 = VCSessionMediaState_Name(v13);
            *(_DWORD *)buf = 136316162;
            uint64_t v42 = v33;
            __int16 v43 = 2080;
            __int16 v44 = "-[VCSession(Messaging) processMediaTypeStatesWithMessage:mediaTypeStates:]";
            __int16 v45 = 1024;
            int v46 = 962;
            __int16 v47 = 2112;
            __int16 v48 = v35;
            __int16 v49 = 2112;
            __int16 v50 = (VCSession *)v36;
            uint64_t v23 = v34;
            uint64_t v24 = " [%s] %s:%d Received State Update: mediaType=%@ mediaState=%@";
            uint32_t v25 = 48;
            goto LABEL_19;
          }
        }
      }
      else
      {
        int v15 = &stru_1F3D3E450;
        if (objc_opt_respondsToSelector()) {
          int v15 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v16 = VRTraceErrorLogLevelToCSTR();
          os_log_t v17 = *v10;
          if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v18 = v9;
            id v19 = a3;
            id v20 = a4;
            id v21 = VCSessionMediaType_Name(v8);
            uint32_t v22 = VCSessionMediaState_Name(v13);
            *(_DWORD *)buf = 136316674;
            uint64_t v42 = v16;
            __int16 v43 = 2080;
            __int16 v44 = "-[VCSession(Messaging) processMediaTypeStatesWithMessage:mediaTypeStates:]";
            __int16 v45 = 1024;
            int v46 = 962;
            __int16 v47 = 2112;
            __int16 v48 = v15;
            __int16 v49 = 2048;
            __int16 v50 = self;
            __int16 v51 = 2112;
            uint64_t v52 = v21;
            a4 = v20;
            a3 = v19;
            uint64_t v9 = v18;
            uint64_t v10 = (os_log_t *)MEMORY[0x1E4F47A50];
            __int16 v53 = 2112;
            long long v54 = v22;
            uint64_t v23 = v17;
            uint64_t v24 = " [%s] %s:%d %@(%p) Received State Update: mediaType=%@ mediaState=%@";
            uint32_t v25 = 68;
LABEL_19:
            _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, v24, buf, v25);
          }
        }
      }
    }
    else if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v37 = VRTraceErrorLogLevelToCSTR();
        os_log_t v38 = *v10;
        if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
        {
          __int16 v39 = VCSessionMediaType_Name(v8);
          *(_DWORD *)buf = v40;
          uint64_t v42 = v37;
          __int16 v43 = 2080;
          __int16 v44 = "-[VCSession(Messaging) processMediaTypeStatesWithMessage:mediaTypeStates:]";
          __int16 v45 = 1024;
          int v46 = 952;
          __int16 v47 = 2112;
          __int16 v48 = v39;
          id v30 = v38;
          uint64_t v31 = " [%s] %s:%d Receive State Update: Failed to find message entry key for mediaType=%@";
          uint32_t v32 = 38;
          goto LABEL_25;
        }
      }
    }
    else
    {
      uint64_t v26 = &stru_1F3D3E450;
      if (objc_opt_respondsToSelector()) {
        uint64_t v26 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v27 = VRTraceErrorLogLevelToCSTR();
        os_log_t v28 = *v10;
        if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
        {
          uint64_t v29 = VCSessionMediaType_Name(v8);
          *(_DWORD *)buf = 136316418;
          uint64_t v42 = v27;
          __int16 v43 = 2080;
          __int16 v44 = "-[VCSession(Messaging) processMediaTypeStatesWithMessage:mediaTypeStates:]";
          __int16 v45 = 1024;
          int v46 = 952;
          __int16 v47 = 2112;
          __int16 v48 = v26;
          __int16 v49 = 2048;
          __int16 v50 = self;
          __int16 v51 = 2112;
          uint64_t v52 = v29;
          id v30 = v28;
          uint64_t v31 = " [%s] %s:%d %@(%p) Receive State Update: Failed to find message entry key for mediaType=%@";
          uint32_t v32 = 58;
LABEL_25:
          _os_log_error_impl(&dword_1E1EA4000, v30, OS_LOG_TYPE_ERROR, v31, buf, v32);
        }
      }
    }
LABEL_22:
    uint64_t v8 = (v8 + 1);
  }
  while (v8 != 9);
}

- (void)processMediaStateMessage:(id)a3 remoteParticipantID:(id)a4
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(NSMutableDictionary *)self->_remoteParticipantsMapByServerID objectForKeyedSubscript:a4];
  if (!a3)
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSession(Messaging) processMediaStateMessage:remoteParticipantID:]();
        }
      }
      return;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v36 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v36 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return;
    }
    uint64_t v38 = VRTraceErrorLogLevelToCSTR();
    __int16 v39 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v49 = v38;
    __int16 v50 = 2080;
    __int16 v51 = "-[VCSession(Messaging) processMediaStateMessage:remoteParticipantID:]";
    __int16 v52 = 1024;
    int v53 = 969;
    __int16 v54 = 2112;
    *(void *)uint64_t v55 = v36;
    *(_WORD *)&v55[8] = 2048;
    *(void *)&v55[10] = self;
    long long v40 = " [%s] %s:%d %@(%p) mediaStateMessage is nil";
LABEL_50:
    _os_log_error_impl(&dword_1E1EA4000, v39, OS_LOG_TYPE_ERROR, v40, buf, 0x30u);
    return;
  }
  if (!v6)
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSession(Messaging) processMediaStateMessage:remoteParticipantID:]();
        }
      }
      return;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v37 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v37 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return;
    }
    uint64_t v41 = VRTraceErrorLogLevelToCSTR();
    __int16 v39 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v49 = v41;
    __int16 v50 = 2080;
    __int16 v51 = "-[VCSession(Messaging) processMediaStateMessage:remoteParticipantID:]";
    __int16 v52 = 1024;
    int v53 = 970;
    __int16 v54 = 2112;
    *(void *)uint64_t v55 = v37;
    *(_WORD *)&v55[8] = 2048;
    *(void *)&v55[10] = self;
    long long v40 = " [%s] %s:%d %@(%p) Participant is nil";
    goto LABEL_50;
  }
  int v46 = (void *)v6;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(VCSession *)self processMediaTypeStatesWithMessage:a3 mediaTypeStates:v7];
  if (![v7 count])
  {
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    uint64_t v8 = (void *)[a3 allKeys];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v70 objects:v69 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v71;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v71 != v11) {
            objc_enumerationMutation(v8);
          }
          -[VCSession processStreamGroupStateMessageKey:value:mediaTypeStates:](self, "processStreamGroupStateMessageKey:value:mediaTypeStates:", *(void *)(*((void *)&v70 + 1) + 8 * i), [a3 objectForKeyedSubscript:*(void *)(*((void *)&v70 + 1) + 8 * i)], v7);
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v70 objects:v69 count:16];
      }
      while (v10);
    }
  }
  id v42 = a3;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  uint64_t v13 = (void *)[v7 allKeys];
  uint64_t v47 = [v13 countByEnumeratingWithState:&v65 objects:v64 count:16];
  if (v47)
  {
    uint64_t v14 = *(void *)v66;
    uint64_t v43 = *(void *)v66;
    id v44 = v7;
    do
    {
      for (uint64_t j = 0; j != v47; ++j)
      {
        if (*(void *)v66 != v14) {
          objc_enumerationMutation(v13);
        }
        uint64_t v16 = *(void **)(*((void *)&v65 + 1) + 8 * j);
        uint64_t v17 = [v16 unsignedIntValue];
        uint64_t v18 = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", v16), "unsignedIntValue");
        if ((VCSession *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            uint64_t v30 = VRTraceErrorLogLevelToCSTR();
            uint64_t v31 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              unsigned int transportSessionID = self->_transportSessionID;
              uint64_t v33 = [v46 uuid];
              os_log_t v34 = VCSessionMediaType_Name(v17);
              __int16 v35 = VCSessionMediaState_Name(v18);
              *(_DWORD *)buf = 136316930;
              uint64_t v49 = v30;
              __int16 v50 = 2080;
              __int16 v51 = "-[VCSession(Messaging) processMediaStateMessage:remoteParticipantID:]";
              __int16 v52 = 1024;
              int v53 = 988;
              __int16 v54 = 1024;
              *(_DWORD *)uint64_t v55 = transportSessionID;
              id v7 = v44;
              *(_WORD *)&v55[4] = 2112;
              *(void *)&v55[6] = a4;
              *(_WORD *)&v55[14] = 2112;
              *(void *)&v55[16] = v33;
              __int16 v56 = 2112;
              id v57 = v34;
              __int16 v58 = 2112;
              uint64_t v59 = (uint64_t)v35;
              uint64_t v27 = v31;
              os_log_t v28 = " [%s] %s:%d Received State Update: transportSessionID=%u participantId=%@ participantUUID=%@ mediaTy"
                    "pe=%@ mediaState=%@";
              uint32_t v29 = 74;
              goto LABEL_25;
            }
          }
        }
        else
        {
          id v19 = &stru_1F3D3E450;
          if (objc_opt_respondsToSelector()) {
            id v19 = (__CFString *)[(VCSession *)self performSelector:sel_logPrefix];
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            uint64_t v20 = VRTraceErrorLogLevelToCSTR();
            id v21 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              uint32_t v22 = v13;
              unsigned int v23 = self->_transportSessionID;
              uint64_t v24 = [v46 uuid];
              uint32_t v25 = VCSessionMediaType_Name(v17);
              uint64_t v26 = VCSessionMediaState_Name(v18);
              *(_DWORD *)buf = 136317442;
              uint64_t v49 = v20;
              __int16 v50 = 2080;
              __int16 v51 = "-[VCSession(Messaging) processMediaStateMessage:remoteParticipantID:]";
              __int16 v52 = 1024;
              int v53 = 988;
              __int16 v54 = 2112;
              *(void *)uint64_t v55 = v19;
              *(_WORD *)&v55[8] = 2048;
              *(void *)&v55[10] = self;
              *(_WORD *)&v55[18] = 1024;
              *(_DWORD *)&unsigned char v55[20] = v23;
              uint64_t v13 = v22;
              __int16 v56 = 2112;
              id v57 = a4;
              __int16 v58 = 2112;
              uint64_t v59 = v24;
              uint64_t v14 = v43;
              id v7 = v44;
              __int16 v60 = 2112;
              __int16 v61 = v25;
              __int16 v62 = 2112;
              __int16 v63 = v26;
              uint64_t v27 = v21;
              os_log_t v28 = " [%s] %s:%d %@(%p) Received State Update: transportSessionID=%u participantId=%@ participantUUID=%@ "
                    "mediaType=%@ mediaState=%@";
              uint32_t v29 = 94;
LABEL_25:
              _os_log_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEFAULT, v28, buf, v29);
              continue;
            }
          }
        }
      }
      uint64_t v47 = [v13 countByEnumeratingWithState:&v65 objects:v64 count:16];
    }
    while (v47);
  }
  [v46 setRemoteMediaTypeStates:v7];

  -[VCSession processMediaTypeMixingList:forRemoteParticipant:](self, "processMediaTypeMixingList:forRemoteParticipant:", objc_msgSend(v42, "objectForKeyedSubscript:", objc_msgSend(&unk_1F3DC6600, "stringValue")), v46);
}

- (void)processMediaTypeMixingList:(id)a3 forRemoteParticipant:(id)a4
{
  uint64_t v6 = 0;
  do
  {
    id v7 = objc_msgSend((id)objc_msgSend(NSNumber, "numberWithUnsignedInt:", v6), "stringValue");
    uint64_t v8 = [a3 objectForKeyedSubscript:v7];
    uint64_t v9 = [v7 integerValue];
    if (v8) {
      uint64_t v10 = (void *)v8;
    }
    else {
      uint64_t v10 = v7;
    }
    objc_msgSend(a4, "setMediaType:mixingWithMediaType:", v9, objc_msgSend(v10, "integerValue"));
    uint64_t v6 = (v6 + 1);
  }
  while (v6 != 9);
}

- (void)initWithIDSDestination:configurationDict:negotiationData:delegate:processId:isGKVoiceChat:.cold.1()
{
  [0 UTF8String];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v0, v1, "VCSession [%s] %s:%d Unable to initialize the session. Destination=%s", v2, v3, v4, v5, 2u);
}

- (void)initWithIDSDestination:configurationDict:negotiationData:delegate:processId:isGKVoiceChat:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSession [%s] %s:%d Unable to initialize the session's local participant!", v2, v3, v4, v5, v6);
}

- (void)setReportingConfig:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSession [%s] %s:%d reportingConfig must not be nil", v2, v3, v4, v5, v6);
}

void __64__VCSession_generateKeyFrameWithReceivedMessage_forParticipant___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSession [%s] %s:%d messageTuples is nil, can't proceed", v2, v3, v4, v5, v6);
}

- (void)readAndSetABCSymptomsReportingThresholdsFromStorebags:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSession [%s] %s:%d reportingConfig is nil!", v2, v3, v4, v5, v6);
}

void __44__VCSession_setTransportSessionEventHandler__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v0, v1, "VCSession [%s] %s:%d Established initial connection '%@'");
}

void __44__VCSession_setTransportSessionEventHandler__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v0, v1, "VCSession [%s] %s:%d Removing current active connection '%@'");
}

void __44__VCSession_setTransportSessionEventHandler__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v0, v1, "VCSession [%s] %s:%d Link constrains changed: '%@'");
}

- (void)handlePrimaryConnectionChanged:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v0, v1, "VCSession [%s] %s:%d Primary connection changed to '%@'");
}

void __84__VCSession_vcSessionParticipant_mediaStateDidChange_forMediaType_didSucceed_error___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v4 = *(_DWORD *)(a2 + 56);
  int v3 = *(_DWORD *)(a2 + 60);
  uint64_t v5 = *(void *)(a2 + 32);
  uint64_t v6 = *(void *)(a2 + 48);
  int v7 = 136316674;
  uint64_t v8 = a1;
  __int16 v9 = 2080;
  uint64_t v10 = "-[VCSession vcSessionParticipant:mediaStateDidChange:forMediaType:didSucceed:error:]_block_invoke";
  __int16 v11 = 1024;
  int v12 = 1543;
  __int16 v13 = 1024;
  int v14 = v3;
  __int16 v15 = 1024;
  int v16 = v4;
  __int16 v17 = 2112;
  uint64_t v18 = v5;
  __int16 v19 = 2112;
  uint64_t v20 = v6;
  _os_log_error_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_ERROR, "VCSession [%s] %s:%d Error updating media state=%d for media type=%d, participant=%@, error=%@", (uint8_t *)&v7, 0x3Cu);
}

- (void)vcSessionParticipantDidMediaReceiveFlushRequestWithPayloads:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VCSession [%s] %s:%d Flush baseband failed for payloads=%@");
}

void __33__VCSession_applySpatialMetadata__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCSession applySpatialMetadata]_block_invoke";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCSession [%s] %s:%d [AVC SPATIAL AUDIO] Failed to apply the spatial metadata. result=%08x", v2, *(const char **)v3, (unint64_t)"-[VCSession applySpatialMetadata]_block_invoke" >> 16, v4);
}

- (void)sendDeviceStateMessageToParticipant:withStatus:checkDNUStatus:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v2 = 1849;
  _os_log_debug_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_DEBUG, "VCSession [%s] %s:%d Diagnostics collection is off", v1, 0x1Cu);
}

void __45__VCSession_updateParticipantConfigurations___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v0, v1, "VCSession [%s] %s:%d %@");
}

void __60__VCSession_setSessionInfoSynchronizerErrorResponseCallback__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSession [%s] %s:%d transportSessionIDS is invalid", v2, v3, v4, v5, v6);
}

- (void)setupSpatialAudio
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCSession setupSpatialAudio]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCSession [%s] %s:%d Failed to reserve channel for siri. status=%08x", v2, *(const char **)v3, (unint64_t)"-[VCSession setupSpatialAudio]" >> 16, v4);
}

- (void)reserveAudioChannelForMediaType:spatialAudioSourceID:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCSession reserveAudioChannelForMediaType:spatialAudioSourceID:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCSession [%s] %s:%d Failed to allocate spatial metadata entry. status=%08x", v2, *(const char **)v3, (unint64_t)"-[VCSession reserveAudioChannelForMediaType:spatialAudioSourceID:]" >> 16, v4);
}

- (void)reserveAudioChannelForMediaType:spatialAudioSourceID:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCSession reserveAudioChannelForMediaType:spatialAudioSourceID:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCSession [%s] %s:%d Failed to retrieve the channel index. status=%08x", v2, *(const char **)v3, (unint64_t)"-[VCSession reserveAudioChannelForMediaType:spatialAudioSourceID:]" >> 16, v4);
}

- (void)reserveAudioChannelForMediaType:spatialAudioSourceID:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSession [%s] %s:%d Failed to allocate media type key", v2, v3, v4, v5, v6);
}

- (void)setMediaQueuePeakBitrateWithTargetBitrate:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSession [%s] %s:%d No VCMediaQueue created!", v2, v3, v4, v5, v6);
}

- (void)composeControlChannelParticipantConfig:withRemoteParticipant:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSession [%s] %s:%d config must not be nil", v2, v3, v4, v5, v6);
}

- (void)composeControlChannelParticipantConfig:withRemoteParticipant:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSession [%s] %s:%d remoteParticipant must not be nil", v2, v3, v4, v5, v6);
}

- (void)composeControlChannelParticipantConfig:withRemoteParticipant:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSession [%s] %s:%d Failed to create uplink encryption label holder", v2, v3, v4, v5, v6);
}

- (void)composeControlChannelParticipantConfig:withRemoteParticipant:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSession [%s] %s:%d Failed to create downlink encryption label holder", v2, v3, v4, v5, v6);
}

- (void)composeControlChannelParticipantConfig:withRemoteParticipant:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSession [%s] %s:%d Failed to create downlink security key holder", v2, v3, v4, v5, v6);
}

- (void)composeControlChannelParticipantConfig:withRemoteParticipant:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSession [%s] %s:%d Failed to create uplink security key holder", v2, v3, v4, v5, v6);
}

- (void)registerRemoteParticipantToSession:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  [v0 idsParticipantID];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, "VCSession [%s] %s:%d Failed to add participant '%llu' to Control Channel list of active participants", v3, v4, v5, v6, 2u);
}

- (void)registerRemoteParticipantToSession:.cold.2()
{
  OUTLINED_FUNCTION_11_0();
  [v0 idsParticipantID];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, "VCSession [%s] %s:%d Failed to compose control channel configuration for participant '%llu'", v3, v4, v5, v6, 2u);
}

void __62__VCSession_sendSymptomsToRemoteParticipants_symptom_groupID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  LODWORD(v6) = 2772;
  WORD2(v6) = 2048;
  HIWORD(v6) = v0;
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v1, v2, "VCSession [%s] %s:%d remoteParticipantIDs = %p", v3, v4, v5, v6);
}

- (void)reportingSessionParticipantEvent:withParticipant:keyChangeReason:newMKI:withStreamGroupID:withStreamID:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSession [%s] %s:%d Reporting agent is not properly configured", v2, v3, v4, v5, v6);
}

- (void)reportingSessionParticipantEvent:withParticipant:keyChangeReason:newMKI:withStreamGroupID:withStreamID:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCSession reportingSessionParticipantEvent:withParticipant:keyChangeReason:newMKI:withStreamGrou"
                      "pID:withStreamID:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCSession [%s] %s:%d Session Event failed - EventType:%d needs a participant but it is nil", v2, *(const char **)v3, (unint64_t)"-[VCSession reportingSessionParticipantEvent:withParticipant:keyChangeReason:newMKI:withStreamGroupID:withStreamID:]" >> 16, v4);
}

- (void)collectSessionEventKeyFieldsAndSubtype:eventType:withParticipant:keyChangeReason:newMKI:withStreamGroupID:withStreamID:collectSubtype:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSession [%s] %s:%d eventSubtype must not be nil", v2, v3, v4, v5, v6);
}

- (void)reportingSessionRemoteParticipantEvent:withParticipant:value:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCSession reportingSessionRemoteParticipantEvent:withParticipant:value:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCSession [%s] %s:%d EventType:%d is not relevant for Session Remote Participant Event logging", v2, *(const char **)v3, (unint64_t)"-[VCSession reportingSessionRemoteParticipantEvent:withParticipant:value:]" >> 16, v4);
}

- (void)dispatchedAddParticipantWithConfig:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSession [%s] %s:%d Failed to configure Remote Participant", v2, v3, v4, v5, v6);
}

- (void)dispatchedAddParticipantWithConfig:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSession [%s] %s:%d Failed to add and start Remote Participant for One to One", v2, v3, v4, v5, v6);
}

- (void)dispatchedAddParticipantWithConfig:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VCSession [%s] %s:%d Setting ecn failed for session=%@");
}

- (void)dispatchedAddParticipantWithConfig:.cold.4()
{
  OUTLINED_FUNCTION_11_0();
  [v0 uuid];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, "VCSession [%s] %s:%d Attempting to add a remote participant that is using same uuid as local participant's uuid=%@!", v3, v4, v5, v6, 2u);
}

- (void)dispatchedAddParticipantWithConfig:.cold.5()
{
  OUTLINED_FUNCTION_11_0();
  [v0 idsParticipantID];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_12_5();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, "VCSession [%s] %s:%d Another participant with same idsParticipantID=%llu already exists!", v3, v4, v5, v6, 2u);
}

- (void)configureRemoteParticipant:(NSObject *)a3 withConfig:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [a2 idsParticipantID];
  int v7 = 136316162;
  uint64_t v8 = a1;
  OUTLINED_FUNCTION_5_1();
  __int16 v9 = "-[VCSession configureRemoteParticipant:withConfig:]";
  OUTLINED_FUNCTION_3();
  int v10 = 3419;
  __int16 v11 = 2048;
  int v12 = a2;
  __int16 v13 = 2048;
  uint64_t v14 = v6;
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, "VCSession [%s] %s:%d OneToOne config was unable to be setup for remoteParticipant=%p participantID=%llu", (uint8_t *)&v7, 0x30u);
}

- (void)dispatchedUpdateConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCSession dispatchedUpdateConfiguration:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VCSession [%s] %s:%d VCSession:[%p] Failed to update the local participant configuration", v2, *(const char **)v3, (unint64_t)"-[VCSession dispatchedUpdateConfiguration:]" >> 16, v4);
}

- (void)dispatchedUpdateConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCSession dispatchedUpdateConfiguration:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VCSession [%s] %s:%d VCSession:[%p] Failed to update the session configuration", v2, *(const char **)v3, (unint64_t)"-[VCSession dispatchedUpdateConfiguration:]" >> 16, v4);
}

- (void)dispatchedParticipant:didStart:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCSession [%s] %s:%d Session failed to start.", v2, v3, v4, v5, v6);
}

void __85__VCSession_OneToOne__completionHandlerOneToOneEnabled_didSucceed_configurationDict___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6_0();
  *(void *)&void v3[6] = "-[VCSession(OneToOne) completionHandlerOneToOneEnabled:didSucceed:configurationDict:]_block_invoke";
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to send oneToOneModeEnabled=%d message", v2, *(const char **)v3, (unint64_t)"-[VCSession(OneToOne) completionHandlerOneToOneEnabled:didSucceed:configurationDict:]_block_invoke" >> 16, 911);
}

void __85__VCSession_OneToOne__completionHandlerOneToOneEnabled_didSucceed_configurationDict___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_6_0();
  *(void *)&void v3[6] = "-[VCSession(OneToOne) completionHandlerOneToOneEnabled:didSucceed:configurationDict:]_block_invoke";
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to complete transition to oneToOneModeEnabled=%d", v2, *(const char **)v3, (unint64_t)"-[VCSession(OneToOne) completionHandlerOneToOneEnabled:didSucceed:configurationDict:]_block_invoke" >> 16, 914);
}

void __57__VCSession_Messaging__setupStreamGroupStateFetchMessage__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d streamGroupStatesMessage is nil", v2, v3, v4, v5, v6);
}

void __57__VCSession_Messaging__setupStreamGroupStateFetchMessage__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Participant is nil", v2, v3, v4, v5, v6);
}

void __57__VCSession_Messaging__setupStreamGroupStateFetchMessage__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Session is nil", v2, v3, v4, v5, v6);
}

void __50__VCSession_Messaging__setupWRMAlertUpdateMessage__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d setupWRMAlertUpdateMessage message is nil", v2, v3, v4, v5, v6);
}

void __50__VCSession_Messaging__setupWRMAlertUpdateMessage__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d setupWRMAlertUpdateMessage message is invalid", v2, v3, v4, v5, v6);
}

void __44__VCSession_Messaging__setupMomentsMessages__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d setupMomentsMessages message is nil", v2, v3, v4, v5, v6);
}

void __54__VCSession_Messaging__setupPreferredInterfaceMessage__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d setupPreferredInterfaceMessage message is nil", v2, v3, v4, v5, v6);
}

void __56__VCSession_Messaging__setupMediaQualityDegradedMessage__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d setupMediaQualityDegradedMessage message is nil", v2, v3, v4, v5, v6);
}

void __56__VCSession_Messaging__setupMediaQualityDegradedMessage__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d setupMediaQualityDegradedMessage message is invalid", v2, v3, v4, v5, v6);
}

void __58__VCSession_Messaging__setupNetworkQualityDegradedMessage__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d setupNetworkQualityDegradedMessage message is nil", v2, v3, v4, v5, v6);
}

void __58__VCSession_Messaging__setupNetworkQualityDegradedMessage__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d setupNetworkQualityDegradedMessage message is invalid", v2, v3, v4, v5, v6);
}

void __51__VCSession_Messaging__setupCellTechChangeMessages__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Session is nil", v2, v3, v4, v5, v6);
}

void __45__VCSession_Messaging__setupReactionMessages__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Participant is nil", v2, v3, v4, v5, v6);
}

void __45__VCSession_Messaging__setupReactionMessages__block_invoke_235_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d reactions dictionary is nil", v2, v3, v4, v5, v6);
}

void __45__VCSession_Messaging__setupReactionMessages__block_invoke_242_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d dictionary is nil", v2, v3, v4, v5, v6);
}

void __45__VCSession_Messaging__setupReactionMessages__block_invoke_243_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Participant is nil", v2, v3, v4, v5, v6);
}

void __45__VCSession_Messaging__setupReactionMessages__block_invoke_243_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Reaction has invalid type", v2, v3, v4, v5, v6);
}

@end