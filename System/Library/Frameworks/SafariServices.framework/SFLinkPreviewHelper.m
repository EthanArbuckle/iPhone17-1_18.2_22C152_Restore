@interface SFLinkPreviewHelper
@end

@implementation SFLinkPreviewHelper

void __51___SFLinkPreviewHelper_commitPreviewViewController__block_invoke(uint64_t a1, uint64_t a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a2 + 1) >= 4)
  {
    if (a2 == 3)
    {
      v2 = *(void **)(*(void *)(a1 + 32) + 8);
      uint64_t v5 = *MEMORY[0x1E4FA6E98];
      v6[0] = MEMORY[0x1E4F1CC38];
      v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
      [v2 openExternallyWithWebBrowserState:v3 referrerURL:0 completionHandler:0];
    }
  }
  else
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __51___SFLinkPreviewHelper_commitPreviewViewController__block_invoke_2;
    v4[3] = &unk_1E5C73108;
    v4[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], v4);
  }
}

void __51___SFLinkPreviewHelper_commitPreviewViewController__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  [WeakRetained linkPreviewHelper:*(void *)(a1 + 32) commitPreviewViewControllerForAction:2 withTabOrder:0];
}

uint64_t __52___SFLinkPreviewHelper_makeContextMenuConfiguration__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) previewViewController];
}

id __52___SFLinkPreviewHelper_makeContextMenuConfiguration__block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) menuWithSuggestedActions:a2];

  return v2;
}

void __56___SFLinkPreviewHelper_menuElementsForSuggestedActions___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v6;
  id v12 = v6;

  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
}

void __56___SFLinkPreviewHelper_menuElementsForSuggestedActions___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56___SFLinkPreviewHelper_menuElementsForSuggestedActions___block_invoke_3;
  v4[3] = &unk_1E5C74810;
  v4[4] = v2;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v3 disableWithCompletionHandler:v4];
}

void __56___SFLinkPreviewHelper_menuElementsForSuggestedActions___block_invoke_3(uint64_t a1, char a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
    if (objc_opt_respondsToSelector()) {
      [WeakRetained linkPreviewHelperWillOpenUniversalLinkLocally:*(void *)(a1 + 32)];
    }
    uint64_t v3 = *(void *)(a1 + 40);
    if (!v3) {
      uint64_t v3 = *(void *)(a1 + 48);
    }
    [*(id *)(a1 + 32) openURL:v3 forAction:2 withTabOrder:0];
  }
  else
  {
    v4 = WBS_LOG_CHANNEL_PREFIXUniversalLinks();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A690B000, v4, OS_LOG_TYPE_DEFAULT, "Unable to disable App Link, won't navigate to URL from long press on link", buf, 2u);
    }
  }
}

uint64_t __56___SFLinkPreviewHelper_menuElementsForSuggestedActions___block_invoke_78(uint64_t a1)
{
  return 1;
}

void __56___SFLinkPreviewHelper_menuElementsForSuggestedActions___block_invoke_2_93(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = *MEMORY[0x1E4FA6E98];
  v4[0] = MEMORY[0x1E4F1CC38];
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  [v1 openExternallyWithWebBrowserState:v2 referrerURL:0 completionHandler:0];
}

uint64_t __50___SFLinkPreviewHelper_openActionForAlternateURL___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) openURL:*(void *)(a1 + 40) forAction:2 withTabOrder:0];
}

void __72___SFLinkPreviewHelper_openActionForRedirectToExternalNavigationResult___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  [WeakRetained linkPreviewHelper:*(void *)(a1 + 32) redirectToExternalNavigationResult:*(void *)(a1 + 40)];
}

void __95___SFLinkPreviewHelper_openActionForSettingUpOneTimeCodeGeneratorWithExternalNavigationResult___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = objc_loadWeakRetained(WeakRetained + 4);
  [v2 linkPreviewHelper:WeakRetained redirectToExternalNavigationResult:*(void *)(a1 + 32)];
}

void __79___SFLinkPreviewHelper_openInNewTabActionForURL_withTabOrder_preActionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = *(void *)(a1 + 48);
  if (!v3 || ((*(uint64_t (**)(void))(v3 + 16))() & 1) != 0)
  {
    int v4 = [*(id *)(a1 + 32) _previewViewControllerIsLinkPreview];
    id v5 = *(id **)(a1 + 32);
    if (v4)
    {
      id WeakRetained = objc_loadWeakRetained(v5 + 4);
      [WeakRetained linkPreviewHelper:*(void *)(a1 + 32) commitPreviewViewControllerForAction:3 withTabOrder:*(void *)(a1 + 56)];
    }
    else
    {
      [v5 openURL:*(void *)(a1 + 40) forAction:3 withTabOrder:*(void *)(a1 + 56)];
    }
  }
}

uint64_t __78___SFLinkPreviewHelper_openInTabGroupActionForURL_shouldPerformActionHandler___block_invoke(uint64_t *a1)
{
  uint64_t v2 = a1[7];
  if (!v2 || (uint64_t result = (*(uint64_t (**)(void))(v2 + 16))(), result))
  {
    if ([(id)a1[4] _previewViewControllerIsLinkPreview])
    {
      uint64_t v5 = a1[4];
      int v4 = (void *)a1[5];
      return [v4 linkPreviewHelper:v5 commitPreviewViewControllerForAction:3 withTabOrder:1];
    }
    else
    {
      id v6 = (void *)a1[4];
      uint64_t v7 = a1[6];
      return [v6 openURL:v7 forAction:3 withTabOrder:1];
    }
  }
  return result;
}

void __52___SFLinkPreviewHelper_openInNewWindowActionForURL___block_invoke(void *a1)
{
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_1A690B000, v2, OS_LOG_TYPE_DEFAULT, "Open new window via long-press on link", v7, 2u);
  }
  uint64_t v3 = [MEMORY[0x1E4F78598] builderWithModifierFlags:0];
  [v3 setPrefersOpenInNewWindow:1];
  int v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  id v6 = [v3 navigationIntentWithURL:a1[6]];
  [v4 linkPreviewHelper:v5 didProduceNavigationIntent:v6 forAction:4];
}

uint64_t __53___SFLinkPreviewHelper_addToReadingListActionForURL___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) linkPreviewHelper:*(void *)(a1 + 40) addURLToReadingList:*(void *)(a1 + 48)];
}

void __45___SFLinkPreviewHelper_downloadActionForURL___block_invoke(uint64_t a1)
{
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1A690B000, v2, OS_LOG_TYPE_DEFAULT, "Started a file download via long-press on link", v6, 2u);
  }
  [*(id *)(a1 + 32) linkPreviewHelperWillBeginDownload:*(void *)(a1 + 40)];
  uint64_t v3 = +[_SFDownloadDispatcher sharedDownloadDispatcher];
  int v4 = [v3 startDownloadFromWebView:*(void *)(*(void *)(a1 + 40) + 80) URL:*(void *)(a1 + 48)];

  [v4 setExplicitlySaved:1];
  uint64_t v5 = +[_SFDownloadManager sharedManager];
  [v4 setDelegate:v5];
}

@end