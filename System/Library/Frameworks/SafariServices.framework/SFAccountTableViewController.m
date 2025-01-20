@interface SFAccountTableViewController
@end

@implementation SFAccountTableViewController

void __80___SFAccountTableViewController__shareSavedAccount_modalPresentationSourceView___block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  if (a2)
  {
    [*(id *)(a1 + 32) _shareSavedAccount:*(void *)(a1 + 40) authenticationContext:*(void *)(a1 + 48) modalPresentationSourceView:*(void *)(a1 + 56)];
  }
  else
  {
    v7 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __80___SFAccountTableViewController__shareSavedAccount_modalPresentationSourceView___block_invoke_cold_1(v7, v6);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 1040) = 0;
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 postNotificationName:@"_SFShowAccountManagerLockedViewIfNeededNotification" object:0];
  }
}

void __102___SFAccountTableViewController__shareSavedAccount_authenticationContext_modalPresentationSourceView___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    v4 = [MEMORY[0x1E4F98DF8] sharedStore];
    [v4 _updateLastOneTimeShareDateforSavedAccountIfNeeded:*(void *)(a1 + 32)];
  }
  *(unsigned char *)(*(void *)(a1 + 40) + 1040) = 0;
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"_SFShowAccountManagerLockedViewIfNeededNotification" object:0];
}

void __79___SFAccountTableViewController__allSharedCredentialGroupsMenuForSavedAccount___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && !*(unsigned char *)(a1 + 48))
  {
    id v3 = WeakRetained;
    [WeakRetained presentConfirmationAlertToShareSavedAccount:*(void *)(a1 + 32) toGroup:0];
    id WeakRetained = v3;
  }
}

void __79___SFAccountTableViewController__allSharedCredentialGroupsMenuForSavedAccount___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && !*(unsigned char *)(a1 + 56))
  {
    id v3 = WeakRetained;
    [WeakRetained presentConfirmationAlertToShareSavedAccount:*(void *)(a1 + 32) toGroup:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

uint64_t __72___SFAccountTableViewController__contextMenuForSavedAccountAtIndexPath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "safari_copyUserName");
}

uint64_t __72___SFAccountTableViewController__contextMenuForSavedAccountAtIndexPath___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "safari_copyPassword");
}

uint64_t __72___SFAccountTableViewController__contextMenuForSavedAccountAtIndexPath___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "safari_copyOneTimeCode");
}

uint64_t __72___SFAccountTableViewController__contextMenuForSavedAccountAtIndexPath___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "safari_copyWebsite");
}

void __72___SFAccountTableViewController__contextMenuForSavedAccountAtIndexPath___block_invoke_5(uint64_t a1, void (**a2)(void, void))
{
  v4 = (id *)(a1 + 40);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v6 = [WeakRetained _allSharedCredentialGroupsMenuForSavedAccount:*(void *)(a1 + 32)];
  ((void (**)(void, void *))a2)[2](v5, v6);
}

void __72___SFAccountTableViewController__contextMenuForSavedAccountAtIndexPath___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained presentSharedAccountGroupCreationFlowWithSavedAccountToAddToNewlyCreatedGroup:*(void *)(a1 + 32)];
}

void __72___SFAccountTableViewController__contextMenuForSavedAccountAtIndexPath___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _shareSavedAccount:*(void *)(a1 + 32) modalPresentationSourceView:*(void *)(a1 + 40)];
}

void __72___SFAccountTableViewController__contextMenuForSavedAccountAtIndexPath___block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleContextMenuDeleteForIndexPath:*(void *)(a1 + 32)];
}

id __91___SFAccountTableViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained _contextMenuForSavedAccountAtIndexPath:*(void *)(a1 + 32)];

  return v3;
}

void __71___SFAccountTableViewController_iconDidUpdateForDomain_iconController___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) handleIconDidUpdateForDomain:*(void *)(a1 + 40)];
  if ([*(id *)(*(void *)(a1 + 32) + 1024) containsObject:*(void *)(a1 + 40)])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v2 = objc_msgSend(*(id *)(a1 + 32), "tableView", 0);
    id v3 = [v2 visibleCells];

    uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(v3);
          }
          v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ([v8 conformsToProtocol:&unk_1EFC4F958])
          {
            id v9 = v8;
            v10 = [v9 savedAccount];
            v11 = [v10 highLevelDomain];
            int v12 = [v11 isEqualToString:*(void *)(a1 + 40)];

            if (v12) {
              [*(id *)(a1 + 32) _updateIconForDomain:*(void *)(a1 + 40) forCell:v9];
            }
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v5);
    }
  }
}

void __80___SFAccountTableViewController__shareSavedAccount_modalPresentationSourceView___block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_1A690B000, v3, OS_LOG_TYPE_ERROR, "Failed to authenticate for one time account sharing: %@", (uint8_t *)&v5, 0xCu);
}

@end