@interface IMAssistantMessageSearchHandler
- (IMAssistantMessageAttributeSanitizer)attributeSanitizer;
- (IMAssistantMessageSearchHandler)initWithAttributeSanitizer:(id)a3 intentIdentifier:(id)a4;
- (IMAssistantMessageSearchHandler)initWithDataSource:(id)a3 attributeSanitizer:(id)a4 intentIdentifier:(id)a5;
- (IMAssistantMessageSearchHandler)initWithDataSource:(id)a3 intentIdentifier:(id)a4;
- (IMAssistantMessageSearchHandler)initWithIntentIdentifier:(id)a3;
- (id)resolveSpeakableGroupNames:(id)a3 forIntent:(id)a4;
- (void)handleSearchForMessages:(id)a3 completion:(id)a4;
- (void)resolveAttributesForSearchForMessages:(id)a3 withCompletion:(id)a4;
- (void)resolveRecipientsAndSender:(id)a3 withCompletion:(id)a4;
- (void)resolveRecipientsForSearchForMessages:(id)a3 withCompletion:(id)a4;
- (void)resolveSendersForSearchForMessages:(id)a3 withCompletion:(id)a4;
- (void)resolveSpeakableGroupNamesForSearchForMessages:(id)a3 withCompletion:(id)a4;
- (void)setAttributeSanitizer:(id)a3;
@end

@implementation IMAssistantMessageSearchHandler

- (IMAssistantMessageSearchHandler)initWithIntentIdentifier:(id)a3
{
  return (IMAssistantMessageSearchHandler *)MEMORY[0x270F9A6D0](self, sel_initWithAttributeSanitizer_intentIdentifier_);
}

- (IMAssistantMessageSearchHandler)initWithDataSource:(id)a3 intentIdentifier:(id)a4
{
  return (IMAssistantMessageSearchHandler *)MEMORY[0x270F9A6D0](self, sel_initWithDataSource_attributeSanitizer_intentIdentifier_);
}

- (IMAssistantMessageSearchHandler)initWithAttributeSanitizer:(id)a3 intentIdentifier:(id)a4
{
  return (IMAssistantMessageSearchHandler *)MEMORY[0x270F9A6D0](self, sel_initWithDataSource_attributeSanitizer_intentIdentifier_);
}

- (IMAssistantMessageSearchHandler)initWithDataSource:(id)a3 attributeSanitizer:(id)a4 intentIdentifier:(id)a5
{
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IMAssistantMessageSearchHandler;
  v9 = [(IMAssistantMessageHandler *)&v13 initWithDataSource:a3 intentIdentifier:a5];
  if (v9)
  {
    if (v8) {
      v10 = (IMAssistantMessageReadAttributeSanitizer *)v8;
    }
    else {
      v10 = objc_alloc_init(IMAssistantMessageReadAttributeSanitizer);
    }
    attributeSanitizer = v9->_attributeSanitizer;
    v9->_attributeSanitizer = (IMAssistantMessageAttributeSanitizer *)v10;
  }
  return v9;
}

- (void)resolveRecipientsForSearchForMessages:(id)a3 withCompletion:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  v10 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "resolveRecipientsForSearchForMessages", (const char *)&unk_22C1E071B, buf, 2u);
  }

  if (IMOSLoggingEnabled())
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v6;
      _os_log_impl(&dword_22C1AD000, v12, OS_LOG_TYPE_INFO, "resolveRecipients called with intent: %@", buf, 0xCu);
    }
  }
  objc_super v13 = [v6 recipients];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_22C1C55F0;
  v15[3] = &unk_2649128C8;
  id v16 = v7;
  os_signpost_id_t v17 = v9;
  id v14 = v7;
  [(IMAssistantMessageQueryHandler *)self resolvePersons:v13 forIntent:v6 completionHandler:v15];
}

- (void)resolveSendersForSearchForMessages:(id)a3 withCompletion:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  v10 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "resolveSendersForSearchForMessages", (const char *)&unk_22C1E071B, buf, 2u);
  }

  if (IMOSLoggingEnabled())
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v6;
      _os_log_impl(&dword_22C1AD000, v12, OS_LOG_TYPE_INFO, "resolveSenders called with intent: %@", buf, 0xCu);
    }
  }
  objc_super v13 = [v6 senders];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_22C1C5944;
  v15[3] = &unk_2649128C8;
  id v16 = v7;
  os_signpost_id_t v17 = v9;
  id v14 = v7;
  [(IMAssistantMessageQueryHandler *)self resolvePersons:v13 forIntent:v6 completionHandler:v15];
}

