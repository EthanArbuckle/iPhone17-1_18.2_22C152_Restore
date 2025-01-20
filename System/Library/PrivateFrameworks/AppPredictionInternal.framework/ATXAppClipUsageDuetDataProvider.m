@interface ATXAppClipUsageDuetDataProvider
+ (Class)supportedDuetEventClass;
+ (int64_t)supportedCoreDuetStream;
@end

@implementation ATXAppClipUsageDuetDataProvider

+ (int64_t)supportedCoreDuetStream
{
  return 9;
}

+ (Class)supportedDuetEventClass
{
  return (Class)objc_opt_class();
}

@end