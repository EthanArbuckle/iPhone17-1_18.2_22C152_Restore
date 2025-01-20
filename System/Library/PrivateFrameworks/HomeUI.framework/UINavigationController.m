@interface UINavigationController
@end

@implementation UINavigationController

void __119__UINavigationController_HUPreloadingNavigationPresentation__hu_pushPreloadableViewController_animated_waitForPreload___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) pushViewController:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
  v4 = [*(id *)(a1 + 32) transitionCoordinator];
  if (v4)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __119__UINavigationController_HUPreloadingNavigationPresentation__hu_pushPreloadableViewController_animated_waitForPreload___block_invoke_3;
    v5[3] = &unk_1E6387368;
    id v6 = v3;
    id v7 = *(id *)(a1 + 40);
    [v4 animateAlongsideTransition:0 completion:v5];
  }
  else
  {
    [v3 finishWithResult:*(void *)(a1 + 40)];
  }
}

id __119__UINavigationController_HUPreloadingNavigationPresentation__hu_pushPreloadableViewController_animated_waitForPreload___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F7A0D8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __119__UINavigationController_HUPreloadingNavigationPresentation__hu_pushPreloadableViewController_animated_waitForPreload___block_invoke_2;
  v6[3] = &unk_1E63864C8;
  id v3 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  char v8 = *(unsigned char *)(a1 + 48);
  v4 = [v2 futureWithBlock:v6];

  return v4;
}

void __119__UINavigationController_HUPreloadingNavigationPresentation__hu_pushPreloadableViewController_animated_waitForPreload___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) finishWithResult:*(void *)(a1 + 40)];
  id v3 = [*(id *)(a1 + 40) presentingViewController];
  v2 = [v3 view];
  [v2 setNeedsLayout];
}

BOOL __75__UINavigationController_HUModalPresentation__finishPresentation_animated___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if (!v2) {
    return 0;
  }
  id v3 = v2;
  do
  {
    v4 = [*(id *)(a1 + 40) presentedViewController];

    BOOL v5 = v3 == v4;
    BOOL v6 = v3 == v4;
    if (v5) {
      break;
    }
    uint64_t v7 = [v3 parentViewController];

    id v3 = (void *)v7;
  }
  while (v7);

  return v6;
}

@end