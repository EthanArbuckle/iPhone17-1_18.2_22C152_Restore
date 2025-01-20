@interface StateManagerMinimumFailureAge
@end

@implementation StateManagerMinimumFailureAge

void *GeoOfflineConfig_StateManagerMinimumFailureAge_Metadata_block_invoke_15()
{
  return &unk_1ED73E8F0;
}

uint64_t GeoOfflineConfig_StateManagerMinimumFailureAge_Metadata_block_invoke_16(uint64_t a1, void *a2)
{
  [a2 doubleValue];
  if (v2 < 0.0) {
    double v2 = 0.0;
  }
  if (v2 > 60.0) {
    double v2 = 60.0;
  }
  v3 = NSNumber;

  return [v3 numberWithDouble:v2];
}

@end