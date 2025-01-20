@interface HMDAggregateXPCMessageCountersLogEvent
+ (id)xpcAcceptedCountersLogEventWithPeerInformation:(id)a3 messageName:(id)a4 primaryResidentDuration:(double)a5 count:(id)a6;
+ (id)xpcSentCountersLogEventWithPeerInformation:(id)a3 messageName:(id)a4 primaryResidentDuration:(double)a5 count:(id)a6;
- (HMDAggregateXPCMessageCountersLogEvent)initWithEventName:(id)a3 peerInformation:(id)a4 messageName:(id)a5 primaryResidentDuration:(double)a6 count:(id)a7;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSNumber)count;
- (NSString)coreAnalyticsEventName;
- (NSString)messageName;
- (NSString)peerInformation;
- (double)primaryResidentDuration;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDAggregateXPCMessageCountersLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_count, 0);
  objc_storeStrong((id *)&self->_messageName, 0);
  objc_storeStrong((id *)&self->_peerInformation, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsEventName, 0);
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

- (NSString)peerInformation
{
  return self->_peerInformation;
}

- (NSString)coreAnalyticsEventName
{
  return self->_coreAnalyticsEventName;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [(HMDAggregateXPCMessageCountersLogEvent *)self peerInformation];
  [v3 setObject:v4 forKeyedSubscript:@"appIdentifier"];

  v5 = [(HMDAggregateXPCMessageCountersLogEvent *)self messageName];
  [v3 setObject:v5 forKeyedSubscript:@"messageName"];

  v6 = NSNumber;
  [(HMDAggregateXPCMessageCountersLogEvent *)self primaryResidentDuration];
  v8 = [v6 numberWithInteger:(uint64_t)((v7 + 59.0) / 60.0)];
  [v3 setObject:v8 forKeyedSubscript:@"primaryResidentDurationMinutes"];

  v9 = [(HMDAggregateXPCMessageCountersLogEvent *)self count];
  [v3 setObject:v9 forKeyedSubscript:@"counter"];

  v10 = (void *)[v3 copy];
  return (NSDictionary *)v10;
}

- (HMDAggregateXPCMessageCountersLogEvent)initWithEventName:(id)a3 peerInformation:(id)a4 messageName:(id)a5 primaryResidentDuration:(double)a6 count:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)HMDAggregateXPCMessageCountersLogEvent;
  v17 = [(HMMLogEvent *)&v24 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_coreAnalyticsEventName, a3);
    uint64_t v19 = [v14 copy];
    peerInformation = v18->_peerInformation;
    v18->_peerInformation = (NSString *)v19;

    uint64_t v21 = [v15 copy];
    messageName = v18->_messageName;
    v18->_messageName = (NSString *)v21;

    v18->_primaryResidentDuration = a6;
    objc_storeStrong((id *)&v18->_count, a7);
  }

  return v18;
}

+ (id)xpcSentCountersLogEventWithPeerInformation:(id)a3 messageName:(id)a4 primaryResidentDuration:(double)a5 count:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = (void *)[objc_alloc((Class)a1) initWithEventName:@"com.apple.HomeKit.xpc.notifications.sent" peerInformation:v12 messageName:v11 primaryResidentDuration:v10 count:a5];

  return v13;
}

+ (id)xpcAcceptedCountersLogEventWithPeerInformation:(id)a3 messageName:(id)a4 primaryResidentDuration:(double)a5 count:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = (void *)[objc_alloc((Class)a1) initWithEventName:@"com.apple.HomeKit.xpc.requests.accepted" peerInformation:v12 messageName:v11 primaryResidentDuration:v10 count:a5];

  return v13;
}

@end