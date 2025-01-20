@interface SFPageLoadErrorController
@end

@implementation SFPageLoadErrorController

uint64_t __39___SFPageLoadErrorController_addAlert___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = [*(id *)(a1 + 32) actionHandler];

  if (v4)
  {
    v5 = [*(id *)(a1 + 32) actionHandler];
    v5[2](v5, *(void *)(a1 + 32), a2);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  v6 = *(void **)(a1 + 40);

  return [v6 performAction:a2 forAlert:v7];
}

uint64_t __68___SFPageLoadErrorController_addFormAlertWithTitle_decisionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __85___SFPageLoadErrorController_showErrorPageWithTitle_bodyText_learnMoreLink_forError___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 16));
  uint64_t v2 = a1[5];
  v3 = [MEMORY[0x1E4F1CB10] URLWithString:@"data:text/html,"];
  [WeakRetained _loadAlternateHTMLString:v2 baseURL:v3 forUnreachableURL:a1[6]];
}

void __68___SFPageLoadErrorController__loadCertificateWarningPageForContext___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  v4 = [*(id *)(a1 + 56) failingURL];
  [WeakRetained _loadAlternateHTMLString:v2 baseURL:v3 forUnreachableURL:v4];
}

void __109___SFPageLoadErrorController__handleCertificateError_forURL_isMainFrame_recoveryAttempter_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 72))
  {
    [a2 timeIntervalSinceNow];
    v4 = v3;
    uint64_t v5 = [MEMORY[0x1E4F98A10] certificateWarningCannotBeBypassedForTrust:*(void *)(*(void *)(a1 + 32) + 40)];
    v6 = (void *)[MEMORY[0x1E4F98A10] certificateWarningCategoryForError:*(void *)(a1 + 40) trustIncludesRevokedCertificate:v5 clockSkew:*(double *)&v4];
    uint64_t v7 = (void *)[MEMORY[0x1E4F98A10] numberOfDaysBetweenCertificateValidityRangeAndNow:*(void *)(a1 + 48)];
    objc_initWeak(&location, *(id *)(a1 + 32));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __109___SFPageLoadErrorController__handleCertificateError_forURL_isMainFrame_recoveryAttempter_completionHandler___block_invoke_2;
    block[3] = &unk_1E5C72718;
    objc_copyWeak(v11, &location);
    v11[1] = v6;
    id v9 = *(id *)(a1 + 56);
    v11[2] = v7;
    v11[3] = v4;
    id v10 = *(id *)(a1 + 64);
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }
}

void __109___SFPageLoadErrorController__handleCertificateError_forURL_isMainFrame_recoveryAttempter_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v12 = WeakRetained;
    id v3 = objc_alloc(MEMORY[0x1E4F98A10]);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v6 = *(void *)(a1 + 64);
    id v7 = objc_loadWeakRetained(v12 + 2);
    v8 = [v7 backForwardList];
    id v9 = [v8 currentItem];
    id v10 = (void *)[v3 initWithWarningCategory:v5 failingURL:v4 numberOfDaysInvalid:v6 canGoBack:v9 != 0 clockSkew:*(double *)(a1 + 72)];

    [v12 _loadCertificateWarningPageForContext:v10];
    uint64_t v11 = *(void *)(a1 + 40);
    if (v11) {
      (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v11, 1);
    }

    id WeakRetained = v12;
  }
}

