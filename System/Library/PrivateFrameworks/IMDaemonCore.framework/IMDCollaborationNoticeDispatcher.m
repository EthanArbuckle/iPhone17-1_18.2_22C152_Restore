@interface IMDCollaborationNoticeDispatcher
+ (Class)_SWCollaborationClearNoticeTransmissionMessageClass;
+ (Class)_SWCollaborationNoticeTransmissionMessageClass;
+ (id)unarchiveNoticeTransmissionEvent:(id)a3;
+ (unint64_t)noticeFanoutThreshold;
- (IDSService)gelatoService;
- (IMDCollaborationClearNoticeRateLimiter)clearRateLimiter;
- (IMDCollaborationNoticeDispatcher)init;
- (IMDCollaborationNoticeDispatcherDelegate)delegate;
- (IMDCollaborationNoticeRateLimiter)rateLimiter;
- (id)_handlesMinusSenderServiceAccountID:(id)a3;
- (id)_senderServiceAccountIDFrom:(id)a3;
- (id)senderLoginIDs;
- (void)dealloc;
- (void)handleIncomingNoticeProtobuf:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)reflectDismissalForNoticeGUIDs:(id)a3;
- (void)sendClearNotice:(id)a3 toHandles:(id)a4;
- (void)sendNotice:(id)a3 toHandles:(id)a4 fromHandle:(id)a5;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setClearRateLimiter:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGelatoService:(id)a3;
- (void)setRateLimiter:(id)a3;
@end

@implementation IMDCollaborationNoticeDispatcher

+ (Class)_SWCollaborationNoticeTransmissionMessageClass
{
  if (qword_1EA8CA4A0 != -1) {
    dispatch_once(&qword_1EA8CA4A0, &unk_1F3390F40);
  }
  v2 = (void *)qword_1EA8CA498;

  return (Class)v2;
}

+ (Class)_SWCollaborationClearNoticeTransmissionMessageClass
{
  if (qword_1EA8CA4B0 != -1) {
    dispatch_once(&qword_1EA8CA4B0, &unk_1F3390F60);
  }
  v2 = (void *)qword_1EA8CA4A8;

  return (Class)v2;
}

- (IMDCollaborationNoticeDispatcher)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)IMDCollaborationNoticeDispatcher;
  v2 = [(IMDCollaborationNoticeDispatcher *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F6AB90]) initWithService:@"com.apple.private.alloy.gelato"];
    gelatoService = v2->_gelatoService;
    v2->_gelatoService = (IDSService *)v3;

    [(IDSService *)v2->_gelatoService setProtobufAction:sel_handleIncomingNoticeProtobuf_service_account_fromID_context_ forIncomingRequestsOfType:1];
    [(IDSService *)v2->_gelatoService addDelegate:v2 queue:MEMORY[0x1E4F14428]];
    v5 = objc_alloc_init(IMDCollaborationNoticeRateLimiter);
    rateLimiter = v2->_rateLimiter;
    v2->_rateLimiter = v5;

    v7 = objc_alloc_init(IMDCollaborationClearNoticeRateLimiter);
    clearRateLimiter = v2->_clearRateLimiter;
    v2->_clearRateLimiter = v7;

    if (IMOSLoggingEnabled())
    {
      v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = v2->_gelatoService;
        *(_DWORD *)buf = 138412290;
        v14 = v10;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Loaded notice dispatch service: %@", buf, 0xCu);
      }
    }
  }
  return v2;
}

- (void)dealloc
{
  [(IDSService *)self->_gelatoService removeDelegate:self];
  v3.receiver = self;
  v3.super_class = (Class)IMDCollaborationNoticeDispatcher;
  [(IMDCollaborationNoticeDispatcher *)&v3 dealloc];
}

