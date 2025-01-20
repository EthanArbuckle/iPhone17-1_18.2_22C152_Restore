@interface IDSQuickRelayAllocator
+ (IDSQuickRelayAllocator)sharedInstance;
- (BOOL)_addConnectStatus:(id)a3 relaySessionID:(id)a4 previousTime:(unint64_t)a5 qrReason:(unsigned __int16)a6 previousError:(unsigned __int16)a7 previousRelayIP:(unsigned int)a8 previousAccessToken:(id)a9;
- (BOOL)_addResponseToCache:(id)a3 sessionInfo:(id)a4 modifiedMessage:(id *)a5;
- (BOOL)_hasSessionInfoRequiredKeys:(id)a3;
- (BOOL)_isDuplicateResponse:(id)a3 newResponse:(id)a4;
- (BOOL)_sendKeepAliveRequest:(id)a3;
- (BOOL)_shouldUseCurrentResponse:(id)a3 cachedMessage:(id)a4;
- (BOOL)_startQRConnectionWithDefaults:(id)a3;
- (BOOL)hasParticipantID:(id)a3 participantID:(id)a4;
- (BOOL)invalidateLatestResponse:(id)a3 qrReason:(unsigned __int16)a4 previousError:(unsigned __int16)a5;
- (BOOL)isURIAvailabeInAllocateResponse:(id)a3 uri:(id)a4;
- (IDSQuickRelayAllocator)init;
- (id)_createSessionInfoFromResponsePayload:(id)a3;
- (id)_filterSelfAllocationsForSessionID:(id)a3;
- (id)_findAllocationForSessionID:(id)a3 requestIDStr:(id)a4;
- (id)_findAllocationListForSessionID:(id)a3;
- (id)_findSessionWithID:(id)a3;
- (id)_getCombinedSoftwareID:(id)a3;
- (id)_getGroupID:(id)a3;
- (id)_getIDSAWDLoggingInstance;
- (id)_getPushTokenFromParticipantID:(id)a3 participantID:(id)a4;
- (id)_getQuickRelayIPPreference:(unint64_t)a3;
- (id)_getResponse:(id)a3 relaySessionID:(id)a4;
- (id)_getResponseForQRSessionID:(id)a3 sessionID:(id)a4 index:(int64_t *)a5;
- (id)_getResponseFromQRGroupID:(id)a3;
- (id)_getSelfAllocationFromCache:(id)a3;
- (id)_getStatusMessageFromStatusCode:(unint64_t)a3;
- (id)_getURIForRecipientFromResponse:(id)a3;
- (id)_mergeParticipantID2PushTokenMapping:(id)a3 sourceResponse:(id)a4 mappingChange:(BOOL *)a5;
- (id)_parseQuickRelayDefaults:(id)a3 gropuID:(id)a4;
- (id)_peerIDManager;
- (id)_queryPolicy;
- (id)_setupAllocation:(id)a3 fromURI:(id)a4 sessionID:(id)a5 isSessionIDRemoteDeviceID:(BOOL)a6 options:(id)a7 prevConnectStatus:(id *)a8 requestUUID:(id)a9 connectReadyHandler:(id)a10 withPreferredLocalInterface:(int)a11;
- (id)_setupNewAllocation:(id)a3 sessionID:(id)a4 isSessionIDRemoteDeviceID:(BOOL)a5 fromIdentity:(id)a6 fromURI:(id)a7 fromService:(id)a8 options:(id)a9 connectReadyHandler:(id)a10 withPreferredLocalInterface:(int)a11 forAdditionalAllocation:(BOOL)a12;
- (id)_tokenURIForToken:(id)a3 uri:(id)a4;
- (id)_translateParticipantIDtoUINT64ForResponse:(id)a3;
- (id)_uriToParticipantID:(id)a3;
- (id)_uuidFromNSStringToNSData:(id)a3;
- (id)findAllocateResponseForSessionID:(id)a3 FromURI:(id)a4;
- (id)getAdditionalAllocationForAddress:(id)a3 selfAddress:(unsigned int)a4 relaySessionID:(id)a5 allocateType:(int64_t)a6 qrReason:(unsigned __int16)a7 previousTime:(unint64_t)a8 previousError:(unsigned __int16)a9 previousRelayIP:(unsigned int)a10 previousAccessToken:(id)a11 requestSelfAllocation:(BOOL)a12 isSessionIDRemoteDeviceID:(BOOL)a13 withPreferredRemoteInterface:(int)a14 withPreferredLocalInterface:(int)a15;
- (id)getAllocateResponse:(id)a3 groupID:(id)a4;
- (id)getPushTokenForRelaySessionID:(id)a3 relaySessionID:(id)a4;
- (id)getPushTokenFromParticipantID:(id)a3 participantID:(id)a4;
- (id)getPushTokensFromParticipantIDs:(id)a3 participantIDs:(id)a4;
- (id)getRelaySessionIDForIDSSessionID:(id)a3 pushToken:(id)a4;
- (id)getURIFromParticipantID:(id)a3 participantID:(id)a4;
- (id)setupNewAllocation:(id)a3 sessionID:(id)a4 fromIdentity:(id)a5 fromURI:(id)a6 fromService:(id)a7 options:(id)a8 connectReadyHandler:(id)a9;
- (id)setupNewAllocationToDevice:(id)a3 options:(id)a4 connectReadyHandler:(id)a5;
- (int64_t)getServerProviderForIDSSessionID:(id)a3;
- (unint64_t)getCountOfPendingRecipientsAcceptedSessions;
- (unint64_t)getCountOfSessionToAllocations;
- (unint64_t)getLocalParticipantIDForRelaySessionID:(id)a3;
- (unsigned)_getErrorCodeFromAllocationStatus:(int)a3;
- (void)_addAllocationForSession:(id)a3 allocation:(id)a4;
- (void)_cleanupResponses;
- (void)_discardAllocation:(id)a3;
- (void)_dispatchIncomingAllocateResponse:(id)a3 isFromCache:(BOOL)a4 connectReadyHandler:(id)a5 requestOptions:(id)a6;
- (void)_handleIncomingAllocateResponse:(id)a3 isFromCache:(BOOL)a4 requestOptions:(id)a5;
- (void)_invalidateSession:(id)a3 isExpiryPurging:(BOOL)a4;
- (void)_notifyParticipantID2PushTokenMappingChange:(id)a3;
- (void)_notifyURIToParticipantIDMappingChange:(id)a3;
- (void)_processAllocationStatusResult:(id)a3;
- (void)_processSelfAllocations:(id)a3 allocation:(id)a4;
- (void)_removeAllAllocationsForSessionID:(id)a3;
- (void)_sendAWDMetricsForAllocation:(id)a3 status:(int64_t)a4 hasRecipientAccepted:(BOOL)a5;
- (void)_sendAllocateRequest:(id)a3;
- (void)_sendIDQueryRequest:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 completionBlock:(id)a7;
- (void)_setResponseForQRGroupID:(id)a3 groupID:(id)a4;
- (void)_setSessionInfoRequiredKeys;
- (void)_startCleanupTimer;
- (void)_startQRConnectionForSession:(id)a3 isInitiatorsAcceptedSession:(BOOL)a4 withLocalInterfacePreference:(int)a5;
- (void)_storeMappingFromPushTokenToURIs:(id)a3 fromID:(id)a4 service:(id)a5 cert:(id)a6 forGroup:(id)a7;
- (void)_triggerSymptomsWithType:(id)a3 subType:(id)a4 subTypeContext:(id)a5;
- (void)cleanUpCachedMappings:(id)a3;
- (void)clearResponseFromQRGroupID:(id)a3;
- (void)dealloc;
- (void)enablePushHandler:(BOOL)a3;
- (void)handler:(id)a3 didReceiveMessage:(id)a4 forTopic:(id)a5 fromID:(id)a6 messageContext:(id)a7;
- (void)handler:(id)a3 receivedOfflineMessagePendingForTopic:(id)a4 messageContext:(id)a5;
- (void)invalidateAllocation:(id)a3;
- (void)invalidateSession:(id)a3 isExpiryPurging:(BOOL)a4;
- (void)reportAWDAllocatorEvent:(unsigned int)a3 relayProviderType:(int64_t)a4 transport:(int64_t)a5 localRAT:(unsigned int)a6 duration:(unint64_t)a7 idsSessionID:(id)a8 reportingDataBlob:(id)a9 isInitiator:(BOOL)a10;
- (void)requestAllocationForRecipient:(id)a3;
- (void)setInitiatorsAcceptedToken:(id)a3 pushToken:(id)a4;
- (void)setRequestIDToSession:(id)a3 idsSessionID:(id)a4;
- (void)startKeepAliveTimer:(id)a3 relaySessionID:(id)a4;
- (void)stopKeepAliveTimer:(id)a3 relaySessionID:(id)a4;
@end

@implementation IDSQuickRelayAllocator

+ (IDSQuickRelayAllocator)sharedInstance
{
  if (qword_100A4C538 != -1) {
    dispatch_once(&qword_100A4C538, &stru_100987D88);
  }
  v2 = (void *)qword_100A4C540;

  return (IDSQuickRelayAllocator *)v2;
}

- (IDSQuickRelayAllocator)init
{
  v26.receiver = self;
  v26.super_class = (Class)IDSQuickRelayAllocator;
  v2 = [(IDSQuickRelayAllocator *)&v26 init];
  v3 = v2;
  if (v2)
  {
    requestIDToSession = v2->_requestIDToSession;
    v2->_requestIDToSession = 0;

    sessionToAllocations = v3->_sessionToAllocations;
    v3->_sessionToAllocations = 0;

    pendingRecipientsAcceptedSessions = v3->_pendingRecipientsAcceptedSessions;
    v3->_pendingRecipientsAcceptedSessions = 0;

    initiatorsAcceptedSessionsWithToken = v3->_initiatorsAcceptedSessionsWithToken;
    v3->_initiatorsAcceptedSessionsWithToken = 0;

    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    idsSessionIDToqrSessionID = v3->_idsSessionIDToqrSessionID;
    v3->_idsSessionIDToqrSessionID = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    allocateResponses = v3->_allocateResponses;
    v3->_allocateResponses = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pushTokenToURIForGroup = v3->_pushTokenToURIForGroup;
    v3->_pushTokenToURIForGroup = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    sessionToLocalParticipantID = v3->_sessionToLocalParticipantID;
    v3->_sessionToLocalParticipantID = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    sessionIDToURIToResponsePayload = v3->_sessionIDToURIToResponsePayload;
    v3->_sessionIDToURIToResponsePayload = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    duplicateAllocateResponses = v3->_duplicateAllocateResponses;
    v3->_duplicateAllocateResponses = v18;

    v20 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    groupIDToDuplicateResponseCleanupTimers = v3->_groupIDToDuplicateResponseCleanupTimers;
    v3->_groupIDToDuplicateResponseCleanupTimers = v20;

    v22 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    sessionToRequestIDToAllocateTime = v3->_sessionToRequestIDToAllocateTime;
    v3->_sessionToRequestIDToAllocateTime = v22;

    pushHandler = v3->_pushHandler;
    v3->_pushHandler = 0;

    v3->_lock._os_unfair_lock_opaque = 0;
    [(IDSQuickRelayAllocator *)v3 _setSessionInfoRequiredKeys];
  }
  return v3;
}

- (void)dealloc
{
  v3 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Dealloc IDSQuickRelayAllocator %@.", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      v4 = self;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        v4 = self;
        _IDSLogV();
      }
    }
  }
  -[IDSPushHandler removeListener:](self->_pushHandler, "removeListener:", self, v4);
  [(NSMutableDictionary *)self->_requestIDToSession removeAllObjects];
  [(NSMutableDictionary *)self->_sessionToAllocations removeAllObjects];
  [(NSMutableSet *)self->_pendingRecipientsAcceptedSessions removeAllObjects];
  [(NSMutableDictionary *)self->_initiatorsAcceptedSessionsWithToken removeAllObjects];
  [(NSMutableDictionary *)self->_idsSessionIDToqrSessionID removeAllObjects];
  [(NSMutableDictionary *)self->_allocateResponses removeAllObjects];
  [(NSMutableDictionary *)self->_sessionToLocalParticipantID removeAllObjects];
  [(NSMutableDictionary *)self->_sessionIDToURIToResponsePayload removeAllObjects];
  [(NSMutableDictionary *)self->_duplicateAllocateResponses removeAllObjects];
  [(NSMutableDictionary *)self->_groupIDToDuplicateResponseCleanupTimers removeAllObjects];
  [(NSMutableDictionary *)self->_sessionToRequestIDToAllocateTime removeAllObjects];
  v5.receiver = self;
  v5.super_class = (Class)IDSQuickRelayAllocator;
  [(IDSQuickRelayAllocator *)&v5 dealloc];
}

- (id)_getIDSAWDLoggingInstance
{
  return +[IDSAWDLogging sharedInstance];
}

- (id)_peerIDManager
{
  return +[IDSPeerIDManager sharedInstance];
}

- (id)_queryPolicy
{
  v2 = [IDSQuickRelayAllocatorQueryPolicy alloc];
  v3 = +[IDSServerBag sharedInstance];
  v4 = [(IDSQuickRelayAllocatorQueryPolicy *)v2 initWithServerBag:v3];

  return v4;
}

- (BOOL)_sendKeepAliveRequest:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 objectForKey:kIDSQRAllocateKey_GroupID];
  if (v5)
  {
    v6 = [v4 objectForKey:kIDSQRAllocateKey_RelaySessionToken];
    uint64_t v7 = [v4 objectForKey:kIDSQRAllocateKey_RelayAddress];
    v8 = (void *)v7;
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      v10 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        id v35 = v6;
        __int16 v36 = 2048;
        v37 = v8;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "session token or address not available: %p %p", buf, 0x16u);
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
      BOOL v15 = 0;
    }
    else
    {
      v12 = [v4 objectForKey:kIDSQRAllocateKey_IDSSessionID];
      uint64_t v13 = [(IDSQuickRelayAllocator *)self _findSessionWithID:v12];
      v14 = (void *)v13;
      BOOL v15 = v13 != 0;
      if (v13)
      {
        id v16 = [[IDSQuickRelayAllocateMessage alloc] init:0];
        id v17 = objc_alloc_init((Class)NSMutableArray);
        [v16 setRecipients:v17];

        v18 = [(IDSQuickRelayAllocator *)self _uuidFromNSStringToNSData:v12];
        [v16 setIDSSessionID:v18];

        v19 = [v14 fromURI];
        v20 = [v19 prefixedURI];
        [v16 setSenderURI:v20];

        v21 = [v14 getAppID];
        [v16 setAppID:v21];

        [v16 setAllocateType:&off_1009D1BA8];
        [v16 setGroupID:v5];
        [v16 setActiveRelaySessionToken:v6];
        [v16 setActiveRelayIP:v8];
        v22 = _IDSAllocateProtocolVersionNumber();
        [v16 setAllocateProtocolVersion:v22];

        [v16 setWantsResponse:1];
        [v16 setTopic:kIDSQuickRelayPushTopic];
        v23 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = [v4 objectForKey:kIDSQRAllocateKey_RelaySessionID];
          *(_DWORD *)buf = 138412546;
          id v35 = v5;
          __int16 v36 = 2112;
          v37 = v24;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "send keepalive for groupID: %@, sessionID: %@", buf, 0x16u);
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            uint64_t v25 = kIDSQRAllocateKey_RelaySessionID;
            v30 = [v4 objectForKey:kIDSQRAllocateKey_RelaySessionID];
            _IDSLogTransport();

            if (_IDSShouldLog())
            {
              v31 = objc_msgSend(v4, "objectForKey:", v25, v5, v30);
              _IDSLogV();
            }
          }
        }
        objc_super v26 = im_primary_queue();
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1002B06DC;
        block[3] = &unk_10097E4D0;
        id v33 = v16;
        id v27 = v16;
        dispatch_async(v26, block);
      }
      else
      {
        v28 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v35 = v12;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Session not found for %@", buf, 0xCu);
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
  }
  else
  {
    v11 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "no groupID in %@", buf, 0xCu);
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
    BOOL v15 = 0;
  }

  return v15;
}

- (void)_sendAllocateRequest:(id)a3
{
  id v3 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v3);
  id v4 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002B09F4;
  block[3] = &unk_100987DF8;
  id v7 = v3;
  id v5 = v3;
  objc_copyWeak(&v8, &location);
  dispatch_async(v4, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (id)_setupAllocation:(id)a3 fromURI:(id)a4 sessionID:(id)a5 isSessionIDRemoteDeviceID:(BOOL)a6 options:(id)a7 prevConnectStatus:(id *)a8 requestUUID:(id)a9 connectReadyHandler:(id)a10 withPreferredLocalInterface:(int)a11
{
  BOOL v13 = a6;
  id v154 = a3;
  id v146 = a4;
  id v16 = a5;
  id v17 = a7;
  id v147 = a9;
  id v145 = a10;
  v18 = +[IDSFoundationLog QRAllocator];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = [v17 objectForKeyedSubscript:kIDSQRAllocateKey_IsLightweightParticipant];
    unsigned int v20 = [v19 BOOLValue];
    CFStringRef v21 = @"NO";
    if (v20) {
      CFStringRef v21 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v16;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v21;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "_setupAllocation:fromURI:sessionID:isSessionIDRemoteDeviceID:options:prevConnectStatus:requestUUID:connectReadyHandler: called {sessionID: %@} options[kIDSQRAllocateKey_IsLightweightParticipant] = %@", buf, 0x16u);
  }
  id v22 = [[IDSQuickRelayAllocateMessage alloc] init:v147];
  id v149 = [objc_alloc((Class)NSUUID) initWithUUIDString:v16];
  v163.i64[0] = 0xAAAAAAAAAAAAAAAALL;
  v163.i64[1] = 0xAAAAAAAAAAAAAAAALL;
  [v149 getUUIDBytes:&v163];
  if (!self->_requestIDToPreferredLocalInterface)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    requestIDToPreferredLocalInterface = self->_requestIDToPreferredLocalInterface;
    self->_requestIDToPreferredLocalInterface = Mutable;
  }
  uint64_t v25 = +[NSNumber numberWithInteger:a11];
  if (v25)
  {
    objc_super v26 = self->_requestIDToPreferredLocalInterface;
    id v27 = [v22 requestIDStr];
    CFDictionarySetValue((CFMutableDictionaryRef)v26, v27, v25);
  }
  else
  {
    id v27 = &_os_log_default;
    id v28 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10071CB50(v22);
    }
  }

  if (v13)
  {
    v29 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v149;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "translate deviceID: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        uint64_t v137 = (uint64_t)v149;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          uint64_t v137 = (uint64_t)v149;
          _IDSLogV();
        }
      }
    }
    memset(buf, 170, 16);
    v30 = +[IDSCurrentDevice sharedInstance];
    v31 = [v30 deviceIdentifier];

    id v32 = [objc_alloc((Class)NSUUID) initWithUUIDString:v31];
    [v32 getUUIDBytes:buf];

    int8x16_t v163 = veorq_s8(v163, *(int8x16_t *)buf);
    id v33 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:&v163];
    uint64_t v34 = [v33 UUIDString];

    id v16 = (id)v34;
  }
  id v35 = [objc_alloc((Class)NSData) initWithBytes:&v163 length:16];
  [v22 setIDSSessionID:v35];

  [v22 setSenderURI:v146];
  uint64_t v36 = [v17 objectForKey:kIDSQRAllocateKey_AllocateType];
  v155 = (void *)v36;
  if (v36) {
    v37 = (_UNKNOWN **)v36;
  }
  else {
    v37 = &off_1009D1BC0;
  }
  [v22 setAllocateType:v37];
  v38 = +[IMDeviceSupport sharedInstance];
  v39 = [v38 userAgentString];
  [v22 setUserAgent:v39];

  if ([v155 intValue] == 3)
  {
    v40 = [v17 objectForKey:kIDSQRAllocateKey_GroupID];
    if (v40)
    {
      v41 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = a8;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "shared session allocation, previous connect status: %p", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          uint64_t v137 = (uint64_t)a8;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            uint64_t v137 = (uint64_t)a8;
            _IDSLogV();
          }
        }
      }
      objc_msgSend(v22, "setIsSharedSession:", &off_1009D1B60, v137);
      [v22 setGroupID:v40];
      if (a8)
      {
        id v42 = [objc_alloc((Class)NSData) initWithBytes:&a8->var2 length:4];
        id v43 = [objc_alloc((Class)NSData) initWithBytes:a8->var5 length:a8->var4];
        v44 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          int var0 = a8->var0;
          int var1 = a8->var1;
          unsigned int var2 = a8->var2;
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)&uint8_t buf[4] = var0;
          *(_WORD *)&buf[8] = 1024;
          *(_DWORD *)&buf[10] = var1;
          *(_WORD *)&buf[14] = 1024;
          *(_DWORD *)&buf[16] = var2;
          *(_WORD *)&buf[20] = 2112;
          *(void *)&buf[22] = v43;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "cached response previous connect status, reason/error/token/ip: %u %u %u %@", buf, 0x1Eu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            v140 = (void *)a8->var2;
            id v141 = v43;
            uint64_t v137 = a8->var0;
            v139 = (__CFString *)a8->var1;
            _IDSLogTransport();
            if (_IDSShouldLog())
            {
              v140 = (void *)a8->var2;
              id v141 = v43;
              uint64_t v137 = a8->var0;
              v139 = (__CFString *)a8->var1;
              _IDSLogV();
            }
          }
        }
        v48 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", a8->var0, v137, v139, v140, v141);
        [v22 setQrReason:v48];

        if (a8->var1 != 0xFFFF)
        {
          v49 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:");
          [v22 setQrError:v49];
        }
        [v22 setPreviousAccessToken:v43];
        [v22 setPreviousRelayIP:v42];
      }
      else
      {
        [v22 setQrReason:&off_1009D1BD8];
      }
      v51 = [v17 objectForKey:kIDSQRAllocateKey_IsNewUPlusOneSession];
      unsigned int v52 = [v51 BOOLValue];

      if (v52) {
        [v22 setIsNewUPlusOneSession:&off_1009D1B60];
      }
    }
    else
    {
      v50 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v17;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "groupID not set for shared session allocation: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          uint64_t v137 = (uint64_t)v17;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            uint64_t v137 = (uint64_t)v17;
            _IDSLogV();
          }
        }
      }
    }
    v53 = objc_msgSend(v17, "objectForKey:", kIDSQRAllocateKey_GroupMemberCount, v137);
    if (v53) {
      [v22 setGroupMemberCount:v53];
    }
  }
  if (a8)
  {
    free(a8->var5);
    free(a8);
  }
  if (!v154) {
    id v154 = objc_alloc_init((Class)NSMutableArray);
  }
  if (!self->_requestIDToSession)
  {
    v54 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    requestIDToSession = self->_requestIDToSession;
    self->_requestIDToSession = v54;
  }
  id value = v16;
  if (value)
  {
    v56 = self->_requestIDToSession;
    v57 = [v22 requestIDStr];
    CFDictionarySetValue((CFMutableDictionaryRef)v56, v57, value);
  }
  else
  {
    v57 = &_os_log_default;
    id v58 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10071CAA8(v22);
    }
  }

  v59 = [v17 objectForKey:kIDSQRAllocateKey_QRForceExperiment];
  [v22 setQrForceExperiment:v59];

  if (IMGetDomainIntForKey())
  {
    v60 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "QuickRelayServerProvider switch has been deprecated", buf, 2u);
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
  v150 = [v17 objectForKey:kIDSQRAllocateKey_RelayAddress];
  id v152 = [v17 objectForKey:kIDSQRAllocateKey_RelaySessionToken];
  id v148 = [v17 objectForKey:kIDSQRAllocateKey_RelaySessionKey];
  if (v150 && v152 && v148)
  {
    [v22 setExistingRelayIP:v150];
    [v22 setExistingRelaySessionToken:v152];
    *(void *)&long long v61 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v61 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v61;
    *(_OWORD *)&buf[16] = v61;
    id v62 = v148;
    id v63 = [v62 bytes];
    id v64 = [v62 length];
    id v65 = v152;
    CCHmac(2u, v63, (size_t)v64, [v65 bytes], (size_t)objc_msgSend(v65, "length"), buf);
    id v66 = [objc_alloc((Class)NSData) initWithBytes:buf length:32];
    [v22 setExistingRelaySignature:v66];
  }
  uint64_t v67 = kIDSQRAllocateKey_SenderExternalAddress;
  v68 = [v17 objectForKey:kIDSQRAllocateKey_SenderExternalAddress];

  if (v68)
  {
    v69 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      id v70 = [v17 objectForKey:v67];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v70;
      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "request allocation for a specific address %@", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        uint64_t v137 = [v17 objectForKey:v67];
        _IDSLogTransport();

        if (_IDSShouldLog())
        {
          uint64_t v137 = objc_msgSend(v17, "objectForKey:", v67, v137);
          _IDSLogV();
        }
      }
    }
    v71 = objc_msgSend(v17, "objectForKey:", v67, v137);
    [v22 setSenderExternalIP:v71];
  }
  uint64_t v72 = kIDSQRAllocateKey_AppID;
  v73 = [v17 objectForKey:kIDSQRAllocateKey_AppID];

  if (v73)
  {
    v74 = [v17 objectForKey:v72];
    [v22 setAppID:v74];
  }
  else
  {
    [v22 setAppID:kIDSQuickRelayPushTopic];
  }
  v151 = [v17 objectForKey:kIDSQRAllocateKey_ConversationID];
  if (v151) {
    [v22 setConversationID:v151];
  }
  v75 = [v17 objectForKey:kIDSQRAllocateKey_IsLightweightParticipant];
  [v22 setIsLightweightParticipant:v75];

  if ([v155 intValue] != 3)
  {
    v76 = [v17 objectForKey:kIDSQRAllocateKey_SelfAllocationCount];
    [v22 setSelfAllocationCount:v76];
  }
  v77 = [v17 objectForKey:IDSSessionInvitationRetryCountKey];
  [v22 setInvitationRetryCount:v77];

  v78 = _IDSAllocateProtocolVersionNumber();
  [v22 setAllocateProtocolVersion:v78];

  [v22 setRecipients:v154];
  [v22 setWantsResponse:1];
  [v22 setTopic:kIDSQuickRelayPushTopic];
  v153 = [v17 objectForKey:kIDSQRAllocateKey_PreferredRemoteInterface];
  if ([v153 intValue])
  {
    v79 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
    {
      [v153 intValue];
      GLUtilPreferredInterfaceToString();
      id v80 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v80;
      _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "_setupAllocation: preferredRemoteInterface %@", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        [v153 intValue];
        uint64_t v137 = GLUtilPreferredInterfaceToString();
        _IDSLogTransport();

        if (_IDSShouldLog())
        {
          objc_msgSend(v153, "intValue", v137);
          uint64_t v137 = GLUtilPreferredInterfaceToString();
          _IDSLogV();
        }
      }
    }
    objc_msgSend(v22, "setInfoAttribute:", v153, v137);
  }
  v81 = +[IMLockdownManager sharedInstance];
  unsigned int v82 = [v81 isInternalInstall];

  if (v82)
  {
    if (IMGetDomainBoolForKey())
    {
      [v22 setTestOptions:IDSGroupSessionSendDiagnosticIndication];
      v83 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "_setupAllocation test options: IDSGroupSessionSendDiagnosticIndication", buf, 2u);
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
    v84 = IMGetDomainValueForKey();
    if (v84)
    {
      v85 = +[NSString stringWithFormat:@"%@=%@", kIDSQRAllocateKey_ServerAddress, v84];
      [v22 setTestOptions:v85];
      v86 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v85;
        _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "_setupAllocation QuickRelayServerAddress test option: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          uint64_t v137 = (uint64_t)v85;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            uint64_t v137 = (uint64_t)v85;
            _IDSLogV();
          }
        }
      }
    }
    if (IMGetDomainBoolForKey())
    {
      [v22 setTestOptions:IDSGroupSessionForceDegraded];
      v87 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "_setupAllocation test options: IDSGroupSessionForceDegraded", buf, 2u);
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
    if (IMGetDomainBoolForKey())
    {
      [v22 setTestOptions:IDSGroupSessionBlockUPlusOneSession];
      v88 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "_setupAllocation test options: IDSGroupSessionBlockUPlusOneSession", buf, 2u);
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
    if (IMGetDomainBoolForKey())
    {
      [v22 setTestOptions:IDSGroupSessionAppleTestingKey];
      v89 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEFAULT, "_setupAllocation test options: IDSGroupSessionAppleTestingKey", buf, 2u);
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
  ids_monotonic_time();
  double v91 = v90;
  os_unfair_lock_lock(&self->_lock);
  v92 = [(NSMutableDictionary *)self->_sessionToRequestIDToAllocateTime objectForKeyedSubscript:value];
  BOOL v93 = v92 == 0;

  if (v93)
  {
    CFMutableDictionaryRef v94 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    [(NSMutableDictionary *)self->_sessionToRequestIDToAllocateTime setObject:v94 forKeyedSubscript:value];
  }
  v95 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v91, v137);
  if (v95)
  {
    v96 = [(NSMutableDictionary *)self->_sessionToRequestIDToAllocateTime objectForKeyedSubscript:value];
    v97 = [v22 requestIDStr];
    CFDictionarySetValue(v96, v97, v95);
  }
  else
  {
    v96 = (__CFDictionary *)&_os_log_default;
    id v98 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10071CA00(v22);
    }
  }

  os_unfair_lock_unlock(&self->_lock);
  v99 = +[IDSFoundationLog QRAllocator];
  if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v100 = [v154 count];
    id v101 = [v22 requestIDStr];
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = value;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v100;
    *(_WORD *)&buf[18] = 2112;
    *(void *)&buf[20] = v101;
    *(_WORD *)&buf[28] = 2048;
    *(double *)&buf[30] = v91;
    _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_DEFAULT, "Send allocate request, sessionID: %@, recipient count: %u, requestID: %@, time: %.6f.", buf, 0x26u);
  }
  v102 = [v22 description];
  [v154 count];
  id v103 = v102;
  cut_dispatch_log_queue();
  v144 = +[NSDate date];
  [(IDSQuickRelayAllocator *)self _sendAllocateRequest:v22];
  v104 = [[QRAllocation alloc] initWithRequest:v22];
  if ([v155 intValue] == 3)
  {
    v105 = [v17 objectForKey:kIDSQRAllocateKey_StreamInfoPublishedStreams];
    v106 = [v17 objectForKey:kIDSQRAllocateKey_StreamInfoSubscribedStreams];
    v107 = [v17 objectForKey:kIDSQRAllocateKey_StreamInfoGenerationCounter];
    v108 = [v17 objectForKey:kIDSQRAllocateKey_StreamInfoMaxConcurrentStreams];
    v109 = [v17 objectForKey:kIDSQRAllocateKey_IsJoinAllocation];
    -[QRAllocation setIsJoinAllocation:](v104, "setIsJoinAllocation:", [v109 BOOLValue]);

    v110 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v111 = [(QRAllocation *)v104 isJoinAllocation];
      CFStringRef v112 = @"NO";
      *(_DWORD *)buf = 138413570;
      *(void *)&uint8_t buf[4] = value;
      *(_WORD *)&buf[12] = 2112;
      if (v111) {
        CFStringRef v112 = @"YES";
      }
      *(void *)&buf[14] = v112;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v105;
      *(_WORD *)&buf[32] = 2112;
      *(void *)&buf[34] = v106;
      __int16 v159 = 2112;
      v160 = v107;
      __int16 v161 = 2112;
      v162 = v108;
      _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_DEFAULT, "Stream information to cache, idsSessionID=%@, isJoinAllocation: %@, publishedStreams=%@, subscribedStreams=%@, generationCounter=%@, maxConcurrentStreams=%@", buf, 0x3Eu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      v113 = [(QRAllocation *)v104 isJoinAllocation] ? @"YES" : @"NO";
      v142 = v107;
      v143 = v108;
      v140 = v105;
      id v141 = v106;
      id v138 = value;
      v139 = v113;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        if ([(QRAllocation *)v104 isJoinAllocation]) {
          CFStringRef v114 = @"YES";
        }
        else {
          CFStringRef v114 = @"NO";
        }
        v142 = v107;
        v143 = v108;
        v140 = v105;
        id v141 = v106;
        id v138 = value;
        v139 = (__CFString *)v114;
        _IDSLogV();
      }
    }
    if (v105 || v106 || v107 || v108)
    {
      id v115 = [[QRStreamInfo alloc] initQRStreamInfo:v105 subscribedStreams:v106 generationCounter:v107 maxConcurrentStreams:v108];
      [(QRAllocation *)v104 setStreamInfo:v115];
    }
  }
  -[QRAllocation setConnectReadyHandler:](v104, "setConnectReadyHandler:", v145, v138, v139, v140, v141, v142, v143);
  [(IDSQuickRelayAllocator *)self _addAllocationForSession:value allocation:v104];
  id v116 = objc_alloc((Class)IDSQuickRelayMetric);
  v117 = [v22 provider];
  v118 = [v22 allocateProtocolVersion];
  v119 = [v22 appID];
  id v120 = [v116 initWithType:&off_1009D1B30 eventSubType:&off_1009D1BF0 duration:0 resultCode:&off_1009D1C08 providerType:v117 transportType:0 interfaceType:0 skeEnabled:0 isInitiator:&off_1009D1B60 protocolVersion:v118 retryCount:0 serviceName:v119 subServiceName:0 participantCount:0];

  v121 = +[IDSCoreAnalyticsLogger defaultLogger];
  [v121 logMetric:v120];

  v122 = [(IDSQuickRelayAllocator *)self _getIDSAWDLoggingInstance];
  v123 = [v22 provider];
  v124 = [v22 allocateProtocolVersion];
  v125 = [v22 appID];
  [v122 IDSQuickRelayEventType:&off_1009D1B30 eventSubType:&off_1009D1BF0 duration:0 resultCode:&off_1009D1C08 providerType:v123 transportType:0 interfaceType:0 skeEnabled:0 isInitiator:&off_1009D1B60 protocolVersion:v124 retryCount:0 serviceName:v125 subServiceName:0 participantCount:0];

  v126 = +[IDSDSessionController sharedInstance];
  v127 = [(QRAllocation *)v104 sessionIDStr];
  v128 = [v126 sessionWithUniqueID:v127];

  if (v128)
  {
    CFMutableDictionaryRef v129 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v130 = [v17 objectForKeyedSubscript:kIDSQRAllocateKey_TimeBase];
    if (v130)
    {
      [v144 timeIntervalSinceDate:v130];
      v132 = +[NSNumber numberWithDouble:v131 * 1000.0];
      [(__CFDictionary *)v129 setObject:v132 forKeyedSubscript:IDSDSessionTimeDeltaKey];

      objc_storeStrong((id *)&self->_timeBase, v130);
    }
    v133 = [v22 allocateProtocolVersion];
    [(__CFDictionary *)v129 setObject:v133 forKeyedSubscript:IDSDSessionReportQRVersionKey];

    [(__CFDictionary *)v129 setObject:&off_1009D1BF0 forKeyedSubscript:IDSDSessionReportQREventSubTypeKey];
    [(__CFDictionary *)v129 setObject:&off_1009D1C08 forKeyedSubscript:IDSDSessionReportResultCodeKey];
    [v128 addQREventForRTCReport:v129];
  }
  else
  {
    v134 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v134, OS_LOG_TYPE_DEFAULT, "Invalid session. Skip AWD report", buf, 2u);
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
  v135 = [v22 requestIDStr];

  return v135;
}

