@interface IMDRelayPushHandler
+ (id)commandToHandlerBlock;
+ (id)localCommandToHandlerBlock;
+ (id)sharedInstance;
- (BOOL)_messageRequestsServiceForSendingBypass:(id)a3;
- (BOOL)isListening;
- (BOOL)registered;
- (BOOL)registeredForPush;
- (IDSAccount)account;
- (IDSService)relayService;
- (IDSService)smsWatchService;
- (IMDRelayPushHandler)init;
- (IMDRelayPushHandler)initWithIDSAccount:(id)a3;
- (NSCache)guidToListenersCache;
- (NSMutableArray)handlers;
- (id)_cachedListenersForGUID:(id)a3;
- (id)_guidsForMessage:(id)a3 messageGUID:(id)a4 routingBehaviors:(unint64_t)a5;
- (id)_handlerForServiceName:(id)a3;
- (id)_handlersForExplicitServiceWithMessage:(id)a3;
- (id)_messageDictionaryForLocalMessage:(id)a3 type:(id)a4;
- (id)_messageReplayObjectWithService:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6;
- (id)_messageReplayObjectWithService:(id)a3 account:(id)a4 incomingTopLevelMessage:(id)a5 fromID:(id)a6;
- (id)_serviceNameForMessage:(id)a3;
- (id)_serviceNameOrCompatibilityServiceNameFromDictionary:(id)a3;
- (id)copyHandlersForEnumerating;
- (unint64_t)_listenerMatchTypeForCommand:(int64_t)a3 message:(id)a4;
- (unint64_t)_listenerMatchTypeForLocalMessageType:(id)a3 message:(id)a4;
- (unint64_t)_routingBehaviorsForCommand:(int64_t)a3;
- (unint64_t)_routingBehaviorsForLocalMessageType:(id)a3;
- (void)_acceptIncomingPushes;
- (void)_cacheListeners:(id)a3 forGUID:(id)a4;
- (void)_calculateHandlersForLocalMessage:(id)a3 userInfo:(id)a4 completionBlock:(id)a5;
- (void)_calculateHandlersForMatchType:(unint64_t)a3 routingBehaviors:(unint64_t)a4 message:(id)a5 messageGUID:(id)a6 fromIdentifier:(id)a7 completionBlock:(id)a8;
- (void)_calculateHandlersForMessage:(id)a3 messageGUID:(id)a4 fromIdentifier:(id)a5 command:(id)a6 completionBlock:(id)a7;
- (void)_handleMessageProcessedWithGUID:(id)a3;
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
- (void)setAccount:(id)a3;
- (void)setGuidToListenersCache:(id)a3;
- (void)setHandlers:(id)a3;
- (void)setIsListening:(BOOL)a3;
- (void)setRegistered:(BOOL)a3;
- (void)setRegisteredForPush:(BOOL)a3;
- (void)setRelayService:(id)a3;
- (void)setSmsWatchService:(id)a3;
@end

@implementation IMDRelayPushHandler

+ (id)sharedInstance
{
  if (qword_1EBE2BAA8 != -1) {
    dispatch_once(&qword_1EBE2BAA8, &unk_1F3391CE0);
  }
  v2 = (void *)qword_1EBE2BCE8;

  return v2;
}

- (void)_handleMessageProcessedWithGUID:(id)a3
{
  id v4 = a3;
  id v5 = [(IMDRelayPushHandler *)self guidToListenersCache];
  [v5 removeObjectForKey:v4];
}

- (void)_cacheListeners:(id)a3 forGUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(IMDRelayPushHandler *)self guidToListenersCache];

  if (!v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1C998]);
    [(IMDRelayPushHandler *)self setGuidToListenersCache:v9];

    v10 = [(IMDRelayPushHandler *)self guidToListenersCache];
    [v10 setCountLimit:50000];
  }
  v11 = IMLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_1D9904D10(v6, (uint64_t)v7, v11);
  }

  v12 = [(IMDRelayPushHandler *)self guidToListenersCache];
  [v12 setObject:v6 forKey:v7];
}

- (id)_cachedListenersForGUID:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(IMDRelayPushHandler *)self guidToListenersCache];
  id v6 = [v5 objectForKey:v4];

  uint64_t v7 = [v6 count];
  v8 = IMLogHandleForCategory();
  id v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412546;
      v12 = v6;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Reusing cached listeners %@ for GUID %@", (uint8_t *)&v11, 0x16u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    sub_1D9904DA0((uint64_t)v4, v9);
  }

  return v6;
}

+ (id)commandToHandlerBlock
{
  if (qword_1EBE2BB88 != -1) {
    dispatch_once(&qword_1EBE2BB88, &unk_1F3391D00);
  }
  v2 = (void *)qword_1EBE2BB80;

  return v2;
}

+ (id)localCommandToHandlerBlock
{
  if (qword_1EA8CA628 != -1) {
    dispatch_once(&qword_1EA8CA628, &unk_1F3391F20);
  }
  v2 = (void *)qword_1EA8CA620;

  return v2;
}