- (void)resolveAttributesForSearchForMessages:(id)a3 withCompletion:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  v10 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(v26) = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "resolveAttributesForSearchForMessages", (const char *)&unk_22C1E071B, (uint8_t *)&v26, 2u);
  }

  if (IMOSLoggingEnabled())
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v26 = 138412290;
      id v27 = v6;
      _os_log_impl(&dword_22C1AD000, v12, OS_LOG_TYPE_INFO, "resolveAttributes called with intent: %@", (uint8_t *)&v26, 0xCu);
    }
  }
  uint64_t v13 = [v6 attributes];
  id v14 = [(IMAssistantMessageSearchHandler *)self attributeSanitizer];
  v15 = +[IMAssistantMessageAttributeOptions optionsWithAttributes:v13 sanitizer:v14];

  if ([v15 includeRead])
  {
    id v16 = [v6 identifiers];
    BOOL v17 = [v16 count] == 0;

    if (v17 && IMOSLoggingEnabled())
    {
      v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        int v26 = 138412290;
        id v27 = v6;
        _os_log_impl(&dword_22C1AD000, v18, OS_LOG_TYPE_INFO, "intent with read options lacks message identifiers: %@", (uint8_t *)&v26, 0xCu);
      }
    }
    id v19 = [v6 dateTimeRange];
    BOOL v20 = v19 == 0;

    if (v20 && IMOSLoggingEnabled())
    {
      v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        int v26 = 138412290;
        id v27 = v6;
        _os_log_impl(&dword_22C1AD000, v21, OS_LOG_TYPE_INFO, "intent with read options lacks dateTimeRange: %@", (uint8_t *)&v26, 0xCu);
      }
    }
  }
  v22 = objc_msgSend(MEMORY[0x263F0FC70], "successWithResolvedMessageAttributeOptions:", objc_msgSend(v15, "attributes"));
  if (IMOSLoggingEnabled())
  {
    v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      int v26 = 138412290;
      id v27 = v22;
      _os_log_impl(&dword_22C1AD000, v23, OS_LOG_TYPE_INFO, "Calling resolveAttributes completion handler with result: %@", (uint8_t *)&v26, 0xCu);
    }
  }
  v24 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
  v25 = v24;
  if (v9 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v24))
  {
    LOWORD(v26) = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v25, OS_SIGNPOST_INTERVAL_END, v9, "resolveAttributesForSearchForMessages", (const char *)&unk_22C1E071B, (uint8_t *)&v26, 2u);
  }

  v7[2](v7, v22);
}

- (void)resolveSpeakableGroupNamesForSearchForMessages:(id)a3 withCompletion:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  v10 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "resolveSpeakableGroupNamesForSearchForMessages", (const char *)&unk_22C1E071B, buf, 2u);
  }

  if (IMOSLoggingEnabled())
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v6;
      _os_log_impl(&dword_22C1AD000, v12, OS_LOG_TYPE_INFO, "resolveSpeakableGroupNames called with intent: %@", buf, 0xCu);
    }
  }
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = sub_22C1C622C;
  v23[3] = &unk_2649128F0;
  v23[4] = self;
  id v13 = v6;
  id v24 = v13;
  os_signpost_id_t v26 = v9;
  id v14 = v7;
  id v25 = v14;
  v15 = (void (**)(void))MEMORY[0x230F62A80](v23);
  id v16 = [v13 speakableGroupNames];
  BOOL v17 = [v16 count] == 0;

  if (v17)
  {
    if (IMOSLoggingEnabled())
    {
      v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C1AD000, v18, OS_LOG_TYPE_INFO, "Calling resolveSpeakableGroupNames completion handler with empty results", buf, 2u);
      }
    }
    id v19 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
    BOOL v20 = v19;
    if (v9 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22C1AD000, v20, OS_SIGNPOST_INTERVAL_END, v9, "resolveSpeakableGroupNamesForSearchForMessages", (const char *)&unk_22C1E071B, buf, 2u);
    }

    (*((void (**)(id, void))v14 + 2))(v14, MEMORY[0x263EFFA68]);
  }
  else if ([MEMORY[0x263F08B88] isMainThread])
  {
    v15[2](v15);
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_22C1C63AC;
    block[3] = &unk_264912918;
    v22 = v15;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

- (void)handleSearchForMessages:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  v10 = _IMAssistantCoreSearchForMessageSignpostLogHandle();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "handleSearchForMessages", (const char *)&unk_22C1E071B, buf, 2u);
  }

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_22C1C658C;
  v17[3] = &unk_2649128F0;
  id v12 = v6;
  id v18 = v12;
  id v19 = self;
  os_signpost_id_t v21 = v9;
  id v13 = v7;
  id v20 = v13;
  id v14 = (void (**)(void))MEMORY[0x230F62A80](v17);
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    v14[2](v14);
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_22C1C6F10;
    block[3] = &unk_264912918;
    id v16 = v14;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

