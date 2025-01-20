@interface IMLoadMoreChatItem
- (id)_initWithItem:(id)a3;
@end

@implementation IMLoadMoreChatItem

- (id)_initWithItem:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)IMLoadMoreChatItem;
  id v3 = [(IMChatItem *)&v8 _initWithItem:a3];
  v6 = v3;
  if (v3) {
    objc_msgSend__setGUID_(v3, v4, @"m:", v5);
  }
  return v6;
}

@end