@interface FaceTimeServiceSession
+ (void)initialize;
- (BOOL)_anyPeersForConferenceIDMayRequireBreakBeforeMake:(id)a3;
- (BOOL)_checkAliasInfoAndFailIfNecessaryWithAction:(int64_t)a3 callType:(int)a4 conferenceID:(id)a5 withPerson:(id)a6 properties:(id)a7;
- (BOOL)_checkBadPushToken:(id)a3;
- (BOOL)_checkCanSendRequestsAndFailIfNecessaryAction:(int64_t)a3 callType:(int)a4 conferenceID:(id)a5 withPerson:(id)a6 properties:(id)a7;
- (BOOL)_checkConferenceIDAndFailIfNecessaryWithAction:(int64_t)a3 callType:(int)a4 conferenceID:(id)a5 withPerson:(id)a6 properties:(id)a7;
- (BOOL)_checkForBadPeerIDWithAction:(int64_t)a3 callType:(int)a4 conferenceID:(id)a5 withPerson:(id)a6 properties:(id)a7 peerID:(id)a8;
- (BOOL)_checkManagedProfileAndFailIfNecessaryAction:(int64_t)a3 callType:(int)a4 conferenceID:(id)a5 withPerson:(id)a6 properties:(id)a7;
- (BOOL)_checkRegistrationAndFailIfNecessaryAction:(int64_t)a3 callType:(int)a4 conferenceID:(id)a5 withPerson:(id)a6 properties:(id)a7;
- (BOOL)_hasOutgoingInvitationInFlight;
- (BOOL)_hasOutgoingRelayInitiateInFlight;
- (BOOL)_hasPeersForPeerID:(id)a3 conferenceID:(id)a4;
- (BOOL)_registrationSupportedForRegistration;
- (BOOL)_validRegistrationStateToAcceptCalls;
- (BOOL)_validRegistrationStateToMakeCalls;
- (BOOL)queue:(id)a3 shouldInvoke:(id)a4;
- (FaceTimeServiceSession)initWithAccount:(id)a3 service:(id)a4;
- (__SecKey)callerPrivateKey;
- (double)_messageTimeoutTimeForMessage:(id)a3;
- (id)_displayIDForPeerID:(id)a3 conferenceID:(id)a4;
- (id)_mappedSessionTokenForConferenceID:(id)a3;
- (id)_peerIDForDiplayID:(id)a3 conferenceID:(id)a4;
- (id)_peerIDPushTokenPairsForConferenceID:(id)a3;
- (id)_peerIDPushTokensPairsForPeerID:(id)a3 conferenceID:(id)a4 skippingPairs:(id)a5;
- (id)_peerIDsForDiplayID:(id)a3 conferenceID:(id)a4;
- (id)_peerInfoForDisplayID:(id)a3 conferenceID:(id)a4 skippingPairs:(id)a5;
- (id)_pushTokenForPeerID:(id)a3 conferenceID:(id)a4;
- (id)_pushTokensForPeerID:(id)a3 conferenceID:(id)a4;
- (id)callerCertForCallType:(int)a3;
- (id)idsAccountForCallType:(int)a3;
- (id)idsAccounts;
- (id)loggingName;
- (id)phoneNumber;
- (id)profileID;
- (id)pushToken;
- (id)regionBasePhoneNumber;
- (id)regionID;
- (id)regionServerContext;
- (id)registeredURIs;
- (id)topicForCallType:(int)a3;
- (id)userID;
- (int)_callTypeForConferenceID:(id)a3;
- (unint64_t)capabilities;
- (unint64_t)queue:(id)a3 optionsForInvocation:(id)a4;
- (void)_cancelOtherInvitesForPeerID:(id)a3 skipPairs:(id)a4 properties:(id)a5 conference:(id)a6 reason:(id)a7;
- (void)_cancelVCRequestWithPerson:(id)a3 properties:(id)a4 conference:(id)a5 pairsToSkip:(id)a6 reason:(id)a7;
- (void)_logLocalInfo;
- (void)_purgeMap;
- (void)_retargetPeerID:(id)a3 displayID:(id)a4 pushToken:(id)a5 conferenceID:(id)a6;
- (void)_sendRejectToPeerID:(id)a3 peerToken:(id)a4 sessionToken:(id)a5 callType:(int)a6 reason:(int64_t)a7 clientInfo:(id)a8;
- (void)_setAlternateDisplayID:(id)a3 forPeerID:(id)a4 conferenceID:(id)a5;
- (void)_setCallType:(int)a3 forConferenceID:(id)a4;
- (void)_setConferenceIDMap:(id)a3 forToken:(id)a4;
- (void)_setInitiatedConference:(id)a3;
- (void)_setPeerInfo:(id)a3 conferenceID:(id)a4;
- (void)_setPurgeTimer;
- (void)cancelVCRequestWithPerson:(id)a3 properties:(id)a4 conference:(id)a5 reason:(id)a6;
- (void)dealloc;
- (void)handler:(id)a3 incomingMessage:(id)a4 topic:(id)a5 peerID:(id)a6 reason:(id)a7 clientInfo:(id)a8 serviceData:(id)a9;
- (void)handler:(id)a3 relayCancelled:(id)a4 topic:(id)a5 peerID:(id)a6 relayType:(id)a7 relayTokenAllocReq:(id)a8 relayConnectionID:(id)value relayTransactionIDAlloc:(id)a10 relayCandidateID:(id)a11 myRelayIP:(id)a12 myRelayPort:(id)a13 peerRelayIP:(id)a14 peerRelayPort:(id)a15 reason:(id)a16 clientInfo:(id)a17 serviceData:(id)a18;
- (void)handler:(id)a3 relayInitiated:(id)a4 topic:(id)a5 peerID:(id)a6 peerPushToken:(id)a7 relayType:(id)a8 relayConnectionID:(id)value relayTransactionIDAlloc:(id)a10 relayTokenAllocReq:(id)a11 relayCandidateID:(id)a12 myRelayIP:(id)a13 myRelayPort:(id)a14 peerRelayIP:(id)a15 peerRelayPort:(id)a16 clientInfo:(id)a17 serviceData:(id)a18;
- (void)handler:(id)a3 relayUpdated:(id)a4 topic:(id)a5 peerID:(id)a6 peerPushToken:(id)a7 relayType:(id)a8 relayConnectionID:(id)value relayTransactionIDChannelBind:(id)a10 relayTokenChannelBind:(id)a11 relayCandidateID:(id)a12 relayBlob:(id)a13 peerRelayNATIP:(id)a14 peerRelayNATPort:(id)a15 clientInfo:(id)a16 serviceData:(id)a17;
- (void)handler:(id)a3 sessionAccepted:(id)a4 topic:(id)a5 peerID:(id)a6 peerCN:(id)a7 peerPushToken:(id)a8 peerNATType:(id)a9 peerBlob:(id)a10 peerNatIP:(id)a11 relayType:(id)a12 relayConnectionID:(id)a13 relayTransactionIDAlloc:(id)a14 relayTokenAllocReq:(id)a15 myRelayIP:(id)a16 myRelayPort:(id)a17 peerRelayIP:(id)a18 peerRelayPort:(id)a19 clientInfo:(id)a20 serviceData:(id)a21;
- (void)handler:(id)a3 sessionCancelled:(id)a4 topic:(id)a5 peerID:(id)a6 reason:(id)a7 clientInfo:(id)a8 serviceData:(id)a9;
- (void)handler:(id)a3 sessionInitated:(id)a4 topic:(id)a5 myID:(id)a6 peerID:(id)a7 peerDisplayID:(id)a8 peerCN:(id)a9 peerPushToken:(id)a10 peerNATType:(id)a11 peerBlob:(id)a12 peerNatIP:(id)a13 clientInfo:(id)a14 serviceData:(id)a15;
- (void)handler:(id)a3 sessionRejected:(id)a4 topic:(id)a5 peerID:(id)a6 peerPushToken:(id)a7 reason:(id)a8 clientInfo:(id)a9 serviceData:(id)a10;
- (void)refreshRegistration;
- (void)refreshServiceCapabilities;
- (void)relay:(id)a3 sendCancel:(id)a4 toPerson:(id)a5;
- (void)relay:(id)a3 sendInitateRequest:(id)a4 toPerson:(id)a5;
- (void)relay:(id)a3 sendUpdate:(id)a4 toPerson:(id)a5;
- (void)requestVCWithPerson:(id)a3 properties:(id)a4 conference:(id)a5;
- (void)respondToVCInvitationWithPerson:(id)a3 properties:(id)a4 conference:(id)a5;
- (void)sendAVMessageToPerson:(id)a3 sessionID:(unsigned int)a4 type:(unsigned int)a5 userInfo:(id)a6 conference:(id)a7;
- (void)sessionWillBecomeInactiveWithAccount:(id)a3;
@end

@implementation FaceTimeServiceSession

- (unint64_t)capabilities
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x263F4A760], "sharedDaemon"), "vcCapabilities") | 0x102000000000;
}

- (void)refreshServiceCapabilities
{
  id v3 = [(IMDServiceSession *)self broadcaster];
  [(IMDServiceSession *)self accountID];
  [(FaceTimeServiceSession *)self capabilities];

  MEMORY[0x270F9A6D0](v3, sel_account_capabilitiesChanged_);
}

- (id)idsAccounts
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = (void *)[MEMORY[0x263EFF980] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = [(IMDServiceSession *)self accounts];
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v3, "addObject:", objc_msgSend(v9, "idsAccount"));
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  if ([v3 count])
  {
    IMDInconsistencyResolved();
  }
  else
  {
    if ([(IMDServiceSession *)self isActive])
    {
      [(IMDServiceSession *)self accounts];
      IMDNoticedInconsistency();
    }
    return 0;
  }
  return v3;
}

- (void)refreshRegistration
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [(FaceTimePushHandler *)self->_ftPushHandler setRegistered:[(IMDAppleServiceSession *)self _isDeviceRegistered]];
  if ([(IMDAppleServiceSession *)self _isDeviceRegistered]) {
    -[IMDAccount writeAccountDefaults:](-[IMDServiceSession account](self, "account"), "writeAccountDefaults:", [NSDictionary dictionaryWithObject:_IDSInvitationProtocolVersionNumber() forKey:@"InvitationProtocolVersion"]);
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = [(FaceTimeServiceSession *)self idsAccounts];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(IMDAppleServiceSession *)self resetCallerIDForIDSAccount:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)sessionWillBecomeInactiveWithAccount:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      long long v10 = "-[FaceTimeServiceSession sessionWillBecomeInactiveWithAccount:]";
      _os_log_impl(&dword_2378DA000, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    uint64_t v7 = "-[FaceTimeServiceSession sessionWillBecomeInactiveWithAccount:]";
    _IMLoggingLog();
    if (_IMWillLog())
    {
      uint64_t v7 = "-[FaceTimeServiceSession sessionWillBecomeInactiveWithAccount:]";
      _IMAlwaysLog();
    }
  }
  [(FaceTimeServiceSession *)self _purgeMap];
  id completionBlock = self->_completionBlock;
  if (completionBlock)
  {

    self->_id completionBlock = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)FaceTimeServiceSession;
  [(IMDAppleServiceSession *)&v8 sessionWillBecomeInactiveWithAccount:a3];
}

- (void)_purgeMap
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v7 = [(IMDAppleServiceSession *)self GUID];
      __int16 v8 = 2112;
      uint64_t v9 = qword_26AC13538;
      _os_log_impl(&dword_2378DA000, v3, OS_LOG_TYPE_INFO, "Purging GUID %@ from conference maps %@", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    uint64_t v4 = [(IMDAppleServiceSession *)self GUID];
    uint64_t v5 = qword_26AC13538;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      uint64_t v4 = [(IMDAppleServiceSession *)self GUID];
      uint64_t v5 = qword_26AC13538;
      _IMAlwaysLog();
    }
  }
  objc_msgSend(MEMORY[0x263F8C6D0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__purgeMap, 0, v4, v5);
  objc_msgSend((id)objc_msgSend((id)qword_26AC13538, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID")), "removeAllObjects");
  objc_msgSend((id)qword_26AC13538, "removeObjectForKey:", -[IMDAppleServiceSession GUID](self, "GUID"));
}

- (void)dealloc
{
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2378DA000, v3, OS_LOG_TYPE_INFO, "Dealloc", buf, 2u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    _IMLoggingLog();
    if (_IMWillLog()) {
      _IMAlwaysLog();
    }
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:name:object:", self, 0, 0);
  [(FaceTimeServiceSession *)self _purgeMap];

  [(FaceTimePushHandler *)self->_ftPushHandler removeListener:self];
  objc_msgSend((id)qword_26AC13538, "removeObjectForKey:", -[IMDAppleServiceSession GUID](self, "GUID"));

  objc_msgSend((id)qword_26AC13530, "removeObject:", -[IMDAppleServiceSession GUID](self, "GUID"));
  if (![(id)qword_26AC13530 count])
  {
    [(id)qword_26AC13540 invalidate];

    qword_26AC13540 = 0;
  }

  [self->_broadcasterACInvocationQueue setDelegate:0];
  [self->_broadcasterACInvocationQueue setTarget:0];
  [self->_broadcasterACInvocationQueue removeAllInvocations];

  [self->_broadcasterVCInvocationQueue setDelegate:0];
  [self->_broadcasterVCInvocationQueue setTarget:0];
  [self->_broadcasterVCInvocationQueue removeAllInvocations];

  v4.receiver = self;
  v4.super_class = (Class)FaceTimeServiceSession;
  [(IMDAppleServiceSession *)&v4 dealloc];
}

+ (void)initialize
{
  if (qword_26AC13528 != -1) {
    dispatch_once(&qword_26AC13528, &unk_26EA8B810);
  }
}

- (void)_setPurgeTimer
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__purgeMap object:0];

  MEMORY[0x270F9A6D0](self, sel_performSelector_withObject_afterDelay_);
}

- (void)_setPeerInfo:(id)a3 conferenceID:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a3 && a4)
  {
    if (!objc_msgSend((id)qword_26AC13538, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID")))
    {
      id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      objc_msgSend((id)qword_26AC13538, "setObject:forKey:", v7, -[IMDAppleServiceSession GUID](self, "GUID"));
    }
    if ((unint64_t)objc_msgSend((id)objc_msgSend((id)qword_26AC13538, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID")), "count") >= 0x15)
    {
      if (IMOSLoggingEnabled())
      {
        __int16 v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v15 = 20;
          *(_WORD *)&v15[4] = 2112;
          *(void *)&v15[6] = objc_msgSend((id)qword_26AC13538, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID"));
          _os_log_impl(&dword_2378DA000, v8, OS_LOG_TYPE_INFO, "Max cache size of %d reached for CONFERENCE_MAP. Removing all objects in CONFERENCE_MAP %@", buf, 0x12u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        uint64_t v12 = 20;
        id v13 = (id)objc_msgSend((id)qword_26AC13538, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID"));
        _IMLoggingLog();
        if (_IMWillLog())
        {
          uint64_t v9 = objc_msgSend((id)qword_26AC13538, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID", 20, v13));
          uint64_t v12 = 20;
          id v13 = (id)v9;
          _IMAlwaysLog();
        }
      }
      objc_msgSend((id)objc_msgSend((id)qword_26AC13538, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID", v12, v13)), "removeAllObjects");
    }
    objc_msgSend((id)objc_msgSend((id)qword_26AC13538, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID")), "setObject:forKey:", a3, a4);
    if (IMOSLoggingEnabled())
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)v15 = a3;
        *(_WORD *)&v15[8] = 2112;
        *(void *)&v15[10] = a4;
        _os_log_impl(&dword_2378DA000, v10, OS_LOG_TYPE_INFO, "Setting peer info: %@  for cid: %@", buf, 0x16u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      uint64_t v12 = (uint64_t)a3;
      id v13 = a4;
      _IMLoggingLog();
      if (_IMWillLog())
      {
        uint64_t v12 = (uint64_t)a3;
        id v13 = a4;
        _IMAlwaysLog();
      }
    }
    uint64_t v11 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v15 = a3;
      *(_WORD *)&v15[8] = 2112;
      *(void *)&v15[10] = a4;
      _os_log_impl(&dword_2378DA000, v11, OS_LOG_TYPE_DEFAULT, "Setting peer info: %@  for cid: %@", buf, 0x16u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        uint64_t v12 = (uint64_t)a3;
        id v13 = a4;
        MarcoLog();
      }
      if (IMShouldLog())
      {
        uint64_t v12 = (uint64_t)a3;
        id v13 = a4;
        IMLogString();
      }
    }
    [(FaceTimeServiceSession *)self _setPurgeTimer];
  }
}

- (BOOL)_hasPeersForPeerID:(id)a3 conferenceID:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v35 = (uint64_t)a3;
      __int16 v36 = 2112;
      uint64_t v37 = (uint64_t)a4;
      _os_log_impl(&dword_2378DA000, v7, OS_LOG_TYPE_INFO, "Checking peers with peerID %@ conferenceID %@", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v23 = (NSString *)a3;
    id v27 = a4;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v23 = (NSString *)a3;
      id v27 = a4;
      _IMAlwaysLog();
    }
  }
  if (IMOSLoggingEnabled())
  {
    __int16 v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = [(IMDAppleServiceSession *)self GUID];
      *(_DWORD *)buf = 138412290;
      uint64_t v35 = (uint64_t)v9;
      _os_log_impl(&dword_2378DA000, v8, OS_LOG_TYPE_INFO, "My GUID: %@", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v23 = [(IMDAppleServiceSession *)self GUID];
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v23 = [(IMDAppleServiceSession *)self GUID];
      _IMAlwaysLog();
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v35 = qword_26AC13538;
      _os_log_impl(&dword_2378DA000, v10, OS_LOG_TYPE_INFO, "Conference maps %@", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v23 = (NSString *)qword_26AC13538;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v23 = (NSString *)qword_26AC13538;
      _IMAlwaysLog();
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = objc_msgSend((id)qword_26AC13538, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID"));
      *(_DWORD *)buf = 138412290;
      uint64_t v35 = v12;
      _os_log_impl(&dword_2378DA000, v11, OS_LOG_TYPE_INFO, "Looking for peer in map %@", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v23 = (NSString *)objc_msgSend((id)qword_26AC13538, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID"));
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v23 = (NSString *)objc_msgSend((id)qword_26AC13538, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID", v23));
      _IMAlwaysLog();
    }
  }
  id v13 = objc_msgSend((id)objc_msgSend((id)qword_26AC13538, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID", v23, v27)), "objectForKey:", a4);
  if (!v13) {
    return 0;
  }
  if (IMOSLoggingEnabled())
  {
    long long v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v35 = (uint64_t)v13;
      _os_log_impl(&dword_2378DA000, v14, OS_LOG_TYPE_INFO, "Peers %@", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v24 = v13;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v24 = v13;
      _IMAlwaysLog();
    }
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16, v24);
  if (!v15) {
    return 0;
  }
  uint64_t v16 = *(void *)v30;
  while (2)
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v30 != v16) {
        objc_enumerationMutation(v13);
      }
      v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
      if (IMOSLoggingEnabled())
      {
        v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v35 = (uint64_t)v18;
          _os_log_impl(&dword_2378DA000, v19, OS_LOG_TYPE_INFO, "Peer info %@", buf, 0xCu);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        v25 = v18;
        _IMLoggingLog();
        if (_IMWillLog())
        {
          v25 = v18;
          _IMAlwaysLog();
        }
      }
      uint64_t v20 = objc_msgSend(v18, "objectForKey:", @"id", v25);
      if (IMOSLoggingEnabled())
      {
        v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v35 = (uint64_t)a3;
          __int16 v36 = 2112;
          uint64_t v37 = v20;
          _os_log_impl(&dword_2378DA000, v21, OS_LOG_TYPE_INFO, "Comparing %@ to %@", buf, 0x16u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        id v26 = a3;
        uint64_t v28 = v20;
        _IMLoggingLog();
        if (_IMWillLog())
        {
          id v26 = a3;
          uint64_t v28 = v20;
          _IMAlwaysLog();
        }
      }
      if (objc_msgSend(a3, "isEqualToString:", v20, v26, v28)) {
        return 1;
      }
    }
    uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
    BOOL result = 0;
    if (v15) {
      continue;
    }
    break;
  }
  return result;
}

- (id)_displayIDForPeerID:(id)a3 conferenceID:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)qword_26AC13538, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID")), "objectForKey:", a4);
  uint64_t v6 = v5;
  if (v5)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (objc_msgSend(a3, "isEqualToString:", objc_msgSend(v10, "objectForKey:", @"id")))
          {
            uint64_t v6 = objc_msgSend((id)objc_msgSend(v10, "objectForKey:", @"canonical-id"), "_stripFZIDPrefix");
            if (v6)
            {
              uint64_t v11 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v19 = v6;
                __int16 v20 = 2112;
                id v21 = a3;
                _os_log_impl(&dword_2378DA000, v11, OS_LOG_TYPE_DEFAULT, "Found display ID: %@ for peer ID: %@", buf, 0x16u);
              }
              if (os_log_shim_legacy_logging_enabled())
              {
                if (MarcoShouldLog()) {
                  MarcoLog();
                }
                if (IMShouldLog()) {
                  IMLogString();
                }
              }
              if (IMOSLoggingEnabled())
              {
                uint64_t v12 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  v19 = v6;
                  __int16 v20 = 2112;
                  id v21 = a3;
                  _os_log_impl(&dword_2378DA000, v12, OS_LOG_TYPE_INFO, "Found display ID: %@ for peer ID: %@", buf, 0x16u);
                }
              }
              if (os_log_shim_legacy_logging_enabled())
              {
                _IMLoggingLog();
                if (_IMWillLog()) {
                  _IMAlwaysLog();
                }
              }
            }
            else
            {
              _IMWarn();
              return a3;
            }
            return v6;
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v22 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    _IMWarn();
    return (id)objc_msgSend(a3, "_stripFZIDPrefix", a3);
  }
  else
  {
    _IMWarn();
  }
  return v6;
}

- (void)_retargetPeerID:(id)a3 displayID:(id)a4 pushToken:(id)a5 conferenceID:(id)a6
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v11 = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      *(void *)long long v32 = a3;
      *(_WORD *)&v32[8] = 2112;
      *(void *)&v32[10] = a4;
      __int16 v33 = 2112;
      id v34 = a5;
      __int16 v35 = 2112;
      id v36 = a6;
      _os_log_impl(&dword_2378DA000, v12, OS_LOG_TYPE_INFO, "Retargeting peer ID: %@   display ID: %@   token: %@   cid: %@", buf, 0x2Au);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    id v29 = a5;
    id v30 = a6;
    id v23 = a3;
    id v27 = a4;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      id v29 = a5;
      id v30 = a6;
      id v23 = a3;
      id v27 = a4;
      _IMAlwaysLog();
    }
  }
  id v13 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    *(void *)long long v32 = a3;
    *(_WORD *)&v32[8] = 2112;
    *(void *)&v32[10] = a4;
    __int16 v33 = 2112;
    id v34 = a5;
    __int16 v35 = 2112;
    id v36 = a6;
    _os_log_impl(&dword_2378DA000, v13, OS_LOG_TYPE_DEFAULT, "Retargeting peer ID: %@   display ID: %@   token: %@   cid: %@", buf, 0x2Au);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
    {
      id v29 = a5;
      id v30 = a6;
      id v23 = a3;
      id v27 = a4;
      MarcoLog();
    }
    if (IMShouldLog())
    {
      id v29 = a5;
      id v30 = a6;
      id v23 = a3;
      id v27 = a4;
      IMLogString();
    }
  }
  if (!a4) {
    a4 = [(FaceTimeServiceSession *)self _displayIDForPeerID:a3 conferenceID:a6];
  }
  long long v14 = (const void *)objc_msgSend(a4, "_IDFromFZIDType:", objc_msgSend(a4, "_FZBestGuessFZIDType", v23, v27, v29, v30));
  if (v14) {
    CFDictionarySetValue(v11, @"canonical-id", v14);
  }
  if (a3) {
    CFDictionarySetValue(v11, @"id", a3);
  }
  if (a5) {
    CFDictionarySetValue(v11, @"push-token", a5);
  }
  if (IMOSLoggingEnabled())
  {
    long long v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)long long v32 = v11;
      _os_log_impl(&dword_2378DA000, v15, OS_LOG_TYPE_INFO, "Resulting peerInfo %@", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    v24 = v11;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v24 = v11;
      _IMAlwaysLog();
    }
  }
  if (!objc_msgSend((id)qword_26AC13538, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID", v24)))
  {
    id v16 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    objc_msgSend((id)qword_26AC13538, "setObject:forKey:", v16, -[IMDAppleServiceSession GUID](self, "GUID"));
  }
  if ((unint64_t)objc_msgSend((id)objc_msgSend((id)qword_26AC13538, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID")), "count") >= 0x15)
  {
    if (IMOSLoggingEnabled())
    {
      long long v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = objc_msgSend((id)qword_26AC13538, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID"));
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)long long v32 = 20;
        *(_WORD *)&v32[4] = 2112;
        *(void *)&v32[6] = v18;
        _os_log_impl(&dword_2378DA000, v17, OS_LOG_TYPE_INFO, "Max cache size of %d reached for CONFERENCE_MAP. Removing all objects in CONFERENCE_MAP %@", buf, 0x12u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      uint64_t v25 = 20;
      uint64_t v28 = objc_msgSend((id)qword_26AC13538, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID"));
      _IMLoggingLog();
      if (_IMWillLog())
      {
        uint64_t v19 = objc_msgSend((id)qword_26AC13538, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID", 20, v28));
        uint64_t v25 = 20;
        uint64_t v28 = v19;
        _IMAlwaysLog();
      }
    }
    objc_msgSend((id)objc_msgSend((id)qword_26AC13538, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID", v25, v28)), "removeAllObjects");
  }
  objc_msgSend((id)objc_msgSend((id)qword_26AC13538, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID")), "setObject:forKey:", IMSingleObjectArray(), a6);
  if (IMOSLoggingEnabled())
  {
    __int16 v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = objc_msgSend((id)qword_26AC13538, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID"));
      *(_DWORD *)buf = 138412290;
      *(void *)long long v32 = v21;
      _os_log_impl(&dword_2378DA000, v20, OS_LOG_TYPE_INFO, "Conference map after retarget: %@", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    uint64_t v26 = objc_msgSend((id)qword_26AC13538, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID"));
    _IMLoggingLog();
    if (_IMWillLog())
    {
      objc_msgSend((id)qword_26AC13538, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID", v26));
      _IMAlwaysLog();
    }
  }
  if (IMOSLoggingEnabled())
  {
    v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)long long v32 = qword_26AC13538;
      _os_log_impl(&dword_2378DA000, v22, OS_LOG_TYPE_INFO, "All maps after retarget: %@", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    _IMLoggingLog();
    if (_IMWillLog()) {
      _IMAlwaysLog();
    }
  }

  [(FaceTimeServiceSession *)self _setPurgeTimer];
}

- (void)_setAlternateDisplayID:(id)a3 forPeerID:(id)a4 conferenceID:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (a3
    && a4
    && a5
    && objc_msgSend((id)qword_26AC13538, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID")))
  {
    uint64_t v9 = objc_msgSend((id)objc_msgSend((id)qword_26AC13538, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID")), "objectForKey:", a5);
    if (IMOSLoggingEnabled())
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        id v27 = a3;
        __int16 v28 = 2112;
        id v29 = a4;
        __int16 v30 = 2112;
        id v31 = a5;
        _os_log_impl(&dword_2378DA000, v10, OS_LOG_TYPE_INFO, "Setting alternate display ID: %@ for peer ID: %@ cid: %@", buf, 0x20u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      id v19 = a4;
      id v20 = a5;
      id v18 = a3;
      _IMLoggingLog();
      if (_IMWillLog())
      {
        id v19 = a4;
        id v20 = a5;
        id v18 = a3;
        _IMAlwaysLog();
      }
    }
    uint64_t v11 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v27 = a3;
      __int16 v28 = 2112;
      id v29 = a4;
      __int16 v30 = 2112;
      id v31 = a5;
      _os_log_impl(&dword_2378DA000, v11, OS_LOG_TYPE_DEFAULT, "Setting alternate display ID: %@ for peer ID: %@ cid: %@", buf, 0x20u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        id v19 = a4;
        id v20 = a5;
        id v18 = a3;
        MarcoLog();
      }
      if (IMShouldLog())
      {
        id v19 = a4;
        id v20 = a5;
        id v18 = a3;
        IMLogString();
      }
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16, v18, v19, v20);
    if (v12)
    {
      uint64_t v13 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v9);
          }
          long long v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (objc_msgSend(a4, "isEqualToString:", objc_msgSend(v15, "objectForKey:", @"id")))
          {
            long long v17 = (__CFDictionary *)[v15 mutableCopy];
            id v16 = (void *)[v9 mutableCopy];
            CFDictionarySetValue(v17, @"alternate-display-id", a3);
            [v16 removeObjectIdenticalTo:v15];
            [v16 addObject:v17];

            if (v16) {
              objc_msgSend((id)objc_msgSend((id)qword_26AC13538, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID")), "setObject:forKey:", v16, a5);
            }
            goto LABEL_29;
          }
        }
        uint64_t v12 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    id v16 = 0;
LABEL_29:

    [(FaceTimeServiceSession *)self _setPurgeTimer];
  }
}

- (BOOL)_anyPeersForConferenceIDMayRequireBreakBeforeMake:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = objc_msgSend((id)objc_msgSend((id)qword_26AC13538, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID")), "objectForKey:", a3);
  if (!v3)
  {
    _IMWarn();
    return 0;
  }
  objc_super v4 = v3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = *(void *)v14;
  while (2)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v14 != v6) {
        objc_enumerationMutation(v4);
      }
      uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
      uint64_t v9 = (void *)[v8 objectForKey:@"protocol-flags"];
      uint64_t v10 = [v8 objectForKey:@"id"];
      if (([v9 unsignedIntegerValue] & 0x10) != 0)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v12 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v18 = v10;
            _os_log_impl(&dword_2378DA000, v12, OS_LOG_TYPE_INFO, "Peer: %@   requires break before make!", buf, 0xCu);
          }
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          _IMLoggingLog();
          if (_IMWillLog()) {
            _IMAlwaysLog();
          }
        }
        return 1;
      }
    }
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
    BOOL result = 0;
    if (v5) {
      continue;
    }
    break;
  }
  return result;
}

- (id)_peerIDPushTokenPairsForConferenceID:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  objc_super v4 = objc_msgSend((id)objc_msgSend((id)qword_26AC13538, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID")), "objectForKey:", a3);
  if (v4)
  {
    id v24 = a3;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = [v4 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v11 = objc_msgSend(v10, "objectForKey:", @"id", v22, v23);
          uint64_t v12 = [v10 objectForKey:@"push-token"];
          uint64_t v13 = v12;
          if (v11) {
            BOOL v14 = v12 == 0;
          }
          else {
            BOOL v14 = 1;
          }
          if (v14)
          {
            uint64_t v22 = v12;
            uint64_t v23 = v11;
            _IMWarn();
            long long v15 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v30 = v13;
              __int16 v31 = 2112;
              uint64_t v32 = v11;
              _os_log_impl(&dword_2378DA000, v15, OS_LOG_TYPE_DEFAULT, "Peer didn't have a token %@ or peer ID: %@", buf, 0x16u);
            }
            if (os_log_shim_legacy_logging_enabled())
            {
              if (MarcoShouldLog())
              {
                uint64_t v22 = v13;
                uint64_t v23 = v11;
                MarcoLog();
              }
              if (IMShouldLog())
              {
                uint64_t v22 = v13;
                uint64_t v23 = v11;
                IMLogString();
              }
            }
          }
          else
          {
            if (IMOSLoggingEnabled())
            {
              long long v17 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v30 = v13;
                __int16 v31 = 2112;
                uint64_t v32 = v11;
                _os_log_impl(&dword_2378DA000, v17, OS_LOG_TYPE_INFO, "Found token: %@ for peer ID: %@", buf, 0x16u);
              }
            }
            if (os_log_shim_legacy_logging_enabled())
            {
              _IMLoggingLog();
              if (_IMWillLog()) {
                _IMAlwaysLog();
              }
            }
            uint64_t v18 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v30 = v13;
              __int16 v31 = 2112;
              uint64_t v32 = v11;
              _os_log_impl(&dword_2378DA000, v18, OS_LOG_TYPE_DEFAULT, "Found token: %@ for peer ID: %@", buf, 0x16u);
            }
            if (os_log_shim_legacy_logging_enabled())
            {
              if (MarcoShouldLog()) {
                MarcoLog();
              }
              if (IMShouldLog()) {
                IMLogString();
              }
            }
            if (!v6) {
              id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
            }
            id v19 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", v11, @"id", v13, @"push-token", 0);
            [v6 addObject:v19];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v7);
    }
    if (!objc_msgSend(v6, "count", v22, v23))
    {
      uint64_t v20 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v30 = (uint64_t)v24;
        _os_log_impl(&dword_2378DA000, v20, OS_LOG_TYPE_DEFAULT, "Couldn't build peerID to push token map for cid: %@", buf, 0xCu);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog()) {
          MarcoLog();
        }
        if (IMShouldLog()) {
          IMLogString();
        }
      }
      _IMWarn();
    }
    return v6;
  }
  else
  {
    _IMWarn();
    return 0;
  }
}

- (id)_pushTokensForPeerID:(id)a3 conferenceID:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)qword_26AC13538, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID")), "objectForKey:", a4);
  if (v5)
  {
    id v6 = v5;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = 0;
    uint64_t v8 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if (objc_msgSend(a3, "isEqualToString:", objc_msgSend(v11, "objectForKey:", @"id", v18)))
          {
            uint64_t v12 = [v11 objectForKey:@"push-token"];
            if (v12)
            {
              if (IMOSLoggingEnabled())
              {
                uint64_t v13 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  uint64_t v25 = v12;
                  __int16 v26 = 2112;
                  id v27 = a3;
                  _os_log_impl(&dword_2378DA000, v13, OS_LOG_TYPE_INFO, "Found token: %@ for peer ID: %@", buf, 0x16u);
                }
              }
              if (os_log_shim_legacy_logging_enabled())
              {
                id v18 = (id)v12;
                id v19 = a3;
                _IMLoggingLog();
                if (_IMWillLog())
                {
                  id v18 = (id)v12;
                  id v19 = a3;
                  _IMAlwaysLog();
                }
              }
              BOOL v14 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v25 = v12;
                __int16 v26 = 2112;
                id v27 = a3;
                _os_log_impl(&dword_2378DA000, v14, OS_LOG_TYPE_DEFAULT, "Found token: %@ for peer ID: %@", buf, 0x16u);
              }
              if (os_log_shim_legacy_logging_enabled())
              {
                if (MarcoShouldLog())
                {
                  id v18 = (id)v12;
                  id v19 = a3;
                  MarcoLog();
                }
                if (IMShouldLog())
                {
                  id v18 = (id)v12;
                  id v19 = a3;
                  IMLogString();
                }
              }
              if (!v7) {
                id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
              }
              objc_msgSend(v7, "addObject:", v12, v18, v19);
            }
            else
            {
              id v18 = a3;
              _IMWarn();
              long long v15 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v25 = (uint64_t)a3;
                _os_log_impl(&dword_2378DA000, v15, OS_LOG_TYPE_DEFAULT, "Found no token for peer ID: %@", buf, 0xCu);
              }
              if (os_log_shim_legacy_logging_enabled())
              {
                if (MarcoShouldLog())
                {
                  id v18 = a3;
                  MarcoLog();
                }
                if (IMShouldLog())
                {
                  id v18 = a3;
                  IMLogString();
                }
              }
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v8);
    }
    if (!objc_msgSend(v7, "count", v18))
    {
      long long v16 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v25 = (uint64_t)a3;
        _os_log_impl(&dword_2378DA000, v16, OS_LOG_TYPE_DEFAULT, "Found no mapping at all for peer ID: %@", buf, 0xCu);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog()) {
          MarcoLog();
        }
        if (IMShouldLog()) {
          IMLogString();
        }
      }
      _IMWarn();
    }
    return v7;
  }
  else
  {
    _IMWarn();
    return 0;
  }
}

- (id)_pushTokenForPeerID:(id)a3 conferenceID:(id)a4
{
  id v4 = [(FaceTimeServiceSession *)self _pushTokensForPeerID:a3 conferenceID:a4];

  return (id)[v4 lastObject];
}

- (id)_peerIDsForDiplayID:(id)a3 conferenceID:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend((id)objc_msgSend((id)qword_26AC13538, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID")), "objectForKey:", a4);
  if (v6)
  {
    id v7 = (void *)v6;
    id v26 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v37 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v28 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v12 = objc_msgSend((id)objc_msgSend(v11, "objectForKey:", @"canonical-id", v23), "_stripFZIDPrefix");
          uint64_t v13 = [v11 objectForKey:@"alternate-display-id"];
          if (([v12 isEqualToString:a3] & 1) != 0
            || v13 && [a3 isEqualToString:v13])
          {
            uint64_t v14 = [v11 objectForKey:@"id"];
            if (v14)
            {
              long long v15 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412802;
                uint64_t v32 = v14;
                __int16 v33 = 2112;
                id v34 = a3;
                __int16 v35 = 2112;
                id v36 = v11;
                _os_log_impl(&dword_2378DA000, v15, OS_LOG_TYPE_DEFAULT, "Found peer ID: %@ for display ID: %@  (Peer info: %@)", buf, 0x20u);
              }
              if (os_log_shim_legacy_logging_enabled())
              {
                if (MarcoShouldLog())
                {
                  id v24 = a3;
                  uint64_t v25 = v11;
                  long long v23 = (void *)v14;
                  MarcoLog();
                }
                if (IMShouldLog())
                {
                  id v24 = a3;
                  uint64_t v25 = v11;
                  long long v23 = (void *)v14;
                  IMLogString();
                }
              }
              if (IMOSLoggingEnabled())
              {
                long long v16 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412802;
                  uint64_t v32 = v14;
                  __int16 v33 = 2112;
                  id v34 = a3;
                  __int16 v35 = 2112;
                  id v36 = v11;
                  _os_log_impl(&dword_2378DA000, v16, OS_LOG_TYPE_INFO, "Found peer ID: %@ for display ID: %@  (Peer info: %@)", buf, 0x20u);
                }
              }
              if (os_log_shim_legacy_logging_enabled())
              {
                id v24 = a3;
                uint64_t v25 = v11;
                long long v23 = (void *)v14;
                _IMLoggingLog();
                if (_IMWillLog())
                {
                  id v24 = a3;
                  uint64_t v25 = v11;
                  long long v23 = (void *)v14;
                  _IMAlwaysLog();
                }
              }
              objc_msgSend(v26, "addObject:", v14, v23, v24, v25);
            }
            else
            {
              if (IMOSLoggingEnabled())
              {
                long long v17 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v32 = (uint64_t)v11;
                  _os_log_impl(&dword_2378DA000, v17, OS_LOG_TYPE_INFO, "Found no ref ID in peer info: %@", buf, 0xCu);
                }
              }
              if (os_log_shim_legacy_logging_enabled())
              {
                _IMLoggingLog();
                if (_IMWillLog()) {
                  _IMAlwaysLog();
                }
              }
              long long v23 = v11;
              _IMWarn();
            }
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v37 count:16];
      }
      while (v8);
    }
    if (objc_msgSend(v26, "count", v23))
    {
      id v18 = v26;
    }
    else
    {
      _IMWarn();
      if (IMOSLoggingEnabled())
      {
        long long v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v32 = (uint64_t)a3;
          _os_log_impl(&dword_2378DA000, v21, OS_LOG_TYPE_INFO, "Found no peers for display ID: %@", buf, 0xCu);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        _IMLoggingLog();
        if (_IMWillLog()) {
          _IMAlwaysLog();
        }
      }
      long long v22 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v32 = (uint64_t)a3;
        _os_log_impl(&dword_2378DA000, v22, OS_LOG_TYPE_DEFAULT, "Found no peers for display ID: %@", buf, 0xCu);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog()) {
          MarcoLog();
        }
        if (IMShouldLog()) {
          IMLogString();
        }
      }

      id v18 = 0;
    }
    return (id)[v18 allObjects];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v32 = (uint64_t)a3;
        __int16 v33 = 2112;
        id v34 = a4;
        _os_log_impl(&dword_2378DA000, v19, OS_LOG_TYPE_INFO, "No peers found for display id: %@  cid: %@", buf, 0x16u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
    }
    _IMWarn();
    return 0;
  }
}

