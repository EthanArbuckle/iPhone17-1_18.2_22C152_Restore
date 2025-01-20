@interface SGTextMessage
+ (BOOL)isSent:(id)a3;
+ (id)_nicknameCustomKey;
+ (id)_photoPathCustomKey;
- (BOOL)isPotentialEventMessage;
- (BOOL)isTapBack;
- (BOOL)senderIsAccountOwner;
- (BOOL)senderIsBusinessChat;
- (CSPerson)sender;
- (NSArray)recipients;
- (NSString)attachmentFilename;
- (NSString)conversationIdentifier;
- (NSString)nickname;
- (NSString)photoPath;
- (SGTextMessage)initWithMessageDictionary:(id)a3;
- (SGTextMessage)initWithMessagesContentEvent:(id)a3 contentProtection:(id)a4;
- (SGTextMessage)initWithSearchableItem:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)spotlightBundleIdentifier;
- (id)spotlightDomainIdentifier;
- (void)setConversationIdentifier:(id)a3;
- (void)setNickname:(id)a3;
- (void)setPhotoPath:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setSender:(id)a3;
- (void)setSenderIsAccountOwner:(BOOL)a3;
@end

@implementation SGTextMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentFilename, 0);
  objc_storeStrong((id *)&self->_photoPath, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_conversationIdentifier, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_sender, 0);
}

- (BOOL)isTapBack
{
  return self->_tapBack;
}

- (BOOL)isPotentialEventMessage
{
  return self->_isPotentialEventMessage;
}

- (NSString)attachmentFilename
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (BOOL)senderIsBusinessChat
{
  return self->_senderIsBusinessChat;
}

- (void)setPhotoPath:(id)a3
{
}

- (NSString)photoPath
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setNickname:(id)a3
{
}

- (NSString)nickname
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setSenderIsAccountOwner:(BOOL)a3
{
  self->_senderIsAccountOwner = a3;
}

- (BOOL)senderIsAccountOwner
{
  return self->_senderIsAccountOwner;
}

- (void)setConversationIdentifier:(id)a3
{
}

- (NSString)conversationIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setRecipients:(id)a3
{
}

- (NSArray)recipients
{
  return (NSArray *)objc_getProperty(self, a2, 184, 1);
}

- (void)setSender:(id)a3
{
}

- (CSPerson)sender
{
  return (CSPerson *)objc_getProperty(self, a2, 176, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SGTextMessage;
  v4 = [(SGMessage *)&v6 copyWithZone:a3];
  [v4 setSender:self->_sender];
  [v4 setRecipients:self->_recipients];
  [v4 setConversationIdentifier:self->_conversationIdentifier];
  *((unsigned char *)v4 + 168) = self->_senderIsAccountOwner;
  objc_storeStrong(v4 + 27, self->_attachmentFilename);
  return v4;
}

- (id)spotlightDomainIdentifier
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)SGTextMessage;
  v4 = [(SGMessage *)&v12 spotlightDomainIdentifier];
  if (!v4)
  {
    v4 = [(SGTextMessage *)self conversationIdentifier];
    if (!v4)
    {
      v5 = sgLogHandle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        v10 = [(SGMessage *)self spotlightUniqueIdentifier];
        *(_DWORD *)buf = 138412290;
        v14 = v10;
        _os_log_fault_impl(&dword_1CA650000, v5, OS_LOG_TYPE_FAULT, "Cannot get domain identifier for text message %@", buf, 0xCu);
      }
      if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
        abort();
      }
      id v6 = [NSString alloc];
      v7 = [(SGMessage *)self uniqueIdentifier];
      v4 = (void *)[v6 initWithFormat:@"SGMissingDomainIdentifier.uniqueIdentifierFallback.%@", v7];

      if (!v4)
      {
        v11 = [MEMORY[0x1E4F28B00] currentHandler];
        [v11 handleFailureInMethod:a2, self, @"SGTextMessage.m", 247, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
      }
    }
  }
  id v8 = v4;

  return v8;
}

- (id)spotlightBundleIdentifier
{
  v6.receiver = self;
  v6.super_class = (Class)SGTextMessage;
  v2 = [(SGMessage *)&v6 spotlightBundleIdentifier];
  v3 = v2;
  if (!v2) {
    v2 = (void *)*MEMORY[0x1E4F5DC38];
  }
  id v4 = v2;

  return v4;
}

