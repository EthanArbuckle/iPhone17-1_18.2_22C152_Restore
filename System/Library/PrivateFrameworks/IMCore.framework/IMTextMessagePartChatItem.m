@interface IMTextMessagePartChatItem
- (BOOL)canEditMessageText;
- (BOOL)hasSubject;
- (BOOL)isShowingEditHistory;
- (BOOL)shouldDisplayRichLink;
- (BOOL)supportsCommunicationSafety;
- (BOOL)supportsSuggestedActionsMenu;
- (NSAttributedString)subject;
- (NSDate)lastEditDateForMessagePart;
- (id)_initWithItem:(id)a3 text:(id)a4 index:(int64_t)a5 messagePartRange:(_NSRange)a6 subject:(id)a7 isShowingEditHistory:(BOOL)a8;
- (id)_initWithItem:(id)a3 text:(id)a4 index:(int64_t)a5 messagePartRange:(_NSRange)a6 subject:(id)a7 shouldDisplayLink:(BOOL)a8 isShowingEditHistory:(BOOL)a9;
- (id)_initWithItem:(id)a3 text:(id)a4 index:(int64_t)a5 messagePartRange:(_NSRange)a6 subject:(id)a7 visibleAssociatedMessageChatItems:(id)a8 isShowingEditHistory:(BOOL)a9;
- (id)copyWithIsShowingEditHistory:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)messageSummaryInfo;
- (id)replyContextPreviewChatItemForReply:(id)a3 chatContext:(id)a4;
- (unsigned)contentType;
- (void)enumerateEmojiTokensWithBlock:(id)a3;
- (void)setShouldDisplayRichLink:(BOOL)a3;
@end

@implementation IMTextMessagePartChatItem

- (BOOL)shouldDisplayRichLink
{
  v4 = objc_msgSend__item(self, a2, v2, v3);
  char v8 = objc_msgSend_blockingRichLinks(v4, v5, v6, v7) ^ 1;

  return v8;
}

- (void)setShouldDisplayRichLink:(BOOL)a3
{
  BOOL v4 = a3;
  objc_msgSend__item(self, a2, a3, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBlockingRichLinks_(v7, v5, !v4, v6);
}

- (BOOL)supportsSuggestedActionsMenu
{
  return 1;
}

- (BOOL)supportsCommunicationSafety
{
  return 1;
}

- (id)replyContextPreviewChatItemForReply:(id)a3 chatContext:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [IMReplyContextTextMessagePartChatItem alloc];
  v10 = objc_msgSend__item(self, v7, v8, v9);
  v14 = objc_msgSend_guid(v5, v11, v12, v13);
  uint64_t v18 = objc_msgSend_isFromMe(v5, v15, v16, v17);
  v22 = objc_msgSend_text(self, v19, v20, v21);
  uint64_t v26 = objc_msgSend_index(self, v23, v24, v25);
  uint64_t v30 = objc_msgSend_messagePartRange(self, v27, v28, v29);
  v32 = v31;
  v35 = objc_msgSend_subject(self, v31, v33, v34);
  v37 = objc_msgSend__initWithItem_parentItem_replyMessageGUID_replyIsFromMe_text_index_messagePartRange_subject_(v6, v36, (uint64_t)v10, (uint64_t)v5, v14, v18, v22, v26, v30, v32, v35);

  return v37;
}

- (id)description
{
  uint64_t v2 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)IMTextMessagePartChatItem;
  uint64_t v3 = [(IMMessagePartChatItem *)&v9 description];
  BOOL v4 = IMLoggingStringForMessageData();
  id v7 = objc_msgSend_stringWithFormat_(v2, v5, @"[[%@] subject: %@]", v6, v3, v4);

  return v7;
}

- (BOOL)canEditMessageText
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend__item(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_index(self, v6, v7, v8);
  uint64_t v11 = objc_msgSend_eligibilityForEditType_messagePartIndex_(v5, v10, 1, v9);
  uint64_t v15 = v11;
  if ((unint64_t)(v11 - 1) >= 8)
  {
    if (!v11 && IMOSLoggingEnabled())
    {
      v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        int v25 = 134217984;
        uint64_t v26 = 0;
        _os_log_impl(&dword_1A4AF7000, v19, OS_LOG_TYPE_INFO, "Message can be edited, message edit eligibility is %ld", (uint8_t *)&v25, 0xCu);
      }
    }
    uint64_t v20 = objc_msgSend_subject(self, v12, v13, v14);
    BOOL v24 = objc_msgSend_length(v20, v21, v22, v23) == 0;

    if (v24)
    {
      BOOL v17 = 1;
      goto LABEL_7;
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        LOWORD(v25) = 0;
        _os_log_impl(&dword_1A4AF7000, v16, OS_LOG_TYPE_INFO, "Message text cannot be edited, message has a subject", (uint8_t *)&v25, 2u);
      }
      goto LABEL_5;
    }
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v25 = 134217984;
      uint64_t v26 = v15;
      _os_log_impl(&dword_1A4AF7000, v16, OS_LOG_TYPE_INFO, "Message cannot be edited. Edit Eligibility: %ld", (uint8_t *)&v25, 0xCu);
    }
LABEL_5:
  }
  BOOL v17 = 0;
LABEL_7:

  return v17;
}

