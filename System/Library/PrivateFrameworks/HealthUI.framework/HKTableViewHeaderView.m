@interface HKTableViewHeaderView
- (CGSize)intrinsicContentSize;
- (HKTableViewHeaderView)init;
- (UIEdgeInsets)contentInsets;
- (UILabel)label;
- (double)preferredMaxLayoutWidth;
- (void)layoutSubviews;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setPreferredMaxLayoutWidth:(double)a3;
- (void)updateFont;
@end

@implementation HKTableViewHeaderView

- (HKTableViewHeaderView)init
{
  v7.receiver = self;
  v7.super_class = (Class)HKTableViewHeaderView;
  v2 = [(HKTableViewHeaderView *)&v7 init];
  if (v2)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    label = v2->_label;
    v2->_label = v3;

    [(UILabel *)v2->_label setNumberOfLines:0];
    v5 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v2->_label setTextColor:v5];

    [(UILabel *)v2->_label setTextAlignment:4];
    [(HKTableViewHeaderView *)v2 updateFont];
    [(HKTableViewHeaderView *)v2 addSubview:v2->_label];
  }
  return v2;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
  [(HKTableViewHeaderView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  [(HKTableViewHeaderView *)self bounds];
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double v6 = v5 + left;
  double v8 = v7 + top;
  double v10 = v9 - (left + self->_contentInsets.right);
  label = self->_label;
  double v13 = v12 - (top + self->_contentInsets.bottom);
  -[UILabel setFrame:](label, "setFrame:", v6, v8, v10, v13);
}

- (void)updateFont
{
  v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
  [(UILabel *)self->_label setFont:v3];

  [(HKTableViewHeaderView *)self setNeedsLayout];
}

- (void)setPreferredMaxLayoutWidth:(double)a3
{
  self->_preferredMaxLayoutWidth = a3;
  [(UILabel *)self->_label setPreferredMaxLayoutWidth:a3 - self->_contentInsets.left - self->_contentInsets.right];
}

- (CGSize)intrinsicContentSize
{
  [(UILabel *)self->_label intrinsicContentSize];
  double preferredMaxLayoutWidth = self->_preferredMaxLayoutWidth;
  double v5 = v4 + self->_contentInsets.top + self->_contentInsets.bottom;
  result.height = v5;
  result.width = preferredMaxLayoutWidth;
  return result;
}

- (UILabel)label
{
  return self->_label;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)preferredMaxLayoutWidth
{
  return self->_preferredMaxLayoutWidth;
}

- (void).cxx_destruct
{
}

@end