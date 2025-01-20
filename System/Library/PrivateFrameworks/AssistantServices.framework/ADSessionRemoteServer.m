@interface ADSessionRemoteServer
+ (void)_getReportSymptomsBasedNetworkQualityMetrics:(id)a3;
- (BOOL)_authenticationDisabled;
- (BOOL)_connectionErrorIsRedirect:(id)a3;
- (BOOL)_connectionErrorIsTimeout:(id)a3;
- (BOOL)_connectionErrorSuggestsConnectionPolicyReset:(id)a3;
- (BOOL)_connectionIsWWAN;
- (BOOL)_persistValidationData:(id)a3 withExpiration:(id)a4;
- (BOOL)_populateInternalAuthProperties:(id)a3;
- (BOOL)_shouldGetLinkRecommendation;
- (BOOL)_shouldRetry;
- (BOOL)_versionForCachedValidationDataMatchesCurrentVersion;
- (BOOL)sessionIsAttemptingTryOrRetry;
- (BOOL)supportsSync;
- (id)_authDataToSign;
- (id)_authenticator;
- (id)_cachedServerCertificate;
- (id)_cachedValidationData;
- (id)_connectionInfoWithPreferWWAN:(BOOL)a3 skipPeer:(BOOL)a4 skipPeerError:(id)a5 useWiFiHint:(BOOL)a6 forceReconnect:(BOOL)a7;
- (id)_connectionURL;
- (id)_connectionURLHostname;
- (id)_generateAnalyticsContextWithError:(id)a3;
- (id)_networkManager;
- (id)_retryManager;
- (id)_serverConnection;
- (id)_siriNetworkManager;
- (id)_siriNetworkServerConnection;
- (id)connection;
- (id)currentConnectionPreCachedMetrics;
- (id)currentSNConnectionPreCachedMetrics;
- (id)initOnQueue:(id)a3 withAccount:(id)a4 languageCode:(id)a5 connectionMode:(id)a6 sharedUserIdentifier:(id)a7 loggingSharedUserIdentifier:(id)a8 instanceContext:(id)a9;
- (id)siriNetworkConnection;
- (void)_adjustAceHeaderTimeout:(BOOL)a3;
- (void)_assistantFailedForReason:(id)a3 error:(id)a4;
- (void)_authenticationFailed;
- (void)_cancelSynchronously:(BOOL)a3;
- (void)_companionServiceStateDidChange:(id)a3;
- (void)_connectionOpened;
- (void)_continueAuthWithCertificateData:(id)a3;
- (void)_continueAuthentication;
- (void)_continueSessionInitWithValidationData:(id)a3;
- (void)_createAssistant;
- (void)_eagerAuthDidComplete;
- (void)_forceFastDormancy;
- (void)_handleAceObject:(id)a3;
- (void)_homeContextDidChange:(id)a3;
- (void)_homeInfoDidChange:(id)a3;
- (void)_informDelegateOfError:(id)a3;
- (void)_multiUsersDidChange:(id)a3;
- (void)_probeSessionIfIdle;
- (void)_reallyRetryPreferringWWAN:(BOOL)a3 skipPeer:(BOOL)a4 skipPeerError:(id)a5 useWiFiHint:(BOOL)a6 causedByError:(id)a7 forceReconnect:(BOOL)a8 useSecondary:(BOOL)a9;
- (void)_recheckForWiFiTransition;
- (void)_releaseDormancySuspension;
- (void)_resetConnectionPolicyBlacklisting;
- (void)_resetServerConnection;
- (void)_resetServerConnectionSynchronously:(BOOL)a3 completion:(id)a4;
- (void)_retrieveAndSendHomeContext;
- (void)_retryForFailedConnection:(id)a3 withType:(id)a4 onError:(id)a5;
- (void)_retrySiriNetworkForFailedConnection:(id)a3 siriNetworkAnalysisInfo:(id)a4 onError:(id)a5;
- (void)_retryWithParameters:(BOOL)a3 skipPeer:(BOOL)a4 skipPeerError:(id)a5 causedByError:(id)a6 useSecondary:(BOOL)a7;
- (void)_saAssistantCreated:(id)a3;
- (void)_saAssistantDestroyed:(id)a3;
- (void)_saAssistantLoaded:(id)a3;
- (void)_saAssistantNotFound:(id)a3;
- (void)_saAssistantNotReady:(id)a3;
- (void)_saCommandFailed:(id)a3;
- (void)_saCreateSessionInfoResponse:(id)a3;
- (void)_saGetSessionCertificateResponse:(id)a3;
- (void)_saSessionValidationFailed:(id)a3;
- (void)_saSetConnectionHeader:(id)a3;
- (void)_sendCreateSessionInfoRequestWithData:(id)a3;
- (void)_sendGetSessionCertificateData;
- (void)_sendHomeContext:(id)a3;
- (void)_sendLoadAssistantWithAccount:(id)a3 validationData:(id)a4;
- (void)_sendMultiUserInfo;
- (void)_sendServerCommand:(id)a3;
- (void)_sendServerCommandLogErrorForCommand:(id)a3 withContext:(id)a4;
- (void)_sendServerCommands:(id)a3;
- (void)_sendSetRemoteDevicesWithAccount:(id)a3;
- (void)_sendSetRemoteDevicesWithAccount:(id)a3 multiUserInfo:(id)a4;
- (void)_setCachedServerCertificate:(id)a3;
- (void)_setCachedValidationData:(id)a3 withDuration:(double)a4;
- (void)_siriConnection:(id)a3 didEncounterError:(id)a4 analysisInfo:(id)a5;
- (void)_siriConnection:(id)a3 didEncounterIntermediateError:(id)a4;
- (void)_siriConnection:(id)a3 siriNetworkConnection:(id)a4 didEncounterError:(id)a5 siriCoreAnalysisInfo:(id)a6 siriNetworkAnalysisInfo:(id)a7;
- (void)_startConnection;
- (void)_startConnectionPreferringWWAN:(BOOL)a3 skipPeer:(BOOL)a4 skipPeerError:(id)a5 useWiFiHint:(BOOL)a6 forceReconnect:(BOOL)a7;
- (void)_startSession;
- (void)_startSiriCoreConnectionPreferringWWAN:(BOOL)a3 skipPeer:(BOOL)a4 skipPeerError:(id)a5 useWiFiHint:(BOOL)a6 forceReconnect:(BOOL)a7;
- (void)_startSiriNetworkConnectionPreferringWWAN:(BOOL)a3 skipPeer:(BOOL)a4 skipPeerError:(id)a5 useWiFiHint:(BOOL)a6 forceReconnect:(BOOL)a7;
- (void)_triggerABCForEmptyLocale;
- (void)_updateConnectionPolicyFailureCount:(id)a3;
- (void)assistantDataManagerDictationHIPAAMDMStatusDidChange;
- (void)barrier:(id)a3;
- (void)beginRetryableRequest:(id)a3;
- (void)dealloc;
- (void)delegateDidHandleCommand:(id)a3 didRecognizeSpeech:(BOOL)a4;
- (void)didCloseConnection:(id)a3;
- (void)didEncounterError:(id)a3 error:(id)a4 analysisInfo:(id)a5;
- (void)didEncounterIntermediateError:(id)a3 error:(id)a4;
- (void)didOpenConnectionType:(id)a3 type:(id)a4 routeId:(id)a5 delay:(double)a6 method:(id)a7;
- (void)didReceiveAceObject:(id)a3 object:(id)a4;
- (void)didReceiveObject:(id)a3 object:(id)a4;
- (void)doSendPreProcessing:(id)a3;
- (void)endRetryableRequestForCommandAceId:(id)a3 refId:(id)a4;
- (void)getConnectionMetrics:(id)a3;
- (void)getSNConnectionMetrics:(id)a3;
- (void)networkManagerLostNonWWANConnectivity:(id)a3;
- (void)networkManagerNetworkUnreachable:(id)a3;
- (void)networkManagerNonWWANDidBecomeAvailable:(id)a3;
- (void)refreshValidationData;
- (void)resetRetryManager;
- (void)retryNakedCommandsIfNeeded;
- (void)sendRemoteGizmoDeviceToServer:(id)a3;
- (void)setCoreSiriConnection:(id)a3;
- (void)setHasActiveRequest:(BOOL)a3;
- (void)siriConnection:(id)a3 didEncounterError:(id)a4 analysisInfo:(id)a5;
- (void)siriConnection:(id)a3 didEncounterIntermediateError:(id)a4;
- (void)siriConnection:(id)a3 didOpenWithConnectionType:(id)a4 routeId:(id)a5 delay:(double)a6 method:(id)a7;
- (void)siriConnection:(id)a3 didReceiveAceObject:(id)a4;
- (void)siriConnection:(id)a3 willStartWithConnectionType:(id)a4;
- (void)siriConnectionDidClose:(id)a3;
- (void)startRetry;
- (void)willStartConnection:(id)a3 type:(id)a4;
- (void)willStartConnection:(id)a3 with:(id)a4;
@end

@implementation ADSessionRemoteServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_metricsGroup, 0);
  objc_storeStrong((id *)&self->_pairedWatchUniqueId, 0);
  objc_storeStrong((id *)&self->_snMetricsCache, 0);
  objc_storeStrong((id *)&self->_metricsCache, 0);
  objc_storeStrong((id *)&self->_retryManager, 0);
  objc_storeStrong((id *)&self->_createSessionInfoRequestId, 0);
  objc_storeStrong((id *)&self->_sessionInitCommandId, 0);
  objc_storeStrong((id *)&self->_productTypePrefix, 0);
  objc_storeStrong((id *)&self->_peerVersion, 0);
  objc_storeStrong((id *)&self->_peerType, 0);
  objc_storeStrong((id *)&self->_skipPeerError, 0);
  objc_storeStrong((id *)&self->_cachedValidationData, 0);
  objc_storeStrong((id *)&self->_cachedValidationDataExpiration, 0);
  objc_storeStrong((id *)&self->_authenticator, 0);
  objc_storeStrong((id *)&self->_currentConnectionHostname, 0);
  objc_storeStrong((id *)&self->_currentConnectionURL, 0);
  objc_storeStrong((id *)&self->_siriNetworkServerConnection, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)currentSNConnectionPreCachedMetrics
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  snMetricsCache = self->_snMetricsCache;
  if (snMetricsCache)
  {
    v4 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 136315138;
      v8 = "-[ADSessionRemoteServer currentSNConnectionPreCachedMetrics]";
      _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s Using precached SNMetrics", (uint8_t *)&v7, 0xCu);
      snMetricsCache = self->_snMetricsCache;
    }
    id v5 = [(NSMutableArray *)snMetricsCache copy];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)currentConnectionPreCachedMetrics
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  metricsCache = self->_metricsCache;
  if (metricsCache)
  {
    v4 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 136315138;
      v8 = "-[ADSessionRemoteServer currentConnectionPreCachedMetrics]";
      _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s Using precached metrics", (uint8_t *)&v7, 0xCu);
      metricsCache = self->_metricsCache;
    }
    id v5 = [(NSMutableArray *)metricsCache copy];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void)getSNConnectionMetrics:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if (self->_siriNetworkEnablementExperimentActivated)
    {
      v16[0] = 0;
      v16[1] = v16;
      v16[2] = 0x3032000000;
      v16[3] = sub_1002B5CE4;
      v16[4] = sub_1002B5CF4;
      id v17 = 0;
      v14[0] = 0;
      v14[1] = v14;
      v14[2] = 0x3032000000;
      v14[3] = sub_1002B5CE4;
      v14[4] = sub_1002B5CF4;
      id v15 = objc_alloc_init((Class)NSMutableArray);
      if (self->_siriNetworkServerConnection)
      {
        dispatch_group_enter((dispatch_group_t)self->_metricsGroup);
        siriNetworkServerConnection = self->_siriNetworkServerConnection;
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_1002B5CFC;
        v13[3] = &unk_10050A428;
        v13[5] = v14;
        v13[6] = v16;
        v13[4] = self;
        [(SNConnection *)siriNetworkServerConnection getSNConnectionMetrics:0 completion:v13];
      }
      metricsGroup = self->_metricsGroup;
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1002B5E4C;
      block[3] = &unk_10050A400;
      v11 = v14;
      block[4] = self;
      v12 = v16;
      id v10 = v5;
      dispatch_group_notify(metricsGroup, queue, block);

      _Block_object_dispose(v14, 8);
      _Block_object_dispose(v16, 8);
    }
    else
    {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
  }
}

- (void)getConnectionMetrics:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if (self->_siriNetworkEnablementExperimentActivated)
    {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
    else
    {
      v16[0] = 0;
      v16[1] = v16;
      v16[2] = 0x3032000000;
      v16[3] = sub_1002B5CE4;
      v16[4] = sub_1002B5CF4;
      id v17 = 0;
      v14[0] = 0;
      v14[1] = v14;
      v14[2] = 0x3032000000;
      v14[3] = sub_1002B5CE4;
      v14[4] = sub_1002B5CF4;
      id v15 = objc_alloc_init((Class)NSMutableArray);
      if (self->_serverConnection)
      {
        dispatch_group_enter((dispatch_group_t)self->_metricsGroup);
        serverConnection = self->_serverConnection;
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_1002B6180;
        v13[3] = &unk_10050A3D8;
        v13[4] = self;
        v13[5] = v14;
        [(SiriCoreSiriConnection *)serverConnection getConnectionMetricsSynchronously:0 completion:v13];
      }
      metricsGroup = self->_metricsGroup;
      queue = self->_queue;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1002B6220;
      v9[3] = &unk_10050A400;
      v11 = v14;
      v9[4] = self;
      v12 = v16;
      id v10 = v5;
      dispatch_group_notify(metricsGroup, queue, v9);

      _Block_object_dispose(v14, 8);
      _Block_object_dispose(v16, 8);
    }
  }
}

- (void)assistantDataManagerDictationHIPAAMDMStatusDidChange
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002B638C;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)_generateAnalyticsContextWithError:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  unint64_t v6 = [(ADSession *)self state];
  if (v6 > 0xB) {
    int v7 = @"unknown";
  }
  else {
    int v7 = *(&off_100507798 + v6);
  }
  v8 = v7;
  [v5 setObject:v8 forKey:@"sessionState"];
  if (self->_siriNetworkEnablementExperimentActivated)
  {
    v9 = [(ADSession *)self _currentSNConnectionType];
    [v9 technologyDescription];
  }
  else
  {
    v9 = [(ADSession *)self _currentConnectionType];
    [v9 technology];
    SiriCoreConnectionTechnologyGetDescription();
  id v10 = };

  if (v10) {
    [v5 setObject:v10 forKey:@"connectionType"];
  }
  currentConnectionURL = self->_currentConnectionURL;
  if (currentConnectionURL)
  {
    v12 = [(NSURL *)currentConnectionURL absoluteString];
    [v5 setObject:v12 forKey:@"connectionURL"];
  }
  currentConnectionHostname = self->_currentConnectionHostname;
  if (currentConnectionHostname) {
    [v5 setObject:currentConnectionHostname forKey:@"connectionURL"];
  }
  v14 = [(ADSession *)self connectionMode];

  if (v14)
  {
    id v15 = [(ADSession *)self connectionMode];
    id v16 = [v15 copy];
    [v5 setObject:v16 forKey:@"connectionMode"];
  }
  id v17 = [(ADSession *)self languageCode];

  if (v17)
  {
    v18 = [(ADSession *)self languageCode];
    id v19 = [v18 copy];
    [v5 setObject:v19 forKey:@"languageCode"];
  }
  v20 = +[NSNumber numberWithBool:[(ADSession *)self dormant]];
  [v5 setObject:v20 forKey:@"dormant"];

  if (v4)
  {
    v21 = [v4 domain];
    v22 = v21;
    if (v21)
    {
      id v23 = [v21 copy];
      [v5 setObject:v23 forKey:@"errorDomain"];
    }
    v56 = v22;
    v24 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 code]);
    [v5 setObject:v24 forKey:@"errorCode"];

    v25 = [v4 userInfo];
    v26 = [v25 objectForKey:NSUnderlyingErrorKey];

    if (v26)
    {
      v27 = [v26 domain];
      v28 = v27;
      if (v27)
      {
        id v29 = [v27 copy];
        [v5 setObject:v29 forKey:@"underlyingErrorDomain"];
      }
      v30 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v26 code]);
      [v5 setObject:v30 forKey:@"underlyingErrorCode"];
    }
    v55 = v26;
    v31 = [v4 userInfo];
    uint64_t v32 = SiriCoreSiriConnectionHTTPErrorStatusCodeKey;
    v33 = [v31 objectForKey:SiriCoreSiriConnectionHTTPErrorStatusCodeKey];

    if (v33)
    {
      v53 = v10;
      v54 = v8;
      id v34 = objc_alloc_init((Class)NSMutableDictionary);
      BOOL siriNetworkEnablementExperimentActivated = self->_siriNetworkEnablementExperimentActivated;
      v36 = [v33 stringValue];
      if (siriNetworkEnablementExperimentActivated) {
        uint64_t v37 = SiriNetworkBackgroundConnectionHTTPErrorStatusCodeKey;
      }
      else {
        uint64_t v37 = v32;
      }
      [v34 setObject:v36 forKey:v37];

      v38 = [v4 userInfo];
      v39 = [v38 objectForKey:NSLocalizedDescriptionKey];

      if (v39)
      {
        id v40 = [v39 copy];
        [v34 setObject:v40 forKey:NSLocalizedDescriptionKey];
      }
      BOOL v41 = self->_siriNetworkEnablementExperimentActivated;
      v42 = [v4 userInfo];
      v43 = v42;
      uint64_t v44 = SiriCoreSiriConnectionHTTPRedirectValueKey;
      uint64_t v45 = SiriNetworkBackgroundConnectionHTTPRedirectValueKey;
      if (v41) {
        uint64_t v46 = SiriNetworkBackgroundConnectionHTTPRedirectValueKey;
      }
      else {
        uint64_t v46 = SiriCoreSiriConnectionHTTPRedirectValueKey;
      }
      v47 = [v42 objectForKey:v46];

      if (v47)
      {
        BOOL v48 = self->_siriNetworkEnablementExperimentActivated;
        id v49 = [v47 copy];
        if (v48) {
          uint64_t v50 = v45;
        }
        else {
          uint64_t v50 = v44;
        }
        [v34 setObject:v49 forKey:v50];
      }
      [v5 setObject:v34 forKey:@"userInfo"];

      id v10 = v53;
      v8 = v54;
    }
  }
  id v51 = [v5 copy];

  return v51;
}

- (void)_probeSessionIfIdle
{
  v3 = +[NSProcessInfo processInfo];
  [v3 systemUptime];
  double v5 = v4;

  if (v5 - self->_requestEndTime > 55.0)
  {
    unint64_t v6 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      v9 = "-[ADSessionRemoteServer _probeSessionIfIdle]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Probing the connection", (uint8_t *)&v8, 0xCu);
    }
    if (self->_siriNetworkEnablementExperimentActivated) {
      int v7 = &OBJC_IVAR___ADSessionRemoteServer__siriNetworkServerConnection;
    }
    else {
      int v7 = &OBJC_IVAR___ADSessionRemoteServer__serverConnection;
    }
    [*(id *)((char *)&self->super.super.isa + *v7) probeConnection];
  }
}

- (void)_createAssistant
{
  [(ADSession *)self setState:8];
  id v10 = [(ADSession *)self _account];
  v3 = [v10 assistantIdentifier];
  if (!v3)
  {
    [v10 clearAssistantData];
    [v10 updateAssistantIdentifiers];
  }
  [v10 setNeedsCreation:0];
  [v10 save];
  double v4 = [(ADSessionRemoteServer *)self _authenticator];
  if ([v4 state] == 3)
  {
    double v5 = [(ADSessionRemoteServer *)self _authDataToSign];
    unint64_t v6 = [v4 signedDataForData:v5];

    [v4 sessionInfoDuration];
    -[ADSessionRemoteServer _setCachedValidationData:withDuration:](self, "_setCachedValidationData:withDuration:", v6);
  }
  else
  {
    [(ADSessionRemoteServer *)self _setCachedValidationData:0 withDuration:0.0];
  }
  int v7 = +[AFPreferences sharedPreferences];
  [v7 setTLSSessionTicketsFlushPending:0];

  if (!v3)
  {
    int v8 = [(ADSession *)self delegate];
    [v8 assistantSessionDidCreateAssistant:self];

    v9 = dispatch_get_global_queue(9, 0);
    dispatch_async(v9, &stru_10050A388);
  }
}

- (void)_adjustAceHeaderTimeout:(BOOL)a3
{
  double v3 = -1.0;
  if (a3) {
    double v3 = 1.0;
  }
  double v4 = self->_aceHeaderTimeout + v3;
  self->_aceHeaderTimeout = v4;
  double v5 = 8.0;
  if (v4 > 8.0 || (double v5 = 5.0, v4 < 5.0)) {
    self->_aceHeaderTimeout = v5;
  }
}

- (void)_resetConnectionPolicyBlacklisting
{
  id v2 = [(ADSession *)self _account];
  [v2 setConnectionPolicyFailureCount:0];
  [v2 setConnectionPolicyFirstFailureDate:0];
}

- (void)_releaseDormancySuspension
{
  if (self->_siriNetworkEnablementExperimentActivated)
  {
    [(SNConnection *)self->_siriNetworkServerConnection setSendPings:0];
    double v3 = SNNetworkManager;
    p_dormancySuspendAssertion = &self->_dormancySuspendAssertion;
    double v5 = p_dormancySuspendAssertion;
  }
  else
  {
    [(SiriCoreSiriConnection *)self->_serverConnection setSendPings:0];
    double v3 = SiriCoreNetworkManager;
    p_dormancySuspendAssertion = &self->_dormancySuspendAssertion;
    double v5 = *p_dormancySuspendAssertion;
  }
  [v3 releaseDormancySuspendAssertion:v5];
  *p_dormancySuspendAssertion = 0;
}

- (void)_forceFastDormancy
{
  if (self->_siriNetworkEnablementExperimentActivated) {
    +[SNNetworkManager sharedInstance];
  }
  else {
  id v2 = [(ADSessionRemoteServer *)self _networkManager];
  }
  [v2 forceFastDormancy];
}

- (void)networkManagerNetworkUnreachable:(id)a3
{
  if (AFIsNano() && AFIsNano())
  {
    id v3 = +[ADSharedPeerStreamConnection sharedPeerStreamConnectionWithServiceIdentifier:@"com.apple.private.alloy.siri.proxy" listener:AFIsNano() ^ 1];
    [v3 preheat];
  }
}

- (void)_recheckForWiFiTransition
{
  id v3 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    v9 = "-[ADSessionRemoteServer _recheckForWiFiTransition]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v8, 0xCu);
  }
  if ((id)[(ADSession *)self state] == (id)11
    && [(ADSessionRemoteServer *)self _connectionIsWWAN])
  {
    double v4 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      v9 = "-[ADSessionRemoteServer _recheckForWiFiTransition]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Asking delegate if we should restart on wifi", (uint8_t *)&v8, 0xCu);
    }
    double v5 = [(ADSession *)self delegate];
    unsigned int v6 = [v5 assistantSessionShouldRestartConnectionOnWiFi:self];

    if (v6)
    {
      int v7 = AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
      {
        int v8 = 136315138;
        v9 = "-[ADSessionRemoteServer _recheckForWiFiTransition]";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Switching to WiFi on request end", (uint8_t *)&v8, 0xCu);
      }
      [(ADSessionRemoteServer *)self _resetServerConnection];
      [(ADSessionRemoteServer *)self _startConnection];
    }
  }
}

- (void)networkManagerLostNonWWANConnectivity:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002B6FD4;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)networkManagerNonWWANDidBecomeAvailable:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002B7120;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_multiUsersDidChange:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002B7320;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_companionServiceStateDidChange:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002B7450;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_homeContextDidChange:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002B75C0;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_homeInfoDidChange:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002B7734;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)barrier:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  double v5 = [ADSessionBarrier alloc];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002B7914;
  v7[3] = &unk_10050A368;
  v7[4] = self;
  objc_copyWeak(&v8, &location);
  id v6 = [(ADSessionBarrier *)v5 initWithThunk:v7 barrier:v4];
  [(ADSession *)self sendCommand:v6 opportunistically:1];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_retrieveAndSendHomeContext
{
  id v3 = +[ADHomeInfoManager sharedInfoManager];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1002B7AF4;
  v4[3] = &unk_10050A340;
  v4[4] = self;
  [v3 getHomeContext:v4];
}

