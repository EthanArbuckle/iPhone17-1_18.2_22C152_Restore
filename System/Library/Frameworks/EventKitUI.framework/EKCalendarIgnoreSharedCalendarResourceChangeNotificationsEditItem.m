@interface EKCalendarIgnoreSharedCalendarResourceChangeNotificationsEditItem
- (BOOL)configureWithCalendar:(id)a3;
- (BOOL)underlyingCalendarState;
- (id)cellText;
- (id)descriptionLabelText;
- (id)headerTitle;
- (void)setUnderlyingCalendarState:(BOOL)a3;
@end

@implementation EKCalendarIgnoreSharedCalendarResourceChangeNotificationsEditItem

- (BOOL)configureWithCalendar:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)EKCalendarIgnoreSharedCalendarResourceChangeNotificationsEditItem;
  id v3 = a3;
  [(EKCalendarEditItem *)&v6 configureWithCalendar:v3];
  char v4 = objc_msgSend(v3, "allowsIgnoringSharedEventChangeNotifications", v6.receiver, v6.super_class);

  return v4;
}

- (void)setUnderlyingCalendarState:(BOOL)a3
{
}

- (BOOL)underlyingCalendarState
{
  return [(EKCalendar *)self->super.super._calendar isIgnoringSharedCalendarNotifications] ^ 1;
}

- (id)cellText
{
  v2 = EventKitUIBundle();
  id v3 = [v2 localizedStringForKey:@"Show Changes" value:&stru_1F0CC2140 table:0];

  return v3;
}

- (id)descriptionLabelText
{
  v2 = EventKitUIBundle();
  id v3 = [v2 localizedStringForKey:@"Display messages when shared events on this calendar are added, modified, or deleted by other people.", &stru_1F0CC2140, 0 value table];

  return v3;
}

- (id)headerTitle
{
  v2 = EventKitUIBundle();
  id v3 = [v2 localizedStringForKey:@"Shared Events" value:&stru_1F0CC2140 table:0];

  return v3;
}

@end