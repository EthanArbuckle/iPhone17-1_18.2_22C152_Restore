@interface SFTranslationTargetLocaleAlertController
@end

@implementation SFTranslationTargetLocaleAlertController

void __73___SFTranslationTargetLocaleAlertController__setUpWithLocaleIdentifiers___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v3 = [WeakRetained delegate];
    if (objc_opt_respondsToSelector())
    {
      [v3 translationAlertController:v5 didSelectLocale:*(void *)(a1 + 32)];
      uint64_t v4 = v5[166];
      if (v4) {
        (*(void (**)(uint64_t, void))(v4 + 16))(v4, *(void *)(a1 + 32));
      }
    }

    WeakRetained = v5;
  }
}

uint64_t __73___SFTranslationTargetLocaleAlertController__setUpWithLocaleIdentifiers___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = [WeakRetained delegate];
    if (objc_opt_respondsToSelector()) {
      uint64_t v4 = [v3 translationAlertControllerShouldDismissAfterSelection:v2];
    }
    else {
      uint64_t v4 = 1;
    }
  }
  else
  {
    uint64_t v4 = 1;
  }

  return v4;
}

void __73___SFTranslationTargetLocaleAlertController__setUpWithLocaleIdentifiers___block_invoke_3(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __73___SFTranslationTargetLocaleAlertController__setUpWithLocaleIdentifiers___block_invoke_4;
  v3[3] = &unk_1E5C72988;
  id v4 = *(id *)(a1 + 32);
  char v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __73___SFTranslationTargetLocaleAlertController__setUpWithLocaleIdentifiers___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setEnabled:*(unsigned __int8 *)(a1 + 40)];
}

void __73___SFTranslationTargetLocaleAlertController__setUpWithLocaleIdentifiers___block_invoke_5(uint64_t a1)
{
  [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=General&path=INTERNATIONAL"];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v2 openSensitiveURL:v4 withOptions:0];

  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 1328);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
}

void __73___SFTranslationTargetLocaleAlertController__setUpWithLocaleIdentifiers___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained delegate];
    if (objc_opt_respondsToSelector()) {
      [v2 translationAlertController:v3 didSelectLocale:0];
    }

    id WeakRetained = v3;
  }
}

void __77___SFTranslationTargetLocaleAlertController_translationAvailabilityDidChange__block_invoke(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77___SFTranslationTargetLocaleAlertController_translationAvailabilityDidChange__block_invoke_2;
  block[3] = &unk_1E5C74378;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  block[4] = *(void *)(a1 + 32);
  char v6 = a2;
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v5);
}

void __77___SFTranslationTargetLocaleAlertController_translationAvailabilityDidChange__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v3 = [WeakRetained[167] objectForKeyedSubscript:*(void *)(a1 + 32)];
    id v4 = v3;
    if (v3) {
      [v3 setEnabled:*(unsigned __int8 *)(a1 + 48)];
    }

    id WeakRetained = v5;
  }
}

void __79___SFTranslationTargetLocaleAlertController__translationAvailabilityDidChange___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) object];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 1312));

  if (v2 == WeakRetained)
  {
    id v5 = [*(id *)(a1 + 32) userInfo];
    id v4 = objc_msgSend(v5, "safari_stringForKey:", *MEMORY[0x1E4F99738]);
    if ([v4 length]) {
      [*(id *)(a1 + 40) translationAvailabilityDidChange];
    }
  }
}

@end