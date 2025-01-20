@interface ADSession
+ (Class)sessionClassForType:(int)a3;
+ (int)_adSessionTypeFromString:(id)a3;
- (ADSessionDelegate)delegate;
- (BOOL)_commandRequiresServerConnection:(id)a3;
- (BOOL)_commandRequiresSync:(id)a3;
- (BOOL)_refIdIsLimboId:(id)a3;
- (BOOL)_shouldSendAssistantData;
- (BOOL)_waitingForAssistantData;
- (BOOL)canHandleRequest;
- (BOOL)dormant;
- (BOOL)hasLoadedAssistant;
- (BOOL)hasResultObjects;
- (BOOL)hasUsefulnessScore;
- (BOOL)sessionIsActive;
- (BOOL)sessionIsAttemptingTryOrRetry;
- (BOOL)sessionRequiresServerConnection;
- (BOOL)sessionRequiresSync;
- (BOOL)supportsSync;
- (NSString)connectionMode;
- (NSString)languageCode;
- (NSString)loggingSharedUserIdentifier;
- (NSString)sharedUserIdentifier;
- (OS_dispatch_queue)queue;
- (id)_account;
- (id)_adSessionTypeString;
- (id)_cachedAssistantData;
- (id)_currentConnectionType;
- (id)_currentSNConnectionType;
- (id)_pendingCommands;
- (id)_requestId;
- (id)_saConnectionType;
- (id)_saSNConnectionType;
- (id)_sendBuffer;
- (id)awdRequestRecord;
- (id)connection;
- (id)currentConnectionPreCachedMetrics;
- (id)currentSNConnectionPreCachedMetrics;
- (id)dequeueResultObjects;
- (id)initOnQueue:(id)a3 withAccount:(id)a4;
- (id)initOnQueue:(id)a3 withAccount:(id)a4 languageCode:(id)a5 connectionMode:(id)a6 sharedUserIdentifier:(id)a7 loggingSharedUserIdentifier:(id)a8 instanceContext:(id)a9;
- (id)sessionId;
- (int)sessionType;
- (int64_t)state;
- (int64_t)usefulnessScore;
- (void)_addLimboId:(id)a3;
- (void)_addPendingCommand:(id)a3;
- (void)_cancelSynchronously:(BOOL)a3;
- (void)_clearLimbo;
- (void)_clearSendBuffer;
- (void)_informDelegateCannotHandleRequest:(id)a3 error:(id)a4;
- (void)_informDelegateOfError:(id)a3;
- (void)_informDelegateWillRetryOnError:(id)a3;
- (void)_passObjectToDelegate:(id)a3;
- (void)_pendDormantCommand:(id)a3;
- (void)_removeLimboId:(id)a3;
- (void)_removeRequestForAssistantData;
- (void)_requestForAssistantData;
- (void)_resetSessionRequiresServerConnection;
- (void)_resetSessionRequiresSync;
- (void)_saGetAssistantData:(id)a3;
- (void)_sendAssistantDataAndPendingCommandsIfNeeded:(id)a3;
- (void)_sendAssistantDataChangedSinceAnchor:(id)a3 refId:(id)a4;
- (void)_sendCommandFailedWithRefId:(id)a3;
- (void)_sendDestroyAssistant;
- (void)_sendLimboCommand:(id)a3;
- (void)_sendPendingCommands;
- (void)_sendPendingDormantCommands;
- (void)_sendServerCommand:(id)a3;
- (void)_sendServerCommands:(id)a3;
- (void)_setAssistantDataAnchorIfNeeded:(id)a3;
- (void)_setCurrentConnectionType:(id)a3;
- (void)_setDormantWithStyle:(int64_t)a3;
- (void)_setPendingAssistantDataAnchor:(id)a3;
- (void)_setRequestId:(id)a3;
- (void)_setSNCurrentConnectionType:(id)a3;
- (void)_setSessionId:(id)a3;
- (void)_setSessionOpened;
- (void)assistantDataManager:(id)a3 didUpdateAssistantData:(id)a4;
- (void)beginUpdatingAssistantData;
- (void)cancel;
- (void)cancelSessionRequest:(id)a3;
- (void)cancelSynchronously;
- (void)dealloc;
- (void)eagerlyFetchAssistantData;
- (void)getConnectionMetrics:(id)a3;
- (void)getSNConnectionMetrics:(id)a3;
- (void)handleCommand:(id)a3;
- (void)preheatAndMakeQuiet:(BOOL)a3;
- (void)prepareForRetry;
- (void)queueResultObjects:(id)a3;
- (void)refreshValidationData;
- (void)resetConnection;
- (void)sendCommand:(id)a3 opportunistically:(BOOL)a4;
- (void)sendCommands:(id)a3 opportunistically:(BOOL)a4;
- (void)setAWDRequestRecord:(id)a3;
- (void)setCanHandleRequest:(BOOL)a3;
- (void)setConnectionMode:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDormant:(BOOL)a3;
- (void)setLanguageCode:(id)a3;
- (void)setLoggingSharedUserIdentifier:(id)a3;
- (void)setOrUpdateUsefulnessScore:(id)a3;
- (void)setSessionType:(int)a3;
- (void)setSharedUserIdentifier:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation ADSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingSharedUserIdentifier, 0);
  objc_storeStrong((id *)&self->_sharedUserIdentifier, 0);
  objc_storeStrong((id *)&self->_awdRequestRecord, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_resultObjectsQueue, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_dormantQueue, 0);
  objc_storeStrong((id *)&self->_assistantDataRefId, 0);
  objc_storeStrong((id *)&self->_cachedAssistantData, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentSNConnectionType, 0);
  objc_storeStrong((id *)&self->_currentConnectionType, 0);
  objc_storeStrong((id *)&self->_sendBuffer, 0);
  objc_storeStrong((id *)&self->_limboIds, 0);
  objc_storeStrong((id *)&self->_pendingCommands, 0);
  objc_storeStrong((id *)&self->_pendingAssistantDataAnchor, 0);
  objc_storeStrong((id *)&self->_connectionMode, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (BOOL)dormant
{
  return self->_dormant;
}

- (void)setDelegate:(id)a3
{
}

- (ADSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ADSessionDelegate *)WeakRetained;
}

