@interface APSUserCourier
- (APSClientIdentityProvider)clientIdentityProvider;
- (APSDebugOverrides)debugOverrides;
- (APSEnvironment)environment;
- (APSFilterVersionStateMachine)filterVersionStateMachine;
- (APSProtocolConnection)preferredProtocolConnection;
- (APSProtocolConnectionEstablisher)protocolConnectionEstablisher;
- (APSSystemTokenStorage)systemTokenStorage;
- (APSUser)courierUser;
- (APSUserAppIDManager)userAppIDManager;
- (APSUserCourier)initWithEnvironment:(id)a3 courierUser:(id)a4 userPreferences:(id)a5 clientIdentityProvider:(id)a6 userAppIDManager:(id)a7 systemTokenStorage:(id)a8 delegate:(id)a9 withConnectionEstablisher:(id)a10;
- (APSUserCourier)initWithEnvironment:(id)a3 courierUser:(id)a4 userPreferences:(id)a5 clientIdentityProvider:(id)a6 userAppIDManager:(id)a7 systemTokenStorage:(id)a8 filterVersionStateMachine:(id)a9 debugOverrides:(id)a10 delegate:(id)a11 withConnectionEstablisher:(id)a12 tokenStore:(id)a13 tokenRequestQueue:(id)a14;
- (APSUserCourierDelegate)delegate;
- (BOOL)_hasListeningTopics;
- (BOOL)_isIdentityAvailable;
- (BOOL)_isInteractivePushDuringSleepEnabledForConnectionServer:(id)a3;
- (BOOL)_isResponseForProxyDevice:(id)a3;
- (BOOL)_processPendingProxyPresences;
- (BOOL)_processPotentialIdentityChanged;
- (BOOL)_requestKeepAliveProxy;
- (BOOL)_useShortKeepAliveInterval;
- (BOOL)_wakeCausedByTopic:(id)a3 interface:(id)a4 priorityVal:(unint64_t)a5 inAllowlist:(BOOL)a6;
- (BOOL)connectionDelegateHasConnectedUser:(id)a3;
- (BOOL)connectionDelegateIsConnectedToService:(id)a3;
- (BOOL)enabled;
- (BOOL)expectsResponseForFilterMessageOnProtocolConnection:(id)a3;
- (BOOL)expectsResponseForFilterMessageOnProtocolConnection:(id)a3 forClient:(id)a4;
- (BOOL)hasConnectedInterface;
- (BOOL)hasConnectedInterfaceForIdentifier:(id)a3;
- (BOOL)hasConnectedInterfaceOfType:(int64_t)a3;
- (BOOL)hasEagerMessages;
- (BOOL)hasFilterChanged;
- (BOOL)hasOutOfDateFilterOnProtocolConnection:(id)a3;
- (BOOL)hasProtocolConnectionInterfaceOfType:(int64_t)a3;
- (BOOL)hasReasonToConnect;
- (BOOL)isCellularWatch;
- (BOOL)isConnectableRightNow;
- (BOOL)isConnectedOnUltraConstrainedInterface;
- (BOOL)isConnectedToService;
- (BOOL)isIdle;
- (BOOL)isInteractivePushDuringSleepEnabled;
- (BOOL)isKeepAliveProxyConfigured;
- (BOOL)locallyDisabledFilterOptimization;
- (BOOL)protocolConnectionHasSentActivityTrackingSalt:(id)a3;
- (BOOL)serverDisabledFilterOptimization;
- (BOOL)shouldDropPubSubMessageWithData:(id)a3 forTopic:(id)a4;
- (BOOL)shouldForceShortTimeouts;
- (BOOL)shouldHandleIncomingPush:(id)a3 forProtocolConnection:(id)a4;
- (BOOL)shouldOnlySendFilterOnPreferredInterface;
- (BOOL)shouldRun;
- (BOOL)shouldUseInternet;
- (BOOL)wantsCriticalReliability;
- (BOOL)willBeAbleToConnect;
- (NSArray)certificates;
- (NSData)nonce;
- (NSData)publicToken;
- (NSData)signature;
- (NSDate)lastPresence;
- (NSMutableArray)connectionServers;
- (NSMutableArray)subscriptionRequests;
- (NSMutableDictionary)protocolConnectionByIdentifier;
- (NSMutableDictionary)stateByConnectionIdentifier;
- (NSNumber)currentMessageID;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)ifname;
- (NSString)latestGeoRegion;
- (id)JSONDebugState;
- (id)_copyParsedPayload:(id)a3;
- (id)_findActiveClientWithToken:(id)a3;
- (id)_findClientWithToken:(id)a3;
- (id)_findConnectedClientWithToken:(id)a3 onProtocolConnection:(id)a4;
- (id)_getCurrentTokens;
- (id)_getNextMessageID;
- (id)_proxyManager;
- (id)_topicsByHashFromTopicStateDictionary:(id)a3;
- (id)_ultraConstrainedTopicsFromTopicDictionary:(id)a3;
- (id)allRegisteredChannelsForTopic:(id)a3;
- (id)aps_prettyDescription;
- (id)connectedInterfaceForIdentifier:(id)a3;
- (id)connection:(id)a3 createURLTokenForToken:(id)a4;
- (id)connectionForConnectionPortName:(id)a3;
- (id)copyOperatorName;
- (id)getConnectionTypeFromProtocolConnection:(id)a3;
- (id)stateForProtocolConnection:(id)a3;
- (id)topicManager;
- (id)updateChannelForIncomingMessageWithData:(id)a3 forTopic:(id)a4;
- (id)urlPrefix;
- (id)verboseDescription;
- (int)_protoSubscriptionFailureToReadableFailure:(int)a3;
- (int)_protoUpdateFailureToReadableFailure:(int)a3;
- (int64_t)countOfConnectedInterface;
- (unint64_t)_countActiveClients;
- (unint64_t)_countConnectedClients;
- (unint64_t)getNextTaskMessageId;
- (unint64_t)largeMessageSize;
- (unint64_t)messageSize;
- (unint64_t)overallCourierStatus;
- (unsigned)disconnectReason;
- (void)__dumpLogsForInconsistencyIfNecessary;
- (void)__performIdleCheck;
- (void)__processStoredIncomingMessagesForConnection:(id)a3;
- (void)_adjustIsConnectedToService;
- (void)_cancelRequest:(id)a3;
- (void)_clearCachedSigNonceCert;
- (void)_clearPendingProxyPresence;
- (void)_clearTopicsForGuestUser;
- (void)_deleteClientIdentityRequestingReplacement;
- (void)_didFinishAssertingAllPresences:(id)a3;
- (void)_disconnectTokenWithReason:(unsigned int)a3 onProtocolConnection:(id)a4;
- (void)_dumpLogsForInconsistencyIfNecessary;
- (void)_enqueueMessage:(id)a3 forOriginator:(id)a4;
- (void)_finishDisconnectForInterface:(id)a3;
- (void)_forceReconnectionsWithReason:(unsigned int)a3;
- (void)_generateSalt;
- (void)_handleAppTokenGenerateResponse:(id)a3 onProtocolConnection:(id)a4;
- (void)_handleChannelUpdateCommand:(id)a3;
- (void)_handleConnectedMessage:(id)a3 onProtocolConnection:(id)a4;
- (void)_handleLostPushTokens;
- (void)_handleMessageMessage:(id)a3 onProtocolConnection:(id)a4 withGeneration:(unint64_t)a5 isWakingMessage:(BOOL)a6 fromAgent:(BOOL)a7;
- (void)_handleOutgoingMessageAcknowledgment:(id)a3 onProtocolConnection:(id)a4;
- (void)_handlePresenceOffline:(id)a3;
- (void)_handlePresenceTrackingResponse:(id)a3 onProtocolConnection:(id)a4;
- (void)_handlePubSubChannelListRequestonProtocolConnection:(id)a3;
- (void)_handlePubSubRequest:(id)a3 unsubscriptionChannels:(id)a4 token:(id)a5;
- (void)_handlePubSubSubscriptionResponse:(id)a3 fromAgent:(BOOL)a4 onProtocolConnection:(id)a5;
- (void)_handlePubSubUpdateMessage:(id)a3 onProtocolConnection:(id)a4;
- (void)_handleSubscriptionUpdateCommand:(id)a3 token:(id)a4 protocolConnection:(id)a5;
- (void)_logTopics;
- (void)_notifyForIncomingMessage:(id)a3;
- (void)_notifyForIncomingMessage:(id)a3 forConnection:(id)a4;
- (void)_performIdleCheck;
- (void)_processInvalidIdentity;
- (void)_processShouldRunChangeIfNecessary;
- (void)_processShouldUseInternetChangeIfNecessary;
- (void)_processStoredIncomingMessages;
- (void)_processStoredIncomingMessagesForConnection:(id)a3;
- (void)_recreateCacheDictionaries;
- (void)_registerAppTokenCleanup;
- (void)_removePendingRequestsForProtocolConnection:(id)a3;
- (void)_reportAPSConnectivity;
- (void)_requestClientPubSubChannelList:(id)a3 onProtocolConnection:(id)a4;
- (void)_requestToSendFilterOnTopicManager:(id)a3 change:(id)a4;
- (void)_resetCheckpointForIgnoredTopics:(id)a3;
- (void)_retryRequestAfterDelay:(id)a3;
- (void)_retryRequestAfterDelay:(id)a3 withDelay:(double)a4;
- (void)_sendActiveStateMessageWithSendAllBlueListMessages:(BOOL)a3;
- (void)_sendClientFilter:(id)a3 onProtocolConnection:(id)a4;
- (void)_sendFilterMessageOnProtocolConnection:(id)a3 withChange:(id)a4;
- (void)_sendFilterMessageOnProtocolConnection:(id)a3 withReason:(unint64_t)a4;
- (void)_sendOutgoingMessage:(id)a3 onProtocolConnection:(id)a4;
- (void)_sendPresenceMessageOnProtocolConnection:(id)a3 serverTime:(id)a4;
- (void)_sendProxyChannelList:(id)a3 onConnectionType:(int64_t)a4;
- (void)_sendPubsubConnectMessageOnProtocolConnection:(id)a3 token:(id)a4;
- (void)_sendQueuedOutgoingMessages;
- (void)_triggerAutoBugCaptureForInvalidPresence:(id)a3;
- (void)_triggerAutoBugCaptureIfMessageIsRetried:(id)a3;
- (void)_tryConnectingOrDisconnectingTokens;
- (void)_useInteractivePowerAssertionIfNeededForConnectionServer:(id)a3 withReason:(id)a4;
- (void)_writePubSubMessagetoConnection:(id)a3 messageID:(unsigned int)a4 token:(id)a5 connectionType:(int64_t)a6;
- (void)addConnection:(id)a3;
- (void)addTaskServer:(id)a3;
- (void)appendPrettyStatusToStatusPrinter:(id)a3;
- (void)attemptToRollSalt;
- (void)beginTrackingProtocolConnection:(id)a3;
- (void)canUseProxyChanged;
- (void)client:(id)a3 messageTracingWithStatus:(int)a4 topic:(id)a5 tracingUUID:(id)a6 token:(id)a7;
- (void)client:(id)a3 requestPushAckResponse:(id)a4 messageId:(id)a5 token:(id)a6 connectionType:(id)a7 generation:(id)a8;
- (void)client:(id)a3 requestSendOutgoingMessage:(id)a4;
- (void)client:(id)a3 requestTokenGenerateWithTopicHash:(id)a4 baseToken:(id)a5 appId:(id)a6 expirationTTL:(id)a7 vapidPublicKeyHash:(id)a8 type:(id)a9;
- (void)client:(id)a3 sendPubSubChannelList:(id)a4 token:(id)a5;
- (void)clientBecameInactive:(id)a3;
- (void)clientIdentityDidBecomeAvailable;
- (void)clientIdentityDidBecomeUnavailable;
- (void)connection:(id)a3 didInvalidateTokenForInfo:(id)a4;
- (void)connection:(id)a3 didReceiveCancellationForOutgoingMessageWithID:(unint64_t)a4;
- (void)connection:(id)a3 didReceiveFakeMessageToSend:(id)a4;
- (void)connection:(id)a3 didReceiveIncomingMessageReceiptWithTopic:(id)a4 tracingUUID:(id)a5;
- (void)connection:(id)a3 didReceiveOutgoingMessageToSend:(id)a4;
- (void)connection:(id)a3 didReceiveSubscribeToChannels:(id)a4 forTopic:(id)a5;
- (void)connection:(id)a3 didReceiveUnsubscribeToChannels:(id)a4 forTopic:(id)a5;
- (void)connection:(id)a3 didRequestCurrentTokenForInfo:(id)a4;
- (void)connection:(id)a3 didRequestTokenForInfo:(id)a4;
- (void)connection:(id)a3 handleAckIncomingMessageWithGuid:(id)a4 topic:(id)a5 tracingUUID:(id)a6;
- (void)connection:(id)a3 setKeepAliveConfiguration:(unint64_t)a4;
- (void)connection:(id)a3 subscribeToPreviouslyIgnoredTopics:(id)a4;
- (void)connectionChangedCriticalReliability:(id)a3;
- (void)connectionChangedTrackActivityPresence:(id)a3;
- (void)connectionDidClientDisconnect:(id)a3;
- (void)connectionDidOpenonProtocolConnection:(id)a3 secureHandshakeEnabled:(BOOL)a4;
- (void)connectionTopicsChanged:(id)a3;
- (void)connectionWasClosed:(id)a3;
- (void)connectionWasOpened:(id)a3;
- (void)dealloc;
- (void)didRecoverFromSuspensionOnProtocolConnection:(id)a3;
- (void)didSuspendProtocolConnection:(id)a3;
- (void)enumerateAllProtocolConnections:(id)a3;
- (void)enumerateConnectedProtocolConnections:(id)a3;
- (void)enumerateConnectedProtocolConnectionsOfType:(int64_t)a3 block:(id)a4;
- (void)flush;
- (void)generateCertWithServerTime:(id)a3 completionBlock:(id)a4;
- (void)getClientIdentityForcingRefresh:(BOOL)a3 withCompletion:(id)a4;
- (void)handleDisconnectForInterface:(id)a3 connectionState:(int64_t)a4 withReason:(unsigned int)a5;
- (void)handleIgnoredTopics:(id)a3;
- (void)incomingPresenceWithGuid:(id)a3 token:(id)a4 hwVersion:(id)a5 swVersion:(id)a6 swBuild:(id)a7 certificate:(id)a8 nonce:(id)a9 signature:(id)a10;
- (void)invalidateDeviceIdentity;
- (void)logStateWithReason:(id)a3;
- (void)logout;
- (void)markProtocolConnectionDisconnectedForActivityTracking:(id)a3;
- (void)outgoingDataAboutToSendForProtocolConnection:(id)a3;
- (void)outgoingMessageQueue:(id)a3 lateAcknowledgmentForCriticalOutgoingMessage:(id)a4;
- (void)outgoingMessageQueue:(id)a3 requestCriticalMessageFlushWithPaddingLength:(unint64_t)a4;
- (void)outgoingMessageQueue:(id)a3 requestToSendLowPriorityMessages:(id)a4;
- (void)outgoingMessageQueueShortMessageTimeoutExceeded:(id)a3;
- (void)performAppTokenCleanup;
- (void)periodicSignalFired;
- (void)prepareForDarkWake;
- (void)prepareForFullWake;
- (void)prepareForSleep;
- (void)processIsPowerEfficientToSendChange;
- (void)protocolConnection:(id)a3 didDisconnectWithConnectionState:(int64_t)a4 reason:(unsigned int)a5;
- (void)protocolConnection:(id)a3 receivedFilterUpdateWithParameters:(id)a4;
- (void)protocolConnection:(id)a3 receivedMessageWithParameters:(id)a4 generation:(unint64_t)a5 isWaking:(BOOL)a6;
- (void)protocolConnection:(id)a3 receivedNoStorageWithParameters:(id)a4;
- (void)protocolConnection:(id)a3 receivedOfflinePresencekWithParameters:(id)a4;
- (void)protocolConnection:(id)a3 receivedPresenceTrackingRequestWithParameters:(id)a4;
- (void)protocolConnection:(id)a3 receivedPubSubChannelListWithParameters:(id)a4;
- (void)protocolConnection:(id)a3 receivedPubSubChannelUpdateWithParameters:(id)a4;
- (void)protocolConnection:(id)a3 receivedTaskControlWithParameters:(id)a4;
- (void)protocolConnection:(id)a3 receivedTaskNotificationWithParameters:(id)a4;
- (void)pushTokenBecameInvalidForClient:(id)a3;
- (void)recalculateTrackActivityPresence;
- (void)receivedConnectedResponseWithParameters:(id)a3 onProtocolConnection:(id)a4;
- (void)receivedFilterResponseWithParameters:(id)a3 onProtocolConnection:(id)a4;
- (void)refreshCertNonceAndSignatureWithServerTime:(id)a3 withCompletion:(id)a4;
- (void)removeConnectionForConnectionPortName:(id)a3;
- (void)removeTaskServer:(id)a3;
- (void)requestFilterForClient:(id)a3;
- (void)rollTokenAndReconnect;
- (void)rollTokensForAllBAAEnvironments;
- (void)saveToken:(id)a3 forInfo:(id)a4 connection:(id)a5;
- (void)sendFailuresToClient:(id)a3 pushTopic:(id)a4;
- (void)sendPresenceTrackingRequestOnProtocolConnection:(id)a3;
- (void)sendTaskControlMessageWithMetadata:(id)a3 messageId:(unint64_t)a4;
- (void)setCertificates:(id)a3;
- (void)setClientIdentityProvider:(id)a3;
- (void)setConnectionServers:(id)a3;
- (void)setCourierUser:(id)a3;
- (void)setCurrentMessageID:(id)a3;
- (void)setDebugOverrides:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisconnectReason:(unsigned int)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFilterVersionStateMachine:(id)a3;
- (void)setHasFilterChanged:(BOOL)a3;
- (void)setIsConnectedToService:(BOOL)a3;
- (void)setLargeMessageSize:(unint64_t)a3;
- (void)setLastPresence:(id)a3;
- (void)setLocallyDisabledFilterOptimization:(BOOL)a3;
- (void)setMessageSize:(unint64_t)a3;
- (void)setNonce:(id)a3;
- (void)setProtocolConnectionByIdentifier:(id)a3;
- (void)setProtocolConnectionEstablisher:(id)a3;
- (void)setPublicToken:(id)a3 fromServer:(BOOL)a4;
- (void)setServerDisabledFilterOptimization:(BOOL)a3;
- (void)setSignature:(id)a3;
- (void)setStateByConnectionIdentifier:(id)a3;
- (void)setSubscriptionRequests:(id)a3;
- (void)setSymptomReporter:(id)a3;
- (void)setSystemTokenStorage:(id)a3;
- (void)setUserAppIDManager:(id)a3;
- (void)subscribeToChannels:(id)a3 forTopic:(id)a4 token:(id)a5;
- (void)subscribeToPreviouslyIgnoredTopics:(id)a3;
- (void)systemDidLock;
- (void)systemDidUnlock;
- (void)topicManagerRequestToSendFilter:(id)a3 change:(id)a4;
- (void)ttlCollection:(id)a3 itemsDidExpire:(id)a4 withStates:(id)a5;
- (void)unsubscribeFromChannels:(id)a3 forTopic:(id)a4 token:(id)a5;
- (void)updateForReceivedConfig:(id)a3;
@end

@implementation APSUserCourier

- (APSUserCourier)initWithEnvironment:(id)a3 courierUser:(id)a4 userPreferences:(id)a5 clientIdentityProvider:(id)a6 userAppIDManager:(id)a7 systemTokenStorage:(id)a8 delegate:(id)a9 withConnectionEstablisher:(id)a10
{
  id v16 = a3;
  id v34 = a10;
  id v33 = a9;
  id v32 = a8;
  id v31 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  v20 = [[APSTokenStore alloc] initWithEnvironment:v16 allowInMemoryCache:0];
  v21 = objc_alloc_init(APSOutgoingQueue);
  if (sub_10007E748()) {
    v22 = objc_alloc_init(APSDefaultsDebugOverrides);
  }
  else {
    v22 = 0;
  }
  uint64_t v23 = [(APSDefaultsDebugOverrides *)v22 overrideFilterVersion];
  v30 = (void *)v23;
  if (v23)
  {
    v24 = (void *)v23;
    v25 = +[APSLog courier];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v36 = self;
      __int16 v37 = 2112;
      v38 = v24;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%@: Overriding filter version {filterVersionOverride: %@}", buf, 0x16u);
    }

    v26 = -[APSFilterVersionStateMachine initWithInitialVersion:]([APSFilterVersionStateMachine alloc], "initWithInitialVersion:", [v24 unsignedLongLongValue]);
  }
  else
  {
    v26 = objc_alloc_init(APSFilterVersionStateMachine);
  }
  v27 = v26;
  v29 = [(APSUserCourier *)self initWithEnvironment:v16 courierUser:v19 userPreferences:v18 clientIdentityProvider:v17 userAppIDManager:v31 systemTokenStorage:v32 filterVersionStateMachine:v26 debugOverrides:v22 delegate:v33 withConnectionEstablisher:v34 tokenStore:v20 tokenRequestQueue:v21];

  return v29;
}

- (APSUserCourier)initWithEnvironment:(id)a3 courierUser:(id)a4 userPreferences:(id)a5 clientIdentityProvider:(id)a6 userAppIDManager:(id)a7 systemTokenStorage:(id)a8 filterVersionStateMachine:(id)a9 debugOverrides:(id)a10 delegate:(id)a11 withConnectionEstablisher:(id)a12 tokenStore:(id)a13 tokenRequestQueue:(id)a14
{
  id v19 = a3;
  id v96 = a4;
  id v92 = a5;
  id v82 = a6;
  id v95 = a6;
  id v20 = a7;
  id v84 = a7;
  id v93 = a8;
  id v85 = a9;
  id v91 = a10;
  id v94 = a11;
  id v86 = a12;
  id v87 = a13;
  id v88 = a14;
  v102.receiver = self;
  v102.super_class = (Class)APSUserCourier;
  v21 = [(APSUserCourier *)&v102 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_environment, a3);
    objc_storeStrong((id *)&v22->_courierUser, a4);
    objc_storeStrong((id *)&v22->_filterVersionStateMachine, a9);
    if (_os_feature_enabled_impl()) {
      unsigned __int8 v23 = [v91 disableFilterOptimization];
    }
    else {
      unsigned __int8 v23 = 1;
    }
    v22->_BOOL locallyDisabledFilterOptimization = v23;
    v24 = +[APSLog courier];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = [v19 domain];
      v26 = (void *)v25;
      CFStringRef v27 = @"YES";
      BOOL locallyDisabledFilterOptimization = v22->_locallyDisabledFilterOptimization;
      *(_DWORD *)buf = 138413058;
      if (!locallyDisabledFilterOptimization) {
        CFStringRef v27 = @"NO";
      }
      CFStringRef v104 = (const __CFString *)v22;
      __int16 v105 = 2112;
      uint64_t v106 = v25;
      __int16 v107 = 2112;
      id v108 = v96;
      __int16 v109 = 2112;
      CFStringRef v110 = v27;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%@: Initializing a courier with environment %@ user %@ {_locallyDisabledFilterOptimization: %@}", buf, 0x2Au);
    }
    objc_storeWeak((id *)&v22->_delegate, v94);
    objc_storeStrong((id *)&v22->_userAppIDManager, v20);
    v29 = [APSKeychainTopicSaltStore alloc];
    v30 = +[APSMultiUserMode sharedInstance];
    v90 = [(APSKeychainTopicSaltStore *)v29 initWithEnvironment:v19 multiUserMode:v30];

    id v31 = [[APSTopicHasher alloc] initWithTopicSaltStore:v90];
    topicHasher = v22->_topicHasher;
    v22->_topicHasher = v31;

    objc_storeStrong((id *)&v22->_tokenStore, a13);
    if (!qword_10015A840) {
      objc_storeStrong((id *)&qword_10015A840, v22);
    }
    objc_storeStrong((id *)&v22->_debugOverrides, a10);
    id v33 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    connectionServers = v22->_connectionServers;
    v22->_connectionServers = v33;

    v35 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    connectionPortNamesToConnections = v22->_connectionPortNamesToConnections;
    v22->_connectionPortNamesToConnections = v35;

    __int16 v37 = [[APSOutgoingMessageQueue alloc] initWithDelegate:v22 environment:v22->_environment];
    outgoingMessageQueue = v22->_outgoingMessageQueue;
    v22->_outgoingMessageQueue = v37;

    objc_storeStrong((id *)&v22->_tokenRequestQueue, a14);
    v22->_slowReceiveThreshold = 60.0;
    v39 = [[APSPushHistory alloc] initWithEnvironment:v22->_environment];
    pushHistory = v22->_pushHistory;
    v22->_pushHistory = v39;

    v41 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    protocolConnectionByIdentifier = v22->_protocolConnectionByIdentifier;
    v22->_protocolConnectionByIdentifier = v41;

    v43 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    stateByConnectionIdentifier = v22->_stateByConnectionIdentifier;
    v22->_stateByConnectionIdentifier = v43;

    objc_storeStrong((id *)&v22->_protocolConnectionEstablisher, a12);
    objc_storeStrong((id *)&v22->_systemTokenStorage, a8);
    uint64_t v45 = [v93 tokenForEnvironment:v19];
    cachedPublicToken = v22->_cachedPublicToken;
    v22->_cachedPublicToken = (NSData *)v45;

    v47 = +[APSSystemMonitor sharedInstance];
    [v47 setActive:1];

    v48 = +[APSSystemMonitor sharedInstance];
    [v48 setWatchesSystemLockState:1];

    v49 = +[APSSystemMonitor sharedInstance];
    [v49 addListener:v22];

    uint64_t v50 = +[CUTWeakReference weakRefWithObject:v22];
    weakSelf = v22->_weakSelf;
    v22->_weakSelf = (CUTWeakReference *)v50;

    if (sub_10007E748())
    {
      v52 = [[APSTTLCollection alloc] initWithQueue:&_dispatch_main_q ttlInSeconds:60.0];
      tracingEnabledAcksCollection = v22->_tracingEnabledAcksCollection;
      v22->_tracingEnabledAcksCollection = v52;

      [(APSTTLCollection *)v22->_tracingEnabledAcksCollection setDelegate:v22];
    }
    v54 = [[APSTopicManager alloc] initWithEnvironment:v19 topicHasher:v22->_topicHasher user:v96 userPreferences:v92 ultraConstrainedProvider:v22 delegate:v22];
    topicManager = v22->_topicManager;
    v22->_topicManager = v54;

    v56 = objc_alloc_init(APSWakeMetricTracker);
    wakeMetricTracker = v22->_wakeMetricTracker;
    v22->_wakeMetricTracker = v56;

    v58 = (NSCountedSet *)objc_alloc_init((Class)NSCountedSet);
    topicsToCauseWake = v22->_topicsToCauseWake;
    v22->_topicsToCauseWake = v58;

    v60 = (NSCountedSet *)objc_alloc_init((Class)NSCountedSet);
    offendingTopics = v22->_offendingTopics;
    v22->_offendingTopics = v60;

    v62 = (NSCountedSet *)objc_alloc_init((Class)NSCountedSet);
    inhibitedTopics = v22->_inhibitedTopics;
    v22->_inhibitedTopics = v62;

    v64 = [[APSOutgoingMessageQueue alloc] initWithDelegate:v22 environment:v19];
    v65 = v22->_outgoingMessageQueue;
    v22->_outgoingMessageQueue = v64;

    v22->_disconnectReason = 0;
    v66 = [(APSEnvironment *)v22->_environment domain];
    v67 = +[NSString stringWithFormat:@"%@-waitingformessages-%@", APSBundleIdentifier, v66];

    v68 = [[APSNoOpPowerAssertion alloc] initWithName:v67 category:200 holdDuration:20.0];
    waitForStoredMessagesToArrivePowerAssertion = v22->_waitForStoredMessagesToArrivePowerAssertion;
    v22->_waitForStoredMessagesToArrivePowerAssertion = v68;

    objc_initWeak(&location, v22);
    objc_storeStrong((id *)&v22->_clientIdentityProvider, v82);
    v99[0] = _NSConcreteStackBlock;
    v99[1] = 3221225472;
    v99[2] = sub_100024574;
    v99[3] = &unk_10012A7B0;
    objc_copyWeak(&v100, &location);
    [v95 setIdentityAvailabilityDidChangeBlock:v99];
    if (sub_10007F1B4() && [v96 isDefaultUser])
    {
      v97[0] = _NSConcreteStackBlock;
      v97[1] = 3221225472;
      v97[2] = sub_1000245B8;
      v97[3] = &unk_10012A5E0;
      v98 = v22;
      [v95 setBaaIdentityRefreshedBlock:v97];
    }
    [(APSUserCourier *)v22 getClientIdentityForcingRefresh:0 withCompletion:0];
    v70 = +[APSMultiUserMode sharedInstance];
    unsigned int v71 = [v70 isMultiUser];

    v72 = +[APSMultiUserMode sharedInstance];
    unsigned int v73 = [v72 isLoggedInUser];

    v74 = +[APSMultiUserFS sharedInstance];
    v75 = [v74 systemPath];

    v76 = +[APSLog courier];
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v77 = @"NO";
      if (v71) {
        CFStringRef v78 = @"YES";
      }
      else {
        CFStringRef v78 = @"NO";
      }
      *(_DWORD *)buf = 138412802;
      CFStringRef v104 = v78;
      __int16 v105 = 2112;
      if (v73) {
        CFStringRef v77 = @"YES";
      }
      uint64_t v106 = (uint64_t)v77;
      __int16 v107 = 2112;
      id v108 = v75;
      _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "APSD is under multi user mode: %@, with a logged in user: %@, systemPath: %@", buf, 0x20u);
    }

    v79 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    activeTaskServers = v22->_activeTaskServers;
    v22->_activeTaskServers = v79;

    v22->_nextTaskMessageId = 1;
    [(APSUserCourier *)v22 _registerAppTokenCleanup];

    objc_destroyWeak(&v100);
    objc_destroyWeak(&location);
  }
  return v22;
}

- (void)dealloc
{
  weakSelf = self->_weakSelf;
  self->_weakSelf = 0;

  [(APSTopicManager *)self->_topicManager setDelegate:0];
  v4 = +[APSSystemMonitor sharedInstance];
  [v4 removeListener:self];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v5 = [(APSUserCourier *)self connectionServers];
  id v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * (void)v9) setDelegate:0];
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v7);
  }

  [(PCPersistentTimer *)self->_pendingMessageReconnectTimer invalidate];
  [(PCPersistentTimer *)self->_delayedReconnectTimer invalidate];
  if ((APSUserCourier *)qword_10015A840 == self)
  {
    qword_10015A840 = 0;
  }
  activeTaskServers = self->_activeTaskServers;
  self->_activeTaskServers = 0;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v11 = self->_proxyClients;
  id v12 = [(NSMutableDictionary *)v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = [(NSMutableDictionary *)self->_proxyClients objectForKey:*(void *)(*((void *)&v18 + 1) + 8 * (void)v15)];
        [v16 setDelegate:0];

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [(NSMutableDictionary *)v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v13);
  }

  v17.receiver = self;
  v17.super_class = (Class)APSUserCourier;
  [(APSUserCourier *)&v17 dealloc];
}

- (id)_proxyManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = [WeakRetained proxyManager];

  return v3;
}

- (id)topicManager
{
  return self->_topicManager;
}

- (id)copyOperatorName
{
  v2 = +[PCCarrierBundleHelper helper];
  id v3 = [v2 copyValueForKey:APSCarrierNameKey error:0];

  return v3;
}

- (id)_getCurrentTokens
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = [(APSUserCourier *)self publicToken];
  if (v4) {
    [v3 addObject:v4];
  }

  return v3;
}

- (unint64_t)overallCourierStatus
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 3;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000249BC;
  v4[3] = &unk_10012A7D8;
  v4[4] = self;
  v4[5] = &v5;
  [(APSUserCourier *)self enumerateConnectedProtocolConnections:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_adjustIsConnectedToService
{
  if ([(APSUserCourier *)self hasConnectedInterface])
  {
    BOOL v3 = 1;
  }
  else
  {
    v4 = [(APSUserCourier *)self protocolConnectionEstablisher];
    BOOL v3 = [v4 countConnectedInterfaces] != 0;
  }
  [(APSUserCourier *)self setIsConnectedToService:v3];
}

- (void)setIsConnectedToService:(BOOL)a3
{
  if (self->_isConnectedToService != a3)
  {
    BOOL v4 = a3;
    uint64_t v5 = +[APSLog courier];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v6 = @"NO";
      if (v4) {
        CFStringRef v6 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      long long v19 = self;
      __int16 v20 = 2112;
      CFStringRef v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ setting isConnectedToService %@", buf, 0x16u);
    }

    self->_isConnectedToService = v4;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v7 = [(APSUserCourier *)self connectionServers];
    id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * (void)v11) handleConnectionStatusChanged:self->_isConnectedToService];
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained courierConnectionStatusDidChange:self];

  [(APSUserCourier *)self attemptToRollSalt];
}

- (void)setPublicToken:(id)a3 fromServer:(BOOL)a4
{
  BOOL v4 = a4;
  CFStringRef v6 = (NSData *)a3;
  uint64_t v7 = self->_cachedPublicToken;
  id v8 = v7;
  if (v7 != v6 && (!v7 || ![(NSData *)v6 isEqualToData:v7]))
  {
    if (self->_cachedPublicToken) {
      BOOL v9 = v6 == 0;
    }
    else {
      BOOL v9 = 0;
    }
    if (v8) {
      BOOL v10 = 0;
    }
    else {
      BOOL v10 = v6 != 0;
    }
    uint64_t v11 = v4 | v9;
    if (v11 == 1)
    {
      id v12 = +[APSLog courier];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v13 = @"NO";
        if (v4) {
          CFStringRef v14 = @"YES";
        }
        else {
          CFStringRef v14 = @"NO";
        }
        *(_DWORD *)buf = 138412802;
        v35 = self;
        __int16 v36 = 2112;
        if (v9) {
          CFStringRef v13 = @"YES";
        }
        CFStringRef v37 = v14;
        __int16 v38 = 2112;
        CFStringRef v39 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ Nuking app-specific tokens. FromServer %@  lostToken %@", buf, 0x20u);
      }

      tokenStore = self->_tokenStore;
      long long v16 = [(APSUserCourier *)self courierUser];
      [(APSTokenStore *)tokenStore deleteAppTokensForUser:v16];

      objc_super v17 = +[APSLog courier];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v18 = [(NSData *)v6 length];
        long long v19 = [(NSData *)v6 debugDescription];
        *(_DWORD *)buf = 138412802;
        v35 = self;
        __int16 v36 = 2048;
        CFStringRef v37 = v18;
        __int16 v38 = 2112;
        CFStringRef v39 = v19;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@ Updating device push token in the keychain to [length = %lu, token = %@]", buf, 0x20u);
      }
      __int16 v20 = [(APSUserCourier *)self systemTokenStorage];
      CFStringRef v21 = [(APSUserCourier *)self environment];
      [v20 setToken:v6 forEnvironment:v21];
    }
    long long v22 = (NSData *)[(NSData *)v6 copy];
    cachedPublicToken = self->_cachedPublicToken;
    self->_cachedPublicToken = v22;

    if (v10) {
      [(APSUserCourier *)self _requestToSendFilterOnTopicManager:self->_topicManager change:0];
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v24 = [(APSUserCourier *)self connectionServers];
    id v25 = [v24 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v30;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v30 != v27) {
            objc_enumerationMutation(v24);
          }
          [*(id *)(*((void *)&v29 + 1) + 8 * i) setPublicToken:v6 needsAck:v11];
        }
        id v26 = [v24 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v26);
    }

    if (v9) {
      [(APSUserCourier *)self _handleLostPushTokens];
    }
  }
}

- (unint64_t)messageSize
{
  return [(APSEnvironment *)self->_environment messageSize];
}

- (void)setMessageSize:(unint64_t)a3
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v5 = self->_proxyClients;
  id v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      BOOL v9 = 0;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = [(NSMutableDictionary *)self->_proxyClients objectForKey:*(void *)(*((void *)&v20 + 1) + 8 * (void)v9)];
        [v10 setMessageSize:a3];

        BOOL v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  if ([(APSEnvironment *)self->_environment messageSize] != a3)
  {
    [(APSEnvironment *)self->_environment setMessageSize:a3];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v11 = [(APSUserCourier *)self connectionServers];
    id v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        long long v15 = 0;
        do
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * (void)v15) setMessageSize:a3];
          long long v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v13);
    }
  }
}

- (unint64_t)largeMessageSize
{
  unint64_t v3 = [(APSEnvironment *)self->_environment largeMessageSize];
  unint64_t result = [(APSUserCourier *)self messageSize];
  if (v3 > result) {
    return v3;
  }
  return result;
}

- (void)setLargeMessageSize:(unint64_t)a3
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v5 = self->_proxyClients;
  id v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      BOOL v9 = 0;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = [(NSMutableDictionary *)self->_proxyClients objectForKey:*(void *)(*((void *)&v20 + 1) + 8 * (void)v9)];
        [v10 setLargeMessageSize:a3];

        BOOL v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  if ([(APSEnvironment *)self->_environment largeMessageSize] != a3)
  {
    [(APSEnvironment *)self->_environment setLargeMessageSize:a3];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v11 = [(APSUserCourier *)self connectionServers];
    id v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        long long v15 = 0;
        do
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * (void)v15) setLargeMessageSize:a3];
          long long v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v13);
    }
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    BOOL v3 = a3;
    self->_enabled = a3;
    uint64_t v5 = +[APSLog courier];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (v3) {
        CFStringRef v6 = @"YES";
      }
      else {
        CFStringRef v6 = @"NO";
      }
      id v7 = [(APSTopicManager *)self->_topicManager logString];
      int v8 = 138412802;
      BOOL v9 = self;
      __int16 v10 = 2112;
      CFStringRef v11 = v6;
      __int16 v12 = 2112;
      id v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ setEnabled %@   %@", (uint8_t *)&v8, 0x20u);
    }
    [(APSUserCourier *)self _processStoredIncomingMessages];
    [(APSUserCourier *)self _processStoredOutgoingMessages];
    [(APSUserCourier *)self _processShouldRunChangeIfNecessary];
  }
}

- (BOOL)shouldRun
{
  self->_shouldRun = self->_enabled;
  unint64_t v3 = [(APSUserCourier *)self _countActiveClients];
  if (self->_shouldRun)
  {
    unint64_t v4 = v3;
    BOOL result = [(APSUserCourier *)self _hasListeningTopics];
    if (v4) {
      BOOL result = 1;
    }
  }
  else
  {
    BOOL result = 0;
  }
  self->_shouldRun = result;
  return result;
}

- (BOOL)shouldUseInternet
{
  BOOL v3 = [(APSUserCourier *)self shouldRun];
  if (v3) {
    LOBYTE(v3) = ![(APSUserCourier *)self hasProtocolConnectionInterfaceOfType:2];
  }
  self->_shouldUseInternet = v3;
  return v3;
}

