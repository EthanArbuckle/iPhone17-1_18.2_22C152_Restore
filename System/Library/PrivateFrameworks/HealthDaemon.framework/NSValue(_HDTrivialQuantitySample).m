@interface NSValue(_HDTrivialQuantitySample)
+ (id)_hd_valueWithTrivialQuantitySample:()_HDTrivialQuantitySample;
- (double)_hd_trivialQuantitySampleValue;
@end

@implementation NSValue(_HDTrivialQuantitySample)

- (double)_hd_trivialQuantitySampleValue
{
  v2[0] = 0;
  v2[1] = 0;
  [a1 getValue:v2];
  return *(double *)v2;
}

+ (id)_hd_valueWithTrivialQuantitySample:()_HDTrivialQuantitySample
{
  *(double *)v5 = a2;
  *(double *)&v5[1] = a3;
  v3 = [a1 valueWithBytes:v5 objCType:"{?=dd}"];

  return v3;
}

@end