- (void)setSessionType:(int)a3
{
  self->_sessionType = a3;
}

- (int)sessionType
{
  return self->_sessionType;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setConnectionMode:(id)a3
{
}

- (NSString)connectionMode
{
  return self->_connectionMode;
}

- (void)setLoggingSharedUserIdentifier:(id)a3
{
}

- (NSString)loggingSharedUserIdentifier
{
  return self->_loggingSharedUserIdentifier;
}

- (void)setSharedUserIdentifier:(id)a3
{
}

- (NSString)sharedUserIdentifier
{
  return self->_sharedUserIdentifier;
}

- (void)setLanguageCode:(id)a3
{
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)hasUsefulnessScore
{
  return self->_hasUsefulnessScore;
}

- (int64_t)usefulnessScore
{
  return self->_resultUsefulnessScore;
}

- (BOOL)hasResultObjects
{
  return [(NSMutableArray *)self->_resultObjectsQueue count] != 0;
}

- (void)setOrUpdateUsefulnessScore:(id)a3
{
  id v4 = [a3 integerValue];
  if ((uint64_t)v4 >= self->_resultUsefulnessScore)
  {
    self->_resultUsefulnessScore = (int64_t)v4;
    self->_hasUsefulnessScore = 1;
  }
}

- (id)dequeueResultObjects
{
  if ([(NSMutableArray *)self->_resultObjectsQueue count])
  {
    v3 = self->_resultObjectsQueue;
    resultObjectsQueue = self->_resultObjectsQueue;
    self->_resultObjectsQueue = 0;
  }
  else
  {
    v3 = 0;
  }
  self->_resultUsefulnessScore = 0;
  self->_hasUsefulnessScore = 0;
  return v3;
}

- (void)queueResultObjects:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  id v8 = v4;
  if (self->_resultObjectsQueue)
  {
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  resultObjectsQueue = self->_resultObjectsQueue;
  self->_resultObjectsQueue = v6;

  id v5 = v8;
  if (v8)
  {
LABEL_3:
    id v4 = [(NSMutableArray *)self->_resultObjectsQueue addObject:v8];
    id v5 = v8;
  }
LABEL_4:
  _objc_release_x1(v4, v5);
}

- (id)_currentSNConnectionType
{
  return self->_currentSNConnectionType;
}

- (id)_currentConnectionType
{
  return self->_currentConnectionType;
}

- (void)_setSNCurrentConnectionType:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    id v4 = (SNConnectionType *)objc_msgSend(objc_alloc((Class)SNConnectionType), "initWithTechnology:", objc_msgSend(v6, "technology"));
    currentSNConnectionType = self->_currentSNConnectionType;
    self->_currentSNConnectionType = v4;
  }
  else
  {
    currentSNConnectionType = self->_currentSNConnectionType;
    self->_currentSNConnectionType = 0;
  }
}

- (void)_setCurrentConnectionType:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    id v4 = (SiriCoreConnectionType *)objc_msgSend(objc_alloc((Class)SiriCoreConnectionType), "initWithTechnology:", objc_msgSend(v6, "technology"));
    currentConnectionType = self->_currentConnectionType;
    self->_currentConnectionType = v4;
  }
  else
  {
    currentConnectionType = self->_currentConnectionType;
    self->_currentConnectionType = 0;
  }
}

