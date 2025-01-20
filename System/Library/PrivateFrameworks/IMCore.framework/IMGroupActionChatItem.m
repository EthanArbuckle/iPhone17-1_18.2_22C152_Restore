@interface IMGroupActionChatItem
- (BOOL)failed;
- (IMHandle)sender;
- (NSArray)fileTransferGUIDs;
- (id)_initWithItem:(id)a3 sender:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)actionType;
@end

@implementation IMGroupActionChatItem

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v8 = objc_msgSend__item(self, v5, v6, v7);
  v10 = objc_msgSend__initWithItem_sender_(v4, v9, (uint64_t)v8, (uint64_t)self->_sender);

  return v10;
}

- (int64_t)actionType
{
  id v4 = objc_msgSend__item(self, a2, v2, v3);
  int64_t v8 = objc_msgSend_actionType(v4, v5, v6, v7);

  return v8;
}

- (NSArray)fileTransferGUIDs
{
  id v4 = objc_msgSend__item(self, a2, v2, v3);
  int64_t v8 = objc_msgSend_fileTransferGUIDs(v4, v5, v6, v7);

  return (NSArray *)v8;
}

- (id)_initWithItem:(id)a3 sender:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)IMGroupActionChatItem;
  int64_t v8 = [(IMChatItem *)&v27 _initWithItem:v6];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(v8 + 8, a4);
    *((unsigned char *)v9 + 56) = objc_msgSend_errorCode(v6, v10, v11, v12) != 0;
    int isBusiness = objc_msgSend_isBusiness(v7, v13, v14, v15);
    v17 = @"a:";
    if (isBusiness) {
      v17 = @"ba:";
    }
    v18 = v17;
    v22 = objc_msgSend_guid(v6, v19, v20, v21);
    v23 = (void *)sub_1A4C4EEE8();

    objc_msgSend__setGUID_(v9, v24, (uint64_t)v23, v25);
  }

  return v9;
}

- (IMHandle)sender
{
  return self->_sender;
}

- (BOOL)failed
{
  return self->_failed;
}

- (void).cxx_destruct
{
}

@end