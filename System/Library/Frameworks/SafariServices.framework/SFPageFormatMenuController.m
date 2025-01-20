@interface SFPageFormatMenuController
@end

@implementation SFPageFormatMenuController

void __115___SFPageFormatMenuController__presentBrowsingAssistantFromViewController_withSourceInfo_fromSafariViewController___block_invoke(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) shouldPassthroughSuperview])
  {
    id v4 = [v3 superview];
  }
  else
  {
    id v4 = v3;
  }
  v5 = v4;
  v7[0] = v4;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [*(id *)(a1 + 40) setPassthroughViews:v6];
}

double __115___SFPageFormatMenuController__presentBrowsingAssistantFromViewController_withSourceInfo_fromSafariViewController___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained detentHeight];
    double v7 = v6;
    [v3 maximumDetentValue];
    double v9 = fmin(v7, v8);
  }
  else
  {
    [v3 maximumDetentValue];
    double v9 = v10;
  }

  return v9;
}

void __101___SFPageFormatMenuController_presentMenuFromViewController_withSourceInfo_fromSafariViewController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = a2;
  if ([v4 shouldPassthroughSuperview])
  {
    uint64_t v6 = [v5 superview];

    id v5 = (id)v6;
  }
  [v3 insertObject:v5 atIndex:0];

  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = [*(id *)(a1 + 48) popoverPresentationController];
  [v8 setPassthroughViews:v7];
}

id __46___SFPageFormatMenuController__extensionItems__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) webExtensionForExtension:a2];
  id v4 = [v3 toolbarItem];
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 alertItemForTab:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void __51___SFPageFormatMenuController__siriReaderAlertItem__block_invoke(id *a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F78360];
  id v4 = a2;
  id v5 = [v3 sharedPlaybackController];
  [v5 setNowPlayingContentIdentifier:v4];

  uint64_t v6 = [a1[4] siriReaderPlaybackStateForActiveTab];
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    double v10 = WeakRetained;
    id v8 = [WeakRetained _titleForPlaybackState:v6];
    [v10[4] setTitle:v8];

    if ([a1[4] canReadActiveLanguage]
      && [a1[5] isReaderAvailable])
    {
      uint64_t v9 = [a1[6] isBlockedByScreenTime] ^ 1;
    }
    else
    {
      uint64_t v9 = 0;
    }
    [v10[4] setEnabled:v9];
    [v10[4] notifyObserversItemDidUpdate];
    id WeakRetained = v10;
  }
}

void __65___SFPageFormatMenuController__endListeningToSiriReaderAlertItem__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained(v2);
  id v4 = objc_loadWeakRetained(WeakRetained + 16);
  id v5 = [v4 activeDocument];
  [v5 dismissSiriReaderMediaSessionImmediately:1];

  [WeakRetained updateShouldShowListeningControls:0];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

uint64_t __53___SFPageFormatMenuController__moreControlsAlertItem__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateShouldShowListeningControls:0];
  v2 = *(void **)(a1 + 32);

  return [v2 reloadAlert];
}

uint64_t __58___SFPageFormatMenuController__listeningControlsAlertItem__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateShouldShowListeningControls:1];
  v2 = *(void **)(a1 + 32);

  return [v2 reloadAlert];
}

void __47___SFPageFormatMenuController__readerAlertItem__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [WeakRetained browserContentController];
  [v4 toggleShowingReaderForUserAction];

  [v5 dismissViewControllerAnimated:1 completion:0];
}

void __72___SFPageFormatMenuController__siriReaderAlertItemWithState_identifier___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 siriReadThisMenuInvocation];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

void __51___SFPageFormatMenuController__mediaStateAlertItem__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [WeakRetained browserContentController];
  id v5 = [v4 activeDocument];
  [v5 toggleMediaStateMuted];

  [v6 dismissViewControllerAnimated:1 completion:0];
}

void __50___SFPageFormatMenuController__downloadsAlertItem__block_invoke(uint64_t a1, void *a2)
{
  [a2 dismissViewControllerAnimated:1 completion:0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained browserContentController];
  [v3 presentDownloadsViewController];
}

uint64_t __76___SFPageFormatMenuController__desktopMobileToggleAlertItemWithOrientation___block_invoke(uint64_t a1, void *a2)
{
  [a2 dismissViewControllerAnimated:1 completion:0];
  id v3 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 40))
  {
    return [v3 requestStandardSite];
  }
  else
  {
    return [v3 requestDesktopSite];
  }
}