- (BOOL)isCellularWatch
{
  return 0;
}

- (BOOL)_useShortKeepAliveInterval
{
  if (qword_10015A850 != -1) {
    dispatch_once(&qword_10015A850, &stru_10012A7F8);
  }
  return byte_10015A848;
}

- (BOOL)hasEagerMessages
{
  return [(APSOutgoingMessageQueue *)self->_outgoingMessageQueue hasEagerMessages];
}

- (BOOL)wantsCriticalReliability
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  unint64_t v2 = [(APSUserCourier *)self connectionServers];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) enableCriticalReliability])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (BOOL)isIdle
{
  return 0;
}

- (BOOL)isInteractivePushDuringSleepEnabled
{
  if (![(APSUserCourier *)self _requestKeepAliveProxy]
    || ![(APSUserCourier *)self isConnectableRightNow])
  {
    return 0;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(APSUserCourier *)self connectionServers];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([(APSUserCourier *)self _isInteractivePushDuringSleepEnabledForConnectionServer:*(void *)(*((void *)&v10 + 1) + 8 * i)])
        {
          BOOL v8 = 1;
          goto LABEL_14;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 0;
LABEL_14:

  return v8;
}

- (BOOL)isKeepAliveProxyConfigured
{
  id v3 = [(APSUserCourier *)self protocolConnectionEstablisher];
  if ([v3 isKeepAliveProxyConfiguredOnAnyConnection]) {
    BOOL v4 = [(APSUserCourier *)self hasConnectedInterface];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)isConnectableRightNow
{
  BOOL v3 = [(APSUserCourier *)self _isIdentityAvailable];
  if (v3)
  {
    LOBYTE(v3) = [(APSUserCourier *)self shouldUseInternet];
  }
  return v3;
}

- (BOOL)hasReasonToConnect
{
  BOOL v3 = [(APSUserCourier *)self _isIdentityAvailable];
  if (v3)
  {
    LOBYTE(v3) = [(APSUserCourier *)self shouldRun];
  }
  return v3;
}

- (BOOL)_hasListeningTopics
{
  BOOL v3 = +[APSLog courier];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v4 = [(APSTopicManager *)self->_topicManager hasListeningTopics];
    CFStringRef v5 = @"NO";
    if (v4) {
      CFStringRef v5 = @"YES";
    }
    int v7 = 138412546;
    BOOL v8 = self;
    __int16 v9 = 2112;
    CFStringRef v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ _hasListeningTopics %@", (uint8_t *)&v7, 0x16u);
  }

  return [(APSTopicManager *)self->_topicManager hasListeningTopics];
}

- (NSData)publicToken
{
  cachedPublicToken = self->_cachedPublicToken;
  if (!cachedPublicToken)
  {
    unsigned int v4 = [(APSUserCourier *)self systemTokenStorage];
    CFStringRef v5 = [(APSUserCourier *)self environment];
    uint64_t v6 = [v4 tokenForEnvironment:v5];
    int v7 = self->_cachedPublicToken;
    self->_cachedPublicToken = v6;

    [(APSUserCourier *)self setPublicToken:self->_cachedPublicToken fromServer:0];
    cachedPublicToken = self->_cachedPublicToken;
  }
  return cachedPublicToken;
}

- (BOOL)_isInteractivePushDuringSleepEnabledForConnectionServer:(id)a3
{
  return 0;
}

- (BOOL)_requestKeepAliveProxy
{
  return 0;
}

- (BOOL)willBeAbleToConnect
{
  if ([(APSUserCourier *)self _isIdentityAvailable])
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    BOOL v2 = +[APSSimulatorSupport isSimulator];
    if (v2)
    {
      LOBYTE(v2) = +[APSSimulatorSupport isHardwareSupported];
    }
  }
  return v2;
}

- (void)logStateWithReason:(id)a3
{
  unsigned int v4 = (__CFString *)a3;
  CFStringRef v5 = v4;
  uint64_t v6 = @"STATEDUMP";
  if (v4) {
    uint64_t v6 = v4;
  }
  int v7 = v6;
  BOOL v8 = +[APSLog courierOversized];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v9 = [(APSUserCourier *)self verboseDescription];
    int v10 = 138412546;
    long long v11 = v7;
    __int16 v12 = 2112;
    long long v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%@] %@", (uint8_t *)&v10, 0x16u);
  }
}

- (id)verboseDescription
{
  id v20 = objc_alloc_init((Class)NSMutableDictionary);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [(APSUserCourier *)self protocolConnectionByIdentifier];
  id v3 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v22;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        BOOL v8 = [(APSUserCourier *)self protocolConnectionByIdentifier];
        __int16 v9 = [v8 objectForKeyedSubscript:v7];
        v25[0] = v9;
        int v10 = [(APSUserCourier *)self stateByConnectionIdentifier];
        long long v11 = [v10 objectForKeyedSubscript:v7];
        v25[1] = v11;
        __int16 v12 = +[NSArray arrayWithObjects:v25 count:2];
        [v20 setObject:v12 forKeyedSubscript:v7];
      }
      id v4 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v4);
  }

  long long v13 = APSPrettyPrintCollection();
  uint64_t v14 = APSPrettyPrintObject();
  long long v15 = [(NSMutableDictionary *)self->_proxyClients allValues];
  long long v16 = APSPrettyPrintCollection();
  long long v17 = +[NSString stringWithFormat:@"%@ protocol connections: %@ filter version state: %@ proxy clients: %@", self, v13, v14, v16];

  return v17;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(APSUserCourier *)self environment];
  uint64_t v5 = [v4 name];
  uint64_t v6 = [(APSUserCourier *)self courierUser];
  uint64_t v7 = [v6 name];
  BOOL v8 = +[NSString stringWithFormat:@"<%@ %p %@ %@>", v3, self, v5, v7];

  return (NSString *)v8;
}

- (NSString)debugDescription
{
  uint64_t v14 = objc_opt_class();
  courierUser = self->_courierUser;
  unint64_t v4 = [(APSUserCourier *)self _countActiveClients];
  if ([(APSUserCourier *)self shouldUseInternet]) {
    CFStringRef v5 = @"YES";
  }
  else {
    CFStringRef v5 = @"NO";
  }
  uint64_t v6 = [(APSUserCourier *)self publicToken];
  uint64_t v7 = [v6 debugDescription];
  if ([(APSUserCourier *)self _isIdentityAvailable]) {
    CFStringRef v8 = @"YES";
  }
  else {
    CFStringRef v8 = @"NO";
  }
  __int16 v9 = [(APSUserCourier *)self connectionServers];
  int v10 = APSPrettyPrintCollection();
  long long v11 = [(APSTopicManager *)self->_topicManager logString];
  __int16 v12 = +[NSString stringWithFormat:@"<%@ %p: user=%@, activeClients=%lu, shouldUseInternet=%@, publicToken=%@, isIdentityAvailable=%@, connectionServers=%@, deviceTopicManager=%@>", v14, self, courierUser, v4, v5, v7, v8, v10, v11];

  return (NSString *)v12;
}

- (id)aps_prettyDescription
{
  id v32 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v3 = +[APSMessageStore sharedInstance];
  unint64_t v4 = [(APSEnvironment *)self->_environment name];
  long long v31 = self;
  CFStringRef v5 = [(APSUserCourier *)self courierUser];
  uint64_t v6 = [v5 pubSubName];
  uint64_t v7 = [v3 allRegisteredChannelsForEnvironment:v4 userName:v6];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v34;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v14 = [v13 channelID];
        long long v15 = [v13 channelTopic];
        long long v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@, topic=%@, checkpoint=%llu>", v14, v15, [v13 checkpoint]);
        [v32 addObject:v16];
      }
      id v10 = [v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v10);
  }
  long long v30 = v8;

  v28 = APSPrettyPrintObject();
  long long v29 = [(NSMutableDictionary *)v31->_proxyClients allValues];
  uint64_t v27 = APSPrettyPrintCollection();
  CFStringRef v17 = @"NO";
  if ([(APSUserCourier *)v31 shouldUseInternet]) {
    CFStringRef v18 = @"YES";
  }
  else {
    CFStringRef v18 = @"NO";
  }
  long long v19 = [(APSUserCourier *)v31 publicToken];
  id v20 = [v19 debugDescription];
  if ([(APSUserCourier *)v31 _isIdentityAvailable]) {
    CFStringRef v17 = @"YES";
  }
  long long v21 = [(APSUserCourier *)v31 connectionServers];
  long long v22 = APSPrettyPrintCollection();
  long long v23 = [(APSTopicManager *)v31->_topicManager logString];
  long long v24 = APSPrettyPrintCollection();
  id v25 = +[NSString stringWithFormat:@"<user=%@, activeClients=%@, shouldUseInternet=%@, publicToken=%@, isIdentityAvailable=%@, connectionServers=%@, deviceTopicManager=%@, channels=%@>", v28, v27, v18, v20, v17, v22, v23, v24];

  return v25;
}

- (id)JSONDebugState
{
  v54[0] = @"enabled";
  uint64_t v3 = +[NSNumber numberWithBool:self->_enabled];
  v54[1] = @"connectedToService";
  v55[0] = v3;
  unint64_t v4 = +[NSNumber numberWithBool:self->_isConnectedToService];
  v55[1] = v4;
  CFStringRef v5 = +[NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:2];
  id v6 = [v5 mutableCopy];

  lastReceivedTopic = self->_lastReceivedTopic;
  if (lastReceivedTopic)
  {
    [v6 setObject:lastReceivedTopic forKeyedSubscript:@"lastReceivedTopic"];
    id v8 = +[NSNumber numberWithDouble:self->_lastReceivedTopicTime];
    [v6 setObject:v8 forKeyedSubscript:@"lastReceivedTopicTime"];
  }
  if (self->_lastClientRequestedKeepaliveTime != 0.0)
  {
    id v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v6 setObject:v9 forKeyedSubscript:@"lastKeepaliveRequestTime"];

    [(NSDate *)self->_timeSinceLastKeepAlive timeIntervalSinceReferenceDate];
    id v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v6 setObject:v10 forKeyedSubscript:@"lastKeepaliveResponseTime"];
  }
  v40 = v6;
  uint64_t v11 = +[APSMessageStore sharedInstance];
  __int16 v12 = [(APSEnvironment *)self->_environment name];
  CFStringRef v39 = self;
  long long v13 = [(APSUserCourier *)self courierUser];
  uint64_t v14 = [v13 pubSubName];
  long long v15 = [v11 allRegisteredChannelsForEnvironment:v12 userName:v14];

  id v16 = objc_alloc_init((Class)NSMutableDictionary);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = v15;
  id v17 = [obj countByEnumeratingWithState:&v46 objects:v53 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v47;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v47 != v19) {
          objc_enumerationMutation(obj);
        }
        long long v21 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        long long v22 = [v21 channelTopic];
        long long v23 = [v16 objectForKeyedSubscript:v22];

        if (!v23)
        {
          long long v24 = +[NSMutableArray array];
          id v25 = [v21 channelTopic];
          [v16 setObject:v24 forKeyedSubscript:v25];
        }
        id v26 = [v21 channelTopic];
        uint64_t v27 = [v16 objectForKeyedSubscript:v26];
        v51[0] = @"channel";
        v28 = [v21 channelID];
        v51[1] = @"checkpoint";
        v52[0] = v28;
        long long v29 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v21 checkpoint]);
        v52[1] = v29;
        long long v30 = +[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:2];
        [v27 addObject:v30];
      }
      id v18 = [obj countByEnumeratingWithState:&v46 objects:v53 count:16];
    }
    while (v18);
  }

  [v40 setObject:v16 forKeyedSubscript:@"channels"];
  id v31 = objc_alloc_init((Class)NSMutableArray);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v32 = [(APSUserCourier *)v39 connectionServers];
  id v33 = [v32 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v33)
  {
    id v34 = v33;
    uint64_t v35 = *(void *)v43;
    do
    {
      for (j = 0; j != v34; j = (char *)j + 1)
      {
        if (*(void *)v43 != v35) {
          objc_enumerationMutation(v32);
        }
        CFStringRef v37 = [*(id *)(*((void *)&v42 + 1) + 8 * (void)j) JSONDebugState];
        [v31 addObject:v37];
      }
      id v34 = [v32 countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v34);
  }

  [v40 setObject:v31 forKeyedSubscript:@"connectionServers"];
  return v40;
}

- (void)appendPrettyStatusToStatusPrinter:(id)a3
{
  id v4 = a3;
  if (self->_isConnectedToService)
  {
    CFStringRef v5 = @"Connected";
  }
  else if (self->_enabled)
  {
    if (self->_disconnectingStream)
    {
      CFStringRef v5 = @"Disconnecting";
    }
    else if ([(APSUserCourier *)self _hasListeningTopics])
    {
      if ([(APSUserCourier *)self _isIdentityAvailable]) {
        CFStringRef v5 = @"Unknown";
      }
      else {
        CFStringRef v5 = @"Not connected because the device identity is not available";
      }
    }
    else
    {
      CFStringRef v5 = @"Not connected because there are no eligible topics";
    }
  }
  else
  {
    CFStringRef v5 = @"Disabled";
  }
  [v4 appendDescription:@"courier status" stringValue:v5];
  [v4 pushIndent];
  [v4 appendDescription:@"enabled" BOOLValue:self->_enabled];
  id v6 = [(APSUserCourier *)self protocolConnectionEstablisher];
  objc_msgSend(v4, "appendDescription:BOOLValue:", @"stream connected", objc_msgSend(v6, "countOpenConnections") != 0);

  objc_msgSend(v4, "appendDescription:BOOLValue:", @"stream connected", -[APSUserCourier hasConnectedInterface](self, "hasConnectedInterface"));
  [v4 appendDescription:@"connected to service" BOOLValue:self->_isConnectedToService];
  [v4 pushIndent];
  if (self->_successfulConnectionCount >= 1) {
    objc_msgSend(v4, "appendDescription:unsignedIntegerValue:", @"successful connections");
  }
  [v4 popIndent];
  if (self->_lastReceivedTopic)
  {
    objc_msgSend(v4, "appendDescription:stringValue:", @"last received topic");
    [v4 appendDescription:@"last received topic time" timeIntervalValue:self->_lastReceivedTopicTime];
  }
  if (self->_lastClientRequestedKeepaliveTime != 0.0)
  {
    objc_msgSend(v4, "appendDescription:timeIntervalValue:", @"last keepalive request time");
    [v4 appendDescription:@"last keepalive response time" dateValue:self->_timeSinceLastKeepAlive];
  }
  if (+[APSTCPStream isKeepAliveProxyFeatureEnabled]
    && [(APSUserCourier *)self _requestKeepAliveProxy])
  {
    if (self->_lastReceivedTopicToCauseWake)
    {
      long long v88 = 0u;
      long long v89 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      uint64_t v7 = self->_topicsToCauseWake;
      id v8 = [(NSCountedSet *)v7 countByEnumeratingWithState:&v86 objects:v96 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = 0;
        uint64_t v11 = *(void *)v87;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v87 != v11) {
              objc_enumerationMutation(v7);
            }
            v10 += [(NSCountedSet *)self->_topicsToCauseWake countForObject:*(void *)(*((void *)&v86 + 1) + 8 * i)];
          }
          id v9 = [(NSCountedSet *)v7 countByEnumeratingWithState:&v86 objects:v96 count:16];
        }
        while (v9);
      }
      else
      {
        uint64_t v10 = 0;
      }

      [v4 appendDescription:@"total push wakes" unsignedIntegerValue:v10];
      [v4 pushIndent];
      [v4 appendDescription:@"last push wake topic" stringValue:self->_lastReceivedTopicToCauseWake];
      [v4 appendDescription:@"last push wake time" timeIntervalValue:self->_lastReceivedTopicToCauseWakeTime];
      objc_msgSend(v4, "appendDescription:unsignedIntegerValue:", @"push wake topics", -[NSCountedSet count](self->_topicsToCauseWake, "count"));
      [v4 pushIndent];
      long long v84 = 0u;
      long long v85 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      long long v13 = self->_topicsToCauseWake;
      id v14 = [(NSCountedSet *)v13 countByEnumeratingWithState:&v82 objects:v95 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v83;
        do
        {
          for (j = 0; j != v15; j = (char *)j + 1)
          {
            if (*(void *)v83 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v82 + 1) + 8 * (void)j);
            [v4 appendDescription:@"push wake topic" stringValue:v18];
            [v4 pushIndent];
            objc_msgSend(v4, "appendDescription:unsignedIntegerValue:", @"push wakes", -[NSCountedSet countForObject:](self->_topicsToCauseWake, "countForObject:", v18));
            if ([(NSCountedSet *)self->_offendingTopics containsObject:v18]) {
              objc_msgSend(v4, "appendDescription:unsignedIntegerValue:", @"offending messages", -[NSCountedSet countForObject:](self->_offendingTopics, "countForObject:", v18));
            }
            [v4 popIndent];
          }
          id v15 = [(NSCountedSet *)v13 countByEnumeratingWithState:&v82 objects:v95 count:16];
        }
        while (v15);
      }

      [v4 popIndent];
      [v4 popIndent];
    }
    [v4 pushIndent];
    if (self->_findKeepAliveProxyInterfaceFailureCount) {
      objc_msgSend(v4, "appendDescription:unsignedIntegerValue:", @"interface available failures");
    }
    if (self->_forceKeepAliveProxyInterfaceFailureCount) {
      objc_msgSend(v4, "appendDescription:unsignedIntegerValue:", @"interface switch failures");
    }
    if (self->_obtainKeepAliveProxyFailureCount) {
      objc_msgSend(v4, "appendDescription:unsignedIntegerValue:", @"proxy request failures");
    }
    [v4 popIndent];
  }
  if ([(APSUserCourier *)self isInteractivePushDuringSleepEnabled]) {
    objc_msgSend(v4, "appendDescription:BOOLValue:", @"interactive push", -[APSUserCourier isInteractivePushDuringSleepEnabled](self, "isInteractivePushDuringSleepEnabled"));
  }
  if ([(NSCountedSet *)self->_inhibitedTopics count])
  {
    objc_msgSend(v4, "appendDescription:unsignedIntegerValue:", @"inhibited topics", -[NSCountedSet count](self->_inhibitedTopics, "count"));
    [v4 pushIndent];
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    uint64_t v19 = self->_inhibitedTopics;
    id v20 = [(NSCountedSet *)v19 countByEnumeratingWithState:&v78 objects:v94 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v79;
      do
      {
        for (k = 0; k != v21; k = (char *)k + 1)
        {
          if (*(void *)v79 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v78 + 1) + 8 * (void)k);
          [v4 appendDescription:@"inhibited topic" stringValue:v24];
          [v4 pushIndent];
          objc_msgSend(v4, "appendDescription:unsignedIntegerValue:", @"inhibited messages", -[NSCountedSet countForObject:](self->_inhibitedTopics, "countForObject:", v24));
          [v4 popIndent];
        }
        id v21 = [(NSCountedSet *)v19 countByEnumeratingWithState:&v78 objects:v94 count:16];
      }
      while (v21);
    }

    [v4 popIndent];
  }
  [(APSOutgoingMessageQueue *)self->_outgoingMessageQueue appendPrettyStatusToStatusPrinter:v4];
  id v25 = +[APSMessageStore sharedInstance];
  id v26 = [(APSEnvironment *)self->_environment name];
  uint64_t v27 = [(APSUserCourier *)self courierUser];
  v28 = [v27 pubSubName];
  long long v29 = [v25 allRegisteredChannelsForEnvironment:v26 userName:v28];

  objc_msgSend(v4, "appendDescription:unsignedLongLongValue:", @"subscribed channels", objc_msgSend(v29, "count"));
  [v4 pushIndent];
  id v30 = objc_alloc_init((Class)NSMutableDictionary);
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id obj = v29;
  id v31 = [obj countByEnumeratingWithState:&v74 objects:v93 count:16];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v75;
    do
    {
      for (m = 0; m != v32; m = (char *)m + 1)
      {
        if (*(void *)v75 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v35 = *(void **)(*((void *)&v74 + 1) + 8 * (void)m);
        long long v36 = [v35 channelTopic];
        CFStringRef v37 = [v30 objectForKeyedSubscript:v36];

        if (!v37)
        {
          __int16 v38 = +[NSMutableArray array];
          CFStringRef v39 = [v35 channelTopic];
          [v30 setObject:v38 forKeyedSubscript:v39];
        }
        v40 = [v35 channelTopic];
        v41 = [v30 objectForKeyedSubscript:v40];
        [v41 addObject:v35];
      }
      id v32 = [obj countByEnumeratingWithState:&v74 objects:v93 count:16];
    }
    while (v32);
  }
  v57 = self;

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v61 = v30;
  id v60 = [v61 countByEnumeratingWithState:&v70 objects:v92 count:16];
  if (v60)
  {
    uint64_t v59 = *(void *)v71;
    do
    {
      for (n = 0; n != v60; n = (char *)n + 1)
      {
        if (*(void *)v71 != v59) {
          objc_enumerationMutation(v61);
        }
        uint64_t v43 = *(void *)(*((void *)&v70 + 1) + 8 * (void)n);
        [v4 pushIndent];
        long long v44 = [v61 objectForKeyedSubscript:v43];
        objc_msgSend(v4, "appendDescription:unsignedLongLongValue:", v43, objc_msgSend(v44, "count"));
        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        id v45 = v44;
        id v46 = [v45 countByEnumeratingWithState:&v66 objects:v91 count:16];
        if (v46)
        {
          id v47 = v46;
          uint64_t v48 = *(void *)v67;
          do
          {
            for (ii = 0; ii != v47; ii = (char *)ii + 1)
            {
              if (*(void *)v67 != v48) {
                objc_enumerationMutation(v45);
              }
              uint64_t v50 = *(void **)(*((void *)&v66 + 1) + 8 * (void)ii);
              [v4 pushIndent];
              v51 = [v50 channelID];
              [v4 appendDescription:@"channel" stringValue:v51];

              [v4 pushIndent];
              objc_msgSend(v4, "appendDescription:unsignedLongLongValue:", @"checkpoint", objc_msgSend(v50, "checkpoint"));
              [v4 popIndent];
              [v4 popIndent];
            }
            id v47 = [v45 countByEnumeratingWithState:&v66 objects:v91 count:16];
          }
          while (v47);
        }

        [v4 popIndent];
      }
      id v60 = [v61 countByEnumeratingWithState:&v70 objects:v92 count:16];
    }
    while (v60);
  }

  [v4 popIndent];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  v52 = [(APSUserCourier *)v57 connectionServers];
  id v53 = [v52 countByEnumeratingWithState:&v62 objects:v90 count:16];
  if (v53)
  {
    id v54 = v53;
    uint64_t v55 = *(void *)v63;
    do
    {
      for (jj = 0; jj != v54; jj = (char *)jj + 1)
      {
        if (*(void *)v63 != v55) {
          objc_enumerationMutation(v52);
        }
        [*(id *)(*((void *)&v62 + 1) + 8 * (void)jj) appendPrettyStatusToStatusPrinter:v4];
      }
      id v54 = [v52 countByEnumeratingWithState:&v62 objects:v90 count:16];
    }
    while (v54);
  }

  [v4 popIndent];
}

- (void)setSymptomReporter:(id)a3
{
}

- (void)_triggerAutoBugCaptureIfMessageIsRetried:(id)a3
{
  id v4 = a3;
  if (sub_10007E748())
  {
    CFStringRef v5 = [v4 topic];
    unsigned int v6 = [v5 isEqualToString:@"com.apple.madrid"];

    if (v6)
    {
      uint64_t v7 = [v4 userInfo];
      id v8 = [v7 objectForKey:@"rc"];
      int v9 = [v8 intValue];

      if (v9 >= 1)
      {
        uint64_t v10 = +[APSLog courier];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = [v7 objectForKey:@"U"];
          __int16 v12 = [v7 objectForKey:@"rc"];
          *(_DWORD *)buf = 138412546;
          uint64_t v18 = v11;
          __int16 v19 = 1024;
          unsigned int v20 = [v12 intValue];
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "triggering ABC for message with guid %@ retry count %d", buf, 0x12u);
        }
        if (!self->_symptomReporter)
        {
          long long v13 = objc_alloc_init(APSSymptomReporter);
          symptomReporter = self->_symptomReporter;
          self->_symptomReporter = v13;
        }
        id v15 = [v7 objectForKey:@"rc"];
        uint64_t v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"RetryCount%d", [v15 intValue]);

        [(APSSymptomReporter *)self->_symptomReporter reportSymptomToAutoBugCapture:@"RetriedMessage" subType:v16];
      }
    }
  }
}

- (void)_dumpLogsForInconsistencyIfNecessary
{
  if ((APSUserCourier *)qword_10015A840 == self)
  {
    +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"__dumpLogsForInconsistencyIfNecessary" object:0];
    [(APSUserCourier *)self performSelector:"__dumpLogsForInconsistencyIfNecessary" withObject:0 afterDelay:1.0];
  }
}

- (void)__dumpLogsForInconsistencyIfNecessary
{
  double Current = CFAbsoluteTimeGetCurrent();
  if (Current - *(double *)&qword_10015A860 > 7200.0)
  {
    id v4 = (void *)qword_10015A858;
    qword_10015A858 = 0;
  }
  CFStringRef v5 = +[APSLog courier];
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);

  if (v6)
  {
    uint64_t v7 = qword_10015A868;
    qword_10015A868 = 0;
    uint64_t v19 = 0;
    unsigned int v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000277EC;
    v18[3] = &unk_10012A820;
    v18[4] = &v19;
    [(APSUserCourier *)self enumerateConnectedProtocolConnectionsOfType:1 block:v18];
    if (*((unsigned char *)v20 + 24))
    {
      qword_10015A868 = *(void *)&Current;
      CFStringRef v8 = @"APSD - WiFi LQ is OFF but wifi reachability is YES";
    }
    else
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      LOBYTE(v24) = 0;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100027860;
      v17[3] = &unk_10012A820;
      v17[4] = buf;
      [(APSUserCourier *)self enumerateConnectedProtocolConnectionsOfType:0 block:v17];
      if (*(unsigned char *)(*(void *)&buf[8] + 24))
      {
        qword_10015A868 = *(void *)&Current;
        CFStringRef v8 = @"APSD - WWAN LQ is OFF but WWAN reachability is YES";
      }
      else
      {
        CFStringRef v8 = 0;
      }
      _Block_object_dispose(buf, 8);
    }
    int v9 = +[APSLog courier];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = qword_10015A868;
      *(_WORD *)&buf[22] = 2112;
      CFStringRef v24 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "__dumpLogsForInconsistencyIfNecessary - lastBecameInconsistentTime %f  sBecameInconsistentTime %f  logDumpReason %@", buf, 0x20u);
    }

    double v10 = 1.0;
    if (*(double *)&v7 > 1.0)
    {
      double v10 = *(double *)&qword_10015A868 - *(double *)&v7;
      if (*(double *)&qword_10015A868 - *(double *)&v7 > 60.0)
      {
        BOOL v11 = v8 != 0;
LABEL_18:
        __int16 v12 = +[PCSimpleTimer lastSystemWakeDate];
        [v12 timeIntervalSinceReferenceDate];
        BOOL v14 = v13 <= *(double *)&v7;

        if (v8) {
          BOOL v15 = v11;
        }
        else {
          BOOL v15 = 0;
        }
        if (v15 && v14 && ([(id)qword_10015A858 isEqualToString:v8] & 1) == 0)
        {
          uint64_t v16 = (void *)qword_10015A858;
          qword_10015A858 = (uint64_t)v8;

          qword_10015A860 = *(void *)&Current;
        }
        _Block_object_dispose(&v19, 8);
        return;
      }
      if (v8)
      {
        BOOL v11 = 0;
        qword_10015A868 = v7;
        goto LABEL_18;
      }
    }
    BOOL v11 = 0;
    goto LABEL_18;
  }
}

- (void)_logTopics
{
  if (+[APSLog shouldPowerLogEvent:@"Courier Topics Changed"])
  {
    uint64_t v43 = v3;
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    CFStringRef v5 = [(APSEnvironment *)self->_environment name];
    BOOL v6 = +[NSString stringWithFormat:@"%@", v5];
    [v4 setObject:v6 forKey:@"Environment"];

    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id obj = [(APSUserCourier *)self connectionServers];
    id v46 = [obj countByEnumeratingWithState:&v68 objects:v76 count:16];
    if (v46)
    {
      uint64_t v45 = *(void *)v69;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v69 != v45) {
            objc_enumerationMutation(obj);
          }
          uint64_t v49 = v7;
          CFStringRef v8 = *(void **)(*((void *)&v68 + 1) + 8 * v7);
          id v9 = objc_alloc_init((Class)NSMutableString);
          id v10 = objc_alloc_init((Class)NSMutableString);
          id v11 = objc_alloc_init((Class)NSMutableString);
          uint64_t v50 = v8;
          id v51 = objc_alloc_init((Class)NSMutableString);
          long long v64 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          __int16 v12 = [v8 enabledTopics];
          id v13 = [v12 countByEnumeratingWithState:&v64 objects:v75 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v65;
            CFStringRef v16 = &stru_10012F350;
            do
            {
              for (i = 0; i != v14; i = (char *)i + 1)
              {
                if (*(void *)v65 != v15) {
                  objc_enumerationMutation(v12);
                }
                [v9 appendFormat:@"%@%@", v16, *(void *)(*((void *)&v64 + 1) + 8 * i)];
                CFStringRef v16 = @", ";
              }
              id v14 = [v12 countByEnumeratingWithState:&v64 objects:v75 count:16];
              CFStringRef v16 = @", ";
            }
            while (v14);
          }

          long long v62 = 0u;
          long long v63 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          uint64_t v18 = [v50 ignoredTopics];
          id v19 = [v18 countByEnumeratingWithState:&v60 objects:v74 count:16];
          if (v19)
          {
            id v20 = v19;
            uint64_t v21 = *(void *)v61;
            CFStringRef v22 = &stru_10012F350;
            do
            {
              for (j = 0; j != v20; j = (char *)j + 1)
              {
                if (*(void *)v61 != v21) {
                  objc_enumerationMutation(v18);
                }
                [v10 appendFormat:@"%@%@", v22, *(void *)(*((void *)&v60 + 1) + 8 * (void)j)];
                CFStringRef v22 = @", ";
              }
              id v20 = [v18 countByEnumeratingWithState:&v60 objects:v74 count:16];
              CFStringRef v22 = @", ";
            }
            while (v20);
          }

          long long v58 = 0u;
          long long v59 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          CFStringRef v24 = [v50 opportunisticTopics];
          id v25 = [v24 countByEnumeratingWithState:&v56 objects:v73 count:16];
          if (v25)
          {
            id v26 = v25;
            uint64_t v27 = *(void *)v57;
            CFStringRef v28 = &stru_10012F350;
            do
            {
              for (k = 0; k != v26; k = (char *)k + 1)
              {
                if (*(void *)v57 != v27) {
                  objc_enumerationMutation(v24);
                }
                [v11 appendFormat:@"%@%@", v28, *(void *)(*((void *)&v56 + 1) + 8 * (void)k)];
                CFStringRef v28 = @", ";
              }
              id v26 = [v24 countByEnumeratingWithState:&v56 objects:v73 count:16];
              CFStringRef v28 = @", ";
            }
            while (v26);
          }

          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          id v30 = [v50 nonWakingTopics];
          id v31 = [v30 countByEnumeratingWithState:&v52 objects:v72 count:16];
          if (v31)
          {
            id v32 = v31;
            uint64_t v33 = *(void *)v53;
            CFStringRef v34 = &stru_10012F350;
            do
            {
              for (m = 0; m != v32; m = (char *)m + 1)
              {
                if (*(void *)v53 != v33) {
                  objc_enumerationMutation(v30);
                }
                [v51 appendFormat:@"%@%@", v34, *(void *)(*((void *)&v52 + 1) + 8 * (void)m)];
                CFStringRef v34 = @", ";
              }
              id v32 = [v30 countByEnumeratingWithState:&v52 objects:v72 count:16];
              CFStringRef v34 = @", ";
            }
            while (v32);
          }

          long long v36 = [v50 processName];
          id v47 = +[NSString stringWithFormat:@"%@(enabledTopics)", v36];

          [v4 setObject:v9 forKey:v47];
          CFStringRef v37 = [v50 processName];
          __int16 v38 = +[NSString stringWithFormat:@"%@(ignoredTopics)", v37];

          [v4 setObject:v10 forKey:v38];
          CFStringRef v39 = [v50 processName];
          v40 = +[NSString stringWithFormat:@"%@(opportunisticTopics)", v39];

          [v4 setObject:v11 forKey:v40];
          v41 = [v50 processName];
          long long v42 = +[NSString stringWithFormat:@"%@(nonWakingTopics)", v41];

          [v4 setObject:v51 forKey:v42];
          uint64_t v7 = v49 + 1;
        }
        while ((id)(v49 + 1) != v46);
        id v46 = [obj countByEnumeratingWithState:&v68 objects:v76 count:16];
      }
      while (v46);
    }

    APSPowerLog();
    uint64_t v3 = v43;
  }
}

- (void)addConnection:(id)a3
{
  id v4 = a3;
  [(APSUserCourier *)self _useInteractivePowerAssertionIfNeededForConnectionServer:v4 withReason:@"adding interactive"];
  if (v4) {
    [(NSMutableArray *)self->_connectionServers addObject:v4];
  }
  CFStringRef v5 = [(APSUserCourier *)self publicToken];
  [(APSUserCourier *)self _recreateCacheDictionaries];
  BOOL v6 = +[APSLog courier];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412802;
    CFStringRef v8 = self;
    __int16 v9 = 2112;
    id v10 = v4;
    __int16 v11 = 2112;
    __int16 v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ adding connectionserver %@, setting publicToken:%@", (uint8_t *)&v7, 0x20u);
  }

  [v4 setPublicToken:v5 needsAck:0];
  objc_msgSend(v4, "setMessageSize:", -[APSUserCourier messageSize](self, "messageSize"));
  objc_msgSend(v4, "setLargeMessageSize:", -[APSUserCourier largeMessageSize](self, "largeMessageSize"));
}

- (id)connectionForConnectionPortName:(id)a3
{
  return [(NSMutableDictionary *)self->_connectionPortNamesToConnections objectForKey:a3];
}

- (void)removeConnectionForConnectionPortName:(id)a3
{
  id v4 = [(NSMutableDictionary *)self->_connectionPortNamesToConnections objectForKey:a3];
  if (v4)
  {
    id v5 = v4;
    [v4 close];
    [(APSUserCourier *)self connectionWasClosed:v5];
    id v4 = v5;
  }
}

- (void)connectionTopicsChanged:(id)a3
{
  id v5 = a3;
  id v4 = [v5 ignoredTopics];
  [(APSUserCourier *)self handleIgnoredTopics:v4];

  [(APSUserCourier *)self _recreateCacheDictionaries];
  [(APSUserCourier *)self _processStoredIncomingMessagesForConnection:v5];
}

- (void)_processStoredIncomingMessagesForConnection:(id)a3
{
  if (self->_enabled)
  {
    id v4 = a3;
    +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"__processStoredIncomingMessagesForConnection:" object:v4];
    [(APSUserCourier *)self performSelector:"__processStoredIncomingMessagesForConnection:" withObject:v4 afterDelay:10.0];
  }
}

- (void)__processStoredIncomingMessagesForConnection:(id)a3
{
  id v4 = a3;
  id v5 = [(APSUserCourier *)self _getCurrentTokens];
  BOOL v6 = +[APSMessageStore sharedInstance];
  int v7 = [v6 incomingMessagesForTopic:0 priority:10 environment:self->_environment pushTokens:v5];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      __int16 v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        -[APSUserCourier _notifyForIncomingMessage:forConnection:](self, "_notifyForIncomingMessage:forConnection:", *(void *)(*((void *)&v14 + 1) + 8 * (void)v12), v4, (void)v14);
        __int16 v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v10);
  }

  id v13 = +[APSLog courier];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v19 = self;
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@: __processStoredIncomingMessageForConnection: %@", buf, 0x16u);
  }
}

- (void)connectionWasClosed:(id)a3
{
  id v4 = a3;
  id v5 = +[APSLog courier];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    __int16 v12 = self;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: Removing connection server %@", (uint8_t *)&v11, 0x16u);
  }

  [v4 setDelegate:0];
  if (v4) {
    [(NSMutableArray *)self->_connectionServers removeObject:v4];
  }
  BOOL v6 = [(APSUserCourier *)self connectionServers];
  id v7 = [v6 count];

  if (!v7)
  {
    id v8 = +[APSLog courier];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      __int16 v12 = self;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: Removed final connection server for user %@", (uint8_t *)&v11, 0x16u);
    }
  }
  id v9 = [(APSUserCourier *)self protocolConnectionEstablisher];
  [v9 recalculateCriticalReliability];

  id v10 = +[APSLog courier];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    __int16 v12 = self;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@: Recalculating activity tracking following connection close: %@", (uint8_t *)&v11, 0x16u);
  }

  [(APSUserCourier *)self recalculateTrackActivityPresence];
  [(APSTopicManager *)self->_topicManager removeTopicsForConnectionServer:v4];
  [(APSUserCourier *)self _recreateCacheDictionaries];
  [(APSUserCourier *)self _performIdleCheck];
}

- (void)connectionWasOpened:(id)a3
{
  id v4 = a3;
  id v5 = +[APSLog courier];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = [v4 connection];
    int v7 = 138412802;
    id v8 = self;
    __int16 v9 = 2112;
    id v10 = v4;
    __int16 v11 = 2112;
    __int16 v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ %@ has established new xpc connection %@", (uint8_t *)&v7, 0x20u);
  }
  [(APSUserCourier *)self _processStoredIncomingMessagesForConnection:v4];
}

- (void)_performIdleCheck
{
  dispatch_time_t v3 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100028700;
  block[3] = &unk_10012A5E0;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)__performIdleCheck
{
  unint64_t v3 = [(APSUserCourier *)self _countActiveClients];
  id v4 = +[APSLog courier];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(NSMutableArray *)self->_connectionServers count];
    int v7 = 138412802;
    id v8 = self;
    __int16 v9 = 2048;
    unint64_t v10 = v3;
    __int16 v11 = 2048;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ _performIdleCheck activeClients %lu  connections %lu", (uint8_t *)&v7, 0x20u);
  }

  if (!v3 && ![(NSMutableArray *)self->_connectionServers count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained courierHasNoConnections:self];
  }
  [(APSUserCourier *)self _processShouldRunChangeIfNecessary];
}

- (BOOL)connectionDelegateIsConnectedToService:(id)a3
{
  return self->_isConnectedToService;
}

- (BOOL)connectionDelegateHasConnectedUser:(id)a3
{
  return self->_isConnectedToService && [(APSUserCourier *)self overallCourierStatus] == 0;
}

