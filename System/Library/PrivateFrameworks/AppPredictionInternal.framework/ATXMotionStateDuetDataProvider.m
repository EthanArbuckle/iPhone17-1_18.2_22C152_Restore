@interface ATXMotionStateDuetDataProvider
+ (Class)supportedDuetEventClass;
+ (int64_t)supportedCoreDuetStream;
@end

@implementation ATXMotionStateDuetDataProvider

+ (Class)supportedDuetEventClass
{
  return (Class)objc_opt_class();
}

+ (int64_t)supportedCoreDuetStream
{
  return 12;
}

@end