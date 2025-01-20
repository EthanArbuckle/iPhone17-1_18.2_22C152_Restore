@interface GAXGroupingView
- (BOOL)_accessibilityOnlyComparesByXAxis;
- (BOOL)shouldGroupAccessibilityChildren;
@end

@implementation GAXGroupingView

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  return 1;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

@end