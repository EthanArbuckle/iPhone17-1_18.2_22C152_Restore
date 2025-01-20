@interface VNRegionOfInterestTile
- (CGRect)pixelCropRect;
- (VNRegionOfInterestTile)initWithTiling:(id)a3 pixelCropRect:(CGRect)a4;
- (id)description;
@end

@implementation VNRegionOfInterestTile

- (void).cxx_destruct
{
}

- (CGRect)pixelCropRect
{
  objc_copyStruct(v6, &self->_pixelCropRect, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)description
{
  id v3 = [NSString alloc];
  v12.receiver = self;
  v12.super_class = (Class)VNRegionOfInterestTile;
  double v4 = [(VNRegionOfInterestTile *)&v12 description];
  [(VNRegionOfInterestTile *)self pixelCropRect];
  v9 = VNHumanReadableCGRect(v5, v6, v7, v8);
  v10 = (void *)[v3 initWithFormat:@"%@ %@", v4, v9];

  return v10;
}

- (VNRegionOfInterestTile)initWithTiling:(id)a3 pixelCropRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VNRegionOfInterestTile;
  v10 = [(VNRegionOfInterestTile *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_tiling, v9);
    v11->_pixelCropRect.origin.CGFloat x = x;
    v11->_pixelCropRect.origin.CGFloat y = y;
    v11->_pixelCropRect.size.CGFloat width = width;
    v11->_pixelCropRect.size.CGFloat height = height;
  }

  return v11;
}

@end