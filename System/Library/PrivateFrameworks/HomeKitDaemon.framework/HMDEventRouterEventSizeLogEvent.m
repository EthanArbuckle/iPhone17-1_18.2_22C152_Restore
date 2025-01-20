@interface HMDEventRouterEventSizeLogEvent
- (BOOL)isCached;
- (HMDEventRouterEventSizeLogEvent)initWithTopic:(id)a3 eventSize:(unint64_t)a4 isCached:(BOOL)a5;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (NSString)topic;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)size;
@end

@implementation HMDEventRouterEventSizeLogEvent

- (void).cxx_destruct
{
}

- (BOOL)isCached
{
  return self->_isCached;
}

- (unint64_t)size
{
  return self->_size;
}

- (NSString)topic
{
  return self->_topic;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (HMDEventRouterEventSizeLogEvent)initWithTopic:(id)a3 eventSize:(unint64_t)a4 isCached:(BOOL)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDEventRouterEventSizeLogEvent;
  v10 = [(HMMLogEvent *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_topic, a3);
    v11->_size = a4;
    v11->_isCached = a5;
  }

  return v11;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [(HMDEventRouterEventSizeLogEvent *)self topic];
  [v3 setObject:v4 forKeyedSubscript:@"eventTopic"];

  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDEventRouterEventSizeLogEvent size](self, "size"));
  [v3 setObject:v5 forKeyedSubscript:@"eventSize"];

  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDEventRouterEventSizeLogEvent isCached](self, "isCached"));
  [v3 setObject:v6 forKeyedSubscript:@"isCached_BOOL"];

  if ([(HMDEventRouterEventSizeLogEvent *)self isCached]) {
    v7 = &unk_26E4717E8;
  }
  else {
    v7 = &unk_26E471800;
  }
  [v3 setObject:v7 forKeyedSubscript:@"isCached_INT"];
  return (NSDictionary *)v3;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.eventrouter.event.size";
}

@end