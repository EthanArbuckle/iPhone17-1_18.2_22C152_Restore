@interface ViewPortCoverageForAutoSwitchToOfflineWithGrid
@end

@implementation ViewPortCoverageForAutoSwitchToOfflineWithGrid

void *GeoOfflineConfig_ViewPortCoverageForAutoSwitchToOfflineWithGrid_Metadata_block_invoke_24()
{
  return &unk_1ED73F660;
}

uint64_t GeoOfflineConfig_ViewPortCoverageForAutoSwitchToOfflineWithGrid_Metadata_block_invoke_25(uint64_t a1, void *a2)
{
  [a2 doubleValue];
  if (v2 < 0.0) {
    double v2 = 0.0;
  }
  if (v2 > 1.0) {
    double v2 = 1.0;
  }
  v3 = NSNumber;

  return [v3 numberWithDouble:v2];
}

@end