- (id)setupNewAllocationToDevice:(id)a3 options:(id)a4 connectReadyHandler:(id)a5
{
  id v8 = (__CFString *)a3;
  Mutable = (__CFDictionary *)a4;
  v10 = (void (**)(id, void *, void))a5;
  v11 = +[IDSFoundationLog QRAllocator];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v46 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "setupNewAllocationToDevice:options:connectReadyHandler: called {deviceID: %@}", buf, 0xCu);
  }

  im_assert_primary_base_queue();
  if ([(IDSQuickRelayAllocator *)self _startQRConnectionWithDefaults:v8])
  {
    v12 = 0;
    goto LABEL_42;
  }
  BOOL v13 = +[IDSDServiceController sharedInstance];
  v14 = (void *)IDSRegistrationServiceTypeCloudMessaging;
  id v42 = [v13 serviceWithPushTopic:IDSRegistrationServiceTypeCloudMessaging];

  BOOL v15 = +[IDSDAccountController sharedInstance];
  id v16 = [v15 appleIDAccountOnService:v42];

  unsigned int v17 = [(__CFString *)v8 isEqualToString:kIDSDefaultPairedDeviceID];
  if (v17) {
    [v16 defaultPairedDependentRegistration];
  }
  else {
  v41 = [v16 dependentRegistrationMatchingUUID:v8];
  }
  if (!v41)
  {
    v19 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v46 = @"No device found";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
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
    if (v10)
    {
      unsigned int v20 = +[NSDictionary dictionaryWithObject:@"No device found" forKey:NSLocalizedDescriptionKey];
      valuea = +[NSError errorWithDomain:@"QRAllocator" code:7002 userInfo:v20];

      v10[2](v10, valuea, 0);
      v12 = 0;
    }
    else
    {
      v12 = 0;
    }
    goto LABEL_41;
  }
  id value = [v41 objectForKey:IDSDevicePropertyPushToken];
  if (value)
  {
    if (!Mutable) {
      Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    }
    CFDictionarySetValue(Mutable, kIDSQRAllocateKey_RecipientPushToken, value);
    id v18 = v14;
    if (v18)
    {
      CFDictionarySetValue(Mutable, kIDSQRAllocateKey_AppID, v18);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10071CBF8();
    }

    CFDictionarySetValue(Mutable, kIDSQRAllocateKey_AllocateType, &off_1009D1BC0);
    v24 = [v16 unprefixedURIStringsFromRegistration];
    uint64_t v25 = (void *)_IDSCopyCallerIDWithSelfMessagingHint();

    v38 = [v25 _bestGuessURI];

    objc_super v26 = [v16 primaryRegistration];
    v23 = [v26 registrationCert];

    id v27 = objc_alloc((Class)NSMutableArray);
    id v28 = [v16 prefixedURIStringsFromRegistration];
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_1002B33D4;
    v43[3] = &unk_100987E20;
    id v44 = v16;
    v29 = objc_msgSend(v28, "__imArrayByApplyingBlock:", v43);
    id v30 = [v27 initWithArray:v29];

    v31 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      id v32 = [v42 identifier];
      *(_DWORD *)buf = 138412546;
      CFStringRef v46 = v32;
      __int16 v47 = 2112;
      v48 = v8;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "setup allocation for %@ service to device %@", buf, 0x16u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        id v35 = [v42 identifier];
        uint64_t v36 = v8;
        _IDSLogTransport();

        if (_IDSShouldLog())
        {
          id v35 = objc_msgSend(v42, "identifier", v35, v8);
          uint64_t v36 = v8;
          _IDSLogV();
        }
      }
    }
    id v33 = objc_msgSend(v42, "identifier", v35, v36);
    BYTE4(v37) = 0;
    LODWORD(v37) = 0;
    v12 = -[IDSQuickRelayAllocator _setupNewAllocation:sessionID:isSessionIDRemoteDeviceID:fromIdentity:fromURI:fromService:options:connectReadyHandler:withPreferredLocalInterface:forAdditionalAllocation:](self, "_setupNewAllocation:sessionID:isSessionIDRemoteDeviceID:fromIdentity:fromURI:fromService:options:connectReadyHandler:withPreferredLocalInterface:forAdditionalAllocation:", v30, v8, v17 ^ 1, v23, v38, v33, Mutable, v10, v37);
  }
  else
  {
    v38 = +[NSString stringWithFormat:@"No push token for device %@", v8];
    CFStringRef v21 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v46 = v38;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
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
    if (!v10)
    {
      v12 = 0;
      goto LABEL_40;
    }
    id v22 = +[NSDictionary dictionaryWithObject:v38 forKey:NSLocalizedDescriptionKey];
    v23 = +[NSError errorWithDomain:@"QRAllocator" code:7003 userInfo:v22];

    v10[2](v10, v23, 0);
    v12 = 0;
  }

LABEL_40:
LABEL_41:

LABEL_42:

  return v12;
}

- (id)_getResponseFromQRGroupID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_allocateResponses objectForKey:v4];
  v6 = (void *)v5;
  if (v5)
  {
    id v7 = *(id *)(v5 + 8);
  }
  else
  {
    id v8 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No response found for groupID: %@", buf, 0xCu);
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
    id v7 = 0;
  }

  return v7;
}

- (void)clearResponseFromQRGroupID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "clear response for groupID %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        id v6 = v4;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          id v6 = v4;
          _IDSLogV();
        }
      }
    }
    -[NSMutableDictionary removeObjectForKey:](self->_allocateResponses, "removeObjectForKey:", v4, v6);
  }
}

- (void)_setResponseForQRGroupID:(id)a3 groupID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[IDSFoundationLog QRAllocator];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "_setResponseForQRGroupID:groupID: called {groupID: %@}", (uint8_t *)&v13, 0xCu);
  }

  uint64_t v9 = [(NSMutableDictionary *)self->_allocateResponses objectForKey:v6];
  v10 = (void *)v9;
  if (v9)
  {
    uint64_t v11 = *(void *)(v9 + 16);
  }
  else
  {
    if (qword_100A4C550 != -1) {
      dispatch_once(&qword_100A4C550, &stru_100987F20);
    }
    uint64_t v11 = mach_absolute_time() * dword_100A4C548 / *(unsigned int *)algn_100A4C54C / 0x3B9ACA00 + 1800;
  }
  v12 = [[IDSAllocateResponseWrapper alloc] initWithResponse:v7 cleanupTime:v11];

  [(NSMutableDictionary *)self->_allocateResponses setObject:v12 forKey:v6];
}

- (id)findAllocateResponseForSessionID:(id)a3 FromURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IDSQuickRelayAllocator *)self getAllocateResponse:v6 groupID:v6];
  uint64_t v47 = kIDSQRAllocateKey_Allocations;
  objc_msgSend(v8, "objectForKeyedSubscript:");
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = [v9 countByEnumeratingWithState:&v60 objects:v69 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v61;
    uint64_t v13 = kIDSQRAllocateKey_RecipientURI;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v61 != v12) {
          objc_enumerationMutation(v9);
        }
        BOOL v15 = [*(id *)(*((void *)&v60 + 1) + 8 * i) objectForKeyedSubscript:v13];
        if ([v15 isEqualToIgnoringCase:v7])
        {
          uint64_t v34 = +[IDSFoundationLog QRAllocator];
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v68 = v7;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Main cached allocation response contains fromURI: %@", buf, 0xCu);
          }

          id v33 = v8;
          id v16 = v9;
          goto LABEL_40;
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v60 objects:v69 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  id v16 = [(IDSQuickRelayAllocator *)self _findAllocationListForSessionID:v6];
  if (v16)
  {
    p_os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v16 = v16;
    id v18 = [v16 countByEnumeratingWithState:&v56 objects:v66 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v57;
      uint64_t v20 = kIDSQRAllocateKey_RecipientURI;
      id v44 = v8;
      id v45 = v6;
      os_unfair_lock_t lock = &self->_lock;
      uint64_t v37 = *(void *)v57;
      do
      {
        uint64_t v21 = 0;
        id v38 = v18;
        do
        {
          if (*(void *)v57 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v41 = v21;
          id v22 = *(void **)(*((void *)&v56 + 1) + 8 * v21);
          long long v52 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          v23 = [v22 responses];
          id v42 = [v23 countByEnumeratingWithState:&v52 objects:v65 count:16];
          if (v42)
          {
            uint64_t v24 = *(void *)v53;
            CFStringRef v46 = v23;
            uint64_t v39 = *(void *)v53;
            do
            {
              uint64_t v25 = 0;
              do
              {
                if (*(void *)v53 != v24) {
                  objc_enumerationMutation(v23);
                }
                id v43 = *(void **)(*((void *)&v52 + 1) + 8 * (void)v25);
                objc_super v26 = [v43 objectForKeyedSubscript:v47];
                long long v48 = 0u;
                long long v49 = 0u;
                long long v50 = 0u;
                long long v51 = 0u;
                id v27 = v26;
                id v28 = [v27 countByEnumeratingWithState:&v48 objects:v64 count:16];
                if (v28)
                {
                  id v29 = v28;
                  uint64_t v30 = *(void *)v49;
                  while (2)
                  {
                    for (j = 0; j != v29; j = (char *)j + 1)
                    {
                      if (*(void *)v49 != v30) {
                        objc_enumerationMutation(v27);
                      }
                      id v32 = [*(id *)(*((void *)&v48 + 1) + 8 * (void)j) objectForKeyedSubscript:v20];
                      if ([v32 isEqualToIgnoringCase:v7])
                      {
                        id v35 = +[IDSFoundationLog QRAllocator];
                        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412290;
                          id v68 = v7;
                          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Current cached allocation response contains fromURI: %@", buf, 0xCu);
                        }

                        os_unfair_lock_unlock(lock);
                        id v33 = v43;

                        id v8 = v44;
                        id v6 = v45;
                        goto LABEL_40;
                      }
                    }
                    id v29 = [v27 countByEnumeratingWithState:&v48 objects:v64 count:16];
                    if (v29) {
                      continue;
                    }
                    break;
                  }
                }

                uint64_t v25 = (char *)v25 + 1;
                id v8 = v44;
                id v6 = v45;
                v23 = v46;
                uint64_t v24 = v39;
              }
              while (v25 != v42);
              p_os_unfair_lock_t lock = lock;
              uint64_t v19 = v37;
              id v42 = [v46 countByEnumeratingWithState:&v52 objects:v65 count:16];
            }
            while (v42);
          }

          uint64_t v21 = v41 + 1;
        }
        while ((id)(v41 + 1) != v38);
        id v18 = [v16 countByEnumeratingWithState:&v56 objects:v66 count:16];
      }
      while (v18);
    }

    os_unfair_lock_unlock(p_lock);
  }
  id v33 = 0;
LABEL_40:

  return v33;
}

- (id)getAllocateResponse:(id)a3 groupID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IDSFoundationLog QRAllocator];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "getAllocateResponse:groupID called {groupID: %@}", buf, 0xCu);
  }

  id v9 = [(IDSQuickRelayAllocator *)self _parseQuickRelayDefaults:v6 gropuID:v7];
  if (v9)
  {
    id v10 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = v7;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "use hardcoded session token for group %@, session %@.", buf, 0x16u);
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
    id v11 = v9;
  }
  else
  {
    os_unfair_lock_lock(&self->_lock);
    uint64_t v12 = [(IDSQuickRelayAllocator *)self _getResponseFromQRGroupID:v7];
    os_unfair_lock_unlock(&self->_lock);
    id v11 = [(IDSQuickRelayAllocator *)self _createSessionInfoFromResponsePayload:v12];
  }

  return v11;
}

- (BOOL)_shouldUseCurrentResponse:(id)a3 cachedMessage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class();
  id v8 = (void *)kIDSQRAllocateKey_SessionAllocationTime;
  id v9 = sub_1002B4B18(v7, v6, kIDSQRAllocateKey_SessionAllocationTime);
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = sub_1002B4B18(v10, v5, v8);
  uint64_t v12 = (void *)v11;
  if (v9) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    id v14 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)uint64_t v72 = v9;
      *(_WORD *)&v72[8] = 2112;
      v73 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No session allocation time: %@ %@", buf, 0x16u);
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
    LOBYTE(v15) = 0;
  }
  else
  {
    id v16 = [v9 unsignedLongLongValue];
    id v17 = [v12 unsignedLongLongValue];
    if (v16 == v17)
    {
      uint64_t v18 = kIDSQRAllocateKey_RelaySessionID;
      uint64_t v19 = [v6 objectForKey:kIDSQRAllocateKey_RelaySessionID];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v20 = [v6 objectForKey:v18];
        uint64_t v21 = +[NSData _IDSDataFromBase64String:v20];
      }
      else
      {
        uint64_t v20 = [v6 objectForKey:v18];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v22 = 0;
LABEL_21:

          v23 = [v5 objectForKey:v18];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v24 = [v5 objectForKey:v18];
            uint64_t v25 = +[NSData _IDSDataFromBase64String:v24];
          }
          else
          {
            uint64_t v24 = [v5 objectForKey:v18];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_super v26 = 0;
              goto LABEL_27;
            }
            uint64_t v25 = [v5 objectForKey:v18];
          }
          objc_super v26 = (void *)v25;
LABEL_27:

          if (v22 && v26)
          {
            if ([v22 length] == (id)16 && objc_msgSend(v26, "length") == (id)16)
            {
              id v27 = objc_alloc((Class)NSUUID);
              id v64 = v22;
              id v28 = objc_msgSend(v27, "initWithUUIDBytes:", objc_msgSend(v64, "bytes"));
              id v29 = objc_alloc((Class)NSUUID);
              id v30 = v26;
              id v31 = objc_msgSend(v29, "initWithUUIDBytes:", objc_msgSend(v30, "bytes"));
              id v32 = v31;
              id v70 = v28;
              if (!v28 || !v31)
              {
                id v38 = OSLogHandleForTransportCategory();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  *(void *)uint64_t v72 = v28;
                  *(_WORD *)&v72[8] = 2112;
                  v73 = v32;
                  _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Invalid relay session UUID: %@ %@", buf, 0x16u);
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
                LOBYTE(v15) = 0;
                goto LABEL_90;
              }
              id v60 = v30;
              id v63 = v31;
              uint64_t v33 = kIDSQRAllocateKey_RelayAddress;
              id v66 = [v6 objectForKey:kIDSQRAllocateKey_RelayAddress];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v34 = [v6 objectForKey:v33];
                id v65 = +[NSData _IDSDataFromBase64String:v34];
              }
              else
              {
                uint64_t v34 = [v6 objectForKey:v33];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v65 = [v6 objectForKey:v33];
                }
                else
                {
                  id v65 = 0;
                }
              }

              uint64_t v67 = [v5 objectForKey:v33];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v39 = [v5 objectForKey:v33];
                uint64_t v40 = +[NSData _IDSDataFromBase64String:v39];
              }
              else
              {
                uint64_t v39 = [v5 objectForKey:v33];
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  uint64_t v41 = 0;
                  goto LABEL_66;
                }
                uint64_t v40 = [v5 objectForKey:v33];
              }
              uint64_t v41 = (void *)v40;
LABEL_66:

              id v42 = v65;
              if ([v65 isEqualToData:v41])
              {
                long long v59 = v41;
                uint64_t v43 = kIDSQRAllocateKey_RelayAddressIPv6;
                id v68 = [v6 objectForKey:kIDSQRAllocateKey_RelayAddressIPv6];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v44 = [v6 objectForKey:v43];
                  long long v62 = +[NSData _IDSDataFromBase64String:v44];
                }
                else
                {
                  id v44 = [v6 objectForKey:v43];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    long long v62 = [v6 objectForKey:v43];
                  }
                  else
                  {
                    long long v62 = 0;
                  }
                }

                v69 = [v5 objectForKey:v43];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v45 = [v5 objectForKey:v43];
                  long long v61 = +[NSData _IDSDataFromBase64String:v45];
                }
                else
                {
                  id v45 = [v5 objectForKey:v43];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    long long v61 = [v5 objectForKey:v43];
                  }
                  else
                  {
                    long long v61 = 0;
                  }
                }

                if (![v62 isEqualToData:v61]) {
                  goto LABEL_83;
                }
                uint64_t v46 = objc_opt_class();
                uint64_t v47 = (void *)kIDSQRAllocateKey_RelayPort;
                long long v48 = sub_1002B4B18(v46, v6, kIDSQRAllocateKey_RelayPort);
                unsigned int v49 = [v48 unsignedShortValue];

                uint64_t v50 = objc_opt_class();
                long long v51 = sub_1002B4B18(v50, v5, v47);
                LODWORD(v47) = [v51 unsignedShortValue];

                if (v49 == v47)
                {
                  long long v52 = (unint64_t *)[v64 bytes];
                  long long v53 = (unint64_t *)[v60 bytes];
                  id v32 = v63;
                  uint64_t v41 = v59;
                  unint64_t v54 = bswap64(*v52);
                  unint64_t v55 = bswap64(*v53);
                  if (v54 == v55 && (unint64_t v54 = bswap64(v52[1]), v55 = bswap64(v53[1]), v54 == v55))
                  {
                    unsigned int v56 = 0;
                    id v42 = v65;
                  }
                  else
                  {
                    id v42 = v65;
                    if (v54 < v55) {
                      unsigned int v56 = -1;
                    }
                    else {
                      unsigned int v56 = 1;
                    }
                  }
                  BOOL v15 = v56 >> 31;
                }
                else
                {
LABEL_83:
                  LOBYTE(v15) = 1;
                  id v32 = v63;
                  id v42 = v65;
                  uint64_t v41 = v59;
                }
              }
              else
              {
                LOBYTE(v15) = 1;
                id v32 = v63;
              }

LABEL_90:
              goto LABEL_48;
            }
            uint64_t v36 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)uint64_t v72 = [v22 length];
              *(_WORD *)&v72[4] = 1024;
              *(_DWORD *)&v72[6] = [v26 length];
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Invalid relay session ID length: %u %u", buf, 0xEu);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                id v57 = [v22 length];
                id v58 = [v26 length];
                _IDSLogTransport();
                if (_IDSShouldLog())
                {
                  objc_msgSend(v22, "length", v57, v58);
                  [v26 length];
                  _IDSLogV();
                }
              }
            }
          }
          else
          {
            id v35 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218240;
              *(void *)uint64_t v72 = v22;
              *(_WORD *)&v72[8] = 2048;
              v73 = v26;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "No relay session ID: %p %p", buf, 0x16u);
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
          LOBYTE(v15) = 0;
LABEL_48:

          goto LABEL_49;
        }
        uint64_t v21 = [v6 objectForKey:v18];
      }
      id v22 = (void *)v21;
      goto LABEL_21;
    }
    LOBYTE(v15) = v16 < v17;
  }
LABEL_49:

  return v15;
}

- (id)_getResponseForQRSessionID:(id)a3 sessionID:(id)a4 index:(int64_t *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 count];
  if ((uint64_t)v9 - 1 < 0)
  {
LABEL_5:
    BOOL v15 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No response for relay sessionID %@", buf, 0xCu);
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
    uint64_t v12 = 0;
  }
  else
  {
    int64_t v10 = (int64_t)v9;
    uint64_t v11 = kIDSQRAllocateKey_RelaySessionID;
    while (1)
    {
      uint64_t v12 = [v7 objectAtIndex:--v10];
      BOOL v13 = [v12 objectForKey:v11];
      unsigned int v14 = [v8 isEqualToData:v13];

      if (v14) {
        break;
      }

      if (v10 <= 0) {
        goto LABEL_5;
      }
    }
    if (a5) {
      *a5 = v10;
    }
  }

  return v12;
}

- (BOOL)hasParticipantID:(id)a3 participantID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v18;
      uint64_t v11 = kIDSQRAllocateKey_RecipientID;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          BOOL v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "objectForKey:", v11, (void)v17);
          if (v13)
          {
            id v14 = [v6 unsignedLongLongValue];
            if (v14 == [v13 unsignedLongLongValue])
            {

              BOOL v15 = 1;
              goto LABEL_14;
            }
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    BOOL v15 = 0;
LABEL_14:
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (id)_mergeParticipantID2PushTokenMapping:(id)a3 sourceResponse:(id)a4 mappingChange:(BOOL *)a5
{
  id v37 = a3;
  id v32 = a4;
  id v6 = +[IDSFoundationLog QRAllocator];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "_mergeParticipantID2PushTokenMapping:destinationResponse:sourceResponse:mappingChange: called", buf, 2u);
  }

  uint64_t v33 = kIDSQRAllocateKey_Allocations;
  objc_msgSend(v37, "objectForKey:");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v31 = [v32 objectForKey:v33];
  *a5 = 0;
  if (v31)
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id obj = v31;
    id v8 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v8)
    {
      int v34 = 0;
      os_unfair_lock_t lock = &self->_lock;
      uint64_t v39 = *(void *)v41;
      uint64_t v9 = kIDSQRAllocateKey_RecipientID;
      uint64_t v10 = kIDSQRAllocateKey_RecipientPushToken;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v41 != v39) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          BOOL v13 = objc_msgSend(v12, "objectForKey:", v9, v29);
          id v14 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v13 unsignedLongLongValue]);
          uint64_t v15 = [v12 objectForKey:v10];
          id v16 = (void *)v15;
          if (v14) {
            BOOL v17 = v15 == 0;
          }
          else {
            BOOL v17 = 1;
          }
          if (v17)
          {
            long long v18 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v45[0] = v12;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "No recipientID or push token in %@", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                id v29 = v12;
                _IDSLogTransport();
                if (_IDSShouldLog())
                {
                  id v29 = v12;
                  _IDSLogV();
                }
              }
            }
          }
          else
          {
            os_unfair_lock_lock(lock);
            unsigned __int8 v19 = [(IDSQuickRelayAllocator *)self hasParticipantID:v7 participantID:v14];
            if ((v19 & 1) == 0)
            {
              long long v20 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v45[0] = v14;
                _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "merge new participant id %@", buf, 0xCu);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  id v29 = v14;
                  _IDSLogTransport();
                  if (_IDSShouldLog())
                  {
                    id v29 = v14;
                    _IDSLogV();
                  }
                }
              }
              if (!v7)
              {
                id v7 = objc_alloc_init((Class)NSMutableArray);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v21 = v37;
                }
                else
                {
                  id v22 = [v37 mutableCopy];

                  uint64_t v21 = v22;
                }
                id v37 = v21;
                objc_msgSend(v21, "setObject:forKey:", v7, v33, v29);
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v23 = v7;
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  id v24 = [v37 mutableCopy];

                  id v37 = v24;
                }
                id v23 = objc_msgSend(v7, "mutableCopy", v29);

                [v37 setObject:v23 forKey:v33];
              }
              objc_msgSend(v23, "addObject:", v12, v29);
              ++v34;
              id v7 = v23;
            }
            os_unfair_lock_unlock(lock);
          }
        }
        id v8 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v8);

      if (v34)
      {
        *a5 = 1;
        uint64_t v25 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109378;
          LODWORD(v45[0]) = v34;
          WORD2(v45[0]) = 2112;
          *(void *)((char *)v45 + 6) = v7;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%u new participant-id to push token mappings added, %@", buf, 0x12u);
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
    }
  }
  else
  {
    objc_super v26 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v45[0] = v32;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "No participant information in %@", buf, 0xCu);
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
  id v27 = v37;

  return v27;
}

- (void)_notifyParticipantID2PushTokenMappingChange:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSFoundationLog QRAllocator];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_notifyParticipantID2PushTokenMappingChange: called", buf, 2u);
  }

  uint64_t v6 = kIDSQRAllocateKey_IDSSessionID;
  id v7 = [v4 objectForKey:kIDSQRAllocateKey_IDSSessionID];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v4 objectForKey:v6];
    uint64_t v9 = +[NSData _IDSDataFromBase64String:v8];
    uint64_t v10 = sub_1002AE7E0(v9);
  }
  else
  {
    id v8 = [v4 objectForKey:v6];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [v4 objectForKey:v6];
      uint64_t v10 = sub_1002AE7E0(v11);
    }
    else
    {
      uint64_t v10 = sub_1002AE7E0(0);
    }
  }

  uint64_t v12 = [(IDSQuickRelayAllocator *)self _findSessionWithID:v10];
  BOOL v13 = v12;
  if (v12)
  {
    [v12 onParticipantID2PushTokenMappingChange:v4];
  }
  else
  {
    id v14 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Session not found for %@", buf, 0xCu);
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

- (void)_notifyURIToParticipantIDMappingChange:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSFoundationLog QRAllocator];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = IDSLoggableDescriptionForObjectOnService();
    *(_DWORD *)buf = 138412290;
    BOOL v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_notifyURIToParticipantIDMappingChange: %@", buf, 0xCu);
  }
  uint64_t v7 = kIDSQRAllocateKey_IDSSessionID;
  id v8 = [v4 objectForKey:kIDSQRAllocateKey_IDSSessionID];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v4 objectForKey:v7];
    uint64_t v10 = +[NSData _IDSDataFromBase64String:v9];
    uint64_t v11 = sub_1002AE7E0(v10);
  }
  else
  {
    uint64_t v9 = [v4 objectForKey:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v12 = [v4 objectForKey:v7];
      uint64_t v11 = sub_1002AE7E0(v12);
    }
    else
    {
      uint64_t v11 = sub_1002AE7E0(0);
    }
  }

  BOOL v13 = [(IDSQuickRelayAllocator *)self _findSessionWithID:v11];
  if (v13)
  {
    id v14 = [(IDSQuickRelayAllocator *)self _createSessionInfoFromResponsePayload:v4];
    [v13 onURI2ParticipantIDMappingChange:v14 allocateResponse:v4];
  }
  else
  {
    uint64_t v15 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      BOOL v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Session not found for %@", buf, 0xCu);
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

- (BOOL)_addResponseToCache:(id)a3 sessionInfo:(id)a4 modifiedMessage:(id *)a5
{
  id v8 = a3;
  id v76 = a4;
  id v9 = v8;
  *a5 = v9;
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = sub_1002B4B18(v10, v9, kIDSQRAllocateKey_GroupID);
  if (v11)
  {
    uint64_t v12 = kIDSQRAllocateKey_RelaySessionID;
    BOOL v13 = [v9 objectForKey:kIDSQRAllocateKey_RelaySessionID];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = [v9 objectForKey:v12];
      v77 = +[NSData _IDSDataFromBase64String:v14];
    }
    else
    {
      id v14 = [v9 objectForKey:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v77 = [v9 objectForKey:v12];
      }
      else
      {
        v77 = 0;
      }
    }

    if (!v77)
    {
      long long v42 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v82 = v9;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "No QR sessionID in %@", buf, 0xCu);
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
      BOOL v16 = 0;
      goto LABEL_148;
    }
    BOOL v17 = [(IDSQuickRelayAllocator *)self _getResponseFromQRGroupID:v11];
    char v80 = 0;
    v75 = [(IDSQuickRelayAllocator *)self _findSessionWithID:v11];
    if (!v17)
    {
      [(IDSQuickRelayAllocator *)self _setResponseForQRGroupID:v9 groupID:v11];
      goto LABEL_65;
    }
    long long v18 = [v17 objectForKey:v12];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned __int8 v19 = [v17 objectForKey:v12];
      long long v20 = +[NSData _IDSDataFromBase64String:v19];
      unsigned int v21 = [v77 isEqualToData:v20];

      if (v21) {
        goto LABEL_18;
      }
      goto LABEL_57;
    }
    long long v43 = [v17 objectForKey:v12];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v44 = [v17 objectForKey:v12];
      unsigned __int8 v45 = [v77 isEqualToData:v44];

      if ((v45 & 1) == 0) {
        goto LABEL_57;
      }
    }
    else
    {
      unsigned __int8 v46 = [v77 isEqualToData:0];

      if ((v46 & 1) == 0)
      {
LABEL_57:
        if (![(IDSQuickRelayAllocator *)self _shouldUseCurrentResponse:v9 cachedMessage:v17])
        {
          unsigned int v49 = [(IDSQuickRelayAllocator *)self _mergeParticipantID2PushTokenMapping:v17 sourceResponse:v9 mappingChange:&v80];
          if (v49 != v17) {
            [(IDSQuickRelayAllocator *)self _setResponseForQRGroupID:v49 groupID:v11];
          }
          if (v80)
          {
            [(IDSQuickRelayAllocator *)self _notifyParticipantID2PushTokenMappingChange:v49];
            [(IDSQuickRelayAllocator *)self _notifyURIToParticipantIDMappingChange:v49];
          }

          BOOL v16 = 0;
          goto LABEL_71;
        }
        uint64_t v47 = [(IDSQuickRelayAllocator *)self _mergeParticipantID2PushTokenMapping:v9 sourceResponse:v17 mappingChange:&v80];

        id v9 = v47;
        *a5 = v9;
        long long v48 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v82 = v17;
          __int16 v83 = 2112;
          id v84 = v9;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Should switch from %@ to %@", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            v69 = v17;
            id v71 = v9;
            _IDSLogTransport();
            if (_IDSShouldLog())
            {
              v69 = v17;
              id v71 = v9;
              _IDSLogV();
            }
          }
        }
        -[IDSQuickRelayAllocator _setResponseForQRGroupID:groupID:](self, "_setResponseForQRGroupID:groupID:", v9, v11, v69, v71);
LABEL_65:
        BOOL v16 = 1;
LABEL_71:
        uint64_t v50 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v82 = v9;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "message added to cache: %@", buf, 0xCu);
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
        goto LABEL_147;
      }
    }
