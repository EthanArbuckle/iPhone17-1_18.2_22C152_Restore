@interface HMDHAPMetricsStateNumberChangeEvent
- (HMDHAPMetricsStateNumberChangeEvent)initWithAccessory:(id)a3;
- (id)coreAnalyticsEventDictionary;
- (id)coreAnalyticsEventName;
@end

@implementation HMDHAPMetricsStateNumberChangeEvent

- (id)coreAnalyticsEventDictionary
{
  return (id)MEMORY[0x263EFFA78];
}

- (id)coreAnalyticsEventName
{
  return @"com.apple.HomeKit.daemon.reachability.state.number.change";
}

- (HMDHAPMetricsStateNumberChangeEvent)initWithAccessory:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HMDHAPMetricsStateNumberChangeEvent;
  return [(HMDHAPMetrics *)&v4 initWithHMDAccessory:a3];
}

@end