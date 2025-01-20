@interface UINavigationController(HUPreloadingNavigationPresentation)
- (id)hu_preloadContent;
- (id)hu_pushPreloadableViewController:()HUPreloadingNavigationPresentation animated:;
- (id)hu_pushPreloadableViewController:()HUPreloadingNavigationPresentation animated:waitForPreload:;
@end

@implementation UINavigationController(HUPreloadingNavigationPresentation)

- (id)hu_pushPreloadableViewController:()HUPreloadingNavigationPresentation animated:
{
  id v6 = a3;
  if ([v6 conformsToProtocol:&unk_1F19C09F0]) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;
  if (objc_opt_respondsToSelector()) {
    uint64_t v9 = [v8 needsToWaitForPreload];
  }
  else {
    uint64_t v9 = 0;
  }
  v10 = objc_msgSend(a1, "hu_pushPreloadableViewController:animated:waitForPreload:", v6, a4, v9);

  return v10;
}

- (id)hu_pushPreloadableViewController:()HUPreloadingNavigationPresentation animated:waitForPreload:
{
  id v8 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __119__UINavigationController_HUPreloadingNavigationPresentation__hu_pushPreloadableViewController_animated_waitForPreload___block_invoke;
  v12[3] = &unk_1E6385DE0;
  v12[4] = a1;
  id v13 = v8;
  char v14 = a4;
  id v9 = v8;
  v10 = _HUPreloadViewController(v9, a5, v12);

  return v10;
}

- (id)hu_preloadContent
{
  v2 = [a1 topViewController];
  int v3 = [v2 conformsToProtocol:&unk_1F19C09F0];

  if (v3)
  {
    v4 = [a1 topViewController];
    v5 = objc_msgSend(v4, "hu_preloadContent");
  }
  else
  {
    v5 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v5;
}

@end