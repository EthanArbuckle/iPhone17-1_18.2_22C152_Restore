@interface WebBookmark
@end

@implementation WebBookmark

void __87__WebBookmark_SafariServicesExtras___sf_webBookmarksFromDropSession_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "safari_mapObjectsUsingBlock:", &__block_literal_global_2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __87__WebBookmark_SafariServicesExtras___sf_webBookmarksFromDropSession_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v4 = v2;
  v5 = v4;
  v6 = v4;
  if ((isKindOfClass & 1) == 0)
  {
    v7 = objc_msgSend(v4, "safari_originalDataAsString");
    v8 = [v5 _title];

    if (v8) {
      v9 = v8;
    }
    else {
      v9 = v7;
    }
    id v10 = v9;

    v6 = (void *)[objc_alloc(MEMORY[0x1E4FB60E0]) initWithTitle:v10 address:v7 collectionType:0];
  }

  return v6;
}

void __129__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_analyticsPayload_withUserInfo_handler___block_invoke(uint64_t a1)
{
  id v4 = [MEMORY[0x1E4F1CB10] URLWithString:*(void *)(a1 + 32)];
  if (v4)
  {
    id v2 = [MEMORY[0x1E4FB1A78] generalPasteboard];
    [v2 setURL:v4];
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v2 = [MEMORY[0x1E4FB1A78] generalPasteboard];
    [v2 setString:v3];
  }
}

void __129__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_analyticsPayload_withUserInfo_handler___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) descendantsOfBookmarkFolder:*(void *)(a1 + 40)];
  v1 = objc_msgSend(v3, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_43);
  id v2 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  [v2 setItems:v1];
}

id __129__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_analyticsPayload_withUserInfo_handler___block_invoke_3(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v2 = [a2 address];
  uint64_t v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
  id v4 = (void *)v3;
  if (v3)
  {
    uint64_t v12 = *MEMORY[0x1E4F226F8];
    v13[0] = v3;
    v5 = (void *)MEMORY[0x1E4F1C9E8];
    v6 = (void **)v13;
    v7 = &v12;
LABEL_5:
    v8 = [v5 dictionaryWithObjects:v6 forKeys:v7 count:1];
    goto LABEL_6;
  }
  if (v2)
  {
    uint64_t v10 = *MEMORY[0x1E4F22708];
    v11 = v2;
    v5 = (void *)MEMORY[0x1E4F1C9E8];
    v6 = &v11;
    v7 = &v10;
    goto LABEL_5;
  }
  v8 = 0;
LABEL_6:

  return v8;
}

id __129__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_analyticsPayload_withUserInfo_handler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [MEMORY[0x1E4F78590] effectiveTabOrderWithPreferredTabOrder:a2];
  id v4 = _WBSLocalizedString();
  v5 = v4;
  if (*(unsigned char *)(a1 + 32) || v3 != 2)
  {
    _WBSLocalizedString();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = v4;
  }
  v7 = v6;

  return v7;
}

void __129__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_analyticsPayload_withUserInfo_handler___block_invoke_5(uint64_t a1, uint64_t a2, char a3)
{
  id v6 = [MEMORY[0x1E4F78598] builder];
  [v6 setPreferredTabOrder:a2];
  if (a2 == 1) {
    uint64_t v7 = *(unsigned __int8 *)(a1 + 64);
  }
  else {
    uint64_t v7 = 0;
  }
  [v6 setNeverPromptWhenOpeningMultipleIntents:v7];
  if (([*(id *)(a1 + 32) hasActiveLibrary] & 1) == 0) {
    [v6 setPrefersOpenInNewTab:1];
  }
  v8 = [v6 navigationIntentWithBookmark:*(void *)(a1 + 40)];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __129__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_analyticsPayload_withUserInfo_handler___block_invoke_6;
  v11[3] = &unk_1E5C72C38;
  objc_copyWeak(&v15, (id *)(a1 + 56));
  v9 = *(void **)(a1 + 48);
  v11[4] = *(void *)(a1 + 40);
  id v12 = v8;
  id v13 = v9;
  char v16 = a3;
  id v14 = *(id *)(a1 + 32);
  id v10 = v8;
  dispatch_async(MEMORY[0x1E4F14428], v11);

  objc_destroyWeak(&v15);
}

void __129__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_analyticsPayload_withUserInfo_handler___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained bookmark:*(void *)(a1 + 32) didProduceNavigationIntent:*(void *)(a1 + 40) userInfo:*(void *)(a1 + 48)];

  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t v3 = *(void **)(a1 + 56);
    [v3 removeSingleBlankTabFromActiveTabGroup];
  }
}

uint64_t __129__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_analyticsPayload_withUserInfo_handler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __129__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_analyticsPayload_withUserInfo_handler___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __129__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_analyticsPayload_withUserInfo_handler___block_invoke_9(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained editBookmark:*(void *)(a1 + 32) userInfo:*(void *)(a1 + 40)];
}

void __129__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_analyticsPayload_withUserInfo_handler___block_invoke_10(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [MEMORY[0x1E4F1CB10] URLWithString:*(void *)(a1 + 40)];
  v5 = v4;
  if (!v4) {
    v5 = *(void **)(a1 + 40);
  }
  v7[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [WeakRetained bookmark:v3 shareItems:v6 userInfo:*(void *)(a1 + 48)];
}

void __129__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_analyticsPayload_withUserInfo_handler___block_invoke_11(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) descendantsOfBookmarkFolder:*(void *)(a1 + 40)];
  id v2 = objc_msgSend(v4, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_84);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained bookmark:*(void *)(a1 + 40) shareItems:v2 userInfo:*(void *)(a1 + 48)];
}

id __129__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_analyticsPayload_withUserInfo_handler___block_invoke_12(uint64_t a1, void *a2)
{
  id v2 = [a2 address];
  uint64_t v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
  id v4 = v3;
  if (!v3) {
    uint64_t v3 = v2;
  }
  id v5 = v3;

  return v5;
}

void __129__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_analyticsPayload_withUserInfo_handler___block_invoke_13(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained deleteBookmark:*(void *)(a1 + 32) userInfo:*(void *)(a1 + 40)];

  id v3 = [MEMORY[0x1E4F98948] sharedLogger];
  [v3 didRemoveFrequentlyVisitedSiteWithAnalyticsPayload:*(void *)(a1 + 48)];
}

void __129__WebBookmark_SafariServicesExtras___sf_contextMenuUsingCollection_tabGroupActionProvider_analyticsPayload_withUserInfo_handler___block_invoke_14(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained deleteBookmark:*(void *)(a1 + 32) userInfo:*(void *)(a1 + 40)];
}

@end