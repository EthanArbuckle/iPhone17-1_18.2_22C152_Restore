@interface IMAggregateAttachmentMessagePartChatItem
- (BOOL)isAttachmentContiguousWithChatItem:(id)a3;
- (BOOL)supportsSuggestedActionsMenu;
- (NSArray)aggregateAttachmentParts;
- (NSArray)transferGUIDs;
- (id)_initWithItem:(id)a3 text:(id)a4 index:(int64_t)a5 messagePartRange:(_NSRange)a6 transferGUIDs:(id)a7 chatContext:(id)a8;
- (id)_initWithItem:(id)a3 text:(id)a4 index:(int64_t)a5 messagePartRange:(_NSRange)a6 transferGUIDs:(id)a7 chatContext:(id)a8 visibleAssociatedMessageChatItems:(id)a9;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)replyContextPreviewChatItemForReply:(id)a3 chatContext:(id)a4;
- (void)setAggregateAttachmentParts:(id)a3;
@end

@implementation IMAggregateAttachmentMessagePartChatItem

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)IMAggregateAttachmentMessagePartChatItem;
  v4 = [(IMAttachmentMessagePartChatItem *)&v9 description];
  v7 = objc_msgSend_stringWithFormat_(v3, v5, @"[[%@] transferGUIDs: %@]", v6, v4, self->_transferGUIDs);

  return v7;
}

- (id)replyContextPreviewChatItemForReply:(id)a3 chatContext:(id)a4
{
  id v5 = a3;
  v48 = [IMReplyContextAggregateAttachmentMessagePartChatItem alloc];
  v47 = objc_msgSend__item(self, v6, v7, v8);
  v12 = objc_msgSend_guid(v5, v9, v10, v11);
  uint64_t v16 = objc_msgSend_isFromMe(v5, v13, v14, v15);
  v20 = objc_msgSend_text(self, v17, v18, v19);
  uint64_t v24 = objc_msgSend_index(self, v21, v22, v23);
  uint64_t v28 = objc_msgSend_messagePartRange(self, v25, v26, v27);
  v30 = v29;
  v33 = objc_msgSend_transferGUIDs(self, v29, v31, v32);
  v37 = objc_msgSend_chatContext(self, v34, v35, v36);
  v39 = objc_msgSend__initWithItem_parentItem_replyMessageGUID_replyIsFromMe_text_index_messagePartRange_transferGUIDs_chatContext_(v48, v38, (uint64_t)v47, (uint64_t)v5, v12, v16, v20, v24, v28, v30, v33, v37);

  v43 = objc_msgSend_aggregateAttachmentParts(self, v40, v41, v42);
  objc_msgSend_setAggregateAttachmentParts_(v39, v44, (uint64_t)v43, v45);

  return v39;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t v8 = objc_msgSend__item(self, v5, v6, v7);
  v12 = objc_msgSend_text(self, v9, v10, v11);
  uint64_t v16 = objc_msgSend_index(self, v13, v14, v15);
  uint64_t v20 = objc_msgSend_messagePartRange(self, v17, v18, v19);
  uint64_t v22 = v21;
  transferGUIDs = self->_transferGUIDs;
  uint64_t v26 = objc_msgSend_chatContext(self, v21, v24, v25);
  v30 = objc_msgSend_visibleAssociatedMessageChatItems(self, v27, v28, v29);
  uint64_t v32 = objc_msgSend__initWithItem_text_index_messagePartRange_transferGUIDs_chatContext_visibleAssociatedMessageChatItems_(v4, v31, (uint64_t)v8, (uint64_t)v12, v16, v20, v22, transferGUIDs, v26, v30);

  uint64_t v36 = objc_msgSend_aggregateAttachmentParts(self, v33, v34, v35);
  objc_msgSend_setAggregateAttachmentParts_(v32, v37, (uint64_t)v36, v38);

  return v32;
}

- (BOOL)isAttachmentContiguousWithChatItem:(id)a3
{
  return 0;
}

- (id)_initWithItem:(id)a3 text:(id)a4 index:(int64_t)a5 messagePartRange:(_NSRange)a6 transferGUIDs:(id)a7 chatContext:(id)a8
{
  return (id)objc_msgSend__initWithItem_text_index_messagePartRange_transferGUIDs_chatContext_visibleAssociatedMessageChatItems_(self, a2, (uint64_t)a3, (uint64_t)a4, a5, a6.location, a6.length, a7, a8, 0);
}

- (id)_initWithItem:(id)a3 text:(id)a4 index:(int64_t)a5 messagePartRange:(_NSRange)a6 transferGUIDs:(id)a7 chatContext:(id)a8 visibleAssociatedMessageChatItems:(id)a9
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v15 = a3;
  id v16 = a7;
  id v17 = a8;
  v39.receiver = self;
  v39.super_class = (Class)IMAggregateAttachmentMessagePartChatItem;
  v21 = -[IMMessagePartChatItem _initWithItem:text:index:messagePartRange:visibleAssociatedMessageChatItems:](&v39, sel__initWithItem_text_index_messagePartRange_visibleAssociatedMessageChatItems_, v15, a4, a5, location, length, a9);
  if (v21)
  {
    uint64_t v22 = objc_msgSend_guid(v15, v18, v19, v20);
    uint64_t v23 = (void *)sub_1A4C4EEE8();

    objc_msgSend__setGUID_(v21, v24, (uint64_t)v23, v25);
    uint64_t v29 = objc_msgSend_copy(v16, v26, v27, v28);
    v30 = (void *)v21[26];
    v21[26] = v29;

    objc_msgSend_setChatContext_(v21, v31, (uint64_t)v17, v32);
    uint64_t v36 = (void *)v21[26];
    if (!v36 || !objc_msgSend_count(v36, v33, v34, v35))
    {
      v37 = IMLogHandleForCategory();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
        sub_1A4CB7D74(v21, v37);
      }
    }
  }

  return v21;
}

- (BOOL)supportsSuggestedActionsMenu
{
  return 0;
}

- (NSArray)transferGUIDs
{
  return self->_transferGUIDs;
}

- (NSArray)aggregateAttachmentParts
{
  return self->_aggregateAttachmentParts;
}

- (void)setAggregateAttachmentParts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregateAttachmentParts, 0);

  objc_storeStrong((id *)&self->_transferGUIDs, 0);
}

@end