@interface IMSyndicationStatusChatItem
- (BOOL)isEqual:(id)a3;
- (BOOL)wasDetectedAsSWYSpam;
- (NSString)swyAppName;
- (NSString)swyBundleID;
- (id)_initWithItem:(id)a3 withSyndicationStatus:(int64_t)a4 statusItemSequenceNumber:(unint64_t)a5;
- (id)copyWithStatusItemSequenceNumber:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)syndicationStatus;
@end

@implementation IMSyndicationStatusChatItem

- (id)_initWithItem:(id)a3 withSyndicationStatus:(int64_t)a4 statusItemSequenceNumber:(unint64_t)a5
{
  id v8 = a3;
  v25.receiver = self;
  v25.super_class = (Class)IMSyndicationStatusChatItem;
  v9 = [(IMMessageStatusChatItem *)&v25 _initWithItem:v8 statusType:20 time:0 count:0 expireStatusType:0 statusItemSequenceNumber:a5];
  v13 = v9;
  if (v9)
  {
    v9[18] = a4;
    *((unsigned char *)v9 + 120) = objc_msgSend_wasDetectedAsSWYSpam(v8, v10, v11, v12);
    uint64_t v17 = objc_msgSend_swyAppName(v8, v14, v15, v16);
    v18 = (void *)v13[16];
    v13[16] = v17;

    uint64_t v22 = objc_msgSend_swyBundleID(v8, v19, v20, v21);
    v23 = (void *)v13[17];
    v13[17] = v22;
  }
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (IMSyndicationStatusChatItem *)a3;
  if (v4 == self)
  {
    unsigned __int8 v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t syndicationStatus = self->_syndicationStatus;
      unsigned __int8 v9 = syndicationStatus == objc_msgSend_syndicationStatus(v4, v5, v6, v7);
    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)IMSyndicationStatusChatItem;
      unsigned __int8 v9 = [(IMTranscriptChatItem *)&v11 isEqual:v4];
    }
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend_messageItem(self, a2, (uint64_t)a3, v3);
  uint64_t v9 = objc_msgSend_statusItemSequenceNumber(self, v6, v7, v8);
  id v10 = objc_alloc((Class)objc_opt_class());
  uint64_t v12 = objc_msgSend__initWithItem_withSyndicationStatus_statusItemSequenceNumber_(v10, v11, (uint64_t)v5, self->_syndicationStatus, v9);

  return v12;
}

- (id)copyWithStatusItemSequenceNumber:(unint64_t)a3
{
  uint64_t v6 = objc_msgSend_messageItem(self, a2, a3, v3);
  id v7 = objc_alloc((Class)objc_opt_class());
  uint64_t v9 = objc_msgSend__initWithItem_withSyndicationStatus_statusItemSequenceNumber_(v7, v8, (uint64_t)v6, self->_syndicationStatus, a3);

  return v9;
}

- (NSString)swyAppName
{
  return self->_swyAppName;
}

- (NSString)swyBundleID
{
  return self->_swyBundleID;
}

- (int64_t)syndicationStatus
{
  return self->_syndicationStatus;
}

- (BOOL)wasDetectedAsSWYSpam
{
  return self->_wasDetectedAsSWYSpam;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swyBundleID, 0);

  objc_storeStrong((id *)&self->_swyAppName, 0);
}

@end