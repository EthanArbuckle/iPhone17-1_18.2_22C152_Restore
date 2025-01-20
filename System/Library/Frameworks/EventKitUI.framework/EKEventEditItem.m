@interface EKEventEditItem
- (id)event;
- (void)setCalendarItem:(id)a3 store:(id)a4;
@end

@implementation EKEventEditItem

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
      [v9 handleFailureInMethod:a2, self, @"EKEventEditItem.m", 15, @"Tried to set %@ as an event on %@", v7, self object file lineNumber description];
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)EKEventEditItem;
  [(EKCalendarItemEditItem *)&v10 setCalendarItem:v7 store:v8];
}

- (id)event
{
  v4.receiver = self;
  v4.super_class = (Class)EKEventEditItem;
  v2 = [(EKCalendarItemEditItem *)&v4 calendarItem];

  return v2;
}

@end