@interface IMServiceChatItem
- (BOOL)isLiteServiceCapable;
- (BOOL)isStewieSharingChat;
- (IMHandle)handle;
- (IMServiceImpl)service;
- (id)_initWithItem:(id)a3 service:(id)a4 handle:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setLiteServiceCapable:(BOOL)a3;
- (void)setStewieSharingChat:(BOOL)a3;
@end

@implementation IMServiceChatItem

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v8 = objc_msgSend__item(self, v5, v6, v7);
  v10 = objc_msgSend__initWithItem_service_handle_(v4, v9, (uint64_t)v8, (uint64_t)self->_service, self->_handle);

  return v10;
}

- (id)_initWithItem:(id)a3 service:(id)a4 handle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v38.receiver = self;
  v38.super_class = (Class)IMServiceChatItem;
  v11 = [(IMChatItem *)&v38 _initWithItem:v8];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong(v11 + 8, a4);
    objc_storeStrong(v12 + 9, a5);
    uint64_t v16 = objc_msgSend_name(v9, v13, v14, v15);
    v17 = (void *)v16;
    if (v16) {
      v18 = (__CFString *)v16;
    }
    else {
      v18 = &stru_1EF8E78C8;
    }
    v19 = v18;

    uint64_t v23 = objc_msgSend_ID(v10, v20, v21, v22);
    v24 = (void *)v23;
    if (v23) {
      v25 = (__CFString *)v23;
    }
    else {
      v25 = &stru_1EF8E78C8;
    }
    v26 = v25;

    uint64_t v30 = objc_msgSend_guid(v8, v27, v28, v29);
    v31 = (void *)v30;
    if (v30) {
      v32 = (__CFString *)v30;
    }
    else {
      v32 = &stru_1EF8E78C8;
    }
    v33 = v32;

    v34 = (void *)sub_1A4C4EEE8();
    objc_msgSend__setGUID_(v12, v35, (uint64_t)v34, v36);
  }
  return v12;
}

- (IMServiceImpl)service
{
  return self->_service;
}

- (IMHandle)handle
{
  return self->_handle;
}

- (BOOL)isStewieSharingChat
{
  return self->_stewieSharingChat;
}

- (void)setStewieSharingChat:(BOOL)a3
{
  self->_stewieSharingChat = a3;
}

- (BOOL)isLiteServiceCapable
{
  return self->_liteServiceCapable;
}

- (void)setLiteServiceCapable:(BOOL)a3
{
  self->_liteServiceCapable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);

  objc_storeStrong((id *)&self->_service, 0);
}

@end