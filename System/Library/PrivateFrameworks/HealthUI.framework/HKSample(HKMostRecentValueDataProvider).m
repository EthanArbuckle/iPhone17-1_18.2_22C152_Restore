@interface HKSample(HKMostRecentValueDataProvider)
- (uint64_t)dataProviderValue;
@end

@implementation HKSample(HKMostRecentValueDataProvider)

- (uint64_t)dataProviderValue
{
  return 0;
}

@end