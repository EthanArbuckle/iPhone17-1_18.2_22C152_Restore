@interface HMDHAPMetricsReachabilityAddRemoveEvent
- (HMDHAPMetricsReachabilityAddRemoveEvent)initWithAccessory:(id)a3 hmdAddRemoveEvent:(unint64_t)a4 forLinkType:(id)a5;
- (NSNumber)linkType;
- (id)coreAnalyticsEventDictionary;
- (id)coreAnalyticsEventName;
- (unint64_t)addRemoveEvent;
@end

@implementation HMDHAPMetricsReachabilityAddRemoveEvent

- (void).cxx_destruct
{
}

- (NSNumber)linkType
{
  return self->_linkType;
}

- (unint64_t)addRemoveEvent
{
  return self->_addRemoveEvent;
}

- (id)coreAnalyticsEventDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = objc_msgSend(NSNumber, "numberWithInt:", -[HMDHAPMetricsReachabilityAddRemoveEvent addRemoveEvent](self, "addRemoveEvent"));
  [v3 setObject:v4 forKey:@"addremove"];

  v5 = [(HMDHAPMetricsReachabilityAddRemoveEvent *)self linkType];
  [v3 setObject:v5 forKey:@"linkType"];

  v6 = (void *)[v3 copy];
  return v6;
}

- (id)coreAnalyticsEventName
{
  return @"com.apple.HomeKit.daemon.reachability.addremove";
}

- (HMDHAPMetricsReachabilityAddRemoveEvent)initWithAccessory:(id)a3 hmdAddRemoveEvent:(unint64_t)a4 forLinkType:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HMDHAPMetricsReachabilityAddRemoveEvent;
  v10 = [(HMDHAPMetrics *)&v13 initWithHMDAccessory:a3];
  v11 = v10;
  if (v10)
  {
    v10->_addRemoveEvent = a4;
    objc_storeStrong((id *)&v10->_linkType, a5);
  }

  return v11;
}

@end