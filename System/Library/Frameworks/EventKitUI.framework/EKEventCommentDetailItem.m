@interface EKEventCommentDetailItem
- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4;
- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (void)reset;
- (void)textFieldDidEndEditing:(id)a3;
@end

@implementation EKEventCommentDetailItem

- (void)reset
{
  cell = self->_cell;
  self->_cell = 0;
}

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  id v5 = a3;
  if ([(EKEvent *)self->super._event allowsParticipationStatusModifications])
  {
    v6 = [v5 source];
    v7 = [v6 constraints];
    if ([v7 supportsResponseComments]) {
      BOOL v8 = [(EKEvent *)self->super._event actionsState] == 0;
    }
    else {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5
{
  cell = self->_cell;
  if (cell)
  {
    BOOL v7 = a5;
    [(EKEventDetailCommentCell *)cell sizeToFit];
    if (v7) {
      [(EKEventDetailCommentCell *)self->_cell update];
    }
    BOOL v8 = self->_cell;
    [(EKEventDetailCommentCell *)v8 frame];
    [(EKEventDetailCell *)v8 layoutForWidth:[(EKEventDetailItem *)self cellPosition] position:v9];
  }
  else
  {
    id v10 = -[EKEventCommentDetailItem cellForSubitemAtIndex:](self, "cellForSubitemAtIndex:", a3, a5, a4);
    [(EKEventDetailCommentCell *)self->_cell sizeToFit];
  }
  [(EKEventDetailCommentCell *)self->_cell frame];
  return v11;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  cell = self->_cell;
  if (!cell)
  {
    id v5 = [[EKEventDetailCommentCell alloc] initWithEvent:self->super._event editable:1];
    v6 = self->_cell;
    self->_cell = v5;

    BOOL v7 = [(EKEventDetailCommentCell *)self->_cell editableTextField];
    [v7 setDelegate:self];

    [(EKEventDetailCommentCell *)self->_cell update];
    BOOL v8 = self->_cell;
    [(EKEventDetailCommentCell *)v8 frame];
    [(EKEventDetailCell *)v8 layoutForWidth:[(EKEventDetailItem *)self cellPosition] position:v9];
    cell = self->_cell;
  }

  return cell;
}

- (void)textFieldDidEndEditing:(id)a3
{
  event = self->super._event;
  id v5 = a3;
  id v13 = [(EKEvent *)event responseComment];
  v6 = [v5 text];

  BOOL v7 = [(EKEvent *)self->super._event proposedStartDate];

  if (v7)
  {
    BOOL v8 = (void *)MEMORY[0x1E4F57BA8];
    double v9 = [(EKEvent *)self->super._event proposedStartDate];
    id v10 = [(EKEvent *)self->super._event timeZone];
    uint64_t v11 = [v8 comment:v6 withInsertedAutoCommentForDate:v9 timeZone:v10];

    v6 = (void *)v11;
  }
  if (![v6 length])
  {

    v6 = 0;
  }
  if ([v13 length])
  {
    id v12 = v13;
  }
  else
  {

    id v12 = 0;
  }
  id v14 = v12;
  if ((CalEqualStrings() & 1) == 0) {
    [(EKEvent *)self->super._event setResponseComment:v6];
  }
  [(EKEventDetailItem *)self notifySubitemDidSave:0];
  [(EKEventDetailItem *)self editItemViewController:0 didCompleteWithAction:3];
}

- (void).cxx_destruct
{
}

@end