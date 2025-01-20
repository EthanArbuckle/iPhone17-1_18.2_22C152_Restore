@interface APSCourierConnectionManager
- (APSConnectionHistory)connectionHistory;
- (APSConnectionRetryStateManaging)connectionRetryManager;
- (APSCourierConnection)courierConnection;
- (APSCourierConnectionManager)initWithEnvironment:(id)a3 courierConnection:(id)a4 carrierBundleHelper:(id)a5 networkMonitor:(id)a6 connectionRetryManager:(id)a7 delegate:(id)a8;
- (APSCourierConnectionManager)initWithEnvironment:(id)a3 delegate:(id)a4;
- (APSCourierConnectionManagerDelegate)delegate;
- (APSEnvironment)environment;
- (APSNetworkMonitor)networkMonitor;
- (APSNoOpPowerAssertion)waitForConnectionAttemptsPowerAssertion;
- (APSOutgoingQueue)outgoingConnectMessageQueue;
- (APSOutgoingQueue)outgoingFilterQueue;
- (APSOutgoingQueue)outgoingSendMessageQueue;
- (APSOutgoingQueue)tokenGenerateResponseQueue;
- (APSPowerAssertion)criticalReliabilityPowerAssertion;
- (APSPowerAssertion)delayedKeepAlivePowerAssertion;
- (APSRateLimiter)suspendToggleDailyLimiter;
- (APSRateLimiter)suspendToggleHourlyLimiter;
- (APSReachabilityHandler)reachabilityHandler;
- (APSServerTimeTracker)serverTimeTracker;
- (APSSymptomReporter)symptomReporter;
- (BOOL)_adjustConnectionWithInterfacePreference:(int64_t)a3;
- (BOOL)_connectStreamWithInterfacePreference:(int64_t)a3;
- (BOOL)_handleRedirectMessage:(id)a3 onInterface:(int64_t)a4;
- (BOOL)_isInternetReachableOnInterface:(int64_t)a3;
- (BOOL)_isWiFiLinkQualityBetter;
- (BOOL)_neededToSwitchToKeepAliveProxyInterface;
- (BOOL)_requestKeepAliveProxy;
- (BOOL)_useShortKeepAliveInterval;
- (BOOL)allowedToHaveMultipleOpenInterfaces;
- (BOOL)didPushCauseWake;
- (BOOL)enableCriticalReliability;
- (BOOL)enabled;
- (BOOL)generationMatches:(unint64_t)a3 forInterface:(int64_t)a4;
- (BOOL)handlingFailure;
- (BOOL)hasOpenConnection;
- (BOOL)hasOpenConnectionOnInterface:(int64_t)a3;
- (BOOL)isAttemptingToReconnect;
- (BOOL)isCellularWatch;
- (BOOL)isConnected;
- (BOOL)isConnectedOnInterface:(int64_t)a3;
- (BOOL)isKeepAliveProxyConfiguredOnAnyConnection;
- (BOOL)isKeepAliveProxyConfiguredOnAnyInterface;
- (BOOL)isKeepAliveProxyConfiguredOnInterface:(int64_t)a3;
- (BOOL)isPiggybacking;
- (BOOL)isSuspendedOnInterface:(int64_t)a3;
- (BOOL)keepAliveV2SupportedOnInterface:(int64_t)a3;
- (BOOL)pendingPostSuspensionWWANFlush;
- (BOOL)remainsConnectedWhenWWANSuspends;
- (BOOL)sendMessageWithTopicHash:(id)a3 identifier:(unint64_t)a4 payload:(id)a5 token:(id)a6 isPlistFormat:(BOOL)a7 lastRTT:(id)a8 onInterface:(int64_t)a9 withCompletion:(id)a10;
- (BOOL)shouldRun;
- (BOOL)shouldUseInternet;
- (BOOL)useServerKeepAliveStatsOnInterface:(int64_t)a3;
- (CoreTelephonyClient)ctClient;
- (NSArray)activeProtocolConnections;
- (NSDate)lastConnectionAttempt;
- (NSNumber)serverExpectedKeepAliveInterval;
- (NSNumber)serverMaxKeepAliveInterval;
- (NSNumber)serverMinKeepAliveInterval;
- (NSString)currentLinkQualityString;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)ifname;
- (NSString)latestGeoRegion;
- (NSTimer)criticalFlushTimer;
- (NSTimer)resetInterfacePreferenceTimer;
- (PCCarrierBundleHelper)carrierBundleHelper;
- (PCPersistentTimer)criticalReliabilityTimer;
- (PCPersistentTimer)delayedReconnectTimer;
- (PCPersistentTimer)delayedSuspendKeepAliveTimer;
- (PCPersistentTimer)pendingMessageReconnectTimer;
- (__SecIdentity)clientIdentity;
- (double)currentKeepAliveInterval;
- (double)currentKeepAliveIntervalOnInterface:(int64_t)a3;
- (double)delayedReconnectTLSInterval;
- (double)delayedSuspendKeepAliveInterval;
- (double)filterMessageTimeout;
- (double)keepAliveV2TimeDriftMaximum;
- (double)lastClientRequestedKeepaliveTime;
- (double)lastIPCachingTTLSeconds;
- (double)startedDarkWake;
- (id)JSONDebugState;
- (id)_sendOutgoingMessage:(id)a3 topicHash:(id)a4 lastRTT:(id)a5 token:(id)a6 onInterface:(int64_t)a7 ultraConstrainedAllowed:(BOOL)a8 withCompletion:(id)a9;
- (id)aps_prettyDescription;
- (id)connectionTimeForInterface:(int64_t)a3;
- (id)consecutiveConnectionFailureReasonOnInterface:(int64_t)a3;
- (id)copyOperatorName;
- (id)currentKeepAliveStateOnInterface:(int64_t)a3;
- (id)dailySuspendToggleRateLimiter;
- (id)dnsResolutionTimeMillisecondsOnInterface:(int64_t)a3;
- (id)hourlySuspendToggleRateLimiter;
- (id)maxLargeMessageSizeForInterface:(int64_t)a3;
- (id)maxMessageSizeForInterface:(int64_t)a3;
- (id)pcInterfaceMonitorNonCellular;
- (id)pcInterfaceMonitorOnInterface:(int64_t)a3;
- (id)pcInterfaceMonitorWWAN;
- (id)pcPersistentInterfaceManager;
- (id)protocolConnectionForInterface:(int64_t)a3;
- (id)serverHostnameForInterface:(int64_t)a3;
- (id)serverIPAddressForInterface:(int64_t)a3;
- (id)tcpHandshakeTimeMillisecondsOnInterface:(int64_t)a3;
- (id)tcpInfoDescription;
- (id)tlsHandshakeTimeMillisecondsOnInterface:(int64_t)a3;
- (int)_linkQualityForInterface:(int64_t)a3;
- (int)interfacePreference;
- (int)lastPushLQ;
- (int)lastPushRAT;
- (int64_t)delayedReconnectTLSIntervalTrigger;
- (int64_t)interfaceConstraintForInterface:(int64_t)a3;
- (int64_t)preferredInterface;
- (int64_t)suspendToggleDailyLimit;
- (int64_t)suspendToggleHourlyLimit;
- (unint64_t)cmaType;
- (unint64_t)consecutiveConnectionFailureCount;
- (unint64_t)consecutiveTLSConnectionFailureCount;
- (unint64_t)countConnectedInterfaces;
- (unint64_t)countOpenConnections;
- (unint64_t)courierConnection:(id)a3 dataReceived:(id)a4 onInterface:(int64_t)a5 withGeneration:(unint64_t)a6 isWakingMessage:(BOOL)a7;
- (unint64_t)findKeepAliveProxyInterfaceFailureCount;
- (unint64_t)forceKeepAliveProxyInterfaceFailureCount;
- (unint64_t)lastIPCachingPercentage;
- (unint64_t)obtainKeepAliveProxyFailureCount;
- (unint64_t)serverTimeInNanoSeconds;
- (unsigned)_keepAliveVersionForInterface:(int64_t)a3;
- (unsigned)redirectCount;
- (void)__delayedPerformKeepAliveOnInterface:(id)a3;
- (void)_adjustConnection;
- (void)_cacheIPAddress:(id)a3 onInterface:(int64_t)a4;
- (void)_clearConnectionEstablishTimerOnInterface:(int64_t)a3;
- (void)_clearDelayedReconnectTimer;
- (void)_clearFilterMessageTimerOnInterface:(int64_t)a3;
- (void)_clearKeepAliveResponseTimerOnInterface:(int64_t)a3;
- (void)_clearPostSuspensionFlushState;
- (void)_clearResetInterfacePreferenceTimer;
- (void)_criticalReliabilityTimerFired;
- (void)_delayedPerformKeepAliveOnInterface:(int64_t)a3;
- (void)_delayedPerformKeepAliveOnInterface:(int64_t)a3 withDelay:(double)a4;
- (void)_delayedReconnectTimerFired;
- (void)_delayedSuspendKeepAliveTimerFired:(id)a3;
- (void)_disconnectAllStreamsWithReason:(unsigned int)a3;
- (void)_disconnectStreamForInterface:(int64_t)a3 withReason:(unsigned int)a4;
- (void)_filterMessageTimeoutTimerFired:(id)a3;
- (void)_handleConnectionAfterSuspensionRecoveryOnInterface:(int64_t)a3 withKeepAlive:(BOOL)a4;
- (void)_handleConnectionFailureOnInterface:(int64_t)a3 forceDelayedReconnect:(BOOL)a4 withReason:(unsigned int)a5;
- (void)_handleConnectionRecoverFromSuspensionOnInterface:(int64_t)a3;
- (void)_handleConnectionSuspendedOnInterface:(int64_t)a3;
- (void)_handleDelayKeepAliveCancelMessageOnInterface:(int64_t)a3;
- (void)_handleFlushMessage:(id)a3 onInterface:(int64_t)a4;
- (void)_handleKeepAliveAckMessage:(id)a3 onInterface:(int64_t)a4;
- (void)_handleKeepAliveResponseMessage:(id)a3 onInterface:(int64_t)a4 didWake:(BOOL)a5;
- (void)_invokeInFailureHandlingContext:(id)a3;
- (void)_pendingMessageReconnectTimerFired;
- (void)_performFlushWithPaddingLength:(unint64_t)a3;
- (void)_performKeepAliveOnInterface:(int64_t)a3 shortInterval:(BOOL)a4 withAction:(int)a5;
- (void)_requestKeepAlive:(BOOL)a3 orConnection:(BOOL)a4;
- (void)_requestKeepAlive:(BOOL)a3 orConnection:(BOOL)a4 shortInterval:(BOOL)a5 onInterface:(int64_t)a6;
- (void)_resetInterfacePreferenceTimerFired:(id)a3;
- (void)_resetKeepAliveOnInterface:(int64_t)a3;
- (void)_resetServerKeepAliveStatsOnInterface:(int64_t)a3;
- (void)_startConnectionEstablishTimerOnInterface:(int64_t)a3;
- (void)_startFilterMessageTimerOnInterface:(int64_t)a3;
- (void)_startKeepAliveResponseTimerOnInterface:(int64_t)a3 shortInterval:(BOOL)a4;
- (void)_startResetInterfacePreferenceTimer;
- (void)_submitKeepAliveFailedAWDonInterface:(int64_t)a3;
- (void)_submitKeepAliveSucceededAWDonInterface:(int64_t)a3;
- (void)_switchToKeepAliveProxyInterface;
- (void)_useCachedLastIPIfPossible:(int64_t)a3;
- (void)_useInteractivePowerAssertionIfNeededWithReason:(id)a3;
- (void)adjustConnectionsIfNeeded;
- (void)appendPrettyStatusToStatusPrinter:(id)a3;
- (void)carrierBundleDidChange;
- (void)clearConsecutiveConnectionFailureReasonOnInterface:(int64_t)a3;
- (void)clearDNSResolutionAndTLSHandshakeOnInterface:(int64_t)a3;
- (void)clearProtocolConnectionForInterface:(int64_t)a3;
- (void)courierConnection:(id)a3 aboutToWriteDataOnConnectedInterface:(int64_t)a4;
- (void)courierConnection:(id)a3 connectionEstablishTimerFiredOnInterface:(int64_t)a4;
- (void)courierConnection:(id)a3 connectionManager:(id)a4 handleEvent:(int)a5 context:(id)a6 onInterface:(int64_t)a7;
- (void)courierConnection:(id)a3 disconnectStreamOnInterface:(int64_t)a4 withReason:(unsigned int)a5;
- (void)courierConnection:(id)a3 errorOccured:(id)a4 onInterface:(int64_t)a5;
- (void)courierConnection:(id)a3 failedToFindKeepAliveProxyOnInterface:(int64_t)a4;
- (void)courierConnection:(id)a3 failedToForceKeepAliveProxyOnInterface:(int64_t)a4;
- (void)courierConnection:(id)a3 failedToObtainKeepAliveProxyOnInterface:(int64_t)a4;
- (void)courierConnection:(id)a3 hasDeterminedServerHostname:(id)a4 onInterface:(int64_t)a5;
- (void)courierConnection:(id)a3 keepAliveResponseTimerFiredOnInterface:(int64_t)a4;
- (void)courierConnection:(id)a3 parserErrorMessage:(id)a4 OnInterface:(int64_t)a5;
- (void)courierConnection:(id)a3 receivedServerBag:(id)a4;
- (void)courierConnection:(id)a3 streamEndedOnInterface:(int64_t)a4 withReason:(unsigned int)a5;
- (void)courierConnectionHasConnected:(id)a3 context:(id)a4 enabledPackedFormat:(BOOL)a5 secureHandshakeEnabled:(BOOL)a6 onInterface:(int64_t)a7;
- (void)dealloc;
- (void)forceAdjustConnections;
- (void)holdPowerAssertionUntilStreamsQuiesce;
- (void)interfaceLinkQualityChanged:(id)a3 previousLinkQuality:(int)a4;
- (void)interfaceRadioHotnessChanged:(id)a3;
- (void)markInitiallyConnectedOnInterface:(int64_t)a3;
- (void)networkMonitor:(id)a3 enableWiFiAssertionForPiggybackConnection:(BOOL)a4;
- (void)networkMonitor:(id)a3 evaluateDualModeState:(BOOL)a4;
- (void)networkMonitorWiFiBecameAssociated:(id)a3;
- (void)notePush;
- (void)performKeepAlive;
- (void)performKeepAliveOnInterface:(int64_t)a3;
- (void)prepareForDarkWake;
- (void)prepareForFullWake;
- (void)prepareForSleep;
- (void)recalculateCriticalReliability;
- (void)refreshCriticalReliability;
- (void)refreshCriticalReliabilityTimerWithShortKeepAlive:(BOOL)a3;
- (void)requestConnectionIfNeeded;
- (void)sendActivityTrackingRequestWithMessageID:(unint64_t)a3 pushToken:(id)a4 salt:(unint64_t)a5 trackingFlag:(unsigned int)a6 timestamp:(unint64_t)a7 onInterface:(int64_t)a8;
- (void)sendConnectMessageWithToken:(id)a3 interface:(int64_t)a4 activeInterval:(unsigned int)a5 presenceFlags:(unsigned int)a6 metadata:(id)a7 certificates:(id)a8 nonce:(id)a9 signature:(id)a10 hostCertificateInfo:(id)a11 redirectCount:(unsigned __int8)a12 tcpHandshakeTimeMilliseconds:(double)a13 dnsResolveTimeMilliseconds:(double)a14 tlsHandshakeTimeMilliseconds:(double)a15 consecutiveConnectionFailureReason:(id)a16 withCompletion:(id)a17 onInterface:(int64_t)a18;
- (void)sendConnectMessageWithToken:(id)a3 state:(int)a4 interface:(int64_t)a5 activeInterval:(unsigned int)a6 presenceFlags:(unsigned int)a7 metadata:(id)a8 certificates:(id)a9 nonce:(id)a10 signature:(id)a11 redirectCount:(unsigned __int8)a12 withCompletion:(id)a13 onInterface:(int64_t)a14;
- (void)sendConnectMessageWithToken:(id)a3 state:(int)a4 presenceFlags:(unsigned int)a5 metadata:(id)a6 certificates:(id)a7 nonce:(id)a8 signature:(id)a9 hostCertificateInfo:(id)a10 redirectCount:(unsigned __int8)a11 withCompletion:(id)a12 onInterface:(int64_t)a13;
- (void)sendFilterMessageWithEnabledHashes:(id)a3 ignoredHashes:(id)a4 opportunisticHashes:(id)a5 nonWakingHashes:(id)a6 pausedHashes:(id)a7 token:(id)a8 version:(unint64_t)a9 expectsResponse:(BOOL)a10 onInterface:(int64_t)a11 withCompletion:(id)a12;
- (void)sendFlushOnAllConnectionshWithPaddingLength:(unint64_t)a3;
- (void)sendMessageAcknowledgeMessageWithResponse:(int64_t)a3 messageId:(id)a4 token:(id)a5 onInterface:(int64_t)a6;
- (void)sendMessageTracingAckWithTopicHash:(id)a3 tracingUUID:(id)a4 status:(int)a5 token:(id)a6 onInterface:(int64_t)a7;
- (void)sendMessageTransportAcknowledgeMessageOnInterface:(int64_t)a3;
- (void)sendPubSubChannelListWithMetadata:(id)a3 baseToken:(id)a4 messageID:(unsigned int)a5 onInterface:(int64_t)a6;
- (void)sendSetActiveState:(BOOL)a3 forInterval:(unsigned int)a4 onInterface:(int64_t)a5;
- (void)sendTaskControlMessageWithMetadata:(id)a3 messageId:(unint64_t)a4 onInterface:(int64_t)a5;
- (void)sendTokenGenerateMessageWithTopicHash:(id)a3 baseToken:(id)a4 appId:(unsigned __int16)a5 expirationTTL:(unsigned int)a6 vapidPublicKeyHash:(id)a7 type:(int64_t)a8 withCompletion:(id)a9 onInterface:(int64_t)a10;
- (void)setCarrierBundleHelper:(id)a3;
- (void)setClientIdentity:(__SecIdentity *)a3;
- (void)setCmaType:(unint64_t)a3;
- (void)setConnectionFailure:(id)a3 onInterface:(int64_t)a4;
- (void)setConnectionHistory:(id)a3;
- (void)setConnectionRetryManager:(id)a3;
- (void)setConnectionStatistics:(id)a3 onInterface:(int64_t)a4;
- (void)setConnectionTime:(id)a3 forInterface:(int64_t)a4;
- (void)setConsecutiveConnectionFailureCount:(unint64_t)a3;
- (void)setConsecutiveTLSConnectionFailureCount:(unint64_t)a3;
- (void)setCourierConnection:(id)a3;
- (void)setCriticalFlushTimer:(id)a3;
- (void)setCriticalReliabilityPowerAssertion:(id)a3;
- (void)setCriticalReliabilityTimer:(id)a3;
- (void)setCtClient:(id)a3;
- (void)setDelayedKeepAlivePowerAssertion:(id)a3;
- (void)setDelayedReconnectTLSInterval:(double)a3;
- (void)setDelayedReconnectTLSIntervalTrigger:(int64_t)a3;
- (void)setDelayedReconnectTimer:(id)a3;
- (void)setDelayedSuspendKeepAliveInterval:(double)a3;
- (void)setDelayedSuspendKeepAliveTimer:(id)a3;
- (void)setEnableCriticalReliability:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEnvironment:(id)a3;
- (void)setFilterMessageTimeout:(double)a3;
- (void)setFindKeepAliveProxyInterfaceFailureCount:(unint64_t)a3;
- (void)setForceKeepAliveProxyInterfaceFailureCount:(unint64_t)a3;
- (void)setHandlingFailure:(BOOL)a3;
- (void)setInterfacePreference:(int)a3;
- (void)setKeepAliveConfiguration:(unint64_t)a3;
- (void)setKeepAliveV2Supported:(BOOL)a3 onInterface:(int64_t)a4;
- (void)setKeepAliveV2TimeDriftMaximum:(double)a3;
- (void)setLastClientRequestedKeepaliveTime:(double)a3;
- (void)setLastConnectionAttempt:(id)a3;
- (void)setLastIPCachingPercentage:(unint64_t)a3;
- (void)setLastIPCachingTTLSeconds:(double)a3;
- (void)setLastPushLQ:(int)a3;
- (void)setLastPushRAT:(int)a3;
- (void)setLatestGeoRegion:(id)a3;
- (void)setMaxLargeMessageSize:(id)a3 forInterface:(int64_t)a4;
- (void)setMaxMessageSize:(id)a3 forInterface:(int64_t)a4;
- (void)setNetworkMonitor:(id)a3;
- (void)setObtainKeepAliveProxyFailureCount:(unint64_t)a3;
- (void)setOutgoingConnectMessageQueue:(id)a3;
- (void)setOutgoingFilterQueue:(id)a3;
- (void)setOutgoingSendMessageQueue:(id)a3;
- (void)setPendingMessageReconnectTimer:(id)a3;
- (void)setPendingPostSuspensionWWANFlush:(BOOL)a3;
- (void)setReachabilityHandler:(id)a3;
- (void)setRemainsConnectedWhenWWANSuspends:(BOOL)a3;
- (void)setResetInterfacePreferenceTimer:(id)a3;
- (void)setServerExpectedKeepAliveInterval:(id)a3;
- (void)setServerMaxKeepAliveInterval:(id)a3;
- (void)setServerMinKeepAliveInterval:(id)a3;
- (void)setServerSupportsDualMode:(BOOL)a3;
- (void)setServerTimeTracker:(id)a3;
- (void)setShouldRun:(BOOL)a3;
- (void)setShouldUseInternet:(BOOL)a3;
- (void)setStartedDarkWake:(double)a3;
- (void)setSuspendToggleDailyLimit:(int64_t)a3;
- (void)setSuspendToggleDailyLimiter:(id)a3;
- (void)setSuspendToggleHourlyLimit:(int64_t)a3;
- (void)setSuspendToggleHourlyLimiter:(id)a3;
- (void)setSymptomReporter:(id)a3;
- (void)setTokenGenerateResponseQueue:(id)a3;
- (void)setWaitForConnectionAttemptsPowerAssertion:(id)a3;
- (void)stopManagerOnInterface:(int64_t)a3;
- (void)triggerCriticalReliability;
- (void)updateKeepAliveInterval:(double)a3;
@end

@implementation APSCourierConnectionManager

- (APSCourierConnectionManager)initWithEnvironment:(id)a3 delegate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[APSCourierConnection alloc] initWithEnvironment:v7];
  v9 = +[PCCarrierBundleHelper helper];
  v10 = objc_alloc_init(APSNetworkMonitor);
  v11 = objc_alloc_init(APSDefaultConnectionRetryStateManager);
  v12 = [(APSCourierConnectionManager *)self initWithEnvironment:v7 courierConnection:v8 carrierBundleHelper:v9 networkMonitor:v10 connectionRetryManager:v11 delegate:v6];

  return v12;
}

- (APSCourierConnectionManager)initWithEnvironment:(id)a3 courierConnection:(id)a4 carrierBundleHelper:(id)a5 networkMonitor:(id)a6 connectionRetryManager:(id)a7 delegate:(id)a8
{
  id v49 = a3;
  id v48 = a4;
  id v47 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v50.receiver = self;
  v50.super_class = (Class)APSCourierConnectionManager;
  v18 = [(APSCourierConnectionManager *)&v50 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_environment, a3);
    objc_storeStrong((id *)&v19->_delegate, a8);
    objc_storeStrong((id *)&v19->_carrierBundleHelper, a5);
    v20 = objc_alloc_init(APSServerTimeTracker);
    serverTimeTracker = v19->_serverTimeTracker;
    v19->_serverTimeTracker = v20;

    objc_storeStrong((id *)&v19->_networkMonitor, a6);
    [(APSNetworkMonitor *)v19->_networkMonitor setDelegate:v19];
    objc_storeStrong((id *)&v19->_connectionRetryManager, a7);
    v22 = [(APSCourierConnectionManager *)v19 pcInterfaceMonitorNonCellular];
    [v22 addDelegate:v19 queue:&_dispatch_main_q];

    v23 = [(APSCourierConnectionManager *)v19 pcInterfaceMonitorWWAN];
    [v23 addDelegate:v19 queue:&_dispatch_main_q];

    p_courierConnection = (id *)&v19->_courierConnection;
    objc_storeStrong((id *)&v19->_courierConnection, a4);
    if ([(APSCourierConnectionManager *)v19 isCellularWatch] && (_os_feature_enabled_impl() & 1) == 0)
    {
      [*p_courierConnection setWifiKeepAliveEarlyFireConstantInterval:120.0];
    }
    else
    {
      v19->_delayedReconnectTLSInterval = 120.0;
      v19->_delayedReconnectTLSIntervalTrigger = 50;
    }
    if ([(APSCourierConnectionManager *)v19 _useShortKeepAliveInterval]) {
      [*p_courierConnection setKeepAliveConfiguration:0];
    }
    [(APSCourierConnection *)v19->_courierConnection setRemainsConnectedWhenWWANSuspends:v19->_remainsConnectedWhenWWANSuspends];
    [(PCCarrierBundleHelper *)v19->_carrierBundleHelper addDelegate:v19];
    if ([(PCCarrierBundleHelper *)v19->_carrierBundleHelper BOOLValueFromPushBundleForKey:APSForceKeepAliveV1Key error:0])
    {
      id v25 = [(APSCourierConnectionManager *)v19 copyOperatorName];
      v26 = +[APSLog courier];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v52 = v25;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%@ opts out of Keep Alive 2.0", buf, 0xCu);
      }
    }
    else
    {
      [*p_courierConnection setKeepAliveV2Supported:1 onInterface:0];
    }
    [(APSCourierConnection *)v19->_courierConnection setKeepAliveV2Supported:1 onInterface:1];
    [(APSCourierConnection *)v19->_courierConnection setDelegate:v19];
    BOOL v27 = sub_10007E2F8(APSIsST);
    double v28 = 160.0;
    if (v27) {
      double v28 = 600.0;
    }
    v19->_delayedSuspendKeepAliveInterval = v28;
    *(_OWORD *)&v19->_suspendToggleHourlyLimit = xmmword_10010EC00;
    v19->_keepAliveV2TimeDriftMaximum = 30.0;
    v19->_lastIPCachingTTLSeconds = 0.0;
    v19->_cmaType = 0;
    v19->_lastIPCachingPercentage = 0;
    v29 = objc_alloc_init(APSConnectionHistory);
    connectionHistory = v19->_connectionHistory;
    v19->_connectionHistory = v29;

    v19->_filterMessageTimeout = 30.0;
    uint64_t v31 = APSBundleIdentifier;
    v32 = [(APSEnvironment *)v19->_environment domain];
    v33 = +[NSString stringWithFormat:@"%@-wakeconnection-%@", v31, v32];

    v34 = [[APSNoOpPowerAssertion alloc] initWithName:v33 category:201 holdDuration:19.0];
    waitForConnectionAttemptsPowerAssertion = v19->_waitForConnectionAttemptsPowerAssertion;
    v19->_waitForConnectionAttemptsPowerAssertion = v34;

    v36 = objc_alloc_init(APSOutgoingQueue);
    outgoingSendMessageQueue = v19->_outgoingSendMessageQueue;
    v19->_outgoingSendMessageQueue = v36;

    v38 = objc_alloc_init(APSOutgoingQueue);
    outgoingConnectMessageQueue = v19->_outgoingConnectMessageQueue;
    v19->_outgoingConnectMessageQueue = v38;

    v40 = objc_alloc_init(APSOutgoingQueue);
    tokenGenerateResponseQueue = v19->_tokenGenerateResponseQueue;
    v19->_tokenGenerateResponseQueue = v40;

    v42 = objc_alloc_init(APSOutgoingQueue);
    outgoingFilterQueue = v19->_outgoingFilterQueue;
    v19->_outgoingFilterQueue = v42;

    v44 = (CoreTelephonyClient *)[objc_alloc((Class)CoreTelephonyClient) initWithQueue:&_dispatch_main_q];
    ctClient = v19->_ctClient;
    v19->_ctClient = v44;
  }
  return v19;
}

- (void)dealloc
{
  [(APSCourierConnectionManager *)self _disconnectAllStreamsWithReason:0];
  [(APSCourierConnection *)self->_courierConnection setDelegate:0];
  [(APSNetworkMonitor *)self->_networkMonitor setDelegate:0];
  [(APSReachabilityHandler *)self->_reachabilityHandler disable];
  v3.receiver = self;
  v3.super_class = (Class)APSCourierConnectionManager;
  [(APSCourierConnectionManager *)&v3 dealloc];
}

