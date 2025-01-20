@interface IMAssistantMessageQueryHandler
+ (OS_dispatch_queue)IMAssistantIMSPIQueue;
- (BOOL)messageIsFromBlackholedChat:(id)a3;
- (BOOL)resolvePersons:(id)a3 forIntent:(id)a4 completionHandler:(id)a5;
- (id)allIMHandlesForHandle:(id)a3;
- (id)chatParticipantForSPIHandle:(id)a3;
- (id)chatParticipantsForSPIHandles:(id)a3;
- (id)chatsContainingRequiredParticipants:(id)a3;
- (id)chatsForChatNames:(id)a3;
- (id)chatsWithConversationIdentifiers:(id)a3;
- (id)messageContentsPredicate:(id)a3;
- (id)recipientsPredicate:(id)a3;
- (id)resolveDateTimeRange:(id)a3;
- (id)sendersPredicate:(id)a3;
- (id)spokenPhrasesForSpeakableStrings:(id)a3;
- (id)unifiedContactIdentifiersForPerson:(id)a3;
- (id)vocabularyIdentifiersFromSpeakableStrings:(id)a3;
- (void)SPIQueryMessagesForChats:(id)a3 onlyUnread:(BOOL)a4 limit:(int64_t)a5 completion:(id)a6;
- (void)SPIQueryMessagesForChatsWithIdentifiers:(id)a3 services:(id)a4 onlyUnread:(BOOL)a5 limit:(int64_t)a6 completion:(id)a7;
- (void)SPIQueryMessagesForSenders:(id)a3 onlyUnread:(BOOL)a4 limit:(int64_t)a5 completion:(id)a6;
- (void)SPIQueryMessagesWithGUIDs:(id)a3 completion:(id)a4;
- (void)SPIQueryMessagesWithRowIDs:(id)a3 completion:(id)a4;
- (void)SPIQueryUnreadMessages:(int64_t)a3 completion:(id)a4;
- (void)handlesAndServicesForChatGuids:(id)a3 handles:(id *)a4 services:(id *)a5;
- (void)handlesAndServicesForPersons:(id)a3 handles:(id *)a4 services:(id *)a5;
- (void)messagesMatchingMessageIdentifiers:(id)a3 completion:(id)a4;
- (void)searchMessagesWithContents:(id)a3 messageIdentifiers:(id)a4 notificationIdentifiers:(id)a5 chatNames:(id)a6 conversationIdentifiers:(id)a7 recipients:(id)a8 senders:(id)a9 dateTimeRange:(id)a10 attributes:(unint64_t)a11 completion:(id)a12;
@end

@implementation IMAssistantMessageQueryHandler

- (BOOL)resolvePersons:(id)a3 forIntent:(id)a4 completionHandler:(id)a5
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v36 = a4;
  v8 = (void (**)(void))a5;
  v35 = v7;
  if (![v7 count])
  {
    ((void (*)(void (**)(void), void, void))v8[2])(v8, MEMORY[0x263EFFA68], MEMORY[0x263EFFA68]);
    BOOL v31 = 0;
    goto LABEL_41;
  }
  if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v45 = (uint64_t)v7;
      __int16 v46 = 2112;
      id v47 = v36;
      _os_log_impl(&dword_22C1AD000, v9, OS_LOG_TYPE_INFO, "Resolving persons: %@ for intent: %@", buf, 0x16u);
    }
  }
  v10 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count", v8));
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v7;
  uint64_t v12 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (!v12)
  {

    goto LABEL_39;
  }
  uint64_t v13 = *(void *)v40;
  char v37 = 1;
  do
  {
    uint64_t v14 = 0;
    do
    {
      if (*(void *)v40 != v13) {
        objc_enumerationMutation(obj);
      }
      v15 = *(void **)(*((void *)&v39 + 1) + 8 * v14);
      if (IMOSLoggingEnabled())
      {
        v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v45 = (uint64_t)v15;
          _os_log_impl(&dword_22C1AD000, v16, OS_LOG_TYPE_INFO, "Resolving person: %@", buf, 0xCu);
        }
      }
      v17 = objc_msgSend(v15, "__im_assistant_allContactIdentifiers");
      if ([v17 count])
      {
        if (IMOSLoggingEnabled())
        {
          v18 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            uint64_t v19 = [v17 count];
            *(_DWORD *)buf = 134218242;
            uint64_t v45 = v19;
            __int16 v46 = 2112;
            id v47 = v17;
            _os_log_impl(&dword_22C1AD000, v18, OS_LOG_TYPE_INFO, "Successfully resolved person to %ld contact identifiers: %@", buf, 0x16u);
          }
        }
LABEL_26:
        [v11 addObject:v15];
        v27 = [MEMORY[0x263F0FD28] successWithResolvedPerson:v15];
        goto LABEL_27;
      }
      v20 = [v15 personHandle];
      v21 = [v20 value];
      BOOL v22 = [v21 length] == 0;

      int v23 = IMOSLoggingEnabled();
      if (!v22)
      {
        if (v23)
        {
          v24 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            v25 = [v15 personHandle];
            v26 = [v25 value];
            *(_DWORD *)buf = 138412290;
            uint64_t v45 = (uint64_t)v26;
            _os_log_impl(&dword_22C1AD000, v24, OS_LOG_TYPE_INFO, "Successfully resolved person to handle: %@", buf, 0xCu);
          }
        }
        goto LABEL_26;
      }
      if (v23)
      {
        v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          v29 = [v15 displayName];
          *(_DWORD *)buf = 138412546;
          uint64_t v45 = (uint64_t)v29;
          __int16 v46 = 2112;
          id v47 = v36;
          _os_log_impl(&dword_22C1AD000, v28, OS_LOG_TYPE_INFO, "Could not resolve person %@ for intent %@", buf, 0x16u);
        }
      }
      v27 = [MEMORY[0x263F0FD28] unsupported];
      char v37 = 0;
