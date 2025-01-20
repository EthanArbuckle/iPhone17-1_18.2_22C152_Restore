@interface CKMessageEditingBalloonTextView
- (BOOL)isFakeSelected;
- (BOOL)shouldAdjustInsetsForMinimumSize;
- (BOOL)shouldPreserveAdaptiveImageGlyphsInCompositionText;
- (BOOL)supportsAdaptiveImageGlyph;
- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4 isSingleLine:(BOOL *)a5 isReplyPreview:(BOOL)a6;
- (CKBalloonTextViewInteractionDelegate)interactionDelegate;
- (void)setFakeSelected:(BOOL)a3;
- (void)setInteractionDelegate:(id)a3;
- (void)setShouldAdjustInsetsForMinimumSize:(BOOL)a3;
@end

@implementation CKMessageEditingBalloonTextView

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4 isSingleLine:(BOOL *)a5 isReplyPreview:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a3.height;
  double width = a3.width;
  v12 = [(CKMessageEditingBalloonTextView *)self attributedText];
  if (![v12 length])
  {
    id v13 = objc_alloc(MEMORY[0x1E4F28B18]);
    v14 = [(CKMessageEditingBalloonTextView *)self typingAttributes];
    uint64_t v15 = [v13 initWithString:@"A" attributes:v14];

    v12 = (void *)v15;
  }
  v16 = [(CKMessageEditingBalloonTextView *)self textContainer];
  +[CKBalloonTextView sizeThatFits:attributedText:maximumNumberOfLines:lineBreakMode:isReplyPreview:outTextAlignmentInsets:outIsSingleLine:](CKBalloonTextView, "sizeThatFits:attributedText:maximumNumberOfLines:lineBreakMode:isReplyPreview:outTextAlignmentInsets:outIsSingleLine:", v12, [v16 maximumNumberOfLines], objc_msgSend(v16, "lineBreakMode"), v6, a4, a5, width, height);
  double v18 = v17;
  double v20 = v19;

  double v21 = v18;
  double v22 = v20;
  result.double height = v22;
  result.double width = v21;
  return result;
}

- (BOOL)supportsAdaptiveImageGlyph
{
  return 0;
}

- (BOOL)shouldPreserveAdaptiveImageGlyphsInCompositionText
{
  return 1;
}

- (BOOL)isFakeSelected
{
  return self->_fakeSelected;
}

- (void)setFakeSelected:(BOOL)a3
{
  self->_fakeSelected = a3;
}

- (CKBalloonTextViewInteractionDelegate)interactionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);

  return (CKBalloonTextViewInteractionDelegate *)WeakRetained;
}

- (void)setInteractionDelegate:(id)a3
{
}

- (BOOL)shouldAdjustInsetsForMinimumSize
{
  return self->_shouldAdjustInsetsForMinimumSize;
}

- (void)setShouldAdjustInsetsForMinimumSize:(BOOL)a3
{
  self->_shouldAdjustInsetsForMinimumSize = a3;
}

- (void).cxx_destruct
{
}

@end