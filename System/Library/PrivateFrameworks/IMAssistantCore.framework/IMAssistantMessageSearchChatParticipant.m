@interface IMAssistantMessageSearchChatParticipant
- (BOOL)isMe;
- (BOOL)matchesPerson:(id)a3 withUnifiedContactIdentifiers:(id)a4;
- (IMAssistantMessageSearchChatParticipant)initWithHandle:(id)a3 contactIdentifiers:(id)a4 isMe:(BOOL)a5;
- (NSArray)contactIdentifiers;
- (NSString)handle;
@end

@implementation IMAssistantMessageSearchChatParticipant

- (IMAssistantMessageSearchChatParticipant)initWithHandle:(id)a3 contactIdentifiers:(id)a4 isMe:(BOOL)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)IMAssistantMessageSearchChatParticipant;
  v10 = [(IMAssistantMessageSearchChatParticipant *)&v19 init];
  if (v10)
  {
    id v11 = v8;
    if (MEMORY[0x230F62610]() || IMStringIsEmail())
    {
      IMCanonicalizeFormattedString();
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!MEMORY[0x230F625F0](v11) && IMOSLoggingEnabled())
      {
        v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v21 = v11;
          _os_log_impl(&dword_22C1AD000, v13, OS_LOG_TYPE_INFO, "Could not canonicalize handle \"%@\" because it is neither a phone number nor an email address.", buf, 0xCu);
        }
      }
      v12 = (NSString *)v11;
    }
    v14 = v12;

    handle = v10->_handle;
    v10->_handle = v14;

    uint64_t v16 = [v9 copy];
    contactIdentifiers = v10->_contactIdentifiers;
    v10->_contactIdentifiers = (NSArray *)v16;

    v10->_isMe = a5;
  }

  return v10;
}

- (BOOL)matchesPerson:(id)a3 withUnifiedContactIdentifiers:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!self->_isMe || ([v6 isMe] & 1) == 0)
  {
    id v9 = objc_msgSend(v6, "__im_assistant_allContactIdentifiers");
    if ([v9 count])
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v27;
LABEL_7:
        uint64_t v13 = 0;
        while (1)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v10);
          }
          if ([(NSArray *)self->_contactIdentifiers containsObject:*(void *)(*((void *)&v26 + 1) + 8 * v13)])
          {
            goto LABEL_35;
          }
          if (v11 == ++v13)
          {
            uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
            if (v11) {
              goto LABEL_7;
            }
            break;
          }
        }
      }
    }
    if ([v7 count])
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v10 = v7;
      uint64_t v14 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v23;
LABEL_17:
        uint64_t v16 = 0;
        while (1)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v10);
          }
          if (-[NSArray containsObject:](self->_contactIdentifiers, "containsObject:", *(void *)(*((void *)&v22 + 1) + 8 * v16), (void)v22))
          {
            goto LABEL_35;
          }
          if (v14 == ++v16)
          {
            uint64_t v14 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v14) {
              goto LABEL_17;
            }
            break;
          }
        }
      }
    }
    v17 = objc_msgSend(v6, "personHandle", (void)v22);
    id v18 = [v17 value];
    if (MEMORY[0x230F62610]() || IMStringIsEmail())
    {
      IMCanonicalizeFormattedString();
      id v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!MEMORY[0x230F625F0](v18) && IMOSLoggingEnabled())
      {
        v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v33 = v18;
          _os_log_impl(&dword_22C1AD000, v20, OS_LOG_TYPE_INFO, "Could not canonicalize handle \"%@\" because it is neither a phone number nor an email address.", buf, 0xCu);
        }
      }
      id v19 = v18;
    }
    id v10 = v19;

    if (![v10 length] || (objc_msgSend(v10, "isEqualToString:", self->_handle) & 1) == 0)
    {
      BOOL v8 = 0;
      goto LABEL_37;
    }
LABEL_35:
    BOOL v8 = 1;
LABEL_37:

    goto LABEL_38;
  }
  BOOL v8 = 1;
LABEL_38:

  return v8;
}

- (NSString)handle
{
  return self->_handle;
}

- (NSArray)contactIdentifiers
{
  return self->_contactIdentifiers;
}

- (BOOL)isMe
{
  return self->_isMe;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifiers, 0);

  objc_storeStrong((id *)&self->_handle, 0);
}

@end