void __77___SFPageLoadErrorController__handleFrameLoadError_forURL_recoveryAttempter___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v3 = *(unsigned char **)(a1 + 32);
    if (v3[112])
    {
      [v3 clearFailedRequest];
      *(unsigned char *)(*(void *)(a1 + 32) + 112) = 0;
    }
    else
    {
      if (objc_msgSend(*(id *)(a1 + 40), "_web_errorIsInDomain:", *MEMORY[0x1E4F289A0])
        && (unint64_t)(*(void *)(a1 + 56) + 1009) <= 6)
      {
        unsigned int v4 = (0x61u >> (*(unsigned char *)(a1 + 56) - 15)) & 1;
      }
      else
      {
        unsigned int v4 = 0;
      }
      if (objc_msgSend(*(id *)(a1 + 40), "_web_errorIsInDomain:", @"WebKitServiceWorker")) {
        BOOL v5 = *(void *)(a1 + 56) == 0;
      }
      else {
        BOOL v5 = 0;
      }
      if ((v4 | v5) == 1)
      {
        uint64_t v6 = *(void **)(a1 + 32);
        id v7 = objc_msgSend(MEMORY[0x1E4F18DA8], "safari_nonAppInitiatedRequestWithURL:", *(void *)(a1 + 48));
        [v6 _setFailedRequest:v7];
      }
      v8 = WBS_LOG_CHANNEL_PREFIXPageLoading();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __77___SFPageLoadErrorController__handleFrameLoadError_forURL_recoveryAttempter___block_invoke_cold_1((id *)(a1 + 40), v8);
      }
      if (isDiffieHellmanError(*(void **)(a1 + 40))) {
        id v9 = @"https://support.apple.com/kb/HT204937";
      }
      else {
        id v9 = 0;
      }
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __77___SFPageLoadErrorController__handleFrameLoadError_forURL_recoveryAttempter___block_invoke_244;
      v19[3] = &unk_1E5C72768;
      id v10 = *(void **)(a1 + 40);
      v19[4] = *(void *)(a1 + 32);
      id v20 = v10;
      v21 = v9;
      uint64_t v11 = (void *)MEMORY[0x1AD0C36A0](v19);
      v13 = *(void **)(a1 + 32);
      v12 = *(void **)(a1 + 40);
      uint64_t v14 = *(void *)(a1 + 48);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __77___SFPageLoadErrorController__handleFrameLoadError_forURL_recoveryAttempter___block_invoke_2;
      v16[3] = &unk_1E5C72790;
      v16[4] = v13;
      id v17 = v12;
      id v18 = v11;
      id v15 = v11;
      [v13 _fetchSpecializedMessageForError:v17 URL:v14 completionHandler:v16];
    }
  }
}

void __77___SFPageLoadErrorController__handleFrameLoadError_forURL_recoveryAttempter___block_invoke_244(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  id v6 = [v3 _titleForError:v4];
  [*(id *)(a1 + 32) showErrorPageWithTitle:v6 bodyText:v5 learnMoreLink:*(void *)(a1 + 48) forError:*(void *)(a1 + 40)];
}

void __77___SFPageLoadErrorController__handleFrameLoadError_forURL_recoveryAttempter___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    id v3 = [*(id *)(a1 + 32) _genericMessageForError:*(void *)(a1 + 40)];
  }
  id v4 = v3;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __51___SFPageLoadErrorController_handleFrameLoadError___block_invoke(uint64_t a1)
{
  return attemptRecovery(*(void **)(a1 + 32));
}

uint64_t __61___SFPageLoadErrorController_handleSubframeCertificateError___block_invoke(uint64_t a1)
{
  return attemptRecovery(*(void **)(a1 + 32));
}

void __100___SFPageLoadErrorController_handleLegacyTLSWithFailingURL_clickThroughURL_authenticationChallenge___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F98A10]);
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = objc_loadWeakRetained(WeakRetained + 2);
    id v5 = [v4 backForwardList];
    id v6 = [v5 currentItem];
    uint64_t v7 = [v2 initLegacyTLSWarningWithFailingURL:v3 canGoBack:v6 != 0];
    id v8 = WeakRetained[6];
    WeakRetained[6] = (id)v7;

    objc_storeStrong(WeakRetained + 12, *(id *)(a1 + 40));
    [WeakRetained _loadCertificateWarningPageForContext:WeakRetained[6]];
  }
}

void __50___SFPageLoadErrorController_visitInsecureWebsite__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F98A08] sharedManager];
  [v2 rememberCertificateBypassForProtectionSpace:*(void *)(*(void *)(a1 + 32) + 152) inPrivateBrowsing:0];

  [*(id *)(a1 + 32) _continueAfterCertificateAlertWithURL:*(void *)(*(void *)(a1 + 32) + 88) trust:*(void *)(*(void *)(a1 + 32) + 40) recoveryAttempter:*(void *)(*(void *)(a1 + 32) + 80)];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 152);
  *(void *)(v3 + 152) = 0;
}

void __77___SFPageLoadErrorController__handleFrameLoadError_forURL_recoveryAttempter___block_invoke_cold_1(id *a1, void *a2)
{
  id v3 = *a1;
  id v4 = a2;
  id v5 = objc_msgSend(v3, "safari_privacyPreservingDescription");
  id v6 = [*a1 userInfo];
  v12 = [v6 objectForKeyedSubscript:@"networkTaskDescription"];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(v7, v8, v9, v10, v11, 0x16u);
}

@end