- (void)_sendHomeContext:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  double v5 = AFSiriLogContextSession;
  BOOL v6 = os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      int v7 = v5;
      id v8 = [v4 entities];
      v9 = sub_1002B7D40(v8);
      id v10 = [v4 currentHomes];
      v11 = sub_1002B7D40(v10);
      int v12 = 136315650;
      v13 = "-[ADSessionRemoteServer _sendHomeContext:]";
      __int16 v14 = 2112;
      id v15 = v9;
      __int16 v16 = 2112;
      id v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s entities %@ \ncurrentHomes %@", (uint8_t *)&v12, 0x20u);
    }
    [(ADSessionRemoteServer *)self _sendServerCommand:v4];
  }
  else if (v6)
  {
    int v12 = 136315138;
    v13 = "-[ADSessionRemoteServer _sendHomeContext:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s No homeContext to send", (uint8_t *)&v12, 0xCu);
  }
}

- (void)_sendMultiUserInfo
{
  id v3 = +[ADMultiUserService sharedService];
  id v5 = [v3 multiUserSAObject];

  if (v5)
  {
    [(ADSessionRemoteServer *)self _sendServerCommand:v5];
    id v4 = [(ADSession *)self _account];
    [(ADSessionRemoteServer *)self _sendSetRemoteDevicesWithAccount:v4 multiUserInfo:v5];
  }
}

- (void)sendRemoteGizmoDeviceToServer:(id)a3
{
  p_pairedWatchUniqueId = (id *)&self->_pairedWatchUniqueId;
  id v7 = a3;
  if ((objc_msgSend(*p_pairedWatchUniqueId, "isEqualToString:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_pairedWatchUniqueId, a3);
    if (*p_pairedWatchUniqueId)
    {
      if ([(ADSession *)self state] >= 9)
      {
        BOOL v6 = [(ADSession *)self _account];
        [(ADSessionRemoteServer *)self _sendSetRemoteDevicesWithAccount:v6];
      }
    }
  }
}

- (void)_sendSetRemoteDevicesWithAccount:(id)a3
{
}

- (void)_sendSetRemoteDevicesWithAccount:(id)a3 multiUserInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v110 = "-[ADSessionRemoteServer _sendSetRemoteDevicesWithAccount:multiUserInfo:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v9 = objc_alloc_init((Class)SASetRemoteDevices);
  id v10 = objc_opt_new();
  p_cache = (void **)(&OBJC_METACLASS___ADDictationConnection + 16);
  v92 = v10;
  if (AFSupportsMultiUser())
  {
    int v12 = +[ADHomeInfoManager sharedInfoManager];
    v13 = [v12 infoForThisDevice];

    uint64_t v14 = [v6 peerAssistantIdentifier];
    id v15 = +[ADPreferences sharedPreferences];
    __int16 v16 = [v15 companionIdentifier];

    if (!v14 && v16)
    {
      id v17 = AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v110 = "-[ADSessionRemoteServer _sendSetRemoteDevicesWithAccount:multiUserInfo:]";
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s Getting assistantID from ADDeviceCircleManager", buf, 0xCu);
      }
      v18 = +[ADDeviceCircleManager sharedInstance];
      uint64_t v14 = [v18 assistantIdForDeviceWithIdsDeviceUniqueIdentifier:v16];
    }
    v88 = v16;
    v93 = (void *)v14;
    if (v14)
    {
      v79 = v13;
      id v81 = v9;
      v83 = self;
      v86 = v6;
      os_log_t log = (os_log_t)objc_alloc_init((Class)SARemoteDevice);
      [log setAssistantId:v14];
      long long v106 = 0u;
      long long v107 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      id v84 = v7;
      id v19 = [v7 homeMembers];
      id v20 = [v19 countByEnumeratingWithState:&v104 objects:v122 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v105;
        uint64_t v23 = SAHomeMemberInfoAttributeOWNERValue;
        do
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(void *)v105 != v22) {
              objc_enumerationMutation(v19);
            }
            v25 = *(void **)(*((void *)&v104 + 1) + 8 * i);
            long long v100 = 0u;
            long long v101 = 0u;
            long long v102 = 0u;
            long long v103 = 0u;
            v26 = objc_msgSend(v25, "attributes", v79);
            id v27 = [v26 countByEnumeratingWithState:&v100 objects:v121 count:16];
            if (v27)
            {
              id v28 = v27;
              uint64_t v29 = *(void *)v101;
              while (2)
              {
                for (j = 0; j != v28; j = (char *)j + 1)
                {
                  if (*(void *)v101 != v29) {
                    objc_enumerationMutation(v26);
                  }
                  if ([*(id *)(*((void *)&v100 + 1) + 8 * (void)j) isEqualToString:v23])
                  {
                    v31 = [v25 companionAssistantId];
                    unsigned __int8 v32 = [v31 isEqualToString:v93];

                    if ((v32 & 1) == 0)
                    {
                      v33 = (void *)AFSiriLogContextSession;
                      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
                      {
                        id v34 = v33;
                        v35 = [v25 companionAssistantId];
                        *(_DWORD *)buf = 136315650;
                        v110 = "-[ADSessionRemoteServer _sendSetRemoteDevicesWithAccount:multiUserInfo:]";
                        __int16 v111 = 2112;
                        v112 = v93;
                        __int16 v113 = 2112;
                        v114 = v35;
                        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "%s assistant id mismatch\tpeerAssistantID:%@\tprimary multiuser assistantID:%@", buf, 0x20u);
                      }
                      v36 = [v25 companionAssistantId];

                      if (v36)
                      {
                        uint64_t v37 = [v25 companionAssistantId];
                        [log setAssistantId:v37];
                      }
                    }
                    goto LABEL_29;
                  }
                }
                id v28 = [v26 countByEnumeratingWithState:&v100 objects:v121 count:16];
                if (v28) {
                  continue;
                }
                break;
              }
            }
LABEL_29:
          }
          id v21 = [v19 countByEnumeratingWithState:&v104 objects:v122 count:16];
        }
        while (v21);
      }

      id v6 = v86;
      v38 = [v86 peerUserAgentString];
      [log setUserAgent:v38];

      v39 = [v86 peerLanguageCode];
      [log setLanguage:v39];

      -[NSObject setSiriEnabled:](log, "setSiriEnabled:", [v86 peerSiriEnabled]);
      v13 = v79;
      id v40 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v79 personalDomainsIsEnabled]);
      [log setPersonalDomainsEnabled:v40];

      unsigned int v41 = [v79 securePersonalDomainsRequireAuth];
      v42 = &SARemoteDevicePersonalDomainsAuthenticationModeSecureRequestsValue;
      if (!v41) {
        v42 = &SARemoteDevicePersonalDomainsAuthenticationModeNeverValue;
      }
      -[NSObject setPersonalDomainsAuthenticationMode:](log, "setPersonalDomainsAuthenticationMode:", *v42, v79);
      v98[0] = _NSConcreteStackBlock;
      v98[1] = 3221225472;
      v98[2] = sub_1002B8C58;
      v98[3] = &unk_10050DB08;
      v43 = log;
      v99 = v43;
      id v44 = +[AFPeerInfo newWithBuilder:v98];
      p_cache = &OBJC_METACLASS___ADDictationConnection.cache;
      uint64_t v45 = +[ADCompanionService sharedInstance];
      uint64_t v46 = [[ADPeerInfo alloc] initWithAFPeerInfo:v44];
      v47 = [v45 discoveryTypeForPeer:v46];

      if (v47) {
        [v43 setDiscoveryMode:v47];
      }
      id v10 = v92;
      [v92 addObject:v43];
      BOOL v48 = (void *)AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
      {
        loga = v48;
        v89 = [v43 assistantId];
        id v49 = [v43 userAgent];
        uint64_t v50 = [v43 language];
        unsigned int v51 = [v43 siriEnabled];
        v52 = [v43 discoveryMode];
        *(_DWORD *)buf = 136316418;
        v110 = "-[ADSessionRemoteServer _sendSetRemoteDevicesWithAccount:multiUserInfo:]";
        __int16 v111 = 2112;
        v112 = v89;
        __int16 v113 = 2112;
        v114 = v49;
        __int16 v115 = 2112;
        v116 = v50;
        __int16 v117 = 1024;
        unsigned int v118 = v51;
        __int16 v119 = 2112;
        v120 = v52;
        _os_log_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_INFO, "%s assistantd id: %@ user agent: %@ language: %@ siri enabled: %d discovery type: %@", buf, 0x3Au);

        id v10 = v92;
        v13 = v80;
      }

      self = v83;
      id v7 = v84;
      id v9 = v81;
      __int16 v16 = v88;
    }
    else
    {
      id v10 = v92;
      if (([v13 personalDomainsIsEnabled] & 1) == 0)
      {
        id v68 = objc_alloc_init((Class)SARemoteDevice);
        [v68 setAssistantId:&stru_10050F7D8];
        [v68 setUserAgent:&stru_10050F7D8];
        [v68 setLanguage:&stru_10050F7D8];
        [v68 setPersonalDomainsEnabled:&__kCFBooleanFalse];
        unsigned int v69 = [v13 securePersonalDomainsRequireAuth];
        v70 = &SARemoteDevicePersonalDomainsAuthenticationModeSecureRequestsValue;
        if (!v69) {
          v70 = &SARemoteDevicePersonalDomainsAuthenticationModeNeverValue;
        }
        [v68 setPersonalDomainsAuthenticationMode:*v70];
        [v92 addObject:v68];
        v71 = AFSiriLogContextSession;
        if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v110 = "-[ADSessionRemoteServer _sendSetRemoteDevicesWithAccount:multiUserInfo:]";
          _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_INFO, "%s personal requests are disabled, but the companion's assistantId is unknown", buf, 0xCu);
        }

        __int16 v16 = v88;
      }
      v72 = AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v110 = "-[ADSessionRemoteServer _sendSetRemoteDevicesWithAccount:multiUserInfo:]";
        __int16 v111 = 2112;
        v112 = v16;
        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_INFO, "%s companion identifier: %@", buf, 0x16u);
      }
      if (v16)
      {
        v73 = [v6 peerUserAgentString];
        id v74 = [v73 length];

        if (v74)
        {
          [v9 setRemoteDeviceHasNoAssistantId:1];
          v75 = (void *)AFSiriLogContextSession;
          __int16 v16 = v88;
          if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
          {
            v76 = v75;
            unsigned int v77 = [v6 peerSiriEnabled];
            *(_DWORD *)buf = 136315394;
            v110 = "-[ADSessionRemoteServer _sendSetRemoteDevicesWithAccount:multiUserInfo:]";
            __int16 v111 = 1024;
            LODWORD(v112) = v77;
            _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_INFO, "%s companion has siri enabled: %d", buf, 0x12u);
          }
        }
        else
        {
          [v9 setRemoteDeviceUnreachable:1];
          v78 = AFSiriLogContextSession;
          __int16 v16 = v88;
          if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v110 = "-[ADSessionRemoteServer _sendSetRemoteDevicesWithAccount:multiUserInfo:]";
            _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_INFO, "%s companion is unreachable", buf, 0xCu);
          }
        }
      }
    }
  }
  if (!AFSupportsPairedDevice() || (AFIsNano() & 1) != 0) {
    goto LABEL_82;
  }
  if (self->_pairedWatchUniqueId)
  {
    v53 = objc_msgSend(v6, "saRemoteDevice:");
    if (v53)
    {
      if (AFPairedDeviceIsVictory()) {
        [v53 setBrandName:SARemoteDeviceBrandNameNikeValue];
      }
      [v10 addObject:v53];
    }
  }
  if ([v10 count])
  {
LABEL_82:
    if (AFSupportsMultiUser())
    {
      v54 = +[ADMultiUserService sharedService];
      v55 = [v54 sharedRemoteDevices];

      if (v55 && [v55 count])
      {
        id v82 = v9;
        id v85 = v7;
        id v87 = v6;
        long long v96 = 0u;
        long long v97 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        id v56 = v55;
        id v57 = [v56 countByEnumeratingWithState:&v94 objects:v108 count:16];
        if (v57)
        {
          id v58 = v57;
          uint64_t v59 = *(void *)v95;
          do
          {
            for (k = 0; k != v58; k = (char *)k + 1)
            {
              if (*(void *)v95 != v59) {
                objc_enumerationMutation(v56);
              }
              v61 = *(void **)(*((void *)&v94 + 1) + 8 * (void)k);
              v62 = (void *)AFSiriLogContextSession;
              if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
              {
                v63 = v62;
                v64 = [v61 assistantId];
                *(_DWORD *)buf = 136315394;
                v110 = "-[ADSessionRemoteServer _sendSetRemoteDevicesWithAccount:multiUserInfo:]";
                __int16 v111 = 2112;
                v112 = v64;
                _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_INFO, "%s Adding shared device for (%@)", buf, 0x16u);

                id v10 = v92;
              }
              [v10 addObject:v61];
            }
            id v58 = [v56 countByEnumeratingWithState:&v94 objects:v108 count:16];
          }
          while (v58);
        }

        id v7 = v85;
        id v6 = v87;
        id v9 = v82;
        p_cache = &OBJC_METACLASS___ADDictationConnection.cache;
      }
    }
    v65 = [p_cache + 178 sharedInstance];
    unsigned int v66 = [v65 isReady];

    [v9 setRemoteDeviceNotSetup:v66 ^ 1];
    v67 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v110 = "-[ADSessionRemoteServer _sendSetRemoteDevicesWithAccount:multiUserInfo:]";
      __int16 v111 = 1024;
      LODWORD(v112) = v66;
      _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_INFO, "%s set up is complete: %d", buf, 0x12u);
    }
    [v9 setRemoteDevices:v10];
    [(ADSessionRemoteServer *)self _sendServerCommand:v9];
  }
}

- (BOOL)_populateInternalAuthProperties:(id)a3
{
  id v3 = a3;
  id v4 = AFSiriLogContextInternalAuth;
  if (os_log_type_enabled(AFSiriLogContextInternalAuth, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 136315138;
    __int16 v16 = "-[ADSessionRemoteServer _populateInternalAuthProperties:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s Looking for AppleConnect service ticket in the Keychain", (uint8_t *)&v15, 0xCu);
  }
  id v5 = +[ADPreferences sharedPreferences];
  id v6 = [v5 internalAuthAppleConnectServiceTicket];

  id v7 = AFSiriLogContextInternalAuth;
  BOOL v8 = os_log_type_enabled(AFSiriLogContextInternalAuth, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
    {
      int v15 = 136315138;
      __int16 v16 = "-[ADSessionRemoteServer _populateInternalAuthProperties:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s Found service ticket in the Keychain - adding it to SALoadAssistant command, and deleting the Keychain entry", (uint8_t *)&v15, 0xCu);
    }
    [v3 setAppleConnectServiceTicket:v6];
    id v9 = +[ADPreferences sharedPreferences];
    [v9 setInternalAuthAppleConnectServiceTicket:0];
LABEL_13:
    BOOL v13 = 1;
    goto LABEL_14;
  }
  if (v8)
  {
    int v15 = 136315138;
    __int16 v16 = "-[ADSessionRemoteServer _populateInternalAuthProperties:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s No AppleConnect service ticket found in the Keychain. Looking for a session token instead.", (uint8_t *)&v15, 0xCu);
  }
  id v10 = +[ADPreferences sharedPreferences];
  id v9 = [v10 internalAuthSessionToken];

  v11 = AFSiriLogContextInternalAuth;
  BOOL v12 = os_log_type_enabled(AFSiriLogContextInternalAuth, OS_LOG_TYPE_DEBUG);
  if (v9)
  {
    if (v12)
    {
      int v15 = 136315138;
      __int16 v16 = "-[ADSessionRemoteServer _populateInternalAuthProperties:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s Found session token in the Keychain", (uint8_t *)&v15, 0xCu);
    }
    [v3 setAppleConnectSessionToken:v9];
    goto LABEL_13;
  }
  if (v12)
  {
    int v15 = 136315138;
    __int16 v16 = "-[ADSessionRemoteServer _populateInternalAuthProperties:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s No session token found in the Keychain", (uint8_t *)&v15, 0xCu);
  }
  id v9 = 0;
  BOOL v13 = 0;
LABEL_14:

  return v13;
}

- (void)_sendLoadAssistantWithAccount:(id)a3 validationData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(ADSession *)self languageCode];
  uint64_t v9 = [(ADSession *)self connectionMode];
  id v10 = [v6 assistantIdentifier];
  uint64_t v11 = [v6 loggingAssistantIdentifier];
  BOOL v12 = [v6 speechIdentifier];
  v61 = [(ADSession *)self sharedUserIdentifier];
  v60 = [(ADSession *)self loggingSharedUserIdentifier];
  uint64_t v13 = _AFPreferencesSiriDataSharingOptInStatus();
  uint64_t v59 = sub_100111310(v13);
  uint64_t v14 = +[ADAnalyticsIdentifiersProvider sharedInstance];
  id v58 = [v14 ephemeralIdForDefaultUser];

  int v15 = +[AFPreferences sharedPreferences];
  unsigned int v16 = [v15 longLivedIdentifierUploadingEnabled];

  if (![v8 length])
  {
    [(ADSessionRemoteServer *)self _triggerABCForEmptyLocale];
    id v17 = AFDefaultLanguageCode;

    BOOL v8 = v17;
  }
  v18 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315907;
    v67 = "-[ADSessionRemoteServer _sendLoadAssistantWithAccount:validationData:]";
    __int16 v68 = 2113;
    unsigned int v69 = v10;
    __int16 v70 = 2113;
    v71 = v12;
    __int16 v72 = 2112;
    v73 = v8;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s assistantId: %{private}@ speechId: %{private}@ with language %@", buf, 0x2Au);
  }
  id v19 = +[SiriCoreNetworkActivityTracing sharedNetworkActivityTracing];
  [v19 networkActivityStart:2 activate:1];

  id v20 = +[SNNetworkActivityTracing sharedInstance];
  [v20 networkActivityStart:2 activate:1 completion:0];

  id v21 = objc_alloc_init((Class)SALoadAssistant);
  [v21 setSessionValidationData:v7];

  [v21 setAssistantId:v10];
  id v57 = (void *)v11;
  [v21 setLoggableAssistantId:v11];
  [v21 setSpeechId:v12];
  [v21 setSharedUserId:v61];
  [v21 setLoggableSharedUserId:v60];
  [v21 setLanguage:v8];
  [v21 setConnectionMode:v9];
  uint64_t v22 = (void *)v9;
  if (self->_siriNetworkEnablementExperimentActivated) {
    [(ADSession *)self _saSNConnectionType];
  }
  else {
  uint64_t v23 = [(ADSession *)self _saConnectionType];
  }
  [v21 setConnectionType:v23];

  [v21 setDataSharingOptInStatus:v59];
  [v21 setGmDevice:AFDeviceSupportsGM()];
  v24 = +[ADPreferences sharedPreferences];
  v25 = [v24 singleUserCompanionACEHost];
  [v21 setLastKnownAceHostOfCompanion:v25];

  if (!_AFPreferencesSyncFromWatchEnabled() || AFIsHorseman())
  {
    v26 = [v6 peerAssistantIdentifier];
    [v21 setLinkedAssistantId:v26];

    id v27 = [v6 peerSpeechIdentifier];
    [v21 setLinkedSpeechId:v27];
  }
  uint64_t v28 = v16 ^ 1;
  uint64_t v29 = [(ADSessionRemoteServer *)self _authenticator];
  v30 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v29 authenticationStrategyVersion]);
  [v21 setDeviceAuthVersion:v30];

  if ([(ADSessionRemoteServer *)self _performingInternalAuth])
  {
    unsigned int v31 = [(ADSessionRemoteServer *)self _populateInternalAuthProperties:v21];
    unsigned __int8 v32 = AFSiriLogContextInternalAuth;
    BOOL v33 = os_log_type_enabled(AFSiriLogContextInternalAuth, OS_LOG_TYPE_DEBUG);
    if (v31)
    {
      if (!v33) {
        goto LABEL_16;
      }
      *(_DWORD *)buf = 136315138;
      v67 = "-[ADSessionRemoteServer _sendLoadAssistantWithAccount:validationData:]";
      id v34 = "%s Successfully populated internal auth related properties of SALoadAssistant command";
    }
    else
    {
      if (!v33) {
        goto LABEL_16;
      }
      *(_DWORD *)buf = 136315138;
      v67 = "-[ADSessionRemoteServer _sendLoadAssistantWithAccount:validationData:]";
      id v34 = "%s Could not populate internal auth related properties of SALoadAssistant command. If the server requires th"
            "ese properties, it will respond with an SASessionValidationFailed.";
    }
    _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, v34, buf, 0xCu);
  }
LABEL_16:
  os_unfair_lock_lock((os_unfair_lock_t)&unk_100585740);
  id v35 = (id)qword_100585738;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_100585740);
  [v21 setExperiments:v35];

  if (v58)
  {
    v36 = [v58 UUIDString];
    [v21 setEphemeralUserId:v36];
  }
  uint64_t v37 = +[NSNumber numberWithBool:v28];
  [v21 setRpiEnabled:v37];

  [(ADSessionRemoteServer *)self _sendServerCommand:v21];
  v38 = (void *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    v39 = v38;
    id v40 = [v21 dictionary];
    *(_DWORD *)buf = 136315394;
    v67 = "-[ADSessionRemoteServer _sendLoadAssistantWithAccount:validationData:]";
    __int16 v68 = 2112;
    unsigned int v69 = v40;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  unsigned int v41 = [v21 aceId];
  v42 = (NSString *)[v41 copy];
  sessionInitCommandId = self->_sessionInitCommandId;
  self->_sessionInitCommandId = v42;

  [(ADSession *)self setState:9];
  id v44 = [(ADSession *)self _adSessionTypeString];
  if ((AFIsInternalInstall() & 1) != 0
    || (+[AFPreferences sharedPreferences],
        uint64_t v45 = objc_claimAutoreleasedReturnValue(),
        unsigned int v46 = [v45 shouldLogForQA],
        v45,
        v46))
  {
    CFStringRef v47 = @"remote";
    if (v44) {
      CFStringRef v47 = v44;
    }
    v64[0] = @"sessionType";
    v64[1] = @"assistantId";
    CFStringRef v48 = &stru_10050F7D8;
    if (v10) {
      CFStringRef v49 = v10;
    }
    else {
      CFStringRef v49 = &stru_10050F7D8;
    }
    v65[0] = v47;
    v65[1] = v49;
    v64[2] = @"speechId";
    if (v12) {
      CFStringRef v48 = v12;
    }
    v65[2] = v48;
    uint64_t v50 = (const __CFString **)v65;
    unsigned int v51 = (const __CFString **)v64;
    uint64_t v52 = 3;
  }
  else
  {
    if (v44) {
      CFStringRef v53 = v44;
    }
    else {
      CFStringRef v53 = @"remote";
    }
    CFStringRef v62 = @"sessionType";
    CFStringRef v63 = v53;
    uint64_t v50 = &v63;
    unsigned int v51 = &v62;
    uint64_t v52 = 1;
  }
  v54 = +[NSDictionary dictionaryWithObjects:v50 forKeys:v51 count:v52];
  v55 = +[AFAnalytics sharedAnalytics];
  [v55 logEventWithType:920 context:v54];

  id v56 = dispatch_get_global_queue(9, 0);
  dispatch_async(v56, &stru_10050A318);
}

