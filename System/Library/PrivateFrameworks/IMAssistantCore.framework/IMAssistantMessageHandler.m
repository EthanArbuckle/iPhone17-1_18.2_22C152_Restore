@interface IMAssistantMessageHandler
+ (id)connectToIMDaemonController;
- (IMAssistantMessageHandler)initWithDataSource:(id)a3 intentIdentifier:(id)a4;
- (IMAssistantMessageHandler)initWithDataSource:(id)a3 keysToFetch:(id)a4 intentIdentifier:(id)a5;
- (IMAssistantMessageHandler)initWithIntentIdentifier:(id)a3;
- (IMAssistantMessageHandlerDataSource)messageHandlerDataSource;
- (NSArray)keysToFetch;
- (NSString)intentIdentifier;
- (id)_initWithDataSource:(id)a3 contactKeysToFetch:(id)a4 intentIdentifier:(id)a5;
- (id)contactIdentifiersForParticipantsInChat:(id)a3;
- (id)contactIdentifiersMatchingHandle:(id)a3;
- (id)contactIdentifiersMatchingHandleID:(id)a3 handleType:(int64_t)a4;
- (id)contactIdentifiersMatchingINPersonHandle:(id)a3;
- (id)contactIdentifiersMatchingSPIHandle:(id)a3;
- (id)contactPredicateFromHandle:(id)a3 handleType:(int64_t)a4;
- (id)contactWithIdentifier:(id)a3;
- (id)contactsMatchingINPerson:(id)a3;
- (id)contactsMatchingPredicate:(id)a3 forPerson:(id)a4;
- (id)meContactIdentifier;
- (id)personFromSPIHandle:(id)a3;
- (id)unifiedContactIdentifierForContactIdentifier:(id)a3;
- (void)forceTriggerResumeNotification;
- (void)setIntentIdentifier:(id)a3;
- (void)setKeysToFetch:(id)a3;
- (void)setMessageHandlerDataSource:(id)a3;
@end

@implementation IMAssistantMessageHandler

- (IMAssistantMessageHandler)initWithIntentIdentifier:(id)a3
{
  return (IMAssistantMessageHandler *)MEMORY[0x270F9A6D0](self, sel__initWithDataSource_contactKeysToFetch_intentIdentifier_);
}

- (IMAssistantMessageHandler)initWithDataSource:(id)a3 intentIdentifier:(id)a4
{
  return (IMAssistantMessageHandler *)MEMORY[0x270F9A6D0](self, sel__initWithDataSource_contactKeysToFetch_intentIdentifier_);
}

- (IMAssistantMessageHandler)initWithDataSource:(id)a3 keysToFetch:(id)a4 intentIdentifier:(id)a5
{
  return (IMAssistantMessageHandler *)MEMORY[0x270F9A6D0](self, sel__initWithDataSource_contactKeysToFetch_intentIdentifier_);
}

- (id)_initWithDataSource:(id)a3 contactKeysToFetch:(id)a4 intentIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)IMAssistantMessageHandler;
  v11 = [(IMAssistantMessageHandler *)&v17 init];
  if (v11)
  {
    if (v8)
    {
      v12 = (IMAssistantMessageHandlerDataSource *)v8;
    }
    else
    {
      v12 = +[IMAssistantMessageHandlerDefaultDataSource sharedInstance];
    }
    messageHandlerDataSource = v11->_messageHandlerDataSource;
    v11->_messageHandlerDataSource = v12;

    objc_storeStrong((id *)&v11->_keysToFetch, a4);
    uint64_t v14 = [v10 copy];
    intentIdentifier = v11->_intentIdentifier;
    v11->_intentIdentifier = (NSString *)v14;

    [(IMAssistantMessageHandler *)v11 forceTriggerResumeNotification];
  }

  return v11;
}

- (NSArray)keysToFetch
{
  v11[11] = *MEMORY[0x263EF8340];
  keysToFetch = self->_keysToFetch;
  if (!keysToFetch)
  {
    v4 = objc_opt_new();
    v5 = objc_msgSend(MEMORY[0x263EFEA20], "descriptorForRequiredKeysForStyle:", 0, *MEMORY[0x263EFE040], *MEMORY[0x263EFDFC8], *MEMORY[0x263EFE038], *MEMORY[0x263EFDFB8], *MEMORY[0x263EFE048], *MEMORY[0x263EFE050], *MEMORY[0x263EFE070], *MEMORY[0x263EFDF80], *MEMORY[0x263EFE078]);
    v11[9] = v5;
    v6 = [MEMORY[0x263F08A68] descriptorForUsedKeys];
    v11[10] = v6;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:11];
    [v4 addObjectsFromArray:v7];

    id v8 = (NSArray *)[v4 copy];
    id v9 = self->_keysToFetch;
    self->_keysToFetch = v8;

    keysToFetch = self->_keysToFetch;
  }

  return keysToFetch;
}