uint64_t __59___SFPageFormatMenuController__pauseAllAnimationsAlertItem__block_invoke(uint64_t a1, void *a2)
{
  [a2 dismissViewControllerAnimated:1 completion:0];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v4 = *(void **)(a1 + 32);
    return [v4 _pauseAllAnimationsWithCompletionHandler:0];
  }
  return result;
}

uint64_t __58___SFPageFormatMenuController__playAllAnimationsAlertItem__block_invoke(uint64_t a1, void *a2)
{
  [a2 dismissViewControllerAnimated:1 completion:0];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v4 = *(void **)(a1 + 32);
    return [v4 _playAllAnimationsWithCompletionHandler:0];
  }
  return result;
}

void __51___SFPageFormatMenuController__fullScreenAlertItem__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 _anchorInWindowCoordinatesForAlert:v4];
  [v4 dismissViewControllerAnimated:1 completion:0];

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 128));
  [WeakRetained setKeepBarsMinimized:1];
}

void __73___SFPageFormatMenuController__buildTranslationAlertItemsWithSourceInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = [[_SFTranslationTargetLocaleAlertController alloc] initWithTranslationContext:*(void *)(a1 + 32)];
  uint64_t v7 = [v4 provenance];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __73___SFPageFormatMenuController__buildTranslationAlertItemsWithSourceInfo___block_invoke_2;
  v16[3] = &__block_descriptor_40_e18_v16__0__NSString_8l;
  v16[4] = v7;
  [(_SFTranslationTargetLocaleAlertController *)v6 setAnalyticsHandler:v16];
  id v8 = [v4 presentingViewController];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73___SFPageFormatMenuController__buildTranslationAlertItemsWithSourceInfo___block_invoke_3;
  v12[3] = &unk_1E5C72350;
  id v13 = WeakRetained;
  v14 = v6;
  id v15 = v8;
  id v9 = v8;
  double v10 = v6;
  id v11 = WeakRetained;
  [v9 dismissViewControllerAnimated:1 completion:v12];
}

void __73___SFPageFormatMenuController__buildTranslationAlertItemsWithSourceInfo___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v3 = 12;
  }
  else {
    uint64_t v3 = 13;
  }
  id v4 = [MEMORY[0x1E4F98948] sharedLogger];
  objc_msgSend(v4, "_sf_didPerformFormatMenuAction:provenance:", v3, *(void *)(a1 + 32));
}

uint64_t __73___SFPageFormatMenuController__buildTranslationAlertItemsWithSourceInfo___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(a1 + 40), "configurePopoverWithSourceInfo:");
  }
  uint64_t v3 = *(void *)(a1 + 40);
  v2 = *(void **)(a1 + 48);

  return [v2 presentViewController:v3 animated:1 completion:0];
}

void __73___SFPageFormatMenuController__buildTranslationAlertItemsWithSourceInfo___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = [[_SFTranslationTargetLocaleAlertController alloc] initWithTranslationContext:*(void *)(a1 + 32)];
    id v4 = [WeakRetained viewController];
    id v5 = [v4 presentingViewController];

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __73___SFPageFormatMenuController__buildTranslationAlertItemsWithSourceInfo___block_invoke_5;
    v8[3] = &unk_1E5C72238;
    id v9 = v5;
    double v10 = v3;
    id v6 = v3;
    id v7 = v5;
    [v7 dismissViewControllerAnimated:1 completion:v8];
  }
}

uint64_t __73___SFPageFormatMenuController__buildTranslationAlertItemsWithSourceInfo___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

uint64_t __70___SFPageFormatMenuController__translateAlertItemForLocaleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  [a2 dismissViewControllerAnimated:1 completion:0];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v3 requestTranslatingWebpageToLocale:v4 completionHandler:0];
}

void __70___SFPageFormatMenuController__translateAlertItemForLocaleIdentifier___block_invoke_2(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __70___SFPageFormatMenuController__translateAlertItemForLocaleIdentifier___block_invoke_3;
  v3[3] = &unk_1E5C72988;
  id v4 = *(id *)(a1 + 32);
  char v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __70___SFPageFormatMenuController__translateAlertItemForLocaleIdentifier___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setEnabled:*(unsigned __int8 *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);

  return [v2 notifyObserversItemDidUpdate];
}

