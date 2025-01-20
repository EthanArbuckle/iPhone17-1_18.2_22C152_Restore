@interface MessagePushHandler
+ (id)commandHandlerRegistry;
+ (id)localCommandHandlerRegistry;
+ (void)addLocalLockdownCommandHandlersToRegistry:(id)a3;
+ (void)addLocalStandardCommandHandlersToRegistry:(id)a3;
+ (void)addLockdownCommandHandlersToRegistry:(id)a3;
+ (void)addStandardCommandHandlersToRegistry:(id)a3;
- (BOOL)_shouldImmediatelySendAckForMessage:(id)a3 command:(id)a4;
- (IDSAccount)account;
- (IDSService)service;
- (MessagePushHandler)initWithIDSAccount:(id)a3;
- (id)copyHandlersForEnumerating;
- (id)messageReplayObjectWithService:(id)a3 account:(id)a4 incomingTopLevelMessage:(id)a5 fromID:(id)a6;
- (void)_service:(id)a3 account:(id)a4 incomingTopLevelMessage:(id)a5 fromID:(id)a6 messageContext:(id)a7 isBeingReplayed:(BOOL)a8;
- (void)addListener:(id)a3;
- (void)dealloc;
- (void)removeListener:(id)a3;
- (void)replayMessage:(id)a3;
- (void)sendManualAckForMessageWithContext:(id)a3;
- (void)service:(id)a3 account:(id)a4 incomingPendingMessageOfType:(int64_t)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingTopLevelMessage:(id)a5 fromID:(id)a6 messageContext:(id)a7;
- (void)service:(id)a3 didHintCheckingTransportLogWithReason:(int64_t)a4;
@end

@implementation MessagePushHandler

+ (id)commandHandlerRegistry
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6BA80;
  block[3] = &unk_DF568;
  block[4] = a1;
  if (qword_EC550 != -1) {
    dispatch_once(&qword_EC550, block);
  }
  v2 = [(id)qword_EC558 handlers];

  return v2;
}

+ (void)addStandardCommandHandlersToRegistry:(id)a3
{
  id v3 = a3;
  v4 = IMLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v19 = 136315394;
    v20 = "FTCommandIDErrorMessage";
    __int16 v21 = 2112;
    v22 = &off_E3810;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v19, 0x16u);
  }

  [v3 setStandardHandler:&stru_DF5A8 forCommand:&off_E3810];
  v5 = IMLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v19 = 136315394;
    v20 = "FTCommandIDDeliveryReceipt";
    __int16 v21 = 2112;
    v22 = &off_E3828;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v19, 0x16u);
  }

  [v3 setStandardHandler:&stru_DF5C8 forCommand:&off_E3828];
  v6 = IMLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v19 = 136315394;
    v20 = "FTCommandIDReflectedDeliveryReceipt";
    __int16 v21 = 2112;
    v22 = &off_E3840;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v19, 0x16u);
  }

  [v3 setStandardHandler:&stru_DF5E8 forCommand:&off_E3840];
  v7 = IMLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v19 = 136315394;
    v20 = "FTCommandIDReadReceipt";
    __int16 v21 = 2112;
    v22 = &off_E3858;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v19, 0x16u);
  }

  [v3 setStandardHandler:&stru_DF608 forCommand:&off_E3858];
  v8 = IMLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v19 = 136315394;
    v20 = "FTCommandIDUpdateAttachmentsMessage";
    __int16 v21 = 2112;
    v22 = &off_E3870;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v19, 0x16u);
  }

  [v3 setStandardHandler:&stru_DF628 forCommand:&off_E3870];
  v9 = IMLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v19 = 136315394;
    v20 = "FTCommandIDPlayedReceipt";
    __int16 v21 = 2112;
    v22 = &off_E3888;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v19, 0x16u);
  }

  [v3 setStandardHandler:&stru_DF648 forCommand:&off_E3888];
  v10 = IMLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v19 = 136315394;
    v20 = "FTCommandIDSavedReceipt";
    __int16 v21 = 2112;
    v22 = &off_E38A0;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v19, 0x16u);
  }

  [v3 setStandardHandler:&stru_DF668 forCommand:&off_E38A0];
  v11 = IMLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v19 = 136315394;
    v20 = "FTCommandIDTextMessage";
    __int16 v21 = 2112;
    v22 = &off_E38B8;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v19, 0x16u);
  }

  [v3 setStandardHandler:&stru_DF688 forCommand:&off_E38B8];
  v12 = IMLogHandleForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v19 = 136315394;
    v20 = "FTCommandIDLocationShareOfferCommand";
    __int16 v21 = 2112;
    v22 = &off_E38D0;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v19, 0x16u);
  }

  [v3 setStandardHandler:&stru_DF6A8 forCommand:&off_E38D0];
  v13 = IMLogHandleForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v19 = 136315394;
    v20 = "FTCommandIDGenericCommandMessage";
    __int16 v21 = 2112;
    v22 = &off_E38E8;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v19, 0x16u);
  }

  [v3 setStandardHandler:&stru_DF6C8 forCommand:&off_E38E8];
  v14 = IMLogHandleForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    int v19 = 136315394;
    v20 = "FTCommandIDNicknameInformationMessage";
    __int16 v21 = 2112;
    v22 = &off_E3900;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v19, 0x16u);
  }

  [v3 setStandardHandler:&stru_DF6E8 forCommand:&off_E3900];
  v15 = IMLogHandleForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v19 = 136315394;
    v20 = "FTCommandIDDeleteSyncMessage";
    __int16 v21 = 2112;
    v22 = &off_E3918;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v19, 0x16u);
  }

  [v3 setStandardHandler:&stru_DF708 forCommand:&off_E3918];
  v16 = IMLogHandleForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v19 = 136315394;
    v20 = "FTCommandIDRecoverSyncMessage";
    __int16 v21 = 2112;
    v22 = &off_E3930;
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v19, 0x16u);
  }

  [v3 setStandardHandler:&stru_DF728 forCommand:&off_E3930];
  v17 = IMLogHandleForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    int v19 = 136315394;
    v20 = "FTCommandIDGenericGroupMessageCommand";
    __int16 v21 = 2112;
    v22 = &off_E3948;
    _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v19, 0x16u);
  }

  [v3 setStandardHandler:&stru_DF748 forCommand:&off_E3948];
  v18 = IMLogHandleForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    int v19 = 136315394;
    v20 = "FTCommandIDBalloonTransportCommand";
    __int16 v21 = 2112;
    v22 = &off_E3960;
    _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v19, 0x16u);
  }

  [v3 setStandardHandler:&stru_DF768 forCommand:&off_E3960];
}