- (void)markInitiallyConnectedOnInterface:(int64_t)a3
{
  if (!-[APSCourierConnection isConnectedOnInterface:](self->_courierConnection, "isConnectedOnInterface:"))
  {
    [(APSCourierConnectionManager *)self _clearConnectionEstablishTimerOnInterface:a3];
    v5 = [(APSCourierConnectionManager *)self connectionRetryManager];
    [v5 noteConnectionEstablished];

    id v6 = [(APSCourierConnectionManager *)self connectionRetryManager];
    [v6 notePresenceSuccess];

    id v7 = [(APSCourierConnection *)self->_courierConnection serverIPAddressForInterface:a3];
    if (self->_lastIPCachingTTLSeconds > 0.0)
    {
      v8 = [(APSCourierConnection *)self->_courierConnection usingCachedIPAddressOnInterface:a3];

      if (!v8) {
        [(APSCourierConnectionManager *)self _cacheIPAddress:v7 onInterface:a3];
      }
    }
    [(APSCourierConnection *)self->_courierConnection setUsingCachedIPAddress:0 onInterface:a3];
    [(APSCourierConnection *)self->_courierConnection setIsConnecting:0 onInterface:a3];
    [(APSCourierConnection *)self->_courierConnection setIsConnected:1 onInterface:a3];
    if ([(APSCourierConnection *)self->_courierConnection countConnectedInterfaces] >= 2) {
      [(APSNetworkMonitor *)self->_networkMonitor openedSecondChannel];
    }
    self->_cmaType = 0;
    v9 = +[APSLog courier];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v28 = self;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: Calling into AWD for PushConnectionConnected", buf, 0xCu);
    }

    v10 = [(APSCourierConnectionManager *)self courierConnection];
    v11 = [v10 objectForKey:@"startedOpeningStream" onInterface:a3];
    v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v13 = +[NSDate date];
    }
    v14 = v13;

    id v15 = +[NSDate date];
    [v15 timeIntervalSinceDate:v14];
    double v17 = v16;

    v18 = +[NSNumber numberWithInt:[(APSCourierConnectionManager *)self _linkQualityForInterface:a3]];
    uint64_t v19 = +[APSMetricLogger dualChannelStateFrom:self->_courierConnection isPiggyBacking:[(APSNetworkMonitor *)self->_networkMonitor isPiggybacking]];
    v20 = +[NSNumber numberWithDouble:v17];
    v21 = [(APSCourierConnectionManager *)self dnsResolutionTimeMillisecondsOnInterface:a3];
    v22 = [(APSCourierConnectionManager *)self tlsHandshakeTimeMillisecondsOnInterface:a3];
    +[APSMetricLogger connectionConnectedWithDuration:v20 interface:a3 linkQuality:v18 dualChannelState:v19 dnsResolutionTimeMilliseconds:v21 tlsHandshakeTimeMilliseconds:v22];

    [(APSCourierConnectionManager *)self clearDNSResolutionAndTLSHandshakeOnInterface:a3];
    v23 = [(APSCourierConnectionManager *)self courierConnection];
    [v23 setObject:0 forKey:@"startedOpeningStream" onInterface:a3];

    v24 = [(APSCourierConnectionManager *)self courierConnection];
    id v25 = +[NSDate date];
    [v24 setObject:v25 forKey:@"connectionEstablished" onInterface:a3];

    v26 = +[APSLog courier];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v28 = self;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%@: AWD PushConnectionConnected finished", buf, 0xCu);
    }
  }
}

- (void)_adjustConnection
{
}

- (BOOL)_adjustConnectionWithInterfacePreference:(int64_t)a3
{
  v5 = +[APSLog courier];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v6 = [(APSCourierConnection *)self->_courierConnection countConnectedInterfaces];
    id v7 = [(APSCourierConnectionManager *)self pcPersistentInterfaceManager];
    v8 = [v7 currentLinkQualityString];
    int v15 = 138412802;
    double v16 = self;
    __int16 v17 = 2048;
    unint64_t v18 = v6;
    __int16 v19 = 2112;
    v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "APSUserCourier %@ adjusting connection. Connected on %lu interfaces. Current link quality: %@", (uint8_t *)&v15, 0x20u);
  }
  if ([(APSCourierConnectionManager *)self shouldUseInternet])
  {
    v9 = +[APSLog courier];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = sub_100040D80(a3);
      int v15 = 138412546;
      double v16 = self;
      __int16 v17 = 2112;
      unint64_t v18 = (unint64_t)v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ calling _connectStream with interface preference %@", (uint8_t *)&v15, 0x16u);
    }
    if (a3 == 3 && [(APSNetworkMonitor *)self->_networkMonitor shouldUseDualMode])
    {
      v11 = +[APSLog courier];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        double v16 = self;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ _connectStream has None preference and dual channel is enabled.", (uint8_t *)&v15, 0xCu);
      }

      if ([(APSCourierConnection *)self->_courierConnection hasOpenConnectionOnInterface:0])
      {
        LODWORD(a3) = 0;
      }
      else
      {
        a3 = +[APSLog courier];
        if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = 138412290;
          double v16 = self;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)a3, OS_LOG_TYPE_DEFAULT, "%@ _connectStream - kicking WWAN for dual channel", (uint8_t *)&v15, 0xCu);
        }

        LODWORD(a3) = [(APSCourierConnectionManager *)self _connectStreamWithInterfacePreference:0];
      }
      if (![(APSCourierConnection *)self->_courierConnection hasOpenConnectionOnInterface:1])
      {
        v14 = +[APSLog courier];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = 138412290;
          double v16 = self;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@ _connectStream - kicking NonCellular for dual channel", (uint8_t *)&v15, 0xCu);
        }

        LODWORD(a3) = a3 | [(APSCourierConnectionManager *)self _connectStreamWithInterfacePreference:1];
      }
    }
    else
    {
      LOBYTE(a3) = [(APSCourierConnectionManager *)self _connectStreamWithInterfacePreference:a3];
    }
  }
  else
  {
    if ([(APSCourierConnection *)self->_courierConnection hasOpenConnection])
    {
      v12 = +[APSLog courier];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        double v16 = self;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@: Disconnecting from courier as there are no more connections with enabled topics, we have been disabled, or we are in push proxy mode.", (uint8_t *)&v15, 0xCu);
      }
    }
    [(APSCourierConnection *)self->_courierConnection stopManagers];
    [(APSCourierConnectionManager *)self _disconnectAllStreamsWithReason:2];
    LOBYTE(a3) = 0;
  }
  return a3;
}

- (void)_disconnectAllStreamsWithReason:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(APSCourierConnectionManager *)self _disconnectStreamForInterface:1 withReason:*(void *)&a3];
  [(APSCourierConnectionManager *)self _disconnectStreamForInterface:0 withReason:v3];
  self->_cmaType = 0;
}

- (void)_handleConnectionFailureOnInterface:(int64_t)a3 forceDelayedReconnect:(BOOL)a4 withReason:(unsigned int)a5
{
  BOOL v5 = a4;
  unint64_t v6 = a3;
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472;
  v68[2] = sub_100092D7C;
  v68[3] = &unk_10012C0A8;
  v68[4] = self;
  v68[5] = a3;
  unsigned int v69 = a5;
  [(APSCourierConnectionManager *)self _invokeInFailureHandlingContext:v68];
  v8 = [(APSCourierConnectionManager *)self connectionRetryManager];
  [v8 noteConnectionAttemptFailed];

  if ([(APSCourierConnection *)self->_courierConnection isConnectingOnInterface:v6])
  {
    v9 = [(APSCourierConnection *)self->_courierConnection usingCachedIPAddressOnInterface:v6];

    if (v9) {
      [(APSCourierConnectionManager *)self _cacheIPAddress:0 onInterface:v6];
    }
    else {
      [(APSCourierConnectionManager *)self _useCachedLastIPIfPossible:v6];
    }
    [(APSCourierConnection *)self->_courierConnection setIsConnecting:0 onInterface:v6];
  }
  unint64_t consecutiveConnectionFailureCount = self->_consecutiveConnectionFailureCount;
  if (consecutiveConnectionFailureCount)
  {
    unsigned int v11 = [(APSCourierConnectionManager *)self isCellularWatch];
    if (v6 == 1 && v11)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, @"APSDDetectedUnusableWiFi", 0, 0, 1u);
      id v13 = +[APSLog courier];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v71 = self;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@: WiFi might be out of range or captive. Posting notification for iRatManager: APSDDetectedUnusableWiFi.", buf, 0xCu);
      }
    }
    symptomReporter = self->_symptomReporter;
    if (!symptomReporter)
    {
      int v15 = objc_alloc_init(APSSymptomReporter);
      double v16 = self->_symptomReporter;
      self->_symptomReporter = v15;

      symptomReporter = self->_symptomReporter;
    }
    [(APSSymptomReporter *)symptomReporter reportConnectionFailureOnConnectionType:v6 != 0];
    unint64_t consecutiveConnectionFailureCount = self->_consecutiveConnectionFailureCount;
  }
  self->_unint64_t consecutiveConnectionFailureCount = consecutiveConnectionFailureCount + 1;
  [(APSCourierConnection *)self->_courierConnection setObject:0 forKey:@"connectionEstablished" onInterface:v6];
  unsigned int v17 = [(APSCourierConnection *)self->_courierConnection isConnected];
  unint64_t v18 = +[APSLog courier];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v19 = sub_100040D80(v6);
    unint64_t v63 = self->_consecutiveConnectionFailureCount;
    unint64_t v64 = v6;
    BOOL v65 = v5;
    CFStringRef v20 = @"YES";
    if (v17) {
      CFStringRef v21 = @"YES";
    }
    else {
      CFStringRef v21 = @"NO";
    }
    v22 = sub_100040D80([(APSCourierConnection *)self->_courierConnection preferredInterface]);
    if ([(APSNetworkMonitor *)self->_networkMonitor shouldUseDualMode]) {
      CFStringRef v23 = @"YES";
    }
    else {
      CFStringRef v23 = @"NO";
    }
    if (!self->_enableCriticalReliability) {
      CFStringRef v20 = @"NO";
    }
    unint64_t cmaType = self->_cmaType;
    unint64_t v25 = [(APSCourierConnection *)self->_courierConnection countConnectedInterfaces];
    *(_DWORD *)buf = 138414338;
    v71 = self;
    __int16 v72 = 2112;
    double v73 = *(double *)&v19;
    __int16 v74 = 2048;
    uint64_t v75 = v63;
    __int16 v76 = 2112;
    CFStringRef v77 = v21;
    unint64_t v6 = v64;
    __int16 v78 = 2112;
    v79 = v22;
    __int16 v80 = 2112;
    CFStringRef v81 = v23;
    __int16 v82 = 2112;
    CFStringRef v83 = v20;
    BOOL v5 = v65;
    __int16 v84 = 2048;
    unint64_t v85 = cmaType;
    __int16 v86 = 2048;
    unint64_t v87 = v25;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@: Disconnected in response to connection failure on interface %@. (Consecutive failures: %lu) isConnected %@ onInterface %@  shouldUseDualChannel %@ criticalReliability %@ cmaType %lu. Connected on %lu interfaces.", buf, 0x5Cu);
  }
  int64_t v26 = v6;
  if (![(APSNetworkMonitor *)self->_networkMonitor shouldUseDualMode])
  {
    if (v17)
    {
      v33 = +[APSLog courier];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v71 = self;
        v34 = "%@: We are still connected on another interface. No need to retry/schedule a retry.";
LABEL_42:
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, v34, buf, 0xCu);
      }
    }
    else
    {
      if (![(APSCourierConnection *)self->_courierConnection hasOpenConnection])
      {
        int64_t v26 = [(APSCourierConnection *)self->_courierConnection nextConnectionAttemptInterface];
        if (self->_consecutiveConnectionFailureCount == 1
          && [(APSCourierConnectionManager *)self _isWiFiLinkQualityBetter])
        {
          int64_t v26 = 1;
        }
        goto LABEL_26;
      }
      v33 = +[APSLog courier];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v71 = self;
        v34 = "%@: We have an open connection attempt on another interface. No need to retry/schedule a retry.";
        goto LABEL_42;
      }
    }

    [(APSCourierConnection *)self->_courierConnection stopManagerOnInterface:v6];
    return;
  }
LABEL_26:
  if (v6 == 1)
  {
    unint64_t v27 = self->_cmaType;
    if (v27)
    {
      BOOL v28 = v27 == 1;
      unint64_t v29 = 1;
      if (v28) {
        unint64_t v29 = 2;
      }
      self->_unint64_t cmaType = v29;
    }
  }
  v30 = [(APSCourierConnectionManager *)self pcInterfaceMonitorNonCellular];
  unsigned __int8 v31 = [v30 isInterfaceUsable];

  if ((v31 & 1) == 0) {
    self->_unint64_t cmaType = 0;
  }
  unint64_t v32 = self->_consecutiveConnectionFailureCount;
  if (self->_enableCriticalReliability)
  {
    if (v32 < 3)
    {
LABEL_48:
      BOOL v35 = 1;
      if (!v5) {
        goto LABEL_52;
      }
      goto LABEL_49;
    }
  }
  else if (v32 == 1)
  {
    goto LABEL_48;
  }
  if (![(APSCourierConnection *)self->_courierConnection shouldClientScheduleReconnectDueToFailureOnInterface:v6])goto LABEL_48; {
  BOOL v35 = self->_cmaType == 2;
  }
  if (!v5) {
    goto LABEL_52;
  }
LABEL_49:
  v36 = +[APSLog courier];
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v71 = self;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%@: forceDelayedReconnect.", buf, 0xCu);
  }

  BOOL v35 = 0;
LABEL_52:
  int64_t delayedReconnectTLSIntervalTrigger = self->_delayedReconnectTLSIntervalTrigger;
  if (self->_consecutiveTLSConnectionFailureCount > delayedReconnectTLSIntervalTrigger
    && delayedReconnectTLSIntervalTrigger > 0
    || ([(APSCourierConnectionManager *)self connectionRetryManager],
        v38 = objc_claimAutoreleasedReturnValue(),
        unsigned int v39 = [v38 shouldDelayNextReconnect],
        v38,
        v39))
  {
    if ([(APSCourierConnectionManager *)self shouldUseInternet])
    {
      if (self->_consecutiveTLSConnectionFailureCount <= self->_delayedReconnectTLSIntervalTrigger
        || (double delayedReconnectTLSInterval = self->_delayedReconnectTLSInterval, delayedReconnectTLSInterval <= 0.0))
      {
        v41 = [(APSCourierConnectionManager *)self connectionRetryManager];
        [v41 currentDelay];
        double delayedReconnectTLSInterval = v42;
      }
      v43 = (PCPersistentTimer *)[objc_alloc((Class)PCPersistentTimer) initWithTimeInterval:@"APSCourier" serviceIdentifier:self target:"_delayedReconnectTimerFired" selector:0 userInfo:delayedReconnectTLSInterval];
      delayedReconnectTimer = self->_delayedReconnectTimer;
      self->_delayedReconnectTimer = v43;

      [(PCPersistentTimer *)self->_delayedReconnectTimer setMinimumEarlyFireProportion:1.0];
      v45 = self->_delayedReconnectTimer;
      v46 = +[NSRunLoop mainRunLoop];
      [(PCPersistentTimer *)v45 scheduleInRunLoop:v46];

      id v47 = +[APSLog courier];
      if (!os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_62;
      }
      unint64_t v48 = self->_consecutiveConnectionFailureCount;
      *(_DWORD *)buf = 138412802;
      v71 = self;
      __int16 v72 = 2048;
      double v73 = delayedReconnectTLSInterval;
      __int16 v74 = 1024;
      LODWORD(v75) = v48;
      id v49 = "%@: scheduled reconnect in %f seconds {consecutiveFailures: %d}";
      objc_super v50 = v47;
      uint32_t v51 = 28;
      goto LABEL_61;
    }
  }
  if (v35)
  {
    [(APSCourierConnection *)self->_courierConnection resumeManagerWithAction:1 onInterface:v6];
    [(APSCourierConnection *)self->_courierConnection stopManagerOnInterface:v6];
  }
  else
  {
    id v52 = [(APSCourierConnectionManager *)self delegate];
    unsigned int v53 = [v52 courierConnectionManagerClientsHaveEagerMessages];

    if (!v53)
    {
      if ([(APSCourierConnectionManager *)self shouldUseInternet]) {
        [(APSCourierConnection *)self->_courierConnection resumeManagerWithAction:5 onInterface:v26];
      }
      goto LABEL_78;
    }
    [(NSDate *)self->_lastConnectionAttempt timeIntervalSinceNow];
    double v55 = fabs(v54);
    if (v55 <= 29.0)
    {
      double v58 = 29.0 - v55;
      v59 = (PCPersistentTimer *)[objc_alloc((Class)PCPersistentTimer) initWithTimeInterval:@"APSCourier" serviceIdentifier:self target:"_pendingMessageReconnectTimerFired" selector:0 userInfo:v58];
      pendingMessageReconnectTimer = self->_pendingMessageReconnectTimer;
      self->_pendingMessageReconnectTimer = v59;

      [(PCPersistentTimer *)self->_pendingMessageReconnectTimer setMinimumEarlyFireProportion:1.0];
      v61 = self->_pendingMessageReconnectTimer;
      v62 = +[NSRunLoop mainRunLoop];
      [(PCPersistentTimer *)v61 scheduleInRunLoop:v62];

      id v47 = +[APSLog courier];
      if (!os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_62;
      }
      *(_DWORD *)buf = 138412546;
      v71 = self;
      __int16 v72 = 2048;
      double v73 = v58;
      id v49 = "%@ has pending messages but it hasn't been long enough since the last connection attempt. Scheduling retry in %f";
      objc_super v50 = v47;
      uint32_t v51 = 22;
LABEL_61:
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, v49, buf, v51);
LABEL_62:

LABEL_78:
      [(APSCourierConnectionManager *)self protocolConnectionForInterface:v6];
      v66[0] = _NSConcreteStackBlock;
      v66[1] = 3221225472;
      v66[2] = sub_100092D8C;
      v66[3] = &unk_10012C0D0;
      id v67 = (id)objc_claimAutoreleasedReturnValue();
      id v57 = v67;
      [v57 enumerateStateListeners:v66];

      return;
    }
    v56 = +[APSLog courier];
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v71 = self;
      __int16 v72 = 2048;
      double v73 = v55;
      __int16 v74 = 2048;
      uint64_t v75 = 0x403D000000000000;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "%@ has eager messages and it's been %f > %f, trying to reconnect now.", buf, 0x20u);
    }
  }
  if (![(APSCourierConnectionManager *)self _adjustConnectionWithInterfacePreference:v26])goto LABEL_78; {
}
  }

- (void)_delayedReconnectTimerFired
{
  uint64_t v3 = +[APSLog courier];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    unint64_t v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@: _delayedReconnectTimerFired! Connecting now.", (uint8_t *)&v5, 0xCu);
  }

  [(PCPersistentTimer *)self->_delayedReconnectTimer invalidate];
  delayedReconnectTimer = self->_delayedReconnectTimer;
  self->_delayedReconnectTimer = 0;

  [(APSCourierConnectionManager *)self _adjustConnectionWithInterfacePreference:[(APSCourierConnection *)self->_courierConnection nextConnectionAttemptInterface]];
}

- (void)_clearDelayedReconnectTimer
{
  uint64_t v3 = +[APSLog courier];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    unint64_t v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@: Canceling _delayedReconnectTimer.", (uint8_t *)&v5, 0xCu);
  }

  [(PCPersistentTimer *)self->_delayedReconnectTimer invalidate];
  delayedReconnectTimer = self->_delayedReconnectTimer;
  self->_delayedReconnectTimer = 0;
}

- (void)_pendingMessageReconnectTimerFired
{
  uint64_t v3 = +[APSLog courier];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    unint64_t v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@: _pendingMessageReconnectTimerFired!", (uint8_t *)&v5, 0xCu);
  }

  [(PCPersistentTimer *)self->_pendingMessageReconnectTimer invalidate];
  pendingMessageReconnectTimer = self->_pendingMessageReconnectTimer;
  self->_pendingMessageReconnectTimer = 0;

  [(APSCourierConnectionManager *)self _adjustConnectionWithInterfacePreference:[(APSCourierConnection *)self->_courierConnection nextConnectionAttemptInterface]];
}

- (void)_disconnectStreamForInterface:(int64_t)a3 withReason:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v7 = +[APSLog courier];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = sub_100040D80(a3);
    *(_DWORD *)buf = 138412802;
    unint64_t v32 = self;
    __int16 v33 = 2112;
    v34 = v8;
    __int16 v35 = 1024;
    int v36 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ _disconnectStream for interface: %@ with reason: %u", buf, 0x1Cu);
  }
  v9 = [(APSCourierConnectionManager *)self outgoingConnectMessageQueue];
  v10 = sub_100040D80(a3);
  [v9 clearEnqueuedSendsOnInterface:v10];

  unsigned int v11 = [(APSCourierConnectionManager *)self outgoingSendMessageQueue];
  v12 = sub_100040D80(a3);
  [v11 clearEnqueuedSendsOnInterface:v12];

  id v13 = [(APSCourierConnectionManager *)self tokenGenerateResponseQueue];
  v14 = sub_100040D80(a3);
  [v13 clearEnqueuedSendsOnInterface:v14];

  int v15 = [(APSCourierConnectionManager *)self outgoingFilterQueue];
  double v16 = sub_100040D80(a3);
  [v15 clearEnqueuedSendsOnInterface:v16];

  [(APSCourierConnectionManager *)self setConnectionTime:0 forInterface:a3];
  [(APSCourierConnectionManager *)self _clearFilterMessageTimerOnInterface:a3];
  [(APSCourierConnection *)self->_courierConnection setIsSuspended:0 onInterface:a3];
  unsigned int v17 = [(APSCourierConnection *)self->_courierConnection redirectHost];

  if (!v17) {
    [(APSCourierConnection *)self->_courierConnection clearRedirectCount];
  }
  unsigned int v18 = [(APSCourierConnection *)self->_courierConnection isConnectedOnInterface:a3];
  unsigned int v19 = [(APSCourierConnection *)self->_courierConnection hasOpenConnectionOnInterface:a3];
  [(APSCourierConnection *)self->_courierConnection closeStreamForInterface:a3];
  [(APSCourierConnection *)self->_courierConnection setIsConnected:0 onInterface:a3 withDisconnectReason:v4];
  if (!a3) {
    [(APSCourierConnectionManager *)self _clearPostSuspensionFlushState];
  }
  uint64_t v20 = v19 & (v18 ^ 1);
  if (v18)
  {
    if ((id)[(APSCourierConnection *)self->_courierConnection countConnectedInterfaces] == (id)1) {
      [(APSNetworkMonitor *)self->_networkMonitor closedSecondChannel:a3];
    }
    [(APSCourierConnectionManager *)self _clearKeepAliveResponseTimerOnInterface:a3];
  }
  else if (v20)
  {
    [(APSCourierConnectionManager *)self _clearConnectionEstablishTimerOnInterface:a3];
  }
  if (self->_enabled)
  {
    CFStringRef v21 = +[APSLog courier];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = [(APSEnvironment *)self->_environment name];
      CFStringRef v23 = sub_100040D80(a3);
      *(_DWORD *)buf = 138412546;
      unint64_t v32 = v22;
      __int16 v33 = 2112;
      v34 = v23;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Connection closed %@ %@", buf, 0x16u);
    }
  }
  if (v18) {
    uint64_t v24 = 2;
  }
  else {
    uint64_t v24 = v20;
  }
  unint64_t v25 = [(APSCourierConnectionManager *)self protocolConnectionForInterface:a3];
  [(APSCourierConnectionManager *)self clearProtocolConnectionForInterface:a3];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000933CC;
  v27[3] = &unk_10012C0F8;
  id v28 = v25;
  uint64_t v29 = v24;
  int v30 = v4;
  id v26 = v25;
  [v26 enumerateStateListeners:v27];
}

- (void)_cacheIPAddress:(id)a3 onInterface:(int64_t)a4
{
  id v6 = a3;
  id v7 = +[APSLog courier];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = sub_100040D80(a4);
    *(_DWORD *)buf = 138412802;
    unsigned int v19 = self;
    __int16 v20 = 2112;
    id v21 = v6;
    __int16 v22 = 2112;
    CFStringRef v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ cache ip address %@ on interface %@", buf, 0x20u);
  }
  CFStringRef v9 = (const __CFString *)APSCachedIPKey;
  CFPropertyListRef v10 = sub_10007E420(APSCachedIPKey, 0);
  if (v10)
  {
    unsigned int v11 = (void *)v10;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = [v11 mutableCopy];
    }
    else {
      id v12 = 0;
    }
    CFRelease(v11);
    if (!v6) {
      goto LABEL_12;
    }
  }
  else
  {
    id v12 = 0;
    if (!v6) {
      goto LABEL_12;
    }
  }
  if (!v12)
  {
    id v12 = objc_alloc_init((Class)NSMutableDictionary);
LABEL_13:
    id v13 = objc_alloc((Class)NSDictionary);
    v14 = +[NSDate date];
    id v15 = objc_msgSend(v13, "initWithObjectsAndKeys:", v14, @"date", v6, @"ip", 0);

    double v16 = [(APSEnvironment *)self->_environment name];
    [v12 setObject:v15 forKey:v16];

    goto LABEL_14;
  }
LABEL_12:
  if (v6) {
    goto LABEL_13;
  }
  id v15 = [(APSEnvironment *)self->_environment name];
  [v12 removeObjectForKey:v15];
LABEL_14:

  if ([v12 count]) {
    unsigned int v17 = v12;
  }
  else {
    unsigned int v17 = 0;
  }
  sub_10007E524(v9, v17, 0);
  sub_10007E648(0);
  [(APSCourierConnection *)self->_courierConnection setUsingCachedIPAddress:0 onInterface:a4];
}

- (void)_useCachedLastIPIfPossible:(int64_t)a3
{
  if (self->_lastIPCachingTTLSeconds > 0.0)
  {
    int v5 = (void *)sub_10007E420(APSCachedIPKey, 0);
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = [(APSEnvironment *)self->_environment name];
        id v7 = [v5 objectForKey:v6];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v8 = [v7 objectForKey:@"ip"];
          CFStringRef v9 = [v7 objectForKey:@"date"];
          if (v9)
          {
            CFPropertyListRef v10 = +[NSDate date];
            [v10 timeIntervalSinceDate:v9];
            double v12 = v11;
          }
          else
          {
            double v12 = 978307200.0;
          }

          if (v8 && v12 > 0.0 && v12 < self->_lastIPCachingTTLSeconds)
          {
            [(APSCourierConnection *)self->_courierConnection setUsingCachedIPAddress:v8 onInterface:a3];
            id v13 = +[APSLog courier];
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              v14 = sub_100040D80(a3);
              int v15 = 138413314;
              double v16 = self;
              __int16 v17 = 2080;
              unsigned int v18 = "-[APSCourierConnectionManager _useCachedLastIPIfPossible:]";
              __int16 v19 = 2112;
              __int16 v20 = v8;
              __int16 v21 = 2048;
              double v22 = v12;
              __int16 v23 = 2112;
              uint64_t v24 = v14;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@ %s setCachedIPAddress %@ with age %f on interface %@", (uint8_t *)&v15, 0x34u);
            }
          }
          goto LABEL_9;
        }
      }
    }
    v8 = 0;
    CFStringRef v9 = 0;
LABEL_9:
  }
}

- (void)_clearPostSuspensionFlushState
{
  [(PCPersistentTimer *)self->_delayedSuspendKeepAliveTimer invalidate];
  delayedSuspendKeepAliveTimer = self->_delayedSuspendKeepAliveTimer;
  self->_delayedSuspendKeepAliveTimer = 0;

  self->_pendingPostSuspensionWWANFlush = 0;
}

- (BOOL)_connectStreamWithInterfacePreference:(int64_t)a3
{
  int v5 = +[APSLog courier];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = sub_100040D80([(APSCourierConnection *)self->_courierConnection preferredInterface]);
    unint64_t consecutiveConnectionFailureCount = self->_consecutiveConnectionFailureCount;
    sub_100040D80(a3);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ([(APSNetworkMonitor *)self->_networkMonitor shouldUseDualMode]) {
      CFStringRef v9 = @"YES";
    }
    else {
      CFStringRef v9 = @"NO";
    }
    unint64_t v10 = [(APSCourierConnection *)self->_courierConnection countConnectedInterfaces];
    *(_DWORD *)buf = 138413570;
    v112 = self;
    __int16 v113 = 2112;
    unint64_t v114 = (unint64_t)v6;
    __int16 v115 = 2048;
    unint64_t v116 = consecutiveConnectionFailureCount;
    __int16 v117 = 2112;
    CFStringRef v118 = v8;
    __int16 v119 = 2112;
    CFStringRef v120 = v9;
    __int16 v121 = 2048;
    unint64_t v122 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ attempting to _connectStream. currently onInterface %@ consecutiveFailures %lu preference %@ shouldUseDualChannel %@. Connected on %lu interfaces.", buf, 0x3Eu);
  }
  if (+[APSSimulatorSupport isSimulator]
    && !+[APSSimulatorSupport isBuildSupported])
  {
    unint64_t v27 = +[APSLog courier];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v28 = +[APSSimulatorSupport isBuildSupported];
      CFStringRef v29 = @"NO";
      if (v28) {
        CFStringRef v29 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      v112 = (APSCourierConnectionManager *)v29;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Build version not supported {isSupportedOnBuild:%@} - disconnecting", buf, 0xCu);
    }

    return 0;
  }
  if (self->_delayedReconnectTimer)
  {
    double v11 = +[APSLog courier];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
LABEL_13:

      return 0;
    }
    delayedReconnectTimer = self->_delayedReconnectTimer;
    *(_DWORD *)buf = 138412546;
    v112 = self;
    __int16 v113 = 2112;
    unint64_t v114 = (unint64_t)delayedReconnectTimer;
    id v13 = "%@: Not connecting. {delayedReconnectTimer:%@}";
    goto LABEL_11;
  }
  double v16 = +[NSDate date];
  lastConnectionAttempt = self->_lastConnectionAttempt;
  self->_lastConnectionAttempt = v16;

  unsigned int v18 = [(APSCourierConnectionManager *)self delegate];
  unsigned int v19 = [v18 courierConnectionManagerClientsWillBeAbleToConnect];

  if (!v19)
  {
    int v30 = +[APSLog courier];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_1000CB38C(v30);
    }

    [(APSCourierConnectionManager *)self _handleConnectionFailureOnInterface:3 forceDelayedReconnect:1 withReason:14];
    return 0;
  }
  __int16 v20 = [(APSCourierConnectionManager *)self pcInterfaceMonitorNonCellular];
  unsigned int v21 = [v20 isInterfaceUsable];

  double v22 = [(APSCourierConnectionManager *)self pcInterfaceMonitorWWAN];
  id v23 = [v22 interfaceConstraint];

  if ((_os_feature_enabled_impl() & v21 & (v23 == (id)1)) != 0) {
    unint64_t v24 = 1;
  }
  else {
    unint64_t v24 = a3;
  }
  if (![(APSNetworkMonitor *)self->_networkMonitor shouldUseDualMode])
  {
    unsigned int v25 = [(APSCourierConnection *)self->_courierConnection hasOpenConnection];
    if (v24 == 3)
    {
      if (v25)
      {
        double v11 = +[APSLog courier];
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_13;
        }
        unint64_t v26 = [(APSCourierConnection *)self->_courierConnection countConnectedInterfaces];
        *(_DWORD *)buf = 138412546;
        v112 = self;
        __int16 v113 = 2048;
        unint64_t v114 = v26;
        id v13 = "%@ _connectStream - caller is ensuring that we are connected. We are so there's nothing to do here. - Conn"
              "ected on %lu interfaces.";
LABEL_11:
        v14 = v11;
        uint32_t v15 = 22;
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
        goto LABEL_13;
      }
    }
  }
  if ([(APSCourierConnection *)self->_courierConnection hasOpenConnectionOnInterface:v24])
  {
    double v11 = +[APSLog courier];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v32 = sub_100040D80(v24);
      courierConnection = self->_courierConnection;
      *(_DWORD *)buf = 138412802;
      v112 = self;
      __int16 v113 = 2112;
      unint64_t v114 = (unint64_t)v32;
      __int16 v115 = 2112;
      unint64_t v116 = (unint64_t)courierConnection;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ _connectStream - called with a preference %@ that matches our current connection %@, nothing to do", buf, 0x20u);
    }
    goto LABEL_13;
  }
  if ([(APSNetworkMonitor *)self->_networkMonitor shouldUseDualMode])
  {
    if ([(APSCourierConnection *)self->_courierConnection hasOpenConnectionOnInterface:1])
    {
      unsigned int v34 = [(APSCourierConnection *)self->_courierConnection hasOpenConnectionOnInterface:0];
      if (v24 == 3)
      {
        if (v34)
        {
          double v11 = +[APSLog courier];
          if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_13;
          }
          *(_DWORD *)buf = 138412290;
          v112 = self;
          id v13 = "%@ _connectStream - should use dual channel, no preference specified and we are already connected on both channels.";
          goto LABEL_111;
        }
      }
    }
  }
  int v35 = v21 ^ 1;
  int v36 = [(APSCourierConnectionManager *)self pcPersistentInterfaceManager];
  unsigned int v37 = [v36 isWWANInterfaceUp];

  v38 = [(APSCourierConnectionManager *)self pcInterfaceMonitorWWAN];
  unsigned int v39 = [v38 isInterfaceUsable] & v37;

  if (_os_feature_enabled_impl())
  {
    if (v23 == (id)1) {
      unsigned int v40 = v39;
    }
    else {
      unsigned int v40 = 0;
    }
    if (v23 == (id)1) {
      char v41 = 0;
    }
    else {
      char v41 = v39;
    }
    if ((v41 & 1) == 0 && (v40 & v35 & 1) == 0) {
      goto LABEL_50;
    }
  }
  else if (!v39)
  {
LABEL_50:
    int v42 = 0;
    uint64_t v43 = 0;
    goto LABEL_53;
  }
  uint64_t v43 = [(APSCourierConnection *)self->_courierConnection hasOpenConnectionOnInterface:0] ^ 1;
  int v42 = 1;