- (void)_triggerABCForEmptyLocale
{
  id v3 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v13 = "-[ADSessionRemoteServer _triggerABCForEmptyLocale]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Reporting missing LoadAssistant locale to ABC", buf, 0xCu);
  }
  uint64_t v4 = [(ADSession *)self _requestId];
  id v5 = (void *)v4;
  if (v4)
  {
    CFStringRef v10 = @"refID";
    uint64_t v11 = v4;
    id v6 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  }
  else
  {
    id v6 = &__NSDictionary0__struct;
  }
  id v7 = +[SiriCoreSymptomsReporter sharedInstance];
  BOOL v8 = +[NSProcessInfo processInfo];
  id v9 = [v8 processIdentifier];
  [v7 reportIssueForType:@"LoadAssistant" subType:@"null_locale" context:v6 processIdentifier:v9 walkboutStatus:byte_100585E38];
}

- (void)_sendCreateSessionInfoRequestWithData:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315138;
    int v15 = "-[ADSessionRemoteServer _sendCreateSessionInfoRequestWithData:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v14, 0xCu);
  }
  id v6 = objc_alloc_init((Class)SACreateSessionInfoRequest);
  [v6 setSessionInfoRequest:v4];
  id v7 = +[NSNumber numberWithUnsignedInteger:[(ADAuthenticator *)self->_authenticator authenticationStrategyVersion]];
  [v6 setDeviceAuthVersion:v7];

  [(ADSessionRemoteServer *)self _sendServerCommand:v6];
  if ((id)[(ADSession *)self state] != (id)11)
  {
    BOOL v8 = [v6 aceId];
    id v9 = (NSString *)[v8 copy];
    sessionInitCommandId = self->_sessionInitCommandId;
    self->_sessionInitCommandId = v9;
  }
  uint64_t v11 = [v6 aceId];
  BOOL v12 = (NSString *)[v11 copy];
  createSessionInfoRequestId = self->_createSessionInfoRequestId;
  self->_createSessionInfoRequestId = v12;
}

- (void)_sendGetSessionCertificateData
{
  id v3 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    CFStringRef v10 = "-[ADSessionRemoteServer _sendGetSessionCertificateData]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v9, 0xCu);
  }
  id v4 = objc_alloc_init((Class)SAGetSessionCertificate);
  id v5 = +[NSNumber numberWithUnsignedInteger:[(ADAuthenticator *)self->_authenticator authenticationStrategyVersion]];
  [v4 setDeviceAuthVersion:v5];

  [(ADSessionRemoteServer *)self _sendServerCommand:v4];
  if ((id)[(ADSession *)self state] != (id)11)
  {
    id v6 = [v4 aceId];
    id v7 = (NSString *)[v6 copy];
    sessionInitCommandId = self->_sessionInitCommandId;
    self->_sessionInitCommandId = v7;
  }
}

- (void)_sendServerCommands:(id)a3
{
  id v31 = a3;
  unsigned __int8 v32 = self;
  objc_initWeak(&location, self);
  if (self->_siriNetworkEnablementExperimentActivated)
  {
    id v4 = objc_opt_new();
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v5 = v31;
    id v6 = [v5 countByEnumeratingWithState:&v41 objects:v51 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v42;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v42 != v7) {
            objc_enumerationMutation(v5);
          }
          int v9 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          objc_msgSend(v9, "siriCore_invokeThunk", v31);
          CFStringRef v10 = [v9 aceId];
          BOOL v11 = v10 == 0;

          if (v11)
          {
            BOOL v12 = SiriCoreUUIDStringCreate();
            [v9 setAceId:v12];
          }
          NSClassFromString(@"SiriCoreSpeechPacket");
          char isKindOfClass = objc_opt_isKindOfClass();
          int v14 = objc_opt_new();
          int v15 = v9;
          if (isKindOfClass)
          {
            unsigned int v16 = objc_msgSend(v9, "aceId", v9);
            [v14 setAceId:v16];

            id v17 = [v9 refId];
            [v14 setRefId:v17];

            v18 = [v9 packets];
            [v14 setPackets:v18];

            objc_msgSend(v14, "setPacketNumber:", objc_msgSend(v9, "packetNumber"));
            int v15 = v14;
          }
          [v4 addObject:v15];
          id v19 = AFSiriLogContextSession;
          if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            CFStringRef v48 = "-[ADSessionRemoteServer _sendServerCommands:]";
            __int16 v49 = 2112;
            uint64_t v50 = v9;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
          }
        }
        id v6 = [v5 countByEnumeratingWithState:&v41 objects:v51 count:16];
      }
      while (v6);
    }

    id v20 = [(ADSessionRemoteServer *)v32 _siriNetworkServerConnection];
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1002BA090;
    v39[3] = &unk_10050A2D0;
    v39[4] = v32;
    objc_copyWeak(&v40, &location);
    [v20 sendCommands:v4 completion:v39];

    objc_destroyWeak(&v40);
  }
  else
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v21 = v31;
    id v22 = [v21 countByEnumeratingWithState:&v35 objects:v46 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v36;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(void *)v36 != v23) {
            objc_enumerationMutation(v21);
          }
          v25 = *(void **)(*((void *)&v35 + 1) + 8 * (void)j);
          objc_msgSend(v25, "siriCore_invokeThunk", v31);
          v26 = [v25 aceId];
          BOOL v27 = v26 == 0;

          if (v27)
          {
            uint64_t v28 = SiriCoreUUIDStringCreate();
            [v25 setAceId:v28];
          }
          uint64_t v29 = AFSiriLogContextSession;
          if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            CFStringRef v48 = "-[ADSessionRemoteServer _sendServerCommands:]";
            __int16 v49 = 2112;
            uint64_t v50 = v25;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
          }
        }
        id v22 = [v21 countByEnumeratingWithState:&v35 objects:v46 count:16];
      }
      while (v22);
    }

    v30 = [(ADSessionRemoteServer *)v32 _serverConnection];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1002BA27C;
    v33[3] = &unk_10050A2F8;
    v33[4] = v32;
    objc_copyWeak(&v34, &location);
    [v30 sendCommands:v21 errorHandler:v33];

    objc_destroyWeak(&v34);
  }
  objc_destroyWeak(&location);
}

- (void)_sendServerCommand:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "siriCore_invokeThunk");
  id v5 = [v4 aceId];

  if (!v5)
  {
    id v6 = SiriCoreUUIDStringCreate();
    [v4 setAceId:v6];
  }
  uint64_t v7 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v24 = "-[ADSessionRemoteServer _sendServerCommand:]";
    __int16 v25 = 2112;
    id v26 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  if (self->_siriNetworkEnablementExperimentActivated)
  {
    NSClassFromString(@"SiriCoreSpeechPacket");
    if (objc_opt_isKindOfClass())
    {
      BOOL v8 = objc_opt_new();
      int v9 = [v4 aceId];
      [v8 setAceId:v9];

      CFStringRef v10 = [v4 refId];
      [v8 setRefId:v10];

      BOOL v11 = [v4 packets];
      [v8 setPackets:v11];

      objc_msgSend(v8, "setPacketNumber:", objc_msgSend(v4, "packetNumber"));
      BOOL v12 = v8;
    }
    else
    {
      BOOL v12 = 0;
      BOOL v8 = v4;
    }
    int v14 = [(ADSessionRemoteServer *)self _siriNetworkServerConnection];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1002BA89C;
    v19[3] = &unk_10050A2A8;
    id v20 = v4;
    id v21 = self;
    objc_copyWeak(&v22, (id *)buf);
    [v14 sendCommand:v8 completion:v19];

    objc_destroyWeak(&v22);
  }
  else
  {
    uint64_t v13 = [(ADSessionRemoteServer *)self _serverConnection];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1002BAA7C;
    v15[3] = &unk_10050A2A8;
    id v16 = v4;
    id v17 = self;
    objc_copyWeak(&v18, (id *)buf);
    [v13 sendCommand:v16 errorHandler:v15];

    objc_destroyWeak(&v18);
    BOOL v12 = v16;
  }

  objc_msgSend(v4, "siriCore_logDiagnostics");
  objc_destroyWeak((id *)buf);
}

- (void)_sendServerCommandLogErrorForCommand:(id)a3 withContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = +[AFAnalytics sharedAnalytics];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1002BAE14;
  v10[3] = &unk_10050A230;
  id v11 = v6;
  id v12 = v5;
  id v8 = v5;
  id v9 = v6;
  [v7 logEventWithType:1201 contextProvider:v10];
}

- (void)doSendPreProcessing:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [(ADSessionRemoteServer *)self _retryManager];
    [v4 clearNakedObjects];
  }
  id v5 = [(ADSessionRemoteServer *)self _retryManager];
  [v5 appendSessionObjectToRequest:v6];
}

- (void)_saCommandFailed:(id)a3
{
  id v4 = a3;
  id v5 = [v4 refId];
  int64_t v6 = [(ADSession *)self state];
  id v7 = [v4 errorCode];
  id v8 = (id)SAConnectionTerminatedErrorCode;
  if (v7 == (id)SAConnectionTerminatedErrorCode)
  {
    id v9 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315394;
      int v15 = "-[ADSessionRemoteServer _saCommandFailed:]";
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v14, 0x16u);
    }
    [(ADSessionRemoteServer *)self _resetServerConnection];
  }
  if ([(NSString *)self->_sessionInitCommandId isEqualToString:v5])
  {
    if ((unint64_t)(v6 - 8) <= 2)
    {
      CFStringRef v10 = [v4 reason];
      id v11 = objc_msgSend(v4, "ad_error");
      [(ADSessionRemoteServer *)self _assistantFailedForReason:v10 error:v11];
    }
  }
  else if ([(ADSession *)self _refIdIsLimboId:v5])
  {
    id v12 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315394;
      int v15 = "-[ADSessionRemoteServer _saCommandFailed:]";
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Ignoring command failed for limbo id %@", (uint8_t *)&v14, 0x16u);
    }
    [(ADSession *)self _removeLimboId:v5];
  }
  else
  {
    [(ADSession *)self _passObjectToDelegate:v4];
  }
  if (v7 == v8)
  {
    uint64_t v13 = objc_msgSend(v4, "ad_error");
    [(ADSessionRemoteServer *)self _informDelegateOfError:v13];
  }
}

- (void)_assistantFailedForReason:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_loadRetryStartTime == 0.0)
  {
    id v8 = +[NSProcessInfo processInfo];
    [v8 systemUptime];
    self->_loadRetryStartTime = v9;
  }
  CFStringRef v10 = +[NSProcessInfo processInfo];
  [v10 systemUptime];
  double v12 = v11 - self->_loadRetryStartTime;

  uint64_t v13 = AFSiriLogContextSession;
  if (v12 >= 20.0)
  {
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v23 = "-[ADSessionRemoteServer _assistantFailedForReason:error:]";
      __int16 v24 = 2114;
      id v25 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Assistant failure (%{public}@). Limit reached, returning error", buf, 0x16u);
    }
    __int16 v16 = +[AFError errorWithCode:3 description:v6 underlyingError:v7];
    id v17 = [(ADSessionRemoteServer *)self _generateAnalyticsContextWithError:v16];
    id v18 = +[AFAnalytics sharedAnalytics];
    [v18 logEventWithType:909 context:v17 contextNoCopy:1];

    [(ADSession *)self _clearLimbo];
    [(ADSession *)self setState:4];
    [(ADSessionRemoteServer *)self _informDelegateOfError:v16];
    id v19 = +[SiriCoreNetworkActivityTracing sharedNetworkActivityTracing];
    [v19 networkActivityStop:2 withReason:4 andError:v16];

    id v20 = +[SNNetworkActivityTracing sharedInstance];
    [v20 networkActivityStop:2 withReason:4 andError:v16 completion:0];
  }
  else
  {
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v23 = "-[ADSessionRemoteServer _assistantFailedForReason:error:]";
      __int16 v24 = 2112;
      id v25 = v6;
      __int16 v26 = 2048;
      double v27 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Failed loading/creating assistant %@ elapsed time %lf", buf, 0x20u);
    }
    [(ADSessionRemoteServer *)self _resetServerConnection];
    [(ADSession *)self setState:2];
    dispatch_time_t v14 = dispatch_time(0, 0);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002BB510;
    block[3] = &unk_10050E138;
    block[4] = self;
    dispatch_after(v14, queue, block);
  }
}

- (void)_saSetConnectionHeader:(id)a3
{
  id v4 = a3;
  id v5 = [(ADSession *)self _account];
  id v6 = [v5 aceHost];
  id v7 = [v4 aceHostHeader];
  if (([(__CFString *)v6 isEqualToString:v7] & 1) == 0)
  {
    id v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      double v27 = "-[ADSessionRemoteServer _saSetConnectionHeader:]";
      __int16 v28 = 2112;
      uint64_t v29 = v6;
      __int16 v30 = 2112;
      id v31 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s local ACEHost:%@ setConnectionHeader ACEHost:%@", buf, 0x20u);
    }
    double v9 = +[AFAnalytics sharedAnalytics];
    CFStringRef v10 = &stru_10050F7D8;
    v22[0] = @"Local";
    v22[1] = @"SAConnectionHeader";
    if (v6) {
      CFStringRef v11 = v6;
    }
    else {
      CFStringRef v11 = &stru_10050F7D8;
    }
    if (v7) {
      CFStringRef v10 = v7;
    }
    v23[0] = v11;
    v23[1] = v10;
    CFStringRef v24 = @"ACEHost";
    double v12 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
    id v25 = v12;
    uint64_t v13 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    [v9 logEventWithType:926 context:v13];
  }
  [v5 setAceHost:v7];
  dispatch_time_t v14 = [v4 connectionPolicy];
  int v15 = v14;
  if (v14)
  {
    __int16 v16 = [v14 dictionary];
    [v5 setConnectionPolicy:v16];

    id v17 = +[NSDate date];
    [v5 setConnectionPolicyDate:v17];

    id v18 = [v5 hostname];
    [v5 setConnectionPolicyHostname:v18];
  }
  else
  {
    [v5 setConnectionPolicy:0];
    [v5 setConnectionPolicyDate:0];
    [v5 setConnectionPolicyHostname:0];
  }
  [v5 save];
  if ([v4 reconnectNow])
  {
    BOOL useWiFiHint = self->_useWiFiHint;
    id v20 = +[AFError errorWithCode:16];
    LOBYTE(v21) = 0;
    [(ADSessionRemoteServer *)self _reallyRetryPreferringWWAN:0 skipPeer:0 skipPeerError:0 useWiFiHint:useWiFiHint causedByError:v20 forceReconnect:1 useSecondary:v21];
  }
}

- (void)_saAssistantNotReady:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    id v20 = "-[ADSessionRemoteServer _saAssistantNotReady:]";
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s Assistant not ready.", buf, 0xCu);
  }
  id v6 = +[AFError errorWithCode:6 description:@"Assistant not ready" underlyingError:0];
  id v7 = [(ADSessionRemoteServer *)self _generateAnalyticsContextWithError:v6];
  [(ADSession *)self _clearLimbo];
  [(ADSessionRemoteServer *)self _resetServerConnection];
  id v8 = +[AFAnalytics sharedAnalytics];
  uint64_t v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  int v15 = sub_1002BBAC8;
  __int16 v16 = &unk_10050A230;
  id v17 = v7;
  id v18 = v4;
  id v9 = v4;
  id v10 = v7;
  [v8 logEventWithType:910 contextProvider:&v13];

  -[ADSessionRemoteServer _informDelegateOfError:](self, "_informDelegateOfError:", v6, v13, v14, v15, v16);
  CFStringRef v11 = +[SiriCoreNetworkActivityTracing sharedNetworkActivityTracing];
  [v11 networkActivityStop:2 withReason:4 andError:v6];

  double v12 = +[SNNetworkActivityTracing sharedInstance];
  [v12 networkActivityStop:2 withReason:4 andError:v6 completion:0];
}

- (void)_saAssistantNotFound:(id)a3
{
  id v4 = [(ADSession *)self _account];
  if ([v4 needsDestruction])
  {
    id v5 = +[ADDaemon sharedDaemon];
    [v5 unscheduleDestroyJob];
  }
  id v6 = (void *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
  {
    id v7 = v6;
    id v8 = [v4 assistantIdentifier];
    int v9 = 136315394;
    id v10 = "-[ADSessionRemoteServer _saAssistantNotFound:]";
    __int16 v11 = 2112;
    double v12 = v8;
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s Couldn't find the requested assistant %@; creating a new one",
      (uint8_t *)&v9,
      0x16u);
  }
  [v4 clearAssistantData];
  [v4 save];
  [(ADSessionRemoteServer *)self _resetServerConnection];
  [(ADSessionRemoteServer *)self _startConnection];
}

- (void)_saAssistantDestroyed:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315138;
    double v12 = "-[ADSessionRemoteServer _saAssistantDestroyed:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Assistant Destroyed", (uint8_t *)&v11, 0xCu);
  }
  id v6 = [(ADSession *)self _account];
  [v6 clearAssistantData];
  [v6 save];
  id v7 = objc_alloc_init(ADAnalyticsFBFDeliveryInfrastructure);
  [(ADAnalyticsFBFDeliveryInfrastructure *)v7 deliverLogViewerIdentifier:0];
  id v8 = [(ADSession *)self delegate];
  [v8 assistantSessionDidDestroyAssistant:self];

  int v9 = +[ADDaemon sharedDaemon];
  [v9 unscheduleDestroyJob];

  [(ADSessionRemoteServer *)self _resetServerConnection];
  if (self->_hasActiveRequest)
  {
    id v10 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      double v12 = "-[ADSessionRemoteServer _saAssistantDestroyed:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Restarting connection because destroy came in during active request", (uint8_t *)&v11, 0xCu);
    }
    [(ADSessionRemoteServer *)self _startConnection];
  }
}

- (void)_saAssistantLoaded:(id)a3
{
  id v4 = a3;
  id v5 = [v4 version];
  id v6 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    BOOL v33 = "-[ADSessionRemoteServer _saAssistantLoaded:]";
    __int16 v34 = 2112;
    long long v35 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Assistant Loaded Version: %@", buf, 0x16u);
  }
  if ([(ADSessionRemoteServer *)self _performingInternalAuth])
  {
    id v7 = AFSiriLogContextInternalAuth;
    if (os_log_type_enabled(AFSiriLogContextInternalAuth, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      BOOL v33 = "-[ADSessionRemoteServer _saAssistantLoaded:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s Looking for AppleConnect session token in SAAssistantLoaded command", buf, 0xCu);
    }
    id v8 = [v4 appleConnectSessionToken];
    if (v8)
    {
      int v9 = AFSiriLogContextInternalAuth;
      if (os_log_type_enabled(AFSiriLogContextInternalAuth, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        BOOL v33 = "-[ADSessionRemoteServer _saAssistantLoaded:]";
        _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s Found AppleConnect session token in SAAssistantLoaded command - storing token in the Keychain", buf, 0xCu);
      }
      id v10 = +[ADPreferences sharedPreferences];
      [v10 setInternalAuthSessionToken:v8];
    }
  }
  sessionInitCommandId = self->_sessionInitCommandId;
  double v12 = [v4 refId];
  LOBYTE(sessionInitCommandId) = [(NSString *)sessionInitCommandId isEqualToString:v12];

  if ((sessionInitCommandId & 1) == 0)
  {
    uint64_t v13 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      BOOL v33 = "-[ADSessionRemoteServer _saAssistantLoaded:]";
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Assistant Loaded refId does not match our saved assistant command", buf, 0xCu);
    }
  }
  if ((id)[(ADSession *)self state] == (id)10)
  {
    uint64_t v14 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      BOOL v33 = "-[ADSessionRemoteServer _saAssistantLoaded:]";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Waiting on a pending destruction, doing nothing", buf, 0xCu);
    }
  }
  else
  {
    if (self->_isAttemptingRetry) {
      self->_isAttemptingRetry = 0;
    }
    [(ADSession *)self setState:11];
    int v15 = self->_sessionInitCommandId;
    self->_sessionInitCommandId = 0;

    [(ADSession *)self _setAssistantDataAnchorIfNeeded:v4];
    [(ADSessionRemoteServer *)self _retrieveAndSendHomeContext];
    __int16 v16 = [(ADSession *)self _adSessionTypeString];
    id v17 = [(ADSession *)self _account];
    id v18 = [v17 aceHost];

    CFStringRef v19 = @"remote";
    if (v16) {
      CFStringRef v19 = v16;
    }
    CFStringRef v26 = @"sessionType";
    CFStringRef v27 = @"version";
    CFStringRef v20 = &stru_10050F7D8;
    if (v5) {
      CFStringRef v21 = v5;
    }
    else {
      CFStringRef v21 = &stru_10050F7D8;
    }
    CFStringRef v29 = v19;
    CFStringRef v30 = v21;
    CFStringRef v28 = @"localACEHost";
    if (v18) {
      CFStringRef v20 = v18;
    }
    CFStringRef v31 = v20;
    id v22 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v26 count:3];
    uint64_t v23 = +[AFAnalytics sharedAnalytics];
    [v23 logEventWithType:924 context:v22];

    CFStringRef v24 = +[SiriCoreNetworkActivityTracing sharedNetworkActivityTracing];
    [v24 networkActivityStop:2 withReason:2 andError:0];

    id v25 = +[SNNetworkActivityTracing sharedInstance];
    [v25 networkActivityStop:2 withReason:2 andError:0 completion:0];
  }
}

- (void)_saAssistantCreated:(id)a3
{
  id v3 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[ADSessionRemoteServer _saAssistantCreated:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Assistant created response ignored", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_saCreateSessionInfoResponse:(id)a3
{
  id v4 = a3;
  id v5 = [v4 refId];
  unsigned __int8 v6 = [v5 isEqualToString:self->_createSessionInfoRequestId];

  if ((v6 & 1) == 0)
  {
    double v12 = AFSiriLogContextSession;
    if (!os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO)) {
      goto LABEL_16;
    }
    int v17 = 136315138;
    id v18 = "-[ADSessionRemoteServer _saCreateSessionInfoResponse:]";
    uint64_t v13 = "%s Old session info response ignored";
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v17, 0xCu);
    goto LABEL_16;
  }
  id v7 = [v4 sessionInfo];

  if (!v7)
  {
    double v12 = AFSiriLogContextSession;
    if (!os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO)) {
      goto LABEL_16;
    }
    int v17 = 136315138;
    id v18 = "-[ADSessionRemoteServer _saCreateSessionInfoResponse:]";
    uint64_t v13 = "%s No valid sessionInfo returned";
    goto LABEL_9;
  }
  id v8 = [v4 sessionInfo];
  int v9 = [v4 validityDuration];
  double v10 = (double)(int)[v9 intValue];

  int v11 = [(ADSessionRemoteServer *)self _authenticator];
  [v11 setSessionInfo:v8 duration:v10];
  if ((id)[(ADSession *)self state] == (id)6)
  {
    [(ADSessionRemoteServer *)self _continueAuthentication];
  }
  else
  {
    uint64_t v14 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v17 = 136315138;
      id v18 = "-[ADSessionRemoteServer _saCreateSessionInfoResponse:]";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Saving new validity info since we're not currently authenticating", (uint8_t *)&v17, 0xCu);
    }
    int v15 = [(ADSessionRemoteServer *)self _authDataToSign];
    __int16 v16 = [v11 signedDataForData:v15];

    if (v16) {
      [(ADSessionRemoteServer *)self _setCachedValidationData:v16 withDuration:v10];
    }
  }
LABEL_16:
}

- (void)_saGetSessionCertificateResponse:(id)a3
{
  id v4 = a3;
  id v5 = [v4 certificate];
  if ([v5 length])
  {
    [(ADSessionRemoteServer *)self _setCachedServerCertificate:v5];
    unsigned __int8 v6 = [(ADSessionRemoteServer *)self _authenticator];
    [v6 reset];

    [(ADSessionRemoteServer *)self _continueAuthentication];
  }
  else
  {
    id v7 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      int v9 = "-[ADSessionRemoteServer _saGetSessionCertificateResponse:]";
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s No certificate data in response trying anyway %@", (uint8_t *)&v8, 0x16u);
    }
    [(ADSessionRemoteServer *)self _continueSessionInitWithValidationData:0];
  }
}

