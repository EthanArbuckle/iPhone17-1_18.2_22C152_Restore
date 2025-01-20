@interface HKSample(HDDataEntity)
- (uint64_t)entityType;
@end

@implementation HKSample(HDDataEntity)

- (uint64_t)entityType
{
  return 1;
}

@end