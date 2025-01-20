@interface SFSettingsAuthentication
@end

@implementation SFSettingsAuthentication

uint64_t __96___SFSettingsAuthentication_authenticateForSettings_allowAuthenticationReuse_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setHasBeenAuthenticated:", objc_msgSend(*(id *)(a1 + 40), "code") == -5);
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = [*(id *)(a1 + 32) hasBeenAuthenticated];
  uint64_t v4 = *(void *)(a1 + 40);
  v5 = *(uint64_t (**)(uint64_t, uint64_t, void, uint64_t))(v2 + 16);

  return v5(v2, v3, 0, v4);
}

void __96___SFSettingsAuthentication_authenticateForSettings_allowAuthenticationReuse_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96___SFSettingsAuthentication_authenticateForSettings_allowAuthenticationReuse_completionHandler___block_invoke_3;
  block[3] = &unk_1E5C76EE0;
  id v7 = v4;
  id v8 = *(id *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __96___SFSettingsAuthentication_authenticateForSettings_allowAuthenticationReuse_completionHandler___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 40) setHasBeenAuthenticated:*(void *)(a1 + 32) == 0];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

void __123___SFSettingsAuthentication_pushSettingsAfterAuthentication_onBehalfOfViewController_resourceDictionary_completionHandler___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v15 = a4;
  if (a2)
  {
    id v7 = [*(id *)(a1 + 32) navigationController];
    id v8 = [v7 viewControllers];
    id v9 = (void *)[v8 mutableCopy];

    [v9 addObject:*(void *)(a1 + 40)];
    if (!*(void *)(a1 + 48)) {
      goto LABEL_10;
    }
    if (objc_opt_respondsToSelector())
    {
      v10 = [*(id *)(a1 + 40) additionalViewControllersToPushHandlingURLResourceDictionary:*(void *)(a1 + 48) didAuthenticate:a3];
      if (v10) {
        [v9 addObjectsFromArray:v10];
      }
    }
    v11 = *(void **)(a1 + 48);
    if (v11)
    {
      if (a3) {
        uint64_t IsPad = objc_msgSend(v11, "safari_BOOLForKey:", @"animate");
      }
      else {
        uint64_t IsPad = _SFDeviceIsPad();
      }
      uint64_t v13 = IsPad;
    }
    else
    {
LABEL_10:
      uint64_t v13 = 1;
    }
    v14 = [*(id *)(a1 + 32) navigationController];
    [v14 setViewControllers:v9 animated:v13];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

@end