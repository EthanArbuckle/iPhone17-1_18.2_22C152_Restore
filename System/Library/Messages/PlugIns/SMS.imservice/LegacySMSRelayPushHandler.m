@interface LegacySMSRelayPushHandler
+ (id)commandToHandlerBlock;
+ (id)localCommandToHandlerBlock;
- (BOOL)registered;
- (LegacySMSRelayPushHandler)init;
- (LegacySMSRelayPushHandler)initWithIDSAccount:(id)a3;
- (id)_messageReplayObjectWithService:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6;
- (id)_messageReplayObjectWithService:(id)a3 account:(id)a4 incomingTopLevelMessage:(id)a5 fromID:(id)a6;
- (id)copyHandlersForEnumerating;
- (void)_acceptIncomingPushes;
- (void)_ignoreIncomingPushes;
- (void)_service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7 isBeingReplayed:(BOOL)a8;
- (void)_service:(id)a3 account:(id)a4 incomingTopLevelMessage:(id)a5 fromID:(id)a6 messageContext:(id)a7 isBeingReplayed:(BOOL)a8;
- (void)_updateListenerIfNeeded;
- (void)addListener:(id)a3;
- (void)dealloc;
- (void)removeListener:(id)a3;
- (void)replayMessage:(id)a3;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingTopLevelMessage:(id)a5 fromID:(id)a6 messageContext:(id)a7;
- (void)setRegistered:(BOOL)a3;
@end

@implementation LegacySMSRelayPushHandler

+ (id)commandToHandlerBlock
{
  if (qword_9C088 != -1) {
    dispatch_once(&qword_9C088, &stru_8D450);
  }
  return (id)qword_9C080;
}

+ (id)localCommandToHandlerBlock
{
  if (qword_99C58 != -1) {
    dispatch_once(&qword_99C58, &stru_8D630);
  }
  return (id)qword_99C50;
}

- (LegacySMSRelayPushHandler)initWithIDSAccount:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)LegacySMSRelayPushHandler;
  v4 = [(LegacySMSRelayPushHandler *)&v6 init];
  if (v4) {
    v4->_account = (IDSAccount *)a3;
  }
  return v4;
}

- (LegacySMSRelayPushHandler)init
{
  v5.receiver = self;
  v5.super_class = (Class)LegacySMSRelayPushHandler;
  v2 = [(LegacySMSRelayPushHandler *)&v5 init];
  if (v2)
  {
    if (IMOSLoggingEnabled())
    {
      v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v7 = v2;
        _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Initing Push Handler %p", buf, 0xCu);
      }
    }
  }
  return v2;
}

- (void)dealloc
{
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      objc_super v6 = self;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Deallocing Push Handler %p", buf, 0xCu);
    }
  }

  [(IDSService *)self->_relayService removeDelegate:self];
  [(IDSService *)self->_smsWatchService removeDelegate:self];

  v4.receiver = self;
  v4.super_class = (Class)LegacySMSRelayPushHandler;
  [(LegacySMSRelayPushHandler *)&v4 dealloc];
}

- (void)_updateListenerIfNeeded
{
  if (self->_registeredForPush)
  {
    if (!self->_isListening)
    {
      [(IDSService *)self->_relayService removeDelegate:self];

      self->_relayService = 0;
      [(IDSService *)self->_smsWatchService removeDelegate:self];

      self->_smsWatchService = 0;
      id v4 = objc_alloc((Class)IDSService);
      objc_super v5 = (IDSService *)objc_msgSend(v4, "initWithService:commands:", IDSServiceNameSMSRelay, +[NSSet setWithArray:](NSSet, "setWithArray:", objc_msgSend(objc_msgSend((id)objc_opt_class(), "commandToHandlerBlock"), "allKeys")));
      self->_relayService = v5;
      [(IDSService *)v5 addDelegate:self queue:&_dispatch_main_q];
      objc_super v6 = (IDSService *)objc_msgSend(objc_alloc((Class)IDSService), "initWithService:commands:", @"com.apple.private.alloy.sms.watch", +[NSSet setWithArray:](NSSet, "setWithArray:", objc_msgSend(objc_msgSend((id)objc_opt_class(), "commandToHandlerBlock"), "allKeys")));
      self->_smsWatchService = v6;
      [(IDSService *)v6 addDelegate:self queue:&_dispatch_main_q];
      self->_isListening = 1;
    }
  }
}

- (void)_acceptIncomingPushes
{
  if (!self->_registeredForPush)
  {
    self->_registeredForPush = 1;
    if (IMOSLoggingEnabled())
    {
      v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v4 = 0;
        _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Accepting incoming pushes", v4, 2u);
      }
    }
    [(LegacySMSRelayPushHandler *)self _updateListenerIfNeeded];
  }
}

