@interface HMDStatusChannelObserveLogEvent
+ (id)denominatorEvent;
- (HMDStatusChannelObserveLogEvent)initWithChannelPrefix:(id)a3;
- (HMDStatusChannelObserveLogEvent)initWithChannelPrefix:(id)a3 count:(int64_t)a4;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)channelPrefix;
- (NSString)coreAnalyticsEventName;
- (int64_t)count;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDStatusChannelObserveLogEvent

- (void).cxx_destruct
{
}

- (int64_t)count
{
  return self->_count;
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
  v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDStatusChannelObserveLogEvent count](self, "count"));
  [v3 setObject:v4 forKeyedSubscript:@"observeCount"];

  if ([(HMDStatusChannelObserveLogEvent *)self count])
  {
    v5 = [(HMDStatusChannelObserveLogEvent *)self channelPrefix];
    [v3 setObject:v5 forKeyedSubscript:@"channelPrefix"];
  }
  v6 = (void *)[v3 copy];

  return (NSDictionary *)v6;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.statuskit.channel.observe";
}

- (HMDStatusChannelObserveLogEvent)initWithChannelPrefix:(id)a3 count:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDStatusChannelObserveLogEvent;
  v8 = [(HMMLogEvent *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_channelPrefix, a3);
    v9->_count = a4;
  }

  return v9;
}

- (HMDStatusChannelObserveLogEvent)initWithChannelPrefix:(id)a3
{
  return [(HMDStatusChannelObserveLogEvent *)self initWithChannelPrefix:a3 count:1];
}

+ (id)denominatorEvent
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithChannelPrefix:0 count:0];
  return v2;
}

@end