- (SGTextMessage)initWithMessageDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SGTextMessage;
  v5 = [(SGMessage *)&v12 initWithMessageDictionary:v4];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"conversationIdentifier"];
    conversationIdentifier = v5->_conversationIdentifier;
    v5->_conversationIdentifier = (NSString *)v6;

    id v8 = [v4 objectForKeyedSubscript:@"senderIsAccountOwner"];
    v5->_senderIsAccountOwner = [v8 BOOLValue];

    uint64_t v9 = [v4 objectForKeyedSubscript:@"sender"];
    sender = v5->_sender;
    v5->_sender = (CSPerson *)v9;
  }
  return v5;
}

- (SGTextMessage)initWithMessagesContentEvent:(id)a3 contentProtection:(id)a4
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v37.receiver = self;
  v37.super_class = (Class)SGTextMessage;
  v7 = [(SGMessage *)&v37 initWithMessagesContentEvent:v6 contentProtection:a4];
  if (v7)
  {
    id v8 = [v6 content];
    [(SGMessage *)v7 setTextContent:v8];

    uint64_t v9 = [v6 fromHandle];
    v10 = [v9 name];
    v11 = [v9 handle];
    objc_super v12 = [v9 name];
    int v13 = [v11 containsString:v12];

    if (v13)
    {

      v10 = 0;
    }
    id v14 = objc_alloc(MEMORY[0x1E4F23810]);
    uint64_t v15 = [v9 handle];
    v38[0] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
    v17 = [v9 handleType];
    v18 = (CSPerson *)[v14 initWithDisplayName:v10 handles:v16 handleIdentifier:v17];

    sender = v7->_sender;
    v7->_sender = v18;
    v20 = v18;

    v7->_senderIsAccountOwner = 0;
    [(SGMessage *)v7 setIsSent:0];
    v21 = [v6 accountHandles];
    v22 = [v9 handle];
    LODWORD(v17) = [v21 containsObject:v22];

    if (v17)
    {
      v7->_senderIsAccountOwner = 1;
      [(SGMessage *)v7 setIsSent:1];
    }
    v23 = [v9 handleType];
    int v24 = [v23 isEqual:*MEMORY[0x1E4F1AE60]];

    if (v24)
    {
      v25 = [v9 handle];
      int v26 = [v25 hasPrefix:@"urn:biz:"];

      if (v26) {
        v7->_senderIsBusinessChat = 1;
      }
    }
    uint64_t v27 = [v6 accountIdentifier];
    conversationIdentifier = v7->_conversationIdentifier;
    v7->_conversationIdentifier = (NSString *)v27;

    v29 = [v6 attachment];
    uint64_t v30 = [v29 filename];
    attachmentFilename = v7->_attachmentFilename;
    v7->_attachmentFilename = (NSString *)v30;

    uint64_t v32 = [v6 suggestedPhotoPath];
    photoPath = v7->_photoPath;
    v7->_photoPath = (NSString *)v32;

    uint64_t v34 = [v6 suggestedNickname];
    nickname = v7->_nickname;
    v7->_nickname = (NSString *)v34;
  }
  return v7;
}

