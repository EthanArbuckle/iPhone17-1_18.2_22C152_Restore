@interface IDSDSessionController
+ (IDSDSessionController)sharedInstance;
- (BOOL)_isCleanupMeantForTheRightSession:(id)a3 clientChannelUUID:(id)a4;
- (BOOL)endAllSessionsForService:(id)a3 withReason:(unsigned int)a4;
- (FTMessageDelivery)messageDelivery;
- (IDSDSessionController)init;
- (id)_specificOriginatorFromURI:(id)a3 senderToken:(id)a4 accountUniqueID:(id)a5;
- (id)groupSessionGroupIDs;
- (id)sessionIDForAlias:(id)a3 salt:(id)a4;
- (id)sessionWithGroupID:(id)a3;
- (id)sessionWithGroupUUID:(id)a3;
- (id)sessionWithInstanceID:(id)a3;
- (id)sessionWithUniqueID:(id)a3;
- (id)setupNewIncomingSessionWithOptions:(id)a3;
- (id)setupNewOutgoingSessionWithOptions:(id)a3;
- (void)_handleClientDeath:(id)a3;
- (void)cleanupSession:(id)a3 shouldCleanSessionStatus:(BOOL)a4;
- (void)cleanupSessionWithChannelDestination:(id)a3 clientChannelUUID:(id)a4;
- (void)cleanupSessionWithInstanceID:(id)a3;
- (void)cleanupSessionsForClient:(id)a3;
- (void)dealloc;
- (void)processIncomingGroupSessionMessage:(id)a3 fromToken:(id)a4 fromURI:(id)a5 toURI:(id)a6 topic:(id)a7 idsMessageContext:(id)a8;
- (void)processIncomingInvitationWithPayload:(id)a3 topic:(id)a4 fromToken:(id)a5 fromURI:(id)a6 toURI:(id)a7 idsMessageContext:(id)a8 messageContext:(id)a9;
- (void)processIncomingSessionAcceptMessage:(id)a3 fromToken:(id)a4 fromURI:(id)a5 idsMessageContext:(id)a6;
- (void)processIncomingSessionCancelMessage:(id)a3 fromToken:(id)a4 fromURI:(id)a5 idsMessageContext:(id)a6;
- (void)processIncomingSessionDeclineMessage:(id)a3 fromToken:(id)a4 fromURI:(id)a5 idsMessageContext:(id)a6;
- (void)processIncomingSessionEndMessage:(id)a3 fromToken:(id)a4 fromURI:(id)a5 idsMessageContext:(id)a6;
- (void)processIncomingSessionMessage:(id)a3 fromToken:(id)a4 fromURI:(id)a5 idsMessageContext:(id)a6;
- (void)processIncomingSessionReinitiateMessage:(id)a3 fromToken:(id)a4 fromURI:(id)a5 idsMessageContext:(id)a6;
- (void)updateCriticalReliabilityState;
@end

@implementation IDSDSessionController

+ (IDSDSessionController)sharedInstance
{
  if (qword_100A4AAE0 != -1) {
    dispatch_once(&qword_100A4AAE0, &stru_100985FD0);
  }
  v2 = (void *)qword_100A4AAE8;

  return (IDSDSessionController *)v2;
}

- (IDSDSessionController)init
{
  v15.receiver = self;
  v15.super_class = (Class)IDSDSessionController;
  v2 = [(IDSDSessionController *)&v15 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    sessions = v3->_sessions;
    v3->_sessions = v4;

    id v6 = objc_alloc((Class)IMMultiQueue);
    v7 = im_primary_queue();
    v8 = (IMMultiQueue *)[v6 initWithQueue:v7];
    sessionIDMultiQueue = v3->_sessionIDMultiQueue;
    v3->_sessionIDMultiQueue = v8;

    v10 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Building Message delivery", v14, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    v11 = (FTMessageDelivery *)objc_alloc_init((Class)+[FTMessageDelivery APNSMessageDeliveryClass]);
    messageDelivery = v3->_messageDelivery;
    v3->_messageDelivery = v11;

    [(FTMessageDelivery *)v3->_messageDelivery setUserAgent:@"com.apple.invitation-service"];
  }
  return v3;
}

- (void)dealloc
{
  [(FTMessageDelivery *)self->_messageDelivery invalidate];
  messageDelivery = self->_messageDelivery;
  self->_messageDelivery = 0;

  v4.receiver = self;
  v4.super_class = (Class)IDSDSessionController;
  [(IDSDSessionController *)&v4 dealloc];
}

