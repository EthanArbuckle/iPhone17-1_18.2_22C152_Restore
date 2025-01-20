@interface CKEmojiStickerTranscriptCell
- (CKEmojiStickerLabel)labelView;
- (CKEmojiStickerTranscriptCell)initWithFrame:(CGRect)a3;
- (void)animateToVisible:(BOOL)a3 completion:(id)a4;
- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7;
- (void)performHide:(id)a3;
- (void)performReveal:(id)a3;
- (void)prepareForReuse;
- (void)setSticker:(id)a3;
@end

@implementation CKEmojiStickerTranscriptCell

- (CKEmojiStickerTranscriptCell)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKEmojiStickerTranscriptCell;
  v3 = -[CKAssociatedStickerTranscriptCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [CKEmojiStickerLabel alloc];
    uint64_t v5 = -[CKEmojiStickerLabel initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    labelView = v3->_labelView;
    v3->_labelView = (CKEmojiStickerLabel *)v5;
  }
  return v3;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)CKEmojiStickerTranscriptCell;
  [(CKAssociatedStickerTranscriptCell *)&v4 prepareForReuse];
  v3 = [(CKEmojiStickerTranscriptCell *)self labelView];
  [v3 setText:&stru_1EDE4CA38];
}

- (void)setSticker:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKEmojiStickerTranscriptCell;
  [(CKAssociatedStickerTranscriptCell *)&v8 setSticker:a3];
  objc_super v4 = [(CKEmojiStickerTranscriptCell *)self emojiSticker];

  if (v4)
  {
    uint64_t v5 = [(CKEmojiStickerTranscriptCell *)self emojiSticker];
    v6 = [v5 emojiString];
    v7 = [(CKEmojiStickerTranscriptCell *)self labelView];
    [v7 setText:v6];
  }
}

- (void)animateToVisible:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [(CKAssociatedMessageTranscriptCell *)self associatedItemView];
  objc_super v8 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"opacity"];
  v9 = v8;
  if (v4) {
    v10 = &unk_1EDF16F48;
  }
  else {
    v10 = &unk_1EDF16F58;
  }
  if (v4) {
    v11 = &unk_1EDF16F58;
  }
  else {
    v11 = &unk_1EDF16F48;
  }
  [v8 setFromValue:v10];
  [v9 setToValue:v11];
  [v9 setMass:2.0];
  [v9 setStiffness:300.0];
  [v9 setDamping:400.0];
  [v9 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v9 setRemovedOnCompletion:0];
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setAnimationDuration:0.5];
  v12 = (void *)MEMORY[0x1E4F39CF8];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__CKEmojiStickerTranscriptCell_animateToVisible_completion___block_invoke;
  v15[3] = &unk_1E5620F48;
  id v16 = v6;
  id v13 = v6;
  [v12 setCompletionBlock:v15];
  v14 = [v7 layer];
  [v14 addAnimation:v9 forKey:@"opacity"];

  [MEMORY[0x1E4F39CF8] commit];
}

uint64_t __60__CKEmojiStickerTranscriptCell_animateToVisible_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)performHide:(id)a3
{
}

- (void)performReveal:(id)a3
{
}

- (CKEmojiStickerLabel)labelView
{
  return self->_labelView;
}

- (void).cxx_destruct
{
}

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  v18.receiver = self;
  v18.super_class = (Class)CKEmojiStickerTranscriptCell;
  [(CKAssociatedStickerTranscriptCell *)&v18 configureForChatItem:a3 context:a4 animated:a5 animationDuration:a7 animationCurve:a6];
  objc_super v8 = [(CKEmojiStickerTranscriptCell *)self labelView];
  v9 = [v8 layer];
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  v17[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  v17[5] = v10;
  long long v11 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  v17[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  v17[7] = v11;
  long long v12 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  v17[0] = *MEMORY[0x1E4F39B10];
  v17[1] = v12;
  long long v13 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  v17[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  v17[3] = v13;
  [v9 setTransform:v17];

  v14 = [(CKEmojiStickerTranscriptCell *)self labelView];
  v15 = [v14 layer];
  [v15 removeAllAnimations];

  id v16 = [(CKEmojiStickerTranscriptCell *)self labelView];
  [(CKAssociatedStickerTranscriptCell *)self setAssociatedItemView:v16];
}

@end