- (id)_account
{
  return self->_account;
}

- (void)_cancelSynchronously:(BOOL)a3
{
  BOOL v3 = a3;
  [(ADSession *)self _clearSendBuffer];
  [(ADSession *)self _clearLimbo];
  [(ADSession *)self _removeRequestForAssistantData];
  currentConnectionType = self->_currentConnectionType;
  self->_currentConnectionType = 0;

  currentSNConnectionType = self->_currentSNConnectionType;
  self->_currentSNConnectionType = 0;

  [(ADSession *)self _resetServerConnectionSynchronously:v3 completion:0];
}

- (id)connection
{
  return 0;
}

- (id)sessionId
{
  return self->_sessionId;
}

- (BOOL)sessionIsAttemptingTryOrRetry
{
  return self->_state > 0;
}

- (BOOL)sessionIsActive
{
  return self->_state > 10;
}

- (BOOL)hasLoadedAssistant
{
  return self->_state > 10;
}

- (void)setDormant:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 0;
  }
  [(ADSession *)self _setDormantWithStyle:v3];
}

- (void)resetConnection
{
  [(ADSession *)self _resetServerConnectionSynchronously:0 completion:0];
  [(ADSession *)self _startConnection];
}

- (void)cancelSessionRequest:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    v9 = "-[ADSession cancelSessionRequest:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v8, 0xCu);
  }
  id v6 = objc_alloc_init((Class)SACancelRequest);
  [v6 setRefId:v4];
  [(ADSession *)self _sendServerCommand:v6];
  id v7 = objc_alloc_init((Class)SARollbackRequest);
  [v7 setRefId:v4];
  [v7 setRequestId:v4];
  [v7 setReason:SARollbackReasonSIRIMINI_ARBITRATIONValue];
  [(ADSession *)self _sendServerCommand:v7];
}

- (void)cancelSynchronously
{
}

- (void)cancel
{
}

- (void)prepareForRetry
{
  uint64_t v3 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[ADSession prepareForRetry]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  if (self->_state > 10) {
    [(ADSession *)self _cancelSynchronously:0];
  }
  else {
    [(ADSession *)self _clearLimbo];
  }
}

- (id)currentSNConnectionPreCachedMetrics
{
  return 0;
}

- (void)getSNConnectionMetrics:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
}

- (id)currentConnectionPreCachedMetrics
{
  return 0;
}

- (void)getConnectionMetrics:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
}

- (void)handleCommand:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100233C10;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)sendCommands:(id)a3 opportunistically:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (self->_state == 11 && ![(ADSession *)self _waitingForAssistantData])
  {
    [(ADSession *)self _sendServerCommands:v6];
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          -[ADSession sendCommand:opportunistically:](self, "sendCommand:opportunistically:", *(void *)(*((void *)&v12 + 1) + 8 * (void)v11), v4, (void)v12);
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void)sendCommand:(id)a3 opportunistically:(BOOL)a4
{
  id v6 = a3;
  id v7 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315394;
    v19 = "-[ADSession sendCommand:opportunistically:]";
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v18, 0x16u);
  }
  if (v6)
  {
    if (self->_dormant)
    {
      id v8 = (void *)AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
      {
        id v9 = v8;
        unsigned int v10 = [(ADSession *)self sessionType];
        int v18 = 136315394;
        v19 = "-[ADSession sendCommand:opportunistically:]";
        __int16 v20 = 1024;
        LODWORD(v21) = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Pending command because session is dormant for %d", (uint8_t *)&v18, 0x12u);
      }
      [(ADSession *)self _pendDormantCommand:v6];
      if (!a4)
      {
        v11 = AFSiriLogContextSession;
        if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
        {
          int v18 = 136315138;
          v19 = "-[ADSession sendCommand:opportunistically:]";
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Waking up dormant session because inopportunistic command needs to be sent.", (uint8_t *)&v18, 0xCu);
        }
        [(ADSession *)self _setDormantWithStyle:0];
      }
      goto LABEL_32;
    }
    if ([(ADSession *)self _commandRequiresServerConnection:v6])
    {
      long long v12 = AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
      {
        int v18 = 136315138;
        v19 = "-[ADSession sendCommand:opportunistically:]";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s _sessionRequiresServerConnection set to YES", (uint8_t *)&v18, 0xCu);
      }
      self->_sessionRequiresServerConnection = 1;
    }
    if ([(ADSession *)self _commandRequiresSync:v6])
    {
      long long v13 = AFSiriLogContextSession;
      if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
      {
        int v18 = 136315138;
        v19 = "-[ADSession sendCommand:opportunistically:]";
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s _commandRequiresSync set to YES", (uint8_t *)&v18, 0xCu);
      }
      self->_sessionRequiresSync = 1;
    }
    if (self->_state < 11 || objc_msgSend(v6, "siriCore_bufferingAllowedDuringActiveSession"))
    {
      sendBuffer = self->_sendBuffer;
      if (!sendBuffer)
      {
        long long v15 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
        v16 = self->_sendBuffer;
        self->_sendBuffer = v15;

        sendBuffer = self->_sendBuffer;
      }
      [(NSMutableArray *)sendBuffer addObject:v6];
    }
    int64_t state = self->_state;
    if (state == 11)
    {
      if (![(ADSession *)self _waitingForAssistantData])
      {
        [(ADSession *)self _sendServerCommand:v6];
        goto LABEL_32;
      }
LABEL_31:
      [(ADSession *)self _addPendingCommand:v6];
      goto LABEL_32;
    }
    if ((unint64_t)(state - 8) <= 2)
    {
      if (![(ADSession *)self _waitingForAssistantData])
      {
        [(ADSession *)self _sendLimboCommand:v6];
        goto LABEL_32;
      }
      goto LABEL_31;
    }
    switch(state)
    {
      case 1:
      case 2:
      case 3:
      case 6:
        goto LABEL_31;
      case 4:
      case 5:
      case 7:
        [(ADSession *)self _addPendingCommand:v6];
        [(ADSession *)self _startSession];
        break;
      default:
        [(ADSession *)self _addPendingCommand:v6];
        if (!a4) {
          [(ADSession *)self _startConnection];
        }
        break;
    }
  }
