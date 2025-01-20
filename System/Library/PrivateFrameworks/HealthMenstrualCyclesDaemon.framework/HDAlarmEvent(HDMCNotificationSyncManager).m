@interface HDAlarmEvent(HDMCNotificationSyncManager)
- (id)hdmc_notificationHoldInstruction;
@end

@implementation HDAlarmEvent(HDMCNotificationSyncManager)

- (id)hdmc_notificationHoldInstruction
{
  v2 = objc_msgSend(a1, "hdmc_categoryIdentifier");
  v3 = [a1 currentDueDate];
  v4 = [v3 dateByAddingTimeInterval:86400.0];

  v5 = (void *)[objc_alloc(MEMORY[0x263F0A560]) initWithAction:2 categoryIdentifier:v2 expirationDate:v4];
  return v5;
}

@end