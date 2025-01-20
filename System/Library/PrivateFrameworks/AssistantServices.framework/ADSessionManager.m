@interface ADSessionManager
- (ADSessionManagerDelegate)delegate;
- (ADSessionManagerIntercepting)interceptor;
- (BOOL)_allowWhitelistedCommands:(id)a3;
- (BOOL)_evaluateResultObjects;
- (BOOL)_filterUnsupportedCommands:(id)a3 inGroup:(id)a4 onSession:(id)a5;
- (BOOL)_hasAtleastOneActiveSessionBesides:(id)a3;
- (BOOL)_haveUsefulness:(id)a3 usefulnessScore:(id *)a4;
- (BOOL)_isDestructive:(id)a3;
- (BOOL)_reverseMapSessionRequestIdToADRequestId:(id)a3 forSession:(id)a4;
- (BOOL)assistantSessionShouldAttemptRetry:(id)a3;
- (BOOL)assistantSessionShouldLogVisibleRequestFailure:(id)a3 forError:(id)a4;
- (BOOL)assistantSessionShouldPrewarmConnetion:(id)a3;
- (BOOL)assistantSessionShouldRestartConnectionOnWiFi:(id)a3;
- (BOOL)hasActiveSessionForSendingMetrics;
- (BOOL)hasClient;
- (BOOL)hasSessionRequiringServerConnection;
- (id)_keyForRequestId:(id)a3 forSession:(id)a4;
- (id)_languageCode;
- (id)_mapADRequestIdToSessionRequestId:(id)a3 forSession:(id)a4;
- (id)_saConnectionMode;
- (id)acquireAssertionForReason:(id)a3;
- (id)aggregator;
- (id)assistantSessionCommandsToRestoreStateOnNewConnection:(id)a3;
- (id)initOnQueue:(id)a3 account:(id)a4 instanceContext:(id)a5;
- (id)sessionRequestIdForRefId:(id)a3;
- (int)_preferredSessionType;
- (unsigned)_resultObjectsHoldTime;
- (void)_addSession:(id)a3;
- (void)_cancelOtherSessionRequests:(id)a3 forRefId:(id)a4;
- (void)_cancelSynchronously:(BOOL)a3;
- (void)_clearSessions;
- (void)_cloudPreferencesDidSync:(id)a3;
- (void)_convertEmbeddedRequestIds:(id)a3 originalCommand:(id)a4 session:(id)a5;
- (void)_enabledBitsChanged:(id)a3;
- (void)_languageCodeDidChange:(id)a3;
- (void)_logCommandToMetrics:(id)a3 forSession:(id)a4 outbound:(BOOL)a5;
- (void)_logContextForWinningSession:(id)a3 forReason:(id)a4 forRemoteSessionScore:(int64_t)a5 forLocalSessionScore:(int64_t)a6;
- (void)_logMetricsForSessionFailure:(id)a3 withError:(id)a4 completion:(id)a5;
- (void)_pickDefaultWinnerWithDroppingSession:(id)a3;
- (void)_powerChangedMessageType:(unsigned int)a3 notificationID:(int64_t)a4;
- (void)_purgeRequestMaps;
- (void)_queueResultObject:(id)a3 forSession:(id)a4;
- (void)_registerForPossibleSessionDestroyingNotifications;
- (void)_registerForSleepNotification;
- (void)_resetResultObjectsTimer;
- (void)_resetSessionOnRequestBoundaryIfNeeded;
- (void)_resetSessionsAndMakeQuiet:(BOOL)a3;
- (void)_resetWinningState;
- (void)_resetWinningStateAndPurgeRequestMaps;
- (void)_resultObjectsTimerFired:(id)a3;
- (void)_sendCommand:(id)a3 opportunistically:(BOOL)a4 logEvent:(BOOL)a5 doSendPreProcessing:(BOOL)a6 doSendPostProcessing:(BOOL)a7;
- (void)_setRequestId:(id)a3;
- (void)_sharedAssistantdIdentifierDidChange:(id)a3;
- (void)_startResultObjectsTimer;
- (void)_startSession:(int)a3 makeQuiet:(BOOL)a4;
- (void)_startSessions:(BOOL)a3;
- (void)_unregisterForPossibleSessionDestroyingNotifications;
- (void)_unregisterForSleepNotification;
- (void)_updateSharedUserIdentifiers;
- (void)adviseSessionArbiterToContinueWithPreviousWinner:(BOOL)a3;
- (void)assistantSession:(id)a3 beginSessionRetryPreferringWWAN:(BOOL)a4;
- (void)assistantSession:(id)a3 cannotHandleRequest:(id)a4 error:(id)a5;
- (void)assistantSession:(id)a3 didChangeRequestIdFrom:(id)a4 toId:(id)a5;
- (void)assistantSession:(id)a3 didLoadAssistantSyncRequested:(BOOL)a4;
- (void)assistantSession:(id)a3 didOpenConnectionWithPolicyId:(id)a4 routeId:(id)a5 connectionDelay:(double)a6;
- (void)assistantSession:(id)a3 receivedCommand:(id)a4;
- (void)assistantSession:(id)a3 receivedError:(id)a4 isRetryableError:(BOOL)a5;
- (void)assistantSession:(id)a3 receivedIntermediateError:(id)a4;
- (void)assistantSession:(id)a3 willRetryOnError:(id)a4;
- (void)assistantSessionConnectionDidClose:(id)a3;
- (void)assistantSessionConnectionDidReset:(id)a3;
- (void)assistantSessionDidCreateAssistant:(id)a3;
- (void)assistantSessionDidDestroyAssistant:(id)a3;
- (void)assistantSessionRetryingRequest:(id)a3;
- (void)assistantSessionWillStartConnection:(id)a3;
- (void)barrier:(id)a3;
- (void)beginUpdatingAssistantData;
- (void)cancel;
- (void)cancelSynchronously;
- (void)dealloc;
- (void)delegateDidHandleCommand:(id)a3;
- (void)endRetryableRequestForCommand:(id)a3;
- (void)getConnectionMetrics:(id)a3;
- (void)getSNConnectionMetrics:(id)a3;
- (void)handleCommand:(id)a3;
- (void)preheatAndMakeQuiet:(BOOL)a3;
- (void)preheatSessions;
- (void)refreshValidationData;
- (void)relinquishAssertion:(id)a3;
- (void)resetRetryManager;
- (void)resetSessionsAtNextRequestBoundary;
- (void)resetSessionsAtNextRequestBoundaryWithCompletion:(id)a3;
- (void)resetSessionsIfRequiredBasedOnOrchestrationMode:(BOOL)a3;
- (void)resetWinningState;
- (void)sendCommand:(id)a3 opportunistically:(BOOL)a4 logEvent:(BOOL)a5;
- (void)sendRawCommand:(id)a3 opportunistically:(BOOL)a4 logEvent:(BOOL)a5;
- (void)sendRemoteGizmoDeviceToServer:(id)a3;
- (void)setAWDRequestRecordMetrics:(id)a3;
- (void)setCurrentRequest:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHasActiveRequest:(BOOL)a3;
- (void)setHasClient:(BOOL)a3;
- (void)setInterceptor:(id)a3;
- (void)setRequestId:(id)a3;
- (void)startRetry;
- (void)updateConnectionDidDropAggdMetrics;
- (void)updateConnectionDidFailAggdMetrics;
- (void)updateConnectionSetConnectionType:(unsigned int)a3;
- (void)updateForCallIsLikelyDueToRequest:(BOOL)a3;
- (void)updateForCallState:(BOOL)a3;
@end

@implementation ADSessionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong(&self->_sessionResetOnRequestBoundaryCompletion, 0);
  objc_destroyWeak((id *)&self->_interceptor);
  objc_storeStrong((id *)&self->_awdRequestRecord, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
  objc_storeStrong((id *)&self->_savedSasSpeechFailure, 0);
  objc_storeStrong((id *)&self->_savedSasSpeechRecognized, 0);
  objc_storeStrong((id *)&self->_lastSessionError, 0);
  objc_storeStrong((id *)&self->_resultObjectsEvaluationTimer, 0);
  objc_storeStrong((id *)&self->_winningSessionId, 0);
  objc_storeStrong((id *)&self->_sessionOriginatedCommandTable, 0);
  objc_storeStrong((id *)&self->_reverseProxiedIdMap, 0);
  objc_storeStrong((id *)&self->_proxiedIdMap, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_aggregator, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_connectionMode, 0);
  objc_storeStrong((id *)&self->_loggingSharedUserIdentifier, 0);
  objc_storeStrong((id *)&self->_sharedUserIdentifier, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setInterceptor:(id)a3
{
}

- (ADSessionManagerIntercepting)interceptor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interceptor);
  return (ADSessionManagerIntercepting *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ADSessionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ADSessionManagerDelegate *)WeakRetained;
}

- (void)_logContextForWinningSession:(id)a3 forReason:(id)a4 forRemoteSessionScore:(int64_t)a5 forLocalSessionScore:(int64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  if (!v9)
  {
    v18 = AFSiriLogContextSession;
    if (!os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    int v20 = 136315138;
    v21 = "-[ADSessionManager _logContextForWinningSession:forReason:forRemoteSessionScore:forLocalSessionScore:]";
    v19 = "%s sessionType is not defined";
LABEL_9:
    _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v20, 0xCu);
    goto LABEL_7;
  }
  if (!v10)
  {
    v18 = AFSiriLogContextSession;
    if (!os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    int v20 = 136315138;
    v21 = "-[ADSessionManager _logContextForWinningSession:forReason:forRemoteSessionScore:forLocalSessionScore:]";
    v19 = "%s winningReason is not defined";
    goto LABEL_9;
  }
  v12 = +[NSMutableDictionary dictionary];
  [v12 setObject:v9 forKey:@"sessionType"];
  [v12 setObject:v11 forKey:@"reason"];
  v13 = +[NSNumber numberWithInteger:a5];
  v14 = [v13 stringValue];
  [v12 setObject:v14 forKey:@"remoteSessionScore"];

  v15 = +[NSNumber numberWithInteger:a6];
  v16 = [v15 stringValue];
  [v12 setObject:v16 forKey:@"localSessionScore"];

  v17 = +[AFAnalytics sharedAnalytics];
  [v17 logEventWithType:919 context:v12];

LABEL_7:
}

- (void)_resetWinningState
{
  if (!self->_continueWithPreviousWinner)
  {
    v3 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      winningSessionId = self->_winningSessionId;
      int v8 = 136315394;
      id v9 = "-[ADSessionManager _resetWinningState]";
      __int16 v10 = 2112;
      v11 = winningSessionId;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s Reset winning session Id %@", (uint8_t *)&v8, 0x16u);
    }
    v5 = self->_winningSessionId;
    self->_winningSessionId = 0;
  }
  [(ADSessionManager *)self _resetResultObjectsTimer];
  *(_WORD *)&self->_isQueuingResultsForDelayedEvaluation = 0;
  savedSasSpeechRecognized = self->_savedSasSpeechRecognized;
  self->_savedSasSpeechRecognized = 0;

  savedSasSpeechFailure = self->_savedSasSpeechFailure;
  self->_savedSasSpeechFailure = 0;

  self->_savedSasSpeechRecognizedSubmitted = 0;
  self->_serverSpeechRecognitionArrived = 0;
}

- (BOOL)_reverseMapSessionRequestIdToADRequestId:(id)a3 forSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 refId];
  if (!v8)
  {
    BOOL v11 = 0;
    id v9 = 0;
LABEL_7:
    __int16 v10 = 0;
    goto LABEL_9;
  }
  id v9 = [(ADSessionManager *)self _keyForRequestId:v8 forSession:v7];
  if (!v9)
  {
    BOOL v11 = 0;
    goto LABEL_7;
  }
  __int16 v10 = [(NSMutableDictionary *)self->_reverseProxiedIdMap valueForKey:v9];
  if (v10)
  {
    [v6 setRefId:v10];
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = 0;
  }
LABEL_9:
  v12 = [v6 aceId];

  if (v12)
  {
    if (!self->_sessionOriginatedCommandTable)
    {
      v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      sessionOriginatedCommandTable = self->_sessionOriginatedCommandTable;
      self->_sessionOriginatedCommandTable = v13;
    }
    v15 = [v6 aceId];
    v16 = self->_sessionOriginatedCommandTable;
    v17 = [v7 sessionId];
    [(NSMutableDictionary *)v16 setObject:v17 forKey:v15];
  }
  return v11;
}

