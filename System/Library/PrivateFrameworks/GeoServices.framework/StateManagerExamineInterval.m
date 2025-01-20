@interface StateManagerExamineInterval
@end

@implementation StateManagerExamineInterval

void *GeoOfflineConfig_StateManagerExamineInterval_Metadata_block_invoke_11()
{
  return &unk_1ED73E920;
}

uint64_t GeoOfflineConfig_StateManagerExamineInterval_Metadata_block_invoke_12(uint64_t a1, void *a2)
{
  [a2 doubleValue];
  if (v2 < 0.2) {
    double v2 = 0.2;
  }
  if (v2 > 600.0) {
    double v2 = 600.0;
  }
  v3 = NSNumber;

  return [v3 numberWithDouble:v2];
}

@end