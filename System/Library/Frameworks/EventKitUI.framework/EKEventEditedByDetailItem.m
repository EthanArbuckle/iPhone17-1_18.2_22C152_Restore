@interface EKEventEditedByDetailItem
- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4;
- (BOOL)hasDetailViewControllerAtIndex:(unint64_t)a3;
- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4;
- (void)reset;
- (void)shortenCell:(id)a3;
@end

@implementation EKEventEditedByDetailItem

- (void)reset
{
  cell = self->_cell;
  self->_cell = 0;
}

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  v5 = [(EKEvent *)self->super._event calendar];
  if ([v5 sharingStatus] && -[EKEvent isEditable](self->super._event, "isEditable"))
  {
    v6 = [(EKEvent *)self->super._event sharedItemModifiedByDisplayName];
    if (v6
      && ([(EKEvent *)self->super._event sharedItemModifiedDate],
          (v7 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      BOOL v8 = 1;
    }
    else
    {
      uint64_t v9 = [(EKEvent *)self->super._event sharedItemCreatedByDisplayName];
      if (v9)
      {
        v10 = (void *)v9;
        v11 = [(EKEvent *)self->super._event sharedItemCreatedDate];
        BOOL v8 = v11 != 0;

        if (!v6) {
          goto LABEL_13;
        }
      }
      else
      {
        BOOL v8 = 0;
        if (!v6)
        {
LABEL_13:

          goto LABEL_14;
        }
      }
      v7 = 0;
    }

    goto LABEL_13;
  }
  BOOL v8 = 0;
LABEL_14:

  return v8;
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5
{
  cell = self->_cell;
  if (!cell)
  {
    id v7 = -[EKEventEditedByDetailItem cellForSubitemAtIndex:](self, "cellForSubitemAtIndex:", a3, a5, a4);
    cell = self->_cell;
  }
  [(UITableViewCell *)cell frame];
  return v8;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  cell = self->_cell;
  if (!cell)
  {
    v6 = [(EKEvent *)self->super._event sharedItemCreatedDate];
    id v7 = [(EKEvent *)self->super._event sharedItemModifiedDate];
    uint64_t v8 = [v6 compare:v7];

    event = self->super._event;
    if (v8)
    {
      v10 = [(EKEvent *)event sharedItemModifiedDate];
      v11 = [[EKEventDetailTwoValueCell alloc] initWithEvent:self->super._event editable:1 platformStyle:0];
      v12 = self->_cell;
      self->_cell = &v11->super.super.super;

      id v7 = EventKitUIBundle();
      [v7 localizedStringForKey:@"Edited by" value:&stru_1F0CC2140 table:0];
    }
    else
    {
      v10 = [(EKEvent *)event sharedItemCreatedDate];
      v14 = [[EKEventDetailTwoValueCell alloc] initWithEvent:self->super._event editable:1 platformStyle:0];
      v15 = self->_cell;
      self->_cell = &v14->super.super.super;

      v3 = EventKitUIBundle();
      [v3 localizedStringForKey:@"Created by" value:&stru_1F0CC2140 table:0];
    v13 = };
    v16 = [(UITableViewCell *)self->_cell titleView];
    [v16 setText:v13];

    if (v8)
    {

      [(EKEvent *)self->super._event sharedItemModifiedByDisplayName];
    }
    else
    {

      [(EKEvent *)self->super._event sharedItemCreatedByDisplayName];
    v17 = };
    v18 = [(UITableViewCell *)self->_cell valueView];
    [v18 setText:v17];

    v19 = CUIKStringForDateAndTime();
    v20 = [(UITableViewCell *)self->_cell value2View];
    [v20 setText:v19];

    [(UITableViewCell *)self->_cell update];
    [(UITableViewCell *)self->_cell layoutForWidth:[(EKEventDetailItem *)self cellPosition] position:300.0];

    cell = self->_cell;
  }

  return cell;
}

- (void)shortenCell:(id)a3
{
  event = self->super._event;
  id v4 = a3;
  id v7 = [(EKEvent *)event startDate];
  v5 = CUIKStringForTimeWithTZIfDivergent();
  v6 = [v4 value2View];

  [v6 setText:v5];
}

- (BOOL)hasDetailViewControllerAtIndex:(unint64_t)a3
{
  id v4 = [(EKEvent *)self->super._event sharedItemCreatedDate];
  v5 = [(EKEvent *)self->super._event sharedItemModifiedDate];
  uint64_t v6 = [v4 compare:v5];

  event = self->super._event;
  if (v6) {
    [(EKEvent *)event sharedItemModifiedByAddress];
  }
  else {
  uint64_t v8 = [(EKEvent *)event sharedItemCreatedByAddress];
  }
  BOOL v9 = v8 != 0;

  return v9;
}

- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4
{
  v5 = [(EKEvent *)self->super._event sharedItemCreatedDate];
  uint64_t v6 = [(EKEvent *)self->super._event sharedItemModifiedDate];
  uint64_t v7 = [v5 compare:v6];

  event = self->super._event;
  if (v7)
  {
    BOOL v9 = [(EKEvent *)event sharedItemModifiedByDisplayName];
    [(EKEvent *)self->super._event sharedItemModifiedByAddress];
  }
  else
  {
    BOOL v9 = [(EKEvent *)event sharedItemCreatedByDisplayName];
    [(EKEvent *)self->super._event sharedItemCreatedByAddress];
  v10 = };
  v11 = [MEMORY[0x1E4F25610] shareeWithName:v9 url:v10];
  v12 = [[EKIdentityViewController alloc] initWithIdentity:v11];

  return v12;
}

- (void).cxx_destruct
{
}

@end