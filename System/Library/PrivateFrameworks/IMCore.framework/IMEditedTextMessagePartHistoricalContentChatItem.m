@interface IMEditedTextMessagePartHistoricalContentChatItem
- (BOOL)canDelete;
- (BOOL)canEditMessageText;
- (BOOL)canReply;
- (BOOL)canRetract;
- (BOOL)isEditedMessageHistory;
- (IMMessagePartHistoricalContent)historicalContent;
- (id)_initWithMessageItem:(id)a3 messagePartIndex:(int64_t)a4 historicalContent:(id)a5 editIndex:(int64_t)a6 messagePartRange:(_NSRange)a7 subject:(id)a8;
@end

@implementation IMEditedTextMessagePartHistoricalContentChatItem

- (id)_initWithMessageItem:(id)a3 messagePartIndex:(int64_t)a4 historicalContent:(id)a5 editIndex:(int64_t)a6 messagePartRange:(_NSRange)a7 subject:(id)a8
{
  NSUInteger length = a7.length;
  NSUInteger location = a7.location;
  id v14 = a3;
  id v15 = a5;
  id v16 = a8;
  v20 = objc_msgSend_messagePartText(v15, v17, v18, v19);
  v45.receiver = self;
  v45.super_class = (Class)IMEditedTextMessagePartHistoricalContentChatItem;
  char v44 = 1;
  v21 = -[IMTextMessagePartChatItem _initWithItem:text:index:messagePartRange:subject:isShowingEditHistory:](&v45, sel__initWithItem_text_index_messagePartRange_subject_isShowingEditHistory_, v14, v20, a4, location, length, v16, v44);

  if (v21)
  {
    objc_storeStrong(v21 + 23, a5);
    v25 = objc_msgSend_guid(v14, v22, v23, v24);
    v28 = objc_msgSend_numberWithInteger_(NSNumber, v26, a4, v27);
    v32 = objc_msgSend_stringValue(v28, v29, v30, v31);
    v35 = objc_msgSend_numberWithInteger_(NSNumber, v33, a6, v34);
    v39 = objc_msgSend_stringValue(v35, v36, v37, v38);
    v40 = (void *)sub_1A4C4EEE8();

    objc_msgSend__setGUID_(v21, v41, (uint64_t)v40, v42);
  }

  return v21;
}

- (BOOL)isEditedMessageHistory
{
  return 1;
}

- (BOOL)canDelete
{
  return 0;
}

- (BOOL)canReply
{
  return 0;
}

- (BOOL)canEditMessageText
{
  return 0;
}

- (BOOL)canRetract
{
  return 0;
}

- (IMMessagePartHistoricalContent)historicalContent
{
  return self->_historicalContent;
}

- (void).cxx_destruct
{
}

@end