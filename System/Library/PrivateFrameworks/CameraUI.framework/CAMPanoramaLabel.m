@interface CAMPanoramaLabel
- (UIEdgeInsets)_textInsets;
- (double)_backgroundAlpha;
@end

@implementation CAMPanoramaLabel

- (UIEdgeInsets)_textInsets
{
  double v2 = CAMPixelWidthForView(self);
  double v3 = v2 * 2.0 + 2.0;
  double v4 = 11.0;
  double v5 = 10.0;
  double v6 = v2 + 2.0;
  result.right = v5;
  result.bottom = v3;
  result.left = v4;
  result.top = v6;
  return result;
}

- (double)_backgroundAlpha
{
  return 0.3;
}

@end