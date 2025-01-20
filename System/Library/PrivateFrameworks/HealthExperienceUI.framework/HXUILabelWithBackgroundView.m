@interface HXUILabelWithBackgroundView
- (CGSize)sizeThatFits:(CGSize)a3;
- (HXUILabelWithBackgroundView)initWithFrame:(CGRect)a3;
- (NSString)text;
- (UIColor)textColor;
- (int64_t)numberOfLines;
- (void)layoutSubviews;
- (void)setNumberOfLines:(int64_t)a3;
- (void)setText:(id)a3;
- (void)setTextColor:(id)a3;
@end

@implementation HXUILabelWithBackgroundView

- (HXUILabelWithBackgroundView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)HXUILabelWithBackgroundView;
  v3 = -[HXUILabelWithBackgroundView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    label = v3->_label;
    v3->_label = v4;

    v6 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", *MEMORY[0x1E4FB28C8]);
    [(UILabel *)v3->_label setFont:v6];

    [(UILabel *)v3->_label setTextAlignment:1];
    [(UILabel *)v3->_label setAdjustsFontForContentSizeCategory:1];
    v7 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v3->_label setTextColor:v7];

    [(HXUILabelWithBackgroundView *)v3 addSubview:v3->_label];
    v8 = [(HXUILabelWithBackgroundView *)v3 layer];
    [v8 setCornerRadius:8.0];

    v9 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
    [(HXUILabelWithBackgroundView *)v3 setBackgroundColor:v9];
  }
  return v3;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HXUILabelWithBackgroundView;
  [(HXUILabelWithBackgroundView *)&v3 layoutSubviews];
  [(HXUILabelWithBackgroundView *)self bounds];
  CGRect v5 = CGRectInset(v4, 12.0, 7.0);
  -[UILabel setFrame:](self->_label, "setFrame:", v5.origin.x, v5.origin.y, v5.size.width, v5.size.height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = a3.width + -24.0;
  if (v3 < 0.0) {
    double v3 = 0.0;
  }
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", v3, a3.height);
  double v5 = v4 + 24.0;
  double v7 = v6 + 14.0;
  result.height = v7;
  result.width = v5;
  return result;
}

- (void)setText:(id)a3
{
  [(UILabel *)self->_label setText:a3];
  [(HXUILabelWithBackgroundView *)self setNeedsLayout];
}

- (NSString)text
{
  return [(UILabel *)self->_label text];
}

- (void)setTextColor:(id)a3
{
}

- (UIColor)textColor
{
  return [(UILabel *)self->_label textColor];
}

- (void)setNumberOfLines:(int64_t)a3
{
}

- (int64_t)numberOfLines
{
  return [(UILabel *)self->_label numberOfLines];
}

- (void).cxx_destruct
{
}

@end