- (NSString)intentIdentifier
{
  return self->_intentIdentifier;
}

- (id)contactsMatchingINPerson:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _IMAssistantCoreGeneralSignpostLogHandle();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  v7 = _IMAssistantCoreGeneralSignpostLogHandle();
  id v8 = v7;
  unint64_t v9 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v25) = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "contactsMatchingPerson", (const char *)&unk_22C1E071B, (uint8_t *)&v25, 2u);
  }

  id v10 = objc_msgSend(v4, "__im_assistant_allContactIdentifiers");
  if ([v10 count])
  {
    v11 = [MEMORY[0x263EFE9F8] predicateForContactsWithIdentifiers:v10];
    v12 = [(IMAssistantMessageHandler *)self contactsMatchingPredicate:v11 forPerson:v4];
    int v13 = IMOSLoggingEnabled();
    if (v12)
    {
      if (v13)
      {
        uint64_t v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          uint64_t v15 = [v12 count];
          int v25 = 134218498;
          uint64_t v26 = v15;
          __int16 v27 = 2112;
          id v28 = v4;
          __int16 v29 = 2112;
          v30 = v12;
          _os_log_impl(&dword_22C1AD000, v14, OS_LOG_TYPE_INFO, "Person resolved to %ld contacts via siriMatches. Person: %@, Contacts: %@", (uint8_t *)&v25, 0x20u);
        }
      }
      v16 = _IMAssistantCoreGeneralSignpostLogHandle();
      objc_super v17 = v16;
      if (v9 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v16))
      {
        LOWORD(v25) = 0;
        _os_signpost_emit_with_name_impl(&dword_22C1AD000, v17, OS_SIGNPOST_INTERVAL_END, v6, "contactsMatchingPerson", (const char *)&unk_22C1E071B, (uint8_t *)&v25, 2u);
      }

      id v18 = v12;
    }
    else
    {
      if (v13)
      {
        v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          int v25 = 138412290;
          uint64_t v26 = (uint64_t)v4;
          _os_log_impl(&dword_22C1AD000, v21, OS_LOG_TYPE_INFO, "Person contained siriMatches that did not resolve to any contacts. Person: %@", (uint8_t *)&v25, 0xCu);
        }
      }
      v22 = _IMAssistantCoreGeneralSignpostLogHandle();
      v23 = v22;
      if (v9 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v22))
      {
        LOWORD(v25) = 0;
        _os_signpost_emit_with_name_impl(&dword_22C1AD000, v23, OS_SIGNPOST_INTERVAL_END, v6, "contactsMatchingPerson", (const char *)&unk_22C1E071B, (uint8_t *)&v25, 2u);
      }

      id v18 = (id)MEMORY[0x263EFFA68];
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        int v25 = 138412290;
        uint64_t v26 = (uint64_t)v4;
        _os_log_impl(&dword_22C1AD000, v19, OS_LOG_TYPE_INFO, "Person to resolve contains no siriMatches. Person: %@", (uint8_t *)&v25, 0xCu);
      }
    }
    v20 = _IMAssistantCoreGeneralSignpostLogHandle();
    v11 = v20;
    if (v9 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v20))
    {
      LOWORD(v25) = 0;
      _os_signpost_emit_with_name_impl(&dword_22C1AD000, v11, OS_SIGNPOST_INTERVAL_END, v6, "contactsMatchingPerson", (const char *)&unk_22C1E071B, (uint8_t *)&v25, 2u);
    }
    id v18 = (id)MEMORY[0x263EFFA68];
  }

  return v18;
}

