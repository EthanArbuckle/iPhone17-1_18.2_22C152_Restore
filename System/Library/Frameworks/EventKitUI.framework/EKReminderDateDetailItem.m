@interface EKReminderDateDetailItem
- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4;
- (BOOL)hidesBottomSeparator;
- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (void)reset;
- (void)setHidesBottomSeparator:(BOOL)a3;
@end

@implementation EKReminderDateDetailItem

- (void)reset
{
  v4.receiver = self;
  v4.super_class = (Class)EKReminderDateDetailItem;
  [(EKEventDetailItem *)&v4 reset];
  cell = self->_cell;
  self->_cell = 0;
}

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  return [(EKEvent *)self->super._event completed];
}

- (void)setHidesBottomSeparator:(BOOL)a3
{
  self->_hidesBottomSeparator = a3;
  cell = self->_cell;
  if (cell) {
    -[EKReminderDateDetailCell setHideBottomCellSeparator:](cell, "setHideBottomCellSeparator:");
  }
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  cell = self->_cell;
  if (!cell)
  {
    v5 = [[EKReminderDateDetailCell alloc] initWithEvent:self->super._event reminder:self->super._reminder editable:0];
    v6 = self->_cell;
    self->_cell = v5;

    [(EKReminderDateDetailCell *)self->_cell setHideBottomCellSeparator:self->_hidesBottomSeparator];
    cell = self->_cell;
  }

  return cell;
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5
{
  return *MEMORY[0x1E4FB2F28];
}

- (BOOL)hidesBottomSeparator
{
  return self->_hidesBottomSeparator;
}

- (void).cxx_destruct
{
}

@end