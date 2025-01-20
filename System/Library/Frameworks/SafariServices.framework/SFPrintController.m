@interface SFPrintController
@end

@implementation SFPrintController

void __89___SFPrintController__preparePrintInteractionControllerForUsage_onlyIfLoaded_completion___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      id v5 = WeakRetained;
      [WeakRetained _preparePrintInteractionControllerForUsage:*(void *)(a1 + 48) onlyIfLoaded:0 completion:*(void *)(a1 + 32)];
      id WeakRetained = v5;
    }
  }
  else
  {
    v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
}

void __89___SFPrintController__preparePrintInteractionControllerForUsage_onlyIfLoaded_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  [*(id *)(a1 + 32) setURLString:*(void *)(*(void *)(a1 + 40) + 24)];
  if ([*(id *)(a1 + 48) _isDisplayingPDF])
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 104), "setDelegate:");
    [*(id *)(*(void *)(a1 + 40) + 104) setPrintPageRenderer:0];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 72));
    v4 = [WeakRetained _dataForDisplayedPDF];
    [*(id *)(*(void *)(a1 + 40) + 104) setPrintingItem:v4];

LABEL_6:
    [*(id *)(*(void *)(a1 + 40) + 104) setShowsPaperSelectionForLoadedPapers:1];
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 104), "setIsContentManaged:", objc_msgSend(*(id *)(a1 + 40), "_isContentManaged"));
    v6 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    goto LABEL_9;
  }
  if (*(unsigned char *)(a1 + 80))
  {
    id v5 = [*(id *)(a1 + 56) readerWebView];
    id WeakRetained = [v5 _webViewPrintFormatter];

    if (WeakRetained)
    {
LABEL_5:
      [*(id *)(*(void *)(a1 + 40) + 104) setDelegate:*(void *)(a1 + 32)];
      [*(id *)(*(void *)(a1 + 40) + 104) setPrintPageRenderer:*(void *)(a1 + 32)];
      [WeakRetained setFrameToPrint:v7];
      [*(id *)(a1 + 32) setContentFormatter:WeakRetained];
      [WeakRetained setSnapshotFirstPage:*(void *)(a1 + 72) == 2];
      goto LABEL_6;
    }
  }
  else
  {
    id WeakRetained = [*(id *)(a1 + 48) _webViewPrintFormatter];
    if (WeakRetained) {
      goto LABEL_5;
    }
  }
  v6 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
LABEL_9:
  v6();
}

void __39___SFPrintController__printCurrentItem__block_invoke(uint64_t a1, char a2)
{
  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    v4 = (void *)v3[13];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __39___SFPrintController__printCurrentItem__block_invoke_2;
    v5[3] = &unk_1E5C73898;
    objc_copyWeak(&v6, (id *)(a1 + 40));
    if ([v4 presentAnimated:1 completionHandler:v5]) {
      *(unsigned char *)(*(void *)(a1 + 32) + 64) = 1;
    }
    objc_destroyWeak(&v6);
  }
  else
  {
    [v3 _didFinishPrintingCurrentItemWithResult:2 fromPrintInteractionControllerCompletion:0];
  }
}

void __39___SFPrintController__printCurrentItem__block_invoke_2(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[64] = 0;
    uint64_t v7 = 1;
    if (!a4) {
      uint64_t v7 = 2;
    }
    if (a3) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = v7;
    }
    v9 = WeakRetained;
    [WeakRetained _didFinishPrintingCurrentItemWithResult:v8 fromPrintInteractionControllerCompletion:1];
    id WeakRetained = v9;
  }
}

void __103___SFPrintController__didFinishPrintingCurrentItemWithResult_fromPrintInteractionControllerCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleNextPrintRequest];
}

uint64_t __103___SFPrintController__didFinishPrintingCurrentItemWithResult_fromPrintInteractionControllerCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) completeWithResult:*(void *)(a1 + 48)];
  v2 = *(void **)(a1 + 40);

  return [v2 handleNextPrintRequest];
}

