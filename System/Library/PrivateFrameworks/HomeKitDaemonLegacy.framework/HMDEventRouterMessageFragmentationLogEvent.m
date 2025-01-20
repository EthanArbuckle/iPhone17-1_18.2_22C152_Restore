@interface HMDEventRouterMessageFragmentationLogEvent
- (BOOL)isCachedEventQueue;
- (BOOL)isFragmented;
- (HMDEventRouterMessageFragmentationLogEvent)initWithIsCachedEventQueue:(BOOL)a3 isFragmented:(BOOL)a4;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDEventRouterMessageFragmentationLogEvent

- (BOOL)isFragmented
{
  return self->_isFragmented;
}

- (BOOL)isCachedEventQueue
{
  return self->_isCachedEventQueue;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (HMDEventRouterMessageFragmentationLogEvent)initWithIsCachedEventQueue:(BOOL)a3 isFragmented:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HMDEventRouterMessageFragmentationLogEvent;
  result = [(HMMLogEvent *)&v7 init];
  if (result)
  {
    result->_isCachedEventQueue = a3;
    result->_isFragmented = a4;
  }
  return result;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDEventRouterMessageFragmentationLogEvent isCachedEventQueue](self, "isCachedEventQueue"));
  [v3 setObject:v4 forKeyedSubscript:@"isCachedEventQueue_BOOL"];

  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDEventRouterMessageFragmentationLogEvent isFragmented](self, "isFragmented"));
  [v3 setObject:v5 forKeyedSubscript:@"isFragmented_BOOL"];

  if ([(HMDEventRouterMessageFragmentationLogEvent *)self isCachedEventQueue]) {
    v6 = &unk_1F2DC7A98;
  }
  else {
    v6 = &unk_1F2DC7AB0;
  }
  [v3 setObject:v6 forKeyedSubscript:@"isCachedEventQueue_INT"];
  if ([(HMDEventRouterMessageFragmentationLogEvent *)self isFragmented]) {
    objc_super v7 = &unk_1F2DC7A98;
  }
  else {
    objc_super v7 = &unk_1F2DC7AB0;
  }
  [v3 setObject:v7 forKeyedSubscript:@"isFragmented_INT"];
  return (NSDictionary *)v3;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.eventrouter.message.fragmentation";
}

@end