- (void)_ignoreIncomingPushes
{
  if (self->_registeredForPush)
  {
    self->_registeredForPush = 0;
    if (IMOSLoggingEnabled())
    {
      v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)objc_super v5 = 0;
        _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "No longer accepting incoming pushes", v5, 2u);
      }
    }
    [(IDSService *)self->_relayService removeDelegate:self];

    self->_relayService = 0;
    [(IDSService *)self->_smsWatchService removeDelegate:self];

    self->_smsWatchService = 0;
    self->_isListening = 0;
  }
}

- (void)setRegistered:(BOOL)a3
{
  BOOL v3 = a3;
  if (IMOSLoggingEnabled())
  {
    objc_super v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      CFStringRef v6 = @"NO";
      if (v3) {
        CFStringRef v6 = @"YES";
      }
      int v7 = 138412290;
      CFStringRef v8 = v6;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Changing SMS Push Hander Regiration State to: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  if (v3) {
    [(LegacySMSRelayPushHandler *)self _acceptIncomingPushes];
  }
  else {
    [(LegacySMSRelayPushHandler *)self _ignoreIncomingPushes];
  }
}

- (BOOL)registered
{
  return self->_registeredForPush;
}

- (id)copyHandlersForEnumerating
{
  return [(NSMutableArray *)self->_handlers _copyForEnumerating];
}

- (void)addListener:(id)a3
{
  if ((-[NSMutableArray containsObjectIdenticalTo:](self->_handlers, "containsObjectIdenticalTo:") & 1) == 0)
  {
    handlers = self->_handlers;
    if (!handlers)
    {
      handlers = (NSMutableArray *)+[NSMutableArray nonRetainingArray];
      self->_handlers = handlers;
    }
    [(NSMutableArray *)handlers addObject:a3];
  }
}

- (void)removeListener:(id)a3
{
  if (![(NSMutableArray *)self->_handlers count])
  {

    self->_handlers = 0;
  }
}

- (id)_messageReplayObjectWithService:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6
{
  id v6 = objc_msgSend(objc_alloc((Class)IDSTransactionLogDataMessage), "initWithData:accountUniqueID:fromID:loginID:serviceName:", a5, 0, a6, objc_msgSend(a4, "loginID"), objc_msgSend(a4, "serviceName", a3));

  return v6;
}

- (id)_messageReplayObjectWithService:(id)a3 account:(id)a4 incomingTopLevelMessage:(id)a5 fromID:(id)a6
{
  id v6 = objc_msgSend(objc_alloc((Class)IDSTransactionLogDictionaryMessage), "initWithDictionary:accountUniqueID:fromID:loginID:serviceName:", a5, 0, a6, objc_msgSend(a4, "loginID"), objc_msgSend(a4, "serviceName", a3));

  return v6;
}

- (void)replayMessage:(id)a3
{
  if (IMOSLoggingEnabled())
  {
    objc_super v5 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v28 = 138412290;
      id v29 = a3;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Received dictionary to replay %@", (uint8_t *)&v28, 0xCu);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [a3 serviceName];
      unsigned int v7 = [v6 isEqualToString:IDSServiceNameSMSRelay];
      uint64_t v8 = 16;
      if (v7) {
        uint64_t v8 = 8;
      }
      v9 = *(Class *)((char *)&self->super.isa + v8);
      account = self->_account;
      id v11 = [a3 dictionaryValue];
      id v12 = [a3 fromID];
      id v13 = v12;
      if (v9) {
        BOOL v14 = v11 == 0;
      }
      else {
        BOOL v14 = 1;
      }
      if (!v14 && v12 != 0)
      {
        [(LegacySMSRelayPushHandler *)self _service:v9 account:account incomingTopLevelMessage:v11 fromID:v12 messageContext:0 isBeingReplayed:1];
        return;
      }
      if (IMOSLoggingEnabled())
      {
        v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          int v28 = 138413058;
          id v29 = v9;
          __int16 v30 = 2112;
          v31 = account;
          __int16 v32 = 2112;
          id v33 = v11;
          __int16 v34 = 2112;
          id v35 = v13;
          v17 = "SMSReplay: Something was null. service %@ account %@ message %@ fromID %@";
LABEL_33:
          _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, v17, (uint8_t *)&v28, 0x2Au);
        }
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        return;
      }
      id v18 = [a3 serviceName];
      unsigned int v19 = [v18 isEqualToString:IDSServiceNameSMSRelay];
      uint64_t v20 = 16;
      if (v19) {
        uint64_t v20 = 8;
      }
      v21 = *(Class *)((char *)&self->super.isa + v20);
      v22 = self->_account;
      id v23 = [a3 dataValue];
      id v24 = [a3 fromID];
      id v25 = v24;
      if (v21) {
        BOOL v26 = v23 == 0;
      }
      else {
        BOOL v26 = 1;
      }
      if (!v26 && v24 != 0)
      {
        [(LegacySMSRelayPushHandler *)self _service:v21 account:v22 incomingData:v23 fromID:v24 context:0 isBeingReplayed:1];
        return;
      }
      if (IMOSLoggingEnabled())
      {
        v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          int v28 = 138413058;
          id v29 = v21;
          __int16 v30 = 2112;
          v31 = v22;
          __int16 v32 = 2112;
          id v33 = v23;
          __int16 v34 = 2112;
          id v35 = v25;
          v17 = "SMSReplay: Something was null. service %@ account %@ data %@ fromID %@";
          goto LABEL_33;
        }
      }
    }
  }
}

