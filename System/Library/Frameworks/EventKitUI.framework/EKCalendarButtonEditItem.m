@interface EKCalendarButtonEditItem
- (UIView)buttonView;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (void)calendarEditor:(id)a3 didSelectSubitem:(unint64_t)a4;
- (void)setAccessibilityIdentifier:(id)a3;
- (void)setButtonTarget:(id)a3 action:(SEL)a4;
- (void)setButtonTitle:(id)a3;
@end

@implementation EKCalendarButtonEditItem

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  if (!self->_cell)
  {
    v4 = [[EKUICenteredTextTableViewCell alloc] initWithStyle:0 reuseIdentifier:0];
    cell = self->_cell;
    self->_cell = &v4->super.super;

    v6 = [MEMORY[0x1E4FB1618] _systemDestructiveTintColor];
    v7 = [(UITableViewCell *)self->_cell textLabel];
    [v7 setTextColor:v6];

    buttonTitle = self->_buttonTitle;
    v9 = [(UITableViewCell *)self->_cell textLabel];
    [v9 setText:buttonTitle];

    accessibilityIdentifier = self->_accessibilityIdentifier;
    v11 = [(UITableViewCell *)self->_cell textLabel];
    [v11 setAccessibilityIdentifier:accessibilityIdentifier];
  }
  v12 = objc_msgSend(MEMORY[0x1E4FB1618], "tableCellGroupedBackgroundColor", a3);
  [(UITableViewCell *)self->_cell setBackgroundColor:v12];

  v13 = self->_cell;

  return v13;
}

- (void)setButtonTitle:(id)a3
{
}

- (void)setAccessibilityIdentifier:(id)a3
{
}

- (void)setButtonTarget:(id)a3 action:(SEL)a4
{
  objc_storeWeak(&self->_buttonTarget, a3);
  if (a4) {
    v6 = a4;
  }
  else {
    v6 = 0;
  }
  self->_buttonAction = v6;
}

- (UIView)buttonView
{
  return (UIView *)self->_cell;
}

- (void)calendarEditor:(id)a3 didSelectSubitem:(unint64_t)a4
{
  p_buttonTarget = &self->_buttonTarget;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(p_buttonTarget);
  if (self->_buttonAction) {
    SEL buttonAction = self->_buttonAction;
  }
  else {
    SEL buttonAction = 0;
  }
  id v9 = WeakRetained;
  [WeakRetained performSelector:buttonAction withObject:self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_destroyWeak(&self->_buttonTarget);

  objc_storeStrong((id *)&self->_cell, 0);
}

@end