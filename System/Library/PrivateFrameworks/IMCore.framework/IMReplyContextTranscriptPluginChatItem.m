@interface IMReplyContextTranscriptPluginChatItem
- (BOOL)canDelete;
- (BOOL)isReplyContextPreview;
- (BOOL)replyIsFromMe;
- (IMItem)_parentItem;
- (IMMessageItem)messageItem;
- (NSString)replyMessageGUID;
- (id)_initWithItem:(id)a3 parentItem:(id)a4 replyMessageGUID:(id)a5 replyIsFromMe:(BOOL)a6 initialPayload:(id)a7 index:(int64_t)a8 messagePartRange:(_NSRange)a9 parentChatHasKnownParticipants:(BOOL)a10 chatContext:(id)a11;
- (void)setReplyIsFromMe:(BOOL)a3;
- (void)setReplyMessageGUID:(id)a3;
- (void)set_parentItem:(id)a3;
@end

@implementation IMReplyContextTranscriptPluginChatItem

- (id)_initWithItem:(id)a3 parentItem:(id)a4 replyMessageGUID:(id)a5 replyIsFromMe:(BOOL)a6 initialPayload:(id)a7 index:(int64_t)a8 messagePartRange:(_NSRange)a9 parentChatHasKnownParticipants:(BOOL)a10 chatContext:(id)a11
{
  id v16 = a3;
  id v33 = a4;
  id obj = a5;
  id v17 = a5;
  id v18 = a11;
  v34.receiver = self;
  v34.super_class = (Class)IMReplyContextTranscriptPluginChatItem;
  v22 = -[IMTranscriptPluginChatItem _initWithItem:initialPayload:index:messagePartRange:parentChatHasKnownParticipants:](&v34, sel__initWithItem_initialPayload_index_messagePartRange_parentChatHasKnownParticipants_, v16, a7, a8, a9.location, a9.length, a10);
  if (v22)
  {
    v23 = objc_msgSend_guid(v16, v19, v20, v21);
    v24 = (void *)sub_1A4C4EEE8();

    objc_msgSend__setGUID_(v22, v25, (uint64_t)v24, v26);
    objc_msgSend_setChatContext_(v22, v27, (uint64_t)v18, v28);
    objc_storeStrong(v22 + 27, a4);
    *((unsigned char *)v22 + 200) = a6;
    objc_storeStrong(v22 + 28, obj);
    objc_storeStrong(v22 + 26, a3);
  }
  return v22;
}

- (BOOL)isReplyContextPreview
{
  return 1;
}

- (BOOL)canDelete
{
  return 0;
}

- (IMMessageItem)messageItem
{
  return self->_messageItem;
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

  objc_storeStrong((id *)&self->_messageItem, 0);
}

@end