@interface GKLocalPlayer(AuthenticationPrivate)
+ (id)authenticationPersonality;
+ (id)sharedLocalPlayerAuthenticator;
+ (void)setAuthenticationPersonality:()AuthenticationPrivate;
- (uint64_t)authenticationDidCompleteWithError:()AuthenticationPrivate;
- (uint64_t)authenticationDidCompleteWithError:()AuthenticationPrivate signInOrigin:;
- (uint64_t)authenticationDidCompleteWithError:()AuthenticationPrivate uponReturnToForeground:;
- (uint64_t)isAuthenticating;
- (uint64_t)showAuthenticateViewControllerForGameCenter;
- (uint64_t)showOnboardingUIWithSignInOrigin:()AuthenticationPrivate;
- (uint64_t)startAuthenticationForExistingPrimaryPlayer;
- (void)_showViewControllerForLegacyApps:()AuthenticationPrivate;
- (void)_showWelcomeBannerWithSignInOrigin:()AuthenticationPrivate uponReturnToForeground:;
- (void)applicationDidEnterBackground:()AuthenticationPrivate;
- (void)applicationWillEnterForeground:()AuthenticationPrivate;
- (void)authenticationDidCompleteWithError:()AuthenticationPrivate signInOrigin:uponReturnToForeground:;
- (void)cancelAuthentication;
- (void)dismissOnboardingUIIfPresent;
- (void)presentAuthenticationUIForLocalPlayer:()AuthenticationPrivate;
- (void)sharePlayEligibilityChanged:()AuthenticationPrivate;
- (void)startAuthenticationForExistingPrimaryPlayerUponReturnToForeground:()AuthenticationPrivate;
- (void)startLegacyAuthenticationWithCompletionHandler:()AuthenticationPrivate;
@end

@implementation GKLocalPlayer(AuthenticationPrivate)

+ (id)authenticationPersonality
{
  if (sAuthenticationPersonality)
  {
    id v0 = (id)sAuthenticationPersonality;
  }
  else
  {
    id v0 = [MEMORY[0x263F40270] localPlayer];
  }
  return v0;
}

+ (void)setAuthenticationPersonality:()AuthenticationPrivate
{
}

+ (id)sharedLocalPlayerAuthenticator
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__GKLocalPlayer_AuthenticationPrivate__sharedLocalPlayerAuthenticator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedLocalPlayerAuthenticator_onceToken != -1) {
    dispatch_once(&sharedLocalPlayerAuthenticator_onceToken, block);
  }
  v1 = (void *)sharedLocalPlayerAuthenticator_authenticator;
  return v1;
}

- (uint64_t)isAuthenticating
{
  id v0 = [(id)objc_opt_class() sharedLocalPlayerAuthenticator];
  uint64_t v1 = [v0 isAuthenticating];

  return v1;
}

- (void)_showWelcomeBannerWithSignInOrigin:()AuthenticationPrivate uponReturnToForeground:
{
  if (!*MEMORY[0x263F40328]) {
    id v7 = (id)GKOSLoggers();
  }
  v8 = *MEMORY[0x263F40340];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40340], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22600C000, v8, OS_LOG_TYPE_INFO, "_showWelcomeBanner is called", buf, 2u);
  }
  v9 = [(id)objc_opt_class() sharedLocalPlayerAuthenticator];
  v10 = [v9 lastAuthDate];
  v11 = [v9 lastAuthPlayerID];
  if (objc_opt_respondsToSelector()) {
    char v12 = [a1 isBannerVisible];
  }
  else {
    char v12 = 0;
  }
  v13 = [MEMORY[0x263F401B0] proxyForLocalPlayer];
  v14 = [v13 accountService];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __98__GKLocalPlayer_AuthenticationPrivate___showWelcomeBannerWithSignInOrigin_uponReturnToForeground___block_invoke;
  v18[3] = &unk_26478A248;
  char v23 = v12;
  v18[4] = a1;
  id v19 = v11;
  id v20 = v10;
  id v21 = v9;
  char v24 = a4;
  uint64_t v22 = a3;
  id v15 = v9;
  id v16 = v10;
  id v17 = v11;
  [v14 isAppUnlistedAndDisallowed:v18];
}