LABEL_53:
  if (v21) {
    v43 += [(APSCourierConnection *)self->_courierConnection hasOpenConnectionOnInterface:1] ^ 1;
  }
  unsigned __int8 v44 = [(APSNetworkMonitor *)self->_networkMonitor shouldUseDualMode];
  unsigned int v45 = [(APSCourierConnection *)self->_courierConnection hasOpenConnection];
  if ((v44 & 1) == 0)
  {
    char v51 = v45 ^ 1;
    if (v24) {
      char v51 = 1;
    }
    if ((v51 & 1) != 0
      || ([(APSCourierConnectionManager *)self pcInterfaceMonitorWWAN],
          id v52 = objc_claimAutoreleasedReturnValue(),
          char v53 = [v52 isInterfaceHistoricallyUsable] & v37,
          v52,
          (v53 & 1) != 0))
    {
      unsigned int v54 = ![(APSCourierConnection *)self->_courierConnection hasOpenConnection];
      if (v24 != 1) {
        unsigned int v54 = 1;
      }
      if ((v54 | v21)) {
        goto LABEL_75;
      }
      double v11 = +[APSLog courier];
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 138412290;
      v112 = self;
      id v13 = "%@ _connectStream - want wifi but it is not currently usable, nothing to do";
    }
    else
    {
      double v11 = +[APSLog courier];
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 138412290;
      v112 = self;
      id v13 = "%@ _connectStream - want wwan but it is not historically usable, nothing to do";
    }
LABEL_111:
    v14 = v11;
    uint32_t v15 = 12;
    goto LABEL_12;
  }
  if (v43) {
    unsigned int v46 = 0;
  }
  else {
    unsigned int v46 = v45;
  }
  if (v46 == 1)
  {
    id v47 = +[APSLog courier];
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v48 = [(APSCourierConnection *)self->_courierConnection countConnectedInterfaces];
      CFStringRef v49 = @"NO";
      __int16 v113 = 2048;
      *(_DWORD *)buf = 138413058;
      if (v42) {
        CFStringRef v50 = @"YES";
      }
      else {
        CFStringRef v50 = @"NO";
      }
      v112 = self;
      unint64_t v114 = v48;
      __int16 v115 = 2112;
      if (v21) {
        CFStringRef v49 = @"YES";
      }
      unint64_t v116 = (unint64_t)v50;
      __int16 v117 = 2112;
      CFStringRef v118 = v49;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%@ _connectStream - dual channel with %lu connected interfaces. isWWANUsable %@, isWiFiUsable %@. Not attempting to connect.", buf, 0x2Au);
    }

    BOOL result = 0;
    self->_unint64_t consecutiveConnectionFailureCount = 0;
    self->_consecutiveTLSConnectionFailureCount = 0;
    return result;
  }
LABEL_75:
  if (!v43)
  {
    unint64_t v63 = +[APSLog courier];
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v64 = self->_courierConnection;
      *(_DWORD *)buf = 138412546;
      v112 = self;
      __int16 v113 = 2112;
      unint64_t v114 = (unint64_t)v64;
      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "%@ _connectStream - we want to connect but no closed interfaces are usable, scheduling a reconnect. %@", buf, 0x16u);
    }

    if (v24 == 3)
    {
      if (![(APSCourierConnection *)self->_courierConnection hasOpenConnectionOnInterface:1])
      {
        BOOL v65 = +[APSLog courier];
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          v66 = sub_100040D80(1uLL);
          *(_DWORD *)buf = 138412546;
          v112 = self;
          __int16 v113 = 2112;
          unint64_t v114 = (unint64_t)v66;
          _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "%@ scheduled on %@", buf, 0x16u);
        }
        [(APSCourierConnection *)self->_courierConnection resumeManagerWithAction:5 onInterface:1];
      }
      if ([(APSCourierConnection *)self->_courierConnection hasOpenConnectionOnInterface:0])
      {
        return 0;
      }
      id v67 = +[APSLog courier];
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
      {
        v68 = sub_100040D80(0);
        *(_DWORD *)buf = 138412546;
        v112 = self;
        __int16 v113 = 2112;
        unint64_t v114 = (unint64_t)v68;
        _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "%@ scheduled on %@", buf, 0x16u);
      }
      unsigned int v69 = self->_courierConnection;
      unint64_t v70 = 0;
    }
    else
    {
      __int16 v72 = +[APSLog courier];
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        double v73 = sub_100040D80(v24);
        *(_DWORD *)buf = 138412546;
        v112 = self;
        __int16 v113 = 2112;
        unint64_t v114 = (unint64_t)v73;
        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "%@ scheduled on %@", buf, 0x16u);
      }
      unsigned int v69 = self->_courierConnection;
      unint64_t v70 = v24;
    }
    goto LABEL_172;
  }
  int v55 = v42;
  if (![(APSNetworkMonitor *)self->_networkMonitor shouldUseDualMode])
  {
    if (v24 != 3) {
      [(APSCourierConnectionManager *)self _disconnectStreamForInterface:v24 withReason:4];
    }
    int64_t v56 = [(APSCourierConnection *)self->_courierConnection connectingInterface];
    if (v56 != 3)
    {
      unint64_t v57 = v56;
      double v58 = +[APSLog courier];
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        v59 = sub_100040D80(v57);
        *(_DWORD *)buf = 138412546;
        v112 = self;
        __int16 v113 = 2112;
        unint64_t v114 = (unint64_t)v59;
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "%@: _connectStream - Disconnecting pending connection on %@ before opening a new one.", buf, 0x16u);
      }
      [(APSCourierConnectionManager *)self _disconnectStreamForInterface:v57 withReason:1020];
    }
  }
  if ([(APSNetworkMonitor *)self->_networkMonitor shouldUseDualMode])
  {
    if (v55)
    {
      unsigned int v60 = [(APSCourierConnection *)self->_courierConnection hasOpenConnectionOnInterface:0];
      if (v60) {
        unint64_t v61 = 3;
      }
      else {
        unint64_t v61 = 0;
      }
      v62 = &objc_retain_x28_ptr;
      if ((v60 & v21 & 1) == 0)
      {
LABEL_123:
        if (v24 != 3
          && ![(APSCourierConnection *)self->_courierConnection hasOpenConnectionOnInterface:v24])
        {
          if (v24 == 1) {
            char v99 = v21;
          }
          else {
            char v99 = 0;
          }
          if (v99)
          {
            unint64_t v61 = 1;
            goto LABEL_130;
          }
          if (v24) {
            char v108 = 0;
          }
          else {
            char v108 = v55;
          }
          if (v108)
          {
            unint64_t v61 = 0;
            goto LABEL_130;
          }
        }
        if (v61 == 3)
        {
          v71 = +[APSLog courier];
          if (os_log_type_enabled(v71, OS_LOG_TYPE_FAULT)) {
            sub_1000CB2A4();
          }
          unint64_t v61 = 3;
LABEL_129:

          goto LABEL_130;
        }
        goto LABEL_130;
      }
    }
    else
    {
      v62 = &objc_retain_x28_ptr;
      if (!v21)
      {
        unint64_t v61 = 3;
        goto LABEL_123;
      }
    }
    if ([(APSCourierConnection *)self->_courierConnection hasOpenConnectionOnInterface:1])
    {
      unint64_t v61 = 3;
    }
    else
    {
      unint64_t v61 = 1;
    }
    goto LABEL_123;
  }
  if ((v55 ^ 1 | v21) != 1)
  {
    unint64_t v61 = 0;
LABEL_121:
    v62 = &objc_retain_x28_ptr;
    goto LABEL_130;
  }
  if ((v55 | v35) != 1)
  {
    unint64_t v61 = 1;
    goto LABEL_121;
  }
  if ((v55 ^ 1 | v35))
  {
    v71 = +[APSLog courier];
    if (os_log_type_enabled(v71, OS_LOG_TYPE_FAULT)) {
      sub_1000CB318();
    }
    unint64_t v61 = 0;
    v62 = &objc_retain_x28_ptr;
    goto LABEL_129;
  }
  unint64_t v61 = v24;
  v62 = &objc_retain_x28_ptr;
  if (v24 == 3)
  {
    int64_t v106 = [(APSCourierConnection *)self->_courierConnection nextConnectionAttemptInterface];
    if (!self->_consecutiveConnectionFailureCount || (unint64_t v61 = v106, v106 == 3))
    {
      unint64_t v61 = [(APSCourierConnectionManager *)self _isWiFiLinkQualityBetter];
      v71 = +[APSLog courier];
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v107 = @"NO";
        if (v61) {
          CFStringRef v107 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        v112 = self;
        __int16 v113 = 2112;
        unint64_t v114 = (unint64_t)v107;
        _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "%@: No interface preference specified. Is WiFi lq better? %@", buf, 0x16u);
      }
      goto LABEL_129;
    }
  }
LABEL_130:
  if (![(APSNetworkMonitor *)self->_networkMonitor shouldUseDualMode]
    && ![(APSCourierConnection *)self->_courierConnection isConnected])
  {
    __int16 v74 = +[APSLog courier];
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v112 = self;
      _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "%@: _connectStream - We have no connections, stopping the connectionManager on all interfaces", buf, 0xCu);
    }

    [(APSCourierConnection *)self->_courierConnection stopManagerOnInterface:3];
  }
  uint64_t v75 = +[APSLog courier];
  if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v76 = sub_100040D80(v61);
    *(_DWORD *)buf = 138412546;
    v112 = self;
    __int16 v113 = 2112;
    unint64_t v114 = (unint64_t)v76;
    _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "%@ _connectStream - Stopping the connectionManager on our attemptInterface %@", buf, 0x16u);
  }
  [(APSCourierConnection *)self->_courierConnection stopManagerOnInterface:v61];
  CFStringRef v77 = +[APSLog courier];
  if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
  {
    if (v55) {
      CFStringRef v78 = @"YES";
    }
    else {
      CFStringRef v78 = @"NO";
    }
    if (v21) {
      CFStringRef v79 = @"YES";
    }
    else {
      CFStringRef v79 = @"NO";
    }
    sub_100040D80(v61);
    __int16 v80 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v112 = self;
    __int16 v113 = 2112;
    unint64_t v114 = (unint64_t)v78;
    __int16 v115 = 2112;
    unint64_t v116 = (unint64_t)v79;
    __int16 v117 = 2112;
    CFStringRef v118 = v80;
    _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "%@: isWWANUsable %@  isWiFiUsable %@ onInterface %@", buf, 0x2Au);
  }
  if (v61 == 1)
  {
    unint64_t cmaType = self->_cmaType;
    if (!cmaType)
    {
      unint64_t cmaType = 1;
      self->_unint64_t cmaType = 1;
    }
    BOOL v82 = cmaType == 2;
  }
  else
  {
    BOOL v82 = 0;
  }
  if (self->_lastIPCachingPercentage > arc4random_uniform(0x64u))
  {
    CFStringRef v83 = [(APSCourierConnection *)self->_courierConnection usingCachedIPAddressOnInterface:v61];
    if (v83)
    {
    }
    else
    {
      __int16 v84 = [(APSCourierConnection *)self->_courierConnection redirectHost];

      if (!v84)
      {
        unint64_t v85 = +[APSLog courier];
        if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v86 = self->_courierConnection;
          unint64_t v87 = sub_100040D80(v61);
          *(_DWORD *)buf = 138412546;
          v112 = (APSCourierConnectionManager *)v86;
          __int16 v113 = 2112;
          unint64_t v114 = (unint64_t)v87;
          _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "%@ device selected to connect using cached ip if possible on %@", buf, 0x16u);
        }
        [(APSCourierConnectionManager *)self _useCachedLastIPIfPossible:v61];
      }
    }
  }
  if (![(APSCourierConnection *)self->_courierConnection shouldConnectOnInterface:v61])
  {
    v97 = +[APSLog courier];
    if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
    {
      v98 = sub_100040D80(v61);
      *(_DWORD *)buf = 138412546;
      v112 = self;
      __int16 v113 = 2112;
      unint64_t v114 = (unint64_t)v98;
      _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_DEFAULT, "%@ device should not connect on interface %@", buf, 0x16u);
    }
    unsigned int v69 = self->_courierConnection;
    unint64_t v70 = v61;
LABEL_172:
    [(APSCourierConnection *)v69 resumeManagerWithAction:5 onInterface:v70];
    return 0;
  }
  if (v61) {
    BOOL v88 = 0;
  }
  else {
    BOOL v88 = v23 == (id)1;
  }
  uint64_t v89 = v88;
  [(APSCourierConnection *)self->_courierConnection connectToEnvironment:self->_environment onInterface:v61 allowedInterfaceConstraint:v89 useAlternatePort:v82 keepAliveProxyMode:0];
  v90 = +[APSLog courier];
  if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
  {
    sub_100040D80(v61);
    v91 = (APSCourierConnectionManager *)objc_claimAutoreleasedReturnValue();
    v92 = [(APSEnvironment *)self->_environment name];
    *(_DWORD *)buf = 138412546;
    v112 = v91;
    __int16 v113 = 2112;
    unint64_t v114 = (unint64_t)v92;
    _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "Opening stream onInterface: %@, %@", buf, 0x16u);
  }
  v93 = +[APSLog courier];
  if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
  {
    v94 = [(APSEnvironment *)self->_environment configurationURL];
    environment = self->_environment;
    if (v82) {
      unint64_t v96 = [(APSEnvironment *)environment alternatePort];
    }
    else {
      unint64_t v96 = [(APSEnvironment *)environment port];
    }
    *(_DWORD *)buf = 138412802;
    v112 = self;
    __int16 v113 = 2112;
    unint64_t v114 = (unint64_t)v94;
    __int16 v115 = 2048;
    unint64_t v116 = v96;
    _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "%@: Connecting courier stream using configuration bag at %@ and port TCP %lu", buf, 0x20u);
  }
  v100 = self->_courierConnection;
  v101 = [v62[162] date];
  [(APSCourierConnection *)v100 setObject:v101 forKey:@"startedOpeningStream" onInterface:v61];

  [(APSCourierConnectionManager *)self _startConnectionEstablishTimerOnInterface:v61];
  v102 = [(APSCourierConnectionManager *)self connectionRetryManager];
  [v102 noteConnectionAttemptStart];

  if (v61) {
    CFStringRef v103 = @"wifi";
  }
  else {
    CFStringRef v103 = @"wwan";
  }
  v104 = +[NSNumber numberWithInt:[(APSCourierConnectionManager *)self _linkQualityForInterface:v61, @"Interface", @"LinkQuality", v103]];
  v110[1] = v104;
  v105 = +[NSDictionary dictionaryWithObjects:v110 forKeys:&v109 count:2];

  APSPowerLog();
  return 1;
}

- (void)_startConnectionEstablishTimerOnInterface:(int64_t)a3
{
  -[APSCourierConnectionManager _clearConnectionEstablishTimerOnInterface:](self, "_clearConnectionEstablishTimerOnInterface:");
  courierConnection = self->_courierConnection;
  [(APSCourierConnection *)courierConnection startConnectionEstablishTimerOnInterface:a3];
}

- (void)_clearConnectionEstablishTimerOnInterface:(int64_t)a3
{
}

- (void)_clearKeepAliveResponseTimerOnInterface:(int64_t)a3
{
}

- (void)_startFilterMessageTimerOnInterface:(int64_t)a3
{
  if (a3 <= 1)
  {
    -[APSCourierConnectionManager _clearFilterMessageTimerOnInterface:](self, "_clearFilterMessageTimerOnInterface:");
    double filterMessageTimeout = self->_filterMessageTimeout;
    id v10 = +[NSNumber numberWithInteger:a3];
    uint64_t v7 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_filterMessageTimeoutTimerFired:" selector:v10 userInfo:0 repeats:filterMessageTimeout];
    v8 = &self->super.isa + a3;
    Class v9 = v8[18];
    v8[18] = (Class)v7;
  }
}

- (void)_clearFilterMessageTimerOnInterface:(int64_t)a3
{
  if (a3 <= 1)
  {
    filterMessageTimer = self->_filterMessageTimer;
    int v5 = self->_filterMessageTimer[a3];
    if (v5)
    {
      [(NSTimer *)v5 invalidate];
      id v6 = filterMessageTimer[a3];
      filterMessageTimer[a3] = 0;
    }
  }
}

- (void)_filterMessageTimeoutTimerFired:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  id v5 = [v4 integerValue];

  [(APSCourierConnectionManager *)self _handleConnectionFailureOnInterface:v5 forceDelayedReconnect:0 withReason:22];
}

- (NSString)ifname
{
  v2 = [(APSCourierConnectionManager *)self courierConnection];
  uint64_t v3 = [v2 ifname];

  return (NSString *)v3;
}

- (id)pcInterfaceMonitorWWAN
{
  return [(APSCourierConnectionManager *)self pcInterfaceMonitorOnInterface:0];
}

- (id)pcInterfaceMonitorNonCellular
{
  return [(APSCourierConnectionManager *)self pcInterfaceMonitorOnInterface:1];
}

- (id)pcInterfaceMonitorOnInterface:(int64_t)a3
{
  if (!a3)
  {
    uint64_t v5 = 1;
LABEL_5:
    id v6 = +[PCInterfaceMonitor sharedInstanceForIdentifier:](PCInterfaceMonitor, "sharedInstanceForIdentifier:", v5, v3);
    return v6;
  }
  if (a3 == 1)
  {
    uint64_t v5 = 0;
    goto LABEL_5;
  }
  id v6 = 0;
  return v6;
}

- (id)pcPersistentInterfaceManager
{
  return +[PCPersistentInterfaceManager sharedInstance];
}

- (BOOL)_isWiFiLinkQualityBetter
{
  uint64_t v3 = [(APSCourierConnectionManager *)self pcInterfaceMonitorWWAN];
  if ([v3 isPoorLinkQuality])
  {
    uint64_t v4 = [(APSCourierConnectionManager *)self pcInterfaceMonitorNonCellular];
    if ([v4 isPoorLinkQuality])
    {
      unsigned __int8 v5 = 0;
    }
    else
    {
      id v6 = [(APSCourierConnectionManager *)self pcInterfaceMonitorNonCellular];
      if ([v6 isInternetReachable])
      {
        uint64_t v7 = [(APSCourierConnectionManager *)self pcPersistentInterfaceManager];
        unsigned __int8 v5 = [v7 isWakeOnWiFiSupported];
      }
      else
      {
        unsigned __int8 v5 = 0;
      }
    }
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)_requestKeepAliveProxy
{
  return 0;
}

- (int)_linkQualityForInterface:(int64_t)a3
{
  if (a3 == 1) {
    [(APSCourierConnectionManager *)self pcInterfaceMonitorNonCellular];
  }
  else {
  uint64_t v3 = [(APSCourierConnectionManager *)self pcInterfaceMonitorWWAN];
  }
  int v4 = [v3 linkQuality];

  return v4;
}

- (BOOL)isCellularWatch
{
  return 0;
}

- (BOOL)shouldUseInternet
{
  if (self->_enabled)
  {
    uint64_t v3 = [(APSCourierConnectionManager *)self delegate];
    self->_shouldUseInternet = [v3 courierConnectionManagerClientsCanConnectRightNow];

    return self->_shouldUseInternet;
  }
  else
  {
    BOOL result = 0;
    self->_shouldUseInternet = 0;
  }
  return result;
}

- (BOOL)_useShortKeepAliveInterval
{
  if (qword_10015A9A0 != -1) {
    dispatch_once(&qword_10015A9A0, &stru_10012C118);
  }
  return byte_10015A998;
}

- (id)copyOperatorName
{
  return [(PCCarrierBundleHelper *)self->_carrierBundleHelper copyValueForKey:APSCarrierNameKey error:0];
}

- (unsigned)_keepAliveVersionForInterface:(int64_t)a3
{
  if ([(APSCourierConnection *)self->_courierConnection keepAliveV2SupportedOnInterface:a3])
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- (BOOL)useServerKeepAliveStatsOnInterface:(int64_t)a3
{
  if (a3) {
    return 0;
  }
  if (-[APSConnectionHistory connectionQualityOnInterface:](self->_connectionHistory, "connectionQualityOnInterface:") < 1) {
    return 0;
  }
  if (self->_serverMaxKeepAliveInterval || self->_serverExpectedKeepAliveInterval) {
    return 1;
  }
  return self->_serverMinKeepAliveInterval != 0;
}

- (BOOL)_isInternetReachableOnInterface:(int64_t)a3
{
  if (a3 > 1) {
    return 0;
  }
  uint64_t v10 = v3;
  if (a3 == 1) {
    [(APSCourierConnectionManager *)self pcInterfaceMonitorNonCellular];
  }
  else {
  v8 = [(APSCourierConnectionManager *)self pcInterfaceMonitorWWAN];
  }
  unsigned __int8 v9 = objc_msgSend(v8, "isInternetReachable", v4, v10, v5, v6);

  return v9;
}

- (id)hourlySuspendToggleRateLimiter
{
  suspendToggleHourlyLimiter = self->_suspendToggleHourlyLimiter;
  if (!suspendToggleHourlyLimiter || [(APSRateLimiter *)suspendToggleHourlyLimiter isUnset])
  {
    uint64_t v4 = [[APSRateLimiter alloc] initWithLimit:self->_suspendToggleHourlyLimit timeLimit:3600.0];
    uint64_t v5 = self->_suspendToggleHourlyLimiter;
    self->_suspendToggleHourlyLimiter = v4;
  }
  uint64_t v6 = self->_suspendToggleHourlyLimiter;
  return v6;
}

- (id)dailySuspendToggleRateLimiter
{
  suspendToggleDailyLimiter = self->_suspendToggleDailyLimiter;
  if (!suspendToggleDailyLimiter || [(APSRateLimiter *)suspendToggleDailyLimiter isUnset])
  {
    uint64_t v4 = [[APSRateLimiter alloc] initWithLimit:self->_suspendToggleDailyLimit timeLimit:86400.0];
    uint64_t v5 = self->_suspendToggleDailyLimiter;
    self->_suspendToggleDailyLimiter = v4;
  }
  uint64_t v6 = self->_suspendToggleDailyLimiter;
  return v6;
}

- (void)clearDNSResolutionAndTLSHandshakeOnInterface:(int64_t)a3
{
  if (a3 < 2)
  {
    uint64_t v7 = &self->super.isa + a3;
    Class v8 = v7[3];
    v7[3] = 0;

    Class v9 = v7[5];
    v7[5] = 0;
  }
  else
  {
    uint64_t v5 = +[APSLog courier];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = sub_100040D80(a3);
      int v10 = 138412546;
      double v11 = self;
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ asked to clear dnsResolutionTimeMilliseconds on invalid interface %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (NSString)currentLinkQualityString
{
  v2 = [(APSCourierConnectionManager *)self pcPersistentInterfaceManager];
  uint64_t v3 = [v2 currentLinkQualityString];

  return (NSString *)v3;
}

- (NSArray)activeProtocolConnections
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v4 = 0;
  protocolConnections = self->_protocolConnections;
  char v6 = 1;
  do
  {
    char v7 = v6;
    Class v8 = protocolConnections[v4];
    Class v9 = v8;
    if (v8 && [(APSCourierConnectionProtocolConnection *)v8 isConnected]) {
      [v3 addObject:v9];
    }

    char v6 = 0;
    uint64_t v4 = 1;
  }
  while ((v7 & 1) != 0);
  id v10 = [v3 copy];

  return (NSArray *)v10;
}

- (void)clearProtocolConnectionForInterface:(int64_t)a3
{
  if (a3 <= 1)
  {
    id v3 = &self->super.isa + a3;
    Class v4 = v3[12];
    v3[12] = 0;
  }
}

- (id)protocolConnectionForInterface:(int64_t)a3
{
  if (a3 <= 1)
  {
    Class v4 = self->_protocolConnections[a3];
  }
  else
  {
    Class v4 = 0;
  }
  return v4;
}

- (void)carrierBundleDidChange
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000953AC;
  block[3] = &unk_10012A5E0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)courierConnection:(id)a3 connectionManager:(id)a4 handleEvent:(int)a5 context:(id)a6 onInterface:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  switch(a5)
  {
    case 2:
      unsigned int v19 = +[APSLog courier];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v20 = [v12 keepAliveV2SupportedOnInterface:a7];
        CFStringRef v21 = @"NO";
        if (v20) {
          CFStringRef v21 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        unint64_t v64 = self;
        __int16 v65 = 2112;
        *(void *)v66 = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@: received PCEventPushKeepAlive call back, keepAliveV2SupportedOnInterface: %@", buf, 0x16u);
      }

      if ([v12 keepAliveV2SupportedOnInterface:a7])
      {
        double v22 = [v14 objectForKey:PCTimerFireEarlyToCoalesceKey];
        unsigned int v23 = [v22 BOOLValue];

        if (!v23)
        {
          [(APSCourierConnectionManager *)self _submitKeepAliveFailedAWDonInterface:a7];
          char v51 = +[APSLog courier];
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            unint64_t v64 = self;
            _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "%@: AWD for KeepAliveFailed finished", buf, 0xCu);
          }

          id v52 = +[APSLog courier];
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            unint64_t v64 = self;
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%@: Calling into AWD for ConnectionDisconnected", buf, 0xCu);
          }

          unint64_t v26 = +[NSNumber numberWithInt:[(APSCourierConnectionManager *)self _linkQualityForInterface:a7]];
          +[APSMetricLogger connectionDisconnected:a7 linkQuality:v26 reason:15];
          char v53 = +[APSLog courier];
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            unint64_t v64 = self;
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "%@: AWD for ConnectionDisconnected finished", buf, 0xCu);
          }

          [(APSCourierConnectionManager *)self _handleConnectionFailureOnInterface:a7 forceDelayedReconnect:0 withReason:15];
          goto LABEL_79;
        }
        unint64_t v24 = +[APSLog courier];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          unint64_t v64 = self;
          __int16 v65 = 2112;
          *(void *)v66 = v13;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%@: PCEventPushKeepAlive callback is an early fire from %@", buf, 0x16u);
        }

        [(APSCourierConnectionManager *)self _performKeepAliveOnInterface:a7 shortInterval:0 withAction:2];
      }
      else
      {
        unsigned int v37 = +[APSLog courier];
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          v38 = sub_100040D80(a7);
          unsigned int v39 = [(APSNetworkMonitor *)self->_networkMonitor shouldUseDualMode];
          CFStringRef v40 = @"NO";
          *(_DWORD *)buf = 138412802;
          unint64_t v64 = self;
          __int16 v65 = 2112;
          if (v39) {
            CFStringRef v40 = @"YES";
          }
          *(void *)v66 = v38;
          *(_WORD *)&v66[8] = 2112;
          *(void *)&v66[10] = v40;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%@: performing keepAlive for interface %@. Should use dual channel? %@", buf, 0x20u);
        }
        [(APSCourierConnectionManager *)self _performKeepAliveOnInterface:a7 shortInterval:0 withAction:2];
        if (![(APSNetworkMonitor *)self->_networkMonitor shouldUseDualMode])
        {
          int64_t v41 = [(APSCourierConnection *)self->_courierConnection preferredInterface];
          if (v41)
          {
            if (v41 == 1)
            {
              int v42 = [(APSCourierConnectionManager *)self pcInterfaceMonitorWWAN];
              if ([v42 isInterfaceHistoricallyUsable])
              {
                unsigned __int8 v43 = [(APSCourierConnectionManager *)self _isWiFiLinkQualityBetter];

                if ((v43 & 1) == 0)
                {
                  unsigned __int8 v44 = +[APSLog courier];
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    unint64_t v64 = self;
                    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%@: PCEventPushKeepAlive - we're connected over wifi and wwan is historically usable. Attempting to switch to WWAN.", buf, 0xCu);
                  }

                  APSAlert();
                  __int16 v17 = self;
                  int64_t v18 = 0;
                  goto LABEL_7;
                }
              }
              else
              {
              }
            }
          }
          else if ([(APSCourierConnectionManager *)self _isWiFiLinkQualityBetter])
          {
            int64_t v56 = +[APSLog courier];
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              unint64_t v64 = self;
              _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "%@: PCEventPushKeepAlive - we're connected over wwan but WiFi is better LQ. Attempting to switch to WiFi.", buf, 0xCu);
            }

            APSAlert();
            __int16 v17 = self;
            int64_t v18 = 1;
            goto LABEL_7;
          }
        }
      }
      goto LABEL_80;
    case 3:
    case 4:
    case 5:
      uint32_t v15 = +[APSLog courier];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        double v16 = sub_100040D80(a7);
        *(_DWORD *)buf = 138412802;
        unint64_t v64 = self;
        __int16 v65 = 1024;
        *(_DWORD *)v66 = a5;
        *(_WORD *)&void v66[4] = 2112;
        *(void *)&v66[6] = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@ handleEvent: %d onInterface %@", buf, 0x1Cu);
      }
      if ([(APSNetworkMonitor *)self->_networkMonitor shouldUseDualMode])
      {
        [(APSCourierConnectionManager *)self _disconnectStreamForInterface:a7 withReason:3];
        __int16 v17 = self;
        int64_t v18 = a7;
      }
      else
      {
        [(APSCourierConnectionManager *)self _disconnectAllStreamsWithReason:3];
        int64_t v18 = [(APSCourierConnection *)self->_courierConnection nextConnectionAttemptInterface];
        __int16 v17 = self;
      }
