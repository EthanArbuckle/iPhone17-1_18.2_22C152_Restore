@interface NSArray
@end

@implementation NSArray

uint64_t __75__NSArray_AXMVisionEngineLookupConvenience__axm_featuresSortedByConfidence__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 confidence];
  double v7 = v6;
  [v5 confidence];
  if (v7 >= v8)
  {
    [v4 confidence];
    double v11 = v10;
    [v5 confidence];
    uint64_t v9 = v11 > v12;
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

@end