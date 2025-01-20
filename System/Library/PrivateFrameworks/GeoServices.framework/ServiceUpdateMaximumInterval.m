@interface ServiceUpdateMaximumInterval
@end

@implementation ServiceUpdateMaximumInterval

uint64_t GeoOfflineConfig_ServiceUpdateMaximumInterval_Metadata_block_invoke_70(uint64_t a1, void *a2)
{
  [a2 doubleValue];
  if (v2 < 0.2) {
    double v2 = 0.2;
  }
  if (v2 > 10.0) {
    double v2 = 10.0;
  }
  v3 = NSNumber;

  return [v3 numberWithDouble:v2];
}

void *GeoOfflineConfig_ServiceUpdateMaximumInterval_Metadata_block_invoke_69()
{
  return &unk_1ED73E8A8;
}

@end