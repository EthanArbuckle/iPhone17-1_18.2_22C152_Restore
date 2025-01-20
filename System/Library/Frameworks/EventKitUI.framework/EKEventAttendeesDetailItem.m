@interface EKEventAttendeesDetailItem
- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4;
- (BOOL)hasDetailViewControllerAtIndex:(unint64_t)a3;
- (EKEventAttendeesDetailItem)initWithModel:(id)a3;
- (NSArray)attendees;
- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4;
- (int64_t)status;
- (unint64_t)numberOfSubitems;
- (void)eventDetailAttendeeCellDidCompleteLoad:(id)a3;
- (void)eventDetailAttendeeCellWantsRefreshForHeightChange;
- (void)eventViewController:(id)a3 didSelectSubitem:(unint64_t)a4;
- (void)reset;
- (void)setAttendees:(id)a3;
- (void)setStatus:(int64_t)a3;
@end

@implementation EKEventAttendeesDetailItem

- (EKEventAttendeesDetailItem)initWithModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKEventAttendeesDetailItem;
  v6 = [(EKEventAttendeesDetailItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_model, a3);
  }

  return v7;
}

- (void)reset
{
  if ([(EKEventDetailAttendeesCell *)self->_cell loadingAttendees])
  {
    oldCell = self->_oldCell;
    self->_oldCell = 0;
  }
  else
  {
    v4 = self->_cell;
    oldCell = self->_oldCell;
    self->_oldCell = v4;
  }

  cell = self->_cell;
  self->_cell = 0;
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5
{
  id v5 = -[EKEventAttendeesDetailItem cellForSubitemAtIndex:](self, "cellForSubitemAtIndex:", a3, a5, a4);
  [v5 displayHeight];
  double v7 = v6;

  return v7;
}

- (unint64_t)numberOfSubitems
{
  return 1;
}

- (void)eventViewController:(id)a3 didSelectSubitem:(unint64_t)a4
{
  v4.receiver = self;
  v4.super_class = (Class)EKEventAttendeesDetailItem;
  [(EKEventDetailItem *)&v4 eventViewController:a3 didSelectSubitem:a4];
}

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  return [(EKEvent *)self->super._event hasHumanInviteesToDisplay];
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  cell = self->_cell;
  if (!cell)
  {
    attendeesModel = self->_attendeesModel;
    if (!attendeesModel)
    {
      double v6 = objc_alloc_init(EKEventDetailAttendeesCellModel);
      double v7 = self->_attendeesModel;
      self->_attendeesModel = v6;

      attendeesModel = self->_attendeesModel;
    }
    [(EKEventDetailAttendeesCellModel *)attendeesModel setEvent:self->super._event];
    v8 = [[EKEventDetailAttendeesCell alloc] initWithEvent:self->super._event model:self->_attendeesModel];
    objc_super v9 = self->_cell;
    self->_cell = v8;

    [(EKEventDetailAttendeesCell *)self->_cell setAttendeeCellDelegate:self];
    [(EKEventDetailAttendeesCell *)self->_cell update];
    [(EKEventDetailAttendeesCell *)self->_cell layoutForWidth:[(EKEventDetailItem *)self cellPosition] position:300.0];
    cell = self->_cell;
  }
  BOOL v10 = [(EKEventDetailAttendeesCell *)cell loadingAttendees];
  oldCell = self->_oldCell;
  if (v10)
  {
    if (oldCell) {
      goto LABEL_11;
    }
  }
  else if (oldCell)
  {
    self->_oldCell = 0;
  }
  oldCell = self->_cell;
LABEL_11:
  v12 = oldCell;

  return v12;
}

- (BOOL)hasDetailViewControllerAtIndex:(unint64_t)a3
{
  return [(EKEvent *)self->super._event hasHumanInviteesToDisplay];
}

- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4
{
  id v5 = [[EKUIEventInviteesViewController alloc] initWithEvent:self->super._event fromDetail:1 model:self->_model];
  double v6 = [(EKEventDetailItem *)self viewControllerToPresentFrom];
  double v7 = [v6 navigationDelegate];
  [(EKUIEventInviteesViewController *)v5 setNavigationDelegate:v7];

  return v5;
}

- (void)eventDetailAttendeeCellWantsRefreshForHeightChange
{
  id v2 = [(EKEventDetailItem *)self delegate];
  [v2 eventDetailItemWantsRefeshForHeightChange];
}

- (void)eventDetailAttendeeCellDidCompleteLoad:(id)a3
{
  objc_super v4 = (EKEventDetailAttendeesCell *)a3;
  if (self->_oldCell && self->_cell == v4)
  {
    double v6 = v4;
    id v5 = [(EKEventDetailItem *)self delegate];
    [v5 eventDetailItemWantsRefresh:self];

    objc_super v4 = v6;
  }
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (NSArray)attendees
{
  return self->_attendees;
}

- (void)setAttendees:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attendees, 0);
  objc_storeStrong((id *)&self->_oldCell, 0);
  objc_storeStrong((id *)&self->_attendeesModel, 0);
  objc_storeStrong((id *)&self->_model, 0);

  objc_storeStrong((id *)&self->_cell, 0);
}

@end