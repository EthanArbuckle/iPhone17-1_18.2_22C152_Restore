@interface SFAccountPickerTableViewController
@end

@implementation SFAccountPickerTableViewController

void __50___SFAccountPickerTableViewController_reloadTable__block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(*(void *)(a1 + 32) + 1232) serviceNameHintStrings];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __50___SFAccountPickerTableViewController_reloadTable__block_invoke_2;
  v47[3] = &unk_1E5C77A78;
  v47[4] = *(void *)(a1 + 32);
  v3 = __50___SFAccountPickerTableViewController_reloadTable__block_invoke_2((uint64_t)v47);
  uint64_t v4 = [v2 count];
  if (v4 + [v3 count])
  {
    unint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 1080) count];
    if (v5 > [*(id *)(*(void *)(a1 + 32) + 1232) minimumNumberOfCredentialsToShowLikelyMatchesSection])
    {
      v6 = *(void **)(*(void *)(a1 + 32) + 1080);
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __50___SFAccountPickerTableViewController_reloadTable__block_invoke_3;
      v44[3] = &unk_1E5C77AC0;
      id v45 = v3;
      id v46 = v2;
      v7 = objc_msgSend(v6, "safari_filterObjectsUsingBlock:", v44);
      uint64_t v8 = [v7 mutableCopy];
      uint64_t v9 = *(void *)(a1 + 32);
      v10 = *(void **)(v9 + 1072);
      *(void *)(v9 + 1072) = v8;
    }
    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v12 = *(void *)(a1 + 32);
    v13 = *(void **)(v12 + 1104);
    *(void *)(v12 + 1104) = v11;

    v14 = (void *)MEMORY[0x1E4F1CAD0];
    v15 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1096), "safari_mapObjectsUsingBlock:", &__block_literal_global_60_0);
    v16 = [v14 setWithArray:v15];

    if ([v16 count])
    {
      v39 = v3;
      v17 = [*(id *)(*(void *)(a1 + 32) + 1096) objectAtIndexedSubscript:0];
      v18 = [v17 relyingPartyIdentifier];
      int v19 = [v18 isEqualToString:@"apple.com"];

      if (v19)
      {
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1096), "safari_mapObjectsUsingBlock:", &__block_literal_global_66);
        id v20 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v21 = [v20 mutableCopy];
        uint64_t v22 = *(void *)(a1 + 32);
        v23 = *(void **)(v22 + 1104);
        *(void *)(v22 + 1104) = v21;
      }
      else
      {
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v20 = *(id *)(*(void *)(a1 + 32) + 1080);
        uint64_t v24 = [v20 countByEnumeratingWithState:&v40 objects:v48 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          v38 = v2;
          uint64_t v26 = *(void *)v41;
          do
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v41 != v26) {
                objc_enumerationMutation(v20);
              }
              v28 = *(void **)(*((void *)&v40 + 1) + 8 * i);
              v29 = [v28 passkeyCredentialID];
              int v30 = [v16 containsObject:v29];

              if (v30) {
                [*(id *)(*(void *)(a1 + 32) + 1104) addObject:v28];
              }
            }
            uint64_t v25 = [v20 countByEnumeratingWithState:&v40 objects:v48 count:16];
          }
          while (v25);
          v2 = v38;
        }
      }

      v3 = v39;
    }
  }
  [*(id *)(a1 + 32) _updateMatchingGeneratedPasswordsState];
  [*(id *)(a1 + 32) _updateMatchingPasswords];
  [*(id *)(a1 + 32) _updateNavigationItemTitleAndPrompt];
  v31 = [*(id *)(a1 + 32) tableView];
  [v31 reloadData];

  v32 = [*(id *)(*(void *)(a1 + 32) + 1232) initialSearchQuery];
  uint64_t v33 = [v32 length];

  if (v33)
  {
    v34 = [*(id *)(*(void *)(a1 + 32) + 1232) initialSearchQuery];
    [*(id *)(a1 + 32) setSearchQuery:v34];

    [*(id *)(*(void *)(a1 + 32) + 1232) setInitialSearchQuery:0];
  }
  v35 = [*(id *)(*(void *)(a1 + 32) + 1232) savedAccountToInitiallyShowDetailsFor];

  if (v35)
  {
    v36 = *(id **)(a1 + 32);
    v37 = [v36[154] savedAccountToInitiallyShowDetailsFor];
    [v36 _showAccountDetailsForSavedAccount:v37];

    [*(id *)(*(void *)(a1 + 32) + 1232) setSavedAccountToInitiallyShowDetailsFor:0];
  }
}

