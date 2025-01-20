@interface UIViewController(HKAdditions)
- (id)hk_window;
- (uint64_t)_viewIsHidden:()HKAdditions;
- (uint64_t)hk_viewIsHidden;
- (void)hk_presentModalCardViewController:()HKAdditions fullScreen:animated:completion:;
@end

@implementation UIViewController(HKAdditions)

- (id)hk_window
{
  v2 = [a1 view];
  v3 = [v2 window];

  if (v3)
  {
    v4 = [a1 view];
    v5 = [v4 window];
  }
  else
  {
    v4 = [a1 parentViewController];
    if (v4) {
      [a1 parentViewController];
    }
    else {
    v6 = [a1 presentingViewController];
    }
    v5 = objc_msgSend(v6, "hk_window");
  }
  return v5;
}

- (uint64_t)hk_viewIsHidden
{
  v2 = [a1 view];
  uint64_t v3 = [a1 _viewIsHidden:v2];

  return v3;
}

- (uint64_t)_viewIsHidden:()HKAdditions
{
  id v4 = a3;
  if ([v4 isHidden])
  {
    uint64_t v5 = 1;
  }
  else
  {
    v6 = [v4 superview];

    if (v6)
    {
      v7 = [v4 superview];
      uint64_t v5 = [a1 _viewIsHidden:v7];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)hk_presentModalCardViewController:()HKAdditions fullScreen:animated:completion:
{
  id v9 = a6;
  id v10 = a3;
  [v10 setModalTransitionStyle:0];
  if (a4)
  {
    [v10 setModalPresentationStyle:2];
    objc_msgSend(v10, "setPreferredContentSize:", 10000.0, 10000.0);
  }
  else
  {
    [v10 setModalPresentationStyle:1];
  }
  [a1 presentViewController:v10 animated:1 completion:v9];
}

@end