@interface VNRegionOfInterestTilingOptions
- (VNRegionOfInterestTilingOptions)init;
- (double)regionOfInterestAspectRatioThreshold;
- (double)tileOverlapPercentage;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)tileOverflowCount;
- (void)setRegionOfInterestAspectRatioThreshold:(double)a3;
- (void)setTileOverflowCount:(int64_t)a3;
- (void)setTileOverlapPercentage:(double)a3;
@end

@implementation VNRegionOfInterestTilingOptions

- (void)setTileOverflowCount:(int64_t)a3
{
  self->_tileOverflowCount = a3;
}

- (int64_t)tileOverflowCount
{
  return self->_tileOverflowCount;
}

- (void)setRegionOfInterestAspectRatioThreshold:(double)a3
{
  self->_regionOfInterestAspectRatioThreshold = a3;
}

- (double)regionOfInterestAspectRatioThreshold
{
  return self->_regionOfInterestAspectRatioThreshold;
}

- (void)setTileOverlapPercentage:(double)a3
{
  self->_tileOverlapPercentage = a3;
}

- (double)tileOverlapPercentage
{
  return self->_tileOverlapPercentage;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init((Class)objc_opt_class());
  if (result)
  {
    *((void *)result + 1) = *(void *)&self->_tileOverlapPercentage;
    *((void *)result + 2) = *(void *)&self->_regionOfInterestAspectRatioThreshold;
    *((void *)result + 3) = self->_tileOverflowCount;
  }
  return result;
}

- (VNRegionOfInterestTilingOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)VNRegionOfInterestTilingOptions;
  id result = [(VNRegionOfInterestTilingOptions *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_tileOverlapPercentage = xmmword_1A410C3C0;
    result->_tileOverflowCount = 16;
  }
  return result;
}

@end