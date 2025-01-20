@interface HMDHomeLocationLogEvent
+ (id)updateWithHomeDistance:(double)a3;
- (HMDHomeLocationLogEvent)initWithDistance:(double)a3;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (double)homeLocationDistance;
- (int)isGreatDistance;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDHomeLocationLogEvent

- (int)isGreatDistance
{
  return self->_isGreatDistance;
}

- (double)homeLocationDistance
{
  return self->_homeLocationDistance;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"homeLocationDistance_DOUBLE";
  v3 = NSNumber;
  [(HMDHomeLocationLogEvent *)self homeLocationDistance];
  v4 = objc_msgSend(v3, "numberWithDouble:");
  v8[1] = @"isGreatDistance_INT";
  v9[0] = v4;
  v5 = objc_msgSend(NSNumber, "numberWithInt:", -[HMDHomeLocationLogEvent isGreatDistance](self, "isGreatDistance"));
  v9[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  return (NSDictionary *)v6;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.homeLocationUpdate";
}

- (HMDHomeLocationLogEvent)initWithDistance:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMDHomeLocationLogEvent;
  result = [(HMMLogEvent *)&v5 init];
  if (result)
  {
    result->_isGreatDistance = a3 > 500.0;
    result->_homeLocationDistance = a3;
  }
  return result;
}

+ (id)updateWithHomeDistance:(double)a3
{
  v3 = [[HMDHomeLocationLogEvent alloc] initWithDistance:a3];
  return v3;
}

@end