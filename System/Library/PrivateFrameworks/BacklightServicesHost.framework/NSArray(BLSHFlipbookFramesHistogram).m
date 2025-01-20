@interface NSArray(BLSHFlipbookFramesHistogram)
- (double)bls_doubleMedian;
- (unint64_t)bls_unsignedIntegerMedian;
@end

@implementation NSArray(BLSHFlipbookFramesHistogram)

- (double)bls_doubleMedian
{
  unint64_t v2 = [a1 count];
  if (!v2) {
    return 0.0;
  }
  char v3 = v2;
  unint64_t v4 = v2 >> 1;
  v5 = [a1 objectAtIndex:v2 >> 1];
  [v5 doubleValue];
  double v7 = v6;

  if ((v3 & 1) == 0)
  {
    v8 = [a1 objectAtIndex:v4 - 1];
    [v8 doubleValue];
    double v10 = v9;

    return (v7 + v10) * 0.5;
  }
  return v7;
}

- (unint64_t)bls_unsignedIntegerMedian
{
  unint64_t v2 = [a1 count];
  if (!v2) {
    return 0;
  }
  char v3 = v2;
  unint64_t v4 = v2 >> 1;
  v5 = [a1 objectAtIndex:v2 >> 1];
  uint64_t v6 = [v5 unsignedLongValue];

  if ((v3 & 1) == 0)
  {
    double v7 = [a1 objectAtIndex:v4 - 1];
    uint64_t v8 = [v7 unsignedLongValue];

    return (unint64_t)(v8 + v6) >> 1;
  }
  return v6;
}

@end