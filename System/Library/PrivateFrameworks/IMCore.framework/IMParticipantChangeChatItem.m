@interface IMParticipantChangeChatItem
- (BOOL)failed;
- (BOOL)unattributed;
- (IMHandle)otherHandle;
- (IMHandle)sender;
- (NSUUID)activeTelephonyConversationUUID;
- (id)_initWithItem:(id)a3 sender:(id)a4 otherHandle:(id)a5;
- (id)_initWithItem:(id)a3 sender:(id)a4 otherHandle:(id)a5 context:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)changeType;
- (void)setActiveTelephonyConversationUUID:(id)a3;
@end

@implementation IMParticipantChangeChatItem

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v8 = objc_msgSend__item(self, v5, v6, v7);
  v10 = objc_msgSend__initWithItem_sender_otherHandle_(v4, v9, (uint64_t)v8, (uint64_t)self->_sender, self->_otherHandle);

  return v10;
}

- (int64_t)changeType
{
  id v4 = objc_msgSend__item(self, a2, v2, v3);
  int64_t v8 = objc_msgSend_changeType(v4, v5, v6, v7);

  return v8;
}

- (BOOL)unattributed
{
  id v4 = objc_msgSend__item(self, a2, v2, v3);
  char v8 = objc_msgSend_unattributed(v4, v5, v6, v7);

  return v8;
}

- (id)_initWithItem:(id)a3 sender:(id)a4 otherHandle:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [IMParticipantChangeChatItem alloc];
  v13 = objc_msgSend__initWithItem_sender_otherHandle_context_(v11, v12, (uint64_t)v10, (uint64_t)v9, v8, 0);

  return v13;
}

- (id)_initWithItem:(id)a3 sender:(id)a4 otherHandle:(id)a5 context:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v33.receiver = self;
  v33.super_class = (Class)IMParticipantChangeChatItem;
  v14 = [(IMChatItem *)&v33 _initWithItem:v10];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong(v14 + 8, a4);
    objc_storeStrong(v15 + 9, a5);
    *((unsigned char *)v15 + 56) = objc_msgSend_errorCode(v10, v16, v17, v18) != 0;
    v22 = objc_msgSend_guid(v10, v19, v20, v21);
    v23 = (void *)sub_1A4C4EEE8();

    objc_msgSend__setGUID_(v15, v24, (uint64_t)v23, v25);
    v29 = objc_msgSend_activeTelephonyConversationUUID(v13, v26, v27, v28);
    objc_msgSend_setActiveTelephonyConversationUUID_(v15, v30, (uint64_t)v29, v31);
  }
  return v15;
}

- (IMHandle)sender
{
  return self->_sender;
}

- (IMHandle)otherHandle
{
  return self->_otherHandle;
}

- (NSUUID)activeTelephonyConversationUUID
{
  return self->_activeTelephonyConversationUUID;
}

- (void)setActiveTelephonyConversationUUID:(id)a3
{
}

- (BOOL)failed
{
  return self->_failed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTelephonyConversationUUID, 0);
  objc_storeStrong((id *)&self->_otherHandle, 0);

  objc_storeStrong((id *)&self->_sender, 0);
}

@end