LABEL_32:
}

- (BOOL)canHandleRequest
{
  return self->_canHandleRequest;
}

- (void)setCanHandleRequest:(BOOL)a3
{
  self->_canHandleRequest = a3;
}

- (void)refreshValidationData
{
  uint64_t v3 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[ADSession refreshValidationData]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  [(ADSession *)self _setDormantWithStyle:0];
}

- (void)beginUpdatingAssistantData
{
  if (!self->_shouldSendAssistantData)
  {
    self->_shouldSendAssistantData = 1;
    int64_t state = self->_state;
    if (state >= 8)
    {
      if (self->_cachedAssistantData)
      {
        if (state == 8)
        {
          uint64_t v4 = 0;
        }
        else
        {
          uint64_t v4 = [(ADAccount *)self->_account lastAssistantDataAnchor];
        }
        id v5 = (id)v4;
        [(ADSession *)self _sendAssistantDataChangedSinceAnchor:v4 refId:0];
      }
    }
  }
}

- (void)eagerlyFetchAssistantData
{
  v2 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[ADSession eagerlyFetchAssistantData]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  uint64_t v3 = +[ADAssistantDataManager sharedDataManager];
  [v3 requestAssistantDataUpdateHighPriority:0];
}

- (void)preheatAndMakeQuiet:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    id v6 = v5;
    id v7 = +[NSNumber numberWithBool:v3];
    int v11 = 136315394;
    long long v12 = "-[ADSession preheatAndMakeQuiet:]";
    __int16 v13 = 2112;
    long long v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v11, 0x16u);
  }
  int64_t state = self->_state;
  if (!state)
  {
    [(ADSession *)self _startConnection];
    if (!v3) {
      return;
    }
    id v9 = self;
    uint64_t v10 = 1;
    goto LABEL_9;
  }
  if (self->_dormant && !v3)
  {
    id v9 = self;
    uint64_t v10 = 0;
LABEL_9:
    [(ADSession *)v9 _setDormantWithStyle:v10];
    return;
  }
  if (state >= 11 && !v3) {
    [(ADSession *)self _probeSessionIfIdle];
  }
}

- (void)_setDormantWithStyle:(int64_t)a3
{
  BOOL v3 = a3 != 0;
  if (self->_dormant != v3)
  {
    id v6 = (void *)AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      id v7 = v6;
      unsigned int v8 = [(ADSession *)self sessionType];
      CFStringRef v9 = @"active";
      *(void *)&v10[4] = "-[ADSession _setDormantWithStyle:]";
      *(_DWORD *)uint64_t v10 = 136315650;
      if (a3) {
        CFStringRef v9 = @"dormant";
      }
      *(_WORD *)&v10[12] = 1024;
      *(_DWORD *)&v10[14] = v8;
      __int16 v11 = 2112;
      CFStringRef v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Setting dormant state for session %d to %@", v10, 0x1Cu);
    }
    self->_dormant = v3;
    if (a3)
    {
      if (a3 == 2) {
        [(ADSession *)self _forceFastDormancy];
      }
      [(ADSession *)self _releaseDormancySuspension];
    }
    else
    {
      [(ADSession *)self _sendPendingDormantCommands];
    }
  }
}