LABEL_27:
      [v10 addObject:v27];

      ++v14;
    }
    while (v12 != v14);
    uint64_t v30 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    uint64_t v12 = v30;
  }
  while (v30);

  if ((v37 & 1) == 0)
  {
    v34[2]();
    BOOL v31 = 0;
    goto LABEL_40;
  }
LABEL_39:
  v32 = (void *)[v11 copy];
  ((void (*)(void (**)(void), void *, void *))v34[2])(v34, v10, v32);

  BOOL v31 = 1;
LABEL_40:

  v8 = v34;
LABEL_41:

  return v31;
}

- (id)resolveDateTimeRange:(id)a3
{
  if (a3) {
    objc_msgSend(MEMORY[0x263F0FA68], "successWithResolvedDateComponentsRange:");
  }
  else {
  v3 = [MEMORY[0x263F0FA68] notRequired];
  }

  return v3;
}

+ (OS_dispatch_queue)IMAssistantIMSPIQueue
{
  if (qword_2684A55E8 != -1) {
    dispatch_once(&qword_2684A55E8, &unk_26DF9B7F8);
  }
  v2 = (void *)qword_2684A55E0;

  return (OS_dispatch_queue *)v2;
}

- (id)allIMHandlesForHandle:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = objc_msgSend(MEMORY[0x263F4A520], "sharedInstance", 0);
  v6 = [v5 accounts];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) imHandleWithID:v3];
        if (v11) {
          [v4 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  uint64_t v12 = [v4 array];

  return v12;
}

- (void)SPIQueryMessagesForChats:(id)a3 onlyUnread:(BOOL)a4 limit:(int64_t)a5 completion:(id)a6
{
  BOOL v27 = a4;
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v29 = a6;
  id v9 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        long long v15 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
        long long v16 = [v15 chatDataSource];
        long long v17 = [v16 allGUIDsForChat:v14];

        if (v17)
        {
          if (IMOSLoggingEnabled())
          {
            v18 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              uint64_t v19 = [v17 count];
              *(_DWORD *)buf = 134218498;
              uint64_t v37 = v19;
              __int16 v38 = 2112;
              long long v39 = v17;
              __int16 v40 = 2112;
              uint64_t v41 = v14;
              _os_log_impl(&dword_22C1AD000, v18, OS_LOG_TYPE_INFO, "Found %ld chat guids: %@, matching chat: %@", buf, 0x20u);
            }
          }
          [v9 addObjectsFromArray:v17];
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v42 count:16];
    }
    while (v11);
  }

  id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v21 = objc_alloc_init(MEMORY[0x263EFF980]);
  BOOL v22 = [v9 array];
  id v30 = v21;
  id v31 = v20;
  [(IMAssistantMessageQueryHandler *)self handlesAndServicesForChatGuids:v22 handles:&v31 services:&v30];
  id v23 = v31;

  id v24 = v30;
  v25 = (void *)[v23 copy];
  v26 = (void *)[v24 copy];

  [(IMAssistantMessageQueryHandler *)self SPIQueryMessagesForChatsWithIdentifiers:v25 services:v26 onlyUnread:v27 limit:a5 completion:v29];
}

- (void)SPIQueryMessagesForChatsWithIdentifiers:(id)a3 services:(id)a4 onlyUnread:(BOOL)a5 limit:(int64_t)a6 completion:(id)a7
{
  BOOL v9 = a5;
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  uint64_t v14 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
  os_signpost_id_t v15 = os_signpost_id_generate(v14);

  long long v16 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
  long long v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "queryMessagesWithChatIdentifiers", (const char *)&unk_22C1E071B, buf, 2u);
  }

  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  v28 = sub_22C1D5C98;
  id v29 = &unk_264912488;
  os_signpost_id_t v31 = v15;
  id v18 = v13;
  id v30 = v18;
  uint64_t v19 = (void *)MEMORY[0x230F62A80](&v26);
  if (IMOSLoggingEnabled())
  {
    id v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      id v33 = v12;
      __int16 v34 = 2112;
      id v35 = v11;
      __int16 v36 = 1024;
      BOOL v37 = v9;
      __int16 v38 = 2048;
      int64_t v39 = a6;
      _os_log_impl(&dword_22C1AD000, v20, OS_LOG_TYPE_INFO, "Calling IMSPIQueryMessagesWithChatIdentifiers services: %@, chatIdentifiers: %@, onlyUnread: %d, limit: %ld", buf, 0x26u);
    }
  }
  id v21 = +[IMAssistantMessageQueryHandler IMAssistantIMSPIQueue];
  char v22 = IMSPIQueryMessagesWithChatIdentifiersAndQOS();

  if ((v22 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      id v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C1AD000, v23, OS_LOG_TYPE_INFO, "IMSPIQueryMessagesWithChatIdentifiers failed", buf, 2u);
      }
    }
    id v24 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
    v25 = v24;
    if (v15 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22C1AD000, v25, OS_SIGNPOST_INTERVAL_END, v15, "queryMessagesWithChatIdentifiers", (const char *)&unk_22C1E071B, buf, 2u);
    }

    (*((void (**)(id, void))v18 + 2))(v18, 0);
  }
}