- (id)_peerIDForDiplayID:(id)a3 conferenceID:(id)a4
{
  id v4 = [(FaceTimeServiceSession *)self _peerIDsForDiplayID:a3 conferenceID:a4];

  return (id)[v4 lastObject];
}

- (id)_peerIDPushTokensPairsForPeerID:(id)a3 conferenceID:(id)a4 skippingPairs:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v9 = [(FaceTimeServiceSession *)self _peerIDPushTokenPairsForConferenceID:a4];
  id v10 = [(FaceTimeServiceSession *)self pushToken];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v9);
        }
        long long v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v16 = [v15 objectForKey:@"push-token"];
        if (([a5 containsObject:v15] & 1) == 0
          && (!v10 || ([v10 isEqual:v16] & 1) == 0))
        {
          [v8 addObject:v15];
        }
      }
      uint64_t v12 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }
  if (![v8 count])
  {

    id v8 = 0;
  }
  return v8;
}

- (id)_peerInfoForDisplayID:(id)a3 conferenceID:(id)a4 skippingPairs:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v19 = a4;
  id v9 = [(FaceTimeServiceSession *)self _peerIDPushTokenPairsForConferenceID:a4];
  id v10 = [(FaceTimeServiceSession *)self pushToken];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v15 = [v14 objectForKey:@"push-token"];
        if (([a5 containsObject:v14] & 1) == 0
          && (!v10 || ([v10 isEqual:v15] & 1) == 0))
        {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v11);
  }
  if (![v8 count])
  {

    id v8 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      id v26 = a5;
      __int16 v27 = 2112;
      id v28 = a3;
      __int16 v29 = 2112;
      id v30 = v19;
      __int16 v31 = 2112;
      id v32 = v8;
      _os_log_impl(&dword_2378DA000, v16, OS_LOG_TYPE_INFO, "Skipping pairs: %@    for display id: %@   conference: %@  Built peer info: %@", buf, 0x2Au);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    _IMLoggingLog();
    if (_IMWillLog()) {
      _IMAlwaysLog();
    }
  }
  long long v17 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v26 = a5;
    __int16 v27 = 2112;
    id v28 = a3;
    __int16 v29 = 2112;
    id v30 = v19;
    __int16 v31 = 2112;
    id v32 = v8;
    _os_log_impl(&dword_2378DA000, v17, OS_LOG_TYPE_DEFAULT, "Skipping pairs: %@    for display id: %@   conference: %@  Built peer info: %@", buf, 0x2Au);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog()) {
      MarcoLog();
    }
    if (IMShouldLog()) {
      IMLogString();
    }
  }
  return v8;
}

- (void)_setConferenceIDMap:(id)a3 forToken:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (a3 && a4)
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)uint64_t v16 = a4;
        *(_WORD *)&v16[8] = 2112;
        *(void *)&v16[10] = a3;
        _os_log_impl(&dword_2378DA000, v7, OS_LOG_TYPE_INFO, "Setting token %@ for conference ID %@", buf, 0x16u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      id v11 = a4;
      id v13 = a3;
      _IMLoggingLog();
      if (_IMWillLog())
      {
        id v11 = a4;
        id v13 = a3;
        _IMAlwaysLog();
      }
    }
    conferenceIDMap = self->_conferenceIDMap;
    if (!conferenceIDMap)
    {
      conferenceIDMap = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      self->_conferenceIDMap = conferenceIDMap;
    }
    if ((unint64_t)[(NSMutableDictionary *)conferenceIDMap count] >= 0x15)
    {
      if (IMOSLoggingEnabled())
      {
        id v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          id v10 = self->_conferenceIDMap;
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)uint64_t v16 = 20;
          *(_WORD *)&v16[4] = 2112;
          *(void *)&v16[6] = v10;
          _os_log_impl(&dword_2378DA000, v9, OS_LOG_TYPE_INFO, "Max cache size of %d reached for conferenceIDMap. Removing all objects in conferenceIDMap %@", buf, 0x12u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        uint64_t v12 = 20;
        uint64_t v14 = self->_conferenceIDMap;
        _IMLoggingLog();
        if (_IMWillLog())
        {
          uint64_t v12 = 20;
          uint64_t v14 = self->_conferenceIDMap;
          _IMAlwaysLog();
        }
      }
      [(NSMutableDictionary *)self->_conferenceIDMap removeAllObjects];
    }
    [(NSMutableDictionary *)self->_conferenceIDMap setObject:a4 forKey:a3];
    [(FaceTimeServiceSession *)self _setPurgeTimer];
  }
}

- (void)_setInitiatedConference:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a3)
  {
    initiatedConferences = self->_initiatedConferences;
    if (!initiatedConferences)
    {
      initiatedConferences = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      self->_initiatedConferences = initiatedConferences;
    }
    if ((unint64_t)[(NSMutableArray *)initiatedConferences count] >= 0x15)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v6 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          id v7 = self->_initiatedConferences;
          *(_DWORD *)buf = 67109378;
          int v11 = 20;
          __int16 v12 = 2112;
          id v13 = v7;
          _os_log_impl(&dword_2378DA000, v6, OS_LOG_TYPE_INFO, "Max cache size of %d reached for initiatedConferences map. Removing all objects in initiatedConferences %@", buf, 0x12u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        uint64_t v8 = 20;
        id v9 = self->_initiatedConferences;
        _IMLoggingLog();
        if (_IMWillLog())
        {
          uint64_t v8 = 20;
          id v9 = self->_initiatedConferences;
          _IMAlwaysLog();
        }
      }
      [(NSMutableArray *)self->_initiatedConferences removeAllObjects];
    }
    [(NSMutableArray *)self->_initiatedConferences addObject:a3];
  }
}

- (id)_mappedSessionTokenForConferenceID:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_conferenceIDMap objectForKey:a3];
}

- (int)_callTypeForConferenceID:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)-[NSMutableDictionary objectForKey:](self->_callTypeMap, "objectForKey:");
  if (!v5)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        callTypeMap = self->_callTypeMap;
        *(_DWORD *)buf = 138412546;
        id v12 = a3;
        __int16 v13 = 2112;
        uint64_t v14 = callTypeMap;
        _os_log_impl(&dword_2378DA000, v6, OS_LOG_TYPE_INFO, "Could not find call type for conference ID %@ in map: %@", buf, 0x16u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      id v9 = a3;
      id v10 = self->_callTypeMap;
      _IMLoggingLog();
      if (_IMWillLog())
      {
        id v9 = a3;
        id v10 = self->_callTypeMap;
        _IMAlwaysLog();
      }
    }
  }
  return objc_msgSend(v5, "intValue", v9, v10);
}

- (void)_setCallType:(int)a3 forConferenceID:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = @"unknown";
      if (!v5) {
        uint64_t v8 = @"video";
      }
      if (v5 == 1) {
        uint64_t v8 = @"audio";
      }
      *(_DWORD *)buf = 138412546;
      *(void *)long long v20 = v8;
      *(_WORD *)&v20[8] = 2112;
      *(void *)&v20[10] = a4;
      _os_log_impl(&dword_2378DA000, v7, OS_LOG_TYPE_INFO, "Setting call type to %@ for conference ID %@", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    id v9 = @"unknown";
    if (!v5) {
      id v9 = @"video";
    }
    if (v5 == 1) {
      id v10 = @"audio";
    }
    else {
      id v10 = v9;
    }
    uint64_t v15 = v10;
    id v17 = a4;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      uint64_t v15 = v10;
      id v17 = a4;
      _IMAlwaysLog();
    }
  }
  callTypeMap = self->_callTypeMap;
  if (!callTypeMap)
  {
    callTypeMap = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    self->_callTypeMap = callTypeMap;
  }
  if ((unint64_t)[(NSMutableDictionary *)callTypeMap count] >= 0x15)
  {
    if (IMOSLoggingEnabled())
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        __int16 v13 = self->_callTypeMap;
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)long long v20 = 20;
        *(_WORD *)&v20[4] = 2112;
        *(void *)&v20[6] = v13;
        _os_log_impl(&dword_2378DA000, v12, OS_LOG_TYPE_INFO, "Max cache size of %d reached for callTypeMap. Removing all objects in callTypeMap %@", buf, 0x12u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      uint64_t v16 = 20;
      long long v18 = self->_callTypeMap;
      _IMLoggingLog();
      if (_IMWillLog())
      {
        uint64_t v16 = 20;
        long long v18 = self->_callTypeMap;
        _IMAlwaysLog();
      }
    }
    [(NSMutableDictionary *)self->_callTypeMap removeAllObjects];
  }
  uint64_t v14 = (const void *)[NSNumber numberWithInt:v5];
  if (v14) {
    CFDictionarySetValue((CFMutableDictionaryRef)self->_callTypeMap, a4, v14);
  }
}

- (FaceTimeServiceSession)initWithAccount:(id)a3 service:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v29.receiver = self;
  v29.super_class = (Class)FaceTimeServiceSession;
  id v4 = [(IMDAppleServiceSession *)&v29 initWithAccount:a3 service:a4];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F49FF8]);
    v4->_callAccountController = (IDSAccountController *)[v5 initWithService:*MEMORY[0x263F49F98]];
    v4->_loggingCategory = (NSString *)@"FaceTime";
    uint64_t v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      loggingCategory = v4->_loggingCategory;
      uint64_t v8 = [(IMDAppleServiceSession *)v4 GUID];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = loggingCategory;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v8;
      _os_log_impl(&dword_2378DA000, v6, OS_LOG_TYPE_DEBUG, "Initializing FaceTime Session with category: %@   accountID: %@", buf, 0x16u);
    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      long long v24 = v4->_loggingCategory;
      uint64_t v26 = [(IMDAppleServiceSession *)v4 GUID];
      IMLogString();
    }
    objc_msgSend((id)qword_26AC13530, "addObject:", -[IMDAppleServiceSession GUID](v4, "GUID", v24, v26));
    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2378DA000, v9, OS_LOG_TYPE_INFO, "Priming FaceTime Server bag", buf, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
    }
    [MEMORY[0x263F4A0B8] sharedInstanceForBagType:0];
    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2378DA000, v10, OS_LOG_TYPE_INFO, "...done", buf, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
    }
    if (IMOSLoggingEnabled())
    {
      int v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2378DA000, v11, OS_LOG_TYPE_INFO, "Building push listener", buf, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
    }
    id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v13 = [(FaceTimeServiceSession *)v4 topicForCallType:1];
    if ([v13 length]) {
      [v12 addObject:v13];
    }
    id v14 = [(FaceTimeServiceSession *)v4 topicForCallType:0];
    if ([v14 length]) {
      [v12 addObject:v14];
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v12;
        _os_log_impl(&dword_2378DA000, v15, OS_LOG_TYPE_INFO, "  => Topics: %@", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      id v25 = v12;
      _IMLoggingLog();
      if (_IMWillLog())
      {
        id v25 = v12;
        _IMAlwaysLog();
      }
    }
    uint64_t v16 = [[FaceTimePushHandler alloc] initWithTopics:v12];
    v4->_ftPushHandler = v16;
    [(FaceTimePushHandler *)v16 addListener:v4];

    [(FaceTimePushHandler *)v4->_ftPushHandler configureAsMacNotificationCenterObserver:*MEMORY[0x263F4A8E8]];
    if (IMOSLoggingEnabled())
    {
      id v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2378DA000, v17, OS_LOG_TYPE_INFO, "...done", buf, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
    }
    if (IMOSLoggingEnabled())
    {
      long long v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2378DA000, v18, OS_LOG_TYPE_INFO, "Building Message delivery", buf, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
    }
    if (!qword_26AC13540)
    {
      if (IMOSLoggingEnabled())
      {
        id v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2378DA000, v19, OS_LOG_TYPE_INFO, "Building Message delivery", buf, 2u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        _IMLoggingLog();
        if (_IMWillLog()) {
          _IMAlwaysLog();
        }
      }
      qword_26AC13540 = (uint64_t)objc_alloc_init((Class)objc_msgSend(MEMORY[0x263F3BB28], "APNSMessageDeliveryClass", v25));
      [(id)qword_26AC13540 setUserAgent:@"com.apple.invitation-service"];
    }
    id v20 = objc_alloc_init(MEMORY[0x263F4A838]);
    v4->_broadcasterACInvocationQueue = v20;
    [v20 setProtocol:&unk_26EAA99F8];
    [v4->_broadcasterACInvocationQueue setDelegate:v4];
    [v4->_broadcasterACInvocationQueue setDequeueRate:0.1];
    id v21 = objc_alloc_init(MEMORY[0x263F4A838]);
    v4->_broadcasterVCInvocationQueue = v21;
    [v21 setProtocol:&unk_26EAA99F8];
    [v4->_broadcasterVCInvocationQueue setDelegate:v4];
    [v4->_broadcasterVCInvocationQueue setDequeueRate:0.1];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3052000000;
    __int16 v31 = sub_2378E0ED0;
    id v32 = sub_2378DBED0;
    __int16 v33 = v4;
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = sub_2378E0EE0;
    v28[3] = &unk_264CE7958;
    v28[4] = v4;
    v28[5] = buf;
    v4->_id completionBlock = (id)[v28 copy];
    if (IMOSLoggingEnabled())
    {
      long long v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)__int16 v27 = 0;
        _os_log_impl(&dword_2378DA000, v22, OS_LOG_TYPE_INFO, "...done", v27, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
    }
    _Block_object_dispose(buf, 8);
  }
  return v4;
}

- (id)pushToken
{
  return [(FaceTimePushHandler *)self->_ftPushHandler pushToken];
}

- (id)regionID
{
  v2 = [(IMDAppleServiceSession *)self idsAccount];
  if (!v2 || (id result = (id)[(IDSAccount *)v2 regionID]) == 0)
  {
    _IMWarn();
    return 0;
  }
  return result;
}

- (id)regionBasePhoneNumber
{
  v2 = [(IMDAppleServiceSession *)self idsAccount];
  if (!v2 || (id result = (id)[(IDSAccount *)v2 regionBasePhoneNumber]) == 0)
  {
    _IMWarn();
    return 0;
  }
  return result;
}

- (id)regionServerContext
{
  v2 = [(IMDAppleServiceSession *)self idsAccount];
  if (!v2 || (id result = (id)[(IDSAccount *)v2 regionServerContext]) == 0)
  {
    _IMWarn();
    return 0;
  }
  return result;
}

- (id)profileID
{
  v2 = [(IMDAppleServiceSession *)self idsAccount];
  if (!v2)
  {
    id v3 = 0;
LABEL_5:
    _IMWarn();
    return v3;
  }
  id v3 = (void *)[(IDSAccount *)v2 profileID];
  if (![v3 length]) {
    goto LABEL_5;
  }
  return v3;
}

- (id)userID
{
  v2 = [(IMDServiceSession *)self account];

  return (id)[(IMDAccount *)v2 loginID];
}

- (id)phoneNumber
{
  v2 = [(IMDAppleServiceSession *)self idsAccount];
  if (!v2)
  {
    id v3 = 0;
LABEL_5:
    _IMWarn();
    return v3;
  }
  id v3 = (void *)[(IDSAccount *)v2 loginID];
  if (![v3 length]) {
    goto LABEL_5;
  }
  return v3;
}

- (__SecKey)callerPrivateKey
{
  if (!self->_privateIdentityLoaded)
  {
    _IDSAppleRegistrationCopyKeyPair();
    self->_privateIdentityLoaded = 1;
  }
  id result = self->_privateKey;
  if (!result)
  {
    _IMWarn();
    return self->_privateKey;
  }
  return result;
}