- (void)connectionChangedCriticalReliability:(id)a3
{
  id v4 = a3;
  id v5 = [(APSUserCourier *)self protocolConnectionEstablisher];
  [v5 recalculateCriticalReliability];

  LODWORD(v5) = [v4 enableCriticalReliability];
  if (v5)
  {
    BOOL v6 = [(APSUserCourier *)self protocolConnectionEstablisher];
    [v6 refreshCriticalReliability];

    if (qword_10015A838 != -1) {
      dispatch_once(&qword_10015A838, &stru_10012A788);
    }
    if (byte_10015A830)
    {
      id v7 = [(APSUserCourier *)self protocolConnectionEstablisher];
      [v7 triggerCriticalReliability];
    }
  }
}

- (void)connectionChangedTrackActivityPresence:(id)a3
{
  id v4 = a3;
  id v5 = +[APSLog courier];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    id v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: Recalculating activity tracking following connection change: %@", (uint8_t *)&v6, 0x16u);
  }

  [(APSUserCourier *)self recalculateTrackActivityPresence];
}

- (void)_enqueueMessage:(id)a3 forOriginator:(id)a4
{
  id v6 = a3;
  [(APSOutgoingMessageQueue *)self->_outgoingMessageQueue enqueueOutgoingMessage:v6 forOriginator:a4];
  id v7 = +[APSLog courier];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 messageID];
    id v9 = [v6 topic];
    *(_DWORD *)buf = 138412802;
    uint64_t v18 = self;
    __int16 v19 = 2048;
    id v20 = v8;
    __int16 v21 = 2112;
    CFStringRef v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: Deciding when to send outgoing message %lu with topic '%@'", buf, 0x20u);
  }
  if ([(APSUserCourier *)self isConnectedToService])
  {
    if ([(APSUserCourier *)self overallCourierStatus])
    {
      unint64_t v10 = +[APSLog courier];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v18 = self;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@: Possibly connecting user because there is a queued outgoing message", buf, 0xCu);
      }

      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100028CA8;
      v16[3] = &unk_10012A848;
      v16[4] = self;
      [(APSUserCourier *)self enumerateConnectedProtocolConnectionsOfType:1 block:v16];
    }
    else
    {
      [(APSUserCourier *)self _sendOutgoingMessage:v6 onProtocolConnection:0];
    }
  }
  else
  {
    __int16 v11 = +[APSLog courier];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = self;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@: Possibly connecting because there is a queued outgoing message", buf, 0xCu);
    }

    id v12 = [(APSUserCourier *)self delegate];
    __int16 v13 = [v12 proxyManager];
    unsigned int v14 = [v13 canUseProxy];

    if (v14)
    {
      long long v15 = [(APSUserCourier *)self delegate];
      [v15 kickstartProxyConnection];
    }
    else
    {
      long long v15 = [(APSUserCourier *)self protocolConnectionEstablisher];
      [v15 adjustConnectionsIfNeeded];
    }
  }
}

- (void)connection:(id)a3 subscribeToPreviouslyIgnoredTopics:(id)a4
{
}

- (void)connection:(id)a3 didReceiveOutgoingMessageToSend:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[APSLog courierOversized];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v28 = [v7 messageID];
    id v9 = [v7 topic];
    id v27 = [v7 timeout];
    if ([v7 isCritical]) {
      CFStringRef v10 = @"yes";
    }
    else {
      CFStringRef v10 = @"no";
    }
    id v11 = [v7 identifier];
    id v12 = [v7 userInfo];
    [v7 topic];
    v14 = __int16 v13 = self;
    long long v15 = sub_10008D708(v12, v14);
    *(_DWORD *)buf = 138413826;
    id v30 = v13;
    __int16 v31 = 2048;
    id v32 = v28;
    __int16 v33 = 2112;
    CFStringRef v34 = v9;
    __int16 v35 = 2048;
    id v36 = v27;
    __int16 v37 = 2112;
    CFStringRef v38 = v10;
    __int16 v39 = 2048;
    id v40 = v11;
    __int16 v41 = 2112;
    long long v42 = v15;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: Received outgoing message %lu to send with topic '%@', timeout %lu, critical %@, identifier %lu, and userInfo '%@'", buf, 0x48u);

    self = v13;
  }

  [v7 setOriginator:v6];
  long long v16 = [v6 enabledTopics];
  long long v17 = [v7 topic];
  if ([v16 containsObject:v17]) {
    goto LABEL_9;
  }
  uint64_t v18 = [v6 opportunisticTopics];
  __int16 v19 = [v7 topic];
  if ([v18 containsObject:v19])
  {

LABEL_9:
LABEL_10:
    [(APSUserCourier *)self _enqueueMessage:v7 forOriginator:v6];
    goto LABEL_11;
  }
  id v20 = [v6 nonWakingTopics];
  __int16 v21 = [v7 topic];
  unsigned __int8 v22 = [v20 containsObject:v21];

  if (v22) {
    goto LABEL_10;
  }
  long long v23 = +[APSLog courier];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    id v24 = [v7 messageID];
    id v25 = [v7 topic];
    *(_DWORD *)buf = 138412802;
    id v30 = self;
    __int16 v31 = 2048;
    id v32 = v24;
    __int16 v33 = 2112;
    CFStringRef v34 = v25;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%@: Dropping outgoing message %lu because topic is not enabled '%@'", buf, 0x20u);
  }
  id v26 = APSError();
  objc_msgSend(v6, "handleResult:forSendingOutgoingMessageWithID:", v26, objc_msgSend(v7, "messageID"));

LABEL_11:
}

- (void)connection:(id)a3 didReceiveSubscribeToChannels:(id)a4 forTopic:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(APSUserCourier *)self publicToken];
  [(APSUserCourier *)self subscribeToChannels:v8 forTopic:v7 token:v9];
}

- (void)connection:(id)a3 didReceiveUnsubscribeToChannels:(id)a4 forTopic:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(APSUserCourier *)self publicToken];
  [(APSUserCourier *)self unsubscribeFromChannels:v8 forTopic:v7 token:v9];
}

- (void)connection:(id)a3 didReceiveCancellationForOutgoingMessageWithID:(unint64_t)a4
{
  id v6 = +[APSLog courier];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = self;
    __int16 v9 = 2048;
    unint64_t v10 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: Received cancellation for outgoing message %lu", (uint8_t *)&v7, 0x16u);
  }

  [(APSOutgoingMessageQueue *)self->_outgoingMessageQueue cancelOutgoingMessageWithID:a4];
}

- (void)connection:(id)a3 didReceiveFakeMessageToSend:(id)a4
{
  id v5 = a4;
  id v6 = [v5 topic];
  int v7 = +[APSLog courier];
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412802;
      id v46 = self;
      __int16 v47 = 2112;
      uint64_t v48 = v6;
      __int16 v49 = 2048;
      id v50 = [v5 priority];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: Delivering fake message for topic '%@' priority '%lld'", buf, 0x20u);
    }

    __int16 v9 = [APSIncomingMessage alloc];
    unint64_t v10 = [v5 userInfo];
    id v11 = [(APSIncomingMessage *)v9 initWithTopic:v6 userInfo:v10];

    id v12 = [v5 correlationIdentifier];
    __int16 v37 = v11;
    [(APSIncomingMessage *)v11 setCorrelationIdentifier:v12];

    __int16 v13 = [v5 timestamp];

    __int16 v35 = v6;
    if (v13) {
      [v5 timestamp];
    }
    else {
    long long v15 = +[NSDate date];
    }
    [(APSIncomingMessage *)v11 setTimestamp:v15];

    -[APSIncomingMessage setPushType:](v11, "setPushType:", [v5 pushType]);
    -[APSIncomingMessage setPushFlags:](v11, "setPushFlags:", [v5 pushFlags]);
    long long v16 = [v5 channelID];
    [(APSIncomingMessage *)v11 setChannelID:v16];

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    CFStringRef v34 = self;
    long long v17 = self;
    unsigned int v14 = v11;
    id obj = [(APSUserCourier *)v17 connectionServers];
    id v18 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v39 = *(void *)v41;
      do
      {
        id v20 = 0;
        do
        {
          if (*(void *)v41 != v39) {
            objc_enumerationMutation(obj);
          }
          __int16 v21 = *(void **)(*((void *)&v40 + 1) + 8 * (void)v20);
          unsigned __int8 v22 = [v21 enabledTopics];
          long long v23 = [v21 opportunisticTopics];
          id v24 = [v21 nonWakingTopics];
          id v25 = [v5 topic];
          if (([v22 containsObject:v25] & 1) == 0
            && ([v22 containsObject:@"*"] & 1) == 0)
          {
            id v26 = v5;
            id v27 = [v5 topic];
            if (([v23 containsObject:v27] & 1) == 0
              && ([v23 containsObject:@"*"] & 1) == 0)
            {
              id v28 = [v26 topic];
              if (![v24 containsObject:v28])
              {
                unsigned __int8 v36 = [v24 containsObject:@"*"];

                id v5 = v26;
                unsigned int v14 = v37;
                if ((v36 & 1) == 0) {
                  goto LABEL_25;
                }
                goto LABEL_22;
              }
            }
            id v5 = v26;
            unsigned int v14 = v37;
          }

LABEL_22:
          long long v29 = [v21 publicToken];
          [v14 setToken:v29];

          id v30 = +[APSLog courier];
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v31 = [v14 token];
            id v32 = [v14 topic];
            *(_DWORD *)buf = 138412546;
            id v46 = v31;
            __int16 v47 = 2112;
            uint64_t v48 = v32;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Assigning a token to the fake message. Token being assigned: %@, topic of the fake message: %@", buf, 0x16u);
          }
LABEL_25:

          id v20 = (char *)v20 + 1;
        }
        while (v19 != v20);
        id v33 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
        id v19 = v33;
      }
      while (v33);
    }

    if ([v5 priority] == (id)1) {
      [v14 setPriority:1];
    }
    [(APSUserCourier *)v34 _notifyForIncomingMessage:v14];
    id v6 = v35;
  }
  else if (v8)
  {
    *(_DWORD *)buf = 138412546;
    id v46 = self;
    __int16 v47 = 2112;
    uint64_t v48 = 0;
    unsigned int v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: Received fake message with missing topic %@", buf, 0x16u);
  }
  else
  {
    unsigned int v14 = v7;
  }
}

- (void)connection:(id)a3 handleAckIncomingMessageWithGuid:(id)a4 topic:(id)a5 tracingUUID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  unsigned int v14 = +[APSLog courier];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138413058;
    __int16 v21 = self;
    __int16 v22 = 2112;
    id v23 = v10;
    __int16 v24 = 2112;
    id v25 = v11;
    __int16 v26 = 2112;
    id v27 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@ informed that %@ acknowledges incoming message with guid %@ tracingUUID %@", (uint8_t *)&v20, 0x2Au);
  }

  [(APSTTLCollection *)self->_tracingEnabledAcksCollection removeItem:v13 withFlag:1];
  long long v15 = +[APSMessageStore sharedInstance];
  [v15 deleteIncomingMessageWithGUID:v11];

  if (v13)
  {
    long long v16 = [(APSUserCourier *)self preferredProtocolConnection];
    if (v16)
    {
      topicHasher = self->_topicHasher;
      id v18 = [v10 user];
      id v19 = [(APSTopicHasher *)topicHasher topicHashForTopic:v12 user:v18];

      [v16 sendMessageTracingAckWithTopicHash:v19 topic:v12 tracingUUID:v13 status:1 token:0];
    }
    else
    {
      id v19 = +[APSLog courier];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        int v20 = 138412802;
        __int16 v21 = self;
        __int16 v22 = 2112;
        id v23 = v12;
        __int16 v24 = 2112;
        id v25 = v13;
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@ trying to send message tracing framework ack but we currently don't have connected interface. {topic: %@; tracingUUID: %@}",
          (uint8_t *)&v20,
          0x20u);
      }
    }
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessageReceiptWithTopic:(id)a4 tracingUUID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  __int16 v9 = +[APSLog courier];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412802;
    long long v15 = self;
    __int16 v16 = 2112;
    id v17 = v7;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ handling incoming message receipt. {topic:%@, tracingUUID:%@}", (uint8_t *)&v14, 0x20u);
  }

  [(APSTTLCollection *)self->_tracingEnabledAcksCollection removeItem:v8 withFlag:2];
  id v10 = [(APSUserCourier *)self preferredProtocolConnection];
  if (v10)
  {
    topicHasher = self->_topicHasher;
    id v12 = [(APSUserCourier *)self courierUser];
    id v13 = [(APSTopicHasher *)topicHasher topicHashForTopic:v7 user:v12];

    [v10 sendMessageTracingAckWithTopicHash:v13 topic:v7 tracingUUID:v8 status:2 token:0];
  }
  else
  {
    id v13 = +[APSLog courier];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412802;
      long long v15 = self;
      __int16 v16 = 2112;
      id v17 = v7;
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@ trying to send message tracing application ack but we currently don't have connected interface. {topic: %@; tracingUUID: %@}",
        (uint8_t *)&v14,
        0x20u);
    }
  }
}

- (void)connection:(id)a3 setKeepAliveConfiguration:(unint64_t)a4
{
  id v5 = [(APSUserCourier *)self protocolConnectionEstablisher];
  [v5 setKeepAliveConfiguration:a4];
}

- (void)connectionDidClientDisconnect:(id)a3
{
  id v4 = a3;
  if ([(APSUserCourier *)self isIdle])
  {
    id v5 = +[APSLog courier];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412546;
      id v8 = self;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: Client disconnected from %@ and courier is idle", (uint8_t *)&v7, 0x16u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained courierIsIdle:self];
  }
}

- (void)ttlCollection:(id)a3 itemsDidExpire:(id)a4 withStates:(id)a5
{
  id v12 = a5;
  if ([a4 count])
  {
    id v6 = +[NSURL URLWithString:@"tap-to-radar://new?Title=Missing%20CloudKit%20Push&Description=Missing%20both%20acks&ComponentID=297783&ComponentName=Apple%20Push%20Service&ComponentVersion=New%20Bugs&AutoDiagnostics=phone,watch&Classification=Other%20Bug&Reproducibility=Not%20Applicable"];
    int v7 = [v12 firstObject];
    unsigned __int8 v8 = [v7 unsignedIntValue];

    if ((v8 & 2) != 0)
    {
      if (v8)
      {
LABEL_7:
        id v11 = +[APSDiagnostic sharedInstance];
        [v11 promptTapToRadarWithURL:v6];

        goto LABEL_8;
      }
      CFStringRef v9 = @"tap-to-radar://new?Title=Missing%20CloudKit%20Push&Description=Missing%20app%20ack&ComponentID=297783&ComponentName=Apple%20Push%20Service&ComponentVersion=New%20Bugs&AutoDiagnostics=phone,watch&Classification=Other%20Bug&Reproducibility=Not%20Applicable";
    }
    else
    {
      CFStringRef v9 = @"tap-to-radar://new?Title=Missing%20CloudKit%20Push&Description=Missing%20framework%20ack&ComponentID=297783&ComponentName=Apple%20Push%20Service&ComponentVersion=New%20Bugs&AutoDiagnostics=phone,watch&Classification=Other%20Bug&Reproducibility=Not%20Applicable";
    }
    uint64_t v10 = +[NSURL URLWithString:v9];

    id v6 = (void *)v10;
    goto LABEL_7;
  }
LABEL_8:
}

- (void)invalidateDeviceIdentity
{
  unint64_t v3 = +[APSLog courier];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ invalidateDeviceIdentity", (uint8_t *)&v4, 0xCu);
  }

  [(APSUserCourier *)self _processInvalidIdentity];
}

- (void)periodicSignalFired
{
  unint64_t v3 = +[APSLog courier];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v37 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ periodicSignalFired", buf, 0xCu);
  }

  int v4 = +[APSMessageStore sharedInstance];
  [v4 deleteStaleIncomingLowPriorityMessagesForEnvironment:self->_environment];

  uint64_t v5 = [(APSUserCourier *)self _getCurrentTokens];
  id v6 = +[APSMessageStore sharedInstance];
  id v27 = (void *)v5;
  int v7 = [v6 incomingMessagesForTopic:0 priority:1 environment:self->_environment pushTokens:v5];

  unsigned __int8 v8 = +[APSLog courier];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v7 count];
    *(_DWORD *)buf = 138412546;
    __int16 v37 = self;
    __int16 v38 = 2048;
    id v39 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ examining %lu low priority incoming messages", buf, 0x16u);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v7;
  id v10 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v31;
    do
    {
      id v13 = 0;
      id v28 = v11;
      do
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(obj);
        }
        int v14 = *(void **)(*((void *)&v30 + 1) + 8 * (void)v13);
        long long v15 = [v14 topic];
        __int16 v16 = [v14 token];
        topicHasher = self->_topicHasher;
        __int16 v18 = [(APSUserCourier *)self courierUser];
        id v19 = [(APSTopicHasher *)topicHasher topicHashForTopic:v15 user:v18];

        int v20 = self->_topicManager;
        __int16 v21 = [(APSTopicManager *)v20 hasTopicHash:v19];

        if (!v21)
        {
          uint64_t v22 = v12;
          id v23 = +[APSLog courier];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            __int16 v37 = self;
            __int16 v38 = 2112;
            id v39 = v15;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%@ our filter lacks %@, deleting all low priority messages for this topic.", buf, 0x16u);
          }

          __int16 v24 = +[APSMessageStore sharedInstance];
          environment = self->_environment;
          CFStringRef v34 = v16;
          __int16 v26 = +[NSArray arrayWithObjects:&v34 count:1];
          [v24 deleteLowPriorityIncomingMessagesForTopic:v15 environment:environment pushTokens:v26];

          uint64_t v12 = v22;
          id v11 = v28;
        }

        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v11);
  }
}

- (id)_findActiveClientWithToken:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v5 = self->_proxyClients;
    id v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = -[NSMutableDictionary objectForKey:](self->_proxyClients, "objectForKey:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
          uint64_t v11 = [v10 publicToken];
          if (v11)
          {
            uint64_t v12 = (void *)v11;
            id v13 = [v10 publicToken];
            if ([v13 isEqualToData:v4])
            {
              unsigned __int8 v14 = [v10 isActive];

              if (v14) {
                goto LABEL_15;
              }
            }
            else
            {
            }
          }
        }
        id v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }
    id v10 = 0;
LABEL_15:
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)_findConnectedClientWithToken:(id)a3 onProtocolConnection:(id)a4
{
  id v6 = a3;
  id v18 = a4;
  if (v6)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id obj = self->_proxyClients;
    id v7 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = -[NSMutableDictionary objectForKey:](self->_proxyClients, "objectForKey:", *(void *)(*((void *)&v20 + 1) + 8 * i), v18);
          uint64_t v12 = [v11 publicToken];
          if (v12)
          {
            id v13 = (void *)v12;
            unsigned __int8 v14 = [v11 publicToken];
            if ([v14 isEqualToData:v6])
            {
              long long v15 = [v18 identifier];
              unsigned __int8 v16 = [v11 isConnectedOnInterface:v15];

              if (v16) {
                goto LABEL_15;
              }
            }
            else
            {
            }
          }
        }
        id v8 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v8);
    }
    uint64_t v11 = 0;
LABEL_15:
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)_findClientWithToken:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v5 = self->_proxyClients;
    id v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v17;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = -[NSMutableDictionary objectForKey:](self->_proxyClients, "objectForKey:", *(void *)(*((void *)&v16 + 1) + 8 * v9), (void)v16);
        uint64_t v11 = [v10 publicToken];
        if (v11)
        {
          uint64_t v12 = (void *)v11;
          id v13 = [v10 publicToken];
          unsigned __int8 v14 = [v13 isEqualToData:v4];

          if (v14) {
            break;
          }
        }

        if (v7 == (id)++v9)
        {
          id v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (unint64_t)_countActiveClients
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v3 = self->_proxyClients;
  id v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = -[NSMutableDictionary objectForKey:](self->_proxyClients, "objectForKey:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
        v6 += [v9 isActive];
      }
      id v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)_countConnectedClients
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v3 = self->_proxyClients;
  id v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = -[NSMutableDictionary objectForKey:](self->_proxyClients, "objectForKey:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
        v6 += [v9 isConnected];
      }
      id v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (void)canUseProxyChanged
{
  unint64_t v3 = +[APSLog courier];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ canUseProxyChanged!", (uint8_t *)&v4, 0xCu);
  }

  [(APSUserCourier *)self _processShouldUseInternetChangeIfNecessary];
}

- (void)incomingPresenceWithGuid:(id)a3 token:(id)a4 hwVersion:(id)a5 swVersion:(id)a6 swBuild:(id)a7 certificate:(id)a8 nonce:(id)a9 signature:(id)a10
{
  long long v16 = (APSProxyClient *)a3;
  id v17 = a4;
  id v33 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  long long v23 = +[APSLog courier];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    __int16 v35 = self;
    __int16 v36 = 2112;
    __int16 v37 = v16;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%@ incoming device presence %@", buf, 0x16u);
  }

  if (v16)
  {
    proxyClients = self->_proxyClients;
    if (!proxyClients)
    {
      id v25 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      __int16 v26 = self->_proxyClients;
      self->_proxyClients = v25;

      proxyClients = self->_proxyClients;
    }
    id v27 = [(NSMutableDictionary *)proxyClients objectForKey:v16];
    id v28 = +[APSLog courier];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v35 = self;
      __int16 v36 = 2112;
      __int16 v37 = v27;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%@ received presence for client %@", buf, 0x16u);
    }

    if (!v27)
    {
      long long v32 = [(APSUserCourier *)self _findClientWithToken:v17];
      [v32 invalidate];
      id v27 = [[APSProxyClient alloc] initWithEnvironment:self->_environment guid:v16];
      [(NSMutableDictionary *)self->_proxyClients setObject:v27 forKey:v16];
      [(APSProxyClient *)v27 setMessageSize:[(APSEnvironment *)self->_environment messageSize]];
      [(APSProxyClient *)v27 setLargeMessageSize:[(APSEnvironment *)self->_environment largeMessageSize]];
      long long v29 = [(APSUserCourier *)self _proxyManager];
      [(APSProxyClient *)v27 setProxyManager:v29];

      [(APSProxyClient *)v27 setDelegate:self];
      long long v30 = +[APSLog courier];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        __int16 v35 = self;
        __int16 v36 = 2112;
        __int16 v37 = v27;
        __int16 v38 = 2112;
        id v39 = v16;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%@ made new client %@ for %@", buf, 0x20u);
      }
    }
    [(APSProxyClient *)v27 incomingPresenceWithCertificate:v20 nonce:v21 signature:v22 token:v17 hwVersion:v33 swVersion:v18 swBuild:v19];
    unsigned __int8 v31 = [(APSUserCourier *)self _processPendingProxyPresences];
    [(APSUserCourier *)self _processShouldRunChangeIfNecessary];
    if ((v31 & 1) == 0 && ![(APSProxyClient *)v27 isInvalid]) {
      [(APSProxyClient *)v27 noteIsConnected];
    }
  }
}

- (void)_clearPendingProxyPresence
{
  proxyClientWithOutstandingPresence = self->_proxyClientWithOutstandingPresence;
  self->_proxyClientWithOutstandingPresence = 0;

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v4 = self->_proxyClients;
  id v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        long long v11 = -[NSMutableDictionary objectForKey:](self->_proxyClients, "objectForKey:", v10, (void)v13);
        if ([v11 isInvalid]
          && ([v11 needsToDisconnect] & 1) == 0)
        {
          if (!v7) {
            id v7 = objc_alloc_init((Class)NSMutableArray);
          }
          [v7 addObject:v10];
        }
      }
      id v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v6);

    if (v7)
    {
      long long v12 = +[APSLog courier];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v18 = self;
        __int16 v19 = 2112;
        id v20 = v7;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ Removing clients %@", buf, 0x16u);
      }

      [(NSMutableDictionary *)self->_proxyClients removeObjectsForKeys:v7];
    }
  }
  else
  {

    id v7 = 0;
  }
  [(APSUserCourier *)self _processPendingProxyPresences];
}

- (BOOL)_processPendingProxyPresences
{
  if ([(APSUserCourier *)self hasConnectedInterface]) {
    BOOL v3 = self->_proxyClientWithOutstandingPresence == 0;
  }
  else {
    BOOL v3 = 0;
  }
  int v4 = +[APSLog courier];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (v3) {
      CFStringRef v5 = @"YES";
    }
    else {
      CFStringRef v5 = @"NO";
    }
    unsigned int v6 = [(APSUserCourier *)self hasConnectedInterface];
    proxyClientWithOutstandingPresence = self->_proxyClientWithOutstandingPresence;
    if (v6) {
      CFStringRef v8 = @"YES";
    }
    else {
      CFStringRef v8 = @"NO";
    }
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v5;
    *(_WORD *)&buf[22] = 2112;
    long long v70 = (uint64_t (*)(uint64_t, uint64_t))v8;
    LOWORD(v71) = 2112;
    *(void *)((char *)&v71 + 2) = proxyClientWithOutstandingPresence;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ _processPendingProxyPresences - canSendPresence? %@ hasConnectedConnection %@  outstandingClient %@", buf, 0x2Au);
  }

  if (v3)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    long long v70 = sub_10002B6DC;
    *(void *)&long long v71 = sub_10002B6EC;
    *((void *)&v71 + 1) = 0;
    uint64_t v57 = 0;
    long long v58 = &v57;
    uint64_t v59 = 0x3032000000;
    long long v60 = sub_10002B6DC;
    long long v61 = sub_10002B6EC;
    id v62 = 0;
    uint64_t v51 = 0;
    long long v52 = (double *)&v51;
    uint64_t v53 = 0x3032000000;
    long long v54 = sub_10002B6DC;
    long long v55 = sub_10002B6EC;
    id v56 = 0;
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_10002B6F4;
    v50[3] = &unk_10012A870;
    v50[4] = self;
    v50[5] = &v57;
    v50[6] = &v51;
    v50[7] = buf;
    [(APSUserCourier *)self enumerateConnectedProtocolConnections:v50];
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      uint64_t v9 = +[APSLog courier];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(APSProxyClient **)(*(void *)&buf[8] + 40);
        *(_DWORD *)long long v63 = 138412546;
        long long v64 = self;
        __int16 v65 = 2112;
        long long v66 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ client %@ needs to disconnect", v63, 0x16u);
      }

      long long v11 = (void *)*((void *)v52 + 5);
      long long v12 = [*(id *)(*(void *)&buf[8] + 40) publicToken];
      long long v13 = [*(id *)(*(void *)&buf[8] + 40) hwVersion];
      long long v14 = [*(id *)(*(void *)&buf[8] + 40) swVersion];
      long long v15 = [*(id *)(*(void *)&buf[8] + 40) swBuild];
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_10002BA80;
      v49[3] = &unk_10012A898;
      v49[4] = self;
      v49[5] = &v51;
      [v11 sendConnectMessageWithToken:v12 state:2 presenceFlags:0 hwVersion:v13 swVersion:v14 swBuild:v15 certificates:0 nonce:0 signature:0 withCompletion:v49];

      long long v16 = *(void **)(*(void *)&buf[8] + 40);
      id v17 = [*((id *)v52 + 5) identifier];
      [v16 setState:3 onInterface:v17];

      objc_storeStrong((id *)&self->_proxyClientWithOutstandingPresence, *(id *)(*(void *)&buf[8] + 40));
      id v18 = +[APSLog courier];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v19 = self->_proxyClientWithOutstandingPresence;
        double v20 = v52[5];
        *(_DWORD *)long long v63 = 138412802;
        long long v64 = self;
        __int16 v65 = 2112;
        long long v66 = v19;
        __int16 v67 = 2114;
        double v68 = v20;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@ sending presence offline for client %@ on interface %{public}@", v63, 0x20u);
      }
    }
    else
    {
      if (!v58[5])
      {
        BOOL v21 = 0;
LABEL_38:
        _Block_object_dispose(&v51, 8);

        _Block_object_dispose(&v57, 8);
        _Block_object_dispose(buf, 8);

        return v21;
      }
      id v22 = +[APSLog courier];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        long long v23 = (APSProxyClient *)v58[5];
        double v24 = [(APSProxyClient *)v23 lastPresence];
        *(_DWORD *)long long v63 = 138412802;
        long long v64 = self;
        __int16 v65 = 2112;
        long long v66 = v23;
        __int16 v67 = 2112;
        double v68 = v24;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%@ client %@ needs to connect. LastPresence %@", v63, 0x20u);
      }
      id v25 = [(id)v58[5] lastPresence];
      [v25 timeIntervalSinceNow];
      double v27 = v26;

      id v28 = +[NSMutableArray array];
      long long v29 = [(id)v58[5] certificate];

      if (v29)
      {
        long long v30 = [(id)v58[5] certificate];
        [v28 addObject:v30];
      }
      if ([(APSUserCourier *)self locallyDisabledFilterOptimization]) {
        int v31 = 0;
      }
      else {
        int v31 = _os_feature_enabled_impl();
      }
      long long v32 = (void *)*((void *)v52 + 5);
      id v33 = [(id)v58[5] publicToken];
      if (v31) {
        uint64_t v34 = 0x2000;
      }
      else {
        uint64_t v34 = 0;
      }
      __int16 v35 = [(id)v58[5] hwVersion];
      __int16 v36 = [(id)v58[5] swVersion];
      __int16 v37 = [(id)v58[5] swBuild];
      __int16 v38 = [(id)v58[5] nonce];
      id v39 = [(id)v58[5] signature];
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_10002BA98;
      v48[3] = &unk_10012A898;
      v48[4] = self;
      v48[5] = &v51;
      [v32 sendConnectMessageWithToken:v33 state:1 presenceFlags:v34 hwVersion:v35 swVersion:v36 swBuild:v37 certificates:v28 nonce:v38 signature:v39 withCompletion:v48];

      long long v40 = +[APSLog courier];
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        long long v41 = [(id)v58[5] publicToken];
        *(_DWORD *)long long v63 = 138412802;
        long long v64 = self;
        __int16 v65 = 2112;
        long long v66 = v41;
        __int16 v67 = 2048;
        double v68 = fabs(v27);
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%@: Sending client connect message with token '%@' presence age %f", v63, 0x20u);
      }
      long long v42 = (void *)v58[5];
      long long v43 = [*((id *)v52 + 5) identifier];
      [v42 setState:1 onInterface:v43];

      objc_storeStrong((id *)&self->_proxyClientWithOutstandingPresence, (id)v58[5]);
      long long v44 = +[APSLog courier];
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v45 = self->_proxyClientWithOutstandingPresence;
        double v46 = v52[5];
        *(_DWORD *)long long v63 = 138412802;
        long long v64 = self;
        __int16 v65 = 2112;
        long long v66 = v45;
        __int16 v67 = 2114;
        double v68 = v46;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%@ sending presence online for client %@ on interface %{public}@", v63, 0x20u);
      }
    }
    BOOL v21 = 1;
    goto LABEL_38;
  }
  return 0;
}

- (void)_sendClientFilter:(id)a3 onProtocolConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v8 = [v6 topics];
  if (v8 && ([v6 publicToken], uint64_t v9 = objc_claimAutoreleasedReturnValue(), v9, v9))
  {
    uint64_t v10 = [v8 hashesToEnabledTopics];
    long long v11 = [(APSUserCourier *)self _topicsByHashFromTopicStateDictionary:v10];

    long long v12 = [v8 hashesToIgnoredTopics];
    id v50 = [(APSUserCourier *)self _topicsByHashFromTopicStateDictionary:v12];

    long long v13 = [v8 hashesToOpportunisticTopics];
    long long v14 = [(APSUserCourier *)self _topicsByHashFromTopicStateDictionary:v13];

    long long v15 = [v8 hashesToNonWakingTopics];
    long long v16 = [(APSUserCourier *)self _topicsByHashFromTopicStateDictionary:v15];

    id v17 = [v8 hashesToPausedTopics];
    id v18 = [(APSUserCourier *)self _topicsByHashFromTopicStateDictionary:v17];

    __int16 v19 = [v6 filterVersionStateMachine];
    double v20 = [v7 identifier];
    id v53 = 0;
    id v46 = [v19 versionToSendFor:v20 error:&v53];
    __int16 v49 = (APSUserCourier *)v53;

    BOOL v21 = +[APSLog courierOversized];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      long long v41 = APSPrettyPrintCollection();
      APSPrettyPrintCollection();
      id v22 = v40 = v11;
      APSPrettyPrintCollection();
      long long v23 = v14;
      id v25 = v24 = v16;
      APSPrettyPrintCollection();
      double v26 = v47 = v7;
      APSPrettyPrintCollection();
      double v27 = v43 = v24;
      *(_DWORD *)buf = 138414338;
      long long v55 = self;
      __int16 v56 = 2112;
      id v57 = v6;
      __int16 v58 = 2048;
      id v59 = v46;
      __int16 v60 = 2112;
      long long v61 = v41;
      __int16 v62 = 2112;
      long long v63 = v22;
      __int16 v64 = 2112;
      __int16 v65 = v25;
      __int16 v66 = 2112;
      __int16 v67 = v26;
      __int16 v68 = 2112;
      long long v69 = v27;
      __int16 v70 = 2114;
      id v71 = v47;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%@: sending filter for client %@ with version %llu with enabled topics = %@, opportunistic topics = %@, non-waking topics = %@, paused topics = %@, ignored topics = %@ on interface %{public}@", buf, 0x5Cu);

      long long v14 = v23;
      id v7 = v47;

      long long v16 = v43;
      long long v11 = v40;
    }
    id v28 = v49;
    if (v49)
    {
      long long v29 = +[APSLog courier];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v55 = v49;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Error fetching filter version for proxy client; disconnecting {versionError: %@}",
          buf,
          0xCu);
      }

      [v7 disconnectWithReason:6];
    }
    else
    {
      unsigned __int8 v42 = [(APSUserCourier *)self expectsResponseForFilterMessageOnProtocolConnection:v7 forClient:v6];
      uint64_t v31 = [v6 publicToken];
      long long v32 = v7;
      id v33 = (void *)v31;
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      void v51[2] = sub_10002C058;
      v51[3] = &unk_10012A8C0;
      v51[4] = self;
      uint64_t v48 = v32;
      id v34 = v32;
      id v52 = v34;
      LOBYTE(v39) = v42;
      long long v44 = v16;
      uint64_t v45 = v14;
      [v34 sendFilterMessageWithEnabledTopicsByHash:v11 ignoredTopicsByHash:v50 opportunisticTopicsByHash:v14 nonWakingTopicsByHash:v16 pausedTopicsByHash:v18 saltsByTopic:0 token:v33 version:v46 expectsResponse:v39 withCompletion:v51];

      __int16 v35 = [v6 filterVersionStateMachine];
      __int16 v36 = [v34 identifier];
      [v35 noteSentWithVersion:v46 on:v36];

      if ((v42 & 1) == 0)
      {
        __int16 v37 = [v6 filterVersionStateMachine];
        __int16 v38 = [v34 identifier];
        [v37 noteAckedWithVersion:v46 on:v38];
      }
      long long v16 = v44;
      long long v14 = v45;
      id v7 = v48;
      id v28 = 0;
    }
  }
  else
  {
    long long v11 = +[APSLog courier];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      long long v30 = [v6 publicToken];
      *(_DWORD *)buf = 138412802;
      long long v55 = self;
      __int16 v56 = 2112;
      id v57 = v6;
      __int16 v58 = 2112;
      id v59 = v30;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ we don't yet have a filter for %@ (token %@).", buf, 0x20u);
    }
  }
}

- (void)pushTokenBecameInvalidForClient:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = +[APSLog courier];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    id v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ pushTokenBecameInvalidForClient %@", (uint8_t *)&v6, 0x16u);
  }

  [(APSUserCourier *)self _forceReconnectionsWithReason:1];
}

- (void)requestFilterForClient:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = +[APSLog courier];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    __int16 v19 = self;
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ requestFilterForClient %@", buf, 0x16u);
  }

  [(APSUserCourier *)self setHasFilterChanged:1];
  if ([(APSUserCourier *)self shouldOnlySendFilterOnPreferredInterface]
    && [v4 shouldOnlySendFilterOnPreferredInterface])
  {
    int v6 = [(APSUserCourier *)self preferredProtocolConnection];
    id v7 = [v6 identifier];
    id v8 = [v4 stateOnInterface:v7];

    if (v8 == (id)2)
    {
      id v9 = [(APSUserCourier *)self preferredProtocolConnection];
      [(APSUserCourier *)self _sendClientFilter:v4 onProtocolConnection:v9];
    }
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10002C358;
    v16[3] = &unk_10012A8E8;
    v16[4] = self;
    id v17 = v4;
    id v10 = v4;
    [(APSUserCourier *)self enumerateConnectedProtocolConnections:v16];
    long long v11 = v17;
  }
  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10002C458;
    v13[3] = &unk_10012A8E8;
    id v14 = v4;
    long long v15 = self;
    id v12 = v4;
    [(APSUserCourier *)self enumerateConnectedProtocolConnections:v13];
    long long v11 = v14;
  }
}

- (void)clientBecameInactive:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = +[APSLog courier];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    id v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ client %@ became inactive. Sending offline status if needed.", (uint8_t *)&v6, 0x16u);
  }

  [(APSUserCourier *)self _processPendingProxyPresences];
  [(APSUserCourier *)self _performIdleCheck];
}

- (void)client:(id)a3 requestPushAckResponse:(id)a4 messageId:(id)a5 token:(id)a6 connectionType:(id)a7 generation:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = [a7 integerValue];
  id v20 = [v18 unsignedIntegerValue];

  if ([(APSUserCourier *)self hasConnectedInterfaceOfType:v19])
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10002C7A0;
    v22[3] = &unk_10012A910;
    id v27 = v20;
    v22[4] = self;
    id v23 = v14;
    id v24 = v15;
    id v25 = v16;
    id v26 = v17;
    [(APSUserCourier *)self enumerateConnectedProtocolConnectionsOfType:v19 block:v22];
  }
  else
  {
    id v21 = +[APSLog courier];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      long long v29 = self;
      __int16 v30 = 2112;
      id v31 = v14;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%@: ignoring a proxied push ack response that is no longer relevant. %@", buf, 0x16u);
    }
  }
}