LABEL_7:
      [(APSCourierConnectionManager *)v17 _adjustConnectionWithInterfacePreference:v18];
      goto LABEL_80;
    case 7:
      unsigned int v25 = +[APSLog courier];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v64 = self;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%@: Persistent interface went up", buf, 0xCu);
      }

      goto LABEL_20;
    case 8:
LABEL_20:
      unint64_t v26 = [(APSCourierConnectionManager *)self pcPersistentInterfaceManager];
      unint64_t v27 = +[APSLog courier];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v28 = "inactive";
        if (a5 == 7) {
          unsigned int v28 = "active";
        }
        unsigned int v60 = v28;
        v59 = sub_100040D80(a7);
        courierConnection = self->_courierConnection;
        id v61 = v12;
        id v62 = v14;
        CFStringRef v30 = @"YES";
        if ([(APSCourierConnection *)courierConnection hasConnectionEstablishTimerOnInterface:a7])
        {
          CFStringRef v31 = @"YES";
        }
        else
        {
          CFStringRef v31 = @"NO";
        }
        if (objc_msgSend(v26, "isInternetReachable", v31)) {
          CFStringRef v32 = @"YES";
        }
        else {
          CFStringRef v32 = @"NO";
        }
        if (![(APSNetworkMonitor *)self->_networkMonitor shouldUseDualMode]) {
          CFStringRef v30 = @"NO";
        }
        __int16 v33 = sub_100040D80(a7);
        *(_DWORD *)buf = 138414082;
        unint64_t v64 = self;
        __int16 v65 = 2080;
        *(void *)v66 = v60;
        *(_WORD *)&v66[8] = 2112;
        *(void *)&v66[10] = v59;
        __int16 v67 = 2112;
        v68 = courierConnection;
        __int16 v69 = 2112;
        uint64_t v70 = v58;
        __int16 v71 = 2112;
        CFStringRef v72 = v32;
        __int16 v73 = 2112;
        CFStringRef v74 = v30;
        id v12 = v61;
        id v14 = v62;
        __int16 v75 = 2112;
        __int16 v76 = v33;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%@: Persistent interface went %s. onInterface: %@ conn %@ connectTimer %@ reachable? %@ shouldUseDualChannel? %@  onInterface: %@", buf, 0x52u);
      }
      int v34 = 0;
      if (a7 || !self->_remainsConnectedWhenWWANSuspends) {
        goto LABEL_57;
      }
      unsigned int v35 = [v26 isWWANInterfaceUp];
      if (a5 != 8)
      {
        if (v35) {
          [(APSCourierConnectionManager *)self _handleConnectionRecoverFromSuspensionOnInterface:0];
        }
        goto LABEL_56;
      }
      if ((v35 & 1) != 0 || ![v26 isWWANInterfaceSuspended])
      {
        if (([v26 isWWANInterfaceUp] & 1) == 0
          && ([v26 isWWANInterfaceSuspended] & 1) == 0)
        {
          if (![v26 hasWWANStatusIndicator]
            || ([(APSCourierConnectionManager *)self pcInterfaceMonitorWWAN],
                unsigned int v54 = objc_claimAutoreleasedReturnValue(),
                unsigned int v55 = [v54 isInterfaceUsable],
                v54,
                !v55))
          {
            unint64_t v57 = +[APSLog courier];
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Cellular interface is not suspended, ignore transition", buf, 2u);
            }

            goto LABEL_91;
          }
          [(APSCourierConnectionManager *)self _disconnectStreamForInterface:0 withReason:12];
        }
LABEL_56:
        int v34 = 0;
        goto LABEL_57;
      }
      int v36 = +[APSLog courier];
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Cellular interface is suspended", buf, 2u);
      }

      [(APSCourierConnectionManager *)self _handleConnectionSuspendedOnInterface:0];
LABEL_91:
      int v34 = 1;
LABEL_57:
      unsigned int v45 = [(APSNetworkMonitor *)self->_networkMonitor shouldUseDualMode];
      unsigned int v46 = self->_courierConnection;
      if (v45)
      {
        if ([(APSCourierConnection *)v46 hasOpenConnectionOnInterface:a7]
          || ![(APSCourierConnectionManager *)self _isInternetReachableOnInterface:a7])
        {
          goto LABEL_79;
        }
        id v47 = self;
        int64_t v48 = a7;
        goto LABEL_71;
      }
      if (![(APSCourierConnection *)v46 hasOpenConnection]
        && [v26 isInternetReachable])
      {
        CFStringRef v49 = +[APSLog courier];
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          unint64_t v64 = self;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "%@: Reconnecting because of an interface change while disconnected.", buf, 0xCu);
        }

        [(APSCourierConnectionManager *)self _adjustConnection];
        goto LABEL_79;
      }
      if (-[APSCourierConnection hasOpenConnectionOnInterface:](self->_courierConnection, "hasOpenConnectionOnInterface:", 0)&& ((v34 | [v26 isWWANInterfaceUp]) & 1) == 0)
      {
        CFStringRef v50 = +[APSLog courier];
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          unint64_t v64 = self;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%@: WWAN interface went down. Attempting to switch to WiFi.", buf, 0xCu);
        }

        id v47 = self;
        int64_t v48 = 1;
LABEL_71:
        [(APSCourierConnectionManager *)v47 _adjustConnectionWithInterfacePreference:v48];
      }
LABEL_79:

LABEL_80:
      return;
    default:
      goto LABEL_80;
  }
}

- (void)courierConnection:(id)a3 disconnectStreamOnInterface:(int64_t)a4 withReason:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  Class v9 = +[APSLog courier];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = sub_100040D80(a4);
    unint64_t v11 = [(APSCourierConnection *)self->_courierConnection countConnectedInterfaces];
    int v15 = 138413058;
    double v16 = self;
    __int16 v17 = 2112;
    id v18 = v8;
    __int16 v19 = 2112;
    unsigned int v20 = v10;
    __int16 v21 = 2048;
    unint64_t v22 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ courierConnection %@ asked us to disconnect stream on interface %@. Connected on %lu interfaces.", (uint8_t *)&v15, 0x2Au);
  }
  id v12 = +[APSLog courier];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    double v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@: Calling into AWD for ConnectionDisconnected", (uint8_t *)&v15, 0xCu);
  }

  id v13 = +[NSNumber numberWithInt:[(APSCourierConnectionManager *)self _linkQualityForInterface:a4]];
  +[APSMetricLogger connectionDisconnected:a4 linkQuality:v13 reason:v5];
  id v14 = +[APSLog courier];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    double v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@: AWD for ConnectionDisconnected finished", (uint8_t *)&v15, 0xCu);
  }

  [(APSCourierConnectionManager *)self _disconnectStreamForInterface:a4 withReason:v5];
}

- (void)courierConnection:(id)a3 streamEndedOnInterface:(int64_t)a4 withReason:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  Class v9 = +[APSLog courier];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = sub_100040D80(a4);
    *(_DWORD *)buf = 138412802;
    unsigned int v20 = self;
    __int16 v21 = 2112;
    id v22 = v8;
    __int16 v23 = 2112;
    unint64_t v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: Stream end encountered for %@ onInterface %@", buf, 0x20u);
  }
  unint64_t v11 = +[APSLog courier];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    unsigned int v20 = self;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@: Calling into AWD for ConnectionDisconnected", buf, 0xCu);
  }

  id v12 = +[NSNumber numberWithInt:[(APSCourierConnectionManager *)self _linkQualityForInterface:a4]];
  +[APSMetricLogger connectionDisconnected:a4 linkQuality:v12 reason:v5];
  id v13 = +[APSLog courier];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    unsigned int v20 = self;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@: AWD for ConnectionDisconnected finished", buf, 0xCu);
  }

  [(APSCourierConnectionManager *)self _handleConnectionFailureOnInterface:a4 forceDelayedReconnect:0 withReason:v5];
  CFStringRef v14 = @"wifi";
  if (!a4) {
    CFStringRef v14 = @"wwan";
  }
  int v15 = +[NSNumber numberWithInt:[(APSCourierConnectionManager *)self _linkQualityForInterface:a4, @"Interface", @"LinkQuality", v14]];
  v18[1] = v15;
  double v16 = +[NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:2];

  APSPowerLog();
}

- (void)courierConnection:(id)a3 parserErrorMessage:(id)a4 OnInterface:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = +[APSLog courier];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    unint64_t v11 = sub_100040D80(a5);
    int v12 = 138413058;
    id v13 = self;
    __int16 v14 = 2112;
    id v15 = v8;
    __int16 v16 = 2112;
    uint64_t v17 = v11;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@: Encoding/decoding error occurred for %@ onInterface %@: %@", (uint8_t *)&v12, 0x2Au);
  }
  [(APSCourierConnectionManager *)self _disconnectStreamForInterface:a5 withReason:6];
  [(APSCourierConnectionManager *)self _adjustConnectionWithInterfacePreference:a5];
}

- (void)courierConnection:(id)a3 aboutToWriteDataOnConnectedInterface:(int64_t)a4
{
  if ((unint64_t)a4 <= 1)
  {
    uint64_t v9 = v4;
    uint64_t v10 = v5;
    [(APSCourierConnectionManager *)self protocolConnectionForInterface:a4];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000965E4;
    v7[3] = &unk_10012C0D0;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = v8;
    [v6 enumerateStateListeners:v7];
  }
}

- (void)courierConnection:(id)a3 errorOccured:(id)a4 onInterface:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 tcpInfoDescription];
  unint64_t v11 = +[APSLog networking];
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);

  if (v12 && v10 != 0)
  {
    __int16 v14 = +[APSLog networking];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_1000CB3D0();
    }
  }
  uint64_t v15 = sub_10007E7A8(v9);
  if (v15)
  {
    __int16 v16 = (void *)v15;
    uint64_t v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"TLS Error Code=%ld \"%@\"", [v9 code], v15);

    ++self->_consecutiveTLSConnectionFailureCount;
  }
  else
  {
    uint64_t v17 = 0;
  }
  __int16 v18 = +[APSLog courier];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = sub_100040D80(a5);
    unsigned int v20 = (void *)v19;
    *(_DWORD *)buf = 138413058;
    if (v17) {
      id v21 = v17;
    }
    else {
      id v21 = v9;
    }
    CFStringRef v30 = self;
    __int16 v31 = 2112;
    id v32 = v8;
    __int16 v33 = 2112;
    uint64_t v34 = v19;
    __int16 v35 = 2112;
    id v36 = v21;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@: Stream error occurred for %@ onInterface %@: %@", buf, 0x2Au);
  }
  id v22 = +[APSLog courier];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v30 = self;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%@: Calling into AWD for ConnectionDisconnected (withError)", buf, 0xCu);
  }

  +[APSMetricLogger connectionEncounteredSSLError:interface:](APSMetricLogger, "connectionEncounteredSSLError:interface:", +[APSMetricLogger sslErrorFromErrorCode:](APSMetricLogger, "sslErrorFromErrorCode:", [v9 code]), a5);
  __int16 v23 = +[APSLog courier];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v30 = self;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%@: AWD for ConnectionDisconnected (withError) finished", buf, 0xCu);
  }

  if (a5) {
    CFStringRef v24 = @"wifi";
  }
  else {
    CFStringRef v24 = @"wwan";
  }
  v27[0] = @"Interface";
  v27[1] = @"LinkQuality";
  v28[0] = v24;
  unsigned int v25 = +[NSNumber numberWithInt:[(APSCourierConnectionManager *)self _linkQualityForInterface:a5]];
  v28[1] = v25;
  unint64_t v26 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];

  APSPowerLog();
  [(APSCourierConnectionManager *)self setConnectionFailure:v9 onInterface:a5];
  [(APSCourierConnectionManager *)self _handleConnectionFailureOnInterface:a5 forceDelayedReconnect:0 withReason:19];
}

- (double)currentKeepAliveInterval
{
  courierConnection = self->_courierConnection;
  id v3 = [(APSCourierConnection *)courierConnection preferredInterface];
  [(APSCourierConnection *)courierConnection currentKeepAliveIntervalOnInterface:v3];
  return result;
}

- (void)courierConnection:(id)a3 receivedServerBag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  networkMonitor = self->_networkMonitor;
  id v9 = [v7 disableCostDrivenDualChannelAttempts];
  [(APSNetworkMonitor *)networkMonitor setDisableCostDrivenDualChannelAttempts:v9];

  uint64_t v10 = self->_networkMonitor;
  unint64_t v11 = [v7 piggybackDualChannelAttempts];
  [(APSNetworkMonitor *)v10 setPiggybackDualChannelAttempts:v11];

  BOOL v12 = self->_networkMonitor;
  id v13 = [v7 costDrivenDualChannelAttempts];
  [(APSNetworkMonitor *)v12 setCostDrivenDualChannelAttempts:v13];

  __int16 v14 = self->_networkMonitor;
  uint64_t v15 = [v7 disableDualModePiggybackTimer];
  [(APSNetworkMonitor *)v14 setDisableDualModePiggybackTimer:v15];

  __int16 v16 = [v7 keepAliveV2TimeDriftMaximum];
  CFStringRef v17 = v16;
  if (v16)
  {
    [(__CFString *)v16 doubleValue];
    self->_keepAliveV2TimeDriftMaximum = v18;
    uint64_t v19 = +[APSLog courier];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v78 = self;
      __int16 v79 = 2112;
      CFStringRef v80 = v17;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@: keepAliveV2TimeDriftMaximum = %@", buf, 0x16u);
    }
  }
  unsigned int v20 = [v7 lastIPCachingPercentage];
  CFStringRef v21 = v20;
  if (v20)
  {
    self->_lastIPCachingPercentage = (unint64_t)[(__CFString *)v20 integerValue];
    id v22 = +[APSLog courier];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v78 = self;
      __int16 v79 = 2112;
      CFStringRef v80 = v21;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%@: lastIPCachingPercentage = %@", buf, 0x16u);
    }
  }
  __int16 v23 = [v7 lastIPCachingTTLMinutesV2];
  if (v23
    || ([v7 lastIPCachingTTLMinutes], (__int16 v23 = (__CFString *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    self->_lastIPCachingTTLSeconds = (double)(uint64_t)[(__CFString *)v23 integerValue] * 60.0;
    CFStringRef v24 = +[APSLog courier];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v78 = self;
      __int16 v79 = 2112;
      CFStringRef v80 = v23;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%@:  lastIPCachingTTLMinutes = %@", buf, 0x16u);
    }
  }
  unsigned int v25 = [v7 minimumIntervalFallbackEnabled];
  unint64_t v26 = v25;
  if (v25)
  {
    objc_msgSend(v6, "setMinimumIntervalFallbackEnabled:", objc_msgSend(v25, "BOOLValue"));
    unint64_t v27 = +[APSLog courier];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v28 = [v26 BOOLValue];
      CFStringRef v29 = @"NO";
      if (v28) {
        CFStringRef v29 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      CFStringRef v78 = self;
      __int16 v79 = 2112;
      CFStringRef v80 = v29;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%@: minimumIntervalFallbackEnabled = %@", buf, 0x16u);
    }
  }
  __int16 v73 = [v7 powerOptimizationsForExpensiveNetworkingDisabled];
  if (v73)
  {
    id v30 = [v73 BOOLValue];
    [v6 setPowerOptimizationsForExpensiveNetworkingDisabled:v30];
    __int16 v31 = +[APSLog courier];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v32 = @"NO";
      if (v30) {
        CFStringRef v32 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      CFStringRef v78 = self;
      __int16 v79 = 2112;
      CFStringRef v80 = v32;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%@:  powerOptimizationsForExpensiveNetworkingDisabled = %@", buf, 0x16u);
    }
  }
  __int16 v33 = [v7 maxExpensiveConditionsConnectionAttempts];
  CFStringRef v34 = v33;
  if (v33)
  {
    objc_msgSend(v6, "setMaxExpensiveConditionsConnectionAttempts:", -[__CFString integerValue](v33, "integerValue"));
    __int16 v35 = +[APSLog courier];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v78 = self;
      __int16 v79 = 2112;
      CFStringRef v80 = v34;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%@:  maxExpensiveConditionsConnectionAttempts = %@", buf, 0x16u);
    }
  }
  __int16 v75 = [v7 expensiveConditionsBackOffInterval];
  if (v75)
  {
    [(__CFString *)v75 doubleValue];
    objc_msgSend(v6, "setExpensiveConditionsBackOffInterval:");
    id v36 = +[APSLog courier];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v78 = self;
      __int16 v79 = 2112;
      CFStringRef v80 = v75;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%@:  expensiveConditionsBackOffInterval = %@", buf, 0x16u);
    }
  }
  __int16 v76 = [v7 wifiKeepAliveEarlyFireConstantInterval];
  if ([(APSCourierConnectionManager *)self isCellularWatch]
    && v76
    && (_os_feature_enabled_impl() & 1) == 0)
  {
    [(__CFString *)v76 doubleValue];
    objc_msgSend(v6, "setWifiKeepAliveEarlyFireConstantInterval:");
    unsigned int v37 = +[APSLog courier];
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v78 = self;
      __int16 v79 = 2112;
      CFStringRef v80 = v76;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%@:  wifiKeepAliveEarlyFireConstantInterval = %@", buf, 0x16u);
    }
  }
  CFStringRef v74 = [v7 delayedReconnectTLSIntervalTrigger];
  if (v74)
  {
    [(__CFString *)v74 doubleValue];
    self->_int64_t delayedReconnectTLSIntervalTrigger = (uint64_t)v38;
    unsigned int v39 = +[APSLog courier];
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v78 = self;
      __int16 v79 = 2112;
      CFStringRef v80 = v74;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%@:  int64_t delayedReconnectTLSIntervalTrigger = %@", buf, 0x16u);
    }
  }
  v68 = (__CFString *)v34;
  CFStringRef v40 = [v7 delayedReconnectTLSInterval];
  int64_t v41 = v40;
  if (v40)
  {
    [(__CFString *)v40 doubleValue];
    self->_double delayedReconnectTLSInterval = v42;
    unsigned __int8 v43 = +[APSLog courier];
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v78 = self;
      __int16 v79 = 2112;
      CFStringRef v80 = v41;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%@:  double delayedReconnectTLSInterval = %@", buf, 0x16u);
    }
  }
  __int16 v71 = (__CFString *)v17;
  unsigned __int8 v44 = [v7 highQualityThresholdConnectedTime];
  unsigned int v45 = v44;
  if (v44)
  {
    connectionHistory = self->_connectionHistory;
    [(__CFString *)v44 doubleValue];
    -[APSConnectionHistory setHighQualityThresholdConnectedTime:](connectionHistory, "setHighQualityThresholdConnectedTime:");
    id v47 = +[APSLog courier];
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v78 = self;
      __int16 v79 = 2112;
      CFStringRef v80 = v45;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%@:  highQualityThresholdConnectedTime = %@", buf, 0x16u);
    }
  }
  uint64_t v70 = (__CFString *)v21;
  int64_t v48 = [v7 lowQualityThresholdConnectedTime];
  CFStringRef v49 = v48;
  if (v48)
  {
    CFStringRef v50 = self->_connectionHistory;
    [(__CFString *)v48 doubleValue];
    -[APSConnectionHistory setLowQualityThresholdConnectedTime:](v50, "setLowQualityThresholdConnectedTime:");
    char v51 = +[APSLog courier];
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v78 = self;
      __int16 v79 = 2112;
      CFStringRef v80 = v49;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "%@:  lowQualityThresholdConnectedTime = %@", buf, 0x16u);
    }
  }
  CFStringRef v72 = v6;
  id v52 = [v7 suspendToggleHourlyLimit];
  char v53 = v52;
  if (v52)
  {
    self->_suspendToggleHourlyLimit = (int64_t)[(__CFString *)v52 integerValue];
    unsigned int v54 = +[APSLog courier];
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v78 = self;
      __int16 v79 = 2112;
      CFStringRef v80 = v53;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "%@:  suspendToggleHourlyLimit = %@", buf, 0x16u);
    }
  }
  __int16 v69 = v23;
  unsigned int v55 = [v7 suspendToggleDailyLimit];
  int64_t v56 = v55;
  if (v55)
  {
    self->_suspendToggleDailyLimit = (int64_t)[(__CFString *)v55 integerValue];
    unint64_t v57 = +[APSLog courier];
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v78 = self;
      __int16 v79 = 2112;
      CFStringRef v80 = v56;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "%@:  suspendToggleDailyLimit = %@", buf, 0x16u);
    }
  }
  objc_msgSend(v7, "delayedSuspendKeepAliveInterval", v26);
  uint64_t v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v59 = v58;
  if (v58)
  {
    [(__CFString *)v58 doubleValue];
    self->_delayedSuspendKeepAliveInterval = v60;
    id v61 = +[APSLog courier];
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v78 = self;
      __int16 v79 = 2112;
      CFStringRef v80 = v59;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "%@:  delayedSuspendKeepAliveInterval = %@", buf, 0x16u);
    }
  }
  id v62 = [v7 filterMessageTimeout];
  unint64_t v63 = v62;
  if (v62)
  {
    [(__CFString *)v62 doubleValue];
    if (v64 == 0.0) {
      double v64 = 30.0;
    }
    self->_double filterMessageTimeout = v64;
    __int16 v65 = +[APSLog courier];
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v78 = self;
      __int16 v79 = 2112;
      CFStringRef v80 = v63;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "%@:  double filterMessageTimeout = %@", buf, 0x16u);
    }
  }
  v66 = [(APSCourierConnectionManager *)self delegate];
  [v66 courierConnectionManager:self receivedServerBag:v7];
}

- (void)courierConnection:(id)a3 hasDeterminedServerHostname:(id)a4 onInterface:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = +[APSLog courier];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v11 = sub_100040D80(a5);
    int v12 = 138413058;
    id v13 = self;
    __int16 v14 = 2112;
    id v15 = v9;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    uint64_t v19 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@: Connecting to courier %@ with connection: %@ onInterface: %@", (uint8_t *)&v12, 0x2Au);
  }
  [(APSCourierConnectionManager *)self _startConnectionEstablishTimerOnInterface:a5];
}

- (void)courierConnectionHasConnected:(id)a3 context:(id)a4 enabledPackedFormat:(BOOL)a5 secureHandshakeEnabled:(BOOL)a6 onInterface:(int64_t)a7
{
  uint64_t v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  __int16 v14 = +[APSLog courier];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [v12 serverHostnameForInterface:a7];
    __int16 v16 = [v12 serverIPAddressForInterface:a7];
    if (v9) {
      CFStringRef v17 = @"YES";
    }
    else {
      CFStringRef v17 = @"NO";
    }
    unsigned int v26 = v8;
    if (v8) {
      CFStringRef v18 = @"YES";
    }
    else {
      CFStringRef v18 = @"NO";
    }
    uint64_t v19 = sub_100040D80(a7);
    *(_DWORD *)buf = 138413826;
    unsigned int v28 = self;
    __int16 v29 = 2112;
    id v30 = v15;
    __int16 v31 = 2112;
    CFStringRef v32 = v16;
    __int16 v33 = 2112;
    id v34 = v12;
    __int16 v35 = 2112;
    CFStringRef v36 = v17;
    __int16 v37 = 2112;
    CFStringRef v38 = v18;
    uint64_t v8 = v26;
    __int16 v39 = 2112;
    CFStringRef v40 = v19;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@: Connected to courier %@ (%@) connection: %@ usingPackedFormat %@ secureHandshakeEnabled %@ onInterface: %@", buf, 0x48u);
  }
  [(APSCourierConnectionManager *)self setConnectionStatistics:v13 onInterface:a7];

  self->_secureHandshakeEnabled[a7] = v8;
  unsigned int v20 = objc_alloc_init(APSCourierConnectionProtocolConnection);
  [(APSCourierConnectionProtocolConnection *)v20 setConnectionManager:self];
  [(APSCourierConnectionProtocolConnection *)v20 setInterface:a7];
  [(APSCourierConnectionProtocolConnection *)v20 setSecureHandshakeEnabled:v8];
  CFStringRef v21 = &self->super.isa + a7;
  Class v22 = v21[12];
  v21[12] = (Class)v20;
  __int16 v23 = v20;

  CFStringRef v24 = [(APSCourierConnectionManager *)self delegate];
  [v24 courierConnectionManager:self openedNewProtocolConnection:v23];

  [(APSCourierConnectionManager *)self clearConsecutiveConnectionFailureReasonOnInterface:a7];
  +[NSDate timeIntervalSinceReferenceDate];
  unsigned int v25 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

  [(APSCourierConnectionManager *)self setConnectionTime:v25 forInterface:a7];
}

- (void)courierConnection:(id)a3 keepAliveResponseTimerFiredOnInterface:(int64_t)a4
{
  id v6 = a3;
  id v7 = +[APSLog courier];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = sub_100040D80(a4);
    unint64_t v9 = [(APSCourierConnection *)self->_courierConnection countConnectedInterfaces];
    uint64_t v10 = [(APSCourierConnectionManager *)self pcPersistentInterfaceManager];
    unint64_t v11 = [v10 currentLinkQualityString];
    int v17 = 138413058;
    CFStringRef v18 = self;
    __int16 v19 = 2112;
    unsigned int v20 = v8;
    __int16 v21 = 2048;
    unint64_t v22 = v9;
    __int16 v23 = 2112;
    CFStringRef v24 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: Keep-alive response timer fired onInterface %@. Keep-alive failed. Connected on %lu interfaces. Current link quality: %@", (uint8_t *)&v17, 0x2Au);
  }
  [(APSCourierConnectionManager *)self _clearKeepAliveResponseTimerOnInterface:a4];
  unsigned __int8 v12 = [v6 keepAliveV2SupportedOnInterface:a4];

  if ((v12 & 1) == 0)
  {
    [(APSCourierConnectionManager *)self _submitKeepAliveFailedAWDonInterface:a4];
    id v13 = +[APSLog courier];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      CFStringRef v18 = self;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@: AWD for KeepAliveFailed finished", (uint8_t *)&v17, 0xCu);
    }
  }
  __int16 v14 = +[APSLog courier];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    CFStringRef v18 = self;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@: Calling into AWD for ConnectionDisconnected", (uint8_t *)&v17, 0xCu);
  }

  id v15 = +[NSNumber numberWithInt:[(APSCourierConnectionManager *)self _linkQualityForInterface:a4]];
  +[APSMetricLogger connectionDisconnected:a4 linkQuality:v15 reason:16];
  __int16 v16 = +[APSLog courier];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    CFStringRef v18 = self;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@: AWD for ConnectionDisconnected finished", (uint8_t *)&v17, 0xCu);
  }

  [(APSCourierConnectionManager *)self _handleConnectionFailureOnInterface:a4 forceDelayedReconnect:0 withReason:16];
}

- (void)courierConnection:(id)a3 connectionEstablishTimerFiredOnInterface:(int64_t)a4
{
  id v6 = [(APSEnvironment *)self->_environment name];
  id v15 = sub_100040D80(a4);
  APSAlert();

  id v7 = +[APSLog courier];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = sub_100040D80(a4);
    unint64_t v9 = [(APSCourierConnection *)self->_courierConnection countConnectedInterfaces];
    uint64_t v10 = [(APSCourierConnectionManager *)self pcPersistentInterfaceManager];
    unint64_t v11 = [v10 currentLinkQualityString];
    *(_DWORD *)buf = 138413058;
    int v17 = self;
    __int16 v18 = 2112;
    __int16 v19 = v8;
    __int16 v20 = 2048;
    unint64_t v21 = v9;
    __int16 v22 = 2112;
    __int16 v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: Connection establish timer fired. Connection failed onInterface %@. Connected on %lu interfaces. Current link quality: %@", buf, 0x2Au);
  }
  [(APSCourierConnectionManager *)self _clearConnectionEstablishTimerOnInterface:a4];
  unsigned __int8 v12 = +[APSLog courier];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    int v17 = self;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@: Calling into AWD for ConnectionDisconnected", buf, 0xCu);
  }

  id v13 = +[NSNumber numberWithInt:[(APSCourierConnectionManager *)self _linkQualityForInterface:a4]];
  +[APSMetricLogger connectionDisconnected:a4 linkQuality:v13 reason:17];
  __int16 v14 = +[APSLog courier];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    int v17 = self;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@: AWD for ConnectionDisconnected finished", buf, 0xCu);
  }

  [(APSCourierConnectionManager *)self _handleConnectionFailureOnInterface:a4 forceDelayedReconnect:0 withReason:17];
}

- (void)courierConnection:(id)a3 failedToForceKeepAliveProxyOnInterface:(int64_t)a4
{
}

- (void)courierConnection:(id)a3 failedToObtainKeepAliveProxyOnInterface:(int64_t)a4
{
}

- (void)courierConnection:(id)a3 failedToFindKeepAliveProxyOnInterface:(int64_t)a4
{
}