+ (void)addLockdownCommandHandlersToRegistry:(id)a3
{
  id v3 = a3;
  [v3 setPassThroughLockdownHandlerForCommand:&off_E3918];
  [v3 setPassThroughLockdownHandlerForCommand:&off_E3948];
  [v3 setPassThroughLockdownHandlerForCommand:&off_E38B8];
}

+ (id)localCommandHandlerRegistry
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_72F20;
  block[3] = &unk_DF568;
  block[4] = a1;
  if (qword_EB420 != -1) {
    dispatch_once(&qword_EB420, block);
  }
  v2 = [(id)qword_EB418 handlers];

  return v2;
}

+ (void)addLocalStandardCommandHandlersToRegistry:(id)a3
{
  id v3 = a3;
  v4 = IMLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    v9 = "IMDRelayLocalMessageTypeRemoteFileRequest";
    __int16 v10 = 2112;
    CFStringRef v11 = (const __CFString *)IMDRelayLocalMessageTypeRemoteFileRequest;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Adding Local Handler for command: %s (%@)", (uint8_t *)&v8, 0x16u);
  }

  [v3 setStandardHandler:&stru_DF788 forCommand:IMDRelayLocalMessageTypeRemoteFileRequest];
  v5 = IMLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    v9 = "IMDRelayLocalMessageTypeRemoteFileResponse";
    __int16 v10 = 2112;
    CFStringRef v11 = (const __CFString *)IMDRelayLocalMessageTypeRemoteFileResponse;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Adding Local Handler for command: %s (%@)", (uint8_t *)&v8, 0x16u);
  }

  [v3 setStandardHandler:&stru_DF7A8 forCommand:IMDRelayLocalMessageTypeRemoteFileResponse];
  v6 = IMLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    v9 = "kLocalMessagePayloadDataRequestKey";
    __int16 v10 = 2112;
    CFStringRef v11 = @"payload-data-request";
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Adding Local Handler for command: %s (%@)", (uint8_t *)&v8, 0x16u);
  }

  [v3 setStandardHandler:&stru_DF7C8 forCommand:@"payload-data-request"];
  v7 = IMLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    v9 = "kLocalMessagePayloadDataResponseKey";
    __int16 v10 = 2112;
    CFStringRef v11 = @"payload-data-response";
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Adding Local Handler for command: %s (%@)", (uint8_t *)&v8, 0x16u);
  }

  [v3 setStandardHandler:&stru_DF7E8 forCommand:@"payload-data-response"];
}

