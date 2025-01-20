@interface IMRichActionFooterChatItem
- (BOOL)isFromMe;
- (NSString)extensionName;
- (id)_initWithItem:(id)a3;
- (id)handle;
@end

@implementation IMRichActionFooterChatItem

- (id)_initWithItem:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)IMRichActionFooterChatItem;
  v8 = [(IMChatItem *)&v21 _initWithItem:v4];
  if (v8)
  {
    v9 = objc_msgSend_guid(v4, v5, v6, v7);
    v12 = objc_msgSend_stringByAppendingString_(v9, v10, @"IMRichActionFooter", v11);
    objc_msgSend__setGUID_(v8, v13, (uint64_t)v12, v14);

    uint64_t v18 = objc_msgSend__senderHandle(v4, v15, v16, v17);
    v19 = (void *)v8[7];
    v8[7] = v18;
  }
  return v8;
}

- (BOOL)isFromMe
{
  id v4 = objc_msgSend__item(self, a2, v2, v3);
  char v8 = objc_msgSend_isFromMe(v4, v5, v6, v7);

  return v8;
}

- (id)handle
{
  return self->_handle;
}

- (NSString)extensionName
{
  return self->_extensionName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionName, 0);

  objc_storeStrong((id *)&self->_handle, 0);
}

@end