@interface HMDAnalyticsPredicateData
- (HMDAnalyticsPredicateData)init;
@end

@implementation HMDAnalyticsPredicateData

- (void).cxx_destruct
{
}

- (HMDAnalyticsPredicateData)init
{
  v6.receiver = self;
  v6.super_class = (Class)HMDAnalyticsPredicateData;
  v2 = [(HMDAnalyticsPredicateData *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    presenceEvents = v2->_presenceEvents;
    v2->_presenceEvents = (NSMutableArray *)v3;
  }
  return v2;
}

@end