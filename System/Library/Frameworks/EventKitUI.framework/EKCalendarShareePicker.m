@interface EKCalendarShareePicker
- (BOOL)showAvailability;
- (id)peoplePickerPrompt;
@end

@implementation EKCalendarShareePicker

- (id)peoplePickerPrompt
{
  v2 = EventKitUIBundle();
  v3 = [v2 localizedStringForKey:@"Add participants to this Calendar." value:&stru_1F0CC2140 table:0];

  return v3;
}

- (BOOL)showAvailability
{
  return 0;
}

@end