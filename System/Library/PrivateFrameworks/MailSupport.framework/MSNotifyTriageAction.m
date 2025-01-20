@interface MSNotifyTriageAction
+ (int64_t)conversationNotificationLevelToSet;
@end

@implementation MSNotifyTriageAction

+ (int64_t)conversationNotificationLevelToSet
{
  return 2;
}

@end