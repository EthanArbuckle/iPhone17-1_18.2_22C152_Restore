@interface EKEventPreviewDetailItem
- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4;
- (BOOL)hideBottomSeparator;
- (BOOL)inlineDayViewRespectsSelectedCalendarsFilter;
- (EKEventPreviewDetailItem)initWithModel:(id)a3;
- (NSDate)proposedTime;
- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5;
- (id)_dayPreviewViewController;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4;
- (void)_datesForPreviewViewControllerWithStartDate:(id *)a3 endDate:(id *)a4;
- (void)_reloadContainedViewControllerIfNeeded;
- (void)eventViewController:(id)a3 didSelectReadOnlySubitem:(unint64_t)a4;
- (void)setHideBottomSeparator:(BOOL)a3;
- (void)setInlineDayViewRespectsSelectedCalendarsFilter:(BOOL)a3;
- (void)setProposedTime:(id)a3;
@end

@implementation EKEventPreviewDetailItem

- (EKEventPreviewDetailItem)initWithModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKEventPreviewDetailItem;
  v6 = [(EKEventPreviewDetailItem *)&v9 init];
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
    [(EKEventPreviewDetailItem *)self _datesForPreviewViewControllerWithStartDate:&v6 endDate:&v5];
    id v3 = v6;
    id v4 = v5;
    [(EKDayPreviewController *)self->_containedDayViewController reloadWithNewDate:v3 event:self->super._event overriddenEventStartDate:v3 overriddenEventEndDate:v4];
  }
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5
{
  containedDayViewController = self->_containedDayViewController;
  if (containedDayViewController)
  {
    [(EKDayPreviewController *)containedDayViewController preferredContentSize];
    double v7 = v6;
  }
  else
  {
    double v7 = 1.0 / EKUIGoldenRatioPhi() * a4;
  }

  return CalCeilToScreenScale(v7);
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  cell = self->_cell;
  if (!cell)
  {
    id v5 = [[EKUITableViewCell alloc] initWithStyle:1 reuseIdentifier:0];
    double v6 = self->_cell;
    self->_cell = &v5->super;

    double v7 = [(EKEventPreviewDetailItem *)self _dayPreviewViewController];
    [v7 setHidesAllDayEvents:1];
    if ([(EKEventPreviewDetailItem *)self hideBottomSeparator]) {
      -[UITableViewCell setSeparatorInset:](self->_cell, "setSeparatorInset:", 0.0, 0.0, 0.0, 1.79769313e308);
    }
    v8 = [(EKEventDetailItem *)self delegate];
    objc_super v9 = [v8 viewControllerForEventItem:self];

    [v7 setHostingViewController:v9];
    [v9 addChildViewController:v7];
    [v7 didMoveToParentViewController:v9];
    objc_msgSend(v7, "setRespectsSelectedCalendarsFilter:", -[EKEventPreviewDetailItem inlineDayViewRespectsSelectedCalendarsFilter](self, "inlineDayViewRespectsSelectedCalendarsFilter"));
    v10 = [(UITableViewCell *)self->_cell contentView];
    v11 = [v7 view];
    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v10 addSubview:v11];
    v12 = [MEMORY[0x1E4F28DC8] constraintWithItem:v11 attribute:3 relatedBy:0 toItem:v10 attribute:3 multiplier:1.0 constant:0.0];
    [v10 addConstraint:v12];

    v13 = [MEMORY[0x1E4F28DC8] constraintWithItem:v11 attribute:4 relatedBy:0 toItem:v10 attribute:4 multiplier:1.0 constant:0.0];
    [v10 addConstraint:v13];

    [(UITableViewCell *)self->_cell setSelectionStyle:0];
    v14 = [MEMORY[0x1E4F28DC8] constraintWithItem:v11 attribute:5 relatedBy:0 toItem:self->_cell attribute:17 multiplier:1.0 constant:0.0];
    v15 = [MEMORY[0x1E4F28DC8] constraintWithItem:v11 attribute:6 relatedBy:0 toItem:self->_cell attribute:18 multiplier:1.0 constant:0.0];
    v16 = (void *)MEMORY[0x1E4F28DC8];
    v19[0] = v14;
    v19[1] = v15;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    [v16 activateConstraints:v17];

    cell = self->_cell;
  }

  return cell;
}

