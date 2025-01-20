@interface HDRestorableAlarm(Medications)
- (id)medicationNotificationEventWithScheduleItem:()Medications dueDate:isFollowUp:isCritical:medicationsCount:;
- (uint64_t)medicationExpirationEventWithScheduleItemIdentifier:()Medications dueDate:;
@end

@implementation HDRestorableAlarm(Medications)

- (id)medicationNotificationEventWithScheduleItem:()Medications dueDate:isFollowUp:isCritical:medicationsCount:
{
  id v12 = a4;
  v13 = [a3 identifier];
  v14 = [MEMORY[0x1E4F28ED0] numberWithBool:a5];
  uint64_t v15 = [v14 longValue];

  v16 = [MEMORY[0x1E4F28ED0] numberWithBool:a6];
  uint64_t v17 = [v16 longValue];

  v18 = [NSString stringWithFormat:@"%@%@%@%@%@%@%li%@%@%@%li", @"scheduleItemId", @":", v13, @",", @"isFollowUp", @":", v15, @",", @"isCritical", @":", v17];

  v19 = [a1 eventWithIdentifier:v18 dueDate:v12 eventOptions:0 clientOptions:a7 > 1];

  return v19;
}

- (uint64_t)medicationExpirationEventWithScheduleItemIdentifier:()Medications dueDate:
{
  return [a1 eventWithIdentifier:a3 dueDate:a4 eventOptions:0];
}

@end