- (IMDRelayPushHandler)initWithIDSAccount:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IMDRelayPushHandler;
  id v5 = [(IMDRelayPushHandler *)&v8 init];
  id v6 = v5;
  if (v5) {
    [(IMDRelayPushHandler *)v5 setAccount:v4];
  }

  return v6;
}

- (IMDRelayPushHandler)init
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)IMDRelayPushHandler;
  v2 = [(IMDRelayPushHandler *)&v5 init];
  if (v2 && IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v7 = v2;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Initing Push Handler %p", buf, 0xCu);
    }
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      id v9 = self;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Deallocing Push Handler %p", buf, 0xCu);
    }
  }
  account = self->_account;
  self->_account = 0;

  [(IDSService *)self->_relayService removeDelegate:self];
  relayService = self->_relayService;
  self->_relayService = 0;

  [(IDSService *)self->_smsWatchService removeDelegate:self];
  smsWatchService = self->_smsWatchService;
  self->_smsWatchService = 0;

  [(NSMutableArray *)self->_handlers removeAllObjects];
  v7.receiver = self;
  v7.super_class = (Class)IMDRelayPushHandler;
  [(IMDRelayPushHandler *)&v7 dealloc];
}

- (void)_updateListenerIfNeeded
{
  if (self->_registeredForPush)
  {
    v3 = (void *)MEMORY[0x1E016A370]();
    if (!self->_isListening)
    {
      [(IDSService *)self->_relayService removeDelegate:self];
      relayService = self->_relayService;
      self->_relayService = 0;

      [(IDSService *)self->_smsWatchService removeDelegate:self];
      smsWatchService = self->_smsWatchService;
      self->_smsWatchService = 0;

      id v6 = objc_alloc(MEMORY[0x1E4F6AB90]);
      uint64_t v7 = *MEMORY[0x1E4F6AA68];
      uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
      id v9 = [(id)objc_opt_class() commandToHandlerBlock];
      uint64_t v10 = [v9 allKeys];
      int v11 = [v8 setWithArray:v10];
      v12 = (IDSService *)[v6 initWithService:v7 commands:v11];
      __int16 v13 = self->_relayService;
      self->_relayService = v12;

      id v14 = (void *)MEMORY[0x1E4F14428];
      [(IDSService *)self->_relayService addDelegate:self queue:MEMORY[0x1E4F14428]];
      id v15 = objc_alloc(MEMORY[0x1E4F6AB90]);
      v16 = (void *)MEMORY[0x1E4F1CAD0];
      v17 = [(id)objc_opt_class() commandToHandlerBlock];
      v18 = [v17 allKeys];
      v19 = [v16 setWithArray:v18];
      v20 = (IDSService *)[v15 initWithService:@"com.apple.private.alloy.sms.watch" commands:v19];
      v21 = self->_smsWatchService;
      self->_smsWatchService = v20;

      [(IDSService *)self->_smsWatchService addDelegate:self queue:v14];
      self->_isListening = 1;
    }
  }
}

- (void)_acceptIncomingPushes
{
  if (!self->_registeredForPush)
  {
    if ([MEMORY[0x1E4F6E730] isMessagesInstalled])
    {
      self->_registeredForPush = 1;
      if (IMOSLoggingEnabled())
      {
        v3 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)objc_super v5 = 0;
          _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Accepting incoming pushes", v5, 2u);
        }
      }
      [(IMDRelayPushHandler *)self _updateListenerIfNeeded];
    }
    else if (IMOSLoggingEnabled())
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Messages not installed, don't listen for pushes.", buf, 2u);
      }
    }
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
        *(_WORD *)uint64_t v7 = 0;
        _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "No longer accepting incoming pushes", v7, 2u);
      }
    }
    id v4 = (void *)MEMORY[0x1E016A370]();
    [(IDSService *)self->_relayService removeDelegate:self];
    relayService = self->_relayService;
    self->_relayService = 0;

    [(IDSService *)self->_smsWatchService removeDelegate:self];
    smsWatchService = self->_smsWatchService;
    self->_smsWatchService = 0;

    self->_isListening = 0;
  }
}

- (void)setRegistered:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    objc_super v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = @"NO";
      if (v3) {
        id v6 = @"YES";
      }
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Changing SMS Push Hander Regiration State to: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  if (v3) {
    [(IMDRelayPushHandler *)self _acceptIncomingPushes];
  }
  else {
    [(IMDRelayPushHandler *)self _ignoreIncomingPushes];
  }
}

- (BOOL)registered
{
  return self->_registeredForPush;
}

- (id)copyHandlersForEnumerating
{
  return (id)[(NSMutableArray *)self->_handlers _copyForEnumerating];
}

- (void)addListener:(id)a3
{
  id v7 = a3;
  if ((-[NSMutableArray containsObjectIdenticalTo:](self->_handlers, "containsObjectIdenticalTo:") & 1) == 0)
  {
    handlers = self->_handlers;
    if (!handlers)
    {
      objc_super v5 = [MEMORY[0x1E4F1CA48] nonRetainingArray];
      id v6 = self->_handlers;
      self->_handlers = v5;

      handlers = self->_handlers;
    }
    [(NSMutableArray *)handlers addObject:v7];
  }
}