- (void)_service:(id)a3 account:(id)a4 incomingTopLevelMessage:(id)a5 fromID:(id)a6 messageContext:(id)a7 isBeingReplayed:(BOOL)a8
{
  BOOL v35 = a8;
  id v10 = [objc_alloc((Class)IMPowerAssertion) initWithIdentifier:@"IncomingMessagePowerAssertion" timeout:10.0];
  uint64_t v11 = IDSIncomingMessagePushPayloadKey;
  id v12 = [a5 objectForKey:IDSIncomingMessagePushPayloadKey];
  objc_msgSend(objc_msgSend(a5, "objectForKey:", IDSIncomingMessageDecryptedDataKey), "_FTOptionallyDecompressData");
  uint64_t v13 = JWDecodeDictionary();
  uint64_t v14 = IDSOriginalCommandKey;
  id v15 = [v12 objectForKey:IDSOriginalCommandKey];
  uint64_t v16 = objc_opt_class();
  id v17 = [a5 objectForKey:@"mc"];
  if ((objc_opt_isKindOfClass() & 1) == 0 && v17)
  {
    id v18 = +[IMRGLog registration];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      sub_5EDAC(v16, v18);
    }
    id v17 = 0;
  }
  unsigned int v19 = objc_msgSend(v17, "BOOLValue", a7);
  [v12 objectForKey:@"U"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    +[NSData _IDSDataFromBase64String:](NSData, "_IDSDataFromBase64String:", [v12 objectForKey:@"U"]);
  }
  else
  {
    [v12 objectForKey:@"U"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v12 objectForKey:@"U"];
    }
  }
  uint64_t v20 = JWUUIDPushObjectToString();
  if (v20) {
    unsigned int v21 = v19;
  }
  else {
    unsigned int v21 = 0;
  }
  if (v21 == 1) {
    objc_msgSend(objc_msgSend((id)IMWeakLinkClass(), "sharedInstance"), "addMessagesID:", v20);
  }
  if (v15
    || (id v15 = [v12 objectForKey:off_996D0]) != 0
    || (id v15 = [a5 objectForKey:v14]) != 0)
  {
    if ([v15 integerValue] == (char *)&stru_B8.size + 3)
    {
      v22 = _os_activity_create(&dword_0, "com.apple.messages.SMSReceivedRelayLocalCommand", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      os_activity_scope_enter(v22, &state);

      if (IMOSLoggingEnabled())
      {
        id v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "Received IDS Nice message (Local Message) ", buf, 2u);
        }
      }
      id v24 = [a5 objectForKey:v11];
      id v25 = v24;
      if (v24)
      {
        objc_msgSend(objc_msgSend(v24, "objectForKey:", off_996F0), "_FTOptionallyDecompressData");
        uint64_t v26 = JWDecodeDictionary();
        id v27 = [v25 objectForKey:off_996E8];
        if (IMOSLoggingEnabled())
        {
          int v28 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v38 = v27;
            _os_log_impl(&dword_0, v28, OS_LOG_TYPE_INFO, " Attempting to locate block for local message of type %@ ", buf, 0xCu);
          }
        }
        id v29 = (void (**)(id, LegacySMSRelayPushHandler *, uint64_t, id, void, BOOL))objc_msgSend(objc_msgSend((id)objc_opt_class(), "localCommandToHandlerBlock"), "objectForKey:", v27);
        if (v29) {
          v29[2](v29, self, v26, v12, v34, v35);
        }
      }
      os_activity_scope_leave(&state);
    }
    else
    {
      __int16 v30 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "commandToHandlerBlock"), "objectForKey:", v15);
      if (v30)
      {
        if (objc_msgSend(+[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags"), "isSMSFilterSyncEnabled"))
        {
          v31 = (char *)[v15 integerValue];
          __int16 v32 = (void (*)(void *, LegacySMSRelayPushHandler *, id, id, uint64_t, BOOL))v30[2];
          if (v31 == (unsigned char *)&stru_68.addr + 3) {
            v32(v30, self, a5, v12, v34, v35);
          }
          else {
            v32(v30, self, (id)v13, v12, v34, v35);
          }
        }
        else
        {
          ((void (*)(void *, LegacySMSRelayPushHandler *, uint64_t, id, uint64_t, BOOL))v30[2])(v30, self, v13, v12, v34, v35);
        }
      }
    }
  }
}