LABEL_18:
    id v22 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v82 = v77;
      __int16 v83 = 2112;
      id v84 = v17;
      __int16 v85 = 2112;
      id v86 = v9;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Duplicated responses for sessionID: %@, %@, %@", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        id v71 = v17;
        id v72 = v9;
        v69 = v77;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          id v71 = v17;
          id v72 = v9;
          v69 = v77;
          _IDSLogV();
        }
      }
    }
    uint64_t v23 = kIDSQRAllocateKey_RecipientID;
    id v24 = objc_msgSend(v9, "objectForKeyedSubscript:", kIDSQRAllocateKey_RecipientID, v69, v71, v72);
    id v25 = [v24 unsignedLongLongValue];
    objc_super v26 = [v17 objectForKeyedSubscript:v23];
    LODWORD(v25) = v25 == [v26 unsignedLongLongValue];

    if (v25)
    {
      id v27 = [v9 objectForKey:kIDSQRAllocateKey_RelayExpiryTimestamp];
      id v74 = v27;
      if (v27)
      {
        id v28 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Saving duplicate response!", buf, 2u);
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
        if (!self->_duplicateAllocateResponses)
        {
          Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          duplicateAllocateResponses = self->_duplicateAllocateResponses;
          self->_duplicateAllocateResponses = Mutable;
        }
        groupIDToDuplicateResponseCleanupTimers = self->_groupIDToDuplicateResponseCleanupTimers;
        if (!groupIDToDuplicateResponseCleanupTimers)
        {
          id v32 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          uint64_t v33 = self->_groupIDToDuplicateResponseCleanupTimers;
          self->_groupIDToDuplicateResponseCleanupTimers = v32;

          groupIDToDuplicateResponseCleanupTimers = self->_groupIDToDuplicateResponseCleanupTimers;
        }
        int v34 = [(NSMutableDictionary *)groupIDToDuplicateResponseCleanupTimers objectForKey:v11];
        id v35 = v34;
        if (v34) {
          dispatch_source_cancel(v34);
        }
        [(NSMutableDictionary *)self->_duplicateAllocateResponses setObject:v9 forKey:v11];
        uint64_t v36 = (char *)[v74 unsignedLongLongValue];
        time_t v37 = time(0);
        id v38 = im_primary_queue();
        source = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v38);

        dispatch_time_t v39 = dispatch_time(0, 1000000 * (void)&v36[-1000 * v37 - 10]);
        dispatch_source_set_timer(source, v39, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472;
        handler[2] = sub_1002B6FF0;
        handler[3] = &unk_10097E440;
        handler[4] = self;
        id v40 = v11;
        id v79 = v40;
        dispatch_source_set_event_handler(source, handler);
        dispatch_resume(source);
        long long v41 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Duplicate response purge timer started!", buf, 2u);
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
        [(NSMutableDictionary *)self->_groupIDToDuplicateResponseCleanupTimers setObject:source forKey:v40];

LABEL_90:
        id v27 = v74;
      }
    }
    else
    {
      if (!v75) {
        goto LABEL_92;
      }
      id v27 = [v75 fromURI];
      id v74 = v27;
      if (v27)
      {
        source = [v27 prefixedURI];
        long long v51 = [(IDSQuickRelayAllocator *)self _getURIForRecipientFromResponse:v9];
        if ([source isEqualToString:v51])
        {
          long long v52 = [(IDSQuickRelayAllocator *)self _mergeParticipantID2PushTokenMapping:v9 sourceResponse:v17 mappingChange:&v80];

          id v9 = v52;
          *a5 = v9;
          [(IDSQuickRelayAllocator *)self _setResponseForQRGroupID:v9 groupID:v11];
          long long v53 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v82 = v9;
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "message added to cache: %@", buf, 0xCu);
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
          if (v80)
          {
            [(IDSQuickRelayAllocator *)self _notifyParticipantID2PushTokenMappingChange:v9];
            [(IDSQuickRelayAllocator *)self _notifyURIToParticipantIDMappingChange:v9];
          }

          BOOL v16 = 1;
          goto LABEL_147;
        }

        goto LABEL_90;
      }
    }

LABEL_92:
    uint64_t v54 = kIDSQRAllocateKey_QRConnectStatus;
    unint64_t v55 = [v17 objectForKey:kIDSQRAllocateKey_QRConnectStatus];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v56 = [v17 objectForKey:v54];
      uint64_t v57 = +[NSData _IDSDataFromBase64String:v56];
    }
    else
    {
      unsigned int v56 = [v17 objectForKey:v54];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v58 = 0;
LABEL_98:

        if (v58)
        {
          long long v59 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v82 = v58;
            _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "cached allocation response has issue: %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              id v70 = v58;
              _IDSLogTransport();
              if (_IDSShouldLog())
              {
                id v70 = v58;
                _IDSLogV();
              }
            }
          }
          id v60 = -[IDSQuickRelayAllocator _mergeParticipantID2PushTokenMapping:sourceResponse:mappingChange:](self, "_mergeParticipantID2PushTokenMapping:sourceResponse:mappingChange:", v9, v17, &v80, v70);

          id v9 = v60;
          *a5 = v9;
          [(IDSQuickRelayAllocator *)self _setResponseForQRGroupID:v9 groupID:v11];
          long long v61 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v82 = v9;
            _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "message added to cache: %@", buf, 0xCu);
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
          BOOL v16 = 1;
          goto LABEL_146;
        }
        long long v62 = [(IDSQuickRelayAllocator *)self _mergeParticipantID2PushTokenMapping:v17 sourceResponse:v9 mappingChange:&v80];
        if (v62 != v17) {
          [(IDSQuickRelayAllocator *)self _setResponseForQRGroupID:v62 groupID:v11];
        }
        if (v80)
        {
          [(IDSQuickRelayAllocator *)self _notifyParticipantID2PushTokenMappingChange:v62];
          [(IDSQuickRelayAllocator *)self _notifyURIToParticipantIDMappingChange:v62];
        }
        id v63 = [v76 objectForKey:kIDSQRAllocateKey_IDSSessionID];
        if (v63)
        {
          if (v75)
          {
            if ([v75 shouldConnectToQRServer])
            {
              id v64 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "use duplicated response", buf, 2u);
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
              BOOL v16 = 1;
              goto LABEL_145;
            }
            uint64_t v67 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "ignore duplicated response", buf, 2u);
            }

            if (!os_log_shim_legacy_logging_enabled()
              || !_IDSShouldLogTransport()
              || (_IDSLogTransport(), !_IDSShouldLog()))
            {
LABEL_144:
              BOOL v16 = 0;
LABEL_145:

LABEL_146:
LABEL_147:

LABEL_148:
              goto LABEL_149;
            }
          }
          else
          {
            id v66 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v82 = v63;
              _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "failed to find IDSDSession object for %@", buf, 0xCu);
            }

            if (!os_log_shim_legacy_logging_enabled()) {
              goto LABEL_144;
            }
            if (!_IDSShouldLogTransport()) {
              goto LABEL_144;
            }
            _IDSLogTransport();
            if (!_IDSShouldLog()) {
              goto LABEL_144;
            }
          }
        }
        else
        {
          id v65 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v82 = v76;
            _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "no IDSDSession ID in %@", buf, 0xCu);
          }

          if (!os_log_shim_legacy_logging_enabled()) {
            goto LABEL_144;
          }
          if (!_IDSShouldLogTransport()) {
            goto LABEL_144;
          }
          _IDSLogTransport();
          if (!_IDSShouldLog()) {
            goto LABEL_144;
          }
        }
        _IDSLogV();
        goto LABEL_144;
      }
      uint64_t v57 = [v17 objectForKey:v54];
    }
    id v58 = (void *)v57;
    goto LABEL_98;
  }
  uint64_t v15 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v82 = v9;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No groupID in %@", buf, 0xCu);
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
  BOOL v16 = 0;
LABEL_149:

  return v16;
}

- (id)_getURIForRecipientFromResponse:(id)a3
{
  id v3 = a3;
  uint64_t v4 = kIDSQRAllocateKey_RecipientID;
  id v5 = [v3 objectForKeyedSubscript:kIDSQRAllocateKey_RecipientID];
  id v6 = [v5 unsignedLongLongValue];

  [v3 objectForKeyedSubscript:kIDSQRAllocateKey_Allocations];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        BOOL v13 = objc_msgSend(v12, "objectForKeyedSubscript:", v4, (void)v17);
        id v14 = [v13 unsignedLongLongValue];

        if (v6 == v14)
        {
          uint64_t v15 = [v12 objectForKeyedSubscript:kIDSQRAllocateKey_RecipientURI];
          goto LABEL_11;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  uint64_t v15 = 0;
LABEL_11:

  return v15;
}

- (BOOL)_addConnectStatus:(id)a3 relaySessionID:(id)a4 previousTime:(unint64_t)a5 qrReason:(unsigned __int16)a6 previousError:(unsigned __int16)a7 previousRelayIP:(unsigned int)a8 previousAccessToken:(id)a9
{
  uint64_t v9 = *(void *)&a8;
  uint64_t v10 = a7;
  uint64_t v11 = a6;
  id v15 = a3;
  id v16 = a4;
  id v36 = a9;
  long long v17 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413570;
    id v38 = v15;
    __int16 v39 = 2112;
    id v40 = v16;
    __int16 v41 = 1024;
    int v42 = v11;
    __int16 v43 = 1024;
    int v44 = v10;
    __int16 v45 = 1024;
    int v46 = v9;
    __int16 v47 = 2112;
    id v48 = v36;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "addConnectStatus, groupID: %@, relaySessionID: %@i, data: %u %u %u %@", buf, 0x32u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      uint64_t v34 = v9;
      id v35 = v36;
      uint64_t v32 = v11;
      uint64_t v33 = v10;
      id v30 = v15;
      id v31 = v16;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        uint64_t v34 = v9;
        id v35 = v36;
        uint64_t v32 = v11;
        uint64_t v33 = v10;
        id v30 = v15;
        id v31 = v16;
        _IDSLogV();
      }
    }
  }
  long long v18 = -[IDSQuickRelayAllocator _getResponseFromQRGroupID:](self, "_getResponseFromQRGroupID:", v15, v30, v31, v32, v33, v34, v35);
  long long v19 = v18;
  if (!v18)
  {
    id v25 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v15;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "No response for groupID: %@", buf, 0xCu);
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
    long long v19 = 0;
    goto LABEL_24;
  }
  long long v20 = [v18 objectForKey:kIDSQRAllocateKey_RelaySessionID];
  unsigned __int8 v21 = [v16 isEqualToData:v20];

  if ((v21 & 1) == 0)
  {
    objc_super v26 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v38 = v16;
      __int16 v39 = 2112;
      id v40 = v19;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Response is not for sessionID %@, response %@", buf, 0x16u);
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
LABEL_24:
    BOOL v27 = 0;
    goto LABEL_33;
  }
  id v22 = (void **)sub_1002B780C(a5, v11, v10, v9, v36);
  uint64_t v23 = sub_1002B78CC((uint64_t)v22);
  sub_1002B2AB4(v22);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v19 setObject:v23 forKey:kIDSQRAllocateKey_QRConnectStatus];
    id v24 = v19;
  }
  else
  {
    id v24 = [v19 mutableCopy];

    [v24 setObject:v23 forKey:kIDSQRAllocateKey_QRConnectStatus];
    [(IDSQuickRelayAllocator *)self _setResponseForQRGroupID:v24 groupID:v15];
  }
  id v28 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v38 = v16;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Cached response modified for relay sessionID %@", buf, 0xCu);
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

  BOOL v27 = 1;
  long long v19 = v24;
LABEL_33:

  return v27;
}

- (BOOL)invalidateLatestResponse:(id)a3 qrReason:(unsigned __int16)a4 previousError:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  id v8 = a3;
  uint64_t v9 = +[IMLockdownManager sharedInstance];
  unsigned __int8 v10 = [v9 isInternalInstall];

  if (v10)
  {
    CFDictionaryRef v11 = [(IDSQuickRelayAllocator *)self _getResponseFromQRGroupID:v8];
    CFDictionaryRef v12 = v11;
    if (v11)
    {
      *(_DWORD *)buf = -1431655766;
      BOOL v13 = [(__CFDictionary *)v11 objectForKey:kIDSQRAllocateKey_RelaySessionID];
      if (kIDSQRAllocateKey_RelaySessionToken) {
        Value = (void *)CFDictionaryGetValue(v12, kIDSQRAllocateKey_RelaySessionToken);
      }
      else {
        Value = 0;
      }
      id v18 = Value;
      if (kIDSQRAllocateKey_RelayAddress) {
        long long v19 = (void *)CFDictionaryGetValue(v12, kIDSQRAllocateKey_RelayAddress);
      }
      else {
        long long v19 = 0;
      }
      [v19 getBytes:buf length:4];
      ids_monotonic_time();
      BOOL v16 = [(IDSQuickRelayAllocator *)self _addConnectStatus:v8 relaySessionID:v13 previousTime:(unint64_t)v20 qrReason:v6 previousError:v5 previousRelayIP:*(unsigned int *)buf previousAccessToken:v18];
    }
    else
    {
      long long v17 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v8;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "no response for groupID %@", buf, 0xCu);
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
      BOOL v16 = 0;
    }
  }
  else
  {
    id v15 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "response invalidation is supported on internal install only", buf, 2u);
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
    BOOL v16 = 0;
  }

  return v16;
}

- (void)_dispatchIncomingAllocateResponse:(id)a3 isFromCache:(BOOL)a4 connectReadyHandler:(id)a5 requestOptions:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  BOOL v13 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002B7D78;
  block[3] = &unk_100980C98;
  void block[4] = self;
  id v18 = v10;
  BOOL v21 = a4;
  id v19 = v12;
  id v20 = v11;
  id v14 = v11;
  id v15 = v12;
  id v16 = v10;
  dispatch_async(v13, block);
}

- (id)_getSelfAllocationFromCache:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = [(IDSQuickRelayAllocator *)self _findAllocationListForSessionID:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v18;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = [*(id *)(*((void *)&v17 + 1) + 8 * i) getAllocation];
          if (v11)
          {
            BOOL v13 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v22 = v11;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "self allocation in cache: %@", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                id v16 = v11;
                _IDSLogTransport();
                if (_IDSShouldLog())
                {
                  id v16 = v11;
                  _IDSLogV();
                }
              }
            }
            -[IDSQuickRelayAllocator _dispatchIncomingAllocateResponse:isFromCache:connectReadyHandler:requestOptions:](self, "_dispatchIncomingAllocateResponse:isFromCache:connectReadyHandler:requestOptions:", v11, 1, 0, 0, v16);
            os_unfair_lock_unlock(&self->_lock);
            id v14 = [v11 objectForKey:kIDSQRAllocateKey_RequestID];
            id v12 = sub_1002AE7E0(v14);

            goto LABEL_21;
          }
        }
        id v8 = [v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
  }
  os_unfair_lock_unlock(&self->_lock);
  id v7 = +[IDSFoundationLog QRAllocator];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "_getSelfAllocationFromCache: allocation is nil {sessinID: %@}", buf, 0xCu);
  }
  id v12 = 0;
LABEL_21:

  return v12;
}

- (void)_sendIDQueryRequest:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 completionBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  long long v17 = [(IDSQuickRelayAllocator *)self _queryPolicy];
  id v18 = [v17 shouldQueryOnEveryQRAllocationForServiceIdentifier:v15];

  long long v19 = +[IDSFoundationLog QRAllocator];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v20 = @"NO";
    *(_DWORD *)buf = 138413314;
    id v25 = v15;
    if (v18) {
      CFStringRef v20 = @"YES";
    }
    __int16 v26 = 2112;
    CFStringRef v27 = v20;
    __int16 v28 = 2112;
    id v29 = v14;
    __int16 v30 = 2048;
    id v31 = v13;
    __int16 v32 = 2112;
    id v33 = v12;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "_sendIDQueryRequest:fromIdentity:fromURI:fromService:completionBlock: called { fromService: %@, shouldForceQuery: %@, fromURI: %@, fromIdentity: %p, recipientIDs: %@ }", buf, 0x34u);
  }

  BOOL v21 = [(IDSQuickRelayAllocator *)self _peerIDManager];
  id v22 = +[IDSURI URIWithPrefixedURI:v14 withServiceLoggingHint:v15];
  LOBYTE(v23) = 0;
  [v21 startQueryForURIs:v12 fromIdentity:v13 fromURI:v22 fromService:v15 forSending:1 forRefresh:v18 isForced:v23 reason:@"QRAlloc" completionBlock:v16];
}

- (id)_setupNewAllocation:(id)a3 sessionID:(id)a4 isSessionIDRemoteDeviceID:(BOOL)a5 fromIdentity:(id)a6 fromURI:(id)a7 fromService:(id)a8 options:(id)a9 connectReadyHandler:(id)a10 withPreferredLocalInterface:(int)a11 forAdditionalAllocation:(BOOL)a12
{
  BOOL v97 = a5;
  id v100 = a3;
  id v16 = a4;
  id v101 = a6;
  id v103 = (__CFString *)a7;
  id v99 = a8;
  id v17 = a9;
  id v98 = a10;
  id v18 = [v17 objectForKeyedSubscript:kIDSQRAllocateKey_IsLightweightParticipant];
  unsigned int v19 = [v18 BOOLValue];

  CFStringRef v20 = +[IDSFoundationLog QRAllocator];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v21 = @"NO";
    *(_DWORD *)buf = 138412802;
    id v118 = v16;
    __int16 v119 = 2112;
    if (v19) {
      CFStringRef v21 = @"YES";
    }
    time_t v120 = (time_t)v21;
    __int16 v121 = 2112;
    CFStringRef v122 = v103;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "_setupNewAllocation: called {sessionID: %@}, isLightweightParticipant = %@, fromURI: %@", buf, 0x20u);
  }

  im_assert_primary_base_queue();
  if (!v101 || !v103)
  {
    id v22 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v118 = v99;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Unable to setup QR allocation for unregistered account for %@ service", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        id v88 = v99;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          id v88 = v99;
          _IDSLogV();
        }
      }
    }
  }
  if (!v16)
  {
    uint64_t v23 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "missing sessionID to setup a QR allocation", buf, 2u);
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
  if (-[IDSQuickRelayAllocator _startQRConnectionWithDefaults:](self, "_startQRConnectionWithDefaults:", v16, v88))
  {
    id v24 = [(IDSQuickRelayAllocator *)self _findSessionWithID:v16];
    id v25 = v24;
    if (v24 && a12) {
      [v24 setHasPendingAllocation:0 forIDSSession:v16];
    }

    goto LABEL_25;
  }
  uint64_t v27 = kIDSQRAllocateKey_AllocateType;
  __int16 v28 = objc_msgSend(v17, "objectForKey:");
  if ([v28 intValue] == 3)
  {
    id v29 = [v17 objectForKey:kIDSQRAllocateKey_TestOptions];
    unsigned __int8 v30 = [v29 isEqualToString:IDSGroupSessionForceQRSession];

    if (v30)
    {
      v96 = 0;
      goto LABEL_90;
    }
    __int16 v28 = [v17 objectForKey:kIDSQRAllocateKey_GroupID];
    if (!v28)
    {
      __int16 v32 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v118 = v17;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "No groupID for shared session %@", buf, 0xCu);
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
    id v31 = +[NSMutableDictionary dictionary];
    [(NSMutableDictionary *)self->_pushTokenToURIForGroup setObject:v31 forKeyedSubscript:v28];

    CFDictionaryRef theDict = [(IDSQuickRelayAllocator *)self _getResponseFromQRGroupID:v28];
    if (theDict)
    {
LABEL_56:
      __int16 v41 = [v17 objectForKey:kIDSQRAllocateKey_AllocateRequestForUnauthorizedUser];
      unsigned int v42 = [v41 BOOLValue];

      if (theDict)
      {
        __int16 v43 = -[IDSQuickRelayAllocator _getURIForRecipientFromResponse:](self, "_getURIForRecipientFromResponse:");
        int v44 = v43;
        if (v103) {
          unsigned int v45 = [v43 isEqualToString:v103];
        }
        else {
          unsigned int v45 = 1;
        }

        if (((v45 ^ 1 | v42) & 1) == 0)
        {
          v96 = [(__CFDictionary *)theDict objectForKey:kIDSQRAllocateKey_QRConnectStatus];
          id v74 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            id v118 = v16;
            __int16 v119 = 2112;
            time_t v120 = (time_t)theDict;
            __int16 v121 = 2112;
            CFStringRef v122 = v96;
            _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "found cached allocation response for %@: %@, previous connect status %@", buf, 0x20u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              double v90 = theDict;
              double v91 = v96;
              v89 = v16;
              _IDSLogTransport();
              if (_IDSShouldLog())
              {
                double v90 = theDict;
                double v91 = v96;
                v89 = v16;
                _IDSLogV();
              }
            }
          }
          -[IDSQuickRelayAllocator _storeMappingFromPushTokenToURIs:fromID:service:cert:forGroup:](self, "_storeMappingFromPushTokenToURIs:fromID:service:cert:forGroup:", v100, v103, v99, v101, v28, v89, v90, v91);
          if (v96)
          {
            v75 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v118 = v16;
              __int16 v119 = 2112;
              time_t v120 = (time_t)v96;
              _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "cached allocation response has issue: %@ %@", buf, 0x16u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                v89 = v16;
                double v90 = v96;
                _IDSLogTransport();
                if (_IDSShouldLog())
                {
                  v89 = v16;
                  double v90 = v96;
                  _IDSLogV();
                }
              }
            }
          }
          else
          {
            id v76 = [(__CFDictionary *)theDict objectForKey:kIDSQRAllocateKey_RelayExpiryTimestamp];
            v77 = v76;
            if (!v76) {
              goto LABEL_156;
            }
            id v78 = [v76 unsignedLongLongValue];
            time_t v79 = 1000 * time(0);
            char v80 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218240;
              id v118 = v78;
              __int16 v119 = 2048;
              time_t v120 = v79;
              _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "Expired time: %llu, current time: %llu", buf, 0x16u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                v89 = v78;
                double v90 = (void *)v79;
                _IDSLogTransport();
                if (_IDSShouldLog())
                {
                  v89 = v78;
                  double v90 = (void *)v79;
                  _IDSLogV();
                }
              }
            }
            if (v79 + 10 < (unint64_t)v78) {
              goto LABEL_156;
            }
            v81 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "Response has expired or about to expire", buf, 2u);
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
            BOOL v93 = -[NSMutableDictionary objectForKey:](self->_duplicateAllocateResponses, "objectForKey:", v28, v89, v90);
            v92 = [(IDSQuickRelayAllocator *)self _getURIForRecipientFromResponse:v93];
            if (v93 && (!v103 || [v92 isEqualToString:v103]))
            {
              CFDictionaryRef v82 = theDict;
              CFDictionaryRef theDict = v93;
              v96 = 0;
            }
            else
            {
              __int16 v83 = kIDSQRAllocateKey_RelaySessionID
                  ? (void *)CFDictionaryGetValue(theDict, kIDSQRAllocateKey_RelaySessionID)
                  : 0;
              CFDictionaryRef v82 = v83;
              id v84 = kIDSQRAllocateKey_RelayAddress
                  ? (void *)CFDictionaryGetValue(theDict, kIDSQRAllocateKey_RelayAddress)
                  : 0;
              id v85 = v84;
              *(_DWORD *)buf = -1431655766;
              [v85 getBytes:buf length:4];
              ids_monotonic_time();
              v87 = (void **)sub_1002B780C((unint64_t)v86, 1, 0xFFFF, *(int *)buf, v82);
              sub_1002B78CC((uint64_t)v87);
              v96 = (__CFString *)objc_claimAutoreleasedReturnValue();
              sub_1002B2AB4(v87);
            }
            [(NSMutableDictionary *)self->_allocateResponses removeObjectForKey:v28];

            if (!v96)
            {
LABEL_156:
              -[IDSQuickRelayAllocator _dispatchIncomingAllocateResponse:isFromCache:connectReadyHandler:requestOptions:](self, "_dispatchIncomingAllocateResponse:isFromCache:connectReadyHandler:requestOptions:", v89);

LABEL_25:
              __int16 v26 = 0;
              goto LABEL_113;
            }
          }
          goto LABEL_80;
        }
      }
      else
      {
        unsigned int v45 = 0;
      }
      int v46 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v47 = @"NO";
        if (v42) {
          CFStringRef v48 = @"YES";
        }
        else {
          CFStringRef v48 = @"NO";
        }
        *(_DWORD *)buf = 138412802;
        id v118 = v16;
        time_t v120 = (time_t)v48;
        __int16 v119 = 2112;
        if (v45) {
          CFStringRef v47 = @"YES";
        }
        __int16 v121 = 2112;
        CFStringRef v122 = v47;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "found no cached allocation response for %@, isAllocateRequestForUnauthorizedUser: %@, shouldUseCachedResponse: %@", buf, 0x20u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
      {
        unsigned int v49 = v42 ? @"YES" : @"NO";
        uint64_t v50 = v45 ? @"YES" : @"NO";
        double v90 = v49;
        double v91 = v50;
        v89 = v16;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          double v90 = v49;
          double v91 = v50;
          v89 = v16;
          _IDSLogV();
        }
      }
      v96 = 0;
LABEL_80:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        long long v51 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "trying to change a read-only dictionary", buf, 2u);
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
        id v52 = objc_msgSend(v17, "mutableCopy", v89, v90, v91);

        id v17 = v52;
      }
      long long v53 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v100, "count", v89));
      [v17 setObject:v53 forKey:kIDSQRAllocateKey_GroupMemberCount];

      goto LABEL_89;
    }
    id v33 = [(NSMutableDictionary *)self->_sessionIDToURIToResponsePayload objectForKey:v16];
    uint64_t v34 = v33;
    if (!v33)
    {
      CFDictionaryRef theDict = 0;
LABEL_55:

      goto LABEL_56;
    }
    id v35 = [v33 allKeys];
    id v36 = v35;
    if (v103)
    {
      CFDictionaryRef theDict = [v34 objectForKey:v103];
    }
    else
    {
      if (![v35 count]) {
        goto LABEL_53;
      }
      time_t v37 = [v36 objectAtIndexedSubscript:0];
      CFDictionaryRef theDict = [v34 objectForKey:v37];
    }
    if (theDict)
    {
      id v38 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v39 = [(__CFDictionary *)theDict objectForKeyedSubscript:kIDSQRAllocateKey_RecipientID];
        *(_DWORD *)buf = 138412290;
        id v118 = v39;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Setting allocate response for participantID: %@!", buf, 0xCu);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          uint64_t v40 = kIDSQRAllocateKey_RecipientID;
          v89 = [(__CFDictionary *)theDict objectForKeyedSubscript:kIDSQRAllocateKey_RecipientID];
          _IDSLogTransport();

          if (_IDSShouldLog())
          {
            v89 = -[__CFDictionary objectForKeyedSubscript:](theDict, "objectForKeyedSubscript:", v40, v89);
            _IDSLogV();
          }
        }
      }
      [(NSMutableDictionary *)self->_sessionIDToURIToResponsePayload removeAllObjects];
      goto LABEL_54;
    }
LABEL_53:
    CFDictionaryRef theDict = 0;
LABEL_54:

    goto LABEL_55;
  }
  v96 = 0;
LABEL_89:

LABEL_90:
  Value = 0;
  if (v17 && kIDSQRAllocateKey_RecipientPushToken) {
    Value = (void *)CFDictionaryGetValue((CFDictionaryRef)v17, kIDSQRAllocateKey_RecipientPushToken);
  }
  CFDictionaryRef theDicta = Value;
  unint64_t v55 = +[NSUUID UUID];
  unsigned int v56 = [v17 objectForKey:v27];
  unsigned int v57 = [v56 intValue];

  if (v100 || v57 != 2)
  {
    long long v61 = [v17 objectForKeyedSubscript:kIDSQRAllocateKey_waitingForAllocation];
    unsigned int v62 = [v61 BOOLValue];

    if (v62)
    {
      id v63 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v118 = v16;
        _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "Will not send QR allocation request for session: %@", buf, 0xCu);
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
      __int16 v26 = 0;
    }
    else
    {
      v104[0] = _NSConcreteStackBlock;
      v104[1] = 3221225472;
      v104[2] = sub_1002B9684;
      v104[3] = &unk_100987E48;
      v104[4] = self;
      id v64 = v99;
      id v105 = v64;
      CFDictionaryRef v106 = theDicta;
      id v65 = v100;
      id v107 = v65;
      id v66 = v101;
      id v108 = v66;
      id v109 = v17;
      id v67 = v98;
      id v114 = v67;
      id v110 = v16;
      BOOL v115 = a12;
      unsigned int v111 = v96;
      id v68 = v103;
      CFStringRef v112 = v68;
      BOOL v116 = v97;
      id v69 = v55;
      id v113 = v69;
      id v70 = objc_retainBlock(v104);
      if ([v65 count])
      {
        [(IDSQuickRelayAllocator *)self _sendIDQueryRequest:v65 fromIdentity:v66 fromURI:v68 fromService:v64 completionBlock:v70];
      }
      else if (v67)
      {
        id v71 = +[NSDictionary dictionaryWithObject:@"Missing recipientIDs" forKey:NSLocalizedDescriptionKey];
        id v72 = +[NSError errorWithDomain:@"QRAllocator" code:7001 userInfo:v71];

        (*((void (**)(id, void *, void))v67 + 2))(v67, v72, 0);
      }
      __int16 v26 = [v69 UUIDString];
    }
  }
  else
  {
    id v58 = [(IDSQuickRelayAllocator *)self _getSelfAllocationFromCache:v16];
    long long v59 = v58;
    if (v58)
    {
      id v60 = v58;
    }
    else
    {
      LODWORD(v91) = a11;
      id v60 = [(IDSQuickRelayAllocator *)self _setupAllocation:0 fromURI:v103 sessionID:v16 isSessionIDRemoteDeviceID:v97 options:v17 prevConnectStatus:0 requestUUID:v55 connectReadyHandler:v98 withPreferredLocalInterface:v91];
    }
    __int16 v26 = v60;
  }
LABEL_113:

  return v26;
}

- (id)_tokenURIForToken:(id)a3 uri:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length] && objc_msgSend(v6, "length"))
  {
    id v7 = objc_alloc((Class)NSString);
    id v8 = objc_msgSend(v5, "__imHexString");
    id v9 = [v7 initWithFormat:@"token:%@/%@", v8, v6];
  }
  else
  {
    _IMWarn();
    id v9 = 0;
  }

  return v9;
}

- (id)setupNewAllocation:(id)a3 sessionID:(id)a4 fromIdentity:(id)a5 fromURI:(id)a6 fromService:(id)a7 options:(id)a8 connectReadyHandler:(id)a9
{
  BYTE4(v10) = 0;
  LODWORD(v10) = 0;
  return -[IDSQuickRelayAllocator _setupNewAllocation:sessionID:isSessionIDRemoteDeviceID:fromIdentity:fromURI:fromService:options:connectReadyHandler:withPreferredLocalInterface:forAdditionalAllocation:](self, "_setupNewAllocation:sessionID:isSessionIDRemoteDeviceID:fromIdentity:fromURI:fromService:options:connectReadyHandler:withPreferredLocalInterface:forAdditionalAllocation:", a3, a4, 0, a5, a6, a7, a8, a9, v10);
}

- (BOOL)_startQRConnectionWithDefaults:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSQuickRelayAllocator *)self _parseQuickRelayDefaults:v4 gropuID:0];
  if (v5)
  {
    id v6 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "use QR session info from user defaults: %@.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        id v13 = v5;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          id v13 = v5;
          _IDSLogV();
        }
      }
    }
    id v7 = +[NSUUID UUID];
    id v8 = [v7 UUIDString];

    if (v8)
    {
      CFDictionarySetValue(v5, kIDSQRAllocateKey_RequestID, v8);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10071CD90();
    }

    id v9 = v4;
    if (v9)
    {
      CFDictionarySetValue(v5, kIDSQRAllocateKey_IDSSessionID, v9);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10071CD08();
    }

    CFDictionarySetValue(v5, kIDSQRAllocateKey_isInitiator, &__kCFBooleanTrue);
    if ([v9 isEqualToString:kIDSDefaultPairedDeviceID]) {
      CFDictionarySetValue(v5, IDSGlobalLinkOptionForceRelayKey, &__kCFBooleanTrue);
    }
    idsSessionIDToqrSessionID = self->_idsSessionIDToqrSessionID;
    id v11 = [(__CFDictionary *)v5 objectForKey:kIDSQRAllocateKey_RelaySessionID];
    [(NSMutableDictionary *)idsSessionIDToqrSessionID setObject:v11 forKey:v9];

    [(IDSQuickRelayAllocator *)self _startQRConnectionForSession:v5 isInitiatorsAcceptedSession:0 withLocalInterfacePreference:0];
  }

  return v5 != 0;
}

