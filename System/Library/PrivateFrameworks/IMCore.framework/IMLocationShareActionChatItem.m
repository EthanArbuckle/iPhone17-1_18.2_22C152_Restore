@interface IMLocationShareActionChatItem
- (BOOL)isFromMe;
- (IMHandle)otherHandle;
- (IMHandle)sender;
- (id)_initWithItem:(id)a3 sender:(id)a4 otherHandle:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)actionType;
- (int64_t)direction;
@end

@implementation IMLocationShareActionChatItem

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v8 = objc_msgSend__item(self, v5, v6, v7);
  v10 = objc_msgSend__initWithItem_sender_otherHandle_(v4, v9, (uint64_t)v8, (uint64_t)self->_sender, self->_otherHandle);

  return v10;
}

- (BOOL)isFromMe
{
  return self->_sender == 0;
}

- (int64_t)actionType
{
  id v4 = objc_msgSend__item(self, a2, v2, v3);
  int64_t v8 = objc_msgSend_status(v4, v5, v6, v7);

  return v8;
}

- (int64_t)direction
{
  id v4 = objc_msgSend__item(self, a2, v2, v3);
  int64_t v8 = objc_msgSend_direction(v4, v5, v6, v7);

  return v8;
}

- (id)_initWithItem:(id)a3 sender:(id)a4 otherHandle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)IMLocationShareActionChatItem;
  v11 = [(IMChatItem *)&v21 _initWithItem:v8];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong(v11 + 7, a4);
    objc_storeStrong(v12 + 8, a5);
    v16 = objc_msgSend_guid(v8, v13, v14, v15);
    v17 = (void *)sub_1A4C4EEE8();

    objc_msgSend__setGUID_(v12, v18, (uint64_t)v17, v19);
  }

  return v12;
}

- (IMHandle)sender
{
  return self->_sender;
}

- (IMHandle)otherHandle
{
  return self->_otherHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherHandle, 0);

  objc_storeStrong((id *)&self->_sender, 0);
}

@end