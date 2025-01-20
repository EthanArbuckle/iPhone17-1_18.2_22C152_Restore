@interface MapViewUpdateMaxDeltaToUseSpan
@end

@implementation MapViewUpdateMaxDeltaToUseSpan

void *GeoOfflineConfig_MapViewUpdateMaxDeltaToUseSpan_Metadata_block_invoke_80()
{
  return &unk_1ED73E8D8;
}

uint64_t GeoOfflineConfig_MapViewUpdateMaxDeltaToUseSpan_Metadata_block_invoke_81(uint64_t a1, void *a2)
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