@interface SFPageFormatMenuPrivacyReportController
@end

@implementation SFPageFormatMenuPrivacyReportController

uint64_t __53___SFPageFormatMenuPrivacyReportController_alertItem__block_invoke(uint64_t a1)
{
  BOOL v2 = +[SFBrowserDocumentTrackerInfo trackingPreventionEnabled];
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    return [v3 _presentPrivacyReport];
  }
  else
  {
    return [v3 _presentPromptToTurnOnTrackingProtection];
  }
}

void __53___SFPageFormatMenuPrivacyReportController_alertItem__block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __53___SFPageFormatMenuPrivacyReportController_alertItem__block_invoke_3;
  v2[3] = &unk_1E5C72238;
  id v3 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

void __53___SFPageFormatMenuPrivacyReportController_alertItem__block_invoke_3(uint64_t a1)
{
  id v19 = [MEMORY[0x1E4F1CA48] array];
  BOOL v2 = [*(id *)(a1 + 32) preventedKnownTrackingThirdParties];
  uint64_t v3 = [v2 count];

  id v4 = [*(id *)(a1 + 32) blockedKnownTrackingThirdParties];
  uint64_t v5 = [v4 count];

  if (!(v3 | v5))
  {
    v10 = _WBSLocalizedString();
    [v19 addObject:v10];
    goto LABEL_7;
  }
  if (v5)
  {
    v6 = NSString;
    v7 = _WBSLocalizedString();
    v8 = objc_msgSend(v6, "localizedStringWithFormat:", v7, v5);
    [v19 addObject:v8];
  }
  if (v3)
  {
    v9 = NSString;
    v10 = _WBSLocalizedString();
    v11 = objc_msgSend(v9, "localizedStringWithFormat:", v10, v3);
    [v19 addObject:v11];

LABEL_7:
  }
  v12 = [*(id *)(a1 + 32) queryParameterFilteringDataQueue];
  v13 = [v12 currentData];
  uint64_t v14 = [v13 numberOfFilteredQueryParameters];

  if (v14)
  {
    v15 = NSString;
    v16 = _WBSLocalizedString();
    v17 = objc_msgSend(v15, "localizedStringWithFormat:", v16, v14);
    [v19 addObject:v17];
  }
  v18 = [v19 componentsJoinedByString:@"\n"];
  [*(id *)(a1 + 40) setSubtitle:v18];

  [*(id *)(a1 + 40) notifyObserversItemDidUpdate];
}

uint64_t __84___SFPageFormatMenuPrivacyReportController__presentPromptToTurnOnTrackingProtection__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

uint64_t __84___SFPageFormatMenuPrivacyReportController__presentPromptToTurnOnTrackingProtection__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

uint64_t __65___SFPageFormatMenuPrivacyReportController__presentPrivacyReport__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

@end