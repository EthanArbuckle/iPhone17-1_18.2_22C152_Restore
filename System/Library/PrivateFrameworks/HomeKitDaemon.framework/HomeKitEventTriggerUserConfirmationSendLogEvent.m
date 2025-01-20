@interface HomeKitEventTriggerUserConfirmationSendLogEvent
- (HMDAnalyticsEventTriggerUserConfirmationSendData)analyticsData;
- (HomeKitEventTriggerUserConfirmationSendLogEvent)initWithSessionID:(id)a3;
@end

@implementation HomeKitEventTriggerUserConfirmationSendLogEvent

- (void).cxx_destruct
{
}

- (HMDAnalyticsEventTriggerUserConfirmationSendData)analyticsData
{
  return self->_analyticsData;
}

- (HomeKitEventTriggerUserConfirmationSendLogEvent)initWithSessionID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HomeKitEventTriggerUserConfirmationSendLogEvent;
  v5 = [(HMMLogEvent *)&v9 init];
  if (v5)
  {
    v6 = objc_alloc_init(HMDAnalyticsEventTriggerUserConfirmationSendData);
    analyticsData = v5->_analyticsData;
    v5->_analyticsData = v6;

    [(HMDAnalyticsEventTriggerUserConfirmationSendData *)v5->_analyticsData setTimestamp:0];
    [(HMDAnalyticsEventTriggerUserConfirmationSendData *)v5->_analyticsData setSessionID:v4];
  }

  return v5;
}

@end