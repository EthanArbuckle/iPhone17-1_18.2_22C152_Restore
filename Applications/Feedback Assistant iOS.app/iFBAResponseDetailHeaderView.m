@interface iFBAResponseDetailHeaderView
- (FBKContentItem)representedItem;
- (UILabel)closedLabel;
- (UILabel)titleLabel;
- (UIStackView)stackView;
- (iFBAResponseDetailHeaderView)initWithCoder:(id)a3;
- (iFBAResponseDetailHeaderView)initWithContentItem:(id)a3;
- (void)awakeFromNib;
- (void)layoutSubviews;
- (void)setClosedLabel:(id)a3;
- (void)setRepresentedItem:(id)a3;
- (void)setStackView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)updateWithItem:(id)a3;
@end

@implementation iFBAResponseDetailHeaderView

- (iFBAResponseDetailHeaderView)initWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)iFBAResponseDetailHeaderView;
  v3 = [(iFBAResponseDetailHeaderView *)&v11 initWithCoder:a3];
  if (v3)
  {
    v4 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:0];
    v5 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:2];
    v12[0] = v4;
    v6 = +[UIColor systemBackgroundColor];
    v12[1] = v5;
    v13[0] = v6;
    v7 = +[UIColor secondarySystemBackgroundColor];
    v13[1] = v7;
    v8 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];

    v9 = +[UIColor _dynamicColorWithColorsByTraitCollection:v8];
    [(iFBAResponseDetailHeaderView *)v3 setBackgroundColor:v9];
  }
  return v3;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)iFBAResponseDetailHeaderView;
  [(iFBAResponseDetailHeaderView *)&v6 layoutSubviews];
  v3 = [(iFBAResponseDetailHeaderView *)self titleLabel];
  [v3 frame];
  double Width = CGRectGetWidth(v7);
  v5 = [(iFBAResponseDetailHeaderView *)self titleLabel];
  [v5 setPreferredMaxLayoutWidth:Width];
}

- (void)awakeFromNib
{
  v9.receiver = self;
  v9.super_class = (Class)iFBAResponseDetailHeaderView;
  [(iFBAResponseDetailHeaderView *)&v9 awakeFromNib];
  v3 = +[UIColor labelColor];
  v4 = [(iFBAResponseDetailHeaderView *)self titleLabel];
  [v4 setTextColor:v3];

  v5 = +[UIFont boldSystemFontOfSize:20.0];
  objc_super v6 = +[UIFontMetrics metricsForTextStyle:UIFontTextStyleHeadline];
  CGRect v7 = [v6 scaledFontForFont:v5];
  v8 = [(iFBAResponseDetailHeaderView *)self titleLabel];
  [v8 setFont:v7];
}

- (iFBAResponseDetailHeaderView)initWithContentItem:(id)a3
{
  id v4 = a3;
  v5 = +[NSBundle mainBundle];
  objc_super v6 = (objc_class *)objc_opt_class();
  CGRect v7 = NSStringFromClass(v6);
  v8 = [v5 loadNibNamed:v7 owner:self options:0];
  objc_super v9 = [v8 objectAtIndex:0];

  if (v9) {
    [(iFBAResponseDetailHeaderView *)v9 updateWithItem:v4];
  }

  return v9;
}

- (void)updateWithItem:(id)a3
{
  id v14 = a3;
  [(iFBAResponseDetailHeaderView *)self setRepresentedItem:v14];
  if (v14)
  {
    id v4 = [v14 displayTitle];
    v5 = [(iFBAResponseDetailHeaderView *)self titleLabel];
    [v5 setText:v4];

    if ([v14 isClosedFeedback])
    {
      objc_super v6 = [(iFBAResponseDetailHeaderView *)self stackView];
      CGRect v7 = [(iFBAResponseDetailHeaderView *)self closedLabel];
      [v6 insertArrangedSubview:v7 atIndex:1];

      v8 = +[NSBundle mainBundle];
      objc_super v9 = [v8 localizedStringForKey:@"CLOSED_FEEDBACK_STATE" value:&stru_1000F6658 table:FBKCommonStrings];
      v10 = [(iFBAResponseDetailHeaderView *)self closedLabel];
      [v10 setText:v9];
    }
    else
    {
      v13 = [(iFBAResponseDetailHeaderView *)self closedLabel];
      [v13 setText:&stru_1000F6658];

      v8 = [(iFBAResponseDetailHeaderView *)self stackView];
      objc_super v9 = [(iFBAResponseDetailHeaderView *)self closedLabel];
      [v8 removeArrangedSubview:v9];
    }
  }
  else
  {
    objc_super v11 = [(iFBAResponseDetailHeaderView *)self titleLabel];
    [v11 setText:&stru_1000F6658];

    v12 = [(iFBAResponseDetailHeaderView *)self closedLabel];
    [v12 setText:&stru_1000F6658];

    v8 = [(iFBAResponseDetailHeaderView *)self closedLabel];
    [v8 setText:&stru_1000F6658];
  }

  [(iFBAResponseDetailHeaderView *)self setNeedsLayout];
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (UILabel)titleLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_titleLabel);

  return (UILabel *)WeakRetained;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)closedLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_closedLabel);

  return (UILabel *)WeakRetained;
}

- (void)setClosedLabel:(id)a3
{
}

- (FBKContentItem)representedItem
{
  return self->_representedItem;
}

- (void)setRepresentedItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_representedItem, 0);
  objc_destroyWeak((id *)&self->_closedLabel);
  objc_destroyWeak((id *)&self->_titleLabel);

  objc_storeStrong((id *)&self->_stackView, 0);
}

@end