- (id)_mapADRequestIdToSessionRequestId:(id)a3 forSession:(id)a4
{
  v5 = [(ADSessionManager *)self _keyForRequestId:a3 forSession:a4];
  if (v5)
  {
    id v6 = [(NSMutableDictionary *)self->_proxiedIdMap valueForKey:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_keyForRequestId:(id)a3 forSession:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)NSString);
  int v8 = [v5 sessionId];

  id v9 = [v7 initWithFormat:@"%@.%@", v6, v8];
  return v9;
}

- (BOOL)_hasAtleastOneActiveSessionBesides:(id)a3
{
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = self->_sessions;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        __int16 v10 = objc_msgSend(v9, "sessionId", (void)v17);
        BOOL v11 = [v4 sessionId];
        unsigned __int8 v12 = [v10 isEqualToString:v11];

        if ((v12 & 1) == 0
          && (([v9 sessionIsActive] & 1) != 0
           || [v9 sessionIsAttemptingTryOrRetry]))
        {
          v13 = (void *)AFSiriLogContextSession;
          LOBYTE(v6) = 1;
          if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
          {
            v14 = v13;
            v15 = [v9 _adSessionTypeString];
            *(_DWORD *)buf = 136315394;
            v22 = "-[ADSessionManager _hasAtleastOneActiveSessionBesides:]";
            __int16 v23 = 2112;
            v24 = v15;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Session %@ is active or is in active retry", buf, 0x16u);
          }
          goto LABEL_14;
        }
      }
      id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return (char)v6;
}

- (void)refreshValidationData
{
  if (self->_state <= 1) {
    [(ADSessionManager *)self _startSessions:0];
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v3 = self->_sessions;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * (void)v7), "refreshValidationData", (void)v8);
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)setHasClient:(BOOL)a3
{
  self->_hasClient = a3;
}

- (BOOL)hasClient
{
  return self->_hasClient;
}

- (void)barrier:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_group_create();
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  char v25 = 1;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obj = self->_sessions;
  id v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v20 objects:v26 count:16];
  unsigned __int8 v12 = v4;
  if (v6)
  {
    uint64_t v7 = *(void *)v21;
    do
    {
      long long v8 = 0;
      do
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        long long v9 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v8);
        dispatch_group_enter(v5);
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_1000D3330;
        v17[3] = &unk_1005012A0;
        v17[4] = self;
        long long v19 = v24;
        long long v18 = v5;
        [v9 barrier:v17];

        long long v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v6);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D33D0;
  block[3] = &unk_10050CA58;
  id v15 = v12;
  v16 = v24;
  id v11 = v12;
  dispatch_group_notify(v5, queue, block);

  _Block_object_dispose(v24, 8);
}

- (void)setAWDRequestRecordMetrics:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_awdRequestRecord, a3);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = self->_sessions;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v10), "setAWDRequestRecord:", v5, (void)v11);
        long long v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_logMetricsForSessionFailure:(id)a3 withError:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  long long v10 = (void (**)(void))a5;
  long long v11 = +[AFAnalytics sharedAnalytics];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000D37A0;
  v26[3] = &unk_10050A230;
  id v12 = v8;
  id v27 = v12;
  id v13 = v9;
  id v28 = v13;
  [v11 logEventWithType:921 contextProvider:v26 contextProvidingQueue:0];

  if (([v12 isEqualToString:@"local"] & 1) != 0
    || (id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
        unsigned __int8 v15 = [WeakRetained assistantSessionManager:self shouldLogVisibleRequestFailureForError:v13], WeakRetained, (v15 & 1) == 0))
  {
    if (v10) {
      v10[2](v10);
    }
  }
  else
  {
    v16 = dispatch_group_create();
    dispatch_group_enter(v16);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000D3888;
    void v24[3] = &unk_10050E2A0;
    long long v17 = v16;
    char v25 = v17;
    [(ADSessionManager *)self getConnectionMetrics:v24];
    dispatch_group_enter(v17);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000D3CC8;
    v22[3] = &unk_10050E2A0;
    long long v23 = v17;
    long long v18 = v17;
    [(ADSessionManager *)self getSNConnectionMetrics:v22];
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000D3FA4;
    block[3] = &unk_10050D0D0;
    long long v21 = v10;
    dispatch_group_notify(v18, queue, block);
  }
}

- (void)_logCommandToMetrics:(id)a3 forSession:(id)a4 outbound:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (objc_msgSend(v8, "ad_shouldLogToMetrics"))
  {
    uint64_t v10 = mach_absolute_time();
    if (v5) {
      uint64_t v11 = 1200;
    }
    else {
      uint64_t v11 = 1100;
    }
    id v12 = [v8 aceId];
    id v13 = [v12 copy];

    long long v14 = [v8 refId];
    id v15 = [v14 copy];

    uint64_t v16 = objc_msgSend(v8, "ad_deferredMetricsContext");
    long long v17 = +[AFAnalytics sharedAnalytics];
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_1000D44A8;
    v42[3] = &unk_100501250;
    uint64_t v47 = v10;
    id v18 = v13;
    id v43 = v18;
    id v41 = v15;
    id v44 = v41;
    id v45 = v9;
    id v40 = (id)v16;
    id v46 = v40;
    [v17 logEventWithType:v11 machAbsoluteTime:v10 contextProvider:v42 contextProvidingQueue:0];

    currentRequest = self->_currentRequest;
    requestId = self->_requestId;
    id v21 = v8;
    long long v22 = currentRequest;
    objc_opt_class();
    LOBYTE(v16) = objc_opt_isKindOfClass();

    if ((v16 & 1) != 0
      || (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), !requestId)
      || (isKindOfClass & 1) != 0)
    {
LABEL_21:

LABEL_22:
      goto LABEL_23;
    }
    if (AFIsHorseman())
    {
      v24 = [v21 encodedClassName];
      if (([v24 isEqual:@"ExecuteOnRemoteRequest"] & 1) == 0
        && ![v24 isEqual:@"StartHandoffRequest"])
      {
        unsigned __int8 v37 = [v24 isEqual:@"InitiateHandoffOnCompanion"];

        if ((v37 & 1) == 0) {
          goto LABEL_22;
        }
        goto LABEL_13;
      }
    }
LABEL_13:
    char v25 = self->_requestId;
    id v21 = [v21 encodedClassName];
    v26 = v25;
    id v27 = v18;
    id v28 = sub_1000D4598(v26);
    if (v28)
    {
      v39 = v26;
      if (v5) {
        uint64_t v29 = 4;
      }
      else {
        uint64_t v29 = 3;
      }
      id v30 = objc_alloc_init((Class)ORCHSchemaORCHClientEvent);
      id v31 = objc_alloc_init((Class)ORCHSchemaORCHClientEventMetadata);
      [v31 setRequestId:v28];
      [v30 setEventMetadata:v31];
      v38 = v28;
      id v32 = objc_alloc_init((Class)ORCHSchemaORCHAceCommandContext);
      id v33 = objc_alloc_init((Class)ORCHSchemaORCHAceCommandStarted);
      [v33 setAceCommandType:v29];
      [v33 setAceCommandName:v21];
      [v32 setStartedOrChanged:v33];
      v34 = sub_1000D4598(v27);
      [v32 setAceId:v34];

      [v30 setAceCommandContext:v32];
      v35 = +[AssistantSiriAnalytics sharedStream];
      [v35 emitMessage:v30];

      v26 = v39;
      id v28 = v38;
    }
    else
    {
      v36 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v49 = "_EmitAceCommandStartedEvent";
        __int16 v50 = 2112;
        v51 = v26;
        _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%s The requestId=%@ is malformed, unable to log SELF command", buf, 0x16u);
      }
    }

    goto LABEL_21;
  }
LABEL_23:
}

- (void)getSNConnectionMetrics:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = self->_sessions;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v17;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (![v11 sessionType] || objc_msgSend(v11, "sessionType") == 1)
          {
            v12[0] = _NSConcreteStackBlock;
            v12[1] = 3221225472;
            v12[2] = sub_1000D47D8;
            v12[3] = &unk_10050D008;
            id v13 = v5;
            long long v14 = v11;
            id v15 = v4;
            [v11 getSNConnectionMetrics:v12];

            goto LABEL_13;
          }
        }
        id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    (*((void (**)(id, void))v4 + 2))(v4, 0);
LABEL_13:
  }
}

- (void)getConnectionMetrics:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = self->_sessions;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v17;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (![v11 sessionType] || objc_msgSend(v11, "sessionType") == 1)
          {
            v12[0] = _NSConcreteStackBlock;
            v12[1] = 3221225472;
            v12[2] = sub_1000D4AD4;
            v12[3] = &unk_10050D008;
            id v13 = v5;
            long long v14 = v11;
            id v15 = v4;
            [v11 getConnectionMetrics:v12];

            goto LABEL_13;
          }
        }
        id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    (*((void (**)(id, void))v4 + 2))(v4, 0);
LABEL_13:
  }
}

- (void)updateConnectionSetConnectionType:(unsigned int)a3
{
  id v4 = [(ADSessionManager *)self aggregator];
  [v4 setConnectionType:a3];
}

- (void)updateConnectionDidFailAggdMetrics
{
  id v2 = [(ADSessionManager *)self aggregator];
  [v2 connectionDidFail];
}

- (void)updateConnectionDidDropAggdMetrics
{
  id v2 = [(ADSessionManager *)self aggregator];
  [v2 connectionDidDrop];
}

- (id)aggregator
{
  aggregator = self->_aggregator;
  if (!aggregator)
  {
    id v4 = (AFAggregator *)objc_alloc_init((Class)AFAggregator);
    id v5 = self->_aggregator;
    self->_aggregator = v4;

    aggregator = self->_aggregator;
  }
  return aggregator;
}

- (id)sessionRequestIdForRefId:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = self->_sessions;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = -[ADSessionManager _keyForRequestId:forSession:](self, "_keyForRequestId:forSession:", v4, *(void *)(*((void *)&v14 + 1) + 8 * v9), (void)v14);
      if (v10)
      {
        uint64_t v11 = (void *)v10;
        id v12 = [(NSMutableDictionary *)self->_proxiedIdMap valueForKey:v10];

        if (v12) {
          break;
        }
      }
      if (v7 == (id)++v9)
      {
        id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    id v12 = 0;
  }

  return v12;
}

