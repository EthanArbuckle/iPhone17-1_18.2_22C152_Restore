@interface CKEmojiStickerChatItem
- (CGSize)size;
- (Class)cellClass;
- (IMEmojiSticker)emojiSticker;
@end

@implementation CKEmojiStickerChatItem

- (IMEmojiSticker)emojiSticker
{
  emojiSticker = self->_emojiSticker;
  if (!emojiSticker)
  {
    v4 = [(CKAssociatedStickerChatItem *)self stickerUserInfo];
    id v5 = objc_alloc(MEMORY[0x1E4F6E760]);
    v6 = [(CKEmojiStickerChatItem *)self IMEmojiStickerChatItem];
    v7 = [v6 emojiString];
    v8 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6E3B8]];
    v9 = [(CKAssociatedStickerChatItem *)self mediaObject];
    v10 = [v9 fileURL];
    v11 = (IMEmojiSticker *)[v5 initWithEmojiString:v7 stickerPackID:v8 fileURL:v10];
    v12 = self->_emojiSticker;
    self->_emojiSticker = v11;

    [(CKAssociatedStickerChatItem *)self setSticker:self->_emojiSticker];
    emojiSticker = self->_emojiSticker;
  }

  return emojiSticker;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (CGSize)size
{
  v2 = +[CKUIBehavior sharedBehaviors];
  [v2 emojiStickerTranscriptBalloonSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void).cxx_destruct
{
}

@end