uint64_t __56___SFPageFormatMenuController__exitTranslationAlertItem__block_invoke(uint64_t a1, void *a2)
{
  [a2 dismissViewControllerAnimated:1 completion:0];
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 reloadPageInOriginalLanguage];
}

void __70___SFPageFormatMenuController__internalTapToRadarTranslationAlertItem__block_invoke(uint64_t a1, void *a2)
{
  [a2 dismissViewControllerAnimated:1 completion:0];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70___SFPageFormatMenuController__internalTapToRadarTranslationAlertItem__block_invoke_2;
  v4[3] = &unk_1E5C76548;
  uint64_t v3 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v3 generateDiagnosticDataForPurpose:1 completionHandler:v4];
}

void __70___SFPageFormatMenuController__internalTapToRadarTranslationAlertItem__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 saveDiagnosticDataAsTemporaryFiles];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70___SFPageFormatMenuController__internalTapToRadarTranslationAlertItem__block_invoke_3;
  v5[3] = &unk_1E5C72238;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __70___SFPageFormatMenuController__internalTapToRadarTranslationAlertItem__block_invoke_3(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F98BD0]);
  uint64_t v3 = [MEMORY[0x1E4F98BD8] safariIOS];
  id v4 = (void *)[v2 initWithComponent:v3 title:@"Webpage Translation Issue: " descriptionTemplate:@"Translation debug info that includes the URL and all text from the webpage has been attached to this radar. Please describe the issue you're seeing in detail and the steps taken leading up to this issue."];

  [v4 setAttachmentPaths:*(void *)(a1 + 32)];
  v8[0] = @"1225093";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v4 setKeywords:v5];

  id v6 = *(void **)(a1 + 40);
  id v7 = [v4 continueInTapToRadarURL];
  [v6 openURL:v7 options:0 completionHandler:0];
}

void __64___SFPageFormatMenuController__userFeedbackTranslationAlertItem__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 128));
  id v5 = [[_SFReportTranslationIssueCollectionViewController alloc] initWithBrowserContentController:WeakRetained];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v5];
  [v6 setModalPresentationStyle:1];
  id v7 = [v3 presentingViewController];

  if (v7)
  {
    id v8 = [v3 presentingViewController];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64___SFPageFormatMenuController__userFeedbackTranslationAlertItem__block_invoke_2;
    v9[3] = &unk_1E5C72238;
    id v10 = WeakRetained;
    id v11 = v6;
    [v8 dismissViewControllerAnimated:1 completion:v9];
  }
  else
  {
    [WeakRetained presentModalViewController:v6 completion:0];
  }
}

uint64_t __64___SFPageFormatMenuController__userFeedbackTranslationAlertItem__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentModalViewController:*(void *)(a1 + 40) completion:0];
}

void __65___SFPageFormatMenuController__translationAvailabilityDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 128));
  id v3 = [*(id *)(a1 + 40) object];
  id v4 = [WeakRetained activeDocument];
  id v5 = [v4 translationContext];

  if (v3 == v5)
  {
    id v6 = [*(id *)(a1 + 40) userInfo];
    id v7 = objc_msgSend(v6, "safari_stringForKey:", *MEMORY[0x1E4F99738]);
    if ([v7 length])
    {
      id v8 = [WeakRetained activeDocument];
      id v9 = [v8 translationContext];

      id v10 = [v9 availableTargetLocaleIdentifiers];
      if (([v9 hasStartedTranslating] & 1) == 0
        && [*(id *)(*(void *)(a1 + 32) + 24) count]
        && [v10 count] == 1)
      {
        id v11 = [v10 firstObject];
        if (v11)
        {
          v12 = [WeakRetained activeDocument];
          id v13 = [v12 translationContext];
          v14[0] = MEMORY[0x1E4F143A8];
          v14[1] = 3221225472;
          v14[2] = __65___SFPageFormatMenuController__translationAvailabilityDidChange___block_invoke_2;
          v14[3] = &unk_1E5C72678;
          v14[4] = *(void *)(a1 + 32);
          [v13 validateTargetLocale:v11 completionHandler:v14];
        }
      }
    }
  }
}

void __65___SFPageFormatMenuController__translationAvailabilityDidChange___block_invoke_2(uint64_t a1, char a2)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __65___SFPageFormatMenuController__translationAvailabilityDidChange___block_invoke_3;
  v2[3] = &unk_1E5C72988;
  v2[4] = *(void *)(a1 + 32);
  char v3 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