- (void)handlesAndServicesForPersons:(id)a3 handles:(id *)a4 services:(id *)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = sub_22C1D603C;
  v41[3] = &unk_264912BD0;
  id v25 = v7;
  id v42 = v25;
  id v8 = (void (**)(void, void))MEMORY[0x230F62A80](v41);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v38;
    uint64_t v28 = *(void *)v38;
    do
    {
      uint64_t v12 = 0;
      uint64_t v29 = v10;
      do
      {
        if (*(void *)v38 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v37 + 1) + 8 * v12);
        uint64_t v14 = objc_msgSend(v13, "__im_assistant_allContactIdentifiers");
        os_signpost_id_t v15 = [v13 personHandle];
        long long v16 = [v15 value];

        if ([v14 count])
        {
          long long v35 = 0u;
          long long v36 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          id v17 = v14;
          uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v43 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            os_signpost_id_t v31 = v16;
            long long v32 = v14;
            uint64_t v20 = *(void *)v34;
            do
            {
              for (uint64_t i = 0; i != v19; ++i)
              {
                if (*(void *)v34 != v20) {
                  objc_enumerationMutation(v17);
                }
                char v22 = [(IMAssistantMessageHandler *)self contactWithIdentifier:*(void *)(*((void *)&v33 + 1) + 8 * i)];
                id v23 = objc_msgSend(v22, "__im_assistant_allIMHandles");
                ((void (**)(void, void *))v8)[2](v8, v23);
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:&v33 objects:v43 count:16];
            }
            while (v19);
            uint64_t v11 = v28;
            uint64_t v10 = v29;
            long long v16 = v31;
            uint64_t v14 = v32;
          }
        }
        else
        {
          if (![v16 length]) {
            goto LABEL_18;
          }
          id v17 = [(IMAssistantMessageQueryHandler *)self allIMHandlesForHandle:v16];
          ((void (**)(void, id))v8)[2](v8, v17);
        }

LABEL_18:
        ++v12;
      }
      while (v12 != v10);
      uint64_t v10 = [obj countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v10);
  }

  id v24 = [v25 array];
  [(IMAssistantMessageQueryHandler *)self handlesAndServicesForChatGuids:v24 handles:a4 services:a5];
}

- (void)handlesAndServicesForChatGuids:(id)a3 handles:(id *)a4 services:(id *)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        IMComponentsFromChatGUID();
        id v13 = 0;
        id v14 = 0;
        if ([v13 length] && objc_msgSend(v14, "length"))
        {
          [v6 addObject:v13];
          [v7 addObject:v14];
        }
        else if (IMOSLoggingEnabled())
        {
          os_signpost_id_t v15 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v23 = v12;
            _os_log_impl(&dword_22C1AD000, v15, OS_LOG_TYPE_INFO, "Could not parse identifier or service from chat GUID: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v9);
  }

  if (a4) {
    *a4 = (id)[v6 copy];
  }
  if (a5) {
    *a5 = (id)[v7 copy];
  }
}

- (void)SPIQueryMessagesForSenders:(id)a3 onlyUnread:(BOOL)a4 limit:(int64_t)a5 completion:(id)a6
{
  BOOL v8 = a4;
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  id v30 = 0;
  id v31 = 0;
  [(IMAssistantMessageQueryHandler *)self handlesAndServicesForPersons:v10 handles:&v31 services:&v30];
  id v12 = v31;
  id v13 = v30;
  if (IMOSLoggingEnabled())
  {
    id v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      id v33 = v12;
      __int16 v34 = 2112;
      id v35 = v13;
      __int16 v36 = 1024;
      BOOL v37 = v8;
      __int16 v38 = 2048;
      int64_t v39 = a5;
      _os_log_impl(&dword_22C1AD000, v14, OS_LOG_TYPE_INFO, "Performing query for messages from handles: %@ services: %@ onlyUnread: %d, limit: %ld", buf, 0x26u);
    }
  }
  os_signpost_id_t v15 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
  os_signpost_id_t v16 = os_signpost_id_generate(v15);

  id v17 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
  long long v18 = v17;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "queryMessagesWithIDs", (const char *)&unk_22C1E071B, buf, 2u);
  }

  uint64_t v24 = MEMORY[0x263EF8330];
  uint64_t v25 = 3221225472;
  uint64_t v26 = sub_22C1D6844;
  uint64_t v27 = &unk_264912488;
  os_signpost_id_t v29 = v16;
  id v19 = v11;
  id v28 = v19;
  long long v20 = (void (**)(void, void))MEMORY[0x230F62A80](&v24);
  long long v21 = +[IMAssistantMessageQueryHandler IMAssistantIMSPIQueue];
  char v22 = IMSPIQueryMessagesWithIDsWithOnlyUnreadAndQOS();

  if ((v22 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C1AD000, v23, OS_LOG_TYPE_INFO, "IMSPIQueryMessagesWithIDsWithOnlyUnread failed", buf, 2u);
      }
    }
    v20[2](v20, 0);
  }
}

- (void)SPIQueryUnreadMessages:(int64_t)a3 completion:(id)a4
{
  id v4 = a4;
  id v5 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  id v7 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
  BOOL v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "queryUnreadMessages", (const char *)&unk_22C1E071B, buf, 2u);
  }

  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  os_signpost_id_t v16 = sub_22C1D6AC8;
  id v17 = &unk_264912488;
  os_signpost_id_t v19 = v6;
  id v9 = v4;
  id v18 = v9;
  id v10 = (void (**)(void, void))MEMORY[0x230F62A80](&v14);
  id v11 = +[IMAssistantMessageQueryHandler IMAssistantIMSPIQueue];
  char v12 = IMSPIQueryUnreadMessagesWithQOS();

  if ((v12 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      id v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C1AD000, v13, OS_LOG_TYPE_INFO, "IMSPIQueryUnreadMessages failed", buf, 2u);
      }
    }
    v10[2](v10, 0);
  }
}

