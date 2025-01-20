@interface MSMuteTriageAction
+ (int64_t)conversationNotificationLevelToSet;
@end

@implementation MSMuteTriageAction

+ (int64_t)conversationNotificationLevelToSet
{
  return 1;
}

@end