- (void)removeListener:(id)a3
{
  [(NSMutableArray *)self->_handlers removeObjectIdenticalTo:a3];
  if (![(NSMutableArray *)self->_handlers count])
  {
    handlers = self->_handlers;
    self->_handlers = 0;
  }
}

- (id)_messageReplayObjectWithService:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  id v10 = a4;
  int v11 = [v10 serviceName];
  v12 = [v10 loginID];

  __int16 v13 = (void *)[objc_alloc(MEMORY[0x1E4F6ABB0]) initWithData:v9 accountUniqueID:0 fromID:v8 loginID:v12 serviceName:v11];

  return v13;
}

- (id)_messageReplayObjectWithService:(id)a3 account:(id)a4 incomingTopLevelMessage:(id)a5 fromID:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  id v10 = a4;
  int v11 = [v10 serviceName];
  v12 = [v10 loginID];

  __int16 v13 = (void *)[objc_alloc(MEMORY[0x1E4F6ABB8]) initWithDictionary:v9 accountUniqueID:0 fromID:v8 loginID:v12 serviceName:v11];

  return v13;
}

- (void)replayMessage:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    objc_super v5 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v24 = 138412290;
      id v25 = v4;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Received dictionary to replay %@", (uint8_t *)&v24, 0xCu);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
      id v8 = [v7 serviceName];
      int v9 = [v8 isEqualToString:*MEMORY[0x1E4F6AA68]];
      uint64_t v10 = 24;
      if (v9) {
        uint64_t v10 = 16;
      }
      id v11 = *(id *)((char *)&self->super.isa + v10);

      v12 = self->_account;
      __int16 v13 = [v7 dictionaryValue];
      uint64_t v14 = [v7 fromID];
      id v15 = (void *)v14;
      if (v11) {
        BOOL v16 = v13 == 0;
      }
      else {
        BOOL v16 = 1;
      }
      if (!v16 && v14 != 0)
      {
        [(IMDRelayPushHandler *)self _service:v11 account:v12 incomingTopLevelMessage:v13 fromID:v14 messageContext:0 isBeingReplayed:1];
LABEL_29:

        goto LABEL_30;
      }
      if (!IMOSLoggingEnabled()) {
        goto LABEL_29;
      }
      v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        int v24 = 138413058;
        id v25 = v11;
        __int16 v26 = 2112;
        v27 = v12;
        __int16 v28 = 2112;
        v29 = v13;
        __int16 v30 = 2112;
        v31 = v15;
        _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "SMSReplay: Something was null. service %@ account %@ message %@ fromID %@", (uint8_t *)&v24, 0x2Au);
      }
LABEL_20:

      goto LABEL_29;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v19 = v6;
      v20 = [v19 serviceName];
      int v21 = [v20 isEqualToString:*MEMORY[0x1E4F6AA68]];
      uint64_t v22 = 24;
      if (v21) {
        uint64_t v22 = 16;
      }
      id v11 = *(id *)((char *)&self->super.isa + v22);

      v12 = self->_account;
      __int16 v13 = [v19 dataValue];
      uint64_t v23 = [v19 fromID];
      id v15 = (void *)v23;
      if (v11 && v13 && v23)
      {
        [(IMDRelayPushHandler *)self _service:v11 account:v12 incomingData:v13 fromID:v23 context:0 isBeingReplayed:1];
        goto LABEL_29;
      }
      if (!IMOSLoggingEnabled()) {
        goto LABEL_29;
      }
      v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        int v24 = 138413058;
        id v25 = v11;
        __int16 v26 = 2112;
        v27 = v12;
        __int16 v28 = 2112;
        v29 = v13;
        __int16 v30 = 2112;
        v31 = v15;
        _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "SMSReplay: Something was null. service %@ account %@ data %@ fromID %@", (uint8_t *)&v24, 0x2Au);
      }
      goto LABEL_20;
    }
  }
  else
  {
    id v6 = 0;
  }
LABEL_30:
}

