@interface EKReminderTitleDetailItem
- (BOOL)shouldShowEditButtonInline;
- (BOOL)showExtraSpaceAtBottom;
- (EKReminderTitleDetailItemDelegate)editDelegate;
- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (void)editButtonPressed;
- (void)reminderToggled;
- (void)reset;
- (void)setEditDelegate:(id)a3;
- (void)setShowExtraSpaceAtBottom:(BOOL)a3;
@end

@implementation EKReminderTitleDetailItem

- (void)reset
{
  v4.receiver = self;
  v4.super_class = (Class)EKReminderTitleDetailItem;
  [(EKEventDetailItem *)&v4 reset];
  cell = self->_cell;
  self->_cell = 0;
}

- (void)setShowExtraSpaceAtBottom:(BOOL)a3
{
  self->_showExtraSpaceAtBottom = a3;
  cell = self->_cell;
  if (cell) {
    -[EKReminderTitleDetailCell setShowExtraSpaceAtBottom:](cell, "setShowExtraSpaceAtBottom:");
  }
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  cell = self->_cell;
  if (!cell)
  {
    v5 = [[EKReminderTitleDetailCell alloc] initWithEvent:self->super._event reminder:self->super._reminder editable:0 delegate:self];
    v6 = self->_cell;
    self->_cell = v5;

    [(EKReminderTitleDetailCell *)self->_cell setShowExtraSpaceAtBottom:self->_showExtraSpaceAtBottom];
    cell = self->_cell;
  }

  return cell;
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5
{
  v6 = -[EKReminderTitleDetailItem cellForSubitemAtIndex:](self, "cellForSubitemAtIndex:", a3, a5);
  LODWORD(v7) = 1148846080;
  LODWORD(v8) = 1112014848;
  objc_msgSend(v6, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a4, 1000.0, v7, v8);
  double v10 = v9;

  return v10;
}

- (void)editButtonPressed
{
  id v2 = [(EKReminderTitleDetailItem *)self editDelegate];
  [v2 editButtonPressed];
}

- (BOOL)shouldShowEditButtonInline
{
  v3 = [(EKReminderTitleDetailItem *)self editDelegate];

  if (!v3) {
    return 0;
  }
  objc_super v4 = [(EKReminderTitleDetailItem *)self editDelegate];
  char v5 = [v4 shouldShowEditButtonInline];

  return v5;
}

- (void)reminderToggled
{
  v3 = self->super._event;
  [(EKEvent *)v3 setCompleted:[(EKEvent *)v3 completed] ^ 1];

  [(EKEventDetailItem *)self notifySubitemDidSave:0];

  [(EKEventDetailItem *)self editItemViewController:0 didCompleteWithAction:3];
}

- (EKReminderTitleDetailItemDelegate)editDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editDelegate);

  return (EKReminderTitleDetailItemDelegate *)WeakRetained;
}

- (void)setEditDelegate:(id)a3
{
}

- (BOOL)showExtraSpaceAtBottom
{
  return self->_showExtraSpaceAtBottom;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_editDelegate);

  objc_storeStrong((id *)&self->_cell, 0);
}

@end