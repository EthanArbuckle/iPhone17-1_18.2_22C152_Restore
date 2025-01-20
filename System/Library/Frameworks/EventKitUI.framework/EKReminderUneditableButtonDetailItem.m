@interface EKReminderUneditableButtonDetailItem
- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4;
- (EKReminderUneditableButtonDetailItem)initWithUneditableButtonDetailItemDelegate:(id)a3;
- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (void)reset;
- (void)uneditableButtonCellRequestedShowFirstUncompletedReminder:(id)a3;
@end

@implementation EKReminderUneditableButtonDetailItem

- (EKReminderUneditableButtonDetailItem)initWithUneditableButtonDetailItemDelegate:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKReminderUneditableButtonDetailItem;
  v6 = [(EKReminderUneditableButtonDetailItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_uneditableButtonDetailItemDelegate, a3);
  }

  return v7;
}

- (void)reset
{
  v4.receiver = self;
  v4.super_class = (Class)EKReminderUneditableButtonDetailItem;
  [(EKEventDetailItem *)&v4 reset];
  cell = self->_cell;
  self->_cell = 0;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  cell = self->_cell;
  if (!cell)
  {
    id v5 = [EKReminderUneditableButtonDetailCell alloc];
    if (self->_uneditableButtonDetailItemDelegate) {
      v6 = self;
    }
    else {
      v6 = 0;
    }
    v7 = [(EKReminderUneditableButtonDetailCell *)v5 initWithEvent:self->super._event uneditableButtonCellDelegate:v6];
    v8 = self->_cell;
    self->_cell = v7;

    cell = self->_cell;
  }

  return cell;
}

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  return [(EKEvent *)self->super._event CUIK_reminderShouldBeEditable] ^ 1;
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5
{
  return *MEMORY[0x1E4FB2F28];
}

- (void)uneditableButtonCellRequestedShowFirstUncompletedReminder:(id)a3
{
  id v4 = [(EKEvent *)self->super._event CUIK_currentReminder];
  [(EKReminderUneditableButtonDetailItemDelegate *)self->_uneditableButtonDetailItemDelegate uneditableButtonDetailItem:self requestsShowEvent:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uneditableButtonDetailItemDelegate, 0);

  objc_storeStrong((id *)&self->_cell, 0);
}

@end