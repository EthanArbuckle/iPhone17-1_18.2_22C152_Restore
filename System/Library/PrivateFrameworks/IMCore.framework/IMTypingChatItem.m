@interface IMTypingChatItem
- (id)_initWithItem:(id)a3;
@end

@implementation IMTypingChatItem

- (id)_initWithItem:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)IMTypingChatItem;
  id v5 = [(IMChatItem *)&v21 _initWithItem:v4];
  if (v5)
  {
    id v6 = [NSString alloc];
    unsigned int isAudioMessage = objc_msgSend_isAudioMessage(v4, v7, v8, v9);
    unsigned int v14 = objc_msgSend_isFromMe(v4, v11, v12, v13);
    v17 = objc_msgSend_initWithFormat_(v6, v15, @"t:%d/%d", v16, isAudioMessage, v14);
    objc_msgSend__setGUID_(v5, v18, (uint64_t)v17, v19);
  }
  return v5;
}

@end