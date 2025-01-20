@interface HFCameraSignificantEventConfiguration(HUAdditions)
+ (uint64_t)defaultNotificationAnyMotionIsDetected;
@end

@implementation HFCameraSignificantEventConfiguration(HUAdditions)

+ (uint64_t)defaultNotificationAnyMotionIsDetected
{
  return [MEMORY[0x1E4F68FD8] configurationWithEventTypes:0 personFamiliarityOptions:0];
}

@end