- (uint64_t)startAuthenticationForExistingPrimaryPlayer
{
  return [a1 startAuthenticationForExistingPrimaryPlayerUponReturnToForeground:0];
}

- (void)startAuthenticationForExistingPrimaryPlayerUponReturnToForeground:()AuthenticationPrivate
{
  [a1 reportAuthenticationStartForPlayer];
  v5 = (void *)MEMORY[0x263F40188];
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKLocalPlayer+Authentication_iOS.m", 271, "-[GKLocalPlayer(AuthenticationPrivate) startAuthenticationForExistingPrimaryPlayerUponReturnToForeground:]");
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __106__GKLocalPlayer_AuthenticationPrivate__startAuthenticationForExistingPrimaryPlayerUponReturnToForeground___block_invoke;
  v7[3] = &unk_26478A2C0;
  v7[4] = a1;
  char v8 = a3;
  [v5 named:v6 execute:v7];
}

- (void)presentAuthenticationUIForLocalPlayer:()AuthenticationPrivate
{
  v3 = (void *)MEMORY[0x263F40270];
  id v4 = a3;
  id v5 = [v3 authenticationPersonality];
  [v5 authenticationShowSignInUIForLocalPlayer:v4 origin:1 dismiss:0];
}

- (uint64_t)showOnboardingUIWithSignInOrigin:()AuthenticationPrivate
{
  uint64_t result = objc_msgSend(a1, "didShowOnboardingInOverlayWithSignInOrigin:");
  if ((result & 1) == 0)
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      return [a1 showOnboardingUIFromViewController:0 signInOrigin:a3];
    }
  }
  return result;
}

- (uint64_t)authenticationDidCompleteWithError:()AuthenticationPrivate
{
  return [a1 authenticationDidCompleteWithError:a3 signInOrigin:0 uponReturnToForeground:0];
}

- (uint64_t)authenticationDidCompleteWithError:()AuthenticationPrivate uponReturnToForeground:
{
  return [a1 authenticationDidCompleteWithError:a3 signInOrigin:0 uponReturnToForeground:a4];
}

- (uint64_t)authenticationDidCompleteWithError:()AuthenticationPrivate signInOrigin:
{
  return [a1 authenticationDidCompleteWithError:a3 signInOrigin:a4 uponReturnToForeground:0];
}

