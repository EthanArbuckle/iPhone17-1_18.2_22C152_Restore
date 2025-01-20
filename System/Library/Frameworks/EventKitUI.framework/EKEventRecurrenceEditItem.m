@interface EKEventRecurrenceEditItem
- (id)event;
- (id)minRecurrenceEndDate;
- (id)recurrenceDate;
- (id)recurrenceTimeZone;
- (id)stringForDate:(id)a3;
- (void)setCalendarItem:(id)a3 store:(id)a4;
@end

@implementation EKEventRecurrenceEditItem

- (void)setCalendarItem:(id)a3 store:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2, self, @"EKEventRecurrenceEditItem.m", 17, @"Tried to set %@ as an event on %@", v7, self object file lineNumber description];
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)EKEventRecurrenceEditItem;
  [(EKCalendarItemEditItem *)&v10 setCalendarItem:v7 store:v8];
}

- (id)event
{
  v4.receiver = self;
  v4.super_class = (Class)EKEventRecurrenceEditItem;
  v2 = [(EKCalendarItemEditItem *)&v4 calendarItem];

  return v2;
}

- (id)stringForDate:(id)a3
{
  return (id)MEMORY[0x1F410F978](a3, 1);
}

- (id)recurrenceDate
{
  v2 = [(EKEventRecurrenceEditItem *)self event];
  v3 = [v2 startDate];

  return v3;
}

- (id)recurrenceTimeZone
{
  v2 = [(EKEventRecurrenceEditItem *)self event];
  v3 = [v2 timeZone];

  return v3;
}

- (id)minRecurrenceEndDate
{
  v3 = [(EKEventRecurrenceEditItem *)self event];
  objc_super v4 = [v3 singleRecurrenceRule];

  v5 = [v4 recurrenceEnd];
  v6 = [v5 endDate];

  id v7 = [(EKEventRecurrenceEditItem *)self event];
  id v8 = [v7 endDateUnadjustedForLegacyClients];

  if (!v6 || (v9 = [v6 CalIsBeforeDate:v8], objc_super v10 = v6, (v9 & 1) == 0)) {
    objc_super v10 = v8;
  }
  id v11 = v10;

  return v11;
}

@end