- (id)setupNewOutgoingSessionWithOptions:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKey:IDSSessionAccountIDKey];
  id v6 = [v4 objectForKey:IDSSessionDestinationsKey];
  v28 = +[NSSet setWithArray:v6];

  v7 = [v4 objectForKey:IDSSessionUniqueIDKey];
  v26 = [v4 objectForKey:IDSSessionInstanceIDKey];
  v27 = [v4 objectForKey:IDSSessionTransportTypeKey];
  v8 = +[IDSDAccountController sharedInstance];
  v9 = [v8 accountWithUniqueID:v5];

  v10 = [v9 service];
  v11 = [v10 displayName];
  if (![v5 length])
  {
    v17 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Missing accountID for outgoing session, bailing...", buf, 2u);
    }
    goto LABEL_37;
  }
  if (![v28 count])
  {
    v12 = [v4 objectForKey:kIDSQRAllocateKey_AllocateType];
    if (!v12 && [0 intValue] != 2)
    {
      v17 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Missing destinations for outgoing session, bailing...", buf, 2u);
      }
      goto LABEL_37;
    }
  }
  if (v27)
  {
    if ([v7 length])
    {
      os_unfair_lock_lock(&self->_lock);
      v13 = [(NSMutableDictionary *)self->_sessions objectForKey:v7];
      os_unfair_lock_unlock(&self->_lock);
      if (v13)
      {
        if (!v26)
        {
          v20 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v32 = v7;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Already have an existing session with uniqueID %@, bailing...", buf, 0xCu);
          }

          DLCWarn();
          v19 = 0;
          goto LABEL_34;
        }
        v14 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          [(IDSDSession *)v13 instanceID];
          *(_DWORD *)buf = 138412802;
          v32 = v7;
          v34 = __int16 v33 = 2112;
          __int16 v35 = 2112;
          v36 = v26;
          v25 = (void *)v34;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Found existing session matching uniqueID -- replacing with new instance { uniqueID: %@, oldInstanceID: %@, newInstanceID: %@ }", buf, 0x20u);
        }
        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          v23 = [(IDSDSession *)v13 instanceID];
          v24 = v26;
          v22 = v7;
          _IDSLogV();
        }
        -[IDSDSessionController cleanupSession:shouldCleanSessionStatus:](self, "cleanupSession:shouldCleanSessionStatus:", v7, 1, v22, v23, v24);
      }
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_1001F542C;
      v29[3] = &unk_10097E990;
      id v30 = v10;
      objc_super v15 = objc_msgSend(v28, "__imSetByApplyingBlock:", v29);
      v13 = [[IDSDSession alloc] initWithAccount:v5 destinations:v15 options:v4];
      if (v13)
      {
        os_unfair_lock_lock(&self->_lock);
        [(NSMutableDictionary *)self->_sessions setObject:v13 forKey:v7];
        os_unfair_lock_unlock(&self->_lock);
        v16 = v13;
      }
      else
      {
        v18 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to create outgoing session.", buf, 2u);
        }

        DLCWarn();
      }

      v19 = v13;
LABEL_34:

      goto LABEL_38;
    }
    v17 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Missing uniqueID for outgoing session, bailing...", buf, 2u);
    }
  }
  else
  {
    v17 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Missing transport type for outgoing session, bailing...", buf, 2u);
    }
  }
LABEL_37:

  DLCWarn();
  v19 = 0;
LABEL_38:

  return v19;
}

- (id)setupNewIncomingSessionWithOptions:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKey:IDSSessionAccountIDKey];
  id v6 = [v4 objectForKey:IDSSessionDestinationsKey];
  v21 = [v4 objectForKey:IDSSessionUniqueIDKey];
  v20 = [v4 objectForKey:IDSSessionTransportTypeKey];
  v19 = [v4 objectForKey:IDSDSessionMessageBlob];
  v7 = +[IDSDAccountController sharedInstance];
  v8 = [v7 accountWithUniqueID:v5];

  v9 = [v8 service];
  v10 = [v9 displayName];
  if (![v5 length])
  {
    v14 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Missing accountID for incoming session, bailing...", buf, 2u);
    }
    goto LABEL_22;
  }
  if (![v6 count])
  {
    v14 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Missing destinations for incoming session, bailing...", buf, 2u);
    }
    goto LABEL_22;
  }
  if (!v20)
  {
    v14 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Missing transport type for incoming session, bailing...", buf, 2u);
    }
    goto LABEL_22;
  }
  if (![(__CFString *)v21 length])
  {
    v14 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Missing uniqueID for incoming session, bailing...", buf, 2u);
    }
LABEL_22:

    DLCWarn();
LABEL_23:
    objc_super v15 = 0;
    goto LABEL_24;
  }
  os_unfair_lock_lock(&self->_lock);
  v11 = [(NSMutableDictionary *)self->_sessions allKeys];
  unsigned int v12 = [v11 containsObject:v21];

  os_unfair_lock_unlock(&self->_lock);
  if (v12)
  {
    v13 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v23 = v21;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "We already have an existing session with unique ID %@, ignoring self invite...", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    goto LABEL_23;
  }
  objc_super v15 = [[IDSDSession alloc] initWithAccount:v5 destinations:v6 options:v4];
  if (v15)
  {
    os_unfair_lock_lock(&self->_lock);
    [(NSMutableDictionary *)self->_sessions setObject:v15 forKey:v21];
    os_unfair_lock_unlock(&self->_lock);
    [(IDSDSession *)v15 setRemoteBlob:v19];
    v17 = v15;
  }
  else
  {
    v18 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v23 = @"SessionController";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@ - Failed to create incoming session", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }

LABEL_24:

  return v15;
}