- (void)sendNotice:(id)a3 toHandles:(id)a4 fromHandle:(id)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v10 = [(IMDCollaborationNoticeDispatcher *)self _handlesMinusSenderServiceAccountID:a4];
  if ([v10 count])
  {
    unint64_t v11 = +[IMDCollaborationNoticeDispatcher noticeFanoutThreshold];
    if ([v10 count] <= v11)
    {
      v21 = [(IMDCollaborationNoticeDispatcher *)self rateLimiter];
      char v22 = [v21 shouldSendNotice:v8];

      if (v22)
      {
        id v23 = objc_alloc_init(+[IMDCollaborationNoticeDispatcher _SWCollaborationNoticeTransmissionMessageClass]);
        if (v23)
        {
          if (objc_opt_respondsToSelector()) {
            [v23 setVersion:1];
          }
          if (objc_opt_respondsToSelector())
          {
            v24 = [v8 guidString];
            [v23 setGuidString:v24];
          }
          if (objc_opt_respondsToSelector())
          {
            v25 = [v8 eventData];
            [v23 setHighlightChangeEvent:v25];
          }
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v23, "setHighlightChangeEventType:", objc_msgSend(v8, "eventType"));
          }
          if (objc_opt_respondsToSelector())
          {
            v26 = [v8 date];
            [v26 timeIntervalSince1970];
            objc_msgSend(v23, "setDateAsTimeIntervalSince1970:");
          }
          if (IMOSLoggingEnabled())
          {
            v27 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138413058;
              v49 = (const char *)&unk_1F33C5838;
              __int16 v50 = 2112;
              id v51 = v8;
              __int16 v52 = 2112;
              v53 = v10;
              __int16 v54 = 2112;
              id v55 = v23;
              _os_log_impl(&dword_1D967A000, v27, OS_LOG_TYPE_INFO, "Sending notice (command: %@) %@ to %@, message: %@", buf, 0x2Au);
            }
          }
          id v28 = objc_alloc(MEMORY[0x1E4F6B528]);
          v29 = [v23 data];
          v30 = [v28 initWithProtobufData:v29 type:1 isResponse:0];

          v31 = [MEMORY[0x1E4F1CA60] dictionary];
          v32 = v31;
          if (v9) {
            [v31 setObject:v9 forKey:*MEMORY[0x1E4F6A9B8]];
          }
          gelatoService = self->_gelatoService;
          v34 = (void *)[v32 copy];
          id v46 = 0;
          id v47 = 0;
          [(IDSService *)gelatoService sendProtobuf:v30 toDestinations:v10 priority:300 options:v34 identifier:&v47 error:&v46];
          id v35 = v47;
          id v36 = v46;

          if (v36)
          {
            v37 = IMLogHandleForCategory();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
              sub_1D990066C((uint64_t)v36, v37, v38, v39, v40, v41, v42, v43);
            }
          }
          else
          {
            if (IMOSLoggingEnabled())
            {
              v45 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315650;
                v49 = "-[IMDCollaborationNoticeDispatcher sendNotice:toHandles:fromHandle:]";
                __int16 v50 = 2112;
                id v51 = v35;
                __int16 v52 = 2112;
                v53 = v10;
                _os_log_impl(&dword_1D967A000, v45, OS_LOG_TYPE_INFO, "%s Successfully sent Collaboration Notice (guid: %@) to handles: %@", buf, 0x20u);
              }
            }
            v37 = [(IMDCollaborationNoticeDispatcher *)self rateLimiter];
            [v37 didSendNotice:v8];
          }
        }
        else
        {
          v30 = IMLogHandleForCategory();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            sub_1D9900628(v30);
          }
        }
      }
      else if (IMOSLoggingEnabled())
      {
        v44 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v49 = "-[IMDCollaborationNoticeDispatcher sendNotice:toHandles:fromHandle:]";
          __int16 v50 = 2112;
          id v51 = v8;
          _os_log_impl(&dword_1D967A000, v44, OS_LOG_TYPE_INFO, "%s: Bailing due to rate limiting for notice: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      objc_super v12 = IMLogHandleForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1D990055C(v10, v11);
      }
    }
  }
  else
  {
    v13 = IMLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1D99004E4(v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
}

- (void)sendClearNotice:(id)a3 toHandles:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IMDCollaborationNoticeDispatcher *)self _senderServiceAccountIDFrom:v7];
  if ([v7 count])
  {
    unint64_t v9 = +[IMDCollaborationNoticeDispatcher noticeFanoutThreshold];
    if ([v7 count] <= v9)
    {
      uint64_t v19 = [(IMDCollaborationNoticeDispatcher *)self clearRateLimiter];
      char v20 = [v19 shouldSendWithNotice:v6];

      if (v20)
      {
        id v21 = objc_alloc_init(+[IMDCollaborationNoticeDispatcher _SWCollaborationClearNoticeTransmissionMessageClass]);
        if (v21)
        {
          if (objc_opt_respondsToSelector()) {
            [v21 setVersion:2];
          }
          if (objc_opt_respondsToSelector())
          {
            char v22 = [v6 guidString];
            [v21 setGuidString:v22];
          }
          if (objc_opt_respondsToSelector())
          {
            id v23 = [v6 collaborationId];
            [v21 setCollaborationId:v23];
          }
          if (objc_opt_respondsToSelector())
          {
            v24 = [v6 date];
            [v24 timeIntervalSince1970];
            objc_msgSend(v21, "setDateAsTimeIntervalSince1970:");
          }
          if (IMOSLoggingEnabled())
          {
            v25 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138413058;
              uint64_t v39 = (const char *)&unk_1F33C5850;
              __int16 v40 = 2112;
              id v41 = v6;
              __int16 v42 = 2112;
              id v43 = v7;
              __int16 v44 = 2112;
              id v45 = v21;
              _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "Sending notice (command: %@) %@ to %@, message: %@", buf, 0x2Au);
            }
          }
          id v26 = objc_alloc(MEMORY[0x1E4F6B528]);
          v27 = [v21 data];
          id v28 = [v26 initWithProtobufData:v27 type:2 isResponse:0];

          v29 = [v28 data];
          if ([v29 length])
          {
            v30 = NSString;
            v31 = [NSString stringGUID];
            v32 = [v30 stringWithFormat:@"%@-%@.data", @"ClearCollaborationNotice", v31];

            [MEMORY[0x1E4F6E7E0] writeDataPayloadToDisk:v29 fileName:v32];
          }
          v33 = [MEMORY[0x1E4F6E950] contextWithKnownSender:1];
          v35[0] = MEMORY[0x1E4F143A8];
          v35[1] = 3221225472;
          v35[2] = sub_1D972AFC0;
          v35[3] = &unk_1E6B751D8;
          id v36 = v8;
          v37 = self;
          +[IMBlastdoor sendClearNoticeData:v29 senderContext:v33 withCompletionBlock:v35];
        }
        else
        {
          id v28 = IMLogHandleForCategory();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
            sub_1D990081C(v28);
          }
        }
      }
      else if (IMOSLoggingEnabled())
      {
        v34 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v39 = "-[IMDCollaborationNoticeDispatcher sendClearNotice:toHandles:]";
          __int16 v40 = 2112;
          id v41 = v6;
          _os_log_impl(&dword_1D967A000, v34, OS_LOG_TYPE_INFO, "%s: Bailing due to rate limiting for notice: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      v10 = IMLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1D9900750(v7, v9);
      }
    }
  }
  else
  {
    unint64_t v11 = IMLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1D99006D8(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
}

- (void)reflectDismissalForNoticeGUIDs:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v19 = "-[IMDCollaborationNoticeDispatcher reflectDismissalForNoticeGUIDs:]";
      __int16 v20 = 2112;
      id v21 = v4;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "%s: Handling request to reflect notice dismissal for guids: %@", buf, 0x16u);
    }
  }
  v16[0] = @"at";
  v16[1] = @"g";
  v17[0] = &unk_1F33C5868;
  v17[1] = v4;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  uint64_t v14 = *MEMORY[0x1E4F6A960];
  uint64_t v15 = MEMORY[0x1E4F1CC38];
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  id v8 = (void *)MEMORY[0x1E4F6E7C0];
  gelatoService = self->_gelatoService;
  v10 = [(IMDCollaborationNoticeDispatcher *)self senderLoginIDs];
  uint64_t v12 = 0;
  id v13 = 0;
  [v8 service:gelatoService sendMessage:v6 toDestinations:v10 priority:300 options:v7 identifier:&v13 error:&v12];
  id v11 = v13;
}