void __56___SFPrintController_getPDFDataForUsage_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  if (!*(unsigned char *)(v4 + 24))
  {
    *(unsigned char *)(v4 + 24) = 1;
    if (*(unsigned char *)(a1 + 56)) {
      [*(id *)(a1 + 32) printInteractionControllerDidFinish];
    }
    id v5 = WBS_LOG_CHANNEL_PREFIXPrinting();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v5;
      int v7 = 134217984;
      uint64_t v8 = [v3 length];
      _os_log_impl(&dword_1A690B000, v6, OS_LOG_TYPE_DEFAULT, "Finished generating PDF data of length %zu", (uint8_t *)&v7, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __56___SFPrintController_getPDFDataForUsage_withCompletion___block_invoke_28(uint64_t a1, char a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
    uint64_t v4 = WeakRetained;
    if (*(void *)(a1 + 48) == 3 && ([WeakRetained _isDisplayingPDF] & 1) == 0)
    {
      id v9 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 96));
      if ([v9 printControllerShouldPrintReader:*(void *)(a1 + 32)])
      {
        id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
        id v7 = [v10 readerWebView];
      }
      else
      {
        id v7 = v4;
      }

      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __56___SFPrintController_getPDFDataForUsage_withCompletion___block_invoke_29;
      v13[3] = &unk_1E5C73938;
      id v14 = *(id *)(a1 + 40);
      [v7 createPDFWithConfiguration:0 completionHandler:v13];
    }
    else
    {
      [*(id *)(*(void *)(a1 + 32) + 104) _setupPrintPanel:0];
      id v5 = *(void **)(*(void *)(a1 + 32) + 104);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __56___SFPrintController_getPDFDataForUsage_withCompletion___block_invoke_31;
      v11[3] = &unk_1E5C73988;
      id v6 = *(id *)(a1 + 40);
      v11[4] = *(void *)(a1 + 32);
      id v12 = v6;
      [v5 _generatePrintPreview:v11];
      id v7 = v12;
    }
  }
  else
  {
    uint64_t v8 = WBS_LOG_CHANNEL_PREFIXPrinting();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A690B000, v8, OS_LOG_TYPE_DEFAULT, "Printing isn't currently allowed, so returning nil PDF data", buf, 2u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __56___SFPrintController_getPDFDataForUsage_withCompletion___block_invoke_29(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v9 = WBS_LOG_CHANNEL_PREFIXPrinting();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __56___SFPrintController_getPDFDataForUsage_withCompletion___block_invoke_29_cold_1(v9, v7, v5);
    }
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v8();
}

void __56___SFPrintController_getPDFDataForUsage_withCompletion___block_invoke_31(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56___SFPrintController_getPDFDataForUsage_withCompletion___block_invoke_2;
  block[3] = &unk_1E5C73960;
  id v7 = v3;
  id v4 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __56___SFPrintController_getPDFDataForUsage_withCompletion___block_invoke_2(void *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  uint64_t v3 = a1[4];
  id v16 = 0;
  id v4 = (void *)[v2 initWithContentsOfURL:v3 options:1 error:&v16];
  id v5 = v16;
  id v6 = WBS_LOG_CHANNEL_PREFIXPrinting();
  id v7 = v6;
  if (v5) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v4 == 0;
  }
  if (v8)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v9 = v7;
      id v10 = objc_msgSend(v5, "safari_privacyPreservingDescription");
      uint64_t v11 = [v4 length];
      uint64_t v12 = a1[4];
      *(_DWORD *)buf = 138543875;
      uint64_t v18 = (uint64_t)v10;
      __int16 v19 = 2048;
      uint64_t v20 = v11;
      __int16 v21 = 2113;
      uint64_t v22 = v12;
      _os_log_error_impl(&dword_1A690B000, v9, OS_LOG_TYPE_ERROR, "Failed to generate PDF data: %{public}@; PDF data length: %zu; PDF URL: %{private}@",
        buf,
        0x20u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v14 = v7;
    uint64_t v15 = [v4 length];
    *(_DWORD *)buf = 134217984;
    uint64_t v18 = v15;
    _os_log_impl(&dword_1A690B000, v14, OS_LOG_TYPE_INFO, "Successfully generated PDF data of length %zu", buf, 0xCu);
  }
  (*(void (**)(void))(a1[6] + 16))();
  [*(id *)(a1[5] + 104) _cleanPrintState];
}

uint64_t __56___SFPrintController_getPDFDataForUsage_withCompletion___block_invoke_34(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v2 = WBS_LOG_CHANNEL_PREFIXPrinting();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __56___SFPrintController_getPDFDataForUsage_withCompletion___block_invoke_34_cold_1(v2);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __44___SFPrintController_handleNextPrintRequest__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    if (a2) {
      [WeakRetained _printCurrentItem];
    }
    else {
      [WeakRetained _didFinishPrintingCurrentItemWithResult:2 fromPrintInteractionControllerCompletion:0];
    }
    id WeakRetained = v4;
  }
}

void __56___SFPrintController_getPDFDataForUsage_withCompletion___block_invoke_29_cold_1(void *a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v7 = 138543618;
  BOOL v8 = v6;
  __int16 v9 = 2048;
  uint64_t v10 = [a3 length];
  _os_log_error_impl(&dword_1A690B000, v5, OS_LOG_TYPE_ERROR, "Failed to generate PDF data: %{public}@; PDF data length: %zu",
    (uint8_t *)&v7,
    0x16u);
}

void __56___SFPrintController_getPDFDataForUsage_withCompletion___block_invoke_34_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A690B000, log, OS_LOG_TYPE_ERROR, "PDF generation took too long, early returning with nil data", v1, 2u);
}

@end