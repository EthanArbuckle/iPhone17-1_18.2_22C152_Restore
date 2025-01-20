@interface IMEmojiStickerChatItem
- (NSString)emojiString;
- (id)_initWithItem:(id)a3 sender:(id)a4 transferGUID:(id)a5 emojiSticker:(id)a6;
@end

@implementation IMEmojiStickerChatItem

- (id)_initWithItem:(id)a3 sender:(id)a4 transferGUID:(id)a5 emojiSticker:(id)a6
{
  id v10 = a6;
  v16.receiver = self;
  v16.super_class = (Class)IMEmojiStickerChatItem;
  id v11 = [(IMAssociatedStickerChatItem *)&v16 _initWithItem:a3 sender:a4 transferGUID:a5];
  v14 = v11;
  if (v11) {
    objc_msgSend_setEmojiSticker_(v11, v12, (uint64_t)v10, v13);
  }

  return v14;
}

- (NSString)emojiString
{
  v4 = objc_msgSend_emojiSticker(self, a2, v2, v3);
  v8 = objc_msgSend_emojiString(v4, v5, v6, v7);

  return (NSString *)v8;
}

@end