- (id)idsAccountForCallType:(int)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (a3 == 1)
  {
    id v4 = [(IMDAppleServiceSession *)self idsAccount];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v5 = (void *)[(IDSAccountController *)self->_callAccountController accounts];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(v5);
          }
          int v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          int v12 = [v11 accountType];
          if (v12 == [(IDSAccount *)v4 accountType]
            && objc_msgSend((id)objc_msgSend(v11, "loginID"), "isEqualToIgnoringCase:", -[IDSAccount loginID](v4, "loginID"))&& objc_msgSend(v11, "registrationStatus") == 5)
          {
            uint64_t v8 = v11;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v7);
      if (v8) {
        return v8;
      }
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v13 = (void *)[(IDSAccountController *)self->_callAccountController accounts];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v8 = 0;
      uint64_t v16 = *(void *)v23;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          long long v18 = *(void **)(*((void *)&v22 + 1) + 8 * j);
          int v19 = [v18 accountType];
          if (v19 == [(IDSAccount *)v4 accountType]
            && [v18 registrationStatus] == 5)
          {
            uint64_t v8 = v18;
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v15);
      if (v8) {
        return v8;
      }
    }
    goto LABEL_30;
  }
  id v20 = [(IMDServiceSession *)self account];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_30:
    _IMWarn();
    return 0;
  }

  return (id)[(IMDAccount *)v20 idsAccount];
}

- (id)callerCertForCallType:(int)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = [(FaceTimeServiceSession *)self idsAccountForCallType:*(void *)&a3];
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v3;
      _os_log_impl(&dword_2378DA000, v4, OS_LOG_TYPE_INFO, "  =>  Found account: %@", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    id v8 = v3;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      id v8 = v3;
      _IMAlwaysLog();
    }
  }
  id v5 = objc_msgSend(v3, "registrationCertificate", v8);
  if (v5)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v10 = v5;
        _os_log_impl(&dword_2378DA000, v6, OS_LOG_TYPE_INFO, "  =>  Returning caller cert: %@", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
    }
  }
  else
  {
    _IMWarn();
  }
  return v5;
}

- (id)topicForCallType:(int)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = @"com.apple.private.ac";
  if (a3 != 1) {
    id v3 = 0;
  }
  if (a3) {
    id v4 = v3;
  }
  else {
    id v4 = @"com.apple.ess";
  }
  if ([(__CFString *)v4 length])
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v8 = v4;
        _os_log_impl(&dword_2378DA000, v5, OS_LOG_TYPE_INFO, "  =>  Returning topic: %@", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
    }
  }
  else
  {
    _IMWarn();
  }
  return v4;
}

- (BOOL)_checkAliasInfoAndFailIfNecessaryWithAction:(int64_t)a3 callType:(int)a4 conferenceID:(id)a5 withPerson:(id)a6 properties:(id)a7
{
  uint64_t v10 = *(void *)&a4;
  uint64_t v40 = *MEMORY[0x263EF8340];
  if (objc_msgSend(-[FaceTimeServiceSession idsAccountForCallType:](self, "idsAccountForCallType:", *(void *)&a4), "accountType") != 1)return 1; {
  int64_t v31 = a3;
  }
  id v13 = [(FaceTimeServiceSession *)self registeredURIs];
  uint64_t v14 = [(IMDServiceSession *)self accountDefaults];
  [(NSDictionary *)v14 objectForKey:*MEMORY[0x263F4A8D0]];
  uint64_t v15 = objc_msgSend(v13, "__imArrayByApplyingBlock:", &unk_26EA8B830);
  id v16 = (id)_IDSCopyCallerID();
  id v17 = objc_msgSend(v16, "_URIFromFZIDType:", objc_msgSend(v16, "_FZBestGuessFZIDType"));
  if (IMOSLoggingEnabled())
  {
    long long v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v33 = v16;
      __int16 v34 = 2112;
      id v35 = v17;
      __int16 v36 = 2112;
      uint64_t v37 = v15;
      _os_log_impl(&dword_2378DA000, v18, OS_LOG_TYPE_INFO, "Choosing callerID %@ callerURI %@ from aliases %@", buf, 0x20u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    long long v26 = v17;
    uint64_t v28 = v15;
    id v24 = v16;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      long long v26 = v17;
      uint64_t v28 = v15;
      id v24 = v16;
      _IMAlwaysLog();
    }
  }
  id v19 = -[FaceTimeServiceSession callerCertForCallType:](self, "callerCertForCallType:", v10, v24, v26, v28);
  if ([v17 length])
  {
    if ([v19 length]) {
      return 1;
    }
  }
  id v21 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v33 = v17;
    __int16 v34 = 2112;
    id v35 = v19;
    __int16 v36 = 2112;
    uint64_t v37 = (uint64_t)v16;
    __int16 v38 = 2112;
    id v39 = v13;
    _os_log_impl(&dword_2378DA000, v21, OS_LOG_TYPE_DEFAULT, "This conference invitation has bogus alias info! (callerURI: %@  Cert: %@  callerID: %@  bindings: %@)", buf, 0x2Au);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
    {
      id v29 = v16;
      id v30 = v13;
      long long v25 = v17;
      id v27 = v19;
      MarcoLog();
    }
    if (IMShouldLog())
    {
      id v29 = v16;
      id v30 = v13;
      long long v25 = v17;
      id v27 = v19;
      IMLogString();
    }
  }
  if (IMOSLoggingEnabled())
  {
    long long v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      id v33 = v17;
      __int16 v34 = 2112;
      id v35 = v19;
      __int16 v36 = 2112;
      uint64_t v37 = (uint64_t)v16;
      __int16 v38 = 2112;
      id v39 = v13;
      _os_log_impl(&dword_2378DA000, v22, OS_LOG_TYPE_INFO, "This conference invitation has bogus alias info! (callerURI: %@  Cert: %@  callerID: %@  bindings: %@)", buf, 0x2Au);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    id v29 = v16;
    id v30 = v13;
    long long v25 = v17;
    id v27 = v19;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      id v29 = v16;
      id v30 = v13;
      long long v25 = v17;
      id v27 = v19;
      _IMAlwaysLog();
    }
  }
  id v23 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if ([a5 length]) {
    [v23 setObject:a5 forKey:@"conference"];
  }
  if (objc_msgSend(a6, "length", v25, v27, v29, v30)) {
    [v23 setObject:a6 forKey:@"ID"];
  }
  if (a7) {
    [v23 setObject:a7 forKey:@"properties"];
  }
  objc_msgSend(-[IMDServiceSession broadcaster](self, "broadcaster"), "account:postedError:", -[IMDServiceSession accountID](self, "accountID"), objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", *MEMORY[0x263F4A768], v31, v23));

  return 0;
}

- (BOOL)_checkConferenceIDAndFailIfNecessaryWithAction:(int64_t)a3 callType:(int)a4 conferenceID:(id)a5 withPerson:(id)a6 properties:(id)a7
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v12 = objc_msgSend(a5, "hasPrefix:", @"ConferenceID:", *(void *)&a4);
  if (v12)
  {
    id v13 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = a5;
      _os_log_impl(&dword_2378DA000, v13, OS_LOG_TYPE_DEFAULT, "This conference ID (%@) is bogus, failing this message", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        id v17 = a5;
        MarcoLog();
      }
      if (IMShouldLog())
      {
        id v17 = a5;
        IMLogString();
      }
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = a5;
        _os_log_impl(&dword_2378DA000, v14, OS_LOG_TYPE_INFO, "Conference ID is bogus: %@", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      id v17 = a5;
      _IMLoggingLog();
      if (_IMWillLog())
      {
        id v17 = a5;
        _IMAlwaysLog();
      }
    }
    id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    if ([a5 length]) {
      [v15 setObject:a5 forKey:@"conference"];
    }
    if (objc_msgSend(a6, "length", v17)) {
      [v15 setObject:a6 forKey:@"ID"];
    }
    if (a7) {
      [v15 setObject:a7 forKey:@"properties"];
    }
    objc_msgSend(-[IMDServiceSession broadcaster](self, "broadcaster"), "account:postedError:", -[IMDServiceSession accountID](self, "accountID"), objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", *MEMORY[0x263F4A768], a3, v15));
  }
  return v12 ^ 1;
}

- (BOOL)_checkCanSendRequestsAndFailIfNecessaryAction:(int64_t)a3 callType:(int)a4 conferenceID:(id)a5 withPerson:(id)a6 properties:(id)a7
{
  BOOL v12 = [(FaceTimeServiceSession *)self _validRegistrationStateToMakeCalls];
  if (!v12)
  {
    id v13 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2378DA000, v13, OS_LOG_TYPE_DEFAULT, "The device is not allowed to make calls now", buf, 2u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog()) {
        MarcoLog();
      }
      if (IMShouldLog()) {
        IMLogString();
      }
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v17 = 0;
        _os_log_impl(&dword_2378DA000, v14, OS_LOG_TYPE_INFO, "The device is not allowed to make calls now", v17, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
    }
    id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v15 setObject:&unk_26EA924E0 forKey:@"internalCode"];
    if ([a5 length]) {
      [v15 setObject:a5 forKey:@"conference"];
    }
    if ([a6 length]) {
      [v15 setObject:a6 forKey:@"ID"];
    }
    if (a7) {
      [v15 setObject:a7 forKey:@"properties"];
    }
    objc_msgSend(-[IMDServiceSession broadcaster](self, "broadcaster"), "account:postedError:", -[IMDServiceSession accountID](self, "accountID"), objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", *MEMORY[0x263F4A768], a3, v15));
  }
  return v12;
}

- (BOOL)_checkManagedProfileAndFailIfNecessaryAction:(int64_t)a3 callType:(int)a4 conferenceID:(id)a5 withPerson:(id)a6 properties:(id)a7
{
  BOOL v12 = [(IMDServiceSession *)self allowedAsChild];
  if (!v12)
  {
    id v13 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2378DA000, v13, OS_LOG_TYPE_DEFAULT, "The device has a managed profile, not allowed", buf, 2u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog()) {
        MarcoLog();
      }
      if (IMShouldLog()) {
        IMLogString();
      }
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v17 = 0;
        _os_log_impl(&dword_2378DA000, v14, OS_LOG_TYPE_INFO, "The device has a managed profile, not allowed", v17, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
    }
    id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v15 setObject:&unk_26EA924F8 forKey:@"internalCode"];
    if ([a5 length]) {
      [v15 setObject:a5 forKey:@"conference"];
    }
    if ([a6 length]) {
      [v15 setObject:a6 forKey:@"ID"];
    }
    if (a7) {
      [v15 setObject:a7 forKey:@"properties"];
    }
    objc_msgSend(-[IMDServiceSession broadcaster](self, "broadcaster"), "account:postedError:", -[IMDServiceSession accountID](self, "accountID"), objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", *MEMORY[0x263F4A768], a3, v15));
  }
  return v12;
}

- (BOOL)_checkBadPushToken:(id)a3
{
  id v4 = [(FaceTimeServiceSession *)self pushToken];
  LOBYTE(v5) = 1;
  if (a3 && v4)
  {
    if (objc_msgSend(a3, "isEqual:"))
    {
      uint64_t v6 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2378DA000, v6, OS_LOG_TYPE_DEFAULT, "Received push to myself, from myself - ignoring", buf, 2u);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog()) {
          MarcoLog();
        }
        if (IMShouldLog()) {
          IMLogString();
        }
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v9 = 0;
          _os_log_impl(&dword_2378DA000, v7, OS_LOG_TYPE_INFO, "Received push to myself, from myself - ignoring", v9, 2u);
        }
      }
      int v5 = os_log_shim_legacy_logging_enabled();
      if (v5)
      {
        _IMLoggingLog();
        int v5 = _IMWillLog();
        if (v5)
        {
          _IMAlwaysLog();
          LOBYTE(v5) = 0;
        }
      }
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (BOOL)_checkForBadPeerIDWithAction:(int64_t)a3 callType:(int)a4 conferenceID:(id)a5 withPerson:(id)a6 properties:(id)a7 peerID:(id)a8
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v13 = objc_msgSend((id)objc_msgSend(a8, "_stripFZIDPrefix", a3, *(void *)&a4), "length");
  if (!v13)
  {
    uint64_t v14 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = a6;
      _os_log_impl(&dword_2378DA000, v14, OS_LOG_TYPE_DEFAULT, "Bad peer ID supplied for person ID: %@", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        id v19 = a6;
        MarcoLog();
      }
      if (IMShouldLog())
      {
        id v19 = a6;
        IMLogString();
      }
    }
    if (IMOSLoggingEnabled())
    {
      id v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = a6;
        _os_log_impl(&dword_2378DA000, v15, OS_LOG_TYPE_INFO, "Bad peer ID supplied for person ID: %@", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      id v19 = a6;
      _IMLoggingLog();
      if (_IMWillLog())
      {
        id v19 = a6;
        _IMAlwaysLog();
      }
    }
    if (IMOSLoggingEnabled())
    {
      id v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = (id)qword_26AC13538;
        _os_log_impl(&dword_2378DA000, v16, OS_LOG_TYPE_INFO, "Conference Map: %@", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      id v19 = (id)qword_26AC13538;
      _IMLoggingLog();
      if (_IMWillLog())
      {
        id v19 = (id)qword_26AC13538;
        _IMAlwaysLog();
      }
    }
    id v17 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v17 setObject:&unk_26EA92510 forKey:@"internalCode"];
    if ([a5 length]) {
      [v17 setObject:a5 forKey:@"conference"];
    }
    if (objc_msgSend(a6, "length", v19)) {
      [v17 setObject:a6 forKey:@"ID"];
    }
    if (a7) {
      [v17 setObject:a7 forKey:@"properties"];
    }
    objc_msgSend(-[IMDServiceSession broadcaster](self, "broadcaster"), "account:postedError:", -[IMDServiceSession accountID](self, "accountID"), objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", *MEMORY[0x263F4A768], a3, v17));
  }
  return v13 != 0;
}

- (BOOL)_checkRegistrationAndFailIfNecessaryAction:(int64_t)a3 callType:(int)a4 conferenceID:(id)a5 withPerson:(id)a6 properties:(id)a7
{
  BOOL v12 = [(IMDAppleServiceSession *)self _isDeviceRegistered];
  if (!v12)
  {
    uint64_t v13 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2378DA000, v13, OS_LOG_TYPE_DEFAULT, "The device is not registered, failing this message", buf, 2u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog()) {
        MarcoLog();
      }
      if (IMShouldLog()) {
        IMLogString();
      }
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v17 = 0;
        _os_log_impl(&dword_2378DA000, v14, OS_LOG_TYPE_INFO, "Device is not registered, failing", v17, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
    }
    id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v15 setObject:&unk_26EA92528 forKey:@"internalCode"];
    if ([a5 length]) {
      [v15 setObject:a5 forKey:@"conference"];
    }
    if ([a6 length]) {
      [v15 setObject:a6 forKey:@"ID"];
    }
    if (a7) {
      [v15 setObject:a7 forKey:@"properties"];
    }
    objc_msgSend(-[IMDServiceSession broadcaster](self, "broadcaster"), "account:postedError:", -[IMDServiceSession accountID](self, "accountID"), objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", *MEMORY[0x263F4A768], a3, v15));
  }
  return v12;
}

- (BOOL)_registrationSupportedForRegistration
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F4A840], "sharedInstance"), "isExpired"))
  {
    if (IMOSLoggingEnabled())
    {
      v2 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2378DA000, v2, OS_LOG_TYPE_INFO, "*** Lockdown state is expired, not allowing registration", buf, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
    }
    id v3 = OSLogHandleForRegistrationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2378DA000, v3, OS_LOG_TYPE_ERROR, "*** Lockdown state is expired, not allowing registration", buf, 2u);
    }
    if (os_log_shim_legacy_logging_enabled()) {
      IMLogString();
    }
    LOBYTE(v4) = 0;
  }
  else
  {
    int v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F3BB18], "sharedInstance"), "registrationSupported");
    int v5 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = @"NO";
      if (v4) {
        uint64_t v6 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v9 = v6;
      _os_log_impl(&dword_2378DA000, v5, OS_LOG_TYPE_DEBUG, "Returning device support registration supported: %@", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
  }
  return v4;
}

- (BOOL)_validRegistrationStateToAcceptCalls
{
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F4A840], "sharedInstance"), "isExpired"))
  {
    id v3 = OSLogHandleForFaceTimeCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2378DA000, v3, OS_LOG_TYPE_DEFAULT, "*** Lockdown state is expired, not allowing accept", buf, 2u);
    }
    if (MarcoShouldLog()) {
      MarcoLog();
    }
    if ((_IMWillLog() & 1) == 0) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  if (![(FaceTimeServiceSession *)self _registrationSupportedForRegistration])
  {
    int v5 = OSLogHandleForFaceTimeCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_2378DA000, v5, OS_LOG_TYPE_DEFAULT, "Registration is not supported, we cannot accept calls", v13, 2u);
    }
    if (MarcoShouldLog()) {
      MarcoLog();
    }
    if ((_IMWillLog() & 1) == 0) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x263F4A868], "sharedInstance"), "isSetup") & 1) == 0)
  {
    uint64_t v6 = OSLogHandleForFaceTimeCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v12 = 0;
      _os_log_impl(&dword_2378DA000, v6, OS_LOG_TYPE_DEFAULT, "We're not restored from backup yet, we cannot accept calls", v12, 2u);
    }
    if (MarcoShouldLog()) {
      MarcoLog();
    }
    if ((_IMWillLog() & 1) == 0) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x263F4A840], "sharedInstance"), "isActivated") & 1) == 0)
  {
    uint64_t v7 = OSLogHandleForFaceTimeCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_2378DA000, v7, OS_LOG_TYPE_DEFAULT, "Locked down, we cannot accept calls", v11, 2u);
    }
    if (MarcoShouldLog()) {
      MarcoLog();
    }
    if ((_IMWillLog() & 1) == 0) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  if ([(IDSAccount *)[(IMDAppleServiceSession *)self idsAccount] accountType]
    || !objc_msgSend((id)objc_msgSend(MEMORY[0x263F3BB18], "sharedInstance"), "isTelephonyDevice")
    || (sub_2378E7FC0() & 1) != 0)
  {
    LOBYTE(v4) = 1;
    return v4;
  }
  id v8 = OSLogHandleForFaceTimeCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_2378DA000, v8, OS_LOG_TYPE_DEFAULT, "Not a valid sim state, we cannot accept calls", v10, 2u);
  }
  if (MarcoShouldLog()) {
    MarcoLog();
  }
  int v4 = _IMWillLog();
  if (v4)
  {
LABEL_32:
    _IMAlwaysLog();
LABEL_33:
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (id)registeredURIs
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = (void *)[MEMORY[0x263EFF9C0] set];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(FaceTimeServiceSession *)self idsAccounts];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "addObjectsFromArray:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8++), "registeredURIs"));
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  if ([v3 count])
  {
    IMDInconsistencyResolved();
    return (id)[v3 allObjects];
  }
  else
  {
    if ([(IMDServiceSession *)self isActive])
    {
      [(IMDServiceSession *)self accounts];
      IMDNoticedInconsistency();
    }
    return 0;
  }
}

- (BOOL)_validRegistrationStateToMakeCalls
{
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x263F4A840], "sharedInstance"), "isActivated") & 1) == 0)
  {
    id v4 = OSLogHandleForFaceTimeCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2378DA000, v4, OS_LOG_TYPE_DEFAULT, "*** Lockdown state is expired, not allowing calls", buf, 2u);
    }
    if (MarcoShouldLog()) {
      MarcoLog();
    }
    if ((_IMWillLog() & 1) == 0) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x263F4A868], "sharedInstance"), "isSetup") & 1) == 0)
  {
    uint64_t v5 = OSLogHandleForFaceTimeCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v13 = 0;
      _os_log_impl(&dword_2378DA000, v5, OS_LOG_TYPE_DEFAULT, "We're not restored from backup yet, we cannot make calls", v13, 2u);
    }
    if (MarcoShouldLog()) {
      MarcoLog();
    }
    if ((_IMWillLog() & 1) == 0) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  if (![(FaceTimeServiceSession *)self _registrationSupportedForRegistration])
  {
    uint64_t v6 = OSLogHandleForFaceTimeCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v12 = 0;
      _os_log_impl(&dword_2378DA000, v6, OS_LOG_TYPE_DEFAULT, "Registration is not supported, we cannot make calls", v12, 2u);
    }
    if (MarcoShouldLog()) {
      MarcoLog();
    }
    if ((_IMWillLog() & 1) == 0) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x263F4A840], "sharedInstance"), "isActivated") & 1) == 0)
  {
    uint64_t v7 = OSLogHandleForFaceTimeCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v11 = 0;
      _os_log_impl(&dword_2378DA000, v7, OS_LOG_TYPE_DEFAULT, "Locked down, we cannot make calls", v11, 2u);
    }
    if (MarcoShouldLog()) {
      MarcoLog();
    }
    if ((_IMWillLog() & 1) == 0) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  if ([(IDSAccount *)[(IMDAppleServiceSession *)self idsAccount] accountType]
    || !objc_msgSend((id)objc_msgSend(MEMORY[0x263F3BB18], "sharedInstance"), "isTelephonyDevice")
    || (sub_2378E8558() & 1) != 0)
  {
    LOBYTE(v3) = 1;
    return v3;
  }
  uint64_t v8 = OSLogHandleForFaceTimeCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v10 = 0;
    _os_log_impl(&dword_2378DA000, v8, OS_LOG_TYPE_DEFAULT, "Not a valid sim state, we cannot make calls", v10, 2u);
  }
  if (MarcoShouldLog()) {
    MarcoLog();
  }
  int v3 = _IMWillLog();
  if (v3)
  {
LABEL_32:
    _IMAlwaysLog();
LABEL_33:
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)_logLocalInfo
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v5 = [(FaceTimeServiceSession *)self registeredURIs];
    _os_log_impl(&dword_2378DA000, v3, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
    {
      [(FaceTimeServiceSession *)self registeredURIs];
      MarcoLog();
    }
    if (IMShouldLog())
    {
      [(FaceTimeServiceSession *)self registeredURIs];
      IMLogString();
    }
  }
}

- (void)_sendRejectToPeerID:(id)a3 peerToken:(id)a4 sessionToken:(id)a5 callType:(int)a6 reason:(int64_t)a7 clientInfo:(id)a8
{
  uint64_t v10 = *(void *)&a6;
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    uint64_t v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v24 = "-[FaceTimeServiceSession _sendRejectToPeerID:peerToken:sessionToken:callType:reason:clientInfo:]";
      __int16 v25 = 2112;
      uint64_t v26 = [NSString stringWithFormat:@"peerID: %@  peerToken: %@  sessionToken: %@  reason: %d  clientInfo: %@", a3, a4, a5, a7, a8];
      _os_log_impl(&dword_2378DA000, v15, OS_LOG_TYPE_INFO, "%s (%@)", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    uint64_t v16 = [NSString stringWithFormat:@"peerID: %@  peerToken: %@  sessionToken: %@  reason: %d  clientInfo: %@", a3, a4, a5, a7, a8];
    id v21 = "-[FaceTimeServiceSession _sendRejectToPeerID:peerToken:sessionToken:callType:reason:clientInfo:]";
    uint64_t v22 = v16;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      uint64_t v17 = [NSString stringWithFormat:@"peerID: %@  peerToken: %@  sessionToken: %@  reason: %d  clientInfo: %@", a3, a4, a5, a7, a8];
      id v21 = "-[FaceTimeServiceSession _sendRejectToPeerID:peerToken:sessionToken:callType:reason:clientInfo:]";
      uint64_t v22 = v17;
      _IMAlwaysLog();
    }
  }
  long long v18 = objc_alloc_init(FTRejectMessage);
  -[FTRejectMessage setReason:](v18, "setReason:", [NSNumber numberWithInteger:a7]);
  [(FTRejectMessage *)v18 setPeerID:a3];
  [(IDSBaseMessage *)v18 setClientInfo:a8];
  [(FTFaceTimeMessage *)v18 setSessionToken:a5];
  [(FTRejectMessage *)v18 setPeerPushToken:a4];
  [(FTRejectMessage *)v18 setSelfPushToken:[(FaceTimeServiceSession *)self pushToken]];
  [(IDSBaseMessage *)v18 setCompletionBlock:self->_completionBlock];
  [(FaceTimeServiceSession *)self _messageTimeoutTimeForMessage:v18];
  [(IDSBaseMessage *)v18 setTimeout:"setTimeout:"];
  [(FTIDSMessage *)v18 setIDCertificate:[(FaceTimeServiceSession *)self callerCertForCallType:v10]];
  [(FTIDSMessage *)v18 setIdentityPrivateKey:[(FaceTimeServiceSession *)self callerPrivateKey]];
  [(FTIDSMessage *)v18 setSelfURI:[(IMDAppleServiceSession *)self callerURI]];
  id v19 = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v20 = (const void *)[MEMORY[0x263EFF910] date];
  if (v20) {
    CFDictionarySetValue(v19, @"sendDate", v20);
  }
  -[IDSBaseMessage setUserInfo:](v18, "setUserInfo:", v19, v21, v22);
  [(IDSBaseMessage *)v18 setTopic:[(FaceTimeServiceSession *)self topicForCallType:v10]];
  if (v18) {
    [(id)qword_26AC13540 sendMessage:v18];
  }
}

