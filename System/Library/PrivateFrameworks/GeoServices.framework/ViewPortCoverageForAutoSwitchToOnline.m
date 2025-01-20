@interface ViewPortCoverageForAutoSwitchToOnline
@end

@implementation ViewPortCoverageForAutoSwitchToOnline

void *GeoOfflineConfig_ViewPortCoverageForAutoSwitchToOnline_Metadata_block_invoke_26()
{
  return &unk_1ED73F670;
}

uint64_t GeoOfflineConfig_ViewPortCoverageForAutoSwitchToOnline_Metadata_block_invoke_27(uint64_t a1, void *a2)
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