void __65___SFPageFormatMenuController__translationAvailabilityDidChange___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 40);
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) firstObject];
  [v2 setEnabled:v1];
}

void __61___SFPageFormatMenuController__userFeedbackAutofillAlertItem__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 128));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61___SFPageFormatMenuController__userFeedbackAutofillAlertItem__block_invoke_2;
  v6[3] = &unk_1E5C76598;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v5 = v3;
  [WeakRetained collectDiagnosticsForAutoFillWithCompletionHandler:v6];
}

void __61___SFPageFormatMenuController__userFeedbackAutofillAlertItem__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (id *)(*(void *)(a1 + 32) + 128);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = [_SFAutoFillInternalFeedbackCollectionViewController alloc];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61___SFPageFormatMenuController__userFeedbackAutofillAlertItem__block_invoke_3;
  v15[3] = &unk_1E5C76570;
  id v7 = WeakRetained;
  id v16 = v7;
  id v8 = [(_SFAutoFillInternalFeedbackCollectionViewController *)v6 initWithDiagnosticsData:v4 reportHandler:v15];

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v8];
  [v9 setModalPresentationStyle:1];
  id v10 = [*(id *)(a1 + 40) presentingViewController];

  if (v10)
  {
    id v11 = [*(id *)(a1 + 40) presentingViewController];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __61___SFPageFormatMenuController__userFeedbackAutofillAlertItem__block_invoke_4;
    v12[3] = &unk_1E5C72238;
    id v13 = v7;
    id v14 = v9;
    [v11 dismissViewControllerAnimated:1 completion:v12];
  }
  else
  {
    [v7 presentModalViewController:v9 completion:0];
  }
}

void __61___SFPageFormatMenuController__userFeedbackAutofillAlertItem__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v7 = [v2 activeDocument];
  id v4 = [v7 activeWebView];
  id v5 = [v4 window];
  id v6 = [v5 windowScene];
  [v6 openURL:v3 options:0 completionHandler:0];
}

uint64_t __61___SFPageFormatMenuController__userFeedbackAutofillAlertItem__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentModalViewController:*(void *)(a1 + 40) completion:0];
}

uint64_t __49___SFPageFormatMenuController__pageZoomAlertItem__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFocusedItem:");
}

uint64_t __55___SFPageFormatMenuController__readerTextSizeAlertItem__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFocusedItem:");
}

void __52___SFPageFormatMenuController__readerThemeAlertItem__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setReaderTheme:forAppearance:", objc_msgSend(a2, "selectedTheme"), objc_msgSend(*(id *)(a1 + 32), "currentAppearance"));
  id v3 = [MEMORY[0x1E4F98948] sharedLogger];
  objc_msgSend(v3, "_sf_didPerformFormatMenuAction:provenance:", 8, *(void *)(a1 + 40));
}

void __59___SFPageFormatMenuController__privateRelayToggleAlertItem__block_invoke(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 48))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = a2;
    id v5 = [v3 webView];
    id v6 = [v5 URL];
    id v7 = objc_msgSend(v6, "safari_highLevelDomain");

    id v8 = objc_alloc_init(MEMORY[0x1E4FB1418]);
    id v9 = objc_alloc(MEMORY[0x1E4F28E48]);
    id v10 = NSString;
    id v11 = _WBSLocalizedString();
    v12 = objc_msgSend(v10, "stringWithFormat:", v11, v7);
    id v13 = (void *)[v9 initWithString:v12];

    uint64_t v14 = *MEMORY[0x1E4FB12B0];
    id v15 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
    objc_msgSend(v13, "addAttribute:value:range:", v14, v15, 0, objc_msgSend(v13, "length"));

    [v8 _setAttributedTitle:v13];
    id v16 = NSString;
    v17 = _WBSLocalizedString();
    v18 = objc_msgSend(v16, "stringWithFormat:", v17, v7);
    [v8 setMessage:v18];

    [v8 setPreferredStyle:1];
    v19 = (void *)MEMORY[0x1E4FB1410];
    v20 = _WBSLocalizedString();
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __59___SFPageFormatMenuController__privateRelayToggleAlertItem__block_invoke_2;
    v29[3] = &unk_1E5C765E8;
    id v30 = *(id *)(a1 + 32);
    char v31 = *(unsigned char *)(a1 + 48);
    v21 = [v19 actionWithTitle:v20 style:0 handler:v29];
    [v8 addAction:v21];

    v22 = (void *)MEMORY[0x1E4FB1410];
    v23 = _WBSLocalizedString();
    v24 = [v22 actionWithTitle:v23 style:1 handler:0];
    [v8 addAction:v24];

    [v4 dismissViewControllerAnimated:1 completion:0];
    v25 = [*(id *)(a1 + 40) viewControllerToPresentFrom];
    [v25 presentViewController:v8 animated:1 completion:0];
  }
  else
  {
    id v26 = a2;
    [v26 dismissViewControllerAnimated:1 completion:0];

    v27 = *(void **)(a1 + 32);
    uint64_t v28 = *(unsigned __int8 *)(a1 + 48);
    [v27 reloadEnablingDowngradedPrivateRelay:v28];
  }
}

