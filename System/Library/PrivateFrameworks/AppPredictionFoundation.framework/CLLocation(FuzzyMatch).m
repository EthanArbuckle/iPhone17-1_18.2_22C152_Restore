@interface CLLocation(FuzzyMatch)
- (BOOL)atx_isFuzzyMatch:()FuzzyMatch;
@end

@implementation CLLocation(FuzzyMatch)

- (BOOL)atx_isFuzzyMatch:()FuzzyMatch
{
  id v4 = a3;
  if ([a1 isEqual:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [a1 distanceFromLocation:v4];
      BOOL v5 = v6 < 5.0;
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

@end