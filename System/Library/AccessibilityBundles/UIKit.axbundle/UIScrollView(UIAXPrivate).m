@interface UIScrollView(UIAXPrivate)
- (double)_accessibilityContentSize;
@end

@implementation UIScrollView(UIAXPrivate)

- (double)_accessibilityContentSize
{
  id v3 = (id)[a1 safeValueForKey:@"_contentSize"];
  [v3 sizeValue];
  double v4 = v1;

  return v4;
}

@end