- (void)_cancelVCRequestWithPerson:(id)a3 properties:(id)a4 conference:(id)a5 pairsToSkip:(id)a6 reason:(id)a7
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    long long v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413314;
      uint64_t v44 = (uint64_t)a3;
      __int16 v45 = 2112;
      id v46 = a5;
      __int16 v47 = 2112;
      id v48 = a4;
      __int16 v49 = 2112;
      id v50 = a6;
      __int16 v51 = 2112;
      id v52 = a7;
      _os_log_impl(&dword_2378DA000, v13, OS_LOG_TYPE_INFO, "cancelVCRequestWithPerson: %@  conference: %@ properties: %@ pairsToSkip: %@ reason: %@", buf, 0x34u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    id v38 = a6;
    id v40 = a7;
    id v33 = a5;
    id v36 = a4;
    id v30 = a3;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      id v38 = a6;
      id v40 = a7;
      id v33 = a5;
      id v36 = a4;
      id v30 = a3;
      _IMAlwaysLog();
    }
  }
  id v14 = -[FaceTimeServiceSession _mappedSessionTokenForConferenceID:](self, "_mappedSessionTokenForConferenceID:", a5, v30, v33, v36, v38, v40);
  uint64_t v15 = [(FaceTimeServiceSession *)self _callTypeForConferenceID:a5];
  uint64_t v16 = (void *)[a4 objectForKey:*MEMORY[0x263F4A988]];
  uint64_t v17 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    long long v18 = @"unknown";
    if (!v15) {
      long long v18 = @"video";
    }
    *(_DWORD *)buf = 138413058;
    uint64_t v44 = (uint64_t)a3;
    if (v15 == 1) {
      long long v18 = @"audio";
    }
    __int16 v45 = 2112;
    id v46 = v18;
    __int16 v47 = 2112;
    id v48 = a5;
    __int16 v49 = 2112;
    id v50 = v16;
    _os_log_impl(&dword_2378DA000, v17, OS_LOG_TYPE_DEFAULT, "userID: %@  call type: %@  rid: %@ sessionID: %@", buf, 0x2Au);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
    {
      id v19 = @"unknown";
      if (!v15) {
        id v19 = @"video";
      }
      if (v15 == 1) {
        id v19 = @"audio";
      }
      id v37 = a5;
      id v39 = v16;
      id v31 = a3;
      __int16 v34 = v19;
      MarcoLog();
    }
    if (IMShouldLog())
    {
      uint64_t v20 = @"unknown";
      if (!v15) {
        uint64_t v20 = @"video";
      }
      if (v15 == 1) {
        uint64_t v20 = @"audio";
      }
      id v37 = a5;
      id v39 = v16;
      id v31 = a3;
      __int16 v34 = v20;
      IMLogString();
    }
  }
  if (-[FaceTimeServiceSession _checkRegistrationAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:](self, "_checkRegistrationAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:", 3, v15, a5, a3, 0, v31, v34, v37, v39)&& [(FaceTimeServiceSession *)self _checkManagedProfileAndFailIfNecessaryAction:3 callType:v15 conferenceID:a5 withPerson:a3 properties:0]
    && [(FaceTimeServiceSession *)self _checkCanSendRequestsAndFailIfNecessaryAction:3 callType:v15 conferenceID:a5 withPerson:a3 properties:0]&& [(FaceTimeServiceSession *)self _checkAliasInfoAndFailIfNecessaryWithAction:3 callType:v15 conferenceID:a5 withPerson:a3 properties:0])
  {
    id v21 = [(FaceTimeServiceSession *)self _peerInfoForDisplayID:a3 conferenceID:a5 skippingPairs:a6];
    if ([v21 count]) {
      goto LABEL_41;
    }
    uint64_t v41 = objc_msgSend(-[FaceTimeServiceSession _mappedSessionTokenForConferenceID:](self, "_mappedSessionTokenForConferenceID:", a5), "__imHexString");
    if (v41 && (objc_msgSend(a5, "isEqualToString:") & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v44 = v41;
          __int16 v45 = 2112;
          id v46 = a5;
          _os_log_impl(&dword_2378DA000, v22, OS_LOG_TYPE_INFO, "New conference ID %@ for %@, finding peers", buf, 0x16u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        id v32 = (id)v41;
        id v35 = a5;
        _IMLoggingLog();
        if (_IMWillLog())
        {
          id v32 = (id)v41;
          id v35 = a5;
          _IMAlwaysLog();
        }
      }
      id v21 = -[FaceTimeServiceSession _peerInfoForDisplayID:conferenceID:skippingPairs:](self, "_peerInfoForDisplayID:conferenceID:skippingPairs:", a3, v41, a6, v32, v35);
    }
    if ([v21 count])
    {
LABEL_41:
      id v42 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      *(_DWORD *)buf = [v16 unsignedIntValue];
      objc_msgSend(v42, "setObject:forKey:", objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", buf, 4), @"s");
      id v23 = objc_alloc_init(FTCancelMessage);
      if (!v14) {
        id v14 = (id)objc_msgSend(MEMORY[0x263EFF8F8], "__imDataWithHexString:", a5);
      }
      [(FTFaceTimeMessage *)v23 setSessionToken:v14];
      [(FTCancelMessage *)v23 setReason:a7];
      [(FTCancelMessage *)v23 setPeers:v21];
      [(IDSBaseMessage *)v23 setClientInfo:v42];
      id v24 = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      __int16 v25 = v24;
      if (a3) {
        CFDictionarySetValue(v24, @"ID", a3);
      }
      if (a5) {
        CFDictionarySetValue(v25, @"conference", a5);
      }
      uint64_t v26 = (const void *)[MEMORY[0x263EFF910] date];
      if (v26) {
        CFDictionarySetValue(v25, @"sendDate", v26);
      }
      [(IDSBaseMessage *)v23 setTopic:[(FaceTimeServiceSession *)self topicForCallType:v15]];
      [(IDSBaseMessage *)v23 setUserInfo:v25];
      [(IDSBaseMessage *)v23 setCompletionBlock:self->_completionBlock];
      [(FaceTimeServiceSession *)self _messageTimeoutTimeForMessage:v23];
      [(IDSBaseMessage *)v23 setTimeout:"setTimeout:"];
      [(FTIDSMessage *)v23 setIDCertificate:[(FaceTimeServiceSession *)self callerCertForCallType:v15]];
      [(FTIDSMessage *)v23 setIdentityPrivateKey:[(FaceTimeServiceSession *)self callerPrivateKey]];
      [(FTIDSMessage *)v23 setSelfURI:[(IMDAppleServiceSession *)self callerURI]];
      if (IMOSLoggingEnabled())
      {
        uint64_t v27 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v44 = (uint64_t)a3;
          _os_log_impl(&dword_2378DA000, v27, OS_LOG_TYPE_INFO, "Sending cancel invitation to: %@", buf, 0xCu);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        id v32 = a3;
        _IMLoggingLog();
        if (_IMWillLog())
        {
          id v32 = a3;
          _IMAlwaysLog();
        }
      }
      if (MarcoShouldLogCheckpoints())
      {
        id v32 = a3;
        MarcoNoteCheckpoint();
      }
      objc_msgSend((id)qword_26AC13540, "sendMessage:", v23, v32);
    }
    else
    {
      if ([(FaceTimeServiceSession *)self _hasOutgoingInvitationInFlight])
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v28 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v44 = (uint64_t)a5;
            _os_log_impl(&dword_2378DA000, v28, OS_LOG_TYPE_INFO, "Delaying cancel for cid %@", buf, 0xCu);
          }
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          _IMLoggingLog();
          if (_IMWillLog()) {
            _IMAlwaysLog();
          }
        }
        im_dispatch_after();
      }
      if (IMOSLoggingEnabled())
      {
        id v29 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2378DA000, v29, OS_LOG_TYPE_INFO, "No peers to send cancel invitation to, ignoring", buf, 2u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        _IMLoggingLog();
        if (_IMWillLog()) {
          _IMAlwaysLog();
        }
      }
      if (MarcoShouldLogCheckpoints()) {
        MarcoNoteCheckpoint();
      }
    }
  }
}

- (void)requestVCWithPerson:(id)a3 properties:(id)a4 conference:(id)a5
{
  uint64_t v101 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v94 = a3;
      __int16 v95 = 2112;
      id v96 = a4;
      __int16 v97 = 2112;
      uint64_t v98 = (uint64_t)a5;
      _os_log_impl(&dword_2378DA000, v8, OS_LOG_TYPE_INFO, "requestVCWithPerson: %@  properties: %@ conference: %@", buf, 0x20u);
    }
  }
  id value = a3;
  id v80 = a5;
  if (os_log_shim_legacy_logging_enabled())
  {
    v66 = (NSString *)a4;
    id v69 = a5;
    id v62 = a3;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      v66 = (NSString *)a4;
      id v69 = a5;
      id v62 = a3;
      _IMAlwaysLog();
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = [(IMDAppleServiceSession *)self callerURI];
      *(_DWORD *)buf = 138412546;
      id v94 = a3;
      __int16 v95 = 2112;
      id v96 = v10;
      _os_log_impl(&dword_2378DA000, v9, OS_LOG_TYPE_INFO, "Sending invitation to: %@   from: %@", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    id v62 = a3;
    v66 = [(IMDAppleServiceSession *)self callerURI];
    _IMLoggingLog();
    if (_IMWillLog())
    {
      long long v11 = [(IMDAppleServiceSession *)self callerURI];
      id v62 = a3;
      v66 = v11;
      _IMAlwaysLog();
    }
  }
  if (MarcoShouldLogCheckpoints())
  {
    id v62 = a3;
    v66 = [(IMDAppleServiceSession *)self callerURI];
    MarcoNoteCheckpoint();
  }
  [(FaceTimeServiceSession *)self _logLocalInfo];
  uint64_t v12 = objc_msgSend(a3, "_URIFromFZIDType:", objc_msgSend(a3, "_FZBestGuessFZIDType"));
  uint64_t v13 = [a4 objectForKey:*MEMORY[0x263F4A908]];
  id v14 = (void *)[NSDictionary dictionaryWithPlistData:v13];
  uint64_t v15 = [v14 objectForKey:*MEMORY[0x263F4A918]];
  uint64_t v16 = [v14 objectForKey:*MEMORY[0x263F4A938]];
  uint64_t v17 = [v14 objectForKey:*MEMORY[0x263F4A930]];
  uint64_t v75 = [v14 objectForKey:*MEMORY[0x263F4A980]];
  v76 = (void *)[v14 objectForKey:*MEMORY[0x263F4A988]];
  long long v18 = (void *)[v14 objectForKey:*MEMORY[0x263F4A928]];
  id v19 = (void *)[v14 objectForKey:@"excludingPushTokens"];
  v78 = (void *)[a4 objectForKey:*MEMORY[0x263F4A8F0]];
  id v20 = (id)[a4 objectForKey:*MEMORY[0x263F4A940]];
  uint64_t v77 = [a4 objectForKey:*MEMORY[0x263F4A900]];
  unsigned int v79 = [v78 BOOLValue];
  if (-[FaceTimeServiceSession _checkRegistrationAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:](self, "_checkRegistrationAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:", 1, v79, a5, value, a4)&& -[FaceTimeServiceSession _checkManagedProfileAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:](self, "_checkManagedProfileAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:", 1, v79, a5, value, a4)&& -[FaceTimeServiceSession _checkCanSendRequestsAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:](self, "_checkCanSendRequestsAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:", 1,
         v79,
         a5,
         value,
         a4)
    && [(FaceTimeServiceSession *)self _checkAliasInfoAndFailIfNecessaryWithAction:1 callType:v79 conferenceID:a5 withPerson:value properties:a4]&& [(FaceTimeServiceSession *)self _checkForBadPeerIDWithAction:1 callType:v79 conferenceID:a5 withPerson:value properties:a4 peerID:v12])
  {
    id v21 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = @"video";
      *(_DWORD *)buf = 138413058;
      id v94 = value;
      if (v79) {
        uint64_t v22 = @"audio";
      }
      __int16 v95 = 2112;
      id v96 = v76;
      __int16 v97 = 2112;
      uint64_t v98 = (uint64_t)a4;
      __int16 v99 = 2112;
      v100 = v22;
      _os_log_impl(&dword_2378DA000, v21, OS_LOG_TYPE_DEFAULT, "userID: %@  sessionID: %@ props: %@   call type: %@", buf, 0x2Au);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        id v23 = @"video";
        if (v79) {
          id v23 = @"audio";
        }
        v70 = (NSData *)a4;
        v71 = v23;
        id v63 = value;
        id v67 = v76;
        MarcoLog();
      }
      if (IMShouldLog())
      {
        id v24 = @"video";
        if (v79) {
          id v24 = @"audio";
        }
        v70 = (NSData *)a4;
        v71 = v24;
        id v63 = value;
        id v67 = v76;
        IMLogString();
      }
    }
    id v73 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    if (v77)
    {
      v74 = objc_alloc_init(FTReInitiateMessage);
      if (v20) {
        id v25 = (id)objc_msgSend(MEMORY[0x263EFF8F8], "__imDataWithHexString:", v20);
      }
      else {
        id v25 = [(FaceTimeServiceSession *)self _mappedSessionTokenForConferenceID:a5];
      }
      -[FTFaceTimeMessage setSessionToken:](v74, "setSessionToken:", v25, v63, v67, v70, v71);
      if (IMOSLoggingEnabled())
      {
        uint64_t v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          uint64_t v27 = [(FTFaceTimeMessage *)v74 sessionToken];
          *(_DWORD *)buf = 138412802;
          id v94 = v20;
          __int16 v95 = 2112;
          id v96 = a5;
          __int16 v97 = 2112;
          uint64_t v98 = v27;
          _os_log_impl(&dword_2378DA000, v26, OS_LOG_TYPE_INFO, "existingConferenceID %@   conferenceID %@   sessionToken %@", buf, 0x20u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        id v67 = a5;
        v70 = [(FTFaceTimeMessage *)v74 sessionToken];
        id v63 = v20;
        _IMLoggingLog();
        if (_IMWillLog())
        {
          uint64_t v28 = [(FTFaceTimeMessage *)v74 sessionToken];
          id v67 = a5;
          v70 = (NSData *)v28;
          id v63 = v20;
          _IMAlwaysLog();
        }
      }
    }
    else
    {
      v74 = objc_alloc_init(FTInitiateMessage);
    }
    -[FTReInitiateMessage setSelfNATType:](v74, "setSelfNATType:", v16, v63, v67, v70);
    [(FTReInitiateMessage *)v74 setSelfNatIP:v17];
    [(FTReInitiateMessage *)v74 setSelfPushToken:[(FaceTimeServiceSession *)self pushToken]];
    [(FTReInitiateMessage *)v74 setSelfBlob:v15];
    id v29 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v30 = objc_alloc_init(MEMORY[0x263EFF980]);
    if (v77)
    {
      id v31 = objc_msgSend((id)qword_26AC13538, "objectForKey:", -[IMDAppleServiceSession GUID](self, "GUID"));
      id v32 = [v20 length] ? v20 : a5;
      id v33 = objc_msgSend((id)objc_msgSend(v31, "objectForKey:", v32), "lastObject");
      __int16 v34 = v33;
      if (v33)
      {
        uint64_t v72 = [v33 objectForKey:@"id"];
        uint64_t v35 = [v34 objectForKey:@"push-token"];
        if (IMOSLoggingEnabled())
        {
          id v36 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v94 = v34;
            _os_log_impl(&dword_2378DA000, v36, OS_LOG_TYPE_INFO, "Existing peer found %@", buf, 0xCu);
          }
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          _IMLoggingLog();
          if (_IMWillLog()) {
            _IMAlwaysLog();
          }
        }
        id v37 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", v72, @"id", v35, @"push-token", 0);
        [v29 addObject:v37];
      }
    }
    if (![v29 count])
    {
      id v38 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      if ([v18 count]) {
        objc_msgSend(v38, "addObjectsFromArray:", objc_msgSend(v18, "arrayByApplyingSelector:", sel__bestGuessURI));
      }
      long long v89 = 0u;
      long long v90 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      uint64_t v39 = [v38 countByEnumeratingWithState:&v87 objects:v92 count:16];
      if (v39)
      {
        uint64_t v40 = *(void *)v88;
        do
        {
          for (uint64_t i = 0; i != v39; ++i)
          {
            if (*(void *)v88 != v40) {
              objc_enumerationMutation(v38);
            }
            objc_msgSend(v29, "addObject:", objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", *(void *)(*((void *)&v87 + 1) + 8 * i), @"raw-id"));
          }
          uint64_t v39 = [v38 countByEnumeratingWithState:&v87 objects:v92 count:16];
        }
        while (v39);
      }
      long long v85 = 0u;
      long long v86 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      uint64_t v42 = [v19 countByEnumeratingWithState:&v83 objects:v91 count:16];
      if (v42)
      {
        uint64_t v43 = *(void *)v84;
        do
        {
          for (uint64_t j = 0; j != v42; ++j)
          {
            if (*(void *)v84 != v43) {
              objc_enumerationMutation(v19);
            }
            objc_msgSend(v30, "addObject:", objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", *(void *)(*((void *)&v83 + 1) + 8 * j), @"push-token"));
          }
          uint64_t v42 = [v19 countByEnumeratingWithState:&v83 objects:v91 count:16];
        }
        while (v42);
      }
    }
    if (IMOSLoggingEnabled())
    {
      __int16 v45 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v94 = v30;
        _os_log_impl(&dword_2378DA000, v45, OS_LOG_TYPE_INFO, "All peers %@", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      id v64 = v30;
      _IMLoggingLog();
      if (_IMWillLog())
      {
        id v64 = v30;
        _IMAlwaysLog();
      }
    }
    -[FTReInitiateMessage setPeers:](v74, "setPeers:", v29, v64);
    if (objc_opt_respondsToSelector())
    {
      if (IMOSLoggingEnabled())
      {
        id v46 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v94 = v30;
          _os_log_impl(&dword_2378DA000, v46, OS_LOG_TYPE_INFO, "Excluding push tokens %@", buf, 0xCu);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        id v65 = v30;
        _IMLoggingLog();
        if (_IMWillLog())
        {
          id v65 = v30;
          _IMAlwaysLog();
        }
      }
      -[FTReInitiateMessage setPushTokensToExclude:](v74, "setPushTokensToExclude:", v30, v65);
    }
    *(_DWORD *)buf = [v76 unsignedIntValue];
    objc_msgSend(v73, "setObject:forKey:", objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", buf, 4), @"s");
    *(_DWORD *)buf = [v78 unsignedIntValue];
    objc_msgSend(v73, "setObject:forKey:", objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", buf, 4), @"a");
    if (v77) {
      sub_2378EA870((void *)[NSNumber numberWithInt:1], v73);
    }
    if (v75)
    {
      [v73 setObject:v75 forKey:@"k"];
      objc_msgSend(v73, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", 1), @"kv");
    }
    sub_2378EA940((void *)[NSNumber numberWithInt:1], v73);
    *(_DWORD *)buf = objc_msgSend((id)objc_msgSend(NSNumber, "numberWithUnsignedInt:", 2), "unsignedIntValue");
    objc_msgSend(v73, "setObject:forKey:", objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", buf, 4), @"p");
    [(IDSBaseMessage *)v74 setClientInfo:v73];
    [(FTIDSMessage *)v74 setIDCertificate:[(FaceTimeServiceSession *)self callerCertForCallType:v79]];
    [(FTIDSMessage *)v74 setIdentityPrivateKey:[(FaceTimeServiceSession *)self callerPrivateKey]];
    [(FTIDSMessage *)v74 setSelfURI:[(IMDAppleServiceSession *)self callerURI]];
    __int16 v47 = (__CFDictionary *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F3BB18], "sharedInstance"), "CTNetworkInformation"), "mutableCopy");
    if (!v47) {
      __int16 v47 = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    int v48 = [(IDSAccount *)[(IMDAppleServiceSession *)self idsAccount] accountType];
    if (!v48)
    {
      id v52 = [(FaceTimeServiceSession *)self phoneNumber];
      v54 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v94 = v52;
        _os_log_impl(&dword_2378DA000, v54, OS_LOG_TYPE_DEFAULT, "Using base number: %@", buf, 0xCu);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog())
        {
          id v65 = v52;
          MarcoLog();
        }
        if (IMShouldLog())
        {
          id v65 = v52;
          IMLogString();
        }
      }
      goto LABEL_138;
    }
    if (v48 != 1)
    {
      v55 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2378DA000, v55, OS_LOG_TYPE_DEFAULT, "Local account used to call someone, unsupported", buf, 2u);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog()) {
          MarcoLog();
        }
        if (IMShouldLog()) {
          IMLogString();
        }
      }
      goto LABEL_140;
    }
    id v49 = [(FaceTimeServiceSession *)self regionID];
    if (v49) {
      CFDictionarySetValue(v47, @"region-id", v49);
    }
    id v50 = [(FaceTimeServiceSession *)self regionServerContext];
    if (v50) {
      CFDictionarySetValue(v47, @"extra", v50);
    }
    id v51 = [(FaceTimeServiceSession *)self regionBasePhoneNumber];
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F3BB18], "sharedInstance"), "isTelephonyDevice"))
    {
      id v52 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F3BB18], "sharedInstance"), "telephoneNumber");
      if ([v52 length])
      {
        uint64_t v53 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v94 = v52;
          __int16 v95 = 2112;
          id v96 = v51;
          _os_log_impl(&dword_2378DA000, v53, OS_LOG_TYPE_DEFAULT, "Using device number: %@ instead of base number: %@", buf, 0x16u);
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (MarcoShouldLog())
          {
            id v65 = v52;
            id v68 = v51;
            MarcoLog();
          }
          if (IMShouldLog())
          {
            id v65 = v52;
            id v68 = v51;
            IMLogString();
          }
        }
        goto LABEL_138;
      }
      v57 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v94 = v51;
        _os_log_impl(&dword_2378DA000, v57, OS_LOG_TYPE_DEFAULT, "No device number present, using base number: %@", buf, 0xCu);
      }
      if (!os_log_shim_legacy_logging_enabled()) {
        goto LABEL_137;
      }
      if (MarcoShouldLog())
      {
        id v65 = v51;
        MarcoLog();
      }
      if (!IMShouldLog())
      {
LABEL_137:
        id v52 = v51;
LABEL_138:
        if (v52) {
          CFDictionarySetValue(v47, @"base-phone-number", v52);
        }
LABEL_140:
        -[FTReInitiateMessage setRegionInformation:](v74, "setRegionInformation:", v47, v65, v68);
        v58 = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
        v59 = v58;
        if (value) {
          CFDictionarySetValue(v58, @"ID", value);
        }
        if (v76) {
          CFDictionarySetValue(v59, @"sessionID", v76);
        }
        if (a4) {
          CFDictionarySetValue(v59, @"properties", a4);
        }
        if (v80) {
          CFDictionarySetValue(v59, @"conference", v80);
        }
        v60 = (const void *)[MEMORY[0x263EFF910] date];
        if (v60) {
          CFDictionarySetValue(v59, @"sendDate", v60);
        }
        v61 = (const void *)objc_msgSend((id)objc_msgSend(MEMORY[0x263F4A760], "sharedDaemon", v60), "currentMessageContext");
        if (v61) {
          CFDictionarySetValue(v59, @"messageContext", v61);
        }
        [(IDSBaseMessage *)v74 setTopic:[(FaceTimeServiceSession *)self topicForCallType:v79]];
        [(IDSBaseMessage *)v74 setUserInfo:v59];

        [(IDSBaseMessage *)v74 setCompletionBlock:self->_completionBlock];
        [(FaceTimeServiceSession *)self _messageTimeoutTimeForMessage:v74];
        [(IDSBaseMessage *)v74 setTimeout:"setTimeout:"];
        [(id)qword_26AC13540 sendMessage:v74];

        return;
      }
    }
    else
    {
      v56 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v94 = v51;
        _os_log_impl(&dword_2378DA000, v56, OS_LOG_TYPE_DEFAULT, "This is not a telephony device, just using base number: %@", buf, 0xCu);
      }
      if (!os_log_shim_legacy_logging_enabled()) {
        goto LABEL_137;
      }
      if (MarcoShouldLog())
      {
        id v65 = v51;
        MarcoLog();
      }
      if (!IMShouldLog()) {
        goto LABEL_137;
      }
    }
    id v65 = v51;
    IMLogString();
    goto LABEL_137;
  }
}

