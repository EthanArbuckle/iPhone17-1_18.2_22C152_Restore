@interface GKLocalPlayer
@end

@implementation GKLocalPlayer

void __67__GKLocalPlayer_Photos__setPhoto_avatarType_withCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  if (v2)
  {
    [v3 clearInMemoryCachedAvatars];
    v28 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:4];
    v4 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:4];
    v5 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:4];
    uint64_t v27 = a1;
    v6 = [*(id *)(a1 + 40) internal];
    v7 = [v6 playerID];
    v8 = GKAvatarSubdirectoryNameForPlayerID();

    for (uint64_t i = 0; i != 4; ++i)
    {
      uint64_t v10 = qword_1AF7CABE0[i];
      v11 = GKImageURLKeyForSize();
      objc_msgSend(v2, "_gkImageByScalingToSize:scale:", (double)v10, (double)v10, 1.0);
      v12 = (UIImage *)objc_claimAutoreleasedReturnValue();
      [v28 setObject:v12 forKey:v11];
      UIImagePNGRepresentation(v12);
      v14 = v13 = v2;
      [v4 setObject:v14 forKey:v11];

      v15 = [MEMORY[0x1E4F63A10] sharedTheme];
      v16 = [v15 avatarSourceWithDimension:v10];

      v17 = [v16 keyForImageIdentifier:v8];
      v18 = [v17 basename];
      [v5 setObject:v18 forKeyedSubscript:v11];

      id v2 = v13;
    }
    [v5 setObject:@"temporaryTemplateAvatar.tmp" forKeyedSubscript:@"template"];
    v19 = [MEMORY[0x1E4F1C9B8] data];
    [v4 setObject:v19 forKey:@"template"];

    v20 = [*(id *)(v27 + 40) daemonProxy];
    v21 = [v20 profileServicePrivate];

    v22 = [NSNumber numberWithInteger:*(void *)(v27 + 56)];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __67__GKLocalPlayer_Photos__setPhoto_avatarType_withCompletionHandler___block_invoke_2;
    v29[3] = &unk_1E5F638E8;
    id v30 = v21;
    id v23 = v13;
    v24 = *(void **)(v27 + 48);
    uint64_t v34 = *(void *)(v27 + 56);
    uint64_t v25 = *(void *)(v27 + 40);
    id v31 = v23;
    uint64_t v32 = v25;
    id v33 = v24;
    id v26 = v21;
    [v26 cachePhotos:v4 avatarType:v22 fileNames:v5 handler:v29];
  }
  else
  {
    [v3 deletePhotoWithCompletionHandler:*(void *)(a1 + 48)];
  }
}

void __67__GKLocalPlayer_Photos__setPhoto_avatarType_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3 = UIImagePNGRepresentation(*(UIImage **)(a1 + 40));
  v4 = [NSNumber numberWithInteger:*(void *)(a1 + 64)];
  [v2 setPhotoData:v3 avatarType:v4 handler:&__block_literal_global_9];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__GKLocalPlayer_Photos__setPhoto_avatarType_withCompletionHandler___block_invoke_4;
  v6[3] = &unk_1E5F638C0;
  v5 = *(void **)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v5 loadProfileWithCompletionHandler:v6];
}

uint64_t __67__GKLocalPlayer_Photos__setPhoto_avatarType_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __89__GKLocalPlayer_Photos__setPhotoFromCNContactImage_pendingContact_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) imageData];
  if (!v4) {
    goto LABEL_6;
  }
  v5 = (void *)v4;
  v6 = (void *)MEMORY[0x1E4FB1818];
  id v7 = [*(id *)(a1 + 32) imageData];
  id v8 = [v6 _gkImageWithCheckedData:v7];

  if (v8)
  {
    if ([*(id *)(a1 + 40) source] == 1 || objc_msgSend(*(id *)(a1 + 40), "source") == 4)
    {
      uint64_t v9 = 1;
    }
    else
    {
      id v12 = v8;
      v13 = (CGImage *)[v12 CGImage];
      [*(id *)(a1 + 40) cropRect];
      v14 = CGImageCreateWithImageInRect(v13, v22);
      id v8 = (id)[objc_alloc(MEMORY[0x1E4FB1818]) initWithCGImage:v14];

      CGImageRelease(v14);
      uint64_t v9 = 2;
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __89__GKLocalPlayer_Photos__setPhotoFromCNContactImage_pendingContact_withCompletionHandler___block_invoke_2;
    v19[3] = &unk_1E5F63938;
    v15 = *(void **)(a1 + 48);
    id v20 = *(id *)(a1 + 56);
    id v21 = v3;
    id v11 = v3;
    [v15 setPhoto:v8 avatarType:v9 withCompletionHandler:v19];
  }
  else
  {
LABEL_6:
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __89__GKLocalPlayer_Photos__setPhotoFromCNContactImage_pendingContact_withCompletionHandler___block_invoke_3;
    v16[3] = &unk_1E5F63938;
    uint64_t v10 = *(void **)(a1 + 48);
    id v17 = *(id *)(a1 + 56);
    id v18 = v3;
    id v8 = v3;
    [v10 deletePhotoWithCompletionHandler:v16];

    id v11 = v17;
  }
}