- (SGTextMessage)initWithSearchableItem:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 domainIdentifier];

  if (!v6)
  {
    v53 = [MEMORY[0x1E4F28B00] currentHandler];
    [v53 handleFailureInMethod:a2, self, @"SGTextMessage.m", 33, @"Invalid parameter not satisfying: %@", @"searchableItem.domainIdentifier" object file lineNumber description];
  }
  v63.receiver = self;
  v63.super_class = (Class)SGTextMessage;
  v7 = [(SGMessage *)&v63 initWithSearchableItem:v5];
  if (v7)
  {
    id v8 = (void *)MEMORY[0x1CB79B230]();
    uint64_t v9 = [v5 attributeSet];
    v10 = [v9 authors];
    if ([v10 count])
    {
      v55 = v10;
      v11 = [v10 objectAtIndexedSubscript:0];
      objc_super v12 = (void *)MEMORY[0x1E4F93790];
      int v13 = [v11 handles];
      id v14 = [v12 sanitizeHandles:v13];

      uint64_t v15 = [v11 displayName];
      v56 = v8;
      id v57 = v5;
      if (v15)
      {
        v16 = (void *)v15;
        v17 = v9;
        v18 = [v11 displayName];
        int v19 = [v14 containsObject:v18];

        if (v19)
        {
          v20 = sgLogHandle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_1CA650000, v20, OS_LOG_TYPE_DEBUG, "Suppressing non-meaningful text message displayName.", buf, 2u);
          }

          id v21 = objc_alloc(MEMORY[0x1E4F23810]);
          v22 = [v11 handleIdentifier];
          uint64_t v23 = [v21 initWithDisplayName:0 handles:v14 handleIdentifier:v22];

          v11 = (void *)v23;
        }
      }
      else
      {
        v17 = v9;
      }
      int v24 = v7;
      [(SGTextMessage *)v7 setSender:v11];
      v54 = v11;
      v25 = [v11 handleIdentifier];
      int v26 = [v25 isEqual:*MEMORY[0x1E4F1AE60]];

      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v27 = v14;
      uint64_t v28 = [v27 countByEnumeratingWithState:&v58 objects:v64 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v59;
        do
        {
          for (uint64_t i = 0; i != v29; ++i)
          {
            if (*(void *)v59 != v30) {
              objc_enumerationMutation(v27);
            }
            uint64_t v32 = *(void **)(*((void *)&v58 + 1) + 8 * i);
            v33 = [v17 accountHandles];
            int v34 = [v33 containsObject:v32];

            if (v34)
            {
              v24->_senderIsAccountOwner = 1;
              [(SGMessage *)v24 setIsSent:1];
            }
            if (v26 && [v32 hasPrefix:@"urn:biz:"]) {
              v24->_senderIsBusinessChat = 1;
            }
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v58 objects:v64 count:16];
        }
        while (v29);
      }

      v7 = v24;
      id v8 = v56;
      id v5 = v57;
      uint64_t v9 = v17;
      v10 = v55;
    }
    v35 = [v9 primaryRecipients];
    [(SGTextMessage *)v7 setRecipients:v35];

    v36 = [v5 domainIdentifier];
    int v37 = [v36 isEqualToString:@"attachmentDomain"];

    if (v37)
    {
      v38 = [v9 accountIdentifier];
      [(SGTextMessage *)v7 setConversationIdentifier:v38];

      v39 = [v9 contentURL];
      uint64_t v40 = [v39 lastPathComponent];
      attachmentFilename = v7->_attachmentFilename;
      v7->_attachmentFilename = (NSString *)v40;
    }
    else
    {
      v39 = [v5 domainIdentifier];
      [(SGTextMessage *)v7 setConversationIdentifier:v39];
    }

    v42 = [(id)objc_opt_class() _photoPathCustomKey];
    if (v42)
    {
      v43 = [v5 attributeSet];
      v44 = [v43 valueForCustomKey:v42];

      if (v44)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v44 length]) {
            [(SGTextMessage *)v7 setPhotoPath:v44];
          }
        }
      }
    }
    v45 = [(id)objc_opt_class() _nicknameCustomKey];
    if (v45)
    {
      v46 = [v5 attributeSet];
      v47 = [v46 valueForCustomKey:v45];

      if (v47)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v47 length]) {
            [(SGTextMessage *)v7 setNickname:v47];
          }
        }
      }
    }
    v48 = [v5 attributeSet];
    v49 = [v48 isPotentialEventMessage];
    v50 = v49;
    if (!v49) {
      v49 = (void *)MEMORY[0x1E4F1CC28];
    }
    v7->_isPotentialEventMessage = [v49 BOOLValue];

    if (objc_opt_respondsToSelector())
    {
      v51 = [v9 messageType];
      v7->_tapBack = [v51 isEqualToString:@"tpbck"];
    }
    else
    {
      v7->_tapBack = 0;
    }
  }

  return v7;
}

+ (BOOL)isSent:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [a3 attributeSet];
  id v4 = [v3 authors];
  if ([v4 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = objc_msgSend(v4, "firstObject", 0);
    id v6 = [v5 handles];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          v11 = [v3 accountHandles];
          LOBYTE(v10) = [v11 containsObject:v10];

          if (v10)
          {
            LOBYTE(v7) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

+ (id)_nicknameCustomKey
{
  if (_nicknameCustomKey_onceToken != -1) {
    dispatch_once(&_nicknameCustomKey_onceToken, &__block_literal_global_33);
  }
  v2 = (void *)_nicknameCustomKey__nicknameCustomKey;
  return v2;
}

uint64_t __35__SGTextMessage__nicknameCustomKey__block_invoke()
{
  _nicknameCustomKey__nicknameCustomKey = [objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"com_apple_mobilesms_suggested_contact_name" searchable:0 searchableByDefault:0 unique:0 multiValued:0];
  return MEMORY[0x1F41817F8]();
}

+ (id)_photoPathCustomKey
{
  if (_photoPathCustomKey_onceToken != -1) {
    dispatch_once(&_photoPathCustomKey_onceToken, &__block_literal_global);
  }
  v2 = (void *)_photoPathCustomKey__photoPathCustomKey;
  return v2;
}

uint64_t __36__SGTextMessage__photoPathCustomKey__block_invoke()
{
  _photoPathCustomKey__photoPathCustomKey = [objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"com_apple_mobilesms_suggested_contact_photo" searchable:0 searchableByDefault:0 unique:0 multiValued:0];
  return MEMORY[0x1F41817F8]();
}

@end