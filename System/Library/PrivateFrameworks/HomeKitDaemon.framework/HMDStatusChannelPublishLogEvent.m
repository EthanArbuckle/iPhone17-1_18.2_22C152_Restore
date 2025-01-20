@interface HMDStatusChannelPublishLogEvent
+ (id)denominatorEvent;
- (BOOL)isRetry;
- (HMDStatusChannelPublishLogEvent)initWithChannelPrefix:(id)a3 isRetry:(BOOL)a4;
- (HMDStatusChannelPublishLogEvent)initWithChannelPrefix:(id)a3 isRetry:(BOOL)a4 count:(int64_t)a5;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)channelPrefix;
- (NSString)coreAnalyticsEventName;
- (int64_t)count;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDStatusChannelPublishLogEvent

- (void).cxx_destruct
{
}

- (int64_t)count
{
  return self->_count;
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
  v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDStatusChannelPublishLogEvent count](self, "count"));
  [v3 setObject:v4 forKeyedSubscript:@"publishCount"];

  if ([(HMDStatusChannelPublishLogEvent *)self count])
  {
    v5 = [(HMDStatusChannelPublishLogEvent *)self channelPrefix];
    [v3 setObject:v5 forKeyedSubscript:@"channelPrefix"];

    if ([(HMDStatusChannelPublishLogEvent *)self isRetry]) {
      v6 = &unk_26E473C78;
    }
    else {
      v6 = &unk_26E473C60;
    }
    [v3 setObject:v6 forKeyedSubscript:@"publishCount"];
    if ([(HMDStatusChannelPublishLogEvent *)self isRetry]) {
      v7 = &unk_26E473C60;
    }
    else {
      v7 = &unk_26E473C78;
    }
    [v3 setObject:v7 forKeyedSubscript:@"publishRetryCount"];
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDStatusChannelPublishLogEvent isRetry](self, "isRetry"));
    [v3 setObject:v8 forKeyedSubscript:@"publishRetryBool"];
  }
  v9 = (void *)[v3 copy];

  return (NSDictionary *)v9;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.statuskit.channel.publish";
}

- (HMDStatusChannelPublishLogEvent)initWithChannelPrefix:(id)a3 isRetry:(BOOL)a4 count:(int64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDStatusChannelPublishLogEvent;
  v10 = [(HMMLogEvent *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_channelPrefix, a3);
    v11->_isRetry = a4;
    v11->_count = a5;
  }

  return v11;
}

- (HMDStatusChannelPublishLogEvent)initWithChannelPrefix:(id)a3 isRetry:(BOOL)a4
{
  return [(HMDStatusChannelPublishLogEvent *)self initWithChannelPrefix:a3 isRetry:a4 count:1];
}

+ (id)denominatorEvent
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithChannelPrefix:0 isRetry:0 count:0];
  return v2;
}

@end