uint64_t __89__GKLocalPlayer_Photos__setPhotoFromCNContactImage_pendingContact_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setError:a2];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

uint64_t __89__GKLocalPlayer_Photos__setPhotoFromCNContactImage_pendingContact_withCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setError:a2];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

void __89__GKLocalPlayer_Photos__setPhotoFromCNContactImage_pendingContact_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __52__GKLocalPlayer_Photos__deleteMonogramsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x1E4F63A10] sharedTheme];
  v5 = [v4 monogramSourceWithDimension:*(void *)(a1 + 40)];

  uint64_t v6 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__GKLocalPlayer_Photos__deleteMonogramsWithHandler___block_invoke_2;
  v8[3] = &unk_1E5F639B0;
  id v9 = v3;
  id v7 = v3;
  [v5 deleteImageUsingGamedWithSubdirectory:v6 withHandler:v8];
}

uint64_t __52__GKLocalPlayer_Photos__deleteMonogramsWithHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __52__GKLocalPlayer_Photos__deleteMonogramsWithHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__GKLocalPlayer_Photos__deleteMonogramsWithHandler___block_invoke_4;
  v6[3] = &unk_1E5F638C0;
  id v7 = v3;
  id v5 = v3;
  [v4 deletePhotoWithCompletionHandler:v6];
}

void __52__GKLocalPlayer_Photos__deleteMonogramsWithHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v4 = (id)GKOSLoggers();
    }
    id v5 = *MEMORY[0x1E4F63850];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
      __52__GKLocalPlayer_Photos__deleteMonogramsWithHandler___block_invoke_4_cold_1((uint64_t)v3, v5);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __52__GKLocalPlayer_Photos__deleteMonogramsWithHandler___block_invoke_19(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __88__GKLocalPlayer_AuthenticationExtras__showSignInBannerForLocalPlayer_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5) {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  }
  if (![v5 integerValueFromKey:*MEMORY[0x1E4F63658] defaultValue:0]) {
    goto LABEL_7;
  }
  if (objc_msgSend(a1[4], "didShowWelcomeBannerInOverlayWithNewUserState:uponReturnToForeground:", objc_msgSend(a1[4], "isNewToGameCenter"), 0))
  {
    [MEMORY[0x1E4F639A0] didShowBanner];
    id v7 = [MEMORY[0x1E4F636C8] proxyForLocalPlayer];
    id v8 = [v7 accountService];
    [v8 didShowSignInBanner];

    (*((void (**)(void))a1[6] + 2))();
    goto LABEL_13;
  }
  if (([a1[4] isBannerVisible] & 1) == 0)
  {
    uint64_t v10 = +[GKAccessPoint shared];
    int v9 = [v10 isActive] ^ 1;
  }
  else
  {
LABEL_7:
    int v9 = 0;
  }
  id v11 = objc_msgSend(MEMORY[0x1E4F63998], "SIGN_IN_BANNER_TITLE");
  if (v9)
  {
    id v12 = a1[4];
    v13 = objc_msgSend(MEMORY[0x1E4F63998], "SIGN_IN_BANNER_SUBTITLE");
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __88__GKLocalPlayer_AuthenticationExtras__showSignInBannerForLocalPlayer_completionHandler___block_invoke_2;
    v18[3] = &unk_1E5F62EB0;
    id v19 = a1[5];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __88__GKLocalPlayer_AuthenticationExtras__showSignInBannerForLocalPlayer_completionHandler___block_invoke_3;
    v16[3] = &unk_1E5F63E30;
    void v16[4] = a1[4];
    id v17 = a1[6];
    [v12 showBannerWithTitle:v11 message:v13 touchHandler:v18 completionHandler:v16];

    [MEMORY[0x1E4F639A0] didShowBanner];
    v14 = [MEMORY[0x1E4F636C8] proxyForLocalPlayer];
    v15 = [v14 accountService];
    [v15 didShowSignInBanner];
  }
  else
  {
    (*((void (**)(void))a1[6] + 2))();
  }