- (void)_sendPendingDormantCommands
{
  BOOL v3 = (void *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v4 = v3;
    int v7 = 136315394;
    unsigned int v8 = "-[ADSession _sendPendingDormantCommands]";
    __int16 v9 = 1024;
    unsigned int v10 = [(ADSession *)self sessionType];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Sending pending dormant commands now that the session is no longer dormant for session %d", (uint8_t *)&v7, 0x12u);
  }
  dormantQueue = self->_dormantQueue;
  self->_dormantQueue = 0;
  id v6 = dormantQueue;

  [(ADSession *)self sendCommands:v6 opportunistically:0];
}

- (void)_pendDormantCommand:(id)a3
{
  id v4 = a3;
  dormantQueue = self->_dormantQueue;
  id v8 = v4;
  if (!dormantQueue)
  {
    id v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    int v7 = self->_dormantQueue;
    self->_dormantQueue = v6;

    id v4 = v8;
    dormantQueue = self->_dormantQueue;
  }
  [(NSMutableArray *)dormantQueue addObject:v4];
}

- (void)_saGetAssistantData:(id)a3
{
  id v4 = [a3 aceId];
  id obj = [v4 copy];

  if (self->_cachedAssistantData) {
    [(ADSession *)self _sendAssistantDataChangedSinceAnchor:0 refId:obj];
  }
  else {
    objc_storeStrong((id *)&self->_assistantDataRefId, obj);
  }
}

- (void)_setAssistantDataAnchorIfNeeded:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(ADSession *)self _waitingForAssistantData];
  id v6 = AFSiriLogContextSession;
  BOOL v7 = os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      int v16 = 136315138;
      v17 = "-[ADSession _setAssistantDataAnchorIfNeeded:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Still waiting on SAD, postponing clearing limbo.", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    if (v7)
    {
      int v16 = 136315138;
      v17 = "-[ADSession _setAssistantDataAnchorIfNeeded:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Not waiting on SAD, clearing limbo now.", (uint8_t *)&v16, 0xCu);
    }
    [(ADSession *)self _clearLimbo];
  }
  id v8 = [v4 dataAnchor];
  __int16 v9 = [(ADSession *)self _account];
  unsigned int v10 = v9;
  if (self->_pendingAssistantDataAnchor)
  {
    objc_msgSend(v9, "setLastAssistantDataAnchor:");
    [v10 save];
    pendingAssistantDataAnchor = self->_pendingAssistantDataAnchor;
    self->_pendingAssistantDataAnchor = 0;
  }
  else
  {
    CFStringRef v12 = [v9 lastAssistantDataAnchor];
    if ([v8 isEqualToString:v12])
    {
    }
    else
    {
      unsigned int v13 = [(ADSession *)self _shouldSendAssistantData];

      if (v13 && self->_cachedAssistantData) {
        [(ADSession *)self _sendAssistantDataChangedSinceAnchor:v8 refId:0];
      }
    }
    [v10 setLastAssistantDataAnchor:v8];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  long long v15 = [v4 requestSync];
  objc_msgSend(WeakRetained, "assistantSession:didLoadAssistantSyncRequested:", self, objc_msgSend(v15, "BOOLValue"));
}

- (void)assistantDataManager:(id)a3 didUpdateAssistantData:(id)a4
{
  id v5 = objc_msgSend(a4, "copy", a3);
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100234A5C;
  v8[3] = &unk_10050E160;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)_sendAssistantDataChangedSinceAnchor:(id)a3 refId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_languageCode;
  if ((AFPreferencesLanguageIsSupported() & 1) == 0)
  {
    id v9 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v18 = 136315394;
      v19 = "-[ADSession _sendAssistantDataChangedSinceAnchor:refId:]";
      __int16 v20 = 2112;
      id v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Unsupported language code %@, but sending SAD anyway", (uint8_t *)&v18, 0x16u);
    }
  }
  unsigned int v10 = [(ADSession *)self _cachedAssistantData];
  __int16 v11 = [v10 anchor];
  CFStringRef v12 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315650;
    v19 = "-[ADSession _sendAssistantDataChangedSinceAnchor:refId:]";
    __int16 v20 = 2112;
    id v21 = v11;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s generated setAssistantData anchor %@ (previous anchor %@)", (uint8_t *)&v18, 0x20u);
  }
  unsigned __int8 v13 = [v6 isEqualToString:v11];
  if (v7 || (v13 & 1) == 0)
  {
    [v10 setRefId:v7];
    [(ADSession *)self _sendServerCommand:v10];
    if (self->_state == 11)
    {
      long long v15 = self->_account;
      [(ADAccount *)v15 setLastAssistantDataAnchor:v11];
      [(ADAccount *)v15 save];
    }
    else
    {
      int v16 = (NSString *)[(NSString *)v11 copy];
      pendingAssistantDataAnchor = self->_pendingAssistantDataAnchor;
      self->_pendingAssistantDataAnchor = v16;
    }
  }
  else
  {
    long long v14 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v18 = 136315394;
      v19 = "-[ADSession _sendAssistantDataChangedSinceAnchor:refId:]";
      __int16 v20 = 2112;
      id v21 = (NSString *)v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Assistant Data matches, not sending %@", (uint8_t *)&v18, 0x16u);
    }
  }
}

