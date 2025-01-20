@interface SFReaderController
@end

@implementation SFReaderController

void __65___SFReaderController_prepareReaderPrintingIFrameWithCompletion___block_invoke(uint64_t a1, int a2)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (a2)
  {
    v5 = [WeakRetained readerControllerProxy];
    [v5 prepareReaderContentForPrinting];
  }
  else
  {
    if (WeakRetained)
    {
      v6 = (void *)WeakRetained[6];
      WeakRetained[6] = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __65___SFReaderController_setUpReaderWebViewIfNeededAndPerformBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __65___SFReaderController_collectReaderContentForMailWithCompletion___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _collectReaderContentForMailWithCompletion:*(void *)(a1 + 32)];
  }
  else
  {
    v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v3();
  }
}

void __44___SFReaderController_setReaderLanguageTag___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  v3 = [WeakRetained possibleFonts];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    v6 = (id *)(a1 + 40);
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __44___SFReaderController_setReaderLanguageTag___block_invoke_2;
        v9[3] = &unk_1E5C73B70;
        objc_copyWeak(&v10, v6);
        v9[4] = v8;
        [v8 isInstalledWithCompletionHandler:v9];
        objc_destroyWeak(&v10);
        ++v7;
      }
      while (v4 != v7);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

void __44___SFReaderController_setReaderLanguageTag___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __44___SFReaderController_setReaderLanguageTag___block_invoke_3;
    v3[3] = &unk_1E5C72DE0;
    objc_copyWeak(&v4, (id *)(a1 + 40));
    v3[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], v3);
    objc_destroyWeak(&v4);
  }
}

void __44___SFReaderController_setReaderLanguageTag___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [*(id *)(a1 + 32) familyName];
  [WeakRetained activateFont:v2];
}

uint64_t __70___SFReaderController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isEqualToString:*MEMORY[0x1E4F78940]];
  if (result)
  {
    v3 = *(void **)(a1 + 40);
    return [v3 _updateJavaScriptEnabled];
  }
  return result;
}

@end