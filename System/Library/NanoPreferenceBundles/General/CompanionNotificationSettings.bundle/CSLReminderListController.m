@interface CSLReminderListController
- (BOOL)suppressSendToNotificationCenterOption;
- (int64_t)alertType;
@end

@implementation CSLReminderListController

- (int64_t)alertType
{
  return 11;
}

- (BOOL)suppressSendToNotificationCenterOption
{
  return 0;
}

@end