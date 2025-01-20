@interface IMTUConversationChatItem
- (BOOL)canDelete;
- (BOOL)isFromMe;
- (IMHandle)conversationInitiator;
- (NSDate)time;
- (NSUUID)tuConversationUUID;
- (TUConversation)tuConversation;
- (id)_initWithItem:(id)a3 conversationInitiator:(id)a4;
- (id)activeCall;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)conversationAVMode;
- (unint64_t)index;
@end

@implementation IMTUConversationChatItem

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v8 = objc_msgSend__item(self, v5, v6, v7);
  v10 = objc_msgSend__initWithItem_conversationInitiator_(v4, v9, (uint64_t)v8, (uint64_t)self->_conversationInitiator);

  return v10;
}

- (id)_initWithItem:(id)a3 conversationInitiator:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)IMTUConversationChatItem;
  v8 = [(IMChatItem *)&v19 _initWithItem:v6];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(v8 + 7, a4);
    v13 = objc_msgSend_guid(v6, v10, v11, v12);
    v14 = (void *)sub_1A4C4EEE8();

    if (IMOSLoggingEnabled())
    {
      v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v21 = v14;
        __int16 v22 = 2112;
        id v23 = v6;
        _os_log_impl(&dword_1A4AF7000, v17, OS_LOG_TYPE_INFO, "Creating new IMTranscriptChatItem with GUID %@ from IMTUConversationItem %@", buf, 0x16u);
      }
    }
    objc_msgSend__setGUID_(v9, v15, (uint64_t)v14, v16);
  }
  return v9;
}

- (id)activeCall
{
  v5 = objc_msgSend_sharedRegistry(IMChatRegistry, a2, v2, v3);
  v9 = objc_msgSend_tuConversationUUID(self, v6, v7, v8);
  uint64_t v12 = objc_msgSend_activeCallForConversationUUID_(v5, v10, (uint64_t)v9, v11);

  return v12;
}

- (NSUUID)tuConversationUUID
{
  id v3 = objc_alloc(MEMORY[0x1E4F29128]);
  uint64_t v7 = objc_msgSend__item(self, v4, v5, v6);
  uint64_t v11 = objc_msgSend_guid(v7, v8, v9, v10);
  v14 = objc_msgSend_initWithUUIDString_(v3, v12, (uint64_t)v11, v13);

  return (NSUUID *)v14;
}

- (TUConversation)tuConversation
{
  uint64_t v5 = objc_msgSend_sharedRegistry(IMChatRegistry, a2, v2, v3);
  uint64_t v9 = objc_msgSend_tuConversationUUID(self, v6, v7, v8);
  uint64_t v12 = objc_msgSend_existingConversationForFaceTimeConversationUUID_(v5, v10, (uint64_t)v9, v11);

  return (TUConversation *)v12;
}

- (BOOL)isFromMe
{
  id v4 = objc_msgSend__item(self, a2, v2, v3);
  char v8 = objc_msgSend_isFromMe(v4, v5, v6, v7);

  return v8;
}

- (NSDate)time
{
  id v4 = objc_msgSend__item(self, a2, v2, v3);
  char v8 = objc_msgSend_time(v4, v5, v6, v7);

  return (NSDate *)v8;
}

- (BOOL)canDelete
{
  return 1;
}

- (unint64_t)conversationAVMode
{
  id v4 = objc_msgSend__item(self, a2, v2, v3);
  unint64_t v8 = objc_msgSend_avMode(v4, v5, v6, v7);

  return v8;
}

- (IMHandle)conversationInitiator
{
  return self->_conversationInitiator;
}

- (unint64_t)index
{
  return self->_index;
}

- (void).cxx_destruct
{
}

@end