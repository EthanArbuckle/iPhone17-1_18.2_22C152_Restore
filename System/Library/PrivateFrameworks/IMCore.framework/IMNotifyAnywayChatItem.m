@interface IMNotifyAnywayChatItem
- (id)_init;
@end

@implementation IMNotifyAnywayChatItem

- (id)_init
{
  v7.receiver = self;
  v7.super_class = (Class)IMNotifyAnywayChatItem;
  id v2 = [(IMChatItem *)&v7 _initWithItem:0];
  v5 = v2;
  if (v2) {
    objc_msgSend__setGUID_(v2, v3, @"na:", v4);
  }
  return v5;
}

@end