- (void)_handleKeepAliveAckMessage:(id)a3 onInterface:(int64_t)a4
{
  id v6 = a3;
  id v7 = +[APSLog courier];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = sub_100040D80(a4);
    int v17 = 138412802;
    __int16 v18 = self;
    __int16 v19 = 2112;
    __int16 v20 = v8;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: Received successful keep-alive ack on interface %@: %@", (uint8_t *)&v17, 0x20u);
  }
  unint64_t v9 = +[NSDate date];
  uint64_t v10 = [(APSCourierConnection *)self->_courierConnection objectForKey:@"keepAliveSent" onInterface:a4];
  if (v10) {
    [v9 timeIntervalSinceDate:v10];
  }
  else {
    double v11 = 0.0;
  }
  unsigned __int8 v12 = +[NSNumber numberWithDouble:v11];
  [(APSCourierConnection *)self->_courierConnection setObject:v12 forKey:@"keepAliveAckTime" onInterface:a4];
  [(APSCourierConnectionManager *)self _clearKeepAliveResponseTimerOnInterface:a4];
  if ([(APSCourierConnection *)self->_courierConnection isConnectedOnInterface:a4])
  {
    if (a4 == 1)
    {
      networkMonitor = self->_networkMonitor;
      [(APSCourierConnection *)self->_courierConnection currentKeepAliveIntervalOnInterface:1];
      [(APSNetworkMonitor *)networkMonitor setCurrentWiFiKeepAliveInterval:[(APSCourierConnection *)self->_courierConnection countOfGrowthActionsOnInterface:1] growAttempts:v14];
    }
  }
  else
  {
    id v15 = +[APSLog courier];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = sub_100040D80(a4);
      int v17 = 138412546;
      __int16 v18 = self;
      __int16 v19 = 2112;
      __int16 v20 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@ received keepAlive for interface %@ that is no longer connected, ignoring.", (uint8_t *)&v17, 0x16u);
    }
  }
}

- (unint64_t)courierConnection:(id)a3 dataReceived:(id)a4 onInterface:(int64_t)a5 withGeneration:(unint64_t)a6 isWakingMessage:(BOOL)a7
{
  BOOL v101 = a7;
  id v98 = a3;
  id v10 = a4;
  unint64_t v104 = a5;
  double v11 = sub_100040D80(a5);
  v97 = +[NSString stringWithFormat:@"APSCourier(tcpStream:dataReceived:)-%@", v11];

  v95 = [[APSPowerAssertion alloc] initWithName:v97 category:202 holdDuration:2.0];
  unsigned __int8 v12 = +[APSLog courier];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [v10 length];
    sub_100040D80(a5);
    double v14 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    unint64_t v15 = [(APSCourierConnection *)self->_courierConnection countConnectedInterfaces];
    *(_DWORD *)buf = 138413314;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2048;
    id v153 = v13;
    __int16 v154 = 2112;
    v155 = v14;
    __int16 v156 = 2048;
    unint64_t v157 = v15;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@: Outstanding data received: %@ (length %lu) onInterface: %@. Connected on %lu interfaces.", buf, 0x34u);
  }
  unint64_t v16 = 0;
  do
  {
    char v147 = 0;
    id v145 = 0;
    v146 = 0;
    unsigned int v17 = [(APSCourierConnection *)self->_courierConnection parseMessage:v10 parameters:&v145 isInvalid:&v147 lengthParsed:&v146 onInterface:v104];
    id v18 = v145;
    v16 += (unint64_t)v146;
    __int16 v19 = +[APSLog courier];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v20 = "no";
      if (v17) {
        __int16 v21 = "yes";
      }
      else {
        __int16 v21 = "no";
      }
      if (v147) {
        __int16 v20 = "yes";
      }
      *(_DWORD *)buf = 138413314;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v21;
      *(_WORD *)&buf[22] = 2080;
      id v153 = (id)v20;
      __int16 v154 = 2048;
      v155 = v146;
      __int16 v156 = 2112;
      unint64_t v157 = (unint64_t)v18;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@: Stream processing: complete %s, invalid %s, length parsed %lu, parameters %@", buf, 0x34u);
    }

    id v22 = [(APSCourierConnectionManager *)self protocolConnectionForInterface:v104];
    if (v17)
    {
      uint64_t v141 = 0;
      v142 = &v141;
      uint64_t v143 = 0x2020000000;
      char v144 = 0;
      __int16 v23 = [v18 objectForKey:@"APSProtocolCommand"];
      unsigned int v24 = [v23 intValue];

      switch(v24)
      {
        case 1u:
        case 8u:
          v102 = [v18 objectForKey:@"APSProtocolServerTime"];
          if (v102)
          {
            [v102 doubleValue];
            unsigned int v26 = +[NSDate dateWithTimeIntervalSince1970:v25 / 1000.0];
            unint64_t v27 = v26;
            if (&_TMSetAuthenticatedSourceTime && type metadata for )
            {
              [v26 timeIntervalSinceReferenceDate];
              TMSetAuthenticatedSourceTime();
            }
            unsigned int v28 = [(APSCourierConnectionManager *)self serverTimeTracker];
            objc_msgSend(v28, "updateServerTimeWithTimeInMilliseconds:", objc_msgSend(v102, "unsignedLongLongValue"));
          }
          *((void *)&v103 + 1) = [v18 objectForKey:@"APSProtocolMessageSize"];
          *(void *)&long long v103 = [v18 objectForKey:@"APSProtocolLargeMessageSize"];
          [(APSCourierConnectionManager *)self setMaxMessageSize:*((void *)&v103 + 1) forInterface:v104];
          [(APSCourierConnectionManager *)self setMaxLargeMessageSize:(void)v103 forInterface:v104];
          if (v103 != 0)
          {
            __int16 v29 = +[APSLog courier];
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = self;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = *((void *)&v103 + 1);
              *(_WORD *)&buf[22] = 2112;
              id v153 = (id)v103;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%@: Received message sizes {standard: %@, large: %@}", buf, 0x20u);
            }
          }
          id v30 = [v18 objectForKey:@"APSProtocolMinKeepAliveInterval"];
          __int16 v31 = (NSNumber *)[v30 copy];
          serverMinKeepAliveInterval = self->_serverMinKeepAliveInterval;
          self->_serverMinKeepAliveInterval = v31;

          __int16 v33 = [v18 objectForKey:@"APSProtocolExpectedKeepAliveInterval"];
          id v34 = (NSNumber *)[v33 copy];
          serverExpectedKeepAliveInterval = self->_serverExpectedKeepAliveInterval;
          self->_serverExpectedKeepAliveInterval = v34;

          CFStringRef v36 = [v18 objectForKey:@"APSProtocolMaxKeepAliveInterval"];
          __int16 v37 = (NSNumber *)[v36 copy];
          serverMaxKeepAliveInterval = self->_serverMaxKeepAliveInterval;
          self->_serverMaxKeepAliveInterval = v37;

          __int16 v39 = +[APSLog courier];
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            id v99 = v10;
            CFStringRef v40 = self->_serverExpectedKeepAliveInterval;
            int64_t v41 = self->_serverMinKeepAliveInterval;
            double v42 = self->_serverMaxKeepAliveInterval;
            unsigned __int8 v43 = sub_100040D80(v104);
            *(_DWORD *)buf = 138413314;
            *(void *)&uint8_t buf[4] = self;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v41;
            *(_WORD *)&buf[22] = 2112;
            id v153 = v40;
            __int16 v154 = 2112;
            v155 = v42;
            __int16 v156 = 2112;
            unint64_t v157 = (unint64_t)v43;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%@: Setting server keep alive stats. {Min: %@, Expected: %@, Max: %@, Interface:%@}", buf, 0x34u);

            id v10 = v99;
          }

          v100 = [v18 objectForKey:@"APSProtocolGeoRegion"];
          if (v100 != self->_latestGeoRegion)
          {
            unsigned __int8 v44 = (NSString *)[(NSString *)v100 copy];
            latestGeoRegion = self->_latestGeoRegion;
            self->_latestGeoRegion = v44;
          }
          unsigned int v46 = [(APSCourierConnectionManager *)self _handleRedirectMessage:v18 onInterface:v104];
          [v98 clearConnectionEstablishTimerOnInterface:v104];
          id v47 = [(APSCourierConnectionManager *)self outgoingConnectMessageQueue];
          int64_t v48 = sub_100040D80(v104);
          if (v46) {
            id v49 = 0;
          }
          else {
            id v49 = v18;
          }
          [v47 handleResponseForPendingItem:v49 error:0 onInterface:v48];

          *((unsigned char *)v142 + 24) = 1;
          CFStringRef v50 = [v18 objectForKey:@"APSProtocolDualChannelSupport"];
          id v51 = [v50 BOOLValue];

          id v52 = +[APSLog courier];
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            CFStringRef v53 = @"NO";
            if (v51) {
              CFStringRef v53 = @"YES";
            }
            *(void *)&uint8_t buf[4] = self;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v53;
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%@: Setting dualChannelSupport: %@", buf, 0x16u);
          }

          unsigned int v54 = [(APSCourierConnectionManager *)self networkMonitor];
          [v54 setServerSupportsDualMode:v51];

          self->_unint64_t consecutiveConnectionFailureCount = 0;
          self->_consecutiveTLSConnectionFailureCount = 0;
          if ((v46 & 1) == 0)
          {
            if (!self->_symptomReporter)
            {
              unsigned int v55 = objc_alloc_init(APSSymptomReporter);
              symptomReporter = self->_symptomReporter;
              self->_symptomReporter = v55;
            }
            unint64_t v57 = [v18 objectForKey:@"APSProtocolClientIPAddress"];
            id v58 = [v57 copy];

            v59 = [(APSCourierConnectionManager *)self courierConnection];
            double v60 = [v59 interfaceNameForInterface:v104];

            [(APSSymptomReporter *)self->_symptomReporter reportConnectionSuccessOnConnectionType:v104 != 0];
            if (v58) {
              [(APSSymptomReporter *)self->_symptomReporter reportClientIPAddress:v58 forInterfaceOfName:v60];
            }
          }
          goto LABEL_76;
        case 3u:
        case 0xAu:
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x2020000000;
          LOBYTE(v153) = 0;
          v131[0] = _NSConcreteStackBlock;
          v131[1] = 3221225472;
          v131[2] = sub_100099564;
          v131[3] = &unk_10012C168;
          id v65 = v18;
          id v132 = v65;
          id v66 = v22;
          unint64_t v135 = a6;
          BOOL v136 = v101;
          id v133 = v66;
          v134 = buf;
          [v66 enumerateDataRecipient:v131];
          if (!*(unsigned char *)(*(void *)&buf[8] + 24))
          {
            __int16 v67 = +[APSLog courier];
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v148 = 138412546;
              v149 = self;
              __int16 v150 = 2048;
              uint64_t v151 = 2;
              _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "%@: Sending acknowledgement message with response %ld", v148, 0x16u);
            }

            v68 = [v65 objectForKey:@"APSProtocolToken"];
            __int16 v69 = [v65 objectForKey:@"APSProtocolMessageID"];
            [(APSCourierConnectionManager *)self sendMessageAcknowledgeMessageWithResponse:2 messageId:v69 token:v68 onInterface:v104];
          }
          *((unsigned char *)v142 + 24) = 1;
          [(APSCourierConnectionManager *)self notePush];

          _Block_object_dispose(buf, 8);
          [(APSCourierConnectionManager *)self _resetKeepAliveOnInterface:v104];
          goto LABEL_76;
        case 6u:
        case 0xDu:
          [(APSCourierConnectionManager *)self _handleKeepAliveResponseMessage:v18 onInterface:v104 didWake:v101];
          goto LABEL_75;
        case 7u:
          v137[0] = _NSConcreteStackBlock;
          v137[1] = 3221225472;
          v137[2] = sub_100099528;
          v137[3] = &unk_10012C140;
          id v87 = v22;
          id v138 = v87;
          id v139 = v18;
          v140 = &v141;
          [v87 enumerateDataRecipient:v137];

          goto LABEL_76;
        case 9u:
          CFStringRef v80 = +[APSLog courier];
          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "Received filter message response.", buf, 2u);
          }

          [(APSCourierConnectionManager *)self _clearFilterMessageTimerOnInterface:v104];
          CFStringRef v81 = [(APSCourierConnectionManager *)self outgoingFilterQueue];
          BOOL v82 = sub_100040D80(v104);
          [v81 handleResponseForPendingItem:v18 error:0 onInterface:v82];

          goto LABEL_75;
        case 0xBu:
          __int16 v75 = [(APSCourierConnectionManager *)self outgoingSendMessageQueue];
          __int16 v76 = sub_100040D80(v104);
          [v75 handleResponseForPendingItem:v18 error:0 onInterface:v76];

          goto LABEL_75;
        case 0xFu:
          [(APSCourierConnectionManager *)self _handleFlushMessage:v18 onInterface:v104];
          goto LABEL_75;
        case 0x10u:
          CFStringRef v74 = +[APSLog courier];
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = self;
            _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "%@: Received flush response.", buf, 0xCu);
          }

          goto LABEL_75;
        case 0x12u:
          uint64_t v70 = [(APSCourierConnectionManager *)self tokenGenerateResponseQueue];
          __int16 v71 = sub_100040D80(v104);
          [v70 handleResponseForPendingItem:v18 error:0 onInterface:v71];

          goto LABEL_75;
        case 0x16u:
          [(APSCourierConnectionManager *)self _handleKeepAliveAckMessage:v18 onInterface:v104];
          goto LABEL_75;
        case 0x17u:
          [(APSCourierConnectionManager *)self _handleRedirectMessage:v18 onInterface:v104];
          goto LABEL_75;
        case 0x18u:
          v127[0] = _NSConcreteStackBlock;
          v127[1] = 3221225472;
          v127[2] = sub_1000995E0;
          v127[3] = &unk_10012C140;
          id v77 = v22;
          id v128 = v77;
          id v129 = v18;
          v130 = &v141;
          [v77 enumerateDataRecipient:v127];

          goto LABEL_76;
        case 0x19u:
          v123[0] = _NSConcreteStackBlock;
          v123[1] = 3221225472;
          v123[2] = sub_10009961C;
          v123[3] = &unk_10012C140;
          id v79 = v22;
          id v124 = v79;
          id v125 = v18;
          v126 = &v141;
          [v79 enumerateDataRecipient:v123];

          goto LABEL_76;
        case 0x1Du:
          CFStringRef v78 = +[APSLog courier];
          if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "Received pubsub subscription response", buf, 2u);
          }

          v119[0] = _NSConcreteStackBlock;
          v119[1] = 3221225472;
          v119[2] = sub_100099658;
          v119[3] = &unk_10012C140;
          id v120 = v18;
          id v121 = v22;
          unint64_t v122 = &v141;
          [v121 enumerateDataRecipient:v119];

          goto LABEL_76;
        case 0x1Eu:
          v115[0] = _NSConcreteStackBlock;
          v115[1] = 3221225472;
          v115[2] = sub_1000996CC;
          v115[3] = &unk_10012C140;
          id v116 = v18;
          id v117 = v22;
          CFStringRef v118 = &v141;
          [v117 enumerateDataRecipient:v115];

          goto LABEL_76;
        case 0x20u:
          BOOL v88 = +[APSLog courier];
          if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "Received presence tracking response.", buf, 2u);
          }

          v111[0] = _NSConcreteStackBlock;
          v111[1] = 3221225472;
          v111[2] = sub_100099740;
          v111[3] = &unk_10012C140;
          id v89 = v22;
          id v112 = v89;
          id v113 = v18;
          unint64_t v114 = &v141;
          [v89 enumerateDataRecipient:v111];

          goto LABEL_76;
        case 0x21u:
          CFStringRef v72 = +[APSLog courier];
          if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "Received server initiated filter update request.", buf, 2u);
          }

          v107[0] = _NSConcreteStackBlock;
          v107[1] = 3221225472;
          v107[2] = sub_10009977C;
          v107[3] = &unk_10012C140;
          id v73 = v22;
          id v108 = v73;
          id v109 = v18;
          v110 = &v141;
          [v73 enumerateDataRecipient:v107];

          goto LABEL_76;
        case 0x22u:
          [(APSCourierConnectionManager *)self _handleDelayKeepAliveCancelMessageOnInterface:v104];
LABEL_75:
          *((unsigned char *)v142 + 24) = 1;
LABEL_76:
          if (!*((unsigned char *)v142 + 24))
          {
            CFStringRef v83 = +[APSLog courier];
            if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
            {
              v90 = sub_100040D80(v104);
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v18;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v90;
              _os_log_error_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_ERROR, "Incoming message was not handled! {parameters: %@, interface: %@}", buf, 0x16u);
            }
          }
          _Block_object_dispose(&v141, 8);
          break;
        default:
          id v91 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:@"missing protocol command enum" userInfo:0];
          objc_exception_throw(v91);
      }
    }
    else if (v147)
    {
      id v61 = +[APSLog courier];
      if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v10;
        _os_log_fault_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_FAULT, "%@: Received invalid message data: %@", buf, 0x16u);
      }

      id v62 = +[APSLog courier];
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = self;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "%@: Calling into AWD for ConnectionDisconnected", buf, 0xCu);
      }

      unint64_t v63 = +[NSNumber numberWithInt:[(APSCourierConnectionManager *)self _linkQualityForInterface:v104]];
      +[APSMetricLogger connectionDisconnected:v104 linkQuality:v63 reason:18];
      double v64 = +[APSLog courier];
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = self;
        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "%@: AWD for ConnectionDisconnected finished", buf, 0xCu);
      }

      [(APSCourierConnectionManager *)self _handleConnectionFailureOnInterface:v104 forceDelayedReconnect:0 withReason:18];
    }
    __int16 v84 = v146;
    if (v146)
    {
      unint64_t v85 = (char *)[v10 length];
      uint64_t v86 = objc_msgSend(v10, "subdataWithRange:", v84, v85 - (char *)v146);

      id v10 = (id)v86;
    }
  }
  while ((v17 & 1) != 0);
  dispatch_time_t v92 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = nullsub_5;
  block[3] = &unk_10012A5E0;
  int64_t v106 = v95;
  v93 = v95;
  dispatch_after(v92, (dispatch_queue_t)&_dispatch_main_q, block);

  return v16;
}

- (id)consecutiveConnectionFailureReasonOnInterface:(int64_t)a3
{
  if (a3 < 2)
  {
    id v7 = self->_consecutiveConnectionFailureReason[a3];
  }
  else
  {
    uint64_t v5 = +[APSLog courier];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = sub_100040D80(a3);
      int v9 = 138412546;
      id v10 = self;
      __int16 v11 = 2112;
      unsigned __int8 v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ asked to return consecutiveConnectionFailureReason on invalid interface %@", (uint8_t *)&v9, 0x16u);
    }
    id v7 = 0;
  }
  return v7;
}

- (void)setConnectionFailure:(id)a3 onInterface:(int64_t)a4
{
  id v6 = a3;
  if (a4 < 2)
  {
    consecutiveConnectionFailureReason = self->_consecutiveConnectionFailureReason;
    id v10 = consecutiveConnectionFailureReason[a4];
    if (!v10)
    {
      __int16 v11 = (NSCountedSet *)objc_alloc_init((Class)NSCountedSet);
      unsigned __int8 v12 = consecutiveConnectionFailureReason[a4];
      consecutiveConnectionFailureReason[a4] = v11;

      id v10 = consecutiveConnectionFailureReason[a4];
    }
    id v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 code]);
    [(NSCountedSet *)v10 addObject:v13];
  }
  else
  {
    id v7 = +[APSLog courier];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = sub_100040D80(a4);
      int v14 = 138412802;
      unint64_t v15 = self;
      __int16 v16 = 2112;
      id v17 = v6;
      __int16 v18 = 2112;
      __int16 v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ asked to add error %@ to consecutiveConnectionFailureReason on invalid interface %@", (uint8_t *)&v14, 0x20u);
    }
  }
}

- (void)clearConsecutiveConnectionFailureReasonOnInterface:(int64_t)a3
{
  if (a3 < 2)
  {
    id v7 = &self->super.isa + a3;
    Class v8 = v7[8];
    v7[8] = 0;
  }
  else
  {
    uint64_t v5 = +[APSLog courier];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = sub_100040D80(a3);
      int v9 = 138412546;
      id v10 = self;
      __int16 v11 = 2112;
      unsigned __int8 v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ asked to clear consecutiveConnectionFailureReason on invalid interface %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (BOOL)_handleRedirectMessage:(id)a3 onInterface:(int64_t)a4
{
  id v6 = a3;
  id v7 = [v6 objectForKey:@"APSProtocolServerMetadata"];
  Class v8 = [v6 objectForKey:@"APSProtocolRedirectReason"];

  if (v7)
  {
    int v9 = +[APSLog courier];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412802;
      id v13 = self;
      __int16 v14 = 2112;
      unint64_t v15 = v7;
      __int16 v16 = 2112;
      id v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: Received courier redirect host '%@' with reason: '%@'", (uint8_t *)&v12, 0x20u);
    }

    [(APSCourierConnection *)self->_courierConnection setUsingCachedIPAddress:0 onInterface:a4];
    [(APSCourierConnection *)self->_courierConnection setRedirectHost:v7];
    id v10 = +[NSNumber numberWithInt:[(APSCourierConnectionManager *)self _linkQualityForInterface:a4]];
    +[APSMetricLogger connectionDisconnected:a4 linkQuality:v10 reason:9];
    [(APSCourierConnectionManager *)self _disconnectStreamForInterface:a4 withReason:9];
    [(APSCourierConnection *)self->_courierConnection incrementRedirectCount];
    [(APSCourierConnectionManager *)self _adjustConnectionWithInterfacePreference:a4];
    [(APSCourierConnection *)self->_courierConnection setRedirectHost:0];
  }
  return v7 != 0;
}

- (void)_submitKeepAliveFailedAWDonInterface:(int64_t)a3
{
  uint64_t v5 = +[APSLog courier];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    Class v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: Calling into AWD for KeepAliveFailed", (uint8_t *)&v7, 0xCu);
  }

  id v6 = +[APSLog courier];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    Class v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: AWD for KeepAliveFailed returned", (uint8_t *)&v7, 0xCu);
  }

  [(APSCourierConnection *)self->_courierConnection setObject:0 forKey:@"keepAliveSent" onInterface:a3];
  [(APSCourierConnection *)self->_courierConnection setObject:0 forKey:@"keepAliveAckTime" onInterface:a3];
}

- (void)setConnectionStatistics:(id)a3 onInterface:(int64_t)a4
{
  id v6 = a3;
  if (a4 < 2)
  {
    int v9 = &self->super.isa + a4;
    Class v10 = v9[3];
    v9[3] = 0;

    Class v11 = v9[5];
    v9[5] = 0;

    int v12 = [v6 objectForKey:@"tcp_handshake"];
    id v13 = (objc_class *)[v12 copy];
    Class v14 = v9[1];
    v9[1] = v13;

    unint64_t v15 = [v6 objectForKey:@"dns"];
    __int16 v16 = (objc_class *)[v15 copy];
    Class v17 = v9[3];
    v9[3] = v16;

    int v7 = [v6 objectForKey:@"tls"];
    __int16 v18 = [v7 copy];
    Class v19 = v9[5];
    v9[5] = v18;
  }
  else
  {
    int v7 = +[APSLog courier];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      Class v8 = sub_100040D80(a4);
      int v20 = 138412802;
      __int16 v21 = self;
      __int16 v22 = 2112;
      id v23 = v6;
      __int16 v24 = 2112;
      double v25 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ asked to add connection statictis %@ on invalid interface %@", (uint8_t *)&v20, 0x20u);
    }
  }
}

- (void)_handleConnectionSuspendedOnInterface:(int64_t)a3
{
  if (!a3)
  {
    uint64_t v9 = v3;
    uint64_t v10 = v4;
    if (!-[APSCourierConnection isSuspendedOnInterface:](self->_courierConnection, "isSuspendedOnInterface:"))
    {
      [(APSCourierConnectionManager *)self _clearPostSuspensionFlushState];
      [(APSCourierConnection *)self->_courierConnection setIsSuspended:1 onInterface:0];
      [(APSCourierConnection *)self->_courierConnection setIsConnected:0 onInterface:0 withDisconnectReason:1030];
      [(APSCourierConnection *)self->_courierConnection stopManagerOnInterface:0];
      [(APSCourierConnectionManager *)self protocolConnectionForInterface:0];
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_10009A0BC;
      v7[3] = &unk_10012C0D0;
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      id v6 = v8;
      [v6 enumerateStateListeners:v7];
    }
  }
}

- (void)_handleConnectionRecoverFromSuspensionOnInterface:(int64_t)a3
{
  if (!a3 && -[APSCourierConnection isSuspendedOnInterface:](self->_courierConnection, "isSuspendedOnInterface:"))
  {
    uint64_t v4 = +[APSLog courier];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Cellular interface is recovering from suspension", (uint8_t *)&v16, 2u);
    }

    [(APSCourierConnection *)self->_courierConnection setIsSuspended:0 onInterface:0];
    [(APSCourierConnection *)self->_courierConnection setIsConnected:1 onInterface:0];
    if (self->_delayedSuspendKeepAliveInterval <= 0.0) {
      goto LABEL_9;
    }
    uint64_t v5 = [(APSCourierConnectionManager *)self hourlySuspendToggleRateLimiter];
    id v6 = [(APSCourierConnectionManager *)self dailySuspendToggleRateLimiter];
    if [v5 isUnderLimit] && (objc_msgSend(v6, "isUnderLimit"))
    {
      [v5 note];
      [v6 note];

LABEL_9:
      [(APSCourierConnectionManager *)self _handleConnectionAfterSuspensionRecoveryOnInterface:0 withKeepAlive:1];
      return;
    }
    self->_pendingPostSuspensionWWANFlush = 1;
    id v7 = objc_alloc((Class)PCPersistentTimer);
    double delayedSuspendKeepAliveInterval = self->_delayedSuspendKeepAliveInterval;
    uint64_t v9 = +[NSNumber numberWithInteger:0];
    uint64_t v10 = (PCPersistentTimer *)[v7 initWithTimeInterval:@"APSCourier" serviceIdentifier:self target:"_delayedSuspendKeepAliveTimerFired:" selector:v9 userInfo:delayedSuspendKeepAliveInterval];
    delayedSuspendKeepAliveTimer = self->_delayedSuspendKeepAliveTimer;
    self->_delayedSuspendKeepAliveTimer = v10;

    [(PCPersistentTimer *)self->_delayedSuspendKeepAliveTimer setMinimumEarlyFireProportion:1.0];
    int v12 = self->_delayedSuspendKeepAliveTimer;
    id v13 = +[NSRunLoop mainRunLoop];
    [(PCPersistentTimer *)v12 scheduleInRunLoop:v13];

    Class v14 = +[APSLog courier];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      double v15 = self->_delayedSuspendKeepAliveInterval;
      int v16 = 138413058;
      Class v17 = self;
      __int16 v18 = 2048;
      double v19 = v15;
      __int16 v20 = 2112;
      __int16 v21 = v5;
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@ cellular interface suspension toggles are over the limit! {delay: %f, hourly: %@, daily: %@}", (uint8_t *)&v16, 0x2Au);
    }
  }
}

- (void)_delayedSuspendKeepAliveTimerFired:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[APSLog courier];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    uint64_t v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: _delayedSuspendKeepAliveTimerFired! Connecting now.", (uint8_t *)&v8, 0xCu);
  }

  [(APSCourierConnectionManager *)self _clearPostSuspensionFlushState];
  id v6 = [v4 userInfo];

  id v7 = [v6 integerValue];
  [(APSCourierConnectionManager *)self _handleConnectionAfterSuspensionRecoveryOnInterface:v7 withKeepAlive:1];
}

- (void)_handleConnectionAfterSuspensionRecoveryOnInterface:(int64_t)a3 withKeepAlive:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = +[APSLog courier];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"NO";
    if (v4) {
      CFStringRef v8 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    id v13 = self;
    __int16 v14 = 2112;
    CFStringRef v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: _handleConnectionAfterSuspensionRecoveryOnInterface {withKeepAlive: %@}", buf, 0x16u);
  }

  if ([(APSCourierConnection *)self->_courierConnection countConnectedInterfaces] >= 2) {
    [(APSNetworkMonitor *)self->_networkMonitor openedSecondChannel];
  }
  if (v4) {
    [(APSCourierConnectionManager *)self _performKeepAliveOnInterface:a3 shortInterval:0 withAction:2];
  }
  [(APSCourierConnectionManager *)self protocolConnectionForInterface:a3];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10009A5C8;
  v10[3] = &unk_10012C0D0;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v11;
  [v9 enumerateStateListeners:v10];
}

- (void)_resetServerKeepAliveStatsOnInterface:(int64_t)a3
{
  -[APSCourierConnection setServerStatsMaxKeepAlive:onInterface:](self->_courierConnection, "setServerStatsMaxKeepAlive:onInterface:", 0.0);
  [(APSCourierConnection *)self->_courierConnection setServerStatsMinKeepAlive:a3 onInterface:0.0];
  [(APSCourierConnection *)self->_courierConnection setServerStatsExpectedKeepAlive:a3 onInterface:0.0];
  courierConnection = self->_courierConnection;
  [(APSCourierConnection *)courierConnection setUsingServerStatsAggressively:0 onInterface:a3];
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    [(APSCourierConnectionManager *)self _adjustConnection];
  }
}

- (void)_invokeInFailureHandlingContext:(id)a3
{
  BOOL v4 = (void (**)(void))a3;
  [(APSCourierConnectionManager *)self setHandlingFailure:1];
  if (v4) {
    v4[2]();
  }
  [(APSCourierConnectionManager *)self setHandlingFailure:0];
}

- (void)_performFlushWithPaddingLength:(unint64_t)a3
{
  if ([(APSCourierConnection *)self->_courierConnection isConnectedOnInterface:1])
  {
    uint64_t v5 = +[APSLog courier];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = sub_100040D80(1uLL);
      int v9 = 138412802;
      uint64_t v10 = self;
      __int16 v11 = 2048;
      unint64_t v12 = a3;
      __int16 v13 = 2112;
      __int16 v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ Sending flush message with padding length %lu  onInterface %@", (uint8_t *)&v9, 0x20u);
    }
    [(APSCourierConnection *)self->_courierConnection sendFlushMessageWithWantPaddingLength:a3 paddingLength:a3 onInterface:1];
  }
  if ([(APSCourierConnection *)self->_courierConnection isConnectedOnInterface:0])
  {
    id v7 = +[APSLog courier];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v8 = sub_100040D80(0);
      int v9 = 138412802;
      uint64_t v10 = self;
      __int16 v11 = 2048;
      unint64_t v12 = a3;
      __int16 v13 = 2112;
      __int16 v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ Sending flush message with padding length %lu  onInterface %@", (uint8_t *)&v9, 0x20u);
    }
    [(APSCourierConnection *)self->_courierConnection sendFlushMessageWithWantPaddingLength:a3 paddingLength:a3 onInterface:0];
  }
}