- (void)processIncomingInvitationWithPayload:(id)a3 topic:(id)a4 fromToken:(id)a5 fromURI:(id)a6 toURI:(id)a7 idsMessageContext:(id)a8 messageContext:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v95 = a5;
  id v16 = a6;
  id v97 = a7;
  id v17 = a8;
  id v91 = a9;
  v90 = v17;
  v18 = [v17 objectForKey:IDSMessageContextFromServerStorageKey];
  unsigned int v19 = [v18 BOOLValue];

  v20 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v21 = @"NO";
    *(_DWORD *)buf = 138413570;
    *(void *)&uint8_t buf[4] = v14;
    __int16 v109 = 2112;
    if (v19) {
      CFStringRef v21 = @"YES";
    }
    id v110 = v15;
    __int16 v111 = 2112;
    id v112 = v95;
    __int16 v113 = 2112;
    id v114 = v16;
    __int16 v115 = 2112;
    id v116 = v97;
    __int16 v117 = 2112;
    CFStringRef v118 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Received incoming invitation with payload %@ topic %@ fromToken %@ fromURI %@ toURI %@ fromStorage %@", buf, 0x3Eu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    v22 = v19 ? @"YES" : @"NO";
    id v87 = v97;
    v88 = v22;
    id v85 = v95;
    id v86 = v16;
    id v83 = v14;
    id v84 = v15;
    _IDSLogTransport();
    if (_IDSShouldLog())
    {
      id v87 = v97;
      v88 = v22;
      id v85 = v95;
      id v86 = v16;
      id v83 = v14;
      id v84 = v15;
      _IDSLogV();
    }
  }
  CFStringRef v23 = +[IDSDServiceController sharedInstance];
  v96 = [v23 serviceWithPushTopic:v15];

  v93 = [v96 displayName];
  uint64_t v24 = objc_opt_class();
  v94 = sub_1001F6828(v24, v14, IDSDSessionMessageSessionID);
  if ([v94 length])
  {
    v25 = +[IDSDAccountController sharedInstance];
    v26 = [v97 prefixedURI];
    v27 = [v25 accountOnService:v96 withAliasURI:v26];

    v28 = [v16 prefixedURI];
    LODWORD(v26) = [v28 hasPrefix:@"device:"];

    if (v26)
    {
      v89 = [v16 unprefixedURI];
      if (v27) {
        goto LABEL_27;
      }
    }
    else
    {
      v89 = 0;
      if (v27) {
        goto LABEL_27;
      }
    }
    id v30 = [v97 prefixedURI];
    if ([v30 length])
    {
      v27 = 0;
    }
    else
    {
      v31 = [v16 prefixedURI];
      if ([v31 isEqualToIgnoringCase:IDSDefaultPairedDevice])
      {
      }
      else
      {
        v32 = +[IDSPairingManager sharedInstance];
        __int16 v33 = [v32 pairedDeviceUniqueID];
        unsigned int v34 = [v89 isEqualToIgnoringCase:v33];

        if (!v34)
        {
          v27 = 0;
          goto LABEL_27;
        }
      }
      id v30 = +[IDSDAccountController sharedInstance];
      v27 = [v30 localAccountOnService:v96];
    }

LABEL_27:
    __int16 v35 = [v27 uniqueID];
    v36 = [(IDSDSessionController *)self _specificOriginatorFromURI:v16 senderToken:v95 accountUniqueID:v35];

    v37 = [v36 prefixedURI];
    BOOL v38 = [v37 length] == 0;

    if (v38)
    {
      v42 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "Missing originator for session invitation, bailing...", buf, 2u);
      }

      DLCWarn();
    }
    else
    {
      v39 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Creating IDSSession for incoming invite", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      v40 = +[NSMutableDictionary dictionary];
      v41 = [v27 uniqueID];
      if (v41)
      {
        CFDictionarySetValue(v40, IDSSessionAccountIDKey, v41);
      }
      else
      {
        id v43 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1007173B4();
        }
      }
      id v44 = v97;
      if (v44)
      {
        CFDictionarySetValue(v40, IDSSessionToIDKey, v44);
      }
      else
      {
        id v45 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10071732C();
        }
      }
      v46 = +[NSSet setWithObject:v36];
      if (v46)
      {
        CFDictionarySetValue(v40, IDSSessionDestinationsKey, v46);
      }
      else
      {
        id v47 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1007172A4();
        }
      }
      id v48 = v94;
      if (v48)
      {
        CFDictionarySetValue(v40, IDSSessionUniqueIDKey, v48);
      }
      else
      {
        id v49 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10071721C();
        }
      }
      CFDictionarySetValue(v40, IDSSessionIsInitiatorKey, &__kCFBooleanFalse);
      v50 = [v14 objectForKey:IDSDSessionMessageTransportType];
      if (v50)
      {
        CFDictionarySetValue(v40, IDSSessionTransportTypeKey, v50);
      }
      else
      {
        id v51 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100717194();
        }
      }
      v52 = [v14 objectForKey:IDSDSessionMessageVersion];
      if (v52)
      {
        CFDictionarySetValue(v40, IDSSessionPeerProtocolVersionKey, v52);
      }
      else
      {
        id v53 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10071710C();
        }
      }
      v54 = [v14 objectForKey:IDSDSessionMessageConnectionCountHint];
      if (v54)
      {
        CFDictionarySetValue(v40, IDSSessionConnectionCountHintKey, v54);
      }
      else
      {
        id v55 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100717084();
        }
      }
      v56 = [v14 objectForKey:IDSDSessionMessageNeedsToWaitForPreConnectionData];
      if (v56)
      {
        CFDictionarySetValue(v40, IDSSessionWaitForPreConnectionDataKey, v56);
      }
      else
      {
        id v57 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100716FFC();
        }
      }
      v58 = [v14 objectForKey:IDSDSessionMessageDisableEncryption];
      if (v58) {
        CFDictionarySetValue(v40, IDSSessionDisableEncryptionKey, v58);
      }

      v59 = [v14 objectForKey:IDSDSessionMessageSingleChannelDirectMode];
      if (v59) {
        CFDictionarySetValue(v40, IDSSessionSingleChannelDirectModeKey, v59);
      }

      v60 = [v14 objectForKey:IDSDSessionMessageUseStunMessageIntegrity];
      if (v60) {
        CFDictionarySetValue(v40, IDSSessionUseStunMessageIntegrityKey, v60);
      }

      v61 = [v14 objectForKey:IDSDSessionMessageUseSecureQRControlMessage];
      if (v61) {
        CFDictionarySetValue(v40, IDSSessionUseSecureQRControlMessageKey, v61);
      }

      v62 = (const void *)IDSDSessionMessageBlob;
      v63 = [v14 objectForKey:IDSDSessionMessageBlob];
      if (v63)
      {
        CFDictionarySetValue(v40, v62, v63);
      }
      else
      {
        id v64 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100716F74((uint64_t)v62, v65, v66, v67, v68, v69, v70, v71);
        }
      }
      v72 = [v14 objectForKey:IDSDSessionMessageIsRealTime];
      if (v72) {
        CFDictionarySetValue(v40, IDSSessionIsRealTimeKey, v72);
      }

      v73 = (const void *)IDSSessionUnauthenticatedPublicKey;
      v74 = [v14 objectForKey:IDSSessionUnauthenticatedPublicKey];
      if (v74) {
        CFDictionarySetValue(v40, v73, v74);
      }

      v75 = (const void *)IDSDSessionMessageAssumeRemoteDeviceEncryption;
      v76 = [v14 objectForKey:IDSDSessionMessageAssumeRemoteDeviceEncryption];
      if (v76) {
        CFDictionarySetValue(v40, v75, v76);
      }

      v77 = +[IDSFoundationLog SessionController];
      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v36;
        __int16 v109 = 2112;
        id v110 = v48;
        _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "Enqueuing incoming session invitation block from %@ with key %@", buf, 0x16u);
      }

      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      sessionIDMultiQueue = self->_sessionIDMultiQueue;
      v98[0] = _NSConcreteStackBlock;
      v98[1] = 3221225472;
      v98[2] = sub_1001F68E4;
      v98[3] = &unk_100986070;
      objc_copyWeak(&v107, (id *)buf);
      v79 = v40;
      v99 = v79;
      id v100 = v93;
      id v101 = v14;
      id v102 = v15;
      id v80 = v48;
      v81 = v44;
      id v82 = v80;
      id v103 = v80;
      id v104 = v81;
      id v105 = v36;
      id v106 = v91;
      [(IMMultiQueue *)sessionIDMultiQueue addBlock:v98 withTimeout:v82 forKey:@"Process incoming session %@ accept message" description:65.0];

      objc_destroyWeak(&v107);
      objc_destroyWeak((id *)buf);
    }
    goto LABEL_99;
  }
  v29 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "No sessionID provided in invitation, bailing...", buf, 2u);
  }

  DLCWarn();
