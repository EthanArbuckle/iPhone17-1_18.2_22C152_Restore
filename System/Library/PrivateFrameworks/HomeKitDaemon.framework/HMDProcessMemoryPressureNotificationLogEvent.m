@interface HMDProcessMemoryPressureNotificationLogEvent
+ (id)createEventWithProcessMemoryState:(id)a3 dataSyncState:(id)a4;
- (HMDProcessMemoryPressureNotificationLogEvent)initWithProcessMemoryState:(id)a3 dataSyncState:(id)a4;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (NSString)dataSyncState;
- (NSString)processMemoryState;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDProcessMemoryPressureNotificationLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSyncState, 0);
  objc_storeStrong((id *)&self->_processMemoryState, 0);
}

- (NSString)dataSyncState
{
  return self->_dataSyncState;
}

- (NSString)processMemoryState
{
  return self->_processMemoryState;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v10[2] = *MEMORY[0x263EF8340];
  v9[0] = @"processMemoryState";
  v3 = [(HMDProcessMemoryPressureNotificationLogEvent *)self processMemoryState];
  if (v3) {
    [(HMDProcessMemoryPressureNotificationLogEvent *)self processMemoryState];
  }
  else {
  v4 = [MEMORY[0x263EFF9D0] null];
  }
  v9[1] = @"dataSyncState";
  v10[0] = v4;
  v5 = [(HMDProcessMemoryPressureNotificationLogEvent *)self dataSyncState];
  if (v5) {
    [(HMDProcessMemoryPressureNotificationLogEvent *)self dataSyncState];
  }
  else {
  v6 = [MEMORY[0x263EFF9D0] null];
  }
  v10[1] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  return (NSDictionary *)v7;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.MemoryPressureNotificationEvent";
}

- (HMDProcessMemoryPressureNotificationLogEvent)initWithProcessMemoryState:(id)a3 dataSyncState:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDProcessMemoryPressureNotificationLogEvent;
  v9 = [(HMMLogEvent *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_processMemoryState, a3);
    objc_storeStrong((id *)&v10->_dataSyncState, a4);
  }

  return v10;
}

+ (id)createEventWithProcessMemoryState:(id)a3 dataSyncState:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[HMDProcessMemoryPressureNotificationLogEvent alloc] initWithProcessMemoryState:v6 dataSyncState:v5];

  return v7;
}

@end