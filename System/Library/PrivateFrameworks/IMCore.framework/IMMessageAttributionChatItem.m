@interface IMMessageAttributionChatItem
- (BOOL)isCommSafetySensitiveAttribution;
- (BOOL)isEqual:(id)a3;
- (BOOL)showsLearnMoreLink;
- (NSDictionary)attributionInfo;
- (NSString)bundleID;
- (id)_initWithItem:(id)a3 attributionInfo:(id)a4 attributionType:(int64_t)a5 showsLearnMoreLink:(BOOL)a6 statusItemSequenceNumber:(unint64_t)a7;
- (id)copyWithStatusItemSequenceNumber:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)attributionType;
@end

@implementation IMMessageAttributionChatItem

- (id)_initWithItem:(id)a3 attributionInfo:(id)a4 attributionType:(int64_t)a5 showsLearnMoreLink:(BOOL)a6 statusItemSequenceNumber:(unint64_t)a7
{
  id v13 = a4;
  v17.receiver = self;
  v17.super_class = (Class)IMMessageAttributionChatItem;
  v14 = [(IMMessageStatusChatItem *)&v17 _initWithItem:a3 statusType:13 time:0 count:0 expireStatusType:0 statusItemSequenceNumber:a7];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong(v14 + 16, a4);
    v15[17] = (id)a5;
    *((unsigned char *)v15 + 120) = a6;
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (IMMessageAttributionChatItem *)a3;
  if (v5 == self)
  {
    char isEqual = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = v5;
      uint64_t v10 = objc_msgSend_attributionType(self, v7, v8, v9);
      if (v10 != objc_msgSend_attributionType(v6, v11, v12, v13)
        || (int v17 = objc_msgSend_showsLearnMoreLink(self, v14, v15, v16),
            v17 != objc_msgSend_showsLearnMoreLink(v6, v18, v19, v20)))
      {
        char isEqual = 0;
LABEL_15:

        goto LABEL_16;
      }
      v28 = objc_msgSend_attributionInfo(self, v21, v22, v23);
      if (v28
        || (objc_msgSend_attributionInfo(v6, v25, v26, v27), (v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v29 = objc_msgSend_attributionInfo(self, v25, v26, v27);
        v33 = objc_msgSend_attributionInfo(v6, v30, v31, v32);
        char isEqual = objc_msgSend_isEqual_(v29, v34, (uint64_t)v33, v35);

        if (v28)
        {
LABEL_14:

          goto LABEL_15;
        }
      }
      else
      {
        char isEqual = 1;
      }

      goto LABEL_14;
    }
    char isEqual = 0;
  }
LABEL_16:

  return isEqual;
}

- (BOOL)isCommSafetySensitiveAttribution
{
  return objc_msgSend_attributionType(self, a2, v2, v3) == 8
      || objc_msgSend_attributionType(self, v5, v6, v7) == 9
      || objc_msgSend_attributionType(self, v8, v9, v10) == 11;
}

- (NSString)bundleID
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_attributionInfo, a2, *MEMORY[0x1E4F6D3E0], v2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend_messageItem(self, a2, (uint64_t)a3, v3);
  uint64_t v9 = objc_msgSend_statusItemSequenceNumber(self, v6, v7, v8);
  id v10 = objc_alloc((Class)objc_opt_class());
  uint64_t v12 = objc_msgSend__initWithItem_attributionInfo_attributionType_showsLearnMoreLink_statusItemSequenceNumber_(v10, v11, (uint64_t)v5, (uint64_t)self->_attributionInfo, self->_attributionType, self->_showsLearnMoreLink, v9);

  return v12;
}

- (id)copyWithStatusItemSequenceNumber:(unint64_t)a3
{
  uint64_t v6 = objc_msgSend_messageItem(self, a2, a3, v3);
  id v7 = objc_alloc((Class)objc_opt_class());
  uint64_t v9 = objc_msgSend__initWithItem_attributionInfo_attributionType_showsLearnMoreLink_statusItemSequenceNumber_(v7, v8, (uint64_t)v6, (uint64_t)self->_attributionInfo, self->_attributionType, self->_showsLearnMoreLink, a3);

  return v9;
}

- (NSDictionary)attributionInfo
{
  return self->_attributionInfo;
}

- (int64_t)attributionType
{
  return self->_attributionType;
}

- (BOOL)showsLearnMoreLink
{
  return self->_showsLearnMoreLink;
}

- (void).cxx_destruct
{
}

@end