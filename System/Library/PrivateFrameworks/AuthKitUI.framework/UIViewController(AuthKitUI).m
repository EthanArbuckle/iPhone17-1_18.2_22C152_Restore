@interface UIViewController(AuthKitUI)
- (id)ak_topPresentedViewController;
@end

@implementation UIViewController(AuthKitUI)

- (id)ak_topPresentedViewController
{
  id v1 = a1;
  uint64_t v2 = [v1 presentedViewController];
  if (v2)
  {
    v3 = (void *)v2;
    while (1)
    {
      v4 = [v1 presentedViewController];
      char v5 = [v4 isBeingDismissed];

      if (v5) {
        break;
      }
      v6 = [v1 presentedViewController];

      v3 = [v6 presentedViewController];
      id v1 = v6;
      if (!v3) {
        goto LABEL_7;
      }
    }
  }
  v6 = v1;
LABEL_7:

  return v6;
}

@end