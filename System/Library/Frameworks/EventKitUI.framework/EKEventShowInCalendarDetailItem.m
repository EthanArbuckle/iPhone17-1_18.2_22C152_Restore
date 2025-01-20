@interface EKEventShowInCalendarDetailItem
- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4;
- (EKEventShowInCalendarDetailItem)initWithModel:(id)a3;
- (NSDate)proposedTime;
- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4;
- (id)_dayPreviewViewController;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (void)_datesForPreviewViewControllerWithStartDate:(id *)a3 endDate:(id *)a4;
- (void)_reloadContainedViewControllerIfNeeded;
- (void)setProposedTime:(id)a3;
@end

@implementation EKEventShowInCalendarDetailItem

- (EKEventShowInCalendarDetailItem)initWithModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKEventShowInCalendarDetailItem;
  v6 = [(EKEventShowInCalendarDetailItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_model, a3);
  }

  return v7;
}

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  return 1;
}

- (void)_reloadContainedViewControllerIfNeeded
{
  if (self->_containedDayViewController)
  {
    id v5 = 0;
    id v6 = 0;
    [(EKEventShowInCalendarDetailItem *)self _datesForPreviewViewControllerWithStartDate:&v6 endDate:&v5];
    id v3 = v6;
    id v4 = v5;
    [(EKDayPreviewController *)self->_containedDayViewController reloadWithNewDate:v3 event:self->super._event overriddenEventStartDate:v3 overriddenEventEndDate:v4];
  }
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4
{
  v5.receiver = self;
  v5.super_class = (Class)EKEventShowInCalendarDetailItem;
  [(EKEventDetailItem *)&v5 defaultCellHeightForSubitemAtIndex:a3 forWidth:a4];
  return result;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  cell = self->_cell;
  if (!cell)
  {
    objc_super v5 = [[EKUITableViewCell alloc] initWithStyle:1 reuseIdentifier:0];
    id v6 = self->_cell;
    self->_cell = v5;

    [(EKUITableViewCell *)self->_cell setAccessoryType:1];
    v7 = EventKitUIBundle();
    v8 = [v7 localizedStringForKey:@"Show in Calendar" value:&stru_1F0CC2140 table:0];
    objc_super v9 = [(EKUITableViewCell *)self->_cell textLabel];
    [v9 setText:v8];

    cell = self->_cell;
  }

  return cell;
}

- (void)_datesForPreviewViewControllerWithStartDate:(id *)a3 endDate:(id *)a4
{
  v7 = [(EKEvent *)self->super._event startDate];
  v8 = [(EKEventShowInCalendarDetailItem *)self proposedTime];

  if (v8)
  {
    uint64_t v9 = [(EKEventShowInCalendarDetailItem *)self proposedTime];

    v10 = [(EKEvent *)self->super._event endDateUnadjustedForLegacyClients];
    v11 = [(EKEvent *)self->super._event startDate];
    [v10 timeIntervalSinceDate:v11];
    double v13 = v12;

    v14 = (void *)MEMORY[0x1E4F1C9C8];
    v15 = [(EKEventShowInCalendarDetailItem *)self proposedTime];
    v16 = [v14 dateWithTimeInterval:v15 sinceDate:v13];

    v7 = (void *)v9;
  }
  else
  {
    v16 = 0;
  }
  id v18 = v7;
  *a3 = v18;
  id v17 = v16;
  *a4 = v17;
}

- (id)_dayPreviewViewController
{
  containedDayViewController = self->_containedDayViewController;
  if (!containedDayViewController)
  {
    id v9 = 0;
    id v10 = 0;
    [(EKEventShowInCalendarDetailItem *)self _datesForPreviewViewControllerWithStartDate:&v10 endDate:&v9];
    id v4 = v10;
    id v5 = v9;
    id v6 = [[EKDayPreviewController alloc] initWithDate:v4 event:self->super._event overriddenEventStartDate:v4 overriddenEventEndDate:v5 model:self->_model];
    v7 = self->_containedDayViewController;
    self->_containedDayViewController = v6;

    [(EKDayPreviewController *)self->_containedDayViewController setStyle:2];
    containedDayViewController = self->_containedDayViewController;
  }

  return containedDayViewController;
}

- (NSDate)proposedTime
{
  return self->_proposedTime;
}

- (void)setProposedTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proposedTime, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_containedDayViewController, 0);

  objc_storeStrong((id *)&self->_cell, 0);
}

@end