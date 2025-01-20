@interface MapsAuthClientFeatureFlagsUpdateInterval
@end

@implementation MapsAuthClientFeatureFlagsUpdateInterval

void *GeoServicesConfig_MapsAuthClientFeatureFlagsUpdateInterval_Metadata_block_invoke_372()
{
  return &unk_1ED73F630;
}

uint64_t GeoServicesConfig_MapsAuthClientFeatureFlagsUpdateInterval_Metadata_block_invoke_373(uint64_t a1, void *a2)
{
  [a2 doubleValue];
  if (v2 < 1800.0) {
    double v2 = 1800.0;
  }
  if (v2 > 86400.0) {
    double v2 = 86400.0;
  }
  v3 = NSNumber;

  return [v3 numberWithDouble:v2];
}

@end