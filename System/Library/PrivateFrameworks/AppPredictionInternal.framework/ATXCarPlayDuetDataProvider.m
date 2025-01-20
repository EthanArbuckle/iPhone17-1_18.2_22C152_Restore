@interface ATXCarPlayDuetDataProvider
+ (Class)supportedDuetEventClass;
+ (int64_t)supportedCoreDuetStream;
@end

@implementation ATXCarPlayDuetDataProvider

+ (Class)supportedDuetEventClass
{
  return (Class)objc_opt_class();
}

+ (int64_t)supportedCoreDuetStream
{
  return 4;
}

@end