- (void)_saSessionValidationFailed:(id)a3
{
  id v4 = a3;
  sessionInitCommandId = self->_sessionInitCommandId;
  unsigned __int8 v6 = [v4 refId];
  unsigned __int8 v7 = [(NSString *)sessionInitCommandId isEqualToString:v6];

  int v8 = AFSiriLogContextSession;
  BOOL v9 = os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (v9)
    {
      CFStringRef v24 = v8;
      id v25 = [v4 errorCode];
      *(_DWORD *)buf = 136315394;
      long long v35 = "-[ADSessionRemoteServer _saSessionValidationFailed:]";
      __int16 v36 = 2114;
      long long v37 = v25;
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s SASessionValidationFailed %{public}@", buf, 0x16u);
    }
    [(ADSessionRemoteServer *)self _resetServerConnection];
    if (self->_usingCachedValidationData)
    {
      if (objc_msgSend(v4, "ad_shouldRetry"))
      {
LABEL_6:
        self->_forceValidationRefresh = 1;
        [(ADSessionRemoteServer *)self _startConnection];
        goto LABEL_16;
      }
    }
    else
    {
      __int16 v10 = [(ADSessionRemoteServer *)self _authenticator];
      if ([v10 state])
      {
      }
      else
      {
        unsigned __int8 v11 = objc_msgSend(v4, "ad_shouldRetry");

        if (v11) {
          goto LABEL_6;
        }
      }
    }
    id v12 = objc_msgSend(v4, "ad_afErrorCode");
    uint64_t v13 = +[AFError errorWithCode:v12];
    uint64_t v14 = [(ADSessionRemoteServer *)self _generateAnalyticsContextWithError:v13];
    int v15 = +[AFAnalytics sharedAnalytics];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1002BCADC;
    v30[3] = &unk_10050A230;
    id v16 = v14;
    id v31 = v16;
    id v32 = v4;
    [v15 logEventWithType:907 contextProvider:v30];

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1002BCB90;
    v28[3] = &unk_10050E160;
    v28[4] = self;
    id v17 = v13;
    id v29 = v17;
    id v18 = objc_retainBlock(v28);
    CFStringRef v19 = v18;
    if (v12 == (id)7000)
    {
      CFStringRef v20 = objc_opt_new();
      [v20 setText:@"AppleConnect authentication is required. Please authenticate with the SiriAuthenticator app before trying your request again."];
      CFStringRef v21 = objc_opt_new();
      BOOL v33 = v20;
      id v22 = +[NSArray arrayWithObjects:&v33 count:1];
      [v21 setViews:v22];

      uint64_t v23 = +[ADCommandCenter sharedCommandCenter];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1002BCBE4;
      v26[3] = &unk_10050CF00;
      id v27 = v19;
      [v23 handleCommand:v21 completion:v26];
    }
    else
    {
      ((void (*)(void *))v18[2])(v18);
    }
  }
  else if (v9)
  {
    *(_DWORD *)buf = 136315138;
    long long v35 = "-[ADSessionRemoteServer _saSessionValidationFailed:]";
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Unexpected refid in validation failed, ignoring", buf, 0xCu);
  }
LABEL_16:
}

- (void)_handleAceObject:(id)a3
{
  Value = (const char *)a3;
  id v29 = (char *)Value;
  if (self->_commandMap)
  {
    if (!Value) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
  self->_commandMap = Mutable;
  int v8 = (const void *)objc_opt_class();
  CFDictionarySetValue(Mutable, v8, "_saGetSessionCertificateResponse:");
  commandMap = self->_commandMap;
  __int16 v10 = (const void *)objc_opt_class();
  CFDictionarySetValue(commandMap, v10, "_saCreateSessionInfoResponse:");
  unsigned __int8 v11 = self->_commandMap;
  id v12 = (const void *)objc_opt_class();
  CFDictionarySetValue(v11, v12, "_saSessionValidationFailed:");
  uint64_t v13 = self->_commandMap;
  uint64_t v14 = (const void *)objc_opt_class();
  CFDictionarySetValue(v13, v14, "_saAssistantCreated:");
  int v15 = self->_commandMap;
  id v16 = (const void *)objc_opt_class();
  CFDictionarySetValue(v15, v16, "_saAssistantLoaded:");
  id v17 = self->_commandMap;
  id v18 = (const void *)objc_opt_class();
  CFDictionarySetValue(v17, v18, "_saAssistantDestroyed:");
  CFStringRef v19 = self->_commandMap;
  CFStringRef v20 = (const void *)objc_opt_class();
  CFDictionarySetValue(v19, v20, "_saAssistantNotFound:");
  CFStringRef v21 = self->_commandMap;
  id v22 = (const void *)objc_opt_class();
  CFDictionarySetValue(v21, v22, "_saAssistantNotReady:");
  uint64_t v23 = self->_commandMap;
  CFStringRef v24 = (const void *)objc_opt_class();
  CFDictionarySetValue(v23, v24, "_saSetConnectionHeader:");
  id v25 = self->_commandMap;
  CFStringRef v26 = (const void *)objc_opt_class();
  CFDictionarySetValue(v25, v26, "_saGetAssistantData:");
  id v27 = self->_commandMap;
  CFStringRef v28 = (const void *)objc_opt_class();
  CFDictionarySetValue(v27, v28, "_saCommandFailed:");
  Value = v29;
  if (v29)
  {
LABEL_3:
    id v5 = self->_commandMap;
    unsigned __int8 v6 = (const void *)objc_opt_class();
    Value = (const char *)CFDictionaryGetValue(v5, v6);
  }
LABEL_4:
  if (Value) {
    objc_msgSend(self, Value, v29);
  }
  else {
    [(ADSession *)self _passObjectToDelegate:v29];
  }
}

- (void)delegateDidHandleCommand:(id)a3 didRecognizeSpeech:(BOOL)a4
{
  if (a4)
  {
    id v5 = a3;
    id v6 = [(ADSessionRemoteServer *)self _retryManager];
    [v6 setLastReceivedCommand:v5];
  }
}

- (void)_eagerAuthDidComplete
{
  if ([(ADSession *)self state] > 3)
  {
    if ([(ADSession *)self state] < 7)
    {
      [(ADSessionRemoteServer *)self _continueAuthentication];
    }
    else
    {
      id v4 = AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
      {
        int v6 = 136315138;
        unsigned __int8 v7 = "-[ADSessionRemoteServer _eagerAuthDidComplete]";
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s We've already authenticated, reset the authenticator since it's not needed anymore.", (uint8_t *)&v6, 0xCu);
      }
      id v5 = [(ADSessionRemoteServer *)self _authenticator];
      [v5 reset];
    }
  }
  else
  {
    id v3 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      unsigned __int8 v7 = "-[ADSessionRemoteServer _eagerAuthDidComplete]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Connection not opened yet, waiting", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)_connectionOpened
{
  id v3 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    int v8 = "-[ADSessionRemoteServer _connectionOpened]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Connection opened", (uint8_t *)&v7, 0xCu);
  }
  [(ADSession *)self _setSessionOpened];
  BOOL siriNetworkEnablementExperimentActivated = self->_siriNetworkEnablementExperimentActivated;
  id v5 = [(ADSession *)self delegate];
  if (siriNetworkEnablementExperimentActivated) {
    [(ADSession *)self _currentSNConnectionType];
  }
  else {
  int v6 = [(ADSession *)self _currentConnectionType];
  }
  objc_msgSend(v5, "updateConnectionSetConnectionType:", objc_msgSend(v6, "aggregatorConnectionType"));

  [(ADSessionRemoteServer *)self _startSession];
}

- (void)_startSession
{
  if ((id)[(ADSession *)self state] == (id)5 && [(ADSession *)self dormant])
  {
    id v3 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315138;
      __int16 v10 = "-[ADSessionRemoteServer _startSession]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Holding off on session start because we're dormant", (uint8_t *)&v9, 0xCu);
    }
    return;
  }
  id v4 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    __int16 v10 = "-[ADSessionRemoteServer _startSession]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Starting Session", (uint8_t *)&v9, 0xCu);
  }
  if ([(ADSessionRemoteServer *)self _authenticationDisabled])
  {
    id v5 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315138;
      __int16 v10 = "-[ADSessionRemoteServer _startSession]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Skipping authentication. Disabled or on simulator", (uint8_t *)&v9, 0xCu);
    }
    [(ADSessionRemoteServer *)self _continueSessionInitWithValidationData:0];
    return;
  }
  if (self->_forceValidationRefresh)
  {
    self->_forceValidationRefresh = 0;
LABEL_13:
    self->_usingCachedValidationData = 0;
    [(ADSession *)self setState:6];
    [(ADSessionRemoteServer *)self _continueAuthentication];
    return;
  }
  uint64_t v6 = [(ADSessionRemoteServer *)self _cachedValidationData];
  if (!v6) {
    goto LABEL_13;
  }
  int v7 = (void *)v6;
  int v8 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    __int16 v10 = "-[ADSessionRemoteServer _startSession]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Using cached validation data", (uint8_t *)&v9, 0xCu);
  }
  self->_usingCachedValidationData = 1;
  [(ADSessionRemoteServer *)self _continueSessionInitWithValidationData:v7];
}

- (void)refreshValidationData
{
  id v3 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    int v9 = "-[ADSessionRemoteServer refreshValidationData]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  self->_forceValidationRefresh = 1;
  v7.receiver = self;
  v7.super_class = (Class)ADSessionRemoteServer;
  [(ADSession *)&v7 refreshValidationData];
  id v4 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    int v9 = "-[ADSessionRemoteServer refreshValidationData]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if ([(ADSession *)self state])
  {
    if ([(ADSession *)self state] >= 7)
    {
      id v5 = AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        int v9 = "-[ADSessionRemoteServer refreshValidationData]";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Session has already authenticated. Resetting authenticator to do it again.", buf, 0xCu);
      }
      uint64_t v6 = [(ADSessionRemoteServer *)self _authenticator];
      [v6 reset];

      self->_badCachedCertRetryCounter = 0;
      self->_certificateFailureCounter = 0;
      [(ADSessionRemoteServer *)self _continueAuthentication];
    }
  }
  else
  {
    [(ADSessionRemoteServer *)self _startConnection];
  }
}

- (void)_continueAuthentication
{
  id v3 = [(ADSessionRemoteServer *)self _authenticator];
  switch([v3 state])
  {
    case 0u:
      id v4 = [(ADSessionRemoteServer *)self _cachedServerCertificate];
      id v5 = AFSiriLogContextSession;
      BOOL v6 = os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO);
      if (v4)
      {
        if (v6)
        {
          int v20 = 136315138;
          CFStringRef v21 = "-[ADSessionRemoteServer _continueAuthentication]";
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Have cached certificate data, preparing", (uint8_t *)&v20, 0xCu);
        }
        self->_usingCachedCertificateData = 1;
        [(ADSessionRemoteServer *)self _continueAuthWithCertificateData:v4];
      }
      else
      {
        if (v6)
        {
          int v20 = 136315138;
          CFStringRef v21 = "-[ADSessionRemoteServer _continueAuthentication]";
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Sending request for certificate data", (uint8_t *)&v20, 0xCu);
        }
        self->_usingCachedCertificateData = 0;
        [(ADSessionRemoteServer *)self _sendGetSessionCertificateData];
      }
      goto LABEL_31;
    case 1u:
      objc_super v7 = AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
      {
        int v20 = 136315138;
        CFStringRef v21 = "-[ADSessionRemoteServer _continueAuthentication]";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Authenticator is still preparing, let's wait", (uint8_t *)&v20, 0xCu);
      }
      goto LABEL_32;
    case 2u:
      int v8 = AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
      {
        int v20 = 136315138;
        CFStringRef v21 = "-[ADSessionRemoteServer _continueAuthentication]";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Authenticator is prepared, but we still need session info", (uint8_t *)&v20, 0xCu);
      }
      id v4 = [v3 requestData];
      [(ADSessionRemoteServer *)self _sendCreateSessionInfoRequestWithData:v4];
      goto LABEL_31;
    case 3u:
      int v9 = AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
      {
        int v20 = 136315138;
        CFStringRef v21 = "-[ADSessionRemoteServer _continueAuthentication]";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Authenticator is ready", (uint8_t *)&v20, 0xCu);
      }
      __int16 v10 = [(ADSessionRemoteServer *)self _authDataToSign];
      id v4 = [v3 signedDataForData:v10];

      if (!v4)
      {
        if ((id)[(ADSession *)self state] == (id)6)
        {
          [(ADSessionRemoteServer *)self _authenticationFailed];
          goto LABEL_31;
        }
        goto LABEL_27;
      }
      unsigned __int8 v11 = (void *)AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
      {
        id v12 = v11;
        [v3 sessionInfoDuration];
        int v20 = 136315394;
        CFStringRef v21 = "-[ADSessionRemoteServer _continueAuthentication]";
        __int16 v22 = 2048;
        uint64_t v23 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Setting cached authentication data with duration %lf", (uint8_t *)&v20, 0x16u);
      }
      [v3 sessionInfoDuration];
      -[ADSessionRemoteServer _setCachedValidationData:withDuration:](self, "_setCachedValidationData:withDuration:", v4);
      if ((id)[(ADSession *)self state] != (id)6)
      {
LABEL_27:
        id v16 = AFSiriLogContextSession;
        if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
        {
          int v20 = 136315138;
          CFStringRef v21 = "-[ADSessionRemoteServer _continueAuthentication]";
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s Not continuing with authentication as session is already active", (uint8_t *)&v20, 0xCu);
        }
        goto LABEL_31;
      }
      uint64_t v14 = [(ADSession *)self _pendingCommands];
      if ([v14 count])
      {

LABEL_30:
        [(ADSessionRemoteServer *)self _continueSessionInitWithValidationData:v4];
        goto LABEL_31;
      }
      id v17 = [(ADSession *)self _account];
      unsigned int v18 = [v17 needsDestruction];

      if (v18) {
        goto LABEL_30;
      }
      CFStringRef v19 = AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
      {
        int v20 = 136315138;
        CFStringRef v21 = "-[ADSessionRemoteServer _continueAuthentication]";
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s We have no pending commands holding", (uint8_t *)&v20, 0xCu);
      }
      [(ADSession *)self setState:7];
LABEL_31:

LABEL_32:
      return;
    case 4u:
      int v15 = AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
      {
        int v20 = 136315138;
        CFStringRef v21 = "-[ADSessionRemoteServer _continueAuthentication]";
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s Authenticator is unable to prepare.", (uint8_t *)&v20, 0xCu);
      }
      [(ADSessionRemoteServer *)self _authenticationFailed];
      goto LABEL_32;
    default:
      goto LABEL_32;
  }
}

- (void)_continueAuthWithCertificateData:(id)a3
{
  id v4 = a3;
  id v5 = [(ADSessionRemoteServer *)self _authenticator];
  serverConnection = self->_serverConnection;
  siriNetworkServerConnection = self->_siriNetworkServerConnection;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1002BDB3C;
  v9[3] = &unk_10050A258;
  unsigned __int8 v11 = serverConnection;
  id v12 = siriNetworkServerConnection;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  [v8 prepareWithCertificateData:v4 completion:v9];
}

- (void)_continueSessionInitWithValidationData:(id)a3
{
  id v4 = a3;
  id v5 = [(ADSession *)self _account];
  BOOL v6 = [v5 assistantIdentifier];
  if (!v6 || [v5 needsCreation]) {
    [(ADSessionRemoteServer *)self _createAssistant];
  }
  [(ADSessionRemoteServer *)self _sendLoadAssistantWithAccount:v5 validationData:v4];
  objc_super v7 = [v5 lastAssistantDataAnchor];
  if ((AFIsHorseman() & 1) != 0 || AFSupportsPairedDevice() && (AFIsNano() & 1) == 0) {
    [(ADSessionRemoteServer *)self _sendSetRemoteDevicesWithAccount:v5];
  }
  if (AFSupportsMultiUser()) {
    [(ADSessionRemoteServer *)self _sendMultiUserInfo];
  }
  if ([v5 needsDestruction])
  {
    id v8 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315138;
      id v10 = "-[ADSessionRemoteServer _continueSessionInitWithValidationData:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Assistant needs destruction, sending destroy", (uint8_t *)&v9, 0xCu);
    }
    [(ADSession *)self _sendDestroyAssistant];
  }
  else
  {
    [(ADSession *)self _sendAssistantDataAndPendingCommandsIfNeeded:v7];
  }
}

- (void)_authenticationFailed
{
  id v6 = +[AFError errorWithCode:300];
  id v3 = [(ADSessionRemoteServer *)self _generateAnalyticsContextWithError:v6];
  id v4 = +[AFAnalytics sharedAnalytics];
  [v4 logEventWithType:908 context:v3 contextNoCopy:1];

  id v5 = [(ADSessionRemoteServer *)self _authenticator];
  [v5 reset];

  [(ADSession *)self _clearLimbo];
  [(ADSession *)self _setSessionOpened];
  [(ADSessionRemoteServer *)self _informDelegateOfError:v6];
}

- (id)siriNetworkConnection
{
  return self->_siriNetworkServerConnection;
}

- (id)connection
{
  return self->_serverConnection;
}

- (BOOL)sessionIsAttemptingTryOrRetry
{
  v4.receiver = self;
  v4.super_class = (Class)ADSessionRemoteServer;
  return [(ADSession *)&v4 sessionIsAttemptingTryOrRetry] || self->_isAttemptingRetry;
}

- (void)_retrySiriNetworkForFailedConnection:(id)a3 siriNetworkAnalysisInfo:(id)a4 onError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  double v10 = COERCE_DOUBLE(a5);
  int v11 = AFHasCellularData();
  id v12 = [v9 connectionType];
  if (([v9 wwanPreferred] & 1) != 0 || objc_msgSend(v12, "technology") == (id)3000) {
    unsigned int v40 = 0;
  }
  else {
    unsigned int v40 = v11 & ~[v12 isWWAN];
  }
  uint64_t v13 = (void *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    os_log_t log = v13;
    unsigned int v14 = [v9 wwanPreferred];
    int v15 = self;
    id v16 = v9;
    id v17 = v8;
    if (v14) {
      *(double *)&CFStringRef v18 = COERCE_DOUBLE(@"YES");
    }
    else {
      *(double *)&CFStringRef v18 = COERCE_DOUBLE(@"NO");
    }
    CFStringRef v19 = [v12 technologyDescription];
    *(_DWORD *)buf = 136316674;
    uint64_t v50 = "-[ADSessionRemoteServer _retrySiriNetworkForFailedConnection:siriNetworkAnalysisInfo:onError:]";
    if ([v12 isWWAN]) {
      CFStringRef v20 = @"YES";
    }
    else {
      CFStringRef v20 = @"NO";
    }
    if (v11) {
      CFStringRef v21 = @"YES";
    }
    else {
      CFStringRef v21 = @"NO";
    }
    if (v40) {
      CFStringRef v22 = @"YES";
    }
    else {
      CFStringRef v22 = @"NO";
    }
    __int16 v51 = 2112;
    double v52 = v10;
    __int16 v53 = 2112;
    double v54 = *(double *)&v18;
    id v8 = v17;
    id v9 = v16;
    self = v15;
    __int16 v55 = 2112;
    double v56 = *(double *)&v19;
    __int16 v57 = 2112;
    CFStringRef v58 = v20;
    __int16 v59 = 2112;
    CFStringRef v60 = v21;
    __int16 v61 = 2112;
    CFStringRef v62 = v22;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "%s Retry. Error: %@. WWAN Preferred: %@, Connection type: %@, isWWAN: %@, Has Cellular Data: %@, shouldPreferWWAN: %@", buf, 0x48u);
  }
  uint64_t v23 = [*(id *)&v10 userInfo];
  CFStringRef v24 = [v23 objectForKey:SiriNetworkBackgroundConnectionShouldSkipIDSOnNextAttemptKey];
  id v25 = [v24 BOOLValue];

  if (v25) {
    double v26 = v10;
  }
  else {
    double v26 = 0.0;
  }
  id v27 = *(id *)&v26;
  CFStringRef v28 = +[NSProcessInfo processInfo];
  [v28 systemUptime];
  double v30 = v29;

  id v31 = [*(id *)&v10 code];
  BOOL v32 = v31 == (id)10;
  id v48 = [*(id *)&v10 code];
  double v33 = 0.0;
  if (objc_msgSend(*(id *)&v10, "ad_requiresDampedRetry:", &v48))
  {
    if (!objc_msgSend(*(id *)&v10, "sn_isNetworkConnectionRetryableNow")
      || v30 - self->_lastRetryTimeOnQueue < 2.0)
    {
      double v33 = 2.0;
    }
    self->_lastRetryTimeOnQueue = v30;
  }
  if (v31 != (id)10)
  {
    __int16 v34 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      double v35 = v30 - self->_requestStartTime;
      *(_DWORD *)buf = 136315906;
      uint64_t v50 = "-[ADSessionRemoteServer _retrySiriNetworkForFailedConnection:siriNetworkAnalysisInfo:onError:]";
      __int16 v51 = 2048;
      double v52 = v35;
      __int16 v53 = 2048;
      double v54 = v30;
      __int16 v55 = 2112;
      double v56 = v10;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "%s Retrying after %lf seconds, now %lf error %@", buf, 0x2Au);
    }
  }
  if (v33 == 0.0)
  {
    [(ADSessionRemoteServer *)self _retryWithParameters:v40 skipPeer:v25 skipPeerError:v27 causedByError:*(void *)&v10 useSecondary:v31 == (id)10];
  }
  else
  {
    __int16 v36 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v50 = "-[ADSessionRemoteServer _retrySiriNetworkForFailedConnection:siriNetworkAnalysisInfo:onError:]";
      __int16 v51 = 2048;
      double v52 = v33;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "%s Backing off for %lf seconds", buf, 0x16u);
    }
    self->_waitingForDelayedRetry = 1;
    dispatch_time_t v37 = dispatch_time(0, (uint64_t)(v33 * 1000000000.0));
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002BE51C;
    block[3] = &unk_10050A190;
    block[4] = self;
    id v42 = v8;
    char v45 = v40;
    char v46 = (char)v25;
    id v43 = v27;
    id v44 = *(id *)&v10;
    BOOL v47 = v32;
    dispatch_after(v37, queue, block);
  }
}

- (void)_retryForFailedConnection:(id)a3 withType:(id)a4 onError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (([v8 prefersWWAN] & 1) != 0
    || [v9 technology] == (id)3000
    || ([v9 isWWAN] & 1) != 0)
  {
    unsigned int v27 = 0;
  }
  else
  {
    unsigned int v27 = AFHasCellularData();
  }
  int v11 = [v10 userInfo];
  id v12 = [v11 objectForKey:SiriCoreSiriConnectionShouldSkipIDSOnNextAttemptKey];
  id v13 = [v12 BOOLValue];

  if (v13) {
    unsigned int v14 = v10;
  }
  else {
    unsigned int v14 = 0;
  }
  id v15 = v14;
  id v16 = +[NSProcessInfo processInfo];
  [v16 systemUptime];
  double v18 = v17;

  id v19 = [v10 code];
  BOOL v20 = v19 == (id)32;
  id v35 = [v10 code];
  double v21 = 0.0;
  if (objc_msgSend(v10, "ad_requiresDampedRetry:", &v35))
  {
    if (v35 != (id)54 || v18 - self->_lastRetryTimeOnQueue < 2.0) {
      double v21 = 2.0;
    }
    self->_lastRetryTimeOnQueue = v18;
  }
  if (v19 != (id)32)
  {
    CFStringRef v22 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      double v23 = v18 - self->_requestStartTime;
      *(_DWORD *)buf = 136315906;
      dispatch_time_t v37 = "-[ADSessionRemoteServer _retryForFailedConnection:withType:onError:]";
      __int16 v38 = 2048;
      double v39 = v23;
      __int16 v40 = 2048;
      double v41 = v18;
      __int16 v42 = 2112;
      id v43 = v10;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s Retrying after %lf seconds, now %lf error %@", buf, 0x2Au);
    }
  }
  if (v21 == 0.0)
  {
    [(ADSessionRemoteServer *)self _retryWithParameters:v27 skipPeer:v13 skipPeerError:v15 causedByError:v10 useSecondary:v19 == (id)32];
  }
  else
  {
    CFStringRef v24 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      dispatch_time_t v37 = "-[ADSessionRemoteServer _retryForFailedConnection:withType:onError:]";
      __int16 v38 = 2048;
      double v39 = v21;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s Backing off for %lf seconds", buf, 0x16u);
    }
    self->_waitingForDelayedRetry = 1;
    dispatch_time_t v25 = dispatch_time(0, (uint64_t)(v21 * 1000000000.0));
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002BEABC;
    block[3] = &unk_10050A190;
    block[4] = self;
    id v29 = v8;
    char v32 = v27;
    char v33 = (char)v13;
    id v30 = v15;
    id v31 = v10;
    BOOL v34 = v20;
    dispatch_after(v25, queue, block);
  }
}