- (void)resolveRecipientsAndSender:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 recipients];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_22C1C7000;
  v11[3] = &unk_264912968;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  [(IMAssistantMessageQueryHandler *)self resolvePersons:v8 forIntent:v10 completionHandler:v11];
}

- (id)resolveSpeakableGroupNames:(id)a3 forIntent:(id)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v33 = a4;
  id v36 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v37 objects:v50 count:16];
  if (v7)
  {
    uint64_t v35 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v38 != v35) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        v49 = v9;
        id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v49 count:1];
        v11 = [(IMAssistantMessageQueryHandler *)self chatsForChatNames:v10];

        if (IMOSLoggingEnabled())
        {
          id v12 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            id v13 = [v9 spokenPhrase];
            id v14 = [v9 vocabularyIdentifier];
            uint64_t v15 = [v11 count];
            *(_DWORD *)buf = 138413058;
            id v42 = v13;
            __int16 v43 = 2112;
            id v44 = v14;
            __int16 v45 = 2048;
            uint64_t v46 = v15;
            __int16 v47 = 2112;
            v48 = v11;
            _os_log_impl(&dword_22C1AD000, v12, OS_LOG_TYPE_INFO, "resolveSpeakableGroupName for name:\"%@\" vocabularyIdentifier:\"%@\" matches %ld chats: %@", buf, 0x2Au);
          }
        }
        if ([v11 count] == 1)
        {
          id v16 = [v11 firstObject];
          BOOL v17 = [v16 displayName];
          id v18 = [v16 chatIdentifier];
          id v19 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
          int v20 = [v19 screentimeAllowedToShowChat:v16 error:0];

          if (v20)
          {
            if ([v17 length])
            {
              id v21 = (id)[objc_alloc(MEMORY[0x263F0FFA0]) initWithVocabularyIdentifier:v18 spokenPhrase:v17 pronunciationHint:0];
              if (IMOSLoggingEnabled())
              {
                v22 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  id v42 = v17;
                  __int16 v43 = 2112;
                  id v44 = v18;
                  _os_log_impl(&dword_22C1AD000, v22, OS_LOG_TYPE_INFO, "Resolve chatName: %@ and vocabularyIdentifier: %@", buf, 0x16u);
                }
              }
            }
            else
            {
              if (IMOSLoggingEnabled())
              {
                v30 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_22C1AD000, v30, OS_LOG_TYPE_INFO, "Chat search by name resolved to a chat without a displayName. Passing through the input name instead.", buf, 2u);
                }
              }
              id v21 = v9;
            }
          }
          else
          {
            if (IMOSLoggingEnabled())
            {
              uint64_t v29 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                id v42 = v17;
                __int16 v43 = 2112;
                id v44 = v18;
                _os_log_impl(&dword_22C1AD000, v29, OS_LOG_TYPE_INFO, "downtime suppressing resolve for chatName: %@ and vocabularyIdentifier: %@", buf, 0x16u);
              }
            }
            id v21 = 0;
          }
          id v28 = [MEMORY[0x263F0FFA8] successWithResolvedString:v21];
        }
        else
        {
          BOOL v23 = (unint64_t)[v11 count] > 1;
          int v24 = IMOSLoggingEnabled();
          if (v23)
          {
            if (v24)
            {
              id v25 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_22C1AD000, v25, OS_LOG_TYPE_INFO, "Using input as resolved value.", buf, 2u);
              }
            }
            uint64_t v26 = [MEMORY[0x263F0FFA8] successWithResolvedString:v9];
          }
          else
          {
            if (v24)
            {
              id v27 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_22C1AD000, v27, OS_LOG_TYPE_INFO, "No matching chats were found, returning unsupported/notFound for resolveSpeakableGroupNames", buf, 2u);
              }
            }
            uint64_t v26 = [MEMORY[0x263F0FFA8] unsupported];
          }
          id v28 = (void *)v26;
        }
        [v36 addObject:v28];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v37 objects:v50 count:16];
    }
    while (v7);
  }

  v31 = (void *)[v36 copy];

  return v31;
}

- (IMAssistantMessageAttributeSanitizer)attributeSanitizer
{
  return self->_attributeSanitizer;
}

- (void)setAttributeSanitizer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end