- (void)_service:(id)a3 account:(id)a4 incomingTopLevelMessage:(id)a5 fromID:(id)a6 messageContext:(id)a7 isBeingReplayed:(BOOL)a8
{
  BOOL v49 = a8;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v50 = a3;
  id v51 = a4;
  id v12 = a5;
  id v55 = a6;
  id v56 = a7;
  v52 = (void *)[objc_alloc(MEMORY[0x1E4F6C3B0]) initWithIdentifier:@"IncomingMessagePowerAssertion" timeout:10.0];
  uint64_t v13 = *MEMORY[0x1E4F6B040];
  uint64_t v14 = [v12 objectForKey:*MEMORY[0x1E4F6B040]];
  v58 = [v12 objectForKey:*MEMORY[0x1E4F6B020]];
  v57 = [v58 _FTOptionallyDecompressData];
  v53 = JWDecodeDictionary();
  uint64_t v15 = *MEMORY[0x1E4F6B1A8];
  BOOL v16 = [v14 objectForKey:*MEMORY[0x1E4F6B1A8]];
  uint64_t v17 = objc_opt_class();
  v18 = sub_1D982E340(v17, v12, @"mc");
  int v19 = [v18 BOOLValue];

  v20 = [v14 objectForKey:@"U"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v21 = (void *)MEMORY[0x1E4F1C9B8];
    uint64_t v22 = [v14 objectForKey:@"U"];
    uint64_t v23 = [v21 _IDSDataFromBase64String:v22];
    uint64_t v24 = JWUUIDPushObjectToString();
LABEL_5:
    id v25 = (void *)v24;

    goto LABEL_7;
  }
  uint64_t v22 = [v14 objectForKey:@"U"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v23 = [v14 objectForKey:@"U"];
    uint64_t v24 = JWUUIDPushObjectToString();
    goto LABEL_5;
  }
  id v25 = JWUUIDPushObjectToString();
LABEL_7:

  if (v25) {
    int v26 = v19;
  }
  else {
    int v26 = 0;
  }
  if (v26 == 1)
  {
    v27 = +[IMMessagesToTrack sharedInstance];
    [v27 addMessagesID:v25];
  }
  if (v16
    || ([v14 objectForKey:qword_1EA8C7C60], (BOOL v16 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([v12 objectForKey:v15], (BOOL v16 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    if ([v16 integerValue] == 227)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      v48 = _os_activity_create(&dword_1D967A000, "com.apple.messages.SMSReceivedRelayLocalCommand", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
      os_activity_scope_enter(v48, &state);
      if (IMOSLoggingEnabled())
      {
        __int16 v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v28, OS_LOG_TYPE_INFO, "Received IDS Nice message (Local Message) ", buf, 2u);
        }
      }
      v29 = [v12 objectForKey:v13];
      __int16 v30 = v29;
      if (v29)
      {
        v47 = [v29 objectForKey:IMDRelayLocalMessageDictionaryDictKey];
        v31 = [v47 _FTOptionallyDecompressData];
        uint64_t v32 = JWDecodeDictionary();
        v33 = [v30 objectForKey:IMDRelayLocalMessageDictionaryTypeKey];
        if (IMOSLoggingEnabled())
        {
          v34 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v61 = v33;
            _os_log_impl(&dword_1D967A000, v34, OS_LOG_TYPE_INFO, " Attempting to locate block for local message of type %@ ", buf, 0xCu);
          }
        }
        v35 = [(id)objc_opt_class() localCommandToHandlerBlock];
        v36 = [v35 objectForKey:v33];

        if (v36) {
          ((void (**)(void, IMDRelayPushHandler *, void *, void *, void *, id, id, BOOL))v36)[2](v36, self, v16, v32, v14, v56, v55, v49);
        }
      }
      os_activity_scope_leave(&state);

      goto LABEL_37;
    }
    v37 = [(id)objc_opt_class() commandToHandlerBlock];
    v38 = [v37 objectForKey:v16];

    if (!v38)
    {
LABEL_36:

LABEL_37:
      goto LABEL_38;
    }
    v39 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v40 = [v39 isSMSFilterSyncEnabled];

    if (v40)
    {
      uint64_t v41 = [v16 integerValue];
      v42 = (void (*)(void *, IMDRelayPushHandler *, void *, id, void *, id, id, BOOL))v38[2];
      if (v41 == 139)
      {
        v43 = v38;
        v44 = self;
        v45 = v16;
        id v46 = v12;
LABEL_35:
        v42(v43, v44, v45, v46, v14, v56, v55, v49);
        goto LABEL_36;
      }
    }
    else
    {
      v42 = (void (*)(void *, IMDRelayPushHandler *, void *, id, void *, id, id, BOOL))v38[2];
    }
    v43 = v38;
    id v46 = v53;
    v44 = self;
    v45 = v16;
    goto LABEL_35;
  }
LABEL_38:
}

- (void)service:(id)a3 account:(id)a4 incomingTopLevelMessage:(id)a5 fromID:(id)a6 messageContext:(id)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  int v26 = (void *)[v13 _copyMessageDictionaryForLogging];
  if (IMOSLoggingEnabled())
  {
    BOOL v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      __int16 v30 = v26;
      __int16 v31 = 2112;
      id v32 = v11;
      __int16 v33 = 2112;
      id v34 = v12;
      __int16 v35 = 1024;
      int v36 = [v12 accountType];
      _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Received message %@ for service %@ on account %@ with type %d ", buf, 0x26u);
    }
  }
  uint64_t v17 = (void *)MEMORY[0x1E016A370]();
  v18 = [MEMORY[0x1E4F6EAB8] sharedInstance];
  if ([v18 isUnderFirstDataProtectionLock])
  {
  }
  else
  {
    int v19 = +[IMDReplayController sharedInstance];
    int v20 = [v19 isRecordingReplayDB];

    if (!v20) {
      goto LABEL_18;
    }
  }
  if (IMOSLoggingEnabled())
  {
    int v21 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Received message before first unlock. Storing it to replay", buf, 2u);
    }
  }
  uint64_t v22 = [(IMDRelayPushHandler *)self _messageReplayObjectWithService:v11 account:v12 incomingTopLevelMessage:v13 fromID:v14];
  uint64_t v23 = +[IMDReplayController sharedInstance];
  id v28 = 0;
  [v23 storeMessage:v22 type:2 error:&v28];
  id v24 = v28;

  if (v24 && IMOSLoggingEnabled())
  {
    id v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v30 = v22;
      __int16 v31 = 2112;
      id v32 = v24;
      _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "ReplayController: Got error trying to store sms relay message %@ error %@", buf, 0x16u);
    }
  }