- (void)respondToVCInvitationWithPerson:(id)a3 properties:(id)a4 conference:(id)a5
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  uint64_t v9 = [(FaceTimeServiceSession *)self _callTypeForConferenceID:a5];
  if (IMOSLoggingEnabled())
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      long long v11 = @"unknown";
      if (!v9) {
        long long v11 = @"video";
      }
      *(_DWORD *)buf = 138413058;
      id v52 = a3;
      if (v9 == 1) {
        long long v11 = @"audio";
      }
      __int16 v53 = 2112;
      id v54 = a4;
      __int16 v55 = 2112;
      *(void *)v56 = a5;
      *(_WORD *)&v56[8] = 2112;
      *(void *)&v56[10] = v11;
      _os_log_impl(&dword_2378DA000, v10, OS_LOG_TYPE_INFO, "respondToVCInvitationWithPerson: %@  properties: %@ conference: %@  callType: %@", buf, 0x2Au);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    uint64_t v12 = @"unknown";
    if (!v9) {
      uint64_t v12 = @"video";
    }
    if (v9 == 1) {
      uint64_t v13 = @"audio";
    }
    else {
      uint64_t v13 = v12;
    }
    id v42 = a5;
    uint64_t v44 = v13;
    id v35 = a3;
    id v39 = a4;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      id v42 = a5;
      uint64_t v44 = v13;
      id v35 = a3;
      id v39 = a4;
      _IMAlwaysLog();
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v52 = (id)qword_26AC13538;
      _os_log_impl(&dword_2378DA000, v14, OS_LOG_TYPE_INFO, "All conference maps %@", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    id v35 = (id)qword_26AC13538;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      id v35 = (id)qword_26AC13538;
      _IMAlwaysLog();
    }
  }
  id v15 = -[FaceTimeServiceSession _peerIDForDiplayID:conferenceID:](self, "_peerIDForDiplayID:conferenceID:", a3, a5, v35, v39, v42, v44);
  id v16 = [(FaceTimeServiceSession *)self _pushTokenForPeerID:v15 conferenceID:a5];
  uint64_t v17 = (void *)[a4 objectForKey:*MEMORY[0x263F4A970]];
  uint64_t v18 = [a4 objectForKey:*MEMORY[0x263F4A978]];
  id v19 = (void *)[NSDictionary dictionaryWithPlistData:v18];
  id value = (void *)[v19 objectForKey:*MEMORY[0x263F4A988]];
  if (IMOSLoggingEnabled())
  {
    id v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v52 = v19;
      _os_log_impl(&dword_2378DA000, v20, OS_LOG_TYPE_INFO, "Reponse dictionary: %@", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    id v36 = v19;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      id v36 = v19;
      _IMAlwaysLog();
    }
  }
  if (-[FaceTimeServiceSession _checkRegistrationAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:](self, "_checkRegistrationAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:", 4, v9, a5, a3, a4, v36)&& -[FaceTimeServiceSession _checkConferenceIDAndFailIfNecessaryWithAction:callType:conferenceID:withPerson:properties:](self, "_checkConferenceIDAndFailIfNecessaryWithAction:callType:conferenceID:withPerson:properties:", 4, v9, a5, a3, a4)&& -[FaceTimeServiceSession _checkManagedProfileAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:](self, "_checkManagedProfileAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:",
         4,
         v9,
         a5,
         a3,
         a4)
    && -[FaceTimeServiceSession _checkCanSendRequestsAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:](self, "_checkCanSendRequestsAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:", 4, v9, a5, a3, a4)&& -[FaceTimeServiceSession _checkAliasInfoAndFailIfNecessaryWithAction:callType:conferenceID:withPerson:properties:](self, "_checkAliasInfoAndFailIfNecessaryWithAction:callType:conferenceID:withPerson:properties:", 4, v9, a5, a3, a4)&& -[FaceTimeServiceSession _checkForBadPeerIDWithAction:callType:conferenceID:withPerson:properties:peerID:](self, "_checkForBadPeerIDWithAction:callType:conferenceID:withPerson:properties:peerID:", 4,
         v9,
         a5,
         a3,
         a4,
         v15))
  {
    id v48 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    theDict = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    if (a3) {
      CFDictionarySetValue(theDict, @"ID", a3);
    }
    if (v17) {
      CFDictionarySetValue(theDict, @"response", v17);
    }
    if (value) {
      CFDictionarySetValue(theDict, @"sessionID", value);
    }
    if (a4) {
      CFDictionarySetValue(theDict, @"properties", a4);
    }
    if (a5) {
      CFDictionarySetValue(theDict, @"conference", a5);
    }
    id v21 = (const void *)[MEMORY[0x263EFF910] date];
    if (v21) {
      CFDictionarySetValue(theDict, @"sendDate", v21);
    }
    uint64_t v22 = (const void *)objc_msgSend((id)objc_msgSend(MEMORY[0x263F4A760], "sharedDaemon", v21), "currentMessageContext");
    if (v22) {
      CFDictionarySetValue(theDict, @"messageContext", v22);
    }
    *(_DWORD *)buf = objc_msgSend(value, "unsignedIntValue", v22);
    objc_msgSend(v48, "setObject:forKey:", objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", buf, 4), @"s");
    sub_2378EA940((void *)[a4 objectForKey:*MEMORY[0x263F4A910]], v48);
    sub_2378EA8D4([v19 objectForKey:*MEMORY[0x263F4A980]], v48);
    *(_DWORD *)buf = objc_msgSend((id)objc_msgSend(NSNumber, "numberWithUnsignedInt:", 2), "unsignedIntValue");
    objc_msgSend(v48, "setObject:forKey:", objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", buf, 4), @"p");
    if (![v17 intValue])
    {
      id v49 = objc_alloc_init(FTAcceptMessage);
      [(IDSBaseMessage *)v49 setClientInfo:v48];
      -[FTFaceTimeMessage setSessionToken:](v49, "setSessionToken:", objc_msgSend(MEMORY[0x263EFF8F8], "__imDataWithHexString:", a5));
      [(FTAcceptMessage *)v49 setSelfPushToken:[(FaceTimeServiceSession *)self pushToken]];
      -[FTAcceptMessage setSelfBlob:](v49, "setSelfBlob:", [v19 objectForKey:*MEMORY[0x263F4A918]]);
      -[FTAcceptMessage setSelfNATType:](v49, "setSelfNATType:", [v19 objectForKey:*MEMORY[0x263F4A938]]);
      -[FTAcceptMessage setSelfNATIP:](v49, "setSelfNATIP:", [v19 objectForKey:*MEMORY[0x263F4A930]]);
      [(FTAcceptMessage *)v49 setPeerID:v15];
      [(FTAcceptMessage *)v49 setPeerPushToken:v16];
      -[FTAcceptMessage setPeerBlob:](v49, "setPeerBlob:", [v19 objectForKey:*MEMORY[0x263F4A948]]);
      -[FTAcceptMessage setPeerNATType:](v49, "setPeerNATType:", [v19 objectForKey:*MEMORY[0x263F4A960]]);
      -[FTAcceptMessage setPeerNATIP:](v49, "setPeerNATIP:", [v19 objectForKey:*MEMORY[0x263F4A958]]);
      if (IMOSLoggingEnabled())
      {
        uint64_t v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v52 = a3;
          __int16 v53 = 2112;
          id v54 = a5;
          _os_log_impl(&dword_2378DA000, v28, OS_LOG_TYPE_INFO, "Sending accept to: %@  for conference: %@", buf, 0x16u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        id v37 = a3;
        id v40 = a5;
        _IMLoggingLog();
        if (_IMWillLog())
        {
          id v37 = a3;
          id v40 = a5;
          _IMAlwaysLog();
        }
      }
      if (MarcoShouldLogCheckpoints())
      {
        id v37 = a3;
        id v40 = a5;
        MarcoNoteCheckpoint();
      }
      -[IDSBaseMessage setTopic:](v49, "setTopic:", -[FaceTimeServiceSession topicForCallType:](self, "topicForCallType:", v9, v37, v40));
      [(IDSBaseMessage *)v49 setUserInfo:theDict];
      [(IDSBaseMessage *)v49 setCompletionBlock:self->_completionBlock];
      [(FaceTimeServiceSession *)self _messageTimeoutTimeForMessage:v49];
      [(IDSBaseMessage *)v49 setTimeout:"setTimeout:"];
      [(FTIDSMessage *)v49 setIDCertificate:[(FaceTimeServiceSession *)self callerCertForCallType:v9]];
      [(FTIDSMessage *)v49 setIdentityPrivateKey:[(FaceTimeServiceSession *)self callerPrivateKey]];
      [(FTIDSMessage *)v49 setSelfURI:[(IMDAppleServiceSession *)self callerURI]];
      [(id)qword_26AC13540 sendMessage:v49];

      id v29 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        int v30 = [v17 intValue];
        *(_DWORD *)buf = 138413314;
        id v52 = a3;
        __int16 v53 = 2112;
        id v54 = value;
        __int16 v55 = 1024;
        *(_DWORD *)v56 = v30;
        *(_WORD *)&v56[4] = 2112;
        *(void *)&v56[6] = a4;
        *(_WORD *)&v56[14] = 2112;
        *(void *)&v56[16] = v48;
        _os_log_impl(&dword_2378DA000, v29, OS_LOG_TYPE_DEFAULT, "userID: %@  sessionID: %@ response: %d props: %@  client info: %@", buf, 0x30u);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (MarcoShouldLog())
        {
          id v45 = a4;
          id v46 = v48;
          uint64_t v41 = value;
          uint64_t v43 = [v17 intValue];
          id v38 = a3;
          MarcoLog();
        }
        if (IMShouldLog())
        {
          id v45 = a4;
          id v46 = v48;
          uint64_t v41 = value;
          uint64_t v43 = [v17 intValue];
          id v38 = a3;
          IMLogString();
        }
      }
      if (v9 == 1) {
        id v31 = [(IMDServiceSession *)self broadcasterForACConferenceListeners];
      }
      else {
        id v31 = [(IMDServiceSession *)self broadcasterForVCConferenceListeners];
      }
      objc_msgSend(v31, "account:conference:receivedAVMessage:from:sessionID:userInfo:", -[IMDServiceSession accountID](self, "accountID", v38, v41, v43, v45, v46), a5, 350, sub_2378E5AEC(a3), objc_msgSend(value, "unsignedIntValue"), 0);
      goto LABEL_100;
    }
    BOOL v23 = [v17 intValue] == 1;
    int v24 = IMOSLoggingEnabled();
    if (v23)
    {
      if (v24)
      {
        id v25 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v52 = a3;
          __int16 v53 = 2112;
          id v54 = a5;
          _os_log_impl(&dword_2378DA000, v25, OS_LOG_TYPE_INFO, "Sending decline to: %@  for conference: %@", buf, 0x16u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        id v37 = a3;
        id v40 = a5;
        _IMLoggingLog();
        if (_IMWillLog())
        {
          id v37 = a3;
          id v40 = a5;
          _IMAlwaysLog();
        }
      }
      if (MarcoShouldLogCheckpoints())
      {
        id v37 = a3;
        id v40 = a5;
        MarcoNoteCheckpoint();
      }
      uint64_t v26 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        int v27 = [v17 intValue];
        *(_DWORD *)buf = 138413058;
        id v52 = a3;
        __int16 v53 = 2112;
        id v54 = value;
        __int16 v55 = 1024;
        *(_DWORD *)v56 = v27;
        *(_WORD *)&v56[4] = 2112;
        *(void *)&v56[6] = a4;
        _os_log_impl(&dword_2378DA000, v26, OS_LOG_TYPE_DEFAULT, "userID: %@  sessionID: %@ response: %d props: %@", buf, 0x26u);
      }
      if (!os_log_shim_legacy_logging_enabled()) {
        goto LABEL_97;
      }
      if (MarcoShouldLog())
      {
        uint64_t v43 = [v17 intValue];
        id v45 = a4;
        id v37 = a3;
        id v40 = value;
        MarcoLog();
      }
      if ((IMShouldLog() & 1) == 0) {
        goto LABEL_97;
      }
    }
    else
    {
      if (v24)
      {
        id v32 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v52 = a3;
          __int16 v53 = 2112;
          id v54 = a5;
          _os_log_impl(&dword_2378DA000, v32, OS_LOG_TYPE_INFO, "Sending busy to: %@  for conference: %@", buf, 0x16u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        id v37 = a3;
        id v40 = a5;
        _IMLoggingLog();
        if (_IMWillLog())
        {
          id v37 = a3;
          id v40 = a5;
          _IMAlwaysLog();
        }
      }
      if (MarcoShouldLogCheckpoints())
      {
        id v37 = a3;
        id v40 = a5;
        MarcoNoteCheckpoint();
      }
      id v33 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        int v34 = [v17 intValue];
        *(_DWORD *)buf = 138413058;
        id v52 = a3;
        __int16 v53 = 2112;
        id v54 = value;
        __int16 v55 = 1024;
        *(_DWORD *)v56 = v34;
        *(_WORD *)&v56[4] = 2112;
        *(void *)&v56[6] = a4;
        _os_log_impl(&dword_2378DA000, v33, OS_LOG_TYPE_DEFAULT, "userID: %@  sessionID: %@ response: %d props: %@", buf, 0x26u);
      }
      if (!os_log_shim_legacy_logging_enabled()) {
        goto LABEL_97;
      }
      if (MarcoShouldLog())
      {
        uint64_t v43 = [v17 intValue];
        id v45 = a4;
        id v37 = a3;
        id v40 = value;
        MarcoLog();
      }
      if (!IMShouldLog()) {
        goto LABEL_97;
      }
    }
    uint64_t v43 = objc_msgSend(v17, "intValue", v37, v40, v43, v45);
    id v45 = a4;
    id v37 = a3;
    id v40 = value;
    IMLogString();
LABEL_97:
    -[FaceTimeServiceSession _sendRejectToPeerID:peerToken:sessionToken:callType:reason:clientInfo:](self, "_sendRejectToPeerID:peerToken:sessionToken:callType:reason:clientInfo:", v15, v16, objc_msgSend(MEMORY[0x263EFF8F8], "__imDataWithHexString:", a5, v37, v40, v43, v45), v9, (int)objc_msgSend(v17, "intValue"), v48);
LABEL_100:
  }
}

- (void)cancelVCRequestWithPerson:(id)a3 properties:(id)a4 conference:(id)a5 reason:(id)a6
{
}

- (void)sendAVMessageToPerson:(id)a3 sessionID:(unsigned int)a4 type:(unsigned int)a5 userInfo:(id)a6 conference:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a4;
  uint64_t v39 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)id v38 = v9;
      *(_WORD *)&v38[4] = 1024;
      *(_DWORD *)&v38[6] = v10;
      *(_WORD *)&v38[10] = 2112;
      *(void *)&v38[12] = a7;
      *(_WORD *)&v38[20] = 2112;
      *(void *)&v38[22] = a3;
      *(_WORD *)&v38[30] = 2112;
      *(void *)&v38[32] = a6;
      _os_log_impl(&dword_2378DA000, v13, OS_LOG_TYPE_INFO, "Request to send AV Message type: %d   for session ID: %u  for conference: %@  to person: %@  userInfo: %@", buf, 0x2Cu);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    id v34 = a3;
    id v36 = a6;
    uint64_t v30 = v10;
    id v32 = a7;
    uint64_t v27 = v9;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      id v34 = a3;
      id v36 = a6;
      uint64_t v30 = v10;
      id v32 = a7;
      uint64_t v27 = v9;
      _IMAlwaysLog();
    }
  }
  if ((v9 - 1000) < 2 || v9 == 1500)
  {
    id v14 = -[FaceTimeServiceSession _mappedSessionTokenForConferenceID:](self, "_mappedSessionTokenForConferenceID:", a7, v27, v30, v32, v34, v36);
    id v15 = (void *)[NSNumber numberWithUnsignedInt:v10];
    uint64_t v16 = [(FaceTimeServiceSession *)self _callTypeForConferenceID:a7];
    uint64_t v17 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = @"unknown";
      if (!v16) {
        uint64_t v18 = @"video";
      }
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)id v38 = v9;
      if (v16 == 1) {
        uint64_t v18 = @"audio";
      }
      *(_WORD *)&v38[4] = 2112;
      *(void *)&v38[6] = v18;
      *(_WORD *)&v38[14] = 2112;
      *(void *)&v38[16] = a3;
      *(_WORD *)&v38[24] = 2112;
      *(void *)&v38[26] = a6;
      _os_log_impl(&dword_2378DA000, v17, OS_LOG_TYPE_DEFAULT, "Sending AV Message type: %d callType: %@ to: %@ userInfo :%@", buf, 0x26u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        id v19 = @"unknown";
        if (!v16) {
          id v19 = @"video";
        }
        if (v16 == 1) {
          id v19 = @"audio";
        }
        id v33 = a3;
        id v35 = a6;
        uint64_t v28 = v9;
        id v31 = v19;
        MarcoLog();
      }
      if (IMShouldLog())
      {
        id v20 = @"unknown";
        if (!v16) {
          id v20 = @"video";
        }
        if (v16 == 1) {
          id v20 = @"audio";
        }
        id v33 = a3;
        id v35 = a6;
        uint64_t v28 = v9;
        id v31 = v20;
        IMLogString();
      }
    }
    if (-[FaceTimeServiceSession _checkRegistrationAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:](self, "_checkRegistrationAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:", 6, v16, a7, a3, 0, v28, v31, v33, v35)&& [(FaceTimeServiceSession *)self _checkManagedProfileAndFailIfNecessaryAction:6 callType:v16 conferenceID:a7 withPerson:a3 properties:0]
      && [(FaceTimeServiceSession *)self _checkCanSendRequestsAndFailIfNecessaryAction:6 callType:v16 conferenceID:a7 withPerson:a3 properties:0]&& [(FaceTimeServiceSession *)self _checkAliasInfoAndFailIfNecessaryWithAction:6 callType:v16 conferenceID:a7 withPerson:a3 properties:0])
    {
      id v21 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      *(_DWORD *)buf = [v15 unsignedIntValue];
      objc_msgSend(v21, "setObject:forKey:", objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", buf, 4), @"s");
      if (a6) {
        CFDictionarySetValue((CFMutableDictionaryRef)v21, @"info", a6);
      }
      uint64_t v22 = objc_alloc_init(FTSendMessage);
      if (!v14) {
        id v14 = (id)objc_msgSend(MEMORY[0x263EFF8F8], "__imDataWithHexString:", a7);
      }
      [(FTFaceTimeMessage *)v22 setSessionToken:v14];
      -[FTSendMessage setReason:](v22, "setReason:", [NSNumber numberWithInt:v9]);
      [(FTSendMessage *)v22 setPeers:[(FaceTimeServiceSession *)self _peerInfoForDisplayID:a3 conferenceID:a7 skippingPairs:0]];
      [(IDSBaseMessage *)v22 setClientInfo:v21];
      BOOL v23 = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      int v24 = v23;
      if (a3) {
        CFDictionarySetValue(v23, @"ID", a3);
      }
      if (a7) {
        CFDictionarySetValue(v24, @"conference", a7);
      }
      [(IDSBaseMessage *)v22 setTopic:[(FaceTimeServiceSession *)self topicForCallType:v16]];
      [(IDSBaseMessage *)v22 setUserInfo:v24];
      [(IDSBaseMessage *)v22 setCompletionBlock:self->_completionBlock];
      [(FaceTimeServiceSession *)self _messageTimeoutTimeForMessage:v22];
      [(IDSBaseMessage *)v22 setTimeout:"setTimeout:"];
      [(FTIDSMessage *)v22 setIDCertificate:[(FaceTimeServiceSession *)self callerCertForCallType:v16]];
      [(FTIDSMessage *)v22 setIdentityPrivateKey:[(FaceTimeServiceSession *)self callerPrivateKey]];
      [(FTIDSMessage *)v22 setSelfURI:[(IMDAppleServiceSession *)self callerURI]];
      [(FTSendMessage *)v22 setSelfPushToken:[(FaceTimeServiceSession *)self pushToken]];
      if (IMOSLoggingEnabled())
      {
        id v25 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)id v38 = a3;
          _os_log_impl(&dword_2378DA000, v25, OS_LOG_TYPE_INFO, "Sending generic message to: %@", buf, 0xCu);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        id v29 = a3;
        _IMLoggingLog();
        if (_IMWillLog())
        {
          id v29 = a3;
          _IMAlwaysLog();
        }
      }
      if (MarcoShouldLogCheckpoints())
      {
        id v29 = a3;
        MarcoNoteCheckpoint();
      }
      objc_msgSend((id)qword_26AC13540, "sendMessage:", v22, v29);
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)id v38 = v9;
        _os_log_impl(&dword_2378DA000, v26, OS_LOG_TYPE_INFO, " => Not sending, not supported message type: %d", buf, 8u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
    }
  }
}

- (void)relay:(id)a3 sendInitateRequest:(id)a4 toPerson:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v30 = a5;
      __int16 v31 = 2112;
      id v32 = a3;
      __int16 v33 = 2112;
      id v34 = a4;
      _os_log_impl(&dword_2378DA000, v9, OS_LOG_TYPE_INFO, "sendRelayInitateRequestTo: %@ relayID: %@  userInfo: %@", buf, 0x20u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    id v26 = a3;
    id v28 = a4;
    id v24 = a5;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      id v26 = a3;
      id v28 = a4;
      id v24 = a5;
      _IMAlwaysLog();
    }
  }
  id v10 = -[FaceTimeServiceSession _mappedSessionTokenForConferenceID:](self, "_mappedSessionTokenForConferenceID:", a3, v24, v26, v28);
  id v11 = [(FaceTimeServiceSession *)self _peerIDForDiplayID:a5 conferenceID:a3];
  id v12 = [(FaceTimeServiceSession *)self _pushTokenForPeerID:v11 conferenceID:a3];
  uint64_t v13 = [(FaceTimeServiceSession *)self _callTypeForConferenceID:a3];
  if (IMOSLoggingEnabled())
  {
    id v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = @"unknown";
      if (!v13) {
        id v15 = @"video";
      }
      if (v13 == 1) {
        id v15 = @"audio";
      }
      *(_DWORD *)buf = 138412546;
      id v30 = a5;
      __int16 v31 = 2112;
      id v32 = v15;
      _os_log_impl(&dword_2378DA000, v14, OS_LOG_TYPE_INFO, "Sending relay initate to: %@  callType: %@", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    uint64_t v16 = @"unknown";
    if (!v13) {
      uint64_t v16 = @"video";
    }
    if (v13 == 1) {
      uint64_t v17 = @"audio";
    }
    else {
      uint64_t v17 = v16;
    }
    id v25 = a5;
    uint64_t v27 = v17;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      id v25 = a5;
      uint64_t v27 = v17;
      _IMAlwaysLog();
    }
  }
  if (MarcoShouldLogCheckpoints())
  {
    uint64_t v18 = @"unknown";
    if (!v13) {
      uint64_t v18 = @"video";
    }
    if (v13 == 1) {
      uint64_t v18 = @"audio";
    }
    id v25 = a5;
    uint64_t v27 = v18;
    MarcoNoteCheckpoint();
  }
  if (-[FaceTimeServiceSession _checkRegistrationAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:](self, "_checkRegistrationAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:", 7, v13, a3, a5, 0, v25, v27)&& -[FaceTimeServiceSession _checkManagedProfileAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:](self, "_checkManagedProfileAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:", 7, v13, a3, a5, 0)&& -[FaceTimeServiceSession _checkCanSendRequestsAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:](self,
         "_checkCanSendRequestsAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:",
         7,
         v13,
         a3,
         a5,
         0)
    && [(FaceTimeServiceSession *)self _checkAliasInfoAndFailIfNecessaryWithAction:7 callType:v13 conferenceID:a3 withPerson:a5 properties:0]&& [(FaceTimeServiceSession *)self _checkForBadPeerIDWithAction:7 callType:v13 conferenceID:a3 withPerson:a5 properties:0 peerID:v11])
  {
    if (v10)
    {
      id v19 = objc_alloc_init(FTRelayInitateMessage);
    }
    else
    {
      if (![(FaceTimeServiceSession *)self _checkConferenceIDAndFailIfNecessaryWithAction:7 callType:v13 conferenceID:a3 withPerson:a5 properties:0])return; {
      id v19 = objc_alloc_init(FTRelayInitateMessage);
      }
      id v10 = (id)objc_msgSend(MEMORY[0x263EFF8F8], "__imDataWithHexString:", a3);
    }
    [(FTFaceTimeMessage *)v19 setSessionToken:v10];
    [(FTRelayInitateMessage *)v19 setSelfPushToken:[(FaceTimeServiceSession *)self pushToken]];
    -[FTRelayInitateMessage setSelfNatType:](v19, "setSelfNatType:", [a4 objectForKey:*MEMORY[0x263F4A7C8]]);
    -[FTRelayInitateMessage setSelfNATIP:](v19, "setSelfNATIP:", [a4 objectForKey:*MEMORY[0x263F4A7C0]]);
    [(FTRelayInitateMessage *)v19 setPeerID:v11];
    [(FTRelayInitateMessage *)v19 setPeerPushToken:v12];
    -[FTRelayInitateMessage setPeerNatType:](v19, "setPeerNatType:", [a4 objectForKey:*MEMORY[0x263F4A788]]);
    -[FTRelayInitateMessage setPeerNATIP:](v19, "setPeerNATIP:", [a4 objectForKey:*MEMORY[0x263F4A780]]);
    -[FTRelayInitateMessage setRelayCandidateID:](v19, "setRelayCandidateID:", [a4 objectForKey:*MEMORY[0x263F4A7B8]]);
    id v20 = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v21 = v20;
    if (a5) {
      CFDictionarySetValue(v20, @"ID", a5);
    }
    if (a3) {
      CFDictionarySetValue(v21, @"conference", a3);
    }
    uint64_t v22 = (const void *)[MEMORY[0x263EFF910] date];
    if (v22) {
      CFDictionarySetValue(v21, @"sendDate", v22);
    }
    BOOL v23 = (const void *)objc_msgSend((id)objc_msgSend(MEMORY[0x263F4A760], "sharedDaemon", v22), "currentMessageContext");
    if (v23) {
      CFDictionarySetValue(v21, @"messageContext", v23);
    }
    [(IDSBaseMessage *)v19 setTopic:[(FaceTimeServiceSession *)self topicForCallType:v13]];
    [(IDSBaseMessage *)v19 setUserInfo:v21];
    [(IDSBaseMessage *)v19 setCompletionBlock:self->_completionBlock];
    [(FaceTimeServiceSession *)self _messageTimeoutTimeForMessage:v19];
    [(IDSBaseMessage *)v19 setTimeout:"setTimeout:"];
    [(FTIDSMessage *)v19 setIDCertificate:[(FaceTimeServiceSession *)self callerCertForCallType:v13]];
    [(FTIDSMessage *)v19 setIdentityPrivateKey:[(FaceTimeServiceSession *)self callerPrivateKey]];
    [(FTIDSMessage *)v19 setSelfURI:[(IMDAppleServiceSession *)self callerURI]];
    [(id)qword_26AC13540 sendMessage:v19];
  }
}

- (void)relay:(id)a3 sendUpdate:(id)a4 toPerson:(id)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v32 = a5;
      __int16 v33 = 2112;
      id v34 = a3;
      __int16 v35 = 2112;
      id v36 = a4;
      _os_log_impl(&dword_2378DA000, v9, OS_LOG_TYPE_INFO, "sendRelayUpdateTo: %@ relayID: %@  userInfo: %@", buf, 0x20u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    id v28 = a3;
    id v30 = a4;
    id v26 = a5;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      id v28 = a3;
      id v30 = a4;
      id v26 = a5;
      _IMAlwaysLog();
    }
  }
  id v10 = -[FaceTimeServiceSession _mappedSessionTokenForConferenceID:](self, "_mappedSessionTokenForConferenceID:", a3, v26, v28, v30);
  id v11 = [(FaceTimeServiceSession *)self _peerIDForDiplayID:a5 conferenceID:a3];
  id v12 = [(FaceTimeServiceSession *)self _pushTokenForPeerID:v11 conferenceID:a3];
  uint64_t v13 = [(FaceTimeServiceSession *)self _callTypeForConferenceID:a3];
  if (IMOSLoggingEnabled())
  {
    id v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = @"unknown";
      if (!v13) {
        id v15 = @"video";
      }
      if (v13 == 1) {
        id v15 = @"audio";
      }
      *(_DWORD *)buf = 138412546;
      id v32 = a5;
      __int16 v33 = 2112;
      id v34 = v15;
      _os_log_impl(&dword_2378DA000, v14, OS_LOG_TYPE_INFO, "Sending relay update to: %@   callType: %@", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    uint64_t v16 = @"unknown";
    if (!v13) {
      uint64_t v16 = @"video";
    }
    if (v13 == 1) {
      uint64_t v17 = @"audio";
    }
    else {
      uint64_t v17 = v16;
    }
    id v27 = a5;
    id v29 = v17;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      id v27 = a5;
      id v29 = v17;
      _IMAlwaysLog();
    }
  }
  if (MarcoShouldLogCheckpoints())
  {
    uint64_t v18 = @"unknown";
    if (!v13) {
      uint64_t v18 = @"video";
    }
    if (v13 == 1) {
      uint64_t v18 = @"audio";
    }
    id v27 = a5;
    id v29 = v18;
    MarcoNoteCheckpoint();
  }
  if (-[FaceTimeServiceSession _checkRegistrationAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:](self, "_checkRegistrationAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:", 8, v13, a3, a5, 0, v27, v29)&& -[FaceTimeServiceSession _checkManagedProfileAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:](self, "_checkManagedProfileAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:", 8, v13, a3, a5, 0)&& -[FaceTimeServiceSession _checkCanSendRequestsAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:](self,
         "_checkCanSendRequestsAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:",
         8,
         v13,
         a3,
         a5,
         0)
    && [(FaceTimeServiceSession *)self _checkAliasInfoAndFailIfNecessaryWithAction:8 callType:v13 conferenceID:a3 withPerson:a5 properties:0]&& [(FaceTimeServiceSession *)self _checkForBadPeerIDWithAction:8 callType:v13 conferenceID:a3 withPerson:a5 properties:0 peerID:v11])
  {
    if (v10)
    {
      id v19 = objc_alloc_init(FTRelayUpdateMessage);
    }
    else
    {
      if (![(FaceTimeServiceSession *)self _checkConferenceIDAndFailIfNecessaryWithAction:8 callType:v13 conferenceID:a3 withPerson:a5 properties:0])return; {
      id v19 = objc_alloc_init(FTRelayUpdateMessage);
      }
      id v10 = (id)objc_msgSend(MEMORY[0x263EFF8F8], "__imDataWithHexString:", a3);
    }
    [(FTFaceTimeMessage *)v19 setSessionToken:v10];
    [(FTRelayUpdateMessage *)v19 setPeerID:v11];
    [(FTRelayUpdateMessage *)v19 setPeerPushToken:v12];
    -[FTRelayUpdateMessage setRelayType:](v19, "setRelayType:", [a4 objectForKey:*MEMORY[0x263F4A800]]);
    -[FTRelayUpdateMessage setRelayConnectionID:](v19, "setRelayConnectionID:", [a4 objectForKey:*MEMORY[0x263F4A770]]);
    -[FTRelayUpdateMessage setRelayTransactionIDAlloc:](v19, "setRelayTransactionIDAlloc:", [a4 objectForKey:*MEMORY[0x263F4A7F8]]);
    -[FTRelayUpdateMessage setRelayTokenAllocRes:](v19, "setRelayTokenAllocRes:", [a4 objectForKey:*MEMORY[0x263F4A7F0]]);
    [(FTRelayUpdateMessage *)v19 setSelfPushToken:[(FaceTimeServiceSession *)self pushToken]];
    -[FTRelayUpdateMessage setSelfRelayIP:](v19, "setSelfRelayIP:", [a4 objectForKey:*MEMORY[0x263F4A7D0]]);
    -[FTRelayUpdateMessage setSelfRelayPort:](v19, "setSelfRelayPort:", [a4 objectForKey:*MEMORY[0x263F4A7E8]]);
    -[FTRelayUpdateMessage setSelfRelayNATIP:](v19, "setSelfRelayNATIP:", [a4 objectForKey:*MEMORY[0x263F4A7D8]]);
    -[FTRelayUpdateMessage setSelfRelayNATPort:](v19, "setSelfRelayNATPort:", [a4 objectForKey:*MEMORY[0x263F4A7E0]]);
    uint64_t v20 = *MEMORY[0x263F4A798];
    if ([a4 objectForKey:*MEMORY[0x263F4A798]]) {
      uint64_t v21 = v20;
    }
    else {
      uint64_t v21 = *MEMORY[0x263F4A790];
    }
    -[FTRelayUpdateMessage setPeerRelayIP:](v19, "setPeerRelayIP:", [a4 objectForKey:v21]);
    -[FTRelayUpdateMessage setPeerRelayPort:](v19, "setPeerRelayPort:", [a4 objectForKey:*MEMORY[0x263F4A7A8]]);
    -[FTRelayUpdateMessage setSelfRelayBlob:](v19, "setSelfRelayBlob:", [a4 objectForKey:*MEMORY[0x263F4A7B0]]);
    -[FTRelayUpdateMessage setRelayCandidateID:](v19, "setRelayCandidateID:", [a4 objectForKey:*MEMORY[0x263F4A7B8]]);
    uint64_t v22 = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    BOOL v23 = v22;
    if (a5) {
      CFDictionarySetValue(v22, @"ID", a5);
    }
    if (a3) {
      CFDictionarySetValue(v23, @"conference", a3);
    }
    id v24 = (const void *)[MEMORY[0x263EFF910] date];
    if (v24) {
      CFDictionarySetValue(v23, @"sendDate", v24);
    }
    id v25 = (const void *)objc_msgSend((id)objc_msgSend(MEMORY[0x263F4A760], "sharedDaemon", v24), "currentMessageContext");
    if (v25) {
      CFDictionarySetValue(v23, @"messageContext", v25);
    }
    [(IDSBaseMessage *)v19 setTopic:[(FaceTimeServiceSession *)self topicForCallType:v13]];
    [(IDSBaseMessage *)v19 setUserInfo:v23];
    [(IDSBaseMessage *)v19 setCompletionBlock:self->_completionBlock];
    [(FaceTimeServiceSession *)self _messageTimeoutTimeForMessage:v19];
    [(IDSBaseMessage *)v19 setTimeout:"setTimeout:"];
    [(FTIDSMessage *)v19 setIDCertificate:[(FaceTimeServiceSession *)self callerCertForCallType:v13]];
    [(FTIDSMessage *)v19 setIdentityPrivateKey:[(FaceTimeServiceSession *)self callerPrivateKey]];
    [(FTIDSMessage *)v19 setSelfURI:[(IMDAppleServiceSession *)self callerURI]];
    [(id)qword_26AC13540 sendMessage:v19];
  }
}