- (void)setRequestId:(id)a3
{
  p_requestId = &self->_requestId;
  v54 = (NSString *)a3;
  if (*p_requestId != v54)
  {
    id v6 = +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics];
    unsigned __int8 v7 = [v6 isNetIdAvailable];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics];
      [v8 resetNetId];

      uint64_t v9 = +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics];
      [v9 increaseSequenceNumber];
    }
    uint64_t v10 = +[SNNetworkAnalytics sharedSNNetworkAnalytics];
    unsigned __int8 v11 = [v10 isNetIdAvailable];

    if ((v11 & 1) == 0)
    {
      id v12 = +[SNNetworkAnalytics sharedSNNetworkAnalytics];
      [v12 resetNetId];

      id v13 = +[SNNetworkAnalytics sharedSNNetworkAnalytics];
      [v13 increaseSequenceNumber];
    }
    long long v14 = +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics];
    [v14 setOrchestratorRequestId:v54];

    long long v15 = +[SNNetworkAnalytics sharedSNNetworkAnalytics];
    [v15 setOrchestratorRequestId:v54];

    long long v16 = +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics];
    [v16 logRequestLinkBetweenOrchestratorAndNetworkComponent];

    long long v17 = +[SNNetworkAnalytics sharedSNNetworkAnalytics];
    [v17 logRequestLinkBetweenOrchestratorAndNetworkComponent];

    long long v18 = +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics];
    [v18 setNetIdAvailable:0];

    long long v19 = +[SNNetworkAnalytics sharedSNNetworkAnalytics];
    [v19 setNetIdAvailable:0];

    id v53 = objc_alloc_init((Class)NSMutableDictionary);
    objc_storeStrong((id *)&self->_requestId, a3);
    if (!self->_proxiedIdMap)
    {
      long long v20 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      proxiedIdMap = self->_proxiedIdMap;
      self->_proxiedIdMap = v20;
    }
    if (!self->_reverseProxiedIdMap)
    {
      long long v22 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      reverseProxiedIdMap = self->_reverseProxiedIdMap;
      self->_reverseProxiedIdMap = v22;
    }
    sessionOriginatedCommandTable = self->_sessionOriginatedCommandTable;
    if (sessionOriginatedCommandTable) {
      [(NSMutableDictionary *)sessionOriginatedCommandTable removeAllObjects];
    }
    if (*p_requestId)
    {
      [v53 setObject:v54 forKey:@"originalRequestId"];
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      obj = self->_sessions;
      id v25 = [(NSMutableArray *)obj countByEnumeratingWithState:&v59 objects:v74 count:16];
      if (v25)
      {
        id v26 = v25;
        uint64_t v27 = *(void *)v60;
        do
        {
          for (i = 0; i != v26; i = (char *)i + 1)
          {
            if (*(void *)v60 != v27) {
              objc_enumerationMutation(obj);
            }
            uint64_t v29 = *(void **)(*((void *)&v59 + 1) + 8 * i);
            id v30 = SiriCoreUUIDStringCreate();
            [v29 _setRequestId:v30];
            id v31 = self->_proxiedIdMap;
            id v32 = [(ADSessionManager *)self _keyForRequestId:v54 forSession:v29];
            [(NSMutableDictionary *)v31 setObject:v30 forKey:v32];

            id v33 = self->_reverseProxiedIdMap;
            v34 = [(ADSessionManager *)self _keyForRequestId:v30 forSession:v29];
            [(NSMutableDictionary *)v33 setObject:v54 forKey:v34];

            v35 = [v29 _adSessionTypeString];
            v36 = +[NSString stringWithFormat:@"%@SessionProxyId", v35];

            [v53 setObject:v30 forKey:v36];
            id v37 = [v29 dequeueResultObjects];
            [v29 setHasActiveRequest:1];
            v38 = (void *)AFSiriLogContextSession;
            if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_DEFAULT))
            {
              v39 = v38;
              id v40 = [v29 _adSessionTypeString];
              id v41 = [v29 sessionId];
              *(_DWORD *)buf = 136316162;
              v65 = "-[ADSessionManager setRequestId:]";
              __int16 v66 = 2112;
              v67 = v54;
              __int16 v68 = 2112;
              v69 = v40;
              __int16 v70 = 2112;
              v71 = v41;
              __int16 v72 = 2112;
              v73 = v30;
              _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%s Request Id %@ for %@ session with Id %@ has proxied request Id %@", buf, 0x34u);
            }
          }
          id v26 = [(NSMutableArray *)obj countByEnumeratingWithState:&v59 objects:v74 count:16];
        }
        while (v26);
      }

      v42 = +[AFAnalytics sharedAnalytics];
      [v42 logEventWithType:918 context:v53];
    }
    [(ADSessionManager *)self _resetWinningState];
    winningSessionId = self->_winningSessionId;
    if (winningSessionId)
    {
      id v44 = AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v65 = "-[ADSessionManager setRequestId:]";
        __int16 v66 = 2112;
        v67 = winningSessionId;
        __int16 v68 = 2112;
        v69 = v54;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "%s Previous winner session %@ reused for current request %@", buf, 0x20u);
      }
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v45 = self->_sessions;
      id v46 = [(NSMutableArray *)v45 countByEnumeratingWithState:&v55 objects:v63 count:16];
      if (v46)
      {
        uint64_t v47 = *(void *)v56;
        while (2)
        {
          for (j = 0; j != v46; j = (char *)j + 1)
          {
            if (*(void *)v56 != v47) {
              objc_enumerationMutation(v45);
            }
            v49 = *(void **)(*((void *)&v55 + 1) + 8 * (void)j);
            __int16 v50 = self->_winningSessionId;
            v51 = [v49 sessionId];
            LODWORD(v50) = [(NSString *)v50 isEqualToString:v51];

            if (v50)
            {
              id v46 = [v49 _adSessionTypeString];
              goto LABEL_36;
            }
          }
          id v46 = [(NSMutableArray *)v45 countByEnumeratingWithState:&v55 objects:v63 count:16];
          if (v46) {
            continue;
          }
          break;
        }
      }
LABEL_36:

      [(ADSessionManager *)self _logContextForWinningSession:v46 forReason:@"arbiterReusedPreviousWinner" forRemoteSessionScore:0 forLocalSessionScore:0];
    }
  }
}

- (void)_resetSessionOnRequestBoundaryIfNeeded
{
  if (self->_hasActiveRequest)
  {
    v3 = AFSiriLogContextSession;
    if (!os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO)) {
      return;
    }
    requestId = self->_requestId;
    *(_DWORD *)buf = 136315394;
    uint64_t v29 = "-[ADSessionManager _resetSessionOnRequestBoundaryIfNeeded]";
    __int16 v30 = 2112;
    id v31 = requestId;
    id v5 = "%s Ignored because of active request (requestId = %@).";
    id v6 = v3;
    uint32_t v7 = 22;
    goto LABEL_4;
  }
  if ([(NSMutableSet *)self->_assertions count])
  {
    uint64_t v8 = (void *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      assertions = self->_assertions;
      uint64_t v10 = v8;
      *(_DWORD *)buf = 136315394;
      uint64_t v29 = "-[ADSessionManager _resetSessionOnRequestBoundaryIfNeeded]";
      __int16 v30 = 2048;
      id v31 = (NSString *)[(NSMutableSet *)assertions count];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Ignored because %tu assertions.", buf, 0x16u);
    }
    if (AFIsInternalInstall())
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      unsigned __int8 v11 = self->_assertions;
      id v12 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v24;
        do
        {
          long long v15 = 0;
          do
          {
            if (*(void *)v24 != v14) {
              objc_enumerationMutation(v11);
            }
            long long v16 = AFSiriLogContextSession;
            if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_DEBUG))
            {
              long long v17 = *(NSString **)(*((void *)&v23 + 1) + 8 * (void)v15);
              *(_DWORD *)buf = 136315394;
              uint64_t v29 = "-[ADSessionManager _resetSessionOnRequestBoundaryIfNeeded]";
              __int16 v30 = 2112;
              id v31 = v17;
              _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s     %@", buf, 0x16u);
            }
            long long v15 = (char *)v15 + 1;
          }
          while (v13 != v15);
          id v13 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v13);
      }
    }
  }
  else if (self->_needsResetOnRequestBoundary)
  {
    self->_needsResetOnRequestBoundary = 0;
    long long v18 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v29 = "-[ADSessionManager _resetSessionOnRequestBoundaryIfNeeded]";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s Resetting Sessions at Request Boundary", buf, 0xCu);
    }
    long long v19 = +[AFAnalytics sharedAnalytics];
    [v19 logEventWithType:925 context:0];

    sessionResetOnRequestBoundaryCompletion = (void (**)(void))self->_sessionResetOnRequestBoundaryCompletion;
    if (sessionResetOnRequestBoundaryCompletion)
    {
      sessionResetOnRequestBoundaryCompletion[2]();
      id v21 = self->_sessionResetOnRequestBoundaryCompletion;
    }
    else
    {
      id v21 = 0;
    }
    self->_sessionResetOnRequestBoundaryCompletion = 0;

    [(ADSessionManager *)self _resetSessionsAndMakeQuiet:0];
  }
  else
  {
    long long v22 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v29 = "-[ADSessionManager _resetSessionOnRequestBoundaryIfNeeded]";
      id v5 = "%s Ignored because there's no need.";
      id v6 = v22;
      uint32_t v7 = 12;
LABEL_4:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v5, buf, v7);
    }
  }
}

- (void)relinquishAssertion:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    uint32_t v7 = "-[ADSessionManager relinquishAssertion:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s assertion = %@", (uint8_t *)&v6, 0x16u);
  }
  [(NSMutableSet *)self->_assertions removeObject:v4];
  [(ADSessionManager *)self _resetSessionOnRequestBoundaryIfNeeded];
}

- (id)acquireAssertionForReason:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    id v9 = "-[ADSessionManager acquireAssertionForReason:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s reason = %@", (uint8_t *)&v8, 0x16u);
  }
  int v6 = [[ADSessionAssertion alloc] initWithTimestamp:mach_absolute_time() reason:v4];
  [(NSMutableSet *)self->_assertions addObject:v6];

  return v6;
}

- (void)_setRequestId:(id)a3
{
}

- (void)_clearSessions
{
  sessions = self->_sessions;
  if (sessions) {
    [(NSMutableArray *)sessions removeAllObjects];
  }
}

- (void)_addSession:(id)a3
{
  id v4 = a3;
  sessions = self->_sessions;
  id v8 = v4;
  if (!sessions)
  {
    int v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    uint32_t v7 = self->_sessions;
    self->_sessions = v6;

    id v4 = v8;
    sessions = self->_sessions;
  }
  [(NSMutableArray *)sessions addObject:v4];
}

- (BOOL)hasSessionRequiringServerConnection
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v3 = self->_sessions;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v8, "sessionRequiresServerConnection", (void)v18))
        {
LABEL_15:
          id v13 = (void *)AFSiriLogContextSession;
          if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
          {
            uint64_t v14 = v13;
            long long v15 = [v8 sessionId];
            requestId = self->_requestId;
            *(_DWORD *)buf = 136315650;
            long long v23 = "-[ADSessionManager hasSessionRequiringServerConnection]";
            __int16 v24 = 2112;
            long long v25 = v15;
            __int16 v26 = 2112;
            uint64_t v27 = requestId;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Session with Id %@ needs server connection (requestId = %@).", buf, 0x20u);
          }
          LOBYTE(v11) = 1;
          return v11;
        }
        if ([v8 sessionRequiresSync])
        {
          id v9 = [v8 _requestId];
          if (v9)
          {
          }
          else if (!self->_requestId)
          {
            goto LABEL_15;
          }
        }
      }
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v18 objects:v28 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  __int16 v10 = AFSiriLogContextSession;
  BOOL v11 = os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO);
  if (v11)
  {
    id v12 = self->_requestId;
    *(_DWORD *)buf = 136315394;
    long long v23 = "-[ADSessionManager hasSessionRequiringServerConnection]";
    __int16 v24 = 2112;
    long long v25 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s No server connection needed (requestId = %@).", buf, 0x16u);
    LOBYTE(v11) = 0;
  }
  return v11;
}

- (void)setHasActiveRequest:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v32 = "-[ADSessionManager setHasActiveRequest:]";
    __int16 v33 = 1024;
    BOOL v34 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %d", buf, 0x12u);
  }
  self->_hasActiveRequest = v3;
  uint64_t v6 = [(ADSessionManager *)self aggregator];
  [v6 setHasActiveRequest:v3];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint32_t v7 = self->_sessions;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        [v12 setHasActiveRequest:v3];
        [v12 _resetSessionRequiresServerConnection];
        [v12 _resetSessionRequiresSync];
      }
      id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v9);
  }

  if (v3)
  {
    [(ADSessionManager *)self _resetSessionOnRequestBoundaryIfNeeded];
    if (self->_state == 3)
    {
LABEL_23:
      id WeakRetained = (NSMutableArray *)objc_loadWeakRetained((id *)&self->_delegate);
      [(NSMutableArray *)WeakRetained assistantSessionManagerConnectionDidBecomeActive:self];
    }
    else
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id WeakRetained = self->_sessions;
      id v14 = [(NSMutableArray *)WeakRetained countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v22;
        while (2)
        {
          for (j = 0; j != v15; j = (char *)j + 1)
          {
            if (*(void *)v22 != v16) {
              objc_enumerationMutation(WeakRetained);
            }
            if (objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * (void)j), "sessionIsActive", (void)v21))
            {

              goto LABEL_23;
            }
          }
          id v15 = [(NSMutableArray *)WeakRetained countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }
    }
  }
  else
  {
    [(ADSessionManager *)self _resetResultObjectsTimer];
    self->_isQueuingResultsForDelayedEvaluation = 0;
    requestId = self->_requestId;
    self->_requestId = 0;

    long long v19 = +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics];
    [v19 setOrchestratorRequestId:0];

    long long v20 = +[SNNetworkAnalytics sharedSNNetworkAnalytics];
    [v20 setOrchestratorRequestId:0];

    [(ADSessionManager *)self _resetSessionOnRequestBoundaryIfNeeded];
  }
}

