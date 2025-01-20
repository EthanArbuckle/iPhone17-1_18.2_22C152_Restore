@interface HKNumberedListItemView
+ (CGSize)listItemSize;
+ (id)createNumberedViewWithInteger:(unint64_t)a3;
+ (id)numberFont;
- (HKNumberedListItemView)initWithInteger:(unint64_t)a3;
- (UILabel)numberLabel;
- (UIView)numberLabelBackground;
- (unint64_t)number;
- (void)_setUpConstraints;
- (void)_setUpUI;
- (void)layoutSubviews;
- (void)setNumber:(unint64_t)a3;
- (void)setNumberLabel:(id)a3;
- (void)setNumberLabelBackground:(id)a3;
- (void)setTintColor:(id)a3;
@end

@implementation HKNumberedListItemView

- (HKNumberedListItemView)initWithInteger:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HKNumberedListItemView;
  v4 = [(HKNumberedListItemView *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_number = a3;
    [(HKNumberedListItemView *)v4 _setUpUI];
    [(HKNumberedListItemView *)v5 _setUpConstraints];
  }
  return v5;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)HKNumberedListItemView;
  [(HKNumberedListItemView *)&v6 layoutSubviews];
  [(HKNumberedListItemView *)self frame];
  CGFloat v3 = CGRectGetWidth(v7) * 0.5;
  v4 = [(HKNumberedListItemView *)self layer];
  [v4 setCornerRadius:v3];

  v5 = [(HKNumberedListItemView *)self layer];
  [v5 setMasksToBounds:1];
}

- (void)setTintColor:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HKNumberedListItemView;
  id v4 = a3;
  [(HKNumberedListItemView *)&v8 setTintColor:v4];
  id v5 = v4;
  uint64_t v6 = objc_msgSend(v5, "CGColor", v8.receiver, v8.super_class);

  CGRect v7 = [(HKNumberedListItemView *)self layer];
  [v7 setBackgroundColor:v6];
}

- (void)_setUpUI
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [(HKNumberedListItemView *)self setNumberLabel:v3];

  HKNumberFormatterFromTemplate(0);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HKNumberedListItemView number](self, "number"));
  id v5 = [v12 stringFromNumber:v4];
  uint64_t v6 = [(HKNumberedListItemView *)self numberLabel];
  [v6 setText:v5];

  CGRect v7 = [(id)objc_opt_class() numberFont];
  objc_super v8 = [(HKNumberedListItemView *)self numberLabel];
  [v8 setFont:v7];

  v9 = [(HKNumberedListItemView *)self numberLabel];
  [v9 setAdjustsFontForContentSizeCategory:1];

  v10 = [(HKNumberedListItemView *)self numberLabel];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  v11 = [(HKNumberedListItemView *)self numberLabel];
  [(HKNumberedListItemView *)self addSubview:v11];
}

- (void)_setUpConstraints
{
  id v3 = [(HKNumberedListItemView *)self numberLabel];
  objc_msgSend(v3, "hk_alignCenterConstraintsWithView:", self);
}

+ (id)createNumberedViewWithInteger:(unint64_t)a3
{
  id v3 = [[HKNumberedListItemView alloc] initWithInteger:a3];
  id v4 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_appKeyColor");
  [(HKNumberedListItemView *)v3 setTintColor:v4];

  id v5 = [MEMORY[0x1E4FB1618] whiteColor];
  uint64_t v6 = [(HKNumberedListItemView *)v3 numberLabel];
  [v6 setTextColor:v5];

  [(HKNumberedListItemView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  return v3;
}

+ (id)numberFont
{
  return (id)objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E4FB28C8], 2);
}

+ (CGSize)listItemSize
{
  v2 = +[HKNumberedListItemView numberFont];
  [v2 _scaledValueForValue:28.0];
  double v4 = v3;

  double v5 = v4;
  double v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (UILabel)numberLabel
{
  return self->_numberLabel;
}

- (void)setNumberLabel:(id)a3
{
}

- (unint64_t)number
{
  return self->_number;
}

- (void)setNumber:(unint64_t)a3
{
  self->_number = a3;
}

- (UIView)numberLabelBackground
{
  return self->_numberLabelBackground;
}

- (void)setNumberLabelBackground:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberLabelBackground, 0);
  objc_storeStrong((id *)&self->_numberLabel, 0);
}

@end