- (void)_reallyRetryPreferringWWAN:(BOOL)a3 skipPeer:(BOOL)a4 skipPeerError:(id)a5 useWiFiHint:(BOOL)a6 causedByError:(id)a7 forceReconnect:(BOOL)a8 useSecondary:(BOOL)a9
{
  BOOL v14 = a3;
  id v44 = a5;
  id v45 = a7;
  id v15 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v59 = "-[ADSessionRemoteServer _reallyRetryPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:causedByError:forceRecon"
          "nect:useSecondary:]";
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  [(ADSession *)self _informDelegateWillRetryOnError:v45];
  self->_isAttemptingRetry = 1;
  id v16 = [(ADSession *)self delegate];
  [v16 assistantSession:self beginSessionRetryPreferringWWAN:v14];

  double v17 = [(ADSession *)self _sendBuffer];
  id v18 = [v17 copy];

  id v19 = self;
  [(ADSession *)self _clearSendBuffer];
  [(ADSession *)self _clearLimbo];
  if (a9) {
    [(ADSession *)self _setSessionOpened];
  }
  else {
    [(ADSessionRemoteServer *)self _resetServerConnection];
  }
  self->_prefersWWAN = v14;
  self->_skipPeer = a4;
  objc_storeStrong((id *)&self->_skipPeerError, a5);
  self->_BOOL useWiFiHint = a6;
  self->_forceReconnect = a8;
  BOOL v20 = [(ADSession *)self delegate];
  uint64_t v21 = [v20 assistantSessionCommandsToRestoreStateOnNewConnection:self];

  id v43 = (void *)v21;
  [(ADSession *)self sendCommands:v21 opportunistically:0];
  id v22 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v18, "count"));
  id v51 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v18, "count"));
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = v18;
  id v23 = [obj countByEnumeratingWithState:&v54 objects:v64 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v55;
    uint64_t v49 = *(void *)v55;
    id v46 = v22;
    do
    {
      double v26 = 0;
      unsigned int v27 = obj;
      id v50 = v24;
      do
      {
        if (*(void *)v55 != v25) {
          objc_enumerationMutation(v27);
        }
        CFStringRef v28 = *(void **)(*((void *)&v54 + 1) + 8 * (void)v26);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v29 = [v28 mutableCopy];
        }
        else {
          id v29 = v28;
        }
        id v30 = v29;
        if ((objc_msgSend(v29, "siriCore_isProvisional") & 1) == 0)
        {
          id v31 = [v30 aceId];
          char v32 = [v30 refId];
          if (v31)
          {
            char v33 = [v22 objectForKey:v31];
            if (!v33)
            {
              char v33 = SiriCoreUUIDStringCreate();
              [v22 setObject:v33 forKey:v31];
            }
            [v30 setAceId:v33];
            objc_opt_class();
            if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
            {
              BOOL v34 = +[AFAnalytics sharedAnalytics];
              v52[0] = _NSConcreteStackBlock;
              v52[1] = 3221225472;
              v52[2] = sub_1002BF318;
              v52[3] = &unk_10050A230;
              v52[4] = v31;
              id v35 = v33;
              id v53 = v35;
              [v34 logEventWithType:911 contextProvider:v52];

              __int16 v36 = [(ADSession *)v19 delegate];
              [v36 assistantSession:v19 didChangeRequestIdFrom:v31 toId:v35];

              dispatch_time_t v37 = [(ADRetryManager *)v19->_retryManager latestMappedRequestId];
              unsigned int v38 = [v37 isEqualToString:v31];

              if (v38)
              {
                double v39 = AFSiriLogContextSession;
                if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315650;
                  __int16 v59 = "-[ADSessionRemoteServer _reallyRetryPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:causedByEr"
                        "ror:forceReconnect:useSecondary:]";
                  __int16 v60 = 2112;
                  __int16 v61 = v31;
                  __int16 v62 = 2112;
                  id v63 = v35;
                  _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "%s Remapping retry manager from %@ to %@", buf, 0x20u);
                }
                [(ADRetryManager *)self->_retryManager setLatestMappedRequestId:v35];
              }
              __int16 v40 = AFSiriLogContextSession;
              if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315138;
                __int16 v59 = "-[ADSessionRemoteServer _reallyRetryPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:causedByErro"
                      "r:forceReconnect:useSecondary:]";
                _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "%s creating rollback request", buf, 0xCu);
              }
              id v41 = objc_alloc_init((Class)SARollbackRequest);
              [v41 setRequestId:v31];
              [v51 addObject:v41];

              unsigned int v27 = obj;
              id v19 = self;
              id v22 = v46;
              uint64_t v25 = v49;
            }
            if (v32)
            {
              __int16 v42 = [v22 objectForKey:v32];
              if (!v42)
              {
                __int16 v42 = SiriCoreUUIDStringCreate();
                [v22 setObject:v42 forKey:v32];
              }
              [v30 setRefId:v42];

              uint64_t v25 = v49;
            }
            [v51 addObject:v30];
          }
          id v24 = v50;
        }

        double v26 = (char *)v26 + 1;
      }
      while (v24 != v26);
      id v24 = [v27 countByEnumeratingWithState:&v54 objects:v64 count:16];
    }
    while (v24);
  }

  [(ADSession *)v19 sendCommands:v51 opportunistically:0];
}

- (void)_retryWithParameters:(BOOL)a3 skipPeer:(BOOL)a4 skipPeerError:(id)a5 causedByError:(id)a6 useSecondary:(BOOL)a7
{
  BOOL v10 = a3;
  id v12 = a5;
  id v13 = a6;
  if (a4 || !sub_100078614())
  {
    LOBYTE(v19) = a7;
    [(ADSessionRemoteServer *)self _reallyRetryPreferringWWAN:v10 skipPeer:1 skipPeerError:v12 useWiFiHint:1 causedByError:v13 forceReconnect:0 useSecondary:v19];
    if (self->_siriNetworkEnablementExperimentActivated)
    {
      double v17 = [(ADSessionRemoteServer *)self _siriNetworkManager];
      [v17 resetLinkRecommendationInfo];
    }
    else
    {
      double v17 = [(ADSessionRemoteServer *)self _networkManager];
      [v17 resetLinkMetrics];
    }
  }
  else
  {
    BOOL v14 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      char v33 = "-[ADSessionRemoteServer _retryWithParameters:skipPeer:skipPeerError:causedByError:useSecondary:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%s Peer is nearby", buf, 0xCu);
    }
    if (self->_siriNetworkEnablementExperimentActivated)
    {
      id v15 = [(ADSessionRemoteServer *)self _siriNetworkManager];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1002BF64C;
      v26[3] = &unk_10050A1B8;
      void v26[4] = self;
      BOOL v29 = v10;
      BOOL v30 = a4;
      id v27 = v12;
      id v28 = v13;
      BOOL v31 = a7;
      [v15 getLinkRecommendation:1 recommendation:v26];

      id v16 = v27;
    }
    else
    {
      id v18 = [(ADSessionRemoteServer *)self _networkManager];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1002BF734;
      v20[3] = &unk_10050A208;
      v20[4] = self;
      BOOL v23 = v10;
      BOOL v24 = a4;
      id v21 = v12;
      id v22 = v13;
      BOOL v25 = a7;
      [v18 getLinkRecommendation:1 recommendation:v20];

      id v16 = v21;
    }
  }
}

- (id)_authDataToSign
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  objc_super v4 = [(ADSession *)self _account];
  id v5 = [v4 assistantIdentifier];

  if (v5) {
    [v3 setObject:v5 forKey:@"Assistant Identifier"];
  }
  if ((AFIsInternalInstall() & 1) != 0 || AFPreferencesTestAccessEnabled()) {
    [v3 setObject:&__kCFBooleanTrue forKey:@"9E5BD479-1D3E-400D-ADF7-ECB0A7DBFE06"];
  }
  if ([v3 count])
  {
    id v6 = +[NSPropertyListSerialization dataWithPropertyList:v3 format:100 options:0 error:0];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)_persistValidationData:(id)a3 withExpiration:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ADSession *)self _account];
  unsigned int v9 = [v8 setValidationDataSync:v7];

  if (v9)
  {
    BOOL v10 = [(ADSessionRemoteServer *)self _authenticator];
    int v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v10 authenticationStrategyVersion]);
    [v8 setValidationVersion:v11];

    [v8 setValidationExpiration:v6];
    [v8 save];
  }
  else
  {
    id v12 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315138;
      id v15 = "-[ADSessionRemoteServer _persistValidationData:withExpiration:]";
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Failed to persist validation data", (uint8_t *)&v14, 0xCu);
    }
  }

  return v9;
}

- (void)_setCachedValidationData:(id)a3 withDuration:(double)a4
{
  id v6 = (NSData *)a3;
  id v7 = (NSDate *)[objc_alloc((Class)NSDate) initWithTimeIntervalSinceNow:a4];
  unsigned int v8 = [(ADSessionRemoteServer *)self _persistValidationData:v6 withExpiration:v7];
  if (v6 && v8)
  {
    unsigned int v9 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315650;
      id v15 = "-[ADSessionRemoteServer _setCachedValidationData:withDuration:]";
      __int16 v16 = 1024;
      int v17 = (int)a4;
      __int16 v18 = 2112;
      uint64_t v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Validity is valid for %d seconds %@", (uint8_t *)&v14, 0x1Cu);
    }
    BOOL v10 = +[ADDaemon sharedDaemon];
    [v10 scheduleValidationRefreshForInterval:a4];
  }
  cachedValidationData = self->_cachedValidationData;
  self->_cachedValidationData = v6;
  id v12 = v6;

  cachedValidationDataExpiration = self->_cachedValidationDataExpiration;
  self->_cachedValidationDataExpiration = v7;
}

- (id)_cachedValidationData
{
  id v3 = [(ADSession *)self _account];
  objc_super v4 = [v3 validationExpiration];
  if (!v4)
  {
    cachedValidationDataExpiration = self->_cachedValidationDataExpiration;
    if (cachedValidationDataExpiration)
    {
      BOOL v10 = +[NSDate date];
      id v11 = [(NSDate *)cachedValidationDataExpiration compare:v10];

      if (v11 == (id)1)
      {
        id v7 = self->_cachedValidationData;
        [(ADSessionRemoteServer *)self _persistValidationData:self->_cachedValidationData withExpiration:self->_cachedValidationDataExpiration];
        goto LABEL_14;
      }
    }
    goto LABEL_11;
  }
  id v5 = +[NSDate date];
  id v6 = [v4 compare:v5];

  if (v6 != (id)1)
  {
LABEL_11:
    id v12 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315394;
      id v15 = "-[ADSessionRemoteServer _cachedValidationData]";
      __int16 v16 = 2112;
      int v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Session data has expired %@", (uint8_t *)&v14, 0x16u);
    }
    goto LABEL_13;
  }
  id v7 = [v3 validationData];
  if (v7
    && ![(ADSessionRemoteServer *)self _versionForCachedValidationDataMatchesCurrentVersion])
  {
    unsigned int v8 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315138;
      id v15 = "-[ADSessionRemoteServer _cachedValidationData]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Resetting cached validation data due to cached version not matching current version.", (uint8_t *)&v14, 0xCu);
    }

    [v3 setValidationData:0];
    [v3 setValidationExpiration:0];
    [v3 save];
LABEL_13:
    id v7 = 0;
  }
LABEL_14:

  return v7;
}

- (void)_setCachedServerCertificate:(id)a3
{
  id v4 = a3;
  id v5 = [(ADSession *)self _account];
  [v5 setServerCertificateData:v4];

  id v6 = [(ADSession *)self _account];
  id v7 = [(ADSessionRemoteServer *)self _authenticator];
  unsigned int v8 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v7 authenticationStrategyVersion]);
  [v6 setValidationVersion:v8];

  id v9 = [(ADSession *)self _account];
  [v9 save];
}

- (id)_cachedServerCertificate
{
  id v3 = [(ADSession *)self _account];
  id v4 = [v3 serverCertificateData];

  if (![v4 length])
  {
    id v6 = 0;
    goto LABEL_7;
  }
  unsigned __int8 v5 = [(ADSessionRemoteServer *)self _versionForCachedValidationDataMatchesCurrentVersion];
  id v6 = v4;
  if (v5)
  {
LABEL_7:
    id v9 = v6;
    goto LABEL_8;
  }
  id v7 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315138;
    id v12 = "-[ADSessionRemoteServer _cachedServerCertificate]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Resetting cached certificate data due to cached version not matching current version.", (uint8_t *)&v11, 0xCu);
  }
  unsigned int v8 = [(ADSession *)self _account];
  [v8 setServerCertificateData:0];

  id v9 = 0;
LABEL_8:

  return v9;
}

- (BOOL)_versionForCachedValidationDataMatchesCurrentVersion
{
  id v3 = [(ADSession *)self _account];
  id v4 = [v3 validationVersion];

  id v5 = [v4 unsignedIntegerValue];
  id v6 = [(ADSessionRemoteServer *)self _authenticator];
  LOBYTE(v5) = v5 == [v6 authenticationStrategyVersion];

  return (char)v5;
}

- (id)_authenticator
{
  authenticator = self->_authenticator;
  if (!authenticator)
  {
    id v4 = +[ADPreferences sharedPreferences];
    id v5 = [v4 useDeviceAuthenticationVersion];

    id v6 = [[ADAuthenticator alloc] initWithTargetQueue:self->_queue authenticationStrategyVersion:v5];
    id v7 = self->_authenticator;
    self->_authenticator = v6;

    authenticator = self->_authenticator;
  }
  return authenticator;
}

- (BOOL)_authenticationDisabled
{
  if (self->_hasCachedAuthDisabled)
  {
    LOBYTE(v3) = self->_cachedAuthDisabled;
  }
  else
  {
    LOBYTE(v3) = 1;
    self->_hasCachedAuthDisabled = 1;
    if ((_AFPreferencesAuthenticationDisabled() & 1) == 0) {
      unsigned int v3 = !+[ADAuthenticator authenticationAvailable];
    }
    self->_cachedAuthDisabled = v3;
  }
  return v3;
}

- (void)_informDelegateOfError:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    int v18 = 136315394;
    uint64_t v19 = "-[ADSessionRemoteServer _informDelegateOfError:]";
    __int16 v20 = 2114;
    *(void *)id v21 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s %{public}@", (uint8_t *)&v18, 0x16u);
  }
  id v6 = [(ADSessionRemoteServer *)self _retryManager];
  [v6 setNeedsToRetryNakedObjects];
  id v7 = [(ADSessionRemoteServer *)self _retryManager];
  if (![v7 shouldRetryOnConnectionFailure])
  {

    goto LABEL_8;
  }
  if (!v4)
  {
    uint64_t v9 = 1;
    goto LABEL_19;
  }
  unsigned __int8 v8 = objc_msgSend(v4, "ad_isRetryableSessionError");

  if ((v8 & 1) == 0)
  {
LABEL_8:
    BOOL v10 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v11 = v10;
      unsigned int v12 = [v6 shouldRetryOnConnectionFailure];
      unsigned int v13 = objc_msgSend(v4, "ad_isRetryableSessionError");
      int v18 = 136315650;
      uint64_t v19 = "-[ADSessionRemoteServer _informDelegateOfError:]";
      __int16 v20 = 1024;
      *(_DWORD *)id v21 = v12;
      *(_WORD *)&v21[4] = 1024;
      *(_DWORD *)&v21[6] = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Not retrying shouldRetry %d retryableError %d", (uint8_t *)&v18, 0x18u);
    }
    self->_isAttemptingRetry = 0;
    if (objc_msgSend(v4, "ad_isAssistantNotReadyError")) {
      [v6 clearNakedObjects];
    }
    int v14 = [(ADSession *)self _requestId];

    if (!v14)
    {
      uint64_t v9 = 0;
      goto LABEL_20;
    }
    id v7 = objc_alloc_init((Class)SACommandIgnored);
    id v15 = [(ADSession *)self _requestId];
    [v7 setRefId:v15];

    [(ADSession *)self _informDelegateCannotHandleRequest:v7 error:v4];
    [(ADSessionRemoteServer *)self resetRetryManager];
    if (self->_siriNetworkEnablementExperimentActivated) {
      [(ADSessionRemoteServer *)self _siriNetworkManager];
    }
    else {
    __int16 v16 = [(ADSessionRemoteServer *)self _networkManager];
    }
    [v16 releaseWiFiAssertion];

    uint64_t v9 = 0;
LABEL_19:

    goto LABEL_20;
  }
  uint64_t v9 = 1;
LABEL_20:
  int v17 = [(ADSession *)self delegate];
  [v17 assistantSession:self receivedError:v4 isRetryableError:v9];
}

- (void)endRetryableRequestForCommandAceId:(id)a3 refId:(id)a4
{
}

- (void)resetRetryManager
{
  id v2 = [(ADSessionRemoteServer *)self _retryManager];
  unsigned int v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[ADSessionRemoteServer resetRetryManager]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Resetting retry manager", (uint8_t *)&v4, 0xCu);
  }
  [v2 endRetryableRequestForCommand:0];
}

- (void)startRetry
{
  unsigned int v3 = [(ADSessionRemoteServer *)self _retryManager];
  int v4 = [v3 retryRequestId];
  id v5 = [v3 latestMappedRequestId];
  if (!v4)
  {
    int v4 = SiriCoreUUIDStringCreate();
  }
  [(ADRetryManager *)self->_retryManager setLatestMappedRequestId:v4];
  if (v5)
  {
    id v6 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v15 = 136315650;
      __int16 v16 = "-[ADSessionRemoteServer startRetry]";
      __int16 v17 = 2112;
      id v18 = v5;
      __int16 v19 = 2112;
      __int16 v20 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Changing requestId from %@ to %@ ", (uint8_t *)&v15, 0x20u);
    }
    id v7 = [(ADSession *)self delegate];
    [v7 assistantSession:self didChangeRequestIdFrom:v5 toId:v4];
  }
  unsigned __int8 v8 = +[SiriCoreNetworkActivityTracing sharedNetworkActivityTracing];
  [v8 networkActivityStart:6 activate:1];

  uint64_t v9 = +[SNNetworkActivityTracing sharedInstance];
  [v9 networkActivityStart:6 activate:1 completion:0];

  BOOL v10 = [v3 objectsToRetry];
  int v11 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    unsigned int v12 = v11;
    id v13 = [v10 count];
    int v15 = 136315394;
    __int16 v16 = "-[ADSessionRemoteServer startRetry]";
    __int16 v17 = 2048;
    id v18 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Retrying %lu objects on session failure", (uint8_t *)&v15, 0x16u);
  }
  self->_isRequestRetry = 1;
  int v14 = [(ADSession *)self delegate];
  [v14 assistantSessionRetryingRequest:self];

  [(ADSession *)self sendCommands:v10 opportunistically:0];
}

- (BOOL)_connectionErrorIsTimeout:(id)a3
{
  id v3 = a3;
  int v4 = [v3 domain];
  if ([v4 isEqualToString:NSPOSIXErrorDomain])
  {
    BOOL v5 = [v3 code] == (id)60;
  }
  else
  {
    id v6 = [v3 domain];
    if ([v6 isEqualToString:kNWErrorDomainPOSIX]) {
      BOOL v5 = [v3 code] == (id)60;
    }
    else {
      BOOL v5 = 0;
    }
  }
  id v7 = [v3 domain];
  if ([v7 isEqualToString:SiriNetworkBackgroundConnectionErrorDomain])
  {
  }
  else
  {
    unsigned __int8 v8 = [v3 domain];
    unsigned int v9 = [v8 isEqualToString:SiriNetworkNetworkConnectionErrorDomain];

    if (!v9) {
      goto LABEL_20;
    }
  }
  BOOL v10 = [v3 userInfo];
  int v11 = [v10 objectForKey:NSUnderlyingErrorKey];

  unsigned int v12 = [v11 domain];
  if ([v12 isEqualToString:NSPOSIXErrorDomain])
  {
    BOOL v5 = [v11 code] == (id)60;
  }
  else
  {
    id v13 = [v11 domain];
    if ([v13 isEqualToString:kNWErrorDomainPOSIX])
    {
      BOOL v5 = [v11 code] == (id)60;
    }
    else
    {
      int v14 = [v11 domain];
      int v15 = [v14 lowercaseString];
      if ([v15 containsString:@"nwerror"]) {
        BOOL v5 = [v11 code] == (id)60;
      }
      else {
        BOOL v5 = 0;
      }
    }
  }

LABEL_20:
  return v5;
}

- (BOOL)_connectionErrorSuggestsConnectionPolicyReset:(id)a3
{
  id v3 = a3;
  int v4 = [v3 domain];
  unsigned int v5 = [v4 isEqualToString:SiriCoreSiriConnectionErrorDomain];

  if (v5) {
    BOOL v6 = (((unint64_t)[v3 code] - 1) & 0xFFFFFFFFFFFFFFF7) == 0;
  }
  else {
    BOOL v6 = 0;
  }
  id v7 = [v3 domain];
  unsigned int v8 = [v7 isEqualToString:SiriNetworkBackgroundConnectionErrorDomain];

  if (v8 && [v3 code] == (id)1) {
    BOOL v6 = 1;
  }

  return v6;
}

