@interface HMDMinimalCoreAnalyticsLogEventObserverDelegate
- (void)addCommonDimensionsToEventDictionary:(id)a3;
@end

@implementation HMDMinimalCoreAnalyticsLogEventObserverDelegate

- (void)addCommonDimensionsToEventDictionary:(id)a3
{
  id v3 = a3;
  [v3 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"isHH2Enabled"];
  [v3 setObject:&unk_1F2DC80C8 forKeyedSubscript:@"isHH2Enabled_INT"];
  objc_msgSend(NSNumber, "numberWithInteger:", +[HMDMetricsDeviceStateManager internalDeviceDaysSinceSoftwareUpdate](HMDMetricsDeviceStateManager, "internalDeviceDaysSinceSoftwareUpdate"));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setObject:v4 forKeyedSubscript:@"daysSinceSWUpdate"];
}

@end