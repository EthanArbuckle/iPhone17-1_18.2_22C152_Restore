@interface HMDAppleMediaAccessoryRemovalLogEvent
- (BOOL)isDuplicate;
- (BOOL)isLocalFallback;
- (BOOL)isLocalRemoval;
- (HMDAppleMediaAccessoryRemovalLogEvent)initWithIsLocalRemoval:(BOOL)a3 isLocalFallback:(BOOL)a4 isDuplicate:(BOOL)a5 duplicateCount:(int64_t)a6;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (int64_t)duplicateCount;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDAppleMediaAccessoryRemovalLogEvent

- (int64_t)duplicateCount
{
  return self->_duplicateCount;
}

- (BOOL)isDuplicate
{
  return self->_isDuplicate;
}

- (BOOL)isLocalFallback
{
  return self->_isLocalFallback;
}

- (BOOL)isLocalRemoval
{
  return self->_isLocalRemoval;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAppleMediaAccessoryRemovalLogEvent isLocalRemoval](self, "isLocalRemoval"));
  [v3 setObject:v4 forKeyedSubscript:@"isLocalRemoval"];

  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAppleMediaAccessoryRemovalLogEvent isLocalFallback](self, "isLocalFallback"));
  [v3 setObject:v5 forKeyedSubscript:@"isLocalFallback"];

  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAppleMediaAccessoryRemovalLogEvent isDuplicate](self, "isDuplicate"));
  [v3 setObject:v6 forKeyedSubscript:@"isDuplicate"];

  v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDAppleMediaAccessoryRemovalLogEvent duplicateCount](self, "duplicateCount"));
  [v3 setObject:v7 forKeyedSubscript:@"duplicateCount"];

  return (NSDictionary *)v3;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.homepod.removal.metric.event";
}

- (HMDAppleMediaAccessoryRemovalLogEvent)initWithIsLocalRemoval:(BOOL)a3 isLocalFallback:(BOOL)a4 isDuplicate:(BOOL)a5 duplicateCount:(int64_t)a6
{
  v11.receiver = self;
  v11.super_class = (Class)HMDAppleMediaAccessoryRemovalLogEvent;
  result = [(HMMLogEvent *)&v11 init];
  if (result)
  {
    result->_isLocalRemoval = a3;
    result->_isLocalFallback = a4;
    result->_isDuplicate = a5;
    result->_duplicateCount = a6;
  }
  return result;
}

@end