- (BOOL)_connectionErrorIsRedirect:(id)a3
{
  id v3 = a3;
  int v4 = [v3 domain];
  if ([v4 isEqualToString:SiriCoreSiriConnectionErrorDomain]
    && ![v3 code])
  {
    BOOL v6 = [v3 userInfo];
    id v7 = [v6 objectForKey:SiriCoreSiriConnectionHTTPErrorStatusCodeKey];
    BOOL v5 = [v7 intValue] == 301;
  }
  else
  {
    BOOL v5 = 0;
  }

  unsigned int v8 = [v3 domain];
  if ([v8 isEqualToString:SiriNetworkBackgroundConnectionErrorDomain]
    && ![v3 code])
  {
    BOOL v10 = [v3 userInfo];
    int v11 = [v10 objectForKey:SiriNetworkBackgroundConnectionHTTPErrorStatusCodeKey];
    BOOL v9 = [v11 intValue] == 301;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v5 || v9;
}

- (void)_updateConnectionPolicyFailureCount:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ADSession *)self _account];
  BOOL v6 = [v5 connectionPolicy];

  if (v6)
  {
    id v7 = [(ADSession *)self _account];
    uint64_t v8 = (uint64_t)[v7 connectionPolicyFailureCount];
    BOOL v9 = [v4 domain];
    unsigned int v10 = [v9 isEqualToString:SiriCoreSiriConnectionErrorDomain];

    if (v10)
    {
      switch(__ROR8__([v4 code], 1))
      {
        case 0:
          int v11 = [v4 userInfo];
          unsigned int v12 = v11;
          id v13 = &SiriCoreSiriConnectionHTTPErrorStatusCodeKey;
          goto LABEL_10;
        case 2:
        case 7:
          goto LABEL_14;
        case 8:
          id v22 = [v4 userInfo];
          BOOL v23 = [v22 objectForKey:NSUnderlyingErrorKey];

          if (!v23 || (objc_msgSend(v23, "ad_isNetworkDownError") & 1) == 0)
          {
            if (v8)
            {
              ++v8;
            }
            else
            {
              BOOL v24 = +[NSDate date];
              [v7 setConnectionPolicyFirstFailureDate:v24];

              uint64_t v8 = 1;
            }
          }
          [(ADSessionRemoteServer *)self _adjustAceHeaderTimeout:0];

          goto LABEL_27;
        default:
          goto LABEL_27;
      }
    }
    int v14 = [v4 domain];
    unsigned int v15 = [v14 isEqualToString:SiriNetworkBackgroundConnectionErrorDomain];

    if (v15)
    {
      id v16 = [v4 code];
      if (v16 != (id)6)
      {
        if (v16 == (id)5)
        {
          if ((objc_msgSend(v4, "ad_isNetworkDownError") & 1) == 0)
          {
            if (v8)
            {
              ++v8;
            }
            else
            {
              double v26 = +[NSDate date];
              [v7 setConnectionPolicyFirstFailureDate:v26];

              uint64_t v8 = 1;
            }
          }
          [(ADSessionRemoteServer *)self _adjustAceHeaderTimeout:0];
          if (!v8) {
            goto LABEL_31;
          }
          goto LABEL_28;
        }
        if (v16) {
          goto LABEL_27;
        }
        int v11 = [v4 userInfo];
        unsigned int v12 = v11;
        id v13 = &SiriNetworkBackgroundConnectionHTTPErrorStatusCodeKey;
LABEL_10:
        __int16 v17 = [v11 objectForKey:*v13];
        unsigned int v18 = [v17 intValue];

        if (v18 != 503)
        {
LABEL_27:
          if (v8) {
            goto LABEL_28;
          }
LABEL_31:

          goto LABEL_32;
        }
      }
    }
    else
    {
      __int16 v19 = [v4 domain];
      unsigned int v20 = [v19 isEqualToString:SiriNetworkNetworkConnectionErrorDomain];

      if (!v20 || [v4 code] != (id)2) {
        goto LABEL_27;
      }
    }
LABEL_14:
    if (v8)
    {
      if (!++v8) {
        goto LABEL_31;
      }
    }
    else
    {
      id v21 = +[NSDate date];
      [v7 setConnectionPolicyFirstFailureDate:v21];

      uint64_t v8 = 1;
    }
LABEL_28:
    BOOL v25 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v27 = 136315394;
      id v28 = "-[ADSessionRemoteServer _updateConnectionPolicyFailureCount:]";
      __int16 v29 = 1024;
      int v30 = v8;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%s Setting failure count of %d", (uint8_t *)&v27, 0x12u);
    }
    [v7 setConnectionPolicyFailureCount:v8];
    goto LABEL_31;
  }
LABEL_32:
}

- (BOOL)_shouldRetry
{
  id v3 = +[NSProcessInfo processInfo];
  [v3 systemUptime];
  double v5 = v4;

  BOOL v6 = (self->_hasActiveRequest || [(ADSession *)self state] <= 10)
    && v5 - self->_requestStartTime < 20.0
    && v5 - self->_lastRetryTimeOnQueue >= 2.0;
  id v7 = (void *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    if (self->_hasActiveRequest) {
      CFStringRef v8 = @"YES";
    }
    else {
      CFStringRef v8 = @"NO";
    }
    BOOL v9 = v7;
    if ([(ADSession *)self state] >= 11) {
      CFStringRef v10 = @"NO";
    }
    else {
      CFStringRef v10 = @"YES";
    }
    if (v5 - self->_requestStartTime >= 20.0) {
      CFStringRef v11 = @"NO";
    }
    else {
      CFStringRef v11 = @"YES";
    }
    double v12 = v5 - self->_lastRetryTimeOnQueue;
    int v16 = 136316674;
    __int16 v17 = "-[ADSessionRemoteServer _shouldRetry]";
    __int16 v18 = 2112;
    CFStringRef v19 = v8;
    if (v12 < 2.0) {
      CFStringRef v13 = @"NO";
    }
    else {
      CFStringRef v13 = @"YES";
    }
    __int16 v20 = 2112;
    if (v6) {
      CFStringRef v14 = @"YES";
    }
    else {
      CFStringRef v14 = @"NO";
    }
    CFStringRef v21 = v10;
    __int16 v22 = 2112;
    CFStringRef v23 = v11;
    __int16 v24 = 2112;
    CFStringRef v25 = v13;
    __int16 v26 = 2112;
    CFStringRef v27 = @"YES";
    __int16 v28 = 2112;
    CFStringRef v29 = v14;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Has Active Request: %@, Session active: %@, RapidRetryTimeLimit: %@, DampedRapidRetryBackoff: %@, Network present: %@, Should Retry: %@", (uint8_t *)&v16, 0x48u);
  }
  return v6;
}

- (void)didEncounterIntermediateError:(id)a3 error:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002C13FC;
  v8[3] = &unk_10050E160;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)didEncounterError:(id)a3 error:(id)a4 analysisInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1002C14F8;
  v15[3] = &unk_10050DC68;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)didCloseConnection:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002C15B0;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)didReceiveAceObject:(id)a3 object:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002C18A4;
  block[3] = &unk_10050DCB8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)didReceiveObject:(id)a3 object:(id)a4
{
  id v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    id v6 = "-[ADSessionRemoteServer didReceiveObject:object:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }
}

- (void)didOpenConnectionType:(id)a3 type:(id)a4 routeId:(id)a5 delay:(double)a6 method:(id)a7
{
  id v12 = (SNConnection *)a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = +[AFDiagnostics sharedDiagnostics];
  objc_msgSend(v16, "logConnectionOpenWithConnectionType:", objc_msgSend(v13, "diagnosticConnectionType"));

  if (self->_siriNetworkServerConnection == v12)
  {
    id v18 = [(SNConnection *)v12 connectionInfo];
    CFStringRef v19 = [v18 connectionPolicy];
    id v17 = [v19 policyId];

    __int16 v20 = [(ADSession *)self _currentConnectionType];
    LODWORD(v19) = [v20 isEdge];

    if (v19) {
      [(ADSessionRemoteServer *)self _adjustAceHeaderTimeout:1];
    }
  }
  else
  {
    id v17 = 0;
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002C1CD0;
  block[3] = &unk_10050A118;
  block[4] = self;
  dispatch_time_t v37 = v12;
  id v22 = v13;
  id v38 = v22;
  id v23 = v17;
  id v39 = v23;
  id v24 = v14;
  double v42 = a6;
  id v40 = v24;
  id v41 = v15;
  id v25 = v15;
  __int16 v26 = v12;
  dispatch_async(queue, block);
  CFStringRef v27 = +[AFAnalytics sharedAnalytics];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1002C1D68;
  v31[3] = &unk_10050A140;
  id v32 = v23;
  id v33 = v24;
  double v35 = a6;
  id v34 = v22;
  id v28 = v22;
  id v29 = v24;
  id v30 = v23;
  [v27 logEventWithType:901 contextProvider:v31];
}

- (void)willStartConnection:(id)a3 with:(id)a4
{
  id v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    id v6 = "-[ADSessionRemoteServer willStartConnection:with:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }
}

- (void)willStartConnection:(id)a3 type:(id)a4
{
  id v5 = a4;
  id v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v13 = "-[ADSessionRemoteServer willStartConnection:type:]";
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s connectionType=%@", buf, 0x16u);
  }
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1002C2024;
  v9[3] = &unk_10050E160;
  id v10 = v5;
  CFStringRef v11 = self;
  id v8 = v5;
  dispatch_async(queue, v9);
}

- (void)_siriConnection:(id)a3 didEncounterIntermediateError:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v6)
  {
    [(ADSessionRemoteServer *)self _generateAWDMetricsForConnectionError:v6];
    id v7 = [(ADSession *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(ADSession *)self delegate];
      [v9 assistantSession:self receivedIntermediateError:v6];
    }
  }
}

- (void)siriConnection:(id)a3 didEncounterIntermediateError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002C2208;
  block[3] = &unk_10050DCB8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)_siriConnection:(id)a3 siriNetworkConnection:(id)a4 didEncounterError:(id)a5 siriCoreAnalysisInfo:(id)a6 siriNetworkAnalysisInfo:(id)a7
{
  id v12 = (SiriCoreSiriConnection *)a3;
  id v13 = (SNConnection *)a4;
  __int16 v14 = (NSString *)a5;
  id v15 = a6;
  id v16 = a7;
  if (self->_siriNetworkEnablementExperimentActivated)
  {
    if (self->_siriNetworkServerConnection == v13)
    {
      id v17 = (void *)AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
      {
        id v18 = v17;
        [v16 connectionURL];
        id v94 = v15;
        v20 = CFStringRef v19 = v12;
        if ([v16 wwanPreferred]) {
          CFStringRef v21 = @"YES";
        }
        else {
          CFStringRef v21 = @"NO";
        }
        id v22 = [v16 connectionType];
        *(_DWORD *)buf = 136316418;
        v109 = "-[ADSessionRemoteServer _siriConnection:siriNetworkConnection:didEncounterError:siriCoreAnalysisInfo:siri"
               "NetworkAnalysisInfo:]";
        __int16 v110 = 2114;
        __int16 v111 = v13;
        __int16 v112 = 2114;
        __int16 v113 = v14;
        __int16 v114 = 2112;
        __int16 v115 = v20;
        __int16 v116 = 2112;
        CFStringRef v117 = v21;
        __int16 v118 = 2112;
        __int16 v119 = v22;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s SiriNetwork %{public}@ %{public}@, URL (%@), WWAN Prefered (%@), connection Type (%@)", buf, 0x3Eu);

        id v12 = v19;
        id v15 = v94;
      }
      goto LABEL_10;
    }
  }
  else if (self->_serverConnection == v12)
  {
    id v23 = (void *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
    {
      loga = v23;
      [v15 connectionURL];
      v91 = v90 = v12;
      if ([v15 wwanPreferred]) {
        CFStringRef v92 = @"YES";
      }
      else {
        CFStringRef v92 = @"NO";
      }
      v93 = [v15 connectionType];
      *(_DWORD *)buf = 136316418;
      v109 = "-[ADSessionRemoteServer _siriConnection:siriNetworkConnection:didEncounterError:siriCoreAnalysisInfo:siriNe"
             "tworkAnalysisInfo:]";
      __int16 v110 = 2114;
      __int16 v111 = v90;
      __int16 v112 = 2114;
      __int16 v113 = v14;
      __int16 v114 = 2112;
      __int16 v115 = v91;
      __int16 v116 = 2112;
      CFStringRef v117 = v92;
      __int16 v118 = 2112;
      __int16 v119 = v93;
      _os_log_error_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_ERROR, "%s SiriCore %{public}@ %{public}@, URL (%@), WWAN Prefered (%@), connection Type (%@)", buf, 0x3Eu);

      id v12 = v90;
    }
LABEL_10:
    long long v100 = v12;
    if (!AFIsInternalInstall())
    {
LABEL_37:
      unsigned int v42 = [(ADSessionRemoteServer *)self _connectionErrorIsTimeout:v14];
      id v43 = [(ADSessionRemoteServer *)self _generateAnalyticsContextWithError:v14];
      v103[0] = _NSConcreteStackBlock;
      v103[1] = 3221225472;
      v103[2] = sub_1002C2F50;
      v103[3] = &unk_10050A168;
      id v96 = v15;
      id v104 = v96;
      id v98 = v43;
      id v105 = v98;
      id v97 = v16;
      id v106 = v97;
      long long v107 = self;
      os_log_t log = objc_retainBlock(v103);
      uint64_t v44 = [(ADSession *)self state];
      id v45 = [(ADSession *)self delegate];
      id v46 = v45;
      if (v44 < 5 || (v42 & 1) != 0)
      {
        [v45 updateConnectionDidFailAggdMetrics];

        BOOL siriNetworkEnablementExperimentActivated = self->_siriNetworkEnablementExperimentActivated;
        id v51 = [(ADSession *)self delegate];
        if (siriNetworkEnablementExperimentActivated) {
          [(ADSession *)self _currentSNConnectionType];
        }
        else {
        double v52 = [(ADSession *)self _currentConnectionType];
        }
        objc_msgSend(v51, "updateConnectionSetConnectionType:", objc_msgSend(v52, "aggregatorConnectionType"));

        BOOL v47 = +[AFAnalytics sharedAnalytics];
        id v48 = v47;
        if (v42) {
          uint64_t v49 = 904;
        }
        else {
          uint64_t v49 = 906;
        }
      }
      else
      {
        [v45 updateConnectionDidDropAggdMetrics];

        BOOL v47 = +[AFAnalytics sharedAnalytics];
        id v48 = v47;
        uint64_t v49 = 905;
      }
      [v47 logEventWithType:v49 contextProvider:log];
      v99 = v13;

      if (self->_siriNetworkEnablementExperimentActivated)
      {
        id v53 = v16;
        long long v54 = [(ADSession *)self connectionMode];
        long long v55 = [(ADSession *)self _adSessionTypeString];
        unint64_t v56 = [(ADSession *)self state];
        id v57 = v15;
        if (v56 > 0xB) {
          CFStringRef v58 = @"unknown";
        }
        else {
          CFStringRef v58 = *(&off_100507798 + v56);
        }
        id v63 = v58;
        v64 = +[SNNetworkAnalytics sessionConnectionFailedError:v14 connectionMode:v54 sessionType:v55 sessionState:v63 dormant:[(ADSession *)self dormant] connectionAnalysisInfo:v97];

        if (!v64)
        {
LABEL_57:
          id v15 = v57;

          id v16 = v53;
          if (v14) {
            [(ADSessionRemoteServer *)self _generateAWDMetricsForConnectionError:v14];
          }
          id v13 = v99;
          if ([(ADSessionRemoteServer *)self _connectionErrorSuggestsConnectionPolicyReset:v14])
          {
            __int16 v68 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              v109 = "-[ADSessionRemoteServer _siriConnection:siriNetworkConnection:didEncounterError:siriCoreAnalysisInf"
                     "o:siriNetworkAnalysisInfo:]";
              _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_INFO, "%s Error suggests bad connection policy; reverting to factory policy.",
                buf,
                0xCu);
            }
            unsigned int v69 = [(ADSession *)self _account];
            [v69 setConnectionPolicy:0];

            __int16 v70 = [(ADSession *)self _account];
            [v70 setConnectionPolicyDate:0];

            v71 = [(ADSession *)self _account];
            [v71 setConnectionPolicyHostname:0];

            __int16 v72 = [(ADSession *)self _account];
            [v72 save];

            [(ADSessionRemoteServer *)self _resetConnectionPolicyBlacklisting];
          }
          [(ADSessionRemoteServer *)self _updateConnectionPolicyFailureCount:v14];
          if ([(ADSessionRemoteServer *)self _connectionErrorIsRedirect:v14]
            && AFIsInternalInstall())
          {
            id v95 = v15;
            BOOL v73 = self->_siriNetworkEnablementExperimentActivated;
            id v74 = [(NSString *)v14 userInfo];
            v75 = v74;
            v76 = &SiriCoreSiriConnectionHTTPRedirectValueKey;
            if (v73) {
              v76 = &SiriNetworkBackgroundConnectionHTTPRedirectValueKey;
            }
            unsigned int v77 = [v74 objectForKey:*v76];

            v78 = self->_currentConnectionHostname;
            v79 = +[ADPreferences sharedPreferences];
            if (v77)
            {
              if (([(SNConnection *)v77 isEqualToString:v78] & 1) == 0)
              {
                v80 = [v79 redirectForServerURLString:v77];

                if (!v80)
                {
                  id v87 = AFSiriLogContextSession;
                  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 136315650;
                    v109 = "-[ADSessionRemoteServer _siriConnection:siriNetworkConnection:didEncounterError:siriCoreAnaly"
                           "sisInfo:siriNetworkAnalysisInfo:]";
                    __int16 v110 = 2112;
                    __int16 v111 = v77;
                    __int16 v112 = 2112;
                    __int16 v113 = v78;
                    _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_INFO, "%s Got redirect %@ for %@", buf, 0x20u);
                  }
                  [v79 setRedirect:v77 forServerURLString:v78];
                  [v79 synchronize];

                  id v15 = v95;
                  goto LABEL_89;
                }
              }
            }
            id v81 = AFSiriLogContextSession;
            if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              v109 = "-[ADSessionRemoteServer _siriConnection:siriNetworkConnection:didEncounterError:siriCoreAnalysisInf"
                     "o:siriNetworkAnalysisInfo:]";
              __int16 v110 = 2114;
              __int16 v111 = v77;
              __int16 v112 = 2114;
              __int16 v113 = v78;
              _os_log_error_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "%s Ignoring redirect %{public}@ for %{public}@", buf, 0x20u);
            }

            id v15 = v95;
          }
          if (v14 && ![(NSString *)v14 ad_isRetryableConnectionError]
            || self->_isAttemptingRetry
            && !-[NSString ad_isStricterRetryableConnectionError](v14, "ad_isStricterRetryableConnectionError")|| !-[ADSessionRemoteServer _shouldRetry](self, "_shouldRetry")|| -[ADSession state](self, "state") >= 11&& (-[ADSession delegate](self, "delegate"), id v82 = objc_claimAutoreleasedReturnValue(), v83 = [v82 assistantSessionShouldAttemptRetry:self], v82, !v83))
          {
            id v84 = AFSiriLogContextSession;
            if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              v109 = "-[ADSessionRemoteServer _siriConnection:siriNetworkConnection:didEncounterError:siriCoreAnalysisInf"
                     "o:siriNetworkAnalysisInfo:]";
              _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_INFO, "%s No retrying", buf, 0xCu);
            }
            id v12 = v100;
            if (self->_siriNetworkEnablementExperimentActivated) {
              [(ADSessionRemoteServer *)self _siriNetworkManager];
            }
            else {
            id v85 = [(ADSessionRemoteServer *)self _networkManager];
            }
            v86 = v98;
            [v85 releaseWiFiAssertion];

            [(ADSession *)self _clearLimbo];
            [(ADSessionRemoteServer *)self _resetServerConnection];
            [(ADSessionRemoteServer *)self _informDelegateOfError:v14];
LABEL_95:

            goto LABEL_96;
          }
LABEL_89:
          v88 = AFSiriLogContextSession;
          if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v109 = "-[ADSessionRemoteServer _siriConnection:siriNetworkConnection:didEncounterError:siriCoreAnalysisInfo:"
                   "siriNetworkAnalysisInfo:]";
            _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_INFO, "%s Retrying", buf, 0xCu);
          }
          id v12 = v100;
          if (self->_siriNetworkEnablementExperimentActivated)
          {
            [(ADSessionRemoteServer *)self _retrySiriNetworkForFailedConnection:v99 siriNetworkAnalysisInfo:v97 onError:v14];
          }
          else
          {
            v89 = [v96 connectionType];
            [(ADSessionRemoteServer *)self _retryForFailedConnection:v100 withType:v89 onError:v14];
          }
          v86 = v98;
          goto LABEL_95;
        }
        v65 = +[SNNetworkAnalytics sharedSNNetworkAnalytics];
      }
      else
      {
        id v53 = v16;
        __int16 v59 = [(ADSession *)self connectionMode];
        __int16 v60 = [(ADSession *)self _adSessionTypeString];
        unint64_t v61 = [(ADSession *)self state];
        id v57 = v15;
        if (v61 > 0xB) {
          __int16 v62 = @"unknown";
        }
        else {
          __int16 v62 = *(&off_100507798 + v61);
        }
        unsigned int v66 = v62;
        v64 = +[SiriCoreNetworkingAnalytics sessionConnectionFailedError:v14 connectionMode:v59 sessionType:v60 sessionState:v66 dormant:[(ADSession *)self dormant] analysisInfo:v96];

        v65 = +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics];
      }
      v67 = v65;
      [v65 logSessionConnectionFailed:v64];

      goto LABEL_57;
    }
    id v24 = (char *)[(NSString *)v14 code];
    id v25 = [(ADSession *)self _account];
    __int16 v26 = [v25 predefinedServer];

    CFStringRef v27 = [(NSString *)v14 domain];
    if ([v27 isEqualToString:kCFErrorDomainCFNetwork])
    {
      if ((unint64_t)(v24 - 1) < 2)
      {

LABEL_16:
        if (v26)
        {
LABEL_36:

          goto LABEL_37;
        }
        id v28 = AFSiriLogContextSession;
        if (!os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO)) {
          goto LABEL_32;
        }
        *(_DWORD *)buf = 136315138;
        v109 = "-[ADSessionRemoteServer _siriConnection:siriNetworkConnection:didEncounterError:siriCoreAnalysisInfo:siri"
               "NetworkAnalysisInfo:]";
        id v29 = "%s Not using a predefined server.";
        id v30 = v28;
        uint32_t v31 = 12;
        goto LABEL_31;
      }

      if (v24 == (char *)-1003) {
        goto LABEL_16;
      }
    }
    else
    {
    }
    id v32 = v15;
    id v33 = [(NSString *)v14 domain];
    unsigned int v34 = [v33 isEqualToString:SiriCoreSiriConnectionErrorDomain];

    if (v34 && v24 == (char *)16)
    {
      double v35 = [(NSString *)v14 userInfo];
      __int16 v36 = [v35 objectForKey:NSUnderlyingErrorKey];

      dispatch_time_t v37 = [v36 domain];
      if ([v37 isEqualToString:kNWErrorDomainDNS])
      {
        id v38 = (char *)[v36 code];

        id v39 = v38 + 0x10000;
        id v15 = v32;
        if (v39 != (char *)-18 || v26) {
          goto LABEL_35;
        }
        id v40 = AFSiriLogContextSession;
        if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v109 = "-[ADSessionRemoteServer _siriConnection:siriNetworkConnection:didEncounterError:siriCoreAnalysisInfo:si"
                 "riNetworkAnalysisInfo:]";
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "%s Server Unreachable", buf, 0xCu);
        }
        +[NSError errorWithDomain:kAFAssistantErrorDomain code:14 userInfo:0];
        dispatch_time_t v37 = v14;
        __int16 v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v15 = v32;
      }

LABEL_35:
      goto LABEL_36;
    }
    id v15 = v32;
    if (![(NSString *)v14 ad_isUnreachableError] || v26) {
      goto LABEL_36;
    }
    id v41 = AFSiriLogContextSession;
    if (!os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
LABEL_32:
      +[NSError errorWithDomain:kAFAssistantErrorDomain code:14 userInfo:0];
      __int16 v36 = v14;
      __int16 v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_35;
    }
    *(_DWORD *)buf = 136315394;
    v109 = "-[ADSessionRemoteServer _siriConnection:siriNetworkConnection:didEncounterError:siriCoreAnalysisInfo:siriNetw"
           "orkAnalysisInfo:]";
    __int16 v110 = 2112;
    __int16 v111 = (SNConnection *)v14;
    id v29 = "%s Server Unreachable: %@";
    id v30 = v41;
    uint32_t v31 = 22;
LABEL_31:
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, v29, buf, v31);
    goto LABEL_32;
  }
LABEL_96:
}

- (void)_siriConnection:(id)a3 didEncounterError:(id)a4 analysisInfo:(id)a5
{
}

- (void)siriConnection:(id)a3 didEncounterError:(id)a4 analysisInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1002C3350;
  v15[3] = &unk_10050DC68;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)siriConnectionDidClose:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002C3400;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)siriConnection:(id)a3 didReceiveAceObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002C36EC;
  block[3] = &unk_10050DCB8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)siriConnection:(id)a3 didOpenWithConnectionType:(id)a4 routeId:(id)a5 delay:(double)a6 method:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = +[AFDiagnostics sharedDiagnostics];
  objc_msgSend(v16, "logConnectionOpenWithConnectionType:", objc_msgSend(v13, "diagnosticConnectionType"));

  if (objc_opt_respondsToSelector())
  {
    id v17 = [v12 connectionPolicy];
    id v18 = [v17 policyId];

    CFStringRef v19 = [(ADSession *)self _currentConnectionType];
    unsigned int v20 = [v19 isEdge];

    if (v20) {
      [(ADSessionRemoteServer *)self _adjustAceHeaderTimeout:1];
    }
  }
  else
  {
    id v18 = 0;
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002C3A60;
  block[3] = &unk_10050A118;
  block[4] = self;
  id v37 = v12;
  id v22 = v13;
  id v38 = v22;
  id v23 = v18;
  id v39 = v23;
  id v24 = v14;
  double v42 = a6;
  id v40 = v24;
  id v41 = v15;
  id v25 = v15;
  id v26 = v12;
  dispatch_async(queue, block);
  CFStringRef v27 = +[AFAnalytics sharedAnalytics];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1002C3AF8;
  v31[3] = &unk_10050A140;
  id v32 = v23;
  id v33 = v24;
  double v35 = a6;
  id v34 = v22;
  id v28 = v22;
  id v29 = v24;
  id v30 = v23;
  [v27 logEventWithType:901 contextProvider:v31];
}