- (void)service:(id)a3 account:(id)a4 incomingTopLevelMessage:(id)a5 fromID:(id)a6 messageContext:(id)a7
{
  id v13 = [a5 _copyMessageDictionaryForLogging];
  if (IMOSLoggingEnabled())
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      id v21 = v13;
      __int16 v22 = 2112;
      id v23 = a3;
      __int16 v24 = 2112;
      id v25 = a4;
      __int16 v26 = 1024;
      unsigned int v27 = [a4 accountType];
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "Received message %@ for service %@ on account %@ with type %d ", buf, 0x26u);
    }
  }

  if (([+[IMUnlockMonitor sharedInstance](IMUnlockMonitor, "sharedInstance") isUnderFirstDataProtectionLock] & 1) != 0|| [+[IMDReplayController sharedInstance] isRecordingReplayDB])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v16 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "Received message before first unlock. Storing it to replay", buf, 2u);
      }
    }
    id v17 = [(LegacySMSRelayPushHandler *)self _messageReplayObjectWithService:a3 account:a4 incomingTopLevelMessage:a5 fromID:a6];
    unsigned int v19 = 0;
    [+[IMDReplayController sharedInstance] storeMessage:v17 type:2 error:&v19];
    if (v19)
    {
      if (IMOSLoggingEnabled())
      {
        id v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v21 = v17;
          __int16 v22 = 2112;
          id v23 = v19;
          _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "ReplayController: Got error trying to store sms relay message %@ error %@", buf, 0x16u);
        }
      }
    }
  }
  [(LegacySMSRelayPushHandler *)self _service:a3 account:a4 incomingTopLevelMessage:a5 fromID:a6 messageContext:a7 isBeingReplayed:0];
}

- (void)_service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7 isBeingReplayed:(BOOL)a8
{
  objc_msgSend(a5, "_FTOptionallyDecompressData", a3, a4);
  JWDecodeDictionary();
  [a7 outgoingResponseIdentifier];
  +[NSDictionary dictionaryWithObjectsAndKeys:IDSGetUUIDData(), @"U", a6, off_996E0, 0];
  id v10 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "commandToHandlerBlock"), "objectForKey:", objc_msgSend(a7, "originalCommand"));
  if (v10)
  {
    uint64_t v11 = (void (*)(void))*((void *)v10 + 2);
    v11();
  }
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  if (IMOSLoggingEnabled())
  {
    id v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413314;
      id v20 = a5;
      __int16 v21 = 2112;
      id v22 = a3;
      __int16 v23 = 2112;
      id v24 = a4;
      __int16 v25 = 1024;
      unsigned int v26 = [a4 accountType];
      __int16 v27 = 2112;
      id v28 = a7;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Received Incomming Data %@ for service %@ on account %@ with type %d and context %@", buf, 0x30u);
    }
  }
  if (([+[IMUnlockMonitor sharedInstance](IMUnlockMonitor, "sharedInstance") isUnderFirstDataProtectionLock] & 1) != 0|| [+[IMDReplayController sharedInstance] isRecordingReplayDB])
  {
    if (IMOSLoggingEnabled())
    {
      id v15 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Received message before first unlock. Storing it to replay", buf, 2u);
      }
    }
    id v16 = [(LegacySMSRelayPushHandler *)self _messageReplayObjectWithService:a3 account:a4 incomingData:a5 fromID:a6];
    id v18 = 0;
    [+[IMDReplayController sharedInstance] storeMessage:v16 type:2 error:&v18];
    if (v18)
    {
      if (IMOSLoggingEnabled())
      {
        id v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v20 = v16;
          __int16 v21 = 2112;
          id v22 = v18;
          _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "ReplayController: Got error trying to store sms relay message %@ error %@", buf, 0x16u);
        }
      }
    }
  }
  [(LegacySMSRelayPushHandler *)self _service:a3 account:a4 incomingData:a5 fromID:a6 context:a7 isBeingReplayed:0];
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v7 = a6;
  if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      CFStringRef v10 = @"NO";
      if (v7) {
        CFStringRef v10 = @"YES";
      }
      int v11 = 138412546;
      id v12 = a5;
      __int16 v13 = 2112;
      CFStringRef v14 = v10;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Message with ID %@ Sent Success %@", (uint8_t *)&v11, 0x16u);
    }
  }
}

@end