LABEL_18:
  [(IMDRelayPushHandler *)self _service:v11 account:v12 incomingTopLevelMessage:v13 fromID:v14 messageContext:v15 isBeingReplayed:0];
}

- (void)_service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7 isBeingReplayed:(BOOL)a8
{
  BOOL v8 = a8;
  id v23 = a6;
  id v12 = a7;
  id v13 = [a5 _FTOptionallyDecompressData];
  id v14 = JWDecodeDictionary();
  id v15 = (void *)MEMORY[0x1E4F1C9E8];
  BOOL v16 = [v12 outgoingResponseIdentifier];
  uint64_t v17 = IDSGetUUIDData();
  v18 = objc_msgSend(v15, "dictionaryWithObjectsAndKeys:", v17, @"U", v23, qword_1EA8C7C70, 0);

  int v19 = [(id)objc_opt_class() commandToHandlerBlock];
  int v20 = [v12 originalCommand];
  int v21 = [v19 objectForKey:v20];

  if (v21)
  {
    uint64_t v22 = [v12 originalCommand];
    ((void (**)(void, IMDRelayPushHandler *, void *, void *, void *, id, id, BOOL))v21)[2](v21, self, v22, v14, v18, v12, v23, v8);
  }
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  int v26 = self;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (IMOSLoggingEnabled())
  {
    BOOL v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413314;
      id v29 = v13;
      __int16 v30 = 2112;
      id v31 = v11;
      __int16 v32 = 2112;
      id v33 = v12;
      __int16 v34 = 1024;
      int v35 = [v12 accountType];
      __int16 v36 = 2112;
      id v37 = v15;
      _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Received Incomming Data %@ for service %@ on account %@ with type %d and context %@", buf, 0x30u);
    }
  }
  uint64_t v17 = (void *)MEMORY[0x1E016A370]();
  v18 = [MEMORY[0x1E4F6EAB8] sharedInstance];
  if ([v18 isUnderFirstDataProtectionLock])
  {
  }
  else
  {
    int v19 = +[IMDReplayController sharedInstance];
    int v20 = [v19 isRecordingReplayDB];

    if (!v20) {
      goto LABEL_18;
    }
  }
  if (IMOSLoggingEnabled())
  {
    int v21 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Received message before first unlock. Storing it to replay", buf, 2u);
    }
  }
  uint64_t v22 = -[IMDRelayPushHandler _messageReplayObjectWithService:account:incomingData:fromID:](v26, "_messageReplayObjectWithService:account:incomingData:fromID:", v11, v12, v13, v14, v26);
  id v23 = +[IMDReplayController sharedInstance];
  id v27 = 0;
  [v23 storeMessage:v22 type:2 error:&v27];
  id v24 = v27;

  if (v24 && IMOSLoggingEnabled())
  {
    id v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v29 = v22;
      __int16 v30 = 2112;
      id v31 = v24;
      _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "ReplayController: Got error trying to store sms relay message %@ error %@", buf, 0x16u);
    }
  }
LABEL_18:
  [(IMDRelayPushHandler *)v26 _service:v11 account:v12 incomingData:v13 fromID:v14 context:v15 isBeingReplayed:0];
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (IMOSLoggingEnabled())
  {
    id v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      BOOL v16 = @"NO";
      if (v8) {
        BOOL v16 = @"YES";
      }
      int v17 = 138412546;
      id v18 = v13;
      __int16 v19 = 2112;
      int v20 = v16;
      _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Message with ID %@ Sent Success %@", (uint8_t *)&v17, 0x16u);
    }
  }
}

- (id)_serviceNameOrCompatibilityServiceNameFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:IMDRelayMessageItemDictionaryServiceKey];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v5 = +[IMDServiceController sharedController];
    id v6 = [v5 serviceWithName:v4];

    if (!v6)
    {
      id v7 = [v3 objectForKeyedSubscript:IMDRelayMessageItemDictionaryCompatibilityServiceKey];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v7;

        id v4 = v8;
      }
    }
    id v9 = v4;
    id v4 = v9;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)_serviceNameForMessage:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v5 = [(IMDRelayPushHandler *)self _serviceNameOrCompatibilityServiceNameFromDictionary:v4];
    if (!v5)
    {
      id v6 = [v4 objectForKeyedSubscript:IMDRelayMessageItemDictionary];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v5 = [(IMDRelayPushHandler *)self _serviceNameOrCompatibilityServiceNameFromDictionary:v6];
      }
      else
      {
        objc_super v5 = 0;
      }
    }
    id v8 = (void *)*MEMORY[0x1E4F6E1A0];
    if (v5) {
      id v8 = v5;
    }
    id v7 = v8;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_guidsForMessage:(id)a3 messageGUID:(id)a4 routingBehaviors:(unint64_t)a5
{
  char v5 = a5;
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v10 = v9;
  if (v8 && (v5 & 2) != 0) {
    [v9 addObject:v8];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = [v7 objectForKeyedSubscript:@"message"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = [v11 firstObject];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        [v10 addObjectsFromArray:v11];
      }
    }
    id v14 = [v7 objectForKeyedSubscript:IMDCTMessageDictionaryGUIDKey];
    id v15 = v14;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      id v16 = [v7 objectForKeyedSubscript:IMDRelayLocalMessageDictionaryGUIDKey];
    }
    id v18 = v16;

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v10 addObject:v18];
    }
    int v17 = [v10 allObjects];
  }
  else
  {
    int v17 = [v10 allObjects];
  }

  return v17;
}

