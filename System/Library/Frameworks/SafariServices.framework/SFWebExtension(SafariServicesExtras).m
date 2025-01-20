@interface SFWebExtension(SafariServicesExtras)
- (void)_loadToolbarItem;
- (void)_unloadToolbarItem;
- (void)_validateToolbarItemInAllWindows;
@end

@implementation SFWebExtension(SafariServicesExtras)

- (void)_loadToolbarItem
{
  v2 = [[SFWebExtensionPageMenuController alloc] initWithExtension:a1];
  [a1 setToolbarItem:v2];
}

- (void)_unloadToolbarItem
{
  id v1 = [a1 toolbarItem];
  [v1 dismissPopupImmediatelyIfNecessary];
}

- (void)_validateToolbarItemInAllWindows
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [a1 showOrHidePermissionRequestBannerIfNeeded];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v2 = objc_msgSend(a1, "extensionsController", 0);
  v3 = [v2 _allWindowsForWebExtension:a1];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) validateToolbarItemForExtension:a1];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

@end