LABEL_13:
}

void __88__GKLocalPlayer_AuthenticationExtras__showSignInBannerForLocalPlayer_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F63760] authenticationPersonality];
  [v2 authenticationShowSignInUIForLocalPlayer:*(void *)(a1 + 32) origin:2 dismiss:0];
}

uint64_t __88__GKLocalPlayer_AuthenticationExtras__showSignInBannerForLocalPlayer_completionHandler___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsWelcomeOrSignInBannerEnqueued:0];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void __87__GKLocalPlayer_AuthenticationExtras__showOnboardingUIFromViewController_signInOrigin___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [MEMORY[0x1E4F63760] local];
  [v3 setShouldPreserveOnboardingUI:0];
  objc_msgSend(v3, "setAuthenticated:", objc_msgSend(v2, "gkIsUnauthenticatedError") ^ 1);
  id v4 = [MEMORY[0x1E4F63760] local];
  [v4 showAccessPoint];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __87__GKLocalPlayer_AuthenticationExtras__showOnboardingUIFromViewController_signInOrigin___block_invoke_2;
  v7[3] = &unk_1E5F63350;
  id v8 = v3;
  id v9 = v2;
  id v5 = v2;
  id v6 = v3;
  [v6 removeActiveViewControllerAnimated:1 completionHandler:v7];
}

void __87__GKLocalPlayer_AuthenticationExtras__showOnboardingUIFromViewController_signInOrigin___block_invoke_2(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __87__GKLocalPlayer_AuthenticationExtras__showOnboardingUIFromViewController_signInOrigin___block_invoke_3;
  v3[3] = &unk_1E5F63DB8;
  objc_copyWeak(&v5, &location);
  id v4 = *(id *)(a1 + 40);
  [v2 refreshInternalWithCompletion:v3];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __87__GKLocalPlayer_AuthenticationExtras__showOnboardingUIFromViewController_signInOrigin___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __87__GKLocalPlayer_AuthenticationExtras__showOnboardingUIFromViewController_signInOrigin___block_invoke_4;
  v3[3] = &unk_1E5F63350;
  void v3[4] = WeakRetained;
  id v4 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __87__GKLocalPlayer_AuthenticationExtras__showOnboardingUIFromViewController_signInOrigin___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) callAuthHandlerWithError:*(void *)(a1 + 40)];
}

void __87__GKLocalPlayer_AuthenticationExtras__showOnboardingUIFromViewController_signInOrigin___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F63760] local];
  [v4 setAuthenticated:0];
  uint64_t v5 = [v4 signInViewController];
  id v6 = (void *)v5;
  uint64_t v7 = *MEMORY[0x1E4F63860];
  if (v3 || !v5)
  {
    if (v3)
    {
      if (!v7) {
        id v15 = (id)GKOSLoggers();
      }
      v16 = *MEMORY[0x1E4F63850];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
        __87__GKLocalPlayer_AuthenticationExtras__showOnboardingUIFromViewController_signInOrigin___block_invoke_5_cold_2((uint64_t)v3, v16, v17, v18, v19, v20, v21, v22);
      }
    }
    else
    {
      if (!v7) {
        id v23 = (id)GKOSLoggers();
      }
      v24 = *MEMORY[0x1E4F63850];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
        __87__GKLocalPlayer_AuthenticationExtras__showOnboardingUIFromViewController_signInOrigin___block_invoke_5_cold_1(v24);
      }
    }
  }
  else
  {
    if (!v7) {
      id v8 = (id)GKOSLoggers();
    }
    id v9 = *MEMORY[0x1E4F63878];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63878], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF250000, v9, OS_LOG_TYPE_INFO, "showOnboardingUIFromViewController: Showing Onboarding view controller", buf, 2u);
    }
    uint64_t v10 = [MEMORY[0x1E4FB1438] sharedApplication];
    id v11 = [v10 keyWindow];
    id v12 = [v11 rootViewController];

    dispatch_time_t v13 = dispatch_time(0, 200000000);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __87__GKLocalPlayer_AuthenticationExtras__showOnboardingUIFromViewController_signInOrigin___block_invoke_36;
    v25[3] = &unk_1E5F63350;
    id v26 = v4;
    id v27 = v12;
    id v14 = v12;
    dispatch_after(v13, MEMORY[0x1E4F14428], v25);
  }
}

