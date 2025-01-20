@interface IMNumberChangedChatItem
- (NSString)sender;
- (id)_initWithItem:(id)a3 senderHandle:(id)a4;
@end

@implementation IMNumberChangedChatItem

- (id)_initWithItem:(id)a3 senderHandle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)IMNumberChangedChatItem;
  v8 = [(IMChatItem *)&v21 _initWithItem:v6];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(v8 + 7, a4);
    v10 = NSString;
    v14 = objc_msgSend_guid(v6, v11, v12, v13);
    v17 = objc_msgSend_stringWithFormat_(v10, v15, @"%@%@", v16, @"nc:", v14);

    objc_msgSend__setGUID_(v9, v18, (uint64_t)v17, v19);
  }

  return v9;
}

- (NSString)sender
{
  return self->_sender;
}

- (void).cxx_destruct
{
}

@end