uint64_t __59___SFPageFormatMenuController__privateRelayToggleAlertItem__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadEnablingDowngradedPrivateRelay:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __62___SFPageFormatMenuController__contentBlockersToggleAlertItem__block_invoke(uint64_t a1, void *a2)
{
  [a2 dismissViewControllerAnimated:1 completion:0];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 40);

  return [v3 reloadDisablingContentBlockers:v4];
}

uint64_t __82___SFPageFormatMenuController__advancedPrivateBrowsingPrivacyProtectionsAlertItem__block_invoke(uint64_t a1, void *a2)
{
  [a2 dismissViewControllerAnimated:1 completion:0];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 40);

  return [v3 reloadDisablingAdvancedPrivateBrowsingPrivacyProtections:v4];
}

void __56___SFPageFormatMenuController__websiteSettingsAlertItem__block_invoke(uint64_t a1, void *a2)
{
  [a2 dismissViewControllerAnimated:1 completion:0];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 128));
  id v3 = [WeakRetained activeDocument];
  [v3 perSiteSettingsUIPresentSettings];
}

void __49___SFPageFormatMenuController__scribbleAlertItem__block_invoke(uint64_t a1, void *a2)
{
  [a2 dismissViewControllerAnimated:1 completion:0];
  id v3 = [*(id *)(a1 + 32) sfScribbleController];
  [v3 startScribbling];
}

void __51___SFPageFormatMenuController__clearEditsAlertItem__block_invoke(uint64_t a1, void *a2)
{
  [a2 dismissViewControllerAnimated:1 completion:0];
  id v3 = [*(id *)(a1 + 32) sfScribbleController];
  [v3 clearEdits];
}

void __55___SFPageFormatMenuController__reportScribbleIssueItem__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) _shouldLaunchFeedbackAppForScribble]
    && (objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults"),
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = objc_msgSend(v4, "safari_BOOLForKey:defaultValue:", *MEMORY[0x1E4F99630], 0),
        v4,
        (v5 & 1) == 0))
  {
    [v3 dismissViewControllerAnimated:1 completion:0];
    id v11 = [*(id *)(a1 + 40) sfScribbleController];
    v12 = [*(id *)(a1 + 40) webView];
    [v11 openFeedbackAppForScribbleReportForWebView:v12];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 128));
    id v7 = [[_SFReportScribbleIssueCollectionViewController alloc] initWithBrowserContentController:WeakRetained];
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v7];
    [v8 setModalPresentationStyle:1];
    id v9 = [v3 presentingViewController];

    if (v9)
    {
      id v10 = [v3 presentingViewController];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __55___SFPageFormatMenuController__reportScribbleIssueItem__block_invoke_2;
      v13[3] = &unk_1E5C72238;
      id v14 = WeakRetained;
      id v15 = v8;
      [v10 dismissViewControllerAnimated:1 completion:v13];
    }
    else
    {
      [WeakRetained presentModalViewController:v8 completion:0];
    }
  }
}

uint64_t __55___SFPageFormatMenuController__reportScribbleIssueItem__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentModalViewController:*(void *)(a1 + 40) completion:0];
}

void __57___SFPageFormatMenuController__manageExtensionsAlertItem__block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(*(void *)(a1 + 32) + 128);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = (void *)MEMORY[0x1E4F782D8];
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = [WeakRetained activeDocument];
  id v9 = [v6 createManageExtensionsNavigationControllerFromPageFormatMenu:v7 activeDocument:v8];

  [v9 setModalPresentationStyle:1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57___SFPageFormatMenuController__manageExtensionsAlertItem__block_invoke_2;
  v12[3] = &unk_1E5C72238;
  id v13 = WeakRetained;
  id v14 = v9;
  id v10 = v9;
  id v11 = WeakRetained;
  [v4 dismissViewControllerAnimated:1 completion:v12];
}