- (void)_removeRequestForAssistantData
{
  if (self->_assistantDataRequested)
  {
    id v3 = +[ADAssistantDataManager sharedDataManager];
    [v3 removeObserver:self];
    self->_assistantDataRequested = 0;
  }
}

- (void)_requestForAssistantData
{
  if (!self->_assistantDataRequested)
  {
    id v3 = +[ADAssistantDataManager sharedDataManager];
    [v3 addObserver:self];
    [v3 requestAssistantDataUpdateHighPriority:1];
    self->_assistantDataRequested = 1;
  }
}

- (BOOL)_waitingForAssistantData
{
  if (self->_cachedAssistantData) {
    return 0;
  }
  else {
    return [(ADSession *)self _shouldSendAssistantData];
  }
}

- (BOOL)_shouldSendAssistantData
{
  return self->_shouldSendAssistantData;
}

- (void)_setPendingAssistantDataAnchor:(id)a3
{
}

- (id)_cachedAssistantData
{
  return self->_cachedAssistantData;
}

- (void)_sendDestroyAssistant
{
  id v4 = objc_alloc_init((Class)SADestroyAssistant);
  [(ADSession *)self _sendServerCommand:v4];
  id v3 = +[AFPreferences sharedPreferences];
  [v3 setTLSSessionTicketsFlushPending:1];

  self->_int64_t state = 10;
}

- (void)_sendCommandFailedWithRefId:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)SACommandFailed);
  [v5 setRefId:v4];

  [(ADSession *)self _sendServerCommand:v5];
}

- (void)_sendServerCommands:(id)a3
{
  id v3 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315138;
    id v5 = "-[ADSession _sendServerCommands:]";
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s Shouldn't reach this method", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_sendServerCommand:(id)a3
{
  id v3 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315138;
    id v5 = "-[ADSession _sendServerCommand:]";
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s Shouldn't reach this method", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_informDelegateCannotHandleRequest:(id)a3 error:(id)a4
{
  p_delegate = &self->_delegate;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained assistantSession:self cannotHandleRequest:v8 error:v7];
}

- (void)_informDelegateWillRetryOnError:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained assistantSession:self willRetryOnError:v5];
}

- (void)_informDelegateOfError:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained assistantSession:self receivedError:v5 isRetryableError:0];
}

- (void)_passObjectToDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained assistantSession:self receivedCommand:v5];
}

- (BOOL)_commandRequiresSync:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    id v5 = AFSiriLogContextSession;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315394;
      id v8 = "-[ADSession _commandRequiresSync:]";
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v7, 0x16u);
    }
  }

  return isKindOfClass & 1;
}

- (BOOL)sessionRequiresSync
{
  return self->_sessionRequiresSync;
}

- (BOOL)_commandRequiresServerConnection:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    int v4 = AFSiriLogContextSession;
    BOOL v5 = 1;
    if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315394;
      id v8 = "-[ADSession _commandRequiresServerConnection:]";
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v7, 0x16u);
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)sessionRequiresServerConnection
{
  return self->_sessionRequiresServerConnection;
}

- (id)awdRequestRecord
{
  return self->_awdRequestRecord;
}

- (void)setAWDRequestRecord:(id)a3
{
}

- (id)_requestId
{
  return self->_requestId;
}

- (void)_setRequestId:(id)a3
{
}

- (id)_adSessionTypeString
{
  if ([(ADSession *)self sessionType] == 1) {
    return @"remoteLimited";
  }
  else {
    return @"remoteFull";
  }
}

- (void)_setSessionId:(id)a3
{
}