- (void)SPIQueryMessagesWithGUIDs:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  id v9 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "queryMessagesWithGUIDs", (const char *)&unk_22C1E071B, buf, 2u);
  }

  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  id v18 = sub_22C1D6D5C;
  os_signpost_id_t v19 = &unk_264912488;
  os_signpost_id_t v21 = v8;
  id v11 = v6;
  id v20 = v11;
  char v12 = (void (**)(void, void))MEMORY[0x230F62A80](&v16);
  id v13 = +[IMAssistantMessageQueryHandler IMAssistantIMSPIQueue];
  char v14 = IMSPIQueryMessagesWithGUIDsAndQOS();

  if ((v14 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C1AD000, v15, OS_LOG_TYPE_INFO, "IMSPIQueryMessagesWithGUIDs failed", buf, 2u);
      }
    }
    v12[2](v12, 0);
  }
}

- (void)SPIQueryMessagesWithRowIDs:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  id v9 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "queryMessagesWithRowIDs", (const char *)&unk_22C1E071B, buf, 2u);
  }

  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  id v18 = sub_22C1D6FF0;
  os_signpost_id_t v19 = &unk_264912488;
  os_signpost_id_t v21 = v8;
  id v11 = v6;
  id v20 = v11;
  char v12 = (void (**)(void, void))MEMORY[0x230F62A80](&v16);
  id v13 = +[IMAssistantMessageQueryHandler IMAssistantIMSPIQueue];
  char v14 = IMSPIQueryMessagesWithRowIDsAndQOS();

  if ((v14 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C1AD000, v15, OS_LOG_TYPE_INFO, "IMSPIQueryMessagesWithRowIDs failed", buf, 2u);
      }
    }
    v12[2](v12, 0);
  }
}

- (id)recipientsPredicate:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          char v12 = [(IMAssistantMessageQueryHandler *)self unifiedContactIdentifiersForPerson:v11];
          [v5 setObject:v12 forKey:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v8);
    }

    id v13 = (void *)MEMORY[0x263F08A98];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = sub_22C1D7284;
    v17[3] = &unk_264912BF8;
    id v18 = v6;
    id v19 = v5;
    id v14 = v5;
    uint64_t v15 = [v13 predicateWithBlock:v17];
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (id)sendersPredicate:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          char v12 = [(IMAssistantMessageQueryHandler *)self unifiedContactIdentifiersForPerson:v11];
          [v5 setObject:v12 forKey:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v8);
    }

    id v13 = (void *)MEMORY[0x263F08A98];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = sub_22C1D764C;
    v17[3] = &unk_264912C20;
    id v18 = v6;
    id v19 = v5;
    id v14 = v5;
    uint64_t v15 = [v13 predicateWithBlock:v17];
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (id)spokenPhrasesForSpeakableStrings:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        char v12 = objc_msgSend(v11, "spokenPhrase", (void)v17);
        if ([v12 length]) {
          [v5 addObject:v12];
        }
        id v13 = [v11 alternativeSpeakableMatches];
        if ([v13 count])
        {
          id v14 = [(IMAssistantMessageQueryHandler *)self spokenPhrasesForSpeakableStrings:v13];
          [v5 addObjectsFromArray:v14];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  uint64_t v15 = [v5 array];

  return v15;
}

- (id)vocabularyIdentifiersFromSpeakableStrings:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        char v12 = objc_msgSend(v11, "vocabularyIdentifier", (void)v17);
        if ([v12 length]) {
          [v5 addObject:v12];
        }
        id v13 = [v11 alternativeSpeakableMatches];
        if ([v13 count])
        {
          id v14 = [(IMAssistantMessageQueryHandler *)self vocabularyIdentifiersFromSpeakableStrings:v13];
          [v5 addObjectsFromArray:v14];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  uint64_t v15 = [v5 array];

  return v15;
}

- (id)messageContentsPredicate:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = [MEMORY[0x263F089D8] string];
    id v5 = [MEMORY[0x263EFF980] array];
    if ([v3 count])
    {
      unint64_t v6 = 0;
      do
      {
        if (v6) {
          [v4 appendString:@" AND "];
        }
        [v4 appendString:@"self LIKE[cd] %@"];
        uint64_t v7 = NSString;
        uint64_t v8 = [v3 objectAtIndexedSubscript:v6];
        uint64_t v9 = [v7 stringWithFormat:@"*%@*", v8];
        [v5 addObject:v9];

        ++v6;
      }
      while (v6 < [v3 count]);
    }
    id v10 = (void *)MEMORY[0x263F08A98];
    uint64_t v11 = (void *)[v4 copy];
    char v12 = [v10 predicateWithFormat:v11 argumentArray:v5];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)chatParticipantForSPIHandle:(id)a3
{
  id v4 = a3;
  id v5 = [(IMAssistantMessageHandler *)self contactIdentifiersMatchingSPIHandle:v4];
  unint64_t v6 = [IMAssistantMessageSearchChatParticipant alloc];
  uint64_t v7 = [v4 address];
  uint64_t v8 = [v4 isMe];

  uint64_t v9 = [(IMAssistantMessageSearchChatParticipant *)v6 initWithHandle:v7 contactIdentifiers:v5 isMe:v8];

  return v9;
}