- (id)_getPushTokenFromParticipantID:(id)a3 participantID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v24;
    uint64_t v12 = kIDSQRAllocateKey_RecipientID;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v15 = [v14 objectForKey:v12];
        id v16 = v15;
        if (v15)
        {
          id v17 = [v15 unsignedLongLongValue];
          if (v17 == [v7 unsignedLongLongValue])
          {
            CFStringRef v20 = [v14 objectForKey:kIDSQRAllocateKey_RecipientPushToken];
            os_unfair_lock_unlock(p_lock);

            goto LABEL_18;
          }
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v23 objects:v29 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  os_unfair_lock_unlock(p_lock);
  id v18 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = [v7 unsignedLongLongValue];
    *(_DWORD *)buf = 134217984;
    id v28 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "no push token for participantID %llu", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v22 = [v7 unsignedLongLongValue];
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        objc_msgSend(v7, "unsignedLongLongValue", v22);
        _IDSLogV();
      }
    }
  }
  CFStringRef v20 = 0;
LABEL_18:

  return v20;
}

- (id)getPushTokensFromParticipantIDs:(id)a3 participantIDs:(id)a4
{
  id v23 = a3;
  id v24 = a4;
  id v6 = [(IDSQuickRelayAllocator *)self _getResponseFromQRGroupID:v23];
  long long v25 = v6;
  if (v6)
  {
    id v7 = [v6 objectForKey:kIDSQRAllocateKey_Allocations];
    if (v7)
    {
      id v8 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v24 count]);
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v9 = v24;
      id v10 = [v9 countByEnumeratingWithState:&v26 objects:v34 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v27;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v27 != v11) {
              objc_enumerationMutation(v9);
            }
            id v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            id v14 = [(IDSQuickRelayAllocator *)self _getPushTokenFromParticipantID:v7 participantID:v13];
            if (v14)
            {
              [v8 addObject:v14];
            }
            else
            {
              id v15 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                id v31 = v13;
                __int16 v32 = 2112;
                id v33 = v25;
                _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "no push token for participantID %@ in response %@", buf, 0x16u);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  CFStringRef v21 = v13;
                  id v22 = v25;
                  _IDSLogTransport();
                  if (_IDSShouldLog())
                  {
                    CFStringRef v21 = v13;
                    id v22 = v25;
                    _IDSLogV();
                  }
                }
              }
              id v16 = +[NSNull null];
              [v8 addObject:v16];
            }
          }
          id v10 = [v9 countByEnumeratingWithState:&v26 objects:v34 count:16];
        }
        while (v10);
      }

      id v17 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v31 = v9;
        __int16 v32 = 2112;
        id v33 = v8;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "participantID to push token mapping: %@ %@", buf, 0x16u);
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
      id v19 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = v25;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "no participant list in %@", buf, 0xCu);
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
      id v8 = 0;
    }
  }
  else
  {
    id v18 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v23;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "no response for %@", buf, 0xCu);
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
    id v8 = 0;
  }

  return v8;
}

- (id)getPushTokenFromParticipantID:(id)a3 participantID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IDSQuickRelayAllocator *)self _getResponseFromQRGroupID:v6];
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 objectForKey:kIDSQRAllocateKey_Allocations];
    if (v10)
    {
      uint64_t v11 = [(IDSQuickRelayAllocator *)self _getPushTokenFromParticipantID:v10 participantID:v7];
      if (v11)
      {
        uint64_t v12 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218498;
          id v21 = [v7 unsignedLongLongValue];
          __int16 v22 = 2112;
          id v23 = v11;
          __int16 v24 = 2112;
          id v25 = v6;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "participantID: %llu, pushToken: %@, group: %@", buf, 0x20u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            id v18 = [v7 unsignedLongLongValue];
            _IDSLogTransport();
            if (_IDSShouldLog())
            {
              objc_msgSend(v7, "unsignedLongLongValue", v18, v11, v6);
              _IDSLogV();
            }
          }
        }
        id v13 = v11;
      }
      else
      {
        id v16 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218498;
          id v21 = [v7 unsignedLongLongValue];
          __int16 v22 = 2112;
          id v23 = v9;
          __int16 v24 = 2112;
          id v25 = v6;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "no push token for participantID %llu in response %@ for group: %@", buf, 0x20u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            id v19 = [v7 unsignedLongLongValue];
            _IDSLogTransport();
            if (_IDSShouldLog())
            {
              objc_msgSend(v7, "unsignedLongLongValue", v19, v9, v6);
              _IDSLogV();
            }
          }
        }
      }
    }
    else
    {
      id v15 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v9;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "no participant list in %@", buf, 0xCu);
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
      uint64_t v11 = 0;
    }
  }
  else
  {
    id v14 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "no response for %@", buf, 0xCu);
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
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)getURIFromParticipantID:(id)a3 participantID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v32 = v6;
  id v8 = [(IDSQuickRelayAllocator *)self _getResponseFromQRGroupID:v6];
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 objectForKey:kIDSQRAllocateKey_Allocations];
    id v31 = v10;
    if (v10)
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v11 = v10;
      id v12 = [v11 countByEnumeratingWithState:&v33 objects:v43 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v34;
        uint64_t v14 = kIDSQRAllocateKey_RecipientID;
        while (2)
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v34 != v13) {
              objc_enumerationMutation(v11);
            }
            id v16 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            id v17 = [v16 objectForKey:v14];
            id v18 = v17;
            if (v17)
            {
              id v19 = [v17 unsignedLongLongValue];
              if (v19 == [v7 unsignedLongLongValue])
              {
                __int16 v22 = [v16 objectForKey:kIDSQRAllocateKey_RecipientURI];
                __int16 v24 = OSLogHandleForTransportCategory();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                {
                  id v25 = [v7 unsignedLongLongValue];
                  long long v26 = IDSLoggableDescriptionForHandleOnService();
                  *(_DWORD *)buf = 134218498;
                  id v38 = v25;
                  __int16 v39 = 2112;
                  uint64_t v40 = v32;
                  __int16 v41 = 2112;
                  unsigned int v42 = v26;
                  _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "URI for participant ID %llu in group %@: %@", buf, 0x20u);
                }
                if (os_log_shim_legacy_logging_enabled())
                {
                  if (_IDSShouldLogTransport())
                  {
                    id v27 = [v7 unsignedLongLongValue];
                    long long v29 = IDSLoggableDescriptionForHandleOnService();
                    _IDSLogTransport();

                    if (_IDSShouldLog())
                    {
                      objc_msgSend(v7, "unsignedLongLongValue", v27, v32, v29);
                      unsigned __int8 v30 = IDSLoggableDescriptionForHandleOnService();
                      _IDSLogV();
                    }
                  }
                }

                goto LABEL_39;
              }
            }
          }
          id v12 = [v11 countByEnumeratingWithState:&v33 objects:v43 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }

      CFStringRef v20 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v38 = v7;
        __int16 v39 = 2112;
        uint64_t v40 = v32;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "No URI for participant %@ in group %@", buf, 0x16u);
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
      id v23 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v38 = v9;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "no participant list in %@", buf, 0xCu);
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
    __int16 v22 = 0;
LABEL_39:
  }
  else
  {
    id v21 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v6;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "no response for %@", buf, 0xCu);
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
    __int16 v22 = 0;
  }

  return v22;
}

- (BOOL)isURIAvailabeInAllocateResponse:(id)a3 uri:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v23 = v6;
  id v8 = [(IDSQuickRelayAllocator *)self _getResponseFromQRGroupID:v6];
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 objectForKey:kIDSQRAllocateKey_Allocations];
    id v11 = v10;
    if (v10)
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v12 = v10;
      id v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v25;
        uint64_t v15 = kIDSQRAllocateKey_RecipientURI;
        while (2)
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v25 != v14) {
              objc_enumerationMutation(v12);
            }
            id v17 = [*(id *)(*((void *)&v24 + 1) + 8 * i) objectForKey:v15];
            unsigned __int8 v18 = [v7 isEqualToString:v17];

            if (v18)
            {

              BOOL v20 = 1;
              goto LABEL_27;
            }
          }
          id v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
      id v21 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v9;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "no participant list in %@", buf, 0xCu);
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
    BOOL v20 = 0;
LABEL_27:
  }
  else
  {
    id v19 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v6;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "no response for %@", buf, 0xCu);
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
    BOOL v20 = 0;
  }

  return v20;
}

- (id)getAdditionalAllocationForAddress:(id)a3 selfAddress:(unsigned int)a4 relaySessionID:(id)a5 allocateType:(int64_t)a6 qrReason:(unsigned __int16)a7 previousTime:(unint64_t)a8 previousError:(unsigned __int16)a9 previousRelayIP:(unsigned int)a10 previousAccessToken:(id)a11 requestSelfAllocation:(BOOL)a12 isSessionIDRemoteDeviceID:(BOOL)a13 withPreferredRemoteInterface:(int)a14 withPreferredLocalInterface:(int)a15
{
  uint64_t v15 = a7;
  v92 = (NSMutableDictionary *)a3;
  unsigned int v97 = a4;
  id v20 = a5;
  id v87 = a11;
  im_assert_primary_base_queue();
  id v88 = v20;
  id v21 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    *(void *)id v99 = v92;
    *(_WORD *)&v99[8] = 2112;
    *(void *)&v99[10] = v20;
    *(_WORD *)&v99[18] = 1024;
    *(_DWORD *)&v99[20] = a6;
    __int16 v100 = 1024;
    LODWORD(v101) = v15;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "IDSSession ID %@ requested additional allocation for QR Session ID %@, allocateType %d, reason %d", buf, 0x22u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      int64_t v77 = a6;
      uint64_t v80 = v15;
      id v72 = v92;
      id v75 = v20;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        int64_t v77 = a6;
        uint64_t v80 = v15;
        id v72 = v92;
        id v75 = v20;
        _IDSLogV();
      }
    }
  }
  double v91 = -[IDSQuickRelayAllocator _filterSelfAllocationsForSessionID:](self, "_filterSelfAllocationsForSessionID:", v92, v72, v75, v77, v80);
  if (![v91 count])
  {
    __int16 v22 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      sessionToAllocations = self->_sessionToAllocations;
      *(_DWORD *)buf = 138412290;
      *(void *)id v99 = sessionToAllocations;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "could not find original allocate request to clone %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        v73 = self->_sessionToAllocations;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          v73 = self->_sessionToAllocations;
          _IDSLogV();
        }
      }
    }
  }
  os_unfair_lock_lock(&self->_lock);
  if ([v91 count])
  {
    long long v24 = [v91 objectAtIndex:0];
    long long v25 = [(IDSQuickRelayAllocator *)self _getGroupID:v24];

    os_unfair_lock_unlock(&self->_lock);
    if (v25)
    {
      long long v26 = [(IDSQuickRelayAllocator *)self _uuidFromNSStringToNSData:v88];
      [(IDSQuickRelayAllocator *)self _addConnectStatus:v25 relaySessionID:v26 previousTime:a8 qrReason:v15 previousError:a9 previousRelayIP:a10 previousAccessToken:v87];

      goto LABEL_24;
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  long long v27 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)id v99 = v92;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "No groupID for %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      v73 = v92;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        v73 = v92;
        _IDSLogV();
      }
    }
  }
LABEL_24:
  os_unfair_lock_lock(&self->_lock);
  if ([v91 count])
  {
    long long v28 = [v91 objectAtIndex:0];
    v89 = [v28 request];
  }
  else
  {
    v89 = 0;
  }
  os_unfair_lock_unlock(&self->_lock);
  CFMutableDictionaryRef theDict = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  long long v29 = [(IDSQuickRelayAllocator *)self _findSessionWithID:v92];
  if (v29)
  {
    if (v89)
    {
      id v85 = [v89 appID];
      double v86 = [v89 senderURI];
    }
    else
    {
      id v85 = [v29 getAppID];
      __int16 v32 = [v29 fromURI];
      double v86 = [v32 prefixedURI];
    }
    if (v97)
    {
      id v33 = [objc_alloc((Class)NSData) initWithBytes:&v97 length:4];
      [(__CFDictionary *)theDict setValue:v33 forKey:kIDSQRAllocateKey_SenderExternalAddress];
    }
    -[__CFDictionary setValue:forKey:](theDict, "setValue:forKey:", v85, kIDSQRAllocateKey_AppID, v73);
    long long v34 = +[NSNumber numberWithInteger:a6];
    [(__CFDictionary *)theDict setValue:v34 forKey:kIDSQRAllocateKey_AllocateType];

    long long v35 = +[NSNumber numberWithInt:a14];
    [(__CFDictionary *)theDict setValue:v35 forKey:kIDSQRAllocateKey_PreferredRemoteInterface];

    if (a12)
    {
      if (a6 == 3)
      {
        long long v36 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Ignore self allocation for shared session", buf, 2u);
        }

        int v37 = os_log_shim_legacy_logging_enabled();
        id v38 = v89;
        if (v37)
        {
          int v39 = _IDSShouldLogTransport();
          id v38 = v89;
          if (v39)
          {
            _IDSLogTransport();
            int v40 = _IDSShouldLog();
            id v38 = v89;
            if (v40)
            {
              _IDSLogV();
              id v38 = v89;
            }
          }
        }
        goto LABEL_53;
      }
      [(__CFDictionary *)theDict setValue:&off_1009D1C20 forKey:kIDSQRAllocateKey_SelfAllocationCount];
    }
    id v38 = v89;
    if (a6 == 3)
    {
LABEL_53:
      BOOL v44 = v38 == 0;
      unsigned int v45 = [v29 groupID];
      int v46 = v45;
      if (v44)
      {
        id v47 = v45;
      }
      else
      {
        id v47 = [v89 groupID];
      }
      id v58 = v47;
      if (v47)
      {
        CFDictionarySetValue(theDict, kIDSQRAllocateKey_GroupID, v47);
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_10071CE18();
      }

      if (v46)
      {
        if (![v91 count])
        {
          long long v59 = [(IDSQuickRelayAllocator *)self _uuidFromNSStringToNSData:v88];
          [(IDSQuickRelayAllocator *)self _addConnectStatus:v46 relaySessionID:v59 previousTime:a8 qrReason:v15 previousError:a9 previousRelayIP:a10 previousAccessToken:v87];
        }
      }
      else
      {
        id v60 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)id v99 = v92;
          _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "No groupID for shared session %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            int64_t v74 = (int64_t)v92;
            _IDSLogTransport();
            if (_IDSShouldLog())
            {
              int64_t v74 = (int64_t)v92;
              _IDSLogV();
            }
          }
        }
      }

LABEL_88:
      long long v61 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v62 = [v29 destinations];
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)id v99 = a6;
        *(_WORD *)&v99[4] = 2112;
        *(void *)&v99[6] = v62;
        *(_WORD *)&v99[14] = 2112;
        *(void *)&v99[16] = v92;
        __int16 v100 = 2112;
        id v101 = v86;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "need to do ID query: allocateType: %d, destinations: %@, sessionID: %@, fromURI: %@", buf, 0x26u);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          [v29 destinations];
          id v78 = v92;
          v81 = v86;
          v76 = int64_t v74 = a6;
          _IDSLogTransport();

          if (_IDSShouldLog())
          {
            objc_msgSend(v29, "destinations", a6, v76, v92, v86);
            id v78 = v92;
            v81 = v86;
            v76 = int64_t v74 = a6;
            _IDSLogV();
          }
        }
      }
      id v63 = objc_msgSend(v29, "destinations", v74, v76, v78, v81);
      id v64 = [v63 allObjects];
      id v65 = [v29 getCallerCert];
      id v66 = [v29 getFromService];
      BYTE4(v79) = 1;
      LODWORD(v79) = a15;
      id v31 = -[IDSQuickRelayAllocator _setupNewAllocation:sessionID:isSessionIDRemoteDeviceID:fromIdentity:fromURI:fromService:options:connectReadyHandler:withPreferredLocalInterface:forAdditionalAllocation:](self, "_setupNewAllocation:sessionID:isSessionIDRemoteDeviceID:fromIdentity:fromURI:fromService:options:connectReadyHandler:withPreferredLocalInterface:forAdditionalAllocation:", v64, v92, a13, v65, v86, v66, theDict, 0, v79);

      goto LABEL_118;
    }
    if (a6 == 2)
    {
      __int16 v41 = [(IDSQuickRelayAllocator *)self _getSelfAllocationFromCache:v92];
      unsigned int v42 = v41;
      if (v41)
      {
        id v43 = v41;
      }
      else
      {
        LODWORD(v78) = a15;
        id v43 = [(IDSQuickRelayAllocator *)self _setupAllocation:0 fromURI:v86 sessionID:v92 isSessionIDRemoteDeviceID:a13 options:theDict prevConnectStatus:0 requestUUID:0 connectReadyHandler:0 withPreferredLocalInterface:v78];
      }
      id v31 = v43;

      goto LABEL_118;
    }
    if (!v89) {
      goto LABEL_88;
    }
    id v84 = [v89 recipients];
    if (v88)
    {
      CFStringRef v48 = -[IDSQuickRelayAllocator getPushTokenForRelaySessionID:relaySessionID:](self, "getPushTokenForRelaySessionID:relaySessionID:", v92);
      if (!v48)
      {
        id v68 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)id v99 = v88;
          _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "could not find original push token to clone for QR session %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            int64_t v74 = (int64_t)v88;
            _IDSLogTransport();
            if (_IDSShouldLog())
            {
              int64_t v74 = (int64_t)v88;
              _IDSLogV();
            }
          }
        }
        objc_msgSend(v29, "setHasPendingAllocation:forIDSSession:", 0, v92, v74);
        goto LABEL_116;
      }
      id v82 = objc_alloc_init((Class)NSMutableArray);
      long long v95 = 0u;
      long long v96 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      id v49 = v84;
      id v50 = [v49 countByEnumeratingWithState:&v93 objects:v102 count:16];
      if (v50)
      {
        uint64_t v51 = *(void *)v94;
        id v52 = (const void *)kIDSQRAllocateKey_RecipientPushToken;
        while (2)
        {
          for (i = 0; i != v50; i = (char *)i + 1)
          {
            if (*(void *)v94 != v51) {
              objc_enumerationMutation(v49);
            }
            uint64_t v54 = *(void *)(*((void *)&v93 + 1) + 8 * i);
            if (v54) {
              BOOL v55 = v52 == 0;
            }
            else {
              BOOL v55 = 1;
            }
            if (v55) {
              Value = 0;
            }
            else {
              Value = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(*((void *)&v93 + 1) + 8 * i), v52);
            }
            id v57 = Value;
            if ([v57 isEqual:v48])
            {
              [v82 addObject:v54];

              goto LABEL_106;
            }
          }
          id v50 = [v49 countByEnumeratingWithState:&v93 objects:v102 count:16];
          if (v50) {
            continue;
          }
          break;
        }
      }
LABEL_106:

      id v67 = v82;
    }
    else
    {
      id v67 = v84;
    }
    id v69 = v67;
    if ([v67 count])
    {
      LODWORD(v78) = a15;
      id v31 = [(IDSQuickRelayAllocator *)self _setupAllocation:v69 fromURI:v86 sessionID:v92 isSessionIDRemoteDeviceID:a13 options:theDict prevConnectStatus:0 requestUUID:0 connectReadyHandler:0 withPreferredLocalInterface:v78];

LABEL_117:
      goto LABEL_118;
    }
    id v70 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "could not find existing recipient to clone", buf, 2u);
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
    [v29 setHasPendingAllocation:0 forIDSSession:v92];

LABEL_116:
    id v31 = 0;
    goto LABEL_117;
  }
  id v30 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)id v99 = v92;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Session not found for %@", buf, 0xCu);
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
  id v31 = 0;
LABEL_118:

  return v31;
}

- (void)_handleIncomingAllocateResponse:(id)a3 isFromCache:(BOOL)a4 requestOptions:(id)a5
{
  BOOL v278 = a4;
  id v6 = a3;
  id v274 = a5;
  id v7 = +[IDSFoundationLog QRAllocator];
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  id v9 = (const void *)kIDSQRAllocateKey_RequestID;
  if (v8)
  {
    id v10 = [v6 objectForKey:kIDSQRAllocateKey_RequestID];
    sub_1002AE7E0(v10);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = kIDSQRAllocateKey_IDSSessionID;
    id v13 = [v6 objectForKey:kIDSQRAllocateKey_IDSSessionID];
    sub_1002AE7E0(v13);
    uint64_t v14 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    key = (void *)kIDSQRAllocateKey_RelaySessionID;
    uint64_t v15 = objc_msgSend(v6, "objectForKey:");
    sub_1002AE7E0(v15);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    id v17 = v16;
    CFStringRef v18 = @"NO";
    *(_DWORD *)buf = 138413058;
    unint64_t v304 = (unint64_t)v11;
    if (v278) {
      CFStringRef v18 = @"YES";
    }
    __int16 v305 = 2112;
    CFStringRef v306 = v14;
    __int16 v307 = 2112;
    *(void *)v308 = v16;
    *(_WORD *)&v308[8] = 2112;
    CFStringRef v309 = v18;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received allocate response for RequestID: %@ IDSSessionID: %@ QRSessionID: %@ from cache: %@", buf, 0x2Au);
  }
  else
  {
    uint64_t v12 = kIDSQRAllocateKey_IDSSessionID;
    key = (void *)kIDSQRAllocateKey_RelaySessionID;
  }

  v275 = [(IDSQuickRelayAllocator *)self _translateParticipantIDtoUINT64ForResponse:v6];
  id v19 = [v6 objectForKey:v9];
  id v20 = sub_1002AE7E0(v19);

  id v21 = [v6 objectForKey:v12];
  __int16 v22 = sub_1002AE7E0(v21);

  id v23 = [v6 objectForKey:key];
  long long v24 = sub_1002AE7E0(v23);

  long long v25 = IDSLoggableDescriptionForObjectOnService();
  v293 = _NSConcreteStackBlock;
  uint64_t v294 = 3221225472;
  v295 = sub_1002C0400;
  v296 = &unk_100984CA0;
  id v268 = v20;
  id v297 = v268;
  id v269 = v22;
  id v298 = v269;
  id v270 = v24;
  id v299 = v270;
  BOOL v301 = v278;
  id v271 = v25;
  id v300 = v271;
  cut_dispatch_log_queue();
  long long v26 = +[IDSFoundationLog QRAllocator];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    id v27 = [v6 objectForKey:kIDSQRAllocateKey_RelayAddress];
    long long v28 = [v6 objectForKey:kIDSQRAllocateKey_RelayPort];
    id v29 = [v6 objectForKey:kIDSQRAllocateKey_RelayAddressIPv6];
    *(_DWORD *)buf = 138412802;
    unint64_t v304 = (unint64_t)v27;
    __int16 v305 = 2112;
    CFStringRef v306 = v28;
    __int16 v307 = 2112;
    *(void *)v308 = v29;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "QRserver ipv4: %@:%@, ipv6: %@", buf, 0x20u);
  }
  id v30 = +[IDSFoundationLog QRAllocator];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    id v31 = [v6 objectForKey:kIDSQRAllocateKey_RelayHighPriorityPort];
    __int16 v32 = [v6 objectForKey:kIDSQRAllocateKey_RelayIPPreference];
    -[IDSQuickRelayAllocator _getQuickRelayIPPreference:](self, "_getQuickRelayIPPreference:", [v32 unsignedIntegerValue]);
    id v33 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    unint64_t v304 = (unint64_t)v31;
    __int16 v305 = 2112;
    CFStringRef v306 = v33;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "QRserver hpp: %@, ipp: %@", buf, 0x16u);
  }
  long long v34 = +[IDSFoundationLog QRAllocator];
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    long long v35 = [v6 objectForKey:kIDSQRAllocateKey_RelayServerType];
    unsigned int v36 = [v35 unsignedIntValue];
    CFStringRef v37 = @"Multi-Server Configuration";
    if (!v36) {
      CFStringRef v37 = @"Single-Server Configuration";
    }
    *(_DWORD *)buf = 138412290;
    unint64_t v304 = (unint64_t)v37;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "QRserver type: %@", buf, 0xCu);
  }
  CFDictionaryRef v38 = [(IDSQuickRelayAllocator *)self _createSessionInfoFromResponsePayload:v6];
  CFDictionaryRef theDict = v38;
  if (v38)
  {
    v280 = [(__CFDictionary *)v38 objectForKey:v12];
    if (v9)
    {
      int v39 = (id)CFDictionaryGetValue(theDict, v9);
      Value = 0;
      requestIDToPreferredLocalInterface = self->_requestIDToPreferredLocalInterface;
      v272 = v39;
      if (requestIDToPreferredLocalInterface && v39) {
        Value = (void *)CFDictionaryGetValue((CFDictionaryRef)requestIDToPreferredLocalInterface, v39);
      }
    }
    else
    {
      v272 = 0;
      Value = 0;
    }
    id v266 = Value;
    unsigned int v265 = [v266 intValue];
    v279 = [(IDSQuickRelayAllocator *)self _findAllocationForSessionID:v280 requestIDStr:v272];
    v267 = [(IDSQuickRelayAllocator *)self _findSessionWithID:v280];
    id v43 = [(QRAllocation *)v279 request];
    if (v43) {
      char v44 = v278;
    }
    else {
      char v44 = 1;
    }

    if ((v44 & 1) == 0) {
      [(QRAllocation *)v279 cancelAllocationTimeoutTimer];
    }
    uint64_t v45 = objc_opt_class();
    int v46 = (void *)kIDSQRAllocateKey_AllocateType;
    id v47 = sub_1002B4B18(v45, v6, kIDSQRAllocateKey_AllocateType);
    id v273 = [v47 integerValue];

    if (v273 != (id)3) {
      goto LABEL_93;
    }
    Mutable = [(NSMutableDictionary *)self->_sessionIDToURIToResponsePayload objectForKey:v280];
    if (!Mutable) {
      Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    }
    id v49 = [(IDSQuickRelayAllocator *)self _getURIForRecipientFromResponse:v6];
    id v50 = [Mutable objectForKeyedSubscript:v49];
    if (!v50
      || ([v6 objectForKey:key],
          uint64_t v51 = objc_claimAutoreleasedReturnValue(),
          [v50 objectForKey:key],
          id v52 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v53 = [v51 isEqualToData:v52],
          v52,
          v51,
          (v53 & 1) != 0)
      || [(IDSQuickRelayAllocator *)self _shouldUseCurrentResponse:v6 cachedMessage:v50])
    {
      [Mutable setObject:v6 forKey:v49];
      [(NSMutableDictionary *)self->_sessionIDToURIToResponsePayload setObject:Mutable forKey:v280];
    }
    else
    {
      id v73 = v50;

      uint64_t v74 = [(IDSQuickRelayAllocator *)self _createSessionInfoFromResponsePayload:v73];

      CFDictionaryRef theDict = (const __CFDictionary *)v74;
      id v6 = v73;
    }
    if (v267)
    {
      id v54 = [v267 fromURI];
      BOOL v55 = [(__CFDictionary *)theDict objectForKey:kIDSQRAllocateKey_AppID];
      unsigned __int8 v56 = [v55 isEqualToString:@"com.apple.private.alloy.airdrop.walkaway"];

      if (v54) {
        char v57 = v56;
      }
      else {
        char v57 = 1;
      }
      if (v57)
      {
        int v58 = 0;
        goto LABEL_92;
      }
      unsigned int v62 = [v54 prefixedURI];
      id v66 = [Mutable objectForKey:v62];
      if (v66)
      {
        id v67 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          id v68 = [v66 objectForKeyedSubscript:kIDSQRAllocateKey_RecipientID];
          *(_DWORD *)buf = 138412290;
          unint64_t v304 = (unint64_t)v68;
          _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "Setting allocate response for participantID: %@!", buf, 0xCu);
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            uint64_t v69 = kIDSQRAllocateKey_RecipientID;
            v251 = [v66 objectForKeyedSubscript:kIDSQRAllocateKey_RecipientID];
            _IDSLogTransport();

            if (_IDSShouldLog())
            {
              v251 = objc_msgSend(v66, "objectForKeyedSubscript:", v69, v251);
              _IDSLogV();
            }
          }
        }
        id v70 = v66;

        uint64_t v71 = [(IDSQuickRelayAllocator *)self _createSessionInfoFromResponsePayload:v70];

        [(NSMutableDictionary *)self->_sessionIDToURIToResponsePayload removeAllObjects];
        int v58 = 0;
        CFDictionaryRef theDict = (const __CFDictionary *)v71;
        id v6 = v70;
        goto LABEL_91;
      }
      id v75 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v304 = (unint64_t)v62;
        _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "Have not yet received the allocate response for %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          v251 = v62;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            v251 = v62;
            _IDSLogV();
          }
        }
      }
    }
    else
    {
      long long v59 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "Have not yet received the callerID!", buf, 2u);
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
      id v60 = 0;
      if (v6 && kIDSQRAllocateKey_GroupID) {
        id v60 = (void *)CFDictionaryGetValue((CFDictionaryRef)v6, kIDSQRAllocateKey_GroupID);
      }
      id v54 = v60;
      long long v61 = 0;
      if (key && v6) {
        long long v61 = (void *)CFDictionaryGetValue((CFDictionaryRef)v6, key);
      }
      unsigned int v62 = sub_1002AE7E0(v61);
      char v292 = 0;
      if (v62 && v54)
      {
        CFDictionaryRef v63 = [(IDSQuickRelayAllocator *)self _getResponseFromQRGroupID:v54];
        CFDictionaryRef v64 = v63;
        if (v63)
        {
          id v65 = key ? (void *)CFDictionaryGetValue(v63, key) : 0;
          id v76 = sub_1002AE7E0(v65);
          unsigned int v77 = [v62 isEqualToString:v76];

          if (v77)
          {
            CFDictionaryRef v78 = [(IDSQuickRelayAllocator *)self _mergeParticipantID2PushTokenMapping:v64 sourceResponse:v6 mappingChange:&v292];
            if (v78 != v64) {
              [(IDSQuickRelayAllocator *)self _setResponseForQRGroupID:v78 groupID:v54];
            }
            if (v292)
            {
              [(IDSQuickRelayAllocator *)self _notifyParticipantID2PushTokenMappingChange:v78];
              [(IDSQuickRelayAllocator *)self _notifyURIToParticipantIDMappingChange:v78];
            }
          }
        }
      }
      else
      {
        id v72 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "Invalid groupID or sessionID!", buf, 2u);
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
    int v58 = 1;
LABEL_91:

LABEL_92:
    if (v58)
    {
LABEL_461:

      goto LABEL_462;
    }
