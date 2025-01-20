@interface HMDHAPMetrics
- (HMDHAPMetrics)initWithHMDAccessory:(id)a3;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)accessoryIdentifier;
- (NSString)coreAnalyticsEventName;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDHAPMetrics

- (void).cxx_destruct
{
}

- (NSString)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 4;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (NSString)coreAnalyticsEventName
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (HMDHAPMetrics)initWithHMDAccessory:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDHAPMetrics;
  v5 = [(HMMLogEvent *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 identifier];
    accessoryIdentifier = v5->_accessoryIdentifier;
    v5->_accessoryIdentifier = (NSString *)v6;
  }
  return v5;
}

@end