- (id)chatParticipantsForSPIHandles:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = -[IMAssistantMessageQueryHandler chatParticipantForSPIHandle:](self, "chatParticipantForSPIHandle:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  char v12 = (void *)[v5 copy];

  return v12;
}

- (id)unifiedContactIdentifiersForPerson:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend(a3, "__im_assistant_allContactIdentifiers");
  id v5 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = -[IMAssistantMessageHandler unifiedContactIdentifierForContactIdentifier:](self, "unifiedContactIdentifierForContactIdentifier:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        if ([v11 length]) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  char v12 = [v5 array];

  return v12;
}

- (id)chatsContainingRequiredParticipants:(id)a3
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v51 = self;
  id v5 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
  id v6 = [v5 chatDataSource];
  uint64_t v7 = [v6 allExistingChats];

  id v44 = [MEMORY[0x263EFF980] array];
  v53 = objc_msgSend(objc_alloc(MEMORY[0x263F08968]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, objc_msgSend(v4, "count"));
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id obj = v4;
  uint64_t v8 = [obj countByEnumeratingWithState:&v72 objects:v84 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v73;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v73 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v72 + 1) + 8 * i);
        char v12 = [(IMAssistantMessageQueryHandler *)v51 unifiedContactIdentifiersForPerson:v11];
        [v53 setObject:v12 forKey:v11];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v72 objects:v84 count:16];
    }
    while (v8);
  }

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v45 = v7;
  uint64_t v47 = [v45 countByEnumeratingWithState:&v68 objects:v83 count:16];
  if (v47)
  {
    uint64_t v46 = *(void *)v69;
    *(void *)&long long v13 = 138412290;
    long long v43 = v13;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v69 != v46)
        {
          uint64_t v15 = v14;
          objc_enumerationMutation(v45);
          uint64_t v14 = v15;
        }
        uint64_t v48 = v14;
        v50 = *(void **)(*((void *)&v68 + 1) + 8 * v14);
        long long v16 = [(IMAssistantMessageHandler *)v51 contactIdentifiersForParticipantsInChat:v43];
        long long v17 = [v50 participantsWithState:16];
        v52 = objc_msgSend(v17, "__imArrayByApplyingBlock:", &unk_26DF9B818);

        id v18 = objc_alloc_init(MEMORY[0x263EFF9B0]);
        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        id v19 = v16;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v64 objects:v82 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v65;
          do
          {
            for (uint64_t j = 0; j != v20; ++j)
            {
              if (*(void *)v65 != v21) {
                objc_enumerationMutation(v19);
              }
              [v18 addObjectsFromArray:*(void *)(*((void *)&v64 + 1) + 8 * j)];
            }
            uint64_t v20 = [v19 countByEnumeratingWithState:&v64 objects:v82 count:16];
          }
          while (v20);
        }

        long long v62 = 0u;
        long long v63 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        id v54 = obj;
        uint64_t v23 = [v54 countByEnumeratingWithState:&v60 objects:v81 count:16];
        if (v23)
        {
          uint64_t v55 = *(void *)v61;
          while (2)
          {
            for (uint64_t k = 0; k != v23; ++k)
            {
              if (*(void *)v61 != v55) {
                objc_enumerationMutation(v54);
              }
              uint64_t v25 = *(void **)(*((void *)&v60 + 1) + 8 * k);
              if (([v25 isMe] & 1) == 0)
              {
                uint64_t v26 = [v53 objectForKey:v25];
                if ([v26 count])
                {
                  long long v58 = 0u;
                  long long v59 = 0u;
                  long long v56 = 0u;
                  long long v57 = 0u;
                  id v27 = v26;
                  uint64_t v28 = [v27 countByEnumeratingWithState:&v56 objects:v80 count:16];
                  if (v28)
                  {
                    uint64_t v29 = *(void *)v57;
                    while (2)
                    {
                      for (uint64_t m = 0; m != v28; ++m)
                      {
                        if (*(void *)v57 != v29) {
                          objc_enumerationMutation(v27);
                        }
                        if ([v18 containsObject:*(void *)(*((void *)&v56 + 1) + 8 * m)])
                        {

                          goto LABEL_48;
                        }
                      }
                      uint64_t v28 = [v27 countByEnumeratingWithState:&v56 objects:v80 count:16];
                      if (v28) {
                        continue;
                      }
                      break;
                    }
                  }
                }
                id v31 = [v25 personHandle];
                long long v32 = [v31 value];
                BOOL v33 = [v32 length] == 0;

                if (v33) {
                  goto LABEL_51;
                }
                __int16 v34 = [v25 personHandle];
                id v35 = [v34 value];
                if (MEMORY[0x230F62610]() || IMStringIsEmail())
                {
                  IMCanonicalizeFormattedString();
                  id v36 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  if (!MEMORY[0x230F625F0](v35) && IMOSLoggingEnabled())
                  {
                    BOOL v37 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = v43;
                      uint64_t v77 = (uint64_t)v35;
                      _os_log_impl(&dword_22C1AD000, v37, OS_LOG_TYPE_INFO, "Could not canonicalize handle \"%@\" because it is neither a phone number nor an email address.", buf, 0xCu);
                    }
                  }
                  id v36 = v35;
                }
                __int16 v38 = v36;

                char v39 = [v52 containsObject:v38];
                if ((v39 & 1) == 0)
                {
LABEL_51:

                  goto LABEL_52;
                }
              }
LABEL_48:
              ;
            }
            uint64_t v23 = [v54 countByEnumeratingWithState:&v60 objects:v81 count:16];
            if (v23) {
              continue;
            }
            break;
          }
        }

        [v44 addObject:v50];
