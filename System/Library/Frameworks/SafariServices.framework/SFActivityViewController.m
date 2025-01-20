@interface SFActivityViewController
@end

@implementation SFActivityViewController

void __94___SFActivityViewController_initWithActivityItems_applicationActivities_sharingURL_sourceURL___block_invoke(uint64_t a1, void *a2, unsigned int a3, void *a4, uint64_t a5)
{
  v8 = (id *)(a1 + 32);
  id v9 = a4;
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained(v8);
  id v13 = WeakRetained;
  if (a5) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = a3;
  }
  [WeakRetained activityDidComplete:v10 withReturnedItems:v9 success:v12];
}

void __45___SFActivityViewController__executeActivity__block_invoke(uint64_t a1, int a2)
{
  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    v4 = *(void **)(*(void *)(a1 + 40) + 1408);
    id v5 = v3;
    v6 = [v4 printInteractionController];
    [v5 setPrintInteractionController:v6];

    v7.receiver = *(id *)(a1 + 40);
    v7.super_class = (Class)_SFActivityViewController;
    objc_msgSendSuper2(&v7, sel__executeActivity);
  }
  else
  {
    [v3 activityDidFinish:0];
  }
}

uint64_t __54___SFActivityViewController__preparePrint_completion___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return [*(id *)(a1 + 32) activityDidFinish:0];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __64___SFActivityViewController__extensionItemForExtensionActivity___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  objc_super v7 = [a4 valueForKey:@"extraArguments"];
  if (v7)
  {
    v8 = [*(id *)(a1 + 32) _plugIn];
    id v9 = [v8 entitlements];
    char v10 = objc_msgSend(v9, "safari_BOOLForKey:", @"com.apple.private.Safari.can-pass-extension-parameters");

    v11 = WBS_LOG_CHANNEL_PREFIXExtensions();
    uint64_t v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A690B000, v12, OS_LOG_TYPE_DEFAULT, "Adding extraArguments to NSExtensionItem", buf, 2u);
      }
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __64___SFActivityViewController__extensionItemForExtensionActivity___block_invoke_cold_1((void **)(a1 + 32), v12);
      }

      objc_super v7 = 0;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 1360));
  v14 = [*(id *)(a1 + 32) identifier];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __64___SFActivityViewController__extensionItemForExtensionActivity___block_invoke_76;
  v16[3] = &unk_1E5C737F8;
  id v17 = v6;
  id v15 = v6;
  [WeakRetained runJavaScriptForSharingExtension:v14 extraArguments:v7 completion:v16];
}

void __64___SFActivityViewController__extensionItemForExtensionActivity___block_invoke_76(uint64_t a1, void *a2, void *a3)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v8 = *MEMORY[0x1E4F282A8];
    v9[0] = v5;
    objc_super v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  }
  else
  {
    objc_super v7 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __82___SFActivityViewController__processJavaScriptFinalizeReturnedItems_forExtension___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v13 = v5;
  id v7 = v6;
  if (v7)
  {
    uint64_t v8 = 0;
  }
  else
  {
    id v9 = v13;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v8 = objc_msgSend(v9, "safari_dictionaryForKey:", *MEMORY[0x1E4F282A0]);
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1360));
  v11 = WeakRetained;
  if (v8) {
    uint64_t v12 = v8;
  }
  else {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  [WeakRetained finalizeJavaScriptForSharingExtension:*(void *)(a1 + 40) arguments:v12];
}

void __64___SFActivityViewController__extensionItemForExtensionActivity___block_invoke_cold_1(void **a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = *a1;
  v3 = a2;
  v4 = [v2 identifier];
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_1A690B000, v3, OS_LOG_TYPE_ERROR, "Not allowing extraArguments to be passed to JavaScript of extension '%{public}@' due to missing entitlement", (uint8_t *)&v5, 0xCu);
}

@end