uint64_t __57___SFPageFormatMenuController__manageExtensionsAlertItem__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentModalViewController:*(void *)(a1 + 40) completion:0];
}

void __43___SFPageFormatMenuController__entityItems__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    char v5 = [WeakRetained viewController];
    [v5 dismissViewControllerAnimated:1 completion:0];

    if (objc_msgSend(v7, "_sf_canOpenInBrowser"))
    {
      id v6 = objc_loadWeakRetained(v4 + 16);
      [v6 handleSearchResult:v7];
    }
  }
}

uint64_t __50___SFPageFormatMenuController__makeItemForAction___block_invoke(uint64_t a1, void *a2)
{
  [a2 dismissViewControllerAnimated:1 completion:0];
  id v3 = *(void **)(a1 + 32);

  return [v3 addToFavorites];
}

uint64_t __50___SFPageFormatMenuController__makeItemForAction___block_invoke_2(uint64_t a1, void *a2)
{
  [a2 dismissViewControllerAnimated:1 completion:0];
  id v3 = *(void **)(a1 + 32);

  return [v3 togglePinningCurrentTab];
}

uint64_t __50___SFPageFormatMenuController__makeItemForAction___block_invoke_3(uint64_t a1, void *a2)
{
  [a2 dismissViewControllerAnimated:1 completion:0];
  id v3 = *(void **)(a1 + 32);

  return [v3 addToBookmarks:0];
}

uint64_t __50___SFPageFormatMenuController__makeItemForAction___block_invoke_4(uint64_t a1, void *a2)
{
  [a2 dismissViewControllerAnimated:1 completion:0];
  id v3 = *(void **)(a1 + 32);

  return [v3 addToReadingList:0];
}

void __50___SFPageFormatMenuController__makeItemForAction___block_invoke_5(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50___SFPageFormatMenuController__makeItemForAction___block_invoke_6;
  v3[3] = &unk_1E5C724D8;
  id v4 = *(id *)(a1 + 32);
  [a2 dismissViewControllerAnimated:1 completion:v3];
}

uint64_t __50___SFPageFormatMenuController__makeItemForAction___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) addToQuickNote];
}

void __50___SFPageFormatMenuController__makeItemForAction___block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained viewController];
  id v2 = [v1 presentingViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

void __50___SFPageFormatMenuController__makeItemForAction___block_invoke_9(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50___SFPageFormatMenuController__makeItemForAction___block_invoke_10;
  v3[3] = &unk_1E5C724D8;
  id v4 = *(id *)(a1 + 32);
  [a2 dismissViewControllerAnimated:1 completion:v3];
}

uint64_t __50___SFPageFormatMenuController__makeItemForAction___block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentPrintControllerForCurrentTab];
}

void __49___SFPageFormatMenuController__readerOptionsCard__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v2 = [WeakRetained viewController];
    [v2 dismissViewControllerAnimated:1 completion:0];

    id v3 = [v5 browserContentController];
    if ([v3 isShowingReader])
    {
      id v4 = [MEMORY[0x1E4F98948] sharedLogger];
      [v4 didToggleReaderSBA];

      [v3 toggleShowingReaderForUserAction];
    }

    id WeakRetained = v5;
  }
}

void __49___SFPageFormatMenuController__readerOptionsCard__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v2 = [WeakRetained viewController];
    [v2 dismissViewControllerAnimated:1 completion:0];

    id v3 = objc_loadWeakRetained(v4 + 16);
    [v3 siriReadThisMenuInvocation];

    id WeakRetained = v4;
  }
}

void __49___SFPageFormatMenuController__readerOptionsCard__block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = [MEMORY[0x1E4F78360] sharedPlaybackController];
    [v4 setNowPlayingContentIdentifier:v5];

    [WeakRetained _enableListenToPageButtonForCard:WeakRetained[11]];
  }
}