- (id)_handlerForServiceName:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = [(IMDRelayPushHandler *)self copyHandlersForEnumerating];
    id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            uint64_t v10 = [v9 service];
            id v11 = [v10 internalName];
            char v12 = [v11 isEqualToString:v4];

            if (v12)
            {
              id v6 = v9;
              goto LABEL_14;
            }
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_calculateHandlersForMessage:(id)a3 messageGUID:(id)a4 fromIdentifier:(id)a5 command:(id)a6 completionBlock:(id)a7
{
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v16 = a3;
  uint64_t v15 = [a6 integerValue];
  [(IMDRelayPushHandler *)self _calculateHandlersForMatchType:[(IMDRelayPushHandler *)self _listenerMatchTypeForCommand:v15 message:v16] routingBehaviors:[(IMDRelayPushHandler *)self _routingBehaviorsForCommand:v15] message:v16 messageGUID:v14 fromIdentifier:v13 completionBlock:v12];
}

- (id)_messageDictionaryForLocalMessage:(id)a3 type:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (qword_1EA8CA638 != -1) {
    dispatch_once(&qword_1EA8CA638, &unk_1F3392080);
  }
  uint64_t v7 = [(id)qword_1EA8CA630 objectForKeyedSubscript:v6];
  if (!v7)
  {
    id v8 = v5;
    goto LABEL_7;
  }
  id v8 = [v5 objectForKeyedSubscript:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

LABEL_7:
    id v5 = v8;
    id v9 = v5;
    goto LABEL_13;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v12 = 138740739;
      id v13 = v5;
      __int16 v14 = 2112;
      id v15 = v6;
      __int16 v16 = 2112;
      long long v17 = v7;
      __int16 v18 = 2112;
      uint64_t v19 = objc_opt_class();
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Local message %{sensitive}@ of type %@ had key %@ but it was of class %@ instead of NSDictionary", (uint8_t *)&v12, 0x2Au);
    }
  }
  id v9 = 0;
LABEL_13:

  return v9;
}

- (void)_calculateHandlersForLocalMessage:(id)a3 userInfo:(id)a4 completionBlock:(id)a5
{
  id v8 = IMDRelayLocalMessageDictionaryTypeKey;
  id v9 = a5;
  id v10 = a3;
  id v12 = [a4 objectForKeyedSubscript:v8];
  id v11 = [(IMDRelayPushHandler *)self _messageDictionaryForLocalMessage:v10 type:v12];

  [(IMDRelayPushHandler *)self _calculateHandlersForMatchType:[(IMDRelayPushHandler *)self _listenerMatchTypeForLocalMessageType:v12 message:v11] routingBehaviors:[(IMDRelayPushHandler *)self _routingBehaviorsForLocalMessageType:v12] message:v11 messageGUID:0 fromIdentifier:0 completionBlock:v9];
}

- (id)_handlersForExplicitServiceWithMessage:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(IMDRelayPushHandler *)self _serviceNameForMessage:v4];
  uint64_t v6 = [(IMDRelayPushHandler *)self _handlerForServiceName:v5];
  uint64_t v7 = (void *)v6;
  if (v6)
  {
    v17[0] = v6;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  }
  else
  {
    id v8 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412803;
      id v12 = v7;
      __int16 v13 = 2112;
      __int16 v14 = v5;
      __int16 v15 = 2117;
      id v16 = v4;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Routing payload to %@ due to explicitly specified service %@, payload=%{sensitive}@", (uint8_t *)&v11, 0x20u);
    }
  }

  return v8;
}

