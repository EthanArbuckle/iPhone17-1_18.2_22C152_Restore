@interface HMAccessorySettingsMessageDispatcherFinishSendingMessageEvent
- (HMAccessorySettingsMessageDispatcherFinishSendingMessageEvent)initWithMessageName:(id)a3;
- (NSString)messageName;
- (id)eventPayload;
@end

@implementation HMAccessorySettingsMessageDispatcherFinishSendingMessageEvent

- (void).cxx_destruct
{
}

- (NSString)messageName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (id)eventPayload
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v3 = [HMCoreAnalyticsStringFieldData alloc];
  v4 = [(HMAccessorySettingsMessageDispatcherFinishSendingMessageEvent *)self messageName];
  v5 = [(HMCoreAnalyticsStringFieldData *)v3 initWithName:@"messageName" stringValue:v4];

  v13.receiver = self;
  v13.super_class = (Class)HMAccessorySettingsMessageDispatcherFinishSendingMessageEvent;
  v6 = [(HMCoreAnalyticsTimedMetricEvent *)&v13 eventPayload];
  v7 = (void *)[v6 mutableCopy];

  v8 = [(HMCoreAnalyticsFieldData *)v5 name];
  v14 = v8;
  v9 = [(HMCoreAnalyticsFieldData *)v5 value];
  v15[0] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  [v7 setValuesForKeysWithDictionary:v10];

  v11 = (void *)[v7 copy];

  return v11;
}

- (HMAccessorySettingsMessageDispatcherFinishSendingMessageEvent)initWithMessageName:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)HMAccessorySettingsMessageDispatcherFinishSendingMessageEvent;
    v7 = [(HMCoreAnalyticsMetricEvent *)&v12 initWithName:@"com.apple.HomeKit.HMAccessorySettingsMetricsDispatcher.MessageDispatcher.FinishSendingMessageEvent"];
    v8 = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->_messageName, a3);
    }

    return v8;
  }
  else
  {
    v10 = (HMCoreAnalyticsMetricEvent *)_HMFPreconditionFailure();
    [(HMCoreAnalyticsMetricEvent *)v10 .cxx_destruct];
  }
  return result;
}

@end