- (void)client:(id)a3 requestSendOutgoingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = +[APSLog courierOversized];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v7 messageID];
    id v10 = [v7 topic];
    id v11 = [v7 timeout];
    if ([v7 isCritical]) {
      CFStringRef v12 = @"yes";
    }
    else {
      CFStringRef v12 = @"no";
    }
    id v13 = [v7 identifier];
    id v14 = [v7 userInfo];
    *(_DWORD *)buf = 138414082;
    id v31 = self;
    __int16 v32 = 2112;
    id v33 = v6;
    __int16 v34 = 2048;
    id v35 = v9;
    __int16 v36 = 2112;
    __int16 v37 = v10;
    __int16 v38 = 2048;
    id v39 = v11;
    __int16 v40 = 2112;
    CFStringRef v41 = v12;
    __int16 v42 = 2048;
    id v43 = v13;
    __int16 v44 = 2112;
    uint64_t v45 = v14;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: Received proxy %@ outgoing message %lu to send with topic '%@', timeout %lu, critical %@, identifier %lu, and userInfo '%@'", buf, 0x52u);
  }
  [v7 setOriginator:v6];
  id v15 = [v6 topics];
  id v16 = [v15 enabledTopics];
  id v17 = [v7 topic];
  if ([v16 containsObject:v17]) {
    goto LABEL_9;
  }
  id v18 = [v6 topics];
  id v19 = [v18 opportunisticTopics];
  id v20 = [v7 topic];
  if ([v19 containsObject:v20])
  {

LABEL_9:
LABEL_10:
    [(APSUserCourier *)self _enqueueMessage:v7 forOriginator:v6];
    goto LABEL_11;
  }
  id v27 = [v6 topics];
  id v21 = [v27 nonWakingTopics];
  [v7 topic];
  id v22 = v29 = self;
  unsigned __int8 v28 = [v21 containsObject:v22];

  self = v29;
  if (v28) {
    goto LABEL_10;
  }
  id v23 = +[APSLog courier];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    id v24 = [v7 messageID];
    id v25 = [v7 topic];
    *(_DWORD *)buf = 138412802;
    id v31 = v29;
    __int16 v32 = 2048;
    id v33 = v24;
    __int16 v34 = 2112;
    id v35 = v25;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%@: Dropping outgoing message %lu because topic is not enabled '%@'", buf, 0x20u);
  }
  id v26 = APSError();
  [v6 handleResult:v26 forSendingOutgoingMessage:v7];

LABEL_11:
}

- (void)client:(id)a3 requestTokenGenerateWithTopicHash:(id)a4 baseToken:(id)a5 appId:(id)a6 expirationTTL:(id)a7 vapidPublicKeyHash:(id)a8 type:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = +[APSLog courier];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138414082;
    id v43 = self;
    __int16 v44 = 2112;
    id v45 = v15;
    __int16 v46 = 2112;
    id v47 = v16;
    __int16 v48 = 2112;
    id v49 = v17;
    __int16 v50 = 2112;
    id v51 = v18;
    __int16 v52 = 2112;
    id v53 = v19;
    __int16 v54 = 2112;
    id v55 = v20;
    __int16 v56 = 2112;
    id v57 = v21;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%@: Received proxy %@ token generate request with topicHash %@ baseToken %@ appId %@ expiration %@ vapidHash %@ type %@", buf, 0x52u);
  }

  tokenRequestQueue = self->_tokenRequestQueue;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10002CF4C;
  v35[3] = &unk_10012A938;
  v35[4] = self;
  id v36 = v16;
  id v37 = v17;
  id v38 = v18;
  id v39 = v19;
  id v40 = v20;
  id v41 = v21;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10002D084;
  v31[3] = &unk_10012A960;
  v31[4] = self;
  id v32 = v15;
  id v33 = v36;
  id v34 = v38;
  id v24 = v38;
  id v25 = v36;
  id v26 = v15;
  id v27 = v21;
  id v28 = v20;
  id v29 = v19;
  id v30 = v17;
  [(APSOutgoingQueue *)tokenRequestQueue enqueueSendBlock:v35 completionBlock:v31];
}

- (void)client:(id)a3 messageTracingWithStatus:(int)a4 topic:(id)a5 tracingUUID:(id)a6 token:(id)a7
{
  uint64_t v10 = *(void *)&a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = +[APSLog courier];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138413570;
    id v22 = self;
    __int16 v23 = 2112;
    id v24 = v12;
    __int16 v25 = 1024;
    int v26 = v10;
    __int16 v27 = 2112;
    id v28 = v13;
    __int16 v29 = 2112;
    id v30 = v14;
    __int16 v31 = 2112;
    id v32 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@: Received proxy %@ message tracing with status %u topic %@ tracingUUID %@ token %@", (uint8_t *)&v21, 0x3Au);
  }

  id v17 = [(APSUserCourier *)self preferredProtocolConnection];
  if (v17)
  {
    topicHasher = self->_topicHasher;
    id v19 = [(APSUserCourier *)self courierUser];
    id v20 = [(APSTopicHasher *)topicHasher topicHashForTopic:v13 user:v19];

    [v17 sendMessageTracingAckWithTopicHash:v20 topic:v13 tracingUUID:v14 status:v10 token:v15];
  }
  else
  {
    id v20 = +[APSLog courier];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1000C7F4C();
    }
  }
}

- (void)client:(id)a3 sendPubSubChannelList:(id)a4 token:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002D484;
  v9[3] = &unk_10012A988;
  id v10 = a3;
  id v11 = self;
  id v12 = a4;
  id v7 = v12;
  id v8 = v10;
  [(APSUserCourier *)self enumerateConnectedProtocolConnections:v9];
}

- (void)refreshCertNonceAndSignatureWithServerTime:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  id v8 = [(APSUserCourier *)self lastPresence];
  [v8 timeIntervalSinceNow];
  double v10 = v9;

  id v11 = [(APSUserCourier *)self lastPresence];
  if (v6 || !v11)
  {
  }
  else
  {

    if (fabs(v10) <= 240.0)
    {
      if (v7) {
        v7[2](v7, 1);
      }
      goto LABEL_16;
    }
  }
  id v12 = +[NSMutableArray array];
  if (+[APSSimulatorSupport isSimulator])
  {
    id v20 = 0;
    id v21 = 0;
    +[APSSimulatorSupport generateCerts:v12 nonce:&v21 sig:&v20 time:v6];
    id v13 = v21;
    id v14 = v20;
    BOOL v15 = [v12 count] && objc_msgSend(v13, "length") && objc_msgSend(v14, "length") != 0;
    [(APSUserCourier *)self setCertificates:v12];
    [(APSUserCourier *)self setNonce:v13];
    [(APSUserCourier *)self setSignature:v14];
    if (v7) {
      v7[2](v7, v15);
    }
  }
  else
  {
    objc_initWeak(&location, self);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10002D83C;
    v16[3] = &unk_10012A9B0;
    objc_copyWeak(&v18, &location);
    id v17 = v7;
    [(APSUserCourier *)self generateCertWithServerTime:v6 completionBlock:v16];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    id v14 = 0;
    id v13 = 0;
  }

LABEL_16:
}

- (void)_clearCachedSigNonceCert
{
  BOOL v3 = +[APSLog courier];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    CFStringRef v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ client identity may have changed, clear cached sig/nonce/cert", (uint8_t *)&v4, 0xCu);
  }

  [(APSUserCourier *)self setNonce:0];
  [(APSUserCourier *)self setSignature:0];
  [(APSUserCourier *)self setCertificates:0];
  [(APSUserCourier *)self setLastPresence:0];
}

- (void)generateCertWithServerTime:(id)a3 completionBlock:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002DAD0;
  v8[3] = &unk_10012A9D8;
  id v9 = a3;
  double v10 = self;
  id v11 = a4;
  id v6 = v11;
  id v7 = v9;
  [(APSUserCourier *)self getClientIdentityForcingRefresh:0 withCompletion:v8];
}

- (void)getClientIdentityForcingRefresh:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002DD68;
  v9[3] = &unk_10012AA00;
  id v10 = a4;
  id v6 = v10;
  id v7 = objc_retainBlock(v9);
  id v8 = [(APSUserCourier *)self clientIdentityProvider];
  [v8 fetchClientIdentityForcingNewCert:v4 withCompletion:v7];
}

- (BOOL)_isIdentityAvailable
{
  BOOL v2 = [(APSUserCourier *)self clientIdentityProvider];
  unsigned __int8 v3 = [v2 isIdentityAvailable];

  return v3;
}

- (void)_deleteClientIdentityRequestingReplacement
{
  unsigned __int8 v3 = +[APSLog courier];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@: deleting identity", (uint8_t *)&v5, 0xCu);
  }

  [(APSUserCourier *)self _clearCachedSigNonceCert];
  BOOL v4 = [(APSUserCourier *)self clientIdentityProvider];
  [v4 deleteClientIdentityRequestingReplacement];
}

- (void)systemDidLock
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10002DEF4;
  v2[3] = &unk_10012A848;
  v2[4] = self;
  [(APSUserCourier *)self enumerateConnectedProtocolConnectionsOfType:1 block:v2];
}

- (void)systemDidUnlock
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10002E03C;
  v2[3] = &unk_10012A848;
  v2[4] = self;
  [(APSUserCourier *)self enumerateConnectedProtocolConnectionsOfType:1 block:v2];
}

- (void)_processInvalidIdentity
{
  unsigned __int8 v3 = +[APSLog courier];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_1000C7FB4(self, v3);
  }

  [(APSUserCourier *)self setPublicToken:0 fromServer:1];
  [(APSUserCourier *)self _deleteClientIdentityRequestingReplacement];
  [(APSUserCourier *)self _forceReconnectionsWithReason:1];
}

- (BOOL)isConnectedOnUltraConstrainedInterface
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002E290;
  v5[3] = &unk_10012A820;
  v5[4] = &v6;
  [(APSUserCourier *)self enumerateConnectedProtocolConnections:v5];
  BOOL v2 = +[APSLog courier];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_1000C8068();
  }

  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)processIsPowerEfficientToSendChange
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  char v13 = ![(APSUserCourier *)self hasConnectedInterfaceOfType:0];
  if (!*((unsigned char *)v11 + 24))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10002E46C;
    v9[3] = &unk_10012A820;
    void v9[4] = &v10;
    [(APSUserCourier *)self enumerateConnectedProtocolConnectionsOfType:0 block:v9];
  }
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002E4B0;
  v4[3] = &unk_10012A820;
  v4[4] = &v5;
  [(APSUserCourier *)self enumerateConnectedProtocolConnectionsOfType:1 block:v4];
  if (*((unsigned char *)v11 + 24)) {
    BOOL v3 = *((unsigned char *)v6 + 24) != 0;
  }
  else {
    BOOL v3 = 0;
  }
  [(APSTopicManager *)self->_topicManager setIsPowerEfficientToSendFilter:v3];
  _Block_object_dispose(&v5, 8);
  _Block_object_dispose(&v10, 8);
}

- (void)_recreateCacheDictionaries
{
  [(NSMutableDictionary *)self->_connectionPortNamesToConnections removeAllObjects];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v3 = [(APSUserCourier *)self connectionServers];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        char v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        char v9 = [v8 connectionPortName];
        if (v9) {
          [(NSMutableDictionary *)self->_connectionPortNamesToConnections setObject:v8 forKey:v9];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [(APSUserCourier *)self _processShouldRunChangeIfNecessary];
}

- (void)_handleLostPushTokens
{
  if (![(APSUserCourier *)self _processPotentialIdentityChanged])
  {
    BOOL v3 = [(APSUserCourier *)self courierUser];
    unsigned int v4 = [v3 isDefaultUser];

    if (v4)
    {
      id v5 = +[APSLog courier];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 138412290;
        uint64_t v7 = self;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ Client identity is still valid. Reconnect to fetch new push tokens with existing client identity.", (uint8_t *)&v6, 0xCu);
      }

      [(APSUserCourier *)self _forceReconnectionsWithReason:1];
    }
  }
}

- (void)_processStoredIncomingMessages
{
  BOOL v3 = +[APSLog courier];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v4 = @"YES";
    if (!self->_enabled) {
      CFStringRef v4 = @"NO";
    }
    *(_DWORD *)buf = 138412546;
    __int16 v23 = self;
    __int16 v24 = 2112;
    CFStringRef v25 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ _processStoredIncomingMessages: enabled = %@", buf, 0x16u);
  }

  if (self->_enabled)
  {
    id v5 = [(APSUserCourier *)self _getCurrentTokens];
    int v6 = +[APSMessageStore sharedInstance];
    uint64_t v7 = [v6 incomingHighPriorityMessagesForEnvironment:self->_environment pushTokens:v5];

    char v8 = +[APSLog courier];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v9 = (const __CFString *)[v7 count];
      *(_DWORD *)buf = 138412546;
      __int16 v23 = self;
      __int16 v24 = 2048;
      CFStringRef v25 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ processing %lu stored incoming messages", buf, 0x16u);
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v10 = v7;
    id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          -[APSUserCourier _notifyForIncomingMessage:](self, "_notifyForIncomingMessage:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
        }
        id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }

    BOOL v15 = +[APSMessageStore sharedInstance];
    [v15 deleteStaleIncomingLowPriorityMessagesForEnvironment:self->_environment];
  }
  id v16 = +[APSLog courier];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v23 = self;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@ done with _processStoredIncomingMessages", buf, 0xCu);
  }
}

- (void)_processShouldRunChangeIfNecessary
{
  BOOL shouldRun = self->_shouldRun;
  BOOL v4 = [(APSUserCourier *)self shouldRun];
  if (shouldRun != v4)
  {
    BOOL v5 = v4;
    int v6 = +[APSLog courier];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v7 = @"NO";
      if (!shouldRun) {
        CFStringRef v7 = @"YES";
      }
      int v9 = 138412546;
      id v10 = self;
      __int16 v11 = 2112;
      CFStringRef v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ shouldRun did change to %@", (uint8_t *)&v9, 0x16u);
    }

    [(APSUserCourier *)self _processShouldUseInternetChangeIfNecessary];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained userCourier:self hasReasonToConnectChangedTo:v5];
  }
}

- (void)_processShouldUseInternetChangeIfNecessary
{
  BOOL shouldUseInternet = self->_shouldUseInternet;
  BOOL v4 = [(APSUserCourier *)self protocolConnectionEstablisher];
  [v4 adjustConnectionsIfNeeded];

  if ([(APSUserCourier *)self shouldUseInternet] || ![(APSUserCourier *)self shouldRun])
  {
    unsigned __int8 v9 = [(APSUserCourier *)self shouldRun];
    id v10 = +[APSLog courier];
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        *(_DWORD *)buf = 138412290;
        __int16 v23 = self;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@ is no longer in proxy mode.", buf, 0xCu);
      }

      id v16 = _NSConcreteStackBlock;
      uint64_t v17 = 3221225472;
      long long v18 = sub_10002EEEC;
      long long v19 = &unk_10012A848;
      long long v20 = self;
      CFStringRef v12 = &v16;
    }
    else
    {
      if (v11)
      {
        *(_DWORD *)buf = 138412290;
        __int16 v23 = self;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@ no longer need to run, closing proxy if connected", buf, 0xCu);
      }

      CFStringRef v12 = (void ***)&stru_10012AA68;
    }
    -[APSUserCourier enumerateConnectedProtocolConnectionsOfType:block:](self, "enumerateConnectedProtocolConnectionsOfType:block:", 2, v12, v16, v17, v18, v19, v20);
  }
  else
  {
    unsigned int v5 = [(APSUserCourier *)self hasConnectedInterfaceOfType:2];
    int v6 = +[APSLog courier];
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        *(_DWORD *)buf = 138412290;
        __int16 v23 = self;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ should not connect to the internet switching to proxy mode", buf, 0xCu);
      }

      [(APSOutgoingQueue *)self->_tokenRequestQueue handleConnectionOpened];
      outgoingMessageQueue = self->_outgoingMessageQueue;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10002EE0C;
      v21[3] = &unk_10012AA28;
      v21[4] = self;
      [(APSOutgoingMessageQueue *)outgoingMessageQueue transferOwnershipOfPendingMessagesToHandler:v21];
    }
    else
    {
      if (v7)
      {
        *(_DWORD *)buf = 138412290;
        __int16 v23 = self;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ should not connect to the internet but no proxy available", buf, 0xCu);
      }
    }
  }
  if (shouldUseInternet != [(APSUserCourier *)self shouldUseInternet])
  {
    uint64_t v13 = +[APSLog courier];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v14 = @"NO";
      if (!shouldUseInternet) {
        CFStringRef v14 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      __int16 v23 = self;
      __int16 v24 = 2112;
      CFStringRef v25 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@ shouldUseInternet did change to %@", buf, 0x16u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained shouldUseInternetDidChange:self];
  }
}

- (BOOL)_processPotentialIdentityChanged
{
  if ((sub_10007F1B4() & 1) == 0)
  {
    BOOL v3 = [(APSUserCourier *)self clientIdentityProvider];
    unsigned int v4 = [v3 hasUnderlyingIdentityChanged];

    if (!v4) {
      return 0;
    }
  }
  [(APSUserCourier *)self _processInvalidIdentity];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002F00C;
  v6[3] = &unk_10012AA90;
  v6[4] = self;
  [(APSUserCourier *)self getClientIdentityForcingRefresh:0 withCompletion:v6];
  return 1;
}

- (void)rollTokenAndReconnect
{
  BOOL v3 = +[APSLog courier];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    unsigned int v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@: Clearing public token and terminating connection", (uint8_t *)&v4, 0xCu);
  }

  [(APSUserCourier *)self setPublicToken:0 fromServer:1];
  [(APSUserCourier *)self _forceReconnectionsWithReason:14];
}

- (void)rollTokensForAllBAAEnvironments
{
  BOOL v3 = +[APSLog courier];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    int v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@: BAA client identity provider is noting a refresh in BAA certs, noting to daemon to roll tokens for all environments in BAA", (uint8_t *)&v5, 0xCu);
  }

  int v4 = [(APSUserCourier *)self delegate];
  [v4 courierShouldRollBAAEnvironmentTokens:self];
}

- (void)topicManagerRequestToSendFilter:(id)a3 change:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = +[APSLog courier];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v9 = [(APSUserCourier *)self protocolConnectionEstablisher];
    int v10 = 138412802;
    BOOL v11 = self;
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2048;
    id v15 = [v9 countConnectedInterfaces];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ topicManager %@ requested to send filter. Connected on %lu interfaces.", (uint8_t *)&v10, 0x20u);
  }
  [(APSUserCourier *)self setHasFilterChanged:1];
  [(APSUserCourier *)self _requestToSendFilterOnTopicManager:self->_topicManager change:v7];
}

- (id)getConnectionTypeFromProtocolConnection:(id)a3
{
  id v3 = a3;
  int v4 = v3;
  CFStringRef v5 = @"wifi";
  if (v3)
  {
    id v6 = [v3 connectionType];
    CFStringRef v7 = @"proxy";
    if (v6 != (id)2) {
      CFStringRef v7 = @"wifi";
    }
    if (v6) {
      CFStringRef v5 = v7;
    }
    else {
      CFStringRef v5 = @"wwan";
    }
  }

  return (id)v5;
}

- (void)outgoingMessageQueue:(id)a3 lateAcknowledgmentForCriticalOutgoingMessage:(id)a4
{
  id v5 = a4;
  +[NSDate timeIntervalSinceReferenceDate];
  double v7 = v6;
  double v8 = v6 - self->_lastLateCriticalOutgoingMessageAcknowledgmentReconnectTime;
  if (v8 < 0.0 || v8 >= 60.0)
  {
    int v10 = [v5 sendInterfaceIdentifier];
    BOOL v11 = [(APSUserCourier *)self protocolConnectionEstablisher];
    if ([v11 isAttemptingToReconnect])
    {
    }
    else
    {
      unsigned int v12 = [(APSUserCourier *)self hasConnectedInterfaceForIdentifier:v10];

      if (v12)
      {
        id v13 = +[APSLog courier];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 138412802;
          uint64_t v17 = self;
          __int16 v18 = 2048;
          id v19 = [v5 messageID];
          __int16 v20 = 2112;
          id v21 = v10;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@: Reconnecting because ack for critical outgoing message %lu is late. It was sent over %@.", (uint8_t *)&v16, 0x20u);
        }

        __int16 v14 = [(APSUserCourier *)self connectedInterfaceForIdentifier:v10];
        [v14 noteConnectionFailureWithReason:105];

        self->_lastLateCriticalOutgoingMessageAcknowledgmentReconnectTime = v7;
        goto LABEL_14;
      }
    }
    id v15 = +[APSLog courier];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412546;
      uint64_t v17 = self;
      __int16 v18 = 2048;
      id v19 = [v5 messageID];
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@: An acknowledgement for critical outgoing message %lu is late and we are in the middle of a connection attempt - leaving it open.", (uint8_t *)&v16, 0x16u);
    }

LABEL_14:
  }
}

- (void)outgoingMessageQueueShortMessageTimeoutExceeded:(id)a3
{
  if ([(APSUserCourier *)self countOfConnectedInterface] >= 2)
  {
    int v4 = +[APSLog courier];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      double v6 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@: outgoingMessageQueueShortMessageTimeoutExceeded, disconnecting nonCellular", (uint8_t *)&v5, 0xCu);
    }

    [(APSUserCourier *)self enumerateConnectedProtocolConnectionsOfType:1 block:&stru_10012AAB0];
  }
}

- (void)outgoingMessageQueue:(id)a3 requestCriticalMessageFlushWithPaddingLength:(unint64_t)a4
{
  id v6 = a3;
  double v7 = +[APSLog courier];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412802;
    int v10 = self;
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2048;
    unint64_t v14 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ outgoingMessageQueueRequestCriticalMessageFlush %@ withPaddingLength %lu", (uint8_t *)&v9, 0x20u);
  }

  if ([(APSUserCourier *)self hasConnectedInterface])
  {
    double v8 = [(APSUserCourier *)self protocolConnectionEstablisher];
    [v8 sendFlushOnAllConnectionshWithPaddingLength:a4];
  }
}

- (void)outgoingMessageQueue:(id)a3 requestToSendLowPriorityMessages:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = +[APSLog courier];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v21 = self;
    __int16 v22 = 2112;
    id v23 = v6;
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ outgoingMessageQueue %@ requestToSendLowPriorityMessages %@", buf, 0x20u);
  }

  if (self->_isConnectedToService)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = v7;
    id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          -[APSUserCourier _sendOutgoingMessage:onProtocolConnection:](self, "_sendOutgoingMessage:onProtocolConnection:", *(void *)(*((void *)&v15 + 1) + 8 * i), 0, (void)v15);
        }
        id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
  unint64_t v14 = +[APSLog courier];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = self;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@ Done sending requested low priority messages.", buf, 0xCu);
  }
}

- (BOOL)shouldForceShortTimeouts
{
  BOOL v2 = [(APSUserCourier *)self protocolConnectionEstablisher];
  BOOL v3 = (unint64_t)[v2 countConnectedInterfaces] > 1;

  return v3;
}

- (void)clientIdentityDidBecomeAvailable
{
  BOOL v3 = +[APSLog courier];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@: Client identity is available", (uint8_t *)&v6, 0xCu);
  }

  if ([(APSUserCourier *)self _isIdentityAvailable])
  {
    [(APSUserCourier *)self _clearCachedSigNonceCert];
    int v4 = [(APSUserCourier *)self protocolConnectionEstablisher];
    [v4 adjustConnectionsIfNeeded];

    int v5 = [(APSUserCourier *)self delegate];
    [v5 courierIdentityBecameAvailable:self];
  }
}

- (void)clientIdentityDidBecomeUnavailable
{
  BOOL v3 = +[APSLog courier];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    int v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@: Client identity is not available", (uint8_t *)&v5, 0xCu);
  }

  if (![(APSUserCourier *)self _isIdentityAvailable])
  {
    [(APSUserCourier *)self _clearCachedSigNonceCert];
    int v4 = [(APSUserCourier *)self protocolConnectionEstablisher];
    [v4 adjustConnectionsIfNeeded];
  }
  [(APSUserCourier *)self setPublicToken:0 fromServer:1];
}

- (void)prepareForSleep
{
  BOOL v3 = +[APSLog courier];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    int v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@: prepareForSleep", (uint8_t *)&v4, 0xCu);
  }

  self->_preparingForSleep = 1;
  [(APSWakeMetricTracker *)self->_wakeMetricTracker noteSystemWillSleep];
  self->_firstPushSinceWake = 1;
  if (self->_isConnectedToService) {
    [(APSUserCourier *)self _sendActiveStateMessageWithSendAllBlueListMessages:0];
  }
}

- (void)prepareForDarkWake
{
  BOOL v3 = +[APSLog courier];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    int v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@: prepareForDarkWake", (uint8_t *)&v5, 0xCu);
  }

  self->_preparingForSleep = 0;
  +[NSDate timeIntervalSinceReferenceDate];
  self->_startedDarkWake = v4;
  if (self->_isConnectedToService) {
    [(APSUserCourier *)self _sendActiveStateMessageWithSendAllBlueListMessages:1];
  }
}

- (void)prepareForFullWake
{
  BOOL v3 = +[APSLog courier];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    int v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@: prepareForFullWake", (uint8_t *)&v4, 0xCu);
  }

  [(APSWakeMetricTracker *)self->_wakeMetricTracker noteSystemDidFullWakeWhileConnected:self->_isConnectedToService];
  self->_preparingForSleep = 0;
  if (self->_isConnectedToService) {
    [(APSUserCourier *)self _sendActiveStateMessageWithSendAllBlueListMessages:1];
  }
}

- (void)sendTaskControlMessageWithMetadata:(id)a3 messageId:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(APSUserCourier *)self preferredProtocolConnection];
  [v7 sendTaskControlMessageWithMetadata:v6 messageId:a4];
}

- (void)addTaskServer:(id)a3
{
}

- (void)removeTaskServer:(id)a3
{
}

- (unint64_t)getNextTaskMessageId
{
  unint64_t nextTaskMessageId = self->_nextTaskMessageId;
  self->_unint64_t nextTaskMessageId = nextTaskMessageId + 1;
  return nextTaskMessageId;
}

- (void)logout
{
  BOOL v3 = [(APSUser *)self->_courierUser name];
  int v4 = +[APSSystemUser systemUserWithUserID:v3];

  int v5 = &objc_retain_x28_ptr;
  id v6 = +[APSLog courier];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(APSUser *)self->_courierUser name];
    double v8 = [(APSEnvironment *)self->_environment name];
    *(_DWORD *)buf = 138412802;
    id v33 = self;
    __int16 v34 = 2112;
    id v35 = v7;
    __int16 v36 = 2112;
    id v37 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: Logging out user %@ from %@ environment", buf, 0x20u);
  }
  __int16 v24 = v4;
  if ([v4 isGuestUser]) {
    [(APSUserCourier *)self _clearTopicsForGuestUser];
  }
  id v9 = [(APSUserCourier *)self connectionServers];
  id v10 = [v9 copy];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v10;
  id v11 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(obj);
        }
        long long v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v16 = [v5[147] courier];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          [v15 name];
          v18 = long long v17 = v5;
          *(_DWORD *)buf = 138412546;
          id v33 = self;
          __int16 v34 = 2112;
          id v35 = v18;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@: Removing connection %@", buf, 0x16u);

          int v5 = v17;
        }

        [v15 handleConnectionStatusChanged:0];
        [v15 close];
        [(APSUserCourier *)self connectionWasClosed:v15];
      }
      id v12 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v12);
  }

  if ((id)[(APSUserCourier *)self overallCourierStatus] == (id)3)
  {
    int v19 = 0;
    __int16 v20 = v24;
  }
  else
  {
    __int16 v20 = v24;
    if ((id)[(APSUserCourier *)self overallCourierStatus] == (id)4)
    {
      int v19 = 0;
    }
    else
    {
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100030274;
      v26[3] = &unk_10012A848;
      v26[4] = self;
      [(APSUserCourier *)self enumerateConnectedProtocolConnections:v26];
      int v19 = 1;
    }
  }
  if ([v20 isGuestUser]
    && (id)[(APSUserCourier *)self overallCourierStatus] != (id)3)
  {
    id v21 = [v5[147] courier];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v22 = [(APSUser *)self->_courierUser name];
      *(_DWORD *)buf = 138412546;
      id v33 = self;
      __int16 v34 = 2112;
      id v35 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%@: Removing obsolete token for logging out guest user %@", buf, 0x16u);
    }
    [(APSUserCourier *)self setPublicToken:0 fromServer:1];
  }
  if (v19)
  {
    id v23 = [(APSUserCourier *)self protocolConnectionEstablisher];
    [v23 adjustConnectionsIfNeeded];
  }
}

- (void)flush
{
  [(APSUserCourier *)self setPublicToken:0 fromServer:1];
  BOOL v3 = &objc_retain_x28_ptr;
  int v4 = +[APSLog courier];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = [(APSUser *)self->_courierUser name];
    *(_DWORD *)buf = 138412546;
    id v25 = self;
    __int16 v26 = 2112;
    long long v27 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@: Flushing user %@", buf, 0x16u);
  }
  id v6 = [(APSUserCourier *)self connectionServers];
  id v7 = [v6 copy];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v21;
    *(void *)&long long v10 = 138413058;
    long long v19 = v10;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v8);
        }
        unint64_t v14 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v13);
        long long v15 = objc_msgSend(v3[147], "courier", v19, (void)v20);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          long long v16 = [v14 connectionPortName];
          long long v17 = [v14 processName];
          long long v18 = [(APSUser *)self->_courierUser name];
          *(_DWORD *)buf = v19;
          id v25 = self;
          __int16 v26 = 2112;
          long long v27 = v16;
          __int16 v28 = 2112;
          long long v29 = v17;
          __int16 v30 = 2112;
          __int16 v31 = v18;
          _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@: Encountered unexpected connection %@/%@ for user %@", buf, 0x2Au);

          BOOL v3 = &objc_retain_x28_ptr;
        }

        [v14 handleConnectionStatusChanged:0];
        [v14 close];
        [(APSUserCourier *)self connectionWasClosed:v14];
        uint64_t v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v8 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v11);
  }
}

- (void)_clearTopicsForGuestUser
{
  BOOL v3 = +[NSSet set];
  int v4 = +[APSLog courier];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = [(APSUser *)self->_courierUser name];
    *(_DWORD *)buf = 138412546;
    long long v17 = self;
    __int16 v18 = 2112;
    long long v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@: Removing obsolete topics for guest user %@", buf, 0x16u);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = [(APSUserCourier *)self connectionServers];
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) setEnabledTopics:v3 ignoredTopics:v3 opportunisticTopics:v3 nonWakingTopics:v3];
        long long v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  [(APSTopicManager *)self->_topicManager removeAllTopics];
  [(APSUserCourier *)self _requestToSendFilterOnTopicManager:self->_topicManager change:0];
}

- (void)_useInteractivePowerAssertionIfNeededForConnectionServer:(id)a3 withReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(APSUserCourier *)self isIdle]
    && [(APSUserCourier *)self _isInteractivePushDuringSleepEnabledForConnectionServer:v6])
  {
    id v8 = +[APSLog courier];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412802;
      long long v10 = self;
      __int16 v11 = 2112;
      id v12 = v7;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: Enabling interactive power assertions due to %@ connection %@", (uint8_t *)&v9, 0x20u);
    }

    +[APSPowerAssertion_NoHold setUseInteractivePowerAssertion:1];
  }
}

- (void)_tryConnectingOrDisconnectingTokens
{
  if ([(APSUserCourier *)self isConnectableRightNow])
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10003084C;
    v3[3] = &unk_10012A848;
    v3[4] = self;
    [(APSUserCourier *)self enumerateConnectedProtocolConnections:v3];
  }
}

- (APSProtocolConnection)preferredProtocolConnection
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v3 = [(APSUserCourier *)self protocolConnectionByIdentifier];
  int v4 = [v3 allValues];

  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v9 isPreferredInterface])
        {
          id v11 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  int v4 = [(APSUserCourier *)self protocolConnectionByIdentifier];
  long long v10 = [v4 allValues];
  id v11 = [v10 firstObject];

LABEL_11:
  return (APSProtocolConnection *)v11;
}

- (int64_t)countOfConnectedInterface
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v2 = [(APSUserCourier *)self protocolConnectionByIdentifier];
  BOOL v3 = [v2 allValues];

  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    int64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += [*(id *)(*((void *)&v10 + 1) + 8 * i) isConnected];
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (BOOL)hasConnectedInterface
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v2 = [(APSUserCourier *)self protocolConnectionByIdentifier];
  BOOL v3 = [v2 allValues];

  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * i) isConnected])
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v4;
}

- (BOOL)hasProtocolConnectionInterfaceOfType:(int64_t)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(APSUserCourier *)self protocolConnectionByIdentifier];
  uint64_t v5 = [v4 allValues];

  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * i) connectionType] == (id)a3)
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)hasConnectedInterfaceOfType:(int64_t)a3
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(APSUserCourier *)self protocolConnectionByIdentifier];
  uint64_t v5 = [v4 allValues];

  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 isConnected] && objc_msgSend(v10, "connectionType") == (id)a3)
        {
          BOOL v11 = 1;
          goto LABEL_12;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_12:

  return v11;
}

- (BOOL)hasConnectedInterfaceForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(APSUserCourier *)self protocolConnectionByIdentifier];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6 != 0;
}

- (id)connectedInterfaceForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(APSUserCourier *)self protocolConnectionByIdentifier];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)enumerateAllProtocolConnections:(id)a3
{
  id v4 = (void (**)(id, void, char *))a3;
  char v15 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(APSUserCourier *)self protocolConnectionByIdentifier];
  id v6 = [v5 allValues];

  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v12 != v9) {
        objc_enumerationMutation(v6);
      }
      v4[2](v4, *(void *)(*((void *)&v11 + 1) + 8 * v10), &v15);
      if (v15) {
        break;
      }
      if (v8 == (id)++v10)
      {
        id v8 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)enumerateConnectedProtocolConnections:(id)a3
{
  id v4 = (void (**)(id, void *, unsigned char *))a3;
  char v16 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [(APSUserCourier *)self protocolConnectionByIdentifier];
  id v6 = [v5 allValues];

  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v13 != v9) {
        objc_enumerationMutation(v6);
      }
      long long v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
      if ([v11 isConnected])
      {
        v4[2](v4, v11, &v16);
        if (v16) {
          break;
        }
      }
      if (v8 == (id)++v10)
      {
        id v8 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)enumerateConnectedProtocolConnectionsOfType:(int64_t)a3 block:(id)a4
{
  id v6 = (void (**)(id, void *, unsigned char *))a4;
  char v18 = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = [(APSUserCourier *)self protocolConnectionByIdentifier];
  id v8 = [v7 allValues];

  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v15 != v11) {
        objc_enumerationMutation(v8);
      }
      long long v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
      if ([v13 isConnected])
      {
        if ([v13 connectionType] == (id)a3)
        {
          v6[2](v6, v13, &v18);
          if (v18) {
            break;
          }
        }
      }
      if (v10 == (id)++v12)
      {
        id v10 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)beginTrackingProtocolConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(APSUserCourier *)self protocolConnectionByIdentifier];
  id v6 = [v4 identifier];
  id v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    [(APSUserCourier *)self _disconnectTokenWithReason:1000 onProtocolConnection:v4];
    id v8 = +[APSLog courier];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      long long v16 = self;
      __int16 v17 = 2112;
      id v18 = v4;
      id v9 = "%@ begin tracking protocol connection, clearing previous state %@";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, 0x16u);
    }
  }
  else
  {
    id v8 = +[APSLog courier];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      long long v16 = self;
      __int16 v17 = 2112;
      id v18 = v4;
      id v9 = "%@ begin tracking protocol connection %@";
      goto LABEL_6;
    }
  }

  id v10 = [(APSUserCourier *)self protocolConnectionByIdentifier];
  uint64_t v11 = [v4 identifier];
  [v10 setObject:v4 forKeyedSubscript:v11];

  uint64_t v12 = objc_alloc_init(APSUserCourierInterfaceState);
  long long v13 = [(APSUserCourier *)self stateByConnectionIdentifier];
  long long v14 = [v4 identifier];
  [v13 setObject:v12 forKeyedSubscript:v14];

  [(APSUserCourier *)self logStateWithReason:0];
  [v4 addDataListener:self];
  [v4 addStateListener:self];
  [(APSUserCourier *)self _sendPresenceMessageOnProtocolConnection:v4 serverTime:0];
  [(APSUserCourier *)self _processShouldUseInternetChangeIfNecessary];
}

- (id)stateForProtocolConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(APSUserCourier *)self stateByConnectionIdentifier];
  id v6 = [v4 identifier];

  id v7 = [v5 objectForKeyedSubscript:v6];

  return v7;
}

- (void)protocolConnection:(id)a3 didDisconnectWithConnectionState:(int64_t)a4 reason:(unsigned int)a5
{
}

- (void)didRecoverFromSuspensionOnProtocolConnection:(id)a3
{
  id v4 = a3;
  [(APSUserCourier *)self _sendQueuedOutgoingMessages];
  [(APSUserCourier *)self _adjustIsConnectedToService];
  [(APSUserCourier *)self _sendFilterMessageOnProtocolConnection:v4 withReason:5];
}

- (void)didSuspendProtocolConnection:(id)a3
{
  id v8 = a3;
  if (![v8 connectionType] && (objc_msgSend(v8, "isSuspended") & 1) == 0)
  {
    outgoingMessageQueue = self->_outgoingMessageQueue;
    uint64_t v5 = [v8 identifier];
    [(APSOutgoingMessageQueue *)outgoingMessageQueue handleConnectionClosedOnInterface:v5];

    tokenRequestQueue = self->_tokenRequestQueue;
    id v7 = [v8 identifier];
    [(APSOutgoingQueue *)tokenRequestQueue handleConnectionClosedOnInterface:v7];
  }
}

- (void)outgoingDataAboutToSendForProtocolConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[APSLog courier];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    __int16 v36 = self;
    __int16 v37 = 2112;
    id v38 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: informed of pending outgoing data checking if filters should update -- protocol connection %@", buf, 0x16u);
  }

  unsigned __int8 v6 = [(APSUserCourier *)self locallyDisabledFilterOptimization];
  if (v4 && (v6 & 1) == 0)
  {
    unsigned int v7 = [(APSUserCourier *)self hasOutOfDateFilterOnProtocolConnection:v4];
    id v8 = [(APSUserCourier *)self filterVersionStateMachine];
    id v9 = [v4 identifier];
    if ([v8 everSentFilterOn:v9])
    {
      id v10 = [(APSUserCourier *)self stateForProtocolConnection:v4];
      id v11 = [v10 userState];

      if (v11) {
        unsigned int v12 = 0;
      }
      else {
        unsigned int v12 = v7;
      }
      if (v12 == 1)
      {
        long long v13 = +[APSLog courier];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          __int16 v36 = self;
          __int16 v37 = 2114;
          id v38 = v4;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@: Out of date filter, send now on %{public}@", buf, 0x16u);
        }

        [(APSUserCourier *)self _sendFilterMessageOnProtocolConnection:v4 withReason:4];
      }
    }
    else
    {
    }
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = self;
    id obj = [(NSMutableDictionary *)self->_proxyClients allValues];
    id v14 = [obj countByEnumeratingWithState:&v31 objects:v41 count:16];
    if (v14)
    {
      id v16 = v14;
      uint64_t v17 = *(void *)v32;
      *(void *)&long long v15 = 138412802;
      long long v28 = v15;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v32 != v17) {
            objc_enumerationMutation(obj);
          }
          long long v19 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          long long v20 = objc_msgSend(v19, "filterVersionStateMachine", v28);
          long long v21 = [v4 identifier];
          unsigned int v22 = [v20 isOutOfDateOn:v21];

          long long v23 = [v19 filterVersionStateMachine];
          __int16 v24 = [v4 identifier];
          if ([v23 everSentFilterOn:v24])
          {
            id v25 = [v4 identifier];
            unsigned int v26 = [v19 isConnectedOnInterface:v25];

            if ((v22 & v26) == 1)
            {
              long long v27 = +[APSLog courier];
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v28;
                __int16 v36 = v29;
                __int16 v37 = 2112;
                id v38 = v19;
                __int16 v39 = 2114;
                id v40 = v4;
                _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%@: Client %@ has out of date filter, send now on %{public}@", buf, 0x20u);
              }

              [(APSUserCourier *)v29 _sendClientFilter:v19 onProtocolConnection:v4];
            }
          }
          else
          {
          }
        }
        id v16 = [obj countByEnumeratingWithState:&v31 objects:v41 count:16];
      }
      while (v16);
    }
  }
}