- (void)sendRawCommand:(id)a3 opportunistically:(BOOL)a4 logEvent:(BOOL)a5
{
}

- (void)sendCommand:(id)a3 opportunistically:(BOOL)a4 logEvent:(BOOL)a5
{
}

- (void)setCurrentRequest:(id)a3
{
  id v4 = (SABaseCommand *)a3;
  id v5 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    currentRequest = self->_currentRequest;
    int v8 = 136315650;
    id v9 = "-[ADSessionManager setCurrentRequest:]";
    __int16 v10 = 2112;
    BOOL v11 = currentRequest;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@ -> %@", (uint8_t *)&v8, 0x20u);
  }
  uint32_t v7 = self->_currentRequest;
  self->_currentRequest = v4;
}

- (void)_sendCommand:(id)a3 opportunistically:(BOOL)a4 logEvent:(BOOL)a5 doSendPreProcessing:(BOOL)a6 doSendPostProcessing:(BOOL)a7
{
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000D63A0;
  v19[3] = &unk_10050B7B8;
  v19[4] = self;
  BOOL v21 = a4;
  id v11 = a3;
  id v20 = v11;
  BOOL v22 = a5;
  BOOL v23 = a6;
  BOOL v24 = a7;
  __int16 v12 = objc_retainBlock(v19);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interceptor);
  if (WeakRetained
    && (id v14 = objc_loadWeakRetained((id *)&self->_interceptor),
        unsigned int v15 = [v14 isInterceptingCommands],
        v14,
        v15))
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000D6A54;
    v16[3] = &unk_1005061E8;
    v16[4] = self;
    long long v18 = v12;
    id v17 = v11;
    [WeakRetained interceptCommand:v17 completion:v16];
  }
  else
  {
    ((void (*)(void *))v12[2])(v12);
  }
}

- (void)delegateDidHandleCommand:(id)a3
{
  id v4 = a3;
  id v5 = [v4 aceId];
  if (v5)
  {
    if (self->_serverSpeechRecognitionArrived)
    {
      uint64_t v6 = 1;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint32_t v7 = AFSiriLogContextSession;
        uint64_t v6 = 1;
        if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          BOOL v23 = "-[ADSessionManager delegateDidHandleCommand:]";
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Final speech recognition arrived", buf, 0xCu);
        }
        self->_serverSpeechRecognitionArrived = 1;
      }
      else
      {
        uint64_t v6 = 0;
      }
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    int v8 = self->_sessions;
    id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v14 = -[ADSessionManager _mapADRequestIdToSessionRequestId:forSession:](self, "_mapADRequestIdToSessionRequestId:forSession:", v5, v13, (void)v17);
          unsigned int v15 = (void *)v14;
          if (v14) {
            uint64_t v16 = (void *)v14;
          }
          else {
            uint64_t v16 = v5;
          }
          [v13 delegateDidHandleCommand:v16 didRecognizeSpeech:v6];
        }
        id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }
  }
}

- (void)handleCommand:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    long long v18 = "-[ADSessionManager handleCommand:]";
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s Bounce back command is %@", buf, 0x16u);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = self->_sessions;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
LABEL_5:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v13 != v9) {
        objc_enumerationMutation(v6);
      }
      if (-[ADSessionManager _reverseMapSessionRequestIdToADRequestId:forSession:](self, "_reverseMapSessionRequestIdToADRequestId:forSession:", v4, *(void *)(*((void *)&v12 + 1) + 8 * v10), (void)v12))
      {
        break;
      }
      if (v8 == (id)++v10)
      {
        id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v8) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained assistantSessionManager:self receivedCommand:v4];
}

- (void)_convertEmbeddedRequestIds:(id)a3 originalCommand:(id)a4 session:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = objc_msgSend(a4, "siriCore_requestId");
  if (v10)
  {
    uint64_t v11 = [(ADSessionManager *)self _mapADRequestIdToSessionRequestId:v10 forSession:v9];
    if (v11)
    {
      long long v12 = (void *)v11;
      long long v13 = AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_DEBUG))
      {
        int v14 = 136315394;
        long long v15 = "-[ADSessionManager _convertEmbeddedRequestIds:originalCommand:session:]";
        __int16 v16 = 2112;
        long long v17 = v12;
        _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s Setting RequestId to %@", (uint8_t *)&v14, 0x16u);
      }
      objc_msgSend(v8, "siriCore_setSessionRequestId:", v12);
    }
  }
}

- (BOOL)_allowWhitelistedCommands:(id)a3
{
  uint64_t v3 = qword_100585A38;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_100585A38, &stru_100501228);
  }
  unsigned __int8 v5 = [(id)qword_100585A40 containsObject:v4];

  return v5;
}

- (BOOL)_filterUnsupportedCommands:(id)a3 inGroup:(id)a4 onSession:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v7) {
    goto LABEL_8;
  }
  if (![v8 isEqualToString:SASyncGroupIdentifier])
  {
    if ([v9 sessionType] == 1
      && (objc_msgSend(v7, "siriCore_supportedByRemoteLimitedSession") & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();
        goto LABEL_4;
      }
    }
LABEL_8:
    char v11 = 1;
    goto LABEL_9;
  }
  unsigned __int8 isKindOfClass = [v9 supportsSync];
LABEL_4:
  char v11 = isKindOfClass;
LABEL_9:

  return v11 & 1;
}

- (void)assistantSessionConnectionDidClose:(id)a3
{
  if (![(ADSessionManager *)self _hasAtleastOneActiveSessionBesides:a3])
  {
    [(ADSessionManager *)self _unregisterForSleepNotification];
  }
}

- (void)assistantSessionRetryingRequest:(id)a3
{
  id v5 = a3;
  if (![v5 sessionType] || objc_msgSend(v5, "sessionType") == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained assistantSessionManagerRetryingRequestOnRemoteSession:self];
  }
}

- (void)assistantSession:(id)a3 beginSessionRetryPreferringWWAN:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (![v6 sessionType] || objc_msgSend(v6, "sessionType") == 1)
  {
    id v7 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315138;
      uint64_t v10 = "-[ADSessionManager assistantSession:beginSessionRetryPreferringWWAN:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Session begin retry preferring WWAN", (uint8_t *)&v9, 0xCu);
    }
    id v8 = [(ADSessionManager *)self aggregator];
    [v8 beginSessionRetryPreferringWWAN:v4];
  }
}

- (void)assistantSession:(id)a3 willRetryOnError:(id)a4
{
  id v5 = a4;
  id v6 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    int v9 = "-[ADSessionManager assistantSession:willRetryOnError:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Session will retry on error", (uint8_t *)&v8, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained assistantSessionManager:self willRetryOnError:v5];
}

- (void)assistantSession:(id)a3 didLoadAssistantSyncRequested:(BOOL)a4
{
  BOOL v4 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained assistantSessionManager:self didLoadAssistantSyncRequested:v4];
}

- (void)assistantSessionDidDestroyAssistant:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained assistantSessionManagerDidDestroyAssistant:self];
}

- (void)assistantSessionDidCreateAssistant:(id)a3
{
  BOOL v4 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    id v7 = "-[ADSessionManager assistantSessionDidCreateAssistant:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Session did create assistant", (uint8_t *)&v6, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained assistantSessionManagerDidCreateAssistant:self];
}

- (void)assistantSession:(id)a3 didChangeRequestIdFrom:(id)a4 toId:(id)a5
{
  id v8 = a3;
  int v9 = (NSMutableDictionary *)a4;
  id v10 = a5;
  char v11 = [(ADSessionManager *)self _keyForRequestId:v9 forSession:v8];
  long long v12 = self->_requestId;
  long long v13 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v22 = 136315906;
    BOOL v23 = "-[ADSessionManager assistantSession:didChangeRequestIdFrom:toId:]";
    __int16 v24 = 2112;
    long long v25 = (NSMutableDictionary *)v12;
    __int16 v26 = 2112;
    long long v27 = v9;
    __int16 v28 = 2112;
    id v29 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Request Id is %@ and oldSessionRequestId is %@ newSessionRequestId is %@", (uint8_t *)&v22, 0x2Au);
  }
  if (v12)
  {
    proxiedIdMap = self->_proxiedIdMap;
    long long v15 = [(ADSessionManager *)self _keyForRequestId:v12 forSession:v8];
    [(NSMutableDictionary *)proxiedIdMap setObject:v10 forKey:v15];

    [(NSMutableDictionary *)self->_reverseProxiedIdMap removeObjectForKey:v11];
    reverseProxiedIdMap = self->_reverseProxiedIdMap;
    long long v17 = [(ADSessionManager *)self _keyForRequestId:v10 forSession:v8];
    [(NSMutableDictionary *)reverseProxiedIdMap setObject:v12 forKey:v17];

    id v18 = [v8 dequeueResultObjects];
    __int16 v19 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      id v20 = self->_proxiedIdMap;
      BOOL v21 = self->_reverseProxiedIdMap;
      int v22 = 136315650;
      BOOL v23 = "-[ADSessionManager assistantSession:didChangeRequestIdFrom:toId:]";
      __int16 v24 = 2112;
      long long v25 = v20;
      __int16 v26 = 2112;
      long long v27 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s Proxied map is %@ reverse Proxied map is %@", (uint8_t *)&v22, 0x20u);
    }
  }
}

- (id)assistantSessionCommandsToRestoreStateOnNewConnection:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = [WeakRetained assistantSessionManagerCommandsToRestoreStateOnNewConnection:self];

  return v5;
}

- (BOOL)assistantSessionShouldAttemptRetry:(id)a3
{
  BOOL v4 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    int v9 = "-[ADSessionManager assistantSessionShouldAttemptRetry:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Session should attempt retry", (uint8_t *)&v8, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned __int8 v6 = [WeakRetained assistantSessionManagerShouldAttemptRetry:self];

  return v6;
}

- (void)assistantSessionConnectionDidReset:(id)a3
{
  id v4 = a3;
  id v5 = (void *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    unsigned __int8 v6 = v5;
    id v7 = [v4 _adSessionTypeString];
    int v10 = 136315394;
    char v11 = "-[ADSessionManager assistantSessionConnectionDidReset:]";
    __int16 v12 = 2112;
    long long v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Session %@ connection did reset", (uint8_t *)&v10, 0x16u);
  }
  if (![v4 sessionType] || objc_msgSend(v4, "sessionType") == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained assistantSessionManagerSessionRemoteConnectionDidReset:self];
  }
  if (![(ADSessionManager *)self _hasAtleastOneActiveSessionBesides:v4])
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 assistantSessionManagerSessionConnectionDidReset:self];
  }
}

- (BOOL)assistantSessionShouldRestartConnectionOnWiFi:(id)a3
{
  return self->_hasClient && !self->_callInProcess;
}

- (BOOL)assistantSessionShouldLogVisibleRequestFailure:(id)a3 forError:(id)a4
{
  id v6 = a4;
  if ([(ADSessionManager *)self _hasAtleastOneActiveSessionBesides:a3])
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    int v8 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      __int16 v12 = "-[ADSessionManager assistantSessionShouldLogVisibleRequestFailure:forError:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Session log visible request failure", (uint8_t *)&v11, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    unsigned int v7 = [WeakRetained assistantSessionManager:self shouldLogVisibleRequestFailureForError:v6] ^ 1;
  }
  return v7;
}

- (void)assistantSession:(id)a3 receivedIntermediateError:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained assistantSessionManager:self didObserverIntermediateError:v6];
}