- (void)_datesForPreviewViewControllerWithStartDate:(id *)a3 endDate:(id *)a4
{
  double v7 = [(EKEvent *)self->super._event startDate];
  v8 = [(EKEventPreviewDetailItem *)self proposedTime];

  if (v8)
  {
    uint64_t v9 = [(EKEventPreviewDetailItem *)self proposedTime];

    v10 = [(EKEvent *)self->super._event endDateUnadjustedForLegacyClients];
    v11 = [(EKEvent *)self->super._event startDate];
    [v10 timeIntervalSinceDate:v11];
    double v13 = v12;

    v14 = (void *)MEMORY[0x1E4F1C9C8];
    v15 = [(EKEventPreviewDetailItem *)self proposedTime];
    v16 = [v14 dateWithTimeInterval:v15 sinceDate:v13];

    double v7 = (void *)v9;
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
    if ([(EKEvent *)self->super._event isIntegrationEvent]) {
      uint64_t v4 = 5;
    }
    else {
      uint64_t v4 = 0;
    }
    if ([(EKEvent *)self->super._event isIntegrationEvent]) {
      double v5 = 1.0;
    }
    else {
      double v5 = 0.8;
    }
    id v11 = 0;
    id v12 = 0;
    [(EKEventPreviewDetailItem *)self _datesForPreviewViewControllerWithStartDate:&v12 endDate:&v11];
    id v6 = v12;
    id v7 = v11;
    v8 = [[EKDayPreviewController alloc] initWithDate:v6 event:self->super._event overriddenEventStartDate:v6 overriddenEventEndDate:v7 model:self->_model overriddenDayViewHourScale:v4 overriddenDayViewMinHourRange:v5];
    uint64_t v9 = self->_containedDayViewController;
    self->_containedDayViewController = v8;

    containedDayViewController = self->_containedDayViewController;
  }

  return containedDayViewController;
}

- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4
{
  return 0;
}

- (void)eventViewController:(id)a3 didSelectReadOnlySubitem:(unint64_t)a4
{
  id v5 = a3;
  if (self->_cell && ([(EKEvent *)self->super._event isIntegrationEvent] & 1) == 0)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __73__EKEventPreviewDetailItem_eventViewController_didSelectReadOnlySubitem___block_invoke;
    v6[3] = &unk_1E6087570;
    v6[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:7 delay:v6 usingSpringWithDamping:&__block_literal_global_12 initialSpringVelocity:0.5 options:0.0 animations:1.0 completion:0.0];
  }
}

uint64_t __73__EKEventPreviewDetailItem_eventViewController_didSelectReadOnlySubitem___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 88) toggleExpandedState];
  v2 = [*(id *)(a1 + 32) delegate];
  [v2 eventDetailItemWantsRefeshForHeightChange];

  [*(id *)(*(void *)(a1 + 32) + 80) layoutSubviews];
  id v3 = *(void **)(*(void *)(a1 + 32) + 80);

  return [v3 layoutBelowIfNeeded];
}

- (BOOL)inlineDayViewRespectsSelectedCalendarsFilter
{
  return self->_inlineDayViewRespectsSelectedCalendarsFilter;
}

- (void)setInlineDayViewRespectsSelectedCalendarsFilter:(BOOL)a3
{
  self->_inlineDayViewRespectsSelectedCalendarsFilter = a3;
}

- (NSDate)proposedTime
{
  return self->_proposedTime;
}

- (void)setProposedTime:(id)a3
{
}

- (BOOL)hideBottomSeparator
{
  return self->_hideBottomSeparator;
}

- (void)setHideBottomSeparator:(BOOL)a3
{
  self->_hideBottomSeparator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proposedTime, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_containedDayViewController, 0);

  objc_storeStrong((id *)&self->_cell, 0);
}

@end