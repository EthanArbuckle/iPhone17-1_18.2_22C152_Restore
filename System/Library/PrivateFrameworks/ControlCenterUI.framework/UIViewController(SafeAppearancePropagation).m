@interface UIViewController(SafeAppearancePropagation)
- (id)_ccui_childViewControllersForAppearancePropagation;
- (uint64_t)ccui_safelyBeginAppearanceTransition:()SafeAppearancePropagation animated:;
- (uint64_t)ccui_safelyEndAppearanceTransition;
- (uint64_t)ccui_shouldPropagateAppearanceCalls;
- (void)ccui_safelyBeginAppearanceTransitionForChildViewControllers:()SafeAppearancePropagation animated:;
- (void)ccui_safelyEndAppearanceTransitionForChildViewControllers;
@end

@implementation UIViewController(SafeAppearancePropagation)

- (uint64_t)ccui_shouldPropagateAppearanceCalls
{
  return 0;
}

- (uint64_t)ccui_safelyBeginAppearanceTransition:()SafeAppearancePropagation animated:
{
  objc_msgSend(a1, "bs_beginAppearanceTransition:animated:");
  uint64_t result = objc_msgSend(a1, "ccui_shouldPropagateAppearanceCalls");
  if (result)
  {
    return objc_msgSend(a1, "ccui_safelyBeginAppearanceTransitionForChildViewControllers:animated:", a3, a4);
  }
  return result;
}

- (uint64_t)ccui_safelyEndAppearanceTransition
{
  objc_msgSend(a1, "bs_endAppearanceTransition");
  uint64_t result = objc_msgSend(a1, "ccui_shouldPropagateAppearanceCalls");
  if (result)
  {
    return objc_msgSend(a1, "ccui_safelyEndAppearanceTransitionForChildViewControllers");
  }
  return result;
}

- (void)ccui_safelyBeginAppearanceTransitionForChildViewControllers:()SafeAppearancePropagation animated:
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v6 = objc_msgSend(a1, "_ccui_childViewControllersForAppearancePropagation");
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "ccui_safelyBeginAppearanceTransition:animated:", a3, a4);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)ccui_safelyEndAppearanceTransitionForChildViewControllers
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v1 = objc_msgSend(a1, "_ccui_childViewControllersForAppearancePropagation");
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5++), "ccui_safelyEndAppearanceTransition");
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (id)_ccui_childViewControllersForAppearancePropagation
{
  if (objc_opt_respondsToSelector()) {
    [a1 childViewControllersForAppearancePropagation];
  }
  else {
  uint64_t v2 = [a1 childViewControllers];
  }

  return v2;
}

@end