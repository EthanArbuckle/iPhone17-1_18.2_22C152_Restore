@interface NCScheduledDeliveryAppDetailCell
+ (double)defaultCellHeight;
+ (int64_t)cellStyle;
- (double)_availableWidthForCountBar;
- (double)_widthForCountBarView;
- (id)_parentViewForCountBar;
- (void)_configureCountBarDotViewIfNecessary;
- (void)_configureCountBarViewIfNecessary;
- (void)_configureCountLabelIfNecessary;
- (void)_layoutCountBarDotView;
- (void)_layoutCountBarView;
- (void)_layoutCountLabel;
- (void)layoutSubviews;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation NCScheduledDeliveryAppDetailCell

+ (int64_t)cellStyle
{
  return 3;
}

+ (double)defaultCellHeight
{
  return UITableViewAutomaticDimension;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NCScheduledDeliveryAppDetailCell;
  id v4 = a3;
  [(NCScheduledDeliveryAppDetailCell *)&v8 refreshCellContentsWithSpecifier:v4];
  v5 = objc_msgSend(v4, "propertyForKey:", @"SCHEDULED_DELIVERY_APP_COUNT_KEY", v8.receiver, v8.super_class);
  self->_count = (unint64_t)[v5 unsignedIntegerValue];

  v6 = [v4 propertyForKey:@"SCHEDULED_DELIVERY_MAX_COUNT_KEY"];

  self->_maxCount = (unint64_t)[v6 unsignedIntegerValue];
  v7 = [(NCScheduledDeliveryAppDetailCell *)self detailTextLabel];
  [v7 setText:@" "];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NCScheduledDeliveryAppDetailCell;
  [(NCScheduledDeliveryAppDetailCell *)&v3 layoutSubviews];
  [(NCScheduledDeliveryAppDetailCell *)self _configureCountBarViewIfNecessary];
  [(NCScheduledDeliveryAppDetailCell *)self _configureCountBarDotViewIfNecessary];
  [(NCScheduledDeliveryAppDetailCell *)self _configureCountLabelIfNecessary];
  [(NCScheduledDeliveryAppDetailCell *)self _layoutCountLabel];
  [(NCScheduledDeliveryAppDetailCell *)self _layoutCountBarView];
  [(NCScheduledDeliveryAppDetailCell *)self _layoutCountBarDotView];
}

- (void)_configureCountBarViewIfNecessary
{
  if (!self->_countBarView)
  {
    objc_super v3 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    countBarView = self->_countBarView;
    self->_countBarView = v3;

    v5 = self->_countBarView;
    v6 = +[UIColor systemGray3Color];
    [(UIView *)v5 setBackgroundColor:v6];

    [(UIView *)self->_countBarView _setContinuousCornerRadius:2.0];
    id v7 = [(NCScheduledDeliveryAppDetailCell *)self _parentViewForCountBar];
    [v7 addSubview:self->_countBarView];
  }
}

- (void)_configureCountBarDotViewIfNecessary
{
  if (!self->_countBarDotView)
  {
    objc_super v3 = (UIView *)objc_alloc_init((Class)UIView);
    countBarDotView = self->_countBarDotView;
    self->_countBarDotView = v3;

    v5 = self->_countBarDotView;
    v6 = +[UIColor systemRedColor];
    [(UIView *)v5 setBackgroundColor:v6];

    id v7 = [(UIView *)self->_countBarDotView layer];
    [v7 setCornerRadius:4.5];

    id v8 = [(NCScheduledDeliveryAppDetailCell *)self _parentViewForCountBar];
    [v8 addSubview:self->_countBarDotView];
  }
}

- (void)_configureCountLabelIfNecessary
{
  if (!self->_countLabel)
  {
    objc_super v3 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    countLabel = self->_countLabel;
    self->_countLabel = v3;

    v5 = self->_countLabel;
    v6 = +[UIColor secondaryLabelColor];
    [(UILabel *)v5 setTextColor:v6];

    id v7 = self->_countLabel;
    id v8 = +[NSNumber numberWithUnsignedInteger:self->_count];
    v9 = +[NSNumberFormatter localizedStringFromNumber:v8 numberStyle:0];
    [(UILabel *)v7 setText:v9];

    v10 = self->_countLabel;
    v11 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
    [(UILabel *)v10 setFont:v11];

    id v12 = [(NCScheduledDeliveryAppDetailCell *)self _parentViewForCountBar];
    [v12 addSubview:self->_countLabel];
  }
}

