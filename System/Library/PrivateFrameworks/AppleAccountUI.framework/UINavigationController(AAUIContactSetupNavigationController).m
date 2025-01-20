@interface UINavigationController(AAUIContactSetupNavigationController)
- (id)_aaui_activityIndicatorView;
- (id)_aaui_currentRightBarButtonItems;
- (uint64_t)aaui_hideActivityIndicator;
- (void)_aaui_setActivityIndicatorView:()AAUIContactSetupNavigationController;
- (void)_aaui_setCurrentRightBarButtonItems:()AAUIContactSetupNavigationController;
- (void)aaui_showActivityIndicator;
@end

@implementation UINavigationController(AAUIContactSetupNavigationController)

- (void)aaui_showActivityIndicator
{
  v2 = objc_msgSend(a1, "_aaui_activityIndicatorView");

  if (!v2)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
    objc_msgSend(a1, "_aaui_setActivityIndicatorView:", v3);

    v4 = objc_msgSend(a1, "_aaui_activityIndicatorView");
    [v4 setHidesWhenStopped:1];
  }
  v5 = objc_msgSend(a1, "_aaui_activityIndicatorView");
  [v5 startAnimating];

  id v6 = objc_alloc(MEMORY[0x263F824A8]);
  v7 = objc_msgSend(a1, "_aaui_activityIndicatorView");
  id v13 = (id)[v6 initWithCustomView:v7];

  v8 = [a1 topViewController];
  v9 = [v8 navigationItem];
  v10 = [v9 rightBarButtonItems];
  objc_msgSend(a1, "_aaui_setCurrentRightBarButtonItems:", v10);

  v11 = [a1 topViewController];
  v12 = [v11 navigationItem];
  [v12 setRightBarButtonItem:v13];
}

- (uint64_t)aaui_hideActivityIndicator
{
  v2 = objc_msgSend(a1, "_aaui_activityIndicatorView");
  [v2 stopAnimating];

  v3 = objc_msgSend(a1, "_aaui_currentRightBarButtonItems");

  if (v3)
  {
    v4 = [a1 topViewController];
    v5 = [v4 navigationItem];
    id v6 = objc_msgSend(a1, "_aaui_currentRightBarButtonItems");
    [v5 setRightBarButtonItems:v6];
  }
  return objc_msgSend(a1, "_aaui_setCurrentRightBarButtonItems:", 0);
}

- (id)_aaui_activityIndicatorView
{
  return objc_getAssociatedObject(a1, sel__aaui_activityIndicatorView);
}

- (void)_aaui_setActivityIndicatorView:()AAUIContactSetupNavigationController
{
}

- (id)_aaui_currentRightBarButtonItems
{
  return objc_getAssociatedObject(a1, sel__aaui_currentRightBarButtonItems);
}

- (void)_aaui_setCurrentRightBarButtonItems:()AAUIContactSetupNavigationController
{
}

@end