@interface EKReminderListDetailItem
+ (BOOL)allowDataDetector;
+ (id)textFromEventAndReminderBlock;
+ (id)titleForCell;
@end

@implementation EKReminderListDetailItem

+ (id)titleForCell
{
  v2 = EventKitUIBundle();
  v3 = [v2 localizedStringForKey:@"LIST-reminder-detail" value:@"LIST" table:0];

  return v3;
}

+ (BOOL)allowDataDetector
{
  return 0;
}

+ (id)textFromEventAndReminderBlock
{
  return &__block_literal_global_69;
}

id __57__EKReminderListDetailItem_textFromEventAndReminderBlock__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = (void *)MEMORY[0x1E4F57738];
  v4 = [a3 list];
  v5 = [v4 name];
  v6 = [v3 localizedTitleForTitle:v5 isSuggestedEventCalendar:0 isBirthdayCalendar:0 allowsReminders:1 isIntegrationCalendar:0];

  return v6;
}

@end