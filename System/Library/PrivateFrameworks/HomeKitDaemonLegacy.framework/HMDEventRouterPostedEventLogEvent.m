@interface HMDEventRouterPostedEventLogEvent
- (HMDEventRouterPostedEventLogEvent)initWithTopic:(id)a3;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (NSString)topic;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDEventRouterPostedEventLogEvent

- (void).cxx_destruct
{
}

- (NSString)topic
{
  return self->_topic;
}

- (HMDEventRouterPostedEventLogEvent)initWithTopic:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDEventRouterPostedEventLogEvent;
  v5 = [(HMMLogEvent *)&v9 init];
  if (v5)
  {
    uint64_t v6 = +[HMDEventRouterLogEventUtilities sanitizedTopicFromTopic:v4];
    topic = v5->_topic;
    v5->_topic = (NSString *)v6;
  }
  return v5;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"eventTopic";
  v2 = [(HMDEventRouterPostedEventLogEvent *)self topic];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.eventrouter.topic.eventadded";
}

@end