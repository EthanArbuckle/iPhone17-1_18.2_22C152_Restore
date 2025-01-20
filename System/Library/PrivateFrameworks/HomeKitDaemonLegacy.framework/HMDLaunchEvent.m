@interface HMDLaunchEvent
- (BOOL)isFirstLaunchAfterBoot;
- (HMDLaunchEvent)initWithFirstLaunchAfterBoot:(BOOL)a3;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDLaunchEvent

- (BOOL)isFirstLaunchAfterBoot
{
  return self->_firstLaunchAfterBoot;
}

- (HMDLaunchEvent)initWithFirstLaunchAfterBoot:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMDLaunchEvent;
  result = [(HMMDatedLogEvent *)&v5 init];
  if (result) {
    result->_firstLaunchAfterBoot = a3;
  }
  return result;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v6[1] = *MEMORY[0x1E4F143B8];
  objc_super v5 = @"isFirstLaunchAfterBoot";
  v2 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDLaunchEvent isFirstLaunchAfterBoot](self, "isFirstLaunchAfterBoot"));
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.launch";
}

@end