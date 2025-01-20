@interface IMCommLimitsPolicyCache
- (BOOL)isFetchingCommLimitsPolicyForChat:(id)a3;
- (IMCommLimitsPolicyCache)init;
- (NSMutableDictionary)chatIdentifierToParticipantIDsHash;
- (NSMutableDictionary)conversationContextToParticipantIDsHash;
- (NSMutableDictionary)participantIDsHashToChatIdentifier;
- (NSMutableDictionary)participantIDsHashToConversationContext;
- (id)chatForConversationContext:(id)a3;
- (id)chatForParticipantIDsHash:(id)a3;
- (id)contextForParticipantIDsHash:(id)a3;
- (id)conversationContextForChat:(id)a3;
- (void)addSentinelContextForParticipantIDsHash:(id)a3;
- (void)addTrackingForChat:(id)a3 participantIDsHash:(id)a4;
- (void)addTrackingForConversationContext:(id)a3 forParticipantIDsHash:(id)a4;
- (void)removeTrackingForChat:(id)a3;
- (void)setChatIdentifierToParticipantIDsHash:(id)a3;
- (void)setConversationContextToParticipantIDsHash:(id)a3;
- (void)setParticipantIDsHashToChatIdentifier:(id)a3;
- (void)setParticipantIDsHashToConversationContext:(id)a3;
@end

@implementation IMCommLimitsPolicyCache

- (IMCommLimitsPolicyCache)init
{
  v12.receiver = self;
  v12.super_class = (Class)IMCommLimitsPolicyCache;
  v2 = [(IMCommLimitsPolicyCache *)&v12 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    participantIDsHashToConversationContext = v2->_participantIDsHashToConversationContext;
    v2->_participantIDsHashToConversationContext = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    conversationContextToParticipantIDsHash = v2->_conversationContextToParticipantIDsHash;
    v2->_conversationContextToParticipantIDsHash = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    participantIDsHashToChatIdentifier = v2->_participantIDsHashToChatIdentifier;
    v2->_participantIDsHashToChatIdentifier = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    chatIdentifierToParticipantIDsHash = v2->_chatIdentifierToParticipantIDsHash;
    v2->_chatIdentifierToParticipantIDsHash = (NSMutableDictionary *)v9;
  }
  return v2;
}

- (void)addSentinelContextForParticipantIDsHash:(id)a3
{
  if (a3)
  {
    v4 = (void *)MEMORY[0x1E4F1CA98];
    id v5 = a3;
    objc_msgSend_null(v4, v6, v7, v8);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_super v12 = objc_msgSend_participantIDsHashToConversationContext(self, v9, v10, v11);
    objc_msgSend_setObject_forKeyedSubscript_(v12, v13, (uint64_t)v14, (uint64_t)v5);
  }
}

- (id)conversationContextForChat:(id)a3
{
  uint64_t v8 = objc_msgSend_chatIdentifier(a3, a2, (uint64_t)a3, v3);
  if (v8)
  {
    uint64_t v9 = objc_msgSend_chatIdentifierToParticipantIDsHash(self, v5, v6, v7);
    objc_super v12 = objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)v8, v11);

    if (v12)
    {
      v16 = objc_msgSend_participantIDsHashToConversationContext(self, v13, v14, v15);
      v19 = objc_msgSend_objectForKeyedSubscript_(v16, v17, (uint64_t)v12, v18);

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_6:

        goto LABEL_8;
      }
    }
    v19 = 0;
    goto LABEL_6;
  }
  v19 = 0;
LABEL_8:

  return v19;
}

- (BOOL)isFetchingCommLimitsPolicyForChat:(id)a3
{
  uint64_t v8 = objc_msgSend_chatIdentifier(a3, a2, (uint64_t)a3, v3);
  if (v8
    && (objc_msgSend_chatIdentifierToParticipantIDsHash(self, v5, v6, v7),
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)v8, v11),
        objc_super v12 = objc_claimAutoreleasedReturnValue(),
        v9,
        v12))
  {
    v16 = objc_msgSend_participantIDsHashToConversationContext(self, v13, v14, v15);
    v19 = objc_msgSend_objectForKeyedSubscript_(v16, v17, (uint64_t)v12, v18);

    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (NSMutableDictionary)participantIDsHashToConversationContext
{
  return self->_participantIDsHashToConversationContext;
}

- (NSMutableDictionary)chatIdentifierToParticipantIDsHash
{
  return self->_chatIdentifierToParticipantIDsHash;
}

- (id)contextForParticipantIDsHash:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v8 = objc_msgSend_participantIDsHashToConversationContext(self, v5, v6, v7);
    uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)v4, v10);
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)chatForConversationContext:(id)a3
{
  if (a3)
  {
    id v5 = objc_msgSend_valueWithPointer_(MEMORY[0x1E4F29238], a2, (uint64_t)a3, v3);
    uint64_t v9 = objc_msgSend_conversationContextToParticipantIDsHash(self, v6, v7, v8);
    objc_super v12 = objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)v5, v11);

    uint64_t v15 = objc_msgSend_chatForParticipantIDsHash_(self, v13, (uint64_t)v12, v14);
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (void)addTrackingForConversationContext:(id)a3 forParticipantIDsHash:(id)a4
{
  if (a3 && a4)
  {
    id v6 = a4;
    id v7 = a3;
    uint64_t v11 = objc_msgSend_participantIDsHashToConversationContext(self, v8, v9, v10);
    objc_msgSend_setObject_forKeyedSubscript_(v11, v12, (uint64_t)v7, (uint64_t)v6);

    objc_msgSend_valueWithPointer_(MEMORY[0x1E4F29238], v13, (uint64_t)v7, v14);
    id v20 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v18 = objc_msgSend_conversationContextToParticipantIDsHash(self, v15, v16, v17);
    objc_msgSend_setObject_forKeyedSubscript_(v18, v19, (uint64_t)v6, (uint64_t)v20);
  }
}

