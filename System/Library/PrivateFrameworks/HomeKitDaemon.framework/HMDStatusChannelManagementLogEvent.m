@interface HMDStatusChannelManagementLogEvent
+ (id)denominatorEvent;
- (BOOL)isRetry;
- (HMDStatusChannelManagementLogEvent)initWithChannelPrefix:(id)a3 isRetry:(BOOL)a4 action:(int64_t)a5;
- (HMDStatusChannelManagementLogEvent)initWithChannelPrefix:(id)a3 isRetry:(BOOL)a4 action:(int64_t)a5 count:(int64_t)a6;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)channelPrefix;
- (NSString)coreAnalyticsEventName;
- (int64_t)action;
- (int64_t)count;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDStatusChannelManagementLogEvent

- (void).cxx_destruct
{
}

- (int64_t)count
{
  return self->_count;
}

- (int64_t)action
{
  return self->_action;
}

- (BOOL)isRetry
{
  return self->_isRetry;
}

- (NSString)channelPrefix
{
  return self->_channelPrefix;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDStatusChannelManagementLogEvent count](self, "count"));
  [v3 setObject:v4 forKeyedSubscript:@"managementActionCountAny"];

  if ([(HMDStatusChannelManagementLogEvent *)self count])
  {
    v5 = [(HMDStatusChannelManagementLogEvent *)self channelPrefix];
    [v3 setObject:v5 forKeyedSubscript:@"channelPrefix"];

    if ([(HMDStatusChannelManagementLogEvent *)self isRetry]) {
      v6 = &unk_26E473C78;
    }
    else {
      v6 = &unk_26E473C60;
    }
    [v3 setObject:v6 forKeyedSubscript:@"operationCount"];
    if ([(HMDStatusChannelManagementLogEvent *)self isRetry]) {
      v7 = &unk_26E473C60;
    }
    else {
      v7 = &unk_26E473C78;
    }
    [v3 setObject:v7 forKeyedSubscript:@"operationRetryCount"];
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDStatusChannelManagementLogEvent isRetry](self, "isRetry"));
    [v3 setObject:v8 forKeyedSubscript:@"operationRetryBool"];

    v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDStatusChannelManagementLogEvent action](self, "action"));
    [v3 setObject:v9 forKeyedSubscript:@"managementAction"];

    if ([(HMDStatusChannelManagementLogEvent *)self action]) {
      v10 = &unk_26E473C78;
    }
    else {
      v10 = &unk_26E473C60;
    }
    [v3 setObject:v10 forKeyedSubscript:@"managementActionCountUnknown"];
    if ([(HMDStatusChannelManagementLogEvent *)self action] == 1) {
      v11 = &unk_26E473C60;
    }
    else {
      v11 = &unk_26E473C78;
    }
    [v3 setObject:v11 forKeyedSubscript:@"managementActionCountSubscribe"];
    if ([(HMDStatusChannelManagementLogEvent *)self action] == 2) {
      v12 = &unk_26E473C60;
    }
    else {
      v12 = &unk_26E473C78;
    }
    [v3 setObject:v12 forKeyedSubscript:@"managementActionCountUnsubscribe"];
    if ([(HMDStatusChannelManagementLogEvent *)self action] == 3) {
      v13 = &unk_26E473C60;
    }
    else {
      v13 = &unk_26E473C78;
    }
    [v3 setObject:v13 forKeyedSubscript:@"managementActionCountInvite"];
    if ([(HMDStatusChannelManagementLogEvent *)self action] == 4) {
      v14 = &unk_26E473C60;
    }
    else {
      v14 = &unk_26E473C78;
    }
    [v3 setObject:v14 forKeyedSubscript:@"managementActionCountRemove"];
  }
  v15 = (void *)[v3 copy];

  return (NSDictionary *)v15;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.statuskit.channel.management";
}

- (HMDStatusChannelManagementLogEvent)initWithChannelPrefix:(id)a3 isRetry:(BOOL)a4 action:(int64_t)a5 count:(int64_t)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HMDStatusChannelManagementLogEvent;
  v12 = [(HMMLogEvent *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_channelPrefix, a3);
    v13->_isRetry = a4;
    v13->_action = a5;
    v13->_count = a6;
  }

  return v13;
}

- (HMDStatusChannelManagementLogEvent)initWithChannelPrefix:(id)a3 isRetry:(BOOL)a4 action:(int64_t)a5
{
  return [(HMDStatusChannelManagementLogEvent *)self initWithChannelPrefix:a3 isRetry:a4 action:a5 count:1];
}

+ (id)denominatorEvent
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithChannelPrefix:0 isRetry:0 action:0 count:0];
  return v2;
}

@end