LABEL_52:

        uint64_t v14 = v48 + 1;
      }
      while (v48 + 1 != v47);
      uint64_t v47 = [v45 countByEnumeratingWithState:&v68 objects:v83 count:16];
    }
    while (v47);
  }

  if (IMOSLoggingEnabled())
  {
    uint64_t v40 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      uint64_t v41 = [v44 count];
      *(_DWORD *)buf = 134218242;
      uint64_t v77 = v41;
      __int16 v78 = 2112;
      id v79 = v44;
      _os_log_impl(&dword_22C1AD000, v40, OS_LOG_TYPE_INFO, "Found %ld chats matching participants. Chats: %@", buf, 0x16u);
    }
  }

  return v44;
}

- (id)chatsWithConversationIdentifiers:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v6 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
  uint64_t v7 = [v6 chatDataSource];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v9)
  {
    uint64_t v11 = *(void *)v23;
    *(void *)&long long v10 = 138412546;
    long long v21 = v10;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v14 = IMAssistantChatIdentifierFromConversationIdentifier(v13);
        uint64_t v15 = [v7 existingChatWithChatIdentifier:v14];
        int v16 = IMOSLoggingEnabled();
        if (v15)
        {
          if (v16)
          {
            long long v17 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v21;
              id v27 = v13;
              __int16 v28 = 2112;
              uint64_t v29 = v14;
              _os_log_impl(&dword_22C1AD000, v17, OS_LOG_TYPE_INFO, "Found exsting chat matching conversationIdentifier: %@ chatIdentifier: %@", buf, 0x16u);
            }
          }
          objc_msgSend(v5, "addObject:", v15, v21, (void)v22);
        }
        else if (v16)
        {
          id v18 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v21;
            id v27 = v13;
            __int16 v28 = 2112;
            uint64_t v29 = v14;
            _os_log_impl(&dword_22C1AD000, v18, OS_LOG_TYPE_INFO, "Could not find chat matching conversationIdentifier: %@ chatIdentifier: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v9);
  }

  id v19 = (void *)[v5 copy];

  return v19;
}

- (id)chatsForChatNames:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF9B0]);
    id v22 = v4;
    long long v23 = [(IMAssistantMessageQueryHandler *)self vocabularyIdentifiersFromSpeakableStrings:v4];
    id v6 = objc_msgSend(v23, "__imArrayByApplyingBlock:", &unk_26DF9B838);
    uint64_t v7 = [(IMAssistantMessageQueryHandler *)self spokenPhrasesForSpeakableStrings:v4];
    id v8 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
    uint64_t v9 = [v8 chatDataSource];
    long long v10 = [v9 allExistingChats];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v36 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          int v16 = [v15 chatIdentifier];
          long long v17 = [v15 displayName];
          if ([v16 length] && (objc_msgSend(v6, "containsObject:", v16) & 1) != 0
            || [v17 length] && objc_msgSend(v7, "containsObject:", v17))
          {
            [v5 addObject:v15];
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v36 count:16];
      }
      while (v12);
    }

    if (IMOSLoggingEnabled())
    {
      id v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        uint64_t v19 = [v5 count];
        *(_DWORD *)buf = 134218754;
        uint64_t v29 = v19;
        __int16 v30 = 2112;
        uint64_t v31 = v7;
        __int16 v32 = 2112;
        BOOL v33 = v23;
        __int16 v34 = 2112;
        id v35 = v5;
        _os_log_impl(&dword_22C1AD000, v18, OS_LOG_TYPE_INFO, "Found %ld chats matching chat names:%@ vocabularyIdentifiers:%@ chats:%@", buf, 0x2Au);
      }
    }
    uint64_t v20 = [v5 array];

    id v4 = v22;
  }
  else
  {
    uint64_t v20 = (void *)MEMORY[0x263EFFA68];
  }

  return v20;
}

