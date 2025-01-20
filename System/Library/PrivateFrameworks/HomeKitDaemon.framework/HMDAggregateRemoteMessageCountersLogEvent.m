@interface HMDAggregateRemoteMessageCountersLogEvent
+ (id)aggregateRemoteCountersLogEventWithMessageName:(id)a3 deviceType:(id)a4 transportType:(id)a5 direction:(id)a6 primaryResidentDuration:(double)a7 count:(id)a8;
- (HMDAggregateRemoteMessageCountersLogEvent)initWithMessageName:(id)a3 deviceType:(id)a4 transportType:(id)a5 direction:(id)a6 primaryResidentDuration:(double)a7 count:(id)a8;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSNumber)count;
- (NSString)coreAnalyticsEventName;
- (NSString)deviceType;
- (NSString)direction;
- (NSString)messageName;
- (NSString)transportType;
- (double)primaryResidentDuration;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDAggregateRemoteMessageCountersLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_count, 0);
  objc_storeStrong((id *)&self->_messageName, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_direction, 0);
  objc_storeStrong((id *)&self->_transportType, 0);
}

- (NSNumber)count
{
  return self->_count;
}

- (double)primaryResidentDuration
{
  return self->_primaryResidentDuration;
}

- (NSString)messageName
{
  return self->_messageName;
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (NSString)direction
{
  return self->_direction;
}

- (NSString)transportType
{
  return self->_transportType;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v4 = [(HMDAggregateRemoteMessageCountersLogEvent *)self deviceType];
  v5 = (void *)v4;
  if (v4) {
    v6 = (__CFString *)v4;
  }
  else {
    v6 = &stru_26E2EB898;
  }
  [v3 setObject:v6 forKeyedSubscript:@"destinationDeviceType"];

  v7 = [(HMDAggregateRemoteMessageCountersLogEvent *)self messageName];
  [v3 setObject:v7 forKeyedSubscript:@"remoteMessageName"];

  v8 = [(HMDAggregateRemoteMessageCountersLogEvent *)self transportType];
  [v3 setObject:v8 forKeyedSubscript:@"transportType"];

  v9 = [(HMDAggregateRemoteMessageCountersLogEvent *)self direction];
  [v3 setObject:v9 forKeyedSubscript:@"remoteMessageDirection"];

  v10 = NSNumber;
  [(HMDAggregateRemoteMessageCountersLogEvent *)self primaryResidentDuration];
  v12 = [v10 numberWithInteger:llround((v11 + 59.0) / 60.0)];
  [v3 setObject:v12 forKeyedSubscript:@"primaryResidentDurationMinutes"];

  v13 = [(HMDAggregateRemoteMessageCountersLogEvent *)self count];
  [v3 setObject:v13 forKeyedSubscript:@"aggregateCount"];

  v14 = (void *)[v3 copy];
  return (NSDictionary *)v14;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.periodicAggregationReport.remote-message";
}

- (HMDAggregateRemoteMessageCountersLogEvent)initWithMessageName:(id)a3 deviceType:(id)a4 transportType:(id)a5 direction:(id)a6 primaryResidentDuration:(double)a7 count:(id)a8
{
  id v22 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  v23.receiver = self;
  v23.super_class = (Class)HMDAggregateRemoteMessageCountersLogEvent;
  v19 = [(HMMLogEvent *)&v23 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_messageName, a3);
    objc_storeStrong((id *)&v20->_deviceType, a4);
    objc_storeStrong((id *)&v20->_transportType, a5);
    objc_storeStrong((id *)&v20->_direction, a6);
    v20->_primaryResidentDuration = a7;
    objc_storeStrong((id *)&v20->_count, a8);
  }

  return v20;
}

+ (id)aggregateRemoteCountersLogEventWithMessageName:(id)a3 deviceType:(id)a4 transportType:(id)a5 direction:(id)a6 primaryResidentDuration:(double)a7 count:(id)a8
{
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = (void *)[objc_alloc((Class)a1) initWithMessageName:v18 deviceType:v17 transportType:v16 direction:v15 primaryResidentDuration:v14 count:a7];

  return v19;
}

@end