- (BOOL)shouldHandleIncomingPush:(id)a3 forProtocolConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v41[0] = @"APSProtocolToken";
  v41[1] = @"APSProtocolPubSubToken";
  v41[2] = @"APSProtocolPubSubUpdateToken";
  +[NSArray arrayWithObjects:v41 count:3];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = [v8 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v37;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v37 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [v6 objectForKey:*(void *)(*((void *)&v36 + 1) + 8 * i)];
        if (v13)
        {
          id v14 = (void *)v13;
          goto LABEL_11;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_11:

  uint64_t v15 = [v6 objectForKey:@"APSProtocolBaseToken"];
  id v16 = (void *)v15;
  if (v15) {
    uint64_t v17 = (void *)v15;
  }
  else {
    uint64_t v17 = v14;
  }
  id v18 = v17;
  long long v19 = [(APSUserCourier *)self _getCurrentTokens];
  long long v20 = v19;
  long long v34 = v7;
  if (v16 && !objc_msgSend(v19, "containsObject:", v16, v7)) {
    goto LABEL_19;
  }
  if (!v14)
  {
    unsigned __int8 v25 = 0;
    id v26 = 0;
    char v27 = 0;
    goto LABEL_30;
  }
  if ([v20 containsObject:v14])
  {
    long long v21 = 0;
  }
  else
  {
LABEL_19:
    unsigned int v22 = -[APSUserCourier _findConnectedClientWithToken:onProtocolConnection:](self, "_findConnectedClientWithToken:onProtocolConnection:", v18, v7, v34);
    long long v23 = v22;
    if (v22)
    {
      id v24 = v22;
    }
    else
    {
      id v24 = [(APSUserCourier *)self _findClientWithToken:v18];
    }
    long long v21 = v24;

    if (!v14)
    {
      char v27 = 0;
      id v26 = 0;
      unsigned __int8 v25 = 0;
      if (v21) {
        goto LABEL_28;
      }
      goto LABEL_30;
    }
  }
  if (objc_msgSend(v20, "containsObject:", v14, v34))
  {
    id v26 = 0;
    unsigned __int8 v25 = 0;
    char v27 = 1;
    if (!v21) {
      goto LABEL_30;
    }
LABEL_28:
    BOOL v30 = 1;
    goto LABEL_35;
  }
  tokenStore = self->_tokenStore;
  long long v29 = [(APSUserCourier *)self courierUser];
  id v35 = 0;
  unsigned __int8 v25 = [(APSTokenStore *)tokenStore isMatchingTokenInKeychain:v14 user:v29 error:&v35];
  id v26 = v35;

  char v27 = 0;
  if (v21) {
    goto LABEL_28;
  }
LABEL_30:
  long long v21 = 0;
  BOOL v30 = 1;
  if ((v27 & 1) == 0 && (v25 & 1) == 0)
  {
    long long v31 = [v6 objectForKey:@"APSProtocolTopicHash"];
    long long v32 = +[APSLog courier];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_1000C8100();
    }

    long long v21 = 0;
    BOOL v30 = 0;
  }
LABEL_35:

  return v30;
}

- (void)protocolConnection:(id)a3 receivedOfflinePresencekWithParameters:(id)a4
{
}

- (void)protocolConnection:(id)a3 receivedMessageWithParameters:(id)a4 generation:(unint64_t)a5 isWaking:(BOOL)a6
{
}

- (void)protocolConnection:(id)a3 receivedPubSubChannelUpdateWithParameters:(id)a4
{
}

- (void)protocolConnection:(id)a3 receivedPubSubChannelListWithParameters:(id)a4
{
}

- (void)protocolConnection:(id)a3 receivedNoStorageWithParameters:(id)a4
{
}

- (void)protocolConnection:(id)a3 receivedTaskControlWithParameters:(id)a4
{
  id v5 = a4;
  id v6 = [v5 objectForKey:@"APSProtocolTaskMessageId"];
  id v7 = [v6 unsignedIntegerValue];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = self->_activeTaskServers;
  id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "getTaskWithMessageId:", v7, (void)v16);
        if (v14)
        {
          uint64_t v15 = v14;
          [v13 handleTaskControlResponseMessage:v14 message:v5];

          goto LABEL_12;
        }
      }
      id v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  uint64_t v15 = +[APSLog courier];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_1000C8168();
  }
LABEL_12:
}

- (void)protocolConnection:(id)a3 receivedTaskNotificationWithParameters:(id)a4
{
  id v5 = a4;
  id v6 = [v5 objectForKey:@"APSProtocolTaskNotificationPayload"];
  id v7 = [[TASKNotifyRequest alloc] initWithData:v6];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = self->_activeTaskServers;
  id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      unsigned int v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v12);
        uint64_t v14 = objc_msgSend(v13, "getTaskWithTaskId:", -[TASKNotifyRequest taskId](v7, "taskId", (void)v16));
        if (v14)
        {
          uint64_t v15 = v14;
          [v13 handleTaskNotificationMessage:v14 message:v5];

          goto LABEL_12;
        }
        unsigned int v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  uint64_t v15 = +[APSLog courier];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_1000C81D0();
  }
LABEL_12:
}

- (void)protocolConnection:(id)a3 receivedPresenceTrackingRequestWithParameters:(id)a4
{
}

- (void)protocolConnection:(id)a3 receivedFilterUpdateWithParameters:(id)a4
{
  id v6 = (APSUserCourier *)a3;
  id v7 = a4;
  if ([(APSUserCourier *)self locallyDisabledFilterOptimization])
  {
    id v8 = +[APSLog courier];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000C8238(v8);
    }
    goto LABEL_36;
  }
  if ([(APSUserCourier *)self expectsResponseForFilterMessageOnProtocolConnection:v6])
  {
    id v8 = [v7 objectForKeyedSubscript:@"APSProtocolFilterUpdateTokenKey"];
    id v9 = [(APSUserCourier *)self _getCurrentTokens];
    id v10 = v9;
    if (v8 && ([v9 containsObject:v8] & 1) != 0)
    {
      uint64_t v11 = 0;
    }
    else
    {
      uint64_t v11 = [(APSUserCourier *)self _findConnectedClientWithToken:v8 onProtocolConnection:v6];
      if (!v11)
      {
        uint64_t v11 = [(APSUserCourier *)self _findClientWithToken:v8];
        if (!v11)
        {
          uint64_t v11 = +[APSLog courier];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            proxyClients = self->_proxyClients;
            int v24 = 138413058;
            unsigned __int8 v25 = self;
            __int16 v26 = 2112;
            char v27 = v8;
            __int16 v28 = 2112;
            id v29 = v10;
            __int16 v30 = 2112;
            long long v31 = proxyClients;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ Filter update not for this user -- ignoring {pushToken: %@, pushTokens: %@, clients: %@}", (uint8_t *)&v24, 0x2Au);
          }
          goto LABEL_35;
        }
      }
    }
    unsigned int v12 = [v7 objectForKey:@"APSProtocolFilterUpdateVersionKey"];
    id v13 = [v12 integerValue];

    uint64_t v14 = [v7 objectForKey:@"APSProtocolFilterUpdateStatusKey"];
    uint64_t v15 = (APSUserCourier *)[v14 integerValue];

    long long v16 = +[APSLog courier];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138413058;
      unsigned __int8 v25 = v6;
      __int16 v26 = 2112;
      char v27 = v8;
      __int16 v28 = 2048;
      id v29 = v13;
      __int16 v30 = 2048;
      long long v31 = (NSMutableDictionary *)v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Received server filter update message on protocolConnection: %@  { token: %@ server version: %ld status: %ld }", (uint8_t *)&v24, 0x2Au);
    }

    if (v15 == (APSUserCourier *)2)
    {
      long long v19 = +[APSLog courier];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Received filter update resend filter request from server - resending filters.", (uint8_t *)&v24, 2u);
      }

      if (!v11)
      {
        uint64_t v11 = [(APSUserCourier *)self preferredProtocolConnection];
        [(APSUserCourier *)self _sendFilterMessageOnProtocolConnection:v11 withReason:6];
        goto LABEL_35;
      }
      long long v20 = [(APSUserCourier *)v6 identifier];
      id v21 = [v11 stateOnInterface:v20];

      if (v21 == (id)2)
      {
        [(APSUserCourier *)self _sendClientFilter:v11 onProtocolConnection:v6];
        goto LABEL_35;
      }
      long long v18 = +[APSLog courier];
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_34;
      }
      int v24 = 138412290;
      unsigned __int8 v25 = (APSUserCourier *)v11;
      unsigned int v22 = "Received filter update resend filter request from server for disconnected client - ignoring {destinationClient: %@}";
    }
    else
    {
      if (v15 == (APSUserCourier *)1)
      {
        long long v17 = +[APSLog courier];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v24) = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Received filter update status disabled from server - disabling filter optimization on device.", (uint8_t *)&v24, 2u);
        }

        if (v11)
        {
          long long v18 = [(APSUserCourier *)v6 identifier];
          [v11 setFilterMode:2 onInterface:v18];
LABEL_34:

          goto LABEL_35;
        }
        uint64_t v11 = [(APSUserCourier *)self stateForProtocolConnection:v6];
        [v11 setFilterMode:2];
LABEL_35:

        goto LABEL_36;
      }
      long long v18 = +[APSLog courier];
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_34;
      }
      int v24 = 134217984;
      unsigned __int8 v25 = v15;
      unsigned int v22 = "Received unknown status from server (%ld).";
    }
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v24, 0xCu);
    goto LABEL_34;
  }
  id v8 = +[APSLog courier];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_1000C827C(v8);
  }
LABEL_36:
}

- (void)receivedFilterResponseWithParameters:(id)a3 onProtocolConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 objectForKeyedSubscript:@"APSProtocolFilterResponseTokenKey"];
  id v9 = [v7 objectForKey:@"APSProtocolFilterResponseVersionKey"];
  id v10 = (NSMutableDictionary *)[v9 integerValue];

  uint64_t v11 = [v7 objectForKey:@"APSProtocolFilterResponseStatusKey"];

  unsigned int v12 = (APSUserCourier *)[v11 integerValue];
  id v13 = [(APSUserCourier *)self debugOverrides];
  uint64_t v14 = objc_msgSend(v13, "overrideFilterDisableResponseForConnectionType:", objc_msgSend(v6, "connectionType"));

  uint64_t v15 = +[APSLog courier];
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v16)
    {
      *(_DWORD *)buf = 138413570;
      __int16 v42 = self;
      __int16 v43 = 2112;
      id v44 = v6;
      __int16 v45 = 2112;
      __int16 v46 = v8;
      __int16 v47 = 2048;
      __int16 v48 = v10;
      __int16 v49 = 2048;
      __int16 v50 = v12;
      __int16 v51 = 2048;
      id v52 = [v14 integerValue];
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@ Received filter response message on protocolConnection: %@ -- overriding  { token: %@, version: %ld, status: %ld, overrideStatus: %ld}", buf, 0x3Eu);
    }

    unsigned int v12 = (APSUserCourier *)[v14 integerValue];
  }
  else
  {
    if (v16)
    {
      *(_DWORD *)buf = 138413314;
      __int16 v42 = self;
      __int16 v43 = 2112;
      id v44 = v6;
      __int16 v45 = 2112;
      __int16 v46 = v8;
      __int16 v47 = 2048;
      __int16 v48 = v10;
      __int16 v49 = 2048;
      __int16 v50 = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@ Received filter response message on protocolConnection: %@  { token: %@, version: %ld, status: %ld }", buf, 0x34u);
    }
  }
  long long v17 = [(APSUserCourier *)self _getCurrentTokens];
  long long v18 = v17;
  long long v39 = v14;
  id v40 = v17;
  if (v8 && ([v17 containsObject:v8] & 1) != 0)
  {
    long long v19 = [(APSUserCourier *)self filterVersionStateMachine];
    long long v20 = [v6 identifier];
    [v19 noteAckedWithVersion:v10 on:v20];
    id v21 = 0;
    int v22 = 1;
LABEL_14:

    switch((unint64_t)v12)
    {
      case 1uLL:
        long long v23 = +[APSLog courier];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Received filter response status success from server.", buf, 2u);
        }

        uint64_t v14 = v39;
        if (v22)
        {
          int v24 = [(APSUserCourier *)self stateForProtocolConnection:v6];
          unsigned __int8 v25 = v24;
          uint64_t v26 = 1;
          goto LABEL_25;
        }
        unsigned __int8 v25 = [v6 identifier];
        long long v37 = v21;
        uint64_t v38 = 1;
        goto LABEL_38;
      case 2uLL:
        char v27 = +[APSLog courier];
        if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_33;
        }
        *(_WORD *)buf = 0;
        __int16 v28 = "Received filter response status failure from server - this shouldn't happen.";
        id v29 = v27;
        uint32_t v30 = 2;
        break;
      case 3uLL:
        long long v31 = +[APSLog courier];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Received filter response status disabled from server - disabling filter optimization on device.", buf, 2u);
        }

        uint64_t v14 = v39;
        if (v22)
        {
          int v24 = [(APSUserCourier *)self stateForProtocolConnection:v6];
          unsigned __int8 v25 = v24;
          uint64_t v26 = 2;
LABEL_25:
          objc_msgSend(v24, "setFilterMode:", v26, v39);
        }
        else
        {
          unsigned __int8 v25 = [v6 identifier];
          long long v37 = v21;
          uint64_t v38 = 2;
LABEL_38:
          -[NSObject setFilterMode:onInterface:](v37, "setFilterMode:onInterface:", v38, v25, v39);
        }

        long long v18 = v40;
        goto LABEL_44;
      case 4uLL:
        long long v32 = [(APSUserCourier *)self filterVersionStateMachine];
        long long v33 = [v32 noteInvalidWithVersion:v10];

        long long v34 = +[APSLog courier];
        BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
        if (v33)
        {
          uint64_t v14 = v39;
          long long v18 = v40;
          if (v35)
          {
            *(_DWORD *)buf = 138412290;
            __int16 v42 = v33;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Received filter response status invalid version from server - failed incrementing, disconnecting. {invalidError: %@}", buf, 0xCu);
          }

          [v6 disconnectWithReason:23];
        }
        else
        {
          uint64_t v14 = v39;
          long long v18 = v40;
          if (v35)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Received filter response status invalid version from server - incrementing version.", buf, 2u);
          }
        }
        goto LABEL_44;
      default:
        char v27 = +[APSLog courier];
        if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_33;
        }
        *(_DWORD *)buf = 134217984;
        __int16 v42 = v12;
        __int16 v28 = "Received unknown status from server (%ld).";
        id v29 = v27;
        uint32_t v30 = 12;
        break;
    }
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, v28, buf, v30);
LABEL_33:

    uint64_t v14 = v39;
    long long v18 = v40;
    goto LABEL_44;
  }
  id v21 = -[APSUserCourier _findConnectedClientWithToken:onProtocolConnection:](self, "_findConnectedClientWithToken:onProtocolConnection:", v8, v6, v14);
  if (v21
    || ([(APSUserCourier *)self _findClientWithToken:v8],
        (id v21 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    long long v19 = [v21 filterVersionStateMachine];
    long long v20 = [v6 identifier];
    [v19 noteAckedWithVersion:v10 on:v20];
    int v22 = 0;
    goto LABEL_14;
  }
  id v21 = +[APSLog courier];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    proxyClients = self->_proxyClients;
    *(_DWORD *)buf = 138413058;
    __int16 v42 = self;
    __int16 v43 = 2112;
    id v44 = v8;
    __int16 v45 = 2112;
    __int16 v46 = v18;
    __int16 v47 = 2112;
    __int16 v48 = proxyClients;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%@ Filter response not for this user -- ignoring {pushToken: %@, pushTokens: %@, clients: %@}", buf, 0x2Au);
  }
LABEL_44:
}

- (BOOL)shouldOnlySendFilterOnPreferredInterface
{
  BOOL v3 = [(APSUserCourier *)self stateByConnectionIdentifier];
  if ((unint64_t)[v3 count] >= 2)
  {
    unsigned __int8 v4 = [(APSUserCourier *)self hasConnectedInterfaceOfType:2];

    if ((v4 & 1) == 0
      && ![(APSUserCourier *)self locallyDisabledFilterOptimization]
      && ![(APSUserCourier *)self serverDisabledFilterOptimization])
    {
      uint64_t v8 = 0;
      id v9 = &v8;
      uint64_t v10 = 0x2020000000;
      char v11 = 1;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100032D90;
      v7[3] = &unk_10012AAD8;
      v7[4] = self;
      v7[5] = &v8;
      [(APSUserCourier *)self enumerateConnectedProtocolConnections:v7];
      BOOL v5 = *((unsigned char *)v9 + 24) != 0;
      _Block_object_dispose(&v8, 8);
      return v5;
    }
  }
  else
  {
  }
  return 0;
}

- (BOOL)hasOutOfDateFilterOnProtocolConnection:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(APSUserCourier *)self locallyDisabledFilterOptimization];
  unsigned __int8 v6 = 0;
  if (v4 && (v5 & 1) == 0)
  {
    id v7 = [(APSUserCourier *)self filterVersionStateMachine];
    uint64_t v8 = [v4 identifier];
    unsigned __int8 v6 = [v7 isOutOfDateOn:v8];
  }
  return v6;
}

- (BOOL)expectsResponseForFilterMessageOnProtocolConnection:(id)a3
{
  id v4 = a3;
  if ([(APSUserCourier *)self locallyDisabledFilterOptimization])
  {
    BOOL v5 = 0;
  }
  else
  {
    unsigned __int8 v6 = [(APSUserCourier *)self stateForProtocolConnection:v4];
    id v7 = [v6 filterMode];

    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100033014;
    v9[3] = &unk_10012AB00;
    char v11 = self;
    unsigned int v12 = &v13;
    id v10 = v4;
    [(APSUserCourier *)self enumerateConnectedProtocolConnections:v9];
    BOOL v5 = v7 != (id)2 && *((unsigned char *)v14 + 24) == 0;

    _Block_object_dispose(&v13, 8);
  }

  return v5;
}

- (BOOL)expectsResponseForFilterMessageOnProtocolConnection:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(APSUserCourier *)self expectsResponseForFilterMessageOnProtocolConnection:v6])
  {
    uint64_t v8 = [v6 identifier];
    id v9 = [v7 filterModeOnInterface:v8];

    uint64_t v16 = 0;
    long long v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 0;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100033254;
    v12[3] = &unk_10012AB00;
    id v13 = v6;
    uint64_t v15 = &v16;
    id v14 = v7;
    [(APSUserCourier *)self enumerateConnectedProtocolConnections:v12];
    BOOL v10 = v9 != (id)2 && *((unsigned char *)v17 + 24) == 0;

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)updateForReceivedConfig:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 powerOptimizationsForExpensiveNetworkingDisabled];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 BOOLValue];
    [(APSOutgoingMessageQueue *)self->_outgoingMessageQueue setPowerOptimizationsForExpensiveNetworkingDisabled:v7];
    uint64_t v8 = +[APSLog courier];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v9 = @"NO";
      if (v7) {
        CFStringRef v9 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      char v19 = self;
      __int16 v20 = 2112;
      CFStringRef v21 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@:  powerOptimizationsForExpensiveNetworkingDisabled = %@", buf, 0x16u);
    }
  }
  BOOL v10 = [v4 filterOptimizationEnabled];
  char v11 = v10;
  if (v10)
  {
    unsigned int v12 = [v10 BOOLValue];
    unsigned int v13 = [(APSUserCourier *)self shouldOnlySendFilterOnPreferredInterface];
    self->_serverDisabledFilterOptimization = v12 ^ 1;
    unsigned int v14 = [(APSUserCourier *)self shouldOnlySendFilterOnPreferredInterface];
    uint64_t v15 = +[APSLog courier];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v16 = @"NO";
      if (v12) {
        CFStringRef v16 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      char v19 = self;
      __int16 v20 = 2112;
      CFStringRef v21 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@:  filterOptimizationsEnabled = %@", buf, 0x16u);
    }

    if (((v13 ^ 1 | v14) & 1) == 0
      && [(APSUserCourier *)self countOfConnectedInterface] >= 2)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100033584;
      v17[3] = &unk_10012A848;
      v17[4] = self;
      [(APSUserCourier *)self enumerateConnectedProtocolConnections:v17];
    }
  }
}

- (void)connectionDidOpenonProtocolConnection:(id)a3 secureHandshakeEnabled:(BOOL)a4
{
}

- (void)_handlePresenceOffline:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 objectForKey:@"APSProtocolPresenceStatus"];
  if ([v5 intValue] == 2)
  {
    id v6 = [v4 objectForKey:@"APSProtocolToken"];
    id v7 = [(APSUserCourier *)self _findClientWithToken:v6];
    uint64_t v8 = +[APSLog courier];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412546;
      BOOL v10 = self;
      __int16 v11 = 2112;
      unsigned int v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: Got presence offline for client %@.  Invalidating and removing any pending proxy presences.", (uint8_t *)&v9, 0x16u);
    }

    [v7 invalidate];
    [(APSUserCourier *)self _clearPendingProxyPresence];
  }
}

- (void)receivedConnectedResponseWithParameters:(id)a3 onProtocolConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  stateByConnectionIdentifier = self->_stateByConnectionIdentifier;
  int v9 = [v7 identifier];
  BOOL v10 = [(NSMutableDictionary *)stateByConnectionIdentifier objectForKeyedSubscript:v9];
  if ([v10 userState] == (id)1)
  {

    goto LABEL_4;
  }
  proxyClientWithOutstandingPresence = self->_proxyClientWithOutstandingPresence;

  if (proxyClientWithOutstandingPresence)
  {
LABEL_4:
    unsigned int v12 = self->_stateByConnectionIdentifier;
    unsigned int v13 = [v7 identifier];
    unsigned int v14 = [(NSMutableDictionary *)v12 objectForKeyedSubscript:v13];
    [v14 setUserState:0];

    uint64_t v15 = self->_proxyClientWithOutstandingPresence;
    CFStringRef v16 = [v7 identifier];
    id v17 = [(APSProxyClient *)v15 stateOnInterface:v16];

    if (v17 == (id)3)
    {
      uint64_t v18 = self->_proxyClientWithOutstandingPresence;
      char v19 = [v7 identifier];
      [(APSProxyClient *)v18 setState:0 onInterface:v19];

      __int16 v20 = self->_proxyClientWithOutstandingPresence;
      CFStringRef v21 = [v7 identifier];
      [(APSProxyClient *)v20 setFilterMode:0 onInterface:v21];

      [(APSUserCourier *)self _clearPendingProxyPresence];
    }
    else
    {
      [(APSUserCourier *)self _handleConnectedMessage:v6 onProtocolConnection:v7];
    }
    goto LABEL_10;
  }
  int v22 = +[APSLog courier];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    long long v23 = self->_stateByConnectionIdentifier;
    int v24 = [v7 identifier];
    unsigned __int8 v25 = [(NSMutableDictionary *)v23 objectForKeyedSubscript:v24];
    int v26 = 138412546;
    char v27 = self;
    __int16 v28 = 2048;
    id v29 = [v25 userState];
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%@: Received connect message but not in a state to handle it {status: %lld}", (uint8_t *)&v26, 0x16u);
  }
LABEL_10:
  [(APSUserCourier *)self logStateWithReason:0];
}

- (void)_handleConnectedMessage:(id)a3 onProtocolConnection:(id)a4
{
  id v6 = a3;
  id v7 = (__CFString *)a4;
  uint64_t v8 = v7;
  proxyClientWithOutstandingPresence = self->_proxyClientWithOutstandingPresence;
  if (proxyClientWithOutstandingPresence)
  {
    BOOL v10 = [(__CFString *)v7 identifier];
    BOOL v11 = (id)[(APSProxyClient *)proxyClientWithOutstandingPresence stateOnInterface:v10] != (id)1;
  }
  else
  {
    BOOL v11 = 1;
  }
  unsigned int v12 = +[APSLog courier];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v13 = [(APSEnvironment *)self->_environment name];
    *(_DWORD *)buf = 138412290;
    v122 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Received connect message [%@]", buf, 0xCu);
  }
  p_proxyClientWithOutstandingPresence = &self->_proxyClientWithOutstandingPresence;

  uint64_t v15 = [v6 objectForKey:@"APSProtocolConnectedResponse"];
  unsigned int v16 = [v15 intValue];

  if (!sub_10007E748()
    || ([(APSUserCourier *)self debugOverrides],
        id v17 = objc_claimAutoreleasedReturnValue(),
        [v17 forcedInvalidPresences],
        uint64_t v18 = objc_claimAutoreleasedReturnValue(),
        uint64_t v19 = (uint64_t)[v18 integerValue],
        v18,
        v17,
        v19 < 1))
  {
    if (v16 == 2) {
      goto LABEL_24;
    }
    if (v16)
    {
      long long v37 = +[APSLog courier];
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v122 = self;
        __int16 v123 = 1024;
        LODWORD(v124) = v16;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%@: Received unsucessful connected response: %i. Terminating connection.", buf, 0x12u);
      }

      if (v11)
      {
        [(__CFString *)v8 noteConnectionFailureWithReason:20];
      }
      else
      {
        __int16 v45 = +[APSLog courier];
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v46 = self->_proxyClientWithOutstandingPresence;
          *(_DWORD *)buf = 138412546;
          v122 = self;
          __int16 v123 = 2112;
          uint64_t v124 = (uint64_t)v46;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%@ Deactivating client after unsuccessful presence attempt %@", buf, 0x16u);
        }

        [(APSProxyClient *)self->_proxyClientWithOutstandingPresence setActive:0];
        __int16 v47 = self->_proxyClientWithOutstandingPresence;
        __int16 v48 = [(__CFString *)v8 identifier];
        [(APSProxyClient *)v47 setState:0 onInterface:v48];

        __int16 v49 = self->_proxyClientWithOutstandingPresence;
        __int16 v50 = [(__CFString *)v8 identifier];
        [(APSProxyClient *)v49 setFilterMode:0 onInterface:v50];

        [(APSUserCourier *)self _clearPendingProxyPresence];
        [(APSUserCourier *)self _performIdleCheck];
      }
      goto LABEL_109;
    }
    CFStringRef v21 = +[APSLog courier];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      if (v11) {
        CFStringRef v22 = @"YES";
      }
      else {
        CFStringRef v22 = @"NO";
      }
      long long v23 = [(APSUserCourier *)self protocolConnectionEstablisher];
      int v24 = (__CFString *)[v23 countConnectedInterfaces];
      *(_DWORD *)buf = 138413058;
      v122 = self;
      __int16 v123 = 2112;
      uint64_t v124 = (uint64_t)v22;
      __int16 v125 = 2112;
      CFStringRef v126 = v8;
      __int16 v127 = 2048;
      v128 = v24;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%@: Connected response ok for user courier token? %@ on interface: %@ - connected on %lu interfaces", buf, 0x2Au);
    }
    unsigned __int8 v25 = [v6 objectForKey:@"APSProtocolFilterOptimizationSupport"];
    unsigned int v26 = [v25 BOOLValue];

    unsigned __int8 v27 = [(APSUserCourier *)self serverDisabledFilterOptimization];
    __int16 v28 = +[APSLog courier];
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
    if (v27)
    {
      if (v29)
      {
        CFStringRef v30 = @"NO";
        *(_DWORD *)buf = 138413058;
        v122 = self;
        __int16 v123 = 2112;
        if (v26) {
          CFStringRef v30 = @"YES";
        }
        uint64_t v124 = (uint64_t)v30;
        __int16 v125 = 2112;
        CFStringRef v126 = @"YES";
        __int16 v127 = 2112;
        v128 = v8;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%@: Ignoring response for filterOptimizationSupport: %@:, using config state: %@ on %@", buf, 0x2Au);
      }
    }
    else
    {
      if (v29)
      {
        CFStringRef v43 = @"NO";
        *(_DWORD *)buf = 138412802;
        v122 = self;
        __int16 v123 = 2112;
        if (v26) {
          CFStringRef v43 = @"YES";
        }
        uint64_t v124 = (uint64_t)v43;
        __int16 v125 = 2112;
        CFStringRef v126 = v8;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%@: Setting filterOptimizationSupport: %@ on %@", buf, 0x20u);
      }

      if (!v26)
      {
        uint64_t v44 = 2;
LABEL_65:
        uint64_t v112 = v44;
        BOOL v113 = v11;
        if (!v11)
        {
LABEL_77:
          id v91 = [v6 objectForKey:@"APSProtocolToken"];
          if (v91)
          {
            id v92 = +[APSLog courier];
            if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v122 = self;
              __int16 v123 = 2112;
              uint64_t v124 = (uint64_t)v91;
              _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "%@: Received public token '%@'", buf, 0x16u);
            }

            if (v11)
            {
              [(APSUserCourier *)self setPublicToken:v91 fromServer:1];
            }
            else
            {
              id v93 = +[APSLog courier];
              if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
              {
                id v94 = self->_proxyClientWithOutstandingPresence;
                *(_DWORD *)buf = 138412546;
                v122 = self;
                __int16 v123 = 2112;
                uint64_t v124 = (uint64_t)v94;
                _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "%@: setting new token on client %@", buf, 0x16u);
              }

              [(APSProxyClient *)*p_proxyClientWithOutstandingPresence setPublicToken:v91];
            }
          }
          id v95 = [v6 objectForKey:@"APSProtocolServerMetadata"];
          if (v95)
          {
            id v96 = +[APSLog courier];
            if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v122 = self;
              __int16 v123 = 2112;
              uint64_t v124 = (uint64_t)v95;
              _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "%@: Received metadata '%@'", buf, 0x16u);
            }
          }
          v97 = [(__CFString *)v8 maxMessageSize];
          if (v97)
          {
            v98 = +[APSLog courier];
            if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v122 = self;
              __int16 v123 = 2112;
              uint64_t v124 = (uint64_t)v97;
              _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "%@: Received message size %@", buf, 0x16u);
            }

            -[APSUserCourier setMessageSize:](self, "setMessageSize:", [v97 unsignedIntegerValue]);
          }
          v99 = [(__CFString *)v8 maxLargeMessageSize];
          if (v99)
          {
            id v100 = v91;
            id v101 = v6;
            objc_super v102 = +[APSLog courier];
            if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v122 = self;
              __int16 v123 = 2112;
              uint64_t v124 = (uint64_t)v99;
              _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEFAULT, "%@: Received large message size %@", buf, 0x16u);
            }

            -[APSUserCourier setLargeMessageSize:](self, "setLargeMessageSize:", [v99 unsignedIntegerValue]);
            id v6 = v101;
            id v91 = v100;
          }
          if (v113)
          {
            [(APSUserCourier *)self _didFinishAssertingAllPresences:v8];
          }
          else
          {
            v103 = *p_proxyClientWithOutstandingPresence;
            if (v103)
            {
              [(__CFString *)v8 identifier];
              v105 = CFStringRef v104 = v91;
              [(APSProxyClient *)v103 setState:2 onInterface:v105];

              uint64_t v106 = self->_proxyClientWithOutstandingPresence;
              __int16 v107 = [(__CFString *)v8 identifier];
              id v108 = v106;
              id v91 = v104;
              [(APSProxyClient *)v108 setFilterMode:v112 onInterface:v107];

              [(APSUserCourier *)self _sendClientFilter:self->_proxyClientWithOutstandingPresence onProtocolConnection:v8];
              [(APSUserCourier *)self _requestClientPubSubChannelList:self->_proxyClientWithOutstandingPresence onProtocolConnection:v8];
              [(APSUserCourier *)self _sendQueuedOutgoingMessages];
              [(APSUserCourier *)self _clearPendingProxyPresence];
            }
            else
            {
              __int16 v109 = +[APSLog courier];
              if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR)) {
                sub_1000C8424();
              }
            }
          }

LABEL_109:
          __int16 v65 = "anager>\"16@0:8";
          goto LABEL_110;
        }
        long long v73 = [(APSUserCourier *)self protocolConnectionEstablisher];
        if (([v73 allowedToHaveMultipleOpenInterfaces] & 1) == 0)
        {
          uint64_t v74 = [(APSUserCourier *)self countOfConnectedInterface];

          if (v74 < 1)
          {
LABEL_70:
            long long v75 = [(APSUserCourier *)self stateForProtocolConnection:v8];
            [v75 setFilterMode:v112];

            v111 = v6;
            long long v76 = [v6 objectForKey:@"APSProtocolReportLastReversePushRTT"];
            id v77 = [v76 BOOLValue];

            long long v78 = +[APSLog courier];
            if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
            {
              CFStringRef v79 = @"NO";
              *(_DWORD *)buf = 138412802;
              v122 = self;
              __int16 v123 = 2112;
              if (v77) {
                CFStringRef v79 = @"YES";
              }
              uint64_t v124 = (uint64_t)v79;
              __int16 v125 = 2112;
              CFStringRef v126 = v8;
              _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "%@: Setting reportLastReversePushRTT: %@ on %@", buf, 0x20u);
            }

            outgoingMessageQueue = self->_outgoingMessageQueue;
            long long v81 = [(__CFString *)v8 identifier];
            [(APSOutgoingMessageQueue *)outgoingMessageQueue setShouldReportLastReversePushRTT:v77 onInterface:v81];

            v119[0] = @"ConnectionType";
            long long v82 = [(APSUserCourier *)self getConnectionTypeFromProtocolConnection:v8];
            v120[0] = v82;
            v119[1] = @"ServerHostname";
            long long v83 = [(__CFString *)v8 serverHostname];
            long long v84 = +[NSString stringWithFormat:@"%@", v83];
            v120[1] = v84;
            v119[2] = @"ServerIP";
            long long v85 = [(__CFString *)v8 serverIPAddress];
            long long v86 = +[NSString stringWithFormat:@"%@", v85];
            v120[2] = v86;
            v119[3] = @"LinkQuality";
            long long v87 = +[NSNumber numberWithInt:[(__CFString *)v8 linkQuality]];
            v120[3] = v87;
            long long v88 = +[NSDictionary dictionaryWithObjects:v120 forKeys:v119 count:4];
            id v89 = [v88 mutableCopy];

            id v6 = v111;
            v90 = [v111 objectForKey:@"APSProtocolExperimentIDKey"];
            if (v90) {
              [v89 setObject:v90 forKeyedSubscript:@"ExperimentID"];
            }
            APSPowerLog();

            p_proxyClientWithOutstandingPresence = &self->_proxyClientWithOutstandingPresence;
            BOOL v11 = v113;
            goto LABEL_77;
          }
          v116[0] = _NSConcreteStackBlock;
          v116[1] = 3221225472;
          v116[2] = sub_100034A08;
          v116[3] = &unk_10012A8E8;
          v117 = v8;
          v118 = self;
          [(APSUserCourier *)self enumerateConnectedProtocolConnections:v116];
          long long v73 = v117;
        }

        goto LABEL_70;
      }
    }
    uint64_t v44 = 1;
    goto LABEL_65;
  }
  __int16 v20 = +[APSLog courier];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    sub_1000C83A0();
  }

LABEL_24:
  long long v31 = [v6 objectForKey:@"APSProtocolServerTimeForBadNonce"];
  if (!sub_10007E748()) {
    goto LABEL_47;
  }
  long long v32 = [(APSUserCourier *)self debugOverrides];
  long long v33 = [v32 forcedInvalidPresences];
  id v34 = [v33 integerValue];

  if (v34 == (id)1)
  {
    BOOL v35 = +[APSLog courier];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v122 = self;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%@: Debug override to treat presence as invalid with no server time", buf, 0xCu);
    }

    uint64_t v36 = 0;
LABEL_36:
    p_proxyClientWithOutstandingPresence = &self->_proxyClientWithOutstandingPresence;

    long long v31 = v36;
    goto LABEL_47;
  }
  uint64_t v38 = [(APSUserCourier *)self debugOverrides];
  long long v39 = [v38 forcedInvalidPresences];
  id v40 = [v39 integerValue];

  if (v40 == (id)2)
  {
    id v41 = +[NSDate date];
    [v41 timeIntervalSince1970];
    uint64_t v36 = +[NSNumber numberWithDouble:v42 * 1000.0];

    long long v31 = +[APSLog courier];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v122 = self;
      __int16 v123 = 2112;
      uint64_t v124 = v36;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%@: Debug override to treat presence as invalid with server time, using current time %@", buf, 0x16u);
    }
    goto LABEL_36;
  }
  p_proxyClientWithOutstandingPresence = &self->_proxyClientWithOutstandingPresence;
LABEL_47:
  [(APSUserCourier *)self _triggerAutoBugCaptureForInvalidPresence:v6];
  if (!v11)
  {
    id v55 = +[APSLog courier];
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v56 = self->_proxyClientWithOutstandingPresence;
      *(_DWORD *)buf = 138412546;
      v122 = self;
      __int16 v123 = 2112;
      uint64_t v124 = (uint64_t)v56;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "%@ Deactivating client after invalid presence attempt %@", buf, 0x16u);
    }

    [(APSProxyClient *)*p_proxyClientWithOutstandingPresence invalidate];
    id v57 = *p_proxyClientWithOutstandingPresence;
    [(__CFString *)v8 identifier];
    id v59 = v58 = (void **)p_proxyClientWithOutstandingPresence;
    [(APSProxyClient *)v57 setState:0 onInterface:v59];

    __int16 v60 = v58;
    long long v61 = *v58;
    __int16 v62 = [(__CFString *)v8 identifier];
    [v61 setFilterMode:0 onInterface:v62];

    long long v63 = +[APSLog courier];
    __int16 v64 = v63;
    if (v31)
    {
      __int16 v65 = "@\"<APSUserAppIDManager>\"16@0:8" + 16;
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v66 = self->_proxyClientWithOutstandingPresence;
        *(_DWORD *)buf = 138412546;
        v122 = self;
        __int16 v123 = 2112;
        uint64_t v124 = (uint64_t)v66;
        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "%@ invalid presence seems to be due to an expired nonce. Telling client %@.", buf, 0x16u);
      }

      __int16 v67 = *v60;
      __int16 v68 = v31;
      uint64_t v69 = 0;
    }
    else
    {
      __int16 v65 = "@\"<APSUserAppIDManager>\"16@0:8" + 16;
      if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT)) {
        sub_1000C8334();
      }

      __int16 v67 = *v60;
      __int16 v68 = 0;
      uint64_t v69 = 1;
    }
    [v67 handleExpiredNonceWithServerTime:v68 shouldRollToken:v69];
    [(APSUserCourier *)self _clearPendingProxyPresence];
    [(APSUserCourier *)self _performIdleCheck];
    goto LABEL_104;
  }
  __int16 v51 = [(APSUserCourier *)self stateForProtocolConnection:v8];
  [v51 setUserState:3];

  if (v31)
  {
    id v52 = self;
    id v53 = v8;
    __int16 v54 = v31;
LABEL_102:
    [(APSUserCourier *)v52 _sendPresenceMessageOnProtocolConnection:v53 serverTime:v54];
    goto LABEL_103;
  }
  __int16 v70 = +[APSLog courier];
  if (os_log_type_enabled(v70, OS_LOG_TYPE_FAULT)) {
    sub_1000C82C0();
  }

  [(__CFString *)v8 noteInvalidPresence];
  id v71 = [(APSUserCourier *)self courierUser];
  unsigned int v72 = [v71 isDefaultUser];

  if (!v72)
  {
    [(APSUserCourier *)self setPublicToken:0 fromServer:1];
    id v52 = self;
    id v53 = v8;
    __int16 v54 = 0;
    goto LABEL_102;
  }
  [(APSUserCourier *)self _processInvalidIdentity];