- (void)siriConnection:(id)a3 willStartWithConnectionType:(id)a4
{
  id v5 = a4;
  id v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v13 = "-[ADSessionRemoteServer siriConnection:willStartWithConnectionType:]";
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s connectionType=%@", buf, 0x16u);
  }
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1002C3D10;
  v9[3] = &unk_10050E160;
  id v10 = v5;
  CFStringRef v11 = self;
  id v8 = v5;
  dispatch_async(queue, v9);
}

- (void)_cancelSynchronously:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_siriNetworkEnablementExperimentActivated)
  {
    id v5 = [(ADSessionRemoteServer *)self _siriNetworkManager];
    [v5 releaseWiFiAssertion];

    id v6 = SNNetworkManager;
    p_dormancySuspendAssertion = &self->_dormancySuspendAssertion;
  }
  else
  {
    id v8 = [(ADSessionRemoteServer *)self _networkManager];
    [v8 releaseWiFiAssertion];

    id v6 = SiriCoreNetworkManager;
    p_dormancySuspendAssertion = self->_dormancySuspendAssertion;
  }
  [v6 releaseDormancySuspendAssertion:p_dormancySuspendAssertion];
  self->_dormancySuspendAssertion = 0;
  v10.receiver = self;
  v10.super_class = (Class)ADSessionRemoteServer;
  [(ADSession *)&v10 _cancelSynchronously:v3];
  retryManager = self->_retryManager;
  self->_retryManager = 0;
}

- (void)_startSiriNetworkConnectionPreferringWWAN:(BOOL)a3 skipPeer:(BOOL)a4 skipPeerError:(id)a5 useWiFiHint:(BOOL)a6 forceReconnect:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a4;
  BOOL v10 = a3;
  id v12 = a5;
  id v13 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v39 = "-[ADSessionRemoteServer _startSiriNetworkConnectionPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Starting connection.", buf, 0xCu);
  }
  __int16 v14 = [(ADSessionRemoteServer *)self _connectionURLHostname];
  if ([v14 length])
  {
    [(ADSession *)self _requestForAssistantData];
    id v15 = +[NSURL URLWithString:v14];
    id v16 = [v15 host];

    id v17 = [(ADSessionRemoteServer *)self _siriNetworkManager];
    [v17 startMonitoringNetworkForHost:v16];

    id v18 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v39 = "-[ADSessionRemoteServer _startSiriNetworkConnectionPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
      __int16 v40 = 2112;
      id v41 = v16;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s Starting monitoring %@", buf, 0x16u);
    }
    CFStringRef v19 = [(ADSessionRemoteServer *)self _connectionInfoWithPreferWWAN:v10 skipPeer:v9 skipPeerError:v12 useWiFiHint:v8 forceReconnect:v7];
    id v20 = objc_alloc((Class)SNConnection);
    CFStringRef v21 = (id)qword_100585E48;
    id v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v23 = dispatch_queue_attr_make_with_qos_class(v22, QOS_CLASS_UNSPECIFIED, 0);

    dispatch_queue_t v24 = dispatch_queue_create_with_target_V2("SiriNetworkConnection", v23, v21);
    id v25 = (SNConnection *)[v20 initWithConnectionInfo:v19 connectionQueue:v24];
    siriNetworkServerConnection = self->_siriNetworkServerConnection;
    self->_siriNetworkServerConnection = v25;

    [(SNConnection *)self->_siriNetworkServerConnection setDelegate:self];
    if (self->_hasActiveRequest)
    {
      CFStringRef v27 = [(ADSession *)self delegate];
      unsigned int v28 = [v27 assistantSessionShouldPrewarmConnetion:self];

      if (v28) {
        [(SNConnection *)self->_siriNetworkServerConnection setSendPings:1];
      }
    }
    id v29 = [(SNConnection *)self->_siriNetworkServerConnection start];
    id v30 = +[AFAnalytics sharedAnalytics];
    [v30 logEventWithType:912 context:0];

    if (![(ADSessionRemoteServer *)self _authenticationDisabled])
    {
      uint32_t v31 = [(ADSessionRemoteServer *)self _cachedValidationData];
      if (!v31 || (BOOL forceValidationRefresh = self->_forceValidationRefresh, v31, forceValidationRefresh))
      {
        id v33 = AFSiriLogContextSession;
        if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          id v39 = "-[ADSessionRemoteServer _startSiriNetworkConnectionPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "%s No cached validation data beginning eager auth", buf, 0xCu);
        }
        id v34 = [(ADSessionRemoteServer *)self _cachedServerCertificate];
        double v35 = [(ADSessionRemoteServer *)self _authenticator];
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_1002C42C0;
        v37[3] = &unk_100509FD8;
        v37[4] = self;
        [v35 prepareWithCertificateData:v34 completion:v37];
      }
    }
    [(ADSession *)self setState:3];
  }
  else
  {
    id v16 = +[AFError errorWithCode:25];
    [(ADSessionRemoteServer *)self _informDelegateOfError:v16];
    __int16 v36 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v39 = "-[ADSessionRemoteServer _startSiriNetworkConnectionPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
      _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%s Hostname invalid in configuration", buf, 0xCu);
    }
  }
}

- (void)_startSiriCoreConnectionPreferringWWAN:(BOOL)a3 skipPeer:(BOOL)a4 skipPeerError:(id)a5 useWiFiHint:(BOOL)a6 forceReconnect:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a4;
  BOOL v10 = a3;
  id v12 = a5;
  id v13 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v62 = "-[ADSessionRemoteServer _startSiriCoreConnectionPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Starting connection.", buf, 0xCu);
  }
  __int16 v14 = [(ADSession *)self _account];
  id v15 = [v14 hostname];

  if ([v15 length])
  {
    [(ADSession *)self _requestForAssistantData];
    id v16 = [(ADSessionRemoteServer *)self _networkManager];
    id v17 = +[NSURL URLWithString:v15];
    id v18 = [v17 host];
    [v16 startMonitoringNetworkForHost:v18];

    CFStringRef v19 = [(ADSessionRemoteServer *)self _serverConnection];
    id v20 = [(ADSession *)self _account];
    CFStringRef v21 = [v20 aceHost];
    [v19 setAceHost:v21];

    __int16 v59 = [v20 connectionPolicy];
    CFStringRef v58 = [v20 connectionPolicyDate];
    id v57 = [v20 connectionPolicyHostname];
    if (([v20 needsDestruction] & 1) != 0
      || [v20 needsCreation])
    {
      id v22 = (void *)AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
      {
        id v23 = v22;
        unsigned int v24 = [v20 needsDestruction];
        CFStringRef v25 = @"needs creation";
        if (v24) {
          CFStringRef v25 = @"is being destroyed";
        }
        *(_DWORD *)buf = 136315394;
        __int16 v62 = "-[ADSessionRemoteServer _startSiriCoreConnectionPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
        __int16 v63 = 2112;
        CFStringRef v64 = v25;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s Account %@ use default connection policy and clear our dns settings.", buf, 0x16u);
      }
      [(ADSessionRemoteServer *)self _resetConnectionPolicyBlacklisting];
      goto LABEL_11;
    }
    if (v59 && v58 && v57)
    {
      id v56 = [objc_alloc((Class)SAConnectionPolicy) initWithDictionary:v59];
      id v34 = [v56 timeToLive];
      id v53 = v34;
      if (v34)
      {
        [v34 doubleValue];
        double v36 = fmin(v35, 604800.0);
      }
      else
      {
        double v36 = 604800.0;
      }
      id v39 = [v58 dateByAddingTimeInterval:v36];
      [(__CFString *)v39 timeIntervalSinceNow];
      if (v40 < 0.0)
      {
        os_log_t log = AFSiriLogContextSession;
        if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          __int16 v62 = "-[ADSessionRemoteServer _startSiriCoreConnectionPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
          __int16 v63 = 2112;
          CFStringRef v64 = v39;
          _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "%s Connection policy expired at %@; ignoring it",
            buf,
            0x16u);
        }

        [(ADSessionRemoteServer *)self _resetConnectionPolicyBlacklisting];
        id v56 = 0;
      }
      os_log_t loga = [v20 hostname];
      double v52 = v39;
      if (-[__CFString isEqualToString:](v57, "isEqualToString:"))
      {
        if (v56)
        {
          os_log_t v50 = +[NSDate date];
          uint64_t v49 = [v20 connectionPolicyFirstFailureDate];
          if (v49)
          {
            [v50 timeIntervalSinceDate:v49];
            if (v41 >= 86400.0)
            {
              double v42 = AFSiriLogContextSession;
              if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315138;
                __int16 v62 = "-[ADSessionRemoteServer _startSiriCoreConnectionPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:"
                      "forceReconnect:]";
                _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "%s Connection policy blacklisting timed out", buf, 0xCu);
              }
              [(ADSessionRemoteServer *)self _resetConnectionPolicyBlacklisting];
            }
          }
          unsigned int v43 = [v20 hasConnectionPolicyFailed];
          BOOL v47 = AFSiriLogContextSession;
          BOOL v44 = os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_DEBUG);
          unsigned int v48 = v43;
          if (v43)
          {
            if (v44)
            {
              *(_DWORD *)buf = 136315138;
              __int16 v62 = "-[ADSessionRemoteServer _startSiriCoreConnectionPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
              _os_log_debug_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEBUG, "%s Not using connection policy", buf, 0xCu);
            }
            objc_msgSend(v19, "setConnectionPolicy:", 0, v47);
            id v45 = v56;
          }
          else
          {
            if (v44)
            {
              *(_DWORD *)buf = 136315138;
              __int16 v62 = "-[ADSessionRemoteServer _startSiriCoreConnectionPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
              _os_log_debug_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEBUG, "%s Connection policy in use", buf, 0xCu);
            }
            id v45 = v56;
            objc_msgSend(v19, "setConnectionPolicy:", v56, v47);
          }
          [v19 setImposePolicyBan:v48];

LABEL_64:
          goto LABEL_11;
        }
      }
      else
      {
        id v51 = AFSiriLogContextSession;
        if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          __int16 v62 = "-[ADSessionRemoteServer _startSiriCoreConnectionPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
          __int16 v63 = 2112;
          CFStringRef v64 = v57;
          __int16 v65 = 2112;
          os_log_t v66 = loga;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "%s Connection policy hostname %@ does not match account hostname %@; ignoring policy",
            buf,
            0x20u);
        }
      }
      id v46 = AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        __int16 v62 = "-[ADSessionRemoteServer _startSiriCoreConnectionPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
        _os_log_debug_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "%s Connection policy not in use", buf, 0xCu);
      }
      [v19 setConnectionPolicy:0];
      goto LABEL_64;
    }
    if (v59)
    {
      if (v58)
      {
        if (v57) {
          goto LABEL_11;
        }
        id v37 = AFSiriLogContextSession;
        if (!os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO)) {
          goto LABEL_11;
        }
        *(_DWORD *)buf = 136315138;
        __int16 v62 = "-[ADSessionRemoteServer _startSiriCoreConnectionPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
        id v38 = "%s Connection policy has no hostname; ignoring it";
        goto LABEL_59;
      }
      id v37 = AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        __int16 v62 = "-[ADSessionRemoteServer _startSiriCoreConnectionPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
        id v38 = "%s Connection policy has no expiration date; ignoring it";
        goto LABEL_59;
      }
    }
    else
    {
      id v37 = AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        __int16 v62 = "-[ADSessionRemoteServer _startSiriCoreConnectionPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
        id v38 = "%s No custom connection policy; using default";
LABEL_59:
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, v38, buf, 0xCu);
      }
    }
LABEL_11:
    id v26 = [(ADSession *)self languageCode];
    [v19 setLanguageCode:v26];

    [v19 setTimeout:self->_aceHeaderTimeout];
    [v19 setPrefersWWAN:v10];
    [v19 setSkipPeer:v9];
    [v19 setSkipPeerError:v12];
    if (v8) {
      [v19 setUseWiFiHint:1];
    }
    [v19 setForceReconnect:v7];
    [v19 start];
    CFStringRef v27 = +[AFAnalytics sharedAnalytics];
    [v27 logEventWithType:912 context:0];

    if (![(ADSessionRemoteServer *)self _authenticationDisabled])
    {
      unsigned int v28 = [(ADSessionRemoteServer *)self _cachedValidationData];
      if (!v28 || (BOOL forceValidationRefresh = self->_forceValidationRefresh, v28, forceValidationRefresh))
      {
        id v30 = AFSiriLogContextSession;
        if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          __int16 v62 = "-[ADSessionRemoteServer _startSiriCoreConnectionPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "%s No cached validation data beginning eager auth", buf, 0xCu);
        }
        uint32_t v31 = [(ADSessionRemoteServer *)self _cachedServerCertificate];
        id v32 = [(ADSessionRemoteServer *)self _authenticator];
        v60[0] = _NSConcreteStackBlock;
        v60[1] = 3221225472;
        v60[2] = sub_1002C4CAC;
        v60[3] = &unk_100509FD8;
        v60[4] = self;
        [v32 prepareWithCertificateData:v31 completion:v60];
      }
    }
    [(ADSession *)self setState:3];

    goto LABEL_22;
  }
  CFStringRef v19 = +[AFError errorWithCode:25];
  [(ADSessionRemoteServer *)self _informDelegateOfError:v19];
  id v33 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v62 = "-[ADSessionRemoteServer _startSiriCoreConnectionPreferringWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
    _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%s Hostname invalid in configuration", buf, 0xCu);
  }
LABEL_22:
}

- (void)_startConnectionPreferringWWAN:(BOOL)a3 skipPeer:(BOOL)a4 skipPeerError:(id)a5 useWiFiHint:(BOOL)a6 forceReconnect:(BOOL)a7
{
  if (self->_siriNetworkEnablementExperimentActivated) {
    [(ADSessionRemoteServer *)self _startSiriNetworkConnectionPreferringWWAN:a3 skipPeer:a4 skipPeerError:a5 useWiFiHint:a6 forceReconnect:a7];
  }
  else {
    [(ADSessionRemoteServer *)self _startSiriCoreConnectionPreferringWWAN:a3 skipPeer:a4 skipPeerError:a5 useWiFiHint:a6 forceReconnect:a7];
  }
}

- (void)setHasActiveRequest:(BOOL)a3
{
  if (self->_hasActiveRequest != a3)
  {
    self->_BOOL hasActiveRequest = a3;
    id v5 = [(ADSession *)self delegate];
    unsigned int v6 = [v5 assistantSessionShouldPrewarmConnetion:self];

    if (self->_siriNetworkEnablementExperimentActivated) {
      [(ADSessionRemoteServer *)self _siriNetworkServerConnection];
    }
    else {
    BOOL v7 = [(ADSessionRemoteServer *)self _serverConnection];
    }
    BOOL v8 = v7;
    if (self->_hasActiveRequest) {
      uint64_t v9 = v6;
    }
    else {
      uint64_t v9 = 0;
    }
    [v7 setSendPings:v9];

    BOOL hasActiveRequest = self->_hasActiveRequest;
    CFStringRef v11 = +[NSProcessInfo processInfo];
    [v11 systemUptime];
    if (hasActiveRequest)
    {
      self->_requestStartTime = v12;

      [(ADSession *)self setDormant:0];
      if (!v6)
      {
LABEL_21:
        self->_isRequestRetry = 0;
        [(ADSession *)self setCanHandleRequest:1];
        pairedWatchUniqueId = self->_pairedWatchUniqueId;
        self->_pairedWatchUniqueId = 0;

        goto LABEL_22;
      }
      if (self->_siriNetworkEnablementExperimentActivated) {
        id v13 = (id *)SNNetworkManager_ptr;
      }
      else {
        id v13 = (id *)SiriCoreNetworkManager_ptr;
      }
      [*v13 acquireDormancySuspendAssertion:&self->_dormancySuspendAssertion];
      __int16 v14 = +[SiriCoreNetworkActivityTracing sharedNetworkActivityTracing];
      [v14 networkActivityStart:1 activate:1];

      id v15 = +[SNNetworkActivityTracing sharedInstance];
      [v15 networkActivityStart:1 activate:1 completion:0];
    }
    else
    {
      self->_requestEndTime = v12;

      p_dormancySuspendAssertion = &self->_dormancySuspendAssertion;
      if (self->_siriNetworkEnablementExperimentActivated)
      {
        id v17 = (id *)SNNetworkManager_ptr;
        id v18 = &self->_dormancySuspendAssertion;
      }
      else
      {
        id v18 = (void **)*p_dormancySuspendAssertion;
        id v17 = (id *)SiriCoreNetworkManager_ptr;
      }
      [*v17 releaseDormancySuspendAssertion:v18];
      void *p_dormancySuspendAssertion = 0;
      if (self->_checkForWiFiTransitionOnRequestEnd)
      {
        self->_checkForWiFiTransitionOnRequestEnd = 0;
        [(ADSessionRemoteServer *)self _recheckForWiFiTransition];
      }
      [(ADSession *)self _setRequestId:0];
      CFStringRef v19 = +[SiriCoreNetworkActivityTracing sharedNetworkActivityTracing];
      [v19 networkActivityStop:5 withReason:1 andError:0];

      id v20 = +[SiriCoreNetworkActivityTracing sharedNetworkActivityTracing];
      [v20 networkActivityStop:6 withReason:1 andError:0];

      CFStringRef v21 = +[SNNetworkActivityTracing sharedInstance];
      [v21 networkActivityStop:5 withReason:1 andError:0 completion:0];

      id v15 = +[SNNetworkActivityTracing sharedInstance];
      [v15 networkActivityStop:6 withReason:1 andError:0 completion:0];
    }

    goto LABEL_21;
  }
LABEL_22:
  if (!a3)
  {
    [(ADSession *)self _clearSendBuffer];
    retryManager = self->_retryManager;
    [(ADRetryManager *)retryManager clearNakedObjects];
  }
}

- (id)_siriNetworkManager
{
  return +[SNNetworkManager sharedInstance];
}

- (id)_networkManager
{
  return +[SiriCoreNetworkManager sharedInstance];
}

- (BOOL)_connectionIsWWAN
{
  if (self->_siriNetworkEnablementExperimentActivated) {
    [(ADSession *)self _currentSNConnectionType];
  }
  else {
  id v2 = [(ADSession *)self _currentConnectionType];
  }
  unsigned __int8 v3 = [v2 isWWAN];

  return v3;
}

- (void)_resetServerConnectionSynchronously:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  [(ADSession *)self setState:0];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1002C54BC;
  v34[3] = &unk_10050A078;
  BOOL v36 = v4;
  id v7 = v6;
  v34[4] = self;
  id v35 = v7;
  BOOL v8 = objc_retainBlock(v34);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1002C55EC;
  v31[3] = &unk_10050A0A0;
  BOOL v33 = v4;
  uint64_t v9 = (void (**)(void))v7;
  void v31[4] = self;
  id v32 = v9;
  BOOL v10 = objc_retainBlock(v31);
  if (self->_siriNetworkEnablementExperimentActivated)
  {
    uint64_t v11 = 248;
    siriNetworkServerConnection = self->_siriNetworkServerConnection;
    if (siriNetworkServerConnection)
    {
      [(SNConnection *)siriNetworkServerConnection setDelegate:0];
      id v13 = self->_siriNetworkServerConnection;
      if (self->_isAttemptingRetry || self->_waitingForDelayedRetry)
      {
        ((void (*)(void *, SNConnection *, void))v10[2])(v10, v13, 0);
LABEL_10:
        id v15 = *(Class *)((char *)&self->super.super.isa + v11);
        *(Class *)((char *)&self->super.super.isa + v11) = 0;

        goto LABEL_13;
      }
      objc_initWeak(&location, self);
      dispatch_group_enter((dispatch_group_t)self->_metricsGroup);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      void v22[2] = sub_1002C5844;
      v22[3] = &unk_10050A0F0;
      id v20 = &v25;
      objc_copyWeak(&v25, &location);
      v22[4] = self;
      unsigned int v24 = v10;
      id v23 = v13;
      [(SNConnection *)v23 getSNConnectionMetrics:v4 completion:v22];

      CFStringRef v21 = v24;
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v11 = 240;
    serverConnection = self->_serverConnection;
    if (serverConnection)
    {
      [(SiriCoreSiriConnection *)serverConnection setDelegate:0];
      id v13 = self->_serverConnection;
      if (self->_isAttemptingRetry || self->_waitingForDelayedRetry)
      {
        ((void (*)(void *, SNConnection *, void))v8[2])(v8, v13, 0);
        goto LABEL_10;
      }
      objc_initWeak(&location, self);
      dispatch_group_enter((dispatch_group_t)self->_metricsGroup);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1002C571C;
      v26[3] = &unk_10050A0C8;
      id v20 = &v29;
      objc_copyWeak(&v29, &location);
      void v26[4] = self;
      unsigned int v28 = v8;
      CFStringRef v27 = v13;
      [(SNConnection *)v27 getConnectionMetricsSynchronously:v4 completion:v26];

      CFStringRef v21 = v28;
LABEL_16:

      objc_destroyWeak(v20);
      objc_destroyWeak(&location);
      goto LABEL_10;
    }
  }
  if (v9) {
    v9[2](v9);
  }
LABEL_13:
  [(ADSession *)self _setCurrentConnectionType:0];
  [(ADSession *)self _setSNCurrentConnectionType:0];
  currentConnectionURL = self->_currentConnectionURL;
  self->_currentConnectionURL = 0;

  currentConnectionHostname = self->_currentConnectionHostname;
  self->_currentConnectionHostname = 0;

  self->_prefersWWAN = 0;
  self->_skipPeer = 0;
  skipPeerError = self->_skipPeerError;
  self->_skipPeerError = 0;

  self->_forceReconnect = 0;
  [(ADAuthenticator *)self->_authenticator reset];
  self->_badCachedCertRetryCounter = 0;
  self->_certificateFailureCounter = 0;
  CFStringRef v19 = [(ADSession *)self delegate];
  [v19 assistantSessionConnectionDidReset:self];
}

- (void)_resetServerConnection
{
}

