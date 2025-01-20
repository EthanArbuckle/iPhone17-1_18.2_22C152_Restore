@interface CKMessageEntryHintView
- (CKMessageEntryHintView)initWithReferenceButton:(id)a3 coverInsets:(UIEdgeInsets)a4;
- (UIButton)referenceButton;
- (UIEdgeInsets)coverInsets;
- (UILabel)hintLabel;
- (void)layoutSubviews;
- (void)setCoverInsets:(UIEdgeInsets)a3;
- (void)setHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setHintLabel:(id)a3;
- (void)setReferenceButton:(id)a3;
@end

@implementation CKMessageEntryHintView

- (CKMessageEntryHintView)initWithReferenceButton:(id)a3 coverInsets:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  id v9 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CKMessageEntryHintView;
  double v10 = *MEMORY[0x1E4F1DB28];
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v14 = -[CKMessageEntryHintView initWithFrame:](&v23, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v11, v12, v13);
  v15 = v14;
  if (v14)
  {
    [(CKMessageEntryHintView *)v14 setReferenceButton:v9];
    -[CKMessageEntryHintView setCoverInsets:](v15, "setCoverInsets:", top, left, bottom, right);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v10, v11, v12, v13);
    [v16 setTextAlignment:1];
    v17 = +[CKUIBehavior sharedBehaviors];
    v18 = [v17 audioHintFont];
    [v16 setFont:v18];

    [v16 setAdjustsFontSizeToFitWidth:1];
    v19 = +[CKUIBehavior sharedBehaviors];
    v20 = [v19 theme];
    v21 = [v20 transcriptTextColor];
    [v16 setTextColor:v21];

    [v16 setBackgroundColor:0];
    [v16 setOpaque:0];
    [(CKMessageEntryHintView *)v15 setHintLabel:v16];
    [(CKMessageEntryHintView *)v15 addSubview:v16];
    [(CKMessageEntryHintView *)v15 setHidden:1];
    [v16 setAlpha:0.0];
  }
  return v15;
}

- (void)layoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)CKMessageEntryHintView;
  [(CKMessageEntryHintView *)&v27 layoutSubviews];
  [(CKMessageEntryHintView *)self bounds];
  double v4 = v3;
  [(CKMessageEntryHintView *)self coverInsets];
  double v6 = v4 + v5;
  v7 = [(CKMessageEntryHintView *)self referenceButton];
  [v7 frame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = [v7 superview];
  -[CKMessageEntryHintView convertRect:fromView:](self, "convertRect:fromView:", v16, v9, v11, v13, v15);
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  objc_super v23 = [(CKMessageEntryHintView *)self hintLabel];
  objc_msgSend(v23, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  double v25 = v24;

  v26 = [(CKMessageEntryHintView *)self hintLabel];
  objc_msgSend(v26, "setFrame:", v6, v20 + floor((v22 - v25) * 0.5), v18 - v6, v25);
}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  int v5 = a3;
  id v7 = a5;
  if ([(CKMessageEntryHintView *)self isHidden] != v5)
  {
    double v8 = [(CKMessageEntryHintView *)self hintLabel];
    double v9 = v8;
    if (v5)
    {
      double v10 = (void *)MEMORY[0x1E4F42FF0];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __56__CKMessageEntryHintView_setHidden_animated_completion___block_invoke_3;
      v16[3] = &unk_1E5620C40;
      double v11 = &v17;
      id v17 = v8;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __56__CKMessageEntryHintView_setHidden_animated_completion___block_invoke_4;
      v14[3] = &unk_1E5622750;
      v14[4] = self;
      id v15 = v7;
      [v10 animateWithDuration:327680 delay:v16 options:v14 animations:0.25 completion:0.0];
      double v12 = v15;
    }
    else
    {
      [(CKMessageEntryHintView *)self setHidden:0];
      double v13 = (void *)MEMORY[0x1E4F42FF0];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __56__CKMessageEntryHintView_setHidden_animated_completion___block_invoke;
      v20[3] = &unk_1E5620C40;
      double v11 = &v21;
      id v21 = v9;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __56__CKMessageEntryHintView_setHidden_animated_completion___block_invoke_2;
      v18[3] = &unk_1E5622358;
      id v19 = v7;
      [v13 animateWithDuration:327680 delay:v20 options:v18 animations:0.25 completion:0.0];
      double v12 = v19;
    }
  }
}

uint64_t __56__CKMessageEntryHintView_setHidden_animated_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __56__CKMessageEntryHintView_setHidden_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __56__CKMessageEntryHintView_setHidden_animated_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __56__CKMessageEntryHintView_setHidden_animated_completion___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setHidden:1];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (UIButton)referenceButton
{
  return self->_referenceButton;
}

- (void)setReferenceButton:(id)a3
{
}

- (UILabel)hintLabel
{
  return self->_hintLabel;
}

- (void)setHintLabel:(id)a3
{
}

- (UIEdgeInsets)coverInsets
{
  double top = self->_coverInsets.top;
  double left = self->_coverInsets.left;
  double bottom = self->_coverInsets.bottom;
  double right = self->_coverInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setCoverInsets:(UIEdgeInsets)a3
{
  self->_coverInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hintLabel, 0);

  objc_storeStrong((id *)&self->_referenceButton, 0);
}

@end