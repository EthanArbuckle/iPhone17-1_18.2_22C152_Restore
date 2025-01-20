@interface StateManagerUpdateInterval
@end

@implementation StateManagerUpdateInterval

void *GeoOfflineConfig_StateManagerUpdateInterval_Metadata_block_invoke_13()
{
  return &unk_1ED73E8A8;
}

uint64_t GeoOfflineConfig_StateManagerUpdateInterval_Metadata_block_invoke_14(uint64_t a1, void *a2)
{
  [a2 doubleValue];
  if (v2 < 1.0) {
    double v2 = 1.0;
  }
  if (v2 > 600.0) {
    double v2 = 600.0;
  }
  v3 = NSNumber;

  return [v3 numberWithDouble:v2];
}

@end