- (BOOL)_hasOutgoingRelayInitiateInFlight
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [(id)qword_26AC13540 currentMessage];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v9 = 0u;
    int v3 = objc_msgSend((id)qword_26AC13540, "allMessages", 0, 0);
    uint64_t v2 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (!v2) {
      return v2;
    }
    uint64_t v4 = v2;
    uint64_t v5 = *(void *)v9;
LABEL_6:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v9 != v5) {
        objc_enumerationMutation(v3);
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
        LOBYTE(v2) = 0;
        if (v4) {
          goto LABEL_6;
        }
        return v2;
      }
    }
  }
  LOBYTE(v2) = 1;
  return v2;
}

- (void)relay:(id)a3 sendCancel:(id)a4 toPerson:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    long long v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v30 = a5;
      __int16 v31 = 2112;
      id v32 = a3;
      __int16 v33 = 2112;
      id v34 = a4;
      _os_log_impl(&dword_2378DA000, v9, OS_LOG_TYPE_INFO, "sendRelayCancelTo: %@ relayID: %@  userInfo: %@", buf, 0x20u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    id v26 = a3;
    id v28 = a4;
    id v24 = a5;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      id v26 = a3;
      id v28 = a4;
      id v24 = a5;
      _IMAlwaysLog();
    }
  }
  if ([(FaceTimeServiceSession *)self _hasOutgoingRelayInitiateInFlight])
  {
    im_dispatch_after();
    return;
  }
  id v10 = [(FaceTimeServiceSession *)self _mappedSessionTokenForConferenceID:a3];
  id v11 = [(FaceTimeServiceSession *)self _peerIDForDiplayID:a5 conferenceID:a3];
  id v12 = [(FaceTimeServiceSession *)self _pushTokenForPeerID:v11 conferenceID:a3];
  uint64_t v13 = [(FaceTimeServiceSession *)self _callTypeForConferenceID:a3];
  if (IMOSLoggingEnabled())
  {
    id v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = @"unknown";
      if (!v13) {
        id v15 = @"video";
      }
      if (v13 == 1) {
        id v15 = @"audio";
      }
      *(_DWORD *)buf = 138412546;
      id v30 = a5;
      __int16 v31 = 2112;
      id v32 = v15;
      _os_log_impl(&dword_2378DA000, v14, OS_LOG_TYPE_INFO, "Sending relay cancel to: %@  callType: %@", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    uint64_t v16 = @"unknown";
    if (!v13) {
      uint64_t v16 = @"video";
    }
    if (v13 == 1) {
      uint64_t v17 = @"audio";
    }
    else {
      uint64_t v17 = v16;
    }
    id v25 = a5;
    id v27 = v17;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      id v25 = a5;
      id v27 = v17;
      _IMAlwaysLog();
    }
  }
  if (MarcoShouldLogCheckpoints())
  {
    uint64_t v18 = @"unknown";
    if (!v13) {
      uint64_t v18 = @"video";
    }
    if (v13 == 1) {
      uint64_t v18 = @"audio";
    }
    id v25 = a5;
    id v27 = v18;
    MarcoNoteCheckpoint();
  }
  if (-[FaceTimeServiceSession _checkRegistrationAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:](self, "_checkRegistrationAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:", 9, v13, a3, a5, 0, v25, v27)&& -[FaceTimeServiceSession _checkManagedProfileAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:](self, "_checkManagedProfileAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:", 9, v13, a3, a5, 0)&& -[FaceTimeServiceSession _checkCanSendRequestsAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:](self,
         "_checkCanSendRequestsAndFailIfNecessaryAction:callType:conferenceID:withPerson:properties:",
         9,
         v13,
         a3,
         a5,
         0)
    && [(FaceTimeServiceSession *)self _checkAliasInfoAndFailIfNecessaryWithAction:9 callType:v13 conferenceID:a3 withPerson:a5 properties:0]&& [(FaceTimeServiceSession *)self _checkForBadPeerIDWithAction:9 callType:v13 conferenceID:a3 withPerson:a5 properties:0 peerID:v11])
  {
    if (v10)
    {
      id v19 = objc_alloc_init(FTRelayCancelMessage);
    }
    else
    {
      if (![(FaceTimeServiceSession *)self _checkConferenceIDAndFailIfNecessaryWithAction:9 callType:v13 conferenceID:a3 withPerson:a5 properties:0])return; {
      id v19 = objc_alloc_init(FTRelayCancelMessage);
      }
      id v10 = (id)objc_msgSend(MEMORY[0x263EFF8F8], "__imDataWithHexString:", a3);
    }
    [(FTFaceTimeMessage *)v19 setSessionToken:v10];
    [(FTRelayCancelMessage *)v19 setPeerID:v11];
    [(FTRelayCancelMessage *)v19 setPeerPushToken:v12];
    [(FTRelayCancelMessage *)v19 setReason:&unk_26EA92540];
    -[FTRelayCancelMessage setRelayType:](v19, "setRelayType:", [a4 objectForKey:*MEMORY[0x263F4A800]]);
    -[FTRelayCancelMessage setRelayConnectionID:](v19, "setRelayConnectionID:", [a4 objectForKey:*MEMORY[0x263F4A770]]);
    -[FTRelayCancelMessage setSelfRelayIP:](v19, "setSelfRelayIP:", [a4 objectForKey:*MEMORY[0x263F4A7D0]]);
    -[FTRelayCancelMessage setSelfRelayPort:](v19, "setSelfRelayPort:", [a4 objectForKey:*MEMORY[0x263F4A7E8]]);
    uint64_t v20 = *MEMORY[0x263F4A798];
    if ([a4 objectForKey:*MEMORY[0x263F4A798]]) {
      uint64_t v21 = v20;
    }
    else {
      uint64_t v21 = *MEMORY[0x263F4A790];
    }
    -[FTRelayCancelMessage setPeerRelayIP:](v19, "setPeerRelayIP:", [a4 objectForKey:v21]);
    -[FTRelayCancelMessage setPeerRelayPort:](v19, "setPeerRelayPort:", [a4 objectForKey:*MEMORY[0x263F4A7A8]]);
    -[FTRelayCancelMessage setRelayCandidateID:](v19, "setRelayCandidateID:", [a4 objectForKey:*MEMORY[0x263F4A7B8]]);
    uint64_t v22 = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    BOOL v23 = v22;
    if (a5) {
      CFDictionarySetValue(v22, @"ID", a5);
    }
    if (a3) {
      CFDictionarySetValue(v23, @"conference", a3);
    }
    [(IDSBaseMessage *)v19 setTopic:[(FaceTimeServiceSession *)self topicForCallType:v13]];
    [(IDSBaseMessage *)v19 setUserInfo:v23];
    [(IDSBaseMessage *)v19 setCompletionBlock:self->_completionBlock];
    [(FaceTimeServiceSession *)self _messageTimeoutTimeForMessage:v19];
    [(IDSBaseMessage *)v19 setTimeout:"setTimeout:"];
    [(FTIDSMessage *)v19 setIDCertificate:[(FaceTimeServiceSession *)self callerCertForCallType:v13]];
    [(FTIDSMessage *)v19 setIdentityPrivateKey:[(FaceTimeServiceSession *)self callerPrivateKey]];
    [(FTIDSMessage *)v19 setSelfURI:[(IMDAppleServiceSession *)self callerURI]];
    [(id)qword_26AC13540 sendMessage:v19];
  }
}

- (void)_cancelOtherInvitesForPeerID:(id)a3 skipPairs:(id)a4 properties:(id)a5 conference:(id)a6 reason:(id)a7
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v20 = a3;
      __int16 v21 = 2112;
      id v22 = a4;
      _os_log_impl(&dword_2378DA000, v13, OS_LOG_TYPE_INFO, "Cancelling other invites for peer ID: %@     ignore pairs: %@", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    id v16 = a3;
    id v18 = a4;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      id v16 = a3;
      id v18 = a4;
      _IMAlwaysLog();
    }
  }
  id v14 = -[FaceTimeServiceSession _peerIDPushTokensPairsForPeerID:conferenceID:skippingPairs:](self, "_peerIDPushTokensPairsForPeerID:conferenceID:skippingPairs:", a3, a6, a4, v16, v18);
  if (IMOSLoggingEnabled())
  {
    id v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v14;
      _os_log_impl(&dword_2378DA000, v15, OS_LOG_TYPE_INFO, "         pairs to cancel: %@", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    id v17 = v14;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      id v17 = v14;
      _IMAlwaysLog();
    }
  }
  if (objc_msgSend(v14, "count", v17)) {
    [(FaceTimeServiceSession *)self _cancelVCRequestWithPerson:[(FaceTimeServiceSession *)self _displayIDForPeerID:a3 conferenceID:a6] properties:a5 conference:a6 pairsToSkip:a4 reason:a7];
  }
}

- (BOOL)_hasOutgoingInvitationInFlight
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [(id)qword_26AC13540 currentMessage];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v9 = 0u;
    int v3 = objc_msgSend((id)qword_26AC13540, "allMessages", 0, 0);
    uint64_t v2 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (!v2) {
      return v2;
    }
    uint64_t v4 = v2;
    uint64_t v5 = *(void *)v9;
LABEL_6:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v9 != v5) {
        objc_enumerationMutation(v3);
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
        LOBYTE(v2) = 0;
        if (v4) {
          goto LABEL_6;
        }
        return v2;
      }
    }
  }
  LOBYTE(v2) = 1;
  return v2;
}

- (void)handler:(id)a3 sessionInitated:(id)a4 topic:(id)a5 myID:(id)a6 peerID:(id)a7 peerDisplayID:(id)a8 peerCN:(id)a9 peerPushToken:(id)a10 peerNATType:(id)a11 peerBlob:(id)a12 peerNatIP:(id)a13 clientInfo:(id)a14 serviceData:(id)a15
{
  uint64_t v140 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    id v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v132 = "-[FaceTimeServiceSession handler:sessionInitated:topic:myID:peerID:peerDisplayID:peerCN:peerPushToken:peerN"
             "ATType:peerBlob:peerNatIP:clientInfo:serviceData:]";
      __int16 v133 = 2112;
      id v134 = (id)[NSString stringWithFormat:@"sessionToken: %@, topic: %@, myID: %@", a4, a5, a6];
      _os_log_impl(&dword_2378DA000, v20, OS_LOG_TYPE_INFO, "%s (%@)", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    uint64_t v21 = [NSString stringWithFormat:@"sessionToken: %@, topic: %@, myID: %@", a4, a5, a6];
    long long v88 = "-[FaceTimeServiceSession handler:sessionInitated:topic:myID:peerID:peerDisplayID:peerCN:peerPushToken:peerNATT"
          "ype:peerBlob:peerNatIP:clientInfo:serviceData:]";
    uint64_t v92 = v21;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      uint64_t v22 = [NSString stringWithFormat:@"sessionToken: %@, topic: %@, myID: %@", a4, a5, a6];
      long long v88 = "-[FaceTimeServiceSession handler:sessionInitated:topic:myID:peerID:peerDisplayID:peerCN:peerPushToken:peerNA"
            "TType:peerBlob:peerNatIP:clientInfo:serviceData:]";
      uint64_t v92 = v22;
      _IMAlwaysLog();
    }
  }
  unsigned int v99 = objc_msgSend(a5, "isEqualToString:", @"com.apple.private.ac", v88, v92);
  int v23 = [(IDSAccount *)[(IMDAppleServiceSession *)self idsAccount] accountType];
  if (v23)
  {
    if (v23 != 1)
    {
      if (IMOSLoggingEnabled())
      {
        __int16 v31 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2378DA000, v31, OS_LOG_TYPE_INFO, "Ignoring this invite, it came to the local account", buf, 2u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        _IMLoggingLog();
        if (_IMWillLog()) {
          _IMAlwaysLog();
        }
      }
      if (IMOSLoggingEnabled())
      {
        id v32 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2378DA000, v32, OS_LOG_TYPE_INFO, "Ignoring this invite, it came to the local account", buf, 2u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        _IMLoggingLog();
        if (_IMWillLog()) {
          _IMAlwaysLog();
        }
      }
      if (MarcoShouldLogCheckpoints()) {
        MarcoNoteCheckpoint();
      }
      return;
    }
    char v24 = objc_msgSend(a6, "isEqualToString:", -[FaceTimeServiceSession profileID](self, "profileID"));
  }
  else
  {
    char v24 = objc_msgSend(a6, "isEqualToString:", objc_msgSend(-[FaceTimeServiceSession phoneNumber](self, "phoneNumber"), "_IDFromFZIDType:", 0));
  }
  if ((v24 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      __int16 v33 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        id v34 = [(FaceTimeServiceSession *)self userID];
        *(_DWORD *)buf = 138412546;
        v132 = (const char *)a6;
        __int16 v133 = 2112;
        id v134 = v34;
        _os_log_impl(&dword_2378DA000, v33, OS_LOG_TYPE_INFO, "Ignoring this invite, it is not to me, but instead to: %@  (mine is: %@)", buf, 0x16u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      id v94 = [(FaceTimeServiceSession *)self userID];
      _IMLoggingLog();
      if (_IMWillLog())
      {
        [(FaceTimeServiceSession *)self userID];
        _IMAlwaysLog();
      }
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v35 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        id v36 = [(FaceTimeServiceSession *)self userID];
        *(_DWORD *)buf = 138412546;
        v132 = (const char *)a6;
        __int16 v133 = 2112;
        id v134 = v36;
        _os_log_impl(&dword_2378DA000, v35, OS_LOG_TYPE_INFO, "Ignoring this invite, it is not to me, but instead to: %@  (mine is: %@)", buf, 0x16u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      id v95 = [(FaceTimeServiceSession *)self userID];
      _IMLoggingLog();
      if (_IMWillLog())
      {
        [(FaceTimeServiceSession *)self userID];
        _IMAlwaysLog();
      }
    }
    if (MarcoShouldLogCheckpoints())
    {
      [(FaceTimeServiceSession *)self userID];
      MarcoNoteCheckpoint();
    }
    return;
  }
  uint64_t v25 = objc_msgSend(a4, "__imHexString");
  [(FaceTimeServiceSession *)self _setCallType:v99 forConferenceID:v25];
  long long v129 = 0u;
  long long v130 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  id v26 = (void *)[(id)qword_26AC13538 allValues];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v127 objects:v139 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v128;
LABEL_14:
    uint64_t v29 = 0;
    while (1)
    {
      if (*(void *)v128 != v28) {
        objc_enumerationMutation(v26);
      }
      if ([*(id *)(*((void *)&v127 + 1) + 8 * v29) objectForKey:v25]) {
        break;
      }
      if (v27 == ++v29)
      {
        uint64_t v27 = [v26 countByEnumeratingWithState:&v127 objects:v139 count:16];
        if (v27) {
          goto LABEL_14;
        }
        goto LABEL_20;
      }
    }
  }
  else
  {
LABEL_20:
    if ([(FaceTimeServiceSession *)self _hasOutgoingInvitationInFlight])
    {
      if (IMOSLoggingEnabled())
      {
        id v30 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v132 = (const char *)v25;
          __int16 v133 = 2112;
          id v134 = a4;
          _os_log_impl(&dword_2378DA000, v30, OS_LOG_TYPE_INFO, "Delaying initiate for conference ID: %@  (token: %@)", buf, 0x16u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        _IMLoggingLog();
        if (_IMWillLog()) {
          _IMAlwaysLog();
        }
      }
      uint64_t v109 = MEMORY[0x263EF8330];
      uint64_t v110 = 3221225472;
      v111 = sub_2378EF6FC;
      v112 = &unk_264CE79F0;
      v113 = self;
      id v114 = a3;
      id v115 = a4;
      id v116 = a5;
      id v117 = a6;
      id v118 = a7;
      id v119 = a8;
      id v120 = a9;
      id v121 = a10;
      id v122 = a11;
      id v123 = a12;
      id v124 = a13;
      id v125 = a14;
      id v126 = a15;
      im_dispatch_after();
      return;
    }
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F4A058], "sharedInstance"), "_setCurrentIDStatus:forDestination:service:", 1, a8, a5);
  unsigned int v37 = sub_2378EF74C(a14);
  if ([a8 length]) {
    id v38 = a8;
  }
  else {
    id v38 = a7;
  }
  __int16 v97 = (const char *)[v38 _stripFZIDPrefix];
  if ((v37 & 1) == 0)
  {
    MarcoBeginSession();
    MarcoSetInitiator();
  }
  if ([(IDSAccount *)[(IMDAppleServiceSession *)self idsAccount] accountType] == 1)
  {
    long long v107 = 0u;
    long long v108 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    uint64_t v39 = [(IMDAppleServiceSession *)self aliases];
    uint64_t v40 = [(NSArray *)v39 countByEnumeratingWithState:&v105 objects:v138 count:16];
    if (!v40)
    {
LABEL_70:
      if (IMOSLoggingEnabled())
      {
        uint64_t v43 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2378DA000, v43, OS_LOG_TYPE_INFO, "Ignoring this invite, we don't have any validated aliases", buf, 2u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        _IMLoggingLog();
        if (_IMWillLog()) {
          _IMAlwaysLog();
        }
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v44 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2378DA000, v44, OS_LOG_TYPE_INFO, "Ignoring this invite, we don't have any validated aliases", buf, 2u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        _IMLoggingLog();
        if (_IMWillLog()) {
          _IMAlwaysLog();
        }
      }
      if (MarcoShouldLogCheckpoints())
      {
LABEL_83:
        MarcoNoteCheckpoint();
        return;
      }
      return;
    }
    uint64_t v41 = *(void *)v106;
LABEL_64:
    uint64_t v42 = 0;
    while (1)
    {
      if (*(void *)v106 != v41) {
        objc_enumerationMutation(v39);
      }
      if ([(IMDAppleServiceSession *)self validationStatusForAlias:*(void *)(*((void *)&v105 + 1) + 8 * v42)] == 3)break; {
      if (v40 == ++v42)
      }
      {
        uint64_t v40 = [(NSArray *)v39 countByEnumeratingWithState:&v105 objects:v138 count:16];
        if (v40) {
          goto LABEL_64;
        }
        goto LABEL_70;
      }
    }
  }
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F4A868], "sharedInstance"), "isFastUserSwitched"))
  {
    if (IMOSLoggingEnabled())
    {
      id v45 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2378DA000, v45, OS_LOG_TYPE_INFO, "Ignoring this invite, we're fast user switched out", buf, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
    }
    if (IMOSLoggingEnabled())
    {
      id v46 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2378DA000, v46, OS_LOG_TYPE_INFO, "Ignoring this invite, we're fast user switched out", buf, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
    }
    if (MarcoShouldLogCheckpoints()) {
      goto LABEL_83;
    }
  }
  else
  {
    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    __int16 v47 = (void *)[(id)qword_26AC13538 allValues];
    uint64_t v48 = [v47 countByEnumeratingWithState:&v101 objects:v137 count:16];
    if (v48)
    {
      uint64_t v49 = *(void *)v102;
LABEL_101:
      uint64_t v50 = 0;
      while (1)
      {
        if (*(void *)v102 != v49) {
          objc_enumerationMutation(v47);
        }
        uint64_t v51 = [*(id *)(*((void *)&v101 + 1) + 8 * v50) objectForKey:v25];
        if (v51) {
          break;
        }
        if (v48 == ++v50)
        {
          uint64_t v48 = [v47 countByEnumeratingWithState:&v101 objects:v137 count:16];
          if (v48) {
            goto LABEL_101;
          }
          goto LABEL_107;
        }
      }
    }
    else
    {
LABEL_107:
      uint64_t v51 = 0;
    }
    if (IMOSLoggingEnabled())
    {
      id v52 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v132 = (const char *)v51;
        _os_log_impl(&dword_2378DA000, v52, OS_LOG_TYPE_INFO, "Peers for this call %@", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
    }
    if (IMOSLoggingEnabled())
    {
      __int16 v53 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        id v54 = @"NO";
        if (v37) {
          id v54 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        v132 = (const char *)v54;
        _os_log_impl(&dword_2378DA000, v53, OS_LOG_TYPE_INFO, "Is reinitiate: %@", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
    }
    if (v51) {
      char v55 = v37;
    }
    else {
      char v55 = 1;
    }
    if (v55)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F4A868], "sharedInstance"), "isScreenLocked");
      FTAWDSetSubmissionDate();
      FTAWDLogCallInvitationReceived();
      [NSDictionary dictionaryWithObject:objc_msgSend(NSString, "stringWithFormat:", @"%@", v25), @"ConferenceID" forKey];
      PLLogRegisteredEvent();
      if (IMOSLoggingEnabled())
      {
        v56 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          uint64_t v57 = @"video";
          *(_DWORD *)buf = 138412802;
          v132 = v97;
          __int16 v133 = 2112;
          if (v99) {
            uint64_t v57 = @"audio";
          }
          id v134 = a7;
          __int16 v135 = 2112;
          v136 = v57;
          _os_log_impl(&dword_2378DA000, v56, OS_LOG_TYPE_INFO, "Received invite push from: %@ (%@)  type: %@", buf, 0x20u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        v58 = v99 ? @"audio" : @"video";
        id v93 = a7;
        id v96 = v58;
        long long v89 = v97;
        _IMLoggingLog();
        if (_IMWillLog())
        {
          id v93 = a7;
          id v96 = v58;
          long long v89 = v97;
          _IMAlwaysLog();
        }
      }
      if (MarcoShouldLogCheckpoints())
      {
        if (v99) {
          v59 = @"audio";
        }
        else {
          v59 = @"video";
        }
        id v93 = a7;
        id v96 = v59;
        long long v89 = v97;
        MarcoNoteCheckpoint();
      }
      if (IMOSLoggingEnabled())
      {
        v60 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v132 = (const char *)v25;
          _os_log_impl(&dword_2378DA000, v60, OS_LOG_TYPE_INFO, "Conference ID: %@", buf, 0xCu);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        long long v89 = (const char *)v25;
        _IMLoggingLog();
        if (_IMWillLog())
        {
          long long v89 = (const char *)v25;
          _IMAlwaysLog();
        }
      }
      if (MarcoShouldLogCheckpoints())
      {
        long long v89 = (const char *)v25;
        MarcoNoteCheckpoint();
      }
      [(FaceTimeServiceSession *)self _logLocalInfo];
      if ([(IMDServiceSession *)self allowedAsChild])
      {
        if ([(FaceTimeServiceSession *)self _validRegistrationStateToAcceptCalls])
        {
          if ([(IMDAppleServiceSession *)self _isDeviceRegistered])
          {
            v61 = (void *)[objc_alloc(MEMORY[0x263F4A858]) initWithIdentifier:@"IncomingFaceTimeCall" timeout:10.0];
            id v62 = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
            id v63 = v62;
            if (a6) {
              CFDictionarySetValue(v62, (const void *)*MEMORY[0x263F4A990], a6);
            }
            if (a12) {
              CFDictionarySetValue(v63, (const void *)*MEMORY[0x263F4A918], a12);
            }
            if (a9) {
              CFDictionarySetValue(v63, (const void *)*MEMORY[0x263F4A8F8], a9);
            }
            if (a11) {
              CFDictionarySetValue(v63, (const void *)*MEMORY[0x263F4A938], a11);
            }
            id v64 = (void *)MEMORY[0x263F4A930];
            if (a13) {
              CFDictionarySetValue(v63, (const void *)*MEMORY[0x263F4A930], a13);
            }
            id v65 = sub_2378EF834(a14);
            if (v65) {
              CFDictionarySetValue(v63, (const void *)*MEMORY[0x263F4A988], v65);
            }
            v66 = sub_2378EF920(a14);
            if (v66) {
              CFDictionarySetValue(v63, (const void *)*MEMORY[0x263F4A8F0], v66);
            }
            id v67 = (const void *)[NSNumber numberWithBool:sub_2378EF74C(a14)];
            if (v67) {
              CFDictionarySetValue(v63, (const void *)*MEMORY[0x263F4A900], v67);
            }
            id v68 = (const void *)[NSNumber numberWithBool:sub_2378EFA0C(a14)];
            if (v68) {
              CFDictionarySetValue(v63, (const void *)*MEMORY[0x263F4A910], v68);
            }
            id v69 = (const void *)sub_2378EFAF4(a14);
            if (v69) {
              CFDictionarySetValue(v63, (const void *)*MEMORY[0x263F4A980], v69);
            }
            v70 = sub_2378EFBD8(a14);
            if (v70) {
              CFDictionarySetValue(v63, (const void *)*MEMORY[0x263F4A968], v70);
            }
            if (IMOSLoggingEnabled())
            {
              v71 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v132 = (const char *)v63;
                _os_log_impl(&dword_2378DA000, v71, OS_LOG_TYPE_INFO, "ConferenceDictionary: %@", buf, 0xCu);
              }
            }
            if (os_log_shim_legacy_logging_enabled())
            {
              long long v90 = v63;
              _IMLoggingLog();
              if (_IMWillLog())
              {
                long long v90 = v63;
                _IMAlwaysLog();
              }
            }
            uint64_t v72 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v132 = (const char *)v63;
              _os_log_impl(&dword_2378DA000, v72, OS_LOG_TYPE_DEFAULT, "Response dictionary: %@", buf, 0xCu);
            }
            if (os_log_shim_legacy_logging_enabled())
            {
              if (MarcoShouldLog())
              {
                long long v90 = v63;
                MarcoLog();
              }
              if (IMShouldLog())
              {
                long long v90 = v63;
                IMLogString();
              }
            }
            id v73 = (void *)MEMORY[0x263EFF9A0];
            uint64_t v74 = objc_msgSend(NSNumber, "numberWithInt:", 4, v90);
            uint64_t v75 = [(__CFDictionary *)v63 plistData];
            uint64_t v76 = [NSNumber numberWithBool:0];
            uint64_t v77 = objc_msgSend(v73, "dictionaryWithObjectsAndKeys:", v74, *MEMORY[0x263F4A998], v75, *MEMORY[0x263F4A908], v76, *MEMORY[0x263F4A950], a13, *v64, 0);
            [v77 addEntriesFromDictionary:v63];
            if (IMOSLoggingEnabled())
            {
              v78 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v132 = (const char *)v77;
                _os_log_impl(&dword_2378DA000, v78, OS_LOG_TYPE_INFO, "Generated Properties: %@", buf, 0xCu);
              }
            }
            if (os_log_shim_legacy_logging_enabled())
            {
              v91 = (__CFDictionary *)v77;
              _IMLoggingLog();
              if (_IMWillLog())
              {
                v91 = (__CFDictionary *)v77;
                _IMAlwaysLog();
              }
            }
            unsigned int v79 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v132 = (const char *)v63;
              _os_log_impl(&dword_2378DA000, v79, OS_LOG_TYPE_DEFAULT, "Properties dictionary: %@", buf, 0xCu);
            }
            if (os_log_shim_legacy_logging_enabled())
            {
              if (MarcoShouldLog())
              {
                v91 = v63;
                MarcoLog();
              }
              if (IMShouldLog())
              {
                v91 = v63;
                IMLogString();
              }
            }
            if (v99) {
              id v80 = [(IMDServiceSession *)self broadcasterForACConferenceListeners];
            }
            else {
              id v80 = [(IMDServiceSession *)self broadcasterForVCConferenceListeners];
            }
            objc_msgSend(v80, "account:conference:receivedInvitationFrom:properties:", -[IMDServiceSession accountID](self, "accountID", v91), v25, sub_2378E5AEC(v97), v77);
            [(FaceTimeServiceSession *)self _retargetPeerID:a7 displayID:v97 pushToken:a10 conferenceID:v25];

            return;
          }
          if (IMOSLoggingEnabled())
          {
            long long v86 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_2378DA000, v86, OS_LOG_TYPE_INFO, "Device is not registered, not showing invite", buf, 2u);
            }
          }
          if (os_log_shim_legacy_logging_enabled())
          {
            _IMLoggingLog();
            if (_IMWillLog()) {
              _IMAlwaysLog();
            }
          }
          if (IMOSLoggingEnabled())
          {
            long long v87 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_2378DA000, v87, OS_LOG_TYPE_INFO, "Device is not registered, not showing invite", buf, 2u);
            }
          }
          if (os_log_shim_legacy_logging_enabled())
          {
            _IMLoggingLog();
            if (_IMWillLog()) {
              _IMAlwaysLog();
            }
          }
          if (MarcoShouldLogCheckpoints()) {
            MarcoNoteCheckpoint();
          }
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            long long v84 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_2378DA000, v84, OS_LOG_TYPE_INFO, "Ignoring invite due to reg agent state", buf, 2u);
            }
          }
          if (os_log_shim_legacy_logging_enabled())
          {
            _IMLoggingLog();
            if (_IMWillLog()) {
              _IMAlwaysLog();
            }
          }
          if (IMOSLoggingEnabled())
          {
            long long v85 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_2378DA000, v85, OS_LOG_TYPE_INFO, "Ignoring this invite, we're not in a good state to recieve calls", buf, 2u);
            }
          }
          if (os_log_shim_legacy_logging_enabled())
          {
            _IMLoggingLog();
            if (_IMWillLog()) {
              _IMAlwaysLog();
            }
          }
          if (MarcoShouldLogCheckpoints()) {
            MarcoNoteCheckpoint();
          }
        }
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          v82 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2378DA000, v82, OS_LOG_TYPE_INFO, "Managed configuration has disabled FaceTime, we're ignoring this", buf, 2u);
          }
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          _IMLoggingLog();
          if (_IMWillLog()) {
            _IMAlwaysLog();
          }
        }
        if (IMOSLoggingEnabled())
        {
          long long v83 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2378DA000, v83, OS_LOG_TYPE_INFO, "Managed configuration has disabled FaceTime, we're ignoring this", buf, 2u);
          }
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          _IMLoggingLog();
          if (_IMWillLog()) {
            _IMAlwaysLog();
          }
        }
        if (MarcoShouldLogCheckpoints()) {
          MarcoNoteCheckpoint();
        }
      }
      MarcoEndSession();
      return;
    }
    if (IMOSLoggingEnabled())
    {
      v81 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2378DA000, v81, OS_LOG_TYPE_INFO, "This is an invitation from ourselves. Ignoring it", buf, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
    }
  }
}