id __50___SFAccountPickerTableViewController_reloadTable__block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = +[_SFFormDataController sharedController];
  v3 = [v2 autoFillQuirksManager];
  uint64_t v4 = [v3 associatedDomainsManager];

  unint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 1232) domainHintStrings];
  v6 = (void *)[v5 mutableCopy];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v7 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1232), "domainHintStrings", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [v4 domainsWithAssociatedCredentialsForDomain:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        v13 = [v12 allObjects];
        [v6 addObjectsFromArray:v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v6;
}

uint64_t __50___SFAccountPickerTableViewController_reloadTable__block_invoke_3(uint64_t a1, void *a2)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 credentialTypes])
  {
    unint64_t v5 = [v3 highLevelDomain];
    v28[0] = v5;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];

    v7 = [v3 additionalSites];
    uint64_t v8 = objc_msgSend(v7, "safari_mapObjectsUsingBlock:", &__block_literal_global_51);
    uint64_t v9 = [v6 arrayByAddingObjectsFromArray:v8];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v23;
LABEL_5:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        if ([v9 containsObject:*(void *)(*((void *)&v22 + 1) + 8 * v14)]) {
          break;
        }
        if (v12 == ++v14)
        {
          uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
          if (v12) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:

      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v10 = *(id *)(a1 + 40);
      uint64_t v4 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (!v4)
      {
LABEL_21:

        goto LABEL_22;
      }
      uint64_t v15 = *(void *)v19;
LABEL_13:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v10);
        }
        if (objc_msgSend(v3, "matchesServiceNameHintString:", *(void *)(*((void *)&v18 + 1) + 8 * v16), (void)v18))break; {
        if (v4 == ++v16)
        }
        {
          uint64_t v4 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
          if (v4) {
            goto LABEL_13;
          }
          goto LABEL_21;
        }
      }
    }
    uint64_t v4 = 1;
    goto LABEL_21;
  }
  uint64_t v4 = 0;
LABEL_22:

  return v4;
}

uint64_t __50___SFAccountPickerTableViewController_reloadTable__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "safari_highLevelDomainForPasswordManager");
}

id __50___SFAccountPickerTableViewController_reloadTable__block_invoke_5(uint64_t a1, void *a2)
{
  v2 = [a2 identifier];
  id v3 = [v2 credentialID];

  return v3;
}

id __50___SFAccountPickerTableViewController_reloadTable__block_invoke_6(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F98DD0];
  id v3 = a2;
  id v4 = [v2 alloc];
  unint64_t v5 = [v3 relyingPartyIdentifier];
  v6 = [v3 username];
  v7 = [v3 identifier];

  uint64_t v8 = [v7 credentialID];
  uint64_t v9 = (void *)[v4 _initWithPasskeyRelyingPartyID:v5 user:v6 passkeyUserHandle:&stru_1EFB97EB8 passkeyCredentialID:v8];

  return v9;
}

uint64_t __72___SFAccountPickerTableViewController_newAutoFillablePasskeysAvailable___block_invoke(uint64_t a1)
{
  v2 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A690B000, v2, OS_LOG_TYPE_INFO, "Received new passkeys available notification. Refreshing account picker.", v4, 2u);
  }
  return [*(id *)(a1 + 32) reloadTable];
}

BOOL __81___SFAccountPickerTableViewController__reloadSavedAccountsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 userIsNeverSaveMarker])
  {
    BOOL v4 = 0;
  }
  else
  {
    unint64_t v5 = [v3 user];
    BOOL v4 = ([v5 length]
       || ([*(id *)(*(void *)(a1 + 32) + 1232) forUserNamesOnly] & 1) == 0)
      && ([v3 credentialTypes] & 4) == 0;
  }
  return v4;
}

void __81___SFAccountPickerTableViewController__reloadSavedAccountsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81___SFAccountPickerTableViewController__reloadSavedAccountsWithCompletionHandler___block_invoke_3;
  v10[3] = &unk_1E5C75F00;
  v7 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v5;
  id v12 = v6;
  id v13 = v7;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

uint64_t __81___SFAccountPickerTableViewController__reloadSavedAccountsWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1096), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1112), *(id *)(a1 + 48));
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v2();
}