- (id)unifiedContactIdentifierForContactIdentifier:(id)a3
{
  v30[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _IMAssistantCoreGeneralSignpostLogHandle();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  v7 = _IMAssistantCoreGeneralSignpostLogHandle();
  id v8 = v7;
  unint64_t v9 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "unifiedContactIdentifierForContactIdentifier", (const char *)&unk_22C1E071B, buf, 2u);
  }

  id v10 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
  v11 = [v10 contactIdentifierToUnifiedContactIdentifierCache];

  v12 = [v11 objectForKey:v4];
  if ([v12 length])
  {
    int v13 = _IMAssistantCoreGeneralSignpostLogHandle();
    uint64_t v14 = v13;
    if (v9 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22C1AD000, v14, OS_SIGNPOST_INTERVAL_END, v6, "unifiedContactIdentifierForContactIdentifier", (const char *)&unk_22C1E071B, buf, 2u);
    }

    id v15 = v12;
  }
  else
  {
    v16 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
    objc_super v17 = [v16 contactsDataSource];
    v30[0] = *MEMORY[0x263EFDFE0];
    id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:1];
    id v25 = 0;
    v19 = [v17 unifiedContactWithIdentifier:v4 keysToFetch:v18 error:&v25];
    id v20 = v25;

    if (v20 && IMOSLoggingEnabled())
    {
      v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v27 = v4;
        __int16 v28 = 2112;
        id v29 = v20;
        _os_log_impl(&dword_22C1AD000, v21, OS_LOG_TYPE_INFO, "Error fetching unified contact identifier for contact with identifier %@ from contact store. Error: %@", buf, 0x16u);
      }
    }
    id v15 = [v19 identifier];
    if ([v15 length]) {
      [v11 setObject:v15 forKey:v4];
    }
    v22 = _IMAssistantCoreGeneralSignpostLogHandle();
    v23 = v22;
    if (v9 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22C1AD000, v23, OS_SIGNPOST_INTERVAL_END, v6, "unifiedContactIdentifierForContactIdentifier", (const char *)&unk_22C1E071B, buf, 2u);
    }
  }

  return v15;
}

- (id)contactWithIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _IMAssistantCoreGeneralSignpostLogHandle();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  v7 = _IMAssistantCoreGeneralSignpostLogHandle();
  id v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "contactWithIdentifier", (const char *)&unk_22C1E071B, buf, 2u);
  }

  unint64_t v9 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
  id v10 = [v9 contactsDataSource];
  v11 = [(IMAssistantMessageHandler *)self keysToFetch];
  id v18 = 0;
  v12 = [v10 unifiedContactWithIdentifier:v4 keysToFetch:v11 error:&v18];
  id v13 = v18;

  if (v13 && IMOSLoggingEnabled())
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v20 = v4;
      __int16 v21 = 2112;
      id v22 = v13;
      _os_log_impl(&dword_22C1AD000, v14, OS_LOG_TYPE_INFO, "Error fetching contact with identifier %@ from contact store. Error: %@", buf, 0x16u);
    }
  }
  id v15 = _IMAssistantCoreGeneralSignpostLogHandle();
  v16 = v15;
  if (v6 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v16, OS_SIGNPOST_INTERVAL_END, v6, "contactWithIdentifier", (const char *)&unk_22C1E071B, buf, 2u);
  }

  return v12;
}

- (id)contactsMatchingPredicate:(id)a3 forPerson:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = _IMAssistantCoreGeneralSignpostLogHandle();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = _IMAssistantCoreGeneralSignpostLogHandle();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "contactsMatchingPredicate", (const char *)&unk_22C1E071B, buf, 2u);
  }

  v12 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
  id v13 = [v12 contactsDataSource];
  uint64_t v14 = [(IMAssistantMessageHandler *)self keysToFetch];
  id v21 = 0;
  id v15 = [v13 unifiedContactsMatchingPredicate:v6 keysToFetch:v14 error:&v21];
  id v16 = v21;

  if (v16)
  {
    if (IMOSLoggingEnabled())
    {
      objc_super v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v23 = v7;
        __int16 v24 = 2112;
        id v25 = v16;
        _os_log_impl(&dword_22C1AD000, v17, OS_LOG_TYPE_INFO, "Error fetching %@ from contact store: %@", buf, 0x16u);
      }
LABEL_13:
    }
  }
  else if (![v15 count] && IMOSLoggingEnabled())
  {
    objc_super v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v7;
      _os_log_impl(&dword_22C1AD000, v17, OS_LOG_TYPE_INFO, "Could not find person %@ in contact store with predicate", buf, 0xCu);
    }
    goto LABEL_13;
  }
  id v18 = _IMAssistantCoreGeneralSignpostLogHandle();
  v19 = v18;
  if (v9 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v19, OS_SIGNPOST_INTERVAL_END, v9, "contactsMatchingPredicate", (const char *)&unk_22C1E071B, buf, 2u);
  }

  return v15;
}

