@interface WFReminderAccessResource
+ (BOOL)isSystemResource;
- (id)associatedAppIdentifier;
@end

@implementation WFReminderAccessResource

+ (BOOL)isSystemResource
{
  return 1;
}

- (id)associatedAppIdentifier
{
  return @"com.apple.reminders";
}

@end