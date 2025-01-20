@interface UIViewController(HUPreloadingModalPresentation)
- (id)hu_presentPreloadableViewController:()HUPreloadingModalPresentation animated:;
@end

@implementation UIViewController(HUPreloadingModalPresentation)

- (id)hu_presentPreloadableViewController:()HUPreloadingModalPresentation animated:
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __96__UIViewController_HUPreloadingModalPresentation__hu_presentPreloadableViewController_animated___block_invoke;
  v10[3] = &unk_1E6385DE0;
  v10[4] = a1;
  id v11 = v6;
  char v12 = a4;
  id v7 = v6;
  v8 = _HUPreloadViewController(v7, 0, v10);

  return v8;
}

@end