- (void)assistantSession:(id)a3 receivedError:(id)a4 isRetryableError:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  int v10 = self->_winningSessionId;
  if (!self->_hasActiveRequest
    && (![v8 sessionType] || objc_msgSend(v8, "sessionType") == 1))
  {
LABEL_13:
    if (v5 || !self->_hasActiveRequest)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained assistantSessionManager:self receivedError:v9 isRetryableError:v5];
    }
    else
    {
      objc_storeStrong((id *)&self->_lastSessionError, a4);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1000D7EDC;
      v18[3] = &unk_10050CA08;
      v18[4] = self;
      id v19 = v9;
      BOOL v20 = v5;
      [(ADSessionManager *)self _logMetricsForSessionFailure:@"all" withError:v19 completion:v18];
    }
    goto LABEL_23;
  }
  if (v10)
  {
    int v11 = [v8 sessionId];
    unsigned int v12 = [v11 isEqualToString:v10];

    if (v12)
    {
      [(ADSessionManager *)self _resetWinningState];
      goto LABEL_13;
    }
  }
  if (![(ADSessionManager *)self _hasAtleastOneActiveSessionBesides:v8]) {
    goto LABEL_13;
  }
  long long v13 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    int v22 = "-[ADSessionManager assistantSession:receivedError:isRetryableError:]";
    __int16 v23 = 2112;
    id v24 = v9;
    __int16 v25 = 1024;
    BOOL v26 = v5;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Session received error but other active sessions present. Ignoring error %@ %d", buf, 0x1Cu);
  }
  id v14 = [v8 dequeueResultObjects];
  if (v5)
  {
    if (self->_requestId)
    {
      [v8 prepareForRetry];
      [v8 startRetry];
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_lastSessionError, a4);
    __int16 v16 = [v8 _adSessionTypeString];
    [(ADSessionManager *)self _logMetricsForSessionFailure:v16 withError:v9 completion:0];
  }
  if (![v8 sessionType] || objc_msgSend(v8, "sessionType") == 1) {
    self->_state = 1;
  }
  if (self->_hasActiveRequest)
  {
    id v17 = objc_loadWeakRetained((id *)&self->_delegate);
    [v17 assistantSessionManager:self didObserverIntermediateError:v9];
  }
LABEL_23:
}

- (void)assistantSession:(id)a3 cannotHandleRequest:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [v9 refId];
  if (v11)
  {
    unsigned int v12 = [(ADSessionManager *)self _keyForRequestId:v11 forSession:v8];
    if (v12)
    {
      long long v13 = [(NSMutableDictionary *)self->_reverseProxiedIdMap valueForKey:v12];
    }
    else
    {
      long long v13 = 0;
    }
  }
  else
  {
    long long v13 = 0;
    unsigned int v12 = 0;
  }
  if (![v13 isEqualToString:self->_requestId])
  {
    id WeakRetained = (NSError *)objc_loadWeakRetained((id *)&self->_delegate);
    [(NSError *)WeakRetained assistantSessionManager:self receivedCommand:v9];
    goto LABEL_19;
  }
  [v8 setHasActiveRequest:0];
  id v14 = [v8 sessionId];
  unsigned int v15 = [v14 isEqualToString:self->_winningSessionId];

  if (!v15)
  {
    if ([(ADSessionManager *)self _hasAtleastOneActiveSessionBesides:v8])
    {
      [(ADSessionManager *)self _pickDefaultWinnerWithDroppingSession:v8];
      [v8 setCanHandleRequest:0];
      goto LABEL_20;
    }
    id v18 = (NSError *)v10;
    if (!v18)
    {
      lastSessionError = self->_lastSessionError;
      if (lastSessionError)
      {
        BOOL v20 = lastSessionError;
      }
      else
      {
        BOOL v20 = +[AFError errorWithCode:2001];
      }
      id v18 = v20;
    }
    BOOL v21 = [v8 _adSessionTypeString];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000D81D4;
    v22[3] = &unk_10050E160;
    void v22[4] = self;
    __int16 v23 = v18;
    id WeakRetained = v18;
    [(ADSessionManager *)self _logMetricsForSessionFailure:v21 withError:WeakRetained completion:v22];

LABEL_19:
    goto LABEL_20;
  }
  __int16 v16 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v25 = "-[ADSessionManager assistantSession:cannotHandleRequest:error:]";
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s Ignoring as the winner has been chosen already.", buf, 0xCu);
  }
LABEL_20:
}

- (void)assistantSession:(id)a3 receivedCommand:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(ADSessionManager *)self _reverseMapSessionRequestIdToADRequestId:v7 forSession:v6];
  if (!self->_requestId) {
    goto LABEL_20;
  }
  if ([(ADSessionManager *)self _isDestructive:v7])
  {
    [(ADSessionManager *)self _logCommandToMetrics:v7 forSession:v6 outbound:0];
    p_winningSessionId = &self->_winningSessionId;
    if (!self->_winningSessionId)
    {
      if ((unint64_t)[(NSMutableArray *)self->_sessions count] >= 2)
      {
        id v24 = 0;
        unsigned int v9 = [(ADSessionManager *)self _haveUsefulness:v7 usefulnessScore:&v24];
        id WeakRetained = v24;
        if (v9) {
          [v6 setOrUpdateUsefulnessScore:WeakRetained];
        }
        [(ADSessionManager *)self _queueResultObject:v7 forSession:v6];
        goto LABEL_21;
      }
      id v18 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        id v19 = v18;
        BOOL v20 = [v6 sessionId];
        BOOL v21 = [v7 encodedClassName];
        *(_DWORD *)buf = 136315650;
        BOOL v26 = "-[ADSessionManager assistantSession:receivedCommand:]";
        __int16 v27 = 2112;
        __int16 v28 = v20;
        __int16 v29 = 2112;
        __int16 v30 = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s Session %@ wins with command %@", buf, 0x20u);
      }
      int v22 = [v6 _adSessionTypeString];
      [(ADSessionManager *)self _logContextForWinningSession:v22 forReason:@"defaultSessionHasResults" forRemoteSessionScore:0 forLocalSessionScore:0];

      __int16 v23 = [v7 refId];
      [(ADSessionManager *)self _cancelOtherSessionRequests:v6 forRefId:v23];

LABEL_20:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained assistantSessionManager:self receivedCommand:v7];
LABEL_21:

      goto LABEL_22;
    }
  }
  else
  {
    p_winningSessionId = &self->_winningSessionId;
    if (!self->_winningSessionId) {
      goto LABEL_20;
    }
  }
  int v11 = [v7 encodedClassName];
  unsigned int v12 = [(ADSessionManager *)self _allowWhitelistedCommands:v11];

  if (v12) {
    goto LABEL_20;
  }
  long long v13 = *p_winningSessionId;
  id v14 = [v6 sessionId];
  LODWORD(v13) = [(NSString *)v13 isEqualToString:v14];

  if (v13) {
    goto LABEL_20;
  }
  unsigned int v15 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v26 = "-[ADSessionManager assistantSession:receivedCommand:]";
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s Dropping command not from winning session.", buf, 0xCu);
  }
  if (objc_msgSend(v7, "ad_requiresResponse"))
  {
    __int16 v16 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      BOOL v26 = "-[ADSessionManager assistantSession:receivedCommand:]";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s Sending CommandFailed as command required response.", buf, 0xCu);
    }
    id WeakRetained = [objc_alloc((Class)SACommandFailed) initWithReason:@"Session Lost"];
    id v17 = [v7 aceId];
    [WeakRetained setRefId:v17];

    [(ADSessionManager *)self sendCommand:WeakRetained opportunistically:0 logEvent:0];
    goto LABEL_21;
  }
LABEL_22:
}

- (void)assistantSession:(id)a3 didOpenConnectionWithPolicyId:(id)a4 routeId:(id)a5 connectionDelay:(double)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  unsigned int v12 = (void *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    long long v13 = v12;
    *(_DWORD *)buf = 136315394;
    __int16 v29 = "-[ADSessionManager assistantSession:didOpenConnectionWithPolicyId:routeId:connectionDelay:]";
    __int16 v30 = 1024;
    unsigned int v31 = [v9 sessionType];
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Session did open connection with type %d", buf, 0x12u);
  }
  if (self->_state <= 2)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v14 = self->_sessions;
    id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v15)
    {
      id v16 = v15;
      id v17 = 0;
      uint64_t v18 = *(void *)v24;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v24 != v18) {
            objc_enumerationMutation(v14);
          }
          v17 += objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "sessionIsActive", (void)v23);
        }
        id v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v16);

      if (v17 && v17 == [(NSMutableArray *)self->_sessions count])
      {
        BOOL v20 = AFSiriLogContextSession;
        if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          __int16 v29 = "-[ADSessionManager assistantSession:didOpenConnectionWithPolicyId:routeId:connectionDelay:]";
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s All sessions active now.", buf, 0xCu);
        }
        self->_state = 3;
      }
    }
    else
    {
    }
    [(ADSessionManager *)self _registerForSleepNotification];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained assistantSessionManagerConnectionDidBecomeActive:self];
  }
  lastSessionError = self->_lastSessionError;
  self->_lastSessionError = 0;
}

- (void)assistantSessionWillStartConnection:(id)a3
{
  id v4 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    id v7 = "-[ADSessionManager assistantSessionWillStartConnection:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Session will start connection", (uint8_t *)&v6, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained assistantSessionManagerRequestsObservingCallState:self];
}

- (BOOL)assistantSessionShouldPrewarmConnetion:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interceptor);
  char v4 = [WeakRetained isInterceptingCommands] ^ 1;

  return v4;
}

- (void)sendRemoteGizmoDeviceToServer:(id)a3
{
  id v4 = a3;
  if (self->_state <= 1) {
    [(ADSessionManager *)self _startSessions:0];
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v5 = self->_sessions;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "sendRemoteGizmoDeviceToServer:", v4, (void)v10);
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)resetSessionsIfRequiredBasedOnOrchestrationMode:(BOOL)a3
{
  int v3 = a3;
  BOOL v5 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    id v9 = "-[ADSessionManager resetSessionsIfRequiredBasedOnOrchestrationMode:]";
    __int16 v10 = 1024;
    int v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Are we running full understanding on device for siri session: %d", (uint8_t *)&v8, 0x12u);
  }
  int preferredRemoteSessionType = self->_preferredRemoteSessionType;
  if (preferredRemoteSessionType != v3)
  {
    id v7 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315650;
      id v9 = "-[ADSessionManager resetSessionsIfRequiredBasedOnOrchestrationMode:]";
      __int16 v10 = 1024;
      int v11 = preferredRemoteSessionType;
      __int16 v12 = 1024;
      int v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Changing from session type=%d to session type=%d", (uint8_t *)&v8, 0x18u);
    }
    self->_int preferredRemoteSessionType = v3;
    [(ADSessionManager *)self cancelSynchronously];
    [(ADSessionManager *)self preheatSessions];
  }
}

- (void)_resetWinningStateAndPurgeRequestMaps
{
  [(ADSessionManager *)self resetWinningState];
  [(ADSessionManager *)self _purgeRequestMaps];
}

- (void)resetWinningState
{
  self->_continueWithPreviousWinner = 0;
  [(ADSessionManager *)self _resetWinningState];
}

- (BOOL)hasActiveSessionForSendingMetrics
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  int v3 = self->_sessions;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        unsigned int v9 = objc_msgSend(v8, "canHandleRequest", (void)v15);
        __int16 v10 = [v8 sessionId];
        if (v9
          && ((winningSessionId = self->_winningSessionId) == 0
           || [(NSString *)winningSessionId isEqualToString:v10])
          && [v8 sessionIsActive])
        {
          unsigned __int8 v12 = [v8 sessionIsWaitingForAssistantData];

          if ((v12 & 1) == 0)
          {
            BOOL v13 = 1;
            goto LABEL_16;
          }
        }
        else
        {
        }
      }
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
  BOOL v13 = 0;
LABEL_16:

  return v13;
}

- (void)adviseSessionArbiterToContinueWithPreviousWinner:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315394;
    id v7 = "-[ADSessionManager adviseSessionArbiterToContinueWithPreviousWinner:]";
    __int16 v8 = 1024;
    BOOL v9 = v3;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s shouldContinue is %d", (uint8_t *)&v6, 0x12u);
  }
  if (self->_continueWithPreviousWinner != v3) {
    self->_continueWithPreviousWinner = v3;
  }
}

