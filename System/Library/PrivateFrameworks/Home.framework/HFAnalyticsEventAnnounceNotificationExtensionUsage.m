@interface HFAnalyticsEventAnnounceNotificationExtensionUsage
- (HFAnalyticsEventAnnounceNotificationExtensionUsage)initWithData:(id)a3;
- (NSNumber)notificationUsageDuration;
- (id)payload;
- (void)setNotificationUsageDuration:(id)a3;
@end

@implementation HFAnalyticsEventAnnounceNotificationExtensionUsage

- (HFAnalyticsEventAnnounceNotificationExtensionUsage)initWithData:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:@"notificationExtensionUsageDuration"];
  if (!v4) {
    NSLog(&cfstr_Hfanalyticsann_14.isa);
  }
  v8.receiver = self;
  v8.super_class = (Class)HFAnalyticsEventAnnounceNotificationExtensionUsage;
  v5 = [(HFAnalyticsEvent *)&v8 initWithEventType:19];
  v6 = v5;
  if (v5) {
    objc_storeStrong((id *)&v5->_notificationUsageDuration, v4);
  }

  return v6;
}

- (id)payload
{
  v7.receiver = self;
  v7.super_class = (Class)HFAnalyticsEventAnnounceNotificationExtensionUsage;
  v3 = [(HFAnalyticsEvent *)&v7 payload];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(HFAnalyticsEventAnnounceNotificationExtensionUsage *)self notificationUsageDuration];
  [v4 setObject:v5 forKeyedSubscript:@"notificationExtensionUsageDuration"];

  return v4;
}

- (NSNumber)notificationUsageDuration
{
  return self->_notificationUsageDuration;
}

- (void)setNotificationUsageDuration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end