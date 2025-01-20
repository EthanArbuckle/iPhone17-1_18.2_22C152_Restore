@interface BLSFidelityThreshold
+ (double)animationCoalesceThreshold;
+ (double)secondsFidelityThreshold;
+ (int64_t)fidelityForUpdateInterval:(double)a3;
@end

@implementation BLSFidelityThreshold

+ (double)secondsFidelityThreshold
{
  return 15.0;
}

+ (int64_t)fidelityForUpdateInterval:(double)a3
{
  int64_t v3 = 2;
  if (a3 > 15.0) {
    int64_t v3 = 1;
  }
  if (a3 >= 0.5) {
    return v3;
  }
  else {
    return 3;
  }
}

+ (double)animationCoalesceThreshold
{
  return 1.0;
}

@end