- (void)_pickDefaultWinnerWithDroppingSession:(id)a3
{
  id v4 = [a3 sessionId];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obj = self->_sessions;
  id v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v39;
    location = (id *)&self->_winningSessionId;
    uint64_t v27 = *(void *)v39;
    __int16 v28 = v4;
    do
    {
      __int16 v8 = 0;
      id v29 = v6;
      do
      {
        if (*(void *)v39 != v7) {
          objc_enumerationMutation(obj);
        }
        BOOL v9 = *(void **)(*((void *)&v38 + 1) + 8 * (void)v8);
        __int16 v10 = objc_msgSend(v9, "sessionId", location);
        if ([v4 isEqualToString:v10])
        {
          id v11 = [v9 dequeueResultObjects];
        }
        else
        {
          __int16 v33 = v8;
          unsigned __int8 v12 = (void *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            BOOL v13 = v12;
            id v14 = [v9 sessionId];
            *(_DWORD *)buf = 136315394;
            id v44 = "-[ADSessionManager _pickDefaultWinnerWithDroppingSession:]";
            __int16 v45 = 2112;
            id v46 = v14;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Session %@ wins by default.", buf, 0x16u);
          }
          id v32 = v10;
          objc_storeStrong(location, v10);
          unsigned int v31 = v9;
          long long v15 = [v9 dequeueResultObjects];
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          id v16 = [v15 countByEnumeratingWithState:&v34 objects:v42 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v35;
            do
            {
              for (i = 0; i != v17; i = (char *)i + 1)
              {
                if (*(void *)v35 != v18) {
                  objc_enumerationMutation(v15);
                }
                BOOL v20 = *(void **)(*((void *)&v34 + 1) + 8 * i);
                BOOL v21 = (void *)AFSiriLogContextDaemon;
                if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
                {
                  int v22 = v21;
                  long long v23 = [v20 encodedClassName];
                  *(_DWORD *)buf = 136315394;
                  id v44 = "-[ADSessionManager _pickDefaultWinnerWithDroppingSession:]";
                  __int16 v45 = 2112;
                  id v46 = v23;
                  _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s Command %@", buf, 0x16u);
                }
                id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
                [WeakRetained assistantSessionManager:self receivedCommand:v20];
              }
              id v17 = [v15 countByEnumeratingWithState:&v34 objects:v42 count:16];
            }
            while (v17);
          }
          long long v25 = [v31 _adSessionTypeString];
          [(ADSessionManager *)self _logContextForWinningSession:v25 forReason:@"sessionCannotHandleRequest" forRemoteSessionScore:0 forLocalSessionScore:0];

          uint64_t v7 = v27;
          id v4 = v28;
          id v6 = v29;
          __int16 v10 = v32;
          __int16 v8 = v33;
        }

        __int16 v8 = (char *)v8 + 1;
      }
      while (v8 != v6);
      id v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v38 objects:v47 count:16];
    }
    while (v6);
  }
}

- (void)_cancelOtherSessionRequests:(id)a3 forRefId:(id)a4
{
  id v6 = a3;
  id v24 = a4;
  if (v24)
  {
    id v23 = v6;
    uint64_t v7 = [v6 sessionId];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    __int16 v8 = self->_sessions;
    id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v35 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v26;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(v8);
          }
          BOOL v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          id v14 = [v13 sessionId];
          unsigned __int8 v15 = [v7 isEqualToString:v14];

          if ((v15 & 1) == 0)
          {
            id v16 = [(ADSessionManager *)self _keyForRequestId:v24 forSession:v13];
            if (v16)
            {
              id v17 = [(NSMutableDictionary *)self->_proxiedIdMap valueForKey:v16];
              uint64_t v18 = AFSiriLogContextSession;
              if (v17)
              {
                if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315650;
                  __int16 v30 = "-[ADSessionManager _cancelOtherSessionRequests:forRefId:]";
                  __int16 v31 = 2112;
                  id v32 = v24;
                  __int16 v33 = 2112;
                  long long v34 = v17;
                  _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s (refId %@) causing us to cancel other session request (refId %@)", buf, 0x20u);
                }
                [v13 cancelSessionRequest:v17];
                id v19 = [v13 dequeueResultObjects];
              }
              else if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                __int16 v30 = "-[ADSessionManager _cancelOtherSessionRequests:forRefId:]";
                __int16 v31 = 2112;
                id v32 = v24;
                _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s Out of band destructive commands with %@ refId", buf, 0x16u);
              }
            }
            else
            {
              BOOL v20 = AFSiriLogContextSession;
              if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                __int16 v30 = "-[ADSessionManager _cancelOtherSessionRequests:forRefId:]";
                __int16 v31 = 2112;
                id v32 = v24;
                _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s Cannot remap to other sessions with refId %@", buf, 0x16u);
              }
            }
          }
        }
        id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v35 count:16];
      }
      while (v10);
    }

    winningSessionId = self->_winningSessionId;
    self->_winningSessionId = (NSString *)v7;

    id v6 = v23;
  }
  else
  {
    int v22 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v30 = "-[ADSessionManager _cancelOtherSessionRequests:forRefId:]";
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s Destructive command with no RefId. File bug.", buf, 0xCu);
    }
  }
}

- (BOOL)_haveUsefulness:(id)a3 usefulnessScore:(id *)a4
{
  id v5 = a3;
  char v6 = objc_opt_respondsToSelector();
  char v7 = v6;
  if (a4 && (v6 & 1) != 0)
  {
    *a4 = [v5 usefulnessScore];
  }

  return v7 & 1;
}

- (BOOL)_isDestructive:(id)a3
{
  id v3 = a3;
  if (qword_100585A20 != -1) {
    dispatch_once(&qword_100585A20, &stru_100501208);
  }
  id v4 = [v3 refId];

  if (v4)
  {
    if (objc_opt_respondsToSelector()) {
      LODWORD(v4) = [v3 mutatingCommand];
    }
    else {
      LODWORD(v4) = 0;
    }
    uint64_t v5 = qword_100585A28;
    char v6 = [v3 encodedClassName];
    LOBYTE(v5) = [(id)v5 containsObject:v6];

    if ((v5 & 1) != 0 || v4)
    {
      char v7 = [v3 groupIdentifier];
      unsigned __int8 v8 = [v7 isEqualToString:SASGroupIdentifier];

      if ((v8 & 1) != 0
        || (uint64_t v9 = qword_100585A30,
            [v3 encodedClassName],
            id v10 = objc_claimAutoreleasedReturnValue(),
            LOBYTE(v9) = [(id)v9 containsObject:v10],
            v10,
            (v9 & 1) != 0))
      {
        LODWORD(v4) = 0;
      }
      else
      {
        uint64_t v11 = +[SiriCoreNetworkActivityTracing sharedNetworkActivityTracing];
        LODWORD(v4) = 1;
        [v11 networkActivityStart:5 activate:1];

        unsigned __int8 v12 = +[SNNetworkActivityTracing sharedInstance];
        [v12 networkActivityStart:5 activate:1 completion:0];
      }
    }
    BOOL v13 = (void *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      id v14 = v13;
      unsigned __int8 v15 = [v3 encodedClassName];
      int v17 = 136315650;
      uint64_t v18 = "-[ADSessionManager _isDestructive:]";
      __int16 v19 = 2112;
      BOOL v20 = v15;
      __int16 v21 = 1024;
      int v22 = (int)v4;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Command is %@ and %d", (uint8_t *)&v17, 0x1Cu);
    }
  }

  return (char)v4;
}

- (void)_queueResultObject:(id)a3 forSession:(id)a4
{
  id v6 = a4;
  [v6 queueResultObjects:a3];
  if (v6)
  {
    char v7 = +[AFAnalytics sharedAnalytics];
    CFStringRef v14 = @"sessionType";
    unsigned __int8 v8 = [v6 _adSessionTypeString];
    unsigned __int8 v15 = v8;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    [v7 logEventWithType:923 context:v9];
  }
  if ([v6 sessionType] == self->_preferredSessionType)
  {
    id v10 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315138;
      BOOL v13 = "-[ADSessionManager _queueResultObject:forSession:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s We have results from preferred session. Evaluate.", (uint8_t *)&v12, 0xCu);
    }
    [(ADSessionManager *)self _resetResultObjectsTimer];
    self->_isQueuingResultsForDelayedEvaluation = 1;
    if ([(ADSessionManager *)self _evaluateResultObjects]) {
      [(ADSessionManager *)self _startResultObjectsTimer];
    }
  }
  else if (!self->_isQueuingResultsForDelayedEvaluation)
  {
    self->_isQueuingResultsForDelayedEvaluation = 1;
    [(ADSessionManager *)self _startResultObjectsTimer];
    uint64_t v11 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315138;
      BOOL v13 = "-[ADSessionManager _queueResultObject:forSession:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Started queueing result objects", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void)_resetResultObjectsTimer
{
  resultObjectsEvaluationTimer = self->_resultObjectsEvaluationTimer;
  if (resultObjectsEvaluationTimer)
  {
    dispatch_source_cancel(resultObjectsEvaluationTimer);
    id v4 = self->_resultObjectsEvaluationTimer;
    self->_resultObjectsEvaluationTimer = 0;
  }
}

- (void)_resultObjectsTimerFired:(id)a3
{
  id v4 = (OS_dispatch_source *)a3;
  uint64_t v5 = v4;
  if (self->_resultObjectsEvaluationTimer == v4)
  {
    self->_resultObjectsEvaluationTimer = 0;

    self->_timerFiredOnce = 1;
    if ([(ADSessionManager *)self _evaluateResultObjects])
    {
      id v6 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        int v7 = 136315138;
        unsigned __int8 v8 = "-[ADSessionManager _resultObjectsTimerFired:]";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Restarting timer as there is no winning session yet", (uint8_t *)&v7, 0xCu);
      }
      [(ADSessionManager *)self _startResultObjectsTimer];
    }
  }
}

- (void)_startResultObjectsTimer
{
  [(ADSessionManager *)self _resetResultObjectsTimer];
  unsigned int v3 = [(ADSessionManager *)self _resultObjectsHoldTime];
  id v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
  uint64_t v5 = 1000000 * v3;
  dispatch_time_t v6 = dispatch_time(0, v5);
  dispatch_source_set_timer(v4, v6, v5, 0);
  objc_initWeak(&location, self);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000D9D14;
  handler[3] = &unk_10050C7C8;
  int v7 = v4;
  uint64_t v11 = v7;
  objc_copyWeak(&v12, &location);
  dispatch_source_set_event_handler(v7, handler);
  dispatch_resume(v7);
  resultObjectsEvaluationTimer = self->_resultObjectsEvaluationTimer;
  self->_resultObjectsEvaluationTimer = (OS_dispatch_source *)v7;
  uint64_t v9 = v7;

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (unsigned)_resultObjectsHoldTime
{
  unsigned int serverDrivenResultsHoldTime = self->_serverDrivenResultsHoldTime;
  if (!serverDrivenResultsHoldTime) {
    unsigned int serverDrivenResultsHoldTime = 500;
  }
  if (self->_preferredSessionType >= 2u) {
    unsigned int v3 = 1000;
  }
  else {
    unsigned int v3 = serverDrivenResultsHoldTime;
  }
  id v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315394;
    int v7 = "-[ADSessionManager _resultObjectsHoldTime]";
    __int16 v8 = 1024;
    unsigned int v9 = v3;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s holdTime is %d", (uint8_t *)&v6, 0x12u);
  }
  return v3;
}

