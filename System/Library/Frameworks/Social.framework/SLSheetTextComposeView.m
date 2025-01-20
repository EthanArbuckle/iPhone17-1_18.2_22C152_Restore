@interface SLSheetTextComposeView
- (BOOL)becomeFirstResponder;
- (BOOL)resignFirstResponder;
- (SLSheetTextComposeView)initWithFrame:(CGRect)a3;
- (UILabel)placeholderLabel;
- (UITextView)textView;
- (double)textRightInset;
- (void)_assembleView;
- (void)layoutSubviews;
- (void)restoreKeyboard;
- (void)setPlaceholderLabel:(id)a3;
- (void)setTextRightInset:(double)a3;
- (void)setTextView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SLSheetTextComposeView

- (SLSheetTextComposeView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SLSheetTextComposeView;
  v3 = -[SLSheetTextComposeView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(SLSheetTextComposeView *)v3 _assembleView];
  }
  return v4;
}

- (void)_assembleView
{
  [(SLSheetTextComposeView *)self setClipsToBounds:1];
  v3 = [MEMORY[0x1E4F428B8] clearColor];
  [(SLSheetTextComposeView *)self setBackgroundColor:v3];

  [(SLSheetTextComposeView *)self setOpaque:0];
  id v4 = objc_alloc_init(MEMORY[0x1E4F42F58]);
  [(SLSheetTextComposeView *)self setTextView:v4];

  v5 = [(SLSheetTextComposeView *)self textView];
  [v5 setClipsToBounds:0];

  objc_super v6 = [(SLSheetTextComposeView *)self textView];
  [v6 setAutoresizingMask:18];

  v7 = [MEMORY[0x1E4F428B8] clearColor];
  v8 = [(SLSheetTextComposeView *)self textView];
  [v8 setBackgroundColor:v7];

  v9 = [(SLSheetTextComposeView *)self textView];
  [v9 setOpaque:0];

  v10 = [(SLSheetTextComposeView *)self textView];
  [v10 setContentMode:3];

  v11 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
  v12 = [(SLSheetTextComposeView *)self textView];
  [v12 setFont:v11];

  v13 = [(SLSheetTextComposeView *)self textView];
  [v13 setBounces:1];

  v14 = [(SLSheetTextComposeView *)self textView];
  [v14 setAlwaysBounceVertical:1];

  v15 = (UILabel *)objc_opt_new();
  placeholderLabel = self->_placeholderLabel;
  self->_placeholderLabel = v15;

  [(UILabel *)self->_placeholderLabel setNumberOfLines:0];
  v17 = self->_placeholderLabel;
  v18 = [(SLSheetTextComposeView *)self textView];
  v19 = [v18 font];
  [(UILabel *)v17 setFont:v19];

  v20 = self->_placeholderLabel;
  v21 = [MEMORY[0x1E4F428B8] placeholderTextColor];
  [(UILabel *)v20 setTextColor:v21];

  [(SLSheetTextComposeView *)self addSubview:self->_placeholderLabel];
  id v22 = [(SLSheetTextComposeView *)self textView];
  [(SLSheetTextComposeView *)self addSubview:v22];
}

- (void)setTextRightInset:(double)a3
{
  self->_textRightInset = a3;
  [(SLSheetTextComposeView *)self setNeedsLayout];
}

- (BOOL)becomeFirstResponder
{
  v2 = [(SLSheetTextComposeView *)self textView];
  char v3 = [v2 becomeFirstResponder];

  return v3;
}

- (BOOL)resignFirstResponder
{
  v2 = [(SLSheetTextComposeView *)self textView];
  char v3 = [v2 resignFirstResponder];

  return v3;
}

- (void)layoutSubviews
{
  int v3 = [(SLSheetTextComposeView *)self _shouldReverseLayoutDirection];
  [(SLSheetTextComposeView *)self textRightInset];
  double v5 = -v4;
  objc_super v6 = [(SLSheetTextComposeView *)self textView];
  objc_msgSend(v6, "setScrollIndicatorInsets:", 0.0, 0.0, 0.0, v5);

  [(SLSheetTextComposeView *)self bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [(SLSheetTextComposeView *)self textRightInset];
  double v16 = v12 - v15;
  if (v3)
  {
    [(SLSheetTextComposeView *)self textRightInset];
    double v8 = v8 + v17;
  }
  v18 = [(SLSheetTextComposeView *)self textView];
  objc_msgSend(v18, "setFrame:", v8, v10, v16, v14);

  if (v3)
  {
    v26.origin.x = v8;
    v26.origin.y = v10;
    v26.size.width = v16;
    v26.size.height = v14;
    double MaxX = CGRectGetMaxX(v26);
    [(UILabel *)self->_placeholderLabel frame];
    double v8 = MaxX - v20;
    CGFloat v21 = -5.0;
  }
  else
  {
    CGFloat v21 = 5.0;
  }
  [(UILabel *)self->_placeholderLabel frame];
  -[UILabel sizeThatFits:](self->_placeholderLabel, "sizeThatFits:", v16, 1.79769313e308);
  v27.size.width = v22;
  v27.size.height = v23;
  placeholderLabel = self->_placeholderLabel;
  v27.origin.x = v8;
  v27.origin.y = v10;
  CGRect v28 = CGRectOffset(v27, v21, 8.0);

  -[UILabel setFrame:](placeholderLabel, "setFrame:", v28.origin.x, v28.origin.y, v28.size.width, v28.size.height);
}

- (void)restoreKeyboard
{
  id v2 = [MEMORY[0x1E4F42B08] activeKeyboard];
  [v2 setShowsCandidatesInline:0];
}

- (void)traitCollectionDidChange:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SLSheetTextComposeView;
  id v4 = a3;
  [(SLSheetTextComposeView *)&v13 traitCollectionDidChange:v4];
  double v5 = [(SLSheetTextComposeView *)self traitCollection];
  objc_super v6 = [v5 preferredContentSizeCategory];
  double v7 = [v4 preferredContentSizeCategory];

  LOBYTE(v4) = [v6 isEqualToString:v7];
  if ((v4 & 1) == 0)
  {
    double v8 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
    double v9 = [(SLSheetTextComposeView *)self textView];
    [v9 setFont:v8];

    placeholderLabel = self->_placeholderLabel;
    double v11 = [(SLSheetTextComposeView *)self textView];
    double v12 = [v11 font];
    [(UILabel *)placeholderLabel setFont:v12];

    [(SLSheetTextComposeView *)self setNeedsLayout];
    [(SLSheetTextComposeView *)self layoutIfNeeded];
  }
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (UILabel)placeholderLabel
{
  return self->_placeholderLabel;
}

- (void)setPlaceholderLabel:(id)a3
{
}

- (double)textRightInset
{
  return self->_textRightInset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderLabel, 0);

  objc_storeStrong((id *)&self->_textView, 0);
}

@end