- (void)_handleFlushMessage:(id)a3 onInterface:(int64_t)a4
{
  id v6 = a3;
  id v7 = [v6 objectForKey:@"APSProtocolFlushWantPadding"];
  id v8 = [v7 unsignedIntegerValue];

  int v9 = +[APSLog courier];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = sub_100040D80(a4);
    int v12 = 138413058;
    __int16 v13 = self;
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2048;
    id v17 = v8;
    __int16 v18 = 2112;
    double v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: Received flush message %@ with paddingLength %lu onInterface: %@", (uint8_t *)&v12, 0x2Au);
  }
  if (v8)
  {
    __int16 v11 = +[APSLog courier];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      __int16 v13 = self;
      __int16 v14 = 2048;
      id v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ Sending flush response message with padding length %lu", (uint8_t *)&v12, 0x16u);
    }

    [(APSCourierConnection *)self->_courierConnection sendFlushResponseMessageWithPaddingLength:v8 onInterface:a4];
  }
}

- (void)_delayedPerformKeepAliveOnInterface:(int64_t)a3
{
}

- (void)_delayedPerformKeepAliveOnInterface:(int64_t)a3 withDelay:(double)a4
{
  if (a3 < 2)
  {
    double v8 = a4;
    delayedKeepAlivePowerAssertion = self->_delayedKeepAlivePowerAssertion;
    if (delayedKeepAlivePowerAssertion)
    {
      self->_delayedKeepAlivePowerAssertion = 0;
    }
    uint64_t v10 = APSBundleIdentifier;
    __int16 v11 = [(APSEnvironment *)self->_environment domain];
    int v12 = sub_100040D80(a3);
    id v17 = +[NSString stringWithFormat:@"%@-delayed-keepalive-%@-%@", v10, v11, v12];

    __int16 v13 = [[APSPowerAssertion alloc] initWithName:v17 category:203 holdDuration:60.0];
    __int16 v14 = self->_delayedKeepAlivePowerAssertion;
    self->_delayedKeepAlivePowerAssertion = v13;

    id v15 = +[NSNumber numberWithInteger:a3];
    +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"__delayedPerformKeepAliveOnInterface:" object:v15];

    if (v8 <= 0.0) {
      double v8 = 2.0;
    }
    __int16 v16 = +[NSNumber numberWithInteger:a3];
    [(APSCourierConnectionManager *)self performSelector:"__delayedPerformKeepAliveOnInterface:" withObject:v16 afterDelay:v8];
  }
  else
  {
    id v6 = +[APSLog courier];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = sub_100040D80(a3);
      *(_DWORD *)buf = 138412546;
      double v19 = self;
      __int16 v20 = 2112;
      __int16 v21 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ asked to perform delayed keep alive with invalid interface %@", buf, 0x16u);
    }
  }
}

- (void)__delayedPerformKeepAliveOnInterface:(id)a3
{
  id v4 = [a3 integerValue];
  if ([(APSCourierConnection *)self->_courierConnection isConnectedOnInterface:v4]) {
    [(APSCourierConnectionManager *)self _performKeepAliveOnInterface:v4 shortInterval:0 withAction:2];
  }
  delayedKeepAlivePowerAssertion = self->_delayedKeepAlivePowerAssertion;
  self->_delayedKeepAlivePowerAssertion = 0;
}

- (void)_handleDelayKeepAliveCancelMessageOnInterface:(int64_t)a3
{
  uint64_t v5 = +[APSLog courier];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received cancel keep alive command. Canceling delayed keep alive timer and requesting keep alive now.", v8, 2u);
  }

  id v6 = +[NSNumber numberWithInteger:a3];
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"__delayedPerformKeepAliveOnInterface:" object:v6];

  if (self->_delayedKeepAlivePowerAssertion)
  {
    id v7 = +[NSNumber numberWithInteger:a3];
    [(APSCourierConnectionManager *)self __delayedPerformKeepAliveOnInterface:v7];
  }
}

- (void)_performKeepAliveOnInterface:(int64_t)a3 shortInterval:(BOOL)a4 withAction:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = a4;
  if (-[APSCourierConnection isConnectedOnInterface:](self->_courierConnection, "isConnectedOnInterface:"))
  {
    [(APSConnectionHistory *)self->_connectionHistory adjustQualityOfConnectionOnInterface:a3];
    BOOL v9 = [(APSCourierConnectionManager *)self useServerKeepAliveStatsOnInterface:a3];
    if (v9)
    {
      uint64_t v10 = +[APSLog courier];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        unsigned int v45 = self;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@ using server stats for keep alive interval", buf, 0xCu);
      }

      courierConnection = self->_courierConnection;
      [(NSNumber *)self->_serverMaxKeepAliveInterval doubleValue];
      -[APSCourierConnection setServerStatsMaxKeepAlive:onInterface:](courierConnection, "setServerStatsMaxKeepAlive:onInterface:", a3);
      int v12 = self->_courierConnection;
      [(NSNumber *)self->_serverMinKeepAliveInterval doubleValue];
      -[APSCourierConnection setServerStatsMinKeepAlive:onInterface:](v12, "setServerStatsMinKeepAlive:onInterface:", a3);
      __int16 v13 = self->_courierConnection;
      [(NSNumber *)self->_serverExpectedKeepAliveInterval doubleValue];
      -[APSCourierConnection setServerStatsExpectedKeepAlive:onInterface:](v13, "setServerStatsExpectedKeepAlive:onInterface:", a3);
      [(APSCourierConnection *)self->_courierConnection setUsingServerStatsAggressively:(id)[(APSConnectionHistory *)self->_connectionHistory connectionQualityOnInterface:a3] == (id)2 onInterface:a3];
    }
    else
    {
      [(APSCourierConnectionManager *)self _resetServerKeepAliveStatsOnInterface:a3];
    }
    [(APSCourierConnection *)self->_courierConnection currentKeepAliveIntervalOnInterface:a3];
    unint64_t v15 = llround(v14 / 60.0);
    __int16 v16 = [(APSCourierConnection *)self->_courierConnection currentKeepAliveStateOnInterface:a3];
    if ([(APSCourierConnection *)self->_courierConnection keepAliveV2SupportedOnInterface:a3])
    {
      [(APSCourierConnection *)self->_courierConnection setKeepAliveGracePeriod:a3 onInterface:self->_keepAliveV2TimeDriftMaximum];
      [(APSCourierConnection *)self->_courierConnection resumeManagerWithAction:v5 onInterface:a3];
      [(APSCourierConnection *)self->_courierConnection currentKeepAliveIntervalOnInterface:a3];
      unint64_t v18 = llround(v17);
    }
    else
    {
      unint64_t v18 = 0;
    }
    double v19 = [[APSKeepAliveMetadata alloc] initWithUsingWWAN:a3 == 0 keepAliveInterval:v15 delayedResponseInterval:v18 usingServerStats:v9 keepAliveState:v16];
    __int16 v20 = +[APSLog courier];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v40 = v6;
      __int16 v21 = v19;
      __int16 v22 = v16;
      id v23 = self->_courierConnection;
      __int16 v24 = sub_100040D80(a3);
      unint64_t v25 = [(APSCourierConnection *)self->_courierConnection countConnectedInterfaces];
      unsigned int v26 = [(APSCourierConnectionManager *)self pcPersistentInterfaceManager];
      unint64_t v27 = [v26 currentLinkQualityString];
      *(_DWORD *)buf = 138413314;
      unsigned int v45 = self;
      __int16 v46 = 2112;
      id v47 = v23;
      __int16 v16 = v22;
      double v19 = v21;
      uint64_t v6 = v40;
      __int16 v48 = 2112;
      id v49 = v24;
      __int16 v50 = 2048;
      unint64_t v51 = v25;
      __int16 v52 = 2112;
      CFStringRef v53 = v27;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%@: Sending keep alive message via conn: %@ onInterface: %@. Connected on %lu interfaces. Current link quality: %@", buf, 0x34u);
    }
    [(APSCourierConnection *)self->_courierConnection sendKeepAliveMessageWithMetadata:v19 onInterface:a3];
    [(APSCourierConnectionManager *)self _startKeepAliveResponseTimerOnInterface:a3 shortInterval:v6];
    uint64_t v28 = [(APSCourierConnection *)self->_courierConnection nwInterfaceTypeForInterface:a3];
    __int16 v29 = +[APSLog courier];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      unsigned int v45 = self;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%@: Sending keep alive note to Core Telephony.", buf, 0xCu);
    }

    id v30 = [(APSCourierConnectionManager *)self ctClient];
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10009B378;
    v41[3] = &unk_10012C190;
    v41[4] = self;
    [v30 triggerKeepaliveWakeupEvent:v28 completion:v41];

    [(APSCourierConnection *)self->_courierConnection currentKeepAliveIntervalOnInterface:a3];
    CFStringRef v32 = +[NSNumber numberWithInt:llround(v31)];
    __int16 v33 = self->_courierConnection;
    id v34 = +[NSDate date];
    [(APSCourierConnection *)v33 setObject:v34 forKey:@"keepAliveSent" onInterface:a3];

    [(APSCourierConnection *)self->_courierConnection setObject:v32 forKey:@"lastKeepAliveInterval" onInterface:a3];
    __int16 v35 = +[NSNumber numberWithInt:[(APSCourierConnection *)self->_courierConnection currentGrowthStageOnInterface:a3]];
    [(APSCourierConnection *)self->_courierConnection setObject:v35 forKey:@"growthStage" onInterface:a3];
    CFStringRef v36 = &off_100137848;
    if (!a3) {
      CFStringRef v36 = &off_100137830;
    }
    v43[0] = v36;
    v42[0] = @"ConnectionType";
    v42[1] = @"Environment";
    __int16 v37 = +[NSNumber numberWithUnsignedInteger:[(APSEnvironment *)self->_environment environmentType]];
    v43[1] = v37;
    v42[2] = @"LinkQuality";
    CFStringRef v38 = +[NSNumber numberWithInt:[(APSCourierConnectionManager *)self _linkQualityForInterface:a3]];
    v43[2] = v38;
    __int16 v39 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:3];

    APSPowerLog();
    if (!a3 && self->_pendingPostSuspensionWWANFlush)
    {
      [(APSCourierConnectionManager *)self _handleConnectionAfterSuspensionRecoveryOnInterface:0 withKeepAlive:0];
      [(APSCourierConnectionManager *)self _clearPostSuspensionFlushState];
    }
  }
}

- (void)_startKeepAliveResponseTimerOnInterface:(int64_t)a3 shortInterval:(BOOL)a4
{
  BOOL v4 = a4;
  -[APSCourierConnectionManager _clearKeepAliveResponseTimerOnInterface:](self, "_clearKeepAliveResponseTimerOnInterface:");
  courierConnection = self->_courierConnection;
  [(APSCourierConnection *)courierConnection startKeepAliveResponseTimerOnInterface:a3 shortInterval:v4];
}

- (void)_requestKeepAlive:(BOOL)a3 orConnection:(BOOL)a4 shortInterval:(BOOL)a5 onInterface:(int64_t)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  BOOL v9 = a3;
  +[NSDate timeIntervalSinceReferenceDate];
  double v12 = v11;
  double v13 = v11 - self->_lastClientRequestedKeepaliveTime;
  courierConnection = self->_courierConnection;
  if (a6 == 3)
  {
    unsigned int v15 = [(APSCourierConnection *)courierConnection isConnected];
    unsigned __int8 v16 = [(APSCourierConnection *)self->_courierConnection hasOpenConnection];
    double v17 = self->_courierConnection;
    id v18 = [(APSCourierConnection *)v17 preferredInterface];
    double v19 = v17;
  }
  else
  {
    unsigned int v15 = [(APSCourierConnection *)courierConnection isConnectedOnInterface:a6];
    unsigned __int8 v16 = [(APSCourierConnection *)self->_courierConnection hasOpenConnectionOnInterface:a6];
    double v19 = self->_courierConnection;
    id v18 = (id)a6;
  }
  unsigned int v20 = [(APSCourierConnection *)v19 hasKeepAliveResponseTimerOnInterface:v18];
  if (v13 < 0.0 || v13 >= 60.0)
  {
    if ((v15 ^ 1 | v20))
    {
      if (v16)
      {
        __int16 v22 = +[APSLog courier];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          id v23 = self->_courierConnection;
          if ([(APSCourierConnection *)v23 hasConnectionEstablishTimerOnInterface:a6])
          {
            CFStringRef v24 = @"YES";
          }
          else
          {
            CFStringRef v24 = @"NO";
          }
          unsigned int v25 = [(APSCourierConnection *)self->_courierConnection hasKeepAliveResponseTimerOnInterface:a6];
          int v31 = 138413058;
          if (v25) {
            CFStringRef v26 = @"YES";
          }
          else {
            CFStringRef v26 = @"NO";
          }
          CFStringRef v32 = self;
          __int16 v33 = 2112;
          id v34 = v23;
          __int16 v35 = 2112;
          CFStringRef v36 = v24;
          __int16 v37 = 2112;
          CFStringRef v38 = v26;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%@ ignoring request to keepAlive/reconnect conn: %@ connectTimer: %@ keepAliveTimer: %@", (uint8_t *)&v31, 0x2Au);
        }

        return;
      }
      if (!v8) {
        return;
      }
      [(APSCourierConnectionManager *)self _adjustConnectionWithInterfacePreference:a6];
      id v30 = self->_courierConnection;
      if (a6 == 3)
      {
        if (![(APSCourierConnection *)v30 hasOpenConnection]) {
          return;
        }
      }
      else if (![(APSCourierConnection *)v30 hasOpenConnectionOnInterface:a6])
      {
        return;
      }
    }
    else
    {
      if (!v9) {
        return;
      }
      if (a6 == 3) {
        a6 = [(APSCourierConnection *)self->_courierConnection preferredInterface];
      }
      [(APSCourierConnectionManager *)self _performKeepAliveOnInterface:a6 shortInterval:v7 withAction:2];
    }
    self->_lastClientRequestedKeepaliveTime = v12;
    return;
  }
  unint64_t v27 = +[APSLog courier];
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v28 = @"NO";
    if (v9) {
      CFStringRef v29 = @"YES";
    }
    else {
      CFStringRef v29 = @"NO";
    }
    int v31 = 138412802;
    CFStringRef v32 = self;
    __int16 v33 = 2112;
    id v34 = (void *)v29;
    if (v8) {
      CFStringRef v28 = @"YES";
    }
    __int16 v35 = 2112;
    CFStringRef v36 = v28;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%@ throttling call to _requestKeepAlive:%@ orConnection:%@", (uint8_t *)&v31, 0x20u);
  }
}

- (void)requestConnectionIfNeeded
{
  uint64_t v3 = +[APSLog courier];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    uint64_t v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ requestConnectionIfNeeded", (uint8_t *)&v4, 0xCu);
  }

  [(APSCourierConnectionManager *)self _requestKeepAlive:0 orConnection:1];
}

- (void)performKeepAlive
{
  [(APSCourierConnectionManager *)self performKeepAliveOnInterface:0];
  [(APSCourierConnectionManager *)self performKeepAliveOnInterface:1];
}

- (void)_requestKeepAlive:(BOOL)a3 orConnection:(BOOL)a4
{
}

- (void)_resetKeepAliveOnInterface:(int64_t)a3
{
  if (-[APSCourierConnection keepAliveV2SupportedOnInterface:](self->_courierConnection, "keepAliveV2SupportedOnInterface:"))
  {
    [(APSCourierConnectionManager *)self _delayedPerformKeepAliveOnInterface:a3];
  }
  else
  {
    [(APSCourierConnectionManager *)self _clearKeepAliveResponseTimerOnInterface:a3];
    courierConnection = self->_courierConnection;
    [(APSCourierConnection *)courierConnection updateConnectionManagerKeepAliveIntervalOnInterface:a3];
  }
}

- (void)_handleKeepAliveResponseMessage:(id)a3 onInterface:(int64_t)a4 didWake:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  [(APSCourierConnectionManager *)self _clearKeepAliveResponseTimerOnInterface:a4];
  BOOL v9 = [v8 objectForKey:@"APSProtocolKeepAliveResponse"];
  uint64_t v10 = +[APSLog courier];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    double v11 = sub_100040D80(a4);
    *(_DWORD *)buf = 138413058;
    __int16 v35 = self;
    __int16 v36 = 2112;
    __int16 v37 = v9;
    __int16 v38 = 2112;
    __int16 v39 = v11;
    __int16 v40 = 2112;
    id v41 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@: Received keep-alive response %@ on interface %@: %@", buf, 0x2Au);
  }
  if (![(APSCourierConnection *)self->_courierConnection isConnectedOnInterface:a4])
  {
    unsigned int v20 = +[APSLog courier];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v21 = sub_100040D80(a4);
      *(_DWORD *)buf = 138412546;
      __int16 v35 = self;
      __int16 v36 = 2112;
      __int16 v37 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%@ received keepAlive for interface %@ that is no longer connected, ignoring.", buf, 0x16u);
    }
    goto LABEL_31;
  }
  if (!v9)
  {
    if (![(APSCourierConnection *)self->_courierConnection keepAliveV2SupportedOnInterface:a4])
    {
      unsigned int v20 = +[NSDate date];
      __int16 v22 = [(APSCourierConnection *)self->_courierConnection objectForKey:@"keepAliveSent" onInterface:a4];
      if (v22) {
        [v20 timeIntervalSinceDate:v22];
      }
      else {
        double v23 = 0.0;
      }
      CFStringRef v29 = +[NSNumber numberWithDouble:v23];
      [(APSCourierConnection *)self->_courierConnection setObject:v29 forKey:@"keepAliveAckTime" onInterface:a4];
      [(APSCourierConnection *)self->_courierConnection resumeManagerWithAction:0 onInterface:a4];
      if (a4 == 1)
      {
        networkMonitor = self->_networkMonitor;
        [(APSCourierConnection *)self->_courierConnection currentKeepAliveIntervalOnInterface:1];
        [(APSNetworkMonitor *)networkMonitor setCurrentWiFiKeepAliveInterval:[(APSCourierConnection *)self->_courierConnection countOfGrowthActionsOnInterface:1] growAttempts:v31];
      }
      if (![(APSCourierConnection *)self->_courierConnection lastKeepAliveActionOnInterface:a4])[(APSCourierConnectionManager *)self _submitKeepAliveSucceededAWDonInterface:a4]; {

      }
      goto LABEL_31;
    }
    [(APSCourierConnection *)self->_courierConnection setKeepAliveV2Supported:0 onInterface:a4];
    goto LABEL_23;
  }
  double v12 = [v8 objectForKey:@"APSProtocolKeepAliveResponse"];
  unsigned int v13 = [v12 intValue];

  switch(v13)
  {
    case 2u:
      CFStringRef v24 = self;
      int64_t v25 = a4;
      uint64_t v26 = 1;
LABEL_24:
      [(APSCourierConnectionManager *)v24 _performKeepAliveOnInterface:v25 shortInterval:0 withAction:v26];
      break;
    case 1u:
      unint64_t v27 = [v8 objectForKey:@"APSProtocolKeepAliveDelayKeepAliveDurationKey"];
      double v28 = (double)([v27 unsignedIntValue] / 0x3E8);

      [(APSCourierConnectionManager *)self _delayedPerformKeepAliveOnInterface:a4 withDelay:v28];
      break;
    case 0u:
      [(APSCourierConnectionManager *)self _submitKeepAliveSucceededAWDonInterface:a4];
      [(APSCourierConnectionManager *)self _performKeepAliveOnInterface:a4 shortInterval:0 withAction:0];
      if (a4 == 1)
      {
        double v14 = self->_networkMonitor;
        [(APSCourierConnection *)self->_courierConnection currentKeepAliveIntervalOnInterface:1];
        [(APSNetworkMonitor *)v14 setCurrentWiFiKeepAliveInterval:[(APSCourierConnection *)self->_courierConnection countOfGrowthActionsOnInterface:1] growAttempts:v15];
      }
      unsigned __int8 v16 = &off_100137848;
      if (!a4) {
        unsigned __int8 v16 = &off_100137830;
      }
      v33[0] = v16;
      double v17 = +[NSNumber numberWithUnsignedInteger:[(APSEnvironment *)self->_environment environmentType]];
      v33[1] = v17;
      v32[2] = @"LinkQuality";
      id v18 = +[NSNumber numberWithInt:[(APSCourierConnectionManager *)self _linkQualityForInterface:a4]];
      v33[2] = v18;
      v32[3] = @"DidWake";
      double v19 = +[NSNumber numberWithBool:v5];
      v33[3] = v19;
      unsigned int v20 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:4];

      APSPowerLog();
LABEL_31:

      break;
    default:
      if (v13 - 3 <= 1)
      {
        [(APSCourierConnection *)self->_courierConnection setKeepAliveV2Supported:0 onInterface:a4];
        [(APSCourierConnection *)self->_courierConnection setKeepAliveGracePeriod:a4 onInterface:0.0];
LABEL_23:
        CFStringRef v24 = self;
        int64_t v25 = a4;
        uint64_t v26 = 2;
        goto LABEL_24;
      }
      break;
  }
}

- (void)_submitKeepAliveSucceededAWDonInterface:(int64_t)a3
{
  BOOL v5 = +[APSLog courier];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    uint64_t v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: Calling into AWD for KeepAliveSucceeded", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v6 = +[APSLog courier];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    uint64_t v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: AWD for KeepAliveSucceeded returned", (uint8_t *)&v9, 0xCu);
  }

  [(APSCourierConnection *)self->_courierConnection setObject:0 forKey:@"keepAliveSent" onInterface:a3];
  [(APSCourierConnection *)self->_courierConnection setObject:0 forKey:@"keepAliveAckTime" onInterface:a3];
  courierConnection = self->_courierConnection;
  id v8 = +[NSDate date];
  [(APSCourierConnection *)courierConnection setObject:v8 forKey:@"timeSinceLastKeepAliveSucceeded" onInterface:a3];
}

- (void)updateKeepAliveInterval:(double)a3
{
  BOOL v5 = +[APSLog courier];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    BOOL v7 = self;
    __int16 v8 = 2048;
    double v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: Updating keep alive delay interval to %f", (uint8_t *)&v6, 0x16u);
  }

  self->_double delayedSuspendKeepAliveInterval = a3;
}

- (void)networkMonitor:(id)a3 evaluateDualModeState:(BOOL)a4
{
  BOOL v4 = a4;
  int v6 = +[APSLog courier];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"NO";
    if (v4) {
      CFStringRef v7 = @"YES";
    }
    int v9 = 138412546;
    uint64_t v10 = self;
    __int16 v11 = 2112;
    CFStringRef v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: Received delegate call: shouldUseDualMode is set to %@", (uint8_t *)&v9, 0x16u);
  }

  if ([(APSCourierConnection *)self->_courierConnection isConnected])
  {
    __int16 v8 = +[APSLog courier];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      uint64_t v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ resetting consecutive failures because we have at least one connection", (uint8_t *)&v9, 0xCu);
    }

    self->_unint64_t consecutiveConnectionFailureCount = 0;
    self->_consecutiveTLSConnectionFailureCount = 0;
  }
  [(APSCourierConnection *)self->_courierConnection setIsDualChannelAllowed:v4];
  [(APSCourierConnectionManager *)self _adjustConnection];
}

- (void)networkMonitorWiFiBecameAssociated:(id)a3
{
  BOOL v4 = +[APSLog courier];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    int v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@: Received networkMonitorWiFiBecameAssociated", (uint8_t *)&v5, 0xCu);
  }

  [(APSCourierConnectionManager *)self _adjustConnection];
}

- (void)networkMonitor:(id)a3 enableWiFiAssertionForPiggybackConnection:(BOOL)a4
{
  BOOL v4 = a4;
  int v6 = +[APSLog courier];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"Disabling";
    if (v4) {
      CFStringRef v7 = @"Enabling";
    }
    int v8 = 138412546;
    int v9 = self;
    __int16 v10 = 2112;
    CFStringRef v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: %@ WiFi assertion for piggyback connection", (uint8_t *)&v8, 0x16u);
  }

  [(APSCourierConnection *)self->_courierConnection setEnableNonCellularOnConnectionManager:v4];
}

- (void)interfaceLinkQualityChanged:(id)a3 previousLinkQuality:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (![v6 interfaceIdentifier])
  {
    unsigned int v7 = [v6 isPoorLinkQuality];
    unsigned __int8 v8 = +[PCInterfaceMonitor isPoorLinkQuality:v4];
    if (v7)
    {
      if ((v8 & 1) == 0
        && [(APSCourierConnection *)self->_courierConnection isConnectedOnInterface:1])
      {
        APSAlert();
        int v9 = +[APSLog courier];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v10 = 138412290;
          CFStringRef v11 = self;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ WiFi poorLQ keepAlive sent", (uint8_t *)&v10, 0xCu);
        }

        [(APSCourierConnectionManager *)self _requestKeepAlive:1 orConnection:0 shortInterval:0 onInterface:1];
      }
    }
  }
  [(APSCourierConnectionManager *)self _dumpLogsForInconsistencyIfNecessary];
}

- (void)interfaceRadioHotnessChanged:(id)a3
{
  id v4 = a3;
  int v5 = +[APSLog courier];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = [v4 isRadioHot];
    CFStringRef v7 = @"NO";
    *(_DWORD *)buf = 138412802;
    double v14 = self;
    __int16 v15 = 2112;
    if (v6) {
      CFStringRef v7 = @"YES";
    }
    id v16 = v4;
    __int16 v17 = 2112;
    CFStringRef v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ %@ interface radio hotness changed to %@", buf, 0x20u);
  }

  id v8 = [(APSCourierConnectionManager *)self pcInterfaceMonitorWWAN];
  BOOL v9 = v8 != v4;

  [(APSCourierConnectionManager *)self protocolConnectionForInterface:v9];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10009C5D0;
  v11[3] = &unk_10012C0D0;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = v12;
  [v10 enumerateStateListeners:v11];
}

- (unint64_t)serverTimeInNanoSeconds
{
  v2 = [(APSCourierConnectionManager *)self serverTimeTracker];
  id v3 = [v2 serverTimeInNanoSeconds];

  return (unint64_t)v3;
}

- (id)dnsResolutionTimeMillisecondsOnInterface:(int64_t)a3
{
  if (a3 < 2)
  {
    CFStringRef v7 = self->_dnsResolutionTimeMilliseconds[a3];
  }
  else
  {
    int v5 = +[APSLog courier];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v6 = sub_100040D80(a3);
      int v9 = 138412546;
      id v10 = self;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ asked to return dnsResolutionTimeMilliseconds on invalid interface %@", (uint8_t *)&v9, 0x16u);
    }
    CFStringRef v7 = 0;
  }
  return v7;
}

- (id)tlsHandshakeTimeMillisecondsOnInterface:(int64_t)a3
{
  if (a3 < 2)
  {
    CFStringRef v7 = self->_tlsHandshakeTimeMilliseconds[a3];
  }
  else
  {
    int v5 = +[APSLog courier];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v6 = sub_100040D80(a3);
      int v9 = 138412546;
      id v10 = self;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ asked to return tlsHandshakeTimeMilliseconds on invalid interface %@", (uint8_t *)&v9, 0x16u);
    }
    CFStringRef v7 = 0;
  }
  return v7;
}

- (id)tcpHandshakeTimeMillisecondsOnInterface:(int64_t)a3
{
  if (a3 < 2)
  {
    CFStringRef v7 = self->_tcpHandshakeTimeMilliseconds[a3];
  }
  else
  {
    int v5 = +[APSLog courier];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v6 = sub_100040D80(a3);
      int v9 = 138412546;
      id v10 = self;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ asked to return tcpHandshakeTimeMilliseconds on invalid interface %@", (uint8_t *)&v9, 0x16u);
    }
    CFStringRef v7 = 0;
  }
  return v7;
}

- (void)forceAdjustConnections
{
  [(APSCourierConnectionManager *)self _clearDelayedReconnectTimer];
  [(APSCourierConnectionManager *)self adjustConnectionsIfNeeded];
}

- (void)adjustConnectionsIfNeeded
{
  if ([(APSCourierConnectionManager *)self handlingFailure])
  {
    id v3 = +[APSLog courier];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      int v5 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ mid-failure handling, ignoring adjustConnectionsIfNeeded call", (uint8_t *)&v4, 0xCu);
    }
  }
  else
  {
    [(APSCourierConnectionManager *)self _adjustConnection];
  }
}

- (void)performKeepAliveOnInterface:(int64_t)a3
{
  if ([(APSCourierConnection *)self->_courierConnection isConnectedOnInterface:1])
  {
    int v5 = +[APSLog courier];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v6 = sub_100040D80(a3);
      int v7 = 138412546;
      id v8 = self;
      __int16 v9 = 2112;
      id v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ force performing keep alive on %@ interface", (uint8_t *)&v7, 0x16u);
    }
    [(APSCourierConnectionManager *)self _performKeepAliveOnInterface:a3 shortInterval:0 withAction:2];
  }
}

- (void)sendFlushOnAllConnectionshWithPaddingLength:(unint64_t)a3
{
}

- (BOOL)isConnected
{
  v2 = [(APSCourierConnectionManager *)self courierConnection];
  unsigned __int8 v3 = [v2 isConnected];

  return v3;
}

- (int64_t)preferredInterface
{
  v2 = [(APSCourierConnectionManager *)self courierConnection];
  id v3 = [v2 preferredInterface];

  return (int64_t)v3;
}

- (BOOL)hasOpenConnection
{
  v2 = [(APSCourierConnectionManager *)self courierConnection];
  unsigned __int8 v3 = [v2 hasOpenConnection];

  return v3;
}

- (unint64_t)countConnectedInterfaces
{
  v2 = [(APSCourierConnectionManager *)self courierConnection];
  id v3 = [v2 countConnectedInterfaces];

  return (unint64_t)v3;
}