- (void)handler:(id)a3 sessionAccepted:(id)a4 topic:(id)a5 peerID:(id)a6 peerCN:(id)a7 peerPushToken:(id)a8 peerNATType:(id)a9 peerBlob:(id)a10 peerNatIP:(id)a11 relayType:(id)a12 relayConnectionID:(id)a13 relayTransactionIDAlloc:(id)a14 relayTokenAllocReq:(id)a15 myRelayIP:(id)a16 myRelayPort:(id)a17 peerRelayIP:(id)a18 peerRelayPort:(id)a19 clientInfo:(id)a20 serviceData:(id)a21
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    uint64_t v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v78 = "-[FaceTimeServiceSession handler:sessionAccepted:topic:peerID:peerCN:peerPushToken:peerNATType:peerBlob:peer"
            "NatIP:relayType:relayConnectionID:relayTransactionIDAlloc:relayTokenAllocReq:myRelayIP:myRelayPort:peerRelay"
            "IP:peerRelayPort:clientInfo:serviceData:]";
      __int16 v79 = 2112;
      uint64_t v80 = [NSString stringWithFormat:@"sessionToken: %@, topic: %@", a4, a5];
      _os_log_impl(&dword_2378DA000, v25, OS_LOG_TYPE_INFO, "%s (%@)", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    uint64_t v26 = [NSString stringWithFormat:@"sessionToken: %@, topic: %@", a4, a5];
    id v63 = "-[FaceTimeServiceSession handler:sessionAccepted:topic:peerID:peerCN:peerPushToken:peerNATType:peerBlob:peerNa"
          "tIP:relayType:relayConnectionID:relayTransactionIDAlloc:relayTokenAllocReq:myRelayIP:myRelayPort:peerRelayIP:p"
          "eerRelayPort:clientInfo:serviceData:]";
    uint64_t v67 = v26;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      uint64_t v27 = [NSString stringWithFormat:@"sessionToken: %@, topic: %@", a4, a5];
      id v63 = "-[FaceTimeServiceSession handler:sessionAccepted:topic:peerID:peerCN:peerPushToken:peerNATType:peerBlob:peer"
            "NatIP:relayType:relayConnectionID:relayTransactionIDAlloc:relayTokenAllocReq:myRelayIP:myRelayPort:peerRelay"
            "IP:peerRelayPort:clientInfo:serviceData:]";
      uint64_t v67 = v27;
      _IMAlwaysLog();
    }
  }
  if (-[FaceTimeServiceSession _checkBadPushToken:](self, "_checkBadPushToken:", a8, v63, v67))
  {
    uint64_t v28 = objc_msgSend(a4, "__imHexString");
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    uint64_t v29 = (void *)[(id)qword_26AC13538 allValues];
    uint64_t v30 = [v29 countByEnumeratingWithState:&v73 objects:v83 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v74;
LABEL_10:
      uint64_t v32 = 0;
      while (1)
      {
        if (*(void *)v74 != v31) {
          objc_enumerationMutation(v29);
        }
        if ([*(id *)(*((void *)&v73 + 1) + 8 * v32) objectForKey:v28]) {
          break;
        }
        if (v30 == ++v32)
        {
          uint64_t v30 = [v29 countByEnumeratingWithState:&v73 objects:v83 count:16];
          if (v30) {
            goto LABEL_10;
          }
          goto LABEL_16;
        }
      }
    }
    else
    {
LABEL_16:
      if ([(FaceTimeServiceSession *)self _hasOutgoingInvitationInFlight])
      {
        if (IMOSLoggingEnabled())
        {
          __int16 v33 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v78 = (const char *)v28;
            __int16 v79 = 2112;
            uint64_t v80 = (uint64_t)a4;
            _os_log_impl(&dword_2378DA000, v33, OS_LOG_TYPE_INFO, "Delaying accept for conference ID: %@  (token: %@)", buf, 0x16u);
          }
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          _IMLoggingLog();
          if (_IMWillLog()) {
            _IMAlwaysLog();
          }
        }
        im_dispatch_after();
        return;
      }
    }
    if ((sub_2378EF74C(a20) & 1) != 0
      || [(FaceTimeServiceSession *)self _hasPeersForPeerID:a6 conferenceID:v28])
    {
      v70 = [(FaceTimeServiceSession *)self _displayIDForPeerID:a6 conferenceID:v28];
      id v34 = [(FaceTimeServiceSession *)self _pushTokensForPeerID:a6 conferenceID:v28];
      int v35 = [a5 isEqualToString:@"com.apple.private.ac"];
      if (IMOSLoggingEnabled())
      {
        id v36 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          unsigned int v37 = @"video";
          *(_DWORD *)buf = 138412802;
          v78 = v70;
          __int16 v79 = 2112;
          if (v35) {
            unsigned int v37 = @"audio";
          }
          uint64_t v80 = (uint64_t)a6;
          __int16 v81 = 2112;
          id v82 = v37;
          _os_log_impl(&dword_2378DA000, v36, OS_LOG_TYPE_INFO, "Received accept push from: %@ (%@)   %@", buf, 0x20u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        id v38 = v35 ? @"audio" : @"video";
        id v68 = a6;
        id v69 = v38;
        id v64 = v70;
        _IMLoggingLog();
        if (_IMWillLog())
        {
          id v68 = a6;
          id v69 = v38;
          id v64 = v70;
          _IMAlwaysLog();
        }
      }
      if (MarcoShouldLogCheckpoints())
      {
        if (v35) {
          uint64_t v39 = @"audio";
        }
        else {
          uint64_t v39 = @"video";
        }
        id v68 = a6;
        id v69 = v39;
        id v64 = v70;
        MarcoNoteCheckpoint();
      }
      if (objc_msgSend(v34, "containsObject:", a8, v64, v68, v69))
      {
        objc_msgSend((id)objc_msgSend(MEMORY[0x263F4A868], "sharedInstance"), "isScreenLocked");
        FTAWDLogCallAcceptReceived();
        [NSDictionary dictionaryWithObject:objc_msgSend(NSString, "stringWithFormat:", @"%@", v28), @"ConferenceID" forKey];
        PLLogRegisteredEvent();
        uint64_t v40 = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
        uint64_t v41 = v40;
        if (a10) {
          CFDictionarySetValue(v40, (const void *)*MEMORY[0x263F4A918], a10);
        }
        if (a7) {
          CFDictionarySetValue(v41, (const void *)*MEMORY[0x263F4A8F8], a7);
        }
        if (a9) {
          CFDictionarySetValue(v41, (const void *)*MEMORY[0x263F4A938], a9);
        }
        uint64_t v42 = sub_2378EF834(a20);
        uint64_t v43 = (const void **)MEMORY[0x263F4A988];
        if (v42) {
          CFDictionarySetValue(v41, (const void *)*MEMORY[0x263F4A988], v42);
        }
        uint64_t v44 = (const void *)[NSNumber numberWithBool:sub_2378EF74C(a20)];
        if (v44) {
          CFDictionarySetValue(v41, (const void *)*MEMORY[0x263F4A900], v44);
        }
        id v45 = (const void *)[NSNumber numberWithBool:sub_2378EFA0C(a20)];
        if (v45) {
          CFDictionarySetValue(v41, (const void *)*MEMORY[0x263F4A910], v45);
        }
        id v46 = (const void *)sub_2378EFAF4(a20);
        if (v46) {
          CFDictionarySetValue(v41, (const void *)*MEMORY[0x263F4A980], v46);
        }
        __int16 v47 = sub_2378EFBD8(a20);
        if (v47) {
          CFDictionarySetValue(v41, (const void *)*MEMORY[0x263F4A968], v47);
        }
        if (IMOSLoggingEnabled())
        {
          uint64_t v48 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v78 = (const char *)v41;
            _os_log_impl(&dword_2378DA000, v48, OS_LOG_TYPE_INFO, "Response Dictionary : %@", buf, 0xCu);
          }
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          id v65 = v41;
          _IMLoggingLog();
          if (_IMWillLog())
          {
            id v65 = v41;
            _IMAlwaysLog();
          }
        }
        if (a12)
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v49 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v78 = (const char *)a12;
              _os_log_impl(&dword_2378DA000, v49, OS_LOG_TYPE_INFO, "Accept also had inline relay request for relay type: %@", buf, 0xCu);
            }
          }
          if (os_log_shim_legacy_logging_enabled())
          {
            id v65 = a12;
            _IMLoggingLog();
            if (_IMWillLog())
            {
              id v65 = a12;
              _IMAlwaysLog();
            }
          }
          if (MarcoShouldLogCheckpoints())
          {
            id v65 = a12;
            MarcoNoteCheckpoint();
          }
          uint64_t v50 = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
          CFDictionarySetValue(v50, (const void *)*MEMORY[0x263F4A800], a12);
          if (a13) {
            CFDictionarySetValue(v50, (const void *)*MEMORY[0x263F4A770], a13);
          }
          if (a14) {
            CFDictionarySetValue(v50, (const void *)*MEMORY[0x263F4A7F8], a14);
          }
          if (a15) {
            CFDictionarySetValue(v50, (const void *)*MEMORY[0x263F4A7F0], a15);
          }
          if (a6) {
            CFDictionarySetValue(v50, (const void *)*MEMORY[0x263F4A778], a6);
          }
          if (a18) {
            CFDictionarySetValue(v50, (const void *)*MEMORY[0x263F4A790], a18);
          }
          if (a19) {
            CFDictionarySetValue(v50, (const void *)*MEMORY[0x263F4A7A8], a19);
          }
          if (a16) {
            CFDictionarySetValue(v50, (const void *)*MEMORY[0x263F4A7D0], a16);
          }
          if (a17) {
            CFDictionarySetValue(v50, (const void *)*MEMORY[0x263F4A7E8], a17);
          }
          if (v50) {
            CFDictionarySetValue(v41, (const void *)*MEMORY[0x263F4A920], v50);
          }
        }
        uint64_t v51 = NSDictionary;
        uint64_t v52 = objc_msgSend(NSNumber, "numberWithInt:", 0, v65);
        uint64_t v53 = [NSNumber numberWithInt:4];
        uint64_t v54 = [(__CFDictionary *)v41 plistData];
        uint64_t v55 = objc_msgSend(v51, "dictionaryWithObjectsAndKeys:", v52, *MEMORY[0x263F4A970], v53, *MEMORY[0x263F4A998], v54, *MEMORY[0x263F4A978], 0);
        if (IMOSLoggingEnabled())
        {
          v56 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v78 = (const char *)v55;
            _os_log_impl(&dword_2378DA000, v56, OS_LOG_TYPE_INFO, "Generated Properties: %@", buf, 0xCu);
          }
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          uint64_t v66 = v55;
          _IMLoggingLog();
          if (_IMWillLog())
          {
            uint64_t v66 = v55;
            _IMAlwaysLog();
          }
        }
        uint64_t v57 = &OBJC_IVAR___FaceTimeServiceSession__broadcasterVCInvocationQueue;
        if (v35) {
          uint64_t v57 = &OBJC_IVAR___FaceTimeServiceSession__broadcasterACInvocationQueue;
        }
        objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v57), "account:conference:receivedResponseToInvitationFrom:properties:", -[IMDServiceSession accountID](self, "accountID", v66), objc_msgSend(a4, "__imHexString"), sub_2378E5AEC(v70), v55);
        v58 = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
        v59 = sub_2378EF834(a20);
        if (v59) {
          CFDictionarySetValue(v58, *v43, v59);
        }
        -[FaceTimeServiceSession _cancelOtherInvitesForPeerID:skipPairs:properties:conference:reason:](self, "_cancelOtherInvitesForPeerID:skipPairs:properties:conference:reason:", a6, sub_2378F0D50((uint64_t)a6, (uint64_t)a8), v58, objc_msgSend(a4, "__imHexString"), &unk_26EA92558);
        -[FaceTimeServiceSession _retargetPeerID:displayID:pushToken:conferenceID:](self, "_retargetPeerID:displayID:pushToken:conferenceID:", a6, 0, a8, objc_msgSend(a4, "__imHexString"));

        return;
      }
      if (IMOSLoggingEnabled())
      {
        v60 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          v78 = (const char *)a8;
          __int16 v79 = 2112;
          uint64_t v80 = (uint64_t)v34;
          __int16 v81 = 2112;
          id v82 = a6;
          _os_log_impl(&dword_2378DA000, v60, OS_LOG_TYPE_INFO, "Response from token (%@) not in this conference set: %@ (%@)", buf, 0x20u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        _IMLoggingLog();
        if (_IMWillLog()) {
          _IMAlwaysLog();
        }
      }
      if (MarcoShouldLogCheckpoints()) {
        MarcoNoteCheckpoint();
      }
      if (IMOSLoggingEnabled())
      {
        v61 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          v78 = (const char *)a8;
          __int16 v79 = 2112;
          uint64_t v80 = (uint64_t)v34;
          __int16 v81 = 2112;
          id v82 = a6;
          _os_log_impl(&dword_2378DA000, v61, OS_LOG_TYPE_INFO, "Response from token (%@) not in this conference set: %@ (%@)", buf, 0x20u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        _IMLoggingLog();
        if (_IMWillLog()) {
LABEL_123:
        }
          _IMAlwaysLog();
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        id v62 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v78 = (const char *)a6;
          __int16 v79 = 2112;
          uint64_t v80 = v28;
          _os_log_impl(&dword_2378DA000, v62, OS_LOG_TYPE_INFO, "Ignoring this accept, no peers with peerID %@ in conferenceID %@", buf, 0x16u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        _IMLoggingLog();
        if (_IMWillLog()) {
          goto LABEL_123;
        }
      }
    }
  }
}

- (void)handler:(id)a3 sessionRejected:(id)a4 topic:(id)a5 peerID:(id)a6 peerPushToken:(id)a7 reason:(id)a8 clientInfo:(id)a9 serviceData:(id)a10
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    id v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v57 = "-[FaceTimeServiceSession handler:sessionRejected:topic:peerID:peerPushToken:reason:clientInfo:serviceData:]";
      __int16 v58 = 2112;
      uint64_t v59 = [NSString stringWithFormat:@"sessionToken: %@, topic: %@", a4, a5];
      _os_log_impl(&dword_2378DA000, v14, OS_LOG_TYPE_INFO, "%s (%@)", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    uint64_t v15 = [NSString stringWithFormat:@"sessionToken: %@, topic: %@", a4, a5];
    uint64_t v41 = "-[FaceTimeServiceSession handler:sessionRejected:topic:peerID:peerPushToken:reason:clientInfo:serviceData:]";
    uint64_t v45 = v15;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      uint64_t v16 = [NSString stringWithFormat:@"sessionToken: %@, topic: %@", a4, a5];
      uint64_t v41 = "-[FaceTimeServiceSession handler:sessionRejected:topic:peerID:peerPushToken:reason:clientInfo:serviceData:]";
      uint64_t v45 = v16;
      _IMAlwaysLog();
    }
  }
  uint64_t v17 = objc_msgSend(a4, "__imHexString", v41, v45);
  int v49 = [a5 isEqualToString:@"com.apple.private.ac"];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v18 = (void *)[(id)qword_26AC13538 allValues];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v52 objects:v62 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v53;
LABEL_9:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v53 != v20) {
        objc_enumerationMutation(v18);
      }
      if ([*(id *)(*((void *)&v52 + 1) + 8 * v21) objectForKey:v17]) {
        break;
      }
      if (v19 == ++v21)
      {
        uint64_t v19 = [v18 countByEnumeratingWithState:&v52 objects:v62 count:16];
        if (v19) {
          goto LABEL_9;
        }
        goto LABEL_15;
      }
    }
  }
  else
  {
LABEL_15:
    if ([(FaceTimeServiceSession *)self _hasOutgoingInvitationInFlight])
    {
      im_dispatch_after();
      return;
    }
  }
  if ([(FaceTimeServiceSession *)self _hasPeersForPeerID:a6 conferenceID:v17])
  {
    uint64_t v22 = [(FaceTimeServiceSession *)self _displayIDForPeerID:a6 conferenceID:v17];
    if (IMOSLoggingEnabled())
    {
      int v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v57 = v22;
        __int16 v58 = 2112;
        uint64_t v59 = (uint64_t)a6;
        _os_log_impl(&dword_2378DA000, v23, OS_LOG_TYPE_INFO, "Received reject push from: %@  (%@)", buf, 0x16u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      uint64_t v42 = v22;
      id v46 = a6;
      _IMLoggingLog();
      if (_IMWillLog())
      {
        uint64_t v42 = v22;
        id v46 = a6;
        _IMAlwaysLog();
      }
    }
    if (MarcoShouldLogCheckpoints())
    {
      uint64_t v42 = v22;
      id v46 = a6;
      MarcoNoteCheckpoint();
    }
    if (IMOSLoggingEnabled())
    {
      char v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v57 = v22;
        __int16 v58 = 2112;
        uint64_t v59 = (uint64_t)a6;
        _os_log_impl(&dword_2378DA000, v24, OS_LOG_TYPE_INFO, "Received reject push from: %@  (%@)", buf, 0x16u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      uint64_t v42 = v22;
      id v46 = a6;
      _IMLoggingLog();
      if (_IMWillLog())
      {
        uint64_t v42 = v22;
        id v46 = a6;
        _IMAlwaysLog();
      }
    }
    id v25 = -[FaceTimeServiceSession _pushTokensForPeerID:conferenceID:](self, "_pushTokensForPeerID:conferenceID:", a6, v17, v42, v46);
    if ([v25 containsObject:a7])
    {
      [NSDictionary dictionaryWithObject:objc_msgSend(NSString, "stringWithFormat:", @"%@", v17), @"ConferenceID" forKey];
      PLLogRegisteredEvent();
      uint64_t v26 = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      uint64_t v27 = sub_2378EF834(a9);
      if (v27) {
        CFDictionarySetValue(v26, (const void *)*MEMORY[0x263F4A988], v27);
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v57 = (const char *)v26;
          _os_log_impl(&dword_2378DA000, v28, OS_LOG_TYPE_INFO, "Response Dictionary : %@", buf, 0xCu);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        uint64_t v43 = v26;
        _IMLoggingLog();
        if (_IMWillLog())
        {
          uint64_t v43 = v26;
          _IMAlwaysLog();
        }
      }
      uint64_t v29 = NSDictionary;
      uint64_t v30 = objc_msgSend(NSNumber, "numberWithInt:", 4, v43);
      uint64_t v31 = [(__CFDictionary *)v26 plistData];
      uint64_t v32 = *MEMORY[0x263F4A970];
      __int16 v33 = objc_msgSend(v29, "dictionaryWithObjectsAndKeys:", a8, *MEMORY[0x263F4A970], v30, *MEMORY[0x263F4A998], v31, *MEMORY[0x263F4A978], 0);
      if (IMOSLoggingEnabled())
      {
        id v34 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          uint64_t v57 = (const char *)a8;
          __int16 v58 = 2112;
          uint64_t v59 = (uint64_t)v22;
          __int16 v60 = 2112;
          id v61 = a7;
          _os_log_impl(&dword_2378DA000, v34, OS_LOG_TYPE_INFO, "Reject response: %@   from peer: %@   token: %@", buf, 0x20u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        __int16 v47 = v22;
        id v48 = a7;
        id v44 = a8;
        _IMLoggingLog();
        if (_IMWillLog())
        {
          __int16 v47 = v22;
          id v48 = a7;
          id v44 = a8;
          _IMAlwaysLog();
        }
      }
      int v35 = &OBJC_IVAR___FaceTimeServiceSession__broadcasterVCInvocationQueue;
      if (v49) {
        int v35 = &OBJC_IVAR___FaceTimeServiceSession__broadcasterACInvocationQueue;
      }
      objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v35), "account:conference:receivedResponseToInvitationFrom:properties:", -[IMDServiceSession accountID](self, "accountID", v44, v47, v48), objc_msgSend(a4, "__imHexString"), sub_2378E5AEC(v22), v33);
      id v36 = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      unsigned int v37 = sub_2378EF834(a9);
      if (v37) {
        CFDictionarySetValue(v36, (const void *)*MEMORY[0x263F4A988], v37);
      }
      unsigned int v38 = objc_msgSend((id)objc_msgSend(v33, "objectForKey:", v32), "intValue");
      if (v38 > 0xB || ((1 << v38) & 0x830) == 0) {
        -[FaceTimeServiceSession _cancelOtherInvitesForPeerID:skipPairs:properties:conference:reason:](self, "_cancelOtherInvitesForPeerID:skipPairs:properties:conference:reason:", a6, sub_2378F0D50((uint64_t)a6, (uint64_t)a7), v36, objc_msgSend(a4, "__imHexString"), &unk_26EA92570);
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v40 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          uint64_t v57 = (const char *)a7;
          __int16 v58 = 2112;
          uint64_t v59 = (uint64_t)v25;
          __int16 v60 = 2112;
          id v61 = a6;
          _os_log_impl(&dword_2378DA000, v40, OS_LOG_TYPE_INFO, "Response from token (%@) not in this conference set: %@ (%@)", buf, 0x20u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        _IMLoggingLog();
        if (_IMWillLog()) {
          _IMAlwaysLog();
        }
      }
      if (MarcoShouldLogCheckpoints()) {
        MarcoNoteCheckpoint();
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v39 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v57 = (const char *)a6;
        __int16 v58 = 2112;
        uint64_t v59 = v17;
        _os_log_impl(&dword_2378DA000, v39, OS_LOG_TYPE_INFO, "Ignoring this reject, no peers with peerID %@ conferenceID %@", buf, 0x16u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
    }
  }
}

- (void)handler:(id)a3 sessionCancelled:(id)a4 topic:(id)a5 peerID:(id)a6 reason:(id)a7 clientInfo:(id)a8 serviceData:(id)a9
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    uint64_t v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      unsigned int v37 = "-[FaceTimeServiceSession handler:sessionCancelled:topic:peerID:reason:clientInfo:serviceData:]";
      __int16 v38 = 2112;
      uint64_t v39 = [NSString stringWithFormat:@"sessionToken: %@, topic: %@", a4, a5];
      _os_log_impl(&dword_2378DA000, v15, OS_LOG_TYPE_INFO, "%s (%@)", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    uint64_t v16 = [NSString stringWithFormat:@"sessionToken: %@, topic: %@", a4, a5];
    uint64_t v31 = "-[FaceTimeServiceSession handler:sessionCancelled:topic:peerID:reason:clientInfo:serviceData:]";
    uint64_t v34 = v16;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      uint64_t v17 = [NSString stringWithFormat:@"sessionToken: %@, topic: %@", a4, a5];
      uint64_t v31 = "-[FaceTimeServiceSession handler:sessionCancelled:topic:peerID:reason:clientInfo:serviceData:]";
      uint64_t v34 = v17;
      _IMAlwaysLog();
    }
  }
  uint64_t v18 = objc_msgSend(a4, "__imHexString", v31, v34);
  int v19 = [a5 isEqualToString:@"com.apple.private.ac"];
  if ([(FaceTimeServiceSession *)self _hasPeersForPeerID:a6 conferenceID:v18])
  {
    [NSDictionary dictionaryWithObject:objc_msgSend(NSString, "stringWithFormat:", @"%@", v18), @"ConferenceID" forKey];
    PLLogRegisteredEvent();
    uint64_t v20 = [(FaceTimeServiceSession *)self _displayIDForPeerID:a6 conferenceID:v18];
    if (IMOSLoggingEnabled())
    {
      uint64_t v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        unsigned int v37 = v20;
        __int16 v38 = 2112;
        uint64_t v39 = (uint64_t)a6;
        _os_log_impl(&dword_2378DA000, v21, OS_LOG_TYPE_INFO, "Received cancel push from: %@ (%@)", buf, 0x16u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      uint64_t v32 = v20;
      id v35 = a6;
      _IMLoggingLog();
      if (_IMWillLog())
      {
        uint64_t v32 = v20;
        id v35 = a6;
        _IMAlwaysLog();
      }
    }
    if (MarcoShouldLogCheckpoints())
    {
      uint64_t v32 = v20;
      id v35 = a6;
      MarcoNoteCheckpoint();
    }
    uint64_t v22 = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    int v23 = sub_2378EF834(a8);
    if (v23) {
      CFDictionarySetValue(v22, (const void *)*MEMORY[0x263F4A988], v23);
    }
    char v24 = (const void *)objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a7, "intValue", v23, v32, v35));
    if (v24) {
      CFDictionarySetValue(v22, (const void *)*MEMORY[0x263F4A970], v24);
    }
    if (IMOSLoggingEnabled())
    {
      id v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        unsigned int v37 = (const char *)v22;
        _os_log_impl(&dword_2378DA000, v25, OS_LOG_TYPE_INFO, "Response Dictionary : %@", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      __int16 v33 = v22;
      _IMLoggingLog();
      if (_IMWillLog())
      {
        __int16 v33 = v22;
        _IMAlwaysLog();
      }
    }
    uint64_t v26 = NSDictionary;
    uint64_t v27 = [(__CFDictionary *)v22 plistData];
    uint64_t v28 = objc_msgSend(v26, "dictionaryWithObjectsAndKeys:", v27, *MEMORY[0x263F4A978], 0);
    if (v19) {
      id v29 = [(IMDServiceSession *)self broadcasterForACConferenceListeners];
    }
    else {
      id v29 = [(IMDServiceSession *)self broadcasterForVCConferenceListeners];
    }
    objc_msgSend(v29, "account:conference:receivedCancelInvitationFrom:properties:", -[IMDServiceSession accountID](self, "accountID"), v18, sub_2378E5AEC(v20), v28);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v30 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        unsigned int v37 = (const char *)a6;
        __int16 v38 = 2112;
        uint64_t v39 = v18;
        _os_log_impl(&dword_2378DA000, v30, OS_LOG_TYPE_INFO, "Ignoring this cancel, no peers with peerID %@ conferenceID %@", buf, 0x16u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
    }
  }
}

- (void)handler:(id)a3 incomingMessage:(id)a4 topic:(id)a5 peerID:(id)a6 reason:(id)a7 clientInfo:(id)a8 serviceData:(id)a9
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    uint64_t v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)id v35 = "-[FaceTimeServiceSession handler:incomingMessage:topic:peerID:reason:clientInfo:serviceData:]";
      *(_WORD *)&v35[8] = 2112;
      *(void *)&v35[10] = [NSString stringWithFormat:@"sessionToken: %@, topic: %@", a4, a5];
      _os_log_impl(&dword_2378DA000, v15, OS_LOG_TYPE_INFO, "%s (%@)", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    uint64_t v16 = [NSString stringWithFormat:@"sessionToken: %@, topic: %@", a4, a5];
    uint64_t v28 = "-[FaceTimeServiceSession handler:incomingMessage:topic:peerID:reason:clientInfo:serviceData:]";
    uint64_t v31 = v16;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      uint64_t v17 = [NSString stringWithFormat:@"sessionToken: %@, topic: %@", a4, a5];
      uint64_t v28 = "-[FaceTimeServiceSession handler:incomingMessage:topic:peerID:reason:clientInfo:serviceData:]";
      uint64_t v31 = v17;
      _IMAlwaysLog();
    }
  }
  uint64_t v18 = objc_msgSend(a4, "__imHexString", v28, v31);
  int v19 = sub_2378EF834(a8);
  int v20 = [a5 isEqualToString:@"com.apple.private.ac"];
  if ([(FaceTimeServiceSession *)self _hasPeersForPeerID:a6 conferenceID:v18])
  {
    id v21 = [(FaceTimeServiceSession *)self _displayIDForPeerID:a6 conferenceID:v18];
    if (IMOSLoggingEnabled())
    {
      uint64_t v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)id v35 = v21;
        *(_WORD *)&v35[8] = 2112;
        *(void *)&v35[10] = a6;
        _os_log_impl(&dword_2378DA000, v22, OS_LOG_TYPE_INFO, "Received generic message push from: %@ (%@)", buf, 0x16u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      id v29 = v21;
      id v32 = a6;
      _IMLoggingLog();
      if (_IMWillLog())
      {
        id v29 = v21;
        id v32 = a6;
        _IMAlwaysLog();
      }
    }
    if (MarcoShouldLogCheckpoints())
    {
      id v29 = v21;
      id v32 = a6;
      MarcoNoteCheckpoint();
    }
    uint64_t v23 = objc_msgSend(a8, "objectForKey:", @"info", v29, v32);
    if (IMOSLoggingEnabled())
    {
      char v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        int v25 = [a7 intValue];
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)id v35 = v25;
        *(_WORD *)&v35[4] = 2112;
        *(void *)&v35[6] = v23;
        _os_log_impl(&dword_2378DA000, v24, OS_LOG_TYPE_INFO, "Incoming message type: %d   info: %@", buf, 0x12u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      uint64_t v30 = [a7 intValue];
      uint64_t v33 = v23;
      _IMLoggingLog();
      if (_IMWillLog())
      {
        uint64_t v30 = objc_msgSend(a7, "intValue", v30, v23);
        uint64_t v33 = v23;
        _IMAlwaysLog();
      }
    }
    if (v20) {
      id v26 = [(IMDServiceSession *)self broadcasterForACConferenceListeners];
    }
    else {
      id v26 = [(IMDServiceSession *)self broadcasterForVCConferenceListeners];
    }
    objc_msgSend(v26, "account:conference:receivedAVMessage:from:sessionID:userInfo:", -[IMDServiceSession accountID](self, "accountID", v30, v33), v18, objc_msgSend(a7, "intValue"), sub_2378E5AEC(v21), objc_msgSend(v19, "unsignedIntValue"), v23);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v27 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)id v35 = a6;
        *(_WORD *)&v35[8] = 2112;
        *(void *)&v35[10] = v18;
        _os_log_impl(&dword_2378DA000, v27, OS_LOG_TYPE_INFO, "Ignoring this message, no peers with peerID %@ conferenceID %@", buf, 0x16u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
    }
  }
}

