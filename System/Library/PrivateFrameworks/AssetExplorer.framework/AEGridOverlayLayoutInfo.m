@interface AEGridOverlayLayoutInfo
- (AEGridOverlayLayoutInfo)initWithGradientImageSize:(CGSize)a3;
- (CGSize)_gradientImageSize;
- (CGSize)tileSystemLayoutSizeFittingSize:(CGSize)a3;
@end

@implementation AEGridOverlayLayoutInfo

- (CGSize)_gradientImageSize
{
  double width = self->__gradientImageSize.width;
  double height = self->__gradientImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)tileSystemLayoutSizeFittingSize:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  [(AEGridOverlayLayoutInfo *)self _gradientImageSize];
  if (v5 >= height) {
    double v5 = height;
  }
  double v6 = width;
  result.double height = v5;
  result.CGFloat width = v6;
  return result;
}

- (AEGridOverlayLayoutInfo)initWithGradientImageSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)AEGridOverlayLayoutInfo;
  CGSize result = [(AEGridOverlayLayoutInfo *)&v6 init];
  if (result)
  {
    result->__gradientImageSize.CGFloat width = width;
    result->__gradientImageSize.CGFloat height = height;
  }
  return result;
}

@end