- (unint64_t)countOpenConnections
{
  v2 = [(APSCourierConnectionManager *)self courierConnection];
  id v3 = [v2 countOpenConnections];

  return (unint64_t)v3;
}

- (id)currentKeepAliveStateOnInterface:(int64_t)a3
{
  int v4 = [(APSCourierConnectionManager *)self courierConnection];
  int v5 = [v4 currentKeepAliveStateOnInterface:a3];

  return v5;
}

- (BOOL)didPushCauseWake
{
  v2 = [(APSCourierConnectionManager *)self courierConnection];
  unsigned __int8 v3 = [v2 didPushCauseWake];

  return v3;
}

- (id)tcpInfoDescription
{
  v2 = [(APSCourierConnectionManager *)self courierConnection];
  unsigned __int8 v3 = [v2 tcpInfoDescription];

  return v3;
}

- (BOOL)isConnectedOnInterface:(int64_t)a3
{
  int v4 = [(APSCourierConnectionManager *)self courierConnection];
  LOBYTE(a3) = [v4 isConnectedOnInterface:a3];

  return a3;
}

- (BOOL)isSuspendedOnInterface:(int64_t)a3
{
  int v4 = [(APSCourierConnectionManager *)self courierConnection];
  LOBYTE(a3) = [v4 isSuspendedOnInterface:a3];

  return a3;
}

- (BOOL)hasOpenConnectionOnInterface:(int64_t)a3
{
  int v4 = [(APSCourierConnectionManager *)self courierConnection];
  LOBYTE(a3) = [v4 hasOpenConnectionOnInterface:a3];

  return a3;
}

- (void)holdPowerAssertionUntilStreamsQuiesce
{
  id v2 = [(APSCourierConnectionManager *)self courierConnection];
  [v2 holdPowerAssertionUntilStreamsQuiesce];
}

- (id)serverIPAddressForInterface:(int64_t)a3
{
  int v4 = [(APSCourierConnectionManager *)self courierConnection];
  int v5 = [v4 serverIPAddressForInterface:a3];

  return v5;
}

- (id)serverHostnameForInterface:(int64_t)a3
{
  int v4 = [(APSCourierConnectionManager *)self courierConnection];
  int v5 = [v4 serverHostnameForInterface:a3];

  return v5;
}

- (void)sendSetActiveState:(BOOL)a3 forInterval:(unsigned int)a4 onInterface:(int64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  BOOL v7 = a3;
  id v8 = [(APSCourierConnectionManager *)self courierConnection];
  [v8 sendSetActiveState:v7 forInterval:v6 onInterface:a5];
}

- (id)_sendOutgoingMessage:(id)a3 topicHash:(id)a4 lastRTT:(id)a5 token:(id)a6 onInterface:(int64_t)a7 ultraConstrainedAllowed:(BOOL)a8 withCompletion:(id)a9
{
  id v15 = a3;
  id v51 = a4;
  id v52 = a5;
  id v53 = a6;
  id v16 = a9;
  if ([v15 payloadFormat] == (id)1)
  {
    __int16 v17 = [v15 userInfo];
    +[NSPropertyListSerialization dataWithPropertyList:v17 format:200 options:0 error:0];
  }
  else
  {
    __int16 v17 = [v15 userInfo];
    +[NSJSONSerialization dataWithJSONObject:v17 options:0 error:0];
  CFStringRef v18 = };

  if (v18)
  {
    objc_msgSend(v15, "setPayloadLength:", objc_msgSend(v18, "length"));
    double v19 = [(APSCourierConnectionManager *)self maxLargeMessageSizeForInterface:a7];
    if (v19)
    {
      id v20 = [v18 length];
      __int16 v21 = [(APSCourierConnectionManager *)self maxLargeMessageSizeForInterface:a7];
      id v22 = [v21 unsignedIntegerValue];

      if (v20 > v22)
      {
        double v23 = +[APSLog courier];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          id v24 = [v15 messageID];
          id v25 = [v18 length];
          uint64_t v26 = [(APSCourierConnectionManager *)self maxLargeMessageSizeForInterface:a7];
          *(_DWORD *)buf = 138413058;
          v59 = self;
          __int16 v60 = 2048;
          id v61 = v24;
          __int16 v62 = 2048;
          id v63 = v25;
          __int16 v64 = 2048;
          id v65 = v26;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%@: Dropping outgoing message %lu because its length of %lu bytes is larger than %lu bytes", buf, 0x2Au);
        }
LABEL_9:

        unint64_t v27 = APSError();

        goto LABEL_33;
      }
    }
    double v28 = [(APSCourierConnectionManager *)self pcInterfaceMonitorOnInterface:a7];
    unsigned int v29 = [v28 isInternetReachable];

    id v30 = [(APSCourierConnectionManager *)self courierConnection];
    unsigned int v31 = [v30 isConnectedOnInterface:a7];

    if ((v31 ^ 1 | v29))
    {
      CFStringRef v32 = [(APSCourierConnectionManager *)self pcInterfaceMonitorOnInterface:a7];
      BOOL v33 = [v32 interfaceConstraint] != (id)1 || a8;

      double v23 = +[APSLog courier];
      BOOL v34 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
      if (!v33)
      {
        if (v34)
        {
          *(_DWORD *)buf = 138412546;
          v59 = self;
          __int16 v60 = 2048;
          id v61 = [v15 messageID];
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%@ Trying to send outgoing message %lu but only connected on ultra constrained", buf, 0x16u);
        }
        goto LABEL_9;
      }
      if (v34)
      {
        id v49 = [v15 messageID];
        __int16 v35 = sub_100040D80(a7);
        id v48 = [v18 length];
        __int16 v36 = [(APSCourierConnectionManager *)self courierConnection];
        id v47 = [v36 countConnectedInterfaces];
        __int16 v37 = [(APSCourierConnectionManager *)self pcPersistentInterfaceManager];
        __int16 v50 = [v37 currentLinkQualityString];
        *(_DWORD *)buf = 138413570;
        v59 = self;
        __int16 v60 = 2048;
        id v61 = v49;
        __int16 v62 = 2112;
        id v63 = v35;
        __int16 v64 = 2048;
        id v65 = v48;
        __int16 v66 = 2048;
        id v67 = v47;
        __int16 v68 = 2112;
        __int16 v69 = v50;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%@: Sending outgoing message %lu onInterface: %@. Size of %lu. Connected on %lu interfaces. Current link quality: %@", buf, 0x3Eu);
      }
      unsigned int v38 = -[APSCourierConnectionManager sendMessageWithTopicHash:identifier:payload:token:isPlistFormat:lastRTT:onInterface:withCompletion:](self, "sendMessageWithTopicHash:identifier:payload:token:isPlistFormat:lastRTT:onInterface:withCompletion:", v51, [v15 identifier], v18, v53, objc_msgSend(v15, "payloadFormat") == (id)1, v52, a7, v16);
      __int16 v39 = +[APSLog networking];
      BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG);

      if (v40)
      {
        id v41 = +[APSLog networking];
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
          sub_1000CB444(self, v41);
        }
      }
      [(APSCourierConnectionManager *)self notePush];
      if (v38)
      {

        unint64_t v27 = 0;
      }
      else
      {
        unint64_t v27 = APSError();
      }
    }
    else
    {
      double v42 = +[APSLog courier];
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        id v43 = [v15 messageID];
        unsigned __int8 v44 = sub_100040D80(a7);
        *(_DWORD *)buf = 138412802;
        v59 = self;
        __int16 v60 = 2048;
        id v61 = v43;
        __int16 v62 = 2112;
        id v63 = v44;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%@ Trying to send outgoing message %lu but connected interface %@ is not reachable", buf, 0x20u);
      }
      [(APSCourierConnectionManager *)self disconnectStreamForInterface:a7 withReason:10];
      [(APSCourierConnectionManager *)self adjustConnectionsIfNeeded];
      unint64_t v27 = APSError();
    }
  }
  else
  {
    unsigned int v45 = +[APSLog courier];
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)unsigned int v54 = 138412546;
      unsigned int v55 = self;
      __int16 v56 = 2048;
      id v57 = [v15 messageID];
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%@: Dropping outgoing message %lu because it could not be encoded in JSON", v54, 0x16u);
    }

    unint64_t v27 = APSError();
  }
LABEL_33:

  return v27;
}

- (void)sendMessageTracingAckWithTopicHash:(id)a3 tracingUUID:(id)a4 status:(int)a5 token:(id)a6 onInterface:(int64_t)a7
{
  uint64_t v8 = *(void *)&a5;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(APSCourierConnectionManager *)self courierConnection];
  [v15 sendMessageTracingAckWithTopicHash:v14 tracingUUID:v13 status:v8 token:v12 onInterface:a7];
}

- (void)sendTokenGenerateMessageWithTopicHash:(id)a3 baseToken:(id)a4 appId:(unsigned __int16)a5 expirationTTL:(unsigned int)a6 vapidPublicKeyHash:(id)a7 type:(int64_t)a8 withCompletion:(id)a9 onInterface:(int64_t)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a7;
  id v19 = a9;
  id v20 = [(APSCourierConnectionManager *)self tokenGenerateResponseQueue];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10009D84C;
  v24[3] = &unk_10012C1B8;
  v24[4] = self;
  id v25 = v16;
  unsigned __int16 v31 = a5;
  unsigned int v30 = a6;
  id v26 = v17;
  id v27 = v18;
  int64_t v28 = a8;
  int64_t v29 = a10;
  id v21 = v18;
  id v22 = v17;
  id v23 = v16;
  [v20 enqueueSendBlock:v24 completionBlock:v19];
}

- (void)sendPubSubChannelListWithMetadata:(id)a3 baseToken:(id)a4 messageID:(unsigned int)a5 onInterface:(int64_t)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(APSCourierConnectionManager *)self courierConnection];
  [v12 sendPubSubChannelListWithMetadata:v11 baseToken:v10 messageID:v7 onInterface:a6];
}

- (void)sendActivityTrackingRequestWithMessageID:(unint64_t)a3 pushToken:(id)a4 salt:(unint64_t)a5 trackingFlag:(unsigned int)a6 timestamp:(unint64_t)a7 onInterface:(int64_t)a8
{
  uint64_t v10 = *(void *)&a6;
  id v14 = a4;
  id v15 = [(APSCourierConnectionManager *)self courierConnection];
  [v15 sendActivityTrackingRequestWithMessageID:a3 pushToken:v14 salt:a5 trackingFlag:v10 timestamp:a7 onInterface:a8];
}

- (BOOL)generationMatches:(unint64_t)a3 forInterface:(int64_t)a4
{
  uint64_t v6 = [(APSCourierConnectionManager *)self courierConnection];
  LOBYTE(a4) = [v6 generationMatches:a3 forInterface:a4];

  return a4;
}

- (void)sendMessageAcknowledgeMessageWithResponse:(int64_t)a3 messageId:(id)a4 token:(id)a5 onInterface:(int64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = [(APSCourierConnectionManager *)self courierConnection];
  [v12 sendMessageAcknowledgeMessageWithResponse:a3 messageId:v11 token:v10 onInterface:a6];
}

- (double)currentKeepAliveIntervalOnInterface:(int64_t)a3
{
  int v4 = [(APSCourierConnectionManager *)self courierConnection];
  [v4 currentKeepAliveIntervalOnInterface:a3];
  double v6 = v5;

  return v6;
}

- (BOOL)sendMessageWithTopicHash:(id)a3 identifier:(unint64_t)a4 payload:(id)a5 token:(id)a6 isPlistFormat:(BOOL)a7 lastRTT:(id)a8 onInterface:(int64_t)a9 withCompletion:(id)a10
{
  BOOL v11 = a7;
  id v25 = a10;
  id v17 = a8;
  id v18 = a6;
  id v19 = a5;
  id v20 = a3;
  id v21 = [(APSCourierConnectionManager *)self courierConnection];
  LOBYTE(a8) = [v21 sendMessageWithTopicHash:v20 identifier:a4 payload:v19 token:v18 isPlistFormat:v11 lastRTT:v17 onInterface:a9];

  id v22 = [(APSCourierConnectionManager *)self outgoingSendMessageQueue];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  void v28[2] = sub_10009DCB4;
  v28[3] = &unk_10012C1D8;
  v28[4] = a9;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10009DCBC;
  v26[3] = &unk_10012C200;
  id v27 = v25;
  id v23 = v25;
  [v22 enqueueSendBlock:v28 completionBlock:v26];

  return (char)a8;
}

- (BOOL)isAttemptingToReconnect
{
  id v2 = [(APSCourierConnectionManager *)self courierConnection];
  unsigned __int8 v3 = [v2 hasConnectionEstablishTimer];

  return v3;
}

- (void)sendTaskControlMessageWithMetadata:(id)a3 messageId:(unint64_t)a4 onInterface:(int64_t)a5
{
  id v8 = a3;
  id v9 = [(APSCourierConnectionManager *)self courierConnection];
  [v9 sendTaskControlMessageWithMetadata:v8 messageId:a4 onInterface:a5];
}

- (void)sendFilterMessageWithEnabledHashes:(id)a3 ignoredHashes:(id)a4 opportunisticHashes:(id)a5 nonWakingHashes:(id)a6 pausedHashes:(id)a7 token:(id)a8 version:(unint64_t)a9 expectsResponse:(BOOL)a10 onInterface:(int64_t)a11 withCompletion:(id)a12
{
  id v26 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a12;
  if (a10)
  {
    [(APSCourierConnectionManager *)self _startFilterMessageTimerOnInterface:a11];
    id v24 = [(APSCourierConnectionManager *)self outgoingFilterQueue];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    void v27[2] = sub_10009DF58;
    v27[3] = &unk_10012C228;
    void v27[4] = self;
    id v28 = v26;
    id v29 = v18;
    id v30 = v19;
    id v31 = v20;
    id v32 = v21;
    id v33 = v22;
    unint64_t v34 = a9;
    int64_t v35 = a11;
    [v24 enqueueSendBlock:v27 completionBlock:v23];
  }
  else
  {
    id v25 = [(APSCourierConnectionManager *)self courierConnection];
    [v25 sendFilterMessageWithEnabledHashes:v26 ignoredHashes:v18 opportunisticHashes:v19 nonWakingHashes:v20 pausedHashes:v21 token:v22 version:a9 onInterface:a11];
  }
}

- (void)sendConnectMessageWithToken:(id)a3 state:(int)a4 interface:(int64_t)a5 activeInterval:(unsigned int)a6 presenceFlags:(unsigned int)a7 metadata:(id)a8 certificates:(id)a9 nonce:(id)a10 signature:(id)a11 redirectCount:(unsigned __int8)a12 withCompletion:(id)a13 onInterface:(int64_t)a14
{
  id v18 = a3;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  id v23 = a13;
  id v24 = [(APSCourierConnectionManager *)self outgoingConnectMessageQueue];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10009E164;
  v32[3] = &unk_10012C250;
  void v32[4] = self;
  id v33 = v18;
  int v40 = a4;
  unsigned int v41 = a7;
  unsigned int v42 = a6;
  id v34 = v19;
  id v35 = v20;
  id v36 = v21;
  id v37 = v22;
  unsigned __int8 v43 = a12;
  int64_t v38 = a5;
  int64_t v39 = a14;
  id v25 = v22;
  id v26 = v21;
  id v27 = v20;
  id v28 = v19;
  id v29 = v18;
  [v24 enqueueSendBlock:v32 completionBlock:v23];
}

- (void)sendConnectMessageWithToken:(id)a3 interface:(int64_t)a4 activeInterval:(unsigned int)a5 presenceFlags:(unsigned int)a6 metadata:(id)a7 certificates:(id)a8 nonce:(id)a9 signature:(id)a10 hostCertificateInfo:(id)a11 redirectCount:(unsigned __int8)a12 tcpHandshakeTimeMilliseconds:(double)a13 dnsResolveTimeMilliseconds:(double)a14 tlsHandshakeTimeMilliseconds:(double)a15 consecutiveConnectionFailureReason:(id)a16 withCompletion:(id)a17 onInterface:(int64_t)a18
{
  id v24 = a3;
  id v25 = a7;
  id v26 = a8;
  id v27 = a9;
  id v28 = a10;
  id v29 = a11;
  id v30 = a16;
  id v31 = a17;
  id v32 = [(APSCourierConnectionManager *)self outgoingConnectMessageQueue];
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_10009E3E8;
  void v43[3] = &unk_10012C278;
  v43[4] = self;
  id v44 = v24;
  id v50 = v30;
  int64_t v51 = a4;
  unsigned int v56 = a5;
  unsigned int v57 = a6;
  id v45 = v25;
  id v46 = v26;
  id v47 = v27;
  id v48 = v28;
  unsigned __int8 v58 = a12;
  double v52 = a13;
  double v53 = a14;
  double v54 = a15;
  id v49 = v29;
  int64_t v55 = a18;
  id v33 = v30;
  id v34 = v29;
  id v35 = v28;
  id v36 = v27;
  id v37 = v26;
  id v38 = v25;
  id v39 = v24;
  [v32 enqueueSendBlock:v43 completionBlock:v31];
}

- (void)sendConnectMessageWithToken:(id)a3 state:(int)a4 presenceFlags:(unsigned int)a5 metadata:(id)a6 certificates:(id)a7 nonce:(id)a8 signature:(id)a9 hostCertificateInfo:(id)a10 redirectCount:(unsigned __int8)a11 withCompletion:(id)a12 onInterface:(int64_t)a13
{
  id v18 = a3;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a12;
  id v25 = [(APSCourierConnectionManager *)self outgoingConnectMessageQueue];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10009E628;
  v33[3] = &unk_10012C2A0;
  void v33[4] = self;
  id v34 = v18;
  int v41 = a4;
  unsigned int v42 = a5;
  id v35 = v19;
  id v36 = v20;
  id v37 = v21;
  id v38 = v22;
  unsigned __int8 v43 = a11;
  id v39 = v23;
  int64_t v40 = a13;
  id v26 = v23;
  id v27 = v22;
  id v28 = v21;
  id v29 = v20;
  id v30 = v19;
  id v31 = v18;
  [v25 enqueueSendBlock:v33 completionBlock:v24];
}

- (BOOL)isKeepAliveProxyConfiguredOnInterface:(int64_t)a3
{
  int v4 = [(APSCourierConnectionManager *)self courierConnection];
  LOBYTE(a3) = [v4 isKeepAliveProxyConfiguredOnInterface:a3];

  return a3;
}

- (BOOL)isKeepAliveProxyConfiguredOnAnyInterface
{
  id v2 = [(APSCourierConnectionManager *)self courierConnection];
  unsigned __int8 v3 = [v2 isKeepAliveProxyConfiguredOnAnyInterface];

  return v3;
}

- (BOOL)keepAliveV2SupportedOnInterface:(int64_t)a3
{
  int v4 = [(APSCourierConnectionManager *)self courierConnection];
  LOBYTE(a3) = [v4 keepAliveV2SupportedOnInterface:a3];

  return a3;
}

- (void)setKeepAliveV2Supported:(BOOL)a3 onInterface:(int64_t)a4
{
  BOOL v5 = a3;
  id v6 = [(APSCourierConnectionManager *)self courierConnection];
  [v6 setKeepAliveV2Supported:v5 onInterface:a4];
}

- (unsigned)redirectCount
{
  id v2 = [(APSCourierConnectionManager *)self courierConnection];
  unsigned __int8 v3 = [v2 redirectCount];

  return v3;
}

- (BOOL)allowedToHaveMultipleOpenInterfaces
{
  return [(APSNetworkMonitor *)self->_networkMonitor shouldUseDualMode];
}

- (void)setServerSupportsDualMode:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(APSCourierConnectionManager *)self networkMonitor];
  [v4 setServerSupportsDualMode:v3];
}

- (void)stopManagerOnInterface:(int64_t)a3
{
  id v4 = [(APSCourierConnectionManager *)self courierConnection];
  [v4 stopManagerOnInterface:a3];
}

- (void)recalculateCriticalReliability
{
  id v4 = [(APSCourierConnectionManager *)self delegate];
  unsigned int v5 = [v4 courierConnectionManagerClientsWantsCriticalReliability];

  if (self->_enableCriticalReliability != v5)
  {
    self->_enableCriticalReliability = v5;
    id v6 = +[APSLog courier];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (v5) {
        uint64_t v7 = "enabled";
      }
      else {
        uint64_t v7 = "disabled";
      }
      id v8 = [(APSEnvironment *)self->_environment domain];
      *(_DWORD *)buf = 138412802;
      id v15 = self;
      __int16 v16 = 2080;
      id v17 = v7;
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: Critical reliability for is now %s for '%@'", buf, 0x20u);
    }
    [(APSNetworkMonitor *)self->_networkMonitor setCriticalReliability:self->_enableCriticalReliability];
    criticalReliabilityPowerAssertion = self->_criticalReliabilityPowerAssertion;
    if (v5)
    {
      if (criticalReliabilityPowerAssertion)
      {
        id v13 = +[NSAssertionHandler currentHandler];
        [v13 handleFailureInMethod:a2 object:self file:@"APSCourierConnectionManager.m" lineNumber:2832 description:@"power assertion already exists"];
      }
      criticalReliabilityTimer = +[NSString stringWithFormat:@"%@-criticalreliability", APSBundleIdentifier];
      BOOL v11 = [[APSPowerAssertion alloc] initWithName:criticalReliabilityTimer category:204 holdDuration:600.0];
      id v12 = self->_criticalReliabilityPowerAssertion;
      self->_criticalReliabilityPowerAssertion = v11;
    }
    else
    {
      self->_criticalReliabilityPowerAssertion = 0;

      [(PCPersistentTimer *)self->_criticalReliabilityTimer invalidate];
      criticalReliabilityTimer = self->_criticalReliabilityTimer;
      self->_criticalReliabilityTimer = 0;
    }
  }
}

- (void)triggerCriticalReliability
{
  BOOL v3 = +[APSLog courier];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    BOOL v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ _criticalReliabilityFlushTimerFired", (uint8_t *)&v10, 0xCu);
  }

  [(NSTimer *)self->_criticalFlushTimer invalidate];
  criticalFlushTimer = self->_criticalFlushTimer;
  self->_criticalFlushTimer = 0;

  [(APSCourierConnectionManager *)self sendFlushOnAllConnectionshWithPaddingLength:2];
  if (self->_enableCriticalReliability)
  {
    unsigned int v5 = +[NSDate date];
    id v6 = [v5 dateByAddingTimeInterval:9.0];

    uint64_t v7 = (NSTimer *)[objc_alloc((Class)NSTimer) initWithFireDate:v6 interval:self target:"triggerCriticalReliability" selector:0 userInfo:0 repeats:0.0];
    id v8 = self->_criticalFlushTimer;
    self->_criticalFlushTimer = v7;

    id v9 = +[NSRunLoop currentRunLoop];
    [v9 addTimer:self->_criticalFlushTimer forMode:NSDefaultRunLoopMode];
  }
}

- (void)refreshCriticalReliability
{
}

- (void)refreshCriticalReliabilityTimerWithShortKeepAlive:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = +[APSLog courier];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (v3) {
      CFStringRef v6 = @"YES";
    }
    int v17 = 138412546;
    __int16 v18 = self;
    __int16 v19 = 2112;
    CFStringRef v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ _refreshCriticalReliabilityTimerWithShortKeepAlive %@", (uint8_t *)&v17, 0x16u);
  }

  uint64_t v7 = [(APSCourierConnectionManager *)self courierConnection];
  if ([v7 preferredInterface] == (id)1)
  {
    uint64_t v8 = 1;
  }
  else
  {
    id v9 = [(APSCourierConnectionManager *)self delegate];
    uint64_t v8 = (uint64_t)[v9 courierConnectionManagerClientsHaveEagerMessages];
  }
  [(APSCourierConnectionManager *)self _requestKeepAlive:v8 orConnection:1 shortInterval:v3 onInterface:3];
  [(PCPersistentTimer *)self->_criticalReliabilityTimer invalidate];
  criticalReliabilityTimer = self->_criticalReliabilityTimer;
  self->_criticalReliabilityTimer = 0;

  if (self->_enableCriticalReliability)
  {
    id v11 = objc_alloc((Class)PCPersistentTimer);
    id v12 = [(APSCourierConnectionManager *)self courierConnection];
    [v12 minimumKeepAliveInterval];
    id v13 = (PCPersistentTimer *)objc_msgSend(v11, "initWithTimeInterval:serviceIdentifier:target:selector:userInfo:", @"criticalreliability", self, "_criticalReliabilityTimerFired", 0);
    id v14 = self->_criticalReliabilityTimer;
    self->_criticalReliabilityTimer = v13;

    [(PCPersistentTimer *)self->_criticalReliabilityTimer setDisableSystemWaking:1];
    [(PCPersistentTimer *)self->_criticalReliabilityTimer setMinimumEarlyFireProportion:1.0];
    id v15 = self->_criticalReliabilityTimer;
    __int16 v16 = +[NSRunLoop currentRunLoop];
    [(PCPersistentTimer *)v15 scheduleInRunLoop:v16];
  }
}

- (void)setKeepAliveConfiguration:(unint64_t)a3
{
  id v4 = [(APSCourierConnectionManager *)self courierConnection];
  [v4 setKeepAliveConfiguration:a3];
}

- (void)_criticalReliabilityTimerFired
{
  BOOL v3 = +[APSLog courier];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    unsigned int v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ _criticalReliabilityTimerFired", (uint8_t *)&v4, 0xCu);
  }

  [(APSCourierConnectionManager *)self refreshCriticalReliabilityTimerWithShortKeepAlive:0];
}

- (void)notePush
{
  BOOL v3 = [(APSCourierConnectionManager *)self pcInterfaceMonitorWWAN];
  int v4 = [v3 linkQuality];

  unsigned int v5 = [(APSCourierConnectionManager *)self pcInterfaceMonitorWWAN];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [(APSCourierConnectionManager *)self pcInterfaceMonitorWWAN];
    int v8 = [v7 currentRAT];

    if (v4 != -2 && v8 != -2 && v8 != -1)
    {
      self->_lastPushLQ = v4;
      if (self->_lastPushRAT != v8) {
        self->_lastPushRAT = v8;
      }
    }
  }
  unint64_t v9 = +[APSNetworkMonitor powerCostForPushOnRAT:self->_lastPushRAT withLinkQuality:self->_lastPushLQ];
  id v10 = [(APSCourierConnectionManager *)self networkMonitor];
  [v10 notePushWithCost:v9];
}

- (BOOL)isPiggybacking
{
  id v2 = [(APSCourierConnectionManager *)self networkMonitor];
  unsigned __int8 v3 = [v2 isPiggybacking];

  return v3;
}

- (BOOL)isKeepAliveProxyConfiguredOnAnyConnection
{
  id v2 = [(APSCourierConnectionManager *)self courierConnection];
  unsigned __int8 v3 = [v2 isKeepAliveProxyConfiguredOnAnyInterface];

  return v3;
}

- (void)sendMessageTransportAcknowledgeMessageOnInterface:(int64_t)a3
{
  id v4 = [(APSCourierConnectionManager *)self courierConnection];
  [v4 sendMessageTransportAcknowledgeMessageOnInterface:a3];
}

- (void)prepareForSleep
{
  unsigned __int8 v3 = [(APSCourierConnectionManager *)self courierConnection];
  [v3 stopManagers];

  if ([(APSCourierConnectionManager *)self _neededToSwitchToKeepAliveProxyInterface])
  {
    [(APSCourierConnectionManager *)self _switchToKeepAliveProxyInterface];
  }
}

- (void)prepareForDarkWake
{
  unsigned __int8 v3 = +[APSLog courier];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    int v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@: prepareForDarkWake", (uint8_t *)&v7, 0xCu);
  }

  id v4 = [(APSCourierConnectionManager *)self courierConnection];
  if ([v4 hasOpenConnection])
  {
    unsigned int v5 = [(APSCourierConnectionManager *)self courierConnection];
    unsigned __int8 v6 = [v5 isConnected];

    if ((v6 & 1) == 0) {
      [(APSNoOpPowerAssertion *)self->_waitForConnectionAttemptsPowerAssertion hold];
    }
  }
  else
  {
  }
  [(APSCourierConnectionManager *)self performKeepAlive];
}

- (void)prepareForFullWake
{
  unsigned __int8 v3 = +[APSLog courier];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@: prepareForFullWake", (uint8_t *)&v11, 0xCu);
  }

  id v4 = [(APSCourierConnectionManager *)self courierConnection];
  unsigned int v5 = [v4 isConnected];

  if (v5
    || ([(APSCourierConnectionManager *)self courierConnection],
        unsigned __int8 v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 hasOpenConnection],
        v6,
        (v7 & 1) != 0))
  {
    if (self->_interfacePreference) {
      [(APSCourierConnectionManager *)self _startResetInterfacePreferenceTimer];
    }
  }
  else
  {
    self->_interfacePreference = 0;
  }
  int v8 = [(APSCourierConnectionManager *)self courierConnection];
  if ([v8 hasOpenConnection])
  {
    unint64_t v9 = [(APSCourierConnectionManager *)self courierConnection];
    unsigned __int8 v10 = [v9 isConnected];

    if ((v10 & 1) == 0) {
      [(APSNoOpPowerAssertion *)self->_waitForConnectionAttemptsPowerAssertion hold];
    }
  }
  else
  {
  }
  [(APSCourierConnectionManager *)self performKeepAlive];
}

- (void)_startResetInterfacePreferenceTimer
{
  [(APSCourierConnectionManager *)self _clearResetInterfacePreferenceTimer];
  unsigned __int8 v3 = +[APSLog courier];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    int v7 = self;
    __int16 v8 = 1024;
    int v9 = 90;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@: Scheduling reset of interface preference in %d seconds", (uint8_t *)&v6, 0x12u);
  }

  id v4 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_resetInterfacePreferenceTimerFired:" selector:0 userInfo:0 repeats:90.0];
  resetInterfacePreferenceTimer = self->_resetInterfacePreferenceTimer;
  self->_resetInterfacePreferenceTimer = v4;

  [(NSTimer *)self->_resetInterfacePreferenceTimer setTolerance:9.0];
}

- (void)_clearResetInterfacePreferenceTimer
{
  resetInterfacePreferenceTimer = self->_resetInterfacePreferenceTimer;
  if (resetInterfacePreferenceTimer)
  {
    [(NSTimer *)resetInterfacePreferenceTimer invalidate];
    id v4 = self->_resetInterfacePreferenceTimer;
    self->_resetInterfacePreferenceTimer = 0;
  }
}

