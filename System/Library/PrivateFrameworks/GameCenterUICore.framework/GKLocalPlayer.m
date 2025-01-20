@interface GKLocalPlayer
@end

@implementation GKLocalPlayer

void __43__GKLocalPlayer_Alerts__currentLocalPlayer__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F40270] local];
  v1 = (void *)currentLocalPlayer_sCurrentLocalPlayer;
  currentLocalPlayer_sCurrentLocalPlayer = v0;

  if (([(id)currentLocalPlayer_sCurrentLocalPlayer isAuthenticated] & 1) == 0)
  {
    v2 = [MEMORY[0x263F40270] authenticatedLocalPlayers];
    id v5 = [v2 firstObject];

    if ([v5 isAuthenticated])
    {
      v3 = [v5 internal];
      [(id)currentLocalPlayer_sCurrentLocalPlayer setInternal:v3];

      uint64_t v4 = [v5 isAuthenticated];
      [(id)currentLocalPlayer_sCurrentLocalPlayer setAuthenticated:v4];
    }
  }
}

void __70__GKLocalPlayer_AuthenticationPrivate__sharedLocalPlayerAuthenticator__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) localPlayer];
  uint64_t v1 = +[GKLocalPlayerAuthenticator authenticatorForExistingPlayer:v3];
  v2 = (void *)sharedLocalPlayerAuthenticator_authenticator;
  sharedLocalPlayerAuthenticator_authenticator = v1;
}

void __98__GKLocalPlayer_AuthenticationPrivate___showWelcomeBannerWithSignInOrigin_uponReturnToForeground___block_invoke(uint64_t a1, int a2)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 72))
  {
    int v3 = 0;
  }
  else
  {
    id v5 = +[GKWelcomeBannerVisibility shared];
    if ([v5 isShowingRemoteUI]) {
      int v3 = 0;
    }
    else {
      int v3 = [*(id *)(a1 + 32) shouldDisplayWelcomeBannerForPlayer:*(void *)(a1 + 40) lastAuthDate:*(void *)(a1 + 48) remoteUI:*MEMORY[0x263F402F8] timeBetweenBanners:0.0] & (a2 ^ 1);
    }
  }
  v6 = [MEMORY[0x263EFF910] date];
  [v6 timeIntervalSinceDate:*(void *)(a1 + 48)];
  double v8 = v7;

  v9 = (NSObject **)MEMORY[0x263F40328];
  if (!*MEMORY[0x263F40328]) {
    id v10 = (id)GKOSLoggers();
  }
  v11 = *MEMORY[0x263F40340];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40340], OS_LOG_TYPE_INFO))
  {
    if ((v3 & (v8 >= 480.0)) != 0) {
      v12 = @"YES";
    }
    else {
      v12 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v47 = v12;
    _os_log_impl(&dword_22600C000, v11, OS_LOG_TYPE_INFO, "_showWelcomeBanner will show Welcome Banner? %@", buf, 0xCu);
  }
  v13 = (id *)(a1 + 32);
  v14 = [*(id *)(a1 + 32) internal];
  v15 = [v14 playerID];
  [*(id *)(a1 + 56) setLastAuthPlayerID:v15];

  if (v3)
  {
    if (v8 < 480.0)
    {
      [*v13 updateAccessPointUponReturnToForeground];
      return;
    }
    if (objc_msgSend(*v13, "didShowWelcomeBannerInOverlayWithNewUserState:uponReturnToForeground:", objc_msgSend(*v13, "isNewToGameCenter"), *(unsigned __int8 *)(a1 + 73)))return; {
    v16 = [MEMORY[0x263F40270] local];
    }
    [v16 hideAccessPoint];

    if ([*v13 isWelcomeBannerTooLate])
    {
      if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
      {
        [*v13 reloadAccessPoint];
        [*v13 showAccessPoint];
      }
      return;
    }
    v17 = [*v13 alias];
    v18 = [*v13 internal];
    uint64_t v19 = [v18 isDefaultNickname];

    v20 = [*v13 internal];
    uint64_t v21 = [v20 isDefaultPrivacyVisibility];

    v22 = [*v13 internal];
    uint64_t v23 = [v22 isDefaultContactsIntegrationConsent];

    if (!*v9) {
      id v24 = (id)GKOSLoggers();
    }
    v25 = (void *)*MEMORY[0x263F40310];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40310], OS_LOG_TYPE_INFO))
    {
      v26 = NSNumber;
      v27 = v25;
      v28 = [v26 numberWithBool:v19];
      v29 = [NSNumber numberWithBool:v21];
      v30 = [NSNumber numberWithBool:v23];
      *(_DWORD *)buf = 138413058;
      v47 = v17;
      __int16 v48 = 2112;
      v49 = v28;
      __int16 v50 = 2112;
      v51 = v29;
      __int16 v52 = 2112;
      v53 = v30;
      _os_log_impl(&dword_22600C000, v27, OS_LOG_TYPE_INFO, "is the current player nickname? (%@) a default nickname? (%@) default privacy? (%@) default Contacts Integration Consent? (%@)", buf, 0x2Au);
    }
    id v31 = *v13;
    if (v17)
    {
      [v31 isNewToGameCenter];
    }
    else
    {
      v17 = [v31 displayNameWithOptions:0];
      if (!v17)
      {
        v36 = *v9;
        if (!*v9)
        {
          id v37 = (id)GKOSLoggers();
          v36 = *v9;
        }
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
          __98__GKLocalPlayer_AuthenticationPrivate___showWelcomeBannerWithSignInOrigin_uponReturnToForeground___block_invoke_cold_2((uint64_t *)(a1 + 32), v36);
        }
        [*v13 isNewToGameCenter];
        v33 = GKGameCenterUIFrameworkBundle();
        v35 = GKGetLocalizedStringFromTableInBundle();
        v17 = 0;
        goto LABEL_37;
      }
      [*v13 isNewToGameCenter];
    }
    v32 = NSString;
    v33 = GKGameCenterUIFrameworkBundle();
    v34 = GKGetLocalizedStringFromTableInBundle();
    v35 = objc_msgSend(v32, "localizedStringWithFormat:", v34, v17);