LABEL_99:
}

- (void)processIncomingSessionAcceptMessage:(id)a3 fromToken:(id)a4 fromURI:(id)a5 idsMessageContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = objc_opt_class();
  id v15 = sub_1001F6828(v14, v10, IDSDSessionMessageSessionID);
  id v16 = +[IDSDSessionController sharedInstance];
  id v17 = [v16 sessionWithUniqueID:v15];

  if (v17)
  {
    v18 = [v17 accountID];
    unsigned int v19 = [(IDSDSessionController *)self _specificOriginatorFromURI:v12 senderToken:v11 accountUniqueID:v18];

    v20 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v19;
      __int16 v29 = 2112;
      id v30 = v15;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Enqueuing incoming session accept block from %@ with key %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    sessionIDMultiQueue = self->_sessionIDMultiQueue;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1001F7AC4;
    v23[3] = &unk_100986098;
    id v24 = v17;
    id v25 = v10;
    id v26 = v19;
    id v22 = v19;
    [(IMMultiQueue *)sessionIDMultiQueue addBlock:v23 withTimeout:v15 forKey:@"Process incoming session %@ accept message" description:10.0];
  }
}

- (void)processIncomingSessionDeclineMessage:(id)a3 fromToken:(id)a4 fromURI:(id)a5 idsMessageContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = objc_opt_class();
  id v15 = sub_1001F6828(v14, v10, IDSDSessionMessageSessionID);
  id v16 = +[IDSDSessionController sharedInstance];
  id v17 = [v16 sessionWithUniqueID:v15];

  if (v17)
  {
    v18 = [v17 accountID];
    unsigned int v19 = [(IDSDSessionController *)self _specificOriginatorFromURI:v12 senderToken:v11 accountUniqueID:v18];

    v20 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v19;
      __int16 v29 = 2112;
      id v30 = v15;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Enqueuing incoming session decline block from %@ with key %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    sessionIDMultiQueue = self->_sessionIDMultiQueue;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1001F7DD0;
    v23[3] = &unk_100986098;
    id v24 = v17;
    id v25 = v10;
    id v26 = v19;
    id v22 = v19;
    [(IMMultiQueue *)sessionIDMultiQueue addBlock:v23 withTimeout:v15 forKey:@"Process incoming session %@ decline message" description:10.0];
  }
}

- (void)processIncomingSessionCancelMessage:(id)a3 fromToken:(id)a4 fromURI:(id)a5 idsMessageContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = objc_opt_class();
  id v15 = sub_1001F6828(v14, v10, IDSDSessionMessageSessionID);
  id v16 = +[IDSDSessionController sharedInstance];
  id v17 = [v16 sessionWithUniqueID:v15];

  if (v17)
  {
    v18 = [v17 accountID];
    unsigned int v19 = [(IDSDSessionController *)self _specificOriginatorFromURI:v12 senderToken:v11 accountUniqueID:v18];

    v20 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v19;
      __int16 v29 = 2112;
      id v30 = v15;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Enqueuing incoming session cancel block from %@ with key %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    sessionIDMultiQueue = self->_sessionIDMultiQueue;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1001F80DC;
    v23[3] = &unk_100986098;
    id v24 = v17;
    id v25 = v10;
    id v26 = v19;
    id v22 = v19;
    [(IMMultiQueue *)sessionIDMultiQueue addBlock:v23 withTimeout:v15 forKey:@"Process incoming session %@ cancel message" description:10.0];
  }
}

- (void)processIncomingSessionMessage:(id)a3 fromToken:(id)a4 fromURI:(id)a5 idsMessageContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = objc_opt_class();
  id v15 = sub_1001F6828(v14, v10, IDSDSessionMessageSessionID);
  id v16 = +[IDSDSessionController sharedInstance];
  id v17 = [v16 sessionWithUniqueID:v15];

  if (v17)
  {
    v18 = [v17 accountID];
    unsigned int v19 = [(IDSDSessionController *)self _specificOriginatorFromURI:v12 senderToken:v11 accountUniqueID:v18];

    v20 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v19;
      __int16 v29 = 2112;
      id v30 = v15;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Enqueuing incoming session message block from %@ with key %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    sessionIDMultiQueue = self->_sessionIDMultiQueue;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1001F83E8;
    v23[3] = &unk_100986098;
    id v24 = v17;
    id v25 = v10;
    id v26 = v19;
    id v22 = v19;
    [(IMMultiQueue *)sessionIDMultiQueue addBlock:v23 withTimeout:v15 forKey:@"Process incoming session %@ session message" description:10.0];
  }
}