- (void)enumerateEmojiTokensWithBlock:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_subject(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_string(v8, v9, v10, v11);

  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  if (objc_msgSend_length(v12, v13, v14, v15))
  {
    uint64_t v19 = objc_msgSend_length(v12, v16, v17, v18);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = sub_1A4B9DB98;
    v34[3] = &unk_1E5B7CA18;
    id v35 = v4;
    v36 = &v37;
    objc_msgSend__enumerateEmojiTokensInRange_block_(v12, v20, 0, v19, v34);
  }
  if (!*((unsigned char *)v38 + 24))
  {
    uint64_t v21 = objc_msgSend_text(self, v16, v17, v18);
    int v25 = objc_msgSend_string(v21, v22, v23, v24);

    uint64_t v29 = objc_msgSend_length(v25, v26, v27, v28);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = sub_1A4B9DC04;
    v31[3] = &unk_1E5B7CA18;
    id v32 = v4;
    uint64_t v33 = &v37;
    objc_msgSend__enumerateEmojiTokensInRange_block_(v25, v30, 0, v29, v31);
  }
  _Block_object_dispose(&v37, 8);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t v8 = objc_msgSend__item(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_text(self, v9, v10, v11);
  uint64_t v16 = objc_msgSend_index(self, v13, v14, v15);
  uint64_t v20 = objc_msgSend_messagePartRange(self, v17, v18, v19);
  uint64_t v22 = v21;
  subject = self->_subject;
  uint64_t v26 = objc_msgSend_visibleAssociatedMessageChatItems(self, v21, v24, v25);
  char isShowingEditHistory = objc_msgSend_isShowingEditHistory(self, v27, v28, v29);
  v31 = objc_msgSend__initWithItem_text_index_messagePartRange_subject_visibleAssociatedMessageChatItems_isShowingEditHistory_(v4, v30, (uint64_t)v8, (uint64_t)v12, v16, v20, v22, subject, v26, isShowingEditHistory);

  return v31;
}

- (id)copyWithIsShowingEditHistory:(BOOL)a3
{
  id result = (id)objc_msgSend_copy(self, a2, a3, v3);
  *((unsigned char *)result + 168) = a3;
  return result;
}

- (id)_initWithItem:(id)a3 text:(id)a4 index:(int64_t)a5 messagePartRange:(_NSRange)a6 subject:(id)a7 shouldDisplayLink:(BOOL)a8 isShowingEditHistory:(BOOL)a9
{
  char isShowingEditHistory = objc_msgSend__initWithItem_text_index_messagePartRange_subject_isShowingEditHistory_(self, a2, (uint64_t)a3, (uint64_t)a4, a5, a6.location, a6.length, a7, a9);
  uint64_t v12 = isShowingEditHistory;
  if (isShowingEditHistory) {
    objc_msgSend_setShouldDisplayRichLink_(isShowingEditHistory, v10, a8, v11);
  }
  return v12;
}

- (id)_initWithItem:(id)a3 text:(id)a4 index:(int64_t)a5 messagePartRange:(_NSRange)a6 subject:(id)a7 isShowingEditHistory:(BOOL)a8
{
  return (id)objc_msgSend__initWithItem_text_index_messagePartRange_subject_visibleAssociatedMessageChatItems_isShowingEditHistory_(self, a2, (uint64_t)a3, (uint64_t)a4, a5, a6.location, a6.length, a7, 0, a8);
}

- (id)_initWithItem:(id)a3 text:(id)a4 index:(int64_t)a5 messagePartRange:(_NSRange)a6 subject:(id)a7 visibleAssociatedMessageChatItems:(id)a8 isShowingEditHistory:(BOOL)a9
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v15 = a7;
  v23.receiver = self;
  v23.super_class = (Class)IMTextMessagePartChatItem;
  uint64_t v19 = -[IMMessagePartChatItem _initWithItem:text:index:messagePartRange:visibleAssociatedMessageChatItems:](&v23, sel__initWithItem_text_index_messagePartRange_visibleAssociatedMessageChatItems_, a3, a4, a5, location, length, a8);
  if (v19)
  {
    uint64_t v20 = objc_msgSend_copy(v15, v16, v17, v18);
    uint64_t v21 = (void *)v19[22];
    v19[22] = v20;

    *((unsigned char *)v19 + 168) = a9;
  }

  return v19;
}

- (BOOL)hasSubject
{
  return objc_msgSend_length(self->_subject, a2, v2, v3) != 0;
}

- (NSDate)lastEditDateForMessagePart
{
  id v5 = objc_msgSend__item(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_index(self, v6, v7, v8);
  uint64_t v12 = objc_msgSend_historyForMessagePart_(v5, v10, v9, v11);
  uint64_t v16 = objc_msgSend_lastObject(v12, v13, v14, v15);
  uint64_t v20 = objc_msgSend_dateSent(v16, v17, v18, v19);

  return (NSDate *)v20;
}

- (NSAttributedString)subject
{
  return self->_subject;
}

- (BOOL)isShowingEditHistory
{
  return self->_isShowingEditHistory;
}

- (void).cxx_destruct
{
}

- (unsigned)contentType
{
  return 1;
}

- (id)messageSummaryInfo
{
  id v5 = objc_msgSend_subject(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_string(v5, v6, v7, v8);

  uint64_t v13 = objc_msgSend_text(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_string(v13, v14, v15, v16);

  if (v9 && v17)
  {
    objc_msgSend_stringWithFormat_(NSString, v18, @"%@ %@", v20, v9, v17);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
    uint64_t v22 = v21;
    goto LABEL_9;
  }
  if (v9)
  {
    id v21 = v9;
    goto LABEL_8;
  }
  if (v17)
  {
    id v21 = v17;
    goto LABEL_8;
  }
  uint64_t v22 = 0;
LABEL_9:
  objc_super v23 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v24 = objc_msgSend_contentType(self, v18, v19, v20);
  uint64_t v28 = objc_msgSend_text(self, v25, v26, v27);
  uint64_t v30 = objc_msgSend_dictionaryWithAssociatedMessageSummary_contentType_associatedMessagePartText_pluginBundleID_pluginDisplayName_(v23, v29, (uint64_t)v22, v24, v28, 0, 0);

  return v30;
}

@end