void __87__GKLocalPlayer_AuthenticationExtras__showOnboardingUIFromViewController_signInOrigin___block_invoke_36(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 signInViewController];
  [v2 showViewController:v3 usingPresentingViewController:*(void *)(a1 + 40) wrapInNavController:0];
}

void __106__GKLocalPlayer_AuthenticationExtras__authenticationShowGreenBuddyUIForLocalPlayer_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&to, (id *)(a1 + 40));
  id v4 = objc_loadWeakRetained(&to);
  [v4 setShowingInGameUI:0];

  uint64_t v5 = [*(id *)(a1 + 32) rootViewController];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) activeViewController];
    id v7 = [v8 presentingViewController];
  }
  id v9 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __106__GKLocalPlayer_AuthenticationExtras__authenticationShowGreenBuddyUIForLocalPlayer_withCompletionHandler___block_invoke_2;
  v12[3] = &unk_1E5F66230;
  id v10 = v7;
  id v13 = v10;
  objc_copyWeak(&v16, &to);
  id v14 = *(id *)(a1 + 32);
  id v11 = v3;
  id v15 = v11;
  [v9 removeActiveViewControllerAnimated:1 completionHandler:v12];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&to);
}

void __106__GKLocalPlayer_AuthenticationExtras__authenticationShowGreenBuddyUIForLocalPlayer_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F63760] local];
  if (![v2 isAuthenticated] || !*(void *)(a1 + 32)) {
    goto LABEL_9;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (([WeakRetained shouldShowOnBoardingUI] & 1) == 0)
  {

LABEL_9:
    goto LABEL_10;
  }
  id v4 = objc_loadWeakRetained((id *)(a1 + 56));
  int v5 = [v4 shouldShowAnyOnboardingScreen];

  if (v5)
  {
    id v8 = objc_loadWeakRetained((id *)(a1 + 56));
    [v8 showOnboardingUIFromViewController:*(void *)(a1 + 32) signInOrigin:0];

    return;
  }
LABEL_10:
  id v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);

  [v6 authenticationDidCompleteWithError:v7];
}

void __106__GKLocalPlayer_AuthenticationExtras__authenticationShowGreenBuddyUIForLocalPlayer_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *MEMORY[0x1E4F63860];
  if (v6)
  {
    if (!v7) {
      id v8 = (id)GKOSLoggers();
    }
    id v9 = *MEMORY[0x1E4F63850];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
      __106__GKLocalPlayer_AuthenticationExtras__authenticationShowGreenBuddyUIForLocalPlayer_withCompletionHandler___block_invoke_3_cold_1((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  else
  {
    if (!v7) {
      id v16 = (id)GKOSLoggers();
    }
    uint64_t v17 = *MEMORY[0x1E4F63880];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63880], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_1AF250000, v17, OS_LOG_TYPE_INFO, "authenticationShowGreenBuddyUIForLocalPlayer:Showing sign in view controller", v20, 2u);
    }
    uint64_t v18 = *(void **)(a1 + 32);
    uint64_t v19 = [*(id *)(a1 + 40) signInViewController];
    [v18 showViewController:v19 usingPresentingViewController:0 wrapInNavController:0];
  }
}

void __95__GKLocalPlayer_AuthenticationExtras__authenticationShowSignInUIForLocalPlayer_origin_dismiss___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&to, a1 + 6);
  id v4 = objc_loadWeakRetained(&to);
  [v4 setShowingInGameUI:0];

  id v5 = [a1[4] rootViewController];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v8 = [a1[4] activeViewController];
    id v7 = [v8 presentingViewController];
  }
  id v9 = a1[4];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __95__GKLocalPlayer_AuthenticationExtras__authenticationShowSignInUIForLocalPlayer_origin_dismiss___block_invoke_2;
  v12[3] = &unk_1E5F662A8;
  id v10 = v7;
  id v13 = v10;
  objc_copyWeak(v17, &to);
  v17[1] = a1[7];
  id v14 = a1[4];
  id v11 = v3;
  id v15 = v11;
  id v16 = a1[5];
  [v9 removeActiveViewControllerAnimated:1 completionHandler:v12];

  objc_destroyWeak(v17);
  objc_destroyWeak(&to);
}