- (void)_resetInterfacePreferenceTimerFired:(id)a3
{
  id v4 = +[APSLog courier];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    int v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@: Timer fired to reset the interface", (uint8_t *)&v8, 0xCu);
  }

  [(APSCourierConnectionManager *)self _clearResetInterfacePreferenceTimer];
  if (self->_interfacePreference)
  {
    unsigned int v5 = +[APSLog courier];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      int v9 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: Switching to preferred interface", (uint8_t *)&v8, 0xCu);
    }

    [(APSCourierConnectionManager *)self _useInteractivePowerAssertionIfNeededWithReason:@"switching to preferred interface"];
    self->_interfacePreference = 0;
    int v6 = [(APSCourierConnectionManager *)self courierConnection];
    unsigned int v7 = [v6 isConnected];

    if (v7) {
      [(APSCourierConnectionManager *)self disconnectAllStreamsWithReason:103];
    }
    [(APSCourierConnectionManager *)self adjustConnectionsIfNeeded];
  }
}

- (void)_useInteractivePowerAssertionIfNeededWithReason:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(APSCourierConnectionManager *)self courierConnection];
  unsigned int v6 = [v5 isConnected];

  if (v6)
  {
    unsigned int v7 = [(APSCourierConnectionManager *)self delegate];
    unsigned int v8 = [v7 courierConnectionManagerClientsHaveInteractivePushDuringSleepEnabled];

    if (v8)
    {
      int v9 = +[APSLog courier];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412546;
        int v11 = self;
        __int16 v12 = 2112;
        id v13 = v4;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: Enabling interactive power assertions due to %@", (uint8_t *)&v10, 0x16u);
      }

      +[APSPowerAssertion_NoHold setUseInteractivePowerAssertion:1];
    }
  }
}

- (BOOL)_neededToSwitchToKeepAliveProxyInterface
{
  unsigned __int8 v3 = [(APSCourierConnectionManager *)self courierConnection];
  unsigned int v4 = [v3 isConnectedOnInterface:1];

  if (v4)
  {
    if (!+[APSTCPStream isKeepAliveProxyFeatureEnabled]) {
      return 0;
    }
    unsigned int v5 = [(APSCourierConnectionManager *)self courierConnection];
    unsigned __int8 v6 = [v5 isKeepAliveProxyConfiguredOnInterface:1];

    if ((v6 & 1) == 0) {
      return 0;
    }
  }
  else
  {
    unsigned int v7 = [(APSCourierConnectionManager *)self courierConnection];
    unsigned int v8 = [v7 isConnectedOnInterface:0];

    if (!v8) {
      return 0;
    }
    if (!+[APSTCPStream isKeepAliveProxyFeatureEnabled]) {
      return 0;
    }
    int v9 = [(APSCourierConnectionManager *)self courierConnection];
    unsigned int v10 = [v9 isKeepAliveProxyConfiguredOnInterface:0];

    if (!v10) {
      return 0;
    }
  }
  return +[APSTCPStream isKeepAliveProxySupportedOnSomeInterface];
}

- (void)_switchToKeepAliveProxyInterface
{
  unsigned __int8 v3 = +[APSLog courier];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    unsigned int v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@: Switching interfaces to enable keep alive proxy", (uint8_t *)&v4, 0xCu);
  }

  [(APSCourierConnectionManager *)self _clearResetInterfacePreferenceTimer];
  [(APSNoOpPowerAssertion *)self->_waitForConnectionAttemptsPowerAssertion hold];
  [(APSCourierConnectionManager *)self disconnectAllStreamsWithReason:104];
  self->_interfacePreference = 10;
  [(APSCourierConnectionManager *)self adjustConnectionsIfNeeded];
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  int v4 = [(APSCourierConnectionManager *)self environment];
  unsigned int v5 = [v4 name];
  unsigned __int8 v6 = +[NSString stringWithFormat:@"<%@: %p; %@>", v3, self, v5];

  return (NSString *)v6;
}

- (NSString)debugDescription
{
  uint64_t v3 = objc_opt_class();
  int v4 = [(APSEnvironment *)self->_environment domain];
  unsigned int v5 = [(APSCourierConnectionManager *)self courierConnection];
  id v6 = [v5 countConnectedInterfaces];
  unsigned int v7 = [(APSCourierConnectionManager *)self courierConnection];
  unsigned int v8 = [v7 connectionDebugInfo];
  int v9 = APSPrettyPrintCollection();
  unsigned int v10 = +[NSString stringWithFormat:@"<%@ %p, domain=%@, connectedInterfaces=%lu, connectionInfo=%@>", v3, self, v4, v6, v9];

  return (NSString *)v10;
}

- (id)aps_prettyDescription
{
  int v4 = [(APSCourierConnectionManager *)self courierConnection];
  id v25 = [v4 connectionDebugInfo];

  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  unint64_t v6 = 0;
  char v7 = 1;
  do
  {
    char v8 = v7;
    int v9 = [(APSCourierConnectionManager *)self connectionTimeForInterface:v6];
    v26[0] = @"keepAlive";
    [(APSCourierConnectionManager *)self currentKeepAliveIntervalOnInterface:v6];
    int v11 = +[NSString stringWithFormat:@"%.0f", v10];
    v27[0] = v11;
    v26[1] = @"connected";
    if (v9)
    {
      [v9 doubleValue];
      +[APSDatePrinter dateStringFromInterval:](APSDatePrinter, "dateStringFromInterval:");
      id v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
      CFStringRef v12 = v2;
    }
    else
    {
      CFStringRef v12 = @"N/A";
    }
    v27[1] = v12;
    v26[2] = @"connection";
    id v13 = sub_100040D80(v6);
    id v14 = [v25 objectForKeyedSubscript:v13];
    void v27[2] = v14;
    id v15 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3];
    __int16 v16 = sub_100040D80(v6);
    [v5 setObject:v15 forKeyedSubscript:v16];

    if (v9) {
    char v7 = 0;
    }
    unint64_t v6 = 1;
  }
  while ((v8 & 1) != 0);
  int v17 = [(APSEnvironment *)self->_environment domain];
  __int16 v18 = [(APSCourierConnectionManager *)self courierConnection];
  id v19 = [v18 countConnectedInterfaces];
  CFStringRef v20 = APSPrettyPrintCollection();
  id v21 = [(APSCourierConnectionManager *)self serverTimeTracker];
  id v22 = APSPrettyPrintObject();
  id v23 = +[NSString stringWithFormat:@"<domain=%@, connectedInterfaces=%lu, info=%@, serverTime=%@>", v17, v19, v20, v22];

  return v23;
}

- (id)JSONDebugState
{
  id v2 = self;
  v30[0] = @"connection status";
  uint64_t v3 = [(APSCourierConnectionManager *)self courierConnection];
  int v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isConnected]);
  v31[0] = v4;
  v30[1] = @"enabled";
  id v5 = +[NSNumber numberWithBool:v2->_enabled];
  v31[1] = v5;
  unint64_t v6 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
  id v27 = [v6 mutableCopy];

  unint64_t v7 = 0;
  char v8 = 1;
  id v25 = v2;
  do
  {
    char v9 = v8;
    uint64_t v10 = [(APSCourierConnectionManager *)v2 courierConnection];
    unsigned int v11 = [v10 isConnectedOnInterface:v7];

    if (v11)
    {
      v28[0] = @"serverHostName";
      CFStringRef v12 = [(APSCourierConnectionManager *)v2 courierConnection];
      id v26 = [v12 serverHostnameForInterface:v7];
      v29[0] = v26;
      v28[1] = @"serverPort";
      id v13 = [(APSCourierConnectionManager *)v2 courierConnection];
      id v14 = [v13 serverPortForInterface:v7];
      v29[1] = v14;
      void v28[2] = @"serverIP";
      id v15 = [(APSCourierConnectionManager *)v2 courierConnection];
      __int16 v16 = [v15 serverAddressForInterface:v7];
      v29[2] = v16;
      v28[3] = @"connectionTime";
      int v17 = [(APSCourierConnectionManager *)v2 connectionTimeForInterface:v7];
      v29[3] = v17;
      v28[4] = @"keepAliveInterval";
      [(APSCourierConnectionManager *)v2 currentKeepAliveIntervalOnInterface:v7];
      id v19 = +[NSString stringWithFormat:@"%.0f", v18];
      v29[4] = v19;
      CFStringRef v20 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:5];
      id v21 = sub_100040D80(v7);
      [v27 setObject:v20 forKeyedSubscript:v21];

      id v2 = v25;
    }
    else
    {
      CFStringRef v12 = sub_100040D80(v7);
      [v27 setObject:&__NSDictionary0__struct forKeyedSubscript:v12];
    }

    char v8 = 0;
    unint64_t v7 = 1;
  }
  while ((v9 & 1) != 0);
  id v22 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[APSTCPStream isKeepAliveProxyFeatureEnabled]);
  [v27 setObject:v22 forKeyedSubscript:@"keepAliveProxyingEnabled"];

  if (+[APSTCPStream isKeepAliveProxyFeatureEnabled])
  {
    id v23 = +[NSNumber numberWithBool:[(APSCourierConnectionManager *)v25 _requestKeepAliveProxy]];
    [v27 setObject:v23 forKeyedSubscript:@"didRequestKeepAliveProxying"];
  }
  return v27;
}

- (void)appendPrettyStatusToStatusPrinter:(id)a3
{
  id v25 = a3;
  int v4 = [(APSCourierConnectionManager *)self courierConnection];
  objc_msgSend(v25, "appendDescription:BOOLValue:", @"connection status", objc_msgSend(v4, "isConnected"));

  [v25 pushIndent];
  [v25 appendDescription:@"enabled" BOOLValue:self->_enabled];
  [v25 pushIndent];
  id v5 = [(APSCourierConnectionManager *)self courierConnection];
  objc_msgSend(v25, "appendDescription:BOOLValue:", @"noncellular connected", objc_msgSend(v5, "isConnectedOnInterface:", 1));

  unint64_t v6 = [(APSCourierConnectionManager *)self courierConnection];
  unsigned int v7 = [v6 isConnectedOnInterface:1];

  if (v7)
  {
    [v25 pushIndent];
    char v8 = [(APSCourierConnectionManager *)self courierConnection];
    char v9 = [v8 serverHostnameForInterface:1];
    [v25 appendDescription:@"server hostname" stringValue:v9];

    uint64_t v10 = [(APSCourierConnectionManager *)self courierConnection];
    unsigned int v11 = [v10 serverPortForInterface:1];
    objc_msgSend(v25, "appendDescription:unsignedIntegerValue:", @"server port", objc_msgSend(v11, "unsignedLongLongValue"));

    CFStringRef v12 = [(APSCourierConnectionManager *)self courierConnection];
    id v13 = [v12 serverAddressForInterface:1];
    [v25 appendDescription:@"server ip" stringValue:v13];

    id v14 = [(APSCourierConnectionManager *)self connectionTimeForInterface:1];
    [v14 doubleValue];
    objc_msgSend(v25, "appendDescription:timeIntervalValue:", @"connection time");

    [v25 popIndent];
  }
  id v15 = [(APSCourierConnectionManager *)self courierConnection];
  objc_msgSend(v25, "appendDescription:BOOLValue:", @"wwan connected", objc_msgSend(v15, "isConnectedOnInterface:", 0));

  __int16 v16 = [(APSCourierConnectionManager *)self courierConnection];
  unsigned int v17 = [v16 isConnectedOnInterface:0];

  if (v17)
  {
    [v25 pushIndent];
    uint64_t v18 = [(APSCourierConnectionManager *)self courierConnection];
    id v19 = [v18 serverHostnameForInterface:0];
    [v25 appendDescription:@"server hostname" stringValue:v19];

    CFStringRef v20 = [(APSCourierConnectionManager *)self courierConnection];
    id v21 = [v20 serverPortForInterface:0];
    objc_msgSend(v25, "appendDescription:unsignedIntegerValue:", @"server port", objc_msgSend(v21, "unsignedLongLongValue"));

    id v22 = [(APSCourierConnectionManager *)self courierConnection];
    id v23 = [v22 serverAddressForInterface:0];
    [v25 appendDescription:@"server ip" stringValue:v23];

    id v24 = [(APSCourierConnectionManager *)self connectionTimeForInterface:0];
    [v24 doubleValue];
    objc_msgSend(v25, "appendDescription:timeIntervalValue:", @"connection time");

    [v25 popIndent];
  }
  if (self->_consecutiveConnectionFailureCount)
  {
    objc_msgSend(v25, "appendDescription:unsignedIntegerValue:", @"consecutive connection failures");
    if (self->_lastConnectionAttempt) {
      objc_msgSend(v25, "appendDescription:dateValue:", @"last connection attempt");
    }
  }
  [v25 popIndent];
  objc_msgSend(v25, "appendDescription:enabledValue:", @"keep alive proxying", +[APSTCPStream isKeepAliveProxyFeatureEnabled](APSTCPStream, "isKeepAliveProxyFeatureEnabled"));
  if (+[APSTCPStream isKeepAliveProxyFeatureEnabled]) {
    objc_msgSend(v25, "appendDescription:BOOLValue:", @"request keep alive proxying", -[APSCourierConnectionManager _requestKeepAliveProxy](self, "_requestKeepAliveProxy"));
  }
  [v25 popIndent];
}

- (id)connectionTimeForInterface:(int64_t)a3
{
  if (a3 <= 1)
  {
    int v4 = self->_connectionTime[a3];
  }
  else
  {
    int v4 = 0;
  }
  return v4;
}

- (void)setConnectionTime:(id)a3 forInterface:(int64_t)a4
{
  id v7 = a3;
  if (a4 <= 1)
  {
    id v8 = v7;
    objc_storeStrong((id *)&self->_connectionTime[a4], a3);
    id v7 = v8;
  }
}

- (id)maxMessageSizeForInterface:(int64_t)a3
{
  if (a3 <= 1)
  {
    unint64_t v6 = self->_maxMessageSizes[a3];
    if (v6)
    {
      int v4 = v6;
    }
    else
    {
      int v4 = +[NSNumber numberWithUnsignedInteger:[(APSEnvironment *)self->_environment messageSize]];
    }
  }
  else
  {
    int v4 = 0;
  }
  return v4;
}

- (void)setMaxMessageSize:(id)a3 forInterface:(int64_t)a4
{
  id v7 = a3;
  if (a4 <= 1)
  {
    id v8 = v7;
    objc_storeStrong((id *)&self->_maxMessageSizes[a4], a3);
    id v7 = v8;
  }
}

- (id)maxLargeMessageSizeForInterface:(int64_t)a3
{
  if (a3 <= 1)
  {
    unint64_t v6 = self->_maxLargeMessageSizes[a3];
    if (v6)
    {
      int v4 = v6;
    }
    else
    {
      int v4 = +[NSNumber numberWithUnsignedInteger:[(APSEnvironment *)self->_environment largeMessageSize]];
    }
  }
  else
  {
    int v4 = 0;
  }
  return v4;
}

- (void)setMaxLargeMessageSize:(id)a3 forInterface:(int64_t)a4
{
  id v7 = a3;
  if (a4 <= 1)
  {
    id v8 = v7;
    objc_storeStrong((id *)&self->_maxLargeMessageSizes[a4], a3);
    id v7 = v8;
  }
}

- (int64_t)interfaceConstraintForInterface:(int64_t)a3
{
  if (a3 <= 1) {
    return -[APSCourierConnection interfaceConstraintForInterface:](self->_courierConnection, "interfaceConstraintForInterface:");
  }
  else {
    return 0;
  }
}

- (APSCourierConnectionManagerDelegate)delegate
{
  return self->_delegate;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (APSCourierConnection)courierConnection
{
  return self->_courierConnection;
}

- (void)setCourierConnection:(id)a3
{
}

- (PCCarrierBundleHelper)carrierBundleHelper
{
  return self->_carrierBundleHelper;
}

- (void)setCarrierBundleHelper:(id)a3
{
}

- (unint64_t)consecutiveConnectionFailureCount
{
  return self->_consecutiveConnectionFailureCount;
}

- (void)setConsecutiveConnectionFailureCount:(unint64_t)a3
{
  self->_unint64_t consecutiveConnectionFailureCount = a3;
}

- (unint64_t)consecutiveTLSConnectionFailureCount
{
  return self->_consecutiveTLSConnectionFailureCount;
}

- (void)setConsecutiveTLSConnectionFailureCount:(unint64_t)a3
{
  self->_consecutiveTLSConnectionFailureCount = a3;
}

- (PCPersistentTimer)delayedReconnectTimer
{
  return self->_delayedReconnectTimer;
}

- (void)setDelayedReconnectTimer:(id)a3
{
}

- (NSDate)lastConnectionAttempt
{
  return self->_lastConnectionAttempt;
}

- (void)setLastConnectionAttempt:(id)a3
{
}

- (APSNetworkMonitor)networkMonitor
{
  return self->_networkMonitor;
}

- (void)setNetworkMonitor:(id)a3
{
}

- (unint64_t)cmaType
{
  return self->_cmaType;
}

- (void)setCmaType:(unint64_t)a3
{
  self->_unint64_t cmaType = a3;
}

- (unint64_t)lastIPCachingPercentage
{
  return self->_lastIPCachingPercentage;
}

- (void)setLastIPCachingPercentage:(unint64_t)a3
{
  self->_lastIPCachingPercentage = a3;
}

- (APSEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (int)interfacePreference
{
  return self->_interfacePreference;
}

- (void)setInterfacePreference:(int)a3
{
  self->_interfacePreference = a3;
}

- (double)lastIPCachingTTLSeconds
{
  return self->_lastIPCachingTTLSeconds;
}

- (void)setLastIPCachingTTLSeconds:(double)a3
{
  self->_lastIPCachingTTLSeconds = a3;
}

- (NSTimer)resetInterfacePreferenceTimer
{
  return self->_resetInterfacePreferenceTimer;
}

- (void)setResetInterfacePreferenceTimer:(id)a3
{
}

- (BOOL)enableCriticalReliability
{
  return self->_enableCriticalReliability;
}

- (void)setEnableCriticalReliability:(BOOL)a3
{
  self->_enableCriticalReliability = a3;
}

- (PCPersistentTimer)pendingMessageReconnectTimer
{
  return self->_pendingMessageReconnectTimer;
}

- (void)setPendingMessageReconnectTimer:(id)a3
{
}

- (APSConnectionRetryStateManaging)connectionRetryManager
{
  return self->_connectionRetryManager;
}

- (void)setConnectionRetryManager:(id)a3
{
}

- (double)delayedReconnectTLSInterval
{
  return self->_delayedReconnectTLSInterval;
}

- (void)setDelayedReconnectTLSInterval:(double)a3
{
  self->_double delayedReconnectTLSInterval = a3;
}

- (int64_t)delayedReconnectTLSIntervalTrigger
{
  return self->_delayedReconnectTLSIntervalTrigger;
}

- (void)setDelayedReconnectTLSIntervalTrigger:(int64_t)a3
{
  self->_int64_t delayedReconnectTLSIntervalTrigger = a3;
}

- (PCPersistentTimer)delayedSuspendKeepAliveTimer
{
  return self->_delayedSuspendKeepAliveTimer;
}

- (void)setDelayedSuspendKeepAliveTimer:(id)a3
{
}

- (BOOL)pendingPostSuspensionWWANFlush
{
  return self->_pendingPostSuspensionWWANFlush;
}

- (void)setPendingPostSuspensionWWANFlush:(BOOL)a3
{
  self->_pendingPostSuspensionWWANFlush = a3;
}

- (BOOL)remainsConnectedWhenWWANSuspends
{
  return self->_remainsConnectedWhenWWANSuspends;
}

- (void)setRemainsConnectedWhenWWANSuspends:(BOOL)a3
{
  self->_remainsConnectedWhenWWANSuspends = a3;
}

- (double)startedDarkWake
{
  return self->_startedDarkWake;
}

- (void)setStartedDarkWake:(double)a3
{
  self->_startedDarkWake = a3;
}

- (unint64_t)findKeepAliveProxyInterfaceFailureCount
{
  return self->_findKeepAliveProxyInterfaceFailureCount;
}

- (void)setFindKeepAliveProxyInterfaceFailureCount:(unint64_t)a3
{
  self->_findKeepAliveProxyInterfaceFailureCount = a3;
}

- (unint64_t)forceKeepAliveProxyInterfaceFailureCount
{
  return self->_forceKeepAliveProxyInterfaceFailureCount;
}

- (void)setForceKeepAliveProxyInterfaceFailureCount:(unint64_t)a3
{
  self->_forceKeepAliveProxyInterfaceFailureCount = a3;
}

- (unint64_t)obtainKeepAliveProxyFailureCount
{
  return self->_obtainKeepAliveProxyFailureCount;
}

- (void)setObtainKeepAliveProxyFailureCount:(unint64_t)a3
{
  self->_obtainKeepAliveProxyFailureCount = a3;
}

- (APSConnectionHistory)connectionHistory
{
  return self->_connectionHistory;
}

- (void)setConnectionHistory:(id)a3
{
}

- (NSNumber)serverMaxKeepAliveInterval
{
  return self->_serverMaxKeepAliveInterval;
}

- (void)setServerMaxKeepAliveInterval:(id)a3
{
}

- (NSNumber)serverExpectedKeepAliveInterval
{
  return self->_serverExpectedKeepAliveInterval;
}

- (void)setServerExpectedKeepAliveInterval:(id)a3
{
}

- (NSNumber)serverMinKeepAliveInterval
{
  return self->_serverMinKeepAliveInterval;
}

- (void)setServerMinKeepAliveInterval:(id)a3
{
}

- (double)delayedSuspendKeepAliveInterval
{
  return self->_delayedSuspendKeepAliveInterval;
}

- (void)setDelayedSuspendKeepAliveInterval:(double)a3
{
  self->_double delayedSuspendKeepAliveInterval = a3;
}

- (APSRateLimiter)suspendToggleHourlyLimiter
{
  return self->_suspendToggleHourlyLimiter;
}

- (void)setSuspendToggleHourlyLimiter:(id)a3
{
}

- (APSRateLimiter)suspendToggleDailyLimiter
{
  return self->_suspendToggleDailyLimiter;
}

- (void)setSuspendToggleDailyLimiter:(id)a3
{
}

- (int64_t)suspendToggleHourlyLimit
{
  return self->_suspendToggleHourlyLimit;
}

- (void)setSuspendToggleHourlyLimit:(int64_t)a3
{
  self->_suspendToggleHourlyLimit = a3;
}

- (int64_t)suspendToggleDailyLimit
{
  return self->_suspendToggleDailyLimit;
}

- (void)setSuspendToggleDailyLimit:(int64_t)a3
{
  self->_suspendToggleDailyLimit = a3;
}

- (double)keepAliveV2TimeDriftMaximum
{
  return self->_keepAliveV2TimeDriftMaximum;
}

- (void)setKeepAliveV2TimeDriftMaximum:(double)a3
{
  self->_keepAliveV2TimeDriftMaximum = a3;
}

- (double)lastClientRequestedKeepaliveTime
{
  return self->_lastClientRequestedKeepaliveTime;
}

- (void)setLastClientRequestedKeepaliveTime:(double)a3
{
  self->_lastClientRequestedKeepaliveTime = a3;
}

- (APSPowerAssertion)delayedKeepAlivePowerAssertion
{
  return self->_delayedKeepAlivePowerAssertion;
}

- (void)setDelayedKeepAlivePowerAssertion:(id)a3
{
}

- (NSString)latestGeoRegion
{
  return self->_latestGeoRegion;
}

- (void)setLatestGeoRegion:(id)a3
{
}

- (double)filterMessageTimeout
{
  return self->_filterMessageTimeout;
}

- (void)setFilterMessageTimeout:(double)a3
{
  self->_double filterMessageTimeout = a3;
}

- (CoreTelephonyClient)ctClient
{
  return self->_ctClient;
}

- (void)setCtClient:(id)a3
{
}

- (APSSymptomReporter)symptomReporter
{
  return self->_symptomReporter;
}

- (void)setSymptomReporter:(id)a3
{
}

- (__SecIdentity)clientIdentity
{
  return self->_clientIdentity;
}

- (void)setClientIdentity:(__SecIdentity *)a3
{
  self->_clientIdentity = a3;
}

- (void)setShouldUseInternet:(BOOL)a3
{
  self->_shouldUseInternet = a3;
}

- (BOOL)shouldRun
{
  return self->_shouldRun;
}

- (void)setShouldRun:(BOOL)a3
{
  self->_shouldRun = a3;
}

- (BOOL)handlingFailure
{
  return self->_handlingFailure;
}

- (void)setHandlingFailure:(BOOL)a3
{
  self->_handlingFailure = a3;
}

- (NSTimer)criticalFlushTimer
{
  return self->_criticalFlushTimer;
}

- (void)setCriticalFlushTimer:(id)a3
{
}

- (PCPersistentTimer)criticalReliabilityTimer
{
  return self->_criticalReliabilityTimer;
}

- (void)setCriticalReliabilityTimer:(id)a3
{
}

- (APSPowerAssertion)criticalReliabilityPowerAssertion
{
  return self->_criticalReliabilityPowerAssertion;
}

- (void)setCriticalReliabilityPowerAssertion:(id)a3
{
}

- (APSNoOpPowerAssertion)waitForConnectionAttemptsPowerAssertion
{
  return self->_waitForConnectionAttemptsPowerAssertion;
}

- (void)setWaitForConnectionAttemptsPowerAssertion:(id)a3
{
}

- (APSReachabilityHandler)reachabilityHandler
{
  return self->_reachabilityHandler;
}

- (void)setReachabilityHandler:(id)a3
{
}

- (APSServerTimeTracker)serverTimeTracker
{
  return self->_serverTimeTracker;
}

- (void)setServerTimeTracker:(id)a3
{
}

- (APSOutgoingQueue)outgoingSendMessageQueue
{
  return self->_outgoingSendMessageQueue;
}

- (void)setOutgoingSendMessageQueue:(id)a3
{
}

- (APSOutgoingQueue)outgoingConnectMessageQueue
{
  return self->_outgoingConnectMessageQueue;
}

- (void)setOutgoingConnectMessageQueue:(id)a3
{
}

- (APSOutgoingQueue)tokenGenerateResponseQueue
{
  return self->_tokenGenerateResponseQueue;
}

- (void)setTokenGenerateResponseQueue:(id)a3
{
}

- (APSOutgoingQueue)outgoingFilterQueue
{
  return self->_outgoingFilterQueue;
}

- (void)setOutgoingFilterQueue:(id)a3
{
}

- (int)lastPushRAT
{
  return self->_lastPushRAT;
}

- (void)setLastPushRAT:(int)a3
{
  self->_lastPushRAT = a3;
}

- (int)lastPushLQ
{
  return self->_lastPushLQ;
}

- (void)setLastPushLQ:(int)a3
{
  self->_lastPushLQ = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outgoingFilterQueue, 0);
  objc_storeStrong((id *)&self->_tokenGenerateResponseQueue, 0);
  objc_storeStrong((id *)&self->_outgoingConnectMessageQueue, 0);
  objc_storeStrong((id *)&self->_outgoingSendMessageQueue, 0);
  objc_storeStrong((id *)&self->_serverTimeTracker, 0);
  objc_storeStrong((id *)&self->_reachabilityHandler, 0);
  objc_storeStrong((id *)&self->_waitForConnectionAttemptsPowerAssertion, 0);
  objc_storeStrong((id *)&self->_criticalReliabilityPowerAssertion, 0);
  objc_storeStrong((id *)&self->_criticalReliabilityTimer, 0);
  objc_storeStrong((id *)&self->_criticalFlushTimer, 0);
  objc_storeStrong((id *)&self->_symptomReporter, 0);
  objc_storeStrong((id *)&self->_ctClient, 0);
  objc_storeStrong((id *)&self->_latestGeoRegion, 0);
  objc_storeStrong((id *)&self->_delayedKeepAlivePowerAssertion, 0);
  objc_storeStrong((id *)&self->_suspendToggleDailyLimiter, 0);
  objc_storeStrong((id *)&self->_suspendToggleHourlyLimiter, 0);
  objc_storeStrong((id *)&self->_serverMinKeepAliveInterval, 0);
  objc_storeStrong((id *)&self->_serverExpectedKeepAliveInterval, 0);
  objc_storeStrong((id *)&self->_serverMaxKeepAliveInterval, 0);
  objc_storeStrong((id *)&self->_connectionHistory, 0);
  objc_storeStrong((id *)&self->_delayedSuspendKeepAliveTimer, 0);
  objc_storeStrong((id *)&self->_connectionRetryManager, 0);
  objc_storeStrong((id *)&self->_pendingMessageReconnectTimer, 0);
  objc_storeStrong((id *)&self->_resetInterfacePreferenceTimer, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_networkMonitor, 0);
  objc_storeStrong((id *)&self->_lastConnectionAttempt, 0);
  objc_storeStrong((id *)&self->_delayedReconnectTimer, 0);
  objc_storeStrong((id *)&self->_carrierBundleHelper, 0);
  objc_storeStrong((id *)&self->_courierConnection, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  for (uint64_t i = 0; i != -2; --i)
    objc_storeStrong((id *)&self->_filterMessageTimer[i + 1], 0);
  for (uint64_t j = 0; j != -2; --j)
    objc_storeStrong((id *)&self->_maxLargeMessageSizes[j + 1], 0);
  for (uint64_t k = 0; k != -2; --k)
    objc_storeStrong((id *)&self->_maxMessageSizes[k + 1], 0);
  for (uint64_t m = 0; m != -2; --m)
    objc_storeStrong((id *)&self->_protocolConnections[m + 1], 0);
  for (uint64_t n = 0; n != -2; --n)
    objc_storeStrong((id *)&self->_connectionTime[n + 1], 0);
  for (iuint64_t i = 0; ii != -2; --ii)
    objc_storeStrong((id *)&self->_consecutiveConnectionFailureReason[ii + 1], 0);
  for (juint64_t j = 48; jj != 32; jj -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + jj), 0);
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + jj), 0);
    jj -= 8;
  }
  while (jj != 16);
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + jj), 0);
    jj -= 8;
  }
  while (jj);
}

@end