- (id)contactIdentifiersMatchingHandleID:(id)a3 handleType:(int64_t)a4
{
  v51[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = _IMAssistantCoreGeneralSignpostLogHandle();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  os_signpost_id_t v9 = _IMAssistantCoreGeneralSignpostLogHandle();
  id v10 = v9;
  unint64_t v11 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "contactIdentifiersMatchingHandleID", (const char *)&unk_22C1E071B, buf, 2u);
  }

  if (![v6 length])
  {
    if (IMOSLoggingEnabled())
    {
      id v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C1AD000, v15, OS_LOG_TYPE_INFO, "Returning empty contactID array for nil handleID", buf, 2u);
      }
    }
    id v16 = _IMAssistantCoreGeneralSignpostLogHandle();
    uint64_t v14 = v16;
    if (v11 >= 0xFFFFFFFFFFFFFFFELL || !os_signpost_enabled(v16)) {
      goto LABEL_21;
    }
    *(_WORD *)buf = 0;
    goto LABEL_20;
  }
  if (MEMORY[0x230F625F0](v6))
  {
    if (IMOSLoggingEnabled())
    {
      v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v48 = v6;
        _os_log_impl(&dword_22C1AD000, v12, OS_LOG_TYPE_INFO, "Returning empty contactID array for handleID that is a businessID: %@", buf, 0xCu);
      }
    }
    id v13 = _IMAssistantCoreGeneralSignpostLogHandle();
    uint64_t v14 = v13;
    if (v11 >= 0xFFFFFFFFFFFFFFFELL || !os_signpost_enabled(v13)) {
      goto LABEL_21;
    }
    *(_WORD *)buf = 0;
LABEL_20:
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v14, OS_SIGNPOST_INTERVAL_END, v8, "contactIdentifiersMatchingHandleID", (const char *)&unk_22C1E071B, buf, 2u);
LABEL_21:
    id v17 = (id)MEMORY[0x263EFFA68];
    goto LABEL_50;
  }
  id v18 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
  uint64_t v14 = [v18 handleToContactIdentifierCache];

  v40 = [v14 objectForKey:v6];
  if (v40)
  {
    v19 = _IMAssistantCoreGeneralSignpostLogHandle();
    id v20 = v19;
    if (v11 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22C1AD000, v20, OS_SIGNPOST_INTERVAL_END, v8, "contactIdentifiersMatchingHandleID", (const char *)&unk_22C1E071B, buf, 2u);
    }

    id v21 = v40;
    id v17 = v40;
  }
  else
  {
    v39 = [(IMAssistantMessageHandler *)self contactPredicateFromHandle:v6 handleType:a4];
    id v22 = objc_alloc_init(MEMORY[0x263EFF9B0]);
    if (v39)
    {
      id v23 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
      __int16 v24 = [v23 contactsDataSource];
      uint64_t v25 = *MEMORY[0x263EFDF80];
      v51[0] = *MEMORY[0x263EFDFE0];
      v51[1] = v25;
      v51[2] = *MEMORY[0x263EFE070];
      uint64_t v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:3];
      id v45 = 0;
      id v27 = [v24 unifiedContactsMatchingPredicate:v39 keysToFetch:v26 error:&v45];
      id v38 = v45;

      if (v38 && IMOSLoggingEnabled())
      {
        __int16 v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v48 = v6;
          __int16 v49 = 2112;
          id v50 = v38;
          _os_log_impl(&dword_22C1AD000, v28, OS_LOG_TYPE_INFO, "Error fetching contact identifiers matching handle %@ from contact store: %@", buf, 0x16u);
        }
      }
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v29 = v27;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v41 objects:v46 count:16];
      if (v30)
      {
        uint64_t v31 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v42 != v31) {
              objc_enumerationMutation(v29);
            }
            v33 = [*(id *)(*((void *)&v41 + 1) + 8 * i) identifier];
            [v22 addObject:v33];
          }
          uint64_t v30 = [v29 countByEnumeratingWithState:&v41 objects:v46 count:16];
        }
        while (v30);
      }
    }
    else if (IMOSLoggingEnabled())
    {
      v34 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v48 = v6;
        _os_log_impl(&dword_22C1AD000, v34, OS_LOG_TYPE_INFO, "Could not search for contacts matching handle because a predicate could not be consrtuced from handle ID: %@", buf, 0xCu);
      }
    }
    id v17 = [v22 array];
    v35 = _IMAssistantCoreGeneralSignpostLogHandle();
    v36 = v35;
    if (v11 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v35))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_22C1AD000, v36, OS_SIGNPOST_INTERVAL_END, v8, "contactIdentifiersMatchingHandleID", (const char *)&unk_22C1E071B, buf, 2u);
    }

    id v21 = 0;
  }

