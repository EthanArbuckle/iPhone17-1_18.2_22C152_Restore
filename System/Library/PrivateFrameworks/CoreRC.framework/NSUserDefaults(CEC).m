@interface NSUserDefaults(CEC)
+ (uint64_t)cecUserDefaults;
- (uint64_t)analyticsDelay;
- (uint64_t)cecActiveSourceRecentlySentDuration;
- (uint64_t)cecDeferLossOfLink;
- (uint64_t)lastKnownPhysicalAddress;
- (uint64_t)powerNotificationDebounceTime;
- (uint64_t)setLastKnownPhysicalAddress:()CEC;
@end

@implementation NSUserDefaults(CEC)

+ (uint64_t)cecUserDefaults
{
  if (cecUserDefaults_cecUserDefaultsInitialized != -1) {
    dispatch_once(&cecUserDefaults_cecUserDefaultsInitialized, &__block_literal_global_1);
  }
  return cecUserDefaults_cecUserDefaults;
}

- (uint64_t)cecDeferLossOfLink
{
  return [a1 BOOLForKey:@"deferLossOfLink"];
}

- (uint64_t)setLastKnownPhysicalAddress:()CEC
{
  return [a1 setInteger:a3 forKey:@"previousPhysicalAddress"];
}

- (uint64_t)lastKnownPhysicalAddress
{
  return [a1 integerForKey:@"previousPhysicalAddress"];
}

- (uint64_t)analyticsDelay
{
  return [a1 integerForKey:@"analyticsDelay"];
}

- (uint64_t)cecActiveSourceRecentlySentDuration
{
  return [a1 integerForKey:@"cecActiveSourceRecentlySentDuration"];
}

- (uint64_t)powerNotificationDebounceTime
{
  return [a1 integerForKey:@"powerNotificationDebounceTime"];
}

@end