- (void)searchMessagesWithContents:(id)a3 messageIdentifiers:(id)a4 notificationIdentifiers:(id)a5 chatNames:(id)a6 conversationIdentifiers:(id)a7 recipients:(id)a8 senders:(id)a9 dateTimeRange:(id)a10 attributes:(unint64_t)a11 completion:(id)a12
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  id v69 = a3;
  id v72 = a4;
  id v68 = a5;
  long long v65 = (__CFString *)a6;
  long long v64 = (__CFString *)a7;
  id v71 = a8;
  id v70 = a9;
  id v73 = a10;
  id v60 = a12;
  unsigned int v66 = ((a11 & 1) == 0) & (a11 >> 1);
  if (IMOSLoggingEnabled())
  {
    id v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = @"NO";
      if (v66) {
        uint64_t v20 = @"YES";
      }
      else {
        uint64_t v20 = @"NO";
      }
      if ((a11 & ((a11 & 2) == 0)) != 0) {
        uint64_t v19 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      v89 = v20;
      __int16 v90 = 2112;
      v91 = v19;
      _os_log_impl(&dword_22C1AD000, v18, OS_LOG_TYPE_INFO, "Searching for messages with attributes onlyUnreadMessages: %@ | onlyReadMessages %@", buf, 0x16u);
    }
  }
  long long v21 = objc_msgSend(v73, "startDateComponents", v60);
  *(void *)&long long v74 = [v21 date];

  id v22 = [v73 endDateComponents];
  *((void *)&v74 + 1) = [v22 date];

  if (v74 == 0)
  {
    long long v25 = 0;
    long long v74 = 0uLL;
  }
  else
  {
    if (!(void)v74)
    {
      *(void *)&long long v74 = [MEMORY[0x263EFF910] distantPast];
      if (IMOSLoggingEnabled())
      {
        long long v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22C1AD000, v23, OS_LOG_TYPE_INFO, "No start date specified for date filtering, using open ended start date.", buf, 2u);
        }
      }
    }
    if (!*((void *)&v74 + 1))
    {
      *((void *)&v74 + 1) = [MEMORY[0x263EFF910] distantFuture];
      if (IMOSLoggingEnabled())
      {
        long long v24 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22C1AD000, v24, OS_LOG_TYPE_INFO, "No end date specified for date filtering, using open ended end date.", buf, 2u);
        }
      }
    }
    long long v25 = objc_msgSend(objc_alloc(MEMORY[0x263F08798]), "initWithStartDate:endDate:", v74);
    if (IMOSLoggingEnabled())
    {
      long long v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v89 = (__CFString *)v74;
        __int16 v90 = 2112;
        v91 = (__CFString *)*((void *)&v74 + 1);
        _os_log_impl(&dword_22C1AD000, v26, OS_LOG_TYPE_INFO, "Filtering the search results to date time interval: [%@, %@]", buf, 0x16u);
      }
    }
  }
  long long v27 = [(IMAssistantMessageQueryHandler *)self messageContentsPredicate:v69];
  __int16 v28 = [(IMAssistantMessageQueryHandler *)self recipientsPredicate:v71];
  uint64_t v29 = [(IMAssistantMessageQueryHandler *)self sendersPredicate:v70];
  __int16 v30 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
  if ([v30 isInternationalSpamFilteringEnabled])
  {
    uint64_t v31 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
    __int16 v32 = [v31 chatDataSource];
    char v33 = [v32 blackholedChatsExist];
  }
  else
  {
    char v33 = 0;
  }

  v80[0] = MEMORY[0x263EF8330];
  v80[1] = 3221225472;
  v80[2] = sub_22C1D9AAC;
  v80[3] = &unk_264912C88;
  char v85 = v33;
  v80[4] = self;
  id v34 = v25;
  id v81 = v34;
  char v86 = ((a11 & 1) == 0) & (a11 >> 1);
  char v87 = a11 & ((a11 & 2) == 0);
  id v35 = v27;
  id v82 = v35;
  id v36 = v29;
  id v83 = v36;
  id v37 = v28;
  id v84 = v37;
  __int16 v38 = (void *)MEMORY[0x230F62A80](v80);
  v79[0] = MEMORY[0x263EF8330];
  v79[1] = 3221225472;
  v79[2] = sub_22C1DA858;
  v79[3] = &unk_264912CB0;
  v79[4] = self;
  char v39 = (void *)MEMORY[0x230F62A80](v79);
  v75[0] = MEMORY[0x263EF8330];
  v75[1] = 3221225472;
  v75[2] = sub_22C1DAB94;
  v75[3] = &unk_264912CD8;
  id v40 = v38;
  id v76 = v40;
  id v41 = v39;
  id v77 = v41;
  id v42 = v61;
  id v78 = v42;
  long long v43 = (void *)MEMORY[0x230F62A80](v75);
  if (v72)
  {
    if (IMOSLoggingEnabled())
    {
      id v44 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C1AD000, v44, OS_LOG_TYPE_INFO, "Performing search via message identifiers search, then filter.", buf, 2u);
      }
    }
    [(IMAssistantMessageQueryHandler *)self messagesMatchingMessageIdentifiers:v72 completion:v43];
    goto LABEL_85;
  }
  if ([v68 count])
  {
    if (IMOSLoggingEnabled())
    {
      id v45 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C1AD000, v45, OS_LOG_TYPE_INFO, "Performing search for messages matching the notification identifiers, then filter.", buf, 2u);
      }
    }
    [(IMAssistantMessageQueryHandler *)self messagesMatchingMessageIdentifiers:v68 completion:v43];
    goto LABEL_85;
  }
  if ([(__CFString *)v65 count])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v46 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C1AD000, v46, OS_LOG_TYPE_INFO, "Performing search via chat name search, then filter.", buf, 2u);
      }
    }
    uint64_t v47 = [(IMAssistantMessageQueryHandler *)self chatsForChatNames:v65];
    if ([v47 count])
    {
LABEL_47:
      -[IMAssistantMessageQueryHandler SPIQueryMessagesForChats:onlyUnread:limit:completion:](self, "SPIQueryMessagesForChats:onlyUnread:limit:completion:", v47, v66, 10 * [v47 count], v43);
LABEL_60:

      goto LABEL_85;
    }
    if (IMOSLoggingEnabled())
    {
      v49 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v89 = v65;
        _os_log_impl(&dword_22C1AD000, v49, OS_LOG_TYPE_INFO, "Failed to find any chats matching chatNames: %@", buf, 0xCu);
      }
    }
