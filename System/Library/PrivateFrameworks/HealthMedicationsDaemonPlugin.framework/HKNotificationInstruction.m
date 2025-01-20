@interface HKNotificationInstruction
@end

@implementation HKNotificationInstruction

id __89__HKNotificationInstruction_Medications__scheduleItemIdentifiersFromCategoryIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 hasPrefix:@"MSIID-"])
  {
    v4 = [*(id *)(a1 + 32) scheduleItemIdentifierFromCategoryIdentifier:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end