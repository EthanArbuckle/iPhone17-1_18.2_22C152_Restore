@interface PHDoubleLineTableViewCell
- (NSDirectionalEdgeInsets)rootViewLayoutMargins;
- (UIColor)subtitleLabelTextColor;
- (double)subtitleLabelFirstBaselineLayoutConstraintConstant;
- (double)subtitleLabelLastBaselineLayoutConstraintConstant;
- (double)titleLabelFirstBaselineLayoutConstraintConstant;
- (id)loadRootViewAndContentViews;
- (void)_updateTextColor;
- (void)tintColorDidChange;
@end

@implementation PHDoubleLineTableViewCell

- (id)loadRootViewAndContentViews
{
  v11.receiver = self;
  v11.super_class = (Class)PHDoubleLineTableViewCell;
  v3 = [(PHTableViewCell *)&v11 loadRootViewAndContentViews];
  v4 = [(PHDoubleLineTableViewCell *)self traitCollection];
  if ([v4 preferredContentSizeCategoryAllowsMultilineTitleForDoubleLineCells]) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = 2;
  }
  v6 = [(PHTableViewCell *)self titleLabel];
  [v6 setNumberOfLines:v5];

  v7 = [(PHTableViewCell *)self subtitleLabel];
  [v7 setNumberOfLines:2];

  v8 = [(PHDoubleLineTableViewCell *)self subtitleLabelTextColor];
  v9 = [(PHTableViewCell *)self subtitleLabel];
  [v9 setTextColor:v8];

  return v3;
}

- (NSDirectionalEdgeInsets)rootViewLayoutMargins
{
  v16.receiver = self;
  v16.super_class = (Class)PHDoubleLineTableViewCell;
  [(PHTableViewCell *)&v16 rootViewLayoutMargins];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  v10 = +[UITraitCollection _currentTraitCollection];
  unsigned int v11 = [v10 isPreferredContentSizeCategoryAccessible];

  if (v11) {
    double v12 = v9;
  }
  else {
    double v12 = 6.0;
  }
  double v13 = v3;
  double v14 = v5;
  double v15 = v7;
  result.trailing = v12;
  result.bottom = v15;
  result.leading = v14;
  result.top = v13;
  return result;
}

- (double)subtitleLabelFirstBaselineLayoutConstraintConstant
{
  double v2 = +[UIFont telephonyUISubheadlineShortFont];
  double v3 = [v2 fontDescriptor];
  double v4 = [v3 objectForKey:UIFontDescriptorTextStyleAttribute];

  if (v4)
  {
    double v5 = +[UIFontMetrics metricsForTextStyle:v4];
    [v5 scaledValueForValue:20.0];
    double v7 = v6;
  }
  else
  {
    double v7 = 20.0;
  }

  return v7;
}

- (double)subtitleLabelLastBaselineLayoutConstraintConstant
{
  double v2 = +[UIFont telephonyUIBodyShortFont];
  double v3 = [v2 fontDescriptor];
  double v4 = [v3 objectForKey:UIFontDescriptorTextStyleAttribute];

  if (v4)
  {
    double v5 = +[UIFontMetrics metricsForTextStyle:v4];
    [v5 scaledValueForValue:13.0];
    double v7 = v6;
  }
  else
  {
    double v7 = 13.0;
  }

  return v7;
}

- (double)titleLabelFirstBaselineLayoutConstraintConstant
{
  double v2 = +[UIFont telephonyUIBodyShortFont];
  double v3 = [v2 fontDescriptor];
  double v4 = [v3 objectForKey:UIFontDescriptorTextStyleAttribute];

  if (v4)
  {
    double v5 = +[UIFontMetrics metricsForTextStyle:v4];
    [v5 scaledValueForValue:27.0];
    double v7 = v6;
  }
  else
  {
    double v7 = 27.0;
  }

  return v7;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PHDoubleLineTableViewCell;
  [(PHDoubleLineTableViewCell *)&v3 tintColorDidChange];
  [(PHDoubleLineTableViewCell *)self _updateTextColor];
}

- (void)_updateTextColor
{
  objc_super v3 = [(PHTableViewCell *)self subtitleLabel];
  double v4 = [v3 attributedText];

  if (v4)
  {
    id v5 = [objc_alloc((Class)NSMutableAttributedString) initWithAttributedString:v4];
    id v6 = [v5 length];
    unsigned int v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    double v13 = sub_1000274C8;
    double v14 = &unk_10008DF20;
    double v15 = self;
    id v16 = v5;
    id v7 = v5;
    [v7 enumerateAttribute:NSForegroundColorAttributeName inRange:0 options:0 usingBlock:&v11];
    double v8 = [(PHTableViewCell *)self subtitleLabel];
    [v8 setAttributedText:v7];
  }
  else
  {
    id v7 = [(PHDoubleLineTableViewCell *)self subtitleLabelTextColor];
    double v9 = [(PHDoubleLineTableViewCell *)self _accessibilityHigherContrastTintColorForColor:v7];
    v10 = [(PHTableViewCell *)self subtitleLabel];
    [v10 setTextColor:v9];
  }
}

- (UIColor)subtitleLabelTextColor
{
  return (UIColor *)+[UIColor dynamicSecondaryLabelColor];
}

@end