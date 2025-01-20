@interface ViewPortContainmentForAutoSwitchToOnline
@end

@implementation ViewPortContainmentForAutoSwitchToOnline

void *GeoOfflineConfig_ViewPortContainmentForAutoSwitchToOnline_Metadata_block_invoke_32()
{
  return &unk_1ED73F670;
}

uint64_t GeoOfflineConfig_ViewPortContainmentForAutoSwitchToOnline_Metadata_block_invoke_33(uint64_t a1, void *a2)
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