- (void)processIncomingSessionEndMessage:(id)a3 fromToken:(id)a4 fromURI:(id)a5 idsMessageContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = objc_opt_class();
  id v15 = sub_1001F6828(v14, v10, IDSDSessionMessageSessionID);
  id v16 = +[IDSDSessionController sharedInstance];
  id v17 = [v16 sessionWithUniqueID:v15];

  if (v17)
  {
    v18 = [v17 accountID];
    unsigned int v19 = [(IDSDSessionController *)self _specificOriginatorFromURI:v12 senderToken:v11 accountUniqueID:v18];

    v20 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v19;
      __int16 v29 = 2112;
      id v30 = v15;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Enqueuing incoming session end block from %@ with key %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    sessionIDMultiQueue = self->_sessionIDMultiQueue;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1001F86F4;
    v23[3] = &unk_100986098;
    id v24 = v17;
    id v25 = v10;
    id v26 = v19;
    id v22 = v19;
    [(IMMultiQueue *)sessionIDMultiQueue addBlock:v23 withTimeout:v15 forKey:@"Process incoming session %@ end message" description:10.0];
  }
}

- (void)processIncomingSessionReinitiateMessage:(id)a3 fromToken:(id)a4 fromURI:(id)a5 idsMessageContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = objc_opt_class();
  id v15 = sub_1001F6828(v14, v10, IDSDSessionMessageSessionID);
  id v16 = +[IDSDSessionController sharedInstance];
  id v17 = [v16 sessionWithUniqueID:v15];

  if (v17)
  {
    v18 = [v17 accountID];
    unsigned int v19 = [(IDSDSessionController *)self _specificOriginatorFromURI:v12 senderToken:v11 accountUniqueID:v18];

    v20 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v19;
      __int16 v29 = 2112;
      id v30 = v15;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Enqueuing incoming session reinitiate block from %@ with key %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    sessionIDMultiQueue = self->_sessionIDMultiQueue;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1001F8A00;
    v23[3] = &unk_100986098;
    id v24 = v17;
    id v25 = v10;
    id v26 = v19;
    id v22 = v19;
    [(IMMultiQueue *)sessionIDMultiQueue addBlock:v23 withTimeout:v15 forKey:@"Process incoming session %@ reinitiate teardown message" description:10.0];
  }
}

- (void)processIncomingGroupSessionMessage:(id)a3 fromToken:(id)a4 fromURI:(id)a5 toURI:(id)a6 topic:(id)a7 idsMessageContext:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v48 = a6;
  id v17 = a7;
  id v18 = a8;
  id v51 = [v18 objectForKeyedSubscript:IDSMessageContextServerTimestampKey];
  [v51 doubleValue];
  id v47 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
  uint64_t v19 = objc_opt_class();
  v50 = sub_1001F6828(v19, v14, IDSFanoutMessageGroupIDKey);
  uint64_t v20 = objc_opt_class();
  CFStringRef v21 = sub_1001F6828(v20, v14, IDSDSessionMessageSessionID);
  id v22 = +[IDSDSessionController sharedInstance];
  CFStringRef v23 = [v22 sessionWithUniqueID:v21];

  id v24 = [v23 accountID];
  id v45 = [(IDSDSessionController *)self _specificOriginatorFromURI:v16 senderToken:v15 accountUniqueID:v24];

  char v46 = IMGetDomainBoolForKey();
  if (v17) {
    BOOL v25 = v18 == 0;
  }
  else {
    BOOL v25 = 1;
  }
  char v26 = v25;
  char v44 = v26;
  v27 = @"Push";
  if (v25) {
    v27 = @"QR";
  }
  id v43 = v27;
  v28 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v29 = IDSLoggableDescriptionForObjectOnService();
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v16;
    __int16 v69 = 2112;
    uint64_t v70 = v50;
    __int16 v71 = 2112;
    v72 = v21;
    __int16 v73 = 2112;
    v74 = v29;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Enqueuing incoming group session message block fromID %@ with the group %@ sessionID %@ (message %@)", buf, 0x2Au);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    v39 = IDSLoggableDescriptionForObjectOnService();
    _IDSLogV();
  }
  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  sessionIDMultiQueue = self->_sessionIDMultiQueue;
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_1001F8F74;
  v52[3] = &unk_1009860E0;
  id v40 = v14;
  id v53 = v40;
  id v41 = v15;
  id v54 = v41;
  id v42 = v16;
  id v55 = v42;
  id v49 = v48;
  id v56 = v49;
  id v31 = v17;
  id v57 = v31;
  id v32 = v18;
  id v58 = v32;
  char v66 = v46;
  objc_copyWeak(&v65, (id *)buf);
  __int16 v33 = v43;
  v59 = v33;
  char v67 = v44;
  id v34 = v23;
  id v60 = v34;
  id v35 = v45;
  id v61 = v35;
  id v36 = v50;
  id v62 = v36;
  id v37 = v21;
  id v63 = v37;
  id v38 = v47;
  id v64 = v38;
  [(IMMultiQueue *)sessionIDMultiQueue addBlock:v52 withTimeout:v36 forKey:@"Process incoming group session %@ session message" description:10.0];

  objc_destroyWeak(&v65);
  objc_destroyWeak((id *)buf);
}

