@interface NSNumber(MKLaneDrawingUtilities)
- (uint64_t)_mk_laneDirectionValue;
@end

@implementation NSNumber(MKLaneDrawingUtilities)

- (uint64_t)_mk_laneDirectionValue
{
  uint64_t result = [a1 integerValue];
  if ((int)result <= 3)
  {
    if (result >= 3) {
      return 0;
    }
  }
  else if (((result - 4) > 0x3C || ((1 << (result - 4)) & 0x1000000010001011) == 0) {
         && result != 128
  }
         && result != 256)
  {
    return 0;
  }
  return result;
}

@end