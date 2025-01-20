@interface SFPerSitePreferencesPopoverViewController
@end

@implementation SFPerSitePreferencesPopoverViewController

SFPerSiteSetting *__61___SFPerSitePreferencesPopoverViewController_pageMenuSection__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [SFPerSiteSetting alloc];
  v5 = [*(id *)(*(void *)(a1 + 32) + 1032) managerForPreference:v3];
  v6 = [(SFPerSiteSetting *)v4 initWithPreference:v3 manager:v5 domain:*(void *)(*(void *)(a1 + 32) + 1024)];

  return v6;
}

void __80___SFPerSitePreferencesPopoverViewController__setPreferenceValue_forPreference___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && a2)
  {
    id v6 = WeakRetained;
    id v5 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_34);
    }

    id WeakRetained = v6;
  }
}

uint64_t __80___SFPerSitePreferencesPopoverViewController__setPreferenceValue_forPreference___block_invoke_2()
{
  return objc_msgSend(MEMORY[0x1E4F28C40], "_sf_postPerSitePreferencesDidChangeDistributedNotification");
}

void __78___SFPerSitePreferencesPopoverViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78___SFPerSitePreferencesPopoverViewController_tableView_cellForRowAtIndexPath___block_invoke_2;
    block[3] = &unk_1E5C72350;
    block[4] = WeakRetained;
    id v7 = v3;
    id v8 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __78___SFPerSitePreferencesPopoverViewController_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didRetrieveValue:*(void *)(a1 + 40) forPreference:*(void *)(a1 + 48)];
}

uint64_t __80___SFPerSitePreferencesPopoverViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) beginUpdates];
  [*(id *)(a1 + 32) reloadRowsAtIndexPaths:*(void *)(a1 + 40) withRowAnimation:5];
  v2 = *(void **)(a1 + 32);

  return [v2 endUpdates];
}

uint64_t __87___SFPerSitePreferencesPopoverViewController_switchTableViewCell_didChangeSwitchState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSwitchOn:1];
}

void __87___SFPerSitePreferencesPopoverViewController_switchTableViewCell_didChangeSwitchState___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 48);
  id v3 = *(id **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = [v3[129] managerForPreference:v4];
  id v5 = +[_SFPerSitePreferencesUtilities preferenceValueForBoolValue:v2 preference:v4 preferenceManager:v6];
  [v3 _setPreferenceValue:v5 forPreference:*(void *)(a1 + 40)];
}

@end