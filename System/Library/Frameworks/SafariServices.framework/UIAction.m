@interface UIAction
@end

@implementation UIAction

void __67__UIAction_SafariServicesExtras__safari_actionWithTarget_selector___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained || *(unsigned char *)(a1 + 48))
  {
    v4 = [MEMORY[0x1E4FB1438] sharedApplication];
    uint64_t v5 = *(void *)(a1 + 40);
    v6 = [v7 sender];
    [v4 sendAction:v5 to:WeakRetained from:v6 forEvent:0];
  }
}

uint64_t __68__UIAction_SafariServicesExtras___sf_openInNewTabActionWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __94__UIAction_SafariServicesExtras___sf_openInNewTabActionWithTabOrder_handler_identifierSuffix___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __74__UIAction_SafariServicesExtras___sf_debugKillWebProcessActionForWebView___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _killWebContentProcess];
}

@end