- (void)cleanupSession:(id)a3 shouldCleanSessionStatus:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6
    && (os_unfair_lock_lock(&self->_lock),
        [(NSMutableDictionary *)self->_sessions objectForKey:v6],
        v7 = objc_claimAutoreleasedReturnValue(),
        os_unfair_lock_unlock(&self->_lock),
        v7))
  {
    v8 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v9 = @"NO";
      if (v4) {
        CFStringRef v9 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      id v15 = v6;
      __int16 v16 = 2112;
      CFStringRef v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Cleaning up session %@, shouldCleanSessionStatus: %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      CFStringRef v10 = @"NO";
      if (v4) {
        CFStringRef v10 = @"YES";
      }
      id v12 = v6;
      CFStringRef v13 = v10;
      _IDSLogV();
    }
    objc_msgSend(v7, "cleanupSessionWithCleanStatus:", v4, v12, v13);
    if (v4)
    {
      os_unfair_lock_lock(&self->_lock);
      [(NSMutableDictionary *)self->_sessions removeObjectForKey:v6];
      os_unfair_lock_unlock(&self->_lock);
    }
  }
  else
  {
    id v11 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Couldn't find the session %@ to clean up!", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    v7 = 0;
  }
}

- (void)cleanupSessionWithInstanceID:(id)a3
{
  id v4 = a3;
  v5 = [(IDSDSessionController *)self sessionWithInstanceID:v4];
  id v6 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [v5 uniqueID];
    *(_DWORD *)buf = 138412546;
    id v12 = v4;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Cleaning up session based on instanceID { instanceID: %@, correspondingUniqueID: %@ }", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    [v5 uniqueID];
    CFStringRef v10 = v9 = v4;
    _IDSLogV();
  }
  v8 = objc_msgSend(v5, "uniqueID", v9, v10);
  [(IDSDSessionController *)self cleanupSession:v8 shouldCleanSessionStatus:1];
}

- (BOOL)_isCleanupMeantForTheRightSession:(id)a3 clientChannelUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (v6)
  {
    id v9 = [(NSMutableDictionary *)self->_sessions objectForKey:v6];
  }
  else
  {
    id v9 = 0;
  }
  CFStringRef v10 = [v9 clientChannelUUID];
  unsigned __int8 v11 = [v7 isEqual:v10];

  os_unfair_lock_unlock(p_lock);
  return v11;
}

- (void)cleanupSessionWithChannelDestination:(id)a3 clientChannelUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 componentsSeparatedByString:@":"];
  if ((unint64_t)[v8 count] >= 2)
  {
    id v9 = [v8 objectAtIndex:1];
    if ([(IDSDSessionController *)self _isCleanupMeantForTheRightSession:v9 clientChannelUUID:v7])
    {
      [(IDSDSessionController *)self cleanupSession:v9 shouldCleanSessionStatus:0];
    }
    else
    {
      CFStringRef v10 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v12 = v6;
        __int16 v13 = 2112;
        id v14 = v7;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "skip cleanupSessionWithChannelDestination for destination %@ and clientChannelUUID %@", buf, 0x16u);
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

- (void)cleanupSessionsForClient:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Cleaning up session(s) for client ID: %@ because it died", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        id v15 = v4;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          id v15 = v4;
          _IDSLogV();
        }
      }
    }
    id v19 = objc_alloc_init((Class)NSMutableArray);
    id v18 = objc_alloc_init((Class)NSMutableArray);
    os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = [(NSMutableDictionary *)self->_sessions allKeys];
    id v7 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          CFStringRef v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          unsigned __int8 v11 = -[NSMutableDictionary objectForKey:](self->_sessions, "objectForKey:", v10, v15);
          id v12 = [v11 clientID];
          unsigned int v13 = [v12 isEqualToIgnoringCase:v4];

          if (v13)
          {
            id v14 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v25 = v10;
              __int16 v26 = 2112;
              id v27 = v4;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Cleaning up session: %@ for client ID: %@", buf, 0x16u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                id v15 = v10;
                id v16 = v4;
                _IDSLogTransport();
                if (_IDSShouldLog())
                {
                  id v15 = v10;
                  id v16 = v4;
                  _IDSLogV();
                }
              }
            }
            objc_msgSend(v19, "addObject:", v10, v15, v16);
            [v18 addObject:v11];
          }
        }
        id v7 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v7);
    }

    os_unfair_lock_unlock(lock);
    [v18 enumerateObjectsUsingBlock:&stru_100986120];
    os_unfair_lock_lock(lock);
    [(NSMutableDictionary *)self->_sessions removeObjectsForKeys:v19];
    os_unfair_lock_unlock(lock);
  }
}