LABEL_93:
    uint64_t v79 = objc_opt_class();
    uint64_t v80 = sub_1002B4B18(v79, v6, v46);
    BOOL v81 = [v80 integerValue] == (id)2;

    if (!v81)
    {
      if (!self->_sessionToLocalParticipantID)
      {
        id v82 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        sessionToLocalParticipantID = self->_sessionToLocalParticipantID;
        self->_sessionToLocalParticipantID = v82;
      }
      id v84 = objc_msgSend(v6, "objectForKey:", kIDSQRAllocateKey_RecipientID, v251);
      id v85 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v84 unsignedLongLongValue]);
      double v86 = v85;
      if (v280)
      {
        id v87 = v85;
        if (v87) {
          CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionToLocalParticipantID, v280, v87);
        }
      }
      id v88 = +[IDSFoundationLog QRAllocator];
      if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
      {
        v89 = self->_sessionToLocalParticipantID;
        *(_DWORD *)buf = 138412802;
        unint64_t v304 = (unint64_t)v86;
        __int16 v305 = 2112;
        CFStringRef v306 = v280;
        __int16 v307 = 2112;
        *(void *)v308 = v89;
        _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "add localParticipantID: %@ to sessionID: %@ _sessionToLocalParticipantID: %@", buf, 0x20u);
      }
    }
    CFDictionaryRef v90 = theDict;
    if (v279)
    {
      if (v273 != (id)3)
      {
        unsigned int v91 = -[IDSQuickRelayAllocator _isDuplicateResponse:newResponse:](self, "_isDuplicateResponse:newResponse:");
        CFDictionaryRef v90 = theDict;
        if (v91)
        {
          v92 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "detected duplicate response. Ignore it.", buf, 2u);
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
          goto LABEL_461;
        }
      }
    }
    if (v278 || v273 != (id)3)
    {
      int v263 = 0;
    }
    else
    {
      id v291 = 0;
      unsigned __int8 v93 = [(IDSQuickRelayAllocator *)self _addResponseToCache:v6 sessionInfo:v90 modifiedMessage:&v291];
      id v94 = v291;
      if (v94 == v6)
      {
        id v96 = v6;
      }
      else
      {
        long long v95 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          unint64_t v304 = (unint64_t)v94;
          _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEFAULT, "allocate response modified %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            v251 = v94;
            _IDSLogTransport();
            if (_IDSShouldLog())
            {
              v251 = v94;
              _IDSLogV();
            }
          }
        }
        id v96 = v94;

        uint64_t v97 = [(IDSQuickRelayAllocator *)self _createSessionInfoFromResponsePayload:v96];

        CFDictionaryRef theDict = (const __CFDictionary *)v97;
      }
      v162 = v279;
      if (!v279)
      {
        int8x16_t v163 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v163, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v163, OS_LOG_TYPE_DEFAULT, "no allocation for shared session", buf, 2u);
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
        CFDictionarySetValue(theDict, kIDSQRAllocateKey_isInitiator, &__kCFBooleanFalse);
        v164 = [[QRAllocation alloc] initWithResponse:theDict];
        [(IDSQuickRelayAllocator *)self _addAllocationForSession:v280 allocation:v164];
        v162 = v164;
      }
      v279 = v162;
      if ((v93 & 1) == 0)
      {
        v165 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v165, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v165, OS_LOG_TYPE_DEFAULT, "current response ignored", buf, 2u);
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
        objc_msgSend(v267, "qrAllocatorDidReceiveAllocateResponse:", v96, v251);

        id v6 = v96;
        goto LABEL_461;
      }

      int v263 = 1;
      id v6 = v96;
      CFDictionaryRef v90 = theDict;
    }
    uint64_t v98 = kIDSQRAllocateKey_AppID;
    CFDictionaryRef theDict = v90;
    id v99 = -[__CFDictionary objectForKey:](v90, "objectForKey:", kIDSQRAllocateKey_AppID, v251);
    unsigned int v264 = [v99 isEqualToString:IDSRegistrationServiceTypeCloudMessaging];

    if ([(__CFString *)v280 isEqualToString:kIDSDefaultPairedDeviceID])
    {
      __int16 v100 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
      {
        id v101 = [(__CFDictionary *)theDict objectForKey:v98];
        *(_DWORD *)buf = 138412290;
        unint64_t v304 = (unint64_t)v101;
        _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_DEFAULT, "Recieved allocation from DefaultPairedDeviceID {appID: %@}", buf, 0xCu);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          v252 = [(__CFDictionary *)theDict objectForKey:v98];
          _IDSLogTransport();

          if (_IDSShouldLog())
          {
            v252 = -[__CFDictionary objectForKey:](theDict, "objectForKey:", v98, v252);
            _IDSLogV();
          }
        }
      }
    }
    if (!v264)
    {
LABEL_143:
      if (v279)
      {
        id v110 = [(QRAllocation *)v279 request];

        if (v110)
        {
          unsigned int v111 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
          {
            [(QRAllocation *)v279 duration];
            *(_DWORD *)buf = 138412546;
            unint64_t v304 = (unint64_t)v272;
            __int16 v305 = 2048;
            CFStringRef v306 = v112;
            _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_DEFAULT, "allocate response ID %@ is for initiator and took %0.6lf ms.", buf, 0x16u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              [(QRAllocation *)v279 duration];
              v254 = v113;
              v252 = v272;
              _IDSLogTransport();
              if (_IDSShouldLog())
              {
                [(QRAllocation *)v279 duration];
                v254 = v114;
                v252 = v272;
                _IDSLogV();
              }
            }
          }
          BOOL v115 = 0;
          if (theDict && kIDSQRAllocateKey_RelayExpiryTimestamp) {
            BOOL v115 = (void *)CFDictionaryGetValue(theDict, kIDSQRAllocateKey_RelayExpiryTimestamp);
          }
          id v259 = v115;
          [v259 doubleValue];
          -[QRAllocation setPurgeAtExpiration:](v279, "setPurgeAtExpiration:");
          BOOL v116 = [(QRAllocation *)v279 responses];
          [v116 addObject:theDict];

          [(QRAllocation *)v279 startTime];
          if (v117 == 0.0)
          {
            double v121 = 0.0;
          }
          else
          {
            ids_monotonic_time();
            double v119 = v118;
            [(QRAllocation *)v279 startTime];
            double v121 = v119 - v120;
          }
          -[QRAllocation setDuration:](v279, "setDuration:", v121 * 1000.0, v252, v254);
          v128 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
          {
            [(QRAllocation *)v279 duration];
            CFStringRef v130 = v129;
            double v131 = [(QRAllocation *)v279 request];
            v132 = [v131 recipients];
            unsigned int v133 = [v132 count];
            v134 = [(QRAllocation *)v279 responses];
            unsigned int v135 = [v134 count];
            *(_DWORD *)buf = 138413058;
            unint64_t v304 = (unint64_t)v272;
            __int16 v305 = 2048;
            CFStringRef v306 = v130;
            __int16 v307 = 1024;
            *(_DWORD *)v308 = v133;
            *(_WORD *)&v308[4] = 1024;
            *(_DWORD *)&v308[6] = v135;
            _os_log_impl((void *)&_mh_execute_header, v128, OS_LOG_TYPE_DEFAULT, "allocate response ID %@ is for initiator and took %0.6lf ms, recipient count: %u, response count: %u.", buf, 0x22u);
          }
          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              [(QRAllocation *)v279 duration];
              uint64_t v137 = v136;
              id v138 = [(QRAllocation *)v279 request];
              v139 = [v138 recipients];
              v140 = (__CFString *)[v139 count];
              id v141 = [(QRAllocation *)v279 responses];
              v255 = v140;
              v256 = (__CFString *)[v141 count];
              v254 = v137;
              v252 = v272;
              _IDSLogTransport();

              if (_IDSShouldLog())
              {
                [(QRAllocation *)v279 duration];
                v143 = v142;
                v144 = [(QRAllocation *)v279 request];
                id v145 = [v144 recipients];
                id v146 = (__CFString *)[v145 count];
                id v147 = [(QRAllocation *)v279 responses];
                v255 = v146;
                v256 = (__CFString *)[v147 count];
                v254 = v143;
                v252 = v272;
                _IDSLogV();
              }
            }
          }
          uint64_t v148 = objc_opt_class();
          id v149 = sub_1002B4B18(v148, v6, kIDSQRAllocateKey_Allocations);
          if (!v149)
          {
            __int16 v161 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v161, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v161, OS_LOG_TYPE_DEFAULT, "missing allocation status result for initiator", buf, 2u);
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

            goto LABEL_461;
          }
          long long v289 = 0u;
          long long v290 = 0u;
          long long v287 = 0u;
          long long v288 = 0u;
          id obj = v149;
          char v150 = 0;
          id v151 = [obj countByEnumeratingWithState:&v287 objects:v314 count:16];
          if (v151)
          {
            uint64_t v152 = *(void *)v288;
            uint64_t v153 = kIDSQRAllocateKey_RecipientPushToken;
            while (2)
            {
              for (i = 0; i != v151; i = (char *)i + 1)
              {
                if (*(void *)v288 != v152) {
                  objc_enumerationMutation(obj);
                }
                objc_msgSend(*(id *)(*((void *)&v287 + 1) + 8 * i), "objectForKey:", v153, v252, v254, v255, v256);
                v155 = (__CFString *)objc_claimAutoreleasedReturnValue();
                if (!v155)
                {
                  v167 = OSLogHandleForTransportCategory();
                  if (os_log_type_enabled(v167, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v167, OS_LOG_TYPE_DEFAULT, "missing recipient push token in allocation status result", buf, 2u);
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
                  goto LABEL_250;
                }
                v156 = [(__CFDictionary *)theDict objectForKey:key];
                if (!v156)
                {
                  v168 = OSLogHandleForTransportCategory();
                  if (os_log_type_enabled(v168, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v168, OS_LOG_TYPE_DEFAULT, "missing QR session ID", buf, 2u);
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

                  goto LABEL_250;
                }
                if ((v150 & 1) == 0)
                {
                  v157 = 0;
                  initiatorsAcceptedSessionsWithToken = self->_initiatorsAcceptedSessionsWithToken;
                  if (initiatorsAcceptedSessionsWithToken)
                  {
                    if (v280)
                    {
                      v157 = (id)CFDictionaryGetValue((CFDictionaryRef)initiatorsAcceptedSessionsWithToken, v280);
                      if (v157)
                      {
                        if ([(__CFString *)v155 isEqual:v157])
                        {
                          __int16 v159 = OSLogHandleForTransportCategory();
                          if (os_log_type_enabled(v159, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)buf = 138412546;
                            unint64_t v304 = (unint64_t)v280;
                            __int16 v305 = 2112;
                            CFStringRef v306 = v155;
                            _os_log_impl((void *)&_mh_execute_header, v159, OS_LOG_TYPE_DEFAULT, "detects that session %@ has been accepted by device with token %@", buf, 0x16u);
                          }

                          if (os_log_shim_legacy_logging_enabled())
                          {
                            if (_IDSShouldLogTransport())
                            {
                              v252 = v280;
                              v254 = v155;
                              _IDSLogTransport();
                              if (_IDSShouldLog())
                              {
                                v252 = v280;
                                v254 = v155;
                                _IDSLogV();
                              }
                            }
                          }
                          char v150 = 1;
                        }
                      }
                    }
                  }
                }
                v160 = [(QRAllocation *)v279 pushTokenToQRSessionID];
                [v160 setObject:v156 forKey:v155];
              }
              id v151 = [obj countByEnumeratingWithState:&v287 objects:v314 count:16];
              if (v151) {
                continue;
              }
              break;
            }
          }
LABEL_250:

          unsigned int keya = v150 & 1;
          int v126 = 1;
LABEL_251:
          unsigned int v169 = objc_msgSend(v267, "sharedSessionHasJoined", v252);
          unsigned int v170 = v169;
          if (v278)
          {
            v171 = v274;
            if (v273 == (id)3) {
              unsigned int v172 = v170;
            }
            else {
              unsigned int v172 = 0;
            }
            v173 = v280;
            if (v172 == 1)
            {
              v174 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v174, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v174, OS_LOG_TYPE_DEFAULT, "participant has joined with cached response", buf, 2u);
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
              v171 = v274;
              goto LABEL_301;
            }
          }
          else
          {
            char v175 = v263 ^ 1;
            if (v273 != (id)3) {
              char v175 = 1;
            }
            if (v175)
            {
              if (v273 == (id)3)
              {
                v177 = OSLogHandleForTransportCategory();
                if (os_log_type_enabled(v177, OS_LOG_TYPE_DEFAULT))
                {
                  CFStringRef v178 = @"NO";
                  if (v263) {
                    CFStringRef v179 = @"YES";
                  }
                  else {
                    CFStringRef v179 = @"NO";
                  }
                  if (v170) {
                    CFStringRef v178 = @"YES";
                  }
                  *(_DWORD *)buf = 138412546;
                  unint64_t v304 = (unint64_t)v179;
                  __int16 v305 = 2112;
                  CFStringRef v306 = v178;
                  _os_log_impl((void *)&_mh_execute_header, v177, OS_LOG_TYPE_DEFAULT, "useCurrentResponse=%@, sharedSessionHasJoined=%@", buf, 0x16u);
                }

                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
                {
                  v180 = v263 ? @"YES" : @"NO";
                  v181 = v170 ? @"YES" : @"NO";
                  v253 = v180;
                  v254 = v181;
                  _IDSLogTransport();
                  if (_IDSShouldLog())
                  {
                    v253 = v180;
                    v254 = v181;
                    _IDSLogV();
                  }
                }
              }
            }
            else if (v169)
            {
              v176 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v176, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v176, OS_LOG_TYPE_DEFAULT, "join request in process", buf, 2u);
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
              int v263 = 1;
            }
            else
            {
              v182 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v182, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                unint64_t v304 = (unint64_t)v280;
                _os_log_impl((void *)&_mh_execute_header, v182, OS_LOG_TYPE_DEFAULT, "participant has not joined, ids: %@", buf, 0xCu);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  v253 = v280;
                  _IDSLogTransport();
                  if (_IDSShouldLog())
                  {
                    v253 = v280;
                    _IDSLogV();
                  }
                }
              }
              int v263 = 0;
            }
            -[IDSQuickRelayAllocator _processSelfAllocations:allocation:](self, "_processSelfAllocations:allocation:", v6, v279, v253, v254);
            v171 = v274;
            v173 = v280;
          }
          if (v273 != (id)3)
          {
LABEL_390:
            if ((v126 & 1) != 0
              || (unsigned int v247 = [(NSMutableSet *)self->_pendingRecipientsAcceptedSessions containsObject:v173], v173 = v280, ((v263 | v247 | v264) & 1) != 0)|| v278)
            {
              v229 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v229, OS_LOG_TYPE_DEFAULT))
              {
                CFStringRef v230 = @"NO";
                if (v126) {
                  CFStringRef v231 = @"YES";
                }
                else {
                  CFStringRef v231 = @"NO";
                }
                unsigned int v232 = [(NSMutableSet *)self->_pendingRecipientsAcceptedSessions containsObject:v173];
                CFStringRef v233 = 0;
                if (v232) {
                  CFStringRef v234 = @"YES";
                }
                else {
                  CFStringRef v234 = @"NO";
                }
                if (v264) {
                  CFStringRef v235 = @"YES";
                }
                else {
                  CFStringRef v235 = @"NO";
                }
                if (v263) {
                  CFStringRef v236 = @"YES";
                }
                else {
                  CFStringRef v236 = @"NO";
                }
                if (v278) {
                  CFStringRef v230 = @"YES";
                }
                if (theDict && kIDSQRAllocateKey_StreamInfoSubscribedStreams) {
                  CFStringRef v233 = (const __CFString *)CFDictionaryGetValue(theDict, kIDSQRAllocateKey_StreamInfoSubscribedStreams);
                }
                *(_DWORD *)buf = 138413570;
                unint64_t v304 = (unint64_t)v231;
                __int16 v305 = 2112;
                CFStringRef v306 = v234;
                __int16 v307 = 2112;
                *(void *)v308 = v235;
                *(_WORD *)&v308[8] = 2112;
                CFStringRef v309 = v236;
                __int16 v310 = 2112;
                CFStringRef v311 = v230;
                __int16 v312 = 2112;
                CFStringRef v313 = v233;
                _os_log_impl((void *)&_mh_execute_header, v229, OS_LOG_TYPE_DEFAULT, "isInitiator: %@, pendingRecipientsAcceptedSessions= %@, isCloudAllocation= %@,  useCurrentResponse= %@, isFromCache= %@, subscribedStreams = %@", buf, 0x3Eu);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
              {
                CFStringRef v237 = @"NO";
                v238 = v126 ? @"YES" : @"NO";
                v239 = [(NSMutableSet *)self->_pendingRecipientsAcceptedSessions containsObject:v280]? @"YES": @"NO";
                v240 = v264 ? @"YES" : @"NO";
                v241 = v263 ? @"YES" : @"NO";
                v242 = v278 ? @"YES" : @"NO";
                v243 = (const void *)kIDSQRAllocateKey_StreamInfoSubscribedStreams;
                BOOL v244 = !theDict || kIDSQRAllocateKey_StreamInfoSubscribedStreams == 0;
                BOOL v245 = !v244;
                v246 = v244
                     ? 0
                     : (__CFString *)CFDictionaryGetValue(theDict, kIDSQRAllocateKey_StreamInfoSubscribedStreams);
                v257 = v242;
                v258 = v246;
                v255 = v240;
                v256 = v241;
                v253 = v238;
                v254 = v239;
                _IDSLogTransport();
                if (_IDSShouldLog())
                {
                  if (-[NSMutableSet containsObject:](self->_pendingRecipientsAcceptedSessions, "containsObject:", v280, v238, v239, v240, v241, v242, v258))CFStringRef v237 = @"YES"; {
                  if (v245)
                  }
                    v249 = (__CFString *)CFDictionaryGetValue(theDict, v243);
                  else {
                    v249 = 0;
                  }
                  v257 = v242;
                  v258 = v249;
                  v255 = v240;
                  v256 = v241;
                  v253 = v238;
                  v254 = (__CFString *)v237;
                  _IDSLogV();
                }
              }
              v250 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v250, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                unint64_t v304 = (unint64_t)theDict;
                _os_log_impl((void *)&_mh_execute_header, v250, OS_LOG_TYPE_DEFAULT, "connecting with sessionInfo %@", buf, 0xCu);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  v253 = theDict;
                  _IDSLogTransport();
                  if (_IDSShouldLog())
                  {
                    v253 = theDict;
                    _IDSLogV();
                  }
                }
              }
              -[IDSQuickRelayAllocator _startQRConnectionForSession:isInitiatorsAcceptedSession:withLocalInterfacePreference:](self, "_startQRConnectionForSession:isInitiatorsAcceptedSession:withLocalInterfacePreference:", theDict, keya, v265, v253, v254, v255, v256, v257, v258);
            }
            else
            {
              if (v273 == (id)3) {
                [(IDSQuickRelayAllocator *)self _startCleanupTimer];
              }
              v248 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v248, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v248, OS_LOG_TYPE_DEFAULT, "recipient waits for session acceptance", buf, 2u);
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
            [v267 qrAllocatorDidReceiveAllocateResponse:v6];
            goto LABEL_461;
          }
LABEL_301:
          if (v171)
          {
            v183 = [v171 objectForKey:kIDSQRAllocateKey_StreamInfoPublishedStreams];
            v184 = [v274 objectForKey:kIDSQRAllocateKey_StreamInfoSubscribedStreams];
            v185 = [v274 objectForKey:kIDSQRAllocateKey_StreamInfoGenerationCounter];
            v186 = [v274 objectForKey:kIDSQRAllocateKey_StreamInfoMaxConcurrentStreams];
            v187 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v187, OS_LOG_TYPE_DEFAULT))
            {
              v188 = [v274 objectForKey:kIDSQRAllocateKey_IsJoinAllocation];
              unsigned int v189 = [v188 BOOLValue];
              CFStringRef v190 = @"NO";
              *(_DWORD *)buf = 138413570;
              unint64_t v304 = (unint64_t)v280;
              __int16 v305 = 2112;
              if (v189) {
                CFStringRef v190 = @"YES";
              }
              CFStringRef v306 = v183;
              __int16 v307 = 2112;
              *(void *)v308 = v184;
              *(_WORD *)&v308[8] = 2112;
              CFStringRef v309 = v185;
              __int16 v310 = 2112;
              CFStringRef v311 = v186;
              __int16 v312 = 2112;
              CFStringRef v313 = v190;
              _os_log_impl((void *)&_mh_execute_header, v187, OS_LOG_TYPE_DEFAULT, "joinWithOptions information: idsSessionID=%@, publishedStreams=%@, subscribedStreams=%@, generationCounter=%@, maxConcurrentStreams=%@, isJoinAlid location = %@", buf, 0x3Eu);
            }
            if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLogTransport()) {
              goto LABEL_374;
            }
            uint64_t v191 = kIDSQRAllocateKey_IsJoinAllocation;
            v192 = [v274 objectForKey:kIDSQRAllocateKey_IsJoinAllocation];
            v193 = [v192 BOOLValue] ? @"YES" : @"NO";
            v257 = v186;
            v258 = v193;
            v255 = v184;
            v256 = v185;
            v253 = v280;
            v254 = v183;
            _IDSLogTransport();

            if (!_IDSShouldLog()) {
              goto LABEL_374;
            }
            v194 = objc_msgSend(v274, "objectForKey:", v191, v280, v183, v184, v185, v186, v258);
            if ([v194 BOOLValue]) {
              CFStringRef v195 = @"YES";
            }
            else {
              CFStringRef v195 = @"NO";
            }
            v257 = v186;
            v258 = (__CFString *)v195;
            v255 = v184;
            v256 = v185;
            v253 = v280;
            v254 = v183;
            _IDSLogV();
          }
          else
          {
            if (!v279)
            {
              v202 = 0;
              v203 = 0;
              v204 = 0;
              v205 = 0;
LABEL_382:
              v224 = +[IDSServerBag sharedInstance];
              v225 = [v224 objectForKey:@"qr-session-particiapntID-URI-mapping-included"];

              char v226 = _os_feature_enabled_impl();
              if (v225) {
                char v227 = 0;
              }
              else {
                char v227 = v226;
              }
              if ((v227 & 1) == 0)
              {
                id v228 = [(IDSQuickRelayAllocator *)self _uriToParticipantID:theDict];
                if (v228) {
                  CFDictionarySetValue(theDict, kIDSQRAllocateKey_URIToParticipantID, v228);
                }
              }
              v173 = v280;
              goto LABEL_390;
            }
            obja = [(QRAllocation *)v279 streamInfo];
            v196 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v196, OS_LOG_TYPE_DEFAULT))
            {
              unsigned int v197 = [(QRAllocation *)v279 isJoinAllocation];
              CFStringRef v198 = @"NO";
              if (v197) {
                CFStringRef v198 = @"YES";
              }
              *(_DWORD *)buf = 138412290;
              unint64_t v304 = (unint64_t)v198;
              _os_log_impl((void *)&_mh_execute_header, v196, OS_LOG_TYPE_DEFAULT, "should connect to qr server: %@", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
            {
              v199 = [(QRAllocation *)v279 isJoinAllocation] ? @"YES" : @"NO";
              v253 = v199;
              _IDSLogTransport();
              if (_IDSShouldLog())
              {
                if ([(QRAllocation *)v279 isJoinAllocation]) {
                  CFStringRef v200 = @"YES";
                }
                else {
                  CFStringRef v200 = @"NO";
                }
                v253 = (void *)v200;
                _IDSLogV();
              }
            }
            if (obja)
            {
              v183 = (__CFString *)obja[1];
              v184 = (__CFString *)obja[2];
              v185 = (__CFString *)obja[3];
              v186 = (__CFString *)obja[4];
              v201 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v201, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138413314;
                unint64_t v304 = (unint64_t)v280;
                __int16 v305 = 2112;
                CFStringRef v306 = v183;
                __int16 v307 = 2112;
                *(void *)v308 = v184;
                *(_WORD *)&v308[8] = 2112;
                CFStringRef v309 = v185;
                __int16 v310 = 2112;
                CFStringRef v311 = v186;
                _os_log_impl((void *)&_mh_execute_header, v201, OS_LOG_TYPE_DEFAULT, "Cached stream infomation:  idsSessionID=%@, publishedStreams=%@, subscribedStreams=%@, generationCounter=%@, maxConcurrentStreams=%@", buf, 0x34u);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  v256 = v185;
                  v257 = v186;
                  v254 = v183;
                  v255 = v184;
                  v253 = v280;
                  _IDSLogTransport();
                  if (_IDSShouldLog())
                  {
                    v256 = v185;
                    v257 = v186;
                    v254 = v183;
                    v255 = v184;
                    v253 = v280;
                    _IDSLogV();
                  }
                }
              }
            }
            else
            {
              os_unfair_lock_lock(&self->_lock);
              v260 = [(IDSQuickRelayAllocator *)self _findAllocationListForSessionID:v280];
              if ([v260 count])
              {
                long long v285 = 0u;
                long long v286 = 0u;
                long long v283 = 0u;
                long long v284 = 0u;
                id v206 = v260;
                v183 = (__CFString *)[v206 countByEnumeratingWithState:&v283 objects:v302 count:16];
                if (v183)
                {
                  uint64_t v207 = *(void *)v284;
                  while (2)
                  {
                    for (j = 0; j != v183; j = (__CFString *)((char *)j + 1))
                    {
                      if (*(void *)v284 != v207) {
                        objc_enumerationMutation(v206);
                      }
                      v209 = *(void **)(*((void *)&v283 + 1) + 8 * (void)j);
                      if (objc_msgSend(v209, "isJoinAllocation", v253))
                      {
                        v210 = [v209 streamInfo];
                        BOOL v211 = v210 == 0;

                        if (!v211)
                        {
                          v214 = [v209 streamInfo];
                          [(QRAllocation *)v279 setStreamInfo:v214];

                          v215 = [v209 streamInfo];
                          v183 = (__CFString *)v215[1];

                          v216 = [v209 streamInfo];
                          v184 = (__CFString *)v216[2];

                          v217 = [v209 streamInfo];
                          v185 = (__CFString *)v217[3];

                          v218 = [v209 streamInfo];
                          v186 = (__CFString *)v218[4];

                          v219 = OSLogHandleForTransportCategory();
                          if (os_log_type_enabled(v219, OS_LOG_TYPE_DEFAULT))
                          {
                            id v220 = [v209 streamInfo];
                            *(_DWORD *)buf = 138413314;
                            unint64_t v304 = (unint64_t)v220;
                            __int16 v305 = 2112;
                            CFStringRef v306 = v184;
                            __int16 v307 = 2112;
                            *(void *)v308 = v183;
                            *(_WORD *)&v308[8] = 2112;
                            CFStringRef v309 = v185;
                            __int16 v310 = 2112;
                            CFStringRef v311 = v186;
                            _os_log_impl((void *)&_mh_execute_header, v219, OS_LOG_TYPE_DEFAULT, "set streamInfo from cache: %@, subscribedStreams=%@, publisehdStreams=%@, generationCounter = %@, maxConcurrentStreams = %@", buf, 0x34u);
                          }
                          if (os_log_shim_legacy_logging_enabled())
                          {
                            if (_IDSShouldLogTransport())
                            {
                              [v209 streamInfo];
                              v256 = v185;
                              v257 = v186;
                              v254 = v184;
                              v253 = v255 = v183;
                              _IDSLogTransport();

                              if (_IDSShouldLog())
                              {
                                objc_msgSend(v209, "streamInfo", v253, v184, v183, v185, v186);
                                v256 = v185;
                                v257 = v186;
                                v254 = v184;
                                v253 = v255 = v183;
                                _IDSLogV();
                              }
                            }
                          }
                          goto LABEL_363;
                        }
                      }
                    }
                    v183 = (__CFString *)[v206 countByEnumeratingWithState:&v283 objects:v302 count:16];
                    if (v183) {
                      continue;
                    }
                    break;
                  }
                }
                v184 = 0;
                v185 = 0;
                v186 = 0;
LABEL_363:
              }
              else
              {
                v212 = OSLogHandleForTransportCategory();
                if (os_log_type_enabled(v212, OS_LOG_TYPE_DEFAULT))
                {
                  sessionToAllocations = self->_sessionToAllocations;
                  *(_DWORD *)buf = 138412290;
                  unint64_t v304 = (unint64_t)sessionToAllocations;
                  _os_log_impl((void *)&_mh_execute_header, v212, OS_LOG_TYPE_DEFAULT, "could not find original allocate request %@", buf, 0xCu);
                }

                if (os_log_shim_legacy_logging_enabled())
                {
                  if (_IDSShouldLogTransport())
                  {
                    v253 = self->_sessionToAllocations;
                    _IDSLogTransport();
                    if (_IDSShouldLog())
                    {
                      v253 = self->_sessionToAllocations;
                      _IDSLogV();
                    }
                  }
                }
                v183 = 0;
                v184 = 0;
                v185 = 0;
                v186 = 0;
              }
              os_unfair_lock_unlock(&self->_lock);
              v221 = [(QRAllocation *)v279 streamInfo];
              BOOL v222 = v221 == 0;

              if (v222)
              {
                v223 = OSLogHandleForTransportCategory();
                if (os_log_type_enabled(v223, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v223, OS_LOG_TYPE_DEFAULT, "No stream information", buf, 2u);
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
            v194 = obja;
          }

LABEL_374:
          v202 = v183;
          if (v202) {
            CFDictionarySetValue(theDict, kIDSQRAllocateKey_StreamInfoPublishedStreams, v202);
          }

          v203 = v184;
          if (v203) {
            CFDictionarySetValue(theDict, kIDSQRAllocateKey_StreamInfoSubscribedStreams, v203);
          }

          v204 = v185;
          if (v204) {
            CFDictionarySetValue(theDict, kIDSQRAllocateKey_StreamInfoGenerationCounter, v204);
          }

          v205 = v186;
          if (v205)
          {
            CFDictionarySetValue(theDict, kIDSQRAllocateKey_StreamInfoMaxConcurrentStreams, v205);
          }
          goto LABEL_382;
        }
        v123 = [(QRAllocation *)v279 responses];
        [v123 addObject:theDict];

        v124 = 0;
        if (theDict && kIDSQRAllocateKey_RelayExpiryTimestamp) {
          v124 = (void *)CFDictionaryGetValue(theDict, kIDSQRAllocateKey_RelayExpiryTimestamp);
        }
        id v125 = v124;
        [v125 doubleValue];
        -[QRAllocation setPurgeAtExpiration:](v279, "setPurgeAtExpiration:");
      }
      else
      {
        CFStringRef v122 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          unint64_t v304 = (unint64_t)v272;
          _os_log_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_DEFAULT, "allocate response ID %@ is for recipient.", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            v252 = v272;
            _IDSLogTransport();
            if (_IDSShouldLog())
            {
              v252 = v272;
              _IDSLogV();
            }
          }
        }
        v279 = [[QRAllocation alloc] initWithResponse:theDict];
        [(IDSQuickRelayAllocator *)self _addAllocationForSession:v280 allocation:v279];
      }
      unsigned int keya = 0;
      int v126 = 0;
      goto LABEL_251;
    }
    uint64_t v102 = objc_opt_class();
    id v103 = sub_1002B4B18(v102, v6, kIDSQRAllocateKey_RelayExpiryTimestamp);
    if (!v103)
    {
LABEL_134:
      CFDictionaryRef v106 = +[IDSPairingManager sharedInstance];
      id v107 = [v106 pairedDeviceUniqueID];

      id v108 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v304 = (unint64_t)v107;
        _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEFAULT, "defaultRemoteDeviceCBUUIDString: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          v252 = v107;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            v252 = v107;
            _IDSLogV();
          }
        }
      }
      id v109 = v107;
      if (v109) {
        [(__CFDictionary *)theDict setObject:v109 forKey:kIDSQRAllocateKey_DefaultRemoteDeviceCBUUID];
      }

      goto LABEL_143;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CFStringRef v104 = (const __CFString *)[v103 unsignedLongLongValue];
      unint64_t v105 = 1000 * time(0);
      if ((unint64_t)v104 > v105) {
        goto LABEL_134;
      }
      v166 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v166, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218498;
        unint64_t v304 = v105;
        __int16 v305 = 2048;
        CFStringRef v306 = v104;
        __int16 v307 = 2112;
        *(void *)v308 = v6;
        _os_log_impl((void *)&_mh_execute_header, v166, OS_LOG_TYPE_DEFAULT, "response expired: %16llx %16llx, %@", buf, 0x20u);
      }

      if (!os_log_shim_legacy_logging_enabled()) {
        goto LABEL_236;
      }
      if (!_IDSShouldLogTransport()) {
        goto LABEL_236;
      }
      _IDSLogTransport();
      if (!_IDSShouldLog()) {
        goto LABEL_236;
      }
    }
    else
    {
      v127 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v304 = (unint64_t)v103;
        _os_log_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_DEFAULT, "Relay expiry time-stamp is NaN: %@", buf, 0xCu);
      }

      if (!os_log_shim_legacy_logging_enabled()) {
        goto LABEL_236;
      }
      if (!_IDSShouldLogTransport()) {
        goto LABEL_236;
      }
      _IDSLogTransport();
      if (!_IDSShouldLog()) {
        goto LABEL_236;
      }
    }
    _IDSLogV();
LABEL_236:

    goto LABEL_461;
  }
  unsigned int v42 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "failed to compose a QR sessionInfo dict", buf, 2u);
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
LABEL_462:
}

- (id)_translateParticipantIDtoUINT64ForResponse:(id)a3
{
  id v3 = a3;
  id v4 = (__CFDictionary *)[v3 mutableCopy];
  id v5 = (const void *)kIDSQRAllocateKey_RecipientID;
  id v6 = [v3 objectForKey:kIDSQRAllocateKey_RecipientID];
  id v7 = v6;
  if (v6)
  {
    BOOL v8 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v6 unsignedLongLongValue]);
    if (v8)
    {
      CFDictionarySetValue(v4, v5, v8);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10071CEA0();
    }
  }
  id v9 = (void *)kIDSQRAllocateKey_Allocations;
  id v10 = [v3 objectForKey:kIDSQRAllocateKey_Allocations];
  id v11 = v10;
  if (v10 && [v10 count])
  {
    key = v9;
    id v27 = v3;
    CFDictionaryRef theDict = v4;
    id v12 = objc_alloc_init((Class)NSMutableArray);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v26 = v11;
    id v13 = v11;
    id v14 = [v13 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v30;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(v13);
          }
          CFStringRef v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          id v19 = (__CFDictionary *)[v18 mutableCopy];
          id v20 = [v18 objectForKey:v5];
          id v21 = v20;
          if (v20)
          {
            __int16 v22 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v20 unsignedLongLongValue]);
            if (v22)
            {
              CFDictionarySetValue(v19, v5, v22);
            }
            else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              long long v34 = v5;
              __int16 v35 = 2080;
              unsigned int v36 = "newParticipant";
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", buf, 0x16u);
            }
          }
          [v12 addObject:v19];
        }
        id v15 = [v13 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v15);
    }

    id v23 = v12;
    if (v23)
    {
      id v4 = theDict;
      CFDictionarySetValue(theDict, key, v23);
      id v3 = v27;
    }
    else
    {
      id v3 = v27;
      id v4 = theDict;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10071CEA0();
      }
    }

    id v11 = v26;
  }

  return v4;
}

