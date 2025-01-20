@interface IMOrganicAttachmentMessagePartChatItem
- (BOOL)isAttachmentContiguousWithChatItem:(id)a3;
- (BOOL)supportsSuggestedActionsMenu;
- (id)_initWithAttachmentMessagePartChatItem:(id)a3;
- (id)layoutGroupIdentifier;
@end

@implementation IMOrganicAttachmentMessagePartChatItem

- (id)_initWithAttachmentMessagePartChatItem:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend__item(v4, v5, v6, v7);
  v12 = objc_msgSend_text(v4, v9, v10, v11);
  uint64_t v16 = objc_msgSend_index(v4, v13, v14, v15);
  uint64_t v20 = objc_msgSend_messagePartRange(v4, v17, v18, v19);
  v22 = v21;
  v25 = objc_msgSend_transferGUID(v4, v21, v23, v24);
  v29 = objc_msgSend_chatContext(v4, v26, v27, v28);
  v33 = objc_msgSend_visibleAssociatedMessageChatItems(v4, v30, v31, v32);

  v35 = objc_msgSend__initWithItem_text_index_messagePartRange_transferGUID_chatContext_visibleAssociatedMessageChatItems_(self, v34, (uint64_t)v8, (uint64_t)v12, v16, v20, v22, v25, v29, v33);
  return v35;
}

- (id)layoutGroupIdentifier
{
  id v4 = objc_msgSend__item(self, a2, v2, v3);
  v8 = objc_msgSend_guid(v4, v5, v6, v7);

  return v8;
}

- (BOOL)isAttachmentContiguousWithChatItem:(id)a3
{
  return 0;
}

- (BOOL)supportsSuggestedActionsMenu
{
  return 0;
}

@end