- (BOOL)endAllSessionsForService:(id)a3 withReason:(unsigned int)a4
{
  id v5 = a3;
  if ([v5 length])
  {
    id v6 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v32 = v5;
      __int16 v33 = 2048;
      unint64_t v34 = a4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Cleaning up session(s) for service: %@ with reason %ld", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        id v18 = v5;
        id v19 = (id)a4;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          id v18 = v5;
          id v19 = (id)a4;
          _IDSLogV();
        }
      }
    }
    id v23 = objc_alloc_init((Class)NSMutableArray);
    id v22 = objc_alloc_init((Class)NSMutableArray);
    os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v7 = [(NSMutableDictionary *)self->_sessions allKeys];
    id v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v27;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(v7);
          }
          unsigned __int8 v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          id v12 = -[NSMutableDictionary objectForKey:](self->_sessions, "objectForKey:", v11, v18, v19);
          unsigned int v13 = [v12 getFromService];
          unsigned int v14 = [v13 isEqualToIgnoringCase:v5];

          if (v14)
          {
            id v15 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v32 = v11;
              __int16 v33 = 2112;
              unint64_t v34 = (unint64_t)v5;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Cleaning up session: %@ for service: %@", buf, 0x16u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                id v18 = v11;
                id v19 = v5;
                _IDSLogTransport();
                if (_IDSShouldLog())
                {
                  id v18 = v11;
                  id v19 = v5;
                  _IDSLogV();
                }
              }
            }
            objc_msgSend(v23, "addObject:", v11, v18, v19);
            [v22 addObject:v12];
          }
        }
        id v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v8);
    }

    os_unfair_lock_unlock(lock);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1001FB284;
    v24[3] = &unk_100986140;
    unsigned int v25 = a4;
    [v22 enumerateObjectsUsingBlock:v24];
    os_unfair_lock_lock(lock);
    [(NSMutableDictionary *)self->_sessions removeObjectsForKeys:v23];
    os_unfair_lock_unlock(lock);
    BOOL v16 = [v23 count] != 0;
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (void)_handleClientDeath:(id)a3
{
  id v17 = a3;
  id v18 = [v17 userInfo];
  if (v18)
  {
    id v4 = [v18 objectForKey:@"IDSDaemonClientID"];
    if (v4)
    {
      id v20 = objc_alloc_init((Class)NSMutableArray);
      id v19 = objc_alloc_init((Class)NSMutableArray);
      os_unfair_lock_t lock = &self->_lock;
      os_unfair_lock_lock(&self->_lock);
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v5 = [(NSMutableDictionary *)self->_sessions allKeys];
      id v6 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v22;
        do
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v22 != v7) {
              objc_enumerationMutation(v5);
            }
            uint64_t v9 = *(void *)(*((void *)&v21 + 1) + 8 * i);
            CFStringRef v10 = [(NSMutableDictionary *)self->_sessions objectForKey:v9];
            unsigned __int8 v11 = [v10 clientID];
            unsigned int v12 = [v11 isEqualToIgnoringCase:v4];

            if (v12)
            {
              unsigned int v13 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v26 = v9;
                __int16 v27 = 2112;
                long long v28 = v4;
                _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Cleaning up session: %@ for client ID: %@", buf, 0x16u);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                if (_IDSShouldLogTransport())
                {
                  uint64_t v14 = v9;
                  id v15 = v4;
                  _IDSLogTransport();
                  if (_IDSShouldLog())
                  {
                    uint64_t v14 = v9;
                    id v15 = v4;
                    _IDSLogV();
                  }
                }
              }
              objc_msgSend(v20, "addObject:", v9, v14, v15);
              [v19 addObject:v10];
            }
          }
          id v6 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
        }
        while (v6);
      }

      os_unfair_lock_unlock(lock);
      [v19 enumerateObjectsUsingBlock:&stru_100986160];
      os_unfair_lock_lock(lock);
      [(NSMutableDictionary *)self->_sessions removeObjectsForKeys:v20];
      os_unfair_lock_unlock(lock);
    }
  }
}

- (id)_specificOriginatorFromURI:(id)a3 senderToken:(id)a4 accountUniqueID:(id)a5
{
  uint64_t v7 = (__CFString *)a3;
  id v8 = a4;
  id v9 = a5;
  CFStringRef v10 = [(__CFString *)v7 prefixedURI];
  unsigned int v11 = [v10 hasPrefix:@"device:"];

  if (v11)
  {
    unsigned int v12 = [(__CFString *)v7 unprefixedURI];
  }
  else
  {
    unsigned int v12 = 0;
  }
  unsigned int v13 = +[IDSPairingManager sharedInstance];
  uint64_t v14 = [v13 pairedDeviceUniqueID];
  unsigned int v15 = [v12 isEqualToIgnoringCase:v14];

  BOOL v16 = [(__CFString *)v7 prefixedURI];
  unsigned int v17 = [v16 isEqualToIgnoringCase:IDSDefaultPairedDevice];

  id v18 = +[IDSDAccountController sharedInstance];
  id v19 = [v18 accountWithUniqueID:v9];

  id v20 = [v8 rawToken];
  id v21 = [v20 length];

  if (v21)
  {
    long long v22 = [v8 rawToken];
    if ([v22 length])
    {
      long long v23 = [(__CFString *)v7 prefixedURI];
      id v24 = [v23 length];

      if (v24)
      {
        unsigned int v25 = [v8 rawToken];
        uint64_t v26 = [(__CFString *)v7 prefixedURI];
        __int16 v27 = (void *)_IDSCopyIDForTokenWithURI();

LABEL_13:
        id v30 = objc_msgSend(v19, "service", v46, v47);
        id v31 = [v30 identifier];
        id v32 = +[IDSURI URIWithPrefixedURI:v27 withServiceLoggingHint:v31];

        goto LABEL_14;
      }
    }
    else
    {
    }
    __int16 v27 = 0;
    goto LABEL_13;
  }
  long long v28 = [(__CFString *)v7 prefixedURI];
  __int16 v27 = v28;
  if ((v17 | v15)) {
    goto LABEL_13;
  }
  unsigned int v29 = [v28 hasPrefix:@"guest-device:"];

  if (v29)
  {
    __int16 v27 = [(__CFString *)v7 prefixedURI];
    goto LABEL_13;
  }
  if (!v19)
  {
    id v42 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v53 = @"SessionController";
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%@ - No account found to build specificOriginator, bailing...", buf, 0xCu);
    }

    if (!os_log_shim_legacy_logging_enabled()) {
      goto LABEL_45;
    }
LABEL_30:
    _IDSWarnV();
    _IDSLogV();
    _IDSLogTransport();
    goto LABEL_45;
  }
  unint64_t v34 = [v19 dependentRegistrationMatchingUUID:v12];
  id v35 = v34;
  if (!v34)
  {
    id v43 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v53 = @"SessionController";
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%@ - No device found to build specificOriginator, bailing...", buf, 0xCu);
    }

    if (!os_log_shim_legacy_logging_enabled()) {
      goto LABEL_45;
    }
    goto LABEL_30;
  }
  id v51 = [v34 _dataForKey:IDSDevicePropertyPushToken];
  if ([v51 length])
  {
    v50 = [v35 _arrayForKey:IDSDevicePropertyIdentities];
    if ([v50 count])
    {
      id v36 = [v50 firstObject];
      id v49 = [v36 _stringForKey:@"uri"];

      __int16 v27 = (void *)_IDSCopyIDForTokenWithURI();
      id v37 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        id v48 = [v19 service];
        id v38 = [v48 identifier];
        v39 = IDSLoggableDescriptionForHandleOnService();
        *(_DWORD *)buf = 138412546;
        CFStringRef v53 = v7;
        __int16 v54 = 2112;
        id v55 = v39;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "original fromID %@ -> resulting specificOriginator %@", buf, 0x16u);
      }
      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        id v40 = [v19 service];
        id v41 = [v40 identifier];
        IDSLoggableDescriptionForHandleOnService();
        id v47 = v46 = v7;
        _IDSLogV();
      }
      goto LABEL_13;
    }
    id v45 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v53 = @"SessionController";
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%@ - No device identity found to build specificOriginator, bailing...", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
  else
  {
    char v44 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v53 = @"SessionController";
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%@ - No device push token found to build specificOriginator, bailing...", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
LABEL_45:
  id v32 = 0;
LABEL_14:

  return v32;
}

