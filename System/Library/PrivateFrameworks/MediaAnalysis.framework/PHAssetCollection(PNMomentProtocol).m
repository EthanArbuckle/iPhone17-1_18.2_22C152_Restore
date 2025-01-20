@interface PHAssetCollection(PNMomentProtocol)
- (BOOL)isCoarse;
- (double)approximateCoordinate;
@end

@implementation PHAssetCollection(PNMomentProtocol)

- (double)approximateCoordinate
{
  v1 = [a1 approximateLocation];
  [v1 coordinate];
  double v3 = v2;

  return v3;
}

- (BOOL)isCoarse
{
  [a1 gpsHorizontalAccuracy];
  return v1 >= *MEMORY[0x1E4F8B7E8];
}

@end