- (BOOL)_isDuplicateResponse:(id)a3 newResponse:(id)a4
{
  id v5 = a3;
  if (v5 && a4)
  {
    id v6 = (const void *)kIDSQRAllocateKey_RelaySessionID;
    id v7 = [a4 objectForKey:kIDSQRAllocateKey_RelaySessionID];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    BOOL v8 = objc_msgSend(v5, "responses", 0);
    id v9 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v19;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          Value = 0;
          if (v6 && *(void *)(*((void *)&v18 + 1) + 8 * i)) {
            Value = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(*((void *)&v18 + 1) + 8 * i), v6);
          }
          id v14 = Value;
          if ([v14 isEqualToString:v7])
          {
            uint64_t v16 = +[IDSFoundationLog QRAllocator];
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v23 = v7;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "_isDuplicateResponse:newResponse: found duplicate response for QRSessionID: %@", buf, 0xCu);
            }

            BOOL v15 = 1;
            goto LABEL_23;
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    BOOL v8 = +[IDSFoundationLog QRAllocator];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "_isDuplicateResponse:newResponse: duplicate response not found.", buf, 2u);
    }
    BOOL v15 = 0;
LABEL_23:
  }
  else
  {
    id v7 = +[IDSFoundationLog QRAllocator];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "_isDuplicateResponse:newResponse: invalid parameters!", buf, 2u);
    }
    BOOL v15 = 0;
  }

  return v15;
}

- (void)_processSelfAllocations:(id)a3 allocation:(id)a4
{
  id v30 = a3;
  id v29 = a4;
  id v5 = +[IDSFoundationLog QRAllocator];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_processSelfAllocations:allocation: called", buf, 2u);
  }

  uint64_t v6 = objc_opt_class();
  uint64_t v28 = kIDSQRAllocateKey_SelfAllocationArray;
  id v23 = sub_1002B4B18(v6, v30, kIDSQRAllocateKey_SelfAllocationArray);
  if (v23)
  {
    id v7 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v8 = [v23 count];
      *(_DWORD *)buf = 67109120;
      LODWORD(v41) = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "self allocation count in response: %u", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        id v22 = [v23 count];
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          id v22 = objc_msgSend(v23, "count", v22);
          _IDSLogV();
        }
      }
    }
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = v23;
    id v9 = [obj countByEnumeratingWithState:&v35 objects:v42 count:16];
    if (v9)
    {
      uint64_t v26 = kIDSQRAllocateKey_Allocations;
      uint64_t v27 = *(void *)v36;
      uint64_t v25 = kIDSQRAllocateKey_AllocateType;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v36 != v27) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          id v12 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v41 = v11;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "self allocation: %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              id v22 = v11;
              _IDSLogTransport();
              if (_IDSShouldLog())
              {
                id v22 = v11;
                _IDSLogV();
              }
            }
          }
          id v13 = objc_msgSend(v30, "mutableCopy", v22);
          [v13 removeObjectForKey:v28];
          id v14 = objc_alloc_init((Class)NSMutableArray);
          [v13 setObject:v14 forKey:v26];

          long long v33 = 0u;
          long long v34 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          id v15 = v11;
          id v16 = [v15 countByEnumeratingWithState:&v31 objects:v39 count:16];
          if (v16)
          {
            uint64_t v17 = *(void *)v32;
            do
            {
              for (j = 0; j != v16; j = (char *)j + 1)
              {
                if (*(void *)v32 != v17) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v19 = *(void *)(*((void *)&v31 + 1) + 8 * (void)j);
                long long v20 = [v15 objectForKey:v19];
                [v13 setObject:v20 forKey:v19];
              }
              id v16 = [v15 countByEnumeratingWithState:&v31 objects:v39 count:16];
            }
            while (v16);
          }

          [v13 setObject:&off_1009D1C38 forKey:v25];
          [v29 addAllocation:v13];
          long long v21 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v41 = v13;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "transformed self allocation: %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              id v22 = v13;
              _IDSLogTransport();
              if (_IDSShouldLog())
              {
                id v22 = v13;
                _IDSLogV();
              }
            }
          }
        }
        id v9 = [obj countByEnumeratingWithState:&v35 objects:v42 count:16];
      }
      while (v9);
    }
  }
}

- (id)_getCombinedSoftwareID:(id)a3
{
  id v3 = a3;
  id v4 = +[IDSFoundationLog QRAllocator];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "_getCombinedSoftwareID: called", buf, 2u);
  }

  if ([v3 length])
  {
    id v5 = _IDSAllocateProtocolVersionNumber();
    unsigned __int8 v6 = [v5 unsignedShortValue];

    unsigned __int8 v10 = v6;
    id v7 = [objc_alloc((Class)NSMutableData) initWithData:v3];
    [v7 appendBytes:&v10 length:1];
  }
  else
  {
    unsigned int v8 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "failed to get combined-software-id due to invalid parameter.", v11, 2u);
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
    id v7 = 0;
  }

  return v7;
}

- (id)_createSessionInfoFromResponsePayload:(id)a3
{
  CFDictionaryRef v4 = (const __CFDictionary *)a3;
  id v5 = +[IDSFoundationLog QRAllocator];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_createSessionInfoFromResponsePayload: called", buf, 2u);
  }

  if (!v4)
  {
    id v16 = 0;
    goto LABEL_274;
  }
  unsigned __int8 v6 = [[IDSQuickRelayAllocateMessage alloc] initWithDictionary:v4];
  v168 = [(IDSQuickRelayAllocateMessage *)v6 IDSSessionID];
  v167 = [(IDSQuickRelayAllocateMessage *)v6 appID];
  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  unsigned int v8 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(IDSQuickRelayAllocateMessage *)v6 relayBuildVersion];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "QR Build Version: %@", buf, 0xCu);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      v157 = [(IDSQuickRelayAllocateMessage *)v6 relayBuildVersion];
      _IDSLogTransport();

      if (_IDSShouldLog())
      {
        v157 = [(IDSQuickRelayAllocateMessage *)v6 relayBuildVersion];
        _IDSLogV();
      }
    }
  }
  if (objc_msgSend(v167, "isEqualToString:", IDSRegistrationServiceTypeCloudMessaging, v157))
  {
    unsigned __int8 v10 = sub_1002AE7E0(v168);
    if (([v10 isEqualToString:kIDSDefaultPairedDeviceID] & 1) == 0)
    {
      id v11 = v168;
      memset(buf, 170, 16);
      v175.i64[0] = 0xAAAAAAAAAAAAAAAALL;
      v175.i64[1] = 0xAAAAAAAAAAAAAAAALL;
      id v12 = +[IDSCurrentDevice sharedInstance];
      id v13 = [v12 deviceIdentifier];

      if ([v11 length] == (id)16)
      {
        *(_OWORD *)unsigned int keya = *(_OWORD *)[v11 bytes];
        id v14 = [objc_alloc((Class)NSUUID) initWithUUIDString:v13];
        [v14 getUUIDBytes:buf];

        int8x16_t v175 = veorq_s8(*(int8x16_t *)keya, *(int8x16_t *)buf);
        id v15 = +[NSData dataWithBytes:&v175 length:16];
      }
      else
      {
        uint64_t v17 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v173 = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Not an UUID", v173, 2u);
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
        id v15 = v11;
      }
      long long v18 = v15;

      sub_1002AE7E0(v18);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        CFDictionarySetValue(Mutable, kIDSQRAllocateKey_RemoteDeviceIDKey, v19);
      }
      else
      {
        id v20 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10071D8B0();
        }
      }
      long long v21 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v19;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "remote deviceID: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          id v158 = v19;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            id v158 = v19;
            _IDSLogV();
          }
        }
      }
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }
  id v22 = [(IDSQuickRelayAllocateMessage *)v6 requestID];
  id v23 = sub_1002AE7E0(v22);

  id v24 = v23;
  key = v24;
  if (v24)
  {
    CFDictionarySetValue(Mutable, kIDSQRAllocateKey_RequestID, v24);
  }
  else
  {
    id v25 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10071D828();
    }
  }
  if (v10)
  {
    id v26 = v10;
LABEL_43:
    CFDictionarySetValue(Mutable, kIDSQRAllocateKey_IDSSessionID, v26);
    unsigned int v170 = v26;
    goto LABEL_44;
  }
  sub_1002AE7E0(v168);
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  if (v26) {
    goto LABEL_43;
  }
  id v26 = &_os_log_default;
  id v52 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10071D7A0();
  }
  unsigned int v170 = 0;
LABEL_44:

  if ([v170 isEqualToString:kIDSDefaultPairedDeviceID]) {
    CFDictionarySetValue(Mutable, IDSGlobalLinkOptionForceRelayKey, &__kCFBooleanTrue);
  }
  uint64_t v27 = _IDSAllocateProtocolVersionNumber();
  if (v27)
  {
    CFDictionarySetValue(Mutable, kIDSQRAllocateKey_AllocateProtocolVersion, v27);
  }
  else
  {
    id v28 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10071D718();
    }
  }
  os_unfair_lock_lock(&self->_lock);
  id v29 = [(NSMutableDictionary *)self->_sessionToRequestIDToAllocateTime objectForKeyedSubscript:v170];
  if (v29) {
    BOOL v30 = key != 0;
  }
  else {
    BOOL v30 = 0;
  }
  if (v30)
  {
    CFDictionaryRef v31 = [(NSMutableDictionary *)self->_sessionToRequestIDToAllocateTime objectForKeyedSubscript:v170];
    objc_msgSend((id)CFDictionaryGetValue(v31, key), "doubleValue");
    double v33 = v32;
  }
  else
  {
    [0 doubleValue];
    double v33 = v34;
  }

  os_unfair_lock_unlock(&self->_lock);
  if (v33 > 0.0)
  {
    ids_monotonic_time();
    double v36 = v35 - v33;
    long long v37 = +[NSNumber numberWithDouble:v36];
    if (v37)
    {
      CFDictionarySetValue(Mutable, kIDSQRAllocateKey_AllocateTime, v37);
    }
    else
    {
      id v38 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10071D690();
      }
    }
    int v39 = (const void *)kIDSQRAllocateKey_InferredExternalAddress;
    if (kIDSQRAllocateKey_InferredExternalAddress
      && (int v40 = (id)(id)CFDictionaryGetValue(v4, kIDSQRAllocateKey_InferredExternalAddress)) != 0)
    {
      id v41 = v40;
      CFDictionarySetValue(Mutable, v39, v40);
      unsigned int v42 = v41;
    }
    else
    {
      id v41 = &_os_log_default;
      id v43 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10071D584();
      }
      unsigned int v42 = 0;
    }

    char v44 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      *(double *)&uint8_t buf[4] = v36;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v42;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "allocate request took: %.6f seconds, extIPAddr: %@.", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        int8x16_t v163 = v42;
        double v159 = v36;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          int8x16_t v163 = v42;
          double v159 = v36;
          _IDSLogV();
        }
      }
    }
  }
  unsigned int v169 = -[IDSQuickRelayAllocator _findAllocationForSessionID:requestIDStr:](self, "_findAllocationForSessionID:requestIDStr:", v170, key, *(void *)&v159, v163);
  if (!v169
    || ([v169 request],
        uint64_t v45 = objc_claimAutoreleasedReturnValue(),
        BOOL v46 = v45 == 0,
        v45,
        v46))
  {
    CFDictionarySetValue(Mutable, kIDSQRAllocateKey_isInitiator, &__kCFBooleanFalse);
  }
  else
  {
    CFDictionarySetValue(Mutable, kIDSQRAllocateKey_isInitiator, &__kCFBooleanTrue);
    id v47 = [v169 request];
    CFStringRef v48 = [v47 senderExternalIP];

    if (v48)
    {
      id v49 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "allocate response is for an auxiliary connection", buf, 2u);
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
      id v50 = [v169 request];
      uint64_t v51 = [v50 senderExternalIP];

      if (v51)
      {
        CFDictionarySetValue(Mutable, kIDSQRAllocateKey_SenderExternalAddress, v51);
      }
      else
      {
        id v53 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10071D608();
        }
      }
    }
  }
  id v54 = (const void *)kIDSQRAllocateKey_Provider;
  if (kIDSQRAllocateKey_Provider
    && (BOOL v55 = (id)(id)CFDictionaryGetValue(v4, kIDSQRAllocateKey_Provider)) != 0)
  {
    unsigned __int8 v56 = v55;
    CFDictionarySetValue(Mutable, v54, v55);
    v166 = v56;
  }
  else
  {
    unsigned __int8 v56 = &_os_log_default;
    id v57 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10071D584();
    }
    v166 = 0;
  }

  int v58 = [(IDSQuickRelayAllocateMessage *)v6 relaySoftwareVersion];
  long long v59 = [(IDSQuickRelayAllocator *)self _getCombinedSoftwareID:v58];

  id v60 = v59;
  if (v60)
  {
    id v61 = v60;
    CFDictionarySetValue(Mutable, kIDSQRAllocateKey_RelayCombinedSoftwareID, v60);
    id v60 = v61;
  }
  v165 = v60;

  unsigned int v62 = [(IDSQuickRelayAllocateMessage *)v6 relayPort];
  if (v62)
  {
    CFDictionarySetValue(Mutable, kIDSQRAllocateKey_RelayPort, v62);
  }
  else
  {
    id v63 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10071D4FC();
    }
  }
  CFDictionaryRef v64 = [(IDSQuickRelayAllocateMessage *)v6 relayIP];
  if (v64)
  {
    CFDictionarySetValue(Mutable, kIDSQRAllocateKey_RelayAddress, v64);
  }
  else
  {
    id v65 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10071D474();
    }
  }
  id v66 = [(IDSQuickRelayAllocateMessage *)v6 relayIPv6];
  if (v66) {
    CFDictionarySetValue(Mutable, kIDSQRAllocateKey_RelayAddressIPv6, v66);
  }

  id v67 = [(IDSQuickRelayAllocateMessage *)v6 relayHighPriorityPort];
  if (v67) {
    CFDictionarySetValue(Mutable, kIDSQRAllocateKey_RelayHighPriorityPort, v67);
  }

  id v68 = [(IDSQuickRelayAllocateMessage *)v6 relaySessionToken];
  if (v68)
  {
    CFDictionarySetValue(Mutable, kIDSQRAllocateKey_RelaySessionToken, v68);
  }
  else
  {
    id v69 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10071D3EC();
    }
  }
  id v70 = [(IDSQuickRelayAllocateMessage *)v6 infoAttribute];
  if (v70) {
    CFDictionarySetValue(Mutable, kIDSQRAllocateKey_PreferredRemoteInterface, v70);
  }

  uint64_t v71 = [(IDSQuickRelayAllocateMessage *)v6 pskTransportParameters];
  if (v71) {
    CFDictionarySetValue(Mutable, kIDSQRAllocateKey_PSKTransportParameters, v71);
  }

  id v72 = [(IDSQuickRelayAllocateMessage *)v6 pskH3Settings];
  if (v72) {
    CFDictionarySetValue(Mutable, kIDSQRAllocateKey_PSKH3Settings, v72);
  }

  id v73 = [(IDSQuickRelayAllocateMessage *)v6 reportingDataBlob];
  if (v73) {
    CFDictionarySetValue(Mutable, kIDSQRAllocateKey_ReportingDataBlob, v73);
  }

  uint64_t v74 = [(IDSQuickRelayAllocateMessage *)v6 isInternal];
  if (v74) {
    CFDictionarySetValue(Mutable, kIDSQRAllocateKey_IsInternal, v74);
  }

  uint64_t v75 = IMGetCachedDomainIntForKeyWithDefaultValue();
  if ((v75 & 0x80000000) != 0)
  {
    unsigned int v77 = [(IDSQuickRelayAllocateMessage *)v6 ipPreference];
    if (v77) {
      CFDictionarySetValue(Mutable, kIDSQRAllocateKey_RelayIPPreference, v77);
    }
  }
  else
  {
    id v76 = +[NSNumber numberWithInt:v75];
    if (v76)
    {
      CFDictionarySetValue(Mutable, kIDSQRAllocateKey_RelayIPPreference, v76);
    }
    else
    {
      id v78 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10071D364();
      }
    }
    uint64_t v79 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v75;
      _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "defaults write to set ipPreference: %d", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        uint64_t v160 = v75;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          uint64_t v160 = v75;
          _IDSLogV();
        }
      }
    }
  }
  uint64_t v80 = IMGetCachedDomainIntForKeyWithDefaultValue();
  if ((v80 & 0x80000000) != 0)
  {
    id v82 = (const void *)kIDSQRAllocateKey_LinkSuggestion;
    if (kIDSQRAllocateKey_LinkSuggestion)
    {
      __int16 v83 = (id)(id)CFDictionaryGetValue(v4, kIDSQRAllocateKey_LinkSuggestion);
      if (v83)
      {
        id v84 = v83;
        CFDictionarySetValue(Mutable, v82, v83);
      }
    }
  }
  else
  {
    BOOL v81 = +[NSNumber numberWithInt:v80];
    if (v81)
    {
      CFDictionarySetValue(Mutable, kIDSQRAllocateKey_LinkSuggestion, v81);
    }
    else
    {
      id v85 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10071D2DC();
      }
    }
    double v86 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v80;
      _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "defaults write to set linkSuggestionValue: %d", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        uint64_t v160 = v80;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          uint64_t v160 = v80;
          _IDSLogV();
        }
      }
    }
  }
  uint64_t v87 = IMGetCachedDomainIntForKeyWithDefaultValue();
  if ((v87 & 0x80000000) != 0)
  {
    v89 = (const void *)kIDSQRAllocateKey_LinkScore;
    if (kIDSQRAllocateKey_LinkScore)
    {
      CFDictionaryRef v90 = (id)(id)CFDictionaryGetValue(v4, kIDSQRAllocateKey_LinkScore);
      if (v90)
      {
        unsigned int v91 = v90;
        CFDictionarySetValue(Mutable, v89, v90);
      }
    }
  }
  else
  {
    id v88 = +[NSNumber numberWithInt:v87];
    if (v88)
    {
      CFDictionarySetValue(Mutable, kIDSQRAllocateKey_LinkScore, v88);
    }
    else
    {
      id v92 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10071D254();
      }
    }
    unsigned __int8 v93 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v87;
      _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "defaults write to set linkScoreValue: %d", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        uint64_t v160 = v87;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          uint64_t v160 = v87;
          _IDSLogV();
        }
      }
    }
  }
  id v94 = [(IDSQuickRelayAllocateMessage *)v6 qrExperiments];
  if (IMGetDomainBoolForKey())
  {
    long long v95 = +[NSNumber numberWithBool:1];
    if (v95)
    {
      CFDictionarySetValue(Mutable, kIDSQRAllocateKey_HTTP2Disabled, v95);
    }
    else
    {
      id v98 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10071D1CC();
      }
    }
    uint64_t v97 = +[IDSFoundationLog QRAllocator];
    if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_DEFAULT, "Disable HTTP2 due to user defaults", buf, 2u);
    }
  }
  else
  {
    id v96 = (const void *)kIDSQRAllocateKey_HTTP2Disabled;
    uint64_t v97 = [v94 objectForKey:kIDSQRAllocateKey_HTTP2Disabled];
    if (v97) {
      CFDictionarySetValue(Mutable, v96, v97);
    }
  }

  if (IMGetDomainBoolForKey())
  {
    id v99 = +[NSNumber numberWithBool:1];
    if (v99)
    {
      CFDictionarySetValue(Mutable, kIDSQRAllocateKey_IPDiscoveryDisabled, v99);
    }
    else
    {
      id v102 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10071D144();
      }
    }
    id v101 = +[IDSFoundationLog QRAllocator];
    if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "Disable ip discovery due to user defaults", buf, 2u);
    }
  }
  else
  {
    __int16 v100 = (const void *)kIDSQRAllocateKey_IPDiscoveryDisabled;
    id v101 = [v94 objectForKey:kIDSQRAllocateKey_IPDiscoveryDisabled];
    if (v101) {
      CFDictionarySetValue(Mutable, v100, v101);
    }
  }

  id v103 = (const void *)kIDSQRAllocateKey_UplinkNackDisabled;
  CFStringRef v104 = [v94 objectForKey:kIDSQRAllocateKey_UplinkNackDisabled];
  if (v104) {
    CFDictionarySetValue(Mutable, v103, v104);
  }

  unint64_t v105 = (const void *)kIDSQRAllocateKey_TransportLayerEncryptionDisabled;
  CFDictionaryRef v106 = [v94 objectForKey:kIDSQRAllocateKey_TransportLayerEncryptionDisabled];
  if (v106) {
    CFDictionarySetValue(Mutable, v105, v106);
  }

  id v107 = (const void *)kIDSQRAllocateKey_IPDiscoveryDisabled;
  id v108 = [v94 objectForKey:kIDSQRAllocateKey_IPDiscoveryDisabled];
  if (v108) {
    CFDictionarySetValue(Mutable, v107, v108);
  }

  id v109 = v94;
  if (v109) {
    CFDictionarySetValue(Mutable, kIDSQRAllocateKey_QRExperiments, v109);
  }

  id v110 = [(IDSQuickRelayAllocateMessage *)v6 relaySessionID];
  BOOL v111 = [v110 length] == (id)16;

  if (v111)
  {
    id v112 = objc_alloc((Class)NSUUID);
    id v113 = [(IDSQuickRelayAllocateMessage *)v6 relaySessionID];
    id v114 = objc_msgSend(v112, "initWithUUIDBytes:", objc_msgSend(v113, "bytes"));
LABEL_207:

    goto LABEL_215;
  }
  BOOL v115 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v116 = [(IDSQuickRelayAllocateMessage *)v6 relaySessionID];
    id v117 = [v116 length];
    *(_DWORD *)buf = 134218240;
    *(void *)&uint8_t buf[4] = v117;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = 16;
    _os_log_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_DEFAULT, "Warning: invalid response relaySessionID length = %lu != sizeof(uuid_t) = %lu", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      double v118 = [(IDSQuickRelayAllocateMessage *)v6 relaySessionID];
      id v161 = [v118 length];
      uint64_t v164 = 16;
      _IDSLogTransport();

      if (_IDSShouldLog())
      {
        id v113 = [(IDSQuickRelayAllocateMessage *)v6 relaySessionID];
        id v161 = [v113 length];
        uint64_t v164 = 16;
        _IDSLogV();
        id v114 = 0;
        goto LABEL_207;
      }
    }
  }
  id v114 = 0;
LABEL_215:
  objc_msgSend(v114, "UUIDString", v161, v164);
  id v119 = (id)objc_claimAutoreleasedReturnValue();
  if (v119)
  {
    CFDictionarySetValue(Mutable, kIDSQRAllocateKey_RelaySessionID, v119);
  }
  else
  {
    id v120 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10071D0BC();
    }
  }
  double v121 = [(IDSQuickRelayAllocateMessage *)v6 relaySessionKey];
  if (v121)
  {
    CFDictionarySetValue(Mutable, kIDSQRAllocateKey_RelaySessionKey, v121);
  }
  else
  {
    id v122 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10071D034();
    }
  }
  v123 = [(IDSQuickRelayAllocateMessage *)v6 appID];
  if (v123)
  {
    CFDictionarySetValue(Mutable, kIDSQRAllocateKey_AppID, v123);
  }
  else
  {
    id v124 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10071CFAC();
    }
  }
  id v125 = [(IDSQuickRelayAllocateMessage *)v6 relayExpiryTimeStamp];
  [v125 doubleValue];
  double v127 = v126;

  id v128 = [objc_alloc((Class)NSNumber) initWithDouble:v127];
  if (v128)
  {
    CFDictionarySetValue(Mutable, kIDSQRAllocateKey_RelayExpiryTimestamp, v128);
  }
  else
  {
    id v129 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10071CF24();
    }
  }
  uint64_t v130 = objc_opt_class();
  double v131 = (const void *)kIDSQRAllocateKey_AllocateType;
  v132 = sub_1002B4B18(v130, v4, kIDSQRAllocateKey_AllocateType);
  unsigned int v133 = v132;
  if (v132)
  {
    id v134 = v132;
    CFDictionarySetValue(Mutable, v131, v134);

    if ([v134 intValue] == 3)
    {
      uint64_t v135 = objc_opt_class();
      v136 = (const void *)kIDSQRAllocateKey_Allocations;
      uint64_t v137 = sub_1002B4B18(v135, v4, kIDSQRAllocateKey_Allocations);
      id v138 = v137;
      if (v137)
      {
        id v139 = v137;
        CFDictionarySetValue(Mutable, v136, v139);
      }
      else
      {
        id v146 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v146, OS_LOG_TYPE_DEFAULT, "missing allocation status result", buf, 2u);
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
    goto LABEL_261;
  }
  v140 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v140, OS_LOG_TYPE_DEFAULT, "missing allocateType in response", buf, 2u);
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
  id v141 = [(IDSQuickRelayAllocateMessage *)v6 allocateProtocolVersion];
  BOOL v142 = (int)[v141 intValue] > 1;

  if (!v142)
  {
    CFDictionarySetValue(Mutable, v131, &off_1009D1BC0);
LABEL_261:
    uint64_t v147 = kIDSQRAllocateKey_SessionAllocationTime;
    uint64_t v148 = [(__CFDictionary *)v4 objectForKey:kIDSQRAllocateKey_SessionAllocationTime];
    if (v148) {
      [(__CFDictionary *)Mutable setObject:v148 forKey:v147];
    }

    uint64_t v149 = kIDSQRAllocateKey_RecipientID;
    char v150 = [(__CFDictionary *)v4 objectForKey:kIDSQRAllocateKey_RecipientID];
    id v145 = v150;
    if (v150)
    {
      id v151 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v150 unsignedLongLongValue]);
      if (v151) {
        [(__CFDictionary *)Mutable setObject:v151 forKey:v149];
      }
    }
    uint64_t v152 = kIDSQRAllocateKey_GroupID;
    uint64_t v153 = [(__CFDictionary *)v4 objectForKey:kIDSQRAllocateKey_GroupID];
    if (v153) {
      [(__CFDictionary *)Mutable setObject:v153 forKey:v152];
    }

    uint64_t v154 = kIDSQRAllocateKey_GroupMemberCount;
    v155 = [(__CFDictionary *)v4 objectForKey:kIDSQRAllocateKey_GroupMemberCount];
    if (v155) {
      [(__CFDictionary *)Mutable setObject:v155 forKey:v154];
    }

    id v16 = Mutable;
    goto LABEL_272;
  }
  v143 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
  {
    id v144 = [(IDSQuickRelayAllocateMessage *)v6 allocateProtocolVersion];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v144;
    _os_log_impl((void *)&_mh_execute_header, v143, OS_LOG_TYPE_DEFAULT, "allocate type is required for allocate protocol version %@", buf, 0xCu);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      v162 = [(IDSQuickRelayAllocateMessage *)v6 allocateProtocolVersion];
      _IDSLogTransport();

      if (_IDSShouldLog())
      {
        id v145 = [(IDSQuickRelayAllocateMessage *)v6 allocateProtocolVersion];
        _IDSLogV();
        id v16 = 0;
LABEL_272:

        goto LABEL_273;
      }
    }
  }
  id v16 = 0;
LABEL_273:

LABEL_274:

  return v16;
}

- (void)_setSessionInfoRequiredKeys
{
  id v3 = +[IDSFoundationLog QRAllocator];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "_setSessionInfoRequiredKeys called", v7, 2u);
  }

  sessionInfoRequiredKeys = self->_sessionInfoRequiredKeys;
  if (!sessionInfoRequiredKeys)
  {
    id v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    unsigned __int8 v6 = self->_sessionInfoRequiredKeys;
    self->_sessionInfoRequiredKeys = v5;

    sessionInfoRequiredKeys = self->_sessionInfoRequiredKeys;
  }
  [(NSMutableArray *)sessionInfoRequiredKeys addObject:kIDSQRAllocateKey_RequestID];
  [(NSMutableArray *)self->_sessionInfoRequiredKeys addObject:kIDSQRAllocateKey_IDSSessionID];
  [(NSMutableArray *)self->_sessionInfoRequiredKeys addObject:kIDSQRAllocateKey_RelayPort];
  [(NSMutableArray *)self->_sessionInfoRequiredKeys addObject:kIDSQRAllocateKey_RelayAddress];
  [(NSMutableArray *)self->_sessionInfoRequiredKeys addObject:kIDSQRAllocateKey_RelaySessionToken];
  [(NSMutableArray *)self->_sessionInfoRequiredKeys addObject:kIDSQRAllocateKey_RelaySessionID];
  [(NSMutableArray *)self->_sessionInfoRequiredKeys addObject:kIDSQRAllocateKey_RelaySessionKey];
  [(NSMutableArray *)self->_sessionInfoRequiredKeys addObject:kIDSQRAllocateKey_isInitiator];
}

- (BOOL)_hasSessionInfoRequiredKeys:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([(NSMutableArray *)self->_sessionInfoRequiredKeys count])
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v5 = self->_sessionInfoRequiredKeys;
      id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v18;
        char v8 = 1;
        do
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v18 != v7) {
              objc_enumerationMutation(v5);
            }
            uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
            id v11 = objc_msgSend(v4, "objectForKey:", v10, v15, v16);
            BOOL v12 = v11 == 0;

            if (v12)
            {
              id v13 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v22 = v10;
                __int16 v23 = 2112;
                id v24 = v4;
                _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, " is missing required attributes %@ in sessionInfo %@", buf, 0x16u);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  uint64_t v15 = v10;
                  id v16 = v4;
                  _IDSLogTransport();
                  if (_IDSShouldLog())
                  {
                    uint64_t v15 = v10;
                    id v16 = v4;
                    _IDSLogV();
                  }
                }
              }
              char v8 = 0;
            }
          }
          id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
        }
        while (v6);
      }
      else
      {
        char v8 = 1;
      }
    }
    else
    {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8 & 1;
}

- (void)_triggerSymptomsWithType:(id)a3 subType:(id)a4 subTypeContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = +[IMLockdownManager sharedInstance];
  unsigned int v11 = [v10 isInternalInstall];

  if (v11)
  {
    id v12 = objc_alloc_init((Class)IMWeakLinkClass());
    id v13 = [v12 signatureWithDomain:@"IDSQuickRelay" type:v7 subType:v8 subtypeContext:v9 detectedProcess:@"identityservicesd" triggerThresholdValues:0];
    id v14 = im_primary_queue();
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1002C34FC;
    v17[3] = &unk_100987EB0;
    id v18 = v12;
    id v19 = v13;
    id v20 = 0;
    uint64_t v21 = 0x402E000000000000;
    id v15 = v13;
    id v16 = v12;
    dispatch_async(v14, v17);
  }
}

- (unsigned)_getErrorCodeFromAllocationStatus:(int)a3
{
  if (a3 <= 5000)
  {
    if (a3 == 1000)
    {
      return 32;
    }
    else if (a3 == 1001)
    {
      return 33;
    }
    else
    {
      return 38;
    }
  }
  else
  {
    switch(a3)
    {
      case 5001:
        return 34;
      case 5002:
      case 5003:
      case 5005:
      case 5006:
      case 5007:
      case 5009:
        return 38;
      case 5004:
        return 35;
      case 5008:
        return 36;
      case 5010:
        return 45;
      default:
        if (a3 == 5032)
        {
          unsigned int result = 37;
        }
        else
        {
          if (a3 != 7000) {
            return 38;
          }
          unsigned int result = 42;
        }
        break;
    }
  }
  return result;
}