+ (void)addLocalLockdownCommandHandlersToRegistry:(id)a3
{
  uint64_t v3 = IMDRelayLocalMessageTypeRemoteFileRequest;
  id v4 = a3;
  [v4 setPassThroughLockdownHandlerForCommand:v3];
  [v4 setPassThroughLockdownHandlerForCommand:IMDRelayLocalMessageTypeRemoteFileResponse];
  [v4 setPassThroughLockdownHandlerForCommand:@"payload-data-request"];
  [v4 setPassThroughLockdownHandlerForCommand:@"payload-data-response"];
}

- (MessagePushHandler)initWithIDSAccount:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MessagePushHandler;
  v6 = [(MessagePushHandler *)&v21 init];
  v7 = v6;
  if (v6)
  {
    p_account = (id *)&v6->_account;
    objc_storeStrong((id *)&v6->_account, a3);
    v9 = [(id)objc_opt_class() commandHandlerRegistry];
    __int16 v10 = [v9 allKeys];
    CFStringRef v11 = +[NSSet setWithArray:v10];

    v12 = [*p_account serviceName];
    if ([v12 isEqualToString:IDSServiceNameiMessageForBusiness])
    {
      v13 = [*p_account serviceName];
    }
    else
    {
      v13 = @"com.apple.madrid";
    }

    v14 = +[IMFeatureFlags sharedFeatureFlags];
    unsigned int v15 = [v14 manuallyAckMessagesEnabled];

    id v16 = objc_alloc((Class)IDSService);
    if (v15) {
      v17 = (IDSService *)[v16 initWithService:v13 commands:v11 manuallyAckMessages:1];
    }
    else {
      v17 = (IDSService *)[v16 initWithService:v13 commands:v11];
    }
    idsService = v7->_idsService;
    v7->_idsService = v17;

    if (IMOSLoggingEnabled())
    {
      int v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v11;
        _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "supports commands: %@", buf, 0xCu);
      }
    }
    [(IDSService *)v7->_idsService addDelegate:v7 queue:&_dispatch_main_q];
    *(_WORD *)&v7->_registeredForPush = 257;
  }
  return v7;
}

- (void)dealloc
{
  [(IDSService *)self->_idsService removeDelegate:self];
  v3.receiver = self;
  v3.super_class = (Class)MessagePushHandler;
  [(MessagePushHandler *)&v3 dealloc];
}

- (id)copyHandlersForEnumerating
{
  return [(NSMutableArray *)self->_handlers _copyForEnumerating];
}

