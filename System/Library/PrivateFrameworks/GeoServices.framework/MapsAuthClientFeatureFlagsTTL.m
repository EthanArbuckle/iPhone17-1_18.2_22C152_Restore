@interface MapsAuthClientFeatureFlagsTTL
@end

@implementation MapsAuthClientFeatureFlagsTTL

void *GeoServicesConfig_MapsAuthClientFeatureFlagsTTL_Metadata_block_invoke_370()
{
  return &unk_1ED73F620;
}

uint64_t GeoServicesConfig_MapsAuthClientFeatureFlagsTTL_Metadata_block_invoke_371(uint64_t a1, void *a2)
{
  [a2 doubleValue];
  if (v2 < 3600.0) {
    double v2 = 3600.0;
  }
  if (v2 > 172800.0) {
    double v2 = 172800.0;
  }
  v3 = NSNumber;

  return [v3 numberWithDouble:v2];
}

@end