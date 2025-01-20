@interface IMReplyContextAggregateMessagePartChatItem
- (BOOL)canDelete;
- (BOOL)isReplyContextPreview;
- (BOOL)replyIsFromMe;
- (BOOL)supportsSuggestedActionsMenu;
- (IMItem)_parentItem;
- (NSString)replyMessageGUID;
- (id)_initWithItem:(id)a3 parentItem:(id)a4 replyMessageGUID:(id)a5 replyIsFromMe:(BOOL)a6 messagePartRange:(_NSRange)a7 subparts:(id)a8;
- (void)setReplyIsFromMe:(BOOL)a3;
- (void)setReplyMessageGUID:(id)a3;
- (void)set_parentItem:(id)a3;
@end

@implementation IMReplyContextAggregateMessagePartChatItem

- (id)_initWithItem:(id)a3 parentItem:(id)a4 replyMessageGUID:(id)a5 replyIsFromMe:(BOOL)a6 messagePartRange:(_NSRange)a7 subparts:(id)a8
{
  NSUInteger length = a7.length;
  NSUInteger location = a7.location;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v26.receiver = self;
  v26.super_class = (Class)IMReplyContextAggregateMessagePartChatItem;
  v20 = -[IMAggregateMessagePartChatItem _initWithItem:messagePartRange:subparts:](&v26, sel__initWithItem_messagePartRange_subparts_, v14, location, length, a8);
  if (v20)
  {
    v21 = objc_msgSend_guid(v14, v17, v18, v19);
    v22 = (void *)sub_1A4C4EEE8();

    objc_msgSend__setGUID_(v20, v23, (uint64_t)v22, v24);
    objc_storeStrong(v20 + 25, a4);
    *((unsigned char *)v20 + 192) = a6;
    objc_storeStrong(v20 + 26, a5);
  }
  return v20;
}

- (BOOL)isReplyContextPreview
{
  return 1;
}

- (BOOL)canDelete
{
  return 0;
}

- (BOOL)supportsSuggestedActionsMenu
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