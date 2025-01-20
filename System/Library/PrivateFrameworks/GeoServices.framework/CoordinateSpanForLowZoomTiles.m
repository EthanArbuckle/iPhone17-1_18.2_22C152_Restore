@interface CoordinateSpanForLowZoomTiles
@end

@implementation CoordinateSpanForLowZoomTiles

void *GeoOfflineConfig_CoordinateSpanForLowZoomTiles_Metadata_block_invoke_34()
{
  return &unk_1ED73E980;
}

uint64_t GeoOfflineConfig_CoordinateSpanForLowZoomTiles_Metadata_block_invoke_35(uint64_t a1, void *a2)
{
  [a2 doubleValue];
  if (v2 < 1.0) {
    double v2 = 1.0;
  }
  if (v2 > 180.0) {
    double v2 = 180.0;
  }
  v3 = NSNumber;

  return [v3 numberWithDouble:v2];
}

@end