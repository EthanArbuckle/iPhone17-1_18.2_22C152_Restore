@interface GKLocalPlayer(AuthenticationExtras)
- (BOOL)isWelcomeOrSignInBannerEnqueued;
- (uint64_t)alertView:()AuthenticationExtras didDismissWithButtonIndex:;
- (uint64_t)didShowOnboardingInOverlayWithSignInOrigin:()AuthenticationExtras;
- (uint64_t)didShowWelcomeBannerInOverlayWithNewUserState:()AuthenticationExtras uponReturnToForeground:;
- (uint64_t)setIsWelcomeOrSignInBannerEnqueued:()AuthenticationExtras;
- (uint64_t)shouldShowOnBoardingUI;
- (void)authenticationShowGreenBuddyUIForLocalPlayer:()AuthenticationExtras withCompletionHandler:;
- (void)authenticationShowSignInUIForLocalPlayer:()AuthenticationExtras origin:dismiss:;
- (void)hideAccessPoint;
- (void)presentInGameBannerWithNotification:()AuthenticationExtras;
- (void)reloadAccessPoint;
- (void)showAccessPoint;
- (void)showBannerWithTitle:()AuthenticationExtras message:touchHandler:completionHandler:;
- (void)showDashboardFromWelcomeBanner;
- (void)showOnboardingUIFromViewController:()AuthenticationExtras signInOrigin:;
- (void)showSignInBannerForLocalPlayer:()AuthenticationExtras completionHandler:;
- (void)showWelcomeBannerWithTitle:()AuthenticationExtras message:touchHandler:completionHandler:;
- (void)updateAccessPointUponReturnToForeground;
@end

@implementation GKLocalPlayer(AuthenticationExtras)

- (void)showSignInBannerForLocalPlayer:()AuthenticationExtras completionHandler:
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F636C8] proxyForLocalPlayer];
  v9 = [v8 utilityService];
  v16[0] = *MEMORY[0x1E4F63658];
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __88__GKLocalPlayer_AuthenticationExtras__showSignInBannerForLocalPlayer_completionHandler___block_invoke;
  v13[3] = &unk_1E5F661E8;
  id v14 = v6;
  id v15 = v7;
  v13[4] = a1;
  id v11 = v6;
  id v12 = v7;
  [v9 getStoreBagValuesForKeys:v10 handler:v13];
}

- (void)showBannerWithTitle:()AuthenticationExtras message:touchHandler:completionHandler:
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  [a1 dismissOnboardingUIIfPresent];
  [a1 setIsWelcomeOrSignInBannerEnqueued:1];
  +[GKNotificationBanner showBannerWithTitle:v13 message:v12 touchHandler:v11 completionHandler:v10];
}

- (void)showWelcomeBannerWithTitle:()AuthenticationExtras message:touchHandler:completionHandler:
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  [a1 dismissOnboardingUIIfPresent];
  [a1 setIsWelcomeOrSignInBannerEnqueued:1];
  +[GKNotificationBanner showWelcomeBannerWithTitle:v13 message:v12 touchHandler:v11 completionHandler:v10];
}

- (BOOL)isWelcomeOrSignInBannerEnqueued
{
  return +[GKNotificationBanner isWelcomeOrSignInBannerEnqueued];
}

- (uint64_t)setIsWelcomeOrSignInBannerEnqueued:()AuthenticationExtras
{
  return +[GKNotificationBanner setIsWelcomeOrSignInBannerEnqueued:](GKNotificationBanner, "setIsWelcomeOrSignInBannerEnqueued:");
}

- (void)showDashboardFromWelcomeBanner
{
  id v0 = +[GKAccessPoint shared];
  [v0 showDashboardWithState:-1 handler:&__block_literal_global_41];
}

- (uint64_t)shouldShowOnBoardingUI
{
  id v0 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v1 = [v0 _gkIsEligibleForOnboardingUI];

  return v1;
}

