@interface HMDResidentStatusChannelPublishLogEvent
+ (id)denominatorEvent:(id)a3;
- (HMDResidentStatusChannelPublishLogEvent)initWithHomeUUID:(id)a3 publishReason:(int64_t)a4;
- (HMDResidentStatusChannelPublishLogEvent)initWithHomeUUID:(id)a3 publishReason:(int64_t)a4 count:(int64_t)a5;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (int64_t)count;
- (int64_t)publishReason;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDResidentStatusChannelPublishLogEvent

- (int64_t)count
{
  return self->_count;
}

- (int64_t)publishReason
{
  return self->_publishReason;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 2;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDResidentStatusChannelPublishLogEvent count](self, "count"));
  [v3 setObject:v4 forKeyedSubscript:@"publishReasonCountAny"];

  if ([(HMDResidentStatusChannelPublishLogEvent *)self count])
  {
    if ([(HMDResidentStatusChannelPublishLogEvent *)self publishReason]) {
      v5 = &unk_26E4738E8;
    }
    else {
      v5 = &unk_26E4738D0;
    }
    [v3 setObject:v5 forKeyedSubscript:@"publishReasonCountUnknown"];
    if ([(HMDResidentStatusChannelPublishLogEvent *)self publishReason] == 1) {
      v6 = &unk_26E4738D0;
    }
    else {
      v6 = &unk_26E4738E8;
    }
    [v3 setObject:v6 forKeyedSubscript:@"publishReasonCountResident"];
    if ([(HMDResidentStatusChannelPublishLogEvent *)self publishReason] == 2) {
      v7 = &unk_26E4738D0;
    }
    else {
      v7 = &unk_26E4738E8;
    }
    [v3 setObject:v7 forKeyedSubscript:@"publishReasonCountBecamePrimary"];
    if ([(HMDResidentStatusChannelPublishLogEvent *)self publishReason] == 3) {
      v8 = &unk_26E4738D0;
    }
    else {
      v8 = &unk_26E4738E8;
    }
    [v3 setObject:v8 forKeyedSubscript:@"publishReasonCountLostPrimary"];
    if ([(HMDResidentStatusChannelPublishLogEvent *)self publishReason] == 4) {
      v9 = &unk_26E4738D0;
    }
    else {
      v9 = &unk_26E4738E8;
    }
    [v3 setObject:v9 forKeyedSubscript:@"publishReasonCountPreferredResidentsListUpdate"];
    v10 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDResidentStatusChannelPublishLogEvent publishReason](self, "publishReason"));
    [v3 setObject:v10 forKeyedSubscript:@"publishReason"];
  }
  v11 = (void *)[v3 copy];

  return (NSDictionary *)v11;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.statuskit.channel.residentStatus.publish";
}

- (HMDResidentStatusChannelPublishLogEvent)initWithHomeUUID:(id)a3 publishReason:(int64_t)a4 count:(int64_t)a5
{
  v8.receiver = self;
  v8.super_class = (Class)HMDResidentStatusChannelPublishLogEvent;
  result = [(HMMHomeLogEvent *)&v8 initWithHomeUUID:a3];
  if (result)
  {
    result->_publishReason = a4;
    result->_count = a5;
  }
  return result;
}

- (HMDResidentStatusChannelPublishLogEvent)initWithHomeUUID:(id)a3 publishReason:(int64_t)a4
{
  return [(HMDResidentStatusChannelPublishLogEvent *)self initWithHomeUUID:a3 publishReason:a4 count:1];
}

+ (id)denominatorEvent:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithHomeUUID:v3 publishReason:0 count:0];

  return v4;
}

@end