- (BOOL)_evaluateResultObjects
{
  id v2 = self;
  int preferredSessionType = self->_preferredSessionType;
  v54 = (char *)[(NSMutableArray *)self->_sessions count];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v4 = v2->_sessions;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v66 objects:v85 count:16];
  if (!v5)
  {

    id v23 = 0;
    id v10 = 0;
    goto LABEL_54;
  }
  id v6 = v5;
  long long v55 = v2;
  id v60 = 0;
  long long v61 = 0;
  id v7 = 0;
  id v8 = 0;
  unsigned int v9 = 0;
  id v10 = 0;
  long long v57 = 0;
  obj = v4;
  uint64_t v11 = *(void *)v67;
  int v56 = preferredSessionType;
  do
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v67 != v11) {
        objc_enumerationMutation(obj);
      }
      BOOL v13 = *(void **)(*((void *)&v66 + 1) + 8 * i);
      if ([v13 hasUsefulnessScore])
      {
        id v14 = [v13 usefulnessScore];
        if ((uint64_t)v8 <= (uint64_t)v14)
        {
          id v15 = v7;
          id v16 = v9;
          int v17 = v10;
          id v18 = v13;

          id v8 = v14;
          long long v57 = v18;
          id v10 = v17;
          unsigned int v9 = v16;
          id v7 = v15;
          int preferredSessionType = v56;
        }
        ++v61;
        if ([v13 sessionType])
        {
          unsigned int v19 = [v13 sessionType];
          if (v19 != 1) {
            id v7 = v14;
          }
          id v20 = v60;
          if (v19 == 1) {
            id v20 = v14;
          }
          id v60 = v20;
        }
        else
        {
          id v60 = v14;
        }
      }
      if ([v13 sessionType] == preferredSessionType)
      {
        id v21 = v13;

        id v10 = v21;
      }
      if ([v13 hasResultObjects])
      {
        id v22 = v13;

        unsigned int v9 = v22;
      }
    }
    id v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v66 objects:v85 count:16];
  }
  while (v6);

  id v53 = v7;
  if (v60 != v7 || !v10 || ![v10 hasResultObjects])
  {
    id v2 = v55;
    id v23 = v57;
    if (v57)
    {
      int v24 = 0;
      CFStringRef v25 = 0;
      goto LABEL_28;
    }
    if (!v55->_timerFiredOnce)
    {
      id v23 = 0;
      goto LABEL_55;
    }
    id v23 = v9;
    if (v23)
    {
      CFStringRef v25 = @"timerFiredAndSomeSessionHadResults";
      int v24 = 1;
      goto LABEL_28;
    }
LABEL_54:
    unsigned int v9 = 0;
    goto LABEL_55;
  }
  id v23 = v10;

  int v24 = 1;
  id v60 = v53;
  CFStringRef v25 = @"defaultSessionHasResults";
  id v2 = v55;
LABEL_28:
  if (v54 == v61 || [v23 sessionType] == preferredSessionType || v2->_timerFiredOnce)
  {
    CFStringRef v50 = v25;
    int v51 = v24;
    v52 = v10;
    long long v26 = [v23 dequeueResultObjects];
    long long v27 = [v26 firstObject];
    long long v28 = [v27 refId];

    [(ADSessionManager *)v2 _cancelOtherSessionRequests:v23 forRefId:v28];
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id obja = v26;
    id v29 = [obja countByEnumeratingWithState:&v62 objects:v84 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v63;
      p_delegate = (id *)&v2->_delegate;
      do
      {
        for (j = 0; j != v30; j = (char *)j + 1)
        {
          if (*(void *)v63 != v31) {
            objc_enumerationMutation(obja);
          }
          long long v34 = *(void **)(*((void *)&v62 + 1) + 8 * (void)j);
          long long v35 = (void *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            long long v36 = v35;
            long long v37 = [v34 encodedClassName];
            *(_DWORD *)buf = 136315394;
            v71 = "-[ADSessionManager _evaluateResultObjects]";
            __int16 v72 = 2112;
            v73 = v37;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "%s Command %@", buf, 0x16u);

            id v2 = v55;
          }
          id WeakRetained = objc_loadWeakRetained(p_delegate);
          [WeakRetained assistantSessionManager:v2 receivedCommand:v34];
        }
        id v30 = [obja countByEnumeratingWithState:&v62 objects:v84 count:16];
      }
      while (v30);
    }

    v2->_BOOL isQueuingResultsForDelayedEvaluation = 0;
    if (v54 == v61) {
      char v39 = 1;
    }
    else {
      char v39 = v51;
    }
    long long v40 = v2;
    if (v51) {
      CFStringRef v41 = v50;
    }
    else {
      CFStringRef v41 = @"sessionHasHigherUsefulnessScore";
    }
    if ((v39 & 1) == 0)
    {
      if (v40->_timerFiredOnce) {
        CFStringRef v41 = @"timerFiredAndSomeSessionHadResults";
      }
      else {
        CFStringRef v41 = @"onlySessionHasResults";
      }
    }
    v42 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      id v43 = v42;
      id v44 = [v23 sessionId];
      unsigned int v45 = [v23 sessionType];
      *(_DWORD *)buf = 136316674;
      v71 = "-[ADSessionManager _evaluateResultObjects]";
      __int16 v72 = 2112;
      v73 = v44;
      __int16 v74 = 1024;
      unsigned int v75 = v45;
      __int16 v76 = 2112;
      CFStringRef v77 = v41;
      __int16 v78 = 1024;
      int v79 = v56;
      __int16 v80 = 2048;
      id v81 = v60;
      __int16 v82 = 2048;
      id v83 = v53;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "%s Session %@ (type %d) wins with reason %@ preferred %d remoteSessionScore %ld localSessionScore %ld", buf, 0x40u);
    }
    id v46 = [v23 _adSessionTypeString];
    CFStringRef v47 = v41;
    id v2 = v55;
    [(ADSessionManager *)v55 _logContextForWinningSession:v46 forReason:v47 forRemoteSessionScore:v60 forLocalSessionScore:v53];

    id v10 = v52;
  }
LABEL_55:
  BOOL isQueuingResultsForDelayedEvaluation = v2->_isQueuingResultsForDelayedEvaluation;

  return isQueuingResultsForDelayedEvaluation;
}

- (int)_preferredSessionType
{
  return self->_preferredRemoteSessionType;
}

- (void)updateForCallIsLikelyDueToRequest:(BOOL)a3
{
  if (a3)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    unsigned int v3 = self->_sessions;
    id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        id v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * (void)v7), "setDormant:", 1, (void)v8);
          id v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (void)updateForCallState:(BOOL)a3
{
  if (self->_callInProcess != a3) {
    self->_callInProcess = a3;
  }
}

- (void)_unregisterForSleepNotification
{
  if (self->_ioConnect)
  {
    IOReturn v3 = IODeregisterForSystemPower(&self->_ioNotifier);
    if (v3)
    {
      IOReturn v4 = v3;
      id v5 = AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
      {
        int v6 = 136315394;
        id v7 = "-[ADSessionManager _unregisterForSleepNotification]";
        __int16 v8 = 1026;
        IOReturn v9 = v4;
        _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s Error deregistering for power notifications %{public}d", (uint8_t *)&v6, 0x12u);
      }
    }
    else
    {
      self->_ioNotifier = 0;
      IONotificationPortDestroy(self->_ioNotificationPortRef);
      self->_ioNotificationPortRef = 0;
      IOServiceClose(self->_ioConnect);
      self->_ioConnect = 0;
    }
  }
}

- (void)_registerForSleepNotification
{
  if (!self->_ioConnect)
  {
    IOReturn v3 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v5 = 136315138;
      int v6 = "-[ADSessionManager _registerForSleepNotification]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
    }
    io_connect_t v4 = IORegisterForSystemPower(self, &self->_ioNotificationPortRef, (IOServiceInterestCallback)j__objc_msgSend__powerChangedMessageType_notificationID_, &self->_ioNotifier);
    self->_ioConnect = v4;
    if (v4 + 1 >= 2) {
      IONotificationPortSetDispatchQueue(self->_ioNotificationPortRef, (dispatch_queue_t)self->_queue);
    }
    else {
      self->_ioConnect = 0;
    }
  }
}

- (void)_powerChangedMessageType:(unsigned int)a3 notificationID:(int64_t)a4
{
  HIDWORD(v4) = a3;
  LODWORD(v4) = a3 + 536870288;
  if ((v4 >> 4) <= 1)
  {
    __int16 v8 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      CFStringRef v9 = @"can sleep";
      if (a3 == -536870272) {
        CFStringRef v9 = @"will sleep";
      }
      int v12 = 136315394;
      BOOL v13 = "-[ADSessionManager _powerChangedMessageType:notificationID:]";
      __int16 v14 = 2112;
      CFStringRef v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Canceling connection due to power change notification %@", (uint8_t *)&v12, 0x16u);
    }
    if (self->_state >= 1)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      long long v11 = +[AFError errorWithCode:33];
      [WeakRetained assistantSessionManager:self receivedError:v11 isRetryableError:0];
    }
    IOAllowPowerChange(self->_ioConnect, a4);
  }
}

- (void)_languageCodeDidChange:(id)a3
{
  unint64_t v4 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v8 = "-[ADSessionManager _languageCodeDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DA964;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_enabledBitsChanged:(id)a3
{
  unint64_t v4 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v8 = "-[ADSessionManager _enabledBitsChanged:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DAB58;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_unregisterForPossibleSessionDestroyingNotifications
{
  if (self->_isRegisteredForSessionDestroyingNotifications)
  {
    self->_isRegisteredForSessionDestroyingNotifications = 0;
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self name:@"ADPreferencesEnabledBitsDidChangeNotification" object:0];
  }
}

- (void)_registerForPossibleSessionDestroyingNotifications
{
  if (!self->_isRegisteredForSessionDestroyingNotifications)
  {
    self->_isRegisteredForSessionDestroyingNotifications = 1;
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:self selector:"_enabledBitsChanged:" name:@"ADPreferencesEnabledBitsDidChangeNotification" object:0];
  }
}

- (id)_saConnectionMode
{
  id v3 = +[AFPreferences sharedPreferences];
  objc_msgSend(v3, "_ad_connectionModeFromEnabledState");
  unint64_t v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  connectionMode = self->_connectionMode;
  self->_connectionMode = v4;

  int v6 = self->_connectionMode;
  return v6;
}

- (void)_cloudPreferencesDidSync:(id)a3
{
  unint64_t v4 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v8 = "-[ADSessionManager _cloudPreferencesDidSync:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DAE70;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_sharedAssistantdIdentifierDidChange:(id)a3
{
  unint64_t v4 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v8 = "-[ADSessionManager _sharedAssistantdIdentifierDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DAF84;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_updateSharedUserIdentifiers
{
  if (self->_sharedUserIdentifier) {
    return;
  }
  if (self->_sharedUserIdentifierState == 1) {
    return;
  }
  id v3 = +[ADPreferences sharedPreferences];
  unint64_t v4 = [v3 sharedUserIdentifier];
  sharedUserIdentifier = self->_sharedUserIdentifier;
  self->_sharedUserIdentifier = v4;

  int v6 = +[ADPreferences sharedPreferences];
  id v7 = [v6 loggingSharedUserIdentifier];
  loggingSharedUserIdentifier = self->_loggingSharedUserIdentifier;
  self->_loggingSharedUserIdentifier = v7;

  self->_int64_t sharedUserIdentifierState = 1;
  if (AFSupportsMultiUser()) {
    return;
  }
  int64_t sharedUserIdentifierState = self->_sharedUserIdentifierState;
  if (!self->_sharedUserIdentifier || !self->_loggingSharedUserIdentifier)
  {
    long long v10 = +[ADCloudKitManager sharedManager];
    unsigned int v11 = [v10 preferencesHaveBeenSynchronized];

    if (v11)
    {
      int v12 = self->_sharedUserIdentifier;
      if (v12)
      {
        BOOL v13 = v12;
        __int16 v14 = self->_sharedUserIdentifier;
        self->_sharedUserIdentifier = v13;
      }
      else
      {
        __int16 v14 = +[NSUUID UUID];
        int v17 = [v14 UUIDString];
        id v18 = self->_sharedUserIdentifier;
        self->_sharedUserIdentifier = v17;
      }
      unsigned int v19 = self->_loggingSharedUserIdentifier;
      if (v19)
      {
        id v20 = v19;
        id v21 = self->_loggingSharedUserIdentifier;
        self->_loggingSharedUserIdentifier = v20;
      }
      else
      {
        id v21 = +[NSUUID UUID];
        id v22 = [v21 UUIDString];
        id v23 = self->_loggingSharedUserIdentifier;
        self->_loggingSharedUserIdentifier = v22;
      }
      int v24 = +[ADPreferences sharedPreferences];
      [v24 setSharedUserIdentifier:self->_sharedUserIdentifier loggingSharedUserIdentifier:self->_loggingSharedUserIdentifier];

      goto LABEL_17;
    }
  }
  if (sharedUserIdentifierState)
  {
LABEL_17:
    CFStringRef v25 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      long long v26 = self->_sharedUserIdentifier;
      int v28 = 136315395;
      id v29 = "-[ADSessionManager _updateSharedUserIdentifiers]";
      __int16 v30 = 2113;
      uint64_t v31 = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%s Created new sharedUserId %{private}@", (uint8_t *)&v28, 0x16u);
    }
    long long v27 = +[NSNotificationCenter defaultCenter];
    [v27 postNotificationName:@"ADSharedDataDidChangeNotification" object:0];

    return;
  }
  CFStringRef v15 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    id v16 = self->_sharedUserIdentifier;
    int v28 = 136315395;
    id v29 = "-[ADSessionManager _updateSharedUserIdentifiers]";
    __int16 v30 = 2113;
    uint64_t v31 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s Unchanged sharedUserId %{private}@", (uint8_t *)&v28, 0x16u);
  }
}