LABEL_37:
    objc_initWeak((id *)buf, *v13);
    if (objc_opt_respondsToSelector())
    {
      if (*(void *)(a1 + 64))
      {
        v38 = objc_msgSend(MEMORY[0x263F402C0], "stringForOrigin:");
      }
      else
      {
        v38 = 0;
      }
      v40 = [MEMORY[0x263F40170] reporter];
      [v40 recordPageWithID:@"welcomeBannerPage" pageContext:@"thirdParty" pageType:@"welcomeBanner" refApp:v38];

      id v41 = *v13;
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __98__GKLocalPlayer_AuthenticationPrivate___showWelcomeBannerWithSignInOrigin_uponReturnToForeground___block_invoke_136;
      v44[3] = &unk_26478A1F8;
      objc_copyWeak(&v45, (id *)buf);
      v42[0] = MEMORY[0x263EF8330];
      v42[1] = 3221225472;
      v42[2] = __98__GKLocalPlayer_AuthenticationPrivate___showWelcomeBannerWithSignInOrigin_uponReturnToForeground___block_invoke_2;
      v42[3] = &unk_26478A220;
      v42[4] = *v13;
      objc_copyWeak(&v43, (id *)buf);
      [v41 showWelcomeBannerWithTitle:v35 message:0 touchHandler:v44 completionHandler:v42];
      objc_destroyWeak(&v43);
      objc_destroyWeak(&v45);
    }
    else
    {
      if (!*v9) {
        id v39 = (id)GKOSLoggers();
      }
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40320], OS_LOG_TYPE_ERROR)) {
        __98__GKLocalPlayer_AuthenticationPrivate___showWelcomeBannerWithSignInOrigin_uponReturnToForeground___block_invoke_cold_1();
      }
    }
    objc_destroyWeak((id *)buf);
  }
}

