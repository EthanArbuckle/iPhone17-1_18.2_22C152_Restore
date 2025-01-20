@interface _DKDeviceStandbyTimerMetadataKey
+ (id)delay;
+ (id)timerType;
@end

@implementation _DKDeviceStandbyTimerMetadataKey

+ (id)timerType
{
  return @"_DKDeviceStandbyTimerMetadataKey-timerType";
}

+ (id)delay
{
  return @"_DKDeviceStandbyTimerMetadataKey-delay";
}

@end