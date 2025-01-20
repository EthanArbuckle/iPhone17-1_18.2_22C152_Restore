@interface ADAggregationParameters(ARAdditions)
- (BOOL)ar_isEqualToParameters:()ARAdditions;
- (id)copyWithZone:()ARAdditions;
@end

@implementation ADAggregationParameters(ARAdditions)

- (BOOL)ar_isEqualToParameters:()ARAdditions
{
  id v4 = a3;
  int v5 = [a1 aggregationSize];
  if (v5 == [v4 aggregationSize])
  {
    [a1 maxPointCloudAge];
    double v7 = v6;
    [v4 maxPointCloudAge];
    BOOL v9 = v7 == v8;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:()ARAdditions
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F4D7F8]);
  [a1 maxPointCloudAge];
  objc_msgSend(v2, "setMaxPointCloudAge:");
  objc_msgSend(v2, "setAggregationSize:", objc_msgSend(a1, "aggregationSize"));
  return v2;
}

@end