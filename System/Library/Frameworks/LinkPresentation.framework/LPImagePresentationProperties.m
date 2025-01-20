@interface LPImagePresentationProperties
- (BOOL)canAdjustHorizontalPaddingForFixedSize;
- (BOOL)requireFixedSize;
- (BOOL)shouldApplyBackground;
- (CGSize)fixedSize;
- (LPImagePresentationProperties)init;
- (UIColor)backgroundColor;
- (UIColor)maskColor;
- (int64_t)filter;
- (int64_t)scalingMode;
- (int64_t)verticalAlignment;
- (void)setBackgroundColor:(id)a3;
- (void)setCanAdjustHorizontalPaddingForFixedSize:(BOOL)a3;
- (void)setFilter:(int64_t)a3;
- (void)setFixedSize:(CGSize)a3;
- (void)setMaskColor:(id)a3;
- (void)setRequireFixedSize:(BOOL)a3;
- (void)setScalingMode:(int64_t)a3;
- (void)setShouldApplyBackground:(BOOL)a3;
- (void)setVerticalAlignment:(int64_t)a3;
@end

@implementation LPImagePresentationProperties

- (LPImagePresentationProperties)init
{
  v6.receiver = self;
  v6.super_class = (Class)LPImagePresentationProperties;
  v2 = [(LPImagePresentationProperties *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_shouldApplyBackground = 0;
    v2->_filter = 0;
    v2->_scalingMode = 0;
    v4 = v2;
  }

  return v3;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (int64_t)filter
{
  return self->_filter;
}

- (void)setFilter:(int64_t)a3
{
  self->_filter = a3;
}

- (int64_t)scalingMode
{
  return self->_scalingMode;
}

- (void)setScalingMode:(int64_t)a3
{
  self->_scalingMode = a3;
}

- (BOOL)shouldApplyBackground
{
  return self->_shouldApplyBackground;
}

- (void)setShouldApplyBackground:(BOOL)a3
{
  self->_shouldApplyBackground = a3;
}

- (BOOL)requireFixedSize
{
  return self->_requireFixedSize;
}

- (void)setRequireFixedSize:(BOOL)a3
{
  self->_requireFixedSize = a3;
}

- (UIColor)maskColor
{
  return self->_maskColor;
}

- (void)setMaskColor:(id)a3
{
}

- (int64_t)verticalAlignment
{
  return self->_verticalAlignment;
}

- (void)setVerticalAlignment:(int64_t)a3
{
  self->_verticalAlignment = a3;
}

- (BOOL)canAdjustHorizontalPaddingForFixedSize
{
  return self->_canAdjustHorizontalPaddingForFixedSize;
}

- (void)setCanAdjustHorizontalPaddingForFixedSize:(BOOL)a3
{
  self->_canAdjustHorizontalPaddingForFixedSize = a3;
}

- (CGSize)fixedSize
{
  double width = self->_fixedSize.width;
  double height = self->_fixedSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setFixedSize:(CGSize)a3
{
  self->_fixedSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskColor, 0);

  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end