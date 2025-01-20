@interface ViewPortContainmentForAutoSwitchToOfflineWithGrid
@end

@implementation ViewPortContainmentForAutoSwitchToOfflineWithGrid

void *GeoOfflineConfig_ViewPortContainmentForAutoSwitchToOfflineWithGrid_Metadata_block_invoke_30()
{
  return &unk_1ED73F660;
}

uint64_t GeoOfflineConfig_ViewPortContainmentForAutoSwitchToOfflineWithGrid_Metadata_block_invoke_31(uint64_t a1, void *a2)
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