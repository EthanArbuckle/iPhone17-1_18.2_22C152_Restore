@interface IMEmoteMessageChatItem
- (NSAttributedString)text;
- (id)_initWithItem:(id)a3;
@end

@implementation IMEmoteMessageChatItem

- (NSAttributedString)text
{
  v4 = objc_msgSend_message(self, a2, v2, v3);
  v8 = objc_msgSend_text(v4, v5, v6, v7);

  return (NSAttributedString *)v8;
}

- (id)_initWithItem:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IMEmoteMessageChatItem;
  id v8 = [(IMChatItem *)&v14 _initWithItem:v4];
  if (v8)
  {
    v9 = objc_msgSend_guid(v4, v5, v6, v7);
    v10 = (void *)sub_1A4C4EEE8();

    objc_msgSend__setGUID_(v8, v11, (uint64_t)v10, v12);
  }

  return v8;
}

@end