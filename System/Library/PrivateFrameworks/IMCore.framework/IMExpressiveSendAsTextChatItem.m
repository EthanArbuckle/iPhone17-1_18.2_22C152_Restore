@interface IMExpressiveSendAsTextChatItem
- (NSString)text;
- (id)_initWithItem:(id)a3 text:(id)a4;
@end

@implementation IMExpressiveSendAsTextChatItem

- (id)_initWithItem:(id)a3 text:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)IMExpressiveSendAsTextChatItem;
  v11 = [(IMChatItem *)&v22 _initWithItem:v6];
  if (v11)
  {
    v12 = objc_msgSend_guid(v6, v8, v9, v10);
    v13 = (void *)sub_1A4C4EEE8();

    objc_msgSend__setGUID_(v11, v14, (uint64_t)v13, v15);
    uint64_t v19 = objc_msgSend_copy(v7, v16, v17, v18);
    v20 = (void *)v11[7];
    v11[7] = v19;
  }
  return v11;
}

- (NSString)text
{
  return self->_text;
}

- (void).cxx_destruct
{
}

@end