- (void)_processAllocationStatusResult:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSFoundationLog QRAllocator];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_processAllocationStatusResult: called", buf, 2u);
  }

  uint64_t v6 = objc_opt_class();
  id v7 = sub_1002B4B18(v6, v4, @"s");
  signed int v8 = [v7 intValue];

  if (!v8) {
    goto LABEL_55;
  }
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = sub_1002B4B18(v9, v4, @"p");
  uint64_t v11 = v8;
  if (v10)
  {
    id v12 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v10 objectForKey:kIDSQRAllocateKey_RecipientPushToken];
      *(_DWORD *)buf = 138412546;
      id v47 = v13;
      __int16 v48 = 2048;
      *(void *)id v49 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Failed to allocate QR for recipient with token %@ with error %lu", buf, 0x16u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        uint64_t v14 = kIDSQRAllocateKey_RecipientPushToken;
        int v39 = [v10 objectForKey:kIDSQRAllocateKey_RecipientPushToken];
        uint64_t v41 = v11;
        _IDSLogTransport();

        if (_IDSShouldLog())
        {
          int v39 = objc_msgSend(v10, "objectForKey:", v14, v39, v11);
          uint64_t v41 = v11;
          _IDSLogV();
        }
      }
    }
  }
  id v15 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v47 = v4;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Allocation error response: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      int v39 = v4;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        int v39 = v4;
        _IDSLogV();
      }
    }
  }
  uint64_t v16 = -[IDSQuickRelayAllocator _getErrorCodeFromAllocationStatus:](self, "_getErrorCodeFromAllocationStatus:", v11, v39, v41);
  uint64_t v17 = kIDSQRAllocateKey_RequestID;
  id v18 = [v4 objectForKey:kIDSQRAllocateKey_RequestID];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v19 = [v4 objectForKey:v17];
    id v20 = +[NSData _IDSDataFromBase64String:v19];
    uint64_t v21 = sub_1002AE7E0(v20);
  }
  else
  {
    id v19 = [v4 objectForKey:v17];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v22 = [v4 objectForKey:v17];
      uint64_t v21 = sub_1002AE7E0(v22);
    }
    else
    {
      uint64_t v21 = sub_1002AE7E0(0);
    }
  }

  if (!v21)
  {
    BOOL v30 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "No request id", buf, 2u);
    }

    if (!os_log_shim_legacy_logging_enabled()) {
      goto LABEL_54;
    }
    if (!_IDSShouldLogTransport()) {
      goto LABEL_54;
    }
    _IDSLogTransport();
    if (!_IDSShouldLog()) {
      goto LABEL_54;
    }
    goto LABEL_38;
  }
  requestIDToSession = self->_requestIDToSession;
  if (requestIDToSession)
  {
    id v24 = (id)CFDictionaryGetValue((CFDictionaryRef)requestIDToSession, v21);
    if (v24)
    {
      id v25 = v24;
      if (v11 == 5001)
      {
        id v26 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          id v47 = v25;
          __int16 v48 = 1024;
          *(_DWORD *)id v49 = 5001;
          *(_WORD *)&v49[4] = 1024;
          *(_DWORD *)&v49[6] = v16;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Allocation failure for session %@, status = %d, code = %d, attempting to retry!", buf, 0x18u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            uint64_t v42 = 5001;
            uint64_t v43 = v16;
            int v40 = v25;
            _IDSLogTransport();
            if (_IDSShouldLog())
            {
              uint64_t v42 = 5001;
              uint64_t v43 = v16;
              int v40 = v25;
              _IDSLogV();
            }
          }
        }
        uint64_t v27 = -[IDSQuickRelayAllocator _findAllocationForSessionID:requestIDStr:](self, "_findAllocationForSessionID:requestIDStr:", v25, v21, v40, v42, v43);
        id v28 = [v27 request];

        [(IDSQuickRelayAllocator *)self _sendAllocateRequest:v28];
        goto LABEL_60;
      }
      CFDictionaryRef v31 = [(IDSQuickRelayAllocator *)self _findSessionWithID:v24];
      double v32 = v31;
      if (v31)
      {
        [v31 processAllocationErrorStatus:v11 errorCode:v16];
      }
      else
      {
        double v33 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v47 = v25;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "No ids session for ids session id %@", buf, 0xCu);
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

      goto LABEL_54;
    }
  }
  id v29 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v47 = v21;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "No ids session id for request id %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
LABEL_38:
      }
        _IDSLogV();
    }
  }
LABEL_54:

LABEL_55:
  uint64_t v34 = objc_opt_class();
  uint64_t v10 = sub_1002B4B18(v34, v4, kIDSQRAllocateKey_QRFailureSubType);
  uint64_t v35 = objc_opt_class();
  uint64_t v21 = sub_1002B4B18(v35, v4, kIDSQRAllocateKey_QRFailureContext);
  uint64_t v36 = objc_opt_class();
  id v25 = sub_1002B4B18(v36, v4, kIDSQRAllocateKey_AllocateType);
  v44[0] = &off_1009D1BC0;
  v44[1] = &off_1009D1C38;
  v45[0] = @"IDSQuickRelayTwoWay";
  v45[1] = @"IDSQuickRelaySelf";
  v44[2] = &off_1009D1C50;
  v44[3] = &off_1009D1BA8;
  v45[2] = @"IDSQuickRelayShared";
  void v45[3] = @"IDSQuickRelayKeepAlive";
  v44[4] = &off_1009D1C68;
  v45[4] = @"IDSQuickRelayMax";
  id v28 = +[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:5];
  uint64_t v37 = [v28 objectForKey:v25];
  id v38 = (void *)v37;
  if (v10 && v21 && v37) {
    [(IDSQuickRelayAllocator *)self _triggerSymptomsWithType:v37 subType:v10 subTypeContext:v21];
  }

LABEL_60:
}

- (void)_sendAWDMetricsForAllocation:(id)a3 status:(int64_t)a4 hasRecipientAccepted:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  uint64_t v9 = +[IDSFoundationLog QRAllocator];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "_sendAWDMetricsForAllocation:status:hasRecipientAccepted: called", buf, 2u);
  }

  uint64_t v10 = [v8 responses];
  id v11 = [v10 count];

  if (v11)
  {
    id v12 = [v8 request];
    if (v12)
    {
      id v13 = [v8 request];
      uint64_t v14 = [v13 appID];
    }
    else
    {
      uint64_t v14 = &stru_10099BE78;
    }

    uint64_t v16 = [v8 request];
    if (v16)
    {
      uint64_t v17 = [v8 request];
      id v18 = [v17 requestLength];
    }
    else
    {
      id v18 = 0;
    }

    id v19 = objc_alloc((Class)IDSQRAllocationMetric);
    [v8 duration];
    id v21 = [v19 initWithDuration:(unint64_t)v20 result:a4 hasRecipientAccepted:v5 payloadSize:v18 topic:v14 service:v14];
    uint64_t v22 = +[IDSCoreAnalyticsLogger defaultLogger];
    [v22 logMetric:v21];

    __int16 v23 = [(IDSQuickRelayAllocator *)self _getIDSAWDLoggingInstance];
    [v8 duration];
    [v23 IDSQRAllocation:(unint64_t)v24 result:a4 hasRecipientAccepted:v5 payloadSize:v18 topic:v14 service:v14];

    id v25 = +[IDSDSessionController sharedInstance];
    id v26 = [v8 sessionIDStr];
    uint64_t v27 = [v25 sessionWithUniqueID:v26];

    if (v27)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      id v29 = [v8 request];
      BOOL v30 = [v29 allocateProtocolVersion];
      [(__CFDictionary *)Mutable setObject:v30 forKeyedSubscript:IDSDSessionReportQRVersionKey];

      [(__CFDictionary *)Mutable setObject:&off_1009D1C80 forKeyedSubscript:IDSDSessionReportQREventSubTypeKey];
      [v8 duration];
      CFDictionaryRef v31 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [(__CFDictionary *)Mutable setObject:v31 forKeyedSubscript:IDSDSessionReportDurationKey];

      double v32 = +[NSNumber numberWithInteger:a4];
      [(__CFDictionary *)Mutable setObject:v32 forKeyedSubscript:IDSDSessionReportResultCodeKey];

      [v27 addQREventForRTCReport:Mutable];
    }
    else
    {
      double v33 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v34 = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Invalid session. Skip AWD report", v34, 2u);
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
    id v15 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v35 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "missing response. Skip AWD report", v35, 2u);
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

- (id)_getStatusMessageFromStatusCode:(unint64_t)a3
{
  if ((uint64_t)a3 > 5040)
  {
    if (a3 == 5041)
    {
      return @"BadSessionToken";
    }
    else if (a3 == 5042)
    {
      return @"ExpiredSessionToken";
    }
    else
    {
      return @"Unknown status";
    }
  }
  else
  {
    switch(a3)
    {
      case 0x1389uLL:
        id result = @"ServerInternalError";
        break;
      case 0x138AuLL:
      case 0x138DuLL:
      case 0x138EuLL:
      case 0x138FuLL:
        return @"Unknown status";
      case 0x138BuLL:
        id result = @"BadRequest";
        break;
      case 0x138CuLL:
        id result = @"ServerBusy";
        break;
      case 0x1390uLL:
        id result = @"MissingRequiredKey";
        break;
      default:
        if (a3) {
          return @"Unknown status";
        }
        id result = @"Success";
        break;
    }
  }
  return result;
}

- (void)_startQRConnectionForSession:(id)a3 isInitiatorsAcceptedSession:(BOOL)a4 withLocalInterfacePreference:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  BOOL v6 = a4;
  CFDictionaryRef v8 = (const __CFDictionary *)a3;
  uint64_t v9 = +[IDSFoundationLog QRAllocator];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v10 = @"NO";
    if (v6) {
      CFStringRef v10 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    CFStringRef v58 = v10;
    __int16 v59 = 2112;
    CFDictionaryRef v60 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "_startQRConnectionForSession:isInitiatorsAcceptedSession: called {isInitiator: %@} sessionInfo %@", buf, 0x16u);
  }

  if ([(IDSQuickRelayAllocator *)self _hasSessionInfoRequiredKeys:v8])
  {
    Value = 0;
    CFStringRef v12 = (const __CFString *)kIDSQRAllocateKey_RequestID;
    if (v8 && kIDSQRAllocateKey_RequestID) {
      Value = (void *)CFDictionaryGetValue(v8, kIDSQRAllocateKey_RequestID);
    }
    key = Value;
    uint64_t v13 = [(__CFDictionary *)v8 objectForKey:kIDSQRAllocateKey_IDSSessionID];
    uint64_t v14 = (__CFString *)v13;
    if (key)
    {
      if (v13
        || (id v19 = self->_requestIDToSession) != 0
        && (uint64_t v14 = (id)CFDictionaryGetValue((CFDictionaryRef)v19, key)) != 0)
      {
        if (([(__CFString *)v14 isEqualToString:kIDSDefaultPairedDeviceID] & 1) != 0
          || ([(__CFDictionary *)v8 objectForKey:kIDSQRAllocateKey_AppID],
              id v15 = objc_claimAutoreleasedReturnValue(),
              unsigned __int8 v16 = [v15 isEqualToString:IDSRegistrationServiceTypeCloudMessaging],
              v15,
              (v16 & 1) != 0))
        {
          BOOL v55 = 0;
          int v17 = 1;
        }
        else
        {
          BOOL v55 = [(IDSQuickRelayAllocator *)self _findSessionWithID:v14];
          int v17 = 0;
        }
        uint64_t v21 = [(IDSQuickRelayAllocator *)self _findAllocationForSessionID:v14 requestIDStr:key];
        uint64_t v22 = (void *)v21;
        if (v55)
        {
          if (!v21) {
            [(IDSQuickRelayAllocator *)self _sendAWDMetricsForAllocation:0 status:0 hasRecipientAccepted:1];
          }
          id v54 = [(__CFDictionary *)v8 objectForKey:kIDSQRAllocateKey_GroupID];
          id v53 = [(__CFDictionary *)v8 objectForKey:kIDSQRAllocateKey_AllocateType];
          __int16 v23 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            double v24 = [v55 uniqueID];
            id v25 = [v22 connectReadyHandler];
            id v26 = objc_retainBlock(v25);
            unsigned int v27 = [v55 shouldConnectToQRServer];
            CFStringRef v28 = @"NO";
            *(_DWORD *)buf = 138413058;
            CFStringRef v58 = v24;
            __int16 v59 = 2048;
            if (v27) {
              CFStringRef v28 = @"YES";
            }
            CFDictionaryRef v60 = (const __CFDictionary *)v22;
            __int16 v61 = 2048;
            id v62 = v26;
            __int16 v63 = 2112;
            CFStringRef v64 = v28;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "passed sessionInfo to IDSSession ID %@ to connect, allocation: %p, %p, session should connectToQRServer: %@", buf, 0x2Au);
          }
          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
          {
            id v29 = [v55 uniqueID];
            BOOL v30 = [v22 connectReadyHandler];
            CFDictionaryRef v31 = [v55 shouldConnectToQRServer] ? @"YES" : @"NO";
            uint64_t v51 = v30;
            id v52 = v31;
            __int16 v48 = v29;
            id v50 = v22;
            _IDSLogTransport();

            if (_IDSShouldLog())
            {
              objc_msgSend(v55, "uniqueID", v29, v22, v30, v52);
              double v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
              double v33 = [v22 connectReadyHandler];
              if ([v55 shouldConnectToQRServer]) {
                CFStringRef v34 = @"YES";
              }
              else {
                CFStringRef v34 = @"NO";
              }
              uint64_t v51 = v33;
              id v52 = (__CFString *)v34;
              __int16 v48 = v32;
              id v50 = v22;
              _IDSLogV();
            }
          }
          if (!v22) {
            goto LABEL_50;
          }
          uint64_t v35 = [v22 connectReadyHandler];
          BOOL v36 = v35 == 0;

          if (v36
            || ([v22 connectReadyHandler],
                uint64_t v37 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(),
                ((void (**)(void, void, const __CFDictionary *))v37)[2](v37, 0, v8),
                v37,
                [v22 setConnectReadyHandler:0],
                [(NSMutableSet *)self->_pendingRecipientsAcceptedSessions containsObject:v14]))
          {
LABEL_50:
            objc_msgSend(v55, "setShouldConnectToQRServer:", 0, v48, v50, v51, v52);
            [v55 connectQRServer:v8 withPreferredLocalInterface:v5];
          }
          if (v54 && v53 && [v53 intValue] == 3)
          {
            uint64_t v38 = [(NSMutableDictionary *)self->_allocateResponses objectForKey:v54];
            int v39 = (void *)v38;
            if (v38)
            {
              *(void *)(v38 + 16) = -1;
            }
            else
            {
              uint64_t v45 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                CFStringRef v58 = v54;
                _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "failed to find response for groupID %@", buf, 0xCu);
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
          if (v6)
          {
            BOOL v46 = [(__CFDictionary *)v8 objectForKey:kIDSQRAllocateKey_RelaySessionID];
            [v55 setAcceptedRelaySession:v46];
          }
          requestIDToSession = self->_requestIDToSession;
          if (requestIDToSession) {
            CFDictionaryRemoveValue((CFMutableDictionaryRef)requestIDToSession, key);
          }
        }
        else
        {
          int v40 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            CFStringRef v58 = v14;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "cannot find existing IDSSession %@ to start a connection", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              __int16 v48 = v14;
              _IDSLogTransport();
              if (_IDSShouldLog())
              {
                __int16 v48 = v14;
                _IDSLogV();
              }
            }
          }
          objc_msgSend(v22, "setConnectReadyHandler:", 0, v48);
          if (v17)
          {
            uint64_t v41 = [(__CFDictionary *)v8 objectForKey:kIDSQRAllocateKey_RemoteDeviceIDKey];
            if (!v41) {
              uint64_t v41 = v14;
            }
            uint64_t v42 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              CFStringRef v58 = v41;
              _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "bring up GlobalLink link for cloud messaging to %@", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                id v49 = v41;
                _IDSLogTransport();
                if (_IDSShouldLog())
                {
                  id v49 = v41;
                  _IDSLogV();
                }
              }
            }
            uint64_t v43 = +[IDSUTunController sharedInstance];
            [v43 connectGlobalLinkForDevice:v41 sessionInfo:v8 connectReadyHandler:0 withLocalInterfacePreference:0];

            char v44 = self->_requestIDToSession;
            if (v44) {
              CFDictionaryRemoveValue((CFMutableDictionaryRef)v44, key);
            }
          }
          [(IDSQuickRelayAllocator *)self _sendAWDMetricsForAllocation:v22 status:0 hasRecipientAccepted:0];
        }
      }
      else
      {
        double v20 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v58 = key;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "No IDSSessionID found for this requestID %@, bailing...", buf, 0xCu);
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
        uint64_t v14 = 0;
      }
    }
    else
    {
      id v18 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v58 = v12;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, " is missing %@, bailling...", buf, 0xCu);
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
}

- (id)_findSessionWithID:(id)a3
{
  id v3 = a3;
  id v4 = +[IDSDSessionController sharedInstance];
  uint64_t v5 = [v4 sessionWithUniqueID:v3];

  return v5;
}

- (void)_storeMappingFromPushTokenToURIs:(id)a3 fromID:(id)a4 service:(id)a5 cert:(id)a6 forGroup:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  int v17 = +[IDSFoundationLog QRAllocator];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v51 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "_storeMappingFromPushTokenToURIs:fromURI:service:cert:forGroup: called {groupID: %@}", buf, 0xCu);
  }

  double v32 = v16;
  id v18 = [(NSMutableDictionary *)self->_pushTokenToURIForGroup objectForKeyedSubscript:v16];
  id v19 = [(IDSQuickRelayAllocator *)self _peerIDManager];
  uint64_t v35 = v13;
  double v20 = +[IDSURI URIWithPrefixedURI:v13 withServiceLoggingHint:v14];
  BOOL v36 = v12;
  double v33 = v15;
  CFStringRef v34 = v14;
  uint64_t v21 = [v19 sessionTokensForURIs:v12 fromURI:v20 service:v14 fromIdentity:v15 includeSelfDevice:1 fullyRemoveSelfDevice:0];

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v21;
  id v38 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v38)
  {
    uint64_t v37 = *(void *)v45;
    do
    {
      for (i = 0; i != v38; i = (char *)i + 1)
      {
        if (*(void *)v45 != v37) {
          objc_enumerationMutation(obj);
        }
        __int16 v23 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        double v24 = [obj objectForKey:v23];
        id v25 = [v24 objectForKey:@"push-tokens"];
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v26 = [v25 countByEnumeratingWithState:&v40 objects:v48 count:16];
        if (v26)
        {
          id v27 = v26;
          uint64_t v28 = *(void *)v41;
          do
          {
            for (j = 0; j != v27; j = (char *)j + 1)
            {
              if (*(void *)v41 != v28) {
                objc_enumerationMutation(v25);
              }
              uint64_t v30 = *(void *)(*((void *)&v40 + 1) + 8 * (void)j);
              CFDictionaryRef v31 = [v23 prefixedURI];
              [v18 setObject:v31 forKeyedSubscript:v30];
            }
            id v27 = [v25 countByEnumeratingWithState:&v40 objects:v48 count:16];
          }
          while (v27);
        }
      }
      id v38 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v38);
  }
}

- (id)_uriToParticipantID:(id)a3
{
  id v26 = (NSMutableDictionary *)a3;
  id v3 = +[IDSFoundationLog QRAllocator];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v38 = v26;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "_uriToParticipantID: called sessionInfo %@", buf, 0xCu);
  }

  id v25 = [(NSMutableDictionary *)v26 objectForKeyedSubscript:kIDSQRAllocateKey_GroupID];
  id v4 = [(NSMutableDictionary *)v26 objectForKeyedSubscript:kIDSQRAllocateKey_Allocations];
  id v29 = [(NSMutableDictionary *)self->_pushTokenToURIForGroup objectForKeyedSubscript:v25];
  uint64_t v5 = +[NSMutableDictionary dictionary];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v6)
  {
    uint64_t v28 = *(void *)v33;
    uint64_t v7 = kIDSQRAllocateKey_RecipientPushToken;
    uint64_t v8 = kIDSQRAllocateKey_RecipientID;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v33 != v28) {
          objc_enumerationMutation(obj);
        }
        CFStringRef v10 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v11 = [v10 objectForKeyedSubscript:v7];
        id v12 = [v10 objectForKeyedSubscript:v8];
        id v13 = [v29 objectForKeyedSubscript:v11];
        if (!v13)
        {
          uint64_t v21 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            pushTokenToURIForGroup = self->_pushTokenToURIForGroup;
            *(_DWORD *)buf = 138412290;
            id v38 = pushTokenToURIForGroup;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "there is no URI list yet. stopped converting URI to Participant ID - %@", buf, 0xCu);
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

          id v19 = 0;
          double v20 = obj;
          goto LABEL_21;
        }
        id v14 = [v5 objectForKeyedSubscript:v13];
        BOOL v15 = v14 == 0;

        if (v15)
        {
          id v16 = objc_alloc_init((Class)NSMutableSet);
          [v5 setObject:v16 forKeyedSubscript:v13];
        }
        int v17 = [v5 objectForKeyedSubscript:v13];
        id v18 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v12 unsignedLongLongValue]);
        [v17 addObject:v18];
      }
      id v6 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  +[NSMutableDictionary dictionary];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1002C5A90;
  v30[3] = &unk_100987ED8;
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  id v31 = v19;
  [v5 enumerateKeysAndObjectsUsingBlock:v30];
  double v20 = v31;
LABEL_21:

  return v19;
}

- (id)getRelaySessionIDForIDSSessionID:(id)a3 pushToken:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  uint64_t v7 = +[IDSFoundationLog QRAllocator];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v29 = v22;
    __int16 v30 = 2112;
    id v31 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "getRelaySessionIDForIDSSessionID:pushToken: called {sessionID: %@, pushToken: %@}", buf, 0x16u);
  }

  im_assert_primary_base_queue();
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v9 = [(IDSQuickRelayAllocator *)self _findAllocationListForSessionID:v22];
  if ([v9 count])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = v9;
    id v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v24;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v10);
          }
          id v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          BOOL v15 = [v14 pushTokenToQRSessionID];
          id v16 = v15;
          if (v15) {
            BOOL v17 = v6 != 0;
          }
          else {
            BOOL v17 = 0;
          }
          if (v17)
          {
            CFDictionaryRef v18 = [v14 pushTokenToQRSessionID];
            id v19 = (id)CFDictionaryGetValue(v18, v6);

            if (v19)
            {
              os_unfair_lock_unlock(p_lock);

              goto LABEL_27;
            }
          }
          else
          {
          }
        }
        id v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v11);
    }

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    id v19 = [(NSMutableDictionary *)self->_idsSessionIDToqrSessionID objectForKey:v22];
    if (v19) {
      goto LABEL_27;
    }
  }
  double v20 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v29 = v22;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "failed to find allocation for session %@", buf, 0xCu);
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
  id v19 = 0;
LABEL_27:

  return v19;
}

- (id)getPushTokenForRelaySessionID:(id)a3 relaySessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[IDSFoundationLog QRAllocator];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v26 = v6;
    __int16 v27 = 2112;
    id v28 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "getPushTokenForRelaySessionID:relaySessionID called {sessionID: %@, relaySessionID: %@}", buf, 0x16u);
  }

  uint64_t v9 = [(IDSQuickRelayAllocator *)self _filterSelfAllocationsForSessionID:v6];
  if ([v9 count])
  {
    p_os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = v9;
    id v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v21;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v11);
          }
          BOOL v15 = [*(id *)(*((void *)&v20 + 1) + 8 * i) pushTokenToQRSessionID];
          id v16 = [v15 allKeysForObject:v7];

          if ([v16 count])
          {
            os_unfair_lock_unlock(p_lock);
            BOOL v17 = [v16 firstObject];

            goto LABEL_21;
          }
        }
        id v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    CFDictionaryRef v18 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v6;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "failed to find allocation for session %@", buf, 0xCu);
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
  BOOL v17 = 0;
LABEL_21:

  return v17;
}

- (void)requestAllocationForRecipient:(id)a3
{
  id v4 = a3;
  im_assert_primary_base_queue();
  id value = v4;
  uint64_t v5 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v54 = (__CFDictionary *)v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "IDSSession ID %@ requested for a QR allocation", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      uint64_t v37 = (__CFDictionary *)v4;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        uint64_t v37 = (__CFDictionary *)v4;
        _IDSLogV();
      }
    }
  }
  if (v4)
  {
    CFDictionaryRef theDict = [(IDSQuickRelayAllocator *)self _parseQuickRelayDefaults:v4 gropuID:0];
    if (theDict)
    {
      id v6 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v54 = theDict;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "use QR session info from user defaults: %@.", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          uint64_t v37 = theDict;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            uint64_t v37 = theDict;
            _IDSLogV();
          }
        }
      }
      id v7 = +[NSUUID UUID];
      uint64_t v8 = [v7 UUIDString];

      if (v8)
      {
        CFDictionarySetValue(theDict, kIDSQRAllocateKey_RequestID, v8);
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_10071D828();
      }

      CFDictionarySetValue(theDict, kIDSQRAllocateKey_IDSSessionID, value);
      CFDictionarySetValue(theDict, kIDSQRAllocateKey_isInitiator, &__kCFBooleanFalse);
      if ([value isEqualToString:kIDSDefaultPairedDeviceID]) {
        CFDictionarySetValue(theDict, IDSGlobalLinkOptionForceRelayKey, &__kCFBooleanTrue);
      }
      [(IDSQuickRelayAllocator *)self _startQRConnectionForSession:theDict isInitiatorsAcceptedSession:0 withLocalInterfacePreference:0];
    }
    else
    {
      os_unfair_lock_lock(&self->_lock);
      id v10 = [(IDSQuickRelayAllocator *)self _findAllocationListForSessionID:v4];
      id v11 = (__CFArray *)objc_alloc_init((Class)NSMutableArray);
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v12 = v10;
      id v13 = [v12 countByEnumeratingWithState:&v49 objects:v59 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v50;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v50 != v14) {
              objc_enumerationMutation(v12);
            }
            id v16 = *(void **)(*((void *)&v49 + 1) + 8 * i);
            long long v45 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            BOOL v17 = objc_msgSend(v16, "responses", v37);
            id v18 = [v17 countByEnumeratingWithState:&v45 objects:v58 count:16];
            if (v18)
            {
              uint64_t v19 = *(void *)v46;
              do
              {
                for (j = 0; j != v18; j = (char *)j + 1)
                {
                  if (*(void *)v46 != v19) {
                    objc_enumerationMutation(v17);
                  }
                  if (v11)
                  {
                    long long v21 = *(const void **)(*((void *)&v45 + 1) + 8 * (void)j);
                    if (v21) {
                      CFArrayAppendValue(v11, v21);
                    }
                  }
                }
                id v18 = [v17 countByEnumeratingWithState:&v45 objects:v58 count:16];
              }
              while (v18);
            }
          }
          id v13 = [v12 countByEnumeratingWithState:&v49 objects:v59 count:16];
        }
        while (v13);
      }

      os_unfair_lock_unlock(&self->_lock);
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v22 = v11;
      id v23 = [(__CFArray *)v22 countByEnumeratingWithState:&v41 objects:v57 count:16];
      if (v23)
      {
        uint64_t v24 = *(void *)v42;
        long long v25 = (const void *)kIDSQRAllocateKey_RelaySessionID;
        do
        {
          for (k = 0; k != v23; k = (char *)k + 1)
          {
            if (*(void *)v42 != v24) {
              objc_enumerationMutation(v22);
            }
            uint64_t v27 = *(void *)(*((void *)&v41 + 1) + 8 * (void)k);
            if (v27) {
              BOOL v28 = v25 == 0;
            }
            else {
              BOOL v28 = 1;
            }
            if (v28)
            {
              id v29 = 0;
            }
            else
            {
              __int16 v30 = (id)CFDictionaryGetValue(*(CFDictionaryRef *)(*((void *)&v41 + 1) + 8 * (void)k), v25);
              id v29 = v30;
              if (v30)
              {
                id v31 = OSLogHandleForTransportCategory();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  id v54 = (__CFDictionary *)value;
                  __int16 v55 = 2112;
                  unsigned __int8 v56 = v29;
                  _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "found a pending QR allocation for IDSSession %@ with QR session ID %@", buf, 0x16u);
                }

                if (os_log_shim_legacy_logging_enabled())
                {
                  if (_IDSShouldLogTransport())
                  {
                    uint64_t v37 = (__CFDictionary *)value;
                    id v38 = v29;
                    _IDSLogTransport();
                    if (_IDSShouldLog())
                    {
                      uint64_t v37 = (__CFDictionary *)value;
                      id v38 = v29;
                      _IDSLogV();
                    }
                  }
                }
              }
            }
            -[IDSQuickRelayAllocator _startQRConnectionForSession:isInitiatorsAcceptedSession:withLocalInterfacePreference:](self, "_startQRConnectionForSession:isInitiatorsAcceptedSession:withLocalInterfacePreference:", v27, 0, 0, v37, v38);
          }
          id v23 = [(__CFArray *)v22 countByEnumeratingWithState:&v41 objects:v57 count:16];
        }
        while (v23);
      }
      else
      {

        long long v32 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v54 = (__CFDictionary *)value;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "there's no pending QR allocation for IDSSession %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            uint64_t v37 = (__CFDictionary *)value;
            _IDSLogTransport();
            if (_IDSShouldLog())
            {
              uint64_t v37 = (__CFDictionary *)value;
              _IDSLogV();
            }
          }
        }
      }
      pendingRecipientsAcceptedSessions = self->_pendingRecipientsAcceptedSessions;
      if (!pendingRecipientsAcceptedSessions)
      {
        long long v34 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
        BOOL v36 = self->_pendingRecipientsAcceptedSessions;
        p_pendingRecipientsAcceptedSessions = &self->_pendingRecipientsAcceptedSessions;
        *p_pendingRecipientsAcceptedSessions = v34;

        pendingRecipientsAcceptedSessions = *p_pendingRecipientsAcceptedSessions;
      }
      -[NSMutableSet addObject:](pendingRecipientsAcceptedSessions, "addObject:", value, v37);
    }
  }
  else
  {
    uint64_t v9 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "missing sessionID in requestAllocationForRecipient", buf, 2u);
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

- (void)setInitiatorsAcceptedToken:(id)a3 pushToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[IDSFoundationLog QRAllocator];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "setInitiatorsAcceptedToken:pushToken: called {pushToken: %@}", buf, 0xCu);
  }

  im_assert_primary_base_queue();
  if (v6 && v7)
  {
    uint64_t v9 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v13 = v6;
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "add accepted session %@ with token %@", buf, 0x16u);
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
    if (!self->_initiatorsAcceptedSessionsWithToken)
    {
      CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      initiatorsAcceptedSessionsWithToken = self->_initiatorsAcceptedSessionsWithToken;
      self->_initiatorsAcceptedSessionsWithToken = Mutable;
    }
    CFDictionarySetValue((CFMutableDictionaryRef)self->_initiatorsAcceptedSessionsWithToken, v6, v7);
  }
}

- (int64_t)getServerProviderForIDSSessionID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[IDSFoundationLog QRAllocator];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "getServerProviderForIDSSessionID: called {sessionID: %@}", (uint8_t *)&v14, 0xCu);
  }

  im_assert_primary_base_queue();
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v7 = [(IDSQuickRelayAllocator *)self _findAllocationListForSessionID:v4];
  uint64_t v8 = [v7 firstObject];
  uint64_t v9 = [v8 responses];
  CFDictionaryRef v10 = [v9 anyObject];

  os_unfair_lock_unlock(p_lock);
  Value = 0;
  if (v10 && kIDSQRAllocateKey_Provider) {
    Value = (void *)CFDictionaryGetValue(v10, kIDSQRAllocateKey_Provider);
  }
  unsigned int v12 = [Value unsignedIntValue];

  return v12;
}

