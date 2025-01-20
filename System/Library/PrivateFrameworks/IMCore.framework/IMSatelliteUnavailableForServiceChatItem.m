@interface IMSatelliteUnavailableForServiceChatItem
- (BOOL)isGroupChat;
- (IMServiceImpl)service;
- (NSString)recipientID;
- (id)_initWithItem:(id)a3 service:(id)a4 recipientID:(id)a5 isGroupChat:(BOOL)a6;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation IMSatelliteUnavailableForServiceChatItem

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v8 = objc_msgSend__item(self, v5, v6, v7);
  v11 = objc_msgSend__initWithItem_(v4, v9, (uint64_t)v8, v10);

  return v11;
}

- (id)_initWithItem:(id)a3 service:(id)a4 recipientID:(id)a5 isGroupChat:(BOOL)a6
{
  id v11 = a4;
  id v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)IMSatelliteUnavailableForServiceChatItem;
  v13 = [(IMChatItem *)&v18 _initWithItem:a3];
  v16 = v13;
  if (v13)
  {
    objc_msgSend__setGUID_(v13, v14, @"ug:", v15);
    objc_storeStrong(v16 + 8, a4);
    objc_storeStrong(v16 + 9, a5);
    *((unsigned char *)v16 + 56) = a6;
  }

  return v16;
}

- (IMServiceImpl)service
{
  return self->_service;
}

- (NSString)recipientID
{
  return self->_recipientID;
}

- (BOOL)isGroupChat
{
  return self->_isGroupChat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipientID, 0);

  objc_storeStrong((id *)&self->_service, 0);
}

@end