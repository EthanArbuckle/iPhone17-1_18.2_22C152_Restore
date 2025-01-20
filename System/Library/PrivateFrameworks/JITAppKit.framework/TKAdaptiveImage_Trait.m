@interface TKAdaptiveImage_Trait
- (BOOL)compatibleWithTrait:(id)a3;
- (BOOL)useReadableWidth;
- (CGRect)crop;
- (CGSize)maxSize;
- (CGSize)minSize;
- (CGSize)relativeSize;
- (CGSize)size;
- (NSURL)url;
- (TKAdaptiveImage_Trait)init;
- (double)quality;
- (int64_t)horizontalSizeClass;
- (int64_t)verticalSizeClass;
- (void)setCrop:(CGRect)a3;
- (void)setHorizontalSizeClass:(int64_t)a3;
- (void)setMaxSize:(CGSize)a3;
- (void)setMinSize:(CGSize)a3;
- (void)setQuality:(double)a3;
- (void)setRelativeSize:(CGSize)a3;
- (void)setSize:(CGSize)a3;
- (void)setUrl:(id)a3;
- (void)setUseReadableWidth:(BOOL)a3;
- (void)setVerticalSizeClass:(int64_t)a3;
@end

@implementation TKAdaptiveImage_Trait

- (TKAdaptiveImage_Trait)init
{
  SEL v6 = a2;
  v7 = 0;
  v5.receiver = self;
  v5.super_class = (Class)TKAdaptiveImage_Trait;
  v7 = [(TKAdaptiveImage_Trait *)&v5 init];
  objc_storeStrong((id *)&v7, v7);
  if (v7)
  {
    v7->_horizontalSizeClass = 0;
    v7->_verticalSizeClass = 0;
    v7->_useReadableWidth = 1;
    v2 = v7;
    v7->_crop.origin = (CGPoint)TKAdaptiveImageFullCrop;
    v2->_crop.size = (CGSize)xmmword_22912E3E0;
  }
  v4 = v7;
  objc_storeStrong((id *)&v7, 0);
  return v4;
}

- (void)setQuality:(double)a3
{
  double v3 = a3;
  if (a3 > 1.0 || a3 <= 0.0) {
    double v3 = 0.850000024;
  }
  self->_quality = v3;
}

- (void)setCrop:(CGRect)a3
{
  CGRect v3 = a3;
  if (a3.origin.x < 0.0 || a3.origin.x >= 1.0) {
    v3.origin.x = 0.0;
  }
  if (a3.origin.y < 0.0 || a3.origin.y >= 1.0) {
    v3.origin.y = 0.0;
  }
  if (a3.size.width <= 0.0 || a3.size.width > 1.0) {
    v3.size.width = 1.0;
  }
  if (a3.size.height <= 0.0 || a3.size.height > 1.0) {
    v3.size.height = 1.0;
  }
  self->_crop = v3;
}

- (BOOL)compatibleWithTrait:(id)a3
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  url = v14->_url;
  id v10 = (id)[location[0] url];
  BOOL v11 = 0;
  if (-[NSURL isEqual:](url, "isEqual:"))
  {
    v8 = v14;
    [location[0] crop];
    rect2.origin.x = v3;
    rect2.origin.y = v4;
    rect2.size.width = v5;
    rect2.size.height = v6;
    BOOL v11 = CGRectEqualToRect(v8->_crop, rect2);
  }

  objc_storeStrong(location, 0);
  return v11;
}

- (int64_t)horizontalSizeClass
{
  return self->_horizontalSizeClass;
}

- (void)setHorizontalSizeClass:(int64_t)a3
{
  self->_horizontalSizeClass = a3;
}

- (int64_t)verticalSizeClass
{
  return self->_verticalSizeClass;
}

- (void)setVerticalSizeClass:(int64_t)a3
{
  self->_verticalSizeClass = a3;
}

- (BOOL)useReadableWidth
{
  return self->_useReadableWidth;
}

- (void)setUseReadableWidth:(BOOL)a3
{
  self->_useReadableWidth = a3;
}

- (CGSize)size
{
  double height = self->_size.height;
  double width = self->_size.width;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (CGSize)relativeSize
{
  double height = self->_relativeSize.height;
  double width = self->_relativeSize.width;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setRelativeSize:(CGSize)a3
{
  self->_relativeSize = a3;
}

- (CGRect)crop
{
  double y = self->_crop.origin.y;
  double x = self->_crop.origin.x;
  double height = self->_crop.size.height;
  double width = self->_crop.size.width;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGSize)minSize
{
  double height = self->_minSize.height;
  double width = self->_minSize.width;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMinSize:(CGSize)a3
{
  self->_minSize = a3;
}

- (CGSize)maxSize
{
  double height = self->_maxSize.height;
  double width = self->_maxSize.width;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMaxSize:(CGSize)a3
{
  self->_maxSize = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (double)quality
{
  return self->_quality;
}

- (void).cxx_destruct
{
}

@end