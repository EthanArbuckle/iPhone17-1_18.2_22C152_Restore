@interface AMSStorage
+ (id)amsd_pushRegistrationThrottleMap;
+ (void)amsd_setPushRegistrationThrottleMap:(id)a3;
@end

@implementation AMSStorage

+ (id)amsd_pushRegistrationThrottleMap
{
  return [a1 _valueForKey:@"AMSPushRegistrationThrottleMap"];
}

+ (void)amsd_setPushRegistrationThrottleMap:(id)a3
{
}

@end