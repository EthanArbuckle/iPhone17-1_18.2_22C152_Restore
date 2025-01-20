@interface SCNLowLatencyMetalLayer
- (BOOL)lowLatency;
- (unint64_t)maximumDrawableCount;
@end

@implementation SCNLowLatencyMetalLayer

- (unint64_t)maximumDrawableCount
{
  return 2;
}

- (BOOL)lowLatency
{
  return 1;
}

@end