- (void)authenticationDidCompleteWithError:()AuthenticationPrivate signInOrigin:uponReturnToForeground:
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  id v7 = a3;
  char v8 = (uint64_t *)MEMORY[0x263F40328];
  if (!*MEMORY[0x263F40328]) {
    id v9 = (id)GKOSLoggers();
  }
  v10 = (os_log_t *)MEMORY[0x263F40340];
  v11 = *MEMORY[0x263F40340];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40340], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22600C000, v11, OS_LOG_TYPE_INFO, "authenticationDidCompleteWithError being called", buf, 2u);
  }
  char v12 = [a1 currentAlert];

  if (v12)
  {
    v13 = [a1 currentAlert];
    [v13 setDelegate:0];

    v14 = [a1 currentAlert];
    [v14 dismissAnimated:1];

    [a1 setCurrentAlert:0];
  }
  if ([a1 validatingAccount])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __111__GKLocalPlayer_AuthenticationPrivate__authenticationDidCompleteWithError_signInOrigin_uponReturnToForeground___block_invoke;
    block[3] = &unk_26478A2E8;
    block[4] = a1;
    id v81 = v7;
    dispatch_async(MEMORY[0x263EF83A0], block);
    [a1 setValidatingAccount:0];

    goto LABEL_68;
  }
  id v15 = [(id)objc_opt_class() sharedLocalPlayerAuthenticator];
  [v15 authenticationDidComplete];
  [a1 setEnteringForeground:0];
  if (([a1 shouldPreserveOnboardingUI] & 1) == 0)
  {
    [a1 removeActiveViewControllerAnimated:1 completionHandler:0];
    [a1 setSignInViewController:0];
  }
  int v79 = [v7 gkIsNotConnectedToInternetError];
  if (v79)
  {
    if (!*v8) {
      id v16 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40300], OS_LOG_TYPE_DEBUG)) {
      -[GKLocalPlayer(AuthenticationPrivate) authenticationDidCompleteWithError:signInOrigin:uponReturnToForeground:].cold.4();
    }
    [a1 reportAuthenticationErrorNoInternetConnection];
  }
  if (![a1 isAuthenticated])
  {
    v38 = [v7 description];

    uint64_t v39 = *v8;
    if (v38)
    {
      if (!v39) {
        id v40 = (id)GKOSLoggers();
      }
      v41 = (void *)*MEMORY[0x263F40300];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40300], OS_LOG_TYPE_ERROR)) {
        -[GKLocalPlayer(AuthenticationPrivate) authenticationDidCompleteWithError:signInOrigin:uponReturnToForeground:](v41, v7);
      }
    }
    else
    {
      if (!v39) {
        id v42 = (id)GKOSLoggers();
      }
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40300], OS_LOG_TYPE_DEBUG)) {
        -[GKLocalPlayer(AuthenticationPrivate) authenticationDidCompleteWithError:signInOrigin:uponReturnToForeground:]();
      }
    }
    v43 = [MEMORY[0x263F40270] localPlayer];
    [v43 authStartTimeStamp];
    double v45 = v44;

    if (v45 <= 0.0)
    {
      uint64_t v52 = 0;
    }
    else
    {
      v46 = [MEMORY[0x263EFF910] date];
      [v46 timeIntervalSince1970];
      double v48 = v47;
      v49 = [MEMORY[0x263F40270] localPlayer];
      [v49 authStartTimeStamp];
      *(double *)&uint64_t v51 = v48 - v50;

      uint64_t v52 = v51;
    }
    if (!*v8) {
      id v53 = (id)GKOSLoggers();
    }
    v54 = *MEMORY[0x263F40320];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40320], OS_LOG_TYPE_ERROR)) {
      -[GKLocalPlayer(AuthenticationPrivate) authenticationDidCompleteWithError:signInOrigin:uponReturnToForeground:](v52, v54);
    }
    v55 = [MEMORY[0x263F402B0] reporter];
    [v55 reportPlayerAuthenticationFailure:v7];

    [v15 setLastAuthPlayerID:0];
    if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
    {
      [a1 reloadAccessPoint];
      [a1 showAccessPoint];
    }
    v56 = [MEMORY[0x263F087E8] userErrorForCode:6 underlyingError:v7];
    [a1 callAuthHandlerWithError:v56];

    goto LABEL_62;
  }
  if (!*v8) {
    id v17 = (id)GKOSLoggers();
  }
  os_log_t v18 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v75 = a4;
    v76 = v15;
    id v19 = NSNumber;
    id v20 = (void *)MEMORY[0x263F40298];
    log = v18;
    v74 = [v20 shared];
    v77 = objc_msgSend(v19, "numberWithBool:", objc_msgSend(v74, "isAddingFriendsRestricted"));
    id v21 = NSNumber;
    v73 = [MEMORY[0x263F40298] shared];
    v65 = objc_msgSend(v21, "numberWithBool:", objc_msgSend(v73, "isMultiplayerGamingRestricted"));
    uint64_t v22 = NSNumber;
    v72 = [MEMORY[0x263F40298] shared];
    char v23 = objc_msgSend(v22, "numberWithBool:", objc_msgSend(v72, "isGameCenterRestricted"));
    char v24 = NSNumber;
    v70 = [MEMORY[0x263F40298] shared];
    v66 = objc_msgSend(v24, "numberWithBool:", objc_msgSend(v70, "isCustomizedCommunicationRestricted"));
    v25 = NSNumber;
    v69 = [MEMORY[0x263F40298] shared];
    v62 = objc_msgSend(v25, "numberWithBool:", objc_msgSend(v69, "isNearbyMultiplayerRestricted"));
    v26 = NSNumber;
    v68 = [MEMORY[0x263F40298] shared];
    v63 = objc_msgSend(v26, "numberWithBool:", objc_msgSend(v68, "isProfileModificationRestricted"));
    v27 = NSNumber;
    v67 = [MEMORY[0x263F40298] shared];
    v61 = objc_msgSend(v27, "numberWithBool:", objc_msgSend(v67, "isProfilePrivacyModificationRestricted"));
    v28 = NSNumber;
    v64 = [MEMORY[0x263F40298] shared];
    v29 = objc_msgSend(v28, "numberWithUnsignedInteger:", objc_msgSend(v64, "multiplayerAllowedPlayerType"));
    v30 = NSNumber;
    v31 = [MEMORY[0x263F40298] shared];
    v32 = objc_msgSend(v30, "numberWithBool:", objc_msgSend(v31, "isFriendsSharingRestricted"));
    *(_DWORD *)buf = 138414338;
    v83 = v77;
    __int16 v84 = 2112;
    v85 = v65;
    __int16 v86 = 2112;
    v87 = v23;
    __int16 v88 = 2112;
    v89 = v66;
    __int16 v90 = 2112;
    v91 = v62;
    __int16 v92 = 2112;
    v93 = v63;
    __int16 v94 = 2112;
    v95 = v61;
    __int16 v96 = 2112;
    v97 = v29;
    __int16 v98 = 2112;
    v99 = v32;
    _os_log_impl(&dword_22600C000, log, OS_LOG_TYPE_INFO, "Screen-Time Restrictions:                    \n\taddingFriendsRestricted : %@,                    \n\tmultiplayerGamingRestricted : %@,                    \n\tgameCenterRestricted : %@,                    \n\tcustomizedCommunicationRestricted : %@,                    \n\tnearbyMultiplayerRestricted : %@,                    \n\tprofileModificationRestricted : %@,                    \n\tprofilePrivacyModificationRestricted : %@                    \n\t,multiplayerAllowedPlayerType : %@,                    \n\tfriendsSharingRestricted : %@", buf, 0x5Cu);

    a4 = v75;
    v10 = (os_log_t *)MEMORY[0x263F40340];

    char v8 = (uint64_t *)MEMORY[0x263F40328];
    id v15 = v76;
  }
  [a1 reportAuthenticationPlayerAuthenticated];
  char v33 = v79 ^ 1;
  if (!v7) {
    char v33 = 1;
  }
  if (v33)
  {
    if (!v7) {
      goto LABEL_26;
    }
LABEL_42:
    if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
    {
      [a1 reloadAccessPoint];
      [a1 showAccessPoint];
    }
    goto LABEL_46;
  }
  v34 = [a1 gamePlayerID];

  if (!v34) {
    goto LABEL_42;
  }
