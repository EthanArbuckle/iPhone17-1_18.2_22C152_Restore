@interface IMMomentShareStatusChatItem
+ (id)_guidForItem:(id)a3;
- (BOOL)_isEqualToGuid:(id)a3 activityTitle:(id)a4 expirationDate:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFromMe;
- (BOOL)wouldBeEqualIfInitializedWithItem:(id)a3 activityTitle:(id)a4 expirationDate:(id)a5;
- (NSDate)expirationDate;
- (NSString)activityTitle;
- (id)_initWithItem:(id)a3 activityTitle:(id)a4 expirationDate:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation IMMomentShareStatusChatItem

+ (id)_guidForItem:(id)a3
{
  v4 = objc_msgSend_guid(a3, a2, (uint64_t)a3, v3);
  v5 = (void *)sub_1A4C4EEE8();

  return v5;
}

- (id)_initWithItem:(id)a3 activityTitle:(id)a4 expirationDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)IMMomentShareStatusChatItem;
  v11 = [(IMChatItem *)&v29 _initWithItem:v8];
  if (v11)
  {
    v12 = objc_opt_class();
    v15 = objc_msgSend__guidForItem_(v12, v13, (uint64_t)v8, v14);
    objc_msgSend__setGUID_(v11, v16, (uint64_t)v15, v17);
    uint64_t v21 = objc_msgSend_copy(v9, v18, v19, v20);
    v22 = (void *)v11[7];
    v11[7] = v21;

    uint64_t v26 = objc_msgSend_copy(v10, v23, v24, v25);
    v27 = (void *)v11[8];
    v11[8] = v26;
  }
  return v11;
}

- (unint64_t)hash
{
  v5 = objc_msgSend_guid(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);

  uint64_t v13 = objc_msgSend_hash(self->_activityTitle, v10, v11, v12) ^ v9;
  return v13 ^ objc_msgSend_hash(self->_expirationDate, v14, v15, v16);
}

- (BOOL)_isEqualToGuid:(id)a3 activityTitle:(id)a4 expirationDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_msgSend_guid(self, v11, v12, v13);
  uint64_t v14 = (NSDate *)(id)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = (NSDate *)v8;
  v18 = v15;
  if (v14 == v15)
  {

    goto LABEL_7;
  }
  if (!v15 || !v14)
  {

    LOBYTE(v20) = 0;
    uint64_t v21 = v14;
    goto LABEL_19;
  }
  int isEqualToString = objc_msgSend_isEqualToString_(v14, v16, (uint64_t)v15, v17);

  if (isEqualToString)
  {
LABEL_7:
    uint64_t v21 = self->_activityTitle;
    v22 = (NSDate *)v9;
    uint64_t v14 = v22;
    if (v21 == v22)
    {

LABEL_14:
      uint64_t v21 = self->_expirationDate;
      uint64_t v25 = (NSDate *)v10;
      uint64_t v14 = v25;
      if (v21 == v25)
      {
        LOBYTE(v20) = 1;
      }
      else
      {
        LOBYTE(v20) = 0;
        if (v25 && v21) {
          LOBYTE(v20) = objc_msgSend_isEqualToDate_(v21, v26, (uint64_t)v25, v27);
        }
      }
      goto LABEL_19;
    }
    LOBYTE(v20) = 0;
    if (v22 && v21)
    {
      int v20 = objc_msgSend_isEqualToString_(v21, v23, (uint64_t)v22, v24);

      if (!v20) {
        goto LABEL_20;
      }
      goto LABEL_14;
    }
LABEL_19:

    goto LABEL_20;
  }
  LOBYTE(v20) = 0;
LABEL_20:

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)IMMomentShareStatusChatItem;
  if ([(IMTranscriptChatItem *)&v20 isEqual:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = objc_msgSend_guid(v4, v5, v6, v7);
    uint64_t v12 = objc_msgSend_activityTitle(v4, v9, v10, v11);
    uint64_t v16 = objc_msgSend_expirationDate(v4, v13, v14, v15);
    char isEqualToGuid_activityTitle_expirationDate = objc_msgSend__isEqualToGuid_activityTitle_expirationDate_(self, v17, (uint64_t)v8, (uint64_t)v12, v16);
  }
  else
  {
    char isEqualToGuid_activityTitle_expirationDate = 0;
  }

  return isEqualToGuid_activityTitle_expirationDate;
}

- (id)description
{
  uint64_t v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)IMMomentShareStatusChatItem;
  id v4 = [(IMTranscriptChatItem *)&v9 description];
  uint64_t v7 = objc_msgSend_stringWithFormat_(v3, v5, @"[[%@] activityTitle: \"%@\", expirationDate: \"%@\"]", v6, v4, self->_activityTitle, self->_expirationDate);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v8 = objc_msgSend__item(self, v5, v6, v7);
  uint64_t v10 = objc_msgSend__initWithItem_activityTitle_expirationDate_(v4, v9, (uint64_t)v8, (uint64_t)self->_activityTitle, self->_expirationDate);

  return v10;
}

- (BOOL)isFromMe
{
  id v4 = objc_msgSend__item(self, a2, v2, v3);
  char v8 = objc_msgSend_isFromMe(v4, v5, v6, v7);

  return v8;
}

- (BOOL)wouldBeEqualIfInitializedWithItem:(id)a3 activityTitle:(id)a4 expirationDate:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = objc_opt_class();
  uint64_t v14 = objc_msgSend__guidForItem_(v11, v12, (uint64_t)v10, v13);

  LOBYTE(v10) = objc_msgSend__isEqualToGuid_activityTitle_expirationDate_(self, v15, (uint64_t)v14, (uint64_t)v9, v8);
  return (char)v10;
}

- (NSString)activityTitle
{
  return self->_activityTitle;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);

  objc_storeStrong((id *)&self->_activityTitle, 0);
}

@end