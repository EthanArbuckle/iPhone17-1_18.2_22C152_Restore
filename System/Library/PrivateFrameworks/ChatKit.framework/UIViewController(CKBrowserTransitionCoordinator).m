@interface UIViewController(CKBrowserTransitionCoordinator)
- (id)__ck_topViewController;
@end

@implementation UIViewController(CKBrowserTransitionCoordinator)

- (id)__ck_topViewController
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v2 = [a1 visibleViewController];
LABEL_5:
    v4 = v2;
    objc_msgSend(v2, "__ck_topViewController");
    id v5 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  v3 = [a1 presentedViewController];

  if (v3)
  {
    v2 = [a1 presentedViewController];
    goto LABEL_5;
  }
  id v5 = a1;
LABEL_7:

  return v5;
}

@end