void __98__GKLocalPlayer_AuthenticationPrivate___showWelcomeBannerWithSignInOrigin_uponReturnToForeground___block_invoke_136(uint64_t a1)
{
  v2 = [MEMORY[0x263F40170] reporter];
  [v2 recordClickWithAction:@"navigate" targetId:@"dashboard" targetType:@"welcomeBanner" pageId:@"welcomeBannerPage" pageType:@"welcomeBanner"];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained showDashboardFromWelcomeBanner];
}

void __98__GKLocalPlayer_AuthenticationPrivate___showWelcomeBannerWithSignInOrigin_uponReturnToForeground___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsWelcomeOrSignInBannerEnqueued:0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained reloadAccessPoint];
  [WeakRetained showAccessPoint];
}

void __106__GKLocalPlayer_AuthenticationPrivate__startAuthenticationForExistingPrimaryPlayerUponReturnToForeground___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263EFF910] date];
  [v2 timeIntervalSince1970];
  double v4 = v3;
  id v5 = [MEMORY[0x263F40270] localPlayer];
  [v5 setAuthStartTimeStamp:v4];

  v6 = [(id)objc_opt_class() sharedLocalPlayerAuthenticator];
  [*(id *)(a1 + 32) setDidAuthenticate:1];
  [*(id *)(a1 + 32) setInsideAuthenticatorInvocation:1];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __106__GKLocalPlayer_AuthenticationPrivate__startAuthenticationForExistingPrimaryPlayerUponReturnToForeground___block_invoke_2;
  v7[3] = &unk_26478A298;
  v7[4] = *(void *)(a1 + 32);
  char v8 = *(unsigned char *)(a1 + 40);
  [v6 authenticateWithCompletionHandler:v7];
}

