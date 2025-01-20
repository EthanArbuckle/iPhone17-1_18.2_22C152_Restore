@interface EKEventDeleteButtonEditItem
- (BOOL)shouldAppear;
- (UIView)sourceViewForPopover;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (void)editor:(id)a3 didSelectSubitem:(unint64_t)a4;
- (void)setDeleteButtonTarget:(id)a3 action:(SEL)a4;
@end

@implementation EKEventDeleteButtonEditItem

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  cell = self->_cell;
  if (!cell)
  {
    v5 = [[EKUICenteredTextTableViewCell alloc] initWithStyle:0 reuseIdentifier:0];
    v6 = self->_cell;
    self->_cell = &v5->super.super;

    v7 = [MEMORY[0x1E4FB1618] tableCellGroupedBackgroundColor];
    [(UITableViewCell *)self->_cell setBackgroundColor:v7];

    v8 = [MEMORY[0x1E4FB1618] _systemDestructiveTintColor];
    v9 = [(UITableViewCell *)self->_cell textLabel];
    [v9 setTextColor:v8];

    v10 = EventKitUIBundle();
    v11 = [v10 localizedStringForKey:@"Delete Event" value:&stru_1F0CC2140 table:0];
    v12 = [(UITableViewCell *)self->_cell textLabel];
    [v12 setText:v11];

    cell = self->_cell;
  }

  return cell;
}

- (void)setDeleteButtonTarget:(id)a3 action:(SEL)a4
{
  objc_storeWeak(&self->_deleteButtonTarget, a3);
  if (a4) {
    v6 = a4;
  }
  else {
    v6 = 0;
  }
  self->_deleteButtonAction = v6;
}

- (BOOL)shouldAppear
{
  v2 = [(EKCalendarItemEditItem *)self calendarItem];
  char v3 = [v2 isNew] ^ 1;

  return v3;
}

- (void)editor:(id)a3 didSelectSubitem:(unint64_t)a4
{
  p_deleteButtonTarget = &self->_deleteButtonTarget;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(p_deleteButtonTarget);
  if (self->_deleteButtonAction) {
    SEL deleteButtonAction = self->_deleteButtonAction;
  }
  else {
    SEL deleteButtonAction = 0;
  }
  id v9 = WeakRetained;
  [WeakRetained performSelector:deleteButtonAction withObject:self];
}

- (UIView)sourceViewForPopover
{
  return (UIView *)self->_cell;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_deleteButtonTarget);

  objc_storeStrong((id *)&self->_cell, 0);
}

@end