@interface _HKMonthTitleView
- (BOOL)isHighlighted;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UILabel)monthTitle;
- (_HKMonthTitleView)initWithFrame:(CGRect)a3;
- (double)bottomPadding;
- (double)dividerOriginX;
- (double)dividerWidth;
- (double)topPadding;
- (id)_monthStringFromDate:(id)a3;
- (void)_updateFont;
- (void)layoutSubviews;
- (void)setBottomPadding:(double)a3;
- (void)setDate:(id)a3;
- (void)setDividerOriginX:(double)a3;
- (void)setDividerWidth:(double)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setMonthTitle:(id)a3;
- (void)setTopPadding:(double)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation _HKMonthTitleView

- (_HKMonthTitleView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_HKMonthTitleView;
  v3 = -[_HKMonthTitleView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    monthTitle = v3->_monthTitle;
    v3->_monthTitle = v4;

    [(UILabel *)v3->_monthTitle setTextAlignment:1];
    [(_HKMonthTitleView *)v3 addSubview:v3->_monthTitle];
    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    dividerLine = v3->_dividerLine;
    v3->_dividerLine = v6;

    v8 = [MEMORY[0x1E4FB1618] tableSeparatorColor];
    [(UIView *)v3->_dividerLine setBackgroundColor:v8];

    [(_HKMonthTitleView *)v3 addSubview:v3->_dividerLine];
    [(_HKMonthTitleView *)v3 _updateFont];
    [(_HKMonthTitleView *)v3 setTopPadding:10.0];
    [(_HKMonthTitleView *)v3 setBottomPadding:7.0];
  }
  return v3;
}

- (void)_updateFont
{
  uint64_t v3 = *MEMORY[0x1E4FB2798];
  if (HKUIApplicationContentSizeCategoryIsLargerThanSizeCategory((void *)*MEMORY[0x1E4FB2798]))
  {
    v4 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:v3];
    [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2998] maximumContentSizeCategory:v3 compatibleWithTraitCollection:v4];
  }
  else
  {
    v4 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2998] addingSymbolicTraits:32770 options:0];
    [MEMORY[0x1E4FB08E0] fontWithDescriptor:v4 size:20.0];
  }
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  [(UILabel *)self->_monthTitle setFont:v5];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(UILabel *)self->_monthTitle frame];
  double v5 = v4;
  [(UILabel *)self->_monthTitle frame];
  double v7 = v6;
  [(_HKMonthTitleView *)self bottomPadding];
  double v9 = v8 + v7;
  double v10 = v5;
  result.height = v9;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)_HKMonthTitleView;
  [(_HKMonthTitleView *)&v11 layoutSubviews];
  [(UILabel *)self->_monthTitle frame];
  double MaxY = CGRectGetMaxY(v12);
  double v4 = [(UILabel *)self->_monthTitle font];
  [v4 descender];
  double v6 = MaxY + v5 + 12.0;

  dividerLine = self->_dividerLine;
  [(_HKMonthTitleView *)self dividerOriginX];
  double v9 = v8;
  [(_HKMonthTitleView *)self dividerWidth];
  -[UIView setFrame:](dividerLine, "setFrame:", v9, v6, v10, HKUIOnePixel());
}

- (id)_monthStringFromDate:(id)a3
{
  return HKLocalizedStringForDateAndTemplate(a3, 2);
}

- (void)setDate:(id)a3
{
  monthTitle = self->_monthTitle;
  double v5 = [(_HKMonthTitleView *)self _monthStringFromDate:a3];
  [(UILabel *)monthTitle setText:v5];

  [(UILabel *)self->_monthTitle sizeToFit];
  [(UILabel *)self->_monthTitle frame];
  double Height = CGRectGetHeight(v13);
  [(UILabel *)self->_monthTitle frame];
  double v7 = Height - CGRectGetMaxY(v14);
  double v8 = [(UILabel *)self->_monthTitle font];
  [v8 descender];
  double v10 = v7 + v9 + 12.0;

  objc_super v11 = self->_monthTitle;
  -[UILabel setDirectionalLayoutMargins:](v11, "setDirectionalLayoutMargins:", 0.0, 0.0, v10, 0.0);
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
  if (a3) {
    HKHealthKeyColor();
  }
  else {
  id v5 = [MEMORY[0x1E4FB1618] labelColor];
  }
  double v4 = [(_HKMonthTitleView *)self monthTitle];
  [v4 setTextColor:v5];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HKMonthTitleView;
  [(_HKMonthTitleView *)&v9 traitCollectionDidChange:v4];
  if (v4)
  {
    id v5 = [(_HKMonthTitleView *)self traitCollection];
    double v6 = [v5 preferredContentSizeCategory];
    double v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      [(_HKMonthTitleView *)self _updateFont];
      [(_HKMonthTitleView *)self setNeedsLayout];
    }
  }
}

- (UILabel)monthTitle
{
  return self->_monthTitle;
}

- (void)setMonthTitle:(id)a3
{
}

- (double)topPadding
{
  return self->_topPadding;
}

- (void)setTopPadding:(double)a3
{
  self->_topPadding = a3;
}

- (double)bottomPadding
{
  return self->_bottomPadding;
}

- (void)setBottomPadding:(double)a3
{
  self->_bottomPadding = a3;
}

- (double)dividerOriginX
{
  return self->_dividerOriginX;
}

- (void)setDividerOriginX:(double)a3
{
  self->_dividerOriginX = a3;
}

- (double)dividerWidth
{
  return self->_dividerWidth;
}

- (void)setDividerWidth:(double)a3
{
  self->_dividerWidth = a3;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monthTitle, 0);
  objc_storeStrong((id *)&self->_dividerLine, 0);
}

@end