LABEL_103:
  __int16 v65 = "@\"<APSUserAppIDManager>\"16@0:8" + 16;
LABEL_104:

LABEL_110:
  [(APSUserCourier *)self _processPendingProxyPresences];
  [(APSUserCourier *)self processIsPowerEfficientToSendChange];
  block[0] = _NSConcreteStackBlock;
  block[1] = *((void *)v65 + 214);
  block[2] = sub_100034B3C;
  block[3] = &unk_100129D10;
  block[4] = self;
  v115 = v8;
  CFStringRef v110 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_triggerAutoBugCaptureForInvalidPresence:(id)a3
{
  id v4 = a3;
  if (sub_10007E748())
  {
    BOOL v5 = [(APSDebugOverrides *)self->_debugOverrides forcedInvalidPresences];
    id v6 = [v5 integerValue];

    if ((uint64_t)v6 <= 0)
    {
      id v7 = +[APSLog courier];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "triggering ABC for invalid presence", buf, 2u);
      }

      if (!self->_symptomReporter)
      {
        uint64_t v8 = objc_alloc_init(APSSymptomReporter);
        symptomReporter = self->_symptomReporter;
        self->_symptomReporter = v8;
      }
      if (sub_10007F1B4()) {
        CFStringRef v10 = @"YES";
      }
      else {
        CFStringRef v10 = @"NO";
      }
      BOOL v11 = [v4 objectForKey:@"APSProtocolServerTimeForBadNonce"];
      if (v11) {
        CFStringRef v12 = @"YES";
      }
      else {
        CFStringRef v12 = @"NO";
      }
      unsigned int v13 = +[NSString stringWithFormat:@"Using BAA? %@, Contains server time? %@", v10, v12];

      [(APSSymptomReporter *)self->_symptomReporter reportSymptomToAutoBugCapture:@"InvalidPresence" subType:v13];
    }
  }
}

- (void)_forceReconnectionsWithReason:(unsigned int)a3
{
  BOOL v5 = +[APSLog courier];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ Forcing reconnections on all interfaces", buf, 0xCu);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100034E18;
  v7[3] = &unk_10012AB20;
  unsigned int v8 = a3;
  [(APSUserCourier *)self enumerateAllProtocolConnections:v7];
  id v6 = [(APSUserCourier *)self protocolConnectionEstablisher];
  [v6 forceAdjustConnections];
}

- (void)_notifyForIncomingMessage:(id)a3
{
}

- (void)_notifyForIncomingMessage:(id)a3 forConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = +[APSLog courier];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [v6 guid];
    *(_DWORD *)buf = 138412802;
    double v42 = self;
    __int16 v43 = 2112;
    id v44 = v6;
    __int16 v45 = 2112;
    __int16 v46 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ _notifyForIncomingMessage %@ with guid %@", buf, 0x20u);
  }
  if (v7)
  {
    id v40 = v7;
    CFStringRef v10 = +[NSArray arrayWithObjects:&v40 count:1];
  }
  else
  {
    CFStringRef v10 = [(APSUserCourier *)self connectionServers];
  }
  __int16 v28 = self;
  BOOL v29 = v7;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v10;
  id v34 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v34)
  {
    char v31 = 0;
    uint64_t v33 = *(void *)v36;
    id v30 = v6;
    do
    {
      BOOL v11 = 0;
      do
      {
        if (*(void *)v36 != v33) {
          objc_enumerationMutation(obj);
        }
        CFStringRef v12 = *(void **)(*((void *)&v35 + 1) + 8 * (void)v11);
        unsigned int v13 = [v12 enabledTopics];
        unsigned int v14 = [v12 opportunisticTopics];
        uint64_t v15 = [v12 nonWakingTopics];
        unsigned int v16 = [v12 publicToken];
        id v17 = [v6 token];
        unsigned int v18 = [v16 isEqual:v17];

        uint64_t v19 = [v6 topic];
        if ([v13 containsObject:v19])
        {
          unsigned int v20 = 1;
        }
        else
        {
          [v6 topic];
          v22 = CFStringRef v21 = v6;
          if ([v15 containsObject:v22])
          {
            unsigned int v20 = 1;
          }
          else
          {
            long long v23 = [v21 topic];
            if (([v14 containsObject:v23] & 1) != 0
              || ([v13 containsObject:@"*"] & 1) != 0
              || ([v14 containsObject:@"*"] & 1) != 0)
            {
              unsigned int v20 = 1;
            }
            else
            {
              unsigned int v20 = [v15 containsObject:@"*"];
            }
          }
          id v6 = v30;
        }

        if ((v18 & v20) == 1)
        {
          [v12 handleReceivedMessage:v6];
          char v31 = 1;
        }

        BOOL v11 = (char *)v11 + 1;
      }
      while (v34 != v11);
      id v24 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      id v34 = v24;
    }
    while (v24);
  }
  else
  {
    char v31 = 0;
  }

  if (!v29 && (v31 & 1) == 0)
  {
    unsigned __int8 v25 = +[APSLog courier];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v26 = [v6 topic];
      *(_DWORD *)buf = 138412802;
      double v42 = v28;
      __int16 v43 = 2112;
      id v44 = v6;
      __int16 v45 = 2112;
      __int16 v46 = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%@ found no listeners for message %@ with topic %@. Cleaning up message.", buf, 0x20u);
    }
    unsigned __int8 v27 = [v6 guid];
    [(APSUserCourier *)v28 connection:0 handleAckIncomingMessageWithGuid:v27 topic:0 tracingUUID:0];
  }
}

- (BOOL)_wakeCausedByTopic:(id)a3 interface:(id)a4 priorityVal:(unint64_t)a5 inAllowlist:(BOOL)a6
{
  uint64_t v8 = +[PCPersistentTimer lastSystemWakeDate];
  int v9 = (void *)v8;
  BOOL v10 = a5 == 5 && a6;
  if (a5 == 10) {
    BOOL v10 = 1;
  }
  if (a5) {
    char v11 = v10;
  }
  else {
    char v11 = 1;
  }
  if (v8)
  {
    CFStringRef v12 = +[NSDate now];
    [v12 timeIntervalSinceDate:v9];
    double v14 = v13;

    BOOL v15 = v14 >= 0.0;
    if (v14 >= 2.0) {
      BOOL v15 = 0;
    }
    BOOL v16 = v11 & v15;
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (void)_handleMessageMessage:(id)a3 onProtocolConnection:(id)a4 withGeneration:(unint64_t)a5 isWakingMessage:(BOOL)a6 fromAgent:(BOOL)a7
{
  BOOL v146 = a7;
  BOOL v7 = a6;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [v10 objectForKey:@"APSProtocolToken"];
  uint64_t v13 = [v10 objectForKey:@"APSProtocolBaseToken"];
  double v14 = (void *)v13;
  if (v13) {
    BOOL v15 = (void *)v13;
  }
  else {
    BOOL v15 = (void *)v12;
  }
  id v16 = v15;
  id v17 = [(APSUserCourier *)self _getCurrentTokens];
  unsigned int v18 = v17;
  v162 = v11;
  v163 = self;
  v161 = v17;
  if ((!v14 || [v17 containsObject:v14])
    && (!v12 || ([v18 containsObject:v12] & 1) != 0))
  {
    BOOL v129 = v7;
    uint64_t v19 = 0;
    goto LABEL_25;
  }
  uint64_t v20 = [(APSUserCourier *)self _findConnectedClientWithToken:v16 onProtocolConnection:v11];
  if (v20)
  {
    CFStringRef v21 = (void *)v20;
    CFStringRef v22 = +[APSLog courier];
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 138413314;
    v177 = self;
    __int16 v178 = 2112;
    *(void *)v179 = v21;
    *(_WORD *)&v179[8] = 2112;
    uint64_t v180 = (uint64_t)v14;
    __int16 v181 = 2112;
    uint64_t v182 = v12;
    __int16 v183 = 2112;
    v184 = v161;
    long long v23 = "%@ incoming message is for a proxy client %@ baseToken %@  destToken %@  publicTokens %@";
    id v24 = v22;
    uint32_t v25 = 52;
  }
  else
  {
    CFStringRef v21 = [(APSUserCourier *)self _findClientWithToken:v16];
    CFStringRef v22 = +[APSLog courier];
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 138413058;
    v177 = self;
    __int16 v178 = 2112;
    *(void *)v179 = v14;
    *(_WORD *)&v179[8] = 2112;
    uint64_t v180 = v12;
    __int16 v181 = 2112;
    uint64_t v182 = (uint64_t)v161;
    long long v23 = "%@ incoming message is for proxy client that is *not* connected. baseToken %@  destToken %@  publicTokens %@";
    id v24 = v22;
    uint32_t v25 = 42;
  }
  _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);
LABEL_15:

  if (v146)
  {
    BOOL v129 = v7;
    uint64_t v19 = v21;
    goto LABEL_25;
  }
  uint64_t v19 = v21;
  if (!v21)
  {
    BOOL v129 = v7;
LABEL_25:
    uint64_t v33 = [v10 objectForKey:@"APSProtocolTopicHash"];
    v160 = [v10 objectForKey:@"APSProtocolPayload"];
    id v34 = [v10 objectForKey:@"APSProtocolMessageID"];
    v142 = [v10 objectForKey:@"APSProtocolMessageCorrelationIdentifier"];
    if (v34) {
      uint64_t v153 = *(unsigned int *)[v34 bytes];
    }
    else {
      uint64_t v153 = 0;
    }
    v157 = [v10 objectForKey:@"APSProtocolMessageTimestamp"];
    v141 = [v10 objectForKey:@"APSProtocolMessageExpiry"];
    long long v35 = [v10 objectForKey:@"APSProtocolMessageStorageFlags"];
    v156 = [v10 objectForKey:@"APSProtocolMessagePriority"];
    v155 = [v10 objectForKey:@"APSProtocolMessageAPNFlags"];
    v145 = [v10 objectForKey:@"APSProtocolMessageTracingUUID"];
    v154 = [v10 objectForKey:@"APSProtocolMessagePushType"];
    v159 = [v10 objectForKey:@"APSProtocolMessagePubSubInfo"];
    v136 = v35;
    unsigned int v36 = [v35 unsignedIntValue];
    wakeMetricTracker = self->_wakeMetricTracker;
    unsigned int v140 = v36;
    v134 = v34;
    if (v36) {
      [(APSWakeMetricTracker *)wakeMetricTracker noteReceivedStoredMessage];
    }
    else {
      [(APSWakeMetricTracker *)wakeMetricTracker noteReceivedLiveMessage];
    }
    long long v38 = self->_topicManager;
    uint64_t v39 = [(APSTopicManager *)v38 hasEnabledTopicHash:v33];
    uint64_t v40 = v39;
    v138 = v14;
    v139 = (void *)v12;
    id v143 = v16;
    v150 = v19;
    v137 = (void *)v33;
    v135 = v38;
    if (v39)
    {
      uint64_t v127 = 1;
      id v41 = (void *)v39;
    }
    else
    {
      uint64_t v42 = [(APSTopicManager *)v38 hasOpportunisticTopicHash:v33];
      if (v42)
      {
        __int16 v43 = (void *)v42;
        uint64_t v44 = 2;
      }
      else
      {
        uint64_t v45 = [(APSTopicManager *)v38 hasNonWakingTopicHash:v33];
        if (v45)
        {
          __int16 v43 = (void *)v45;
          uint64_t v44 = 4;
        }
        else
        {
          uint64_t v46 = [(APSTopicManager *)v38 hasPausedTopicHash:v33];
          if (!v46)
          {
            uint64_t v120 = [(APSTopicManager *)v38 hasIgnoredTopicHash:v33];
            if (v120)
            {
              v121 = (void *)v120;
              v144 = +[APSLog courier];
              v152 = v121;
              if (os_log_type_enabled(v144, OS_LOG_TYPE_ERROR)) {
                sub_1000C862C();
              }
              v148 = 0;
              v158 = 0;
              v131 = 0;
              v133 = 0;
              uint64_t v122 = 6;
            }
            else
            {
              uint64_t v123 = [(APSTopicManager *)v38 hasRecentlyRemovedTopicHash:v33];
              v144 = +[APSLog courier];
              BOOL v124 = os_log_type_enabled(v144, OS_LOG_TYPE_ERROR);
              if (v123)
              {
                v148 = (void *)v123;
                if (v124) {
                  sub_1000C85C4();
                }
              }
              else
              {
                if (v124) {
                  sub_1000C855C();
                }
                v148 = 0;
              }
              v158 = 0;
              v152 = 0;
              v131 = 0;
              v133 = 0;
              uint64_t v122 = 7;
            }
            uint64_t v130 = v122;
            unint64_t v106 = a5;
            __int16 v107 = v134;
            uint64_t v105 = v153;
            goto LABEL_133;
          }
          __int16 v43 = (void *)v46;
          uint64_t v44 = 5;
        }
      }
      uint64_t v127 = v44;
      id v41 = v43;
    }
    unsigned int v132 = -[APSUserCourier _wakeCausedByTopic:interface:priorityVal:inAllowlist:](self, "_wakeCausedByTopic:interface:priorityVal:inAllowlist:", v41, v11, [v156 unsignedIntegerValue], v40 != 0);
    if (v12) {
      unsigned int v47 = [v161 containsObject:v12];
    }
    else {
      unsigned int v47 = 0;
    }
    [v157 doubleValue];
    v144 = +[NSDate dateWithTimeIntervalSince1970:v48 / 1000000000.0];
    pushHistory = self->_pushHistory;
    id v128 = v10;
    if (v47)
    {
      __int16 v50 = [(APSPushHistory *)pushHistory timestampForTopic:v41 token:v12];
      if (!v50 || [v157 compare:v50])
      {
        id v151 = 0;
        char v51 = 0;
        int v52 = 0;
LABEL_74:

        unsigned __int8 v63 = [v155 unsignedLongValue];
        if (v51 & 1) == 0 && (v63)
        {
          __int16 v64 = +[APSLog courier];
          if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            v177 = self;
            __int16 v178 = 2112;
            *(void *)v179 = v12;
            *(_WORD *)&v179[8] = 2112;
            uint64_t v180 = (uint64_t)v41;
            _os_log_error_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "%@: Received push for token %@ topic %@ which was removed but the token is valid unexpectedly! Delivering message to the client anyways.", buf, 0x20u);
          }

          symptomReporter = self->_symptomReporter;
          if (!symptomReporter)
          {
            __int16 v66 = objc_alloc_init(APSSymptomReporter);
            __int16 v67 = self->_symptomReporter;
            self->_symptomReporter = v66;

            symptomReporter = self->_symptomReporter;
          }
          [(APSSymptomReporter *)symptomReporter reportSymptomToAutoBugCapture:@"PerAppToken" subType:@"RemovedTokenIsUnexpectedlyValid"];
        }
        unsigned __int8 v68 = [(APSUserCourier *)self shouldDropPubSubMessageWithData:v159 forTopic:v41];
        BOOL v69 = v151 == 0;
        if (v151) {
          char v70 = 1;
        }
        else {
          char v70 = v51;
        }
        uint64_t v71 = 2;
        if (v151) {
          uint64_t v71 = 11;
        }
        v158 = v41;
        if (v70)
        {
          uint64_t v130 = v71;
          v131 = 0;
          unsigned int v72 = 0;
LABEL_88:
          uint64_t v73 = v153;
LABEL_129:
          v133 = v72;
          id v93 = objc_alloc_init((Class)NSMutableDictionary);
          id v94 = +[NSNumber numberWithUnsignedInteger:v73];
          id v95 = +[NSNumber numberWithInteger:[(APSIncomingMessage *)v72 priority]];
          id v11 = v162;
          id v96 = [v162 serverHostname];
          CFStringRef v126 = +[NSString stringWithFormat:@"%@", v96];

          v97 = [v162 serverIPAddress];
          __int16 v125 = +[NSString stringWithFormat:@"%@", v97];

          v147 = [(APSUserCourier *)v163 getConnectionTypeFromProtocolConnection:v162];
          v98 = +[NSNumber numberWithBool:v69];
          v99 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v162 linkQuality]);
          [v93 setObject:v147 forKeyedSubscript:@"ConnectionType"];
          [v93 setObject:v98 forKeyedSubscript:@"IsDropped"];
          [v93 setObject:v99 forKeyedSubscript:@"LinkQuality"];
          id v100 = +[NSNumber numberWithInteger:v127];
          [v93 setObject:v100 forKeyedSubscript:@"FilterList"];

          id v101 = +[NSNumber numberWithInt:(v140 & 3) != 0];
          [v93 setObject:v101 forKeyedSubscript:@"StorageFlag"];

          [v93 setObject:v94 forKeyedSubscript:@"MessageIdentifier"];
          [v93 setObject:v95 forKeyedSubscript:@"Priority"];
          [v93 setObject:v126 forKeyedSubscript:@"ServerHostname"];
          [v93 setObject:v125 forKeyedSubscript:@"ServerIP"];
          [v93 setObject:v158 forKeyedSubscript:@"Topic"];
          objc_super v102 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v160 length]);
          [v93 setObject:v102 forKeyedSubscript:@"Size"];

          v103 = +[NSNumber numberWithBool:v129];
          [v93 setObject:v103 forKeyedSubscript:@"IsWakingMessage"];

          if (v154) {
            CFStringRef v104 = v154;
          }
          else {
            CFStringRef v104 = &off_1001375F0;
          }
          [v93 setObject:v104 forKeyedSubscript:@"PushType"];
          APSPowerLog();

          uint64_t v105 = v153;
          self = v163;

          v148 = 0;
          v152 = 0;
          id v10 = v128;
          unint64_t v106 = a5;
          uint64_t v19 = v150;
          __int16 v107 = v134;
LABEL_133:

          v168[0] = _NSConcreteStackBlock;
          v168[1] = 3221225472;
          v168[2] = sub_10003695C;
          v168[3] = &unk_10012AB48;
          v168[4] = self;
          uint64_t v172 = v130;
          id v108 = v107;
          id v169 = v108;
          uint64_t v173 = v105;
          id v170 = v11;
          unint64_t v174 = v106;
          __int16 v109 = self;
          CFStringRef v110 = v133;
          v171 = v110;
          v111 = objc_retainBlock(v168);
          uint64_t v112 = v111;
          if (v110)
          {
            BOOL v113 = [(APSUserCourier *)self updateChannelForIncomingMessageWithData:v159 forTopic:v158];
            [(APSIncomingMessage *)v110 setChannelID:v113];
            v164[0] = _NSConcreteStackBlock;
            v164[1] = 3221225472;
            v164[2] = sub_100036C00;
            v164[3] = &unk_10012AB70;
            id v167 = v112;
            v114 = v110;
            v165 = v114;
            v166 = self;
            v115 = objc_retainBlock(v164);
            v116 = sub_1000A6650();

            if (v116)
            {
              v117 = +[APSMessageStore sharedInstance];
              [v117 storeIncomingMessage:v114 environment:v109->_environment completionBlock:v115];
            }
            else
            {
              v118 = +[NSUUID UUID];
              v117 = [v118 UUIDString];

              v119 = +[APSLog courier];
              if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v177 = v163;
                __int16 v178 = 2112;
                *(void *)v179 = v117;
                _os_log_impl((void *)&_mh_execute_header, v119, OS_LOG_TYPE_DEFAULT, "%@: Calling completion block for incoming message %@", buf, 0x16u);
              }

              ((void (*)(void *, void *))v115[2])(v115, v117);
            }
            unsigned int v26 = v139;

            id v11 = v162;
            uint64_t v19 = v150;
          }
          else
          {
            ((void (*)(void *))v111[2])(v111);
            unsigned int v26 = v139;
          }

          double v14 = v138;
          id v16 = v143;
          long long v32 = v161;
          goto LABEL_142;
        }
        if (v52)
        {
          uint64_t v74 = +[APSLog courier];
          if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
            sub_1000C848C();
          }

          uint64_t v73 = v153;
          if (v159)
          {
            long long v75 = [(APSUserCourier *)self updateChannelForIncomingMessageWithData:v159 forTopic:v41];
            long long v76 = +[APSLog courier];
            if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v177 = self;
              __int16 v178 = 2112;
              *(void *)v179 = v75;
              _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "%@: Updated checkpoint on channel %@ for ignored message.", buf, 0x16u);
            }
          }
          unsigned int v72 = 0;
          v131 = 0;
          BOOL v69 = 1;
          uint64_t v77 = 7;
        }
        else
        {
          if (v68)
          {
            unsigned int v72 = 0;
            BOOL v69 = 1;
            uint64_t v130 = 7;
            v131 = 0;
            goto LABEL_88;
          }
          [(APSPushHistory *)self->_pushHistory receivedPushWithTopic:v41 token:v12 payload:v160 timestamp:v157];
          id v78 = [(APSUserCourier *)self _copyParsedPayload:v160];
          CFStringRef v79 = +[APSLog courierOversized];
          if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v80 = sub_10008D708(v78, v41);
            uint64_t v81 = v12;
            long long v82 = (void *)v80;
            *(_DWORD *)buf = 138413826;
            CFStringRef v83 = @"NO";
            v177 = self;
            if (v47) {
              CFStringRef v84 = @"YES";
            }
            else {
              CFStringRef v84 = @"NO";
            }
            __int16 v178 = 2112;
            *(void *)v179 = v41;
            if (v146) {
              CFStringRef v83 = @"YES";
            }
            *(_WORD *)&v179[8] = 2112;
            uint64_t v180 = (uint64_t)v11;
            __int16 v181 = 2112;
            uint64_t v182 = v80;
            __int16 v183 = 2112;
            v184 = v156;
            __int16 v185 = 2112;
            CFStringRef v186 = v84;
            __int16 v187 = 2112;
            CFStringRef v188 = v83;
            _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "%@: Received message for enabled topic '%@' onInterface: %@ with payload '%@' with priority %@ for device token: %@ isProxyMessage: %@", buf, 0x48u);

            uint64_t v12 = v81;
          }

          if (v78)
          {
            v131 = v78;
            long long v85 = [[APSIncomingMessage alloc] initWithTopic:v41 userInfo:v78];
            uint64_t v73 = v153;
            [(APSIncomingMessage *)v85 setIdentifier:v153];
            [(APSIncomingMessage *)v85 setFromStorage:v140 & 1];
            [(APSIncomingMessage *)v85 setLastMessageFromStorage:(v140 >> 1) & 1];
            [(APSIncomingMessage *)v85 setCorrelationIdentifier:v142];
            -[APSIncomingMessage setTracingEnabled:](v85, "setTracingEnabled:", ((unint64_t)[v155 unsignedLongValue] >> 1) & 1);
            [(APSIncomingMessage *)v85 setTracingUUID:v145];
            [(APSIncomingMessage *)v85 setExpirationDate:v141];
            long long v86 = v11;
            unsigned int v72 = v85;
            -[APSIncomingMessage setIncomingInterface:](v85, "setIncomingInterface:", sub_100075C00((uint64_t)[v86 connectionType]));
            if ((v140 & 2) != 0)
            {
              --self->_usersPotentiallyWithMessages;
              long long v87 = +[APSLog courier];
              if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
              {
                int64_t usersPotentiallyWithMessages = self->_usersPotentiallyWithMessages;
                *(_DWORD *)buf = 138412802;
                v177 = self;
                __int16 v178 = 1024;
                *(_DWORD *)v179 = usersPotentiallyWithMessages;
                *(_WORD *)&v179[4] = 1024;
                *(_DWORD *)&v179[6] = v140;
                _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "%@: Received LastFromStorage flag in message, users potentially with messages = %d, flags = 0x%02x", buf, 0x18u);
              }

              if (!self->_usersPotentiallyWithMessages) {
                [(APSNoOpPowerAssertion *)self->_waitForStoredMessagesToArrivePowerAssertion clear];
              }
            }
            [(APSIncomingMessage *)v85 setTimestamp:v144];
            [(APSIncomingMessage *)v85 setToken:v143];
            [(APSIncomingMessage *)v85 setPerAppToken:v12];
            if (v154) {
              uint64_t v89 = [v154 unsignedShortValue];
            }
            else {
              uint64_t v89 = 0;
            }
            [(APSIncomingMessage *)v85 setPushType:v89];
            if (v156) {
              -[APSIncomingMessage setPriority:](v85, "setPriority:", [v156 unsignedIntegerValue]);
            }
            [(APSIncomingMessage *)v85 setPushFlags:0];
            if (v132) {
              [(APSIncomingMessage *)v85 setPushFlags:[(APSIncomingMessage *)v85 pushFlags] | 1];
            }
            id v92 = +[APSLog PUSHTRACE];
            if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v177 = self;
              __int16 v178 = 2112;
              *(void *)v179 = v145;
              _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "%@: Push has been read from stream and parsed. UUID: %@", buf, 0x16u);
            }

            [(APSUserCourier *)self _triggerAutoBugCaptureIfMessageIsRetried:v85];
            BOOL v69 = 0;
            uint64_t v130 = 0;
            goto LABEL_129;
          }
          v90 = +[APSLog courier];
          uint64_t v73 = v153;
          if (os_log_type_enabled(v90, OS_LOG_TYPE_FAULT)) {
            sub_1000C84F4();
          }

          BOOL v69 = 0;
          unsigned int v72 = 0;
          v131 = 0;
          uint64_t v77 = 3;
        }
        uint64_t v130 = v77;
        goto LABEL_129;
      }
      __int16 v58 = +[APSLog courier];
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413058;
        v177 = self;
        __int16 v178 = 2112;
        *(void *)v179 = v12;
        *(_WORD *)&v179[8] = 2112;
        uint64_t v180 = (uint64_t)v41;
        __int16 v181 = 2112;
        uint64_t v182 = (uint64_t)v157;
        _os_log_error_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "%@ Received duplicate push for token %@ and topic %@ - message timestamp %@", buf, 0x2Au);
      }

      goto LABEL_60;
    }
    if ([(APSPushHistory *)pushHistory hasPayload:v160 forTopic:v41 tokens:v161])
    {
      __int16 v50 = +[APSLog courier];
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v177 = self;
        __int16 v178 = 2112;
        *(void *)v179 = v12;
        *(_WORD *)&v179[8] = 2112;
        uint64_t v180 = (uint64_t)v41;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%@ Received duplicate push for per-app token %@ and topic %@. We already received a message with this payload hash for the device token.", buf, 0x20u);
      }
LABEL_60:
      id v151 = 0;
      char v51 = 0;
LABEL_61:
      int v52 = 1;
      goto LABEL_74;
    }
    if (v12)
    {
      tokenStore = self->_tokenStore;
      uint64_t v54 = [(APSUserCourier *)self courierUser];
      uint64_t v55 = v12;
      __int16 v56 = (void *)v54;
      uint64_t v175 = 0;
      uint64_t v57 = v55;
      LOBYTE(tokenStore) = -[APSTokenStore isMatchingTokenInKeychain:user:error:](tokenStore, "isMatchingTokenInKeychain:user:error:");
      id v151 = 0;

      if (tokenStore)
      {
        char v51 = 0;
        uint64_t v12 = v57;
        goto LABEL_67;
      }
      uint64_t v12 = v57;
    }
    else
    {
      id v151 = 0;
    }
    id v59 = +[APSLog courier];
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
      sub_1000C8100();
    }

    char v51 = 1;
LABEL_67:
    __int16 v50 = [(APSPushHistory *)self->_pushHistory timestampForTopic:v41 token:v12];
    if (v12)
    {
      __int16 v60 = self->_pushHistory;
      uint64_t v61 = v12;
      uint64_t v189 = v12;
      __int16 v62 = +[NSArray arrayWithObjects:&v189 count:1];
      LODWORD(v60) = [(APSPushHistory *)v60 hasPayload:v160 forTopic:v41 tokens:v62];

      int v52 = 0;
      if (!v60 || !v50)
      {
        uint64_t v12 = v61;
        goto LABEL_73;
      }
      uint64_t v12 = v61;
      if (![v157 compare:v50])
      {
        id v91 = +[APSLog courier];
        unsigned int v47 = 0;
        if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138413058;
          v177 = self;
          __int16 v178 = 2112;
          *(void *)v179 = v12;
          *(_WORD *)&v179[8] = 2112;
          uint64_t v180 = (uint64_t)v41;
          __int16 v181 = 2112;
          uint64_t v182 = (uint64_t)v157;
          _os_log_error_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_ERROR, "%@ Received duplicate push for token %@ and topic %@ - message timestamp %@", buf, 0x2Au);
        }

        goto LABEL_61;
      }
    }
    int v52 = 0;
LABEL_73:
    unsigned int v47 = 0;
    goto LABEL_74;
  }
  unsigned int v26 = (void *)v12;
  unsigned __int8 v27 = [v11 identifier];
  unsigned int v28 = [v21 isConnectedOnInterface:v27];

  BOOL v29 = +[APSLog courier];
  BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
  if (v28)
  {
    if (v30)
    {
      *(_DWORD *)buf = 138412546;
      v177 = v163;
      __int16 v178 = 2112;
      *(void *)v179 = v21;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%@ passing this message off to the client device %@ to handle.", buf, 0x16u);
    }

    objc_msgSend(v21, "receivedPush:onConnectionType:withGeneration:", v10, objc_msgSend(v11, "connectionType"), a5);
    char v31 = +[APSLog courier];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v177 = v163;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%@: Sending transport acknowledgement message.", buf, 0xCu);
    }

    [v11 sendMessageTransportAcknowledgeMessage];
    long long v32 = v161;
  }
  else
  {
    if (v30)
    {
      *(_DWORD *)buf = 138412546;
      v177 = v163;
      __int16 v178 = 2112;
      *(void *)v179 = v21;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%@ ignoring message to a disconnected client %@.", buf, 0x16u);
    }

    long long v32 = v161;
  }
  uint64_t v19 = v21;
LABEL_142:
}

- (id)_copyParsedPayload:(id)a3
{
  id v3 = a3;
  uint64_t v16 = 0;
  uint64_t v5 = +[NSPropertyListSerialization propertyListWithData:v3 options:0 format:&v16 error:0];
  if (v5)
  {
    id v6 = 0;
    BOOL v7 = (void *)v5;
  }
  else
  {
    id v15 = 0;
    uint64_t v8 = +[NSJSONSerialization JSONObjectWithData:v3 options:0 error:&v15];
    id v6 = v15;
    if (!v8)
    {
      BOOL v7 = 0;
      goto LABEL_8;
    }
    BOOL v7 = (void *)v8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
LABEL_8:
    if (!v6) {
      goto LABEL_16;
    }

    for (i = (__CFString *)objc_alloc_init((Class)NSMutableString);
          ;
          [(__CFString *)i appendString:@"; "])
    {
      id v10 = [v6 localizedDescription];
      [(__CFString *)i appendString:v10];

      id v11 = [v6 userInfo];
      uint64_t v12 = [v11 objectForKey:NSUnderlyingErrorKey];

      if (!v12) {
        break;
      }
      id v6 = (id)v12;
    }
    id v6 = 0;
    BOOL v7 = 0;
    if (!i) {
      goto LABEL_16;
    }
    goto LABEL_13;
  }

  i = @"Top level object was not a dictionary";
LABEL_13:
  uint64_t v13 = +[APSLog courier];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_1000C8694();
  }

  BOOL v7 = 0;
LABEL_16:

  return v7;
}

- (void)_handleOutgoingMessageAcknowledgment:(id)a3 onProtocolConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 objectForKey:@"APSProtocolAckTimestampKey"];
  id v9 = [v8 unsignedIntegerValue];

  id v10 = [v7 objectForKey:@"APSProtocolDeliveryStatus"];

  id v11 = [v10 integerValue];
  uint64_t v12 = APSError();
  uint64_t v13 = +[APSLog courier];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v19 = self;
    __int16 v20 = 2048;
    id v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@: Received ack for outgoing message with delivery status %ld", buf, 0x16u);
  }

  outgoingMessageQueue = self->_outgoingMessageQueue;
  id v15 = [v6 linkQuality];
  id v16 = [v6 connectionType];
  id v17 = [v6 identifier];

  [(APSOutgoingMessageQueue *)outgoingMessageQueue handleAcknowledgmentForOutgoingMessageWithResult:v12 ackTimestamp:v9 linkQuality:v15 connectionType:v16 onInterface:v17];
}

- (void)handleDisconnectForInterface:(id)a3 connectionState:(int64_t)a4 withReason:(unsigned int)a5
{
  id v7 = (APSProxyClient *)a3;
  [(APSUserCourier *)self _removePendingRequestsForProtocolConnection:v7];
  [(APSUserCourier *)self markProtocolConnectionDisconnectedForActivityTracking:v7];
  [(APSUserCourier *)self _reportAPSConnectivity];
  if (self->_proxyClientWithOutstandingPresence)
  {
    uint64_t v8 = +[APSLog courier];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      proxyClientWithOutstandingPresence = self->_proxyClientWithOutstandingPresence;
      *(_DWORD *)buf = 138412546;
      double v48 = self;
      __int16 v49 = 2112;
      __int16 v50 = proxyClientWithOutstandingPresence;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ clearing pending proxy presence for client %@ if necessary.", buf, 0x16u);
    }

    id v10 = self->_proxyClientWithOutstandingPresence;
    id v11 = [(APSProxyClient *)v7 identifier];
    unint64_t v12 = [(APSProxyClient *)v10 stateOnInterface:v11];

    if ((v12 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    {
      uint64_t v13 = +[APSLog courier];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        double v14 = self->_proxyClientWithOutstandingPresence;
        *(_DWORD *)buf = 138413058;
        double v48 = self;
        __int16 v49 = 2112;
        __int16 v50 = v14;
        __int16 v51 = 2048;
        unint64_t v52 = v12;
        __int16 v53 = 2112;
        uint64_t v54 = v7;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@ client %@ has state %lu onInterface %@", buf, 0x2Au);
      }

      [(APSUserCourier *)self _clearPendingProxyPresence];
    }
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v15 = self->_proxyClients;
  id v16 = [(NSMutableDictionary *)v15 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v43;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v43 != v18) {
          objc_enumerationMutation(v15);
        }
        __int16 v20 = [(NSMutableDictionary *)self->_proxyClients objectForKey:*(void *)(*((void *)&v42 + 1) + 8 * i)];
        id v21 = [(APSProxyClient *)v7 identifier];
        [v20 setState:0 onInterface:v21];

        CFStringRef v22 = self->_proxyClientWithOutstandingPresence;
        long long v23 = [(APSProxyClient *)v7 identifier];
        [(APSProxyClient *)v22 setFilterMode:0 onInterface:v23];
      }
      id v17 = [(NSMutableDictionary *)v15 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v17);
  }

  [(APSUserCourier *)self _adjustIsConnectedToService];
  if ((unint64_t)(a4 - 1) <= 1) {
    [(APSUserCourier *)self _disconnectTokenWithReason:a5 onProtocolConnection:v7];
  }
  id v24 = [(APSUserCourier *)self filterVersionStateMachine];
  uint32_t v25 = [(APSProxyClient *)v7 identifier];
  unsigned int v26 = [v24 hasUnAckedVersionOn:v25];

  if (v26)
  {
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1000376B0;
    v39[3] = &unk_10012A8E8;
    uint64_t v40 = v7;
    id v41 = self;
    [(APSUserCourier *)self enumerateConnectedProtocolConnections:v39];
  }
  unsigned __int8 v27 = +[APSLog courier];
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    double v48 = self;
    __int16 v49 = 2112;
    __int16 v50 = v7;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%@ clearing tracking of protocol connection %@", buf, 0x16u);
  }

  unsigned int v28 = [(APSUserCourier *)self protocolConnectionByIdentifier];
  BOOL v29 = [(APSProxyClient *)v7 identifier];
  [v28 setObject:0 forKeyedSubscript:v29];

  BOOL v30 = [(APSUserCourier *)self stateByConnectionIdentifier];
  char v31 = [(APSProxyClient *)v7 identifier];
  [v30 setObject:0 forKeyedSubscript:v31];

  if (a4 == 2)
  {
    if ([(APSProxyClient *)v7 connectionType] == (id)2)
    {
      long long v32 = +[APSLog courier];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        double v48 = self;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%@ Removing all pending messages due to a proxy disconnect.", buf, 0xCu);
      }

      [(APSOutgoingMessageQueue *)self->_outgoingMessageQueue transferOwnershipOfPendingMessagesToHandler:&stru_10012ABB0];
    }
    else
    {
      outgoingMessageQueue = self->_outgoingMessageQueue;
      id v34 = [(APSProxyClient *)v7 identifier];
      [(APSOutgoingMessageQueue *)outgoingMessageQueue handleConnectionClosedOnInterface:v34];
    }
    if ([(APSUserCourier *)self hasConnectedInterface])
    {
      long long v35 = +[APSLog courier];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        double v48 = self;
        __int16 v49 = 2112;
        __int16 v50 = v7;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%@ Resending any pending messages that had been sent over our now dead interface %@", buf, 0x16u);
      }

      [(APSUserCourier *)self _sendQueuedOutgoingMessages];
    }
    tokenRequestQueue = self->_tokenRequestQueue;
    long long v37 = [(APSProxyClient *)v7 identifier];
    [(APSOutgoingQueue *)tokenRequestQueue handleConnectionClosedOnInterface:v37];
  }
  [(APSUserCourier *)self logStateWithReason:0];
  [(APSUserCourier *)self _processShouldUseInternetChangeIfNecessary];
}