uint64_t __95__GKLocalPlayer_AuthenticationExtras__authenticationShowSignInUIForLocalPlayer_origin_dismiss___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F63760] local];
  if (![v2 isAuthenticated] || !*(void *)(a1 + 32)) {
    goto LABEL_7;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (([WeakRetained shouldShowOnBoardingUI] & 1) == 0)
  {

LABEL_7:
    goto LABEL_8;
  }
  id v4 = objc_loadWeakRetained((id *)(a1 + 64));
  int v5 = [v4 shouldShowAnyOnboardingScreen];

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)(a1 + 64));
    [v6 showOnboardingUIFromViewController:*(void *)(a1 + 32) signInOrigin:*(void *)(a1 + 72)];

    goto LABEL_9;
  }
LABEL_8:
  [*(id *)(a1 + 40) authenticationDidCompleteWithError:*(void *)(a1 + 48) signInOrigin:*(void *)(a1 + 72)];
LABEL_9:
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    id v8 = *(uint64_t (**)(void))(result + 16);
    return v8();
  }
  return result;
}

void __95__GKLocalPlayer_AuthenticationExtras__authenticationShowSignInUIForLocalPlayer_origin_dismiss___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *MEMORY[0x1E4F63860];
  if (v6)
  {
    if (!v7) {
      id v8 = (id)GKOSLoggers();
    }
    id v9 = *MEMORY[0x1E4F63850];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
      __95__GKLocalPlayer_AuthenticationExtras__authenticationShowSignInUIForLocalPlayer_origin_dismiss___block_invoke_3_cold_1((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  else
  {
    if (!v7) {
      id v16 = (id)GKOSLoggers();
    }
    uint64_t v17 = *MEMORY[0x1E4F63880];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63880], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v23 = 0;
      _os_log_impl(&dword_1AF250000, v17, OS_LOG_TYPE_INFO, "authenticationShowSignInUIForLocalPlayer:Showing sign in view controller", v23, 2u);
    }
    uint64_t v18 = [MEMORY[0x1E4FB1438] sharedApplication];
    uint64_t v19 = [v18 keyWindow];
    uint64_t v20 = [v19 rootViewController];

    uint64_t v21 = *(void **)(a1 + 32);
    uint64_t v22 = [v21 signInViewController];
    [v21 showViewController:v22 usingPresentingViewController:v20 wrapInNavController:0];
  }
}

uint64_t __53__GKLocalPlayer_Friends__sendFriendInviteTo_groupId___block_invoke(uint64_t result, uint64_t a2, void *a3, uint64_t a4)
{
  if (a2 && !a4)
  {
    uint64_t v5 = result;
    id v6 = *(void **)(result + 32);
    id v7 = a3;
    [v6 setObject:a2 forKeyedSubscript:@"friendCode"];
    [*(id *)(v5 + 32) setObject:v7 forKeyedSubscript:@"friendUrl"];

    uint64_t v9 = *(void *)(v5 + 32);
    id v8 = *(void **)(v5 + 40);
    uint64_t v10 = *(void *)(v5 + 48);
    uint64_t v11 = *(void *)(v5 + 56);
    return [v8 openMessagesWith:v9 recipient:v10 groupId:v11];
  }
  return result;
}

void __61__GKLocalPlayer_Friends__openMessagesWith_recipient_groupId___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (v5)
  {
    id v6 = (NSObject **)MEMORY[0x1E4F63860];
    id v7 = *MEMORY[0x1E4F63860];
    if (!*MEMORY[0x1E4F63860])
    {
      id v8 = (id)GKOSLoggers();
      id v7 = *v6;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1AF250000, v7, OS_LOG_TYPE_DEFAULT, "error opening friend request url", v9, 2u);
    }
  }
}

void __52__GKLocalPlayer_Photos__deleteMonogramsWithHandler___block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AF250000, a2, OS_LOG_TYPE_ERROR, "Error deleting monogram image for local player %@", (uint8_t *)&v2, 0xCu);
}

void __87__GKLocalPlayer_AuthenticationExtras__showOnboardingUIFromViewController_signInOrigin___block_invoke_5_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1AF250000, log, OS_LOG_TYPE_ERROR, "showOnboardingUIFromViewController: Failed to set up remote for Onboarding view controller because localPlayer.signInViewController was nil", v1, 2u);
}

void __87__GKLocalPlayer_AuthenticationExtras__showOnboardingUIFromViewController_signInOrigin___block_invoke_5_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __106__GKLocalPlayer_AuthenticationExtras__authenticationShowGreenBuddyUIForLocalPlayer_withCompletionHandler___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __95__GKLocalPlayer_AuthenticationExtras__authenticationShowSignInUIForLocalPlayer_origin_dismiss___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end