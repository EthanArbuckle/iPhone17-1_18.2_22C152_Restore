@interface UIViewController(ABPresentation)
- (BOOL)_ab_isInPopoverRecursive:()ABPresentation;
- (BOOL)ab_shouldUseTransparentBackgroundInPopovers;
- (id)cnui_appropriatePresentationController;
- (uint64_t)ab_isDirectlyInPopover;
- (uint64_t)ab_isInPopover;
- (uint64_t)ab_isInSheet;
- (uint64_t)ab_shouldShowNavBarButtons;
- (void)cnui_addChildViewController:()ABPresentation;
@end

@implementation UIViewController(ABPresentation)

- (id)cnui_appropriatePresentationController
{
  id v1 = a1;
  v2 = [v1 parentViewController];

  if (v2)
  {
    do
    {
      v3 = [v1 parentViewController];

      v4 = [v3 parentViewController];

      id v1 = v3;
    }
    while (v4);
  }
  else
  {
    v3 = v1;
  }
  v5 = [v3 presentationController];

  return v5;
}

- (void)cnui_addChildViewController:()ABPresentation
{
  id v6 = a3;
  [a1 addChildViewController:v6];
  v4 = [a1 view];
  v5 = [v6 view];
  [v4 bounds];
  objc_msgSend(v5, "setFrame:");
  [v5 setAutoresizingMask:18];
  if (([a1 shouldAutomaticallyForwardAppearanceMethods] & 1) == 0) {
    [v6 beginAppearanceTransition:1 animated:0];
  }
  [v4 addSubview:v5];
  [v6 didMoveToParentViewController:a1];
  if (([a1 shouldAutomaticallyForwardAppearanceMethods] & 1) == 0) {
    [v6 endAppearanceTransition];
  }
}

- (uint64_t)ab_isInSheet
{
  uint64_t result = dyld_program_sdk_at_least();
  if (result)
  {
    uint64_t result = [a1 _existingPresentationControllerImmediate:0 effective:1];
    if (result)
    {
      v3 = (void *)result;
      while ([v3 presentationStyle] != 2 && objc_msgSend(v3, "presentationStyle") != 1)
      {
        v4 = [v3 presentingViewController];
        uint64_t v5 = [v4 _existingPresentationControllerImmediate:0 effective:1];

        v3 = (void *)v5;
        if (!v5) {
          return 0;
        }
      }

      return 1;
    }
  }
  return result;
}

- (uint64_t)ab_isDirectlyInPopover
{
  return objc_msgSend(a1, "_ab_isInPopoverRecursive:", 0);
}

- (uint64_t)ab_isInPopover
{
  return objc_msgSend(a1, "_ab_isInPopoverRecursive:", 1);
}

- (BOOL)_ab_isInPopoverRecursive:()ABPresentation
{
  if (dyld_program_sdk_at_least())
  {
    uint64_t v5 = [a1 _existingPresentationControllerImmediate:0 effective:1];
    if (!v5) {
      return 0;
    }
    id v6 = (void *)v5;
    int v7 = a3 ^ 1;
    while (1)
    {
      objc_opt_class();
      int isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass | v7)) {
        break;
      }
      v9 = [v6 presentingViewController];
      uint64_t v10 = [v9 _existingPresentationControllerImmediate:0 effective:1];

      id v6 = (void *)v10;
      if (!v10) {
        return 0;
      }
    }
    char v15 = isKindOfClass;

    return (v15 & 1) != 0;
  }
  v11 = [a1 _popoverController];
  v12 = v11;
  if (!v11 || (a3 & 1) != 0)
  {

    return v12 != 0;
  }
  v13 = [v11 contentViewController];
  BOOL v14 = v13 == a1;

  return v14;
}

- (BOOL)ab_shouldUseTransparentBackgroundInPopovers
{
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) != 1 || !objc_msgSend(a1, "ab_isInPopover")) {
    return 0;
  }
  v4 = [a1 presentingViewController];
  BOOL v5 = v4 == 0;

  return v5;
}

- (uint64_t)ab_shouldShowNavBarButtons
{
  if (!objc_msgSend(a1, "ab_isInPopover")) {
    return 1;
  }
  v2 = [a1 presentingViewController];
  if (v2) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = [(id)*MEMORY[0x1E4FB2608] applicationState] == 2;
  }

  return v3;
}

@end