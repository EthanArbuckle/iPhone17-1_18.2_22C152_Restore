@interface CUIKTravelAdvisoryUtilities
+ (BOOL)doesHypothesisSatisfyMinimumAllowableTravelTime:(id)a3 minimumAllowableTravelTime:(double)a4;
@end

@implementation CUIKTravelAdvisoryUtilities

+ (BOOL)doesHypothesisSatisfyMinimumAllowableTravelTime:(id)a3 minimumAllowableTravelTime:(double)a4
{
  [a3 estimatedTravelTime];
  return v5 >= a4;
}

@end