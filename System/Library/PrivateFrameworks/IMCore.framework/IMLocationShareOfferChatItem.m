@interface IMLocationShareOfferChatItem
- (BOOL)_isActionableEclipsed;
- (BOOL)actionableEclipsed;
- (BOOL)failed;
- (BOOL)isFromMe;
- (IMHandle)sender;
- (NSDate)time;
- (id)_initWithItem:(id)a3 sender:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)offerState;
- (void)_setActionableEclipsed:(BOOL)a3;
@end

@implementation IMLocationShareOfferChatItem

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v8 = objc_msgSend__item(self, v5, v6, v7);
  v10 = objc_msgSend__initWithItem_sender_(v4, v9, (uint64_t)v8, (uint64_t)self->_sender);

  objc_msgSend__setActionableEclipsed_(v10, v11, self->_actionableEclipsed, v12);
  return v10;
}

- (BOOL)isFromMe
{
  return 0;
}

- (BOOL)failed
{
  return 0;
}

- (NSDate)time
{
  id v4 = objc_msgSend__item(self, a2, v2, v3);
  v8 = objc_msgSend_time(v4, v5, v6, v7);

  return (NSDate *)v8;
}

- (IMHandle)sender
{
  return self->_sender;
}

- (int64_t)offerState
{
  v5 = objc_msgSend__item(self, a2, v2, v3);
  v9 = objc_msgSend_sharedInstance(IMFMFSession, v6, v7, v8);
  if (objc_msgSend_restrictLocationSharing(v9, v10, v11, v12))
  {
    int v16 = 1;
  }
  else
  {
    v17 = objc_msgSend_sharedInstance(IMFMFSession, v13, v14, v15);
    int v16 = objc_msgSend_disableLocationSharing(v17, v18, v19, v20);
  }
  if (objc_msgSend_expired(v5, v21, v22, v23))
  {
    int64_t v27 = 2;
  }
  else
  {
    int64_t v27 = 1;
    if (objc_msgSend_actionable(v5, v24, v25, v26))
    {
      int v28 = self->_actionableEclipsed ? 1 : v16;
      if (v28 != 1) {
        int64_t v27 = 0;
      }
    }
  }

  return v27;
}

- (id)_initWithItem:(id)a3 sender:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)IMLocationShareOfferChatItem;
  uint64_t v8 = [(IMChatItem *)&v18 _initWithItem:v6];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(v8 + 8, a4);
    v13 = objc_msgSend_guid(v6, v10, v11, v12);
    uint64_t v14 = (void *)sub_1A4C4EEE8();

    objc_msgSend__setGUID_(v9, v15, (uint64_t)v14, v16);
  }

  return v9;
}

- (BOOL)_isActionableEclipsed
{
  return self->_actionableEclipsed;
}

- (void)_setActionableEclipsed:(BOOL)a3
{
  self->_actionableEclipsed = a3;
}

- (BOOL)actionableEclipsed
{
  return self->_actionableEclipsed;
}

- (void).cxx_destruct
{
}

@end