void __61___SFAccountPickerTableViewController__accountStoreDidChange__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateMatchingPasswords];
  id v2 = [*(id *)(a1 + 32) tableView];
  [v2 reloadData];
}

uint64_t __117___SFAccountPickerTableViewController__didPickSavedAccountForPasswordButPresentAlertToAddAdditionalSiteIfApplicable___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "safari_highLevelDomainForPasswordManager");
}

uint64_t __117___SFAccountPickerTableViewController__didPickSavedAccountForPasswordButPresentAlertToAddAdditionalSiteIfApplicable___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didPickSavedAccountForPassword:*(void *)(a1 + 40)];
}

uint64_t __117___SFAccountPickerTableViewController__didPickSavedAccountForPasswordButPresentAlertToAddAdditionalSiteIfApplicable___block_invoke_3(void *a1)
{
  id v2 = [MEMORY[0x1E4F98DF8] sharedStore];
  [v2 addAdditionalSite:a1[4] toSavedAccount:a1[5]];

  uint64_t v4 = a1[5];
  id v3 = (void *)a1[6];

  return [v3 _didPickSavedAccountForPassword:v4];
}

void __117___SFAccountPickerTableViewController__didPickSavedAccountForPasswordButPresentAlertToAddAdditionalSiteIfApplicable___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tableView];
  v1 = [v2 indexPathForSelectedRow];
  if (v1) {
    [v2 deselectRowAtIndexPath:v1 animated:1];
  }
}

BOOL __71___SFAccountPickerTableViewController__reloadVerificationCodesIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return [a2 source] != 2;
}

uint64_t __95___SFAccountPickerTableViewController_addSavedAccountViewControllerDidFinish_withSavedAccount___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showAccountDetailsForSavedAccount:*(void *)(a1 + 40)];
}

void __73___SFAccountPickerTableViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, char a2)
{
  uint64_t v4 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A690B000, v4, OS_LOG_TYPE_DEFAULT, "Finished caBLE transaction. Dismissing picker.", buf, 2u);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73___SFAccountPickerTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_241;
    block[3] = &unk_1E5C724D8;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A690B000, v4, OS_LOG_TYPE_DEFAULT, "caBLE transaction did not succeed. Leaving picker up.", buf, 2u);
  }
}

void __73___SFAccountPickerTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_241(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accountPickerTableViewControllerDidCancel:*(void *)(a1 + 32)];
}

uint64_t __73___SFAccountPickerTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_243(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 credentialID];
  BOOL v5 = [*(id *)(a1 + 32) passkeyCredentialID];
  uint64_t v6 = [v4 isEqualToString:v5];

  return v6;
}

void __100___SFAccountPickerTableViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = a4;
  [v4 _presentAlertToConfirmDeletingAccountsAtIndexPath:v5];
  v6[2](v6, 1);
}

void __89___SFAccountPickerTableViewController__presentAlertToConfirmDeletingAccountsAtIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _deleteSavedAccountAtIndexPath:*(void *)(a1 + 32)];
}

uint64_t __63___SFAccountPickerTableViewController__updateMatchingPasswords__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 1072);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63___SFAccountPickerTableViewController__updateMatchingPasswords__block_invoke_2;
  v8[3] = &unk_1E5C77B28;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "safari_noObjectsPassTest:", v8);

  return v6;
}

uint64_t __63___SFAccountPickerTableViewController__updateMatchingPasswords__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 highLevelDomain];
  id v5 = [v3 highLevelDomain];

  uint64_t v6 = [v4 isEqualToString:v5];
  return v6;
}

uint64_t __63___SFAccountPickerTableViewController__updateMatchingPasswords__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[_SFFormDataController sharedController];
  id v5 = [v4 autoFillQuirksManager];
  uint64_t v6 = [v5 associatedDomainsManager];
  v7 = [v3 highLevelDomain];
  id v8 = [v6 domainsWithAssociatedCredentialsForDomain:v7];

  id v9 = [*(id *)(a1 + 32) searchPattern];
  uint64_t v10 = [v3 matchesUserTypedSearchPattern:v9 associatedDomains:v8];

  return v10;
}

BOOL __63___SFAccountPickerTableViewController__updateMatchingPasswords__block_invoke_4(uint64_t a1, void *a2)
{
  return ([a2 credentialTypes] & 1) == 0;
}

@end