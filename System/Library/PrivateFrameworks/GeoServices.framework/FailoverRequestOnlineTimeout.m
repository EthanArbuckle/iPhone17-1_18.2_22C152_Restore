@interface FailoverRequestOnlineTimeout
@end

@implementation FailoverRequestOnlineTimeout

void *GeoOfflineConfig_FailoverRequestOnlineTimeout_Metadata_block_invoke_51()
{
  return &unk_1ED73E8D8;
}

uint64_t GeoOfflineConfig_FailoverRequestOnlineTimeout_Metadata_block_invoke_52(uint64_t a1, void *a2)
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