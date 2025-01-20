@interface EKCalendarIgnoreAlertsEditItem
- (BOOL)cellWrapsLongText;
- (BOOL)underlyingCalendarState;
- (id)cellAccessibilityIdentifierText;
- (id)cellText;
- (id)descriptionLabelText;
- (id)headerTitle;
- (void)setUnderlyingCalendarState:(BOOL)a3;
@end

@implementation EKCalendarIgnoreAlertsEditItem

- (void)setUnderlyingCalendarState:(BOOL)a3
{
}

- (BOOL)underlyingCalendarState
{
  return [(EKCalendar *)self->super.super._calendar isIgnoringEventAlerts] ^ 1;
}

- (id)cellText
{
  v2 = EventKitUIBundle();
  v3 = [v2 localizedStringForKey:@"Event Alerts" value:&stru_1F0CC2140 table:0];

  return v3;
}

- (id)cellAccessibilityIdentifierText
{
  return @"event-alerts";
}

- (id)descriptionLabelText
{
  v2 = EventKitUIBundle();
  v3 = [v2 localizedStringForKey:@"Allow events on this calendar to display alerts." value:&stru_1F0CC2140 table:0];

  return v3;
}

- (id)headerTitle
{
  v2 = EventKitUIBundle();
  v3 = [v2 localizedStringForKey:@"Notifications" value:&stru_1F0CC2140 table:0];

  return v3;
}

- (BOOL)cellWrapsLongText
{
  return 1;
}

@end