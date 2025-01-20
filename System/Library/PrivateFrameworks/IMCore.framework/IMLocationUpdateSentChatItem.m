@interface IMLocationUpdateSentChatItem
- (NSString)chatIdentifier;
- (id)_initWithItem:(id)a3 chatIdentifier:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation IMLocationUpdateSentChatItem

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v8 = objc_msgSend__item(self, v5, v6, v7);
  v11 = objc_msgSend__initWithItem_(v4, v9, (uint64_t)v8, v10);

  return v11;
}

- (id)_initWithItem:(id)a3 chatIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)IMLocationUpdateSentChatItem;
  v11 = [(IMChatItem *)&v17 _initWithItem:v6];
  if (v11)
  {
    v12 = objc_msgSend_guid(v6, v8, v9, v10);
    v13 = (void *)sub_1A4C4EEE8();

    objc_msgSend__setGUID_(v11, v14, (uint64_t)v13, v15);
    objc_storeStrong(v11 + 7, a4);
  }
  return v11;
}

- (NSString)chatIdentifier
{
  return self->_chatIdentifier;
}

- (void).cxx_destruct
{
}

@end