- (id)_connectionInfoWithPreferWWAN:(BOOL)a3 skipPeer:(BOOL)a4 skipPeerError:(id)a5 useWiFiHint:(BOOL)a6 forceReconnect:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v72 = a3;
  BOOL v73 = a4;
  id v10 = a5;
  uint64_t v11 = objc_opt_new();
  double v12 = [(ADSession *)self _account];
  v78 = [(ADSessionRemoteServer *)self _connectionURLHostname];
  uint64_t v13 = [v12 connectionPolicy];
  __int16 v14 = [v12 connectionPolicyDate];
  id v15 = [v12 connectionPolicyHostname];
  id v16 = [v12 aceHost];
  [v11 setAceHost:v16];

  BOOL v76 = v8;
  v75 = (void *)v13;
  unsigned int v77 = v15;
  BOOL v74 = v7;
  if (([v12 needsDestruction] & 1) == 0
    && ![v12 needsCreation])
  {
    if (!v13 || !v14 || !v15)
    {
      if (v13)
      {
        CFStringRef v21 = v14;
        if (v14)
        {
          if (v77) {
            goto LABEL_8;
          }
          double v52 = AFSiriLogContextSession;
          if (!os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO)) {
            goto LABEL_8;
          }
          *(_DWORD *)buf = 136315138;
          id v81 = "-[ADSessionRemoteServer _connectionInfoWithPreferWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
          id v53 = "%s Connection policy has no hostname; ignoring it";
        }
        else
        {
          double v52 = AFSiriLogContextSession;
          if (!os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO)) {
            goto LABEL_8;
          }
          *(_DWORD *)buf = 136315138;
          id v81 = "-[ADSessionRemoteServer _connectionInfoWithPreferWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
          id v53 = "%s Connection policy has no expiration date; ignoring it";
        }
      }
      else
      {
        CFStringRef v21 = v14;
        double v52 = AFSiriLogContextSession;
        if (!os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO)) {
          goto LABEL_8;
        }
        *(_DWORD *)buf = 136315138;
        id v81 = "-[ADSessionRemoteServer _connectionInfoWithPreferWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
        id v53 = "%s No custom connection policy; using default";
      }
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, v53, buf, 0xCu);
      goto LABEL_8;
    }
    id v48 = [objc_alloc((Class)SAConnectionPolicy) initWithDictionary:v13];
    uint64_t v49 = [v48 timeToLive];
    v71 = v49;
    if (v49)
    {
      [v49 doubleValue];
      double v51 = fmin(v50, 604800.0);
    }
    else
    {
      double v51 = 604800.0;
    }
    long long v54 = [v14 dateByAddingTimeInterval:v51];
    [(__CFString *)v54 timeIntervalSinceNow];
    if (v55 >= 0.0)
    {
      if ([(__CFString *)v15 isEqualToString:v78])
      {
        if (v48)
        {
          id v57 = +[NSDate date];
          [v12 connectionPolicyFirstFailureDate];
          v70 = __int16 v68 = v57;
          if (v70)
          {
            objc_msgSend(v57, "timeIntervalSinceDate:", v70, v57);
            if (v58 >= 86400.0)
            {
              __int16 v59 = AFSiriLogContextSession;
              if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315138;
                id v81 = "-[ADSessionRemoteServer _connectionInfoWithPreferWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
                _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "%s Connection policy blacklisting timed out", buf, 0xCu);
              }
              [(ADSessionRemoteServer *)self _resetConnectionPolicyBlacklisting];
            }
          }
          __int16 v60 = v14;
          id v61 = objc_msgSend(v12, "hasConnectionPolicyFailed", v68);
          __int16 v62 = AFSiriLogContextSession;
          BOOL v63 = os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_DEBUG);
          if (v61)
          {
            if (v63)
            {
              *(_DWORD *)buf = 136315138;
              id v81 = "-[ADSessionRemoteServer _connectionInfoWithPreferWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
              _os_log_debug_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEBUG, "%s Not using connection policy", buf, 0xCu);
            }
            CFStringRef v64 = v11;
            id v65 = 0;
          }
          else
          {
            if (v63)
            {
              *(_DWORD *)buf = 136315138;
              id v81 = "-[ADSessionRemoteServer _connectionInfoWithPreferWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
              _os_log_debug_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEBUG, "%s Connection policy in use", buf, 0xCu);
            }
            CFStringRef v64 = v11;
            id v65 = v48;
          }
          [v64 setConnectionPolicy:v65];
          [v11 setImposePolicyBan:v61];

          __int16 v14 = v60;
          goto LABEL_54;
        }
LABEL_51:
        v67 = AFSiriLogContextSession;
        if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          id v81 = "-[ADSessionRemoteServer _connectionInfoWithPreferWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
          _os_log_debug_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEBUG, "%s Connection policy not in use", buf, 0xCu);
        }
        [v11 setConnectionPolicy:0];
LABEL_54:
        CFStringRef v21 = v14;

        goto LABEL_8;
      }
    }
    else
    {
      id v56 = AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        id v81 = "-[ADSessionRemoteServer _connectionInfoWithPreferWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
        __int16 v82 = 2112;
        CFStringRef v83 = v54;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "%s Connection policy expired at %@; ignoring it",
          buf,
          0x16u);
      }

      [(ADSessionRemoteServer *)self _resetConnectionPolicyBlacklisting];
      if ([(__CFString *)v15 isEqualToString:v78]) {
        goto LABEL_51;
      }
      id v48 = 0;
    }
    os_log_t v66 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      id v81 = "-[ADSessionRemoteServer _connectionInfoWithPreferWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
      __int16 v82 = 2112;
      CFStringRef v83 = v15;
      __int16 v84 = 2112;
      id v85 = v78;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_INFO, "%s Connection policy hostname %@ does not match account hostname %@; ignoring policy",
        buf,
        0x20u);
    }

    goto LABEL_51;
  }
  id v17 = (void *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    id v18 = v17;
    unsigned int v19 = [v12 needsDestruction];
    CFStringRef v20 = @"needs creation";
    if (v19) {
      CFStringRef v20 = @"is being destroyed";
    }
    *(_DWORD *)buf = 136315394;
    id v81 = "-[ADSessionRemoteServer _connectionInfoWithPreferWWAN:skipPeer:skipPeerError:useWiFiHint:forceReconnect:]";
    __int16 v82 = 2112;
    CFStringRef v83 = v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s Account %@ use default connection policy and clear our dns settings.", buf, 0x16u);
  }
  CFStringRef v21 = v14;
  [(ADSessionRemoteServer *)self _resetConnectionPolicyBlacklisting];
LABEL_8:
  id v22 = [v11 connectionPolicy];
  id v23 = [v22 routes];

  if (!v23
    || ![v23 count]
    || ([v23 objectAtIndexedSubscript:0],
        unsigned int v24 = objc_claimAutoreleasedReturnValue(),
        [v24 host],
        id v25 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v26 = [v25 isEqualToString:v78],
        v25,
        v24,
        (v26 & 1) == 0))
  {
    CFStringRef v27 = objc_opt_new();
    unsigned int v28 = objc_opt_new();
    [v28 setRouteId:@"RouteId1"];
    [v28 setMptcp:&off_100523AE0];
    [v28 setPriority:1];
    [v28 setTimeout:&off_100523AF8];
    [v28 setHost:v78];
    [v11 setConnectionPolicyRoute:v28];
    v79 = v28;
    id v29 = +[NSArray arrayWithObjects:&v79 count:1];
    [v27 setRoutes:v29];

    id v30 = [v11 connectionPolicy];
    uint32_t v31 = [v30 policyId];
    [v27 setPolicyId:v31];

    id v32 = [v11 connectionPolicy];
    BOOL v33 = [v32 timeToLive];
    [v27 setTimeToLive:v33];

    id v34 = [v11 connectionPolicy];
    id v35 = [v34 enableTLS13];
    [v27 setEnableTLS13:v35];

    BOOL v36 = [v11 connectionPolicy];
    id v37 = [v36 enableTcpFastOpen];
    [v27 setEnableTcpFastOpen:v37];

    id v38 = [v11 connectionPolicy];
    id v39 = [v38 globalTimeout];
    [v27 setGlobalTimeout:v39];

    double v40 = [v11 connectionPolicy];
    double v41 = [v40 enableOptimisticDNS];
    [v27 setEnableOptimisticDNS:v41];

    [v11 setConnectionPolicy:v27];
    [v11 setImposePolicyBan:0];
  }
  double v42 = [(ADSession *)self languageCode];
  [v11 setLanguageCode:v42];

  [v11 setTimeout:self->_aceHeaderTimeout];
  [v11 setPrefersWWAN:v72];
  [v11 setSkipPeer:v73];
  [v11 setSkipPeerErrorReason:v10];

  [v11 setForceReconnect:v74];
  [v11 setProductTypePrefix:self->_productTypePrefix];
  [v11 setConnectionProtocolTechnology:1];
  unsigned int v43 = [(ADSession *)self _account];
  BOOL v44 = [v43 assistantIdentifier];
  [v11 setAssistantIdentifier:v44];

  id v45 = [(ADSession *)self _account];
  id v46 = [v45 peerAssistantIdentifier];
  [v11 setPeerAssistantIdentifier:v46];

  [v11 setPeerType:self->_peerType];
  [v11 setPeerVersion:self->_peerVersion];
  [v11 setUsesPeerManagedSync:self->_siriConnectionUsesPeerManagedSync];
  [v11 setUsesProxyConnection:AFIsNano()];
  if (AFIsInternalInstall()) {
    [v11 setDeviceIsInWalkaboutExperimentGroup:byte_100585E38];
  }
  if (v76) {
    [v11 setUseWiFiHint:1];
  }

  return v11;
}

- (id)_siriNetworkServerConnection
{
  siriNetworkServerConnection = self->_siriNetworkServerConnection;
  if (!siriNetworkServerConnection)
  {
    BOOL v4 = [(ADSessionRemoteServer *)self _connectionURLHostname];
    currentConnectionHostname = self->_currentConnectionHostname;
    self->_currentConnectionHostname = v4;

    id v6 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      peerType = self->_peerType;
      peerVersion = self->_peerVersion;
      int v20 = 136315650;
      CFStringRef v21 = "-[ADSessionRemoteServer _siriNetworkServerConnection]";
      __int16 v22 = 2112;
      id v23 = peerType;
      __int16 v24 = 2112;
      id v25 = peerVersion;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s peer type %@ peer version %@", (uint8_t *)&v20, 0x20u);
    }
    uint64_t v9 = [(ADSessionRemoteServer *)self _connectionInfoWithPreferWWAN:0 skipPeer:0 skipPeerError:0 useWiFiHint:0 forceReconnect:0];
    id v10 = objc_alloc((Class)SNConnection);
    uint64_t v11 = (id)qword_100585E48;
    double v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v13 = dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_UNSPECIFIED, 0);

    dispatch_queue_t v14 = dispatch_queue_create_with_target_V2("SiriNetworkConnection", v13, v11);
    id v15 = (SNConnection *)[v10 initWithConnectionInfo:v9 connectionQueue:v14];
    id v16 = self->_siriNetworkServerConnection;
    self->_siriNetworkServerConnection = v15;

    [(SNConnection *)self->_siriNetworkServerConnection setDelegate:self];
    if (self->_hasActiveRequest)
    {
      id v17 = [(ADSession *)self delegate];
      unsigned int v18 = [v17 assistantSessionShouldPrewarmConnetion:self];

      if (v18) {
        [(SNConnection *)self->_siriNetworkServerConnection setSendPings:1];
      }
    }

    siriNetworkServerConnection = self->_siriNetworkServerConnection;
  }
  return siriNetworkServerConnection;
}

- (id)_serverConnection
{
  if (!self->_serverConnection)
  {
    id v5 = [(ADSessionRemoteServer *)self _connectionURL];
    currentConnectionURL = self->_currentConnectionURL;
    self->_currentConnectionURL = v5;

    BOOL v7 = [(ADSessionRemoteServer *)self _connectionURLHostname];
    currentConnectionHostname = self->_currentConnectionHostname;
    self->_currentConnectionHostname = v7;

    uint64_t v9 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      peerType = self->_peerType;
      peerVersion = self->_peerVersion;
      int v27 = 136315650;
      unsigned int v28 = "-[ADSessionRemoteServer _serverConnection]";
      __int16 v29 = 2112;
      id v30 = peerType;
      __int16 v31 = 2112;
      id v32 = peerVersion;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s peer type %@ peer version %@", (uint8_t *)&v27, 0x20u);
    }
    id v12 = objc_alloc((Class)SiriCoreSiriConnection);
    uint64_t v13 = (id)qword_100585E48;
    dispatch_queue_t v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v15 = dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_UNSPECIFIED, 0);

    dispatch_queue_t v16 = dispatch_queue_create_with_target_V2("SiriCoreSiriConnection", v15, v13);
    id v17 = (SiriCoreSiriConnection *)[v12 initWithQueue:v16];
    serverConnection = self->_serverConnection;
    self->_serverConnection = v17;

    [(SiriCoreSiriConnection *)self->_serverConnection setPeerType:self->_peerType];
    [(SiriCoreSiriConnection *)self->_serverConnection setPeerVersion:self->_peerVersion];
    [(SiriCoreSiriConnection *)self->_serverConnection setPeerProviderClass:objc_opt_class()];
    [(SiriCoreSiriConnection *)self->_serverConnection setProductTypePrefix:self->_productTypePrefix];
    if (AFIsInternalInstall()) {
      [(SiriCoreSiriConnection *)self->_serverConnection setDeviceIsInWalkaboutExperimentGroup:byte_100585E38];
    }
    [(SiriCoreSiriConnection *)self->_serverConnection setSiriConnectionUsesPeerManagedSync:self->_siriConnectionUsesPeerManagedSync];
    [(SiriCoreSiriConnection *)self->_serverConnection setUsesProxyConnection:AFIsNano()];
    [(SiriCoreSiriConnection *)self->_serverConnection setUrl:self->_currentConnectionURL];
    [(SiriCoreSiriConnection *)self->_serverConnection setDelegate:self];
    unsigned int v19 = self->_serverConnection;
    int v20 = [(ADSession *)self _account];
    CFStringRef v21 = [v20 assistantIdentifier];
    [(SiriCoreSiriConnection *)v19 setAssistantIdentifier:v21];

    __int16 v22 = self->_serverConnection;
    id v23 = [(ADSession *)self _account];
    __int16 v24 = [v23 peerAssistantIdentifier];
    [(SiriCoreSiriConnection *)v22 setPeerAssistantIdentifier:v24];

    if (self->_hasActiveRequest)
    {
      id v25 = [(ADSession *)self delegate];
      unsigned int v26 = [v25 assistantSessionShouldPrewarmConnetion:self];

      if (v26) {
        [(SiriCoreSiriConnection *)self->_serverConnection setSendPings:1];
      }
    }
  }
  unsigned __int8 v3 = self->_serverConnection;
  return v3;
}

- (void)_startConnection
{
  if (![(ADSession *)self state]) {
    kdebug_trace();
  }
  unsigned __int8 v3 = [(ADSession *)self delegate];
  [v3 assistantSessionWillStartConnection:self];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1002C6ECC;
  v18[3] = &unk_100509FD8;
  v18[4] = self;
  BOOL v4 = objc_retainBlock(v18);
  if (AFDeviceSupportsWiFiLPASMode())
  {
    if ([(ADSessionRemoteServer *)self _shouldGetLinkRecommendation])
    {
      id v5 = AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        int v20 = "-[ADSessionRemoteServer _startConnection]";
        _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s Peer is nearby", buf, 0xCu);
      }
      [(ADSession *)self setState:1];
      if (self->_siriNetworkEnablementExperimentActivated)
      {
        id v6 = [(ADSessionRemoteServer *)self _siriNetworkManager];
        BOOL isRequestRetry = self->_isRequestRetry;
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_1002C6F98;
        v16[3] = &unk_10050A000;
        v16[4] = self;
        id v17 = v4;
        [v6 getLinkRecommendation:isRequestRetry recommendation:v16];

        BOOL v8 = v17;
      }
      else
      {
        uint64_t v11 = [(ADSessionRemoteServer *)self _networkManager];
        BOOL v12 = self->_isRequestRetry;
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_1002C705C;
        v14[3] = &unk_10050A050;
        v14[4] = self;
        id v15 = v4;
        [v11 getLinkRecommendation:v12 recommendation:v14];

        BOOL v8 = v15;
      }
    }
    else
    {
      if (self->_siriNetworkEnablementExperimentActivated)
      {
        uint64_t v9 = [(ADSessionRemoteServer *)self _siriNetworkManager];
        [v9 acquireWiFiAssertion:1];

        +[SNNetworkManager acquireDormancySuspendAssertion:&self->_dormancySuspendAssertion];
        ((void (*)(void *, uint64_t, uint64_t))v4[2])(v4, 1, 1);
        id v10 = [(ADSessionRemoteServer *)self _siriNetworkManager];
        [v10 resetLinkRecommendationInfo];
      }
      else
      {
        uint64_t v13 = [(ADSessionRemoteServer *)self _networkManager];
        [v13 acquireWiFiAssertion:1];

        +[SiriCoreNetworkManager acquireDormancySuspendAssertion:&self->_dormancySuspendAssertion];
        ((void (*)(void *, uint64_t, uint64_t))v4[2])(v4, 1, 1);
        id v10 = [(ADSessionRemoteServer *)self _networkManager];
        [v10 resetLinkMetrics];
      }
    }
  }
  else
  {
    ((void (*)(void *, BOOL, void))v4[2])(v4, self->_skipPeer, 0);
  }
}

- (BOOL)_shouldGetLinkRecommendation
{
  return 0;
}

- (id)_connectionURLHostname
{
  id v2 = [(ADSession *)self _account];
  unsigned __int8 v3 = [v2 hostname];

  if (AFIsInternalInstall())
  {
    BOOL v4 = +[ADPreferences sharedPreferences];
    id v5 = [v4 redirectForServerURLString:v3];

    if (v5)
    {
      id v6 = AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
      {
        int v9 = 136315650;
        id v10 = "-[ADSessionRemoteServer _connectionURLHostname]";
        __int16 v11 = 2112;
        BOOL v12 = v3;
        __int16 v13 = 2112;
        dispatch_queue_t v14 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Redirecting %@ to %@", (uint8_t *)&v9, 0x20u);
      }
      id v7 = v5;

      unsigned __int8 v3 = v7;
    }
  }
  return v3;
}

- (id)_connectionURL
{
  id v2 = [(ADSession *)self _account];
  unsigned __int8 v3 = [v2 hostname];

  BOOL v4 = [v3 stringByAppendingString:@"/ace"];
  if (AFIsInternalInstall())
  {
    id v5 = +[ADPreferences sharedPreferences];
    id v6 = [v5 redirectForServerURLString:v4];

    if (v6)
    {
      id v7 = AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
      {
        int v11 = 136315650;
        BOOL v12 = "-[ADSessionRemoteServer _connectionURL]";
        __int16 v13 = 2112;
        dispatch_queue_t v14 = v4;
        __int16 v15 = 2112;
        dispatch_queue_t v16 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Redirecting %@ to %@", (uint8_t *)&v11, 0x20u);
      }
      id v8 = v6;

      BOOL v4 = v8;
    }
  }
  int v9 = +[NSURL URLWithString:v4];

  return v9;
}

- (void)beginRetryableRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(ADSessionRemoteServer *)self _retryManager];
  [v5 beginRetryableRequest:v4];
}

- (void)retryNakedCommandsIfNeeded
{
  unsigned __int8 v3 = [(ADSessionRemoteServer *)self _retryManager];
  id v4 = [v3 nakedObjectsToRetry];

  if (v4)
  {
    id v5 = [v4 count];
    id v6 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315650;
      id v8 = "-[ADSessionRemoteServer retryNakedCommandsIfNeeded]";
      __int16 v9 = 2048;
      id v10 = v5;
      __int16 v11 = 2112;
      BOOL v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Retrying %lu naked commands %@", (uint8_t *)&v7, 0x20u);
    }
    if (v5) {
      [(ADSession *)self sendCommands:v4 opportunistically:0];
    }
  }
}

- (id)_retryManager
{
  retryManager = self->_retryManager;
  if (!retryManager)
  {
    id v4 = objc_alloc_init(ADRetryManager);
    id v5 = self->_retryManager;
    self->_retryManager = v4;

    retryManager = self->_retryManager;
  }
  return retryManager;
}

- (void)setCoreSiriConnection:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002C78E0;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (BOOL)supportsSync
{
  return 1;
}

- (void)dealloc
{
  unsigned __int8 v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v12 = "-[ADSessionRemoteServer dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (self->_dormancySuspendAssertion)
  {
    if (self->_siriNetworkEnablementExperimentActivated) {
      p_dormancySuspendAssertion = &self->_dormancySuspendAssertion;
    }
    else {
      p_dormancySuspendAssertion = self->_dormancySuspendAssertion;
    }
    id v5 = (id *)SiriCoreNetworkManager_ptr;
    if (self->_siriNetworkEnablementExperimentActivated) {
      id v5 = (id *)SNNetworkManager_ptr;
    }
    [*v5 releaseDormancySuspendAssertion:p_dormancySuspendAssertion];
    self->_dormancySuspendAssertion = 0;
  }
  if (self->_siriNetworkEnablementExperimentActivated)
  {
    id v6 = [(ADSessionRemoteServer *)self _siriNetworkManager];
    [v6 releaseWiFiAssertion];

    [(SNConnection *)self->_siriNetworkServerConnection setDelegate:0];
    [(SNConnection *)self->_siriNetworkServerConnection cancelSynchronously:0 isOnConnectionQueue:0 completion:0];
  }
  else
  {
    int v7 = [(ADSessionRemoteServer *)self _networkManager];
    [v7 releaseWiFiAssertion];

    [(SiriCoreSiriConnection *)self->_serverConnection setDelegate:0];
    [(SiriCoreSiriConnection *)self->_serverConnection cancelSynchronously:0 onQueue:0 completion:0];
  }
  commandMap = self->_commandMap;
  if (commandMap)
  {
    CFRelease(commandMap);
    self->_commandMap = 0;
  }
  __int16 v9 = +[NSNotificationCenter defaultCenter];
  [v9 removeObserver:self];

  v10.receiver = self;
  v10.super_class = (Class)ADSessionRemoteServer;
  [(ADSession *)&v10 dealloc];
}

- (id)initOnQueue:(id)a3 withAccount:(id)a4 languageCode:(id)a5 connectionMode:(id)a6 sharedUserIdentifier:(id)a7 loggingSharedUserIdentifier:(id)a8 instanceContext:(id)a9
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v37 = a9;
  v38.receiver = self;
  v38.super_class = (Class)ADSessionRemoteServer;
  id v21 = [(ADSession *)&v38 initOnQueue:v16 withAccount:a4];
  if (v21)
  {
    int v22 = sub_1000648C0();
    *((unsigned char *)v21 + 504) = v22;
    id v23 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      CFStringRef v24 = @"NO";
      if (v22) {
        CFStringRef v24 = @"YES";
      }
      *(_DWORD *)buf = 136315394;
      double v40 = "-[ADSessionRemoteServer initOnQueue:withAccount:languageCode:connectionMode:sharedUserIdentifier:loggingShar"
            "edUserIdentifier:instanceContext:]";
      __int16 v41 = 2112;
      CFStringRef v42 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s SIRI_NETWORK_ENABLEMENT Experiment Activated: %@", buf, 0x16u);
    }
    [v21 setState:0];
    [v21 setLanguageCode:v17];
    [v21 setConnectionMode:v18];
    [v21 setSharedUserIdentifier:v19];
    [v21 setLoggingSharedUserIdentifier:v20];
    objc_storeStrong((id *)v21 + 62, a9);
    objc_storeStrong((id *)v21 + 29, a3);
    id v25 = +[ADPeerInfo locallyPairedPeerInfo];
    uint64_t v26 = [v25 productType];
    int v27 = (void *)*((void *)v21 + 41);
    *((void *)v21 + 41) = v26;

    uint64_t v28 = [v25 buildVersion];
    __int16 v29 = (void *)*((void *)v21 + 42);
    *((void *)v21 + 42) = v28;

    id v30 = +[ADPreferences sharedPreferences];
    uint64_t v31 = [v30 productTypePrefix];
    id v32 = (void *)*((void *)v21 + 43);
    *((void *)v21 + 43) = v31;

    *((unsigned char *)v21 + 352) = AFIsNano();
    *((void *)v21 + 45) = 0x401C000000000000;
    dispatch_group_t v33 = dispatch_group_create();
    id v34 = (void *)*((void *)v21 + 60);
    *((void *)v21 + 60) = v33;

    [v21 setCanHandleRequest:1];
    id v35 = +[NSNotificationCenter defaultCenter];
    [v35 addObserver:v21 selector:"_homeInfoDidChange:" name:@"ADHomeInfoForThisDeviceDidChangeNotification" object:0];
    [v35 addObserver:v21 selector:"_homeContextDidChange:" name:@"ADHomeInfoHomeContextDidChangeNotification" object:0];
    [v35 addObserver:v21 selector:"_companionServiceStateDidChange:" name:@"ADCompanionServiceReadyStateDidChangeNotification" object:0];
    [v35 addObserver:v21 selector:"_multiUsersDidChange:" name:@"ADMultiUsersDidChangeNotification" object:0];
  }
  return v21;
}

+ (void)_getReportSymptomsBasedNetworkQualityMetrics:(id)a3
{
  id v3 = a3;
  id v4 = +[SiriCoreNetworkManager sharedInstance];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1002C7EE4;
  v6[3] = &unk_10050A3B0;
  id v7 = v3;
  id v5 = v3;
  [v4 getQualityReport:v6];
}

@end