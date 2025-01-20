@interface UIWebView(NUIContainerView)
- (uint64_t)isLayoutSizeDependentOnPerpendicularAxis;
@end

@implementation UIWebView(NUIContainerView)

- (uint64_t)isLayoutSizeDependentOnPerpendicularAxis
{
  return 1;
}

@end