@interface IMReplySenderChatItem
- (id)_initWithItem:(id)a3 handle:(id)a4 threadIdentifier:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)threadIdentifier;
@end

@implementation IMReplySenderChatItem

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v8 = objc_msgSend__item(self, v5, v6, v7);
  v12 = objc_msgSend_handle(self, v9, v10, v11);
  v14 = objc_msgSend__initWithItem_handle_(v4, v13, (uint64_t)v8, (uint64_t)v12);

  return v14;
}

- (id)_initWithItem:(id)a3 handle:(id)a4 threadIdentifier:(id)a5
{
  id v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)IMReplySenderChatItem;
  v12 = [(IMSenderChatItem *)&v16 _initWithItem:a3 handle:a4];
  if (v12)
  {
    uint64_t v13 = objc_msgSend_copy(v8, v9, v10, v11);
    v14 = (void *)v12[10];
    v12[10] = v13;
  }
  return v12;
}

- (id)threadIdentifier
{
  return self->_threadIdentifier;
}

- (void).cxx_destruct
{
}

@end