void __106__GKLocalPlayer_AuthenticationPrivate__startAuthenticationForExistingPrimaryPlayerUponReturnToForeground___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [v11 accessPointIsOnAutomatically];
  v13 = [MEMORY[0x263F40298] shared];
  [v13 setAccessPointIsOnAutomatically:v12];

  uint64_t v14 = [v11 accessPointShowHighlights];
  v15 = [MEMORY[0x263F40298] shared];
  [v15 setAccessPointShowHighlights:v14];

  uint64_t v16 = [v11 accessPointLocation];
  v17 = [MEMORY[0x263F40298] shared];
  [v17 setAccessPointLocation:v16];

  if (v10)
  {
    if (!*MEMORY[0x263F40328]) {
      id v18 = (id)GKOSLoggers();
    }
    uint64_t v19 = *MEMORY[0x263F40300];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40300], OS_LOG_TYPE_ERROR)) {
      __106__GKLocalPlayer_AuthenticationPrivate__startAuthenticationForExistingPrimaryPlayerUponReturnToForeground___block_invoke_2_cold_1((uint64_t)v10, v19);
    }
  }
  v20 = v9;
  if (!v9) {
    v20 = *(void **)(a1 + 32);
  }
  id v21 = v20;

  switch(a2)
  {
    case 0:
      if (!*MEMORY[0x263F40328]) {
        id v24 = (id)GKOSLoggers();
      }
      v25 = *MEMORY[0x263F40340];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40340], OS_LOG_TYPE_INFO))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_22600C000, v25, OS_LOG_TYPE_INFO, "startAuthenticationForExistingPrimaryPlayer:Local Player Authentication: Success", (uint8_t *)buf, 2u);
      }
      uint64_t v26 = *(unsigned __int8 *)(a1 + 40);
      v27 = v21;
      id v28 = 0;
      goto LABEL_34;
    case 1:
      if (!*MEMORY[0x263F40328]) {
        id v29 = (id)GKOSLoggers();
      }
      v30 = *MEMORY[0x263F40340];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40340], OS_LOG_TYPE_INFO))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_22600C000, v30, OS_LOG_TYPE_INFO, "startAuthenticationForExistingPrimaryPlayer:Local Player Authentication: Authentication Error", (uint8_t *)buf, 2u);
      }
      goto LABEL_33;
    case 2:
      if (!*MEMORY[0x263F40328]) {
        id v31 = (id)GKOSLoggers();
      }
      v32 = *MEMORY[0x263F40340];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40340], OS_LOG_TYPE_INFO))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_22600C000, v32, OS_LOG_TYPE_INFO, "startAuthenticationForExistingPrimaryPlayer:Local Player Authentication: Show Green Buddy", (uint8_t *)buf, 2u);
      }
      v33 = [MEMORY[0x263F40270] authenticationPersonality];
      [v33 authenticationShowGreenBuddyUIForLocalPlayer:v21 withCompletionHandler:0];

      break;
    case 3:
      v34 = [v21 signInViewController];

      if (v34)
      {
        if (!*MEMORY[0x263F40328]) {
          id v35 = (id)GKOSLoggers();
        }
        v36 = *MEMORY[0x263F40340];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40340], OS_LOG_TYPE_INFO))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_22600C000, v36, OS_LOG_TYPE_INFO, "startAuthenticationForExistingPrimaryPlayer:Local Player Authentication: Show Password Change UI", (uint8_t *)buf, 2u);
        }
      }
      else
      {
LABEL_33:
        uint64_t v26 = *(unsigned __int8 *)(a1 + 40);
        v27 = v21;
        id v28 = v10;
LABEL_34:
        [v27 authenticationDidCompleteWithError:v28 uponReturnToForeground:v26];
      }
      break;
    case 4:
    case 6:
      if (!*MEMORY[0x263F40328]) {
        id v22 = (id)GKOSLoggers();
      }
      uint64_t v23 = *MEMORY[0x263F40340];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40340], OS_LOG_TYPE_INFO))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_22600C000, v23, OS_LOG_TYPE_INFO, "startAuthenticationForExistingPrimaryPlayer:Local Player Authentication: Show Authentication UI", (uint8_t *)buf, 2u);
      }
      [*(id *)(a1 + 32) presentAuthenticationUIForLocalPlayer:v21];
      break;
    case 5:
      objc_initWeak(buf, *(id *)(a1 + 32));
      id v37 = *(void **)(a1 + 32);
      uint64_t v38 = MEMORY[0x263EF8330];
      uint64_t v39 = 3221225472;
      v40 = __106__GKLocalPlayer_AuthenticationPrivate__startAuthenticationForExistingPrimaryPlayerUponReturnToForeground___block_invoke_150;
      id v41 = &unk_26478A270;
      objc_copyWeak(&v44, buf);
      id v42 = v21;
      id v43 = v10;
      char v45 = *(unsigned char *)(a1 + 40);
      [v37 showSignInBannerForLocalPlayer:v42 completionHandler:&v38];

      objc_destroyWeak(&v44);
      objc_destroyWeak(buf);
      break;
    default:
      break;
  }
  objc_msgSend(*(id *)(a1 + 32), "setInsideAuthenticatorInvocation:", 0, v38, v39, v40, v41);
}

void __106__GKLocalPlayer_AuthenticationPrivate__startAuthenticationForExistingPrimaryPlayerUponReturnToForeground___block_invoke_150(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setShouldPreserveOnboardingUI:1];
  [*(id *)(a1 + 32) authenticationDidCompleteWithError:*(void *)(a1 + 40) uponReturnToForeground:*(unsigned __int8 *)(a1 + 56)];
}

void __111__GKLocalPlayer_AuthenticationPrivate__authenticationDidCompleteWithError_signInOrigin_uponReturnToForeground___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) validateAccountCompletionHandler];

  if (v2)
  {
    double v3 = [*(id *)(a1 + 32) validateAccountCompletionHandler];
    v3[2](v3, *(void *)(a1 + 40));

    double v4 = *(void **)(a1 + 32);
    [v4 setValidateAccountCompletionHandler:0];
  }
}

