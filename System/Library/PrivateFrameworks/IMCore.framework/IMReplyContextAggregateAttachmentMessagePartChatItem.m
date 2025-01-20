@interface IMReplyContextAggregateAttachmentMessagePartChatItem
- (BOOL)canDelete;
- (BOOL)isReplyContextPreview;
- (BOOL)replyIsFromMe;
- (IMItem)_parentItem;
- (NSString)replyMessageGUID;
- (id)_initWithItem:(id)a3 parentItem:(id)a4 replyMessageGUID:(id)a5 replyIsFromMe:(BOOL)a6 text:(id)a7 index:(int64_t)a8 messagePartRange:(_NSRange)a9 transferGUIDs:(id)a10 chatContext:(id)a11;
- (id)_initWithItem:(id)a3 parentItem:(id)a4 replyMessageGUID:(id)a5 replyIsFromMe:(BOOL)a6 text:(id)a7 index:(int64_t)a8 messagePartRange:(_NSRange)a9 transferGUIDs:(id)a10 chatContext:(id)a11 visibleAssociatedMessageChatItems:(id)a12;
- (void)setReplyIsFromMe:(BOOL)a3;
- (void)setReplyMessageGUID:(id)a3;
- (void)set_parentItem:(id)a3;
@end

@implementation IMReplyContextAggregateAttachmentMessagePartChatItem

- (id)_initWithItem:(id)a3 parentItem:(id)a4 replyMessageGUID:(id)a5 replyIsFromMe:(BOOL)a6 text:(id)a7 index:(int64_t)a8 messagePartRange:(_NSRange)a9 transferGUIDs:(id)a10 chatContext:(id)a11
{
  id v16 = a3;
  id obj = a5;
  id v29 = a4;
  id v17 = a5;
  v30.receiver = self;
  v30.super_class = (Class)IMReplyContextAggregateAttachmentMessagePartChatItem;
  v21 = -[IMAggregateAttachmentMessagePartChatItem _initWithItem:text:index:messagePartRange:transferGUIDs:chatContext:](&v30, sel__initWithItem_text_index_messagePartRange_transferGUIDs_chatContext_, v16, a7, a8, a9.location, a9.length, a10, a11);
  if (v21)
  {
    v22 = objc_msgSend_guid(v16, v18, v19, v20);
    v23 = (void *)sub_1A4C4EEE8();

    objc_msgSend__setGUID_(v21, v24, (uint64_t)v23, v25);
    objc_storeStrong(v21 + 29, a4);
    *((unsigned char *)v21 + 224) = a6;
    objc_storeStrong(v21 + 30, obj);
  }
  return v21;
}

- (id)_initWithItem:(id)a3 parentItem:(id)a4 replyMessageGUID:(id)a5 replyIsFromMe:(BOOL)a6 text:(id)a7 index:(int64_t)a8 messagePartRange:(_NSRange)a9 transferGUIDs:(id)a10 chatContext:(id)a11 visibleAssociatedMessageChatItems:(id)a12
{
  id v16 = a3;
  id obj = a4;
  id v31 = a4;
  id v29 = a5;
  id v17 = a5;
  v32.receiver = self;
  v32.super_class = (Class)IMReplyContextAggregateAttachmentMessagePartChatItem;
  v21 = -[IMAggregateAttachmentMessagePartChatItem _initWithItem:text:index:messagePartRange:transferGUIDs:chatContext:visibleAssociatedMessageChatItems:](&v32, sel__initWithItem_text_index_messagePartRange_transferGUIDs_chatContext_visibleAssociatedMessageChatItems_, v16, a7, a8, a9.location, a9.length, a10, a11, a12);
  if (v21)
  {
    v22 = objc_msgSend_guid(v16, v18, v19, v20);
    v23 = (void *)sub_1A4C4EEE8();

    objc_msgSend__setGUID_(v21, v24, (uint64_t)v23, v25);
    objc_storeStrong(v21 + 29, obj);
    *((unsigned char *)v21 + 224) = a6;
    objc_storeStrong(v21 + 30, v29);
  }
  return v21;
}

- (BOOL)isReplyContextPreview
{
  return 1;
}

- (BOOL)canDelete
{
  return 0;
}

- (IMItem)_parentItem
{
  return self->_parentItem;
}

- (void)set_parentItem:(id)a3
{
}

- (BOOL)replyIsFromMe
{
  return self->_replyIsFromMe;
}

- (void)setReplyIsFromMe:(BOOL)a3
{
  self->_replyIsFromMe = a3;
}

- (NSString)replyMessageGUID
{
  return self->_replyMessageGUID;
}

- (void)setReplyMessageGUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyMessageGUID, 0);

  objc_storeStrong((id *)&self->_parentItem, 0);
}

@end