- (id)_saSNConnectionType
{
  currentSNConnectionType = self->_currentSNConnectionType;
  id v3 = SAConnectionTypeUnknownValue;
  id v4 = [currentSNConnectionType technology];
  switch((unint64_t)v4)
  {
    case 0x7D0uLL:
    case 0x7D4uLL:
    case 0x7D5uLL:
    case 0x7D6uLL:
    case 0x7D7uLL:
    case 0x7D8uLL:
      BOOL v5 = (id *)&SAConnectionTypeCellValue;
      break;
    case 0x7D1uLL:
      BOOL v5 = (id *)&SAConnectionTypeUTRANValue;
      break;
    case 0x7D2uLL:
      BOOL v5 = (id *)&SAConnectionTypeCDMA1xValue;
      break;
    case 0x7D3uLL:
      BOOL v5 = (id *)&SAConnectionTypeLTEValue;
      break;
    case 0x7D9uLL:
    case 0x7DAuLL:
    case 0x7DBuLL:
      BOOL v5 = (id *)&SAConnectionTypeCDMAEVDOValue;
      break;
    case 0x7DCuLL:
      BOOL v5 = (id *)&SAConnectionTypeeHRPDValue;
      break;
    case 0x7DDuLL:
      BOOL v5 = (id *)&SAConnectionTypeNRNSAValue;
      break;
    case 0x7DEuLL:
      BOOL v5 = (id *)&SAConnectionTypeNRValue;
      break;
    default:
      switch((unint64_t)v4)
      {
        case 0xBB8uLL:
        case 0xBBEuLL:
          BOOL v5 = (id *)&SAConnectionTypeMultiPathTCPValue;
          goto LABEL_17;
        case 0xBB9uLL:
          BOOL v5 = (id *)&SAConnectionTypeLedBellyValue;
          goto LABEL_17;
        case 0xBBAuLL:
        case 0xBBCuLL:
          goto LABEL_18;
        case 0xBBBuLL:
          BOOL v5 = (id *)&SAConnectionTypePOPValue;
          goto LABEL_17;
        case 0xBBDuLL:
          BOOL v5 = (id *)&SAConnectionTypeLocalValue;
          goto LABEL_17;
        default:
          if (v4 != (id)1000) {
            goto LABEL_18;
          }
          BOOL v5 = (id *)&SAConnectionTypeWifiValue;
          break;
      }
      break;
  }
LABEL_17:
  id v6 = *v5;

  id v3 = v6;
LABEL_18:
  return v3;
}

- (id)_saConnectionType
{
  currentConnectionType = self->_currentConnectionType;
  id v3 = SAConnectionTypeUnknownValue;
  id v4 = [(SiriCoreConnectionType *)currentConnectionType technology];
  switch((unint64_t)v4)
  {
    case 0x7D0uLL:
    case 0x7D4uLL:
    case 0x7D5uLL:
    case 0x7D6uLL:
    case 0x7D7uLL:
    case 0x7D8uLL:
      BOOL v5 = (id *)&SAConnectionTypeCellValue;
      break;
    case 0x7D1uLL:
      BOOL v5 = (id *)&SAConnectionTypeUTRANValue;
      break;
    case 0x7D2uLL:
      BOOL v5 = (id *)&SAConnectionTypeCDMA1xValue;
      break;
    case 0x7D3uLL:
      BOOL v5 = (id *)&SAConnectionTypeLTEValue;
      break;
    case 0x7D9uLL:
    case 0x7DAuLL:
    case 0x7DBuLL:
      BOOL v5 = (id *)&SAConnectionTypeCDMAEVDOValue;
      break;
    case 0x7DCuLL:
      BOOL v5 = (id *)&SAConnectionTypeeHRPDValue;
      break;
    case 0x7DDuLL:
      BOOL v5 = (id *)&SAConnectionTypeNRNSAValue;
      break;
    case 0x7DEuLL:
      BOOL v5 = (id *)&SAConnectionTypeNRValue;
      break;
    default:
      switch((unint64_t)v4)
      {
        case 0xBB8uLL:
        case 0xBBEuLL:
          BOOL v5 = (id *)&SAConnectionTypeMultiPathTCPValue;
          goto LABEL_17;
        case 0xBB9uLL:
          BOOL v5 = (id *)&SAConnectionTypeLedBellyValue;
          goto LABEL_17;
        case 0xBBAuLL:
        case 0xBBCuLL:
          goto LABEL_18;
        case 0xBBBuLL:
          BOOL v5 = (id *)&SAConnectionTypePOPValue;
          goto LABEL_17;
        case 0xBBDuLL:
          BOOL v5 = (id *)&SAConnectionTypeLocalValue;
          goto LABEL_17;
        default:
          if (v4 != (id)1000) {
            goto LABEL_18;
          }
          BOOL v5 = (id *)&SAConnectionTypeWifiValue;
          break;
      }
      break;
  }
LABEL_17:
  id v6 = *v5;

  id v3 = v6;
LABEL_18:
  return v3;
}

