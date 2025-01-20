@interface IMReplyContextDeletedMessageChatItem
- (BOOL)deletedMessageIsFromMe;
- (BOOL)isFromMe;
- (id)_initWithReplyItem:(id)a3 threadIdentifier:(id)a4 replyMessageGUID:(id)a5 replyIsFromMe:(BOOL)a6 deletedMessageIsFromMe:(BOOL)a7;
- (void)setDeletedMessageIsFromMe:(BOOL)a3;
@end

@implementation IMReplyContextDeletedMessageChatItem

- (id)_initWithReplyItem:(id)a3 threadIdentifier:(id)a4 replyMessageGUID:(id)a5 replyIsFromMe:(BOOL)a6 deletedMessageIsFromMe:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v32.receiver = self;
  v32.super_class = (Class)IMReplyContextDeletedMessageChatItem;
  id v18 = [(IMChatItem *)&v32 _initWithItem:v12];
  if (v18)
  {
    v19 = objc_msgSend_guid(v12, v15, v16, v17);
    v20 = (void *)sub_1A4C4EEE8();

    objc_msgSend__setGUID_(v18, v21, (uint64_t)v20, v22);
    objc_msgSend_set_parentItem_(v18, v23, (uint64_t)v12, v24);
    objc_msgSend_setReplyIsFromMe_(v18, v25, v8, v26);
    objc_msgSend_setDeletedMessageIsFromMe_(v18, v27, v7, v28);
    objc_msgSend_setReplyMessageGUID_(v18, v29, (uint64_t)v14, v30);
  }
  return v18;
}

- (BOOL)isFromMe
{
  return self->_deletedMessageIsFromMe;
}

- (BOOL)deletedMessageIsFromMe
{
  return self->_deletedMessageIsFromMe;
}

- (void)setDeletedMessageIsFromMe:(BOOL)a3
{
  self->_deletedMessageIsFromMe = a3;
}

@end