- (void)handleIncomingNoticeProtobuf:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v34 = a4;
  id v35 = a5;
  id v13 = a6;
  id v14 = a7;
  if (IMOSLoggingEnabled())
  {
    uint64_t v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v40 = "-[IMDCollaborationNoticeDispatcher handleIncomingNoticeProtobuf:service:account:fromID:context:]";
      __int16 v41 = 2112;
      id v42 = v13;
      _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "%s: Handling incoming Collaboration Notice from: %@", buf, 0x16u);
    }
  }
  uint64_t v16 = (void *)IDSCopyAddressDestinationForDestination();
  uint64_t v17 = (void *)IDSCopyRawAddressForDestination();

  if ([v17 length])
  {
    uint64_t v18 = [MEMORY[0x1E4F1CAD0] setWithObject:v17];
    uint64_t v19 = [(IMDCollaborationNoticeDispatcher *)self _handlesMinusSenderServiceAccountID:v18];

    if ([v19 count])
    {
      __int16 v20 = [v12 data];
      if ([v20 length])
      {
        id v21 = NSString;
        uint64_t v22 = [NSString stringGUID];
        id v23 = [v21 stringWithFormat:@"%@-%@.data", @"CollaborationNotice", v22, v34, v35];

        [MEMORY[0x1E4F6E7E0] writeDataPayloadToDisk:v20 fileName:v23];
      }
      v24 = +[IMDChatRegistry sharedInstance];
      uint64_t v25 = [v24 hasKnownSenderChatWithChatIdentifier:v17];

      id v26 = [MEMORY[0x1E4F6E950] contextWithKnownSender:v25];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = sub_1D972B850;
      v36[3] = &unk_1E6B75200;
      id v37 = v17;
      uint64_t v38 = self;
      +[IMBlastdoor sendCollaborationNoticeData:v20 senderContext:v26 withCompletionBlock:v36];
    }
    else
    {
      __int16 v20 = IMLogHandleForCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_1D9900A00();
      }
    }
  }
  else
  {
    uint64_t v19 = IMLogHandleForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1D9900988(v19, v27, v28, v29, v30, v31, v32, v33);
    }
  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (IMOSLoggingEnabled())
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v32 = "-[IMDCollaborationNoticeDispatcher service:account:incomingMessage:fromID:context:]";
      __int16 v33 = 2112;
      id v34 = v15;
      __int16 v35 = 2112;
      id v36 = v14;
      _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "%s fromID: %@, message: %@", buf, 0x20u);
    }
  }
  uint64_t v18 = (void *)IDSCopyAddressDestinationForDestination();
  uint64_t v19 = (void *)IDSCopyRawAddressForDestination();

  if ([v19 length])
  {
    __int16 v20 = +[IMDChatRegistry sharedInstance];
    uint64_t v21 = [v20 hasKnownSenderChatWithChatIdentifier:v19];

    uint64_t v22 = [MEMORY[0x1E4F6E950] contextWithKnownSender:v21];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = sub_1D972BE14;
    v30[3] = &unk_1E6B75228;
    v30[4] = self;
    +[IMBlastdoor sendCollaborationNoticeActionDictionary:v14 senderContext:v22 withCompletionBlock:v30];
  }
  else
  {
    uint64_t v22 = IMLogHandleForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1D9900B9C(v22, v23, v24, v25, v26, v27, v28, v29);
    }
  }
}

