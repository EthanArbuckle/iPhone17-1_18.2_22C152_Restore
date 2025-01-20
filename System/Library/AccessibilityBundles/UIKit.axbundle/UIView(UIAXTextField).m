@interface UIView(UIAXTextField)
- (double)_accessibilityFontSize;
@end

@implementation UIView(UIAXTextField)

- (double)_accessibilityFontSize
{
  id v3 = (id)[a1 font];
  [v3 pointSize];
  double v4 = v1;

  return v4;
}

@end