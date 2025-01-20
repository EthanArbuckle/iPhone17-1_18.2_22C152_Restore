@interface HUAvailableTriggerItemSwitchCell
- (BOOL)switchIsHidden;
- (double)reservedSwitchWidth;
- (void)setReservedSwitchWidth:(double)a3;
- (void)setSwitchHidden:(BOOL)a3;
- (void)updateConstraints;
@end

@implementation HUAvailableTriggerItemSwitchCell

- (void)setSwitchHidden:(BOOL)a3
{
  if (self->_switchHidden != a3)
  {
    self->_switchHidden = a3;
    [(HUAvailableTriggerItemSwitchCell *)self frame];
    double Width = CGRectGetWidth(v15);
    v6 = [(HUIconCell *)self containerView];
    [v6 frame];
    double MaxX = CGRectGetMaxX(v16);

    if (a3)
    {
      double v8 = vabdd_f64(Width, MaxX);
      [(HUAvailableTriggerItemSwitchCell *)self setAccessoryView:0];
      [(HUAvailableTriggerItemSwitchCell *)self setAccessoryType:1];
      [(HUAvailableTriggerItemSwitchCell *)self setNeedsLayout];
      [(HUAvailableTriggerItemSwitchCell *)self layoutIfNeeded];
      [(HUAvailableTriggerItemSwitchCell *)self frame];
      double v9 = CGRectGetWidth(v17);
      v10 = [(HUIconCell *)self containerView];
      [v10 frame];
      double v11 = vabdd_f64(v9, CGRectGetMaxX(v18));

      double v12 = vabdd_f64(v8, v11);
    }
    else
    {
      v13 = [(HUIconSwitchCell *)self switchView];
      [(HUAvailableTriggerItemSwitchCell *)self setAccessoryView:v13];

      [(HUAvailableTriggerItemSwitchCell *)self setAccessoryType:0];
      double v12 = 0.0;
    }
    [(HUAvailableTriggerItemSwitchCell *)self setReservedSwitchWidth:v12];
    [(HUAvailableTriggerItemSwitchCell *)self setNeedsUpdateConstraints];
  }
}

- (void)updateConstraints
{
  v9.receiver = self;
  v9.super_class = (Class)HUAvailableTriggerItemSwitchCell;
  [(HUTitleDescriptionCell *)&v9 updateConstraints];
  [(HUAvailableTriggerItemSwitchCell *)self reservedSwitchWidth];
  double v4 = -v3;
  v5 = [(HUTitleDescriptionCell *)self titleTrailingConstraint];
  [v5 setConstant:v4];

  [(HUAvailableTriggerItemSwitchCell *)self reservedSwitchWidth];
  double v7 = -v6;
  double v8 = [(HUTitleDescriptionCell *)self descriptionTrailingConstraint];
  [v8 setConstant:v7];
}

- (BOOL)switchIsHidden
{
  return self->_switchHidden;
}

- (double)reservedSwitchWidth
{
  return self->_reservedSwitchWidth;
}

- (void)setReservedSwitchWidth:(double)a3
{
  self->_reservedSwitchdouble Width = a3;
}

@end