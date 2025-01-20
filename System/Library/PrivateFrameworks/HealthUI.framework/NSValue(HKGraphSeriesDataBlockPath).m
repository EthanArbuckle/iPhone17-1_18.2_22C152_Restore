@interface NSValue(HKGraphSeriesDataBlockPath)
+ (uint64_t)valueWithHKGraphSeriesDataBlockPath:()HKGraphSeriesDataBlockPath;
- (uint64_t)HKGraphSeriesDataBlockPathValue;
@end

@implementation NSValue(HKGraphSeriesDataBlockPath)

+ (uint64_t)valueWithHKGraphSeriesDataBlockPath:()HKGraphSeriesDataBlockPath
{
  return [MEMORY[0x1E4F29238] valueWithBytes:a3 objCType:"{HKGraphSeriesDataBlockPath=qqq}"];
}

- (uint64_t)HKGraphSeriesDataBlockPathValue
{
  *x8_0 = 0;
  x8_0[1] = 0;
  x8_0[2] = 0;
  return [a1 getValue:x8_0];
}

@end