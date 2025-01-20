@interface ATXScreenLockStateDuetDataProvider
+ (Class)supportedDuetEventClass;
+ (int64_t)supportedCoreDuetStream;
@end

@implementation ATXScreenLockStateDuetDataProvider

+ (Class)supportedDuetEventClass
{
  return (Class)objc_opt_class();
}

+ (int64_t)supportedCoreDuetStream
{
  return 8;
}

@end