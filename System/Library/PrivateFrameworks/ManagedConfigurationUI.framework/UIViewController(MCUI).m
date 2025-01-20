@interface UIViewController(MCUI)
+ (id)_MCUIUnwrapViewController:()MCUI;
- (BOOL)MCUIIsShowingProgress;
- (BOOL)MCUIIsVisibleViewController;
- (id)MCUITopViewController;
- (void)MCUIHideProgressInNavBarShowBackButton:()MCUI;
- (void)MCUIPresentViewController:()MCUI;
- (void)MCUIReturnToSender:()MCUI returnToAccountSettings:viewControllerDismissalBlock:;
- (void)MCUIShowProgressInNavBar;
@end

@implementation UIViewController(MCUI)

- (void)MCUIShowProgressInNavBar
{
  id v7 = [NSString MCMakeUUID];
  v2 = [MEMORY[0x1E4F29238] valueWithPointer:a1];
  v3 = viewControllerPointerToIdentifierMap();
  [v3 setObject:v7 forKeyedSubscript:v2];

  v4 = [MEMORY[0x1E4F92E58] sharedSpinnerManager];
  v5 = [a1 navigationItem];
  [v4 startAnimatingInNavItem:v5 forIdentifier:v7 hideBackButton:1];

  v6 = [a1 view];
  [v6 setUserInteractionEnabled:0];
}

- (void)MCUIHideProgressInNavBarShowBackButton:()MCUI
{
  id v11 = [MEMORY[0x1E4F29238] valueWithPointer:a1];
  v5 = viewControllerPointerToIdentifierMap();
  v6 = [v5 objectForKeyedSubscript:v11];

  if (v6)
  {
    id v7 = viewControllerPointerToIdentifierMap();
    [v7 removeObjectForKey:v11];

    v8 = [MEMORY[0x1E4F92E58] sharedSpinnerManager];
    [v8 stopAnimatingForIdentifier:v6];

    if (a3)
    {
      v9 = [a1 navigationItem];
      [v9 setHidesBackButton:0 animated:1];
    }
  }
  v10 = [a1 view];
  [v10 setUserInteractionEnabled:1];
}

- (BOOL)MCUIIsShowingProgress
{
  v1 = [MEMORY[0x1E4F29238] valueWithPointer:a1];
  v2 = viewControllerPointerToIdentifierMap();
  v3 = [v2 objectForKeyedSubscript:v1];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)MCUIIsVisibleViewController
{
  v2 = [a1 parentViewController];
  objc_opt_class();
  BOOL v4 = 0;
  if (objc_opt_isKindOfClass())
  {
    v3 = [v2 visibleViewController];

    if (v3 == a1) {
      BOOL v4 = 1;
    }
  }

  return v4;
}

- (id)MCUITopViewController
{
  v1 = [a1 view];
  v2 = [v1 window];
  v3 = [v2 rootViewController];
  BOOL v4 = +[UIViewController _MCUIUnwrapViewController:v3];

  return v4;
}

- (void)MCUIPresentViewController:()MCUI
{
  id v6 = a3;
  BOOL v4 = [a1 navigationController];

  if (v4)
  {
    v5 = [a1 navigationController];
    [v5 pushViewController:v6 animated:1];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [a1 pushViewController:v6 animated:1];
    }
    else {
      [a1 presentViewController:v6 animated:1 completion:0];
    }
  }
}

- (void)MCUIReturnToSender:()MCUI returnToAccountSettings:viewControllerDismissalBlock:
{
  id v6 = a5;
  id v7 = +[MCURLListenerListController originalURLSender];
  +[MCURLListenerListController setOriginalURLSender:0];
  if ([v7 length]
    && [v7 rangeOfString:@"com.apple.Preferences"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = [v7 isEqualToString:@"com.apple.springboard"];
    v6[2](v6, v8);
    if ((v8 & 1) == 0)
    {
      v9 = [MEMORY[0x1E4F629E0] serviceWithDefaultShellEndpoint];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __98__UIViewController_MCUI__MCUIReturnToSender_returnToAccountSettings_viewControllerDismissalBlock___block_invoke;
      v12[3] = &unk_1E6EADAF8;
      id v13 = v7;
      [v9 openApplication:v13 withOptions:0 completion:v12];

      goto LABEL_8;
    }
  }
  else
  {
    v6[2](v6, 1);
  }
  if (a4)
  {
    v10 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    id v11 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=ACCOUNT_SETTINGS"];
    [v10 openSensitiveURL:v11 withOptions:0];
  }
LABEL_8:
}

+ (id)_MCUIUnwrapViewController:()MCUI
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v3 visibleViewController], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v3 selectedViewController], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (void *)v4;
LABEL_8:
    id v7 = +[UIViewController _MCUIUnwrapViewController:v5];

    goto LABEL_9;
  }
  id v6 = [v3 presentedViewController];

  if (v6)
  {
    v5 = [v3 presentedViewController];
    goto LABEL_8;
  }
  id v7 = v3;
LABEL_9:

  return v7;
}

@end