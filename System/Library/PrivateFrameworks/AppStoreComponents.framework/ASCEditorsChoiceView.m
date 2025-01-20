@interface ASCEditorsChoiceView
+ (double)laurelPadding;
+ (id)editorsChoiceFont;
+ (id)editorsChoiceText;
+ (id)leftLaurel;
+ (id)rightLaurel;
- (ASCEditorsChoiceView)initWithCoder:(id)a3;
- (ASCEditorsChoiceView)initWithFrame:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIColor)color;
- (UILabel)titleLabel;
- (id)accessibilityLabel;
- (void)drawRect:(CGRect)a3;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)setColor:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation ASCEditorsChoiceView

+ (id)leftLaurel
{
  return +[ASCImageRenderer bundleImageNamed:@"LaurelLeftSmall" compatibleWithTraitCollection:0];
}

+ (id)rightLaurel
{
  return +[ASCImageRenderer bundleImageNamed:@"LaurelRightSmall" compatibleWithTraitCollection:0];
}

+ (id)editorsChoiceText
{
  return (id)ASCLocalizedString(@"EDITORS_CHOICE_TEXT", a2);
}

+ (double)laurelPadding
{
  return 4.0;
}

+ (id)editorsChoiceFont
{
  if (editorsChoiceFont_onceToken != -1) {
    dispatch_once(&editorsChoiceFont_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)editorsChoiceFont_editorsChoiceFont;

  return v2;
}

uint64_t __41__ASCEditorsChoiceView_editorsChoiceFont__block_invoke()
{
  editorsChoiceFont_editorsChoiceFont = [MEMORY[0x1E4FB1798] systemFontOfSize:14.0 weight:*MEMORY[0x1E4FB29C8]];

  return MEMORY[0x1F41817F8]();
}

- (ASCEditorsChoiceView)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)ASCEditorsChoiceView;
  v3 = -[ASCEditorsChoiceView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[ASCEditorsChoiceView setLayoutMargins:](v3, "setLayoutMargins:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    v5 = [MEMORY[0x1E4FB1618] clearColor];
    [(ASCEditorsChoiceView *)v4 setBackgroundColor:v5];

    [(ASCEditorsChoiceView *)v4 setContentMode:3];
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v6;

    [(UILabel *)v4->_titleLabel setLineBreakMode:0];
    v8 = v4->_titleLabel;
    v9 = [MEMORY[0x1E4FB1618] grayColor];
    [(UILabel *)v8 setTextColor:v9];

    v10 = v4->_titleLabel;
    v11 = +[ASCEditorsChoiceView editorsChoiceText];
    [(UILabel *)v10 setText:v11];

    v12 = v4->_titleLabel;
    v13 = +[ASCEditorsChoiceView editorsChoiceFont];
    [(UILabel *)v12 setFont:v13];

    [(UILabel *)v4->_titleLabel setTextAlignment:1];
    [(UILabel *)v4->_titleLabel setAdjustsFontSizeToFitWidth:1];
    [(ASCEditorsChoiceView *)v4 addSubview:v4->_titleLabel];
  }
  return v4;
}

- (ASCEditorsChoiceView)initWithCoder:(id)a3
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v4 = +[ASCEditorsChoiceView leftLaurel];
  v5 = +[ASCEditorsChoiceView rightLaurel];
  +[ASCEditorsChoiceView laurelPadding];
  double v7 = v6;
  [v4 size];
  double v9 = v8;
  [v5 size];
  double v11 = v9 + v7 * 2.0 + v10;
  [(UILabel *)self->_titleLabel intrinsicContentSize];
  double v13 = v11 + v12;
  [v4 size];
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)ASCEditorsChoiceView;
  [(ASCEditorsChoiceView *)&v20 layoutSubviews];
  v3 = +[ASCEditorsChoiceView leftLaurel];
  v4 = +[ASCEditorsChoiceView rightLaurel];
  +[ASCEditorsChoiceView laurelPadding];
  double v6 = v5;
  [(ASCEditorsChoiceView *)self bounds];
  double v8 = v7;
  [v3 size];
  double v10 = v9 + v6 * 2.0;
  [v4 size];
  double v12 = v8 - (v10 + v11);
  titleLabel = self->_titleLabel;
  [(ASCEditorsChoiceView *)self bounds];
  -[UILabel sizeThatFits:](titleLabel, "sizeThatFits:", v12, v14);
  double v16 = v15;
  [v3 size];
  double v18 = v6 + v17;
  [(ASCEditorsChoiceView *)self bounds];
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v18, v19 * 0.5 - v16 * 0.5, v12, v16);
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v22 = +[ASCEditorsChoiceView leftLaurel];
  [v22 size];
  double v8 = v7;
  [v22 size];
  double v10 = v8 * v9;
  [v22 size];
  double v12 = v10 / v11;
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v24);
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  objc_msgSend(v22, "drawInRect:", MinX, CGRectGetMidY(v25) - v8 * 0.5, v12, v8);
  double v14 = +[ASCEditorsChoiceView rightLaurel];
  [v14 size];
  double v16 = v15;
  [v14 size];
  double v18 = v16 * v17;
  [v14 size];
  double v20 = v18 / v19;
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  CGFloat v21 = CGRectGetMaxX(v26) - v20;
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  objc_msgSend(v14, "drawInRect:", v21, CGRectGetMidY(v27) - v16 * 0.5, v20, v16);
}

- (id)accessibilityLabel
{
  return (id)ASCLocalizedString(@"AX_EDITORS_CHOICE_TEXT", a2);
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_color, 0);
}

@end