LABEL_26:
  if (!*v8) {
    id v35 = (id)GKOSLoggers();
  }
  v36 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22600C000, v36, OS_LOG_TYPE_INFO, "authenticationDidCompleteWithError:Local Player Authenticated", buf, 2u);
  }
  if (objc_opt_respondsToSelector())
  {
    int v37 = [a1 shouldShowOnBoardingUI];
    if (a4 != 7 && v37 && [a1 shouldShowAnyOnboardingScreen])
    {
      if (([a1 shouldPreserveOnboardingUI] & 1) == 0) {
        [a1 showOnboardingUIWithSignInOrigin:a4];
      }
      goto LABEL_62;
    }
  }
  [a1 _showWelcomeBannerWithSignInOrigin:a4 uponReturnToForeground:a5];
LABEL_46:
  [a1 callAuthHandlerWithError:v7];
LABEL_62:
  [a1 setNewToGameCenter:0];
  int v57 = [MEMORY[0x263F401D8] isGameCenter];
  char v58 = v79 ^ 1;
  if (!v7) {
    char v58 = 0;
  }
  if ((v58 & 1) == 0 && !v57)
  {
    v59 = [a1 matchmaker];
    [v59 finishedAuthenticating];

    v60 = [MEMORY[0x263F402D8] sharedTurnBasedEventHandler];
    [v60 lookForEvent];

    [MEMORY[0x263F401E0] fetchAndEmitMostRecentGameActivity];
  }