- (void)addListener:(id)a3
{
  id v7 = a3;
  if ((-[NSMutableArray containsObjectIdenticalTo:](self->_handlers, "containsObjectIdenticalTo:") & 1) == 0)
  {
    handlers = self->_handlers;
    if (!handlers)
    {
      id v5 = +[NSMutableArray nonRetainingArray];
      v6 = self->_handlers;
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

- (id)messageReplayObjectWithService:(id)a3 account:(id)a4 incomingTopLevelMessage:(id)a5 fromID:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  id v10 = a4;
  CFStringRef v11 = [v10 loginID];
  v12 = [v10 uniqueID];
  v13 = [v10 serviceName];

  id v14 = [objc_alloc((Class)IDSTransactionLogDictionaryMessage) initWithDictionary:v9 accountUniqueID:v12 fromID:v8 loginID:v11 serviceName:v13];

  return v14;
}

- (void)_service:(id)a3 account:(id)a4 incomingTopLevelMessage:(id)a5 fromID:(id)a6 messageContext:(id)a7 isBeingReplayed:(BOOL)a8
{
  BOOL v38 = a8;
  id v41 = a3;
  id v39 = a4;
  id v13 = a5;
  id v42 = a6;
  id v43 = a7;
  id v15 = [v13 _copyiMessageDictionaryForLogging];
  if (IMOSLoggingEnabled())
  {
    id v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      id v45 = v15;
      __int16 v46 = 2112;
      id v47 = v41;
      __int16 v48 = 2048;
      id v49 = v43;
      __int16 v50 = 2112;
      id v51 = v42;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "Received message %@ for service %@  context: %p, fromID: %@, ", buf, 0x2Au);
    }
  }
  id v40 = [objc_alloc((Class)IMPowerAssertion) initWithIdentifier:@"IncomingMessagePowerAssertion" timeout:10.0];
  v17 = [v13 objectForKey:@"IDSIncomingMessagePushPayload"];
  uint64_t v18 = IDSOriginalCommandKey;
  int v19 = [v17 objectForKey:IDSOriginalCommandKey];
  if (v19
    || ([v17 objectForKey:@"c"], (int v19 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([v13 objectForKey:v18], (int v19 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v20 = objc_opt_class();
    objc_super v21 = sub_6CB48(v20, v13, @"mc");
    unsigned int v22 = [v21 BOOLValue];

    v23 = [v17 objectForKey:@"U"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = [v17 objectForKey:@"U"];
      v25 = +[NSData _IDSDataFromBase64String:v24];
      v26 = JWUUIDPushObjectToString();
    }
    else
    {
      v24 = [v17 objectForKey:@"U"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v27 = [v17 objectForKey:@"U"];
        v26 = JWUUIDPushObjectToString();
      }
      else
      {
        v26 = JWUUIDPushObjectToString();
      }
    }

    if (v26) {
      unsigned int v28 = v22;
    }
    else {
      unsigned int v28 = 0;
    }
    if (v28 == 1)
    {
      v29 = [(id)IMWeakLinkClass() sharedInstance];
      [v29 addMessagesID:v26];
    }
    if ([v19 integerValue] == (char *)&stru_B8.size + 3)
    {
      if (IMOSLoggingEnabled())
      {
        v30 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "Received IDS Nice message (Local Message) ", buf, 2u);
        }
      }
      v31 = [v13 objectForKey:@"IDSIncomingMessagePushPayload"];
      v32 = v31;
      if (v31)
      {
        v33 = [v31 objectForKey:IMDRelayLocalMessageDictionaryDictKey];
        v34 = [v32 objectForKey:IMDRelayLocalMessageDictionaryTypeKey];
        v35 = [(id)objc_opt_class() localCommandHandlerRegistry];
        v36 = [v35 objectForKey:v34];

        if (v36) {
          ((void (**)(void, MessagePushHandler *, void *, void *, id, id, BOOL))v36)[2](v36, self, v33, v17, v43, v42, v38);
        }
      }
    }
    else
    {
      v37 = [(id)objc_opt_class() commandHandlerRegistry];
      v32 = [v37 objectForKey:v19];

      if (v32) {
        ((void (**)(void, MessagePushHandler *, id, void *, id, id, BOOL))v32)[2](v32, self, v13, v17, v43, v42, v38);
      }
    }
  }
  if ([(MessagePushHandler *)self _shouldImmediatelySendAckForMessage:v13 command:v19])
  {
    [(MessagePushHandler *)self sendManualAckForMessageWithContext:v43];
  }
}

- (void)replayMessage:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if (v5)
    {
      v6 = v5;
      id v7 = self->_idsService;
      id v8 = self->_account;
      id v9 = [v6 dictionaryValue];
      id v10 = [v6 fromID];
      int v11 = IMOSLoggingEnabled();
      if (v7 && v8 && v9 && v10)
      {
        if (v11)
        {
          v12 = OSLogHandleForIMEventCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            int v15 = 138412290;
            id v16 = (IDSService *)v6;
            _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "About to replay message dictionary after unlock %@", (uint8_t *)&v15, 0xCu);
          }
        }
        [(MessagePushHandler *)self _service:v7 account:v8 incomingTopLevelMessage:v9 fromID:v10 messageContext:0 isBeingReplayed:1];
      }
      else if (v11)
      {
        id v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          int v15 = 138413058;
          id v16 = v7;
          __int16 v17 = 2112;
          uint64_t v18 = v8;
          __int16 v19 = 2112;
          uint64_t v20 = v9;
          __int16 v21 = 2112;
          unsigned int v22 = v10;
          _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "Got invalid input to replay message service: %@ account: %@ incomingTopLevelMessage: %@ fromID: %@ ", (uint8_t *)&v15, 0x2Au);
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      id v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Got passed in null replay message", (uint8_t *)&v15, 2u);
      }
    }
  }
}

- (BOOL)_shouldImmediatelySendAckForMessage:(id)a3 command:(id)a4
{
  id v5 = a3;
  if ([a4 integerValue] == &stru_20.flags)
  {
    v6 = [v5 objectForKey:@"IDSIncomingMessageDecryptedData"];
    char v7 = v6 == 0;
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (void)sendManualAckForMessageWithContext:(id)a3
{
  id v4 = a3;
  id v5 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned int v6 = [v5 manuallyAckMessagesEnabled];

  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      char v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v9 = 138412290;
        id v10 = v4;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Sending manual ack for messageContext %@", (uint8_t *)&v9, 0xCu);
      }
    }
    id v8 = [(MessagePushHandler *)self service];
    [v8 sendAckForMessageWithContext:v4];
  }
}

