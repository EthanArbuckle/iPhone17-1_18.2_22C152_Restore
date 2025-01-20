@interface NSObject
- (BOOL)_accessibilityShouldUseSlices;
- (double)_accessibilityTimeIntervalPerSlice;
- (id)_accessibilityQuantityForSliceAtIndex:(unint64_t)a3;
- (id)accessibilityDescriptionForPercentages:(double)a3 exercisingPercentage:(double)a4 standingPercentage:(double)a5 arePercentagesCapped:(BOOL)a6;
- (unint64_t)_accessibilityNumberOfSlices;
@end

@implementation NSObject

- (BOOL)_accessibilityShouldUseSlices
{
  return 0;
}

- (unint64_t)_accessibilityNumberOfSlices
{
  return 0;
}

- (id)_accessibilityQuantityForSliceAtIndex:(unint64_t)a3
{
  return 0;
}

- (double)_accessibilityTimeIntervalPerSlice
{
  return 0.0;
}

- (id)accessibilityDescriptionForPercentages:(double)a3 exercisingPercentage:(double)a4 standingPercentage:(double)a5 arePercentagesCapped:(BOOL)a6
{
  return accessibilityDescriptionForPercentages(a6, a3, a4, a5);
}

@end