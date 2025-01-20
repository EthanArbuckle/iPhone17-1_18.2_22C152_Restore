@interface IMMessageStatusChatItem
- (BOOL)isFromMe;
- (BOOL)isStewie;
- (NSDate)time;
- (NSDate)timeAdded;
- (NSDate)timeStale;
- (NSString)description;
- (NSString)errorText;
- (NSString)recipientDisplayName;
- (id)_initWithItem:(id)a3 expireStatusType:(int64_t)a4 count:(unint64_t)a5 statusItemSequenceNumber:(unint64_t)a6;
- (id)_initWithItem:(id)a3 statusType:(int64_t)a4 time:(id)a5 count:(unint64_t)a6 expireStatusType:(int64_t)a7 statusItemSequenceNumber:(unint64_t)a8;
- (id)_initWithItem:(id)a3 statusType:(int64_t)a4 time:(id)a5 count:(unint64_t)a6 statusItemSequenceNumber:(unint64_t)a7;
- (id)_timeAdded;
- (id)_timeStale;
- (id)copyWithStatusItemSequenceNumber:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)expireStatusType;
- (int64_t)messageStatusType;
- (int64_t)statusType;
- (unint64_t)count;
- (unint64_t)statusItemSequenceNumber;
- (void)_setTimeAdded:(id)a3;
- (void)setRecipientDisplayName:(id)a3;
@end

@implementation IMMessageStatusChatItem

- (NSString)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)IMMessageStatusChatItem;
  v4 = [(IMTranscriptChatItem *)&v9 description];
  v7 = objc_msgSend_stringWithFormat_(v3, v5, @"[[%@] statusType: %d expireStatusType: %d]", v6, v4, self->_statusType, self->_expireStatusType);

  return (NSString *)v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend_messageItem(self, a2, (uint64_t)a3, v3);
  id v6 = objc_alloc((Class)objc_opt_class());
  v8 = objc_msgSend__initWithItem_statusType_time_count_expireStatusType_statusItemSequenceNumber_(v6, v7, (uint64_t)v5, self->_statusType, self->_time, self->_count, self->_expireStatusType, self->_statusItemSequenceNumber);

  return v8;
}

- (id)copyWithStatusItemSequenceNumber:(unint64_t)a3
{
  id v6 = objc_msgSend_messageItem(self, a2, a3, v3);
  id v7 = objc_alloc((Class)objc_opt_class());
  objc_super v9 = objc_msgSend__initWithItem_statusType_time_count_expireStatusType_statusItemSequenceNumber_(v7, v8, (uint64_t)v6, self->_statusType, self->_time, self->_count, self->_expireStatusType, a3);

  return v9;
}

- (id)_timeStale
{
  timeStale = self->_timeStale;
  if (!timeStale)
  {
    id v6 = objc_msgSend__item(self, a2, v2, v3);
    v10 = v6;
    if (self->_expireStatusType == 2)
    {
      if (!objc_msgSend_isFromMe(v6, v7, v8, v9))
      {
        v18 = objc_msgSend_timePlayed(v10, v11, v12, v13);
        if (v18)
        {
          id v19 = objc_alloc(MEMORY[0x1E4F1C9C8]);
          v22 = (NSDate *)objc_msgSend_initWithTimeInterval_sinceDate_(v19, v20, (uint64_t)v18, v21, 3.0);
          v23 = self->_timeStale;
          self->_timeStale = v22;
        }
        goto LABEL_8;
      }
      if (self->_timeAdded)
      {
        id v14 = objc_alloc(MEMORY[0x1E4F1C9C8]);
        v17 = (NSDate *)objc_msgSend_initWithTimeInterval_sinceDate_(v14, v15, (uint64_t)self->_timeAdded, v16, 3.0);
        v18 = self->_timeStale;
        self->_timeStale = v17;
LABEL_8:
      }
    }

    timeStale = self->_timeStale;
  }

  return timeStale;
}

- (id)_timeAdded
{
  return self->_timeAdded;
}

- (void)_setTimeAdded:(id)a3
{
  v5 = (NSDate *)a3;
  p_timeAdded = &self->_timeAdded;
  if (self->_timeAdded != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_timeAdded, a3);
    timeStale = self->_timeStale;
    self->_timeStale = 0;

    v5 = v8;
  }

  MEMORY[0x1F41817F8](p_timeAdded, v5);
}