void __73__GKLocalPlayer_AuthenticationPrivate___showViewControllerForLegacyApps___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setRotationDecider:v3];
  [*(id *)(a1 + 40) setRootViewController:v4];
  [v4 _presentViewController:*(void *)(a1 + 48) sendingView:*(void *)(a1 + 56) animated:1];
}

uint64_t __73__GKLocalPlayer_AuthenticationPrivate___showViewControllerForLegacyApps___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __87__GKLocalPlayer_AuthenticationPrivate__startLegacyAuthenticationWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v8 && WeakRetained)
  {
    [WeakRetained _showViewControllerForLegacyApps:v8];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      (*(void (**)(uint64_t, id))(v7 + 16))(v7, v5);
    }
  }
}

void __87__GKLocalPlayer_AuthenticationPrivate__startLegacyAuthenticationWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  v15[2] = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 40))
  {
    if ([*(id *)(a1 + 32) isAuthenticated])
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      int v2 = [*(id *)(a1 + 32) isAuthenticating];
      uint64_t v3 = *(void *)(a1 + 40);
      if (v2) {
        uint64_t v4 = 7;
      }
      else {
        uint64_t v4 = 2;
      }
      id v5 = [MEMORY[0x263F087E8] userErrorForCode:v4 underlyingError:0];
      (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v5);
    }
  }
  if ([*(id *)(a1 + 32) isAuthenticated])
  {
    v6 = [*(id *)(a1 + 32) internal];
    uint64_t v7 = [v6 playerID];
    if (v7)
    {
      v14[0] = *MEMORY[0x263F40128];
      id v8 = [*(id *)(a1 + 32) internal];
      id v9 = [v8 playerID];
      v15[0] = v9;
      v14[1] = *MEMORY[0x263F40120];
      id v10 = [*(id *)(a1 + 32) internal];
      id v11 = [v10 playerID];
      v15[1] = v11;
      uint64_t v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  v13 = [MEMORY[0x263F08A00] defaultCenter];
  [v13 postNotificationName:*MEMORY[0x263F40118] object:*(void *)(a1 + 32) userInfo:v12];
}

void __107__GKLocalPlayer_iOSAuthenticationUI__showViewController_usingPresentingViewController_wrapInNavController___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) authenticateHandler];
  (*((void (**)(id, void, void))v2 + 2))(v2, *(void *)(a1 + 40), *(void *)(a1 + 48));
}

void __91__GKLocalPlayer_iOSAuthenticationUI__removeActiveViewControllerAnimated_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [*(id *)(a1 + 32) dismissCompletionHandler];
    if (v3)
    {
      uint64_t v4 = v3;
      v3[2]();
      [*(id *)(a1 + 32) setDismissCompletionHandler:0];
      uint64_t v3 = v4;
    }
  }
}

void __98__GKLocalPlayer_AuthenticationPrivate___showWelcomeBannerWithSignInOrigin_uponReturnToForeground___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  _os_log_error_impl(&dword_22600C000, v0, OS_LOG_TYPE_ERROR, "_showWelcomeBanner does not respond to selector showWelcomeBannerWithTitle:message:touchHandler:completionHandler:", v1, 2u);
}

void __98__GKLocalPlayer_AuthenticationPrivate___showWelcomeBannerWithSignInOrigin_uponReturnToForeground___block_invoke_cold_2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_22600C000, a2, OS_LOG_TYPE_DEBUG, "name and alias missing for %@", (uint8_t *)&v3, 0xCu);
}

void __106__GKLocalPlayer_AuthenticationPrivate__startAuthenticationForExistingPrimaryPlayerUponReturnToForeground___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22600C000, a2, OS_LOG_TYPE_ERROR, "startAuthenticationForExistingPrimaryPlayer:Failed to Authenticate player.Error: %@", (uint8_t *)&v2, 0xCu);
}

@end