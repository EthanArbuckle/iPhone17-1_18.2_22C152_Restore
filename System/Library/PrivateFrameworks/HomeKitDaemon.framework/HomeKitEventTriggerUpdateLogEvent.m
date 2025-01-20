@interface HomeKitEventTriggerUpdateLogEvent
- (HMDAnalyticsUpdateEventTriggerData)analyticsData;
- (HomeKitEventTriggerUpdateLogEvent)init;
@end

@implementation HomeKitEventTriggerUpdateLogEvent

- (void).cxx_destruct
{
}

- (HMDAnalyticsUpdateEventTriggerData)analyticsData
{
  return self->_analyticsData;
}

- (HomeKitEventTriggerUpdateLogEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)HomeKitEventTriggerUpdateLogEvent;
  v2 = [(HMMLogEvent *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(HMDAnalyticsUpdateEventTriggerData);
    analyticsData = v2->_analyticsData;
    v2->_analyticsData = v3;

    [(HMDAnalyticsUpdateEventTriggerData *)v2->_analyticsData setTimestamp:0];
  }
  return v2;
}

@end