- (void)_didFinishAssertingAllPresences:(id)a3
{
  id v4 = a3;
  [v4 noteConnected];
  [(APSUserCourier *)self _reportAPSConnectivity];
  outgoingMessageQueue = self->_outgoingMessageQueue;
  id v6 = [v4 identifier];
  [(APSOutgoingMessageQueue *)outgoingMessageQueue handleConnectionOpenedOnInterface:v6];

  [(APSOutgoingQueue *)self->_tokenRequestQueue handleConnectionOpened];
  id v7 = self->_topicManager;
  LODWORD(v6) = [(APSTopicManager *)v7 pendingServerUpdate];
  [(APSUserCourier *)self _sendFilterMessageOnProtocolConnection:v4 withReason:0];
  if (v6)
  {
    uint64_t v8 = +[APSLog courier];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v20 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: There was a pending update, should send filter on all interfaces", buf, 0xCu);
    }

    uint64_t v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    id v15 = sub_100037AAC;
    id v16 = &unk_10012A8E8;
    id v17 = v4;
    uint64_t v18 = self;
    [(APSUserCourier *)self enumerateConnectedProtocolConnections:&v13];
  }
  id v9 = [(APSUserCourier *)self publicToken];
  [(APSUserCourier *)self _sendPubsubConnectMessageOnProtocolConnection:v4 token:v9];

  id v10 = +[APSLog courier];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v20 = self;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@: Sending presence tracking message following connect.", buf, 0xCu);
  }

  [(APSUserCourier *)self sendPresenceTrackingRequestOnProtocolConnection:v4];
  [(APSUserCourier *)self _adjustIsConnectedToService];
  [(APSUserCourier *)self _sendQueuedOutgoingMessages];
  [v4 connectionSetupComplete];
  id v11 = +[APSLog courier];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    cachedPublicToken = self->_cachedPublicToken;
    *(_DWORD *)buf = 138412290;
    __int16 v20 = (APSUserCourier *)cachedPublicToken;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Done asserting all presences. systemToken is: %@", buf, 0xCu);
  }
}

- (void)_sendPresenceMessageOnProtocolConnection:(id)a3 serverTime:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(APSUserCourier *)self publicToken];
  id v9 = [(APSUserCourier *)self courierUser];
  unsigned int v10 = [v9 isDefaultUser];

  id v11 = +[APSLog courier];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v12 = [(APSUserCourier *)self courierUser];
    uint64_t v13 = [v12 name];
    id v14 = [v8 length];
    id v15 = [v8 debugDescription];
    courierUser = self->_courierUser;
    *(_DWORD *)buf = 138413570;
    char v31 = self;
    __int16 v32 = 2112;
    uint64_t v33 = v13;
    __int16 v34 = 2048;
    id v35 = v14;
    __int16 v36 = 2112;
    long long v37 = v15;
    __int16 v38 = 2114;
    id v39 = v6;
    __int16 v40 = 2112;
    id v41 = courierUser;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ Sending presence message for %@ with token [length = %lu, token = %@] on interface: %{public}@ user: %@", buf, 0x3Eu);
  }
  CFStringRef v22 = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472;
  id v24 = sub_100037D78;
  uint32_t v25 = &unk_10012ABD8;
  unsigned int v26 = self;
  id v17 = v6;
  id v27 = v17;
  id v28 = v8;
  LOBYTE(v29) = v10;
  id v18 = v8;
  uint64_t v19 = objc_retainBlock(&v22);
  __int16 v20 = v19;
  if (v10)
  {
    id v21 = -[APSUserCourier stateForProtocolConnection:](self, "stateForProtocolConnection:", v17, v22, v23, v24, v25, v26, v27, v28, v29);
    [v21 setUserState:2];

    [(APSUserCourier *)self refreshCertNonceAndSignatureWithServerTime:v7 withCompletion:v20];
  }
  else
  {
    ((void (*)(void ***, uint64_t))v19[2])(v19, 1);
  }
}

- (void)_requestToSendFilterOnTopicManager:(id)a3 change:(id)a4
{
  id v5 = a4;
  [(APSUserCourier *)self _logTopics];
  if ([(APSUserCourier *)self shouldOnlySendFilterOnPreferredInterface])
  {
    [v5 setReason:3];
    id v6 = [(APSUserCourier *)self preferredProtocolConnection];
    [(APSUserCourier *)self _sendFilterMessageOnProtocolConnection:v6 withChange:v5];
  }
  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000381D8;
    v7[3] = &unk_10012A8E8;
    id v8 = v5;
    id v9 = self;
    [(APSUserCourier *)self enumerateConnectedProtocolConnections:v7];
  }
}

- (id)_topicsByHashFromTopicStateDictionary:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v11 = objc_msgSend(v5, "objectForKeyedSubscript:", v10, (void)v15);
        unint64_t v12 = [v11 topicName];
        [v4 setObject:v12 forKeyedSubscript:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  id v13 = [v4 copy];
  return v13;
}

- (id)_ultraConstrainedTopicsFromTopicDictionary:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        unint64_t v12 = [(APSUserCourier *)self topicManager];
        id v13 = [v6 objectForKeyedSubscript:v11];
        unsigned int v14 = [v12 hasUltraConstrainedPermissionForTopic:v13];

        if (v14)
        {
          long long v15 = [v6 objectForKeyedSubscript:v11];
          [v5 setObject:v15 forKeyedSubscript:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  id v16 = [v5 copy];
  return v16;
}

- (void)_sendFilterMessageOnProtocolConnection:(id)a3 withReason:(unint64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(APSFilterChange);
  [(APSFilterChange *)v7 setReason:a4];
  [(APSUserCourier *)self _sendFilterMessageOnProtocolConnection:v6 withChange:v7];
}

- (void)_sendFilterMessageOnProtocolConnection:(id)a3 withChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(APSUserCourier *)self topicManager];

  if (v8)
  {
    uint64_t v9 = [(APSUserCourier *)self publicToken];
    if (v9)
    {
      uint64_t v10 = [(APSUserCourier *)self topicManager];
      unsigned int v11 = [v10 hasListeningTopics];

      if (v11)
      {
        unint64_t v12 = [(APSUserCourier *)self topicManager];
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_100038864;
        v15[3] = &unk_10012AC00;
        v15[4] = self;
        id v16 = v6;
        id v17 = v7;
        uint64_t v9 = v9;
        long long v18 = v9;
        [v12 performFilterBlock:v15];
      }
      else
      {
        unsigned int v14 = +[APSLog courier];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          long long v20 = self;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@ asked to send filter but we have no listening topics!", buf, 0xCu);
        }

        [(APSUserCourier *)self _processShouldRunChangeIfNecessary];
      }
    }
    else
    {
      id v13 = +[APSLog courier];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        long long v20 = self;
        __int16 v21 = 2080;
        CFStringRef v22 = "-[APSUserCourier _sendFilterMessageOnProtocolConnection:withChange:]";
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@ %s called with an empty token", buf, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v9 = +[APSLog courier];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      long long v20 = (APSUserCourier *)"-[APSUserCourier _sendFilterMessageOnProtocolConnection:withChange:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s called with a null topic manager", buf, 0xCu);
    }
  }
}

- (void)_disconnectTokenWithReason:(unsigned int)a3 onProtocolConnection:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = +[APSLog courier];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(APSUser *)self->_courierUser name];
    *(_DWORD *)buf = 138412802;
    long long v20 = self;
    __int16 v21 = 2112;
    CFStringRef v22 = v8;
    __int16 v23 = 1024;
    LODWORD(v24) = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: Disconnect token %@ with reason %u", buf, 0x1Cu);
  }
  uint64_t v9 = [(APSUserCourier *)self stateForProtocolConnection:v6];
  uint64_t v10 = v9;
  if (self->_isConnectedToService)
  {
    if (![v9 userState])
    {
      [v10 setUserState:4];
      unsigned int v11 = [(APSUserCourier *)self filterVersionStateMachine];
      unint64_t v12 = [v6 identifier];
      [v11 clearInfoFor:v12];

      id v13 = +[APSLog courier];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v14 = [(APSUser *)self->_courierUser name];
        long long v15 = [(APSUserCourier *)self publicToken];
        *(_DWORD *)buf = 138412802;
        long long v20 = self;
        __int16 v21 = 2112;
        CFStringRef v22 = v14;
        __int16 v23 = 2112;
        id v24 = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@: Sending disconnect message for user %@ with token '%@'", buf, 0x20u);
      }
      [(APSUserCourier *)self setDisconnectReason:v4];
      id v16 = [(APSUserCourier *)self publicToken];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000391D4;
      v17[3] = &unk_10012A8C0;
      v17[4] = self;
      id v18 = v6;
      [v18 sendConnectMessageWithToken:v16 state:2 presenceFlags:0 hwVersion:0 swVersion:0 swBuild:0 certificates:0 nonce:0 signature:0 withCompletion:v17];
    }
  }
  else
  {
    [(APSUserCourier *)self _finishDisconnectForInterface:v6];
  }
}

- (void)_finishDisconnectForInterface:(id)a3
{
  id v4 = a3;
  id v5 = [(APSUserCourier *)self stateForProtocolConnection:v4];
  [v5 setUserState:3];
  id v6 = [(APSUserCourier *)self filterVersionStateMachine];
  id v7 = [v4 identifier];
  [v6 clearInfoFor:v7];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = [(APSUserCourier *)self connectionServers];
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      unint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * (void)v12) handleConnectionStatusChanged:0];
        unint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v10);
  }

  id v13 = [(APSUser *)self->_courierUser name];
  unsigned int v14 = +[APSSystemUser systemUserWithUserID:v13];

  if ([v14 isGuestUser] && objc_msgSend(v14, "isLoggedOut"))
  {
    long long v15 = +[APSLog courier];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [(APSUser *)self->_courierUser name];
      *(_DWORD *)buf = 138412546;
      CFStringRef v22 = self;
      __int16 v23 = 2112;
      id v24 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@: Removing obsolete token for logged out guest user %@", buf, 0x16u);
    }
    [(APSUserCourier *)self setPublicToken:0 fromServer:1];
  }
}

- (void)_sendActiveStateMessageWithSendAllBlueListMessages:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[APSLog courier];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (v3) {
      CFStringRef v6 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v11 = self;
    __int16 v12 = 2112;
    CFStringRef v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: Sending active interval message with send all messages '%@'", buf, 0x16u);
  }

  if (v3) {
    int v7 = 0x7FFFFFFF;
  }
  else {
    int v7 = 10;
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100039558;
  v8[3] = &unk_10012AB20;
  int v9 = v7;
  [(APSUserCourier *)self enumerateConnectedProtocolConnections:v8];
}

- (void)_sendOutgoingMessage:(id)a3 onProtocolConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [(APSUserCourier *)self preferredProtocolConnection];
  }
  id v10 = v9;
  topicHasher = self->_topicHasher;
  __int16 v12 = [v6 topic];
  CFStringRef v13 = [(APSUserCourier *)self courierUser];
  unsigned int v14 = [(APSTopicHasher *)topicHasher topicHashForTopic:v12 user:v13];

  long long v15 = [(APSUserCourier *)self courierUser];
  if ([v15 isDefaultUser])
  {
    id v16 = [v6 originator];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      long long v18 = 0;
      goto LABEL_12;
    }
  }
  else
  {
  }
  long long v19 = [v6 originator];
  long long v20 = [v19 publicToken];
  __int16 v21 = v20;
  if (v20)
  {
    id v22 = v20;
  }
  else
  {
    id v22 = [(APSUserCourier *)self publicToken];
  }
  long long v18 = v22;

LABEL_12:
  if (![(APSUserCourier *)self protocolConnectionHasSentActivityTrackingSalt:v10])
  {
    __int16 v23 = +[APSLog courier];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v55 = self;
      __int16 v56 = 2112;
      uint64_t v57 = v10;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%@ Sending activity tracking salt on %@ because we havne't sent it yet", buf, 0x16u);
    }

    [(APSUserCourier *)self sendPresenceTrackingRequestOnProtocolConnection:v10];
  }
  if (_os_feature_enabled_impl())
  {
    topicManager = self->_topicManager;
    uint32_t v25 = [v6 topic];
    BOOL v26 = [(APSTopicManager *)topicManager hasUltraConstrainedPermissionForTopic:v25];
  }
  else
  {
    BOOL v26 = 0;
  }
  outgoingMessageQueue = self->_outgoingMessageQueue;
  id v28 = [v10 identifier];
  uint64_t v29 = [(APSOutgoingMessageQueue *)outgoingMessageQueue lastReversePushRTTMillisecondsOnInterface:v28];
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_100039AF0;
  v49[3] = &unk_10012AC28;
  v49[4] = self;
  id v30 = v6;
  id v50 = v30;
  id v31 = v10;
  id v51 = v31;
  __int16 v32 = [v31 sendMessage:v30 topicHash:v14 lastRTT:v29 token:v18 ultraConstrainedAllowed:v26 withCompletion:v49];

  if (v32)
  {
    if ([v32 code] == (id)2) {
      [(APSOutgoingMessageQueue *)self->_outgoingMessageQueue handleErrorSendingOutgoingMessage:v30 error:v32];
    }
  }
  else
  {
    uint64_t v33 = self->_outgoingMessageQueue;
    __int16 v34 = [v31 identifier];
    [(APSOutgoingMessageQueue *)v33 handleSentOutgoingMessage:v30 onInterface:v34];

    uint64_t v46 = [(APSUserCourier *)self getConnectionTypeFromProtocolConnection:v31];
    unsigned int v47 = v18;
    v53[0] = v46;
    v52[0] = @"ConnectionType";
    v52[1] = @"ServerHostname";
    long long v45 = [v31 serverHostname];
    long long v44 = +[NSString stringWithFormat:@"%@", v45];
    v53[1] = v44;
    void v52[2] = @"ServerIP";
    long long v43 = [v31 serverIPAddress];
    long long v42 = +[NSString stringWithFormat:@"%@", v43];
    v53[2] = v42;
    v52[3] = @"LinkQuality";
    double v48 = v8;
    id v35 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v31 linkQuality]);
    v53[3] = v35;
    v52[4] = @"MessageIdentifier";
    __int16 v36 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v30 identifier]);
    v53[4] = v36;
    v52[5] = @"Topic";
    long long v37 = [v30 topic];
    v53[5] = v37;
    v52[6] = @"Priority";
    __int16 v38 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v30 priority]);
    v53[6] = v38;
    v52[7] = @"Size";
    id v39 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v30 payloadLength]);
    v53[7] = v39;
    +[NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:8];
    v41 = __int16 v40 = v14;

    id v8 = v48;
    long long v18 = v47;

    APSPowerLog();
    unsigned int v14 = v40;
  }
}

- (void)_sendQueuedOutgoingMessages
{
  BOOL v3 = [(APSOutgoingMessageQueue *)self->_outgoingMessageQueue outgoingMessagesToSend];
  if ([v3 count])
  {
    id v4 = +[APSLog courier];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(APSUser *)self->_courierUser name];
      *(_DWORD *)buf = 138412546;
      __int16 v23 = self;
      __int16 v24 = 2112;
      id v25 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@: Sending queued messages for user %@", buf, 0x16u);
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v17 = v3;
    id v6 = v3;
    id v7 = [v6 countByEnumeratingWithState:&v18 objects:v28 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          __int16 v12 = [v11 originator];
          unsigned int v13 = [v12 isConnected];

          if (v13)
          {
            [(APSUserCourier *)self _sendOutgoingMessage:v11 onProtocolConnection:0];
          }
          else
          {
            unsigned int v14 = +[APSLog courier];
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              id v15 = [v11 messageID];
              id v16 = [v11 originator];
              *(_DWORD *)buf = 138412802;
              __int16 v23 = self;
              __int16 v24 = 2048;
              id v25 = v15;
              __int16 v26 = 2112;
              id v27 = v16;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@: Tried to send outgoing message %lu but it's not connected yet, {Originator:%@}", buf, 0x20u);
            }
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v18 objects:v28 count:16];
      }
      while (v8);
    }

    BOOL v3 = v17;
  }
}

- (void)_reportAPSConnectivity
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100039F24;
  v5[3] = &unk_10012AC50;
  v5[4] = &v10;
  void v5[5] = &v6;
  [(APSUserCourier *)self enumerateConnectedProtocolConnections:v5];
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2050000000;
  BOOL v2 = (void *)qword_10015A870;
  uint64_t v18 = qword_10015A870;
  if (!qword_10015A870)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10003A444;
    v14[3] = &unk_10012AC78;
    v14[4] = &v15;
    sub_10003A444((uint64_t)v14);
    BOOL v2 = (void *)v16[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v15, 8);
  id v4 = [v3 sharedInterface];
  [v4 onAPSDConnectionChangeIsOverWiFi:*((unsigned __int8 *)v7 + 24) isOverCell:*((unsigned __int8 *)v11 + 24)];

  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
}

- (APSUserCourierDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (APSUserCourierDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isConnectedToService
{
  return self->_isConnectedToService;
}

- (APSEnvironment)environment
{
  return self->_environment;
}

- (NSArray)certificates
{
  return self->_certificates;
}

- (void)setCertificates:(id)a3
{
}

- (NSData)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (NSDate)lastPresence
{
  return self->_lastPresence;
}

- (void)setLastPresence:(id)a3
{
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (NSMutableArray)connectionServers
{
  return self->_connectionServers;
}

- (void)setConnectionServers:(id)a3
{
}

- (NSString)ifname
{
  return self->_ifname;
}

- (NSString)latestGeoRegion
{
  return self->_latestGeoRegion;
}

- (NSNumber)currentMessageID
{
  return self->_currentMessageID;
}

- (void)setCurrentMessageID:(id)a3
{
}

- (NSMutableArray)subscriptionRequests
{
  return self->_subscriptionRequests;
}

- (void)setSubscriptionRequests:(id)a3
{
}

- (unsigned)disconnectReason
{
  return self->_disconnectReason;
}

- (void)setDisconnectReason:(unsigned int)a3
{
  self->_disconnectReason = a3;
}

- (BOOL)hasFilterChanged
{
  return self->_hasFilterChanged;
}

- (void)setHasFilterChanged:(BOOL)a3
{
  self->_hasFilterChanged = a3;
}

- (BOOL)locallyDisabledFilterOptimization
{
  return self->_locallyDisabledFilterOptimization;
}

- (void)setLocallyDisabledFilterOptimization:(BOOL)a3
{
  self->_BOOL locallyDisabledFilterOptimization = a3;
}

- (BOOL)serverDisabledFilterOptimization
{
  return self->_serverDisabledFilterOptimization;
}

- (void)setServerDisabledFilterOptimization:(BOOL)a3
{
  self->_serverDisabledFilterOptimization = a3;
}

- (APSClientIdentityProvider)clientIdentityProvider
{
  return self->_clientIdentityProvider;
}

- (void)setClientIdentityProvider:(id)a3
{
}

- (APSSystemTokenStorage)systemTokenStorage
{
  return self->_systemTokenStorage;
}

- (void)setSystemTokenStorage:(id)a3
{
}

- (APSFilterVersionStateMachine)filterVersionStateMachine
{
  return self->_filterVersionStateMachine;
}

- (void)setFilterVersionStateMachine:(id)a3
{
}

- (APSDebugOverrides)debugOverrides
{
  return self->_debugOverrides;
}

- (void)setDebugOverrides:(id)a3
{
}

- (NSMutableDictionary)protocolConnectionByIdentifier
{
  return self->_protocolConnectionByIdentifier;
}

- (void)setProtocolConnectionByIdentifier:(id)a3
{
}

- (APSUser)courierUser
{
  return self->_courierUser;
}

- (void)setCourierUser:(id)a3
{
}

- (APSUserAppIDManager)userAppIDManager
{
  return self->_userAppIDManager;
}

- (void)setUserAppIDManager:(id)a3
{
}

- (NSMutableDictionary)stateByConnectionIdentifier
{
  return self->_stateByConnectionIdentifier;
}

- (void)setStateByConnectionIdentifier:(id)a3
{
}

- (APSProtocolConnectionEstablisher)protocolConnectionEstablisher
{
  return self->_protocolConnectionEstablisher;
}

- (void)setProtocolConnectionEstablisher:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocolConnectionEstablisher, 0);
  objc_storeStrong((id *)&self->_stateByConnectionIdentifier, 0);
  objc_storeStrong((id *)&self->_userAppIDManager, 0);
  objc_storeStrong((id *)&self->_courierUser, 0);
  objc_storeStrong((id *)&self->_protocolConnectionByIdentifier, 0);
  objc_storeStrong((id *)&self->_debugOverrides, 0);
  objc_storeStrong((id *)&self->_filterVersionStateMachine, 0);
  objc_storeStrong((id *)&self->_systemTokenStorage, 0);
  objc_storeStrong((id *)&self->_clientIdentityProvider, 0);
  objc_storeStrong((id *)&self->_subscriptionRequests, 0);
  objc_storeStrong((id *)&self->_currentMessageID, 0);
  objc_storeStrong((id *)&self->_ifname, 0);
  objc_storeStrong((id *)&self->_connectionServers, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_tracingEnabledAcksCollection, 0);
  objc_storeStrong((id *)&self->_weakSelf, 0);
  objc_storeStrong((id *)&self->_activeTaskServers, 0);
  objc_storeStrong((id *)&self->_symptomReporter, 0);
  objc_storeStrong((id *)&self->_tokenRequestQueue, 0);
  objc_storeStrong((id *)&self->_outgoingMessageQueue, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_certificate, 0);
  objc_storeStrong((id *)&self->_lastPresence, 0);
  objc_storeStrong((id *)&self->_latestGeoRegion, 0);
  objc_storeStrong((id *)&self->_lastConnectionAttempt, 0);
  objc_storeStrong((id *)&self->_lastActivityPresenceSaltRoll, 0);
  objc_storeStrong((id *)&self->_cachedPublicToken, 0);
  objc_storeStrong((id *)&self->_topicHasher, 0);
  objc_storeStrong((id *)&self->_tokenStore, 0);
  objc_storeStrong((id *)&self->_pushHistory, 0);
  objc_storeStrong((id *)&self->_proxyClientWithOutstandingPresence, 0);
  objc_storeStrong((id *)&self->_proxyClients, 0);
  objc_storeStrong((id *)&self->_redirectHost, 0);
  objc_storeStrong((id *)&self->_offendingTopics, 0);
  objc_storeStrong((id *)&self->_topicsToCauseWake, 0);
  objc_storeStrong((id *)&self->_lastReceivedTopicToCauseWake, 0);
  objc_storeStrong((id *)&self->_waitForStoredMessagesToArrivePowerAssertion, 0);
  objc_storeStrong((id *)&self->_resetInterfacePreferenceTimer, 0);
  objc_storeStrong((id *)&self->_inhibitedTopics, 0);
  objc_storeStrong((id *)&self->_wakeMetricTracker, 0);
  objc_storeStrong((id *)&self->_timeSinceLastKeepAlive, 0);
  objc_storeStrong((id *)&self->_keepAliveSent, 0);
  objc_storeStrong((id *)&self->_startedOpeningStream, 0);
  objc_storeStrong((id *)&self->_lastReceivedTimestamp, 0);
  objc_storeStrong((id *)&self->_lastReceivedTopic, 0);
  objc_storeStrong((id *)&self->_lastReceivedPayloadHash, 0);
  objc_storeStrong((id *)&self->_serverExpectedKeepAliveInterval, 0);
  objc_storeStrong((id *)&self->_delayedSuspendKeepAliveTimer, 0);
  objc_storeStrong((id *)&self->_delayedReconnectTimer, 0);
  objc_storeStrong((id *)&self->_pendingMessageReconnectTimer, 0);
  objc_storeStrong((id *)&self->_topicManager, 0);
  objc_storeStrong((id *)&self->_connectionPortNamesToConnections, 0);
  objc_storeStrong((id *)&self->_delayedKeepAlivePowerAssertion, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)recalculateTrackActivityPresence
{
  id v3 = +[APSLog activityTracking];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v23 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@: Recalculating activity presence", buf, 0xCu);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [(APSUserCourier *)self connectionServers];
  id v5 = [v4 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        char v9 = *(char **)(*((void *)&v18 + 1) + 8 * i);
        if ([v9 trackActivityPresence])
        {
          uint64_t v11 = +[APSLog activityTracking];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            __int16 v23 = self;
            __int16 v24 = 2112;
            id v25 = v9;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@: Connection %@ requesting activity presence tracking", buf, 0x16u);
          }

          BOOL v10 = 1;
          goto LABEL_15;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v18 objects:v28 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_15:

  if (self->_trackActivityPresence != v10)
  {
    self->_trackActivityPresence = v10;
    uint64_t v12 = +[APSLog activityTracking];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (v10) {
        char v13 = "enabled";
      }
      else {
        char v13 = "disabled";
      }
      unsigned int v14 = [(APSEnvironment *)self->_environment domain];
      *(_DWORD *)buf = 138412802;
      __int16 v23 = self;
      __int16 v24 = 2080;
      id v25 = v13;
      __int16 v26 = 2112;
      id v27 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@: Tracking activity presence is now %s for '%@'", buf, 0x20u);
    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10003A964;
    v17[3] = &unk_10012A848;
    v17[4] = self;
    [(APSUserCourier *)self enumerateConnectedProtocolConnections:v17];
    if (v10)
    {
      uint64_t v15 = [(APSUserCourier *)self preferredProtocolConnection];
      [(APSUserCourier *)self sendPresenceTrackingRequestOnProtocolConnection:v15];
    }
    else
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10003A9B0;
      v16[3] = &unk_10012A848;
      void v16[4] = self;
      [(APSUserCourier *)self enumerateConnectedProtocolConnections:v16];
    }
  }
}

- (void)sendPresenceTrackingRequestOnProtocolConnection:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(APSUserCourier *)self publicToken];
    unint64_t activityPresenceSalt = self->_activityPresenceSalt;
    if (!activityPresenceSalt)
    {
      [(APSUserCourier *)self _generateSalt];
      unint64_t activityPresenceSalt = self->_activityPresenceSalt;
    }
    BOOL trackActivityPresence = self->_trackActivityPresence;
    uint64_t v8 = [(APSUserCourier *)self protocolConnectionEstablisher];
    unint64_t v9 = (unint64_t)[v8 serverTimeInNanoSeconds] / 0xF4240;

    uint64_t v10 = arc4random_uniform(0xFFFFFFFE) + 1;
    uint64_t v11 = +[APSLog activityTracking];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134218498;
      uint64_t v14 = v10;
      __int16 v15 = 2048;
      BOOL v16 = trackActivityPresence;
      __int16 v17 = 2114;
      id v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Sending presence tracking request with ID:%lu and flag:%lu on interface %{public}@", (uint8_t *)&v13, 0x20u);
    }

    uint64_t v12 = [(APSUserCourier *)self stateForProtocolConnection:v4];
    [v12 setTrackingState:1];

    [v4 sendActivityTrackingRequestWithMessageID:v10 pushToken:v5 salt:activityPresenceSalt trackingFlag:trackActivityPresence timestamp:v9];
  }
  else
  {
    id v5 = +[APSLog activityTracking];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000C8860(v5);
    }
  }
}

- (void)markProtocolConnectionDisconnectedForActivityTracking:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(APSUserCourier *)self stateByConnectionIdentifier];
    id v6 = [v4 identifier];
    uint64_t v7 = [v5 objectForKeyedSubscript:v6];
    [v7 setTrackingState:0];
  }
  else
  {
    id v5 = +[APSLog activityTracking];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000C88A4(v5);
    }
  }
}

- (BOOL)protocolConnectionHasSentActivityTrackingSalt:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  id v5 = [(APSUserCourier *)self stateByConnectionIdentifier];
  id v6 = [v4 identifier];

  uint64_t v7 = [v5 objectForKeyedSubscript:v6];
  BOOL v8 = [v7 trackingState] == (id)1;

  return v8;
}

- (void)attemptToRollSalt
{
  id v3 = +[APSLog activityTracking];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412290;
    long long v21 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Attempting to roll activity presence salt. Self:%@", (uint8_t *)&v20, 0xCu);
  }

  if (![(APSUserCourier *)self hasConnectedInterface])
  {
    id v5 = [(APSUserCourier *)self environment];
    id v6 = [(APSUserCourier *)self preferredProtocolConnection];
    id v4 = +[APSConfiguration configurationForEnvironment:connectionType:](APSConfiguration, "configurationForEnvironment:connectionType:", v5, [v6 connectionType]);

    uint64_t v7 = [v4 minPresenceSaltRotationInterval];
    id v8 = [v7 unsignedIntegerValue];

    unint64_t v9 = self->_lastActivityPresenceSaltRoll;
    if (v9)
    {
      uint64_t v10 = 60 * (void)v8;
      if (!v8) {
        uint64_t v10 = 86400;
      }
      double v11 = (double)(unint64_t)v10;
      uint64_t v12 = +[NSDate now];
      [v12 timeIntervalSinceDate:v9];
      double v14 = v13;

      __int16 v15 = +[APSLog activityTracking];
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (v14 < v11)
      {
        if (v16)
        {
          int v20 = 134218240;
          long long v21 = (APSUserCourier *)v14;
          __int16 v22 = 2048;
          unint64_t v23 = (unint64_t)v11;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "It has not been long enough since the last roll. Time:%lu -- Min Interval:%lu", (uint8_t *)&v20, 0x16u);
        }

        goto LABEL_19;
      }
      if (v16)
      {
        int v20 = 134218240;
        long long v21 = (APSUserCourier *)v14;
        __int16 v22 = 2048;
        unint64_t v23 = (unint64_t)v11;
        __int16 v17 = "It has been long enough since our last roll. Time:%lu -- Min Interval:%lu";
        id v18 = v15;
        uint32_t v19 = 22;
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v20, v19);
      }
    }
    else
    {
      __int16 v15 = +[APSLog activityTracking];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        __int16 v17 = "We don't have a last salt roll time--rolling";
        id v18 = v15;
        uint32_t v19 = 2;
        goto LABEL_14;
      }
    }

    [(APSUserCourier *)self _generateSalt];
LABEL_19:

    goto LABEL_20;
  }
  id v4 = +[APSLog activityTracking];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Can not roll salt while courier is connected", (uint8_t *)&v20, 2u);
  }
LABEL_20:
}

- (void)_generateSalt
{
  id v3 = +[APSLog activityTracking];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Generating new presence salt", buf, 2u);
  }

  unint64_t __buf = 0;
  arc4random_buf(&__buf, 8uLL);
  self->_unint64_t activityPresenceSalt = __buf;
  id v4 = +[NSDate now];
  lastActivityPresenceSaltRoll = self->_lastActivityPresenceSaltRoll;
  self->_lastActivityPresenceSaltRoll = v4;
}

- (void)_handlePresenceTrackingResponse:(id)a3 onProtocolConnection:(id)a4
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"APSProtocolPresenceActivityMessageIDKey"];
  id v6 = [v4 objectForKeyedSubscript:@"APSProtocolPresenceActivityPushTokenKey"];
  uint64_t v7 = [v4 objectForKeyedSubscript:@"APSProtocolPresenceActivityStatusKey"];

  id v8 = +[APSLog activityTracking];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412802;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    double v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received presence tracking response message for token %@.  Status: %@. MessageID: %@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)_registerAppTokenCleanup
{
  id v3 = +[APSLog courier];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Registering for App Token Cleanup", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10003BCD0;
  handler[3] = &unk_10012AD00;
  objc_copyWeak(&v5, buf);
  xpc_activity_register("com.apple.aps.activity.apptokencleanup", XPC_ACTIVITY_CHECK_IN, handler);
  objc_destroyWeak(&v5);
  objc_destroyWeak(buf);
}

- (void)performAppTokenCleanup
{
  id v3 = +[APSLog courier];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = +[NSDate now];
    *(_DWORD *)buf = 138412546;
    id v59 = self;
    __int16 v60 = 2112;
    uint64_t v61 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@:Performing app token cleanup at %@", buf, 0x16u);
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = [(APSUserCourier *)self connectionServers];
  id v36 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v36)
  {
    uint64_t v35 = *(void *)v52;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v52 != v35) {
          objc_enumerationMutation(obj);
        }
        uint64_t v37 = v5;
        id v6 = *(void **)(*((void *)&v51 + 1) + 8 * v5);
        uint64_t v7 = [v6 enabledTopics];
        id v8 = [v7 mutableCopy];

        int v9 = [v6 ignoredTopics];
        id v10 = [v9 mutableCopy];
        [v8 addObjectsFromArray:v10];

        __int16 v11 = [v6 opportunisticTopics];
        id v12 = [v11 mutableCopy];
        [v8 addObjectsFromArray:v12];

        long long v42 = v6;
        __int16 v13 = [v6 nonWakingTopics];
        id v14 = [v13 mutableCopy];
        [v8 addObjectsFromArray:v14];

        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v38 = v8;
        id v40 = [v38 countByEnumeratingWithState:&v47 objects:v56 count:16];
        if (v40)
        {
          uint64_t v39 = *(void *)v48;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v48 != v39) {
                objc_enumerationMutation(v38);
              }
              uint64_t v41 = v15;
              uint64_t v16 = *(void *)(*((void *)&v47 + 1) + 8 * v15);
              tokenStore = self->_tokenStore;
              id v18 = [(APSUserCourier *)self courierUser];
              uint32_t v19 = [(APSTokenStore *)tokenStore tokenInfoArrayForTopic:v16 user:v18];

              long long v45 = 0u;
              long long v46 = 0u;
              long long v43 = 0u;
              long long v44 = 0u;
              id v20 = v19;
              id v21 = [v20 countByEnumeratingWithState:&v43 objects:v55 count:16];
              if (v21)
              {
                id v22 = v21;
                uint64_t v23 = *(void *)v44;
                do
                {
                  for (i = 0; i != v22; i = (char *)i + 1)
                  {
                    if (*(void *)v44 != v23) {
                      objc_enumerationMutation(v20);
                    }
                    id v25 = *(void **)(*((void *)&v43 + 1) + 8 * i);
                    uint64_t v26 = [v25 expirationDate];
                    if (v26)
                    {
                      id v27 = (void *)v26;
                      id v28 = [v25 expirationDate];
                      uint64_t v29 = +[NSDate date];
                      id v30 = [v28 compare:v29];

                      if (v30 == (id)-1)
                      {
                        id v31 = +[APSLog courier];
                        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412546;
                          id v59 = self;
                          __int16 v60 = 2112;
                          uint64_t v61 = v25;
                          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%@: Purging token for info %@", buf, 0x16u);
                        }

                        __int16 v32 = self->_tokenStore;
                        uint64_t v33 = [(APSUserCourier *)self courierUser];
                        [(APSTokenStore *)v32 setToken:0 forInfo:v25 user:v33];

                        [(APSUserCourier *)self connection:v42 didInvalidateTokenForInfo:v25];
                      }
                    }
                  }
                  id v22 = [v20 countByEnumeratingWithState:&v43 objects:v55 count:16];
                }
                while (v22);
              }

              uint64_t v15 = v41 + 1;
            }
            while ((id)(v41 + 1) != v40);
            id v40 = [v38 countByEnumeratingWithState:&v47 objects:v56 count:16];
          }
          while (v40);
        }

        uint64_t v5 = v37 + 1;
      }
      while ((id)(v37 + 1) != v36);
      id v36 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
    }
    while (v36);
  }
}

- (void)saveToken:(id)a3 forInfo:(id)a4 connection:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  int v9 = +[APSLog courier];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(APSEnvironment *)self->_environment domain];
    int v13 = 138413058;
    id v14 = self;
    __int16 v15 = 2112;
    id v16 = v7;
    __int16 v17 = 2112;
    id v18 = v10;
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ Adding token %@ into keychain for %@, %@", (uint8_t *)&v13, 0x2Au);
  }
  tokenStore = self->_tokenStore;
  id v12 = [(APSUserCourier *)self courierUser];
  [(APSTokenStore *)tokenStore setToken:v7 forInfo:v8 user:v12];
}

- (void)connection:(id)a3 didRequestTokenForInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[APSLog courier];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    long long v48 = self;
    __int16 v49 = 2112;
    id v50 = v6;
    __int16 v51 = 2112;
    id v52 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: Received request from %@ to generate token for info %@", buf, 0x20u);
  }

  int v9 = [v7 topic];
  id v10 = [v9 length];

  if (v10)
  {
    tokenStore = self->_tokenStore;
    id v12 = [(APSUserCourier *)self courierUser];
    id v46 = 0;
    int v13 = [(APSTokenStore *)tokenStore tokenForInfo:v7 user:v12 persistedInfo:&v46];
    id v14 = v46;

    __int16 v15 = [(APSUserCourier *)self publicToken];
    [v7 setBaseToken:v15];

    id v16 = +[APSLog courier];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = [v7 topic];
      *(_DWORD *)buf = 138413314;
      long long v48 = self;
      __int16 v49 = 2112;
      id v50 = v17;
      __int16 v51 = 2112;
      id v52 = v13;
      __int16 v53 = 2112;
      id v54 = v7;
      __int16 v55 = 2112;
      id v56 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@ found cached token for topic: %@, token: %@ for info %@ persisted info %@", buf, 0x34u);
    }
    if (v13)
    {
      uint64_t v18 = [v7 baseToken];
      if (v18)
      {
        __int16 v19 = (void *)v18;
        unsigned int v20 = [v14 isEqual:v7];

        if (v20)
        {
          id v21 = +[APSLog courier];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            long long v48 = self;
            __int16 v49 = 2112;
            id v50 = v13;
            __int16 v51 = 2112;
            id v52 = v7;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%@ handleReceivedToken: %@ forInfo %@", buf, 0x20u);
          }

          [v6 handleReceivedToken:v13 forInfo:v7];
          id v22 = [v14 baseToken];

          if (!v22) {
            [(APSUserCourier *)self saveToken:v13 forInfo:v7 connection:v6];
          }
          goto LABEL_24;
        }
      }
      if (v14)
      {
        uint64_t v23 = [v14 baseToken];
        if (v23)
        {
          __int16 v24 = (void *)v23;
          id v25 = [v14 baseToken];
          unsigned __int8 v26 = [v25 isEqualToData:self->_cachedPublicToken];

          if ((v26 & 1) == 0)
          {
            id v27 = +[APSLog courier];
            if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412802;
              long long v48 = self;
              __int16 v49 = 2112;
              id v50 = v7;
              __int16 v51 = 2112;
              id v52 = v14;
              _os_log_fault_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_FAULT, "%@ Found persisted token info, but the system token didn't match! TokenInfo %@ persisted TokenInfo %@", buf, 0x20u);
            }

            id v28 = +[APSLog courier];
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              long long v48 = self;
              __int16 v49 = 2112;
              id v50 = v7;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%@ Requesting a new token for info %@", buf, 0x16u);
            }
          }
        }
      }
      if ([v7 type]) {
        [(APSUserCourier *)self connection:v6 didInvalidateTokenForInfo:v7];
      }
    }
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_10003CACC;
    v42[3] = &unk_10012AD28;
    id v29 = v7;
    id v43 = v29;
    long long v44 = self;
    id v30 = v6;
    id v45 = v30;
    id v31 = objc_retainBlock(v42);
    tokenRequestQueue = self->_tokenRequestQueue;
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_10003CBE8;
    v38[3] = &unk_10012AD50;
    id v39 = v29;
    id v40 = self;
    id v41 = v30;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10003D16C;
    v34[3] = &unk_10012AD78;
    v34[4] = self;
    id v35 = v39;
    id v37 = v31;
    id v36 = v41;
    uint64_t v33 = v31;
    [(APSOutgoingQueue *)tokenRequestQueue enqueueSendBlock:v38 completionBlock:v34];

LABEL_24:
  }
}