- (void)showOnboardingUIFromViewController:()AuthenticationExtras signInOrigin:
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!*MEMORY[0x1E4F63860]) {
    id v7 = (id)GKOSLoggers();
  }
  v8 = (void *)*MEMORY[0x1E4F63878];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63878], OS_LOG_TYPE_INFO))
  {
    uint64_t v24 = a4;
    id v25 = v6;
    v9 = NSNumber;
    id v10 = v8;
    id v11 = objc_msgSend(v9, "numberWithBool:", objc_msgSend(a1, "hasPhoto"));
    id v12 = [NSNumber numberWithBool:GKIsAvatarEditingSupported()];
    id v13 = NSNumber;
    id v14 = [a1 internal];
    id v15 = objc_msgSend(v13, "numberWithBool:", objc_msgSend(v14, "isDefaultNickname"));
    v16 = NSNumber;
    v17 = [a1 internal];
    v18 = objc_msgSend(v16, "numberWithBool:", objc_msgSend(v17, "isDefaultPrivacyVisibility"));
    v19 = NSNumber;
    v20 = [a1 internal];
    v21 = objc_msgSend(v19, "numberWithBool:", objc_msgSend(v20, "isDefaultContactsIntegrationConsent"));
    *(_DWORD *)buf = 138413314;
    v27 = v11;
    __int16 v28 = 2112;
    v29 = v12;
    __int16 v30 = 2112;
    v31 = v15;
    __int16 v32 = 2112;
    v33 = v18;
    __int16 v34 = 2112;
    v35 = v21;
    _os_log_impl(&dword_1AF250000, v10, OS_LOG_TYPE_INFO, "showOnboardingUIFromViewController: starting onboarding flow\n Player Avatar: %@\n Can edit: %@\n Default Nickname: %@\n Default Privacy: %@\n Default Contacts Integration Consent: %@", buf, 0x34u);

    a4 = v24;
    id v6 = v25;
  }
  v22 = objc_alloc_init(GKHostedAuthenticateViewController);
  [(GKHostedAuthenticateViewController *)v22 setOrigin:a4];
  [a1 setSignInViewController:v22];
  [(GKHostedAuthenticateViewController *)v22 setCompletionHandler:&__block_literal_global_30];
  [(GKHostedAuthenticateViewController *)v22 setRemoteViewReadyHandler:&__block_literal_global_34];
  v23 = [MEMORY[0x1E4F63760] local];
  [v23 hideAccessPoint];

  [(GKHostedAuthenticateViewController *)v22 continueWithMode:2];
  [a1 setShouldPreserveOnboardingUI:1];
}

- (void)authenticationShowGreenBuddyUIForLocalPlayer:()AuthenticationExtras withCompletionHandler:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (NSObject **)MEMORY[0x1E4F63860];
  if (!*MEMORY[0x1E4F63860]) {
    id v9 = (id)GKOSLoggers();
  }
  id v10 = *MEMORY[0x1E4F63880];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63880], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF250000, v10, OS_LOG_TYPE_INFO, "authenticationShowGreenBuddyUIForLocalPlayer", buf, 2u);
  }
  [a1 reportAuthenticatingWithGreenBuddyInvocation];
  if (([MEMORY[0x1E4F636F0] isGameCenter] & 1) == 0)
  {
    id v11 = objc_alloc_init(GKHostedAuthenticateViewController);
    [(GKHostedAuthenticateViewController *)v11 setModalPresentationStyle:0];
    [v6 setSignInViewController:v11];
    id v12 = *v8;
    if (!*v8)
    {
      id v13 = (id)GKOSLoggers();
      id v12 = *v8;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v11;
      _os_log_impl(&dword_1AF250000, v12, OS_LOG_TYPE_INFO, "Creating sign in view controller for authorise: %@", buf, 0xCu);
    }
    objc_initWeak((id *)buf, a1);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __106__GKLocalPlayer_AuthenticationExtras__authenticationShowGreenBuddyUIForLocalPlayer_withCompletionHandler___block_invoke;
    v21[3] = &unk_1E5F66258;
    objc_copyWeak(&v23, (id *)buf);
    id v14 = v6;
    id v22 = v14;
    [(GKHostedAuthenticateViewController *)v11 setCompletionHandler:v21];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __106__GKLocalPlayer_AuthenticationExtras__authenticationShowGreenBuddyUIForLocalPlayer_withCompletionHandler___block_invoke_3;
    v18 = &unk_1E5F66280;
    id v19 = v14;
    v20 = a1;
    [(GKHostedAuthenticateViewController *)v11 setRemoteViewReadyHandler:&v15];
    -[GKHostedAuthenticateViewController continueWithMode:](v11, "continueWithMode:", 1, v15, v16, v17, v18);
    [a1 setShowingInGameUI:1];

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
}

