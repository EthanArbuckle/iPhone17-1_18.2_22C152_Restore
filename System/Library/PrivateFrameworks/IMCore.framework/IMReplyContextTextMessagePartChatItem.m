@interface IMReplyContextTextMessagePartChatItem
- (BOOL)canDelete;
- (BOOL)isReplyContextPreview;
- (BOOL)replyIsFromMe;
- (IMItem)_parentItem;
- (NSString)replyMessageGUID;
- (id)_initWithItem:(id)a3 parentItem:(id)a4 replyMessageGUID:(id)a5 replyIsFromMe:(BOOL)a6 text:(id)a7 index:(int64_t)a8 messagePartRange:(_NSRange)a9 subject:(id)a10;
- (id)_initWithItem:(id)a3 parentItem:(id)a4 replyMessageGUID:(id)a5 replyIsFromMe:(BOOL)a6 text:(id)a7 index:(int64_t)a8 messagePartRange:(_NSRange)a9 subject:(id)a10 shouldDisplayLink:(BOOL)a11;
- (void)setReplyIsFromMe:(BOOL)a3;
- (void)setReplyMessageGUID:(id)a3;
- (void)set_parentItem:(id)a3;
@end

@implementation IMReplyContextTextMessagePartChatItem

- (id)_initWithItem:(id)a3 parentItem:(id)a4 replyMessageGUID:(id)a5 replyIsFromMe:(BOOL)a6 text:(id)a7 index:(int64_t)a8 messagePartRange:(_NSRange)a9 subject:(id)a10
{
  BOOL v27 = a6;
  id v15 = a3;
  id v29 = a4;
  id v16 = a5;
  v30.receiver = self;
  v30.super_class = (Class)IMReplyContextTextMessagePartChatItem;
  char v26 = 0;
  v20 = -[IMTextMessagePartChatItem _initWithItem:text:index:messagePartRange:subject:isShowingEditHistory:](&v30, sel__initWithItem_text_index_messagePartRange_subject_isShowingEditHistory_, v15, a7, a8, a9.location, a9.length, a10, v26);
  if (v20)
  {
    v21 = objc_msgSend_guid(v15, v17, v18, v19);
    v22 = (void *)sub_1A4C4EEE8();

    objc_msgSend__setGUID_(v20, v23, (uint64_t)v22, v24);
    objc_storeStrong(v20 + 24, a4);
    *((unsigned char *)v20 + 184) = v28;
    objc_storeStrong(v20 + 25, a5);
  }
  return v20;
}

- (id)_initWithItem:(id)a3 parentItem:(id)a4 replyMessageGUID:(id)a5 replyIsFromMe:(BOOL)a6 text:(id)a7 index:(int64_t)a8 messagePartRange:(_NSRange)a9 subject:(id)a10 shouldDisplayLink:(BOOL)a11
{
  id v16 = a3;
  id obj = a5;
  id v29 = a4;
  id v17 = a5;
  v30.receiver = self;
  v30.super_class = (Class)IMReplyContextTextMessagePartChatItem;
  v21 = [(IMTextMessagePartChatItem *)&v30 _initWithItem:v16 text:a7 index:a8 messagePartRange:a9.location subject:a9.length shouldDisplayLink:a10 isShowingEditHistory:a11];
  if (v21)
  {
    v22 = objc_msgSend_guid(v16, v18, v19, v20);
    v23 = (void *)sub_1A4C4EEE8();

    objc_msgSend__setGUID_(v21, v24, (uint64_t)v23, v25);
    objc_storeStrong(v21 + 24, a4);
    *((unsigned char *)v21 + 184) = a6;
    objc_storeStrong(v21 + 25, obj);
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