- (void)service:(id)a3 account:(id)a4 incomingTopLevelMessage:(id)a5 fromID:(id)a6 messageContext:(id)a7
{
  id v12 = a3;
  id v13 = (IDSAccount *)a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (self->_registeredForPush && self->_isListening && self->_account == v13)
  {
    [(MessagePushHandler *)self _service:v12 account:v13 incomingTopLevelMessage:v14 fromID:v15 messageContext:v16 isBeingReplayed:0];
  }
  else if (IMOSLoggingEnabled())
  {
    __int16 v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      CFStringRef v18 = @"YES";
      if (self->_registeredForPush) {
        CFStringRef v19 = @"YES";
      }
      else {
        CFStringRef v19 = @"NO";
      }
      account = self->_account;
      if (!self->_isListening) {
        CFStringRef v18 = @"NO";
      }
      int v21 = 138413058;
      CFStringRef v22 = v19;
      __int16 v23 = 2112;
      CFStringRef v24 = v18;
      __int16 v25 = 2112;
      v26 = v13;
      __int16 v27 = 2112;
      unsigned int v28 = account;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Early return receiving message, registeredForPush %@ isListening %@  account: %@   _account: %@", (uint8_t *)&v21, 0x2Au);
    }
  }
}

- (void)service:(id)a3 account:(id)a4 incomingPendingMessageOfType:(int64_t)a5 fromID:(id)a6 context:(id)a7
{
  id v11 = a3;
  id v12 = (IDSAccount *)a4;
  id v13 = (__CFString *)a6;
  id v14 = a7;
  id v15 = v14;
  if (self->_registeredForPush
    && self->_isListening
    && self->_account == v12
    && ([v14 messageHadEncryptedData] & 1) != 0)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v16 = [(IDSAccount *)v12 vettedAliases];
    id v17 = [v16 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v32;
      while (2)
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v32 != v18) {
            objc_enumerationMutation(v16);
          }
          uint64_t v20 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          int v21 = [(__CFString *)v13 _stripFZIDPrefix];
          LODWORD(v20) = [v20 isEqualToString:v21];

          if (v20)
          {
            if (IMOSLoggingEnabled())
            {
              v29 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                CFStringRef v37 = v13;
                _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "Early return message before first unlock, fromID %@ is from the same AppleID", buf, 0xCu);
              }
            }
            goto LABEL_30;
          }
        }
        id v17 = [v16 countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }

    if (IMOSLoggingEnabled())
    {
      CFStringRef v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "Posting notification for iMessage before first unlock", buf, 2u);
      }
    }
    if (qword_EB430 != -1) {
      dispatch_once(&qword_EB430, &stru_DF808);
    }
    __int16 v23 = [(__CFString *)v13 _stripFZIDPrefix];
    if (objc_opt_respondsToSelector())
    {
      CFStringRef v24 = [v15 performSelector:"originalGUID"];
    }
    else
    {
      v30 = +[NSUUID UUID];
      CFStringRef v24 = [v30 UUIDString];
    }
    off_EB428(v24, v23);
  }
  else if (IMOSLoggingEnabled())
  {
    __int16 v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      CFStringRef v26 = @"YES";
      if (self->_registeredForPush) {
        CFStringRef v27 = @"YES";
      }
      else {
        CFStringRef v27 = @"NO";
      }
      account = self->_account;
      if (!self->_isListening) {
        CFStringRef v26 = @"NO";
      }
      *(_DWORD *)buf = 138413058;
      CFStringRef v37 = v27;
      __int16 v38 = 2112;
      CFStringRef v39 = v26;
      __int16 v40 = 2112;
      id v41 = v12;
      __int16 v42 = 2112;
      id v43 = account;
      _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "Early return receiving message before first unlock, registeredForPush %@ isListening %@  account: %@   _account: %@", buf, 0x2Au);
    }
  }
LABEL_30:
}

- (void)service:(id)a3 didHintCheckingTransportLogWithReason:(int64_t)a4
{
  if (!a4)
  {
    id v5 = +[NSNotificationCenter defaultCenter];
    [v5 postNotificationName:IMDMessageHistorySyncNotifyCKChatSyncControllerWantsSync object:0];
  }
}

- (IDSService)service
{
  return self->_idsService;
}

- (IDSAccount)account
{
  return self->_account;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_idsService, 0);
}

@end