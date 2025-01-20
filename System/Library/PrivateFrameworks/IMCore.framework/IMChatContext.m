@interface IMChatContext
- (BOOL)areSendersUnknown;
- (BOOL)hasResponded;
- (BOOL)isChatBot;
- (BOOL)isSpam;
- (NSArray)showingEditHistoryForChatItemGUIDs;
- (NSUUID)activeTelephonyConversationUUID;
- (id)_copyWithClass:(Class)a3 zone:(_NSZone *)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)filterCategory;
- (int64_t)serviceType;
@end

@implementation IMChatContext

- (id)_copyWithClass:(Class)a3 zone:(_NSZone *)a4
{
  uint64_t v8 = objc_opt_class();
  if ((objc_msgSend_isSubclassOfClass_(a3, v9, v8, v10) & 1) == 0)
  {
    v48 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v11, v12, v13);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v48, v49, (uint64_t)a2, (uint64_t)self, @"IMChatContext.m", 43, @"Invalid parameter not satisfying: %@", @"[cls isSubclassOfClass:[IMChatContext class]]");
  }
  v14 = objc_msgSend_allocWithZone_(a3, v11, (uint64_t)a4, v13);
  uint64_t v18 = objc_msgSend_init(v14, v15, v16, v17);
  *(void *)(v18 + 8) = objc_msgSend_serviceType(self, v19, v20, v21);
  *(void *)(v18 + 16) = objc_msgSend_filterCategory(self, v22, v23, v24);
  *(unsigned char *)(v18 + 24) = objc_msgSend_isSpam(self, v25, v26, v27);
  *(unsigned char *)(v18 + 25) = objc_msgSend_areSendersUnknown(self, v28, v29, v30);
  *(unsigned char *)(v18 + 26) = objc_msgSend_hasResponded(self, v31, v32, v33);
  uint64_t v37 = objc_msgSend_activeTelephonyConversationUUID(self, v34, v35, v36);
  v38 = *(void **)(v18 + 32);
  *(void *)(v18 + 32) = v37;

  uint64_t v42 = objc_msgSend_showingEditHistoryForChatItemGUIDs(self, v39, v40, v41);
  v43 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v42;

  *(unsigned char *)(v18 + 48) = objc_msgSend_isChatBot(self, v44, v45, v46);
  return (id)v18;
}

- (id)description
{
  uint64_t v40 = NSString;
  uint64_t v39 = objc_opt_class();
  uint64_t v6 = objc_msgSend_serviceType(self, v3, v4, v5);
  uint64_t v10 = objc_msgSend_filterCategory(self, v7, v8, v9);
  if (objc_msgSend_isSpam(self, v11, v12, v13)) {
    uint64_t v17 = @"YES";
  }
  else {
    uint64_t v17 = @"NO";
  }
  if (objc_msgSend_areSendersUnknown(self, v14, v15, v16)) {
    uint64_t v21 = @"YES";
  }
  else {
    uint64_t v21 = @"NO";
  }
  if (objc_msgSend_hasResponded(self, v18, v19, v20)) {
    v25 = @"YES";
  }
  else {
    v25 = @"NO";
  }
  uint64_t v26 = objc_msgSend_activeTelephonyConversationUUID(self, v22, v23, v24);
  uint64_t v30 = objc_msgSend_UUIDString(v26, v27, v28, v29);
  if (objc_msgSend_isChatBot(self, v31, v32, v33)) {
    uint64_t v36 = @"YES";
  }
  else {
    uint64_t v36 = @"NO";
  }
  uint64_t v37 = objc_msgSend_stringWithFormat_(v40, v34, @"<%@, serviceType: %lu, filterCategory: %tu, spam: %@, sendersUnknown: %@, responded: %@, activeTelephonyConversationUUID: %@, isChatBot: %@>", v35, v39, v6, v10, v17, v21, v25, v30, v36);

  return v37;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();

  return (id)MEMORY[0x1F4181798](self, sel__copyWithClass_zone_, v5, a3);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();

  return (id)MEMORY[0x1F4181798](self, sel__copyWithClass_zone_, v5, a3);
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (int64_t)filterCategory
{
  return self->_filterCategory;
}

- (BOOL)isSpam
{
  return self->_spam;
}

- (BOOL)areSendersUnknown
{
  return self->_sendersUnknown;
}

- (BOOL)hasResponded
{
  return self->_responded;
}

- (NSUUID)activeTelephonyConversationUUID
{
  return self->_activeTelephonyConversationUUID;
}

- (NSArray)showingEditHistoryForChatItemGUIDs
{
  return self->_showingEditHistoryForChatItemGUIDs;
}

- (BOOL)isChatBot
{
  return self->_isChatBot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showingEditHistoryForChatItemGUIDs, 0);

  objc_storeStrong((id *)&self->_activeTelephonyConversationUUID, 0);
}

@end