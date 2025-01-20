@interface IMRichLinkCardMessagePartChatItem
- (IMRichCards)richCards;
- (IMRichLinkCardMessagePartChatItem)initWithItem:(id)a3 richCards:(id)a4 selectedIndex:(int64_t)a5;
- (int64_t)selectedIndex;
- (void)_setSelectedIndex:(int64_t)a3;
@end

@implementation IMRichLinkCardMessagePartChatItem

- (IMRichLinkCardMessagePartChatItem)initWithItem:(id)a3 richCards:(id)a4 selectedIndex:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)IMRichLinkCardMessagePartChatItem;
  v13 = [(IMChatItem *)&v20 _initWithItem:v8];
  if (v13)
  {
    v14 = objc_msgSend_guid(v8, v10, v11, v12);
    objc_msgSend__setGUID_(v13, v15, (uint64_t)v14, v16);

    objc_msgSend__setSelectedIndex_(v13, v17, a5, v18);
    objc_storeStrong((id *)&v13->_richCards, a4);
  }

  return v13;
}

- (void)_setSelectedIndex:(int64_t)a3
{
  self->_selectedIndex = a3;
}

- (IMRichCards)richCards
{
  return self->_richCards;
}

- (int64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void).cxx_destruct
{
}

@end