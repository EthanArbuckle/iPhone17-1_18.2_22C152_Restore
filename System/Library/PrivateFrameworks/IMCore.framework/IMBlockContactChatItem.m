@interface IMBlockContactChatItem
- (id)_initWithItem:(id)a3 chatStyle:(unsigned __int8)a4;
- (unsigned)chatStyle;
- (void)setChatStyle:(unsigned __int8)a3;
@end

@implementation IMBlockContactChatItem

- (id)_initWithItem:(id)a3 chatStyle:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  v10.receiver = self;
  v10.super_class = (Class)IMBlockContactChatItem;
  id v5 = [(IMChatItem *)&v10 _initWithItem:a3];
  v8 = v5;
  if (v5) {
    objc_msgSend_setChatStyle_(v5, v6, v4, v7);
  }
  return v8;
}

- (unsigned)chatStyle
{
  return self->_chatStyle;
}

- (void)setChatStyle:(unsigned __int8)a3
{
  self->_chatStyle = a3;
}

@end