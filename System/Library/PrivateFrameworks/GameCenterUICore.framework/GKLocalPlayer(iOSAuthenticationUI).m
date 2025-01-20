@interface GKLocalPlayer(iOSAuthenticationUI)
- (id)activeViewController;
- (id)rootViewController;
- (id)signInViewController;
- (void)removeActiveViewControllerAnimated:()iOSAuthenticationUI completionHandler:;
- (void)setActiveViewController:()iOSAuthenticationUI;
- (void)setRootViewController:()iOSAuthenticationUI;
- (void)setSignInViewController:()iOSAuthenticationUI;
- (void)showViewController:()iOSAuthenticationUI usingPresentingViewController:wrapInNavController:;
@end

@implementation GKLocalPlayer(iOSAuthenticationUI)

- (id)activeViewController
{
  return (id)sActiveViewController;
}

- (void)setActiveViewController:()iOSAuthenticationUI
{
}

- (id)rootViewController
{
  return (id)sRootViewController;
}

- (void)setRootViewController:()iOSAuthenticationUI
{
}

- (id)signInViewController
{
  return (id)sSignInViewController;
}

- (void)setSignInViewController:()iOSAuthenticationUI
{
}

- (void)showViewController:()iOSAuthenticationUI usingPresentingViewController:wrapInNavController:
{
  id v8 = a3;
  id v9 = a4;
  if (a5)
  {
    v10 = (void *)[objc_alloc(MEMORY[0x263F1C7F8]) initWithRootViewController:v8];
    v11 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v12 = [v11 userInterfaceIdiom];

    if (v12 == 1)
    {
      if (*MEMORY[0x263F402F8]) {
        BOOL v13 = _GKIsRemoteUIUsingPadIdiom == 0;
      }
      else {
        BOOL v13 = 0;
      }
      if (!v13)
      {
        [v10 setModalPresentationStyle:16];
        v14 = +[GKUITheme sharedTheme];
        [v14 formSheetSize];
        objc_msgSend(v10, "setFormSheetSize:");
      }
    }
    v15 = [v10 navigationBar];
    v16 = +[GKUITheme sharedTheme];
    [v15 _gkApplyTheme:v16 navbarStyle:1];
  }
  else
  {
    v10 = v8;
  }
  [a1 setActiveViewController:v10];
  if (!v9)
  {
    v19 = [a1 authenticateHandler];

    if (!v19) {
      goto LABEL_21;
    }
    v20 = [MEMORY[0x263F40298] shared];
    if ([v20 isAccountModificationRestricted])
    {
      char v21 = [MEMORY[0x263F401D8] isGameCenter];

      if ((v21 & 1) == 0)
      {
        v22 = [MEMORY[0x263F087E8] userErrorForCode:4 underlyingError:0];
        id v23 = 0;
LABEL_20:
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __107__GKLocalPlayer_iOSAuthenticationUI__showViewController_usingPresentingViewController_wrapInNavController___block_invoke;
        block[3] = &unk_26478A0C0;
        block[4] = a1;
        id v27 = v23;
        id v28 = v22;
        id v24 = v22;
        id v25 = v23;
        dispatch_async(MEMORY[0x263EF83A0], block);

        goto LABEL_21;
      }
    }
    else
    {
    }
    id v23 = v10;
    v22 = 0;
    goto LABEL_20;
  }
  v17 = [v9 presentedViewController];

  if (v17)
  {
    v18 = [v9 presentedViewController];
    [v18 presentViewController:v10 animated:1 completion:0];
  }
  else
  {
    [v9 presentViewController:v10 animated:1 completion:0];
  }
LABEL_21:
}

- (void)removeActiveViewControllerAnimated:()iOSAuthenticationUI completionHandler:
{
  v6 = a4;
  v7 = [a1 activeViewController];
  [a1 setActiveViewController:0];
  id v8 = [a1 rootViewController];

  if (v8)
  {
    id v9 = [a1 rootViewController];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __91__GKLocalPlayer_iOSAuthenticationUI__removeActiveViewControllerAnimated_completionHandler___block_invoke;
    v12[3] = &unk_26478A338;
    v14 = v6;
    id v13 = v7;
    [v9 dismissViewControllerAnimated:a3 completion:v12];
  }
  else
  {
    v10 = [v7 presentingViewController];
    v11 = v10;
    if (v10)
    {
      [v10 dismissViewControllerAnimated:a3 completion:v6];
    }
    else if (v6)
    {
      v6[2](v6);
    }
  }
}

@end