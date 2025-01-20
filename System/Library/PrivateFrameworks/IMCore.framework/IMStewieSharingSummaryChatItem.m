@interface IMStewieSharingSummaryChatItem
- (IMChat)chat;
- (id)_initWithItem:(id)a3 emergencyUserHandle:(id)a4 chat:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)handle;
- (void)setChat:(id)a3;
@end

@implementation IMStewieSharingSummaryChatItem

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v8 = objc_msgSend__item(self, v5, v6, v7);
  v11 = objc_msgSend__initWithItem_(v4, v9, (uint64_t)v8, v10);

  return v11;
}

- (id)_initWithItem:(id)a3 emergencyUserHandle:(id)a4 chat:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)IMStewieSharingSummaryChatItem;
  v14 = [(IMChatItem *)&v24 _initWithItem:v8];
  if (v14)
  {
    v15 = objc_msgSend_guid(v8, v11, v12, v13);
    v19 = objc_msgSend_ID(v9, v16, v17, v18);
    v20 = (void *)sub_1A4C4EEE8();

    objc_msgSend__setGUID_(v14, v21, (uint64_t)v20, v22);
    objc_storeStrong(v14 + 7, a4);
    objc_storeWeak(v14 + 8, v10);
  }
  return v14;
}

- (id)handle
{
  return self->_handle;
}

- (IMChat)chat
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chat);

  return (IMChat *)WeakRetained;
}

- (void)setChat:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_chat);

  objc_storeStrong((id *)&self->_handle, 0);
}

@end