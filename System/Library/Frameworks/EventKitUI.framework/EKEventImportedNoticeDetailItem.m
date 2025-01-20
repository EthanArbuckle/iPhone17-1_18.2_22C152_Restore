@interface EKEventImportedNoticeDetailItem
- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4;
- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (void)reset;
@end

@implementation EKEventImportedNoticeDetailItem

- (void)reset
{
  cell = self->_cell;
  self->_cell = 0;
}

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  v5 = [(EKEvent *)self->super._event organizer];
  if (v5)
  {
    v6 = [(EKEvent *)self->super._event selfAttendee];
    if (v6) {
      LOBYTE(v7) = 0;
    }
    else {
      int v7 = [(EKEvent *)self->super._event isEditable] ^ 1;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5
{
  cell = self->_cell;
  if (cell)
  {
    BOOL v7 = a5;
    [(EKEventDetailImportedNoticeCell *)cell sizeToFit];
    if (v7) {
      [(EKEventDetailImportedNoticeCell *)self->_cell update];
    }
    v8 = self->_cell;
    [(EKEventDetailImportedNoticeCell *)v8 frame];
    [(EKEventDetailCell *)v8 layoutForWidth:[(EKEventDetailItem *)self cellPosition] position:v9];
  }
  else
  {
    id v10 = -[EKEventImportedNoticeDetailItem cellForSubitemAtIndex:](self, "cellForSubitemAtIndex:", a3, a5, a4);
    [(EKEventDetailImportedNoticeCell *)self->_cell sizeToFit];
  }
  [(EKEventDetailImportedNoticeCell *)self->_cell frame];
  return v11;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  cell = self->_cell;
  if (!cell)
  {
    v5 = [[EKEventDetailImportedNoticeCell alloc] initWithEvent:self->super._event editable:1];
    v6 = self->_cell;
    self->_cell = v5;

    cell = self->_cell;
  }

  return cell;
}

- (void).cxx_destruct
{
}

@end