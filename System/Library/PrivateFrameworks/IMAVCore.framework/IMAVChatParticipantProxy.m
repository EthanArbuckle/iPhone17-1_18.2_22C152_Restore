@interface IMAVChatParticipantProxy
- (BOOL)_inviteDelivered;
- (BOOL)isLocalParticipant;
- (IMAVChat)avChat;
- (IMAVChatParticipantProxy)initWithDictionary:(id)a3 chat:(id)a4;
- (NSString)name;
- (void)forwardInvocation:(id)a3;
@end

@implementation IMAVChatParticipantProxy

- (IMAVChatParticipantProxy)initWithDictionary:(id)a3 chat:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IMAVChatParticipantProxy;
  v9 = [(IMAVChatParticipantProxy *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_info, a3);
    objc_storeStrong((id *)&v10->_chat, a4);
  }

  return v10;
}

- (IMAVChat)avChat
{
  return (IMAVChat *)self->_chat;
}

- (NSString)name
{
  return (NSString *)objc_msgSend_objectForKey_(self->_info, a2, @"Name", v2, v3);
}

- (BOOL)_inviteDelivered
{
  v4 = objc_msgSend_objectForKey_(self->_info, a2, @"IsInvitationDelivered", v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (BOOL)isLocalParticipant
{
  v4 = objc_msgSend_objectForKey_(self->_info, a2, @"IsLocalParticipant", v2, v3);
  char v9 = objc_msgSend_BOOLValue(v4, v5, v6, v7, v8);

  return v9;
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = sub_224FB12A0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    char v9 = (const char *)objc_msgSend_selector(v3, v5, v6, v7, v8);
    v10 = NSStringFromSelector(v9);
    int v11 = 138412290;
    objc_super v12 = v10;
    _os_log_impl(&dword_224F93000, v4, OS_LOG_TYPE_DEFAULT, "[WARN] ********** IMAVChatParticipantProxy does not respond to selector %@, please file a radar **********", (uint8_t *)&v11, 0xCu);
  }
  IMLogBacktrace();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chat, 0);
  objc_storeStrong((id *)&self->_info, 0);
}

@end