- (NSMutableDictionary)conversationContextToParticipantIDsHash
{
  return self->_conversationContextToParticipantIDsHash;
}

- (void)addTrackingForChat:(id)a3 participantIDsHash:(id)a4
{
  id v20 = a4;
  objc_super v12 = objc_msgSend_chatIdentifier(a3, v6, v7, v8);
  if (v20 && v12)
  {
    v13 = objc_msgSend_participantIDsHashToChatIdentifier(self, v9, v10, v11);
    objc_msgSend_setObject_forKeyedSubscript_(v13, v14, (uint64_t)v12, (uint64_t)v20);

    uint64_t v18 = objc_msgSend_chatIdentifierToParticipantIDsHash(self, v15, v16, v17);
    objc_msgSend_setObject_forKeyedSubscript_(v18, v19, (uint64_t)v20, (uint64_t)v12);
  }
}

- (id)chatForParticipantIDsHash:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v8 = objc_msgSend_participantIDsHashToChatIdentifier(self, v5, v6, v7);
    uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)v4, v10);

    if (v11)
    {
      uint64_t v15 = objc_msgSend_sharedRegistry(IMChatRegistry, v12, v13, v14);
      uint64_t v18 = objc_msgSend_existingChatWithChatIdentifier_(v15, v16, (uint64_t)v11, v17);
    }
    else
    {
      uint64_t v18 = 0;
    }
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

- (NSMutableDictionary)participantIDsHashToChatIdentifier
{
  return self->_participantIDsHashToChatIdentifier;
}

- (void)removeTrackingForChat:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v11 = objc_msgSend_chatIdentifier(v4, v5, v6, v7);
  if (v11)
  {
    objc_super v12 = objc_msgSend_chatIdentifierToParticipantIDsHash(self, v8, v9, v10);
    uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v12, v13, (uint64_t)v11, v14);

    if (v15)
    {
      if (IMOSLoggingEnabled())
      {
        v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          int v45 = 138412546;
          id v46 = v4;
          __int16 v47 = 2112;
          v48 = v15;
          _os_log_impl(&dword_1A4AF7000, v19, OS_LOG_TYPE_INFO, "Participants changed for chat %@. Invalidating cached Screen Time policy for participants group IDs hash: %@", (uint8_t *)&v45, 0x16u);
        }
      }
      id v20 = objc_msgSend_participantIDsHashToConversationContext(self, v16, v17, v18);
      v23 = objc_msgSend_objectForKeyedSubscript_(v20, v21, (uint64_t)v15, v22);

      if (v23)
      {
        v27 = objc_msgSend_valueWithPointer_(MEMORY[0x1E4F29238], v24, (uint64_t)v23, v26);
        v31 = objc_msgSend_conversationContextToParticipantIDsHash(self, v28, v29, v30);
        objc_msgSend_setObject_forKeyedSubscript_(v31, v32, 0, (uint64_t)v27);
      }
      v33 = objc_msgSend_chatIdentifierToParticipantIDsHash(self, v24, v25, v26);
      objc_msgSend_setObject_forKeyedSubscript_(v33, v34, 0, (uint64_t)v11);

      v38 = objc_msgSend_participantIDsHashToChatIdentifier(self, v35, v36, v37);
      objc_msgSend_setObject_forKeyedSubscript_(v38, v39, 0, (uint64_t)v15);

      v43 = objc_msgSend_participantIDsHashToConversationContext(self, v40, v41, v42);
      objc_msgSend_setObject_forKeyedSubscript_(v43, v44, 0, (uint64_t)v15);
    }
  }
}

- (void)setConversationContextToParticipantIDsHash:(id)a3
{
}

- (void)setParticipantIDsHashToConversationContext:(id)a3
{
}

- (void)setParticipantIDsHashToChatIdentifier:(id)a3
{
}

- (void)setChatIdentifierToParticipantIDsHash:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chatIdentifierToParticipantIDsHash, 0);
  objc_storeStrong((id *)&self->_participantIDsHashToChatIdentifier, 0);
  objc_storeStrong((id *)&self->_participantIDsHashToConversationContext, 0);

  objc_storeStrong((id *)&self->_conversationContextToParticipantIDsHash, 0);
}

@end