- (void)_resetSessionRequiresSync
{
  self->_sessionRequiresSync = 0;
  v2 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315138;
    id v4 = "-[ADSession _resetSessionRequiresSync]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s _sessionRequiresSync reset to NO", (uint8_t *)&v3, 0xCu);
  }
}

- (void)_resetSessionRequiresServerConnection
{
  int v3 = AFDeviceSupportsFullSiriUOD();
  self->_sessionRequiresServerConnection = v3 ^ 1;
  id v4 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    CFStringRef v5 = @"YES";
    if (v3) {
      CFStringRef v5 = @"NO";
    }
    int v6 = 136315394;
    int v7 = "-[ADSession _resetSessionRequiresServerConnection]";
    __int16 v8 = 2112;
    CFStringRef v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s _sessionRequiresServerConnection reset to %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)_clearSendBuffer
{
  self->_sendBuffer = 0;
  _objc_release_x1();
}

- (id)_sendBuffer
{
  return self->_sendBuffer;
}

- (void)_clearLimbo
{
  limboIds = self->_limboIds;
  self->_limboIds = 0;

  pendingCommands = self->_pendingCommands;
  self->_pendingCommands = 0;
}

- (void)_sendLimboCommand:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    __int16 v8 = "-[ADSession _sendLimboCommand:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v7, 0xCu);
  }
  [(ADSession *)self _sendServerCommand:v4];
  int v6 = [v4 aceId];
  [(ADSession *)self _addLimboId:v6];

  [(ADSession *)self _addPendingCommand:v4];
}

- (void)_sendAssistantDataAndPendingCommandsIfNeeded:(id)a3
{
  id v5 = a3;
  unsigned int v4 = [(ADSession *)self _shouldSendAssistantData];
  if (v5 && v4 && self->_cachedAssistantData) {
    [(ADSession *)self _sendAssistantDataChangedSinceAnchor:v5 refId:0];
  }
  if (![(ADSession *)self _waitingForAssistantData]) {
    [(ADSession *)self _sendPendingCommands];
  }
}

- (void)_sendPendingCommands
{
  int v3 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[ADSession _sendPendingCommands]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v4 = [(NSMutableArray *)self->_pendingCommands copy];
  [(ADSession *)self _sendServerCommands:v4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      CFStringRef v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v9), "aceId", (void)v11);
        [(ADSession *)self _addLimboId:v10];

        CFStringRef v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_addPendingCommand:(id)a3
{
  id v5 = a3;
  if ((objc_msgSend(v5, "siriCore_isProvisional") & 1) == 0)
  {
    id v4 = [(ADSession *)self _pendingCommands];
    [v4 addObject:v5];
  }
}

- (BOOL)_refIdIsLimboId:(id)a3
{
  return [(NSMutableSet *)self->_limboIds containsObject:a3];
}

- (void)_removeLimboId:(id)a3
{
}

- (void)_addLimboId:(id)a3
{
  id v4 = a3;
  limboIds = self->_limboIds;
  id v8 = v4;
  if (!limboIds)
  {
    id v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    id v7 = self->_limboIds;
    self->_limboIds = v6;

    id v4 = v8;
    limboIds = self->_limboIds;
  }
  [(NSMutableSet *)limboIds addObject:v4];
}

- (id)_pendingCommands
{
  pendingCommands = self->_pendingCommands;
  if (!pendingCommands)
  {
    id v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    id v5 = self->_pendingCommands;
    self->_pendingCommands = v4;

    pendingCommands = self->_pendingCommands;
  }
  return pendingCommands;
}

- (void)_setSessionOpened
{
  int64_t v2 = 4;
  if (self->_dormant) {
    int64_t v2 = 5;
  }
  self->_int64_t state = v2;
}

- (BOOL)supportsSync
{
  return 0;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)ADSession;
  [(ADSession *)&v2 dealloc];
}

- (id)initOnQueue:(id)a3 withAccount:(id)a4 languageCode:(id)a5 connectionMode:(id)a6 sharedUserIdentifier:(id)a7 loggingSharedUserIdentifier:(id)a8 instanceContext:(id)a9
{
  v10.receiver = self;
  v10.super_class = (Class)ADSession;
  return [(ADSession *)&v10 init];
}

- (id)initOnQueue:(id)a3 withAccount:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ADSession;
  CFStringRef v9 = [(ADSession *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeStrong(p_isa + 2, a4);
    [p_isa _resetSessionRequiresServerConnection];
    [p_isa _resetSessionRequiresSync];
  }

  return p_isa;
}

+ (int)_adSessionTypeFromString:(id)a3
{
  return [a3 isEqualToString:@"remoteLimited"];
}

+ (Class)sessionClassForType:(int)a3
{
  if (a3 > 1)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = objc_opt_class();
  }
  return (Class)v4;
}

@end