- (void)connection:(id)a3 didRequestCurrentTokenForInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[APSLog courier];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    unsigned int v20 = self;
    __int16 v21 = 2112;
    id v22 = v6;
    __int16 v23 = 2112;
    id v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: Received request from %@ to fetch current token for info %@", buf, 0x20u);
  }

  int v9 = [v7 topic];
  id v10 = [v9 length];

  if (v10)
  {
    tokenStore = self->_tokenStore;
    id v12 = [(APSUserCourier *)self courierUser];
    id v18 = 0;
    int v13 = [(APSTokenStore *)tokenStore tokenForInfo:v7 user:v12 persistedInfo:&v18];
    id v14 = v18;

    __int16 v15 = +[APSLog courier];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [v7 topic];
      *(_DWORD *)buf = 138413058;
      unsigned int v20 = self;
      __int16 v21 = 2112;
      id v22 = v16;
      __int16 v23 = 2112;
      id v24 = v13;
      __int16 v25 = 2112;
      id v26 = v7;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@ found cached token for topic: %@, token: %@ for info %@", buf, 0x2Au);
    }
    if (v13)
    {
      __int16 v17 = +[APSLog courier];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        unsigned int v20 = self;
        __int16 v21 = 2112;
        id v22 = v13;
        __int16 v23 = 2112;
        id v24 = v14;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@ handleReceivedToken: %@ forInfo %@", buf, 0x20u);
      }

      [v6 handleReceivedToken:v13 forInfo:v14];
    }
  }
}

- (void)connection:(id)a3 didInvalidateTokenForInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[APSLog courier];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138412802;
    id v26 = self;
    __int16 v27 = 2112;
    id v28 = v6;
    __int16 v29 = 2112;
    id v30 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ asked by %@ to invalidate extended app token for info %@", (uint8_t *)&v25, 0x20u);
  }

  if (![v7 type])
  {
    int v9 = [(APSUserCourier *)self userAppIDManager];
    id v10 = [(APSEnvironment *)self->_environment name];
    __int16 v11 = [v7 topic];
    id v12 = [v7 identifier];
    [v9 removeAppIdForEnvironmentName:v10 topic:v11 identifier:v12];
  }
  tokenStore = self->_tokenStore;
  id v14 = [(APSUserCourier *)self courierUser];
  [(APSTokenStore *)tokenStore setToken:0 forInfo:v7 user:v14];

  __int16 v15 = self->_tokenStore;
  id v16 = [v7 topic];
  __int16 v17 = [(APSUserCourier *)self courierUser];
  id v18 = [(APSTokenStore *)v15 tokensForTopic:v16 user:v17 error:0];
  id v19 = [v18 count];

  unsigned int v20 = +[APSLog courier];
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (!v19)
  {
    if (v21)
    {
      __int16 v23 = [v7 topic];
      int v25 = 138412290;
      id v26 = v23;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "No tokens use salt anymore. Clearing salt for topic %@", (uint8_t *)&v25, 0xCu);
    }
    topicHasher = self->_topicHasher;
    unsigned int v20 = [v7 topic];
    id v22 = [(APSUserCourier *)self courierUser];
    [(APSTopicHasher *)topicHasher clearSaltForTopic:v20 user:v22];
    goto LABEL_11;
  }
  if (v21)
  {
    id v22 = [v7 topic];
    int v25 = 138412290;
    id v26 = v22;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Still existing tokens for topic %@. Not clearing salt.", (uint8_t *)&v25, 0xCu);
LABEL_11:
  }
}

- (id)connection:(id)a3 createURLTokenForToken:(id)a4
{
  id v5 = a4;
  id v6 = sub_10007E7E4(v5);
  id v7 = [(APSUserCourier *)self urlPrefix];
  id v8 = [v7 stringByAppendingString:v6];
  id v9 = [objc_alloc((Class)APSURLToken) initWithTokenURL:v8 token:v5];

  return v9;
}

- (id)urlPrefix
{
  id v3 = [(APSUserCourier *)self environment];
  id v4 = [(APSUserCourier *)self preferredProtocolConnection];
  id v5 = +[APSConfiguration configurationForEnvironment:connectionType:](APSConfiguration, "configurationForEnvironment:connectionType:", v3, [v4 connectionType]);
  id v6 = [v5 urlTokenPrefix];

  if (!v6)
  {
    id v7 = [(APSUserCourier *)self environment];
    id v8 = [v7 name];
    unsigned int v9 = [v8 isEqualToString:APSEnvironmentProduction];

    if (v9) {
      id v6 = @"https://web.push.apple.com/";
    }
    else {
      id v6 = @"https://web.sandbox.push.apple.com/";
    }
  }
  return v6;
}

- (void)_handleAppTokenGenerateResponse:(id)a3 onProtocolConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[APSLog courier];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = self;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: Received app token generate response %@", (uint8_t *)&v11, 0x16u);
  }

  tokenRequestQueue = self->_tokenRequestQueue;
  id v10 = [v7 identifier];

  [(APSOutgoingQueue *)tokenRequestQueue handleResponseForPendingItem:v6 error:0 onInterface:v10];
}

- (void)subscribeToChannels:(id)a3 forTopic:(id)a4 token:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v27 = a5;
  id v28 = +[NSMutableArray array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v8;
  id v10 = [obj countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v30 = *(void *)v32;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v32 != v30) {
          objc_enumerationMutation(obj);
        }
        id v13 = [objc_alloc((Class)CUTWeakLinkClass()) initWithDictionary:*(void *)(*((void *)&v31 + 1) + 8 * i)];
        [v13 setChannelTopic:v9];
        id v14 = [(APSUserCourier *)self environment];
        __int16 v15 = [v14 name];
        [v13 setEnvironment:v15];

        id v16 = [(APSUserCourier *)self courierUser];
        __int16 v17 = [v16 pubSubName];
        [v13 setTokenName:v17];

        id v18 = +[APSLog pubSub];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v39 = v13;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Incoming pubsub subscription for %@", buf, 0xCu);
        }

        id v19 = +[APSMessageStore sharedInstance];
        unsigned int v20 = [v13 channelID];
        BOOL v21 = [v13 environment];
        id v22 = [v13 tokenName];
        __int16 v23 = [v19 lookupChannelWithChannelID:v20 andPushTopic:v9 environment:v21 userName:v22];

        if (v23)
        {
          v36[0] = @"channelID";
          id v24 = [v13 channelID];
          v36[1] = @"reason";
          v37[0] = v24;
          v37[1] = &off_100137860;
          int v25 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];

          id v35 = v25;
          id v26 = +[NSArray arrayWithObjects:&v35 count:1];
          [(APSUserCourier *)self sendFailuresToClient:v26 pushTopic:v9];
        }
        else
        {
          [v19 storeChannel:v13];
          [v28 addObject:v13];
        }
      }
      id v11 = [obj countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v11);
  }

  [(APSUserCourier *)self _handlePubSubRequest:v28 unsubscriptionChannels:0 token:v27];
}

- (void)unsubscribeFromChannels:(id)a3 forTopic:(id)a4 token:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v25 = a5;
  id v27 = +[NSMutableArray array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v8;
  id v29 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v29)
  {
    uint64_t v28 = *(void *)v32;
    id v30 = v9;
    do
    {
      for (i = 0; i != v29; i = (char *)i + 1)
      {
        if (*(void *)v32 != v28) {
          objc_enumerationMutation(obj);
        }
        id v11 = [objc_alloc((Class)CUTWeakLinkClass()) initWithDictionary:*(void *)(*((void *)&v31 + 1) + 8 * i)];
        [v11 setChannelTopic:v9];
        id v12 = +[APSLog pubSub];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v36 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Incoming pubsub unsubscribe request for %@", buf, 0xCu);
        }

        id v13 = +[APSMessageStore sharedInstance];
        id v14 = [v11 channelID];
        __int16 v15 = [(APSUserCourier *)self environment];
        id v16 = [v15 name];
        __int16 v17 = [(APSUserCourier *)self courierUser];
        id v18 = [v17 pubSubName];
        id v19 = [v13 lookupChannelWithChannelID:v14 andPushTopic:v9 environment:v16 userName:v18];

        if (v19)
        {
          unsigned int v20 = [v11 channelID];
          BOOL v21 = [(APSUserCourier *)self environment];
          id v22 = [v21 name];
          __int16 v23 = [(APSUserCourier *)self courierUser];
          id v24 = [v23 pubSubName];
          [v13 deleteChannelID:v20 forTopic:v30 environment:v22 userName:v24];

          [v27 addObject:v11];
        }

        id v9 = v30;
      }
      id v29 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v29);
  }

  [(APSUserCourier *)self _handlePubSubRequest:0 unsubscriptionChannels:v27 token:v25];
}

- (void)_handlePubSubRequest:(id)a3 unsubscriptionChannels:(id)a4 token:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count] || objc_msgSend(v9, "count"))
  {
    id v24 = v9;
    id v26 = objc_msgSend(v8, "mutableCopy", v10);
    id v11 = self->_topicManager;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = v8;
    id v12 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v32;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v32 != v14) {
            objc_enumerationMutation(obj);
          }
          id v16 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          topicHasher = self->_topicHasher;
          id v18 = [v16 channelTopic];
          id v19 = [(APSUserCourier *)self courierUser];
          unsigned int v20 = [(APSTopicHasher *)topicHasher topicHashForTopic:v18 user:v19];

          BOOL v21 = [(APSTopicManager *)v11 hasIgnoredTopicHash:v20];

          if (v21) {
            [v26 removeObject:v16];
          }
        }
        id v13 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v13);
    }

    id v22 = v26;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000A3328;
    v27[3] = &unk_10012C2C8;
    v27[4] = self;
    id v28 = v22;
    id v9 = v24;
    id v29 = v24;
    id v10 = v23;
    id v30 = v23;
    id v8 = v22;
    [(APSUserCourier *)self enumerateConnectedProtocolConnections:v27];
  }
}

- (void)_retryRequestAfterDelay:(id)a3
{
  id v4 = a3;
  id v5 = [(APSUserCourier *)self environment];
  +[APSConfiguration configurationForEnvironment:connectionType:](APSConfiguration, "configurationForEnvironment:connectionType:", v5, [v4 connectionType]);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = [v9 pubSubDefaultTimeout];
  id v7 = [v6 unsignedIntegerValue];
  if (v7) {
    double v8 = (double)(unint64_t)v7;
  }
  else {
    double v8 = 30.0;
  }

  [(APSUserCourier *)self _retryRequestAfterDelay:v4 withDelay:v8];
}

- (void)_retryRequestAfterDelay:(id)a3 withDelay:(double)a4
{
  id v6 = a3;
  if (v6)
  {
    if ([(APSUserCourier *)self hasConnectedInterfaceOfType:2])
    {
      id v7 = +[APSLog pubSub];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Device is in proxy mode, do not retry pubsub request", buf, 2u);
      }
    }
    else if ([v6 retryCount])
    {
      objc_msgSend(v6, "setRetryCount:", (char *)objc_msgSend(v6, "retryCount") - 1);
      dispatch_source_t v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
      [v6 setTimeoutSource:v8];

      id v9 = [v6 timeoutSource];
      dispatch_time_t v10 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
      dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0);

      objc_initWeak((id *)buf, v6);
      objc_initWeak(&location, self);
      id v11 = [v6 timeoutSource];
      id v16 = _NSConcreteStackBlock;
      uint64_t v17 = 3221225472;
      id v18 = sub_1000A3924;
      id v19 = &unk_10012C2F0;
      objc_copyWeak(&v21, (id *)buf);
      objc_copyWeak(&v22, &location);
      id v12 = v6;
      id v20 = v12;
      dispatch_source_set_event_handler(v11, &v16);

      id v13 = objc_msgSend(v12, "timeoutSource", v16, v17, v18, v19);
      dispatch_resume(v13);

      objc_destroyWeak(&v22);
      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      uint64_t v14 = +[APSLog pubSub];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v6;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "PubSub request %@ has exceeded its retry limit.  Abandoning.", buf, 0xCu);
      }

      __int16 v15 = [(APSUserCourier *)self subscriptionRequests];
      [v15 removeObject:v6];
    }
  }
}

- (id)allRegisteredChannelsForTopic:(id)a3
{
  id v4 = a3;
  id v5 = +[APSMessageStore sharedInstance];
  id v6 = [(APSUserCourier *)self environment];
  id v7 = [v6 name];
  dispatch_source_t v8 = [(APSUserCourier *)self courierUser];
  id v9 = [v8 pubSubName];
  dispatch_time_t v10 = [v5 allRegisteredChannelsForTopic:v4 environment:v7 userName:v9];

  return v10;
}

- (void)_sendPubsubConnectMessageOnProtocolConnection:(id)a3 token:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  id v7 = [(APSUserCourier *)self courierUser];
  dispatch_source_t v8 = [v7 pubSubName];

  id v9 = +[APSMessageStore sharedInstance];
  dispatch_time_t v10 = [(APSUserCourier *)self environment];
  id v11 = [v10 name];
  id v12 = [v9 allRegisteredChannelsForEnvironment:v11 userName:v8];

  if (v12 && [v12 count])
  {
    id v13 = [APSPubSubRequest alloc];
    uint64_t v14 = [(APSUserCourier *)self _getNextMessageID];
    __int16 v15 = [v12 firstObject];
    id v16 = [v15 tokenName];
    uint64_t v17 = -[APSPubSubRequest initWithSubscriptionChannels:unsubscriptionChannels:messageID:userName:token:subscriptionType:connectionType:retryCount:](v13, "initWithSubscriptionChannels:unsubscriptionChannels:messageID:userName:token:subscriptionType:connectionType:retryCount:", v12, 0, v14, v16, v6, 1, [v23 connectionType], 3);

    id v18 = [(APSPubSubRequest *)v17 messageID];
    id v19 = [v18 unsignedIntValue];

    id v20 = [(APSUserCourier *)self subscriptionRequests];

    if (!v20)
    {
      id v21 = +[NSMutableArray array];
      [(APSUserCourier *)self setSubscriptionRequests:v21];
    }
    id v22 = [(APSUserCourier *)self subscriptionRequests];
    [v22 addObject:v17];

    [(APSUserCourier *)self _writePubSubMessagetoConnection:v17 messageID:v19 token:v6 connectionType:[(APSPubSubRequest *)v17 connectionType]];
    [(APSUserCourier *)self _retryRequestAfterDelay:v17];
  }
}

- (void)_writePubSubMessagetoConnection:(id)a3 messageID:(unsigned int)a4 token:(id)a5 connectionType:(int64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = [v10 metadata];
  id v13 = [v10 metadata];

  if (v13)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000A3E94;
    v14[3] = &unk_10012C318;
    id v15 = v10;
    id v16 = self;
    int64_t v19 = a6;
    id v17 = v12;
    id v18 = v11;
    unsigned int v20 = a4;
    [(APSUserCourier *)self enumerateConnectedProtocolConnectionsOfType:a6 block:v14];
  }
}

- (void)_removePendingRequestsForProtocolConnection:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(APSUserCourier *)self subscriptionRequests];
  id v6 = [v5 mutableCopy];

  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        if (v4)
        {
          id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          id v12 = [v11 connectionType];
          if (v12 == [v4 connectionType])
          {
            [(APSUserCourier *)self _cancelRequest:v11];
            id v13 = [(APSUserCourier *)self subscriptionRequests];
            [v13 removeObject:v11];
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)_handlePubSubSubscriptionResponse:(id)a3 fromAgent:(BOOL)a4 onProtocolConnection:(id)a5
{
  id v7 = a3;
  id v62 = a5;
  uint64_t v8 = [v7 objectForKeyedSubscript:@"APSProtocolPubSubToken"];
  __int16 v64 = [v7 objectForKeyedSubscript:@"APSProtocolPubSubTimeout"];
  uint64_t v9 = [v7 objectForKeyedSubscript:@"APSProtocolPubSubStatus"];
  uint64_t v10 = [v7 objectForKeyedSubscript:@"APSProtocolPubSubMessageID"];
  unsigned __int8 v63 = v7;
  uint64_t v61 = [v7 objectForKeyedSubscript:@"APSProtocolPubSubPayload"];
  unsigned __int8 v68 = (void *)v10;
  __int16 v65 = (void *)v9;
  __int16 v66 = (void *)v8;
  if (v10) {
    BOOL v11 = v8 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11 && v9 != 0)
  {
    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v14 = [(APSUserCourier *)self subscriptionRequests];
    long long v15 = [v14 countByEnumeratingWithState:&v85 objects:v101 count:16];
    long long v16 = v15;
    if (v15)
    {
      uint64_t v17 = *(void *)v86;
      while (2)
      {
        id v18 = 0;
        do
        {
          if (*(void *)v86 != v17) {
            objc_enumerationMutation(v14);
          }
          int64_t v19 = *(void **)(*((void *)&v85 + 1) + 8 * (void)v18);
          unsigned int v20 = [v19 messageID];
          unsigned int v21 = [v20 isEqualToNumber:v68];

          if (v21)
          {
            long long v16 = v19;
            goto LABEL_21;
          }
          id v18 = ((char *)v18 + 1);
        }
        while (v16 != v18);
        long long v16 = [v14 countByEnumeratingWithState:&v85 objects:v101 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
LABEL_21:

    __int16 v60 = v16;
    if (!v16 && !a4)
    {
      uint64_t v74 = +[APSLog pubSub];
      if (os_log_type_enabled(v74, OS_LOG_TYPE_FAULT)) {
        sub_1000CB720();
      }
      goto LABEL_77;
    }
    if (a4)
    {
      id v22 = [(APSUserCourier *)self courierUser];
      uint64_t v74 = [v22 pubSubName];
    }
    else
    {
      [(APSUserCourier *)self _cancelRequest:v16];
      id v23 = [(APSUserCourier *)self subscriptionRequests];
      [v23 removeObject:v16];

      uint64_t v74 = [v16 userName];
    }
    unsigned int v24 = [(APSUserCourier *)self _isResponseForProxyDevice:v66];
    unsigned int v25 = [v65 intValue];
    if (v24)
    {
      if (v25 == 3)
      {
        id v26 = +[APSLog pubSub];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          id v27 = [v16 retryCount];
          *(_DWORD *)buf = 138412802;
          v90 = self;
          __int16 v91 = 2112;
          id v92 = v16;
          __int16 v93 = 2048;
          id v94 = v27;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%@ The PubSub request %@ was told to retry.  Retry attempts left %lu", buf, 0x20u);
        }

        id v28 = v64;
        if (v64) {
          goto LABEL_50;
        }
        id v29 = +[APSLog pubSub];
        if (!os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        {
LABEL_49:

          [(APSUserCourier *)self _retryRequestAfterDelay:v16];
          id v28 = 0;
LABEL_50:
          [v28 doubleValue];
          id v13 = v16;
          -[APSUserCourier _retryRequestAfterDelay:withDelay:](self, "_retryRequestAfterDelay:withDelay:", v16);
LABEL_78:

          goto LABEL_79;
        }
LABEL_48:
        sub_1000CB5E8();
        goto LABEL_49;
      }
      id v30 = [(APSUserCourier *)self _findConnectedClientWithToken:v66 onProtocolConnection:v62];
      [v30 sendPubSubChannelListResponse:v63];
      goto LABEL_43;
    }
    switch(v25)
    {
      case 4u:
        id v30 = +[APSLog pubSub];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
          sub_1000CB650();
        }
        goto LABEL_43;
      case 3u:
        long long v31 = +[APSLog pubSub];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          id v32 = [v16 retryCount];
          *(_DWORD *)buf = 138412802;
          v90 = self;
          __int16 v91 = 2112;
          id v92 = v16;
          __int16 v93 = 2048;
          id v94 = v32;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%@ The PubSub request %@ was told to retry.  Retry attempts left %lu", buf, 0x20u);
        }

        id v28 = v64;
        if (v64) {
          goto LABEL_50;
        }
        id v29 = +[APSLog pubSub];
        if (!os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
          goto LABEL_49;
        }
        goto LABEL_48;
      case 1u:
        id v30 = +[APSLog pubSub];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
          sub_1000CB6B8();
        }
LABEL_43:

LABEL_77:
        id v13 = v60;
        goto LABEL_78;
    }
    long long v33 = +[APSLog pubSub];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v90 = self;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%@ Received a response message for PubSub request", buf, 0xCu);
    }

    id v59 = [[PSChannelSubscriptionsResponsePayload alloc] initWithData:v61];
    [(PSChannelSubscriptionsResponsePayload *)v59 appChannelSubscriptionResponses];
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v70 = [obj countByEnumeratingWithState:&v81 objects:v100 count:16];
    if (!v70)
    {
LABEL_76:

      goto LABEL_77;
    }
    uint64_t v69 = *(void *)v82;
    long long v34 = &OBJC_METACLASS___APSOutgoingQueue;
LABEL_55:
    uint64_t v35 = 0;
    while (1)
    {
      if (*(void *)v82 != v69) {
        objc_enumerationMutation(obj);
      }
      uint64_t v71 = v35;
      id v36 = *(void **)(*((void *)&v81 + 1) + 8 * v35);
      id v37 = [v36 appId];
      id v38 = [v36 subscriptionChannelResponses];
      id v39 = [v36 unsubscriptionChannelResponses];
      [v38 addObjectsFromArray:v39];

      unsigned int v72 = +[NSMutableArray array];
      long long v77 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      id v73 = v38;
      id v40 = [v73 countByEnumeratingWithState:&v77 objects:v99 count:16];
      if (v40) {
        break;
      }
LABEL_72:

      if ([v72 count]) {
        [(APSUserCourier *)self sendFailuresToClient:v72 pushTopic:v37];
      }

      uint64_t v35 = v71 + 1;
      if ((id)(v71 + 1) == v70)
      {
        id v70 = [obj countByEnumeratingWithState:&v81 objects:v100 count:16];
        if (!v70) {
          goto LABEL_76;
        }
        goto LABEL_55;
      }
    }
    id v41 = v40;
    uint64_t v42 = *(void *)v78;
LABEL_60:
    uint64_t v43 = 0;
    while (1)
    {
      if (*(void *)v78 != v42) {
        objc_enumerationMutation(v73);
      }
      long long v44 = *(void **)(*((void *)&v77 + 1) + 8 * v43);
      unsigned int v45 = [v44 channelStatus];
      if (v45 == 1) {
        break;
      }
      if (!v45)
      {
        uint64_t v46 = -[APSUserCourier _protoSubscriptionFailureToReadableFailure:](self, "_protoSubscriptionFailureToReadableFailure:", [v44 channelStatus]);
        long long v47 = [v44 channelId];
        uint64_t v48 = [v47 base64EncodedStringWithOptions:0];

        long long v76 = (void *)v48;
        v97[0] = @"channelID";
        v97[1] = @"reason";
        v98[0] = v48;
        __int16 v49 = +[NSNumber numberWithInt:v46];
        v98[1] = v49;
        id v50 = +[NSDictionary dictionaryWithObjects:v98 forKeys:v97 count:2];

        [v72 addObject:v50];
        __int16 v51 = +[APSLog pubSub];
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138413058;
          v90 = self;
          __int16 v91 = 2112;
          id v92 = v48;
          __int16 v93 = 2112;
          id v94 = v37;
          __int16 v95 = 1024;
          int v96 = v46;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "%@ The channel %@ on topic %@ failed to subscribe with reason %u Removing subscription...", buf, 0x26u);
        }

        id v52 = [&v34[6] sharedInstance];
        __int16 v53 = [(APSUserCourier *)self environment];
        id v54 = [v53 name];
        [v52 deleteChannelID:v76 forTopic:v37 environment:v54 userName:v74];

        goto LABEL_69;
      }
LABEL_70:
      if (v41 == (id)++v43)
      {
        id v41 = [v73 countByEnumeratingWithState:&v77 objects:v99 count:16];
        if (!v41) {
          goto LABEL_72;
        }
        goto LABEL_60;
      }
    }
    __int16 v55 = [v44 channelId];
    uint64_t v56 = [v55 base64EncodedStringWithOptions:0];

    id v50 = [&v34[6] sharedInstance];
    uint64_t v57 = [(APSUserCourier *)self environment];
    __int16 v58 = [v57 name];
    long long v76 = (void *)v56;
    id v52 = [v50 lookupChannelWithChannelID:v56 andPushTopic:v37 environment:v58 userName:v74];

    long long v34 = &OBJC_METACLASS___APSOutgoingQueue;
    objc_msgSend(v52, "setCheckpoint:", objc_msgSend(v44, "channelSubscriptionCheckpoint"));
    [v50 updateChannel:v52];
LABEL_69:

    goto LABEL_70;
  }
  id v13 = +[APSLog pubSub];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_1000CB794();
  }
LABEL_79:
}

- (BOOL)_isResponseForProxyDevice:(id)a3
{
  uint64_t v10 = 0;
  BOOL v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000A4CEC;
  v6[3] = &unk_10012C340;
  id v7 = self;
  id v3 = a3;
  id v8 = v3;
  uint64_t v9 = &v10;
  [(APSUserCourier *)v7 enumerateConnectedProtocolConnections:v6];
  char v4 = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v4;
}

- (int)_protoSubscriptionFailureToReadableFailure:(int)a3
{
  if (a3) {
    return -1;
  }
  else {
    return 0;
  }
}

- (void)sendFailuresToClient:(id)a3 pushTopic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(APSUserCourier *)self connectionServers];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v8) {
    goto LABEL_16;
  }
  id v9 = v8;
  char v10 = 0;
  uint64_t v11 = *(void *)v20;
  do
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v20 != v11) {
        objc_enumerationMutation(obj);
      }
      char v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      long long v14 = [v13 enabledTopics];
      long long v15 = [v13 opportunisticTopics];
      long long v16 = [v13 nonWakingTopics];
      if (([v14 containsObject:v7] & 1) != 0
        || ([v16 containsObject:v7] & 1) != 0
        || ([v15 containsObject:v7] & 1) != 0
        || ([v14 containsObject:@"*"] & 1) != 0
        || ([v15 containsObject:@"*"] & 1) != 0
        || [v16 containsObject:@"*"])
      {
        [v13 handleChannelSubscriptionFailures:v6 forTopic:v7];
        char v10 = 1;
      }
    }
    id v9 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  }
  while (v9);
  if ((v10 & 1) == 0)
  {
LABEL_16:
    uint64_t v17 = +[APSLog pubSub];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000CB7FC();
    }
  }
}

- (void)handleIgnoredTopics:(id)a3
{
  id v4 = a3;
  [(APSUserCourier *)self _resetCheckpointForIgnoredTopics:v4];
  id v5 = +[NSMutableArray array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = objc_msgSend(v4, "allObjects", 0);
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      char v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [(APSUserCourier *)self allRegisteredChannelsForTopic:*(void *)(*((void *)&v13 + 1) + 8 * (void)v10)];
        [v5 addObjectsFromArray:v11];

        char v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    uint64_t v12 = [(APSUserCourier *)self publicToken];
    [(APSUserCourier *)self _handlePubSubRequest:0 unsubscriptionChannels:v5 token:v12];
  }
}

- (void)_resetCheckpointForIgnoredTopics:(id)a3
{
  id v4 = [a3 allObjects];
  id v5 = +[APSMessageStore sharedInstance];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v28;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v11 = [(APSUserCourier *)self environment];
        uint64_t v12 = [v11 name];
        long long v13 = [(APSUserCourier *)self courierUser];
        long long v14 = [v13 pubSubName];
        long long v15 = [v5 allRegisteredChannelsForTopic:v10 environment:v12 userName:v14];

        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v16 = v15;
        id v17 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v17)
        {
          id v18 = v17;
          uint64_t v19 = *(void *)v24;
          do
          {
            for (j = 0; j != v18; j = (char *)j + 1)
            {
              if (*(void *)v24 != v19) {
                objc_enumerationMutation(v16);
              }
              long long v21 = *(void **)(*((void *)&v23 + 1) + 8 * (void)j);
              [v21 resetCheckpoint];
              [v5 updateChannel:v21];
            }
            id v18 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v18);
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v7);
  }
}

- (void)subscribeToPreviouslyIgnoredTopics:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = objc_msgSend(v4, "allObjects", 0);
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [(APSUserCourier *)self allRegisteredChannelsForTopic:*(void *)(*((void *)&v13 + 1) + 8 * (void)v10)];
        [v5 addObjectsFromArray:v11];

        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    uint64_t v12 = [(APSUserCourier *)self publicToken];
    [(APSUserCourier *)self _handlePubSubRequest:v5 unsubscriptionChannels:0 token:v12];
  }
}

- (id)_getNextMessageID
{
  id v3 = [(APSUserCourier *)self currentMessageID];

  if (!v3) {
    [(APSUserCourier *)self setCurrentMessageID:&off_100137878];
  }
  id v4 = [(APSUserCourier *)self currentMessageID];
  uint64_t v5 = [v4 unsignedIntValue];

  id v6 = +[NSNumber numberWithInteger:v5 + 1];
  [(APSUserCourier *)self setCurrentMessageID:v6];

  return [(APSUserCourier *)self currentMessageID];
}

- (void)_handlePubSubUpdateMessage:(id)a3 onProtocolConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKeyedSubscript:@"APSProtocolPubSubUpdatePayload"];
  uint64_t v9 = [v6 objectForKeyedSubscript:@"APSProtocolPubSubUpdateToken"];
  uint64_t v10 = +[APSLog pubSub];
  uint64_t v11 = v10;
  if (v8) {
    BOOL v12 = v9 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000CB864();
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received pubsub update message for token %@", (uint8_t *)&v17, 0xCu);
    }

    if ([(APSUserCourier *)self _isResponseForProxyDevice:v9])
    {
      uint64_t v11 = [(APSUserCourier *)self _findConnectedClientWithToken:v9 onProtocolConnection:v7];
      -[NSObject sendPubSubUpdateMessage:forConnectionType:](v11, "sendPubSubUpdateMessage:forConnectionType:", v6, [v7 connectionType]);
    }
    else
    {
      uint64_t v11 = [[PSChannelSubscriptionsUpdatePayload alloc] initWithData:v8];
      long long v14 = [v11 subscriptionUpdates];
      id v15 = [v14 count];

      if (v15)
      {
        [(APSUserCourier *)self _handleSubscriptionUpdateCommand:v11 token:v9 protocolConnection:v7];
      }
      else
      {
        long long v16 = [v11 appChannelUpdates];

        if (v16) {
          [(APSUserCourier *)self _handleChannelUpdateCommand:v11];
        }
      }
    }
  }
}

- (void)_handleSubscriptionUpdateCommand:(id)a3 token:(id)a4 protocolConnection:(id)a5
{
  id v21 = a4;
  id v8 = a5;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v9 = [a3 subscriptionUpdates];
  id v10 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v10)
  {
    id v12 = v10;
    uint64_t v13 = *(void *)v23;
    *(void *)&long long v11 = 138412290;
    long long v20 = v11;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v9);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "subscriptionsStatus", v20))
        {
          v28[0] = @"Environment";
          id v15 = [(APSUserCourier *)self environment];
          long long v16 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v15 environmentType]);
          v29[0] = v16;
          v29[1] = &off_100137890;
          v28[1] = @"MessageType";
          v28[2] = @"ConnectionType";
          int v17 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v8 connectionType]);
          v29[2] = v17;
          id v18 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:3];

          APSPubSubPowerLog();
          uint64_t v19 = +[APSLog pubSub];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v20;
            long long v27 = self;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@ Resending full subscription list in response to an incoming command 30.", buf, 0xCu);
          }

          [(APSUserCourier *)self _sendPubsubConnectMessageOnProtocolConnection:v8 token:v21];
        }
      }
      id v12 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v12);
  }
}

- (void)_handleChannelUpdateCommand:(id)a3
{
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = [a3 appChannelUpdates];
  id v31 = [obj countByEnumeratingWithState:&v42 objects:v57 count:16];
  if (v31)
  {
    id v4 = &objc_retain_x28_ptr;
    uint64_t v30 = *(void *)v43;
    uint64_t v35 = self;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v43 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = v5;
        id v6 = *(void **)(*((void *)&v42 + 1) + 8 * v5);
        id v7 = [v6 appId];
        long long v33 = +[NSMutableArray array];
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v34 = [v6 channelUpdates];
        id v37 = [v34 countByEnumeratingWithState:&v38 objects:v56 count:16];
        if (v37)
        {
          uint64_t v36 = *(void *)v39;
          do
          {
            for (i = 0; i != v37; i = (char *)i + 1)
            {
              if (*(void *)v39 != v36) {
                objc_enumerationMutation(v34);
              }
              uint64_t v9 = *(void **)(*((void *)&v38 + 1) + 8 * i);
              id v10 = [v9 channelId];
              long long v11 = [v10 base64EncodedStringWithOptions:0];

              unsigned int v12 = [v9 channelStatus];
              if (v12 == 1)
              {
                long long v22 = [v4[147] pubSub];
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  id v23 = [v9 checkpoint];
                  *(_DWORD *)buf = 138413058;
                  long long v47 = self;
                  __int16 v48 = 2112;
                  __int16 v49 = v11;
                  __int16 v50 = 2048;
                  id v51 = v23;
                  __int16 v52 = 2112;
                  __int16 v53 = v7;
                  _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%@ Channel %@ was told to fastforward the checkpoint to %llu for topic %@", buf, 0x2Au);
                }

                id v15 = +[APSMessageStore sharedInstance];
                id v24 = objc_alloc((Class)CUTWeakLinkClass());
                long long v25 = [(APSUserCourier *)self environment];
                long long v26 = [v25 name];
                long long v27 = [(APSUserCourier *)self courierUser];
                long long v28 = [v27 pubSubName];
                id v17 = objc_msgSend(v24, "initWithChannelID:channelTopic:environment:tokenName:checkpoint:", v11, v7, v26, v28, objc_msgSend(v9, "checkpoint"));

                [v15 updateChannel:v17];
                id v4 = &objc_retain_x28_ptr;
              }
              else
              {
                if (v12) {
                  goto LABEL_20;
                }
                uint64_t v13 = -[APSUserCourier _protoUpdateFailureToReadableFailure:](self, "_protoUpdateFailureToReadableFailure:", [v9 channelStatus]);
                v54[0] = @"channelID";
                v54[1] = @"reason";
                v55[0] = v11;
                long long v14 = +[NSNumber numberWithInt:v13];
                v55[1] = v14;
                id v15 = +[NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:2];

                [v33 addObject:v15];
                long long v16 = [v4[147] pubSub];
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138413058;
                  long long v47 = self;
                  __int16 v48 = 2112;
                  __int16 v49 = v11;
                  __int16 v50 = 2112;
                  id v51 = v7;
                  __int16 v52 = 1024;
                  LODWORD(v53) = v13;
                  _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@ The channel %@ on topic %@ does not exist %u Removing subscription...", buf, 0x26u);
                }

                id v17 = +[APSMessageStore sharedInstance];
                id v18 = [(APSUserCourier *)self environment];
                uint64_t v19 = [v18 name];
                long long v20 = [(APSUserCourier *)self courierUser];
                id v21 = [v20 pubSubName];
                [v17 deleteChannelID:v11 forTopic:v7 environment:v19 userName:v21];
              }
              self = v35;
LABEL_20:
            }
            id v37 = [v34 countByEnumeratingWithState:&v38 objects:v56 count:16];
          }
          while (v37);
        }

        if ([v33 count]) {
          [(APSUserCourier *)self sendFailuresToClient:v33 pushTopic:v7];
        }

        uint64_t v5 = v32 + 1;
      }
      while ((id)(v32 + 1) != v31);
      id v31 = [obj countByEnumeratingWithState:&v42 objects:v57 count:16];
    }
    while (v31);
  }
}

- (int)_protoUpdateFailureToReadableFailure:(int)a3
{
  if (a3) {
    return -1;
  }
  else {
    return 0;
  }
}

- (BOOL)shouldDropPubSubMessageWithData:(id)a3 forTopic:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [[PSChannelSubscriptionsPushMetadata alloc] initWithData:v7];

    uint64_t v9 = [(PSChannelSubscriptionsPushMetadata *)v8 channelId];
    id v10 = [v9 base64EncodedStringWithOptions:0];

    long long v11 = +[APSMessageStore sharedInstance];
    unsigned int v12 = [(APSUserCourier *)self environment];
    uint64_t v13 = [v12 name];
    long long v14 = [(APSUserCourier *)self courierUser];
    id v15 = [v14 pubSubName];
    long long v16 = [v11 lookupChannelWithChannelID:v10 andPushTopic:v6 environment:v13 userName:v15];

    if (v16)
    {
      id v17 = [(PSChannelSubscriptionsPushMetadata *)v8 checkpoint];
      if ([v16 checkpoint] <= v17)
      {
        BOOL v19 = 0;
        goto LABEL_11;
      }
      id v18 = +[APSLog pubSub];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1000CB934();
      }
    }
    else
    {
      id v18 = +[APSLog pubSub];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1000CB8CC();
      }
    }

    BOOL v19 = 1;
LABEL_11:

    return v19;
  }
  return 0;
}

- (id)updateChannelForIncomingMessageWithData:(id)a3 forTopic:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v7 = a3;
    id v8 = [[PSChannelSubscriptionsPushMetadata alloc] initWithData:v7];

    uint64_t v9 = [(PSChannelSubscriptionsPushMetadata *)v8 channelId];
    id v10 = [v9 base64EncodedStringWithOptions:0];

    id v11 = [(PSChannelSubscriptionsPushMetadata *)v8 checkpoint];
    unsigned int v12 = +[APSMessageStore sharedInstance];
    uint64_t v13 = [(APSUserCourier *)self environment];
    long long v14 = [v13 name];
    id v15 = [(APSUserCourier *)self courierUser];
    long long v16 = [v15 pubSubName];
    id v20 = v6;
    id v17 = [v12 lookupChannelWithChannelID:v10 andPushTopic:v6 environment:v14 userName:v16];

    if (!v17)
    {
      id v18 = +[APSLog pubSub];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        long long v22 = self;
        __int16 v23 = 2112;
        id v24 = v20;
        __int16 v25 = 2112;
        long long v26 = v10;
        _os_log_fault_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "%@ We received a pubsub update for a topic we dont have a subscription for!  topic: %@ channelID: %@", buf, 0x20u);
      }
    }
    [v17 setCheckpoint:v11];
    [v12 updateChannel:v17];

    id v6 = v20;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)_sendProxyChannelList:(id)a3 onConnectionType:(int64_t)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000A6418;
  v6[3] = &unk_10012A8E8;
  id v7 = self;
  id v8 = a3;
  id v5 = v8;
  [(APSUserCourier *)v7 enumerateConnectedProtocolConnectionsOfType:a4 block:v6];
}

- (void)_requestClientPubSubChannelList:(id)a3 onProtocolConnection:(id)a4
{
  id v5 = a3;
  objc_msgSend(v5, "sendPubSubChannelListRequestForConnectionType:", objc_msgSend(a4, "connectionType"));
}

- (void)_handlePubSubChannelListRequestonProtocolConnection:(id)a3
{
  id v4 = a3;
  id v5 = [(APSUserCourier *)self publicToken];
  [(APSUserCourier *)self _sendPubsubConnectMessageOnProtocolConnection:v4 token:v5];
}

- (void)_cancelRequest:(id)a3
{
  id v5 = a3;
  id v3 = [v5 timeoutSource];

  if (v3)
  {
    id v4 = [v5 timeoutSource];
    dispatch_source_cancel(v4);
  }
}

@end