@interface HMDMinimalCoreAnalyticsLogEventObserverDelegate
- (void)addCommonDimensionsToEventDictionary:(id)a3;
@end

@implementation HMDMinimalCoreAnalyticsLogEventObserverDelegate

- (void)addCommonDimensionsToEventDictionary:(id)a3
{
  id v3 = a3;
  [v3 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"isHH2Enabled"];
  [v3 setObject:&unk_26E471878 forKeyedSubscript:@"isHH2Enabled_INT"];
  objc_msgSend(NSNumber, "numberWithInteger:", +[HMDMetricsDeviceStateManager internalDeviceDaysSinceSoftwareUpdate](HMDMetricsDeviceStateManager, "internalDeviceDaysSinceSoftwareUpdate"));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v4 forKeyedSubscript:@"daysSinceSWUpdate"];
}

@end