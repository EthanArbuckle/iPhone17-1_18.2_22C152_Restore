@interface CKEmojiStickerLabel
- (CKEmojiStickerLabel)initWithCoder:(id)a3;
- (CKEmojiStickerLabel)initWithFrame:(CGRect)a3;
- (NSString)stickerAccessibilityDescription;
- (void)_configure;
- (void)setStickerAccessibilityDescription:(id)a3;
@end

@implementation CKEmojiStickerLabel

- (CKEmojiStickerLabel)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKEmojiStickerLabel;
  v3 = -[CKEmojiStickerLabel initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(CKEmojiStickerLabel *)v3 _configure];
  }
  return v4;
}

- (CKEmojiStickerLabel)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKEmojiStickerLabel;
  v3 = [(CKEmojiStickerLabel *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(CKEmojiStickerLabel *)v3 _configure];
  }
  return v4;
}

- (void)_configure
{
  v3 = +[CKUIBehavior sharedBehaviors];
  v4 = [v3 emojiStickerTranscriptCellFont];
  [(CKEmojiStickerLabel *)self setFont:v4];

  [(CKEmojiStickerLabel *)self setUserInteractionEnabled:0];
  v5 = +[CKUIBehavior sharedBehaviors];
  objc_super v6 = [v5 theme];
  v7 = [v6 primaryLabelColor];
  [(CKEmojiStickerLabel *)self setTextColor:v7];

  [(CKEmojiStickerLabel *)self setTextAlignment:1];
  id v8 = [MEMORY[0x1E4F428B8] clearColor];
  [(CKEmojiStickerLabel *)self setBackgroundColor:v8];
}

- (NSString)stickerAccessibilityDescription
{
  return self->_stickerAccessibilityDescription;
}

- (void)setStickerAccessibilityDescription:(id)a3
{
}

- (void).cxx_destruct
{
}

@end