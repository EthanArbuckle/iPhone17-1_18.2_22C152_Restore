@interface EKReminderNotesDetailItem
+ (BOOL)allowDataDetector;
+ (id)textFromEventAndReminderBlock;
+ (id)titleForCell;
- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4;
@end

@implementation EKReminderNotesDetailItem

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  v5 = [(REMReminder *)self->super.super.super._reminder notes];
  v6 = [v5 string];
  if ([v6 length])
  {
    v7 = [(REMReminder *)self->super.super.super._reminder notes];
    v8 = [v7 string];
    char v9 = CUIKShouldDisplayNotes();
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

+ (id)titleForCell
{
  v2 = EventKitUIBundle();
  v3 = [v2 localizedStringForKey:@"NOTES-reminder-detail" value:@"NOTES" table:0];

  return v3;
}

+ (BOOL)allowDataDetector
{
  return 1;
}

+ (id)textFromEventAndReminderBlock
{
  return &__block_literal_global_26;
}

id __58__EKReminderNotesDetailItem_textFromEventAndReminderBlock__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = [a3 notes];
  v4 = [v3 string];

  return v4;
}

@end