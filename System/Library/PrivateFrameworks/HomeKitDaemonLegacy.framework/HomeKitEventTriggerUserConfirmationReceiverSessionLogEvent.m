@interface HomeKitEventTriggerUserConfirmationReceiverSessionLogEvent
- (HMDAnalyticsEventTriggerUserConfirmationReceiverSessionData)analyticsData;
- (HomeKitEventTriggerUserConfirmationReceiverSessionLogEvent)initWithSessionID:(id)a3;
@end

@implementation HomeKitEventTriggerUserConfirmationReceiverSessionLogEvent

- (void).cxx_destruct
{
}

- (HMDAnalyticsEventTriggerUserConfirmationReceiverSessionData)analyticsData
{
  return self->_analyticsData;
}

- (HomeKitEventTriggerUserConfirmationReceiverSessionLogEvent)initWithSessionID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HomeKitEventTriggerUserConfirmationReceiverSessionLogEvent;
  v5 = [(HMMLogEvent *)&v9 init];
  if (v5)
  {
    v6 = objc_alloc_init(HMDAnalyticsEventTriggerUserConfirmationReceiverSessionData);
    analyticsData = v5->_analyticsData;
    v5->_analyticsData = v6;

    [(HMDAnalyticsEventTriggerUserConfirmationReceiverSessionData *)v5->_analyticsData setTimestamp:0];
    [(HMDAnalyticsEventTriggerUserConfirmationReceiverSessionData *)v5->_analyticsData setSessionID:v4];
  }

  return v5;
}

@end