- (id)_languageCode
{
  languageCode = self->_languageCode;
  if (!languageCode)
  {
    unint64_t v4 = +[ADPreferences sharedPreferences];
    int v5 = [v4 languageCode];
    int v6 = self->_languageCode;
    self->_languageCode = v5;

    languageCode = self->_languageCode;
  }
  return languageCode;
}

- (void)_purgeRequestMaps
{
  id v3 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    int v5 = "-[ADSessionManager _purgeRequestMaps]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  [(NSMutableDictionary *)self->_proxiedIdMap removeAllObjects];
  [(NSMutableDictionary *)self->_reverseProxiedIdMap removeAllObjects];
  [(NSMutableDictionary *)self->_sessionOriginatedCommandTable removeAllObjects];
}

- (void)endRetryableRequestForCommand:(id)a3
{
  id v4 = a3;
  int v5 = [v4 aceId];
  id v16 = v4;
  int v6 = [v4 refId];
  id v7 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v23 = "-[ADSessionManager endRetryableRequestForCommand:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  __int16 v8 = self->_sessions;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        BOOL v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        __int16 v14 = [(ADSessionManager *)self _mapADRequestIdToSessionRequestId:v5 forSession:v13];
        if (v6)
        {
          CFStringRef v15 = [(ADSessionManager *)self _mapADRequestIdToSessionRequestId:v6 forSession:v13];
        }
        else
        {
          CFStringRef v15 = 0;
        }
        [v13 endRetryableRequestForCommandAceId:v14 refId:v15];
      }
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }
}

- (void)resetRetryManager
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = self->_sessions;
  id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      int v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * (void)v6), "resetRetryManager", (void)v7);
        int v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)startRetry
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = self->_sessions;
  id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        long long v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        objc_msgSend(v7, "prepareForRetry", (void)v8);
        [v7 startRetry];
      }
      id v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)resetSessionsAtNextRequestBoundaryWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (self->_hasActiveRequest || [(NSMutableSet *)self->_assertions count])
  {
    uint64_t v5 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      long long v11 = "-[ADSessionManager resetSessionsAtNextRequestBoundaryWithCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Pending until request is over", (uint8_t *)&v10, 0xCu);
    }
    self->_needsResetOnRequestBoundary = 1;
    if (v4)
    {
      if (self->_sessionResetOnRequestBoundaryCompletion)
      {
        v4[2](v4);
      }
      else
      {
        int v6 = objc_retainBlock(v4);
        id sessionResetOnRequestBoundaryCompletion = self->_sessionResetOnRequestBoundaryCompletion;
        self->_id sessionResetOnRequestBoundaryCompletion = v6;
      }
    }
  }
  else
  {
    long long v8 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      long long v11 = "-[ADSessionManager resetSessionsAtNextRequestBoundaryWithCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Resetting immediately", (uint8_t *)&v10, 0xCu);
    }
    self->_needsResetOnRequestBoundary = 0;
    long long v9 = +[AFAnalytics sharedAnalytics];
    [v9 logEventWithType:925 context:0];

    if (v4) {
      v4[2](v4);
    }
    [(ADSessionManager *)self _resetSessionsAndMakeQuiet:self->_sessions == 0];
  }
}

- (void)resetSessionsAtNextRequestBoundary
{
}

- (void)_resetSessionsAndMakeQuiet:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v23 = "-[ADSessionManager _resetSessionsAndMakeQuiet:]";
    __int16 v24 = 1024;
    BOOL v25 = v3;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s Starting sessions and make quiet: %d", buf, 0x12u);
  }
  self->_int preferredSessionType = self->_preferredRemoteSessionType;
  if (!self->_state)
  {
    [(ADSessionManager *)self _startSessions:v3];
    return;
  }
  [(ADSessionManager *)self _resetWinningStateAndPurgeRequestMaps];
  id v6 = [(NSMutableArray *)self->_sessions copy];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    char v11 = 1;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        BOOL v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        unsigned int v14 = objc_msgSend(v13, "sessionType", (void)v17);
        CFStringRef v15 = [(ADSessionManager *)self _languageCode];
        [v13 setLanguageCode:v15];

        id v16 = [(ADSessionManager *)self _saConnectionMode];
        [v13 setConnectionMode:v16];

        [v13 resetConnection];
        v11 &= v14 > 1;
      }
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);

    if ((v11 & 1) == 0) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  -[ADSessionManager _startSession:makeQuiet:](self, "_startSession:makeQuiet:", self->_preferredRemoteSessionType, v3, (void)v17);
LABEL_16:
}

- (void)cancelSynchronously
{
  self->_state = 0;
}

- (void)cancel
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000DBC4C;
  v4[3] = &unk_10050B790;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_cancelSynchronously:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(NSMutableArray *)self->_sessions copy];
  [(NSMutableArray *)self->_sessions removeAllObjects];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        char v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (v3) {
          [v11 cancelSynchronously];
        }
        else {
          objc_msgSend(v11, "cancel", (void)v12);
        }
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [(ADSessionManager *)self _unregisterForPossibleSessionDestroyingNotifications];
}

- (void)beginUpdatingAssistantData
{
  if (self->_state <= 1) {
    [(ADSessionManager *)self _startSessions:0];
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  BOOL v3 = self->_sessions;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * (void)v7), "beginUpdatingAssistantData", (void)v8);
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)preheatSessions
{
}

- (void)preheatAndMakeQuiet:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_state > 1)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = self->_sessions;
    id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        long long v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v8), "preheatAndMakeQuiet:", v3, (void)v9);
          long long v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
  else
  {
    -[ADSessionManager _startSessions:](self, "_startSessions:");
  }
}

- (void)_startSession:(int)a3 makeQuiet:(BOOL)a4
{
  id v6 = +[ADSession sessionClassForType:*(void *)&a3];
  [(ADSessionManager *)self _updateSharedUserIdentifiers];
  id v7 = [v6 alloc];
  queue = self->_queue;
  account = self->_account;
  long long v10 = [(ADSessionManager *)self _languageCode];
  long long v11 = [(ADSessionManager *)self _saConnectionMode];
  id v12 = [v7 initOnQueue:queue withAccount:account languageCode:v10 connectionMode:v11 sharedUserIdentifier:self->_sharedUserIdentifier loggingSharedUserIdentifier:self->_loggingSharedUserIdentifier instanceContext:self->_instanceContext];

  [v12 setDelegate:self];
  if (!a4)
  {
    [v12 eagerlyFetchAssistantData];
    [v12 preheatAndMakeQuiet:0];
  }
  [(NSMutableArray *)self->_sessions addObject:v12];
  [(ADSessionManager *)self setAWDRequestRecordMetrics:self->_awdRequestRecord];
  long long v13 = (void *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    long long v14 = v13;
    long long v15 = [v12 sessionId];
    id v16 = [(NSMutableArray *)self->_sessions count];
    *(_DWORD *)buf = 136315650;
    long long v18 = "-[ADSessionManager _startSession:makeQuiet:]";
    __int16 v19 = 2112;
    long long v20 = v15;
    __int16 v21 = 2048;
    id v22 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Started a session with id %@, count = %tu", buf, 0x20u);
  }
}

- (void)_startSessions:(BOOL)a3
{
  BOOL v3 = a3;
  [(ADSessionManager *)self _registerForPossibleSessionDestroyingNotifications];
  int64_t state = self->_state;
  if (!state)
  {
    [(ADSessionManager *)self _resetWinningStateAndPurgeRequestMaps];
    self->_int64_t state = 2;
    [(ADSessionManager *)self _startSession:self->_preferredRemoteSessionType makeQuiet:v3];
    int64_t state = self->_state;
  }
  if (state == 1)
  {
    self->_int64_t state = 2;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = self->_sessions;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v18 objects:v28 count:16];
    if (v7)
    {
      id v9 = v7;
      uint64_t v10 = *(void *)v19;
      *(void *)&long long v8 = 136315650;
      long long v17 = v8;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v6);
          }
          id v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if ((objc_msgSend(v12, "sessionIsActive", v17, (void)v18) & 1) == 0
            && ([v12 sessionIsAttemptingTryOrRetry] & 1) == 0)
          {
            long long v13 = (void *)AFSiriLogContextSession;
            if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
            {
              long long v14 = v13;
              long long v15 = [v12 _adSessionTypeString];
              id v16 = [v12 sessionId];
              *(_DWORD *)buf = v17;
              id v23 = "-[ADSessionManager _startSessions:]";
              __int16 v24 = 2112;
              BOOL v25 = v15;
              __int16 v26 = 2112;
              long long v27 = v16;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Resetting %@ session with Id %@", buf, 0x20u);
            }
            [v12 resetConnection];
          }
        }
        id v9 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v18 objects:v28 count:16];
      }
      while (v9);
    }
  }
}

- (void)dealloc
{
  BOOL v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"ADPreferencesLanguageCodeDidChangeNotification" object:0];
  [v3 removeObserver:self name:@"ADPreferencesSharedUserIdentifierDidChangeNotification" object:0];
  [v3 removeObserver:self name:@"ADCloudKitManagerPreferencesDidSyncNotification" object:0];
  [(ADSessionManager *)self _unregisterForPossibleSessionDestroyingNotifications];
  [(ADSessionManager *)self _unregisterForSleepNotification];
  id v4 = +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics];
  [v4 setOrchestratorRequestId:0];

  id v5 = +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics];
  [v5 setNetId:0];

  id v6 = +[SiriCoreNetworkingAnalytics sharedSiriCoreNetworkingAnalytics];
  [v6 setNetIdAvailable:0];

  id v7 = +[SNNetworkAnalytics sharedSNNetworkAnalytics];
  [v7 setOrchestratorRequestId:0];

  long long v8 = +[SNNetworkAnalytics sharedSNNetworkAnalytics];
  [v8 setNetId:0];

  id v9 = +[SNNetworkAnalytics sharedSNNetworkAnalytics];
  [v9 setNetIdAvailable:0];

  v10.receiver = self;
  v10.super_class = (Class)ADSessionManager;
  [(ADSessionManager *)&v10 dealloc];
}

- (id)initOnQueue:(id)a3 account:(id)a4 instanceContext:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)ADSessionManager;
  id v12 = [(ADSessionManager *)&v22 init];
  long long v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_account, a4);
    objc_storeStrong((id *)&v13->_queue, a3);
    objc_storeStrong((id *)&v13->_instanceContext, a5);
    v13->_int64_t sharedUserIdentifierState = 0;
    long long v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:v13 selector:"_languageCodeDidChange:" name:@"ADPreferencesLanguageCodeDidChangeNotification" object:0];
    [v14 addObserver:v13 selector:"_sharedAssistantdIdentifierDidChange:" name:@"ADPreferencesSharedUserIdentifierDidChangeNotification" object:0];
    [v14 addObserver:v13 selector:"_cloudPreferencesDidSync:" name:@"ADCloudKitManagerPreferencesDidSyncNotification" object:0];
    long long v15 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    sessions = v13->_sessions;
    v13->_sessions = v15;

    v13->_int64_t state = 0;
    int v17 = AFDeviceSupportsFullSiriUOD();
    v13->_int preferredRemoteSessionType = v17;
    long long v18 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v24 = "-[ADSessionManager initOnQueue:account:instanceContext:]";
      __int16 v25 = 1024;
      int v26 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s _int preferredRemoteSessionType = %u", buf, 0x12u);
    }
    long long v19 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    assertions = v13->_assertions;
    v13->_assertions = v19;
  }
  return v13;
}

@end