- (BOOL)isFromMe
{
  v4 = objc_msgSend__item(self, a2, v2, v3);
  char v8 = objc_msgSend_isFromMe(v4, v5, v6, v7);

  return v8;
}

- (BOOL)isStewie
{
  v5 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, v2, v3);
  int v9 = objc_msgSend_stewieEnabled(v5, v6, v7, v8);

  if (!v9) {
    return 0;
  }
  uint64_t v13 = objc_msgSend__item(self, v10, v11, v12);
  v17 = objc_msgSend_message(v13, v14, v15, v16);
  uint64_t v21 = objc_msgSend_subject(v17, v18, v19, v20);
  char isStewie = objc_msgSend_isStewie(v21, v22, v23, v24);

  return isStewie;
}

- (NSString)errorText
{
  v4 = objc_msgSend__item(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_message(v4, v5, v6, v7);

  uint64_t v12 = objc_msgSend_error(v8, v9, v10, v11);
  uint64_t v16 = v12;
  if (v12)
  {
    unint64_t v17 = objc_msgSend_code(v12, v13, v14, v15);
    uint64_t v21 = _NSStringFromIMMessageError(v17);
    if (!v21)
    {
      v22 = NSString;
      uint64_t v23 = objc_msgSend_code(v16, v18, v19, v20);
      uint64_t v21 = objc_msgSend_stringWithFormat_(v22, v24, @"Error %ld", v25, v23);
    }
  }
  else
  {
    uint64_t v21 = 0;
  }

  return (NSString *)v21;
}

- (int64_t)messageStatusType
{
  return self->_statusType;
}

- (id)_initWithItem:(id)a3 statusType:(int64_t)a4 time:(id)a5 count:(unint64_t)a6 statusItemSequenceNumber:(unint64_t)a7
{
  return (id)objc_msgSend__initWithItem_statusType_time_count_expireStatusType_statusItemSequenceNumber_(self, a2, (uint64_t)a3, a4, a5, a6, 0, a7);
}

- (id)_initWithItem:(id)a3 expireStatusType:(int64_t)a4 count:(unint64_t)a5 statusItemSequenceNumber:(unint64_t)a6
{
  return (id)objc_msgSend__initWithItem_statusType_time_count_expireStatusType_statusItemSequenceNumber_(self, a2, (uint64_t)a3, 0, 0, a5, a4, a6);
}

- (id)_initWithItem:(id)a3 statusType:(int64_t)a4 time:(id)a5 count:(unint64_t)a6 expireStatusType:(int64_t)a7 statusItemSequenceNumber:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a5;
  v33.receiver = self;
  v33.super_class = (Class)IMMessageStatusChatItem;
  id v16 = [(IMChatItem *)&v33 _initWithItem:v14];
  unint64_t v17 = v16;
  if (v16)
  {
    *((void *)v16 + 7) = a4;
    objc_storeStrong((id *)v16 + 8, a5);
    v17[10] = a6;
    v17[9] = a7;
    v17[14] = a8;
    uint64_t v21 = objc_msgSend_guid(v14, v18, v19, v20);
    uint64_t v24 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v22, a8, v23);
    v28 = objc_msgSend_stringValue(v24, v25, v26, v27);
    v29 = (void *)sub_1A4C4EEE8();

    objc_msgSend__setGUID_(v17, v30, (uint64_t)v29, v31);
  }

  return v17;
}

- (int64_t)statusType
{
  return self->_statusType;
}

- (NSDate)time
{
  return self->_time;
}

- (int64_t)expireStatusType
{
  return self->_expireStatusType;
}

- (unint64_t)count
{
  return self->_count;
}

- (NSDate)timeAdded
{
  return self->_timeAdded;
}

- (NSDate)timeStale
{
  return self->_timeStale;
}

- (NSString)recipientDisplayName
{
  return self->_recipientDisplayName;
}

- (void)setRecipientDisplayName:(id)a3
{
}

- (unint64_t)statusItemSequenceNumber
{
  return self->_statusItemSequenceNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipientDisplayName, 0);
  objc_storeStrong((id *)&self->_timeStale, 0);
  objc_storeStrong((id *)&self->_timeAdded, 0);

  objc_storeStrong((id *)&self->_time, 0);
}

@end