- (void)authenticationShowSignInUIForLocalPlayer:()AuthenticationExtras origin:dismiss:
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = (NSObject **)MEMORY[0x1E4F63860];
  if (!*MEMORY[0x1E4F63860]) {
    id v11 = (id)GKOSLoggers();
  }
  id v12 = *MEMORY[0x1E4F63880];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63880], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF250000, v12, OS_LOG_TYPE_INFO, "authenticationShowSignInUIForLocalPlayer", buf, 2u);
  }
  [a1 reportAuthenticatingWithAuthKitInvocation];
  if ([a1 didShowOnboardingInOverlayWithSignInOrigin:a4])
  {
    [MEMORY[0x1E4F639A0] didShowFullscreen];
    id v13 = [MEMORY[0x1E4F636C8] proxyForLocalPlayer];
    id v14 = [(GKHostedAuthenticateViewController *)v13 accountService];
    [v14 didShowFullscreenSignIn];

LABEL_16:
    goto LABEL_17;
  }
  if (([MEMORY[0x1E4F636F0] isGameCenter] & 1) == 0)
  {
    if (![v8 enteringForeground]
      || ([v8 signInViewController], (uint64_t v15 = objc_claimAutoreleasedReturnValue()) == 0)
      || (int v16 = [a1 isAuthenticating], v15, v16))
    {
      id v13 = objc_alloc_init(GKHostedAuthenticateViewController);
      [v8 setSignInViewController:v13];
      v17 = *v10;
      if (!*v10)
      {
        id v18 = (id)GKOSLoggers();
        v17 = *v10;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v29 = v13;
        __int16 v30 = 2112;
        id v31 = v8;
        _os_log_impl(&dword_1AF250000, v17, OS_LOG_TYPE_INFO, "Creating sign in view controller for authenticate: %@ for localPlayer:%@", buf, 0x16u);
      }
      objc_initWeak((id *)buf, a1);
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __95__GKLocalPlayer_AuthenticationExtras__authenticationShowSignInUIForLocalPlayer_origin_dismiss___block_invoke;
      v24[3] = &unk_1E5F662D0;
      objc_copyWeak(v27, (id *)buf);
      id v19 = v8;
      id v25 = v19;
      v27[1] = a4;
      id v26 = v9;
      [(GKHostedAuthenticateViewController *)v13 setCompletionHandler:v24];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __95__GKLocalPlayer_AuthenticationExtras__authenticationShowSignInUIForLocalPlayer_origin_dismiss___block_invoke_3;
      v22[3] = &unk_1E5F65848;
      id v23 = v19;
      [(GKHostedAuthenticateViewController *)v13 setRemoteViewReadyHandler:v22];
      [(GKHostedAuthenticateViewController *)v13 continueWithMode:0];
      [MEMORY[0x1E4F639A0] didShowFullscreen];
      v20 = [MEMORY[0x1E4F636C8] proxyForLocalPlayer];
      v21 = [v20 accountService];
      [v21 didShowFullscreenSignIn];

      [a1 setShowingInGameUI:1];
      objc_destroyWeak(v27);
      objc_destroyWeak((id *)buf);
      goto LABEL_16;
    }
  }
LABEL_17:
}

- (uint64_t)alertView:()AuthenticationExtras didDismissWithButtonIndex:
{
  return [a1 setCurrentAlert:0];
}

- (void)showAccessPoint
{
  if (([MEMORY[0x1E4F28B50] _gkMainBundleIsGameCenterSystemProcess] & 1) == 0)
  {
    id v0 = +[GKAccessPoint shared];
    [v0 showAccessPoint];
  }
}

- (void)hideAccessPoint
{
  if (([MEMORY[0x1E4F28B50] _gkMainBundleIsGameCenterSystemProcess] & 1) == 0)
  {
    id v0 = +[GKAccessPoint shared];
    [v0 hideAccessPoint];
  }
}

- (void)reloadAccessPoint
{
  if (([MEMORY[0x1E4F28B50] _gkMainBundleIsGameCenterSystemProcess] & 1) == 0)
  {
    id v0 = +[GKAccessPoint shared];
    [v0 loadModels];
  }
}

- (uint64_t)didShowWelcomeBannerInOverlayWithNewUserState:()AuthenticationExtras uponReturnToForeground:
{
  uint64_t v6 = [MEMORY[0x1E4F63760] usesGameOverlayUI];
  if (v6)
  {
    id v7 = +[GKAccessPoint shared];
    [v7 configureIfNeeded];

    [MEMORY[0x1E4F63760] presentWelcomeBannerInOverlayWithReturnToForeground:a4 newToGameCenter:a3];
  }
  return v6;
}

- (uint64_t)didShowOnboardingInOverlayWithSignInOrigin:()AuthenticationExtras
{
  uint64_t v4 = [MEMORY[0x1E4F63760] usesGameOverlayUI];
  if (v4) {
    [MEMORY[0x1E4F63760] presentOnboardingFlowInOverlayWithOrigin:a3 sceneIdentifier:0];
  }
  return v4;
}

- (void)updateAccessPointUponReturnToForeground
{
  id v3 = +[GKAccessPoint shared];
  if ([v3 isActive])
  {
    int v0 = [MEMORY[0x1E4F63760] usesGameOverlayUI];

    if (v0)
    {
      uint64_t v1 = +[GKAccessPoint shared];
      [v1 configureIfNeeded];

      v2 = (void *)MEMORY[0x1E4F63760];
      [v2 presentAccessPointInOverlayUponReturnToForeground:1];
    }
  }
  else
  {
  }
}

- (void)presentInGameBannerWithNotification:()AuthenticationExtras
{
  id v3 = a3;
  if ([MEMORY[0x1E4F63760] usesGameOverlayUI]) {
    [MEMORY[0x1E4F63760] presentInGameBannerInOverlayWithData:v3];
  }
}

@end