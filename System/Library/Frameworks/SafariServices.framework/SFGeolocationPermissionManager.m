@interface SFGeolocationPermissionManager
@end

@implementation SFGeolocationPermissionManager

void __48___SFGeolocationPermissionManager_sharedManager__block_invoke()
{
  v0 = [_SFGeolocationPermissionManager alloc];
  id v3 = [MEMORY[0x1E4F98CD8] sharedStore];
  uint64_t v1 = [(WBSGeolocationPreferenceManager *)v0 initWithPerSitePreferencesStore:v3];
  v2 = (void *)sharedManager_instance;
  sharedManager_instance = v1;
}

void __114___SFGeolocationPermissionManager_requestPermissionForURL_frame_dialogPresenter_browserPersona_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  switch(a2)
  {
    case 0:
      goto LABEL_4;
    case 1:
    case 3:
      id v11 = *(id *)(a1 + 64);
      WBSRespondWithRandomDelay();
      id v3 = v11;
      goto LABEL_8;
    case 2:
    case 4:
      if ([MEMORY[0x1E4F98F60] isLockdownModeEnabledForSafari])
      {
LABEL_4:
        v4 = *(void **)(a1 + 32);
        uint64_t v5 = *(void *)(a1 + 40);
        uint64_t v6 = *(void *)(a1 + 48);
        uint64_t v7 = *(void *)(a1 + 56);
        uint64_t v9 = *(void *)(a1 + 64);
        uint64_t v8 = *(void *)(a1 + 72);
        [v4 _showDialogRequestingPermissionForURL:v5 frame:v6 dialogPresenter:v7 browserPersona:v8 completionHandler:v9];
      }
      else
      {
        id v10 = *(id *)(a1 + 64);
        WBSRespondWithRandomDelay();
        id v3 = v10;
LABEL_8:
      }
      return;
    default:
      return;
  }
}

uint64_t __114___SFGeolocationPermissionManager_requestPermissionForURL_frame_dialogPresenter_browserPersona_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __114___SFGeolocationPermissionManager_requestPermissionForURL_frame_dialogPresenter_browserPersona_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __128___SFGeolocationPermissionManager__showDialogRequestingPermissionForURL_frame_dialogPresenter_browserPersona_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  int v2 = a2;
  [*(id *)(a1 + 32) didCompletePermissionDialog:a2];
  v4 = [*(id *)(a1 + 40) webView];
  if (objc_msgSend(v4, "webui_privateBrowsingEnabled"))
  {
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 48);

    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 48);
      uint64_t v7 = *(void **)(*(void *)(a1 + 56) + 48);
      if (v2) {
        [v7 didAuthorizeGeolocationForPromptInfo:v6];
      }
      else {
        [v7 didDenyGeolocationForPromptInfo:v6];
      }
    }
  }
  uint64_t v8 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);

  return v8();
}

void __128___SFGeolocationPermissionManager__showDialogRequestingPermissionForURL_frame_dialogPresenter_browserPersona_completionHandler___block_invoke_2(uint64_t a1, char a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) securityOrigin];
    objc_msgSend(v3, "safari_userVisibleName");
    id v6 = (id)objc_claimAutoreleasedReturnValue();

    v4 = objc_msgSend(MEMORY[0x1E4F78270], "websiteLocationDialogForURL:originUserVisibleName:preciseLocation:browserPersona:completionHandler:", *(void *)(a1 + 40), v6, objc_msgSend(*(id *)(a1 + 48), "hasPreciseLocationPermission"), *(void *)(a1 + 72), *(void *)(a1 + 64));
    [*(id *)(a1 + 56) presentDialog:v4 sender:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v5();
  }
}

@end