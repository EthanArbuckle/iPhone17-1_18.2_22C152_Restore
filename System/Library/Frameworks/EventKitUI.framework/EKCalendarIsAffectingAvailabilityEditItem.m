@interface EKCalendarIsAffectingAvailabilityEditItem
+ (BOOL)shouldDisplayForCalendar:(id)a3;
- (BOOL)cellWrapsLongText;
- (BOOL)configureWithCalendar:(id)a3;
- (BOOL)underlyingCalendarState;
- (id)cellText;
- (id)descriptionLabelText;
- (id)headerTitle;
- (void)setUnderlyingCalendarState:(BOOL)a3;
@end

@implementation EKCalendarIsAffectingAvailabilityEditItem

+ (BOOL)shouldDisplayForCalendar:(id)a3
{
  id v3 = a3;
  v4 = [v3 source];
  if ([v4 syncs])
  {
    v5 = [v4 constraints];
    if ([v5 supportsAvailabilityRequests]
      && (![v4 isDelegate] || objc_msgSend(v3, "allowsContentModifications"))
      && ([v3 isSubscribed] & 1) == 0)
    {
      int v6 = [v3 isSuggestedEventCalendar] ^ 1;
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)configureWithCalendar:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)EKCalendarIsAffectingAvailabilityEditItem;
  id v3 = a3;
  [(EKCalendarEditItem *)&v6 configureWithCalendar:v3];
  char v4 = objc_msgSend((id)objc_opt_class(), "shouldDisplayForCalendar:", v3, v6.receiver, v6.super_class);

  return v4;
}

- (void)setUnderlyingCalendarState:(BOOL)a3
{
}

- (BOOL)underlyingCalendarState
{
  return [(EKCalendar *)self->super.super._calendar isAffectingAvailability];
}

- (id)cellText
{
  v2 = EventKitUIBundle();
  id v3 = [v2 localizedStringForKey:@"Events Affect Availability" value:&stru_1F0CC2140 table:0];

  return v3;
}

- (id)descriptionLabelText
{
  v2 = EventKitUIBundle();
  id v3 = [v2 localizedStringForKey:@"Events on this calendar will affect your availability for scheduling." value:&stru_1F0CC2140 table:0];

  return v3;
}

- (id)headerTitle
{
  v2 = EventKitUIBundle();
  id v3 = [v2 localizedStringForKey:@"Availability" value:&stru_1F0CC2140 table:0];

  return v3;
}

- (BOOL)cellWrapsLongText
{
  return 1;
}

@end