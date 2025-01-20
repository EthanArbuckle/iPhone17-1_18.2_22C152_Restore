@interface HMDHouseholdMetricsRequestContributor
- (HMDHouseholdMetricsRequestContributor)initWithCountersManager:(id)a3 dateProvider:(id)a4;
- (void)coalesceLogEvent:(id)a3 fromSourceEvent:(id)a4;
- (void)contributeLogEvent:(id)a3 toCoreAnalyticsEvent:(id)a4;
- (void)contributeLogEvent:(id)a3 toSerializedMetric:(id)a4;
- (void)deserializeLogEvent:(id)a3 fromSerializedMetric:(id)a4;
- (void)incrementRequestCountForHomeUUID:(id)a3 date:(id)a4;
- (void)populateLogEvent:(id)a3 forHomeWithUUID:(id)a4 associatedToDate:(id)a5;
@end

@implementation HMDHouseholdMetricsRequestContributor

- (void)coalesceLogEvent:(id)a3 fromSourceEvent:(id)a4
{
  id v5 = a3;
  objc_msgSend(v5, "setActiveDeviceCount:", objc_msgSend(v5, "activeDeviceCount") + objc_msgSend(a4, "activeDeviceCount"));
}

- (void)contributeLogEvent:(id)a3 toCoreAnalyticsEvent:(id)a4
{
  id v5 = NSNumber;
  id v6 = a4;
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(a3, "activeDeviceCount"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v7 forKeyedSubscript:@"activeDeviceCountKey"];
}

- (void)deserializeLogEvent:(id)a3 fromSerializedMetric:(id)a4
{
  id v5 = a4;
  id v14 = a3;
  id v6 = [v5 objectForKeyedSubscript:@"requestCountKey"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  uint64_t v9 = [v8 unsignedIntegerValue];
  [v14 setRequestCount:v9];
  v10 = [v5 objectForKeyedSubscript:@"activeDeviceCountKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  uint64_t v13 = [v12 unsignedIntegerValue];
  [v14 setActiveDeviceCount:v13];
}

- (void)contributeLogEvent:(id)a3 toSerializedMetric:(id)a4
{
  id v5 = NSNumber;
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v7, "requestCount"));
  [v6 setObject:v8 forKeyedSubscript:@"requestCountKey"];

  uint64_t v9 = NSNumber;
  uint64_t v10 = [v7 activeDeviceCount];

  id v11 = [v9 numberWithUnsignedInteger:v10];
  [v6 setObject:v11 forKeyedSubscript:@"activeDeviceCountKey"];
}

- (void)populateLogEvent:(id)a3 forHomeWithUUID:(id)a4 associatedToDate:(id)a5
{
  id v8 = a3;
  id v9 = [(HMDHouseholdActivityLogEventContributor *)self householdGroupForHomeWithUUID:a4 associatedWithDate:a5];
  objc_msgSend(v8, "setRequestCount:", objc_msgSend(v9, "fetchEventCounterForEventName:", @"RequestCount"));
  [v8 setActiveDeviceCount:1];
}

- (void)incrementRequestCountForHomeUUID:(id)a3 date:(id)a4
{
  id v4 = [(HMDHouseholdActivityLogEventContributor *)self householdGroupForHomeWithUUID:a3 associatedWithDate:a4];
  [v4 incrementEventCounterForEventName:@"RequestCount"];
}

- (HMDHouseholdMetricsRequestContributor)initWithCountersManager:(id)a3 dateProvider:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)HMDHouseholdMetricsRequestContributor;
  return [(HMDHouseholdActivityLogEventContributor *)&v5 initWithHouseholdGroupName:@"HouseholdMetricsClient" countersManager:a3 dateProvider:a4];
}

@end