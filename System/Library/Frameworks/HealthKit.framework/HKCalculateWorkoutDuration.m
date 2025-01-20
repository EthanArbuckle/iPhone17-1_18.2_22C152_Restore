@interface HKCalculateWorkoutDuration
@end

@implementation HKCalculateWorkoutDuration

double ___HKCalculateWorkoutDuration_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  [a3 timeIntervalSinceDate:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = v5 + *(double *)(v4 + 24);
  *(double *)(v4 + 24) = result;
  return result;
}

@end