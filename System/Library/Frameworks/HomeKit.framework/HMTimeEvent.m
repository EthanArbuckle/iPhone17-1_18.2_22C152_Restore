@interface HMTimeEvent
+ (BOOL)isSupportedForHome:(id)a3;
@end

@implementation HMTimeEvent

+ (BOOL)isSupportedForHome:(id)a3
{
  return +[HMEvent sharedTriggerActivationSupportedForHome:a3];
}

@end