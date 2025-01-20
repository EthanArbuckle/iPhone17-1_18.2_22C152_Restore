@interface EKEventProposedTimeDetailItem
- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4;
- (BOOL)detailItemVisibilityChanged;
- (BOOL)hasDetailViewControllerAtIndex:(unint64_t)a3;
- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4;
- (id)attendeeForIndex:(unint64_t)a3;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4;
- (unint64_t)numberOfSubitems;
- (void)_updateCellsIfNeededForWidth:(double)a3;
- (void)reset;
- (void)setCellPosition:(int)a3;
@end

@implementation EKEventProposedTimeDetailItem

- (void)reset
{
  v3 = [(NSMutableDictionary *)self->_cellForAttendee allKeys];
  uint64_t v4 = [v3 count];

  if (v4) {
    self->_visibilityChanged = 1;
  }
  cellForAttendee = self->_cellForAttendee;

  [(NSMutableDictionary *)cellForAttendee removeAllObjects];
}

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  self->_visibilityChanged = 0;
  id obj = (id)objc_opt_new();
  uint64_t v5 = [(EKEvent *)self->super._event organizer];
  if (!v5
    || (v6 = (void *)v5,
        [(EKEvent *)self->super._event organizer],
        v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isCurrentUser],
        v7,
        v6,
        !v8))
  {
    BOOL v19 = 0;
    goto LABEL_17;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v9 = [(EKEvent *)self->super._event attendees];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v10) {
    goto LABEL_15;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v23;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v23 != v12) {
        objc_enumerationMutation(v9);
      }
      v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      v15 = [v14 proposedStartDateForEvent:self->super._event];
      if (v15)
      {
        v16 = [(EKEvent *)self->super._event startDate];
        if (([v15 isEqualToDate:v16] & 1) == 0)
        {
          int v17 = [v14 proposedStartDateStatus];

          if (v17 == 3) {
            goto LABEL_13;
          }
          v16 = (void *)[objc_alloc(MEMORY[0x1E4F254C8]) initWithParticipant:v14 forEvent:self->super._event];
          [obj addObject:v16];
        }
      }
LABEL_13:
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  }
  while (v11);
LABEL_15:

  p_attendeesWithProposedTimes = &self->_attendeesWithProposedTimes;
  objc_storeStrong((id *)p_attendeesWithProposedTimes, obj);
  BOOL v19 = [(NSArray *)*p_attendeesWithProposedTimes count] != 0;
LABEL_17:

  return v19;
}

- (void)setCellPosition:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)EKEventProposedTimeDetailItem;
  [(EKEventDetailItem *)&v3 setCellPosition:*(void *)&a3];
}

- (void)_updateCellsIfNeededForWidth:(double)a3
{
}

uint64_t __62__EKEventProposedTimeDetailItem__updateCellsIfNeededForWidth___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 update];
}

- (unint64_t)numberOfSubitems
{
  return [(NSArray *)self->_attendeesWithProposedTimes count];
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4
{
  uint64_t v5 = [(EKEventProposedTimeDetailItem *)self cellForSubitemAtIndex:a3];
  LODWORD(v6) = 1148846080;
  LODWORD(v7) = 1112014848;
  objc_msgSend(v5, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a4, 0.0, v6, v7);
  double v9 = v8;

  return v9;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  if (!self->_cellForAttendee)
  {
    uint64_t v5 = (NSMutableDictionary *)objc_opt_new();
    cellForAttendee = self->_cellForAttendee;
    self->_cellForAttendee = v5;
  }
  double v7 = [(EKEventProposedTimeDetailItem *)self attendeeForIndex:a3];
  double v8 = v7;
  if (v7)
  {
    double v9 = self->_cellForAttendee;
    uint64_t v10 = [v7 URL];
    uint64_t v11 = [(NSMutableDictionary *)v9 objectForKeyedSubscript:v10];

    if (!v11)
    {
      uint64_t v11 = [[EKEventDetailProposedTimeCell alloc] initWithEvent:self->super._event andAttendee:v8];
      [(EKEventDetailProposedTimeCell *)v11 update];
      uint64_t v12 = self->_cellForAttendee;
      v13 = [v8 URL];
      [(NSMutableDictionary *)v12 setObject:v11 forKeyedSubscript:v13];

      self->_visibilityChanged = 1;
    }
    if (a3) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = 3;
    }
    [(EKEventDetailProposedTimeCell *)v11 setShowsTopSeparator:a3 != 0];
    if ([(NSArray *)self->_attendeesWithProposedTimes count] - 1 == a3) {
      uint64_t v15 = v14 | 0xC;
    }
    else {
      uint64_t v15 = v14;
    }
    [(EKEventDetailProposedTimeCell *)v11 setRoundedCorners:v15];
  }
  else
  {
    v16 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1B3F4C000, v16, OS_LOG_TYPE_ERROR, "No attendee found for proposed time detail item.  We shouldn't be drawn, but tableview thinks we want to display, returning empty cell", v18, 2u);
    }
    uint64_t v11 = (EKEventDetailProposedTimeCell *)objc_opt_new();
  }

  return v11;
}

- (BOOL)hasDetailViewControllerAtIndex:(unint64_t)a3
{
  return 1;
}

- (id)attendeeForIndex:(unint64_t)a3
{
  if ([(EKEventProposedTimeDetailItem *)self numberOfSubitems] <= a3)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [(NSArray *)self->_attendeesWithProposedTimes objectAtIndexedSubscript:a3];
  }

  return v5;
}

- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4
{
  double v6 = -[EKEventProposedTimeDetailItem attendeeForIndex:](self, "attendeeForIndex:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v7 = [[EKUIProposedTimeEventViewController alloc] initWithProposedTimeAttendee:v6];
  [(EKUIProposedTimeEventViewController *)v7 setEvent:self->super._event];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__EKEventProposedTimeDetailItem_detailViewControllerWithFrame_forSubitemAtIndex___block_invoke;
  v9[3] = &unk_1E6087E70;
  v9[4] = self;
  v9[5] = a4;
  [(EKUIProposedTimeEventViewController *)v7 setCompletionBlock:v9];

  return v7;
}

uint64_t __81__EKEventProposedTimeDetailItem_detailViewControllerWithFrame_forSubitemAtIndex___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifySubitemDidSave:*(void *)(a1 + 40)];
}

- (BOOL)detailItemVisibilityChanged
{
  return self->_visibilityChanged;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attendeesWithProposedTimes, 0);

  objc_storeStrong((id *)&self->_cellForAttendee, 0);
}

@end