- (void)_calculateHandlersForMatchType:(unint64_t)a3 routingBehaviors:(unint64_t)a4 message:(id)a5 messageGUID:(id)a6 fromIdentifier:(id)a7 completionBlock:(id)a8
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v14 = a5;
  id v15 = a6;
  id v50 = a7;
  id v16 = a8;
  BOOL v49 = self;
  id v51 = v14;
  v45 = v15;
  long long v17 = [(IMDRelayPushHandler *)self _guidsForMessage:v14 messageGUID:v15 routingBehaviors:a4];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1D983E414;
  aBlock[3] = &unk_1E6B77AD0;
  id v47 = v17;
  id v83 = v47;
  v84 = self;
  unint64_t v86 = a4;
  id v46 = v16;
  id v85 = v46;
  v48 = (void (**)(void *, id))_Block_copy(aBlock);
  if (a3 != 1 && (a4 & 4) != 0)
  {
    id v56 = [(IMDRelayPushHandler *)self _handlersForExplicitServiceWithMessage:v14];
    if ([v56 count])
    {
LABEL_4:
      v48[2](v48, v56);
      goto LABEL_62;
    }
  }
  id v56 = [(IMDRelayPushHandler *)self copyHandlersForEnumerating];
  switch(a3)
  {
    case 0uLL:
      if (IMOSLoggingEnabled())
      {
        __int16 v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138739971;
          id v90 = v14;
          _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Broadcasting payload to all registered listeners, payload=%{sensitive}@", buf, 0xCu);
        }
      }
      goto LABEL_4;
    case 1uLL:
      uint64_t v19 = [(IMDRelayPushHandler *)self _handlersForExplicitServiceWithMessage:v14];
      v48[2](v48, v19);

      break;
    case 2uLL:
      id v61 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v72 = 0u;
      long long v73 = 0u;
      long long v71 = 0u;
      long long v70 = 0u;
      obuint64_t j = [(IMDRelayPushHandler *)self copyHandlersForEnumerating];
      uint64_t v55 = [obj countByEnumeratingWithState:&v70 objects:v88 count:16];
      if (v55)
      {
        v52 = 0;
        uint64_t v54 = *(void *)v71;
        do
        {
          for (uint64_t i = 0; i != v55; ++i)
          {
            if (*(void *)v71 != v54) {
              objc_enumerationMutation(obj);
            }
            id v57 = *(id *)(*((void *)&v70 + 1) + 8 * i);
            if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
            {
              long long v68 = 0u;
              long long v69 = 0u;
              long long v66 = 0u;
              long long v67 = 0u;
              uint64_t v20 = [v57 accounts];
              uint64_t v21 = [v20 countByEnumeratingWithState:&v66 objects:v87 count:16];
              if (v21)
              {
                uint64_t v22 = *(void *)v67;
                do
                {
                  for (uint64_t j = 0; j != v21; ++j)
                  {
                    if (*(void *)v67 != v22) {
                      objc_enumerationMutation(v20);
                    }
                    uint64_t v24 = *(void *)(*((void *)&v66 + 1) + 8 * j);
                    id v25 = (void *)MEMORY[0x1E4F6E560];
                    int v26 = +[IMDAccountController sharedInstance];
                    id v27 = [v26 accounts];
                    LODWORD(v25) = [v25 isAccountUsableForSendingWithAllAccounts:v27 account:v24];

                    if (v25) {
                      [v61 addObject:v24];
                    }
                  }
                  uint64_t v21 = [v20 countByEnumeratingWithState:&v66 objects:v87 count:16];
                }
                while (v21);
              }

              id v28 = [v57 chatForOutgoingMessage:v51 fromIdentifier:v50 isInProxyMode:0 createIfNotExists:0];
              if ([v28 isNewerThan:v52])
              {
                id v29 = v28;

                v52 = v29;
              }
            }
          }
          uint64_t v55 = [obj countByEnumeratingWithState:&v70 objects:v88 count:16];
        }
        while (v55);
      }
      else
      {
        v52 = 0;
      }

      int v40 = [v51 objectForKey:IMDCTMessageDictionaryReceipientsKey];
      uint64_t v41 = objc_msgSend(v40, "__imArrayByApplyingBlock:", &unk_1F33920A0);

      v42 = +[IMDServiceReachabilityController sharedController];
      v43 = +[IMDServiceReachabilityController sharedController];
      v44 = [v43 reachabilityContextForChat:v52];
      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = sub_1D983E608;
      v63[3] = &unk_1E6B77AF8;
      v63[4] = v49;
      id v64 = v51;
      v65 = v48;
      [v42 calculateServiceForSendingToHandles:v41 accounts:v61 context:v44 completionBlock:v63];

      break;
    case 3uLL:
      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      id v58 = v47;
      uint64_t v30 = [v58 countByEnumeratingWithState:&v78 objects:v97 count:16];
      if (v30)
      {
        uint64_t v60 = *(void *)v79;
        uint64_t v62 = 0;
        while (1)
        {
          for (uint64_t k = 0; k != v30; ++k)
          {
            if (*(void *)v79 != v60) {
              objc_enumerationMutation(v58);
            }
            uint64_t v32 = *(void *)(*((void *)&v78 + 1) + 8 * k);
            long long v74 = 0u;
            long long v75 = 0u;
            long long v76 = 0u;
            long long v77 = 0u;
            id v33 = v56;
            uint64_t v34 = [v33 countByEnumeratingWithState:&v74 objects:v96 count:16];
            if (v34)
            {
              uint64_t v35 = *(void *)v75;
              do
              {
                for (uint64_t m = 0; m != v34; ++m)
                {
                  if (*(void *)v75 != v35) {
                    objc_enumerationMutation(v33);
                  }
                  id v37 = *(void **)(*((void *)&v74 + 1) + 8 * m);
                  if ((objc_opt_respondsToSelector() & 1) != 0
                    && [v37 responsibleForMessageID:v32])
                  {
                    v95 = v37;
                    uint64_t v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v95 count:1];

                    uint64_t v62 = (void *)v38;
                    goto LABEL_51;
                  }
                }
                uint64_t v34 = [v33 countByEnumeratingWithState:&v74 objects:v96 count:16];
              }
              while (v34);
            }
LABEL_51:
          }
          uint64_t v30 = [v58 countByEnumeratingWithState:&v78 objects:v97 count:16];
          if (!v30) {
            goto LABEL_55;
          }
        }
      }
      uint64_t v62 = 0;