void __42___SFPageFormatMenuController__readerCard__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    id v3 = [WeakRetained viewController];
    [v3 dismissViewControllerAnimated:1 completion:0];

    id v4 = [v9 browserContentController];
    if (([v4 isShowingReader] & 1) == 0)
    {
      id v5 = [MEMORY[0x1E4F98948] sharedLogger];
      [v5 didToggleReaderSBA];

      if (*(void *)(a1 + 32))
      {
        id v6 = [MEMORY[0x1E4F98948] sharedLogger];
        [v6 didClickSummaryCardSBA];

        id v7 = [MEMORY[0x1E4F989B0] sharedManager];
        id v8 = [*(id *)(a1 + 40) webpageIdentifier];
        [v7 donateBrowsingAssistantUserInteractionDetectedWithWebPageID:v8 componentType:2 componentIdentifier:&unk_1EFBDED88 tableOfContentsArrayLength:0 tableOfContentsTextIndex:0 readerSectionExpanded:0];
      }
      [v4 toggleShowingReaderForUserAction];
    }

    id WeakRetained = v9;
  }
}

void __42___SFPageFormatMenuController__readerCard__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = [WeakRetained viewController];
    [v3 dismissViewControllerAnimated:1 completion:0];

    [*(id *)(a1 + 32) siriReadThisMenuInvocation];
    id WeakRetained = v4;
  }
}

void __42___SFPageFormatMenuController__readerCard__block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = [MEMORY[0x1E4F78360] sharedPlaybackController];
    [v4 setNowPlayingContentIdentifier:v5];

    [WeakRetained _enableListenToPageButtonForCard:WeakRetained[10]];
  }
}

void __42___SFPageFormatMenuController__readerCard__block_invoke_4(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v4 = [*(id *)(a1 + 32) cachedReaderArticleTitle];
    char v5 = [v4 isEqualToString:v7];

    if ((v5 & 1) == 0)
    {
      [*(id *)(a1 + 32) setCachedReaderArticleTitle:v7];
      if (([v7 isEqualToString:*(void *)(a1 + 40)] & 1) == 0)
      {
        id v6 = WeakRetained[10];
        [v6 setTitle:v7];
        [v6 notifyObserverCardDidUpdate];
      }
    }
  }
}

void __43___SFPageFormatMenuController__consentCard__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    [MEMORY[0x1E4F989E8] setUserConsentState:2];
    [WeakRetained _clearCachedCardItems];
    [WeakRetained reloadBrowsingAssistantIfNeeded];
  }
}

void __43___SFPageFormatMenuController__consentCard__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    [MEMORY[0x1E4F989E8] setUserConsentState:1];
    [WeakRetained _clearCachedCardItems];
    [WeakRetained reloadBrowsingAssistantIfNeeded];
  }
}

void __57___SFPageFormatMenuController_configureMainHeaderFooter___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setHintText:v7];
    if ([v6 isFocusedInPageMenu])
    {
      if (a3)
      {
        [v6 blink];
        [v6 pulse];
      }
    }
  }
}

void __57___SFPageFormatMenuController_configureMainHeaderFooter___block_invoke_2(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  if (WeakRetained)
  {
    id v2 = [MEMORY[0x1E4F98948] sharedLogger];
    [v2 didClickZoomOutSBA];

    [a1[4] decrementValue:WeakRetained];
    id v3 = objc_loadWeakRetained(a1 + 6);
    [v3 _didTapButtonInStepper:WeakRetained];
  }
}

void __57___SFPageFormatMenuController_configureMainHeaderFooter___block_invoke_3(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  if (WeakRetained)
  {
    id v2 = [MEMORY[0x1E4F98948] sharedLogger];
    [v2 didClickZoomInSBA];

    [a1[4] incrementValue:WeakRetained];
    id v3 = objc_loadWeakRetained(a1 + 6);
    [v3 _didTapButtonInStepper:WeakRetained];
  }
}

void __57___SFPageFormatMenuController_configureMainHeaderFooter___block_invoke_4(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F98948] sharedLogger];
  [v2 didClickFindInPageSBA];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained viewController];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57___SFPageFormatMenuController_configureMainHeaderFooter___block_invoke_5;
  v5[3] = &unk_1E5C724D8;
  id v6 = *(id *)(a1 + 32);
  [v4 dismissViewControllerAnimated:1 completion:v5];
}

uint64_t __57___SFPageFormatMenuController_configureMainHeaderFooter___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) showFindOnPage];
}

uint64_t __54___SFPageFormatMenuController__didTapButtonInStepper___block_invoke(void *a1)
{
  *(unsigned char *)(a1[4] + 120) = 0;
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = (void *)a1[5];
    uint64_t v4 = a1[6];
    return [v3 takeOwnershipOfStepperContainer:v4];
  }
  return result;
}

@end