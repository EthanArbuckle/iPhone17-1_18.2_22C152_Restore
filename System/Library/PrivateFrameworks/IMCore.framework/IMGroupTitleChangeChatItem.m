@interface IMGroupTitleChangeChatItem
- (BOOL)failed;
- (IMHandle)sender;
- (NSString)title;
- (id)_initWithItem:(id)a3 sender:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation IMGroupTitleChangeChatItem

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v8 = objc_msgSend__item(self, v5, v6, v7);
  v10 = objc_msgSend__initWithItem_sender_(v4, v9, (uint64_t)v8, (uint64_t)self->_sender);

  return v10;
}

- (NSString)title
{
  id v4 = objc_msgSend__item(self, a2, v2, v3);
  v8 = objc_msgSend_title(v4, v5, v6, v7);

  return (NSString *)v8;
}

- (id)_initWithItem:(id)a3 sender:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)IMGroupTitleChangeChatItem;
  v8 = [(IMChatItem *)&v21 _initWithItem:v6];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(v8 + 8, a4);
    *((unsigned char *)v9 + 56) = objc_msgSend_errorCode(v6, v10, v11, v12) != 0;
    v16 = objc_msgSend_guid(v6, v13, v14, v15);
    v17 = (void *)sub_1A4C4EEE8();

    objc_msgSend__setGUID_(v9, v18, (uint64_t)v17, v19);
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