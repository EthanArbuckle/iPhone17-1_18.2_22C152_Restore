@interface UIView(GKDetachedContentViewSupport)
- (void)_gkSetNeedsRender;
@end

@implementation UIView(GKDetachedContentViewSupport)

- (void)_gkSetNeedsRender
{
  id v4 = a1;
  objc_opt_class();
  id v1 = v4;
  if (v4)
  {
    while (1)
    {
      id v5 = v1;
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v2 = [v5 superview];

      id v1 = (id)v2;
      if (!v2) {
        return;
      }
    }
    v3 = [v5 renderView];
    [v3 setNeedsDisplay];
  }
}

@end