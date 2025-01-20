@interface IMTransientMessagePartChatItem
- (IMTransientMessagePartChatItem)initWithGUID:(id)a3;
@end

@implementation IMTransientMessagePartChatItem

- (IMTransientMessagePartChatItem)initWithGUID:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IMTransientMessagePartChatItem;
  v5 = [(IMTransientMessagePartChatItem *)&v10 init];
  v8 = v5;
  if (v5) {
    objc_msgSend__setGUID_(v5, v6, (uint64_t)v4, v7);
  }

  return v8;
}

@end