+ (unint64_t)noticeFanoutThreshold
{
  v2 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:0];
  objc_super v3 = [v2 objectForKey:@"notice-fanout-threshold"];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unint64_t v4 = [v3 unsignedIntegerValue];
  }
  else {
    unint64_t v4 = 100;
  }

  return v4;
}

- (id)_handlesMinusSenderServiceAccountID:(id)a3
{
  unint64_t v4 = (void *)[a3 mutableCopy];
  v5 = [(IMDCollaborationNoticeDispatcher *)self senderLoginIDs];
  [v4 minusSet:v5];

  id v6 = (void *)[v4 copy];

  return v6;
}

- (id)_senderServiceAccountIDFrom:(id)a3
{
  unint64_t v4 = (void *)[a3 mutableCopy];
  v5 = [(IMDCollaborationNoticeDispatcher *)self senderLoginIDs];
  [v4 intersectSet:v5];

  id v6 = [v4 allObjects];
  id v7 = [v6 firstObject];
  id v8 = (void *)[v7 mutableCopy];

  return v8;
}

- (id)senderLoginIDs
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F1CA80] set];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unint64_t v4 = [(IMDCollaborationNoticeDispatcher *)self gelatoService];
  v5 = [v4 accounts];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v11 = [v10 loginID];

        if (v11)
        {
          id v12 = [v10 loginID];
          id v13 = (void *)IDSCopyBestGuessIDForID();

          id v14 = MEMORY[0x1E0169B80](v13);
          [v3 addObject:v14];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v3;
}

+ (id)unarchiveNoticeTransmissionEvent:(id)a3
{
  v15[7] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (objc_msgSend(sub_1D972C530(), "eventClassForType:", objc_msgSend(v3, "eventType")))
  {
    unint64_t v4 = [sub_1D972C530() allowedClasses];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v15[2] = objc_opt_class();
    v15[3] = objc_opt_class();
    v15[4] = objc_opt_class();
    v15[5] = objc_opt_class();
    v15[6] = objc_opt_class();
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:7];
    uint64_t v6 = [v4 setByAddingObjectsFromArray:v5];

    uint64_t v7 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v8 = [v3 eventData];
    id v14 = 0;
    unint64_t v9 = [v7 _strictlyUnarchivedObjectOfClasses:v6 fromData:v8 error:&v14];
    v10 = v14;

    if (v10 || !v9)
    {
      id v12 = IMLogHandleForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1D9900DE4();
      }

      id v11 = 0;
    }
    else
    {
      id v11 = v9;
    }
  }
  else
  {
    v10 = IMLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1D9900D30(v3, v10);
    }
    id v11 = 0;
  }

  return v11;
}

- (IMDCollaborationNoticeDispatcherDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IMDCollaborationNoticeDispatcherDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (IMDCollaborationNoticeRateLimiter)rateLimiter
{
  return self->_rateLimiter;
}

- (void)setRateLimiter:(id)a3
{
}

- (IMDCollaborationClearNoticeRateLimiter)clearRateLimiter
{
  return self->_clearRateLimiter;
}

- (void)setClearRateLimiter:(id)a3
{
}

- (IDSService)gelatoService
{
  return self->_gelatoService;
}

- (void)setGelatoService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gelatoService, 0);
  objc_storeStrong((id *)&self->_clearRateLimiter, 0);
  objc_storeStrong((id *)&self->_rateLimiter, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end