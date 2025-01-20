@interface IDSDSession
- (BOOL)_checkAndSendCachedDataForClient:(id)a3;
- (BOOL)_shouldEnableCellularSlicingAfterDiceRoll;
- (BOOL)_shouldSubmitMetricsBasedOnDate:(id)a3 isInitiator:(BOOL)a4;
- (BOOL)_shouldSubmitMetricsForThisSession;
- (BOOL)_shouldUseIPsecLink;
- (BOOL)_useBTDatagramPipe;
- (BOOL)destinationsContainFromURI:(id)a3;
- (BOOL)disallowCellularInterface;
- (BOOL)disallowWifiInterface;
- (BOOL)enableQuickRelay;
- (BOOL)handOffOverQREnabled;
- (BOOL)isInitiator;
- (BOOL)isLightweightParticipant;
- (BOOL)isScreenSharingSession;
- (BOOL)isWithDefaultPairedDevice;
- (BOOL)link:(id)a3 didReceivePacket:(id *)a4 fromDeviceUniqueID:(id)a5 cbuuid:(id)a6;
- (BOOL)sessionIsActive;
- (BOOL)sharedSessionHasJoined;
- (BOOL)shouldAllocateForInvitee;
- (BOOL)shouldConnectToQRServer;
- (BOOL)shouldReportToClient:(id)a3 timeStamp:(double)a4 type:(unint64_t)a5;
- (BOOL)shouldReportUPlusOneKey;
- (BOOL)shouldVerifySignatureForMaterialType:(int)a3;
- (IDSDAccountController)accountController;
- (IDSDGroupStatusNotificationController)groupStatusNotificationController;
- (IDSDSession)initWithAccount:(id)a3 destinations:(id)a4 options:(id)a5;
- (IDSDSession)initWithAccount:(id)a3 destinations:(id)a4 options:(id)a5 availabilityCheck:(id)a6;
- (IDSDSession)initWithAccount:(id)a3 destinations:(id)a4 options:(id)a5 availabilityCheck:(id)a6 accountController:(id)a7 utunController:(id)a8;
- (IDSDSessionInvitationManager)invitationManager;
- (IDSDSessionMessenger)messenger;
- (IDSDSessionSharedState)sharedState;
- (IDSGFTMetricsCollector)metricsCollector;
- (IDSQuickRelayAllocator)qrAllocator;
- (IDSUTunController)utunController;
- (IDSXPCGroupSessionKeyValueDelivery)keyValueDelivery;
- (NSArray)requiredCapabilities;
- (NSArray)requiredLackOfCapabilities;
- (NSData)encryptedDataBlob;
- (NSData)encryptedMirageHandshakeBlob;
- (NSNumber)qrError;
- (NSNumber)qrReason;
- (NSSet)destinations;
- (NSSet)serverDesiredMaterials;
- (NSString)clientID;
- (NSString)description;
- (NSString)instanceID;
- (NSString)serviceIdentifier;
- (char)keyMaterial;
- (double)_serverSpecifiedJoinNotificationDeliveryTimeout;
- (double)getIDSContextTimeStamp;
- (id)_acceptedDeviceToken;
- (id)_acceptedDeviceUniqueID;
- (id)_breakDictionaryIntoMultipleChunks:(id)a3 chunkSize:(int)a4;
- (id)_checkIfPushMessageSizeGreaterThanMaxLimit:(id)a3 maxLimit:(unint64_t)a4;
- (id)_createGroupSessionActiveParticipantsFromParticipants:(id)a3 pushTokenForParticipants:(id)a4;
- (id)_createOneWayParticipantDictionaryFromMappedParticipantsDict:(id)a3;
- (id)_createStreamSubscriptionRequest:(id)a3;
- (id)_extractFieldBytesFromMetadata:(const void *)a3 ofSize:(unsigned int)a4 packetBuffer:(id *)a5;
- (id)_generateEncryptedAndSignedIDSContextBlobWithClientContextBlob:(id)a3;
- (id)_generateEncryptedAndSignedIDSContextBlobWithClientContextBlob:(id)a3 timeStamp:(double)a4;
- (id)_getNewLinkOptionsForActiveParticipantInfoRequest;
- (id)_getPushTokenFromParticipantID:(unint64_t)a3;
- (id)_getPushTokenFromParticipantIDNumber:(id)a3;
- (id)_getPushTokensFromParticipantIDArray:(id)a3 useNullPlaceholder:(BOOL)a4;
- (id)_getURIFromParticipantIDNumber:(id)a3;
- (id)_socketOptionsForDevice:(id)a3 uniqueID:(id)a4 pushToken:(id)a5 connectionSuffix:(id)a6;
- (id)accountID;
- (id)buildRTCSummaryReport;
- (id)clientChannelUUID;
- (id)connectDuration;
- (id)destinationsLightweightStatus;
- (id)formAndEncryptDataBlob:(id)a3 type:(int)a4;
- (id)fromURI;
- (id)getAppID;
- (id)getCallerCert;
- (id)getCellularNetworkInfo:(id)a3;
- (id)getDesiredMaterialSetForEncryptedData;
- (id)getEncryptedDataBlob;
- (id)getEncryptedMirageHandshakeBlob;
- (id)getFromService;
- (id)getLinkIDToLocalRemoteEndpointPairDictionary;
- (id)groupID;
- (id)participantID;
- (id)rtcNormalizeTime:(double)a3;
- (id)serverDesiredKeyMaterials;
- (id)sessionDuration;
- (id)uniqueID;
- (int64_t)_loggingFlags;
- (int64_t)clientType;
- (unint64_t)_getExperimentGroupThresholdForCellularSlicing;
- (unint64_t)connectionCountHint;
- (unint64_t)participantIDForAlias:(unint64_t)a3 salt:(id)a4;
- (unsigned)globalLinkErrorToSessionEndReason:(int64_t)a3;
- (unsigned)groupSessionState;
- (unsigned)state;
- (void)InvalidateStableKeyMaterialInFrameworkCache:(id)a3;
- (void)_broadcastSessionStartWithSocket:(int)a3;
- (void)_buildCellularNetworkInfoSessionEvent:(id *)a3;
- (void)_checkAndRunClientChannelTests:(id)a3;
- (void)_checkAndUnassertRealTimeMode;
- (void)_cleanupQuickRelaySession;
- (void)_cleanupSessionConnection;
- (void)_cleanupSocketPairConnection;
- (void)_closeSocketToDevice:(id)a3;
- (void)_connectQRDirectlyToClientChannel:(id)a3;
- (void)_connectSocketDescriptor:(int)a3 toClientChannel:(id)a4;
- (void)_decryptReceivedDataBlobsUsingSKMs;
- (void)_endSession;
- (void)_generateKeys:(id)a3;
- (void)_invalidateClientChannel:(id)a3;
- (void)_lightweightParticipantSync:(unsigned __int8)a3;
- (void)_noteJoinNotificationDidDeliverWithSuccess:(BOOL)a3;
- (void)_noteJoinNotificationWillSend;
- (void)_notifyClientsSessionStopped;
- (void)_processParticipantInfo:(id)a3 type:(unint64_t)a4;
- (void)_receivedReinitiateBringupAckMessage:(id)a3 fromURI:(id)a4;
- (void)_receivedReinitiateBringupMessage:(id)a3 fromURI:(id)a4;
- (void)_receivedReinitiateRequestMessage:(id)a3 fromURI:(id)a4;
- (void)_receivedReinitiateTeardownAckMessage:(id)a3 fromURI:(id)a4;
- (void)_receivedReinitiateTeardownMessage:(id)a3 fromURI:(id)a4;
- (void)_reportRTC;
- (void)_resetPreferences:(id)a3;
- (void)_sendClientDecryptedDatabBlobs:(id)a3 type:(int)a4 forParticipant:(id)a5;
- (void)_sendConnectedLinkInfoToAVC;
- (void)_sendLinkSelectionPreference:(id)a3 linkScore:(id)a4 ipPreference:(id)a5 uplinkNackDisabled:(id)a6;
- (void)_sendParticipantMappingUpdateToClient:(id)a3 forLinkID:(char)a4 shouldReplace:(BOOL)a5;
- (void)_sendQREventToAVC:(id)a3;
- (void)_sendRemoteParticipantInfoEventToClient:(id)a3 forParticipant:(id)a4;
- (void)_sendSessionEndWithData:(id)a3;
- (void)_sendSessionInfoResponseErrorToClient:(unsigned int)a3;
- (void)_sendStreamSubscriptionRequest:(id)a3;
- (void)_sendingOfflineActiveParticipantInfoRequest:(id)a3;
- (void)_sessionStartWithSocketDescriptor:(int)a3;
- (void)_setClientType:(int64_t)a3;
- (void)_setInitialLinkType:(unint64_t)a3;
- (void)_setLinkProtocol:(id)a3;
- (void)_startReinitiateAsInitiator;
- (void)_updateActiveLightweightParticipants:(id)a3;
- (void)_updateActiveParticipants:(id)a3;
- (void)acceptInvitation;
- (void)acceptInvitationWithData:(id)a3;
- (void)addQREventForRTCReport:(id)a3;
- (void)cancelInvitation;
- (void)cancelInvitationWithData:(id)a3;
- (void)cancelInvitationWithRemoteEndedReasonOverride:(unsigned int)a3;
- (void)checkAndCallSessionStart;
- (void)cleanupSessionWithCleanStatus:(BOOL)a3;
- (void)connectQRServer:(id)a3 withPreferredLocalInterface:(int)a4;
- (void)connection:(id)a3 didReceiveData:(id)a4;
- (void)connection:(id)a3 didStart:(BOOL)a4 error:(id)a5;
- (void)connection:(id)a3 receivedData:(id)a4;
- (void)connectionDidStop:(id)a3 error:(id)a4;
- (void)createAliasForParticipantID:(unint64_t)a3 salt:(id)a4;
- (void)dealloc;
- (void)declineInvitation;
- (void)declineInvitationWithData:(id)a3;
- (void)declineInvitationWithData:(id)a3 forceFromURI:(id)a4 additionalMessageAttributes:(id)a5;
- (void)didCreateMKM:(id)a3;
- (void)didReceiveBlockedIndicationForLink:(id)a3 reason:(unsigned int)a4;
- (void)didReceiveCurrentCellularSignalRaw:(int)a3 signalStrength:(int)a4 signalGrade:(int)a5;
- (void)didSendKeyMaterial:(id)a3 duration:(double)a4;
- (void)didSessionReinitiated;
- (void)enableP2Plinks;
- (void)endSession;
- (void)endSessionWithData:(id)a3;
- (void)endSessionWithReason:(unsigned int)a3;
- (void)getActiveParticipants:(id)a3 pushTokenForParticipants:(id)a4 isLightweightParticipant:(BOOL)a5;
- (void)getParticipantIDForAlias:(unint64_t)a3 salt:(id)a4;
- (void)handleAVConferenceError:(id)a3;
- (void)hasOutdatedSKI:(id)a3;
- (void)invalidateKeyMaterialByKeyIndexes:(id)a3;
- (void)invitationDeclined;
- (void)joinWithOptions:(id)a3;
- (void)joinWithOptions:(id)a3 messageContext:(id)a4;
- (void)leaveGroupSession:(id)a3 options:(id)a4;
- (void)link:(id)a3 didAddQREvent:(id)a4;
- (void)link:(id)a3 didCellularMTUChange:(unsigned __int16)a4;
- (void)link:(id)a3 didCellularNWPathFlagsChanged:(unsigned __int16)a4;
- (void)link:(id)a3 didConnectForDeviceUniqueID:(id)a4 cbuuid:(id)a5;
- (void)link:(id)a3 didConnectUnderlyingLink:(char)a4 linkUUID:(id)a5 localAttributes:(id)a6 remoteAttributes:(id)a7;
- (void)link:(id)a3 didDefaultUnderlyingLinkChangeSucceeded:(BOOL)a4 currentDefaultLinkID:(char)a5;
- (void)link:(id)a3 didDisconnectForDeviceUniqueID:(id)a4 cbuuid:(id)a5;
- (void)link:(id)a3 didDisconnectUnderlyingLinkID:(char)a4 linkUUID:(id)a5 reason:(unsigned __int8)a6;
- (void)link:(id)a3 didFinishConvergenceForRelaySessionID:(id)a4;
- (void)link:(id)a3 didGetLinkProbingStatus:(id)a4;
- (void)link:(id)a3 didRATChange:(unsigned __int8)a4;
- (void)link:(id)a3 didReceiveChildConnections:(id)a4 forLinkID:(char)a5;
- (void)link:(id)a3 didReceiveDebugDataForClient:(id)a4 dataType:(unsigned __int8)a5;
- (void)link:(id)a3 didReceiveEncryptedDataBlobs:(id)a4;
- (void)link:(id)a3 didReceiveEncryptionInformation:(id)a4;
- (void)link:(id)a3 didReceiveErrorIndicationWithCode:(unsigned int)a4;
- (void)link:(id)a3 didReceiveKeyMaterialMessageData:(id)a4 fromParticipantIDs:(id)a5 toParticipantID:(id)a6;
- (void)link:(id)a3 didReceiveMappedParticipantsDict:(id)a4 forLinkID:(char)a5;
- (void)link:(id)a3 didReceiveMaterialInfo:(id)a4 material:(id)a5;
- (void)link:(id)a3 didReceiveMembershipChangedInformation:(unsigned __int8)a4;
- (void)link:(id)a3 didReceiveParticipantUpdate:(id)a4 status:(unsigned __int16)a5;
- (void)link:(id)a3 didReceivePluginDisconnect:(id)a4;
- (void)link:(id)a3 didReceivePluginRegistration:(unint64_t)a4 pluginName:(id)a5;
- (void)link:(id)a3 didReceivePluginUnregistration:(unint64_t)a4 pluginName:(id)a5;
- (void)link:(id)a3 didReceiveReliableUnicastServerMaterial:(id)a4;
- (void)link:(id)a3 didReceiveReportEvent:(id)a4;
- (void)link:(id)a3 didReceiveRequestToPurgeRegistration:(id)a4;
- (void)link:(id)a3 didReceiveSKEData:(id)a4;
- (void)link:(id)a3 didReceiveSessionInfo:(id)a4 relayGroupID:(id)a5 relaySessionID:(id)a6 status:(unsigned int)a7;
- (void)link:(id)a3 didReceiveSessionStateCounter:(unsigned int)a4;
- (void)link:(id)a3 didReceiveSessionStats:(id)a4 relayGroupID:(id)a5 relaySessionID:(id)a6 success:(BOOL)a7;
- (void)link:(id)a3 didSoMaskChange:(unsigned int)a4;
- (void)link:(id)a3 didWiFiNWPathFlagsChanged:(unsigned __int16)a4;
- (void)manageDesignatedMembers:(id)a3 withType:(unsigned __int16)a4;
- (void)mapMKIFromMaterial:(id)a3 token:(id)a4;
- (void)materialInfoError:(id)a3;
- (void)networkingIsAvailable:(id)a3;
- (void)onParticipantID2PushTokenMappingChange:(id)a3;
- (void)onURI2ParticipantIDMappingChange:(id)a3 allocateResponse:(id)a4;
- (void)openSocketToDevice:(id)a3;
- (void)processAllocationErrorStatus:(int)a3 errorCode:(int)a4;
- (void)qrAllocatorDidReceiveAllocateResponse:(id)a3;
- (void)receiveAndDecryptEncryptedDataBlobs:(id)a3;
- (void)receiveJoinNotificationFromAParticipant;
- (void)receivedAcceptMessage:(id)a3 fromURI:(id)a4;
- (void)receivedCancelMessage:(id)a3 fromURI:(id)a4;
- (void)receivedDeclineMessage:(id)a3 fromURI:(id)a4;
- (void)receivedEndMessage:(id)a3 fromURI:(id)a4;
- (void)receivedReinitiateMessage:(id)a3 fromURI:(id)a4;
- (void)receivedSessionMessage:(id)a3 fromURI:(id)a4;
- (void)reconnectSession;
- (void)recvKeyMaterial:(id)a3;
- (void)recvMembershipChangeEventWithReason:(unsigned __int8)a3 completionHandler:(id)a4;
- (void)recvStableKeyMaterialForFrameworkCache:(id)a3;
- (void)registerClientChannel;
- (void)registerMultiplexerTransport;
- (void)registerPluginWithOptions:(id)a3 messageContext:(id)a4;
- (void)reinitiate;
- (void)rejectedKeyRecoveryRequestFromURI:(id)a3 reason:(unsigned int)a4;
- (void)removeParticipantIDs:(id)a3;
- (void)reportFirstMKMReceivedFromPush:(double)a3;
- (void)reportFirstMKMReceivedFromQR:(double)a3;
- (void)reportJoinReceivedOverPushFromToken:(id)a3;
- (void)reportMKMReceivedOverPushFromToken:(id)a3 material:(id)a4;
- (void)reportMKMReceivedOverPushViaCacheForParticipantID:(unint64_t)a3 material:(id)a4;
- (void)reportMKMReceivedOverQRFromToken:(id)a3 material:(id)a4;
- (void)reportPreKeyReceivedOverPushFromToken:(id)a3;
- (void)reportSendRatchetedMKMToAVCForParticipantID:(unint64_t)a3 mki:(id)a4;
- (void)requestEncryptionKeyForParticipantIDs:(id)a3;
- (void)requestKeyValueDeliveryDataForKey:(unsigned int)a3 participantID:(unint64_t)a4;
- (void)requestMaterialsForParticipantIDs:(id)a3 materialType:(int)a4;
- (void)requestSessionInfoWithOptions:(id)a3;
- (void)requestURIsForParticipantIDs:(id)a3 withRequestID:(id)a4;
- (void)runConnectivityCheckWithCompletionBlock:(id)a3;
- (void)sendAllocationRequest:(id)a3;
- (void)sendCancelInvitationMessage;
- (void)sendInvitationWithData:(id)a3 declineOnError:(BOOL)a4;
- (void)sendInvitationWithOptions:(id)a3 declineOnError:(BOOL)a4;
- (void)sendKeyMaterialMessage:(id)a3 toDestination:(id)a4;
- (void)sendKeyMaterialMessageDataOverQR:(id)a3 toDestination:(id)a4 completionBlock:(id)a5;
- (void)sendSessionMessage:(id)a3 toDestinations:(id)a4;
- (void)setAcceptedRelaySession:(id)a3;
- (void)setAccountController:(id)a3;
- (void)setAudioEnabled:(BOOL)a3;
- (void)setClientID:(id)a3;
- (void)setForceTCPFallbackOnCellUsingReinitiate:(BOOL)a3;
- (void)setForceTCPFallbackOnWiFiUsingReinitiate:(BOOL)a3;
- (void)setGroupStatusNotificationController:(id)a3;
- (void)setGroupStreamInfo:(id)a3 sessionInfo:(id)a4;
- (void)setHasPendingAllocation:(BOOL)a3 forIDSSession:(id)a4;
- (void)setInvitationManager:(id)a3;
- (void)setInviteTimeout:(int64_t)a3;
- (void)setMessenger:(id)a3;
- (void)setMuted:(BOOL)a3;
- (void)setParticipantIDToURI:(id)a3 participantID:(id)a4;
- (void)setPreferences:(id)a3;
- (void)setQrAllocator:(id)a3;
- (void)setQrError:(id)a3;
- (void)setQrReason:(id)a3;
- (void)setQuickRelaySessionToken:(id)a3;
- (void)setQuickRelayUserTypeForSession:(unsigned __int16)a3;
- (void)setRemoteBlob:(id)a3;
- (void)setRemoteUseCloudPairedControlChannel:(id)a3;
- (void)setRemoteUsePhoneContinuityLocalMessage:(id)a3;
- (void)setRequiredCapabilities:(id)a3 requiredLackOfCapabilities:(id)a4;
- (void)setSSRCRecv:(unsigned int)a3;
- (void)setSeqRecvStart:(unsigned int)a3;
- (void)setServerDesiredKeyMaterials:(id)a3 signer:(id)a4;
- (void)setServiceIdentifier:(id)a3;
- (void)setSharedSessionHasJoined:(BOOL)a3;
- (void)setSharedState:(id)a3;
- (void)setShouldConnectToQRServer:(BOOL)a3;
- (void)setUtunController:(id)a3;
- (void)startListeningOnClientSocket:(int)a3 isRawSocket:(BOOL)a4;
- (void)startQRSession;
- (void)submitAWDMetricsForIDSSessionAcceptReceived;
- (void)submitAWDMetricsForIDSSessionAcceptSent;
- (void)submitAWDMetricsForIDSSessionCancelReceived;
- (void)submitAWDMetricsForIDSSessionCancelSentWithRemoteEndReason:(unsigned int)a3 numberOfRecipients:(id)a4;
- (void)submitAWDMetricsForIDSSessionCompleted;
- (void)submitAWDMetricsForIDSSessionConnected;
- (void)submitAWDMetricsForIDSSessionDeclineReceived;
- (void)submitAWDMetricsForIDSSessionDeclineSent;
- (void)submitAWDMetricsForIDSSessionInvitationReceived;
- (void)submitAWDMetricsForIDSSessionInvitationSentWithNumberOfRecipients:(id)a3;
- (void)submitAWDMetricsForIDSSessionReinitiateConnected;
- (void)submitAWDMetricsForIDSSessionReinitiateRequested;
- (void)submitAWDMetricsForIDSSessionReinitiateStarted;
- (void)submitAWDMetricsForIDSSessionStarted;
- (void)submitAWDMetricsForIDSSessionWithEndReason:(unsigned int)a3;
- (void)terminateCallDueToIdleClientForLink:(id)a3;
- (void)unregisterClientChannel;
- (void)unregisterPluginWithOptions:(id)a3 messageContext:(id)a4;
- (void)updateMembers:(id)a3 withContext:(id)a4 messagingCapabilities:(id)a5 triggeredLocally:(BOOL)a6 lightweightStatusDict:(id)a7;
- (void)updateParticipantData:(id)a3 withContext:(id)a4;
- (void)updateParticipantInfo:(id)a3;
- (void)updateParticipantType:(unsigned __int16)a3 members:(id)a4 triggeredLocally:(BOOL)a5 withContext:(id)a6 lightweightStatusDict:(id)a7;
- (void)updateRelevantEncryptedDataBlob;
- (void)updateServerDesiredKeyMaterials;
- (void)updateServerDesiredKeyValueDeliveryMaterialsNeeded;
- (void)writeToClientChannel:(id)a3 packetBuffer:(id *)a4 metaData:(const char *)a5 metadataSize:(unsigned int)a6;
@end

@implementation IDSDSession

- (int64_t)_loggingFlags
{
  v2 = [(IDSDSession *)self sharedState];
  unsigned int v3 = [v2 isScreenSharingSession];

  if (v3) {
    return 8703;
  }
  else {
    return 511;
  }
}

- (void)_generateKeys:(id)a3
{
  id v4 = a3;
  v5 = +[IDSGroupEncryptionController sharedInstance];
  id v6 = [v5 createRealTimeEncryptionFullIdentityForDevice:v4 completionBlock:0];

  v7 = +[IDSGroupEncryptionController sharedInstance];
  v8 = [(IDSDSession *)self sharedState];
  v9 = [v8 groupID];
  v10 = [(IDSDSession *)self sharedState];
  v11 = [v10 uniqueID];
  v12 = [v7 stableKeyMaterialForGroup:v9 sessionID:v11];

  if (v12)
  {
    v13 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [(IDSDSession *)self sharedState];
      v15 = [v14 groupID];
      v16 = [(IDSDSession *)self sharedState];
      v17 = [v16 uniqueID];
      *(_DWORD *)buf = 138412802;
      v49 = v15;
      __int16 v50 = 2112;
      v51 = v12;
      __int16 v52 = 2112;
      v53 = v17;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@ has valid SKM: %@ for sessionID: %@", buf, 0x20u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        v18 = [(IDSDSession *)self sharedState];
        v19 = [v18 groupID];
        v20 = [(IDSDSession *)self sharedState];
        [v20 uniqueID];
        v47 = v46 = v12;
        v45 = v19;
        _IDSLogTransport();

        if (_IDSShouldLog())
        {
          v21 = [(IDSDSession *)self sharedState];
          v22 = [v21 groupID];
          v23 = [(IDSDSession *)self sharedState];
          [v23 uniqueID];
          v47 = v46 = v12;
          v45 = v22;
          _IDSLogV();
        }
      }
    }
  }
  else
  {
    v24 = +[IDSGroupEncryptionController sharedInstance];
    v25 = [(IDSDSession *)self sharedState];
    v26 = [v25 groupID];
    v27 = [(IDSDSession *)self sharedState];
    v28 = [v27 uniqueID];
    [v24 createStableKeyMaterialAndSendToFrameworkForGroup:v26 sessionID:v28];
  }
  v29 = +[IDSGroupEncryptionController sharedInstance];
  v30 = [(IDSDSession *)self sharedState];
  v31 = [v30 groupID];
  v32 = [(IDSDSession *)self sharedState];
  v33 = [v32 uniqueID];
  v34 = [v29 stableKeyMaterialForGroup:v31 sessionID:v33];

  v35 = [(IDSDSession *)self sharedState];
  v36 = [v35 uniqueID];

  id v37 = [v36 stringByAppendingString:@"datablob-context"];
  v38 = (const char *)[v37 UTF8String];

  v39 = +[NSData dataWithBytes:v38 length:strlen(v38)];
  os_unfair_lock_lock(&self->_lock);
  v40 = (IDSGroupEncryptionKeyManager *)[objc_alloc((Class)IDSGroupEncryptionKeyManager) initWithEncryptionContext:v39 encryptionKeySize:32];
  dataBlobEncryptionManager = self->_dataBlobEncryptionManager;
  self->_dataBlobEncryptionManager = v40;

  v42 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v49 = v34;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "SKM: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
  if (v34)
  {
    [(IDSGroupEncryptionKeyManager *)self->_dataBlobEncryptionManager recvKeyMaterial:v34];
    v43 = (IDSGroupSessionDataCryptor *)[objc_alloc((Class)IDSGroupSessionDataCryptor) initWithTopic:@"dataBlobEncryption" keyManager:self->_dataBlobEncryptionManager];
    cryptorForBlobs = self->_cryptorForBlobs;
    self->_cryptorForBlobs = v43;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (IDSDSession)initWithAccount:(id)a3 destinations:(id)a4 options:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc_init(IDSDSessionDefaultAvailabilityCheck);
  v12 = [(IDSDSession *)self initWithAccount:v10 destinations:v9 options:v8 availabilityCheck:v11];

  return v12;
}

- (IDSDSession)initWithAccount:(id)a3 destinations:(id)a4 options:(id)a5 availabilityCheck:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = +[IDSDAccountController sharedInstance];
  v15 = +[IDSUTunController sharedInstance];
  v16 = [(IDSDSession *)self initWithAccount:v13 destinations:v12 options:v11 availabilityCheck:v10 accountController:v14 utunController:v15];

  return v16;
}

- (IDSDSession)initWithAccount:(id)a3 destinations:(id)a4 options:(id)a5 availabilityCheck:(id)a6 accountController:(id)a7 utunController:(id)a8
{
  id v379 = a3;
  v384 = (__CFString *)a4;
  id v14 = a5;
  id v372 = a6;
  id v380 = a7;
  id v373 = a8;
  v402.receiver = self;
  v402.super_class = (Class)IDSDSession;
  v15 = [(IDSDSession *)&v402 init];

  if (!v15) {
    goto LABEL_270;
  }
  v378 = [v14 objectForKey:IDSSessionUniqueIDKey];
  v370 = [v14 objectForKey:IDSSessionTransportTypeKey];
  v374 = [v14 objectForKey:IDSSessionConnectionCountHintKey];
  uint64_t v16 = [v14 objectForKey:IDSSessionInstanceIDKey];
  instanceID = v15->_instanceID;
  v15->_instanceID = (NSString *)v16;

  uint64_t v18 = IDSSessionIsInitiatorKey;
  v19 = [v14 objectForKey:IDSSessionIsInitiatorKey];
  if (v19)
  {
    v20 = [v14 objectForKey:v18];
    unsigned int v382 = [v20 BOOLValue];
  }
  else
  {
    unsigned int v382 = 1;
  }

  objc_storeStrong((id *)&v15->_accountController, a7);
  objc_storeStrong((id *)&v15->_utunController, a8);
  v371 = [v380 accountWithUniqueID:v379];
  v377 = [v371 service];
  v381 = [v377 identifier];
  uint64_t v21 = +[IDSQuickRelayAllocator sharedInstance];
  qrAllocator = v15->_qrAllocator;
  v15->_qrAllocator = (IDSQuickRelayAllocator *)v21;

  v23 = [IDSDSessionSharedState alloc];
  v24 = [v377 displayName];
  v25 = [(IDSDSessionSharedState *)v23 initWithDictionary:v14 serviceName:v24 isInitiator:v382 uniqueID:v378 accountID:v379 destinations:v384];
  sharedState = v15->_sharedState;
  v15->_sharedState = v25;

  v27 = [IDSDSessionMessenger alloc];
  v28 = [(IDSDSession *)v15 sharedState];
  v29 = [(IDSDSessionMessenger *)v27 initWithDictionary:v14 sharedState:v28 accountController:v380];
  messenger = v15->_messenger;
  v15->_messenger = v29;

  v31 = [IDSDSessionInvitationManager alloc];
  v32 = [(IDSDSession *)v15 sharedState];
  v33 = [(IDSDSession *)v15 messenger];
  v34 = [(IDSDSessionInvitationManager *)v31 initWithDictionary:v14 sharedState:v32 messenger:v33];
  invitationManager = v15->_invitationManager;
  v15->_invitationManager = v34;

  v36 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    id v37 = [v14 description];
    IDSLoggableDescriptionForObjectOnService();
    id v38 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v38;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "*** options : %@", buf, 0xCu);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      v39 = [v14 description];
      *(void *)&long long v360 = IDSLoggableDescriptionForObjectOnService();
      _IDSLogTransport();

      if (_IDSShouldLog())
      {
        v40 = objc_msgSend(v14, "description", (void)v360);
        *(void *)&long long v360 = IDSLoggableDescriptionForObjectOnService();
        _IDSLogV();
      }
    }
  }
  v41 = [(IDSDSession *)v15 messenger];
  if (v41)
  {
    v42 = [(IDSDSession *)v15 invitationManager];
    if (v42)
    {
      v43 = [(IDSDSession *)v15 sharedState];
      BOOL v44 = v43 == 0;

      if (!v44) {
        goto LABEL_19;
      }
    }
    else
    {
    }
  }
  v45 = +[IDSFoundationLog IDSDSession];
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "There was an error creating the managers for IDSDSession.  Aborting...", buf, 2u);
  }

LABEL_19:
  v46 = [(IDSDSession *)v15 messenger];
  [v46 setDelegate:v15];

  v47 = [(IDSDSession *)v15 invitationManager];
  [v47 setDelegate:v15];

  v48 = [(IDSDSession *)v15 sharedState];
  [v48 setDelegate:v15];

  v15->_lock._os_unfair_lock_opaque = 0;
  v15->_clientChannelLock._os_unfair_lock_opaque = 0;
  v49 = [v14 objectForKey:IDSSessionDisallowCellularInterfaceKey];
  v15->_BOOL disallowCellularInterface = [v49 BOOLValue];

  __int16 v50 = (CoreTelephonyClient *)[objc_alloc((Class)CoreTelephonyClient) initWithQueue:0];
  ctClient = v15->_ctClient;
  v15->_ctClient = v50;

  if (v15->_ctClient)
  {
    dispatch_queue_t v52 = dispatch_queue_create("com.apple.ids.IDSDSession.networkSlicingReportingQueue", 0);
    networkSlicingReportingQueue = v15->_networkSlicingReportingQueue;
    v15->_networkSlicingReportingQueue = (OS_dispatch_queue *)v52;

    int v54 = _os_feature_enabled_impl();
    v55 = +[IDSFoundationLog IDSDSession];
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v56 = @"NO";
      if (v54) {
        CFStringRef v56 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v56;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Sliced cellular interface feature is enabled: %@", buf, 0xCu);
    }

    if (v54)
    {
      v57 = v15->_ctClient;
      id v401 = 0;
      CFMutableDictionaryRef theDict = [(CoreTelephonyClient *)v57 getSliceTrafficDescriptors:&v401];
      id v58 = v401;
      if (v58
        || ([(__CFDictionary *)theDict trafficDescriptors],
            (v284 = objc_claimAutoreleasedReturnValue()) == 0)
        || ([(__CFDictionary *)theDict trafficDescriptors],
            v285 = objc_claimAutoreleasedReturnValue(),
            BOOL v286 = [v285 count] == 0,
            v285,
            v284,
            v286))
      {
        int v59 = 0;
      }
      else
      {
        v15->_cellularSlicingFlags |= 0x20u;
        int v59 = 1;
      }
      int v60 = IMGetDomainBoolForKeyWithDefaultValue();
      unsigned int v61 = [(IDSDSession *)v15 _shouldEnableCellularSlicingAfterDiceRoll];
      v62 = +[IDSFoundationLog IDSDSession];
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v63 = @"NO";
        if (v59) {
          CFStringRef v64 = @"YES";
        }
        else {
          CFStringRef v64 = @"NO";
        }
        BOOL disallowCellularInterface = v15->_disallowCellularInterface;
        if (v61) {
          CFStringRef v66 = @"YES";
        }
        else {
          CFStringRef v66 = @"NO";
        }
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = v64;
        if (v60) {
          CFStringRef v67 = @"YES";
        }
        else {
          CFStringRef v67 = @"NO";
        }
        __int16 v405 = 2112;
        CFStringRef v406 = v66;
        __int16 v407 = 2112;
        if (disallowCellularInterface) {
          CFStringRef v63 = @"YES";
        }
        CFStringRef v408 = v67;
        __int16 v409 = 2112;
        CFStringRef v410 = v63;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "Sliced cellular interface feature - is slicing supported: %@ should enable cellular slicing after dice roll: %@, should force enable cellular slicing: %@ is cellular interface disallowed: %@", buf, 0x2Au);
      }

      if (v15->_disallowCellularInterface) {
        int v68 = 0;
      }
      else {
        int v68 = v59;
      }
      if ((v68 & v61 | v60) == 1)
      {
        v69 = im_primary_queue();
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472;
        handler[2] = sub_100087968;
        handler[3] = &unk_100980CE8;
        v70 = v15;
        v400 = v70;
        uint64_t v71 = notify_register_dispatch("com.apple.CoreTelephony.Slicing.Interfaces.Active.State", &v15->_sliceActiveNotificationToken, v69, handler);

        if (v71)
        {
          v72 = +[IDSFoundationLog IDSDSession];
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
            sub_10070BFD0(v71, v72, v73, v74, v75, v76, v77, v78);
          }
        }
        uint64_t state64 = 0;
        notify_get_state(v15->_sliceActiveNotificationToken, &state64);
        v79 = +[IDSFoundationLog IDSDSession];
        if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = state64;
          _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "Sliced cellular interface - received bitmask: %llu", buf, 0xCu);
        }

        v80 = +[IDSNWPathUtils sharedInstance];
        uint64_t v81 = state64;
        v82 = [(IDSDSession *)v70 sharedState];
        v83 = [v82 uniqueID];
        [v80 setSliceInterfaceBitMask:v81 forSession:v83];

        *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
        objc_initWeak((id *)buf, v70);
        if (qword_100A4A5D0 != -1) {
          dispatch_once(&qword_100A4A5D0, &stru_100981748);
        }
        uint64_t v84 = mach_continuous_time();
        double v85 = *(double *)&qword_100A4A5D8;
        v395[0] = _NSConcreteStackBlock;
        v395[1] = 3221225472;
        v395[2] = sub_100087AD4;
        v395[3] = &unk_100980D10;
        objc_copyWeak(v397, (id *)buf);
        v86 = v70;
        v396 = v86;
        *(double *)&v397[1] = v85 * (double)v84;
        v87 = objc_retainBlock(v395);
        v88 = +[IDSNWPathUtils sharedInstance];
        v89 = [(IDSDSession *)v86 sharedState];
        v90 = [v89 uniqueID];
        [v88 bringUpSlicedInterface:v87 forServiceIdentifier:v381 forSession:v90];

        objc_destroyWeak(v397);
        objc_destroyWeak((id *)buf);
      }
    }
    v91 = [v14 objectForKey:IDSSessionDisallowWifiInterfaceKey];
    v15->_disallowWifiInterface = [v91 BOOLValue];

    v92 = [v14 objectForKey:IDSGroupSessionCallScreeningMode];
    v15->_disableP2PLinks = [v92 BOOLValue];

    v93 = [v14 objectForKey:IDSSessionPreferredAddressFamilyKey];
    v15->_preferredAddressFamily = [v93 unsignedIntValue];

    v94 = [v14 objectForKey:IDSSessionPreferCellularForCallSetupKey];
    v15->_preferCellularForCallSetup = [v94 BOOLValue];

    uint64_t v95 = [v14 objectForKey:IDSSessionReliableUnicastRegistrationCompletionBlockKey];
    id v96 = [(id)v95 copy];
    id reliableUnicastRegistrationCompletionBlock = v15->_reliableUnicastRegistrationCompletionBlock;
    v15->_id reliableUnicastRegistrationCompletionBlock = v96;

    LOBYTE(v95) = _os_feature_enabled_impl();
    v98 = +[IDSServerBag sharedInstance];
    v99 = [v98 objectForKey:@"ids-disable-hand-off-over-qr"];
    unsigned __int8 v100 = [v99 BOOLValue];

    v15->_handOffOverQREnabled = v95 & (v100 ^ 1);
    v101 = +[IDSFoundationLog IDSDSession];
    if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
    {
      if (v15->_handOffOverQREnabled) {
        CFStringRef v102 = @"YES";
      }
      else {
        CFStringRef v102 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v102;
      _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "Handoff Over QR Feature is Enabled: %@", buf, 0xCu);
    }

    uint64_t v103 = +[NSString stringGUID];
    awdUniqueId = v15->_awdUniqueId;
    v15->_awdUniqueId = (NSString *)v103;

    uint64_t v105 = +[NSDate date];
    awdStartTimestamp = v15->_awdStartTimestamp;
    v15->_awdStartTimestamp = (NSDate *)v105;

    if (qword_100A4A5D0 != -1) {
      dispatch_once(&qword_100A4A5D0, &stru_100981748);
    }
    v15->_summaryReportBaseTime = *(double *)&qword_100A4A5D8 * (double)mach_continuous_time();
    objc_storeStrong((id *)&v15->_availabilityCheck, a6);
    skeData = v15->_skeData;
    v15->_skeData = 0;

    v108 = [v14 objectForKey:IDSDSessionSuppressClientNotificationsKey];
    v15->_supressClientNotifications = [v108 BOOLValue];

    v109 = [v14 objectForKey:IDSGroupSessionStartedAsUPlusOneKey];
    v15->_BOOL startedAsUPlusOneSession = [v109 BOOLValue];

    v15->_switchedToUPlusMany = 0;
    v110 = [v14 objectForKey:IDSGroupSessionIsLightweightParticipantKey];
    v15->_isLightweightParticipant = [v110 BOOLValue];

    v15->_isServerMaterialExchangeEnabled = 1;
    v111 = (IDSGFTMetricsCollector *)objc_alloc_init((Class)IDSGFTMetricsCollector);
    metricsCollector = v15->_metricsCollector;
    v15->_metricsCollector = v111;

    [(IDSGFTMetricsCollector *)v15->_metricsCollector setIsInitiator:v382];
    uint64_t v113 = +[NSMutableDictionary dictionary];
    participantIDToPushToken = v15->_participantIDToPushToken;
    v15->_participantIDToPushToken = (NSMutableDictionary *)v113;

    uint64_t v115 = +[NSMutableDictionary dictionary];
    participantIDToURI = v15->_participantIDToURI;
    v15->_participantIDToURI = (NSMutableDictionary *)v115;

    if (qword_100A4A5D0 != -1) {
      dispatch_once(&qword_100A4A5D0, &stru_100981748);
    }
    v15->_timeBase = *(double *)&qword_100A4A5D8 * (double)mach_continuous_time();
    v15->_connectedLinkCount = 0;
    uint64_t v369 = [v14 objectForKey:IDSSessionClientUUIDKey];
    if (v369)
    {
      id v117 = [objc_alloc((Class)NSUUID) initWithUUIDString:v369];
      v118 = [(IDSDSession *)v15 sharedState];
      [v118 setClientUUID:v117];
    }
    v119 = +[IDSGroupEncryptionController sharedInstance];
    v120 = [(IDSDSession *)v15 sharedState];
    v121 = [v120 groupID];
    [v119 resetKeyMaterialLocalSentStatus:v121];

    v122 = [v14 objectForKey:IDSSessionIsMultiwayKey];
    unsigned int v367 = [v122 BOOLValue];

    if (v367
      && (+[IDSGroupEncryptionController sharedInstance],
          v123 = objc_claimAutoreleasedReturnValue(),
          unsigned int v124 = [v123 shouldUseGecko],
          v123,
          v124))
    {
      v125 = +[IDSGroupEncryptionController2Shim sharedInstance];
      v126 = [v125 internal];
      v127 = [(IDSDSession *)v15 sharedState];
      v128 = [v127 groupID];
      uint64_t v129 = [v126 groupForID:v128];
      group = v15->_group;
      v15->_group = (_TtC17identityservicesd33IDSGroupEncryptionControllerGroup *)v129;

      if (_os_feature_enabled_impl())
      {
        v131 = [v14 objectForKey:IDSGroupSessionShortMKIEnabledKey];
        v15->_isShortMKIEnabled = [v131 BOOLValue];
      }
      if (v15->_isShortMKIEnabled && _os_feature_enabled_impl())
      {
        v132 = [v14 objectForKey:IDSGroupSessionTLEEnabledKey];
        v15->_isTLEEnabled = [v132 BOOLValue];
      }
      int v133 = IMGetDomainBoolForKeyWithDefaultValue();
      int v134 = IMGetDomainBoolForKeyWithDefaultValue();
      if (v133)
      {
        v135 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
        {
          if (v15->_isShortMKIEnabled) {
            CFStringRef v136 = @"YES";
          }
          else {
            CFStringRef v136 = @"NO";
          }
          v137 = [(IDSDSession *)v15 sharedState];
          v138 = [v137 groupID];
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v136;
          __int16 v405 = 2112;
          CFStringRef v406 = @"YES";
          __int16 v407 = 2112;
          CFStringRef v408 = v138;
          _os_log_impl((void *)&_mh_execute_header, v135, OS_LOG_TYPE_DEFAULT, "IDSDSession::init _isShortMKIEnabled:%@ shouldForceShortMKI:%@ for groupID:%@", buf, 0x20u);
        }
        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
        {
          v139 = v15->_isShortMKIEnabled ? @"YES" : @"NO";
          v140 = [(IDSDSession *)v15 sharedState];
          [v140 groupID];
          v362 = *((void *)&v360 + 1) = @"YES";
          *(void *)&long long v360 = v139;
          _IDSLogTransport();

          if (_IDSShouldLog())
          {
            if (v15->_isShortMKIEnabled) {
              CFStringRef v141 = @"YES";
            }
            else {
              CFStringRef v141 = @"NO";
            }
            v142 = [(IDSDSession *)v15 sharedState];
            [v142 groupID];
            v362 = *((void *)&v360 + 1) = @"YES";
            *(void *)&long long v360 = v141;
            _IDSLogV();
          }
        }
        v15->_isShortMKIEnabled = v133;
      }
      if (v134)
      {
        v143 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
        {
          if (v15->_isTLEEnabled) {
            CFStringRef v144 = @"YES";
          }
          else {
            CFStringRef v144 = @"NO";
          }
          v145 = [(IDSDSession *)v15 sharedState];
          v146 = [v145 groupID];
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v144;
          __int16 v405 = 2112;
          CFStringRef v406 = @"YES";
          __int16 v407 = 2112;
          CFStringRef v408 = v146;
          _os_log_impl((void *)&_mh_execute_header, v143, OS_LOG_TYPE_DEFAULT, "IDSDSession::init _isTLEEnabled:%@ shouldForceTLE:%@ for groupID:%@", buf, 0x20u);
        }
        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
        {
          v147 = v15->_isTLEEnabled ? @"YES" : @"NO";
          v148 = [(IDSDSession *)v15 sharedState];
          [v148 groupID];
          v362 = *((void *)&v360 + 1) = @"YES";
          *(void *)&long long v360 = v147;
          _IDSLogTransport();

          if (_IDSShouldLog())
          {
            if (v15->_isTLEEnabled) {
              CFStringRef v149 = @"YES";
            }
            else {
              CFStringRef v149 = @"NO";
            }
            v150 = [(IDSDSession *)v15 sharedState];
            [v150 groupID];
            v362 = *((void *)&v360 + 1) = @"YES";
            *(void *)&long long v360 = v149;
            _IDSLogV();
          }
        }
        v15->_isTLEEnabled = v134;
      }
      v151 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v151, OS_LOG_TYPE_DEFAULT))
      {
        if (v15->_isShortMKIEnabled) {
          CFStringRef v152 = @"YES";
        }
        else {
          CFStringRef v152 = @"NO";
        }
        if (v15->_isTLEEnabled) {
          CFStringRef v153 = @"YES";
        }
        else {
          CFStringRef v153 = @"NO";
        }
        v154 = [(IDSDSession *)v15 sharedState];
        v155 = [v154 groupID];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v152;
        __int16 v405 = 2112;
        CFStringRef v406 = v153;
        __int16 v407 = 2112;
        CFStringRef v408 = v155;
        _os_log_impl((void *)&_mh_execute_header, v151, OS_LOG_TYPE_DEFAULT, "IDSDSession::init _isShortMKIEnabled:%@ _isTLEEnabled:%@ for groupID:%@", buf, 0x20u);
      }
      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
      {
        v156 = v15->_isShortMKIEnabled ? @"YES" : @"NO";
        v157 = v15->_isTLEEnabled ? @"YES" : @"NO";
        v158 = [(IDSDSession *)v15 sharedState];
        [v158 groupID];
        v362 = *((void *)&v360 + 1) = v157;
        *(void *)&long long v360 = v156;
        _IDSLogTransport();

        if (_IDSShouldLog())
        {
          if (v15->_isShortMKIEnabled) {
            CFStringRef v159 = @"YES";
          }
          else {
            CFStringRef v159 = @"NO";
          }
          if (v15->_isTLEEnabled) {
            CFStringRef v160 = @"YES";
          }
          else {
            CFStringRef v160 = @"NO";
          }
          v161 = [(IDSDSession *)v15 sharedState];
          [v161 groupID];
          v362 = *((void *)&v360 + 1) = v160;
          *(void *)&long long v360 = v159;
          _IDSLogV();
        }
      }
      -[IDSGroupEncryptionControllerGroup setShortMKIEnabled:](v15->_group, "setShortMKIEnabled:", v15->_isShortMKIEnabled, v360, v362);
      v162 = v15->_group;
      v163 = [(IDSDSession *)v15 sharedState];
      v164 = [v163 uniqueID];
      uint64_t v165 = [(IDSGroupEncryptionControllerGroup *)v162 ensureSessionForID:v164];
      groupSession = v15->_groupSession;
      v15->_groupSession = (_TtC17identityservicesd40IDSGroupEncryptionControllerGroupSession *)v165;

      v167 = [_TtC17identityservicesd45IDSGroupDefaultRootMaterialExchangeController alloc];
      v168 = [(IDSGroupEncryptionControllerGroup *)v15->_group config];
      v169 = v15->_groupSession;
      v170 = [v377 identifier];
      v171 = +[IDSGroupEncryptionController2Shim sharedInstance];
      v172 = [(IDSGroupDefaultRootMaterialExchangeController *)v167 initWithConfig:v168 session:v169 serviceID:v170 pushHandler:v171];
      exchangeController = v15->_exchangeController;
      v15->_exchangeController = v172;

      [(IDSGroupEncryptionControllerGroupSession *)v15->_groupSession setRootExchangeController:v15->_exchangeController];
      v174 = v15->_groupSession;
      v175 = v15->_metricsCollector;
      v176 = [(IDSDSession *)v15 groupStatusNotificationController];
      v177 = +[IDSDSessionKeyValueDelivery createWithDelegate:v15 session:v174 metricsCollector:v175 pushTokensForCapabilityProvider:v176];

      objc_storeStrong((id *)&v15->_keyValueDelivery, v177);
      [(OldIDSDSessionKeyValueDelivery *)v177 addMaterialProviderToSession:v15->_groupSession];
      v178 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v178, OS_LOG_TYPE_DEFAULT))
      {
        v179 = v15->_group;
        v180 = v15->_groupSession;
        v181 = v15->_exchangeController;
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v179;
        __int16 v405 = 2112;
        CFStringRef v406 = (const __CFString *)v180;
        __int16 v407 = 2112;
        CFStringRef v408 = (const __CFString *)v181;
        _os_log_impl((void *)&_mh_execute_header, v178, OS_LOG_TYPE_DEFAULT, "IDSDSession::init group:%@ session:%@ exchangeController:%@", buf, 0x20u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          v362 = v15->_exchangeController;
          long long v360 = *(_OWORD *)&v15->_group;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            v362 = v15->_exchangeController;
            long long v360 = *(_OWORD *)&v15->_group;
            _IDSLogV();
          }
        }
      }
    }
    else
    {
      v182 = [OldIDSDSessionKeyValueDelivery alloc];
      v183 = [(IDSDSession *)v15 sharedState];
      v184 = [v183 groupID];
      v185 = [(IDSDSession *)v15 sharedState];
      v186 = [v185 uniqueID];
      v177 = [(OldIDSDSessionKeyValueDelivery *)v182 initWithDelegate:v15 forGroupID:v184 sessionID:v186 metricsCollector:v15->_metricsCollector];

      objc_storeStrong((id *)&v15->_keyValueDelivery, v177);
    }

    v15->_multiplexerEnabled = 1;
    v187 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v187, OS_LOG_TYPE_DEFAULT))
    {
      v188 = [(IDSDSession *)v15 sharedState];
      uint64_t v189 = [v188 uniqueID];
      v190 = (void *)v189;
      v191 = v15->_instanceID;
      CFStringRef v192 = @"YES";
      if (!v15->_isLightweightParticipant) {
        CFStringRef v192 = @"NO";
      }
      *(_DWORD *)buf = 134218754;
      *(void *)&uint8_t buf[4] = v15;
      __int16 v405 = 2112;
      CFStringRef v406 = (const __CFString *)v189;
      __int16 v407 = 2112;
      CFStringRef v408 = (const __CFString *)v191;
      __int16 v409 = 2112;
      CFStringRef v410 = v192;
      _os_log_impl((void *)&_mh_execute_header, v187, OS_LOG_TYPE_DEFAULT, "IDSDSession::init { self: %p, uniqueID: %@, instanceID: %@, isLightweightParticipant: %@}", buf, 0x2Au);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      v193 = [(IDSDSession *)v15 sharedState];
      v194 = [v193 uniqueID];
      v195 = v15->_isLightweightParticipant ? @"YES" : @"NO";
      v362 = v15->_instanceID;
      v364 = v195;
      *(void *)&long long v360 = v15;
      *((void *)&v360 + 1) = v194;
      _IDSLogTransport();

      if (_IDSShouldLog())
      {
        v196 = [(IDSDSession *)v15 sharedState];
        uint64_t v197 = [v196 uniqueID];
        v198 = (void *)v197;
        if (v15->_isLightweightParticipant) {
          CFStringRef v199 = @"YES";
        }
        else {
          CFStringRef v199 = @"NO";
        }
        v362 = v15->_instanceID;
        v364 = (__CFString *)v199;
        *(void *)&long long v360 = v15;
        *((void *)&v360 + 1) = v197;
        _IDSLogV();
      }
    }
    if (v15->_supressClientNotifications)
    {
      v200 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v200, OS_LOG_TYPE_DEFAULT))
      {
        v201 = [(IDSDSession *)v15 sharedState];
        v202 = [v201 uniqueID];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v202;
        _os_log_impl((void *)&_mh_execute_header, v200, OS_LOG_TYPE_DEFAULT, "[!] This session will be suppressing client notifications { self.sharedState.uniqueID: %@ }", buf, 0xCu);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          v203 = [(IDSDSession *)v15 sharedState];
          *(void *)&long long v360 = [v203 uniqueID];
          _IDSLogTransport();

          if (_IDSShouldLog())
          {
            v204 = [(IDSDSession *)v15 sharedState];
            *(void *)&long long v360 = [v204 uniqueID];
            _IDSLogV();
          }
        }
      }
    }
    v15->_verboseFunctionalLogging = IMGetDomainBoolForKey();
    v15->_verbosePerformanceLogging = IMGetDomainBoolForKey();
    unsigned int v205 = [v381 isEqualToIgnoringCase:@"com.apple.private.alloy.screensharing"];
    v206 = [(IDSDSession *)v15 sharedState];
    v207 = v206;
    if (v205)
    {
      [v206 setIsScreenSharingSession:1];

      v208 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      id v209 = objc_alloc((Class)NSString);
      v210 = [(IDSDSession *)v15 sharedState];
      v211 = [v210 uniqueID];
      id v212 = [v209 initWithFormat:@"com.apple.ids.Session-ConnectionQueue-%@", v211];

      id v213 = v212;
      dispatch_queue_t v214 = dispatch_queue_create((const char *)[v213 UTF8String], v208);
      v215 = [[_IDSSessionConnection alloc] initWithQueue:v214];
      v216 = [(IDSDSession *)v15 sharedState];
      [v216 setConnection:v215];

      v217 = [(IDSDSession *)v15 sharedState];
      v218 = [v217 connection];
      [v218 setDelegate:v15];

      v219 = [(IDSDSession *)v15 sharedState];
      [v219 setInviteTimeout:30.0];

      v220 = [(IDSDSession *)v15 sharedState];
      [v220 setEndSessionTimeout:5.0];

      goto LABEL_189;
    }
    [v206 setIsScreenSharingSession:0];

    if (([v381 isEqualToString:@"com.apple.private.alloy.facetime.multi"] & 1) != 0
      || ([v381 isEqualToString:@"com.apple.private.alloy.arcade.fastsync"] & 1) != 0
      || ([v381 isEqualToString:@"com.apple.private.alloy.airdrop.walkaway"] & 1) != 0
      || ([v381 isEqualToString:@"com.apple.private.alloy.groupRemoteControl.cloud"] & 1) != 0|| objc_msgSend(v381, "isEqualToString:", @"com.apple.private.alloy.groupRemoteControl.session"))
    {
      v224 = [(IDSDSession *)v15 sharedState];
      [v224 setClientType:6];

      v225 = [(IDSDSession *)v15 sharedState];
      [v225 setUseQRDirectly:1];

      v15->_shouldAssertRealTimeMode = 1;
      v15->_supportUnauthenticatedUser = 1;
      if ([v381 isEqualToString:@"com.apple.private.alloy.facetime.multi"]) {
        v15->_isAutoDisconnectSupportedForGFTService = 1;
      }
      goto LABEL_169;
    }
    if ([v381 isEqualToString:@"com.apple.private.alloy.facetime.video"])
    {
      v348 = [(IDSDSession *)v15 sharedState];
      [v348 setClientType:1];

      v349 = [(IDSDSession *)v15 sharedState];
      [v349 setUseQRDirectly:1];
    }
    else if ([v381 isEqualToString:@"com.apple.private.alloy.facetime.audio"])
    {
      v350 = [(IDSDSession *)v15 sharedState];
      [v350 setClientType:5];

      v351 = [(IDSDSession *)v15 sharedState];
      [v351 setUseQRDirectly:1];
    }
    else
    {
      if (([v381 isEqualToString:@"com.apple.private.alloy.willow.stream"] & 1) != 0
        || ([v381 isEqualToString:@"com.apple.private.alloy.amp.potluck"] & 1) != 0
        || [v381 isEqualToString:@"com.apple.private.alloy.itunes"])
      {
        v352 = [(IDSDSession *)v15 sharedState];
        [v352 setClientType:2];

        goto LABEL_169;
      }
      if ([v381 isEqualToString:@"com.apple.private.alloy.safeview"])
      {
        v353 = [(IDSDSession *)v15 sharedState];
        [v353 setClientType:3];

        goto LABEL_169;
      }
      if ([v381 isEqualToString:@"com.apple.private.alloy.screensharing.qr"])
      {
        v354 = [(IDSDSession *)v15 sharedState];
        [v354 setClientType:7];

        goto LABEL_169;
      }
      if ([v381 isEqualToString:@"com.apple.private.alloy.tincan.audio"])
      {
        v355 = [(IDSDSession *)v15 sharedState];
        [v355 setClientType:100];

        goto LABEL_169;
      }
      if ([v381 isEqualToIgnoringCase:@"com.apple.private.alloy.phonecontinuity"])
      {

        v356 = [(IDSDSession *)v15 sharedState];
        [v356 setClientType:4];

        v357 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v357, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = &off_1009D0CF0;
          _os_log_impl((void *)&_mh_execute_header, v357, OS_LOG_TYPE_DEFAULT, "com.apple.private.alloy.phonecontinuity: set connectionCountHint to: %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          v374 = &off_1009D0CF0;
          if (!_IDSShouldLogTransport()) {
            goto LABEL_169;
          }
          *(void *)&long long v360 = &off_1009D0CF0;
          _IDSLogTransport();
          v374 = &off_1009D0CF0;
          if (!_IDSShouldLog()) {
            goto LABEL_169;
          }
          *(void *)&long long v360 = &off_1009D0CF0;
          _IDSLogV();
        }
        v374 = &off_1009D0CF0;
LABEL_169:
        v226 = [(IDSDSession *)v15 sharedState];
        unsigned int v227 = [v226 enableSingleChannelDirectMode];

        if (v227)
        {
          v228 = [(IDSDSession *)v15 sharedState];
          [v228 setUseQRDirectly:1];

          v15->_shouldAssertRealTimeMode = 1;
          v229 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v229, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v381;
            _os_log_impl((void *)&_mh_execute_header, v229, OS_LOG_TYPE_DEFAULT, "use QR directly for %@.", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              v361 = v381;
              _IDSLogTransport();
              if (_IDSShouldLog())
              {
                v361 = v381;
                _IDSLogV();
              }
            }
          }
        }
        long long v393 = 0u;
        long long v394 = 0u;
        long long v391 = 0u;
        long long v392 = 0u;
        v230 = [(IDSDSession *)v15 sharedState];
        v231 = [v230 destinations];

        id v232 = [v231 countByEnumeratingWithState:&v391 objects:v403 count:16];
        if (v232)
        {
          uint64_t v233 = *(void *)v392;
LABEL_178:
          uint64_t v234 = 0;
          while (1)
          {
            if (*(void *)v392 != v233) {
              objc_enumerationMutation(v231);
            }
            uint64_t v235 = *(void *)(*((void *)&v391 + 1) + 8 * v234);
            v236 = [(IDSDSession *)v15 sharedState];
            LODWORD(v235) = [v236 destinationIsDefaultPairedDevice:v235];

            if (!v235) {
              break;
            }
            if (v232 == (id)++v234)
            {
              id v232 = [v231 countByEnumeratingWithState:&v391 objects:v403 count:16];
              if (v232) {
                goto LABEL_178;
              }
              goto LABEL_187;
            }
          }

          v237 = [(IDSDSession *)v15 sharedState];
          unsigned __int8 v238 = [v237 enableQuickRelay];

          if (v238) {
            goto LABEL_188;
          }
          v231 = [(IDSDSession *)v15 utunController];
          v239 = [(IDSDSession *)v15 sharedState];
          v240 = [v239 uniqueID];
          [v231 startUDPGlobalLinkForDevice:v240];
        }
LABEL_187:

LABEL_188:
        v241 = [(IDSDSession *)v15 sharedState];
        [v241 setInviteTimeout:30.0];

        v208 = [(IDSDSession *)v15 sharedState];
        [v208 setEndSessionTimeout:2.0];
LABEL_189:

        id v242 = [v370 integerValue];
        v243 = [(IDSDSession *)v15 sharedState];
        [v243 setTransportType:v242];

        if ([v374 unsignedIntegerValue]) {
          uint64_t v244 = (uint64_t)[v374 unsignedIntegerValue];
        }
        else {
          uint64_t v244 = 2;
        }
        v245 = [(IDSDSession *)v15 sharedState];
        [v245 setConnectionCountHint:v244];

        v15->_reason = 0;
        v246 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v246, OS_LOG_TYPE_DEFAULT))
        {
          v247 = [(IDSDSession *)v15 sharedState];
          id v248 = [v247 connectionCountHint];
          CFStringRef v249 = (const __CFString *)[v374 unsignedIntegerValue];
          *(_DWORD *)buf = 134218240;
          *(void *)&uint8_t buf[4] = v248;
          __int16 v405 = 2048;
          CFStringRef v406 = v249;
          _os_log_impl((void *)&_mh_execute_header, v246, OS_LOG_TYPE_DEFAULT, " self.sharedState.connectionCountHint: %lu, [connectionCountHint unsignedIntegerValue]: %lu", buf, 0x16u);
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            v250 = [(IDSDSession *)v15 sharedState];
            *(void *)&long long v360 = [v250 connectionCountHint];
            *((void *)&v360 + 1) = [v374 unsignedIntegerValue];
            _IDSLogTransport();

            if (_IDSShouldLog())
            {
              v251 = [(IDSDSession *)v15 sharedState];
              *(void *)&long long v360 = [v251 connectionCountHint];
              *((void *)&v360 + 1) = [v374 unsignedIntegerValue];
              _IDSLogV();
            }
          }
        }
        v252 = [(IDSDSession *)v15 sharedState];
        v253 = [v252 serviceName];
        [(IDSDSession *)v15 _loggingFlags];
        DLCSessionBeginSession();

        uint64_t v390 = 0;
        IMGetConferenceSettings();
        id v365 = 0;
        v254 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v254, OS_LOG_TYPE_DEFAULT))
        {
          CFStringRef v255 = (const __CFString *)[(__CFString *)v384 count];
          CFStringRef v256 = @"incoming";
          *(_DWORD *)buf = 138413058;
          if (v382) {
            CFStringRef v256 = @"outgoing";
          }
          *(void *)&uint8_t buf[4] = v256;
          __int16 v405 = 2112;
          CFStringRef v406 = v378;
          __int16 v407 = 2048;
          CFStringRef v408 = v255;
          __int16 v409 = 2112;
          CFStringRef v410 = v384;
          _os_log_impl((void *)&_mh_execute_header, v254, OS_LOG_TYPE_DEFAULT, "Created session (%@) %@ with %lu destinations %@", buf, 0x2Au);
        }

        v257 = [(IDSDSession *)v15 sharedState];
        v258 = [v257 serviceName];
        if (v382) {
          CFStringRef v259 = @"outgoing";
        }
        else {
          CFStringRef v259 = @"incoming";
        }
        id v363 = [(__CFString *)v384 count];
        DLCSessionLogWithLevel();

        v260 = (NSString *)objc_msgSend(objc_alloc((Class)NSString), "initWithString:", v381, v259, v378, v363, v384);
        serviceIdentifier = v15->_serviceIdentifier;
        v15->_serviceIdentifier = v260;

        v366 = [(__CFString *)v378 componentsSeparatedByString:@"-"];
        theDicta = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        CFDictionarySetValue(theDicta, @"state", &off_1009D0D08);
        v262 = -[NSString substringFromIndex:](v15->_serviceIdentifier, "substringFromIndex:", [@"com.apple.private.alloy." length]);
        if (v262) {
          CFDictionarySetValue(theDicta, @"serviceName", v262);
        }

        v263 = [v366 objectAtIndexedSubscript:0];
        if (v263) {
          CFDictionarySetValue(theDicta, @"sessionID", v263);
        }

        v264 = +[NSNumber numberWithBool:v382];
        if (v264) {
          CFDictionarySetValue(theDicta, @"isInitiator", v264);
        }

        IDSPowerLogDictionary();
        if (v382)
        {
          if ((v367 & 1) == 0)
          {
            v267 = [(IDSDSession *)v15 sharedState];
            [v267 setState:1];

LABEL_220:
            BOOL startedAsUPlusOneSession = v15->_startedAsUPlusOneSession;
            v269 = [(IDSDSession *)v15 sharedState];
            [v269 setIsInUPlusOneMode:startedAsUPlusOneSession];

            v270 = +[IDSDSessionController sharedInstance];
            [v270 updateCriticalReliabilityState];

            v15->_socketDescriptor = -1;
            v271 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
            extraConnections = v15->_extraConnections;
            v15->_extraConnections = v271;

            v273 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
            participantIDToAVCBlob = v15->_participantIDToAVCBlob;
            v15->_participantIDToAVCBlob = v273;

            v275 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
            participantIDToTypeToEncryptedIDSContextBlobs = v15->_participantIDToTypeToEncryptedIDSContextBlobs;
            v15->_participantIDToTypeToEncryptedIDSContextBlobs = v275;

            v15->_linkProtocol = 2;
            v383 = IMGetDomainValueForKey();
            if (v383) {
              [(IDSDSession *)v15 _setLinkProtocol:v383];
            }
            if (v367)
            {
              uint64_t v277 = +[NSMutableData data];
              sessionInfoMetaData = v15->_sessionInfoMetaData;
              v15->_sessionInfoMetaData = (NSMutableData *)v277;

              v279 = [(IDSDSession *)v15 sharedState];
              [v279 setSharedSession:1];

              v280 = [(IDSDSession *)v15 sharedState];
              [v280 setUseQRDirectly:1];

              v281 = [(IDSDSession *)v15 sharedState];
              v282 = [v281 uniqueID];
              [(IDSDSession *)v15 openSocketToDevice:v282];

              if (v15->_isLightweightParticipant)
              {
                v283 = OSLogHandleForTransportCategory();
                if (os_log_type_enabled(v283, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v283, OS_LOG_TYPE_DEFAULT, "Skip IDSClientChannel because this is a lighweight participant.", buf, 2u);
                }

                if (os_log_shim_legacy_logging_enabled())
                {
                  if (_IDSShouldLogTransport())
                  {
                    _IDSLogTransport();
                    if (_IDSShouldLog()) {
                      _IDSLogV();
                    }
                  }
                }
              }
              else
              {
                [(IDSDSession *)v15 registerClientChannel];
              }
              if (v15->_multiplexerEnabled) {
                [(IDSDSession *)v15 registerMultiplexerTransport];
              }
              uint64_t v287 = [v14 objectForKey:kIDSQRAllocateKey_Reason];
              qrReason = v15->_qrReason;
              v15->_qrReason = (NSNumber *)v287;

              uint64_t v289 = [v14 objectForKey:kIDSQRAllocateKey_QRError];
              qrError = v15->_qrError;
              v15->_qrError = (NSNumber *)v289;

              v291 = [(IDSDSession *)v15 accountController];
              v292 = [(IDSDSession *)v15 sharedState];
              v293 = [v292 accountID];
              v294 = [v291 accountWithUniqueID:v293];
              v295 = [v294 primaryRegistration];
              v296 = [v295 pushToken];
              v297 = [v377 identifier];
              v368 = +[IDSPushToken pushTokenWithData:v296 withServiceLoggingHint:v297];

              if (!v368)
              {
                v338 = OSLogHandleForTransportCategory();
                if (os_log_type_enabled(v338, OS_LOG_TYPE_DEFAULT))
                {
                  v339 = [(IDSDSession *)v15 sharedState];
                  v340 = [v339 groupID];
                  v341 = [(IDSDSession *)v15 sharedState];
                  v342 = [v341 serviceName];
                  *(_DWORD *)buf = 138412546;
                  *(void *)&uint8_t buf[4] = v340;
                  __int16 v405 = 2112;
                  CFStringRef v406 = v342;
                  _os_log_impl((void *)&_mh_execute_header, v338, OS_LOG_TYPE_DEFAULT, "Could not create session: %@ because failed to get this device push token for the service: %@", buf, 0x16u);
                }
                if (!os_log_shim_legacy_logging_enabled()) {
                  goto LABEL_266;
                }
                if (!_IDSShouldLogTransport()) {
                  goto LABEL_266;
                }
                v343 = [(IDSDSession *)v15 sharedState];
                v344 = [v343 groupID];
                v345 = [(IDSDSession *)v15 sharedState];
                [v345 serviceName];
                *((void *)&v360 + 1) = *(void *)&long long v360 = v344;
                _IDSLogTransport();

                if (!_IDSShouldLog())
                {
LABEL_266:
                  int v223 = 1;
                  goto LABEL_267;
                }
                id v326 = [(IDSDSession *)v15 sharedState];
                v330 = [v326 groupID];
                v336 = [(IDSDSession *)v15 sharedState];
                v337 = [v336 serviceName];
                *(void *)&long long v360 = v330;
                *((void *)&v360 + 1) = v337;
                _IDSLogV();
                int v223 = 1;
                goto LABEL_258;
              }
              v298 = [(IDSDSession *)v15 groupStatusNotificationController];
              v299 = [v298 queue];
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              block[2] = sub_100087C78;
              block[3] = &unk_10097E4D0;
              v300 = v15;
              v389 = v300;
              v301 = v299;
              dispatch_block_t v302 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, block);
              dispatch_async(v301, v302);

              v303 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v303, OS_LOG_TYPE_DEFAULT))
              {
                v304 = [(IDSDSession *)v300 sharedState];
                v305 = [v304 destinations];
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v305;
                _os_log_impl((void *)&_mh_execute_header, v303, OS_LOG_TYPE_DEFAULT, "Destinations are %@", buf, 0xCu);
              }
              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  v306 = [(IDSDSession *)v300 sharedState];
                  *(void *)&long long v360 = [v306 destinations];
                  _IDSLogTransport();

                  if (_IDSShouldLog())
                  {
                    v307 = [(IDSDSession *)v300 sharedState];
                    *(void *)&long long v360 = [v307 destinations];
                    _IDSLogV();
                  }
                }
              }
              v308 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v308, OS_LOG_TYPE_DEFAULT))
              {
                v309 = [(IDSDSession *)v300 sharedState];
                v310 = [v309 destinationsLightweightStatus];
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v310;
                _os_log_impl((void *)&_mh_execute_header, v308, OS_LOG_TYPE_DEFAULT, "Lightweight status per destination: %@", buf, 0xCu);
              }
              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  v311 = [(IDSDSession *)v300 sharedState];
                  *(void *)&long long v360 = [v311 destinationsLightweightStatus];
                  _IDSLogTransport();

                  if (_IDSShouldLog())
                  {
                    v312 = [(IDSDSession *)v300 sharedState];
                    *(void *)&long long v360 = [v312 destinationsLightweightStatus];
                    _IDSLogV();
                  }
                }
              }
              v313 = +[IDSGroupEncryptionController sharedInstance];
              v314 = [(IDSDSession *)v300 sharedState];
              v315 = [v314 accountID];
              v316 = [(IDSDSession *)v300 sharedState];
              v317 = [v316 fromURI];
              v318 = [(IDSDSession *)v300 sharedState];
              v319 = [v318 groupID];
              [v313 setAccount:v315 fromURI:v317 forGroup:v319];

              v320 = im_primary_queue();
              v385[0] = _NSConcreteStackBlock;
              v385[1] = 3221225472;
              v385[2] = sub_100087E00;
              v385[3] = &unk_10097E440;
              v386 = v300;
              id v321 = v368;
              id v387 = v321;
              v322 = v320;
              dispatch_block_t v323 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, v385);
              dispatch_async(v322, v323);
            }
            v324 = [v14 objectForKey:IDSGroupSessionWantDidInitCallbackKey];
            unsigned int v325 = [v324 BOOLValue];

            if (!v325)
            {
              int v223 = 0;
              goto LABEL_267;
            }
            id v326 = objc_alloc_init((Class)IMMessageContext);
            [v326 setShouldBoost:1];
            v327 = +[IDSDaemon sharedInstance];
            v328 = [(IDSDSession *)v15 sharedState];
            v329 = [v328 pushTopic];
            v330 = [v327 broadcasterForTopic:v329 entitlement:kIDSSessionEntitlement command:0 messageContext:v326];

            v331 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v331, OS_LOG_TYPE_DEFAULT))
            {
              v332 = [(IDSDSession *)v15 sharedState];
              v333 = [v332 uniqueID];
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v333;
              _os_log_impl((void *)&_mh_execute_header, v331, OS_LOG_TYPE_DEFAULT, "Broadcasting did initialize group session: %@", buf, 0xCu);
            }
            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                v334 = [(IDSDSession *)v15 sharedState];
                *(void *)&long long v360 = [v334 uniqueID];
                _IDSLogTransport();

                if (_IDSShouldLog())
                {
                  v335 = [(IDSDSession *)v15 sharedState];
                  *(void *)&long long v360 = [v335 uniqueID];
                  _IDSLogV();
                }
              }
            }
            v336 = [(IDSDSession *)v15 sharedState];
            v337 = [v336 uniqueID];
            [v330 groupSessionDidInitialize:v337 error:0];
            int v223 = 0;
LABEL_258:

LABEL_267:
            v222 = (void *)v369;
            goto LABEL_268;
          }
          if (!v15->_startedAsUPlusOneSession) {
            goto LABEL_220;
          }
          if (qword_100A4A5D0 == -1)
          {
LABEL_217:
            v15->_inviteRecvTime = *(double *)&qword_100A4A5D8 * (double)mach_continuous_time();
            goto LABEL_220;
          }
        }
        else
        {
          v265 = [(IDSDSession *)v15 sharedState];
          [v265 setInvitationTimer];

          v266 = [(IDSDSession *)v15 sharedState];
          [v266 setState:2];

          if (qword_100A4A5D0 == -1) {
            goto LABEL_217;
          }
        }
        dispatch_once(&qword_100A4A5D0, &stru_100981748);
        goto LABEL_217;
      }
      if (![v381 isEqualToString:@"com.apple.private.alloy.carmelsync"]
        && ![v381 isEqualToString:@"com.apple.private.alloy.notes"]
        && ![v381 isEqualToString:@"com.apple.private.alloy.dropin.communication"]
        && ![v381 isEqualToString:@"com.apple.private.alloy.safari.groupactivities"]&& !objc_msgSend(v381, "isEqualToString:", @"com.apple.private.alloy.gftaastest.communication"))
      {
        goto LABEL_169;
      }
      v358 = [(IDSDSession *)v15 sharedState];
      [v358 setClientType:6];

      v359 = [(IDSDSession *)v15 sharedState];
      [v359 setUseQRDirectly:1];
    }
    v15->_shouldAssertRealTimeMode = 1;
    goto LABEL_169;
  }
  v221 = +[IDSFoundationLog IDSDSession];
  v222 = v221;
  if (os_log_type_enabled(v221, OS_LOG_TYPE_ERROR))
  {
    sub_10070BF9C();
    int v223 = 1;
    v222 = v221;
  }
  else
  {
    int v223 = 1;
  }
LABEL_268:

  if (!v223)
  {
LABEL_270:
    [(IDSDSession *)v15 submitAWDMetricsForIDSSessionStarted];
    v346 = v15;
    goto LABEL_271;
  }
  v346 = 0;
LABEL_271:

  return v346;
}

- (void)dealloc
{
  unsigned int v3 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(IDSDSession *)self sharedState];
    v5 = [v4 uniqueID];
    id v6 = [(IDSDSession *)self instanceID];
    *(_DWORD *)buf = 134218498;
    __int16 v50 = self;
    __int16 v51 = 2112;
    dispatch_queue_t v52 = v5;
    __int16 v53 = 2112;
    int v54 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "IDSDSession::dealloc { self: %p, uniqueID: %@, instanceID: %@ }", buf, 0x20u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      v7 = [(IDSDSession *)self sharedState];
      id v8 = [v7 uniqueID];
      [(IDSDSession *)self instanceID];
      v47 = v46 = v8;
      BOOL v44 = self;
      _IDSLogTransport();

      if (_IDSShouldLog())
      {
        id v9 = [(IDSDSession *)self sharedState];
        id v10 = [v9 uniqueID];
        [(IDSDSession *)self instanceID];
        v47 = v46 = v10;
        BOOL v44 = self;
        _IDSLogV();
      }
    }
  }
  id v11 = [(IDSDSession *)self utunController];
  id v12 = [(IDSDSession *)self sharedState];
  id v13 = [v12 uniqueID];
  [v11 clearPluginCacheForSession:v13];

  *(_OWORD *)&self->_keyMaterial[16] = 0u;
  *(_OWORD *)&self->_keyMaterial[32] = 0u;
  *(_OWORD *)self->_keyMaterial = 0u;
  *(_OWORD *)&self->_keyMaterial[44] = 0u;
  id v14 = [(IDSDSession *)self sharedState];
  id v15 = [v14 encryptionState];

  sub_100221340((uint64_t)v15);
  uint64_t v16 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = [(IDSDSession *)self sharedState];
    uint64_t v18 = [v17 uniqueID];
    *(_DWORD *)buf = 138412290;
    __int16 v50 = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Destroyed session %@", buf, 0xCu);
  }
  v19 = [(IDSDSession *)self sharedState];
  v20 = [v19 serviceName];
  uint64_t v21 = [(IDSDSession *)self sharedState];
  v45 = [v21 uniqueID];
  DLCSessionLogWithLevel();

  v22 = [(IDSDSession *)self sharedState];
  v23 = [v22 serviceName];
  DLCSessionEndSession();

  v24 = [(IDSDSession *)self sharedState];
  v25 = [v24 serviceName];

  if (v25)
  {
    id v26 = objc_alloc((Class)NSString);
    v27 = [(IDSDSession *)self sharedState];
    v28 = [v27 serviceName];
    id v29 = [v26 initWithString:v28];

    [(IDSDSession *)self _resetPreferences:v29];
  }
  v30 = [(IDSDSession *)self sharedState];
  [v30 setState:8];

  [(IDSDSession *)self _cleanupSessionConnection];
  [(IDSBaseSocketPairConnection *)self->_baseSocketPairConnection endSession];
  v31 = +[IDSDSessionController sharedInstance];
  [v31 updateCriticalReliabilityState];

  extraConnections = self->_extraConnections;
  self->_extraConnections = 0;

  participantIDToAVCBlob = self->_participantIDToAVCBlob;
  self->_participantIDToAVCBlob = 0;

  participantIDToTypeToEncryptedIDSContextBlobs = self->_participantIDToTypeToEncryptedIDSContextBlobs;
  self->_participantIDToTypeToEncryptedIDSContextBlobs = 0;

  id reliableUnicastRegistrationCompletionBlock = self->_reliableUnicastRegistrationCompletionBlock;
  if (reliableUnicastRegistrationCompletionBlock)
  {
    self->_id reliableUnicastRegistrationCompletionBlock = 0;
  }
  v36 = [(IDSDSession *)self utunController];
  id v37 = [(IDSDSession *)self sharedState];
  id v38 = [v37 uniqueID];
  [v36 clearReliableUnicastStateForSession:v38];

  [(IDSDSession *)self _checkAndUnassertRealTimeMode];
  v39 = [(IDSDSession *)self sharedState];
  [v39 clearAllTimers];

  ctClient = self->_ctClient;
  self->_ctClient = 0;

  cellularNetworkInterfaceBringupTime = self->_cellularNetworkInterfaceBringupTime;
  self->_cellularNetworkInterfaceBringupTime = 0;

  cellularNetworkInfoSessionEvent = self->_cellularNetworkInfoSessionEvent;
  self->_cellularNetworkInfoSessionEvent = 0;

  self->_cellularSlicingFlags = 0;
  networkSlicingReportingQueue = self->_networkSlicingReportingQueue;
  self->_networkSlicingReportingQueue = 0;

  v48.receiver = self;
  v48.super_class = (Class)IDSDSession;
  [(IDSDSession *)&v48 dealloc];
}

- (char)keyMaterial
{
  v2 = [(IDSDSession *)self invitationManager];
  unsigned int v3 = v2 + 8;

  return v3;
}

- (IDSXPCGroupSessionKeyValueDelivery)keyValueDelivery
{
  return self->_keyValueDelivery;
}

- (NSString)description
{
  v19 = [(IDSDSession *)self sharedState];
  unsigned int v3 = [v19 uniqueID];
  uint64_t v18 = [(IDSDSession *)self sharedState];
  id v4 = [v18 accountID];
  uint64_t v16 = [(IDSDSession *)self accountController];
  v17 = [(IDSDSession *)self sharedState];
  v5 = [v17 accountID];
  id v6 = [v16 accountWithUniqueID:v5];
  v7 = [v6 service];
  id v8 = [v7 serviceName];
  id v9 = [(IDSDSession *)self sharedState];
  id v10 = [v9 destinations];
  id v11 = [(IDSDSession *)self sharedState];
  id v12 = [v11 transportType];
  CFStringRef v13 = @"Unreliable";
  if (v12 == (id)1) {
    CFStringRef v13 = @"Reliable";
  }
  id v14 = +[NSString stringWithFormat:@"<%p> - uniqueID: %@   accountID: %@   service: %@   destinations: %@   transportType: %@", self, v3, v4, v8, v10, v13];

  return (NSString *)v14;
}

- (BOOL)sessionIsActive
{
  return [(IDSDSession *)self groupSessionState] == 1;
}

- (unint64_t)_getExperimentGroupThresholdForCellularSlicing
{
  v2 = +[IDSServerBag sharedInstanceForBagType:0];
  unsigned int v3 = [v2 objectForKey:@"ids-threshold-percentage-for-cellular-slicing"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unint64_t v4 = (unint64_t)[v3 unsignedIntegerValue];
  }
  else {
    unint64_t v4 = 100;
  }

  return v4;
}

- (BOOL)_shouldEnableCellularSlicingAfterDiceRoll
{
  unint64_t v3 = [(IDSDSession *)self _getExperimentGroupThresholdForCellularSlicing];
  unint64_t v4 = +[NSNumber numberWithUnsignedInt:arc4random_uniform(0x64u)];
  v5 = +[IMLockdownManager sharedInstance];
  unsigned int v6 = [v5 isCarrierInstall];

  if (v3 > [v4 unsignedIntValue]) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v6;
  }
  if (v7) {
    self->_cellularSlicingFlags |= 0x40u;
  }
  id v8 = +[IDSFoundationLog IDSDSession];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (v6) {
      CFStringRef v9 = @"YES";
    }
    else {
      CFStringRef v9 = @"NO";
    }
    int v11 = 138412802;
    CFStringRef v12 = v9;
    __int16 v13 = 2048;
    unint64_t v14 = v3;
    __int16 v15 = 1024;
    unsigned int v16 = [v4 unsignedIntValue];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sliced cellular interface - isCarrierInstall (%@), currentServerBagPercentage (%lu), diceRoll (%u)", (uint8_t *)&v11, 0x1Cu);
  }

  return v7;
}

- (id)rtcNormalizeTime:(double)a3
{
  if (a3 <= 0.0) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = (int)((a3 - self->_summaryReportBaseTime) * 1000.0);
  }
  return +[NSNumber numberWithInt:v3];
}

- (id)buildRTCSummaryReport
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  [(__CFDictionary *)Mutable setObject:&off_1009D0D20 forKeyedSubscript:IDSDSessionReportQREventSubTypeKey];
  unint64_t v4 = +[NSNumber numberWithBool:self->_startedAsUPlusOneSession];
  [(__CFDictionary *)Mutable setObject:v4 forKeyedSubscript:IDSDSessionReportSummaryStartedAsUPlusOne];

  v5 = +[NSNumber numberWithBool:self->_switchedToUPlusMany];
  [(__CFDictionary *)Mutable setObject:v5 forKeyedSubscript:IDSDSessionReportSummarySwitchedToUPlusMany];

  unsigned int v6 = [(IDSDSession *)self rtcNormalizeTime:self->_joinStartTime];
  [(__CFDictionary *)Mutable setObject:v6 forKeyedSubscript:IDSDSessionReportSummaryJoinStartTimeKey];

  BOOL v7 = [(IDSDSession *)self rtcNormalizeTime:self->_joinSendStartTime];
  [(__CFDictionary *)Mutable setObject:v7 forKeyedSubscript:IDSDSessionReportSummaryJoinPushSendStartTimeKey];

  id v8 = [(IDSDSession *)self rtcNormalizeTime:self->_joinSendEndTime];
  [(__CFDictionary *)Mutable setObject:v8 forKeyedSubscript:IDSDSessionReportSummaryJoinPushSendEndTimeKey];

  CFStringRef v9 = [(IDSDSession *)self rtcNormalizeTime:self->_joinRecvTime];
  [(__CFDictionary *)Mutable setObject:v9 forKeyedSubscript:IDSDSessionReportSummaryJoinPushRecvTimeKey];

  id v10 = [(IDSDSession *)self rtcNormalizeTime:self->_clientChannelConnectTime];
  [(__CFDictionary *)Mutable setObject:v10 forKeyedSubscript:IDSDSessionReportSummaryClientChannelConnectedTimeKey];

  int v11 = [(IDSDSession *)self rtcNormalizeTime:self->_firstMKMReceivedTime];
  [(__CFDictionary *)Mutable setObject:v11 forKeyedSubscript:IDSDSessionReportSummaryFirstMKMReceivedTimeKey];

  CFStringRef v12 = [(IDSDSession *)self rtcNormalizeTime:self->_firstMKMSentTime];
  [(__CFDictionary *)Mutable setObject:v12 forKeyedSubscript:IDSDSessionReportSummaryFirstMKMSentTimeKey];

  __int16 v13 = [(IDSDSession *)self rtcNormalizeTime:self->_firstPacketReceivedTime];
  [(__CFDictionary *)Mutable setObject:v13 forKeyedSubscript:IDSDSessionReportSummaryFirstPacketReceivedTimeKey];

  return Mutable;
}

- (void)_reportRTC
{
  v35 = [(IDSGFTMetricsCollector *)self->_metricsCollector collectForTimeBase:1 anonymize:self->_timeBase];
  v2 = [(IDSGFTMetricsCollector *)self->_metricsCollector collectForTimeBase:0 anonymize:self->_timeBase];
  uint64_t v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    cellularNetworkInfoSessionEvent = self->_cellularNetworkInfoSessionEvent;
    *(_DWORD *)buf = 138412290;
    double v47 = *(double *)&cellularNetworkInfoSessionEvent;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "networkSlicing: Adding _cellularNetworkInfoSessionEvent=%@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    v31 = self->_cellularNetworkInfoSessionEvent;
    _IDSLogV();
  }
  if (self->_cellularNetworkInfoSessionEvent) {
    -[NSMutableArray addObject:](self->_qrEventsForRTCReports, "addObject:");
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v2;
  id v5 = [obj countByEnumeratingWithState:&v42 objects:v51 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v43;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v43 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(NSDictionary **)(*((void *)&v42 + 1) + 8 * i);
        CFStringRef v9 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          double v47 = *(double *)&v8;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "GFTMetrics will report %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            v31 = v8;
            _IDSLogTransport();
            if (_IDSShouldLog())
            {
              v31 = v8;
              _IDSLogV();
            }
          }
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v42 objects:v51 count:16];
    }
    while (v5);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v10 = v35;
  id v11 = [v10 countByEnumeratingWithState:&v38 objects:v50 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v39;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v39 != v12) {
          objc_enumerationMutation(v10);
        }
        -[NSMutableArray addObject:](self->_qrEventsForRTCReports, "addObject:", *(void *)(*((void *)&v38 + 1) + 8 * (void)j), v31);
      }
      id v11 = [v10 countByEnumeratingWithState:&v38 objects:v50 count:16];
    }
    while (v11);
  }

  double v14 = self->_MKMOverPushTime - self->_MKMOverQRQUICTime;
  __int16 v15 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v47 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "time difference between MKM over push and MKM over QR QUIC: %.3f", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      v31 = *(NSDictionary **)&v14;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        v31 = *(NSDictionary **)&v14;
        _IDSLogV();
      }
    }
  }
  if ([(NSMutableArray *)self->_qrEventsForRTCReports count])
  {
    unsigned int v16 = [(IDSDSession *)self buildRTCSummaryReport];
    v17 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v47 = *(double *)&v16;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "_reportRTC summary: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        v32 = v16;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          v32 = v16;
          _IDSLogV();
        }
      }
    }
    -[NSMutableArray addObject:](self->_qrEventsForRTCReports, "addObject:", v16, v32);
    id v18 = objc_alloc_init((Class)IMMessageContext);
    [v18 setShouldBoost:1];
    v19 = +[IDSDaemon sharedInstance];
    v20 = [(IDSDSession *)self sharedState];
    uint64_t v21 = [v20 pushTopic];
    v22 = [v19 broadcasterForTopic:v21 entitlement:kIDSSessionEntitlement command:0 messageContext:v18];

    v23 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = [(IDSDSession *)self sharedState];
      v25 = [v24 uniqueID];
      *(_DWORD *)buf = 134218242;
      double v47 = *(double *)&v22;
      __int16 v48 = 2112;
      v49 = v25;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "didReceiveReport, broadcaster: %p for session: %@", buf, 0x16u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        id v26 = [(IDSDSession *)self sharedState];
        [v26 uniqueID];
        v34 = v33 = v22;
        _IDSLogTransport();

        if (_IDSShouldLog())
        {
          v27 = [(IDSDSession *)self sharedState];
          [v27 uniqueID];
          v34 = v33 = v22;
          _IDSLogV();
        }
      }
    }
    v28 = [(IDSDSession *)self sharedState];
    id v29 = [v28 uniqueID];
    [v22 session:v29 didReceiveReport:self->_qrEventsForRTCReports];
  }
  else
  {
    v30 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "No valid RTC reports to report", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
  }
}

- (void)_cleanupSessionConnection
{
  uint64_t v3 = [(IDSDSession *)self sharedState];
  unint64_t v4 = [v3 connection];

  if (v4)
  {
    id v5 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(IDSDSession *)self sharedState];
      BOOL v7 = [v6 uniqueID];
      id v8 = [(IDSDSession *)self sharedState];
      CFStringRef v9 = [v8 connection];
      *(_DWORD *)buf = 136315650;
      v23 = "-[IDSDSession _cleanupSessionConnection]";
      __int16 v24 = 2112;
      v25 = v7;
      __int16 v26 = 2048;
      v27 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: session %@ connection %p", buf, 0x20u);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      id v10 = [(IDSDSession *)self sharedState];
      id v11 = [v10 uniqueID];
      uint64_t v12 = [(IDSDSession *)self sharedState];
      [v12 connection];
      uint64_t v21 = v20 = v11;
      v19 = "-[IDSDSession _cleanupSessionConnection]";
      _IDSLogTransport();

      if (_IDSShouldLog())
      {
        __int16 v13 = -[IDSDSession sharedState](self, "sharedState", "-[IDSDSession _cleanupSessionConnection]", v11, v21);
        double v14 = [v13 uniqueID];
        __int16 v15 = [(IDSDSession *)self sharedState];
        [v15 connection];
        uint64_t v21 = v20 = v14;
        v19 = "-[IDSDSession _cleanupSessionConnection]";
        _IDSLogV();
      }
    }
    unsigned int v16 = [(IDSDSession *)self sharedState];
    v17 = [v16 connection];
    [v17 setDelegate:0];

    id v18 = [(IDSDSession *)self sharedState];
    [v18 setConnection:0];
  }
}

- (void)reportFirstMKMReceivedFromPush:(double)a3
{
  if (!self->_hasReportedReceivedMKM)
  {
    self->_hasReportedReceivedMKM = 1;
    id v5 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v26 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "reportMKMReceived received first MKM at %f time", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        double v20 = a3;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          double v20 = a3;
          _IDSLogV();
        }
      }
    }
    self->_MKMOverPushTime = a3;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v6 = self->_qrEventsForRTCReports;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v22;
      uint64_t v9 = IDSDSessionReportQREventSubTypeKey;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v12 = objc_msgSend(v11, "objectForKey:", v9, *(void *)&v20);
          BOOL v13 = [v12 integerValue] == (id)311;

          if (v13)
          {
            uint64_t v14 = IDSDSessionReportDurationKey;
            __int16 v15 = [v11 objectForKey:IDSDSessionReportDurationKey];
            [v15 doubleValue];
            double v17 = v16;

            id v18 = +[NSNumber numberWithInt:(int)((a3 - v17) * 1000.0)];
            [v11 setObject:v18 forKeyedSubscript:v14];

            v19 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218240;
              double v26 = v17;
              __int16 v27 = 1024;
              int v28 = (int)((a3 - v17) * 1000.0);
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "reportFirstMKMReceivedFromPush: get allocbind RTC report, time of allocbind response: %f, set the duration to %d ms", buf, 0x12u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport();
                if (_IDSShouldLog()) {
                  _IDSLogV();
                }
              }
            }
            goto LABEL_23;
          }
        }
        id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_23:

    if (qword_100A4A5D0 != -1) {
      dispatch_once(&qword_100A4A5D0, &stru_100981748);
    }
    self->_firstMKMReceivedTime = *(double *)&qword_100A4A5D8 * (double)mach_continuous_time();
  }
}

- (void)reportFirstMKMReceivedFromQR:(double)a3
{
  self->_MKMOverQRTime = a3;
}

- (void)reportJoinReceivedOverPushFromToken:(id)a3
{
}

- (void)reportPreKeyReceivedOverPushFromToken:(id)a3
{
  id v3 = [(IDSGFTMetricsCollector *)self->_metricsCollector joinCycleForToken:a3];
  [v3 receivedPreKeyOverPush];
}

- (void)reportMKMReceivedOverPushFromToken:(id)a3 material:(id)a4
{
  metricsCollector = self->_metricsCollector;
  id v7 = a4;
  id v11 = a3;
  [(IDSGFTMetricsCollector *)metricsCollector receivedKMOverPushFromToken:v11];
  uint64_t v8 = self->_metricsCollector;
  uint64_t v9 = [v7 objectForKeyedSubscript:IDSRealTimeEncryptionMKI];
  id v10 = [(IDSGFTMetricsCollector *)v8 getOrCreateMKICycleFor:v9];
  [v10 receivedFromPush];

  [(IDSDSession *)self mapMKIFromMaterial:v7 token:v11];
}

- (void)reportMKMReceivedOverPushViaCacheForParticipantID:(unint64_t)a3 material:(id)a4
{
  id v6 = a4;
  id v11 = v6;
  if (a3)
  {
    id v7 = [(IDSDSession *)self _getPushTokenFromParticipantID:a3];
    metricsCollector = self->_metricsCollector;
    if (v7)
    {
      [(IDSGFTMetricsCollector *)self->_metricsCollector receivedKMOverPushViaCacheForToken:v7];
      [(IDSDSession *)self mapMKIFromMaterial:v11 token:v7];
    }
    else
    {
      id v10 = [v11 objectForKeyedSubscript:IDSRealTimeEncryptionMKI];
      [(IDSGFTMetricsCollector *)metricsCollector receivedUnknownKMOverPushViaCache:v10];
    }
  }
  else
  {
    uint64_t v9 = self->_metricsCollector;
    id v7 = [v6 objectForKeyedSubscript:IDSRealTimeEncryptionMKI];
    [(IDSGFTMetricsCollector *)v9 receivedUnknownKMOverPushViaCache:v7];
  }
}

- (void)reportMKMReceivedOverQRFromToken:(id)a3 material:(id)a4
{
  metricsCollector = self->_metricsCollector;
  id v7 = a4;
  id v11 = a3;
  [(IDSGFTMetricsCollector *)metricsCollector receivedKMOverQRFromToken:v11];
  uint64_t v8 = self->_metricsCollector;
  uint64_t v9 = [v7 objectForKeyedSubscript:IDSRealTimeEncryptionMKI];
  id v10 = [(IDSGFTMetricsCollector *)v8 getOrCreateMKICycleFor:v9];
  [v10 receivedFromQR];

  [(IDSDSession *)self mapMKIFromMaterial:v7 token:v11];
}

- (void)reportSendRatchetedMKMToAVCForParticipantID:(unint64_t)a3 mki:(id)a4
{
  id v10 = a4;
  id v6 = [(IDSDSession *)self _getPushTokenFromParticipantID:a3];
  if (v6)
  {
    [(IDSGFTMetricsCollector *)self->_metricsCollector sendRatchetedKMtoAVCForToken:v6];
    metricsCollector = self->_metricsCollector;
    uint64_t v8 = IDSGetUUIDDataFromNSUUID();
    uint64_t v9 = [(IDSGFTMetricsCollector *)metricsCollector getOrCreateMKICycleFor:v8];
    [v9 receivedFromRatcheting];
  }
}

- (void)mapMKIFromMaterial:(id)a3 token:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v9 = v6;
    id v7 = [a3 objectForKeyedSubscript:IDSRealTimeEncryptionMKI];
    uint64_t v8 = v7;
    if (v7 && ([v7 isNull] & 1) == 0) {
      [(IDSGFTMetricsCollector *)self->_metricsCollector mapMKI:v8 toPushToken:v9];
    }

    id v6 = v9;
  }
}

- (void)_lightweightParticipantSync:(unsigned __int8)a3
{
  if (self->_isLightweightParticipant)
  {
    unsigned int currentGenerationCounter = self->_currentGenerationCounter;
    if ((currentGenerationCounter - a3) >= 0x81u)
    {
      id v6 = im_primary_queue();
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100089DA4;
      v8[3] = &unk_100980D38;
      v8[4] = self;
      unsigned __int8 v9 = a3;
      char v10 = currentGenerationCounter;
      dispatch_block_t v7 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, v8);
      dispatch_async(v6, v7);
    }
  }
}

- (void)_buildCellularNetworkInfoSessionEvent:(id *)a3
{
  unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)&v10, self);
  networkSlicingReportingQueue = self->_networkSlicingReportingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100089FBC;
  block[3] = &unk_100980D60;
  objc_copyWeak(&v12, (id *)&v10);
  long long v6 = *(_OWORD *)&a3->var2;
  long long v7 = *(_OWORD *)&a3->var19[3];
  long long v8 = *(_OWORD *)&a3->var21[2];
  long long v16 = *(_OWORD *)&a3->var13;
  long long v17 = v7;
  long long v18 = v8;
  int v19 = *(_DWORD *)&a3->var23;
  long long v9 = *(_OWORD *)a3->var1;
  long long v13 = *(_OWORD *)a3->var0;
  long long v14 = v9;
  long long v15 = v6;
  dispatch_async(networkSlicingReportingQueue, block);
  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)&v10);
}

- (id)getCellularNetworkInfo:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    long long v24 = 0;
    goto LABEL_21;
  }
  id v5 = [(CoreTelephonyClient *)self->_ctClient getPreferredDataSubscriptionContextSync:0];
  if (!v5)
  {
    long long v24 = 0;
    goto LABEL_20;
  }
  uint64_t v6 = 28;
  BOOL v7 = 1;
  do
  {
    long long v8 = [(CoreTelephonyClient *)self->_ctClient getConnectionState:v5 connectionType:v6 error:0];
    if (v8)
    {
      long long v9 = v8;
      unint64_t v10 = [v8 interfaceName];
      unsigned __int8 v11 = [v10 isEqualToString:v4];

      if (v11) {
        break;
      }
    }
    int v12 = v6 + 1;
    BOOL v7 = v6 < 0x23;
    uint64_t v6 = (v6 + 1);
  }
  while (v12 != 36);
  ctClient = self->_ctClient;
  id v14 = [objc_alloc((Class)CTBundle) initWithBundleType:1];
  id v15 = [(CoreTelephonyClient *)ctClient copyBundleIdentifier:v5 bundleType:v14 error:0];

  long long v16 = 0;
  if ([v15 hasPrefix:@"com.apple."])
  {
    long long v16 = [v15 substringFromIndex:objc_msgSend(@"com.apple.", "length")];
  }

  long long v17 = self->_ctClient;
  id v18 = [objc_alloc((Class)CTBundle) initWithBundleType:2];
  id v19 = [(CoreTelephonyClient *)v17 copyBundleIdentifier:v5 bundleType:v18 error:0];

  double v20 = 0;
  if ([v19 hasPrefix:@"com.apple."])
  {
    double v20 = [v19 substringFromIndex:objc_msgSend(@"com.apple.", "length")];
  }

  v27[0] = v4;
  v26[0] = IDSDSessionReportCellularNetworkInfoCellularInterfaceName;
  v26[1] = IDSDSessionReportCellularNetworkInfoIsNetworkSliceActive;
  long long v21 = +[NSNumber numberWithBool:v7];
  v27[1] = v21;
  v26[2] = IDSDSessionReportCellularNetworkInfoHomeCarrierName;
  long long v22 = v16;
  if (!v16)
  {
    long long v22 = +[NSNull null];
  }
  v27[2] = v22;
  v26[3] = IDSDSessionReportCellularNetworkInfoServingCarrierName;
  long long v23 = v20;
  if (!v20)
  {
    long long v23 = +[NSNull null];
  }
  v27[3] = v23;
  long long v24 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:4];
  if (!v20)
  {

    if (v16) {
      goto LABEL_17;
    }
LABEL_25:

    goto LABEL_17;
  }
  if (!v16) {
    goto LABEL_25;
  }
LABEL_17:

LABEL_20:
LABEL_21:

  return v24;
}

- (id)_getPushTokensFromParticipantIDArray:(id)a3 useNullPlaceholder:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = -[IDSDSession _getPushTokenFromParticipantIDNumber:](self, "_getPushTokenFromParticipantIDNumber:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        if (v13)
        {
          [v7 addObject:v13];
        }
        else
        {
          if (v4)
          {
            id v14 = +[NSNull null];
            [v7 addObject:v14];
          }
          [(IDSGFTMetricsCollector *)self->_metricsCollector participantIdUnknown];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)_getPushTokenFromParticipantID:(unint64_t)a3
{
  BOOL v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  id v5 = [(IDSDSession *)self _getPushTokenFromParticipantIDNumber:v4];

  return v5;
}

- (id)_getPushTokenFromParticipantIDNumber:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v5 = [(NSMutableDictionary *)self->_participantIDToPushToken objectForKeyedSubscript:v4];
  os_unfair_lock_unlock(&self->_lock);
  if (v5)
  {
    id v6 = [v5 rawToken];
  }
  else
  {
    BOOL v7 = [(IDSDSession *)self qrAllocator];
    id v8 = [(IDSDSession *)self sharedState];
    id v9 = [v8 groupID];
    id v6 = [v7 getPushTokenFromParticipantID:v9 participantID:v4];

    if (!v6)
    {
      id v10 = +[IDSFoundationLog IDSDSession];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        id v13 = v4;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "IDSDSession: _getPushTokenFromParticipantID: token not found for participantID %@", (uint8_t *)&v12, 0xCu);
      }
    }
  }

  return v6;
}

- (id)_getURIFromParticipantIDNumber:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v5 = [(NSMutableDictionary *)self->_participantIDToURI objectForKeyedSubscript:v4];
  os_unfair_lock_unlock(&self->_lock);
  if (v5)
  {
    id v6 = [v5 prefixedURI];
  }
  else
  {
    BOOL v7 = [(IDSDSession *)self qrAllocator];
    id v8 = [(IDSDSession *)self sharedState];
    id v9 = [v8 groupID];
    id v6 = [v7 getURIFromParticipantID:v9 participantID:v4];

    if (!v6)
    {
      id v10 = +[IDSFoundationLog IDSDSession];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        id v13 = v4;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "IDSDSession: _getURIFromParticipantID: URI not found for participantID %@", (uint8_t *)&v12, 0xCu);
      }
    }
  }

  return v6;
}

- (void)setQrAllocator:(id)a3
{
}

- (void)setParticipantIDToURI:(id)a3 participantID:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  participantIDToURI = self->_participantIDToURI;
  if (!participantIDToURI)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    id v9 = self->_participantIDToURI;
    self->_participantIDToURI = Mutable;

    participantIDToURI = self->_participantIDToURI;
  }
  [(NSMutableDictionary *)participantIDToURI setObject:v10 forKeyedSubscript:v6];
}

- (void)registerClientChannel
{
  id v3 = +[IDSClientChannelManager sharedInstance];
  id v4 = [(IDSDSession *)self sharedState];
  id v5 = [v4 uniqueID];
  id v6 = [@"session:" stringByAppendingString:v5];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10008ABA4;
  v7[3] = &unk_100980DD8;
  v7[4] = self;
  [v3 registerClientChannelDestination:v6 connectHandler:v7];
}

- (void)unregisterClientChannel
{
  id v6 = +[IDSClientChannelManager sharedInstance];
  id v3 = [(IDSDSession *)self sharedState];
  id v4 = [v3 uniqueID];
  id v5 = [@"session:" stringByAppendingString:v4];
  [v6 unregisterClientChannelDestination:v5 clientUUID:self->_clientChannelUUID];
}

- (void)_invalidateClientChannel:(id)a3
{
  id v4 = a3;
  id v5 = +[IMLockdownManager sharedInstance];
  if ([v5 isInternalInstall])
  {
    int idsDataChannelClientPID = self->_idsDataChannelClientPID;

    if (idsDataChannelClientPID >= 1)
    {
      if (qword_100A4A5C8 != -1) {
        dispatch_once(&qword_100A4A5C8, &stru_100980DF8);
      }
      if (off_100A4A5C0 && (byte_100A4A5B8 & 1) == 0)
      {
        if (off_100A4A5C0(@"The client stopped reading incoming packets", 0, self->_idsDataChannelClientPID))
        {
          byte_100A4A5B8 = 1;
          BOOL v7 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            int v8 = self->_idsDataChannelClientPID;
            *(_DWORD *)buf = 67109120;
            int v17 = v8;
            _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Successfully got the stack shot for the client PID: %d", buf, 8u);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
LABEL_12:
            uint64_t v14 = self->_idsDataChannelClientPID;
            _IDSLogV();
          }
        }
        else if ((byte_100A4A5B8 & 1) == 0)
        {
          int v12 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            int v13 = self->_idsDataChannelClientPID;
            *(_DWORD *)buf = 67109120;
            int v17 = v13;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Couldn't get the stack shot for the client PID: %d", buf, 8u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLog()) {
              goto LABEL_12;
            }
          }
        }
      }
    }
  }
  else
  {
  }
  id v9 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "IDSClientChannel has excessively cached too many packets. Invalidating IDSClientChannel...", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
  objc_msgSend(v4, "invalidate", v14);
  id v10 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008B8C0;
  block[3] = &unk_10097E4D0;
  void block[4] = self;
  dispatch_block_t v11 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, block);
  dispatch_async(v10, v11);
}

- (void)writeToClientChannel:(id)a3 packetBuffer:(id *)a4 metaData:(const char *)a5 metadataSize:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = (IDSClientChannel *)a3;
  if (!v10)
  {
    if (self->_isLightweightParticipant)
    {
LABEL_5:
      dispatch_block_t v11 = 0;
      goto LABEL_95;
    }
    int v12 = [(IDSDSession *)self sharedState];
    if ([v12 useQRDirectly])
    {
    }
    else
    {
      BOOL bypassUTun = self->_bypassUTun;

      if (!bypassUTun)
      {
        long long v43 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          if (a4) {
            int64_t var2 = a4->var2;
          }
          else {
            int64_t var2 = 0;
          }
          *(_DWORD *)buf = 134218752;
          *(void *)&uint8_t buf[4] = a4;
          __int16 v77 = 2048;
          double v78 = *(double *)&var2;
          __int16 v79 = 2048;
          v80 = a5;
          __int16 v81 = 1024;
          LODWORD(v82) = v6;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "IDSClientChannel is nil - dropping packetBuffer %p (length %lu) metadata %p metadataSize %d", buf, 0x26u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport();
            if (_IDSShouldLog()) {
              _IDSLogV();
            }
          }
        }
        goto LABEL_5;
      }
    }
    os_unfair_lock_lock(&self->_clientChannelLock);
    uint64_t v14 = [IDSClientChannel alloc];
    id v15 = [(IDSDSession *)self sharedState];
    long long v16 = [v15 uniqueID];
    int v17 = [@"session:" stringByAppendingString:v16];
    long long v18 = [(IDSClientChannel *)v14 initWithDestination:v17];
    clientChannel = self->_clientChannel;
    self->_clientChannel = v18;

    dispatch_block_t v11 = v18;
    os_unfair_lock_unlock(&self->_clientChannelLock);
    double v20 = +[NSMutableArray array];
    [(IDSClientChannel *)v11 setCachedDataForClient:v20];

    goto LABEL_10;
  }
  dispatch_block_t v11 = v10;
  if (self->_isLightweightParticipant) {
    goto LABEL_95;
  }
LABEL_10:
  if (![(IDSClientChannel *)v11 closed])
  {
    if (!v6 && (!a4 || !a4->var2))
    {
      long long v42 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "writeToClientChannel: there is no real packet or metadata.", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport();
          if (_IDSShouldLog()) {
            goto LABEL_16;
          }
        }
      }
      goto LABEL_95;
    }
    if ([(IDSDSession *)self _checkAndSendCachedDataForClient:v11]
      && [(IDSClientChannel *)v11 writePacketBuffer:a4 metaData:a5 metadataSize:v6 moreComing:0])
    {
      self->_double channelDataCachedTime = 0.0;
      goto LABEL_95;
    }
    long long v22 = [(IDSClientChannel *)v11 cachedDataForClient];
    CFStringRef v66 = [[IDSClientChannelData alloc] initWithPacketBuffer:a4 metadata:a5 metadataSize:v6];
    objc_msgSend(v22, "addObject:");
    v65 = (char *)[v22 count];
    if ((unint64_t)v65 < 0x29) {
      goto LABEL_93;
    }
    id v23 = +[IMLockdownManager sharedInstance];
    if ([v23 isInternalInstall])
    {
      unsigned int v24 = [(IDSClientChannel *)v11 excessiveCachingCount];

      if (v24)
      {
LABEL_37:
        if (![(IDSClientChannel *)v11 excessiveCachingReportCounter])
        {
          id v37 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            *(void *)&uint8_t buf[4] = v65;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Added cachedData - total %lu cached client data to send", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            v57 = v65;
            _IDSLogV();
          }
        }
        [(IDSClientChannel *)v11 setExcessiveCachingReportCounter:(([(IDSClientChannel *)v11 excessiveCachingReportCounter]+ 1)% 20)];
        [(IDSClientChannel *)v11 setExcessiveCachingCount:[(IDSClientChannel *)v11 excessiveCachingCount] + 1];
        if ([(IDSClientChannel *)v11 excessiveCachingCount] >= 161)
        {
          long long v38 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v39 = [(IDSClientChannel *)v11 excessiveCachingCount];
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v39;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "greater than threshold:  [clientChannel excessiveCachingCount]: %d", buf, 8u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              double v58 = COERCE_DOUBLE((id)[(IDSClientChannel *)v11 excessiveCachingCount]);
              _IDSLogTransport();
              if (_IDSShouldLog())
              {
                double v58 = COERCE_DOUBLE((id)[(IDSClientChannel *)v11 excessiveCachingCount]);
                _IDSLogV();
              }
            }
          }
          if (self->_channelDataCachedTime == 0.0)
          {
            self->_double channelDataCachedTime = sub_100087A84();
            long long v40 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              double channelDataCachedTime = self->_channelDataCachedTime;
              *(_DWORD *)buf = 134217984;
              *(double *)&uint8_t buf[4] = channelDataCachedTime;
              _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "writeToClientChannel: current data cached time: %f", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport();
                if (_IDSShouldLog()) {
                  _IDSLogV();
                }
              }
            }
            goto LABEL_94;
          }
          long long v45 = [(IDSDSession *)self sharedState];
          if ([v45 sharedSession]) {
            double v46 = 30.0;
          }
          else {
            double v46 = 2.0;
          }

          double v47 = sub_100087A84();
          double v48 = v47 - self->_channelDataCachedTime;
          if (v48 <= v46 && [(IDSClientChannel *)v11 excessiveCachingCount] < 1601)
          {
LABEL_94:

            goto LABEL_95;
          }
          v49 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            double v50 = self->_channelDataCachedTime;
            *(_DWORD *)buf = 134218752;
            *(double *)&uint8_t buf[4] = v47;
            __int16 v77 = 2048;
            double v78 = v50;
            __int16 v79 = 2048;
            v80 = *(const char **)&v48;
            __int16 v81 = 2048;
            double v82 = v46;
            _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "invalid client channel: currentTime: %f, _channelDataCachedTime: %f, dataCachedDuration: %f, clientChannelTimedout: %f", buf, 0x2Au);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              double v60 = v48;
              double v61 = v46;
              double v58 = v47;
              double v59 = self->_channelDataCachedTime;
              _IDSLogTransport();
              if (_IDSShouldLog())
              {
                double v60 = v48;
                double v61 = v46;
                double v58 = v47;
                double v59 = self->_channelDataCachedTime;
                _IDSLogV();
              }
            }
          }
          self->_double channelDataCachedTime = 0.0;
          -[IDSDSession _invalidateClientChannel:](self, "_invalidateClientChannel:", v11, *(void *)&v58, *(void *)&v59, *(void *)&v60, *(void *)&v61);
        }
        long long v73 = 0u;
        long long v74 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        id v51 = v22;
        dispatch_queue_t v52 = (char *)[v51 countByEnumeratingWithState:&v71 objects:v75 count:16];
        if (v52)
        {
          __int16 v53 = 0;
          uint64_t v54 = *(void *)v72;
          while (2)
          {
            v55 = 0;
            CFStringRef v56 = &v52[(void)v53];
            do
            {
              if (*(void *)v72 != v54) {
                objc_enumerationMutation(v51);
              }
              if ([*(id *)(*((void *)&v71 + 1) + 8 * (void)v55) packetBuffer])
              {
                CFStringRef v56 = &v55[(void)v53];
                goto LABEL_91;
              }
              ++v55;
            }
            while (v52 != v55);
            dispatch_queue_t v52 = (char *)[v51 countByEnumeratingWithState:&v71 objects:v75 count:16];
            __int16 v53 = v56;
            if (v52) {
              continue;
            }
            break;
          }
        }
        else
        {
          CFStringRef v56 = 0;
        }
LABEL_91:

        if (v56 < v65) {
          [v51 removeObjectAtIndex:v56];
        }
LABEL_93:
        *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
        objc_initWeak((id *)buf, v11);
        id location = (id)0xAAAAAAAAAAAAAAAALL;
        objc_initWeak(&location, self);
        v67[0] = _NSConcreteStackBlock;
        v67[1] = 3221225472;
        v67[2] = sub_10008C5D4;
        v67[3] = &unk_100980E20;
        objc_copyWeak(&v68, (id *)buf);
        objc_copyWeak(&v69, &location);
        [(IDSClientChannel *)v11 setWriteHandler:v67];
        objc_destroyWeak(&v69);
        objc_destroyWeak(&v68);
        objc_destroyWeak(&location);
        objc_destroyWeak((id *)buf);
        goto LABEL_94;
      }
      CFStringRef v64 = [(IDSDSession *)self accountController];
      CFStringRef v63 = [(IDSDSession *)self sharedState];
      v62 = [v63 accountID];
      v25 = [v64 accountWithUniqueID:v62];
      double v26 = [v25 service];
      __int16 v27 = [v26 serviceName];
      int v28 = [(IDSDSession *)self sharedState];
      id v29 = [v28 uniqueID];
      id v23 = +[NSString stringWithFormat:@"%@-%@", v27, v29];

      LODWORD(v26) = IMGetDomainBoolForKey();
      int v30 = IMGetDomainBoolForKey();
      int v31 = IMGetDomainBoolForKey();
      int v32 = IMGetDomainBoolForKey();
      int v33 = IMGetDomainBoolForKey();
      if (v26) {
        int v34 = 2;
      }
      else {
        int v34 = 0;
      }
      if (v30) {
        v34 |= 4u;
      }
      if (v31) {
        v34 |= 8u;
      }
      int v35 = v34 | v32;
      if (v33) {
        int v36 = v35 | 0x10;
      }
      else {
        int v36 = v35;
      }
      if (v36)
      {
        id v23 = v23;
        [v23 UTF8String];
        IDSNetworkingLogDump();
      }
    }

    goto LABEL_37;
  }
  long long v21 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v11;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "IDSClientChannel %p closed", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
LABEL_16:
      }
        _IDSLogV();
    }
  }
LABEL_95:
}

- (BOOL)_checkAndSendCachedDataForClient:(id)a3
{
  id v4 = a3;
  p_clientChannelLock = &self->_clientChannelLock;
  os_unfair_lock_lock(&self->_clientChannelLock);
  uint64_t v6 = [v4 cachedDataForClient];
  BOOL v7 = (char *)[v6 count];
  if (!v7)
  {
    if (self->_channelDataCachedTime != 0.0)
    {
      id v10 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "_checkAndSendCachedDataForClient: clear cached data time", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport();
          if (_IDSShouldLog()) {
            _IDSLogV();
          }
        }
      }
      self->_double channelDataCachedTime = 0.0;
      [v4 setExcessiveCachingCount:0];
    }
LABEL_32:
    os_unfair_lock_unlock(p_clientChannelLock);
    BOOL v9 = 1;
    goto LABEL_33;
  }
  int v8 = v7;
  if ([v4 closed]) {
    goto LABEL_3;
  }
  dispatch_block_t v11 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Have %lu cached client data to send", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    long long v18 = v8;
    _IDSLogV();
  }
  int v12 = 0;
  while (1)
  {
    int v13 = objc_msgSend(v6, "objectAtIndexedSubscript:", v12, v18);
    if (![v13 metadataSize] && !objc_msgSend(v13, "packetBuffer"))
    {
      id v15 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "_checkAndSendCachedDataForClient: there is no real packet or metadata", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport();
          if (_IDSShouldLog()) {
            _IDSLogV();
          }
        }
      }

      goto LABEL_21;
    }
    unsigned int v14 = objc_msgSend(v4, "writePacketBuffer:metaData:metadataSize:moreComing:", objc_msgSend(v13, "packetBuffer"), objc_msgSend(v13, "metadata"), objc_msgSend(v13, "metadataSize"), 1);

    if (!v14) {
      break;
    }
LABEL_21:
    if (v8 == ++v12) {
      goto LABEL_31;
    }
  }
  if (v8 == v12)
  {
LABEL_31:
    long long v16 = [v4 cachedDataForClient];
    [v16 removeAllObjects];

    [v4 setWriteHandler:0];
    goto LABEL_32;
  }
  if (v12)
  {
    [v4 writePacketBuffer:0 metaData:0 metadataSize:0 moreComing:0];
    objc_msgSend(v6, "removeObjectsInRange:", 0, v12);
  }
LABEL_3:
  os_unfair_lock_unlock(p_clientChannelLock);
  BOOL v9 = 0;
LABEL_33:

  return v9;
}

- (void)_checkAndRunClientChannelTests:(id)a3
{
  id v3 = a3;
  if (IMGetDomainBoolForKey())
  {
    id v6 = v3;
    IDSTransportThreadAddBlockAfter();
  }
  if (IMGetDomainBoolForKey())
  {
    id v5 = v3;
    IDSTransportThreadAddBlockAfter();
    id v4 = v5;
    IDSTransportThreadAddBlockAfter();
  }
}

- (void)_connectSocketDescriptor:(int)a3 toClientChannel:(id)a4
{
  id v6 = a4;
  if ([v6 transportType] == (id)1)
  {
    BOOL v7 = im_primary_queue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10008D808;
    block[3] = &unk_10097E4D0;
    void block[4] = self;
    dispatch_block_t v8 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, block);
    dispatch_async(v7, v8);
  }
  else
  {
    [v6 setClientReady:1];
    if ([v6 connectWithTransportThread])
    {
      location[1] = _NSConcreteStackBlock;
      location[2] = (id)3221225472;
      location[3] = sub_10008D820;
      location[4] = &unk_100980E48;
      int v30 = a3;
      location[5] = self;
      BOOL v9 = v6;
      id v29 = v9;
      IDSTransportThreadAddSocket();
      location[0] = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(location, v9);
      id from = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&from, self);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10008DD88;
      v21[3] = &unk_100980E70;
      objc_copyWeak(&v24, &from);
      id v10 = v9;
      int v26 = a3;
      long long v22 = v10;
      id v23 = self;
      objc_copyWeak(&v25, location);
      [v10 setPacketBufferHandler:v21];
      if ([v10 hasMetadata])
      {
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_10008EA7C;
        v19[3] = &unk_100980E98;
        v19[4] = self;
        double v20 = v10;
        dispatch_block_t v11 = objc_retainBlock(v19);
        int v12 = [(IDSDSession *)self utunController];
        int v13 = [(IDSDSession *)self sharedState];
        unsigned int v14 = [v13 uniqueID];
        [v12 getLinkInformationForDevice:v14 completionHandler:v11];
      }
      id v15 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int socketDescriptor = self->_socketDescriptor;
        clientChannel = self->_clientChannel;
        *(_DWORD *)buf = 67109376;
        int v34 = socketDescriptor;
        __int16 v35 = 2048;
        int v36 = clientChannel;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "socket %d connected to IDSClientChannel %p", buf, 0x12u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport();
          if (_IDSShouldLog()) {
            _IDSLogV();
          }
        }
      }
      objc_destroyWeak(&v25);

      objc_destroyWeak(&v24);
      objc_destroyWeak(&from);
      objc_destroyWeak(location);
      BOOL v7 = v29;
    }
    else
    {
      BOOL v7 = im_primary_queue();
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_10008D814;
      v31[3] = &unk_10097E4D0;
      v31[4] = self;
      dispatch_block_t v18 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, v31);
      dispatch_async(v7, v18);
    }
  }
}

- (id)_extractFieldBytesFromMetadata:(const void *)a3 ofSize:(unsigned int)a4 packetBuffer:(id *)a5
{
  unsigned __int8 v366 = -86;
  id v365 = (char *)0xAAAAAAAAAAAAAAAALL;
  unsigned __int16 v364 = -21846;
  unint64_t v363 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v361 = v5;
  long long v362 = v5;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  IDSByteBufferInitForRead();
  if (IDSByteBufferReadField())
  {
    LODWORD(v340) = 0;
    double v341 = 0.0;
    LODWORD(v342) = 0;
    char v339 = 0;
    uint64_t v344 = 0;
    uint64_t v338 = IDSDataChannelEventNameKey;
    uint64_t v343 = IDSDataChannelLinkIDKey;
    uint64_t v345 = IDSDataChannelMKIUUIDKey;
    uint64_t v334 = IDSDataChannelMKIArrivalTimeKey;
    uint64_t v335 = IDSDataChannelPacketArrivalTimeKey;
    uint64_t v332 = IDSDataChannelIsLocallyGeneratedKey;
    uint64_t v336 = IDSDataChannelLastPacketSentTimeKey;
    uint64_t v337 = IDSDataChannelLastPacketReceivedTimeKey;
    uint64_t v333 = IDSGlobalLinkOptionSessionInfoRequestTypeKey;
    uint64_t v349 = IDSDataChannelQualityOfServiceTimestampValueKey;
    uint64_t v350 = IDSDataChannelQualityOfServicePayloadTypeKey;
    uint64_t v347 = IDSDataChannelQualityOfServiceTransactionIDKey;
    uint64_t v348 = IDSDataChannelQualityOfServiceOffsetBytesKey;
    uint64_t v346 = IDSDataChannelQualityOfServiceDropOperationKey;
    do
    {
      if (v366 <= 0xFBu)
      {
        switch(v366)
        {
          case 1u:
            if (v364 == 1)
            {
              unint64_t v28 = *v365;
              id v29 = +[NSNumber numberWithChar:v28];
              [(__CFDictionary *)Mutable setObject:v29 forKeyedSubscript:@"ccmdtpli"];

              if (!self->_verboseFunctionalLogging) {
                continue;
              }
              int v30 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                if (qword_100A4A5D0 != -1) {
                  dispatch_once(&qword_100A4A5D0, &stru_100981748);
                }
                uint64_t v31 = mach_continuous_time();
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&uint8_t buf[4] = v28;
                *(_WORD *)&buf[8] = 2048;
                *(double *)&buf[10] = *(double *)&qword_100A4A5D8 * (double)v31;
                _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "got PacketLinkID %d [%013.6lf]", buf, 0x12u);
              }

              if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog()) {
                continue;
              }
              if (qword_100A4A5D0 != -1) {
                goto LABEL_785;
              }
              goto LABEL_326;
            }
            uint64_t v244 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v244, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v364;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v366;
              _os_log_impl((void *)&_mh_execute_header, v244, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_PacketLinkID should be 1 byte, not %u bytes, field: %u", buf, 0xEu);
            }

            if (!os_log_shim_legacy_logging_enabled()) {
              continue;
            }
            if (!_IDSShouldLogTransport()) {
              continue;
            }
            uint64_t v327 = v364;
            *(void *)&double v328 = v366;
            _IDSLogTransport();
            if (!_IDSShouldLog()) {
              continue;
            }
            goto LABEL_613;
          case 2u:
            if (v364 == 4)
            {
              int v32 = v365;
              uint64_t v33 = *v365++;
              *(void *)&double v34 = *v365;
              id v365 = v32 + 4;
              __int16 v35 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&uint8_t buf[4] = v33;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = LODWORD(v34);
                _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "got connectedLinkID %d connectedLinkAttributes %u", buf, 0xEu);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
              {
                uint64_t v327 = v33;
                double v328 = v34;
                _IDSLogV();
              }
              continue;
            }
            v245 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v245, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v364;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v366;
              _os_log_impl((void *)&_mh_execute_header, v245, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_LinkConnected should be 4 bytes, not %u bytes, field: %u", buf, 0xEu);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                uint64_t v327 = v364;
                *(void *)&double v328 = v366;
                _IDSLogTransport();
                if (_IDSShouldLog()) {
                  goto LABEL_613;
                }
              }
            }
            continue;
          case 3u:
            if (v364 == 1)
            {
              uint64_t v36 = *v365++;
              id v37 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)&uint8_t buf[4] = v36;
                _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "got disconnectedLinkID %d", buf, 8u);
              }

              if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog()) {
                continue;
              }
              goto LABEL_710;
            }
            v246 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v246, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v364;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v366;
              _os_log_impl((void *)&_mh_execute_header, v246, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_LinkDisconnected should be 1 byte, not %u bytes, field: %u", buf, 0xEu);
            }

            if (!os_log_shim_legacy_logging_enabled()) {
              continue;
            }
            if (!_IDSShouldLogTransport()) {
              continue;
            }
            uint64_t v327 = v364;
            *(void *)&double v328 = v366;
            _IDSLogTransport();
            if (!_IDSShouldLog()) {
              continue;
            }
            goto LABEL_613;
          case 4u:
            if (v364 == 1)
            {
              uint64_t v38 = *v365++;
              unsigned int v39 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)&uint8_t buf[4] = v38;
                _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "got defaultLinkID %d", buf, 8u);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
              {
                uint64_t v327 = v38;
                _IDSLogV();
              }
              long long v40 = [(IDSDSession *)self utunController];
              long long v41 = [(IDSDSession *)self sharedState];
              long long v42 = [v41 uniqueID];
              objc_msgSend(v40, "onTransportThread_SetDefaultUnderlyingLink:linkID:", v42, (char)v38);

              continue;
            }
            v247 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v247, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v364;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v366;
              _os_log_impl((void *)&_mh_execute_header, v247, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_DefaultLinkID should be 1 byte, not %u bytes, field: %u", buf, 0xEu);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                uint64_t v327 = v364;
                *(void *)&double v328 = v366;
                _IDSLogTransport();
                if (_IDSShouldLog()) {
                  goto LABEL_613;
                }
              }
            }
            continue;
          case 5u:
            if (v364 == 1)
            {
              uint64_t v36 = *v365++;
              long long v43 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)&uint8_t buf[4] = v36;
                _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "got ratType %u", buf, 8u);
              }

              if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog()) {
                continue;
              }
              goto LABEL_710;
            }
            id v248 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v248, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v364;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v366;
              _os_log_impl((void *)&_mh_execute_header, v248, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_RATChanged should be 1 bytes, not %u bytes, field: %u", buf, 0xEu);
            }

            if (!os_log_shim_legacy_logging_enabled()) {
              continue;
            }
            if (!_IDSShouldLogTransport()) {
              continue;
            }
            uint64_t v327 = v364;
            *(void *)&double v328 = v366;
            _IDSLogTransport();
            if (!_IDSShouldLog()) {
              continue;
            }
            goto LABEL_613;
          case 6u:
            if (v364 == 6)
            {
              long long v44 = v365;
              *(void *)&double v45 = *v365++;
              int v46 = *v365;
              id v365 = v44 + 2;
              unsigned int v47 = *(_DWORD *)(v44 + 2);
              id v365 = v44 + 6;
              double v48 = [(IDSDSession *)self utunController];
              v49 = [(IDSDSession *)self sharedState];
              double v50 = [v49 uniqueID];
              uint64_t v51 = bswap32(v47);
              objc_msgSend(v48, "onTransportThread_SetPacketNotificationFilter:linkID:uniqueTag:isEnabled:", v50, SLOBYTE(v45), v51, v46 != 0);

              dispatch_queue_t v52 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218240;
                *(void *)&uint8_t buf[4] = v51;
                *(_WORD *)&unsigned char buf[12] = 1024;
                *(_DWORD *)&buf[14] = LODWORD(v45);
                _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "got basebandRegKey %lu (linkID: %d)", buf, 0x12u);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
              {
                uint64_t v327 = v51;
                double v328 = v45;
                _IDSLogV();
              }
              continue;
            }
            CFStringRef v249 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v249, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v364;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v366;
              _os_log_impl((void *)&_mh_execute_header, v249, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_BasebandRegistrationKey should be 4 bytes, not %u bytes, field: %u", buf, 0xEu);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                uint64_t v327 = v364;
                *(void *)&double v328 = v366;
                _IDSLogTransport();
                if (_IDSShouldLog()) {
                  goto LABEL_613;
                }
              }
            }
            continue;
          case 7u:
            if (v364 == 1)
            {
              uint64_t v340 = *v365++;
              __int16 v53 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)&uint8_t buf[4] = v340;
                _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "got kClientChannelMetadataType_BasebandQueueFlushPayloadSizeKey %u", buf, 8u);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
              {
                uint64_t v327 = v340;
                _IDSLogV();
              }
              goto LABEL_697;
            }
            v250 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v250, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v364;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v366;
              _os_log_impl((void *)&_mh_execute_header, v250, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_BasebandQueueFlushPayloadSizeKey should be 1 bytes, not %u bytes, field: %u", buf, 0xEu);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                uint64_t v327 = v364;
                *(void *)&double v328 = v366;
                _IDSLogTransport();
                if (_IDSShouldLog()) {
                  goto LABEL_613;
                }
              }
            }
            continue;
          case 8u:
            if (v344)
            {
              if (((10 * v340) | 1) == v364)
              {
                uint64_t v54 = +[NSMutableArray array];
                char v55 = *v365++;
                for (int i = v340; i; --i)
                {
                  v57 = v365;
                  uint64_t v58 = *v365++;
                  unsigned int v59 = *(_DWORD *)v365;
                  id v365 = v57 + 5;
                  uint64_t v60 = v57[5];
                  id v365 = v57 + 6;
                  unsigned int v61 = *((unsigned __int16 *)v57 + 3);
                  unsigned int v62 = *((unsigned __int16 *)v57 + 4);
                  id v365 = v57 + 10;
                  v370[0] = v350;
                  CFStringRef v63 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v58, v327);
                  v371[0] = v63;
                  v370[1] = v349;
                  CFStringRef v64 = +[NSNumber numberWithUnsignedInt:bswap32(v59)];
                  v371[1] = v64;
                  v370[2] = v348;
                  v65 = +[NSNumber numberWithUnsignedChar:v60];
                  v371[2] = v65;
                  v370[3] = v347;
                  CFStringRef v66 = +[NSNumber numberWithUnsignedShort:bswap32(v61) >> 16];
                  v371[3] = v66;
                  v370[4] = v346;
                  CFStringRef v67 = +[NSNumber numberWithUnsignedShort:bswap32(v62) >> 16];
                  v371[4] = v67;
                  id v68 = +[NSDictionary dictionaryWithObjects:v371 forKeys:v370 count:5];

                  [v54 addObject:v68];
                }
                id v69 = [(IDSDSession *)self utunController];
                v70 = [(IDSDSession *)self sharedState];
                long long v71 = [v70 uniqueID];
                objc_msgSend(v69, "onTransportThread_DropIPPackets:linkID:payloadArray:", v71, v55, v54);

                long long v72 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v54;
                  _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "got basebandQueueFlush %@", buf, 0xCu);
                }

                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                {
                  uint64_t v327 = (uint64_t)v54;
                  _IDSLogV();
                }
              }
              else
              {
                dispatch_block_t v302 = OSLogHandleForTransportCategory();
                if (os_log_type_enabled(v302, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109632;
                  *(_DWORD *)&uint8_t buf[4] = (10 * v340) | 1;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v364;
                  *(_WORD *)&buf[14] = 1024;
                  *(_DWORD *)&buf[16] = v366;
                  _os_log_impl((void *)&_mh_execute_header, v302, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_BasebandQueueFlushPayloadSizeKey should be %u bytes, not %u bytes, field: %u", buf, 0x14u);
                }

                if (os_log_shim_legacy_logging_enabled())
                {
                  if (_IDSShouldLogTransport())
                  {
                    *(void *)&double v328 = v364;
                    *(void *)&double v329 = v366;
                    uint64_t v327 = (10 * v340) | 1u;
                    _IDSLogTransport();
                    if (_IDSShouldLog())
                    {
                      *(void *)&double v328 = v364;
                      *(void *)&double v329 = v366;
                      uint64_t v327 = (10 * v340) | 1u;
                      _IDSLogV();
                    }
                  }
                }
              }
LABEL_697:
              LOBYTE(v344) = 1;
            }
            else
            {
              v251 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v251, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v251, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_BasebandQueueFlushPayloadKey should know its size. needs kClientChannelMetadataType_BasebandQueueFlushPayloadSizeKey", buf, 2u);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  _IDSLogTransport();
                  if (_IDSShouldLog()) {
                    _IDSLogV();
                  }
                }
              }
              LOBYTE(v344) = 0;
            }
            continue;
          case 9u:
            if (v364 == 10)
            {
              uint64_t v368 = *(void *)v365;
              __int16 v369 = *((_WORD *)v365 + 4);
              long long v73 = +[NSMutableArray array];
              for (uint64_t j = 0; j != 10; ++j)
              {
                if (!*((unsigned char *)&v368 + j)) {
                  break;
                }
                uint64_t v75 = +[NSNumber numberWithChar:*((char *)&v368 + j)];
                [v73 addObject:v75];
              }
              uint64_t v76 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v73;
                _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "got kClientChannelMetadataType_DiscardLinkIDsKey %@", buf, 0xCu);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
              {
                uint64_t v327 = (uint64_t)v73;
                _IDSLogV();
              }
              __int16 v77 = [(IDSDSession *)self utunController];
              double v78 = [(IDSDSession *)self sharedState];
              __int16 v79 = [v78 uniqueID];
              objc_msgSend(v77, "onTransportThread_StopKeepAlive:linkIDs:", v79, v73);
            }
            else
            {
              v252 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v252, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109632;
                *(_DWORD *)&uint8_t buf[4] = 10;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v364;
                *(_WORD *)&buf[14] = 1024;
                *(_DWORD *)&buf[16] = v366;
                _os_log_impl((void *)&_mh_execute_header, v252, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_KeepAliveLinksKey should be %u bytes, not %u bytes, field: %u", buf, 0x14u);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  *(void *)&double v328 = v364;
                  *(void *)&double v329 = v366;
                  uint64_t v327 = 10;
                  _IDSLogTransport();
                  if (_IDSShouldLog())
                  {
                    *(void *)&double v328 = v364;
                    *(void *)&double v329 = v366;
                    uint64_t v327 = 10;
                    _IDSLogV();
                  }
                }
              }
            }
            continue;
          case 0xAu:
            if (v364 == 1)
            {
              *(void *)&double v341 = *v365;
              v80 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)&uint8_t buf[4] = LODWORD(v341);
                _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "got kClientChannelMetadataType_PreConnectionDataSizeKey %u", buf, 8u);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
              {
                uint64_t v327 = *(void *)&v341;
                _IDSLogV();
              }
              goto LABEL_704;
            }
            v253 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v253, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v364;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v366;
              _os_log_impl((void *)&_mh_execute_header, v253, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_PreConnectionDataSizeKey should be 1 bytes, not %u bytes, field: %u", buf, 0xEu);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                uint64_t v327 = v364;
                *(void *)&double v328 = v366;
                _IDSLogTransport();
                if (_IDSShouldLog()) {
                  goto LABEL_613;
                }
              }
            }
            continue;
          case 0xBu:
            if ((v344 & 0x100000000) != 0)
            {
              if (v364 == LOBYTE(v341))
              {
                __int16 v81 = +[NSData dataWithBytes:v365 length:LODWORD(v341)];
                double v82 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  *(void *)&uint8_t buf[4] = v81;
                  *(_WORD *)&unsigned char buf[12] = 1024;
                  *(_DWORD *)&buf[14] = LODWORD(v341);
                  _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "got preConnectionData %@, size:%u bytes.", buf, 0x12u);
                }

                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                {
                  uint64_t v327 = (uint64_t)v81;
                  double v328 = v341;
                  _IDSLogV();
                }
                *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
                objc_initWeak((id *)buf, self);
                v83 = [(IDSDSession *)self utunController];
                uint64_t v84 = [(IDSDSession *)self sharedState];
                double v85 = [v84 uniqueID];
                v358[0] = _NSConcreteStackBlock;
                v358[1] = 3221225472;
                v358[2] = sub_10009692C;
                v358[3] = &unk_100980EC0;
                objc_copyWeak(&v360, (id *)buf);
                id v86 = v81;
                id v359 = v86;
                objc_msgSend(v83, "onTransportThread_SendSKEData:skeData:completionHandler:", v85, v86, v358);

                objc_destroyWeak(&v360);
                objc_destroyWeak((id *)buf);
              }
              else
              {
                v303 = OSLogHandleForTransportCategory();
                if (os_log_type_enabled(v303, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109632;
                  *(_DWORD *)&uint8_t buf[4] = LODWORD(v341);
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v364;
                  *(_WORD *)&buf[14] = 1024;
                  *(_DWORD *)&buf[16] = v366;
                  _os_log_impl((void *)&_mh_execute_header, v303, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_PreConnectionDataKey should be %u bytes, not %u bytes, field: %u", buf, 0x14u);
                }

                if (os_log_shim_legacy_logging_enabled())
                {
                  if (_IDSShouldLogTransport())
                  {
                    *(void *)&double v328 = v364;
                    *(void *)&double v329 = v366;
                    uint64_t v327 = *(void *)&v341;
                    _IDSLogTransport();
                    if (_IDSShouldLog())
                    {
                      *(void *)&double v328 = v364;
                      *(void *)&double v329 = v366;
                      uint64_t v327 = *(void *)&v341;
                      _IDSLogV();
                    }
                  }
                }
              }
LABEL_704:
              BYTE4(v344) = 1;
            }
            else
            {
              v254 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v254, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v254, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_PreConnectionDataKey should know its size. needs kClientChannelMetadataType_PreConnectionDataSizeKey", buf, 2u);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  _IDSLogTransport();
                  if (_IDSShouldLog()) {
                    _IDSLogV();
                  }
                }
              }
              BYTE4(v344) = 0;
            }
            continue;
          case 0xCu:
            if (v364 == 2)
            {
              v87 = v365;
              int v88 = *v365++;
              int v89 = *v365;
              id v365 = v87 + 2;
              v90 = [(IDSDSession *)self utunController];
              v91 = [(IDSDSession *)self sharedState];
              v92 = [v91 uniqueID];
              objc_msgSend(v90, "onTransportThread_UpdateProtocolQualityOfService:linkID:isGood:", v92, (char)v88, v89 != 0);

              v93 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
              {
                CFStringRef v94 = @"YES";
                if (!v89) {
                  CFStringRef v94 = @"NO";
                }
                *(_DWORD *)buf = 138412546;
                *(void *)&uint8_t buf[4] = v94;
                *(_WORD *)&unsigned char buf[12] = 1024;
                *(_DWORD *)&buf[14] = v88;
                _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "got updateQoSIsGood %@ (linkID: %d)", buf, 0x12u);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
              {
                CFStringRef v95 = @"YES";
                if (!v89) {
                  CFStringRef v95 = @"NO";
                }
                uint64_t v327 = (uint64_t)v95;
                *(void *)&double v328 = v88;
                _IDSLogV();
              }
              continue;
            }
            CFStringRef v255 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v255, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109632;
              *(_DWORD *)&uint8_t buf[4] = 2;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v364;
              *(_WORD *)&buf[14] = 1024;
              *(_DWORD *)&buf[16] = v366;
              _os_log_impl((void *)&_mh_execute_header, v255, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_UpdateQoSIsGoodKey should be %u bytes, not %u bytes, field: %u", buf, 0x14u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                *(void *)&double v328 = v364;
                *(void *)&double v329 = v366;
                uint64_t v327 = 2;
                _IDSLogTransport();
                if (_IDSShouldLog()) {
                  goto LABEL_553;
                }
              }
            }
            continue;
          case 0xDu:
            if (v364 == 1)
            {
              id v96 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "got kClientChannelMetadataType_QueryRSSI", buf, 2u);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
                _IDSLogV();
              }
              *(_DWORD *)buf = 0;
              LODWORD(v368) = 0;
              unsigned int v357 = 0;
              v97 = [(IDSDSession *)self utunController];
              v98 = [(IDSDSession *)self sharedState];
              v99 = [v98 uniqueID];
              objc_msgSend(v97, "onTransportThread_CurrentCellularSignalStrength:signalRaw:signalStrength:signalGrade:", v99, buf, &v368, &v357);

              [(IDSDSession *)self didReceiveCurrentCellularSignalRaw:*(unsigned int *)buf signalStrength:v368 signalGrade:v357];
              continue;
            }
            CFStringRef v256 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v256, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109632;
              *(_DWORD *)&uint8_t buf[4] = 1;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v364;
              *(_WORD *)&buf[14] = 1024;
              *(_DWORD *)&buf[16] = v366;
              _os_log_impl((void *)&_mh_execute_header, v256, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_QueryRSSI should be %u bytes, not %u bytes, field: %u", buf, 0x14u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                *(void *)&double v328 = v364;
                *(void *)&double v329 = v366;
                uint64_t v327 = 1;
                _IDSLogTransport();
                if (_IDSShouldLog()) {
                  goto LABEL_481;
                }
              }
            }
            continue;
          case 0xEu:
            if (v364 == 2)
            {
              unint64_t v28 = __rev16(*(unsigned __int16 *)v365);
              v365 += 2;
              unsigned __int8 v100 = +[NSNumber numberWithUnsignedShort:v28];
              [(__CFDictionary *)Mutable setObject:v100 forKeyedSubscript:@"ccmdttc"];

              if (!self->_verboseFunctionalLogging) {
                continue;
              }
              v101 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
              {
                if (qword_100A4A5D0 != -1) {
                  dispatch_once(&qword_100A4A5D0, &stru_100981748);
                }
                uint64_t v102 = mach_continuous_time();
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&uint8_t buf[4] = v28;
                *(_WORD *)&buf[8] = 2048;
                *(double *)&buf[10] = *(double *)&qword_100A4A5D8 * (double)v102;
                _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "got trafficClass %u [%013.6lf]", buf, 0x12u);
              }

              if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog()) {
                continue;
              }
              if (qword_100A4A5D0 != -1) {
                goto LABEL_785;
              }
              goto LABEL_326;
            }
            v257 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v257, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109632;
              *(_DWORD *)&uint8_t buf[4] = 2;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v364;
              *(_WORD *)&buf[14] = 1024;
              *(_DWORD *)&buf[16] = v366;
              _os_log_impl((void *)&_mh_execute_header, v257, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_TrafficClassKey should be %u byte, not %u bytes, field: %u", buf, 0x14u);
            }

            if (!os_log_shim_legacy_logging_enabled()) {
              continue;
            }
            if (!_IDSShouldLogTransport()) {
              continue;
            }
            *(void *)&double v328 = v364;
            *(void *)&double v329 = v366;
            uint64_t v327 = 2;
            _IDSLogTransport();
            if (!_IDSShouldLog()) {
              continue;
            }
            goto LABEL_553;
          case 0xFu:
            if (v364 == 5)
            {
              uint64_t v103 = v365;
              int v104 = *v365++;
              uint64_t v105 = bswap32(*(_DWORD *)v365);
              id v365 = v103 + 5;
              v106 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&uint8_t buf[4] = v105;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v104;
                _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEFAULT, "got maxBitrate %u (linkID: %d)", buf, 0xEu);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
              {
                uint64_t v327 = v105;
                *(void *)&double v328 = v104;
                _IDSLogV();
              }
            }
            else
            {
              v258 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v258, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109632;
                *(_DWORD *)&uint8_t buf[4] = 5;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v364;
                *(_WORD *)&buf[14] = 1024;
                *(_DWORD *)&buf[16] = v366;
                _os_log_impl((void *)&_mh_execute_header, v258, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_MaxBitrateKey should be %u bytes, not %u bytes, field: %u", buf, 0x14u);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  *(void *)&double v328 = v364;
                  *(void *)&double v329 = v366;
                  uint64_t v327 = 5;
                  _IDSLogTransport();
                  if (_IDSShouldLog())
                  {
                    *(void *)&double v328 = v364;
                    *(void *)&double v329 = v366;
                    uint64_t v327 = 5;
                    _IDSLogV();
                  }
                }
              }
            }
            continue;
          case 0x12u:
            if (v364 == 8)
            {
              a5->var30 = bswap64(*(void *)v365);
              continue;
            }
            CFStringRef v259 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v259, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109632;
              *(_DWORD *)&uint8_t buf[4] = 8;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v364;
              *(_WORD *)&buf[14] = 1024;
              *(_DWORD *)&buf[16] = v366;
              _os_log_impl((void *)&_mh_execute_header, v259, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_ExpireTimestamp should be %u bytes, not %u bytes, field: %u", buf, 0x14u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                *(void *)&double v328 = v364;
                *(void *)&double v329 = v366;
                uint64_t v327 = 8;
                _IDSLogTransport();
                if (_IDSShouldLog()) {
                  goto LABEL_469;
                }
              }
            }
            continue;
          case 0x13u:
            if (v364 == 1)
            {
              BOOL v107 = *v365 != 0;
              v108 = [(IDSDSession *)self utunController];
              v109 = [(IDSDSession *)self sharedState];
              v110 = [v109 uniqueID];
              objc_msgSend(v108, "onTransportThread_setWiFiAssistState:isWiFiAssistEnabled:", v110, v107);

              continue;
            }
            v260 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v260, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109632;
              *(_DWORD *)&uint8_t buf[4] = 1;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v364;
              *(_WORD *)&buf[14] = 1024;
              *(_DWORD *)&buf[16] = v366;
              _os_log_impl((void *)&_mh_execute_header, v260, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_WiFiAssistEnableKey should be %u bytes, not %u bytes, field: %u", buf, 0x14u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                *(void *)&double v328 = v364;
                *(void *)&double v329 = v366;
                uint64_t v327 = 1;
                _IDSLogTransport();
                if (_IDSShouldLog()) {
                  goto LABEL_481;
                }
              }
            }
            continue;
          case 0x14u:
            if (v364 != 1)
            {
              v261 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v261, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109632;
                *(_DWORD *)&uint8_t buf[4] = 1;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v364;
                *(_WORD *)&buf[14] = 1024;
                *(_DWORD *)&buf[16] = v366;
                _os_log_impl((void *)&_mh_execute_header, v261, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_DSCPKey should be %u byte, not %u bytes, field: %u", buf, 0x14u);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  *(void *)&double v328 = v364;
                  *(void *)&double v329 = v366;
                  uint64_t v327 = 1;
                  _IDSLogTransport();
                  if (_IDSShouldLog())
                  {
LABEL_481:
                    *(void *)&double v328 = v364;
                    *(void *)&double v329 = v366;
                    uint64_t v327 = 1;
                    _IDSLogV();
                  }
                }
              }
              continue;
            }
            unint64_t v28 = *v365++;
            v111 = +[NSNumber numberWithUnsignedChar:v28];
            [(__CFDictionary *)Mutable setObject:v111 forKeyedSubscript:@"ccmdtdscp"];

            if (!self->_verboseFunctionalLogging) {
              continue;
            }
            v112 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
            {
              if (qword_100A4A5D0 != -1) {
                dispatch_once(&qword_100A4A5D0, &stru_100981748);
              }
              uint64_t v113 = mach_continuous_time();
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v28;
              *(_WORD *)&buf[8] = 2048;
              *(double *)&buf[10] = *(double *)&qword_100A4A5D8 * (double)v113;
              _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_DEFAULT, "got DSCP %u [%013.6lf]", buf, 0x12u);
            }

            if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog()) {
              continue;
            }
            if (qword_100A4A5D0 != -1) {
              goto LABEL_785;
            }
            goto LABEL_326;
          case 0x15u:
            if (v364 == 16)
            {
              *(_OWORD *)a5->var29 = *(_OWORD *)v365;
            }
            else
            {
              v262 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v262, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109632;
                *(_DWORD *)&uint8_t buf[4] = 16;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v364;
                *(_WORD *)&buf[14] = 1024;
                *(_DWORD *)&buf[16] = v366;
                _os_log_impl((void *)&_mh_execute_header, v262, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_PacketUUID should be %u bytes, not %u bytes, field: %u", buf, 0x14u);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  *(void *)&double v328 = v364;
                  *(void *)&double v329 = v366;
                  uint64_t v327 = 16;
                  _IDSLogTransport();
                  if (_IDSShouldLog())
                  {
                    *(void *)&double v328 = v364;
                    *(void *)&double v329 = v366;
                    uint64_t v327 = 16;
                    _IDSLogV();
                  }
                }
              }
            }
            continue;
          case 0x17u:
            if (v364 == 1)
            {
              unint64_t v28 = *v365;
              v114 = +[NSNumber numberWithUnsignedChar:v28];
              [(__CFDictionary *)Mutable setObject:v114 forKeyedSubscript:@"ccmdtcp"];

              if (!self->_verboseFunctionalLogging) {
                continue;
              }
              uint64_t v115 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
              {
                if (qword_100A4A5D0 != -1) {
                  dispatch_once(&qword_100A4A5D0, &stru_100981748);
                }
                uint64_t v116 = mach_continuous_time();
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&uint8_t buf[4] = v28;
                *(_WORD *)&buf[8] = 2048;
                *(double *)&buf[10] = *(double *)&qword_100A4A5D8 * (double)v116;
                _os_log_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_DEFAULT, "got Channel Priority %u [%013.6lf]", buf, 0x12u);
              }

              if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog()) {
                continue;
              }
              if (qword_100A4A5D0 != -1) {
                goto LABEL_785;
              }
              goto LABEL_326;
            }
            v263 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v263, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v364;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v366;
              _os_log_impl((void *)&_mh_execute_header, v263, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_PriorityKey should be 1 byte, not %u bytes, field: %u", buf, 0xEu);
            }

            if (!os_log_shim_legacy_logging_enabled()) {
              continue;
            }
            if (!_IDSShouldLogTransport()) {
              continue;
            }
            uint64_t v327 = v364;
            *(void *)&double v328 = v366;
            _IDSLogTransport();
            if (!_IDSShouldLog()) {
              continue;
            }
            goto LABEL_613;
          case 0x18u:
            if (v364 == 8)
            {
              unint64_t v28 = bswap64(*(void *)v365);
              v365 += 8;
              id v117 = +[NSNumber numberWithUnsignedLongLong:v28];
              [(__CFDictionary *)Mutable setObject:v117 forKeyedSubscript:@"ccmdtpid"];

              if (!self->_verboseFunctionalLogging) {
                continue;
              }
              v118 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
              {
                if (qword_100A4A5D0 != -1) {
                  dispatch_once(&qword_100A4A5D0, &stru_100981748);
                }
                uint64_t v119 = mach_continuous_time();
                *(_DWORD *)buf = 134218240;
                *(void *)&uint8_t buf[4] = v28;
                *(_WORD *)&unsigned char buf[12] = 2048;
                *(double *)&buf[14] = *(double *)&qword_100A4A5D8 * (double)v119;
                _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_DEFAULT, "got Participant ID %llu [%013.6lf]", buf, 0x16u);
              }

              if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog()) {
                continue;
              }
              if (qword_100A4A5D0 != -1) {
                goto LABEL_785;
              }
              goto LABEL_326;
            }
            v264 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v264, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v364;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v366;
              _os_log_impl((void *)&_mh_execute_header, v264, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_PriorityKey should be 8 byte, not %u bytes, field: %u", buf, 0xEu);
            }

            if (!os_log_shim_legacy_logging_enabled()) {
              continue;
            }
            if (!_IDSShouldLogTransport()) {
              continue;
            }
            uint64_t v327 = v364;
            *(void *)&double v328 = v366;
            _IDSLogTransport();
            if (!_IDSShouldLog()) {
              continue;
            }
            goto LABEL_613;
          case 0x1Du:
            if (v364 != 1)
            {
              v265 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v265, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&uint8_t buf[4] = v364;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v366;
                _os_log_impl((void *)&_mh_execute_header, v265, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_EncryptionInfoKey should be 1 byte, not %u bytes, field: %u", buf, 0xEu);
              }

              if (!os_log_shim_legacy_logging_enabled()) {
                continue;
              }
              if (!_IDSShouldLogTransport()) {
                continue;
              }
              uint64_t v327 = v364;
              *(void *)&double v328 = v366;
              _IDSLogTransport();
              if (!_IDSShouldLog()) {
                continue;
              }
              goto LABEL_613;
            }
            int v120 = *v365;
            v121 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
            {
              if (v120) {
                CFStringRef v122 = @"YES";
              }
              else {
                CFStringRef v122 = @"NO";
              }
              v123 = [(IDSDSession *)self sharedState];
              unsigned int v124 = [v123 groupID];
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v122;
              *(_WORD *)&unsigned char buf[12] = 2112;
              *(void *)&buf[14] = v124;
              _os_log_impl((void *)&_mh_execute_header, v121, OS_LOG_TYPE_DEFAULT, "got kClientChannelMetadataType_EncryptionInfoKey %@ group: %@", buf, 0x16u);
            }
            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              if (v120) {
                CFStringRef v125 = @"YES";
              }
              else {
                CFStringRef v125 = @"NO";
              }
              v126 = [(IDSDSession *)self sharedState];
              [v126 groupID];
              uint64_t v327 = (uint64_t)v125;
              double v328 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
              _IDSLogV();
            }
            if (v120)
            {
              v127 = [(IDSDSession *)self sharedState];
              v128 = [v127 groupID];

              if (v128)
              {
                uint64_t v129 = +[IDSGroupEncryptionController sharedInstance];
                v130 = [(IDSDSession *)self sharedState];
                v131 = [v130 accountID];
                v132 = [(IDSDSession *)self sharedState];
                int v133 = [v132 fromURI];
                int v134 = [(IDSDSession *)self sharedState];
                v135 = [v134 groupID];
                [v129 setAccount:v131 fromURI:v133 forGroup:v135];

                CFStringRef v136 = im_primary_queue();
                block[0] = _NSConcreteStackBlock;
                block[1] = 3221225472;
                block[2] = sub_100096A90;
                block[3] = &unk_10097E4D0;
                void block[4] = self;
                dispatch_block_t v137 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, block);
                dispatch_async(v136, v137);
              }
              continue;
            }
            v318 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v318, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v318, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_EncryptionInfoKey FALSE. We won't pass the encryption information to the client.", buf, 2u);
            }

            if (!os_log_shim_legacy_logging_enabled()) {
              continue;
            }
            if (!_IDSShouldLogTransport()) {
              continue;
            }
            _IDSLogTransport();
            if (!_IDSShouldLog()) {
              continue;
            }
            goto LABEL_628;
          case 0x23u:
            if (v364 != 1) {
              continue;
            }
            uint64_t v36 = *v365;
            if (v36 < 0xD)
            {
              char v339 = *v365;
              if (self->_verboseFunctionalLogging)
              {
                v304 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v304, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)&uint8_t buf[4] = v36;
                  _os_log_impl((void *)&_mh_execute_header, v304, OS_LOG_TYPE_DEFAULT, "got streamIDCount %u", buf, 8u);
                }

                if (os_log_shim_legacy_logging_enabled())
                {
                  if (_IDSShouldLog())
                  {
LABEL_710:
                    uint64_t v327 = v36;
                    _IDSLogV();
                  }
                }
              }
            }
            else
            {
              v138 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)&uint8_t buf[4] = v36;
                _os_log_impl((void *)&_mh_execute_header, v138, OS_LOG_TYPE_DEFAULT, "got invalid streamIDCount %u", buf, 8u);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
              {
                uint64_t v327 = v36;
                _IDSLogV();
              }
              char v339 = 0;
            }
            continue;
          case 0x24u:
            if (v339 >= 1)
            {
              if (2 * (v339 & 0x7FFF) == v364)
              {
                uint64_t v139 = v339;
                var3 = a5->var24[0].var3;
                do
                {
                  CFStringRef v141 = v365 + 2;
                  unsigned __int16 *var3 = bswap32(*(unsigned __int16 *)v365) >> 16;
                  id v365 = v141;
                  if (self->_verboseFunctionalLogging)
                  {
                    v142 = OSLogHandleForTransportCategory();
                    if (os_log_type_enabled(v142, OS_LOG_TYPE_DEFAULT))
                    {
                      int v143 = *var3;
                      *(_DWORD *)buf = 67109120;
                      *(_DWORD *)&uint8_t buf[4] = v143;
                      _os_log_impl((void *)&_mh_execute_header, v142, OS_LOG_TYPE_DEFAULT, "got streamID %u", buf, 8u);
                    }

                    if (os_log_shim_legacy_logging_enabled())
                    {
                      if (_IDSShouldLogTransport())
                      {
                        uint64_t v327 = *var3;
                        _IDSLogTransport();
                        if (_IDSShouldLog())
                        {
                          uint64_t v327 = *var3;
                          _IDSLogV();
                        }
                      }
                    }
                  }
                  ++var3;
                  --v139;
                }
                while (v139);
                a5->var24[0].var20 |= 2u;
                a5->var24[0].int64_t var2 = v339;
              }
              else
              {
                v293 = OSLogHandleForTransportCategory();
                if (os_log_type_enabled(v293, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)&uint8_t buf[4] = v364;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = 2 * (v339 & 0x7FFF);
                  _os_log_impl((void *)&_mh_execute_header, v293, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_StreamIDsKey: size mismatch (%u != %u), ignore.", buf, 0xEu);
                }

                if (os_log_shim_legacy_logging_enabled())
                {
                  if (_IDSShouldLogTransport())
                  {
                    uint64_t v327 = v364;
                    *(void *)&double v328 = 2 * (v339 & 0x7FFFu);
                    _IDSLogTransport();
                    if (_IDSShouldLog())
                    {
                      uint64_t v327 = v364;
                      *(void *)&double v328 = 2 * (v339 & 0x7FFFu);
                      _IDSLogV();
                    }
                  }
                }
              }
            }
            continue;
          case 0x25u:
            if (v364 == 1)
            {
              [(__CFDictionary *)Mutable setObject:&__kCFBooleanTrue forKeyedSubscript:@"ccmdtipc"];
              continue;
            }
            v266 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v266, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v364;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v366;
              _os_log_impl((void *)&_mh_execute_header, v266, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_CountPacketKey should be 1 byte, not %u bytes, field: %u", buf, 0xEu);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                uint64_t v327 = v364;
                *(void *)&double v328 = v366;
                _IDSLogTransport();
                if (_IDSShouldLog()) {
                  goto LABEL_613;
                }
              }
            }
            continue;
          case 0x26u:
            if (v364 == 2)
            {
              unint64_t v28 = __rev16(*(unsigned __int16 *)v365);
              v365 += 2;
              id v212 = +[NSNumber numberWithUnsignedShort:v28];
              [(__CFDictionary *)Mutable setObject:v212 forKeyedSubscript:@"ccmdtpgid"];

              if (self->_verboseFunctionalLogging)
              {
                id v213 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v213, OS_LOG_TYPE_DEFAULT))
                {
                  if (qword_100A4A5D0 != -1) {
                    dispatch_once(&qword_100A4A5D0, &stru_100981748);
                  }
                  uint64_t v214 = mach_continuous_time();
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)&uint8_t buf[4] = v28;
                  *(_WORD *)&buf[8] = 2048;
                  *(double *)&buf[10] = *(double *)&qword_100A4A5D8 * (double)v214;
                  _os_log_impl((void *)&_mh_execute_header, v213, OS_LOG_TYPE_DEFAULT, "got probeGroupID %u [%013.6lf]", buf, 0x12u);
                }

                if (os_log_shim_legacy_logging_enabled())
                {
                  if (_IDSShouldLog())
                  {
                    if (qword_100A4A5D0 != -1) {
LABEL_785:
                    }
                      dispatch_once(&qword_100A4A5D0, &stru_100981748);
LABEL_326:
                    double v328 = *(double *)&qword_100A4A5D8 * (double)mach_continuous_time();
                    uint64_t v327 = v28;
                    _IDSLogV();
                  }
                }
              }
              continue;
            }
            v278 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v278, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v364;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v366;
              _os_log_impl((void *)&_mh_execute_header, v278, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_ProbeGroupIDKey should be 2 byte, not %u bytes, field: %u", buf, 0xEu);
            }

            if (!os_log_shim_legacy_logging_enabled()) {
              continue;
            }
            if (!_IDSShouldLogTransport()) {
              continue;
            }
            uint64_t v327 = v364;
            *(void *)&double v328 = v366;
            _IDSLogTransport();
            if (!_IDSShouldLog()) {
              continue;
            }
            goto LABEL_613;
          case 0x27u:
            long long v19 = +[NSData dataWithBytes:v365 length:v364];
            if (v19)
            {
              CFStringRef v144 = +[IDSSessionInfoMetadataSerializer deserializeSessionInfoMetadata:v19];
              v145 = v144;
              if (v144)
              {
                [v144 setObject:&off_1009D0D80 forKeyedSubscript:v333];
                [(IDSDSession *)self requestSessionInfoWithOptions:v145];
              }
              else
              {
                v305 = OSLogHandleForTransportCategory();
                if (os_log_type_enabled(v305, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v305, OS_LOG_TYPE_DEFAULT, "There was a problem creating NSDictionary from NSData for kClientChannelMetadataType_SessionInfoKey", buf, 2u);
                }

                if (os_log_shim_legacy_logging_enabled())
                {
                  if (_IDSShouldLogTransport())
                  {
                    _IDSLogTransport();
                    if (_IDSShouldLog()) {
                      _IDSLogV();
                    }
                  }
                }
              }

              goto LABEL_766;
            }
            BOOL v286 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v286, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v286, OS_LOG_TYPE_DEFAULT, "Couldn't get NSData for kClientChannelMetadataType_SessionInfoKey.", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport();
                if (_IDSShouldLog()) {
                  goto LABEL_670;
                }
              }
            }
            goto LABEL_766;
          case 0x28u:
            long long v19 = +[NSData dataWithBytes:v365 length:v364];
            if (v19)
            {
              v146 = +[IDSSessionInfoMetadataSerializer deserializeSessionInfoMetadata:v19];
              if (v146)
              {
                v147 = OSLogHandleForTransportCategory();
                if (os_log_type_enabled(v147, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v146;
                  _os_log_impl((void *)&_mh_execute_header, v147, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_StatsKey: send stats request with options: %@", buf, 0xCu);
                }

                if (os_log_shim_legacy_logging_enabled())
                {
                  if (_IDSShouldLogTransport())
                  {
                    uint64_t v327 = (uint64_t)v146;
                    _IDSLogTransport();
                    if (_IDSShouldLog())
                    {
                      uint64_t v327 = (uint64_t)v146;
                      _IDSLogV();
                    }
                  }
                }
                id v354 = v146;
                IDSTransportThreadAddBlock();
              }
              else
              {
                v306 = OSLogHandleForTransportCategory();
                if (os_log_type_enabled(v306, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v306, OS_LOG_TYPE_DEFAULT, "There was a problem creating NSDictionary from NSData for kClientChannelMetadataType_StatsKey", buf, 2u);
                }

                if (os_log_shim_legacy_logging_enabled())
                {
                  if (_IDSShouldLogTransport())
                  {
                    _IDSLogTransport();
                    if (_IDSShouldLog()) {
                      _IDSLogV();
                    }
                  }
                }
              }

              goto LABEL_766;
            }
            uint64_t v287 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v287, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v287, OS_LOG_TYPE_DEFAULT, "Couldn't get NSData for kClientChannelMetadataType_StatsKey.", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport();
                if (_IDSShouldLog()) {
                  goto LABEL_670;
                }
              }
            }
            goto LABEL_766;
          case 0x29u:
            if (v364 == 1)
            {
              uint64_t v148 = *v365;
              CFStringRef v149 = +[NSNumber numberWithUnsignedChar:v148];
              [(__CFDictionary *)Mutable setObject:v149 forKeyedSubscript:@"ccmdtcdc"];

              if (!self->_verboseFunctionalLogging) {
                continue;
              }
              v150 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v150, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)&uint8_t buf[4] = v148;
                _os_log_impl((void *)&_mh_execute_header, v150, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_CurrentDatagramCount %u", buf, 8u);
              }

              if (!os_log_shim_legacy_logging_enabled()) {
                continue;
              }
              if (!_IDSShouldLogTransport()) {
                continue;
              }
              uint64_t v327 = v148;
              _IDSLogTransport();
              if (!_IDSShouldLog()) {
                continue;
              }
              goto LABEL_332;
            }
            v267 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v267, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v364;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v366;
              _os_log_impl((void *)&_mh_execute_header, v267, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_CurrentDatagramCount should be 1 byte, not %u bytes, field: %u", buf, 0xEu);
            }

            if (!os_log_shim_legacy_logging_enabled()) {
              continue;
            }
            if (!_IDSShouldLogTransport()) {
              continue;
            }
            uint64_t v327 = v364;
            *(void *)&double v328 = v366;
            _IDSLogTransport();
            if (!_IDSShouldLog()) {
              continue;
            }
            goto LABEL_613;
          case 0x2Au:
            if (v364 == 1)
            {
              uint64_t v148 = *v365;
              v151 = +[NSNumber numberWithUnsignedChar:v148];
              [(__CFDictionary *)Mutable setObject:v151 forKeyedSubscript:@"ccmdttdc"];

              if (!self->_verboseFunctionalLogging) {
                continue;
              }
              CFStringRef v152 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v152, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)&uint8_t buf[4] = v148;
                _os_log_impl((void *)&_mh_execute_header, v152, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_TotalDatagramCount %u", buf, 8u);
              }

              if (!os_log_shim_legacy_logging_enabled()) {
                continue;
              }
              if (!_IDSShouldLogTransport()) {
                continue;
              }
              uint64_t v327 = v148;
              _IDSLogTransport();
              if (!_IDSShouldLog()) {
                continue;
              }
              goto LABEL_332;
            }
            v268 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v268, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v364;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v366;
              _os_log_impl((void *)&_mh_execute_header, v268, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_TotalDatagramCount should be 1 byte, not %u bytes, field: %u", buf, 0xEu);
            }

            if (!os_log_shim_legacy_logging_enabled()) {
              continue;
            }
            if (!_IDSShouldLogTransport()) {
              continue;
            }
            uint64_t v327 = v364;
            *(void *)&double v328 = v366;
            _IDSLogTransport();
            if (!_IDSShouldLog()) {
              continue;
            }
            goto LABEL_613;
          case 0x2Du:
            if (v364 == 2)
            {
              uint64_t v148 = __rev16(*(unsigned __int16 *)v365);
              v365 += 2;
              v215 = +[NSNumber numberWithUnsignedShort:v148];
              [(__CFDictionary *)Mutable setObject:v215 forKeyedSubscript:@"ccmdtsid"];

              v216 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v216, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)&uint8_t buf[4] = v148;
                _os_log_impl((void *)&_mh_execute_header, v216, OS_LOG_TYPE_DEBUG, "got statsID %u", buf, 8u);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
              {
LABEL_332:
                uint64_t v327 = v148;
                _IDSLogV();
              }
              continue;
            }
            v279 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v279, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v364;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v366;
              _os_log_impl((void *)&_mh_execute_header, v279, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_StatsID should be 2 byte, not %u bytes, field: %u", buf, 0xEu);
            }

            if (!os_log_shim_legacy_logging_enabled()) {
              continue;
            }
            if (!_IDSShouldLogTransport()) {
              continue;
            }
            uint64_t v327 = v364;
            *(void *)&double v328 = v366;
            _IDSLogTransport();
            if (!_IDSShouldLog()) {
              continue;
            }
            goto LABEL_613;
          case 0x33u:
            if (v364 == 1)
            {
              a5->var24[0].var20 |= 0x80u;
              a5->var24[0].var9 = 1;
              continue;
            }
            v269 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v269, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v364;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v366;
              _os_log_impl((void *)&_mh_execute_header, v269, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_OptOutPriorityFilter should be 1 byte, not %u bytes, field: %u", buf, 0xEu);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                uint64_t v327 = v364;
                *(void *)&double v328 = v366;
                _IDSLogTransport();
                if (_IDSShouldLog()) {
                  goto LABEL_613;
                }
              }
            }
            continue;
          case 0x34u:
            if (v364 == 1)
            {
              a5->var24[0].var20 |= 0x100u;
              a5->var24[0].var12 = 1;
              continue;
            }
            v270 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v270, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v364;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v366;
              _os_log_impl((void *)&_mh_execute_header, v270, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_TransitionPacketFlag should be 1 byte, not %u bytes, field: %u", buf, 0xEu);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                uint64_t v327 = v364;
                *(void *)&double v328 = v366;
                _IDSLogTransport();
                if (_IDSShouldLog()) {
                  goto LABEL_613;
                }
              }
            }
            continue;
          case 0x35u:
            if (v364 == 1)
            {
              v217 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v217, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v217, OS_LOG_TYPE_DEFAULT, "got kClientChannelMetadataType_ForceUpdateEncryptionInfoKey", buf, 2u);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
                _IDSLogV();
              }
              v218 = [(IDSDSession *)self sharedState];
              v219 = [v218 groupID];

              if (v219)
              {
                v220 = im_primary_queue();
                v355[0] = _NSConcreteStackBlock;
                v355[1] = 3221225472;
                v355[2] = sub_100096C38;
                v355[3] = &unk_10097E4D0;
                v355[4] = self;
                dispatch_block_t v221 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, v355);
                dispatch_async(v220, v221);
              }
              else
              {
                v319 = OSLogHandleForTransportCategory();
                if (os_log_type_enabled(v319, OS_LOG_TYPE_DEFAULT))
                {
                  v320 = [(IDSDSession *)self sharedState];
                  id v321 = [v320 uniqueID];
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v321;
                  _os_log_impl((void *)&_mh_execute_header, v319, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_ForceUpdateEncryptionInfoKey coudln't get the group ID for the session %@!", buf, 0xCu);
                }
                if (os_log_shim_legacy_logging_enabled())
                {
                  if (_IDSShouldLogTransport())
                  {
                    v322 = [(IDSDSession *)self sharedState];
                    uint64_t v327 = [v322 uniqueID];
                    _IDSLogTransport();

                    if (_IDSShouldLog())
                    {
                      dispatch_block_t v323 = [(IDSDSession *)self sharedState];
                      uint64_t v327 = [v323 uniqueID];
                      _IDSLogV();
                    }
                  }
                }
              }
              continue;
            }
            v280 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v280, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v364;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v366;
              _os_log_impl((void *)&_mh_execute_header, v280, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_ForceUpdateEncryptionInfoKey should be 1 byte, not %u bytes, field: %u", buf, 0xEu);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                uint64_t v327 = v364;
                *(void *)&double v328 = v366;
                _IDSLogTransport();
                if (_IDSShouldLog()) {
                  goto LABEL_613;
                }
              }
            }
            continue;
          case 0x39u:
            long long v19 = +[NSData dataWithBytes:v365 length:v364];
            if (v19)
            {
              CFStringRef v153 = +[IDSSessionInfoMetadataSerializer deserializeSessionInfoMetadata:v19];
              if (v153)
              {
                v154 = [(IDSDSession *)self utunController];
                v155 = [(IDSDSession *)self sharedState];
                v156 = [v155 uniqueID];
                objc_msgSend(v154, "onTransportThread_startLinkProbing:options:", v156, v153);
              }
              else
              {
                v307 = OSLogHandleForTransportCategory();
                if (os_log_type_enabled(v307, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v307, OS_LOG_TYPE_DEFAULT, "There was a problem creating NSDictionary from NSData for kClientChannelMetadataType_StartLinkProbingKey", buf, 2u);
                }

                if (os_log_shim_legacy_logging_enabled())
                {
                  if (_IDSShouldLogTransport())
                  {
                    _IDSLogTransport();
                    if (_IDSShouldLog()) {
                      _IDSLogV();
                    }
                  }
                }
              }

              goto LABEL_766;
            }
            v288 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v288, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v288, OS_LOG_TYPE_DEFAULT, "Couldn't get NSData for kClientChannelMetadataType_StartLinkProbingKey.", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport();
                if (_IDSShouldLog()) {
                  goto LABEL_670;
                }
              }
            }
            goto LABEL_766;
          case 0x3Au:
            long long v19 = +[NSData dataWithBytes:v365 length:v364];
            if (v19)
            {
              v157 = +[IDSSessionInfoMetadataSerializer deserializeSessionInfoMetadata:v19];
              if (v157)
              {
                v158 = [(IDSDSession *)self utunController];
                CFStringRef v159 = [(IDSDSession *)self sharedState];
                CFStringRef v160 = [v159 uniqueID];
                objc_msgSend(v158, "onTransportThread_stopLinkProbing:options:", v160, v157);
              }
              else
              {
                v308 = OSLogHandleForTransportCategory();
                if (os_log_type_enabled(v308, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v308, OS_LOG_TYPE_DEFAULT, "There was a problem creating NSDictionary from NSData for kClientChannelMetadataType_StopLinkProbingKey", buf, 2u);
                }

                if (os_log_shim_legacy_logging_enabled())
                {
                  if (_IDSShouldLogTransport())
                  {
                    _IDSLogTransport();
                    if (_IDSShouldLog()) {
                      _IDSLogV();
                    }
                  }
                }
              }

              goto LABEL_766;
            }
            uint64_t v289 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v289, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v289, OS_LOG_TYPE_DEFAULT, "Couldn't get NSData for kClientChannelMetadataType_StopLinkProbingKey.", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport();
                if (_IDSShouldLog()) {
                  goto LABEL_670;
                }
              }
            }
            goto LABEL_766;
          case 0x3Bu:
            long long v19 = +[NSData dataWithBytes:v365 length:v364];
            if (v19)
            {
              v161 = +[IDSSessionInfoMetadataSerializer deserializeSessionInfoMetadata:v19];
              if (v161)
              {
                v162 = [(IDSDSession *)self utunController];
                v163 = [(IDSDSession *)self sharedState];
                v164 = [v163 uniqueID];
                objc_msgSend(v162, "onTransportThread_queryLinkProbingStatus:options:", v164, v161);
              }
              else
              {
                v309 = OSLogHandleForTransportCategory();
                if (os_log_type_enabled(v309, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v309, OS_LOG_TYPE_DEFAULT, "There was a problem creating NSDictionary from NSData for kClientChannelMetadataType_QueryLinkStatusKey", buf, 2u);
                }

                if (os_log_shim_legacy_logging_enabled())
                {
                  if (_IDSShouldLogTransport())
                  {
                    _IDSLogTransport();
                    if (_IDSShouldLog()) {
                      _IDSLogV();
                    }
                  }
                }
              }

              goto LABEL_766;
            }
            v290 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v290, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v290, OS_LOG_TYPE_DEFAULT, "Couldn't get NSData for kClientChannelMetadataType_QueryLinkStatusKey.", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport();
                if (_IDSShouldLog()) {
                  goto LABEL_670;
                }
              }
            }
            goto LABEL_766;
          case 0x40u:
            long long v19 = +[NSData dataWithBytes:v365 length:v364];
            if (v19)
            {
              uint64_t v165 = +[IDSSessionInfoMetadataSerializer deserializeSessionInfoMetadata:v19];
              if (v165)
              {
                v166 = [(IDSDSession *)self utunController];
                v167 = [(IDSDSession *)self sharedState];
                v168 = [v167 uniqueID];
                objc_msgSend(v166, "onTransportThread_flushLinkProbingStatus:options:", v168, v165);
              }
              else
              {
                v310 = OSLogHandleForTransportCategory();
                if (os_log_type_enabled(v310, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v310, OS_LOG_TYPE_DEFAULT, "There was a problem creating NSDictionary from NSData for kClientChannelMetadataType_flushLinkProbingStatusKey", buf, 2u);
                }

                if (os_log_shim_legacy_logging_enabled())
                {
                  if (_IDSShouldLogTransport())
                  {
                    _IDSLogTransport();
                    if (_IDSShouldLog()) {
                      _IDSLogV();
                    }
                  }
                }
              }

              goto LABEL_766;
            }
            v291 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v291, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v291, OS_LOG_TYPE_DEFAULT, "Couldn't get NSData for kClientChannelMetadataType_flushLinkProbingStatusKey.", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport();
                if (_IDSShouldLog()) {
                  goto LABEL_670;
                }
              }
            }
            goto LABEL_766;
          case 0x41u:
            if (v364 == 4)
            {
              unsigned int v169 = *(_DWORD *)v365;
              v365 += 4;
              v170 = [(IDSDSession *)self utunController];
              v171 = [(IDSDSession *)self sharedState];
              v172 = [v171 uniqueID];
              objc_msgSend(v170, "onTransportThread_setRemoteDeviceVersion:version:", v172, bswap32(v169));

              continue;
            }
            v271 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v271, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109632;
              *(_DWORD *)&uint8_t buf[4] = 4;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v364;
              *(_WORD *)&buf[14] = 1024;
              *(_DWORD *)&buf[16] = v366;
              _os_log_impl((void *)&_mh_execute_header, v271, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_RemoteDeviceVersionKey should be %u bytes, not %u bytes, field: %u", buf, 0x14u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                *(void *)&double v328 = v364;
                *(void *)&double v329 = v366;
                uint64_t v327 = 4;
                _IDSLogTransport();
                if (_IDSShouldLog()) {
                  goto LABEL_541;
                }
              }
            }
            continue;
          case 0x42u:
            if (v364)
            {
              id v173 = objc_alloc_init((Class)NSMutableArray);
              unsigned int v174 = v364;
              *(void *)&double v175 = v364 >> 3;
              v176 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v176, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&uint8_t buf[4] = v364;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = LODWORD(v175);
                _os_log_impl((void *)&_mh_execute_header, v176, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_MKMParticipantIDsKey: size: %u, count: %u", buf, 0xEu);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  uint64_t v327 = v364;
                  double v328 = v175;
                  _IDSLogTransport();
                  if (_IDSShouldLog())
                  {
                    uint64_t v327 = v364;
                    double v328 = v175;
                    _IDSLogV();
                  }
                }
              }
              if (v174 >= 8)
              {
                uint64_t v294 = 0;
                if (LODWORD(v175) <= 1) {
                  unsigned int v295 = 1;
                }
                else {
                  unsigned int v295 = LODWORD(v175);
                }
                uint64_t v296 = 8 * v295;
                do
                {
                  uint64_t v297 = *(void *)&v365[v294];
                  v298 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v297, v327);
                  [v173 addObject:v298];

                  v299 = [(IDSDSession *)self _getPushTokenFromParticipantID:v297];
                  if (v299)
                  {
                    v300 = [(IDSGFTMetricsCollector *)self->_metricsCollector joinCycleForToken:v299];
                    [v300 requestedKM];
                  }
                  else
                  {
                    v301 = OSLogHandleForTransportCategory();
                    if (os_log_type_enabled(v301, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 134217984;
                      *(void *)&uint8_t buf[4] = v297;
                      _os_log_impl((void *)&_mh_execute_header, v301, OS_LOG_TYPE_DEFAULT, "Couldn't get URI for MKMParticipantID %llu", buf, 0xCu);
                    }

                    if (os_log_shim_legacy_logging_enabled())
                    {
                      if (_IDSShouldLogTransport())
                      {
                        uint64_t v327 = v297;
                        _IDSLogTransport();
                        if (_IDSShouldLog())
                        {
                          uint64_t v327 = v297;
                          _IDSLogV();
                        }
                      }
                    }
                  }

                  v294 += 8;
                }
                while (v296 != v294);
              }
              v177 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v177, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v173;
                _os_log_impl((void *)&_mh_execute_header, v177, OS_LOG_TYPE_DEFAULT, "participantIDArray: %@", buf, 0xCu);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  uint64_t v327 = (uint64_t)v173;
                  _IDSLogTransport();
                  if (_IDSShouldLog())
                  {
                    uint64_t v327 = (uint64_t)v173;
                    _IDSLogV();
                  }
                }
              }
              v178 = +[IDSGroupEncryptionController sharedInstance];
              v179 = [(IDSDSession *)self sharedState];
              v180 = [v179 groupID];
              v181 = [(IDSDSession *)self sharedState];
              v182 = [v181 uniqueID];
              [v178 sendKeyMaterialsRecoveryRequestToParticipants:v173 groupID:v180 sessionID:v182 requireMKM:1 requireSKM:0];
            }
            else
            {
              v285 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v285, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v285, OS_LOG_TYPE_DEFAULT, "Couldn't get valid kClientChannelMetadataType_MKMParticipantIDsKey.", buf, 2u);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  _IDSLogTransport();
                  if (_IDSShouldLog()) {
LABEL_628:
                  }
                    _IDSLogV();
                }
              }
            }
            continue;
          case 0x43u:
            if (v364 == 1)
            {
              [(__CFDictionary *)Mutable setObject:&__kCFBooleanTrue forKeyedSubscript:@"ccmdtnhbhe"];
              continue;
            }
            v272 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v272, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = 1;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v364;
              _os_log_impl((void *)&_mh_execute_header, v272, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_NeedsHBHEncryption should be %u byte, not %u", buf, 0xEu);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                uint64_t v327 = 1;
                *(void *)&double v328 = v364;
                _IDSLogTransport();
                if (_IDSShouldLog()) {
                  goto LABEL_601;
                }
              }
            }
            continue;
          case 0x44u:
            if (v364 == 2)
            {
              v183 = v365;
              int v184 = *v365++;
              int v185 = *v365;
              id v365 = v183 + 2;
              if (v184)
              {
                self->_switchedToUPlusMany = 0;
                v186 = [(IDSDSession *)self sharedState];
                [v186 setIsInUPlusOneMode:1];

                v187 = [(IDSDSession *)self sharedState];
                [v187 setIsInitiator:v185 != 0];

                v188 = OSLogHandleForTransportCategory();
                if (os_log_type_enabled(v188, OS_LOG_TYPE_DEFAULT))
                {
                  CFStringRef v189 = @"NO";
                  if (v185) {
                    CFStringRef v189 = @"YES";
                  }
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v189;
                  _os_log_impl((void *)&_mh_execute_header, v188, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_IsUPlusOneEnabledKey [U+1] enabling with isInitiator: %@", buf, 0xCu);
                }

                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
                {
                  v190 = v185 ? @"YES" : @"NO";
                  uint64_t v327 = (uint64_t)v190;
                  _IDSLogTransport();
                  if (_IDSShouldLog())
                  {
                    uint64_t v327 = (uint64_t)v190;
                    _IDSLogV();
                  }
                }
              }
              else
              {
                self->_switchedToUPlusMany = 1;
                v312 = [(IDSDSession *)self sharedState];
                [v312 setIsInUPlusOneMode:0];
              }
              BOOL v313 = v184 != 0;
              v314 = [(IDSDSession *)self sharedState];
              -[IDSGFTMetricsCollector setIsInitiator:](self->_metricsCollector, "setIsInitiator:", [v314 isInitiator]);

              v315 = [(IDSDSession *)self utunController];
              v316 = [(IDSDSession *)self sharedState];
              v317 = [v316 uniqueID];
              objc_msgSend(v315, "onTransportThread_setUPlusOneModeForSessionID:isUPlusOneEnabled:", v317, v313);
            }
            else
            {
              v273 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v273, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109632;
                *(_DWORD *)&uint8_t buf[4] = 2;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v364;
                *(_WORD *)&buf[14] = 1024;
                *(_DWORD *)&buf[16] = v366;
                _os_log_impl((void *)&_mh_execute_header, v273, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_IsUPlusOneEnabledKey should be %u bytes, not %u bytes, field: %u", buf, 0x14u);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  *(void *)&double v328 = v364;
                  *(void *)&double v329 = v366;
                  uint64_t v327 = 2;
                  _IDSLogTransport();
                  if (_IDSShouldLog())
                  {
LABEL_553:
                    *(void *)&double v328 = v364;
                    *(void *)&double v329 = v366;
                    uint64_t v327 = 2;
                    _IDSLogV();
                  }
                }
              }
            }
            continue;
          case 0x45u:
            if (v364 == 8)
            {
              uint64_t v191 = *v365;
              uint64_t v192 = v365[1];
              uint64_t v193 = v365[2];
              uint64_t v194 = v365[3];
              uint64_t v195 = v365[4];
              uint64_t v196 = v365[5];
              uint64_t v331 = v365[6];
              uint64_t v330 = v365[7];
              v365 += 8;
              uint64_t v197 = [(IDSDSession *)self sharedState];
              v198 = [v197 groupID];

              if (v198)
              {
                CFStringRef v199 = +[IDSGroupEncryptionController sharedInstance];
                v200 = [(IDSDSession *)self sharedState];
                v201 = [v200 groupID];
                [v199 storeEncryptionSequenceNumber:(v191 << 56) | (v192 << 48) | (v193 << 40) | (v194 << 32) | (v195 << 24) | (v196 << 16) | (v331 << 8) | v330 groupID:v201];
              }
            }
            else
            {
              v274 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v274, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109632;
                *(_DWORD *)&uint8_t buf[4] = 8;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v364;
                *(_WORD *)&buf[14] = 1024;
                *(_DWORD *)&buf[16] = v366;
                _os_log_impl((void *)&_mh_execute_header, v274, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_EncryptionSequenceNumber should be %u bytes, not %u bytes, field: %u", buf, 0x14u);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  *(void *)&double v328 = v364;
                  *(void *)&double v329 = v366;
                  uint64_t v327 = 8;
                  _IDSLogTransport();
                  if (_IDSShouldLog())
                  {
LABEL_469:
                    *(void *)&double v328 = v364;
                    *(void *)&double v329 = v366;
                    uint64_t v327 = 8;
                    _IDSLogV();
                  }
                }
              }
            }
            continue;
          case 0x47u:
            if (v364 == 1)
            {
              a5->var24[0].var20 |= 0x10000u;
              a5->var24[0].var17 = 1;
              continue;
            }
            v275 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v275, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = 1;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v364;
              _os_log_impl((void *)&_mh_execute_header, v275, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_RetransmittedPacket should be %u byte, not %u", buf, 0xEu);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                uint64_t v327 = 1;
                *(void *)&double v328 = v364;
                _IDSLogTransport();
                if (_IDSShouldLog()) {
                  goto LABEL_601;
                }
              }
            }
            continue;
          case 0x48u:
            if (v364 == 1)
            {
              a5->var24[0].var20 |= 0x20000u;
              a5->var24[0].var18 = 1;
              continue;
            }
            v276 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v276, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = 1;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v364;
              _os_log_impl((void *)&_mh_execute_header, v276, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_NonRetransmittablePacket should be %u byte, not %u", buf, 0xEu);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                uint64_t v327 = 1;
                *(void *)&double v328 = v364;
                _IDSLogTransport();
                if (_IDSShouldLog()) {
                  goto LABEL_601;
                }
              }
            }
            continue;
          case 0x4Cu:
            if (v364 == 1)
            {
              IDSTransportThreadAddBlock();
            }
            else
            {
              v281 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v281, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&uint8_t buf[4] = 1;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v364;
                _os_log_impl((void *)&_mh_execute_header, v281, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_ChildConnectionID should be %u bytes, not %u bytes", buf, 0xEu);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  uint64_t v327 = 1;
                  *(void *)&double v328 = v364;
                  _IDSLogTransport();
                  if (_IDSShouldLog())
                  {
LABEL_601:
                    uint64_t v327 = 1;
                    *(void *)&double v328 = v364;
                    _IDSLogV();
                  }
                }
              }
            }
            continue;
          case 0x4Du:
            long long v19 = +[NSData dataWithBytes:v365 length:v364];
            if (v19)
            {
              v222 = +[IDSSessionInfoMetadataSerializer deserializeSessionInfoMetadata:v19];
              if (v222)
              {
                int v223 = [(IDSDSession *)self utunController];
                v224 = [(IDSDSession *)self sharedState];
                v225 = [v224 uniqueID];
                objc_msgSend(v223, "onTransportThread_sendStatsRequestWithOptions:options:", v225, v222);
              }
              else
              {
                v311 = OSLogHandleForTransportCategory();
                if (os_log_type_enabled(v311, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v311, OS_LOG_TYPE_DEFAULT, "There was a problem creating NSDictionary from NSData for kClientChannelMetadataType_StatsRequestData", buf, 2u);
                }

                if (os_log_shim_legacy_logging_enabled())
                {
                  if (_IDSShouldLogTransport())
                  {
                    _IDSLogTransport();
                    if (_IDSShouldLog()) {
                      _IDSLogV();
                    }
                  }
                }
              }
            }
            else
            {
              v292 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v292, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v292, OS_LOG_TYPE_DEFAULT, "Couldn't get NSData for kClientChannelMetadataType_StatsRequestData.", buf, 2u);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  _IDSLogTransport();
                  if (_IDSShouldLog()) {
LABEL_670:
                  }
                    _IDSLogV();
                }
              }
            }
            goto LABEL_766;
          case 0x4Eu:
          case 0x4Fu:
          case 0x50u:
            id v6 = +[NSData dataWithBytes:v365 length:v364];
            BOOL v7 = JWDecodeDictionary();
            dispatch_block_t v8 = [v7 objectForKeyedSubscript:v345];
            if (v8
              && (self,
                  BOOL v9 = objc_claimAutoreleasedReturnValue(),
                  char isKindOfClass = objc_opt_isKindOfClass(),
                  v9,
                  (isKindOfClass & 1) != 0))
            {
              id v11 = [objc_alloc((Class)NSUUID) initWithUUIDString:v8];
              if (!v11)
              {
                int v12 = OSLogHandleForTransportCategory();
                if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "_extractFieldBytesFromMetadata report dictionary: could not read MKI as UUID", buf, 2u);
                }

                if (os_log_shim_legacy_logging_enabled())
                {
                  if (_IDSShouldLogTransport())
                  {
                    _IDSLogTransport();
                    if (_IDSShouldLog()) {
                      _IDSLogV();
                    }
                  }
                }
              }
              uint64_t v13 = v335;
              if (((v366 & 0xFE) == 0x4E || (uint64_t v13 = v334, v366 == 80))
                && (objc_msgSend(v7, "objectForKeyedSubscript:", v13, v327),
                    unsigned int v14 = objc_claimAutoreleasedReturnValue(),
                    (id v15 = v14) != 0))
              {
                [v14 doubleValue];
                double v17 = v16;
                switch(v366)
                {
                  case 'P':
                    v324 = [v7 objectForKeyedSubscript:v332];
                    id v325 = [v324 BOOLValue];

                    [(IDSGFTMetricsCollector *)self->_metricsCollector avcReceiveMKMTime:v11 forMKI:v325 isGeneratedLocally:v17];
                    break;
                  case 'O':
                    [(IDSGFTMetricsCollector *)self->_metricsCollector firstOutgoingPacketTime:v11 forMKI:v16];
                    break;
                  case 'N':
                    [(IDSGFTMetricsCollector *)self->_metricsCollector firstIncomingPacketTime:v11 forMKI:v16];
                    break;
                }
              }
              else
              {
                v284 = OSLogHandleForTransportCategory();
                if (os_log_type_enabled(v284, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v284, OS_LOG_TYPE_DEFAULT, "_extractFieldBytesFromMetadata report dictionary: could not read times", buf, 2u);
                }

                if (os_log_shim_legacy_logging_enabled())
                {
                  if (_IDSShouldLogTransport())
                  {
                    _IDSLogTransport();
                    if (_IDSShouldLog()) {
                      _IDSLogV();
                    }
                  }
                }
                id v15 = 0;
              }
            }
            else
            {
              __int16 v27 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "_extractFieldBytesFromMetadata report dictionary: could not read MKI", buf, 2u);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  _IDSLogTransport();
                  if (_IDSShouldLog()) {
                    _IDSLogV();
                  }
                }
              }
            }

            continue;
          case 0x51u:
            v202 = +[NSData dataWithBytes:v365 length:v364];
            v203 = JWDecodeDictionary();
            v204 = [v203 objectForKeyedSubscript:v338];
            unsigned int v205 = [v203 objectForKeyedSubscript:v343];
            id v206 = [v205 unsignedCharValue];
            v207 = [(IDSDSession *)self utunController];
            v208 = [(IDSDSession *)self sharedState];
            id v209 = [v208 uniqueID];
            objc_msgSend(v207, "onTransportThread_reportLinkEventForSessionID:eventName:linkID:", v209, v204, v206);

            continue;
          case 0x53u:
            v226 = +[NSData dataWithBytes:v365 length:v364];
            unsigned int v227 = JWDecodeDictionary();
            v228 = [v227 objectForKeyedSubscript:v343];
            id v229 = [v228 unsignedCharValue];

            v230 = [v227 objectForKeyedSubscript:v337];
            [v230 doubleValue];
            double v232 = v231;

            uint64_t v233 = [v227 objectForKeyedSubscript:v336];
            [v233 doubleValue];
            double v235 = v234;

            v236 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v236, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109632;
              *(_DWORD *)&uint8_t buf[4] = v229;
              *(_WORD *)&buf[8] = 2048;
              *(double *)&buf[10] = v232;
              *(_WORD *)&buf[18] = 2048;
              *(double *)&buf[20] = v235;
              _os_log_impl((void *)&_mh_execute_header, v236, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_LinkMetricsKey: linkID:%d lastPacketReceivedTime:%f lastPacketSentTime:%f", buf, 0x1Cu);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                double v328 = v232;
                double v329 = v235;
                uint64_t v327 = v229;
                _IDSLogTransport();
                if (_IDSShouldLog())
                {
                  double v328 = v232;
                  double v329 = v235;
                  uint64_t v327 = (uint64_t)v229;
                  _IDSLogV();
                }
              }
            }
            v237 = [(IDSDSession *)self utunController];
            unsigned __int8 v238 = [(IDSDSession *)self sharedState];
            v239 = [v238 uniqueID];
            objc_msgSend(v237, "onTransportThread_reportLinkMetricsForSessionID:linkID:lastPacketReceivedTime:lastPacketSentTime:", v239, v229, v232, v235);

            continue;
          case 0x54u:
            if (v364 == 1)
            {
              uint64_t v210 = *v365++;
              v211 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v211, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)&uint8_t buf[4] = v210;
                _os_log_impl((void *)&_mh_execute_header, v211, OS_LOG_TYPE_DEFAULT, "got hasCompoundPacket %u", buf, 8u);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
              {
                uint64_t v327 = v210;
                _IDSLogV();
              }
              if (v210) {
                [(IDSGFTMetricsCollector *)self->_metricsCollector hasSentCompoundPacket];
              }
              continue;
            }
            uint64_t v277 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v277, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v364;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v366;
              _os_log_impl((void *)&_mh_execute_header, v277, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_CompoundPacketKey should be 1 bytes, not %u bytes, field: %u", buf, 0xEu);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                uint64_t v327 = v364;
                *(void *)&double v328 = v366;
                _IDSLogTransport();
                if (_IDSShouldLog()) {
                  goto LABEL_613;
                }
              }
            }
            continue;
          default:
            goto LABEL_366;
        }
      }
      switch(v366)
      {
        case 0xFCu:
          if (v364 == 4)
          {
            self->_int idsDataChannelClientPID = bswap32(*(_DWORD *)v365);
            v240 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v240, OS_LOG_TYPE_DEFAULT))
            {
              int idsDataChannelClientPID = self->_idsDataChannelClientPID;
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&uint8_t buf[4] = idsDataChannelClientPID;
              _os_log_impl((void *)&_mh_execute_header, v240, OS_LOG_TYPE_DEFAULT, "got the process PID %d", buf, 8u);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              uint64_t v327 = self->_idsDataChannelClientPID;
              _IDSLogV();
            }
          }
          else
          {
            v282 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v282, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109632;
              *(_DWORD *)&uint8_t buf[4] = 4;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v364;
              *(_WORD *)&buf[14] = 1024;
              *(_DWORD *)&buf[16] = v366;
              _os_log_impl((void *)&_mh_execute_header, v282, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_ProcessIDKey should be %d byte, not %u bytes, field: %u", buf, 0x14u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                *(void *)&double v328 = v364;
                *(void *)&double v329 = v366;
                uint64_t v327 = 4;
                _IDSLogTransport();
                if (_IDSShouldLog())
                {
LABEL_541:
                  *(void *)&double v328 = v364;
                  *(void *)&double v329 = v366;
                  uint64_t v327 = 4;
                  _IDSLogV();
                }
              }
            }
          }
          break;
        case 0xFDu:
          if (v364 == 1)
          {
            uint64_t v342 = *v365;
            id v242 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v242, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&uint8_t buf[4] = v342;
              _os_log_impl((void *)&_mh_execute_header, v242, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_DebugDataTransferTypeKey %d", buf, 8u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                uint64_t v327 = v342;
                _IDSLogTransport();
                if (_IDSShouldLog())
                {
                  uint64_t v327 = v342;
                  _IDSLogV();
                }
              }
            }
          }
          else
          {
            v283 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v283, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v364;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v366;
              _os_log_impl((void *)&_mh_execute_header, v283, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_DebugDataTransferTypeKey should be 1 bytes, not %u bytes, field: %u", buf, 0xEu);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                uint64_t v327 = v364;
                *(void *)&double v328 = v366;
                _IDSLogTransport();
                if (_IDSShouldLog())
                {
LABEL_613:
                  uint64_t v327 = v364;
                  *(void *)&double v328 = v366;
                  _IDSLogV();
                }
              }
            }
          }
          break;
        case 0xFEu:
          dispatch_block_t v18 = +[NSData dataWithBytes:v365 length:v364];
          long long v19 = v18;
          if (v342 == 1)
          {
            double v20 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", [v18 bytes], 1);
            long long v21 = [(IDSDSession *)self sharedState];
            [v21 setGroupID:v20];

            long long v22 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              id v23 = [(IDSDSession *)self sharedState];
              id v24 = [v23 groupID];
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v24;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_DebugDataTransferKey got the group ID %@", buf, 0xCu);
            }
            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                id v25 = [(IDSDSession *)self sharedState];
                uint64_t v327 = [v25 groupID];
                _IDSLogTransport();

                if (_IDSShouldLog())
                {
                  int v26 = [(IDSDSession *)self sharedState];
                  uint64_t v327 = [v26 groupID];
                  _IDSLogV();
                }
              }
            }
          }
LABEL_766:

          break;
        default:
LABEL_366:
          v243 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v243, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v366;
            _os_log_impl((void *)&_mh_execute_header, v243, OS_LOG_TYPE_DEFAULT, "Unknown metadata type: %u", buf, 8u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              uint64_t v327 = v366;
              _IDSLogTransport();
              if (_IDSShouldLog())
              {
                uint64_t v327 = v366;
                _IDSLogV();
              }
            }
          }
          break;
      }
    }
    while ((IDSByteBufferReadField() & 1) != 0);
  }
  IDSByteBufferRelease();

  return Mutable;
}

- (void)_connectQRDirectlyToClientChannel:(id)a3
{
  id v4 = a3;
  [v4 setClientReady:1];
  if ([v4 connectWithTransportThread])
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100097188;
    v8[3] = &unk_100980F10;
    v8[4] = self;
    objc_copyWeak(&v9, &location);
    [v4 setPacketBufferHandler:v8];
    long long v5 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "QR directly connected to IDSClientChannel %p", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    id v6 = im_primary_queue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10009717C;
    block[3] = &unk_10097E4D0;
    void block[4] = self;
    dispatch_block_t v7 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, block);
    dispatch_async(v6, v7);
  }
}

- (void)requestSessionInfoWithOptions:(id)a3
{
  id v4 = a3;
  long long v5 = (const void *)IDSGlobalLinkOptionSessionInfoRequestTypeKey;
  id v69 = v4;
  id v6 = [v4 objectForKey:IDSGlobalLinkOptionSessionInfoRequestTypeKey];
  dispatch_block_t v7 = (char *)[v6 unsignedIntegerValue];

  dispatch_block_t v8 = [(IDSDSession *)self sharedState];
  id v9 = [v8 fromURI];
  id v10 = [v9 unprefixedURI];
  id v11 = [v10 _bestGuessURI];

  if (!v11) {
    goto LABEL_5;
  }
  if (!IMStringIsPseudonymID()) {
    goto LABEL_5;
  }
  int v12 = [(IDSDSession *)self qrAllocator];
  id v13 = [(IDSDSession *)self sharedState];
  unsigned int v14 = [v13 uniqueID];
  CFDictionaryRef v15 = [v12 findAllocateResponseForSessionID:v14 FromURI:v11];

  if (!v15 && v7 == (char *)2)
  {
LABEL_5:
    double v16 = [(IDSDSession *)self qrAllocator];
    double v17 = [(IDSDSession *)self sharedState];
    dispatch_block_t v18 = [v17 uniqueID];
    long long v19 = [(IDSDSession *)self sharedState];
    double v20 = [v19 groupID];
    CFDictionaryRef v15 = [v16 getAllocateResponse:v18 groupID:v20];
  }
  if (v15)
  {
    if (kIDSQRAllocateKey_RelaySessionID) {
      Value = (void *)CFDictionaryGetValue(v15, kIDSQRAllocateKey_RelaySessionID);
    }
    else {
      Value = 0;
    }
    id v33 = Value;
    if (kIDSQRAllocateKey_GroupID) {
      double v34 = (void *)CFDictionaryGetValue(v15, kIDSQRAllocateKey_GroupID);
    }
    else {
      double v34 = 0;
    }
    id v35 = v34;
    uint64_t v36 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      id v37 = [(IDSDSession *)self sharedState];
      uint64_t v38 = [v37 groupID];
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = self;
      __int16 v78 = 2112;
      __int16 v79 = v38;
      __int16 v80 = 2112;
      id v81 = v35;
      __int16 v82 = 2112;
      id v83 = v33;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%@: requestSessionInfoWithOptions for groupID %@ relayGroupID %@ relaySessionID %@", buf, 0x2Au);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        unsigned int v39 = [(IDSDSession *)self sharedState];
        [v39 groupID];
        id v67 = v35;
        id v68 = v33;
        CFStringRef v66 = v65 = self;
        _IDSLogTransport();

        if (_IDSShouldLog())
        {
          long long v40 = [(IDSDSession *)self sharedState];
          [v40 groupID];
          id v67 = v35;
          id v68 = v33;
          CFStringRef v66 = v65 = self;
          _IDSLogV();
        }
      }
    }
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    long long v42 = +[NSNumber numberWithInteger:v7];
    if (v42)
    {
      CFDictionarySetValue(Mutable, v5, v42);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10070C14C();
    }

    long long v43 = self->_metricsCollector;
    if (v43)
    {
      CFDictionarySetValue(Mutable, IDSGlobalLinkOptionMetricsCollectorKey, v43);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10070C258();
    }

    long long v44 = +[IDSGroupEncryptionController sharedInstance];
    double v45 = [v44 p2pNegotiatorProvider];

    if (v45)
    {
      CFDictionarySetValue(Mutable, IDSGlobalLinkOptionP2PNegotiatorKey, v45);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10070C1D0();
    }

    if (v7 == (char *)2)
    {
      double v50 = [(IDSDSession *)self _createStreamSubscriptionRequest:v69];
      uint64_t v51 = (__CFDictionary *)[v50 copy];

      CFMutableDictionaryRef Mutable = v51;
    }
    else if (v7 == (char *)1)
    {
      int v46 = (const void *)IDSGlobalLinkOptionSessionInfoCommandFlagKey;
      unsigned int v47 = [v69 objectForKey:IDSGlobalLinkOptionSessionInfoCommandFlagKey];
      id v48 = [v47 unsignedIntValue];

      if (v48)
      {
        v49 = +[NSNumber numberWithUnsignedInt:v48];
        if (v49)
        {
          CFDictionarySetValue(Mutable, v46, v49);
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_10070C14C();
        }
      }
      unsigned int v61 = [(IDSDSession *)self _getNewLinkOptionsForActiveParticipantInfoRequest];
      if (v61)
      {
        CFDictionarySetValue(Mutable, IDSGlobalLinkOptionNewLinkOptionsKey, v61);
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_10070C0C4();
      }

      CFDictionarySetValue(Mutable, IDSGlobalLinkOptionQRSessionInfoKey, v15);
    }
    else
    {
      dispatch_queue_t v52 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = self;
        __int16 v78 = 2048;
        __int16 v79 = v7;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%@: requestSessionInfoWithOptions doesn't support the requestType: %ld", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport();
          if (_IDSShouldLog()) {
            _IDSLogV();
          }
        }
      }
    }
    unsigned int v62 = Mutable;
    id v63 = v33;
    id v64 = v35;
    IDSTransportThreadAddBlock();
  }
  else
  {
    long long v22 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v7;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "cachedSessionInfo is nil, requestType: %lu", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
    if ((unint64_t)(v7 - 1) > 1)
    {
      __int16 v53 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = self;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "%@: requestSessionInfoWithOptions failed! Couldn't get the cached response from QRAllocator.", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport();
          if (_IDSShouldLog()) {
            _IDSLogV();
          }
        }
      }
    }
    else
    {
      id v23 = [(IDSDSession *)self accountController];
      id v24 = [(IDSDSession *)self sharedState];
      id v25 = [v24 accountID];
      int v26 = [v23 accountWithUniqueID:v25];
      __int16 v27 = [v26 service];

      unint64_t v28 = [(IDSDSession *)self qrAllocator];
      id v29 = [(IDSDSession *)self sharedState];
      int v30 = [v29 getQuickRelayAllocateOptions:&off_1009D0D98];

      CFDictionarySetValue(v30, kIDSQRAllocateKey_AllocateType, &off_1009D0D98);
      uint64_t v31 = [(IDSDSession *)self sharedState];
      int v32 = [v31 groupID];

      if (v32)
      {
        CFDictionarySetValue(v30, kIDSQRAllocateKey_GroupID, v32);
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_10070C03C();
      }

      uint64_t v54 = +[NSNumber numberWithBool:self->_isLightweightParticipant];
      if (v54) {
        CFDictionarySetValue(v30, kIDSQRAllocateKey_IsLightweightParticipant, v54);
      }

      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      [(IDSGFTMetricsCollector *)self->_metricsCollector sendAllocationRequest];
      char v55 = im_primary_base_queue();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100098A8C;
      block[3] = &unk_100980F60;
      id v71 = v28;
      long long v72 = self;
      id v73 = v27;
      long long v74 = v30;
      CFStringRef v56 = v30;
      id v57 = v27;
      id v58 = v28;
      objc_copyWeak(v76, (id *)buf);
      v76[1] = v7;
      id v75 = v69;
      unsigned int v59 = v55;
      dispatch_block_t v60 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, block);
      dispatch_async(v59, v60);

      objc_destroyWeak(v76);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (void)requestURIsForParticipantIDs:(id)a3 withRequestID:(id)a4
{
  id v6 = a3;
  id v21 = a4;
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      for (int i = 0; i != v10; int i = (char *)i + 1)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        unsigned int v14 = [(IDSDSession *)self _getURIFromParticipantIDNumber:v13];
        if (v14)
        {
          [v7 setObject:v14 forKey:v13];
        }
        else
        {
          CFDictionaryRef v15 = +[IDSFoundationLog IDSDSession];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v30 = v13;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "requestURIsForParticipantIDs: could not find URI for participant id: %@", buf, 0xCu);
          }
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v10);
  }

  double v16 = +[IDSFoundationLog IDSDSession];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = [v7 count];
    *(_DWORD *)buf = 138412546;
    id v30 = v21;
    __int16 v31 = 2048;
    id v32 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "requestURIsForParticipantIDs: request id %@ found %lu participants.", buf, 0x16u);
  }

  dispatch_block_t v18 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009917C;
  block[3] = &unk_10097E418;
  void block[4] = self;
  id v23 = v7;
  id v24 = v21;
  id v19 = v21;
  id v20 = v7;
  dispatch_async(v18, block);
}

- (void)registerPluginWithOptions:(id)a3 messageContext:(id)a4
{
  CFDictionaryRef v6 = (const __CFDictionary *)a3;
  id v7 = a4;
  Value = 0;
  if (v6 && IDSGroupSessionPluginNameKey) {
    Value = (void *)CFDictionaryGetValue(v6, IDSGroupSessionPluginNameKey);
  }
  id v9 = Value;
  id v10 = 0;
  if (v6 && IDSGroupSessionRawPublicKeyKey) {
    id v10 = (void *)CFDictionaryGetValue(v6, IDSGroupSessionRawPublicKeyKey);
  }
  id v11 = v10;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  id v13 = v9;
  if (v13)
  {
    CFDictionarySetValue(Mutable, IDSGlobalLinkOptionPluginNameKey, v13);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070C2E0();
  }

  CFDictionarySetValue(Mutable, IDSGlobalLinkOptionPluginOperationKey, &off_1009D0DB0);
  if (v11) {
    CFDictionarySetValue(Mutable, IDSGlobalLinkOptionPluginRawPublicKeyKey, v11);
  }
  dispatch_block_t v18 = self;
  id v19 = Mutable;
  unsigned int v14 = Mutable;
  IDSTransportThreadAddBlock();
  objc_msgSend(v7, "setReply:", 1, _NSConcreteStackBlock, 3221225472, sub_100099490, &unk_100980D88, v18);
  CFDictionaryRef v15 = +[IDSDaemon sharedInstance];
  double v16 = [v7 localObject];
  id v17 = [v15 broadcasterForLocalObject:v16 messageContext:v7];

  [v17 emptyXPCReply];
}

- (void)unregisterPluginWithOptions:(id)a3 messageContext:(id)a4
{
  CFDictionaryRef v6 = (const __CFDictionary *)a3;
  id v7 = a4;
  Value = 0;
  if (v6 && IDSGroupSessionPluginNameKey) {
    Value = (void *)CFDictionaryGetValue(v6, IDSGroupSessionPluginNameKey);
  }
  id v9 = Value;
  id v10 = 0;
  if (v6 && IDSGroupSessionRawPublicKeyKey) {
    id v10 = (void *)CFDictionaryGetValue(v6, IDSGroupSessionRawPublicKeyKey);
  }
  id v11 = v10;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  id v13 = v9;
  if (v13)
  {
    CFDictionarySetValue(Mutable, IDSGlobalLinkOptionPluginNameKey, v13);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070C2E0();
  }

  CFDictionarySetValue(Mutable, IDSGlobalLinkOptionPluginOperationKey, &off_1009D0D38);
  if (v11) {
    CFDictionarySetValue(Mutable, IDSGlobalLinkOptionPluginRawPublicKeyKey, v11);
  }
  dispatch_block_t v18 = self;
  id v19 = Mutable;
  unsigned int v14 = Mutable;
  IDSTransportThreadAddBlock();
  objc_msgSend(v7, "setReply:", 1, _NSConcreteStackBlock, 3221225472, sub_10009975C, &unk_100980D88, v18);
  CFDictionaryRef v15 = +[IDSDaemon sharedInstance];
  double v16 = [v7 localObject];
  id v17 = [v15 broadcasterForLocalObject:v16 messageContext:v7];

  [v17 emptyXPCReply];
}

- (void)_sendingOfflineActiveParticipantInfoRequest:(id)a3
{
  id v4 = a3;
  long long v5 = (const void *)IDSGlobalLinkOptionSessionInfoRequestTypeKey;
  CFDictionaryRef v6 = [v4 objectForKey:IDSGlobalLinkOptionSessionInfoRequestTypeKey];
  id v7 = [v6 unsignedIntegerValue];

  id v8 = [(IDSDSession *)self qrAllocator];
  id v9 = [(IDSDSession *)self sharedState];
  id v10 = [v9 uniqueID];
  id v11 = [(IDSDSession *)self sharedState];
  int v12 = [v11 groupID];
  CFDictionaryRef v13 = [v8 getAllocateResponse:v10 groupID:v12];

  Value = 0;
  if (v13 && kIDSQRAllocateKey_RelaySessionID) {
    Value = (void *)CFDictionaryGetValue(v13, kIDSQRAllocateKey_RelaySessionID);
  }
  id v15 = Value;
  double v16 = 0;
  if (v13 && kIDSQRAllocateKey_GroupID) {
    double v16 = (void *)CFDictionaryGetValue(v13, kIDSQRAllocateKey_GroupID);
  }
  id v17 = v16;
  dispatch_block_t v18 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = [(IDSDSession *)self sharedState];
    id v20 = [v19 groupID];
    *(_DWORD *)buf = 138413058;
    uint64_t v38 = self;
    __int16 v39 = 2112;
    long long v40 = v20;
    __int16 v41 = 2112;
    id v42 = v17;
    __int16 v43 = 2112;
    id v44 = v15;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@: _sendingOfflineActiveParticipantInfoRequest for groupID %@ relayGroupID %@ relaySessionID %@", buf, 0x2Au);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v21 = [(IDSDSession *)self sharedState];
      double v34 = [v21 groupID];
      _IDSLogTransport();

      if (_IDSShouldLog())
      {
        long long v22 = [(IDSDSession *)self sharedState];
        id v35 = [v22 groupID];
        _IDSLogV();
      }
    }
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  id v24 = +[NSNumber numberWithInteger:v7];
  if (v24)
  {
    CFDictionarySetValue(Mutable, v5, v24);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070C14C();
  }

  long long v25 = [(IDSDSession *)self _getNewLinkOptionsForActiveParticipantInfoRequest];
  if (v25)
  {
    CFDictionarySetValue(Mutable, IDSGlobalLinkOptionNewLinkOptionsKey, v25);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070C0C4();
  }
  BOOL v26 = v13 != 0;

  CFDictionaryRef v27 = v13;
  if (v26)
  {
    CFDictionarySetValue(Mutable, IDSGlobalLinkOptionQRSessionInfoKey, v27);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070C368();
  }

  long long v28 = self->_metricsCollector;
  if (v28)
  {
    CFDictionarySetValue(Mutable, IDSGlobalLinkOptionMetricsCollectorKey, v28);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070C258();
  }

  id v29 = +[IDSGroupEncryptionController sharedInstance];
  id v30 = [v29 p2pNegotiatorProvider];

  if (v30)
  {
    CFDictionarySetValue(Mutable, IDSGlobalLinkOptionP2PNegotiatorKey, v30);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070C1D0();
  }

  uint64_t v36 = v15;
  __int16 v31 = Mutable;
  id v32 = v15;
  id v33 = v17;
  IDSTransportThreadAddBlock();
}

- (id)_createStreamSubscriptionRequest:(id)a3
{
  id v4 = a3;
  long long v5 = (const void *)IDSGlobalLinkOptionSessionInfoRequestTypeKey;
  CFDictionaryRef v6 = [v4 objectForKey:IDSGlobalLinkOptionSessionInfoRequestTypeKey];
  id v7 = [v6 unsignedIntegerValue];

  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  id v9 = +[NSNumber numberWithInteger:v7];
  if (v9)
  {
    CFDictionarySetValue(Mutable, v5, v9);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070C14C();
  }

  id v10 = self->_metricsCollector;
  if (v10)
  {
    CFDictionarySetValue(Mutable, IDSGlobalLinkOptionMetricsCollectorKey, v10);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070C258();
  }

  id v11 = +[IDSGroupEncryptionController sharedInstance];
  int v12 = [v11 p2pNegotiatorProvider];

  if (v12)
  {
    CFDictionarySetValue(Mutable, IDSGlobalLinkOptionP2PNegotiatorKey, v12);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070C1D0();
  }

  CFDictionaryRef v13 = [v4 objectForKeyedSubscript:IDSDataChannelLinkIDToQueryKey];
  if (!v13)
  {
    CFDictionaryRef v13 = [v4 objectForKeyedSubscript:IDSDataChannelLinkIDKey];
  }
  uint64_t v14 = IDSDataChannelPublishedStreamsKey;
  id v15 = [v4 objectForKeyedSubscript:IDSDataChannelPublishedStreamsKey];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_19;
  }
  [v4 objectForKeyedSubscript:v14];
  v17 = double v16 = v13;
  unsigned __int8 v18 = [v17 isEqualToString:IDSDataChannelNoStreamsKey];

  CFDictionaryRef v13 = v16;
  if ((v18 & 1) == 0)
  {
LABEL_19:
    id v19 = [v4 objectForKeyedSubscript:v14];
    goto LABEL_20;
  }
  id v19 = &__NSArray0__struct;
LABEL_20:
  id v20 = [v4 objectForKeyedSubscript:IDSDataChannelSubscribedStreamsKey];
  id v57 = +[NSMutableArray array];
  uint64_t v21 = IDSDataChannelAllParticipantsKey;
  long long v22 = [v20 objectForKeyedSubscript:IDSDataChannelAllParticipantsKey];

  if (v22)
  {
    id v23 = v19;
    id v24 = [v20 objectForKeyedSubscript:v21];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v25 = [v20 objectForKeyedSubscript:v21];
      unsigned int v26 = [v25 isEqualToString:IDSDataChannelAllStreamsKey];

      if (v26)
      {
        uint64_t v27 = 1;
LABEL_42:
        uint64_t v44 = +[IDSQRParticipantStreams streamWithParticipantID:0 streamArray:0 anyParticipant:1 anyStream:v27];
LABEL_45:
        [v57 addObject:v44];
        id v19 = v23;
        long long v28 = (void *)v44;
        goto LABEL_46;
      }
    }
    else
    {
    }
    __int16 v41 = [v20 objectForKeyedSubscript:v21];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v42 = [v20 objectForKeyedSubscript:v21];
      unsigned int v43 = [v42 isEqualToString:IDSDataChannelNoStreamsKey];

      if (v43)
      {
        uint64_t v27 = 0;
        goto LABEL_42;
      }
    }
    else
    {
    }
    double v45 = [v20 objectForKeyedSubscript:v21];
    uint64_t v44 = +[IDSQRParticipantStreams streamWithParticipantID:0 streamArray:v45 anyParticipant:1 anyStream:0];

    goto LABEL_45;
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v28 = [v20 allKeys];
  id v29 = [v28 countByEnumeratingWithState:&v58 objects:v62 count:16];
  if (!v29) {
    goto LABEL_46;
  }
  id v30 = v29;
  dispatch_queue_t v52 = v13;
  __int16 v53 = v19;
  uint64_t v54 = Mutable;
  id v55 = v4;
  uint64_t v31 = *(void *)v59;
  uint64_t v56 = IDSDataChannelAllStreamsKey;
  do
  {
    for (int i = 0; i != v30; int i = (char *)i + 1)
    {
      if (*(void *)v59 != v31) {
        objc_enumerationMutation(v28);
      }
      uint64_t v33 = *(void *)(*((void *)&v58 + 1) + 8 * i);
      double v34 = objc_msgSend(v20, "objectForKeyedSubscript:", v33, v52, v53, v54, v55);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v20 objectForKeyedSubscript:v33];
        v36 = id v35 = v28;
        unsigned int v37 = [v36 isEqualToString:v56];

        long long v28 = v35;
        if (v37)
        {
          id v38 = +[IDSQRParticipantStreams streamWithParticipantID:v33 streamArray:0 anyParticipant:0 anyStream:1];
          [v57 addObject:v38];
          goto LABEL_34;
        }
      }
      else
      {
      }
      __int16 v39 = [v20 objectForKeyedSubscript:v33];
      id v38 = [v39 mutableCopy];

      long long v40 = +[IDSQRParticipantStreams streamWithParticipantID:v33 streamArray:v38 anyParticipant:0 anyStream:0];
      [v57 addObject:v40];

LABEL_34:
    }
    id v30 = [v28 countByEnumeratingWithState:&v58 objects:v62 count:16];
  }
  while (v30);
  CFMutableDictionaryRef Mutable = v54;
  id v4 = v55;
  CFDictionaryRef v13 = v52;
  id v19 = v53;
LABEL_46:

  int v46 = [v4 objectForKeyedSubscript:IDSDataChannelLinkIDKey];
  if (v46)
  {
    CFDictionarySetValue(Mutable, IDSGlobalLinkOptionLinkIDKey, v46);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070C588();
  }

  id v47 = v13;
  if (v47)
  {
    CFDictionarySetValue(Mutable, IDSGlobalLinkOptionSessionInfoLinkIDToQueryKey, v47);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070C500();
  }

  id v48 = [v4 objectForKeyedSubscript:IDSDataChannelParticipantGenerationCounterKey];
  if (v48)
  {
    CFDictionarySetValue(Mutable, kIDSQRAllocateKey_StreamInfoGenerationCounter, v48);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070C478();
  }

  id v49 = v57;
  if (v49)
  {
    CFDictionarySetValue(Mutable, kIDSQRAllocateKey_StreamInfoSubscribedStreams, v49);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070C3F0();
  }

  if (v19) {
    CFDictionarySetValue(Mutable, kIDSQRAllocateKey_StreamInfoPublishedStreams, v19);
  }
  double v50 = [v4 objectForKeyedSubscript:IDSDataChannelMaxConcurrentStreamsKey];
  if (v50) {
    CFDictionarySetValue(Mutable, kIDSQRAllocateKey_StreamInfoMaxConcurrentStreams, v50);
  }

  return Mutable;
}

- (void)_sendStreamSubscriptionRequest:(id)a3
{
  id v4 = a3;
  long long v5 = [(IDSDSession *)self qrAllocator];
  CFDictionaryRef v6 = [(IDSDSession *)self sharedState];
  id v7 = [v6 uniqueID];
  id v8 = [(IDSDSession *)self sharedState];
  id v9 = [v8 groupID];
  CFDictionaryRef v10 = [v5 getAllocateResponse:v7 groupID:v9];

  Value = 0;
  if (v10 && kIDSQRAllocateKey_RelaySessionID) {
    Value = (void *)CFDictionaryGetValue(v10, kIDSQRAllocateKey_RelaySessionID);
  }
  id v12 = Value;
  CFDictionaryRef v13 = 0;
  if (v10 && kIDSQRAllocateKey_GroupID) {
    CFDictionaryRef v13 = (void *)CFDictionaryGetValue(v10, kIDSQRAllocateKey_GroupID);
  }
  id v14 = v13;
  [(IDSDSession *)self _createStreamSubscriptionRequest:v4];
  unsigned __int8 v18 = v14;
  id v20 = v19 = v12;
  id v15 = v20;
  id v16 = v12;
  id v17 = v14;
  IDSTransportThreadAddBlock();
}

- (id)_getNewLinkOptionsForActiveParticipantInfoRequest
{
  id v3 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  CFDictionarySetValue(v3, IDSSessionIsMultiwayKey, &__kCFBooleanTrue);
  id v4 = self;
  if (v4)
  {
    CFDictionarySetValue(v3, kIDSQRAllocateKey_AlternateDelegate, v4);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070CAD8();
  }

  os_unfair_lock_lock(&v4->_clientChannelLock);
  long long v5 = +[NSNumber numberWithUnsignedLongLong:[(IDSClientChannel *)v4->_clientChannel clientUniquePID]];
  if (v5)
  {
    CFDictionarySetValue(v3, kIDSQRAllocateKey_ClientUniquePID, v5);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070CA50();
  }

  os_unfair_lock_unlock(&v4->_clientChannelLock);
  CFDictionaryRef v6 = +[NSNumber numberWithBool:[(IDSDSession *)v4 disallowCellularInterface]];
  if (v6)
  {
    CFDictionarySetValue(v3, IDSGlobalLinkOptionDisallowCellularKey, v6);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070C9C8();
  }

  id v7 = +[NSNumber numberWithBool:[(IDSDSession *)v4 disallowWifiInterface]];
  if (v7)
  {
    CFDictionarySetValue(v3, IDSGlobalLinkOptionDisallowWiFiKey, v7);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070C940();
  }

  id v8 = [(IDSDSession *)v4 sharedState];
  id v9 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v8 clientType]);

  if (v9)
  {
    CFDictionarySetValue(v3, IDSGlobalLinkOptionClientTypeKey, v9);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070C8B8();
  }

  callType = v4->_callType;
  if (callType) {
    CFDictionarySetValue(v3, IDSGlobalLinkOptionCallTypeKey, callType);
  }
  id v11 = [(IDSDSession *)v4 sharedState];
  id v12 = [v11 clientUUID];

  if (v12) {
    CFDictionarySetValue(v3, kIDSQRAllocateKey_RelayClientUUID, v12);
  }

  CFDictionaryRef v13 = +[NSNumber numberWithBool:v4->_isLightweightParticipant];
  if (v13)
  {
    CFDictionarySetValue(v3, IDSGroupSessionIsLightweightParticipantKey, v13);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070C830();
  }

  id v14 = +[NSNumber numberWithBool:v4->_startedAsUPlusOneSession];
  if (v14)
  {
    CFDictionarySetValue(v3, IDSGroupSessionStartedAsUPlusOneKey, v14);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070C7A8();
  }

  id v15 = v4->_metricsCollector;
  if (v15)
  {
    CFDictionarySetValue(v3, IDSGlobalLinkOptionMetricsCollectorKey, v15);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070C720();
  }

  id v16 = +[IDSGroupEncryptionController sharedInstance];
  id v17 = [v16 p2pNegotiatorProvider];

  if (v17)
  {
    CFDictionarySetValue(v3, IDSGlobalLinkOptionP2PNegotiatorKey, v17);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070C698();
  }

  unsigned __int8 v18 = +[NSNumber numberWithBool:v4->_isAutoDisconnectSupportedForGFTService];
  if (v18)
  {
    CFDictionarySetValue(v3, IDSGlobalLinkOptionIsGFTServiceKey, v18);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070C610();
  }

  id v19 = +[NSNumber numberWithBool:v4->_forceTCPFallbackOnCell];
  if (v19) {
    CFDictionarySetValue(v3, IDSGroupSessionForceTCPFallbackOnCellKey, v19);
  }

  id v20 = +[NSNumber numberWithBool:v4->_forceTCPFallbackOnWiFi];
  if (v20) {
    CFDictionarySetValue(v3, IDSGroupSessionForceTCPFallbackOnWiFiKey, v20);
  }

  uint64_t v21 = +[NSNumber numberWithBool:v4->_disableP2PLinks];
  if (v21) {
    CFDictionarySetValue(v3, IDSGlobalLinkDisableP2PLinks, v21);
  }

  long long v22 = +[NSNumber numberWithBool:v4->_forceIPv6];
  if (v22) {
    CFDictionarySetValue(v3, IDSGlobalLinkOptionForceIPv6Key, v22);
  }

  id v23 = +[NSNumber numberWithBool:v4->_isShortMKIEnabled];
  if (v23) {
    CFDictionarySetValue(v3, IDSGroupSessionShortMKIEnabledKey, v23);
  }

  id v24 = +[NSNumber numberWithBool:v4->_isTLEEnabled];
  if (v24) {
    CFDictionarySetValue(v3, IDSGroupSessionTLEEnabledKey, v24);
  }

  long long v25 = +[IDSGroupEncryptionController sharedInstance];
  unsigned int v26 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v25 shouldUseGecko]);

  if (v26) {
    CFDictionarySetValue(v3, IDSGroupSessionGeckoEnabledKey, v26);
  }

  return v3;
}

- (void)didReceiveCurrentCellularSignalRaw:(int)a3 signalStrength:(int)a4 signalGrade:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  id v9 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v23 = self;
    LOWORD(v24[0]) = 1024;
    *(_DWORD *)((char *)v24 + 2) = v7;
    WORD3(v24[0]) = 1024;
    DWORD2(v24[0]) = v6;
    WORD6(v24[0]) = 1024;
    *(_DWORD *)((char *)v24 + 14) = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "<%@> didReceiveCurrentCellularSignalRaw:%d signalStrength:%d signalGrade:%d", buf, 0x1Eu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    uint64_t v20 = v6;
    uint64_t v21 = v5;
    unsigned __int8 v18 = self;
    uint64_t v19 = v7;
    _IDSLogV();
  }
  CFDictionaryRef v10 = [(IDSDSession *)self sharedState];
  if ([v10 useQRDirectly]) {
    goto LABEL_11;
  }
  id v11 = [(IDSDSession *)self sharedState];
  if ([v11 clientType] == (id)1)
  {
LABEL_10:

LABEL_11:
    goto LABEL_12;
  }
  id v12 = [(IDSDSession *)self sharedState];
  if ([v12 clientType] == (id)5)
  {

    goto LABEL_10;
  }
  id v15 = [(IDSDSession *)self sharedState];
  BOOL v16 = [v15 clientType] == (id)6;

  if (v16)
  {
LABEL_12:
    if ([(IDSClientChannel *)self->_clientChannel hasMetadata])
    {
      CFDictionaryRef v13 = malloc_type_malloc(0x1000uLL, 0x9B78BC79uLL);
      IDSByteBufferInitForWriteWithAllocatedSpace();
      int v25 = -1431655766;
      *(void *)&long long v14 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v24[1] = v14;
      v24[0] = v14;
      buf[0] = BYTE3(v7);
      buf[1] = BYTE2(v7);
      buf[2] = BYTE1(v7);
      buf[3] = v7;
      LOBYTE(v23) = BYTE3(v6);
      BYTE1(v23) = BYTE2(v6);
      BYTE2(v23) = BYTE1(v6);
      BYTE3(v23) = v6;
      BYTE4(v23) = BYTE3(v5);
      BYTE5(v23) = BYTE2(v5);
      BYTE6(v23) = BYTE1(v5);
      HIBYTE(v23) = v5;
      IDSByteBufferWriteField();
      [(IDSDSession *)self writeToClientChannel:self->_clientChannel packetBuffer:0 metaData:v13 metadataSize:0];
      IDSByteBufferRelease();
    }
    return;
  }
  id v17 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = self;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "<%@> need a client channel to get cellular signals", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
}

- (void)_sendLinkSelectionPreference:(id)a3 linkScore:(id)a4 ipPreference:(id)a5 uplinkNackDisabled:(id)a6
{
  CFDictionaryRef v10 = (IDSDSession *)a3;
  id v11 = a4;
  id v46 = a5;
  id v12 = a6;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  long long v14 = [(IDSDSession *)self sharedState];
  if ([v14 useQRDirectly]) {
    goto LABEL_6;
  }
  id v15 = [(IDSDSession *)self sharedState];
  if ([v15 clientType] == (id)1)
  {
LABEL_5:

LABEL_6:
    goto LABEL_7;
  }
  BOOL v16 = [(IDSDSession *)self sharedState];
  if ([v16 clientType] == (id)5)
  {

    goto LABEL_5;
  }
  __int16 v39 = [(IDSDSession *)self sharedState];
  id v40 = [v39 clientType];

  if (v40 == (id)6)
  {
LABEL_7:
    if (v10 && v11)
    {
      id v17 = (const char *)[(IDSDSession *)v10 unsignedCharValue];
      unsigned __int8 v18 = (__CFString *)[v11 unsignedCharValue];
      uint64_t v19 = +[NSNumber numberWithUnsignedChar:v17];
      if (v19)
      {
        CFDictionarySetValue(Mutable, IDSLinkSuggestionKey, v19);
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_10070CCF8();
      }

      uint64_t v21 = +[NSNumber numberWithUnsignedChar:v18];
      if (v21)
      {
        CFDictionarySetValue(Mutable, IDSLinkScoreKey, v21);
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_10070CC70();
      }

      long long v22 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = self;
        __int16 v51 = 1024;
        *(_DWORD *)dispatch_queue_t v52 = v17;
        *(_WORD *)&v52[4] = 1024;
        *(_DWORD *)&v52[6] = v18;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "<%@> _sendLinkSelectionPreference: linkSuggestion: %u, linkScore: %u", buf, 0x18u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          unsigned int v43 = (const char *)v17;
          double v45 = (__CFString *)v18;
          id v42 = self;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            unsigned int v43 = v17;
            double v45 = v18;
            id v42 = self;
            _IDSLogV();
          }
        }
      }
    }
    else
    {
      uint64_t v20 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v10;
        __int16 v51 = 2112;
        *(void *)dispatch_queue_t v52 = v11;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "No linkSuggestion: %@ or linkScore: %@", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          id v42 = v10;
          unsigned int v43 = (const char *)v11;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            id v42 = v10;
            unsigned int v43 = (const char *)v11;
            _IDSLogV();
          }
        }
      }
    }
    if (v46)
    {
      id v23 = (__CFString *)[v46 unsignedCharValue];
      id v24 = +[NSNumber numberWithUnsignedChar:v23];
      if (v24)
      {
        CFDictionarySetValue(Mutable, IDSLinkIPPreferenceKey, v24);
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_10070CBE8();
      }

      unsigned int v26 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = self;
        __int16 v51 = 2080;
        *(void *)dispatch_queue_t v52 = "-[IDSDSession _sendLinkSelectionPreference:linkScore:ipPreference:uplinkNackDisabled:]";
        *(_WORD *)&v52[8] = 1024;
        LODWORD(v53) = v23;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "<%@> %s: ipPreference: %u", buf, 0x1Cu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          unsigned int v43 = "-[IDSDSession _sendLinkSelectionPreference:linkScore:ipPreference:uplinkNackDisabled:]";
          double v45 = (__CFString *)v23;
          id v42 = self;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            unsigned int v43 = "-[IDSDSession _sendLinkSelectionPreference:linkScore:ipPreference:uplinkNackDisabled:]";
            double v45 = v23;
            id v42 = self;
            _IDSLogV();
          }
        }
      }
    }
    else
    {
      int v25 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = self;
        __int16 v51 = 2080;
        *(void *)dispatch_queue_t v52 = "-[IDSDSession _sendLinkSelectionPreference:linkScore:ipPreference:uplinkNackDisabled:]";
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "<%@> %s: ipPreferenceObj is nil.", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          id v42 = self;
          unsigned int v43 = "-[IDSDSession _sendLinkSelectionPreference:linkScore:ipPreference:uplinkNackDisabled:]";
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            id v42 = self;
            unsigned int v43 = "-[IDSDSession _sendLinkSelectionPreference:linkScore:ipPreference:uplinkNackDisabled:]";
            _IDSLogV();
          }
        }
      }
    }
    if (v12)
    {
      id v27 = [v12 BOOLValue];
      long long v28 = +[NSNumber numberWithBool:v27];
      if (v28)
      {
        CFDictionarySetValue(Mutable, IDSUplinkNackDisabledKey, v28);
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_10070CB60();
      }

      id v30 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v31 = @"NO";
        if (v27) {
          CFStringRef v31 = @"YES";
        }
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = self;
        __int16 v51 = 2080;
        *(void *)dispatch_queue_t v52 = "-[IDSDSession _sendLinkSelectionPreference:linkScore:ipPreference:uplinkNackDisabled:]";
        *(_WORD *)&v52[8] = 2112;
        CFStringRef v53 = v31;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "<%@> %s: uplinkNackDisabled: %@", buf, 0x20u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
      {
        id v32 = v27 ? @"YES" : @"NO";
        unsigned int v43 = "-[IDSDSession _sendLinkSelectionPreference:linkScore:ipPreference:uplinkNackDisabled:]";
        double v45 = v32;
        id v42 = self;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          unsigned int v43 = "-[IDSDSession _sendLinkSelectionPreference:linkScore:ipPreference:uplinkNackDisabled:]";
          double v45 = v32;
          id v42 = self;
          _IDSLogV();
        }
      }
    }
    else
    {
      id v29 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = self;
        __int16 v51 = 2080;
        *(void *)dispatch_queue_t v52 = "-[IDSDSession _sendLinkSelectionPreference:linkScore:ipPreference:uplinkNackDisabled:]";
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "<%@> %s: uplinkNackDisabledObj is nil.", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          id v42 = self;
          unsigned int v43 = "-[IDSDSession _sendLinkSelectionPreference:linkScore:ipPreference:uplinkNackDisabled:]";
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            id v42 = self;
            unsigned int v43 = "-[IDSDSession _sendLinkSelectionPreference:linkScore:ipPreference:uplinkNackDisabled:]";
            _IDSLogV();
          }
        }
      }
    }
    if ([(__CFDictionary *)Mutable count])
    {
      id v49 = 0;
      uint64_t v33 = +[NSKeyedArchiver archivedDataWithRootObject:Mutable requiringSecureCoding:0 error:&v49];
      double v34 = (__CFString *)v49;
      if (v34)
      {
        id v35 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v36 = [(IDSDSession *)self sharedState];
          unsigned int v37 = [v36 groupID];
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = self;
          __int16 v51 = 2112;
          *(void *)dispatch_queue_t v52 = v37;
          *(_WORD *)&v52[8] = 2112;
          CFStringRef v53 = v34;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "<%@> _sendLinkSelectionPreference failed to encode linkSelectionEvents for group %@ (error: %@)", buf, 0x20u);
        }
        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          id v38 = [(IDSDSession *)self sharedState];
          uint64_t v44 = [v38 groupID];
          _IDSLogV();
        }
      }
      else
      {
        *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
        objc_initWeak((id *)buf, self->_clientChannel);
        objc_copyWeak(&v48, (id *)buf);
        id v47 = v33;
        IDSTransportThreadAddBlock();

        objc_destroyWeak(&v48);
        objc_destroyWeak((id *)buf);
      }
    }
    goto LABEL_77;
  }
  __int16 v41 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = self;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "<%@> need a client channel to send the event kClientChannelMetadataType_LinkSuggestion", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
LABEL_77:
}

- (void)updateRelevantEncryptedDataBlob
{
  id v3 = [(IDSGroupStatusNotificationParameters *)self->_groupStatusNotificationParams participantInfo];

  if (v3)
  {
    id v4 = [(IDSGroupStatusNotificationParameters *)self->_groupStatusNotificationParams participantInfo];
    uint64_t v5 = [(IDSDSession *)self formAndEncryptDataBlob:v4 type:12];

    os_unfair_lock_lock(&self->_lock);
    encryptedDataBlob = self->_encryptedDataBlob;
    self->_encryptedDataBlob = v5;

    os_unfair_lock_unlock(&self->_lock);
  }
  uint64_t v7 = [(IDSGroupStatusNotificationParameters *)self->_groupStatusNotificationParams participantMirageHandshakeBlob];

  if (v7)
  {
    id v8 = [(IDSGroupStatusNotificationParameters *)self->_groupStatusNotificationParams participantMirageHandshakeBlob];
    id v9 = [(IDSDSession *)self formAndEncryptDataBlob:v8 type:6];

    os_unfair_lock_lock(&self->_lock);
    encryptedMirageHandshakeBlob = self->_encryptedMirageHandshakeBlob;
    self->_encryptedMirageHandshakeBlob = v9;

    os_unfair_lock_unlock(&self->_lock);
  }
  id v15 = +[IDSGroupEncryptionController sharedInstance];
  id v11 = [(IDSDSession *)self sharedState];
  id v12 = [v11 groupID];
  CFDictionaryRef v13 = [(IDSDSession *)self sharedState];
  long long v14 = [v13 uniqueID];
  [v15 updateServerDesiredKeyMaterialsForGroup:v12 sessionID:v14];
}

- (id)getEncryptedDataBlob
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_encryptedDataBlob;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (id)getEncryptedMirageHandshakeBlob
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_encryptedMirageHandshakeBlob;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (id)formAndEncryptDataBlob:(id)a3 type:(int)a4
{
  id v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (v6)
  {
    cryptorForBlobs = self->_cryptorForBlobs;
    id v17 = 0;
    id v9 = [(IDSGroupSessionDataCryptor *)cryptorForBlobs encryptData:v6 sequenceNumber:0 error:&v17];
    id v10 = v17;
    if (v10)
    {
      id v11 = +[IDSFoundationLog IDSDSession];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10070CD80();
      }

      os_unfair_lock_unlock(&self->_lock);
      id v12 = 0;
    }
    else
    {
      v28[0] = 0xAAAAAAAAAAAAAAAALL;
      v28[1] = 0xAAAAAAAAAAAAAAAALL;
      long long v14 = [(IDSGroupSessionDataCryptor *)self->_cryptorForBlobs getEncryptionKeyID];
      os_unfair_lock_unlock(p_lock);
      [v14 getUUIDBytes:v28];
      id v12 = +[NSMutableData dataWithBytes:v28 length:16];
      [v12 appendData:v9];
      id v15 = +[IDSFoundationLog IDSDSession];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67110146;
        int v19 = a4;
        __int16 v20 = 2112;
        uint64_t v21 = v9;
        __int16 v22 = 2112;
        id v23 = v6;
        __int16 v24 = 2112;
        int v25 = v14;
        __int16 v26 = 2112;
        id v27 = v12;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "type: %d, encrypted blob: %@ plain blob: %@, localSKI: %@, encryptedData: %@", buf, 0x30u);
      }
    }
  }
  else
  {
    CFDictionaryRef v13 = +[IDSFoundationLog IDSDSession];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "formAndEncryptDataBlob: no valid plainDataBlob", buf, 2u);
    }

    os_unfair_lock_unlock(&self->_lock);
    id v12 = 0;
  }

  return v12;
}

- (void)connectQRServer:(id)a3 withPreferredLocalInterface:(int)a4
{
  CFDictionaryRef v6 = (const __CFDictionary *)a3;
  CFDictionaryRef theDict = v6;
  if (v6)
  {
    CFDictionaryRef v7 = v6;
    unsigned int v179 = a4;
    [(IDSGFTMetricsCollector *)self->_metricsCollector connectQRServer];
    CFMutableDictionaryRef v186 = (CFMutableDictionaryRef)[(__CFDictionary *)v7 mutableCopy];
    int v184 = [(__CFDictionary *)v186 objectForKey:kIDSQRAllocateKey_LinkSuggestion];
    v183 = [(__CFDictionary *)v186 objectForKey:kIDSQRAllocateKey_LinkScore];
    v182 = [(__CFDictionary *)v186 objectForKey:kIDSQRAllocateKey_RelayIPPreference];
    v181 = [(__CFDictionary *)v186 objectForKey:kIDSQRAllocateKey_UplinkNackDisabled];
    [(IDSDSession *)self _sendLinkSelectionPreference:v184 linkScore:v183 ipPreference:v182 uplinkNackDisabled:v181];
    uint64_t v8 = kIDSQRAllocateKey_AllocateType;
    id v9 = [(__CFDictionary *)v186 objectForKey:kIDSQRAllocateKey_AllocateType];
    unsigned int v10 = [v9 intValue];

    if (v10 != 3)
    {
      BOOL v178 = 0;
      id v17 = [(__CFDictionary *)v186 objectForKeyedSubscript:v8];
      unsigned int v18 = [v17 intValue];
      if (v18 == 2)
      {
        int v19 = [(IDSDSession *)self sharedState];
        uint64_t v20 = (uint64_t)[v19 sharedSession];
      }
      else
      {
        uint64_t v20 = 0;
      }

      goto LABEL_23;
    }
    if (self->_groupSessionState == 2)
    {
      id v11 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [(IDSDSession *)self sharedState];
        CFDictionaryRef v13 = [v12 groupID];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v13;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "User already left group %@; don't connect",
          buf,
          0xCu);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          long long v14 = [(IDSDSession *)self sharedState];
          v170 = [v14 groupID];
          _IDSLogTransport();

          if (_IDSShouldLog())
          {
            id v15 = [(IDSDSession *)self sharedState];
            v171 = [v15 groupID];
            _IDSLogV();
          }
        }
      }
      goto LABEL_241;
    }
    if (kIDSQRAllocateKey_RecipientID) {
      Value = CFDictionaryGetValue(theDict, kIDSQRAllocateKey_RecipientID);
    }
    else {
      Value = 0;
    }
    [(IDSGroupStatusNotificationParameters *)self->_groupStatusNotificationParams setParticipantID:Value];
    BOOL v178 = v10 == 3;
    if (kIDSQRAllocateKey_RelaySessionID) {
      int v88 = CFDictionaryGetValue(theDict, kIDSQRAllocateKey_RelaySessionID);
    }
    else {
      int v88 = 0;
    }
    [(IDSGroupStatusNotificationParameters *)self->_groupStatusNotificationParams setRelaySessionID:v88];
    int v89 = [(IDSGroupStatusNotificationParameters *)self->_groupStatusNotificationParams participantID];
    if (v89)
    {
      v90 = [(IDSGroupStatusNotificationParameters *)self->_groupStatusNotificationParams relaySessionID];
      if (v90)
      {
        v91 = [(IDSGroupStatusNotificationParameters *)self->_groupStatusNotificationParams participantData];

        if (v91)
        {
          v92 = +[IDSGroupEncryptionController sharedInstance];
          v93 = [(IDSDSession *)self sharedState];
          CFStringRef v94 = [v93 groupID];
          CFStringRef v95 = [(IDSDSession *)self sharedState];
          id v96 = [v95 uniqueID];
          [v92 updateServerDesiredKeyMaterialsForGroup:v94 sessionID:v96];

          v97 = +[IDSGroupEncryptionController sharedInstance];
          LODWORD(v93) = [v97 shouldUseGecko];

          if (v93)
          {
            v98 = [(IDSGroupDefaultRootMaterialExchangeController *)self->_exchangeController quicMaterialExchangeProvider];
            if (v98)
            {
              CFDictionarySetValue(v186, IDSGroupSessionQUICExchangeProviderKey, v98);
            }
            else
            {
              id v167 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                sub_10070DAA8();
              }
            }
          }
          else
          {
            os_unfair_lock_lock(&self->_lock);
            v164 = self->_serverDesiredKeyMaterialsFromGroupEncryptionController;
            if (v164)
            {
              CFDictionarySetValue(v186, IDSGroupSessionInitialMaterialsKey, v164);
            }
            else
            {
              id v165 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                sub_10070DBB8();
              }
            }
            id v166 = [self->_serverDesiredKeyMaterialsSigner copy];
            if (v166)
            {
              CFDictionarySetValue(v186, IDSGroupSessionInitialMaterialsSignerKey, v166);
            }
            else
            {
              id v168 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                sub_10070DB30();
              }
            }
            os_unfair_lock_unlock(&self->_lock);
          }
          uint64_t v20 = 1;
LABEL_23:
          __int16 v22 = [(IDSDSession *)self sharedState];
          id v23 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v22 clientType]);

          if (v23)
          {
            CFDictionarySetValue(v186, IDSGlobalLinkOptionClientTypeKey, v23);
          }
          else
          {
            id v24 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_10070DA20();
            }
          }
          int v25 = +[NSNumber numberWithUnsignedInteger:self->_preferredAddressFamily];
          if (v25)
          {
            CFDictionarySetValue(v186, IDSGlobalLinkOptionPreferredAddressFamilyKey, v25);
          }
          else
          {
            id v26 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_10070D998();
            }
          }
          id v27 = +[NSNumber numberWithBool:self->_disallowCellularInterface];
          if (v27)
          {
            CFDictionarySetValue(v186, IDSGlobalLinkOptionDisallowCellularKey, v27);
          }
          else
          {
            id v28 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_10070D910();
            }
          }
          id v29 = +[NSNumber numberWithBool:self->_disallowWifiInterface];
          if (v29)
          {
            CFDictionarySetValue(v186, IDSGlobalLinkOptionDisallowWiFiKey, v29);
          }
          else
          {
            id v30 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_10070D888();
            }
          }
          CFStringRef v31 = +[NSNumber numberWithBool:self->_preferCellularForCallSetup];
          if (v31)
          {
            CFDictionarySetValue(v186, IDSGlobalLinkOptionPreferCellularForCallSetupKey, v31);
          }
          else
          {
            id v32 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_10070D800();
            }
          }
          uint64_t v33 = [(IDSDSession *)self sharedState];
          double v34 = [v33 clientUUID];

          if (v34)
          {
            CFDictionarySetValue(v186, kIDSQRAllocateKey_RelayClientUUID, v34);
          }
          else
          {
            id v35 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_10070D778();
            }
          }
          uint64_t v36 = +[NSNumber numberWithBool:v20];
          if (v36)
          {
            CFDictionarySetValue(v186, IDSSessionIsMultiwayKey, v36);
          }
          else
          {
            id v37 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_10070D6F0();
            }
          }
          id v38 = +[NSNumber numberWithBool:self->_isLightweightParticipant];
          if (v38)
          {
            CFDictionarySetValue(v186, IDSGroupSessionIsLightweightParticipantKey, v38);
          }
          else
          {
            id v39 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_10070D668();
            }
          }
          id v40 = +[NSNumber numberWithBool:self->_startedAsUPlusOneSession];
          if (v40)
          {
            CFDictionarySetValue(v186, IDSGroupSessionStartedAsUPlusOneKey, v40);
          }
          else
          {
            id v41 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_10070D5E0();
            }
          }
          id v42 = +[NSNumber numberWithBool:self->_isAutoDisconnectSupportedForGFTService];
          if (v42)
          {
            CFDictionarySetValue(v186, IDSGlobalLinkOptionIsGFTServiceKey, v42);
          }
          else
          {
            id v43 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_10070D558();
            }
          }
          uint64_t v44 = +[NSNumber numberWithBool:self->_forceTCPFallbackOnCell];
          if (v44) {
            CFDictionarySetValue(v186, IDSGroupSessionForceTCPFallbackOnCellKey, v44);
          }

          double v45 = +[NSNumber numberWithBool:self->_forceTCPFallbackOnWiFi];
          if (v45) {
            CFDictionarySetValue(v186, IDSGroupSessionForceTCPFallbackOnWiFiKey, v45);
          }

          id v46 = +[NSNumber numberWithBool:self->_sessionIsNonUserParticipantInitiated];
          if (v46)
          {
            CFDictionarySetValue(v186, IDSGlobalLinkOptionSessionIsNonUserParticipantInitiated, v46);
          }
          else
          {
            id v47 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_10070D4D0();
            }
          }
          id v48 = +[NSNumber numberWithBool:self->_handOffOverQREnabled];
          if (v48)
          {
            CFDictionarySetValue(v186, IDSGlobalLinkOptionSessionHandOffOverQREnabled, v48);
          }
          else
          {
            id v49 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_10070D448();
            }
          }
          double v50 = +[NSNumber numberWithUnsignedChar:self->_cellularSlicingFlags];
          if (v50)
          {
            CFDictionarySetValue(v186, IDSGlobalLinkOptionSessionCellularSlicingFlags, v50);
          }
          else
          {
            id v51 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_10070D3C0();
            }
          }
          dispatch_queue_t v52 = +[NSNumber numberWithBool:self->_disableP2PLinks];
          if (v52) {
            CFDictionarySetValue(v186, IDSGlobalLinkDisableP2PLinks, v52);
          }

          CFStringRef v53 = +[NSNumber numberWithBool:self->_forceIPv6];
          if (v53) {
            CFDictionarySetValue(v186, IDSGlobalLinkOptionForceIPv6Key, v53);
          }

          uint64_t v54 = +[NSNumber numberWithBool:self->_isShortMKIEnabled];
          if (v54) {
            CFDictionarySetValue(v186, IDSGroupSessionShortMKIEnabledKey, v54);
          }

          id v55 = +[NSNumber numberWithBool:self->_isTLEEnabled];
          if (v55) {
            CFDictionarySetValue(v186, IDSGroupSessionTLEEnabledKey, v55);
          }

          uint64_t v56 = +[IDSGroupEncryptionController sharedInstance];
          id v57 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v56 shouldUseGecko]);

          if (v57) {
            CFDictionarySetValue(v186, IDSGroupSessionGeckoEnabledKey, v57);
          }

          long long v58 = self->_callType;
          if (v58) {
            CFDictionarySetValue(v186, IDSGlobalLinkOptionCallTypeKey, v58);
          }

          long long v59 = [(IDSGroupStatusNotificationParameters *)self->_groupStatusNotificationParams participantInfo];
          BOOL v60 = [v59 length] == 0;

          if (!v60)
          {
            long long v61 = [(IDSGroupStatusNotificationParameters *)self->_groupStatusNotificationParams participantInfo];
            if (v61)
            {
              CFDictionarySetValue(v186, IDSGroupSessionParticipantDataKey, v61);
            }
            else
            {
              id v62 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                sub_10070D338();
              }
            }
          }
          id v63 = [(IDSDSession *)self sharedState];
          if (([v63 useQRDirectly] & 1) == 0)
          {
            id v64 = [(IDSDSession *)self sharedState];
            if ([v64 clientType] != (id)1)
            {
              v65 = [(IDSDSession *)self sharedState];
              if ([v65 clientType] != (id)5)
              {
                BOOL v99 = v10 == 3;
                unsigned __int8 v100 = [(IDSDSession *)self sharedState];
                if ([v100 clientType] == (id)6) {
                  BOOL v99 = 1;
                }

                if (!v99)
                {
LABEL_123:
                  v70 = +[NSNumber numberWithInteger:self->_linkProtocol];
                  if (v70)
                  {
                    CFDictionarySetValue(v186, kIDSQRAllocateKey_RelayLinkProtocol, v70);
                  }
                  else
                  {
                    id v71 = &_os_log_default;
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                      sub_10070D228();
                    }
                  }
                  if (self->_linkProtocol != 2)
                  {
                    long long v72 = +[NSNumber numberWithUnsignedShort:self->_relayPort];
                    if (v72)
                    {
                      CFDictionarySetValue(v186, kIDSQRAllocateKey_RelayPort, v72);
                    }
                    else
                    {
                      id v73 = &_os_log_default;
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                        sub_10070D1A0();
                      }
                    }
                  }
                  long long v74 = [(IDSDSession *)self sharedState];
                  unsigned int v180 = [v74 isInitiator];

                  if (v10 == 3)
                  {
                    if (!self->_startedAsUPlusOneSession)
                    {
LABEL_198:
                      [(IDSGFTMetricsCollector *)self->_metricsCollector setIsInitiator:v180];
                      v123 = self->_metricsCollector;
                      if (v123)
                      {
                        CFDictionarySetValue(v186, IDSGlobalLinkOptionMetricsCollectorKey, v123);
                      }
                      else
                      {
                        id v124 = &_os_log_default;
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                          sub_10070CEF8();
                        }
                      }
                      CFStringRef v125 = +[IDSGroupEncryptionController sharedInstance];
                      v126 = [v125 p2pNegotiatorProvider];

                      if (v126)
                      {
                        CFDictionarySetValue(v186, IDSGlobalLinkOptionP2PNegotiatorKey, v126);
                      }
                      else
                      {
                        id v127 = &_os_log_default;
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                          sub_10070CE70();
                        }
                      }
                      os_unfair_lock_lock(&self->_clientChannelLock);
                      v128 = +[NSNumber numberWithUnsignedLongLong:[(IDSClientChannel *)self->_clientChannel clientUniquePID]];
                      if (v128)
                      {
                        CFDictionarySetValue(v186, kIDSQRAllocateKey_ClientUniquePID, v128);
                      }
                      else
                      {
                        id v129 = &_os_log_default;
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                          sub_10070CDE8();
                        }
                      }
                      os_unfair_lock_unlock(&self->_clientChannelLock);
                      v130 = OSLogHandleForTransportCategory();
                      if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
                      {
                        unsigned int v131 = v10;
                        v132 = [(IDSDSession *)self sharedState];
                        int v133 = [v132 uniqueID];
                        CFStringRef v134 = @"YES";
                        if (v10 == 3) {
                          CFStringRef v135 = @"YES";
                        }
                        else {
                          CFStringRef v135 = @"NO";
                        }
                        if (v180) {
                          CFStringRef v136 = @"YES";
                        }
                        else {
                          CFStringRef v136 = @"NO";
                        }
                        dispatch_block_t v137 = [(IDSDSession *)self sharedState];
                        if (![v137 isScreenSharingSession]) {
                          CFStringRef v134 = @"NO";
                        }
                        v138 = [(IDSDSession *)self sharedState];
                        *(_DWORD *)buf = 138413314;
                        *(void *)&uint8_t buf[4] = v133;
                        __int16 v194 = 2112;
                        uint64_t v195 = (void *)v135;
                        __int16 v196 = 2112;
                        CFStringRef v197 = v136;
                        __int16 v198 = 2112;
                        CFStringRef v199 = v134;
                        __int16 v200 = 1024;
                        LODWORD(v201) = [v138 clientType];
                        _os_log_impl((void *)&_mh_execute_header, v130, OS_LOG_TYPE_DEFAULT, "Connect to QR server for %@. (sharedSession:%@, isInitiator:%@, isLegacy:%@, clientType:%d)", buf, 0x30u);

                        unsigned int v10 = v131;
                      }

                      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
                      {
                        uint64_t v139 = [(IDSDSession *)self sharedState];
                        v140 = [v139 uniqueID];
                        CFStringRef v141 = @"NO";
                        v142 = v10 == 3 ? @"YES" : @"NO";
                        int v143 = v180 ? @"YES" : @"NO";
                        CFStringRef v144 = [(IDSDSession *)self sharedState];
                        v145 = [v144 isScreenSharingSession] ? @"YES" : @"NO";
                        v146 = [(IDSDSession *)self sharedState];
                        unsigned int v174 = v145;
                        id v175 = [v146 clientType];
                        v172 = v142;
                        id v173 = v143;
                        unsigned int v169 = v140;
                        _IDSLogTransport();

                        if (_IDSShouldLog())
                        {
                          v147 = [(IDSDSession *)self sharedState];
                          uint64_t v148 = [v147 uniqueID];
                          CFStringRef v149 = [(IDSDSession *)self sharedState];
                          if ([v149 isScreenSharingSession]) {
                            CFStringRef v141 = @"YES";
                          }
                          v150 = [(IDSDSession *)self sharedState];
                          unsigned int v174 = (__CFString *)v141;
                          id v175 = [v150 clientType];
                          v172 = v142;
                          id v173 = v143;
                          unsigned int v169 = v148;
                          _IDSLogV();
                        }
                      }
                      v151 = [(IDSDSession *)self qrAllocator];
                      CFStringRef v152 = [(IDSDSession *)self sharedState];
                      CFStringRef v153 = [v152 uniqueID];
                      id v154 = [v151 getLocalParticipantIDForRelaySessionID:v153];

                      v155 = +[IDSGroupEncryptionController sharedInstance];
                      v156 = [(IDSDSession *)self sharedState];
                      v157 = [v156 uniqueID];
                      v158 = [(IDSDSession *)self sharedState];
                      CFStringRef v159 = [v158 uniqueID];
                      id v160 = [v155 setLocalParticipantID:v154 forGroupID:v157 sessionID:v159];

                      if (v160 == (id)2) {
                        [(IDSGFTMetricsCollector *)self->_metricsCollector participantIdChanged];
                      }
                      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
                      objc_initWeak((id *)buf, self);
                      v161 = [(IDSDSession *)self utunController];
                      v162 = [(IDSDSession *)self sharedState];
                      v163 = [v162 uniqueID];
                      v187[0] = _NSConcreteStackBlock;
                      v187[1] = 3221225472;
                      v187[2] = sub_10009DDE4;
                      v187[3] = &unk_100981050;
                      objc_copyWeak(&v190, (id *)buf);
                      v188 = v186;
                      CFStringRef v189 = self;
                      char v191 = v180;
                      BOOL v192 = v178;
                      [v161 connectGlobalLinkForDevice:v163 sessionInfo:v188 connectReadyHandler:v187 withLocalInterfacePreference:v179];

                      objc_destroyWeak(&v190);
                      objc_destroyWeak((id *)buf);
LABEL_241:

                      goto LABEL_242;
                    }
                    id v75 = 0;
                    if (v186 && kIDSQRAllocateKey_isInitiator) {
                      id v75 = (void *)CFDictionaryGetValue(v186, kIDSQRAllocateKey_isInitiator);
                    }
                    if ([v75 BOOLValue])
                    {
                      if (qword_100A4A5D0 != -1) {
                        dispatch_once(&qword_100A4A5D0, &stru_100981748);
                      }
                      uint64_t v76 = mach_continuous_time();
                      double v77 = *(double *)&qword_100A4A5D8;
                      __int16 v78 = [(IDSDSession *)self sharedState];
                      [v78 setInviteSentTime:v77 * (double)v76];

                      __int16 v79 = [(IDSDSession *)self sharedState];
                      [v79 inviteSentTime];
                      __int16 v80 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

                      if (v80) {
                        goto LABEL_144;
                      }
                      id v122 = &_os_log_default;
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                        sub_10070CF80();
                      }
                      goto LABEL_195;
                    }
                    __int16 v80 = +[NSNumber numberWithDouble:self->_inviteRecvTime];
                    if (v80)
                    {
LABEL_159:
                      CFDictionarySetValue(v186, IDSGlobalLinkOptionInviteRecvTimeKey, v80);
LABEL_192:
                      unsigned int v180 = 0;
LABEL_197:

                      goto LABEL_198;
                    }
                    id v121 = &_os_log_default;
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                      sub_10070D008();
                    }
                  }
                  else
                  {
                    id v81 = [(IDSDSession *)self sharedState];
                    __int16 v82 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v81 enableSKE]);

                    if (v82)
                    {
                      CFDictionarySetValue(v186, IDSGlobalLinkOptionEnableSKEKey, v82);
                    }
                    else
                    {
                      id v83 = &_os_log_default;
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                        sub_10070D118();
                      }
                    }
                    uint64_t v84 = [(IDSDSession *)self sharedState];
                    double v85 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v84 useSecureQRControlMessage]);

                    if (v85)
                    {
                      CFDictionarySetValue(v186, IDSGlobalLinkOptionUseSecureControlMessageKey, v85);
                    }
                    else
                    {
                      id v86 = &_os_log_default;
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                        sub_10070D090();
                      }
                    }
                    if (v180)
                    {
                      v87 = [(IDSDSession *)self sharedState];
                      [v87 inviteSentTime];
                      __int16 v80 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

                      if (v80)
                      {
LABEL_144:
                        CFDictionarySetValue(v186, IDSGlobalLinkOptionInviteSentTimeKey, v80);
LABEL_196:
                        unsigned int v180 = 1;
                        goto LABEL_197;
                      }
                      id v120 = &_os_log_default;
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                        sub_10070CF80();
                      }
LABEL_195:

                      goto LABEL_196;
                    }
                    __int16 v80 = +[NSNumber numberWithDouble:self->_inviteRecvTime];
                    if (v80) {
                      goto LABEL_159;
                    }
                    id v119 = &_os_log_default;
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                      sub_10070D008();
                    }
                  }

                  goto LABEL_192;
                }
LABEL_117:
                CFStringRef v66 = self;
                CFDictionarySetValue(v186, kIDSQRAllocateKey_AlternateDelegate, v66);

                p_clientChannelLock = &v66->_clientChannelLock;
                os_unfair_lock_lock(&v66->_clientChannelLock);
                id v68 = +[NSNumber numberWithUnsignedLongLong:[(IDSClientChannel *)v66->_clientChannel clientUniquePID]];
                if (v68)
                {
                  CFDictionarySetValue(v186, kIDSQRAllocateKey_ClientUniquePID, v68);
                }
                else
                {
                  id v69 = &_os_log_default;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                    sub_10070D2B0();
                  }
                }
                os_unfair_lock_unlock(p_clientChannelLock);
                goto LABEL_123;
              }
            }
          }

          goto LABEL_117;
        }
      }
      else
      {
      }
    }
    v101 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v102 = [(IDSDSession *)self sharedState];
      uint64_t v103 = [v102 groupID];
      groupStatusNotificationParams = self->_groupStatusNotificationParams;
      uint64_t v105 = [(IDSGroupStatusNotificationParameters *)groupStatusNotificationParams participantID];
      v106 = [(IDSGroupStatusNotificationParameters *)self->_groupStatusNotificationParams relaySessionID];
      BOOL v107 = [(IDSGroupStatusNotificationParameters *)self->_groupStatusNotificationParams participantData];
      *(_DWORD *)buf = 138413314;
      *(void *)&uint8_t buf[4] = v103;
      __int16 v194 = 2048;
      uint64_t v195 = groupStatusNotificationParams;
      __int16 v196 = 2112;
      CFStringRef v197 = v105;
      __int16 v198 = 2112;
      CFStringRef v199 = v106;
      __int16 v200 = 2112;
      v201 = v107;
      _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "connectQRServer for group %@ failed due to missing (params %p, participantID %@, relaySessionID %@, participantData %@)", buf, 0x34u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        v108 = [(IDSDSession *)self sharedState];
        v109 = [v108 groupID];
        v110 = self->_groupStatusNotificationParams;
        v111 = [(IDSGroupStatusNotificationParameters *)v110 participantID];
        v112 = [(IDSGroupStatusNotificationParameters *)self->_groupStatusNotificationParams relaySessionID];
        v176 = [(IDSGroupStatusNotificationParameters *)self->_groupStatusNotificationParams participantData];
        _IDSLogTransport();

        if (_IDSShouldLog())
        {
          uint64_t v113 = [(IDSDSession *)self sharedState];
          v114 = [v113 groupID];
          uint64_t v116 = self->_groupStatusNotificationParams;
          p_groupStatusNotificationParams = &self->_groupStatusNotificationParams;
          id v117 = [(IDSGroupStatusNotificationParameters *)v116 participantID];
          v118 = [(IDSGroupStatusNotificationParameters *)*p_groupStatusNotificationParams relaySessionID];
          v177 = [(IDSGroupStatusNotificationParameters *)*p_groupStatusNotificationParams participantData];
          _IDSLogV();
        }
      }
    }
    goto LABEL_241;
  }
  BOOL v16 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "connectQRServer failed due to invalid parameter.", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
LABEL_242:
}

- (void)_noteJoinNotificationWillSend
{
  if (self->_joinSendStartTime == 0.0)
  {
    if (qword_100A4A5D0 != -1) {
      dispatch_once(&qword_100A4A5D0, &stru_100981748);
    }
    self->_joinSendStartTime = *(double *)&qword_100A4A5D8 * (double)mach_continuous_time();
  }
  [(IDSDSession *)self _serverSpecifiedJoinNotificationDeliveryTimeout];
  double v4 = v3;
  uint64_t v5 = [(IDSDSession *)self sharedState];
  CFDictionaryRef v6 = [v5 destinations];
  id v7 = [v6 count];

  if (v7 && v4 > 2.22044605e-16)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    block = _NSConcreteStackBlock;
    uint64_t v42 = 3221225472;
    id v43 = sub_10009FF4C;
    uint64_t v44 = &unk_100981000;
    objc_copyWeak(&v45, &location);
    dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    id joinNotificationDeliveryTimeoutBlock = self->_joinNotificationDeliveryTimeoutBlock;
    self->_id joinNotificationDeliveryTimeoutBlock = v8;

    unsigned int v10 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [(IDSDSession *)self sharedState];
      id v12 = [v11 groupID];
      id v13 = objc_retainBlock(self->_joinNotificationDeliveryTimeoutBlock);
      long long v14 = [(IDSDSession *)self sharedState];
      id v15 = [v14 destinations];
      *(_DWORD *)buf = 138413058;
      id v48 = v12;
      __int16 v49 = 2048;
      double v50 = v4;
      __int16 v51 = 2112;
      id v52 = v13;
      __int16 v53 = 2112;
      uint64_t v54 = v15;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Starting timeout block for reliable join notification delivery { groupID: %@, timeout: %f, timeoutBlock: %@ destinations: %@ }", buf, 0x2Au);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        BOOL v16 = [(IDSDSession *)self sharedState];
        id v17 = [v16 groupID];
        id v18 = objc_retainBlock(self->_joinNotificationDeliveryTimeoutBlock);
        int v19 = [(IDSDSession *)self sharedState];
        [v19 destinations];
        v40 = id v39 = v18;
        double v38 = v4;
        id v37 = v17;
        _IDSLogTransport();

        if (_IDSShouldLog())
        {
          uint64_t v20 = [(IDSDSession *)self sharedState];
          uint64_t v21 = [v20 groupID];
          id v22 = objc_retainBlock(self->_joinNotificationDeliveryTimeoutBlock);
          id v23 = [(IDSDSession *)self sharedState];
          [v23 destinations];
          v40 = id v39 = v22;
          double v38 = v4;
          id v37 = v21;
          _IDSLogV();
        }
      }
    }
    dispatch_time_t v24 = dispatch_walltime(0, (uint64_t)(v4 * 1000000000.0));
    int v25 = im_primary_queue();
    dispatch_after(v24, v25, self->_joinNotificationDeliveryTimeoutBlock);

    objc_destroyWeak(&v45);
    objc_destroyWeak(&location);
  }
  else
  {
    id v26 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      id v27 = [(IDSDSession *)self sharedState];
      id v28 = [v27 groupID];
      id v29 = [(IDSDSession *)self sharedState];
      id v30 = [v29 destinations];
      *(_DWORD *)buf = 138412802;
      id v48 = v28;
      __int16 v49 = 2048;
      double v50 = v4;
      __int16 v51 = 2112;
      id v52 = v30;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Not starting timeout block for reliable join notification delivery { groupID: %@, timeout: %f, destinations: %@ }", buf, 0x20u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        CFStringRef v31 = [(IDSDSession *)self sharedState];
        id v32 = [v31 groupID];
        uint64_t v33 = [(IDSDSession *)self sharedState];
        id v39 = [v33 destinations];
        double v38 = v4;
        id v37 = v32;
        _IDSLogTransport();

        if (_IDSShouldLog())
        {
          double v34 = [(IDSDSession *)self sharedState];
          id v35 = [v34 groupID];
          uint64_t v36 = [(IDSDSession *)self sharedState];
          id v39 = [v36 destinations];
          double v38 = v4;
          id v37 = v35;
          _IDSLogV();
        }
      }
    }
  }
  [(IDSGFTMetricsCollector *)self->_metricsCollector willSendJoin];
}

- (void)_noteJoinNotificationDidDeliverWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_joinSendEndTime == 0.0)
  {
    if (qword_100A4A5D0 != -1) {
      dispatch_once(&qword_100A4A5D0, &stru_100981748);
    }
    self->_joinSendEndTime = *(double *)&qword_100A4A5D8 * (double)mach_continuous_time();
  }
  if (v3)
  {
    uint64_t v5 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      CFDictionaryRef v6 = [(IDSDSession *)self sharedState];
      id v7 = [v6 groupID];
      id v8 = objc_retainBlock(self->_joinNotificationDeliveryTimeoutBlock);
      *(_DWORD *)buf = 138412546;
      dispatch_time_t v24 = v7;
      __int16 v25 = 2112;
      id v26 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Canceling timeout block for reliable join notification delivery { groupID: %@, timeoutBlock: %@ }", buf, 0x16u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        id v9 = [(IDSDSession *)self sharedState];
        uint64_t v21 = [v9 groupID];
        id v22 = objc_retainBlock(self->_joinNotificationDeliveryTimeoutBlock);
        _IDSLogTransport();

        if (_IDSShouldLog())
        {
          unsigned int v10 = [(IDSDSession *)self sharedState];
          uint64_t v21 = [v10 groupID];
          id v22 = objc_retainBlock(self->_joinNotificationDeliveryTimeoutBlock);
          _IDSLogV();
        }
      }
    }
    p_id joinNotificationDeliveryTimeoutBlock = &self->_joinNotificationDeliveryTimeoutBlock;
    id joinNotificationDeliveryTimeoutBlock = self->_joinNotificationDeliveryTimeoutBlock;
    if (joinNotificationDeliveryTimeoutBlock)
    {
      dispatch_block_cancel(joinNotificationDeliveryTimeoutBlock);
LABEL_22:
      id v20 = *p_joinNotificationDeliveryTimeoutBlock;
      *p_id joinNotificationDeliveryTimeoutBlock = 0;
    }
  }
  else
  {
    id v13 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      long long v14 = [(IDSDSession *)self sharedState];
      id v15 = [v14 groupID];
      id v16 = objc_retainBlock(self->_joinNotificationDeliveryTimeoutBlock);
      *(_DWORD *)buf = 138412546;
      dispatch_time_t v24 = v15;
      __int16 v25 = 2112;
      id v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Triggering early execution of timeout block for reliable join notification delivery { groupID: %@, timeoutBlock: %@ }", buf, 0x16u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        id v17 = [(IDSDSession *)self sharedState];
        uint64_t v21 = [v17 groupID];
        id v22 = objc_retainBlock(self->_joinNotificationDeliveryTimeoutBlock);
        _IDSLogTransport();

        if (_IDSShouldLog())
        {
          id v18 = [(IDSDSession *)self sharedState];
          uint64_t v21 = [v18 groupID];
          id v22 = objc_retainBlock(self->_joinNotificationDeliveryTimeoutBlock);
          _IDSLogV();
        }
      }
    }
    p_id joinNotificationDeliveryTimeoutBlock = &self->_joinNotificationDeliveryTimeoutBlock;
    int v19 = (void (**)(void))self->_joinNotificationDeliveryTimeoutBlock;
    if (v19)
    {
      v19[2]();
      goto LABEL_22;
    }
  }
  [(IDSGFTMetricsCollector *)self->_metricsCollector didSendJoin];
}

- (double)_serverSpecifiedJoinNotificationDeliveryTimeout
{
  v2 = +[IDSServerBag sharedInstance];
  BOOL v3 = [v2 objectForKey:@"ids-session-join-reliability-timeout"];

  double v4 = 30.0;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v3 doubleValue];
      double v4 = v5;
    }
  }

  return v4;
}

- (BOOL)shouldAllocateForInvitee
{
  if (!_os_feature_enabled_impl()) {
    return 0;
  }
  v2 = +[IDSServerBag sharedInstance];
  BOOL v3 = [v2 objectForKey:@"ids-session-allocate-for-invitee"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

- (void)openSocketToDevice:(id)a3
{
  id v73 = (__CFString *)a3;
  if (self->_shouldAssertRealTimeMode && !self->_assertedRealTimeMode)
  {
    self->_assertedRealTimeMode = 1;
    IDSTransportThreadAddBlock();
  }
  unsigned __int8 v4 = [(IDSDSession *)self accountController];
  double v5 = [(IDSDSession *)self sharedState];
  CFDictionaryRef v6 = [v5 accountID];
  id v7 = [v4 accountWithUniqueID:v6];
  id v8 = [v7 service];
  long long v72 = [v8 identifier];

  id v9 = [(IDSDSession *)self sharedState];
  id v10 = [v9 clientType];

  if (v10 == (id)4) {
    self->_BOOL bypassUTun = 1;
  }
  if ([(IDSDSession *)self _shouldUseIPsecLink])
  {
    self->_BOOL bypassUTun = 0;
    id v11 = [(IDSDSession *)self sharedState];
    [v11 setUseBTDatagramPipe:0];

    id v12 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_bypassUTun) {
        CFStringRef v13 = @"YES";
      }
      else {
        CFStringRef v13 = @"NO";
      }
      long long v14 = [(IDSDSession *)self sharedState];
      id v15 = [v14 uniqueID];
      *(_DWORD *)buf = 138412802;
      CFStringRef v79 = v13;
      __int16 v80 = 2112;
      CFStringRef v81 = v72;
      __int16 v82 = 2112;
      CFStringRef v83 = v15;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "IPsecLink is enabled. UTun bypass: %@ service: %@, session: %@.", buf, 0x20u);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      CFStringRef v16 = @"YES";
      id v17 = self->_bypassUTun ? @"YES" : @"NO";
      id v18 = [(IDSDSession *)self sharedState];
      v70 = [v18 uniqueID];
      v65 = v17;
      id v68 = v72;
      _IDSLogTransport();

      if (_IDSShouldLog())
      {
        if (!self->_bypassUTun) {
          CFStringRef v16 = @"NO";
        }
LABEL_34:
        __int16 v25 = [(IDSDSession *)self sharedState];
        [v25 uniqueID];
        v70 = id v68 = v72;
        v65 = (__CFString *)v16;
        _IDSLogV();
      }
    }
  }
  else
  {
    self->_BOOL bypassUTun = IMGetDomainBoolForKeyWithDefaultValue();
    int v19 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_bypassUTun) {
        CFStringRef v20 = @"YES";
      }
      else {
        CFStringRef v20 = @"NO";
      }
      uint64_t v21 = [(IDSDSession *)self sharedState];
      id v22 = [v21 uniqueID];
      *(_DWORD *)buf = 138412802;
      CFStringRef v79 = v20;
      __int16 v80 = 2112;
      CFStringRef v81 = v72;
      __int16 v82 = 2112;
      CFStringRef v83 = v22;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "UTun bypass: %@ service: %@, session: %@.", buf, 0x20u);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      CFStringRef v16 = @"YES";
      id v23 = self->_bypassUTun ? @"YES" : @"NO";
      dispatch_time_t v24 = [(IDSDSession *)self sharedState];
      v70 = [v24 uniqueID];
      v65 = v23;
      id v68 = v72;
      _IDSLogTransport();

      if (_IDSShouldLog())
      {
        if (!self->_bypassUTun) {
          CFStringRef v16 = @"NO";
        }
        goto LABEL_34;
      }
    }
  }
  id v26 = [(IDSDSession *)self sharedState];
  if ([v26 clientType] == (id)1)
  {
    BOOL v27 = 1;
  }
  else
  {
    id v28 = [(IDSDSession *)self sharedState];
    if ([v28 clientType] == (id)5)
    {
      BOOL v27 = 1;
    }
    else
    {
      id v29 = [(IDSDSession *)self sharedState];
      BOOL v27 = [v29 clientType] == (id)6;
    }
  }

  id v30 = [(IDSDSession *)self sharedState];
  unsigned int v31 = [v30 useQRDirectly];

  if (v31 | v27)
  {
    id v32 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v33 = [(IDSDSession *)self sharedState];
      unsigned int v34 = [v33 useQRDirectly];
      CFStringRef v35 = @"NO";
      if (v34) {
        CFStringRef v36 = @"YES";
      }
      else {
        CFStringRef v36 = @"NO";
      }
      *(_DWORD *)buf = 138412802;
      CFStringRef v79 = v73;
      CFStringRef v81 = v36;
      __int16 v80 = 2112;
      if (v27) {
        CFStringRef v35 = @"YES";
      }
      __int16 v82 = 2112;
      CFStringRef v83 = v35;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "openSocketToDevice deviceID %@, self.sharedState.useQRDirectly %@, _isFaceTime %@", buf, 0x20u);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      id v37 = [(IDSDSession *)self sharedState];
      double v38 = [v37 useQRDirectly] ? @"YES" : @"NO";
      id v39 = v27 ? @"YES" : @"NO";
      id v69 = v38;
      id v71 = v39;
      CFStringRef v66 = v73;
      _IDSLogTransport();

      if (_IDSShouldLog())
      {
        id v40 = [(IDSDSession *)self sharedState];
        if ([v40 useQRDirectly]) {
          CFStringRef v41 = @"YES";
        }
        else {
          CFStringRef v41 = @"NO";
        }
        id v69 = (__CFString *)v41;
        id v71 = v39;
        CFStringRef v66 = v73;
        _IDSLogV();
      }
    }
    uint64_t v42 = [(IDSDSession *)self sharedState];
    [v42 clearAllTimers];

    [(IDSDSession *)self startQRSession];
  }
  else
  {
    id v43 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      BOOL bypassUTun = self->_bypassUTun;
      *(_DWORD *)buf = 67109120;
      LODWORD(v79) = bypassUTun;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "open socket for session, byPassUtun: %d", buf, 8u);
    }

    id v45 = [(IDSDSession *)self sharedState];
    id v46 = [v45 serviceName];
    BOOL v67 = self->_bypassUTun;
    DLCSessionLogWithLevel();

    if (self->_bypassUTun)
    {
      v77[0] = _NSConcreteStackBlock;
      v77[1] = 3221225472;
      v77[2] = sub_1000A10F4;
      v77[3] = &unk_1009810B8;
      v77[4] = self;
      id v47 = -[IDSConnectionContext initWithReadHandler:]([IDSConnectionContext alloc], "initWithReadHandler:", v77, v67);
      connectionContext = self->_connectionContext;
      self->_connectionContext = v47;
    }
    __int16 v49 = [(IDSDSession *)self utunController];
    double v50 = [(IDSDSession *)self _acceptedDeviceUniqueID];
    __int16 v51 = [(IDSDSession *)self _acceptedDeviceToken];
    id v52 = [v51 rawToken];
    __int16 v53 = [(IDSDSession *)self _socketOptionsForDevice:v73 uniqueID:v50 pushToken:v52 connectionSuffix:0];
    uint64_t v54 = im_primary_queue();
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472;
    id v76[2] = sub_1000A117C;
    v76[3] = &unk_1009810E0;
    v76[4] = self;
    [v49 openSocketWithOptions:v53 queue:v54 completionHandler:v76];

    id v55 = [(IDSDSession *)self sharedState];
    LODWORD(v51) = (unint64_t)[v55 connectionCountHint] > 1;

    if (v51)
    {
      uint64_t v56 = [(IDSDSession *)self sharedState];
      self->_extraConnectionCount = (unint64_t)[v56 connectionCountHint] - 1;

      if (self->_extraConnectionCount)
      {
        unint64_t v57 = 0;
        do
        {
          long long v58 = [(IDSDSession *)self utunController];
          long long v59 = [(IDSDSession *)self _acceptedDeviceUniqueID];
          BOOL v60 = [(IDSDSession *)self _acceptedDeviceToken];
          long long v61 = [v60 rawToken];
          id v62 = +[NSString stringWithFormat:@"-%d", v57];
          id v63 = [(IDSDSession *)self _socketOptionsForDevice:v73 uniqueID:v59 pushToken:v61 connectionSuffix:v62];
          id v64 = im_primary_queue();
          v74[0] = _NSConcreteStackBlock;
          v74[1] = 3221225472;
          v74[2] = sub_1000A1368;
          v74[3] = &unk_100981108;
          int v75 = v57;
          v74[4] = self;
          [v58 openSocketWithOptions:v63 queue:v64 completionHandler:v74];

          ++v57;
        }
        while (self->_extraConnectionCount > v57);
      }
    }
  }
}

- (void)startQRSession
{
}

- (void)_broadcastSessionStartWithSocket:(int)a3
{
  if (a3 == -1) {
    xpc_object_t value = 0;
  }
  else {
    xpc_object_t value = xpc_fd_create(a3);
  }
  id v4 = objc_alloc_init((Class)IMMessageContext);
  [v4 setShouldBoost:1];
  double v5 = +[IDSDaemon sharedInstance];
  CFDictionaryRef v6 = [(IDSDSession *)self sharedState];
  id v7 = [v6 pushTopic];
  id v8 = [v5 broadcasterForTopic:v7 entitlement:kIDSSessionPrivateEntitlement command:0 messageContext:v4];

  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  if (v9)
  {
    IMInsertBoolsToXPCDictionary();
    xpc_dictionary_set_value(v9, "object", value);
    id v10 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    id v11 = [(IDSDSession *)self sharedState];
    id v12 = [v11 uniqueID];

    if (v12) {
      CFDictionarySetValue(v10, @"sessionID", v12);
    }

    CFDictionarySetValue(v10, @"object-type", @"session-device-socket");
    id v13 = [(__CFDictionary *)v10 copy];
    IMInsertKeyedCodableObjectsToXPCDictionary();

    objc_msgSend(v8, "sendXPCObject:", v9, v13, 0);
  }
}

- (BOOL)_shouldUseIPsecLink
{
  BOOL v2 = [(IDSDSession *)self isWithDefaultPairedDevice];
  if (v2)
  {
    BOOL v3 = +[IDSPairingManager sharedInstance];
    unsigned __int8 v4 = [v3 shouldUseIPsecLinkForDefaultPairedDevice];

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (void)_sessionStartWithSocketDescriptor:(int)a3
{
  if (!self->_sessionStartedCalled)
  {
    self->_sessionStartedCalled = 1;
    double v5 = [(IDSDSession *)self sharedState];
    unsigned int v6 = [v5 useBTDatagramPipe];

    if ([(IDSDSession *)self _shouldUseIPsecLink] | v6) {
      unsigned int v7 = -1;
    }
    else {
      unsigned int v7 = a3;
    }
    if (self->_bypassUTun) {
      uint64_t v8 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v8 = v7;
    }
    xpc_object_t v9 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v10 = @"YES";
      if (!self->_bypassUTun) {
        CFStringRef v10 = @"NO";
      }
      *(_DWORD *)buf = 67109378;
      int v31 = v8;
      __int16 v32 = 2112;
      CFStringRef v33 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "sessionStartWithSocketDescriptor socketDescriptor %d, bypassUtun: %@", buf, 0x12u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      id v11 = self->_bypassUTun ? @"YES" : @"NO";
      uint64_t v28 = v8;
      id v29 = v11;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        if (self->_bypassUTun) {
          CFStringRef v12 = @"YES";
        }
        else {
          CFStringRef v12 = @"NO";
        }
        uint64_t v28 = v8;
        id v29 = (__CFString *)v12;
        _IDSLogV();
      }
    }
    -[IDSDSession _broadcastSessionStartWithSocket:](self, "_broadcastSessionStartWithSocket:", v8, v28, v29);
    id v13 = [(IDSDSession *)self sharedState];
    unsigned __int8 v14 = [v13 sharedSession];

    if ((v14 & 1) == 0)
    {
      id v15 = [(IDSDSession *)self sharedState];
      [v15 setState:5];
    }
    CFStringRef v16 = (NSDate *)objc_alloc_init((Class)NSDate);
    startDate = self->_startDate;
    self->_startDate = v16;

    [(IDSDSession *)self submitAWDMetricsForIDSSessionConnected];
    id v18 = +[IMLockdownManager sharedInstance];
    unsigned int v19 = [v18 isInternalInstall];

    if (v19)
    {
      CFStringRef v20 = [(IDSDSession *)self sharedState];
      if (([v20 useQRDirectly] & 1) == 0)
      {
        uint64_t v21 = [(IDSDSession *)self sharedState];
        if ([v21 clientType] != (id)1)
        {
          id v22 = [(IDSDSession *)self sharedState];
          if ([v22 clientType] != (id)5)
          {
            id v26 = [(IDSDSession *)self sharedState];
            BOOL v27 = [v26 clientType] == (id)6;

            if (!v27) {
              return;
            }
            goto LABEL_31;
          }
        }
      }

LABEL_31:
      id v23 = [(IDSDSession *)self qrAllocator];
      dispatch_time_t v24 = [(IDSDSession *)self sharedState];
      __int16 v25 = [v24 uniqueID];
      [v23 getServerProviderForIDSSessionID:v25];

      IDSTransportThreadAddBlock();
    }
  }
}

- (void)checkAndCallSessionStart
{
  if (self->_extraConnectionCount)
  {
    BOOL v3 = self;
    objc_sync_enter(v3);
    BOOL v4 = (unint64_t)[(NSMutableDictionary *)v3->_extraConnections count] < self->_extraConnectionCount;
    objc_sync_exit(v3);
  }
  else
  {
    BOOL v4 = 0;
  }
  if (self->_socketDescriptor != -1 && !v4)
  {
    double v5 = [(IDSDSession *)self sharedState];
    [v5 clearAllTimers];

    uint64_t socketDescriptor = self->_socketDescriptor;
    [(IDSDSession *)self _sessionStartWithSocketDescriptor:socketDescriptor];
  }
}

- (void)_setInitialLinkType:(unint64_t)a3
{
  if (a3 && !self->_initialLinkType)
  {
    self->_initialLinkType = a3;
    double v5 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v6 = [(IDSDSession *)self sharedState];
      unsigned int v7 = [v6 uniqueID];
      *(_DWORD *)buf = 67109378;
      int v24 = a3;
      __int16 v25 = 2112;
      id v26 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "set initial link type %d for session %@.", buf, 0x12u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        uint64_t v8 = [(IDSDSession *)self sharedState];
        uint64_t v21 = [v8 uniqueID];
        _IDSLogTransport();

        if (_IDSShouldLog())
        {
          xpc_object_t v9 = [(IDSDSession *)self sharedState];
          id v22 = [v9 uniqueID];
          _IDSLogV();
        }
      }
    }
    id v10 = objc_alloc_init((Class)IMMessageContext);
    [v10 setShouldBoost:1];
    id v11 = +[IDSDaemon sharedInstance];
    CFStringRef v12 = [(IDSDSession *)self sharedState];
    id v13 = [v12 pushTopic];
    unsigned __int8 v14 = [v11 broadcasterForTopic:v13 entitlement:kIDSSessionPrivateEntitlement command:0 messageContext:v10];

    xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
    if (v15)
    {
      IMInsertBoolsToXPCDictionary();
      xpc_object_t v16 = xpc_int64_create(a3);
      xpc_dictionary_set_value(v15, "object", v16);

      id v17 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      id v18 = [(IDSDSession *)self sharedState];
      unsigned int v19 = [v18 uniqueID];

      if (v19) {
        CFDictionarySetValue(v17, @"sessionID", v19);
      }

      CFDictionarySetValue(v17, @"object-type", @"session-initial-link-type");
      id v20 = [(__CFDictionary *)v17 copy];
      IMInsertKeyedCodableObjectsToXPCDictionary();

      objc_msgSend(v14, "sendXPCObject:", v15, v20, 0);
    }
  }
}

- (void)setAcceptedRelaySession:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v5 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "received delayed QR connection %@ for an accepted session", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
    if (self->_skeData)
    {
      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      objc_copyWeak(&v12, (id *)buf);
      IDSTransportThreadAddBlock();
      objc_destroyWeak(&v12);
      objc_destroyWeak((id *)buf);
    }
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    unsigned int v7 = [(IDSDSession *)self sharedState];
    uint64_t v8 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 useSecureQRControlMessage]);

    if (v8)
    {
      CFDictionarySetValue(Mutable, IDSGlobalLinkOptionUseSecureControlMessageKey, v8);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10070DDD4();
    }

    xpc_object_t v9 = [(IDSDSession *)self utunController];
    id v10 = [(IDSDSession *)self sharedState];
    id v11 = [v10 uniqueID];
    [v9 setAcceptedRelaySession:v11 relaySessionID:v4 options:Mutable];
  }
}

- (void)setHasPendingAllocation:(BOOL)a3 forIDSSession:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v6)
  {
    unsigned int v7 = [(IDSDSession *)self utunController];
    [v7 setHasPendingAllocation:v4 forIDSSession:v6];
  }
  else
  {
    uint64_t v8 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v10 = "-[IDSDSession setHasPendingAllocation:forIDSSession:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s IDSSessionID is nil!", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
  }
}

- (id)getCallerCert
{
  BOOL v3 = [(IDSDSession *)self accountController];
  BOOL v4 = [(IDSDSession *)self sharedState];
  double v5 = [v4 accountID];
  id v6 = [v3 accountWithUniqueID:v5];
  unsigned int v7 = [v6 _registrationCert];

  return v7;
}

- (id)getFromService
{
  BOOL v3 = [(IDSDSession *)self accountController];
  BOOL v4 = [(IDSDSession *)self sharedState];
  double v5 = [v4 accountID];
  id v6 = [v3 accountWithUniqueID:v5];
  unsigned int v7 = [v6 service];
  uint64_t v8 = [v7 identifier];

  return v8;
}

- (id)getAppID
{
  BOOL v2 = [(IDSDSession *)self sharedState];
  BOOL v3 = [v2 pushTopic];

  return v3;
}

- (BOOL)shouldReportUPlusOneKey
{
  return self->_startedAsUPlusOneSession && !self->_switchedToUPlusMany;
}

- (unsigned)globalLinkErrorToSessionEndReason:(int64_t)a3
{
  if ((unint64_t)a3 > 0xE) {
    return 6;
  }
  else {
    return dword_1007940F8[a3];
  }
}

- (void)networkingIsAvailable:(id)a3
{
}

- (void)runConnectivityCheckWithCompletionBlock:(id)a3
{
  id v4 = a3;
  availabilityCheck = self->_availabilityCheck;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A291C;
  v7[3] = &unk_1009811C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(IDSDSessionAvailabilityCheck *)availabilityCheck checkLocalConnectivityForSession:self withCompletionBlock:v7];
}

- (void)startListeningOnClientSocket:(int)a3 isRawSocket:(BOOL)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = [(IDSDSession *)self sharedState];
  unsigned int v7 = [v6 isScreenSharingSession];

  if (v7)
  {
    if (self->_baseSocketPairConnection)
    {
      id v8 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        unsigned int v9 = [(IDSBaseSocketPairConnection *)self->_baseSocketPairConnection socket];
        *(_DWORD *)buf = 136315394;
        id v22 = "IDSDSession";
        __int16 v23 = 1024;
        unsigned int v24 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s - We're already listening on socket %d", buf, 0x12u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        baseSocketPairConnection = self->_baseSocketPairConnection;
        p_baseSocketPairConnection = &self->_baseSocketPairConnection;
        id v19 = [(IDSBaseSocketPairConnection *)baseSocketPairConnection socket];
        _IDSWarnV();
        id v20 = [(IDSBaseSocketPairConnection *)*p_baseSocketPairConnection socket];
        _IDSLogV();
        [(IDSBaseSocketPairConnection *)*p_baseSocketPairConnection socket];
        _IDSLogTransport();
      }
    }
    else
    {
      id v12 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v22) = v4;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Starting to listen on raw client socket %d", buf, 8u);
      }

      id v13 = [(IDSDSession *)self sharedState];
      unsigned __int8 v14 = [v13 serviceName];
      DLCSessionLogWithLevel();

      id v15 = objc_alloc((Class)IDSBaseSocketPairConnection);
      xpc_object_t v16 = im_primary_queue();
      id v17 = (IDSBaseSocketPairConnection *)objc_msgSend(v15, "initWithSocket:queue:delegate:", v4, v16, self, v4);
      id v18 = self->_baseSocketPairConnection;
      self->_baseSocketPairConnection = v17;
    }
  }
  else if ((int)v4 >= 1)
  {
    close(v4);
  }
}

- (void)cleanupSessionWithCleanStatus:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    unsigned __int8 v100 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Cleanup session: %@", buf, 0xCu);
  }

  id v6 = [(IDSDSession *)self sharedState];
  uint64_t v7 = [v6 serviceName];
  DLCSessionLogWithLevel();

  id v8 = [(IDSDSession *)self sharedState];
  LOBYTE(v7) = [v8 sharedSession];

  if ((v7 & 1) == 0)
  {
    unsigned int v9 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      unsigned __int8 v100 = self;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "REPORT RTC: %@", buf, 0xCu);
    }

    id v10 = [(IDSDSession *)self sharedState];
    id v11 = [v10 serviceName];
    DLCSessionLogWithLevel();

    [(IDSDSession *)self _reportRTC];
  }
  [(IDSDSession *)self unregisterClientChannel];
  id v12 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    clientChannel = self->_clientChannel;
    *(_DWORD *)buf = 134217984;
    unsigned __int8 v100 = (IDSDSession *)clientChannel;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Releasing the client channel %p", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      v93 = self->_clientChannel;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        v93 = self->_clientChannel;
        _IDSLogV();
      }
    }
  }
  [(IDSClientChannel *)self->_clientChannel invalidate];
  os_unfair_lock_lock(&self->_clientChannelLock);
  unsigned __int8 v14 = self->_clientChannel;
  self->_clientChannel = 0;

  os_unfair_lock_unlock(&self->_clientChannelLock);
  id v15 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v16 = @"NO";
    BOOL isLightweightParticipant = self->_isLightweightParticipant;
    if (v3) {
      CFStringRef v18 = @"YES";
    }
    else {
      CFStringRef v18 = @"NO";
    }
    *(_DWORD *)buf = 138412802;
    unsigned __int8 v100 = self;
    __int16 v101 = 2112;
    if (isLightweightParticipant) {
      CFStringRef v16 = @"YES";
    }
    CFStringRef v102 = v18;
    __int16 v103 = 2112;
    CFStringRef v104 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@ cleanupSessionWithCleanStatus: shouldCleanStatus: %@, _isLightweightParticipant: %@", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    id v19 = v3 ? @"YES" : @"NO";
    id v20 = self->_isLightweightParticipant ? @"YES" : @"NO";
    id v96 = v19;
    v97 = v20;
    CFStringRef v94 = self;
    _IDSLogTransport();
    if (_IDSShouldLog())
    {
      if (self->_isLightweightParticipant) {
        CFStringRef v21 = @"YES";
      }
      else {
        CFStringRef v21 = @"NO";
      }
      id v96 = v19;
      v97 = (__CFString *)v21;
      CFStringRef v94 = self;
      _IDSLogV();
    }
  }
  if (v3)
  {
    id v22 = [(IDSDSession *)self utunController];
    __int16 v23 = [(IDSDSession *)self sharedState];
    unsigned int v24 = [v23 uniqueID];
    [v22 clearSharedSessionHasJoinedForIDSSession:v24];

    __int16 v25 = [(IDSDSession *)self utunController];
    id v26 = [(IDSDSession *)self sharedState];
    BOOL v27 = [v26 uniqueID];
    [v25 clearCellInterfaceName:v27];

    uint64_t v28 = +[IDSNWPathUtils sharedInstance];
    id v29 = [(IDSDSession *)self sharedState];
    id v30 = [v29 uniqueID];
    [v28 takeDownSlicedInterfaceForSession:v30];

    notify_cancel(self->_sliceActiveNotificationToken);
    int v31 = [(IDSDSession *)self utunController];
    __int16 v32 = [(IDSDSession *)self sharedState];
    CFStringRef v33 = [v32 uniqueID];
    [v31 clearIDSContextBlob:v33];

    unsigned int v34 = [(IDSDSession *)self sharedState];
    LODWORD(v32) = [v34 isScreenSharingSession];

    CFStringRef v35 = [(IDSDSession *)self sharedState];
    CFStringRef v36 = v35;
    if (v32)
    {
      [v35 setState:8];

      [(IDSDSession *)self _cleanupSessionConnection];
      id v37 = [(IDSDSession *)self sharedState];
      [v37 clearAllTimers];

      [(IDSDSession *)self _cleanupSocketPairConnection];
      [(IDSDSession *)self _notifyClientsSessionStopped];
    }
    else
    {
      int v39 = [v35 sharedSession];

      if (v39)
      {
        id v40 = +[IDSGroupEncryptionController sharedInstance];
        CFStringRef v41 = [(IDSDSession *)self sharedState];
        uint64_t v42 = [v41 groupID];
        [v40 resetKeyMaterialLocalSentStatus:v42];

        id v43 = +[IDSGroupEncryptionController sharedInstance];
        uint64_t v44 = [(IDSDSession *)self sharedState];
        id v45 = [v44 groupID];
        [v43 unsubscribeEndpointsForGroup:v45];
      }
      else
      {
        id v46 = [(IDSDSession *)self sharedState];
        id v47 = [v46 uniqueID];
        [(IDSDSession *)self _closeSocketToDevice:v47];

        [(IDSDSession *)self _closeSocketToDevice:kIDSDefaultPairedDeviceID];
      }
      id v48 = [(IDSDSession *)self sharedState];
      unsigned int v49 = [v48 enableQuickRelay];

      if (v49)
      {
        [(IDSDSession *)self _cleanupQuickRelaySession];
      }
      else
      {
        double v50 = [(IDSDSession *)self utunController];
        __int16 v51 = [(IDSDSession *)self sharedState];
        id v52 = [v51 uniqueID];
        [v50 stopUDPGlobalLinkForDevice:v52];
      }
      __int16 v53 = [(IDSDSession *)self sharedState];
      [v53 setState:8];
    }
    IDSTransportThreadAddBlock();
    if (self->_multiplexerEnabled)
    {
      uint64_t v54 = +[IDSGroupSessionMultiplexer sharedInstance];
      [v54 unregisterMultiplexerTransport:self->_multiplexerTransport];

      multiplexerTransport = self->_multiplexerTransport;
      self->_multiplexerTransport = 0;
    }
    dataBlobEncryptionManager = self->_dataBlobEncryptionManager;
    self->_dataBlobEncryptionManager = 0;

    cryptorForBlobs = self->_cryptorForBlobs;
    self->_cryptorForBlobs = 0;

    typeToKeyIDToEncryptedData = self->_typeToKeyIDToEncryptedData;
    self->_typeToKeyIDToEncryptedData = 0;

    typeToParticipantIDToDecryptedDataBlob = self->_typeToParticipantIDToDecryptedDataBlob;
    self->_typeToParticipantIDToDecryptedDataBlob = 0;

    keyIDToParticipantID = self->_keyIDToParticipantID;
    self->_keyIDToParticipantID = 0;

    long long v61 = [(IDSDSession *)self sharedState];
    id v62 = [v61 localUnauthenticatedFullIdentity];

    if (v62)
    {
      id v63 = [(IDSDSession *)self sharedState];
      id v64 = [v63 localUnauthenticatedFullIdentity];
      v65 = [v64 description];

      CFStringRef v66 = [(IDSDSession *)self sharedState];
      BOOL v67 = [v66 localUnauthenticatedFullIdentity];
      id v98 = 0;
      unsigned int v68 = [v67 purgeFromKeychain:&v98];
      id v69 = (IDSDSession *)v98;

      if (v68)
      {
        v70 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          unsigned __int8 v100 = v65;
          _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "Deleted localUnauthenticatedFullIdentity from keychain {identity: %@}", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            CFStringRef v94 = v65;
            _IDSLogTransport();
            if (_IDSShouldLog())
            {
              CFStringRef v94 = v65;
              _IDSLogV();
            }
          }
        }
      }
      else
      {
        id v71 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          unsigned __int8 v100 = v69;
          __int16 v101 = 2112;
          CFStringRef v102 = (const __CFString *)v65;
          _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "Failed to delete localUnauthenticatedFullIdentity from keychain {error: %@, identity: %@}", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            CFStringRef v94 = v69;
            id v96 = (__CFString *)v65;
            _IDSLogTransport();
            if (_IDSShouldLog())
            {
              CFStringRef v94 = v69;
              id v96 = (__CFString *)v65;
              _IDSLogV();
            }
          }
        }
      }
      long long v72 = [(IDSDSession *)self sharedState];
      [v72 setLocalUnauthenticatedFullIdentity:0];

      id v73 = [(IDSDSession *)self sharedState];
      [v73 setRemoteUnauthenticatedPublicIdentity:0];
    }
    long long v74 = [(IDSDSession *)self sharedState];
    unsigned int v75 = [v74 sharedSession];

    if (v75)
    {
      uint64_t v76 = [(IDSDSession *)self sharedState];
      unsigned int v77 = [v76 isInUPlusOneMode];

      if (v77)
      {
        __int16 v78 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
        {
          CFStringRef v79 = [(IDSDSession *)self sharedState];
          __int16 v80 = [v79 groupID];
          *(_DWORD *)buf = 138412290;
          unsigned __int8 v100 = v80;
          _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "reset keys for U + 1 session: %@", buf, 0xCu);
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            CFStringRef v81 = [(IDSDSession *)self sharedState];
            CFStringRef v95 = [v81 groupID];
            _IDSLogTransport();

            if (_IDSShouldLog())
            {
              __int16 v82 = [(IDSDSession *)self sharedState];
              CFStringRef v95 = [v82 groupID];
              _IDSLogV();
            }
          }
        }
        CFStringRef v83 = +[IDSGroupEncryptionController sharedInstance];
        uint64_t v84 = [(IDSDSession *)self sharedState];
        double v85 = [v84 groupID];
        [v83 resetKeysForGroup:v85 shouldRemoveCurrentParticipants:0];
      }
      uint64_t v86 = IMGetCachedDomainIntForKeyWithDefaultValue();
      v87 = +[IDSGroupEncryptionController sharedInstance];
      int v88 = [(IDSDSession *)self sharedState];
      int v89 = [v88 groupID];
      [v87 resetMKMCacheAfterTimeoutForGroup:v89 interval:v86];
    }
    if (_os_feature_enabled_impl())
    {
      v90 = +[IDSDSessionActiveParticipantsCache sharedInstance];
      v91 = [(IDSDSession *)self sharedState];
      v92 = [v91 uniqueID];
      [v90 removeParticipantsForSessionID:v92];
    }
  }
  else
  {
    double v38 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      unsigned __int8 v100 = self;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%@ cleanupSessionWithCleanStatus: no need to clean session status", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
  }
}

- (void)_cleanupQuickRelaySession
{
  BOOL v3 = [(IDSDSession *)self utunController];
  uint64_t v4 = [(IDSDSession *)self sharedState];
  double v5 = [v4 uniqueID];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000A3B50;
  v6[3] = &unk_100981208;
  v6[4] = self;
  [v3 disconnectGlobalLinkForDevice:v5 isReinitiating:0 completionHandler:v6];
}

- (void)reconnectSession
{
  BOOL v3 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Reconnect initiated By TU", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
  uint64_t v4 = [(IDSDSession *)self sharedState];
  [v4 clearAllTimers];

  [(IDSDSession *)self reinitiate];
  IDSTransportThreadAddBlock();
}

- (void)endSession
{
  BOOL v3 = [(IDSDSession *)self sharedState];
  if ([v3 isInitiator]) {
    uint64_t v4 = 11;
  }
  else {
    uint64_t v4 = 12;
  }

  [(IDSDSession *)self endSessionWithReason:v4];
}

- (void)_sendSessionEndWithData:(id)a3
{
  id v4 = a3;
  double v5 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  id v6 = _IDSSessionProtocolVersionNumber();
  if (v6)
  {
    CFDictionarySetValue(v5, IDSDSessionMessageVersion, v6);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070B260();
  }

  uint64_t v7 = [(IDSDSession *)self sharedState];
  id v8 = [v7 uniqueID];

  if (v8)
  {
    CFDictionarySetValue(v5, IDSDSessionMessageSessionID, v8);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070B1D8();
  }

  unsigned int v9 = [(IDSDSession *)self sharedState];
  id v10 = [v9 participantID];

  if (v10)
  {
    CFDictionarySetValue(v5, IDSDSessionMessageParticipantID, v10);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10070B150();
  }

  if (v4) {
    CFDictionarySetValue(v5, IDSDSessionMessageContext, v4);
  }
  id v11 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [(IDSDSession *)self sharedState];
    id v13 = [v12 destinations];
    unsigned __int8 v14 = [(IDSDSession *)self sharedState];
    id v15 = [v14 uniqueID];
    *(_DWORD *)buf = 138412802;
    uint64_t v28 = v13;
    __int16 v29 = 2112;
    id v30 = v15;
    __int16 v31 = 2112;
    __int16 v32 = v5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Sending END to %@, %@ <%@>", buf, 0x20u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      CFStringRef v16 = [(IDSDSession *)self sharedState];
      id v17 = [v16 destinations];
      CFStringRef v18 = [(IDSDSession *)self sharedState];
      __int16 v25 = [v18 uniqueID];
      id v26 = v5;
      unsigned int v24 = v17;
      _IDSLogTransport();

      if (_IDSShouldLog())
      {
        id v19 = [(IDSDSession *)self sharedState];
        id v20 = [v19 destinations];
        CFStringRef v21 = [(IDSDSession *)self sharedState];
        __int16 v25 = [v21 uniqueID];
        id v26 = v5;
        unsigned int v24 = v20;
        _IDSLogV();
      }
    }
  }
  id v22 = [(IDSDSession *)self messenger];
  __int16 v23 = +[NSNumber numberWithInteger:237];
  [v22 sendMessage:v5 withCommand:v23];
}

- (void)endSessionWithData:(id)a3
{
  id v4 = a3;
  double v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Ending session with data", v12, 2u);
  }

  id v6 = [(IDSDSession *)self sharedState];
  uint64_t v7 = [v6 serviceName];
  DLCSessionLogWithLevel();

  id v8 = [(IDSDSession *)self sharedState];
  [v8 setState:8];

  [(IDSDSession *)self _sendSessionEndWithData:v4];
  unsigned int v9 = [(IDSDSession *)self sharedState];
  LODWORD(v7) = [v9 isScreenSharingSession];

  if (v7)
  {
    [(IDSDSession *)self endSessionWithReason:11];
  }
  else
  {
    id v10 = [(IDSDSession *)self sharedState];
    [v10 clearAllTimers];

    id v11 = [(IDSDSession *)self sharedState];
    [v11 setEndSessionTimeoutTimer];
  }
}

- (void)_endSession
{
  BOOL v3 = [(IDSDSession *)self utunController];
  id v4 = [(IDSDSession *)self sharedState];
  double v5 = [v4 uniqueID];
  [v3 clearCellInterfaceName:v5];

  id v6 = +[IDSNWPathUtils sharedInstance];
  uint64_t v7 = [(IDSDSession *)self sharedState];
  id v8 = [v7 uniqueID];
  [v6 takeDownSlicedInterfaceForSession:v8];

  notify_cancel(self->_sliceActiveNotificationToken);
  unsigned int v9 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Ending session", buf, 2u);
  }

  id v10 = [(IDSDSession *)self sharedState];
  id v11 = [v10 serviceName];
  DLCSessionLogWithLevel();

  id v12 = [(IDSDSession *)self sharedState];
  id v13 = [v12 serviceName];

  if (v13)
  {
    id v14 = objc_alloc((Class)NSString);
    id v15 = [(IDSDSession *)self sharedState];
    CFStringRef v16 = [v15 serviceName];
    id v17 = [v14 initWithString:v16];

    [(IDSDSession *)self _resetPreferences:v17];
  }
  CFStringRef v18 = [(IDSDSession *)self sharedState];
  id v19 = [v18 uniqueID];
  id v20 = [v19 componentsSeparatedByString:@"-"];

  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(Mutable, @"state", &off_1009D0DE0);
  id v22 = -[NSString substringFromIndex:](self->_serviceIdentifier, "substringFromIndex:", [@"com.apple.private.alloy." length]);
  if (v22) {
    CFDictionarySetValue(Mutable, @"serviceName", v22);
  }

  __int16 v23 = [v20 objectAtIndexedSubscript:0];
  if (v23) {
    CFDictionarySetValue(Mutable, @"sessionID", v23);
  }

  IDSPowerLogDictionary();
  [(IDSDSession *)self unregisterClientChannel];
  unsigned int v24 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    clientChannel = self->_clientChannel;
    *(_DWORD *)buf = 134217984;
    v110 = clientChannel;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Releasing the client channel %p", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      v93 = self->_clientChannel;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        v93 = self->_clientChannel;
        _IDSLogV();
      }
    }
  }
  [(IDSClientChannel *)self->_clientChannel invalidate];
  os_unfair_lock_lock(&self->_clientChannelLock);
  id v26 = self->_clientChannel;
  self->_clientChannel = 0;

  os_unfair_lock_unlock(&self->_clientChannelLock);
  BOOL v27 = [(IDSDSession *)self sharedState];
  unsigned int v28 = [v27 isScreenSharingSession];

  if (v28)
  {
    __int16 v29 = [(IDSDSession *)self sharedState];
    id v30 = [v29 connection];
    [v30 stopConnection:0];

    [(IDSDSession *)self _cleanupSocketPairConnection];
    [(IDSDSession *)self _notifyClientsSessionStopped];
    [(IDSDSession *)self _cleanupQuickRelaySession];
    goto LABEL_65;
  }
  __int16 v31 = [(IDSDSession *)self qrAllocator];
  __int16 v32 = [(IDSDSession *)self sharedState];
  CFStringRef v33 = [v32 uniqueID];
  [v31 invalidateSession:v33 isExpiryPurging:0];

  unsigned int v34 = [(IDSDSession *)self sharedState];
  if ([v34 sharedSession])
  {
    CFStringRef v35 = [(IDSGroupStatusNotificationParameters *)self->_groupStatusNotificationParams participantID];
    BOOL v36 = v35 == 0;

    if (!v36)
    {
      id v37 = [(IDSDSession *)self sharedState];
      double v38 = [v37 groupID];

      if (!v38)
      {
        id v45 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Cannot fan out the endSession leave notification to the group, no groupID!", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport();
            if (_IDSShouldLog()) {
              _IDSLogV();
            }
          }
        }
        goto LABEL_49;
      }
      if (self->_groupSessionState > 1)
      {
        id v46 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          id v47 = [(IDSDSession *)self sharedState];
          id v48 = [v47 groupID];
          *(_DWORD *)buf = 138412290;
          v110 = v48;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Didn't fan out the leave notification, the group session %@ is already ended!", buf, 0xCu);
        }
        if (!os_log_shim_legacy_logging_enabled()) {
          goto LABEL_48;
        }
        if (!_IDSShouldLogTransport()) {
          goto LABEL_48;
        }
        unsigned int v49 = [(IDSDSession *)self sharedState];
        CFStringRef v94 = [v49 groupID];
        _IDSLogTransport();

        if (!_IDSShouldLog()) {
          goto LABEL_48;
        }
        id v104 = [(IDSDSession *)self sharedState];
        id v50 = [v104 groupID];
        CFStringRef v94 = v50;
        _IDSLogV();
      }
      else
      {
        int v39 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          id v40 = [(IDSDSession *)self sharedState];
          CFStringRef v41 = [v40 groupID];
          *(_DWORD *)buf = 138412290;
          v110 = v41;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "notifyLeaveToGroup and sessionDidLeaveGroup for group session %@", buf, 0xCu);
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            uint64_t v42 = [(IDSDSession *)self sharedState];
            CFStringRef v94 = [v42 groupID];
            _IDSLogTransport();

            if (_IDSShouldLog())
            {
              id v43 = [(IDSDSession *)self sharedState];
              CFStringRef v94 = [v43 groupID];
              _IDSLogV();
            }
          }
        }
        if (self->_startedAsUPlusOneSession && self->_reason == 45)
        {
          id v44 = objc_alloc((Class)NSError);
          id v104 = [v44 initWithDomain:IDSSessionErrorDomain code:45 userInfo:0];
        }
        else
        {
          id v104 = 0;
        }
        id v98 = [(IDSDSession *)self groupStatusNotificationController];
        __int16 v103 = [(IDSDSession *)self sharedState];
        BOOL v99 = [v103 groupID];
        CFStringRef v102 = [(IDSDSession *)self sharedState];
        __int16 v101 = [v102 destinations];
        v97 = [v101 allObjects];
        groupStatusNotificationParams = self->_groupStatusNotificationParams;
        unsigned __int8 v100 = [(IDSDSession *)self accountController];
        __int16 v51 = [(IDSDSession *)self sharedState];
        id v52 = [v51 accountID];
        __int16 v53 = [v100 accountWithUniqueID:v52];
        uint64_t v54 = [(IDSDSession *)self sharedState];
        id v55 = [v54 fromURI];
        uint64_t v56 = [(IDSDSession *)self sharedState];
        unint64_t v57 = [v56 uniqueID];
        LOBYTE(v95) = [(IDSDSession *)self shouldReportUPlusOneKey];
        [v98 notifyLeaveToGroup:v99 members:v97 params:groupStatusNotificationParams fromAccount:v53 fromURI:v55 sessionID:v57 isUPlusOne:v95];

        id v50 = objc_alloc_init((Class)IMMessageContext);
        [v50 setShouldBoost:1];
        long long v58 = +[IDSDaemon sharedInstance];
        long long v59 = [(IDSDSession *)self sharedState];
        BOOL v60 = [v59 pushTopic];
        long long v61 = [v58 broadcasterForTopic:v60 entitlement:kIDSSessionEntitlement command:0 messageContext:v50];

        id v62 = [(IDSDSession *)self sharedState];
        id v63 = [v62 uniqueID];
        [v61 sessionDidLeaveGroup:v63 error:v104];

        if (v104) {
          self->_reason = -[IDSDSession globalLinkErrorToSessionEndReason:](self, "globalLinkErrorToSessionEndReason:", [v104 code]);
        }
        [(IDSDSession *)self _reportRTC];
        self->_groupSessionState = 2;
      }
LABEL_48:
      id v64 = +[IDSGroupEncryptionController sharedInstance];
      v65 = [(IDSDSession *)self sharedState];
      CFStringRef v66 = [v65 groupID];
      [v64 removeAccountForGroup:v66];
    }
  }
  else
  {
  }
LABEL_49:
  BOOL v67 = [(IDSDSession *)self sharedState];
  unsigned int v68 = [v67 uniqueID];
  [(IDSDSession *)self _closeSocketToDevice:v68];

  [(IDSDSession *)self _closeSocketToDevice:kIDSDefaultPairedDeviceID];
  id v69 = [(IDSDSession *)self sharedState];
  LODWORD(v68) = [v69 enableQuickRelay];

  if (v68)
  {
    [(IDSDSession *)self _cleanupQuickRelaySession];
  }
  else
  {
    v70 = [(IDSDSession *)self utunController];
    id v71 = [(IDSDSession *)self sharedState];
    long long v72 = [v71 uniqueID];
    [v70 stopUDPGlobalLinkForDevice:v72];
  }
  id v73 = [(IDSDSession *)self sharedState];
  BOOL v74 = [v73 clientType] == (id)4;

  if (v74)
  {
    unsigned int v75 = [(IDSDSession *)self sharedState];
    uint64_t v76 = [v75 uniqueID];
    id v77 = [v76 copy];

    dispatch_time_t v78 = dispatch_time(0, 5000000000);
    CFStringRef v79 = im_primary_queue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000A5380;
    block[3] = &unk_10097E4D0;
    id v108 = v77;
    id v80 = v77;
    dispatch_after(v78, v79, block);
  }
  CFStringRef v81 = [(IDSDSession *)self sharedState];
  if ([v81 sharedSession] && self->_groupSessionState == 2)
  {
    __int16 v82 = [(IDSDSession *)self sharedState];
    BOOL v83 = [v82 state] == 8;

    if (!v83)
    {
      uint64_t v84 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
      {
        double v85 = [(IDSGroupStatusNotificationParameters *)self->_groupStatusNotificationParams participantID];
        *(_DWORD *)buf = 138412290;
        v110 = v85;
        _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "The client left the group session. IDSGroupSession can be removed. _groupStatusNotificationParams.participantID = %@", buf, 0xCu);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          CFStringRef v94 = [(IDSGroupStatusNotificationParameters *)self->_groupStatusNotificationParams participantID];
          _IDSLogTransport();

          if (_IDSShouldLog())
          {
            CFStringRef v94 = [(IDSGroupStatusNotificationParameters *)self->_groupStatusNotificationParams participantID];
            _IDSLogV();
          }
        }
      }
      uint64_t v86 = [(IDSDSession *)self sharedState];
      v87 = [v86 uniqueID];
      id v88 = [v87 copy];

      int v89 = im_primary_queue();
      v105[0] = _NSConcreteStackBlock;
      v105[1] = 3221225472;
      v105[2] = sub_1000A5404;
      v105[3] = &unk_10097E440;
      v105[4] = self;
      id v106 = v88;
      id v90 = v88;
      dispatch_block_t v91 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, v105);
      dispatch_async(v89, v91);
    }
  }
  else
  {
  }
LABEL_65:
  [(IDSDSession *)self setShouldConnectToQRServer:0];
  v92 = [(IDSDSession *)self sharedState];
  [v92 setState:8];

  IDSTransportThreadAddBlock();
  self->_double channelDataCachedTime = 0.0;
}

- (void)_resetPreferences:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  [v4 setObject:&off_1009D0D68 forKey:@"PacketsPerSecond"];
  [v4 setObject:&off_1009D0D68 forKey:@"InputBytesPerSecond"];
  [v4 setObject:&off_1009D0D68 forKey:@"OutputBytesPerSecond"];
  [v4 removeObjectForKey:@"Intent"];
  double v5 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v15 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Resetting preferences for service %{public}@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v11 = v3;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v11 = v3;
        _IDSLogV();
      }
    }
  }
  id v6 = +[IDSLinkPreferencesManager sharedInstance];
  uint64_t v7 = +[NSDictionary dictionaryWithDictionary:v4];
  [v6 updateService:v3 withPreferences:v7];

  id v8 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A57BC;
  block[3] = &unk_10097E4D0;
  id v13 = v3;
  id v9 = v3;
  dispatch_block_t v10 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, block);
  dispatch_async(v8, v10);
}

- (void)_closeSocketToDevice:(id)a3
{
  id v4 = a3;
  [(IDSDSession *)self _checkAndUnassertRealTimeMode];
  if (self->_bypassUTun)
  {
    connectionContext = self->_connectionContext;
    self->_connectionContext = 0;
  }
  id v6 = [(IDSDSession *)self sharedState];
  unsigned __int8 v7 = [v6 useQRDirectly];

  if ((v7 & 1) == 0)
  {
    id v8 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Closing socket for session", buf, 2u);
    }

    id v9 = [(IDSDSession *)self sharedState];
    dispatch_block_t v10 = [v9 serviceName];
    DLCSessionLogWithLevel();

    id v11 = [(IDSDSession *)self utunController];
    id v12 = [(IDSDSession *)self _acceptedDeviceUniqueID];
    id v13 = [(IDSDSession *)self _acceptedDeviceToken];
    id v14 = [v13 rawToken];
    id v15 = [(IDSDSession *)self _socketOptionsForDevice:v4 uniqueID:v12 pushToken:v14 connectionSuffix:0];
    [v11 closeSocketWithOptions:v15];

    CFStringRef v16 = [(IDSDSession *)self sharedState];
    id v17 = [v16 connectionCountHint];

    if ((unint64_t)v17 >= 2)
    {
      CFStringRef v18 = [(IDSDSession *)self sharedState];
      self->_extraConnectionCount = (unint64_t)[v18 connectionCountHint] - 1;

      if (self->_extraConnectionCount)
      {
        unint64_t v19 = 0;
        do
        {
          id v20 = [(IDSDSession *)self utunController];
          CFStringRef v21 = [(IDSDSession *)self _acceptedDeviceUniqueID];
          id v22 = [(IDSDSession *)self _acceptedDeviceToken];
          __int16 v23 = [v22 rawToken];
          unsigned int v24 = +[NSString stringWithFormat:@"-%d", v19];
          __int16 v25 = [(IDSDSession *)self _socketOptionsForDevice:v4 uniqueID:v21 pushToken:v23 connectionSuffix:v24];
          [v20 closeSocketWithOptions:v25];

          ++v19;
        }
        while (self->_extraConnectionCount > v19);
      }
    }
    id v26 = self;
    objc_sync_enter(v26);
    BOOL v27 = [(NSMutableDictionary *)v26->_extraConnections allValues];
    unsigned int v28 = +[NSMutableArray arrayWithArray:v27];

    if (v26->_socketDescriptor != -1)
    {
      __int16 v29 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
      [v28 addObject:v29];

      v26->_uint64_t socketDescriptor = -1;
    }
    [(NSMutableDictionary *)v26->_extraConnections removeAllObjects];
    objc_sync_exit(v26);

    if ([v28 count])
    {
      id v30 = v28;
      IDSTransportThreadAddBlock();
    }
  }
  [(IDSDSession *)self _notifyClientsSessionStopped];
}

- (id)_socketOptionsForDevice:(id)a3 uniqueID:(id)a4 pushToken:(id)a5 connectionSuffix:(id)a6
{
  id value = a3;
  id v10 = a4;
  id v63 = a5;
  id v11 = a6;
  id v12 = [(IDSDSession *)self accountController];
  id v13 = [(IDSDSession *)self sharedState];
  id v14 = [v13 accountID];
  id v15 = [v12 accountWithUniqueID:v14];
  v65 = [v15 service];

  CFStringRef v16 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  id v17 = v16;
  if (IDSOpenSocketOptionAccountDefault) {
    CFDictionarySetValue(v16, @"account", IDSOpenSocketOptionAccountDefault);
  }
  CFStringRef v18 = [v65 identifier];
  if (v18) {
    CFDictionarySetValue(v17, @"service", v18);
  }

  unint64_t v19 = [(IDSDSession *)self sharedState];
  id v20 = [v19 uniqueID];
  CFStringRef v21 = v20;
  if (v11)
  {
    uint64_t v22 = [v20 stringByAppendingString:v11];

    CFStringRef v21 = (void *)v22;
  }

  if (v21) {
    CFDictionarySetValue(v17, IDSOpenSocketOptionStreamNameKey, v21);
  }

  if (value) {
    CFDictionarySetValue(v17, IDSOpenSocketOptionCBUUIDKey, value);
  }
  __int16 v23 = [(IDSDSession *)self sharedState];
  unsigned int v24 = [v23 remoteUseCloudPairedControlChannel];

  if (v24 && v10) {
    CFDictionarySetValue(v17, IDSOpenSocketOptionDeviceUniqueIDKey, v10);
  }
  __int16 v25 = [(IDSDSession *)self sharedState];
  if ([v25 isScreenSharingSession]) {
    id v26 = &off_1009D0DF8;
  }
  else {
    id v26 = &off_1009D0E10;
  }

  CFDictionarySetValue(v17, IDSOpenSocketOptionPriorityKey, v26);
  CFDictionarySetValue(v17, IDSOpenSocketOptionPhoneCallKey, &__kCFBooleanTrue);
  CFDictionarySetValue(v17, IDSOpenSocketOptionIsIDSDSessionSocket, &__kCFBooleanTrue);
  BOOL v27 = [(IDSDSession *)self sharedState];
  unsigned int v28 = [v27 peerProtocolVersion];

  if (v28 >= 2) {
    CFDictionarySetValue(v17, IDSOpenSocketOptionSRTPProtocolVersionKey, &off_1009D0CF0);
  }
  __int16 v29 = [(IDSDSession *)self sharedState];
  id v30 = [v29 localUnauthenticatedFullIdentity];
  if (v30)
  {
    __int16 v31 = [(IDSDSession *)self sharedState];
    __int16 v32 = [v31 remoteUnauthenticatedPublicIdentity];

    if (v32)
    {
      CFStringRef v33 = [IDSUTunControlChannelIdentityPair alloc];
      unsigned int v34 = [(IDSDSession *)self sharedState];
      CFStringRef v35 = [v34 localUnauthenticatedFullIdentity];
      BOOL v36 = [(IDSDSession *)self sharedState];
      id v37 = [v36 remoteUnauthenticatedPublicIdentity];
      double v38 = [(IDSUTunControlChannelIdentityPair *)v33 initWithLocalFullIdentity:v35 remotePublicIdentity:v37];

      int v39 = v38;
      if (v39)
      {
        CFDictionarySetValue(v17, IDSOpenSocketOptionUnauthenticatedIdentityPair, v39);
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_10070DE5C();
      }
    }
  }
  else
  {
  }
  id v40 = [(IDSDSession *)self sharedState];
  BOOL v41 = [v40 transportType] == 0;

  if (v41) {
    CFDictionarySetValue(v17, @"protocol", @"udp");
  }
  if (!v10 && ![(IDSDSession *)self isWithDefaultPairedDevice])
  {
    uint64_t v42 = [(IDSDSession *)self sharedState];
    unsigned int v43 = [v42 disableRemoteDeviceEncryption];

    if (v43)
    {
      uint64_t v70 = IDSUTunControlChannelRemoteDeviceEncryptionInfo_UNENCRYPTED_Key;
      id v71 = &__kCFBooleanTrue;
      id v44 = +[NSDictionary dictionaryWithObjects:&v71 forKeys:&v70 count:1];
      if (v44) {
        CFDictionarySetValue(v17, IDSOpenSocketOptionRemoteDeviceEncryptionInfoKey, v44);
      }
    }
    else
    {
      id v45 = [(IDSDSession *)self sharedState];
      id v46 = [v45 destinations];
      id v44 = [v46 anyObject];

      id v47 = [(IDSDSession *)self getFromService];
      id v48 = [(IDSDSession *)self sharedState];
      unsigned int v49 = [v48 fromURI];
      id v50 = [v49 unprefixedURI];
      id v62 = [v50 _bestGuessURI];

      uint64_t v51 = [(IDSDSession *)self getCallerCert];
      id v52 = (void *)v51;
      if (v44 && v65 && v62 && v51)
      {
        v68[0] = IDSUTunControlChannelRemoteDeviceEncryptionInfoRemoteTokenURIKey;
        __int16 v53 = [v44 prefixedURI];
        v69[0] = v53;
        v69[1] = v47;
        v68[1] = IDSUTunControlChannelRemoteDeviceEncryptionInfoServiceKey;
        v68[2] = IDSUTunControlChannelRemoteDeviceEncryptionInfoMyURIKey;
        v68[3] = IDSUTunControlChannelRemoteDeviceEncryptionInfoMyIdentityKey;
        v69[2] = v62;
        v69[3] = v52;
        uint64_t v54 = +[NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:4];

        if (v54) {
          CFDictionarySetValue(v17, IDSOpenSocketOptionRemoteDeviceEncryptionInfoKey, v54);
        }
      }
    }
  }
  id v55 = [(IDSDSession *)self sharedState];
  unsigned int v56 = [v55 disableEncryption];

  if (v56) {
    CFDictionarySetValue(v17, IDSOpenSocketOptionEncryptionMethodKey, &off_1009D0D38);
  }
  connectionContext = self->_connectionContext;
  if (connectionContext) {
    CFDictionarySetValue(v17, @"connectionContext", connectionContext);
  }
  long long v58 = [(IDSDSession *)self sharedState];
  unsigned int v59 = [v58 useBTDatagramPipe];

  if (v59) {
    CFDictionarySetValue(v17, IDSOpenSocketOptionRealTimeKey, &__kCFBooleanTrue);
  }
  BOOL v60 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    BOOL v67 = v17;
    _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "Made options to open socket %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }

  return v17;
}

- (id)_acceptedDeviceUniqueID
{
  id v3 = +[IDSFoundationLog IDSDSession];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(IDSDSession *)self destinations];
    *(_DWORD *)buf = 138412290;
    __int16 v25 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Looking for device unique ID in: %@", buf, 0xCu);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  double v5 = [(IDSDSession *)self destinations];
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v20;
    *(void *)&long long v7 = 138412290;
    long long v18 = v7;
    while (2)
    {
      for (int i = 0; i != v8; int i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "pushToken", v18);
        id v12 = +[IDSFoundationLog IDSDSession];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v18;
          __int16 v25 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "  => Push token: %@", buf, 0xCu);
        }

        if (v11)
        {
          id v13 = +[IDSDAccountController sharedInstance];
          id v14 = [v11 rawToken];
          id v15 = [v13 deviceIDForPushToken:v14];

          CFStringRef v16 = +[IDSFoundationLog IDSDSession];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v18;
            __int16 v25 = v15;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "    => Found unique ID: %@", buf, 0xCu);
          }

          if ([v15 length])
          {

            goto LABEL_21;
          }
        }
      }
      id v8 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  double v5 = +[IDSFoundationLog IDSDSession];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "  => No unique ID found", buf, 2u);
  }
  id v15 = 0;
LABEL_21:

  return v15;
}

- (id)_acceptedDeviceToken
{
  id v3 = +[IDSFoundationLog IDSDSession];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(IDSDSession *)self destinations];
    *(_DWORD *)buf = 138412290;
    long long v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Looking for device token in: %@", buf, 0xCu);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v5 = [(IDSDSession *)self destinations];
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v16;
    *(void *)&long long v7 = 138412290;
    long long v14 = v7;
LABEL_5:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v5);
      }
      id v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "pushToken", v14);
      id v12 = +[IDSFoundationLog IDSDSession];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v14;
        long long v21 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "  => Push token: %@", buf, 0xCu);
      }

      if (v11) {
        break;
      }
      if (v8 == (id)++v10)
      {
        id v8 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          goto LABEL_5;
        }
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:

    double v5 = +[IDSFoundationLog IDSDSession];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "  => No token found", buf, 2u);
    }
    id v11 = 0;
  }

  return v11;
}

- (void)_checkAndUnassertRealTimeMode
{
  if (self->_assertedRealTimeMode)
  {
    self->_assertedRealTimeMode = 0;
    IDSTransportThreadAddBlock();
  }
}

- (void)_cleanupSocketPairConnection
{
  [(IDSBaseSocketPairConnection *)self->_baseSocketPairConnection endSession];
  baseSocketPairConnection = self->_baseSocketPairConnection;
  self->_baseSocketPairConnection = 0;
}

- (void)_notifyClientsSessionStopped
{
  id v3 = [(IDSDSession *)self sharedState];
  unsigned int v4 = [v3 state];

  if (v4 != 8)
  {
    double v5 = OSLogHandleForIDSCategory();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    id v6 = [(IDSDSession *)self sharedState];
    long long v7 = [v6 uniqueID];
    unint64_t reason = self->_reason;
    if (qword_100A4A5F0 != -1) {
      dispatch_once(&qword_100A4A5F0, &stru_100981768);
    }
    if ((unint64_t)[(id)qword_100A4A5E0 count] <= reason)
    {
      if (!byte_100A4A5E8)
      {
        uint64_t v10 = 0;
        goto LABEL_10;
      }
      if (!isRunningTests()) {
        abort();
      }
      throwsIDSAbortException();
    }
    uint64_t v9 = [(id)qword_100A4A5E0 objectAtIndex:reason];
    uint64_t v10 = +[NSString stringWithFormat:@"%@ (%d)", v9, reason];

LABEL_10:
    *(_DWORD *)buf = 138412546;
    int v39 = v7;
    __int16 v40 = 2112;
    BOOL v41 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Notifying client session %@ stopped with reason %@", buf, 0x16u);

LABEL_11:
    id v11 = [(IDSDSession *)self sharedState];
    id v12 = [v11 serviceName];
    id v13 = [(IDSDSession *)self sharedState];
    long long v14 = [v13 uniqueID];
    unint64_t v15 = self->_reason;
    if (qword_100A4A5F0 != -1) {
      dispatch_once(&qword_100A4A5F0, &stru_100981768);
    }
    if ((unint64_t)[(id)qword_100A4A5E0 count] <= v15)
    {
      if (!byte_100A4A5E8)
      {
        long long v17 = 0;
LABEL_18:
        DLCSessionLogWithLevel();

        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        -[__CFDictionary setObject:forKeyedSubscript:](Mutable, "setObject:forKeyedSubscript:", &off_1009D0E28, IDSDSessionReportQREventSubTypeKey, v14, v17);
        long long v19 = +[NSNumber numberWithUnsignedInt:self->_reason];
        [(__CFDictionary *)Mutable setObject:v19 forKeyedSubscript:IDSDSessionReportResultCodeKey];

        [(IDSDSession *)self addQREventForRTCReport:Mutable];
        long long v20 = [(IDSDSession *)self sharedState];
        [v20 setState:8];

        if (self->_supressClientNotifications)
        {
          long long v21 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Session stopped notification suppressed", buf, 2u);
          }

          id v22 = [(IDSDSession *)self sharedState];
          id v23 = [v22 serviceName];
          DLCSessionLogWithLevel();
LABEL_34:

          [(IDSDSessionAvailabilityCheck *)self->_availabilityCheck availabilityTimerCancel];
          self->_shouldConnectToQRServer = 0;
          IDSTransportThreadAddBlock();

          return;
        }
        id v22 = objc_alloc_init((Class)IMMessageContext);
        [v22 setShouldBoost:1];
        id v24 = objc_alloc((Class)NSDictionary);
        unint64_t v25 = self->_reason;
        if (qword_100A4A5F0 != -1) {
          dispatch_once(&qword_100A4A5F0, &stru_100981768);
        }
        if ((unint64_t)[(id)qword_100A4A5E0 count] <= v25)
        {
          if (!byte_100A4A5E8)
          {
            BOOL v27 = 0;
            goto LABEL_29;
          }
          if (!isRunningTests()) {
            abort();
          }
          throwsIDSAbortException();
        }
        id v26 = [(id)qword_100A4A5E0 objectAtIndex:v25];
        BOOL v27 = +[NSString stringWithFormat:@"%@ (%d)", v26, v25];

LABEL_29:
        id v23 = objc_msgSend(v24, "initWithObjectsAndKeys:", v27, NSLocalizedDescriptionKey, 0);

        id v28 = objc_alloc((Class)NSError);
        id v29 = [v28 initWithDomain:IDSSessionErrorDomain code:self->_reason userInfo:v23];
        id v30 = +[IDSDaemon sharedInstance];
        __int16 v31 = [(IDSDSession *)self sharedState];
        __int16 v32 = [v31 pushTopic];
        CFStringRef v33 = [v30 broadcasterForTopic:v32 entitlement:kIDSSessionEntitlement command:0 messageContext:v22];

        unsigned int v34 = [(IDSDSession *)self sharedState];
        LODWORD(v32) = [v34 sharedSession];

        CFStringRef v35 = [(IDSDSession *)self sharedState];
        BOOL v36 = [v35 uniqueID];
        uint64_t v37 = self->_reason;
        if (v32) {
          [v33 groupSessionEnded:v36 withReason:v37 error:v29];
        }
        else {
          [v33 sessionEnded:v36 withReason:v37 error:v29];
        }

        goto LABEL_34;
      }
      if (!isRunningTests()) {
        abort();
      }
      throwsIDSAbortException();
    }
    long long v16 = [(id)qword_100A4A5E0 objectAtIndex:v15];
    long long v17 = +[NSString stringWithFormat:@"%@ (%d)", v16, v15];

    goto LABEL_18;
  }
}

- (void)endSessionWithReason:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = (NSDate *)objc_alloc_init((Class)NSDate);
  endDate = self->_endDate;
  self->_endDate = v6;

  os_unfair_lock_unlock(p_lock);
  id v8 = [(IDSDSession *)self sharedState];
  [v8 clearAllTimers];

  uint64_t v9 = [(IDSDSession *)self sharedState];
  unsigned int v10 = [v9 isScreenSharingSession];

  if (v10) {
    [(IDSDSession *)self submitAWDMetricsForIDSSessionWithEndReason:v3];
  }
  self->_unint64_t reason = v3;

  [(IDSDSession *)self _endSession];
}

- (id)sessionDuration
{
  if (self->_startDate)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    endDate = self->_endDate;
    if (endDate)
    {
      double v5 = endDate;
    }
    else
    {
      double v5 = +[NSDate date];
    }
    long long v7 = v5;
    os_unfair_lock_unlock(p_lock);
    [(NSDate *)v7 timeIntervalSinceDate:self->_startDate];
    double v6 = v8;
  }
  else
  {
    double v6 = 0.0;
  }

  return +[NSNumber numberWithDouble:v6];
}

- (id)connectDuration
{
  uint64_t v3 = self->_startDate;
  unsigned int v4 = [(IDSDSession *)self sharedState];
  double v5 = [v4 startConnectingDate];

  if (v5)
  {
    if (!v3)
    {
      uint64_t v3 = +[NSDate date];
    }
    double v6 = [(IDSDSession *)self sharedState];
    long long v7 = [v6 startConnectingDate];
    [(NSDate *)v3 timeIntervalSinceDate:v7];
    double v9 = v8;
  }
  else
  {
    double v9 = 0.0;
  }
  unsigned int v10 = +[NSNumber numberWithDouble:v9];

  return v10;
}

- (void)setAudioEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(IDSDSession *)self sharedState];
  unsigned int v6 = [v5 isScreenSharingSession];

  if (v6)
  {
    long long v7 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v8 = @"NO";
      if (v3) {
        CFStringRef v8 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v25 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Enabling audio ? %@", buf, 0xCu);
    }

    double v9 = [(IDSDSession *)self sharedState];
    unsigned int v10 = [v9 serviceName];
    CFStringRef v11 = @"NO";
    if (v3) {
      CFStringRef v11 = @"YES";
    }
    CFStringRef v23 = v11;
    DLCSessionLogWithLevel();

    id v12 = [(IDSDSession *)self sharedState];
    id v13 = [v12 connection];
    [v13 setAudioEnabled:v3];

    id v14 = objc_alloc_init((Class)IMMessageContext);
    [v14 setShouldBoost:1];
    unint64_t v15 = +[IDSDaemon sharedInstance];
    long long v16 = [(IDSDSession *)self sharedState];
    long long v17 = [v16 pushTopic];
    long long v18 = [v15 broadcasterForTopic:v17 entitlement:kIDSSessionEntitlement command:0 messageContext:v14];

    long long v19 = [(IDSDSession *)self sharedState];
    long long v20 = [v19 uniqueID];
    long long v21 = [(IDSDSession *)self sharedState];
    id v22 = [v21 connection];
    objc_msgSend(v18, "session:audioEnabled:", v20, objc_msgSend(v22, "getAudioEnabled"));
  }
}

- (void)setMuted:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(IDSDSession *)self sharedState];
  unsigned int v6 = [v5 isScreenSharingSession];

  if (v6)
  {
    long long v7 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v8 = @"NO";
      if (v3) {
        CFStringRef v8 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v25 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Muting ? %@", buf, 0xCu);
    }

    double v9 = [(IDSDSession *)self sharedState];
    unsigned int v10 = [v9 serviceName];
    CFStringRef v11 = @"NO";
    if (v3) {
      CFStringRef v11 = @"YES";
    }
    CFStringRef v23 = v11;
    DLCSessionLogWithLevel();

    id v12 = [(IDSDSession *)self sharedState];
    id v13 = [v12 connection];
    [v13 setMuted:v3];

    id v14 = objc_alloc_init((Class)IMMessageContext);
    [v14 setShouldBoost:1];
    unint64_t v15 = +[IDSDaemon sharedInstance];
    long long v16 = [(IDSDSession *)self sharedState];
    long long v17 = [v16 pushTopic];
    long long v18 = [v15 broadcasterForTopic:v17 entitlement:kIDSSessionEntitlement command:0 messageContext:v14];

    long long v19 = [(IDSDSession *)self sharedState];
    long long v20 = [v19 uniqueID];
    long long v21 = [(IDSDSession *)self sharedState];
    id v22 = [v21 connection];
    objc_msgSend(v18, "session:muted:", v20, objc_msgSend(v22, "muted"));
  }
}

- (void)setPreferences:(id)a3
{
  id v4 = a3;
  double v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting preferences %@", buf, 0xCu);
  }

  unsigned int v6 = [(IDSDSession *)self sharedState];
  long long v7 = [v6 serviceName];
  DLCSessionLogWithLevel();

  CFStringRef v8 = [(IDSDSession *)self invitationManager];
  [v8 setPreferences:v4];

  double v9 = [v4 objectForKey:kIDSQRAllocateKey_RelayLinkProtocol];
  if (v9) {
    [(IDSDSession *)self _setLinkProtocol:v9];
  }
  unsigned int v10 = [v4 objectForKey:IDSSessionDisallowWifiInterfaceKey];
  self->_disallowWifiInterface = [v10 BOOLValue];

  CFStringRef v11 = [v4 objectForKey:IDSSessionDisallowCellularInterfaceKey];
  self->_BOOL disallowCellularInterface = [v11 BOOLValue];

  id v12 = [v4 objectForKey:IDSSessionPreferCellularForCallSetupKey];
  self->_preferCellularForCallSetup = [v12 BOOLValue];

  id v13 = [v4 objectForKey:IDSSessionForceInternetInvitationKey];
  id v14 = [v13 BOOLValue];
  unint64_t v15 = [(IDSDSession *)self sharedState];
  [v15 setForceInternetInvitation:v14];

  long long v16 = [v4 objectForKey:IDSSessionClientUUIDKey];
  if (v16)
  {
    id v17 = [objc_alloc((Class)NSUUID) initWithUUIDString:v16];
    long long v18 = [(IDSDSession *)self sharedState];
    [v18 setClientUUID:v17];
  }
}

- (void)setRequiredCapabilities:(id)a3 requiredLackOfCapabilities:(id)a4
{
  id v74 = a3;
  id v73 = a4;
  unsigned int v6 = [(IDSDSession *)self sharedState];
  long long v7 = [v6 requiredCapabilities];
  id v8 = [v7 count];

  id v9 = [v74 count];
  unsigned int v10 = [(IDSDSession *)self sharedState];
  CFStringRef v11 = [v10 requiredCapabilities];
  id v94 = 0;
  id v95 = 0;
  id v93 = 0;
  int v12 = sub_1000A84E0(v11, v74, &v95, &v94, &v93);
  id v68 = v95;
  id v70 = v94;
  id v69 = v93;

  if (v12)
  {
    id v13 = [(IDSDSession *)self sharedState];
    [v13 setRequiredCapabilities:v74];
  }
  id v14 = [(IDSDSession *)self sharedState];
  unint64_t v15 = [v14 requiredLackOfCapabilities];
  id v16 = [v15 count];

  id v17 = [v73 count];
  long long v18 = [(IDSDSession *)self sharedState];
  long long v19 = [v18 requiredLackOfCapabilities];
  id v91 = 0;
  id v92 = 0;
  id v90 = 0;
  int v20 = sub_1000A84E0(v19, v73, &v92, &v91, &v90);
  id v65 = v92;
  id v67 = v91;
  id v66 = v90;

  if (v20)
  {
    long long v21 = [(IDSDSession *)self sharedState];
    [v21 setRequiredLackOfCapabilities:v73];
  }
  if (!v12)
  {
    id v22 = 0;
    id v23 = 0;
    id v24 = 0;
    id v72 = 0;
    if (!v20) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  id v88 = 0;
  id v89 = 0;
  id v86 = 0;
  id v87 = 0;
  sub_1000A8764(v8 != 0, v9 != 0, v68, v70, v69, &v89, &v88, &v87, &v86);
  id v22 = v89;
  id v23 = v88;
  id v72 = v87;
  id v24 = v86;
  if (v20)
  {
LABEL_9:
    CFStringRef v25 = v23;
    id v84 = v22;
    id v85 = v23;
    id v82 = v72;
    id v83 = v24;
    sub_1000A8764(v16 != 0, v17 != 0, v65, v67, v66, &v85, &v84, &v83, &v82);
    id v23 = v85;

    id v26 = v84;
    id v27 = v83;

    id v28 = v82;
    id v22 = v26;
    id v24 = v27;
    id v72 = v28;
  }
LABEL_10:
  if ([v22 count]) {
    BOOL v29 = 1;
  }
  else {
    BOOL v29 = [v23 count] != 0;
  }
  id v71 = v23;
  if ([v24 count]) {
    BOOL v30 = 1;
  }
  else {
    BOOL v30 = [v72 count] != 0;
  }
  if ((v12 & 1) == 0 && [v74 count])
  {
    if (v29)
    {
      if (!v22) {
        id v22 = objc_alloc_init((Class)NSMutableSet);
      }
      __int16 v32 = objc_msgSend(v74, "__imSetFromArray");
      [v22 unionSet:v32];
    }
    if (v30)
    {
      if (!v24) {
        id v24 = objc_alloc_init((Class)NSMutableSet);
      }
      CFStringRef v33 = objc_msgSend(v74, "__imSetFromArray");
      [v24 unionSet:v33];
    }
  }
  if ((v20 & 1) == 0 && [v73 count])
  {
    if (v29)
    {
      if (!v71) {
        id v71 = objc_alloc_init((Class)NSMutableSet);
      }
      unsigned int v34 = objc_msgSend(v73, "__imSetFromArray");
      [v71 unionSet:v34];
    }
    if (v30)
    {
      if (!v24) {
        id v24 = objc_alloc_init((Class)NSMutableSet);
      }
      CFStringRef v35 = objc_msgSend(v73, "__imSetFromArray");
      [v24 unionSet:v35];
    }
  }
  if (self->_groupSessionState == 1 && (v29 || v30))
  {
    BOOL v36 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v37 = [(IDSDSession *)self sharedState];
      uint64_t v38 = [v37 groupID];
      int v39 = (void *)v38;
      CFStringRef v40 = @"NO";
      if (v29) {
        CFStringRef v41 = @"YES";
      }
      else {
        CFStringRef v41 = @"NO";
      }
      *(_DWORD *)buf = 138412802;
      uint64_t v97 = v38;
      CFStringRef v99 = v41;
      __int16 v98 = 2112;
      if (v30) {
        CFStringRef v40 = @"YES";
      }
      __int16 v100 = 2112;
      CFStringRef v101 = v40;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "setRequiredCapabilities triggered leave to unsupported members {groupID: %@, needToSendJoin: %@, needToSendLeave: %@}", buf, 0x20u);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      uint64_t v42 = [(IDSDSession *)self sharedState];
      unsigned int v43 = [v42 groupID];
      if (v29) {
        CFStringRef v44 = @"YES";
      }
      else {
        CFStringRef v44 = @"NO";
      }
      if (v30) {
        CFStringRef v45 = @"YES";
      }
      else {
        CFStringRef v45 = @"NO";
      }
      _IDSLogTransport();

      if (_IDSShouldLog())
      {
        id v46 = [(IDSDSession *)self sharedState];
        id v62 = [v46 groupID];
        _IDSLogV();
      }
    }
    id v47 = im_primary_queue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000A8928;
    block[3] = &unk_100981250;
    BOOL v80 = v30;
    void block[4] = self;
    id v76 = v24;
    id v77 = v72;
    BOOL v81 = v29;
    id v78 = v22;
    id v79 = v71;
    dispatch_block_t v48 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, block);
    dispatch_async(v47, v48);
  }
  else
  {
    unsigned int v49 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      id v50 = [(IDSDSession *)self sharedState];
      uint64_t v51 = [v50 groupID];
      id v52 = (void *)v51;
      CFStringRef v53 = @"NO";
      unsigned int groupSessionState = self->_groupSessionState;
      *(_DWORD *)buf = 138413058;
      if (v29) {
        CFStringRef v55 = @"YES";
      }
      else {
        CFStringRef v55 = @"NO";
      }
      uint64_t v97 = v51;
      if (v30) {
        CFStringRef v53 = @"YES";
      }
      __int16 v98 = 2112;
      CFStringRef v99 = v55;
      __int16 v100 = 2112;
      CFStringRef v101 = v53;
      __int16 v102 = 1024;
      unsigned int v103 = groupSessionState;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "setRequiredCapabilities not triggering a leave to unsupported members {groupID: %@, needToSendJoin: %@, needToSendLeave: %@, groupSessionState: %d}", buf, 0x26u);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      unsigned int v56 = [(IDSDSession *)self sharedState];
      unint64_t v57 = [v56 groupID];
      long long v58 = v29 ? @"YES" : @"NO";
      unsigned int v59 = v30 ? @"YES" : @"NO";
      uint64_t v63 = self->_groupSessionState;
      _IDSLogTransport();

      if (_IDSShouldLog())
      {
        BOOL v60 = [(IDSDSession *)self sharedState];
        long long v61 = [v60 groupID];
        _IDSLogV();
      }
    }
  }
}

- (void)setQuickRelayUserTypeForSession:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  double v5 = +[IDSFoundationLog IDSDSession];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = [(IDSDSession *)self sharedState];
    long long v7 = [v6 uniqueID];
    int v9 = 138412546;
    unsigned int v10 = v7;
    __int16 v11 = 1024;
    int v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "setQuickRelayUserTypeForSession called for session: %@ with userType: %u", (uint8_t *)&v9, 0x12u);
  }
  id v8 = +[NSNumber numberWithUnsignedShort:v3];
  [(IDSGroupStatusNotificationParameters *)self->_groupStatusNotificationParams setQuickRelayUserType:v8];
}

- (void)enableP2Plinks
{
  self->_disableP2PLinks = 0;
  uint64_t v3 = +[IDSFoundationLog IDSDSession];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(IDSDSession *)self sharedState];
    double v5 = [v4 uniqueID];
    int v9 = 138412290;
    unsigned int v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "enableP2Plinks called for session: %@", (uint8_t *)&v9, 0xCu);
  }
  unsigned int v6 = [(IDSDSession *)self utunController];
  long long v7 = [(IDSDSession *)self sharedState];
  id v8 = [v7 uniqueID];
  [v6 setAllowP2PforIDSSession:v8 isEnabled:1];
}

- (void)setForceTCPFallbackOnWiFiUsingReinitiate:(BOOL)a3
{
  BOOL v3 = a3;
  self->_forceTCPFallbackOnWiFint i = a3;
  double v5 = [(IDSDSession *)self utunController];
  unsigned int v6 = [(IDSDSession *)self sharedState];
  long long v7 = [v6 uniqueID];
  [v5 setForceTCPFallbackOnWiFi:v7 forceTCPFallbackOnWiFi:v3];

  [(IDSDSession *)self reconnectSession];
}

- (void)setForceTCPFallbackOnCellUsingReinitiate:(BOOL)a3
{
  BOOL v3 = a3;
  self->_forceTCPFallbackOnCell = a3;
  double v5 = [(IDSDSession *)self utunController];
  unsigned int v6 = [(IDSDSession *)self sharedState];
  long long v7 = [v6 uniqueID];
  [v5 setForceTCPFallbackOnCell:v7 forceTCPFallbackOnCell:v3];

  [(IDSDSession *)self reconnectSession];
}

- (void)connection:(id)a3 didStart:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  unsigned int v10 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v11 = [(IDSDSession *)self sharedState];
    int v12 = [v11 uniqueID];
    CFStringRef v13 = @"NO";
    *(_DWORD *)buf = 138412802;
    BOOL v36 = v12;
    __int16 v37 = 2112;
    if (v6) {
      CFStringRef v13 = @"YES";
    }
    CFStringRef v38 = v13;
    __int16 v39 = 2112;
    id v40 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@ session did start %@ with error %@", buf, 0x20u);
  }
  id v14 = [(IDSDSession *)self sharedState];
  unint64_t v15 = [v14 serviceName];
  id v16 = [(IDSDSession *)self sharedState];
  uint64_t v17 = [v16 uniqueID];
  long long v18 = (void *)v17;
  CFStringRef v19 = @"NO";
  if (v6) {
    CFStringRef v19 = @"YES";
  }
  CFStringRef v34 = v19;
  uint64_t v33 = v17;
  DLCSessionLogWithLevel();

  int v20 = [(IDSDSession *)self sharedState];
  [v20 clearAllTimers];

  if (v6)
  {
    id v21 = objc_alloc_init((Class)IMMessageContext);
    [v21 setShouldBoost:1];
    id v22 = +[IDSDaemon sharedInstance];
    id v23 = [(IDSDSession *)self sharedState];
    id v24 = [v23 pushTopic];
    CFStringRef v25 = [v22 broadcasterForTopic:v24 entitlement:kIDSSessionEntitlement command:0 messageContext:v21];

    id v26 = [(IDSDSession *)self sharedState];
    id v27 = [v26 uniqueID];
    [v25 sessionStarted:v27];

    id v28 = [(IDSDSession *)self sharedState];
    [v28 setState:5];

    BOOL v29 = (NSDate *)objc_alloc_init((Class)NSDate);
    startDate = self->_startDate;
    self->_startDate = v29;
  }
  else
  {
    __int16 v31 = [(IDSDSession *)self sharedState];
    unsigned int v32 = [v31 isScreenSharingSession];

    if (v32) {
      [(IDSDSession *)self handleAVConferenceError:v9];
    }
    [(IDSDSession *)self _notifyClientsSessionStopped];
  }
  [(IDSDSession *)self submitAWDMetricsForIDSSessionConnected];
}

- (void)connectionDidStop:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(IDSDSession *)self sharedState];
    unsigned int v10 = [v9 uniqueID];
    *(_DWORD *)buf = 138412546;
    id v16 = v10;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ session did stop with error %@", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      __int16 v11 = [(IDSDSession *)self sharedState];
      CFStringRef v13 = [v11 uniqueID];
      id v14 = v7;
      _IDSLogTransport();

      if (_IDSShouldLog())
      {
        int v12 = [(IDSDSession *)self sharedState];
        CFStringRef v13 = [v12 uniqueID];
        id v14 = v7;
        _IDSLogV();
      }
    }
  }
  if (v7) {
    [(IDSDSession *)self handleAVConferenceError:v7];
  }
  [(IDSDSession *)self _cleanupSessionConnection];
  [(IDSDSession *)self endSessionWithReason:12];
}

- (void)handleAVConferenceError:(id)a3
{
  id v4 = a3;
  double v5 = +[IDSFoundationLog IDSDSession];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(IDSDSession *)self uniqueID];
    *(_DWORD *)buf = 138412546;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Session: %@ received error: %@", buf, 0x16u);
  }
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v7 = +[IDSFoundationLog IDSDSession];
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v13 = [(IDSDSession *)self uniqueID];
      id v14 = (objc_class *)objc_opt_class();
      unint64_t v15 = NSStringFromClass(v14);
      *(_DWORD *)buf = 138412802;
      id v18 = v13;
      __int16 v19 = 2112;
      id v20 = v4;
      __int16 v21 = 2112;
      id v22 = v15;
      _os_log_impl((void *)&_mh_execute_header, &v7->super, OS_LOG_TYPE_DEFAULT, "Invalid error type posted to session: %@   error: %@    class: %@", buf, 0x20u);
    }
  }
  else
  {
    id v7 = self;
    if ([(IDSDSession *)v7 state] == 2 || ![(IDSDSession *)v7 state])
    {
      int v12 = +[IDSFoundationLog IDSDSession];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Ignoring error, we're already dead anyway!", buf, 2u);
      }
      goto LABEL_13;
    }
    int v16 = 0;
    *(_DWORD *)buf = 0;
    id v8 = [v4 domain];
    unsigned int v9 = [v8 isEqualToString:IDSGKErrorDomain];

    if (v9) {
      sub_1002CE2F8((uint64_t)[v4 code], (int *)buf, &v16);
    }
    unsigned int v10 = [(IDSDSession *)v7 sharedState];
    id v11 = [v10 error];

    if (v11 != v4)
    {
      int v12 = [(IDSDSession *)v7 sharedState];
      [v12 setError:v4];
LABEL_13:
    }
  }
}

- (void)connection:(id)a3 receivedData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_baseSocketPairConnection) {
    goto LABEL_9;
  }
  id v8 = [(IDSDSession *)self sharedState];
  unsigned int v9 = [v8 encryptionInitialized];

  if (!v9)
  {
    id v14 = v7;
    goto LABEL_8;
  }
  uint64_t v10 = (uint64_t)[v7 length];
  if (v10 >= 1473)
  {
    id v11 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v43) = 1472;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Data size is bigger than %d, ending call...", buf, 8u);
    }

    int v12 = [(IDSDSession *)self sharedState];
    CFStringRef v13 = [v12 serviceName];
    DLCSessionLogWithLevel();

    -[IDSDSession endSessionWithReason:](self, "endSessionWithReason:", 19, 1472);
    goto LABEL_9;
  }
  size_t v15 = v10 - 4;
  if (v10 <= 4)
  {
    int v16 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Data size is too small, ending call...", buf, 2u);
    }
LABEL_13:

    __int16 v17 = [(IDSDSession *)self sharedState];
    id v18 = [v17 serviceName];
    DLCSessionLogWithLevel();

    [(IDSDSession *)self endSessionWithReason:19];
    goto LABEL_9;
  }
  id v7 = v7;
  __int16 v19 = (unsigned __int16 *)[v7 bytes];
  unsigned int v20 = __rev16(*v19);
  if (v20 == 57344)
  {
    __int16 v21 = v19;
    int v22 = *((unsigned __int8 *)v19 + 2);
    int v23 = *((unsigned __int8 *)v19 + 3);
    id v24 = (unsigned __int8 *)malloc_type_malloc(v15, 0xAB07258AuLL);
    if (!v24)
    {
      int v16 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Malloc error while decrypting, ending call...", buf, 2u);
      }
      goto LABEL_13;
    }
    CFStringRef v25 = v24;
    memcpy(v24, v21 + 2, v15);
    id v26 = [(IDSDSession *)self sharedState];
    unsigned int v27 = v23 | (v22 << 8);
    id v28 = [v26 encryptionState];

    int v29 = sub_100221370((uint64_t)v28, v27, v25, v15, 0);
    if (v29)
    {
      int v30 = v29;
      if (v29 != 4)
      {
        __int16 v31 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v43) = v30;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Stream decryption transform error %d", buf, 8u);
        }

        unsigned int v32 = [(IDSDSession *)self sharedState];
        uint64_t v33 = [v32 serviceName];
        DLCSessionLogWithLevel();
      }
      free(v25);
      goto LABEL_9;
    }
    id v14 = +[NSData dataWithBytesNoCopy:v25 length:v15 freeWhenDone:1];

    __int16 v37 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      id v43 = [v14 hash];
      __int16 v44 = 2048;
      id v45 = [v14 length];
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Received data Viceroy -> Daemon  (after decrypt data hash: %lu)  (length: %lu)", buf, 0x16u);
    }

    CFStringRef v38 = [(IDSDSession *)self sharedState];
    __int16 v39 = [v38 serviceName];
    id v40 = [v14 hash];
    id v41 = [v14 length];
    DLCSessionLogWithLevel();

LABEL_8:
    -[IDSBaseSocketPairConnection sendData:](self->_baseSocketPairConnection, "sendData:", v14, v40, v41);
    id v7 = v14;
    goto LABEL_9;
  }
  CFStringRef v34 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v43) = v20;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Magic number doesn't match 0x%04x, ignoring...", buf, 8u);
  }

  CFStringRef v35 = [(IDSDSession *)self sharedState];
  BOOL v36 = [v35 serviceName];
  DLCSessionLogWithLevel();

LABEL_9:
}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v7 hash];
    uint64_t v10 = [(IDSDSession *)self sharedState];
    *(_DWORD *)buf = 134218496;
    id v38 = v9;
    __int16 v39 = 1024;
    unsigned int v40 = [v10 seqSend];
    __int16 v41 = 2048;
    id v42 = [v7 length];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sending data Daemon -> Viceroy  (before encrypt data hash: %lu seq: %u)  (length: %lu)", buf, 0x1Cu);
  }
  id v11 = [(IDSDSession *)self sharedState];
  int v12 = [v11 serviceName];
  id v13 = [v7 hash];
  id v14 = [(IDSDSession *)self sharedState];
  id v15 = [v14 seqSend];
  id v36 = [v7 length];
  DLCSessionLogWithLevel();

  int v16 = [(IDSDSession *)self sharedState];
  LODWORD(v12) = [v16 encryptionInitialized];

  if (!v12) {
    goto LABEL_15;
  }
  __int16 v17 = (char *)[v7 length];
  id v18 = v17 + 4;
  __int16 v19 = malloc_type_malloc((size_t)(v17 + 4), 0xA78680DuLL);
  if (v19)
  {
    id v7 = v7;
    memcpy(v19 + 4, [v7 bytes], (size_t)v17);
    unsigned int v20 = [(IDSDSession *)self sharedState];
    id v21 = [v20 encryptionState];

    int v22 = [(IDSDSession *)self sharedState];
    uint64_t v23 = sub_100221370((uint64_t)v21, (unsigned __int16)[v22 seqSend], v19 + 4, (signed int)v17, 1);

    if (v23)
    {
      if (v23 != 4)
      {
        id v24 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v38) = v23;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Stream encryption transform error %d", buf, 8u);
        }

        CFStringRef v25 = [(IDSDSession *)self sharedState];
        id v26 = [v25 serviceName];
        DLCSessionLogWithLevel();

        -[IDSDSession endSessionWithReason:](self, "endSessionWithReason:", 18, v23);
      }
      free(v19);
      goto LABEL_16;
    }
    *(_WORD *)__int16 v19 = 224;
    int v30 = [(IDSDSession *)self sharedState];
    unsigned __int16 v31 = (unsigned __int16)[v30 seqSend];

    v19[2] = HIBYTE(v31);
    v19[3] = v31;
    uint64_t v32 = +[NSData dataWithBytesNoCopy:v19 length:v18 freeWhenDone:1];

    uint64_t v33 = [(IDSDSession *)self sharedState];
    objc_msgSend(v33, "setSeqSend:", objc_msgSend(v33, "seqSend") + 1);

    id v7 = (id)v32;
LABEL_15:
    CFStringRef v34 = [(IDSDSession *)self sharedState];
    CFStringRef v35 = [v34 connection];
    [v35 sendData:v7];

    goto LABEL_16;
  }
  unsigned int v27 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Malloc error while encrypting, ending call...", buf, 2u);
  }

  id v28 = [(IDSDSession *)self sharedState];
  int v29 = [v28 serviceName];
  DLCSessionLogWithLevel();

  [(IDSDSession *)self endSessionWithReason:18];
LABEL_16:
}

- (void)_setLinkProtocol:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  self->_linkProtocol = 2;
  if (v4)
  {
    id v6 = (const char *)[v4 UTF8String];
    if (strncasecmp(v6, "tcp", 3uLL) || !strncasecmp(v6, "tcpssl", 6uLL))
    {
      if (!strncasecmp(v6, "tcpssl", 6uLL) && sub_1000AA550((uint64_t)(v6 + 6), &self->_relayPort))
      {
        id v7 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          int relayPort = self->_relayPort;
          *(_DWORD *)buf = 67109120;
          int v13 = relayPort;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "use TCPSSL for QR, port: %u", buf, 8u);
        }

        if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLogTransport())
        {
          int64_t v9 = 4;
          goto LABEL_21;
        }
        _IDSLogTransport();
        int64_t v9 = 4;
        if (_IDSShouldLog()) {
          goto LABEL_18;
        }
        goto LABEL_21;
      }
    }
    else if (sub_1000AA550((uint64_t)(v6 + 3), &self->_relayPort))
    {
      uint64_t v10 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = self->_relayPort;
        *(_DWORD *)buf = 67109120;
        int v13 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "use TCP for QR, port: %u", buf, 8u);
      }

      if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLogTransport())
      {
        int64_t v9 = 3;
        goto LABEL_21;
      }
      _IDSLogTransport();
      int64_t v9 = 3;
      if (_IDSShouldLog()) {
LABEL_18:
      }
        _IDSLogV();
LABEL_21:
      self->_linkProtocol = v9;
    }
  }
}

- (void)addQREventForRTCReport:(id)a3
{
  id v4 = a3;
  double v5 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AA84C;
  block[3] = &unk_10097E440;
  void block[4] = self;
  id v6 = v4;
  id v13 = v6;
  dispatch_async(v5, block);

  id v7 = [v6 objectForKeyedSubscript:IDSDSessionReportQREventSubTypeKey];
  unsigned int v8 = [v7 unsignedIntValue];

  BOOL v9 = v8 - 312 > 0x15 || ((1 << (v8 - 56)) & 0x380003) == 0;
  if (!v9 || (v8 - 202 <= 0x14 ? (BOOL v10 = ((1 << (v8 + 54)) & 0x101081) == 0) : (BOOL v10 = 1), !v10 || v8 - 402 < 2))
  {
    id v11 = v6;
    IDSTransportThreadAddBlock();
  }
}

- (void)_sendQREventToAVC:(id)a3
{
  id v4 = a3;
  id v15 = 0;
  double v5 = +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:0 error:&v15];
  id v6 = v15;
  if (v6)
  {
    id v7 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v8 = [(IDSDSession *)self sharedState];
      BOOL v9 = [v8 groupID];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&unsigned char buf[24] = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<%@> _sendQREventToAVC failed to encode qrEvent for group %@ (error: %@)", buf, 0x20u);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      BOOL v10 = [(IDSDSession *)self sharedState];
      id v14 = [v10 groupID];
      _IDSLogV();
    }
  }
  else
  {
    id v11 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "<%@> _sendQREventToAVC: %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
    unint64_t v17 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v12;
    *(_OWORD *)&uint8_t buf[16] = v12;
    IDSByteBufferInitForWrite();
    id v13 = v5;
    [v13 bytes];
    [v13 length];
    IDSByteBufferWriteField();
    -[IDSDSession writeToClientChannel:packetBuffer:metaData:metadataSize:](self, "writeToClientChannel:packetBuffer:metaData:metadataSize:", self->_clientChannel, 0);
    IDSByteBufferRelease();
  }
}

- (void)link:(id)a3 didDisconnectForDeviceUniqueID:(id)a4 cbuuid:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v13 = self;
    __int16 v14 = 2112;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "<%@> link:%@ didDisconnectForDeviceUniqueID:%@ cbuuid:%@", buf, 0x2Au);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
}

- (void)link:(id)a3 didReceiveSKEData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&unsigned char buf[24] = [v7 length];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<%@> link:%@ didReceiveSKEData %d bytes.", buf, 0x1Cu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v18 = v6;
      id v19 = [v7 length];
      id v17 = self;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v9 = objc_msgSend(v7, "length", self, v6, v19);
        id v18 = v6;
        id v19 = v9;
        id v17 = self;
        _IDSLogV();
      }
    }
  }
  id v10 = [(IDSDSession *)self sharedState];
  if ([v10 useQRDirectly]) {
    goto LABEL_12;
  }
  id v11 = [(IDSDSession *)self sharedState];
  if ([v11 clientType] == (id)1)
  {
LABEL_11:

LABEL_12:
LABEL_13:
    [v7 length];
    unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v13;
    *(_OWORD *)&uint8_t buf[16] = v13;
    IDSByteBufferInitForWrite();
    IDSByteBufferWriteField();
    [v7 bytes];
    IDSByteBufferWriteField();
    -[IDSDSession writeToClientChannel:packetBuffer:metaData:metadataSize:](self, "writeToClientChannel:packetBuffer:metaData:metadataSize:", self->_clientChannel, 0);
    IDSByteBufferRelease();
    goto LABEL_14;
  }
  long long v12 = [(IDSDSession *)self sharedState];
  if ([v12 clientType] == (id)5)
  {

    goto LABEL_11;
  }
  __int16 v14 = [(IDSDSession *)self sharedState];
  BOOL v15 = [v14 clientType] == (id)6;

  if (v15) {
    goto LABEL_13;
  }
  __int16 v16 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = self;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "<%@> need a client channel to send the event kClientChannelMetadataType_PreConnectionDataKey", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
LABEL_14:
}

- (void)link:(id)a3 didReceiveKeyMaterialMessageData:(id)a4 fromParticipantIDs:(id)a5 toParticipantID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  long long v12 = (IDSDSession *)a5;
  id v13 = a6;
  __int16 v14 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    __int16 v41 = self;
    __int16 v42 = 2112;
    id v43 = v10;
    __int16 v44 = 2112;
    id v45 = v12;
    __int16 v46 = 2112;
    id v47 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "<%@> link:%@ didReceiveKeyMaterialMessageData from %@ to %@", buf, 0x2Au);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      uint64_t v32 = v12;
      id v33 = v13;
      int v30 = self;
      id v31 = v10;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        uint64_t v32 = v12;
        id v33 = v13;
        int v30 = self;
        id v31 = v10;
        _IDSLogV();
      }
    }
  }
  if (IMGetDomainBoolForKey())
  {
    BOOL v15 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      __int16 v41 = self;
      __int16 v42 = 2112;
      id v43 = v10;
      __int16 v44 = 2112;
      id v45 = v12;
      __int16 v46 = 2112;
      id v47 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "<%@> link:%@ didReceiveKeyMaterialMessageData from %@ to %@: ignoring because disableQRMaterialMessage is set", buf, 0x2Au);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
    goto LABEL_38;
  }
  __int16 v16 = [(IDSDSession *)self sharedState];
  if (([v16 useQRDirectly] & 1) == 0)
  {
    id v17 = [(IDSDSession *)self sharedState];
    if ([v17 clientType] != (id)1)
    {
      id v18 = [(IDSDSession *)self sharedState];
      if ([v18 clientType] != (id)5)
      {
        id v28 = [(IDSDSession *)self sharedState];
        BOOL v29 = [v28 clientType] == (id)6;

        if (!v29) {
          goto LABEL_38;
        }
        goto LABEL_20;
      }
    }
  }

LABEL_20:
  -[IDSDSession _getPushTokensFromParticipantIDArray:useNullPlaceholder:](self, "_getPushTokensFromParticipantIDArray:useNullPlaceholder:", v12, 0, v30, v31, v32, v33);
  id v19 = (IDSDSession *)objc_claimAutoreleasedReturnValue();
  if ([(IDSDSession *)v19 count])
  {
    unsigned int v20 = [(IDSDSession *)v12 firstObject];
    unint64_t v21 = [(IDSDSession *)self _getURIFromParticipantIDNumber:v20];
    int v22 = +[IDSURI URIWithPrefixedURI:v21];

    uint64_t v23 = [(IDSDSession *)self _getURIFromParticipantIDNumber:v13];
    id v24 = +[IDSURI URIWithPrefixedURI:v23];

    if (v22 && v24)
    {
      CFStringRef v25 = dispatch_get_global_queue(2, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000AB824;
      block[3] = &unk_1009812A0;
      id v35 = v11;
      id v36 = self;
      id v37 = v22;
      id v38 = v24;
      __int16 v39 = v19;
      dispatch_async(v25, block);
    }
    else
    {
      unsigned int v27 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        __int16 v41 = v19;
        __int16 v42 = 2112;
        id v43 = v22;
        __int16 v44 = 2112;
        id v45 = v24;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Could not process remote key material message from tokens %@ fromURI %@ toURI %@ (invalid)", buf, 0x20u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport();
          if (_IDSShouldLog()) {
            _IDSLogV();
          }
        }
      }
    }
  }
  else
  {
    id v26 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v41 = v12;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "didReceiveKeyMaterialMessageData couldn't find push tokens for participantIDs %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
  }

LABEL_38:
}

- (BOOL)shouldVerifySignatureForMaterialType:(int)a3
{
  return a3 != 6 && a3 != 12;
}

- (void)materialInfoError:(id)a3
{
  metricsCollector = self->_metricsCollector;
  id v4 = a3;
  id v5 = [(IDSGFTMetricsCollector *)metricsCollector error:@"m"];
  [v5 event:v4];
}

- (void)link:(id)a3 didReceiveMaterialInfo:(id)a4 material:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_isServerMaterialExchangeEnabled)
  {
    if ([v9 materialType] == 12 || objc_msgSend(v9, "materialType") == 6)
    {
      id v11 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v148) = [v9 materialType];
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "didReceiveMaterialInfo type: %d, ignoring (handled separately)", buf, 8u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          id v93 = [v9 materialType];
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            objc_msgSend(v9, "materialType", v93);
            _IDSLogV();
          }
        }
      }
      goto LABEL_89;
    }
    id v13 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v148 = (id *)v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "didReceiveMaterialInfo received material info: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        id v92 = v9;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          id v92 = v9;
          _IDSLogV();
        }
      }
    }
    __int16 v14 = objc_msgSend(v9, "materialContent", v92);
    JWDecodeDictionary();
    v126 = (id *)objc_claimAutoreleasedReturnValue();

    if (!v126)
    {
      id v17 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = [v9 materialContent];
        *(_DWORD *)buf = 138412290;
        uint64_t v148 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "didReceiveMaterialInfo could not decode content. Data: %@", buf, 0xCu);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          id v94 = [v9 materialContent];
          _IDSLogTransport();

          if (_IDSShouldLog())
          {
            id v94 = objc_msgSend(v9, "materialContent", v94);
            _IDSLogV();
          }
        }
      }
      [(IDSDSession *)self materialInfoError:@"couldNotDecodeContent", v94];
      goto LABEL_88;
    }
    BOOL v15 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v148 = v126;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "didReceiveMaterialInfo received material info content: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        id v94 = v126;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          id v94 = v126;
          _IDSLogV();
        }
      }
    }
    unsigned int v123 = -[IDSDSession shouldVerifySignatureForMaterialType:](self, "shouldVerifySignatureForMaterialType:", objc_msgSend(v9, "materialType", v94));
    if (v123)
    {
      CFStringRef v125 = [v126 objectForKeyedSubscript:@"payload"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v43 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v148 = v126;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "didReceiveMaterialInfo could not read data from payload. Content: %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport();
            if (_IDSShouldLog()) {
              _IDSLogV();
            }
          }
        }
        goto LABEL_87;
      }
      JWDecodeDictionary();
      id v122 = (id *)objc_claimAutoreleasedReturnValue();
      if (!v122)
      {
        __int16 v16 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v148 = v126;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "didReceiveMaterialInfo could not decode payload. Content: %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            id v95 = v126;
            _IDSLogTransport();
            if (_IDSShouldLog())
            {
              id v95 = v126;
              _IDSLogV();
            }
          }
        }
        [(IDSDSession *)self materialInfoError:@"couldNotDecodePayload", v95];
LABEL_87:

LABEL_88:
        goto LABEL_89;
      }
    }
    else
    {
      id v122 = v126;
      CFStringRef v125 = 0;
    }
    id v19 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v10 ownerParticipantId]);
    unsigned int v20 = [(IDSDSession *)self _getURIFromParticipantIDNumber:v19];
    unint64_t v21 = [(IDSDSession *)self sharedState];
    int v22 = [v21 serviceName];
    uint64_t v23 = +[IDSURI URIWithPrefixedURI:v20 withServiceLoggingHint:v22];

    id v24 = -[IDSDSession _getPushTokenFromParticipantID:](self, "_getPushTokenFromParticipantID:", [v10 ownerParticipantId]);
    CFStringRef v25 = [(IDSDSession *)self sharedState];
    id v26 = [v25 serviceName];
    unsigned int v27 = +[IDSPushToken pushTokenWithData:v24 withServiceLoggingHint:v26];

    if (!v23)
    {
      id v28 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v29 = (id *)[v10 ownerParticipantId];
        participantIDToURI = self->_participantIDToURI;
        *(_DWORD *)buf = 134218242;
        uint64_t v148 = v29;
        __int16 v149 = 2112;
        v150 = participantIDToURI;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "didReceiveMaterialInfo: did not find mapping from participantID %llu to URI in allocator; trying cache: %@",
          buf,
          0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          id v95 = (id *)[v10 ownerParticipantId];
          __int16 v98 = self->_participantIDToURI;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            id v95 = (id *)objc_msgSend(v10, "ownerParticipantId", v95, v98);
            __int16 v98 = self->_participantIDToURI;
            _IDSLogV();
          }
        }
      }
      os_unfair_lock_lock(&self->_lock);
      id v31 = self->_participantIDToURI;
      uint64_t v32 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v10 ownerParticipantId]);
      uint64_t v23 = [(NSMutableDictionary *)v31 objectForKeyedSubscript:v32];

      os_unfair_lock_unlock(&self->_lock);
    }
    if (!v27)
    {
      id v33 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v34 = (id *)[v10 ownerParticipantId];
        participantIDToPushToken = self->_participantIDToPushToken;
        *(_DWORD *)buf = 134218242;
        uint64_t v148 = v34;
        __int16 v149 = 2112;
        v150 = participantIDToPushToken;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "didReceiveMaterialInfo: did not find mapping from participantID %llu to push token in allocator; trying cache: %@",
          buf,
          0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          id v95 = (id *)[v10 ownerParticipantId];
          __int16 v98 = self->_participantIDToPushToken;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            id v95 = (id *)objc_msgSend(v10, "ownerParticipantId", v95, v98);
            __int16 v98 = self->_participantIDToPushToken;
            _IDSLogV();
          }
        }
      }
      os_unfair_lock_lock(&self->_lock);
      id v36 = self->_participantIDToPushToken;
      id v37 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v10 ownerParticipantId]);
      unsigned int v27 = [(NSMutableDictionary *)v36 objectForKeyedSubscript:v37];

      os_unfair_lock_unlock(&self->_lock);
    }
    if (v23)
    {
      if (v27
        && ([v27 rawToken],
            id v38 = objc_claimAutoreleasedReturnValue(),
            +[NSNull null],
            __int16 v39 = objc_claimAutoreleasedReturnValue(),
            unsigned int v40 = [v38 isEqual:v39],
            v39,
            v38,
            !v40))
      {
        if (sub_1004039F4(v23))
        {
          __int16 v46 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "didReceiveMaterialInfo dropping material info because it came from blocked URI", buf, 2u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport();
              if (_IDSShouldLog()) {
                _IDSLogV();
              }
            }
          }
        }
        else if ([v10 ownerParticipantId])
        {
          id v121 = [v23 URIByAddingOptionalPushToken:v27];
          if ([(IDSDSession *)self destinationsContainFromURI:v121]
            || [(IDSDSession *)self destinationsContainFromURI:v23])
          {
            if (objc_msgSend(v9, "materialType", v95, v98) == 13)
            {
              metricsCollector = self->_metricsCollector;
              dispatch_block_t v48 = [v27 rawToken];
              [(IDSGFTMetricsCollector *)metricsCollector receivedUnverifiedKMOverQUICFromToken:v48];
            }
            v133[0] = _NSConcreteStackBlock;
            v133[1] = 3221225472;
            v133[2] = sub_1000AE1C0;
            v133[3] = &unk_1009812F0;
            id v134 = v9;
            CFStringRef v135 = self;
            id v136 = v10;
            v110 = v122;
            dispatch_block_t v137 = v110;
            id v107 = v27;
            id v138 = v107;
            id v106 = v23;
            id v139 = v106;
            v118 = objc_retainBlock(v133);
            if (v123)
            {
              uint64_t v113 = [v126 objectForKey:@"signature"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                unsigned int v49 = [v126 objectForKey:@"signature"];
                id v124 = +[NSData _IDSDataFromBase64String:v49];
              }
              else
              {
                unsigned int v49 = [v126 objectForKey:@"signature"];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v124 = [v126 objectForKey:@"signature"];
                }
                else
                {
                  id v124 = 0;
                }
              }

              if (v124)
              {
                uint64_t v77 = objc_opt_class();
                id v117 = sub_1000AF6F8(v77, v126, @"sessionID");
                id v78 = [(IDSDSession *)self sharedState];
                id v79 = [v78 uniqueID];
                unsigned __int8 v80 = [v117 isEqual:v79];

                if (v80)
                {
                  BOOL v81 = [v117 dataUsingEncoding:4];
                  uint64_t v105 = +[NSMutableData dataWithData:v81];

                  [v105 appendData:v125];
                  id v82 = OSLogHandleForTransportCategory();
                  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    uint64_t v148 = v124;
                    __int16 v149 = 2112;
                    v150 = v110;
                    _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "didReceiveMaterialInfo verifying signature: %@ matchesPayload: %@", buf, 0x16u);
                  }

                  if (os_log_shim_legacy_logging_enabled())
                  {
                    if (_IDSShouldLogTransport())
                    {
                      id v96 = v124;
                      CFStringRef v99 = v110;
                      _IDSLogTransport();
                      if (_IDSShouldLog())
                      {
                        id v96 = v124;
                        CFStringRef v99 = v110;
                        _IDSLogV();
                      }
                    }
                  }
                  id v83 = +[IDSEncryptionController sharedInstance];
                  id v104 = [(IDSDSession *)self getCallerCert];
                  v109 = [v107 rawToken];
                  id v84 = [(IDSDSession *)self getFromService];
                  id v85 = [(IDSDSession *)self fromURI];
                  v129[0] = _NSConcreteStackBlock;
                  v129[1] = 3221225472;
                  v129[2] = sub_1000AF7B4;
                  v129[3] = &unk_100981340;
                  v130 = v124;
                  unsigned int v131 = v110;
                  v132 = v118;
                  LOBYTE(v103) = 0;
                  [v83 publicKeyVerifySignedData:v130 matchesData:v105 forSignatureType:0 identity:v104 forURI:v106 pushToken:v109 service:v84 localURI:v85 priority:300 completion:v129 avoidMainQueue:v103];
                }
                else
                {
                  id v87 = OSLogHandleForTransportCategory();
                  if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
                  {
                    id v88 = [(IDSDSession *)self sharedState];
                    id v89 = [v88 uniqueID];
                    *(_DWORD *)buf = 138412546;
                    uint64_t v148 = (id *)v117;
                    __int16 v149 = 2112;
                    v150 = v89;
                    _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "didReceiveMaterialInfo ignoring material info; sessionID %@ does not match our sessionID %@",
                      buf,
                      0x16u);
                  }
                  if (os_log_shim_legacy_logging_enabled())
                  {
                    if (_IDSShouldLogTransport())
                    {
                      id v90 = [(IDSDSession *)self sharedState];
                      [v90 uniqueID];
                      v99 = id v96 = (id *)v117;
                      _IDSLogTransport();

                      if (_IDSShouldLog())
                      {
                        id v91 = [(IDSDSession *)self sharedState];
                        [v91 uniqueID];
                        v99 = id v96 = (id *)v117;
                        _IDSLogV();
                      }
                    }
                  }
                  [(IDSDSession *)self materialInfoError:@"sessionIDMismatch", v96, v99];
                }
              }
              else
              {
                id v86 = OSLogHandleForTransportCategory();
                if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v148 = v126;
                  _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "didReceiveMaterialInfo did not receive signature: %@", buf, 0xCu);
                }

                if (os_log_shim_legacy_logging_enabled())
                {
                  if (_IDSShouldLogTransport())
                  {
                    id v96 = v126;
                    _IDSLogTransport();
                    if (_IDSShouldLog())
                    {
                      id v96 = v126;
                      _IDSLogV();
                    }
                  }
                }
                [(IDSDSession *)self materialInfoError:@"missingSignature", v96];
              }
              CFStringRef v53 = v124;
            }
            else
            {
              uint64_t v51 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "didReceiveMaterialInfo not verifying signature", buf, 2u);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  _IDSLogTransport();
                  if (_IDSShouldLog()) {
                    _IDSLogV();
                  }
                }
              }
              id v52 = im_primary_queue();
              v127[0] = _NSConcreteStackBlock;
              v127[1] = 3221225472;
              v127[2] = sub_1000AFA18;
              v127[3] = &unk_10097E7F0;
              v128 = v118;
              sub_100087C00(v52, QOS_CLASS_USER_INTERACTIVE, v127);

              CFStringRef v53 = v128;
            }
          }
          else
          {
            pendingMaterialInfoByFromID = self->_pendingMaterialInfoByFromID;
            if (!pendingMaterialInfoByFromID)
            {
              CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
              unsigned int v56 = self->_pendingMaterialInfoByFromID;
              self->_pendingMaterialInfoByFromID = Mutable;

              pendingMaterialInfoByFromID = self->_pendingMaterialInfoByFromID;
            }
            unint64_t v57 = -[NSMutableDictionary objectForKeyedSubscript:](pendingMaterialInfoByFromID, "objectForKeyedSubscript:", v23, v95, v98);
            BOOL v58 = v57 == 0;

            if (v58)
            {
              id v59 = objc_alloc_init((Class)NSMutableArray);
              [(NSMutableDictionary *)self->_pendingMaterialInfoByFromID setObject:v59 forKeyedSubscript:v23];
            }
            id location = (id)0xAAAAAAAAAAAAAAAALL;
            objc_initWeak(&location, self);
            double v60 = sub_100087A84();
            long long v61 = [(NSMutableDictionary *)self->_pendingMaterialInfoByFromID objectForKeyedSubscript:v23];
            v140[0] = _NSConcreteStackBlock;
            v140[1] = 3221225472;
            v140[2] = sub_1000ADD08;
            v140[3] = &unk_1009812C8;
            id v119 = v10;
            id v141 = v119;
            v142 = self;
            *(double *)&v145[1] = v60 + 60.0;
            objc_copyWeak(v145, &location);
            id v143 = v8;
            id v144 = v9;
            id v62 = objc_retainBlock(v140);
            [v61 addObject:v62];

            while (1)
            {

              uint64_t v63 = [(NSMutableDictionary *)self->_pendingMaterialInfoByFromID objectForKeyedSubscript:v23];
              BOOL v64 = (unint64_t)[v63 count] > 0x20;

              if (!v64) {
                break;
              }
              long long v61 = [(NSMutableDictionary *)self->_pendingMaterialInfoByFromID objectForKeyedSubscript:v23];
              [v61 removeFirstObject];
            }
            id v65 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
            {
              v111 = (id *)[v119 ownerParticipantId];
              id v66 = [(IDSDSession *)self sharedState];
              id v67 = [v66 groupID];
              v114 = [(IDSDSession *)self sharedState];
              id v68 = [v114 uniqueID];
              uint64_t v69 = [(IDSDSession *)self destinations];
              id v108 = v66;
              *(_DWORD *)buf = 134218754;
              uint64_t v148 = v111;
              __int16 v149 = 2112;
              v150 = v67;
              __int16 v151 = 2112;
              CFStringRef v152 = v68;
              __int16 v153 = 2112;
              id v70 = (void *)v69;
              uint64_t v154 = v69;
              _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "didReceiveMaterialInfo: saving material from %llu for group %@ and session %@ until we have member, since the originator of material is not in group membership: %@", buf, 0x2Au);
            }
            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                id v112 = [v119 ownerParticipantId];
                id v71 = [(IDSDSession *)self sharedState];
                uint64_t v115 = [v71 groupID];
                id v72 = [(IDSDSession *)self sharedState];
                id v73 = [v72 uniqueID];
                [(IDSDSession *)self destinations];
                __int16 v102 = v101 = v73;
                id v97 = v112;
                __int16 v100 = v115;
                _IDSLogTransport();

                if (_IDSShouldLog())
                {
                  id v116 = objc_msgSend(v119, "ownerParticipantId", v112, v115, v73, v102);
                  id v74 = [(IDSDSession *)self sharedState];
                  id v120 = [v74 groupID];
                  unsigned int v75 = [(IDSDSession *)self sharedState];
                  id v76 = [v75 uniqueID];
                  [(IDSDSession *)self destinations];
                  __int16 v102 = v101 = v76;
                  id v97 = v116;
                  __int16 v100 = v120;
                  _IDSLogV();
                }
              }
            }
            [(IDSDSession *)self materialInfoError:@"ReceivedFromUnknownMember", v97, v100, v101, v102];

            objc_destroyWeak(v145);
            objc_destroyWeak(&location);
          }
        }
        else
        {
          id v50 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "didReceiveMaterialInfo could not process material because ownerParticipantId is 0", buf, 2u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport();
              if (_IDSShouldLog()) {
                _IDSLogV();
              }
            }
          }
          [(IDSDSession *)self materialInfoError:@"missingOwnerParticipantID", v95, v98];
        }
      }
      else
      {
        __int16 v41 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v42 = (id *)[v10 ownerParticipantId];
          *(_DWORD *)buf = 134217984;
          uint64_t v148 = v42;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "didReceiveMaterialInfo could not get push token for participant %llu", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            id v95 = (id *)[v10 ownerParticipantId];
            _IDSLogTransport();
            if (_IDSShouldLog())
            {
              id v95 = (id *)objc_msgSend(v10, "ownerParticipantId", v95);
              _IDSLogV();
            }
          }
        }
        [(IDSDSession *)self materialInfoError:@"missingFromToken", v95, v98];
      }
    }
    else
    {
      __int16 v44 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        id v45 = (id *)[v10 ownerParticipantId];
        *(_DWORD *)buf = 134217984;
        uint64_t v148 = v45;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "didReceiveMaterialInfo could not get fromURI for participant %llu", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          id v95 = (id *)[v10 ownerParticipantId];
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            id v95 = (id *)objc_msgSend(v10, "ownerParticipantId", v95);
            _IDSLogV();
          }
        }
      }
      [(IDSDSession *)self materialInfoError:@"missingFromURI", v95, v98];
    }

    goto LABEL_87;
  }
  long long v12 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "didReceiveMaterialInfo: SME disabled", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
LABEL_89:
}

- (void)link:(id)a3 didConnectForDeviceUniqueID:(id)a4 cbuuid:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v24 = self;
    __int16 v25 = 2112;
    id v26 = v8;
    __int16 v27 = 2112;
    id v28 = v9;
    __int16 v29 = 2112;
    id v30 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "<%@> link:%@ didConnectForDeviceUniqueID:%@ cbuuid:%@", buf, 0x2Au);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v20 = v9;
    id v21 = v10;
    id v18 = self;
    id v19 = v8;
    _IDSLogV();
  }
  long long v12 = [(IDSDSession *)self utunController];
  id v13 = [(IDSDSession *)self sharedState];
  __int16 v14 = [v13 uniqueID];
  id v15 = objc_msgSend(v12, "onTransportThread_getLinkType:", v14);

  __int16 v16 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AFD4C;
  block[3] = &unk_10097EDD8;
  void block[4] = self;
  void block[5] = v15;
  dispatch_block_t v17 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, block);
  dispatch_async(v16, v17);
}

- (void)link:(id)a3 didReceiveReportEvent:(id)a4
{
  id v32 = a3;
  id v34 = a4;
  id v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v32;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&unsigned char buf[24] = v34;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<%@> link:%@ didReceiveReportEvent:%@", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v30 = v32;
    id v31 = v34;
    id v28 = self;
    _IDSLogV();
  }
  id v6 = [(IDSDSession *)self sharedState];
  if ([v6 useQRDirectly]) {
    goto LABEL_11;
  }
  id v7 = [(IDSDSession *)self sharedState];
  if ([v7 clientType] == (id)1)
  {
LABEL_10:

LABEL_11:
LABEL_12:
    unint64_t v41 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v39 = v9;
    long long v40 = v9;
    memset(buf, 170, 0x1000uLL);
    IDSByteBufferInitForWrite();
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v10 = [v34 allKeys];
    int v11 = 0;
    id v12 = [v10 countByEnumeratingWithState:&v35 objects:v44 count:16];
    if (!v12) {
      goto LABEL_36;
    }
    uint64_t v13 = *(void *)v36;
    uint64_t v14 = IDSGlobalLinkAttributeAcceptDelayKey;
    uint64_t v15 = IDSQuickRelayServerProviderKey;
    __int16 v16 = buf;
    while (1)
    {
      for (int i = 0; i != v12; int i = (char *)i + 1)
      {
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(v10);
        }
        id v18 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if (objc_msgSend(v18, "isEqualToString:", v14, v29))
        {
          id v19 = [v34 objectForKey:v14];
          id v20 = [v19 unsignedIntValue];

          id v21 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int16 v42 = 67109120;
            int v43 = (int)v20;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Report acceptDelay: %d", v42, 8u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              id v29 = v20;
              _IDSLogTransport();
              if (_IDSShouldLog())
              {
                id v29 = v20;
                _IDSLogV();
              }
            }
          }
          char v22 = 1;
        }
        else
        {
          if (![v18 isEqualToString:v15]) {
            continue;
          }
          uint64_t v23 = [v34 objectForKey:v15];
          id v20 = [v23 unsignedIntValue];

          id v24 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)__int16 v42 = 67109120;
            int v43 = (int)v20;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Report QuickRelay Server Provider: %d", v42, 8u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              id v29 = v20;
              _IDSLogTransport();
              if (_IDSShouldLog())
              {
                id v29 = v20;
                _IDSLogV();
              }
            }
          }
          char v22 = 2;
        }
        *(_WORD *)__int16 v16 = 0;
        v16[2] = 0;
        v16[3] = v22;
        v16[4] = BYTE3(v20);
        v16[5] = BYTE2(v20);
        v16[6] = BYTE1(v20);
        v16[7] = v20;
        v16 += 8;
        v11 += 8;
      }
      id v12 = [v10 countByEnumeratingWithState:&v35 objects:v44 count:16];
      if (!v12)
      {
LABEL_36:

        IDSByteBufferWriteField();
        -[IDSDSession writeToClientChannel:packetBuffer:metaData:metadataSize:](self, "writeToClientChannel:packetBuffer:metaData:metadataSize:", self->_clientChannel, 0);
        IDSByteBufferRelease();
        goto LABEL_37;
      }
    }
  }
  id v8 = [(IDSDSession *)self sharedState];
  if ([v8 clientType] == (id)5)
  {

    goto LABEL_10;
  }
  __int16 v25 = [(IDSDSession *)self sharedState];
  BOOL v26 = [v25 clientType] == (id)6;

  if (v26) {
    goto LABEL_12;
  }
  __int16 v27 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = self;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "<%@> need a client channel to send the event kClientChannelMetadataType_InfoReportKey", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
LABEL_37:
}

- (BOOL)link:(id)a3 didReceivePacket:(id *)a4 fromDeviceUniqueID:(id)a5 cbuuid:(id)a6
{
  id v79 = a3;
  id v80 = a5;
  id v81 = a6;
  if (self->_verboseFunctionalLogging)
  {
    id v10 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t var1 = a4->var1;
      int64_t var2 = a4->var2;
      var0 = a4->var0;
      int var25 = a4->var25;
      int v15 = *(unsigned __int8 *)a4->var0;
      int v16 = *((unsigned __int8 *)a4->var0 + 1);
      int v17 = *((unsigned __int8 *)a4->var0 + 2);
      int v18 = *((unsigned __int8 *)a4->var0 + 3);
      *(_DWORD *)buf = 138415362;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v79;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&unsigned char buf[24] = a4;
      *(_WORD *)id v97 = 2112;
      *(void *)&v97[2] = v80;
      __int16 v98 = 2112;
      id v99 = v81;
      __int16 v100 = 2048;
      CFStringRef v101 = var0;
      __int16 v102 = 2048;
      int64_t v103 = var2;
      __int16 v104 = 2048;
      unint64_t v105 = var1;
      __int16 v106 = 1024;
      int v107 = var25;
      __int16 v108 = 1024;
      int v109 = v15;
      __int16 v110 = 1024;
      int v111 = v16;
      __int16 v112 = 1024;
      int v113 = v17;
      __int16 v114 = 1024;
      int v115 = v18;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<%@> link:%@ didReceivePacket:%p fromDeviceUniqueID:%@ cbuuid:%@ packetBytes %p packetLength %ld packetMaxLength %ld linkID %d [%02x%02x%02x%02x ...]", buf, 0x70u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      uint64_t v77 = *((unsigned __int8 *)a4->var0 + 2);
      uint64_t v78 = *((unsigned __int8 *)a4->var0 + 3);
      uint64_t v75 = *(unsigned __int8 *)a4->var0;
      uint64_t v76 = *((unsigned __int8 *)a4->var0 + 1);
      unint64_t v73 = a4->var1;
      uint64_t v74 = a4->var25;
      id v71 = a4->var0;
      int64_t v72 = a4->var2;
      id v70 = v81;
      id v67 = a4;
      id v69 = v80;
      uint64_t v63 = self;
      id v65 = v79;
      _IDSLogV();
    }
  }
  if (self->_firstPacketReceivedTime == 0.0)
  {
    if (qword_100A4A5D0 != -1) {
      dispatch_once(&qword_100A4A5D0, &stru_100981748);
    }
    self->_firstPacketReceivedTime = *(double *)&qword_100A4A5D8 * (double)mach_continuous_time();
  }
  id v19 = [(IDSDSession *)self sharedState];
  if ([v19 useQRDirectly]) {
    goto LABEL_18;
  }
  id v20 = [(IDSDSession *)self sharedState];
  if ([v20 clientType] == (id)1)
  {
LABEL_17:

LABEL_18:
    goto LABEL_19;
  }
  id v21 = [(IDSDSession *)self sharedState];
  if ([v21 clientType] == (id)5)
  {
LABEL_16:

    goto LABEL_17;
  }
  char v22 = [(IDSDSession *)self sharedState];
  if ([v22 clientType] == (id)6)
  {

    goto LABEL_16;
  }
  BOOL v61 = !self->_bypassUTun;

  if (v61)
  {
    id v62 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "<%@> need a client channel to receive packet", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    goto LABEL_117;
  }
LABEL_19:
  LODWORD(v23) = a4->var23;
  unsigned int v84 = v23;
  if (v23 <= 1) {
    uint64_t v23 = 1;
  }
  else {
    uint64_t v23 = v23;
  }
  uint64_t v83 = v23;
  if ((int)v23 >= 1)
  {
    uint64_t v24 = 0;
    p_var28 = &a4->var28;
    var3 = a4->var24[0].var3;
    while (1)
    {
      *(void *)id v97 = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&long long v26 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v26 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)buf = v26;
      *(_OWORD *)&uint8_t buf[16] = v26;
      IDSByteBufferInitForWrite();
      int v27 = a4->var25;
      char v94 = a4->var25;
      unsigned __int16 var21 = a4->var21;
      unsigned __int8 var22 = a4->var22;
      id v28 = (char *)a4 + 96 * v24;
      id v29 = v28 + 448;
      int v30 = *((_DWORD *)v28 + 134);
      if (!self->_multiplexerEnabled) {
        break;
      }
      if (v84 > 1)
      {
        uint64_t v32 = _IDSLinkPacketBufferCreateWithUserBuffer();
        if (v30)
        {
          *(_DWORD *)(v32 + 536) |= 1u;
          *(void *)(v32 + 488) = a4->var24[v24].var4;
        }
        unsigned __int8 v31 = -[IDSMultiplexerGroupSessionTransport tryConsumePacketBuffer:](self->_multiplexerTransport, "tryConsumePacketBuffer:", v32, v64, v66, v68);
        _IDSLinkPacketBufferRelease();
      }
      else
      {
        unsigned __int8 v31 = [(IDSMultiplexerGroupSessionTransport *)self->_multiplexerTransport tryConsumePacketBuffer:a4];
      }
      if (v94 > 0) {
        goto LABEL_33;
      }
      if ((v31 & 1) == 0) {
        goto LABEL_112;
      }
LABEL_115:
      IDSByteBufferRelease();
      ++v24;
      var3 += 48;
      if (v24 == v83) {
        goto LABEL_116;
      }
    }
    if (v27 > 0)
    {
      unsigned __int8 v31 = 0;
LABEL_33:
      IDSByteBufferWriteField();
      IDSByteBufferWriteField();
      IDSByteBufferWriteField();
      double v33 = *p_var28;
      if (*p_var28 > 0.0) {
        IDSByteBufferWriteField();
      }
      if ((v30 & 2) != 0)
      {
        id v34 = (char *)a4 + 96 * v24;
        int v35 = *((_DWORD *)v34 + 115);
        char v36 = v35 < 1 ? 1 : v31;
        if ((v36 & 1) == 0)
        {
          long long v37 = v34 + 460;
          memset(v95, 170, 24);
          if (v35 >= 0xD) {
            *long long v37 = 12;
          }
          IDSByteBufferWriteField();
          uint64_t v38 = *v37;
          if ((int)v38 >= 1)
          {
            long long v39 = v95;
            long long v40 = var3;
            do
            {
              unsigned int v41 = *v40++;
              *(_WORD *)long long v39 = bswap32(v41) >> 16;
              v39 += 2;
              --v38;
            }
            while (v38);
          }
          IDSByteBufferWriteField();
        }
      }
      if (v30) {
        char v42 = v31;
      }
      else {
        char v42 = 1;
      }
      if ((v42 & 1) == 0)
      {
        *(void *)id v95 = bswap64(a4->var24[v24].var4);
        IDSByteBufferWriteField();
      }
      if ((v30 & 8) != 0) {
        char v43 = v31;
      }
      else {
        char v43 = 1;
      }
      if ((v43 & 1) == 0)
      {
        v95[0] = a4->var24[v24].var5;
        IDSByteBufferWriteField();
      }
      if ((v30 & 0x10) != 0) {
        char v44 = v31;
      }
      else {
        char v44 = 1;
      }
      if ((v44 & 1) == 0)
      {
        *(_WORD *)id v95 = bswap32(a4->var24[v24].var6) >> 16;
        IDSByteBufferWriteField();
      }
      if ((v30 & 0x20) != 0)
      {
        v95[0] = a4->var24[v24].var7;
        if ((v31 & 1) == 0) {
          IDSByteBufferWriteField();
        }
        -[IDSDSession _lightweightParticipantSync:](self, "_lightweightParticipantSync:", v33, v64);
      }
      if ((v30 & 4) != 0) {
        char v45 = v31;
      }
      else {
        char v45 = 1;
      }
      if ((v45 & 1) == 0) {
        IDSByteBufferWriteField();
      }
      if ((v30 & 0x80) != 0) {
        char v46 = v31;
      }
      else {
        char v46 = 1;
      }
      if ((v46 & 1) == 0) {
        IDSByteBufferWriteField();
      }
      if ((v30 & 0x40) != 0)
      {
        __int16 v91 = bswap32(a4->var24[v24].var10) >> 16;
        IDSByteBufferWriteField();
        __int16 v90 = bswap32(a4->var24[v24].var11.var0) >> 16;
        IDSByteBufferWriteField();
        __int16 v89 = bswap32(a4->var24[v24].var11.var1) >> 16;
        IDSByteBufferWriteField();
        __int16 v88 = bswap32(a4->var24[v24].var11.var2) >> 16;
        IDSByteBufferWriteField();
        __int16 v87 = bswap32(a4->var24[v24].var11.var3) >> 16;
        IDSByteBufferWriteField();
        __int16 v86 = bswap32(a4->var24[v24].var11.var4) >> 16;
        IDSByteBufferWriteField();
        if (!a4->var2)
        {
          id v47 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)id v95 = 67109632;
            *(_DWORD *)&v95[4] = v83;
            *(_WORD *)&v95[8] = 1024;
            *(_DWORD *)&v95[10] = v91;
            *(_WORD *)&v95[14] = 1024;
            *(_DWORD *)&v95[16] = HIBYTE(v91);
            _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "totalIncomingPackets= %d, statsID: %0x, %0x", v95, 0x14u);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            uint64_t v66 = v91;
            uint64_t v68 = HIBYTE(v91);
            uint64_t v64 = v83;
            _IDSLogV();
          }
        }
      }
      if ((v30 & 0x100) != 0) {
        char v48 = v31;
      }
      else {
        char v48 = 1;
      }
      if ((v48 & 1) == 0) {
        IDSByteBufferWriteField();
      }
      if ((v30 & 0x400) != 0) {
        char v49 = v31;
      }
      else {
        char v49 = 1;
      }
      if ((v49 & 1) == 0)
      {
        v95[0] = 1;
        IDSByteBufferWriteField();
      }
      if ((v30 & 0x2000) != 0 && ((a4->var24[v24].var16 - LOBYTE(self->_currentSessionStateCounter)) & 0x80) == 0)
      {
        id v50 = [(IDSDSession *)self sharedState];
        unsigned int v51 = [v50 sharedSession];

        if (v51)
        {
          id v52 = im_primary_queue();
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000B0EB0;
          block[3] = &unk_10097E4D0;
          void block[4] = self;
          dispatch_block_t v53 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, block);
          dispatch_async(v52, v53);
        }
      }
      if ((v30 & 0x10000) != 0) {
        char v54 = v31;
      }
      else {
        char v54 = 1;
      }
      if ((v54 & 1) == 0)
      {
        v95[0] = 1;
        IDSByteBufferWriteField();
      }
      if ((v30 & 0x20000) != 0) {
        char v55 = v31;
      }
      else {
        char v55 = 1;
      }
      if ((v55 & 1) == 0)
      {
        v95[0] = 1;
        IDSByteBufferWriteField();
      }
      if (v31)
      {
        if ((v30 & 0x40) != 0) {
          -[IDSDSession writeToClientChannel:packetBuffer:metaData:metadataSize:](self, "writeToClientChannel:packetBuffer:metaData:metadataSize:", self->_clientChannel, 0, v33);
        }
        goto LABEL_115;
      }
    }
LABEL_112:
    if (v84 > 1) {
      -[IDSClientChannel writeBuffer:bufferSize:metaData:metadataSize:moreComing:](self->_clientChannel, "writeBuffer:bufferSize:metaData:metadataSize:moreComing:", *v29, a4->var24[v24].var1);
    }
    else {
      -[IDSDSession writeToClientChannel:packetBuffer:metaData:metadataSize:](self, "writeToClientChannel:packetBuffer:metaData:metadataSize:", self->_clientChannel, a4);
    }
    goto LABEL_115;
  }
LABEL_116:
  unsigned int v56 = +[NSDate date];
  [v56 timeIntervalSince1970];
  double v58 = v57;
  id v59 = [(IDSDSession *)self sharedState];
  [v59 setLastPacketTime:v58];

LABEL_117:
  return 1;
}

- (void)link:(id)a3 didConnectUnderlyingLink:(char)a4 linkUUID:(id)a5 localAttributes:(id)a6 remoteAttributes:(id)a7
{
  uint64_t v9 = __chkstk_darwin(self, a2);
  int v11 = v10;
  uint64_t v13 = v12;
  int v15 = v14;
  uint64_t v144 = v16;
  uint64_t v146 = v9;
  id v138 = v17;
  id v143 = v15;
  id v18 = v13;
  id v147 = v11;
  id v19 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413570;
    *(void *)&uint8_t buf[4] = v146;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v138;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&unsigned char buf[24] = v144;
    *(_WORD *)&unsigned char buf[28] = 2112;
    *(void *)&buf[30] = v143;
    *(_WORD *)&buf[38] = 2112;
    *(void *)&buf[40] = v18;
    *(_WORD *)&buf[48] = 2112;
    *(void *)&buf[50] = v147;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "<%@> link:%@ didConnectUnderlyingLink:%d linkUUID:%@ localAttributes:%@ remoteAttributes:%@", buf, 0x3Au);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v136 = v18;
    id v137 = v147;
    uint64_t v133 = (int)v144;
    id v135 = v143;
    uint64_t v129 = v146;
    id v131 = v138;
    _IDSLogV();
  }
  id v20 = objc_msgSend((id)v146, "sharedState", v129, v131, v133, v135, v136, v137);
  id v21 = [v20 uniqueID];
  id v139 = [v21 componentsSeparatedByString:@"-"];

  CFDictionaryRef theDict = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(theDict, @"state", &off_1009D0E40);
  char v22 = [*(id *)(v146 + 664) substringFromIndex:objc_msgSend(@"com.apple.private.alloy.", "length")];
  if (v22) {
    CFDictionarySetValue(theDict, @"serviceName", v22);
  }

  uint64_t v23 = [v139 objectAtIndexedSubscript:0];
  if (v23) {
    CFDictionarySetValue(theDict, @"sessionID", v23);
  }

  IDSPowerLogDictionary();
  uint64_t v24 = [(id)v146 sharedState];
  if ([v24 useQRDirectly]) {
    goto LABEL_15;
  }
  __int16 v25 = [(id)v146 sharedState];
  if ([v25 clientType] == (id)1)
  {
LABEL_14:

LABEL_15:
    goto LABEL_16;
  }
  long long v26 = [(id)v146 sharedState];
  if ([v26 clientType] == (id)5)
  {

    goto LABEL_14;
  }
  id v116 = [(id)v146 sharedState];
  BOOL v117 = [v116 clientType] == (id)6;

  if (!v117)
  {
    v118 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
    {
      id v119 = [(id)v146 sharedState];
      if ([v119 useQRDirectly]) {
        CFStringRef v120 = @"YES";
      }
      else {
        CFStringRef v120 = @"NO";
      }
      id v121 = [(id)v146 sharedState];
      id v122 = [v121 clientType];
      if (v122 == (id)1)
      {
        int v123 = 0;
        CFStringRef v124 = @"YES";
      }
      else
      {
        id v7 = [(id)v146 sharedState];
        CFStringRef v124 = @"YES";
        if ([v7 clientType] == (id)5)
        {
          int v123 = 0;
        }
        else
        {
          id v8 = [(id)v146 sharedState];
          if ([v8 clientType] != (id)6) {
            CFStringRef v124 = @"NO";
          }
          int v123 = 1;
        }
      }
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v146;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v120;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&unsigned char buf[24] = v124;
      _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_DEFAULT, "No need to send kClientChannelMetadataType_LinkConnected, <%@> useQR: %@, isFaceTimeCall: %@", buf, 0x20u);
      if (v123) {

      }
      if (v122 != (id)1) {
    }
      }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      CFStringRef v125 = [(id)v146 sharedState];
      [v125 useQRDirectly];
      v126 = [(id)v146 sharedState];
      if ([v126 clientType] == (id)1)
      {
        _IDSLogV();
      }
      else
      {
        id v127 = [(id)v146 sharedState];
        if ([v127 clientType] == (id)5)
        {
          _IDSLogV();
        }
        else
        {
          v128 = [(id)v146 sharedState];
          [v128 clientType];
          _IDSLogV();
        }
      }
    }
    goto LABEL_71;
  }
LABEL_16:
  unint64_t v152 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v27 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v27 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v150 = v27;
  long long v151 = v27;
  IDSByteBufferInitForWrite();
  memset(buf, 170, sizeof(buf));
  long long v161 = 0u;
  long long v162 = 0u;
  long long v163 = 0u;
  long long v164 = 0u;
  long long v165 = 0u;
  long long v166 = 0u;
  int v167 = 0;
  LOBYTE(v163) = v144;
  uint64_t v28 = IDSGlobalLinkAttributeIPFamilyKey;
  id v29 = [v18 objectForKey:IDSGlobalLinkAttributeIPFamilyKey];
  BYTE1(v163) = [v29 unsignedCharValue];

  uint64_t v30 = IDSGlobalLinkAttributeTransportKey;
  unsigned __int8 v31 = [v18 objectForKey:IDSGlobalLinkAttributeTransportKey];
  BYTE2(v163) = [v31 unsignedCharValue];

  uint64_t v32 = IDSGlobalLinkAttributeRATKey;
  double v33 = [v18 objectForKey:IDSGlobalLinkAttributeRATKey];
  BYTE3(v163) = [v33 unsignedCharValue];

  uint64_t v34 = IDSGlobalLinkAttributeConstantOverheadKey;
  int v35 = [v18 objectForKeyedSubscript:IDSGlobalLinkAttributeConstantOverheadKey];
  unsigned int v36 = [v35 unsignedShortValue];

  long long v37 = [v147 objectForKeyedSubscript:v34];
  unsigned int v38 = [v37 unsignedShortValue];

  uint64_t v39 = IDSGlobalLinkAttributeMTUKey;
  long long v40 = [v18 objectForKey:IDSGlobalLinkAttributeMTUKey];
  unsigned int v41 = [v40 unsignedShortValue];

  char v42 = [v147 objectForKey:v39];
  unsigned int v43 = [v42 unsignedShortValue];

  char v44 = +[IDSFoundationLog IDSDSession];
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int16 v153 = 138413570;
    *(void *)&v153[4] = v146;
    *(_WORD *)&v153[12] = 1024;
    *(_DWORD *)&v153[14] = v144;
    *(_WORD *)&v153[18] = 1024;
    *(_DWORD *)&v153[20] = v41;
    *(_WORD *)&v153[24] = 1024;
    *(_DWORD *)&v153[26] = v43;
    *(_WORD *)&v153[30] = 1024;
    LODWORD(v154) = v36;
    WORD2(v154) = 1024;
    *(_DWORD *)((char *)&v154 + 6) = v38;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "<%@> linkID %d: localMTU: %d; remoteMTU: %d; localOverhead: %d; remoteOverhead: %d",
      v153,
      0x2Au);
  }

  if (v41 >= v43) {
    __int16 v45 = v43;
  }
  else {
    __int16 v45 = v41;
  }
  WORD3(v164) = v45;
  if (v36 <= v38) {
    __int16 v46 = v38;
  }
  else {
    __int16 v46 = v36;
  }
  HIWORD(v166) = v46;
  id v47 = [v147 objectForKey:v28];
  BYTE4(v163) = [v47 unsignedCharValue];

  char v48 = [v147 objectForKey:v30];
  BYTE5(v163) = [v48 unsignedCharValue];

  char v49 = [v147 objectForKey:v32];
  BYTE6(v163) = [v49 unsignedCharValue];

  [v143 getUUIDBytes:&v161];
  v142 = [v18 objectForKey:IDSGlobalLinkAttributeRelaySessionIDKey];
  if (v142)
  {
    id v50 = [objc_alloc((Class)NSUUID) initWithUUIDString:v142];
    [v50 getUUIDBytes:&v162];
  }
  unsigned int v51 = [v18 objectForKey:IDSGlobalLinkAttributeRelayServerDegradedKey];
  BYTE7(v163) = [v51 BOOLValue];

  uint64_t v52 = IDSGlobalLinkAttributeLinkFlagsKey;
  dispatch_block_t v53 = [v18 objectForKey:IDSGlobalLinkAttributeLinkFlagsKey];
  WORD4(v163) = (unsigned __int16)[v53 unsignedShortValue];

  char v54 = [v147 objectForKey:v52];
  WORD5(v163) = (unsigned __int16)[v54 unsignedShortValue];

  uint64_t v55 = IDSGlobalLinkAttributeDataSoMaskKey;
  unsigned int v56 = [v18 objectForKey:IDSGlobalLinkAttributeDataSoMaskKey];
  HIDWORD(v163) = [v56 unsignedIntValue];

  double v57 = [v147 objectForKey:v55];
  LODWORD(v164) = [v57 unsignedIntValue];

  double v58 = [v18 objectForKey:IDSGlobalLinkAttributeIsVirtualLinkKey];
  BYTE12(v164) = [v58 BOOLValue];

  id v59 = [v18 objectForKey:IDSGlobalLinkAttributeDelegatedLinkIDKey];
  BYTE13(v165) = [v59 charValue];

  double v60 = [v18 objectForKey:IDSGlobalLinkAttributeLocalRelayLinkIDKey];
  WORD4(v164) = (unsigned __int16)[v60 unsignedShortValue];

  BOOL v61 = [v18 objectForKey:IDSGlobalLinkAttributeRemoteRelayLinkIDKey];
  WORD5(v164) = (unsigned __int16)[v61 unsignedShortValue];

  id v62 = [v18 objectForKeyedSubscript:IDSGlobalLinkAttributeLinkChannelNumberKey];
  WORD2(v164) = (unsigned __int16)[v62 unsignedShortValue];

  id v63 = [v18 objectForKey:IDSGlobalLinkAttributeInterfaceNameKey];
  [v63 UTF8String];

  __strlcpy_chk();
  *(_OWORD *)&buf[64] = v165;
  *(_OWORD *)&buf[80] = v166;
  *(_DWORD *)&buf[96] = v167;
  *(_OWORD *)buf = v161;
  *(_OWORD *)&uint8_t buf[16] = v162;
  *(_OWORD *)&unsigned char buf[32] = v163;
  *(_OWORD *)&buf[48] = v164;
  id v141 = [v18 objectForKeyedSubscript:IDSGlobalLinkAttributeConnectionsKey];
  uint64_t v64 = JWEncodeDictionary();
  unsigned int v65 = [v64 length];

  if ((unsigned __int16)v65 - 1 > 0xF96)
  {
    id v67 = &buf[100];
  }
  else
  {
    *(_WORD *)&buf[100] = bswap32(v65) >> 16;
    JWEncodeDictionary();
    id v66 = objc_claimAutoreleasedReturnValue();
    [v66 bytes];
    __memcpy_chk();

    id v67 = &buf[(unsigned __int16)v65 + 102];
  }
  uint64_t v68 = [v18 objectForKeyedSubscript:IDSGlobalLinkAttributeRelayProtocolStackKey];
  id v69 = (void *)v68;
  id v70 = @"(unknown)";
  if (v68) {
    id v70 = (__CFString *)v68;
  }
  v140 = v70;

  id v71 = [(__CFString *)v140 dataUsingEncoding:4];
  unsigned int v72 = [v71 length];

  if ((_WORD)v72 && v160 - v67 >= (unsigned __int16)v72 + 2)
  {
    *(_WORD *)id v67 = bswap32(v72) >> 16;
    unint64_t v73 = (char *)(v67 + 2);
    id v74 = [(__CFString *)v140 dataUsingEncoding:4];
    memcpy(v73, [v74 bytes], (unsigned __int16)v72);

    id v67 = (uint8_t *)&v73[(unsigned __int16)v72];
  }
  uint64_t v75 = [v18 objectForKeyedSubscript:IDSGlobalLinkAttributeQRExperiments];
  uint64_t v76 = JWEncodeDictionary();
  unsigned int v77 = [v76 length];

  if ((_WORD)v77 && v160 - v67 >= (unsigned __int16)v77 + 2)
  {
    *(_WORD *)id v67 = bswap32(v77) >> 16;
    uint64_t v78 = (char *)(v67 + 2);
    JWEncodeDictionary();
    id v79 = objc_claimAutoreleasedReturnValue();
    memcpy(v78, [v79 bytes], (unsigned __int16)v77);

    id v67 = (uint8_t *)&v78[(unsigned __int16)v77];
  }
  if (BYTE2(v163) - 2 > 2)
  {
    uint64_t v84 = (uint64_t)v67;
  }
  else
  {
    id v80 = [v18 objectForKey:IDSQuickRelayServerProviderKey];
    *id v67 = [v80 unsignedCharValue];

    id v81 = [v18 objectForKey:IDSGlobalLinkAttributeRelaySessionTokenKey];
    unsigned int v82 = [v81 length];
    unsigned __int16 v83 = v82;
    uint64_t v84 = (uint64_t)(v67 + 1);
    if ((_WORD)v82 && (uint64_t)&v160[-v84] >= (unsigned __int16)v82 + 2)
    {
      *(_WORD *)(v67 + 1) = bswap32(v82) >> 16;
      memcpy(v67 + 3, [v81 bytes], (unsigned __int16)v82);
      uint64_t v84 = (uint64_t)&v67[v83 + 3];
    }
    id v85 = [v18 objectForKey:IDSGlobalLinkAttributeRelaySessionKeyKey];
    unsigned int v86 = [v85 length];
    unsigned __int16 v87 = v86;
    if ((_WORD)v86 && (uint64_t)&v160[-v84] >= (unsigned __int16)v86 + 2)
    {
      *(_WORD *)uint64_t v84 = bswap32(v86) >> 16;
      __int16 v88 = (void *)(v84 + 2);
      memcpy(v88, [v85 bytes], (unsigned __int16)v86);
      uint64_t v84 = (uint64_t)v88 + v87;
    }
    uint64_t v89 = IDSGlobalLinkAttributeHBHEncryptionKey;
    __int16 v90 = [v18 objectForKeyedSubscript:IDSGlobalLinkAttributeHBHEncryptionKey];
    unsigned int v91 = [v90 length];

    if ((_WORD)v91 && (uint64_t)&v160[-v84] >= (unsigned __int16)v91 + 2)
    {
      *(_WORD *)uint64_t v84 = bswap32(v91) >> 16;
      id v92 = (void *)(v84 + 2);
      id v93 = [v18 objectForKeyedSubscript:v89];
      memcpy(v92, [v93 bytes], (unsigned __int16)v91);

      uint64_t v84 = (uint64_t)v92 + (unsigned __int16)v91;
    }
    uint64_t v94 = IDSGlobalLinkAttributeHBHDecryptionKey;
    id v95 = [v18 objectForKeyedSubscript:IDSGlobalLinkAttributeHBHDecryptionKey];
    unsigned int v96 = [v95 length];

    if ((_WORD)v96 && (uint64_t)&v160[-v84] >= (unsigned __int16)v96 + 2)
    {
      *(_WORD *)uint64_t v84 = bswap32(v96) >> 16;
      id v97 = (void *)(v84 + 2);
      id v98 = [v18 objectForKeyedSubscript:v94];
      memcpy(v97, [v98 bytes], (unsigned __int16)v96);

      uint64_t v84 = (uint64_t)v97 + (unsigned __int16)v96;
    }
  }
  uint64_t v99 = v84 - (void)buf;
  if ((int)(v84 - (void)buf) <= 0)
  {
    __int16 v108 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v108, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__int16 v153 = 136315394;
      *(void *)&v153[4] = "-[IDSDSession link:didConnectUnderlyingLink:linkUUID:localAttributes:remoteAttributes:]";
      *(_WORD *)&v153[12] = 1024;
      *(_DWORD *)&v153[14] = v84 - (void)buf;
      _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEBUG, "%s incorrect attribute length: %d", v153, 0x12u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    IDSByteBufferRelease();
  }
  else
  {
    IDSByteBufferWriteField();
    objc_msgSend((id)v146, "writeToClientChannel:packetBuffer:metaData:metadataSize:", *(void *)(v146 + 72), 0);
    IDSByteBufferRelease();
    __int16 v100 = [v18 objectForKeyedSubscript:IDSGlobalLinkAttributeLocalAddressKey];
    CFStringRef v101 = [v147 objectForKeyedSubscript:IDSGlobalLinkAttributeRemoteAddressKey];
    __int16 v102 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v153 = 67109634;
      *(_DWORD *)&v153[4] = v144;
      *(_WORD *)&v153[8] = 2112;
      *(void *)&v153[10] = v100;
      *(_WORD *)&v153[18] = 2112;
      *(void *)&v153[20] = v101;
      _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEFAULT, "didConnectUnderlyingLink, linkid:%d, localAddress:%@, remoteAddress:%@", v153, 0x1Cu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v132 = v100;
      id v134 = v101;
      uint64_t v130 = (int)v144;
      _IDSLogV();
    }
    if (v100 && v101)
    {
      int64_t v103 = +[IMPair pairWithFirst:v100 second:v101];
      __int16 v104 = *(void **)(v146 + 704);
      if (!v104)
      {
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        __int16 v106 = *(void **)(v146 + 704);
        *(void *)(v146 + 704) = Mutable;

        __int16 v104 = *(void **)(v146 + 704);
      }
      int v107 = +[NSNumber numberWithChar:](NSNumber, "numberWithChar:", v144, v130, v132, v134);
      [v104 setObject:v103 forKey:v107];
    }
    long long v156 = v165;
    long long v157 = v166;
    int v158 = v167;
    *(_OWORD *)__int16 v153 = v161;
    *(_OWORD *)&v153[16] = v162;
    long long v154 = v163;
    long long v155 = v164;
    objc_msgSend((id)v146, "_buildCellularNetworkInfoSessionEvent:", v153, v130, v132);
  }
  if ((int)v99 > 0)
  {
LABEL_71:
    int v109 = *(_DWORD *)(v146 + 632);
    *(_DWORD *)(v146 + 632) = v109 + 1;
    if (!v109)
    {
      __int16 v110 = [(id)v146 sharedState];
      int v111 = [v110 uniqueID];
      id v112 = [v111 copy];

      int v113 = im_primary_queue();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000B2278;
      block[3] = &unk_10097E440;
      void block[4] = v146;
      id v149 = v112;
      id v114 = v112;
      dispatch_block_t v115 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, block);
      dispatch_async(v113, v115);
    }
  }
}

- (void)link:(id)a3 didDisconnectUnderlyingLinkID:(char)a4 linkUUID:(id)a5 reason:(unsigned __int8)a6
{
  unsigned int v6 = a6;
  int v8 = a4;
  id v37 = a3;
  id v10 = a5;
  int v11 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v37;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&unsigned char buf[24] = v8;
    *(_WORD *)&unsigned char buf[28] = 2112;
    *(void *)&buf[30] = v10;
    *(_WORD *)&buf[38] = 1024;
    unsigned int v44 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "<%@> link:%@ didDisconnectUnderlyingLinkID:%d linkUUID:%@, reason: %d", buf, 0x2Cu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v34 = v10;
    uint64_t v35 = v6;
    id v32 = v37;
    uint64_t v33 = v8;
    unsigned __int8 v31 = self;
    _IDSLogV();
  }
  id v12 = [(IDSDSession *)self sharedState];
  uint64_t v13 = [v12 uniqueID];
  uint64_t v14 = [v13 componentsSeparatedByString:@"-"];

  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(Mutable, @"state", &off_1009D0E58);
  uint64_t v16 = -[NSString substringFromIndex:](self->_serviceIdentifier, "substringFromIndex:", [@"com.apple.private.alloy." length]);
  if (v16) {
    CFDictionarySetValue(Mutable, @"serviceName", v16);
  }

  id v17 = [v14 objectAtIndexedSubscript:0];
  if (v17) {
    CFDictionarySetValue(Mutable, @"sessionID", v17);
  }

  IDSPowerLogDictionary();
  id v18 = [(IDSDSession *)self sharedState];
  if ([v18 useQRDirectly]) {
    goto LABEL_15;
  }
  id v19 = [(IDSDSession *)self sharedState];
  if ([v19 clientType] == (id)1)
  {
LABEL_14:

LABEL_15:
LABEL_16:
    *(void *)&unsigned char buf[32] = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v21 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v21;
    *(_OWORD *)&uint8_t buf[16] = v21;
    IDSByteBufferInitForWrite();
    v42[0] = 0xAAAAAAAAAAAAAAAALL;
    v42[1] = 0xAAAAAAAAAAAAAAAALL;
    char v40 = v8;
    char v41 = v6;
    [v10 getUUIDBytes:v42];
    IDSByteBufferWriteField();
    -[IDSDSession writeToClientChannel:packetBuffer:metaData:metadataSize:](self, "writeToClientChannel:packetBuffer:metaData:metadataSize:", self->_clientChannel, 0);
    IDSByteBufferRelease();
    goto LABEL_17;
  }
  id v20 = [(IDSDSession *)self sharedState];
  if ([v20 clientType] == (id)5)
  {

    goto LABEL_14;
  }
  id v29 = [(IDSDSession *)self sharedState];
  BOOL v36 = [v29 clientType] == (id)6;

  if (v36) {
    goto LABEL_16;
  }
  uint64_t v30 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = self;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "<%@> need a client channel to send the event kClientChannelMetadataType_LinkDisconnected", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
LABEL_17:
  unsigned int v22 = self->_connectedLinkCount - 1;
  self->_connectedLinkCount = v22;
  if (!v22)
  {
    uint64_t v23 = [(IDSDSession *)self sharedState];
    uint64_t v24 = [v23 uniqueID];
    id v25 = [v24 copy];

    long long v26 = im_primary_queue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000B2858;
    block[3] = &unk_10097E440;
    void block[4] = self;
    id v39 = v25;
    id v27 = v25;
    dispatch_block_t v28 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, block);
    dispatch_async(v26, v28);
  }
}

- (void)link:(id)a3 didReceiveReliableUnicastServerMaterial:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = v7;
  if (self->_reliableUnicastRegistrationCompletionBlock)
  {
    id v9 = [v7 mutableCopy];
    id v10 = [(IDSDSession *)self sharedState];
    int v11 = [v10 uniqueID];
    [v9 setValue:v11 forKey:IDSSessionUniqueIDKey];

    (*((void (**)(void))self->_reliableUnicastRegistrationCompletionBlock + 2))();
  }
  else
  {
    id v12 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v14 = self;
      __int16 v15 = 2112;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "<%@> link:%@ didReceiveReliableUnicastServerMaterial:%@, Registration Completion block is nil!", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

- (id)getLinkIDToLocalRemoteEndpointPairDictionary
{
  linkIDToLocalRemoteEndpointPair = self->_linkIDToLocalRemoteEndpointPair;
  if (!linkIDToLocalRemoteEndpointPair)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    id v5 = self->_linkIDToLocalRemoteEndpointPair;
    self->_linkIDToLocalRemoteEndpointPair = Mutable;

    linkIDToLocalRemoteEndpointPair = self->_linkIDToLocalRemoteEndpointPair;
  }
  id v6 = [(NSMutableDictionary *)linkIDToLocalRemoteEndpointPair copy];

  return v6;
}

- (void)link:(id)a3 didReceiveChildConnections:(id)a4 forLinkID:(char)a5
{
  int v5 = a5;
  id v8 = a3;
  id v9 = a4;
  char v37 = v5;
  id v10 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&unsigned char buf[24] = v9;
    LOWORD(v39) = 1024;
    *(_DWORD *)((char *)&v39 + 2) = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<%@> link:%@ didReceiveChildConnections:%@ forLinkID:%d", buf, 0x26u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v33 = v9;
    uint64_t v34 = v5;
    unsigned __int8 v31 = self;
    id v32 = v8;
    _IDSLogV();
  }
  int v11 = [(IDSDSession *)self sharedState];
  if ([v11 useQRDirectly]) {
    goto LABEL_11;
  }
  id v12 = [(IDSDSession *)self sharedState];
  if ([v12 clientType] == (id)1)
  {
LABEL_10:

LABEL_11:
LABEL_12:
    unint64_t v39 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v14 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v14;
    *(_OWORD *)&uint8_t buf[16] = v14;
    IDSByteBufferInitForWrite();
    __int16 v15 = +[NSMutableData dataWithBytes:&v37 length:1];
    id v16 = JWEncodeDictionary();
    [v15 appendData:v16];

    id v17 = v15;
    [v17 bytes];
    [v17 length];
    IDSByteBufferWriteField();
    -[IDSDSession writeToClientChannel:packetBuffer:metaData:metadataSize:](self, "writeToClientChannel:packetBuffer:metaData:metadataSize:", self->_clientChannel, 0);
    IDSByteBufferRelease();

    goto LABEL_13;
  }
  uint64_t v13 = [(IDSDSession *)self sharedState];
  if ([v13 clientType] == (id)5)
  {

    goto LABEL_10;
  }
  id v18 = [(IDSDSession *)self sharedState];
  BOOL v19 = [v18 clientType] == (id)6;

  if (v19) {
    goto LABEL_12;
  }
  id v20 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    long long v21 = [(IDSDSession *)self sharedState];
    if ([v21 useQRDirectly]) {
      CFStringRef v22 = @"YES";
    }
    else {
      CFStringRef v22 = @"NO";
    }
    uint64_t v23 = [(IDSDSession *)self sharedState];
    id v24 = [v23 clientType];
    if (v24 == (id)1)
    {
      int v25 = 0;
      CFStringRef v26 = @"YES";
    }
    else
    {
      BOOL v36 = [(IDSDSession *)self sharedState];
      CFStringRef v26 = @"YES";
      if ([v36 clientType] == (id)5)
      {
        int v25 = 0;
      }
      else
      {
        uint64_t v35 = [(IDSDSession *)self sharedState];
        if ([v35 clientType] != (id)6) {
          CFStringRef v26 = @"NO";
        }
        int v25 = 1;
      }
    }
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v22;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&unsigned char buf[24] = v26;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "No need to send kClientChannelMetadataType_ChildConnections, <%@> useQR: %@, isFaceTimeCall: %@", buf, 0x20u);
    if (v25) {

    }
    if (v24 != (id)1) {
  }
    }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v27 = [(IDSDSession *)self sharedState];
    [v27 useQRDirectly];
    dispatch_block_t v28 = [(IDSDSession *)self sharedState];
    if ([v28 clientType] == (id)1)
    {
      _IDSLogV();
    }
    else
    {
      id v29 = [(IDSDSession *)self sharedState];
      if ([v29 clientType] == (id)5)
      {
        _IDSLogV();
      }
      else
      {
        uint64_t v30 = [(IDSDSession *)self sharedState];
        [v30 clientType];
        _IDSLogV();
      }
    }
  }
LABEL_13:
}

- (void)link:(id)a3 didWiFiNWPathFlagsChanged:(unsigned __int16)a4
{
  unsigned int v4 = a4;
  id v6 = a3;
  id v7 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&unsigned char buf[24] = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<%@> link:%@ didWiFiNWPathFlagsChanged:%u", buf, 0x1Cu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v16 = v6;
    uint64_t v17 = v4;
    __int16 v15 = self;
    _IDSLogV();
  }
  id v8 = [(IDSDSession *)self sharedState];
  if ([v8 useQRDirectly]) {
    goto LABEL_11;
  }
  id v9 = [(IDSDSession *)self sharedState];
  if ([v9 clientType] == (id)1)
  {
LABEL_10:

LABEL_11:
LABEL_12:
    unint64_t v19 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v11;
    *(_OWORD *)&uint8_t buf[16] = v11;
    IDSByteBufferInitForWrite();
    IDSByteBufferWriteField();
    -[IDSDSession writeToClientChannel:packetBuffer:metaData:metadataSize:](self, "writeToClientChannel:packetBuffer:metaData:metadataSize:", self->_clientChannel, 0);
    IDSByteBufferRelease();
    goto LABEL_13;
  }
  id v10 = [(IDSDSession *)self sharedState];
  if ([v10 clientType] == (id)5)
  {

    goto LABEL_10;
  }
  id v12 = [(IDSDSession *)self sharedState];
  BOOL v13 = [v12 clientType] == (id)6;

  if (v13) {
    goto LABEL_12;
  }
  long long v14 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = self;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "<%@> need a client channel to send the event kClientChannelMetadataType_nwPathWiFiFlagsChanged", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
LABEL_13:
}

- (void)link:(id)a3 didCellularNWPathFlagsChanged:(unsigned __int16)a4
{
  unsigned int v4 = a4;
  id v6 = a3;
  id v7 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&unsigned char buf[24] = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<%@> link:%@ didCellularNWPathFlagsChanged:%u", buf, 0x1Cu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v16 = v6;
    uint64_t v17 = v4;
    __int16 v15 = self;
    _IDSLogV();
  }
  id v8 = [(IDSDSession *)self sharedState];
  if ([v8 useQRDirectly]) {
    goto LABEL_11;
  }
  id v9 = [(IDSDSession *)self sharedState];
  if ([v9 clientType] == (id)1)
  {
LABEL_10:

LABEL_11:
LABEL_12:
    unint64_t v19 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v11;
    *(_OWORD *)&uint8_t buf[16] = v11;
    IDSByteBufferInitForWrite();
    IDSByteBufferWriteField();
    -[IDSDSession writeToClientChannel:packetBuffer:metaData:metadataSize:](self, "writeToClientChannel:packetBuffer:metaData:metadataSize:", self->_clientChannel, 0);
    IDSByteBufferRelease();
    goto LABEL_13;
  }
  id v10 = [(IDSDSession *)self sharedState];
  if ([v10 clientType] == (id)5)
  {

    goto LABEL_10;
  }
  id v12 = [(IDSDSession *)self sharedState];
  BOOL v13 = [v12 clientType] == (id)6;

  if (v13) {
    goto LABEL_12;
  }
  long long v14 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = self;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "<%@> need a client channel to send the event kClientChannelMetadataType_nwPathCellularFlagsChanged", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
LABEL_13:
}

- (void)link:(id)a3 didRATChange:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  id v6 = a3;
  id v7 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&unsigned char buf[24] = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<%@> link:%@ didRATChange:%u", buf, 0x1Cu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v16 = v6;
    uint64_t v17 = v4;
    __int16 v15 = self;
    _IDSLogV();
  }
  id v8 = [(IDSDSession *)self sharedState];
  if ([v8 useQRDirectly]) {
    goto LABEL_11;
  }
  id v9 = [(IDSDSession *)self sharedState];
  if ([v9 clientType] == (id)1)
  {
LABEL_10:

LABEL_11:
LABEL_12:
    unint64_t v19 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v11;
    *(_OWORD *)&uint8_t buf[16] = v11;
    IDSByteBufferInitForWrite();
    IDSByteBufferWriteField();
    -[IDSDSession writeToClientChannel:packetBuffer:metaData:metadataSize:](self, "writeToClientChannel:packetBuffer:metaData:metadataSize:", self->_clientChannel, 0);
    IDSByteBufferRelease();
    goto LABEL_13;
  }
  id v10 = [(IDSDSession *)self sharedState];
  if ([v10 clientType] == (id)5)
  {

    goto LABEL_10;
  }
  id v12 = [(IDSDSession *)self sharedState];
  BOOL v13 = [v12 clientType] == (id)6;

  if (v13) {
    goto LABEL_12;
  }
  long long v14 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = self;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "<%@> need a client channel to send the event kClientChannelMetadataType_RATChanged", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
LABEL_13:
}

- (void)link:(id)a3 didCellularMTUChange:(unsigned __int16)a4
{
  unsigned int v4 = a4;
  id v6 = a3;
  id v7 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&unsigned char buf[24] = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<%@> link:%@ didCellularMTUChange:%u", buf, 0x1Cu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v16 = v6;
    uint64_t v17 = v4;
    __int16 v15 = self;
    _IDSLogV();
  }
  id v8 = [(IDSDSession *)self sharedState];
  if ([v8 useQRDirectly]) {
    goto LABEL_11;
  }
  id v9 = [(IDSDSession *)self sharedState];
  if ([v9 clientType] == (id)1)
  {
LABEL_10:

LABEL_11:
LABEL_12:
    unint64_t v19 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v11;
    *(_OWORD *)&uint8_t buf[16] = v11;
    IDSByteBufferInitForWrite();
    IDSByteBufferWriteField();
    -[IDSDSession writeToClientChannel:packetBuffer:metaData:metadataSize:](self, "writeToClientChannel:packetBuffer:metaData:metadataSize:", self->_clientChannel, 0);
    IDSByteBufferRelease();
    goto LABEL_13;
  }
  id v10 = [(IDSDSession *)self sharedState];
  if ([v10 clientType] == (id)5)
  {

    goto LABEL_10;
  }
  id v12 = [(IDSDSession *)self sharedState];
  BOOL v13 = [v12 clientType] == (id)6;

  if (v13) {
    goto LABEL_12;
  }
  long long v14 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = self;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "<%@> need a client channel to send the event kClientChannelMetadataType_CellularMTUChanged", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
LABEL_13:
}

- (void)link:(id)a3 didSoMaskChange:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&unsigned char buf[24] = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<%@> link:%@ didSoMaskChange:%u", buf, 0x1Cu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v16 = v6;
    uint64_t v17 = v4;
    __int16 v15 = self;
    _IDSLogV();
  }
  id v8 = [(IDSDSession *)self sharedState];
  if ([v8 useQRDirectly]) {
    goto LABEL_11;
  }
  id v9 = [(IDSDSession *)self sharedState];
  if ([v9 clientType] == (id)1)
  {
LABEL_10:

LABEL_11:
LABEL_12:
    unint64_t v19 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v11;
    *(_OWORD *)&uint8_t buf[16] = v11;
    IDSByteBufferInitForWrite();
    IDSByteBufferWriteField();
    -[IDSDSession writeToClientChannel:packetBuffer:metaData:metadataSize:](self, "writeToClientChannel:packetBuffer:metaData:metadataSize:", self->_clientChannel, 0);
    IDSByteBufferRelease();
    goto LABEL_13;
  }
  id v10 = [(IDSDSession *)self sharedState];
  if ([v10 clientType] == (id)5)
  {

    goto LABEL_10;
  }
  id v12 = [(IDSDSession *)self sharedState];
  BOOL v13 = [v12 clientType] == (id)6;

  if (v13) {
    goto LABEL_12;
  }
  long long v14 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = self;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "<%@> need a client channel to send the event kClientChannelMetadataType_SoMaskChanged", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
LABEL_13:
}

- (void)link:(id)a3 didGetLinkProbingStatus:(id)a4
{
  uint64_t v4 = __chkstk_darwin(self, a2);
  id v6 = v5;
  double v58 = (void *)v4;
  id v53 = v7;
  id v59 = v6;
  id v8 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)unsigned int v82 = v58;
    *(_WORD *)&v82[8] = 2112;
    id v83 = v53;
    __int16 v84 = 2112;
    id v85 = v59;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<%@> link:%@ didGetLinkProbingStatus:%@", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v48 = v53;
    id v50 = v59;
    __int16 v46 = v58;
    _IDSLogV();
  }
  id v9 = objc_msgSend(v58, "sharedState", v46, v48, v50);
  if ([v9 useQRDirectly]) {
    goto LABEL_11;
  }
  id v10 = [v58 sharedState];
  if ([v10 clientType] == (id)1)
  {
LABEL_10:

LABEL_11:
    goto LABEL_12;
  }
  long long v11 = [v58 sharedState];
  if ([v11 clientType] == (id)5)
  {

    goto LABEL_10;
  }
  unsigned int v43 = [v58 sharedState];
  BOOL v44 = [v43 clientType] == (id)6;

  if (!v44)
  {
    __int16 v45 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)unsigned int v82 = v58;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "<%@> need a client channel to send the event kClientChannelMetadataType_GetLinkStatusKey", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    goto LABEL_75;
  }
LABEL_12:
  char v54 = [v59 objectForKeyedSubscript:IDSDataChannelProbingLinkIDsKey];
  unsigned __int8 v57 = [v54 count];
  if (v57)
  {
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id obj = v54;
    id v67 = [obj countByEnumeratingWithState:&v72 objects:v86 count:16];
    if (v67)
    {
      unsigned __int8 v68 = 0;
      uint64_t v12 = 0;
      key = (void *)IDSDataChannelTimeStampKey;
      id v63 = (void *)IDSDataChannelNumberReorderedPacketsKey;
      BOOL v61 = (void *)IDSDataChannelNumberResponseKey;
      id v62 = (void *)IDSDataChannelNumberRequestsKey;
      double v60 = (void *)IDSDataChannelProbingRequestOffsetAndRTTKey;
      uint64_t v55 = *(void *)v73;
      uint64_t v13 = *(void *)v73;
      while (1)
      {
        if (v13 != v55)
        {
          uint64_t v14 = v12;
          objc_enumerationMutation(obj);
          uint64_t v12 = v14;
        }
        uint64_t v66 = v12;
        __int16 v15 = *(void **)(*((void *)&v72 + 1) + 8 * v12);
        bzero(buf, 0x1000uLL);
        CFDictionaryRef v16 = [v59 objectForKeyedSubscript:v15];
        buf[3] = v57;
        unsigned __int8 v69 = v68 + 1;
        v82[0] = v68 + 1;
        v82[1] = [v15 charValue];
        if (v16) {
          BOOL v17 = key != 0;
        }
        else {
          BOOL v17 = 0;
        }
        if (v17) {
          Value = (void *)CFDictionaryGetValue(v16, key);
        }
        else {
          Value = 0;
        }
        *(_DWORD *)&v82[2] = bswap32([Value unsignedIntValue]);
        if (v16 != 0 && v63 != 0) {
          unint64_t v19 = (void *)CFDictionaryGetValue(v16, v63);
        }
        else {
          unint64_t v19 = 0;
        }
        *(_WORD *)&v82[6] = __rev16([v19 unsignedShortValue]);
        if (v16 != 0 && v62 != 0) {
          id v20 = (void *)CFDictionaryGetValue(v16, v62);
        }
        else {
          id v20 = 0;
        }
        *(_WORD *)&v82[8] = __rev16([v20 unsignedShortValue]);
        if (v16 != 0 && v61 != 0) {
          long long v21 = (void *)CFDictionaryGetValue(v16, v61);
        }
        else {
          long long v21 = 0;
        }
        LOWORD(v83) = __rev16([v21 unsignedShortValue]);
        if (v16 != 0 && v60 != 0) {
          CFStringRef v22 = (void *)CFDictionaryGetValue(v16, v60);
        }
        else {
          CFStringRef v22 = 0;
        }
        id v23 = v22;
        unsigned int v24 = [v23 count];
        WORD1(v83) = bswap32(v24) >> 16;
        int v25 = (unsigned __int16)v24;
        unint64_t v65 = (unsigned __int16)v24;
        if ((_WORD)v24)
        {
          uint64_t v26 = 0;
          uint64_t v27 = 0;
          uint64_t v28 = 4 * (unsigned __int16)v24;
          while (1)
          {
            id v29 = [v23 objectAtIndexedSubscript:v27];
            uint64_t v30 = [v29 objectAtIndexedSubscript:0];
            unsigned int v31 = [v30 unsignedShortValue];

            *(_WORD *)((char *)&v83 + v26 + 4) = __rev16(v31);
            if (v26 == 4076) {
              break;
            }
            id v32 = [v23 objectAtIndexedSubscript:v27];
            id v33 = [v32 objectAtIndexedSubscript:1];
            unsigned int v34 = [v33 unsignedShortValue];

            *(_WORD *)((char *)&v83 + v26 + 6) = __rev16(v34);
            ++v27;
            v26 += 4;
            if (v28 == v26)
            {
              uint64_t v35 = (char *)&v83 + v26 + 4;
              goto LABEL_50;
            }
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
            sub_10070DF9C(&v70, v71);
          }
          BOOL v36 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t v76 = 138412546;
            *(void *)unsigned int v77 = v15;
            *(_WORD *)&v77[8] = 1024;
            *(_DWORD *)uint64_t v78 = 1019;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "didGetLinkProbingStatus: linkID: %@, rtt overflow, i: %d", v76, 0x12u);
          }

          uint64_t v35 = v86;
          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            unint64_t v47 = (unint64_t)v15;
            uint64_t v49 = 1019;
            _IDSLogV();
          }
          int v25 = 1019;
        }
        else
        {
          LOWORD(v35) = (unsigned __int16)&v83 + 4;
        }
        if (v25 != v65)
        {

          goto LABEL_67;
        }
LABEL_50:
        buf[0] = 60;
        uint64_t v37 = (unsigned __int16)((_WORD)v35 - (unsigned __int16)buf);
        *(_WORD *)&buf[1] = bswap32(v37 - 3) >> 16;
        unsigned int v38 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t v76 = 67109890;
          *(_DWORD *)unsigned int v77 = v69;
          *(_WORD *)&v77[4] = 1024;
          *(_DWORD *)&v77[6] = v57;
          *(_WORD *)uint64_t v78 = 2112;
          *(void *)&v78[2] = v15;
          __int16 v79 = 1024;
          int v80 = v37 - 3;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "currentLinkCount: %u/%u, linkID: %@, size: %u", v76, 0x1Eu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          unsigned int v51 = v15;
          uint64_t v52 = (v37 - 3);
          unint64_t v47 = v69;
          uint64_t v49 = v57;
          _IDSLogV();
        }
        objc_msgSend(v58, "writeToClientChannel:packetBuffer:metaData:metadataSize:", v58[9], 0, buf, v37, v47, v49, v51, v52);

        uint64_t v12 = v66 + 1;
        if (v66 + 1 >= (unint64_t)v67)
        {
          id v67 = [obj countByEnumeratingWithState:&v72 objects:v86 count:16];
          if (!v67)
          {
            unint64_t v65 = 0;
            ++v68;
            goto LABEL_67;
          }
          uint64_t v12 = 0;
        }
        uint64_t v13 = *(void *)v73;
        ++v68;
      }
    }
    unsigned __int8 v68 = 0;
    unint64_t v65 = 0;
LABEL_67:

    if (v57 != v68)
    {
      char v40 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)unsigned int v82 = v68;
        *(_WORD *)&v82[4] = 1024;
        *(_DWORD *)&v82[6] = v57;
        LOWORD(v83) = 1024;
        *(_DWORD *)((char *)&v83 + 2) = v65;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "processedLinks: %u/%u, lastCount: %u", buf, 0x14u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        uint64_t v49 = v57;
        unsigned int v51 = (void *)v65;
        unint64_t v47 = v68;
        _IDSLogV();
      }
      char v41 = +[NSProcessInfo processInfo];
      char v42 = [v41 processName];
      IMLogSimulateCrashForProcess();
    }
  }
  else
  {
    unint64_t v39 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "didGetLinkProbingStatus: No valid linkIDs", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }

LABEL_75:
}

- (void)link:(id)a3 didDefaultUnderlyingLinkChangeSucceeded:(BOOL)a4 currentDefaultLinkID:(char)a5
{
  int v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v10 = @"NO";
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = self;
    if (v6) {
      CFStringRef v10 = @"YES";
    }
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&unsigned char buf[24] = v10;
    LOWORD(v19) = 1024;
    *(_DWORD *)((char *)&v19 + 2) = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "<%@> link:%@ didDefaultUnderlyingLinkChangeSucceeded:%@ currentDefaultLinkID:%d", buf, 0x26u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  if (v6)
  {
    long long v11 = [(IDSDSession *)self sharedState];
    if ([v11 useQRDirectly])
    {
LABEL_14:

LABEL_15:
      unint64_t v19 = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&long long v14 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)buf = v14;
      *(_OWORD *)&uint8_t buf[16] = v14;
      IDSByteBufferInitForWrite();
      IDSByteBufferWriteField();
      -[IDSDSession writeToClientChannel:packetBuffer:metaData:metadataSize:](self, "writeToClientChannel:packetBuffer:metaData:metadataSize:", self->_clientChannel, 0);
      IDSByteBufferRelease();
      goto LABEL_16;
    }
    uint64_t v12 = [(IDSDSession *)self sharedState];
    if ([v12 clientType] == (id)1)
    {
LABEL_13:

      goto LABEL_14;
    }
    uint64_t v13 = [(IDSDSession *)self sharedState];
    if ([v13 clientType] == (id)5)
    {

      goto LABEL_13;
    }
    __int16 v15 = [(IDSDSession *)self sharedState];
    BOOL v16 = [v15 clientType] == (id)6;

    if (v16) {
      goto LABEL_15;
    }
    BOOL v17 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "<%@> need a client channel to send the event kClientChannelMetadataType_DefaultLinkID", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
LABEL_16:
}

- (void)link:(id)a3 didAddQREvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v18 = self;
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<%@> link:%@ didAddQREvent:%@", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v15 = v6;
    id v16 = v7;
    long long v14 = self;
    _IDSLogV();
  }
  id v9 = [(IDSDSession *)self sharedState];
  if (([v9 useQRDirectly] & 1) == 0)
  {
    CFStringRef v10 = [(IDSDSession *)self sharedState];
    if ([v10 clientType] != (id)1)
    {
      long long v11 = [(IDSDSession *)self sharedState];
      if ([v11 clientType] != (id)5)
      {
        uint64_t v12 = [(IDSDSession *)self sharedState];
        BOOL v13 = [v12 clientType] == (id)6;

        if (!v13) {
          goto LABEL_13;
        }
        goto LABEL_12;
      }
    }
  }

LABEL_12:
  [(IDSDSession *)self addQREventForRTCReport:v7];
LABEL_13:
}

- (void)link:(id)a3 didReceiveParticipantUpdate:(id)a4 status:(unsigned __int16)a5
{
  unsigned int v5 = a5;
  id v48 = a3;
  id v8 = a4;
  id v9 = +[IDSFoundationLog IDSDSession];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    unsigned int v82 = self;
    __int16 v83 = 2112;
    id v84 = v48;
    __int16 v85 = 2112;
    *(void *)unsigned int v86 = v8;
    *(_WORD *)&v86[8] = 1024;
    *(_DWORD *)&v86[10] = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "<%@> link:%@ didReceiveParticipantUpdate:%@, status:%u", buf, 0x26u);
  }

  CFStringRef v10 = [(IDSDSession *)self sharedState];
  if (([v10 useQRDirectly] & 1) == 0)
  {
    long long v11 = [(IDSDSession *)self sharedState];
    if ([v11 clientType] != (id)1)
    {
      uint64_t v12 = [(IDSDSession *)self sharedState];
      if ([v12 clientType] != (id)5)
      {
        uint64_t v28 = [(IDSDSession *)self sharedState];
        BOOL v29 = [v28 clientType] == (id)6;

        if (!v29) {
          goto LABEL_55;
        }
        goto LABEL_9;
      }
    }
  }

LABEL_9:
  if (v8)
  {
    BOOL v13 = [v8 objectForKey:IDSStunAttributeSessionStateCounterKey];
    unsigned int v14 = [v13 unsignedIntValue];

    id v15 = [v8 objectForKey:IDSStunAttributeSessionStateTypeKey];
    unsigned int v16 = [v15 unsignedShortValue];

    BOOL v17 = [v8 objectForKey:IDSStunAttributeEncParticipantIDsKey];
    id v18 = [v8 objectForKey:IDSStunAttributeStunTruncatedKey];
    BOOL v19 = v18 != 0;

    id v20 = [v8 objectForKey:IDSStunMessageTypeKey];
    unsigned int v21 = [v20 unsignedShortValue];

    if (v21 == 5)
    {
      if (v14 && v14 > self->_currentSessionStateCounter)
      {
        self->_currentSessionStateCounter = v14;
        id v22 = im_primary_queue();
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000B5894;
        block[3] = &unk_100981368;
        void block[4] = self;
        BOOL v17 = v17;
        uint64_t v76 = v17;
        __int16 v77 = v16;
        BOOL v78 = v19;
        dispatch_block_t v23 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, block);
        dispatch_async(v22, v23);
      }
    }
    else if (v21 - 2 > 2)
    {
      if (v21 == 6)
      {
        uint64_t v26 = im_primary_queue();
        v49[0] = _NSConcreteStackBlock;
        v49[1] = 3221225472;
        v49[2] = sub_1000B5F04;
        v49[3] = &unk_100980D38;
        v49[4] = self;
        __int16 v50 = v16;
        dispatch_block_t v27 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, v49);
        dispatch_async(v26, v27);
      }
      else
      {
        unsigned int v31 = +[IDSFoundationLog IDSDSession];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          sub_10070E048();
        }
      }
    }
    else
    {
      if ((v21 == 3 || v21 == 4 && (v5 & 0xFFFFFFFD) == 1) && v14 && v14 > self->_currentSessionStateCounter) {
        self->_currentSessionStateCounter = v14;
      }
      v73[0] = 0;
      v73[1] = v73;
      v73[2] = 0x2020000000;
      int v74 = -1431655766;
      if (v16 == 3)
      {
        unsigned int v24 = im_primary_queue();
        v67[0] = _NSConcreteStackBlock;
        v67[1] = 3221225472;
        v67[2] = sub_1000B59A0;
        v67[3] = &unk_100981390;
        __int16 v70 = v21;
        __int16 v71 = v5;
        void v67[4] = self;
        unsigned __int8 v69 = v73;
        unsigned __int8 v68 = v17;
        BOOL v72 = v19;
        dispatch_block_t v25 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, v67);
        dispatch_async(v24, v25);
      }
      else if (v16 > 2)
      {
        if (v16 == 4)
        {
          id v32 = im_primary_queue();
          v54[0] = _NSConcreteStackBlock;
          v54[1] = 3221225472;
          v54[2] = sub_1000B5C98;
          v54[3] = &unk_100981390;
          v54[4] = self;
          unsigned int v56 = v73;
          __int16 v57 = v21;
          __int16 v58 = v5;
          uint64_t v55 = v17;
          BOOL v59 = v19;
          sub_100087C00(v32, QOS_CLASS_USER_INTERACTIVE, v54);
        }
        else if (v16 - 7 > 1)
        {
          __int16 v45 = +[IDSFoundationLog IDSDSession];
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            unsigned int v82 = self;
            __int16 v83 = 2112;
            id v84 = v48;
            __int16 v85 = 1024;
            *(_DWORD *)unsigned int v86 = v16;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "<%@> link:%@ didReceiveParticipantUpdate: IDSQRSessionSTUNMessageTypeErrorResponse, operationFlag: %u, not supported", buf, 0x1Cu);
          }
        }
        else
        {
          __int16 v33 = v16 != 7;
          if (v5)
          {
            NSErrorUserInfoKey v79 = NSDebugDescriptionErrorKey;
            CFStringRef v80 = @"participantUpgrade message error";
            unsigned int v34 = +[NSDictionary dictionaryWithObjects:&v80 forKeys:&v79 count:1];
            uint64_t v35 = +[NSError errorWithDomain:@"participantUpgrade" code:v5 userInfo:v34];

            self->_BOOL isLightweightParticipant = v16 != 7;
            BOOL v36 = +[IDSFoundationLog IDSDSession];
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              BOOL isLightweightParticipant = self->_isLightweightParticipant;
              *(_DWORD *)buf = 138413058;
              if (isLightweightParticipant) {
                CFStringRef v38 = @"YES";
              }
              else {
                CFStringRef v38 = @"NO";
              }
              unsigned int v82 = self;
              __int16 v83 = 2112;
              id v84 = v48;
              __int16 v85 = 1024;
              *(_DWORD *)unsigned int v86 = v16;
              *(_WORD *)&v86[4] = 2112;
              *(void *)&v86[6] = v38;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "<%@> link:%@ didReceiveParticipantUpdate: operationFlag: %u has issue, change the _isLightweightParticipant to %@", buf, 0x26u);
            }

            unint64_t v39 = +[IDSFoundationLog IDSDSession];
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              char v40 = [(IDSDSession *)self sharedState];
              char v41 = [v40 groupID];
              *(_DWORD *)buf = 138412546;
              unsigned int v82 = self;
              __int16 v83 = 2112;
              id v84 = v41;
              _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "<%@> didReceiveParticipantUpdate: reset MKM status for: %@", buf, 0x16u);
            }
            char v42 = +[IDSGroupEncryptionController sharedInstance];
            unsigned int v43 = [(IDSDSession *)self sharedState];
            BOOL v44 = [v43 groupID];
            [v42 resetMKMLocalSentStatus:v44];

            if (self->_isLightweightParticipant) {
              [(IDSDSession *)self unregisterClientChannel];
            }
            else {
              [(IDSDSession *)self registerClientChannel];
            }
          }
          else
          {
            uint64_t v35 = 0;
          }
          __int16 v46 = im_primary_queue();
          v51[0] = _NSConcreteStackBlock;
          v51[1] = 3221225472;
          v51[2] = sub_1000B5E00;
          v51[3] = &unk_100980550;
          __int16 v53 = v33;
          v51[4] = self;
          id v52 = v35;
          id v47 = v35;
          sub_100087C00(v46, QOS_CLASS_USER_INTERACTIVE, v51);
        }
      }
      else
      {
        uint64_t v30 = im_primary_queue();
        v60[0] = _NSConcreteStackBlock;
        v60[1] = 3221225472;
        v60[2] = sub_1000B5AFC;
        v60[3] = &unk_1009813B8;
        __int16 v63 = v21;
        __int16 v64 = v5;
        v60[4] = self;
        id v62 = v73;
        __int16 v65 = v16;
        BOOL v61 = v17;
        BOOL v66 = v19;
        sub_100087C00(v30, QOS_CLASS_USER_INTERACTIVE, v60);
      }
      _Block_object_dispose(v73, 8);
    }
  }
  else
  {
    BOOL v17 = +[IDSFoundationLog IDSDSession];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10070DFE0();
    }
  }

LABEL_55:
}

- (void)link:(id)a3 didReceiveSessionStateCounter:(unsigned int)a4
{
  id v6 = a3;
  id v7 = +[IDSFoundationLog IDSDSession];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int currentSessionStateCounter = self->_currentSessionStateCounter;
    *(_DWORD *)buf = 138413058;
    id v18 = self;
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 1024;
    unsigned int v22 = a4;
    __int16 v23 = 1024;
    unsigned int v24 = currentSessionStateCounter;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<%@> link:%@ didReceiveSessionStateCounter:%u, _currentSessionStateCounter: %u", buf, 0x22u);
  }

  id v9 = [(IDSDSession *)self sharedState];
  if (([v9 useQRDirectly] & 1) == 0)
  {
    CFStringRef v10 = [(IDSDSession *)self sharedState];
    if ([v10 clientType] != (id)1)
    {
      long long v11 = [(IDSDSession *)self sharedState];
      if ([v11 clientType] != (id)5)
      {
        unsigned int v14 = [(IDSDSession *)self sharedState];
        id v15 = [v14 clientType];

        if (v15 != (id)6) {
          goto LABEL_11;
        }
        goto LABEL_9;
      }
    }
  }

LABEL_9:
  if (self->_currentSessionStateCounter < a4)
  {
    uint64_t v12 = im_primary_queue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000B6220;
    block[3] = &unk_10097E4D0;
    void block[4] = self;
    dispatch_block_t v13 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, block);
    dispatch_async(v12, v13);
  }
LABEL_11:
}

- (void)link:(id)a3 didReceivePluginRegistration:(unint64_t)a4 pluginName:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  CFStringRef v10 = +[IDSFoundationLog IDSDSession];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    BOOL v29 = self;
    __int16 v30 = 2112;
    id v31 = v8;
    __int16 v32 = 2048;
    unint64_t v33 = a4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<%@> link:%@ plugin didReceivePluginRegistration: %llu", buf, 0x20u);
  }

  long long v11 = [(IDSDSession *)self sharedState];
  if (([v11 useQRDirectly] & 1) == 0)
  {
    uint64_t v12 = [(IDSDSession *)self sharedState];
    if ([v12 clientType] != (id)1)
    {
      dispatch_block_t v13 = [(IDSDSession *)self sharedState];
      if ([v13 clientType] != (id)5)
      {
        unsigned int v22 = [(IDSDSession *)self sharedState];
        id v23 = [v22 clientType];

        if (v23 != (id)6) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }
    }
  }

LABEL_9:
  unsigned int v14 = [(IDSGroupStatusNotificationParameters *)self->_groupStatusNotificationParams participantID];
  id v15 = [v14 unsignedLongLongValue];

  v26[0] = IDSGroupSessionParticipantIdentifierKey;
  unsigned int v16 = +[NSNumber numberWithUnsignedLongLong:a4];
  v27[0] = v16;
  v26[1] = IDSGroupSessionLocalParticipantIdentifierKey;
  BOOL v17 = +[NSNumber numberWithUnsignedLongLong:v15];
  v26[2] = IDSGroupSessionPluginNameKey;
  v27[1] = v17;
  v27[2] = v9;
  id v18 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3];

  __int16 v19 = im_primary_queue();
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  _OWORD v24[2] = sub_1000B65EC;
  v24[3] = &unk_10097E440;
  v24[4] = self;
  id v25 = v18;
  id v20 = v18;
  dispatch_block_t v21 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, v24);
  dispatch_async(v19, v21);

LABEL_10:
}

- (void)link:(id)a3 didReceivePluginUnregistration:(unint64_t)a4 pluginName:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  CFStringRef v10 = +[IDSFoundationLog IDSDSession];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v26 = self;
    __int16 v27 = 2112;
    id v28 = v8;
    __int16 v29 = 2048;
    unint64_t v30 = a4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<%@> link:%@ plugin didReceivePluginUnregistration: %llu", buf, 0x20u);
  }

  long long v11 = [(IDSDSession *)self sharedState];
  if (([v11 useQRDirectly] & 1) == 0)
  {
    uint64_t v12 = [(IDSDSession *)self sharedState];
    if ([v12 clientType] != (id)1)
    {
      dispatch_block_t v13 = [(IDSDSession *)self sharedState];
      if ([v13 clientType] != (id)5)
      {
        __int16 v19 = [(IDSDSession *)self sharedState];
        id v20 = [v19 clientType];

        if (v20 != (id)6) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }
    }
  }

LABEL_9:
  v23[0] = IDSGroupSessionParticipantIdentifierKey;
  unsigned int v14 = +[NSNumber numberWithUnsignedLongLong:a4];
  v23[1] = IDSGroupSessionPluginNameKey;
  v24[0] = v14;
  v24[1] = v9;
  id v15 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];

  unsigned int v16 = im_primary_queue();
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000B6974;
  v21[3] = &unk_10097E440;
  void v21[4] = self;
  id v22 = v15;
  id v17 = v15;
  dispatch_block_t v18 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, v21);
  dispatch_async(v16, v18);

LABEL_10:
}

- (void)link:(id)a3 didReceiveRequestToPurgeRegistration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IDSFoundationLog IDSDSession];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    dispatch_block_t v13 = self;
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<%@> link:%@ plugin didReceiveRequestToPurgeRegistration:%@", buf, 0x20u);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000B6BBC;
  v10[3] = &unk_1009813E0;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v7 enumerateKeysAndObjectsUsingBlock:v10];
}

- (void)link:(id)a3 didReceivePluginDisconnect:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IDSFoundationLog IDSDSession];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412802;
    id v11 = self;
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<%@> link:%@ plugin didReceivePluginDisconnect:%@", (uint8_t *)&v10, 0x20u);
  }

  multiplexerTransport = self->_multiplexerTransport;
  if (multiplexerTransport) {
    [(IDSMultiplexerGroupSessionTransport *)multiplexerTransport purgeQUICConnectionsForParticipants:v7];
  }
}

- (id)_createOneWayParticipantDictionaryFromMappedParticipantsDict:(id)a3
{
  id v3 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B6DE4;
  v7[3] = &unk_100981408;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = v8;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];

  id v5 = [v4 copy];

  return v5;
}

- (id)_breakDictionaryIntoMultipleChunks:(id)a3 chunkSize:(int)a4
{
  id v5 = a3;
  unsigned int v24 = [v5 allKeys];
  id v6 = [v24 count];
  id v23 = objc_alloc_init((Class)NSMutableArray);
  if (v6)
  {
    int v7 = 0;
    unint64_t v22 = a4;
    do
    {
      int v8 = v7;
      if ((unint64_t)v6 >= v22) {
        id v9 = (unsigned char *)v22;
      }
      else {
        id v9 = v6;
      }
      int v10 = objc_msgSend(v24, "subarrayWithRange:", v7, v9);
      id v11 = objc_alloc_init((Class)NSMutableDictionary);
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v12 = v10;
      id v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v26;
        do
        {
          for (int i = 0; i != v14; int i = (char *)i + 1)
          {
            if (*(void *)v26 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 8 * i);
            dispatch_block_t v18 = [v5 objectForKeyedSubscript:v17];
            [v11 setObject:v18 forKey:v17];
          }
          id v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v14);
      }

      id v19 = [v11 copy];
      [v23 addObject:v19];

      v6 -= (unint64_t)[v12 count];
      int v7 = [v12 count] + v8;
    }
    while (v6);
  }
  id v20 = [v23 copy];

  return v20;
}

- (void)_sendParticipantMappingUpdateToClient:(id)a3 forLinkID:(char)a4 shouldReplace:(BOOL)a5
{
  id v6 = +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  IDSByteBufferInitForWrite();
  IDSByteBufferWriteField();
  id v7 = v6;
  [v7 bytes];
  [v7 length];
  IDSByteBufferWriteField();
  -[IDSDSession writeToClientChannel:packetBuffer:metaData:metadataSize:](self, "writeToClientChannel:packetBuffer:metaData:metadataSize:", self->_clientChannel, 0);
  IDSByteBufferRelease();
}

- (void)link:(id)a3 didReceiveMappedParticipantsDict:(id)a4 forLinkID:(char)a5
{
  uint64_t v5 = a5;
  id v8 = a3;
  id v9 = a4;
  int v10 = +[IDSFoundationLog IDSDSession];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    unsigned int v24 = self;
    __int16 v25 = 2112;
    id v26 = v8;
    __int16 v27 = 2112;
    id v28 = v9;
    __int16 v29 = 1024;
    int v30 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<%@> link:%@ didReceiveMappedParticipantsDict:%@ for linkID:%d ", buf, 0x26u);
  }

  id v11 = [(IDSDSession *)self sharedState];
  if (([v11 useQRDirectly] & 1) == 0)
  {
    id v12 = [(IDSDSession *)self sharedState];
    if ([v12 clientType] != (id)1)
    {
      id v13 = [(IDSDSession *)self sharedState];
      if ([v13 clientType] != (id)5)
      {
        id v19 = [(IDSDSession *)self sharedState];
        id v20 = [v19 clientType];

        if (v20 != (id)6) {
          goto LABEL_15;
        }
        goto LABEL_9;
      }
    }
  }

LABEL_9:
  id v14 = [(IDSDSession *)self _createOneWayParticipantDictionaryFromMappedParticipantsDict:v9];
  if ((unint64_t)[v14 count] > 0x1D)
  {
    uint64_t v15 = [(IDSDSession *)self _breakDictionaryIntoMultipleChunks:v14 chunkSize:30];
    __int16 v16 = +[IDSFoundationLog IDSDSession];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = (IDSDSession *)[v9 count];
      id v18 = [v15 count];
      *(_DWORD *)buf = 134218240;
      unsigned int v24 = v17;
      __int16 v25 = 2048;
      id v26 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "didReceiveMappedParticipantsDict: breaking %lu element dict into %lu chunks.", buf, 0x16u);
    }

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000B7414;
    v21[3] = &unk_100981430;
    void v21[4] = self;
    char v22 = v5;
    [v15 enumerateObjectsUsingBlock:v21];
  }
  else
  {
    [(IDSDSession *)self _sendParticipantMappingUpdateToClient:v14 forLinkID:v5 shouldReplace:1];
  }

LABEL_15:
}

- (void)didReceiveBlockedIndicationForLink:(id)a3 reason:(unsigned int)a4
{
  id v6 = a3;
  id v7 = +[IDSFoundationLog IDSDSession];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v18 = self;
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 1024;
    unsigned int v22 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<%@> didReceiveBlockedIndicationForLink:%@ reason: %u", buf, 0x1Cu);
  }

  id v8 = [(IDSDSession *)self sharedState];
  if (([v8 useQRDirectly] & 1) == 0)
  {
    id v9 = [(IDSDSession *)self sharedState];
    if ([v9 clientType] != (id)1)
    {
      int v10 = [(IDSDSession *)self sharedState];
      if ([v10 clientType] != (id)5)
      {
        id v13 = [(IDSDSession *)self sharedState];
        id v14 = [v13 clientType];

        if (v14 != (id)6) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }
    }
  }

LABEL_9:
  id v11 = im_primary_queue();
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000B7630;
  v15[3] = &unk_10097FDE8;
  v15[4] = self;
  unsigned int v16 = a4;
  dispatch_block_t v12 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, v15);
  dispatch_async(v11, v12);

LABEL_10:
}

- (void)link:(id)a3 didReceiveEncryptedDataBlobs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IDSFoundationLog IDSDSession];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v15 = self;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<%@> link: %@ didReceiveEncryptedDataBlobs: %@", buf, 0x20u);
  }

  id v9 = im_primary_queue();
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000B77B4;
  v12[3] = &unk_10097E440;
  v12[4] = self;
  id v13 = v7;
  id v10 = v7;
  dispatch_block_t v11 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, v12);
  dispatch_async(v9, v11);
}

- (void)link:(id)a3 didReceiveErrorIndicationWithCode:(unsigned int)a4
{
  id v6 = a3;
  id v7 = +[IDSFoundationLog IDSDSession];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    unsigned int v13 = a4;
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "didReceiveErrorIndicationWithCode: %u for link: %@ <%@>", buf, 0x1Cu);
  }

  if (a4 == 2)
  {
    [(IDSGFTMetricsCollector *)self->_metricsCollector serverShortMKICacheMiss];
  }
  else
  {
    id v8 = im_primary_queue();
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000B7930;
    v10[3] = &unk_10097FDE8;
    v10[4] = self;
    unsigned int v11 = a4;
    dispatch_block_t v9 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, v10);
    dispatch_async(v8, v9);
  }
}

- (void)link:(id)a3 didReceiveEncryptionInformation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = [v7 isGeneratedLocally];
    CFStringRef v10 = @"NO";
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&unsigned char buf[12] = 2112;
    if (v9) {
      CFStringRef v10 = @"YES";
    }
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&unsigned char buf[24] = v7;
    LOWORD(v37[0]) = 2112;
    *(void *)((char *)v37 + 2) = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<%@> link:%@ didReceiveEncryptionInformation:%@, local: %@", buf, 0x2Au);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    unsigned int v11 = [v7 isGeneratedLocally];
    CFStringRef v12 = @"NO";
    if (v11) {
      CFStringRef v12 = @"YES";
    }
    id v33 = v7;
    CFStringRef v34 = v12;
    id v31 = self;
    id v32 = v6;
    _IDSLogV();
  }
  unsigned int v13 = [(IDSDSession *)self sharedState];
  if (([v13 useQRDirectly] & 1) == 0)
  {
    __int16 v14 = [(IDSDSession *)self sharedState];
    if ([v14 clientType] != (id)1)
    {
      id v15 = [(IDSDSession *)self sharedState];
      if ([v15 clientType] != (id)5)
      {
        __int16 v29 = [(IDSDSession *)self sharedState];
        BOOL v30 = [v29 clientType] == (id)6;

        if (!v30) {
          goto LABEL_20;
        }
        goto LABEL_16;
      }
    }
  }

LABEL_16:
  id v16 = [v7 isGeneratedLocally];
  metricsCollector = self->_metricsCollector;
  __int16 v18 = [v7 keyIndex];
  [(IDSGFTMetricsCollector *)metricsCollector sendMKMToAVC:v18 isGeneratedLocally:v16];

  v35[0] = 0xAAAAAAAAAAAAAAAALL;
  v35[1] = 0xAAAAAAAAAAAAAAAALL;
  id v19 = [v7 keyIndex];
  [v19 getUUIDBytes:v35];

  v37[0] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v20 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)buf = v20;
  *(_OWORD *)&uint8_t buf[16] = v20;
  IDSByteBufferInitForWrite();
  if (v16)
  {
    __int16 v21 = [(IDSDSession *)self sharedState];
    unsigned int v22 = [v21 groupID];
    BOOL v23 = v22 == 0;

    if (!v23)
    {
      unsigned int v24 = +[IDSGroupEncryptionController sharedInstance];
      __int16 v25 = [(IDSDSession *)self sharedState];
      id v26 = [v25 groupID];
      [v24 encryptionSequenceNumberForGroupID:v26];

      IDSByteBufferWriteField();
    }
  }
  id v27 = [v7 keyMaterial];
  [v27 bytes];
  IDSByteBufferWriteField();

  id v28 = [v7 keySalt];
  [v28 bytes];
  IDSByteBufferWriteField();

  IDSByteBufferWriteField();
  IDSByteBufferWriteField();
  [v7 shortKeyIndexLength];
  IDSByteBufferWriteField();
  [v7 participantID];
  IDSByteBufferWriteField();
  -[IDSDSession writeToClientChannel:packetBuffer:metaData:metadataSize:](self, "writeToClientChannel:packetBuffer:metaData:metadataSize:", self->_clientChannel, 0);
  IDSByteBufferRelease();
LABEL_20:
}

- (void)link:(id)a3 didReceiveMembershipChangedInformation:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  id v6 = a3;
  id v7 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&unsigned char buf[24] = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<%@> link:%@ didReceiveMembershipChangedInformation:%u", buf, 0x1Cu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v15 = v6;
    uint64_t v16 = v4;
    __int16 v14 = self;
    _IDSLogV();
  }
  id v8 = [(IDSDSession *)self sharedState];
  if (([v8 useQRDirectly] & 1) == 0)
  {
    unsigned int v9 = [(IDSDSession *)self sharedState];
    if ([v9 clientType] != (id)1)
    {
      CFStringRef v10 = [(IDSDSession *)self sharedState];
      if ([v10 clientType] != (id)5)
      {
        CFStringRef v12 = [(IDSDSession *)self sharedState];
        BOOL v13 = [v12 clientType] == (id)6;

        if (!v13) {
          goto LABEL_13;
        }
        goto LABEL_12;
      }
    }
  }

LABEL_12:
  unint64_t v18 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)buf = v11;
  *(_OWORD *)&uint8_t buf[16] = v11;
  IDSByteBufferInitForWrite();
  IDSByteBufferWriteField();
  -[IDSDSession writeToClientChannel:packetBuffer:metaData:metadataSize:](self, "writeToClientChannel:packetBuffer:metaData:metadataSize:", self->_clientChannel, 0);
  IDSByteBufferRelease();
LABEL_13:
}

- (void)link:(id)a3 didReceiveDebugDataForClient:(id)a4 dataType:(unsigned __int8)a5
{
  id v7 = a3;
  id v8 = a4;
  unsigned int v9 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v7;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&unsigned char buf[24] = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "<%@> link:%@ didReceiveDebugDataForClient:%@", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v18 = v7;
    id v19 = v8;
    id v17 = self;
    _IDSLogV();
  }
  CFStringRef v10 = [(IDSDSession *)self sharedState];
  if (([v10 useQRDirectly] & 1) == 0)
  {
    long long v11 = [(IDSDSession *)self sharedState];
    if ([v11 clientType] != (id)1)
    {
      CFStringRef v12 = [(IDSDSession *)self sharedState];
      if ([v12 clientType] != (id)5)
      {
        id v15 = [(IDSDSession *)self sharedState];
        BOOL v16 = [v15 clientType] == (id)6;

        if (!v16) {
          goto LABEL_13;
        }
        goto LABEL_12;
      }
    }
  }

LABEL_12:
  id v13 = v8;
  [v13 bytes];
  unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v14 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)buf = v14;
  *(_OWORD *)&uint8_t buf[16] = v14;
  IDSByteBufferInitForWrite();
  IDSByteBufferWriteField();
  [v13 length];
  IDSByteBufferWriteField();
  -[IDSDSession writeToClientChannel:packetBuffer:metaData:metadataSize:](self, "writeToClientChannel:packetBuffer:metaData:metadataSize:", self->_clientChannel, 0);
  IDSByteBufferRelease();
LABEL_13:
}

- (void)terminateCallDueToIdleClientForLink:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v17 = self;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<%@> terminateCallDueToIdleClientForLink:%@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v13 = self;
    id v14 = v4;
    _IDSLogV();
  }
  id v6 = [(IDSDSession *)self sharedState];
  if (([v6 useQRDirectly] & 1) == 0)
  {
    id v7 = [(IDSDSession *)self sharedState];
    if ([v7 clientType] != (id)1)
    {
      id v8 = [(IDSDSession *)self sharedState];
      if ([v8 clientType] != (id)5)
      {
        long long v11 = [(IDSDSession *)self sharedState];
        BOOL v12 = [v11 clientType] == (id)6;

        if (!v12) {
          goto LABEL_13;
        }
        goto LABEL_12;
      }
    }
  }

LABEL_12:
  unsigned int v9 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B8590;
  block[3] = &unk_10097E4D0;
  void block[4] = self;
  dispatch_block_t v10 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, block);
  dispatch_async(v9, v10);

LABEL_13:
}

- (void)_sendSessionInfoResponseErrorToClient:(unsigned int)a3
{
}

- (void)_processParticipantInfo:(id)a3 type:(unint64_t)a4
{
  id v5 = a3;
  __int16 v45 = self;
  if (self->_handOffOverQREnabled)
  {
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v35 = v5;
    id obj = [v5 allKeys];
    id v33 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
    if (v33)
    {
      uint64_t v32 = *(void *)v59;
      do
      {
        for (int i = 0; i != v33; int i = (char *)i + 1)
        {
          if (*(void *)v59 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v43 = *(void *)(*((void *)&v58 + 1) + 8 * i);
          id v6 = objc_msgSend(v35, "objectForKeyedSubscript:");
          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          id v37 = v6;
          id v40 = [v37 countByEnumeratingWithState:&v54 objects:v62 count:16];
          if (v40)
          {
            uint64_t v38 = *(void *)v55;
            while (2)
            {
              uint64_t v7 = 0;
              do
              {
                if (*(void *)v55 != v38)
                {
                  uint64_t v8 = v7;
                  objc_enumerationMutation(v37);
                  uint64_t v7 = v8;
                }
                uint64_t v41 = v7;
                unsigned int v9 = *(void **)(*((void *)&v54 + 1) + 8 * v7);
                dispatch_block_t v10 = objc_msgSend(v9, "subdataWithRange:", 0, 8);
                if ((unint64_t)[v10 length] <= 7)
                {
                  BOOL v30 = OSLogHandleForTransportCategory();
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "_processParticipantInfo: invalid encryptedBlobLength!", buf, 2u);
                  }

                  if (os_log_shim_legacy_logging_enabled())
                  {
                    if (_IDSShouldLogTransport())
                    {
                      _IDSLogTransport();
                      if (_IDSShouldLog()) {
                        _IDSLogV();
                      }
                    }
                  }

                  goto LABEL_25;
                }
                id v44 = v10;
                uint64_t v11 = *(void *)[v44 bytes];
                BOOL v12 = objc_msgSend(v9, "subdataWithRange:", 8, v11);
                id v13 = objc_msgSend(v9, "subdataWithRange:", v11 + 8, (char *)objc_msgSend(v9, "length") - v11 - 8);
                id v14 = [objc_alloc((Class)NSMutableData) initWithData:v44];
                [v14 appendData:v12];
                id v15 = [(IDSDSession *)v45 _getURIFromParticipantIDNumber:v43];
                BOOL v16 = [(IDSDSession *)v45 sharedState];
                id v17 = [v16 serviceName];
                char v42 = +[IDSURI URIWithPrefixedURI:v15 withServiceLoggingHint:v17];

                __int16 v18 = [(IDSDSession *)v45 _getPushTokenFromParticipantIDNumber:v43];
                id v19 = [(IDSDSession *)v45 sharedState];
                long long v20 = [v19 serviceName];
                unint64_t v21 = +[IDSPushToken pushTokenWithData:v18 withServiceLoggingHint:v20];

                unsigned int v22 = +[IDSEncryptionController sharedInstance];
                BOOL v23 = [(IDSDSession *)v45 getCallerCert];
                unsigned int v24 = [v21 rawToken];
                __int16 v25 = [(IDSDSession *)v45 getFromService];
                id v26 = [(IDSDSession *)v45 fromURI];
                v46[0] = _NSConcreteStackBlock;
                v46[1] = 3221225472;
                v46[2] = sub_1000B8BC4;
                v46[3] = &unk_100981480;
                id v47 = v13;
                id v48 = v14;
                id v49 = v12;
                __int16 v50 = v45;
                uint64_t v51 = v43;
                unint64_t v52 = a4;
                id v27 = v12;
                id v28 = v14;
                id v29 = v13;
                LOBYTE(v31) = 0;
                [v22 publicKeyVerifySignedData:v29 matchesData:v28 forSignatureType:0 identity:v23 forURI:v42 pushToken:v24 service:v25 localURI:v26 priority:300 completion:v46 avoidMainQueue:v31];

                uint64_t v7 = v41 + 1;
              }
              while (v40 != (id)(v41 + 1));
              id v40 = [v37 countByEnumeratingWithState:&v54 objects:v62 count:16];
              if (v40) {
                continue;
              }
              break;
            }
          }
        }
        id v33 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
      }
      while (v33);
    }
LABEL_25:

    id v5 = v35;
  }
}

- (void)link:(id)a3 didReceiveSessionInfo:(id)a4 relayGroupID:(id)a5 relaySessionID:(id)a6 status:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  id v11 = a3;
  id v12 = a4;
  id v106 = a5;
  id v107 = a6;
  unint64_t v105 = v11;
  id v13 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&unsigned char buf[24] = v106;
    *(_WORD *)&unsigned char buf[32] = 2112;
    *(void *)&buf[34] = v107;
    __int16 v119 = 1024;
    int v120 = v7;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "link:%@ didReceiveSessionInfo:%@ relayGroupID:%@ relaySessionID:%@ status: %u", buf, 0x30u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    double v98 = *(double *)&v107;
    uint64_t v99 = v7;
    id v95 = v12;
    id v96 = v106;
    id v94 = v11;
    _IDSLogV();
  }
  if (!v7)
  {
    id v19 = [v12 objectForKey:IDSGlobalLinkOptionSessionInfoRequestTypeKey];
    unsigned int v20 = [v19 intValue];

    unint64_t v21 = [v12 objectForKeyedSubscript:IDSGlobalLinkOptionSessionInfoResponseOfflineRequestKey];
    unsigned int v22 = [v21 BOOLValue];

    BOOL v23 = [v12 objectForKeyedSubscript:IDSGlobalLinkOptionSessionInfoIndicationKey];
    unsigned int v24 = [v23 BOOLValue];

    uint64_t v25 = IDSGlobalLinkOptionSessionInfoResponseStreamInfoKey;
    id v26 = [v12 objectForKeyedSubscript:IDSGlobalLinkOptionSessionInfoResponseStreamInfoKey];
    id v27 = (const void *)kIDSQRAllocateKey_StreamInfoGenerationCounter;
    if (v26 && kIDSQRAllocateKey_StreamInfoGenerationCounter)
    {
      CFDictionaryRef v28 = [v12 objectForKeyedSubscript:v25];
      id v29 = objc_msgSend((id)CFDictionaryGetValue(v28, v27), "unsignedIntValue");
    }
    else
    {
      id v29 = objc_msgSend(0, "unsignedIntValue", v94, v95, v96, *(void *)&v98, v99);
    }

    BOOL v30 = [v12 objectForKey:IDSGlobalLinkOptionSessionInfoCommandFlagKey];
    unsigned __int8 v31 = [v30 unsignedIntValue];

    __int16 v102 = [v12 objectForKey:IDSGlobalLinkOptionSessionInfoResponseLightweightParticipantsKey];
    CFStringRef v101 = [v12 objectForKey:IDSGlobalLinkOptionSessionInfoResponseJoinedParticipantInfoKey];
    __int16 v100 = [v12 objectForKey:IDSGlobalLinkOptionSessionInfoResponseLeftParticipantInfoKey];
    [(IDSDSession *)self _processParticipantInfo:v101 type:1];
    [(IDSDSession *)self _processParticipantInfo:v100 type:2];
    if (((v22 | v24 ^ 1) & 1) == 0 && self->_currentGenerationCounter >= v29)
    {
      genCounterUpdatedByResponseTime = self->_genCounterUpdatedByResponseTime;
      if (genCounterUpdatedByResponseTime)
      {
        [(NSDate *)genCounterUpdatedByResponseTime timeIntervalSinceNow];
        double v34 = -v33;
        id v35 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int currentGenerationCounter = self->_currentGenerationCounter;
          *(_DWORD *)buf = 138413058;
          *(void *)&uint8_t buf[4] = v105;
          *(_WORD *)&unsigned char buf[12] = 1024;
          *(_DWORD *)&buf[14] = v29;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = currentGenerationCounter;
          *(_WORD *)&unsigned char buf[24] = 2048;
          *(double *)&buf[26] = v34;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "link:%@ didReceiveSessionInfo: Got outdated indication with generationCounter: %u, currentGenerationCounter: %u after %lf seconds", buf, 0x22u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          double v98 = v34;
          id v95 = v29;
          id v96 = self->_currentGenerationCounter;
          id v94 = v105;
          _IDSLogV();
        }
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        [(__CFDictionary *)Mutable setObject:&off_1009D0E88 forKeyedSubscript:IDSDSessionReportQREventSubTypeKey];
        uint64_t v38 = +[NSNumber numberWithDouble:v34];
        [(__CFDictionary *)Mutable setObject:v38 forKeyedSubscript:IDSDSessionReportDurationKey];

        [(__CFDictionary *)Mutable setObject:&off_1009D0D68 forKeyedSubscript:IDSDSessionReportResultCodeKey];
        [(IDSDSession *)self addQREventForRTCReport:Mutable];
      }
    }
    if (v20 == 2) {
      char v39 = v22;
    }
    else {
      char v39 = 1;
    }
    if ((v39 & 1) != 0
      || (unsigned int v40 = self->_currentGenerationCounter, v40 < v29)
      || v40 == v29 && (v31 & 1) != 0)
    {
      if ((v22 & 1) == 0 && self->_currentGenerationCounter < v29)
      {
        uint64_t v41 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v42 = self->_currentGenerationCounter;
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v105;
          *(_WORD *)&unsigned char buf[12] = 1024;
          *(_DWORD *)&buf[14] = v42;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v29;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "link:%@ didReceiveSessionInfo: increment generation counter (%u -> %u)", buf, 0x18u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          id v95 = self->_currentGenerationCounter;
          id v96 = v29;
          id v94 = v105;
          _IDSLogV();
        }
        self->_unsigned int currentGenerationCounter = v29;
        if (v24)
        {
          uint64_t v43 = self->_genCounterUpdatedByResponseTime;
          self->_genCounterUpdatedByResponseTime = 0;
        }
        else
        {
          __int16 v46 = (NSDate *)objc_alloc_init((Class)NSDate);
          uint64_t v43 = self->_genCounterUpdatedByResponseTime;
          self->_genCounterUpdatedByResponseTime = v46;
        }
      }
      id v47 = objc_msgSend(v12, "objectForKeyedSubscript:", IDSGlobalLinkOptionSessionInfoResponseParticipantsKey, v94, v95, v96, *(void *)&v98);
      if ([v47 count])
      {
        id v48 = [(IDSDSession *)self _getPushTokensFromParticipantIDArray:v47 useNullPlaceholder:1];
        [(IDSDSession *)self getActiveParticipants:v47 pushTokenForParticipants:v48 isLightweightParticipant:0];
      }
      else
      {
        im_primary_queue();
        v115[0] = _NSConcreteStackBlock;
        v115[1] = 3221225472;
        v115[2] = sub_1000BA284;
        v115[3] = &unk_10097E4D0;
        v115[4] = self;
        id v49 = (id)objc_claimAutoreleasedReturnValue();
        dispatch_block_t v50 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, v115);
        dispatch_async(v49, v50);
      }
      if ([v102 count])
      {
        uint64_t v51 = [(IDSDSession *)self _getPushTokensFromParticipantIDArray:v102 useNullPlaceholder:1];
        [(IDSDSession *)self getActiveParticipants:v102 pushTokenForParticipants:v51 isLightweightParticipant:1];
      }
      else
      {
        im_primary_queue();
        v114[0] = _NSConcreteStackBlock;
        v114[1] = 3221225472;
        v114[2] = sub_1000BA40C;
        v114[3] = &unk_10097E4D0;
        v114[4] = self;
        unint64_t v52 = (id)objc_claimAutoreleasedReturnValue();
        dispatch_block_t v53 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, v114);
        dispatch_async(v52, v53);
      }
    }
    __int16 v104 = objc_msgSend(v12, "objectForKeyedSubscript:", v25, v94, v95, v96);
    if (!v104) {
      goto LABEL_118;
    }
    CFDictionaryRef theDict = +[NSMutableDictionary dictionary];
    long long v54 = [v104 objectForKeyedSubscript:IDSGlobalLinkOptionLinkIDKey];
    if (v54)
    {
      CFDictionarySetValue(theDict, IDSDataChannelLinkIDKey, v54);
    }
    else
    {
      id v55 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10070E3FC();
      }
    }
    long long v56 = [v104 objectForKeyedSubscript:IDSGlobalLinkOptionSessionInfoLinkIDToQueryKey];
    if (v56)
    {
      CFDictionarySetValue(theDict, IDSDataChannelLinkIDToQueryKey, v56);
    }
    else
    {
      id v57 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10070E374();
      }
    }
    long long v58 = [v104 objectForKeyedSubscript:v27];
    if (v58)
    {
      CFDictionarySetValue(theDict, IDSDataChannelParticipantGenerationCounterKey, v58);
    }
    else
    {
      id v59 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10070E2EC();
      }
    }
    long long v60 = [v104 objectForKeyedSubscript:kIDSQRAllocateKey_StreamInfoPeerSubscribedStreams];
    if (v60)
    {
      CFDictionarySetValue(theDict, IDSDataChannelPeerSubscribedStreamsKey, v60);
    }
    else
    {
      id v61 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10070E264();
      }
    }
    id v62 = [v104 objectForKeyedSubscript:kIDSQRAllocateKey_StreamInfoPeerPublishedStreams];
    __int16 v63 = +[NSMutableDictionary dictionary];
    long long v112 = 0u;
    long long v113 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    id v64 = v62;
    id v65 = [v64 countByEnumeratingWithState:&v110 objects:v117 count:16];
    if (v65)
    {
      uint64_t v66 = *(void *)v111;
      uint64_t v67 = IDSDataChannelNoStreamsKey;
      uint64_t v68 = IDSDataChannelAllStreamsKey;
      do
      {
        for (int i = 0; i != v65; int i = (char *)i + 1)
        {
          if (*(void *)v111 != v66) {
            objc_enumerationMutation(v64);
          }
          __int16 v70 = *(void **)(*((void *)&v110 + 1) + 8 * i);
          if ([v70 anyStream])
          {
            __int16 v71 = [v70 participantID];
            [v63 setObject:v68 forKeyedSubscript:v71];
          }
          else
          {
            BOOL v72 = [v70 streamArray];
            BOOL v73 = v72 == 0;

            if (v73)
            {
              __int16 v71 = [v70 participantID];
              [v63 setObject:v67 forKeyedSubscript:v71];
            }
            else
            {
              __int16 v71 = [v70 streamArray];
              int v74 = [v70 participantID];
              [v63 setObject:v71 forKeyedSubscript:v74];
            }
          }
        }
        id v65 = [v64 countByEnumeratingWithState:&v110 objects:v117 count:16];
      }
      while (v65);
    }

    id v75 = v63;
    if (v75)
    {
      CFDictionarySetValue(theDict, IDSDataChannelPeerPublishedStreamsKey, v75);
    }
    else
    {
      id v76 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10070E1DC();
      }
    }
    __int16 v77 = [v12 objectForKeyedSubscript:IDSGlobalLinkOptionSessionInfoRequestBytesSentKey];
    if (v77)
    {
      CFDictionarySetValue(theDict, IDSDataChannelSessionInfoRequestBytesSentKey, v77);
    }
    else
    {
      id v78 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10070E154();
      }
    }
    NSErrorUserInfoKey v79 = [v12 objectForKeyedSubscript:IDSGlobalLinkOptionSessionInfoResponseBytesReceivedKey];
    if (v79)
    {
      CFDictionarySetValue(theDict, IDSDataChannelSessionInfoResponseBytesReceivedKey, v79);
    }
    else
    {
      id v80 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10070E0CC();
      }
    }
    id v109 = 0;
    id v81 = +[NSKeyedArchiver archivedDataWithRootObject:theDict requiringSecureCoding:0 error:&v109];
    id v82 = v109;
    if (v82)
    {
      __int16 v83 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
      {
        id v84 = [(IDSDSession *)self sharedState];
        __int16 v85 = [v84 groupID];
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v105;
        *(_WORD *)&buf[22] = 2112;
        *(void *)&unsigned char buf[24] = v85;
        *(_WORD *)&unsigned char buf[32] = 2112;
        *(void *)&buf[34] = v82;
        _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "<%@> link:%@ didReceiveSessionInfo failed to encode streamInfo response for group %@ (error: %@)", buf, 0x2Au);
      }
      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        unsigned int v86 = [(IDSDSession *)self sharedState];
        id v97 = [v86 groupID];
        _IDSLogV();
      }
      goto LABEL_117;
    }
    unsigned __int16 v87 = [(IDSDSession *)self sharedState];
    if (([v87 useQRDirectly] & 1) == 0)
    {
      __int16 v88 = [(IDSDSession *)self sharedState];
      if ([v88 clientType] != (id)1)
      {
        uint64_t v89 = [(IDSDSession *)self sharedState];
        if ([v89 clientType] != (id)5)
        {
          id v92 = [(IDSDSession *)self sharedState];
          BOOL v93 = [v92 clientType] == (id)6;

          if (!v93) {
            goto LABEL_117;
          }
          goto LABEL_116;
        }
      }
    }

LABEL_116:
    *(void *)&unsigned char buf[32] = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v90 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v90 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v90;
    *(_OWORD *)&uint8_t buf[16] = v90;
    IDSByteBufferInitForWrite();
    id v91 = v81;
    [v91 bytes];
    [v91 length];
    IDSByteBufferWriteField();
    -[IDSDSession writeToClientChannel:packetBuffer:metaData:metadataSize:](self, "writeToClientChannel:packetBuffer:metaData:metadataSize:", self->_clientChannel, 0);
    IDSByteBufferRelease();
LABEL_117:

LABEL_118:
    goto LABEL_119;
  }
  id v14 = [(IDSDSession *)self sharedState];
  if ([v14 useQRDirectly])
  {
LABEL_12:

LABEL_13:
    -[IDSDSession _sendSessionInfoResponseErrorToClient:](self, "_sendSessionInfoResponseErrorToClient:", v7, v94, v95, v96, *(void *)&v98, v99);
    goto LABEL_14;
  }
  id v15 = [(IDSDSession *)self sharedState];
  if ([v15 clientType] == (id)1)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v16 = [(IDSDSession *)self sharedState];
  if ([v16 clientType] == (id)5)
  {

    goto LABEL_11;
  }
  id v44 = [(IDSDSession *)self sharedState];
  BOOL v45 = [v44 clientType] == (id)6;

  if (v45) {
    goto LABEL_13;
  }
LABEL_14:
  if (v7 != 1)
  {
    id v17 = im_primary_queue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000BA16C;
    block[3] = &unk_10097E4D0;
    void block[4] = self;
    dispatch_block_t v18 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, block);
    dispatch_async(v17, v18);
  }
LABEL_119:
}

- (void)link:(id)a3 didFinishConvergenceForRelaySessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v12 = self;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<%@> link: %@ didFinishConvergenceForRelaySessionID: %@.", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
  self->_unsigned int currentGenerationCounter = 0;
  genCounterUpdatedByResponseTime = self->_genCounterUpdatedByResponseTime;
  self->_genCounterUpdatedByResponseTime = 0;

  dispatch_block_t v10 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", &off_1009D0D38, IDSGlobalLinkOptionSessionInfoRequestTypeKey, &off_1009D0EA0, IDSGlobalLinkOptionSessionInfoCommandFlagKey, 0);
  [(IDSDSession *)self requestSessionInfoWithOptions:v10];
}

- (void)link:(id)a3 didReceiveSessionStats:(id)a4 relayGroupID:(id)a5 relaySessionID:(id)a6 success:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v17 = @"NO";
    *(_DWORD *)buf = 138413570;
    *(void *)&uint8_t buf[4] = self;
    if (v7) {
      CFStringRef v17 = @"YES";
    }
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&unsigned char buf[24] = v14;
    *(_WORD *)unsigned int v40 = 2112;
    *(void *)&v40[2] = v15;
    __int16 v41 = 2112;
    CFStringRef v42 = v17;
    __int16 v43 = 2112;
    id v44 = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "<%@> link: %@ didReceiveSessionStats for group: %@ session: %@ success: %@ %@.", buf, 0x3Eu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
  if (v7)
  {
    dispatch_block_t v18 = +[NSMutableDictionary dictionary];
    id v19 = [v13 objectForKeyedSubscript:IDSGlobalLinkOptionLinkIDKey];
    if (v19)
    {
      CFDictionarySetValue(v18, IDSDataChannelLinkIDKey, v19);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10070E3FC();
    }

    unsigned int v20 = [v13 objectForKeyedSubscript:IDSGlobalLinkOptionStatsIdentifierKey];
    if (v20)
    {
      CFDictionarySetValue(v18, IDSDataChannelStatIdentifierKey, v20);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10070E53C();
    }

    unint64_t v21 = [v13 objectForKeyedSubscript:IDSGlobalLinkOptionStatsRTTKey];
    if (v21)
    {
      CFDictionarySetValue(v18, IDSDataChannelStatRTTKey, v21);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10070E4B4();
    }

    id v38 = 0;
    id v37 = +[NSKeyedArchiver archivedDataWithRootObject:v18 requiringSecureCoding:0 error:&v38];
    id v22 = v38;
    if (v22)
    {
      BOOL v23 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v24 = [(IDSDSession *)self sharedState];
        uint64_t v25 = [v24 groupID];
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v12;
        *(_WORD *)&buf[22] = 2112;
        *(void *)&unsigned char buf[24] = v25;
        *(_WORD *)unsigned int v40 = 2112;
        *(void *)&v40[2] = v22;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "<%@> link: %@ didReceiveSessionStats failed to encode stats response for group %@ (error: %@)", buf, 0x2Au);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          id v26 = [(IDSDSession *)self sharedState];
          double v33 = [v26 groupID];
          _IDSLogTransport();

          if (_IDSShouldLog())
          {
            id v27 = [(IDSDSession *)self sharedState];
            double v34 = [v27 groupID];
            _IDSLogV();
          }
        }
      }
      goto LABEL_36;
    }
    CFDictionaryRef v28 = [(IDSDSession *)self sharedState];
    if (([v28 useQRDirectly] & 1) == 0)
    {
      id v29 = [(IDSDSession *)self sharedState];
      if ([v29 clientType] != (id)1)
      {
        BOOL v36 = [(IDSDSession *)self sharedState];
        if ([v36 clientType] != (id)5)
        {
          uint64_t v32 = [(IDSDSession *)self sharedState];
          BOOL v35 = [v32 clientType] == (id)6;

          if (!v35) {
            goto LABEL_36;
          }
          goto LABEL_35;
        }
      }
    }

LABEL_35:
    *(void *)unsigned int v40 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v30 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v30;
    *(_OWORD *)&uint8_t buf[16] = v30;
    IDSByteBufferInitForWrite();
    id v31 = v37;
    [v31 bytes];
    [v31 length];
    IDSByteBufferWriteField();
    -[IDSDSession writeToClientChannel:packetBuffer:metaData:metadataSize:](self, "writeToClientChannel:packetBuffer:metaData:metadataSize:", self->_clientChannel, 0);
    IDSByteBufferRelease();
LABEL_36:
  }
}

- (BOOL)destinationsContainFromURI:(id)a3
{
  id v4 = a3;
  id v5 = [v4 tokenFreeURI];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = [(IDSDSession *)self sharedState];
  BOOL v7 = [v6 destinations];
  uint64_t v8 = [v7 allObjects];

  id v9 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v22;
    while (2)
    {
      for (int i = 0; i != v9; int i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (([v12 isEqualToURI:v4] & 1) != 0
          || ([v12 isEqualToURI:v5] & 1) != 0)
        {
          BOOL v17 = 1;
          goto LABEL_17;
        }
      }
      id v9 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v13 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = [(IDSDSession *)self sharedState];
    id v15 = [v14 destinations];
    *(_DWORD *)buf = 138412546;
    id v26 = v4;
    __int16 v27 = 2112;
    CFDictionaryRef v28 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "destinationsContainFromURI: %@ is not in the destinations %@", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled()
    && _IDSShouldLogTransport()
    && ([(IDSDSession *)self sharedState],
        id v16 = objc_claimAutoreleasedReturnValue(),
        [v16 destinations],
        id v19 = objc_claimAutoreleasedReturnValue(),
        _IDSLogTransport(),
        v19,
        v16,
        _IDSShouldLog()))
  {
    uint64_t v8 = [(IDSDSession *)self sharedState];
    unsigned int v20 = [v8 destinations];
    _IDSLogV();

    BOOL v17 = 0;
LABEL_17:
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (void)updateMembers:(id)a3 withContext:(id)a4 messagingCapabilities:(id)a5 triggeredLocally:(BOOL)a6 lightweightStatusDict:(id)a7
{
  BOOL v148 = a6;
  id v154 = a3;
  id v149 = a4;
  id v155 = a5;
  long long v156 = (NSMutableDictionary *)a7;
  id v160 = self;
  id v11 = [(IDSDSession *)self sharedState];
  long long v157 = [v11 destinations];

  id v12 = [(IDSDSession *)self sharedState];
  __int16 v153 = [v12 destinationsLightweightStatus];

  v186[0] = _NSConcreteStackBlock;
  v186[1] = 3221225472;
  v186[2] = sub_1000BC534;
  v186[3] = &unk_10097E990;
  v186[4] = self;
  id v13 = objc_msgSend(v154, "__imArrayByApplyingBlock:", v186);
  id v14 = objc_msgSend(v13, "__imSetFromArray");
  id v15 = [(IDSDSession *)self sharedState];
  [v15 setDestinations:v14];

  id v16 = [(IDSDSession *)self sharedState];
  [v16 setDestinationsLightweightStatus:v156];

  BOOL v17 = [(IDSDSession *)self sharedState];
  dispatch_block_t v18 = [v17 destinations];
  id v19 = [(IDSDSession *)self sharedState];
  unsigned int v20 = [v19 destinationsLightweightStatus];
  char v147 = sub_1001BF67C(v157, v153, v18, v20);

  long long v21 = [(IDSDSession *)v160 sharedState];
  long long v22 = [v21 destinations];
  unsigned int v23 = [v157 isEqualToSet:v22];
  if (v155) {
    unsigned int v24 = 0;
  }
  else {
    unsigned int v24 = v23;
  }

  if (v24)
  {
    uint64_t v25 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Ignored updateMembers since destinations have not been changed.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
  }
  else
  {
    id v158 = [v157 count];
    id v26 = [(IDSDSession *)v160 sharedState];
    __int16 v27 = [v26 destinations];
    id v151 = [v27 count];

    if (v158 > v151)
    {
      long long v150 = 0;
      int v35 = 2;
    }
    else
    {
      CFDictionaryRef v28 = [(IDSDSession *)v160 sharedState];
      id v29 = [v28 destinations];
      long long v150 = (NSMutableDictionary *)[v29 mutableCopy];

      [(NSMutableDictionary *)v150 minusSet:v157];
      long long v30 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        char v191 = v150;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "updateMembers: newly added destinations: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          v126 = v150;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            v126 = v150;
            _IDSLogV();
          }
        }
      }
      if (v160->_supportUnauthenticatedUser)
      {
        if ([(IDSDSession *)v160 shouldAllocateForInvitee] && v148)
        {
LABEL_31:
          BOOL v36 = [(IDSDSession *)v160 accountController];
          id v37 = [(IDSDSession *)v160 sharedState];
          id v38 = [v37 accountID];
          char v39 = [v36 accountWithUniqueID:v38];
          id v31 = [v39 _registrationCert];

          unsigned int v40 = [(IDSDSession *)v160 sharedState];
          CFDictionaryRef theDict = [v40 getQuickRelayAllocateOptions:&off_1009D0D98];

          __int16 v41 = [(IDSDSession *)v160 sharedState];
          CFStringRef v42 = [v41 groupID];

          if (v42)
          {
            CFDictionarySetValue(theDict, kIDSQRAllocateKey_GroupID, v42);
          }
          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            sub_10070E5C4();
          }

          CFDictionarySetValue(theDict, kIDSQRAllocateKey_AllocateRequestForUnauthorizedUser, &__kCFBooleanTrue);
          uint64_t v133 = [(IDSDSession *)v160 qrAllocator];
          id v143 = [(IDSDSession *)v160 sharedState];
          id v141 = [v143 destinations];
          id v131 = [v141 allObjects];
          id v139 = [(IDSDSession *)v160 sharedState];
          uint64_t v129 = [v139 uniqueID];
          id v137 = [(IDSDSession *)v160 sharedState];
          id v135 = [v137 fromURI];
          __int16 v43 = [v135 unprefixedURI];
          id v44 = [v43 _bestGuessURI];
          BOOL v45 = [(IDSDSession *)v160 accountController];
          __int16 v46 = [(IDSDSession *)v160 sharedState];
          id v47 = [v46 accountID];
          id v48 = [v45 accountWithUniqueID:v47];
          id v49 = [v48 service];
          dispatch_block_t v50 = [v49 identifier];
          id v51 = [v133 setupNewAllocation:v131 sessionID:v129 fromIdentity:v31 fromURI:v44 fromService:v50 options:theDict connectReadyHandler:0];
        }
        else
        {
          long long v184 = 0u;
          long long v185 = 0u;
          long long v182 = 0u;
          long long v183 = 0u;
          id v31 = v150;
          id v32 = [(NSMutableDictionary *)v31 countByEnumeratingWithState:&v182 objects:v196 count:16];
          if (v32)
          {
            uint64_t v33 = *(void *)v183;
            while (2)
            {
              for (int i = 0; i != v32; int i = (char *)i + 1)
              {
                if (*(void *)v183 != v33) {
                  objc_enumerationMutation(v31);
                }
                if (objc_msgSend(*(id *)(*((void *)&v182 + 1) + 8 * i), "isTemporaryURI", v126))
                {

                  goto LABEL_31;
                }
              }
              id v32 = [(NSMutableDictionary *)v31 countByEnumeratingWithState:&v182 objects:v196 count:16];
              if (v32) {
                continue;
              }
              break;
            }
          }
        }
      }
      int v35 = 1;
    }
    unsigned int theDicta = v35;
    unint64_t v52 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_block_t v53 = [(IDSDSession *)v160 sharedState];
      long long v54 = [v53 groupID];
      id v55 = [(IDSDSession *)v160 sharedState];
      uint64_t v56 = [v55 destinations];
      id v57 = (void *)v56;
      CFStringRef v58 = @"NO";
      *(_DWORD *)buf = 138412802;
      char v191 = v54;
      __int16 v192 = 2112;
      if (v148) {
        CFStringRef v58 = @"YES";
      }
      uint64_t v193 = v56;
      __int16 v194 = 2112;
      CFStringRef v195 = v58;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Updated destinations for group %@ to %@ (triggeredLocally %@)", buf, 0x20u);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      id v59 = [(IDSDSession *)v160 sharedState];
      long long v60 = [v59 groupID];
      id v61 = [(IDSDSession *)v160 sharedState];
      uint64_t v62 = [v61 destinations];
      __int16 v63 = (void *)v62;
      id v64 = v148 ? @"YES" : @"NO";
      id v127 = (void *)v62;
      v128 = v64;
      v126 = v60;
      _IDSLogTransport();

      if (_IDSShouldLog())
      {
        id v65 = [(IDSDSession *)v160 sharedState];
        uint64_t v66 = [v65 groupID];
        uint64_t v67 = [(IDSDSession *)v160 sharedState];
        id v127 = [v67 destinations];
        v128 = v64;
        v126 = v66;
        _IDSLogV();
      }
    }
    if (v156)
    {
      uint64_t v68 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        char v191 = v156;
        _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "Updated destinations have lightweight status values: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          v126 = v156;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            v126 = v156;
            _IDSLogV();
          }
        }
      }
    }
    BOOL v69 = v158 <= v151;
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    [(__CFDictionary *)Mutable setObject:&off_1009D0EB8 forKeyedSubscript:IDSDSessionReportTransportTypeKey];
    __int16 v70 = +[NSNumber numberWithUnsignedChar:theDicta];
    [(__CFDictionary *)Mutable setObject:v70 forKeyedSubscript:IDSDSessionReportMembershipChangeTypeKey];

    [(__CFDictionary *)Mutable setObject:&off_1009D0D68 forKeyedSubscript:IDSDSessionReportResultCodeKey];
    [(IDSDSession *)v160 addQREventForRTCReport:Mutable];
    __int16 v71 = v160;
    if (v160->_isLightweightParticipant && v69)
    {
      BOOL v73 = [(IDSDSession *)v160 sharedState];
      int v74 = [v73 destinations];
      id v75 = [v74 mutableCopy];

      [v75 minusSet:v157];
      long long v180 = 0u;
      long long v181 = 0u;
      long long v178 = 0u;
      long long v179 = 0u;
      id v76 = v75;
      id v77 = [v76 countByEnumeratingWithState:&v178 objects:v189 count:16];
      id v78 = v76;
      if (v77)
      {
        uint64_t v79 = *(void *)v179;
        while (2)
        {
          for (uint64_t j = 0; j != v77; uint64_t j = (char *)j + 1)
          {
            if (*(void *)v179 != v79) {
              objc_enumerationMutation(v76);
            }
            id v81 = *(void **)(*((void *)&v178 + 1) + 8 * (void)j);
            id v82 = [(IDSDSession *)v160 qrAllocator];
            __int16 v83 = [(IDSDSession *)v160 sharedState];
            id v84 = [v83 groupID];
            __int16 v85 = [v81 prefixedURI];
            LODWORD(v81) = [v82 isURIAvailabeInAllocateResponse:v84 uri:v85];

            if (!v81)
            {

              unsigned int v86 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "Re-allocating due to new member", buf, 2u);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  _IDSLogTransport();
                  if (_IDSShouldLog()) {
                    _IDSLogV();
                  }
                }
              }
              unsigned __int16 v87 = [(IDSDSession *)v160 accountController];
              __int16 v88 = [(IDSDSession *)v160 sharedState];
              uint64_t v89 = [v88 accountID];
              long long v90 = [v87 accountWithUniqueID:v89];
              uint64_t v142 = [v90 _registrationCert];

              id v91 = [(IDSDSession *)v160 sharedState];
              CFStringRef v159 = [v91 getQuickRelayAllocateOptions:&off_1009D0D98];

              id v92 = [(IDSDSession *)v160 sharedState];
              BOOL v93 = [v92 groupID];

              if (v93)
              {
                CFDictionarySetValue(v159, kIDSQRAllocateKey_GroupID, v93);
              }
              else
              {
                id v94 = &_os_log_default;
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                  sub_10070E5C4();
                }
              }
              id v95 = +[NSNumber numberWithBool:v160->_isLightweightParticipant];
              if (v95) {
                CFDictionarySetValue(v159, kIDSQRAllocateKey_IsLightweightParticipant, v95);
              }

              id v96 = [(IDSDSession *)v160 qrAllocator];
              uint64_t v144 = [(IDSDSession *)v160 sharedState];
              v140 = [v144 destinations];
              v132 = [v140 allObjects];
              id v138 = [(IDSDSession *)v160 sharedState];
              uint64_t v130 = [v138 uniqueID];
              id v136 = [(IDSDSession *)v160 sharedState];
              id v134 = [v136 fromURI];
              id v97 = [v134 unprefixedURI];
              double v98 = [v97 _bestGuessURI];
              uint64_t v99 = [(IDSDSession *)v160 accountController];
              __int16 v100 = [(IDSDSession *)v160 sharedState];
              CFStringRef v101 = [v100 accountID];
              __int16 v102 = [v99 accountWithUniqueID:v101];
              int64_t v103 = [v102 service];
              __int16 v104 = [v103 identifier];
              id v105 = [v96 setupNewAllocation:v132 sessionID:v130 fromIdentity:v142 fromURI:v98 fromService:v104 options:v159 connectReadyHandler:0];

              id v78 = (void *)v142;
              goto LABEL_83;
            }
          }
          id v77 = [v76 countByEnumeratingWithState:&v178 objects:v189 count:16];
          if (v77) {
            continue;
          }
          break;
        }
        id v78 = v76;
      }
LABEL_83:

      __int16 v71 = v160;
    }
    if (v150)
    {
      id v106 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
      {
        pendingMaterialInfoByFromID = v71->_pendingMaterialInfoByFromID;
        *(_DWORD *)buf = 138412546;
        char v191 = pendingMaterialInfoByFromID;
        __int16 v192 = 2112;
        uint64_t v193 = (uint64_t)v150;
        _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEFAULT, "Checking if we have material in %@ for new destinations %@", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          v126 = v160->_pendingMaterialInfoByFromID;
          id v127 = v150;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            v126 = v160->_pendingMaterialInfoByFromID;
            id v127 = v150;
            _IDSLogV();
          }
        }
      }
      long long v176 = 0u;
      long long v177 = 0u;
      long long v174 = 0u;
      long long v175 = 0u;
      __int16 v108 = v150;
      id v109 = [(NSMutableDictionary *)v108 countByEnumeratingWithState:&v174 objects:v188 count:16];
      if (v109)
      {
        uint64_t v110 = *(void *)v175;
        do
        {
          for (k = 0; k != v109; k = (char *)k + 1)
          {
            if (*(void *)v175 != v110) {
              objc_enumerationMutation(v108);
            }
            long long v112 = *(void **)(*((void *)&v174 + 1) + 8 * (void)k);
            -[NSMutableDictionary objectForKeyedSubscript:](v160->_pendingMaterialInfoByFromID, "objectForKeyedSubscript:", v112, v126, v127);
            long long v113 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
            if (v113)
            {
              id v114 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                char v191 = v113;
                __int16 v192 = 2112;
                uint64_t v193 = (uint64_t)v112;
                _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "Found %@ for %@", buf, 0x16u);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  v126 = v113;
                  id v127 = v112;
                  _IDSLogTransport();
                  if (_IDSShouldLog())
                  {
                    v126 = v113;
                    id v127 = v112;
                    _IDSLogV();
                  }
                }
              }
              -[NSMutableDictionary setObject:forKeyedSubscript:](v160->_pendingMaterialInfoByFromID, "setObject:forKeyedSubscript:", 0, v112, v126);
              long long v172 = 0u;
              long long v173 = 0u;
              long long v171 = 0u;
              long long v170 = 0u;
              dispatch_block_t v115 = v113;
              id v116 = [(NSMutableDictionary *)v115 countByEnumeratingWithState:&v170 objects:v187 count:16];
              if (v116)
              {
                uint64_t v117 = *(void *)v171;
                do
                {
                  for (m = 0; m != v116; m = (char *)m + 1)
                  {
                    if (*(void *)v171 != v117) {
                      objc_enumerationMutation(v115);
                    }
                    (*(void (**)(void))(*(void *)(*((void *)&v170 + 1) + 8 * (void)m) + 16))();
                  }
                  id v116 = [(NSMutableDictionary *)v115 countByEnumeratingWithState:&v170 objects:v187 count:16];
                }
                while (v116);
              }
            }
          }
          id v109 = [(NSMutableDictionary *)v108 countByEnumeratingWithState:&v174 objects:v188 count:16];
        }
        while (v109);
      }

      __int16 v71 = v160;
    }
    v163[0] = _NSConcreteStackBlock;
    v163[1] = 3221225472;
    v163[2] = sub_1000BC5C0;
    v163[3] = &unk_1009814D0;
    char v167 = v147;
    v163[4] = v71;
    BOOL v168 = v148;
    char v169 = theDicta;
    __int16 v119 = v150;
    long long v164 = v119;
    id v165 = v149;
    id v166 = v155;
    int v120 = objc_retainBlock(v163);
    id v121 = [(IDSDSession *)v160 groupStatusNotificationController];
    id v122 = [v121 queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000BCE98;
    block[3] = &unk_1009814F8;
    void block[4] = v160;
    int v123 = v120;
    id v162 = v123;
    CFStringRef v124 = v122;
    dispatch_block_t v125 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, block);
    dispatch_async(v124, v125);
  }
}

- (void)manageDesignatedMembers:(id)a3 withType:(unsigned __int16)a4
{
  id v5 = a3;
  id v6 = +[NSSet setWithArray:v5];
  BOOL v7 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [(IDSDSession *)self sharedState];
    id v9 = [v8 groupID];
    *(_DWORD *)buf = 138412546;
    id v16 = v9;
    __int16 v17 = 2112;
    dispatch_block_t v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "manageDesignatedMembers for group %@ to %@", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      uint64_t v10 = [(IDSDSession *)self sharedState];
      id v13 = [v10 groupID];
      _IDSLogTransport();

      if (_IDSShouldLog())
      {
        id v11 = [(IDSDSession *)self sharedState];
        id v14 = [v11 groupID];
        _IDSLogV();
      }
    }
  }
  id v12 = v6;
  IDSTransportThreadAddBlock();
}

- (void)removeParticipantIDs:(id)a3
{
  id v4 = a3;
  id v5 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(IDSDSession *)self sharedState];
    BOOL v7 = [v6 groupID];
    *(_DWORD *)buf = 138412546;
    id v14 = v7;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "removeParticipantIDs for group %@ to %@", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      uint64_t v8 = [(IDSDSession *)self sharedState];
      id v11 = [v8 groupID];
      _IDSLogTransport();

      if (_IDSShouldLog())
      {
        id v9 = [(IDSDSession *)self sharedState];
        id v12 = [v9 groupID];
        _IDSLogV();
      }
    }
  }
  id v10 = v4;
  IDSTransportThreadAddBlock();
}

- (void)updateParticipantData:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[IDSFoundationLog IDSDSession];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "updateParticipantData: new participantData: %@", buf, 0xCu);
  }

  id v9 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BD730;
  block[3] = &unk_10097E418;
  void block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_block_t v12 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, block);
  dispatch_async(v9, v12);
}

- (void)updateParticipantInfo:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSFoundationLog IDSDSession];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "updateParticipantInfo: new participantInfo: %@", (uint8_t *)&v15, 0xCu);
  }

  [(IDSGroupStatusNotificationParameters *)self->_groupStatusNotificationParams setParticipantInfo:v4];
  id v6 = [(IDSGroupStatusNotificationParameters *)self->_groupStatusNotificationParams participantInfo];

  if (v6)
  {
    id v7 = [(IDSGroupStatusNotificationParameters *)self->_groupStatusNotificationParams participantInfo];
    uint64_t v8 = [(IDSDSession *)self formAndEncryptDataBlob:v7 type:12];

    os_unfair_lock_lock(&self->_lock);
    encryptedDataBlob = self->_encryptedDataBlob;
    self->_encryptedDataBlob = v8;

    os_unfair_lock_unlock(&self->_lock);
  }
  id v10 = +[IDSGroupEncryptionController sharedInstance];
  id v11 = [(IDSDSession *)self sharedState];
  dispatch_block_t v12 = [v11 groupID];
  id v13 = [(IDSDSession *)self sharedState];
  id v14 = [v13 uniqueID];
  [v10 updateServerDesiredKeyMaterialsForGroup:v12 sessionID:v14];
}

- (void)updateParticipantType:(unsigned __int16)a3 members:(id)a4 triggeredLocally:(BOOL)a5 withContext:(id)a6 lightweightStatusDict:(id)a7
{
  uint64_t v10 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  if (!a5)
  {
    unsigned int v24 = [(IDSDSession *)self sharedState];
    [v24 setDestinationsLightweightStatus:v14];

    uint64_t v25 = [(IDSDSession *)self sharedState];
    id v26 = [v25 groupID];

    if (v26)
    {
      __int16 v27 = im_primary_queue();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000BE088;
      block[3] = &unk_1009802F0;
      void block[4] = self;
      id v63 = v12;
      BOOL v64 = a5;
      dispatch_block_t v28 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, block);
      dispatch_async(v27, v28);

      id v29 = v63;
LABEL_14:

      goto LABEL_20;
    }
    long long v30 = +[IDSFoundationLog IDSDSession];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_10070E6EC();
    }
LABEL_19:

    goto LABEL_20;
  }
  if (v10 >= 2)
  {
    long long v30 = +[IDSFoundationLog IDSDSession];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_10070E680(v10, v30, v31, v32, v33, v34, v35, v36);
    }
    goto LABEL_19;
  }
  int isLightweightParticipant = self->_isLightweightParticipant;
  int v16 = v10 == 0;
  id v17 = +[IDSFoundationLog IDSDSession];
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (isLightweightParticipant != v16)
  {
    if (v18)
    {
      CFStringRef v37 = @"NO";
      *(_DWORD *)buf = 138413058;
      if (v10) {
        CFStringRef v38 = @"NO";
      }
      else {
        CFStringRef v38 = @"YES";
      }
      uint64_t v66 = (IDSDSession *)v38;
      __int16 v67 = 2112;
      if (isLightweightParticipant) {
        CFStringRef v37 = @"YES";
      }
      *(void *)uint64_t v68 = v37;
      *(_WORD *)&v68[8] = 1024;
      *(_DWORD *)&v68[10] = v10;
      __int16 v69 = 2112;
      id v70 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "updateParticipantType: to: %@, wasLightweightParticipant: %@, type: %u, lightweightStatusDict: %@", buf, 0x26u);
    }

    char v39 = +[IDSFoundationLog IDSDSession];
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v40 = [(IDSDSession *)self sharedState];
      __int16 v41 = [v40 groupID];
      *(_DWORD *)buf = 138412546;
      uint64_t v66 = self;
      __int16 v67 = 2112;
      *(void *)uint64_t v68 = v41;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "<%@> updateParticipantType: reset MKM status for %@", buf, 0x16u);
    }
    CFStringRef v42 = +[IDSGroupEncryptionController sharedInstance];
    __int16 v43 = [(IDSDSession *)self sharedState];
    id v44 = [v43 groupID];
    [v42 resetMKMLocalSentStatus:v44];

    BOOL v45 = [(IDSDSession *)self sharedState];
    __int16 v46 = [v45 groupID];

    if (v46)
    {
      self->_int isLightweightParticipant = v16;
      id v47 = [(IDSDSession *)self sharedState];
      [v47 setDestinationsLightweightStatus:v14];

      if (self->_isLightweightParticipant)
      {
        [(IDSDSession *)self unregisterClientChannel];
      }
      else
      {
        [(IDSDSession *)self registerClientChannel];
        [(IDSDSession *)self _sendConnectedLinkInfoToAVC];
      }
      id v48 = im_primary_queue();
      v58[0] = _NSConcreteStackBlock;
      v58[1] = 3221225472;
      v58[2] = sub_1000BE17C;
      v58[3] = &unk_100981368;
      v58[4] = self;
      id v59 = v12;
      BOOL v61 = a5;
      __int16 v60 = v10;
      dispatch_block_t v49 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, v58);
      dispatch_async(v48, v49);

      unint64_t v52 = _NSConcreteStackBlock;
      uint64_t v53 = 3221225472;
      long long v54 = sub_1000BE314;
      id v55 = &unk_100981548;
      uint64_t v56 = self;
      __int16 v57 = v10;
      IDSTransportThreadAddBlock();
      id v29 = v59;
      goto LABEL_14;
    }
    long long v30 = +[IDSFoundationLog IDSDSession];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_10070E64C();
    }
    goto LABEL_19;
  }
  if (v18)
  {
    CFStringRef v19 = @"YES";
    BOOL v20 = self->_isLightweightParticipant;
    *(_DWORD *)buf = 138413058;
    if (isLightweightParticipant) {
      CFStringRef v21 = @"YES";
    }
    else {
      CFStringRef v21 = @"NO";
    }
    uint64_t v66 = (IDSDSession *)v21;
    __int16 v67 = 1024;
    if (!v20) {
      CFStringRef v19 = @"NO";
    }
    *(_DWORD *)uint64_t v68 = v10;
    *(_WORD *)&void v68[4] = 2112;
    *(void *)&v68[6] = v19;
    __int16 v69 = 2112;
    id v70 = v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "updateParticipantType: No need to change the type: wasLightweightParticipant: %@, type: %u, current: %@, lightweightStatusDict: %@", buf, 0x26u);
  }

  long long v22 = im_primary_queue();
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_1000BE3A8;
  v50[3] = &unk_100980D38;
  v50[4] = self;
  __int16 v51 = v10;
  dispatch_block_t v23 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, v50);
  dispatch_async(v22, v23);

LABEL_20:
}

- (void)_sendConnectedLinkInfoToAVC
{
}

- (void)setGroupStreamInfo:(id)a3 sessionInfo:(id)a4
{
  id v40 = a3;
  CFDictionaryRef theDict = (__CFDictionary *)a4;
  id v5 = [v40 maxConcurrentStreams];
  if (v5) {
    CFDictionarySetValue(theDict, kIDSQRAllocateKey_StreamInfoMaxConcurrentStreams, v5);
  }

  id v6 = [v40 generationCounter];
  if (v6) {
    CFDictionarySetValue(theDict, kIDSQRAllocateKey_StreamInfoGenerationCounter, v6);
  }

  id v7 = [v40 publishedStreams];
  if (v7) {
    CFDictionarySetValue(theDict, kIDSQRAllocateKey_StreamInfoPublishedStreams, v7);
  }

  uint64_t v8 = [v40 subscribedStreams];
  id value = +[NSMutableArray array];
  uint64_t v9 = IDSGroupSessionAllParticipantsKey;
  uint64_t v10 = [v8 objectForKeyedSubscript:IDSGroupSessionAllParticipantsKey];

  if (!v10)
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id obj = [v8 allKeys];
    id v15 = [obj countByEnumeratingWithState:&v44 objects:v54 count:16];
    if (!v15) {
      goto LABEL_23;
    }
    uint64_t v16 = *(void *)v45;
    uint64_t v17 = IDSGroupSessionAllStreamsKey;
    while (1)
    {
      for (int i = 0; i != v15; int i = (char *)i + 1)
      {
        if (*(void *)v45 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v44 + 1) + 8 * i);
        BOOL v20 = [v8 objectForKeyedSubscript:v19];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          CFStringRef v21 = [v8 objectForKeyedSubscript:v19];
          unsigned int v22 = [v21 isEqualToString:v17];

          if (v22)
          {
            id v23 = +[IDSQRParticipantStreams streamWithParticipantID:v19 streamArray:0 anyParticipant:0 anyStream:1];
            [value addObject:v23];
            goto LABEL_21;
          }
        }
        else
        {
        }
        unsigned int v24 = [v8 objectForKeyedSubscript:v19];
        id v23 = [v24 mutableCopy];

        uint64_t v25 = +[IDSQRParticipantStreams streamWithParticipantID:v19 streamArray:v23 anyParticipant:0 anyStream:0];
        [value addObject:v25];

LABEL_21:
      }
      id v15 = [obj countByEnumeratingWithState:&v44 objects:v54 count:16];
      if (!v15)
      {
LABEL_23:

        id v26 = value;
        goto LABEL_32;
      }
    }
  }
  id v11 = [v8 objectForKeyedSubscript:v9];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_25:
    __int16 v27 = [v8 objectForKeyedSubscript:v9];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      dispatch_block_t v28 = [v8 objectForKeyedSubscript:v9];
      unsigned int v29 = [v28 isEqualToString:IDSGroupSessionNoStreamsKey];

      if (v29)
      {
        uint64_t v14 = +[IDSQRParticipantStreams streamWithParticipantID:0 streamArray:0 anyParticipant:1 anyStream:0];
        goto LABEL_28;
      }
    }
    else
    {
    }
    uint64_t v31 = [v8 objectForKeyedSubscript:v9];
    long long v30 = +[IDSQRParticipantStreams streamWithParticipantID:0 streamArray:v31 anyParticipant:1 anyStream:0];

    goto LABEL_31;
  }
  id v12 = [v8 objectForKeyedSubscript:v9];
  unsigned int v13 = [v12 isEqualToString:IDSGroupSessionAllStreamsKey];

  if (!v13) {
    goto LABEL_25;
  }
  uint64_t v14 = +[IDSQRParticipantStreams streamWithParticipantID:0 streamArray:0 anyParticipant:1 anyStream:1];
LABEL_28:
  long long v30 = (void *)v14;
LABEL_31:
  id v26 = value;
  [value addObject:v30];

LABEL_32:
  if (v26) {
    CFDictionarySetValue(theDict, kIDSQRAllocateKey_StreamInfoSubscribedStreams, v26);
  }
  uint64_t v32 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v33 = [(__CFDictionary *)theDict objectForKeyedSubscript:kIDSQRAllocateKey_StreamInfoSubscribedStreams];
    uint64_t v34 = [v40 subscribedStreams];
    *(_DWORD *)buf = 138412802;
    dispatch_block_t v49 = v33;
    __int16 v50 = 2112;
    __int16 v51 = theDict;
    __int16 v52 = 2112;
    uint64_t v53 = v34;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "setGroupStreamInfo: sessionInfo[kIDSQRAllocateKey_StreamInfoSubscribedStreams]:%@, sessionInfo:%@, streamInfo.subscribedStreams:%@", buf, 0x20u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      uint64_t v35 = kIDSQRAllocateKey_StreamInfoSubscribedStreams;
      uint64_t v36 = [(__CFDictionary *)theDict objectForKeyedSubscript:kIDSQRAllocateKey_StreamInfoSubscribedStreams];
      CFStringRef v38 = [v40 subscribedStreams];
      _IDSLogTransport();

      if (_IDSShouldLog())
      {
        CFStringRef v37 = -[__CFDictionary objectForKeyedSubscript:](theDict, "objectForKeyedSubscript:", v35, v36, theDict, v38);
        char v39 = [v40 subscribedStreams];
        _IDSLogV();
      }
    }
  }
}

- (id)_checkIfPushMessageSizeGreaterThanMaxLimit:(id)a3 maxLimit:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [v6 length];
  if ((unint64_t)v7 <= a4)
  {
    uint64_t v16 = 0;
  }
  else
  {
    id v8 = v7;
    uint64_t v9 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [(IDSDSession *)self sharedState];
      id v11 = [v10 groupID];
      *(_DWORD *)buf = 134218242;
      unint64_t v23 = a4;
      __int16 v24 = 2112;
      uint64_t v25 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Client data blob size is greater than push size limitation which is %ld and groupID: %@", buf, 0x16u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        id v12 = [(IDSDSession *)self sharedState];
        BOOL v18 = [v12 groupID];
        _IDSLogTransport();

        if (_IDSShouldLog())
        {
          unsigned int v13 = [(IDSDSession *)self sharedState];
          uint64_t v19 = [v13 groupID];
          _IDSLogV();
        }
      }
    }
    id v14 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Client data blob size %lu is greater than push size limitation %ld", v8, a4);
    NSErrorUserInfoKey v20 = NSDebugDescriptionErrorKey;
    id v21 = v14;
    id v15 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    uint64_t v16 = +[NSError errorWithDomain:@"joinGroupSessionError" code:-1000 userInfo:v15];
  }

  return v16;
}

- (id)_generateEncryptedAndSignedIDSContextBlobWithClientContextBlob:(id)a3
{
  uint64_t v4 = qword_100A4A5D0;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&qword_100A4A5D0, &stru_100981748);
  }
  self->_idsContextTimeStamp = *(double *)&qword_100A4A5D8 * (double)mach_continuous_time();
  id v6 = -[IDSDSession _generateEncryptedAndSignedIDSContextBlobWithClientContextBlob:timeStamp:](self, "_generateEncryptedAndSignedIDSContextBlobWithClientContextBlob:timeStamp:", v5);

  return v6;
}

- (id)_generateEncryptedAndSignedIDSContextBlobWithClientContextBlob:(id)a3 timeStamp:(double)a4
{
  id v22 = a3;
  double v26 = a4;
  id v23 = [objc_alloc((Class)NSMutableData) initWithBytes:&v26 length:8];
  if (v22) {
    [v23 appendData:v22];
  }
  id v6 = [(IDSDSession *)self formAndEncryptDataBlob:v23 type:7];
  id v7 = v6;
  if (v6)
  {
    id v25 = [v6 length];
    id v21 = [objc_alloc((Class)NSMutableData) initWithBytes:&v25 length:8];
    [v21 appendData:v7];
    id v8 = +[IDSEncryptionController sharedInstance];
    uint64_t v9 = [(IDSDSession *)self accountController];
    uint64_t v10 = [(IDSDSession *)self sharedState];
    id v11 = [v10 accountID];
    id v12 = [v9 accountWithUniqueID:v11];
    unsigned int v13 = [v12 service];
    id v14 = [v13 identifier];
    id v24 = 0;
    id v15 = [v8 publicKeySignData:v21 withSignatureType:0 service:v14 priority:300 error:&v24];
    id v16 = v24;

    if (!v15 || v16)
    {
      uint64_t v19 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v16;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Unable to sign the encrypted blob with error :%@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport();
          if (_IDSShouldLog()) {
            _IDSLogV();
          }
        }
      }
      id v17 = 0;
    }
    else
    {
      id v17 = [objc_alloc((Class)NSMutableData) initWithData:v21];
      [v17 appendData:v15];
    }
  }
  else
  {
    BOOL v18 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Unable to encrypt the blob!", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
    id v17 = 0;
  }

  return v17;
}

- (double)getIDSContextTimeStamp
{
  return self->_idsContextTimeStamp;
}

- (void)joinWithOptions:(id)a3
{
}

- (void)joinWithOptions:(id)a3 messageContext:(id)a4
{
  id v201 = a3;
  id v198 = a4;
  if (self->_joinStartTime == 0.0)
  {
    if (qword_100A4A5D0 != -1) {
      dispatch_once(&qword_100A4A5D0, &stru_100981748);
    }
    self->_joinStartTime = *(double *)&qword_100A4A5D8 * (double)mach_continuous_time();
  }
  id v6 = [(IDSDSession *)self sharedState];
  id v7 = [v6 uniqueID];
  __int16 v196 = [v7 componentsSeparatedByString:@"-"];

  CFDictionaryRef theDict = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(theDict, @"state", &off_1009D0EA0);
  id v8 = -[NSString substringFromIndex:](self->_serviceIdentifier, "substringFromIndex:", [@"com.apple.private.alloy." length]);
  if (v8) {
    CFDictionarySetValue(theDict, @"serviceName", v8);
  }

  uint64_t v9 = [v196 objectAtIndexedSubscript:0];
  if (v9) {
    CFDictionarySetValue(theDict, @"sessionID", v9);
  }

  IDSPowerLogDictionary();
  uint64_t v10 = [(IDSDSession *)self qrAllocator];
  id v11 = [(IDSDSession *)self sharedState];
  id v12 = [v11 uniqueID];
  unsigned int v13 = [(IDSDSession *)self sharedState];
  id v14 = [v13 groupID];
  id v15 = [v10 getSessionInfoFromDefaults:v12 groupID:v14];
  CFStringRef v197 = (__CFDictionary *)[v15 mutableCopy];

  id v16 = objc_alloc_init(IDSGroupStatusNotificationParameters);
  groupStatusNotificationParams = self->_groupStatusNotificationParams;
  self->_groupStatusNotificationParams = v16;

  BOOL v18 = [v201 objectForKeyedSubscript:IDSGroupSessionIsInitiatorKey];
  [(IDSGroupStatusNotificationParameters *)self->_groupStatusNotificationParams setIsInitiator:v18];

  uint64_t v19 = [v201 objectForKeyedSubscript:IDSGroupSessionJoinTypeKey];
  [(IDSGroupStatusNotificationParameters *)self->_groupStatusNotificationParams setJoinType:v19];

  NSErrorUserInfoKey v20 = [v201 objectForKeyedSubscript:IDSGroupSessionParticipantDataKey];
  [(IDSGroupStatusNotificationParameters *)self->_groupStatusNotificationParams setParticipantData:v20];

  id v21 = [v201 objectForKeyedSubscript:IDSGroupSessionParticipantInfoKey];
  [(IDSGroupStatusNotificationParameters *)self->_groupStatusNotificationParams setParticipantInfo:v21];

  id v22 = [v201 objectForKeyedSubscript:IDSGroupSessionPublishedStreamsKey];
  [(IDSGroupStatusNotificationParameters *)self->_groupStatusNotificationParams setPublishedStreams:v22];

  id v23 = [v201 objectForKeyedSubscript:IDSGroupSessionSubscribedStreamsKey];
  [(IDSGroupStatusNotificationParameters *)self->_groupStatusNotificationParams setSubscribedStreams:v23];

  id v24 = [v201 objectForKeyedSubscript:IDSGroupSessionMaxConcurrentStreamsKey];
  [(IDSGroupStatusNotificationParameters *)self->_groupStatusNotificationParams setMaxConcurrentStreams:v24];

  id v25 = [v201 objectForKeyedSubscript:IDSGroupSessionGenerationCounterKey];
  [(IDSGroupStatusNotificationParameters *)self->_groupStatusNotificationParams setGenerationCounter:v25];

  uint64_t v26 = IDSGroupSessionClientContextDataKey;
  __int16 v27 = [v201 objectForKeyedSubscript:IDSGroupSessionClientContextDataKey];
  [(IDSGroupStatusNotificationParameters *)self->_groupStatusNotificationParams setClientJoinContextData:v27];

  id v28 = [v201 objectForKeyedSubscript:IDSGroupSessionCommandContextKey];
  [(IDSGroupStatusNotificationParameters *)self->_groupStatusNotificationParams setCommandContext:v28];

  unsigned int v29 = [v201 objectForKeyedSubscript:IDSGroupSessionMirageProtocolHandshakeBlobKey];
  [(IDSGroupStatusNotificationParameters *)self->_groupStatusNotificationParams setParticipantMirageHandshakeBlob:v29];

  self->_unsigned int groupSessionState = 0;
  long long v30 = [v201 objectForKeyedSubscript:IDSGroupSessionStartedAsUPlusOneKey];
  self->_BOOL startedAsUPlusOneSession = [v30 BOOLValue];

  uint64_t v31 = [(IDSGroupStatusNotificationParameters *)self->_groupStatusNotificationParams commandContext];
  callType = self->_callType;
  self->_callType = v31;

  uint64_t v33 = [v201 objectForKeyedSubscript:IDSGroupSessionNewServerAllocationKey];
  unsigned int value = [v33 BOOLValue];

  uint64_t v34 = +[IDSFoundationLog IDSDSession];
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v35 = [(IDSDSession *)self sharedState];
    uint64_t v36 = [v35 uniqueID];
    CFStringRef v37 = [(IDSDSession *)self sharedState];
    CFStringRef v38 = [v37 fromURI];
    char v39 = [(IDSGroupStatusNotificationParameters *)self->_groupStatusNotificationParams participantData];
    id v40 = [(IDSGroupStatusNotificationParameters *)self->_groupStatusNotificationParams participantInfo];
    __int16 v41 = [(IDSGroupStatusNotificationParameters *)self->_groupStatusNotificationParams participantMirageHandshakeBlob];
    CFStringRef v42 = self->_callType;
    *(_DWORD *)buf = 138413570;
    *(void *)unsigned int v205 = v36;
    *(_WORD *)&v205[8] = 2112;
    *(void *)&v205[10] = v38;
    *(_WORD *)&v205[18] = 2112;
    *(void *)&v205[20] = v39;
    __int16 v206 = 2112;
    v207 = v40;
    __int16 v208 = 2112;
    id v209 = v41;
    __int16 v210 = 2112;
    v211 = v42;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "joinWithOptions for %@: URI: %@, participantData: %@, participantInfo: %@, handshakeBlob: %@, callType: %@", buf, 0x3Eu);
  }
  id v43 = [(IDSGFTMetricsCollector *)self->_metricsCollector localDidJoin];
  long long v44 = +[IDSGroupEncryptionController sharedInstance];
  unsigned int v45 = [v44 shouldUseGecko];

  if (v45) {
    [(IDSGFTMetricsCollector *)self->_metricsCollector useGecko];
  }
  [(IDSDSession *)self updateRelevantEncryptedDataBlob];
  long long v46 = [(IDSDSession *)self sharedState];
  [v46 setUseQRDirectly:1];

  long long v47 = [(IDSDSession *)self sharedState];
  [v47 setState:5];

  CFStringRef v189 = [v201 objectForKeyedSubscript:IDSGroupSessionForceQRKey];
  uint64_t v48 = IDSGroupSessionCallScreeningMode;
  dispatch_block_t v49 = [v201 objectForKey:IDSGroupSessionCallScreeningMode];
  self->_disableP2PLinks = [v49 BOOLValue];

  __int16 v50 = [v201 objectForKey:v48];
  self->_sessionIsNonUserParticipantInitiated = [v50 BOOLValue];

  if (self->_sessionIsNonUserParticipantInitiated) {
    __int16 v51 = &off_1009D0ED0;
  }
  else {
    __int16 v51 = &off_1009D0EE8;
  }
  [(IDSGroupStatusNotificationParameters *)self->_groupStatusNotificationParams setQuickRelayUserType:v51];
  __int16 v52 = [v201 objectForKey:IDSGroupSessionForceTCPFallbackOnWiFiKey];
  self->_forceTCPFallbackOnWiFint i = [v52 BOOLValue];

  uint64_t v53 = [v201 objectForKey:IDSGroupSessionForceTCPFallbackOnCellKey];
  self->_forceTCPFallbackOnCell = [v53 BOOLValue];

  long long v54 = [v201 objectForKey:IDSGlobalLinkOptionForceIPv6Key];
  self->_forceIPid v6 = [v54 BOOLValue];

  if (self->_forceIPv6) {
    self->_preferredAddressFamily = 2;
  }
  v202[0] = _NSConcreteStackBlock;
  v202[1] = 3221225472;
  v202[2] = sub_1000C0ACC;
  v202[3] = &unk_10097E4D0;
  id v188 = v198;
  id v203 = v188;
  __int16 v194 = objc_retainBlock(v202);
  id v55 = [(IDSDSession *)self accountController];
  uint64_t v56 = [(IDSDSession *)self sharedState];
  __int16 v57 = [v56 accountID];
  CFStringRef v58 = [v55 accountWithUniqueID:v57];
  id v59 = [v58 maxRemoteMessagingPayloadSize];

  CFStringRef v195 = [v201 objectForKeyedSubscript:v26];
  CFStringRef v199 = [(IDSDSession *)self _checkIfPushMessageSizeGreaterThanMaxLimit:v195 maxLimit:v59];
  if (v199)
  {
    ((void (*)(void))v194[2])();
    id valueb = objc_alloc_init((Class)IMMessageContext);
    [valueb setShouldBoost:1];
    __int16 v60 = +[IDSDaemon sharedInstance];
    BOOL v61 = [(IDSDSession *)self sharedState];
    uint64_t v62 = [v61 pushTopic];
    long long v170 = [v60 broadcasterForTopic:v62 entitlement:kIDSSessionEntitlement command:0 messageContext:valueb];

    id v167 = objc_alloc((Class)IDSGroupSessionParticipantUpdate);
    id v63 = objc_alloc((Class)NSUUID);
    CFMutableDictionaryRef v186 = [(IDSDSession *)self sharedState];
    CFMutableDictionaryRef v184 = [v186 groupID];
    id v172 = [v63 initWithUUIDString:v184];
    long long v182 = [(IDSGroupStatusNotificationParameters *)self->_groupStatusNotificationParams isInitiator];
    unsigned int v165 = [v182 BOOLValue];
    long long v178 = [(IDSDSession *)self accountController];
    long long v180 = [(IDSDSession *)self sharedState];
    long long v176 = [v180 accountID];
    long long v174 = [v178 accountWithUniqueID:v176];
    BOOL v64 = [v174 primaryRegistration];
    id v65 = [v64 pushToken];
    uint64_t v66 = [(IDSDSession *)self sharedState];
    __int16 v67 = [v66 fromURI];
    uint64_t v68 = [v67 prefixedURI];
    __int16 v69 = (void *)_IDSCopyIDForTokenWithURI();
    id v70 = [(IDSGroupStatusNotificationParameters *)self->_groupStatusNotificationParams joinType];
    BOOL v71 = [v70 integerValue] == (id)1;
    BOOL v72 = +[NSDate date];
    LOBYTE(v160) = 0;
    id v168 = [v167 initWithGroupUUID:v172 isInitiator:v165 participantIdentifier:0 participantDestinationID:v69 participantUpdateType:1 participantUpdateSubtype:v71 fromServer:v160 serverDate:v72 participantData:0 clientContextData:0 members:0 participantIDs:0 relaySessionID:0];

    BOOL v73 = [(IDSDSession *)self sharedState];
    int v74 = [v73 uniqueID];
    id v75 = [v168 dictionaryRepresentation];
    [v170 sessionDidJoinGroup:v74 participantUpdateDictionary:v75 error:v199];

    goto LABEL_60;
  }
  id v76 = +[IDSDSessionController sharedInstance];
  [v76 updateCriticalReliabilityState];

  self->_BOOL sharedSessionHasJoined = 1;
  id v77 = [(IDSDSession *)self utunController];
  BOOL sharedSessionHasJoined = self->_sharedSessionHasJoined;
  uint64_t v79 = [(IDSDSession *)self sharedState];
  id v80 = [v79 uniqueID];
  [v77 setSharedSessionHasJoined:sharedSessionHasJoined forIDSSession:v80];

  if (v197)
  {
    CFDictionarySetValue(v197, kIDSQRAllocateKey_AllocateType, &off_1009D0D98);
    id v81 = [(IDSDSession *)self sharedState];
    id v82 = [v81 groupID];

    if (v82)
    {
      CFDictionarySetValue(v197, kIDSQRAllocateKey_GroupID, v82);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10070E830();
    }

    [(IDSDSession *)self setGroupStreamInfo:self->_groupStatusNotificationParams sessionInfo:v197];
    if ([v189 isEqualToIgnoringCase:@"yes"])
    {
      id v106 = IDSGroupSessionForceQRSession;
      if (v106)
      {
        CFDictionarySetValue(v197, kIDSQRAllocateKey_TestOptions, v106);
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_10070E7A8();
      }
    }
    [(IDSDSession *)self connectQRServer:v197 withPreferredLocalInterface:0];
    uint64_t v187 = IDSGroupSessionTimeBaseKey;
LABEL_55:
    valuec = +[IDSGroupEncryptionController sharedInstance];
    v118 = [(IDSDSession *)self sharedState];
    __int16 v119 = [v118 destinations];
    int v120 = [v119 allObjects];
    id v121 = [(IDSDSession *)self sharedState];
    id v122 = [v121 groupID];
    int v123 = [(IDSDSession *)self sharedState];
    CFStringRef v124 = [v123 uniqueID];
    dispatch_block_t v125 = [(IDSDSession *)self sharedState];
    v126 = [v125 destinationsLightweightStatus];
    [valuec setMembers:v120 forGroup:v122 sessionID:v124 lightweightStatusDict:v126];

    id v127 = [v201 objectForKeyedSubscript:v187];
    if (!v127)
    {
      id v127 = +[NSDate now];
    }
    v128 = GLUCreateSetUPlusOneEvent();
    if (v128) {
      [(IDSDSession *)self addQREventForRTCReport:v128];
    }
    ((void (*)(void))v194[2])();

    goto LABEL_60;
  }
  __int16 v83 = [(IDSDSession *)self sharedState];
  id v84 = [v83 groupID];
  if (v84)
  {
    __int16 v85 = [(IDSDSession *)self sharedState];
    unsigned int v86 = [v85 destinations];
    BOOL v87 = v86 == 0;

    if (!v87)
    {
      if (self->_qrReason)
      {
        __int16 v88 = [(IDSDSession *)self qrAllocator];
        uint64_t v89 = [(IDSDSession *)self sharedState];
        long long v90 = [v89 groupID];
        id v91 = objc_msgSend(v88, "invalidateLatestResponse:qrReason:previousError:", v90, (unsigned __int16)-[NSNumber intValue](self->_qrReason, "intValue"), (unsigned __int16)-[NSNumber intValue](self->_qrError, "intValue"));

        id v92 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
        {
          qrReason = self->_qrReason;
          qrError = self->_qrError;
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)unsigned int v205 = v91;
          *(_WORD *)&v205[4] = 2112;
          *(void *)&v205[6] = qrReason;
          *(_WORD *)&v205[14] = 2112;
          *(void *)&v205[16] = qrError;
          _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "invalidateLatestResponse status: %d, reason: %@, error: %@", buf, 0x1Cu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            long long v161 = self->_qrReason;
            long long v164 = self->_qrError;
            unint64_t v160 = v91;
            _IDSLogTransport();
            if (_IDSShouldLog())
            {
              long long v161 = self->_qrReason;
              long long v164 = self->_qrError;
              unint64_t v160 = (unint64_t)v91;
              _IDSLogV();
            }
          }
        }
      }
      if (self->_handOffOverQREnabled)
      {
        id v95 = [(IDSDSession *)self _generateEncryptedAndSignedIDSContextBlobWithClientContextBlob:0];
        if (v95)
        {
          id v96 = [(IDSDSession *)self utunController];
          id v97 = [(IDSDSession *)self sharedState];
          double v98 = [v97 uniqueID];
          [v96 setIDSContextBlob:v95 forIDSSession:v98];
        }
      }
      uint64_t v99 = [(IDSDSession *)self accountController];
      __int16 v100 = [(IDSDSession *)self sharedState];
      CFStringRef v101 = [v100 accountID];
      __int16 v102 = [v99 accountWithUniqueID:v101];
      long long v181 = [v102 _registrationCert];

      int64_t v103 = [(IDSDSession *)self sharedState];
      long long v185 = [v103 getQuickRelayAllocateOptions:&off_1009D0D98];

      CFDictionarySetValue(v185, kIDSQRAllocateKey_AllocateType, &off_1009D0D98);
      __int16 v104 = [(IDSDSession *)self sharedState];
      id v105 = [v104 groupID];

      if (v105)
      {
        CFDictionarySetValue(v185, kIDSQRAllocateKey_GroupID, v105);
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_10070E5C4();
      }

      if ([v189 isEqualToIgnoringCase:@"yes"])
      {
        id v129 = IDSGroupSessionForceQRSession;
        if (v129)
        {
          CFDictionarySetValue(v185, kIDSQRAllocateKey_TestOptions, v129);
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_10070E720();
        }
      }
      [(IDSDSession *)self setGroupStreamInfo:self->_groupStatusNotificationParams sessionInfo:v185];
      [(IDSDSession *)self setShouldConnectToQRServer:1];
      CFDictionarySetValue(v185, kIDSQRAllocateKey_IsJoinAllocation, &__kCFBooleanTrue);
      if (value) {
        CFDictionarySetValue(v185, kIDSQRAllocateKey_IsNewUPlusOneSession, &__kCFBooleanTrue);
      }
      uint64_t v130 = [v201 objectForKeyedSubscript:IDSGroupSessionIsReliableUnicastSession];
      id v131 = [v130 BOOLValue];

      v132 = [(IDSDSession *)self utunController];
      uint64_t v133 = [(IDSDSession *)self sharedState];
      id v134 = [v133 isInitiator];
      id v135 = [(IDSDSession *)self sharedState];
      id v136 = [v135 uniqueID];
      [v132 setIsReliableUnicastSession:v131 isClient:v134 forIDSSession:v136];

      if (v131)
      {
        id v137 = [(IDSDSession *)self sharedState];
        unsigned int v138 = [v137 isInitiator];

        id v139 = +[NSNumber numberWithBool:v138 ^ 1];
        if (v139) {
          CFDictionarySetValue(v185, kIDSQRAllocateKey_waitingForAllocation, v139);
        }
      }
      if (self->_disableP2PLinks)
      {
        v140 = [(IDSDSession *)self utunController];
        id v141 = [(IDSDSession *)self sharedState];
        uint64_t v142 = [v141 uniqueID];
        [v140 setAllowP2PforIDSSession:v142 isEnabled:0];
      }
      long long v183 = [v201 objectForKeyedSubscript:IDSGroupSessionConversationIDKey];
      if (v183) {
        CFDictionarySetValue(v185, kIDSQRAllocateKey_ConversationID, v183);
      }
      uint64_t v187 = IDSGroupSessionTimeBaseKey;
      objc_msgSend(v201, "objectForKeyedSubscript:");
      id valuea = (id)objc_claimAutoreleasedReturnValue();
      if (valuea)
      {
        CFDictionarySetValue(v185, kIDSQRAllocateKey_TimeBase, valuea);

        if (qword_100A4A5D0 != -1) {
          dispatch_once(&qword_100A4A5D0, &stru_100981748);
        }
        uint64_t v143 = mach_continuous_time();
        double v144 = *(double *)&qword_100A4A5D8;
        [valuea timeIntervalSinceNow];
        self->_timeBase = v144 * (double)v143 + v145;
        uint64_t v146 = [(IDSDSession *)self utunController];
        char v147 = [(IDSDSession *)self sharedState];
        BOOL v148 = [v147 uniqueID];
        [v146 setTimeBase:valuea forIDSSession:v148];
      }
      id v149 = +[NSNumber numberWithBool:self->_isLightweightParticipant];
      if (v149) {
        CFDictionarySetValue(v185, kIDSQRAllocateKey_IsLightweightParticipant, v149);
      }

      [(IDSGFTMetricsCollector *)self->_metricsCollector sendAllocationRequest];
      long long v171 = [(IDSDSession *)self qrAllocator];
      long long v179 = [(IDSDSession *)self sharedState];
      long long v177 = [v179 destinations];
      char v169 = [v177 allObjects];
      long long v175 = [(IDSDSession *)self sharedState];
      id v166 = [v175 uniqueID];
      long long v173 = [(IDSDSession *)self sharedState];
      long long v150 = [v173 fromURI];
      id v151 = [v150 unprefixedURI];
      unint64_t v152 = [v151 _bestGuessURI];
      __int16 v153 = [(IDSDSession *)self accountController];
      id v154 = [(IDSDSession *)self sharedState];
      id v155 = [v154 accountID];
      long long v156 = [v153 accountWithUniqueID:v155];
      long long v157 = [v156 service];
      id v158 = [v157 identifier];
      id v159 = [v171 setupNewAllocation:v169 sessionID:v166 fromIdentity:v181 fromURI:v152 fromService:v158 options:v185 connectReadyHandler:0];

      goto LABEL_55;
    }
  }
  else
  {
  }
  id v107 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v108 = [(IDSDSession *)self sharedState];
    id v109 = [v108 groupID];
    uint64_t v110 = [(IDSDSession *)self sharedState];
    long long v111 = [v110 destinations];
    *(_DWORD *)buf = 138412546;
    *(void *)unsigned int v205 = v109;
    *(_WORD *)&v205[8] = 2112;
    *(void *)&v205[10] = v111;
    _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_DEFAULT, "Participant query in process or defaults are not set for hardcoded QR session info, self.sharedState.groupID: %@, self.sharedState.destinations: %@", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      long long v112 = [(IDSDSession *)self sharedState];
      long long v113 = [v112 groupID];
      id v114 = [(IDSDSession *)self sharedState];
      id v162 = [v114 destinations];
      _IDSLogTransport();

      if (_IDSShouldLog())
      {
        dispatch_block_t v115 = [(IDSDSession *)self sharedState];
        id v116 = [v115 groupID];
        uint64_t v117 = [(IDSDSession *)self sharedState];
        long long v163 = [v117 destinations];
        _IDSLogV();
      }
    }
  }
  self->_joinGroupSessionPending = 1;
  ((void (*)(void))v194[2])();
LABEL_60:
}

- (void)receiveJoinNotificationFromAParticipant
{
  if (self->_startedAsUPlusOneSession)
  {
    v13[1] = _NSConcreteStackBlock;
    v13[2] = (id)3221225472;
    v13[3] = sub_1000C0EC0;
    v13[4] = &unk_10097FE58;
    v13[5] = self;
    IDSTransportThreadAddBlock();
  }
  if (self->_joinRecvTime == 0.0)
  {
    if (qword_100A4A5D0 != -1) {
      dispatch_once(&qword_100A4A5D0, &stru_100981748);
    }
    self->_joinRecvTime = *(double *)&qword_100A4A5D8 * (double)mach_continuous_time();
  }
  if (IMGetDomainBoolForKey() && !self->_reinitTestCompleted)
  {
    id v3 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = [(IDSDSession *)self sharedState];
      id v5 = [v4 uniqueID];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Will reinitiate after 15s for %@.", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      id v6 = [(IDSDSession *)self sharedState];
      uint64_t v10 = [v6 uniqueID];
      _IDSLogTransport();

      if (_IDSShouldLog())
      {
        id v7 = [(IDSDSession *)self sharedState];
        id v11 = [v7 uniqueID];
        _IDSLogV();
      }
    }
    self->_reinitTestCompleted = 1;
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    dispatch_time_t v8 = dispatch_time(0, 15000000000);
    uint64_t v9 = im_primary_queue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000C0F3C;
    block[3] = &unk_100981000;
    objc_copyWeak(v13, (id *)buf);
    dispatch_after(v8, v9, block);

    objc_destroyWeak(v13);
    objc_destroyWeak((id *)buf);
  }
}

- (void)leaveGroupSession:(id)a3 options:(id)a4
{
  id v5 = a4;
  id v6 = [(IDSDSession *)self sharedState];
  id v7 = [v6 uniqueID];
  dispatch_time_t v8 = [v7 componentsSeparatedByString:@"-"];

  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(Mutable, @"state", &off_1009D0F00);
  uint64_t v10 = -[NSString substringFromIndex:](self->_serviceIdentifier, "substringFromIndex:", [@"com.apple.private.alloy." length]);
  if (v10) {
    CFDictionarySetValue(Mutable, @"serviceName", v10);
  }

  id v11 = [v8 objectAtIndexedSubscript:0];
  if (v11) {
    CFDictionarySetValue(Mutable, @"sessionID", v11);
  }

  IDSPowerLogDictionary();
  self->_BOOL sharedSessionHasJoined = 0;
  id v12 = [(IDSDSession *)self utunController];
  BOOL sharedSessionHasJoined = self->_sharedSessionHasJoined;
  id v14 = [(IDSDSession *)self sharedState];
  id v15 = [v14 uniqueID];
  [v12 setSharedSessionHasJoined:sharedSessionHasJoined forIDSSession:v15];

  [(IDSDSession *)self setShouldConnectToQRServer:0];
  id v16 = [v5 objectForKey:IDSGroupSessionClientContextDataKey];

  [(IDSGroupStatusNotificationParameters *)self->_groupStatusNotificationParams setClientLeaveContextData:v16];
  if (self->_handOffOverQREnabled)
  {
    id v17 = [(IDSGroupStatusNotificationParameters *)self->_groupStatusNotificationParams clientLeaveContextData];
    BOOL v18 = [(IDSDSession *)self _generateEncryptedAndSignedIDSContextBlobWithClientContextBlob:v17];

    if (v18)
    {
      uint64_t v19 = [(IDSDSession *)self utunController];
      NSErrorUserInfoKey v20 = [(IDSDSession *)self sharedState];
      id v21 = [v20 uniqueID];
      [v19 setIDSContextBlob:v18 forIDSSession:v21];
    }
  }
  id v22 = [(IDSDSession *)self qrAllocator];
  id v23 = [(IDSDSession *)self sharedState];
  id v24 = [v23 groupID];
  [v22 cleanUpCachedMappings:v24];

  id v25 = [(IDSDSession *)self utunController];
  uint64_t v26 = [(IDSDSession *)self sharedState];
  __int16 v27 = [v26 uniqueID];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000C1344;
  v32[3] = &unk_100981208;
  v32[4] = self;
  [v25 disconnectGlobalLinkForDevice:v27 isReinitiating:0 completionHandler:v32];

  id v28 = +[IMLockdownManager sharedInstance];
  LODWORD(v26) = [v28 isInternalInstall];

  if (v26)
  {
    unsigned int v29 = im_primary_queue();
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1000C19AC;
    v31[3] = &unk_10097E4D0;
    v31[4] = self;
    dispatch_block_t v30 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, v31);
    dispatch_async(v29, v30);
  }
}

- (void)sendKeyMaterialMessage:(id)a3 toDestination:(id)a4
{
  id v6 = (__CFString *)a3;
  id v7 = a4;
  dispatch_time_t v8 = +[NSString stringGUID];
  uint64_t v9 = [(IDSDSession *)self accountController];
  uint64_t v10 = [(IDSDSession *)self sharedState];
  id v11 = [v10 accountID];
  id v12 = [v9 accountWithUniqueID:v11];

  if (v12)
  {
    unsigned int v13 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v12 unprefixedURIStringsFromRegistration];
      *(_DWORD *)buf = 138478339;
      CFStringRef v41 = v6;
      __int16 v42 = 2112;
      id v43 = v14;
      __int16 v44 = 2112;
      id v45 = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "sendKeyMaterialMessage - message %{private}@ given aliases %@  destination: %@", buf, 0x20u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        uint64_t v34 = [v12 unprefixedURIStringsFromRegistration];
        id v37 = v7;
        uint64_t v33 = v6;
        _IDSLogTransport();

        if (_IDSShouldLog())
        {
          uint64_t v34 = objc_msgSend(v12, "unprefixedURIStringsFromRegistration", v6, v34, v7);
          id v37 = v7;
          uint64_t v33 = v6;
          _IDSLogV();
        }
      }
    }
    id v15 = objc_alloc_init((Class)IDSSendParameters);
    [v15 setPriority:300];
    [v15 setDestinations:v7];
    [v15 setMessage:v6];
    [v15 setIdentifier:v8];
    [v15 setAlwaysSkipSelf:1];
    id v16 = IDSGetUUIDData();
    [v15 setMessageUUID:v16];

    [v15 setFireAndForget:1];
    [v15 setBypassStorage:1];
    [v15 setCommand:&off_1009D0F18];
    id v17 = [(IDSDSession *)self requiredLackOfCapabilities];
    id v18 = [v17 count];

    if (v18)
    {
      uint64_t v19 = +[IDSFoundationLog IDSDSession];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        NSErrorUserInfoKey v20 = [(IDSDSession *)self requiredLackOfCapabilities];
        *(_DWORD *)buf = 138412290;
        CFStringRef v41 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "sendKeyMaterialMessage - requires lack of properties {requiredLackOfCapabilities: %@}", buf, 0xCu);
      }
      id v21 = [(IDSDSession *)self requiredLackOfCapabilities];
      [v15 setRequireLackOfRegistrationProperties:v21];
    }
    id v22 = [(IDSDSession *)self requiredCapabilities];
    id v23 = [v22 count];

    if (v23)
    {
      id v24 = +[IDSFoundationLog IDSDSession];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        id v25 = [(IDSDSession *)self requiredCapabilities];
        *(_DWORD *)buf = 138412290;
        CFStringRef v41 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "sendKeyMaterialMessage - requires properties {requiredCapabilities: %@}", buf, 0xCu);
      }
      uint64_t v26 = [(IDSDSession *)self requiredCapabilities];
      [v15 setRequireAllRegistrationProperties:v26];
    }
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_1000C202C;
    v38[3] = &unk_100980FD8;
    id v39 = v8;
    [v12 sendMessageWithSendParameters:v15 willSendBlock:0 completionBlock:v38];
    __int16 v27 = v39;
    goto LABEL_21;
  }
  id v28 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    unsigned int v29 = [(IDSDSession *)self sharedState];
    dispatch_block_t v30 = [v29 accountID];
    *(_DWORD *)buf = 138412546;
    CFStringRef v41 = @"IDSDSession";
    __int16 v42 = 2112;
    id v43 = v30;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%@ - No account with unique ID %@ found to send a message, bailing...", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    uint64_t v31 = [(IDSDSession *)self sharedState];
    uint64_t v35 = [v31 accountID];
    _IDSWarnV();

    uint64_t v32 = [(IDSDSession *)self sharedState];
    uint64_t v36 = [v32 accountID];
    _IDSLogV();

    id v15 = [(IDSDSession *)self sharedState];
    __int16 v27 = [v15 accountID];
    _IDSLogTransport();
LABEL_21:
  }
}

- (void)sendKeyMaterialMessageDataOverQR:(id)a3 toDestination:(id)a4 completionBlock:(id)a5
{
  id v7 = a3;
  id v11 = a4;
  id v12 = a5;
  id v8 = v12;
  id v9 = v11;
  id v10 = v7;
  IDSTransportThreadAddBlock();
}

- (void)setServerDesiredKeyMaterials:(id)a3 signer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (self->_isServerMaterialExchangeEnabled)
  {
    id v9 = +[IDSGroupEncryptionController sharedInstance];
    unsigned __int8 v10 = [v9 shouldUseGecko];

    if ((v10 & 1) == 0)
    {
      os_unfair_lock_lock(&self->_lock);
      objc_storeStrong((id *)&self->_serverDesiredKeyMaterialsFromGroupEncryptionController, a3);
      id v11 = [v8 copy];
      id serverDesiredKeyMaterialsSigner = self->_serverDesiredKeyMaterialsSigner;
      self->_id serverDesiredKeyMaterialsSigner = v11;

      os_unfair_lock_unlock(&self->_lock);
      [(IDSDSession *)self updateServerDesiredKeyMaterials];
    }
  }
  else
  {
    unsigned int v13 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "setServerDesiredKeyMaterials: SME disabled", v14, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
  }
}

- (id)getDesiredMaterialSetForEncryptedData
{
  keyValueDelivery = self->_keyValueDelivery;
  id v3 = [(IDSDSession *)self sharedState];
  uint64_t v4 = [v3 groupID];
  id v5 = [(IDSDSessionKeyValueDeliveryProtocol *)keyValueDelivery getAllKeyValueDeliveryLocalMaterialSetForGroupID:v4];

  return v5;
}

- (void)updateServerDesiredKeyValueDeliveryMaterialsNeeded
{
  if (self->_isServerMaterialExchangeEnabled)
  {
    id v8 = +[IDSGroupEncryptionController sharedInstance];
    id v3 = [(IDSDSession *)self sharedState];
    uint64_t v4 = [v3 groupID];
    id v5 = [(IDSDSession *)self sharedState];
    id v6 = [v5 uniqueID];
    [v8 updateServerDesiredKeyMaterialsForGroup:v4 sessionID:v6];
  }
  else
  {
    id v7 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "updateServerDesiredKeyValueDeliveryMaterialsNeeded: SME disabled", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
  }
}

- (void)requestKeyValueDeliveryDataForKey:(unsigned int)a3 participantID:(unint64_t)a4
{
  if (a3 == 1)
  {
    id v6 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      int v15 = 5;
      __int16 v16 = 2112;
      CFStringRef v17 = @"MIRAGEKEY";
      __int16 v18 = 2048;
      unint64_t v19 = a4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "requestKeyValueDeliveryDataForKey: requesting type %d (%@) for %llu", buf, 0x1Cu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      CFStringRef v11 = @"MIRAGEKEY";
      unint64_t v12 = a4;
      uint64_t v10 = 5;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        CFStringRef v11 = @"MIRAGEKEY";
        unint64_t v12 = a4;
        uint64_t v10 = 5;
        _IDSLogV();
      }
    }
    id v7 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4, v10, v11, v12);
    unsigned int v13 = v7;
    id v8 = +[NSArray arrayWithObjects:&v13 count:1];
    [(IDSDSession *)self requestMaterialsForParticipantIDs:v8 materialType:5];
  }
  else
  {
    id v9 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "requestKeyValueDeliveryDataForKey: unknown type: %d", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
  }
}

- (id)serverDesiredKeyMaterials
{
  if (self->_isServerMaterialExchangeEnabled)
  {
    id v2 = [(NSSet *)self->_serverDesiredKeyMaterialsFromGroupEncryptionController mutableCopy];
  }
  else
  {
    id v2 = +[NSSet set];
  }

  return v2;
}

- (void)updateServerDesiredKeyMaterials
{
  if (self->_isServerMaterialExchangeEnabled)
  {
    id v3 = +[IDSGroupEncryptionController sharedInstance];
    unsigned __int8 v4 = [v3 shouldUseGecko];

    if ((v4 & 1) == 0)
    {
      os_unfair_lock_lock(&self->_lock);
      id v5 = [(IDSDSession *)self serverDesiredKeyMaterials];
      id v6 = [self->_serverDesiredKeyMaterialsSigner copy];
      id v7 = [(IDSDSession *)self sharedState];
      id v8 = [v7 uniqueID];

      os_unfair_lock_unlock(&self->_lock);
      unsigned int v13 = v5;
      id v9 = v6;
      id v10 = v5;
      id v11 = v8;
      IDSTransportThreadAddBlock();
    }
  }
  else
  {
    unint64_t v12 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "updateServerDesiredKeyMaterials: SME disabled", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
  }
}

- (void)didCreateMKM:(id)a3
{
  metricsCollector = self->_metricsCollector;
  id v4 = [a3 keyIndex];
  [(IDSGFTMetricsCollector *)metricsCollector didCreateMKM:v4];
}

- (void)recvKeyMaterial:(id)a3
{
  id v4 = a3;
  if (self->_multiplexerEnabled)
  {
    id v5 = [(IDSMultiplexerGroupSessionTransport *)self->_multiplexerTransport fanoutEncryptionManager];
    [v5 recvKeyMaterial:v4];
  }
  id v6 = v4;
  NSErrorUserInfoKey v20 = v6;
  IDSTransportThreadAddBlock();
  if (qword_100A4A5D0 != -1) {
    dispatch_once(&qword_100A4A5D0, &stru_100981748);
  }
  double v7 = *(double *)&qword_100A4A5D8 * (double)mach_continuous_time();
  self->_newKeyEventTime = v7;
  double membershipChangeEventTime = self->_membershipChangeEventTime;
  if (membershipChangeEventTime != 0.0)
  {
    uint64_t v9 = (uint64_t)((v7 - membershipChangeEventTime) * 1000.0);
    id v10 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [(IDSDSession *)self sharedState];
      unint64_t v12 = [v11 groupID];
      *(_DWORD *)buf = 134218242;
      uint64_t v22 = v9;
      __int16 v23 = 2112;
      id v24 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Received the new MKM %lld milleseconds after the membership change event for group %@", buf, 0x16u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        unsigned int v13 = [(IDSDSession *)self sharedState];
        [v13 groupID];
        v19 = uint64_t v18 = v9;
        _IDSLogTransport();

        if (_IDSShouldLog())
        {
          id v14 = [(IDSDSession *)self sharedState];
          [v14 groupID];
          v19 = uint64_t v18 = v9;
          _IDSLogV();
        }
      }
    }
    int v15 = +[IDSAWDLogging sharedInstance];
    __int16 v16 = [(IDSDSession *)self sharedState];
    CFStringRef v17 = [v16 serviceName];
    [v15 IDSRealTimeEncryptionServiceName:v17 activeParticipants:self->_cachedNumberOfActiveParticipants membershipChangeMKMTimeDelta:v9];

    self->_double membershipChangeEventTime = 0.0;
    self->_newKeyEventTime = 0.0;
  }
}

- (void)didSendKeyMaterial:(id)a3 duration:(double)a4
{
  id v5 = a3;
  if (self->_firstMKMSentTime == 0.0)
  {
    id v6 = v5;
    if (qword_100A4A5D0 != -1) {
      dispatch_once(&qword_100A4A5D0, &stru_100981748);
    }
    self->_firstMKMSentTime = *(double *)&qword_100A4A5D8 * (double)mach_continuous_time();
    id v5 = v6;
  }
}

- (void)invalidateKeyMaterialByKeyIndexes:(id)a3
{
  if (self->_multiplexerEnabled)
  {
    multiplexerTransport = self->_multiplexerTransport;
    id v4 = a3;
    id v5 = [(IDSMultiplexerGroupSessionTransport *)multiplexerTransport fanoutEncryptionManager];
    [v5 invalidateKeyMaterialByKeyIndexes:v4];
  }
}

- (void)_sendClientDecryptedDatabBlobs:(id)a3 type:(int)a4 forParticipant:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [v9 participantURI];
  id v11 = +[IDSURI URIWithPrefixedURI:v10];

  if (sub_1004039F4(v11))
  {
    unint64_t v12 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "_sendClientDecryptedDatabBlobs: dropping because it came from blocked URI", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
  }
  else
  {
    unsigned int v13 = im_primary_queue();
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000C35A4;
    v15[3] = &unk_1009815E8;
    v15[4] = self;
    int v18 = a4;
    id v16 = v9;
    id v17 = v8;
    dispatch_block_t v14 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, v15);
    dispatch_async(v13, v14);
  }
}

- (void)_sendRemoteParticipantInfoEventToClient:(id)a3 forParticipant:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C38A4;
  block[3] = &unk_10097E418;
  void block[4] = self;
  id v13 = v7;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_block_t v11 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, block);
  dispatch_async(v8, v11);
}

- (void)receiveAndDecryptEncryptedDataBlobs:(id)a3
{
  id v4 = a3;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v36 = self;
  if (!self->_typeToKeyIDToEncryptedData)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    typeToKeyIDToEncryptedData = self->_typeToKeyIDToEncryptedData;
    self->_typeToKeyIDToEncryptedData = Mutable;
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v4;
  id v34 = [obj countByEnumeratingWithState:&v44 objects:v57 count:16];
  if (v34)
  {
    uint64_t v33 = *(void *)v45;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v45 != v33)
        {
          uint64_t v8 = v7;
          objc_enumerationMutation(obj);
          uint64_t v7 = v8;
        }
        uint64_t v37 = v7;
        id v9 = *(const void **)(*((void *)&v44 + 1) + 8 * v7);
        id v10 = objc_msgSend(obj, "objectForKeyedSubscript:", v9, v28, v29, v30, v31, lock);
        CFDictionaryRef theDict = [(NSMutableDictionary *)v36->_typeToKeyIDToEncryptedData objectForKeyedSubscript:v9];
        if (!theDict) {
          CFDictionaryRef theDict = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        }
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v11 = v10;
        id v12 = [v11 countByEnumeratingWithState:&v40 objects:v56 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v41;
          do
          {
            for (int i = 0; i != v12; int i = (char *)i + 1)
            {
              if (*(void *)v41 != v13) {
                objc_enumerationMutation(v11);
              }
              int v15 = *(void **)(*((void *)&v40 + 1) + 8 * i);
              if ((unint64_t)objc_msgSend(v15, "length", v28, v29) > 0x10)
              {
                unint64_t v19 = objc_msgSend(v15, "subdataWithRange:", 0, 16);
                NSErrorUserInfoKey v20 = (char *)[v15 length] - 16;
                id v21 = objc_msgSend(v15, "subdataWithRange:", 16, v20);
                id v22 = v19;
                id v23 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", objc_msgSend(v22, "bytes"));
                id v24 = OSLogHandleForTransportCategory();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138413058;
                  dispatch_block_t v49 = v9;
                  __int16 v50 = 2048;
                  __int16 v51 = v20;
                  __int16 v52 = 2112;
                  uint64_t v53 = v21;
                  __int16 v54 = 2112;
                  id v55 = v23;
                  _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "receiveAndDecryptEncryptedDataBlobs: type: %@, blobLength: %lu, standaloneBlob: %@, keyID: %@", buf, 0x2Au);
                }

                if (os_log_shim_legacy_logging_enabled())
                {
                  if (_IDSShouldLogTransport())
                  {
                    dispatch_block_t v30 = v21;
                    id v31 = v23;
                    id v28 = v9;
                    unsigned int v29 = v20;
                    _IDSLogTransport();
                    if (_IDSShouldLog())
                    {
                      dispatch_block_t v30 = v21;
                      id v31 = v23;
                      id v28 = v9;
                      unsigned int v29 = v20;
                      _IDSLogV();
                    }
                  }
                }
                if (v21) {
                  CFDictionarySetValue(theDict, v23, v21);
                }
              }
              else
              {
                id v16 = OSLogHandleForTransportCategory();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                {
                  id v17 = (char *)[v15 length];
                  *(_DWORD *)buf = 138412546;
                  dispatch_block_t v49 = v9;
                  __int16 v50 = 2048;
                  __int16 v51 = v17;
                  _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "receiveAndDecryptEncryptedDataBlobs: blob too small: type: %@, dataBlob length: %lu", buf, 0x16u);
                }

                if (os_log_shim_legacy_logging_enabled())
                {
                  if (_IDSShouldLogTransport())
                  {
                    id v28 = v9;
                    unsigned int v29 = (char *)[v15 length];
                    _IDSLogTransport();
                    if (_IDSShouldLog())
                    {
                      int v18 = (char *)objc_msgSend(v15, "length", v9, v29);
                      id v28 = v9;
                      unsigned int v29 = v18;
                      _IDSLogV();
                    }
                  }
                }
              }
            }
            id v12 = [v11 countByEnumeratingWithState:&v40 objects:v56 count:16];
          }
          while (v12);
        }

        id v25 = theDict;
        if (theDict)
        {
          CFDictionarySetValue((CFMutableDictionaryRef)v36->_typeToKeyIDToEncryptedData, v9, theDict);
          id v25 = theDict;
        }

        uint64_t v7 = v37 + 1;
      }
      while ((id)(v37 + 1) != v34);
      id v34 = [obj countByEnumeratingWithState:&v44 objects:v57 count:16];
    }
    while (v34);
  }

  os_unfair_lock_unlock(lock);
  uint64_t v26 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C3F64;
  block[3] = &unk_10097E4D0;
  void block[4] = v36;
  dispatch_block_t v27 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, block);
  dispatch_async(v26, v27);
}

- (void)_decryptReceivedDataBlobsUsingSKMs
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSMutableDictionary *)self->_typeToKeyIDToEncryptedData count];
  id v5 = +[IDSFoundationLog IDSDSession];
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      id v7 = [(NSMutableDictionary *)self->_typeToParticipantIDToDecryptedDataBlob count];
      typeToKeyIDToEncryptedData = self->_typeToKeyIDToEncryptedData;
      *(_DWORD *)buf = 134218242;
      id v60 = v7;
      __int16 v61 = 2112;
      uint64_t v62 = typeToKeyIDToEncryptedData;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_decryptReceivedDataBlobsUsingSKMs: _typeToParticipantIDToDecryptedDataBlob count: %llu, _typeToKeyIDToEncryptedData: %@", buf, 0x16u);
    }

    if (!self->_typeToParticipantIDToDecryptedDataBlob)
    {
      CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      typeToParticipantIDToDecryptedDataBlob = self->_typeToParticipantIDToDecryptedDataBlob;
      self->_typeToParticipantIDToDecryptedDataBlob = Mutable;
    }
    id v11 = [(NSMutableDictionary *)self->_typeToKeyIDToEncryptedData copy];
    os_unfair_lock_t lock = p_lock;
    os_unfair_lock_unlock(p_lock);
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id obj = v11;
    id v35 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (v35)
    {
      uint64_t v34 = *(void *)v54;
      do
      {
        for (int i = 0; i != v35; int i = (char *)i + 1)
        {
          if (*(void *)v54 != v34) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          id v14 = [(NSMutableDictionary *)self->_typeToParticipantIDToDecryptedDataBlob objectForKeyedSubscript:v13];
          if (!v14) {
            id v14 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          }
          int v15 = [(NSMutableDictionary *)self->_typeToKeyIDToEncryptedData objectForKeyedSubscript:v13];
          if (!v15) {
            int v15 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          }
          unsigned int v16 = [v13 intValue];
          id v17 = [v15 count];
          id v18 = objc_alloc_init((Class)NSMutableSet);
          if (v17)
          {
            long long v40 = v14;
            long long v41 = i;
            v49[0] = _NSConcreteStackBlock;
            v49[1] = 3221225472;
            v49[2] = sub_1000C44A0;
            v49[3] = &unk_100981610;
            v49[4] = v13;
            void v49[5] = self;
            unsigned int v37 = v16;
            unsigned int v52 = v16;
            id v36 = v14;
            id v50 = v36;
            id v38 = v18;
            id v19 = v18;
            id v51 = v19;
            id v39 = v15;
            [v15 enumerateKeysAndObjectsUsingBlock:v49];
            os_unfair_lock_lock(lock);
            long long v47 = 0u;
            long long v48 = 0u;
            long long v45 = 0u;
            long long v46 = 0u;
            id v20 = v19;
            id v21 = [v20 countByEnumeratingWithState:&v45 objects:v57 count:16];
            if (v21)
            {
              id v22 = v21;
              uint64_t v23 = *(void *)v46;
              do
              {
                for (uint64_t j = 0; j != v22; uint64_t j = (char *)j + 1)
                {
                  if (*(void *)v46 != v23) {
                    objc_enumerationMutation(v20);
                  }
                  uint64_t v25 = *(void *)(*((void *)&v45 + 1) + 8 * (void)j);
                  uint64_t v26 = [(NSMutableDictionary *)self->_typeToKeyIDToEncryptedData objectForKeyedSubscript:v13];
                  [v26 removeObjectForKey:v25];

                  dispatch_block_t v27 = [(NSMutableDictionary *)self->_typeToKeyIDToEncryptedData objectForKeyedSubscript:v13];
                  id v28 = [v27 count];

                  if (!v28) {
                    [(NSMutableDictionary *)self->_typeToKeyIDToEncryptedData removeObjectForKey:v13];
                  }
                  unsigned int v29 = +[IDSFoundationLog IDSDSession];
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                  {
                    dispatch_block_t v30 = [(NSMutableDictionary *)self->_typeToKeyIDToEncryptedData objectForKeyedSubscript:v13];
                    id v31 = [v30 count];
                    uint64_t v32 = self->_typeToKeyIDToEncryptedData;
                    *(_DWORD *)buf = 134218242;
                    id v60 = v31;
                    __int16 v61 = 2112;
                    uint64_t v62 = v32;
                    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "_decryptReceivedDataBlobsUsingSKMs: count: %llu, %@", buf, 0x16u);
                  }
                }
                id v22 = [v20 countByEnumeratingWithState:&v45 objects:v57 count:16];
              }
              while (v22);
            }

            os_unfair_lock_unlock(lock);
            v43[0] = _NSConcreteStackBlock;
            v43[1] = 3221225472;
            v43[2] = sub_1000C49B0;
            v43[3] = &unk_100981638;
            v43[4] = self;
            v43[5] = v13;
            unsigned int v44 = v37;
            [v36 enumerateKeysAndObjectsUsingBlock:v43];

            id v14 = v40;
            int i = v41;
            id v18 = v38;
            int v15 = v39;
          }
        }
        id v35 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
      }
      while (v35);
    }
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_decryptReceivedEncryptedDataBlobsUsingSKMs, no encryptedBlobTypeCount, return", buf, 2u);
    }

    os_unfair_lock_unlock(p_lock);
  }
}

- (BOOL)shouldReportToClient:(id)a3 timeStamp:(double)a4 type:(unint64_t)a5
{
  id v8 = a3;
  participantIDToRemoteParticipantContext = self->_participantIDToRemoteParticipantContext;
  if (!participantIDToRemoteParticipantContext)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    id v11 = self->_participantIDToRemoteParticipantContext;
    self->_participantIDToRemoteParticipantContext = Mutable;

    participantIDToRemoteParticipantContext = self->_participantIDToRemoteParticipantContext;
  }
  id v12 = [(NSMutableDictionary *)participantIDToRemoteParticipantContext objectForKeyedSubscript:v8];
  uint64_t v13 = v12;
  if (!v12)
  {
    id v17 = [[IDSDSessionRemoteParticipantContext alloc] initWithtimeStamp:a5 updateType:a4];
    [(NSMutableDictionary *)self->_participantIDToRemoteParticipantContext setObject:v17 forKeyedSubscript:v8];
    uint64_t v23 = +[IDSFoundationLog IDSDSession];
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
LABEL_17:
      BOOL v19 = 1;
      goto LABEL_18;
    }
    int v26 = 138412546;
    dispatch_block_t v27 = v17;
    __int16 v28 = 2048;
    id v29 = [v8 unsignedLongLongValue];
    id v20 = "shouldReportToClient: Sending first event %@ for participantID: %llu!";
    id v21 = v23;
    uint32_t v22 = 22;
LABEL_16:
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v26, v22);
    goto LABEL_17;
  }
  [v12 timeStamp];
  double v15 = v14;
  id v16 = [v13 updateType];
  id v17 = [[IDSDSessionRemoteParticipantContext alloc] initWithtimeStamp:a5 updateType:a4];
  if (v15 < a4 && v16 != (id)a5)
  {
    [(NSMutableDictionary *)self->_participantIDToRemoteParticipantContext setObject:v17 forKeyedSubscript:v8];
    uint64_t v23 = +[IDSFoundationLog IDSDSession];
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    int v26 = 138412802;
    dispatch_block_t v27 = v17;
    __int16 v28 = 2112;
    id v29 = v13;
    __int16 v30 = 2048;
    id v31 = [v8 unsignedLongLongValue];
    id v20 = "shouldReportToClient: Sending update event %@ previous event %@ for participantID: %llu!";
    id v21 = v23;
    uint32_t v22 = 32;
    goto LABEL_16;
  }
  uint64_t v23 = +[IDSFoundationLog IDSDSession];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 138412802;
    dispatch_block_t v27 = v17;
    __int16 v28 = 2112;
    id v29 = v13;
    __int16 v30 = 2048;
    id v31 = [v8 unsignedLongLongValue];
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "shouldReportToClient: Not Sending event %@ previous event %@ for participantID: %llu!", (uint8_t *)&v26, 0x20u);
  }
  BOOL v19 = 0;
LABEL_18:

  return v19;
}

- (void)rejectedKeyRecoveryRequestFromURI:(id)a3 reason:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(IDSDSession *)self sharedState];
    id v9 = [v8 uniqueID];
    *(_DWORD *)buf = 138412802;
    id v21 = v9;
    __int16 v22 = 2112;
    id v23 = v6;
    __int16 v24 = 1024;
    int v25 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "rejectedKeyRecoveryRequestFromURI for session %@, from: %@, reason: %u", buf, 0x1Cu);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v10 = [(IDSDSession *)self sharedState];
      double v15 = [v10 uniqueID];
      _IDSLogTransport();

      if (_IDSShouldLog())
      {
        id v11 = [(IDSDSession *)self sharedState];
        id v16 = [v11 uniqueID];
        _IDSLogV();
      }
    }
  }
  id v12 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C5424;
  block[3] = &unk_100980E48;
  void block[4] = self;
  id v18 = v6;
  int v19 = v4;
  id v13 = v6;
  dispatch_block_t v14 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, block);
  dispatch_async(v12, v14);
}

- (void)recvStableKeyMaterialForFrameworkCache:(id)a3
{
  id v32 = a3;
  uint64_t v4 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(IDSDSession *)self sharedState];
    id v6 = [v5 uniqueID];
    *(_DWORD *)buf = 138412546;
    long long v42 = v6;
    __int16 v43 = 2112;
    id v44 = v32;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "recvStableKeyMaterialForFrameworkCache for session %@. SKM: %@", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v7 = [(IDSDSession *)self sharedState];
      __int16 v30 = [v7 uniqueID];
      id v31 = v32;
      _IDSLogTransport();

      if (_IDSShouldLog())
      {
        id v8 = [(IDSDSession *)self sharedState];
        __int16 v30 = [v8 uniqueID];
        id v31 = v32;
        _IDSLogV();
      }
    }
  }
  if (v32 && [v32 count])
  {
    id v9 = im_primary_queue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000C5A94;
    block[3] = &unk_10097E440;
    void block[4] = self;
    id v10 = v32;
    id v39 = v10;
    dispatch_block_t v11 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, block);
    dispatch_async(v9, v11);

    os_unfair_lock_lock(&self->_lock);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = v10;
    char v12 = 0;
    id v13 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v35;
      do
      {
        for (int i = 0; i != v13; int i = (char *)i + 1)
        {
          if (*(void *)v35 != v14) {
            objc_enumerationMutation(obj);
          }
          id v16 = [objc_alloc((Class)IDSGroupEncryptionKeyMaterial) initWithDictionary:*(void *)(*((void *)&v34 + 1) + 8 * i)];
          unsigned __int8 v17 = [(IDSGroupEncryptionKeyManager *)self->_dataBlobEncryptionManager recvKeyMaterial:v16];
          keyIDToParticipantID = self->_keyIDToParticipantID;
          if (!keyIDToParticipantID)
          {
            CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
            id v20 = self->_keyIDToParticipantID;
            self->_keyIDToParticipantID = Mutable;

            keyIDToParticipantID = self->_keyIDToParticipantID;
          }
          id v21 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v16, "participantID", v30, v31));
          __int16 v22 = [v16 keyIndex];
          [(NSMutableDictionary *)keyIDToParticipantID setObject:v21 forKey:v22];

          v12 |= v17;
        }
        id v13 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
      }
      while (v13);
    }

    id v23 = (IDSGroupSessionDataCryptor *)[objc_alloc((Class)IDSGroupSessionDataCryptor) initWithTopic:@"dataBlobEncryption" keyManager:self->_dataBlobEncryptionManager];
    cryptorForBlobs = self->_cryptorForBlobs;
    self->_cryptorForBlobs = v23;

    os_unfair_lock_unlock(&self->_lock);
    [(IDSDSession *)self _decryptReceivedDataBlobsUsingSKMs];
    if (v12)
    {
      int v25 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = [(IDSDSession *)self sharedState];
        dispatch_block_t v27 = [v26 uniqueID];
        *(_DWORD *)buf = 138412290;
        long long v42 = v27;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "recvStableKeyMaterialForFrameworkCache for session %@. Re-encyrpting Blobs with new encryption key (local SKM)", buf, 0xCu);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          __int16 v28 = [(IDSDSession *)self sharedState];
          __int16 v30 = [v28 uniqueID];
          _IDSLogTransport();

          if (_IDSShouldLog())
          {
            id v29 = [(IDSDSession *)self sharedState];
            __int16 v30 = [v29 uniqueID];
            _IDSLogV();
          }
        }
      }
      [(IDSDSession *)self updateRelevantEncryptedDataBlob];
    }
  }
}

- (void)InvalidateStableKeyMaterialInFrameworkCache:(id)a3
{
  id v4 = a3;
  id v5 = im_primary_queue();
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000C5C60;
  v8[3] = &unk_10097E440;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  dispatch_block_t v7 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, v8);
  dispatch_async(v5, v7);
}

- (void)recvMembershipChangeEventWithReason:(unsigned __int8)a3 completionHandler:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  if (self->_multiplexerEnabled)
  {
    dispatch_block_t v7 = [(IDSMultiplexerGroupSessionTransport *)self->_multiplexerTransport fanoutEncryptionManager];
    [v7 receiveMembershipChangedInformation:v4];

    if ((v4 - 1) <= 1u)
    {
      id v8 = [(IDSMultiplexerGroupSessionTransport *)self->_multiplexerTransport fanoutEncryptionManager];
      [v8 purgeOldKeyMaterial];
    }
  }
  id v9 = v6;
  IDSTransportThreadAddBlock();
  if (qword_100A4A5D0 != -1) {
    dispatch_once(&qword_100A4A5D0, &stru_100981748);
  }
  self->_double membershipChangeEventTime = *(double *)&qword_100A4A5D8 * (double)mach_continuous_time();
}

- (void)sendAllocationRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSDSession *)self accountController];
  id v6 = [(IDSDSession *)self sharedState];
  dispatch_block_t v7 = [v6 accountID];
  id v8 = [v5 accountWithUniqueID:v7];
  id v9 = [v8 service];

  dispatch_block_t v27 = [(IDSDSession *)self qrAllocator];
  int v26 = [v4 objectForKey:kIDSQRAllocateKey_Recipients];
  id v10 = [(IDSDSession *)self sharedState];
  __int16 v24 = v4;
  dispatch_block_t v11 = [v4 objectForKey:kIDSQRAllocateKey_AllocateType];
  int v25 = [v10 getQuickRelayAllocateOptions:v11];

  location[0] = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(location, self);
  [(IDSGFTMetricsCollector *)self->_metricsCollector sendAllocationRequest];
  char v12 = [(IDSDSession *)self sharedState];
  id v13 = [v12 uniqueID];
  uint64_t v14 = [(IDSDSession *)self accountController];
  double v15 = [(IDSDSession *)self sharedState];
  id v29 = [v15 accountID];
  __int16 v28 = [v14 accountWithUniqueID:v29];
  id v23 = [v28 _registrationCert];
  id v16 = [(IDSDSession *)self sharedState];
  unsigned __int8 v17 = [v16 fromURI];
  id v18 = [v17 unprefixedURI];
  int v19 = [v18 _bestGuessURI];
  id v20 = [v9 identifier];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000C6214;
  v30[3] = &unk_100981688;
  objc_copyWeak(&v32, location);
  id v21 = v9;
  id v31 = v21;
  id v22 = [v27 setupNewAllocation:v26 sessionID:v13 fromIdentity:v23 fromURI:v19 fromService:v20 options:v25 connectReadyHandler:v30];

  objc_destroyWeak(&v32);
  objc_destroyWeak(location);
}

- (void)hasOutdatedSKI:(id)a3
{
  id v4 = a3;
  id v11 = objc_alloc_init((Class)IMMessageContext);
  [v11 setShouldBoost:1];
  id v5 = +[IDSDaemon sharedInstance];
  id v6 = [(IDSDSession *)self sharedState];
  dispatch_block_t v7 = [v6 pushTopic];
  id v8 = [v5 broadcasterForTopic:v7 entitlement:kIDSSessionEntitlement command:0 messageContext:v11];

  id v9 = [(IDSDSession *)self sharedState];
  id v10 = [v9 uniqueID];
  [v8 session:v10 hasOutdatedSKI:v4];
}

- (void)requestEncryptionKeyForParticipantIDs:(id)a3
{
  id v4 = a3;
  id v5 = im_primary_queue();
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000C6500;
  v8[3] = &unk_10097E440;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  dispatch_block_t v7 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, v8);
  dispatch_async(v5, v7);
}

- (void)requestMaterialsForParticipantIDs:(id)a3 materialType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  dispatch_block_t v7 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(IDSDSession *)self sharedState];
    id v9 = [v8 uniqueID];
    *(_DWORD *)buf = 138412802;
    unsigned __int8 v17 = v9;
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 1024;
    int v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "requestMaterialsForParticipantIDs for session %@. participantIDs: %@; materialType:%d",
      buf,
      0x1Cu);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v10 = [(IDSDSession *)self sharedState];
      id v13 = [v10 uniqueID];
      _IDSLogTransport();

      if (_IDSShouldLog())
      {
        id v11 = [(IDSDSession *)self sharedState];
        uint64_t v14 = [v11 uniqueID];
        _IDSLogV();
      }
    }
  }
  if (self->_isServerMaterialExchangeEnabled)
  {
    id v15 = v6;
    IDSTransportThreadAddBlock();
  }
  else
  {
    char v12 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "requestMaterialsForParticipantIDs: SME disabled", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
  }
}

- (void)createAliasForParticipantID:(unint64_t)a3 salt:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  IDSTransportThreadAddBlock();
}

- (void)getParticipantIDForAlias:(unint64_t)a3 salt:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  IDSTransportThreadAddBlock();
}

- (unint64_t)participantIDForAlias:(unint64_t)a3 salt:(id)a4
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
  id v6 = a4;
  IDSTransportThreadAddSyncBlock();
  unint64_t v4 = v8[3];

  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)onParticipantID2PushTokenMappingChange:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)NSUUID);
  id v5 = [v3 objectForKey:kIDSQRAllocateKey_RelaySessionID];
  id v6 = objc_msgSend(v4, "initWithUUIDBytes:", objc_msgSend(v5, "bytes"));
  id v23 = [v6 UUIDString];

  int v25 = v3;
  uint64_t v7 = [v3 objectForKey:kIDSQRAllocateKey_Allocations];
  id v8 = +[NSMutableArray array];
  dispatch_block_t v27 = +[NSMutableArray array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v7;
  id v9 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v32;
    uint64_t v12 = kIDSQRAllocateKey_RecipientID;
    uint64_t v13 = kIDSQRAllocateKey_RecipientPushToken;
    do
    {
      for (int i = 0; i != v10; int i = (char *)i + 1)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v16 = [v15 objectForKey:v12];
        unsigned __int8 v17 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v16 unsignedLongLongValue]);
        __int16 v18 = [v15 objectForKey:v13];
        [v8 addObject:v17];
        [v27 addObject:v18];
      }
      id v10 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v10);
  }

  void block[5] = _NSConcreteStackBlock;
  void block[6] = 3221225472;
  block[7] = sub_1000C74F8;
  block[8] = &unk_10097FE10;
  block[9] = self;
  id v29 = v23;
  id v30 = v8;
  id v19 = v8;
  id v20 = v23;
  IDSTransportThreadAddBlock();
  int v21 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C75B0;
  block[3] = &unk_10097E4D0;
  void block[4] = self;
  dispatch_block_t v22 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, block);
  dispatch_async(v21, v22);
}

- (void)onURI2ParticipantIDMappingChange:(id)a3 allocateResponse:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc((Class)NSUUID);
  id v8 = [v6 objectForKey:kIDSQRAllocateKey_IDSSessionID];
  id v9 = objc_msgSend(v7, "initWithUUIDBytes:", objc_msgSend(v8, "bytes"));
  id v10 = [v9 UUIDString];

  id v11 = objc_alloc((Class)NSUUID);
  id v12 = [v6 objectForKey:kIDSQRAllocateKey_RelaySessionID];
  id v13 = objc_msgSend(v11, "initWithUUIDBytes:", objc_msgSend(v12, "bytes"));
  uint64_t v14 = [v13 UUIDString];

  id v15 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "URI to participantID mapping changed for sessionID: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
  __int16 v18 = v5;
  id v16 = v5;
  id v17 = v14;
  IDSTransportThreadAddBlock();
}

- (void)qrAllocatorDidReceiveAllocateResponse:(id)a3
{
  [a3 objectForKey:kIDSQRAllocateKey_Allocations];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v25 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v25)
  {
    uint64_t v23 = kIDSQRAllocateKey_RecipientID;
    uint64_t v24 = *(void *)v29;
    os_unfair_lock_t lock = &self->_lock;
    uint64_t v21 = kIDSQRAllocateKey_RecipientURI;
    uint64_t v20 = kIDSQRAllocateKey_RecipientPushToken;
    do
    {
      for (int i = 0; i != v25; int i = (char *)i + 1)
      {
        if (*(void *)v29 != v24) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v6 = objc_msgSend(v5, "objectForKey:", v23, v20);
        id v7 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v6 unsignedLongLongValue]);
        id v8 = [(IDSDSession *)self qrAllocator];
        id v9 = [(IDSDSession *)self sharedState];
        id v10 = [v9 groupID];
        id v11 = [v8 getURIFromParticipantID:v10 participantID:v7];

        os_unfair_lock_lock(lock);
        int v26 = v6;
        if (v11)
        {
          id v12 = +[IDSURI URIWithPrefixedURI:v11];
        }
        else
        {
          id v13 = [v5 objectForKey:v21];
          id v12 = +[IDSURI URIWithPrefixedURI:v13];
        }
        [(NSMutableDictionary *)self->_participantIDToURI setObject:v12 forKeyedSubscript:v7];

        os_unfair_lock_unlock(lock);
        uint64_t v14 = [(IDSDSession *)self qrAllocator];
        id v15 = [(IDSDSession *)self sharedState];
        id v16 = [v15 groupID];
        id v17 = [v14 getPushTokenFromParticipantID:v16 participantID:v7];

        os_unfair_lock_lock(lock);
        if (v17)
        {
          __int16 v18 = +[IDSPushToken pushTokenWithData:v17];
        }
        else
        {
          id v19 = [v5 objectForKey:v20];
          __int16 v18 = +[IDSPushToken pushTokenWithData:v19];
        }
        [(NSMutableDictionary *)self->_participantIDToPushToken setObject:v18 forKeyedSubscript:v7];

        os_unfair_lock_unlock(lock);
      }
      id v25 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v25);
  }
}

- (void)processAllocationErrorStatus:(int)a3 errorCode:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  id v7 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(IDSDSession *)self sharedState];
    id v9 = [v8 uniqueID];
    *(_DWORD *)buf = 138412802;
    id v16 = v9;
    __int16 v17 = 1024;
    int v18 = v5;
    __int16 v19 = 1024;
    int v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Allocation failure for session %@, status = %d, code = %d", buf, 0x18u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v10 = [(IDSDSession *)self sharedState];
      [v10 uniqueID];
      uint64_t v13 = v5;
      id v12 = v14 = v4;
      _IDSLogTransport();

      if (_IDSShouldLog())
      {
        id v11 = [(IDSDSession *)self sharedState];
        [v11 uniqueID];
        uint64_t v13 = v5;
        id v12 = v14 = v4;
        _IDSLogV();
      }
    }
  }
  -[IDSDSession endSessionWithReason:](self, "endSessionWithReason:", v4, v12, v13, v14);
}

- (void)_updateActiveParticipants:(id)a3
{
  id v4 = a3;
  self->_cachedNumberOfActiveParticipants = (int64_t)[v4 count];
  uint64_t v5 = im_primary_queue();
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000C8000;
  v8[3] = &unk_10097E440;
  id v9 = v4;
  id v10 = self;
  id v6 = v4;
  dispatch_block_t v7 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, v8);
  dispatch_async(v5, v7);
}

- (void)_updateActiveLightweightParticipants:(id)a3
{
  id v4 = a3;
  uint64_t v5 = im_primary_queue();
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000C85E0;
  v8[3] = &unk_10097E440;
  id v9 = v4;
  id v10 = self;
  id v6 = v4;
  dispatch_block_t v7 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INTERACTIVE, 0, v8);
  dispatch_async(v5, v7);
}

- (id)_createGroupSessionActiveParticipantsFromParticipants:(id)a3 pushTokenForParticipants:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSMutableArray array];
  id v9 = objc_alloc((Class)NSUUID);
  id v10 = [(IDSDSession *)self sharedState];
  id v11 = [v10 groupID];
  id v12 = [v9 initWithUUIDString:v11];

  if ([v6 count])
  {
    unint64_t v13 = 0;
    do
    {
      uint64_t v14 = [v6 objectAtIndex:v13];
      id v15 = [v7 objectAtIndex:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v25) = v13;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Missing push token at index %d. Replacing NSNull with nil.", buf, 8u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            unint64_t v22 = v13;
            _IDSLogTransport();
            if (_IDSShouldLog())
            {
              unint64_t v22 = v13;
              _IDSLogV();
            }
          }
        }

        id v15 = 0;
      }
      __int16 v17 = -[IDSDSession _getURIFromParticipantIDNumber:](self, "_getURIFromParticipantIDNumber:", v14, v22);
      if (v17)
      {
        id v18 = objc_msgSend(objc_alloc((Class)IDSGroupSessionActiveParticipant), "initWithGroupUUID:participantIdentifier:isKnown:participantURI:pushToken:", v12, objc_msgSend(v14, "unsignedLongLongValue"), 1, v17, v15);
      }
      else
      {
        __int16 v19 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          id v25 = v14;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Couldn't get the URI from the QRAllocate response for participantID: %llu, create active participant with nil URI", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            uint64_t v23 = v14;
            _IDSLogTransport();
            if (_IDSShouldLog())
            {
              uint64_t v23 = v14;
              _IDSLogV();
            }
          }
        }
        id v18 = objc_msgSend(objc_alloc((Class)IDSGroupSessionActiveParticipant), "initWithGroupUUID:participantIdentifier:isKnown:participantURI:pushToken:", v12, objc_msgSend(v14, "unsignedLongLongValue"), 0, 0, 0);
      }
      int v20 = v18;
      objc_msgSend(v8, "addObject:", v18, v23);

      ++v13;
    }
    while ((unint64_t)[v6 count] > v13);
  }

  return v8;
}

- (void)getActiveParticipants:(id)a3 pushTokenForParticipants:(id)a4 isLightweightParticipant:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (_os_feature_enabled_impl())
  {
    id v10 = +[IDSDSessionActiveParticipantsCache sharedInstance];
    id v11 = +[NSSet setWithArray:v9];
    id v12 = [(IDSDSession *)self sharedState];
    unint64_t v13 = [v12 uniqueID];
    [v10 updateParticipants:v11 forSessionID:v13];
  }
  uint64_t v14 = [(IDSDSession *)self _createGroupSessionActiveParticipantsFromParticipants:v8 pushTokenForParticipants:v9];
  if (v14)
  {
    if (v5)
    {
      id v15 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v36 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "update active lightweight participants: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          long long v34 = v14;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            long long v34 = v14;
            _IDSLogV();
          }
        }
      }
      -[IDSDSession _updateActiveLightweightParticipants:](self, "_updateActiveLightweightParticipants:", v14, v34);
    }
    else
    {
      __int16 v17 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v36 = v14;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "update active participants: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          long long v34 = v14;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            long long v34 = v14;
            _IDSLogV();
          }
        }
      }
      -[IDSDSession _updateActiveParticipants:](self, "_updateActiveParticipants:", v14, v34);
    }
    id v18 = +[IDSGroupEncryptionController sharedInstance];
    __int16 v19 = [(IDSDSession *)self sharedState];
    int v20 = [v19 groupID];
    BOOL v21 = [v18 localParticipantIDForGroupID:v20] == 0;

    if (v21)
    {
      unint64_t v22 = [(IDSDSession *)self qrAllocator];
      uint64_t v23 = [(IDSDSession *)self sharedState];
      uint64_t v24 = [v23 uniqueID];
      id v25 = [v22 getLocalParticipantIDForRelaySessionID:v24];

      int v26 = +[IDSFoundationLog IDSDSession];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        dispatch_block_t v27 = [(IDSDSession *)self sharedState];
        long long v28 = [v27 groupID];
        *(_DWORD *)buf = 134218242;
        id v36 = v25;
        __int16 v37 = 2112;
        id v38 = v28;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "currentLocalParticipantID: %llu, groupID: %@", buf, 0x16u);
      }
      long long v29 = +[IDSGroupEncryptionController sharedInstance];
      long long v30 = [(IDSDSession *)self sharedState];
      long long v31 = [v30 groupID];
      long long v32 = [(IDSDSession *)self sharedState];
      long long v33 = [v32 uniqueID];
      [v29 setLocalParticipantID:v25 forGroupID:v31 sessionID:v33];
    }
  }
  else
  {
    id v16 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Failed to get URI from QR allocate response", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
  }
}

- (void)registerMultiplexerTransport
{
  id v3 = [(IDSDSession *)self sharedState];
  id v4 = [v3 uniqueID];

  BOOL v5 = [[IDSMultiplexerGroupSessionTransport alloc] initWithIdentifier:v4];
  multiplexerTransport = self->_multiplexerTransport;
  self->_multiplexerTransport = v5;

  id v7 = [v4 stringByAppendingString:@"fanout context"];
  id v8 = (const char *)[v7 UTF8String];

  id v9 = +[NSData dataWithBytes:v8 length:strlen(v8)];
  [(IDSMultiplexerGroupSessionTransport *)self->_multiplexerTransport setParticipantIDToAliasConverter:self];
  id v10 = [objc_alloc((Class)IDSGroupEncryptionKeyManager) initWithEncryptionContext:v9 encryptionKeySize:60];
  [(IDSMultiplexerGroupSessionTransport *)self->_multiplexerTransport setFanoutEncryptionManager:v10];

  id v11 = [(IDSDSession *)self utunController];
  id v12 = self->_multiplexerTransport;
  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  id v18 = sub_1000C93B0;
  __int16 v19 = &unk_100981728;
  id v20 = v11;
  id v21 = v4;
  id v13 = v4;
  id v14 = v11;
  [(IDSMultiplexerGroupSessionTransport *)v12 setPacketBufferReadHandler:&v16];
  id v15 = +[IDSGroupSessionMultiplexer sharedInstance];
  [v15 registerMultiplexerTransport:self->_multiplexerTransport];
}

- (void)reinitiate
{
  id v3 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(IDSDSession *)self sharedState];
    BOOL v5 = [v4 uniqueID];
    *(_DWORD *)buf = 138412290;
    id v60 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Reinitiate called for session %@", buf, 0xCu);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v6 = [(IDSDSession *)self sharedState];
      long long v53 = [v6 uniqueID];
      _IDSLogTransport();

      if (_IDSShouldLog())
      {
        id v7 = [(IDSDSession *)self sharedState];
        long long v53 = [v7 uniqueID];
        _IDSLogV();
      }
    }
  }
  id v8 = [(IDSDSession *)self sharedState];
  unsigned __int8 v9 = [v8 supportsReinitiate];

  if (v9)
  {
    id v10 = [(IDSDSession *)self sharedState];
    BOOL v11 = [v10 state] == 5;

    if (v11)
    {
      if ([(IDSDSession *)self isWithDefaultPairedDevice])
      {
        id v12 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          id v13 = [(IDSDSession *)self sharedState];
          id v14 = [v13 uniqueID];
          *(_DWORD *)buf = 138412290;
          id v60 = v14;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Session %@ reinitiate called, but this session is with the default paired device", buf, 0xCu);
        }
        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
        {
          id v15 = [(IDSDSession *)self sharedState];
          long long v55 = [v15 uniqueID];
          _IDSLogTransport();

          if (_IDSShouldLog())
          {
            id v16 = [(IDSDSession *)self sharedState];
            long long v56 = [v16 uniqueID];
            _IDSLogV();
          }
        }
      }
      else
      {
        id v44 = [(IDSDSession *)self sharedState];
        unsigned __int8 v45 = [v44 isInitiator];

        if (v45)
        {
          [(IDSDSession *)self _startReinitiateAsInitiator];
        }
        else
        {
          long long v46 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            long long v47 = [(IDSDSession *)self sharedState];
            long long v48 = [v47 uniqueID];
            *(_DWORD *)buf = 138412290;
            id v60 = v48;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Session %@ reinitiate: sending request for initiator to kick off reinitiate flow", buf, 0xCu);
          }
          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              dispatch_block_t v49 = [(IDSDSession *)self sharedState];
              long long v54 = [v49 uniqueID];
              _IDSLogTransport();

              if (_IDSShouldLog())
              {
                id v50 = [(IDSDSession *)self sharedState];
                long long v54 = [v50 uniqueID];
                _IDSLogV();
              }
            }
          }
          id v51 = [(IDSDSession *)self messenger];
          [v51 sendReinitiateMessageWithSubcommand:1];

          [(IDSDSession *)self submitAWDMetricsForIDSSessionReinitiateRequested];
          CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          [(__CFDictionary *)Mutable setObject:&off_1009D0F48 forKeyedSubscript:IDSDSessionReportTransportTypeKey];
          [(__CFDictionary *)Mutable setObject:&off_1009D0D68 forKeyedSubscript:IDSDSessionReportResultCodeKey];
          [(IDSDSession *)self addQREventForRTCReport:Mutable];
        }
      }
    }
    else
    {
      long long v33 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        long long v34 = [(IDSDSession *)self sharedState];
        long long v35 = [v34 uniqueID];
        id v36 = [(IDSDSession *)self sharedState];
        unsigned int v37 = [v36 state];
        *(_DWORD *)buf = 138412546;
        id v60 = v35;
        __int16 v61 = 1024;
        unsigned int v62 = v37;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Session %@ reinitiate called, but our current state is not connected (current state: %u)", buf, 0x12u);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          id v38 = [(IDSDSession *)self sharedState];
          id v39 = [v38 uniqueID];
          long long v40 = [(IDSDSession *)self sharedState];
          id v57 = [v40 state];
          _IDSLogTransport();

          if (_IDSShouldLog())
          {
            long long v41 = [(IDSDSession *)self sharedState];
            long long v42 = [v41 uniqueID];
            __int16 v43 = [(IDSDSession *)self sharedState];
            [v43 state];
            _IDSLogV();
          }
        }
      }
    }
  }
  else
  {
    uint64_t v17 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = [(IDSDSession *)self sharedState];
      __int16 v19 = [v18 uniqueID];
      id v20 = [(IDSDSession *)self sharedState];
      unsigned int v21 = [v20 enableQuickRelay];
      unint64_t v22 = [(IDSDSession *)self sharedState];
      unsigned int v23 = [v22 useQRDirectly];
      *(_DWORD *)buf = 138412802;
      id v60 = v19;
      __int16 v61 = 1024;
      unsigned int v62 = v21;
      __int16 v63 = 1024;
      unsigned int v64 = v23;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Session %@ reinitiate called, but we don't support reinitiate, enableQuickRelay: %d, useQRDirectly: %d", buf, 0x18u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        uint64_t v24 = [(IDSDSession *)self sharedState];
        id v25 = [v24 uniqueID];
        int v26 = [(IDSDSession *)self sharedState];
        id v27 = [v26 enableQuickRelay];
        long long v28 = [(IDSDSession *)self sharedState];
        uint64_t v58 = [v28 useQRDirectly];
        _IDSLogTransport();

        if (_IDSShouldLog())
        {
          long long v29 = [(IDSDSession *)self sharedState];
          long long v30 = [v29 uniqueID];
          long long v31 = [(IDSDSession *)self sharedState];
          [v31 enableQuickRelay];
          long long v32 = [(IDSDSession *)self sharedState];
          [v32 useQRDirectly];
          _IDSLogV();
        }
      }
    }
  }
}

- (void)_startReinitiateAsInitiator
{
  id v3 = [(IDSDSession *)self sharedState];
  [v3 setState:6];

  [(IDSDSession *)self submitAWDMetricsForIDSSessionReinitiateStarted];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  [(__CFDictionary *)Mutable setObject:&off_1009D0F60 forKeyedSubscript:IDSDSessionReportTransportTypeKey];
  [(__CFDictionary *)Mutable setObject:&off_1009D0D68 forKeyedSubscript:IDSDSessionReportResultCodeKey];
  [(IDSDSession *)self addQREventForRTCReport:Mutable];
  BOOL v5 = [(IDSDSession *)self sharedState];
  [v5 setEnableSKE:0];

  id v6 = [(IDSDSession *)self qrAllocator];
  id v7 = [(IDSDSession *)self sharedState];
  id v8 = [v7 uniqueID];
  [v6 invalidateSession:v8 isExpiryPurging:0];

  unsigned __int8 v9 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(IDSDSession *)self sharedState];
    BOOL v11 = [v10 uniqueID];
    *(_DWORD *)buf = 138412290;
    id v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Session %@ reinitiate: disconnecting global link", buf, 0xCu);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v12 = [(IDSDSession *)self sharedState];
      uint64_t v17 = [v12 uniqueID];
      _IDSLogTransport();

      if (_IDSShouldLog())
      {
        id v13 = [(IDSDSession *)self sharedState];
        uint64_t v17 = [v13 uniqueID];
        _IDSLogV();
      }
    }
  }
  id v14 = [(IDSDSession *)self utunController];
  id v15 = [(IDSDSession *)self sharedState];
  id v16 = [v15 uniqueID];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000CA1A4;
  v18[3] = &unk_100981208;
  v18[4] = self;
  [v14 disconnectGlobalLinkForDevice:v16 isReinitiating:1 completionHandler:v18];
}

- (void)receivedReinitiateMessage:(id)a3 fromURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKeyedSubscript:IDSDSessionMessageReinitiateSubcommand];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v8 integerValue];
    switch((unint64_t)v9)
    {
      case 1uLL:
        [(IDSDSession *)self _receivedReinitiateRequestMessage:v6 fromURI:v7];
        break;
      case 2uLL:
        [(IDSDSession *)self _receivedReinitiateTeardownMessage:v6 fromURI:v7];
        break;
      case 3uLL:
        [(IDSDSession *)self _receivedReinitiateTeardownAckMessage:v6 fromURI:v7];
        break;
      case 4uLL:
        [(IDSDSession *)self _receivedReinitiateBringupMessage:v6 fromURI:v7];
        break;
      case 5uLL:
        [(IDSDSession *)self _receivedReinitiateBringupAckMessage:v6 fromURI:v7];
        break;
      default:
        id v11 = v9;
        id v12 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          id v13 = +[NSNumber numberWithInteger:v11];
          id v14 = [(IDSDSession *)self sharedState];
          id v15 = [v14 uniqueID];
          *(_DWORD *)buf = 138412546;
          unsigned int v23 = v13;
          __int16 v24 = 2112;
          id v25 = v15;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unhandled reinitiate subcommand type %@ for session %@", buf, 0x16u);
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            id v16 = +[NSNumber numberWithInteger:v11];
            uint64_t v17 = [(IDSDSession *)self sharedState];
            id v20 = [v17 uniqueID];
            _IDSLogTransport();

            if (_IDSShouldLog())
            {
              id v18 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v11, v16, v20);
              __int16 v19 = [(IDSDSession *)self sharedState];
              unsigned int v21 = [v19 uniqueID];
              _IDSLogV();
            }
          }
        }
        break;
    }
  }
  else
  {
    id v10 = +[IDSFoundationLog IDSDSession];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_10070EAC4();
    }
  }
}

- (void)_receivedReinitiateRequestMessage:(id)a3 fromURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(IDSDSession *)self sharedState];
    id v10 = [v9 uniqueID];
    id v11 = [(IDSDSession *)self sharedState];
    unsigned int v12 = [v11 isInitiator];
    CFStringRef v13 = @"NO";
    *(_DWORD *)buf = 138412802;
    dispatch_block_t v49 = v10;
    __int16 v50 = 2112;
    if (v12) {
      CFStringRef v13 = @"YES";
    }
    id v51 = v6;
    __int16 v52 = 2112;
    CFStringRef v53 = v13;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Reinitiate request message received for session %@: %@, isInitiator: %@", buf, 0x20u);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    id v14 = [(IDSDSession *)self sharedState];
    id v15 = [v14 uniqueID];
    id v16 = [(IDSDSession *)self sharedState];
    uint64_t v17 = [v16 isInitiator] ? @"YES" : @"NO";
    id v45 = v6;
    long long v47 = v17;
    long long v42 = v15;
    _IDSLogTransport();

    if (_IDSShouldLog())
    {
      id v18 = [(IDSDSession *)self sharedState];
      __int16 v19 = [v18 uniqueID];
      id v20 = [(IDSDSession *)self sharedState];
      if ([v20 isInitiator]) {
        CFStringRef v21 = @"YES";
      }
      else {
        CFStringRef v21 = @"NO";
      }
      id v45 = v6;
      long long v47 = (__CFString *)v21;
      long long v42 = v19;
      _IDSLogV();
    }
  }
  unint64_t v22 = [(IDSDSession *)self sharedState];
  unsigned __int8 v23 = [v22 supportsReinitiate];

  if (v23)
  {
    __int16 v24 = [(IDSDSession *)self sharedState];
    BOOL v25 = [v24 state] == 5;

    if (v25)
    {
      [(IDSDSession *)self _startReinitiateAsInitiator];
    }
    else
    {
      long long v31 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        long long v32 = [(IDSDSession *)self sharedState];
        long long v33 = [v32 uniqueID];
        long long v34 = [(IDSDSession *)self sharedState];
        unsigned int v35 = [v34 state];
        *(_DWORD *)buf = 138412546;
        dispatch_block_t v49 = v33;
        __int16 v50 = 1024;
        LODWORD(v51) = v35;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Session %@ received reinitiate request message, but our current state is not connected (current state: %u)", buf, 0x12u);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          id v36 = [(IDSDSession *)self sharedState];
          unsigned int v37 = [v36 uniqueID];
          id v38 = [(IDSDSession *)self sharedState];
          id v46 = [v38 state];
          _IDSLogTransport();

          if (_IDSShouldLog())
          {
            id v39 = [(IDSDSession *)self sharedState];
            long long v40 = [v39 uniqueID];
            long long v41 = [(IDSDSession *)self sharedState];
            [v41 state];
            _IDSLogV();
          }
        }
      }
    }
  }
  else
  {
    int v26 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      id v27 = [(IDSDSession *)self sharedState];
      long long v28 = [v27 uniqueID];
      *(_DWORD *)buf = 138412290;
      dispatch_block_t v49 = v28;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Session %@ received reinitiate request message, but we don't support reinitiate", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        long long v29 = [(IDSDSession *)self sharedState];
        __int16 v43 = [v29 uniqueID];
        _IDSLogTransport();

        if (_IDSShouldLog())
        {
          long long v30 = [(IDSDSession *)self sharedState];
          id v44 = [v30 uniqueID];
          _IDSLogV();
        }
      }
    }
  }
}

- (void)_receivedReinitiateTeardownMessage:(id)a3 fromURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(IDSDSession *)self sharedState];
    id v10 = [v9 uniqueID];
    *(_DWORD *)buf = 138412546;
    long long v54 = v10;
    __int16 v55 = 2112;
    id v56 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Reinitiate teardown message received for session %@: %@", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v11 = [(IDSDSession *)self sharedState];
      id v46 = [v11 uniqueID];
      id v50 = v6;
      _IDSLogTransport();

      if (_IDSShouldLog())
      {
        unsigned int v12 = [(IDSDSession *)self sharedState];
        id v46 = [v12 uniqueID];
        id v50 = v6;
        _IDSLogV();
      }
    }
  }
  CFStringRef v13 = [(IDSDSession *)self sharedState];
  unsigned __int8 v14 = [v13 supportsReinitiate];

  if (v14)
  {
    id v15 = [(IDSDSession *)self sharedState];
    BOOL v16 = [v15 state] == 5;

    if (v16)
    {
      uint64_t v17 = [(IDSDSession *)self sharedState];
      [v17 setState:6];

      id v18 = [(IDSDSession *)self sharedState];
      [v18 setEnableSKE:0];

      __int16 v19 = [(IDSDSession *)self qrAllocator];
      id v20 = [(IDSDSession *)self sharedState];
      CFStringRef v21 = [v20 uniqueID];
      [v19 invalidateSession:v21 isExpiryPurging:0];

      unint64_t v22 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        unsigned __int8 v23 = [(IDSDSession *)self sharedState];
        __int16 v24 = [v23 uniqueID];
        *(_DWORD *)buf = 138412290;
        long long v54 = v24;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Session %@ reinitiate teardown: disconnecting global link", buf, 0xCu);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          BOOL v25 = [(IDSDSession *)self sharedState];
          long long v47 = [v25 uniqueID];
          _IDSLogTransport();

          if (_IDSShouldLog())
          {
            int v26 = [(IDSDSession *)self sharedState];
            long long v47 = [v26 uniqueID];
            _IDSLogV();
          }
        }
      }
      id v27 = [(IDSDSession *)self utunController];
      long long v28 = [(IDSDSession *)self sharedState];
      long long v29 = [v28 uniqueID];
      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472;
      v52[2] = sub_1000CB39C;
      v52[3] = &unk_100981208;
      v52[4] = self;
      [v27 disconnectGlobalLinkForDevice:v29 isReinitiating:1 completionHandler:v52];
    }
    else
    {
      unsigned int v35 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        id v36 = [(IDSDSession *)self sharedState];
        unsigned int v37 = [v36 uniqueID];
        id v38 = [(IDSDSession *)self sharedState];
        unsigned int v39 = [v38 state];
        *(_DWORD *)buf = 138412546;
        long long v54 = v37;
        __int16 v55 = 1024;
        LODWORD(v56) = v39;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Session %@ received reinitiate teardown message, but our current state is not connected (current state: %u)", buf, 0x12u);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          long long v40 = [(IDSDSession *)self sharedState];
          long long v41 = [v40 uniqueID];
          long long v42 = [(IDSDSession *)self sharedState];
          id v51 = [v42 state];
          _IDSLogTransport();

          if (_IDSShouldLog())
          {
            __int16 v43 = [(IDSDSession *)self sharedState];
            id v44 = [v43 uniqueID];
            id v45 = [(IDSDSession *)self sharedState];
            [v45 state];
            _IDSLogV();
          }
        }
      }
    }
  }
  else
  {
    long long v30 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      long long v31 = [(IDSDSession *)self sharedState];
      long long v32 = [v31 uniqueID];
      *(_DWORD *)buf = 138412290;
      long long v54 = v32;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Session %@ received reinitiate teardown message, but we don't support reinitiate", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        long long v33 = [(IDSDSession *)self sharedState];
        long long v48 = [v33 uniqueID];
        _IDSLogTransport();

        if (_IDSShouldLog())
        {
          long long v34 = [(IDSDSession *)self sharedState];
          dispatch_block_t v49 = [v34 uniqueID];
          _IDSLogV();
        }
      }
    }
  }
}

- (void)_receivedReinitiateTeardownAckMessage:(id)a3 fromURI:(id)a4
{
  id v66 = a3;
  id v65 = a4;
  BOOL v5 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(IDSDSession *)self sharedState];
    id v7 = [v6 uniqueID];
    *(_DWORD *)buf = 138412546;
    __int16 v69 = v7;
    __int16 v70 = 2112;
    id v71 = v66;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Reinitiate teardown ack message received for session %@: %@", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v8 = [(IDSDSession *)self sharedState];
      dispatch_block_t v49 = [v8 uniqueID];
      id v51 = v66;
      _IDSLogTransport();

      if (_IDSShouldLog())
      {
        id v9 = [(IDSDSession *)self sharedState];
        dispatch_block_t v49 = [v9 uniqueID];
        id v51 = v66;
        _IDSLogV();
      }
    }
  }
  id v10 = [(IDSDSession *)self sharedState];
  BOOL v11 = [v10 state] == 6;

  if (v11)
  {
    unsigned int v12 = [(IDSDSession *)self sharedState];
    unsigned int v13 = [v12 sharedSession];

    unsigned __int8 v14 = [(IDSDSession *)self sharedState];
    id v15 = v14;
    if (v13)
    {
      CFDictionaryRef theDict = [v14 getQuickRelayAllocateOptions:&off_1009D0D98];

      BOOL v16 = [(IDSDSession *)self sharedState];
      uint64_t v17 = [v16 groupID];

      if (v17)
      {
        CFDictionarySetValue(theDict, kIDSQRAllocateKey_GroupID, v17);
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_10070E5C4();
      }

      id v29 = IDSGroupSessionForceQRSession;
      if (v29)
      {
        CFDictionarySetValue(theDict, kIDSQRAllocateKey_TestOptions, v29);
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_10070E720();
      }

      long long v28 = self;
      self->_shouldConnectToQRServer = 1;
    }
    else
    {
      CFDictionaryRef theDict = [v14 getQuickRelayAllocateOptions:&off_1009D0D38];

      long long v28 = self;
    }
    long long v30 = [(IDSDSession *)v28 qrAllocator];
    long long v31 = [(IDSDSession *)self sharedState];
    long long v32 = [v31 uniqueID];
    [v30 clearResponseFromQRGroupID:v32];

    long long v33 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      long long v34 = [(IDSDSession *)self sharedState];
      unsigned int v35 = [v34 uniqueID];
      *(_DWORD *)buf = 138412290;
      __int16 v69 = v35;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Session %@ reinitiate: setting up new QR allocation", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        id v36 = [(IDSDSession *)self sharedState];
        id v50 = [v36 uniqueID];
        _IDSLogTransport();

        if (_IDSShouldLog())
        {
          unsigned int v37 = [(IDSDSession *)self sharedState];
          id v50 = [v37 uniqueID];
          _IDSLogV();
        }
      }
    }
    id v56 = [(IDSDSession *)self qrAllocator];
    __int16 v63 = [(IDSDSession *)self sharedState];
    unsigned int v62 = [v63 destinations];
    __int16 v55 = [v62 allObjects];
    __int16 v61 = [(IDSDSession *)self sharedState];
    long long v54 = [v61 uniqueID];
    id v59 = +[IDSDAccountController sharedInstance];
    id v60 = [(IDSDSession *)self sharedState];
    uint64_t v58 = [v60 accountID];
    id v57 = [v59 accountWithUniqueID:v58];
    CFStringRef v53 = [v57 _registrationCert];
    id v38 = [(IDSDSession *)self sharedState];
    unsigned int v39 = [v38 fromURI];
    long long v40 = [v39 unprefixedURI];
    long long v41 = [v40 _bestGuessURI];
    long long v42 = +[IDSDAccountController sharedInstance];
    __int16 v43 = [(IDSDSession *)self sharedState];
    id v44 = [v43 accountID];
    id v45 = [v42 accountWithUniqueID:v44];
    id v46 = [v45 service];
    long long v47 = [v46 identifier];
    id v48 = [v56 setupNewAllocation:v55 sessionID:v54 fromIdentity:v53 fromURI:v41 fromService:v47 options:theDict connectReadyHandler:0];

    int v26 = [(IDSDSession *)self messenger];
    [v26 sendReinitiateMessageWithSubcommand:4];
    goto LABEL_32;
  }
  id v18 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v19 = [(IDSDSession *)self sharedState];
    id v20 = [v19 uniqueID];
    CFStringRef v21 = [(IDSDSession *)self sharedState];
    unsigned int v22 = [v21 state];
    *(_DWORD *)buf = 138412546;
    __int16 v69 = v20;
    __int16 v70 = 1024;
    LODWORD(v71) = v22;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Session %@ received reinitiate teardown ack message, but our current state is not reinitiating (current state: %u)", buf, 0x12u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      unsigned __int8 v23 = [(IDSDSession *)self sharedState];
      __int16 v24 = [v23 uniqueID];
      BOOL v25 = [(IDSDSession *)self sharedState];
      id v52 = [v25 state];
      _IDSLogTransport();

      if (_IDSShouldLog())
      {
        CFDictionaryRef theDict = [(IDSDSession *)self sharedState];
        int v26 = [(__CFDictionary *)theDict uniqueID];
        id v27 = [(IDSDSession *)self sharedState];
        [v27 state];
        _IDSLogV();

LABEL_32:
      }
    }
  }
}

- (void)_receivedReinitiateBringupMessage:(id)a3 fromURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(IDSDSession *)self sharedState];
    id v10 = [v9 uniqueID];
    *(_DWORD *)buf = 138412546;
    long long v40 = v10;
    __int16 v41 = 2112;
    id v42 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Reinitiate bringup message received for session %@: %@", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      BOOL v11 = [(IDSDSession *)self sharedState];
      unsigned int v35 = [v11 uniqueID];
      id v37 = v6;
      _IDSLogTransport();

      if (_IDSShouldLog())
      {
        unsigned int v12 = [(IDSDSession *)self sharedState];
        unsigned int v35 = [v12 uniqueID];
        id v37 = v6;
        _IDSLogV();
      }
    }
  }
  unsigned int v13 = [(IDSDSession *)self sharedState];
  BOOL v14 = [v13 state] == 6;

  if (v14)
  {
    id v15 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v16 = [(IDSDSession *)self sharedState];
      uint64_t v17 = [v16 uniqueID];
      *(_DWORD *)buf = 138412290;
      long long v40 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Session %@ reinitiate bringup: requesting allocation for recipient", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        id v18 = [(IDSDSession *)self sharedState];
        id v36 = [v18 uniqueID];
        _IDSLogTransport();

        if (_IDSShouldLog())
        {
          __int16 v19 = [(IDSDSession *)self sharedState];
          id v36 = [v19 uniqueID];
          _IDSLogV();
        }
      }
    }
    id v20 = [(IDSDSession *)self qrAllocator];
    CFStringRef v21 = [(IDSDSession *)self sharedState];
    unsigned int v22 = [v21 uniqueID];
    [v20 requestAllocationForRecipient:v22];

    unsigned __int8 v23 = [(IDSDSession *)self sharedState];
    [v23 setState:5];

    __int16 v24 = [(IDSDSession *)self messenger];
    [v24 sendReinitiateMessageWithSubcommand:5];
    goto LABEL_15;
  }
  BOOL v25 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = [(IDSDSession *)self sharedState];
    id v27 = [v26 uniqueID];
    long long v28 = [(IDSDSession *)self sharedState];
    unsigned int v29 = [v28 state];
    *(_DWORD *)buf = 138412546;
    long long v40 = v27;
    __int16 v41 = 1024;
    LODWORD(v42) = v29;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Session %@ received reinitiate bringup message, but our current state is not reintiating (current state: %u)", buf, 0x12u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      long long v30 = [(IDSDSession *)self sharedState];
      long long v31 = [v30 uniqueID];
      long long v32 = [(IDSDSession *)self sharedState];
      id v38 = [v32 state];
      _IDSLogTransport();

      if (_IDSShouldLog())
      {
        __int16 v24 = [(IDSDSession *)self sharedState];
        long long v33 = [v24 uniqueID];
        long long v34 = [(IDSDSession *)self sharedState];
        [v34 state];
        _IDSLogV();

LABEL_15:
      }
    }
  }
}

- (void)_receivedReinitiateBringupAckMessage:(id)a3 fromURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(IDSDSession *)self sharedState];
    id v10 = [v9 uniqueID];
    *(_DWORD *)buf = 138412546;
    long long v47 = v10;
    __int16 v48 = 2112;
    id v49 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Reinitiate bringup ack message received for session %@: %@", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      BOOL v11 = [(IDSDSession *)self sharedState];
      id v42 = [v11 uniqueID];
      id v44 = v6;
      _IDSLogTransport();

      if (_IDSShouldLog())
      {
        unsigned int v12 = [(IDSDSession *)self sharedState];
        id v42 = [v12 uniqueID];
        id v44 = v6;
        _IDSLogV();
      }
    }
  }
  unsigned int v13 = [(IDSDSession *)self sharedState];
  BOOL v14 = [v13 state] == 6;

  if (v14)
  {
    id v15 = [(IDSDSession *)self sharedState];
    unsigned __int8 v16 = [v15 sharedSession];

    if ((v16 & 1) == 0)
    {
      uint64_t v17 = [v7 pushToken];
      id v18 = [(IDSDSession *)self qrAllocator];
      __int16 v19 = [(IDSDSession *)self sharedState];
      id v20 = [v19 uniqueID];
      CFStringRef v21 = [v17 rawToken];
      unsigned int v22 = [v18 getRelaySessionIDForIDSSessionID:v20 pushToken:v21];

      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      __int16 v24 = [(IDSDSession *)self sharedState];
      BOOL v25 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v24 useSecureQRControlMessage]);

      if (v25)
      {
        CFDictionarySetValue(Mutable, IDSGlobalLinkOptionUseSecureControlMessageKey, v25);
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_10070EB38();
      }

      id v37 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v47 = v22;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Reinitiate accepted relay-session-id %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          __int16 v43 = v22;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            __int16 v43 = v22;
            _IDSLogV();
          }
        }
      }
      id v38 = [(IDSDSession *)self utunController];
      unsigned int v39 = [(IDSDSession *)self sharedState];
      long long v40 = [v39 uniqueID];
      [v38 setAcceptedRelaySession:v40 relaySessionID:v22 options:Mutable];
    }
    __int16 v41 = [(IDSDSession *)self sharedState];
    [v41 setState:5];

    [(IDSDSession *)self submitAWDMetricsForIDSSessionReinitiateConnected];
    long long v34 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    [v34 setObject:&off_1009D0F78 forKeyedSubscript:IDSDSessionReportTransportTypeKey];
    [v34 setObject:&off_1009D0D68 forKeyedSubscript:IDSDSessionReportResultCodeKey];
    [(IDSDSession *)self addQREventForRTCReport:v34];
    goto LABEL_27;
  }
  int v26 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    id v27 = [(IDSDSession *)self sharedState];
    long long v28 = [v27 uniqueID];
    unsigned int v29 = [(IDSDSession *)self sharedState];
    unsigned int v30 = [v29 state];
    *(_DWORD *)buf = 138412546;
    long long v47 = v28;
    __int16 v48 = 1024;
    LODWORD(v49) = v30;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Session %@ received reinitiate bringup ack message, but our current state is not reintiating (current state: %u)", buf, 0x12u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      long long v31 = [(IDSDSession *)self sharedState];
      long long v32 = [v31 uniqueID];
      long long v33 = [(IDSDSession *)self sharedState];
      id v45 = [v33 state];
      _IDSLogTransport();

      if (_IDSShouldLog())
      {
        long long v34 = [(IDSDSession *)self sharedState];
        unsigned int v35 = [v34 uniqueID];
        id v36 = [(IDSDSession *)self sharedState];
        [v36 state];
        _IDSLogV();

LABEL_27:
      }
    }
  }
}

- (void)didSessionReinitiated
{
  id v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "<%@> IDSDSession didSessionReinitiated", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    BOOL v11 = self;
    _IDSLogV();
  }
  id v4 = [(IDSDSession *)self sharedState];
  if ([v4 useQRDirectly]) {
    goto LABEL_11;
  }
  BOOL v5 = [(IDSDSession *)self sharedState];
  if ([v5 clientType] == (id)1)
  {
LABEL_10:

LABEL_11:
LABEL_12:
    unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v7;
    long long v13 = v7;
    IDSByteBufferInitForWrite();
    IDSByteBufferWriteField();
    -[IDSDSession writeToClientChannel:packetBuffer:metaData:metadataSize:](self, "writeToClientChannel:packetBuffer:metaData:metadataSize:", self->_clientChannel, 0);
    IDSByteBufferRelease();
    return;
  }
  id v6 = [(IDSDSession *)self sharedState];
  if ([v6 clientType] == (id)5)
  {

    goto LABEL_10;
  }
  id v8 = [(IDSDSession *)self sharedState];
  BOOL v9 = [v8 clientType] == (id)6;

  if (v9) {
    goto LABEL_12;
  }
  id v10 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = self;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<%@> need a client channel to send the event kClientChannelMetadataType_SessionReinitiated", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

- (BOOL)isWithDefaultPairedDevice
{
  id v3 = [(IDSDSession *)self sharedState];
  id v4 = [v3 destinations];
  BOOL v5 = [v4 allObjects];
  id v6 = [v5 lastObject];

  long long v7 = [(IDSDSession *)self sharedState];
  LOBYTE(v3) = [v7 destinationIsDefaultPairedDevice:v6];

  return (char)v3;
}

- (void)invitationDeclined
{
  id v2 = [(IDSDSession *)self invitationManager];
  [v2 sendCancelInvitationToDestinations:0 remoteEndReason:30 data:0];
}

- (void)sendCancelInvitationMessage
{
  id v2 = [(IDSDSession *)self invitationManager];
  [v2 sendCancelInvitationToDestinations:0 remoteEndReason:0 data:0];
}

- (void)sendInvitationWithOptions:(id)a3 declineOnError:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(IDSDSession *)self invitationManager];
  [v7 sendInvitationWithOptions:v6 declineOnError:v4];
}

- (void)sendInvitationWithData:(id)a3 declineOnError:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(IDSDSession *)self invitationManager];
  [v7 sendInvitationWithData:v6 declineOnError:v4];
}

- (void)cancelInvitation
{
  id v2 = [(IDSDSession *)self invitationManager];
  [v2 cancelInvitation];
}

- (void)cancelInvitationWithData:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSDSession *)self invitationManager];
  [v5 cancelInvitationWithData:v4];
}

- (void)cancelInvitationWithRemoteEndedReasonOverride:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(IDSDSession *)self invitationManager];
  [v4 cancelInvitationWithRemoteEndedReasonOverride:v3];
}

- (void)acceptInvitation
{
  id v2 = [(IDSDSession *)self invitationManager];
  [v2 acceptInvitation];
}

- (void)acceptInvitationWithData:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSDSession *)self invitationManager];
  [v5 acceptInvitationWithData:v4];
}

- (void)declineInvitation
{
  id v2 = [(IDSDSession *)self invitationManager];
  [v2 declineInvitation];
}

- (void)declineInvitationWithData:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSDSession *)self invitationManager];
  [v5 declineInvitationWithData:v4];
}

- (void)declineInvitationWithData:(id)a3 forceFromURI:(id)a4 additionalMessageAttributes:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(IDSDSession *)self invitationManager];
  [v11 declineInvitationWithData:v10 forceFromURI:v9 additionalMessageAttributes:v8];
}

- (void)sendSessionMessage:(id)a3 toDestinations:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(IDSDSession *)self messenger];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000CD220;
  v10[3] = &unk_10097E990;
  v10[4] = self;
  id v9 = objc_msgSend(v6, "__imSetByApplyingBlock:", v10);

  [v8 sendSessionMessage:v7 toDestinations:v9];
}

- (void)receivedAcceptMessage:(id)a3 fromURI:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(IDSDSession *)self invitationManager];
  [v8 receivedAcceptMessage:v7 fromURI:v6];
}

- (void)receivedDeclineMessage:(id)a3 fromURI:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(IDSDSession *)self invitationManager];
  [v8 receivedDeclineMessage:v7 fromURI:v6];
}

- (void)receivedCancelMessage:(id)a3 fromURI:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(IDSDSession *)self invitationManager];
  [v8 receivedCancelMessage:v7 fromURI:v6];
}

- (void)receivedSessionMessage:(id)a3 fromURI:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(IDSDSession *)self messenger];
  [v8 receivedSessionMessage:v7 fromURI:v6];
}

- (void)receivedEndMessage:(id)a3 fromURI:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(IDSDSession *)self messenger];
  [v8 receivedEndMessage:v7 fromURI:v6];
}

- (void)setRemoteBlob:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSDSession *)self invitationManager];
  [v5 setRemoteBlob:v4];
}

- (void)setInviteTimeout:(int64_t)a3
{
  double v3 = (double)a3;
  id v4 = [(IDSDSession *)self sharedState];
  [v4 setInviteTimeout:v3];
}

- (void)setQuickRelaySessionToken:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSDSession *)self invitationManager];
  [v5 setQuickRelaySessionToken:v4];
}

- (void)setRemoteUseCloudPairedControlChannel:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSDSession *)self sharedState];
  [v5 setRemoteUseCloudPairedControlChannel:v4];
}

- (void)setRemoteUsePhoneContinuityLocalMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSDSession *)self sharedState];
  [v5 setRemoteUseCloudPairedControlChannel:v4];
}

- (void)setSSRCRecv:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(IDSDSession *)self invitationManager];
  [v4 setSSRCRecv:v3];
}

- (void)setSeqRecvStart:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(IDSDSession *)self invitationManager];
  [v4 setSeqRecvStart:v3];
}

- (IDSDGroupStatusNotificationController)groupStatusNotificationController
{
  groupStatusNotificationController = self->_groupStatusNotificationController;
  if (groupStatusNotificationController)
  {
    uint64_t v3 = groupStatusNotificationController;
  }
  else
  {
    uint64_t v3 = +[IDSDGroupStatusNotificationController sharedInstance];
  }

  return v3;
}

- (NSSet)destinations
{
  id v2 = [(IDSDSession *)self sharedState];
  uint64_t v3 = [v2 destinations];

  return (NSSet *)v3;
}

- (id)destinationsLightweightStatus
{
  id v2 = [(IDSDSession *)self sharedState];
  uint64_t v3 = [v2 destinationsLightweightStatus];

  return v3;
}

- (id)uniqueID
{
  id v2 = [(IDSDSession *)self sharedState];
  uint64_t v3 = [v2 uniqueID];

  return v3;
}

- (BOOL)isInitiator
{
  id v2 = [(IDSDSession *)self sharedState];
  unsigned __int8 v3 = [v2 isInitiator];

  return v3;
}

- (BOOL)enableQuickRelay
{
  id v2 = [(IDSDSession *)self sharedState];
  unsigned __int8 v3 = [v2 enableQuickRelay];

  return v3;
}

- (int64_t)clientType
{
  id v2 = [(IDSDSession *)self sharedState];
  id v3 = [v2 clientType];

  return (int64_t)v3;
}

- (id)participantID
{
  id v2 = [(IDSDSession *)self sharedState];
  id v3 = [v2 participantID];

  return v3;
}

- (id)accountID
{
  id v2 = [(IDSDSession *)self sharedState];
  id v3 = [v2 accountID];

  return v3;
}

- (id)groupID
{
  id v2 = [(IDSDSession *)self sharedState];
  id v3 = [v2 groupID];

  return v3;
}

- (id)fromURI
{
  id v2 = [(IDSDSession *)self sharedState];
  id v3 = [v2 fromURI];

  return v3;
}

- (id)clientChannelUUID
{
  return self->_clientChannelUUID;
}

- (unsigned)state
{
  id v2 = [(IDSDSession *)self sharedState];
  unsigned int v3 = [v2 state];

  return v3;
}

- (BOOL)isScreenSharingSession
{
  id v2 = [(IDSDSession *)self sharedState];
  unsigned __int8 v3 = [v2 isScreenSharingSession];

  return v3;
}

- (BOOL)isLightweightParticipant
{
  return self->_isLightweightParticipant;
}

- (void)_setClientType:(int64_t)a3
{
  id v4 = [(IDSDSession *)self sharedState];
  [v4 setClientType:a3];
}

- (BOOL)_useBTDatagramPipe
{
  id v2 = [(IDSDSession *)self sharedState];
  unsigned __int8 v3 = [v2 useBTDatagramPipe];

  return v3;
}

- (unint64_t)connectionCountHint
{
  id v2 = [(IDSDSession *)self sharedState];
  id v3 = [v2 connectionCountHint];

  return (unint64_t)v3;
}

- (NSArray)requiredCapabilities
{
  id v2 = [(IDSDSession *)self sharedState];
  id v3 = [v2 requiredCapabilities];

  return (NSArray *)v3;
}

- (NSArray)requiredLackOfCapabilities
{
  id v2 = [(IDSDSession *)self sharedState];
  id v3 = [v2 requiredLackOfCapabilities];

  return (NSArray *)v3;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void)setClientID:(id)a3
{
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
}

- (BOOL)disallowCellularInterface
{
  return self->_disallowCellularInterface;
}

- (BOOL)disallowWifiInterface
{
  return self->_disallowWifiInterface;
}

- (unsigned)groupSessionState
{
  return self->_groupSessionState;
}

- (NSString)instanceID
{
  return self->_instanceID;
}

- (IDSDSessionInvitationManager)invitationManager
{
  return self->_invitationManager;
}

- (void)setInvitationManager:(id)a3
{
}

- (IDSDSessionMessenger)messenger
{
  return self->_messenger;
}

- (void)setMessenger:(id)a3
{
}

- (NSNumber)qrError
{
  return self->_qrError;
}

- (void)setQrError:(id)a3
{
}

- (NSNumber)qrReason
{
  return self->_qrReason;
}

- (void)setQrReason:(id)a3
{
}

- (BOOL)shouldConnectToQRServer
{
  return self->_shouldConnectToQRServer;
}

- (void)setShouldConnectToQRServer:(BOOL)a3
{
  self->_shouldConnectToQRServer = a3;
}

- (BOOL)sharedSessionHasJoined
{
  return self->_sharedSessionHasJoined;
}

- (void)setSharedSessionHasJoined:(BOOL)a3
{
  self->_BOOL sharedSessionHasJoined = a3;
}

- (NSData)encryptedDataBlob
{
  return self->_encryptedDataBlob;
}

- (NSData)encryptedMirageHandshakeBlob
{
  return self->_encryptedMirageHandshakeBlob;
}

- (IDSGFTMetricsCollector)metricsCollector
{
  return self->_metricsCollector;
}

- (BOOL)handOffOverQREnabled
{
  return self->_handOffOverQREnabled;
}

- (IDSDSessionSharedState)sharedState
{
  return self->_sharedState;
}

- (void)setSharedState:(id)a3
{
}

- (void)setGroupStatusNotificationController:(id)a3
{
}

- (NSSet)serverDesiredMaterials
{
  return (NSSet *)objc_getProperty(self, a2, 920, 1);
}

- (IDSDAccountController)accountController
{
  return self->_accountController;
}

- (void)setAccountController:(id)a3
{
}

- (IDSUTunController)utunController
{
  return self->_utunController;
}

- (void)setUtunController:(id)a3
{
}

- (IDSQuickRelayAllocator)qrAllocator
{
  return self->_qrAllocator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qrAllocator, 0);
  objc_storeStrong((id *)&self->_utunController, 0);
  objc_storeStrong((id *)&self->_accountController, 0);
  objc_storeStrong((id *)&self->_serverDesiredMaterials, 0);
  objc_storeStrong((id *)&self->_groupStatusNotificationController, 0);
  objc_storeStrong((id *)&self->_sharedState, 0);
  objc_storeStrong((id *)&self->_metricsCollector, 0);
  objc_storeStrong((id *)&self->_messenger, 0);
  objc_storeStrong((id *)&self->_invitationManager, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_keyValueDelivery, 0);
  objc_storeStrong((id *)&self->_exchangeController, 0);
  objc_storeStrong((id *)&self->_groupSession, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong(&self->_reliableUnicastRegistrationCompletionBlock, 0);
  objc_storeStrong((id *)&self->_participantIDToRemoteParticipantContext, 0);
  objc_storeStrong((id *)&self->_participantIDToURI, 0);
  objc_storeStrong((id *)&self->_participantIDToPushToken, 0);
  objc_storeStrong((id *)&self->_pendingMaterialInfoByFromID, 0);
  objc_storeStrong((id *)&self->_encryptedMirageHandshakeBlob, 0);
  objc_storeStrong((id *)&self->_encryptedDataBlob, 0);
  objc_storeStrong(&self->_serverDesiredKeyMaterialsSigner, 0);
  objc_storeStrong((id *)&self->_serverDesiredKeyMaterialsFromGroupEncryptionController, 0);
  objc_storeStrong((id *)&self->_linkIDToLocalRemoteEndpointPair, 0);
  objc_storeStrong((id *)&self->_keyIDToParticipantID, 0);
  objc_storeStrong((id *)&self->_typeToParticipantIDToDecryptedDataBlob, 0);
  objc_storeStrong((id *)&self->_typeToKeyIDToEncryptedData, 0);
  objc_storeStrong((id *)&self->_callType, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_cryptorForBlobs, 0);
  objc_storeStrong((id *)&self->_dataBlobEncryptionManager, 0);
  objc_storeStrong((id *)&self->_multiplexerTransport, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_skeData, 0);
  objc_storeStrong((id *)&self->_sessionInfoMetaData, 0);
  objc_storeStrong((id *)&self->_qrReason, 0);
  objc_storeStrong((id *)&self->_qrEventsForRTCReports, 0);
  objc_storeStrong((id *)&self->_qrError, 0);
  objc_storeStrong((id *)&self->_ctClient, 0);
  objc_storeStrong((id *)&self->_cellularNetworkInterfaceBringupTime, 0);
  objc_storeStrong((id *)&self->_cellularNetworkInfoSessionEvent, 0);
  objc_storeStrong((id *)&self->_networkSlicingReportingQueue, 0);
  objc_storeStrong(&self->_joinNotificationDeliveryTimeoutBlock, 0);
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_storeStrong((id *)&self->_groupStatusNotificationParams, 0);
  objc_storeStrong((id *)&self->_participantIDToTypeToEncryptedIDSContextBlobs, 0);
  objc_storeStrong((id *)&self->_participantIDToAVCBlob, 0);
  objc_storeStrong((id *)&self->_extraConnections, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_genCounterUpdatedByResponseTime, 0);
  objc_storeStrong((id *)&self->_connectionContext, 0);
  objc_storeStrong((id *)&self->_clientChannelUUID, 0);
  objc_storeStrong((id *)&self->_clientChannel, 0);
  objc_storeStrong((id *)&self->_cachedClientData, 0);
  objc_storeStrong((id *)&self->_baseSocketPairConnection, 0);
  objc_storeStrong((id *)&self->_awdUniqueId, 0);
  objc_storeStrong((id *)&self->_awdStartTimestamp, 0);

  objc_storeStrong((id *)&self->_availabilityCheck, 0);
}

- (BOOL)_shouldSubmitMetricsForThisSession
{
  awdStartTimestamp = self->_awdStartTimestamp;
  if (!awdStartTimestamp)
  {
    id v4 = +[NSDate date];
    id v5 = self->_awdStartTimestamp;
    self->_awdStartTimestamp = v4;

    awdStartTimestamp = self->_awdStartTimestamp;
  }
  id v6 = [(IDSDSession *)self sharedState];
  BOOL v7 = -[IDSDSession _shouldSubmitMetricsBasedOnDate:isInitiator:](self, "_shouldSubmitMetricsBasedOnDate:isInitiator:", awdStartTimestamp, [v6 isInitiator]);

  return v7;
}

- (BOOL)_shouldSubmitMetricsBasedOnDate:(id)a3 isInitiator:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  id v7 = [objc_alloc((Class)NSTimeZone) initWithName:@"GMT"];
  [v6 setTimeZone:v7];
  id v8 = [v6 components:112 fromDate:v5];

  unint64_t v9 = (unint64_t)[v8 day];
  id v10 = [v8 hour];
  uint64_t v11 = (uint64_t)[v8 minute];
  if (v10 == (id)23 && v11 > 54)
  {
    BOOL v12 = 0;
  }
  else
  {
    BOOL v13 = (v9 & 1) == 0;
    if (v4) {
      BOOL v13 = (v9 & 0x8000000000000001) == 1;
    }
    if (v10) {
      BOOL v14 = 0;
    }
    else {
      BOOL v14 = v11 < 6;
    }
    BOOL v12 = !v14 && v13;
  }

  return v12;
}

- (void)submitAWDMetricsForIDSSessionStarted
{
  if ([(IDSDSession *)self _shouldSubmitMetricsForThisSession])
  {
    id v3 = objc_alloc((Class)IDSSessionStartedMetric);
    awdUniqueId = self->_awdUniqueId;
    id v5 = [(IDSDSession *)self sharedState];
    id v6 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v5 peerProtocolVersion]);
    id v7 = [(IDSDSession *)self sharedState];
    id v8 = [v7 serviceName];
    unint64_t v9 = [(IDSDSession *)self sharedState];
    id v18 = objc_msgSend(v3, "initWithGuid:protocolVersionNumber:serviceName:clientType:", awdUniqueId, v6, v8, objc_msgSend(v9, "clientType"));

    id v10 = +[IDSCoreAnalyticsLogger defaultLogger];
    [v10 logMetric:v18];

    uint64_t v11 = +[IDSAWDLogging sharedInstance];
    BOOL v12 = self->_awdUniqueId;
    BOOL v13 = [(IDSDSession *)self sharedState];
    BOOL v14 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v13 peerProtocolVersion]);
    id v15 = [(IDSDSession *)self sharedState];
    unsigned __int8 v16 = [v15 serviceName];
    uint64_t v17 = [(IDSDSession *)self sharedState];
    objc_msgSend(v11, "sessionStartedWithAWDGUID:protocolVersionNumber:serviceName:clientType:", v12, v14, v16, objc_msgSend(v17, "clientType"));
  }
}

- (void)submitAWDMetricsForIDSSessionInvitationSentWithNumberOfRecipients:(id)a3
{
  id v7 = a3;
  if ([(IDSDSession *)self _shouldSubmitMetricsForThisSession])
  {
    id v4 = [objc_alloc((Class)IDSSessionInvitationSentMetric) initWithGuid:self->_awdUniqueId numberOfRecipients:v7];
    id v5 = +[IDSCoreAnalyticsLogger defaultLogger];
    [v5 logMetric:v4];

    id v6 = +[IDSAWDLogging sharedInstance];
    [v6 sessionInvitationSentWithAWDGUID:self->_awdUniqueId numberOfRecipients:v7];
  }
}

- (void)submitAWDMetricsForIDSSessionInvitationReceived
{
  if ([(IDSDSession *)self _shouldSubmitMetricsForThisSession])
  {
    id v5 = [objc_alloc((Class)IDSSessionInvitationReceivedMetric) initWithGuid:self->_awdUniqueId];
    id v3 = +[IDSCoreAnalyticsLogger defaultLogger];
    [v3 logMetric:v5];

    id v4 = +[IDSAWDLogging sharedInstance];
    [v4 sessionInvitationReceivedWithAWDGUID:self->_awdUniqueId];
  }
}

- (void)submitAWDMetricsForIDSSessionCancelSentWithRemoteEndReason:(unsigned int)a3 numberOfRecipients:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v9 = a4;
  if ([(IDSDSession *)self _shouldSubmitMetricsForThisSession])
  {
    id v6 = [objc_alloc((Class)IDSSessionCancelSentMetric) initWithGuid:self->_awdUniqueId numberOfRecipients:v9 remoteSessionEndReason:v4];
    id v7 = +[IDSCoreAnalyticsLogger defaultLogger];
    [v7 logMetric:v6];

    id v8 = +[IDSAWDLogging sharedInstance];
    [v8 sessionCancelSentWithAWDGUID:self->_awdUniqueId numberOfRecipients:v9 remoteSessionEndReason:v4];
  }
}

- (void)submitAWDMetricsForIDSSessionCancelReceived
{
  if ([(IDSDSession *)self _shouldSubmitMetricsForThisSession])
  {
    id v5 = [objc_alloc((Class)IDSSessionCanceledMetric) initWithGuid:self->_awdUniqueId];
    id v3 = +[IDSCoreAnalyticsLogger defaultLogger];
    [v3 logMetric:v5];

    uint64_t v4 = +[IDSAWDLogging sharedInstance];
    [v4 sessionCancelReceivedWithAWDGUID:self->_awdUniqueId];
  }
}

- (void)submitAWDMetricsForIDSSessionDeclineSent
{
  if ([(IDSDSession *)self _shouldSubmitMetricsForThisSession])
  {
    id v5 = [objc_alloc((Class)IDSSessionDeclineSentMetric) initWithGuid:self->_awdUniqueId];
    id v3 = +[IDSCoreAnalyticsLogger defaultLogger];
    [v3 logMetric:v5];

    uint64_t v4 = +[IDSAWDLogging sharedInstance];
    [v4 sessionDeclineSentWithAWDGUID:self->_awdUniqueId];
  }
}

- (void)submitAWDMetricsForIDSSessionDeclineReceived
{
  if ([(IDSDSession *)self _shouldSubmitMetricsForThisSession])
  {
    id v5 = [objc_alloc((Class)IDSSessionDeclineReceivedMetric) initWithGuid:self->_awdUniqueId];
    id v3 = +[IDSCoreAnalyticsLogger defaultLogger];
    [v3 logMetric:v5];

    uint64_t v4 = +[IDSAWDLogging sharedInstance];
    [v4 sessionDeclineReceivedWithAWDGUID:self->_awdUniqueId];
  }
}

- (void)submitAWDMetricsForIDSSessionAcceptSent
{
  if ([(IDSDSession *)self _shouldSubmitMetricsForThisSession])
  {
    id v5 = [objc_alloc((Class)IDSSessionAcceptSentMetric) initWithGuid:self->_awdUniqueId];
    id v3 = +[IDSCoreAnalyticsLogger defaultLogger];
    [v3 logMetric:v5];

    uint64_t v4 = +[IDSAWDLogging sharedInstance];
    [v4 sessionAcceptSentWithAWDGUID:self->_awdUniqueId];
  }
}

- (void)submitAWDMetricsForIDSSessionAcceptReceived
{
  if ([(IDSDSession *)self _shouldSubmitMetricsForThisSession])
  {
    id v5 = [objc_alloc((Class)IDSSessionAcceptReceivedMetric) initWithGuid:self->_awdUniqueId];
    id v3 = +[IDSCoreAnalyticsLogger defaultLogger];
    [v3 logMetric:v5];

    uint64_t v4 = +[IDSAWDLogging sharedInstance];
    [v4 sessionAcceptReceivedWithAWDGUID:self->_awdUniqueId];
  }
}

- (void)submitAWDMetricsForIDSSessionConnected
{
  if ([(IDSDSession *)self _shouldSubmitMetricsForThisSession])
  {
    id v5 = [objc_alloc((Class)IDSSessionConnectedMetric) initWithGuid:self->_awdUniqueId];
    id v3 = +[IDSCoreAnalyticsLogger defaultLogger];
    [v3 logMetric:v5];

    uint64_t v4 = +[IDSAWDLogging sharedInstance];
    [v4 sessionConnectedWithAWDGUID:self->_awdUniqueId];
  }
}

- (void)submitAWDMetricsForIDSSessionReinitiateRequested
{
  if ([(IDSDSession *)self _shouldSubmitMetricsForThisSession])
  {
    id v5 = [objc_alloc((Class)IDSSessionReinitiateRequestedMetric) initWithGuid:self->_awdUniqueId];
    id v3 = +[IDSCoreAnalyticsLogger defaultLogger];
    [v3 logMetric:v5];

    uint64_t v4 = +[IDSAWDLogging sharedInstance];
    [v4 sessionReinitiateRequestedWithAWDGUID:self->_awdUniqueId];
  }
}

- (void)submitAWDMetricsForIDSSessionReinitiateStarted
{
  if ([(IDSDSession *)self _shouldSubmitMetricsForThisSession])
  {
    id v5 = [objc_alloc((Class)IDSSessionReinitiateStartedMetric) initWithGuid:self->_awdUniqueId];
    id v3 = +[IDSCoreAnalyticsLogger defaultLogger];
    [v3 logMetric:v5];

    uint64_t v4 = +[IDSAWDLogging sharedInstance];
    [v4 sessionReinitiateStartedWithAWDGUID:self->_awdUniqueId];
  }
}

- (void)submitAWDMetricsForIDSSessionReinitiateConnected
{
  if ([(IDSDSession *)self _shouldSubmitMetricsForThisSession])
  {
    id v5 = [objc_alloc((Class)IDSSessionReinitiateConnectedMetric) initWithGuid:self->_awdUniqueId];
    id v3 = +[IDSCoreAnalyticsLogger defaultLogger];
    [v3 logMetric:v5];

    uint64_t v4 = +[IDSAWDLogging sharedInstance];
    [v4 sessionReinitiateConnectedWithAWDGUID:self->_awdUniqueId];
  }
}

- (void)submitAWDMetricsForIDSSessionCompleted
{
  if ([(IDSDSession *)self _shouldSubmitMetricsForThisSession])
  {
    id v3 = [(IDSDSession *)self sharedState];
    uint64_t v4 = [v3 destinations];
    long long v34 = +[IDSDestination destinationWithDestinations:v4];

    unsigned int v28 = sub_1001CDC28(v34);
    id v30 = objc_alloc((Class)IDSSessionCompleted);
    awdUniqueId = self->_awdUniqueId;
    long long v33 = [(IDSDSession *)self sharedState];
    int v26 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v33 peerProtocolVersion]);
    long long v32 = [(IDSDSession *)self sharedState];
    __int16 v24 = [v32 serviceName];
    long long v31 = [(IDSDSession *)self sharedState];
    id v23 = [v31 clientType];
    id v27 = [(IDSDSession *)self sharedState];
    unsigned int v21 = [v27 enableQuickRelay];
    BOOL v25 = [(IDSDSession *)self sharedState];
    unsigned int v20 = [v25 useQRDirectly];
    unsigned int v22 = [(IDSDSession *)self sharedState];
    unsigned __int8 v19 = [v22 isInitiator];
    id v5 = [(IDSDSession *)self sharedState];
    unsigned __int8 v18 = [v5 isScreenSharingSession];
    unsigned __int8 v6 = [(IDSDSession *)self isWithDefaultPairedDevice];
    id v7 = [(IDSDSession *)self sharedState];
    unsigned int v8 = [v7 transportType];
    unint64_t initialLinkType = self->_initialLinkType;
    int64_t linkProtocol = self->_linkProtocol;
    unsigned int reason = self->_reason;
    BOOL v12 = [(IDSDSession *)self sessionDuration];
    BOOL v13 = [(IDSDSession *)self connectDuration];
    BYTE1(v17) = self->_disallowCellularInterface;
    LOBYTE(v17) = self->_disallowWifiInterface;
    HIDWORD(v16) = v8;
    BYTE2(v16) = v6;
    BYTE1(v16) = v18;
    LOBYTE(v16) = v19;
    id v14 = objc_msgSend(v30, "initWithGuid:protocolVersionNumber:serviceName:clientType:isQREnabled:isUsingQRDirectly:isInitiator:isScreenSharingSessionType:isWithDefaultPairedDevice:transportType:linkType:linkProtocol:endedReason:destinationType:durationOfSession:durationToConnect:isWifiInterfaceDisallowed:isCellularInterfaceDisallowed:", awdUniqueId, v26, v24, v23, v21, v20, v16, __PAIR64__(linkProtocol, initialLinkType), __PAIR64__(v28, reason), v12, v13, v17);

    id v15 = +[IDSCoreAnalyticsLogger defaultLogger];
    [v15 logMetric:v14];
  }
}

- (void)submitAWDMetricsForIDSSessionWithEndReason:(unsigned int)a3
{
  if ([(IDSDSession *)self _shouldSubmitMetricsForThisSession])
  {
    unsigned int v39 = a3;
    id v5 = [(IDSDSession *)self sharedState];
    unsigned __int8 v6 = [v5 connection];
    unsigned int v38 = [v6 natType];

    if (qword_100A4C508
      || ((v7 = (void **)IMWeakLinkSymbol()) == 0 ? (unsigned int v8 = 0) : (unsigned int v8 = *v7),
          objc_storeStrong((id *)&qword_100A4C508, v8),
          qword_100A4C508))
    {
      id v9 = [(IDSDSession *)self sharedState];
      id v10 = [v9 error];
      uint64_t v11 = [v10 userInfo];
      BOOL v12 = [v11 objectForKey:qword_100A4C508];
      uint64_t v13 = (uint64_t)[v12 intValue];
    }
    else
    {
      uint64_t v13 = 0xFFFFFFFFLL;
    }
    long long v40 = +[NSNumber numberWithInt:v13];
    if (qword_100A4C510
      || ((id v14 = (void **)IMWeakLinkSymbol()) == 0 ? (v15 = 0) : (v15 = *v14),
          objc_storeStrong((id *)&qword_100A4C510, v15),
          qword_100A4C510))
    {
      uint64_t v16 = [(IDSDSession *)self sharedState];
      uint64_t v17 = [v16 error];
      unsigned __int8 v18 = [v17 userInfo];
      unsigned __int8 v19 = [v18 objectForKey:qword_100A4C510];
      uint64_t v20 = (uint64_t)[v19 intValue];
    }
    else
    {
      uint64_t v20 = 0xFFFFFFFFLL;
    }
    id v37 = +[NSNumber numberWithInt:v20];
    id v36 = objc_alloc((Class)IDSSessionEndedMetric);
    unsigned int v21 = [(IDSDSession *)self sharedState];
    unsigned int v22 = [v21 error];
    id v35 = [v22 code];
    id v23 = [(IDSDSession *)self sessionDuration];
    __int16 v24 = [(IDSDSession *)self connectDuration];
    BOOL v25 = [(IDSDSession *)self sharedState];
    int v26 = [v25 connection];
    unsigned int v27 = [v26 connectionType];
    unsigned int v28 = +[NSNumber numberWithUnsignedInteger:v38];
    unsigned int v29 = [(IDSDSession *)self sharedState];
    LOBYTE(v34) = [v29 isInitiator];
    BYTE4(v33) = 0;
    LODWORD(v33) = v27;
    LODWORD(v32) = 0;
    id v30 = objc_msgSend(v36, "initWithGuid:endedReason:genericError:gameKitError:conferenceMiscError:callDuration:networkCheckResult:dataRate:gksError:connectDuration:remoteNetworkConnection:localNetworkConnection:connectionType:usesRelay:currentNATType:remoteNATType:relayConnectDuration:isInitiator:linkQuality:gksReturnCode:", 0, v39, v35, 0, 0, v23, v32, &off_1009D1AD0, v40, v24, 0x200000002, v33, v28, &off_1009D1AE8, 0,
            v34,
            &off_1009D1B00,
            v37);

    long long v31 = +[IDSCoreAnalyticsLogger defaultLogger];
    [v31 logMetric:v30];
  }
}

@end