- (id)sessionWithUniqueID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    p_os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    id v6 = [(NSMutableDictionary *)self->_sessions objectForKey:v4];
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    uint64_t v7 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v10 = @"SessionController";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@ - No unique ID provided to lookup session, bailing...", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
    id v6 = 0;
  }

  return v6;
}

- (id)sessionWithInstanceID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    p_os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = [(NSMutableDictionary *)self->_sessions allValues];
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v6);
          }
          if (v4)
          {
            CFStringRef v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
            unsigned int v11 = [v10 instanceID];
            unsigned int v12 = [v11 isEqualToString:v4];

            if (v12)
            {
              id v7 = v10;
              goto LABEL_18;
            }
          }
        }
        id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_18:

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    unsigned int v13 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v21 = @"SessionController";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@ - No instance ID provided to lookup session, bailing...", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
    id v7 = 0;
  }

  return v7;
}

- (id)sessionWithGroupID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    p_os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v14 = 0x3032000000;
    long long v15 = sub_1001FC508;
    long long v16 = sub_1001FC518;
    id v17 = 0;
    id v6 = [(NSMutableDictionary *)self->_sessions allValues];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1001FC520;
    v10[3] = &unk_100986188;
    id v11 = v4;
    p_long long buf = &buf;
    [v6 enumerateObjectsUsingBlock:v10];

    id v7 = *(id *)(*((void *)&buf + 1) + 40);
    _Block_object_dispose(&buf, 8);

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    uint64_t v8 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = @"SessionController";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@ - No group ID provided to lookup session, bailing...", (uint8_t *)&buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
    id v7 = 0;
  }

  return v7;
}

- (id)sessionWithGroupUUID:(id)a3
{
  id v4 = a3;
  id v5 = [v4 UUIDString];
  id v6 = [v5 length];

  if (v6)
  {
    p_os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v16 = 0x3032000000;
    id v17 = sub_1001FC508;
    long long v18 = sub_1001FC518;
    id v19 = 0;
    uint64_t v8 = [(NSMutableDictionary *)self->_sessions allValues];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001FC85C;
    v12[3] = &unk_100986188;
    id v13 = v4;
    p_long long buf = &buf;
    [v8 enumerateObjectsUsingBlock:v12];

    id v9 = *(id *)(*((void *)&buf + 1) + 40);
    _Block_object_dispose(&buf, 8);

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    CFStringRef v10 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = @"SessionController";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@ - No group UUID provided to lookup session, bailing...", (uint8_t *)&buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
    id v9 = 0;
  }

  return v9;
}

- (id)groupSessionGroupIDs
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = +[NSMutableArray array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(NSMutableDictionary *)self->_sessions allValues];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        CFStringRef v10 = [v9 groupID];
        BOOL v11 = v10 == 0;

        if (!v11)
        {
          unsigned int v12 = [v9 groupID];
          [v4 addObject:v12];
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (id)sessionIDForAlias:(id)a3 salt:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = self->_sessions;
  id v10 = [(NSMutableDictionary *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        long long v14 = IDSIDAliasHashUUIDString();
        unsigned __int8 v15 = objc_msgSend(v14, "isEqualToString:", v13, (void)v17);

        if (v15)
        {
          id v10 = v13;
          goto LABEL_11;
        }
      }
      id v10 = [(NSMutableDictionary *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(p_lock);

  return v10;
}

- (void)updateCriticalReliabilityState
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(NSMutableDictionary *)self->_sessions allValues];
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v8 state] - 8 >= 0xFFFFFFF9)
        {
          id v5 = v8;
          uint64_t v9 = 1;
          goto LABEL_11;
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v16 objects:v24 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v9 = 0;
LABEL_11:

  os_unfair_lock_unlock(p_lock);
  id v10 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v11 = @"NO";
    if (v9) {
      CFStringRef v11 = @"YES";
    }
    *(_DWORD *)long long buf = 138412546;
    CFStringRef v21 = v11;
    __int16 v22 = 2112;
    id v23 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Updating critical reliability {needsCritical: %@, session: %@}", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    CFStringRef v12 = @"NO";
    if (v9) {
      CFStringRef v12 = @"YES";
    }
    CFStringRef v14 = v12;
    id v15 = v5;
    _IDSLogV();
  }
  id v13 = +[FTNetworkSupport sharedInstance];
  [v13 setEnableCriticalReliability:v9];
}

- (FTMessageDelivery)messageDelivery
{
  return (FTMessageDelivery *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIDMultiQueue, 0);
  objc_storeStrong((id *)&self->_messageDelivery, 0);

  objc_storeStrong((id *)&self->_sessions, 0);
}

@end