LABEL_50:

  return v17;
}

- (id)contactPredicateFromHandle:(id)a3 handleType:(int64_t)a4
{
  id v5 = a3;
  if (a4)
  {
    if (a4 != 2)
    {
      if (a4 != 1)
      {
LABEL_4:
        id v6 = 0;
        goto LABEL_13;
      }
      goto LABEL_10;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl(&dword_22C1AD000, v7, OS_LOG_TYPE_INFO, "Unknown handle type, determining type from handle string value", v10, 2u);
      }
    }
    if (IMStringIsEmail())
    {
LABEL_10:
      id v6 = [MEMORY[0x263EFE9F8] predicateForContactsMatchingEmailAddress:v5];
      goto LABEL_13;
    }
    if (!MEMORY[0x230F62610](v5)) {
      goto LABEL_4;
    }
  }
  os_signpost_id_t v8 = (void *)[objc_alloc(MEMORY[0x263EFEB28]) initWithStringValue:v5];
  id v6 = [MEMORY[0x263EFE9F8] predicateForContactsMatchingPhoneNumber:v8];

LABEL_13:

  return v6;
}

- (id)contactIdentifiersMatchingINPersonHandle:(id)a3
{
  id v4 = a3;
  id v5 = [v4 value];
  if (v5)
  {
    id v6 = -[IMAssistantMessageHandler contactIdentifiersMatchingHandleID:handleType:](self, "contactIdentifiersMatchingHandleID:handleType:", v5, [v4 type]);
  }
  else
  {
    id v6 = (void *)MEMORY[0x263EFFA68];
  }

  return v6;
}

- (id)contactIdentifiersMatchingHandle:(id)a3
{
  id v4 = [a3 normalizedID];
  if (v4)
  {
    id v5 = [(IMAssistantMessageHandler *)self contactIdentifiersMatchingHandleID:v4 handleType:0];
  }
  else
  {
    id v5 = (void *)MEMORY[0x263EFFA68];
  }

  return v5;
}

- (id)contactIdentifiersMatchingSPIHandle:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  if ([v4 isMe])
  {
    id v6 = [(IMAssistantMessageHandler *)self meContactIdentifier];
    if ([v6 length]) {
      [v5 addObject:v6];
    }
  }
  id v7 = [v4 address];
  if (v7)
  {
    os_signpost_id_t v8 = [(IMAssistantMessageHandler *)self contactIdentifiersMatchingHandleID:v7 handleType:0];
    [v5 addObjectsFromArray:v8];
  }
  os_signpost_id_t v9 = [v5 array];

  return v9;
}

- (id)meContactIdentifier
{
  v21[1] = *MEMORY[0x263EF8340];
  v3 = _IMAssistantCoreGeneralSignpostLogHandle();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  id v5 = _IMAssistantCoreGeneralSignpostLogHandle();
  id v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "meContactIdentifier", (const char *)&unk_22C1E071B, buf, 2u);
  }

  id v7 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
  os_signpost_id_t v8 = [v7 contactsDataSource];

  v21[0] = *MEMORY[0x263EFDFE0];
  os_signpost_id_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
  id v18 = 0;
  id v10 = [v8 _crossPlatformUnifiedMeContactWithKeysToFetch:v9 error:&v18];
  id v11 = v18;
  if (v11 && IMOSLoggingEnabled())
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v11;
      _os_log_impl(&dword_22C1AD000, v12, OS_LOG_TYPE_INFO, "Error fetching me contact: %@", buf, 0xCu);
    }
  }
  if (!v10 && IMOSLoggingEnabled())
  {
    id v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C1AD000, v13, OS_LOG_TYPE_INFO, "Could not find me contact identifier", buf, 2u);
    }
  }
  uint64_t v14 = [v10 identifier];
  id v15 = _IMAssistantCoreGeneralSignpostLogHandle();
  id v16 = v15;
  if (v4 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v16, OS_SIGNPOST_INTERVAL_END, v4, "meContactIdentifier", (const char *)&unk_22C1E071B, buf, 2u);
  }

  return v14;
}