LABEL_68:
}

- (void)cancelAuthentication
{
  if (!*MEMORY[0x263F40328]) {
    id v2 = (id)GKOSLoggers();
  }
  v3 = *MEMORY[0x263F40340];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40340], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_22600C000, v3, OS_LOG_TYPE_INFO, "cancelAuthentication", v5, 2u);
  }
  [a1 reportAuthenticationLoginCanceled];
  id v4 = [MEMORY[0x263F087E8] userErrorForCode:2 underlyingError:0];
  [a1 authenticationDidCompleteWithError:v4];
}

- (uint64_t)showAuthenticateViewControllerForGameCenter
{
  [a1 setValidatingAccount:0];
  return [a1 authenticationShowSignInUIForLocalPlayer:a1 origin:0 dismiss:0];
}

- (void)applicationWillEnterForeground:()AuthenticationPrivate
{
  [a1 setAppIsInBackground:0];
  if ([a1 didAuthenticate] && (objc_msgSend(a1, "isAuthenticating") & 1) == 0)
  {
    id v2 = [a1 currentAlert];

    if (v2)
    {
      v3 = [a1 currentAlert];
      [v3 setDelegate:0];

      id v4 = [a1 currentAlert];
      [v4 dismissAnimated:1];

      [a1 setCurrentAlert:0];
    }
    [a1 setEnteringForeground:1];
    id v5 = [(id)objc_opt_class() sharedLocalPlayerAuthenticator];
    [v5 reset];
    [a1 startAuthenticationForExistingPrimaryPlayerUponReturnToForeground:1];
  }
  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 addObserver:a1 selector:sel_sharePlayEligibilityChanged_ name:*MEMORY[0x263F40110] object:0];
}

- (void)sharePlayEligibilityChanged:()AuthenticationPrivate
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"isEligibleForGroupSession"];
  int v6 = [v5 BOOLValue];

  if (v6 && ([a1 isAuthenticated] & 1) == 0)
  {
    if (!*MEMORY[0x263F40328]) {
      id v7 = (id)GKOSLoggers();
    }
    char v8 = *MEMORY[0x263F40340];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40340], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_22600C000, v8, OS_LOG_TYPE_INFO, "SharePlay is eligible. Calling startAuthenticationForExistingPrimaryPlayer.", v9, 2u);
    }
    [a1 startAuthenticationForExistingPrimaryPlayer];
  }
}

- (void)applicationDidEnterBackground:()AuthenticationPrivate
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 removeObserver:a1 name:*MEMORY[0x263F40110] object:0];

  id v3 = [MEMORY[0x263F087C8] defaultCenter];
  [v3 postNotificationName:@"GameControllerNavigation_GKGameBackgrounded" object:0 userInfo:0 deliverImmediately:1];
}