LABEL_55:

      if (IMOSLoggingEnabled())
      {
        v39 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412803;
          id v90 = v58;
          __int16 v91 = 2112;
          v92 = v62;
          __int16 v93 = 2117;
          v94 = v51;
          _os_log_impl(&dword_1D967A000, v39, OS_LOG_TYPE_INFO, "Routing payload for messages %@ to %@, payload=%{sensitive}@", buf, 0x20u);
        }
      }
      v48[2](v48, v62);

      break;
    default:
      break;
  }
LABEL_62:
}

- (BOOL)_messageRequestsServiceForSendingBypass:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:IMDRelayMessageItemDictionarySkipServiceForSendingKey];
  objc_opt_class();
  BOOL v4 = (objc_opt_isKindOfClass() & 1) != 0 && ([v3 BOOLValue] & 1) != 0;

  return v4;
}

- (unint64_t)_listenerMatchTypeForCommand:(int64_t)a3 message:(id)a4
{
  id v6 = a4;
  char v7 = a3 - 101;
  if ((unint64_t)(a3 - 101) > 0x30) {
    goto LABEL_9;
  }
  if (((1 << v7) & 0x1600000000003) == 0)
  {
    if (((1 << v7) & 0x18000000000) != 0) {
      goto LABEL_11;
    }
    if (((1 << v7) & 0xC0000000000) != 0)
    {
      id v9 = [MEMORY[0x1E4F61740] sharedInstance];
      if ([v9 deviceType] == 2)
      {
        BOOL v10 = [(IMDRelayPushHandler *)self _messageRequestsServiceForSendingBypass:v6];

        if (!v10)
        {
          unint64_t v8 = 2;
          goto LABEL_12;
        }
      }
      else
      {
      }
LABEL_11:
      unint64_t v8 = 1;
      goto LABEL_12;
    }
LABEL_9:
    unint64_t v8 = 0;
    goto LABEL_12;
  }
  unint64_t v8 = 3;
LABEL_12:

  return v8;
}

- (unint64_t)_listenerMatchTypeForLocalMessageType:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_1EA8CA650 != -1) {
    dispatch_once(&qword_1EA8CA650, &unk_1F33920C0);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    unint64_t v9 = 0;
    goto LABEL_10;
  }
  unint64_t v8 = [(id)qword_1EA8CA640 objectForKeyedSubscript:v6];
  unint64_t v9 = [v8 integerValue];

  BOOL v10 = [MEMORY[0x1E4F61740] sharedInstance];
  if ([v10 deviceType] != 2) {
    goto LABEL_8;
  }
  BOOL v11 = [(IMDRelayPushHandler *)self _messageRequestsServiceForSendingBypass:v7];

  if (!v11)
  {
    id v12 = [(id)qword_1EA8CA648 objectForKeyedSubscript:v6];
    BOOL v10 = v12;
    if (v12) {
      unint64_t v9 = [v12 integerValue];
    }
LABEL_8:
  }
LABEL_10:

  return v9;
}

- (unint64_t)_routingBehaviorsForCommand:(int64_t)a3
{
  unint64_t result = 0;
  char v4 = a3 - 101;
  if ((unint64_t)(a3 - 101) <= 0x30)
  {
    if (((1 << v4) & 0xD8000000000) != 0)
    {
      return 8;
    }
    else if (((1 << v4) & 0x1400000000003) != 0)
    {
      return 2;
    }
    else if (a3 == 146)
    {
      return 6;
    }
  }
  return result;
}

- (unint64_t)_routingBehaviorsForLocalMessageType:(id)a3
{
  id v3 = a3;
  if (qword_1EA8CA660 != -1) {
    dispatch_once(&qword_1EA8CA660, &unk_1F33920E0);
  }
  char v4 = [(id)qword_1EA8CA658 objectForKeyedSubscript:v3];
  id v5 = v4;
  if (v4) {
    unint64_t v6 = [v4 integerValue];
  }
  else {
    unint64_t v6 = 0;
  }

  return v6;
}

- (IDSService)relayService
{
  return self->_relayService;
}

- (void)setRelayService:(id)a3
{
}

- (IDSService)smsWatchService
{
  return self->_smsWatchService;
}

- (void)setSmsWatchService:(id)a3
{
}

- (IDSAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSMutableArray)handlers
{
  return self->_handlers;
}

- (void)setHandlers:(id)a3
{
}

- (BOOL)registeredForPush
{
  return self->_registeredForPush;
}

- (void)setRegisteredForPush:(BOOL)a3
{
  self->_registeredForPush = a3;
}

- (BOOL)isListening
{
  return self->_isListening;
}

- (void)setIsListening:(BOOL)a3
{
  self->_isListening = a3;
}

- (NSCache)guidToListenersCache
{
  return self->_guidToListenersCache;
}

- (void)setGuidToListenersCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guidToListenersCache, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_smsWatchService, 0);

  objc_storeStrong((id *)&self->_relayService, 0);
}

@end