- (id)contactIdentifiersForParticipantsInChat:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v6 = [v4 participantsWithState:16];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
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
        id v11 = [(IMAssistantMessageHandler *)self contactIdentifiersMatchingHandle:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  v12 = (void *)[v5 copy];

  return v12;
}

- (id)personFromSPIHandle:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _IMAssistantCoreGeneralSignpostLogHandle();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  uint64_t v7 = _IMAssistantCoreGeneralSignpostLogHandle();
  uint64_t v8 = v7;
  unint64_t v9 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v24) = 0;
    _os_signpost_emit_with_name_impl(&dword_22C1AD000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "personFromSPIHandle", (const char *)&unk_22C1E071B, (uint8_t *)&v24, 2u);
  }

  id v10 = [(IMAssistantMessageHandler *)self messageHandlerDataSource];
  id v11 = [v10 spiHandleToPersonCache];

  v12 = [v11 objectForKey:v4];
  if (v12)
  {
    id v13 = _IMAssistantCoreGeneralSignpostLogHandle();
    long long v14 = v13;
    if (v9 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v13))
    {
      LOWORD(v24) = 0;
      _os_signpost_emit_with_name_impl(&dword_22C1AD000, v14, OS_SIGNPOST_INTERVAL_END, v6, "personFromSPIHandle", (const char *)&unk_22C1E071B, (uint8_t *)&v24, 2u);
    }

    id v15 = v12;
  }
  else
  {
    long long v16 = [(IMAssistantMessageHandler *)self contactIdentifiersMatchingSPIHandle:v4];
    if ([v16 count])
    {
      long long v17 = [v16 firstObject];
      id v18 = [(IMAssistantMessageHandler *)self contactWithIdentifier:v17];
      if ((unint64_t)[v16 count] >= 2 && IMOSLoggingEnabled())
      {
        uint64_t v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          uint64_t v20 = [v16 count];
          int v24 = 134218754;
          uint64_t v25 = v20;
          __int16 v26 = 2112;
          id v27 = v4;
          __int16 v28 = 2112;
          id v29 = v16;
          __int16 v30 = 2112;
          uint64_t v31 = v18;
          _os_log_impl(&dword_22C1AD000, v19, OS_LOG_TYPE_INFO, "%ld contacts matched handle %@. Matching identifiers: %@. Using contact: %@", (uint8_t *)&v24, 0x2Au);
        }
      }
    }
    else
    {
      id v18 = 0;
    }
    objc_msgSend(MEMORY[0x263F0FD18], "__im_personFromSPIHandle:contact:", v4, v18);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    [v11 setObject:v15 forKey:v4];
    id v21 = _IMAssistantCoreGeneralSignpostLogHandle();
    id v22 = v21;
    if (v9 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v21))
    {
      LOWORD(v24) = 0;
      _os_signpost_emit_with_name_impl(&dword_22C1AD000, v22, OS_SIGNPOST_INTERVAL_END, v6, "personFromSPIHandle", (const char *)&unk_22C1E071B, (uint8_t *)&v24, 2u);
    }
  }

  return v15;
}

+ (id)connectToIMDaemonController
{
  if (IMIsRunningInUnitTesting())
  {
    id v2 = [MEMORY[0x263EFF910] date];
  }
  else
  {
    if (qword_2684A5560 != -1) {
      dispatch_once(&qword_2684A5560, &unk_26DF9B6F8);
    }
    id v2 = (id)qword_2684A5568;
  }

  return v2;
}

- (void)forceTriggerResumeNotification
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_22C1CC7D4;
  v5[3] = &unk_264912A48;
  v5[4] = self;
  id v2 = (void (**)(void))MEMORY[0x230F62A80](v5, a2);
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    v2[2](v2);
  }
  else
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = sub_22C1CCAB8;
    v3[3] = &unk_264912918;
    id v4 = v2;
    dispatch_sync(MEMORY[0x263EF83A0], v3);
  }
}

- (IMAssistantMessageHandlerDataSource)messageHandlerDataSource
{
  return self->_messageHandlerDataSource;
}

- (void)setMessageHandlerDataSource:(id)a3
{
}

- (void)setKeysToFetch:(id)a3
{
}

- (void)setIntentIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentIdentifier, 0);
  objc_storeStrong((id *)&self->_keysToFetch, 0);

  objc_storeStrong((id *)&self->_messageHandlerDataSource, 0);
}

@end