@interface HMDMessageHandlerFailureMetricEvent
- (HMDMessageHandlerFailureMetricEvent)initWithFailureType:(unint64_t)a3 messageName:(id)a4;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (NSString)messageName;
- (NSString)type;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDMessageHandlerFailureMetricEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_messageName, 0);
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)messageName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v8[2] = *MEMORY[0x263EF8340];
  v7[0] = @"messageName";
  v3 = [(HMDMessageHandlerFailureMetricEvent *)self messageName];
  v7[1] = @"failureType";
  v8[0] = v3;
  v4 = [(HMDMessageHandlerFailureMetricEvent *)self type];
  v8[1] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return (NSDictionary *)v5;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.message.handler.failureEvent";
}

- (HMDMessageHandlerFailureMetricEvent)initWithFailureType:(unint64_t)a3 messageName:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDMessageHandlerFailureMetricEvent;
  v8 = [(HMMLogEvent *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_messageName, a4);
    if (a3 > 2) {
      v10 = @"unknown";
    }
    else {
      v10 = off_264A23048[a3];
    }
    objc_storeStrong((id *)&v9->_type, v10);
  }

  return v9;
}

@end