- (void)_showViewControllerForLegacyApps:()AuthenticationPrivate
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F40298] shared];
  if ([v5 isAccountModificationRestricted])
  {
LABEL_18:

    goto LABEL_19;
  }
  char v6 = [MEMORY[0x263F401D8] isGameCenter];

  if ((v6 & 1) == 0)
  {
    id v7 = v4;
    objc_opt_class();
    id v5 = v7;
    if (objc_opt_isKindOfClass())
    {
      id v5 = [v7 visibleViewController];
    }
    objc_opt_respondsToSelector();
    char v8 = [a1 rootViewController];
    id v9 = [MEMORY[0x263F1C408] sharedApplication];
    v10 = [v9 windows];
    v11 = [v10 firstObject];

    if (!v11)
    {
      char v12 = [MEMORY[0x263F1C408] sharedApplication];
      v11 = [v12 keyWindow];
    }
    v13 = [v11 rootViewController];
    id v14 = v11;
    id v15 = [v14 rootViewController];

    if (v15)
    {
      id v16 = [v14 rootViewController];
      id v17 = [v16 view];
    }
    else
    {
      objc_opt_class();
      id v17 = v14;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_12:
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __73__GKLocalPlayer_AuthenticationPrivate___showViewControllerForLegacyApps___block_invoke;
        v26[3] = &unk_26478A310;
        id v18 = v14;
        id v27 = v18;
        v28 = a1;
        id v29 = v7;
        id v19 = v17;
        id v30 = v19;
        id v20 = (void (**)(void, void))MEMORY[0x22A644A10](v26);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v21 = [v8 presentedViewController];

          if (v21)
          {
            v23[0] = MEMORY[0x263EF8330];
            v23[1] = 3221225472;
            v23[2] = __73__GKLocalPlayer_AuthenticationPrivate___showViewControllerForLegacyApps___block_invoke_2;
            v23[3] = &unk_26478A338;
            v25 = v20;
            id v24 = v8;
            [v24 dismissViewControllerAnimated:1 completion:v23];
          }
          else
          {
            ((void (**)(void, void *))v20)[2](v20, v8);
          }
        }
        else
        {
          id v22 = objc_alloc_init(MEMORY[0x263F1CC90]);
          ((void (**)(void, id))v20)[2](v20, v22);
        }
        goto LABEL_18;
      }
      id v17 = [v13 view];
      id v16 = v14;
    }

    goto LABEL_12;
  }
LABEL_19:
}

- (void)startLegacyAuthenticationWithCompletionHandler:()AuthenticationPrivate
{
  id v4 = a3;
  id v5 = [a1 authenticateHandler];

  objc_initWeak(&location, a1);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __87__GKLocalPlayer_AuthenticationPrivate__startLegacyAuthenticationWithCompletionHandler___block_invoke;
  v9[3] = &unk_26478A360;
  objc_copyWeak(&v11, &location);
  id v6 = v4;
  id v10 = v6;
  [a1 setAuthenticateHandler:v9];
  if (v5)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __87__GKLocalPlayer_AuthenticationPrivate__startLegacyAuthenticationWithCompletionHandler___block_invoke_2;
    block[3] = &unk_26478A338;
    block[4] = a1;
    id v8 = v6;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)dismissOnboardingUIIfPresent
{
  id v0 = [MEMORY[0x263F40270] local];
  uint64_t v1 = [v0 signInViewController];

  if (v1)
  {
    id v3 = [MEMORY[0x263F40270] local];
    id v2 = [v3 signInViewController];
    [v2 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)authenticationDidCompleteWithError:()AuthenticationPrivate signInOrigin:uponReturnToForeground:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22600C000, a2, OS_LOG_TYPE_ERROR, "reportAuthenticationFailedForPlayer: Authentication failed for player in %g seconds", (uint8_t *)&v2, 0xCu);
}

- (void)authenticationDidCompleteWithError:()AuthenticationPrivate signInOrigin:uponReturnToForeground:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  _os_log_debug_impl(&dword_22600C000, v0, OS_LOG_TYPE_DEBUG, "authenticationDidCompleteWithError: didn't find a player to log in", v1, 2u);
}

- (void)authenticationDidCompleteWithError:()AuthenticationPrivate signInOrigin:uponReturnToForeground:.cold.3(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 description];
  int v5 = 138412290;
  id v6 = v4;
  _os_log_error_impl(&dword_22600C000, v3, OS_LOG_TYPE_ERROR, "authenticationDidCompleteWithError: Authentication failed for player with error: %@", (uint8_t *)&v5, 0xCu);
}

- (void)authenticationDidCompleteWithError:()AuthenticationPrivate signInOrigin:uponReturnToForeground:.cold.4()
{
  OUTLINED_FUNCTION_0_1();
  _os_log_debug_impl(&dword_22600C000, v0, OS_LOG_TYPE_DEBUG, "authenticationDidCompleteWithError: Error: No Internet Connection - will work offline if already authenticated", v1, 2u);
}

@end