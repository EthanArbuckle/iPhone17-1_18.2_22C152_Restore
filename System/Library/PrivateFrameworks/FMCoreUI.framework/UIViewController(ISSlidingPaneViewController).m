@interface UIViewController(ISSlidingPaneViewController)
- (id)slidingPaneViewController;
@end

@implementation UIViewController(ISSlidingPaneViewController)

- (id)slidingPaneViewController
{
  id v1 = a1;
  if (v1)
  {
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v2 = [v1 parentViewController];

      id v1 = (id)v2;
      if (!v2) {
        goto LABEL_6;
      }
    }
    id v1 = v1;
  }
LABEL_6:

  return v1;
}

@end