@interface IMMessageReplyCountChatItem
- (BOOL)replyIsFromMe;
- (IMItem)_parentItem;
- (NSString)replyMessageGUID;
- (id)_initWithItem:(id)a3 parentItem:(id)a4 threadIdentifier:(id)a5 replyMessageGUID:(id)a6 replyIsFromMe:(BOOL)a7 count:(unint64_t)a8 statusItemSequenceNumber:(unint64_t)a9;
- (id)copyWithStatusItemSequenceNumber:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)threadIdentifier;
- (void)set_parentItem:(id)a3;
@end

@implementation IMMessageReplyCountChatItem

- (id)_initWithItem:(id)a3 parentItem:(id)a4 threadIdentifier:(id)a5 replyMessageGUID:(id)a6 replyIsFromMe:(BOOL)a7 count:(unint64_t)a8 statusItemSequenceNumber:(unint64_t)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  v43.receiver = self;
  v43.super_class = (Class)IMMessageReplyCountChatItem;
  v22 = [(IMMessageStatusChatItem *)&v43 _initWithItem:v15 statusType:17 time:0 count:a8 expireStatusType:0 statusItemSequenceNumber:a9];
  if (v22)
  {
    objc_msgSend_guid(v15, v19, v20, v21);
    v23 = BOOL v42 = a7;
    v26 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v24, a9, v25);
    objc_msgSend_stringValue(v26, v27, v28, v29);
    id obj = a6;
    v31 = id v30 = v16;
    v32 = (void *)sub_1A4C4EEE8();

    id v16 = v30;
    objc_msgSend__setGUID_(v22, v33, (uint64_t)v32, v34);
    objc_storeStrong(v22 + 16, a4);
    uint64_t v38 = objc_msgSend_copy(v17, v35, v36, v37);
    id v39 = v22[17];
    v22[17] = (id)v38;

    objc_storeStrong(v22 + 18, obj);
    *((unsigned char *)v22 + 120) = v42;
  }
  return v22;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend_messageItem(self, a2, (uint64_t)a3, v3);
  uint64_t v9 = objc_msgSend_count(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_statusItemSequenceNumber(self, v10, v11, v12);
  id v14 = objc_alloc((Class)objc_opt_class());
  id v16 = objc_msgSend__initWithItem_parentItem_threadIdentifier_replyMessageGUID_replyIsFromMe_count_statusItemSequenceNumber_(v14, v15, (uint64_t)v5, (uint64_t)self->_parentItem, self->_threadIdentifier, self->_replyMessageGUID, self->_replyIsFromMe, v9, v13);

  return v16;
}

- (id)copyWithStatusItemSequenceNumber:(unint64_t)a3
{
  v6 = objc_msgSend_messageItem(self, a2, a3, v3);
  uint64_t v10 = objc_msgSend_count(self, v7, v8, v9);
  id v11 = objc_alloc((Class)objc_opt_class());
  uint64_t v13 = objc_msgSend__initWithItem_parentItem_threadIdentifier_replyMessageGUID_replyIsFromMe_count_statusItemSequenceNumber_(v11, v12, (uint64_t)v6, (uint64_t)self->_parentItem, self->_threadIdentifier, self->_replyMessageGUID, self->_replyIsFromMe, v10, a3);

  return v13;
}

- (IMItem)_parentItem
{
  return self->_parentItem;
}

- (void)set_parentItem:(id)a3
{
}

- (id)threadIdentifier
{
  return self->_threadIdentifier;
}

- (BOOL)replyIsFromMe
{
  return self->_replyIsFromMe;
}

- (NSString)replyMessageGUID
{
  return self->_replyMessageGUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyMessageGUID, 0);
  objc_storeStrong((id *)&self->_threadIdentifier, 0);

  objc_storeStrong((id *)&self->_parentItem, 0);
}

@end