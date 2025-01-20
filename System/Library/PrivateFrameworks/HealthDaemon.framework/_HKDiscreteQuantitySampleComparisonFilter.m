@interface _HKDiscreteQuantitySampleComparisonFilter
- (id)_comparisonQuantityAsNumber;
@end

@implementation _HKDiscreteQuantitySampleComparisonFilter

- (id)_comparisonQuantityAsNumber
{
  id v1 = a1;
  if (a1)
  {
    v2 = [a1 value];
    v3 = [v1 dataTypes];
    v4 = [v3 anyObject];

    v5 = NSNumber;
    v6 = [v4 canonicalUnit];
    [v2 doubleValueForUnit:v6];
    objc_msgSend(v5, "numberWithDouble:");
    id v1 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v1;
}

@end