LABEL_59:
    (*((void (**)(id, void))v42 + 2))(v42, 0);
    goto LABEL_60;
  }
  if ([(__CFString *)v64 count])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v48 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C1AD000, v48, OS_LOG_TYPE_INFO, "Performing search via chat search, then filter.", buf, 2u);
      }
    }
    uint64_t v47 = [(IMAssistantMessageQueryHandler *)self chatsWithConversationIdentifiers:v64];
    if ([v47 count]) {
      goto LABEL_47;
    }
    if (IMOSLoggingEnabled())
    {
      v52 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v89 = v64;
        _os_log_impl(&dword_22C1AD000, v52, OS_LOG_TYPE_INFO, "Failed to find any chats matching conversation identifiers: %@", buf, 0xCu);
      }
    }
    goto LABEL_59;
  }
  if ([v71 count])
  {
    if (IMOSLoggingEnabled())
    {
      v50 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C1AD000, v50, OS_LOG_TYPE_INFO, "Performing search via recipients search, then filter.", buf, 2u);
      }
    }
    long long v62 = (__CFString *)objc_alloc_init(MEMORY[0x263EFF980]);
    [(__CFString *)v62 addObjectsFromArray:v71];
    [(__CFString *)v62 addObjectsFromArray:v70];
    v51 = [(IMAssistantMessageQueryHandler *)self chatsContainingRequiredParticipants:v62];
    if ([v51 count])
    {
      -[IMAssistantMessageQueryHandler SPIQueryMessagesForChats:onlyUnread:limit:completion:](self, "SPIQueryMessagesForChats:onlyUnread:limit:completion:", v51, v66, 10 * [v51 count], v43);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        long long v56 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v89 = v62;
          _os_log_impl(&dword_22C1AD000, v56, OS_LOG_TYPE_INFO, "Failed to find chats containing all specified persons (recipients + senders) during search: %@", buf, 0xCu);
        }
      }
      (*((void (**)(id, void))v42 + 2))(v42, 0);
    }
  }
  else
  {
    BOOL v53 = [v70 count] == 0;
    int v54 = IMOSLoggingEnabled();
    if (v53)
    {
      if (v66)
      {
        if (v54)
        {
          long long v57 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22C1AD000, v57, OS_LOG_TYPE_INFO, "Performing search via unread search, then filter.", buf, 2u);
          }
        }
        [(IMAssistantMessageQueryHandler *)self SPIQueryUnreadMessages:50 completion:v43];
      }
      else
      {
        if (v54)
        {
          long long v58 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22C1AD000, v58, OS_LOG_TYPE_INFO, "Performing search via examining all chats, then filter.", buf, 2u);
          }
        }
        long long v67 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
        long long v59 = [v67 chatDataSource];
        long long v63 = [v59 allExistingChats];

        [(IMAssistantMessageQueryHandler *)self SPIQueryMessagesForChats:v63 onlyUnread:0 limit:10 completion:v43];
      }
    }
    else
    {
      if (v54)
      {
        uint64_t v55 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22C1AD000, v55, OS_LOG_TYPE_INFO, "Performing search via senders search, then filter.", buf, 2u);
        }
      }
      -[IMAssistantMessageQueryHandler SPIQueryMessagesForSenders:onlyUnread:limit:completion:](self, "SPIQueryMessagesForSenders:onlyUnread:limit:completion:", v70, v66, 10 * [v70 count], v43);
    }
  }
LABEL_85:
}

- (BOOL)messageIsFromBlackholedChat:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 chatIdentifier];
  id v6 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
  uint64_t v7 = [v6 chatDataSource];
  id v8 = [v7 existingChatWithChatIdentifier:v5];

  if (v8)
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      long long v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v16 = 138412290;
        id v17 = v5;
        _os_log_impl(&dword_22C1AD000, v10, OS_LOG_TYPE_INFO, "Could not find chatIdentifier %@ in chat registry, looking up IMSPIChat to determine blackhole status.", (uint8_t *)&v16, 0xCu);
      }
    }
    id v11 = [v4 spiChatWithQOS:25];
    int v9 = [v11 isBlackholed];
    if (IMOSLoggingEnabled())
    {
      uint64_t v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v13 = [v4 guid];
        uint64_t v14 = [v11 guid];
        int v16 = 138412802;
        id v17 = v13;
        __int16 v18 = 2112;
        uint64_t v19 = v14;
        __int16 v20 = 1024;
        int v21 = v9;
        _os_log_impl(&dword_22C1AD000, v12, OS_LOG_TYPE_INFO, "Determined message %@ from chat %@ isBlackholed=%d", (uint8_t *)&v16, 0x1Cu);
      }
    }
  }
  return v9;
}

- (void)messagesMatchingMessageIdentifiers:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 firstObject];
  int v9 = [v8 hasPrefix:@"x-apple-sms:guid="];

  int v10 = IMOSLoggingEnabled();
  if (v9)
  {
    if (v10)
    {
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v14 = 134217984;
        uint64_t v15 = [v6 count];
        _os_log_impl(&dword_22C1AD000, v11, OS_LOG_TYPE_INFO, "Looking up %ld messages with IMSPIQueryMessagesWithRowIDs", (uint8_t *)&v14, 0xCu);
      }
    }
    uint64_t v12 = objc_msgSend(v6, "__imArrayByApplyingBlock:", &unk_26DF9B858);
    [(IMAssistantMessageQueryHandler *)self SPIQueryMessagesWithRowIDs:v12 completion:v7];
  }
  else
  {
    if (v10)
    {
      id v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v14 = 134217984;
        uint64_t v15 = [v6 count];
        _os_log_impl(&dword_22C1AD000, v13, OS_LOG_TYPE_INFO, "Looking up %ld messages with IMSPIQueryMessagesWithGUIDs", (uint8_t *)&v14, 0xCu);
      }
    }
    [(IMAssistantMessageQueryHandler *)self SPIQueryMessagesWithGUIDs:v6 completion:v7];
  }
}

@end