- (void)handler:(id)a3 relayInitiated:(id)a4 topic:(id)a5 peerID:(id)a6 peerPushToken:(id)a7 relayType:(id)a8 relayConnectionID:(id)value relayTransactionIDAlloc:(id)a10 relayTokenAllocReq:(id)a11 relayCandidateID:(id)a12 myRelayIP:(id)a13 myRelayPort:(id)a14 peerRelayIP:(id)a15 peerRelayPort:(id)a16 clientInfo:(id)a17 serviceData:(id)a18
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    char v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v42 = "-[FaceTimeServiceSession handler:relayInitiated:topic:peerID:peerPushToken:relayType:relayConnectionID:relay"
            "TransactionIDAlloc:relayTokenAllocReq:relayCandidateID:myRelayIP:myRelayPort:peerRelayIP:peerRelayPort:clien"
            "tInfo:serviceData:]";
      __int16 v43 = 2112;
      uint64_t v44 = [NSString stringWithFormat:@"sessionToken: %@, topic: %@", a4, a5];
      _os_log_impl(&dword_2378DA000, v24, OS_LOG_TYPE_INFO, "%s (%@)", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    uint64_t v25 = [NSString stringWithFormat:@"sessionToken: %@, topic: %@", a4, a5];
    unsigned int v37 = "-[FaceTimeServiceSession handler:relayInitiated:topic:peerID:peerPushToken:relayType:relayConnectionID:relayTr"
          "ansactionIDAlloc:relayTokenAllocReq:relayCandidateID:myRelayIP:myRelayPort:peerRelayIP:peerRelayPort:clientInfo:serviceData:]";
    uint64_t v39 = v25;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      uint64_t v26 = [NSString stringWithFormat:@"sessionToken: %@, topic: %@", a4, a5];
      unsigned int v37 = "-[FaceTimeServiceSession handler:relayInitiated:topic:peerID:peerPushToken:relayType:relayConnectionID:relay"
            "TransactionIDAlloc:relayTokenAllocReq:relayCandidateID:myRelayIP:myRelayPort:peerRelayIP:peerRelayPort:clien"
            "tInfo:serviceData:]";
      uint64_t v39 = v26;
      _IMAlwaysLog();
    }
  }
  if (-[FaceTimeServiceSession _checkBadPushToken:](self, "_checkBadPushToken:", a7, v37, v39))
  {
    uint64_t v27 = objc_msgSend(a4, "__imHexString");
    int v28 = [a5 isEqualToString:@"com.apple.private.ac"];
    if ([(FaceTimeServiceSession *)self _hasPeersForPeerID:a6 conferenceID:v27])
    {
      id v29 = [(FaceTimeServiceSession *)self _displayIDForPeerID:a6 conferenceID:v27];
      if (IMOSLoggingEnabled())
      {
        uint64_t v30 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v42 = v29;
          __int16 v43 = 2112;
          uint64_t v44 = (uint64_t)a6;
          _os_log_impl(&dword_2378DA000, v30, OS_LOG_TYPE_INFO, "Received relay initate push from: %@ (%@)", buf, 0x16u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        __int16 v38 = v29;
        id v40 = a6;
        _IMLoggingLog();
        if (_IMWillLog())
        {
          __int16 v38 = v29;
          id v40 = a6;
          _IMAlwaysLog();
        }
      }
      if (MarcoShouldLogCheckpoints())
      {
        __int16 v38 = v29;
        id v40 = a6;
        MarcoNoteCheckpoint();
      }
      id v31 = -[FaceTimeServiceSession _pushTokensForPeerID:conferenceID:](self, "_pushTokensForPeerID:conferenceID:", a6, v27, v38, v40);
      if ([v31 containsObject:a7])
      {
        [(NSMutableArray *)self->_initiatedConferences containsObject:v27];
        objc_msgSend((id)objc_msgSend(MEMORY[0x263F4A868], "sharedInstance"), "isScreenLocked");
        FTAWDLogCallRelayInitiateReceived();
        [NSDictionary dictionaryWithObject:objc_msgSend(NSString, "stringWithFormat:", @"%@", v27), @"ConferenceID" forKey];
        PLLogRegisteredEvent();
        id v32 = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
        uint64_t v33 = v32;
        if (a8) {
          CFDictionarySetValue(v32, (const void *)*MEMORY[0x263F4A800], a8);
        }
        if (value) {
          CFDictionarySetValue(v33, (const void *)*MEMORY[0x263F4A770], value);
        }
        if (a10) {
          CFDictionarySetValue(v33, (const void *)*MEMORY[0x263F4A7F8], a10);
        }
        if (a11) {
          CFDictionarySetValue(v33, (const void *)*MEMORY[0x263F4A7F0], a11);
        }
        if (a6) {
          CFDictionarySetValue(v33, (const void *)*MEMORY[0x263F4A778], a6);
        }
        if (a15) {
          CFDictionarySetValue(v33, (const void *)*MEMORY[0x263F4A790], a15);
        }
        if (a16) {
          CFDictionarySetValue(v33, (const void *)*MEMORY[0x263F4A7A8], a16);
        }
        if (a13) {
          CFDictionarySetValue(v33, (const void *)*MEMORY[0x263F4A7D0], a13);
        }
        if (a14) {
          CFDictionarySetValue(v33, (const void *)*MEMORY[0x263F4A7E8], a14);
        }
        if (a12) {
          CFDictionarySetValue(v33, (const void *)*MEMORY[0x263F4A7B8], a12);
        }
        uint64_t v34 = &OBJC_IVAR___FaceTimeServiceSession__broadcasterVCInvocationQueue;
        if (v28) {
          uint64_t v34 = &OBJC_IVAR___FaceTimeServiceSession__broadcasterACInvocationQueue;
        }
        objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v34), "account:relay:handleInitate:fromPerson:", -[IMDServiceSession accountID](self, "accountID"), objc_msgSend(a4, "__imHexString"), v33, sub_2378E5AEC(v29));
        -[FaceTimeServiceSession _retargetPeerID:displayID:pushToken:conferenceID:](self, "_retargetPeerID:displayID:pushToken:conferenceID:", a6, 0, a7, objc_msgSend(a4, "__imHexString"));
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v36 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            uint64_t v42 = (const char *)a7;
            __int16 v43 = 2112;
            uint64_t v44 = (uint64_t)v31;
            __int16 v45 = 2112;
            id v46 = a6;
            _os_log_impl(&dword_2378DA000, v36, OS_LOG_TYPE_INFO, "Response from token (%@) not in this conference set: %@ (%@)", buf, 0x20u);
          }
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          _IMLoggingLog();
          if (_IMWillLog()) {
            _IMAlwaysLog();
          }
        }
        if (MarcoShouldLogCheckpoints()) {
          MarcoNoteCheckpoint();
        }
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        id v35 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v42 = (const char *)a6;
          __int16 v43 = 2112;
          uint64_t v44 = v27;
          _os_log_impl(&dword_2378DA000, v35, OS_LOG_TYPE_INFO, "Ignoring this relay initiate, no peers with peerID %@ in conferenceID %@", buf, 0x16u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        _IMLoggingLog();
        if (_IMWillLog()) {
          _IMAlwaysLog();
        }
      }
    }
  }
}

- (void)handler:(id)a3 relayUpdated:(id)a4 topic:(id)a5 peerID:(id)a6 peerPushToken:(id)a7 relayType:(id)a8 relayConnectionID:(id)value relayTransactionIDChannelBind:(id)a10 relayTokenChannelBind:(id)a11 relayCandidateID:(id)a12 relayBlob:(id)a13 peerRelayNATIP:(id)a14 peerRelayNATPort:(id)a15 clientInfo:(id)a16 serviceData:(id)a17
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    uint64_t v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v41 = "-[FaceTimeServiceSession handler:relayUpdated:topic:peerID:peerPushToken:relayType:relayConnectionID:relayTr"
            "ansactionIDChannelBind:relayTokenChannelBind:relayCandidateID:relayBlob:peerRelayNATIP:peerRelayNATPort:clie"
            "ntInfo:serviceData:]";
      __int16 v42 = 2112;
      uint64_t v43 = [NSString stringWithFormat:@"sessionToken: %@, topic: %@", a4, a5];
      _os_log_impl(&dword_2378DA000, v23, OS_LOG_TYPE_INFO, "%s (%@)", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    uint64_t v24 = [NSString stringWithFormat:@"sessionToken: %@, topic: %@", a4, a5];
    uint64_t v36 = "-[FaceTimeServiceSession handler:relayUpdated:topic:peerID:peerPushToken:relayType:relayConnectionID:relayTran"
          "sactionIDChannelBind:relayTokenChannelBind:relayCandidateID:relayBlob:peerRelayNATIP:peerRelayNATPort:clientIn"
          "fo:serviceData:]";
    uint64_t v38 = v24;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      uint64_t v25 = [NSString stringWithFormat:@"sessionToken: %@, topic: %@", a4, a5];
      uint64_t v36 = "-[FaceTimeServiceSession handler:relayUpdated:topic:peerID:peerPushToken:relayType:relayConnectionID:relayTr"
            "ansactionIDChannelBind:relayTokenChannelBind:relayCandidateID:relayBlob:peerRelayNATIP:peerRelayNATPort:clie"
            "ntInfo:serviceData:]";
      uint64_t v38 = v25;
      _IMAlwaysLog();
    }
  }
  if (-[FaceTimeServiceSession _checkBadPushToken:](self, "_checkBadPushToken:", a7, v36, v38))
  {
    uint64_t v26 = objc_msgSend(a4, "__imHexString");
    if ([(FaceTimeServiceSession *)self _hasPeersForPeerID:a6 conferenceID:v26])
    {
      uint64_t v27 = [(FaceTimeServiceSession *)self _displayIDForPeerID:a6 conferenceID:v26];
      if (IMOSLoggingEnabled())
      {
        int v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v41 = v27;
          __int16 v42 = 2112;
          uint64_t v43 = (uint64_t)a6;
          _os_log_impl(&dword_2378DA000, v28, OS_LOG_TYPE_INFO, "Received relay update push from: %@ (%@)", buf, 0x16u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        unsigned int v37 = v27;
        id v39 = a6;
        _IMLoggingLog();
        if (_IMWillLog())
        {
          unsigned int v37 = v27;
          id v39 = a6;
          _IMAlwaysLog();
        }
      }
      if (MarcoShouldLogCheckpoints())
      {
        unsigned int v37 = v27;
        id v39 = a6;
        MarcoNoteCheckpoint();
      }
      id v29 = -[FaceTimeServiceSession _pushTokensForPeerID:conferenceID:](self, "_pushTokensForPeerID:conferenceID:", a6, v26, v37, v39);
      if ([v29 containsObject:a7])
      {
        [(NSMutableArray *)self->_initiatedConferences containsObject:v26];
        int v30 = [a5 isEqualToString:@"com.apple.private.ac"];
        objc_msgSend((id)objc_msgSend(MEMORY[0x263F4A868], "sharedInstance"), "isScreenLocked");
        FTAWDLogCallRelayUpdatedReceived();
        [NSDictionary dictionaryWithObject:objc_msgSend(NSString, "stringWithFormat:", @"%@", v26), @"ConferenceID" forKey];
        PLLogRegisteredEvent();
        id v31 = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
        id v32 = v31;
        if (a8) {
          CFDictionarySetValue(v31, (const void *)*MEMORY[0x263F4A800], a8);
        }
        if (value) {
          CFDictionarySetValue(v32, (const void *)*MEMORY[0x263F4A770], value);
        }
        if (a10) {
          CFDictionarySetValue(v32, (const void *)*MEMORY[0x263F4A7F8], a10);
        }
        if (a11) {
          CFDictionarySetValue(v32, (const void *)*MEMORY[0x263F4A7F0], a11);
        }
        if (a6) {
          CFDictionarySetValue(v32, (const void *)*MEMORY[0x263F4A778], a6);
        }
        if (a14) {
          CFDictionarySetValue(v32, (const void *)*MEMORY[0x263F4A798], a14);
        }
        if (a15) {
          CFDictionarySetValue(v32, (const void *)*MEMORY[0x263F4A7A0], a15);
        }
        if (a13) {
          CFDictionarySetValue(v32, (const void *)*MEMORY[0x263F4A7B0], a13);
        }
        if (a12) {
          CFDictionarySetValue(v32, (const void *)*MEMORY[0x263F4A7B8], a12);
        }
        uint64_t v33 = &OBJC_IVAR___FaceTimeServiceSession__broadcasterVCInvocationQueue;
        if (v30) {
          uint64_t v33 = &OBJC_IVAR___FaceTimeServiceSession__broadcasterACInvocationQueue;
        }
        objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v33), "account:relay:handleUpdate:fromPerson:", -[IMDServiceSession accountID](self, "accountID"), objc_msgSend(a4, "__imHexString"), v32, sub_2378E5AEC(v27));
        -[FaceTimeServiceSession _retargetPeerID:displayID:pushToken:conferenceID:](self, "_retargetPeerID:displayID:pushToken:conferenceID:", a6, 0, a7, objc_msgSend(a4, "__imHexString"));
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          id v35 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            uint64_t v41 = (const char *)a7;
            __int16 v42 = 2112;
            uint64_t v43 = (uint64_t)v29;
            __int16 v44 = 2112;
            id v45 = a6;
            _os_log_impl(&dword_2378DA000, v35, OS_LOG_TYPE_INFO, "Response from token (%@) not in this conference set: %@ (%@)", buf, 0x20u);
          }
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          _IMLoggingLog();
          if (_IMWillLog()) {
            _IMAlwaysLog();
          }
        }
        if (MarcoShouldLogCheckpoints()) {
          MarcoNoteCheckpoint();
        }
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v34 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v41 = (const char *)a6;
          __int16 v42 = 2112;
          uint64_t v43 = v26;
          _os_log_impl(&dword_2378DA000, v34, OS_LOG_TYPE_INFO, "Ignoring this relay update, no peers with peerID %@ in conferenceID %@", buf, 0x16u);
        }
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        _IMLoggingLog();
        if (_IMWillLog()) {
          _IMAlwaysLog();
        }
      }
    }
  }
}

- (void)handler:(id)a3 relayCancelled:(id)a4 topic:(id)a5 peerID:(id)a6 relayType:(id)a7 relayTokenAllocReq:(id)a8 relayConnectionID:(id)value relayTransactionIDAlloc:(id)a10 relayCandidateID:(id)a11 myRelayIP:(id)a12 myRelayPort:(id)a13 peerRelayIP:(id)a14 peerRelayPort:(id)a15 reason:(id)a16 clientInfo:(id)a17 serviceData:(id)a18
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  if (IMOSLoggingEnabled())
  {
    uint64_t v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v40 = "-[FaceTimeServiceSession handler:relayCancelled:topic:peerID:relayType:relayTokenAllocReq:relayConnectionID:"
            "relayTransactionIDAlloc:relayCandidateID:myRelayIP:myRelayPort:peerRelayIP:peerRelayPort:reason:clientInfo:serviceData:]";
      __int16 v41 = 2112;
      uint64_t v42 = [NSString stringWithFormat:@"sessionToken: %@, topic: %@", a4, a5];
      _os_log_impl(&dword_2378DA000, v24, OS_LOG_TYPE_INFO, "%s (%@)", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    uint64_t v25 = [NSString stringWithFormat:@"sessionToken: %@, topic: %@", a4, a5];
    id v35 = "-[FaceTimeServiceSession handler:relayCancelled:topic:peerID:relayType:relayTokenAllocReq:relayConnectionID:re"
          "layTransactionIDAlloc:relayCandidateID:myRelayIP:myRelayPort:peerRelayIP:peerRelayPort:reason:clientInfo:serviceData:]";
    uint64_t v37 = v25;
    _IMLoggingLog();
    if (_IMWillLog())
    {
      uint64_t v26 = [NSString stringWithFormat:@"sessionToken: %@, topic: %@", a4, a5];
      id v35 = "-[FaceTimeServiceSession handler:relayCancelled:topic:peerID:relayType:relayTokenAllocReq:relayConnectionID:"
            "relayTransactionIDAlloc:relayCandidateID:myRelayIP:myRelayPort:peerRelayIP:peerRelayPort:reason:clientInfo:serviceData:]";
      uint64_t v37 = v26;
      _IMAlwaysLog();
    }
  }
  uint64_t v27 = objc_msgSend(a4, "__imHexString", v35, v37);
  int v28 = [a5 isEqualToString:@"com.apple.private.ac"];
  if ([(FaceTimeServiceSession *)self _hasPeersForPeerID:a6 conferenceID:v27])
  {
    [NSDictionary dictionaryWithObject:objc_msgSend(NSString, "stringWithFormat:", @"%@", v27), @"ConferenceID" forKey];
    PLLogRegisteredEvent();
    id v29 = [(FaceTimeServiceSession *)self _displayIDForPeerID:a6 conferenceID:v27];
    if (IMOSLoggingEnabled())
    {
      int v30 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v40 = v29;
        __int16 v41 = 2112;
        uint64_t v42 = (uint64_t)a6;
        _os_log_impl(&dword_2378DA000, v30, OS_LOG_TYPE_INFO, "Received relay cancel push from: %@ (%@)", buf, 0x16u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      uint64_t v36 = v29;
      id v38 = a6;
      _IMLoggingLog();
      if (_IMWillLog())
      {
        uint64_t v36 = v29;
        id v38 = a6;
        _IMAlwaysLog();
      }
    }
    if (MarcoShouldLogCheckpoints())
    {
      uint64_t v36 = v29;
      id v38 = a6;
      MarcoNoteCheckpoint();
    }
    id v31 = (__CFDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v32 = v31;
    if (a7) {
      CFDictionarySetValue(v31, (const void *)*MEMORY[0x263F4A800], a7);
    }
    if (a8) {
      CFDictionarySetValue(v32, (const void *)*MEMORY[0x263F4A7F0], a8);
    }
    if (value) {
      CFDictionarySetValue(v32, (const void *)*MEMORY[0x263F4A770], value);
    }
    if (a10) {
      CFDictionarySetValue(v32, (const void *)*MEMORY[0x263F4A7F8], a10);
    }
    if (a11) {
      CFDictionarySetValue(v32, (const void *)*MEMORY[0x263F4A7B8], a11);
    }
    if (a12) {
      CFDictionarySetValue(v32, (const void *)*MEMORY[0x263F4A7D0], a12);
    }
    if (a13) {
      CFDictionarySetValue(v32, (const void *)*MEMORY[0x263F4A7E8], a13);
    }
    if (a14) {
      CFDictionarySetValue(v32, (const void *)*MEMORY[0x263F4A790], a14);
    }
    if (a15) {
      CFDictionarySetValue(v32, (const void *)*MEMORY[0x263F4A7A8], a15);
    }
    if (a6) {
      CFDictionarySetValue(v32, (const void *)*MEMORY[0x263F4A778], a6);
    }
    uint64_t v33 = &OBJC_IVAR___FaceTimeServiceSession__broadcasterVCInvocationQueue;
    if (v28) {
      uint64_t v33 = &OBJC_IVAR___FaceTimeServiceSession__broadcasterACInvocationQueue;
    }
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v33), "account:relay:handleCancel:fromPerson:", -[IMDServiceSession accountID](self, "accountID", v36, v38), objc_msgSend(a4, "__imHexString"), v32, sub_2378E5AEC(v29));
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v34 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v40 = (const char *)a6;
        __int16 v41 = 2112;
        uint64_t v42 = v27;
        _os_log_impl(&dword_2378DA000, v34, OS_LOG_TYPE_INFO, "Ignoring this relay cancel, no peers with peerID %@ in conferenceID %@", buf, 0x16u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      _IMLoggingLog();
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
    }
  }
}

- (unint64_t)queue:(id)a3 optionsForInvocation:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v6 = (const char *)[a4 selector];
  uint64_t v7 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = NSStringFromSelector(v6);
    _os_log_impl(&dword_2378DA000, v7, OS_LOG_TYPE_DEFAULT, "Checking queue options for: %@", buf, 0xCu);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
    {
      id v12 = NSStringFromSelector(v6);
      MarcoLog();
    }
    if (IMShouldLog())
    {
      id v12 = NSStringFromSelector(v6);
      IMLogString();
    }
  }
  if (objc_msgSend((id)qword_26AC13540, "hasQueuedItems", v12))
  {
    long long v8 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2378DA000, v8, OS_LOG_TYPE_DEFAULT, "This should queue normally", buf, 2u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog()) {
        MarcoLog();
      }
      if (IMShouldLog()) {
        IMLogString();
      }
    }
    return 1;
  }
  else
  {
    long long v10 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2378DA000, v10, OS_LOG_TYPE_DEFAULT, "This should just happen now!", buf, 2u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog()) {
        MarcoLog();
      }
      if (IMShouldLog()) {
        IMLogString();
      }
    }
    if (self->_broadcasterACInvocationQueue == a3) {
      id v11 = [(IMDServiceSession *)self broadcasterForACConferenceListeners];
    }
    else {
      id v11 = [(IMDServiceSession *)self broadcasterForVCConferenceListeners];
    }
    [a3 setTarget:v11];
    return 16;
  }
}

- (BOOL)queue:(id)a3 shouldInvoke:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v6 = (const char *)[a4 selector];
  uint64_t v7 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v17 = NSStringFromSelector(v6);
    _os_log_impl(&dword_2378DA000, v7, OS_LOG_TYPE_DEFAULT, "Checking to see if I can invoke: %@", buf, 0xCu);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (MarcoShouldLog())
    {
      uint64_t v15 = NSStringFromSelector(v6);
      MarcoLog();
    }
    if (IMShouldLog())
    {
      uint64_t v15 = NSStringFromSelector(v6);
      IMLogString();
    }
  }
  char v8 = objc_msgSend((id)qword_26AC13540, "hasQueuedItems", v15);
  if (v8)
  {
    long long v9 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [(id)qword_26AC13540 currentMessage];
      uint64_t v11 = [(id)qword_26AC13540 queuedMessages];
      *(_DWORD *)buf = 138412546;
      uint64_t v17 = (NSString *)v10;
      __int16 v18 = 2112;
      uint64_t v19 = v11;
      _os_log_impl(&dword_2378DA000, v9, OS_LOG_TYPE_DEFAULT, "Can't send yet, current delivery: %@ queued items: %@", buf, 0x16u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog())
      {
        [(id)qword_26AC13540 currentMessage];
        [(id)qword_26AC13540 queuedMessages];
        MarcoLog();
      }
      if (IMShouldLog())
      {
        [(id)qword_26AC13540 currentMessage];
        [(id)qword_26AC13540 queuedMessages];
        IMLogString();
      }
    }
  }
  else
  {
    id v12 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2378DA000, v12, OS_LOG_TYPE_DEFAULT, "Looks good to go, i'll send it along", buf, 2u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (MarcoShouldLog()) {
        MarcoLog();
      }
      if (IMShouldLog()) {
        IMLogString();
      }
    }
    if (self->_broadcasterACInvocationQueue == a3) {
      id v13 = [(IMDServiceSession *)self broadcasterForACConferenceListeners];
    }
    else {
      id v13 = [(IMDServiceSession *)self broadcasterForVCConferenceListeners];
    }
    [a3 setTarget:v13];
  }
  return v8 ^ 1;
}

- (id)loggingName
{
  if (self->_loggingCategory) {
    return self->_loggingCategory;
  }
  else {
    return @"FaceTime";
  }
}

- (double)_messageTimeoutTimeForMessage:(id)a3
{
  [a3 timeout];
  double v4 = v3;
  int v5 = IMGetCachedDomainIntForKey();
  if (v5 < 1)
  {
    return (double)(uint64_t)v4;
  }
  else
  {
    uint64_t v6 = v5;
    _IMWarn();
  }
  return (double)v6;
}

@end