- (void)reportAWDAllocatorEvent:(unsigned int)a3 relayProviderType:(int64_t)a4 transport:(int64_t)a5 localRAT:(unsigned int)a6 duration:(unint64_t)a7 idsSessionID:(id)a8 reportingDataBlob:(id)a9 isInitiator:(BOOL)a10
{
  uint64_t v52 = *(void *)&a3;
  id v48 = a8;
  id v47 = a9;
  id v11 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = _IDSStunTransportStrings[a5];
    uint64_t v13 = IDSRadioAccessTechnologyToString();
    CFStringRef v14 = @"NO";
    *(_DWORD *)buf = 67110402;
    int v54 = v52;
    if (a10) {
      CFStringRef v14 = @"YES";
    }
    __int16 v55 = 2080;
    uint64_t v56 = v12;
    __int16 v57 = 2080;
    uint64_t v58 = v13;
    __int16 v59 = 1024;
    int v60 = a7;
    __int16 v61 = 2112;
    id v62 = v48;
    __int16 v63 = 2112;
    CFStringRef v64 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "report AWD allocator event %u, transport [%s], RAT [%s], duration %u ms, idsSessionID %@, isInitiator:%@", buf, 0x36u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      IDSRadioAccessTechnologyToString();
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        IDSRadioAccessTechnologyToString();
        _IDSLogV();
      }
    }
  }
  id v15 = objc_alloc((Class)IDSQuickRelayMetric);
  id v16 = +[NSNumber numberWithUnsignedInt:v52];
  BOOL v17 = +[NSNumber numberWithUnsignedLongLong:a7];
  id v18 = +[NSNumber numberWithInteger:a4];
  uint64_t v19 = +[NSNumber numberWithInteger:a5];
  long long v20 = +[NSNumber numberWithUnsignedInt:a6];
  long long v21 = +[NSNumber numberWithBool:a10];
  long long v22 = _IDSAllocateProtocolVersionNumber();
  id v23 = [v15 initWithType:&off_1009D1B30 eventSubType:v16 duration:v17 resultCode:0 providerType:v18 transportType:v19 interfaceType:v20 skeEnabled:0 isInitiator:v21 protocolVersion:v22 retryCount:0 serviceName:0 subServiceName:0 participantCount:0];

  uint64_t v24 = +[IDSCoreAnalyticsLogger defaultLogger];
  [v24 logMetric:v23];

  long long v25 = [(IDSQuickRelayAllocator *)self _getIDSAWDLoggingInstance];
  id v26 = +[NSNumber numberWithUnsignedInt:v52];
  uint64_t v27 = +[NSNumber numberWithUnsignedLongLong:a7];
  BOOL v28 = +[NSNumber numberWithInteger:a4];
  id v29 = +[NSNumber numberWithInteger:a5];
  __int16 v30 = +[NSNumber numberWithUnsignedInt:a6];
  id v31 = +[NSNumber numberWithBool:a10];
  long long v32 = _IDSAllocateProtocolVersionNumber();
  [v25 IDSQuickRelayEventType:&off_1009D1B30 eventSubType:v26 duration:v27 resultCode:0 providerType:v28 transportType:v29 interfaceType:v30 skeEnabled:0 isInitiator:v31 protocolVersion:v32 retryCount:0 serviceName:0 subServiceName:0 participantCount:0];

  long long v33 = +[IDSDSessionController sharedInstance];
  long long v34 = [v33 sessionWithUniqueID:v48];

  if (v34)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    BOOL v36 = _IDSAllocateProtocolVersionNumber();
    [(__CFDictionary *)Mutable setObject:v36 forKeyedSubscript:IDSDSessionReportQRVersionKey];

    uint64_t v37 = +[NSNumber numberWithUnsignedInt:v52];
    [(__CFDictionary *)Mutable setObject:v37 forKeyedSubscript:IDSDSessionReportQREventSubTypeKey];

    id v38 = +[NSNumber numberWithUnsignedLongLong:a7];
    [(__CFDictionary *)Mutable setObject:v38 forKeyedSubscript:IDSDSessionReportDurationKey];

    [(__CFDictionary *)Mutable setObject:&off_1009D1C08 forKeyedSubscript:IDSDSessionReportResultCodeKey];
    int v39 = +[NSNumber numberWithInteger:a5];
    [(__CFDictionary *)Mutable setObject:v39 forKeyedSubscript:IDSDSessionReportTransportTypeKey];

    long long v40 = +[NSNumber numberWithUnsignedInt:a6];
    [(__CFDictionary *)Mutable setObject:v40 forKeyedSubscript:IDSDSessionReportLocalInterfaceTypeKey];

    [(__CFDictionary *)Mutable setObject:v47 forKeyedSubscript:IDSDSessionReportReportingDataBlobKey];
    long long v41 = +[NSNumber numberWithBool:a10];
    [(__CFDictionary *)Mutable setObject:v41 forKeyedSubscript:IDSDSessionReportIsInitiatorKey];

    if (v52 == 402 && self->_timeBase)
    {
      long long v42 = +[NSDate date];
      [v42 timeIntervalSinceDate:self->_timeBase];
      long long v44 = +[NSNumber numberWithDouble:v43 * 1000.0];
      [(__CFDictionary *)Mutable setObject:v44 forKeyedSubscript:IDSDSessionTimeDeltaKey];
    }
    [v34 addQREventForRTCReport:Mutable];
  }
  else
  {
    long long v45 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Invalid session. Skip AWD report", buf, 2u);
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

- (void)cleanUpCachedMappings:(id)a3
{
  id v4 = a3;
  uint64_t v5 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "cleanUpCachedMappings for group %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v6 = v4;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v6 = v4;
        _IDSLogV();
      }
    }
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pushTokenToURIForGroup, "setObject:forKeyedSubscript:", 0, v4, v6);
}

- (void)invalidateSession:(id)a3 isExpiryPurging:(BOOL)a4
{
  id v6 = a3;
  id v7 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002C7658;
  block[3] = &unk_1009802F0;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)_invalidateSession:(id)a3 isExpiryPurging:(BOOL)a4
{
  id v6 = a3;
  im_assert_primary_base_queue();
  id v7 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "invalidate all allocations for IDSSession ID %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v10 = v6;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v10 = v6;
        _IDSLogV();
      }
    }
  }
  -[IDSQuickRelayAllocator _removeAllAllocationsForSessionID:](self, "_removeAllAllocationsForSessionID:", v6, v10);
  if (!a4)
  {
    [(NSMutableSet *)self->_pendingRecipientsAcceptedSessions removeObject:v6];
    [(NSMutableDictionary *)self->_initiatorsAcceptedSessionsWithToken removeObjectForKey:v6];
  }
  id v8 = [(NSMutableDictionary *)self->_requestIDToSession allKeysForObject:v6];
  [(NSMutableDictionary *)self->_requestIDToSession removeObjectsForKeys:v8];
  [(NSMutableDictionary *)self->_idsSessionIDToqrSessionID removeObjectForKey:v6];
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableDictionary *)self->_sessionToRequestIDToAllocateTime removeObjectForKey:v6];
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v9 = [(NSMutableDictionary *)self->_allocateResponses objectForKey:v6];
  if (v9)
  {
    if (qword_100A4C550 != -1) {
      dispatch_once(&qword_100A4C550, &stru_100987F20);
    }
    v9[2] = mach_absolute_time() * dword_100A4C548 / *(unsigned int *)algn_100A4C54C / 0x3B9ACA00 + 1800;
    [(IDSQuickRelayAllocator *)self _startCleanupTimer];
  }
}

- (void)invalidateAllocation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[IDSFoundationLog QRAllocator];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "invalidateAllocation: called", buf, 2u);
  }

  id v6 = im_primary_queue();
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002C79B0;
  v8[3] = &unk_10097E440;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)_addAllocationForSession:(id)a3 allocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    goto LABEL_25;
  }
  id v8 = +[IDSDSessionController sharedInstance];
  id v9 = [v8 sessionWithUniqueID:v6];

  unsigned int v10 = [v9 sharedSessionHasJoined];
  BOOL v11 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v12 = @"NO";
    if (v10) {
      CFStringRef v12 = @"YES";
    }
    *(_DWORD *)buf = 138412802;
    id v18 = v6;
    if (!v7) {
      CFStringRef v12 = @"invalid";
    }
    __int16 v19 = 2112;
    CFStringRef v20 = v12;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Add allocation For Session: %@, _sharedSessionHasJoined=%@, %@", buf, 0x20u);
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
  os_unfair_lock_lock(&self->_lock);
  uint64_t v13 = [(IDSQuickRelayAllocator *)self _findAllocationListForSessionID:v6];
  if (v13)
  {
    if (!v7) {
      goto LABEL_18;
    }
LABEL_16:
    if (v13) {
      CFArrayAppendValue(v13, v7);
    }
    goto LABEL_18;
  }
  uint64_t v13 = (__CFArray *)objc_alloc_init((Class)NSMutableArray);
  if (v7) {
    goto LABEL_16;
  }
LABEL_18:
  if (!self->_sessionToAllocations)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    sessionToAllocations = self->_sessionToAllocations;
    self->_sessionToAllocations = Mutable;
  }
  id v16 = v13;
  if (v13)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_sessionToAllocations, v6, v16);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10071D938();
  }

  os_unfair_lock_unlock(&self->_lock);
LABEL_25:
}

- (void)_discardAllocation:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc((Class)NSString);
    id v6 = [v4 sessionIDStr];
    id v7 = [v5 initWithString:v6];

    os_unfair_lock_lock(&self->_lock);
    id v8 = [(IDSQuickRelayAllocator *)self _findAllocationListForSessionID:v7];
    id v9 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = v7;
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Discard allocation For Session: %@, %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        id v12 = v7;
        id v13 = v4;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          id v12 = v7;
          id v13 = v4;
          _IDSLogV();
        }
      }
    }
    if (v8)
    {
      [v8 removeObject:v4];
      os_unfair_lock_unlock(&self->_lock);
      if (![v8 count])
      {
        unsigned int v10 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v15 = v7;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "_invalidateSession: %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            id v12 = v7;
            _IDSLogTransport();
            if (_IDSShouldLog())
            {
              id v12 = v7;
              _IDSLogV();
            }
          }
        }
        -[IDSQuickRelayAllocator _invalidateSession:isExpiryPurging:](self, "_invalidateSession:isExpiryPurging:", v7, 1, v12, v13);
      }
    }
    else
    {
      os_unfair_lock_unlock(&self->_lock);
      BOOL v11 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "invalid allocationList", buf, 2u);
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
}

- (void)_removeAllAllocationsForSessionID:(id)a3
{
  id v4 = a3;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v23 = self;
  key = v4;
  id v26 = [(IDSQuickRelayAllocator *)self _findAllocationListForSessionID:v4];
  id v5 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    double v43 = key;
    __int16 v44 = 2112;
    long long v45 = v26;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_removeAllAllocationsForSessionID: %@, %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      __int16 v21 = key;
      id v22 = v26;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        __int16 v21 = key;
        id v22 = v26;
        _IDSLogV();
      }
    }
  }
  id v6 = v26;
  if (v26)
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = v26;
    id v29 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v29)
    {
      uint64_t v28 = *(void *)v37;
      uint64_t v7 = kIDSQRAllocateKey_KeepAliveTimer;
      uint64_t v8 = kIDSQRAllocateKey_RelaySessionID;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v37 != v28)
          {
            uint64_t v10 = v9;
            objc_enumerationMutation(obj);
            uint64_t v9 = v10;
          }
          BOOL v11 = *(void **)(*((void *)&v36 + 1) + 8 * v9);
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          uint64_t v30 = v9;
          id v31 = v11;
          id v12 = objc_msgSend(v11, "responses", v21, v22);
          id v13 = [v12 countByEnumeratingWithState:&v32 objects:v40 count:16];
          if (v13)
          {
            uint64_t v14 = *(void *)v33;
            do
            {
              for (i = 0; i != v13; i = (char *)i + 1)
              {
                if (*(void *)v33 != v14) {
                  objc_enumerationMutation(v12);
                }
                __int16 v16 = *(void **)(*((void *)&v32 + 1) + 8 * i);
                objc_msgSend(v16, "objectForKey:", v7, v21);
                id v17 = (dispatch_source_t *)objc_claimAutoreleasedReturnValue();
                if (v17)
                {
                  [v16 removeObjectForKey:v7];
                  dispatch_source_cancel(v17[1]);
                  id v18 = OSLogHandleForTransportCategory();
                  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                  {
                    __int16 v19 = [v16 objectForKey:v8];
                    *(_DWORD *)buf = 138412290;
                    double v43 = v19;
                    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "keepalive timer stopped for %@", buf, 0xCu);
                  }
                  if (os_log_shim_legacy_logging_enabled())
                  {
                    if (_IDSShouldLogTransport())
                    {
                      __int16 v21 = [v16 objectForKey:v8];
                      _IDSLogTransport();

                      if (_IDSShouldLog())
                      {
                        __int16 v21 = objc_msgSend(v16, "objectForKey:", v8, v21);
                        _IDSLogV();
                      }
                    }
                  }
                }
              }
              id v13 = [v12 countByEnumeratingWithState:&v32 objects:v40 count:16];
            }
            while (v13);
          }

          [v31 cancelAllocationTimeoutTimer];
          uint64_t v9 = v30 + 1;
        }
        while ((id)(v30 + 1) != v29);
        id v29 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v29);
    }

    [obj removeAllObjects];
    id v6 = v26;
    if (key)
    {
      sessionToAllocations = (__CFDictionary *)v23->_sessionToAllocations;
      if (sessionToAllocations)
      {
        CFDictionaryRemoveValue(sessionToAllocations, key);
        id v6 = v26;
      }
    }
  }
  os_unfair_lock_unlock(lock);
}

- (id)_filterSelfAllocationsForSessionID:(id)a3
{
  id v4 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(IDSQuickRelayAllocator *)self _findAllocationListForSessionID:v4];
  id v7 = objc_alloc_init((Class)NSMutableIndexSet);
  if ([v6 count])
  {
    unint64_t v8 = 0;
    do
    {
      uint64_t v9 = [v6 objectAtIndexedSubscript:v8];
      uint64_t v10 = [v9 request];
      BOOL v11 = [v10 allocateType];
      unsigned int v12 = [v11 intValue];

      if (v12 == 2) {
        [v7 addIndex:v8];
      }
      ++v8;
    }
    while ((unint64_t)[v6 count] > v8);
  }
  id v13 = [v6 mutableCopy];
  [v13 removeObjectsAtIndexes:v7];
  os_unfair_lock_unlock(p_lock);

  return v13;
}

- (id)_findAllocationListForSessionID:(id)a3
{
  Value = 0;
  if (a3)
  {
    sessionToAllocations = self->_sessionToAllocations;
    if (sessionToAllocations) {
      Value = (void *)CFDictionaryGetValue((CFDictionaryRef)sessionToAllocations, a3);
    }
    uint64_t v3 = vars8;
  }
  return Value;
}

- (id)_findAllocationForSessionID:(id)a3 requestIDStr:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = +[IDSFoundationLog QRAllocator];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v29 = v6;
    __int16 v30 = 2112;
    id v31 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "_findAllocationForSessionID:requestIDStr called {sessionID: %@, requestID: %@}", buf, 0x16u);
  }

  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v10 = [(IDSQuickRelayAllocator *)self _findAllocationListForSessionID:v6];
  BOOL v11 = v10;
  if (v10)
  {
    id v22 = v6;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    unsigned int v12 = v10;
    id v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v24;
      while (2)
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          id v18 = [v17 requestIDStr];
          unsigned __int8 v19 = [v18 isEqualToIgnoringCase:v7];

          if (v19)
          {
            os_unfair_lock_unlock(p_lock);
            id v20 = v17;
            id v6 = v22;
            goto LABEL_17;
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    id v6 = v22;
  }
  os_unfair_lock_unlock(p_lock);
  unsigned int v12 = +[IDSFoundationLog QRAllocator];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v29 = v6;
    __int16 v30 = 2112;
    id v31 = v7;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "_findAllocationForSessionID, {sessionID: %@, requestID: %@} not found", buf, 0x16u);
  }
  id v20 = 0;
LABEL_17:

  return v20;
}

- (id)_parseQuickRelayDefaults:(id)a3 gropuID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = IMGetDomainValueForKey();
  uint64_t v9 = [v8 componentsSeparatedByString:@":"];
  if ([v9 count] == (id)2)
  {
    [v9 objectAtIndex:0];
    v62[0] = 0xAAAAAAAAAAAAAAAALL;
    v62[1] = 0xAAAAAAAAAAAAAAAALL;
    id v56 = objc_claimAutoreleasedReturnValue();
    if (inet_pton(2, (const char *)[v56 UTF8String], (char *)v62 + 4) == 1)
    {
      id v53 = [objc_alloc((Class)NSData) initWithBytes:(char *)v62 + 4 length:4];
      uint64_t v10 = [v9 objectAtIndex:1];
      unsigned __int16 v52 = (unsigned __int16)[v10 integerValue];

      BOOL v11 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v59 = v56;
        __int16 v60 = 1024;
        LODWORD(v61) = v52;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "decoded relay-server-address %@:%u", buf, 0x12u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          id v47 = v56;
          uint64_t v48 = v52;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            id v47 = v56;
            uint64_t v48 = v52;
            _IDSLogV();
          }
        }
      }
      unsigned int v12 = IMGetDomainValueForKey();
      id v54 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v12 options:0];
      if ([v54 length] == (id)16)
      {
        id v13 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", objc_msgSend(v54, "bytes"));
      }
      else
      {
        __int16 v16 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          id v17 = [v54 length];
          *(_DWORD *)buf = 134218240;
          id v59 = v17;
          __int16 v60 = 2048;
          uint64_t v61 = 16;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Warning: [decodedUUIDData length]: %lu != sizeof(uuid_t): %lu", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            id v47 = [v54 length];
            uint64_t v48 = 16;
            _IDSLogTransport();
            if (_IDSShouldLog())
            {
              id v47 = objc_msgSend(v54, "length", v47, 16);
              uint64_t v48 = 16;
              _IDSLogV();
            }
          }
        }
        id v13 = 0;
      }
      long long v49 = v13;
      __int16 v55 = objc_msgSend(v13, "UUIDString", v47, v48);
      id v18 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v59 = v55;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "decoded base64 relay-session-id %@", buf, 0xCu);
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
      long long v51 = IMGetDomainValueForKey();
      id v19 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v51 options:0];
      id v20 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v59 = v19;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "decoded base64 relay-session-token %@", buf, 0xCu);
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
      long long v50 = IMGetDomainValueForKey();
      id v21 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v50 options:0];
      id v22 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v59 = v21;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "decoded base64 relay-session-key %@", buf, 0xCu);
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
      if (v53 && v52 && v55 && v19 && v21)
      {
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        ids_monotonic_time();
        long long v24 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        if (v24)
        {
          CFDictionarySetValue(Mutable, kIDSQRAllocateKey_SessionAllocationTime, v24);
        }
        else
        {
          id v26 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_10071DA44();
          }
        }
        uint64_t v27 = +[NSUUID UUID];
        if (v27)
        {
          CFDictionarySetValue(Mutable, kIDSQRAllocateKey_RequestID, v27);
        }
        else
        {
          id v28 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_10071D828();
          }
        }
        id v29 = v6;
        if (v29)
        {
          CFDictionarySetValue(Mutable, kIDSQRAllocateKey_IDSSessionID, v29);
        }
        else
        {
          id v30 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_10071D7A0();
          }
        }
        id v31 = v7;
        if (v31) {
          CFDictionarySetValue(Mutable, kIDSQRAllocateKey_GroupID, v31);
        }

        *(_WORD *)buf = 769;
        buf[2] = 0;
        long long v32 = +[NSData dataWithBytes:buf length:3];
        long long v33 = [(IDSQuickRelayAllocator *)self _getCombinedSoftwareID:v32];

        id v34 = v33;
        if (v34) {
          CFDictionarySetValue(Mutable, kIDSQRAllocateKey_RelayCombinedSoftwareID, v34);
        }

        id v35 = v53;
        CFDictionarySetValue(Mutable, kIDSQRAllocateKey_RelayAddress, v35);

        long long v36 = +[NSNumber numberWithUnsignedShort:v52];
        if (v36)
        {
          CFDictionarySetValue(Mutable, kIDSQRAllocateKey_RelayPort, v36);
        }
        else
        {
          id v37 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_10071D4FC();
          }
        }
        id v38 = v55;
        CFDictionarySetValue(Mutable, kIDSQRAllocateKey_RelaySessionID, v38);

        id v39 = v19;
        CFDictionarySetValue(Mutable, kIDSQRAllocateKey_RelaySessionToken, v39);

        id v40 = v21;
        CFDictionarySetValue(Mutable, kIDSQRAllocateKey_RelaySessionKey, v40);

        long long v41 = _IDSAllocateProtocolVersionNumber();
        if (v41)
        {
          CFDictionarySetValue(Mutable, kIDSQRAllocateKey_AllocateProtocolVersion, v41);
        }
        else
        {
          id v42 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_10071D718();
          }
        }
        id v43 = kIDSQuickRelayPushTopic;
        if (v43)
        {
          CFDictionarySetValue(Mutable, kIDSQRAllocateKey_AppID, v43);
        }
        else
        {
          id v44 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_10071D9BC();
          }
        }
        long long v45 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int16 v57 = 0;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, " using preallocated tokens from user defaults", v57, 2u);
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
        long long v25 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Missing a defaults for hardcoded QR session info", buf, 2u);
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
        CFMutableDictionaryRef Mutable = 0;
      }
      id v14 = Mutable;
    }
    else
    {
      uint64_t v15 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "faied to get address in FixedQuickRelayServerAddress defaults", buf, 2u);
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
      id v14 = 0;
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (void)enablePushHandler:(BOOL)a3
{
  id v5 = im_primary_queue();
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1002C96B8;
  v6[3] = &unk_10097E8D8;
  BOOL v7 = a3;
  v6[4] = self;
  dispatch_async(v5, v6);
}

- (unint64_t)getLocalParticipantIDForRelaySessionID:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_sessionToLocalParticipantID objectForKey:a3];
  id v4 = [v3 unsignedLongLongValue];

  return (unint64_t)v4;
}

- (void)handler:(id)a3 didReceiveMessage:(id)a4 forTopic:(id)a5 fromID:(id)a6 messageContext:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = +[IDSFoundationLog QRAllocator];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "handler:didReceiveMessage:forTopic:fromID:messageContext: called", buf, 2u);
  }

  im_assert_primary_base_queue();
  uint64_t v18 = objc_opt_class();
  id v19 = sub_1002B4B18(v18, v13, @"c");
  unsigned int v20 = [v19 intValue];

  if (v20 == 255)
  {
    [(IDSQuickRelayAllocator *)self _processAllocationStatusResult:v13];
  }
  else if (v20 == 200)
  {
    [(IDSQuickRelayAllocator *)self _handleIncomingAllocateResponse:v13 isFromCache:0 requestOptions:0];
  }
  else
  {
    id v21 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v13;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "received an unexpected message %@", buf, 0xCu);
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

- (void)handler:(id)a3 receivedOfflineMessagePendingForTopic:(id)a4 messageContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "receivedOfflineMessagePendingForTopic: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v12 = v8;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v12 = v8;
        _IDSLogV();
      }
    }
  }
  BOOL v11 = +[IDSServerStorageStateMachine sharedInstance];
  [v11 incomingStorageRequestForTopic:v8 primary:1 messageContext:v9];
}

- (id)_getGroupID:(id)a3
{
  id v3 = a3;
  id v4 = +[IDSFoundationLog QRAllocator];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "_getGroupID called", buf, 2u);
  }

  id v5 = [v3 request];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 groupID];
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = objc_msgSend(v3, "responses", 0);
    id v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v17;
      uint64_t v12 = kIDSQRAllocateKey_GroupID;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = [*(id *)(*((void *)&v16 + 1) + 8 * i) objectForKey:v12];
          if (v14)
          {
            id v7 = (void *)v14;

            goto LABEL_15;
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    id v7 = 0;
  }
LABEL_15:

  return v7;
}

- (id)_uuidFromNSStringToNSData:(id)a3
{
  id v3 = a3;
  id v4 = +[IDSFoundationLog QRAllocator];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "_uuidFromNSStringToNSData called", (uint8_t *)v8, 2u);
  }

  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:v3];
  v8[0] = 0xAAAAAAAAAAAAAAAALL;
  v8[1] = 0xAAAAAAAAAAAAAAAALL;
  [v5 getUUIDBytes:v8];
  id v6 = +[NSData dataWithBytes:v8 length:16];

  return v6;
}

- (id)_getResponse:(id)a3 relaySessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v28 = v6;
  id v29 = [(IDSQuickRelayAllocator *)self _findAllocationListForSessionID:v6];
  if ([v29 count])
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = v29;
    id v25 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v25)
    {
      uint64_t v8 = *(void *)v35;
      uint64_t v9 = kIDSQRAllocateKey_RelaySessionID;
      uint64_t v24 = *(void *)v35;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v35 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          uint64_t v12 = [v11 responses];
          id v13 = [v12 countByEnumeratingWithState:&v30 objects:v38 count:16];
          if (v13)
          {
            uint64_t v14 = *(void *)v31;
            while (2)
            {
              for (j = 0; j != v13; j = (char *)j + 1)
              {
                if (*(void *)v31 != v14) {
                  objc_enumerationMutation(v12);
                }
                long long v16 = *(void **)(*((void *)&v30 + 1) + 8 * (void)j);
                long long v17 = [v16 objectForKey:v9];
                unsigned __int8 v18 = [v7 isEqualToString:v17];

                if (v18)
                {
                  os_unfair_lock_unlock(lock);
                  id v20 = v16;

                  goto LABEL_32;
                }
              }
              id v13 = [v12 countByEnumeratingWithState:&v30 objects:v38 count:16];
              if (v13) {
                continue;
              }
              break;
            }
          }

          uint64_t v8 = v24;
        }
        id v25 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
        uint64_t v8 = v24;
      }
      while (v25);
    }

    os_unfair_lock_unlock(lock);
    long long v19 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v41 = v7;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "no response for %@", buf, 0xCu);
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
    id v21 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      sessionToAllocations = self->_sessionToAllocations;
      *(_DWORD *)buf = 138412546;
      id v41 = v6;
      __int16 v42 = 2112;
      id v43 = sessionToAllocations;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Cannot find allocation for session %@, all allocations: %@", buf, 0x16u);
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
    os_unfair_lock_unlock(lock);
  }
  id v20 = 0;
LABEL_32:

  return v20;
}

- (void)startKeepAliveTimer:(id)a3 relaySessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[IDSFoundationLog QRAllocator];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v23 = v6;
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "startKeepAliveTimer:relaySessionID called - {sessionID: %@, relaySessionID %@}", buf, 0x16u);
  }

  uint64_t v9 = [(IDSQuickRelayAllocator *)self _getResponse:v6 relaySessionID:v7];
  id v10 = v9;
  if (v9)
  {
    uint64_t v11 = kIDSQRAllocateKey_KeepAliveTimer;
    uint64_t v12 = [v9 objectForKey:kIDSQRAllocateKey_KeepAliveTimer];
    id v13 = (void *)v12;
    if (v12) {
      dispatch_source_cancel(*(dispatch_source_t *)(v12 + 8));
    }
    uint64_t v14 = im_primary_queue();
    id v15 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v14);

    dispatch_time_t v16 = dispatch_time(0, 1790000000000);
    dispatch_source_set_timer(v15, v16, 0x1A0C4506C00uLL, 0x5F5E100uLL);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1002CA7B4;
    handler[3] = &unk_10097E440;
    handler[4] = self;
    id v17 = v10;
    id v21 = v17;
    dispatch_source_set_event_handler(v15, handler);
    unsigned __int8 v18 = [[TimerWrapper alloc] initWithTimer:v15];
    [v17 setObject:v18 forKey:v11];

    dispatch_resume(v15);
    long long v19 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v7;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "keepalive timer started for %@", buf, 0xCu);
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

- (void)stopKeepAliveTimer:(id)a3 relaySessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[IDSFoundationLog QRAllocator];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "stopKeepAliveTimer:relaySessionID: called {sessionID: %@, relaySessionID %@}", buf, 0x16u);
  }

  uint64_t v9 = [(IDSQuickRelayAllocator *)self _getResponse:v6 relaySessionID:v7];
  id v10 = v9;
  if (v9)
  {
    uint64_t v11 = kIDSQRAllocateKey_KeepAliveTimer;
    uint64_t v12 = [v9 objectForKey:kIDSQRAllocateKey_KeepAliveTimer];
    if (v12)
    {
      [v10 removeObjectForKey:v11];
      dispatch_source_cancel(v12[1]);
      id v13 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v7;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "keepalive timer stopped for %@", buf, 0xCu);
      }

      if (!os_log_shim_legacy_logging_enabled()) {
        goto LABEL_17;
      }
      if (!_IDSShouldLogTransport()) {
        goto LABEL_17;
      }
      _IDSLogTransport();
      if ((_IDSShouldLog() & 1) == 0) {
        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v14 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v7;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "keepalive timer not found for %@", buf, 0xCu);
      }

      if (!os_log_shim_legacy_logging_enabled()) {
        goto LABEL_17;
      }
      if (!_IDSShouldLogTransport()) {
        goto LABEL_17;
      }
      _IDSLogTransport();
      if ((_IDSShouldLog() & 1) == 0) {
        goto LABEL_17;
      }
    }
    _IDSLogV();
LABEL_17:
  }
}

- (void)_cleanupResponses
{
  if (qword_100A4C550 != -1) {
    dispatch_once(&qword_100A4C550, &stru_100987F20);
  }
  uint64_t v3 = mach_absolute_time();
  uint64_t v5 = dword_100A4C548;
  unint64_t v4 = *(unsigned int *)algn_100A4C54C;
  id v6 = [(NSMutableDictionary *)self->_allocateResponses count];
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = sub_1002CAFA4;
  id v28 = sub_1002CAFB4;
  id v29 = 0;
  id v7 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v32 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "cleanup response count: %zu", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v17 = v6;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v17 = v6;
        _IDSLogV();
      }
    }
  }
  allocateResponses = self->_allocateResponses;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1002CAFBC;
  v23[3] = &unk_100987F00;
  v23[5] = &v24;
  v23[6] = v3 * v5 / v4 / 0x3B9ACA00;
  v23[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](allocateResponses, "enumerateKeysAndObjectsUsingBlock:", v23, v17);
  if (v25[5])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = (id)v25[5];
    id v10 = [v9 countByEnumeratingWithState:&v19 objects:v30 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v20;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v9);
          }
          id v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v14 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v32 = v13;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "clean up response for groupID %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              id v18 = v13;
              _IDSLogTransport();
              if (_IDSShouldLog())
              {
                id v18 = v13;
                _IDSLogV();
              }
            }
          }
          -[NSMutableDictionary removeObjectForKey:](self->_allocateResponses, "removeObjectForKey:", v13, v18);
        }
        id v10 = [v9 countByEnumeratingWithState:&v19 objects:v30 count:16];
      }
      while (v10);
    }
  }
  if (![(NSMutableDictionary *)self->_allocateResponses count])
  {
    dispatch_source_cancel((dispatch_source_t)self->_responseCleanupTimer);
    responseCleanupTimer = self->_responseCleanupTimer;
    self->_responseCleanupTimer = 0;

    id v16 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "cleanup timer disabled", buf, 2u);
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
  _Block_object_dispose(&v24, 8);
}

- (void)_startCleanupTimer
{
  if (!self->_responseCleanupTimer)
  {
    uint64_t v3 = im_primary_queue();
    unint64_t v4 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v3);
    responseCleanupTimer = self->_responseCleanupTimer;
    self->_responseCleanupTimer = v4;

    id v6 = self->_responseCleanupTimer;
    dispatch_time_t v7 = dispatch_time(0, 300000000000);
    dispatch_source_set_timer(v6, v7, 0x45D964B800uLL, 0x5F5E100uLL);
    uint64_t v8 = self->_responseCleanupTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1002CB248;
    handler[3] = &unk_10097E4D0;
    handler[4] = self;
    dispatch_source_set_event_handler(v8, handler);
    dispatch_resume((dispatch_object_t)self->_responseCleanupTimer);
    id v9 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "cleanup timer started", v10, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
}

- (id)_getQuickRelayIPPreference:(unint64_t)a3
{
  CFStringRef v3 = @"Unknown preference";
  if (a3 == 1) {
    CFStringRef v3 = @"Prefer IPV6";
  }
  if (a3) {
    return (id)v3;
  }
  else {
    return @"Prefer IPV4";
  }
}

- (unint64_t)getCountOfPendingRecipientsAcceptedSessions
{
  return (unint64_t)[(NSMutableSet *)self->_pendingRecipientsAcceptedSessions count];
}

- (unint64_t)getCountOfSessionToAllocations
{
  return (unint64_t)[(NSMutableDictionary *)self->_sessionToAllocations count];
}

- (void)setRequestIDToSession:(id)a3 idsSessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_requestIDToSession)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    requestIDToSession = self->_requestIDToSession;
    self->_requestIDToSession = Mutable;
  }
  id v10 = v7;
  if (v10)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_requestIDToSession, v6, v10);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10071DACC();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeBase, 0);
  objc_storeStrong((id *)&self->_idsSessionIDToqrSessionID, 0);
  objc_storeStrong((id *)&self->_pushTokenToURIForGroup, 0);
  objc_storeStrong((id *)&self->_sessionToLocalParticipantID, 0);
  objc_storeStrong((id *)&self->_groupIDToDuplicateResponseCleanupTimers, 0);
  objc_storeStrong((id *)&self->_duplicateAllocateResponses, 0);
  objc_storeStrong((id *)&self->_sessionIDToURIToResponsePayload, 0);
  objc_storeStrong((id *)&self->_responseCleanupTimer, 0);
  objc_storeStrong((id *)&self->_requestIDToPreferredLocalInterface, 0);
  objc_storeStrong((id *)&self->_allocateResponses, 0);
  objc_storeStrong((id *)&self->_sessionToRequestIDToAllocateTime, 0);
  objc_storeStrong((id *)&self->_initiatorsAcceptedSessionsWithToken, 0);
  objc_storeStrong((id *)&self->_pendingRecipientsAcceptedSessions, 0);
  objc_storeStrong((id *)&self->_sessionInfoRequiredKeys, 0);
  objc_storeStrong((id *)&self->_sessionToAllocations, 0);
  objc_storeStrong((id *)&self->_requestIDToSession, 0);

  objc_storeStrong((id *)&self->_pushHandler, 0);
}

@end