- (void)_layoutCountLabel
{
  countLabel = self->_countLabel;
  if (countLabel)
  {
    [(UILabel *)countLabel frame];
    CGFloat rect = v4;
    CGFloat v6 = v5;
    id v7 = [(NCScheduledDeliveryAppDetailCell *)self titleLabel];
    [v7 frame];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;

    v16 = self->_countLabel;
    [(NCScheduledDeliveryAppDetailCell *)self bounds];
    -[UILabel sizeThatFits:](v16, "sizeThatFits:", v17, v18);
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    [(NCScheduledDeliveryAppDetailCell *)self _widthForCountBarView];
    unsigned int v23 = [(NCScheduledDeliveryAppDetailCell *)self _shouldReverseLayoutDirection];
    CGFloat v24 = v9;
    CGFloat v25 = v11;
    CGFloat v26 = v13;
    CGFloat v27 = v15;
    if (v23)
    {
      CGRectGetMaxX(*(CGRect *)&v24);
      v31.origin.x = rect;
      v31.origin.y = v6;
      v31.size.width = v20;
      v31.size.height = v22;
      CGRectGetWidth(v31);
    }
    else
    {
      CGRectGetMinX(*(CGRect *)&v24);
    }
    v32.origin.x = v9;
    v32.origin.y = v11;
    v32.size.width = v13;
    v32.size.height = v15;
    CGRectGetMaxY(v32);
    UIRectIntegralWithScale();
    v28 = self->_countLabel;
    -[UILabel setFrame:](v28, "setFrame:");
  }
}

- (void)_layoutCountBarView
{
  countBarView = self->_countBarView;
  if (countBarView)
  {
    [(UIView *)countBarView frame];
    double v4 = [(NCScheduledDeliveryAppDetailCell *)self titleLabel];
    [v4 frame];
    uint64_t v6 = v5;
    uint64_t v8 = v7;
    uint64_t v10 = v9;
    uint64_t v12 = v11;

    [(NCScheduledDeliveryAppDetailCell *)self _widthForCountBarView];
    unsigned int v13 = [(NCScheduledDeliveryAppDetailCell *)self _shouldReverseLayoutDirection];
    uint64_t v14 = v6;
    uint64_t v15 = v8;
    uint64_t v16 = v10;
    uint64_t v17 = v12;
    if (v13) {
      double MaxX = CGRectGetMaxX(*(CGRect *)&v14);
    }
    else {
      double MaxX = CGRectGetMinX(*(CGRect *)&v14);
    }
    [(UILabel *)self->_countLabel frame];
    UIRectCenteredYInRect();
    UIRectIntegralWithScale();
    double v19 = self->_countBarView;
    -[UIView setFrame:](v19, "setFrame:");
  }
}

- (void)_layoutCountBarDotView
{
  countBarDotView = self->_countBarDotView;
  if (countBarDotView)
  {
    [(UIView *)countBarDotView frame];
    [(UIView *)self->_countBarView frame];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    unsigned int v12 = [(NCScheduledDeliveryAppDetailCell *)self _shouldReverseLayoutDirection];
    CGFloat v13 = v5;
    CGFloat v14 = v7;
    CGFloat v15 = v9;
    CGFloat v16 = v11;
    if (v12) {
      CGRectGetMinX(*(CGRect *)&v13);
    }
    else {
      CGRectGetMaxX(*(CGRect *)&v13);
    }
    v19.origin.x = v5;
    v19.origin.y = v7;
    v19.size.width = v9;
    v19.size.height = v11;
    CGRectGetMinY(v19);
    UIRectIntegralWithScale();
    uint64_t v17 = self->_countBarDotView;
    -[UIView setFrame:](v17, "setFrame:");
  }
}

- (double)_widthForCountBarView
{
  if (!self->_maxCount) {
    return 0.0;
  }
  [(NCScheduledDeliveryAppDetailCell *)self _availableWidthForCountBar];
  return v3 * (double)self->_count / (double)self->_maxCount;
}

- (double)_availableWidthForCountBar
{
  if ([(NCScheduledDeliveryAppDetailCell *)self _shouldReverseLayoutDirection])
  {
    double v3 = [(NCScheduledDeliveryAppDetailCell *)self titleLabel];
    [v3 frame];
    double MaxX = CGRectGetMaxX(v8);
    [(NCScheduledDeliveryAppDetailCell *)self control];
  }
  else
  {
    double v3 = [(NCScheduledDeliveryAppDetailCell *)self control];
    [v3 frame];
    double MaxX = CGRectGetMinX(v9);
    [(NCScheduledDeliveryAppDetailCell *)self titleLabel];
  CGFloat v5 = };
  [v5 frame];
  double v6 = MaxX - CGRectGetMinX(v10);

  return v6 + -65.0;
}

- (id)_parentViewForCountBar
{
  v2 = [(NCScheduledDeliveryAppDetailCell *)self titleLabel];
  double v3 = [v2 superview];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countLabel, 0);
  objc_storeStrong((id *)&self->_countBarDotView, 0);

  objc_storeStrong((id *)&self->_countBarView, 0);
}

@end