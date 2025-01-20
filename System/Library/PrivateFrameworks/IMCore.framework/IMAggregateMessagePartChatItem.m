@interface IMAggregateMessagePartChatItem
- (BOOL)supportsSuggestedActionsMenu;
- (NSArray)subparts;
- (id)_initWithItem:(id)a3 messagePartRange:(_NSRange)a4 subparts:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)replyContextPreviewChatItemForReply:(id)a3 chatContext:(id)a4;
@end

@implementation IMAggregateMessagePartChatItem

- (id)replyContextPreviewChatItemForReply:(id)a3 chatContext:(id)a4
{
  id v5 = a3;
  v6 = [IMReplyContextAggregateMessagePartChatItem alloc];
  v10 = objc_msgSend__item(self, v7, v8, v9);
  v14 = objc_msgSend_guid(v5, v11, v12, v13);
  uint64_t v18 = objc_msgSend_isFromMe(v5, v15, v16, v17);
  uint64_t v22 = objc_msgSend_messagePartRange(self, v19, v20, v21);
  v24 = v23;
  v27 = objc_msgSend_subparts(self, v23, v25, v26);
  v29 = objc_msgSend__initWithItem_parentItem_replyMessageGUID_replyIsFromMe_messagePartRange_subparts_(v6, v28, (uint64_t)v10, (uint64_t)v5, v14, v18, v22, v24, v27);

  return v29;
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)IMAggregateMessagePartChatItem;
  v4 = [(IMTextMessagePartChatItem *)&v9 description];
  v7 = objc_msgSend_stringWithFormat_(v3, v5, @"[[%@] subparts: %@]", v6, v4, self->_subparts);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t v8 = objc_msgSend__item(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_messagePartRange(self, v9, v10, v11);
  v14 = objc_msgSend__initWithItem_messagePartRange_subparts_(v4, v13, (uint64_t)v8, v12, v13, self->_subparts);

  return v14;
}

- (id)_initWithItem:(id)a3 messagePartRange:(_NSRange)a4 subparts:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  v14 = objc_msgSend_subject(v9, v11, v12, v13);
  if (v14)
  {
    id v15 = objc_alloc(MEMORY[0x1E4F28B18]);
    v19 = objc_msgSend_subject(v9, v16, v17, v18);
    uint64_t v22 = objc_msgSend_initWithString_(v15, v20, (uint64_t)v19, v21);
  }
  else
  {
    uint64_t v22 = 0;
  }

  uint64_t v26 = objc_msgSend_body(v9, v23, v24, v25);
  v41.receiver = self;
  v41.super_class = (Class)IMAggregateMessagePartChatItem;
  v27 = -[IMTextMessagePartChatItem _initWithItem:text:index:messagePartRange:subject:isShowingEditHistory:](&v41, sel__initWithItem_text_index_messagePartRange_subject_isShowingEditHistory_, v9, v26, 0, location, length, v22, 0);

  if (v27)
  {
    v31 = objc_msgSend_guid(v9, v28, v29, v30);
    v32 = (void *)sub_1A4C4EEE8();

    objc_msgSend__setGUID_(v27, v33, (uint64_t)v32, v34);
    uint64_t v38 = objc_msgSend_copy(v10, v35, v36, v37);
    v39 = (void *)v27[23];
    v27[23] = v38;
  }
  return v27;
}

- (BOOL)supportsSuggestedActionsMenu
{
  return 1;
}

- (NSArray)subparts
{
  return self->_subparts;
}

- (void).cxx_destruct
{
}

@end