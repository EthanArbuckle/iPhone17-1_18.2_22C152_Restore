@interface EKCalendarSubscriptionDetailsEditItem
- (BOOL)configureWithCalendar:(id)a3;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (unint64_t)numberOfSubitems;
- (void)calendarEditor:(id)a3 didSelectSubitem:(unint64_t)a4;
@end

@implementation EKCalendarSubscriptionDetailsEditItem

- (unint64_t)numberOfSubitems
{
  return 1;
}

- (BOOL)configureWithCalendar:(id)a3
{
  return [a3 isSubscribedHolidayCalendar] ^ 1;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1D08]);
  v4 = EventKitUIBundle();
  v5 = [v4 localizedStringForKey:@"Subscription Details" value:&stru_1F0CC2140 table:0];
  v6 = [v3 textLabel];
  [v6 setText:v5];

  [v3 setAccessoryType:1];
  [v3 setAccessibilityIdentifier:@"calendar-subscription-details-cell"];

  return v3;
}

- (void)calendarEditor:(id)a3 didSelectSubitem:(unint64_t)a4
{
  v8 = [[EKCalendarSubscriptionDetailsViewController alloc] initWithCalendar:self->super._calendar store:self->super._store];
  v5 = [(EKCalendarEditItem *)self delegate];
  [(EKCalendarSubscriptionDetailsViewController *)v8 setDelegate:v5];

  v6 = [(EKCalendarEditItem *)self delegate];
  v7 = [v6 owningNavigationController];
  [v7 pushViewController:v8 animated:1];
}

@end