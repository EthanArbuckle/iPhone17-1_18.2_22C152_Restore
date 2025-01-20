@interface UIViewController(EventKitUI)
- (id)EKUI_viewHierarchy;
- (uint64_t)isPresentedInsidePopover;
@end

@implementation UIViewController(EventKitUI)

- (id)EKUI_viewHierarchy
{
  v2 = [a1 view];
  v3 = [v2 window];

  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    v5 = [a1 parentViewController];
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "EKUI_viewHierarchy");
    }
    else
    {
      v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      EKUIMultiwindowAssert(0, @"Unable to fetch current window (from %@). Assuming main window, which may cause layout errors because of incorrect assumptions about size class or orientation.", v9, v10, v11, v12, v13, v14, (uint64_t)v8);

      EKUIMainWindowForMultiwindowError();
    }
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (uint64_t)isPresentedInsidePopover
{
  id v1 = a1;
  if (!v1) {
    return 0;
  }
  v2 = v1;
  while (1)
  {
    uint64_t v3 = [v2 popoverPresentationController];
    if (v3)
    {
      id v4 = (void *)v3;
      v5 = [v2 popoverPresentationController];
      int v6 = [v5 _isAdapted];

      if (!v6) {
        break;
      }
    }
    uint64_t v7 = [v2 presentingViewController];

    v2 = (void *)v7;
    if (!v7) {
      goto LABEL_9;
    }
  }
  uint64_t v7 = 1;
LABEL_9:

  return v7;
}

@end